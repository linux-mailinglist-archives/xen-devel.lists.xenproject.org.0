Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2546A8848C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 16:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950461.1346770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Kh0-0006oD-U8; Mon, 14 Apr 2025 14:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950461.1346770; Mon, 14 Apr 2025 14:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Kh0-0006mi-QZ; Mon, 14 Apr 2025 14:21:46 +0000
Received: by outflank-mailman (input) for mailman id 950461;
 Mon, 14 Apr 2025 14:21:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTEa=XA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u4Kgz-0006gm-Fm
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 14:21:45 +0000
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9b7f9cd-193b-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 16:21:43 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 092E525402F3;
 Mon, 14 Apr 2025 10:21:42 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Mon, 14 Apr 2025 10:21:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Apr 2025 10:21:40 -0400 (EDT)
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
X-Inumbo-ID: c9b7f9cd-193b-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744640501;
	 x=1744726901; bh=Mbt7L1xWIl5Ld+tmGpuhRHYWq5CPpb5A8BVIw8O6Yxk=; b=
	BmLNj1IWkJNmQBakWgV0eOVlTnyAKscVCgjz5OfXRi3IfahNz45MPrajZ3NcAOWT
	ysrYxxn7QBnvinOLey2VQ4tLkr+ay4hTWe1tw4/tdhdX+yKypJaJfomxMhTTgT/D
	lLIzOlDB7MdysJCq7Vax2i5QWyM0E0g4lknh1Q9pRlk98Tw9jinte/zrbYikpvyd
	PEX8DtsOHC9zgVQ9dbKaRxGt0ad12Cq7v2VoppKhpWy/IaI/x345yq3xp9VuT5Dj
	Wbi0xpKE7cpamOGWZfHGX/HGmhVoQ1TOu+6QRvVfBUOmlzAwy+cG6S828yJffJkZ
	X74XqEygnPMw53fdeYg5ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744640501; x=1744726901; bh=Mbt7L1xWIl5Ld+tmGpuhRHYWq5CPpb5A8BV
	Iw8O6Yxk=; b=n9X+XYDDlcgmqi9ZlzgIKmvDg5rMpX6w5kGYmVSIAYwwPEETFL1
	3AannwupRA21URGceezoObryTCUNx05jHwMrxm88OsKZ1EYOgvpGREiw9+Nc5Bsf
	4AVs6nc5g5WVtm8ZZglfKmApphJcmJ7TfwFM+vmXnMMKZuToa4JsRO3XV/PLFRIS
	exxTAxWWK2fDFoJToxT500kYugHtws6mvW2yxy8UuaZY+MKq5/Mo8k+abGrUbDm5
	T0qFKvrQ3+kQwHtZVNuNomgwBhf3L0mwqA9yZJuUAlp8/McxL5u8bE6E546CqJL/
	+O0HizW2w0pW1YRb4YeBv6aV2nWzLmyhN4Q==
X-ME-Sender: <xms:9Rn9ZyItP0LNYFsvUb8WyyW1jYw1yrC9HCn-hvmQcU9ln06cM3jSVA>
    <xme:9Rn9Z6LfwFY_GNlQhSJqUQ-YiWTBGTPowysdyCcU81-RpgG8fbBRd98n6fiib2D4t
    a8AcN6l2Jnaow>
X-ME-Received: <xmr:9Rn9Zyscw9Vm1SOnUqNcPH40vIKBKxolF85jbXina3-f36UAr7wB0cdqOUpUAdY3rFz8CUOjpVm-V7K5O9uiA0h1rbCe8KY9XQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtjeejucetufdoteggodetrf
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
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegr
    nhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepshhsth
    grsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrghlrdho
    rhiivghlsegrmhgurdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtg
    homh
X-ME-Proxy: <xmx:9Rn9Z3YM6dWow6XPAj35MYONG2hC1w3dMwz7mIjlVpqzZZwyCPnaww>
    <xmx:9Rn9Z5YWeIJpfGO4IkVbTSXtMBBIiNfaiNA8S7GpQCmCx-NU8I8ICA>
    <xmx:9Rn9ZzD-mtiorCUgoqhYvvCIV_Cly133JBsjs_reK83-ZeNNt78J-Q>
    <xmx:9Rn9Z_brOuFNrGj2MVc1g45F4YDtTb0QjT6r-Tnsk4sdEX9NGFwWIQ>
    <xmx:9Rn9Z2tDcNGX9TNmvttxMlZQvY4N8qcs9j_bpk-ZkCM689HL3Ba4FyRw>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 14 Apr 2025 16:21:38 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 5/7] Adjust directory layout for rootfs.cpio.gz
Message-ID: <Z_0Z8ottaFVxxlu1@mail-itl>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
 <20250414101843.2348330-6-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xR1UuYPl7b5TtVyB"
Content-Disposition: inline
In-Reply-To: <20250414101843.2348330-6-andrew.cooper3@citrix.com>


--xR1UuYPl7b5TtVyB
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Apr 2025 16:21:38 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 5/7] Adjust directory layout for rootfs.cpio.gz

On Mon, Apr 14, 2025 at 11:18:41AM +0100, Andrew Cooper wrote:
> All tests using the rootfs currently modify it with:
>=20
>   mkdir proc
>   mkdir run
>   mkdir srv
>   mkdir sys
>   rm var/run
>=20
> This is because the rootfs doesn't have the correct top level directories.
> Furthermore, dev is currently included when it oughtn't to be.
>=20
> srv is easy.  It's an empty directory and can be included in PATHS.
>=20
> dev, proc, run and sys are all mount points, which OpenRC knows how to
> populate on boot.  Create only the top level directories in rootfs, witho=
ut
> `find` recursing into them.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--xR1UuYPl7b5TtVyB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf9GfIACgkQ24/THMrX
1ywC3Qf+PcQDHTlDkI9WWEw7kIE6kA3MdpOHcvx4W36K1D8J8rARqHuqIC33J+q2
TgggXKY9S2nI22aTol20fIjI1JxioOiN1V90EPrk8tSySJfZxDJuxqvHn61Wz8Tv
MgXXajxKFcUZ/+/vYPKpLBQ/UhMkSfFDjYOz57WDi9l9WU51DUjoVT4cHQ5GS2Y5
XPy7j3aJeIB32aez5jVRjuKe+7MO+HqNIfsUdMPaR+Q5et9R0F/4U4ahPScEz6Sy
bbHMk0+KK2NaRBzBxsyaCGeMUCyPrFlFF16wEuQ2wT92/JJt45Pqev4r7Vlf3849
5mpDrIx9Wd2GQJsylHaEDAsD5+zciA==
=DChZ
-----END PGP SIGNATURE-----

--xR1UuYPl7b5TtVyB--

