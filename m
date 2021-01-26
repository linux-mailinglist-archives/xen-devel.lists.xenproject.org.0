Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 072A7303961
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 10:49:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74707.134268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KyD-0008FO-N0; Tue, 26 Jan 2021 09:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74707.134268; Tue, 26 Jan 2021 09:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KyD-0008Ey-Jg; Tue, 26 Jan 2021 09:49:09 +0000
Received: by outflank-mailman (input) for mailman id 74707;
 Tue, 26 Jan 2021 09:49:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4KyC-0008En-3M
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:49:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13b54e0f-b225-4ef2-8bba-164b6b15dde9;
 Tue, 26 Jan 2021 09:49:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C086FAE66;
 Tue, 26 Jan 2021 09:49:00 +0000 (UTC)
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
X-Inumbo-ID: 13b54e0f-b225-4ef2-8bba-164b6b15dde9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611654540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AQDXmkSi1oc7I0pyRNhai60MxF0mbxb6bDIizjQ4VPo=;
	b=ThA7a4kf6erA3XCsYj3fpgvP88sy9BpJvWyds0PR0Ow4Qnm/wWmZXO3+INOmZUGNR0KlTQ
	ZunHdX5AglKSvBBBUpQnbK0NPQnSazRtIdY57bOjXvwEpjIS0yDvdZLHm3QzAAdW1cPIYN
	KNIXzGh707CqkqDmOpy9ZENzuG052q0=
Subject: [PATCH v3 02/15] libxenguest: support zstd compressed kernels
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Message-ID: <02b2a15a-debc-e066-72ff-ab9ca9429839@suse.com>
Date: Tue, 26 Jan 2021 10:49:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This follows the logic used for other decompression methods utilizing an
external library, albeit here we can't ignore the 32-bit size field
appended to the compressed image - its presence causes decompression to
fail. Leverage the field instead to allocate the output buffer in one
go, i.e. without incrementally realloc()ing.

As far as configure.ac goes, I'm pretty sure there is a better (more
"standard") way of using PKG_CHECK_MODULES(). The construct also gets
put next to the other decompression library checks, albeit I think they
all ought to be x86-specific (e.g. placed in the existing case block a
few lines down).

Note that, where possible, instead of #ifdef-ing xen/*.h inclusions,
they get removed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Wei Liu <wl@xen.org>
Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
Note for committer: As an alternative to patching tools/configure here,
autoconf may want re-running.
---
v3: Drop AC_MSG_WARN(). Avoid use of $libzstd_PKG_ERRORS. Use helper for
    unaligned reads.
v2.5: Don't make libzstd a hard dependency. Adjust ./README.
v2: New.

--- a/README
+++ b/README
@@ -84,6 +84,8 @@ disabled at compile time:
     * 16-bit x86 assembler, loader and compiler for qemu-traditional / rombios
       (dev86 rpm or bin86 & bcc debs)
     * Development install of liblzma for rombios
+    * Development install of libbz2, liblzma, liblzo2, and libzstd for DomU
+      kernel decompression.
 
 Second, you need to acquire a suitable kernel for use in domain 0. If
 possible you should use a kernel provided by your OS distributor. If
--- a/tools/configure
+++ b/tools/configure
@@ -643,6 +643,8 @@ PTHREAD_CFLAGS
 EXTFS_LIBS
 system_aio
 zlib
+libzstd_LIBS
+libzstd_CFLAGS
 FETCHER
 FTP
 FALSE
@@ -857,6 +859,8 @@ glib_CFLAGS
 glib_LIBS
 pixman_CFLAGS
 pixman_LIBS
+libzstd_CFLAGS
+libzstd_LIBS
 LIBNL3_CFLAGS
 LIBNL3_LIBS
 SYSTEMD_CFLAGS
@@ -1605,6 +1609,10 @@ Some influential environment variables:
   pixman_CFLAGS
               C compiler flags for pixman, overriding pkg-config
   pixman_LIBS linker flags for pixman, overriding pkg-config
+  libzstd_CFLAGS
+              C compiler flags for libzstd, overriding pkg-config
+  libzstd_LIBS
+              linker flags for libzstd, overriding pkg-config
   LIBNL3_CFLAGS
               C compiler flags for LIBNL3, overriding pkg-config
   LIBNL3_LIBS linker flags for LIBNL3, overriding pkg-config
@@ -8744,6 +8752,77 @@ fi
 
 
 
+pkg_failed=no
+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for libzstd" >&5
+$as_echo_n "checking for libzstd... " >&6; }
+
+if test -n "$libzstd_CFLAGS"; then
+    pkg_cv_libzstd_CFLAGS="$libzstd_CFLAGS"
+ elif test -n "$PKG_CONFIG"; then
+    if test -n "$PKG_CONFIG" && \
+    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libzstd\""; } >&5
+  ($PKG_CONFIG --exists --print-errors "libzstd") 2>&5
+  ac_status=$?
+  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  test $ac_status = 0; }; then
+  pkg_cv_libzstd_CFLAGS=`$PKG_CONFIG --cflags "libzstd" 2>/dev/null`
+		      test "x$?" != "x0" && pkg_failed=yes
+else
+  pkg_failed=yes
+fi
+ else
+    pkg_failed=untried
+fi
+if test -n "$libzstd_LIBS"; then
+    pkg_cv_libzstd_LIBS="$libzstd_LIBS"
+ elif test -n "$PKG_CONFIG"; then
+    if test -n "$PKG_CONFIG" && \
+    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libzstd\""; } >&5
+  ($PKG_CONFIG --exists --print-errors "libzstd") 2>&5
+  ac_status=$?
+  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  test $ac_status = 0; }; then
+  pkg_cv_libzstd_LIBS=`$PKG_CONFIG --libs "libzstd" 2>/dev/null`
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
+   	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
+$as_echo "no" >&6; }
+
+if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
+        _pkg_short_errors_supported=yes
+else
+        _pkg_short_errors_supported=no
+fi
+        if test $_pkg_short_errors_supported = yes; then
+	        libzstd_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "libzstd" 2>&1`
+        else
+	        libzstd_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "libzstd" 2>&1`
+        fi
+	# Put the nasty error message in config.log where it belongs
+	echo "$libzstd_PKG_ERRORS" >&5
+
+	true
+elif test $pkg_failed = untried; then
+     	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
+$as_echo "no" >&6; }
+	true
+else
+	libzstd_CFLAGS=$pkg_cv_libzstd_CFLAGS
+	libzstd_LIBS=$pkg_cv_libzstd_LIBS
+        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+$as_echo "yes" >&6; }
+	zlib="$zlib -DHAVE_ZSTD $libzstd_CFLAGS $libzstd_LIBS"
+fi
+
 
 
 ac_fn_c_check_header_mongrel "$LINENO" "ext2fs/ext2fs.h" "ac_cv_header_ext2fs_ext2fs_h" "$ac_includes_default"
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -414,6 +414,8 @@ AC_CHECK_LIB([lzma], [lzma_stream_decode
 AC_CHECK_HEADER([lzo/lzo1x.h], [
 AC_CHECK_LIB([lzo2], [lzo1x_decompress], [zlib="$zlib -DHAVE_LZO1X -llzo2"])
 ])
+PKG_CHECK_MODULES([libzstd], [libzstd],
+    [zlib="$zlib -DHAVE_ZSTD $libzstd_CFLAGS $libzstd_LIBS"], [true])
 AC_SUBST(zlib)
 AC_SUBST(system_aio)
 AX_CHECK_EXTFS
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -64,6 +64,7 @@ SRCS-y                 += xg_dom_decompr
 SRCS-y                 += xg_dom_decompress_unsafe_lzma.c
 SRCS-y                 += xg_dom_decompress_unsafe_lzo1x.c
 SRCS-y                 += xg_dom_decompress_unsafe_xz.c
+SRCS-y                 += xg_dom_decompress_unsafe_zstd.c
 endif
 
 -include $(XEN_TARGET_ARCH)/Makefile
--- a/tools/libs/guest/xg_dom_bzimageloader.c
+++ b/tools/libs/guest/xg_dom_bzimageloader.c
@@ -589,6 +589,85 @@ static int xc_try_lzo1x_decode(
 
 #endif
 
+#if defined(HAVE_ZSTD)
+
+#include <zstd.h>
+
+static int xc_try_zstd_decode(
+    struct xc_dom_image *dom, void **blob, size_t *size)
+{
+    size_t outsize, insize, actual;
+    unsigned char *outbuf;
+
+    /* Magic, descriptor byte, and trailing size field. */
+    if ( *size <= 9 )
+    {
+        DOMPRINTF("ZSTD: insufficient input data");
+        return -1;
+    }
+
+    insize = *size - 4;
+    outsize = get_unaligned_le32(*blob + insize);
+
+    if ( xc_dom_kernel_check_size(dom, outsize) )
+    {
+        DOMPRINTF("ZSTD: output too large");
+        return -1;
+    }
+
+    outbuf = malloc(outsize);
+    if ( !outbuf )
+    {
+        DOMPRINTF("ZSTD: failed to alloc memory");
+        return -1;
+    }
+
+    actual = ZSTD_decompress(outbuf, outsize, *blob, insize);
+
+    if ( ZSTD_isError(actual) )
+    {
+        DOMPRINTF("ZSTD: error: %s", ZSTD_getErrorName(actual));
+        free(outbuf);
+        return -1;
+    }
+
+    if ( actual != outsize )
+    {
+        DOMPRINTF("ZSTD: got 0x%zx bytes instead of 0x%zx",
+                  actual, outsize);
+        free(outbuf);
+        return -1;
+    }
+
+    if ( xc_dom_register_external(dom, outbuf, outsize) )
+    {
+        DOMPRINTF("ZSTD: error registering stream output");
+        free(outbuf);
+        return -1;
+    }
+
+    DOMPRINTF("%s: ZSTD decompress OK, 0x%zx -> 0x%zx",
+              __FUNCTION__, insize, outsize);
+
+    *blob = outbuf;
+    *size = outsize;
+
+    return 0;
+}
+
+#else /* !defined(HAVE_ZSTD) */
+
+static int xc_try_zstd_decode(
+    struct xc_dom_image *dom, void **blob, size_t *size)
+{
+    xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
+                 "%s: ZSTD decompress support unavailable\n",
+                 __FUNCTION__);
+    return -1;
+}
+
+#endif
+
 #else /* __MINIOS__ */
 
 int xc_try_bzip2_decode(struct xc_dom_image *dom, void **blob, size_t *size);
@@ -735,6 +814,17 @@ static int xc_dom_probe_bzimage_kernel(s
                          __FUNCTION__);
             return -EINVAL;
         }
+    }
+    else if ( check_magic(dom, "\x28\xb5\x2f\xfd", 4) )
+    {
+        ret = xc_try_zstd_decode(dom, &dom->kernel_blob, &dom->kernel_size);
+        if ( ret < 0 )
+        {
+            xc_dom_panic(dom->xch, XC_INVALID_KERNEL,
+                         "%s unable to ZSTD decompress kernel",
+                         __FUNCTION__);
+            return -EINVAL;
+        }
     }
     else if ( check_magic(dom, "\135\000", 2) )
     {
--- /dev/null
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
@@ -0,0 +1,45 @@
+#include <stdio.h>
+#include <endian.h>
+#include <stdlib.h>
+#include <stddef.h>
+#include <stdint.h>
+#include <inttypes.h>
+
+#include "xg_private.h"
+#include "xg_dom_decompress_unsafe.h"
+
+typedef uint8_t u8;
+
+typedef uint16_t __u16;
+typedef uint32_t __u32;
+typedef uint64_t __u64;
+
+typedef uint16_t __le16;
+typedef uint32_t __le32;
+typedef uint64_t __le64;
+
+typedef uint16_t __be16;
+typedef uint32_t __be32;
+typedef uint64_t __be64;
+
+#define __attribute_const__
+#define __force
+#define always_inline
+#define noinline
+
+#undef ERROR
+
+#define __BYTEORDER_HAS_U64__
+#define __TYPES_H__ /* xen/types.h guard */
+#include "../../xen/include/xen/byteorder/little_endian.h"
+#define __ASM_UNALIGNED_H__ /* asm/unaligned.h guard */
+#include "../../xen/include/xen/unaligned.h"
+#include "../../xen/include/xen/xxhash.h"
+#include "../../xen/lib/xxhash64.c"
+#include "../../xen/common/unzstd.c"
+
+int xc_try_zstd_decode(
+    struct xc_dom_image *dom, void **blob, size_t *size)
+{
+    return xc_dom_decompress_unsafe(unzstd, dom, blob, size);
+}
--- a/tools/libs/guest/xg_dom_decompress_unsafe.h
+++ b/tools/libs/guest/xg_dom_decompress_unsafe.h
@@ -16,3 +16,5 @@ int xc_try_lzo1x_decode(struct xc_dom_im
     __attribute__((visibility("internal")));
 int xc_try_xz_decode(struct xc_dom_image *dom, void **blob, size_t *size)
     __attribute__((visibility("internal")));
+int xc_try_zstd_decode(struct xc_dom_image *dom, void **blob, size_t *size)
+    __attribute__((visibility("internal")));
--- a/xen/common/zstd/decompress.c
+++ b/xen/common/zstd/decompress.c
@@ -33,7 +33,6 @@
 #include "huf.h"
 #include "mem.h" /* low level memory routines */
 #include "zstd_internal.h"
-#include <xen/string.h> /* memcpy, memmove, memset */
 
 #define ZSTD_PREFETCH(ptr) __builtin_prefetch(ptr, 0, 0)
 
@@ -99,9 +98,12 @@ struct ZSTD_DCtx_s {
 	BYTE headerBuffer[ZSTD_FRAMEHEADERSIZE_MAX];
 }; /* typedef'd to ZSTD_DCtx within "zstd.h" */
 
-size_t INIT ZSTD_DCtxWorkspaceBound(void) { return ZSTD_ALIGN(sizeof(ZSTD_stack)) + ZSTD_ALIGN(sizeof(ZSTD_DCtx)); }
+STATIC size_t INIT ZSTD_DCtxWorkspaceBound(void)
+{
+	return ZSTD_ALIGN(sizeof(ZSTD_stack)) + ZSTD_ALIGN(sizeof(ZSTD_DCtx));
+}
 
-size_t INIT ZSTD_decompressBegin(ZSTD_DCtx *dctx)
+STATIC size_t INIT ZSTD_decompressBegin(ZSTD_DCtx *dctx)
 {
 	dctx->expected = ZSTD_frameHeaderSize_prefix;
 	dctx->stage = ZSTDds_getFrameHeaderSize;
@@ -121,7 +123,7 @@ size_t INIT ZSTD_decompressBegin(ZSTD_DC
 	return 0;
 }
 
-ZSTD_DCtx *INIT ZSTD_createDCtx_advanced(ZSTD_customMem customMem)
+STATIC ZSTD_DCtx *INIT ZSTD_createDCtx_advanced(ZSTD_customMem customMem)
 {
 	ZSTD_DCtx *dctx;
 
@@ -136,7 +138,7 @@ ZSTD_DCtx *INIT ZSTD_createDCtx_advanced
 	return dctx;
 }
 
-ZSTD_DCtx *INIT ZSTD_initDCtx(void *workspace, size_t workspaceSize)
+STATIC ZSTD_DCtx *INIT ZSTD_initDCtx(void *workspace, size_t workspaceSize)
 {
 	ZSTD_customMem const stackMem = ZSTD_initStack(workspace, workspaceSize);
 	return ZSTD_createDCtx_advanced(stackMem);
@@ -150,11 +152,13 @@ size_t INIT ZSTD_freeDCtx(ZSTD_DCtx *dct
 	return 0; /* reserved as a potential error code in the future */
 }
 
+#ifdef BUILD_DEAD_CODE
 void INIT ZSTD_copyDCtx(ZSTD_DCtx *dstDCtx, const ZSTD_DCtx *srcDCtx)
 {
 	size_t const workSpaceSize = (ZSTD_BLOCKSIZE_ABSOLUTEMAX + WILDCOPY_OVERLENGTH) + ZSTD_frameHeaderSize_max;
 	memcpy(dstDCtx, srcDCtx, sizeof(ZSTD_DCtx) - workSpaceSize); /* no need to copy workspace */
 }
+#endif
 
 STATIC size_t ZSTD_findFrameCompressedSize(const void *src, size_t srcSize);
 STATIC size_t ZSTD_decompressBegin_usingDict(ZSTD_DCtx *dctx, const void *dict,
@@ -166,6 +170,7 @@ static void ZSTD_refDDict(ZSTD_DCtx *dst
 *   Decompression section
 ***************************************************************/
 
+#ifdef BUILD_DEAD_CODE
 /*! ZSTD_isFrame() :
  *  Tells if the content of `buffer` starts with a valid Frame Identifier.
  *  Note : Frame Identifier is 4 bytes. If `size < 4`, @return will always be 0.
@@ -184,6 +189,7 @@ unsigned INIT ZSTD_isFrame(const void *b
 	}
 	return 0;
 }
+#endif
 
 /** ZSTD_frameHeaderSize() :
 *   srcSize must be >= ZSTD_frameHeaderSize_prefix.
@@ -206,7 +212,7 @@ static size_t INIT ZSTD_frameHeaderSize(
 *   @return : 0, `fparamsPtr` is correctly filled,
 *            >0, `srcSize` is too small, result is expected `srcSize`,
 *             or an error code, which can be tested using ZSTD_isError() */
-size_t INIT ZSTD_getFrameParams(ZSTD_frameParams *fparamsPtr, const void *src, size_t srcSize)
+STATIC size_t INIT ZSTD_getFrameParams(ZSTD_frameParams *fparamsPtr, const void *src, size_t srcSize)
 {
 	const BYTE *ip = (const BYTE *)src;
 
@@ -291,6 +297,7 @@ size_t INIT ZSTD_getFrameParams(ZSTD_fra
 	return 0;
 }
 
+#ifdef BUILD_DEAD_CODE
 /** ZSTD_getFrameContentSize() :
 *   compatible with legacy mode
 *   @return : decompressed size of the single frame pointed to be `src` if known, otherwise
@@ -367,6 +374,7 @@ unsigned long long INIT ZSTD_findDecompr
 		return totalDstSize;
 	}
 }
+#endif /* BUILD_DEAD_CODE */
 
 /** ZSTD_decodeFrameHeader() :
 *   `headerSize` must be the size provided by ZSTD_frameHeaderSize().
@@ -393,7 +401,7 @@ typedef struct {
 
 /*! ZSTD_getcBlockSize() :
 *   Provides the size of compressed block from block header `src` */
-size_t INIT ZSTD_getcBlockSize(const void *src, size_t srcSize, blockProperties_t *bpPtr)
+STATIC size_t INIT ZSTD_getcBlockSize(const void *src, size_t srcSize, blockProperties_t *bpPtr)
 {
 	if (srcSize < ZSTD_blockHeaderSize)
 		return ERROR(srcSize_wrong);
@@ -431,7 +439,7 @@ static size_t INIT ZSTD_setRleBlock(void
 
 /*! ZSTD_decodeLiteralsBlock() :
 	@return : nb of bytes read from src (< srcSize ) */
-size_t INIT ZSTD_decodeLiteralsBlock(ZSTD_DCtx *dctx, const void *src, size_t srcSize) /* note : srcSize < BLOCKSIZE */
+STATIC size_t INIT ZSTD_decodeLiteralsBlock(ZSTD_DCtx *dctx, const void *src, size_t srcSize) /* note : srcSize < BLOCKSIZE */
 {
 	if (srcSize < MIN_CBLOCK_SIZE)
 		return ERROR(corruption_detected);
@@ -795,7 +803,7 @@ static size_t INIT ZSTD_buildSeqTable(FS
 	}
 }
 
-size_t INIT ZSTD_decodeSeqHeaders(ZSTD_DCtx *dctx, int *nbSeqPtr, const void *src, size_t srcSize)
+STATIC size_t INIT ZSTD_decodeSeqHeaders(ZSTD_DCtx *dctx, int *nbSeqPtr, const void *src, size_t srcSize)
 {
 	const BYTE *const istart = (const BYTE *const)src;
 	const BYTE *const iend = istart + srcSize;
@@ -1481,6 +1489,7 @@ static void INIT ZSTD_checkContinuity(ZS
 	}
 }
 
+#ifdef BUILD_DEAD_CODE
 size_t INIT ZSTD_decompressBlock(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize)
 {
 	size_t dSize;
@@ -1498,8 +1507,9 @@ size_t INIT ZSTD_insertBlock(ZSTD_DCtx *
 	dctx->previousDstEnd = (const char *)blockStart + blockSize;
 	return blockSize;
 }
+#endif /* BUILD_DEAD_CODE */
 
-size_t INIT ZSTD_generateNxBytes(void *dst, size_t dstCapacity, BYTE byte, size_t length)
+STATIC size_t INIT ZSTD_generateNxBytes(void *dst, size_t dstCapacity, BYTE byte, size_t length)
 {
 	if (length > dstCapacity)
 		return ERROR(dstSize_tooSmall);
@@ -1512,7 +1522,7 @@ size_t INIT ZSTD_generateNxBytes(void *d
  *  `src` must point to the start of a ZSTD frame, ZSTD legacy frame, or skippable frame
  *  `srcSize` must be at least as large as the frame contained
  *  @return : the compressed size of the frame starting at `src` */
-size_t INIT ZSTD_findFrameCompressedSize(const void *src, size_t srcSize)
+STATIC size_t INIT ZSTD_findFrameCompressedSize(const void *src, size_t srcSize)
 {
 	if (srcSize >= ZSTD_skippableHeaderSize && (ZSTD_readLE32(src) & 0xFFFFFFF0U) == ZSTD_MAGIC_SKIPPABLE_START) {
 		return ZSTD_skippableHeaderSize + ZSTD_readLE32((const BYTE *)src + 4);
@@ -1709,12 +1719,12 @@ static size_t INIT ZSTD_decompressMultiF
 	return (BYTE *)dst - (BYTE *)dststart;
 }
 
-size_t INIT ZSTD_decompress_usingDict(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize, const void *dict, size_t dictSize)
+STATIC size_t INIT ZSTD_decompress_usingDict(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize, const void *dict, size_t dictSize)
 {
 	return ZSTD_decompressMultiFrame(dctx, dst, dstCapacity, src, srcSize, dict, dictSize, NULL);
 }
 
-size_t INIT ZSTD_decompressDCtx(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize)
+STATIC size_t INIT ZSTD_decompressDCtx(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize)
 {
 	return ZSTD_decompress_usingDict(dctx, dst, dstCapacity, src, srcSize, NULL, 0);
 }
@@ -1723,9 +1733,12 @@ size_t INIT ZSTD_decompressDCtx(ZSTD_DCt
 *   Advanced Streaming Decompression API
 *   Bufferless and synchronous
 ****************************************/
-size_t INIT ZSTD_nextSrcSizeToDecompress(ZSTD_DCtx *dctx) { return dctx->expected; }
+STATIC size_t INIT ZSTD_nextSrcSizeToDecompress(ZSTD_DCtx *dctx)
+{
+	return dctx->expected;
+}
 
-ZSTD_nextInputType_e INIT ZSTD_nextInputType(ZSTD_DCtx *dctx)
+STATIC ZSTD_nextInputType_e INIT ZSTD_nextInputType(ZSTD_DCtx *dctx)
 {
 	switch (dctx->stage) {
 	default: /* should not happen */
@@ -1745,7 +1758,7 @@ int INIT ZSTD_isSkipFrame(ZSTD_DCtx *dct
 /** ZSTD_decompressContinue() :
 *   @return : nb of bytes generated into `dst` (necessarily <= `dstCapacity)
 *             or an error code, which can be tested using ZSTD_isError() */
-size_t INIT ZSTD_decompressContinue(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize)
+STATIC size_t INIT ZSTD_decompressContinue(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize)
 {
 	/* Sanity check */
 	if (srcSize != dctx->expected)
@@ -1971,7 +1984,7 @@ static size_t INIT ZSTD_decompress_inser
 	return ZSTD_refDictContent(dctx, dict, dictSize);
 }
 
-size_t INIT ZSTD_decompressBegin_usingDict(ZSTD_DCtx *dctx, const void *dict, size_t dictSize)
+STATIC size_t INIT ZSTD_decompressBegin_usingDict(ZSTD_DCtx *dctx, const void *dict, size_t dictSize)
 {
 	CHECK_F(ZSTD_decompressBegin(dctx));
 	if (dict && dictSize)
@@ -1991,7 +2004,9 @@ struct ZSTD_DDict_s {
 	ZSTD_customMem cMem;
 }; /* typedef'd to ZSTD_DDict within "zstd.h" */
 
+#ifdef BUILD_DEAD_CODE
 size_t INIT ZSTD_DDictWorkspaceBound(void) { return ZSTD_ALIGN(sizeof(ZSTD_stack)) + ZSTD_ALIGN(sizeof(ZSTD_DDict)); }
+#endif
 
 static const void *INIT ZSTD_DDictDictContent(const ZSTD_DDict *ddict) { return ddict->dictContent; }
 
@@ -2023,6 +2038,7 @@ static void INIT ZSTD_refDDict(ZSTD_DCtx
 	}
 }
 
+#ifdef BUILD_DEAD_CODE
 static size_t INIT ZSTD_loadEntropy_inDDict(ZSTD_DDict *ddict)
 {
 	ddict->dictID = 0;
@@ -2090,6 +2106,7 @@ ZSTD_DDict *INIT ZSTD_initDDict(const vo
 	ZSTD_customMem const stackMem = ZSTD_initStack(workspace, workspaceSize);
 	return ZSTD_createDDict_advanced(dict, dictSize, 1, stackMem);
 }
+#endif /* BUILD_DEAD_CODE */
 
 size_t INIT ZSTD_freeDDict(ZSTD_DDict *ddict)
 {
@@ -2103,6 +2120,7 @@ size_t INIT ZSTD_freeDDict(ZSTD_DDict *d
 	}
 }
 
+#ifdef BUILD_DEAD_CODE
 /*! ZSTD_getDictID_fromDict() :
  *  Provides the dictID stored within dictionary.
  *  if @return == 0, the dictionary is not conformant with Zstandard specification.
@@ -2145,11 +2163,12 @@ unsigned INIT ZSTD_getDictID_fromFrame(c
 		return 0;
 	return zfp.dictID;
 }
+#endif /* BUILD_DEAD_CODE */
 
 /*! ZSTD_decompress_usingDDict() :
 *   Decompression using a pre-digested Dictionary
 *   Use dictionary without significant overhead. */
-size_t INIT ZSTD_decompress_usingDDict(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize, const ZSTD_DDict *ddict)
+STATIC size_t INIT ZSTD_decompress_usingDDict(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize, const ZSTD_DDict *ddict)
 {
 	/* pass content and size in case legacy frames are encountered */
 	return ZSTD_decompressMultiFrame(dctx, dst, dstCapacity, src, srcSize, NULL, 0, ddict);
@@ -2186,7 +2205,7 @@ struct ZSTD_DStream_s {
 	U32 hostageByte;
 }; /* typedef'd to ZSTD_DStream within "zstd.h" */
 
-size_t INIT ZSTD_DStreamWorkspaceBound(size_t maxWindowSize)
+STATIC size_t INIT ZSTD_DStreamWorkspaceBound(size_t maxWindowSize)
 {
 	size_t const blockSize = MIN(maxWindowSize, ZSTD_BLOCKSIZE_ABSOLUTEMAX);
 	size_t const inBuffSize = blockSize;
@@ -2216,7 +2235,7 @@ static ZSTD_DStream *INIT ZSTD_createDSt
 	return zds;
 }
 
-ZSTD_DStream *INIT ZSTD_initDStream(size_t maxWindowSize, void *workspace, size_t workspaceSize)
+STATIC ZSTD_DStream *INIT ZSTD_initDStream(size_t maxWindowSize, void *workspace, size_t workspaceSize)
 {
 	ZSTD_customMem const stackMem = ZSTD_initStack(workspace, workspaceSize);
 	ZSTD_DStream *zds = ZSTD_createDStream_advanced(stackMem);
@@ -2249,6 +2268,7 @@ ZSTD_DStream *INIT ZSTD_initDStream(size
 	return zds;
 }
 
+#ifdef BUILD_DEAD_CODE
 ZSTD_DStream *INIT ZSTD_initDStream_usingDDict(size_t maxWindowSize, const ZSTD_DDict *ddict, void *workspace, size_t workspaceSize)
 {
 	ZSTD_DStream *zds = ZSTD_initDStream(maxWindowSize, workspace, workspaceSize);
@@ -2257,6 +2277,7 @@ ZSTD_DStream *INIT ZSTD_initDStream_usin
 	}
 	return zds;
 }
+#endif
 
 size_t INIT ZSTD_freeDStream(ZSTD_DStream *zds)
 {
@@ -2279,10 +2300,12 @@ size_t INIT ZSTD_freeDStream(ZSTD_DStrea
 
 /* *** Initialization *** */
 
+#ifdef BUILD_DEAD_CODE
 size_t INIT ZSTD_DStreamInSize(void) { return ZSTD_BLOCKSIZE_ABSOLUTEMAX + ZSTD_blockHeaderSize; }
 size_t INIT ZSTD_DStreamOutSize(void) { return ZSTD_BLOCKSIZE_ABSOLUTEMAX; }
+#endif
 
-size_t INIT ZSTD_resetDStream(ZSTD_DStream *zds)
+STATIC size_t INIT ZSTD_resetDStream(ZSTD_DStream *zds)
 {
 	zds->stage = zdss_loadHeader;
 	zds->lhSize = zds->inPos = zds->outStart = zds->outEnd = 0;
@@ -2300,7 +2323,7 @@ ZSTD_STATIC size_t INIT ZSTD_limitCopy(v
 	return length;
 }
 
-size_t INIT ZSTD_decompressStream(ZSTD_DStream *zds, ZSTD_outBuffer *output, ZSTD_inBuffer *input)
+STATIC size_t INIT ZSTD_decompressStream(ZSTD_DStream *zds, ZSTD_outBuffer *output, ZSTD_inBuffer *input)
 {
 	const char *const istart = (const char *)(input->src) + input->pos;
 	const char *const iend = (const char *)(input->src) + input->size;
--- a/xen/common/zstd/error_private.h
+++ b/xen/common/zstd/error_private.h
@@ -19,11 +19,6 @@
 #ifndef ERROR_H_MODULE
 #define ERROR_H_MODULE
 
-/* ****************************************
-*  Dependencies
-******************************************/
-#include <xen/types.h> /* size_t */
-
 /**
  * enum ZSTD_ErrorCode - zstd error codes
  *
--- a/xen/common/zstd/fse.h
+++ b/xen/common/zstd/fse.h
@@ -41,11 +41,6 @@
 #define FSE_H
 
 /*-*****************************************
-*  Dependencies
-******************************************/
-#include <xen/types.h> /* size_t, ptrdiff_t */
-
-/*-*****************************************
 *  FSE_PUBLIC_API : control library symbols visibility
 ******************************************/
 #define FSE_PUBLIC_API
--- a/xen/common/zstd/fse_decompress.c
+++ b/xen/common/zstd/fse_decompress.c
@@ -48,8 +48,6 @@
 #include "bitstream.h"
 #include "fse.h"
 #include "zstd_internal.h"
-#include <xen/compiler.h>
-#include <xen/string.h> /* memcpy, memset */
 
 /* **************************************************************
 *  Error Management
--- a/xen/common/zstd/huf.h
+++ b/xen/common/zstd/huf.h
@@ -40,9 +40,6 @@
 #ifndef HUF_H_298734234
 #define HUF_H_298734234
 
-/* *** Dependencies *** */
-#include <xen/types.h> /* size_t */
-
 /* ***   Tool functions *** */
 #define HUF_BLOCKSIZE_MAX (128 * 1024) /**< maximum input size for a single block compressed with HUF_compress */
 size_t HUF_compressBound(size_t size); /**< maximum compressed size (worst case) */
--- a/xen/common/zstd/huf_decompress.c
+++ b/xen/common/zstd/huf_decompress.c
@@ -48,8 +48,6 @@
 #include "bitstream.h" /* BIT_* */
 #include "fse.h"       /* header compression */
 #include "huf.h"
-#include <xen/compiler.h>
-#include <xen/string.h> /* memcpy, memset */
 
 /* **************************************************************
 *  Error Management
--- a/xen/common/zstd/mem.h
+++ b/xen/common/zstd/mem.h
@@ -20,9 +20,11 @@
 /*-****************************************
 *  Dependencies
 ******************************************/
+#ifdef __XEN__
 #include <xen/string.h> /* memcpy */
 #include <xen/types.h>  /* size_t, ptrdiff_t */
 #include <asm/unaligned.h>
+#endif
 
 /*-****************************************
 *  Compiler specifics
--- a/xen/common/zstd/zstd_internal.h
+++ b/xen/common/zstd/zstd_internal.h
@@ -28,8 +28,10 @@
 ***************************************/
 #include "error_private.h"
 #include "mem.h"
+#ifdef __XEN__
 #include <xen/compiler.h>
 #include <xen/xxhash.h>
+#endif
 
 #define ALIGN(x, a) ((x + (a) - 1) & ~((a) - 1))
 #define PTR_ALIGN(p, a) ((typeof(p))ALIGN((unsigned long)(p), (a)))
@@ -95,8 +97,10 @@ typedef struct ZSTD_DStream_s ZSTD_DStre
 /*-*************************************
 *  shared macros
 ***************************************/
+#ifndef MIN
 #define MIN(a, b) ((a) < (b) ? (a) : (b))
 #define MAX(a, b) ((a) > (b) ? (a) : (b))
+#endif
 #define CHECK_F(f)                       \
 	{                                \
 		size_t const errcod = f; \
--- a/xen/include/xen/unaligned.h
+++ b/xen/include/xen/unaligned.h
@@ -10,8 +10,10 @@
 #ifndef __XEN_UNALIGNED_H__
 #define __XEN_UNALIGNED_H__
 
+#ifdef __XEN__
 #include <xen/types.h>
 #include <asm/byteorder.h>
+#endif
 
 #define get_unaligned(p) (*(p))
 #define put_unaligned(val, p) (*(p) = (val))
--- a/xen/lib/xxhash64.c
+++ b/xen/lib/xxhash64.c
@@ -38,11 +38,13 @@
  * - xxHash source repository: https://github.com/Cyan4973/xxHash
  */
 
+#ifdef __XEN__
 #include <xen/compiler.h>
 #include <xen/errno.h>
 #include <xen/string.h>
 #include <xen/xxhash.h>
 #include <asm/unaligned.h>
+#endif
 
 /*-*************************************
  * Macros


