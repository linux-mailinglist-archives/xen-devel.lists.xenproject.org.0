Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFA128E99D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 03:03:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7063.18499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSrfg-0003zx-9X; Thu, 15 Oct 2020 01:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7063.18499; Thu, 15 Oct 2020 01:03:08 +0000
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
	id 1kSrfg-0003zX-5X; Thu, 15 Oct 2020 01:03:08 +0000
Received: by outflank-mailman (input) for mailman id 7063;
 Thu, 15 Oct 2020 01:03:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G4/f=DW=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kSrfd-0003zJ-Mr
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 01:03:05 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d52c267c-d8d0-4306-861a-b8506e1fa7ce;
 Thu, 15 Oct 2020 01:03:04 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9F25E5C0145;
 Wed, 14 Oct 2020 21:03:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 14 Oct 2020 21:03:04 -0400
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7D40D3280063;
 Wed, 14 Oct 2020 21:03:03 -0400 (EDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=G4/f=DW=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kSrfd-0003zJ-Mr
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 01:03:05 +0000
X-Inumbo-ID: d52c267c-d8d0-4306-861a-b8506e1fa7ce
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d52c267c-d8d0-4306-861a-b8506e1fa7ce;
	Thu, 15 Oct 2020 01:03:04 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 9F25E5C0145;
	Wed, 14 Oct 2020 21:03:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 14 Oct 2020 21:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vWOY7z
	MD34pZOKjrMRxj5BndB7UtgBWfOJvAUFYGWsE=; b=STz5x17OTTY2CCAhEHhL9q
	Xuv0n4xQS2P06eU60pWsP+T4B60LM+z+SGECkK5Ok4k3T/dNcbHAE2DOHeMW3QV0
	r416Aq/kBURtUJfI/EX9ulmBa/AEbw3wiOUX2WIM6HnbYKdbj2vXglrciGa27WaN
	l/XFtNL+lJs3HIwpRMnmIuHtm16MIZxdxcNf0uIKDYU2GzStfJcDz6nPeBDlESmp
	IagEr9QE1p64yyOx4ea1sQA+giJ8i8lomnOQIDumV3INCJgqKIGSSzVyCdPHju1e
	iRNMgj+6XfTqE4ljU3ECx6fW7bdF7SvQG5HdNRSpe8EMOIFyw14Kr5HnnPzbX4Vw
	==
X-ME-Sender: <xms:yJ-HXyAcOrjJO1mYUttFBlTxOSaJtL-I6XnQhpzhXuw3KKflh_XZSQ>
    <xme:yJ-HX8jVeJuVXej-dz8SuYSpwnYQuT5VUOiGtzhjCPu9vt0E2RczOvqvOsrzjab07
    U0vzchIArrzWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedriedvgdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppeelud
    drieegrddujedtrdekleenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:yJ-HX1kORT5rlAd6_mdttCVlJPuNo70i7Q2K5DkVUZ4opOu6sPoy1Q>
    <xmx:yJ-HXwx-Ojvf6CizYovRYKJE7UZLByvpQEHZIJFJzy6giOyQugzcvQ>
    <xmx:yJ-HX3Q3epw2ZabpTAPzKZOdf0zqd9ZTy2IlDJYjEjs4hDNXh_lR5A>
    <xmx:yJ-HX449-myE3Ss8_qRVU7fdXnsk6vejr_wrUAQJ43JzkDrh4jE4fA>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7D40D3280063;
	Wed, 14 Oct 2020 21:03:03 -0400 (EDT)
Date: Thu, 15 Oct 2020 03:02:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Wei Liu <wl@xen.org>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org,
	Ian Jackson <iwj@xenproject.org>
Subject: Re: [SECOND RESEND] [PATCH] tools/python: Pass linker to Python
 build process
Message-ID: <20201015010259.GR151766@mail-itl>
References: <20201012011139.GA82449@mattapan.m5p.com>
 <20201013132606.7ff35mmpesklbmcx@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OxDG9cJJSSQMUzGF"
Content-Disposition: inline
In-Reply-To: <20201013132606.7ff35mmpesklbmcx@liuwe-devbox-debian-v2>


--OxDG9cJJSSQMUzGF
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [SECOND RESEND] [PATCH] tools/python: Pass linker to Python
 build process

On Tue, Oct 13, 2020 at 01:26:06PM +0000, Wei Liu wrote:
> On Sun, Oct 11, 2020 at 06:11:39PM -0700, Elliott Mitchell wrote:
> > Unexpectedly the environment variable which needs to be passed is
> > $LDSHARED and not $LD.  Otherwise Python may find the build `ld` instead
> > of the host `ld`.
> >=20
> > Replace $(LDFLAGS) with $(SHLIB_LDFLAGS) as Python needs shared objects
> > it can load at runtime, not executables.
> >=20
> > This uses $(CC) instead of $(LD) since Python distutils appends $CFLAGS
> > to $LDFLAGS which breaks many linkers.
> >=20
> > Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> > ---
> > This is now the *third* time this has been sent to the list.  Mark Pryor
> > has tested and confirms Python cross-building is working.  There is one
> > wart left which I'm unsure of the best approach for.
> >=20
> > Having looked around a bit, I believe this is a Python 2/3 compatibility
> > issue.  "distutils" for Python 2 likely lacked a separate $LDSHARED or
> > $LD variable, whereas Python 3 does have this.  Alas this is pointless
> > due to the above (unless you can cause distutils.py to do the final link
> > step separately).
>=20
> I think this is well-reasoned but I don't have time to figure out and
> verify the details.

Yes, it looks like distutils in Python 2 was even more limited than
the one in Python 3.

> Marek, do you have any comment on this?
>=20
> > ---
> >  tools/pygrub/Makefile | 9 +++++----
> >  tools/python/Makefile | 9 +++++----
> >  2 files changed, 10 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
> > index 3063c4998f..37b2146214 100644
> > --- a/tools/pygrub/Makefile
> > +++ b/tools/pygrub/Makefile
> > @@ -3,20 +3,21 @@ XEN_ROOT =3D $(CURDIR)/../..
> >  include $(XEN_ROOT)/tools/Rules.mk
> > =20
> >  PY_CFLAGS =3D $(CFLAGS) $(PY_NOOPT_CFLAGS)
> > -PY_LDFLAGS =3D $(LDFLAGS) $(APPEND_LDFLAGS)
> > +PY_LDFLAGS =3D $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
> >  INSTALL_LOG =3D build/installed_files.txt
> > =20
> >  .PHONY: all
> >  all: build
> >  .PHONY: build
> >  build:
> > -	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTH=
ON) setup.py build
> > +	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" LDFLAGS=3D"$(=
PY_LDFLAGS)" $(PYTHON) setup.py build
> > =20
> >  .PHONY: install
> >  install: all
> >  	$(INSTALL_DIR) $(DESTDIR)/$(bindir)
> > -	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTH=
ON) \
> > -		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> > +	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" \
> > +		LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py install \
> > +		--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> >  		 --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force
> >  	set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \
> >  	             "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
> > diff --git a/tools/python/Makefile b/tools/python/Makefile
> > index 8d22c03676..b675f5b4de 100644
> > --- a/tools/python/Makefile
> > +++ b/tools/python/Makefile
> > @@ -5,19 +5,20 @@ include $(XEN_ROOT)/tools/Rules.mk
> >  all: build
> > =20
> >  PY_CFLAGS =3D $(CFLAGS) $(PY_NOOPT_CFLAGS)
> > -PY_LDFLAGS =3D $(LDFLAGS) $(APPEND_LDFLAGS)
> > +PY_LDFLAGS =3D $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
> >  INSTALL_LOG =3D build/installed_files.txt
> > =20
> >  .PHONY: build
> >  build:
> > -	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" $(PYTHON) setup.py build
> > +	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" LDFLAGS=3D"$(=
PY_LDFLAGS)" $(PYTHON) setup.py build
> > =20
> >  .PHONY: install
> >  install:
> >  	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> > =20
> > -	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTH=
ON) \
> > -		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> > +	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" \
> > +		LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py install \
> > +		--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> >  		--root=3D"$(DESTDIR)" --force
> > =20
> >  	$(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBE=
XEC_BIN)
> > --=20
> > 2.20.1
> >=20
> >=20
> > --=20
> > (\___(\___(\______          --=3D> 8-) EHM <=3D--          ______/)___/=
)___/)
> >  \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
> >   \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
> > 8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/54=
45
> >=20
> >=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--OxDG9cJJSSQMUzGF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl+Hn8QACgkQ24/THMrX
1yxQhgf+M/yibdkpDozQk6YR3nYE4DekOTKvaNWNwQ2if+Ax7AZFuTwUC9+nk8zN
IBCQEDGqG1w3KrEPu8Gyx0FOIth1MOA3NUGrV0RdAx7/cnSbBxFxgbN6aCJhHb+Z
asU7yzWihNsZHdLloFJuSu0PUTF4dlQGUX8PO6K1PA4XhRW9u+WKxRoE1AXoNW77
dL7PvlQsOxo3CVsfPRUe7PV4/PoaDWA+p2T+Tuumg7b4zXsK0EZW7hX8uNZ6QrIa
LpcsyMZQL06MvOzKeifUy1FOZtOOlCcOcqHZ2D4JWDereqNV5t/U4g6dakzQ4Hgb
Y9erOx4N2U1g0wyBnAUKYvHI5O19Yg==
=Lao+
-----END PGP SIGNATURE-----

--OxDG9cJJSSQMUzGF--

