Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B71649AB9D7
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 01:08:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824326.1238439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Nz1-00080G-56; Tue, 22 Oct 2024 23:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824326.1238439; Tue, 22 Oct 2024 23:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Nz1-0007xq-2H; Tue, 22 Oct 2024 23:08:11 +0000
Received: by outflank-mailman (input) for mailman id 824326;
 Tue, 22 Oct 2024 23:08:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=30Tg=RS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1t3Nz0-0007xk-4a
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 23:08:10 +0000
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ed6a510-90ca-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 01:08:06 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 332C811400A8;
 Tue, 22 Oct 2024 19:08:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Tue, 22 Oct 2024 19:08:05 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Oct 2024 19:08:03 -0400 (EDT)
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
X-Inumbo-ID: 7ed6a510-90ca-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729638485;
	 x=1729724885; bh=gLWyeo27jt32SwSzz1pf6JLWX5ghm4vG19DKUkdvu4s=; b=
	fZc6nkFMHOZNaHL/YPfkDrtr+5CccLoPqXEhDlSugLzgf+QkQoMSk4JO4iTeTDMk
	G8E5pCVXetRQogHTfjrhThP9VuRI0nSeyMfQo5zn7lXRVkAHQ/1EU3cFfOi0/hba
	IJVMAX2FxmWRhToz7JQU2KXbobGvctdejRZ7CBqYH9c2OUX6eSyvCQXKy/IPwRrZ
	toIwZc+I/Q8ITysk6s4BxNq8jqeZCGIQM99n2lfl1Q8BLhLsOiPJ9ZY7Cjt6hHFp
	JFS5JlQjZM0WwMLSkusPxD/HnTo8ORAclbis+mbg5GbKQV/ao6jsIx5oJdgdV5FC
	aOOdvkv/WEAjeLY+TtcI1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1729638485; x=1729724885; bh=gLWyeo27jt32SwSzz1pf6JLWX5gh
	m4vG19DKUkdvu4s=; b=gYEHqVpQp6VRHnXRl6d/VVRHFuq2xElKprhzpuURT7vg
	4e3JPp0/abERTz56DH9ILe4DmJg7wfBzJRhSiv5/1yn00iBMvdTd6ugS9Cst1M/H
	2b6IAyUA3HvYh+V29hRfboNYWyGl64ZRWdVDEA1e09YGLafEu7hOCZTjDDOq01LS
	DLZACHYSxuwBV9qeh8JOFW/uW7LIBjf2CccaDmfphsst06xhp/XWnUPvNjmEMRZW
	QtX5IGrCBcSNCKiEq6aY6zcj7w2qe/AuXZgumZq3NMrWbvF+9QqgSV5h0XaubixS
	mGE8hBycfZecmyCJ3ujzto4krRsV4iju63xjhPDE3w==
X-ME-Sender: <xms:VDAYZ0ORFsmZS3oUHia_DBgNIUIJgsyc0xRCAK3BbyFgGajGXh2OVg>
    <xme:VDAYZ68n2DADqKMFxS--YK25vPiVRnjuKPMB6iR9s22B2TkhrS_jjiAwIZcp7dGaL
    dgiP4ERp5LQGg>
X-ME-Received: <xmr:VDAYZ7R3ZE58GPGHJjFZF2EOBNezujTFXbXZSW9pm06nD99sUNQwe3e05HMAHb8CpC_N57mbQY2IefpTgogSVPiwgf9laow_OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeiiedgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhiqhhi
    rghnrdgthhgvnhesrghmugdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhise
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhhthhhonhihseigvghnphhrohhjvggt
    thdrohhrghdprhgtphhtthhopehprghulhesgigvnhdrohhrghdprhgtphhtthhopegvug
    hgrghrrdhighhlvghsihgrshesghhmrghilhdrtghomhdprhgtphhtthhopehqvghmuhdq
    uggvvhgvlhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslh
    hishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprhgrhidrhhhurghn
    ghesrghmugdrtghomh
X-ME-Proxy: <xmx:VDAYZ8sbJls7UmFmGjBY8wwnqIG_kc2QFUDujBzOFA4ymG0SLuUtRA>
    <xmx:VDAYZ8f7mfGghvNx4zXrTBWksMh6t9hP8VkfW39qzsaTCVvhRs2ziw>
    <xmx:VDAYZw2aH2VomF9pLbflbR4bzCU1Xy6Prfy8vl4Vin8TdQwqZ5TelA>
    <xmx:VDAYZw_XdS-GFpNDfEDvX5bjZgSe_TnQVvD3U_sbR17HOF5R8DCcpg>
    <xmx:VTAYZ6v75qRKf96NS14TSoKohg4irk9FlfPIPToQpThYNu3a34QufZXz>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 23 Oct 2024 01:07:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	Huang Rui <Ray.Huang@amd.com>
Subject: Re: [QEMU PATCH v8] xen/passthrough: use gsi to map pirq when dom0
 is PVH
Message-ID: <ZxgwUd3riLmFzFC4@mail-itl>
References: <20241016062827.2301004-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SkGEWvdQLHgEL56A"
Content-Disposition: inline
In-Reply-To: <20241016062827.2301004-1-Jiqian.Chen@amd.com>


--SkGEWvdQLHgEL56A
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Oct 2024 01:07:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	Huang Rui <Ray.Huang@amd.com>
Subject: Re: [QEMU PATCH v8] xen/passthrough: use gsi to map pirq when dom0
 is PVH

On Wed, Oct 16, 2024 at 02:28:27PM +0800, Jiqian Chen wrote:
> --- a/hw/xen/xen_pt.h
> +++ b/hw/xen/xen_pt.h
> @@ -36,6 +36,7 @@ void xen_pt_log(const PCIDevice *d, const char *f, ...)=
 G_GNUC_PRINTF(2, 3);
>  #  define XEN_PT_LOG_CONFIG(d, addr, val, len)
>  #endif
> =20
> +#define DOMID_RUN_QEMU 0

Please, don't hardcode dom0 here, QEMU can be running in a stubdomain
too (in which case, this will hilariously explode, as it will check what
dom0 is, instead of where QEMU is running).=20
Stewart already provided an alternative.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--SkGEWvdQLHgEL56A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmcYMFEACgkQ24/THMrX
1yzrtgf/RxY7ihUCUzl90Phvk7LA0aAjTgAlXY4tEH52qQTnO/A+Z2NDm4oSLjbH
GPiSPBEgeoFQCaRhSNA+jim37EFaYU70jK0KX6cLH8F47iZwmTYGvkGDRoTuEaQo
Fn/aiU8AbdMBhoW5gQMlQCr5xlHpyOwBoK7ewQXxJnQLGbGYBMNCm1HXd9SUTfTW
4PL1dFsnDuFHkYDvyoOYYlCTVa3tkI0jvROYPZknizN0LUU9FaUfNQI4jORR3x4z
2u9NJ5geSTvcU6qWFjAGUAQFC6D3R4S9VEYKxGf8AtGq1vn2S6+l6n6tXA4N7xAd
dzP9KRD7WxFiJBSLISLGfJUA7XDX8A==
=EME9
-----END PGP SIGNATURE-----

--SkGEWvdQLHgEL56A--

