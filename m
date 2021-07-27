Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9CE3D789D
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 16:38:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161236.296062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8OCw-0000OG-6h; Tue, 27 Jul 2021 14:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161236.296062; Tue, 27 Jul 2021 14:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8OCw-0000L5-2h; Tue, 27 Jul 2021 14:37:22 +0000
Received: by outflank-mailman (input) for mailman id 161236;
 Tue, 27 Jul 2021 14:37:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c+Jp=MT=openhardware.de=luja@srs-us1.protection.inumbo.net>)
 id 1m8OCu-0000Kz-PD
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 14:37:20 +0000
Received: from mail.jaffe-engineering.com (unknown [178.254.25.135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0da7221a-cd29-4038-955b-3537d28f3c3e;
 Tue, 27 Jul 2021 14:37:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 054511E0FAD; Tue, 27 Jul 2021 16:36:59 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 0da7221a-cd29-4038-955b-3537d28f3c3e
From: "luja" <luja@openhardware.de>
In-Reply-To: <b5cce847-7304-d80c-66e2-a579763ea7fa@citrix.com>
Content-Type: multipart/alternative; boundary="----=_=-_OpenGroupware_org_NGMime-67-1627396619.108475-62------"
Date: Tue, 27 Jul 2021 16:36:59 +0200
Cc: =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, "xen-devel" <xen-devel@lists.xenproject.org>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
MIME-Version: 1.0
Message-ID: <43-61001a00-75-6ab37100@54781652>
Subject: =?utf-8?q?Re=3A?==?utf-8?q?_Xen-Error=3A?= Disabling IOMMU on Stepping C2 
 5520 Host-Bridge // SLH3P marking on die
User-Agent: SOGoMail 5.1.1
X-Last-TLS-Session-Version: None

------=_=-_OpenGroupware_org_NGMime-67-1627396619.108475-62------
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Length: 5323


Hi all,

No, the correct behavior is to just use the host bridge as it is correc=
t and works!
Just the PCI config space is done wrongly in the board's BIOS?

To get the truth...
I disassembled the cooler, cleaned the "phase change" wax from it,
photographed the laser engraving of the flip chip die and compared
the text with the errata "spec update" by Intel.

According to the laser marking and the errata the chip is a 5520 with C=
2
stepping. As it has an SLH3P marking on its die. I made a photo of it,
which is available on request.
The errata sheet refers it to C2 stepping and states it supports Intel
Trusted Execution TXT. This is on page 11 (3rd line of table) of said i=
ntel errata.
https://www.intel.com/content/dam/www/public/us/en/documents/specificat=
ion-updates/5520-and-5500-chipset-ioh-specification-update.pdf


So both Chipset errata #47, #53 mentioned in the code snippet
disabling the Vt-d feature, are not present in this hardware, so the Ho=
st bridge should=C2=A0
be kosher.

For some wired reason the PCI rev is 13.
I guess, that the ID is written by the bios using
pci config cycles at early boot into registers of the host bridge to
be then displayed using tools like lspci.
Page 11 of the errata:
"3. The Revision Number corresponds to bits 7:0 of the Revision ID Regi=
ster located at offset 08h in the PCI 
function 0 configuration space
"

But in general:
This is not Windows, so I would expect a kernel boot option
to just say "I ignore your warning, and when a black hole forms in my m=
ainboard
it is my fault" so force=5F5520=5FC2=3D1 or something like this should =
be appropriate.
So a small readme would advise the people who are affected by a fleaky =
implementation
of C2 Hostbridge to give it a try! So what should happen?!
Loose all your data on a freshly installed qubes-os?!
Oh, I forgot my hdd password, and forgot to write it under the keyboard=
 ;-) , so
I need to reinstall.
What is the difference. Computers should do what the user wants them to=
 do,
and when they break it is the fault of the user who ordered them to fai=
l.

So please add a kernel boot option to just go against this if-statement=
,
so only a warning is printed into the log but IOMMMU is not disabled:if=
 ( rev =3D=3D 0x13 && device =3D=3D 0x342e8086 ) 
{
if (force=5F5520=5FC2=3D=3D1)
{
printk(XENLOG=5FWARNING VTDPREFIX "NOT Disabling IOMMU as you requested=
 force=5F5520=5FC2=3D1 and ignoring Intel 5500/5520/X58 Chipset errata =
#47, #53\n"); 
}
else
{
printk(XENLOG=5FWARNING VTDPREFIX
"Disabling IOMMU due to Intel 5500/5520/X58 Chipset errata #47, #53\n")=
;
iommu=5Fenable =3D 0;
break; 
}
}

Cheers,

luja


Am Dienstag, Juli 27, 2021 14:21 CEST, schrieb Andrew Cooper <andrew.co=
oper3@citrix.com>:
=C2=A0On 25/07/2021 14:55, Marek Marczykowski-G=C3=B3recki wrote:
> On Sun, Jul 25, 2021 at 02:31:17PM +0200, luja wrote:
>> This Z600 is equipped with 0B54h mainboard as can be seen with dmi-d=
ecode.
>>
>> The manual states that 0B54h mainboard has the "newer C2 stepping",
>> so it is *not* affected by Intel "spec update" (nota bene: Intel upd=
ates the
>> spec, others report erratas) bugs =C2=A0
> The code above checks for rev 0x13, and the spec (page 11) clearly sa=
ys that rev
> 0x13 is stepping B-3. Stepping C-2 is rev 0x22. So, if this check
> triggers for you, I'm afraid you have the affected chipset.

The ID in hardware is the authoritative information.=C2=A0 Sounds like =
the
Z600 manual is wrong.

>> So the way Xen detects the "bug" (pci rev 13) is not sufficient, as =
my Z600
>> shows pci rev13 with lspci but 0xB54h (board rev only on Z600) with =
dmidecode
>> I would suggest first to have an override xen kernel boot option to =
disable the disablement in this code section. Or just patch this part o=
ut of the Xen code and rebuild xen. If this stuff really crashes, one w=
ill see it.
> Patching it out is out of the question, this check if there for a
> reason.

Using interrupt remapping on these systems does cause it to cease
functioning.

>> So please build a new xen without this stupid disablement or please =
add an override boot command for it.
>>
>> Please see the attached upgrade manual of Z600 and the errata "spec =
update" by Intel.
>> You see that the C2 stepping is not affected by the bugs refered to =
in the xen code,
>> so removing that section or adding better detection of the mask revi=
sion (B3 vs. C2)=C2=A0 of 5520 host bridge would allow=C2=A0 many users=
 to operate Qubes4.
> Maybe someone else has an alternative idea?

The logic in Xen is broken.=C2=A0 I've tried fixing it before for XenSe=
rver,
but was objected to, and the patch is still in the patchqueue.

The errata is with the Queued Invalidation, which (in Xen) is tied to
interrupt remapping.=C2=A0 The rest of the IOMMU works fine.

The current status quo is that if Xen boots with an Intel gen1 IOMMU, i=
t
will be happy with DMA remapping but no IRQ remapping.=C2=A0 If Xen boo=
ts on
this specific buggy system, it will turn the entire IOMMU off in
protest, which leaves the system less secure than booting on the
previous generation of hardware.

The correct behaviour is to just disable interrupt remapping in this
case, which brings Xen's behaviour in line with adjacent generations of=

hardware.

~Andrew
=C2=A0


=C2=A0

------=_=-_OpenGroupware_org_NGMime-67-1627396619.108475-62------
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Length: 6887

<html>Hi all,<br /><br />No, the correct behavior is to just use the ho=
st bridge as it is correct and works!<br />Just the PCI config space is=
 done wrongly in the board's BIOS?<br /><br />To get the truth...<br />=
I disassembled the cooler, cleaned the "phase change" wax from it,<br /=
>photographed the laser engraving of the flip chip die and compared<br =
/>the text with the errata "spec update" by Intel.<br /><br />According=
 to the laser marking and the errata the chip is a 5520 with C2<br />st=
epping. As it has an SLH3P marking on its die. I made a photo of it,<br=
 />which is available on request.<br />The errata sheet refers it to C2=
 stepping and states it supports Intel<br />Trusted Execution TXT. This=
 is on page 11 (3rd line of table) of said intel errata.<br />https://w=
ww.intel.com/content/dam/www/public/us/en/documents/specification-updat=
es/5520-and-5500-chipset-ioh-specification-update.pdf<br /><br /><br />=
So both Chipset errata #47, #53 mentioned in the code snippet<br />disa=
bling the Vt-d feature, are not present in this hardware, so the Host b=
ridge should&nbsp;<br />be kosher.<br /><br />For some wired reason the=
 PCI rev is 13.<br />I guess, that the ID is written by the bios using<=
br />pci config cycles at early boot into registers of the host bridge =
to<br />be then displayed using tools like lspci.<br />Page 11 of the e=
rrata:<br />"<span style=3D"left: 241.701px; top: 540.508px; font-size:=
 11.6px; font-family: sans-serif; transform: scaleX(1.05207);" role=3D"=
presentation" dir=3D"ltr">3.</span><span style=3D"left: 253.343px; top:=
 540.508px; font-size: 11.6px; font-family: sans-serif;" role=3D"presen=
tation" dir=3D"ltr"> </span><span style=3D"left: 291.723px; top: 540.50=
8px; font-size: 11.6px; font-family: sans-serif; transform: scaleX(1.00=
527);" role=3D"presentation" dir=3D"ltr">The Revision Number correspond=
s to bits 7:0 of the Revision ID Register located at offset 08h in the =
PCI </span><br role=3D"presentation" /><span style=3D"left: 291.7px; to=
p: 553.908px; font-size: 11.6px; font-family: sans-serif; transform: sc=
aleX(1.00292);" role=3D"presentation" dir=3D"ltr">function 0 configurat=
ion space<br />"</span><br /><br />But in general:<br />This is not Win=
dows, so I would expect a kernel boot option<br />to just say "I ignore=
 your warning, and when a black hole forms in my mainboard<br />it is m=
y fault" so force=5F5520=5FC2=3D1 or something like this should be appr=
opriate.<br />So a small readme would advise the people who are affecte=
d by a fleaky implementation<br />of C2 Hostbridge to give it a try! So=
 what should happen?!<br />Loose all your data on a freshly installed q=
ubes-os?!<br />Oh, I forgot my hdd password, and forgot to write it und=
er the keyboard ;-) , so<br />I need to reinstall.<br />What is the dif=
ference. Computers should do what the user wants them to do,<br />and w=
hen they break it is the fault of the user who ordered them to fail.<br=
 /><br />So please add a kernel boot option to just go against this if-=
statement,<br />so only a warning is printed into the log but IOMMMU is=
 not disabled:<pre class=3D"k9mail">if ( rev =3D=3D 0x13 &amp;&amp; dev=
ice =3D=3D 0x342e8086 ) 
{
if (force=5F5520=5FC2=3D=3D1)
{
printk(XENLOG=5FWARNING VTDPREFIX "NOT Disabling IOMMU as you requested=
 force=5F5520=5FC2=3D1 and ignoring Intel 5500/5520/X58 Chipset errata =
#47, #53\n"); 
}
else
{
printk(XENLOG=5FWARNING VTDPREFIX
"Disabling IOMMU due to Intel 5500/5520/X58 Chipset errata #47, #53\n")=
;
iommu=5Fenable =3D 0;
break; 
}
}</pre><br /><br />Cheers,<br /><br />luja<br /><br /><br />Am Dienstag=
, Juli 27, 2021 14:21 CEST, schrieb Andrew Cooper &lt;andrew.cooper3@ci=
trix.com&gt;:<br />&nbsp;<blockquote type=3D"cite" cite=3D"b5cce847-730=
4-d80c-66e2-a579763ea7fa@citrix.com">On 25/07/2021 14:55, Marek Marczyk=
owski-G=C3=B3recki wrote:<br />&gt; On Sun, Jul 25, 2021 at 02:31:17PM =
+0200, luja wrote:<br />&gt;&gt; This Z600 is equipped with 0B54h mainb=
oard as can be seen with dmi-decode.<br />&gt;&gt;<br />&gt;&gt; The ma=
nual states that 0B54h mainboard has the "newer C2 stepping",<br />&gt;=
&gt; so it is *not* affected by Intel "spec update" (nota bene: Intel u=
pdates the<br />&gt;&gt; spec, others report erratas) bugs &nbsp;<br />=
&gt; The code above checks for rev 0x13, and the spec (page 11) clearly=
 says that rev<br />&gt; 0x13 is stepping B-3. Stepping C-2 is rev 0x22=
. So, if this check<br />&gt; triggers for you, I'm afraid you have the=
 affected chipset.<br /><br />The ID in hardware is the authoritative i=
nformation.&nbsp; Sounds like the<br />Z600 manual is wrong.<br /><br /=
>&gt;&gt; So the way Xen detects the "bug" (pci rev 13) is not sufficie=
nt, as my Z600<br />&gt;&gt; shows pci rev13 with lspci but 0xB54h (boa=
rd rev only on Z600) with dmidecode<br />&gt;&gt; I would suggest first=
 to have an override xen kernel boot option to disable the disablement =
in this code section. Or just patch this part out of the Xen code and r=
ebuild xen. If this stuff really crashes, one will see it.<br />&gt; Pa=
tching it out is out of the question, this check if there for a<br />&g=
t; reason.<br /><br />Using interrupt remapping on these systems does c=
ause it to cease<br />functioning.<br /><br />&gt;&gt; So please build =
a new xen without this stupid disablement or please add an override boo=
t command for it.<br />&gt;&gt;<br />&gt;&gt; Please see the attached u=
pgrade manual of Z600 and the errata "spec update" by Intel.<br />&gt;&=
gt; You see that the C2 stepping is not affected by the bugs refered to=
 in the xen code,<br />&gt;&gt; so removing that section or adding bett=
er detection of the mask revision (B3 vs. C2)&nbsp; of 5520 host bridge=
 would allow&nbsp; many users to operate Qubes4.<br />&gt; Maybe someon=
e else has an alternative idea?<br /><br />The logic in Xen is broken.&=
nbsp; I've tried fixing it before for XenServer,<br />but was objected =
to, and the patch is still in the patchqueue.<br /><br />The errata is =
with the Queued Invalidation, which (in Xen) is tied to<br />interrupt =
remapping.&nbsp; The rest of the IOMMU works fine.<br /><br />The curre=
nt status quo is that if Xen boots with an Intel gen1 IOMMU, it<br />wi=
ll be happy with DMA remapping but no IRQ remapping.&nbsp; If Xen boots=
 on<br />this specific buggy system, it will turn the entire IOMMU off =
in<br />protest, which leaves the system less secure than booting on th=
e<br />previous generation of hardware.<br /><br />The correct behaviou=
r is to just disable interrupt remapping in this<br />case, which bring=
s Xen's behaviour in line with adjacent generations of<br />hardware.<b=
r /><br />~Andrew<br />&nbsp;</blockquote><br /><br /><br />&nbsp;</htm=
l>

------=_=-_OpenGroupware_org_NGMime-67-1627396619.108475-62--------


