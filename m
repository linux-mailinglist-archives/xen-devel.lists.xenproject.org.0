Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49729A3D56
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 13:35:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821764.1235707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1lGF-0002np-0C; Fri, 18 Oct 2024 11:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821764.1235707; Fri, 18 Oct 2024 11:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1lGE-0002kv-TX; Fri, 18 Oct 2024 11:35:14 +0000
Received: by outflank-mailman (input) for mailman id 821764;
 Fri, 18 Oct 2024 11:35:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L8t4=RO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1t1lGD-0002kp-6i
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 11:35:13 +0000
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0817e1fd-8d45-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 13:35:10 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 52AED11400B9;
 Fri, 18 Oct 2024 07:35:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Fri, 18 Oct 2024 07:35:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Oct 2024 07:35:07 -0400 (EDT)
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
X-Inumbo-ID: 0817e1fd-8d45-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729251309;
	 x=1729337709; bh=J9e4oENcL/5Vc6tFtkpQbGyrpkQM0D537/k26suPCmo=; b=
	ha1Zq1nuMaiWRcoFxJXo0Hh2pMa7emGH3OZrLXSNfbLJYS/fCtTWvuFqxPMQHJ/Y
	QA0kVERjoEgv40yV90QOyBZL80Z4V+f6zCqOD6BensMmKPPRIm0v0Od4fOw60tdU
	5/rMB2WyzMGLKBiQk7csFIoEbu1c30icg+fnOPmn6FxW79B9yRSv3d98InnLgzz6
	C+sRn73ut+89SmunEBagdhSA4XYkr1yzPrMM5P4EuS6dGKfz0TidhYc7jMooHY8x
	T+oPfXMkdX3a24y1o1lGWopYVDsHVgmPO5PXO+KerliYPYDAge3F7Bri0amuXQY2
	fJj3mAQy2Kz6S4CjnhvPZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1729251309; x=1729337709; bh=J9e4oENcL/5Vc6tFtkpQbGyrpkQM
	0D537/k26suPCmo=; b=qMcjG9ZMGG9fiJ9xV2upltHsely95dqAxL47tsTqhMxM
	1Sj11nW12J4735QgbZb08qz0QHwxyNOa9E6NT6DdjkovWcCHQGtRycRxO1XkAlaM
	AajMh3zM3+5xkKagXVhCtP0nI5oczyG4sjwMrfLVVNEDGDlnXLJ0i+Nq/8xRGRrt
	AuBA8RegWiz1gI3+U4oJrskiwSutDSXl19ruF/CejmjVlk5Y4de2Gx7LfdPw5R7D
	zEZXrc7bVrZtwTFX6D6OzLU3Qcq9Ri2zchv7A/5EWsdm3a/fGgzkK3sO4zQmSCCi
	UZJwBkli3rfhysznANFy6W6Fs6zi4S0hQ2VxcFjVGw==
X-ME-Sender: <xms:7EcSZ1ySbF9rbamiUdOjgtLgqgdoOUmF58RCpkx8PlFKg6U6OnwRTg>
    <xme:7EcSZ1QVfykC53NIMxBLYrDwA1PF__yp4iqNYGI3459DahRvtIshgyxoYSa3USe1s
    0O41ybI-Dw1ZA>
X-ME-Received: <xmr:7EcSZ_XkFVErc7GIfmvoW5Rtv2o07PDMVKrw0tRjUW6wtscXWgZ5RQvAtfrjyQn4TfAowTx6Xv6AzA9YcDpIIGJj7BlCtzQ7WQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehfedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughr
    vgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehvihgtthhorh
    hmrdhlihhrrgesrghmugdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhs
    thhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegtrghrughovgestggrrh
    guohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheptghhrhhishhtohhphhgvrhdrfidrtghlrghrkhesghhmrghilh
    drtghomhdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhuthhiohhn
    shdrtghomh
X-ME-Proxy: <xmx:7EcSZ3gGxv4hYdib-xdFichxzGY9pyMkmR7PyCFK8JZMUi6j1L0vTg>
    <xmx:7EcSZ3BVBKfYEAs0ZEwiVak2pNLpNPUN_PaucEAWpnJLthyJAKYO5Q>
    <xmx:7EcSZwKdwWX60Z98e756-RCiWYYUqTibgbf0xo2W6nIQ30nnHRcaHQ>
    <xmx:7EcSZ2A39TJCkUftTfxyZvsHUKhotRwEMdSj8fcO3tGalcnWWu-q_Q>
    <xmx:7UcSZ51G05BMTD7-IAPTj4K6CIbFHFaIYIRsbkiiBIL3Q0k1JRHdHxv0>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 18 Oct 2024 13:35:04 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: victorm.lira@amd.com, xen-devel@lists.xenproject.org,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH v1 0/3] automation: add x86_64 test (linux argo)
Message-ID: <ZxJH6BNsM7Rt7-U8@mail-itl>
References: <cover.1729183051.git.victorm.lira@amd.com>
 <40f27418-08b3-4b74-889b-12720be8f9c7@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yCpBQ9XTvwErHfDn"
Content-Disposition: inline
In-Reply-To: <40f27418-08b3-4b74-889b-12720be8f9c7@citrix.com>


--yCpBQ9XTvwErHfDn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Oct 2024 13:35:04 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: victorm.lira@amd.com, xen-devel@lists.xenproject.org,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH v1 0/3] automation: add x86_64 test (linux argo)

On Thu, Oct 17, 2024 at 08:25:57PM +0100, Andrew Cooper wrote:
> I was thinking of experimenting with a separate top-level repo that does
> nothing but has a few manual runs to populate artefacts, and having the
> Xen tests pull artefacts from here rather than from earlier build jobs.

This sounds like a good idea. It may also help with rebuilding
containers when needed?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--yCpBQ9XTvwErHfDn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmcSR+gACgkQ24/THMrX
1yynZwf/Q0+I/qaoHTvLnCileK8GnIKYJXltS4V7uoKPwjUM10gqzNZaJQPabGDa
L3Uv01UvIYR0PaAmbQ61MufafH/ZwrliAivwOC6CqFDuE7dGiJJ5AGY/mYLkT/U6
pGWGjSKzSn4PI6t0WU5ob0m0EiWAEourwoKndRDt4VQrYBJQk0RWLewivkCYYbRo
3wllojL8XsU9Kvj9/W2Xr8nWPHarw4hWyqHy674i+q/G7zxMjvctasFlvRs4EHlk
bK6dqWC+dsl3eS5RX0rqugbqB7jV/0AYBosbvZylRGQC2FO1+jSbNUwo3qPpzgR9
oTP7Lxxe9qpKgrGEUozr8NTczhNOwA==
=j5yA
-----END PGP SIGNATURE-----

--yCpBQ9XTvwErHfDn--

