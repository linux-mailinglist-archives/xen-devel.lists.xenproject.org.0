Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E263144647
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 22:12:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu0lU-0006CB-8G; Tue, 21 Jan 2020 21:08:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DWdk=3K=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iu0lT-0006C6-Gf
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 21:08:47 +0000
X-Inumbo-ID: 35ebb596-3c92-11ea-bb72-12813bfff9fa
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35ebb596-3c92-11ea-bb72-12813bfff9fa;
 Tue, 21 Jan 2020 21:08:45 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id C959F6D7;
 Tue, 21 Jan 2020 16:08:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 21 Jan 2020 16:08:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=e2QYoy
 R22UHy0KIpagGUWrz54lhmbukRKADJRkVvHBA=; b=TWRUKTrXGJygaZfCtpot0c
 D7uMFGC1Zr/ufMsf6X/mqS6LishcnLs0I9wuN5sSqCy0E+shXz9fUnLAPEL3FO7D
 NGbNnRA0tjx10kGjrBkYl9LHV4NHRvVNNWKCodwCMvI7NQoOx5FIm34VaLLi7n/m
 8FKBoIfVLvSOuNstUsgPTvL6rmOzd1N1cXDZOXZufhP+p/Q6SVVpdqzToPWqBa5A
 IsjZSVaeK0Z//nMUWv0WlYTtXZPWXAP3OG5LiEbLktlGsdSsYh3HoK0WYlP6BuAw
 VUjXI2X9FWgOhcQCzgKcDkWeoaIIbuSFjpeldpqu5ZFmYLySHHDh6/djEaRLaARQ
 ==
X-ME-Sender: <xms:XGgnXn-futsACrwFoEPlOYwL10gDoKRwluVNCF5dVi2cGu-h4Yxc7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudekgddugeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:XGgnXhHb88DHHErFfG-ppETzHzBbdWES6I6_WLz6dtIKpK92Aeicbw>
 <xmx:XGgnXsUDVMnmPUy_Qc_3b98V6aJlajBC4lVxIklKA5hbU7WtNVnRLA>
 <xmx:XGgnXt8BhRffqLD-mdNTSAOe7EADrGqUfIB5-N7BFQm0jAIpzuJDdw>
 <xmx:XGgnXmXnnlyWHEsug63dXLEMmujJukFE0TR_FaNitsygTivSsb7noQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 52CB33280059;
 Tue, 21 Jan 2020 16:08:43 -0500 (EST)
Date: Tue, 21 Jan 2020 22:08:40 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Message-ID: <20200121210840.GO1314@mail-itl>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <5f675457fe322c265b3337607bc78f07ffdb43bb.1579055705.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpt5Pjs_XWoEHaJkfgo-FnMigfgKKZ0weZ6egokcpiwwwA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKf6xpt5Pjs_XWoEHaJkfgo-FnMigfgKKZ0weZ6egokcpiwwwA@mail.gmail.com>
Subject: Re: [Xen-devel] [PATCH v4 02/16] Document ioemu Linux stubdomain
 protocol
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/mixed; boundary="===============4897993534886774704=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4897993534886774704==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OL6cD/Uw4z31vgI6"
Content-Disposition: inline


--OL6cD/Uw4z31vgI6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v4 02/16] Document ioemu Linux stubdomain
 protocol

On Mon, Jan 20, 2020 at 01:54:04PM -0500, Jason Andryuk wrote:
> On Tue, Jan 14, 2020 at 9:41 PM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
>=20
> <snip>
>=20
> > +
> > +Limitations:
> > + - PCI passthrough require permissive mode
> > + - only one nic is supported
>=20
> Why is only 1 nic supported?  Multiple were supported previously, but
> peeking ahead in the series,=20

This is mostly limitation of stubdomain side, not toolstack side.
Startup script setup eth0 only.

> script=3D/etc/qemu-ifup is no longer
> specified.

Yes, that's to allow -sandbox ...,spawn=3Ddeny inside stubdomain.
The equivalent actions are handled by listening for qmp events.


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--OL6cD/Uw4z31vgI6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4naFcACgkQ24/THMrX
1yz98Qf/YGYNq5BcmR9ff0rRRVT3YeGt32Sd3NcZNAmnkrEFmF51/qsWtemDCPOd
iu9TmWTBRLUugOgCZcgXu5Y7q53eQT2KnIKz2QmlY9dwbWbzvNcAGo3UHEqS3wcF
1lxxp+qTqF2O5dPI6BSfyXKyGO0Fx/V1YkwRnu4DVFMK5BxhKyP3UeepEzFo6ftR
xAykkA6BoSGRtOw5nMmhLuQB+4i/29W4a13GDvec+eaXwUrErTsKBFB4JddT8xm4
RLMQtk6ABXOsUtAO5JreeyB0I6NGd7B5zvp4p/lXH3sXAZocboZZlCE1UjIaKrXz
kfP29nxdNhsYxPHG0tm29MWz8aLnrg==
=weyy
-----END PGP SIGNATURE-----

--OL6cD/Uw4z31vgI6--


--===============4897993534886774704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4897993534886774704==--

