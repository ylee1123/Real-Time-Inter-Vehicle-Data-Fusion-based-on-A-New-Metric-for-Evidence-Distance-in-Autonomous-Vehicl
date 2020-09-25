% Weighted DS using Jousselme distance
% num : number of belief vectors, in general, which is equal to the number
% of sensors
% bel : belief vector, 3 x num, [existence; non-existence; uncertainty]


function output=JWDSA(bel,num)

for i=1:num
    for j=1:num
        D(i,j)=Jdiscal(bel(:,i),bel(:,j));
    end
end

S0=1-D;
S=S0-eye(num);
SU=sum(S')';
W=SU./sum(SU);

for i=1:num
    B(:,i)=W(i)*bel(:,i);
end

WDS=sum(B')';

for i=2:num
    WDS=detectDS(WDS,WDS);
end

output=WDS;

end