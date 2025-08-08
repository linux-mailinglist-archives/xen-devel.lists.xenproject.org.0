Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA5BB1EAF3
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 17:00:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074700.1437245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOaG-00066k-Vc; Fri, 08 Aug 2025 15:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074700.1437245; Fri, 08 Aug 2025 15:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOaG-00065E-SF; Fri, 08 Aug 2025 15:00:40 +0000
Received: by outflank-mailman (input) for mailman id 1074700;
 Fri, 08 Aug 2025 15:00:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ukOaG-00064e-8n
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 15:00:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOaG-00800R-0c;
 Fri, 08 Aug 2025 15:00:40 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOVx-009BYT-2n;
 Fri, 08 Aug 2025 14:56:14 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=9LmUJ4zuB4olL3YoOObx5zrJYD33c+ZXbGLTgVb/atI=; b=4l+P6WMM1+cZLcw5pbkvqZMpgi
	d/gUyDA88izucPA6REXG8q0Zwv4vJmYH1xyHevK2wDhjM+zmqukNG504BRDEuwSspYKR6mBORIGyx
	KKQKechLTjeE9NnIw5fvpu/NSSgRrQWF4d2cGu8VdYs8x9DCALPV4QV99dgKdQY8x1Ws=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Subject: [XEN PATCH 10/11] configure: Use json-c by default, fallback to yajl
Date: Fri,  8 Aug 2025 16:56:01 +0200
Message-Id: <20250808145602.41716-11-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808145602.41716-1-anthony@xenproject.org>
References: <20250808145602.41716-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/configure    | 97 +++++++++++++++++++++++++++++-----------------
 tools/configure.ac | 12 +++---
 2 files changed, 69 insertions(+), 40 deletions(-)

diff --git a/tools/configure b/tools/configure
index edd1701b2d..0eb7a0ab6a 100755
--- a/tools/configure
+++ b/tools/configure
@@ -9692,41 +9692,7 @@ fi
 	# Put the nasty error message in config.log where it belongs
 	echo "$libjsonc_PKG_ERRORS" >&5
 
-	as_fn_error $? "Package requirements (json-c) were not met:
-
-$libjsonc_PKG_ERRORS
-
-Consider adjusting the PKG_CONFIG_PATH environment variable if you
-installed software in a non-standard prefix.
-
-Alternatively, you may set the environment variables libjsonc_CFLAGS
-and libjsonc_LIBS to avoid the need to call pkg-config.
-See the pkg-config man page for more details." "$LINENO" 5
-elif test $pkg_failed = untried; then
-     	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
-printf "%s\n" "no" >&6; }
-	{ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
-as_fn_error $? "The pkg-config script could not be found or is too old.  Make sure it
-is in your PATH or set the PKG_CONFIG environment variable to the full
-path to pkg-config.
-
-Alternatively, you may set the environment variables libjsonc_CFLAGS
-and libjsonc_LIBS to avoid the need to call pkg-config.
-See the pkg-config man page for more details.
-
-To get pkg-config, see <http://pkg-config.freedesktop.org/>.
-See \`config.log' for more details" "$LINENO" 5; }
-else
-	libjsonc_CFLAGS=$pkg_cv_libjsonc_CFLAGS
-	libjsonc_LIBS=$pkg_cv_libjsonc_LIBS
-        { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
-printf "%s\n" "yes" >&6; }
-
-printf "%s\n" "#define HAVE_LIBJSONC 1" >>confdefs.h
-
-fi
-{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for yajl_alloc in -lyajl" >&5
+	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for yajl_alloc in -lyajl" >&5
 printf %s "checking for yajl_alloc in -lyajl... " >&6; }
 if test ${ac_cv_lib_yajl_yajl_alloc+y}
 then :
@@ -9772,6 +9738,67 @@ else $as_nop
   as_fn_error $? "Could not find yajl" "$LINENO" 5
 fi
 
+
+elif test $pkg_failed = untried; then
+     	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
+	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for yajl_alloc in -lyajl" >&5
+printf %s "checking for yajl_alloc in -lyajl... " >&6; }
+if test ${ac_cv_lib_yajl_yajl_alloc+y}
+then :
+  printf %s "(cached) " >&6
+else $as_nop
+  ac_check_lib_save_LIBS=$LIBS
+LIBS="-lyajl  $LIBS"
+cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+/* end confdefs.h.  */
+
+/* Override any GCC internal prototype to avoid an error.
+   Use char because int might match the return type of a GCC
+   builtin and then its argument prototype would still apply.  */
+char yajl_alloc ();
+int
+main (void)
+{
+return yajl_alloc ();
+  ;
+  return 0;
+}
+_ACEOF
+if ac_fn_c_try_link "$LINENO"
+then :
+  ac_cv_lib_yajl_yajl_alloc=yes
+else $as_nop
+  ac_cv_lib_yajl_yajl_alloc=no
+fi
+rm -f core conftest.err conftest.$ac_objext conftest.beam \
+    conftest$ac_exeext conftest.$ac_ext
+LIBS=$ac_check_lib_save_LIBS
+fi
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_yajl_yajl_alloc" >&5
+printf "%s\n" "$ac_cv_lib_yajl_yajl_alloc" >&6; }
+if test "x$ac_cv_lib_yajl_yajl_alloc" = xyes
+then :
+  YAJL_LIBS=-lyajl
+
+
+printf "%s\n" "#define HAVE_LIBYAJL 1" >>confdefs.h
+
+else $as_nop
+  as_fn_error $? "Could not find yajl" "$LINENO" 5
+fi
+
+
+else
+	libjsonc_CFLAGS=$pkg_cv_libjsonc_CFLAGS
+	libjsonc_LIBS=$pkg_cv_libjsonc_LIBS
+        { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+printf "%s\n" "yes" >&6; }
+
+printf "%s\n" "#define HAVE_LIBJSONC 1" >>confdefs.h
+
+fi
+
 { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for deflateCopy in -lz" >&5
 printf %s "checking for deflateCopy in -lz... " >&6; }
 if test ${ac_cv_lib_z_deflateCopy+y}
diff --git a/tools/configure.ac b/tools/configure.ac
index bb40b5b3f0..7267d02a04 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -425,11 +425,13 @@ AC_SUBST([ZLIB_LIBS])
 AX_CHECK_EXTFS
 AX_CHECK_PTHREAD
 PKG_CHECK_MODULES([libjsonc], [json-c],
-    [AC_DEFINE([HAVE_LIBJSONC], [1], [Use library json-c])])
-AC_CHECK_LIB([yajl], [yajl_alloc],
-   [AC_SUBST([YAJL_LIBS],[-lyajl])
-    AC_DEFINE([HAVE_LIBYAJL],[1],[Define to 1 if you have the `yajl' library (-lyajl).])],
-    [AC_MSG_ERROR([Could not find yajl])])
+    [AC_DEFINE([HAVE_LIBJSONC], [1], [Use library json-c])],
+    [AC_CHECK_LIB([yajl], [yajl_alloc],
+        [AC_SUBST([YAJL_LIBS],[-lyajl])
+         AC_DEFINE([HAVE_LIBYAJL],[1],[Define to 1 if you have the `yajl' library (-lyajl).])],
+        [AC_MSG_ERROR([Could not find yajl])])
+])
+
 AC_CHECK_LIB([z], [deflateCopy], [], [AC_MSG_ERROR([Could not find zlib])])
 AC_CHECK_HEADER([argp.h], [
 AC_CHECK_LIB([argp], [argp_usage], [argp_ldflags="-largp"])
-- 
Anthony PERARD


