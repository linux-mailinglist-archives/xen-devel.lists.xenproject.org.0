Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F3A16F7F3
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 07:26:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6q4c-0006cU-EC; Wed, 26 Feb 2020 06:21:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Sq7e=4O=intel.com=farrah.chen@srs-us1.protection.inumbo.net>)
 id 1j6q4b-0006cP-MU
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 06:21:33 +0000
X-Inumbo-ID: 3a4d6744-5860-11ea-8cb6-bc764e2007e4
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a4d6744-5860-11ea-8cb6-bc764e2007e4;
 Wed, 26 Feb 2020 06:21:31 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 22:21:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,487,1574150400"; 
 d="txt'?scan'208,217";a="256211839"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga002.jf.intel.com with ESMTP; 25 Feb 2020 22:21:28 -0800
Received: from fmsmsx126.amr.corp.intel.com (10.18.125.43) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 25 Feb 2020 22:21:28 -0800
Received: from shsmsx106.ccr.corp.intel.com (10.239.4.159) by
 FMSMSX126.amr.corp.intel.com (10.18.125.43) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 25 Feb 2020 22:21:27 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX106.ccr.corp.intel.com ([169.254.10.225]) with mapi id 14.03.0439.000;
 Wed, 26 Feb 2020 14:21:25 +0800
From: "Chen, Farrah" <farrah.chen@intel.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [BUG]Nested virtualization, Xen on KVM, Xen cannot boot up as
 a guest of KVM
Thread-Index: AdXsatDXz1zIp/dtReyVbkFlTMsZiw==
Date: Wed, 26 Feb 2020 06:21:25 +0000
Message-ID: <1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54@SHSMSX104.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: multipart/mixed;
 boundary="_004_1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54SHSMSX104ccrcor_"
MIME-Version: 1.0
Subject: [Xen-devel] [BUG]Nested virtualization, Xen on KVM,
 Xen cannot boot up as a guest of KVM
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Hao, Xudong" <xudong.hao@intel.com>, "Gao, Chao" <chao.gao@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_004_1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54SHSMSX104ccrcor_
Content-Type: multipart/alternative;
	boundary="_000_1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54SHSMSX104ccrcor_"

--_000_1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54SHSMSX104ccrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Description:
Nested virtualization, take KVM host as L0, create guest on it, install Xen=
 on guest, then guest cannot boot up from Xen and keep rebooting.

Reproduce steps:
1. Enable KVM nested on host(L0)
rmmod kvm_intel
modprobe kvm_intel nested=3Dy
cat /sys/module/kvm_intel/parameters/nested
Y

2.Create L1 guest via qemu:
qemu-system-x86_64 -accel kvm -cpu host -drive file=3Drhel8.img,if=3Dnone,i=
d=3Dvirtio-disk0 -device virtio-blk-pci,drive=3Dvirtio-disk0 -m 7168 -smp 8=
 -monitor pty -cpu host -device virtio-net-pci,netdev=3Dnic0,mac=3D00:16:3e=
:72:5e:0a -netdev tap,id=3Dnic0,br=3Dvirbr0,helper=3D/usr/libexec/qemu-brid=
ge-helper,vhost=3Don -serial stdio

3. Build and install Xen on L1 guest

4. Reboot L1 and make it boot from Xen

Then L1 keep rebooting, full log attached.
......
(XEN) Running stub recovery selftests...
(XEN) traps.c:1590: GPF (0000): ffff82d0bfffe041 [ffff82d0bfffe041] -> ffff=
82d08038e40c
(XEN) traps.c:785: Trap 12: ffff82d0bfffe040 [ffff82d0bfffe040] -> ffff82d0=
8038e40c
(XEN) traps.c:1124: Trap 3: ffff82d0bfffe041 [ffff82d0bfffe041] -> ffff82d0=
8038e40c
(XEN) ----[ Xen-4.14-unstable  x86_64  debug=3Dy   Tainted:  C   ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d08043a8bc>] core2_vpmu_init+0xa5/0x221
(XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor
(XEN) rax: 0000000008300802   rbx: 0000000000000000   rcx: 0000000000000345
(XEN) rdx: 0000000000000004   rsi: 000000000000000a   rdi: 0000000000000063
(XEN) rbp: ffff82d0804b7d68   rsp: ffff82d0804b7d58   r8:  0000000000000004
(XEN) r9:  0000000000000008   r10: ffff82d0805effe0   r11: 0000000000000032
(XEN) r12: 0000000000000002   r13: 0000000000000008   r14: ffff82d0805dd0c0
(XEN) r15: ffff82d0805de300   cr0: 000000008005003b   cr4: 00000000003526e0
(XEN) cr3: 00000000bfca4000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d08043a8bc> (core2_vpmu_init+0xa5/0x221):
(XEN)  00 06 00 b9 45 03 00 00 <0f> 32 48 89 c1 48 c1 e9 0d 83 e1 01 88 0d =
32 00
(XEN) Xen stack trace from rsp=3Dffff82d0804b7d58:
(XEN)    ffff82d080452168 ffff82d080452248 ffff82d0804b7d78 ffff82d08043a62=
2
(XEN)    ffff82d0804b7d98 ffff82d08040dcb0 0000000000000008 000000000000000=
0
(XEN)    ffff82d0804b7ee8 ffff82d0804339db 0000000001fb4fff 00000000000001f=
6
(XEN)    ffff83000009de80 ffffffff00000000 000ffff82d0807f6 000000000000000=
2
(XEN)    0000000000000002 0000000000000002 0000000000000002 000000000000000=
2
(XEN)    0000000000000001 0000000000000001 0000000000100000 ffff82d08047ac0=
0
(XEN)    0000000000200000 ffff82d08047acdc 0000000100000008 000000000000000=
7
(XEN)    0000000001fb4000 0000000000000000 0000000000000007 ffff83000009dd2=
0
(XEN)    ffff83000009de80 ffff83000009dfb0 0000000000000000 000000000000000=
0
(XEN)    0000000400000000 0000000000000000 ffffffffffffffff 00000000fffffff=
f
(XEN)    0000000800000000 000000010000006e 0000000000000003 00000000000002f=
8
(XEN)    0000000000000002 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 ffff82d0802000e=
c
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000e01000000000 ffff8301f136e000 000000000000000=
0
(XEN) Xen call trace:
(XEN)    [<ffff82d08043a8bc>] R core2_vpmu_init+0xa5/0x221
(XEN)    [<ffff82d08043a622>] F arch/x86/cpu/vpmu.c#vpmu_init+0xc4/0x100
(XEN)    [<ffff82d08040dcb0>] F do_initcalls+0x35/0x44
(XEN)    [<ffff82d0804339db>] F __start_xen+0x22d7/0x2808
(XEN)    [<ffff82d0802000ec>] F __high_start+0x4c/0x4e
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) GENERAL PROTECTION FAULT
(XEN) [error_code=3D0000]
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...

Environment:
Host(L0):
KVM: https://git.kernel.org/pub/scm/virt/kvm/kvm.git/
Branch: next
Commit: ead68df94d248c80fdbae220ae5425eb5af2e753
Kernel version: 5.6.0_rc1
Qemu: https://git.qemu.org/git/qemu.git
Branch: master
Commit: 88e2b97aa3e369a454c9d8360afddc348070c708

Guest(L1):
Xen: https://xenbits.xen.org/git-http/xen.git
Branch: master
Commit: c47984aabead53918e5ba6d43cdb3f1467452739
Xen version: 4.14-unstable

Host OS(L0): Red Hat Enterprise Linux 8.1
Guest OS(L1): Red Hat Enterprise Linux 8.1


Thanks,
Fan


--_000_1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54SHSMSX104ccrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:#333333;backgr=
ound:white">Description:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">Nested virtualization, take KVM host as L0, create guest on it,=
 install Xen on guest, then guest cannot boot up from Xen and keep rebootin=
g.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:#333333;backgr=
ound:white">Reproduce steps:<br>
</span><span style=3D"font-size:10.5pt;color:#333333">1. Enable KVM nested =
on host(L0)<br>
rmmod kvm_intel<br>
modprobe kvm_intel nested=3Dy<br>
cat /sys/module/kvm_intel/parameters/nested<br>
Y</span><span style=3D"font-size:12.0pt;color:#333333;background:white"><o:=
p></o:p></span></p>
<p style=3D"mso-margin-top-alt:7.5pt;margin-right:0in;margin-bottom:0in;mar=
gin-left:0in;margin-bottom:.0001pt;background:white">
<span style=3D"font-size:10.5pt;color:#333333">2.Create L1 guest via qemu:<=
br>
qemu-system-x86_64 -accel kvm -cpu host -drive file=3Drhel8.img,if=3Dnone,i=
d=3Dvirtio-disk0 -device virtio-blk-pci,drive=3Dvirtio-disk0 -m 7168 -smp 8=
 -monitor pty -cpu host -device virtio-net-pci,netdev=3Dnic0,mac=3D00:16:3e=
:72:5e:0a -netdev tap,id=3Dnic0,br=3Dvirbr0,helper=3D/usr/libexec/qemu-brid=
ge-helper,vhost=3Don
 -serial stdio<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:7.5pt;margin-right:0in;margin-bottom:0in;mar=
gin-left:0in;margin-bottom:.0001pt;background:white;outline: none !importan=
t;font-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;text-=
align:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-style:=
 initial;text-decoration-color: initial;word-spacing:0px">
<span style=3D"font-size:10.5pt;color:#333333">3. Build and install Xen on =
L1 guest<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:7.5pt;margin-right:0in;margin-bottom:0in;mar=
gin-left:0in;margin-bottom:.0001pt;background:white">
<span style=3D"font-size:10.5pt;color:#333333">4. Reboot L1 and make it boo=
t from Xen<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">Then L1 keep rebooting, full log attached.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">&#8230;&#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) Running stub recovery selftests...<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) traps.c:1590: GPF (0000): ffff82d0bfffe041 [ffff82d0bfffe=
041] -&gt; ffff82d08038e40c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) traps.c:785: Trap 12: ffff82d0bfffe040 [ffff82d0bfffe040]=
 -&gt; ffff82d08038e40c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) traps.c:1124: Trap 3: ffff82d0bfffe041 [ffff82d0bfffe041]=
 -&gt; ffff82d08038e40c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) ----[ Xen-4.14-unstable&nbsp; x86_64&nbsp; debug=3Dy&nbsp=
;&nbsp; Tainted:&nbsp; C&nbsp;&nbsp; ]----<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) CPU:&nbsp;&nbsp;&nbsp; 0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) RIP:&nbsp;&nbsp;&nbsp; e008:[&lt;ffff82d08043a8bc&gt;] co=
re2_vpmu_init&#43;0xa5/0x221<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) RFLAGS: 0000000000010202&nbsp;&nbsp; CONTEXT: hypervisor<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) rax: 0000000008300802&nbsp;&nbsp; rbx: 0000000000000000&n=
bsp;&nbsp; rcx: 0000000000000345<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) rdx: 0000000000000004&nbsp;&nbsp; rsi: 000000000000000a&n=
bsp;&nbsp; rdi: 0000000000000063<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) rbp: ffff82d0804b7d68&nbsp;&nbsp; rsp: ffff82d0804b7d58&n=
bsp;&nbsp; r8:&nbsp; 0000000000000004<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) r9:&nbsp; 0000000000000008&nbsp;&nbsp; r10: ffff82d0805ef=
fe0&nbsp;&nbsp; r11: 0000000000000032<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) r12: 0000000000000002&nbsp;&nbsp; r13: 0000000000000008&n=
bsp;&nbsp; r14: ffff82d0805dd0c0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) r15: ffff82d0805de300&nbsp;&nbsp; cr0: 000000008005003b&n=
bsp;&nbsp; cr4: 00000000003526e0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) cr3: 00000000bfca4000&nbsp;&nbsp; cr2: 0000000000000000<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) fsb: 0000000000000000&nbsp;&nbsp; gsb: 0000000000000000&n=
bsp;&nbsp; gss: 0000000000000000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) ds: 0000&nbsp;&nbsp; es: 0000&nbsp;&nbsp; fs: 0000&nbsp;&=
nbsp; gs: 0000&nbsp;&nbsp; ss: 0000&nbsp;&nbsp; cs: e008<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) Xen code around &lt;ffff82d08043a8bc&gt; (core2_vpmu_init=
&#43;0xa5/0x221):<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp; 00 06 00 b9 45 03 00 00 &lt;0f&gt; 32 48 89 c1 48 c=
1 e9 0d 83 e1 01 88 0d 32 00<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) Xen stack trace from rsp=3Dffff82d0804b7d58:<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; ffff82d080452168 ffff82d080452248 ffff8=
2d0804b7d78 ffff82d08043a622<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; ffff82d0804b7d98 ffff82d08040dcb0 00000=
00000000008 0000000000000000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; ffff82d0804b7ee8 ffff82d0804339db 00000=
00001fb4fff 00000000000001f6<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; ffff83000009de80 ffffffff00000000 000ff=
ff82d0807f6 0000000000000002<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; 0000000000000002 0000000000000002 00000=
00000000002 0000000000000002<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; 0000000000000001 0000000000000001 00000=
00000100000 ffff82d08047ac00<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; 0000000000200000 ffff82d08047acdc 00000=
00100000008 0000000000000007<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; 0000000001fb4000 0000000000000000 00000=
00000000007 ffff83000009dd20<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; ffff83000009de80 ffff83000009dfb0 00000=
00000000000 0000000000000000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; 0000000400000000 0000000000000000 fffff=
fffffffffff 00000000ffffffff<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; 0000000800000000 000000010000006e 00000=
00000000003 00000000000002f8<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; 0000000000000002 0000000000000000 00000=
00000000000 0000000000000000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 0000000000000000 00000=
00000000000 ffff82d0802000ec<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 0000000000000000 00000=
00000000000 0000000000000000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 0000000000000000 00000=
00000000000 0000000000000000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 0000000000000000 00000=
00000000000 0000000000000000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 0000000000000000 00000=
00000000000 0000000000000000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 0000000000000000 00000=
00000000000 0000000000000000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 0000000000000000 00000=
00000000000 0000000000000000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 0000e01000000000 ffff8=
301f136e000 0000000000000000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) Xen call trace:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; [&lt;ffff82d08043a8bc&gt;] R core2_vpmu=
_init&#43;0xa5/0x221<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; [&lt;ffff82d08043a622&gt;] F arch/x86/c=
pu/vpmu.c#vpmu_init&#43;0xc4/0x100<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; [&lt;ffff82d08040dcb0&gt;] F do_initcal=
ls&#43;0x35/0x44<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; [&lt;ffff82d0804339db&gt;] F __start_xe=
n&#43;0x22d7/0x2808<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)&nbsp;&nbsp;&nbsp; [&lt;ffff82d0802000ec&gt;] F __high_sta=
rt&#43;0x4c/0x4e<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) ****************************************<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) Panic on CPU 0:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) GENERAL PROTECTION FAULT<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) [error_code=3D0000]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) ****************************************<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">(XEN) Reboot in five seconds...<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:#333333;backgr=
ound:white">Environment:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">Host(L0):<o:p></o:p></span></p>
<p class=3D"MsoNormal">KVM: <a href=3D"https://git.kernel.org/pub/scm/virt/=
kvm/kvm.git/">
https://git.kernel.org/pub/scm/virt/kvm/kvm.git/</a> <o:p></o:p></p>
<p class=3D"MsoNormal">Branch: next <o:p></o:p></p>
<p class=3D"MsoNormal">Commit: ead68df94d248c80fdbae220ae5425eb5af2e753<spa=
n style=3D"font-size:10.5pt;color:#333333">&nbsp;
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">Kernel version:&nbsp;5.6.0_rc1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">Qemu:</span>
<span style=3D"font-size:10.5pt;color:#333333;background:white"><a href=3D"=
https://git.qemu.org/git/qemu.git">https://git.qemu.org/git/qemu.git</a>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">Branch: master
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">Commit:
</span>88e2b97aa3e369a454c9d8360afddc348070c708<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333"><br>
Guest(L1):<br>
<span style=3D"background:white">Xen:&nbsp;<a href=3D"https://xenbits.xen.o=
rg/git-http/xen.git">https://xenbits.xen.org/git-http/xen.git</a>
<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">Branch:
</span>master <o:p></o:p></p>
<p class=3D"MsoNormal">Commit: c47984aabead53918e5ba6d43cdb3f1467452739<spa=
n style=3D"font-size:10.5pt;color:#333333;background:white"><o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333">Xen v=
ersion: 4.14-unstable<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333"><br>
<span style=3D"background:white">Host OS(L0): Red Hat Enterprise Linux 8.1<=
o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white">Guest OS(L1): Red Hat Enterprise Linux 8.1<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;color:#333333;backgr=
ound:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Fan<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54SHSMSX104ccrcor_--

--_004_1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54SHSMSX104ccrcor_
Content-Type: text/plain; name="Boot_Xen_log.txt"
Content-Description: Boot_Xen_log.txt
Content-Disposition: attachment; filename="Boot_Xen_log.txt"; size=10491;
	creation-date="Wed, 26 Feb 2020 03:41:46 GMT";
	modification-date="Wed, 26 Feb 2020 03:41:46 GMT"
Content-Transfer-Encoding: base64

WyAgIDM5Ljg1Mzk0M10ga3ZtOiBleGl0aW5nIGhhcmR3YXJlIHZpcnR1YWxpemF0aW9uDQpbICAg
MzkuODU2MjU5XSByZWJvb3Q6IFJlc3RhcnRpbmcgc3lzdGVtDQpbICAgMzkuODU2NzA2XSByZWJv
b3Q6IG1hY2hpbmUgcmVzdGFydA0KIFhlbiA0LjE0LXVuc3RhYmxlDQooWEVOKSBYZW4gdmVyc2lv
biA0LjE0LXVuc3RhYmxlICh2bW1Ac2guaW50ZWwuY29tKSAoZ2NjIChHQ0MpIDguMy4xIDIwMTkw
NTA3IChSZWQgSGF0IDguMy4xLTQpKSBkZWJ1Zz15ICBNb24gRmViIDI0IDAxOjMzOjMyIENTVCAy
MDIwDQooWEVOKSBMYXRlc3QgQ2hhbmdlU2V0OiBUdWUgRmViIDE4IDE2OjI3OjA3IDIwMjAgKzAx
MDAgZ2l0OmM0Nzk4NGFhYmUtZGlydHkNCihYRU4pIGJ1aWxkLWlkOiBmN2M2OTA1OTE0MGU0ZjYw
YmUyYzAyZmVkNWY5OGI4MGQ4N2FkNjQyDQooWEVOKSBDb25zb2xlIG91dHB1dCBpcyBzeW5jaHJv
bm91cy4NCihYRU4pIEJvb3Rsb2FkZXI6IEdSVUIgMi4wMw0KKFhFTikgQ29tbWFuZCBsaW5lOiBk
b20wX21lbT04MTkyTSBkb20wX21heF92Y3B1cz04IGxvZ2x2bD1hbGwgZ3Vlc3RfbG9nbHZsPWFs
bCB1bnJlc3RyaWN0ZWRfZ3Vlc3Q9MSBtc2k9MSBjb25yaW5nX3NpemU9NE0gY29uc29sZT1jb20x
IGNvbTE9MTE1MjAwLDhuMSBzeW5jX2NvbnNvbGUgdnBpZD0xIHZwbXU9MSBhbHRwMm09MSBwc3I9
Y210IHBzcj1jYXQgcHNyPWNkcCBlcHQ9cG1sIGlvbW11PW9uLGludHBvc3QgaHZtX2ZlcD10cnVl
IGV4dHJhX2d1ZXN0X2lycXM9MTAyNCwxMDI0DQooWEVOKSBYZW4gaW1hZ2UgbG9hZCBiYXNlIGFk
ZHJlc3M6IDANCihYRU4pIFZpZGVvIGluZm9ybWF0aW9uOg0KKFhFTikgIFZHQSBpcyB0ZXh0IG1v
ZGUgODB4MjUsIGZvbnQgOHgxNg0KKFhFTikgIFZCRS9EREMgbWV0aG9kczogVjEgVjI7IEVESUQg
dHJhbnNmZXIgdGltZTogMSBzZWNvbmRzDQooWEVOKSBEaXNjIGluZm9ybWF0aW9uOg0KKFhFTikg
IEZvdW5kIDEgTUJSIHNpZ25hdHVyZXMNCihYRU4pICBGb3VuZCAxIEVERCBpbmZvcm1hdGlvbiBz
dHJ1Y3R1cmVzDQooWEVOKSBDUFUgVmVuZG9yOiBJbnRlbCwgRmFtaWx5IDYgKDB4NiksIE1vZGVs
IDEwNiAoMHg2YSksIFN0ZXBwaW5nIDAgKHJhdyAwMDA2MDZhMCkNCihYRU4pIFhlbi1lODIwIFJB
TSBtYXA6DQooWEVOKSAgWzAwMDAwMDAwMDAwMDAwMDAsIDAwMDAwMDAwMDAwOWZiZmZdICh1c2Fi
bGUpDQooWEVOKSAgWzAwMDAwMDAwMDAwOWZjMDAsIDAwMDAwMDAwMDAwOWZmZmZdIChyZXNlcnZl
ZCkNCihYRU4pICBbMDAwMDAwMDAwMDBmMDAwMCwgMDAwMDAwMDAwMDBmZmZmZl0gKHJlc2VydmVk
KQ0KKFhFTikgIFswMDAwMDAwMDAwMTAwMDAwLCAwMDAwMDAwMGJmZmRjZmZmXSAodXNhYmxlKQ0K
KFhFTikgIFswMDAwMDAwMGJmZmRkMDAwLCAwMDAwMDAwMGJmZmZmZmZmXSAocmVzZXJ2ZWQpDQoo
WEVOKSAgWzAwMDAwMDAwZmVmZmMwMDAsIDAwMDAwMDAwZmVmZmZmZmZdIChyZXNlcnZlZCkNCihY
RU4pICBbMDAwMDAwMDBmZmZjMDAwMCwgMDAwMDAwMDBmZmZmZmZmZl0gKHJlc2VydmVkKQ0KKFhF
TikgIFswMDAwMDAwMTAwMDAwMDAwLCAwMDAwMDAwMWZmZmZmZmZmXSAodXNhYmxlKQ0KKFhFTikg
TmV3IFhlbiBpbWFnZSBiYXNlIGFkZHJlc3M6IDB4YmY4MDAwMDANCihYRU4pIEFDUEk6IFJTRFAg
MDAwRjU5RDAsIDAwMTQgKHIwIEJPQ0hTICkNCihYRU4pIEFDUEk6IFJTRFQgQkZGRTE0M0UsIDAw
MzAgKHIxIEJPQ0hTICBCWFBDUlNEVCAgICAgICAgMSBCWFBDICAgICAgICAxKQ0KKFhFTikgQUNQ
STogRkFDUCBCRkZFMTJFMiwgMDA3NCAocjEgQk9DSFMgIEJYUENGQUNQICAgICAgICAxIEJYUEMg
ICAgICAgIDEpDQooWEVOKSBBQ1BJOiBEU0RUIEJGRkRGQzgwLCAxNjYyIChyMSBCT0NIUyAgQlhQ
Q0RTRFQgICAgICAgIDEgQlhQQyAgICAgICAgMSkNCihYRU4pIEFDUEk6IEZBQ1MgQkZGREZDNDAs
IDAwNDANCihYRU4pIEFDUEk6IEFQSUMgQkZGRTEzNTYsIDAwQjAgKHIxIEJPQ0hTICBCWFBDQVBJ
QyAgICAgICAgMSBCWFBDICAgICAgICAxKQ0KKFhFTikgQUNQSTogSFBFVCBCRkZFMTQwNiwgMDAz
OCAocjEgQk9DSFMgIEJYUENIUEVUICAgICAgICAxIEJYUEMgICAgICAgIDEpDQooWEVOKSBTeXN0
ZW0gUkFNOiA3MTY3TUIgKDczMzk1MDRrQikNCihYRU4pIE5vIE5VTUEgY29uZmlndXJhdGlvbiBm
b3VuZA0KKFhFTikgRmFraW5nIGEgbm9kZSBhdCAwMDAwMDAwMDAwMDAwMDAwLTAwMDAwMDAyMDAw
MDAwMDANCihYRU4pIERvbWFpbiBoZWFwIGluaXRpYWxpc2VkDQooWEVOKSBBbGxvY2F0ZWQgY29u
c29sZSByaW5nIG9mIDQwOTYgS2lCLg0KKFhFTikgZm91bmQgU01QIE1QLXRhYmxlIGF0IDAwMGY1
YTEwDQooWEVOKSBETUkgMi44IHByZXNlbnQuDQooWEVOKSBVc2luZyBBUElDIGRyaXZlciBkZWZh
dWx0DQooWEVOKSBBQ1BJOiBQTS1UaW1lciBJTyBQb3J0OiAweDYwOCAoMjQgYml0cykNCihYRU4p
IEFDUEk6IFNMRUVQIElORk86IHBtMXhfY250WzE6NjA0LDE6MF0sIHBtMXhfZXZ0WzE6NjAwLDE6
MF0NCihYRU4pIEFDUEk6ICAgICAgICAgICAgIHdha2V1cF92ZWNbYmZmZGZjNGNdLCB2ZWNfc2l6
ZVsyMF0NCihYRU4pIEFDUEk6IExvY2FsIEFQSUMgYWRkcmVzcyAweGZlZTAwMDAwDQooWEVOKSBB
Q1BJOiBMQVBJQyAoYWNwaV9pZFsweDAwXSBsYXBpY19pZFsweDAwXSBlbmFibGVkKQ0KKFhFTikg
QUNQSTogTEFQSUMgKGFjcGlfaWRbMHgwMV0gbGFwaWNfaWRbMHgwMV0gZW5hYmxlZCkNCihYRU4p
IEFDUEk6IExBUElDIChhY3BpX2lkWzB4MDJdIGxhcGljX2lkWzB4MDJdIGVuYWJsZWQpDQooWEVO
KSBBQ1BJOiBMQVBJQyAoYWNwaV9pZFsweDAzXSBsYXBpY19pZFsweDAzXSBlbmFibGVkKQ0KKFhF
TikgQUNQSTogTEFQSUMgKGFjcGlfaWRbMHgwNF0gbGFwaWNfaWRbMHgwNF0gZW5hYmxlZCkNCihY
RU4pIEFDUEk6IExBUElDIChhY3BpX2lkWzB4MDVdIGxhcGljX2lkWzB4MDVdIGVuYWJsZWQpDQoo
WEVOKSBBQ1BJOiBMQVBJQyAoYWNwaV9pZFsweDA2XSBsYXBpY19pZFsweDA2XSBlbmFibGVkKQ0K
KFhFTikgQUNQSTogTEFQSUMgKGFjcGlfaWRbMHgwN10gbGFwaWNfaWRbMHgwN10gZW5hYmxlZCkN
CihYRU4pIEFDUEk6IExBUElDX05NSSAoYWNwaV9pZFsweGZmXSBkZmwgZGZsIGxpbnRbMHgxXSkN
CihYRU4pIEFDUEk6IElPQVBJQyAoaWRbMHgwMF0gYWRkcmVzc1sweGZlYzAwMDAwXSBnc2lfYmFz
ZVswXSkNCihYRU4pIElPQVBJQ1swXTogYXBpY19pZCAwLCB2ZXJzaW9uIDE3LCBhZGRyZXNzIDB4
ZmVjMDAwMDAsIEdTSSAwLTIzDQooWEVOKSBBQ1BJOiBJTlRfU1JDX09WUiAoYnVzIDAgYnVzX2ly
cSAwIGdsb2JhbF9pcnEgMiBkZmwgZGZsKQ0KKFhFTikgQUNQSTogSU5UX1NSQ19PVlIgKGJ1cyAw
IGJ1c19pcnEgNSBnbG9iYWxfaXJxIDUgaGlnaCBsZXZlbCkNCihYRU4pIEFDUEk6IElOVF9TUkNf
T1ZSIChidXMgMCBidXNfaXJxIDkgZ2xvYmFsX2lycSA5IGhpZ2ggbGV2ZWwpDQooWEVOKSBBQ1BJ
OiBJTlRfU1JDX09WUiAoYnVzIDAgYnVzX2lycSAxMCBnbG9iYWxfaXJxIDEwIGhpZ2ggbGV2ZWwp
DQooWEVOKSBBQ1BJOiBJTlRfU1JDX09WUiAoYnVzIDAgYnVzX2lycSAxMSBnbG9iYWxfaXJxIDEx
IGhpZ2ggbGV2ZWwpDQooWEVOKSBBQ1BJOiBJUlEwIHVzZWQgYnkgb3ZlcnJpZGUuDQooWEVOKSBB
Q1BJOiBJUlEyIHVzZWQgYnkgb3ZlcnJpZGUuDQooWEVOKSBBQ1BJOiBJUlE1IHVzZWQgYnkgb3Zl
cnJpZGUuDQooWEVOKSBBQ1BJOiBJUlE5IHVzZWQgYnkgb3ZlcnJpZGUuDQooWEVOKSBBQ1BJOiBJ
UlExMCB1c2VkIGJ5IG92ZXJyaWRlLg0KKFhFTikgQUNQSTogSVJRMTEgdXNlZCBieSBvdmVycmlk
ZS4NCihYRU4pIEVuYWJsaW5nIEFQSUMgbW9kZTogIEZsYXQuICBVc2luZyAxIEkvTyBBUElDcw0K
KFhFTikgQUNQSTogSFBFVCBpZDogMHg4MDg2YTIwMSBiYXNlOiAweGZlZDAwMDAwDQooWEVOKSBV
c2luZyBBQ1BJIChNQURUKSBmb3IgU01QIGNvbmZpZ3VyYXRpb24gaW5mb3JtYXRpb24NCihYRU4p
IFNNUDogQWxsb3dpbmcgOCBDUFVzICgwIGhvdHBsdWcgQ1BVcykNCihYRU4pIElSUSBsaW1pdHM6
IDI0IEdTSSwgMTY0MCBNU0kvTVNJLVgNCihYRU4pIFN3aXRjaGVkIHRvIEFQSUMgZHJpdmVyIHgy
YXBpY19waHlzDQooWEVOKSB4c3RhdGU6IHNpemU6IDB4YTg4IGFuZCBzdGF0ZXM6IDB4MmU3DQoo
WEVOKSBtY2VfaW50ZWwuYzo3Nzk6IE1DQSBDYXBhYmlsaXR5OiBmaXJzdGJhbmsgMCwgZXh0ZW5k
ZWQgTUNFIE1TUiAwLCBCQ0FTVCwgU0VSLCBMTUNFDQooWEVOKSBDUFUwOiBJbnRlbCBtYWNoaW5l
IGNoZWNrIHJlcG9ydGluZyBlbmFibGVkDQooWEVOKSBVbnJlY29nbmlzZWQgQ1BVIG1vZGVsIDB4
NmEgLSBhc3N1bWluZyB2dWxuZXJhYmxlIHRvIExhenlGUFUNCihYRU4pIFNwZWN1bGF0aXZlIG1p
dGlnYXRpb24gZmFjaWxpdGllczoNCihYRU4pICAgSGFyZHdhcmUgZmVhdHVyZXM6IElCUlMvSUJQ
QiBTVElCUCBTU0JEIE1EX0NMRUFSIElCUEIgSUJSU19BTEwgUkRDTF9OTyBTS0lQX0wxREZMIE1E
U19OTw0KKFhFTikgICBDb21waWxlZC1pbiBzdXBwb3J0OiBJTkRJUkVDVF9USFVOSyBTSEFET1df
UEFHSU5HDQooWEVOKSAgIFhlbiBzZXR0aW5nczogQlRJLVRodW5rIEpNUCwgU1BFQ19DVFJMOiBJ
QlJTKyBTU0JELSwgT3RoZXI6IElCUEIgQlJBTkNIX0hBUkRFTg0KKFhFTikgICBTdXBwb3J0IGZv
ciBIVk0gVk1zOiBNU1JfU1BFQ19DVFJMIFJTQiBFQUdFUl9GUFUgTURfQ0xFQVINCihYRU4pICAg
U3VwcG9ydCBmb3IgUFYgVk1zOiBNU1JfU1BFQ19DVFJMIFJTQiBFQUdFUl9GUFUgTURfQ0xFQVIN
CihYRU4pICAgWFBUSSAoNjQtYml0IFBWIG9ubHkpOiBEb20wIGRpc2FibGVkLCBEb21VIGRpc2Fi
bGVkICh3aXRoIFBDSUQpDQooWEVOKSAgIFBWIEwxVEYgc2hhZG93aW5nOiBEb20wIGRpc2FibGVk
LCBEb21VIGRpc2FibGVkDQooWEVOKSBVc2luZyBzY2hlZHVsZXI6IFNNUCBDcmVkaXQgU2NoZWR1
bGVyIHJldjIgKGNyZWRpdDIpDQooWEVOKSBJbml0aWFsaXppbmcgQ3JlZGl0MiBzY2hlZHVsZXIN
CihYRU4pICBsb2FkX3ByZWNpc2lvbl9zaGlmdDogMTgNCihYRU4pICBsb2FkX3dpbmRvd19zaGlm
dDogMzANCihYRU4pICB1bmRlcmxvYWRfYmFsYW5jZV90b2xlcmFuY2U6IDANCihYRU4pICBvdmVy
bG9hZF9iYWxhbmNlX3RvbGVyYW5jZTogLTMNCihYRU4pICBydW5xdWV1ZXMgYXJyYW5nZW1lbnQ6
IHNvY2tldA0KKFhFTikgIGNhcCBlbmZvcmNlbWVudCBncmFudWxhcml0eTogMTBtcw0KKFhFTikg
bG9hZCB0cmFja2luZyB3aW5kb3cgbGVuZ3RoIDEwNzM3NDE4MjQgbnMNCihYRU4pIFBsYXRmb3Jt
IHRpbWVyIGlzIDEwMC4wMDBNSHogSFBFVA0KKFhFTikgRGV0ZWN0ZWQgMjAwMC4wMjAgTUh6IHBy
b2Nlc3Nvci4NCihYRU4pIGFsdCB0YWJsZSBmZmZmODJkMDgwNDgxMTUwIC0+IGZmZmY4MmQwODA0
OGYyNzYNCihYRU4pIEkvTyB2aXJ0dWFsaXNhdGlvbiBkaXNhYmxlZA0KKFhFTikgbnJfc29ja2V0
czogOA0KKFhFTikgRU5BQkxJTkcgSU8tQVBJQyBJUlFzDQooWEVOKSAgLT4gVXNpbmcgbmV3IEFD
SyBtZXRob2QNCihYRU4pIC4uVElNRVI6IHZlY3Rvcj0weEYwIGFwaWMxPTAgcGluMT0yIGFwaWMy
PS0xIHBpbjI9LTENCihYRU4pIFRTQyBkZWFkbGluZSB0aW1lciBlbmFibGVkDQooWEVOKSBtd2Fp
dC1pZGxlOiBkb2VzIG5vdCBydW4gb24gZmFtaWx5IDYgbW9kZWwgMTA2DQooWEVOKSBWTVg6IFN1
cHBvcnRlZCBhZHZhbmNlZCBmZWF0dXJlczoNCihYRU4pICAtIEFQSUMgTU1JTyBhY2Nlc3Mgdmly
dHVhbGlzYXRpb24NCihYRU4pICAtIEFQSUMgVFBSIHNoYWRvdw0KKFhFTikgIC0gRXh0ZW5kZWQg
UGFnZSBUYWJsZXMgKEVQVCkNCihYRU4pICAtIFZpcnR1YWwtUHJvY2Vzc29yIElkZW50aWZpZXJz
IChWUElEKQ0KKFhFTikgIC0gVmlydHVhbCBOTUkNCihYRU4pICAtIE1TUiBkaXJlY3QtYWNjZXNz
IGJpdG1hcA0KKFhFTikgIC0gVW5yZXN0cmljdGVkIEd1ZXN0DQooWEVOKSAgLSBBUElDIFJlZ2lz
dGVyIFZpcnR1YWxpemF0aW9uDQooWEVOKSAgLSBWaXJ0dWFsIEludGVycnVwdCBEZWxpdmVyeQ0K
KFhFTikgIC0gUG9zdGVkIEludGVycnVwdCBQcm9jZXNzaW5nDQooWEVOKSAgLSBWTUNTIHNoYWRv
d2luZw0KKFhFTikgIC0gVk0gRnVuY3Rpb25zDQooWEVOKSAgLSBQYWdlIE1vZGlmaWNhdGlvbiBM
b2dnaW5nDQooWEVOKSBIVk06IEFTSURzIGVuYWJsZWQuDQooWEVOKSBIVk06IFZNWCBlbmFibGVk
DQooWEVOKSBIVk06IEhhcmR3YXJlIEFzc2lzdGVkIFBhZ2luZyAoSEFQKSBkZXRlY3RlZA0KKFhF
TikgSFZNOiBIQVAgcGFnZSBzaXplczogNGtCLCAyTUIsIDFHQg0KKFhFTikgYWx0IHRhYmxlIGZm
ZmY4MmQwODA0ODExNTAgLT4gZmZmZjgyZDA4MDQ4ZjI3Ng0KKFhFTikgQnJvdWdodCB1cCA4IENQ
VXMNCihYRU4pIEFkZGluZyBjcHUgMCB0byBydW5xdWV1ZSAwDQooWEVOKSAgRmlyc3QgY3B1IG9u
IHJ1bnF1ZXVlLCBhY3RpdmF0aW5nDQooWEVOKSBBZGRpbmcgY3B1IDEgdG8gcnVucXVldWUgMQ0K
KFhFTikgIEZpcnN0IGNwdSBvbiBydW5xdWV1ZSwgYWN0aXZhdGluZw0KKFhFTikgQWRkaW5nIGNw
dSAyIHRvIHJ1bnF1ZXVlIDINCihYRU4pICBGaXJzdCBjcHUgb24gcnVucXVldWUsIGFjdGl2YXRp
bmcNCihYRU4pIEFkZGluZyBjcHUgMyB0byBydW5xdWV1ZSAzDQooWEVOKSAgRmlyc3QgY3B1IG9u
IHJ1bnF1ZXVlLCBhY3RpdmF0aW5nDQooWEVOKSBBZGRpbmcgY3B1IDQgdG8gcnVucXVldWUgNA0K
KFhFTikgIEZpcnN0IGNwdSBvbiBydW5xdWV1ZSwgYWN0aXZhdGluZw0KKFhFTikgQWRkaW5nIGNw
dSA1IHRvIHJ1bnF1ZXVlIDUNCihYRU4pICBGaXJzdCBjcHUgb24gcnVucXVldWUsIGFjdGl2YXRp
bmcNCihYRU4pIEFkZGluZyBjcHUgNiB0byBydW5xdWV1ZSA2DQooWEVOKSAgRmlyc3QgY3B1IG9u
IHJ1bnF1ZXVlLCBhY3RpdmF0aW5nDQooWEVOKSBBZGRpbmcgY3B1IDcgdG8gcnVucXVldWUgNw0K
KFhFTikgIEZpcnN0IGNwdSBvbiBydW5xdWV1ZSwgYWN0aXZhdGluZw0KKFhFTikgUnVubmluZyBz
dHViIHJlY292ZXJ5IHNlbGZ0ZXN0cy4uLg0KKFhFTikgdHJhcHMuYzoxNTkwOiBHUEYgKDAwMDAp
OiBmZmZmODJkMGJmZmZlMDQxIFtmZmZmODJkMGJmZmZlMDQxXSAtPiBmZmZmODJkMDgwMzhlNDBj
DQooWEVOKSB0cmFwcy5jOjc4NTogVHJhcCAxMjogZmZmZjgyZDBiZmZmZTA0MCBbZmZmZjgyZDBi
ZmZmZTA0MF0gLT4gZmZmZjgyZDA4MDM4ZTQwYw0KKFhFTikgdHJhcHMuYzoxMTI0OiBUcmFwIDM6
IGZmZmY4MmQwYmZmZmUwNDEgW2ZmZmY4MmQwYmZmZmUwNDFdIC0+IGZmZmY4MmQwODAzOGU0MGMN
CihYRU4pIC0tLS1bIFhlbi00LjE0LXVuc3RhYmxlICB4ODZfNjQgIGRlYnVnPXkgICBUYWludGVk
OiAgQyAgIF0tLS0tDQooWEVOKSBDUFU6ICAgIDANCihYRU4pIFJJUDogICAgZTAwODpbPGZmZmY4
MmQwODA0M2E4YmM+XSBjb3JlMl92cG11X2luaXQrMHhhNS8weDIyMQ0KKFhFTikgUkZMQUdTOiAw
MDAwMDAwMDAwMDEwMjAyICAgQ09OVEVYVDogaHlwZXJ2aXNvcg0KKFhFTikgcmF4OiAwMDAwMDAw
MDA4MzAwODAyICAgcmJ4OiAwMDAwMDAwMDAwMDAwMDAwICAgcmN4OiAwMDAwMDAwMDAwMDAwMzQ1
DQooWEVOKSByZHg6IDAwMDAwMDAwMDAwMDAwMDQgICByc2k6IDAwMDAwMDAwMDAwMDAwMGEgICBy
ZGk6IDAwMDAwMDAwMDAwMDAwNjMNCihYRU4pIHJicDogZmZmZjgyZDA4MDRiN2Q2OCAgIHJzcDog
ZmZmZjgyZDA4MDRiN2Q1OCAgIHI4OiAgMDAwMDAwMDAwMDAwMDAwNA0KKFhFTikgcjk6ICAwMDAw
MDAwMDAwMDAwMDA4ICAgcjEwOiBmZmZmODJkMDgwNWVmZmUwICAgcjExOiAwMDAwMDAwMDAwMDAw
MDMyDQooWEVOKSByMTI6IDAwMDAwMDAwMDAwMDAwMDIgICByMTM6IDAwMDAwMDAwMDAwMDAwMDgg
ICByMTQ6IGZmZmY4MmQwODA1ZGQwYzANCihYRU4pIHIxNTogZmZmZjgyZDA4MDVkZTMwMCAgIGNy
MDogMDAwMDAwMDA4MDA1MDAzYiAgIGNyNDogMDAwMDAwMDAwMDM1MjZlMA0KKFhFTikgY3IzOiAw
MDAwMDAwMGJmY2E0MDAwICAgY3IyOiAwMDAwMDAwMDAwMDAwMDAwDQooWEVOKSBmc2I6IDAwMDAw
MDAwMDAwMDAwMDAgICBnc2I6IDAwMDAwMDAwMDAwMDAwMDAgICBnc3M6IDAwMDAwMDAwMDAwMDAw
MDANCihYRU4pIGRzOiAwMDAwICAgZXM6IDAwMDAgICBmczogMDAwMCAgIGdzOiAwMDAwICAgc3M6
IDAwMDAgICBjczogZTAwOA0KKFhFTikgWGVuIGNvZGUgYXJvdW5kIDxmZmZmODJkMDgwNDNhOGJj
PiAoY29yZTJfdnBtdV9pbml0KzB4YTUvMHgyMjEpOg0KKFhFTikgIDAwIDA2IDAwIGI5IDQ1IDAz
IDAwIDAwIDwwZj4gMzIgNDggODkgYzEgNDggYzEgZTkgMGQgODMgZTEgMDEgODggMGQgMzIgMDAN
CihYRU4pIFhlbiBzdGFjayB0cmFjZSBmcm9tIHJzcD1mZmZmODJkMDgwNGI3ZDU4Og0KKFhFTikg
ICAgZmZmZjgyZDA4MDQ1MjE2OCBmZmZmODJkMDgwNDUyMjQ4IGZmZmY4MmQwODA0YjdkNzggZmZm
ZjgyZDA4MDQzYTYyMg0KKFhFTikgICAgZmZmZjgyZDA4MDRiN2Q5OCBmZmZmODJkMDgwNDBkY2Iw
IDAwMDAwMDAwMDAwMDAwMDggMDAwMDAwMDAwMDAwMDAwMA0KKFhFTikgICAgZmZmZjgyZDA4MDRi
N2VlOCBmZmZmODJkMDgwNDMzOWRiIDAwMDAwMDAwMDFmYjRmZmYgMDAwMDAwMDAwMDAwMDFmNg0K
KFhFTikgICAgZmZmZjgzMDAwMDA5ZGU4MCBmZmZmZmZmZjAwMDAwMDAwIDAwMGZmZmY4MmQwODA3
ZjYgMDAwMDAwMDAwMDAwMDAwMg0KKFhFTikgICAgMDAwMDAwMDAwMDAwMDAwMiAwMDAwMDAwMDAw
MDAwMDAyIDAwMDAwMDAwMDAwMDAwMDIgMDAwMDAwMDAwMDAwMDAwMg0KKFhFTikgICAgMDAwMDAw
MDAwMDAwMDAwMSAwMDAwMDAwMDAwMDAwMDAxIDAwMDAwMDAwMDAxMDAwMDAgZmZmZjgyZDA4MDQ3
YWMwMA0KKFhFTikgICAgMDAwMDAwMDAwMDIwMDAwMCBmZmZmODJkMDgwNDdhY2RjIDAwMDAwMDAx
MDAwMDAwMDggMDAwMDAwMDAwMDAwMDAwNw0KKFhFTikgICAgMDAwMDAwMDAwMWZiNDAwMCAwMDAw
MDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDcgZmZmZjgzMDAwMDA5ZGQyMA0KKFhFTikgICAg
ZmZmZjgzMDAwMDA5ZGU4MCBmZmZmODMwMDAwMDlkZmIwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAw
MDAwMDAwMDAwMA0KKFhFTikgICAgMDAwMDAwMDQwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIGZm
ZmZmZmZmZmZmZmZmZmYgMDAwMDAwMDBmZmZmZmZmZg0KKFhFTikgICAgMDAwMDAwMDgwMDAwMDAw
MCAwMDAwMDAwMTAwMDAwMDZlIDAwMDAwMDAwMDAwMDAwMDMgMDAwMDAwMDAwMDAwMDJmOA0KKFhF
TikgICAgMDAwMDAwMDAwMDAwMDAwMiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAg
MDAwMDAwMDAwMDAwMDAwMA0KKFhFTikgICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAw
MDAwIDAwMDAwMDAwMDAwMDAwMDAgZmZmZjgyZDA4MDIwMDBlYw0KKFhFTikgICAgMDAwMDAwMDAw
MDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAw
MA0KKFhFTikgICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAw
MDAwMDAgMDAwMDAwMDAwMDAwMDAwMA0KKFhFTikgICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAw
MDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMA0KKFhFTikgICAgMDAw
MDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAw
MDAwMDAwMA0KKFhFTikgICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAw
MDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMA0KKFhFTikgICAgMDAwMDAwMDAwMDAwMDAwMCAw
MDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMA0KKFhFTikg
ICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwZTAxMDAwMDAwMDAwIGZmZmY4MzAxZjEzNmUwMDAgMDAw
MDAwMDAwMDAwMDAwMA0KKFhFTikgWGVuIGNhbGwgdHJhY2U6DQooWEVOKSAgICBbPGZmZmY4MmQw
ODA0M2E4YmM+XSBSIGNvcmUyX3ZwbXVfaW5pdCsweGE1LzB4MjIxDQooWEVOKSAgICBbPGZmZmY4
MmQwODA0M2E2MjI+XSBGIGFyY2gveDg2L2NwdS92cG11LmMjdnBtdV9pbml0KzB4YzQvMHgxMDAN
CihYRU4pICAgIFs8ZmZmZjgyZDA4MDQwZGNiMD5dIEYgZG9faW5pdGNhbGxzKzB4MzUvMHg0NA0K
KFhFTikgICAgWzxmZmZmODJkMDgwNDMzOWRiPl0gRiBfX3N0YXJ0X3hlbisweDIyZDcvMHgyODA4
DQooWEVOKSAgICBbPGZmZmY4MmQwODAyMDAwZWM+XSBGIF9faGlnaF9zdGFydCsweDRjLzB4NGUN
CihYRU4pDQooWEVOKQ0KKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKg0KKFhFTikgUGFuaWMgb24gQ1BVIDA6DQooWEVOKSBHRU5FUkFMIFBST1RFQ1RJT04gRkFV
TFQNCihYRU4pIFtlcnJvcl9jb2RlPTAwMDBdDQooWEVOKSAqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqDQooWEVOKQ0KKFhFTikgUmVib290IGluIGZpdmUgc2Vjb25kcy4u
Lg0K

--_004_1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54SHSMSX104ccrcor_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--_004_1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54SHSMSX104ccrcor_--

