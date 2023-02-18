Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E383069BA64
	for <lists+xen-devel@lfdr.de>; Sat, 18 Feb 2023 15:23:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497517.768456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTO78-0008U5-8f; Sat, 18 Feb 2023 14:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497517.768456; Sat, 18 Feb 2023 14:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTO78-0008Rb-5o; Sat, 18 Feb 2023 14:22:58 +0000
Received: by outflank-mailman (input) for mailman id 497517;
 Sat, 18 Feb 2023 14:22:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jGNe=6O=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pTO77-0008RT-7q
 for xen-devel@lists.xenproject.org; Sat, 18 Feb 2023 14:22:57 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc41816c-af97-11ed-933d-83870f6b2ba8;
 Sat, 18 Feb 2023 15:22:55 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id DB9EA5C00A3;
 Sat, 18 Feb 2023 09:22:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 18 Feb 2023 09:22:54 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Feb 2023 09:22:52 -0500 (EST)
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
X-Inumbo-ID: bc41816c-af97-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1676730174; x=
	1676816574; bh=jIUrOpa3mTKTqLf+OHYv7VD89ekuX74rxxpc12Aeg+w=; b=K
	fPm1qDAWxcmInIXkmiGafYBmYtb1RwKRZyTG5npF9oGdGkKCJi6InWG/R5YwXE00
	DLNjVholjDXYPfwISyBgnl6BuLp5CAlx+5LLnoWX4UYWB4cSKFWjbQqyJGk51402
	Zx98OSIyugQ1gXbm9Jw04osgRoZ+/uNqJOK6zrL5gHVQIiIov+Vx4Ed7lb/wQEl7
	/zl1VR58gk/9ihSCMHQ+PiwX//821q9E+Q3HYoD3Yb9u32dBrFHL2DV1QU6bPyC5
	/Us2+a/ak+j8fDsPFlKl6oBHT9mgZxJtDkV66RS7FxJ/LmAlahciBaF/rHHhkRj5
	LYNnK3PzEecY7t8Gmheyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1676730174; x=1676816574; bh=jIUrOpa3mTKTqLf+OHYv7VD89eku
	X74rxxpc12Aeg+w=; b=TmFmZTI0K2hzvd78uJZp8diiZc6y8Dds0kWsM0TFL3BT
	0Lb+hmFOFdsoOqsIziqfrRQzXgwKVBEm9mJqXVKwUCth5AXVVZR+oGAiIBNvD9y/
	PzLOb0E1ddxLtqn1ehMihpTuwUEkA0USr4PZ0r+kfTDq+rwtx036N1l13cqAG8li
	3Rf7vezDbU3QtaSW1fDb2zzC20/Y0DSqHdVcj7WF5PAntdLKKlXs8n0/u2jXEz6M
	2EG/89kWLAIIO8XiZUtcs8ROjpS6uhhddgBi/2GOObRHztwYdAQ+ecDnYbQahHUQ
	A68ZIwqbZQ8DJsbU73S7EYhcJRyr9nimY/ATvUmXXA==
X-ME-Sender: <xms:Pt_wY9idUEWk13d3eWpqImz8jdxs8G6bKFiNLeoET1CbiYND5WMVLQ>
    <xme:Pt_wYyBhOQyOiLUbe1gVwkJeB8zvnh5ar9Qm8wknN3pHicFhlIYT-mWNMs8Kzmdrl
    21GsDcuwUG54Q>
X-ME-Received: <xmr:Pt_wY9FykQImgtdVW4sINkL-DkxP0QJEiIjjzMVSKnu6ee7IlacDF0CZXlYsh_zI-ruwKe1tPQ45-VJQkAgI4I0jFRTa8HSiSIE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejuddgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveej
    gfetuefhhedvheejgedtteegveeujeefgfejheeitedvvdfhfffgtdelvefgnecuffhomh
    grihhnpehgihhtlhgrsgdrtghomhdpgigvnhdrohhrghdpiihlihgsrdhnvghtpdgsuhht
    thhhvghnihguohhnthhthhhinhhkthhhrghtshgtohhrrhgvtghtrghpphhrohgrtghhrd
    hithdpkhgvrhhnvghlrdhorhhgpdhrvgguhhgrthdrtghomhdpshhouhhrtggvfigrrhgv
    rdhorhhgpdhgnhhurdhorhhgpdhinhhrihgrrdhfrhdpghhmphhlihgsrdhorhhgpdhpoh
    hlrghrshhslhdrohhrghdpsggvrhhlihhoshdruggvpdhiphigvgdrohhrghdpghhithhh
    uhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Pt_wYyQVpSDmEgamIBVo5BHK-alQmu0fk4r2NDQT7e3klSwBkrv3TA>
    <xmx:Pt_wY6wcvChvaVep_SAIIUya6o1wg8bsvsqHzQbCJhamhAOzMbdkOw>
    <xmx:Pt_wY45ZUXEWiHUTAUZN_yOxhHJAzPUrYy5jEI0kL7H04u4ow-55qQ>
    <xmx:Pt_wY1xzPYI_Gdu5MBb3Jwz6zs-FVLNAcTIHyoYQUV-4YV46_0HS7g>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 18 Feb 2023 15:22:49 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 2/4] Build system: Replace git:// and http:// with
 https://
Message-ID: <Y/DfOph95KH+RHV2@mail-itl>
References: <cover.1676668922.git.demi@invisiblethingslab.com>
 <0aaad173b15304e2ab00749b4e5ad79c6e111589.1676668923.git.demi@invisiblethingslab.com>
 <Y/DcSVAokXuvM1Dv@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TtN/mjQ/xqvD/yEL"
Content-Disposition: inline
In-Reply-To: <Y/DcSVAokXuvM1Dv@mail-itl>


--TtN/mjQ/xqvD/yEL
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Feb 2023 15:22:49 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 2/4] Build system: Replace git:// and http:// with
 https://

On Sat, Feb 18, 2023 at 03:10:16PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Fri, Feb 17, 2023 at 04:35:25PM -0500, Demi Marie Obenour wrote:
> > Obtaining code over an insecure transport is a terrible idea for
> > blatently obvious reasons.  Even for non-executable data, insecure
> > transports are considered deprecated.
> >=20
> > This patch enforces the use of secure transports in the build system.
> > Some URLs returned 301 or 302 redirects, so I replaced them with the
> > URLs that were redirected to.=20
>=20
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/781679811
>=20
> I'm a bit confused about debian build errors:
>=20
>     ERROR: The certificate of 'xenbits.xen.org' is not trusted.
>     ERROR: The certificate of 'xenbits.xen.org' has expired.
>=20
> Is clock on gitlab runners (way) off?
>=20
> >  I also found that the old zlib used in
> > the I/O emulator stubdomain can no longer be obtained from
> > https://www.zlib.net and that the TPM emulator and PolarSSL (used by the
> > vTPM and vTPM manager stubdomains) can no longer be obtained from their
> > respective original URLs.  Therefore, configure will now error out
> > instead of trying to download them.
>=20
> First of all, such change definitely wants a separate patch,
> de-supporting some configurations do not belong to "Replace git:// and
> http:// with https://" patch. But then, I don't think that's correct
> approach. It is a bug to be fixes, instead of breaking it even more.
> configure script already supports Xen's mirror, and I think it's even
> enabled by default (see --enable-extfiles), and also supports providing
> alternative download location (via env variables). So it seems your
> change here in fact breaks something that was working before...

Ah, you do take --enable-extfiles into account. But still alternative
URL can be provided by env variable.

> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > ---
> >  Config.mk                         |  2 +-
> >  stubdom/configure                 | 24 +++++++++++++++---------
> >  stubdom/configure.ac              | 24 +++++++++++++++---------
> >  tools/firmware/etherboot/Makefile |  6 +-----
> >  4 files changed, 32 insertions(+), 24 deletions(-)
> >=20
> > diff --git a/Config.mk b/Config.mk
> > index 75f1975e5e78af44d36c2372cba6e89b425267a5..b2bef45b059976d5a6320ea=
bada6073004eb22ee 100644
> > --- a/Config.mk
> > +++ b/Config.mk
> > @@ -191,7 +191,7 @@ APPEND_CFLAGS +=3D $(foreach i, $(APPEND_INCLUDES),=
 -I$(i))
> >  EMBEDDED_EXTRA_CFLAGS :=3D -fno-pie -fno-stack-protector -fno-stack-pr=
otector-all
> >  EMBEDDED_EXTRA_CFLAGS +=3D -fno-exceptions -fno-asynchronous-unwind-ta=
bles
> > =20
> > -XEN_EXTFILES_URL ?=3D http://xenbits.xen.org/xen-extfiles
> > +XEN_EXTFILES_URL ?=3D https://xenbits.xen.org/xen-extfiles
> >  # All the files at that location were downloaded from elsewhere on
> >  # the internet.  The original download URL is preserved as a comment
> >  # near the place in the Xen Makefiles where the file is used.
> > diff --git a/stubdom/configure b/stubdom/configure
> > index b8bffceafdd46181e26a79b85405aefb8bc3ff7d..e40aca9afd0de2c5074978d=
654d4e78f4f63e3d2 100755
> > --- a/stubdom/configure
> > +++ b/stubdom/configure
> > @@ -3535,7 +3535,7 @@ if test "x$ZLIB_URL" =3D "x"; then :
> >  	if test "x$extfiles" =3D "xy"; then :
> >    ZLIB_URL=3D\$\(XEN_EXTFILES_URL\)
> >  else
> > -  ZLIB_URL=3D"http://www.zlib.net"
> > +  ZLIB_URL=3D"https://www.zlib.net"
> >  fi
> > =20
> >  fi
> > @@ -3550,7 +3550,7 @@ if test "x$LIBPCI_URL" =3D "x"; then :
> >  	if test "x$extfiles" =3D "xy"; then :
> >    LIBPCI_URL=3D\$\(XEN_EXTFILES_URL\)
> >  else
> > -  LIBPCI_URL=3D"http://www.kernel.org/pub/software/utils/pciutils"
> > +  LIBPCI_URL=3D"https://mirrors.edge.kernel.org/pub/software/utils/pci=
utils"
> >  fi
> > =20
> >  fi
> > @@ -3565,7 +3565,7 @@ if test "x$NEWLIB_URL" =3D "x"; then :
> >  	if test "x$extfiles" =3D "xy"; then :
> >    NEWLIB_URL=3D\$\(XEN_EXTFILES_URL\)
> >  else
> > -  NEWLIB_URL=3D"ftp://sources.redhat.com/pub/newlib"
> > +  NEWLIB_URL=3D"https://sourceware.org/ftp/newlib"
> >  fi
> > =20
> >  fi
> > @@ -3580,7 +3580,7 @@ if test "x$LWIP_URL" =3D "x"; then :
> >  	if test "x$extfiles" =3D "xy"; then :
> >    LWIP_URL=3D\$\(XEN_EXTFILES_URL\)
> >  else
> > -  LWIP_URL=3D"http://download.savannah.gnu.org/releases/lwip"
> > +  LWIP_URL=3D"https://download.savannah.gnu.org/releases/lwip"
> >  fi
> > =20
> >  fi
> > @@ -3595,7 +3595,7 @@ if test "x$GRUB_URL" =3D "x"; then :
> >  	if test "x$extfiles" =3D "xy"; then :
> >    GRUB_URL=3D\$\(XEN_EXTFILES_URL\)
> >  else
> > -  GRUB_URL=3D"http://alpha.gnu.org/gnu/grub"
> > +  GRUB_URL=3D"https://alpha.gnu.org/gnu/grub"
> >  fi
> > =20
> >  fi
> > @@ -3607,7 +3607,7 @@ GRUB_VERSION=3D"0.97"
> > =20
> >  if test "x$OCAML_URL" =3D "x"; then :
> > =20
> > -	OCAML_URL=3D"http://caml.inria.fr/pub/distrib/ocaml-4.02"
> > +	OCAML_URL=3D"https://caml.inria.fr/pub/distrib/ocaml-4.02"
> > =20
> >  fi
> >  OCAML_VERSION=3D"4.02.0"
> > @@ -3621,7 +3621,7 @@ if test "x$GMP_URL" =3D "x"; then :
> >  	if test "x$extfiles" =3D "xy"; then :
> >    GMP_URL=3D\$\(XEN_EXTFILES_URL\)
> >  else
> > -  GMP_URL=3D"ftp://ftp.gmplib.org/pub/gmp-4.3.2"
> > +  GMP_URL=3D"https://gmplib.org/download/gmp/archive"
> >  fi
> > =20
> >  fi
> > @@ -3636,7 +3636,7 @@ if test "x$POLARSSL_URL" =3D "x"; then :
> >  	if test "x$extfiles" =3D "xy"; then :
> >    POLARSSL_URL=3D\$\(XEN_EXTFILES_URL\)
> >  else
> > -  POLARSSL_URL=3D"http://polarssl.org/code/releases"
> > +  POLARSSL_URL=3D"https://polarssl.org/code/releases"
> >  fi
> > =20
> >  fi
> > @@ -3651,7 +3651,7 @@ if test "x$TPMEMU_URL" =3D "x"; then :
> >  	if test "x$extfiles" =3D "xy"; then :
> >    TPMEMU_URL=3D\$\(XEN_EXTFILES_URL\)
> >  else
> > -  TPMEMU_URL=3D"http://download.berlios.de/tpm-emulator"
> > +  TPMEMU_URL=3D"https://download.berlios.de/tpm-emulator"
> >  fi
> > =20
> >  fi
> > @@ -3669,6 +3669,12 @@ vtpmmgr=3D"n"
> >  fi
> > =20
> > =20
> > +if test "x$vtpm" !=3D xn || test "x$vtpmmgr" !=3D xn || test "x$ioemu"=
 !=3D xn; then
> > +    if test "x$extfiles" !=3D xy; then
> > +        as_fn_error $? "Sources needed for the vTPM, vTPM manager, and=
 IO emulator stubdomains are no longer at their original URLs" "$LINENO" 5
> > +    fi
> > +fi
> > +
> >  #Conditionally enable these stubdoms based on the presense of dependen=
cies
> > =20
> >  if test "x$vtpm" =3D "xy" || test "x$vtpm" =3D "x"; then :
> > diff --git a/stubdom/configure.ac b/stubdom/configure.ac
> > index e20d99edac0da88098f4806333edde9f31dbc1a7..d27f2bc1f17140ab41a687e=
1e8faaa66e2b4483b 100644
> > --- a/stubdom/configure.ac
> > +++ b/stubdom/configure.ac
> > @@ -55,19 +55,25 @@ AC_PROG_INSTALL
> >  AX_DEPENDS_PATH_PROG([vtpm], [CMAKE], [cmake])
> > =20
> >  # Stubdom libraries version and url setup
> > -AX_STUBDOM_LIB([ZLIB], [zlib], [1.2.3], [http://www.zlib.net])
> > -AX_STUBDOM_LIB([LIBPCI], [libpci], [2.2.9], [http://www.kernel.org/pub=
/software/utils/pciutils])
> > -AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0], [ftp://sources.redhat.com=
/pub/newlib])
> > -AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0], [http://download.savannah.gnu.=
org/releases/lwip])
> > -AX_STUBDOM_LIB([GRUB], [grub], [0.97], [http://alpha.gnu.org/gnu/grub])
> > -AX_STUBDOM_LIB_NOEXT([OCAML], [ocaml], [4.02.0], [http://caml.inria.fr=
/pub/distrib/ocaml-4.02])
> > -AX_STUBDOM_LIB([GMP], [libgmp], [4.3.2], [ftp://ftp.gmplib.org/pub/gmp=
-4.3.2])
> > -AX_STUBDOM_LIB([POLARSSL], [polarssl], [1.1.4], [http://polarssl.org/c=
ode/releases])
> > -AX_STUBDOM_LIB([TPMEMU], [berlios tpm emulator], [0.7.4], [http://down=
load.berlios.de/tpm-emulator])
> > +AX_STUBDOM_LIB([ZLIB], [zlib], [1.2.3], [https://www.zlib.net])
> > +AX_STUBDOM_LIB([LIBPCI], [libpci], [2.2.9], [https://mirrors.edge.kern=
el.org/pub/software/utils/pciutils])
> > +AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0], [https://sourceware.org/f=
tp/newlib])
> > +AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0], [https://download.savannah.gnu=
=2Eorg/releases/lwip])
> > +AX_STUBDOM_LIB([GRUB], [grub], [0.97], [https://alpha.gnu.org/gnu/grub=
])
> > +AX_STUBDOM_LIB_NOEXT([OCAML], [ocaml], [4.02.0], [https://caml.inria.f=
r/pub/distrib/ocaml-4.02])
> > +AX_STUBDOM_LIB([GMP], [libgmp], [4.3.2], [https://gmplib.org/download/=
gmp/archive])
> > +AX_STUBDOM_LIB([POLARSSL], [polarssl], [1.1.4], [https://polarssl.org/=
code/releases])
> > +AX_STUBDOM_LIB([TPMEMU], [berlios tpm emulator], [0.7.4], [https://dow=
nload.berlios.de/tpm-emulator])
> > =20
> >  #These stubdoms should be enabled if the dependent one is
> >  AX_STUBDOM_AUTO_DEPENDS([vtpmmgr], [vtpm])
> > =20
> > +if test "x$vtpm" !=3D xn || test "x$vtpmmgr" !=3D xn || test "x$ioemu"=
 !=3D xn; then
> > +    if test "x$extfiles" !=3D xy; then
> > +        AC_MSG_ERROR([Sources needed for the vTPM, vTPM manager, and I=
O emulator stubdomains are no longer at their original URLs])
> > +    fi
> > +fi
> > +
> >  #Conditionally enable these stubdoms based on the presense of dependen=
cies
> >  AX_STUBDOM_CONDITIONAL_FINISH([vtpm-stubdom], [vtpm])
> >  AX_STUBDOM_CONDITIONAL_FINISH([vtpmmgr-stubdom], [vtpmmgr])
> > diff --git a/tools/firmware/etherboot/Makefile b/tools/firmware/etherbo=
ot/Makefile
> > index 4bc3633ba3d67ff9f52a9cb7923afea73c861da9..6ab9e5bc6b4cc750f2e8021=
28fbc71e9150397b1 100644
> > --- a/tools/firmware/etherboot/Makefile
> > +++ b/tools/firmware/etherboot/Makefile
> > @@ -4,11 +4,7 @@ XEN_ROOT =3D $(CURDIR)/../../..
> >  include $(XEN_ROOT)/tools/Rules.mk
> >  include Config
> > =20
> > -ifeq ($(GIT_HTTP),y)
> > -IPXE_GIT_URL ?=3D http://git.ipxe.org/ipxe.git
> > -else
> > -IPXE_GIT_URL ?=3D git://git.ipxe.org/ipxe.git
> > -endif
> > +IPXE_GIT_URL ?=3D https://github.com/ipxe/ipxe.git
> > =20
> >  # put an updated tar.gz on xenbits after changes to this variable
> >  IPXE_GIT_TAG :=3D 3c040ad387099483102708bb1839110bc788cefb
> > --=20
> > Sincerely,
> > Demi Marie Obenour (she/her/hers)
> > Invisible Things Lab
> >=20
>=20
> --=20
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab



--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--TtN/mjQ/xqvD/yEL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPw3zoACgkQ24/THMrX
1ywOrQf+KZW8q9kUmb+qn5adJtN4cJp4Y5hhbJEKypFxhRLSlidUJv6hcsJfweS1
cuBMxECXwc9KgGFkfogtBTkk116miQDIG/PfAArKqPsFSPuNm6txlbOJ0e24prhD
InpAnHvGIHSrfZpMvhSzCHJUugtsOgcPIDYRxO1EAjkkjMxOfTJniYqPd59yl6kQ
Fe/1Y5sYVzeB/vFtPExMQIZFqSYnOlXVebZqRKZkVMA+S/GdD5ZWoyrN26RAd2YM
dG/QthFYNkgc2r3azit32OTiFMOY7IijbaTtEkLJYsvKEHbQd8gr+di3fCo1vVin
uQC4GjJCqWMrW4Gt86+IRHG3jtRGrw==
=dyzd
-----END PGP SIGNATURE-----

--TtN/mjQ/xqvD/yEL--

