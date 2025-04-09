Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B73A82D59
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 19:12:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944500.1342946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Yxu-0005F5-4i; Wed, 09 Apr 2025 17:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944500.1342946; Wed, 09 Apr 2025 17:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Yxu-0005DY-22; Wed, 09 Apr 2025 17:11:54 +0000
Received: by outflank-mailman (input) for mailman id 944500;
 Wed, 09 Apr 2025 17:11:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=np/6=W3=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u2Yxs-0004xy-OX
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 17:11:52 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9c4f89b-1565-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 19:11:51 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 8500A2540073;
 Wed,  9 Apr 2025 13:11:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Wed, 09 Apr 2025 13:11:49 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Apr 2025 13:11:47 -0400 (EDT)
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
X-Inumbo-ID: b9c4f89b-1565-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744218709;
	 x=1744305109; bh=KyGBuymLTk3CL0dsm7ZO4d64GHS0vA5Km1872M27gKA=; b=
	dIIaKHAaHoo4e6GsfbU8zFUr+wqTbmIe7efa5wqWdOiAtFjFCnqtpno/Y5xSpB6y
	caNoRKSlXdOjstsK+tAR1/ATAZKucJ/Rq0FR+YLyiVhWywVzb2Za+HtJ83CdfV1i
	A5NsXBpGw8ImdBzKLjm8Enpa9Lovpf4WqgbSmxL+8siTdaecXdqfGPjSkuSigV4W
	RcG7Fi56BA4lrNOZU6qlbY4iNOcVQztYpB4GtGtXx3cAIAVnBaAcyNIokleoa9Dr
	hlIrBkAban97M7N4Q3hqGZiwXqMPWUxUTIcWeLFEFVaX6xp2jcDN5A1M8zKgWByz
	Re8oRiID7gq2tl6iJ6KT7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744218709; x=1744305109; bh=KyGBuymLTk3CL0dsm7ZO4d64GHS0vA5Km18
	72M27gKA=; b=vr+pNm0ffh2a42NXrhOtdgLRldkfxE2ceYUnz0Oreg159burAEt
	lYxUTJ/cOrngQ5OV/C3ihQdRdxVZdL4A0RfJ60y+s/c7Dkt16JUVHMRIiWAWhckw
	8buxvX+GMM5g4J3z42E16bJe1895xrrQ8Hma78cnrdycT2fYeESdgzHF8mUdhJpd
	nXzHyr4vi16OtgPQk//1Qkjt0Hq1C1ZGFPiEX4ePtRmiXJwGoiny3HfbDXK3Qelc
	cTkcxrK9ccYnRkOQ8O5tneNH/oI1BNR8Gfg99cTn3//9kwg+XFdWzfnY36WupVqY
	8dbx0tEe43d0z7dz+o4QHZ1uzSyujNhANrg==
X-ME-Sender: <xms:Var2Z_yYjrbr7WsEBV_pA-JCndVEn7miJpw2FU-eY1cper8XK9mSuA>
    <xme:Var2Z3Snb7Dy8jNHRCf3bchOoOMGOqCt2gJt58H3NCO-Tsxnjulrqiw7lE_Fkr968
    OEgTR_aUMvNvg>
X-ME-Received: <xmr:Var2Z5XcTF7obb6rS4_5g692fhWYh0jxJfEpdfQGdT3_-yG5rZi2NoqKRzY-2H6UAMuHTV0JMPTi1cRqo_evE-LtLp9BRSMlmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeiheeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehr
    ohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllh
    hinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrlhdrohhriigvlhes
    rghmugdrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvsh
    drthgvtghh
X-ME-Proxy: <xmx:Var2Z5g1JwlFQwVu9M9DkBvzs7ydhKJTEgZraM0oIm7u2ScstTEIug>
    <xmx:Var2ZxAmPJQGa56v5Q2Nlx1zGieVhQETHoVzCS1Tp4qyHVH9RlmKaw>
    <xmx:Var2ZyIxdZ9MqgY-LSTCxtr4JHEdPiTEPafO8h0oBdBgUDe4bss9cA>
    <xmx:Var2ZwAJAGkWuV2fA7XBzzlH6gYyHfqZ-zodkbbZt1GLXn71JXxKZQ>
    <xmx:Var2Z4BU0QMnejPrRizeffktDa1BayXdKHbMga8LD-K9Cgw91sfQcK0h>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 9 Apr 2025 19:11:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 7/8] Infrastructure for arm64 linux builds
Message-ID: <Z_aqUikDqi1UEOHb@mail-itl>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <20250409163702.2037301-8-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wkketGG8waHhY6pA"
Content-Disposition: inline
In-Reply-To: <20250409163702.2037301-8-andrew.cooper3@citrix.com>


--wkketGG8waHhY6pA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 9 Apr 2025 19:11:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 7/8] Infrastructure for arm64 linux builds

On Wed, Apr 09, 2025 at 05:37:01PM +0100, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> ---
>  .gitlab-ci.yml                            |  7 ++++++
>  containerize                              |  1 +
>  images/alpine/3.18-arm64-build.dockerfile | 27 +++++++++++++++++++++++
>  scripts/build-linux.sh                    | 10 +++++++++
>  4 files changed, 45 insertions(+)
>  create mode 100644 images/alpine/3.18-arm64-build.dockerfile
>=20
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index ff8dce7be05d..6e38c2f2a108 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -19,6 +19,13 @@ stages:
>      exclude:
>        - binaries/.gitignore
> =20
> +.arm64-artifacts:
> +  extends: .artifacts
> +  tags:
> +    - arm64
> +  variables:
> +    CONTAINER: alpine:3.18-arm64-build

Arm64 kernel used to be built in a Bookworm container. The build in alpine
has "find: unrecognized: -printf" in the middle of the build. It doesn't
fail outright, but something might be broken. I guess it's related to
initramfs - maybe some option can be disabled, to avoid this message?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--wkketGG8waHhY6pA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf2qlIACgkQ24/THMrX
1yyGZgf/TWRO49PiQdqqP7chOt0BER0aXPIVOFc31hkWexOaBGBivpAIYX6FHcTQ
D9ead4oRL4tVtlZVVhlYsoptFWpTVs0Q+796ezPScLhL3ibjtMGS4evhQFNncvp7
tvF3Fx4mu7wW6qv7cL9JR4jLs2tSEDgeL0HDnF5hxu0iaUjtsP2UoCX+8jcb6dAe
k5F0aVsoHvTIYWnrYhJUpIQi6pusOCQoQaEC3nOxYj1dyaxS/uCi6/8VoIF/MszX
j6e9GTPx9+Asmheairwyv2tnBpBMtzvSSI/6NrXCgGQtMCncGrt5AbtFGb0V0TK6
AC83+V3U3kLiSWRBK9cEr/fifHYoWA==
=ZkJt
-----END PGP SIGNATURE-----

--wkketGG8waHhY6pA--

