Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2109A2F7637
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 11:07:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67893.121386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0M0d-0004c2-7L; Fri, 15 Jan 2021 10:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67893.121386; Fri, 15 Jan 2021 10:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0M0d-0004bc-3A; Fri, 15 Jan 2021 10:07:11 +0000
Received: by outflank-mailman (input) for mailman id 67893;
 Fri, 15 Jan 2021 10:07:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0M0a-0004bR-Ls
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 10:07:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 495a88c9-24cc-49ac-96a1-ce601155eb9b;
 Fri, 15 Jan 2021 10:06:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85F72AA6F;
 Fri, 15 Jan 2021 10:06:52 +0000 (UTC)
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
X-Inumbo-ID: 495a88c9-24cc-49ac-96a1-ce601155eb9b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610705213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WAdqMfo5rFU9hTbN0imPY6eTCcW9CYfVoaPsXdT5fUU=;
	b=uZXM78SivBsr0OYibEND6vgmy8dPVWfJw2p5qOeu60AJjlGXLfWodc608q3q8aWxp+9Xi8
	CZBDq64z5UOGtkAgFBbmyuI9PZiuvJKx89V4XM2LqY8nk6Qn8efq8oKIOkvJyGc00GYrym
	JFeXHOvX9fBgyWKHV2JvQTA9/s3JbQQ=
Subject: [PATCH 3/3] x86/Dom0: support zstd compressed kernels
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, M A Young <m.a.young@durham.ac.uk>
References: <0eba95b9-66eb-2692-1da1-c27784b9f51e@suse.com>
Message-ID: <09a4795b-0d9f-a078-63e6-22d5aaa1878b@suse.com>
Date: Fri, 15 Jan 2021 11:06:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <0eba95b9-66eb-2692-1da1-c27784b9f51e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Taken from Linux at commit 1c4dd334df3a ("lib: decompress_unzstd: Limit
output size") for unzstd.c (renamed from decompress_unzstd.c) and
36f9ff9e03de ("lib: Fix fall-through warnings for Clang") for zstd/,
with bits from linux/zstd.h merged into suitable other headers.

To limit the editing necessary, introduce ptrdiff_t.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -55,7 +55,7 @@ obj-bin-y += warning.init.o
 obj-$(CONFIG_XENOPROF) += xenoprof.o
 obj-y += xmalloc_tlsf.o
 
-obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 earlycpio,$(n).init.o)
+obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
 
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o kernel.o memory.o multicall.o xlat.o)
 
--- a/xen/common/decompress.c
+++ b/xen/common/decompress.c
@@ -31,5 +31,8 @@ int __init decompress(void *inbuf, unsig
     if ( len >= 2 && !memcmp(inbuf, "\x02\x21", 2) )
 	return unlz4(inbuf, len, NULL, NULL, outbuf, NULL, error);
 
+    if ( len >= 4 && !memcmp(inbuf, "\x28\xb5\x2f\xfd", 4) )
+	return unzstd(inbuf, len, NULL, NULL, outbuf, NULL, error);
+
     return 1;
 }
--- /dev/null
+++ b/xen/common/unzstd.c
@@ -0,0 +1,308 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Important notes about in-place decompression
+ *
+ * At least on x86, the kernel is decompressed in place: the compressed data
+ * is placed to the end of the output buffer, and the decompressor overwrites
+ * most of the compressed data. There must be enough safety margin to
+ * guarantee that the write position is always behind the read position.
+ *
+ * The safety margin for ZSTD with a 128 KB block size is calculated below.
+ * Note that the margin with ZSTD is bigger than with GZIP or XZ!
+ *
+ * The worst case for in-place decompression is that the beginning of
+ * the file is compressed extremely well, and the rest of the file is
+ * uncompressible. Thus, we must look for worst-case expansion when the
+ * compressor is encoding uncompressible data.
+ *
+ * The structure of the .zst file in case of a compresed kernel is as follows.
+ * Maximum sizes (as bytes) of the fields are in parenthesis.
+ *
+ *    Frame Header: (18)
+ *    Blocks: (N)
+ *    Checksum: (4)
+ *
+ * The frame header and checksum overhead is at most 22 bytes.
+ *
+ * ZSTD stores the data in blocks. Each block has a header whose size is
+ * a 3 bytes. After the block header, there is up to 128 KB of payload.
+ * The maximum uncompressed size of the payload is 128 KB. The minimum
+ * uncompressed size of the payload is never less than the payload size
+ * (excluding the block header).
+ *
+ * The assumption, that the uncompressed size of the payload is never
+ * smaller than the payload itself, is valid only when talking about
+ * the payload as a whole. It is possible that the payload has parts where
+ * the decompressor consumes more input than it produces output. Calculating
+ * the worst case for this would be tricky. Instead of trying to do that,
+ * let's simply make sure that the decompressor never overwrites any bytes
+ * of the payload which it is currently reading.
+ *
+ * Now we have enough information to calculate the safety margin. We need
+ *   - 22 bytes for the .zst file format headers;
+ *   - 3 bytes per every 128 KiB of uncompressed size (one block header per
+ *     block); and
+ *   - 128 KiB (biggest possible zstd block size) to make sure that the
+ *     decompressor never overwrites anything from the block it is currently
+ *     reading.
+ *
+ * We get the following formula:
+ *
+ *    safety_margin = 22 + uncompressed_size * 3 / 131072 + 131072
+ *                 <= 22 + (uncompressed_size >> 15) + 131072
+ */
+
+#include "decompress.h"
+
+#include "zstd/entropy_common.c"
+#include "zstd/fse_decompress.c"
+#include "zstd/huf_decompress.c"
+#include "zstd/zstd_common.c"
+#include "zstd/decompress.c"
+
+/* 128MB is the maximum window size supported by zstd. */
+#define ZSTD_WINDOWSIZE_MAX	(1 << ZSTD_WINDOWLOG_MAX)
+/*
+ * Size of the input and output buffers in multi-call mode.
+ * Pick a larger size because it isn't used during kernel decompression,
+ * since that is single pass, and we have to allocate a large buffer for
+ * zstd's window anyway. The larger size speeds up initramfs decompression.
+ */
+#define ZSTD_IOBUF_SIZE		(1 << 17)
+
+static int INIT handle_zstd_error(size_t ret, void (*error)(const char *x))
+{
+	const int err = ZSTD_getErrorCode(ret);
+
+	if (!ZSTD_isError(ret))
+		return 0;
+
+	switch (err) {
+	case ZSTD_error_memory_allocation:
+		error("ZSTD decompressor ran out of memory");
+		break;
+	case ZSTD_error_prefix_unknown:
+		error("Input is not in the ZSTD format (wrong magic bytes)");
+		break;
+	case ZSTD_error_dstSize_tooSmall:
+	case ZSTD_error_corruption_detected:
+	case ZSTD_error_checksum_wrong:
+		error("ZSTD-compressed data is corrupt");
+		break;
+	default:
+		error("ZSTD-compressed data is probably corrupt");
+		break;
+	}
+	return -1;
+}
+
+/*
+ * Handle the case where we have the entire input and output in one segment.
+ * We can allocate less memory (no circular buffer for the sliding window),
+ * and avoid some memcpy() calls.
+ */
+static int INIT decompress_single(const u8 *in_buf, long in_len, u8 *out_buf,
+				  long out_len, unsigned int *in_pos,
+				  void (*error)(const char *x))
+{
+	const size_t wksp_size = ZSTD_DCtxWorkspaceBound();
+	void *wksp = large_malloc(wksp_size);
+	ZSTD_DCtx *dctx = ZSTD_initDCtx(wksp, wksp_size);
+	int err;
+	size_t ret;
+
+	if (dctx == NULL) {
+		error("Out of memory while allocating ZSTD_DCtx");
+		err = -1;
+		goto out;
+	}
+	/*
+	 * Find out how large the frame actually is, there may be junk at
+	 * the end of the frame that ZSTD_decompressDCtx() can't handle.
+	 */
+	ret = ZSTD_findFrameCompressedSize(in_buf, in_len);
+	err = handle_zstd_error(ret, error);
+	if (err)
+		goto out;
+	in_len = (long)ret;
+
+	ret = ZSTD_decompressDCtx(dctx, out_buf, out_len, in_buf, in_len);
+	err = handle_zstd_error(ret, error);
+	if (err)
+		goto out;
+
+	if (in_pos != NULL)
+		*in_pos = in_len;
+
+	err = 0;
+out:
+	if (wksp != NULL)
+		large_free(wksp);
+	return err;
+}
+
+STATIC int INIT unzstd(unsigned char *in_buf, unsigned int in_len,
+		       int (*fill)(void*, unsigned int),
+		       int (*flush)(void*, unsigned int),
+		       unsigned char *out_buf,
+		       unsigned int *in_pos,
+		       void (*error)(const char *x))
+{
+	ZSTD_inBuffer in;
+	ZSTD_outBuffer out;
+	ZSTD_frameParams params;
+	void *in_allocated = NULL;
+	void *out_allocated = NULL;
+	void *wksp = NULL;
+	size_t wksp_size;
+	ZSTD_DStream *dstream;
+	int err;
+	size_t ret;
+	/*
+	 * ZSTD decompression code won't be happy if the buffer size is so big
+	 * that its end address overflows. When the size is not provided, make
+	 * it as big as possible without having the end address overflow.
+	 */
+	unsigned long out_len = ULONG_MAX - (unsigned long)out_buf;
+
+	if (fill == NULL && flush == NULL)
+		/*
+		 * We can decompress faster and with less memory when we have a
+		 * single chunk.
+		 */
+		return decompress_single(in_buf, in_len, out_buf, out_len,
+					 in_pos, error);
+
+	/*
+	 * If in_buf is not provided, we must be using fill(), so allocate
+	 * a large enough buffer. If it is provided, it must be at least
+	 * ZSTD_IOBUF_SIZE large.
+	 */
+	if (in_buf == NULL) {
+		in_allocated = large_malloc(ZSTD_IOBUF_SIZE);
+		if (in_allocated == NULL) {
+			error("Out of memory while allocating input buffer");
+			err = -1;
+			goto out;
+		}
+		in_buf = in_allocated;
+		in_len = 0;
+	}
+	/* Read the first chunk, since we need to decode the frame header. */
+	if (fill != NULL)
+		in_len = fill(in_buf, ZSTD_IOBUF_SIZE);
+	if ((int)in_len < 0) {
+		error("ZSTD-compressed data is truncated");
+		err = -1;
+		goto out;
+	}
+	/* Set the first non-empty input buffer. */
+	in.src = in_buf;
+	in.pos = 0;
+	in.size = in_len;
+	/* Allocate the output buffer if we are using flush(). */
+	if (flush != NULL) {
+		out_allocated = large_malloc(ZSTD_IOBUF_SIZE);
+		if (out_allocated == NULL) {
+			error("Out of memory while allocating output buffer");
+			err = -1;
+			goto out;
+		}
+		out_buf = out_allocated;
+		out_len = ZSTD_IOBUF_SIZE;
+	}
+	/* Set the output buffer. */
+	out.dst = out_buf;
+	out.pos = 0;
+	out.size = out_len;
+
+	/*
+	 * We need to know the window size to allocate the ZSTD_DStream.
+	 * Since we are streaming, we need to allocate a buffer for the sliding
+	 * window. The window size varies from 1 KB to ZSTD_WINDOWSIZE_MAX
+	 * (8 MB), so it is important to use the actual value so as not to
+	 * waste memory when it is smaller.
+	 */
+	ret = ZSTD_getFrameParams(&params, in.src, in.size);
+	err = handle_zstd_error(ret, error);
+	if (err)
+		goto out;
+	if (ret != 0) {
+		error("ZSTD-compressed data has an incomplete frame header");
+		err = -1;
+		goto out;
+	}
+	if (params.windowSize > ZSTD_WINDOWSIZE_MAX) {
+		error("ZSTD-compressed data has too large a window size");
+		err = -1;
+		goto out;
+	}
+
+	/*
+	 * Allocate the ZSTD_DStream now that we know how much memory is
+	 * required.
+	 */
+	wksp_size = ZSTD_DStreamWorkspaceBound(params.windowSize);
+	wksp = large_malloc(wksp_size);
+	dstream = ZSTD_initDStream(params.windowSize, wksp, wksp_size);
+	if (dstream == NULL) {
+		error("Out of memory while allocating ZSTD_DStream");
+		err = -1;
+		goto out;
+	}
+
+	/*
+	 * Decompression loop:
+	 * Read more data if necessary (error if no more data can be read).
+	 * Call the decompression function, which returns 0 when finished.
+	 * Flush any data produced if using flush().
+	 */
+	if (in_pos != NULL)
+		*in_pos = 0;
+	do {
+		/*
+		 * If we need to reload data, either we have fill() and can
+		 * try to get more data, or we don't and the input is truncated.
+		 */
+		if (in.pos == in.size) {
+			if (in_pos != NULL)
+				*in_pos += in.pos;
+			in_len = fill ? fill(in_buf, ZSTD_IOBUF_SIZE) : -1;
+			if ((int)in_len < 0) {
+				error("ZSTD-compressed data is truncated");
+				err = -1;
+				goto out;
+			}
+			in.pos = 0;
+			in.size = in_len;
+		}
+		/* Returns zero when the frame is complete. */
+		ret = ZSTD_decompressStream(dstream, &out, &in);
+		err = handle_zstd_error(ret, error);
+		if (err)
+			goto out;
+		/* Flush all of the data produced if using flush(). */
+		if (flush != NULL && out.pos > 0) {
+			if (out.pos != flush(out.dst, out.pos)) {
+				error("Failed to flush()");
+				err = -1;
+				goto out;
+			}
+			out.pos = 0;
+		}
+	} while (ret != 0);
+
+	if (in_pos != NULL)
+		*in_pos += in.pos;
+
+	err = 0;
+out:
+	if (in_allocated != NULL)
+		large_free(in_allocated);
+	if (out_allocated != NULL)
+		large_free(out_allocated);
+	if (wksp != NULL)
+		large_free(wksp);
+	return err;
+}
--- /dev/null
+++ b/xen/common/zstd/bitstream.h
@@ -0,0 +1,380 @@
+/*
+ * bitstream
+ * Part of FSE library
+ * header file (to include)
+ * Copyright (C) 2013-2016, Yann Collet.
+ *
+ * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are
+ * met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ * notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above
+ * copyright notice, this list of conditions and the following disclaimer
+ * in the documentation and/or other materials provided with the
+ * distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation. This program is dual-licensed; you may select
+ * either version 2 of the GNU General Public License ("GPL") or BSD license
+ * ("BSD").
+ *
+ * You can contact the author at :
+ * - Source repository : https://github.com/Cyan4973/FiniteStateEntropy
+ */
+#ifndef BITSTREAM_H_MODULE
+#define BITSTREAM_H_MODULE
+
+/*
+*  This API consists of small unitary functions, which must be inlined for best performance.
+*  Since link-time-optimization is not available for all compilers,
+*  these functions are defined into a .h to be included.
+*/
+
+/*-****************************************
+*  Dependencies
+******************************************/
+#include "error_private.h" /* error codes and messages */
+#include "mem.h"	   /* unaligned access routines */
+
+/*=========================================
+*  Target specific
+=========================================*/
+#define STREAM_ACCUMULATOR_MIN_32 25
+#define STREAM_ACCUMULATOR_MIN_64 57
+#define STREAM_ACCUMULATOR_MIN ((U32)(ZSTD_32bits() ? STREAM_ACCUMULATOR_MIN_32 : STREAM_ACCUMULATOR_MIN_64))
+
+/*-******************************************
+*  bitStream encoding API (write forward)
+********************************************/
+/* bitStream can mix input from multiple sources.
+*  A critical property of these streams is that they encode and decode in **reverse** direction.
+*  So the first bit sequence you add will be the last to be read, like a LIFO stack.
+*/
+typedef struct {
+	size_t bitContainer;
+	int bitPos;
+	char *startPtr;
+	char *ptr;
+	char *endPtr;
+} BIT_CStream_t;
+
+ZSTD_STATIC size_t BIT_initCStream(BIT_CStream_t *bitC, void *dstBuffer, size_t dstCapacity);
+ZSTD_STATIC void BIT_addBits(BIT_CStream_t *bitC, size_t value, unsigned nbBits);
+ZSTD_STATIC void BIT_flushBits(BIT_CStream_t *bitC);
+ZSTD_STATIC size_t BIT_closeCStream(BIT_CStream_t *bitC);
+
+/* Start with initCStream, providing the size of buffer to write into.
+*  bitStream will never write outside of this buffer.
+*  `dstCapacity` must be >= sizeof(bitD->bitContainer), otherwise @return will be an error code.
+*
+*  bits are first added to a local register.
+*  Local register is size_t, hence 64-bits on 64-bits systems, or 32-bits on 32-bits systems.
+*  Writing data into memory is an explicit operation, performed by the flushBits function.
+*  Hence keep track how many bits are potentially stored into local register to avoid register overflow.
+*  After a flushBits, a maximum of 7 bits might still be stored into local register.
+*
+*  Avoid storing elements of more than 24 bits if you want compatibility with 32-bits bitstream readers.
+*
+*  Last operation is to close the bitStream.
+*  The function returns the final size of CStream in bytes.
+*  If data couldn't fit into `dstBuffer`, it will return a 0 ( == not storable)
+*/
+
+/*-********************************************
+*  bitStream decoding API (read backward)
+**********************************************/
+typedef struct {
+	size_t bitContainer;
+	unsigned bitsConsumed;
+	const char *ptr;
+	const char *start;
+} BIT_DStream_t;
+
+typedef enum {
+	BIT_DStream_unfinished = 0,
+	BIT_DStream_endOfBuffer = 1,
+	BIT_DStream_completed = 2,
+	BIT_DStream_overflow = 3
+} BIT_DStream_status; /* result of BIT_reloadDStream() */
+/* 1,2,4,8 would be better for bitmap combinations, but slows down performance a bit ... :( */
+
+ZSTD_STATIC size_t BIT_initDStream(BIT_DStream_t *bitD, const void *srcBuffer, size_t srcSize);
+ZSTD_STATIC size_t BIT_readBits(BIT_DStream_t *bitD, unsigned nbBits);
+ZSTD_STATIC BIT_DStream_status BIT_reloadDStream(BIT_DStream_t *bitD);
+ZSTD_STATIC unsigned BIT_endOfDStream(const BIT_DStream_t *bitD);
+
+/* Start by invoking BIT_initDStream().
+*  A chunk of the bitStream is then stored into a local register.
+*  Local register size is 64-bits on 64-bits systems, 32-bits on 32-bits systems (size_t).
+*  You can then retrieve bitFields stored into the local register, **in reverse order**.
+*  Local register is explicitly reloaded from memory by the BIT_reloadDStream() method.
+*  A reload guarantee a minimum of ((8*sizeof(bitD->bitContainer))-7) bits when its result is BIT_DStream_unfinished.
+*  Otherwise, it can be less than that, so proceed accordingly.
+*  Checking if DStream has reached its end can be performed with BIT_endOfDStream().
+*/
+
+/*-****************************************
+*  unsafe API
+******************************************/
+ZSTD_STATIC void BIT_addBitsFast(BIT_CStream_t *bitC, size_t value, unsigned nbBits);
+/* faster, but works only if value is "clean", meaning all high bits above nbBits are 0 */
+
+ZSTD_STATIC void BIT_flushBitsFast(BIT_CStream_t *bitC);
+/* unsafe version; does not check buffer overflow */
+
+ZSTD_STATIC size_t BIT_readBitsFast(BIT_DStream_t *bitD, unsigned nbBits);
+/* faster, but works only if nbBits >= 1 */
+
+/*-**************************************************************
+*  Internal functions
+****************************************************************/
+ZSTD_STATIC unsigned BIT_highbit32(register U32 val) { return 31 - __builtin_clz(val); }
+
+/*=====    Local Constants   =====*/
+static const unsigned BIT_mask[] = {0,       1,       3,       7,	0xF,      0x1F,     0x3F,     0x7F,      0xFF,
+				    0x1FF,   0x3FF,   0x7FF,   0xFFF,    0x1FFF,   0x3FFF,   0x7FFF,   0xFFFF,    0x1FFFF,
+				    0x3FFFF, 0x7FFFF, 0xFFFFF, 0x1FFFFF, 0x3FFFFF, 0x7FFFFF, 0xFFFFFF, 0x1FFFFFF, 0x3FFFFFF}; /* up to 26 bits */
+
+/*-**************************************************************
+*  bitStream encoding
+****************************************************************/
+/*! BIT_initCStream() :
+ *  `dstCapacity` must be > sizeof(void*)
+ *  @return : 0 if success,
+			  otherwise an error code (can be tested using ERR_isError() ) */
+ZSTD_STATIC size_t BIT_initCStream(BIT_CStream_t *bitC, void *startPtr, size_t dstCapacity)
+{
+	bitC->bitContainer = 0;
+	bitC->bitPos = 0;
+	bitC->startPtr = (char *)startPtr;
+	bitC->ptr = bitC->startPtr;
+	bitC->endPtr = bitC->startPtr + dstCapacity - sizeof(bitC->ptr);
+	if (dstCapacity <= sizeof(bitC->ptr))
+		return ERROR(dstSize_tooSmall);
+	return 0;
+}
+
+/*! BIT_addBits() :
+	can add up to 26 bits into `bitC`.
+	Does not check for register overflow ! */
+ZSTD_STATIC void BIT_addBits(BIT_CStream_t *bitC, size_t value, unsigned nbBits)
+{
+	bitC->bitContainer |= (value & BIT_mask[nbBits]) << bitC->bitPos;
+	bitC->bitPos += nbBits;
+}
+
+/*! BIT_addBitsFast() :
+ *  works only if `value` is _clean_, meaning all high bits above nbBits are 0 */
+ZSTD_STATIC void BIT_addBitsFast(BIT_CStream_t *bitC, size_t value, unsigned nbBits)
+{
+	bitC->bitContainer |= value << bitC->bitPos;
+	bitC->bitPos += nbBits;
+}
+
+/*! BIT_flushBitsFast() :
+ *  unsafe version; does not check buffer overflow */
+ZSTD_STATIC void BIT_flushBitsFast(BIT_CStream_t *bitC)
+{
+	size_t const nbBytes = bitC->bitPos >> 3;
+	ZSTD_writeLEST(bitC->ptr, bitC->bitContainer);
+	bitC->ptr += nbBytes;
+	bitC->bitPos &= 7;
+	bitC->bitContainer >>= nbBytes * 8; /* if bitPos >= sizeof(bitContainer)*8 --> undefined behavior */
+}
+
+/*! BIT_flushBits() :
+ *  safe version; check for buffer overflow, and prevents it.
+ *  note : does not signal buffer overflow. This will be revealed later on using BIT_closeCStream() */
+ZSTD_STATIC void BIT_flushBits(BIT_CStream_t *bitC)
+{
+	size_t const nbBytes = bitC->bitPos >> 3;
+	ZSTD_writeLEST(bitC->ptr, bitC->bitContainer);
+	bitC->ptr += nbBytes;
+	if (bitC->ptr > bitC->endPtr)
+		bitC->ptr = bitC->endPtr;
+	bitC->bitPos &= 7;
+	bitC->bitContainer >>= nbBytes * 8; /* if bitPos >= sizeof(bitContainer)*8 --> undefined behavior */
+}
+
+/*! BIT_closeCStream() :
+ *  @return : size of CStream, in bytes,
+			  or 0 if it could not fit into dstBuffer */
+ZSTD_STATIC size_t BIT_closeCStream(BIT_CStream_t *bitC)
+{
+	BIT_addBitsFast(bitC, 1, 1); /* endMark */
+	BIT_flushBits(bitC);
+
+	if (bitC->ptr >= bitC->endPtr)
+		return 0; /* doesn't fit within authorized budget : cancel */
+
+	return (bitC->ptr - bitC->startPtr) + (bitC->bitPos > 0);
+}
+
+/*-********************************************************
+* bitStream decoding
+**********************************************************/
+/*! BIT_initDStream() :
+*   Initialize a BIT_DStream_t.
+*   `bitD` : a pointer to an already allocated BIT_DStream_t structure.
+*   `srcSize` must be the *exact* size of the bitStream, in bytes.
+*   @return : size of stream (== srcSize) or an errorCode if a problem is detected
+*/
+ZSTD_STATIC size_t BIT_initDStream(BIT_DStream_t *bitD, const void *srcBuffer, size_t srcSize)
+{
+	if (srcSize < 1) {
+		memset(bitD, 0, sizeof(*bitD));
+		return ERROR(srcSize_wrong);
+	}
+
+	if (srcSize >= sizeof(bitD->bitContainer)) { /* normal case */
+		bitD->start = (const char *)srcBuffer;
+		bitD->ptr = (const char *)srcBuffer + srcSize - sizeof(bitD->bitContainer);
+		bitD->bitContainer = ZSTD_readLEST(bitD->ptr);
+		{
+			BYTE const lastByte = ((const BYTE *)srcBuffer)[srcSize - 1];
+			bitD->bitsConsumed = lastByte ? 8 - BIT_highbit32(lastByte) : 0; /* ensures bitsConsumed is always set */
+			if (lastByte == 0)
+				return ERROR(GENERIC); /* endMark not present */
+		}
+	} else {
+		bitD->start = (const char *)srcBuffer;
+		bitD->ptr = bitD->start;
+		bitD->bitContainer = *(const BYTE *)(bitD->start);
+		switch (srcSize) {
+		case 7: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[6]) << (sizeof(bitD->bitContainer) * 8 - 16);
+			/* fallthrough */
+		case 6: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[5]) << (sizeof(bitD->bitContainer) * 8 - 24);
+			/* fallthrough */
+		case 5: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[4]) << (sizeof(bitD->bitContainer) * 8 - 32);
+			/* fallthrough */
+		case 4: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[3]) << 24;
+			/* fallthrough */
+		case 3: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[2]) << 16;
+			/* fallthrough */
+		case 2: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[1]) << 8;
+			/* fallthrough */
+		default:;
+		}
+		{
+			BYTE const lastByte = ((const BYTE *)srcBuffer)[srcSize - 1];
+			bitD->bitsConsumed = lastByte ? 8 - BIT_highbit32(lastByte) : 0;
+			if (lastByte == 0)
+				return ERROR(GENERIC); /* endMark not present */
+		}
+		bitD->bitsConsumed += (U32)(sizeof(bitD->bitContainer) - srcSize) * 8;
+	}
+
+	return srcSize;
+}
+
+ZSTD_STATIC size_t BIT_getUpperBits(size_t bitContainer, U32 const start) { return bitContainer >> start; }
+
+ZSTD_STATIC size_t BIT_getMiddleBits(size_t bitContainer, U32 const start, U32 const nbBits) { return (bitContainer >> start) & BIT_mask[nbBits]; }
+
+ZSTD_STATIC size_t BIT_getLowerBits(size_t bitContainer, U32 const nbBits) { return bitContainer & BIT_mask[nbBits]; }
+
+/*! BIT_lookBits() :
+ *  Provides next n bits from local register.
+ *  local register is not modified.
+ *  On 32-bits, maxNbBits==24.
+ *  On 64-bits, maxNbBits==56.
+ *  @return : value extracted
+ */
+ZSTD_STATIC size_t BIT_lookBits(const BIT_DStream_t *bitD, U32 nbBits)
+{
+	U32 const bitMask = sizeof(bitD->bitContainer) * 8 - 1;
+	return ((bitD->bitContainer << (bitD->bitsConsumed & bitMask)) >> 1) >> ((bitMask - nbBits) & bitMask);
+}
+
+/*! BIT_lookBitsFast() :
+*   unsafe version; only works only if nbBits >= 1 */
+ZSTD_STATIC size_t BIT_lookBitsFast(const BIT_DStream_t *bitD, U32 nbBits)
+{
+	U32 const bitMask = sizeof(bitD->bitContainer) * 8 - 1;
+	return (bitD->bitContainer << (bitD->bitsConsumed & bitMask)) >> (((bitMask + 1) - nbBits) & bitMask);
+}
+
+ZSTD_STATIC void BIT_skipBits(BIT_DStream_t *bitD, U32 nbBits) { bitD->bitsConsumed += nbBits; }
+
+/*! BIT_readBits() :
+ *  Read (consume) next n bits from local register and update.
+ *  Pay attention to not read more than nbBits contained into local register.
+ *  @return : extracted value.
+ */
+ZSTD_STATIC size_t BIT_readBits(BIT_DStream_t *bitD, U32 nbBits)
+{
+	size_t const value = BIT_lookBits(bitD, nbBits);
+	BIT_skipBits(bitD, nbBits);
+	return value;
+}
+
+/*! BIT_readBitsFast() :
+*   unsafe version; only works only if nbBits >= 1 */
+ZSTD_STATIC size_t BIT_readBitsFast(BIT_DStream_t *bitD, U32 nbBits)
+{
+	size_t const value = BIT_lookBitsFast(bitD, nbBits);
+	BIT_skipBits(bitD, nbBits);
+	return value;
+}
+
+/*! BIT_reloadDStream() :
+*   Refill `bitD` from buffer previously set in BIT_initDStream() .
+*   This function is safe, it guarantees it will not read beyond src buffer.
+*   @return : status of `BIT_DStream_t` internal register.
+			  if status == BIT_DStream_unfinished, internal register is filled with >= (sizeof(bitD->bitContainer)*8 - 7) bits */
+ZSTD_STATIC BIT_DStream_status BIT_reloadDStream(BIT_DStream_t *bitD)
+{
+	if (bitD->bitsConsumed > (sizeof(bitD->bitContainer) * 8)) /* should not happen => corruption detected */
+		return BIT_DStream_overflow;
+
+	if (bitD->ptr >= bitD->start + sizeof(bitD->bitContainer)) {
+		bitD->ptr -= bitD->bitsConsumed >> 3;
+		bitD->bitsConsumed &= 7;
+		bitD->bitContainer = ZSTD_readLEST(bitD->ptr);
+		return BIT_DStream_unfinished;
+	}
+	if (bitD->ptr == bitD->start) {
+		if (bitD->bitsConsumed < sizeof(bitD->bitContainer) * 8)
+			return BIT_DStream_endOfBuffer;
+		return BIT_DStream_completed;
+	}
+	{
+		U32 nbBytes = bitD->bitsConsumed >> 3;
+		BIT_DStream_status result = BIT_DStream_unfinished;
+		if (bitD->ptr - nbBytes < bitD->start) {
+			nbBytes = (U32)(bitD->ptr - bitD->start); /* ptr > start */
+			result = BIT_DStream_endOfBuffer;
+		}
+		bitD->ptr -= nbBytes;
+		bitD->bitsConsumed -= nbBytes * 8;
+		bitD->bitContainer = ZSTD_readLEST(bitD->ptr); /* reminder : srcSize > sizeof(bitD) */
+		return result;
+	}
+}
+
+/*! BIT_endOfDStream() :
+*   @return Tells if DStream has exactly reached its end (all bits consumed).
+*/
+ZSTD_STATIC unsigned BIT_endOfDStream(const BIT_DStream_t *DStream)
+{
+	return ((DStream->ptr == DStream->start) && (DStream->bitsConsumed == sizeof(DStream->bitContainer) * 8));
+}
+
+#endif /* BITSTREAM_H_MODULE */
--- /dev/null
+++ b/xen/common/zstd/decompress.c
@@ -0,0 +1,2496 @@
+/**
+ * Copyright (c) 2016-present, Yann Collet, Facebook, Inc.
+ * All rights reserved.
+ *
+ * This source code is licensed under the BSD-style license found in the
+ * LICENSE file in the root directory of https://github.com/facebook/zstd.
+ * An additional grant of patent rights can be found in the PATENTS file in the
+ * same directory.
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation. This program is dual-licensed; you may select
+ * either version 2 of the GNU General Public License ("GPL") or BSD license
+ * ("BSD").
+ */
+
+/* ***************************************************************
+*  Tuning parameters
+*****************************************************************/
+/*!
+*  MAXWINDOWSIZE_DEFAULT :
+*  maximum window size accepted by DStream, by default.
+*  Frames requiring more memory will be rejected.
+*/
+#ifndef ZSTD_MAXWINDOWSIZE_DEFAULT
+#define ZSTD_MAXWINDOWSIZE_DEFAULT ((1 << ZSTD_WINDOWLOG_MAX) + 1) /* defined within zstd.h */
+#endif
+
+/*-*******************************************************
+*  Dependencies
+*********************************************************/
+#include "fse.h"
+#include "huf.h"
+#include "mem.h" /* low level memory routines */
+#include "zstd_internal.h"
+#include <xen/string.h> /* memcpy, memmove, memset */
+
+#define ZSTD_PREFETCH(ptr) __builtin_prefetch(ptr, 0, 0)
+
+/*-*************************************
+*  Macros
+***************************************/
+#define ZSTD_isError ERR_isError /* for inlining */
+#define FSE_isError ERR_isError
+#define HUF_isError ERR_isError
+
+/*_*******************************************************
+*  Memory operations
+**********************************************************/
+static void INIT ZSTD_copy4(void *dst, const void *src) { memcpy(dst, src, 4); }
+
+/*-*************************************************************
+*   Context management
+***************************************************************/
+typedef enum {
+	ZSTDds_getFrameHeaderSize,
+	ZSTDds_decodeFrameHeader,
+	ZSTDds_decodeBlockHeader,
+	ZSTDds_decompressBlock,
+	ZSTDds_decompressLastBlock,
+	ZSTDds_checkChecksum,
+	ZSTDds_decodeSkippableHeader,
+	ZSTDds_skipFrame
+} ZSTD_dStage;
+
+typedef struct {
+	FSE_DTable LLTable[FSE_DTABLE_SIZE_U32(LLFSELog)];
+	FSE_DTable OFTable[FSE_DTABLE_SIZE_U32(OffFSELog)];
+	FSE_DTable MLTable[FSE_DTABLE_SIZE_U32(MLFSELog)];
+	HUF_DTable hufTable[HUF_DTABLE_SIZE(HufLog)]; /* can accommodate HUF_decompress4X */
+	U64 workspace[HUF_DECOMPRESS_WORKSPACE_SIZE_U32 / 2];
+	U32 rep[ZSTD_REP_NUM];
+} ZSTD_entropyTables_t;
+
+struct ZSTD_DCtx_s {
+	const FSE_DTable *LLTptr;
+	const FSE_DTable *MLTptr;
+	const FSE_DTable *OFTptr;
+	const HUF_DTable *HUFptr;
+	ZSTD_entropyTables_t entropy;
+	const void *previousDstEnd; /* detect continuity */
+	const void *base;	   /* start of curr segment */
+	const void *vBase;	  /* virtual start of previous segment if it was just before curr one */
+	const void *dictEnd;	/* end of previous segment */
+	size_t expected;
+	ZSTD_frameParams fParams;
+	blockType_e bType; /* used in ZSTD_decompressContinue(), to transfer blockType between header decoding and block decoding stages */
+	ZSTD_dStage stage;
+	U32 litEntropy;
+	U32 fseEntropy;
+	struct xxh64_state xxhState;
+	size_t headerSize;
+	U32 dictID;
+	const BYTE *litPtr;
+	ZSTD_customMem customMem;
+	size_t litSize;
+	size_t rleSize;
+	BYTE litBuffer[ZSTD_BLOCKSIZE_ABSOLUTEMAX + WILDCOPY_OVERLENGTH];
+	BYTE headerBuffer[ZSTD_FRAMEHEADERSIZE_MAX];
+}; /* typedef'd to ZSTD_DCtx within "zstd.h" */
+
+size_t INIT ZSTD_DCtxWorkspaceBound(void) { return ZSTD_ALIGN(sizeof(ZSTD_stack)) + ZSTD_ALIGN(sizeof(ZSTD_DCtx)); }
+
+size_t INIT ZSTD_decompressBegin(ZSTD_DCtx *dctx)
+{
+	dctx->expected = ZSTD_frameHeaderSize_prefix;
+	dctx->stage = ZSTDds_getFrameHeaderSize;
+	dctx->previousDstEnd = NULL;
+	dctx->base = NULL;
+	dctx->vBase = NULL;
+	dctx->dictEnd = NULL;
+	dctx->entropy.hufTable[0] = (HUF_DTable)((HufLog)*0x1000001); /* cover both little and big endian */
+	dctx->litEntropy = dctx->fseEntropy = 0;
+	dctx->dictID = 0;
+	ZSTD_STATIC_ASSERT(sizeof(dctx->entropy.rep) == sizeof(repStartValue));
+	memcpy(dctx->entropy.rep, repStartValue, sizeof(repStartValue)); /* initial repcodes */
+	dctx->LLTptr = dctx->entropy.LLTable;
+	dctx->MLTptr = dctx->entropy.MLTable;
+	dctx->OFTptr = dctx->entropy.OFTable;
+	dctx->HUFptr = dctx->entropy.hufTable;
+	return 0;
+}
+
+ZSTD_DCtx *INIT ZSTD_createDCtx_advanced(ZSTD_customMem customMem)
+{
+	ZSTD_DCtx *dctx;
+
+	if (!customMem.customAlloc || !customMem.customFree)
+		return NULL;
+
+	dctx = (ZSTD_DCtx *)ZSTD_malloc(sizeof(ZSTD_DCtx), customMem);
+	if (!dctx)
+		return NULL;
+	memcpy(&dctx->customMem, &customMem, sizeof(customMem));
+	ZSTD_decompressBegin(dctx);
+	return dctx;
+}
+
+ZSTD_DCtx *INIT ZSTD_initDCtx(void *workspace, size_t workspaceSize)
+{
+	ZSTD_customMem const stackMem = ZSTD_initStack(workspace, workspaceSize);
+	return ZSTD_createDCtx_advanced(stackMem);
+}
+
+size_t INIT ZSTD_freeDCtx(ZSTD_DCtx *dctx)
+{
+	if (dctx == NULL)
+		return 0; /* support free on NULL */
+	ZSTD_free(dctx, dctx->customMem);
+	return 0; /* reserved as a potential error code in the future */
+}
+
+void INIT ZSTD_copyDCtx(ZSTD_DCtx *dstDCtx, const ZSTD_DCtx *srcDCtx)
+{
+	size_t const workSpaceSize = (ZSTD_BLOCKSIZE_ABSOLUTEMAX + WILDCOPY_OVERLENGTH) + ZSTD_frameHeaderSize_max;
+	memcpy(dstDCtx, srcDCtx, sizeof(ZSTD_DCtx) - workSpaceSize); /* no need to copy workspace */
+}
+
+STATIC size_t ZSTD_findFrameCompressedSize(const void *src, size_t srcSize);
+STATIC size_t ZSTD_decompressBegin_usingDict(ZSTD_DCtx *dctx, const void *dict,
+	size_t dictSize);
+
+static void ZSTD_refDDict(ZSTD_DCtx *dstDCtx, const ZSTD_DDict *ddict);
+
+/*-*************************************************************
+*   Decompression section
+***************************************************************/
+
+/*! ZSTD_isFrame() :
+ *  Tells if the content of `buffer` starts with a valid Frame Identifier.
+ *  Note : Frame Identifier is 4 bytes. If `size < 4`, @return will always be 0.
+ *  Note 2 : Legacy Frame Identifiers are considered valid only if Legacy Support is enabled.
+ *  Note 3 : Skippable Frame Identifiers are considered valid. */
+unsigned INIT ZSTD_isFrame(const void *buffer, size_t size)
+{
+	if (size < 4)
+		return 0;
+	{
+		U32 const magic = ZSTD_readLE32(buffer);
+		if (magic == ZSTD_MAGICNUMBER)
+			return 1;
+		if ((magic & 0xFFFFFFF0U) == ZSTD_MAGIC_SKIPPABLE_START)
+			return 1;
+	}
+	return 0;
+}
+
+/** ZSTD_frameHeaderSize() :
+*   srcSize must be >= ZSTD_frameHeaderSize_prefix.
+*   @return : size of the Frame Header */
+static size_t INIT ZSTD_frameHeaderSize(const void *src, size_t srcSize)
+{
+	if (srcSize < ZSTD_frameHeaderSize_prefix)
+		return ERROR(srcSize_wrong);
+	{
+		BYTE const fhd = ((const BYTE *)src)[4];
+		U32 const dictID = fhd & 3;
+		U32 const singleSegment = (fhd >> 5) & 1;
+		U32 const fcsId = fhd >> 6;
+		return ZSTD_frameHeaderSize_prefix + !singleSegment + ZSTD_did_fieldSize[dictID] + ZSTD_fcs_fieldSize[fcsId] + (singleSegment && !fcsId);
+	}
+}
+
+/** ZSTD_getFrameParams() :
+*   decode Frame Header, or require larger `srcSize`.
+*   @return : 0, `fparamsPtr` is correctly filled,
+*            >0, `srcSize` is too small, result is expected `srcSize`,
+*             or an error code, which can be tested using ZSTD_isError() */
+size_t INIT ZSTD_getFrameParams(ZSTD_frameParams *fparamsPtr, const void *src, size_t srcSize)
+{
+	const BYTE *ip = (const BYTE *)src;
+
+	if (srcSize < ZSTD_frameHeaderSize_prefix)
+		return ZSTD_frameHeaderSize_prefix;
+	if (ZSTD_readLE32(src) != ZSTD_MAGICNUMBER) {
+		if ((ZSTD_readLE32(src) & 0xFFFFFFF0U) == ZSTD_MAGIC_SKIPPABLE_START) {
+			if (srcSize < ZSTD_skippableHeaderSize)
+				return ZSTD_skippableHeaderSize; /* magic number + skippable frame length */
+			memset(fparamsPtr, 0, sizeof(*fparamsPtr));
+			fparamsPtr->frameContentSize = ZSTD_readLE32((const char *)src + 4);
+			fparamsPtr->windowSize = 0; /* windowSize==0 means a frame is skippable */
+			return 0;
+		}
+		return ERROR(prefix_unknown);
+	}
+
+	/* ensure there is enough `srcSize` to fully read/decode frame header */
+	{
+		size_t const fhsize = ZSTD_frameHeaderSize(src, srcSize);
+		if (srcSize < fhsize)
+			return fhsize;
+	}
+
+	{
+		BYTE const fhdByte = ip[4];
+		size_t pos = 5;
+		U32 const dictIDSizeCode = fhdByte & 3;
+		U32 const checksumFlag = (fhdByte >> 2) & 1;
+		U32 const singleSegment = (fhdByte >> 5) & 1;
+		U32 const fcsID = fhdByte >> 6;
+		U32 const windowSizeMax = 1U << ZSTD_WINDOWLOG_MAX;
+		U32 windowSize = 0;
+		U32 dictID = 0;
+		U64 frameContentSize = 0;
+		if ((fhdByte & 0x08) != 0)
+			return ERROR(frameParameter_unsupported); /* reserved bits, which must be zero */
+		if (!singleSegment) {
+			BYTE const wlByte = ip[pos++];
+			U32 const windowLog = (wlByte >> 3) + ZSTD_WINDOWLOG_ABSOLUTEMIN;
+			if (windowLog > ZSTD_WINDOWLOG_MAX)
+				return ERROR(frameParameter_windowTooLarge); /* avoids issue with 1 << windowLog */
+			windowSize = (1U << windowLog);
+			windowSize += (windowSize >> 3) * (wlByte & 7);
+		}
+
+		switch (dictIDSizeCode) {
+		default: /* impossible */
+		case 0: break;
+		case 1:
+			dictID = ip[pos];
+			pos++;
+			break;
+		case 2:
+			dictID = ZSTD_readLE16(ip + pos);
+			pos += 2;
+			break;
+		case 3:
+			dictID = ZSTD_readLE32(ip + pos);
+			pos += 4;
+			break;
+		}
+		switch (fcsID) {
+		default: /* impossible */
+		case 0:
+			if (singleSegment)
+				frameContentSize = ip[pos];
+			break;
+		case 1: frameContentSize = ZSTD_readLE16(ip + pos) + 256; break;
+		case 2: frameContentSize = ZSTD_readLE32(ip + pos); break;
+		case 3: frameContentSize = ZSTD_readLE64(ip + pos); break;
+		}
+		if (!windowSize)
+			windowSize = (U32)frameContentSize;
+		if (windowSize > windowSizeMax)
+			return ERROR(frameParameter_windowTooLarge);
+		fparamsPtr->frameContentSize = frameContentSize;
+		fparamsPtr->windowSize = windowSize;
+		fparamsPtr->dictID = dictID;
+		fparamsPtr->checksumFlag = checksumFlag;
+	}
+	return 0;
+}
+
+/** ZSTD_getFrameContentSize() :
+*   compatible with legacy mode
+*   @return : decompressed size of the single frame pointed to be `src` if known, otherwise
+*             - ZSTD_CONTENTSIZE_UNKNOWN if the size cannot be determined
+*             - ZSTD_CONTENTSIZE_ERROR if an error occurred (e.g. invalid magic number, srcSize too small) */
+unsigned long long INIT ZSTD_getFrameContentSize(const void *src, size_t srcSize)
+{
+	{
+		ZSTD_frameParams fParams;
+		if (ZSTD_getFrameParams(&fParams, src, srcSize) != 0)
+			return ZSTD_CONTENTSIZE_ERROR;
+		if (fParams.windowSize == 0) {
+			/* Either skippable or empty frame, size == 0 either way */
+			return 0;
+		} else if (fParams.frameContentSize != 0) {
+			return fParams.frameContentSize;
+		} else {
+			return ZSTD_CONTENTSIZE_UNKNOWN;
+		}
+	}
+}
+
+/** ZSTD_findDecompressedSize() :
+ *  compatible with legacy mode
+ *  `srcSize` must be the exact length of some number of ZSTD compressed and/or
+ *      skippable frames
+ *  @return : decompressed size of the frames contained */
+unsigned long long INIT ZSTD_findDecompressedSize(const void *src, size_t srcSize)
+{
+	{
+		unsigned long long totalDstSize = 0;
+		while (srcSize >= ZSTD_frameHeaderSize_prefix) {
+			const U32 magicNumber = ZSTD_readLE32(src);
+
+			if ((magicNumber & 0xFFFFFFF0U) == ZSTD_MAGIC_SKIPPABLE_START) {
+				size_t skippableSize;
+				if (srcSize < ZSTD_skippableHeaderSize)
+					return ERROR(srcSize_wrong);
+				skippableSize = ZSTD_readLE32((const BYTE *)src + 4) + ZSTD_skippableHeaderSize;
+				if (srcSize < skippableSize) {
+					return ZSTD_CONTENTSIZE_ERROR;
+				}
+
+				src = (const BYTE *)src + skippableSize;
+				srcSize -= skippableSize;
+				continue;
+			}
+
+			{
+				unsigned long long const ret = ZSTD_getFrameContentSize(src, srcSize);
+				if (ret >= ZSTD_CONTENTSIZE_ERROR)
+					return ret;
+
+				/* check for overflow */
+				if (totalDstSize + ret < totalDstSize)
+					return ZSTD_CONTENTSIZE_ERROR;
+				totalDstSize += ret;
+			}
+			{
+				size_t const frameSrcSize = ZSTD_findFrameCompressedSize(src, srcSize);
+				if (ZSTD_isError(frameSrcSize)) {
+					return ZSTD_CONTENTSIZE_ERROR;
+				}
+
+				src = (const BYTE *)src + frameSrcSize;
+				srcSize -= frameSrcSize;
+			}
+		}
+
+		if (srcSize) {
+			return ZSTD_CONTENTSIZE_ERROR;
+		}
+
+		return totalDstSize;
+	}
+}
+
+/** ZSTD_decodeFrameHeader() :
+*   `headerSize` must be the size provided by ZSTD_frameHeaderSize().
+*   @return : 0 if success, or an error code, which can be tested using ZSTD_isError() */
+static size_t INIT ZSTD_decodeFrameHeader(ZSTD_DCtx *dctx, const void *src, size_t headerSize)
+{
+	size_t const result = ZSTD_getFrameParams(&(dctx->fParams), src, headerSize);
+	if (ZSTD_isError(result))
+		return result; /* invalid header */
+	if (result > 0)
+		return ERROR(srcSize_wrong); /* headerSize too small */
+	if (dctx->fParams.dictID && (dctx->dictID != dctx->fParams.dictID))
+		return ERROR(dictionary_wrong);
+	if (dctx->fParams.checksumFlag)
+		xxh64_reset(&dctx->xxhState, 0);
+	return 0;
+}
+
+typedef struct {
+	blockType_e blockType;
+	U32 lastBlock;
+	U32 origSize;
+} blockProperties_t;
+
+/*! ZSTD_getcBlockSize() :
+*   Provides the size of compressed block from block header `src` */
+size_t INIT ZSTD_getcBlockSize(const void *src, size_t srcSize, blockProperties_t *bpPtr)
+{
+	if (srcSize < ZSTD_blockHeaderSize)
+		return ERROR(srcSize_wrong);
+	{
+		U32 const cBlockHeader = ZSTD_readLE24(src);
+		U32 const cSize = cBlockHeader >> 3;
+		bpPtr->lastBlock = cBlockHeader & 1;
+		bpPtr->blockType = (blockType_e)((cBlockHeader >> 1) & 3);
+		bpPtr->origSize = cSize; /* only useful for RLE */
+		if (bpPtr->blockType == bt_rle)
+			return 1;
+		if (bpPtr->blockType == bt_reserved)
+			return ERROR(corruption_detected);
+		return cSize;
+	}
+}
+
+static size_t INIT ZSTD_copyRawBlock(void *dst, size_t dstCapacity, const void *src, size_t srcSize)
+{
+	if (srcSize > dstCapacity)
+		return ERROR(dstSize_tooSmall);
+	memcpy(dst, src, srcSize);
+	return srcSize;
+}
+
+static size_t INIT ZSTD_setRleBlock(void *dst, size_t dstCapacity, const void *src, size_t srcSize, size_t regenSize)
+{
+	if (srcSize != 1)
+		return ERROR(srcSize_wrong);
+	if (regenSize > dstCapacity)
+		return ERROR(dstSize_tooSmall);
+	memset(dst, *(const BYTE *)src, regenSize);
+	return regenSize;
+}
+
+/*! ZSTD_decodeLiteralsBlock() :
+	@return : nb of bytes read from src (< srcSize ) */
+size_t INIT ZSTD_decodeLiteralsBlock(ZSTD_DCtx *dctx, const void *src, size_t srcSize) /* note : srcSize < BLOCKSIZE */
+{
+	if (srcSize < MIN_CBLOCK_SIZE)
+		return ERROR(corruption_detected);
+
+	{
+		const BYTE *const istart = (const BYTE *)src;
+		symbolEncodingType_e const litEncType = (symbolEncodingType_e)(istart[0] & 3);
+
+		switch (litEncType) {
+		case set_repeat:
+			if (dctx->litEntropy == 0)
+				return ERROR(dictionary_corrupted);
+			/* fallthrough */
+		case set_compressed:
+			if (srcSize < 5)
+				return ERROR(corruption_detected); /* srcSize >= MIN_CBLOCK_SIZE == 3; here we need up to 5 for case 3 */
+			{
+				size_t lhSize, litSize, litCSize;
+				U32 singleStream = 0;
+				U32 const lhlCode = (istart[0] >> 2) & 3;
+				U32 const lhc = ZSTD_readLE32(istart);
+				switch (lhlCode) {
+				case 0:
+				case 1:
+				default: /* note : default is impossible, since lhlCode into [0..3] */
+					/* 2 - 2 - 10 - 10 */
+					singleStream = !lhlCode;
+					lhSize = 3;
+					litSize = (lhc >> 4) & 0x3FF;
+					litCSize = (lhc >> 14) & 0x3FF;
+					break;
+				case 2:
+					/* 2 - 2 - 14 - 14 */
+					lhSize = 4;
+					litSize = (lhc >> 4) & 0x3FFF;
+					litCSize = lhc >> 18;
+					break;
+				case 3:
+					/* 2 - 2 - 18 - 18 */
+					lhSize = 5;
+					litSize = (lhc >> 4) & 0x3FFFF;
+					litCSize = (lhc >> 22) + (istart[4] << 10);
+					break;
+				}
+				if (litSize > ZSTD_BLOCKSIZE_ABSOLUTEMAX)
+					return ERROR(corruption_detected);
+				if (litCSize + lhSize > srcSize)
+					return ERROR(corruption_detected);
+
+				if (HUF_isError(
+					(litEncType == set_repeat)
+					    ? (singleStream ? HUF_decompress1X_usingDTable(dctx->litBuffer, litSize, istart + lhSize, litCSize, dctx->HUFptr)
+							    : HUF_decompress4X_usingDTable(dctx->litBuffer, litSize, istart + lhSize, litCSize, dctx->HUFptr))
+					    : (singleStream
+						   ? HUF_decompress1X2_DCtx_wksp(dctx->entropy.hufTable, dctx->litBuffer, litSize, istart + lhSize, litCSize,
+										 dctx->entropy.workspace, sizeof(dctx->entropy.workspace))
+						   : HUF_decompress4X_hufOnly_wksp(dctx->entropy.hufTable, dctx->litBuffer, litSize, istart + lhSize, litCSize,
+										   dctx->entropy.workspace, sizeof(dctx->entropy.workspace)))))
+					return ERROR(corruption_detected);
+
+				dctx->litPtr = dctx->litBuffer;
+				dctx->litSize = litSize;
+				dctx->litEntropy = 1;
+				if (litEncType == set_compressed)
+					dctx->HUFptr = dctx->entropy.hufTable;
+				memset(dctx->litBuffer + dctx->litSize, 0, WILDCOPY_OVERLENGTH);
+				return litCSize + lhSize;
+			}
+
+		case set_basic: {
+			size_t litSize, lhSize;
+			U32 const lhlCode = ((istart[0]) >> 2) & 3;
+			switch (lhlCode) {
+			case 0:
+			case 2:
+			default: /* note : default is impossible, since lhlCode into [0..3] */
+				lhSize = 1;
+				litSize = istart[0] >> 3;
+				break;
+			case 1:
+				lhSize = 2;
+				litSize = ZSTD_readLE16(istart) >> 4;
+				break;
+			case 3:
+				lhSize = 3;
+				litSize = ZSTD_readLE24(istart) >> 4;
+				break;
+			}
+
+			if (lhSize + litSize + WILDCOPY_OVERLENGTH > srcSize) { /* risk reading beyond src buffer with wildcopy */
+				if (litSize + lhSize > srcSize)
+					return ERROR(corruption_detected);
+				memcpy(dctx->litBuffer, istart + lhSize, litSize);
+				dctx->litPtr = dctx->litBuffer;
+				dctx->litSize = litSize;
+				memset(dctx->litBuffer + dctx->litSize, 0, WILDCOPY_OVERLENGTH);
+				return lhSize + litSize;
+			}
+			/* direct reference into compressed stream */
+			dctx->litPtr = istart + lhSize;
+			dctx->litSize = litSize;
+			return lhSize + litSize;
+		}
+
+		case set_rle: {
+			U32 const lhlCode = ((istart[0]) >> 2) & 3;
+			size_t litSize, lhSize;
+			switch (lhlCode) {
+			case 0:
+			case 2:
+			default: /* note : default is impossible, since lhlCode into [0..3] */
+				lhSize = 1;
+				litSize = istart[0] >> 3;
+				break;
+			case 1:
+				lhSize = 2;
+				litSize = ZSTD_readLE16(istart) >> 4;
+				break;
+			case 3:
+				lhSize = 3;
+				litSize = ZSTD_readLE24(istart) >> 4;
+				if (srcSize < 4)
+					return ERROR(corruption_detected); /* srcSize >= MIN_CBLOCK_SIZE == 3; here we need lhSize+1 = 4 */
+				break;
+			}
+			if (litSize > ZSTD_BLOCKSIZE_ABSOLUTEMAX)
+				return ERROR(corruption_detected);
+			memset(dctx->litBuffer, istart[lhSize], litSize + WILDCOPY_OVERLENGTH);
+			dctx->litPtr = dctx->litBuffer;
+			dctx->litSize = litSize;
+			return lhSize + 1;
+		}
+		default:
+			return ERROR(corruption_detected); /* impossible */
+		}
+	}
+}
+
+typedef union {
+	FSE_decode_t realData;
+	U32 alignedBy4;
+} FSE_decode_t4;
+
+static const FSE_decode_t4 LL_defaultDTable[(1 << LL_DEFAULTNORMLOG) + 1] = {
+    {{LL_DEFAULTNORMLOG, 1, 1}}, /* header : tableLog, fastMode, fastMode */
+    {{0, 0, 4}},		 /* 0 : base, symbol, bits */
+    {{16, 0, 4}},
+    {{32, 1, 5}},
+    {{0, 3, 5}},
+    {{0, 4, 5}},
+    {{0, 6, 5}},
+    {{0, 7, 5}},
+    {{0, 9, 5}},
+    {{0, 10, 5}},
+    {{0, 12, 5}},
+    {{0, 14, 6}},
+    {{0, 16, 5}},
+    {{0, 18, 5}},
+    {{0, 19, 5}},
+    {{0, 21, 5}},
+    {{0, 22, 5}},
+    {{0, 24, 5}},
+    {{32, 25, 5}},
+    {{0, 26, 5}},
+    {{0, 27, 6}},
+    {{0, 29, 6}},
+    {{0, 31, 6}},
+    {{32, 0, 4}},
+    {{0, 1, 4}},
+    {{0, 2, 5}},
+    {{32, 4, 5}},
+    {{0, 5, 5}},
+    {{32, 7, 5}},
+    {{0, 8, 5}},
+    {{32, 10, 5}},
+    {{0, 11, 5}},
+    {{0, 13, 6}},
+    {{32, 16, 5}},
+    {{0, 17, 5}},
+    {{32, 19, 5}},
+    {{0, 20, 5}},
+    {{32, 22, 5}},
+    {{0, 23, 5}},
+    {{0, 25, 4}},
+    {{16, 25, 4}},
+    {{32, 26, 5}},
+    {{0, 28, 6}},
+    {{0, 30, 6}},
+    {{48, 0, 4}},
+    {{16, 1, 4}},
+    {{32, 2, 5}},
+    {{32, 3, 5}},
+    {{32, 5, 5}},
+    {{32, 6, 5}},
+    {{32, 8, 5}},
+    {{32, 9, 5}},
+    {{32, 11, 5}},
+    {{32, 12, 5}},
+    {{0, 15, 6}},
+    {{32, 17, 5}},
+    {{32, 18, 5}},
+    {{32, 20, 5}},
+    {{32, 21, 5}},
+    {{32, 23, 5}},
+    {{32, 24, 5}},
+    {{0, 35, 6}},
+    {{0, 34, 6}},
+    {{0, 33, 6}},
+    {{0, 32, 6}},
+}; /* LL_defaultDTable */
+
+static const FSE_decode_t4 ML_defaultDTable[(1 << ML_DEFAULTNORMLOG) + 1] = {
+    {{ML_DEFAULTNORMLOG, 1, 1}}, /* header : tableLog, fastMode, fastMode */
+    {{0, 0, 6}},		 /* 0 : base, symbol, bits */
+    {{0, 1, 4}},
+    {{32, 2, 5}},
+    {{0, 3, 5}},
+    {{0, 5, 5}},
+    {{0, 6, 5}},
+    {{0, 8, 5}},
+    {{0, 10, 6}},
+    {{0, 13, 6}},
+    {{0, 16, 6}},
+    {{0, 19, 6}},
+    {{0, 22, 6}},
+    {{0, 25, 6}},
+    {{0, 28, 6}},
+    {{0, 31, 6}},
+    {{0, 33, 6}},
+    {{0, 35, 6}},
+    {{0, 37, 6}},
+    {{0, 39, 6}},
+    {{0, 41, 6}},
+    {{0, 43, 6}},
+    {{0, 45, 6}},
+    {{16, 1, 4}},
+    {{0, 2, 4}},
+    {{32, 3, 5}},
+    {{0, 4, 5}},
+    {{32, 6, 5}},
+    {{0, 7, 5}},
+    {{0, 9, 6}},
+    {{0, 12, 6}},
+    {{0, 15, 6}},
+    {{0, 18, 6}},
+    {{0, 21, 6}},
+    {{0, 24, 6}},
+    {{0, 27, 6}},
+    {{0, 30, 6}},
+    {{0, 32, 6}},
+    {{0, 34, 6}},
+    {{0, 36, 6}},
+    {{0, 38, 6}},
+    {{0, 40, 6}},
+    {{0, 42, 6}},
+    {{0, 44, 6}},
+    {{32, 1, 4}},
+    {{48, 1, 4}},
+    {{16, 2, 4}},
+    {{32, 4, 5}},
+    {{32, 5, 5}},
+    {{32, 7, 5}},
+    {{32, 8, 5}},
+    {{0, 11, 6}},
+    {{0, 14, 6}},
+    {{0, 17, 6}},
+    {{0, 20, 6}},
+    {{0, 23, 6}},
+    {{0, 26, 6}},
+    {{0, 29, 6}},
+    {{0, 52, 6}},
+    {{0, 51, 6}},
+    {{0, 50, 6}},
+    {{0, 49, 6}},
+    {{0, 48, 6}},
+    {{0, 47, 6}},
+    {{0, 46, 6}},
+}; /* ML_defaultDTable */
+
+static const FSE_decode_t4 OF_defaultDTable[(1 << OF_DEFAULTNORMLOG) + 1] = {
+    {{OF_DEFAULTNORMLOG, 1, 1}}, /* header : tableLog, fastMode, fastMode */
+    {{0, 0, 5}},		 /* 0 : base, symbol, bits */
+    {{0, 6, 4}},
+    {{0, 9, 5}},
+    {{0, 15, 5}},
+    {{0, 21, 5}},
+    {{0, 3, 5}},
+    {{0, 7, 4}},
+    {{0, 12, 5}},
+    {{0, 18, 5}},
+    {{0, 23, 5}},
+    {{0, 5, 5}},
+    {{0, 8, 4}},
+    {{0, 14, 5}},
+    {{0, 20, 5}},
+    {{0, 2, 5}},
+    {{16, 7, 4}},
+    {{0, 11, 5}},
+    {{0, 17, 5}},
+    {{0, 22, 5}},
+    {{0, 4, 5}},
+    {{16, 8, 4}},
+    {{0, 13, 5}},
+    {{0, 19, 5}},
+    {{0, 1, 5}},
+    {{16, 6, 4}},
+    {{0, 10, 5}},
+    {{0, 16, 5}},
+    {{0, 28, 5}},
+    {{0, 27, 5}},
+    {{0, 26, 5}},
+    {{0, 25, 5}},
+    {{0, 24, 5}},
+}; /* OF_defaultDTable */
+
+/*! ZSTD_buildSeqTable() :
+	@return : nb bytes read from src,
+			  or an error code if it fails, testable with ZSTD_isError()
+*/
+static size_t INIT ZSTD_buildSeqTable(FSE_DTable *DTableSpace, const FSE_DTable **DTablePtr,
+				      symbolEncodingType_e type, U32 max, U32 maxLog, const void *src,
+				      size_t srcSize, const FSE_decode_t4 *defaultTable,
+				      U32 flagRepeatTable, void *workspace, size_t workspaceSize)
+{
+	const void *const tmpPtr = defaultTable; /* bypass strict aliasing */
+	switch (type) {
+	case set_rle:
+		if (!srcSize)
+			return ERROR(srcSize_wrong);
+		if ((*(const BYTE *)src) > max)
+			return ERROR(corruption_detected);
+		FSE_buildDTable_rle(DTableSpace, *(const BYTE *)src);
+		*DTablePtr = DTableSpace;
+		return 1;
+	case set_basic: *DTablePtr = (const FSE_DTable *)tmpPtr; return 0;
+	case set_repeat:
+		if (!flagRepeatTable)
+			return ERROR(corruption_detected);
+		return 0;
+	default: /* impossible */
+	case set_compressed: {
+		U32 tableLog;
+		S16 *norm = (S16 *)workspace;
+		size_t const spaceUsed32 = ALIGN(sizeof(S16) * (MaxSeq + 1), sizeof(U32)) >> 2;
+
+		if ((spaceUsed32 << 2) > workspaceSize)
+			return ERROR(GENERIC);
+		workspace = (U32 *)workspace + spaceUsed32;
+		workspaceSize -= (spaceUsed32 << 2);
+		{
+			size_t const headerSize = FSE_readNCount(norm, &max, &tableLog, src, srcSize);
+			if (FSE_isError(headerSize))
+				return ERROR(corruption_detected);
+			if (tableLog > maxLog)
+				return ERROR(corruption_detected);
+			FSE_buildDTable_wksp(DTableSpace, norm, max, tableLog, workspace, workspaceSize);
+			*DTablePtr = DTableSpace;
+			return headerSize;
+		}
+	}
+	}
+}
+
+size_t INIT ZSTD_decodeSeqHeaders(ZSTD_DCtx *dctx, int *nbSeqPtr, const void *src, size_t srcSize)
+{
+	const BYTE *const istart = (const BYTE *const)src;
+	const BYTE *const iend = istart + srcSize;
+	const BYTE *ip = istart;
+
+	/* check */
+	if (srcSize < MIN_SEQUENCES_SIZE)
+		return ERROR(srcSize_wrong);
+
+	/* SeqHead */
+	{
+		int nbSeq = *ip++;
+		if (!nbSeq) {
+			*nbSeqPtr = 0;
+			return 1;
+		}
+		if (nbSeq > 0x7F) {
+			if (nbSeq == 0xFF) {
+				if (ip + 2 > iend)
+					return ERROR(srcSize_wrong);
+				nbSeq = ZSTD_readLE16(ip) + LONGNBSEQ, ip += 2;
+			} else {
+				if (ip >= iend)
+					return ERROR(srcSize_wrong);
+				nbSeq = ((nbSeq - 0x80) << 8) + *ip++;
+			}
+		}
+		*nbSeqPtr = nbSeq;
+	}
+
+	/* FSE table descriptors */
+	if (ip + 4 > iend)
+		return ERROR(srcSize_wrong); /* minimum possible size */
+	{
+		symbolEncodingType_e const LLtype = (symbolEncodingType_e)(*ip >> 6);
+		symbolEncodingType_e const OFtype = (symbolEncodingType_e)((*ip >> 4) & 3);
+		symbolEncodingType_e const MLtype = (symbolEncodingType_e)((*ip >> 2) & 3);
+		ip++;
+
+		/* Build DTables */
+		{
+			size_t const llhSize = ZSTD_buildSeqTable(dctx->entropy.LLTable, &dctx->LLTptr, LLtype, MaxLL, LLFSELog, ip, iend - ip,
+								  LL_defaultDTable, dctx->fseEntropy, dctx->entropy.workspace, sizeof(dctx->entropy.workspace));
+			if (ZSTD_isError(llhSize))
+				return ERROR(corruption_detected);
+			ip += llhSize;
+		}
+		{
+			size_t const ofhSize = ZSTD_buildSeqTable(dctx->entropy.OFTable, &dctx->OFTptr, OFtype, MaxOff, OffFSELog, ip, iend - ip,
+								  OF_defaultDTable, dctx->fseEntropy, dctx->entropy.workspace, sizeof(dctx->entropy.workspace));
+			if (ZSTD_isError(ofhSize))
+				return ERROR(corruption_detected);
+			ip += ofhSize;
+		}
+		{
+			size_t const mlhSize = ZSTD_buildSeqTable(dctx->entropy.MLTable, &dctx->MLTptr, MLtype, MaxML, MLFSELog, ip, iend - ip,
+								  ML_defaultDTable, dctx->fseEntropy, dctx->entropy.workspace, sizeof(dctx->entropy.workspace));
+			if (ZSTD_isError(mlhSize))
+				return ERROR(corruption_detected);
+			ip += mlhSize;
+		}
+	}
+
+	return ip - istart;
+}
+
+typedef struct {
+	size_t litLength;
+	size_t matchLength;
+	size_t offset;
+	const BYTE *match;
+} seq_t;
+
+typedef struct {
+	BIT_DStream_t DStream;
+	FSE_DState_t stateLL;
+	FSE_DState_t stateOffb;
+	FSE_DState_t stateML;
+	size_t prevOffset[ZSTD_REP_NUM];
+	const BYTE *base;
+	size_t pos;
+	uPtrDiff gotoDict;
+} seqState_t;
+
+FORCE_NOINLINE
+size_t ZSTD_execSequenceLast7(BYTE *op, BYTE *const oend, seq_t sequence, const BYTE **litPtr, const BYTE *const litLimit, const BYTE *const base,
+			      const BYTE *const vBase, const BYTE *const dictEnd)
+{
+	BYTE *const oLitEnd = op + sequence.litLength;
+	size_t const sequenceLength = sequence.litLength + sequence.matchLength;
+	BYTE *const oMatchEnd = op + sequenceLength; /* risk : address space overflow (32-bits) */
+	BYTE *const oend_w = oend - WILDCOPY_OVERLENGTH;
+	const BYTE *const iLitEnd = *litPtr + sequence.litLength;
+	const BYTE *match = oLitEnd - sequence.offset;
+
+	/* check */
+	if (oMatchEnd > oend)
+		return ERROR(dstSize_tooSmall); /* last match must start at a minimum distance of WILDCOPY_OVERLENGTH from oend */
+	if (iLitEnd > litLimit)
+		return ERROR(corruption_detected); /* over-read beyond lit buffer */
+	if (oLitEnd <= oend_w)
+		return ERROR(GENERIC); /* Precondition */
+
+	/* copy literals */
+	if (op < oend_w) {
+		ZSTD_wildcopy(op, *litPtr, oend_w - op);
+		*litPtr += oend_w - op;
+		op = oend_w;
+	}
+	while (op < oLitEnd)
+		*op++ = *(*litPtr)++;
+
+	/* copy Match */
+	if (sequence.offset > (size_t)(oLitEnd - base)) {
+		/* offset beyond prefix */
+		if (sequence.offset > (size_t)(oLitEnd - vBase))
+			return ERROR(corruption_detected);
+		match = dictEnd - (base - match);
+		if (match + sequence.matchLength <= dictEnd) {
+			memmove(oLitEnd, match, sequence.matchLength);
+			return sequenceLength;
+		}
+		/* span extDict & currPrefixSegment */
+		{
+			size_t const length1 = dictEnd - match;
+			memmove(oLitEnd, match, length1);
+			op = oLitEnd + length1;
+			sequence.matchLength -= length1;
+			match = base;
+		}
+	}
+	while (op < oMatchEnd)
+		*op++ = *match++;
+	return sequenceLength;
+}
+
+static seq_t INIT ZSTD_decodeSequence(seqState_t *seqState)
+{
+	seq_t seq;
+
+	U32 const llCode = FSE_peekSymbol(&seqState->stateLL);
+	U32 const mlCode = FSE_peekSymbol(&seqState->stateML);
+	U32 const ofCode = FSE_peekSymbol(&seqState->stateOffb); /* <= maxOff, by table construction */
+
+	U32 const llBits = LL_bits[llCode];
+	U32 const mlBits = ML_bits[mlCode];
+	U32 const ofBits = ofCode;
+	U32 const totalBits = llBits + mlBits + ofBits;
+
+	static const U32 LL_base[MaxLL + 1] = {0,  1,  2,  3,  4,  5,  6,  7,  8,    9,     10,    11,    12,    13,     14,     15,     16,     18,
+					       20, 22, 24, 28, 32, 40, 48, 64, 0x80, 0x100, 0x200, 0x400, 0x800, 0x1000, 0x2000, 0x4000, 0x8000, 0x10000};
+
+	static const U32 ML_base[MaxML + 1] = {3,  4,  5,  6,  7,  8,  9,  10,   11,    12,    13,    14,    15,     16,     17,     18,     19,     20,
+					       21, 22, 23, 24, 25, 26, 27, 28,   29,    30,    31,    32,    33,     34,     35,     37,     39,     41,
+					       43, 47, 51, 59, 67, 83, 99, 0x83, 0x103, 0x203, 0x403, 0x803, 0x1003, 0x2003, 0x4003, 0x8003, 0x10003};
+
+	static const U32 OF_base[MaxOff + 1] = {0,       1,	1,	5,	0xD,      0x1D,      0x3D,      0x7D,      0xFD,     0x1FD,
+						0x3FD,   0x7FD,    0xFFD,    0x1FFD,   0x3FFD,   0x7FFD,    0xFFFD,    0x1FFFD,   0x3FFFD,  0x7FFFD,
+						0xFFFFD, 0x1FFFFD, 0x3FFFFD, 0x7FFFFD, 0xFFFFFD, 0x1FFFFFD, 0x3FFFFFD, 0x7FFFFFD, 0xFFFFFFD};
+
+	/* sequence */
+	{
+		size_t offset;
+		if (!ofCode)
+			offset = 0;
+		else {
+			offset = OF_base[ofCode] + BIT_readBitsFast(&seqState->DStream, ofBits); /* <=  (ZSTD_WINDOWLOG_MAX-1) bits */
+			if (ZSTD_32bits())
+				BIT_reloadDStream(&seqState->DStream);
+		}
+
+		if (ofCode <= 1) {
+			offset += (llCode == 0);
+			if (offset) {
+				size_t temp = (offset == 3) ? seqState->prevOffset[0] - 1 : seqState->prevOffset[offset];
+				temp += !temp; /* 0 is not valid; input is corrupted; force offset to 1 */
+				if (offset != 1)
+					seqState->prevOffset[2] = seqState->prevOffset[1];
+				seqState->prevOffset[1] = seqState->prevOffset[0];
+				seqState->prevOffset[0] = offset = temp;
+			} else {
+				offset = seqState->prevOffset[0];
+			}
+		} else {
+			seqState->prevOffset[2] = seqState->prevOffset[1];
+			seqState->prevOffset[1] = seqState->prevOffset[0];
+			seqState->prevOffset[0] = offset;
+		}
+		seq.offset = offset;
+	}
+
+	seq.matchLength = ML_base[mlCode] + ((mlCode > 31) ? BIT_readBitsFast(&seqState->DStream, mlBits) : 0); /* <=  16 bits */
+	if (ZSTD_32bits() && (mlBits + llBits > 24))
+		BIT_reloadDStream(&seqState->DStream);
+
+	seq.litLength = LL_base[llCode] + ((llCode > 15) ? BIT_readBitsFast(&seqState->DStream, llBits) : 0); /* <=  16 bits */
+	if (ZSTD_32bits() || (totalBits > 64 - 7 - (LLFSELog + MLFSELog + OffFSELog)))
+		BIT_reloadDStream(&seqState->DStream);
+
+	/* ANS state update */
+	FSE_updateState(&seqState->stateLL, &seqState->DStream); /* <=  9 bits */
+	FSE_updateState(&seqState->stateML, &seqState->DStream); /* <=  9 bits */
+	if (ZSTD_32bits())
+		BIT_reloadDStream(&seqState->DStream);		   /* <= 18 bits */
+	FSE_updateState(&seqState->stateOffb, &seqState->DStream); /* <=  8 bits */
+
+	seq.match = NULL;
+
+	return seq;
+}
+
+FORCE_INLINE
+size_t ZSTD_execSequence(BYTE *op, BYTE *const oend, seq_t sequence, const BYTE **litPtr, const BYTE *const litLimit, const BYTE *const base,
+			 const BYTE *const vBase, const BYTE *const dictEnd)
+{
+	BYTE *const oLitEnd = op + sequence.litLength;
+	size_t const sequenceLength = sequence.litLength + sequence.matchLength;
+	BYTE *const oMatchEnd = op + sequenceLength; /* risk : address space overflow (32-bits) */
+	BYTE *const oend_w = oend - WILDCOPY_OVERLENGTH;
+	const BYTE *const iLitEnd = *litPtr + sequence.litLength;
+	const BYTE *match = oLitEnd - sequence.offset;
+
+	/* check */
+	if (oMatchEnd > oend)
+		return ERROR(dstSize_tooSmall); /* last match must start at a minimum distance of WILDCOPY_OVERLENGTH from oend */
+	if (iLitEnd > litLimit)
+		return ERROR(corruption_detected); /* over-read beyond lit buffer */
+	if (oLitEnd > oend_w)
+		return ZSTD_execSequenceLast7(op, oend, sequence, litPtr, litLimit, base, vBase, dictEnd);
+
+	/* copy Literals */
+	ZSTD_copy8(op, *litPtr);
+	if (sequence.litLength > 8)
+		ZSTD_wildcopy(op + 8, (*litPtr) + 8,
+			      sequence.litLength - 8); /* note : since oLitEnd <= oend-WILDCOPY_OVERLENGTH, no risk of overwrite beyond oend */
+	op = oLitEnd;
+	*litPtr = iLitEnd; /* update for next sequence */
+
+	/* copy Match */
+	if (sequence.offset > (size_t)(oLitEnd - base)) {
+		/* offset beyond prefix */
+		if (sequence.offset > (size_t)(oLitEnd - vBase))
+			return ERROR(corruption_detected);
+		match = dictEnd + (match - base);
+		if (match + sequence.matchLength <= dictEnd) {
+			memmove(oLitEnd, match, sequence.matchLength);
+			return sequenceLength;
+		}
+		/* span extDict & currPrefixSegment */
+		{
+			size_t const length1 = dictEnd - match;
+			memmove(oLitEnd, match, length1);
+			op = oLitEnd + length1;
+			sequence.matchLength -= length1;
+			match = base;
+			if (op > oend_w || sequence.matchLength < MINMATCH) {
+				U32 i;
+				for (i = 0; i < sequence.matchLength; ++i)
+					op[i] = match[i];
+				return sequenceLength;
+			}
+		}
+	}
+	/* Requirement: op <= oend_w && sequence.matchLength >= MINMATCH */
+
+	/* match within prefix */
+	if (sequence.offset < 8) {
+		/* close range match, overlap */
+		static const U32 dec32table[] = {0, 1, 2, 1, 4, 4, 4, 4};   /* added */
+		static const int dec64table[] = {8, 8, 8, 7, 8, 9, 10, 11}; /* subtracted */
+		int const sub2 = dec64table[sequence.offset];
+		op[0] = match[0];
+		op[1] = match[1];
+		op[2] = match[2];
+		op[3] = match[3];
+		match += dec32table[sequence.offset];
+		ZSTD_copy4(op + 4, match);
+		match -= sub2;
+	} else {
+		ZSTD_copy8(op, match);
+	}
+	op += 8;
+	match += 8;
+
+	if (oMatchEnd > oend - (16 - MINMATCH)) {
+		if (op < oend_w) {
+			ZSTD_wildcopy(op, match, oend_w - op);
+			match += oend_w - op;
+			op = oend_w;
+		}
+		while (op < oMatchEnd)
+			*op++ = *match++;
+	} else {
+		ZSTD_wildcopy(op, match, (ptrdiff_t)sequence.matchLength - 8); /* works even if matchLength < 8 */
+	}
+	return sequenceLength;
+}
+
+static size_t INIT ZSTD_decompressSequences(ZSTD_DCtx *dctx, void *dst, size_t maxDstSize, const void *seqStart, size_t seqSize)
+{
+	const BYTE *ip = (const BYTE *)seqStart;
+	const BYTE *const iend = ip + seqSize;
+	BYTE *const ostart = (BYTE * const)dst;
+	BYTE *const oend = ostart + maxDstSize;
+	BYTE *op = ostart;
+	const BYTE *litPtr = dctx->litPtr;
+	const BYTE *const litEnd = litPtr + dctx->litSize;
+	const BYTE *const base = (const BYTE *)(dctx->base);
+	const BYTE *const vBase = (const BYTE *)(dctx->vBase);
+	const BYTE *const dictEnd = (const BYTE *)(dctx->dictEnd);
+	int nbSeq;
+
+	/* Build Decoding Tables */
+	{
+		size_t const seqHSize = ZSTD_decodeSeqHeaders(dctx, &nbSeq, ip, seqSize);
+		if (ZSTD_isError(seqHSize))
+			return seqHSize;
+		ip += seqHSize;
+	}
+
+	/* Regen sequences */
+	if (nbSeq) {
+		seqState_t seqState;
+		dctx->fseEntropy = 1;
+		{
+			U32 i;
+			for (i = 0; i < ZSTD_REP_NUM; i++)
+				seqState.prevOffset[i] = dctx->entropy.rep[i];
+		}
+		CHECK_E(BIT_initDStream(&seqState.DStream, ip, iend - ip), corruption_detected);
+		FSE_initDState(&seqState.stateLL, &seqState.DStream, dctx->LLTptr);
+		FSE_initDState(&seqState.stateOffb, &seqState.DStream, dctx->OFTptr);
+		FSE_initDState(&seqState.stateML, &seqState.DStream, dctx->MLTptr);
+
+		for (; (BIT_reloadDStream(&(seqState.DStream)) <= BIT_DStream_completed) && nbSeq;) {
+			nbSeq--;
+			{
+				seq_t const sequence = ZSTD_decodeSequence(&seqState);
+				size_t const oneSeqSize = ZSTD_execSequence(op, oend, sequence, &litPtr, litEnd, base, vBase, dictEnd);
+				if (ZSTD_isError(oneSeqSize))
+					return oneSeqSize;
+				op += oneSeqSize;
+			}
+		}
+
+		/* check if reached exact end */
+		if (nbSeq)
+			return ERROR(corruption_detected);
+		/* save reps for next block */
+		{
+			U32 i;
+			for (i = 0; i < ZSTD_REP_NUM; i++)
+				dctx->entropy.rep[i] = (U32)(seqState.prevOffset[i]);
+		}
+	}
+
+	/* last literal segment */
+	{
+		size_t const lastLLSize = litEnd - litPtr;
+		if (lastLLSize > (size_t)(oend - op))
+			return ERROR(dstSize_tooSmall);
+		memcpy(op, litPtr, lastLLSize);
+		op += lastLLSize;
+	}
+
+	return op - ostart;
+}
+
+FORCE_INLINE seq_t ZSTD_decodeSequenceLong_generic(seqState_t *seqState, int const longOffsets)
+{
+	seq_t seq;
+
+	U32 const llCode = FSE_peekSymbol(&seqState->stateLL);
+	U32 const mlCode = FSE_peekSymbol(&seqState->stateML);
+	U32 const ofCode = FSE_peekSymbol(&seqState->stateOffb); /* <= maxOff, by table construction */
+
+	U32 const llBits = LL_bits[llCode];
+	U32 const mlBits = ML_bits[mlCode];
+	U32 const ofBits = ofCode;
+	U32 const totalBits = llBits + mlBits + ofBits;
+
+	static const U32 LL_base[MaxLL + 1] = {0,  1,  2,  3,  4,  5,  6,  7,  8,    9,     10,    11,    12,    13,     14,     15,     16,     18,
+					       20, 22, 24, 28, 32, 40, 48, 64, 0x80, 0x100, 0x200, 0x400, 0x800, 0x1000, 0x2000, 0x4000, 0x8000, 0x10000};
+
+	static const U32 ML_base[MaxML + 1] = {3,  4,  5,  6,  7,  8,  9,  10,   11,    12,    13,    14,    15,     16,     17,     18,     19,     20,
+					       21, 22, 23, 24, 25, 26, 27, 28,   29,    30,    31,    32,    33,     34,     35,     37,     39,     41,
+					       43, 47, 51, 59, 67, 83, 99, 0x83, 0x103, 0x203, 0x403, 0x803, 0x1003, 0x2003, 0x4003, 0x8003, 0x10003};
+
+	static const U32 OF_base[MaxOff + 1] = {0,       1,	1,	5,	0xD,      0x1D,      0x3D,      0x7D,      0xFD,     0x1FD,
+						0x3FD,   0x7FD,    0xFFD,    0x1FFD,   0x3FFD,   0x7FFD,    0xFFFD,    0x1FFFD,   0x3FFFD,  0x7FFFD,
+						0xFFFFD, 0x1FFFFD, 0x3FFFFD, 0x7FFFFD, 0xFFFFFD, 0x1FFFFFD, 0x3FFFFFD, 0x7FFFFFD, 0xFFFFFFD};
+
+	/* sequence */
+	{
+		size_t offset;
+		if (!ofCode)
+			offset = 0;
+		else {
+			if (longOffsets) {
+				int const extraBits = ofBits - MIN(ofBits, STREAM_ACCUMULATOR_MIN);
+				offset = OF_base[ofCode] + (BIT_readBitsFast(&seqState->DStream, ofBits - extraBits) << extraBits);
+				if (ZSTD_32bits() || extraBits)
+					BIT_reloadDStream(&seqState->DStream);
+				if (extraBits)
+					offset += BIT_readBitsFast(&seqState->DStream, extraBits);
+			} else {
+				offset = OF_base[ofCode] + BIT_readBitsFast(&seqState->DStream, ofBits); /* <=  (ZSTD_WINDOWLOG_MAX-1) bits */
+				if (ZSTD_32bits())
+					BIT_reloadDStream(&seqState->DStream);
+			}
+		}
+
+		if (ofCode <= 1) {
+			offset += (llCode == 0);
+			if (offset) {
+				size_t temp = (offset == 3) ? seqState->prevOffset[0] - 1 : seqState->prevOffset[offset];
+				temp += !temp; /* 0 is not valid; input is corrupted; force offset to 1 */
+				if (offset != 1)
+					seqState->prevOffset[2] = seqState->prevOffset[1];
+				seqState->prevOffset[1] = seqState->prevOffset[0];
+				seqState->prevOffset[0] = offset = temp;
+			} else {
+				offset = seqState->prevOffset[0];
+			}
+		} else {
+			seqState->prevOffset[2] = seqState->prevOffset[1];
+			seqState->prevOffset[1] = seqState->prevOffset[0];
+			seqState->prevOffset[0] = offset;
+		}
+		seq.offset = offset;
+	}
+
+	seq.matchLength = ML_base[mlCode] + ((mlCode > 31) ? BIT_readBitsFast(&seqState->DStream, mlBits) : 0); /* <=  16 bits */
+	if (ZSTD_32bits() && (mlBits + llBits > 24))
+		BIT_reloadDStream(&seqState->DStream);
+
+	seq.litLength = LL_base[llCode] + ((llCode > 15) ? BIT_readBitsFast(&seqState->DStream, llBits) : 0); /* <=  16 bits */
+	if (ZSTD_32bits() || (totalBits > 64 - 7 - (LLFSELog + MLFSELog + OffFSELog)))
+		BIT_reloadDStream(&seqState->DStream);
+
+	{
+		size_t const pos = seqState->pos + seq.litLength;
+		seq.match = seqState->base + pos - seq.offset; /* single memory segment */
+		if (seq.offset > pos)
+			seq.match += seqState->gotoDict; /* separate memory segment */
+		seqState->pos = pos + seq.matchLength;
+	}
+
+	/* ANS state update */
+	FSE_updateState(&seqState->stateLL, &seqState->DStream); /* <=  9 bits */
+	FSE_updateState(&seqState->stateML, &seqState->DStream); /* <=  9 bits */
+	if (ZSTD_32bits())
+		BIT_reloadDStream(&seqState->DStream);		   /* <= 18 bits */
+	FSE_updateState(&seqState->stateOffb, &seqState->DStream); /* <=  8 bits */
+
+	return seq;
+}
+
+static seq_t INIT ZSTD_decodeSequenceLong(seqState_t *seqState, unsigned const windowSize)
+{
+	if (ZSTD_highbit32(windowSize) > STREAM_ACCUMULATOR_MIN) {
+		return ZSTD_decodeSequenceLong_generic(seqState, 1);
+	} else {
+		return ZSTD_decodeSequenceLong_generic(seqState, 0);
+	}
+}
+
+FORCE_INLINE
+size_t INIT ZSTD_execSequenceLong(BYTE *op, BYTE *const oend, seq_t sequence, const BYTE **litPtr,
+				  const BYTE *const litLimit, const BYTE *const base,
+				  const BYTE *const vBase, const BYTE *const dictEnd)
+{
+	BYTE *const oLitEnd = op + sequence.litLength;
+	size_t const sequenceLength = sequence.litLength + sequence.matchLength;
+	BYTE *const oMatchEnd = op + sequenceLength; /* risk : address space overflow (32-bits) */
+	BYTE *const oend_w = oend - WILDCOPY_OVERLENGTH;
+	const BYTE *const iLitEnd = *litPtr + sequence.litLength;
+	const BYTE *match = sequence.match;
+
+	/* check */
+	if (oMatchEnd > oend)
+		return ERROR(dstSize_tooSmall); /* last match must start at a minimum distance of WILDCOPY_OVERLENGTH from oend */
+	if (iLitEnd > litLimit)
+		return ERROR(corruption_detected); /* over-read beyond lit buffer */
+	if (oLitEnd > oend_w)
+		return ZSTD_execSequenceLast7(op, oend, sequence, litPtr, litLimit, base, vBase, dictEnd);
+
+	/* copy Literals */
+	ZSTD_copy8(op, *litPtr);
+	if (sequence.litLength > 8)
+		ZSTD_wildcopy(op + 8, (*litPtr) + 8,
+			      sequence.litLength - 8); /* note : since oLitEnd <= oend-WILDCOPY_OVERLENGTH, no risk of overwrite beyond oend */
+	op = oLitEnd;
+	*litPtr = iLitEnd; /* update for next sequence */
+
+	/* copy Match */
+	if (sequence.offset > (size_t)(oLitEnd - base)) {
+		/* offset beyond prefix */
+		if (sequence.offset > (size_t)(oLitEnd - vBase))
+			return ERROR(corruption_detected);
+		if (match + sequence.matchLength <= dictEnd) {
+			memmove(oLitEnd, match, sequence.matchLength);
+			return sequenceLength;
+		}
+		/* span extDict & currPrefixSegment */
+		{
+			size_t const length1 = dictEnd - match;
+			memmove(oLitEnd, match, length1);
+			op = oLitEnd + length1;
+			sequence.matchLength -= length1;
+			match = base;
+			if (op > oend_w || sequence.matchLength < MINMATCH) {
+				U32 i;
+				for (i = 0; i < sequence.matchLength; ++i)
+					op[i] = match[i];
+				return sequenceLength;
+			}
+		}
+	}
+	/* Requirement: op <= oend_w && sequence.matchLength >= MINMATCH */
+
+	/* match within prefix */
+	if (sequence.offset < 8) {
+		/* close range match, overlap */
+		static const U32 dec32table[] = {0, 1, 2, 1, 4, 4, 4, 4};   /* added */
+		static const int dec64table[] = {8, 8, 8, 7, 8, 9, 10, 11}; /* subtracted */
+		int const sub2 = dec64table[sequence.offset];
+		op[0] = match[0];
+		op[1] = match[1];
+		op[2] = match[2];
+		op[3] = match[3];
+		match += dec32table[sequence.offset];
+		ZSTD_copy4(op + 4, match);
+		match -= sub2;
+	} else {
+		ZSTD_copy8(op, match);
+	}
+	op += 8;
+	match += 8;
+
+	if (oMatchEnd > oend - (16 - MINMATCH)) {
+		if (op < oend_w) {
+			ZSTD_wildcopy(op, match, oend_w - op);
+			match += oend_w - op;
+			op = oend_w;
+		}
+		while (op < oMatchEnd)
+			*op++ = *match++;
+	} else {
+		ZSTD_wildcopy(op, match, (ptrdiff_t)sequence.matchLength - 8); /* works even if matchLength < 8 */
+	}
+	return sequenceLength;
+}
+
+static size_t INIT ZSTD_decompressSequencesLong(ZSTD_DCtx *dctx, void *dst, size_t maxDstSize, const void *seqStart, size_t seqSize)
+{
+	const BYTE *ip = (const BYTE *)seqStart;
+	const BYTE *const iend = ip + seqSize;
+	BYTE *const ostart = (BYTE * const)dst;
+	BYTE *const oend = ostart + maxDstSize;
+	BYTE *op = ostart;
+	const BYTE *litPtr = dctx->litPtr;
+	const BYTE *const litEnd = litPtr + dctx->litSize;
+	const BYTE *const base = (const BYTE *)(dctx->base);
+	const BYTE *const vBase = (const BYTE *)(dctx->vBase);
+	const BYTE *const dictEnd = (const BYTE *)(dctx->dictEnd);
+	unsigned const windowSize = dctx->fParams.windowSize;
+	int nbSeq;
+
+	/* Build Decoding Tables */
+	{
+		size_t const seqHSize = ZSTD_decodeSeqHeaders(dctx, &nbSeq, ip, seqSize);
+		if (ZSTD_isError(seqHSize))
+			return seqHSize;
+		ip += seqHSize;
+	}
+
+	/* Regen sequences */
+	if (nbSeq) {
+#define STORED_SEQS 4
+#define STOSEQ_MASK (STORED_SEQS - 1)
+#define ADVANCED_SEQS 4
+		seq_t *sequences = (seq_t *)dctx->entropy.workspace;
+		int const seqAdvance = MIN(nbSeq, ADVANCED_SEQS);
+		seqState_t seqState;
+		int seqNb;
+		ZSTD_STATIC_ASSERT(sizeof(dctx->entropy.workspace) >= sizeof(seq_t) * STORED_SEQS);
+		dctx->fseEntropy = 1;
+		{
+			U32 i;
+			for (i = 0; i < ZSTD_REP_NUM; i++)
+				seqState.prevOffset[i] = dctx->entropy.rep[i];
+		}
+		seqState.base = base;
+		seqState.pos = (size_t)(op - base);
+		seqState.gotoDict = (uPtrDiff)dictEnd - (uPtrDiff)base; /* cast to avoid undefined behaviour */
+		CHECK_E(BIT_initDStream(&seqState.DStream, ip, iend - ip), corruption_detected);
+		FSE_initDState(&seqState.stateLL, &seqState.DStream, dctx->LLTptr);
+		FSE_initDState(&seqState.stateOffb, &seqState.DStream, dctx->OFTptr);
+		FSE_initDState(&seqState.stateML, &seqState.DStream, dctx->MLTptr);
+
+		/* prepare in advance */
+		for (seqNb = 0; (BIT_reloadDStream(&seqState.DStream) <= BIT_DStream_completed) && seqNb < seqAdvance; seqNb++) {
+			sequences[seqNb] = ZSTD_decodeSequenceLong(&seqState, windowSize);
+		}
+		if (seqNb < seqAdvance)
+			return ERROR(corruption_detected);
+
+		/* decode and decompress */
+		for (; (BIT_reloadDStream(&(seqState.DStream)) <= BIT_DStream_completed) && seqNb < nbSeq; seqNb++) {
+			seq_t const sequence = ZSTD_decodeSequenceLong(&seqState, windowSize);
+			size_t const oneSeqSize =
+			    ZSTD_execSequenceLong(op, oend, sequences[(seqNb - ADVANCED_SEQS) & STOSEQ_MASK], &litPtr, litEnd, base, vBase, dictEnd);
+			if (ZSTD_isError(oneSeqSize))
+				return oneSeqSize;
+			ZSTD_PREFETCH(sequence.match);
+			sequences[seqNb & STOSEQ_MASK] = sequence;
+			op += oneSeqSize;
+		}
+		if (seqNb < nbSeq)
+			return ERROR(corruption_detected);
+
+		/* finish queue */
+		seqNb -= seqAdvance;
+		for (; seqNb < nbSeq; seqNb++) {
+			size_t const oneSeqSize = ZSTD_execSequenceLong(op, oend, sequences[seqNb & STOSEQ_MASK], &litPtr, litEnd, base, vBase, dictEnd);
+			if (ZSTD_isError(oneSeqSize))
+				return oneSeqSize;
+			op += oneSeqSize;
+		}
+
+		/* save reps for next block */
+		{
+			U32 i;
+			for (i = 0; i < ZSTD_REP_NUM; i++)
+				dctx->entropy.rep[i] = (U32)(seqState.prevOffset[i]);
+		}
+	}
+
+	/* last literal segment */
+	{
+		size_t const lastLLSize = litEnd - litPtr;
+		if (lastLLSize > (size_t)(oend - op))
+			return ERROR(dstSize_tooSmall);
+		memcpy(op, litPtr, lastLLSize);
+		op += lastLLSize;
+	}
+
+	return op - ostart;
+}
+
+static size_t INIT ZSTD_decompressBlock_internal(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize)
+{ /* blockType == blockCompressed */
+	const BYTE *ip = (const BYTE *)src;
+
+	if (srcSize >= ZSTD_BLOCKSIZE_ABSOLUTEMAX)
+		return ERROR(srcSize_wrong);
+
+	/* Decode literals section */
+	{
+		size_t const litCSize = ZSTD_decodeLiteralsBlock(dctx, src, srcSize);
+		if (ZSTD_isError(litCSize))
+			return litCSize;
+		ip += litCSize;
+		srcSize -= litCSize;
+	}
+	if (sizeof(size_t) > 4) /* do not enable prefetching on 32-bits x86, as it's performance detrimental */
+				/* likely because of register pressure */
+				/* if that's the correct cause, then 32-bits ARM should be affected differently */
+				/* it would be good to test this on ARM real hardware, to see if prefetch version improves speed */
+		if (dctx->fParams.windowSize > (1 << 23))
+			return ZSTD_decompressSequencesLong(dctx, dst, dstCapacity, ip, srcSize);
+	return ZSTD_decompressSequences(dctx, dst, dstCapacity, ip, srcSize);
+}
+
+static void INIT ZSTD_checkContinuity(ZSTD_DCtx *dctx, const void *dst)
+{
+	if (dst != dctx->previousDstEnd) { /* not contiguous */
+		dctx->dictEnd = dctx->previousDstEnd;
+		dctx->vBase = (const char *)dst - ((const char *)(dctx->previousDstEnd) - (const char *)(dctx->base));
+		dctx->base = dst;
+		dctx->previousDstEnd = dst;
+	}
+}
+
+size_t INIT ZSTD_decompressBlock(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize)
+{
+	size_t dSize;
+	ZSTD_checkContinuity(dctx, dst);
+	dSize = ZSTD_decompressBlock_internal(dctx, dst, dstCapacity, src, srcSize);
+	dctx->previousDstEnd = (char *)dst + dSize;
+	return dSize;
+}
+
+/** ZSTD_insertBlock() :
+	insert `src` block into `dctx` history. Useful to track uncompressed blocks. */
+size_t INIT ZSTD_insertBlock(ZSTD_DCtx *dctx, const void *blockStart, size_t blockSize)
+{
+	ZSTD_checkContinuity(dctx, blockStart);
+	dctx->previousDstEnd = (const char *)blockStart + blockSize;
+	return blockSize;
+}
+
+size_t INIT ZSTD_generateNxBytes(void *dst, size_t dstCapacity, BYTE byte, size_t length)
+{
+	if (length > dstCapacity)
+		return ERROR(dstSize_tooSmall);
+	memset(dst, byte, length);
+	return length;
+}
+
+/** ZSTD_findFrameCompressedSize() :
+ *  compatible with legacy mode
+ *  `src` must point to the start of a ZSTD frame, ZSTD legacy frame, or skippable frame
+ *  `srcSize` must be at least as large as the frame contained
+ *  @return : the compressed size of the frame starting at `src` */
+size_t INIT ZSTD_findFrameCompressedSize(const void *src, size_t srcSize)
+{
+	if (srcSize >= ZSTD_skippableHeaderSize && (ZSTD_readLE32(src) & 0xFFFFFFF0U) == ZSTD_MAGIC_SKIPPABLE_START) {
+		return ZSTD_skippableHeaderSize + ZSTD_readLE32((const BYTE *)src + 4);
+	} else {
+		const BYTE *ip = (const BYTE *)src;
+		const BYTE *const ipstart = ip;
+		size_t remainingSize = srcSize;
+		ZSTD_frameParams fParams;
+
+		size_t const headerSize = ZSTD_frameHeaderSize(ip, remainingSize);
+		if (ZSTD_isError(headerSize))
+			return headerSize;
+
+		/* Frame Header */
+		{
+			size_t const ret = ZSTD_getFrameParams(&fParams, ip, remainingSize);
+			if (ZSTD_isError(ret))
+				return ret;
+			if (ret > 0)
+				return ERROR(srcSize_wrong);
+		}
+
+		ip += headerSize;
+		remainingSize -= headerSize;
+
+		/* Loop on each block */
+		while (1) {
+			blockProperties_t blockProperties;
+			size_t const cBlockSize = ZSTD_getcBlockSize(ip, remainingSize, &blockProperties);
+			if (ZSTD_isError(cBlockSize))
+				return cBlockSize;
+
+			if (ZSTD_blockHeaderSize + cBlockSize > remainingSize)
+				return ERROR(srcSize_wrong);
+
+			ip += ZSTD_blockHeaderSize + cBlockSize;
+			remainingSize -= ZSTD_blockHeaderSize + cBlockSize;
+
+			if (blockProperties.lastBlock)
+				break;
+		}
+
+		if (fParams.checksumFlag) { /* Frame content checksum */
+			if (remainingSize < 4)
+				return ERROR(srcSize_wrong);
+			ip += 4;
+			remainingSize -= 4;
+		}
+
+		return ip - ipstart;
+	}
+}
+
+/*! ZSTD_decompressFrame() :
+*   @dctx must be properly initialized */
+static size_t INIT ZSTD_decompressFrame(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void **srcPtr, size_t *srcSizePtr)
+{
+	const BYTE *ip = (const BYTE *)(*srcPtr);
+	BYTE *const ostart = (BYTE * const)dst;
+	BYTE *const oend = ostart + dstCapacity;
+	BYTE *op = ostart;
+	size_t remainingSize = *srcSizePtr;
+
+	/* check */
+	if (remainingSize < ZSTD_frameHeaderSize_min + ZSTD_blockHeaderSize)
+		return ERROR(srcSize_wrong);
+
+	/* Frame Header */
+	{
+		size_t const frameHeaderSize = ZSTD_frameHeaderSize(ip, ZSTD_frameHeaderSize_prefix);
+		if (ZSTD_isError(frameHeaderSize))
+			return frameHeaderSize;
+		if (remainingSize < frameHeaderSize + ZSTD_blockHeaderSize)
+			return ERROR(srcSize_wrong);
+		CHECK_F(ZSTD_decodeFrameHeader(dctx, ip, frameHeaderSize));
+		ip += frameHeaderSize;
+		remainingSize -= frameHeaderSize;
+	}
+
+	/* Loop on each block */
+	while (1) {
+		size_t decodedSize;
+		blockProperties_t blockProperties;
+		size_t const cBlockSize = ZSTD_getcBlockSize(ip, remainingSize, &blockProperties);
+		if (ZSTD_isError(cBlockSize))
+			return cBlockSize;
+
+		ip += ZSTD_blockHeaderSize;
+		remainingSize -= ZSTD_blockHeaderSize;
+		if (cBlockSize > remainingSize)
+			return ERROR(srcSize_wrong);
+
+		switch (blockProperties.blockType) {
+		case bt_compressed: decodedSize = ZSTD_decompressBlock_internal(dctx, op, oend - op, ip, cBlockSize); break;
+		case bt_raw: decodedSize = ZSTD_copyRawBlock(op, oend - op, ip, cBlockSize); break;
+		case bt_rle: decodedSize = ZSTD_generateNxBytes(op, oend - op, *ip, blockProperties.origSize); break;
+		case bt_reserved:
+		default: return ERROR(corruption_detected);
+		}
+
+		if (ZSTD_isError(decodedSize))
+			return decodedSize;
+		if (dctx->fParams.checksumFlag)
+			xxh64_update(&dctx->xxhState, op, decodedSize);
+		op += decodedSize;
+		ip += cBlockSize;
+		remainingSize -= cBlockSize;
+		if (blockProperties.lastBlock)
+			break;
+	}
+
+	if (dctx->fParams.checksumFlag) { /* Frame content checksum verification */
+		U32 const checkCalc = (U32)xxh64_digest(&dctx->xxhState);
+		U32 checkRead;
+		if (remainingSize < 4)
+			return ERROR(checksum_wrong);
+		checkRead = ZSTD_readLE32(ip);
+		if (checkRead != checkCalc)
+			return ERROR(checksum_wrong);
+		ip += 4;
+		remainingSize -= 4;
+	}
+
+	/* Allow caller to get size read */
+	*srcPtr = ip;
+	*srcSizePtr = remainingSize;
+	return op - ostart;
+}
+
+static const void *ZSTD_DDictDictContent(const ZSTD_DDict *ddict);
+static size_t ZSTD_DDictDictSize(const ZSTD_DDict *ddict);
+
+static size_t INIT ZSTD_decompressMultiFrame(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize, const void *dict, size_t dictSize,
+					const ZSTD_DDict *ddict)
+{
+	void *const dststart = dst;
+
+	if (ddict) {
+		if (dict) {
+			/* programmer error, these two cases should be mutually exclusive */
+			return ERROR(GENERIC);
+		}
+
+		dict = ZSTD_DDictDictContent(ddict);
+		dictSize = ZSTD_DDictDictSize(ddict);
+	}
+
+	while (srcSize >= ZSTD_frameHeaderSize_prefix) {
+		U32 magicNumber;
+
+		magicNumber = ZSTD_readLE32(src);
+		if (magicNumber != ZSTD_MAGICNUMBER) {
+			if ((magicNumber & 0xFFFFFFF0U) == ZSTD_MAGIC_SKIPPABLE_START) {
+				size_t skippableSize;
+				if (srcSize < ZSTD_skippableHeaderSize)
+					return ERROR(srcSize_wrong);
+				skippableSize = ZSTD_readLE32((const BYTE *)src + 4) + ZSTD_skippableHeaderSize;
+				if (srcSize < skippableSize) {
+					return ERROR(srcSize_wrong);
+				}
+
+				src = (const BYTE *)src + skippableSize;
+				srcSize -= skippableSize;
+				continue;
+			} else {
+				return ERROR(prefix_unknown);
+			}
+		}
+
+		if (ddict) {
+			/* we were called from ZSTD_decompress_usingDDict */
+			ZSTD_refDDict(dctx, ddict);
+		} else {
+			/* this will initialize correctly with no dict if dict == NULL, so
+			 * use this in all cases but ddict */
+			CHECK_F(ZSTD_decompressBegin_usingDict(dctx, dict, dictSize));
+		}
+		ZSTD_checkContinuity(dctx, dst);
+
+		{
+			const size_t res = ZSTD_decompressFrame(dctx, dst, dstCapacity, &src, &srcSize);
+			if (ZSTD_isError(res))
+				return res;
+			/* don't need to bounds check this, ZSTD_decompressFrame will have
+			 * already */
+			dst = (BYTE *)dst + res;
+			dstCapacity -= res;
+		}
+	}
+
+	if (srcSize)
+		return ERROR(srcSize_wrong); /* input not entirely consumed */
+
+	return (BYTE *)dst - (BYTE *)dststart;
+}
+
+size_t INIT ZSTD_decompress_usingDict(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize, const void *dict, size_t dictSize)
+{
+	return ZSTD_decompressMultiFrame(dctx, dst, dstCapacity, src, srcSize, dict, dictSize, NULL);
+}
+
+size_t INIT ZSTD_decompressDCtx(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize)
+{
+	return ZSTD_decompress_usingDict(dctx, dst, dstCapacity, src, srcSize, NULL, 0);
+}
+
+/*-**************************************
+*   Advanced Streaming Decompression API
+*   Bufferless and synchronous
+****************************************/
+size_t INIT ZSTD_nextSrcSizeToDecompress(ZSTD_DCtx *dctx) { return dctx->expected; }
+
+ZSTD_nextInputType_e INIT ZSTD_nextInputType(ZSTD_DCtx *dctx)
+{
+	switch (dctx->stage) {
+	default: /* should not happen */
+	case ZSTDds_getFrameHeaderSize:
+	case ZSTDds_decodeFrameHeader: return ZSTDnit_frameHeader;
+	case ZSTDds_decodeBlockHeader: return ZSTDnit_blockHeader;
+	case ZSTDds_decompressBlock: return ZSTDnit_block;
+	case ZSTDds_decompressLastBlock: return ZSTDnit_lastBlock;
+	case ZSTDds_checkChecksum: return ZSTDnit_checksum;
+	case ZSTDds_decodeSkippableHeader:
+	case ZSTDds_skipFrame: return ZSTDnit_skippableFrame;
+	}
+}
+
+int INIT ZSTD_isSkipFrame(ZSTD_DCtx *dctx) { return dctx->stage == ZSTDds_skipFrame; } /* for zbuff */
+
+/** ZSTD_decompressContinue() :
+*   @return : nb of bytes generated into `dst` (necessarily <= `dstCapacity)
+*             or an error code, which can be tested using ZSTD_isError() */
+size_t INIT ZSTD_decompressContinue(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize)
+{
+	/* Sanity check */
+	if (srcSize != dctx->expected)
+		return ERROR(srcSize_wrong);
+	if (dstCapacity)
+		ZSTD_checkContinuity(dctx, dst);
+
+	switch (dctx->stage) {
+	case ZSTDds_getFrameHeaderSize:
+		if (srcSize != ZSTD_frameHeaderSize_prefix)
+			return ERROR(srcSize_wrong);					/* impossible */
+		if ((ZSTD_readLE32(src) & 0xFFFFFFF0U) == ZSTD_MAGIC_SKIPPABLE_START) { /* skippable frame */
+			memcpy(dctx->headerBuffer, src, ZSTD_frameHeaderSize_prefix);
+			dctx->expected = ZSTD_skippableHeaderSize - ZSTD_frameHeaderSize_prefix; /* magic number + skippable frame length */
+			dctx->stage = ZSTDds_decodeSkippableHeader;
+			return 0;
+		}
+		dctx->headerSize = ZSTD_frameHeaderSize(src, ZSTD_frameHeaderSize_prefix);
+		if (ZSTD_isError(dctx->headerSize))
+			return dctx->headerSize;
+		memcpy(dctx->headerBuffer, src, ZSTD_frameHeaderSize_prefix);
+		if (dctx->headerSize > ZSTD_frameHeaderSize_prefix) {
+			dctx->expected = dctx->headerSize - ZSTD_frameHeaderSize_prefix;
+			dctx->stage = ZSTDds_decodeFrameHeader;
+			return 0;
+		}
+		dctx->expected = 0; /* not necessary to copy more */
+		/* fallthrough */
+
+	case ZSTDds_decodeFrameHeader:
+		memcpy(dctx->headerBuffer + ZSTD_frameHeaderSize_prefix, src, dctx->expected);
+		CHECK_F(ZSTD_decodeFrameHeader(dctx, dctx->headerBuffer, dctx->headerSize));
+		dctx->expected = ZSTD_blockHeaderSize;
+		dctx->stage = ZSTDds_decodeBlockHeader;
+		return 0;
+
+	case ZSTDds_decodeBlockHeader: {
+		blockProperties_t bp;
+		size_t const cBlockSize = ZSTD_getcBlockSize(src, ZSTD_blockHeaderSize, &bp);
+		if (ZSTD_isError(cBlockSize))
+			return cBlockSize;
+		dctx->expected = cBlockSize;
+		dctx->bType = bp.blockType;
+		dctx->rleSize = bp.origSize;
+		if (cBlockSize) {
+			dctx->stage = bp.lastBlock ? ZSTDds_decompressLastBlock : ZSTDds_decompressBlock;
+			return 0;
+		}
+		/* empty block */
+		if (bp.lastBlock) {
+			if (dctx->fParams.checksumFlag) {
+				dctx->expected = 4;
+				dctx->stage = ZSTDds_checkChecksum;
+			} else {
+				dctx->expected = 0; /* end of frame */
+				dctx->stage = ZSTDds_getFrameHeaderSize;
+			}
+		} else {
+			dctx->expected = 3; /* go directly to next header */
+			dctx->stage = ZSTDds_decodeBlockHeader;
+		}
+		return 0;
+	}
+	case ZSTDds_decompressLastBlock:
+	case ZSTDds_decompressBlock: {
+		size_t rSize;
+		switch (dctx->bType) {
+		case bt_compressed: rSize = ZSTD_decompressBlock_internal(dctx, dst, dstCapacity, src, srcSize); break;
+		case bt_raw: rSize = ZSTD_copyRawBlock(dst, dstCapacity, src, srcSize); break;
+		case bt_rle: rSize = ZSTD_setRleBlock(dst, dstCapacity, src, srcSize, dctx->rleSize); break;
+		case bt_reserved: /* should never happen */
+		default: return ERROR(corruption_detected);
+		}
+		if (ZSTD_isError(rSize))
+			return rSize;
+		if (dctx->fParams.checksumFlag)
+			xxh64_update(&dctx->xxhState, dst, rSize);
+
+		if (dctx->stage == ZSTDds_decompressLastBlock) { /* end of frame */
+			if (dctx->fParams.checksumFlag) {	/* another round for frame checksum */
+				dctx->expected = 4;
+				dctx->stage = ZSTDds_checkChecksum;
+			} else {
+				dctx->expected = 0; /* ends here */
+				dctx->stage = ZSTDds_getFrameHeaderSize;
+			}
+		} else {
+			dctx->stage = ZSTDds_decodeBlockHeader;
+			dctx->expected = ZSTD_blockHeaderSize;
+			dctx->previousDstEnd = (char *)dst + rSize;
+		}
+		return rSize;
+	}
+	case ZSTDds_checkChecksum: {
+		U32 const h32 = (U32)xxh64_digest(&dctx->xxhState);
+		U32 const check32 = ZSTD_readLE32(src); /* srcSize == 4, guaranteed by dctx->expected */
+		if (check32 != h32)
+			return ERROR(checksum_wrong);
+		dctx->expected = 0;
+		dctx->stage = ZSTDds_getFrameHeaderSize;
+		return 0;
+	}
+	case ZSTDds_decodeSkippableHeader: {
+		memcpy(dctx->headerBuffer + ZSTD_frameHeaderSize_prefix, src, dctx->expected);
+		dctx->expected = ZSTD_readLE32(dctx->headerBuffer + 4);
+		dctx->stage = ZSTDds_skipFrame;
+		return 0;
+	}
+	case ZSTDds_skipFrame: {
+		dctx->expected = 0;
+		dctx->stage = ZSTDds_getFrameHeaderSize;
+		return 0;
+	}
+	default:
+		return ERROR(GENERIC); /* impossible */
+	}
+}
+
+static size_t INIT ZSTD_refDictContent(ZSTD_DCtx *dctx, const void *dict, size_t dictSize)
+{
+	dctx->dictEnd = dctx->previousDstEnd;
+	dctx->vBase = (const char *)dict - ((const char *)(dctx->previousDstEnd) - (const char *)(dctx->base));
+	dctx->base = dict;
+	dctx->previousDstEnd = (const char *)dict + dictSize;
+	return 0;
+}
+
+/* ZSTD_loadEntropy() :
+ * dict : must point at beginning of a valid zstd dictionary
+ * @return : size of entropy tables read */
+static size_t INIT ZSTD_loadEntropy(ZSTD_entropyTables_t *entropy, const void *const dict, size_t const dictSize)
+{
+	const BYTE *dictPtr = (const BYTE *)dict;
+	const BYTE *const dictEnd = dictPtr + dictSize;
+
+	if (dictSize <= 8)
+		return ERROR(dictionary_corrupted);
+	dictPtr += 8; /* skip header = magic + dictID */
+
+	{
+		size_t const hSize = HUF_readDTableX4_wksp(entropy->hufTable, dictPtr, dictEnd - dictPtr, entropy->workspace, sizeof(entropy->workspace));
+		if (HUF_isError(hSize))
+			return ERROR(dictionary_corrupted);
+		dictPtr += hSize;
+	}
+
+	{
+		short offcodeNCount[MaxOff + 1];
+		U32 offcodeMaxValue = MaxOff, offcodeLog;
+		size_t const offcodeHeaderSize = FSE_readNCount(offcodeNCount, &offcodeMaxValue, &offcodeLog, dictPtr, dictEnd - dictPtr);
+		if (FSE_isError(offcodeHeaderSize))
+			return ERROR(dictionary_corrupted);
+		if (offcodeLog > OffFSELog)
+			return ERROR(dictionary_corrupted);
+		CHECK_E(FSE_buildDTable_wksp(entropy->OFTable, offcodeNCount, offcodeMaxValue, offcodeLog, entropy->workspace, sizeof(entropy->workspace)), dictionary_corrupted);
+		dictPtr += offcodeHeaderSize;
+	}
+
+	{
+		short matchlengthNCount[MaxML + 1];
+		unsigned matchlengthMaxValue = MaxML, matchlengthLog;
+		size_t const matchlengthHeaderSize = FSE_readNCount(matchlengthNCount, &matchlengthMaxValue, &matchlengthLog, dictPtr, dictEnd - dictPtr);
+		if (FSE_isError(matchlengthHeaderSize))
+			return ERROR(dictionary_corrupted);
+		if (matchlengthLog > MLFSELog)
+			return ERROR(dictionary_corrupted);
+		CHECK_E(FSE_buildDTable_wksp(entropy->MLTable, matchlengthNCount, matchlengthMaxValue, matchlengthLog, entropy->workspace, sizeof(entropy->workspace)), dictionary_corrupted);
+		dictPtr += matchlengthHeaderSize;
+	}
+
+	{
+		short litlengthNCount[MaxLL + 1];
+		unsigned litlengthMaxValue = MaxLL, litlengthLog;
+		size_t const litlengthHeaderSize = FSE_readNCount(litlengthNCount, &litlengthMaxValue, &litlengthLog, dictPtr, dictEnd - dictPtr);
+		if (FSE_isError(litlengthHeaderSize))
+			return ERROR(dictionary_corrupted);
+		if (litlengthLog > LLFSELog)
+			return ERROR(dictionary_corrupted);
+		CHECK_E(FSE_buildDTable_wksp(entropy->LLTable, litlengthNCount, litlengthMaxValue, litlengthLog, entropy->workspace, sizeof(entropy->workspace)), dictionary_corrupted);
+		dictPtr += litlengthHeaderSize;
+	}
+
+	if (dictPtr + 12 > dictEnd)
+		return ERROR(dictionary_corrupted);
+	{
+		int i;
+		size_t const dictContentSize = (size_t)(dictEnd - (dictPtr + 12));
+		for (i = 0; i < 3; i++) {
+			U32 const rep = ZSTD_readLE32(dictPtr);
+			dictPtr += 4;
+			if (rep == 0 || rep >= dictContentSize)
+				return ERROR(dictionary_corrupted);
+			entropy->rep[i] = rep;
+		}
+	}
+
+	return dictPtr - (const BYTE *)dict;
+}
+
+static size_t INIT ZSTD_decompress_insertDictionary(ZSTD_DCtx *dctx, const void *dict, size_t dictSize)
+{
+	if (dictSize < 8)
+		return ZSTD_refDictContent(dctx, dict, dictSize);
+	{
+		U32 const magic = ZSTD_readLE32(dict);
+		if (magic != ZSTD_DICT_MAGIC) {
+			return ZSTD_refDictContent(dctx, dict, dictSize); /* pure content mode */
+		}
+	}
+	dctx->dictID = ZSTD_readLE32((const char *)dict + 4);
+
+	/* load entropy tables */
+	{
+		size_t const eSize = ZSTD_loadEntropy(&dctx->entropy, dict, dictSize);
+		if (ZSTD_isError(eSize))
+			return ERROR(dictionary_corrupted);
+		dict = (const char *)dict + eSize;
+		dictSize -= eSize;
+	}
+	dctx->litEntropy = dctx->fseEntropy = 1;
+
+	/* reference dictionary content */
+	return ZSTD_refDictContent(dctx, dict, dictSize);
+}
+
+size_t INIT ZSTD_decompressBegin_usingDict(ZSTD_DCtx *dctx, const void *dict, size_t dictSize)
+{
+	CHECK_F(ZSTD_decompressBegin(dctx));
+	if (dict && dictSize)
+		CHECK_E(ZSTD_decompress_insertDictionary(dctx, dict, dictSize), dictionary_corrupted);
+	return 0;
+}
+
+/* ======   ZSTD_DDict   ====== */
+
+struct ZSTD_DDict_s {
+	void *dictBuffer;
+	const void *dictContent;
+	size_t dictSize;
+	ZSTD_entropyTables_t entropy;
+	U32 dictID;
+	U32 entropyPresent;
+	ZSTD_customMem cMem;
+}; /* typedef'd to ZSTD_DDict within "zstd.h" */
+
+size_t INIT ZSTD_DDictWorkspaceBound(void) { return ZSTD_ALIGN(sizeof(ZSTD_stack)) + ZSTD_ALIGN(sizeof(ZSTD_DDict)); }
+
+static const void *INIT ZSTD_DDictDictContent(const ZSTD_DDict *ddict) { return ddict->dictContent; }
+
+static size_t INIT ZSTD_DDictDictSize(const ZSTD_DDict *ddict) { return ddict->dictSize; }
+
+static void INIT ZSTD_refDDict(ZSTD_DCtx *dstDCtx, const ZSTD_DDict *ddict)
+{
+	ZSTD_decompressBegin(dstDCtx); /* init */
+	if (ddict) {		       /* support refDDict on NULL */
+		dstDCtx->dictID = ddict->dictID;
+		dstDCtx->base = ddict->dictContent;
+		dstDCtx->vBase = ddict->dictContent;
+		dstDCtx->dictEnd = (const BYTE *)ddict->dictContent + ddict->dictSize;
+		dstDCtx->previousDstEnd = dstDCtx->dictEnd;
+		if (ddict->entropyPresent) {
+			dstDCtx->litEntropy = 1;
+			dstDCtx->fseEntropy = 1;
+			dstDCtx->LLTptr = ddict->entropy.LLTable;
+			dstDCtx->MLTptr = ddict->entropy.MLTable;
+			dstDCtx->OFTptr = ddict->entropy.OFTable;
+			dstDCtx->HUFptr = ddict->entropy.hufTable;
+			dstDCtx->entropy.rep[0] = ddict->entropy.rep[0];
+			dstDCtx->entropy.rep[1] = ddict->entropy.rep[1];
+			dstDCtx->entropy.rep[2] = ddict->entropy.rep[2];
+		} else {
+			dstDCtx->litEntropy = 0;
+			dstDCtx->fseEntropy = 0;
+		}
+	}
+}
+
+static size_t INIT ZSTD_loadEntropy_inDDict(ZSTD_DDict *ddict)
+{
+	ddict->dictID = 0;
+	ddict->entropyPresent = 0;
+	if (ddict->dictSize < 8)
+		return 0;
+	{
+		U32 const magic = ZSTD_readLE32(ddict->dictContent);
+		if (magic != ZSTD_DICT_MAGIC)
+			return 0; /* pure content mode */
+	}
+	ddict->dictID = ZSTD_readLE32((const char *)ddict->dictContent + 4);
+
+	/* load entropy tables */
+	CHECK_E(ZSTD_loadEntropy(&ddict->entropy, ddict->dictContent, ddict->dictSize), dictionary_corrupted);
+	ddict->entropyPresent = 1;
+	return 0;
+}
+
+static ZSTD_DDict *INIT ZSTD_createDDict_advanced(const void *dict, size_t dictSize, unsigned byReference, ZSTD_customMem customMem)
+{
+	if (!customMem.customAlloc || !customMem.customFree)
+		return NULL;
+
+	{
+		ZSTD_DDict *const ddict = (ZSTD_DDict *)ZSTD_malloc(sizeof(ZSTD_DDict), customMem);
+		if (!ddict)
+			return NULL;
+		ddict->cMem = customMem;
+
+		if ((byReference) || (!dict) || (!dictSize)) {
+			ddict->dictBuffer = NULL;
+			ddict->dictContent = dict;
+		} else {
+			void *const internalBuffer = ZSTD_malloc(dictSize, customMem);
+			if (!internalBuffer) {
+				ZSTD_freeDDict(ddict);
+				return NULL;
+			}
+			memcpy(internalBuffer, dict, dictSize);
+			ddict->dictBuffer = internalBuffer;
+			ddict->dictContent = internalBuffer;
+		}
+		ddict->dictSize = dictSize;
+		ddict->entropy.hufTable[0] = (HUF_DTable)((HufLog)*0x1000001); /* cover both little and big endian */
+		/* parse dictionary content */
+		{
+			size_t const errorCode = ZSTD_loadEntropy_inDDict(ddict);
+			if (ZSTD_isError(errorCode)) {
+				ZSTD_freeDDict(ddict);
+				return NULL;
+			}
+		}
+
+		return ddict;
+	}
+}
+
+/*! ZSTD_initDDict() :
+*   Create a digested dictionary, to start decompression without startup delay.
+*   `dict` content is copied inside DDict.
+*   Consequently, `dict` can be released after `ZSTD_DDict` creation */
+ZSTD_DDict *INIT ZSTD_initDDict(const void *dict, size_t dictSize, void *workspace, size_t workspaceSize)
+{
+	ZSTD_customMem const stackMem = ZSTD_initStack(workspace, workspaceSize);
+	return ZSTD_createDDict_advanced(dict, dictSize, 1, stackMem);
+}
+
+size_t INIT ZSTD_freeDDict(ZSTD_DDict *ddict)
+{
+	if (ddict == NULL)
+		return 0; /* support free on NULL */
+	{
+		ZSTD_customMem const cMem = ddict->cMem;
+		ZSTD_free(ddict->dictBuffer, cMem);
+		ZSTD_free(ddict, cMem);
+		return 0;
+	}
+}
+
+/*! ZSTD_getDictID_fromDict() :
+ *  Provides the dictID stored within dictionary.
+ *  if @return == 0, the dictionary is not conformant with Zstandard specification.
+ *  It can still be loaded, but as a content-only dictionary. */
+unsigned INIT ZSTD_getDictID_fromDict(const void *dict, size_t dictSize)
+{
+	if (dictSize < 8)
+		return 0;
+	if (ZSTD_readLE32(dict) != ZSTD_DICT_MAGIC)
+		return 0;
+	return ZSTD_readLE32((const char *)dict + 4);
+}
+
+/*! ZSTD_getDictID_fromDDict() :
+ *  Provides the dictID of the dictionary loaded into `ddict`.
+ *  If @return == 0, the dictionary is not conformant to Zstandard specification, or empty.
+ *  Non-conformant dictionaries can still be loaded, but as content-only dictionaries. */
+unsigned INIT ZSTD_getDictID_fromDDict(const ZSTD_DDict *ddict)
+{
+	if (ddict == NULL)
+		return 0;
+	return ZSTD_getDictID_fromDict(ddict->dictContent, ddict->dictSize);
+}
+
+/*! ZSTD_getDictID_fromFrame() :
+ *  Provides the dictID required to decompressed the frame stored within `src`.
+ *  If @return == 0, the dictID could not be decoded.
+ *  This could for one of the following reasons :
+ *  - The frame does not require a dictionary to be decoded (most common case).
+ *  - The frame was built with dictID intentionally removed. Whatever dictionary is necessary is a hidden information.
+ *    Note : this use case also happens when using a non-conformant dictionary.
+ *  - `srcSize` is too small, and as a result, the frame header could not be decoded (only possible if `srcSize < ZSTD_FRAMEHEADERSIZE_MAX`).
+ *  - This is not a Zstandard frame.
+ *  When identifying the exact failure cause, it's possible to used ZSTD_getFrameParams(), which will provide a more precise error code. */
+unsigned INIT ZSTD_getDictID_fromFrame(const void *src, size_t srcSize)
+{
+	ZSTD_frameParams zfp = {0, 0, 0, 0};
+	size_t const hError = ZSTD_getFrameParams(&zfp, src, srcSize);
+	if (ZSTD_isError(hError))
+		return 0;
+	return zfp.dictID;
+}
+
+/*! ZSTD_decompress_usingDDict() :
+*   Decompression using a pre-digested Dictionary
+*   Use dictionary without significant overhead. */
+size_t INIT ZSTD_decompress_usingDDict(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize, const ZSTD_DDict *ddict)
+{
+	/* pass content and size in case legacy frames are encountered */
+	return ZSTD_decompressMultiFrame(dctx, dst, dstCapacity, src, srcSize, NULL, 0, ddict);
+}
+
+/*=====================================
+*   Streaming decompression
+*====================================*/
+
+typedef enum { zdss_init, zdss_loadHeader, zdss_read, zdss_load, zdss_flush } ZSTD_dStreamStage;
+
+/* *** Resource management *** */
+struct ZSTD_DStream_s {
+	ZSTD_DCtx *dctx;
+	ZSTD_DDict *ddictLocal;
+	const ZSTD_DDict *ddict;
+	ZSTD_frameParams fParams;
+	ZSTD_dStreamStage stage;
+	char *inBuff;
+	size_t inBuffSize;
+	size_t inPos;
+	size_t maxWindowSize;
+	char *outBuff;
+	size_t outBuffSize;
+	size_t outStart;
+	size_t outEnd;
+	size_t blockSize;
+	BYTE headerBuffer[ZSTD_FRAMEHEADERSIZE_MAX]; /* tmp buffer to store frame header */
+	size_t lhSize;
+	ZSTD_customMem customMem;
+	void *legacyContext;
+	U32 previousLegacyVersion;
+	U32 legacyVersion;
+	U32 hostageByte;
+}; /* typedef'd to ZSTD_DStream within "zstd.h" */
+
+size_t INIT ZSTD_DStreamWorkspaceBound(size_t maxWindowSize)
+{
+	size_t const blockSize = MIN(maxWindowSize, ZSTD_BLOCKSIZE_ABSOLUTEMAX);
+	size_t const inBuffSize = blockSize;
+	size_t const outBuffSize = maxWindowSize + blockSize + WILDCOPY_OVERLENGTH * 2;
+	return ZSTD_DCtxWorkspaceBound() + ZSTD_ALIGN(sizeof(ZSTD_DStream)) + ZSTD_ALIGN(inBuffSize) + ZSTD_ALIGN(outBuffSize);
+}
+
+static ZSTD_DStream *INIT ZSTD_createDStream_advanced(ZSTD_customMem customMem)
+{
+	ZSTD_DStream *zds;
+
+	if (!customMem.customAlloc || !customMem.customFree)
+		return NULL;
+
+	zds = (ZSTD_DStream *)ZSTD_malloc(sizeof(ZSTD_DStream), customMem);
+	if (zds == NULL)
+		return NULL;
+	memset(zds, 0, sizeof(ZSTD_DStream));
+	memcpy(&zds->customMem, &customMem, sizeof(ZSTD_customMem));
+	zds->dctx = ZSTD_createDCtx_advanced(customMem);
+	if (zds->dctx == NULL) {
+		ZSTD_freeDStream(zds);
+		return NULL;
+	}
+	zds->stage = zdss_init;
+	zds->maxWindowSize = ZSTD_MAXWINDOWSIZE_DEFAULT;
+	return zds;
+}
+
+ZSTD_DStream *INIT ZSTD_initDStream(size_t maxWindowSize, void *workspace, size_t workspaceSize)
+{
+	ZSTD_customMem const stackMem = ZSTD_initStack(workspace, workspaceSize);
+	ZSTD_DStream *zds = ZSTD_createDStream_advanced(stackMem);
+	if (!zds) {
+		return NULL;
+	}
+
+	zds->maxWindowSize = maxWindowSize;
+	zds->stage = zdss_loadHeader;
+	zds->lhSize = zds->inPos = zds->outStart = zds->outEnd = 0;
+	ZSTD_freeDDict(zds->ddictLocal);
+	zds->ddictLocal = NULL;
+	zds->ddict = zds->ddictLocal;
+	zds->legacyVersion = 0;
+	zds->hostageByte = 0;
+
+	{
+		size_t const blockSize = MIN(zds->maxWindowSize, ZSTD_BLOCKSIZE_ABSOLUTEMAX);
+		size_t const neededOutSize = zds->maxWindowSize + blockSize + WILDCOPY_OVERLENGTH * 2;
+
+		zds->inBuff = (char *)ZSTD_malloc(blockSize, zds->customMem);
+		zds->inBuffSize = blockSize;
+		zds->outBuff = (char *)ZSTD_malloc(neededOutSize, zds->customMem);
+		zds->outBuffSize = neededOutSize;
+		if (zds->inBuff == NULL || zds->outBuff == NULL) {
+			ZSTD_freeDStream(zds);
+			return NULL;
+		}
+	}
+	return zds;
+}
+
+ZSTD_DStream *INIT ZSTD_initDStream_usingDDict(size_t maxWindowSize, const ZSTD_DDict *ddict, void *workspace, size_t workspaceSize)
+{
+	ZSTD_DStream *zds = ZSTD_initDStream(maxWindowSize, workspace, workspaceSize);
+	if (zds) {
+		zds->ddict = ddict;
+	}
+	return zds;
+}
+
+size_t INIT ZSTD_freeDStream(ZSTD_DStream *zds)
+{
+	if (zds == NULL)
+		return 0; /* support free on null */
+	{
+		ZSTD_customMem const cMem = zds->customMem;
+		ZSTD_freeDCtx(zds->dctx);
+		zds->dctx = NULL;
+		ZSTD_freeDDict(zds->ddictLocal);
+		zds->ddictLocal = NULL;
+		ZSTD_free(zds->inBuff, cMem);
+		zds->inBuff = NULL;
+		ZSTD_free(zds->outBuff, cMem);
+		zds->outBuff = NULL;
+		ZSTD_free(zds, cMem);
+		return 0;
+	}
+}
+
+/* *** Initialization *** */
+
+size_t INIT ZSTD_DStreamInSize(void) { return ZSTD_BLOCKSIZE_ABSOLUTEMAX + ZSTD_blockHeaderSize; }
+size_t INIT ZSTD_DStreamOutSize(void) { return ZSTD_BLOCKSIZE_ABSOLUTEMAX; }
+
+size_t INIT ZSTD_resetDStream(ZSTD_DStream *zds)
+{
+	zds->stage = zdss_loadHeader;
+	zds->lhSize = zds->inPos = zds->outStart = zds->outEnd = 0;
+	zds->legacyVersion = 0;
+	zds->hostageByte = 0;
+	return ZSTD_frameHeaderSize_prefix;
+}
+
+/* *****   Decompression   ***** */
+
+ZSTD_STATIC size_t INIT ZSTD_limitCopy(void *dst, size_t dstCapacity, const void *src, size_t srcSize)
+{
+	size_t const length = MIN(dstCapacity, srcSize);
+	memcpy(dst, src, length);
+	return length;
+}
+
+size_t INIT ZSTD_decompressStream(ZSTD_DStream *zds, ZSTD_outBuffer *output, ZSTD_inBuffer *input)
+{
+	const char *const istart = (const char *)(input->src) + input->pos;
+	const char *const iend = (const char *)(input->src) + input->size;
+	const char *ip = istart;
+	char *const ostart = (char *)(output->dst) + output->pos;
+	char *const oend = (char *)(output->dst) + output->size;
+	char *op = ostart;
+	U32 someMoreWork = 1;
+
+	while (someMoreWork) {
+		switch (zds->stage) {
+		case zdss_init:
+			ZSTD_resetDStream(zds); /* transparent reset on starting decoding a new frame */
+			/* fallthrough */
+
+		case zdss_loadHeader: {
+			size_t const hSize = ZSTD_getFrameParams(&zds->fParams, zds->headerBuffer, zds->lhSize);
+			if (ZSTD_isError(hSize))
+				return hSize;
+			if (hSize != 0) {				   /* need more input */
+				size_t const toLoad = hSize - zds->lhSize; /* if hSize!=0, hSize > zds->lhSize */
+				if (toLoad > (size_t)(iend - ip)) {	/* not enough input to load full header */
+					memcpy(zds->headerBuffer + zds->lhSize, ip, iend - ip);
+					zds->lhSize += iend - ip;
+					input->pos = input->size;
+					return (MAX(ZSTD_frameHeaderSize_min, hSize) - zds->lhSize) +
+					       ZSTD_blockHeaderSize; /* remaining header bytes + next block header */
+				}
+				memcpy(zds->headerBuffer + zds->lhSize, ip, toLoad);
+				zds->lhSize = hSize;
+				ip += toLoad;
+				break;
+			}
+
+			/* check for single-pass mode opportunity */
+			if (zds->fParams.frameContentSize && zds->fParams.windowSize /* skippable frame if == 0 */
+			    && (U64)(size_t)(oend - op) >= zds->fParams.frameContentSize) {
+				size_t const cSize = ZSTD_findFrameCompressedSize(istart, iend - istart);
+				if (cSize <= (size_t)(iend - istart)) {
+					size_t const decompressedSize = ZSTD_decompress_usingDDict(zds->dctx, op, oend - op, istart, cSize, zds->ddict);
+					if (ZSTD_isError(decompressedSize))
+						return decompressedSize;
+					ip = istart + cSize;
+					op += decompressedSize;
+					zds->dctx->expected = 0;
+					zds->stage = zdss_init;
+					someMoreWork = 0;
+					break;
+				}
+			}
+
+			/* Consume header */
+			ZSTD_refDDict(zds->dctx, zds->ddict);
+			{
+				size_t const h1Size = ZSTD_nextSrcSizeToDecompress(zds->dctx); /* == ZSTD_frameHeaderSize_prefix */
+				CHECK_F(ZSTD_decompressContinue(zds->dctx, NULL, 0, zds->headerBuffer, h1Size));
+				{
+					size_t const h2Size = ZSTD_nextSrcSizeToDecompress(zds->dctx);
+					CHECK_F(ZSTD_decompressContinue(zds->dctx, NULL, 0, zds->headerBuffer + h1Size, h2Size));
+				}
+			}
+
+			zds->fParams.windowSize = MAX(zds->fParams.windowSize, 1U << ZSTD_WINDOWLOG_ABSOLUTEMIN);
+			if (zds->fParams.windowSize > zds->maxWindowSize)
+				return ERROR(frameParameter_windowTooLarge);
+
+			/* Buffers are preallocated, but double check */
+			{
+				size_t const blockSize = MIN(zds->maxWindowSize, ZSTD_BLOCKSIZE_ABSOLUTEMAX);
+				size_t const neededOutSize = zds->maxWindowSize + blockSize + WILDCOPY_OVERLENGTH * 2;
+				if (zds->inBuffSize < blockSize) {
+					return ERROR(GENERIC);
+				}
+				if (zds->outBuffSize < neededOutSize) {
+					return ERROR(GENERIC);
+				}
+				zds->blockSize = blockSize;
+			}
+			zds->stage = zdss_read;
+		}
+			/* fallthrough */
+
+		case zdss_read: {
+			size_t const neededInSize = ZSTD_nextSrcSizeToDecompress(zds->dctx);
+			if (neededInSize == 0) { /* end of frame */
+				zds->stage = zdss_init;
+				someMoreWork = 0;
+				break;
+			}
+			if ((size_t)(iend - ip) >= neededInSize) { /* decode directly from src */
+				const int isSkipFrame = ZSTD_isSkipFrame(zds->dctx);
+				size_t const decodedSize = ZSTD_decompressContinue(zds->dctx, zds->outBuff + zds->outStart,
+										   (isSkipFrame ? 0 : zds->outBuffSize - zds->outStart), ip, neededInSize);
+				if (ZSTD_isError(decodedSize))
+					return decodedSize;
+				ip += neededInSize;
+				if (!decodedSize && !isSkipFrame)
+					break; /* this was just a header */
+				zds->outEnd = zds->outStart + decodedSize;
+				zds->stage = zdss_flush;
+				break;
+			}
+			if (ip == iend) {
+				someMoreWork = 0;
+				break;
+			} /* no more input */
+			zds->stage = zdss_load;
+			/* pass-through */
+		}
+			/* fallthrough */
+
+		case zdss_load: {
+			size_t const neededInSize = ZSTD_nextSrcSizeToDecompress(zds->dctx);
+			size_t const toLoad = neededInSize - zds->inPos; /* should always be <= remaining space within inBuff */
+			size_t loadedSize;
+			if (toLoad > zds->inBuffSize - zds->inPos)
+				return ERROR(corruption_detected); /* should never happen */
+			loadedSize = ZSTD_limitCopy(zds->inBuff + zds->inPos, toLoad, ip, iend - ip);
+			ip += loadedSize;
+			zds->inPos += loadedSize;
+			if (loadedSize < toLoad) {
+				someMoreWork = 0;
+				break;
+			} /* not enough input, wait for more */
+
+			/* decode loaded input */
+			{
+				const int isSkipFrame = ZSTD_isSkipFrame(zds->dctx);
+				size_t const decodedSize = ZSTD_decompressContinue(zds->dctx, zds->outBuff + zds->outStart, zds->outBuffSize - zds->outStart,
+										   zds->inBuff, neededInSize);
+				if (ZSTD_isError(decodedSize))
+					return decodedSize;
+				zds->inPos = 0; /* input is consumed */
+				if (!decodedSize && !isSkipFrame) {
+					zds->stage = zdss_read;
+					break;
+				} /* this was just a header */
+				zds->outEnd = zds->outStart + decodedSize;
+				zds->stage = zdss_flush;
+				/* pass-through */
+			}
+		}
+			/* fallthrough */
+
+		case zdss_flush: {
+			size_t const toFlushSize = zds->outEnd - zds->outStart;
+			size_t const flushedSize = ZSTD_limitCopy(op, oend - op, zds->outBuff + zds->outStart, toFlushSize);
+			op += flushedSize;
+			zds->outStart += flushedSize;
+			if (flushedSize == toFlushSize) { /* flush completed */
+				zds->stage = zdss_read;
+				if (zds->outStart + zds->blockSize > zds->outBuffSize)
+					zds->outStart = zds->outEnd = 0;
+				break;
+			}
+			/* cannot complete flush */
+			someMoreWork = 0;
+			break;
+		}
+		default:
+			return ERROR(GENERIC); /* impossible */
+		}
+	}
+
+	/* result */
+	input->pos += (size_t)(ip - istart);
+	output->pos += (size_t)(op - ostart);
+	{
+		size_t nextSrcSizeHint = ZSTD_nextSrcSizeToDecompress(zds->dctx);
+		if (!nextSrcSizeHint) {			    /* frame fully decoded */
+			if (zds->outEnd == zds->outStart) { /* output fully flushed */
+				if (zds->hostageByte) {
+					if (input->pos >= input->size) {
+						zds->stage = zdss_read;
+						return 1;
+					}	     /* can't release hostage (not present) */
+					input->pos++; /* release hostage */
+				}
+				return 0;
+			}
+			if (!zds->hostageByte) { /* output not fully flushed; keep last byte as hostage; will be released when all output is flushed */
+				input->pos--;    /* note : pos > 0, otherwise, impossible to finish reading last block */
+				zds->hostageByte = 1;
+			}
+			return 1;
+		}
+		nextSrcSizeHint += ZSTD_blockHeaderSize * (ZSTD_nextInputType(zds->dctx) == ZSTDnit_block); /* preload header of next block */
+		if (zds->inPos > nextSrcSizeHint)
+			return ERROR(GENERIC); /* should never happen */
+		nextSrcSizeHint -= zds->inPos; /* already loaded*/
+		return nextSrcSizeHint;
+	}
+}
--- /dev/null
+++ b/xen/common/zstd/entropy_common.c
@@ -0,0 +1,243 @@
+/*
+ * Common functions of New Generation Entropy library
+ * Copyright (C) 2016, Yann Collet.
+ *
+ * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are
+ * met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ * notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above
+ * copyright notice, this list of conditions and the following disclaimer
+ * in the documentation and/or other materials provided with the
+ * distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation. This program is dual-licensed; you may select
+ * either version 2 of the GNU General Public License ("GPL") or BSD license
+ * ("BSD").
+ *
+ * You can contact the author at :
+ * - Source repository : https://github.com/Cyan4973/FiniteStateEntropy
+ */
+
+/* *************************************
+*  Dependencies
+***************************************/
+#include "error_private.h" /* ERR_*, ERROR */
+#include "fse.h"
+#include "huf.h"
+#include "mem.h"
+
+/*===   Version   ===*/
+unsigned INIT FSE_versionNumber(void) { return FSE_VERSION_NUMBER; }
+
+/*===   Error Management   ===*/
+unsigned INIT FSE_isError(size_t code) { return ERR_isError(code); }
+
+unsigned INIT HUF_isError(size_t code) { return ERR_isError(code); }
+
+/*-**************************************************************
+*  FSE NCount encoding-decoding
+****************************************************************/
+size_t INIT FSE_readNCount(short *normalizedCounter, unsigned *maxSVPtr, unsigned *tableLogPtr, const void *headerBuffer, size_t hbSize)
+{
+	const BYTE *const istart = (const BYTE *)headerBuffer;
+	const BYTE *const iend = istart + hbSize;
+	const BYTE *ip = istart;
+	int nbBits;
+	int remaining;
+	int threshold;
+	U32 bitStream;
+	int bitCount;
+	unsigned charnum = 0;
+	int previous0 = 0;
+
+	if (hbSize < 4)
+		return ERROR(srcSize_wrong);
+	bitStream = ZSTD_readLE32(ip);
+	nbBits = (bitStream & 0xF) + FSE_MIN_TABLELOG; /* extract tableLog */
+	if (nbBits > FSE_TABLELOG_ABSOLUTE_MAX)
+		return ERROR(tableLog_tooLarge);
+	bitStream >>= 4;
+	bitCount = 4;
+	*tableLogPtr = nbBits;
+	remaining = (1 << nbBits) + 1;
+	threshold = 1 << nbBits;
+	nbBits++;
+
+	while ((remaining > 1) & (charnum <= *maxSVPtr)) {
+		if (previous0) {
+			unsigned n0 = charnum;
+			while ((bitStream & 0xFFFF) == 0xFFFF) {
+				n0 += 24;
+				if (ip < iend - 5) {
+					ip += 2;
+					bitStream = ZSTD_readLE32(ip) >> bitCount;
+				} else {
+					bitStream >>= 16;
+					bitCount += 16;
+				}
+			}
+			while ((bitStream & 3) == 3) {
+				n0 += 3;
+				bitStream >>= 2;
+				bitCount += 2;
+			}
+			n0 += bitStream & 3;
+			bitCount += 2;
+			if (n0 > *maxSVPtr)
+				return ERROR(maxSymbolValue_tooSmall);
+			while (charnum < n0)
+				normalizedCounter[charnum++] = 0;
+			if ((ip <= iend - 7) || (ip + (bitCount >> 3) <= iend - 4)) {
+				ip += bitCount >> 3;
+				bitCount &= 7;
+				bitStream = ZSTD_readLE32(ip) >> bitCount;
+			} else {
+				bitStream >>= 2;
+			}
+		}
+		{
+			int const max = (2 * threshold - 1) - remaining;
+			int count;
+
+			if ((bitStream & (threshold - 1)) < (U32)max) {
+				count = bitStream & (threshold - 1);
+				bitCount += nbBits - 1;
+			} else {
+				count = bitStream & (2 * threshold - 1);
+				if (count >= threshold)
+					count -= max;
+				bitCount += nbBits;
+			}
+
+			count--;				 /* extra accuracy */
+			remaining -= count < 0 ? -count : count; /* -1 means +1 */
+			normalizedCounter[charnum++] = (short)count;
+			previous0 = !count;
+			while (remaining < threshold) {
+				nbBits--;
+				threshold >>= 1;
+			}
+
+			if ((ip <= iend - 7) || (ip + (bitCount >> 3) <= iend - 4)) {
+				ip += bitCount >> 3;
+				bitCount &= 7;
+			} else {
+				bitCount -= (int)(8 * (iend - 4 - ip));
+				ip = iend - 4;
+			}
+			bitStream = ZSTD_readLE32(ip) >> (bitCount & 31);
+		}
+	} /* while ((remaining>1) & (charnum<=*maxSVPtr)) */
+	if (remaining != 1)
+		return ERROR(corruption_detected);
+	if (bitCount > 32)
+		return ERROR(corruption_detected);
+	*maxSVPtr = charnum - 1;
+
+	ip += (bitCount + 7) >> 3;
+	return ip - istart;
+}
+
+/*! HUF_readStats() :
+	Read compact Huffman tree, saved by HUF_writeCTable().
+	`huffWeight` is destination buffer.
+	`rankStats` is assumed to be a table of at least HUF_TABLELOG_MAX U32.
+	@return : size read from `src` , or an error Code .
+	Note : Needed by HUF_readCTable() and HUF_readDTableX?() .
+*/
+size_t INIT HUF_readStats_wksp(BYTE *huffWeight, size_t hwSize, U32 *rankStats, U32 *nbSymbolsPtr, U32 *tableLogPtr, const void *src, size_t srcSize, void *workspace, size_t workspaceSize)
+{
+	U32 weightTotal;
+	const BYTE *ip = (const BYTE *)src;
+	size_t iSize;
+	size_t oSize;
+
+	if (!srcSize)
+		return ERROR(srcSize_wrong);
+	iSize = ip[0];
+	/* memset(huffWeight, 0, hwSize);   */ /* is not necessary, even though some analyzer complain ... */
+
+	if (iSize >= 128) { /* special header */
+		oSize = iSize - 127;
+		iSize = ((oSize + 1) / 2);
+		if (iSize + 1 > srcSize)
+			return ERROR(srcSize_wrong);
+		if (oSize >= hwSize)
+			return ERROR(corruption_detected);
+		ip += 1;
+		{
+			U32 n;
+			for (n = 0; n < oSize; n += 2) {
+				huffWeight[n] = ip[n / 2] >> 4;
+				huffWeight[n + 1] = ip[n / 2] & 15;
+			}
+		}
+	} else {						 /* header compressed with FSE (normal case) */
+		if (iSize + 1 > srcSize)
+			return ERROR(srcSize_wrong);
+		oSize = FSE_decompress_wksp(huffWeight, hwSize - 1, ip + 1, iSize, 6, workspace, workspaceSize); /* max (hwSize-1) values decoded, as last one is implied */
+		if (FSE_isError(oSize))
+			return oSize;
+	}
+
+	/* collect weight stats */
+	memset(rankStats, 0, (HUF_TABLELOG_MAX + 1) * sizeof(U32));
+	weightTotal = 0;
+	{
+		U32 n;
+		for (n = 0; n < oSize; n++) {
+			if (huffWeight[n] >= HUF_TABLELOG_MAX)
+				return ERROR(corruption_detected);
+			rankStats[huffWeight[n]]++;
+			weightTotal += (1 << huffWeight[n]) >> 1;
+		}
+	}
+	if (weightTotal == 0)
+		return ERROR(corruption_detected);
+
+	/* get last non-null symbol weight (implied, total must be 2^n) */
+	{
+		U32 const tableLog = BIT_highbit32(weightTotal) + 1;
+		if (tableLog > HUF_TABLELOG_MAX)
+			return ERROR(corruption_detected);
+		*tableLogPtr = tableLog;
+		/* determine last weight */
+		{
+			U32 const total = 1 << tableLog;
+			U32 const rest = total - weightTotal;
+			U32 const verif = 1 << BIT_highbit32(rest);
+			U32 const lastWeight = BIT_highbit32(rest) + 1;
+			if (verif != rest)
+				return ERROR(corruption_detected); /* last value must be a clean power of 2 */
+			huffWeight[oSize] = (BYTE)lastWeight;
+			rankStats[lastWeight]++;
+		}
+	}
+
+	/* check tree construction validity */
+	if ((rankStats[1] < 2) || (rankStats[1] & 1))
+		return ERROR(corruption_detected); /* by construction : at least 2 elts of rank 1, must be even */
+
+	/* results */
+	*nbSymbolsPtr = (U32)(oSize + 1);
+	return iSize + 1;
+}
--- /dev/null
+++ b/xen/common/zstd/error_private.h
@@ -0,0 +1,110 @@
+/**
+ * Copyright (c) 2016-present, Yann Collet, Facebook, Inc.
+ * All rights reserved.
+ *
+ * This source code is licensed under the BSD-style license found in the
+ * LICENSE file in the root directory of https://github.com/facebook/zstd.
+ * An additional grant of patent rights can be found in the PATENTS file in the
+ * same directory.
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation. This program is dual-licensed; you may select
+ * either version 2 of the GNU General Public License ("GPL") or BSD license
+ * ("BSD").
+ */
+
+/* Note : this module is expected to remain private, do not expose it */
+
+#ifndef ERROR_H_MODULE
+#define ERROR_H_MODULE
+
+/* ****************************************
+*  Dependencies
+******************************************/
+#include <xen/types.h> /* size_t */
+
+/**
+ * enum ZSTD_ErrorCode - zstd error codes
+ *
+ * Functions that return size_t can be checked for errors using ZSTD_isError()
+ * and the ZSTD_ErrorCode can be extracted using ZSTD_getErrorCode().
+ */
+typedef enum {
+	ZSTD_error_no_error,
+	ZSTD_error_GENERIC,
+	ZSTD_error_prefix_unknown,
+	ZSTD_error_version_unsupported,
+	ZSTD_error_parameter_unknown,
+	ZSTD_error_frameParameter_unsupported,
+	ZSTD_error_frameParameter_unsupportedBy32bits,
+	ZSTD_error_frameParameter_windowTooLarge,
+	ZSTD_error_compressionParameter_unsupported,
+	ZSTD_error_init_missing,
+	ZSTD_error_memory_allocation,
+	ZSTD_error_stage_wrong,
+	ZSTD_error_dstSize_tooSmall,
+	ZSTD_error_srcSize_wrong,
+	ZSTD_error_corruption_detected,
+	ZSTD_error_checksum_wrong,
+	ZSTD_error_tableLog_tooLarge,
+	ZSTD_error_maxSymbolValue_tooLarge,
+	ZSTD_error_maxSymbolValue_tooSmall,
+	ZSTD_error_dictionary_corrupted,
+	ZSTD_error_dictionary_wrong,
+	ZSTD_error_dictionaryCreation_failed,
+	ZSTD_error_maxCode
+} ZSTD_ErrorCode;
+
+/* ****************************************
+*  Compiler-specific
+******************************************/
+#define ERR_STATIC static __attribute__((unused))
+
+/*-****************************************
+*  Customization (error_public.h)
+******************************************/
+typedef ZSTD_ErrorCode ERR_enum;
+#define PREFIX(name) ZSTD_error_##name
+
+/*-****************************************
+*  Error codes handling
+******************************************/
+#define ERROR(name) ((size_t)-PREFIX(name))
+
+ERR_STATIC unsigned INIT ERR_isError(size_t code) { return (code > ERROR(maxCode)); }
+
+ERR_STATIC ERR_enum INIT ERR_getErrorCode(size_t code)
+{
+	if (!ERR_isError(code))
+		return (ERR_enum)0;
+	return (ERR_enum)(0 - code);
+}
+
+/**
+ * ZSTD_isError() - tells if a size_t function result is an error code
+ * @code:  The function result to check for error.
+ *
+ * Return: Non-zero iff the code is an error.
+ */
+static __attribute__((unused)) unsigned int INIT ZSTD_isError(size_t code)
+{
+	return code > (size_t)-ZSTD_error_maxCode;
+}
+
+/**
+ * ZSTD_getErrorCode() - translates an error function result to a ZSTD_ErrorCode
+ * @functionResult: The result of a function for which ZSTD_isError() is true.
+ *
+ * Return:          The ZSTD_ErrorCode corresponding to the functionResult or 0
+ *                  if the functionResult isn't an error.
+ */
+static __attribute__((unused)) ZSTD_ErrorCode INIT ZSTD_getErrorCode(
+	size_t functionResult)
+{
+	if (!ZSTD_isError(functionResult))
+		return (ZSTD_ErrorCode)0;
+	return (ZSTD_ErrorCode)(0 - functionResult);
+}
+
+#endif /* ERROR_H_MODULE */
--- /dev/null
+++ b/xen/common/zstd/fse.h
@@ -0,0 +1,575 @@
+/*
+ * FSE : Finite State Entropy codec
+ * Public Prototypes declaration
+ * Copyright (C) 2013-2016, Yann Collet.
+ *
+ * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are
+ * met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ * notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above
+ * copyright notice, this list of conditions and the following disclaimer
+ * in the documentation and/or other materials provided with the
+ * distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation. This program is dual-licensed; you may select
+ * either version 2 of the GNU General Public License ("GPL") or BSD license
+ * ("BSD").
+ *
+ * You can contact the author at :
+ * - Source repository : https://github.com/Cyan4973/FiniteStateEntropy
+ */
+#ifndef FSE_H
+#define FSE_H
+
+/*-*****************************************
+*  Dependencies
+******************************************/
+#include <xen/types.h> /* size_t, ptrdiff_t */
+
+/*-*****************************************
+*  FSE_PUBLIC_API : control library symbols visibility
+******************************************/
+#define FSE_PUBLIC_API
+
+/*------   Version   ------*/
+#define FSE_VERSION_MAJOR 0
+#define FSE_VERSION_MINOR 9
+#define FSE_VERSION_RELEASE 0
+
+#define FSE_LIB_VERSION FSE_VERSION_MAJOR.FSE_VERSION_MINOR.FSE_VERSION_RELEASE
+#define FSE_QUOTE(str) #str
+#define FSE_EXPAND_AND_QUOTE(str) FSE_QUOTE(str)
+#define FSE_VERSION_STRING FSE_EXPAND_AND_QUOTE(FSE_LIB_VERSION)
+
+#define FSE_VERSION_NUMBER (FSE_VERSION_MAJOR * 100 * 100 + FSE_VERSION_MINOR * 100 + FSE_VERSION_RELEASE)
+FSE_PUBLIC_API unsigned FSE_versionNumber(void); /**< library version number; to be used when checking dll version */
+
+/*-*****************************************
+*  Tool functions
+******************************************/
+FSE_PUBLIC_API size_t FSE_compressBound(size_t size); /* maximum compressed size */
+
+/* Error Management */
+FSE_PUBLIC_API unsigned FSE_isError(size_t code); /* tells if a return value is an error code */
+
+/*-*****************************************
+*  FSE detailed API
+******************************************/
+/*!
+FSE_compress() does the following:
+1. count symbol occurrence from source[] into table count[]
+2. normalize counters so that sum(count[]) == Power_of_2 (2^tableLog)
+3. save normalized counters to memory buffer using writeNCount()
+4. build encoding table 'CTable' from normalized counters
+5. encode the data stream using encoding table 'CTable'
+
+FSE_decompress() does the following:
+1. read normalized counters with readNCount()
+2. build decoding table 'DTable' from normalized counters
+3. decode the data stream using decoding table 'DTable'
+
+The following API allows targeting specific sub-functions for advanced tasks.
+For example, it's possible to compress several blocks using the same 'CTable',
+or to save and provide normalized distribution using external method.
+*/
+
+/* *** COMPRESSION *** */
+/*! FSE_optimalTableLog():
+	dynamically downsize 'tableLog' when conditions are met.
+	It saves CPU time, by using smaller tables, while preserving or even improving compression ratio.
+	@return : recommended tableLog (necessarily <= 'maxTableLog') */
+FSE_PUBLIC_API unsigned FSE_optimalTableLog(unsigned maxTableLog, size_t srcSize, unsigned maxSymbolValue);
+
+/*! FSE_normalizeCount():
+	normalize counts so that sum(count[]) == Power_of_2 (2^tableLog)
+	'normalizedCounter' is a table of short, of minimum size (maxSymbolValue+1).
+	@return : tableLog,
+			  or an errorCode, which can be tested using FSE_isError() */
+FSE_PUBLIC_API size_t FSE_normalizeCount(short *normalizedCounter, unsigned tableLog, const unsigned *count, size_t srcSize, unsigned maxSymbolValue);
+
+/*! FSE_NCountWriteBound():
+	Provides the maximum possible size of an FSE normalized table, given 'maxSymbolValue' and 'tableLog'.
+	Typically useful for allocation purpose. */
+FSE_PUBLIC_API size_t FSE_NCountWriteBound(unsigned maxSymbolValue, unsigned tableLog);
+
+/*! FSE_writeNCount():
+	Compactly save 'normalizedCounter' into 'buffer'.
+	@return : size of the compressed table,
+			  or an errorCode, which can be tested using FSE_isError(). */
+FSE_PUBLIC_API size_t FSE_writeNCount(void *buffer, size_t bufferSize, const short *normalizedCounter, unsigned maxSymbolValue, unsigned tableLog);
+
+/*! Constructor and Destructor of FSE_CTable.
+	Note that FSE_CTable size depends on 'tableLog' and 'maxSymbolValue' */
+typedef unsigned FSE_CTable; /* don't allocate that. It's only meant to be more restrictive than void* */
+
+/*! FSE_compress_usingCTable():
+	Compress `src` using `ct` into `dst` which must be already allocated.
+	@return : size of compressed data (<= `dstCapacity`),
+			  or 0 if compressed data could not fit into `dst`,
+			  or an errorCode, which can be tested using FSE_isError() */
+FSE_PUBLIC_API size_t FSE_compress_usingCTable(void *dst, size_t dstCapacity, const void *src, size_t srcSize, const FSE_CTable *ct);
+
+/*!
+Tutorial :
+----------
+The first step is to count all symbols. FSE_count() does this job very fast.
+Result will be saved into 'count', a table of unsigned int, which must be already allocated, and have 'maxSymbolValuePtr[0]+1' cells.
+'src' is a table of bytes of size 'srcSize'. All values within 'src' MUST be <= maxSymbolValuePtr[0]
+maxSymbolValuePtr[0] will be updated, with its real value (necessarily <= original value)
+FSE_count() will return the number of occurrence of the most frequent symbol.
+This can be used to know if there is a single symbol within 'src', and to quickly evaluate its compressibility.
+If there is an error, the function will return an ErrorCode (which can be tested using FSE_isError()).
+
+The next step is to normalize the frequencies.
+FSE_normalizeCount() will ensure that sum of frequencies is == 2 ^'tableLog'.
+It also guarantees a minimum of 1 to any Symbol with frequency >= 1.
+You can use 'tableLog'==0 to mean "use default tableLog value".
+If you are unsure of which tableLog value to use, you can ask FSE_optimalTableLog(),
+which will provide the optimal valid tableLog given sourceSize, maxSymbolValue, and a user-defined maximum (0 means "default").
+
+The result of FSE_normalizeCount() will be saved into a table,
+called 'normalizedCounter', which is a table of signed short.
+'normalizedCounter' must be already allocated, and have at least 'maxSymbolValue+1' cells.
+The return value is tableLog if everything proceeded as expected.
+It is 0 if there is a single symbol within distribution.
+If there is an error (ex: invalid tableLog value), the function will return an ErrorCode (which can be tested using FSE_isError()).
+
+'normalizedCounter' can be saved in a compact manner to a memory area using FSE_writeNCount().
+'buffer' must be already allocated.
+For guaranteed success, buffer size must be at least FSE_headerBound().
+The result of the function is the number of bytes written into 'buffer'.
+If there is an error, the function will return an ErrorCode (which can be tested using FSE_isError(); ex : buffer size too small).
+
+'normalizedCounter' can then be used to create the compression table 'CTable'.
+The space required by 'CTable' must be already allocated, using FSE_createCTable().
+You can then use FSE_buildCTable() to fill 'CTable'.
+If there is an error, both functions will return an ErrorCode (which can be tested using FSE_isError()).
+
+'CTable' can then be used to compress 'src', with FSE_compress_usingCTable().
+Similar to FSE_count(), the convention is that 'src' is assumed to be a table of char of size 'srcSize'
+The function returns the size of compressed data (without header), necessarily <= `dstCapacity`.
+If it returns '0', compressed data could not fit into 'dst'.
+If there is an error, the function will return an ErrorCode (which can be tested using FSE_isError()).
+*/
+
+/* *** DECOMPRESSION *** */
+
+/*! FSE_readNCount():
+	Read compactly saved 'normalizedCounter' from 'rBuffer'.
+	@return : size read from 'rBuffer',
+			  or an errorCode, which can be tested using FSE_isError().
+			  maxSymbolValuePtr[0] and tableLogPtr[0] will also be updated with their respective values */
+FSE_PUBLIC_API size_t FSE_readNCount(short *normalizedCounter, unsigned *maxSymbolValuePtr, unsigned *tableLogPtr, const void *rBuffer, size_t rBuffSize);
+
+/*! Constructor and Destructor of FSE_DTable.
+	Note that its size depends on 'tableLog' */
+typedef unsigned FSE_DTable; /* don't allocate that. It's just a way to be more restrictive than void* */
+
+/*! FSE_buildDTable():
+	Builds 'dt', which must be already allocated, using FSE_createDTable().
+	return : 0, or an errorCode, which can be tested using FSE_isError() */
+FSE_PUBLIC_API size_t FSE_buildDTable_wksp(FSE_DTable *dt, const short *normalizedCounter, unsigned maxSymbolValue, unsigned tableLog, void *workspace, size_t workspaceSize);
+
+/*! FSE_decompress_usingDTable():
+	Decompress compressed source `cSrc` of size `cSrcSize` using `dt`
+	into `dst` which must be already allocated.
+	@return : size of regenerated data (necessarily <= `dstCapacity`),
+			  or an errorCode, which can be tested using FSE_isError() */
+FSE_PUBLIC_API size_t FSE_decompress_usingDTable(void *dst, size_t dstCapacity, const void *cSrc, size_t cSrcSize, const FSE_DTable *dt);
+
+/*!
+Tutorial :
+----------
+(Note : these functions only decompress FSE-compressed blocks.
+ If block is uncompressed, use memcpy() instead
+ If block is a single repeated byte, use memset() instead )
+
+The first step is to obtain the normalized frequencies of symbols.
+This can be performed by FSE_readNCount() if it was saved using FSE_writeNCount().
+'normalizedCounter' must be already allocated, and have at least 'maxSymbolValuePtr[0]+1' cells of signed short.
+In practice, that means it's necessary to know 'maxSymbolValue' beforehand,
+or size the table to handle worst case situations (typically 256).
+FSE_readNCount() will provide 'tableLog' and 'maxSymbolValue'.
+The result of FSE_readNCount() is the number of bytes read from 'rBuffer'.
+Note that 'rBufferSize' must be at least 4 bytes, even if useful information is less than that.
+If there is an error, the function will return an error code, which can be tested using FSE_isError().
+
+The next step is to build the decompression tables 'FSE_DTable' from 'normalizedCounter'.
+This is performed by the function FSE_buildDTable().
+The space required by 'FSE_DTable' must be already allocated using FSE_createDTable().
+If there is an error, the function will return an error code, which can be tested using FSE_isError().
+
+`FSE_DTable` can then be used to decompress `cSrc`, with FSE_decompress_usingDTable().
+`cSrcSize` must be strictly correct, otherwise decompression will fail.
+FSE_decompress_usingDTable() result will tell how many bytes were regenerated (<=`dstCapacity`).
+If there is an error, the function will return an error code, which can be tested using FSE_isError(). (ex: dst buffer too small)
+*/
+
+/* *** Dependency *** */
+#include "bitstream.h"
+
+/* *****************************************
+*  Static allocation
+*******************************************/
+/* FSE buffer bounds */
+#define FSE_NCOUNTBOUND 512
+#define FSE_BLOCKBOUND(size) (size + (size >> 7))
+#define FSE_COMPRESSBOUND(size) (FSE_NCOUNTBOUND + FSE_BLOCKBOUND(size)) /* Macro version, useful for static allocation */
+
+/* It is possible to statically allocate FSE CTable/DTable as a table of FSE_CTable/FSE_DTable using below macros */
+#define FSE_CTABLE_SIZE_U32(maxTableLog, maxSymbolValue) (1 + (1 << (maxTableLog - 1)) + ((maxSymbolValue + 1) * 2))
+#define FSE_DTABLE_SIZE_U32(maxTableLog) (1 + (1 << maxTableLog))
+
+/* *****************************************
+*  FSE advanced API
+*******************************************/
+/* FSE_count_wksp() :
+ * Same as FSE_count(), but using an externally provided scratch buffer.
+ * `workSpace` size must be table of >= `1024` unsigned
+ */
+size_t FSE_count_wksp(unsigned *count, unsigned *maxSymbolValuePtr, const void *source, size_t sourceSize, unsigned *workSpace);
+
+/* FSE_countFast_wksp() :
+ * Same as FSE_countFast(), but using an externally provided scratch buffer.
+ * `workSpace` must be a table of minimum `1024` unsigned
+ */
+size_t FSE_countFast_wksp(unsigned *count, unsigned *maxSymbolValuePtr, const void *src, size_t srcSize, unsigned *workSpace);
+
+/*! FSE_count_simple
+ * Same as FSE_countFast(), but does not use any additional memory (not even on stack).
+ * This function is unsafe, and will segfault if any value within `src` is `> *maxSymbolValuePtr` (presuming it's also the size of `count`).
+*/
+size_t FSE_count_simple(unsigned *count, unsigned *maxSymbolValuePtr, const void *src, size_t srcSize);
+
+unsigned FSE_optimalTableLog_internal(unsigned maxTableLog, size_t srcSize, unsigned maxSymbolValue, unsigned minus);
+/**< same as FSE_optimalTableLog(), which used `minus==2` */
+
+size_t FSE_buildCTable_raw(FSE_CTable *ct, unsigned nbBits);
+/**< build a fake FSE_CTable, designed for a flat distribution, where each symbol uses nbBits */
+
+size_t FSE_buildCTable_rle(FSE_CTable *ct, unsigned char symbolValue);
+/**< build a fake FSE_CTable, designed to compress always the same symbolValue */
+
+/* FSE_buildCTable_wksp() :
+ * Same as FSE_buildCTable(), but using an externally allocated scratch buffer (`workSpace`).
+ * `wkspSize` must be >= `(1<<tableLog)`.
+ */
+size_t FSE_buildCTable_wksp(FSE_CTable *ct, const short *normalizedCounter, unsigned maxSymbolValue, unsigned tableLog, void *workSpace, size_t wkspSize);
+
+size_t FSE_buildDTable_raw(FSE_DTable *dt, unsigned nbBits);
+/**< build a fake FSE_DTable, designed to read a flat distribution where each symbol uses nbBits */
+
+size_t FSE_buildDTable_rle(FSE_DTable *dt, unsigned char symbolValue);
+/**< build a fake FSE_DTable, designed to always generate the same symbolValue */
+
+size_t FSE_decompress_wksp(void *dst, size_t dstCapacity, const void *cSrc, size_t cSrcSize, unsigned maxLog, void *workspace, size_t workspaceSize);
+/**< same as FSE_decompress(), using an externally allocated `workSpace` produced with `FSE_DTABLE_SIZE_U32(maxLog)` */
+
+/* *****************************************
+*  FSE symbol compression API
+*******************************************/
+/*!
+   This API consists of small unitary functions, which highly benefit from being inlined.
+   Hence their body are included in next section.
+*/
+typedef struct {
+	ptrdiff_t value;
+	const void *stateTable;
+	const void *symbolTT;
+	unsigned stateLog;
+} FSE_CState_t;
+
+static void FSE_initCState(FSE_CState_t *CStatePtr, const FSE_CTable *ct);
+
+static void FSE_encodeSymbol(BIT_CStream_t *bitC, FSE_CState_t *CStatePtr, unsigned symbol);
+
+static void FSE_flushCState(BIT_CStream_t *bitC, const FSE_CState_t *CStatePtr);
+
+/**<
+These functions are inner components of FSE_compress_usingCTable().
+They allow the creation of custom streams, mixing multiple tables and bit sources.
+
+A key property to keep in mind is that encoding and decoding are done **in reverse direction**.
+So the first symbol you will encode is the last you will decode, like a LIFO stack.
+
+You will need a few variables to track your CStream. They are :
+
+FSE_CTable    ct;         // Provided by FSE_buildCTable()
+BIT_CStream_t bitStream;  // bitStream tracking structure
+FSE_CState_t  state;      // State tracking structure (can have several)
+
+
+The first thing to do is to init bitStream and state.
+	size_t errorCode = BIT_initCStream(&bitStream, dstBuffer, maxDstSize);
+	FSE_initCState(&state, ct);
+
+Note that BIT_initCStream() can produce an error code, so its result should be tested, using FSE_isError();
+You can then encode your input data, byte after byte.
+FSE_encodeSymbol() outputs a maximum of 'tableLog' bits at a time.
+Remember decoding will be done in reverse direction.
+	FSE_encodeByte(&bitStream, &state, symbol);
+
+At any time, you can also add any bit sequence.
+Note : maximum allowed nbBits is 25, for compatibility with 32-bits decoders
+	BIT_addBits(&bitStream, bitField, nbBits);
+
+The above methods don't commit data to memory, they just store it into local register, for speed.
+Local register size is 64-bits on 64-bits systems, 32-bits on 32-bits systems (size_t).
+Writing data to memory is a manual operation, performed by the flushBits function.
+	BIT_flushBits(&bitStream);
+
+Your last FSE encoding operation shall be to flush your last state value(s).
+	FSE_flushState(&bitStream, &state);
+
+Finally, you must close the bitStream.
+The function returns the size of CStream in bytes.
+If data couldn't fit into dstBuffer, it will return a 0 ( == not compressible)
+If there is an error, it returns an errorCode (which can be tested using FSE_isError()).
+	size_t size = BIT_closeCStream(&bitStream);
+*/
+
+/* *****************************************
+*  FSE symbol decompression API
+*******************************************/
+typedef struct {
+	size_t state;
+	const void *table; /* precise table may vary, depending on U16 */
+} FSE_DState_t;
+
+static void FSE_initDState(FSE_DState_t *DStatePtr, BIT_DStream_t *bitD, const FSE_DTable *dt);
+
+static unsigned char FSE_decodeSymbol(FSE_DState_t *DStatePtr, BIT_DStream_t *bitD);
+
+static unsigned FSE_endOfDState(const FSE_DState_t *DStatePtr);
+
+/**<
+Let's now decompose FSE_decompress_usingDTable() into its unitary components.
+You will decode FSE-encoded symbols from the bitStream,
+and also any other bitFields you put in, **in reverse order**.
+
+You will need a few variables to track your bitStream. They are :
+
+BIT_DStream_t DStream;    // Stream context
+FSE_DState_t  DState;     // State context. Multiple ones are possible
+FSE_DTable*   DTablePtr;  // Decoding table, provided by FSE_buildDTable()
+
+The first thing to do is to init the bitStream.
+	errorCode = BIT_initDStream(&DStream, srcBuffer, srcSize);
+
+You should then retrieve your initial state(s)
+(in reverse flushing order if you have several ones) :
+	errorCode = FSE_initDState(&DState, &DStream, DTablePtr);
+
+You can then decode your data, symbol after symbol.
+For information the maximum number of bits read by FSE_decodeSymbol() is 'tableLog'.
+Keep in mind that symbols are decoded in reverse order, like a LIFO stack (last in, first out).
+	unsigned char symbol = FSE_decodeSymbol(&DState, &DStream);
+
+You can retrieve any bitfield you eventually stored into the bitStream (in reverse order)
+Note : maximum allowed nbBits is 25, for 32-bits compatibility
+	size_t bitField = BIT_readBits(&DStream, nbBits);
+
+All above operations only read from local register (which size depends on size_t).
+Refueling the register from memory is manually performed by the reload method.
+	endSignal = FSE_reloadDStream(&DStream);
+
+BIT_reloadDStream() result tells if there is still some more data to read from DStream.
+BIT_DStream_unfinished : there is still some data left into the DStream.
+BIT_DStream_endOfBuffer : Dstream reached end of buffer. Its container may no longer be completely filled.
+BIT_DStream_completed : Dstream reached its exact end, corresponding in general to decompression completed.
+BIT_DStream_tooFar : Dstream went too far. Decompression result is corrupted.
+
+When reaching end of buffer (BIT_DStream_endOfBuffer), progress slowly, notably if you decode multiple symbols per loop,
+to properly detect the exact end of stream.
+After each decoded symbol, check if DStream is fully consumed using this simple test :
+	BIT_reloadDStream(&DStream) >= BIT_DStream_completed
+
+When it's done, verify decompression is fully completed, by checking both DStream and the relevant states.
+Checking if DStream has reached its end is performed by :
+	BIT_endOfDStream(&DStream);
+Check also the states. There might be some symbols left there, if some high probability ones (>50%) are possible.
+	FSE_endOfDState(&DState);
+*/
+
+/* *****************************************
+*  FSE unsafe API
+*******************************************/
+static unsigned char FSE_decodeSymbolFast(FSE_DState_t *DStatePtr, BIT_DStream_t *bitD);
+/* faster, but works only if nbBits is always >= 1 (otherwise, result will be corrupted) */
+
+/* *****************************************
+*  Implementation of inlined functions
+*******************************************/
+typedef struct {
+	int deltaFindState;
+	U32 deltaNbBits;
+} FSE_symbolCompressionTransform; /* total 8 bytes */
+
+ZSTD_STATIC void FSE_initCState(FSE_CState_t *statePtr, const FSE_CTable *ct)
+{
+	const void *ptr = ct;
+	const U16 *u16ptr = (const U16 *)ptr;
+	const U32 tableLog = ZSTD_read16(ptr);
+	statePtr->value = (ptrdiff_t)1 << tableLog;
+	statePtr->stateTable = u16ptr + 2;
+	statePtr->symbolTT = ((const U32 *)ct + 1 + (tableLog ? (1 << (tableLog - 1)) : 1));
+	statePtr->stateLog = tableLog;
+}
+
+/*! FSE_initCState2() :
+*   Same as FSE_initCState(), but the first symbol to include (which will be the last to be read)
+*   uses the smallest state value possible, saving the cost of this symbol */
+ZSTD_STATIC void FSE_initCState2(FSE_CState_t *statePtr, const FSE_CTable *ct, U32 symbol)
+{
+	FSE_initCState(statePtr, ct);
+	{
+		const FSE_symbolCompressionTransform symbolTT = ((const FSE_symbolCompressionTransform *)(statePtr->symbolTT))[symbol];
+		const U16 *stateTable = (const U16 *)(statePtr->stateTable);
+		U32 nbBitsOut = (U32)((symbolTT.deltaNbBits + (1 << 15)) >> 16);
+		statePtr->value = (nbBitsOut << 16) - symbolTT.deltaNbBits;
+		statePtr->value = stateTable[(statePtr->value >> nbBitsOut) + symbolTT.deltaFindState];
+	}
+}
+
+ZSTD_STATIC void FSE_encodeSymbol(BIT_CStream_t *bitC, FSE_CState_t *statePtr, U32 symbol)
+{
+	const FSE_symbolCompressionTransform symbolTT = ((const FSE_symbolCompressionTransform *)(statePtr->symbolTT))[symbol];
+	const U16 *const stateTable = (const U16 *)(statePtr->stateTable);
+	U32 nbBitsOut = (U32)((statePtr->value + symbolTT.deltaNbBits) >> 16);
+	BIT_addBits(bitC, statePtr->value, nbBitsOut);
+	statePtr->value = stateTable[(statePtr->value >> nbBitsOut) + symbolTT.deltaFindState];
+}
+
+ZSTD_STATIC void FSE_flushCState(BIT_CStream_t *bitC, const FSE_CState_t *statePtr)
+{
+	BIT_addBits(bitC, statePtr->value, statePtr->stateLog);
+	BIT_flushBits(bitC);
+}
+
+/* ======    Decompression    ====== */
+
+typedef struct {
+	U16 tableLog;
+	U16 fastMode;
+} FSE_DTableHeader; /* sizeof U32 */
+
+typedef struct {
+	unsigned short newState;
+	unsigned char symbol;
+	unsigned char nbBits;
+} FSE_decode_t; /* size == U32 */
+
+ZSTD_STATIC void FSE_initDState(FSE_DState_t *DStatePtr, BIT_DStream_t *bitD, const FSE_DTable *dt)
+{
+	const void *ptr = dt;
+	const FSE_DTableHeader *const DTableH = (const FSE_DTableHeader *)ptr;
+	DStatePtr->state = BIT_readBits(bitD, DTableH->tableLog);
+	BIT_reloadDStream(bitD);
+	DStatePtr->table = dt + 1;
+}
+
+ZSTD_STATIC BYTE FSE_peekSymbol(const FSE_DState_t *DStatePtr)
+{
+	FSE_decode_t const DInfo = ((const FSE_decode_t *)(DStatePtr->table))[DStatePtr->state];
+	return DInfo.symbol;
+}
+
+ZSTD_STATIC void FSE_updateState(FSE_DState_t *DStatePtr, BIT_DStream_t *bitD)
+{
+	FSE_decode_t const DInfo = ((const FSE_decode_t *)(DStatePtr->table))[DStatePtr->state];
+	U32 const nbBits = DInfo.nbBits;
+	size_t const lowBits = BIT_readBits(bitD, nbBits);
+	DStatePtr->state = DInfo.newState + lowBits;
+}
+
+ZSTD_STATIC BYTE FSE_decodeSymbol(FSE_DState_t *DStatePtr, BIT_DStream_t *bitD)
+{
+	FSE_decode_t const DInfo = ((const FSE_decode_t *)(DStatePtr->table))[DStatePtr->state];
+	U32 const nbBits = DInfo.nbBits;
+	BYTE const symbol = DInfo.symbol;
+	size_t const lowBits = BIT_readBits(bitD, nbBits);
+
+	DStatePtr->state = DInfo.newState + lowBits;
+	return symbol;
+}
+
+/*! FSE_decodeSymbolFast() :
+	unsafe, only works if no symbol has a probability > 50% */
+ZSTD_STATIC BYTE FSE_decodeSymbolFast(FSE_DState_t *DStatePtr, BIT_DStream_t *bitD)
+{
+	FSE_decode_t const DInfo = ((const FSE_decode_t *)(DStatePtr->table))[DStatePtr->state];
+	U32 const nbBits = DInfo.nbBits;
+	BYTE const symbol = DInfo.symbol;
+	size_t const lowBits = BIT_readBitsFast(bitD, nbBits);
+
+	DStatePtr->state = DInfo.newState + lowBits;
+	return symbol;
+}
+
+ZSTD_STATIC unsigned FSE_endOfDState(const FSE_DState_t *DStatePtr) { return DStatePtr->state == 0; }
+
+/* **************************************************************
+*  Tuning parameters
+****************************************************************/
+/*!MEMORY_USAGE :
+*  Memory usage formula : N->2^N Bytes (examples : 10 -> 1KB; 12 -> 4KB ; 16 -> 64KB; 20 -> 1MB; etc.)
+*  Increasing memory usage improves compression ratio
+*  Reduced memory usage can improve speed, due to cache effect
+*  Recommended max value is 14, for 16KB, which nicely fits into Intel x86 L1 cache */
+#ifndef FSE_MAX_MEMORY_USAGE
+#define FSE_MAX_MEMORY_USAGE 14
+#endif
+#ifndef FSE_DEFAULT_MEMORY_USAGE
+#define FSE_DEFAULT_MEMORY_USAGE 13
+#endif
+
+/*!FSE_MAX_SYMBOL_VALUE :
+*  Maximum symbol value authorized.
+*  Required for proper stack allocation */
+#ifndef FSE_MAX_SYMBOL_VALUE
+#define FSE_MAX_SYMBOL_VALUE 255
+#endif
+
+/* **************************************************************
+*  template functions type & suffix
+****************************************************************/
+#define FSE_FUNCTION_TYPE BYTE
+#define FSE_FUNCTION_EXTENSION
+#define FSE_DECODE_TYPE FSE_decode_t
+
+/* ***************************************************************
+*  Constants
+*****************************************************************/
+#define FSE_MAX_TABLELOG (FSE_MAX_MEMORY_USAGE - 2)
+#define FSE_MAX_TABLESIZE (1U << FSE_MAX_TABLELOG)
+#define FSE_MAXTABLESIZE_MASK (FSE_MAX_TABLESIZE - 1)
+#define FSE_DEFAULT_TABLELOG (FSE_DEFAULT_MEMORY_USAGE - 2)
+#define FSE_MIN_TABLELOG 5
+
+#define FSE_TABLELOG_ABSOLUTE_MAX 15
+#if FSE_MAX_TABLELOG > FSE_TABLELOG_ABSOLUTE_MAX
+#error "FSE_MAX_TABLELOG > FSE_TABLELOG_ABSOLUTE_MAX is not supported"
+#endif
+
+#define FSE_TABLESTEP(tableSize) ((tableSize >> 1) + (tableSize >> 3) + 3)
+
+#endif /* FSE_H */
--- /dev/null
+++ b/xen/common/zstd/fse_decompress.c
@@ -0,0 +1,324 @@
+/*
+ * FSE : Finite State Entropy decoder
+ * Copyright (C) 2013-2015, Yann Collet.
+ *
+ * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are
+ * met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ * notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above
+ * copyright notice, this list of conditions and the following disclaimer
+ * in the documentation and/or other materials provided with the
+ * distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation. This program is dual-licensed; you may select
+ * either version 2 of the GNU General Public License ("GPL") or BSD license
+ * ("BSD").
+ *
+ * You can contact the author at :
+ * - Source repository : https://github.com/Cyan4973/FiniteStateEntropy
+ */
+
+/* **************************************************************
+*  Compiler specifics
+****************************************************************/
+#define FORCE_INLINE static always_inline
+
+/* **************************************************************
+*  Includes
+****************************************************************/
+#include "bitstream.h"
+#include "fse.h"
+#include "zstd_internal.h"
+#include <xen/compiler.h>
+#include <xen/string.h> /* memcpy, memset */
+
+/* **************************************************************
+*  Error Management
+****************************************************************/
+#define FSE_isError ERR_isError
+#define FSE_STATIC_ASSERT(c)                                   \
+	{                                                      \
+		enum { FSE_static_assert = 1 / (int)(!!(c)) }; \
+	} /* use only *after* variable declarations */
+
+/* **************************************************************
+*  Templates
+****************************************************************/
+/*
+  designed to be included
+  for type-specific functions (template emulation in C)
+  Objective is to write these functions only once, for improved maintenance
+*/
+
+/* safety checks */
+#ifndef FSE_FUNCTION_EXTENSION
+#error "FSE_FUNCTION_EXTENSION must be defined"
+#endif
+#ifndef FSE_FUNCTION_TYPE
+#error "FSE_FUNCTION_TYPE must be defined"
+#endif
+
+/* Function names */
+#define FSE_CAT(X, Y) X##Y
+#define FSE_FUNCTION_NAME(X, Y) FSE_CAT(X, Y)
+#define FSE_TYPE_NAME(X, Y) FSE_CAT(X, Y)
+
+/* Function templates */
+
+size_t INIT FSE_buildDTable_wksp(FSE_DTable *dt, const short *normalizedCounter, unsigned maxSymbolValue, unsigned tableLog, void *workspace, size_t workspaceSize)
+{
+	void *const tdPtr = dt + 1; /* because *dt is unsigned, 32-bits aligned on 32-bits */
+	FSE_DECODE_TYPE *const tableDecode = (FSE_DECODE_TYPE *)(tdPtr);
+	U16 *symbolNext = (U16 *)workspace;
+
+	U32 const maxSV1 = maxSymbolValue + 1;
+	U32 const tableSize = 1 << tableLog;
+	U32 highThreshold = tableSize - 1;
+
+	/* Sanity Checks */
+	if (workspaceSize < sizeof(U16) * (FSE_MAX_SYMBOL_VALUE + 1))
+		return ERROR(tableLog_tooLarge);
+	if (maxSymbolValue > FSE_MAX_SYMBOL_VALUE)
+		return ERROR(maxSymbolValue_tooLarge);
+	if (tableLog > FSE_MAX_TABLELOG)
+		return ERROR(tableLog_tooLarge);
+
+	/* Init, lay down lowprob symbols */
+	{
+		FSE_DTableHeader DTableH;
+		DTableH.tableLog = (U16)tableLog;
+		DTableH.fastMode = 1;
+		{
+			S16 const largeLimit = (S16)(1 << (tableLog - 1));
+			U32 s;
+			for (s = 0; s < maxSV1; s++) {
+				if (normalizedCounter[s] == -1) {
+					tableDecode[highThreshold--].symbol = (FSE_FUNCTION_TYPE)s;
+					symbolNext[s] = 1;
+				} else {
+					if (normalizedCounter[s] >= largeLimit)
+						DTableH.fastMode = 0;
+					symbolNext[s] = normalizedCounter[s];
+				}
+			}
+		}
+		memcpy(dt, &DTableH, sizeof(DTableH));
+	}
+
+	/* Spread symbols */
+	{
+		U32 const tableMask = tableSize - 1;
+		U32 const step = FSE_TABLESTEP(tableSize);
+		U32 s, position = 0;
+		for (s = 0; s < maxSV1; s++) {
+			int i;
+			for (i = 0; i < normalizedCounter[s]; i++) {
+				tableDecode[position].symbol = (FSE_FUNCTION_TYPE)s;
+				position = (position + step) & tableMask;
+				while (position > highThreshold)
+					position = (position + step) & tableMask; /* lowprob area */
+			}
+		}
+		if (position != 0)
+			return ERROR(GENERIC); /* position must reach all cells once, otherwise normalizedCounter is incorrect */
+	}
+
+	/* Build Decoding table */
+	{
+		U32 u;
+		for (u = 0; u < tableSize; u++) {
+			FSE_FUNCTION_TYPE const symbol = (FSE_FUNCTION_TYPE)(tableDecode[u].symbol);
+			U16 nextState = symbolNext[symbol]++;
+			tableDecode[u].nbBits = (BYTE)(tableLog - BIT_highbit32((U32)nextState));
+			tableDecode[u].newState = (U16)((nextState << tableDecode[u].nbBits) - tableSize);
+		}
+	}
+
+	return 0;
+}
+
+/*-*******************************************************
+*  Decompression (Byte symbols)
+*********************************************************/
+size_t INIT FSE_buildDTable_rle(FSE_DTable *dt, BYTE symbolValue)
+{
+	void *ptr = dt;
+	FSE_DTableHeader *const DTableH = (FSE_DTableHeader *)ptr;
+	void *dPtr = dt + 1;
+	FSE_decode_t *const cell = (FSE_decode_t *)dPtr;
+
+	DTableH->tableLog = 0;
+	DTableH->fastMode = 0;
+
+	cell->newState = 0;
+	cell->symbol = symbolValue;
+	cell->nbBits = 0;
+
+	return 0;
+}
+
+size_t INIT FSE_buildDTable_raw(FSE_DTable *dt, unsigned nbBits)
+{
+	void *ptr = dt;
+	FSE_DTableHeader *const DTableH = (FSE_DTableHeader *)ptr;
+	void *dPtr = dt + 1;
+	FSE_decode_t *const dinfo = (FSE_decode_t *)dPtr;
+	const unsigned tableSize = 1 << nbBits;
+	const unsigned tableMask = tableSize - 1;
+	const unsigned maxSV1 = tableMask + 1;
+	unsigned s;
+
+	/* Sanity checks */
+	if (nbBits < 1)
+		return ERROR(GENERIC); /* min size */
+
+	/* Build Decoding Table */
+	DTableH->tableLog = (U16)nbBits;
+	DTableH->fastMode = 1;
+	for (s = 0; s < maxSV1; s++) {
+		dinfo[s].newState = 0;
+		dinfo[s].symbol = (BYTE)s;
+		dinfo[s].nbBits = (BYTE)nbBits;
+	}
+
+	return 0;
+}
+
+FORCE_INLINE size_t FSE_decompress_usingDTable_generic(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const FSE_DTable *dt,
+						       const unsigned fast)
+{
+	BYTE *const ostart = (BYTE *)dst;
+	BYTE *op = ostart;
+	BYTE *const omax = op + maxDstSize;
+	BYTE *const olimit = omax - 3;
+
+	BIT_DStream_t bitD;
+	FSE_DState_t state1;
+	FSE_DState_t state2;
+
+	/* Init */
+	CHECK_F(BIT_initDStream(&bitD, cSrc, cSrcSize));
+
+	FSE_initDState(&state1, &bitD, dt);
+	FSE_initDState(&state2, &bitD, dt);
+
+#define FSE_GETSYMBOL(statePtr) fast ? FSE_decodeSymbolFast(statePtr, &bitD) : FSE_decodeSymbol(statePtr, &bitD)
+
+	/* 4 symbols per loop */
+	for (; (BIT_reloadDStream(&bitD) == BIT_DStream_unfinished) & (op < olimit); op += 4) {
+		op[0] = FSE_GETSYMBOL(&state1);
+
+		if (FSE_MAX_TABLELOG * 2 + 7 > sizeof(bitD.bitContainer) * 8) /* This test must be static */
+			BIT_reloadDStream(&bitD);
+
+		op[1] = FSE_GETSYMBOL(&state2);
+
+		if (FSE_MAX_TABLELOG * 4 + 7 > sizeof(bitD.bitContainer) * 8) /* This test must be static */
+		{
+			if (BIT_reloadDStream(&bitD) > BIT_DStream_unfinished) {
+				op += 2;
+				break;
+			}
+		}
+
+		op[2] = FSE_GETSYMBOL(&state1);
+
+		if (FSE_MAX_TABLELOG * 2 + 7 > sizeof(bitD.bitContainer) * 8) /* This test must be static */
+			BIT_reloadDStream(&bitD);
+
+		op[3] = FSE_GETSYMBOL(&state2);
+	}
+
+	/* tail */
+	/* note : BIT_reloadDStream(&bitD) >= FSE_DStream_partiallyFilled; Ends at exactly BIT_DStream_completed */
+	while (1) {
+		if (op > (omax - 2))
+			return ERROR(dstSize_tooSmall);
+		*op++ = FSE_GETSYMBOL(&state1);
+		if (BIT_reloadDStream(&bitD) == BIT_DStream_overflow) {
+			*op++ = FSE_GETSYMBOL(&state2);
+			break;
+		}
+
+		if (op > (omax - 2))
+			return ERROR(dstSize_tooSmall);
+		*op++ = FSE_GETSYMBOL(&state2);
+		if (BIT_reloadDStream(&bitD) == BIT_DStream_overflow) {
+			*op++ = FSE_GETSYMBOL(&state1);
+			break;
+		}
+	}
+
+	return op - ostart;
+}
+
+size_t INIT FSE_decompress_usingDTable(void *dst, size_t originalSize, const void *cSrc, size_t cSrcSize, const FSE_DTable *dt)
+{
+	const void *ptr = dt;
+	const FSE_DTableHeader *DTableH = (const FSE_DTableHeader *)ptr;
+	const U32 fastMode = DTableH->fastMode;
+
+	/* select fast mode (static) */
+	if (fastMode)
+		return FSE_decompress_usingDTable_generic(dst, originalSize, cSrc, cSrcSize, dt, 1);
+	return FSE_decompress_usingDTable_generic(dst, originalSize, cSrc, cSrcSize, dt, 0);
+}
+
+size_t INIT FSE_decompress_wksp(void *dst, size_t dstCapacity, const void *cSrc, size_t cSrcSize, unsigned maxLog, void *workspace, size_t workspaceSize)
+{
+	const BYTE *const istart = (const BYTE *)cSrc;
+	const BYTE *ip = istart;
+	unsigned tableLog;
+	unsigned maxSymbolValue = FSE_MAX_SYMBOL_VALUE;
+	size_t NCountLength;
+
+	FSE_DTable *dt;
+	short *counting;
+	size_t spaceUsed32 = 0;
+
+	FSE_STATIC_ASSERT(sizeof(FSE_DTable) == sizeof(U32));
+
+	dt = (FSE_DTable *)((U32 *)workspace + spaceUsed32);
+	spaceUsed32 += FSE_DTABLE_SIZE_U32(maxLog);
+	counting = (short *)((U32 *)workspace + spaceUsed32);
+	spaceUsed32 += ALIGN(sizeof(short) * (FSE_MAX_SYMBOL_VALUE + 1), sizeof(U32)) >> 2;
+
+	if ((spaceUsed32 << 2) > workspaceSize)
+		return ERROR(tableLog_tooLarge);
+	workspace = (U32 *)workspace + spaceUsed32;
+	workspaceSize -= (spaceUsed32 << 2);
+
+	/* normal FSE decoding mode */
+	NCountLength = FSE_readNCount(counting, &maxSymbolValue, &tableLog, istart, cSrcSize);
+	if (FSE_isError(NCountLength))
+		return NCountLength;
+	// if (NCountLength >= cSrcSize) return ERROR(srcSize_wrong);   /* too small input size; supposed to be already checked in NCountLength, only remaining
+	// case : NCountLength==cSrcSize */
+	if (tableLog > maxLog)
+		return ERROR(tableLog_tooLarge);
+	ip += NCountLength;
+	cSrcSize -= NCountLength;
+
+	CHECK_F(FSE_buildDTable_wksp(dt, counting, maxSymbolValue, tableLog, workspace, workspaceSize));
+
+	return FSE_decompress_usingDTable(dst, dstCapacity, ip, cSrcSize, dt); /* always return, even if it is an error code */
+}
--- /dev/null
+++ b/xen/common/zstd/huf.h
@@ -0,0 +1,212 @@
+/*
+ * Huffman coder, part of New Generation Entropy library
+ * header file
+ * Copyright (C) 2013-2016, Yann Collet.
+ *
+ * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are
+ * met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ * notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above
+ * copyright notice, this list of conditions and the following disclaimer
+ * in the documentation and/or other materials provided with the
+ * distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation. This program is dual-licensed; you may select
+ * either version 2 of the GNU General Public License ("GPL") or BSD license
+ * ("BSD").
+ *
+ * You can contact the author at :
+ * - Source repository : https://github.com/Cyan4973/FiniteStateEntropy
+ */
+#ifndef HUF_H_298734234
+#define HUF_H_298734234
+
+/* *** Dependencies *** */
+#include <xen/types.h> /* size_t */
+
+/* ***   Tool functions *** */
+#define HUF_BLOCKSIZE_MAX (128 * 1024) /**< maximum input size for a single block compressed with HUF_compress */
+size_t HUF_compressBound(size_t size); /**< maximum compressed size (worst case) */
+
+/* Error Management */
+unsigned HUF_isError(size_t code); /**< tells if a return value is an error code */
+
+/* ***   Advanced function   *** */
+
+/** HUF_compress4X_wksp() :
+*   Same as HUF_compress2(), but uses externally allocated `workSpace`, which must be a table of >= 1024 unsigned */
+size_t HUF_compress4X_wksp(void *dst, size_t dstSize, const void *src, size_t srcSize, unsigned maxSymbolValue, unsigned tableLog, void *workSpace,
+			   size_t wkspSize); /**< `workSpace` must be a table of at least HUF_COMPRESS_WORKSPACE_SIZE_U32 unsigned */
+
+/* *** Dependencies *** */
+#include "mem.h" /* U32 */
+
+/* *** Constants *** */
+#define HUF_TABLELOG_MAX 12     /* max configured tableLog (for static allocation); can be modified up to HUF_ABSOLUTEMAX_TABLELOG */
+#define HUF_TABLELOG_DEFAULT 11 /* tableLog by default, when not specified */
+#define HUF_SYMBOLVALUE_MAX 255
+
+#define HUF_TABLELOG_ABSOLUTEMAX 15 /* absolute limit of HUF_MAX_TABLELOG. Beyond that value, code does not work */
+#if (HUF_TABLELOG_MAX > HUF_TABLELOG_ABSOLUTEMAX)
+#error "HUF_TABLELOG_MAX is too large !"
+#endif
+
+/* ****************************************
+*  Static allocation
+******************************************/
+/* HUF buffer bounds */
+#define HUF_CTABLEBOUND 129
+#define HUF_BLOCKBOUND(size) (size + (size >> 8) + 8)			 /* only true if incompressible pre-filtered with fast heuristic */
+#define HUF_COMPRESSBOUND(size) (HUF_CTABLEBOUND + HUF_BLOCKBOUND(size)) /* Macro version, useful for static allocation */
+
+/* static allocation of HUF's Compression Table */
+#define HUF_CREATE_STATIC_CTABLE(name, maxSymbolValue) \
+	U32 name##hb[maxSymbolValue + 1];              \
+	void *name##hv = &(name##hb);                  \
+	HUF_CElt *name = (HUF_CElt *)(name##hv) /* no final ; */
+
+/* static allocation of HUF's DTable */
+typedef U32 HUF_DTable;
+#define HUF_DTABLE_SIZE(maxTableLog) (1 + (1 << (maxTableLog)))
+#define HUF_CREATE_STATIC_DTABLEX2(DTable, maxTableLog) HUF_DTable DTable[HUF_DTABLE_SIZE((maxTableLog)-1)] = {((U32)((maxTableLog)-1) * 0x01000001)}
+#define HUF_CREATE_STATIC_DTABLEX4(DTable, maxTableLog) HUF_DTable DTable[HUF_DTABLE_SIZE(maxTableLog)] = {((U32)(maxTableLog)*0x01000001)}
+
+/* The workspace must have alignment at least 4 and be at least this large */
+#define HUF_COMPRESS_WORKSPACE_SIZE (6 << 10)
+#define HUF_COMPRESS_WORKSPACE_SIZE_U32 (HUF_COMPRESS_WORKSPACE_SIZE / sizeof(U32))
+
+/* The workspace must have alignment at least 4 and be at least this large */
+#define HUF_DECOMPRESS_WORKSPACE_SIZE (3 << 10)
+#define HUF_DECOMPRESS_WORKSPACE_SIZE_U32 (HUF_DECOMPRESS_WORKSPACE_SIZE / sizeof(U32))
+
+/* ****************************************
+*  Advanced decompression functions
+******************************************/
+size_t HUF_decompress4X_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize); /**< decodes RLE and uncompressed */
+size_t HUF_decompress4X_hufOnly_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace,
+				size_t workspaceSize);							       /**< considers RLE and uncompressed as errors */
+size_t HUF_decompress4X2_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace,
+				   size_t workspaceSize); /**< single-symbol decoder */
+size_t HUF_decompress4X4_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace,
+				   size_t workspaceSize); /**< double-symbols decoder */
+
+/* ****************************************
+*  HUF detailed API
+******************************************/
+/*!
+HUF_compress() does the following:
+1. count symbol occurrence from source[] into table count[] using FSE_count()
+2. (optional) refine tableLog using HUF_optimalTableLog()
+3. build Huffman table from count using HUF_buildCTable()
+4. save Huffman table to memory buffer using HUF_writeCTable_wksp()
+5. encode the data stream using HUF_compress4X_usingCTable()
+
+The following API allows targeting specific sub-functions for advanced tasks.
+For example, it's possible to compress several blocks using the same 'CTable',
+or to save and regenerate 'CTable' using external methods.
+*/
+/* FSE_count() : find it within "fse.h" */
+unsigned HUF_optimalTableLog(unsigned maxTableLog, size_t srcSize, unsigned maxSymbolValue);
+typedef struct HUF_CElt_s HUF_CElt; /* incomplete type */
+size_t HUF_writeCTable_wksp(void *dst, size_t maxDstSize, const HUF_CElt *CTable, unsigned maxSymbolValue, unsigned huffLog, void *workspace, size_t workspaceSize);
+size_t HUF_compress4X_usingCTable(void *dst, size_t dstSize, const void *src, size_t srcSize, const HUF_CElt *CTable);
+
+typedef enum {
+	HUF_repeat_none,  /**< Cannot use the previous table */
+	HUF_repeat_check, /**< Can use the previous table but it must be checked. Note : The previous table must have been constructed by HUF_compress{1,
+			     4}X_repeat */
+	HUF_repeat_valid  /**< Can use the previous table and it is asumed to be valid */
+} HUF_repeat;
+/** HUF_compress4X_repeat() :
+*   Same as HUF_compress4X_wksp(), but considers using hufTable if *repeat != HUF_repeat_none.
+*   If it uses hufTable it does not modify hufTable or repeat.
+*   If it doesn't, it sets *repeat = HUF_repeat_none, and it sets hufTable to the table used.
+*   If preferRepeat then the old table will always be used if valid. */
+size_t HUF_compress4X_repeat(void *dst, size_t dstSize, const void *src, size_t srcSize, unsigned maxSymbolValue, unsigned tableLog, void *workSpace,
+			     size_t wkspSize, HUF_CElt *hufTable, HUF_repeat *repeat,
+			     int preferRepeat); /**< `workSpace` must be a table of at least HUF_COMPRESS_WORKSPACE_SIZE_U32 unsigned */
+
+/** HUF_buildCTable_wksp() :
+ *  Same as HUF_buildCTable(), but using externally allocated scratch buffer.
+ *  `workSpace` must be aligned on 4-bytes boundaries, and be at least as large as a table of 1024 unsigned.
+ */
+size_t HUF_buildCTable_wksp(HUF_CElt *tree, const U32 *count, U32 maxSymbolValue, U32 maxNbBits, void *workSpace, size_t wkspSize);
+
+/*! HUF_readStats() :
+	Read compact Huffman tree, saved by HUF_writeCTable().
+	`huffWeight` is destination buffer.
+	@return : size read from `src` , or an error Code .
+	Note : Needed by HUF_readCTable() and HUF_readDTableXn() . */
+size_t HUF_readStats_wksp(BYTE *huffWeight, size_t hwSize, U32 *rankStats, U32 *nbSymbolsPtr, U32 *tableLogPtr, const void *src, size_t srcSize,
+			  void *workspace, size_t workspaceSize);
+
+/** HUF_readCTable() :
+*   Loading a CTable saved with HUF_writeCTable() */
+size_t HUF_readCTable_wksp(HUF_CElt *CTable, unsigned maxSymbolValue, const void *src, size_t srcSize, void *workspace, size_t workspaceSize);
+
+/*
+HUF_decompress() does the following:
+1. select the decompression algorithm (X2, X4) based on pre-computed heuristics
+2. build Huffman table from save, using HUF_readDTableXn()
+3. decode 1 or 4 segments in parallel using HUF_decompressSXn_usingDTable
+*/
+
+/** HUF_selectDecoder() :
+*   Tells which decoder is likely to decode faster,
+*   based on a set of pre-determined metrics.
+*   @return : 0==HUF_decompress4X2, 1==HUF_decompress4X4 .
+*   Assumption : 0 < cSrcSize < dstSize <= 128 KB */
+U32 HUF_selectDecoder(size_t dstSize, size_t cSrcSize);
+
+size_t HUF_readDTableX2_wksp(HUF_DTable *DTable, const void *src, size_t srcSize, void *workspace, size_t workspaceSize);
+size_t HUF_readDTableX4_wksp(HUF_DTable *DTable, const void *src, size_t srcSize, void *workspace, size_t workspaceSize);
+
+size_t HUF_decompress4X_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable);
+size_t HUF_decompress4X2_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable);
+size_t HUF_decompress4X4_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable);
+
+/* single stream variants */
+
+size_t HUF_compress1X_wksp(void *dst, size_t dstSize, const void *src, size_t srcSize, unsigned maxSymbolValue, unsigned tableLog, void *workSpace,
+			   size_t wkspSize); /**< `workSpace` must be a table of at least HUF_COMPRESS_WORKSPACE_SIZE_U32 unsigned */
+size_t HUF_compress1X_usingCTable(void *dst, size_t dstSize, const void *src, size_t srcSize, const HUF_CElt *CTable);
+/** HUF_compress1X_repeat() :
+*   Same as HUF_compress1X_wksp(), but considers using hufTable if *repeat != HUF_repeat_none.
+*   If it uses hufTable it does not modify hufTable or repeat.
+*   If it doesn't, it sets *repeat = HUF_repeat_none, and it sets hufTable to the table used.
+*   If preferRepeat then the old table will always be used if valid. */
+size_t HUF_compress1X_repeat(void *dst, size_t dstSize, const void *src, size_t srcSize, unsigned maxSymbolValue, unsigned tableLog, void *workSpace,
+			     size_t wkspSize, HUF_CElt *hufTable, HUF_repeat *repeat,
+			     int preferRepeat); /**< `workSpace` must be a table of at least HUF_COMPRESS_WORKSPACE_SIZE_U32 unsigned */
+
+size_t HUF_decompress1X_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize);
+size_t HUF_decompress1X2_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace,
+				   size_t workspaceSize); /**< single-symbol decoder */
+size_t HUF_decompress1X4_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace,
+				   size_t workspaceSize); /**< double-symbols decoder */
+
+size_t HUF_decompress1X_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize,
+				    const HUF_DTable *DTable); /**< automatic selection of sing or double symbol decoder, based on DTable */
+size_t HUF_decompress1X2_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable);
+size_t HUF_decompress1X4_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable);
+
+#endif /* HUF_H_298734234 */
--- /dev/null
+++ b/xen/common/zstd/huf_decompress.c
@@ -0,0 +1,960 @@
+/*
+ * Huffman decoder, part of New Generation Entropy library
+ * Copyright (C) 2013-2016, Yann Collet.
+ *
+ * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are
+ * met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ * notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above
+ * copyright notice, this list of conditions and the following disclaimer
+ * in the documentation and/or other materials provided with the
+ * distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation. This program is dual-licensed; you may select
+ * either version 2 of the GNU General Public License ("GPL") or BSD license
+ * ("BSD").
+ *
+ * You can contact the author at :
+ * - Source repository : https://github.com/Cyan4973/FiniteStateEntropy
+ */
+
+/* **************************************************************
+*  Compiler specifics
+****************************************************************/
+#define FORCE_INLINE static always_inline
+
+/* **************************************************************
+*  Dependencies
+****************************************************************/
+#include "bitstream.h" /* BIT_* */
+#include "fse.h"       /* header compression */
+#include "huf.h"
+#include <xen/compiler.h>
+#include <xen/string.h> /* memcpy, memset */
+
+/* **************************************************************
+*  Error Management
+****************************************************************/
+#define HUF_STATIC_ASSERT(c)                                   \
+	{                                                      \
+		enum { HUF_static_assert = 1 / (int)(!!(c)) }; \
+	} /* use only *after* variable declarations */
+
+/*-***************************/
+/*  generic DTableDesc       */
+/*-***************************/
+
+typedef struct {
+	BYTE maxTableLog;
+	BYTE tableType;
+	BYTE tableLog;
+	BYTE reserved;
+} DTableDesc;
+
+static DTableDesc INIT HUF_getDTableDesc(const HUF_DTable *table)
+{
+	DTableDesc dtd;
+	memcpy(&dtd, table, sizeof(dtd));
+	return dtd;
+}
+
+/*-***************************/
+/*  single-symbol decoding   */
+/*-***************************/
+
+typedef struct {
+	BYTE byte;
+	BYTE nbBits;
+} HUF_DEltX2; /* single-symbol decoding */
+
+size_t INIT HUF_readDTableX2_wksp(HUF_DTable *DTable, const void *src, size_t srcSize, void *workspace, size_t workspaceSize)
+{
+	U32 tableLog = 0;
+	U32 nbSymbols = 0;
+	size_t iSize;
+	void *const dtPtr = DTable + 1;
+	HUF_DEltX2 *const dt = (HUF_DEltX2 *)dtPtr;
+
+	U32 *rankVal;
+	BYTE *huffWeight;
+	size_t spaceUsed32 = 0;
+
+	rankVal = (U32 *)workspace + spaceUsed32;
+	spaceUsed32 += HUF_TABLELOG_ABSOLUTEMAX + 1;
+	huffWeight = (BYTE *)((U32 *)workspace + spaceUsed32);
+	spaceUsed32 += ALIGN(HUF_SYMBOLVALUE_MAX + 1, sizeof(U32)) >> 2;
+
+	if ((spaceUsed32 << 2) > workspaceSize)
+		return ERROR(tableLog_tooLarge);
+	workspace = (U32 *)workspace + spaceUsed32;
+	workspaceSize -= (spaceUsed32 << 2);
+
+	HUF_STATIC_ASSERT(sizeof(DTableDesc) == sizeof(HUF_DTable));
+	/* memset(huffWeight, 0, sizeof(huffWeight)); */ /* is not necessary, even though some analyzer complain ... */
+
+	iSize = HUF_readStats_wksp(huffWeight, HUF_SYMBOLVALUE_MAX + 1, rankVal, &nbSymbols, &tableLog, src, srcSize, workspace, workspaceSize);
+	if (HUF_isError(iSize))
+		return iSize;
+
+	/* Table header */
+	{
+		DTableDesc dtd = HUF_getDTableDesc(DTable);
+		if (tableLog > (U32)(dtd.maxTableLog + 1))
+			return ERROR(tableLog_tooLarge); /* DTable too small, Huffman tree cannot fit in */
+		dtd.tableType = 0;
+		dtd.tableLog = (BYTE)tableLog;
+		memcpy(DTable, &dtd, sizeof(dtd));
+	}
+
+	/* Calculate starting value for each rank */
+	{
+		U32 n, nextRankStart = 0;
+		for (n = 1; n < tableLog + 1; n++) {
+			U32 const curr = nextRankStart;
+			nextRankStart += (rankVal[n] << (n - 1));
+			rankVal[n] = curr;
+		}
+	}
+
+	/* fill DTable */
+	{
+		U32 n;
+		for (n = 0; n < nbSymbols; n++) {
+			U32 const w = huffWeight[n];
+			U32 const length = (1 << w) >> 1;
+			U32 u;
+			HUF_DEltX2 D;
+			D.byte = (BYTE)n;
+			D.nbBits = (BYTE)(tableLog + 1 - w);
+			for (u = rankVal[w]; u < rankVal[w] + length; u++)
+				dt[u] = D;
+			rankVal[w] += length;
+		}
+	}
+
+	return iSize;
+}
+
+static BYTE INIT HUF_decodeSymbolX2(BIT_DStream_t *Dstream, const HUF_DEltX2 *dt, const U32 dtLog)
+{
+	size_t const val = BIT_lookBitsFast(Dstream, dtLog); /* note : dtLog >= 1 */
+	BYTE const c = dt[val].byte;
+	BIT_skipBits(Dstream, dt[val].nbBits);
+	return c;
+}
+
+#define HUF_DECODE_SYMBOLX2_0(ptr, DStreamPtr) *ptr++ = HUF_decodeSymbolX2(DStreamPtr, dt, dtLog)
+
+#define HUF_DECODE_SYMBOLX2_1(ptr, DStreamPtr)         \
+	if (ZSTD_64bits() || (HUF_TABLELOG_MAX <= 12)) \
+	HUF_DECODE_SYMBOLX2_0(ptr, DStreamPtr)
+
+#define HUF_DECODE_SYMBOLX2_2(ptr, DStreamPtr) \
+	if (ZSTD_64bits())                     \
+	HUF_DECODE_SYMBOLX2_0(ptr, DStreamPtr)
+
+FORCE_INLINE size_t HUF_decodeStreamX2(BYTE *p, BIT_DStream_t *const bitDPtr, BYTE *const pEnd, const HUF_DEltX2 *const dt, const U32 dtLog)
+{
+	BYTE *const pStart = p;
+
+	/* up to 4 symbols at a time */
+	while ((BIT_reloadDStream(bitDPtr) == BIT_DStream_unfinished) && (p <= pEnd - 4)) {
+		HUF_DECODE_SYMBOLX2_2(p, bitDPtr);
+		HUF_DECODE_SYMBOLX2_1(p, bitDPtr);
+		HUF_DECODE_SYMBOLX2_2(p, bitDPtr);
+		HUF_DECODE_SYMBOLX2_0(p, bitDPtr);
+	}
+
+	/* closer to the end */
+	while ((BIT_reloadDStream(bitDPtr) == BIT_DStream_unfinished) && (p < pEnd))
+		HUF_DECODE_SYMBOLX2_0(p, bitDPtr);
+
+	/* no more data to retrieve from bitstream, hence no need to reload */
+	while (p < pEnd)
+		HUF_DECODE_SYMBOLX2_0(p, bitDPtr);
+
+	return pEnd - pStart;
+}
+
+static size_t INIT HUF_decompress1X2_usingDTable_internal(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
+{
+	BYTE *op = (BYTE *)dst;
+	BYTE *const oend = op + dstSize;
+	const void *dtPtr = DTable + 1;
+	const HUF_DEltX2 *const dt = (const HUF_DEltX2 *)dtPtr;
+	BIT_DStream_t bitD;
+	DTableDesc const dtd = HUF_getDTableDesc(DTable);
+	U32 const dtLog = dtd.tableLog;
+
+	{
+		size_t const errorCode = BIT_initDStream(&bitD, cSrc, cSrcSize);
+		if (HUF_isError(errorCode))
+			return errorCode;
+	}
+
+	HUF_decodeStreamX2(op, &bitD, oend, dt, dtLog);
+
+	/* check */
+	if (!BIT_endOfDStream(&bitD))
+		return ERROR(corruption_detected);
+
+	return dstSize;
+}
+
+size_t INIT HUF_decompress1X2_usingDTable(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
+{
+	DTableDesc dtd = HUF_getDTableDesc(DTable);
+	if (dtd.tableType != 0)
+		return ERROR(GENERIC);
+	return HUF_decompress1X2_usingDTable_internal(dst, dstSize, cSrc, cSrcSize, DTable);
+}
+
+size_t INIT HUF_decompress1X2_DCtx_wksp(HUF_DTable *DCtx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
+{
+	const BYTE *ip = (const BYTE *)cSrc;
+
+	size_t const hSize = HUF_readDTableX2_wksp(DCtx, cSrc, cSrcSize, workspace, workspaceSize);
+	if (HUF_isError(hSize))
+		return hSize;
+	if (hSize >= cSrcSize)
+		return ERROR(srcSize_wrong);
+	ip += hSize;
+	cSrcSize -= hSize;
+
+	return HUF_decompress1X2_usingDTable_internal(dst, dstSize, ip, cSrcSize, DCtx);
+}
+
+static size_t INIT HUF_decompress4X2_usingDTable_internal(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
+{
+	/* Check */
+	if (cSrcSize < 10)
+		return ERROR(corruption_detected); /* strict minimum : jump table + 1 byte per stream */
+
+	{
+		const BYTE *const istart = (const BYTE *)cSrc;
+		BYTE *const ostart = (BYTE *)dst;
+		BYTE *const oend = ostart + dstSize;
+		const void *const dtPtr = DTable + 1;
+		const HUF_DEltX2 *const dt = (const HUF_DEltX2 *)dtPtr;
+
+		/* Init */
+		BIT_DStream_t bitD1;
+		BIT_DStream_t bitD2;
+		BIT_DStream_t bitD3;
+		BIT_DStream_t bitD4;
+		size_t const length1 = ZSTD_readLE16(istart);
+		size_t const length2 = ZSTD_readLE16(istart + 2);
+		size_t const length3 = ZSTD_readLE16(istart + 4);
+		size_t const length4 = cSrcSize - (length1 + length2 + length3 + 6);
+		const BYTE *const istart1 = istart + 6; /* jumpTable */
+		const BYTE *const istart2 = istart1 + length1;
+		const BYTE *const istart3 = istart2 + length2;
+		const BYTE *const istart4 = istart3 + length3;
+		const size_t segmentSize = (dstSize + 3) / 4;
+		BYTE *const opStart2 = ostart + segmentSize;
+		BYTE *const opStart3 = opStart2 + segmentSize;
+		BYTE *const opStart4 = opStart3 + segmentSize;
+		BYTE *op1 = ostart;
+		BYTE *op2 = opStart2;
+		BYTE *op3 = opStart3;
+		BYTE *op4 = opStart4;
+		U32 endSignal;
+		DTableDesc const dtd = HUF_getDTableDesc(DTable);
+		U32 const dtLog = dtd.tableLog;
+
+		if (length4 > cSrcSize)
+			return ERROR(corruption_detected); /* overflow */
+		{
+			size_t const errorCode = BIT_initDStream(&bitD1, istart1, length1);
+			if (HUF_isError(errorCode))
+				return errorCode;
+		}
+		{
+			size_t const errorCode = BIT_initDStream(&bitD2, istart2, length2);
+			if (HUF_isError(errorCode))
+				return errorCode;
+		}
+		{
+			size_t const errorCode = BIT_initDStream(&bitD3, istart3, length3);
+			if (HUF_isError(errorCode))
+				return errorCode;
+		}
+		{
+			size_t const errorCode = BIT_initDStream(&bitD4, istart4, length4);
+			if (HUF_isError(errorCode))
+				return errorCode;
+		}
+
+		/* 16-32 symbols per loop (4-8 symbols per stream) */
+		endSignal = BIT_reloadDStream(&bitD1) | BIT_reloadDStream(&bitD2) | BIT_reloadDStream(&bitD3) | BIT_reloadDStream(&bitD4);
+		for (; (endSignal == BIT_DStream_unfinished) && (op4 < (oend - 7));) {
+			HUF_DECODE_SYMBOLX2_2(op1, &bitD1);
+			HUF_DECODE_SYMBOLX2_2(op2, &bitD2);
+			HUF_DECODE_SYMBOLX2_2(op3, &bitD3);
+			HUF_DECODE_SYMBOLX2_2(op4, &bitD4);
+			HUF_DECODE_SYMBOLX2_1(op1, &bitD1);
+			HUF_DECODE_SYMBOLX2_1(op2, &bitD2);
+			HUF_DECODE_SYMBOLX2_1(op3, &bitD3);
+			HUF_DECODE_SYMBOLX2_1(op4, &bitD4);
+			HUF_DECODE_SYMBOLX2_2(op1, &bitD1);
+			HUF_DECODE_SYMBOLX2_2(op2, &bitD2);
+			HUF_DECODE_SYMBOLX2_2(op3, &bitD3);
+			HUF_DECODE_SYMBOLX2_2(op4, &bitD4);
+			HUF_DECODE_SYMBOLX2_0(op1, &bitD1);
+			HUF_DECODE_SYMBOLX2_0(op2, &bitD2);
+			HUF_DECODE_SYMBOLX2_0(op3, &bitD3);
+			HUF_DECODE_SYMBOLX2_0(op4, &bitD4);
+			endSignal = BIT_reloadDStream(&bitD1) | BIT_reloadDStream(&bitD2) | BIT_reloadDStream(&bitD3) | BIT_reloadDStream(&bitD4);
+		}
+
+		/* check corruption */
+		if (op1 > opStart2)
+			return ERROR(corruption_detected);
+		if (op2 > opStart3)
+			return ERROR(corruption_detected);
+		if (op3 > opStart4)
+			return ERROR(corruption_detected);
+		/* note : op4 supposed already verified within main loop */
+
+		/* finish bitStreams one by one */
+		HUF_decodeStreamX2(op1, &bitD1, opStart2, dt, dtLog);
+		HUF_decodeStreamX2(op2, &bitD2, opStart3, dt, dtLog);
+		HUF_decodeStreamX2(op3, &bitD3, opStart4, dt, dtLog);
+		HUF_decodeStreamX2(op4, &bitD4, oend, dt, dtLog);
+
+		/* check */
+		endSignal = BIT_endOfDStream(&bitD1) & BIT_endOfDStream(&bitD2) & BIT_endOfDStream(&bitD3) & BIT_endOfDStream(&bitD4);
+		if (!endSignal)
+			return ERROR(corruption_detected);
+
+		/* decoded size */
+		return dstSize;
+	}
+}
+
+size_t INIT HUF_decompress4X2_usingDTable(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
+{
+	DTableDesc dtd = HUF_getDTableDesc(DTable);
+	if (dtd.tableType != 0)
+		return ERROR(GENERIC);
+	return HUF_decompress4X2_usingDTable_internal(dst, dstSize, cSrc, cSrcSize, DTable);
+}
+
+size_t INIT HUF_decompress4X2_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
+{
+	const BYTE *ip = (const BYTE *)cSrc;
+
+	size_t const hSize = HUF_readDTableX2_wksp(dctx, cSrc, cSrcSize, workspace, workspaceSize);
+	if (HUF_isError(hSize))
+		return hSize;
+	if (hSize >= cSrcSize)
+		return ERROR(srcSize_wrong);
+	ip += hSize;
+	cSrcSize -= hSize;
+
+	return HUF_decompress4X2_usingDTable_internal(dst, dstSize, ip, cSrcSize, dctx);
+}
+
+/* *************************/
+/* double-symbols decoding */
+/* *************************/
+typedef struct {
+	U16 sequence;
+	BYTE nbBits;
+	BYTE length;
+} HUF_DEltX4; /* double-symbols decoding */
+
+typedef struct {
+	BYTE symbol;
+	BYTE weight;
+} sortedSymbol_t;
+
+/* HUF_fillDTableX4Level2() :
+ * `rankValOrigin` must be a table of at least (HUF_TABLELOG_MAX + 1) U32 */
+static void INIT HUF_fillDTableX4Level2(HUF_DEltX4 *DTable, U32 sizeLog, const U32 consumed, const U32 *rankValOrigin, const int minWeight,
+					const sortedSymbol_t *sortedSymbols, const U32 sortedListSize, U32 nbBitsBaseline, U16 baseSeq)
+{
+	HUF_DEltX4 DElt;
+	U32 rankVal[HUF_TABLELOG_MAX + 1];
+
+	/* get pre-calculated rankVal */
+	memcpy(rankVal, rankValOrigin, sizeof(rankVal));
+
+	/* fill skipped values */
+	if (minWeight > 1) {
+		U32 i, skipSize = rankVal[minWeight];
+		ZSTD_writeLE16(&(DElt.sequence), baseSeq);
+		DElt.nbBits = (BYTE)(consumed);
+		DElt.length = 1;
+		for (i = 0; i < skipSize; i++)
+			DTable[i] = DElt;
+	}
+
+	/* fill DTable */
+	{
+		U32 s;
+		for (s = 0; s < sortedListSize; s++) { /* note : sortedSymbols already skipped */
+			const U32 symbol = sortedSymbols[s].symbol;
+			const U32 weight = sortedSymbols[s].weight;
+			const U32 nbBits = nbBitsBaseline - weight;
+			const U32 length = 1 << (sizeLog - nbBits);
+			const U32 start = rankVal[weight];
+			U32 i = start;
+			const U32 end = start + length;
+
+			ZSTD_writeLE16(&(DElt.sequence), (U16)(baseSeq + (symbol << 8)));
+			DElt.nbBits = (BYTE)(nbBits + consumed);
+			DElt.length = 2;
+			do {
+				DTable[i++] = DElt;
+			} while (i < end); /* since length >= 1 */
+
+			rankVal[weight] += length;
+		}
+	}
+}
+
+typedef U32 rankVal_t[HUF_TABLELOG_MAX][HUF_TABLELOG_MAX + 1];
+typedef U32 rankValCol_t[HUF_TABLELOG_MAX + 1];
+
+static void INIT HUF_fillDTableX4(HUF_DEltX4 *DTable, const U32 targetLog, const sortedSymbol_t *sortedList,
+				  const U32 sortedListSize, const U32 *rankStart,
+			          rankVal_t rankValOrigin, const U32 maxWeight, const U32 nbBitsBaseline)
+{
+	U32 rankVal[HUF_TABLELOG_MAX + 1];
+	const int scaleLog = nbBitsBaseline - targetLog; /* note : targetLog >= srcLog, hence scaleLog <= 1 */
+	const U32 minBits = nbBitsBaseline - maxWeight;
+	U32 s;
+
+	memcpy(rankVal, rankValOrigin, sizeof(rankVal));
+
+	/* fill DTable */
+	for (s = 0; s < sortedListSize; s++) {
+		const U16 symbol = sortedList[s].symbol;
+		const U32 weight = sortedList[s].weight;
+		const U32 nbBits = nbBitsBaseline - weight;
+		const U32 start = rankVal[weight];
+		const U32 length = 1 << (targetLog - nbBits);
+
+		if (targetLog - nbBits >= minBits) { /* enough room for a second symbol */
+			U32 sortedRank;
+			int minWeight = nbBits + scaleLog;
+			if (minWeight < 1)
+				minWeight = 1;
+			sortedRank = rankStart[minWeight];
+			HUF_fillDTableX4Level2(DTable + start, targetLog - nbBits, nbBits, rankValOrigin[nbBits], minWeight, sortedList + sortedRank,
+					       sortedListSize - sortedRank, nbBitsBaseline, symbol);
+		} else {
+			HUF_DEltX4 DElt;
+			ZSTD_writeLE16(&(DElt.sequence), symbol);
+			DElt.nbBits = (BYTE)(nbBits);
+			DElt.length = 1;
+			{
+				U32 const end = start + length;
+				U32 u;
+				for (u = start; u < end; u++)
+					DTable[u] = DElt;
+			}
+		}
+		rankVal[weight] += length;
+	}
+}
+
+size_t INIT HUF_readDTableX4_wksp(HUF_DTable *DTable, const void *src, size_t srcSize, void *workspace, size_t workspaceSize)
+{
+	U32 tableLog, maxW, sizeOfSort, nbSymbols;
+	DTableDesc dtd = HUF_getDTableDesc(DTable);
+	U32 const maxTableLog = dtd.maxTableLog;
+	size_t iSize;
+	void *dtPtr = DTable + 1; /* force compiler to avoid strict-aliasing */
+	HUF_DEltX4 *const dt = (HUF_DEltX4 *)dtPtr;
+	U32 *rankStart;
+
+	rankValCol_t *rankVal;
+	U32 *rankStats;
+	U32 *rankStart0;
+	sortedSymbol_t *sortedSymbol;
+	BYTE *weightList;
+	size_t spaceUsed32 = 0;
+
+	HUF_STATIC_ASSERT((sizeof(rankValCol_t) & 3) == 0);
+
+	rankVal = (rankValCol_t *)((U32 *)workspace + spaceUsed32);
+	spaceUsed32 += (sizeof(rankValCol_t) * HUF_TABLELOG_MAX) >> 2;
+	rankStats = (U32 *)workspace + spaceUsed32;
+	spaceUsed32 += HUF_TABLELOG_MAX + 1;
+	rankStart0 = (U32 *)workspace + spaceUsed32;
+	spaceUsed32 += HUF_TABLELOG_MAX + 2;
+	sortedSymbol = (sortedSymbol_t *)((U32 *)workspace + spaceUsed32);
+	spaceUsed32 += ALIGN(sizeof(sortedSymbol_t) * (HUF_SYMBOLVALUE_MAX + 1), sizeof(U32)) >> 2;
+	weightList = (BYTE *)((U32 *)workspace + spaceUsed32);
+	spaceUsed32 += ALIGN(HUF_SYMBOLVALUE_MAX + 1, sizeof(U32)) >> 2;
+
+	if ((spaceUsed32 << 2) > workspaceSize)
+		return ERROR(tableLog_tooLarge);
+	workspace = (U32 *)workspace + spaceUsed32;
+	workspaceSize -= (spaceUsed32 << 2);
+
+	rankStart = rankStart0 + 1;
+	memset(rankStats, 0, sizeof(U32) * (2 * HUF_TABLELOG_MAX + 2 + 1));
+
+	HUF_STATIC_ASSERT(sizeof(HUF_DEltX4) == sizeof(HUF_DTable)); /* if compiler fails here, assertion is wrong */
+	if (maxTableLog > HUF_TABLELOG_MAX)
+		return ERROR(tableLog_tooLarge);
+	/* memset(weightList, 0, sizeof(weightList)); */ /* is not necessary, even though some analyzer complain ... */
+
+	iSize = HUF_readStats_wksp(weightList, HUF_SYMBOLVALUE_MAX + 1, rankStats, &nbSymbols, &tableLog, src, srcSize, workspace, workspaceSize);
+	if (HUF_isError(iSize))
+		return iSize;
+
+	/* check result */
+	if (tableLog > maxTableLog)
+		return ERROR(tableLog_tooLarge); /* DTable can't fit code depth */
+
+	/* find maxWeight */
+	for (maxW = tableLog; rankStats[maxW] == 0; maxW--) {
+	} /* necessarily finds a solution before 0 */
+
+	/* Get start index of each weight */
+	{
+		U32 w, nextRankStart = 0;
+		for (w = 1; w < maxW + 1; w++) {
+			U32 curr = nextRankStart;
+			nextRankStart += rankStats[w];
+			rankStart[w] = curr;
+		}
+		rankStart[0] = nextRankStart; /* put all 0w symbols at the end of sorted list*/
+		sizeOfSort = nextRankStart;
+	}
+
+	/* sort symbols by weight */
+	{
+		U32 s;
+		for (s = 0; s < nbSymbols; s++) {
+			U32 const w = weightList[s];
+			U32 const r = rankStart[w]++;
+			sortedSymbol[r].symbol = (BYTE)s;
+			sortedSymbol[r].weight = (BYTE)w;
+		}
+		rankStart[0] = 0; /* forget 0w symbols; this is beginning of weight(1) */
+	}
+
+	/* Build rankVal */
+	{
+		U32 *const rankVal0 = rankVal[0];
+		{
+			int const rescale = (maxTableLog - tableLog) - 1; /* tableLog <= maxTableLog */
+			U32 nextRankVal = 0;
+			U32 w;
+			for (w = 1; w < maxW + 1; w++) {
+				U32 curr = nextRankVal;
+				nextRankVal += rankStats[w] << (w + rescale);
+				rankVal0[w] = curr;
+			}
+		}
+		{
+			U32 const minBits = tableLog + 1 - maxW;
+			U32 consumed;
+			for (consumed = minBits; consumed < maxTableLog - minBits + 1; consumed++) {
+				U32 *const rankValPtr = rankVal[consumed];
+				U32 w;
+				for (w = 1; w < maxW + 1; w++) {
+					rankValPtr[w] = rankVal0[w] >> consumed;
+				}
+			}
+		}
+	}
+
+	HUF_fillDTableX4(dt, maxTableLog, sortedSymbol, sizeOfSort, rankStart0, rankVal, maxW, tableLog + 1);
+
+	dtd.tableLog = (BYTE)maxTableLog;
+	dtd.tableType = 1;
+	memcpy(DTable, &dtd, sizeof(dtd));
+	return iSize;
+}
+
+static U32 INIT HUF_decodeSymbolX4(void *op, BIT_DStream_t *DStream, const HUF_DEltX4 *dt, const U32 dtLog)
+{
+	size_t const val = BIT_lookBitsFast(DStream, dtLog); /* note : dtLog >= 1 */
+	memcpy(op, dt + val, 2);
+	BIT_skipBits(DStream, dt[val].nbBits);
+	return dt[val].length;
+}
+
+static U32 INIT HUF_decodeLastSymbolX4(void *op, BIT_DStream_t *DStream, const HUF_DEltX4 *dt, const U32 dtLog)
+{
+	size_t const val = BIT_lookBitsFast(DStream, dtLog); /* note : dtLog >= 1 */
+	memcpy(op, dt + val, 1);
+	if (dt[val].length == 1)
+		BIT_skipBits(DStream, dt[val].nbBits);
+	else {
+		if (DStream->bitsConsumed < (sizeof(DStream->bitContainer) * 8)) {
+			BIT_skipBits(DStream, dt[val].nbBits);
+			if (DStream->bitsConsumed > (sizeof(DStream->bitContainer) * 8))
+				/* ugly hack; works only because it's the last symbol. Note : can't easily extract nbBits from just this symbol */
+				DStream->bitsConsumed = (sizeof(DStream->bitContainer) * 8);
+		}
+	}
+	return 1;
+}
+
+#define HUF_DECODE_SYMBOLX4_0(ptr, DStreamPtr) ptr += HUF_decodeSymbolX4(ptr, DStreamPtr, dt, dtLog)
+
+#define HUF_DECODE_SYMBOLX4_1(ptr, DStreamPtr)         \
+	if (ZSTD_64bits() || (HUF_TABLELOG_MAX <= 12)) \
+	ptr += HUF_decodeSymbolX4(ptr, DStreamPtr, dt, dtLog)
+
+#define HUF_DECODE_SYMBOLX4_2(ptr, DStreamPtr) \
+	if (ZSTD_64bits())                     \
+	ptr += HUF_decodeSymbolX4(ptr, DStreamPtr, dt, dtLog)
+
+FORCE_INLINE size_t HUF_decodeStreamX4(BYTE *p, BIT_DStream_t *bitDPtr, BYTE *const pEnd, const HUF_DEltX4 *const dt, const U32 dtLog)
+{
+	BYTE *const pStart = p;
+
+	/* up to 8 symbols at a time */
+	while ((BIT_reloadDStream(bitDPtr) == BIT_DStream_unfinished) & (p < pEnd - (sizeof(bitDPtr->bitContainer) - 1))) {
+		HUF_DECODE_SYMBOLX4_2(p, bitDPtr);
+		HUF_DECODE_SYMBOLX4_1(p, bitDPtr);
+		HUF_DECODE_SYMBOLX4_2(p, bitDPtr);
+		HUF_DECODE_SYMBOLX4_0(p, bitDPtr);
+	}
+
+	/* closer to end : up to 2 symbols at a time */
+	while ((BIT_reloadDStream(bitDPtr) == BIT_DStream_unfinished) & (p <= pEnd - 2))
+		HUF_DECODE_SYMBOLX4_0(p, bitDPtr);
+
+	while (p <= pEnd - 2)
+		HUF_DECODE_SYMBOLX4_0(p, bitDPtr); /* no need to reload : reached the end of DStream */
+
+	if (p < pEnd)
+		p += HUF_decodeLastSymbolX4(p, bitDPtr, dt, dtLog);
+
+	return p - pStart;
+}
+
+static size_t INIT HUF_decompress1X4_usingDTable_internal(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
+{
+	BIT_DStream_t bitD;
+
+	/* Init */
+	{
+		size_t const errorCode = BIT_initDStream(&bitD, cSrc, cSrcSize);
+		if (HUF_isError(errorCode))
+			return errorCode;
+	}
+
+	/* decode */
+	{
+		BYTE *const ostart = (BYTE *)dst;
+		BYTE *const oend = ostart + dstSize;
+		const void *const dtPtr = DTable + 1; /* force compiler to not use strict-aliasing */
+		const HUF_DEltX4 *const dt = (const HUF_DEltX4 *)dtPtr;
+		DTableDesc const dtd = HUF_getDTableDesc(DTable);
+		HUF_decodeStreamX4(ostart, &bitD, oend, dt, dtd.tableLog);
+	}
+
+	/* check */
+	if (!BIT_endOfDStream(&bitD))
+		return ERROR(corruption_detected);
+
+	/* decoded size */
+	return dstSize;
+}
+
+size_t INIT HUF_decompress1X4_usingDTable(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
+{
+	DTableDesc dtd = HUF_getDTableDesc(DTable);
+	if (dtd.tableType != 1)
+		return ERROR(GENERIC);
+	return HUF_decompress1X4_usingDTable_internal(dst, dstSize, cSrc, cSrcSize, DTable);
+}
+
+size_t INIT HUF_decompress1X4_DCtx_wksp(HUF_DTable *DCtx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
+{
+	const BYTE *ip = (const BYTE *)cSrc;
+
+	size_t const hSize = HUF_readDTableX4_wksp(DCtx, cSrc, cSrcSize, workspace, workspaceSize);
+	if (HUF_isError(hSize))
+		return hSize;
+	if (hSize >= cSrcSize)
+		return ERROR(srcSize_wrong);
+	ip += hSize;
+	cSrcSize -= hSize;
+
+	return HUF_decompress1X4_usingDTable_internal(dst, dstSize, ip, cSrcSize, DCtx);
+}
+
+static size_t INIT HUF_decompress4X4_usingDTable_internal(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
+{
+	if (cSrcSize < 10)
+		return ERROR(corruption_detected); /* strict minimum : jump table + 1 byte per stream */
+
+	{
+		const BYTE *const istart = (const BYTE *)cSrc;
+		BYTE *const ostart = (BYTE *)dst;
+		BYTE *const oend = ostart + dstSize;
+		const void *const dtPtr = DTable + 1;
+		const HUF_DEltX4 *const dt = (const HUF_DEltX4 *)dtPtr;
+
+		/* Init */
+		BIT_DStream_t bitD1;
+		BIT_DStream_t bitD2;
+		BIT_DStream_t bitD3;
+		BIT_DStream_t bitD4;
+		size_t const length1 = ZSTD_readLE16(istart);
+		size_t const length2 = ZSTD_readLE16(istart + 2);
+		size_t const length3 = ZSTD_readLE16(istart + 4);
+		size_t const length4 = cSrcSize - (length1 + length2 + length3 + 6);
+		const BYTE *const istart1 = istart + 6; /* jumpTable */
+		const BYTE *const istart2 = istart1 + length1;
+		const BYTE *const istart3 = istart2 + length2;
+		const BYTE *const istart4 = istart3 + length3;
+		size_t const segmentSize = (dstSize + 3) / 4;
+		BYTE *const opStart2 = ostart + segmentSize;
+		BYTE *const opStart3 = opStart2 + segmentSize;
+		BYTE *const opStart4 = opStart3 + segmentSize;
+		BYTE *op1 = ostart;
+		BYTE *op2 = opStart2;
+		BYTE *op3 = opStart3;
+		BYTE *op4 = opStart4;
+		U32 endSignal;
+		DTableDesc const dtd = HUF_getDTableDesc(DTable);
+		U32 const dtLog = dtd.tableLog;
+
+		if (length4 > cSrcSize)
+			return ERROR(corruption_detected); /* overflow */
+		{
+			size_t const errorCode = BIT_initDStream(&bitD1, istart1, length1);
+			if (HUF_isError(errorCode))
+				return errorCode;
+		}
+		{
+			size_t const errorCode = BIT_initDStream(&bitD2, istart2, length2);
+			if (HUF_isError(errorCode))
+				return errorCode;
+		}
+		{
+			size_t const errorCode = BIT_initDStream(&bitD3, istart3, length3);
+			if (HUF_isError(errorCode))
+				return errorCode;
+		}
+		{
+			size_t const errorCode = BIT_initDStream(&bitD4, istart4, length4);
+			if (HUF_isError(errorCode))
+				return errorCode;
+		}
+
+		/* 16-32 symbols per loop (4-8 symbols per stream) */
+		endSignal = BIT_reloadDStream(&bitD1) | BIT_reloadDStream(&bitD2) | BIT_reloadDStream(&bitD3) | BIT_reloadDStream(&bitD4);
+		for (; (endSignal == BIT_DStream_unfinished) & (op4 < (oend - (sizeof(bitD4.bitContainer) - 1)));) {
+			HUF_DECODE_SYMBOLX4_2(op1, &bitD1);
+			HUF_DECODE_SYMBOLX4_2(op2, &bitD2);
+			HUF_DECODE_SYMBOLX4_2(op3, &bitD3);
+			HUF_DECODE_SYMBOLX4_2(op4, &bitD4);
+			HUF_DECODE_SYMBOLX4_1(op1, &bitD1);
+			HUF_DECODE_SYMBOLX4_1(op2, &bitD2);
+			HUF_DECODE_SYMBOLX4_1(op3, &bitD3);
+			HUF_DECODE_SYMBOLX4_1(op4, &bitD4);
+			HUF_DECODE_SYMBOLX4_2(op1, &bitD1);
+			HUF_DECODE_SYMBOLX4_2(op2, &bitD2);
+			HUF_DECODE_SYMBOLX4_2(op3, &bitD3);
+			HUF_DECODE_SYMBOLX4_2(op4, &bitD4);
+			HUF_DECODE_SYMBOLX4_0(op1, &bitD1);
+			HUF_DECODE_SYMBOLX4_0(op2, &bitD2);
+			HUF_DECODE_SYMBOLX4_0(op3, &bitD3);
+			HUF_DECODE_SYMBOLX4_0(op4, &bitD4);
+
+			endSignal = BIT_reloadDStream(&bitD1) | BIT_reloadDStream(&bitD2) | BIT_reloadDStream(&bitD3) | BIT_reloadDStream(&bitD4);
+		}
+
+		/* check corruption */
+		if (op1 > opStart2)
+			return ERROR(corruption_detected);
+		if (op2 > opStart3)
+			return ERROR(corruption_detected);
+		if (op3 > opStart4)
+			return ERROR(corruption_detected);
+		/* note : op4 already verified within main loop */
+
+		/* finish bitStreams one by one */
+		HUF_decodeStreamX4(op1, &bitD1, opStart2, dt, dtLog);
+		HUF_decodeStreamX4(op2, &bitD2, opStart3, dt, dtLog);
+		HUF_decodeStreamX4(op3, &bitD3, opStart4, dt, dtLog);
+		HUF_decodeStreamX4(op4, &bitD4, oend, dt, dtLog);
+
+		/* check */
+		{
+			U32 const endCheck = BIT_endOfDStream(&bitD1) & BIT_endOfDStream(&bitD2) & BIT_endOfDStream(&bitD3) & BIT_endOfDStream(&bitD4);
+			if (!endCheck)
+				return ERROR(corruption_detected);
+		}
+
+		/* decoded size */
+		return dstSize;
+	}
+}
+
+size_t INIT HUF_decompress4X4_usingDTable(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
+{
+	DTableDesc dtd = HUF_getDTableDesc(DTable);
+	if (dtd.tableType != 1)
+		return ERROR(GENERIC);
+	return HUF_decompress4X4_usingDTable_internal(dst, dstSize, cSrc, cSrcSize, DTable);
+}
+
+size_t INIT HUF_decompress4X4_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
+{
+	const BYTE *ip = (const BYTE *)cSrc;
+
+	size_t hSize = HUF_readDTableX4_wksp(dctx, cSrc, cSrcSize, workspace, workspaceSize);
+	if (HUF_isError(hSize))
+		return hSize;
+	if (hSize >= cSrcSize)
+		return ERROR(srcSize_wrong);
+	ip += hSize;
+	cSrcSize -= hSize;
+
+	return HUF_decompress4X4_usingDTable_internal(dst, dstSize, ip, cSrcSize, dctx);
+}
+
+/* ********************************/
+/* Generic decompression selector */
+/* ********************************/
+
+size_t INIT HUF_decompress1X_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
+{
+	DTableDesc const dtd = HUF_getDTableDesc(DTable);
+	return dtd.tableType ? HUF_decompress1X4_usingDTable_internal(dst, maxDstSize, cSrc, cSrcSize, DTable)
+			     : HUF_decompress1X2_usingDTable_internal(dst, maxDstSize, cSrc, cSrcSize, DTable);
+}
+
+size_t INIT HUF_decompress4X_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
+{
+	DTableDesc const dtd = HUF_getDTableDesc(DTable);
+	return dtd.tableType ? HUF_decompress4X4_usingDTable_internal(dst, maxDstSize, cSrc, cSrcSize, DTable)
+			     : HUF_decompress4X2_usingDTable_internal(dst, maxDstSize, cSrc, cSrcSize, DTable);
+}
+
+typedef struct {
+	U32 tableTime;
+	U32 decode256Time;
+} algo_time_t;
+static const algo_time_t algoTime[16 /* Quantization */][3 /* single, double, quad */] = {
+    /* single, double, quad */
+    {{0, 0}, {1, 1}, {2, 2}},		     /* Q==0 : impossible */
+    {{0, 0}, {1, 1}, {2, 2}},		     /* Q==1 : impossible */
+    {{38, 130}, {1313, 74}, {2151, 38}},     /* Q == 2 : 12-18% */
+    {{448, 128}, {1353, 74}, {2238, 41}},    /* Q == 3 : 18-25% */
+    {{556, 128}, {1353, 74}, {2238, 47}},    /* Q == 4 : 25-32% */
+    {{714, 128}, {1418, 74}, {2436, 53}},    /* Q == 5 : 32-38% */
+    {{883, 128}, {1437, 74}, {2464, 61}},    /* Q == 6 : 38-44% */
+    {{897, 128}, {1515, 75}, {2622, 68}},    /* Q == 7 : 44-50% */
+    {{926, 128}, {1613, 75}, {2730, 75}},    /* Q == 8 : 50-56% */
+    {{947, 128}, {1729, 77}, {3359, 77}},    /* Q == 9 : 56-62% */
+    {{1107, 128}, {2083, 81}, {4006, 84}},   /* Q ==10 : 62-69% */
+    {{1177, 128}, {2379, 87}, {4785, 88}},   /* Q ==11 : 69-75% */
+    {{1242, 128}, {2415, 93}, {5155, 84}},   /* Q ==12 : 75-81% */
+    {{1349, 128}, {2644, 106}, {5260, 106}}, /* Q ==13 : 81-87% */
+    {{1455, 128}, {2422, 124}, {4174, 124}}, /* Q ==14 : 87-93% */
+    {{722, 128}, {1891, 145}, {1936, 146}},  /* Q ==15 : 93-99% */
+};
+
+/** HUF_selectDecoder() :
+*   Tells which decoder is likely to decode faster,
+*   based on a set of pre-determined metrics.
+*   @return : 0==HUF_decompress4X2, 1==HUF_decompress4X4 .
+*   Assumption : 0 < cSrcSize < dstSize <= 128 KB */
+U32 INIT HUF_selectDecoder(size_t dstSize, size_t cSrcSize)
+{
+	/* decoder timing evaluation */
+	U32 const Q = (U32)(cSrcSize * 16 / dstSize); /* Q < 16 since dstSize > cSrcSize */
+	U32 const D256 = (U32)(dstSize >> 8);
+	U32 const DTime0 = algoTime[Q][0].tableTime + (algoTime[Q][0].decode256Time * D256);
+	U32 DTime1 = algoTime[Q][1].tableTime + (algoTime[Q][1].decode256Time * D256);
+	DTime1 += DTime1 >> 3; /* advantage to algorithm using less memory, for cache eviction */
+
+	return DTime1 < DTime0;
+}
+
+typedef size_t (*decompressionAlgo)(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize);
+
+size_t INIT HUF_decompress4X_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
+{
+	/* validation checks */
+	if (dstSize == 0)
+		return ERROR(dstSize_tooSmall);
+	if (cSrcSize > dstSize)
+		return ERROR(corruption_detected); /* invalid */
+	if (cSrcSize == dstSize) {
+		memcpy(dst, cSrc, dstSize);
+		return dstSize;
+	} /* not compressed */
+	if (cSrcSize == 1) {
+		memset(dst, *(const BYTE *)cSrc, dstSize);
+		return dstSize;
+	} /* RLE */
+
+	{
+		U32 const algoNb = HUF_selectDecoder(dstSize, cSrcSize);
+		return algoNb ? HUF_decompress4X4_DCtx_wksp(dctx, dst, dstSize, cSrc, cSrcSize, workspace, workspaceSize)
+			      : HUF_decompress4X2_DCtx_wksp(dctx, dst, dstSize, cSrc, cSrcSize, workspace, workspaceSize);
+	}
+}
+
+size_t INIT HUF_decompress4X_hufOnly_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
+{
+	/* validation checks */
+	if (dstSize == 0)
+		return ERROR(dstSize_tooSmall);
+	if ((cSrcSize >= dstSize) || (cSrcSize <= 1))
+		return ERROR(corruption_detected); /* invalid */
+
+	{
+		U32 const algoNb = HUF_selectDecoder(dstSize, cSrcSize);
+		return algoNb ? HUF_decompress4X4_DCtx_wksp(dctx, dst, dstSize, cSrc, cSrcSize, workspace, workspaceSize)
+			      : HUF_decompress4X2_DCtx_wksp(dctx, dst, dstSize, cSrc, cSrcSize, workspace, workspaceSize);
+	}
+}
+
+size_t INIT HUF_decompress1X_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
+{
+	/* validation checks */
+	if (dstSize == 0)
+		return ERROR(dstSize_tooSmall);
+	if (cSrcSize > dstSize)
+		return ERROR(corruption_detected); /* invalid */
+	if (cSrcSize == dstSize) {
+		memcpy(dst, cSrc, dstSize);
+		return dstSize;
+	} /* not compressed */
+	if (cSrcSize == 1) {
+		memset(dst, *(const BYTE *)cSrc, dstSize);
+		return dstSize;
+	} /* RLE */
+
+	{
+		U32 const algoNb = HUF_selectDecoder(dstSize, cSrcSize);
+		return algoNb ? HUF_decompress1X4_DCtx_wksp(dctx, dst, dstSize, cSrc, cSrcSize, workspace, workspaceSize)
+			      : HUF_decompress1X2_DCtx_wksp(dctx, dst, dstSize, cSrc, cSrcSize, workspace, workspaceSize);
+	}
+}
--- /dev/null
+++ b/xen/common/zstd/mem.h
@@ -0,0 +1,151 @@
+/**
+ * Copyright (c) 2016-present, Yann Collet, Facebook, Inc.
+ * All rights reserved.
+ *
+ * This source code is licensed under the BSD-style license found in the
+ * LICENSE file in the root directory of https://github.com/facebook/zstd.
+ * An additional grant of patent rights can be found in the PATENTS file in the
+ * same directory.
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation. This program is dual-licensed; you may select
+ * either version 2 of the GNU General Public License ("GPL") or BSD license
+ * ("BSD").
+ */
+
+#ifndef MEM_H_MODULE
+#define MEM_H_MODULE
+
+/*-****************************************
+*  Dependencies
+******************************************/
+#include <xen/string.h> /* memcpy */
+#include <xen/types.h>  /* size_t, ptrdiff_t */
+#include <asm/unaligned.h>
+
+/*-****************************************
+*  Compiler specifics
+******************************************/
+#define ZSTD_STATIC static inline
+
+/*-**************************************************************
+*  Basic Types
+*****************************************************************/
+typedef uint8_t BYTE;
+typedef uint16_t U16;
+typedef int16_t S16;
+typedef uint32_t U32;
+typedef int32_t S32;
+typedef uint64_t U64;
+typedef int64_t S64;
+typedef ptrdiff_t iPtrDiff;
+typedef uintptr_t uPtrDiff;
+
+/*-**************************************************************
+*  Memory I/O
+*****************************************************************/
+ZSTD_STATIC unsigned ZSTD_32bits(void) { return sizeof(size_t) == 4; }
+ZSTD_STATIC unsigned ZSTD_64bits(void) { return sizeof(size_t) == 8; }
+
+#if defined(__LITTLE_ENDIAN)
+#define ZSTD_LITTLE_ENDIAN 1
+#else
+#define ZSTD_LITTLE_ENDIAN 0
+#endif
+
+ZSTD_STATIC unsigned ZSTD_isLittleEndian(void) { return ZSTD_LITTLE_ENDIAN; }
+
+ZSTD_STATIC U16 ZSTD_read16(const void *memPtr) { return get_unaligned((const U16 *)memPtr); }
+
+ZSTD_STATIC U32 ZSTD_read32(const void *memPtr) { return get_unaligned((const U32 *)memPtr); }
+
+ZSTD_STATIC U64 ZSTD_read64(const void *memPtr) { return get_unaligned((const U64 *)memPtr); }
+
+ZSTD_STATIC size_t ZSTD_readST(const void *memPtr) { return get_unaligned((const size_t *)memPtr); }
+
+ZSTD_STATIC void ZSTD_write16(void *memPtr, U16 value) { put_unaligned(value, (U16 *)memPtr); }
+
+ZSTD_STATIC void ZSTD_write32(void *memPtr, U32 value) { put_unaligned(value, (U32 *)memPtr); }
+
+ZSTD_STATIC void ZSTD_write64(void *memPtr, U64 value) { put_unaligned(value, (U64 *)memPtr); }
+
+/*=== Little endian r/w ===*/
+
+ZSTD_STATIC U16 ZSTD_readLE16(const void *memPtr) { return get_unaligned_le16(memPtr); }
+
+ZSTD_STATIC void ZSTD_writeLE16(void *memPtr, U16 val) { put_unaligned_le16(val, memPtr); }
+
+ZSTD_STATIC U32 ZSTD_readLE24(const void *memPtr) { return ZSTD_readLE16(memPtr) + (((const BYTE *)memPtr)[2] << 16); }
+
+ZSTD_STATIC void ZSTD_writeLE24(void *memPtr, U32 val)
+{
+	ZSTD_writeLE16(memPtr, (U16)val);
+	((BYTE *)memPtr)[2] = (BYTE)(val >> 16);
+}
+
+ZSTD_STATIC U32 ZSTD_readLE32(const void *memPtr) { return get_unaligned_le32(memPtr); }
+
+ZSTD_STATIC void ZSTD_writeLE32(void *memPtr, U32 val32) { put_unaligned_le32(val32, memPtr); }
+
+ZSTD_STATIC U64 ZSTD_readLE64(const void *memPtr) { return get_unaligned_le64(memPtr); }
+
+ZSTD_STATIC void ZSTD_writeLE64(void *memPtr, U64 val64) { put_unaligned_le64(val64, memPtr); }
+
+ZSTD_STATIC size_t ZSTD_readLEST(const void *memPtr)
+{
+	if (ZSTD_32bits())
+		return (size_t)ZSTD_readLE32(memPtr);
+	else
+		return (size_t)ZSTD_readLE64(memPtr);
+}
+
+ZSTD_STATIC void ZSTD_writeLEST(void *memPtr, size_t val)
+{
+	if (ZSTD_32bits())
+		ZSTD_writeLE32(memPtr, (U32)val);
+	else
+		ZSTD_writeLE64(memPtr, (U64)val);
+}
+
+/*=== Big endian r/w ===*/
+
+ZSTD_STATIC U32 ZSTD_readBE32(const void *memPtr) { return get_unaligned_be32(memPtr); }
+
+ZSTD_STATIC void ZSTD_writeBE32(void *memPtr, U32 val32) { put_unaligned_be32(val32, memPtr); }
+
+ZSTD_STATIC U64 ZSTD_readBE64(const void *memPtr) { return get_unaligned_be64(memPtr); }
+
+ZSTD_STATIC void ZSTD_writeBE64(void *memPtr, U64 val64) { put_unaligned_be64(val64, memPtr); }
+
+ZSTD_STATIC size_t ZSTD_readBEST(const void *memPtr)
+{
+	if (ZSTD_32bits())
+		return (size_t)ZSTD_readBE32(memPtr);
+	else
+		return (size_t)ZSTD_readBE64(memPtr);
+}
+
+ZSTD_STATIC void ZSTD_writeBEST(void *memPtr, size_t val)
+{
+	if (ZSTD_32bits())
+		ZSTD_writeBE32(memPtr, (U32)val);
+	else
+		ZSTD_writeBE64(memPtr, (U64)val);
+}
+
+/* function safe only for comparisons */
+ZSTD_STATIC U32 ZSTD_readMINMATCH(const void *memPtr, U32 length)
+{
+	switch (length) {
+	default:
+	case 4: return ZSTD_read32(memPtr);
+	case 3:
+		if (ZSTD_isLittleEndian())
+			return ZSTD_read32(memPtr) << 8;
+		else
+			return ZSTD_read32(memPtr) >> 8;
+	}
+}
+
+#endif /* MEM_H_MODULE */
--- /dev/null
+++ b/xen/common/zstd/zstd_common.c
@@ -0,0 +1,74 @@
+/**
+ * Copyright (c) 2016-present, Yann Collet, Facebook, Inc.
+ * All rights reserved.
+ *
+ * This source code is licensed under the BSD-style license found in the
+ * LICENSE file in the root directory of https://github.com/facebook/zstd.
+ * An additional grant of patent rights can be found in the PATENTS file in the
+ * same directory.
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation. This program is dual-licensed; you may select
+ * either version 2 of the GNU General Public License ("GPL") or BSD license
+ * ("BSD").
+ */
+
+/*-*************************************
+*  Dependencies
+***************************************/
+#include "error_private.h"
+#include "zstd_internal.h" /* declaration of ZSTD_isError, ZSTD_getErrorName, ZSTD_getErrorCode, ZSTD_getErrorString, ZSTD_versionNumber */
+
+/*=**************************************************************
+*  Custom allocator
+****************************************************************/
+
+#define stack_push(stack, size)                                 \
+	({                                                      \
+		void *const ptr = ZSTD_PTR_ALIGN((stack)->ptr); \
+		(stack)->ptr = (char *)ptr + (size);            \
+		(stack)->ptr <= (stack)->end ? ptr : NULL;      \
+	})
+
+ZSTD_customMem INIT ZSTD_initStack(void *workspace, size_t workspaceSize)
+{
+	ZSTD_customMem stackMem = {ZSTD_stackAlloc, ZSTD_stackFree, workspace};
+	ZSTD_stack *stack = (ZSTD_stack *)workspace;
+	/* Verify preconditions */
+	if (!workspace || workspaceSize < sizeof(ZSTD_stack) || workspace != ZSTD_PTR_ALIGN(workspace)) {
+		ZSTD_customMem error = {NULL, NULL, NULL};
+		return error;
+	}
+	/* Initialize the stack */
+	stack->ptr = workspace;
+	stack->end = (char *)workspace + workspaceSize;
+	stack_push(stack, sizeof(ZSTD_stack));
+	return stackMem;
+}
+
+void *INIT ZSTD_stackAllocAll(void *opaque, size_t *size)
+{
+	ZSTD_stack *stack = (ZSTD_stack *)opaque;
+	*size = (BYTE const *)stack->end - (BYTE *)ZSTD_PTR_ALIGN(stack->ptr);
+	return stack_push(stack, *size);
+}
+
+void *INIT ZSTD_stackAlloc(void *opaque, size_t size)
+{
+	ZSTD_stack *stack = (ZSTD_stack *)opaque;
+	return stack_push(stack, size);
+}
+void INIT ZSTD_stackFree(void *opaque, void *address)
+{
+	(void)opaque;
+	(void)address;
+}
+
+void *INIT ZSTD_malloc(size_t size, ZSTD_customMem customMem) { return customMem.customAlloc(customMem.opaque, size); }
+
+void INIT ZSTD_free(void *ptr, ZSTD_customMem customMem)
+{
+	if (ptr != NULL)
+		customMem.customFree(customMem.opaque, ptr);
+}
--- /dev/null
+++ b/xen/common/zstd/zstd_internal.h
@@ -0,0 +1,372 @@
+/**
+ * Copyright (c) 2016-present, Yann Collet, Facebook, Inc.
+ * All rights reserved.
+ *
+ * This source code is licensed under the BSD-style license found in the
+ * LICENSE file in the root directory of https://github.com/facebook/zstd.
+ * An additional grant of patent rights can be found in the PATENTS file in the
+ * same directory.
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation. This program is dual-licensed; you may select
+ * either version 2 of the GNU General Public License ("GPL") or BSD license
+ * ("BSD").
+ */
+
+#ifndef ZSTD_CCOMMON_H_MODULE
+#define ZSTD_CCOMMON_H_MODULE
+
+/*-*******************************************************
+*  Compiler specifics
+*********************************************************/
+#define FORCE_INLINE static always_inline
+#define FORCE_NOINLINE static noinline INIT
+
+/*-*************************************
+*  Dependencies
+***************************************/
+#include "error_private.h"
+#include "mem.h"
+#include <xen/compiler.h>
+#include <xen/xxhash.h>
+
+#define ALIGN(x, a) ((x + (a) - 1) & ~((a) - 1))
+#define PTR_ALIGN(p, a) ((typeof(p))ALIGN((unsigned long)(p), (a)))
+
+typedef enum {
+	ZSTDnit_frameHeader,
+	ZSTDnit_blockHeader,
+	ZSTDnit_block,
+	ZSTDnit_lastBlock,
+	ZSTDnit_checksum,
+	ZSTDnit_skippableFrame
+} ZSTD_nextInputType_e;
+
+/**
+ * struct ZSTD_frameParams - zstd frame parameters stored in the frame header
+ * @frameContentSize: The frame content size, or 0 if not present.
+ * @windowSize:       The window size, or 0 if the frame is a skippable frame.
+ * @dictID:           The dictionary id, or 0 if not present.
+ * @checksumFlag:     Whether a checksum was used.
+ */
+typedef struct {
+	unsigned long long frameContentSize;
+	unsigned int windowSize;
+	unsigned int dictID;
+	unsigned int checksumFlag;
+} ZSTD_frameParams;
+
+/**
+ * struct ZSTD_inBuffer - input buffer for streaming
+ * @src:  Start of the input buffer.
+ * @size: Size of the input buffer.
+ * @pos:  Position where reading stopped. Will be updated.
+ *        Necessarily 0 <= pos <= size.
+ */
+typedef struct ZSTD_inBuffer_s {
+	const void *src;
+	size_t size;
+	size_t pos;
+} ZSTD_inBuffer;
+
+/**
+ * struct ZSTD_outBuffer - output buffer for streaming
+ * @dst:  Start of the output buffer.
+ * @size: Size of the output buffer.
+ * @pos:  Position where writing stopped. Will be updated.
+ *        Necessarily 0 <= pos <= size.
+ */
+typedef struct ZSTD_outBuffer_s {
+	void *dst;
+	size_t size;
+	size_t pos;
+} ZSTD_outBuffer;
+
+typedef struct ZSTD_CCtx_s ZSTD_CCtx;
+typedef struct ZSTD_DCtx_s ZSTD_DCtx;
+
+typedef struct ZSTD_CDict_s ZSTD_CDict;
+typedef struct ZSTD_DDict_s ZSTD_DDict;
+
+typedef struct ZSTD_CStream_s ZSTD_CStream;
+typedef struct ZSTD_DStream_s ZSTD_DStream;
+
+/*-*************************************
+*  shared macros
+***************************************/
+#define MIN(a, b) ((a) < (b) ? (a) : (b))
+#define MAX(a, b) ((a) > (b) ? (a) : (b))
+#define CHECK_F(f)                       \
+	{                                \
+		size_t const errcod = f; \
+		if (ERR_isError(errcod)) \
+			return errcod;   \
+	} /* check and Forward error code */
+#define CHECK_E(f, e)                    \
+	{                                \
+		size_t const errcod = f; \
+		if (ERR_isError(errcod)) \
+			return ERROR(e); \
+	} /* check and send Error code */
+#define ZSTD_STATIC_ASSERT(c)                                   \
+	{                                                       \
+		enum { ZSTD_static_assert = 1 / (int)(!!(c)) }; \
+	}
+
+/*-*************************************
+*  Common constants
+***************************************/
+#define ZSTD_MAGICNUMBER            0xFD2FB528   /* >= v0.8.0 */
+#define ZSTD_MAGIC_SKIPPABLE_START  0x184D2A50U
+
+#define ZSTD_OPT_NUM (1 << 12)
+#define ZSTD_DICT_MAGIC 0xEC30A437 /* v0.7+ */
+
+#define ZSTD_CONTENTSIZE_UNKNOWN (0ULL - 1)
+#define ZSTD_CONTENTSIZE_ERROR   (0ULL - 2)
+
+#define ZSTD_WINDOWLOG_MAX_32  27
+#define ZSTD_WINDOWLOG_MAX_64  27
+#define ZSTD_WINDOWLOG_MAX \
+	((unsigned int)(sizeof(size_t) == 4 \
+		? ZSTD_WINDOWLOG_MAX_32 \
+		: ZSTD_WINDOWLOG_MAX_64))
+#define ZSTD_WINDOWLOG_MIN 10
+#define ZSTD_HASHLOG_MAX ZSTD_WINDOWLOG_MAX
+#define ZSTD_HASHLOG_MIN        6
+#define ZSTD_CHAINLOG_MAX     (ZSTD_WINDOWLOG_MAX+1)
+#define ZSTD_CHAINLOG_MIN      ZSTD_HASHLOG_MIN
+#define ZSTD_HASHLOG3_MAX      17
+#define ZSTD_SEARCHLOG_MAX    (ZSTD_WINDOWLOG_MAX-1)
+#define ZSTD_SEARCHLOG_MIN      1
+/* only for ZSTD_fast, other strategies are limited to 6 */
+#define ZSTD_SEARCHLENGTH_MAX   7
+/* only for ZSTD_btopt, other strategies are limited to 4 */
+#define ZSTD_SEARCHLENGTH_MIN   3
+#define ZSTD_TARGETLENGTH_MIN   4
+#define ZSTD_TARGETLENGTH_MAX 999
+
+#define ZSTD_REP_NUM 3		      /* number of repcodes */
+#define ZSTD_REP_CHECK (ZSTD_REP_NUM) /* number of repcodes to check by the optimal parser */
+#define ZSTD_REP_MOVE (ZSTD_REP_NUM - 1)
+#define ZSTD_REP_MOVE_OPT (ZSTD_REP_NUM)
+static const U32 repStartValue[ZSTD_REP_NUM] = {1, 4, 8};
+
+/* for static allocation */
+#define ZSTD_FRAMEHEADERSIZE_MAX 18
+#define ZSTD_FRAMEHEADERSIZE_MIN  6
+static const size_t ZSTD_frameHeaderSize_prefix = 5;
+static const size_t ZSTD_frameHeaderSize_min = ZSTD_FRAMEHEADERSIZE_MIN;
+static const size_t ZSTD_frameHeaderSize_max = ZSTD_FRAMEHEADERSIZE_MAX;
+/* magic number + skippable frame length */
+static const size_t ZSTD_skippableHeaderSize = 8;
+
+#define ZSTD_BLOCKSIZE_ABSOLUTEMAX (128 * 1024)
+
+#if 0 /* These don't seem to be usable - not sure what their purpose is. */
+#define KB *(1 << 10)
+#define MB *(1 << 20)
+#define GB *(1U << 30)
+#endif
+
+#define BIT7 128
+#define BIT6 64
+#define BIT5 32
+#define BIT4 16
+#define BIT1 2
+#define BIT0 1
+
+#define ZSTD_WINDOWLOG_ABSOLUTEMIN 10
+static const size_t ZSTD_fcs_fieldSize[4] = {0, 2, 4, 8};
+static const size_t ZSTD_did_fieldSize[4] = {0, 1, 2, 4};
+
+#define ZSTD_BLOCKHEADERSIZE 3 /* C standard doesn't allow `static const` variable to be init using another `static const` variable */
+static const size_t ZSTD_blockHeaderSize = ZSTD_BLOCKHEADERSIZE;
+typedef enum { bt_raw, bt_rle, bt_compressed, bt_reserved } blockType_e;
+
+#define MIN_SEQUENCES_SIZE 1									  /* nbSeq==0 */
+#define MIN_CBLOCK_SIZE (1 /*litCSize*/ + 1 /* RLE or RAW */ + MIN_SEQUENCES_SIZE /* nbSeq==0 */) /* for a non-null block */
+
+#define HufLog 12
+typedef enum { set_basic, set_rle, set_compressed, set_repeat } symbolEncodingType_e;
+
+#define LONGNBSEQ 0x7F00
+
+#define MINMATCH 3
+#define EQUAL_READ32 4
+
+#define Litbits 8
+#define MaxLit ((1 << Litbits) - 1)
+#define MaxML 52
+#define MaxLL 35
+#define MaxOff 28
+#define MaxSeq MAX(MaxLL, MaxML) /* Assumption : MaxOff < MaxLL,MaxML */
+#define MLFSELog 9
+#define LLFSELog 9
+#define OffFSELog 8
+
+static const U32 LL_bits[MaxLL + 1] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 3, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
+static const S16 LL_defaultNorm[MaxLL + 1] = {4, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 2, 1, 1, 1, 1, 1, -1, -1, -1, -1};
+#define LL_DEFAULTNORMLOG 6 /* for static allocation */
+static const U32 LL_defaultNormLog = LL_DEFAULTNORMLOG;
+
+static const U32 ML_bits[MaxML + 1] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0,  0,  0,  0,  0,  0, 0,
+				       0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 3, 3, 4, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
+static const S16 ML_defaultNorm[MaxML + 1] = {1, 4, 3, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  1,  1,  1,  1,  1,  1, 1,
+					      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, -1, -1, -1, -1, -1, -1, -1};
+#define ML_DEFAULTNORMLOG 6 /* for static allocation */
+static const U32 ML_defaultNormLog = ML_DEFAULTNORMLOG;
+
+static const S16 OF_defaultNorm[MaxOff + 1] = {1, 1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, -1, -1, -1, -1, -1};
+#define OF_DEFAULTNORMLOG 5 /* for static allocation */
+static const U32 OF_defaultNormLog = OF_DEFAULTNORMLOG;
+
+/*-*******************************************
+*  Shared functions to include for inlining
+*********************************************/
+ZSTD_STATIC void ZSTD_copy8(void *dst, const void *src) {
+	/*
+	 * zstd relies heavily on gcc being able to analyze and inline this
+	 * memcpy() call, since it is called in a tight loop. Preboot mode
+	 * is compiled in freestanding mode, which stops gcc from analyzing
+	 * memcpy(). Use __builtin_memcpy() to tell gcc to analyze this as a
+	 * regular memcpy().
+	 */
+	__builtin_memcpy(dst, src, 8);
+}
+/*! ZSTD_wildcopy() :
+*   custom version of memcpy(), can copy up to 7 bytes too many (8 bytes if length==0) */
+#define WILDCOPY_OVERLENGTH 8
+ZSTD_STATIC void ZSTD_wildcopy(void *dst, const void *src, ptrdiff_t length)
+{
+	const BYTE* ip = (const BYTE*)src;
+	BYTE* op = (BYTE*)dst;
+	BYTE* const oend = op + length;
+#if defined(GCC_VERSION) && GCC_VERSION >= 70000 && GCC_VERSION < 70200
+	/*
+	 * Work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81388.
+	 * Avoid the bad case where the loop only runs once by handling the
+	 * special case separately. This doesn't trigger the bug because it
+	 * doesn't involve pointer/integer overflow.
+	 */
+	if (length <= 8)
+		return ZSTD_copy8(dst, src);
+#endif
+	do {
+		ZSTD_copy8(op, ip);
+		op += 8;
+		ip += 8;
+	} while (op < oend);
+}
+
+/*-*******************************************
+*  Private interfaces
+*********************************************/
+typedef struct ZSTD_stats_s ZSTD_stats_t;
+
+typedef struct {
+	U32 off;
+	U32 len;
+} ZSTD_match_t;
+
+typedef struct {
+	U32 price;
+	U32 off;
+	U32 mlen;
+	U32 litlen;
+	U32 rep[ZSTD_REP_NUM];
+} ZSTD_optimal_t;
+
+typedef struct seqDef_s {
+	U32 offset;
+	U16 litLength;
+	U16 matchLength;
+} seqDef;
+
+typedef struct {
+	seqDef *sequencesStart;
+	seqDef *sequences;
+	BYTE *litStart;
+	BYTE *lit;
+	BYTE *llCode;
+	BYTE *mlCode;
+	BYTE *ofCode;
+	U32 longLengthID; /* 0 == no longLength; 1 == Lit.longLength; 2 == Match.longLength; */
+	U32 longLengthPos;
+	/* opt */
+	ZSTD_optimal_t *priceTable;
+	ZSTD_match_t *matchTable;
+	U32 *matchLengthFreq;
+	U32 *litLengthFreq;
+	U32 *litFreq;
+	U32 *offCodeFreq;
+	U32 matchLengthSum;
+	U32 matchSum;
+	U32 litLengthSum;
+	U32 litSum;
+	U32 offCodeSum;
+	U32 log2matchLengthSum;
+	U32 log2matchSum;
+	U32 log2litLengthSum;
+	U32 log2litSum;
+	U32 log2offCodeSum;
+	U32 factor;
+	U32 staticPrices;
+	U32 cachedPrice;
+	U32 cachedLitLength;
+	const BYTE *cachedLiterals;
+} seqStore_t;
+
+const seqStore_t *ZSTD_getSeqStore(const ZSTD_CCtx *ctx);
+void ZSTD_seqToCodes(const seqStore_t *seqStorePtr);
+int ZSTD_isSkipFrame(ZSTD_DCtx *dctx);
+
+/*= Custom memory allocation functions */
+typedef void *(*ZSTD_allocFunction)(void *opaque, size_t size);
+typedef void (*ZSTD_freeFunction)(void *opaque, void *address);
+typedef struct {
+	ZSTD_allocFunction customAlloc;
+	ZSTD_freeFunction customFree;
+	void *opaque;
+} ZSTD_customMem;
+
+void *ZSTD_malloc(size_t size, ZSTD_customMem customMem);
+void ZSTD_free(void *ptr, ZSTD_customMem customMem);
+
+/*====== stack allocation  ======*/
+
+typedef struct {
+	void *ptr;
+	const void *end;
+} ZSTD_stack;
+
+#define ZSTD_ALIGN(x) ALIGN(x, sizeof(size_t))
+#define ZSTD_PTR_ALIGN(p) PTR_ALIGN(p, sizeof(size_t))
+
+ZSTD_customMem ZSTD_initStack(void *workspace, size_t workspaceSize);
+
+void *ZSTD_stackAllocAll(void *opaque, size_t *size);
+void *ZSTD_stackAlloc(void *opaque, size_t size);
+void ZSTD_stackFree(void *opaque, void *address);
+
+/*======  common function  ======*/
+
+ZSTD_STATIC U32 ZSTD_highbit32(U32 val) { return 31 - __builtin_clz(val); }
+
+/* hidden functions */
+
+/* ZSTD_invalidateRepCodes() :
+ * ensures next compression will not use repcodes from previous block.
+ * Note : only works with regular variant;
+ *        do not use with extDict variant ! */
+void ZSTD_invalidateRepCodes(ZSTD_CCtx *cctx);
+
+size_t ZSTD_freeCCtx(ZSTD_CCtx *cctx);
+size_t ZSTD_freeDCtx(ZSTD_DCtx *dctx);
+size_t ZSTD_freeCDict(ZSTD_CDict *cdict);
+size_t ZSTD_freeDDict(ZSTD_DDict *cdict);
+size_t ZSTD_freeCStream(ZSTD_CStream *zcs);
+size_t ZSTD_freeDStream(ZSTD_DStream *zds);
+
+#endif /* ZSTD_CCOMMON_H_MODULE */
--- a/xen/include/xen/decompress.h
+++ b/xen/include/xen/decompress.h
@@ -31,7 +31,7 @@ typedef int decompress_fn(unsigned char
  * dependent).
  */
 
-decompress_fn bunzip2, unxz, unlzma, unlzo, unlz4;
+decompress_fn bunzip2, unxz, unlzma, unlzo, unlz4, unzstd;
 
 int decompress(void *inbuf, unsigned int len, void *outbuf);
 
--- a/xen/include/asm-arm/types.h
+++ b/xen/include/asm-arm/types.h
@@ -61,6 +61,12 @@ typedef unsigned long size_t;
 #endif
 typedef signed long ssize_t;
 
+#if defined(__PTRDIFF_TYPE__)
+typedef __PTRDIFF_TYPE__ ptrdiff_t;
+#else
+typedef signed long ptrdiff_t;
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ARM_TYPES_H__ */
--- a/xen/include/asm-x86/types.h
+++ b/xen/include/asm-x86/types.h
@@ -39,6 +39,12 @@ typedef unsigned long size_t;
 #endif
 typedef signed long ssize_t;
 
+#if defined(__PTRDIFF_TYPE__)
+typedef __PTRDIFF_TYPE__ ptrdiff_t;
+#else
+typedef signed long ptrdiff_t;
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __X86_TYPES_H__ */


