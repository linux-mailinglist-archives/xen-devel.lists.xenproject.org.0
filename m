Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC32A84770
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 17:12:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945942.1344002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tZj-0006Is-Ky; Thu, 10 Apr 2025 15:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945942.1344002; Thu, 10 Apr 2025 15:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tZj-0006H0-IA; Thu, 10 Apr 2025 15:12:19 +0000
Received: by outflank-mailman (input) for mailman id 945942;
 Thu, 10 Apr 2025 15:12:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S0bf=W4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u2tZi-0006Gu-Mv
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 15:12:18 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fdce4bf-161e-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 17:12:16 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id 4009C114011A;
 Thu, 10 Apr 2025 11:12:15 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Thu, 10 Apr 2025 11:12:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Apr 2025 11:12:13 -0400 (EDT)
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
X-Inumbo-ID: 2fdce4bf-161e-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744297935;
	 x=1744384335; bh=eiEAOtsXDP9baMp9V4pZMymBdEZy0F1ljlXF8z4os2g=; b=
	f8cN9lh3QUR7yFjjyfk3/C8a0myZhcQIgx/0QMkBbDFtI/4FwX6zQXNDOk0Tf/gJ
	4hQiWWFLRtUFmjlPBGDbUyv81LrTxvin/s5wonUu41o36bInti9lMBEch9BbJn/F
	kkFZndACxLqtHLuxUE6Qo26DwoJZ55gTkq3pd1iWTqiT+aMX4+SJ5Npk6KB0bif1
	bpiGvxMibtb7kkg686oHJVmBDx/TiOTqRi4x8zisFbHAgtec83cBuENFV4EL3NDd
	mORSwwdK85heHTTxAjufaf9YtuwcLMNp8+zvckSVfRTpxhkLf96Z3W68y1eiFPSq
	LRTlnksjAkQEbvRC6gvneg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744297935; x=1744384335; bh=eiEAOtsXDP9baMp9V4pZMymBdEZy0F1ljlX
	F8z4os2g=; b=vFry99XKvfYWC3imLj8SBgtx7sUcuOr0N0mlNIJAFomO8LT/dI7
	VyXAyBCm43MaQ26QqtsulyNlKQhUr/E1wvxYeD5uuibv8onc1m0Wq64po4Uc2iYF
	wVFZK7TW7w12JZLEuxQuqFb8xJkOPjT6JmnlEOp4cGX8QIhNJ6suGjnvm8+QNzvV
	83tksas8jCrLPRoq/X60pBgp7gmWrCKZUlBE3NDLF0vl4umjUIL2/FnRyduXoJb0
	EAnh/17CRDsZPZ7p4+gr4vqXDz+2QcuFlufClxngc4gXWaOJpvfpwgfJAauK40QG
	wNaJahaW3xlEAEj93torVccBIdS/BtpRVJw==
X-ME-Sender: <xms:zt_3Z0V-cv2MhoK7n6fDF8RHOXDEISIo4vk8MfXM2aPxmOc4JRZD3Q>
    <xme:zt_3Z4ndw0yKGVeBeoVpZ2jheuLL7HJQAXtyBfdU7u0jOV44lUteNXH7ZdJhp0qx9
    jOXA-qO76JOCA>
X-ME-Received: <xmr:zt_3Z4bBGqjfeQOsSL0t5EUusS8CVveWVl-RY7qSeF8iW7zF75De_1aYhbRwy0S88tTnRW30j1IdXvOiqVRQXuOotD2KqO9C_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdelvdefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:zt_3ZzU2rn1114MEebSePh6RPcDpqiJJ72c_3yxnAHuxuOOCdEEIHQ>
    <xmx:zt_3Z-l2ADPlTNuJk3t6jixpsy5mxUlcxEtHSaiF7omOH2949cBJng>
    <xmx:zt_3Z4eTuk8Y2z38KcGrGQgdOTFYj2yJwtghB8u5rIemUuRPEU1GKA>
    <xmx:zt_3ZwGsDRhmrR-YICYq4xZmUZty7eVxx2QAtCaqmzh02nggscrRgw>
    <xmx:z9_3Z45K-aPt6ZucBk54pixQAmdXmyRdlB8VCAQuNgucjJVe6S982p7Y>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 10 Apr 2025 17:12:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/3] CI: Update ARM64 tests from Linux 6.6.74 to 6.6.86
Message-ID: <Z_ffzPamMV1VSKg2@mail-itl>
References: <20250410120520.2062328-1-andrew.cooper3@citrix.com>
 <20250410120520.2062328-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v2PHikepuSBYYhxb"
Content-Disposition: inline
In-Reply-To: <20250410120520.2062328-3-andrew.cooper3@citrix.com>


--v2PHikepuSBYYhxb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Apr 2025 17:12:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/3] CI: Update ARM64 tests from Linux 6.6.74 to 6.6.86

On Thu, Apr 10, 2025 at 01:05:19PM +0100, Andrew Cooper wrote:
> Switch over to test-artifacts.
>=20
> Drop the associated export job, and dockerfile.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--v2PHikepuSBYYhxb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf338wACgkQ24/THMrX
1yyCtQf+O6yDh8DP02Vvo2Rjkb7mug2/2dXeqm7blZjZ1Iv4fHG3q1Ev3/zW5fn7
/xACspv364UXeElk8EjzynHZ9rn2lyU5butyMh9tZwv0pSkgCfLdnpx+XY7LxMJ6
8CVQpM/7CKEw+xgPJErkImL7ScQTA4L5HVs8e7d6ElHgwXOkw00Qky4cW6S+vKnw
UFkruNG1YO25/YaEaLORfSA1bA5Xu1ZTSp1jC9eFiM7A+dH6Ia9hovs1zCh0x8Fh
jlNnocmw65p9lQbe90pRGfkd0Qi1PXruofQKW9fepFbelEs/CzfaYBjP7KJRb3hx
H+38OIDLVjXuAmjUlh2iGLJgsyoXnA==
=Ksk7
-----END PGP SIGNATURE-----

--v2PHikepuSBYYhxb--

