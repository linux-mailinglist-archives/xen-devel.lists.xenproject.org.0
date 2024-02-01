Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5806F845578
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 11:35:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674271.1049111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVUO9-0006N6-Us; Thu, 01 Feb 2024 10:33:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674271.1049111; Thu, 01 Feb 2024 10:33:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVUO9-0006KZ-Rn; Thu, 01 Feb 2024 10:33:45 +0000
Received: by outflank-mailman (input) for mailman id 674271;
 Thu, 01 Feb 2024 10:33:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i6jM=JK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rVUO8-0006KQ-B6
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 10:33:44 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f1cbb73-c0ed-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 11:33:43 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e80046264so6792725e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 02:33:43 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c4eca00b0040fbba734f3sm1395865wmq.34.2024.02.01.02.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 02:33:41 -0800 (PST)
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
X-Inumbo-ID: 5f1cbb73-c0ed-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706783622; x=1707388422; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D8J71cORIIJRoqYhXR8/qnQiyP/PfOcpk4LGA73fgB0=;
        b=ehCcxnN5SUNiax9nWYsD+sK7dGawQ90387sRVjM8UlSA7wS3hUAHsa/Mk+LZ3W/Gkx
         FjwtV7eD5grH7eB+UTyayD1jW+P9IZzWpYqTjCjNqcTGqaglXG5ePiQdhKX22mM6Y7pO
         DMSrpuNPo6xN5Y8kAembfTXKWNaCdtNDeL0Lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706783622; x=1707388422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8J71cORIIJRoqYhXR8/qnQiyP/PfOcpk4LGA73fgB0=;
        b=Bk9gI8tO1ePfj0P8mmgwxFq/aQaGad6ZOlCkWaYRPoItMZXWuFAFxsQObk+TOEGzum
         FPxgHibMhWf00+Srm1y4gI4Jpm13ex5uMsf87ZPa+/py7BhB0r50Xe/8D5X/TkJbkz5k
         d5JVUD/VySBgvvoufxSKOU3e6uAne0l+qfcJKksjZnFMUg98JR/fOci07uXPfZe5HRxX
         BtJi3CZqjv81UsHDSPK72iGBlZdm6IHjFEwK6AvWhyEcZTramtyPURRTxU98Oyqy1R0l
         X3ZuYfaCnLUoSA0bRIEHPI/g47aMS9syi5pf2Q75Hoe2I/k7uCs879/08MTa9mqjcpKb
         l4mg==
X-Gm-Message-State: AOJu0Yx2PdB7byHM4PH+jcZ7cvC2xKgzHNn8sYZr4WBYLTTrNs+KeJuL
	MHEYhS0b01GRN8o0IISH363FG0/lnPNES2+fAOPe1otkp07j6tcsicm4T4kYdOwir3/M9v856QN
	w
X-Google-Smtp-Source: AGHT+IHFb00cp37ppIbJJKHh4MJRADrSYXz3jmxNOyaAIEpn5stWts3uRs9zYdfitFoGEmO37ivjlQ==
X-Received: by 2002:a05:600c:3d88:b0:40f:b8e7:ad51 with SMTP id bi8-20020a05600c3d8800b0040fb8e7ad51mr1510749wmb.31.1706783622063;
        Thu, 01 Feb 2024 02:33:42 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUBY5YRDQ0F/TzC+6OmFx9c5nokmfEOljkdq0czD5PZFyC5kwbob7tsFyYLMm35OZxSGhC8oiE4dScslf5XPYuCsev3lyimueyppHDkKLIki6MDFxZ8paolBaKusCj9sHbFiKd0zoNYtZINe4w8cYmW27AW3i3pCB6OD7bqnLJj+xd/et6WxsfwnjQx+QjnIA==
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] xen/bitmap: Consistently use unsigned bits values
Date: Thu,  1 Feb 2024 10:33:39 +0000
Message-Id: <20240201103339.549307-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Right now, most of the static inline helpers take an unsigned nbits quantity,
and most of the library functions take a signed quanity.  Because
BITMAP_LAST_WORD_MASK() is expressed as a divide, the compiler is forced to
emit two different paths to get the correct semantics for signed division.

Swap all signed bit-counts to being unsigned bit-counts for the simple cases.
This includes the return value of bitmap_weight().

Bloat-o-meter for a random x86 build reports:
  add/remove: 0/0 grow/shrink: 8/19 up/down: 167/-413 (-246)

which all comes from compiler not emitting "dead" logic paths for negative bit
counts.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>

Found when investigating negative-shift UBSAN, because each of the library
functions ended up being instrumented.

There is much more wanting cleaning up here, but we have to start somewhere.
Some observations:

 * Various of the boolean-like return values have -1 for zero-length bitmaps.
   I can't spot any callers which care, so this seems like a waste.
 * bitmap_zero() and similar clear predate us switching to use
   __builtin_memset(), because there's no need for bitmap_switch().
 * Should we consolidate 'bits' vs 'nbits'?
 * The internals of these helpers want converting too.  Other helpers need
   more than just a parameter conversion.
---
 xen/common/bitmap.c      | 24 +++++++++++-----------
 xen/include/xen/bitmap.h | 43 ++++++++++++++++++++--------------------
 2 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index 7d4551f78283..c57b35f0042c 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -55,7 +55,7 @@ static void clamp_last_byte(uint8_t *bp, unsigned int nbits)
 		bp[nbits/8] &= (1U << remainder) - 1;
 }
 
-int __bitmap_empty(const unsigned long *bitmap, int bits)
+int __bitmap_empty(const unsigned long *bitmap, unsigned int bits)
 {
 	int k, lim = bits/BITS_PER_LONG;
 	for (k = 0; k < lim; ++k)
@@ -70,7 +70,7 @@ int __bitmap_empty(const unsigned long *bitmap, int bits)
 }
 EXPORT_SYMBOL(__bitmap_empty);
 
-int __bitmap_full(const unsigned long *bitmap, int bits)
+int __bitmap_full(const unsigned long *bitmap, unsigned int bits)
 {
 	int k, lim = bits/BITS_PER_LONG;
 	for (k = 0; k < lim; ++k)
@@ -86,7 +86,7 @@ int __bitmap_full(const unsigned long *bitmap, int bits)
 EXPORT_SYMBOL(__bitmap_full);
 
 int __bitmap_equal(const unsigned long *bitmap1,
-		const unsigned long *bitmap2, int bits)
+                   const unsigned long *bitmap2, unsigned int bits)
 {
 	int k, lim = bits/BITS_PER_LONG;
 	for (k = 0; k < lim; ++k)
@@ -101,7 +101,7 @@ int __bitmap_equal(const unsigned long *bitmap1,
 }
 EXPORT_SYMBOL(__bitmap_equal);
 
-void __bitmap_complement(unsigned long *dst, const unsigned long *src, int bits)
+void __bitmap_complement(unsigned long *dst, const unsigned long *src, unsigned int bits)
 {
 	int k, lim = bits/BITS_PER_LONG;
 	for (k = 0; k < lim; ++k)
@@ -113,7 +113,7 @@ void __bitmap_complement(unsigned long *dst, const unsigned long *src, int bits)
 EXPORT_SYMBOL(__bitmap_complement);
 
 void __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
-				const unsigned long *bitmap2, int bits)
+                  const unsigned long *bitmap2, unsigned int bits)
 {
 	int k;
 	int nr = BITS_TO_LONGS(bits);
@@ -124,7 +124,7 @@ void __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
 EXPORT_SYMBOL(__bitmap_and);
 
 void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
-				const unsigned long *bitmap2, int bits)
+                 const unsigned long *bitmap2, unsigned int bits)
 {
 	int k;
 	int nr = BITS_TO_LONGS(bits);
@@ -135,7 +135,7 @@ void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
 EXPORT_SYMBOL(__bitmap_or);
 
 void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
-				const unsigned long *bitmap2, int bits)
+                  const unsigned long *bitmap2, unsigned int bits)
 {
 	int k;
 	int nr = BITS_TO_LONGS(bits);
@@ -146,7 +146,7 @@ void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
 EXPORT_SYMBOL(__bitmap_xor);
 
 void __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
-				const unsigned long *bitmap2, int bits)
+                     const unsigned long *bitmap2, unsigned int bits)
 {
 	int k;
 	int nr = BITS_TO_LONGS(bits);
@@ -157,7 +157,7 @@ void __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
 EXPORT_SYMBOL(__bitmap_andnot);
 
 int __bitmap_intersects(const unsigned long *bitmap1,
-				const unsigned long *bitmap2, int bits)
+                        const unsigned long *bitmap2, unsigned int bits)
 {
 	int k, lim = bits/BITS_PER_LONG;
 	for (k = 0; k < lim; ++k)
@@ -172,7 +172,7 @@ int __bitmap_intersects(const unsigned long *bitmap1,
 EXPORT_SYMBOL(__bitmap_intersects);
 
 int __bitmap_subset(const unsigned long *bitmap1,
-				const unsigned long *bitmap2, int bits)
+                    const unsigned long *bitmap2, unsigned int bits)
 {
 	int k, lim = bits/BITS_PER_LONG;
 	for (k = 0; k < lim; ++k)
@@ -187,7 +187,7 @@ int __bitmap_subset(const unsigned long *bitmap1,
 EXPORT_SYMBOL(__bitmap_subset);
 
 #if BITS_PER_LONG == 32
-int __bitmap_weight(const unsigned long *bitmap, int bits)
+unsigned int __bitmap_weight(const unsigned long *bitmap, unsigned int bits)
 {
 	int k, w = 0, lim = bits/BITS_PER_LONG;
 
@@ -200,7 +200,7 @@ int __bitmap_weight(const unsigned long *bitmap, int bits)
 	return w;
 }
 #else
-int __bitmap_weight(const unsigned long *bitmap, int bits)
+unsigned int __bitmap_weight(const unsigned long *bitmap, unsigned int bits)
 {
 	int k, w = 0, lim = bits/BITS_PER_LONG;
 
diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index 657390e32ebc..b9f980e91930 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -66,25 +66,25 @@
  * lib/bitmap.c provides these functions:
  */
 
-extern int __bitmap_empty(const unsigned long *bitmap, int bits);
-extern int __bitmap_full(const unsigned long *bitmap, int bits);
-extern int __bitmap_equal(const unsigned long *bitmap1,
-                	const unsigned long *bitmap2, int bits);
-extern void __bitmap_complement(unsigned long *dst, const unsigned long *src,
-			int bits);
-extern void __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
-			const unsigned long *bitmap2, int bits);
-extern void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
-			const unsigned long *bitmap2, int bits);
-extern void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
-			const unsigned long *bitmap2, int bits);
-extern void __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
-			const unsigned long *bitmap2, int bits);
-extern int __bitmap_intersects(const unsigned long *bitmap1,
-			const unsigned long *bitmap2, int bits);
-extern int __bitmap_subset(const unsigned long *bitmap1,
-			const unsigned long *bitmap2, int bits);
-extern int __bitmap_weight(const unsigned long *bitmap, int bits);
+int __bitmap_empty(const unsigned long *bitmap, unsigned int bits);
+int __bitmap_full(const unsigned long *bitmap, unsigned int bits);
+int __bitmap_equal(const unsigned long *bitmap1,
+                   const unsigned long *bitmap2, unsigned int bits);
+void __bitmap_complement(unsigned long *dst, const unsigned long *src,
+                         unsigned int bits);
+void __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
+                  const unsigned long *bitmap2, unsigned int bits);
+void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
+                 const unsigned long *bitmap2, unsigned int bits);
+void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
+                  const unsigned long *bitmap2, unsigned int bits);
+void __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
+                     const unsigned long *bitmap2, unsigned int bits);
+int __bitmap_intersects(const unsigned long *bitmap1,
+                        const unsigned long *bitmap2, unsigned int bits);
+int __bitmap_subset(const unsigned long *bitmap1,
+                    const unsigned long *bitmap2, unsigned int bits);
+unsigned int __bitmap_weight(const unsigned long *bitmap, unsigned int bits);
 extern void __bitmap_set(unsigned long *map, unsigned int start, int len);
 extern void __bitmap_clear(unsigned long *map, unsigned int start, int len);
 
@@ -117,7 +117,7 @@ static inline void bitmap_zero(unsigned long *dst, unsigned int nbits)
 		memset(dst, 0, bitmap_bytes(nbits)));
 }
 
-static inline void bitmap_fill(unsigned long *dst, int nbits)
+static inline void bitmap_fill(unsigned long *dst, unsigned int nbits)
 {
 	size_t nlongs = BITS_TO_LONGS(nbits);
 
@@ -224,7 +224,8 @@ static inline int bitmap_full(const unsigned long *src, unsigned int nbits)
 		return __bitmap_full(src, nbits));
 }
 
-static inline int bitmap_weight(const unsigned long *src, int nbits)
+static inline unsigned int bitmap_weight(const unsigned long *src,
+                                         unsigned int nbits)
 {
 	return __bitmap_weight(src, nbits);
 }
-- 
2.30.2


