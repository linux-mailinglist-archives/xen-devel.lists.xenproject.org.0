Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B4FB1EAD5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 16:56:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074666.1437183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOVu-0000gD-Qp; Fri, 08 Aug 2025 14:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074666.1437183; Fri, 08 Aug 2025 14:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOVu-0000YX-LB; Fri, 08 Aug 2025 14:56:10 +0000
Received: by outflank-mailman (input) for mailman id 1074666;
 Fri, 08 Aug 2025 14:56:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ukOVt-00008B-7a
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 14:56:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOVt-007zrT-0F;
 Fri, 08 Aug 2025 14:56:09 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOVs-009BYT-2d;
 Fri, 08 Aug 2025 14:56:09 +0000
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
	bh=xVf4OX8RTJY7OuVusTIEIHCb9A67uli5402HnQS/1A4=; b=PAp8+tUObouyoV7Q3feKgOs4KJ
	bI6VKXuLkaKAth9yVNlidl0QVptXYVvXp6M9jEd+rCn500hT4ulL17+c6+ePGRWl2MLLguOfReHEI
	wacDlYTQhUhnAqYQpdfkpSKv/Y8hWO9yNXyvyMyHEMjUF9yaH559udyf/skXqsUAGOYI=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 04/11] tools/configure: Introduce deps on json-c lib for libxl
Date: Fri,  8 Aug 2025 16:55:55 +0200
Message-Id: <20250808145602.41716-5-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808145602.41716-1-anthony@xenproject.org>
References: <20250808145602.41716-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

To replace yajl.

Introduce YAJL_LIBS variable, to be able to remove "-lyajl" later.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 config/Tools.mk.in        |   2 +
 tools/config.h.in         |   3 ++
 tools/configure           | 107 +++++++++++++++++++++++++++++++++++++-
 tools/configure.ac        |   6 ++-
 tools/libs/light/Makefile |   5 +-
 tools/xl/Makefile         |   2 +-
 6 files changed, 119 insertions(+), 6 deletions(-)

diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index e47ac23d11..c2201021d1 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -65,6 +65,8 @@ EXTFS_LIBS          := @EXTFS_LIBS@
 CURSES_LIBS         := @CURSES_LIBS@
 TINFO_LIBS          := @TINFO_LIBS@
 ARGP_LDFLAGS        := @argp_ldflags@
+LIBJSONC_LIBS       := @libjsonc_LIBS@
+YAJL_LIBS           := @YAJL_LIBS@
 
 FILE_OFFSET_BITS    := @FILE_OFFSET_BITS@
 
diff --git a/tools/config.h.in b/tools/config.h.in
index fe2a94cfc4..ed0042018d 100644
--- a/tools/config.h.in
+++ b/tools/config.h.in
@@ -27,6 +27,9 @@
 /* Define to 1 if you have the `fdt' library (-lfdt). */
 #undef HAVE_LIBFDT
 
+/* Use library json-c */
+#undef HAVE_LIBJSONC
+
 /* Define to 1 if you have the `lzma' library (-llzma). */
 #undef HAVE_LIBLZMA
 
diff --git a/tools/configure b/tools/configure
index 5abd44e21e..edd1701b2d 100755
--- a/tools/configure
+++ b/tools/configure
@@ -660,6 +660,9 @@ libnl
 LIBNL3_LIBS
 LIBNL3_CFLAGS
 argp_ldflags
+YAJL_LIBS
+libjsonc_LIBS
+libjsonc_CFLAGS
 PTHREAD_LIBS
 PTHREAD_LDFLAGS
 PTHREAD_CFLAGS
@@ -882,6 +885,8 @@ pixman_CFLAGS
 pixman_LIBS
 libzstd_CFLAGS
 libzstd_LIBS
+libjsonc_CFLAGS
+libjsonc_LIBS
 LIBNL3_CFLAGS
 LIBNL3_LIBS
 SYSTEMD_SLEEP_DIR'
@@ -1633,6 +1638,10 @@ Some influential environment variables:
               C compiler flags for libzstd, overriding pkg-config
   libzstd_LIBS
               linker flags for libzstd, overriding pkg-config
+  libjsonc_CFLAGS
+              C compiler flags for libjsonc, overriding pkg-config
+  libjsonc_LIBS
+              linker flags for libjsonc, overriding pkg-config
   LIBNL3_CFLAGS
               C compiler flags for LIBNL3, overriding pkg-config
   LIBNL3_LIBS linker flags for LIBNL3, overriding pkg-config
@@ -9624,6 +9633,99 @@ printf "%s\n" "$ax_cv_pthread_flags" >&6; }
 
 
 
+
+pkg_failed=no
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for libjsonc" >&5
+printf %s "checking for libjsonc... " >&6; }
+
+if test -n "$libjsonc_CFLAGS"; then
+    pkg_cv_libjsonc_CFLAGS="$libjsonc_CFLAGS"
+ elif test -n "$PKG_CONFIG"; then
+    if test -n "$PKG_CONFIG" && \
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"json-c\""; } >&5
+  ($PKG_CONFIG --exists --print-errors "json-c") 2>&5
+  ac_status=$?
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  test $ac_status = 0; }; then
+  pkg_cv_libjsonc_CFLAGS=`$PKG_CONFIG --cflags "json-c" 2>/dev/null`
+		      test "x$?" != "x0" && pkg_failed=yes
+else
+  pkg_failed=yes
+fi
+ else
+    pkg_failed=untried
+fi
+if test -n "$libjsonc_LIBS"; then
+    pkg_cv_libjsonc_LIBS="$libjsonc_LIBS"
+ elif test -n "$PKG_CONFIG"; then
+    if test -n "$PKG_CONFIG" && \
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"json-c\""; } >&5
+  ($PKG_CONFIG --exists --print-errors "json-c") 2>&5
+  ac_status=$?
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  test $ac_status = 0; }; then
+  pkg_cv_libjsonc_LIBS=`$PKG_CONFIG --libs "json-c" 2>/dev/null`
+		      test "x$?" != "x0" && pkg_failed=yes
+else
+  pkg_failed=yes
+fi
+ else
+    pkg_failed=untried
+fi
+
+
+
+if test $pkg_failed = yes; then
+   	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
+
+if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
+        _pkg_short_errors_supported=yes
+else
+        _pkg_short_errors_supported=no
+fi
+        if test $_pkg_short_errors_supported = yes; then
+	        libjsonc_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "json-c" 2>&1`
+        else
+	        libjsonc_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "json-c" 2>&1`
+        fi
+	# Put the nasty error message in config.log where it belongs
+	echo "$libjsonc_PKG_ERRORS" >&5
+
+	as_fn_error $? "Package requirements (json-c) were not met:
+
+$libjsonc_PKG_ERRORS
+
+Consider adjusting the PKG_CONFIG_PATH environment variable if you
+installed software in a non-standard prefix.
+
+Alternatively, you may set the environment variables libjsonc_CFLAGS
+and libjsonc_LIBS to avoid the need to call pkg-config.
+See the pkg-config man page for more details." "$LINENO" 5
+elif test $pkg_failed = untried; then
+     	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
+	{ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
+as_fn_error $? "The pkg-config script could not be found or is too old.  Make sure it
+is in your PATH or set the PKG_CONFIG environment variable to the full
+path to pkg-config.
+
+Alternatively, you may set the environment variables libjsonc_CFLAGS
+and libjsonc_LIBS to avoid the need to call pkg-config.
+See the pkg-config man page for more details.
+
+To get pkg-config, see <http://pkg-config.freedesktop.org/>.
+See \`config.log' for more details" "$LINENO" 5; }
+else
+	libjsonc_CFLAGS=$pkg_cv_libjsonc_CFLAGS
+	libjsonc_LIBS=$pkg_cv_libjsonc_LIBS
+        { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+printf "%s\n" "yes" >&6; }
+
+printf "%s\n" "#define HAVE_LIBJSONC 1" >>confdefs.h
+
+fi
 { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for yajl_alloc in -lyajl" >&5
 printf %s "checking for yajl_alloc in -lyajl... " >&6; }
 if test ${ac_cv_lib_yajl_yajl_alloc+y}
@@ -9661,9 +9763,10 @@ fi
 printf "%s\n" "$ac_cv_lib_yajl_yajl_alloc" >&6; }
 if test "x$ac_cv_lib_yajl_yajl_alloc" = xyes
 then :
-  printf "%s\n" "#define HAVE_LIBYAJL 1" >>confdefs.h
+  YAJL_LIBS=-lyajl
 
-  LIBS="-lyajl $LIBS"
+
+printf "%s\n" "#define HAVE_LIBYAJL 1" >>confdefs.h
 
 else $as_nop
   as_fn_error $? "Could not find yajl" "$LINENO" 5
diff --git a/tools/configure.ac b/tools/configure.ac
index dada1c3b15..bb40b5b3f0 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -424,7 +424,11 @@ AC_SUBST([ZLIB_CFLAGS])
 AC_SUBST([ZLIB_LIBS])
 AX_CHECK_EXTFS
 AX_CHECK_PTHREAD
-AC_CHECK_LIB([yajl], [yajl_alloc], [],
+PKG_CHECK_MODULES([libjsonc], [json-c],
+    [AC_DEFINE([HAVE_LIBJSONC], [1], [Use library json-c])])
+AC_CHECK_LIB([yajl], [yajl_alloc],
+   [AC_SUBST([YAJL_LIBS],[-lyajl])
+    AC_DEFINE([HAVE_LIBYAJL],[1],[Define to 1 if you have the `yajl' library (-lyajl).])],
     [AC_MSG_ERROR([Could not find yajl])])
 AC_CHECK_LIB([z], [deflateCopy], [], [AC_MSG_ERROR([Could not find zlib])])
 AC_CHECK_HEADER([argp.h], [
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index b690d92159..fa2a338c2b 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -166,7 +166,8 @@ LDLIBS-$(CONFIG_Linux) += -luuid
 LDLIBS-$(CONFIG_Linux) += -lrt
 LDLIBS-$(CONFIG_ARM) += -lfdt
 LDLIBS-y += $(PTHREAD_LIBS)
-LDLIBS-y += -lyajl
+LDLIBS-y += $(YAJL_LIBS)
+LDLIBS-y += $(LIBJSONC_LIBS)
 LDLIBS += $(LDLIBS-y)
 
 $(OBJS-y) $(PIC_OBJS) $(LIBXL_TEST_OBJS): CFLAGS += $(CFLAGS_LIBXL) -include $(XEN_ROOT)/tools/config.h
@@ -246,7 +247,7 @@ libxenlight_test.so: $(PIC_OBJS) $(LIBXL_TEST_OBJS)
 	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenlight.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LDLIBS) $(APPEND_LDFLAGS)
 
 test_%: test_%.o test_common.o libxenlight_test.so
-	$(CC) $(LDFLAGS) -o $@ $^ $(filter-out %libxenlight.so, $(LDLIBS_libxenlight)) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) -lyajl $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $^ $(filter-out %libxenlight.so, $(LDLIBS_libxenlight)) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) $(YAJL_LIBS) $(LIBJSONC_LIBS) $(APPEND_LDFLAGS)
 
 libxl-save-helper: $(SAVE_HELPER_OBJS) libxenlight.so
 	$(CC) $(LDFLAGS) -o $@ $(SAVE_HELPER_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index ad577cdd70..ff7a5aee94 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -33,7 +33,7 @@ $(XL_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h # libxl_json.h needs i
 all: xl
 
 xl: $(XL_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) -lyajl $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(YAJL_LIBS) $(LIBJSONC_LIBS) $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
-- 
Anthony PERARD


