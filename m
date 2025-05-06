Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DA6AACC0D
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 19:16:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977860.1364785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLtp-0003bS-DQ; Tue, 06 May 2025 17:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977860.1364785; Tue, 06 May 2025 17:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLtp-0003Zb-9c; Tue, 06 May 2025 17:16:09 +0000
Received: by outflank-mailman (input) for mailman id 977860;
 Tue, 06 May 2025 17:16:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u2/q=XW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uCLtn-0003I5-RF
 for xen-devel@lists.xen.org; Tue, 06 May 2025 17:16:07 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4c43c99-2a9d-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 19:15:55 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 4CC3313814D6;
 Tue,  6 May 2025 13:15:54 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Tue, 06 May 2025 13:15:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 May 2025 13:15:52 -0400 (EDT)
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
X-Inumbo-ID: c4c43c99-2a9d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1746551754;
	 x=1746638154; bh=r3C7Cx71JtnvXS2B9VHdE8tIW7iQ8lSDLZJ61gznPeU=; b=
	jutSPlto6G1CZkPno2H60NBXE1PvGZC3Ks2bwBpUmt0duCsnOFMZlJxPoKlTFTfd
	nHzpJif4pqDrkExlIwPAn7bTJvjKR6ZXU1YkYriG2PgpoLDeCO7KtcaOBrmVoqNP
	F+FIcRnto2Q1duY6Y5C2teNo6+vuNK815VoGh29wDf6gDdn5AVQDiUaLF6Qgj8xB
	BuZGiRGIlSjv8PS2cUgf4RIHL0eYgZJeugOSqC5QZrrN22hFMuRbu+SOuCtvZwif
	NE+S6BO+eYMROt0KSW9EjMjBJiziEvEKMHvFs8zJgVyE/3jkOfLJWXZQLCEb99f8
	o4N1P+4CYa7kfc3SNns2HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746551754; x=1746638154; bh=r3C7Cx71JtnvXS2B9VHdE8tIW7iQ8lSDLZJ
	61gznPeU=; b=doCtDDJdj17ewHE6q1oO9kfuRizcDxdMoLKpJ83pnCsBWIH68pI
	urt2vnGtcNN+14IHY5IJ5aJRRVA+rDAxwmYbKeUC1r828UcsGUr7lOCWOno7AqZa
	pT2a6N4AwOHF4FBEi5KObsT+xjUMKQVPmdrO1NurOmQmUIcOWls/Wm+8G6bHBAN0
	NK1/1CkthqPHZGfmAq20Fh0HA+iuYKJU/3LM+iVTJ0IxSoyE44CyJJQEaP8aHewI
	hMYbxXnWsuysajk7b/9Eh8n6TTKqWeQMvGZruJdluDDJCx2X2SNiWCP73Nc46o2p
	5ib4I4ZNo7MPkM8U9vFljgUB/GU6Yk7UMFA==
X-ME-Sender: <xms:yUMaaG3DeZlzMupzsUFwNnYIANiPxutVr11lX3dP2dzEqtlmfF_MHw>
    <xme:yUMaaJE_3rTzqvGk7LZ1N2G8AQ-M57GCC8ekKCEMLc1_iLc6Dvb39EgrRMKrCTUsx
    7jbRi_M5ozvSA>
X-ME-Received: <xmr:yUMaaO6uyf7lmZSp3uCDun35T2LaK9I6KHcaEJOD_wF-xBbxjfq1oCZZ9mArCCxcipfUoX6AtyEpOeJw2b2i3QYCteYKVlfgnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeegheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepfeeggfekvdffhfdvjefggffgleeitdetfeeifeeigedtgedvie
    elkeeuueejueeknecuffhomhgrihhnpeigvghnphhrohhjvggtthdrohhrghenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkh
    esihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedu
    tddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoshhsrdhlrghgvghrfigrlh
    hlsegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhs
    rdigvghnrdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnh
    hprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihig
    rdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtg
    homhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghh
    pdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtoh
    epjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigv
    nhdrohhrgh
X-ME-Proxy: <xmx:yUMaaH27VJtK-oJjrGNaDWJEq1FoXMlUFQS_ZbYXytBHlyHuDVPN2Q>
    <xmx:yUMaaJHmBb2TLykrCaKRSqGC2C0_eWfba51f-Nw0A3XM3I5Gq2UOAg>
    <xmx:yUMaaA8OPJVbkBRCvuENfpICfVWUJ2LK10B0fAAePQQwScPdW-HRpQ>
    <xmx:yUMaaOkHpemJmf2POfMZhHJpLdGzC-WZ0LhbV2MQDRKzLXI_uenLgQ>
    <xmx:ykMaaG6SjMpqZL7BjyqomoGD_QuhIJGndMSutyg5hrv2Gz0yXI2c4rkR>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 6 May 2025 19:15:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 0/4] LivePatch signing support
Message-ID: <aBpDxXKVHdt8IQX5@mail-itl>
References: <20250506143218.1782603-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YXVRcQecoyfcOYEc"
Content-Disposition: inline
In-Reply-To: <20250506143218.1782603-1-ross.lagerwall@citrix.com>


--YXVRcQecoyfcOYEc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 May 2025 19:15:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 0/4] LivePatch signing support

On Tue, May 06, 2025 at 03:32:12PM +0100, Ross Lagerwall wrote:
> Live patch signing support was mentioned as future work in the design
> document several years ago. This series finally implements support for
> it since it is a requirement of Secure Boot to prevent loading unsigned
> code into Xen.
>=20
> Note that this series depends on another patch that has not yet been
> merged:
> xen/lib: Export additional sha256 functions
> https://lists.xenproject.org/archives/html/xen-devel/2025-05/msg00222.html
>=20
> Jennifer Herbert (1):
>   livepatch: Verify livepatch signatures
>=20
> Kevin Lampis (1):
>   livepatch: Embed public key in Xen
>=20
> Ross Lagerwall (2):
>   docs: Introduce live patch signing
>   crypto: Add RSA support

Patches 1 and 4 seems to be lost...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--YXVRcQecoyfcOYEc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgaQ8YACgkQ24/THMrX
1ywo/Qf/atQOQQW6QhoNBolkdNVltezJOOcRY9duo5eiChUA4nXVPqBaAjrjIOuE
cbjLBvCgAtQD6Vd27+guh7HSmK+pY5TAThLvk5/5wKFWbMhHwcwgfhraiEVmu/Rs
94K+ji4QV1LOovsvUA5jFkDu8YnbDsSNORxVWTOQo5FKdQkFvDV0k4Y3GOJa+r6T
gCzA253bhK/sYh5JR0DB/aZWcrBw/pqfGhBkQgCZSic4dd0XYqNSdYzDCOxuYDDT
tTh9LZTyLm6l6pluEf+b6OG0zXAJEsherix7LPdN4kypdKFLxXhQfXlUvRyc4wHp
AU9U0FHuM8nnPclE5l0tSCL+ug/Xyg==
=JXur
-----END PGP SIGNATURE-----

--YXVRcQecoyfcOYEc--

