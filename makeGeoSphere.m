clear; close all; clc;
fontSize=15;
faceAlpha=1;
edgeColor=0.2*ones(1,3);
edgeWidth=1.5;

%% 1. 정다면체 
cFigure; % Open figure for plotting
r=1; %sphere radius
solidTypes=1:5;
titleCell={'tetrahedron(정사면체)','cube(정육면체)','octahedron(정팔면체)','icosahedron(정이십면체)','dodecahedron(정십이면체)'};
pColors=gjet(numel(solidTypes));
for q=solidTypes
    [V,F]=platonic_solid(q,r);
    subplot(2,3,q); hold on;
    title([titleCell{q}],'FontSize',fontSize);
    gpatch(F,V,pColors(q,:),'k',0.8,2);
    axis off;
    camlight headlight;
    axisGeom(gca,fontSize);
end
drawnow;

%% 2. 정십이면체가 구에 가까워지기까지
n=5; %dodecahedron

cFigure; hold on;
[V,F]=platonic_solid(n,r);
subplot(1,3,1); hold on;
gpatch(F,V,'rw','r',1,1);
axis off;
plotV(V,'r.','MarkerSize',20);
camlight headlight;
axisGeom(gca,fontSize);

[Fi,Vi,~]=geoSphere(0,r,n);
subplot(1,3,3); hold on;
gpatch(Fi,Vi,'bw','k',1,1);
plotV(V,'r.','MarkerSize',20);
axis off;
camlight headlight;
axisGeom(gca,fontSize);

%dodecahedron and geoSphere layered
[V,F]=platonic_solid(n,r);
subplot(1,3,2); hold on;
gpatch(F,V,'rw','r',1,2);
axis off;
plotV(V,'r.','MarkerSize',20);
camlight headlight;
axisGeom(gca,fontSize);

[Fi,Vi,~]=geoSphere(0,r,n);
subplot(1,3,2); hold on;
gpatch(Fi,Vi,'none','k',0.5,1);
%plotV(Vi,'bw','MarkerSize',10);
axis off;
camlight headlight;
axisGeom(gca,fontSize);

%% 3. 정십이면체 구면분할
cFigure; hold on;
augLevel=0:3;
for q=augLevel
    [Fi,Vi,~]=geoSphere(q,r,n);
    subplot(1,4,q+1); hold on;
    title(strcat('정십이면체 구면분할 - ', num2str(q), '번 반복'),'FontSize',fontSize);
    gpatch(Fi,Vi,'bw','k',1,1);
    %plotV(Vi,'r.','MarkerSize',10);
    axis off;
    camlight headlight;
    axisGeom(gca,fontSize);
end
drawnow;

%% 4. 정이십면체 구면분할
cFigure; hold on;
r=2;
n=4;
augLevel=0:3;
for q=augLevel
    [Fi,Vi,~]=geoSphere(q,r,n);
    subplot(1,4,q+1); hold on;
    title(strcat('정이십면체 구면분할 - ', num2str(q), '번 반복'),'FontSize',fontSize);
    gpatch(Fi,Vi,'y','k',1,1);
    %plotV(Vi,'r.','MarkerSize',10);
    axis off;
    camlight headlight;
    axisGeom(gca,fontSize);
    
end
drawnow;

%% 5. 마름모 십이면체 구면분할
cFigure; hold on;

[F,V]=quadSphere(0,r,5);
subplot(1,3,1); hold on;
title(['마름모 십이면체 구면 분할 - 0번 반복'],'FontSize',fontSize);
hp=patch('Faces',F,'Vertices',V);
set(hp,'FaceColor','#77AC30','FaceAlpha',1,'lineWidth',edgeWidth,'edgeColor',edgeColor);
%camlight left;
camlight headlight;
set(gca,'FontSize',fontSize);
view(3); axis tight;  axis equal;  grid on;
axis off;

[F,V]=quadSphere(2,r,5);
subplot(1,3,2); hold on;
title(['마름모 십이면체 구면분할 - 1번 반복'],'FontSize',fontSize);
hp=patch('Faces',F,'Vertices',V);
set(hp,'FaceColor','#77AC30','FaceAlpha',faceAlpha,'lineWidth',edgeWidth,'edgeColor',edgeColor);
camlight headlight;
set(gca,'FontSize',fontSize);
view(3); axis tight;  axis equal;  grid on;
axis off;

[F,V]=quadSphere(3,r,5);
subplot(1,3,3); hold on;
title(['마름모 십이면체 구면분할 - 2번 반복'],'FontSize',fontSize);
hp=patch('Faces',F,'Vertices',V);
set(hp,'FaceColor','#77AC30','FaceAlpha',faceAlpha,'lineWidth',edgeWidth,'edgeColor',edgeColor);
camlight('headlight');
set(gca,'FontSize',fontSize);
view(3); axis tight;  axis equal;  grid on;
axis off;
