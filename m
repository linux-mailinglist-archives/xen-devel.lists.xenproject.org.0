Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C031BA926E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 14:08:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132738.1470981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Cfi-0007SM-0T; Mon, 29 Sep 2025 12:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132738.1470981; Mon, 29 Sep 2025 12:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Cfh-0007Q9-RF; Mon, 29 Sep 2025 12:08:01 +0000
Received: by outflank-mailman (input) for mailman id 1132738;
 Mon, 29 Sep 2025 12:08:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1v3Cfg-0007Pr-4u
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 12:08:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v3Cff-00GXAu-2k;
 Mon, 29 Sep 2025 12:07:59 +0000
Received: from [2a01:cb15:80df:da00:e2a9:ff82:7bde:38cd] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v3Cff-004JHo-2o;
 Mon, 29 Sep 2025 12:07:59 +0000
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
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=TkLeJKOy6W2+2/EbdbLvrKVsvOauvUqw0+FWVe+Qo5U=; b=KOPHVlCU3Hqbv1GIBsL7wMjXTv
	EBRaUzQxZQgXdw61BgRWDOGSEIxKG3Ni7e1K4hs2/3tYGMc2TNr7puBHE5jNt9OjjpQNA81Lj18db
	lC+EbSUedTHcoJd4JBhZ2E/r4fk8lkZPJotnr0B/jkn7nix9ZM20Z2njqhgFJclyZL2U=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v2 1/8] tools/configure: Introduce deps on json-c lib for libxl
Date: Mon, 29 Sep 2025 14:07:49 +0200
Message-ID: <20250929120756.46075-2-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250929120756.46075-1-anthony@xenproject.org>
References: <20250929120756.46075-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

To replace yajl.

Introduce XEN_JSON_LIBS variable, to be able to remove "-lyajl" later.

As a first step, the variable will have both or only -lyajl. Then
commit "configure: Use json-c by default, fallback to yajl" will make
a change to only have one or the other once the code is ready to build
with only json-c.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---

Notes:
    v2:
    - Introduce $(XEN_JSON_LIBS) to contain either of -lyajl or -ljson-c or
      both. At first, the variable will have both or only -lyajl, then
      commit "configure: Use json-c by default, fallback to yajl" will make
      a change to only have one or the other.

 config/Tools.mk.in        |   1 +
 tools/config.h.in         |   3 ++
 tools/configure           | 107 +++++++++++++++++++++++++++++++++++++-
 tools/configure.ac        |   6 ++-
 tools/libs/light/Makefile |   4 +-
 tools/xl/Makefile         |   2 +-
 6 files changed, 117 insertions(+), 6 deletions(-)

diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index e47ac23d11..0037ad5a64 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -65,6 +65,7 @@ EXTFS_LIBS          := @EXTFS_LIBS@
 CURSES_LIBS         := @CURSES_LIBS@
 TINFO_LIBS          := @TINFO_LIBS@
 ARGP_LDFLAGS        := @argp_ldflags@
+XEN_JSON_LIBS       := @YAJL_LIBS@ @libjsonc_LIBS@
 
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
index b690d92159..c05d89db33 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -166,7 +166,7 @@ LDLIBS-$(CONFIG_Linux) += -luuid
 LDLIBS-$(CONFIG_Linux) += -lrt
 LDLIBS-$(CONFIG_ARM) += -lfdt
 LDLIBS-y += $(PTHREAD_LIBS)
-LDLIBS-y += -lyajl
+LDLIBS-y += $(XEN_JSON_LIBS)
 LDLIBS += $(LDLIBS-y)
 
 $(OBJS-y) $(PIC_OBJS) $(LIBXL_TEST_OBJS): CFLAGS += $(CFLAGS_LIBXL) -include $(XEN_ROOT)/tools/config.h
@@ -246,7 +246,7 @@ libxenlight_test.so: $(PIC_OBJS) $(LIBXL_TEST_OBJS)
 	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenlight.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LDLIBS) $(APPEND_LDFLAGS)
 
 test_%: test_%.o test_common.o libxenlight_test.so
-	$(CC) $(LDFLAGS) -o $@ $^ $(filter-out %libxenlight.so, $(LDLIBS_libxenlight)) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) -lyajl $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $^ $(filter-out %libxenlight.so, $(LDLIBS_libxenlight)) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) $(XEN_JSON_LIBS) $(APPEND_LDFLAGS)
 
 libxl-save-helper: $(SAVE_HELPER_OBJS) libxenlight.so
 	$(CC) $(LDFLAGS) -o $@ $(SAVE_HELPER_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index ad577cdd70..973ff0e1a2 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -33,7 +33,7 @@ $(XL_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h # libxl_json.h needs i
 all: xl
 
 xl: $(XL_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) -lyajl $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(XEN_JSON_LIBS) $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
-- 
Anthony PERARD


