Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAB9A87EAB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:13:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949809.1346264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4HkG-0007WA-VL; Mon, 14 Apr 2025 11:12:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949809.1346264; Mon, 14 Apr 2025 11:12:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4HkG-0007Tf-SQ; Mon, 14 Apr 2025 11:12:56 +0000
Received: by outflank-mailman (input) for mailman id 949809;
 Mon, 14 Apr 2025 11:12:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTEa=XA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u4HkE-00070E-TG
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:12:54 +0000
Received: from fout-b5-smtp.messagingengine.com
 (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68c9f9cd-1921-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 13:12:54 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id 646851140141;
 Mon, 14 Apr 2025 07:12:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Mon, 14 Apr 2025 07:12:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Apr 2025 07:12:50 -0400 (EDT)
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
X-Inumbo-ID: 68c9f9cd-1921-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744629172;
	 x=1744715572; bh=YHVwdMVjGL5QR3+dJJD3f1i/SiTiAAAKJev6o/FoUAk=; b=
	dqDh6ltbJxAA2cLDS4Z/qcC01ZTWsN+ss/D1vScdHTOLT+cdRUGWVjmi4k7U7kN4
	wzB54aQc4o7r+zcOqtoEklBqsW0g+8dBy+qOCF8YQSSaZxYK+pnwOb3uTczVpbXO
	jAZjLZXtI9ZUVoZ/Qkx+Dc3J/+455nLQCTUDenQ8TiujHT+Fol6Zkp5GY87I2Wq+
	V7lBkHDtjQeX4QSn36JelQLpEBn2zw3iKG4TtWAyuQ5IRXdstQkxriTJbnoZVWMu
	uL5BFa62rW5bGBJ+TCHoOO99j4xQursNLNu29GR4/fZkfK/cSqCIm6riL3HHqG3o
	huWEqaJ0JORwAJ6rrCWkYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744629172; x=1744715572; bh=YHVwdMVjGL5QR3+dJJD3f1i/SiTiAAAKJev
	6o/FoUAk=; b=Zljl5rADHdB4UVYMCWDz9uz/sX+JKdXQ2ciai7Z7o5zOg76tL9y
	XHl5vMcSG2qX30MYb8IF5jytsSXV8GiOxyV3jxH7hdZhWpwQHFvYd+ZUZl7Lqqd2
	UGWyPRN9PO7A3nFZ2oWy0U0pi60Dxmvf1hODIasORrBzXE1bP4ooq7fqf24Dypun
	J1//7L/JrxBtX88Tm01rlCQGtwOKg5X+CCI8ezOVe92fL21l1Ur4JxepjsTmMZX2
	YpEax6WRmuu5J17GdAoz3JoWKovBy3V8Y+2ee9GGMgZvmxd2jY3ANgx/bQ2IW0xE
	w9TGMPCHfUspG3Juc1l/0nzwv41UB8gO9YA==
X-ME-Sender: <xms:s-38Z5kEltDnesyVYKT4cPPjs79aY7S-ecRg_iWBsylkJJo48C9UpA>
    <xme:s-38Z02HA8tacxVwZFEmrFnMtrtH1laXPXDK1UGQg7wmFKX8G0bh8Imt7MsK-D9KY
    -5x_RMnes5aoQ>
X-ME-Received: <xmr:s-38Z_ohbBRmcu5V40J1A5Wd48y0jDd37mrKVi7c1xv4ziA-3wnOxdFjuY_h_FQ0LbHuldKy5UbvPCTtNgN1pRckI7BwyDaRug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtgedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegr
    nhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepshhsth
    grsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrghlrdho
    rhiivghlsegrmhgurdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtg
    homhdprhgtphhtthhopehjrghsohhnrdgrnhgurhihuhhksegrmhgurdgtohhmpdhrtghp
    thhtohepughpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhm
X-ME-Proxy: <xmx:s-38Z5l_7DvWl25EZixqrD93wxJ88HyAt89G1GCtfBoChbbZsCxCYg>
    <xmx:s-38Z32OpYkx4vULZBQiZlADC9ZZNurW7N8-J_rYboLNIJO73hk60Q>
    <xmx:s-38Z4uVpJug6bMUb5fecrEPHGWsSSlEJB4kEG61sTke3qTqlpwmJA>
    <xmx:s-38Z7UfMPylBxV139Y2V_ahtn1vb2-QkKhonNgmn0bdptTslGh4UQ>
    <xmx:tO38Z0_FGT1lD1SdZCy7uM8enLkZ2UQBEKK621cxUamQqKji8JsKgW6M>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 14 Apr 2025 13:12:47 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 1/7] Rename and adjust x86 containers
Message-ID: <Z_ztsNSt9xuu4GVO@mail-itl>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
 <20250414101843.2348330-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="34lndeIRtVUehhwL"
Content-Disposition: inline
In-Reply-To: <20250414101843.2348330-2-andrew.cooper3@citrix.com>


--34lndeIRtVUehhwL
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Apr 2025 13:12:47 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 1/7] Rename and adjust x86 containers

On Mon, Apr 14, 2025 at 11:18:37AM +0100, Andrew Cooper wrote:
> Insert the Alpine version as we'll need a newer version in due course, and
> rename 'rootfs' to 'base' as the container really is not a rootfs on it's=
 own.
>=20
> In base, add bash.  It's added later by the rootfs generation anyway, but=
 this
> way we can write the generation script in bash too.
>=20
> In build, group and sort the packages.  Drop the ones we don't need, or a=
re
> pulled in by dependencies.  Include diffutils, findutils and gawk to avoid
> warnings in the kernel build.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--34lndeIRtVUehhwL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf87bAACgkQ24/THMrX
1ywmzAf9FcCVuys8eiww8qNXoONqdd5bEE/KlpIZJuLcghK6K677fvkw4GQfjdXk
Ys+VTm7JhDEDjmYCkr1P5JtVJt6PeVErmRsTSzr8CJ4XJAv+uKQYz5ZxvUbSiG2D
KKbV9RrTzEBC2vZkL4XPcBZTey5fpDZBsVZBPSjBDAHEV1HMYToDoG3TJoueGeaU
1PzVU2i/hJdvKg7QIpK77mfEaiIFLd4q7wF/saJW5bitz4Kvj1o/yLmPKM4Xqbl6
UQYpOoDIgRoiHmlOG+wDIu7zSiAhpYY0A5ttfmuorQLNeErvAILpxM5oNVn1QH8N
ceF0bWrXj0op//wK2yBvNvt3edC8RA==
=thF5
-----END PGP SIGNATURE-----

--34lndeIRtVUehhwL--

