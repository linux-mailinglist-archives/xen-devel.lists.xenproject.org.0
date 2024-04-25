Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D584D8B27A0
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 19:33:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712194.1112688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s02xQ-0004xC-Jw; Thu, 25 Apr 2024 17:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712194.1112688; Thu, 25 Apr 2024 17:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s02xQ-0004tx-Gh; Thu, 25 Apr 2024 17:32:28 +0000
Received: by outflank-mailman (input) for mailman id 712194;
 Thu, 25 Apr 2024 17:32:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BIz1=L6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s02xP-0004RI-74
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 17:32:27 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c708567b-0329-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 19:32:24 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56e6acb39d4so1574208a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 10:32:24 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ci8-20020a170906c34800b00a587356c04csm4006477ejb.187.2024.04.25.10.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 10:32:22 -0700 (PDT)
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
X-Inumbo-ID: c708567b-0329-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714066343; x=1714671143; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vm54fAi6JaNw3+G4sAOX+Z6d3qFSN3u7bim0oUjoPQA=;
        b=MjUZ9OAoneTSmFUNVR4EkgNPMBd7q6cSIDu2tQKtRenGXaVoo439MK/Xs20YdOyMeX
         GWhWI6k+5oFtAwYEqOx16EyTmD7xE+GnSPR93xmQLZQT3x0jLLORDZUybOefSWYJ8N2R
         ojBUB9td1imEKj5L9/uBbxvY2O2LtTKownLrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714066343; x=1714671143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vm54fAi6JaNw3+G4sAOX+Z6d3qFSN3u7bim0oUjoPQA=;
        b=orebE5QJBMi4BpDZAUFXq25vqQ8TZiS13/wyte/EyjRa9ZTwNMGMJ9WwmqBuipJEnT
         hGyMHwWOm9PIqgbCs+Ffa1VIWtYOLF+o6GufHSN+lmcquaXaZyfrHjQXxuAQKaNIyMsl
         DHouOPLbevo3aUra7LZ8CFGsir3kgIcLhTekq+a/svTIBk0vOHfCf3ACYOpGN9tpTUpy
         SmSrhewPDScllWO9OTEHbCU3mZPNUjP0LV6Mv7Vvb4jU8zlkrh2UPCLySEN1yYEKOXKm
         kf9oFZiWSVfKzJlLL616b2lrPTPcbuwOFulzxP+muwwQoslPBrqXV0VN4xtAVKfqFw8o
         IRQg==
X-Gm-Message-State: AOJu0YxgDUcjEMQH2I+iibUtcp8ytDrgslkCBplrsfVQsqyT4ekRjEFh
	p1Pk3DT5AhcCrE/2z/rhsrzwPm0FDXIVj4X9uTv42uIYq3zrGDxd5Hf8aR5QMTDAYYOPUndoKTu
	u
X-Google-Smtp-Source: AGHT+IGaLa1zNEWZHpeeeP1AdDVXMoTYi3EoCApLK6i7TXo3GFhX8sygt05jFrL3wuycaQMjhsxmYA==
X-Received: by 2002:a17:906:b210:b0:a55:387b:eef9 with SMTP id p16-20020a170906b21000b00a55387beef9mr316035ejz.10.1714066343401;
        Thu, 25 Apr 2024 10:32:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] tools: Drop libsystemd as a dependency
Date: Thu, 25 Apr 2024 18:32:16 +0100
Message-Id: <20240425173216.410940-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240425173216.410940-1-andrew.cooper3@citrix.com>
References: <20240425173216.410940-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are no more users, and we want to disuade people from introducing new
users just for sd_notify() and friends.  Drop the dependency.

We still want the overall --with{,out}-systemd to gate the generation of the
service/unit/mount/etc files.

Rerun autogen.sh, and mark the dependency as removed in the build containers.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/build/archlinux/current.dockerfile |   1 +
 .../build/suse/opensuse-leap.dockerfile       |   1 +
 .../build/suse/opensuse-tumbleweed.dockerfile |   1 +
 automation/build/ubuntu/focal.dockerfile      |   1 +
 config/Tools.mk.in                            |   2 -
 m4/systemd.m4                                 |  23 +-
 tools/config.h.in                             |   3 -
 tools/configure                               | 523 +-----------------
 8 files changed, 7 insertions(+), 548 deletions(-)

diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
index d974a1434fd5..a350b53ad8e2 100644
--- a/automation/build/archlinux/current.dockerfile
+++ b/automation/build/archlinux/current.dockerfile
@@ -39,6 +39,7 @@ RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
         sdl2 \
         spice \
         spice-protocol \
+        # systemd for Xen < 4.19
         systemd \
         transfig \
         usbredir \
diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index e1ec38a41445..0483d9826d7d 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -61,6 +61,7 @@ RUN zypper install -y --no-recommends \
         'pkgconfig(sdl2)' \
         python3-devel \
         python3-setuptools \
+        # systemd-devel for Xen < 4.19
         systemd-devel \
         tar \
         transfig \
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index f00e03eda7b1..59b168e717b2 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -62,6 +62,7 @@ RUN zypper install -y --no-recommends \
         'pkgconfig(sdl2)' \
         python3-devel \
         python3-setuptools \
+        # systemd-devel for Xen < 4.19
         systemd-devel \
         tar \
         transfig \
diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
index 30a9b8e84ffe..8171347c4656 100644
--- a/automation/build/ubuntu/focal.dockerfile
+++ b/automation/build/ubuntu/focal.dockerfile
@@ -36,6 +36,7 @@ RUN apt-get update && \
         libnl-3-dev \
         ocaml-nox \
         libfindlib-ocaml-dev \
+        # libsystemd-dev for Xen < 4.19
         libsystemd-dev \
         transfig \
         pandoc \
diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index b54ab21f966b..50fbef841f3f 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -52,8 +52,6 @@ CONFIG_PYGRUB       := @pygrub@
 CONFIG_LIBFSIMAGE   := @libfsimage@
 
 CONFIG_SYSTEMD      := @systemd@
-SYSTEMD_CFLAGS      := @SYSTEMD_CFLAGS@
-SYSTEMD_LIBS        := @SYSTEMD_LIBS@
 XEN_SYSTEMD_DIR     := @SYSTEMD_DIR@
 XEN_SYSTEMD_MODULES_LOAD := @SYSTEMD_MODULES_LOAD@
 CONFIG_9PFS         := @ninepfs@
diff --git a/m4/systemd.m4 b/m4/systemd.m4
index 112dc11b5e05..aa1ebe94f56c 100644
--- a/m4/systemd.m4
+++ b/m4/systemd.m4
@@ -41,15 +41,6 @@ AC_DEFUN([AX_ALLOW_SYSTEMD_OPTS], [
 ])
 
 AC_DEFUN([AX_CHECK_SYSTEMD_LIBS], [
-	PKG_CHECK_MODULES([SYSTEMD], [libsystemd-daemon],,
-		[PKG_CHECK_MODULES([SYSTEMD], [libsystemd >= 209])]
-        )
-	dnl pkg-config older than 0.24 does not set these for
-	dnl PKG_CHECK_MODULES() worth also noting is that as of version 208
-	dnl of systemd pkg-config --cflags currently yields no extra flags yet.
-	AC_SUBST([SYSTEMD_CFLAGS])
-	AC_SUBST([SYSTEMD_LIBS])
-
 	AS_IF([test "x$SYSTEMD_DIR" = x], [
 	    dnl In order to use the line below we need to fix upstream systemd
 	    dnl to properly ${prefix} for child variables in
@@ -83,23 +74,11 @@ AC_DEFUN([AX_CHECK_SYSTEMD_LIBS], [
 AC_DEFUN([AX_CHECK_SYSTEMD], [
 	dnl Respect user override to disable
 	AS_IF([test "x$enable_systemd" != "xno"], [
-	     AS_IF([test "x$systemd" = "xy" ], [
-		AC_DEFINE([HAVE_SYSTEMD], [1], [Systemd available and enabled])
-			systemd=y
-			AX_CHECK_SYSTEMD_LIBS()
-	    ],[
-		AS_IF([test "x$enable_systemd" = "xyes"],
-			[AC_MSG_ERROR([Unable to find systemd development library])],
-			[systemd=n])
-	    ])
+	systemd=y
 	],[systemd=n])
 ])
 
 AC_DEFUN([AX_CHECK_SYSTEMD_ENABLE_AVAILABLE], [
-	PKG_CHECK_MODULES([SYSTEMD], [libsystemd-daemon], [systemd="y"],[
-		PKG_CHECK_MODULES([SYSTEMD], [libsystemd >= 209],
-				  [systemd="y"],[systemd="n"])
-	])
 ])
 
 dnl Enables systemd by default and requires a --disable-systemd option flag
diff --git a/tools/config.h.in b/tools/config.h.in
index 0bb2fe08a143..56ac7800032f 100644
--- a/tools/config.h.in
+++ b/tools/config.h.in
@@ -60,9 +60,6 @@
 /* Define to 1 if you have the <string.h> header file. */
 #undef HAVE_STRING_H
 
-/* Systemd available and enabled */
-#undef HAVE_SYSTEMD
-
 /* Define to 1 if you have the <sys/eventfd.h> header file. */
 #undef HAVE_SYS_EVENTFD_H
 
diff --git a/tools/configure b/tools/configure
index 3d557234b319..b0873a5601a7 100755
--- a/tools/configure
+++ b/tools/configure
@@ -626,8 +626,6 @@ ac_subst_vars='LTLIBOBJS
 LIBOBJS
 pvshim
 ninepfs
-SYSTEMD_LIBS
-SYSTEMD_CFLAGS
 SYSTEMD_MODULES_LOAD
 SYSTEMD_DIR
 systemd
@@ -864,9 +862,7 @@ pixman_LIBS
 libzstd_CFLAGS
 libzstd_LIBS
 LIBNL3_CFLAGS
-LIBNL3_LIBS
-SYSTEMD_CFLAGS
-SYSTEMD_LIBS'
+LIBNL3_LIBS'
 
 
 # Initialize some variables set by options.
@@ -1621,10 +1617,6 @@ Some influential environment variables:
   LIBNL3_CFLAGS
               C compiler flags for LIBNL3, overriding pkg-config
   LIBNL3_LIBS linker flags for LIBNL3, overriding pkg-config
-  SYSTEMD_CFLAGS
-              C compiler flags for SYSTEMD, overriding pkg-config
-  SYSTEMD_LIBS
-              linker flags for SYSTEMD, overriding pkg-config
 
 Use these variables to override the choices made by `configure' or to help
 it to find libraries and programs with nonstandard names/locations.
@@ -9541,521 +9533,10 @@ fi
 
 
 
-pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
-$as_echo_n "checking for SYSTEMD... " >&6; }
-
-if test -n "$SYSTEMD_CFLAGS"; then
-    pkg_cv_SYSTEMD_CFLAGS="$SYSTEMD_CFLAGS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd-daemon\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd-daemon") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_CFLAGS=`$PKG_CONFIG --cflags "libsystemd-daemon" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-if test -n "$SYSTEMD_LIBS"; then
-    pkg_cv_SYSTEMD_LIBS="$SYSTEMD_LIBS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd-daemon\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd-daemon") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_LIBS=`$PKG_CONFIG --libs "libsystemd-daemon" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-
-
-
-if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-
-if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
-        _pkg_short_errors_supported=yes
-else
-        _pkg_short_errors_supported=no
-fi
-        if test $_pkg_short_errors_supported = yes; then
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "libsystemd-daemon" 2>&1`
-        else
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "libsystemd-daemon" 2>&1`
-        fi
-	# Put the nasty error message in config.log where it belongs
-	echo "$SYSTEMD_PKG_ERRORS" >&5
-
-
-
-pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
-$as_echo_n "checking for SYSTEMD... " >&6; }
-
-if test -n "$SYSTEMD_CFLAGS"; then
-    pkg_cv_SYSTEMD_CFLAGS="$SYSTEMD_CFLAGS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_CFLAGS=`$PKG_CONFIG --cflags "libsystemd >= 209" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-if test -n "$SYSTEMD_LIBS"; then
-    pkg_cv_SYSTEMD_LIBS="$SYSTEMD_LIBS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_LIBS=`$PKG_CONFIG --libs "libsystemd >= 209" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-
-
-
-if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-
-if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
-        _pkg_short_errors_supported=yes
-else
-        _pkg_short_errors_supported=no
-fi
-        if test $_pkg_short_errors_supported = yes; then
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "libsystemd >= 209" 2>&1`
-        else
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "libsystemd >= 209" 2>&1`
-        fi
-	# Put the nasty error message in config.log where it belongs
-	echo "$SYSTEMD_PKG_ERRORS" >&5
-
-	systemd="n"
-elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-	systemd="n"
-else
-	SYSTEMD_CFLAGS=$pkg_cv_SYSTEMD_CFLAGS
-	SYSTEMD_LIBS=$pkg_cv_SYSTEMD_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
-	systemd="y"
-fi
-
-elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-
-
-pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
-$as_echo_n "checking for SYSTEMD... " >&6; }
-
-if test -n "$SYSTEMD_CFLAGS"; then
-    pkg_cv_SYSTEMD_CFLAGS="$SYSTEMD_CFLAGS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_CFLAGS=`$PKG_CONFIG --cflags "libsystemd >= 209" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-if test -n "$SYSTEMD_LIBS"; then
-    pkg_cv_SYSTEMD_LIBS="$SYSTEMD_LIBS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_LIBS=`$PKG_CONFIG --libs "libsystemd >= 209" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-
-
-
-if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-
-if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
-        _pkg_short_errors_supported=yes
-else
-        _pkg_short_errors_supported=no
-fi
-        if test $_pkg_short_errors_supported = yes; then
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "libsystemd >= 209" 2>&1`
-        else
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "libsystemd >= 209" 2>&1`
-        fi
-	# Put the nasty error message in config.log where it belongs
-	echo "$SYSTEMD_PKG_ERRORS" >&5
-
-	systemd="n"
-elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-	systemd="n"
-else
-	SYSTEMD_CFLAGS=$pkg_cv_SYSTEMD_CFLAGS
-	SYSTEMD_LIBS=$pkg_cv_SYSTEMD_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
-	systemd="y"
-fi
-
-else
-	SYSTEMD_CFLAGS=$pkg_cv_SYSTEMD_CFLAGS
-	SYSTEMD_LIBS=$pkg_cv_SYSTEMD_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
-	systemd="y"
-fi
-
 
 		if test "x$enable_systemd" != "xno"; then :
 
-	     if test "x$systemd" = "xy" ; then :
-
-
-$as_echo "#define HAVE_SYSTEMD 1" >>confdefs.h
-
-			systemd=y
-
-
-pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
-$as_echo_n "checking for SYSTEMD... " >&6; }
-
-if test -n "$SYSTEMD_CFLAGS"; then
-    pkg_cv_SYSTEMD_CFLAGS="$SYSTEMD_CFLAGS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd-daemon\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd-daemon") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_CFLAGS=`$PKG_CONFIG --cflags "libsystemd-daemon" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-if test -n "$SYSTEMD_LIBS"; then
-    pkg_cv_SYSTEMD_LIBS="$SYSTEMD_LIBS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd-daemon\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd-daemon") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_LIBS=`$PKG_CONFIG --libs "libsystemd-daemon" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-
-
-
-if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-
-if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
-        _pkg_short_errors_supported=yes
-else
-        _pkg_short_errors_supported=no
-fi
-        if test $_pkg_short_errors_supported = yes; then
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "libsystemd-daemon" 2>&1`
-        else
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "libsystemd-daemon" 2>&1`
-        fi
-	# Put the nasty error message in config.log where it belongs
-	echo "$SYSTEMD_PKG_ERRORS" >&5
-
-
-pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
-$as_echo_n "checking for SYSTEMD... " >&6; }
-
-if test -n "$SYSTEMD_CFLAGS"; then
-    pkg_cv_SYSTEMD_CFLAGS="$SYSTEMD_CFLAGS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_CFLAGS=`$PKG_CONFIG --cflags "libsystemd >= 209" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-if test -n "$SYSTEMD_LIBS"; then
-    pkg_cv_SYSTEMD_LIBS="$SYSTEMD_LIBS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_LIBS=`$PKG_CONFIG --libs "libsystemd >= 209" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-
-
-
-if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-
-if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
-        _pkg_short_errors_supported=yes
-else
-        _pkg_short_errors_supported=no
-fi
-        if test $_pkg_short_errors_supported = yes; then
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "libsystemd >= 209" 2>&1`
-        else
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "libsystemd >= 209" 2>&1`
-        fi
-	# Put the nasty error message in config.log where it belongs
-	echo "$SYSTEMD_PKG_ERRORS" >&5
-
-	as_fn_error $? "Package requirements (libsystemd >= 209) were not met:
-
-$SYSTEMD_PKG_ERRORS
-
-Consider adjusting the PKG_CONFIG_PATH environment variable if you
-installed software in a non-standard prefix.
-
-Alternatively, you may set the environment variables SYSTEMD_CFLAGS
-and SYSTEMD_LIBS to avoid the need to call pkg-config.
-See the pkg-config man page for more details." "$LINENO" 5
-elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-	{ { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
-as_fn_error $? "The pkg-config script could not be found or is too old.  Make sure it
-is in your PATH or set the PKG_CONFIG environment variable to the full
-path to pkg-config.
-
-Alternatively, you may set the environment variables SYSTEMD_CFLAGS
-and SYSTEMD_LIBS to avoid the need to call pkg-config.
-See the pkg-config man page for more details.
-
-To get pkg-config, see <http://pkg-config.freedesktop.org/>.
-See \`config.log' for more details" "$LINENO" 5; }
-else
-	SYSTEMD_CFLAGS=$pkg_cv_SYSTEMD_CFLAGS
-	SYSTEMD_LIBS=$pkg_cv_SYSTEMD_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
-
-fi
-
-elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-
-pkg_failed=no
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for SYSTEMD" >&5
-$as_echo_n "checking for SYSTEMD... " >&6; }
-
-if test -n "$SYSTEMD_CFLAGS"; then
-    pkg_cv_SYSTEMD_CFLAGS="$SYSTEMD_CFLAGS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_CFLAGS=`$PKG_CONFIG --cflags "libsystemd >= 209" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-if test -n "$SYSTEMD_LIBS"; then
-    pkg_cv_SYSTEMD_LIBS="$SYSTEMD_LIBS"
- elif test -n "$PKG_CONFIG"; then
-    if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libsystemd >= 209\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libsystemd >= 209") 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; then
-  pkg_cv_SYSTEMD_LIBS=`$PKG_CONFIG --libs "libsystemd >= 209" 2>/dev/null`
-		      test "x$?" != "x0" && pkg_failed=yes
-else
-  pkg_failed=yes
-fi
- else
-    pkg_failed=untried
-fi
-
-
-
-if test $pkg_failed = yes; then
-   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-
-if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
-        _pkg_short_errors_supported=yes
-else
-        _pkg_short_errors_supported=no
-fi
-        if test $_pkg_short_errors_supported = yes; then
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "libsystemd >= 209" 2>&1`
-        else
-	        SYSTEMD_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "libsystemd >= 209" 2>&1`
-        fi
-	# Put the nasty error message in config.log where it belongs
-	echo "$SYSTEMD_PKG_ERRORS" >&5
-
-	as_fn_error $? "Package requirements (libsystemd >= 209) were not met:
-
-$SYSTEMD_PKG_ERRORS
-
-Consider adjusting the PKG_CONFIG_PATH environment variable if you
-installed software in a non-standard prefix.
-
-Alternatively, you may set the environment variables SYSTEMD_CFLAGS
-and SYSTEMD_LIBS to avoid the need to call pkg-config.
-See the pkg-config man page for more details." "$LINENO" 5
-elif test $pkg_failed = untried; then
-     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-	{ { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
-as_fn_error $? "The pkg-config script could not be found or is too old.  Make sure it
-is in your PATH or set the PKG_CONFIG environment variable to the full
-path to pkg-config.
-
-Alternatively, you may set the environment variables SYSTEMD_CFLAGS
-and SYSTEMD_LIBS to avoid the need to call pkg-config.
-See the pkg-config man page for more details.
-
-To get pkg-config, see <http://pkg-config.freedesktop.org/>.
-See \`config.log' for more details" "$LINENO" 5; }
-else
-	SYSTEMD_CFLAGS=$pkg_cv_SYSTEMD_CFLAGS
-	SYSTEMD_LIBS=$pkg_cv_SYSTEMD_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
-
-fi
-
-else
-	SYSTEMD_CFLAGS=$pkg_cv_SYSTEMD_CFLAGS
-	SYSTEMD_LIBS=$pkg_cv_SYSTEMD_LIBS
-        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-$as_echo "yes" >&6; }
-
-fi
-
-
-
-	if test "x$SYSTEMD_DIR" = x; then :
-
-	    	    	    	    	    	    	    	    	    	    	    	    	    SYSTEMD_DIR="\$(prefix)/lib/systemd/system/"
-
-fi
-
-	if test "x$SYSTEMD_DIR" = x; then :
-
-	    as_fn_error $? "SYSTEMD_DIR is unset" "$LINENO" 5
-
-fi
-
-		if test "x$SYSTEMD_MODULES_LOAD" = x; then :
-
-	    SYSTEMD_MODULES_LOAD="\$(prefix)/lib/modules-load.d/"
-
-fi
-
-	if test "x$SYSTEMD_MODULES_LOAD" = x; then :
-
-	    as_fn_error $? "SYSTEMD_MODULES_LOAD is unset" "$LINENO" 5
-
-fi
-
-
-else
-
-		if test "x$enable_systemd" = "xyes"; then :
-  as_fn_error $? "Unable to find systemd development library" "$LINENO" 5
-else
-  systemd=n
-fi
-
-fi
+	systemd=y
 
 else
   systemd=n
-- 
2.30.2


