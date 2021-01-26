Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88930303967
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 10:50:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74723.134316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KzT-0000v4-3O; Tue, 26 Jan 2021 09:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74723.134316; Tue, 26 Jan 2021 09:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KzS-0000uc-UH; Tue, 26 Jan 2021 09:50:26 +0000
Received: by outflank-mailman (input) for mailman id 74723;
 Tue, 26 Jan 2021 09:50:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4KzQ-0000u6-Vx
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:50:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7cc9d731-213c-4701-84ce-e09da51100d4;
 Tue, 26 Jan 2021 09:50:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D96E0AC4F;
 Tue, 26 Jan 2021 09:50:22 +0000 (UTC)
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
X-Inumbo-ID: 7cc9d731-213c-4701-84ce-e09da51100d4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611654623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y/DRrMi+eT87xxX0mS2gn1WxPDEKCjta7yHMaI2+K/E=;
	b=tPBcLDSjOh0isQnMjd7MEUi9L5x7J37zNI1ybHTlm9ZRBknaPiEt1o7ApjHjCIWtEBmz+b
	ezVm3/dkSUNMfo8RXgYq5QL4sdqHdCaaqVe3GFSNGyHVfht7X2on5tO+LFeRwxKoAh6YSe
	B3b8W6vkjxE/6/u5Nb44kNDnNMnIbhI=
Subject: [PATCH v3 06/15] libxenguest: simplify kernel decompression
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Message-ID: <0f5a2958-8847-772a-5fe4-06264867470a@suse.com>
Date: Tue, 26 Jan 2021 10:50:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In all cases the kernel build makes available the uncompressed size in
the final 4 bytes of the bzImage payload. Utilize this to avoid
repeated realloc()ing of the output buffer.

As a side effect this also addresses the previous mistaken return of 0
(success) from xc_try_{bzip2,lzma,xz}_decode() in case
xc_dom_register_external() would have failed.

As another side effect this also addresses the first error path of
_xc_try_lzma_decode() previously bypassing lzma_end().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Wei Liu <wl@xen.org>
---
v3: Use helper for unaligned reads.
v2: New.

--- a/tools/libs/guest/xg_dom_bzimageloader.c
+++ b/tools/libs/guest/xg_dom_bzimageloader.c
@@ -48,18 +48,16 @@ static int xc_try_bzip2_decode(
     bz_stream stream;
     int ret;
     char *out_buf;
-    char *tmp_buf;
     int retval = -1;
-    unsigned int outsize;
-    uint64_t total;
+    unsigned int insize, outsize;
 
     stream.bzalloc = NULL;
     stream.bzfree = NULL;
     stream.opaque = NULL;
 
-    if ( dom->kernel_size == 0)
+    if ( *size <= 8 )
     {
-        DOMPRINTF("BZIP2: Input is 0 size");
+        DOMPRINTF("BZIP2: insufficient input data");
         return -1;
     }
 
@@ -70,22 +68,25 @@ static int xc_try_bzip2_decode(
         return -1;
     }
 
-    /* sigh.  We don't know up-front how much memory we are going to need
-     * for the output buffer.  Allocate the output buffer to be equal
-     * the input buffer to start, and we'll realloc as needed.
-     */
-    outsize = dom->kernel_size;
+    insize = *size - 4;
+    outsize = get_unaligned_le32(*blob + insize);
 
     /*
-     * stream.avail_in and outsize are unsigned int, while kernel_size
+     * stream.avail_in and insize are unsigned int, while *size
      * is a size_t. Check we aren't overflowing.
      */
-    if ( outsize != dom->kernel_size )
+    if ( insize + 4 != *size )
     {
         DOMPRINTF("BZIP2: Input too large");
         goto bzip2_cleanup;
     }
 
+    if ( xc_dom_kernel_check_size(dom, outsize) )
+    {
+        DOMPRINTF("BZIP2: output too large");
+        goto bzip2_cleanup;
+    }
+
     out_buf = malloc(outsize);
     if ( out_buf == NULL )
     {
@@ -94,86 +95,45 @@ static int xc_try_bzip2_decode(
     }
 
     stream.next_in = dom->kernel_blob;
-    stream.avail_in = dom->kernel_size;
+    stream.avail_in = insize;
 
     stream.next_out = out_buf;
-    stream.avail_out = dom->kernel_size;
+    stream.avail_out = outsize;
 
-    for ( ; ; )
+    ret = BZ2_bzDecompress(&stream);
+    if ( ret == BZ_STREAM_END )
+        DOMPRINTF("BZIP2: Saw data stream end");
+    else if ( ret != BZ_OK )
     {
-        ret = BZ2_bzDecompress(&stream);
-        if ( ret == BZ_STREAM_END )
-        {
-            DOMPRINTF("BZIP2: Saw data stream end");
-            retval = 0;
-            break;
-        }
-        if ( ret != BZ_OK )
-        {
-            DOMPRINTF("BZIP2: error %d", ret);
-            free(out_buf);
-            goto bzip2_cleanup;
-        }
+        DOMPRINTF("BZIP2: error %d", ret);
+        free(out_buf);
+        goto bzip2_cleanup;
+    }
 
-        if ( stream.avail_out == 0 )
-        {
-            /* Protect against output buffer overflow */
-            if ( outsize > UINT_MAX / 2 )
-            {
-                DOMPRINTF("BZIP2: output buffer overflow");
-                free(out_buf);
-                goto bzip2_cleanup;
-            }
-
-            if ( xc_dom_kernel_check_size(dom, outsize * 2) )
-            {
-                DOMPRINTF("BZIP2: output too large");
-                free(out_buf);
-                goto bzip2_cleanup;
-            }
-
-            tmp_buf = realloc(out_buf, outsize * 2);
-            if ( tmp_buf == NULL )
-            {
-                DOMPRINTF("BZIP2: Failed to realloc memory");
-                free(out_buf);
-                goto bzip2_cleanup;
-            }
-            out_buf = tmp_buf;
-
-            stream.next_out = out_buf + outsize;
-            stream.avail_out = (outsize * 2) - outsize;
-            outsize *= 2;
-        }
-        else if ( stream.avail_in == 0 )
-        {
-            /*
-             * If there is output buffer available then this indicates
-             * that BZ2_bzDecompress would like more input data to be
-             * provided.  However our complete input buffer is in
-             * memory and provided upfront so if avail_in is zero this
-             * actually indicates a truncated input.
-             */
-            DOMPRINTF("BZIP2: not enough input");
-            free(out_buf);
-            goto bzip2_cleanup;
-        }
+    if ( stream.total_out_lo32 != outsize || stream.total_out_hi32 )
+    {
+        DOMPRINTF("BZIP2: got 0x%x%08x bytes instead of 0x%09x",
+                  stream.total_out_hi32, stream.total_out_lo32, outsize);
+        free(out_buf);
+        goto bzip2_cleanup;
     }
 
-    total = (((uint64_t)stream.total_out_hi32) << 32) | stream.total_out_lo32;
+    if ( stream.avail_in )
+        DOMPRINTF("BZIP2: Warning: %#x unconsumed bytes", stream.avail_in);
 
-    if ( xc_dom_register_external(dom, out_buf, total) )
+    if ( xc_dom_register_external(dom, out_buf, outsize) )
     {
         DOMPRINTF("BZIP2: Error registering stream output");
         free(out_buf);
         goto bzip2_cleanup;
     }
 
-    DOMPRINTF("%s: BZIP2 decompress OK, 0x%zx -> 0x%lx",
-              __FUNCTION__, *size, (long unsigned int) total);
+    DOMPRINTF("%s: BZIP2 decompress OK, 0x%zx -> 0x%x",
+              __FUNCTION__, *size, outsize);
 
     *blob = out_buf;
-    *size = total;
+    *size = outsize;
+    retval = 0;
 
  bzip2_cleanup:
     BZ2_bzDecompressEnd(&stream);
@@ -205,22 +165,24 @@ static int _xc_try_lzma_decode(
     lzma_ret ret;
     lzma_action action = LZMA_RUN;
     unsigned char *out_buf;
-    unsigned char *tmp_buf;
     int retval = -1;
-    size_t outsize;
-    const char *msg;
+    size_t insize, outsize;
 
-    if ( dom->kernel_size == 0)
+    if ( *size < 8 )
     {
-        DOMPRINTF("%s: Input is 0 size", what);
-        return -1;
+        DOMPRINTF("%s: insufficient input data", what);
+        goto lzma_cleanup;
+    }
+
+    insize = *size - 4;
+    outsize = get_unaligned_le32(*blob + insize);
+
+    if ( xc_dom_kernel_check_size(dom, outsize) )
+    {
+        DOMPRINTF("%s: output too large", what);
+        goto lzma_cleanup;
     }
 
-    /* sigh.  We don't know up-front how much memory we are going to need
-     * for the output buffer.  Allocate the output buffer to be equal
-     * the input buffer to start, and we'll realloc as needed.
-     */
-    outsize = dom->kernel_size;
     out_buf = malloc(outsize);
     if ( out_buf == NULL )
     {
@@ -229,92 +191,68 @@ static int _xc_try_lzma_decode(
     }
 
     stream->next_in = dom->kernel_blob;
-    stream->avail_in = dom->kernel_size;
+    stream->avail_in = insize;
 
     stream->next_out = out_buf;
-    stream->avail_out = dom->kernel_size;
+    stream->avail_out = outsize;
 
-    for ( ; ; )
+    ret = lzma_code(stream, action);
+    if ( ret == LZMA_STREAM_END )
+        DOMPRINTF("%s: Saw data stream end", what);
+    else if ( ret != LZMA_OK )
     {
-        ret = lzma_code(stream, action);
-        if ( ret == LZMA_STREAM_END )
+        const char *msg;
+
+        switch ( ret )
         {
-            DOMPRINTF("%s: Saw data stream end", what);
-            retval = 0;
+        case LZMA_MEM_ERROR:
+            msg = strerror(ENOMEM);
             break;
-        }
-        if ( ret != LZMA_OK )
-        {
-            switch ( ret )
-            {
-            case LZMA_MEM_ERROR:
-                msg = strerror(ENOMEM);
-                break;
 
-            case LZMA_MEMLIMIT_ERROR:
-                msg = "Memory usage limit reached";
-                break;
+        case LZMA_MEMLIMIT_ERROR:
+            msg = "Memory usage limit reached";
+            break;
 
-            case LZMA_FORMAT_ERROR:
-                msg = "File format not recognized";
-                break;
+        case LZMA_FORMAT_ERROR:
+            msg = "File format not recognized";
+            break;
 
-            case LZMA_OPTIONS_ERROR:
-                // FIXME: Better message?
-                msg = "Unsupported compression options";
-                break;
+        case LZMA_OPTIONS_ERROR:
+            // FIXME: Better message?
+            msg = "Unsupported compression options";
+            break;
 
-            case LZMA_DATA_ERROR:
-                msg = "File is corrupt";
-                break;
+        case LZMA_DATA_ERROR:
+            msg = "File is corrupt";
+            break;
 
-            case LZMA_BUF_ERROR:
-                msg = "Unexpected end of input";
-                break;
+        case LZMA_BUF_ERROR:
+            msg = "Unexpected end of input";
+            break;
 
-            default:
-                msg = "Internal program error (bug)";
-                break;
-            }
-            DOMPRINTF("%s: %s decompression error: %s",
-                      __FUNCTION__, what, msg);
-            free(out_buf);
-            goto lzma_cleanup;
+         default:
+            msg = "Internal program error (bug)";
+            break;
         }
 
-        if ( stream->avail_out == 0 )
-        {
-            /* Protect against output buffer overflow */
-            if ( outsize > SIZE_MAX / 2 )
-            {
-                DOMPRINTF("%s: output buffer overflow", what);
-                free(out_buf);
-                goto lzma_cleanup;
-            }
-
-            if ( xc_dom_kernel_check_size(dom, outsize * 2) )
-            {
-                DOMPRINTF("%s: output too large", what);
-                free(out_buf);
-                goto lzma_cleanup;
-            }
-
-            tmp_buf = realloc(out_buf, outsize * 2);
-            if ( tmp_buf == NULL )
-            {
-                DOMPRINTF("%s: Failed to realloc memory", what);
-                free(out_buf);
-                goto lzma_cleanup;
-            }
-            out_buf = tmp_buf;
-
-            stream->next_out = out_buf + outsize;
-            stream->avail_out = (outsize * 2) - outsize;
-            outsize *= 2;
-        }
+        DOMPRINTF("%s: %s decompression error: %s",
+                  __FUNCTION__, what, msg);
+        free(out_buf);
+        goto lzma_cleanup;
+    }
+
+    if ( stream->total_out != outsize )
+    {
+        DOMPRINTF("%s: got 0x%"PRIx64" bytes instead of 0x%zx",
+                  what, stream->total_out, outsize);
+        free(out_buf);
+        goto lzma_cleanup;
     }
 
-    if ( xc_dom_register_external(dom, out_buf, stream->total_out) )
+    if ( stream->avail_in )
+        DOMPRINTF("%s: Warning: %#zx unconsumed bytes", what, stream->avail_in);
+
+    if ( xc_dom_register_external(dom, out_buf, outsize) )
     {
         DOMPRINTF("%s: Error registering stream output", what);
         free(out_buf);
@@ -322,10 +260,11 @@ static int _xc_try_lzma_decode(
     }
 
     DOMPRINTF("%s: %s decompress OK, 0x%zx -> 0x%zx",
-              __FUNCTION__, what, *size, (size_t)stream->total_out);
+              __FUNCTION__, what, *size, outsize);
 
     *blob = out_buf;
-    *size = stream->total_out;
+    *size = outsize;
+    retval = 0;
 
  lzma_cleanup:
     lzma_end(stream);
@@ -408,8 +347,8 @@ static int xc_try_lzo1x_decode(
 {
     int ret;
     const unsigned char *cur = dom->kernel_blob;
-    unsigned char *out_buf = NULL;
-    size_t left = dom->kernel_size, outsize;
+    unsigned char *out_buf;
+    size_t left = dom->kernel_size, outsize, outtot;
     const char *msg;
     unsigned version;
     static const unsigned char magic[] = {
@@ -435,6 +374,15 @@ static int xc_try_lzo1x_decode(
         return -1;
     }
 
+    left -= 4;
+    outtot = get_unaligned_le32(*blob + left);
+
+    if ( xc_dom_kernel_check_size(dom, outtot) )
+    {
+        DOMPRINTF("LZO1x: output too large");
+        return -1;
+    }
+
     /* get version (2bytes), skip library version (2),
      * 'need to be extracted' version (2) and method (1) */
     version = lzo_read_16(cur + 9);
@@ -471,10 +419,16 @@ static int xc_try_lzo1x_decode(
     cur += ret;
     left -= ret;
 
+    out_buf = malloc(outtot);
+    if ( !out_buf )
+    {
+        DOMPRINTF("LZO1x: failed to alloc memory");
+        return -1;
+    }
+
     for ( outsize = 0; ; )
     {
         lzo_uint src_len, dst_len, out_len;
-        unsigned char *tmp_buf;
 
         msg = "Short input";
         if ( left < 4 )
@@ -483,6 +437,13 @@ static int xc_try_lzo1x_decode(
         dst_len = lzo_read_32(cur);
         if ( !dst_len )
         {
+            msg = "Unexpected output size";
+            if ( outsize != outtot )
+                break;
+
+            if ( left != 4 )
+                DOMPRINTF("LZO1x: Warning: %#zx unconsumed bytes", left - 4);
+
             msg = "Error registering stream output";
             if ( xc_dom_register_external(dom, out_buf, outsize) )
                 break;
@@ -514,19 +475,9 @@ static int xc_try_lzo1x_decode(
             break;
 
         msg = "Output buffer overflow";
-        if ( outsize > SIZE_MAX - dst_len )
-            break;
-
-        msg = "Decompressed image too large";
-        if ( xc_dom_kernel_check_size(dom, outsize + dst_len) )
-            break;
-
-        msg = "Failed to (re)alloc memory";
-        tmp_buf = realloc(out_buf, outsize + dst_len);
-        if ( tmp_buf == NULL )
+        if ( dst_len > outtot - outsize )
             break;
 
-        out_buf = tmp_buf;
         out_len = dst_len;
 
         ret = lzo1x_decompress_safe(cur, src_len,


