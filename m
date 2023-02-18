Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FE269BA5B
	for <lists+xen-devel@lfdr.de>; Sat, 18 Feb 2023 15:11:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497510.768445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTNv5-0006ew-5S; Sat, 18 Feb 2023 14:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497510.768445; Sat, 18 Feb 2023 14:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTNv5-0006d2-2m; Sat, 18 Feb 2023 14:10:31 +0000
Received: by outflank-mailman (input) for mailman id 497510;
 Sat, 18 Feb 2023 14:10:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jGNe=6O=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pTNv3-0006cw-At
 for xen-devel@lists.xenproject.org; Sat, 18 Feb 2023 14:10:29 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc2f12f8-af95-11ed-933d-83870f6b2ba8;
 Sat, 18 Feb 2023 15:10:26 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 1E13E5C00EC;
 Sat, 18 Feb 2023 09:10:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 18 Feb 2023 09:10:23 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Feb 2023 09:10:20 -0500 (EST)
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
X-Inumbo-ID: fc2f12f8-af95-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1676729423; x=
	1676815823; bh=bYW63VThDJjBqSX/sZZ5Stao8GLxy1vBG3E4+EFwiCA=; b=k
	6uglbGHr57kEUOi2JOi64M2FWa7twr0KzzPG9XojQmYBBMQCtmGS13CEvGqHApdA
	kpLixxh8NwX8BopwOgDQxJ9GCrw/QUX7QwDXxaDPzatVECQxzY9LZ0aXzK+zehp/
	OS0OjhcQEp4mbJar2fN5q0v6Hzd4DAOGQBjdx7L8623DZvuHIIXUNzEomUFNWoKB
	kAbEnzCAdDSC4NUtqvSuosg4ewHWlA35eKkVjYU1lWCVhOsnTO+THV8Cy9kWiBqW
	swswMN/u06gH3qND8JMVFwMWfgUQQ4CaR8Af+DfxWV5bWYpHGewqu1/HmtFqO/tp
	m+faHU5nmZVw5rEqY0feg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1676729423; x=1676815823; bh=bYW63VThDJjBqSX/sZZ5Stao8GLx
	y1vBG3E4+EFwiCA=; b=KCnNmZ5CQsoVd173iyQHkwBDDTY2wN6TeDGcdqzQ58u5
	j9Ht95jk2ItlsgEeTVdUg+mUMUk3CtCfl1NHG3YUucR3AKzMuWWiKVEaIKwSEyT9
	KLLXLiGWqUrwxwy6yjrgAYFcjjIqPfMiIiZmzNU3DbnHGF6wUSgL4BGcOyh6oWf6
	MUUDDmKvfLspx8kmX4efi3UdLRI6gSHOn43/NWuLbmL7PcvhTkQXbWr/Sc+1FGdP
	1XQrUD9yOXgc7UTpB0ewE69uFUw572V8sGrUCz4us4b1ShbyiBcwWW0hEzXWqEvd
	SPg7GYcQdMxlGgZHEqtXJQ0Ib/9y/LYqT8hdHTGVlQ==
X-ME-Sender: <xms:TtzwY3__P-Qi0LHLSVuk3rh60TtzRsbbfvV9pAVInjry6UlClJE4fQ>
    <xme:TtzwYzv_1aGK53Tg56q9ihuo1HD8SA_WUoxOc3FO3sRy7haODP92F-Mg_49ZzRAw7
    sFxY4CNA1vUzQ>
X-ME-Received: <xmr:TtzwY1AGMZcY77RqwcSogu0QKVYMklB-inzlfyX9f0cbnzcbpz6F9HSv6uik-Rj4kitVv8cvwJDI1ZFqV9ivIUs9yj3HuQQ7Zgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejuddgheelucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:TtzwYzf8LuLKgIIvo5jIp-gCXV0rj9qdz2-1WBla2ci0pluLScjpDw>
    <xmx:TtzwY8ORkvUNeatDKEqAHgW5FiKYWNHF5MBFQEoiBPJLrTpj3yF7rg>
    <xmx:TtzwY1neBzm-Z2awc9JwFzKEVg-fMW0kP3C1vqvmj4O8X9ScoRuacA>
    <xmx:T9zwYzfOeXyGwo00RS8ujSOJFbf8Hab17oKqeqW1-54He29yYu0GMQ>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 18 Feb 2023 15:10:16 +0100
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
Message-ID: <Y/DcSVAokXuvM1Dv@mail-itl>
References: <cover.1676668922.git.demi@invisiblethingslab.com>
 <0aaad173b15304e2ab00749b4e5ad79c6e111589.1676668923.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lSEMJVqM7h4dPmkm"
Content-Disposition: inline
In-Reply-To: <0aaad173b15304e2ab00749b4e5ad79c6e111589.1676668923.git.demi@invisiblethingslab.com>


--lSEMJVqM7h4dPmkm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Feb 2023 15:10:16 +0100
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

On Fri, Feb 17, 2023 at 04:35:25PM -0500, Demi Marie Obenour wrote:
> Obtaining code over an insecure transport is a terrible idea for
> blatently obvious reasons.  Even for non-executable data, insecure
> transports are considered deprecated.
>=20
> This patch enforces the use of secure transports in the build system.
> Some URLs returned 301 or 302 redirects, so I replaced them with the
> URLs that were redirected to.=20

https://gitlab.com/xen-project/patchew/xen/-/pipelines/781679811

I'm a bit confused about debian build errors:

    ERROR: The certificate of 'xenbits.xen.org' is not trusted.
    ERROR: The certificate of 'xenbits.xen.org' has expired.

Is clock on gitlab runners (way) off?

>  I also found that the old zlib used in
> the I/O emulator stubdomain can no longer be obtained from
> https://www.zlib.net and that the TPM emulator and PolarSSL (used by the
> vTPM and vTPM manager stubdomains) can no longer be obtained from their
> respective original URLs.  Therefore, configure will now error out
> instead of trying to download them.

First of all, such change definitely wants a separate patch,
de-supporting some configurations do not belong to "Replace git:// and
http:// with https://" patch. But then, I don't think that's correct
approach. It is a bug to be fixes, instead of breaking it even more.
configure script already supports Xen's mirror, and I think it's even
enabled by default (see --enable-extfiles), and also supports providing
alternative download location (via env variables). So it seems your
change here in fact breaks something that was working before...

> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> ---
>  Config.mk                         |  2 +-
>  stubdom/configure                 | 24 +++++++++++++++---------
>  stubdom/configure.ac              | 24 +++++++++++++++---------
>  tools/firmware/etherboot/Makefile |  6 +-----
>  4 files changed, 32 insertions(+), 24 deletions(-)
>=20
> diff --git a/Config.mk b/Config.mk
> index 75f1975e5e78af44d36c2372cba6e89b425267a5..b2bef45b059976d5a6320eaba=
da6073004eb22ee 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -191,7 +191,7 @@ APPEND_CFLAGS +=3D $(foreach i, $(APPEND_INCLUDES), -=
I$(i))
>  EMBEDDED_EXTRA_CFLAGS :=3D -fno-pie -fno-stack-protector -fno-stack-prot=
ector-all
>  EMBEDDED_EXTRA_CFLAGS +=3D -fno-exceptions -fno-asynchronous-unwind-tabl=
es
> =20
> -XEN_EXTFILES_URL ?=3D http://xenbits.xen.org/xen-extfiles
> +XEN_EXTFILES_URL ?=3D https://xenbits.xen.org/xen-extfiles
>  # All the files at that location were downloaded from elsewhere on
>  # the internet.  The original download URL is preserved as a comment
>  # near the place in the Xen Makefiles where the file is used.
> diff --git a/stubdom/configure b/stubdom/configure
> index b8bffceafdd46181e26a79b85405aefb8bc3ff7d..e40aca9afd0de2c5074978d65=
4d4e78f4f63e3d2 100755
> --- a/stubdom/configure
> +++ b/stubdom/configure
> @@ -3535,7 +3535,7 @@ if test "x$ZLIB_URL" =3D "x"; then :
>  	if test "x$extfiles" =3D "xy"; then :
>    ZLIB_URL=3D\$\(XEN_EXTFILES_URL\)
>  else
> -  ZLIB_URL=3D"http://www.zlib.net"
> +  ZLIB_URL=3D"https://www.zlib.net"
>  fi
> =20
>  fi
> @@ -3550,7 +3550,7 @@ if test "x$LIBPCI_URL" =3D "x"; then :
>  	if test "x$extfiles" =3D "xy"; then :
>    LIBPCI_URL=3D\$\(XEN_EXTFILES_URL\)
>  else
> -  LIBPCI_URL=3D"http://www.kernel.org/pub/software/utils/pciutils"
> +  LIBPCI_URL=3D"https://mirrors.edge.kernel.org/pub/software/utils/pciut=
ils"
>  fi
> =20
>  fi
> @@ -3565,7 +3565,7 @@ if test "x$NEWLIB_URL" =3D "x"; then :
>  	if test "x$extfiles" =3D "xy"; then :
>    NEWLIB_URL=3D\$\(XEN_EXTFILES_URL\)
>  else
> -  NEWLIB_URL=3D"ftp://sources.redhat.com/pub/newlib"
> +  NEWLIB_URL=3D"https://sourceware.org/ftp/newlib"
>  fi
> =20
>  fi
> @@ -3580,7 +3580,7 @@ if test "x$LWIP_URL" =3D "x"; then :
>  	if test "x$extfiles" =3D "xy"; then :
>    LWIP_URL=3D\$\(XEN_EXTFILES_URL\)
>  else
> -  LWIP_URL=3D"http://download.savannah.gnu.org/releases/lwip"
> +  LWIP_URL=3D"https://download.savannah.gnu.org/releases/lwip"
>  fi
> =20
>  fi
> @@ -3595,7 +3595,7 @@ if test "x$GRUB_URL" =3D "x"; then :
>  	if test "x$extfiles" =3D "xy"; then :
>    GRUB_URL=3D\$\(XEN_EXTFILES_URL\)
>  else
> -  GRUB_URL=3D"http://alpha.gnu.org/gnu/grub"
> +  GRUB_URL=3D"https://alpha.gnu.org/gnu/grub"
>  fi
> =20
>  fi
> @@ -3607,7 +3607,7 @@ GRUB_VERSION=3D"0.97"
> =20
>  if test "x$OCAML_URL" =3D "x"; then :
> =20
> -	OCAML_URL=3D"http://caml.inria.fr/pub/distrib/ocaml-4.02"
> +	OCAML_URL=3D"https://caml.inria.fr/pub/distrib/ocaml-4.02"
> =20
>  fi
>  OCAML_VERSION=3D"4.02.0"
> @@ -3621,7 +3621,7 @@ if test "x$GMP_URL" =3D "x"; then :
>  	if test "x$extfiles" =3D "xy"; then :
>    GMP_URL=3D\$\(XEN_EXTFILES_URL\)
>  else
> -  GMP_URL=3D"ftp://ftp.gmplib.org/pub/gmp-4.3.2"
> +  GMP_URL=3D"https://gmplib.org/download/gmp/archive"
>  fi
> =20
>  fi
> @@ -3636,7 +3636,7 @@ if test "x$POLARSSL_URL" =3D "x"; then :
>  	if test "x$extfiles" =3D "xy"; then :
>    POLARSSL_URL=3D\$\(XEN_EXTFILES_URL\)
>  else
> -  POLARSSL_URL=3D"http://polarssl.org/code/releases"
> +  POLARSSL_URL=3D"https://polarssl.org/code/releases"
>  fi
> =20
>  fi
> @@ -3651,7 +3651,7 @@ if test "x$TPMEMU_URL" =3D "x"; then :
>  	if test "x$extfiles" =3D "xy"; then :
>    TPMEMU_URL=3D\$\(XEN_EXTFILES_URL\)
>  else
> -  TPMEMU_URL=3D"http://download.berlios.de/tpm-emulator"
> +  TPMEMU_URL=3D"https://download.berlios.de/tpm-emulator"
>  fi
> =20
>  fi
> @@ -3669,6 +3669,12 @@ vtpmmgr=3D"n"
>  fi
> =20
> =20
> +if test "x$vtpm" !=3D xn || test "x$vtpmmgr" !=3D xn || test "x$ioemu" !=
=3D xn; then
> +    if test "x$extfiles" !=3D xy; then
> +        as_fn_error $? "Sources needed for the vTPM, vTPM manager, and I=
O emulator stubdomains are no longer at their original URLs" "$LINENO" 5
> +    fi
> +fi
> +
>  #Conditionally enable these stubdoms based on the presense of dependenci=
es
> =20
>  if test "x$vtpm" =3D "xy" || test "x$vtpm" =3D "x"; then :
> diff --git a/stubdom/configure.ac b/stubdom/configure.ac
> index e20d99edac0da88098f4806333edde9f31dbc1a7..d27f2bc1f17140ab41a687e1e=
8faaa66e2b4483b 100644
> --- a/stubdom/configure.ac
> +++ b/stubdom/configure.ac
> @@ -55,19 +55,25 @@ AC_PROG_INSTALL
>  AX_DEPENDS_PATH_PROG([vtpm], [CMAKE], [cmake])
> =20
>  # Stubdom libraries version and url setup
> -AX_STUBDOM_LIB([ZLIB], [zlib], [1.2.3], [http://www.zlib.net])
> -AX_STUBDOM_LIB([LIBPCI], [libpci], [2.2.9], [http://www.kernel.org/pub/s=
oftware/utils/pciutils])
> -AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0], [ftp://sources.redhat.com/p=
ub/newlib])
> -AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0], [http://download.savannah.gnu.or=
g/releases/lwip])
> -AX_STUBDOM_LIB([GRUB], [grub], [0.97], [http://alpha.gnu.org/gnu/grub])
> -AX_STUBDOM_LIB_NOEXT([OCAML], [ocaml], [4.02.0], [http://caml.inria.fr/p=
ub/distrib/ocaml-4.02])
> -AX_STUBDOM_LIB([GMP], [libgmp], [4.3.2], [ftp://ftp.gmplib.org/pub/gmp-4=
=2E3.2])
> -AX_STUBDOM_LIB([POLARSSL], [polarssl], [1.1.4], [http://polarssl.org/cod=
e/releases])
> -AX_STUBDOM_LIB([TPMEMU], [berlios tpm emulator], [0.7.4], [http://downlo=
ad.berlios.de/tpm-emulator])
> +AX_STUBDOM_LIB([ZLIB], [zlib], [1.2.3], [https://www.zlib.net])
> +AX_STUBDOM_LIB([LIBPCI], [libpci], [2.2.9], [https://mirrors.edge.kernel=
=2Eorg/pub/software/utils/pciutils])
> +AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0], [https://sourceware.org/ftp=
/newlib])
> +AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0], [https://download.savannah.gnu.o=
rg/releases/lwip])
> +AX_STUBDOM_LIB([GRUB], [grub], [0.97], [https://alpha.gnu.org/gnu/grub])
> +AX_STUBDOM_LIB_NOEXT([OCAML], [ocaml], [4.02.0], [https://caml.inria.fr/=
pub/distrib/ocaml-4.02])
> +AX_STUBDOM_LIB([GMP], [libgmp], [4.3.2], [https://gmplib.org/download/gm=
p/archive])
> +AX_STUBDOM_LIB([POLARSSL], [polarssl], [1.1.4], [https://polarssl.org/co=
de/releases])
> +AX_STUBDOM_LIB([TPMEMU], [berlios tpm emulator], [0.7.4], [https://downl=
oad.berlios.de/tpm-emulator])
> =20
>  #These stubdoms should be enabled if the dependent one is
>  AX_STUBDOM_AUTO_DEPENDS([vtpmmgr], [vtpm])
> =20
> +if test "x$vtpm" !=3D xn || test "x$vtpmmgr" !=3D xn || test "x$ioemu" !=
=3D xn; then
> +    if test "x$extfiles" !=3D xy; then
> +        AC_MSG_ERROR([Sources needed for the vTPM, vTPM manager, and IO =
emulator stubdomains are no longer at their original URLs])
> +    fi
> +fi
> +
>  #Conditionally enable these stubdoms based on the presense of dependenci=
es
>  AX_STUBDOM_CONDITIONAL_FINISH([vtpm-stubdom], [vtpm])
>  AX_STUBDOM_CONDITIONAL_FINISH([vtpmmgr-stubdom], [vtpmmgr])
> diff --git a/tools/firmware/etherboot/Makefile b/tools/firmware/etherboot=
/Makefile
> index 4bc3633ba3d67ff9f52a9cb7923afea73c861da9..6ab9e5bc6b4cc750f2e802128=
fbc71e9150397b1 100644
> --- a/tools/firmware/etherboot/Makefile
> +++ b/tools/firmware/etherboot/Makefile
> @@ -4,11 +4,7 @@ XEN_ROOT =3D $(CURDIR)/../../..
>  include $(XEN_ROOT)/tools/Rules.mk
>  include Config
> =20
> -ifeq ($(GIT_HTTP),y)
> -IPXE_GIT_URL ?=3D http://git.ipxe.org/ipxe.git
> -else
> -IPXE_GIT_URL ?=3D git://git.ipxe.org/ipxe.git
> -endif
> +IPXE_GIT_URL ?=3D https://github.com/ipxe/ipxe.git
> =20
>  # put an updated tar.gz on xenbits after changes to this variable
>  IPXE_GIT_TAG :=3D 3c040ad387099483102708bb1839110bc788cefb
> --=20
> Sincerely,
> Demi Marie Obenour (she/her/hers)
> Invisible Things Lab
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--lSEMJVqM7h4dPmkm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPw3EkACgkQ24/THMrX
1ywmAQf/ZtCKCGEwcAMkGqDqjkRA9Nc3HXneMSN/uuJuSybqX7VNqTSIZvzmtS3z
5p4ItJJhRd0IuLjwFmmgs5Dxkpm7A20/07o+uwdN+F2RNBQbX4Q8zPiZlBzDNB/a
grZqGzE++d5jYjtR1BAwxHlNw1Mq43h9OAlLMKluQ1nVlH2RwpPw/uhyltTsrhdZ
OJZ42BkiAXaR6BxnOhawooHLICxK2BIQgr7jy7DUX/oX3pB92rBpb7JTNcQKRHQG
m5W+E0VIfLvSgUwMfYcEbj4BLXLaiYzNFEHIFmy8tEINYn2L/iprvD619eF49W0f
8mkKWO6F1aWPNak33mNzAVmUNgJBXg==
=12Qs
-----END PGP SIGNATURE-----

--lSEMJVqM7h4dPmkm--

