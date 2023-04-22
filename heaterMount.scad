$fn=100;


baseplate_x=80;
baseplate_y=120;
baseplate_z=2.5;
baseplate_r=40;

exhaustDia=29;//25.4;//1.25*25.4;//25.4;
exhaustSpacing=57;

boltHolt_Dia=7;
boltHolt_Spacing=44;
boltHole_y_spacing=55;

boltHoleStart_y= 26.5;

fuelOffset_y=8.5;
fuelOffset_x=10;

wire_offset_y=54;

translate([0,0,-10]) rotate([0,0,0])punch_guide();
template();





module template(){

//template
difference(){
translate([-baseplate_x/2,-baseplate_y/2,0])linear_extrude(baseplate_z)roundedPlate(baseplate_x,baseplate_y,baseplate_r);

//exhaust
    translate([0,-exhaustSpacing/2,-1])color([1,0,0])linear_extrude(baseplate_z+2)circle(exhaustDia/2);
//intake
    translate([0,exhaustSpacing/2,-1])color([1,0,0])linear_extrude(baseplate_z+2)circle(exhaustDia/2);

//intake bolts
    translate([boltHolt_Spacing/2,boltHoleStart_y,-1])color([0,1,0])linear_extrude(baseplate_z+4)circle(boltHolt_Dia/2);
translate([-boltHolt_Spacing/2,boltHoleStart_y,-1])color([0,1,0])linear_extrude(baseplate_z+4)circle(boltHolt_Dia/2);

//exhaust bolts
translate([boltHolt_Spacing/2,boltHoleStart_y-boltHole_y_spacing,-1])color([0,1,0])linear_extrude(baseplate_z+4)circle(boltHolt_Dia/2);
translate([-boltHolt_Spacing/2,boltHoleStart_y-boltHole_y_spacing,-1])color([0,1,0])linear_extrude(baseplate_z+4)circle(boltHolt_Dia/2);

translate([fuelOffset_x,fuelOffset_y,-1])color([0,0,1])linear_extrude(baseplate_z+4)circle(boltHolt_Dia/2);
    
translate([0,wire_offset_y,-1])color([0,0,1])linear_extrude(baseplate_z+4)circle(boltHolt_Dia/2);

translate([-20,-22,baseplate_z-.51])rotate([0,0,90])linear_extrude(baseplate_z)text("DOWN");    
    
}
}
//end template


module punch_guide(){
//Center jig
centerHole_size = 1;
difference(){
translate([-baseplate_x/2,-baseplate_y/2,0])linear_extrude(baseplate_z)roundedPlate(baseplate_x,baseplate_y,baseplate_r);

translate([0,-exhaustSpacing/2,-1])color([1,0,0])centerHole();
translate([0,exhaustSpacing/2,-1])color([1,0,0])centerHole();

translate([boltHolt_Spacing/2,boltHoleStart_y,-1])color([0,1,0])centerHole();
translate([-boltHolt_Spacing/2,boltHoleStart_y,-1])color([0,1,0])centerHole();

translate([boltHolt_Spacing/2,boltHoleStart_y-boltHole_y_spacing,-1])color([0,1,0])centerHole();
translate([-boltHolt_Spacing/2,boltHoleStart_y-boltHole_y_spacing,-1])color([0,1,0])centerHole();

translate([fuelOffset_x,fuelOffset_y,-1])centerHole();
    
translate([0,wire_offset_y,-1.3])centerHole();

translate([-20,10,baseplate_z-1.3])rotate([0,180,90])linear_extrude(baseplate_z)text("UP");    
translate([-5,-25,baseplate_z-1.3])rotate([0,180,90])linear_extrude(baseplate_z)scale([.3,.3])text(str("Exhaust ",exhaustDia," mm"));  

translate([-5,35,baseplate_z-1.3])rotate([0,180,90])linear_extrude(baseplate_z)scale([.3,.3])text(str("Intake ",exhaustDia," mm"));      
    
translate([5,16,baseplate_z-1.3])rotate([0,180,90])linear_extrude(baseplate_z)scale([.3,.3])text(str("Fuel ",boltHolt_Dia," mm"));      

translate([17,-20,baseplate_z-1.3])rotate([0,180,90])linear_extrude(baseplate_z)scale([.3,.3])text(str("Stud ",boltHolt_Dia," mm"));  

translate([7,55,baseplate_z-1.3])rotate([0,180,90])linear_extrude(baseplate_z)scale([.3,.3])text(str("Elec ",boltHolt_Dia," mm")); 

}
//translate([-20,10,baseplate_z-1])rotate([0,180,90])linear_extrude(baseplate_z)text("UP");    
//translate([0,-exhaustSpacing/2,-4.4])color([1,0,0])cylinder($fn=10,h=15, r1=10, r2=0, center=true);


//end center jig
}

module centerHole(){
    translate([0,0,-3.2])cylinder($fn=10,h=15, r1=12, r2=0, center=true);
}

module roundedPlate(x,y,rad)
{
    hull(){
    translate([rad,rad,0])circle(rad);
    translate([x-rad,rad,0])circle(rad);
    translate([x-rad,y-rad,0])circle(rad);
    translate([rad,y-rad,0])circle(rad);
    }
}