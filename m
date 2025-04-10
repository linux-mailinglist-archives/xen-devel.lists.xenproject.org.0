Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B870AA842EF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:22:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945575.1343752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qur-0001Jb-E5; Thu, 10 Apr 2025 12:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945575.1343752; Thu, 10 Apr 2025 12:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qur-0001HM-BL; Thu, 10 Apr 2025 12:21:57 +0000
Received: by outflank-mailman (input) for mailman id 945575;
 Thu, 10 Apr 2025 12:21:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S0bf=W4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u2quq-0001HG-Fy
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:21:56 +0000
Received: from fhigh-b2-smtp.messagingengine.com
 (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63a541a5-1606-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 14:21:55 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id DB97D25401F3;
 Thu, 10 Apr 2025 08:21:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Thu, 10 Apr 2025 08:21:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Apr 2025 08:21:52 -0400 (EDT)
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
X-Inumbo-ID: 63a541a5-1606-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744287713;
	 x=1744374113; bh=ueYv8h4bJO34FhvM6yNlOYkNBilfAN/4nXoIzDs8cTI=; b=
	nRAlRqYS+hDEG1n1TZjRXL8n6XPJ9nhQ4VOVGmTM5gLUaog5HedJdB+1L1+YpFDG
	4wIhW3YOkkYadJL/Qa2CaDeXZxz8AxQSlB49frBpyoV7lI0rcQxtEBB/Et1gpDgH
	2t4X7PDWUpf4sok+gbWbQw76lA4o2QYKtj27EEChoUllH3zsScgutV0HBLpcFp6E
	t2jWIKLgQdTMcdt2TPYXAP3FHT88XXQgQBbON6TeT3Sk/hDD0z2OFZJvqY9w5Fw3
	Q2JpaTNHzgpSGEP7dA0YLfLAE1KHt5+Xe8m6W1cq7t9JG4wDvpW4d6Zs1uAZlxC0
	aUSFNEP5hs9JhMNxu7wruQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744287713; x=1744374113; bh=ueYv8h4bJO34FhvM6yNlOYkNBilfAN/4nXo
	IzDs8cTI=; b=vTCjN/ry64dERJpBmocqkdQw8ZSv7Ouej+2xJHmcoCIKBrIGGzL
	fSHpVjuHPD05iCtC9XAuoYcTmbeJ4TYXmHHgqylOyp2XWaE4vfvMIq8HtHMPMgVO
	s3T3s1wtVUe3rayF20QpFOGaCazEiUOsi5KZeWIwgX8nBwO3MwL6mlgLiv7Yw2ex
	IdYpsasQ15KAuacZzfAF8Cvg1YB+9knqPm7RerXByBlxlbS6tGNSkRM+Q3RXjvPo
	dEbbrcFXgDcLpW3JsEdJx3gu8J+BIJs+q9kpEbkLDe/hsVEUVmCVTb1XezdAwVKj
	n+a9cKOy/yULeStW2Drom4XNm+D42v5vVyQ==
X-ME-Sender: <xms:4bf3Z4ZIplnr0WrHUI86sftjh1CV2pctFILCW4KqCNMJj2grB6EVbg>
    <xme:4bf3ZzZhc-iLjHZSSbBYfmYJrii3UwFA9jYHqPg24VrIiLq8awI8Cy6gKDoyIy1Ej
    kqwZDXGqWOjWg>
X-ME-Received: <xmr:4bf3Zy9AnwtXg1FV22LIepTRFERX29R9xwl4u6a43jBYu_uY5G_kotGbaoF3G4xJXDbf0TtBMT7zZuFhqdqrTcJ1DyOwy4UdFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekkeelucetufdoteggodetrf
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
    hrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhp
    rhhojhgvtghtrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrd
    gtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtoheprg
    hnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthh
X-ME-Proxy: <xmx:4bf3Zyr6rziqtcj4etpDR8XhGoqci8Xt_F3CQ1IykwHcTEbov1FGqw>
    <xmx:4bf3ZzoEq4Tl0hzxVfBNcJyWsMNrLmGZLD9tHvgb9L2j86wMuSpX3g>
    <xmx:4bf3ZwSF-9ThcyvZP5QbQPlQv6fHESyW0DVxAHSFkKHHnLCWciAapQ>
    <xmx:4bf3ZzrM5jIx_xPnzaXdmKLRuCarv2wa3aUWBl1EGC6ZU-P63FfpoQ>
    <xmx:4bf3Z2I1VeTqWALtw50WqUM2hv3TsSoX2lgWYyMlZAgCcZWZ1XjG1IgM>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 10 Apr 2025 14:21:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 7/8] Infrastructure for arm64 linux builds
Message-ID: <Z_e33hdcaNKkqsyI@mail-itl>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <20250409163702.2037301-8-andrew.cooper3@citrix.com>
 <Z_aqUikDqi1UEOHb@mail-itl>
 <21a35c38-ce2e-48c4-9586-9c232f77affa@citrix.com>
 <8ef0f462-a487-4d76-84e7-9552c75995b7@citrix.com>
 <96fe43c7-e2a6-47d0-bdd7-e6284c86acfa@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Mwpm5XXH8Q73BYmk"
Content-Disposition: inline
In-Reply-To: <96fe43c7-e2a6-47d0-bdd7-e6284c86acfa@citrix.com>


--Mwpm5XXH8Q73BYmk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Apr 2025 14:21:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 7/8] Infrastructure for arm64 linux builds

On Thu, Apr 10, 2025 at 11:57:23AM +0100, Andrew Cooper wrote:
> The awk complaint has gone away too, so I suppose that's a knock-on effec=
t.

It isn't?=20
https://gitlab.com/xen-project/hardware/test-artifacts/-/jobs/9683454411#L1=
06

Anyway, hopefully harmless.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Mwpm5XXH8Q73BYmk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf3t94ACgkQ24/THMrX
1ywe2Qf/XCyErsxDslXTjSFoEr+Q71M/7T3dGHzpe6uaVxYmKi8ZcVbgWSISLuhb
sQ4qTV0MMOS3BN4Xk5SSvOqv8ywcTboWqFlDEEh5FFHy0pXj8SEEyjoInJBKZpbv
Pk/5WdA5Cq8mmlrg06Bf7u5sR5ivGBylkvrhdNjRChZuR6Nnr/Sw8Lkz7euPBZ93
P6yI/wqKuQQdw+KCgXayKGyU0HAHuKQ+iRMYCuSGeLEpR1toJB9wXT9O10ZCa7xU
jvsiM3hkFGxLqfsCNq1cnvDSOtztPdn+aPdh+C4aZDtmvXemHOMqe82eqP2h3Rws
q9d1GiDfrfOfcHpar5qYRWv9AJorVA==
=Mm3b
-----END PGP SIGNATURE-----

--Mwpm5XXH8Q73BYmk--

