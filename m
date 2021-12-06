Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2766546A247
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239476.415189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSj-0000xd-N5; Mon, 06 Dec 2021 17:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239476.415189; Mon, 06 Dec 2021 17:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSj-0000py-Dq; Mon, 06 Dec 2021 17:07:37 +0000
Received: by outflank-mailman (input) for mailman id 239476;
 Mon, 06 Dec 2021 17:07:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOq-0005ti-Ho
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:36 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 714dd024-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:03:34 +0100 (CET)
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
X-Inumbo-ID: 714dd024-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=87Jwg3dUCW2JRgwzDCH17RKTaiNypi0W5MI+j9zb2Dw=;
  b=LQZ1fSRynnjoshix7PuQJUgu4lwgFfIx5cXQl47wdlSPOeFSCWkQQFCU
   6hy+1H35iV3yaZ2rlwXE2i+KdjFZVVy0kDROboZgan1IyARYSwBKH28C9
   FWXsqcLPqeqFhx5NYmtBU02VEtWOm0P6HoH+25dss2LULOtyp35kbOcM/
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: aRgDtDW9+i7arDAhUgwN9Wt3ZP+K9bzn48v7bdjUxgCDVK4pTw3RyGQ/3ZpDYguReP0VIyqa8g
 P+AMN+z2PsPWPaBKj2RNfhnMiKc/q+YpE9wEJ0eCYZYcrEwvC8D6evICfZaAcSWZvUfl+UAgpj
 tiesAr6vB1vHb2CtvL5UEVbgBJDFERpA/7T8s47WHyug4QkBleYKfDj4npuUULkHrMIxoCy/oF
 X37WQBIXSp5FNrSOo7AGmwf49WYlWBZnI8xZicEgk5R4VqII/lvsMxu0s+CTnlOtribpmLBRrn
 4sy7WHlXmCM8U2pSY/0RXVZ5
X-SBRS: 5.1
X-MesageID: 59324028
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ejcUyqNr2ibBIcDvrR1UkMFynXyQoLVcMsEvi/4bfWQNrUoj0TEHz
 mRJDTvTP/vYMDHzftF3Odu1801TupPRn4dlQAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En5400o9w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoyi1rfVSw
 tdOjMyTdwk1bojjg88dbSANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgWZr3JwWR6a2i
 8wxWSo/MyrQWkJzCnwSJ8wQhPy5mGDfWmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6aq
 XjB5H/RGQwBOZqUzj/t2nOzhMffkCXjQoUQGbaksPlwjzW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvH0WQG4p3iV+AYRQdNKH8U17QiMzuzf5APxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmKCpe1e+/LWXlGORByYJfUotfgQEczJQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r8tlshDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpnGGCF6bKMN8N4n9hIx5JFVdoKiN2ZDB02WvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKNYoROMksLlXZo3EGiausM4bFyhJEfUYXY
 8jzTCpRJSxCVfQPIMSeGY/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GADmUwzN14vd+F+92
 48Gb6OikkwDOMWjMni/2dNCdjgicClkba0aXuQKL4Zv1CI9Qzp/YxIQqJt8E7FYc1N9yr2Vo
 yrjAxAAkzISRxTvcG23V5yqU5u3Nb4XkJ7xFXZE0Y+A1ydxbICxwr0YcpdrL7Ar+PY6lax/T
 uUfetXGCfNKE2yV9zMYZJj7jYpjaBX02l7eY3v7OGAyL8x6WgjE2t74ZQ+zpiMAOTW66Jklq
 Lq62wKFHZdaH1Z+DNzbYe6Exk+quSRPg/p7WkbFe4EBeEjl/IVwBTb2i/s7f5MFJRnZn2PI3
 AeKGxYI4+LKptZtotXOgKmFqaavEvd/QRUGTzWKs+7uOHCDrGS5wIJGXOKZRhznVTv5qPe4e
 OFY7/DgK/lbzlxEhJVxTuRwxqUk6tqx+7IDllZ4HG/GZkiAA697JiXUxtFGs6BAy+MLuQayX
 U7TqNBWNa/QZZHgGV8VYgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYlYpk4x
 eoBudIN713tgxUnBd+KkyRI+jneNXcHSagm6skXDYKDZtDHEb2ejUgw0hPL3aw=
IronPort-HdrOrdr: A9a23:K8bvzKEIbgwv9TqvpLqE4seALOsnbusQ8zAXP0AYc3Nom6uj5q
 WTdZUgpHjJYVkqOU3I9ersBEDiewK/yXcW2+ks1N6ZNWGM0ldARLsSibcKqAePJ8SRzIJgPN
 9bAstDNOE=
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59324028"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 19/57] tools/configure.ac: Create ZLIB_LIBS and ZLIB_CFLAGS
Date: Mon, 6 Dec 2021 17:02:02 +0000
Message-ID: <20211206170241.13165-20-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use both ZLIB_CFLAGS and ZLIB_LIBS instead of cherry-picking flags
from a single "ZLIB" variable.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/configure.ac        | 19 ++++++++++++++-----
 config/Tools.mk.in        |  3 ++-
 tools/configure           | 22 ++++++++++++++--------
 tools/libs/guest/Makefile | 12 +++++-------
 4 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/tools/configure.ac b/tools/configure.ac
index 5a4fb9022d..56afe7930d 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -391,17 +391,26 @@ AX_CHECK_FETCHER
 
 # Checks for libraries.
 AC_CHECK_HEADER([bzlib.h], [
-AC_CHECK_LIB([bz2], [BZ2_bzDecompressInit], [zlib="$zlib -DHAVE_BZLIB -lbz2"])
+    AC_CHECK_LIB([bz2], [BZ2_bzDecompressInit],
+        [ZLIB_CFLAGS="$ZLIB_CFLAGS -DHAVE_BZLIB"
+         ZLIB_LIBS="$ZLIB_LIBS -lbz2"])
 ])
 AC_CHECK_HEADER([lzma.h], [
-AC_CHECK_LIB([lzma], [lzma_stream_decoder], [zlib="$zlib -DHAVE_LZMA -llzma"])
+    AC_CHECK_LIB([lzma], [lzma_stream_decoder],
+        [ZLIB_CFLAGS="$ZLIB_CFLAGS -DHAVE_LZMA"
+         ZLIB_LIBS="$ZLIB_LIBS -llzma"])
 ])
 AC_CHECK_HEADER([lzo/lzo1x.h], [
-AC_CHECK_LIB([lzo2], [lzo1x_decompress], [zlib="$zlib -DHAVE_LZO1X -llzo2"])
+    AC_CHECK_LIB([lzo2], [lzo1x_decompress],
+        [ZLIB_CFLAGS="$ZLIB_CFLAGS -DHAVE_LZO1X"
+         ZLIB_LIBS="$ZLIB_LIBS -llzo2"])
 ])
 PKG_CHECK_MODULES([libzstd], [libzstd],
-    [zlib="$zlib -DHAVE_ZSTD $libzstd_CFLAGS $libzstd_LIBS"], [true])
-AC_SUBST(zlib)
+    [ZLIB_CFLAGS="$ZLIB_CFLAGS -DHAVE_ZSTD $libzstd_CFLAGS"
+     ZLIB_LIBS="$ZLIB_LIBS $libzstd_LIBS"],
+    [true])
+AC_SUBST([ZLIB_CFLAGS])
+AC_SUBST([ZLIB_LIBS])
 AX_CHECK_EXTFS
 AX_CHECK_PTHREAD
 AX_CHECK_PTYFUNCS
diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index 934d899967..6c1a0a676f 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -66,7 +66,8 @@ CONFIG_9PFS         := @ninepfs@
 LINUX_BACKEND_MODULES := @LINUX_BACKEND_MODULES@
 
 #System options
-ZLIB                := @zlib@
+ZLIB_CFLAGS         := @ZLIB_CFLAGS@
+ZLIB_LIBS           := @ZLIB_LIBS@
 CONFIG_LIBICONV     := @libiconv@
 EXTFS_LIBS          := @EXTFS_LIBS@
 CURSES_LIBS         := @CURSES_LIBS@
diff --git a/tools/configure b/tools/configure
index 829753b5dd..a052c186a5 100755
--- a/tools/configure
+++ b/tools/configure
@@ -641,7 +641,8 @@ PTHREAD_LIBS
 PTHREAD_LDFLAGS
 PTHREAD_CFLAGS
 EXTFS_LIBS
-zlib
+ZLIB_LIBS
+ZLIB_CFLAGS
 libzstd_LIBS
 libzstd_CFLAGS
 FETCHER
@@ -8605,7 +8606,7 @@ fi
 ac_fn_c_check_header_mongrel "$LINENO" "bzlib.h" "ac_cv_header_bzlib_h" "$ac_includes_default"
 if test "x$ac_cv_header_bzlib_h" = xyes; then :
 
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for BZ2_bzDecompressInit in -lbz2" >&5
+    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for BZ2_bzDecompressInit in -lbz2" >&5
 $as_echo_n "checking for BZ2_bzDecompressInit in -lbz2... " >&6; }
 if ${ac_cv_lib_bz2_BZ2_bzDecompressInit+:} false; then :
   $as_echo_n "(cached) " >&6
@@ -8642,7 +8643,8 @@ fi
 { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_bz2_BZ2_bzDecompressInit" >&5
 $as_echo "$ac_cv_lib_bz2_BZ2_bzDecompressInit" >&6; }
 if test "x$ac_cv_lib_bz2_BZ2_bzDecompressInit" = xyes; then :
-  zlib="$zlib -DHAVE_BZLIB -lbz2"
+  ZLIB_CFLAGS="$ZLIB_CFLAGS -DHAVE_BZLIB"
+         ZLIB_LIBS="$ZLIB_LIBS -lbz2"
 fi
 
 
@@ -8652,7 +8654,7 @@ fi
 ac_fn_c_check_header_mongrel "$LINENO" "lzma.h" "ac_cv_header_lzma_h" "$ac_includes_default"
 if test "x$ac_cv_header_lzma_h" = xyes; then :
 
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for lzma_stream_decoder in -llzma" >&5
+    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for lzma_stream_decoder in -llzma" >&5
 $as_echo_n "checking for lzma_stream_decoder in -llzma... " >&6; }
 if ${ac_cv_lib_lzma_lzma_stream_decoder+:} false; then :
   $as_echo_n "(cached) " >&6
@@ -8689,7 +8691,8 @@ fi
 { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_lzma_lzma_stream_decoder" >&5
 $as_echo "$ac_cv_lib_lzma_lzma_stream_decoder" >&6; }
 if test "x$ac_cv_lib_lzma_lzma_stream_decoder" = xyes; then :
-  zlib="$zlib -DHAVE_LZMA -llzma"
+  ZLIB_CFLAGS="$ZLIB_CFLAGS -DHAVE_LZMA"
+         ZLIB_LIBS="$ZLIB_LIBS -llzma"
 fi
 
 
@@ -8699,7 +8702,7 @@ fi
 ac_fn_c_check_header_mongrel "$LINENO" "lzo/lzo1x.h" "ac_cv_header_lzo_lzo1x_h" "$ac_includes_default"
 if test "x$ac_cv_header_lzo_lzo1x_h" = xyes; then :
 
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for lzo1x_decompress in -llzo2" >&5
+    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for lzo1x_decompress in -llzo2" >&5
 $as_echo_n "checking for lzo1x_decompress in -llzo2... " >&6; }
 if ${ac_cv_lib_lzo2_lzo1x_decompress+:} false; then :
   $as_echo_n "(cached) " >&6
@@ -8736,7 +8739,8 @@ fi
 { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_lzo2_lzo1x_decompress" >&5
 $as_echo "$ac_cv_lib_lzo2_lzo1x_decompress" >&6; }
 if test "x$ac_cv_lib_lzo2_lzo1x_decompress" = xyes; then :
-  zlib="$zlib -DHAVE_LZO1X -llzo2"
+  ZLIB_CFLAGS="$ZLIB_CFLAGS -DHAVE_LZO1X"
+         ZLIB_LIBS="$ZLIB_LIBS -llzo2"
 fi
 
 
@@ -8812,10 +8816,12 @@ else
 	libzstd_LIBS=$pkg_cv_libzstd_LIBS
         { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
 $as_echo "yes" >&6; }
-	zlib="$zlib -DHAVE_ZSTD $libzstd_CFLAGS $libzstd_LIBS"
+	ZLIB_CFLAGS="$ZLIB_CFLAGS -DHAVE_ZSTD $libzstd_CFLAGS"
+     ZLIB_LIBS="$ZLIB_LIBS $libzstd_LIBS"
 fi
 
 
+
 ac_fn_c_check_header_mongrel "$LINENO" "ext2fs/ext2fs.h" "ac_cv_header_ext2fs_ext2fs_h" "$ac_includes_default"
 if test "x$ac_cv_header_ext2fs_ext2fs_h" = xyes; then :
 
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 8f5f3acd21..1f4b7f7c58 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -89,13 +89,12 @@ CFLAGS	+= $(CFLAGS_libxendevicemodel)
 CFLAGS += $(CFLAGS_libxencall) $(CFLAGS_libxenforeignmemory)
 
 ifeq ($(CONFIG_MiniOS),y)
-zlib-options =
-else
-zlib-options = $(ZLIB)
+ZLIB_CFLAGS :=
+ZLIB_LIBS :=
 endif
 
-xg_dom_bzimageloader.o: CFLAGS += $(filter -D%,$(zlib-options))
-xg_dom_bzimageloader.opic: CFLAGS += $(filter -D%,$(zlib-options))
+xg_dom_bzimageloader.o: CFLAGS += $(ZLIB_CFLAGS)
+xg_dom_bzimageloader.opic: CFLAGS += $(ZLIB_CFLAGS)
 
 LIBHEADER := xenguest.h
 
@@ -103,8 +102,7 @@ NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-libxenguest.so.$(MAJOR).$(MINOR): COMPRESSION_LIBS = $(filter -l%,$(zlib-options))
-libxenguest.so.$(MAJOR).$(MINOR): APPEND_LDFLAGS += $(COMPRESSION_LIBS) -lz
+libxenguest.so.$(MAJOR).$(MINOR): APPEND_LDFLAGS += $(ZLIB_LIBS) -lz
 
 -include $(DEPS_INCLUDE)
 
-- 
Anthony PERARD


