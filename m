Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F031625171A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:08:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAWoC-0007V3-26; Tue, 25 Aug 2020 11:08:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+Rh=CD=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kAWoB-0007Uy-2g
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:08:07 +0000
X-Inumbo-ID: 1d92959e-86f5-4c96-b5d0-7bf3016a733b
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d92959e-86f5-4c96-b5d0-7bf3016a733b;
 Tue, 25 Aug 2020 11:08:04 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 783FA871;
 Tue, 25 Aug 2020 07:08:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 25 Aug 2020 07:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UTMkGR
 gtHAVs8aYLS02+eeUitynCoJNksaH/IkElyF8=; b=Ta6/0sCntUgUmADQhHYEY2
 vDoafBBKS800P+M0b7NH8MjneoWe8sa6A3HZUoSPPtw7HdKajMaKTBpqvVblc/ZR
 +SY6GBqTsaJOgEAxBT6dQ0hB2hauKhv3Fdz41Ha5GL+A9cbihads5RG5HUc3w9NN
 pqmixE9mHagIPMgNHDuoEzLLC3d8CMPiZxFt7MyIqWm7uSYPSy3tj5deIZ+ahrhz
 vptPKebGtNBKlJcqF6LTF7lWcfChdd1UNu8kho2bTy9YuW4npJrfuGsyEGechEvv
 t/0opXh01NzfFcNzmSa8jzz7ciU3GNXj+RKbzVmAO4Glx+mhDGCSRCtbPx7FLR4w
 ==
X-ME-Sender: <xms:EvFEX2wmS01j0wUrDkERzozTEdyAQMIt21lHaJqyGhIDa1dw1bIGzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
 iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
 durdeigedrudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
 drtghomh
X-ME-Proxy: <xmx:EvFEXySACsnNzyHVZh10WUZmvJtO5cGh3Hd_5T66HyvFY5qe_mVW6g>
 <xmx:EvFEX4U_KVkeeBOiOMZKUSl6Qc3eU9oft1z8w4eFKBUnPIL23Lvm4w>
 <xmx:EvFEX8j1IC9hnKweyOxchcvMnMzDlpc8h-KHrGM1of1o5Hr8_SSU2g>
 <xmx:E_FEX38T6cBSDPU7KAUGUKmC3bTIS8tTzkOZe2ImRHuXaQfsZiCjzg>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 29C3D30600A9;
 Tue, 25 Aug 2020 07:08:02 -0400 (EDT)
Date: Tue, 25 Aug 2020 13:07:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 11/38] tools/python: drop libxenguest from setup.py
Message-ID: <20200825110759.GZ1626@mail-itl>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-12-jgross@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LhiTpD9feYeyTwZl"
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-12-jgross@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--LhiTpD9feYeyTwZl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 11/38] tools/python: drop libxenguest from setup.py

On Sun, Aug 23, 2020 at 11:34:52AM +0200, Juergen Gross wrote:
> There is not a single wrapper for a libxenguest function defined.
> So drop libxenguest from tools/python/setup.py.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  tools/python/setup.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/python/setup.py b/tools/python/setup.py
> index 8faf1c0ddc..44696b3998 100644
> --- a/tools/python/setup.py
> +++ b/tools/python/setup.py
> @@ -21,8 +21,8 @@ xc =3D Extension("xc",
>                                        PATH_LIBXC + "/include",
>                                        "xen/lowlevel/xc" ],
>                 library_dirs       =3D [ PATH_LIBXC ],
> -               libraries          =3D [ "xenctrl", "xenguest" ],
> -               depends            =3D [ PATH_LIBXC + "/libxenctrl.so", P=
ATH_LIBXC + "/libxenguest.so" ],
> +               libraries          =3D [ "xenctrl" ],
> +               depends            =3D [ PATH_LIBXC + "/libxenctrl.so" ],
>                 extra_link_args    =3D [ "-Wl,-rpath-link=3D"+PATH_LIBXEN=
TOOLLOG ],
>                 sources            =3D [ "xen/lowlevel/xc/xc.c" ])
> =20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--LhiTpD9feYeyTwZl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl9E8Q8ACgkQ24/THMrX
1yzZbAf/entzzoXFcFSifX1koapRacvgZEOGIiYkb7roheYJOW9R/5q+tXLcGyGN
jw7hnkMHjOEQ3jEgTumyTOvO8L4oDCTGzfKCAcXFBFZXy9vh2l19l69pBXxutcBi
AZDpysAaQ8hB24V9Mvt22jpM6VKzCDa+tByQI/dCYaObY2ndPfd+vi8LyMz1aFW2
3XLKjCs+odi/eeAfkXp1x6SE8aIyX3Xr/e4N/xj26i/xIeGIwG0pm4gPx+fNg8Em
0F7fVl7m4fFYAFqEXDhCb3Ex9PCRkgJPXvTiiw6fu5ZNULmay23BoghiZ+hOewh8
HQ3cyM0KwF+suPOr5L/Be6b0sUkOLg==
=yOu0
-----END PGP SIGNATURE-----

--LhiTpD9feYeyTwZl--

