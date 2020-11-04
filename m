Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CD42A6B90
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 18:22:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19433.44628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaMUk-0004lr-9g; Wed, 04 Nov 2020 17:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19433.44628; Wed, 04 Nov 2020 17:22:50 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaMUk-0004lS-68; Wed, 04 Nov 2020 17:22:50 +0000
Received: by outflank-mailman (input) for mailman id 19433;
 Wed, 04 Nov 2020 17:22:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcr8=EK=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kaMUi-0004lL-EP
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 17:22:48 +0000
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd00318c-eed8-4e5b-a6cc-59d6059b893d;
 Wed, 04 Nov 2020 17:22:46 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D8483A52;
 Wed,  4 Nov 2020 12:22:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 04 Nov 2020 12:22:46 -0500
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id B6ECF3280391;
 Wed,  4 Nov 2020 12:22:44 -0500 (EST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tcr8=EK=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kaMUi-0004lL-EP
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 17:22:48 +0000
X-Inumbo-ID: fd00318c-eed8-4e5b-a6cc-59d6059b893d
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id fd00318c-eed8-4e5b-a6cc-59d6059b893d;
	Wed, 04 Nov 2020 17:22:46 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id D8483A52;
	Wed,  4 Nov 2020 12:22:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 04 Nov 2020 12:22:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=p3a3wJ
	vbPPzG5HJNzeHsRog3mMlxxr8aebuzTaoFanA=; b=kkQISjx8mhLxrnOoXTeZrP
	uZGfbd4zXA094pgzVVG/mtyJJqGzaRCTjx41HaOoK9puNOY8iqcxQNAC+qnnrAfn
	Pw9D2lsoVCIped2JVlTiRb+czrW/4GY0Wo/tc319ce0uykeJoo3xQQM5PYtG7uqk
	TryX17fBYWknJe0Nkez1LYHneiseaPFjI2zWjBLy+lNZV53sc96ZxPFCXBjPksSa
	Ci370n0/F39JUzX/KFxBewmFNhQbsZmGZX0QyaQeluOiDVcxendQ+JPm4TRxzRcK
	D1bjXi8N/yQykIyJ97qW8ZT2xXJqa619zf7e4MCPpLY5agur4L4fD1Uxy0zOIm/Q
	==
X-ME-Sender: <xms:ZeOiXxfGvWR99WEhUJcjMuf-76owQ0-TVbRjPHBrroQMvoBgT7iH7g>
    <xme:ZeOiX_Md8DvCSHgegdC8hxb89TaHyA-L_YKf1XqLstsNVm1OhApr5jqlZV8U3j4Up
    fiWO6V7e4IwCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddthedguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvth
    hhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgefhtdfhuddtjefgjeev
    hffhjeejtefgjeevgeeijeduhfdtteehieffvdettddvnecukfhppeeluddrieegrdduje
    dtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ZeOiX6hqiY3kDct9U_LbieaIPUQqlRBqMNwdBYO1o_f7iw4oYS739w>
    <xmx:ZeOiX6_FGAFaoNdHWyHXq8XJx908iXVlxj3JMQwkWTSLN11a7lIU9A>
    <xmx:ZeOiX9spv_SZuEWN8MOF9PYIsRA2xT00CGZ_mi2hdiDq7bgVTO3aTA>
    <xmx:ZeOiX748IlEyfNNQ4xHa9DCPUadg3JophvUUP8AYC7PgM6zAUxvflQ>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id B6ECF3280391;
	Wed,  4 Nov 2020 12:22:44 -0500 (EST)
Date: Wed, 4 Nov 2020 18:22:41 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] tools/python: pass more -rpath-link options to ld
Message-ID: <20201104172241.GY1447@mail-itl>
References: <8cf8cfa9-2b0c-123a-2d23-8932e61085fa@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VBg0eA7b+gOCQW/G"
Content-Disposition: inline
In-Reply-To: <8cf8cfa9-2b0c-123a-2d23-8932e61085fa@suse.com>


--VBg0eA7b+gOCQW/G
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] tools/python: pass more -rpath-link options to ld

On Wed, Nov 04, 2020 at 03:57:49PM +0100, Jan Beulich wrote:
> With the split of libraries, I've observed a number of warnings from
> (old?) ld.
>=20
> Instead of duplicating the additions in two places, introduce a setup.py
> make variable holding all the common parts of the invocations.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> v2: Pass on and use SHLIB_libxen*.
> ---
> It's unclear to me whether this is ld version dependent - the pattern
> of where I've seen such warnings doesn't suggest a clear version
> dependency.
>=20
> Obviously (I think) the other similar variables (XEN_libxen*,
> CFLAGS_libxen*, etc) would better also be made use of to eliminate at
> least most of the PATH_* variables, but that's not the purpose of this
> change.
>=20
> --- a/tools/python/Makefile
> +++ b/tools/python/Makefile
> @@ -8,19 +8,21 @@ PY_CFLAGS =3D $(CFLAGS) $(PY_NOOPT_CFLAGS)
>  PY_LDFLAGS =3D $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
>  INSTALL_LOG =3D build/installed_files.txt
> =20
> +setup.py =3D CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" LDF=
LAGS=3D"$(PY_LDFLAGS)" \
> +           SHLIB_libxenctrl=3D"$(SHLIB_libxenctrl)" \
> +           SHLIB_libxenguest=3D"$(SHLIB_libxenguest)" \
> +           SHLIB_libxenstore=3D"$(SHLIB_libxenstore)" \
> +           $(PYTHON) setup.py
> +
>  .PHONY: build
>  build:
> -	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" LDFLAGS=3D"$(PY=
_LDFLAGS)" $(PYTHON) setup.py build
> +	$(setup.py) build
> =20
>  .PHONY: install
>  install:
>  	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> -
> -	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" \
> -		LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py install \
> -		--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> +	$(setup.py) install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
>  		--root=3D"$(DESTDIR)" --force
> -
>  	$(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEXE=
C_BIN)
>  	$(INSTALL_PYTHON_PROG) scripts/verify-stream-v2 $(DESTDIR)$(LIBEXEC_BIN)
> =20
> --- a/tools/python/setup.py
> +++ b/tools/python/setup.py
> @@ -4,6 +4,10 @@ import os, sys
> =20
>  XEN_ROOT =3D "../.."
> =20
> +SHLIB_libxenctrl =3D os.environ['SHLIB_libxenctrl'].split()
> +SHLIB_libxenguest =3D os.environ['SHLIB_libxenguest'].split()
> +SHLIB_libxenstore =3D os.environ['SHLIB_libxenstore'].split()
> +
>  extra_compile_args  =3D [ "-fno-strict-aliasing", "-Werror" ]
> =20
>  PATH_XEN      =3D XEN_ROOT + "/tools/include"
> @@ -24,7 +28,7 @@ xc =3D Extension("xc",
>                 library_dirs       =3D [ PATH_LIBXENCTRL, PATH_LIBXENGUES=
T ],
>                 libraries          =3D [ "xenctrl", "xenguest" ],
>                 depends            =3D [ PATH_LIBXENCTRL + "/libxenctrl.s=
o", PATH_LIBXENGUEST + "/libxenguest.so" ],
> -               extra_link_args    =3D [ "-Wl,-rpath-link=3D"+PATH_LIBXEN=
TOOLLOG ],
> +               extra_link_args    =3D SHLIB_libxenctrl + SHLIB_libxengue=
st,
>                 sources            =3D [ "xen/lowlevel/xc/xc.c" ])
> =20
>  xs =3D Extension("xs",
> @@ -33,6 +37,7 @@ xs =3D Extension("xs",
>                 library_dirs       =3D [ PATH_XENSTORE ],
>                 libraries          =3D [ "xenstore" ],
>                 depends            =3D [ PATH_XENSTORE + "/libxenstore.so=
" ],
> +               extra_link_args    =3D SHLIB_libxenstore,
>                 sources            =3D [ "xen/lowlevel/xs/xs.c" ])
> =20
>  plat =3D os.uname()[0]

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--VBg0eA7b+gOCQW/G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl+i42EACgkQ24/THMrX
1yw3RAf/YF4OFhGI1/xSacRJqIJ/Myd8w6a3DNyWJ7PYwWBcqhX2xpuxhnzzjLnJ
bj2RO4L91NW8s915dbk+OA4dPZ3/+b4m7FicsbHwmUCyQkQBwadcV7R/UZtuXiHD
fYIPWarRRdiFHVpBMS0wup8GO7zCn+xEKB5CuFwxQQq5aEymCsspuJ3OakvJxoQL
ISDJo1fe8n7lNy9jQ60eIa9A8WXhQfmHuNCjy14+a8KbukwBlMuoha7WUjn5mg6Y
HsC1crBMxntWnAe89RB2EzoCnwZo1gyfpyKWldrtqvql40Si3GD4YQdL24lnBfOF
PnDyIksy2bO9OqeZ9k7fGvkarqvTWQ==
=G1AO
-----END PGP SIGNATURE-----

--VBg0eA7b+gOCQW/G--

