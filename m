Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5289AA6224B
	for <lists+xen-devel@lfdr.de>; Sat, 15 Mar 2025 00:54:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915544.1321041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttEqF-0006zR-O9; Fri, 14 Mar 2025 23:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915544.1321041; Fri, 14 Mar 2025 23:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttEqF-0006xG-LF; Fri, 14 Mar 2025 23:53:27 +0000
Received: by outflank-mailman (input) for mailman id 915544;
 Fri, 14 Mar 2025 23:53:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vjjD=WB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ttEq9-0006x8-0h
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 23:53:26 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8019896d-012f-11f0-9ab9-95dc52dad729;
 Sat, 15 Mar 2025 00:53:18 +0100 (CET)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.phl.internal (Postfix) with ESMTP id D201F1382D18;
 Fri, 14 Mar 2025 19:53:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Fri, 14 Mar 2025 19:53:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Mar 2025 19:53:13 -0400 (EDT)
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
X-Inumbo-ID: 8019896d-012f-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1741996396;
	 x=1742082796; bh=Qli+629sd2hYRineXtOYNsgFOR5uEWa33JBM2ZzimxA=; b=
	NRax0g6dhUNEduvrOpPljTjJa3TwSWPvHjlGrmtmJAzXGSPBEC/OmVHvS7qbyyjc
	HTpiiyYeUpxmtiUa1c1BmrrgkFlmqVYp+l7KJB111wOMVckBTX/Uu3wiMKL5ahT9
	5knOvrTY6sDNVnS01Rl3iOSXvZAX7HRJBC9ISDMQAQbI8tBLfetecYD68/jJAFVC
	FVxfce5KllVJX/tITIIaWAwU9AR/M97jKWW4RE/HxD9I4HvL++XuGTfm0DzhQ88D
	oOxiMlHmNIzL3Qp6H1rllYR2YgjtGhFsMY9OKe3CzqRm6goTOXr9o/YKEk2+h9NQ
	kE/tTPWoGa1vWIKk5dGlUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1741996396; x=1742082796; bh=Qli+629sd2hYRineXtOYNsgFOR5uEWa33JB
	M2ZzimxA=; b=rru9x2QM4D3IFZJOOeNPhpeq6roTJhpcP4SYztAeMT6w32G5EXm
	+kMYsa5UIAWU68wZCOoLXTen10rN486BSQ1g1425dLRXW/BxW07vC5+QaWobdLui
	N6bcuqIIFgUuiKX3P+rl+/4TBY90HM9bzAZRpKurrDZoCCEfgFxQspC1H/lgkJ3h
	6TT8CSe/qzecqV/pR09KhyE8+brRs1jKZ5vttACAol/Kg/JPG+GnGP8fKJAXxTw4
	OmNs+0KcuPYQb4IefhbHGTGdnp1Vym8LhF8Jcpm28qjSau/mosVxQAOF6/KTqaRk
	piAbevFCCc59YtNqRRUPwDd+2BT03wUQv2A==
X-ME-Sender: <xms:a8HUZ0YkEo3-iUDgo7A7M09j0trP5ZOrMjOWYPVShDXOsGjuMZ-ogA>
    <xme:a8HUZ_ZxzslJpZ2q_B_9k2RU5N-PDoVtaT0J5iD--Ujnh1i30L53pHb3fsRtxUhNR
    PWdUr8mPiui7Q>
X-ME-Received: <xmr:a8HUZ-_hccFOhA8ZgmgD51EuTzTbebXVI-NUNGdse0P72TtgXAQVTLCLaTO7X804CR5wVuOa5LH9g0a3_w-rZN6wjFtBLZLSew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedvvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepveeujeetgeelleetudeuvefhtefgffejvedtvdfgieevheethe
    elgeeuledvjeevnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeelpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlh
    drohhrghdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhj
    vggtthdrohhrghdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtg
    hpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphht
    thhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrph
    gruhestghithhrihigrdgtohhmpdhrtghpthhtohepohhlvghkshhiihdrkhhurhhotghh
    khhosehgmhgrihhlrdgtohhmpdhrtghpthhtohepgigrkhgvphdrrghmrghtohhpsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepmhihkhihthgrpghpohhtuhhrrghisegvphgrmhdr
    tghomh
X-ME-Proxy: <xmx:a8HUZ-pYsX38G-xdMhsA6g8yvXJZKSdqLfuWOQj0TAt93XaBPVxZ6Q>
    <xmx:a8HUZ_rbYPpPyiSzyIwrxau6n_qqvZnoAwB7D22O6ZAH8NN1A8b72Q>
    <xmx:a8HUZ8ThPrgSQtNFYJNYZKbSloAK_W7znjQK1dOAsLpMxIY2bx4vkA>
    <xmx:a8HUZ_rJ6XxukSL8qjEjl4KU_7kEF2FwZONd7l3Hu1xh4FxdeZZ0CA>
    <xmx:bMHUZy2I1nPr5C4ig4M9YpsYidRbONFPWttyjKOajGwbPk8bAtANFG6X>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 15 Mar 2025 00:53:11 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: Re: S3 regression on AMD in 4.20 (was: Re: [PATCH] ci: add yet
 another HW runner)
Message-ID: <Z9TBaEeUcVrjaACL@mail-itl>
References: <20250314030628.96166-1-marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2503141417540.3477110@ubuntu-linux-20-04-desktop>
 <Z9SsYF0pYTkZXg9I@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xZzkJW8ZMVVJLTQF"
Content-Disposition: inline
In-Reply-To: <Z9SsYF0pYTkZXg9I@mail-itl>


--xZzkJW8ZMVVJLTQF
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Mar 2025 00:53:11 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: Re: S3 regression on AMD in 4.20 (was: Re: [PATCH] ci: add yet
 another HW runner)

On Fri, Mar 14, 2025 at 11:23:28PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Fri, Mar 14, 2025 at 02:19:19PM -0700, Stefano Stabellini wrote:
> > On Fri, 14 Mar 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > > This is AMD Zen2 (Ryzen 5 4500U specifically), in a HP Probook 445 G7.
> > >=20
> > > This one has working S3, so add a test for it here.
> > >=20
> > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> > > ---
> > > Cc: Jan Beulich <jbeulich@suse.com>
> > > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > >=20
> > > The suspend test added here currently fails on staging[1], but passes=
 on
> > > staging-4.19[2]. So the regression wants fixing before committing this
> > > patch.
> > >
> > > [1] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408437=
140
> > > [2] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408943=
441
> >=20
> > We could commit the patch now without the s3 test.
> >=20
> > I don't know what the x86 maintainers think about fixing the suspend
> > bug, but one idea would be to run a bisection between 4.20 and 4.19.
>=20
> I'm on it already, but it's annoying. Lets convert this thread to
> discussion about the issue:
>=20
> So, I bisected it between staging-4.19 and master. The breakage is
> somewhere between (inclusive):
> eb21ce14d709 x86/boot: Rewrite EFI/MBI2 code partly in C
> and
> 47990ecef286 x86/boot: Improve MBI2 structure check
>=20
> But, the first one breaks booting on this system and it remains broken
> until the second commit (or its parent) - at which point S3 is already
> broken. So, there is a range of 71 commits that may be responsible...
>=20
> But then, based on a matrix chat and Jan's observation I've tried
> reverting f75780d26b2f "xen: move per-cpu area management into common
> code" just on top of 47990ecef286, and that fixed suspend.
> Applying "xen/percpu: don't initialize percpu on resume" on top of
> 47990ecef286 fixes suspend too.
> But applying it on top of master
> (91772f8420dfa2fcfe4db68480c216db5b79c512 specifically) does not fix it,
> but the failure mode is different than without the patch - system resets
> on S3 resume, with no crash message on the serial console (even with
> sync_console), instead of hanging.
> And one more data point: reverting f75780d26b2f on top of master is the
> same as applying "xen/percpu: don't initialize percpu on resume" on
> master - system reset on S3 resume.
> So, it looks like there are more issues...

Another bisection round and I have the second culprit:

    8e60d47cf011 x86/iommu: avoid MSI address and data writes if IRT index =
hasn't changed

With master+"xen/percpu: don't initialize percpu on resume"+revert of
8e60d47cf011 suspend works again on this AMD system.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--xZzkJW8ZMVVJLTQF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfUwWgACgkQ24/THMrX
1yxtpAf+MzzVCxrv2WNS5UY90PzwZ+p5iYCOMt5cxTIo1QIBqOysejhrAcQsDNf0
O4qFVp32jWNdw3gTtIElSLRU5qWFKJqvrRWRii9heV9++BxyPZPymAIw9vNkXLSk
IMY9C67C5DUAXljj7Ao/tgnmcb10O+PO16vFx5uHE38iLmB7e+hISp/XCYzigI4a
02k+F2UKPglmMaAM9eWmUTBlD1lJL2HOOAZ4/JOsaIeU65dZYLWZAWZXKcB+PNsh
QjvbOhrlVeMqBCcbUAexhX1EdYkGmyEhKHobMMTwhUPL0L6fb8q133F3NJTJAUWk
gZQuMkph2REmZBV2Bsv/4rdgJkMDEw==
=u2q6
-----END PGP SIGNATURE-----

--xZzkJW8ZMVVJLTQF--

