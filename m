Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE4A14464B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 22:14:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu0p3-0006zr-Cl; Tue, 21 Jan 2020 21:12:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DWdk=3K=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iu0p1-0006zk-Pn
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 21:12:27 +0000
X-Inumbo-ID: b4915298-3c92-11ea-9fd7-bc764e2007e4
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4915298-3c92-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 21:12:18 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 53B33613;
 Tue, 21 Jan 2020 16:12:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 21 Jan 2020 16:12:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BmA75i
 cf6gD6deYOJBbbE9gPagvqpxINpgOMfzuwOTk=; b=irxjw845KUFKFSBTtu6MAX
 tR1/9gbFaOuyQ0jbSZ+1syRcw1cruofVIb/4oTF9oL/ulJ3wLls+qn0sqii/a7+1
 mhPWxWlGJ+38Ap+gQM4HOtsTREnuH58Lbxu5+tNg51CB/edAZporyNNA5oa+FPHa
 lVspW7DMCGnKHbu0FA2/8lxJwsTCEbcX0Fc2PqzaM++r8XP69xTcDFtIYy4rSGLL
 XAH/eB4RfOaVGUcvH5UoyyUvNNhGc5LTPNXud7NsO/fMS1Y9FbQRmkl0t51ao1rI
 ZfNDKe1HUqTdbggMFYHmIrORov75wIomPSnLDy8KoaehJEgGHaoNUV7iG+rH7XQA
 ==
X-ME-Sender: <xms:MGknXhh6G0ZLBkmSJAKFa5HBK_JqoIWv5ESklFb3y5XTczCj71TYZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudekgddugeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:MGknXmJsjFUtD9_djmpwh7-_e2rhdsdqAkeRHGe-r926TtZb4avYxQ>
 <xmx:MGknXu6PWHcI-x1IKpR-Ws9JrBWshgTsKxUIIIOsmkAugTAkeOnPGg>
 <xmx:MGknXqhbYgnyfxIiRGz-Pm0X2Y4QS_xR9kiQPE6koTvZ-wgcqpT15Q>
 <xmx:MGknXgAIvXbfCE2JIFHqPhDyFL3vHclM9ms5slXl2X7e_8HJtbQNCg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id D8AFD3060A36;
 Tue, 21 Jan 2020 16:12:15 -0500 (EST)
Date: Tue, 21 Jan 2020 22:12:12 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Message-ID: <20200121211212.GP1314@mail-itl>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <ef0bef56e682bff2aaa04250212bc2c3fd9ed8ce.1579055705.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xptNPBe3ZT3Q9S7g63cxtQKhMaBTODHGz+TBNfKCDmgLEA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKf6xptNPBe3ZT3Q9S7g63cxtQKhMaBTODHGz+TBNfKCDmgLEA@mail.gmail.com>
Subject: Re: [Xen-devel] [PATCH v4 04/16] libxl: Allow running qemu-xen in
 stubdomain
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
Content-Type: multipart/mixed; boundary="===============8958961722546624155=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8958961722546624155==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H8fFO+isr9ADh2Iv"
Content-Disposition: inline


--H8fFO+isr9ADh2Iv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v4 04/16] libxl: Allow running qemu-xen in
 stubdomain

On Mon, Jan 20, 2020 at 01:56:51PM -0500, Jason Andryuk wrote:
> On Tue, Jan 14, 2020 at 9:41 PM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > Do not prohibit anymore using stubdomain with qemu-xen.
> > To help distingushing MiniOS and Linux stubdomain, add helper inline
> > functions libxl__stubdomain_is_linux() and
> > libxl__stubdomain_is_linux_running(). Those should be used where really
> > the difference is about MiniOS/Linux, not qemu-xen/qemu-xen-traditional.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> >
> > ---
> > Changes in v3:
> >  - new patch, instead of "libxl: Add "stubdomain_version" to
> >  domain_build_info"
> >  - helper functions as suggested by Ian Jackson
> > ---
>=20
> <snip>
>=20
> > --- a/tools/libxl/libxl_internal.h
> > +++ b/tools/libxl/libxl_internal.h
> > @@ -2299,6 +2299,23 @@ _hidden int libxl__device_model_version_running(=
libxl__gc *gc, uint32_t domid);
> >    /* Return the system-wide default device model */
> >  _hidden libxl_device_model_version libxl__default_device_model(libxl__=
gc *gc);
> >
> > +static inline
> > +bool libxl__stubdomain_is_linux_running(libxl__gc *gc, uint32_t domid)
>=20
> This is unused in the series, as far as I can tell.

Yes, all the calls are commented out, as exact same condition is implied
=66rom the context. But I think a canonical function to do that is still
useful, if needed anywhere in the codebase in the future.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--H8fFO+isr9ADh2Iv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4naSwACgkQ24/THMrX
1yy/hQf/Wv8ioRbqPmqqA/ZUumpwWIf1IGieVEJCiVNxtPaaQ4DbxY5ToN6jpjgl
BigJVlpANdGAtU8eHaofdrPSZYCwr8bO5JzTEWmMAAulV58D5I6asMA1U5T6pT9d
uq1SPJku+lOwKBv3IAWPMMiOpW4YzBAGjkD0atJBCZzw2ZEOoP5jSH6UoDTUKWXC
njuF3OsZnmhcUhziLEnKIuOjbyvIIh5WVA2maeJf+1d/SdZcERWiPeRPsjUBLN4f
7sj9zlDb7cZ79Wzu5BrrgP7pnnrHmpvDXK3ZwNlekygjYbOegMbWAWqmWYCF0BbX
cITpD1a9DSoSg8d6pfCbiefdKVP6wg==
=xwcO
-----END PGP SIGNATURE-----

--H8fFO+isr9ADh2Iv--


--===============8958961722546624155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8958961722546624155==--

