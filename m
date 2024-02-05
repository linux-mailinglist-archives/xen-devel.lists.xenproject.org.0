Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCA6849DC5
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:14:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676178.1052126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0fr-0001rp-3h; Mon, 05 Feb 2024 15:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676178.1052126; Mon, 05 Feb 2024 15:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0fr-0001p0-0P; Mon, 05 Feb 2024 15:14:19 +0000
Received: by outflank-mailman (input) for mailman id 676178;
 Mon, 05 Feb 2024 15:14:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W3Sh=JO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rX0fq-0001ou-A4
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:14:18 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a03512b-c439-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:14:16 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cf5917f049so52635011fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:14:16 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q5-20020a5085c5000000b00557aa8d72c9sm3869905edh.25.2024.02.05.07.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:14:15 -0800 (PST)
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
X-Inumbo-ID: 3a03512b-c439-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707146055; x=1707750855; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pZMRWCjeqgfIORlG9fhev9dwrUTk11miJ02JZjWQfQA=;
        b=HsYp2/tGgtr1rxagc3Ojwi8kzQF2mZV6MZxODaWSQC1pF62OsqsqtX8Wd5C3+z6+8U
         pEegMpeURTKLG96qprLP7nrf3sK+cKSHNi3akiTUhgL45v8Ob6Oc0hdWXIobYIep+7Ck
         ZPBk3jgafEHIBUd7/5zeb/A2XNbURbmn/krb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707146055; x=1707750855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZMRWCjeqgfIORlG9fhev9dwrUTk11miJ02JZjWQfQA=;
        b=Sn35CZ2KUTvaXW2pktrmiwB9c0a6Hy3xB1hFsV/VWw068iAqYl9wNm5RHl/XIZN7U2
         kO07+F8qa8s0QdkDy4QwYVKHasZp9Q7/G+/y4cFLVL6gDKr9XqIxVBKU7mRtAGSgFweK
         a62iDFExr9PpOxia2sAqVBTN5es8k45EGNowfZoNyRcgJnMlKV/JYs85cX/JeOym89i0
         XQcGQTlRXUOnbqQELmq0cX95dXrTnOh/TPzsxEz1BJe2+E3owmNEjDUi011SOk/QWJ3X
         608UoTzkft+C/3mo+j9UO9rEpvpSV9K/79BCiF+gjldSiVUSd6d3Ux3+F+aGi9jSCmW2
         E0Uw==
X-Gm-Message-State: AOJu0Yx+HJkKYyqxyHdkkCrz+WF2RS+Q3Lo/Br3+b2uNy3OpUgmXU2la
	3HJtJ/4ep8T8yOgtersbjllf53M9yfIQJdFxwkUfyJgCFAEksZ8bYdyCihdZkbLINcFmHqOj+Os
	F
X-Google-Smtp-Source: AGHT+IGw6S7F2JTGw+GcAA4LPr5r/0NU8ApHDuQvU6XSTnGEAG0ioEI1i5SVIa7kZ0KnoPSY5M88iQ==
X-Received: by 2002:a05:6512:3e13:b0:511:1fb0:1f71 with SMTP id i19-20020a0565123e1300b005111fb01f71mr12597388lfv.51.1707146055356;
        Mon, 05 Feb 2024 07:14:15 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUIMQCz7/oDivSd0bF2lgC58tsYT9ImErvDVVULeAdU9ZorLPtruSn15aMek96uQYsv3iMnPSHKPaPxvk6HIHqZlEeDDUtcCd+ar62iXhlTwBIHCIyIHSicAfdjMSPjt79OVDtQXcBE81zWXZ6yEnrdbF40OTAGbhj8Vl4VPktJGcPuYoAtXkyBPZgDRubSoA==
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] x86/bitmap: Even more signed-ness fixes
Date: Mon,  5 Feb 2024 15:14:13 +0000
Message-Id: <20240205151413.1919983-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Further to commit 558e84b7ffec ("xen/bitmap: Consistently use unsigned bits
values"), it turns out that GCC's range analysis isn't good enough to notice
that 'bits / BITS_PER_LONG' is always within the unsigned range of k.

As a consequence, it re-sign-extends 'k' when calculating the pointer holding
'bitmap[k]' on each loop iteration.  Switch all internal variables to unsigned
int, which allows for better-still code generation.

Also clean up the prototypes for __bitmap_{set,clear} and the *_region()
helpers, along with the internal variables.

Bloat-o-meter for a random x86 build reports:
  add/remove: 0/0 grow/shrink: 0/10 up/down: 0/-277 (-277)

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>

Full bloat-o-meter details:

  add/remove: 0/0 grow/shrink: 0/10 up/down: 0/-277 (-277)
  Function                                     old     new   delta
  __bitmap_equal                               105     102      -3
  bitmap_find_free_region                      135     129      -6
  __bitmap_subset                              121     115      -6
  __bitmap_intersects                          105      99      -6
  __bitmap_full                                 91      85      -6
  __bitmap_empty                                90      84      -6
  bitmap_release_region                         68      45     -23
  bitmap_allocate_region                       104      72     -32
  __bitmap_clear                               136      43     -93
  __bitmap_set                                 136      40     -96
  Total: Before=4063985, After=4063708, chg -0.01%

Other functions have changes, but no net change.
---
 xen/common/bitmap.c      | 76 ++++++++++++++++++++++------------------
 xen/include/xen/bitmap.h | 15 ++++----
 2 files changed, 50 insertions(+), 41 deletions(-)

diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index 9d9ff09f3dde..18e23e2f0e18 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -57,7 +57,8 @@ static void clamp_last_byte(uint8_t *bp, unsigned int nbits)
 
 int __bitmap_empty(const unsigned long *bitmap, unsigned int bits)
 {
-	int k, lim = bits/BITS_PER_LONG;
+	unsigned int k, lim = bits / BITS_PER_LONG;
+
 	for (k = 0; k < lim; ++k)
 		if (bitmap[k])
 			return 0;
@@ -72,7 +73,8 @@ EXPORT_SYMBOL(__bitmap_empty);
 
 int __bitmap_full(const unsigned long *bitmap, unsigned int bits)
 {
-	int k, lim = bits/BITS_PER_LONG;
+	unsigned int k, lim = bits / BITS_PER_LONG;
+
 	for (k = 0; k < lim; ++k)
 		if (~bitmap[k])
 			return 0;
@@ -88,7 +90,8 @@ EXPORT_SYMBOL(__bitmap_full);
 int __bitmap_equal(const unsigned long *bitmap1,
                    const unsigned long *bitmap2, unsigned int bits)
 {
-	int k, lim = bits/BITS_PER_LONG;
+	unsigned int k, lim = bits / BITS_PER_LONG;
+
 	for (k = 0; k < lim; ++k)
 		if (bitmap1[k] != bitmap2[k])
 			return 0;
@@ -103,7 +106,8 @@ EXPORT_SYMBOL(__bitmap_equal);
 
 void __bitmap_complement(unsigned long *dst, const unsigned long *src, unsigned int bits)
 {
-	int k, lim = bits/BITS_PER_LONG;
+	unsigned int k, lim = bits / BITS_PER_LONG;
+
 	for (k = 0; k < lim; ++k)
 		dst[k] = ~src[k];
 
@@ -115,8 +119,7 @@ EXPORT_SYMBOL(__bitmap_complement);
 void __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
                   const unsigned long *bitmap2, unsigned int bits)
 {
-	int k;
-	int nr = BITS_TO_LONGS(bits);
+	unsigned int k, nr = BITS_TO_LONGS(bits);
 
 	for (k = 0; k < nr; k++)
 		dst[k] = bitmap1[k] & bitmap2[k];
@@ -126,8 +129,7 @@ EXPORT_SYMBOL(__bitmap_and);
 void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
                  const unsigned long *bitmap2, unsigned int bits)
 {
-	int k;
-	int nr = BITS_TO_LONGS(bits);
+	unsigned int k, nr = BITS_TO_LONGS(bits);
 
 	for (k = 0; k < nr; k++)
 		dst[k] = bitmap1[k] | bitmap2[k];
@@ -137,8 +139,7 @@ EXPORT_SYMBOL(__bitmap_or);
 void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
                   const unsigned long *bitmap2, unsigned int bits)
 {
-	int k;
-	int nr = BITS_TO_LONGS(bits);
+	unsigned int k, nr = BITS_TO_LONGS(bits);
 
 	for (k = 0; k < nr; k++)
 		dst[k] = bitmap1[k] ^ bitmap2[k];
@@ -148,8 +149,7 @@ EXPORT_SYMBOL(__bitmap_xor);
 void __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
                      const unsigned long *bitmap2, unsigned int bits)
 {
-	int k;
-	int nr = BITS_TO_LONGS(bits);
+	unsigned int k, nr = BITS_TO_LONGS(bits);
 
 	for (k = 0; k < nr; k++)
 		dst[k] = bitmap1[k] & ~bitmap2[k];
@@ -159,7 +159,8 @@ EXPORT_SYMBOL(__bitmap_andnot);
 int __bitmap_intersects(const unsigned long *bitmap1,
                         const unsigned long *bitmap2, unsigned int bits)
 {
-	int k, lim = bits/BITS_PER_LONG;
+	unsigned int k, lim = bits / BITS_PER_LONG;
+
 	for (k = 0; k < lim; ++k)
 		if (bitmap1[k] & bitmap2[k])
 			return 1;
@@ -174,7 +175,8 @@ EXPORT_SYMBOL(__bitmap_intersects);
 int __bitmap_subset(const unsigned long *bitmap1,
                     const unsigned long *bitmap2, unsigned int bits)
 {
-	int k, lim = bits/BITS_PER_LONG;
+	unsigned int k, lim = bits / BITS_PER_LONG;
+
 	for (k = 0; k < lim; ++k)
 		if (bitmap1[k] & ~bitmap2[k])
 			return 0;
@@ -200,11 +202,11 @@ unsigned int __bitmap_weight(const unsigned long *bitmap, unsigned int bits)
 }
 EXPORT_SYMBOL(__bitmap_weight);
 
-void __bitmap_set(unsigned long *map, unsigned int start, int len)
+void __bitmap_set(unsigned long *bitmap, unsigned int start, unsigned int len)
 {
-	unsigned long *p = map + BIT_WORD(start);
+	unsigned long *p = bitmap + BIT_WORD(start);
 	const unsigned int size = start + len;
-	int bits_to_set = BITS_PER_LONG - (start % BITS_PER_LONG);
+	unsigned int bits_to_set = BITS_PER_LONG - (start % BITS_PER_LONG);
 	unsigned long mask_to_set = BITMAP_FIRST_WORD_MASK(start);
 
 	while (len - bits_to_set >= 0) {
@@ -220,11 +222,11 @@ void __bitmap_set(unsigned long *map, unsigned int start, int len)
 	}
 }
 
-void __bitmap_clear(unsigned long *map, unsigned int start, int len)
+void __bitmap_clear(unsigned long *bitmap, unsigned int start, unsigned int len)
 {
-	unsigned long *p = map + BIT_WORD(start);
+	unsigned long *p = bitmap + BIT_WORD(start);
 	const unsigned int size = start + len;
-	int bits_to_clear = BITS_PER_LONG - (start % BITS_PER_LONG);
+	unsigned int bits_to_clear = BITS_PER_LONG - (start % BITS_PER_LONG);
 	unsigned long mask_to_clear = BITMAP_FIRST_WORD_MASK(start);
 
 	while (len - bits_to_clear >= 0) {
@@ -255,11 +257,11 @@ void __bitmap_clear(unsigned long *map, unsigned int start, int len)
  *
  * Returns either beginning of region or negative error
  */
-int bitmap_find_free_region(unsigned long *bitmap, int bits, int order)
+int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits, unsigned int order)
 {
 	unsigned long mask;
-	int pages = 1 << order;
-	int i;
+	unsigned int pages = 1 << order;
+	unsigned int i;
 
 	if(pages > BITS_PER_LONG)
 		return -EINVAL;
@@ -270,8 +272,9 @@ int bitmap_find_free_region(unsigned long *bitmap, int bits, int order)
 
 	/* run up the bitmap pages bits at a time */
 	for (i = 0; i < bits; i += pages) {
-		int index = i/BITS_PER_LONG;
-		int offset = i - (index * BITS_PER_LONG);
+		unsigned int index = i / BITS_PER_LONG;
+		unsigned int offset = i - (index * BITS_PER_LONG);
+
 		if((bitmap[index] & (mask << offset)) == 0) {
 			/* set region in bimap */
 			bitmap[index] |= (mask << offset);
@@ -291,23 +294,26 @@ EXPORT_SYMBOL(bitmap_find_free_region);
  * This is the complement to __bitmap_find_free_region and releases
  * the found region (by clearing it in the bitmap).
  */
-void bitmap_release_region(unsigned long *bitmap, int pos, int order)
+void bitmap_release_region(unsigned long *bitmap, unsigned int pos,
+			   unsigned int order)
 {
-	int pages = 1 << order;
+	unsigned int pages = 1 << order;
 	unsigned long mask = (1ul << (pages - 1));
-	int index = pos/BITS_PER_LONG;
-	int offset = pos - (index * BITS_PER_LONG);
+	unsigned int index = pos / BITS_PER_LONG;
+	unsigned int offset = pos - (index * BITS_PER_LONG);
+
 	mask += mask - 1;
 	bitmap[index] &= ~(mask << offset);
 }
 EXPORT_SYMBOL(bitmap_release_region);
 
-int bitmap_allocate_region(unsigned long *bitmap, int pos, int order)
+int bitmap_allocate_region(unsigned long *bitmap, unsigned int pos,
+			   unsigned int order)
 {
-	int pages = 1 << order;
+	unsigned int pages = 1 << order;
 	unsigned long mask = (1ul << (pages - 1));
-	int index = pos/BITS_PER_LONG;
-	int offset = pos - (index * BITS_PER_LONG);
+	unsigned int index = pos/BITS_PER_LONG;
+	unsigned int offset = pos - (index * BITS_PER_LONG);
 
 	/* We don't do regions of pages > BITS_PER_LONG.  The
 	 * algorithm would be a simple look for multiple zeros in the
@@ -328,7 +334,7 @@ static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
 				unsigned int nbits)
 {
 	unsigned long l;
-	int i, j, b;
+	unsigned int i, j, b;
 
 	for (i = 0, b = 0; nbits > 0; i++, b += sizeof(l)) {
 		l = lp[i];
@@ -345,7 +351,7 @@ static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
 				unsigned int nbits)
 {
 	unsigned long l;
-	int i, j, b;
+	unsigned int i, j, b;
 
 	for (i = 0, b = 0; nbits > 0; i++, b += sizeof(l)) {
 		l = 0;
diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index b9f980e91930..4e71b4350f59 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -85,12 +85,15 @@ int __bitmap_intersects(const unsigned long *bitmap1,
 int __bitmap_subset(const unsigned long *bitmap1,
                     const unsigned long *bitmap2, unsigned int bits);
 unsigned int __bitmap_weight(const unsigned long *bitmap, unsigned int bits);
-extern void __bitmap_set(unsigned long *map, unsigned int start, int len);
-extern void __bitmap_clear(unsigned long *map, unsigned int start, int len);
-
-extern int bitmap_find_free_region(unsigned long *bitmap, int bits, int order);
-extern void bitmap_release_region(unsigned long *bitmap, int pos, int order);
-extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);
+void __bitmap_set(unsigned long *bitmap, unsigned int start, unsigned int len);
+void __bitmap_clear(unsigned long *bitmap, unsigned int start, unsigned int len);
+
+int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits,
+                            unsigned int order);
+void bitmap_release_region(unsigned long *bitmap, unsigned int pos,
+                           unsigned int order);
+int bitmap_allocate_region(unsigned long *bitmap, unsigned int pos,
+                           unsigned int order);
 
 #define BITMAP_LAST_WORD_MASK(nbits)					\
 (									\
-- 
2.30.2


