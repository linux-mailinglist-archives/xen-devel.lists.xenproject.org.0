Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B168D4E38
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 16:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732765.1138795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCgzs-0003B0-US; Thu, 30 May 2024 14:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732765.1138795; Thu, 30 May 2024 14:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCgzs-000399-R0; Thu, 30 May 2024 14:43:16 +0000
Received: by outflank-mailman (input) for mailman id 732765;
 Thu, 30 May 2024 14:43:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LA40=NB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCgzr-000393-OI
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 14:43:15 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1f79677-1e92-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 16:43:14 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52b119986f2so1129097e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 07:43:14 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5297066b89bsm1563053e87.175.2024.05.30.07.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 07:43:13 -0700 (PDT)
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
X-Inumbo-ID: f1f79677-1e92-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717080194; x=1717684994; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tZ+9rqcEtwFOPm0ZOsQRoFuxkJ0lnj3tyqVGcJWh0IQ=;
        b=LZX86YSYiteeSUUrMOblxr5mORfg4WKtaxu3XSObWr8uS0lXO5N7r6OVGYhx81tOv+
         1smzfn8YXli1IWCx/bBJPz9pb3JlD8RnCIQaE7KPZR6DTPbmIzexeca9hVg3jSNLLjUP
         yOCaR/NhITmElxj9YL+7eWC3uL5h259t4d6qBHgaenKlpwixvEdvX68O70cV3uzo/fOE
         O8AxONDU1RNW4uDrDhf+wPsB+4X4pCxd5Flh/15kE2cspt1lc1Excgc8WrJtfMREpHxr
         N046lpUvdVmC/Y9yeDjv+9GqCn1JtQb4fMAAWcfAH+4UM46QvdlB/yetPjLhg032dIGb
         DV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717080194; x=1717684994;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZ+9rqcEtwFOPm0ZOsQRoFuxkJ0lnj3tyqVGcJWh0IQ=;
        b=CBwkmvq9Ga0mqu+k2awiT98y2u6WveqvsjYXWbsGxQnakeKGBIsO/NJBe5WVNETEyB
         ovPFTVEiajSOS2DtFnq3UJaHCHWKPdfTqb29ahsK2LK/imFFb7fQWmVyIKm0G/i33WFr
         tNsHhEMfmhluSftY7f8in7QAjeAJqoKwEKI2YG39gffnEKHxixyiuysJc50q7YN8VSkC
         i+pwo+6NTDyt7wj7ZtDq9CkpyPrK3TU3aPAiQgBPqOKEqbr3yMu7uEsb3THP+dgsTDym
         RiRh0qwGQ0eug9kpdDIy2sZJ2EXUyp2nhLUKy2nIHaqT1V5awEEYYEPod3VhHMyS6fHG
         neIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMWoFru0boYV1TRk7r5qqfWp3dt4dxIdQrB7bRALYxKJM0i66X2NAnBu7Bp+dRzWLC2rjZD9ggcKQxjqbv20KboE2bP98IbYV84vvBNeU=
X-Gm-Message-State: AOJu0Yzzw1lxVPcCArFF4GLWHOr0O6rtC7s3gjsECElJQzvvRKYYKOUD
	mru9Pakvhxhu4EuGwW04a1XrFkLsjjt0/5wWt0ZW4F8STJSjCv3C
X-Google-Smtp-Source: AGHT+IFgC7WcTwoibTB69tnsOMxQGi4DOm+Yj58Ag7dpTkqVRAaja+qwf+VoVYWgjlHfv4n16irGwQ==
X-Received: by 2002:a19:ac08:0:b0:51c:a0e1:2a44 with SMTP id 2adb3069b0e04-52b7d427180mr1726513e87.26.1717080193641;
        Thu, 30 May 2024 07:43:13 -0700 (PDT)
Message-ID: <7f25c5a034083b88547398ff94fe23ec92ca2779.camel@gmail.com>
Subject: Re: [PATCH] tools: (Actually) drop libsystemd as a dependency
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross
 <jgross@suse.com>,  George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>
Date: Thu, 30 May 2024 16:43:12 +0200
In-Reply-To: <20240530101439.16730-1-andrew.cooper3@citrix.com>
References: <20240530101439.16730-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-30 at 11:14 +0100, Andrew Cooper wrote:
> When reinstating some of systemd.m4 between v1 and v2, I reintroduced
> a little
> too much.=C2=A0 While {c,o}xenstored are indeed no longer linked against
> libsystemd, ./configure still looks for it.
>=20
> Drop this too.
>=20
> Fixes: ae26101f6bfc ("tools: Drop libsystemd as a dependency")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
> ---
> CC: Anthony PERARD <anthony@xenproject.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Found when trying to build Xen in XenServer with libsystemd absent
> from the
> chroot.
> ---
> =C2=A0m4/systemd.m4=C2=A0=C2=A0 |=C2=A0=C2=A0 8 --
> =C2=A0tools/configure | 229 +--------------------------------------------=
-
> --
> =C2=A02 files changed, 1 insertion(+), 236 deletions(-)
>=20
> diff --git a/m4/systemd.m4 b/m4/systemd.m4
> index e4fe51a8ba..ab12ea313d 100644
> --- a/m4/systemd.m4
> +++ b/m4/systemd.m4
> @@ -86,13 +86,6 @@ AC_DEFUN([AX_CHECK_SYSTEMD], [
> =C2=A0	],[systemd=3Dn])
> =C2=A0])
> =C2=A0
> -AC_DEFUN([AX_CHECK_SYSTEMD_ENABLE_AVAILABLE], [
> -	PKG_CHECK_MODULES([SYSTEMD], [libsystemd-daemon],
> [systemd=3D"y"],[
> -		PKG_CHECK_MODULES([SYSTEMD], [libsystemd >=3D 209],
> -				=C2=A0 [systemd=3D"y"],[systemd=3D"n"])
> -	])
> -])
> -
> =C2=A0dnl Enables systemd by default and requires a --disable-systemd
> option flag
> =C2=A0dnl to configure if you want to disable.
> =C2=A0AC_DEFUN([AX_ENABLE_SYSTEMD], [
> @@ -112,6 +105,5 @@ dnl to have systemd build libraries it will be
> enabled. You can always force
> =C2=A0dnl disable with --disable-systemd
> =C2=A0AC_DEFUN([AX_AVAILABLE_SYSTEMD], [
> =C2=A0	AX_ALLOW_SYSTEMD_OPTS()
> -	AX_CHECK_SYSTEMD_ENABLE_AVAILABLE()
> =C2=A0	AX_CHECK_SYSTEMD()
> =C2=A0])
> diff --git a/tools/configure b/tools/configure
> index b8faa1d520..459bfb5652 100755
> --- a/tools/configure
> +++ b/tools/configure
> @@ -626,8 +626,6 @@ ac_subst_vars=3D'LTLIBOBJS
> =C2=A0LIBOBJS
> =C2=A0pvshim
> =C2=A0ninepfs
> -SYSTEMD_LIBS
> -SYSTEMD_CFLAGS
> =C2=A0SYSTEMD_MODULES_LOAD
> =C2=A0SYSTEMD_DIR
> =C2=A0systemd
> @@ -864,9 +862,7 @@ pixman_LIBS
> =C2=A0libzstd_CFLAGS
> =C2=A0libzstd_LIBS
> =C2=A0LIBNL3_CFLAGS
> -LIBNL3_LIBS
> -SYSTEMD_CFLAGS
> -SYSTEMD_LIBS'
> +LIBNL3_LIBS'
> =C2=A0
> =C2=A0
> =C2=A0# Initialize some variables set by options.
> @@ -1621,10 +1617,6 @@ Some influential environment variables:
> =C2=A0=C2=A0 LIBNL3_CFLAGS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 C compiler flags for LIBNL3, overriding pkg-config
> =C2=A0=C2=A0 LIBNL3_LIBS linker flags for LIBNL3, overriding pkg-config
> -=C2=A0 SYSTEMD_CFLAGS
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 C compiler flags for SYSTEMD, overriding pkg-config
> -=C2=A0 SYSTEMD_LIBS
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 linker flags for SYSTEMD, overriding pkg-config
> =C2=A0
> =C2=A0Use these variables to override the choices made by `configure' or
> to help
> =C2=A0it to find libraries and programs with nonstandard names/locations.
> @@ -3889,8 +3881,6 @@ esac
> =C2=A0
> =C2=A0
> =C2=A0
> -
> -
> =C2=A0
> =C2=A0
> =C2=A0
> @@ -9540,223 +9530,6 @@ fi
> =C2=A0
> =C2=A0
> =C2=A0
> -
> -pkg_failed=3Dno
> -{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
> -$as_echo_n "checking for SYSTEMD... " >&6; }
> -
> -if test -n "$SYSTEMD_CFLAGS"; then
> -=C2=A0=C2=A0=C2=A0 pkg_cv_SYSTEMD_CFLAGS=3D"$SYSTEMD_CFLAGS"
> - elif test -n "$PKG_CONFIG"; then
> -=C2=A0=C2=A0=C2=A0 if test -n "$PKG_CONFIG" && \
> -=C2=A0=C2=A0=C2=A0 { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONF=
IG --exists
> --print-errors \"libsystemd-daemon\""; } >&5
> -=C2=A0 ($PKG_CONFIG --exists --print-errors "libsystemd-daemon") 2>&5
> -=C2=A0 ac_status=3D$?
> -=C2=A0 $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> -=C2=A0 test $ac_status =3D 0; }; then
> -=C2=A0 pkg_cv_SYSTEMD_CFLAGS=3D`$PKG_CONFIG --cflags "libsystemd-daemon"
> 2>/dev/null`
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test "x$?" !=3D "x0" && pkg_failed=3Dye=
s
> -else
> -=C2=A0 pkg_failed=3Dyes
> -fi
> - else
> -=C2=A0=C2=A0=C2=A0 pkg_failed=3Duntried
> -fi
> -if test -n "$SYSTEMD_LIBS"; then
> -=C2=A0=C2=A0=C2=A0 pkg_cv_SYSTEMD_LIBS=3D"$SYSTEMD_LIBS"
> - elif test -n "$PKG_CONFIG"; then
> -=C2=A0=C2=A0=C2=A0 if test -n "$PKG_CONFIG" && \
> -=C2=A0=C2=A0=C2=A0 { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONF=
IG --exists
> --print-errors \"libsystemd-daemon\""; } >&5
> -=C2=A0 ($PKG_CONFIG --exists --print-errors "libsystemd-daemon") 2>&5
> -=C2=A0 ac_status=3D$?
> -=C2=A0 $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> -=C2=A0 test $ac_status =3D 0; }; then
> -=C2=A0 pkg_cv_SYSTEMD_LIBS=3D`$PKG_CONFIG --libs "libsystemd-daemon"
> 2>/dev/null`
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test "x$?" !=3D "x0" && pkg_failed=3Dye=
s
> -else
> -=C2=A0 pkg_failed=3Dyes
> -fi
> - else
> -=C2=A0=C2=A0=C2=A0 pkg_failed=3Duntried
> -fi
> -
> -
> -
> -if test $pkg_failed =3D yes; then
> -=C2=A0=C2=A0=C2=A0	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" =
>&5
> -$as_echo "no" >&6; }
> -
> -if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _pkg_short_errors_supported=
=3Dyes
> -else
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _pkg_short_errors_supported=
=3Dno
> -fi
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if test $_pkg_short_errors_su=
pported =3D yes; then
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYSTEMD_PKG_ERRORS=3D`$PKG_C=
ONFIG --short-errors --
> print-errors --cflags --libs "libsystemd-daemon" 2>&1`
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYSTEMD_PKG_ERRORS=3D`$PKG_C=
ONFIG --print-errors --
> cflags --libs "libsystemd-daemon" 2>&1`
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> -	# Put the nasty error message in config.log where it belongs
> -	echo "$SYSTEMD_PKG_ERRORS" >&5
> -
> -
> -
> -pkg_failed=3Dno
> -{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
> -$as_echo_n "checking for SYSTEMD... " >&6; }
> -
> -if test -n "$SYSTEMD_CFLAGS"; then
> -=C2=A0=C2=A0=C2=A0 pkg_cv_SYSTEMD_CFLAGS=3D"$SYSTEMD_CFLAGS"
> - elif test -n "$PKG_CONFIG"; then
> -=C2=A0=C2=A0=C2=A0 if test -n "$PKG_CONFIG" && \
> -=C2=A0=C2=A0=C2=A0 { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONF=
IG --exists
> --print-errors \"libsystemd >=3D 209\""; } >&5
> -=C2=A0 ($PKG_CONFIG --exists --print-errors "libsystemd >=3D 209") 2>&5
> -=C2=A0 ac_status=3D$?
> -=C2=A0 $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> -=C2=A0 test $ac_status =3D 0; }; then
> -=C2=A0 pkg_cv_SYSTEMD_CFLAGS=3D`$PKG_CONFIG --cflags "libsystemd >=3D 20=
9"
> 2>/dev/null`
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test "x$?" !=3D "x0" && pkg_failed=3Dye=
s
> -else
> -=C2=A0 pkg_failed=3Dyes
> -fi
> - else
> -=C2=A0=C2=A0=C2=A0 pkg_failed=3Duntried
> -fi
> -if test -n "$SYSTEMD_LIBS"; then
> -=C2=A0=C2=A0=C2=A0 pkg_cv_SYSTEMD_LIBS=3D"$SYSTEMD_LIBS"
> - elif test -n "$PKG_CONFIG"; then
> -=C2=A0=C2=A0=C2=A0 if test -n "$PKG_CONFIG" && \
> -=C2=A0=C2=A0=C2=A0 { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONF=
IG --exists
> --print-errors \"libsystemd >=3D 209\""; } >&5
> -=C2=A0 ($PKG_CONFIG --exists --print-errors "libsystemd >=3D 209") 2>&5
> -=C2=A0 ac_status=3D$?
> -=C2=A0 $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> -=C2=A0 test $ac_status =3D 0; }; then
> -=C2=A0 pkg_cv_SYSTEMD_LIBS=3D`$PKG_CONFIG --libs "libsystemd >=3D 209"
> 2>/dev/null`
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test "x$?" !=3D "x0" && pkg_failed=3Dye=
s
> -else
> -=C2=A0 pkg_failed=3Dyes
> -fi
> - else
> -=C2=A0=C2=A0=C2=A0 pkg_failed=3Duntried
> -fi
> -
> -
> -
> -if test $pkg_failed =3D yes; then
> -=C2=A0=C2=A0=C2=A0	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" =
>&5
> -$as_echo "no" >&6; }
> -
> -if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _pkg_short_errors_supported=
=3Dyes
> -else
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _pkg_short_errors_supported=
=3Dno
> -fi
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if test $_pkg_short_errors_su=
pported =3D yes; then
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYSTEMD_PKG_ERRORS=3D`$PKG_C=
ONFIG --short-errors --
> print-errors --cflags --libs "libsystemd >=3D 209" 2>&1`
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYSTEMD_PKG_ERRORS=3D`$PKG_C=
ONFIG --print-errors --
> cflags --libs "libsystemd >=3D 209" 2>&1`
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> -	# Put the nasty error message in config.log where it belongs
> -	echo "$SYSTEMD_PKG_ERRORS" >&5
> -
> -	systemd=3D"n"
> -elif test $pkg_failed =3D untried; then
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	{ $as_echo "$as_me:${as_lineno-$LINENO}: =
result: no" >&5
> -$as_echo "no" >&6; }
> -	systemd=3D"n"
> -else
> -	SYSTEMD_CFLAGS=3D$pkg_cv_SYSTEMD_CFLAGS
> -	SYSTEMD_LIBS=3D$pkg_cv_SYSTEMD_LIBS
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { $as_echo "$as_me:${as_linen=
o-$LINENO}: result: yes" >&5
> -$as_echo "yes" >&6; }
> -	systemd=3D"y"
> -fi
> -
> -elif test $pkg_failed =3D untried; then
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	{ $as_echo "$as_me:${as_lineno-$LINENO}: =
result: no" >&5
> -$as_echo "no" >&6; }
> -
> -
> -pkg_failed=3Dno
> -{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
> -$as_echo_n "checking for SYSTEMD... " >&6; }
> -
> -if test -n "$SYSTEMD_CFLAGS"; then
> -=C2=A0=C2=A0=C2=A0 pkg_cv_SYSTEMD_CFLAGS=3D"$SYSTEMD_CFLAGS"
> - elif test -n "$PKG_CONFIG"; then
> -=C2=A0=C2=A0=C2=A0 if test -n "$PKG_CONFIG" && \
> -=C2=A0=C2=A0=C2=A0 { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONF=
IG --exists
> --print-errors \"libsystemd >=3D 209\""; } >&5
> -=C2=A0 ($PKG_CONFIG --exists --print-errors "libsystemd >=3D 209") 2>&5
> -=C2=A0 ac_status=3D$?
> -=C2=A0 $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> -=C2=A0 test $ac_status =3D 0; }; then
> -=C2=A0 pkg_cv_SYSTEMD_CFLAGS=3D`$PKG_CONFIG --cflags "libsystemd >=3D 20=
9"
> 2>/dev/null`
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test "x$?" !=3D "x0" && pkg_failed=3Dye=
s
> -else
> -=C2=A0 pkg_failed=3Dyes
> -fi
> - else
> -=C2=A0=C2=A0=C2=A0 pkg_failed=3Duntried
> -fi
> -if test -n "$SYSTEMD_LIBS"; then
> -=C2=A0=C2=A0=C2=A0 pkg_cv_SYSTEMD_LIBS=3D"$SYSTEMD_LIBS"
> - elif test -n "$PKG_CONFIG"; then
> -=C2=A0=C2=A0=C2=A0 if test -n "$PKG_CONFIG" && \
> -=C2=A0=C2=A0=C2=A0 { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONF=
IG --exists
> --print-errors \"libsystemd >=3D 209\""; } >&5
> -=C2=A0 ($PKG_CONFIG --exists --print-errors "libsystemd >=3D 209") 2>&5
> -=C2=A0 ac_status=3D$?
> -=C2=A0 $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> -=C2=A0 test $ac_status =3D 0; }; then
> -=C2=A0 pkg_cv_SYSTEMD_LIBS=3D`$PKG_CONFIG --libs "libsystemd >=3D 209"
> 2>/dev/null`
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test "x$?" !=3D "x0" && pkg_failed=3Dye=
s
> -else
> -=C2=A0 pkg_failed=3Dyes
> -fi
> - else
> -=C2=A0=C2=A0=C2=A0 pkg_failed=3Duntried
> -fi
> -
> -
> -
> -if test $pkg_failed =3D yes; then
> -=C2=A0=C2=A0=C2=A0	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" =
>&5
> -$as_echo "no" >&6; }
> -
> -if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _pkg_short_errors_supported=
=3Dyes
> -else
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _pkg_short_errors_supported=
=3Dno
> -fi
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if test $_pkg_short_errors_su=
pported =3D yes; then
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYSTEMD_PKG_ERRORS=3D`$PKG_C=
ONFIG --short-errors --
> print-errors --cflags --libs "libsystemd >=3D 209" 2>&1`
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYSTEMD_PKG_ERRORS=3D`$PKG_C=
ONFIG --print-errors --
> cflags --libs "libsystemd >=3D 209" 2>&1`
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> -	# Put the nasty error message in config.log where it belongs
> -	echo "$SYSTEMD_PKG_ERRORS" >&5
> -
> -	systemd=3D"n"
> -elif test $pkg_failed =3D untried; then
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	{ $as_echo "$as_me:${as_lineno-$LINENO}: =
result: no" >&5
> -$as_echo "no" >&6; }
> -	systemd=3D"n"
> -else
> -	SYSTEMD_CFLAGS=3D$pkg_cv_SYSTEMD_CFLAGS
> -	SYSTEMD_LIBS=3D$pkg_cv_SYSTEMD_LIBS
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { $as_echo "$as_me:${as_linen=
o-$LINENO}: result: yes" >&5
> -$as_echo "yes" >&6; }
> -	systemd=3D"y"
> -fi
> -
> -else
> -	SYSTEMD_CFLAGS=3D$pkg_cv_SYSTEMD_CFLAGS
> -	SYSTEMD_LIBS=3D$pkg_cv_SYSTEMD_LIBS
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { $as_echo "$as_me:${as_linen=
o-$LINENO}: result: yes" >&5
> -$as_echo "yes" >&6; }
> -	systemd=3D"y"
> -fi
> -
> -
> =C2=A0		if test "x$enable_systemd" !=3D "xno"; then :
> =C2=A0
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 if test "x$systemd" =3D "xy" ; then :


