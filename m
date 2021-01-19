Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863AA2FBAD5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 16:16:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70479.126515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sjd-0004Cm-Tf; Tue, 19 Jan 2021 15:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70479.126515; Tue, 19 Jan 2021 15:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sjd-0004CL-Q0; Tue, 19 Jan 2021 15:15:57 +0000
Received: by outflank-mailman (input) for mailman id 70479;
 Tue, 19 Jan 2021 15:15:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1sjc-0004CC-H1
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 15:15:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f84500c6-a716-48c8-ba64-667ac2c36f8b;
 Tue, 19 Jan 2021 15:15:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4DE48AAAE;
 Tue, 19 Jan 2021 15:15:54 +0000 (UTC)
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
X-Inumbo-ID: f84500c6-a716-48c8-ba64-667ac2c36f8b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611069354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZpgyMc4DwSP/R3mbq7ta8DfhXOQugPMtfzDbMFjt/A=;
	b=AkpiedSxK0NSZNyyjeqmgIQLOPh6/Fk/DmCM7/pzaLNcXUeXXYRBTS9kdcyGbxUKfjf84i
	teFkgkwob+Pz6gxz/TR/vftyQn7GJ7vMHaUOp5J4OTaPXnfwWWJddUvcK6onU/+5y422Dl
	hmKzF7PYI6evkQeWSw0mVPhnGDz60Gk=
Subject: [PATCH v2 2/5] xen/decompress: make helper symbols static
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
Message-ID: <80b7e64d-02b3-55c6-1379-4ac9f77d3869@suse.com>
Date: Tue, 19 Jan 2021 16:15:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The individual decompression CUs need to only surface their top level
functions to other code. Arrange for everything else to be static, to
make sure no undue uses of that code exist or will appear without
explicitly noticing. (In some cases this also results in code size
reduction, but since this is all init-only code this probably doesn't
matter very much.)

In the LZO case also take the opportunity and convert u8 where lines
get touched anyway.

The downside is that the top level functions will now be non-static
in stubdom builds of libxenguest, but I think that's acceptable. This
does require declaring them first, though, as the compiler warns about
the lack of declarations.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: Fix stubdom build.

--- a/tools/libs/guest/xg_dom_decompress_unsafe.h
+++ b/tools/libs/guest/xg_dom_decompress_unsafe.h
@@ -1,8 +1,12 @@
+#ifdef __MINIOS__
+# include "../../xen/include/xen/decompress.h"
+#else
 typedef int decompress_fn(unsigned char *inbuf, unsigned int len,
                           int (*fill)(void*, unsigned int),
                           int (*flush)(void*, unsigned int),
                           unsigned char *outbuf, unsigned int *posp,
                           void (*error)(const char *x));
+#endif
 
 int xc_dom_decompress_unsafe(
     decompress_fn fn, struct xc_dom_image *dom, void **blob, size_t *size)
--- a/xen/common/bunzip2.c
+++ b/xen/common/bunzip2.c
@@ -665,12 +665,11 @@ static int INIT start_bunzip(struct bunz
 
 /* Example usage: decompress src_fd to dst_fd.  (Stops at end of bzip2 data,
    not end of file.) */
-STATIC int INIT bunzip2(unsigned char *buf, unsigned int len,
-			int(*fill)(void*, unsigned int),
-			int(*flush)(void*, unsigned int),
-			unsigned char *outbuf,
-			unsigned int *pos,
-			void(*error)(const char *x))
+int INIT bunzip2(unsigned char *buf, unsigned int len,
+		 int(*fill)(void*, unsigned int),
+		 int(*flush)(void*, unsigned int),
+		 unsigned char *outbuf, unsigned int *pos,
+		 void(*error)(const char *x))
 {
 	struct bunzip_data *bd;
 	int i = -1;
--- a/xen/common/decompress.h
+++ b/xen/common/decompress.h
@@ -7,7 +7,7 @@
 #include <xen/types.h>
 #include <xen/xmalloc.h>
 
-#define STATIC
+#define STATIC static
 #define INIT __init
 #define INITDATA __initdata
 
--- a/xen/common/unlz4.c
+++ b/xen/common/unlz4.c
@@ -22,12 +22,11 @@
 #define LZ4_DEFAULT_UNCOMPRESSED_CHUNK_SIZE (8 << 20)
 #define ARCHIVE_MAGICNUMBER 0x184C2102
 
-STATIC int INIT unlz4(unsigned char *input, unsigned int in_len,
-		      int (*fill)(void *, unsigned int),
-		      int (*flush)(void *, unsigned int),
-		      unsigned char *output,
-		      unsigned int *posp,
-		      void (*error)(const char *x))
+int INIT unlz4(unsigned char *input, unsigned int in_len,
+	       int (*fill)(void *, unsigned int),
+	       int (*flush)(void *, unsigned int),
+	       unsigned char *output, unsigned int *posp,
+	       void (*error)(const char *x))
 {
 	int ret = -1;
 	size_t chunksize = 0;
--- a/xen/common/unlzma.c
+++ b/xen/common/unlzma.c
@@ -528,13 +528,11 @@ static inline int INIT process_bit1(stru
 
 
 
-STATIC int INIT unlzma(unsigned char *buf, unsigned int in_len,
-		       int(*fill)(void*, unsigned int),
-		       int(*flush)(void*, unsigned int),
-		       unsigned char *output,
-		       unsigned int *posp,
-		       void(*error)(const char *x)
-	)
+int INIT unlzma(unsigned char *buf, unsigned int in_len,
+	        int(*fill)(void*, unsigned int),
+	        int(*flush)(void*, unsigned int),
+	        unsigned char *output, unsigned int *posp,
+	        void(*error)(const char *x))
 {
 	struct lzma_header header;
 	int lc, pb, lp;
--- a/xen/common/unlzo.c
+++ b/xen/common/unlzo.c
@@ -114,11 +114,11 @@ static int INIT parse_header(u8 *input,
 	return 1;
 }
 
-STATIC int INIT unlzo(u8 *input, unsigned int in_len,
-		      int (*fill) (void *, unsigned int),
-		      int (*flush) (void *, unsigned int),
-		      u8 *output, unsigned int *posp,
-		      void (*error) (const char *x))
+int INIT unlzo(unsigned char *input, unsigned int in_len,
+	       int (*fill) (void *, unsigned int),
+	       int (*flush) (void *, unsigned int),
+	       unsigned char *output, unsigned int *posp,
+	       void (*error) (const char *x))
 {
 	u8 r = 0;
 	int skip = 0;
--- a/xen/common/unxz.c
+++ b/xen/common/unxz.c
@@ -157,11 +157,11 @@
  * both input and output buffers are available as a single chunk, i.e. when
  * fill() and flush() won't be used.
  */
-STATIC int INIT unxz(unsigned char *in, unsigned int in_size,
-		     int (*fill)(void *dest, unsigned int size),
-		     int (*flush)(void *src, unsigned int size),
-		     unsigned char *out, unsigned int *in_used,
-		     void (*error)(const char *x))
+int INIT unxz(unsigned char *in, unsigned int in_size,
+	      int (*fill)(void *dest, unsigned int size),
+	      int (*flush)(void *src, unsigned int size),
+	      unsigned char *out, unsigned int *in_used,
+	      void (*error)(const char *x))
 {
 	struct xz_buf b;
 	struct xz_dec *s;
--- a/xen/common/unzstd.c
+++ b/xen/common/unzstd.c
@@ -142,12 +142,11 @@ out:
 	return err;
 }
 
-STATIC int INIT unzstd(unsigned char *in_buf, unsigned int in_len,
-		       int (*fill)(void*, unsigned int),
-		       int (*flush)(void*, unsigned int),
-		       unsigned char *out_buf,
-		       unsigned int *in_pos,
-		       void (*error)(const char *x))
+int INIT unzstd(unsigned char *in_buf, unsigned int in_len,
+	        int (*fill)(void*, unsigned int),
+	        int (*flush)(void*, unsigned int),
+	        unsigned char *out_buf, unsigned int *in_pos,
+	        void (*error)(const char *x))
 {
 	ZSTD_inBuffer in;
 	ZSTD_outBuffer out;


