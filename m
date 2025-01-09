Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65669A07814
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 14:47:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868402.1279920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVsst-0000RN-1e; Thu, 09 Jan 2025 13:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868402.1279920; Thu, 09 Jan 2025 13:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVsss-0000OP-Un; Thu, 09 Jan 2025 13:47:38 +0000
Received: by outflank-mailman (input) for mailman id 868402;
 Thu, 09 Jan 2025 13:47:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eYg4=UB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tVssr-0000OJ-Cq
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 13:47:37 +0000
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48274380-ce90-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 14:47:36 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id D6CF7114019E;
 Thu,  9 Jan 2025 08:47:34 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Thu, 09 Jan 2025 08:47:34 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jan 2025 08:47:32 -0500 (EST)
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
X-Inumbo-ID: 48274380-ce90-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1736430454;
	 x=1736516854; bh=6x82qhagMZTKAmMzmxkVPAv3wNezZPg5u0REbe78dwQ=; b=
	CvHNy04IyvjcnnWguTcHHBIUaw3LGS++mZhpa7hfIU8Y+yyTCY4XIoAaOJLOnPvE
	f1k/iGTJENDXP/sh2sw23q+5JF/HRGRHlSrv7pPUW9SiLpbQpgy7bvoZ48QczvjR
	GDrCFZIszQfskz3kiXdSBLNBx2gt/z/xyLP1JjCpm0IZcKFN+1qAQy3DgfDUQWJ/
	5p3Ace8o4/Kglstma/HsNtTbnyT3FJYGsC5PpUM67ONN2dPfc7ekrnK7U/M0aRaj
	u7a+E9YY5m6CGYKK2E72Rey+c2YIK/NuRaaLqp6p1i5W4ybh+mEXpKKAi1WMtUhQ
	QtV23sJBBtuxgiNMNtaaAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736430454; x=1736516854; bh=6x82qhagMZTKAmMzmxkVPAv3wNezZPg5u0R
	Ebe78dwQ=; b=AHXGe0ixUCR5SgVORxTnXO0q/ToG19eYCDwbQPabfv1VFIZ2EP/
	zmAfOOtfuifNhXy2xvJtmlPOOy9lmVym2qUtB8EKnP/8X8fSHVg+q7yscJ6ZQ5lP
	m5uEIF62HSmc+6fQ2ec7DcBHgy4lb0eh1F65YIzHmyfpGm4QB22JINBpBxzOGDXY
	0NYmKDUXgndeRd4Dbt9aUGkjB8wZl5N9rV2rtxPkEPlqyrzXwXUPOAqe/kkjfuaM
	qsx2rxim+vXwpa0uF0kCUWhsxqBO93m4XA6Z4xbdVYP1/PDrnrncf8Z1t6K7vEc6
	TW9wV0ysZMGAfpCUYz8w4BmyPpFANUQ1qAQ==
X-ME-Sender: <xms:dtN_Z-WSBn16sO_RB9cD46FBDD4kpBbVse2Cwgzi1LCMgPS1WHPUXw>
    <xme:dtN_Z6ll2GwgfVB1vGinmn81HTlx9iKZ0wkdnYOBGuN9mpluhk88F6ajYFdXPrjiV
    4eDtggVL22oEA>
X-ME-Received: <xmr:dtN_ZyZ3pQDqlLXvVpKpTQpwzqL5jKEKSUsARp3WxIDWzTN2U0ahrrXOnhMdYMQyohSQRwthH_91lj3Vekm_wk5vQwYl1FUG6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghu
    lhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehfrhgvughirghnohdriihighhlih
    hosegtlhhouhgurdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegt
    ihhtrhhigidrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtg
    homhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggt
    thdrohhrgh
X-ME-Proxy: <xmx:dtN_Z1VLa_85opJMt6-WRHNmHeys0wHv-KUbhcXUGVmK2c8Ona2G9Q>
    <xmx:dtN_Z4k1_YqX9oUqgrzi_Tk9ffr-snKXgl1p8_GoJ_NWWCmRHevy-Q>
    <xmx:dtN_Z6d9G1Wlm6Z87ihkma1cL59sVnLqws2MsWohJlEhzBWdnXsm1g>
    <xmx:dtN_Z6EbKgoVwU3RfF9_fb8qWGO3XWwDKpWOfCy3g5VtpaD6sLvpnQ>
    <xmx:dtN_Z3vs7RyKwWgUgY_hb6TokRYiA0KwU1oDLHP8sHHzwKhC_UTYl2j->
Feedback-ID: i1568416f:Fastmail
Date: Thu, 9 Jan 2025 14:47:29 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/boot: adjust text gap/diff to work with 64-bytes
 alignment too
Message-ID: <Z3_Tcu_ZtZK4kkiD@mail-itl>
References: <20250109131515.1757764-1-marmarek@invisiblethingslab.com>
 <d7421558-c2d6-485b-96bf-927992c5c066@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dJ6kpmnJ7JlK/IYM"
Content-Disposition: inline
In-Reply-To: <d7421558-c2d6-485b-96bf-927992c5c066@suse.com>


--dJ6kpmnJ7JlK/IYM
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 9 Jan 2025 14:47:29 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/boot: adjust text gap/diff to work with 64-bytes
 alignment too

On Thu, Jan 09, 2025 at 02:23:27PM +0100, Jan Beulich wrote:
> No Fixes: tag?

I guess this would be appropriate:

    Fixes: aa9045e77130 ("x86/boot: Rework how 32bit C is linked/included f=
or early boot")

(but not relevant for backports, since that's only in 4.20 release
cycle)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--dJ6kpmnJ7JlK/IYM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmd/03IACgkQ24/THMrX
1ywZbwf/YEEvAnbHvWFp/MJPfaEopy2rxQLls/00O27vp4UIHiclAfgYI5cG3s7b
jMDI6ebSJVl65vuTvhkc9mJsmMYdQ1WiDrkVXAwTMCJGtaJ9Pl2gJ65E9QnUxqKF
U6WG4nHXmK7DPsTmmg99TTHN3OQpIGMo6TQkexQCnTXA0aTM9ZO83y5ysx9HpybR
bU9UHjDGcja/4hfcdwELVRBoWuCa++GLaUJbRW8c0074tyvtcbs8EpFqqsa5p/es
GxR5y60MbAnmyr73BdAG/A7upGlb0qCHgNn4xoGgIlHI+flTDSwzzLsB5fXMzT5c
ii+Z5kmkD0ViH9CB11bLHnpRDWgUjg==
=k1xQ
-----END PGP SIGNATURE-----

--dJ6kpmnJ7JlK/IYM--

