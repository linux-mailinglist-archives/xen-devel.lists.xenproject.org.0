Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2406A1306AA
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 08:46:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1io0Vs-0005dQ-Tv; Sun, 05 Jan 2020 07:39:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3GeW=22=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1io0Vr-0005dL-8P
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 07:39:51 +0000
X-Inumbo-ID: 8db3bd20-2f8e-11ea-a9e4-12813bfff9fa
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8db3bd20-2f8e-11ea-a9e4-12813bfff9fa;
 Sun, 05 Jan 2020 07:39:49 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 9C64B21470;
 Sun,  5 Jan 2020 02:39:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sun, 05 Jan 2020 02:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7UeZhY
 stbZvQwDEcy9Kgr0BGtFystoskqGR6bBgwnks=; b=xT4cz9hA25XAJXh6XtFxMx
 kH9hAjZzlmo4xZ8O+EY1eQCV1k+YeyzoviekjHw8WYx2sAQuWVH1I/WB5p42G1Qp
 PO5kNHLjBGnx6K74ys9OCojRpLLROuFJX6kOV9dQJCRxSiuGDWDJqvI7MJOal/ga
 CrWXwNJcCZ78tb92sXY4zrcXdFuP04BP1fiXSQR33Nxi84/Z8FUNttMep1YtZwN5
 e5eSuS4+sJPtVZWpXS1YrIJtSWxGCXMHK7hxr1lJ/X4N/N6m+BsM1b5S2qrzbKhV
 08Syr9r2/XdTtG8Z0ozCXvvny36qDU0kBhfskb/CWJGsfcPxYARPgzpnXqyZJ4Uw
 ==
X-ME-Sender: <xms:xZIRXtb_0ksfcOWQOqQCGKRjOwQ9mA6LsrHYXG-cZsRbSqnhs9WSvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdegjedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:xZIRXhybudvV56w72Wbnp-z5Tkutz8p4TVDfwbrnNHJUjFypq7uZrA>
 <xmx:xZIRXpdDpFdWhpUzgNyFlvcrOzxX9mGe3OC1Q9pdP_9btQ0rg6KHCA>
 <xmx:xZIRXm4zWbAzO0QG_e6SC2qwsPY-GV0q5GiVx39vOd4hPF6ZtvNCJA>
 <xmx:xZIRXpb0AAvcmdoYMRfmxUTXeKvFfsa3wTc9_kaOwUDtms_1Kc_EFg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id A071A3060774;
 Sun,  5 Jan 2020 02:39:48 -0500 (EST)
Date: Sun, 5 Jan 2020 08:39:45 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200105073945.GF1314@mail-itl>
References: <20200104153032.GA2995@mail-itl>
 <5fdae943-3cc7-6dcf-3a2d-33b7df83cec8@citrix.com>
MIME-Version: 1.0
In-Reply-To: <5fdae943-3cc7-6dcf-3a2d-33b7df83cec8@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?Q?Micha=C5=82?= Kowalczyk <mkow@invisiblethingslab.com>
Content-Type: multipart/mixed; boundary="===============1953078722927601805=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1953078722927601805==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Content-Disposition: inline


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Xen crash on S3 resume on 4.13 and unstable if any CPU is
 re-offlined

On Sun, Jan 05, 2020 at 12:42:30AM +0000, Andrew Cooper wrote:
> On 04/01/2020 15:30, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >
> > I have a reliable crash on resume from S3. I can reproduce it on both
> > real hardware and nested within KVM, although call traces are different
> > between those platforms. In any case, it happens only if some CPU is to
> > be re-offlined after resume (smt=3Doff and/or maxcpus=3D... options).
> >
> > I think the crash from the real hardware gives more clues, but the one
> > from qemu may also be interesting, maybe it's even another bug?
> >
> > The crash message (full console log attached):
> >
> > (XEN) mce_intel.c:772: MCA Capability: firstbank 0, extended MCE MSR 0,=
 BCAST, CMCI
> > (XEN) CPU0 CMCI LVT vector (0xf2) already installed
> > (XEN) Finishing wakeup from ACPI S3 state.
> > (XEN) Enabling non-boot CPUs  ...
> > (XEN) ----[ Xen-4.14-unstable  x86_64  debug=3Dy   Not tainted ]----
> > (XEN) CPU:    0
> > (XEN) RIP:    e008:[<ffff82d08023beb7>] schedule.c#cpu_schedule_callbac=
k+0xea/0x1a1
> > (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor
> > (XEN) rax: 0000000000000000   rbx: ffff82d080453348   rcx: ffff82d08058=
4020
> > (XEN) rdx: 000000339b66e000   rsi: 0000000000008005   rdi: ffff82d08045=
3340
> > (XEN) rbp: ffff8300ca45fd68   rsp: ffff8300ca45fd68   r8:  000000000000=
0004
> > (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 800000000000=
0000
> > (XEN) r12: ffff82d080453340   r13: ffff82d080453200   r14: 000000000000=
8005
> > (XEN) r15: 0000000000008000   cr0: 000000008005003b   cr4: 000000000004=
26e0
> > (XEN) cr3: 00000000ca44f000   cr2: 0000000000000008
> > (XEN) fsb: 000079d5e4f9e740   gsb: ffff888135600000   gss: 000000000000=
0000
> > (XEN) ds: 0018   es: 0010   fs: b800   gs: 0010   ss: 0000   cs: e008
> > (XEN) Xen code around <ffff82d08023beb7> (schedule.c#cpu_schedule_callb=
ack+0xea/0x1a1):
> > (XEN)  48 8b 14 d1 48 8b 04 02 <48> 8b 48 08 48 85 c9 74 64 48 8b 05 b9=
 c3 32 00
> > (XEN) Xen stack trace from rsp=3Dffff8300ca45fd68:
> > (XEN)    ffff8300ca45fdb0 ffff82d080221289 ffff8300ca45fdd8 00000000000=
00001
> > (XEN)    0000000000000000 00000000ffffffef ffff8300ca45fe00 00000000000=
00001
> > (XEN)    0000000000000200 ffff8300ca45fdc8 ffff82d080203476 00000000000=
00001
> > (XEN)    ffff8300ca45fdf0 ffff82d080203550 0000000000000000 00000000000=
00001
> > (XEN)    0000000000000000 ffff8300ca45fe20 ffff82d080203999 ffff8300ca4=
5fef8
> > (XEN)    0000000000000000 0000000000000003 00000000000426e0 ffff8300ca4=
5fe58
> > (XEN)    ffff82d0802e4240 ffff83042896c5f0 ffff83041bb4d000 00000000000=
00000
> > (XEN)    0000000000000000 ffff83041bb73000 ffff8300ca45fe78 ffff82d0802=
0828f
> > (XEN)    ffff83041bb4d1b8 ffff82d080567210 ffff8300ca45fe90 ffff82d0802=
3fd39
> > (XEN)    ffff82d080567200 ffff8300ca45fec0 ffff82d08024001a 00000000000=
00000
> > (XEN)    ffff82d080567210 ffff82d08056d980 ffff82d080584020 ffff8300ca4=
5fef0
> > (XEN)    ffff82d08027247a ffff83041bbb2000 ffff83041bb4d000 ffff83041bb=
b3000
> > (XEN)    0000000000000000 ffff8300ca45fd98 0000000000000003 ffffffff820=
ae496
> > (XEN)    0000000000000003 0000000000000000 0000000000002003 ffffffff822=
c6868
> > (XEN)    0000000000000246 0000000000003403 00000000ffff0000 00000000000=
00000
> > (XEN)    0000000000000000 ffffffff810010ea 0000000000002003 00000000000=
00010
> > (XEN)    deadbeefdeadf00d 0000010000000000 ffffffff810010ea 00000000000=
0e033
> > (XEN)    0000000000000246 ffffc900011abbe8 000000000000e02b 003b4a89004=
5ffe0
> > (XEN)    003b4ddf00098fa8 003b4e0300000001 003b499d0045ffe0 0000e010000=
00000
> > (XEN)    ffff83041bbb2000 0000000000000000 00000000000426e0 00000000000=
00000
> > (XEN) Xen call trace:
> > (XEN)    [<ffff82d08023beb7>] R schedule.c#cpu_schedule_callback+0xea/0=
x1a1
> > (XEN)    [<ffff82d080221289>] F notifier_call_chain+0x6b/0x96
> > (XEN)    [<ffff82d080203476>] F cpu.c#cpu_notifier_call_chain+0x1b/0x33
> > (XEN)    [<ffff82d080203550>] F cpu_down+0x5e/0x15c
> > (XEN)    [<ffff82d080203999>] F enable_nonboot_cpus+0x113/0x1fb
> > (XEN)    [<ffff82d0802e4240>] F power.c#enter_state_helper+0x107/0x51b
> > (XEN)    [<ffff82d08020828f>] F domain.c#continue_hypercall_tasklet_han=
dler+0x8b/0xb7
> > (XEN)    [<ffff82d08023fd39>] F tasklet.c#do_tasklet_work+0x76/0xa9
> > (XEN)    [<ffff82d08024001a>] F do_tasklet+0x58/0x8a
> > (XEN)    [<ffff82d08027247a>] F domain.c#idle_loop+0x40/0x96
> > (XEN)=20
> > (XEN) Pagetable walk from 0000000000000008:
> > (XEN)  L4[0x000] =3D 000000041bbff063 ffffffffffffffff
> > (XEN)  L3[0x000] =3D 000000041bbfe063 ffffffffffffffff
> > (XEN)  L2[0x000] =3D 000000041bbfd063 ffffffffffffffff
> > (XEN)  L1[0x000] =3D 0000000000000000 ffffffffffffffff
> > (XEN)=20
> > (XEN) ****************************************
> > (XEN) Panic on CPU 0:
> > (XEN) FATAL PAGE FAULT
> > (XEN) [error_code=3D0000]
> > (XEN) Faulting linear address: 0000000000000008
> > (XEN) ****************************************
> >
> > And the one from qemu:
> >
> > (XEN) mce_intel.c:772: MCA Capability: firstbank 1, extended MCE MSR 0,=
 SER
> > (XEN) Finishing wakeup from ACPI S3 state.
> > (XEN) Enabling non-boot CPUs  ...
> > (XEN) Assertion 'c2rqd(ops, sched_unit_master(unit)) =3D=3D svc->rqd' f=
ailed at sched_credit2.c:2137
> > (XEN) ----[ Xen-4.14-unstable  x86_64  debug=3Dy   Not tainted ]----
> > (XEN) CPU:    1
> > (XEN) RIP:    e008:[<ffff82d08022fe1a>] sched_credit2.c#csched2_unit_wa=
ke+0x174/0x176
> > (XEN) RFLAGS: 0000000000010097   CONTEXT: hypervisor (d0v0)
> > (XEN) rax: ffff83013a7313e8   rbx: ffff83013a6bdf40   rcx: 000000000000=
0051
> > (XEN) rdx: ffff83013a731160   rsi: ffff83013a7310e0   rdi: 000000000000=
0003
> > (XEN) rbp: ffff83013a6f7d98   rsp: ffff83013a6f7d78   r8:  deadbeefdead=
f00d
> > (XEN) r9:  deadbeefdeadf00d   r10: 0000000000000000   r11: 000000000000=
0000
> > (XEN) r12: ffff83013a6bc7e0   r13: ffff82d08043e720   r14: 000000000000=
0003
> > (XEN) r15: 00000003c5ffecac   cr0: 0000000080050033   cr4: 000000000000=
0660
> > (XEN) cr3: 000000004b005000   cr2: 0000000000000000
> > (XEN) fsb: 00007751649f4740   gsb: ffff888134a00000   gss: 000000000000=
0000
> > (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> > (XEN) Xen code around <ffff82d08022fe1a> (sched_credit2.c#csched2_unit_=
wake+0x174/0x176):
> > (XEN)  ef e8 1e c1 ff ff eb a7 <0f> 0b 55 48 89 e5 41 57 41 56 41 55 41=
 54 53 48
> > (XEN) Xen stack trace from rsp=3Dffff83013a6f7d78:
> > (XEN)    ffff83013a6a3000 ffff83013a6bdf40 ffff83013a6bdf40 ffff83013a7=
313e8
> > (XEN)    ffff83013a6f7de8 ffff82d0802391f8 0000000000000202 ffff83013a7=
313e8
> > (XEN)    ffff83013a6c1018 0000000000000001 0000000000000000 00000000000=
00000
> > (XEN)    ffff83013a6c1018 ffff83013a6a3000 ffff83013a6f7e58 ffff82d0802=
0906c
> > (XEN)    ffff82d08035d3d4 ffff82d08035d3c8 ffff82d08035d3d4 ffff82d0803=
5d3c8
> > (XEN)    ffff82d08035d3d4 ffff82d08035d3c8 ffff82d08035d3d4 ffff83013a6=
f7ef8
> > (XEN)    0000000000000180 ffff83013a6aa000 deadbeefdeadf00d 00000000000=
00003
> > (XEN)    ffff83013a6f7ee8 ffff82d0803570c7 0000000000000001 00000000000=
00001
> > (XEN)    0000000000000000 deadbeefdeadf00d deadbeefdeadf00d ffff82d0803=
5d3c8
> > (XEN)    ffff82d08035d3d4 ffff82d08035d3c8 ffff82d08035d3d4 ffff82d0803=
5d3c8
> > (XEN)    ffff82d08035d3d4 ffff83013a6aa000 0000000000000000 00000000000=
00000
> > (XEN)    0000000000000000 0000000000000000 00007cfec59080e7 ffff82d0803=
5d432
> > (XEN)    0000000000015120 0000000000000001 0000000000000000 ffff8881302=
4a540
> > (XEN)    0000000000000000 0000000000000001 0000000000000246 00000000001=
40000
> > (XEN)    ffff8880bf7db000 ffffea0004be4508 0000000000000018 ffffffff810=
0130a
> > (XEN)    0000000000000000 0000000000000001 0000000000000001 00000100000=
00000
> > (XEN)    ffffffff8100130a 000000000000e033 0000000000000246 ffffc90000c=
97c98
> > (XEN)    000000000000e02b 0000000000000000 0000000000000000 00000000000=
00000
> > (XEN)    0000000000000000 0000e01000000001 ffff83013a6aa000 00000030ba1=
96000
> > (XEN)    0000000000000660 0000000000000000 000000013a6e2000 00000400000=
00000
> > (XEN) Xen call trace:
> > (XEN)    [<ffff82d08022fe1a>] R sched_credit2.c#csched2_unit_wake+0x174=
/0x176
> > (XEN)    [<ffff82d0802391f8>] F vcpu_wake+0xea/0x4d8
> > (XEN)    [<ffff82d08020906c>] F do_vcpu_op+0x36f/0x687
> > (XEN)    [<ffff82d0803570c7>] F pv_hypercall+0x28f/0x57d
> > (XEN)    [<ffff82d08035d432>] F lstar_enter+0x112/0x120
> > (XEN)=20
> > (XEN)=20
> > (XEN) ****************************************
> > (XEN) Panic on CPU 1:
> > (XEN) Assertion 'c2rqd(ops, sched_unit_master(unit)) =3D=3D svc->rqd' f=
ailed at sched_credit2.c:2137
> > (XEN) ****************************************
>=20
> This looks very much like the core scheduling crash found on specific
> machines in S5.=C2=A0 From my analysis, it was a use-after-free on a
> schedulling resource.
>=20
> Does switching back to thread mode (as opposed to core mode) make the
> crash go away?

It is the thread mode (unless default has changed).


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4RksAACgkQ24/THMrX
1yyfHwf+LdUAxZoi370hI3575xZrUsZ2ceW27AdgfkDqTVekikehz544GcnYkx0i
PpvfSvXL/M7bYPWlmjPk/w9syz4XOKcbULMhq5VYo27cYQYXqy7lKfbGaoWYPfS0
XYsmcue+U3tFMna6qUOKuhJR/hf0LGcTek9VwVT8lkLhZYJX5JpwZWSmDeL+4/wq
GsYUp6ajFsLNfwaBV2LwHE19+qW4duksP5opFnSU+NOz1+Sqg9kJkfYSrWL41gp2
nNZ58bI9PLFTeRg3BqnHzprmbq1tyH6fFh0CTlYSiScpFoAAMzjkBkLWKD/HAdVJ
hhkQ/zeVY82taQFlwFIZO4IkeugP1Q==
=Bu4p
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--


--===============1953078722927601805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1953078722927601805==--

