Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1297A144659
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 22:22:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu0wI-0007Kc-7Y; Tue, 21 Jan 2020 21:19:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DWdk=3K=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iu0wG-0007KW-RG
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 21:19:56 +0000
X-Inumbo-ID: c0999afe-3c93-11ea-8e9a-bc764e2007e4
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0999afe-3c93-11ea-8e9a-bc764e2007e4;
 Tue, 21 Jan 2020 21:19:48 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id EE69F54C;
 Tue, 21 Jan 2020 16:19:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 21 Jan 2020 16:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=YdFo8M
 I34y1hyajSoNCQhUlXxsWAk+G2H/iWcW/GSXk=; b=lLfGZTFBD4rjAqZrbchMUX
 jKAoimMOwj3iGKGH12yuvdw1UyMQLcHNVz+hsCv6bJOFXetjdFzCUf+wNsnPNoRV
 IMr2I/OOxtbySqrwlqHDnpThlo/4Er/Ae0AOXVZ817wQ7wQKpTJx9oQGhrmtx1Gt
 kiyZqnz/V3qHuxBZqPcJtA6MBbzXUfnSI4eo5XujWHorTjMyFsqcVVsebiiu5V2e
 zzv2TEoZC1QOOz0vFjoSP9oVwQpkC20K9/plTj4RqKye0+qj0TpV7urRJxt0IgrD
 vPLC/M5RtFZKu1QhJi6SowZwWd1QWg4W1X72nl636ofJCYX5D2NQGaWN4OklQylA
 ==
X-ME-Sender: <xms:8monXsL2O1ep3pLx1qBWvBotkpusca44qCjS6e2gtyDv5UkTTZkB_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudekgddugeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:8monXiL8pZNh1kPWc-Oen9ZgX2WgOm6mu9Qwzw1HOnhTkjDIzmBgvw>
 <xmx:8monXqXc0x1khtOFcADQOcPAtlSjkbjsiEzyGPnYoy2nJ2XCwOn8zQ>
 <xmx:8monXkh5Z7Hv-LN_M5dbE7f_kC5sKrpTL7-9hiqRoJBzWxSnAmBY2g>
 <xmx:8monXtMJeJUwRCP8-03bLI5K5wrdgfmd58yECa1n9gsOj2Dx1XxPyg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id A14FD328005E;
 Tue, 21 Jan 2020 16:19:45 -0500 (EST)
Date: Tue, 21 Jan 2020 22:19:42 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Message-ID: <20200121211942.GR1314@mail-itl>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <cd76e3559f841d3072558d9c603dc686f67d54c1.1579055705.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xptXYOwWu8V-mZh5H5o+gi-O01AmAw9PEuYVu0opUCpH3A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKf6xptXYOwWu8V-mZh5H5o+gi-O01AmAw9PEuYVu0opUCpH3A@mail.gmail.com>
Subject: Re: [Xen-devel] [PATCH v4 06/16] libxl: write qemu arguments into
 separate xenstore keys
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: multipart/mixed; boundary="===============6966452349130817119=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6966452349130817119==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DgyySQcJ59QCrNUU"
Content-Disposition: inline


--DgyySQcJ59QCrNUU
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v4 06/16] libxl: write qemu arguments into
 separate xenstore keys

On Mon, Jan 20, 2020 at 02:36:08PM -0500, Jason Andryuk wrote:
> On Tue, Jan 14, 2020 at 9:41 PM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > This allows using arguments with spaces, like -append, without
> > nominating any special "separator" character.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > Changes in v3:
> >  - previous version of this patch "libxl: use \x1b to separate qemu
> >    arguments for linux stubdomain" used specific non-printable
> >    separator, but it was rejected as xenstore doesn't cope well with
> >    non-printable chars
> > ---
>=20
> The code looks good.
>=20
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
>=20
> One thought I have is dmargs is a string for mini-os and a directory
> for linux stubdom.  It's toolstack managed, so it's not a problem.
> But would a different xenstore node be less surprising to humans?

dmargs_list?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--DgyySQcJ59QCrNUU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4nau4ACgkQ24/THMrX
1ywzkAf/ZJFSsnY6ZKzPGSMm9BiD6JejzV5R21qGbSMvrDrFaaSXVuW5NCsHYH7f
fmtCfmKDbwMLsz97fb15Yv8o8C+F2gT65QSqwCczrF412H/6rZlKhXzfuB0Vt9vj
ew7zSBuWt02S3YHgyeFJfyGNc1CP+Hzadh7JS7alEAxrSN+zCKrNsz4qWm7IHVWy
0QAfG0YtitQ1luHAw7w5xEtFJEJ4DQglsrb+G/ebO44fcjICjAXUmb704oBynlzQ
MFeM+B8JlBBJWq/IguaR89Kc9Ng3AP1nHxfoJG/WGHjBue8jVwbjsWlTjss2VdZK
7kOvLH2yHv+HNz/q6FQWa4gh8mdPnA==
=qzjs
-----END PGP SIGNATURE-----

--DgyySQcJ59QCrNUU--


--===============6966452349130817119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6966452349130817119==--

