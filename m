Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124D52F9DEB
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 12:19:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69595.124682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1SYz-0001dC-Dr; Mon, 18 Jan 2021 11:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69595.124682; Mon, 18 Jan 2021 11:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1SYz-0001cn-AX; Mon, 18 Jan 2021 11:19:13 +0000
Received: by outflank-mailman (input) for mailman id 69595;
 Mon, 18 Jan 2021 11:19:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1SYy-0001ci-AC
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 11:19:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a95f71c-a373-4c2a-b608-05881a7d36ab;
 Mon, 18 Jan 2021 11:19:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53109B7A9;
 Mon, 18 Jan 2021 11:19:10 +0000 (UTC)
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
X-Inumbo-ID: 4a95f71c-a373-4c2a-b608-05881a7d36ab
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610968750; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7mTjcK486ZkNIgo8Ua0HiqufPfYf/V7lCgHPOL2pgAg=;
	b=mFceRTR72YcTT/kl+j+8HPu3wOXZAfvb2kYWMCNQGb6jYPNoiPhpSg6KoCLrottCybASIq
	4qba2hZyilbcT5Wmy/3iugrbj/Qo1FNi5hXtdJ6mjFqevQrk2jACGVzQ6mIttzfUuGRpRl
	hI06VJ2zT3zdywblux53rRAF+yjQ4J4=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/decompress: make helper symbols static
Message-ID: <28f15465-bfcd-606b-eb24-42bfb990ae3d@suse.com>
Date: Mon, 18 Jan 2021 12:19:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
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

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The downside is that the top level functions will now be non-static
in stubdom builds of libxenguest, but I think that's acceptable.

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

