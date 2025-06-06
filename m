Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8358AAD0637
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 17:54:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008640.1387885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNZOt-0006un-JH; Fri, 06 Jun 2025 15:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008640.1387885; Fri, 06 Jun 2025 15:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNZOt-0006tP-En; Fri, 06 Jun 2025 15:54:35 +0000
Received: by outflank-mailman (input) for mailman id 1008640;
 Fri, 06 Jun 2025 15:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Di75=YV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uNZOs-0006t0-8n
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 15:54:34 +0000
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87f580ff-42ee-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 17:54:31 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 6A76A1140138;
 Fri,  6 Jun 2025 11:54:29 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Fri, 06 Jun 2025 11:54:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 11:54:27 -0400 (EDT)
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
X-Inumbo-ID: 87f580ff-42ee-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1749225269;
	 x=1749311669; bh=d0iuc7C3aHvVo35g/BrZQyYViTr46z18Vum1rG9J824=; b=
	pSuoQLl/lPuWdJJOcvBISjqgEhqkB1R8dxTveIJh7VSZzSVhLMKV/eykR5ETzx5b
	tGi+BxpbaDWsUJLBq9Z4VWoQSm8HTu509VnvD/M3w0K+oW/DdUj/crkOc0cVGne/
	Wt6wAIXgezwE6jWG8pyy2CUvsmSvyTe613UIbo89s8i9SD1RJDI9/DdZUt77XVB4
	toj2m2iq1A6P3HY5LgrxYVJ1TTL6nZpCxPXqWp6TrpzHUCM3yS2czFW8QbSWAYtz
	g411RfBFtVgX1oH1qrpkUqLWAi/NWGWZr87TslnFIZsFay4GGCUZ4bKRtrf2CBwF
	3ri2AbEBeSFdR39lQOdtZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749225269; x=1749311669; bh=d0iuc7C3aHvVo35g/BrZQyYViTr46z18Vum
	1rG9J824=; b=UYpuudYql+aSk7nAnD0BqjSfpNDobzUmDbO7mkWtk+d26Lm+njg
	OlrObRoKYiNIvPWkfa4TJKuSBN3Utv6b30JGHHydGNr0uGSNKYf1GvC+8g/6+pE7
	UiUzcFn2VAET2WnyPvWKrJnUhwWBQMGFKY0pg5wb6vsR1oFIsBDTqwTs9KQsVHyP
	BZqHy8iotPoK5gFAEqBvc0I6LH/kn/DRRyLsoYCvqLPURhMsbI36SqT4sEBTvYoS
	lbAFc22synHLiov+zxY2kDuPG1XdG/fhhFoVJkJYoisW9/eQLl3QbFtctTHK26Vq
	7rXhItPaqaTRyxNpLOS8UFn5wOfzW3FE8Lg==
X-ME-Sender: <xms:NA9DaDsz8wQm58Z9J8LbnZSW0lq1u6jUF2Ic517I81uGcG2Pag6o7w>
    <xme:NA9DaEfu7UfrLz6IDiGkf2CdIo1enkQcrgLricqKdAz-4mCoJKEWWFg68do8e3b_e
    ZnZkIF__49LFA>
X-ME-Received: <xmr:NA9DaGyWNpdXkUhtoEKSWrhcr1x7whg4LpXtCx5P7hD2YCkPHbogDKBYAl2OnCMF23oHGhLXtpTq9kddOQ4bWs3UYGH_h47wW6o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghu
    lhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsth
    hsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegt
    ihhtrhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrth
    gvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhm
    pdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtohepshhsthgrsg
    gvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohho
    phgvrhefsegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:NA9DaCOA1gXLqFgO4hNQEQcBEPG25FDkJr3-FZrIvi6bb6AlYmeEpA>
    <xmx:NA9DaD_F--nFXuowgB8Q94HSz6u2LHd0CCUOC897R3nP7BNTHL-ZSw>
    <xmx:NA9DaCUyZMypS3qFj0LOdyUcF5ssBSxCCf8Ua2MbeRIo-KIGEiKjCw>
    <xmx:NA9DaEcpcM5XdrpeIgmVJDMg_nIw81XG3LT4jG0g0ODEEEweMCuMTA>
    <xmx:NQ9DaBx5xyAUQo3WtsofRUg5Qv4_YO3KmX3Cxy1KTOpcP4rJWycmLEoS>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 6 Jun 2025 15:54:25 +0000
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 1/5] console: add relocation hook
Message-ID: <aEMPMa0-1XwlbsPM@mail-itl>
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
 <4f1889dc03ec4aa2cc0cd2bd14523a2c6f670bdb.1748182535.git-series.marmarek@invisiblethingslab.com>
 <0b17da9c-57db-4a8b-90af-e53e45cb1243@citrix.com>
 <aDSLNeFRZWoxMTEt@mail-itl>
 <66cfdee6-5dc2-4139-8550-ef441fa7a7a0@suse.com>
 <aEGu6-6dGqc_WUlg@mail-itl>
 <ea285192-c39c-43b4-a879-7ca4ff7f9b4a@suse.com>
 <aEHBAsLFvZni1_5Y@mail-itl>
 <83c22da9-62c5-4fb2-bc2d-f34ad5956d3e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nmE0Uw0NEhG79Tq6"
Content-Disposition: inline
In-Reply-To: <83c22da9-62c5-4fb2-bc2d-f34ad5956d3e@suse.com>


--nmE0Uw0NEhG79Tq6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 6 Jun 2025 15:54:25 +0000
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 1/5] console: add relocation hook

On Fri, Jun 06, 2025 at 08:26:33AM +0200, Jan Beulich wrote:
> On 05.06.2025 18:08, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Jun 05, 2025 at 06:05:02PM +0200, Jan Beulich wrote:
> >> On 05.06.2025 16:51, Marek Marczykowski-G=C3=B3recki wrote:
> >>> On Thu, Jun 05, 2025 at 04:42:53PM +0200, Jan Beulich wrote:
> >>>> Why is it that this ring is dependent upon Xen's position? If the ri=
ng was
> >>>> dynamically allocated, it wouldn't change position when Xen is moved.
> >>>
> >>> The console is setup quite early, I don't think I can allocate memory=
 at
> >>> this stage, no?
> >>
> >> But you allocate before Xen is moved, I suppose.
> >=20
> > Well, I have those buffers in BSS exactly to avoid the need to allocate
> > them (or rather: have bootloader allocate them for me).
>=20
> Yet them remaining in .bss is now getting in the way. Imo moving them to
> .init.* and adding proper allocation is going to be easier than the hook-
> ary you are proposing.

So, when would you propose to allocate them? Wouldn't that be yet
another hook?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--nmE0Uw0NEhG79Tq6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhDDzEACgkQ24/THMrX
1yy0Rgf+I5DQTFUK5vLWZ/ahlpVUczjl7mp/aKVc22gHuBTNUd4IWOL8g/B7325o
PhECA9Dpg0FcrYYElhNU76asCmUbru0C+WnopeG7bhabZkw1NY55M90uf0DdhK1o
91U5kE2M9xkGpnq0E5erUczeDI5jxqr7ePaFpQIqAv9UymHlsMR4nBzwwwyOO78C
N1XL18wjg9m6r8DsUfOuUuKjyr+RoA1WI4h6TyZIJ+O/zIUb+Cfbs5/a3FZUvB8W
1P8Ms8v3ITTOzVzYfF67RUJO0fL7zPx8RWMmPKCs0mVAJtnhZmKtKQnkyd23sv/X
PSnIKlRgHslrgZv5GPAJdgVSAIbfgw==
=GT85
-----END PGP SIGNATURE-----

--nmE0Uw0NEhG79Tq6--

