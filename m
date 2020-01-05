Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C55013053A
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 01:47:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inu06-0005Rt-Ez; Sun, 05 Jan 2020 00:42:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BhB7=22=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1inu04-0005Ro-Tx
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 00:42:37 +0000
X-Inumbo-ID: 438638b6-2f54-11ea-a8f3-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 438638b6-2f54-11ea-a8f3-12813bfff9fa;
 Sun, 05 Jan 2020 00:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578184954;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to;
 bh=a8t3ZAsEm76uaAgpa52aBHLoe3a2HSWu14Oz0TPDyGs=;
 b=KGdLCdl5+D6W4v1aXtvJG3xQENhzp5qVNtafmnCbGSKysDfaOt6rt6WX
 zbakX7lS2Ele8ryYyvPpSwTZOJnR97GrZppxnE7QlcD7L8M0glqiZ8ozY
 OV9jSDqENT04Pew3h5gzoOZ4ULVLsFOxznfZwVNF7U5UdSttqsiiGS6EL E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aJvn61/x0dq/GXH3d13o3PBKsY+PLtiyFzdIuvePQbJ33BDP9iuV03eJyh+YTt18dp6MgUR7eG
 yISX5GFFeaMFN5pipK2r3JSNqBV2QNrEbHGmG87AnBlWJ2lXqG8lJUH9jL4s/UwLJloHhbAgtS
 /6McViwnYy2nwahjIVHvWDVPU2D9zaLPecY/u1HOZnafIOZIlOSWKUlB5/dvgH47TiTPZFvf8E
 +q6kbiFzwoqMidTWkrP/Qb51phqFYw83rFYlgGvrx+1Z5cUM6NRyyQGf7Bly4iFlbIRBFYayMS
 YjE=
X-SBRS: 2.7
X-MesageID: 10887241
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,396,1571716800"; 
 d="asc'?scan'208";a="10887241"
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <20200104153032.GA2995@mail-itl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <5fdae943-3cc7-6dcf-3a2d-33b7df83cec8@citrix.com>
Date: Sun, 5 Jan 2020 00:42:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200104153032.GA2995@mail-itl>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Xen crash on S3 resume on 4.13 and unstable if any
 CPU is re-offlined
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
Cc: =?UTF-8?Q?Micha=c5=82_Kowalczyk?= <mkow@invisiblethingslab.com>
Content-Type: multipart/mixed; boundary="===============3898976756060096067=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3898976756060096067==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="JfZpYw5O9yqo8V7WUfCNXRGctlViPo8pt"

--JfZpYw5O9yqo8V7WUfCNXRGctlViPo8pt
Content-Type: multipart/mixed; boundary="1Z5AFXVHRnpkJuITT5IkndzqR5giPT6QZ";
 protected-headers="v1"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Micha=c5=82_Kowalczyk?= <mkow@invisiblethingslab.com>
Message-ID: <5fdae943-3cc7-6dcf-3a2d-33b7df83cec8@citrix.com>
Subject: Re: Xen crash on S3 resume on 4.13 and unstable if any CPU is
 re-offlined
References: <20200104153032.GA2995@mail-itl>
In-Reply-To: <20200104153032.GA2995@mail-itl>

--1Z5AFXVHRnpkJuITT5IkndzqR5giPT6QZ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

On 04/01/2020 15:30, Marek Marczykowski-G=C3=B3recki wrote:
> Hi,
>
> I have a reliable crash on resume from S3. I can reproduce it on both
> real hardware and nested within KVM, although call traces are different=

> between those platforms. In any case, it happens only if some CPU is to=

> be re-offlined after resume (smt=3Doff and/or maxcpus=3D... options).
>
> I think the crash from the real hardware gives more clues, but the one
> from qemu may also be interesting, maybe it's even another bug?
>
> The crash message (full console log attached):
>
> (XEN) mce_intel.c:772: MCA Capability: firstbank 0, extended MCE MSR 0,=
 BCAST, CMCI
> (XEN) CPU0 CMCI LVT vector (0xf2) already installed
> (XEN) Finishing wakeup from ACPI S3 state.
> (XEN) Enabling non-boot CPUs  ...
> (XEN) ----[ Xen-4.14-unstable  x86_64  debug=3Dy   Not tainted ]----
> (XEN) CPU:    0
> (XEN) RIP:    e008:[<ffff82d08023beb7>] schedule.c#cpu_schedule_callbac=
k+0xea/0x1a1
> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor
> (XEN) rax: 0000000000000000   rbx: ffff82d080453348   rcx: ffff82d08058=
4020
> (XEN) rdx: 000000339b66e000   rsi: 0000000000008005   rdi: ffff82d08045=
3340
> (XEN) rbp: ffff8300ca45fd68   rsp: ffff8300ca45fd68   r8:  000000000000=
0004
> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 800000000000=
0000
> (XEN) r12: ffff82d080453340   r13: ffff82d080453200   r14: 000000000000=
8005
> (XEN) r15: 0000000000008000   cr0: 000000008005003b   cr4: 000000000004=
26e0
> (XEN) cr3: 00000000ca44f000   cr2: 0000000000000008
> (XEN) fsb: 000079d5e4f9e740   gsb: ffff888135600000   gss: 000000000000=
0000
> (XEN) ds: 0018   es: 0010   fs: b800   gs: 0010   ss: 0000   cs: e008
> (XEN) Xen code around <ffff82d08023beb7> (schedule.c#cpu_schedule_callb=
ack+0xea/0x1a1):
> (XEN)  48 8b 14 d1 48 8b 04 02 <48> 8b 48 08 48 85 c9 74 64 48 8b 05 b9=
 c3 32 00
> (XEN) Xen stack trace from rsp=3Dffff8300ca45fd68:
> (XEN)    ffff8300ca45fdb0 ffff82d080221289 ffff8300ca45fdd8 00000000000=
00001
> (XEN)    0000000000000000 00000000ffffffef ffff8300ca45fe00 00000000000=
00001
> (XEN)    0000000000000200 ffff8300ca45fdc8 ffff82d080203476 00000000000=
00001
> (XEN)    ffff8300ca45fdf0 ffff82d080203550 0000000000000000 00000000000=
00001
> (XEN)    0000000000000000 ffff8300ca45fe20 ffff82d080203999 ffff8300ca4=
5fef8
> (XEN)    0000000000000000 0000000000000003 00000000000426e0 ffff8300ca4=
5fe58
> (XEN)    ffff82d0802e4240 ffff83042896c5f0 ffff83041bb4d000 00000000000=
00000
> (XEN)    0000000000000000 ffff83041bb73000 ffff8300ca45fe78 ffff82d0802=
0828f
> (XEN)    ffff83041bb4d1b8 ffff82d080567210 ffff8300ca45fe90 ffff82d0802=
3fd39
> (XEN)    ffff82d080567200 ffff8300ca45fec0 ffff82d08024001a 00000000000=
00000
> (XEN)    ffff82d080567210 ffff82d08056d980 ffff82d080584020 ffff8300ca4=
5fef0
> (XEN)    ffff82d08027247a ffff83041bbb2000 ffff83041bb4d000 ffff83041bb=
b3000
> (XEN)    0000000000000000 ffff8300ca45fd98 0000000000000003 ffffffff820=
ae496
> (XEN)    0000000000000003 0000000000000000 0000000000002003 ffffffff822=
c6868
> (XEN)    0000000000000246 0000000000003403 00000000ffff0000 00000000000=
00000
> (XEN)    0000000000000000 ffffffff810010ea 0000000000002003 00000000000=
00010
> (XEN)    deadbeefdeadf00d 0000010000000000 ffffffff810010ea 00000000000=
0e033
> (XEN)    0000000000000246 ffffc900011abbe8 000000000000e02b 003b4a89004=
5ffe0
> (XEN)    003b4ddf00098fa8 003b4e0300000001 003b499d0045ffe0 0000e010000=
00000
> (XEN)    ffff83041bbb2000 0000000000000000 00000000000426e0 00000000000=
00000
> (XEN) Xen call trace:
> (XEN)    [<ffff82d08023beb7>] R schedule.c#cpu_schedule_callback+0xea/0=
x1a1
> (XEN)    [<ffff82d080221289>] F notifier_call_chain+0x6b/0x96
> (XEN)    [<ffff82d080203476>] F cpu.c#cpu_notifier_call_chain+0x1b/0x33=

> (XEN)    [<ffff82d080203550>] F cpu_down+0x5e/0x15c
> (XEN)    [<ffff82d080203999>] F enable_nonboot_cpus+0x113/0x1fb
> (XEN)    [<ffff82d0802e4240>] F power.c#enter_state_helper+0x107/0x51b
> (XEN)    [<ffff82d08020828f>] F domain.c#continue_hypercall_tasklet_han=
dler+0x8b/0xb7
> (XEN)    [<ffff82d08023fd39>] F tasklet.c#do_tasklet_work+0x76/0xa9
> (XEN)    [<ffff82d08024001a>] F do_tasklet+0x58/0x8a
> (XEN)    [<ffff82d08027247a>] F domain.c#idle_loop+0x40/0x96
> (XEN)=20
> (XEN) Pagetable walk from 0000000000000008:
> (XEN)  L4[0x000] =3D 000000041bbff063 ffffffffffffffff
> (XEN)  L3[0x000] =3D 000000041bbfe063 ffffffffffffffff
> (XEN)  L2[0x000] =3D 000000041bbfd063 ffffffffffffffff
> (XEN)  L1[0x000] =3D 0000000000000000 ffffffffffffffff
> (XEN)=20
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) FATAL PAGE FAULT
> (XEN) [error_code=3D0000]
> (XEN) Faulting linear address: 0000000000000008
> (XEN) ****************************************
>
> And the one from qemu:
>
> (XEN) mce_intel.c:772: MCA Capability: firstbank 1, extended MCE MSR 0,=
 SER
> (XEN) Finishing wakeup from ACPI S3 state.
> (XEN) Enabling non-boot CPUs  ...
> (XEN) Assertion 'c2rqd(ops, sched_unit_master(unit)) =3D=3D svc->rqd' f=
ailed at sched_credit2.c:2137
> (XEN) ----[ Xen-4.14-unstable  x86_64  debug=3Dy   Not tainted ]----
> (XEN) CPU:    1
> (XEN) RIP:    e008:[<ffff82d08022fe1a>] sched_credit2.c#csched2_unit_wa=
ke+0x174/0x176
> (XEN) RFLAGS: 0000000000010097   CONTEXT: hypervisor (d0v0)
> (XEN) rax: ffff83013a7313e8   rbx: ffff83013a6bdf40   rcx: 000000000000=
0051
> (XEN) rdx: ffff83013a731160   rsi: ffff83013a7310e0   rdi: 000000000000=
0003
> (XEN) rbp: ffff83013a6f7d98   rsp: ffff83013a6f7d78   r8:  deadbeefdead=
f00d
> (XEN) r9:  deadbeefdeadf00d   r10: 0000000000000000   r11: 000000000000=
0000
> (XEN) r12: ffff83013a6bc7e0   r13: ffff82d08043e720   r14: 000000000000=
0003
> (XEN) r15: 00000003c5ffecac   cr0: 0000000080050033   cr4: 000000000000=
0660
> (XEN) cr3: 000000004b005000   cr2: 0000000000000000
> (XEN) fsb: 00007751649f4740   gsb: ffff888134a00000   gss: 000000000000=
0000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> (XEN) Xen code around <ffff82d08022fe1a> (sched_credit2.c#csched2_unit_=
wake+0x174/0x176):
> (XEN)  ef e8 1e c1 ff ff eb a7 <0f> 0b 55 48 89 e5 41 57 41 56 41 55 41=
 54 53 48
> (XEN) Xen stack trace from rsp=3Dffff83013a6f7d78:
> (XEN)    ffff83013a6a3000 ffff83013a6bdf40 ffff83013a6bdf40 ffff83013a7=
313e8
> (XEN)    ffff83013a6f7de8 ffff82d0802391f8 0000000000000202 ffff83013a7=
313e8
> (XEN)    ffff83013a6c1018 0000000000000001 0000000000000000 00000000000=
00000
> (XEN)    ffff83013a6c1018 ffff83013a6a3000 ffff83013a6f7e58 ffff82d0802=
0906c
> (XEN)    ffff82d08035d3d4 ffff82d08035d3c8 ffff82d08035d3d4 ffff82d0803=
5d3c8
> (XEN)    ffff82d08035d3d4 ffff82d08035d3c8 ffff82d08035d3d4 ffff83013a6=
f7ef8
> (XEN)    0000000000000180 ffff83013a6aa000 deadbeefdeadf00d 00000000000=
00003
> (XEN)    ffff83013a6f7ee8 ffff82d0803570c7 0000000000000001 00000000000=
00001
> (XEN)    0000000000000000 deadbeefdeadf00d deadbeefdeadf00d ffff82d0803=
5d3c8
> (XEN)    ffff82d08035d3d4 ffff82d08035d3c8 ffff82d08035d3d4 ffff82d0803=
5d3c8
> (XEN)    ffff82d08035d3d4 ffff83013a6aa000 0000000000000000 00000000000=
00000
> (XEN)    0000000000000000 0000000000000000 00007cfec59080e7 ffff82d0803=
5d432
> (XEN)    0000000000015120 0000000000000001 0000000000000000 ffff8881302=
4a540
> (XEN)    0000000000000000 0000000000000001 0000000000000246 00000000001=
40000
> (XEN)    ffff8880bf7db000 ffffea0004be4508 0000000000000018 ffffffff810=
0130a
> (XEN)    0000000000000000 0000000000000001 0000000000000001 00000100000=
00000
> (XEN)    ffffffff8100130a 000000000000e033 0000000000000246 ffffc90000c=
97c98
> (XEN)    000000000000e02b 0000000000000000 0000000000000000 00000000000=
00000
> (XEN)    0000000000000000 0000e01000000001 ffff83013a6aa000 00000030ba1=
96000
> (XEN)    0000000000000660 0000000000000000 000000013a6e2000 00000400000=
00000
> (XEN) Xen call trace:
> (XEN)    [<ffff82d08022fe1a>] R sched_credit2.c#csched2_unit_wake+0x174=
/0x176
> (XEN)    [<ffff82d0802391f8>] F vcpu_wake+0xea/0x4d8
> (XEN)    [<ffff82d08020906c>] F do_vcpu_op+0x36f/0x687
> (XEN)    [<ffff82d0803570c7>] F pv_hypercall+0x28f/0x57d
> (XEN)    [<ffff82d08035d432>] F lstar_enter+0x112/0x120
> (XEN)=20
> (XEN)=20
> (XEN) ****************************************
> (XEN) Panic on CPU 1:
> (XEN) Assertion 'c2rqd(ops, sched_unit_master(unit)) =3D=3D svc->rqd' f=
ailed at sched_credit2.c:2137
> (XEN) ****************************************

This looks very much like the core scheduling crash found on specific
machines in S5.=C2=A0 From my analysis, it was a use-after-free on a
schedulling resource.

Does switching back to thread mode (as opposed to core mode) make the
crash go away?

~Andrew


--1Z5AFXVHRnpkJuITT5IkndzqR5giPT6QZ--

--JfZpYw5O9yqo8V7WUfCNXRGctlViPo8pt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJeETD2AAoJEGXD+Qal15+gG5UP/jmfP/tWMooeMEfhCL27ney2
ia7ZUDO5wKY/+6G4PWeccKSyIpGGinD5DAx6ckk4mG0hnkV83HNiG63QsNo/bgxK
ygOsxzX9CTZN3u5zLcCFN51Ode45Q2vm/U1M5MwJyTC/8xiqhCQQrm5VDHnk+RCj
T4ruLQ9Blx0Cv/VhTKWwHHwQUcDonSLZIYXuCzD09yQ6EWV4fg2Y8ye4FzyKWcsc
TuNnP5JpkRRZ8K3lkGQYxGlGBUZE+S5pe0x6Sf4AIhqxbA/A1dodIa74bdswNCo0
+L3SjrjLV5ekqRcWH9GaPvQSxuIi1F3yR9RJfy/Vp/zQ/7oG6ZhL0K9rjG1t4A+j
PfNxJs2kIuxYda7aaqXye9mOuL07DCgHuoZ82nxIIu/NT7KjHcaLMEi0rYh/UqpF
BtX+QEeOCyv7+NWg4wx4/WI8Qs31CuWDhhu+i1nVqucQyDTrwr3FVQMz2fUD+lto
oEcGAH81WsSMpwaxSIXgQn7Q+CMAuDT2I0HhRd6/bAt3zu3GP1H/d9m3SrENgbAn
PtNEF0fYT2PZ9clgyfhtulUkmkSnmS34skqyt+5/hNotX/l/R5LOIT3RkkaUf8gF
WU36Kje3+mj4f8+NKydart8LUmngcfjklsMEA2eBuTs7psAxTie8UcJuIwUrxZWF
aPBe3YTGLEOvFe2XxWWo
=EU8o
-----END PGP SIGNATURE-----

--JfZpYw5O9yqo8V7WUfCNXRGctlViPo8pt--


--===============3898976756060096067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3898976756060096067==--

