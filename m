Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E6D6C86CA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 21:25:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514416.796617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfnyR-0004nr-80; Fri, 24 Mar 2023 20:25:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514416.796617; Fri, 24 Mar 2023 20:25:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfnyR-0004lS-56; Fri, 24 Mar 2023 20:25:19 +0000
Received: by outflank-mailman (input) for mailman id 514416;
 Fri, 24 Mar 2023 20:25:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q/Ua=7Q=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pfnyP-0004lG-KQ
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 20:25:17 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb42d998-ca81-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 21:25:15 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 092685C01AD;
 Fri, 24 Mar 2023 16:25:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 24 Mar 2023 16:25:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Mar 2023 16:25:12 -0400 (EDT)
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
X-Inumbo-ID: fb42d998-ca81-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1679689513; x=1679775913; bh=e+rME+gzbkQNHauc/T1Db5ZG3vyDuLfHHUO
	mWTlI4Fk=; b=Q5UkCeqVe+u3I6gmvA++BhZ9GtyOsCSYxpPOC2UwzrQ7HkEUeQU
	044n/98ZAcs5klCdNFAogpmDtxmMHkyK7nYnpyyC9mqLLh5O223pdCKSX9ICfNZ9
	/n4+6ALkBdi8LrAvbFIX2uc4/91frRR+AA0Kyuv9as6pNQYmv0kp07CQ3l/guw2W
	Q47ZfEO+eS+mcT1vj9QjBZcIB7zDUnr+jDn/mPGGgE1bESUy3cbE6PK0KSOkWsD9
	/CZNYZWbdB7DGnYdBRTGzYJp+GL0Ld+rKvsRaTDohzZ+9c92bxSVU2ILJ5QjcIpx
	clFhNF9wv45NDjel5bYYv/TD4bA4hXlfkCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679689513; x=1679775913; bh=e+rME+gzbkQNH
	auc/T1Db5ZG3vyDuLfHHUOmWTlI4Fk=; b=ssqUC5Kv1JhLNPCsCugKmr0DMTnAr
	xm1PZCLtHVMJqmiss/MX84McIapwXm6vJ7iTX9PHnd9SQwycoFwNSms6v2JcrjY0
	XkX+hbAZJXqyAmRkTZCY7kDqKZQFAJNElsP9V+IoQ08slIw3bJydpD7MnuFyfoEg
	3uHmVIBGfbbag8c4X2kKf5rU8Bve7x4BCqsuBj0nznpiQ0sMCM3uv31Vh2K3IUT4
	H/bh6Z+BuhfXviyTmcTS60a3t0AaMU/18oPVMG+aN4xqospJSM2h/AYjT90IZ8UP
	VvSFiJgqKAoQJnq6ZtDrifTcAPBM58E7D63MI+HfIQjoEjumnwe73fkTw==
X-ME-Sender: <xms:KAceZDIRRO2apyqI-0Lvwp-c8Dke0hNcD-v84LkdDYNXI7AsbOjofg>
    <xme:KAceZHJafKuMxcJzFXcVmRvJnW1GaHkf-lgrAXgIflW9AE4gp7BEjRrxcNeMH2FKW
    zS30sMW8zpB-LU>
X-ME-Received: <xmr:KAceZLtGrfE1Lo5Gxb-Dl-uS2vwucgEq1snZanJzhzoxgWBZdhkeOVenTGI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegiedgudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduieelfeeutedvleehueetffej
    geejgeffkeelveeuleeukeejjeduffetjeekteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:KAceZMaLmjeldPWO1gCJu4Jma_N0qsIrouph6r-sIdVKNQriErB6Qw>
    <xmx:KAceZKYrLVH5NX19GprfO9cPFic_hQ5heeNX2CxDhyX9yey4-Yvn2A>
    <xmx:KAceZABWYdcJlYifeW0bY1OjstJ-Grd-EepEk_SAYAudBL06A7GYCA>
    <xmx:KQceZBwSDRPwZ9LgE8TmTRc6CQKR3n4VkoyXE7fp3cEUC8eN_6Nw1Q>
Feedback-ID: iac594737:Fastmail
Date: Fri, 24 Mar 2023 16:25:07 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH] configure: Drop --enable-githttp
Message-ID: <ZB4HJuJBwh6lE4nb@itl-email>
References: <20230324201404.3247572-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cpbNzAF5USd8coRa"
Content-Disposition: inline
In-Reply-To: <20230324201404.3247572-1-andrew.cooper3@citrix.com>


--cpbNzAF5USd8coRa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Mar 2023 16:25:07 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH] configure: Drop --enable-githttp

On Fri, Mar 24, 2023 at 08:14:04PM +0000, Andrew Cooper wrote:
> Following Demi's work to use HTTPS everywhere, all users of GIT_HTTP have
> been removed from the build system.  Drop the configure knob.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Demi Marie Obenour <demi@invisiblethingslab.com>

> ---
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Demi Marie Obenour <demi@invisiblethingslab.com>
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> ---
>  INSTALL               |  5 -----
>  config/Tools.mk.in    |  6 ------
>  config/Toplevel.mk.in |  1 -
>  configure             | 27 ---------------------------
>  configure.ac          |  1 -
>  tools/configure       | 27 ---------------------------
>  tools/configure.ac    |  1 -
>  7 files changed, 68 deletions(-)
>=20
> diff --git a/INSTALL b/INSTALL
> index 0d3eb89f0298..3816c17dcde8 100644
> --- a/INSTALL
> +++ b/INSTALL
> @@ -89,11 +89,6 @@ from a wrong location. Compiling the tools with rpath =
will force the
>  linker to look in the correct location.
>    --enable-rpath
> =20
> -During build in a git checkout the buildsystem needs to download
> -additional tools such as qemu. This is done with either the native git
> -protocol, or via http if this option is enabled.
> -  --enable-githttp
> -
>  Disable xenstat and xentop monitoring tools.
>    --disable-monitors
> =20
> diff --git a/config/Tools.mk.in b/config/Tools.mk.in
> index d0d460f922d8..6abb377564db 100644
> --- a/config/Tools.mk.in
> +++ b/config/Tools.mk.in
> @@ -37,12 +37,6 @@ LIBNL3_LIBS         :=3D @LIBNL3_LIBS@
>  LIBNL3_CFLAGS       :=3D @LIBNL3_CFLAGS@
>  XEN_TOOLS_RPATH     :=3D @rpath@
> =20
> -# Download GIT repositories via HTTP or GIT's own protocol?
> -# GIT's protocol is faster and more robust, when it works at all (firewa=
lls
> -# may block it). We make it the default, but if your GIT repository down=
loads
> -# fail or hang, please pass --enable-githttp to configure.
> -GIT_HTTP            ?=3D @githttp@
> -
>  # Optional components
>  XENSTAT_XENTOP      :=3D @monitors@
>  OCAML_TOOLS         :=3D @ocamltools@
> diff --git a/config/Toplevel.mk.in b/config/Toplevel.mk.in
> index 4ecacbb37d68..4db7eafcab5d 100644
> --- a/config/Toplevel.mk.in
> +++ b/config/Toplevel.mk.in
> @@ -1,2 +1 @@
>  SUBSYSTEMS               :=3D @SUBSYSTEMS@
> -GIT_HTTP                 ?=3D @githttp@
> diff --git a/configure b/configure
> index f5cd3c286b55..99f8434cbf64 100755
> --- a/configure
> +++ b/configure
> @@ -594,7 +594,6 @@ stubdom
>  tools
>  xen
>  subdirs
> -githttp
>  DEBUG_DIR
>  XEN_DUMP_DIR
>  XEN_PAGING_DIR
> @@ -673,7 +672,6 @@ with_xen_scriptdir
>  with_xen_dumpdir
>  with_rundir
>  with_debugdir
> -enable_githttp
>  enable_xen
>  enable_tools
>  enable_stubdom
> @@ -1309,8 +1307,6 @@ Optional Features:
>    --disable-option-checking  ignore unrecognized --enable/--with options
>    --disable-FEATURE       do not include FEATURE (same as --enable-FEATU=
RE=3Dno)
>    --enable-FEATURE[=3DARG]  include FEATURE [ARG=3Dyes]
> -  --enable-githttp        Download GIT repositories via HTTP (default is
> -                          DISABLED)
>    --disable-xen           Disable build and install of xen
>    --disable-tools         Disable build and install of tools
>    --enable-stubdom        Enable build and install of stubdom
> @@ -2124,29 +2120,6 @@ DEBUG_DIR=3D$debugdir_path
> =20
> =20
> =20
> -# Check whether --enable-githttp was given.
> -if test "${enable_githttp+set}" =3D set; then :
> -  enableval=3D$enable_githttp;
> -fi
> -
> -
> -if test "x$enable_githttp" =3D "xno"; then :
> -
> -    ax_cv_githttp=3D"n"
> -
> -elif test "x$enable_githttp" =3D "xyes"; then :
> -
> -    ax_cv_githttp=3D"y"
> -
> -elif test -z $ax_cv_githttp; then :
> -
> -    ax_cv_githttp=3D"n"
> -
> -fi
> -githttp=3D$ax_cv_githttp
> -
> -
> -
>  case "$host_cpu" in
>      i[3456]86|x86_64)
>          arch_enable_stubdom=3Dy
> diff --git a/configure.ac b/configure.ac
> index 3aea40715307..19d9311c2ae4 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -17,7 +17,6 @@ m4_include([m4/subsystem.m4])
>  m4_include([m4/paths.m4])
> =20
>  AX_XEN_EXPAND_CONFIG()
> -AX_ARG_DEFAULT_DISABLE([githttp], [Download GIT repositories via HTTP])
> =20
>  dnl mini-os is only ported to certain platforms
>  case "$host_cpu" in
> diff --git a/tools/configure b/tools/configure
> index dae377c98252..bb5b1ae45067 100755
> --- a/tools/configure
> +++ b/tools/configure
> @@ -714,7 +714,6 @@ ovmf
>  xsmpolicy
>  ocamltools
>  monitors
> -githttp
>  rpath
>  werror
>  DEBUG_DIR
> @@ -807,7 +806,6 @@ with_rundir
>  with_debugdir
>  enable_werror
>  enable_rpath
> -enable_githttp
>  enable_monitors
>  enable_ocamltools
>  enable_xsmpolicy
> @@ -1494,8 +1492,6 @@ Optional Features:
>    --disable-werror        Build tools without -Werror (default is ENABLE=
D)
>    --enable-rpath          Build tools with -Wl,-rpath,LIBDIR (default is
>                            DISABLED)
> -  --enable-githttp        Download GIT repositories via HTTP (default is
> -                          DISABLED)
>    --disable-monitors      Disable xenstat and xentop monitoring tools (d=
efault
>                            is ENABLED)
>    --disable-ocamltools    Disable Ocaml tools (default is ENABLED)
> @@ -4156,29 +4152,6 @@ rpath=3D$ax_cv_rpath
> =20
> =20
> =20
> -# Check whether --enable-githttp was given.
> -if test "${enable_githttp+set}" =3D set; then :
> -  enableval=3D$enable_githttp;
> -fi
> -
> -
> -if test "x$enable_githttp" =3D "xno"; then :
> -
> -    ax_cv_githttp=3D"n"
> -
> -elif test "x$enable_githttp" =3D "xyes"; then :
> -
> -    ax_cv_githttp=3D"y"
> -
> -elif test -z $ax_cv_githttp; then :
> -
> -    ax_cv_githttp=3D"n"
> -
> -fi
> -githttp=3D$ax_cv_githttp
> -
> -
> -
>  # Check whether --enable-monitors was given.
>  if test "${enable_monitors+set}" =3D set; then :
>    enableval=3D$enable_monitors;
> diff --git a/tools/configure.ac b/tools/configure.ac
> index 3a2f6a2da9e0..9bcf42f233f1 100644
> --- a/tools/configure.ac
> +++ b/tools/configure.ac
> @@ -84,7 +84,6 @@ AX_XEN_EXPAND_CONFIG()
>  # Enable/disable options
>  AX_ARG_DEFAULT_ENABLE([werror], [Build tools without -Werror])
>  AX_ARG_DEFAULT_DISABLE([rpath], [Build tools with -Wl,-rpath,LIBDIR])
> -AX_ARG_DEFAULT_DISABLE([githttp], [Download GIT repositories via HTTP])
>  AX_ARG_DEFAULT_ENABLE([monitors], [Disable xenstat and xentop monitoring=
 tools])
>  AX_ARG_DEFAULT_ENABLE([ocamltools], [Disable Ocaml tools])
>  AX_ARG_DEFAULT_ENABLE([xsmpolicy], [Disable XSM policy compilation])
> --=20
> 2.30.2
>=20

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--cpbNzAF5USd8coRa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmQeByYACgkQsoi1X/+c
IsGxARAA0J5MhQQ+WLF6jEYJrItyLLAJFSb6iy3g2JAfgMbhsrS/HC08ho5lanMX
DliXoQXJ4MoLmkOv1MLBxA/G4jfha23C3LPo2z3Cu5U/WmNM9DO+4P+JEXYaUAdQ
Hq6NCbi9AQwkS9poaGQU55JWZ0+NLXsCYSh375RJTzJC5YYBQ3DgJCAIkJcwe9rO
DCS9NMRXWrjeMNTrPdNWs8LLykiNbCc0CM82N8LMXihj6S8l6xswSaP9+KDuC+au
znlYyeM/dTDpVDatMY6lFf4oVXViRSsRCW2qvhdNGV8uqteUpkaW25GcpGRDJ6bt
DxoKGqDE3E59s5QvsCOmXVkQQ2VGVaUf3QHcm2nLOU3bQ92xhkAvvwEQF222B8sX
PFHph4WHDjgbysfiAyVV7q7uJwKOFRGCFZSZhMMGP8xygwE06fVh4yH36gwVAxST
eI6PXbR0HgtpDG8A0HTKbHhobybF21fNsQXJ4hls+hAIfZNzPs0pGmVAGonM2E7U
qWM6bcGDlMKflU8FDMn+lH7fpQh9AuWl+w2fHacx761sC6cY42q0J9I9kSecBQj0
5a64VMLYcWwHwWvW9vwc5QUOCHJw2HdN7QRUswqLlz3CNfDDlXvBoP+PysTEFa1N
XmnsgsJvlIjgHMCnoa520PvNNvLemmpnAwPCY3kM1HMDS0vWeUY=
=VBin
-----END PGP SIGNATURE-----

--cpbNzAF5USd8coRa--

