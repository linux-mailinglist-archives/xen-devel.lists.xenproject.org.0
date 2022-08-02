Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E63587F2A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 17:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379392.612817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIu0e-0006xF-DC; Tue, 02 Aug 2022 15:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379392.612817; Tue, 02 Aug 2022 15:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIu0e-0006uU-9b; Tue, 02 Aug 2022 15:40:40 +0000
Received: by outflank-mailman (input) for mailman id 379392;
 Tue, 02 Aug 2022 15:40:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7Wv=YG=kolabnow.com=brunoce@srs-se1.protection.inumbo.net>)
 id 1oIu0c-0006uO-74
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 15:40:38 +0000
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73442e7f-1279-11ed-924f-1f966e50362f;
 Tue, 02 Aug 2022 17:40:35 +0200 (CEST)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 2376E15CD;
 Tue,  2 Aug 2022 17:40:35 +0200 (CEST)
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IlgK23w9WXhl; Tue,  2 Aug 2022 17:40:34 +0200 (CEST)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
 by mx.kolabnow.com (Postfix) with ESMTPS id 4564D1238;
 Tue,  2 Aug 2022 17:40:33 +0200 (CEST)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
 by int-mx001.mykolab.com (Postfix) with ESMTPS id 08815C90;
 Tue,  2 Aug 2022 17:40:32 +0200 (CEST)
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
X-Inumbo-ID: 73442e7f-1279-11ed-924f-1f966e50362f
Authentication-Results: ext-mx-out002.mykolab.com (amavisd-new);
	dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
	header.d=kolabnow.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
	in-reply-to:references:message-id:date:date:subject:subject
	:mime-version:from:from:content-transfer-encoding:content-type
	:content-type:received:received:received; s=dkim20160331; t=
	1659454834; x=1661269235; bh=BzK2ni2SOuwHBVrQ7bWriy0yZoNQifLaZ0H
	XCLVJALs=; b=NcG3v/1aX3rQ8wWXD5OfMs9qBRdgJ8iTmDlXPT5aXGOpGDQTaEV
	eNQw8MmOvR2O7sF4JmMxhb6Kvf5qqLON6dxRdLvHp38mAnZ+ymE8E32GqNsrZtzI
	4x5s8Eq9fwYCLOrmtlRMuUH/U0mcBLtKxWeEA5hgNlYTiFZKtMvWpCaZTQhbOo/G
	W4+3NQocf3uhPQDvvn4fpZ0B4gVCzoXOeaHyCA6hMHIV1Fuc3xJ0+MdHsPW4CDuf
	CXGq0mizDlXMEkm5wQ8cckZSq/OBx35G+6Zl4I0d49BdiM055sAd0I6mMVJTL2RG
	x/8p8HdfyRbau7778WnXYVOCdqGcc7T7YrEpjxIp+GL0i+bTX8RqbVT90rbhaU8K
	ElUKbYSNWggPjV/72gvQcRQ0mwKxz+uJNR9Z8hbGobLzQYOW1Nq1Qa0PARAdt/A+
	M5LlVIq4NRFNalefOfy0DAnD7mfmfN1Y4z107PZoWuEBen9Fm+FSdxrBNZIdcA8I
	AEK+gjpHJwC7s/b4kAsFLH2rXto5eNTrzrXYRQy/aVgDuPAWbQpoN+hpPjnIziBp
	lC9Dkj5z17sh3LY6bCwTEEb8SDCMTBcDL+R3GIWtker2JRp8ERD0v5Wx0HQoeIqf
	RPrHijsCyPWj25chZmDONJEj1qAKHkJ4roHbjF+bXqEtK7zxTTeRxj4o=
X-Virus-Scanned: amavisd-new at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
X-Spam-Status: No, score=-1.898 tagged_above=-10 required=5
	tests=[BAYES_00=-1.9, HTML_MESSAGE=0.001, MIME_QP_LONG_LINE=0.001]
	autolearn=ham autolearn_force=no
Content-Type: multipart/alternative; boundary=Apple-Mail-4C64E5F7-1E6D-4E0A-9A55-F17C567C9368
Content-Transfer-Encoding: 7bit
From: Bruno <brunoce@kolabnow.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Acer Aspire 5 A517-52G - No firmware ACIP and no boot
Date: Tue, 2 Aug 2022 16:40:30 +0100
Message-Id: <B8D2151F-D58B-4443-8171-48623AB77595@kolabnow.com>
References: <87c86770-9244-dbad-23ba-d449b2c3ccb7@suse.com>
Cc: xen-devel@lists.xenproject.org
In-Reply-To: <87c86770-9244-dbad-23ba-d449b2c3ccb7@suse.com>
To: Jan Beulich <jbeulich@suse.com>


--Apple-Mail-4C64E5F7-1E6D-4E0A-9A55-F17C567C9368
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Jan.

Thank you.

I=E2=80=99m talking about booting on the host Xen (=E2=80=9CLinux with Xen=E2=
=80=9D) - goes to an initramfs prompt.

I don=E2=80=99t know how to get to this hypervisor log. Maybe not the case a=
s I am attempting the boot on the host linux with Xen. There is no /var/log -=
 only cache and lock

I can list the hard drive partitions under /dev (nvme0n1p1-5), but I cannot m=
ount them. I cannot access a thumb drive either /dev/block, when mounted has=
 two strange symlinks to ../sda1 (8:0 and 1:8). This is a bit frustrating be=
cause it does not allow me to export dmesg or other info.

Im not receiving the error messages on screen before initramfs, they are hid=
den, but I do get this message:

    Gave up waiting for suspend/resume device
     Gave up waiting for root file system device.  Common problems:
Boot args (cat /proc/cmdline) - Check rootdelay=3D (did the system wait long=
 enough?)
Missing modules (cat /proc/modules; ls /dev)
ALERT! UUID=3D0123abc does not exist. Dropping to a shell!

On the dmesg, I got the ACPI errors:

ACPI BIOS Error
(bug): Failure creating named ob
I_SB.PCOO.XHCI.RHUB.HS05._UPC], AE ALREADY _EXISTS (Z0211217/dsuloadZ-326)
ACPI Error: AE_ALREADY EXISTS, During name
slookun/catalog
-9451181 ACPI: Skipping parse of AML opcode: OpcodeNane unavailable
(20211217/psobject-z20)
(0x0014)

Repeated several times

ACPI: Skipping parse of AML opcode: DpcodeNane unavailable (0x0014)
API: 15 API AML tables successfully acquired and loaded
xen: registering
gsi 9 triggering 0 polarity 0

Latter on the dmesg I got repeated errors like this:

RIP: 0033:0x7 969a2e2=C3=A4c9
RSP: 002b:00007ffaff421a28 FLAGS: 00000246 RIG RAX: 0000000000000139
RAX: Efffffffffffffda RBX: 00005582Bb061d10 RCX: 00007 969aZeZ=C3=A4c9
244.4412241 RDX:000000000RSI: 000071969a49bfOd RDI: 00000000000000
RB: 0000000000020000 ROB: 0000000000000000 R09: 000055828b04c290
R10: 000000000000000c R11: 0000000000000246 R12: 00007f969a49bf=C2=AEd
R13: 000000GBOOOOOOOO R14: 000055B28b060aZO R15: 00005582Bb06110

(/TASK>
INFO: task systemd-udevd: 190 blocked for more than 120 seconds.

Tainted: G

DE
5.18.0-2-amd64 #1 Debian 5.18.5-1
"echo 0 =E2=80=BA proc/sys/kernel/hung_task_timeout_secs"
disables this nessage.
task: systend-udevd
state:D stack:
=C2=A9 pid: 190 ppid:
Call Trace:
164 flags: 0x00004004
(TASK)
schedule+0x30b/0x9e0

schedule+0x4e/Oxb0

do_init_module+0x1c3/0x260
do_sys_finit_module+Oxb4/0x120
do_sysca11_64+0x3B/Oxc0

=E2=80=94-

And here you have another output that can be relevant:

(initranfs) cat /proc/cndline
placeholder root=3DUUID=3D0123abcd ro quiet loglevel=3D3

(initranfs) cat /proc/modules
1915 3604480 2 - Live Oxffffffffc0540000
ahci 77824 1 - Live Oxffffffffc01d4000
hid generic 24576 1 - Live Oxffffffffc00b6000
nume 69632 1
- Live Oxffffffffc01bd000
libahci 49152 1 ahi, Live oxffffffffc019c000
=C3=A0rm_buddy 204B0 1 1915, Live oxffffffffc0020000
12c_algo_bit 16384 1 1915, Live Oxfffffffic000N00=C2=AE
nune_core 139264 1 nume, Live OxffffffP{c050/000
=C3=A0rm_p_helper 159744 1 1915, Live oxffffffffc04a8000
libata 385024 2 ahi,libahci, Live exffffffffc045b000
+10_pi 16384 1 nume_core, Live Oxfffffffic01c/000
cec 61440 2 1915,drm_dp_helper, Live Oxifffffffc0445000
rC_core 61440 1 cec,
Live Oxffffffffc01f0000
ttm86016 1 i915, Live Oxffffffffc042f000
scsi_mod 266240 1 libata, Live Oxffffffffc03dB000
=C3=A0rnkms_helper 192512 2 1915,drm_dp_helper, Live oxfffffffic0392000
crc64_rocksoft 204B0 1 t10_pi, Live oxfrIffffic0167000
crc64 204B0 1 crc64_rocksoft, Live Oxffffffffc01aa000
crc_t10dif 204B0 1 t10 pi, Live exfPffffficOOb0000
crct10dif_generic 16384 0 - Live Oxffffffffc00Bd000
scsi_common 16384 2 libata,scsi mod, Live OxffffffffcOOBBOOO
xhci_pci 204B0 0
- Live Oxffffffffc0050000
xhci_hcd 315392 1 xhei pci, Live Oxffffffffc0331000
crct10dif_pclmul 16384 1
- Live Oxffffffffc0162000
cret10d if_conmon 16384 3 crc_+10dif,crct10dif _generic,cret10dif pelnul, Li=
ve Oxffffffffc0071000
crc32c_intel 24576 0 - Live OxfrIPIfficO033000
intel_lpss_pci 28672 0 - Live Oxffffffffc0184000
=C2=A12c_hid_acpi 16384 =C2=A9 - Live Oxffffffffc017c000
r8168 589824 0 - Live Oxffffffffc00e3000 (DE)
12 mET 32788 9 128351 027, " VI UP SHAAFF-908 000.
intel_lpss 16384 1 intel_lpss pci, Live oxffffffffc00c6000
ush_ common 16384 2 xhci hed, usbcore, Live OxtffERFfEcOOba000
und 24576 =C2=A9 - Live Oxffffffffc00a0000
idma64 20480 =C2=A9 - Live oxffffffffc0097000
fan 204B0 0 -
=E2=80=A2 Live OxffffffffcO02d000
hid 151552 2 hid_generic, 12c hid, Live Oxffffffffc0059000
battery 28672 0 -
Live Oxffffffffc0048000
button 24576 =C2=A9 - Live Oxffffffffc0041000
uni 36864 0
- Live Oxffffffffc0014000
video 57344 1 i915, Live Oxffffffff:0000000

Thank you in advance.
Kind regards,

Bruno

> On 2 Aug 2022, at 16:15, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> =EF=BB=BFOn 02.08.2022 16:06, Bruno wrote:
>> I would like to report no compatible firmware for a new laptop Acer Aspir=
e 5 A517-52G.
>>=20
>> The firmware problem I witness is ACIP errors. Xen does not boot.
>>=20
>> These ACIP errors lead to boot into initramfs without mounting storage ca=
pabilities.
>>=20
>> There is extensive logs, dmesg and attempts I recently send to Xen-Users a=
nd got a lot of help and feedback there on a long thread of attempts, but we=
 have hit a lack of support at this point.
>>=20
>> https://lists.xenproject.org/archives/html/xen-users/2022-07/msg00061.htm=
l
>=20
> Can you please post relevant logs (and other information that may have bee=
n
> worked out already) here, rather than having everyone who reads this dig
> through a pretty long thread? Looking at the first few mails there I can
> spot a kernel log, but since you're complaining about Xen boot, I'm missin=
g
> the hypervisor log. Or are you talking about Linux not booting when run
> under Xen on that machine?
>=20
> I do see a fair number of ACPI errors in the kernel log - it would then be=

> helpful to have two logs for comparison, one when the kernel is booted
> natively and one when booted under Xen.
>=20
> Looking at the tail of that log I see an issue with sof-audio-pci, but I
> can't seem to be able to associate this with "does not boot". I guess
> information about this _might_ be found in the long xen-users thread, but
> as said above - please extract relevant information and put it on this
> list rather than having everyone go search.
>=20
> Regards, Jan
>=20

--Apple-Mail-4C64E5F7-1E6D-4E0A-9A55-F17C567C9368
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"></div><div dir=3D"ltr">Hel=
lo Jan.</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Thank you.</div><di=
v dir=3D"ltr"><br></div><div dir=3D"ltr">I=E2=80=99m talking about booting o=
n the host Xen (=E2=80=9CLinux with Xen=E2=80=9D) - goes to an initramfs pro=
mpt.</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">I don=E2=80=99t know h=
ow to get to this hypervisor log. Maybe not the case as I am attempting the b=
oot on the host linux with Xen. There is no /var/log - only cache and lock</=
div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><p class=3D"p3" style=3D"-we=
bkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-height:=
 normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2"=
>I can list the hard drive partitions under /dev (nvme0n1p1-5), but I cannot=
 mount them. I cannot access a thumb drive either /dev/block, when mounted h=
as two strange symlinks to ../sda1 (8:0 and 1:8). This is a bit frustrating b=
ecause it does not allow me to export dmesg or other info.</span></p><p clas=
s=3D"p2" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch:=
 normal; line-height: normal; min-height: 26px; caret-color: rgb(0, 0, 0); c=
olor: rgb(0, 0, 0);"><span class=3D"s2"></span><br></p><p class=3D"p3" style=
=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-=
height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=
=3D"s2">Im not receiving the error messages on screen before initramfs, they=
 are hidden, but I do get this message:</span></p><p class=3D"p2" style=3D"-=
webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-heigh=
t: normal; min-height: 26px; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);=
"><span class=3D"s2"></span><br></p><p class=3D"p3" style=3D"-webkit-text-si=
ze-adjust: auto; margin: 0px; font-stretch: normal; line-height: normal; car=
et-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">&nbsp; &nbs=
p;&nbsp;Gave up waiting for suspend/resume device</span></p><p class=3D"p3" s=
tyle=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; l=
ine-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span c=
lass=3D"s2">&nbsp;&nbsp; &nbsp;&nbsp;Gave up waiting for root file system de=
vice.&nbsp;&nbsp;Common problems:</span></p><ul class=3D"ul1" style=3D"-webk=
it-text-size-adjust: auto; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">=
<li class=3D"li3" style=3D"margin: 0px; font-stretch: normal; line-height: n=
ormal;"><span class=3D"s2">Boot args (cat /proc/cmdline) - Check rootdelay=3D=
 (did the system wait long enough?)</span></li><li class=3D"li3" style=3D"ma=
rgin: 0px; font-stretch: normal; line-height: normal;"><span class=3D"s2">Mi=
ssing modules (cat /proc/modules; ls /dev)</span></li></ul><p class=3D"p3" s=
tyle=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; l=
ine-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span c=
lass=3D"s2">ALERT! UUID=3D0123abc does not exist. Dropping to a shell!</span=
></p><p class=3D"p2" style=3D"-webkit-text-size-adjust: auto; margin: 0px; f=
ont-stretch: normal; line-height: normal; min-height: 26px; caret-color: rgb=
(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2"></span><br></p><p class=3D=
"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: nor=
mal; line-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><=
span class=3D"s2">On the dmesg, I got the ACPI errors:</span></p><p class=3D=
"p2" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: nor=
mal; line-height: normal; min-height: 26px; caret-color: rgb(0, 0, 0); color=
: rgb(0, 0, 0);"><span class=3D"s2"></span><br></p><p class=3D"p3" style=3D"=
-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-heig=
ht: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"=
s2">ACPI BIOS Error</span></p><p class=3D"p3" style=3D"-webkit-text-size-adj=
ust: auto; margin: 0px; font-stretch: normal; line-height: normal; caret-col=
or: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">(bug): Failure cr=
eating named ob</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust:=
 auto; margin: 0px; font-stretch: normal; line-height: normal; caret-color: r=
gb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">I_SB.PCOO.XHCI.RHUB.HS=
05._UPC], AE ALREADY _EXISTS (Z0211217/dsuloadZ-326)</span></p><p class=3D"p=
3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: norma=
l; line-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><sp=
an class=3D"s2">ACPI Error: AE_ALREADY EXISTS, During name</span></p><p clas=
s=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch:=
 normal; line-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0)=
;"><span class=3D"s2">slookun/catalog</span></p><p class=3D"p3" style=3D"-we=
bkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-height:=
 normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2"=
>-<span dir=3D"ltr">9451181</span>&nbsp;ACPI: Skipping parse of AML opcode: O=
pcodeNane unavailable</span></p><p class=3D"p3" style=3D"-webkit-text-size-a=
djust: auto; margin: 0px; font-stretch: normal; line-height: normal; caret-c=
olor: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">(20211217/psobj=
ect-z20)</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; m=
argin: 0px; font-stretch: normal; line-height: normal; caret-color: rgb(0, 0=
, 0); color: rgb(0, 0, 0);"><span class=3D"s2">(0x0014)</span></p><p class=3D=
"p2" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: nor=
mal; line-height: normal; min-height: 26px; caret-color: rgb(0, 0, 0); color=
: rgb(0, 0, 0);"><span class=3D"s2"></span><br></p><p class=3D"p3" style=3D"=
-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-heig=
ht: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"=
s2">Repeated several times</span></p><p class=3D"p2" style=3D"-webkit-text-s=
ize-adjust: auto; margin: 0px; font-stretch: normal; line-height: normal; mi=
n-height: 26px; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=
=3D"s2"></span><br></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: au=
to; margin: 0px; font-stretch: normal; line-height: normal; caret-color: rgb=
(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">ACPI: Skipping parse of A=
ML opcode: DpcodeNane unavailable (0x0014)</span></p><p class=3D"p3" style=3D=
"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-hei=
ght: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D=
"s2">API: 15 API AML tables successfully acquired and loaded</span></p><p cl=
ass=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretc=
h: normal; line-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0=
);"><span class=3D"s2">xen: registering</span></p><p class=3D"p3" style=3D"-=
webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-heigh=
t: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s=
2">gsi 9 triggering 0 polarity 0</span></p><p class=3D"p2" style=3D"-webkit-=
text-size-adjust: auto; margin: 0px; font-stretch: normal; line-height: norm=
al; min-height: 26px; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span=
 class=3D"s2"></span><br></p><p class=3D"p3" style=3D"-webkit-text-size-adju=
st: auto; margin: 0px; font-stretch: normal; line-height: normal; caret-colo=
r: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">Latter on the dmes=
g I got repeated errors like this:</span></p><p class=3D"p2" style=3D"-webki=
t-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-height: no=
rmal; min-height: 26px; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><sp=
an class=3D"s2"></span><br></p><p class=3D"p3" style=3D"-webkit-text-size-ad=
just: auto; margin: 0px; font-stretch: normal; line-height: normal; caret-co=
lor: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">RIP: 0033:0x7 96=
9a2e2=C3=A4c9</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: a=
uto; margin: 0px; font-stretch: normal; line-height: normal; caret-color: rg=
b(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">RSP: 002b:00007ffaff421=
a28 FLAGS: 00000246 RIG RAX: 0000000000000139</span></p><p class=3D"p3" styl=
e=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line=
-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span clas=
s=3D"s2">RAX: Efffffffffffffda RBX: 00005582Bb061d10 RCX: 00007 969aZeZ=C3=A4=
c9</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin=
: 0px; font-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0);=
 color: rgb(0, 0, 0);"><span class=3D"s2">244.4412241 RDX:<span dir=3D"ltr">=
000000000</span>RSI: 000071969a49bfOd RDI:&nbsp;<span dir=3D"ltr">0000000000=
0000</span></span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: aut=
o; margin: 0px; font-stretch: normal; line-height: normal; caret-color: rgb(=
0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">RB: 0000000000020000 ROB:=
 0000000000000000 R09: 000055828b04c290</span></p><p class=3D"p3" style=3D"-=
webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-heigh=
t: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s=
2">R10: 000000000000000c R11: 0000000000000246 R12: 00007f969a49bf=C2=AEd</s=
pan></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px=
; font-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0); colo=
r: rgb(0, 0, 0);"><span class=3D"s2">R13: 000000GBOOOOOOOO R14: 000055B28b06=
0aZO R15: 00005582Bb06110</span></p><p class=3D"p2" style=3D"-webkit-text-si=
ze-adjust: auto; margin: 0px; font-stretch: normal; line-height: normal; min=
-height: 26px; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D=
"s2"></span><br></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto;=
 margin: 0px; font-stretch: normal; line-height: normal; caret-color: rgb(0,=
 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">(/TASK&gt;</span></p><p cla=
ss=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch=
: normal; line-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0=
);"><span class=3D"s2">INFO: task systemd-udevd: 190 blocked for more than 1=
20 seconds.</span></p><p class=3D"p2" style=3D"-webkit-text-size-adjust: aut=
o; margin: 0px; font-stretch: normal; line-height: normal; min-height: 26px;=
 caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2"></span>=
<br></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px=
; font-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0); colo=
r: rgb(0, 0, 0);"><span class=3D"s2">Tainted: G</span></p><p class=3D"p2" st=
yle=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; li=
ne-height: normal; min-height: 26px; caret-color: rgb(0, 0, 0); color: rgb(0=
, 0, 0);"><span class=3D"s2"></span><br></p><p class=3D"p3" style=3D"-webkit=
-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-height: nor=
mal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">DE<=
/span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0=
px; font-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0); co=
lor: rgb(0, 0, 0);"><span class=3D"s2">5.18.0-2-amd64 #1 Debian 5.18.5-1</sp=
an></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px;=
 font-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0); color=
: rgb(0, 0, 0);"><span class=3D"s2">"echo 0 =E2=80=BA proc/sys/kernel/hung_t=
ask_timeout_secs"</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjus=
t: auto; margin: 0px; font-stretch: normal; line-height: normal; caret-color=
: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">disables this nessa=
ge.</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; margi=
n: 0px; font-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0)=
; color: rgb(0, 0, 0);"><span class=3D"s2">task: systend-udevd</span></p><p c=
lass=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stret=
ch: normal; line-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0,=
 0);"><span class=3D"s2">state:D stack:</span></p><p class=3D"p3" style=3D"-=
webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-heigh=
t: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s=
2">=C2=A9 pid: 190 ppid:</span></p><p class=3D"p3" style=3D"-webkit-text-siz=
e-adjust: auto; margin: 0px; font-stretch: normal; line-height: normal; care=
t-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">Call Trace:<=
/span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0=
px; font-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0); co=
lor: rgb(0, 0, 0);"><span class=3D"s2">164 flags: 0x00004004</span></p><p cl=
ass=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretc=
h: normal; line-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0=
);"><span class=3D"s2">(TASK)</span></p><p class=3D"p3" style=3D"-webkit-tex=
t-size-adjust: auto; margin: 0px; font-stretch: normal; line-height: normal;=
 caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">schedul=
e+0x30b/0x9e0</span></p><p class=3D"p2" style=3D"-webkit-text-size-adjust: a=
uto; margin: 0px; font-stretch: normal; line-height: normal; min-height: 26p=
x; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2"></spa=
n><br></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0=
px; font-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0); co=
lor: rgb(0, 0, 0);"><span class=3D"s2">schedule+0x4e/Oxb0</span></p><p class=
=3D"p2" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: n=
ormal; line-height: normal; min-height: 26px; caret-color: rgb(0, 0, 0); col=
or: rgb(0, 0, 0);"><span class=3D"s2"></span><br></p><p class=3D"p3" style=3D=
"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-hei=
ght: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D=
"s2">do_init_module+0x1c3/0x260</span></p><p class=3D"p3" style=3D"-webkit-t=
ext-size-adjust: auto; margin: 0px; font-stretch: normal; line-height: norma=
l; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">do_sy=
s_finit_module+Oxb4/0x120</span></p><p class=3D"p3" style=3D"-webkit-text-si=
ze-adjust: auto; margin: 0px; font-stretch: normal; line-height: normal; car=
et-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">do_sysca11_=
64+0x3B/Oxc0</span></p><p class=3D"p2" style=3D"-webkit-text-size-adjust: au=
to; margin: 0px; font-stretch: normal; line-height: normal; min-height: 26px=
; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2"></span=
><br></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0p=
x; font-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0); col=
or: rgb(0, 0, 0);"><span class=3D"s2">=E2=80=94-</span></p><p class=3D"p2" s=
tyle=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; l=
ine-height: normal; min-height: 26px; caret-color: rgb(0, 0, 0); color: rgb(=
0, 0, 0);"><span class=3D"s2"></span><br></p><p class=3D"p3" style=3D"-webki=
t-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-height: no=
rmal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">An=
d here you have another output that can be relevant:</span></p><p class=3D"p=
2" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: norma=
l; line-height: normal; min-height: 26px; caret-color: rgb(0, 0, 0); color: r=
gb(0, 0, 0);"><span class=3D"s2"></span><br></p><p class=3D"p3" style=3D"-we=
bkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-height:=
 normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2"=
>(initranfs) cat /proc/cndline</span></p><p class=3D"p3" style=3D"-webkit-te=
xt-size-adjust: auto; margin: 0px; font-stretch: normal; line-height: normal=
; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">placeh=
older root=3DUUID=3D0123abcd ro quiet loglevel=3D3</span></p><p class=3D"p3"=
 style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal;=
 line-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span=
 class=3D"s2"><br></span></p><p class=3D"p3" style=3D"-webkit-text-size-adju=
st: auto; margin: 0px; font-stretch: normal; line-height: normal; caret-colo=
r: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">(initranfs) cat /p=
roc/modules</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: aut=
o; margin: 0px; font-stretch: normal; line-height: normal; caret-color: rgb(=
0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2"><span dir=3D"ltr">1915 36=
04480 2</span>&nbsp;- Live Oxffffffffc0540000</span></p><p class=3D"p3" styl=
e=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line=
-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span clas=
s=3D"s2">ahci 77824 1 - Live Oxffffffffc01d4000</span></p><p class=3D"p3" st=
yle=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; li=
ne-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span cl=
ass=3D"s2">hid generic 24576 1 - Live Oxffffffffc00b6000</span></p><p class=3D=
"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: nor=
mal; line-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><=
span class=3D"s2">nume 69632 1</span></p><p class=3D"p3" style=3D"-webkit-te=
xt-size-adjust: auto; margin: 0px; font-stretch: normal; line-height: normal=
; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">- Live=
 Oxffffffffc01bd000</span></p><p class=3D"p3" style=3D"-webkit-text-size-adj=
ust: auto; margin: 0px; font-stretch: normal; line-height: normal; caret-col=
or: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">libahci 49152 1 a=
hi, Live oxffffffffc019c000</span></p><p class=3D"p3" style=3D"-webkit-text-=
size-adjust: auto; margin: 0px; font-stretch: normal; line-height: normal; c=
aret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">=C3=A0rm_=
buddy 204B0 1 1915, Live oxffffffffc0020000</span></p><p class=3D"p3" style=3D=
"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-hei=
ght: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D=
"s2">12c_algo_bit&nbsp;<span dir=3D"ltr">16384 1 1915</span>, Live Oxfffffff=
ic000N00=C2=AE</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: a=
uto; margin: 0px; font-stretch: normal; line-height: normal; caret-color: rg=
b(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">nune_core&nbsp;<span di=
r=3D"ltr">139264 1</span>&nbsp;nume, Live OxffffffP{c050/000</span></p><p cl=
ass=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretc=
h: normal; line-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0=
);"><span class=3D"s2">=C3=A0rm_p_helper&nbsp;<span dir=3D"ltr">159744 1 191=
5</span>, Live oxffffffffc04a8000</span></p><p class=3D"p3" style=3D"-webkit=
-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-height: nor=
mal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">lib=
ata&nbsp;<span dir=3D"ltr">385024 2</span>&nbsp;ahi,libahci, Live exffffffff=
c045b000</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; m=
argin: 0px; font-stretch: normal; line-height: normal; caret-color: rgb(0, 0=
, 0); color: rgb(0, 0, 0);"><span class=3D"s2">+10_pi 16384 1 nume_core, Liv=
e Oxfffffffic01c/000</span></p><p class=3D"p3" style=3D"-webkit-text-size-ad=
just: auto; margin: 0px; font-stretch: normal; line-height: normal; caret-co=
lor: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">cec&nbsp;<span d=
ir=3D"ltr">61440 2 1915</span>,drm_dp_helper, Live Oxifffffffc0445000</span>=
</p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; fo=
nt-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0); color: r=
gb(0, 0, 0);"><span class=3D"s2">rC_core 61440 1 cec,</span></p><p class=3D"=
p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: norm=
al; line-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><s=
pan class=3D"s2">Live Oxffffffffc01f0000</span></p><p class=3D"p3" style=3D"=
-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-heig=
ht: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"=
s2">ttm86016 1 i915, Live Oxffffffffc042f000</span></p><p class=3D"p3" style=
=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-=
height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=
=3D"s2">scsi_mod&nbsp;<span dir=3D"ltr">266240 1</span>&nbsp;libata, Live Ox=
ffffffffc03dB000</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust=
: auto; margin: 0px; font-stretch: normal; line-height: normal; caret-color:=
 rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">=C3=A0rnkms_helper&n=
bsp;<span dir=3D"ltr">192512 2 1915</span>,drm_dp_helper, Live oxfffffffic03=
92000</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; mar=
gin: 0px; font-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0=
); color: rgb(0, 0, 0);"><span class=3D"s2">crc64_rocksoft 204B0 1 t10_pi, L=
ive oxfrIffffic0167000</span></p><p class=3D"p3" style=3D"-webkit-text-size-=
adjust: auto; margin: 0px; font-stretch: normal; line-height: normal; caret-=
color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">crc64 204B0 1 c=
rc64_rocksoft, Live Oxffffffffc01aa000</span></p><p class=3D"p3" style=3D"-w=
ebkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-height=
: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2=
">crc_t10dif 204B0 1 t10 pi, Live exfPffffficOOb0000</span></p><p class=3D"p=
3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: norma=
l; line-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><sp=
an class=3D"s2">crct10dif_generic 16384 0 - Live Oxffffffffc00Bd000</span></=
p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font=
-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0); color: rgb=
(0, 0, 0);"><span class=3D"s2">scsi_common 16384 2 libata,scsi mod, Live Oxf=
fffffffcOOBBOOO</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust:=
 auto; margin: 0px; font-stretch: normal; line-height: normal; caret-color: r=
gb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">xhci_pci 204B0 0</span=
></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; f=
ont-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0); color: r=
gb(0, 0, 0);"><span class=3D"s2">- Live Oxffffffffc0050000</span></p><p clas=
s=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch:=
 normal; line-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0)=
;"><span class=3D"s2">xhci_hcd&nbsp;<span dir=3D"ltr">315392 1</span>&nbsp;x=
hei pci, Live Oxffffffffc0331000</span></p><p class=3D"p3" style=3D"-webkit-=
text-size-adjust: auto; margin: 0px; font-stretch: normal; line-height: norm=
al; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">crct=
10dif_pclmul 16384 1</span></p><p class=3D"p3" style=3D"-webkit-text-size-ad=
just: auto; margin: 0px; font-stretch: normal; line-height: normal; caret-co=
lor: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">- Live Oxfffffff=
fc0162000</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto;=
 margin: 0px; font-stretch: normal; line-height: normal; caret-color: rgb(0,=
 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">cret10d if_conmon 16384 3 c=
rc_+10dif,crct10dif _generic,cret10dif pelnul, Live Oxffffffffc0071000</span=
></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; f=
ont-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0); color: r=
gb(0, 0, 0);"><span class=3D"s2">crc32c_intel 24576 0 - Live OxfrIPIfficO033=
000</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; margi=
n: 0px; font-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0)=
; color: rgb(0, 0, 0);"><span class=3D"s2">intel_lpss_pci 28672 0 - Live Oxf=
fffffffc0184000</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust:=
 auto; margin: 0px; font-stretch: normal; line-height: normal; caret-color: r=
gb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">=C2=A12c_hid_acpi 1638=
4 =C2=A9 - Live Oxffffffffc017c000</span></p><p class=3D"p3" style=3D"-webki=
t-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-height: no=
rmal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">r8=
168&nbsp;<span dir=3D"ltr">589824 0</span>&nbsp;- Live Oxffffffffc00e3000 (D=
E)</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin=
: 0px; font-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0);=
 color: rgb(0, 0, 0);"><span class=3D"s2">12 mET&nbsp;<span dir=3D"ltr">3278=
8 9 128351</span>&nbsp;027, " VI UP SHAAFF-908 000.</span></p><p class=3D"p3=
" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal=
; line-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><spa=
n class=3D"s2">intel_lpss 16384 1 intel_lpss pci, Live oxffffffffc00c6000</s=
pan></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px=
; font-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0); colo=
r: rgb(0, 0, 0);"><span class=3D"s2">ush_ common 16384 2 xhci hed, usbcore, L=
ive OxtffERFfEcOOba000</span></p><p class=3D"p3" style=3D"-webkit-text-size-=
adjust: auto; margin: 0px; font-stretch: normal; line-height: normal; caret-=
color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">und 24576 =C2=A9=
 - Live Oxffffffffc00a0000</span></p><p class=3D"p3" style=3D"-webkit-text-s=
ize-adjust: auto; margin: 0px; font-stretch: normal; line-height: normal; ca=
ret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">idma64 204=
80 =C2=A9 - Live oxffffffffc0097000</span></p><p class=3D"p3" style=3D"-webk=
it-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-height: n=
ormal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">f=
an 204B0 0 -</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: au=
to; margin: 0px; font-stretch: normal; line-height: normal; caret-color: rgb=
(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">=E2=80=A2 Live Oxfffffff=
fcO02d000</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto;=
 margin: 0px; font-stretch: normal; line-height: normal; caret-color: rgb(0,=
 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">hid&nbsp;<span dir=3D"ltr">=
151552 2</span>&nbsp;hid_generic, 12c hid, Live Oxffffffffc0059000</span></p=
><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-=
stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0); color: rgb(=
0, 0, 0);"><span class=3D"s2">battery 28672 0 -</span></p><p class=3D"p3" st=
yle=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; li=
ne-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span cl=
ass=3D"s2">Live Oxffffffffc0048000</span></p><p class=3D"p3" style=3D"-webki=
t-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-height: no=
rmal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">bu=
tton 24576 =C2=A9 - Live Oxffffffffc0041000</span></p><p class=3D"p3" style=3D=
"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-hei=
ght: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D=
"s2">uni 36864 0</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust=
: auto; margin: 0px; font-stretch: normal; line-height: normal; caret-color:=
 rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2">- Live Oxffffffffc00=
14000</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: auto; mar=
gin: 0px; font-stretch: normal; line-height: normal; caret-color: rgb(0, 0, 0=
); color: rgb(0, 0, 0);"><span class=3D"s2">video 57344 1 i915, Live Oxfffff=
fff:0000000</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust: aut=
o; margin: 0px; font-stretch: normal; line-height: normal; caret-color: rgb(=
0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2"><br></span></p><p class=3D=
"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretch: nor=
mal; line-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><=
span class=3D"s2">Thank you in advance.</span></p><p class=3D"p3" style=3D"-=
webkit-text-size-adjust: auto; margin: 0px; font-stretch: normal; line-heigh=
t: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s=
2">Kind regards,</span></p><p class=3D"p3" style=3D"-webkit-text-size-adjust=
: auto; margin: 0px; font-stretch: normal; line-height: normal; caret-color:=
 rgb(0, 0, 0); color: rgb(0, 0, 0);"><span class=3D"s2"><br></span></p><p cl=
ass=3D"p3" style=3D"-webkit-text-size-adjust: auto; margin: 0px; font-stretc=
h: normal; line-height: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0=
);"><span class=3D"s2">Bruno</span></p></div><div dir=3D"ltr"><br><blockquot=
e type=3D"cite">On 2 Aug 2022, at 16:15, Jan Beulich &lt;jbeulich@suse.com&g=
t; wrote:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D"lt=
r">=EF=BB=BF<span>On 02.08.2022 16:06, Bruno wrote:</span><br><blockquote ty=
pe=3D"cite"><span>I would like to report no compatible firmware for a new la=
ptop Acer Aspire 5 A517-52G.</span><br></blockquote><blockquote type=3D"cite=
"><span></span><br></blockquote><blockquote type=3D"cite"><span>The firmware=
 problem I witness is ACIP errors. Xen does not boot.</span><br></blockquote=
><blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D=
"cite"><span>These ACIP errors lead to boot into initramfs without mounting s=
torage capabilities.</span><br></blockquote><blockquote type=3D"cite"><span>=
</span><br></blockquote><blockquote type=3D"cite"><span>There is extensive l=
ogs, dmesg and attempts I recently send to Xen-Users and got a lot of help a=
nd feedback there on a long thread of attempts, but we have hit a lack of su=
pport at this point.</span><br></blockquote><blockquote type=3D"cite"><span>=
</span><br></blockquote><blockquote type=3D"cite"><span>https://lists.xenpro=
ject.org/archives/html/xen-users/2022-07/msg00061.html</span><br></blockquot=
e><span></span><br><span>Can you please post relevant logs (and other inform=
ation that may have been</span><br><span>worked out already) here, rather th=
an having everyone who reads this dig</span><br><span>through a pretty long t=
hread? Looking at the first few mails there I can</span><br><span>spot a ker=
nel log, but since you're complaining about Xen boot, I'm missing</span><br>=
<span>the hypervisor log. Or are you talking about Linux not booting when ru=
n</span><br><span>under Xen on that machine?</span><br><span></span><br><spa=
n>I do see a fair number of ACPI errors in the kernel log - it would then be=
</span><br><span>helpful to have two logs for comparison, one when the kerne=
l is booted</span><br><span>natively and one when booted under Xen.</span><b=
r><span></span><br><span>Looking at the tail of that log I see an issue with=
 sof-audio-pci, but I</span><br><span>can't seem to be able to associate thi=
s with "does not boot". I guess</span><br><span>information about this _migh=
t_ be found in the long xen-users thread, but</span><br><span>as said above -=
 please extract relevant information and put it on this</span><br><span>list=
 rather than having everyone go search.</span><br><span></span><br><span>Reg=
ards, Jan</span><br><span></span><br></div></blockquote></body></html>=

--Apple-Mail-4C64E5F7-1E6D-4E0A-9A55-F17C567C9368--


