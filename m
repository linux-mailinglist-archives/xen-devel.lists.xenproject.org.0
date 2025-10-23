Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58D8C000C6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 10:58:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148810.1480649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBr9A-0000Mi-1E; Thu, 23 Oct 2025 08:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148810.1480649; Thu, 23 Oct 2025 08:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBr99-0000Ju-U0; Thu, 23 Oct 2025 08:58:11 +0000
Received: by outflank-mailman (input) for mailman id 1148810;
 Thu, 23 Oct 2025 08:58:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vBr97-0000Jo-LV
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 08:58:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBr97-00Fo4G-0Q;
 Thu, 23 Oct 2025 08:58:09 +0000
Received: from [2a01:cb15:80df:da00:94d0:641e:16e6:ca4b] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBr96-00B5aB-31;
 Thu, 23 Oct 2025 08:58:09 +0000
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
	Message-ID:Date:Subject:Cc:To:From;
	bh=c6SRPqKmsyIJlIAnbiHatjWvff6Yy0MFaosq/o6UgTY=; b=u/X3GriWrix9yN9JCOkT7cige3
	WIYbzGW40cHgnDr2cxi4lhBig2wQp381SzcAzhRdumZKSVSdsABGqj/Zg6t/exmiJwI8C9Oms4WDC
	u9B+rTs2Qun1ojVhM2sNEKbu1Srfzz8Oa4mUn5p3bWx4Nxx6OJJxr0sARW/tQRDv8/qM=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [XEN PATCH for-4.21] tools: require at least json-c 0.15
Date: Thu, 23 Oct 2025 10:57:30 +0200
Message-ID: <20251023085730.36628-1-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

If not available, fallback to using YAJL.

The code is using json_c_visit() which was introduced in 0.13.
json_object_new_null() and json_object_new_uint64() where added to
0.14. And the last one json_object_new_array_ext() was introduced in
0.15.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/configure    | 16 ++++++++--------
 tools/configure.ac |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/configure b/tools/configure
index 0eb7a0ab6a..d460f25529 100755
--- a/tools/configure
+++ b/tools/configure
@@ -9642,12 +9642,12 @@ if test -n "$libjsonc_CFLAGS"; then
     pkg_cv_libjsonc_CFLAGS="$libjsonc_CFLAGS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"json-c\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "json-c") 2>&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"json-c >= 0.15\""; } >&5
+  ($PKG_CONFIG --exists --print-errors "json-c >= 0.15") 2>&5
   ac_status=$?
   printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
-  pkg_cv_libjsonc_CFLAGS=`$PKG_CONFIG --cflags "json-c" 2>/dev/null`
+  pkg_cv_libjsonc_CFLAGS=`$PKG_CONFIG --cflags "json-c >= 0.15" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
 else
   pkg_failed=yes
@@ -9659,12 +9659,12 @@ if test -n "$libjsonc_LIBS"; then
     pkg_cv_libjsonc_LIBS="$libjsonc_LIBS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"json-c\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "json-c") 2>&5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"json-c >= 0.15\""; } >&5
+  ($PKG_CONFIG --exists --print-errors "json-c >= 0.15") 2>&5
   ac_status=$?
   printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
-  pkg_cv_libjsonc_LIBS=`$PKG_CONFIG --libs "json-c" 2>/dev/null`
+  pkg_cv_libjsonc_LIBS=`$PKG_CONFIG --libs "json-c >= 0.15" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
 else
   pkg_failed=yes
@@ -9685,9 +9685,9 @@ else
         _pkg_short_errors_supported=no
 fi
         if test $_pkg_short_errors_supported = yes; then
-	        libjsonc_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "json-c" 2>&1`
+	        libjsonc_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "json-c >= 0.15" 2>&1`
         else
-	        libjsonc_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "json-c" 2>&1`
+	        libjsonc_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "json-c >= 0.15" 2>&1`
         fi
 	# Put the nasty error message in config.log where it belongs
 	echo "$libjsonc_PKG_ERRORS" >&5
diff --git a/tools/configure.ac b/tools/configure.ac
index 7267d02a04..285b4ea128 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -424,7 +424,7 @@ AC_SUBST([ZLIB_CFLAGS])
 AC_SUBST([ZLIB_LIBS])
 AX_CHECK_EXTFS
 AX_CHECK_PTHREAD
-PKG_CHECK_MODULES([libjsonc], [json-c],
+PKG_CHECK_MODULES([libjsonc], [json-c >= 0.15],
     [AC_DEFINE([HAVE_LIBJSONC], [1], [Use library json-c])],
     [AC_CHECK_LIB([yajl], [yajl_alloc],
         [AC_SUBST([YAJL_LIBS],[-lyajl])
-- 
Anthony PERARD


