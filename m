Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0194B282421
	for <lists+xen-devel@lfdr.de>; Sat,  3 Oct 2020 14:45:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2538.7298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOgul-0003i0-BU; Sat, 03 Oct 2020 12:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2538.7298; Sat, 03 Oct 2020 12:45:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOgul-0003hb-83; Sat, 03 Oct 2020 12:45:27 +0000
Received: by outflank-mailman (input) for mailman id 2538;
 Sat, 03 Oct 2020 12:45:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDDO=DK=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kOguj-0003hU-V3
 for xen-devel@lists.xenproject.org; Sat, 03 Oct 2020 12:45:26 +0000
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5903b2bf-f866-4e7a-8d27-aa04cd8a28af;
 Sat, 03 Oct 2020 12:45:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EBD8D5C00D0;
 Sat,  3 Oct 2020 08:45:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 03 Oct 2020 08:45:24 -0400
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 79E7B3064680;
 Sat,  3 Oct 2020 08:45:23 -0400 (EDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CDDO=DK=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kOguj-0003hU-V3
	for xen-devel@lists.xenproject.org; Sat, 03 Oct 2020 12:45:26 +0000
X-Inumbo-ID: 5903b2bf-f866-4e7a-8d27-aa04cd8a28af
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5903b2bf-f866-4e7a-8d27-aa04cd8a28af;
	Sat, 03 Oct 2020 12:45:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id EBD8D5C00D0;
	Sat,  3 Oct 2020 08:45:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 03 Oct 2020 08:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bh8hCQ
	WdjNGiDYJPTf/ASdV70PU50sF3IrSRDLvbyzs=; b=Y0r5UnfOTNtSrLOhrjSO5+
	D7wgnsKaktsLYegSpNsS0fKCj5+YUoWwXT60YGmd/mCegHNIPPU/H6Jl3NbYxI/0
	VLcGyzcGT6BeGL8tXoXHCGegVGlrXR0B70p4Zxeu7qYY5CcB/9XPhfQUQtIKaoXm
	taALtYjz+omdWMwMEblYGQomwC7lGHkBBK7ush3B+o86gV/wRTybi4iLb0ESs+Fg
	3fedV4j17nj4B5uWgN4o7qBADWBjJiy1afga6jDXv0Cf9h3DPQiY4/MBGVvhedQs
	7x1Ofzr/+V8t0Ykv9n6097za71XfrXxjbcQpxQNafBMvRLAnVPy562kBNVDWPAZg
	==
X-ME-Sender: <xms:ZHJ4XyZYUnZlQz-3_yXmE6W1GDrRmerr-x0wvdOyF2HgusbL2_Va1Q>
    <xme:ZHJ4X1bIP9uG3apMqeJWfSc9KDw34g3g1kRvNYzPRnasV2J7VARv5zN3nnS7-W6Ax
    VIfoT01HxDuew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeekgdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppeelud
    drieegrddujedtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:ZHJ4X8_ozeIAHamaaSBzMnq_dnpQhX3dVUjAj_nJLYQXKj5QAKWFqg>
    <xmx:ZHJ4X0qGjfaSQYtTyod7qgzXcM4mXtusq3bqWhBOPDnSoLtLeWR1qg>
    <xmx:ZHJ4X9ptZFXGM4OOALKTWAJ3Q8nv8Pdb3e9PNwAqNMebBYhkc-H76g>
    <xmx:ZHJ4X-BQryjGadPzp-2nHEcwUsTeMA2tFCUd_LO5dx4e88K_ozYLEg>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id 79E7B3064680;
	Sat,  3 Oct 2020 08:45:23 -0400 (EDT)
Date: Sat, 3 Oct 2020 14:45:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Yet another S3 issue in Xen 4.14
Message-ID: <20201003124518.GA104458@mail-itl>
References: <20201001011245.GL3962@mail-itl>
 <a80ad59b-feb1-01c8-2b14-dbf6568d0ff5@suse.com>
 <20201001123129.GJ1482@mail-itl>
 <1e596ccc-a875-93f1-2619-e4dbcbd88b4d@citrix.com>
 <20201002150859.GM3962@mail-itl>
 <454ac9ce-012f-f2e7-722d-c5304fd3146f@suse.com>
 <aa5e1a7b-3724-bdc1-a313-0598aabd181f@citrix.com>
 <20201002191951.GA104059@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <20201002191951.GA104059@mail-itl>


--+QahgC5+KEYLbs62
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Yet another S3 issue in Xen 4.14

On Fri, Oct 02, 2020 at 09:19:55PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Disabling efi_get_time() or setting CR4 earlier solves _this_ issue, but
> applied on top of stable-4.14 still doesn't work. Looks like there is
> yet another S3 breakage in between. I'm bisecting it further...

This time I get to this commit:

commit 8e2aa76dc1670e82eaa15683353853bc66bf54fc (refs/bisect/bad)
Author: Dario Faggioli <dfaggioli@suse.com>
Date:   Thu May 28 23:29:44 2020 +0200

    xen: credit2: limit the max number of CPUs in a runqueue

The failing effect after S3 resume is slightly different and not really
deterministic - sometimes it hangs immediately, sometimes the system is
interactive for few seconds and then hangs and sometimes it crashes
(looks like panic).

I've tried to switch to credit1, but this seems to be broken in yet
another way, much earlier (commits at which S3 works with credit2,
crashes on S3 resume with credit1).

(few hours later)

I managed to setup kdump kernel and got a copy of vmcore after the
crash. Then extracted crash message using strings:

(XEN) Entering ACPI S3 state.
(XEN) [VT-D]Passed iommu=3Dno-igfx option.  Disabling IGD VT-d engine.
(XEN) mce_intel.c:773: MCA Capability: firstbank 0, extended MCE MSR 0, BCA=
ST, CMCI
(XEN) CPU0 CMCI LVT vector (0xf1) already installed
(XEN) Finishing wakeup from ACPI S3 state.
(XEN) Enabling non-boot CPUs  ...
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) [VT-D]intremap.c:564: MSI index (65535) has an empty entry
(XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd' failed at =
credit2.c:2273
(XEN) ----[ Xen-4.14-unstable  x86_64  debug=3Dy   Not tainted ]----
(XEN) CPU:    8
(XEN) RIP:    e008:[<ffff82d040242725>] credit2.c#csched2_unit_wake+0x14f/0=
x151
(XEN) RFLAGS: 0000000000010087   CONTEXT: hypervisor (d0v0)
(XEN) rax: ffff830250b609e0   rbx: ffff830250b18f10   rcx: 0000003210631000
(XEN) rdx: ffff830250b604a0   rsi: 0000000000000008   rdi: ffff830250b60846
(XEN) rbp: ffff830250ba7d98   rsp: ffff830250ba7d78   r8:  deadbeefdeadf00d
(XEN) r9:  deadbeefdeadf00d   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: ffff830250b0e040   r13: ffff82d04044abc0   r14: 0000000000000008
(XEN) r15: 2f3d053d56f91b80   cr0: 0000000080050033   cr4: 0000000000362660
(XEN) cr3: 0000000210270000   cr2: 0000000000000000
(XEN) fsb: 000077a6b25a2b80   gsb: ffff8881b5400000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d040242725> (credit2.c#csched2_unit_wake+0x14f=
/0x151):
(XEN)  df e8 dc bd ff ff eb ad <0f> 0b 55 48 89 e5 41 57 41 56 41 55 41 54 =
53 48
(XEN) Xen stack trace from rsp=3Dffff830250ba7d78:
(XEN)    ffff830250b10000 ffff830250b18f10 ffff830250b18f10 ffff830250b60840
(XEN)    ffff830250ba7de8 ffff82d04024b8eb 0000000000000202 ffff830250b60840
(XEN)    ffff830250b66018 0000000000000001 0000000000000000 0000000000000000
(XEN)    ffff830250b66018 ffff830250b10000 ffff830250ba7e58 ffff82d040207c3f
(XEN)    ffff82d0403673d4 ffff82d0403673c8 ffff82d0403673d4 ffff82d0403673c8
(XEN)    ffff82d0403673d4 ffff82d0403673c8 ffff82d0403673d4 ffff830250ba7ef8
(XEN)    0000000000000180 ffff830250b45000 deadbeefdeadf00d 0000000000000003
(XEN)    ffff830250ba7ee8 ffff82d0402e7759 0000000000000001 0000000000000005
(XEN)    0000000000000000 deadbeefdeadf00d deadbeefdeadf00d ffff82d0403673c8
(XEN)    ffff82d0403673d4 ffff82d0403673c8 ffff82d0403673d4 ffff82d0403673c8
(XEN)    ffff82d0403673d4 ffff830250b45000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 00007cfdaf4580e7 ffff82d040367432
(XEN)    ffff888192157320 0000000000000000 ffffffff810eb370 0000000000000000
(XEN)    ffff8881b0a626c0 0000000000000005 0000000000000246 0000000000000001
(XEN)    ffffea0006087608 ffffea0006087608 0000000000000018 ffffffff8100230a
(XEN)    0000000000000000 0000000000000005 0000000000000001 0000010000000000
(XEN)    ffffffff8100230a 000000000000e033 0000000000000246 ffffc90002653cf0
(XEN)    000000000000e02b d2c2c2c2c2c2c2c2 c2c2c2c2c2c2c282 c2c2c2c2c2c2c2c2
(XEN)    c2e2c2c2c2c2c2c2 0000e01000000008 ffff830250b45000 0000003210631000
(XEN)    0000000000362660 0000000000000000 8000000250bc3002 0000060100000000
(XEN) Xen call trace:
(XEN)    [<ffff82d040242725>] R credit2.c#csched2_unit_wake+0x14f/0x151
(XEN)    [<ffff82d04024b8eb>] F vcpu_wake+0x105/0x52c
(XEN)    [<ffff82d040207c3f>] F do_vcpu_op+0x1b0/0x631
(XEN)    [<ffff82d0402e7759>] F pv_hypercall+0x28f/0x57d
(XEN)    [<ffff82d040367432>] F lstar_enter+0x112/0x120
(XEN)=20
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 8:
(XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd' failed at =
credit2.c:2273
(XEN) ****************************************
(XEN)=20
(XEN) Reboot in five seconds...
(XEN) Executing kexec image on cpu8
(XEN) Shot down all CPUs

Looks pretty similar to the other thread "Xen crash after S3 suspend -
Xen 4.13" - adding J=C3=BCrgen. Since I've seen this one on Xen 4.13 before,
I think the commit I've found just makes it much more likely to happen.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl94cl8ACgkQ24/THMrX
1ywxzAgAkyEB2F8wZ/8iqMKgnhMvOgxnS+KhrtVKyUUge+OGulwk35H3G9vBE0c/
iEnvQ+fgNNCsFRLZHo6ZeUAk2yzWmrVqfWlb/Jlk23QJpoHv1SbNiZyBY21yOzy+
jLUGigrJy520FrpxxPFqq2DZBjydSIR5ri6Ol8/bGwFbRL9oFLUOY4n3m1LwXeCt
hWBLT35rHCo58NyCGDgJnVdnaDKx07nbsqCAc/F9akCwXsz53bWDxehAJqb6Usus
h/vJIFHlWjdBoj8TFjTMAY5olnwJspvKQN2l6Zhw+nptzvotZDcrXiAYr3VfcnLG
JnxyV8AEf0fnplfh8/YTpvSDSBHK7Q==
=JiOQ
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--

