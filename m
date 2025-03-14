Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A53CA62040
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 23:24:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915527.1321032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttDRS-0008AF-J6; Fri, 14 Mar 2025 22:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915527.1321032; Fri, 14 Mar 2025 22:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttDRS-00087g-G1; Fri, 14 Mar 2025 22:23:46 +0000
Received: by outflank-mailman (input) for mailman id 915527;
 Fri, 14 Mar 2025 22:23:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vjjD=WB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ttDRJ-00087K-Ko
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 22:23:45 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7638563-0122-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 23:23:35 +0100 (CET)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id 7015A1380F08;
 Fri, 14 Mar 2025 18:23:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Fri, 14 Mar 2025 18:23:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Mar 2025 18:23:30 -0400 (EDT)
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
X-Inumbo-ID: f7638563-0122-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1741991013;
	 x=1742077413; bh=FEiAqfIaYZE3VyOBQ80H8WMCS2w8fo0Csp8fAtdYVK8=; b=
	w1x9dwmvwGI3FQPlFtVoxCERNyEbcs85hI6/yuFZsi442NZWAKezasToUVOY52tq
	7GG2Nn8xtEL2Wov98gXdTKiuvCsfoBLbJh7/CuvJfDP8P/RHwII6GrWbnZg8Swzi
	NZL/1Qfovdi0GecfIXq/Dsqf02Mx0+z2JedtfaGlLGj/665wDfEoYY9ALFQGYmX3
	+hjUawqq/I5jS1Bjtna5I8hHdpjpOAFvIfefE18mDUNyYyqqBl/UjxBuJSMryw9c
	UdyUmDfjT2jaOkiZG4akfeH3jYinH1ozww6v3lOckznrSmaRGVM726zZuzipTRji
	V8x871c7E/3aj53B+XBwiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1741991013; x=1742077413; bh=FEiAqfIaYZE3VyOBQ80H8WMCS2w8fo0Csp8
	fAtdYVK8=; b=qqm2BO8V4i1wOCnqnDN8I27a/h/meNXfPgMpstqRah6ucQ9mNZm
	2pncGf33T9+z/pOh2+rK0XH+1JkZDVShcKxctj8BS6WCfDEFguZAS9R2mWuA3SdV
	fsJ2Udy/wRiwDY6m8uCb5SKlngr4M0ZbLkLxTxMEgNEY70nCtarmyApz9AYtenSb
	b82P5KrNIh4s53KMcs5Roe7COJD9foMIc9nriugNuknmFGL2/lJClivE+9MMpCE1
	EP51IpWgYW1GjcD4/N8Qpfel1LeJnoaZ7wJSybKl7JStgXY+MJ5LSBnMsaCoCBOA
	k85GOUn9TjuginbYVgULs7g5x42QkbPdQ4A==
X-ME-Sender: <xms:ZKzUZ3nSkqxDQlghuo5QS2QgqyN-OpQ45EAeA2zxLGSYUKMI_XSa8g>
    <xme:ZKzUZ61vHqFlX7xfY6FJayRy6v1-oryv-zL5-8jT_JUMW99lozAAYipON7J1S1iQT
    rIOoYn9VreBXQ>
X-ME-Received: <xmr:ZKzUZ9pSJ-MZo1sIZb6Fbgjy2txLvqP02EYa8SF1iSThXexuTqXxN8bwBC4Vv_eJMmvZr8PTgBam2t8bEL7GVRSs_22HhSspkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedvtdduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:ZKzUZ_mOCb4rTZTYfD-uqI0m4W6pcEoodcEiLr-EWCoG6tt4piApEQ>
    <xmx:ZKzUZ11aVXh4IZRR7ZQZdeyadlQtPXIkcEvHqOu3Pb8tGyfqIPV3QQ>
    <xmx:ZKzUZ-ujKWDtFlKeYOEoFDtiubK6vB_l-ZZxcVM4B14EReYLVEhuwg>
    <xmx:ZKzUZ5V-QbRnK4L7PMkH2oCAL3_ZxumfQomOVF_ihY16yp4NSaaAhg>
    <xmx:ZazUZ_xfdJlTECZnQpBvHtehpGenxHEIl_fTqr5QSCiIry4HNVFKE3ag>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 14 Mar 2025 23:23:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: S3 regression on AMD in 4.20 (was: Re: [PATCH] ci: add yet another
 HW runner)
Message-ID: <Z9SsYF0pYTkZXg9I@mail-itl>
References: <20250314030628.96166-1-marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2503141417540.3477110@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UB5wfNeIlVJsLyIt"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2503141417540.3477110@ubuntu-linux-20-04-desktop>


--UB5wfNeIlVJsLyIt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Mar 2025 23:23:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: S3 regression on AMD in 4.20 (was: Re: [PATCH] ci: add yet another
 HW runner)

On Fri, Mar 14, 2025 at 02:19:19PM -0700, Stefano Stabellini wrote:
> On Fri, 14 Mar 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > This is AMD Zen2 (Ryzen 5 4500U specifically), in a HP Probook 445 G7.
> >=20
> > This one has working S3, so add a test for it here.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > Cc: Jan Beulich <jbeulich@suse.com>
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> >=20
> > The suspend test added here currently fails on staging[1], but passes on
> > staging-4.19[2]. So the regression wants fixing before committing this
> > patch.
> >
> > [1] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408437140
> > [2] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408943441
>=20
> We could commit the patch now without the s3 test.
>=20
> I don't know what the x86 maintainers think about fixing the suspend
> bug, but one idea would be to run a bisection between 4.20 and 4.19.

I'm on it already, but it's annoying. Lets convert this thread to
discussion about the issue:

So, I bisected it between staging-4.19 and master. The breakage is
somewhere between (inclusive):
eb21ce14d709 x86/boot: Rewrite EFI/MBI2 code partly in C
and
47990ecef286 x86/boot: Improve MBI2 structure check

But, the first one breaks booting on this system and it remains broken
until the second commit (or its parent) - at which point S3 is already
broken. So, there is a range of 71 commits that may be responsible...

But then, based on a matrix chat and Jan's observation I've tried
reverting f75780d26b2f "xen: move per-cpu area management into common
code" just on top of 47990ecef286, and that fixed suspend.
Applying "xen/percpu: don't initialize percpu on resume" on top of
47990ecef286 fixes suspend too.
But applying it on top of master
(91772f8420dfa2fcfe4db68480c216db5b79c512 specifically) does not fix it,
but the failure mode is different than without the patch - system resets
on S3 resume, with no crash message on the serial console (even with
sync_console), instead of hanging.
And one more data point: reverting f75780d26b2f on top of master is the
same as applying "xen/percpu: don't initialize percpu on resume" on
master - system reset on S3 resume.
So, it looks like there are more issues...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--UB5wfNeIlVJsLyIt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfUrGAACgkQ24/THMrX
1ywAWwf/dV2G9ZNdT4aTyFqCJXhxyHugXwAa2Wv762SqViopb0sIXmB1gVRUhoMU
spdmhHbB9FnFHaoBzJsiXzXtGtQJkceOPdqmd7VuWo0KsGb51upbEQw7LyO/tZaB
C+uDlMv//NKD0hjQrS5cMY+TSQmzQdmzqFbZCXchJcTwHKPo9Zu5Wv3awo7UGjSf
lUvdjdV0MNOSRXN4ZlWitMouZw+VM4BmzY2+nAODenCl8yLrHsb3KVqexUGNReQL
uLOs9NLgQZtgM3vEoboFlDrFaHTGKnEW7iwUe8Vs8YOpv+9njuUg+gMuozOSoNNQ
Cu0ncWxOIaBPNIsitNOTjJhFoz6GZw==
=C0Lp
-----END PGP SIGNATURE-----

--UB5wfNeIlVJsLyIt--

