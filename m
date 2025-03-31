Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B266A76716
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 15:47:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932518.1334627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFUJ-0003gO-V3; Mon, 31 Mar 2025 13:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932518.1334627; Mon, 31 Mar 2025 13:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFUJ-0003ew-Ro; Mon, 31 Mar 2025 13:47:39 +0000
Received: by outflank-mailman (input) for mailman id 932518;
 Mon, 31 Mar 2025 13:47:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpMN=WS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tzFUI-0003el-KI
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 13:47:38 +0000
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b422a85b-0e36-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 15:47:37 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id D33881384427;
 Mon, 31 Mar 2025 09:47:35 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Mon, 31 Mar 2025 09:47:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Mar 2025 09:47:34 -0400 (EDT)
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
X-Inumbo-ID: b422a85b-0e36-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1743428855;
	 x=1743515255; bh=Ph8eoYDLnFBfOsiI9tRFHRvss0NVnFq52pllNfkSYT8=; b=
	Chne1J98qukWXil8IsIOPvtXtOuUvuHv1Dl+E1BsL6Yc9QpOlc9aVpB1Ihn4FuJf
	vA36tgtNdgd7Wl6cpg00vBIwzjnM/Eceal84vG5ske6bGdpg4nQRHDbWw8vLlu/d
	6R4BxlcXR/fGoSCiWiXAUsUMFr/FR/ZEy2I86ZJcT/uZBPOfW/gEJ9jpm2cqHPK6
	L7yoDmqicb+RILQisbbud+hJQufJjyu5hmKwVQ/V2kvayYP/CBPjGfMjAQ73+ccd
	pJrSDbPCA1l99MR6A7QxzvzUJrAltSzS9Lg18cLg9JnUBo44NXD7Syw7NHJDdssM
	FpcdutLF8YrK0XuD5gW+UA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743428855; x=1743515255; bh=Ph8eoYDLnFBfOsiI9tRFHRvss0NVnFq52pl
	lNfkSYT8=; b=GtGwKZpZ9zGfsoMxg5oLWXazHNXRzh5FyfxGjWV2BFu+qAqvCxr
	NZLSDoV6AZ8sH+ZC4Op1/9QsHP8qvVzoFMhIC9LWP5T9xH7vh51sAtrBab1OFji8
	I20JGTt4yqMoUpxfw/+CriMYy2wQkFWVGfow+UGyQcBK8RB2aOCoZMz9FBXbL+LJ
	20UHZAN+9DVcvIy0fQcxpQDcZJryymbtpVfGlTbpJGhmXo3AW8/2dmY0GTn/DfMC
	LCMRTvehgdFawWNSz+qAkqqesl4Qow0eSbINHfgDglFkDLoqSoGBbeX4pni6WiSn
	4PSD3OmzgAehJf0bAJjz0RQc+dOqjeM1faA==
X-ME-Sender: <xms:95zqZ7v4vZbXWydbeNnCkSbqpwJkKxKgKkhDGoZWeNlVpKwbegglaQ>
    <xme:95zqZ8cFtZqU9q4q0I2o-fgsNScH0MzsuuH3SVEuP_DeoqtglAb3nG0_AQxJNflGb
    z0deJhKQOUuZA>
X-ME-Received: <xmr:95zqZ-yXGF_BJrAYV-Fj6XRNLGTzNr3pbwsFvb-EbnaDu-JI3TWccMaHm65IqVq_mEdhp0SeDDdqOgQEp8eGh12l4aftbXPbUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedttdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepveeujeetgeelleetudeuvefhtefgffejvedtvdfgieevheethe
    elgeeuledvjeevnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghith
    hrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtg
    htrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphht
    thhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrph
    gruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:95zqZ6MjapCWqYXseM2cnngpGefLyfRVXpLSiQLsIznNVf9XJxomIA>
    <xmx:95zqZ79ivUmFvM92qawNssUEaxEb-t0Z4eSxMvJqrwz_Gmin-umG_g>
    <xmx:95zqZ6VBVbfwWN_FReX5dmIcQIckxg36RyhVU3Sw1d3-GTU13gpnbw>
    <xmx:95zqZ8fCALXScu_IFY9ZfnQ7GCDO4q7MdbdlxVSb5uyIbMiKKTcA7g>
    <xmx:95zqZ7wCV0KaN-AyFQwhbOLimR0OTwC-AVgEFv0CpxSmu9SYe5oEMcLF>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 31 Mar 2025 15:47:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] ci: add yet another HW runner
Message-ID: <Z-qc9Cw5xQq1m4tw@mail-itl>
References: <20250314030628.96166-1-marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2503141417540.3477110@ubuntu-linux-20-04-desktop>
 <Z-qVyLPnEllLKR7B@mail-itl>
 <655f5f07-ebbb-46ca-9c56-e7ad4c6e5cdd@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wy1CuuroPgg+0/xb"
Content-Disposition: inline
In-Reply-To: <655f5f07-ebbb-46ca-9c56-e7ad4c6e5cdd@citrix.com>


--Wy1CuuroPgg+0/xb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Mar 2025 15:47:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] ci: add yet another HW runner

On Mon, Mar 31, 2025 at 02:45:05PM +0100, Andrew Cooper wrote:
> On 31/03/2025 2:16 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Mar 14, 2025 at 02:19:19PM -0700, Stefano Stabellini wrote:
> >> On Fri, 14 Mar 2025, Marek Marczykowski-G=C3=B3recki wrote:
> >>> This is AMD Zen2 (Ryzen 5 4500U specifically), in a HP Probook 445 G7.
> >>>
> >>> This one has working S3, so add a test for it here.
> >>>
> >>> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> >>> ---
> >>> Cc: Jan Beulich <jbeulich@suse.com>
> >>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>
> >>> The suspend test added here currently fails on staging[1], but passes=
 on
> >>> staging-4.19[2]. So the regression wants fixing before committing this
> >>> patch.
> >> We could commit the patch now without the s3 test.
> >>
> >> I don't know what the x86 maintainers think about fixing the suspend
> >> bug, but one idea would be to run a bisection between 4.20 and 4.19.
> > This passes on staging now:
> > https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/17446827=
89
> >
> > So, the patch is good to commit as is.
>=20
> adl and zen3p both have SUT_ADDR.=C2=A0 zen2 inherits test-2.testnet from=
 adl.
>=20
> Presumably it wants to be test-1.testnet to match it's qubes-hw tag ?

Indeed, yes. Right now it's used only for "tools-tests", not added for
this runner, but it wants to be consistent anyway.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Wy1CuuroPgg+0/xb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfqnPQACgkQ24/THMrX
1yxKDwf/XpWOs3ZUurIfiLdGPSZSDealj9rkz/8mzutsKXlXXOg2DGUUIa1xJ8Lo
u55Z9MrL6VWtM5DZbauclGL/KWwVwN7GnNZeTKQOeUZZ/eu/M9hUiBwQVV7ROt3r
HKQZk8GiHcxQNDMIb0mfOoYxaW1pCr72TYJ/nETsHWpZvM22rHmzsUymeNskw/Kt
kRyJwvCntx0857B2bYFKrIDy0E/btUu9iaLU2Vz9q1kwZUdiiImvwj8IuChA/7/G
zEfrLhTzAXtDmd9ybgN7tfQ910VvXcooSYQYV7lbD0Mx0jt8KtLwd8KnBqOFhHsl
kRDHddDrNJ9koyMzpUje+i0xLwNzLg==
=Cy+q
-----END PGP SIGNATURE-----

--Wy1CuuroPgg+0/xb--

