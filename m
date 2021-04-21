Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCB036691F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:22:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114358.217943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZA02-0000N9-3B; Wed, 21 Apr 2021 10:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114358.217943; Wed, 21 Apr 2021 10:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZA01-0000Mj-VN; Wed, 21 Apr 2021 10:22:25 +0000
Received: by outflank-mailman (input) for mailman id 114358;
 Wed, 21 Apr 2021 10:22:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZA00-0000MP-2I
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:22:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efd1ffa7-ec90-41c9-b8f3-9ba60f5c0a58;
 Wed, 21 Apr 2021 10:22:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 396A7AEE7;
 Wed, 21 Apr 2021 10:22:21 +0000 (UTC)
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
X-Inumbo-ID: efd1ffa7-ec90-41c9-b8f3-9ba60f5c0a58
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619000541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TNwBS5CqZiz6ZS6XTeoRh5oALwnQG2gs/BtgNSkMD0o=;
	b=bkc1DKm2eisfRNGCmFqZ5x9c6qUAglaYTB6Z15IOu/vaVKepu2HE/y1Q3gHeZhkFa0mLEg
	I0mcb44Bb0q3I1NeyGKvY3G5x+0k+Kqt0Bj1P7Vw+5iW+KYfr/fue8ZdHyqfAkXGAFG7pE
	GUj3Zx4pDo/xUgCksKwdn/dIe49iXbQ=
Subject: [PATCH v4 3/3] unzstd: make helper symbols static
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <12054cba-4386-0dbf-46fd-41ace0344f8e@suse.com>
Message-ID: <759c8524-cc01-fac8-bc62-0ba6558477bd@suse.com>
Date: Wed, 21 Apr 2021 12:22:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <12054cba-4386-0dbf-46fd-41ace0344f8e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While for the original library's purposes these functions of course want
to be externally exposed, we don't need this, and we also don't want
this both to prevent unintended use and to keep the name space tidy.
(When functions have no callers at all, wrap them with a suitable
#ifdef.) This has the added benefit of reducing the resulting binary
size - while this is all .init code, it's still desirable to not carry
dead code.

Additionally in the hypervisor we don't need the bulk of unzstd(), so
insert a conditional allowing the compiler to DCE the rest (including
the called functions).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/common/unzstd.c
+++ b/xen/common/unzstd.c
@@ -53,6 +53,10 @@
  *                 <= 22 + (uncompressed_size >> 15) + 131072
  */
 
+#ifdef __XEN__
+#include <xen/lib.h>
+#endif
+
 #include "decompress.h"
 
 #include "zstd/entropy_common.c"
@@ -173,6 +177,11 @@ int __init unzstd(unsigned char *in_buf,
 		return decompress_single(in_buf, in_len, out_buf, out_len,
 					 in_pos, error);
 
+#ifdef __XEN__
+	ASSERT_UNREACHABLE();
+	return -1;
+#endif
+
 	/*
 	 * If in_buf is not provided, we must be using fill(), so allocate
 	 * a large enough buffer. If it is provided, it must be at least
--- a/xen/common/zstd/entropy_common.c
+++ b/xen/common/zstd/entropy_common.c
@@ -45,8 +45,10 @@
 #include "huf.h"
 #include "mem.h"
 
+#ifdef BUILD_DEAD_CODE
 /*===   Version   ===*/
 unsigned __init FSE_versionNumber(void) { return FSE_VERSION_NUMBER; }
+#endif
 
 /*===   Error Management   ===*/
 unsigned __init FSE_isError(size_t code) { return ERR_isError(code); }
--- a/xen/common/zstd/fse.h
+++ b/xen/common/zstd/fse.h
@@ -64,7 +64,7 @@ FSE_PUBLIC_API unsigned FSE_versionNumbe
 FSE_PUBLIC_API size_t FSE_compressBound(size_t size); /* maximum compressed size */
 
 /* Error Management */
-FSE_PUBLIC_API unsigned FSE_isError(size_t code); /* tells if a return value is an error code */
+static unsigned FSE_isError(size_t code); /* tells if a return value is an error code */
 
 /*-*****************************************
 *  FSE detailed API
@@ -173,7 +173,7 @@ If there is an error, the function will
 	@return : size read from 'rBuffer',
 			  or an errorCode, which can be tested using FSE_isError().
 			  maxSymbolValuePtr[0] and tableLogPtr[0] will also be updated with their respective values */
-FSE_PUBLIC_API size_t FSE_readNCount(short *normalizedCounter, unsigned *maxSymbolValuePtr, unsigned *tableLogPtr, const void *rBuffer, size_t rBuffSize);
+static size_t FSE_readNCount(short *normalizedCounter, unsigned *maxSymbolValuePtr, unsigned *tableLogPtr, const void *rBuffer, size_t rBuffSize);
 
 /*! Constructor and Destructor of FSE_DTable.
 	Note that its size depends on 'tableLog' */
@@ -182,14 +182,14 @@ typedef unsigned FSE_DTable; /* don't al
 /*! FSE_buildDTable():
 	Builds 'dt', which must be already allocated, using FSE_createDTable().
 	return : 0, or an errorCode, which can be tested using FSE_isError() */
-FSE_PUBLIC_API size_t FSE_buildDTable_wksp(FSE_DTable *dt, const short *normalizedCounter, unsigned maxSymbolValue, unsigned tableLog, void *workspace, size_t workspaceSize);
+static size_t FSE_buildDTable_wksp(FSE_DTable *dt, const short *normalizedCounter, unsigned maxSymbolValue, unsigned tableLog, void *workspace, size_t workspaceSize);
 
 /*! FSE_decompress_usingDTable():
 	Decompress compressed source `cSrc` of size `cSrcSize` using `dt`
 	into `dst` which must be already allocated.
 	@return : size of regenerated data (necessarily <= `dstCapacity`),
 			  or an errorCode, which can be tested using FSE_isError() */
-FSE_PUBLIC_API size_t FSE_decompress_usingDTable(void *dst, size_t dstCapacity, const void *cSrc, size_t cSrcSize, const FSE_DTable *dt);
+static size_t FSE_decompress_usingDTable(void *dst, size_t dstCapacity, const void *cSrc, size_t cSrcSize, const FSE_DTable *dt);
 
 /*!
 Tutorial :
@@ -273,10 +273,10 @@ size_t FSE_buildCTable_wksp(FSE_CTable *
 size_t FSE_buildDTable_raw(FSE_DTable *dt, unsigned nbBits);
 /**< build a fake FSE_DTable, designed to read a flat distribution where each symbol uses nbBits */
 
-size_t FSE_buildDTable_rle(FSE_DTable *dt, unsigned char symbolValue);
+static size_t FSE_buildDTable_rle(FSE_DTable *dt, unsigned char symbolValue);
 /**< build a fake FSE_DTable, designed to always generate the same symbolValue */
 
-size_t FSE_decompress_wksp(void *dst, size_t dstCapacity, const void *cSrc, size_t cSrcSize, unsigned maxLog, void *workspace, size_t workspaceSize);
+static size_t FSE_decompress_wksp(void *dst, size_t dstCapacity, const void *cSrc, size_t cSrcSize, unsigned maxLog, void *workspace, size_t workspaceSize);
 /**< same as FSE_decompress(), using an externally allocated `workSpace` produced with `FSE_DTABLE_SIZE_U32(maxLog)` */
 
 /* *****************************************
--- a/xen/common/zstd/fse_decompress.c
+++ b/xen/common/zstd/fse_decompress.c
@@ -174,6 +174,7 @@ size_t __init FSE_buildDTable_rle(FSE_DT
 	return 0;
 }
 
+#ifdef BUILD_DEAD_CODE
 size_t __init FSE_buildDTable_raw(FSE_DTable *dt, unsigned nbBits)
 {
 	void *ptr = dt;
@@ -200,6 +201,7 @@ size_t __init FSE_buildDTable_raw(FSE_DT
 
 	return 0;
 }
+#endif
 
 FORCE_INLINE size_t FSE_decompress_usingDTable_generic(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const FSE_DTable *dt,
 						       const unsigned fast)
--- a/xen/common/zstd/huf.h
+++ b/xen/common/zstd/huf.h
@@ -45,7 +45,7 @@
 size_t HUF_compressBound(size_t size); /**< maximum compressed size (worst case) */
 
 /* Error Management */
-unsigned HUF_isError(size_t code); /**< tells if a return value is an error code */
+static unsigned HUF_isError(size_t code); /**< tells if a return value is an error code */
 
 /* ***   Advanced function   *** */
 
@@ -99,12 +99,12 @@ typedef U32 HUF_DTable;
 *  Advanced decompression functions
 ******************************************/
 size_t HUF_decompress4X_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize); /**< decodes RLE and uncompressed */
-size_t HUF_decompress4X_hufOnly_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace,
-				size_t workspaceSize);							       /**< considers RLE and uncompressed as errors */
-size_t HUF_decompress4X2_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace,
-				   size_t workspaceSize); /**< single-symbol decoder */
-size_t HUF_decompress4X4_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace,
-				   size_t workspaceSize); /**< double-symbols decoder */
+static size_t HUF_decompress4X_hufOnly_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace,
+					    size_t workspaceSize);					       /**< considers RLE and uncompressed as errors */
+static size_t HUF_decompress4X2_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace,
+					  size_t workspaceSize); /**< single-symbol decoder */
+static size_t HUF_decompress4X4_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace,
+					  size_t workspaceSize); /**< double-symbols decoder */
 
 /* ****************************************
 *  HUF detailed API
@@ -153,8 +153,8 @@ size_t HUF_buildCTable_wksp(HUF_CElt *tr
 	`huffWeight` is destination buffer.
 	@return : size read from `src` , or an error Code .
 	Note : Needed by HUF_readCTable() and HUF_readDTableXn() . */
-size_t HUF_readStats_wksp(BYTE *huffWeight, size_t hwSize, U32 *rankStats, U32 *nbSymbolsPtr, U32 *tableLogPtr, const void *src, size_t srcSize,
-			  void *workspace, size_t workspaceSize);
+static size_t HUF_readStats_wksp(BYTE *huffWeight, size_t hwSize, U32 *rankStats, U32 *nbSymbolsPtr, U32 *tableLogPtr, const void *src, size_t srcSize,
+				 void *workspace, size_t workspaceSize);
 
 /** HUF_readCTable() :
 *   Loading a CTable saved with HUF_writeCTable() */
@@ -172,12 +172,12 @@ HUF_decompress() does the following:
 *   based on a set of pre-determined metrics.
 *   @return : 0==HUF_decompress4X2, 1==HUF_decompress4X4 .
 *   Assumption : 0 < cSrcSize < dstSize <= 128 KB */
-U32 HUF_selectDecoder(size_t dstSize, size_t cSrcSize);
+static U32 HUF_selectDecoder(size_t dstSize, size_t cSrcSize);
 
-size_t HUF_readDTableX2_wksp(HUF_DTable *DTable, const void *src, size_t srcSize, void *workspace, size_t workspaceSize);
-size_t HUF_readDTableX4_wksp(HUF_DTable *DTable, const void *src, size_t srcSize, void *workspace, size_t workspaceSize);
+static size_t HUF_readDTableX2_wksp(HUF_DTable *DTable, const void *src, size_t srcSize, void *workspace, size_t workspaceSize);
+static size_t HUF_readDTableX4_wksp(HUF_DTable *DTable, const void *src, size_t srcSize, void *workspace, size_t workspaceSize);
 
-size_t HUF_decompress4X_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable);
+static size_t HUF_decompress4X_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable);
 size_t HUF_decompress4X2_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable);
 size_t HUF_decompress4X4_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable);
 
@@ -196,13 +196,13 @@ size_t HUF_compress1X_repeat(void *dst,
 			     int preferRepeat); /**< `workSpace` must be a table of at least HUF_COMPRESS_WORKSPACE_SIZE_U32 unsigned */
 
 size_t HUF_decompress1X_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize);
-size_t HUF_decompress1X2_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace,
-				   size_t workspaceSize); /**< single-symbol decoder */
+static size_t HUF_decompress1X2_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace,
+					  size_t workspaceSize); /**< single-symbol decoder */
 size_t HUF_decompress1X4_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace,
 				   size_t workspaceSize); /**< double-symbols decoder */
 
-size_t HUF_decompress1X_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize,
-				    const HUF_DTable *DTable); /**< automatic selection of sing or double symbol decoder, based on DTable */
+static size_t HUF_decompress1X_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize,
+					   const HUF_DTable *DTable); /**< automatic selection of sing or double symbol decoder, based on DTable */
 size_t HUF_decompress1X2_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable);
 size_t HUF_decompress1X4_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable);
 
--- a/xen/common/zstd/huf_decompress.c
+++ b/xen/common/zstd/huf_decompress.c
@@ -218,6 +218,7 @@ static size_t __init HUF_decompress1X2_u
 	return dstSize;
 }
 
+#ifdef BUILD_DEAD_CODE
 size_t __init HUF_decompress1X2_usingDTable(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
 {
 	DTableDesc dtd = HUF_getDTableDesc(DTable);
@@ -225,6 +226,7 @@ size_t __init HUF_decompress1X2_usingDTa
 		return ERROR(GENERIC);
 	return HUF_decompress1X2_usingDTable_internal(dst, dstSize, cSrc, cSrcSize, DTable);
 }
+#endif
 
 size_t __init HUF_decompress1X2_DCtx_wksp(HUF_DTable *DCtx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
 {
@@ -349,6 +351,7 @@ static size_t __init HUF_decompress4X2_u
 	}
 }
 
+#ifdef BUILD_DEAD_CODE
 size_t __init HUF_decompress4X2_usingDTable(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
 {
 	DTableDesc dtd = HUF_getDTableDesc(DTable);
@@ -356,6 +359,7 @@ size_t __init HUF_decompress4X2_usingDTa
 		return ERROR(GENERIC);
 	return HUF_decompress4X2_usingDTable_internal(dst, dstSize, cSrc, cSrcSize, DTable);
 }
+#endif
 
 size_t __init HUF_decompress4X2_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
 {
@@ -679,6 +683,7 @@ static size_t __init HUF_decompress1X4_u
 	return dstSize;
 }
 
+#ifdef BUILD_DEAD_CODE
 size_t __init HUF_decompress1X4_usingDTable(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
 {
 	DTableDesc dtd = HUF_getDTableDesc(DTable);
@@ -701,6 +706,7 @@ size_t __init HUF_decompress1X4_DCtx_wks
 
 	return HUF_decompress1X4_usingDTable_internal(dst, dstSize, ip, cSrcSize, DCtx);
 }
+#endif
 
 static size_t __init HUF_decompress4X4_usingDTable_internal(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
 {
@@ -812,6 +818,7 @@ static size_t __init HUF_decompress4X4_u
 	}
 }
 
+#ifdef BUILD_DEAD_CODE
 size_t __init HUF_decompress4X4_usingDTable(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
 {
 	DTableDesc dtd = HUF_getDTableDesc(DTable);
@@ -819,6 +826,7 @@ size_t __init HUF_decompress4X4_usingDTa
 		return ERROR(GENERIC);
 	return HUF_decompress4X4_usingDTable_internal(dst, dstSize, cSrc, cSrcSize, DTable);
 }
+#endif
 
 size_t __init HUF_decompress4X4_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
 {
@@ -896,6 +904,7 @@ U32 __init HUF_selectDecoder(size_t dstS
 
 typedef size_t (*decompressionAlgo)(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize);
 
+#ifdef BUILD_DEAD_CODE
 size_t __init HUF_decompress4X_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
 {
 	/* validation checks */
@@ -918,6 +927,7 @@ size_t __init HUF_decompress4X_DCtx_wksp
 			      : HUF_decompress4X2_DCtx_wksp(dctx, dst, dstSize, cSrc, cSrcSize, workspace, workspaceSize);
 	}
 }
+#endif
 
 size_t __init HUF_decompress4X_hufOnly_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
 {
@@ -934,6 +944,7 @@ size_t __init HUF_decompress4X_hufOnly_w
 	}
 }
 
+#ifdef BUILD_DEAD_CODE
 size_t __init HUF_decompress1X_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
 {
 	/* validation checks */
@@ -956,3 +967,4 @@ size_t __init HUF_decompress1X_DCtx_wksp
 			      : HUF_decompress1X2_DCtx_wksp(dctx, dst, dstSize, cSrc, cSrcSize, workspace, workspaceSize);
 	}
 }
+#endif
--- a/xen/common/zstd/zstd_common.c
+++ b/xen/common/zstd/zstd_common.c
@@ -47,12 +47,14 @@ ZSTD_customMem __init ZSTD_initStack(voi
 	return stackMem;
 }
 
+#ifdef BUILD_DEAD_CODE
 void *__init ZSTD_stackAllocAll(void *opaque, size_t *size)
 {
 	ZSTD_stack *stack = (ZSTD_stack *)opaque;
 	*size = (BYTE const *)stack->end - (BYTE *)ZSTD_PTR_ALIGN(stack->ptr);
 	return stack_push(stack, *size);
 }
+#endif
 
 void *__init ZSTD_stackAlloc(void *opaque, size_t size)
 {
--- a/xen/common/zstd/zstd_internal.h
+++ b/xen/common/zstd/zstd_internal.h
@@ -324,7 +324,7 @@ typedef struct {
 
 const seqStore_t *ZSTD_getSeqStore(const ZSTD_CCtx *ctx);
 void ZSTD_seqToCodes(const seqStore_t *seqStorePtr);
-int ZSTD_isSkipFrame(ZSTD_DCtx *dctx);
+static int ZSTD_isSkipFrame(ZSTD_DCtx *dctx);
 
 /*= Custom memory allocation functions */
 typedef void *(*ZSTD_allocFunction)(void *opaque, size_t size);
@@ -335,8 +335,8 @@ typedef struct {
 	void *opaque;
 } ZSTD_customMem;
 
-void *ZSTD_malloc(size_t size, ZSTD_customMem customMem);
-void ZSTD_free(void *ptr, ZSTD_customMem customMem);
+static void *ZSTD_malloc(size_t size, ZSTD_customMem customMem);
+static void ZSTD_free(void *ptr, ZSTD_customMem customMem);
 
 /*====== stack allocation  ======*/
 
@@ -348,11 +348,11 @@ typedef struct {
 #define ZSTD_ALIGN(x) ALIGN(x, sizeof(size_t))
 #define ZSTD_PTR_ALIGN(p) PTR_ALIGN(p, sizeof(size_t))
 
-ZSTD_customMem ZSTD_initStack(void *workspace, size_t workspaceSize);
+static ZSTD_customMem ZSTD_initStack(void *workspace, size_t workspaceSize);
 
 void *ZSTD_stackAllocAll(void *opaque, size_t *size);
-void *ZSTD_stackAlloc(void *opaque, size_t size);
-void ZSTD_stackFree(void *opaque, void *address);
+static void *ZSTD_stackAlloc(void *opaque, size_t size);
+static void ZSTD_stackFree(void *opaque, void *address);
 
 /*======  common function  ======*/
 
@@ -367,10 +367,10 @@ ZSTD_STATIC U32 ZSTD_highbit32(U32 val)
 void ZSTD_invalidateRepCodes(ZSTD_CCtx *cctx);
 
 size_t ZSTD_freeCCtx(ZSTD_CCtx *cctx);
-size_t ZSTD_freeDCtx(ZSTD_DCtx *dctx);
+static size_t ZSTD_freeDCtx(ZSTD_DCtx *dctx);
 size_t ZSTD_freeCDict(ZSTD_CDict *cdict);
-size_t ZSTD_freeDDict(ZSTD_DDict *cdict);
+static size_t ZSTD_freeDDict(ZSTD_DDict *cdict);
 size_t ZSTD_freeCStream(ZSTD_CStream *zcs);
-size_t ZSTD_freeDStream(ZSTD_DStream *zds);
+static size_t ZSTD_freeDStream(ZSTD_DStream *zds);
 
 #endif /* ZSTD_CCOMMON_H_MODULE */


