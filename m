Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029859965FF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 11:53:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814108.1227207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syTNI-00041O-KG; Wed, 09 Oct 2024 09:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814108.1227207; Wed, 09 Oct 2024 09:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syTNI-0003yv-HR; Wed, 09 Oct 2024 09:52:56 +0000
Received: by outflank-mailman (input) for mailman id 814108;
 Wed, 09 Oct 2024 09:52:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3FS1=RF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1syTNH-0003xZ-2x
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 09:52:55 +0000
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40334e0c-8624-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 11:52:53 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 18B9C1140193;
 Wed,  9 Oct 2024 05:52:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Wed, 09 Oct 2024 05:52:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Oct 2024 05:52:50 -0400 (EDT)
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
X-Inumbo-ID: 40334e0c-8624-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1728467572;
	 x=1728553972; bh=OBh7dvA1WDHaX0NNMpBXn4Qg0apWW54k1iTKqpaG4to=; b=
	DSXQbPdcA7tHhbRsmLF0cBuZfcMwwg9rMfl1LwNthFBjQDOGuRZjSKHBUL8ufO7g
	oFSblSaBHuVUCD9wsfUFSddSs/IFT/kYuXcb4exJsUZ457wHeTHThWwY2nvdTLKS
	oWR95/TzCzeuZa3ff9KLNuBCTl1SSeMXm5KQ5xL2c6YKBX2cB4gr1INekOIKZJqS
	aQu2aRbGlCQjCBgjc1/00+krds3AvzpMwT/tU6QP0estPPSJodE7edUs1wyozfk0
	/mOp76NdAzw2mtf9IggsrL0fj3qq3QbSg/Af+IQuXuHMoloaaO0GDF5jlumNzVlN
	mZyIo+p/ncde2rVyL6YrhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728467572; x=1728553972; bh=OBh7dvA1WDHaX0NNMpBXn4Qg0apW
	W54k1iTKqpaG4to=; b=KMO52tzmS1XSuiKrsEY+7Kq2xUnCDUOb6HOp/VEsAx5n
	USoD/LkPSU8ps4W6tNYKEV7h8MQiTc5TgZfFptn1aZzlY6GQvgpZiNCbT02xuqNl
	hpKLjXBN/hgGi13WZYlZ9oka5W2xD6LKvS7a6q63+Pd6MfwBZHWrTFxQZxT+T0Kk
	ox6O30mWLQ2RSF70ti23SGbUjccTqIEDOc25qrg8sZ5awo4GIUE3RzCN6le9wZO/
	kUSQKHdh77eHsUA3oE9IVYA6T1vwAmYeh3CEqbRiq+jxtTOXWPupF1AmhkG4tG6i
	ilDB8cbQigH6XO0cwL6B4RcRrIlFrweTptJL1iy+Qg==
X-ME-Sender: <xms:c1IGZ1O4SX9a4dAawGwWs86fjzpCxwFQ05Q3m3NkWy7Zv8KTY64Ryg>
    <xme:c1IGZ38peJxnyRGQCRwO4jfzqMo7cZtci4nujRMjsEZRQPvhdn2674Xcgp_UbMzbn
    NOIvxMT_bq33Q>
X-ME-Received: <xmr:c1IGZ0Qd5u4LqQYyYeMGISxt80qtCAtOMRY58wCmmObD39KZ2_RiKhQHJ6USuv6bsqFll4Y3vDmVWLdHTlmMwwZ18f12NB4Ozw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeffedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghu
    lhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrug
    esvhgrthgvshdrthgvtghhpdhrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdp
    rhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdroh
    hrgh
X-ME-Proxy: <xmx:c1IGZxv62K1c5x1ScJvTPGlbdUGTKAOlUDrrUh1ls8oWZ5Zp7toFrg>
    <xmx:c1IGZ9eDPi0_l-N1HgNdh2a_1fuHgbJGPbOZAiphXzn7xEAYpyHEgQ>
    <xmx:c1IGZ93oK-vpgVUv0E6bFx5C40PPnCb2RX4Uo4X2YwFLq8aXS94A3g>
    <xmx:c1IGZ59FQlmFpFrptaxYTwGzo1DyKOTjGSzRIlxW9W4h9X8aOS6hhw>
    <xmx:dFIGZx6t42ahbsRPfvfbApeyS1SjcDHcWS87-Qow7VIlBg840MH0Ppz9>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 9 Oct 2024 11:52:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/xg: increase LZMA_BLOCK_SIZE for uncompressing the
 kernel
Message-ID: <ZwZScGr75xEolDnS@mail-itl>
References: <20241008213225.728922-1-marmarek@invisiblethingslab.com>
 <226bc9b3-6741-4cb6-917b-1164e340a19d@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GfK0RJaHWu31FjkM"
Content-Disposition: inline
In-Reply-To: <226bc9b3-6741-4cb6-917b-1164e340a19d@suse.com>


--GfK0RJaHWu31FjkM
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 9 Oct 2024 11:52:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/xg: increase LZMA_BLOCK_SIZE for uncompressing the
 kernel

On Wed, Oct 09, 2024 at 09:19:57AM +0200, Jan Beulich wrote:
> On 08.10.2024 23:32, Marek Marczykowski-G=C3=B3recki wrote:
> > --- a/tools/libs/guest/xg_dom_bzimageloader.c
> > +++ b/tools/libs/guest/xg_dom_bzimageloader.c
> > @@ -272,8 +272,7 @@ static int _xc_try_lzma_decode(
> >      return retval;
> >  }
> > =20
> > -/* 128 Mb is the minimum size (half-way) documented to work for all in=
puts. */
> > -#define LZMA_BLOCK_SIZE (128*1024*1024)
> > +#define LZMA_BLOCK_SIZE (256*1024*1024)
>=20
> That's as arbitrary as before, now just not even with a comment at least
> hinting at it being arbitrary. Quoting from one of the LZMA API headers:
>=20
> 	 * Decoder already supports dictionaries up to 4 GiB - 1 B (i.e.
> 	 * UINT32_MAX), so increasing the maximum dictionary size of the
> 	 * encoder won't cause problems for old decoders.
>=20
> IOW - what if the Linux folks decided to increase the dictionary size
> further? I therefore wonder whether we don't need to make this more
> dynamic, perhaps by peeking into the header to obtain the dictionary
> size used. The one thing I'm not sure about is whether there can't be
> multiple such headers throughout the file, and hence (in principle)
> differing dictionary sizes.

What is the purpose of this block size limit? From the error message, it
seems to be avoiding excessive memory usage during decompression (which
could be DoS via OOM). If that's the case, then taking the limit from
the kernel binary itself will miss this point (especially in case of
pygrub or similar, but there may be other cases of not-fully-trusted
kernel binaries).

I realize replacing one arbitrary number with another is not really
future-proof, but also the last one lasted for over 10 years, so maybe
it isn't really a big issue.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--GfK0RJaHWu31FjkM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmcGUnAACgkQ24/THMrX
1yzDogf/UzSSpAawMIqxqVks02iu0ekNdZO85w3sVoYynfwH9I++KHV6Ri6UmO4f
YDBDpIldHZ3sWYErh0pxlI5Ixu4vhHIWCuiHVOmbI5eAbttuSpzU78MsVDSJJFlY
3YRQywsqfxzwTtuJ/xDnEXdbSdmUgsXP/UXjkLrVl9FvP17ZSh8L67fZIQ12iM28
yoqq/e5at1/14ieDro4l433yCeqBJIdW6T7xIZTk6GowSdyjK2qIRyF68C3asp+M
T0p4Z5zXucrZiq/S4ZoFe7o0kEzja+g+tLfPpOLVVUQtyKFCk3o7uQTjgJPCCYsA
Rc5DKeI21j/x6RnK8OPKUpAvQp1DWg==
=BbQq
-----END PGP SIGNATURE-----

--GfK0RJaHWu31FjkM--

