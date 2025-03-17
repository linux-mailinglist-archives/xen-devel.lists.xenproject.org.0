Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B2DA65832
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 17:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917499.1322399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuDRY-0004XJ-NF; Mon, 17 Mar 2025 16:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917499.1322399; Mon, 17 Mar 2025 16:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuDRY-0004UK-Jt; Mon, 17 Mar 2025 16:36:00 +0000
Received: by outflank-mailman (input) for mailman id 917499;
 Mon, 17 Mar 2025 16:35:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o++3=WE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tuDRX-0004UE-EG
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 16:35:59 +0000
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6cb50a1-034d-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 17:35:57 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 51BDC1140235;
 Mon, 17 Mar 2025 12:35:56 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Mon, 17 Mar 2025 12:35:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Mar 2025 12:35:54 -0400 (EDT)
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
X-Inumbo-ID: e6cb50a1-034d-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742229356;
	 x=1742315756; bh=a3eEAjGFG9tKB0xu6wle/2V5oR2nOxrlb3qL2lnjczw=; b=
	Vx0pg1l5RSNEzsX1kCmuzHTv96CsBxIEleA8iNm3e2FT7p0OqALXJdJYH1qvh5qf
	DCpLz5iR4jxGC8JvLtndIKlBLT0k1DgGYfw5P83oZwDVjp7LF/JclC/WaUfymoS5
	z0FVrRo0WPJ00ePFRXtZJlcgocBN11M43aIVxvVM9QA62q36piIAWA8NGzaX2h6y
	bzxKR/BFi6Rn3MLG8fqfZRU+fB5XE4V8oeEifKQpTarrPJR5xMYl/BaViECPkf7Q
	h7X8foXNCuTz+81G+HqeUuoGveFdqLloOArQBgc+DCZ8xRE/FhCrdJOyCkszj2gN
	H/qCAwc3WW9RF1L2jUGE2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742229356; x=1742315756; bh=a3eEAjGFG9tKB0xu6wle/2V5oR2nOxrlb3q
	L2lnjczw=; b=ASkY1TdPfp2X5TXNFheP5Rc++pwt0TMIXmoiCkSvuli+XEBWNGa
	w0HzmVT+fBJfs87q0hkzKllpS50qN9LFMEt3Io+a3XXNOnUEZMK6lITkOAWbCmRF
	r5RA64WhHG2nLedXKlCNM9ih6nN/hvB+lxSFcbRmbh8aTsbxzotOuThghAxPtqEr
	RRmGrCiFB5zPt5I+LCfL30y2V+OR1fwjTYN3YjJVDV13PGqm5u7GndLbPPMQPum5
	ycahXuQDP6b7jKSEn30iZBYxqWzGrNK017XiDNWrwxBA5yqfQy+ONNOPQRtUN4fk
	EbH74ppL9hOw/ZlXja3dvJ1uhb+DC14PzTg==
X-ME-Sender: <xms:a0_YZ29K1e7v8fv9bxzAdnj4IBtvAss7OmEIpJVAiyIKY7l3yGjrEg>
    <xme:a0_YZ2uH-nl1zhilbMjwHu92SviQhOsZXQVli82v63jV9RPmUdxtFHGGTkrc-b4uE
    tIwjUzxJMaqlQ>
X-ME-Received: <xmr:a0_YZ8AiWp2-jHdGg7XDrgL3uvgr3XXQ7YKzLUBXfhO-nuCvq-UQh8BUJrnFwX0KDZRuiKwAC7lqF_HIUjqwaE6tuI-HUo6fdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedttdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepveeujeetgeelleetudeuvefhtefgffejvedtvdfgieevheethe
    elgeeuledvjeevnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeelpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtg
    homhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhm
    pdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhr
    tghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopegtrghrug
    hovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepohhlvghkshhiihdrkhhurhhotghh
    khhosehgmhgrihhlrdgtohhmpdhrtghpthhtohepgigrkhgvphdrrghmrghtohhpsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepmhihkhihthgrpghpohhtuhhrrghisegvphgrmhdr
    tghomh
X-ME-Proxy: <xmx:a0_YZ-e3fMjNfeEG1u5LwyMdEDskOMVeBk8SacYvotnum21BesWTuA>
    <xmx:bE_YZ7Obi4HFGgOnR6C_y7qYYUp4FfQymXWnnuXW-MWcKcpDRQSMJA>
    <xmx:bE_YZ4m5Pto1rWIZwhw7x2pem7JRSML8yHGCh8Pb4q2-IM1EHNSqdw>
    <xmx:bE_YZ9umT5IzUbfXU8DjgGr9SYcbG0bWgZlnX_D7Ksv0_oYSL_EWkw>
    <xmx:bE_YZ2qg2_IxReh87FroB9Ak3DBuNv1JQHW2M5cGes0b2vSLDOkOGA7W>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 17 Mar 2025 17:35:51 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: Re: S3 regression on AMD in 4.20
Message-ID: <Z9hPaLVVhqAK5H0K@mail-itl>
References: <20250314030628.96166-1-marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2503141417540.3477110@ubuntu-linux-20-04-desktop>
 <Z9SsYF0pYTkZXg9I@mail-itl>
 <Z9TBaEeUcVrjaACL@mail-itl>
 <fd27f66c-12ce-4f94-8cc3-a8fbc18694a4@citrix.com>
 <Z9hGH0GLq-I1cKzt@macbook.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wm3h5sTQXunpJOag"
Content-Disposition: inline
In-Reply-To: <Z9hGH0GLq-I1cKzt@macbook.local>


--wm3h5sTQXunpJOag
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Mar 2025 17:35:51 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: Re: S3 regression on AMD in 4.20

On Mon, Mar 17, 2025 at 04:56:15PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Sat, Mar 15, 2025 at 12:02:50AM +0000, Andrew Cooper wrote:
> > On 14/03/2025 11:53 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > > On Fri, Mar 14, 2025 at 11:23:28PM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > >> On Fri, Mar 14, 2025 at 02:19:19PM -0700, Stefano Stabellini wrote:
> > >>> On Fri, 14 Mar 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > >>>> This is AMD Zen2 (Ryzen 5 4500U specifically), in a HP Probook 445=
 G7.
> > >>>>
> > >>>> This one has working S3, so add a test for it here.
> > >>>>
> > >>>> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisible=
thingslab.com>
> > >>>> ---
> > >>>> Cc: Jan Beulich <jbeulich@suse.com>
> > >>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > >>>>
> > >>>> The suspend test added here currently fails on staging[1], but pas=
ses on
> > >>>> staging-4.19[2]. So the regression wants fixing before committing =
this
> > >>>> patch.
> > >>>>
> > >>>> [1] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408=
437140
> > >>>> [2] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408=
943441
> > >>> We could commit the patch now without the s3 test.
> > >>>
> > >>> I don't know what the x86 maintainers think about fixing the suspend
> > >>> bug, but one idea would be to run a bisection between 4.20 and 4.19.
> > >> I'm on it already, but it's annoying. Lets convert this thread to
> > >> discussion about the issue:
> > >>
> > >> So, I bisected it between staging-4.19 and master. The breakage is
> > >> somewhere between (inclusive):
> > >> eb21ce14d709 x86/boot: Rewrite EFI/MBI2 code partly in C
> > >> and
> > >> 47990ecef286 x86/boot: Improve MBI2 structure check
> > >>
> > >> But, the first one breaks booting on this system and it remains brok=
en
> > >> until the second commit (or its parent) - at which point S3 is alrea=
dy
> > >> broken. So, there is a range of 71 commits that may be responsible...
> > >>
> > >> But then, based on a matrix chat and Jan's observation I've tried
> > >> reverting f75780d26b2f "xen: move per-cpu area management into common
> > >> code" just on top of 47990ecef286, and that fixed suspend.
> > >> Applying "xen/percpu: don't initialize percpu on resume" on top of
> > >> 47990ecef286 fixes suspend too.
> > >> But applying it on top of master
> > >> (91772f8420dfa2fcfe4db68480c216db5b79c512 specifically) does not fix=
 it,
> > >> but the failure mode is different than without the patch - system re=
sets
> > >> on S3 resume, with no crash message on the serial console (even with
> > >> sync_console), instead of hanging.
> > >> And one more data point: reverting f75780d26b2f on top of master is =
the
> > >> same as applying "xen/percpu: don't initialize percpu on resume" on
> > >> master - system reset on S3 resume.
> > >> So, it looks like there are more issues...
> > > Another bisection round and I have the second culprit:
> > >
> > >     8e60d47cf011 x86/iommu: avoid MSI address and data writes if IRT =
index hasn't changed
> > >
> > > With master+"xen/percpu: don't initialize percpu on resume"+revert of
> > > 8e60d47cf011 suspend works again on this AMD system.
> >=20
> > That's not surprising in the slightest.
> >=20
> > Caching hardware values in Xen isn't safe across S3, which QubesOS has
> > found time and time again, and for which we still have outstanding bugs.
> >=20
> > S3 turns most of the system off.=C2=A0 RAM gets preserved, but devices =
and
> > plenty of internal registers don't.
>=20
> I think I've spotted the issue.  enable_iommu() called on resume
> (ab)uses set_msi_affinity() to force an MSI register write, as it's
> previous behavior was to unconditionally propagate the values.  With
> my change it would no longer perform such writes on resume.
>=20
> I think the patch below should help.

It doesn't, I still got reboot on resume, with no crash message on
serial (even with sync_console).

And the other patch (setting force=3Dtrue in all calls) gets me panic
on boot:

(XEN) [   11.890757] Assertion '(msg->data & (entry[-nr].msi.nvec - 1)) =3D=
=3D nr' failed at arch/x86/msi.c:210
(XEN) [   11.900440] ----[ Xen-4.21-unstable  x86_64  debug=3Dy  Tainted:  =
 C    ]----
(XEN) [   11.908082] CPU:    3
(XEN) [   11.910923] RIP:    e008:[<ffff82d040304bdc>] msi.c#write_msi_msg+=
0xf5/0x16c
(XEN) [   11.918652] RFLAGS: 0000000000010002   CONTEXT: hypervisor (d0v3)
(XEN) [   11.925404] rax: 0000000000000001   rbx: ffff830401ded840   rcx: f=
fff8303f5367d38
(XEN) [   11.933576] rdx: 0000000000000000   rsi: ffff8303f536e1d8   rdi: 8=
000000000000000
(XEN) [   11.941750] rbp: ffff8303f5367d90   rsp: ffff8303f5367d68   r8:  0=
000000000000000
(XEN) [   11.949924] r9:  0000000000000000   r10: ffff8303f5367d58   r11: 0=
000000000000000
(XEN) [   11.958097] r12: ffff8303f5367da0   r13: 0000000000000000   r14: 0=
000000000000001
(XEN) [   11.966269] r15: 0000000000000000   cr0: 0000000080050033   cr4: 0=
0000000003506e0
(XEN) [   11.974442] cr3: 00000003f2a0c000   cr2: ffff888100109890
(XEN) [   11.980483] fsb: 0000000000000000   gsb: ffff8881352c0000   gss: 0=
000000000000000
(XEN) [   11.988656] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010  =
 cs: e008
(XEN) [   11.996301] Xen code around <ffff82d040304bdc> (msi.c#write_msi_ms=
g+0xf5/0x16c):
(XEN) [   12.004382]  41 bd 00 00 00 00 eb c2 <0f> 0b 4c 8b 73 28 44 0f b6 =
7b 01 41 8b 14 24 41
(XEN) [   12.012998] Xen stack trace from rsp=3Dffff8303f5367d68:
(XEN) [   12.018772]    ffff8303f5582000 0000000000000000 ffff830401ded840 =
ffff8303f555e000
(XEN) [   12.027036]    0000000000000000 ffff8303f5367dc8 ffff82d040304cd9 =
00000000fee00000
(XEN) [   12.035299]    0000000000004061 ffff8303f5582000 ffff830401ded380 =
ffff82d0403c6340
(XEN) [   12.043560]    ffff830401ded9a0 ffff82d04030b00a 000000010000002a =
ffff82d0403a5aaf
(XEN) [   12.051821]    ffff8303f5367ef8 ffffc90040087afc ffff8303f556f000 =
ffff8303f5569a80
(XEN) [   12.060083]    000000000000002a 00000000000004d8 ffff82d04020ca6f =
0000002aaaaaaaaa
(XEN) [   12.068344]    ffff830401ded380 ffff8303f555e000 00000000000004d8 =
aaaaaaaa00000000
(XEN) [   12.076606]    aaaaaaaaaaaaaaaa ffff8303f5367ef8 0000000000000020 =
ffff8303f554f000
(XEN) [   12.084869]    ffffc90040087afc 0000000000000000 0000000000000002 =
ffff82d0402eb7fc
(XEN) [   12.093130]    ffff88810ff6a228 ffff888100448c90 ffffffffffffffff =
0000000000000000
(XEN) [   12.101393]    0000000000000000 ffff8303f5367ef8 0000000000000000 =
ffff8303f554f000
(XEN) [   12.109654]    0000000000000000 0000000000000000 0000000000000000 =
ffff8303f5367fff
(XEN) [   12.117916]    0000000000000000 ffff82d0402012cd 0000000000000000 =
ffff88810ff6a2a4
(XEN) [   12.126179]    ffff88810ff6a360 0000000000000000 ffff88810236fde0 =
0000000000000060
(XEN) [   12.134442]    0000000000000246 0000000000000000 ffffffff82b3cce0 =
ffff888100448c90
(XEN) [   12.142703]    0000000000000020 ffffffff81df540a ffff88810ff6a228 =
ffffc90040087afc
(XEN) [   12.150966]    0000000000000002 0000010000000000 ffffffff81df540a =
000000000000e033
(XEN) [   12.159227]    0000000000000246 ffffc90040087ae0 000000000000e02b =
c2c2c2c2c2c2c2c2
(XEN) [   12.167489]    c2c2c2c2c2c2c2c2 c2c2c2c2c2c2c2c2 c2c2c2c2c2c2c2c2 =
0000e01000000003
(XEN) [   12.175752]    ffff8303f554f000 00000033b4d9f000 00000000003506e0 =
0000000000000000
(XEN) [   12.184014] Xen call trace:
(XEN) [   12.187388]    [<ffff82d040304bdc>] R msi.c#write_msi_msg+0xf5/0x1=
6c
(XEN) [   12.194407]    [<ffff82d040304cd9>] S set_msi_affinity+0x86/0x93
(XEN) [   12.201071]    [<ffff82d04030b00a>] S pirq_guest_bind+0x2c0/0x484
(XEN) [   12.207823]    [<ffff82d04020ca6f>] S do_event_channel_op+0xad1/0x=
11b0
(XEN) [   12.215019]    [<ffff82d0402eb7fc>] S pv_hypercall+0x55f/0x5dd
(XEN) [   12.221504]    [<ffff82d0402012cd>] S lstar_enter+0x13d/0x150
(XEN) [   12.227899]=20
(XEN) [   12.229943]=20
(XEN) [   12.231987] ****************************************
(XEN) [   12.237584] Panic on CPU 3:
(XEN) [   12.240960] Assertion '(msg->data & (entry[-nr].msi.nvec - 1)) =3D=
=3D nr' failed at arch/x86/msi.c:210
(XEN) [   12.250644] ****************************************

I wonder if similar crash happens on resume with this patch.

BTW, the -nr in the above assert looks suspicious, is it trying to fine
the first entry?

> I wonder if we should unconditionally propagate the write from
> __setup_msi_irq(), as it's also unlikely to make any difference to
> skip that write, and would further keep the previous behavior.
>=20
> Thanks, Roger.
> ---
> commit 1d9bfd0d45f6b547b19f0d2f752fc3bd10103971
> Author: Roger Pau Monne <roger.pau@citrix.com>
> Date:   Mon Mar 17 15:40:11 2025 +0100
>=20
>     x86/msi: always propagate MSI writes when not in active system mode
>    =20
>     Relax the limitation on MSI register writes, and only apply it when t=
he
>     system is in active state.  For example AMD IOMMU drivers rely on usi=
ng
>     set_msi_affinity() to force an MSI register write on resume from
>     suspension.
>    =20
>     The original patch intention was to reduce the number of MSI register
>     writes when the system is in active state.  Leave the other states to
>     always perform the writes, as it's safer given the existing code, and=
 it's
>     expected to not make a difference performance wise.
>    =20
>     Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>     Fixes: ('8e60d47cf011 x86/iommu: avoid MSI address and data writes if=
 IRT index hasn't changed')
>     Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index 163ccf874720..8bb3bb18af61 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -189,6 +189,15 @@ static int write_msi_msg(struct msi_desc *entry, str=
uct msi_msg *msg,
>  {
>      entry->msg =3D *msg;
> =20
> +    if ( unlikely(system_state !=3D SYS_STATE_active) )
> +        /*
> +         * Always propagate writes when not in the 'active' state.  The
> +         * optimization to avoid the MSI address and data registers writ=
e is
> +         * only relevant for runtime state, and drivers on resume (at le=
ast)
> +         * rely on set_msi_affinity() to update the hardware state.
> +         */
> +        force =3D true;
> +
>      if ( iommu_intremap !=3D iommu_intremap_off )
>      {
>          int rc;

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--wm3h5sTQXunpJOag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfYT2gACgkQ24/THMrX
1yxf+Af/SBs+MNjOtEBm5HJvgz+N+pQM+mzkH3Yv0i4jyDZNq2CHDlEwRefFvN0N
PQTOlMLtDu4PexBX9EixNajHQbEmxBsMiXGDMA0POQpJM5Va05b0RVgefurgh10l
JMJZQSrAc7Ncui1XLGtRf1buXqqS09j4QJtYQWhBfO4ZNSKYgINml+k0b1lB720D
7zIm1ig0QYVVOxbOKBCAVEz/b45QxP5EI2Vb571JPfAxKKbVuu4UcePJQtNoSlPA
lAzsQFc20SRVwri9/yRVmjvD6T2iBB8S5qfSbYYmZYbXwjct6OdBJ92cGOv5gRVL
tWCm97MAUKSEO8ycSczU7bkpD379FA==
=mEuy
-----END PGP SIGNATURE-----

--wm3h5sTQXunpJOag--

