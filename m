Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE66B1BD805
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 11:16:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTioe-0007VB-GQ; Wed, 29 Apr 2020 09:15:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WYUl=6N=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1jTiod-0007V6-8B
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 09:15:39 +0000
X-Inumbo-ID: fcb3b4da-89f9-11ea-b9cf-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcb3b4da-89f9-11ea-b9cf-bc764e2007e4;
 Wed, 29 Apr 2020 09:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588151737;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9XuqZjXLEDLA7Jw3hoiSW1FuO4sc8HAIQkKF8epLdEI=;
 b=fL3ZhL0nrf6D8mpir0t3zWoA6vH00eALCSKZYLSMyRfBLkch+6HLv5Hy
 tsK+2kjqusMrPmKkHXAv9Hmu7EfmBk1ad/kFhxvCZuV3FqYgqy4f9iInI
 19ErnmLlHaqXIRsk2LhWRRKrGMKBKJyNHMEKzakgWIfqNxJDtPlHwfaT8 A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1ooR5Dv6leMjWF2Ggpi5ZAC8aL9Kfj5/egqHpjXwJw3dPbBh2UWYua8G8/MnB5lZX/oAVA5Vip
 wRgMhYRVcwXLcCiNbw+B0N4QKZ0xvoCH8nkdCOF+Irc0LcyULnzIS6n3d67v/53vU4O+IwRD9K
 IXec7U3xcjxeiicUNz4OcQSI/sdhXILLRu/isjT17zQXjSM+mrMbOpwQsIMBCbf9h9+S8meuet
 umwQBAdI5Hkt5BYMklRZs7X00Ll+QtM7xhFNuGwtKlJXLaivPrnPGYoOzOdmTXGhoFteEHb8s3
 FyI=
X-SBRS: 2.7
X-MesageID: 16678296
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,331,1583211600"; d="scan'208";a="16678296"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Subject: Re: Cpu on/offlining crash with core scheduling
Thread-Topic: Cpu on/offlining crash with core scheduling
Thread-Index: AQHWHJp8dUHIzvCapEuuomD+efJ+EaiPoGGAgAAihQA=
Date: Wed, 29 Apr 2020 09:15:33 +0000
Message-ID: <1588151726659.12791@citrix.com>
References: <1587995374653.73805@citrix.com>
 <103f3e30-a67e-77b7-9e92-572ee4b5d159@suse.com>
In-Reply-To: <103f3e30-a67e-77b7-9e92-572ee4b5d159@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: AMSPEX02CL03.citrite.net (15.00.1497.006)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <804E099997A35842B8634514648679C6@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Sergey
 Dyasli <sergey.dyasli@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/04/2020 09:09, J=FCrgen Gro=DF wrote:=0A=
> On 27.04.20 15:49, Sergey Dyasli wrote:=0A=
>> Hi Juergen,=0A=
>>=0A=
>> When I'm testing vcpu pinning with something like:=0A=
>>=0A=
>> =A0=A0=A0=A0=A0 # xl vcpu-pin 0 0 2=0A=
>> =A0=A0=A0=A0=A0 # xen-hptool cpu-offline 3=0A=
>>=0A=
>> =A0=A0=A0=A0=A0 (offline / online CPUs {2,3} if the above is successful)=
=0A=
>>=0A=
>> I'm reliably seeing the following crash on the latest staging:=0A=
>>=0A=
>> (XEN) Watchdog timer detects that CPU1 is stuck!=0A=
>> (XEN) ----[ Xen-4.14-unstable=A0 x86_64=A0 debug=3Dy=A0=A0 Not tainted ]=
----=0A=
>> (XEN) CPU:=A0=A0=A0 1=0A=
>> (XEN) RIP:=A0=A0=A0 e008:[<ffff82d08025266d>] common/sched/core.c#sched_=
wait_rendezvous_in+0x16c/0x385=0A=
>> (XEN) RFLAGS: 0000000000000002=A0=A0 CONTEXT: hypervisor=0A=
>> (XEN) rax: 000000000000f001=A0=A0 rbx: ffff82d0805c9118=A0=A0 rcx: ffff8=
3085e750301=0A=
>> (XEN) rdx: 0000000000000001=A0=A0 rsi: ffff83086499b972=A0=A0 rdi: ffff8=
3085e7503a6=0A=
>> (XEN) rbp: ffff83085e7dfe28=A0=A0 rsp: ffff83085e7dfdd8=A0=A0 r8:=A0 fff=
f830864985440=0A=
>> (XEN) r9:=A0 ffff83085e714068=A0=A0 r10: 0000000000000014=A0=A0 r11: 000=
00056b6a1aab2=0A=
>> (XEN) r12: ffff83086499e490=A0=A0 r13: ffff82d0805f26e0=A0=A0 r14: ffff8=
3085e7503a0=0A=
>> (XEN) r15: 0000000000000001=A0=A0 cr0: 0000000080050033=A0=A0 cr4: 00000=
00000362660=0A=
>> (XEN) cr3: 0000000823a8e000=A0=A0 cr2: 00006026000f6fc0=0A=
>> (XEN) fsb: 0000000000000000=A0=A0 gsb: ffff888138dc0000=A0=A0 gss: 00000=
00000000000=0A=
>> (XEN) ds: 002b=A0=A0 es: 002b=A0=A0 fs: 0000=A0=A0 gs: 0000=A0=A0 ss: e0=
10=A0=A0 cs: e008=0A=
>> (XEN) Xen code around <ffff82d08025266d> (common/sched/core.c#sched_wait=
_rendezvous_in+0x16c/0x385):=0A=
>> (XEN)=A0 4c 89 f7 e8 dc a5 fd ff <4b> 8b 44 fd 00 48 8b 04 18 4c 3b 70 1=
0 0f 85 3f=0A=
>> (XEN) Xen stack trace from rsp=3Dffff83085e7dfdd8:=0A=
>> (XEN)=A0=A0=A0 00000056b42128a6 ffff83086499ff30 ffff83086498a000 ffff83=
085e7dfe48=0A=
>> (XEN)=A0=A0=A0 0000000100000001 00000056b42128a6 ffff83086499e490 000000=
0000000000=0A=
>> (XEN)=A0=A0=A0 0000000000000001 0000000000000001 ffff83085e7dfe78 ffff82=
d080252ae8=0A=
>> (XEN)=A0=A0=A0 ffff83086498a000 0000000180230434 ffff83085e7503a0 ffff82=
d0805ceb00=0A=
>> (XEN)=A0=A0=A0 ffffffffffffffff ffff82d0805cea80 0000000000000000 ffff82=
d0805dea80=0A=
>> (XEN)=A0=A0=A0 ffff83085e7dfeb0 ffff82d08022c232 0000000000000001 ffff82=
d0805ceb00=0A=
>> (XEN)=A0=A0=A0 0000000000000001 0000000000000001 0000000000000001 ffff83=
085e7dfec0=0A=
>> (XEN)=A0=A0=A0 ffff82d08022c2cd ffff83085e7dfef0 ffff82d08031cae9 ffff83=
086498a000=0A=
>> (XEN)=A0=A0=A0 ffff83086498a000 0000000000000001 0000000000000001 ffff83=
085e7dfde8=0A=
>> (XEN)=A0=A0=A0 ffff88813021d700 ffff88813021d700 0000000000000000 000000=
0000000000=0A=
>> (XEN)=A0=A0=A0 0000000000000007 ffff88813021d700 0000000000000246 000000=
0000007ff0=0A=
>> (XEN)=A0=A0=A0 0000000000000000 000000000001ca00 0000000000000000 ffffff=
ff810013aa=0A=
>> (XEN)=A0=A0=A0 ffffffff8203d210 deadbeefdeadf00d deadbeefdeadf00d 000001=
0000000000=0A=
>> (XEN)=A0=A0=A0 ffffffff810013aa 000000000000e033 0000000000000246 ffffc9=
00400dfeb0=0A=
>> (XEN)=A0=A0=A0 000000000000e02b 0000000000000000 0000000000000000 000000=
0000000000=0A=
>> (XEN)=A0=A0=A0 0000000000000000 0000e01000000001 ffff83086498a000 000000=
37e43bd000=0A=
>> (XEN)=A0=A0=A0 0000000000362660 0000000000000000 8000000864980002 000006=
0100000000=0A=
>> (XEN)=A0=A0=A0 0000000000000000=0A=
>> (XEN) Xen call trace:=0A=
>> (XEN)=A0=A0=A0 [<ffff82d08025266d>] R common/sched/core.c#sched_wait_ren=
dezvous_in+0x16c/0x385=0A=
>> (XEN)=A0=A0=A0 [<ffff82d080252ae8>] F common/sched/core.c#sched_slave+0x=
262/0x31e=0A=
>> (XEN)=A0=A0=A0 [<ffff82d08022c232>] F common/softirq.c#__do_softirq+0x8a=
/0xbc=0A=
>> (XEN)=A0=A0=A0 [<ffff82d08022c2cd>] F do_softirq+0x13/0x15=0A=
>> (XEN)=A0=A0=A0 [<ffff82d08031cae9>] F arch/x86/domain.c#idle_loop+0x57/0=
xa7=0A=
>> (XEN)=0A=
>> (XEN) CPU0 @ e008:ffff82d08022c2b7 (process_pending_softirqs+0x53/0x56)=
=0A=
>> (XEN) CPU4 @ e008:ffff82d08022bc40 (common/rcupdate.c#rcu_process_callba=
cks+0x22e/0x24b)=0A=
>> (XEN) CPU2 @ e008:ffff82d08022c26f (process_pending_softirqs+0xb/0x56)=
=0A=
>> (XEN) CPU7 @ e008:ffff82d08022bc40 (common/rcupdate.c#rcu_process_callba=
cks+0x22e/0x24b)=0A=
>> (XEN) CPU3 @ e008:ffff82d08022bc40 (common/rcupdate.c#rcu_process_callba=
cks+0x22e/0x24b)=0A=
>> (XEN) CPU5 @ e008:ffff82d08022cc34 (_spin_lock+0x4d/0x62)=0A=
>> (XEN) CPU6 @ e008:ffff82d08022c264 (process_pending_softirqs+0/0x56)=0A=
>> (XEN)=0A=
>> (XEN) ****************************************=0A=
>> (XEN) Panic on CPU 1:=0A=
>> (XEN) FATAL TRAP: vector =3D 2 (nmi)=0A=
>> (XEN) [error_code=3D0000] , IN INTERRUPT CONTEXT=0A=
>> (XEN) ****************************************=0A=
>> (XEN)=0A=
>> (XEN) Reboot in five seconds...=0A=
>> (XEN) Executing kexec image on cpu1=0A=
>> (XEN) Shot down all CPUs=0A=
>>=0A=
>>=0A=
>> Is this something you can reproduce?=0A=
> =0A=
> Yes, I was able to hit this.=0A=
> =0A=
> Attached patch is fixing it for me. Could you give it a try?=0A=
=0A=
The patch fixes the immediate issue:=0A=
=0A=
	Tested-by: Sergey Dyasli <sergey.dyasli@citrix.com>=0A=
	=0A=
Thanks!=0A=
=0A=
However, when running the following script:=0A=
=0A=
	while :; do xen-hptool cpu-offline 3; xen-hptool cpu-offline 2; xen-hptool=
 cpu-online 3; xen-hptool cpu-online 2; sleep 0.1; done=0A=
	=0A=
there was some weirdness with the utility on some invocations:=0A=
=0A=
	xen-hptool: symbol lookup error: /lib64/libxenctrl.so.4.14: undefined symb=
ol: xc__hypercall_buffer_free=0A=
	Segmentation fault (core dumped)=0A=
	xen-hptool: symbol lookup error: /lib64/libxenctrl.so.4.14: undefined symb=
ol: xc__hypercall_bounce_post=0A=
	xen-hptool: relocation error: /lib64/libxenctrl.so.4.14: symbol xencall_fr=
ee_buffer, version VERS_1.0 not defined in file libxencall.so.1 with link t=
ime reference=0A=
	=0A=
And after a while it all ended up in:=0A=
=0A=
[  634.817181] BUG: unable to handle kernel NULL pointer dereference at 000=
0000000000060=0A=
[  634.817197] PGD 67866067 P4D 67866067 PUD 4cb6067 PMD 0=0A=
[  634.817208] Oops: 0000 [#1] SMP NOPTI=0A=
[  634.817215] CPU: 6 PID: 17284 Comm: xen-hptool Tainted: G           O   =
   4.19.0+1 #1=0A=
[  634.817224] Hardware name: Supermicro MBI-6119G-T4/B2SS1-F, BIOS 2.0a 06=
/10/2017=0A=
[  634.817237] RIP: e030:wq_worker_waking_up+0xd/0x30=0A=
[  634.817301] Code: 59 fb ff ff b8 01 00 00 00 48 83 c4 08 c3 0f 1f 44 00 =
00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 53 89 f3 e8 53 51 00 00 <f7=
> 40 60 c8 =0A=
01 00 00 75 10 48 8b 40 40 39 58 04 75 09 f0 ff 80 00=0A=
[  634.817322] RSP: e02b:ffffc90044117c58 EFLAGS: 00010002=0A=
[  634.817329] RAX: 0000000000000000 RBX: 0000000000000004 RCX: ffff888138d=
21700=0A=
[  634.817338] RDX: 0000000000000001 RSI: 0000000000000004 RDI: ffff88812a8=
dba00=0A=
[  634.817347] RBP: ffff888138d21700 R08: ffff88812a8dba80 R09: 00000000000=
00000=0A=
[  634.817357] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00000=0A=
[  634.817366] R13: ffffc90044117c98 R14: 0000000000000000 R15: 00000000000=
00004=0A=
[  634.817386] FS:  00007f175d011740(0000) GS:ffff888138d80000(0000) knlGS:=
0000000000000000=0A=
[  634.817394] CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
[  634.817399] CR2: 0000000000000060 CR3: 0000000067974000 CR4: 00000000000=
40660=0A=
[  634.817410] Call Trace:=0A=
[  634.817417]  ttwu_do_activate+0x5f/0x80=0A=
[  634.817422]  try_to_wake_up+0x1e1/0x450=0A=
[  634.817427]  __queue_work+0x116/0x360=0A=
[  634.817432]  queue_work_on+0x24/0x40=0A=
[  634.817438]  pty_write+0x8f/0xa0=0A=
[  634.817443]  n_tty_write+0x1c5/0x480=0A=
[  634.817448]  ? do_wait_intr_irq+0xa0/0xa0=0A=
[  634.817452]  tty_write+0x154/0x2c0=0A=
[  634.817457]  ? process_echoes+0x70/0x70=0A=
[  634.817462]  __vfs_write+0x36/0x1a0=0A=
[  634.817468]  ? do_vfs_ioctl+0xa9/0x630=0A=
[  634.817472]  vfs_write+0xad/0x1a0=0A=
[  634.817477]  ksys_write+0x52/0xc0=0A=
[  634.817482]  do_syscall_64+0x4e/0x100=0A=
[  634.817488]  entry_SYSCALL_64_after_hwframe+0x44/0xa9=0A=
[  634.817494] RIP: 0033:0x7f175c0b9cd0=0A=
[  634.817499] Code: 73 01 c3 48 8b 0d c0 61 2d 00 f7 d8 64 89 01 48 83 c8 =
ff c3 66 0f 1f 44 00 00 83 3d cd c2 2d 00 00 75 10 b8 01 00 00 00 0f 05 <48=
> 3d 01 f0 =0A=
ff ff 73 31 c3 48 83 ec 08 e8 ee cb 01 00 48 89 04 24=0A=
[  634.817514] RSP: 002b:00007ffc6651bfd8 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000001=0A=
[  634.817521] RAX: ffffffffffffffda RBX: 000000000000001b RCX: 00007f175c0=
b9cd0=0A=
[  634.817528] RDX: 000000000000001b RSI: 00007f175d021000 RDI: 00000000000=
00001=0A=
[  634.817535] RBP: 00007f175d021000 R08: 0a796c6c75667373 R09: 00007f175c0=
1716d=0A=
[  634.817542] R10: 00007ffc6651c0a0 R11: 0000000000000246 R12: 00007f175c3=
91400=0A=
[  634.817548] R13: 000000000000001b R14: 0000000000000d70 R15: 00007f175c3=
8c858=0A=
[  634.817556] Modules linked in: nfsv3 nfs_acl nfs lockd grace fscache bnx=
2fc(O) cnic(O) uio fcoe libfcoe libfc scsi_transport_fc openvswitch nsh nf_=
nat_ipv6 =0A=
nf_nat_ipv4 nf_conncount nf_nat 8021q garp mrp stp llc ipt_REJECT nf_reject=
_ipv4 xt_tcpudp xt_multiport xt_conntrack nf_conntrack nf_defrag_ipv6 nf_de=
frag_ipv4 =0A=
libcrc32c iptable_filter dm_multipath sunrpc dm_mod intel_powerclamp crct10=
dif_pclmul crc32_pclmul ghash_clmulni_intel pcbc aesni_intel aes_x86_64 cry=
pto_simd =0A=
ipmi_si cryptd glue_helper ipmi_devintf ipmi_msghandler mei_me mei intel_ra=
pl_perf sg intel_pch_thermal ie31200_edac i2c_i801 video backlight acpi_pow=
er_meter =0A=
xen_wdt ip_tables x_tables hid_generic usbhid hid sd_mod ahci libahci xhci_=
pci libata xhci_hcd intel_ish_ipc igb(O) intel_ishtp scsi_dh_rdac scsi_dh_h=
p_sw =0A=
scsi_dh_emc scsi_dh_alua=0A=
[  634.817636]  scsi_mod ipv6 crc_ccitt=0A=
[  634.817642] CR2: 0000000000000060=0A=
[  634.817647] ---[ end trace b370af17485413d2 ]---=0A=
[  634.872560] RIP: e030:wq_worker_waking_up+0xd/0x30=0A=
[  634.872566] Code: 59 fb ff ff b8 01 00 00 00 48 83 c4 08 c3 0f 1f 44 00 =
00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 53 89 f3 e8 53 51 00 00 <f7=
> 40 60 c8 =0A=
01 00 00 75 10 48 8b 40 40 39 58 04 75 09 f0 ff 80 00=0A=
[  634.872582] RSP: e02b:ffffc90044117c58 EFLAGS: 00010002=0A=
[  634.872587] RAX: 0000000000000000 RBX: 0000000000000004 RCX: ffff888138d=
21700=0A=
[  634.872594] RDX: 0000000000000001 RSI: 0000000000000004 RDI: ffff88812a8=
dba00=0A=
[  634.872601] RBP: ffff888138d21700 R08: ffff88812a8dba80 R09: 00000000000=
00000=0A=
[  634.872608] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00000=0A=
[  634.872614] R13: ffffc90044117c98 R14: 0000000000000000 R15: 00000000000=
00004=0A=
[  634.872627] FS:  00007f175d011740(0000) GS:ffff888138d80000(0000) knlGS:=
0000000000000000=0A=
[  634.872634] CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
[  634.872640] CR2: 0000000000000060 CR3: 0000000067974000 CR4: 00000000000=
40660=0A=
=0A=
--=0A=
Thanks,=0A=
Sergey=0A=
=0A=

