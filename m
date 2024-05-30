Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DAE8D4962
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 12:15:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732626.1138638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCco4-0003Zc-6B; Thu, 30 May 2024 10:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732626.1138638; Thu, 30 May 2024 10:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCco4-0003Y4-2u; Thu, 30 May 2024 10:14:48 +0000
Received: by outflank-mailman (input) for mailman id 732626;
 Thu, 30 May 2024 10:14:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8pxM=NB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCco2-0003XJ-9A
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 10:14:46 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fee0bac-1e6d-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 12:14:45 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57a033c2ed4so358272a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 03:14:45 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-578524bc547sm9655170a12.96.2024.05.30.03.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 03:14:44 -0700 (PDT)
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
X-Inumbo-ID: 6fee0bac-1e6d-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717064084; x=1717668884; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tTfIIWc+srFYonFV65OGtACpB5k1PlG9WcTO4urHy48=;
        b=MA4+UFBj+s7jmKx2vOw8fCZm7oWHRetjw6et/S9VeVyRLUGDpR3laDpHmZbCS5izDo
         VDNlqMxw1P5V/XqBJfrow5FieM01vthBPMt4pbWR9YyME53pafjcu08YMdxz6znf2xTB
         rBSkPHUwwHexSn8N4WgbJs3WYBvSVMyWh84GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717064084; x=1717668884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tTfIIWc+srFYonFV65OGtACpB5k1PlG9WcTO4urHy48=;
        b=gV0kixXBRSoTDOiVuWroa5642zGHWnWlkXqSW45vbwbyseRUuaAF5+vQI6ZjabSITN
         w//MpErtPUKDE2PPK/6uOKJ8L5X9Ra74tGZ3uOs1rWNYm8u3j8mndW8nzBcMuI5g66XX
         EDquCnBXd4c17KjLsqjv1nENT2wVohqTHUAX9F4TXkBhWoB4p8XrGgFvzs+VmFi/EGeF
         yTNRV17EhQlknSUvktyBy0O/i2P6cfN06W/T6xW0Al5HT/LOWZp7HZzTpiu3r9S/st3l
         NoI087VCBhuB5I7EPi2SsvrAoeR/UKlnRjAbsgPsQz3fS26bda4zF9n3ASLtHFNTZwU4
         jl+A==
X-Gm-Message-State: AOJu0YwU3MyyA8tY4kPcyf7mkPnXgujIOjp8fdoVVkIwbWpGHW1kgLM/
	N8NneMlaPL+bu/YWpdEhsUtw5zpnOtXqiZ5JNwcwGp2ozwjma1r5BAlIdOsGQkV+Km5/O5kI9zp
	aTnA=
X-Google-Smtp-Source: AGHT+IFVXhseUmJR3bV1SH3Zn0hZ9L628OT9ocnmo1k6r49pZduu4EhkKgafMhmeA+VALegv1zYZEg==
X-Received: by 2002:a50:d6d4:0:b0:574:eb0f:df9b with SMTP id 4fb4d7f45d1cf-57a17833cb5mr1503255a12.14.1717064084283;
        Thu, 30 May 2024 03:14:44 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] tools: (Actually) drop libsystemd as a dependency
Date: Thu, 30 May 2024 11:14:39 +0100
Message-Id: <20240530101439.16730-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When reinstating some of systemd.m4 between v1 and v2, I reintroduced a little
too much.  While {c,o}xenstored are indeed no longer linked against
libsystemd, ./configure still looks for it.

Drop this too.

Fixes: ae26101f6bfc ("tools: Drop libsystemd as a dependency")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony@xenproject.org>
CC: Juergen Gross <jgross@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

Found when trying to build Xen in XenServer with libsystemd absent from the
chroot.
---
 m4/systemd.m4   |   8 --
 tools/configure | 229 +-----------------------------------------------
 2 files changed, 1 insertion(+), 236 deletions(-)

diff --git a/m4/systemd.m4 b/m4/systemd.m4
index e4fe51a8ba..ab12ea313d 100644
--- a/m4/systemd.m4
+++ b/m4/systemd.m4
@@ -86,13 +86,6 @@ AC_DEFUN([AX_CHECK_SYSTEMD], [
 	],[systemd=n])
 ])
 
-AC_DEFUN([AX_CHECK_SYSTEMD_ENABLE_AVAILABLE], [
-	PKG_CHECK_MODULES([SYSTEMD], [libsystemd-daemon], [systemd="y"],[
-		PKG_CHECK_MODULES([SYSTEMD], [libsystemd >= 209],
-				  [systemd="y"],[systemd="n"])
-	])
-])
-
 dnl Enables systemd by default and requires a --disable-systemd option flag
 dnl to configure if you want to disable.
 AC_DEFUN([AX_ENABLE_SYSTEMD], [
@@ -112,6 +105,5 @@ dnl to have systemd build libraries it will be enabled. You can always force
 dnl disable with --disable-systemd
 AC_DEFUN([AX_AVAILABLE_SYSTEMD], [
 	AX_ALLOW_SYSTEMD_OPTS()
-	AX_CHECK_SYSTEMD_ENABLE_AVAILABLE()
 	AX_CHECK_SYSTEMD()
 ])
diff --git a/tools/configure b/tools/configure
index b8faa1d520..459bfb5652 100755
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
@@ -3889,8 +3881,6 @@ esac
 
 
 
-
-
 
 
 
@@ -9540,223 +9530,6 @@ fi
 
 
 
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
-
 		if test "x$enable_systemd" != "xno"; then :
 
 	     if test "x$systemd" = "xy" ; then :
-- 
2.34.1


