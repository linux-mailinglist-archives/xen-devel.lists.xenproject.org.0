Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BCD9BC25A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 02:11:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830133.1245051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t885T-00068U-CV; Tue, 05 Nov 2024 01:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830133.1245051; Tue, 05 Nov 2024 01:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t885T-00065Q-96; Tue, 05 Nov 2024 01:10:27 +0000
Received: by outflank-mailman (input) for mailman id 830133;
 Tue, 05 Nov 2024 01:10:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulGH=SA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1t885R-00065K-CM
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 01:10:25 +0000
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8713a2e-9b12-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 02:10:19 +0100 (CET)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 405DF11401F9;
 Mon,  4 Nov 2024 20:10:17 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Mon, 04 Nov 2024 20:10:17 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Nov 2024 20:10:15 -0500 (EST)
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
X-Inumbo-ID: b8713a2e-9b12-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEwMy4xNjguMTcyLjE1NiIsImhlbG8iOiJmaGlnaC1hNS1zbXRwLm1lc3NhZ2luZ2VuZ2luZS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6ImI4NzEzYTJlLTliMTItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNzY5MDE5LjU0ODQwNywic2VuZGVyIjoibWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1730769017;
	 x=1730855417; bh=J+7P8xteRq8wQlNyzyUG8rvcwFv0gFU76i55be+PgCM=; b=
	D4E9+8t30BkKGBD438phCZS6Q15LpA79mkhII2FOwP7KsQWWnrAEd6sk49bD7HdL
	VKwNdOeqeMt4+pEu1qHu/Q6bGVuSeynC58u9qN8bk1i4nqdPvgFI5PQ07mPA03+w
	ARyr0L8fXkNzY9DywLA7KTSMIeHCBxoffSeUGLOYsX0eq5CLIyWYjlOssI32t0vn
	zWP2FyXFuwV0rgv1yQsNa8Xa8t6DWxDpkMS4RVvfD+1tb7wJvFj5QOXppM3zp0Q+
	cEU0w10fleE7aSZ7dZE1r2OkY0mCXKbSZW8AuAquCrfOtgCXwJzIxEyjYar1q18u
	IvC1vQkA5rOIk01j6UhGBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730769017; x=1730855417; bh=J+7P8xteRq8wQlNyzyUG8rvcwFv0gFU76i5
	5be+PgCM=; b=VaKd0dmPY6ZPIJPf854WYcLh8gYlj2Fq/BBIeiT+kXCEei1kXvW
	YGmzH6ARRCI88q/0RKr2OSBc4oZgeJ9MopEOhuZx9wPE/2GwC1gbap6d2m+l7pMW
	HbllLM4IExyoF+ly+up41wFi9VKKslcEr7mlpdHyoyTTGhiCfUh+0BccVzMHAG4G
	1GillxWAd4QhkeSi2ogaRqlfr2MKaVIFWTFWWa8BLXXWd4HbT6EWxi/DroN5Ugiw
	la9z1IzwLkPzW10/lW5W1IO2OQfBsn4UJ05PSK4hXHEe5MEHiWCJEyXF2iv6aVjE
	FopvfM3IWPJ9UpACzbj6ogtUyo9gPUNI1MQ==
X-ME-Sender: <xms:eHApZwmDAtThtKpsS-_F4--EG5LJacv0bgFOfHjfemMsYAzJtKyYXg>
    <xme:eHApZ_38DWlXXJ1fCG2NWxvoQC-8inbeKwjAs8HgzCtmN3M_LbdipmWK0ryEcV2tY
    xGYpfykYEpj6w>
X-ME-Received: <xmr:eHApZ-pd3OKVP_02figXy2wA3d1UCGKDb4P935op8D07eB8F7Y6wPVwBZK3H397r2NR6GyR1X-ZW9BYEAdtf3OvgCuyztvGCQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeljedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtvggu
    ugihrdgrshhtihgvsehvrghtvghsrdhtvggthhdprhgtphhtthhopeigvghnqdguvghvvg
    hlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgv
    fidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepjhgsvghulhhitg
    hhsehsuhhsvgdrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdprhgt
    phhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehluhhkrghsiies
    hhgrfihrhihlkhhordhplhdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhssh
    holhhuthhiohhnshdrtghomh
X-ME-Proxy: <xmx:eHApZ8mkz1goYWSyH53Zl2A9VNWmJLuAy68WafUkK2DCa5dcQdygTg>
    <xmx:eHApZ-2DBdI3jLiRI71oZ2MAoXtBp_V0FbtiabRNuvNc-2pzqW_fnw>
    <xmx:eHApZzu2QgZmhYYmjyIih_Zox8ii2xWywq1ouMIkllcYwgSWwYYwzg>
    <xmx:eHApZ6UqIjWpC865u9FDm01SzAOjQK4le6g4szcgti9ObOXMH2pvCg>
    <xmx:eXApZ8yJK1QdPdgU4vzRttvRnit4TwXdLb4GOhaMzfugD07ZTud_etnS>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 5 Nov 2024 02:10:11 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>
Subject: Re: [XEN RFC PATCH v4 0/5] IOMMU subsystem redesign and PV-IOMMU
 interface
Message-ID: <ZylwdZjIeQ9qRdc_@mail-itl>
References: <cover.1730718102.git.teddy.astie@vates.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t90/ENPpixzWsUkk"
Content-Disposition: inline
In-Reply-To: <cover.1730718102.git.teddy.astie@vates.tech>


--t90/ENPpixzWsUkk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 5 Nov 2024 02:10:11 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>
Subject: Re: [XEN RFC PATCH v4 0/5] IOMMU subsystem redesign and PV-IOMMU
 interface

On Mon, Nov 04, 2024 at 02:28:38PM +0000, Teddy Astie wrote:
> * introduce "dom0-iommu=3Dno-dma" to make default context block all DMA
>   (disables HAP and sync-pt), enforcing usage of PV-IOMMU for DMA
>   Can be used to expose properly "Pre-boot DMA protection"

This sounds like it disables HAP completely, but actually it looks like
disabling sharing HAP page tables with IOMMU ones, right? That (HAP
sharing) is relevant for PVH dom0 only, correct?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--t90/ENPpixzWsUkk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmcpcHUACgkQ24/THMrX
1yyXwwgAilkke7CKCVgF37PlQQI5UkTLaeb1vg7Dr3AjrEnfl3pGJB/GhIucugVY
T0ey3KOGFRly8uEC2cLaWZAexBbBeXdo0ZswAJD5f5gzdPmyaXiMJKxj/jwIolXY
tgkgPMjJlOVOZzKt/y8mM1uqGgAeCuZoNFfT6w3uBFFqza/YYw1xg5UtpvI+RXDH
7tWOgAA8+cBs6y9lMD3IDYDHz8CxkGZIqyeESBmZWKQNNhRLy6IWG9ILOc6dYzLX
gPKHqCI9g4MbNvrPdw4+DpBzZPh0JSb3My0zRB20E12bVkbPjgvfajX2kUnDEg32
LwK+01ocQ9BtBNJ9A/eOwOiLKXeteA==
=kPAg
-----END PGP SIGNATURE-----

--t90/ENPpixzWsUkk--

