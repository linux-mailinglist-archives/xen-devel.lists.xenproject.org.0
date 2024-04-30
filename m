Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 997CB8B7D99
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715059.1116572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qga-0005zg-MA; Tue, 30 Apr 2024 16:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715059.1116572; Tue, 30 Apr 2024 16:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qga-0005s4-GQ; Tue, 30 Apr 2024 16:50:32 +0000
Received: by outflank-mailman (input) for mailman id 715059;
 Tue, 30 Apr 2024 16:50:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/Z8=MD=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s1qgY-0003oO-HV
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:50:30 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c09fff96-0711-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 18:50:30 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-51abf1a9332so8147574e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:50:29 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 b1-20020ac25621000000b00518b294570asm4561021lff.135.2024.04.30.09.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:50:28 -0700 (PDT)
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
X-Inumbo-ID: c09fff96-0711-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714495829; x=1715100629; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOBKxxu7GyLSVYEkd97aCGdSreO6dnD3GZWBKg4jO3k=;
        b=C2ivup4o//cBdC0zkrZ3XXD7eLhRaWvna2M7qn+FbQbxbfkiwIdCx5b5EhYAyETeci
         L4aW9FDbx9nRL9aG7Ydwjf2Bto40nYF8sCDMotzvwPtiv3gGBC/uVlDMvB8nTP8kIZ2j
         RvHwZVO83lbmk2BJaj+P3aMKL/0PWeof8o6HMLc+jfHl16B4xYwG7D69rNoP4BDp30xk
         hvhi9MsXY0ZAuHRkxtAUZnElXJedw+L3CTZrVrXsLrmounO8i42cLrky5oDKjmBI6/rU
         /DsYd5bJ/z5kB9xANALIFcmGikKSMz/nIzav1yt6+xBF3JLzbXm2XFp5blvXGK0TrOE+
         uYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495829; x=1715100629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOBKxxu7GyLSVYEkd97aCGdSreO6dnD3GZWBKg4jO3k=;
        b=tHzMrGm19oC08Mp0nc/+2jYiPYSp1+5MrHJ5HFGt1OK0JnEGAH/eAvdTKMtWOPUKEu
         ueSsL4kQYqswtNc+nKdmeeT6oXqkI2et8CMiAjaurVRAxLSKtmoc4wPX8CIMzmUcDEfZ
         3kdqnCIJGSiQaPF6Ak8Fj7SQ/GkEAAUfo3TzT4CAjeyi3irhhWX2lESYSo04z2NWzami
         LI2EFOmLMD+9Yk/Z14jyWq5XLWdpHomTw2bs91CcMTGIzLNVq9f/L86e1M6w8VVgvrYU
         jCti8n3ZaqTb3dprQaSg9uOm07bJ7+tiEkCWOMbxAQtt+mG7Y4ESqF1LmS3rAJMZ9TXz
         zcqw==
X-Forwarded-Encrypted: i=1; AJvYcCWry9zVOoY5iJVZSjlkAfl3BkNptpESz8di2ejcIZBQizccWpTNO24IARTNyD7wnvQLJVm/UYeQPD4UOje2Q1V8h6B6FkAFGp1zt+azDNE=
X-Gm-Message-State: AOJu0Ywf53XOQhQWoNgDwk4MF9Ulk3SAfyGHs+fKluxW0XWtssg/+Gkc
	dKlgdLYmoD8XxnD1KdwHny5Hv15/CPGX8ZrYjKyEhCcBDfsiBSY4
X-Google-Smtp-Source: AGHT+IG1D0QzmbnS0ErFMJ7lJMDglr0F3Y/2LZElzamvzuLYF8jqyCZc9cG7FMYyaCBToshoVVfqkw==
X-Received: by 2002:ac2:5327:0:b0:513:1a9c:ae77 with SMTP id f7-20020ac25327000000b005131a9cae77mr26233lfh.52.1714495829133;
        Tue, 30 Apr 2024 09:50:29 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 11/17] xen: mapcache: Make MCACHE_BUCKET_SHIFT runtime configurable
Date: Tue, 30 Apr 2024 18:49:33 +0200
Message-Id: <20240430164939.925307-12-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430164939.925307-1-edgar.iglesias@gmail.com>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Make MCACHE_BUCKET_SHIFT runtime configurable per cache instance.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c | 52 ++++++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 72a7e25e3e..4f98d284dd 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -23,13 +23,10 @@
 
 
 #if HOST_LONG_BITS == 32
-#  define MCACHE_BUCKET_SHIFT 16
 #  define MCACHE_MAX_SIZE     (1UL<<31) /* 2GB Cap */
 #else
-#  define MCACHE_BUCKET_SHIFT 20
 #  define MCACHE_MAX_SIZE     (1UL<<35) /* 32GB Cap */
 #endif
-#define MCACHE_BUCKET_SIZE (1UL << MCACHE_BUCKET_SHIFT)
 
 /* This is the size of the virtual address space reserve to QEMU that will not
  * be use by MapCache.
@@ -65,7 +62,8 @@ typedef struct MapCache {
     /* For most cases (>99.9%), the page address is the same. */
     MapCacheEntry *last_entry;
     unsigned long max_mcache_size;
-    unsigned int mcache_bucket_shift;
+    unsigned int bucket_shift;
+    unsigned long bucket_size;
 
     phys_offset_to_gaddr_t phys_offset_to_gaddr;
     QemuMutex lock;
@@ -95,6 +93,7 @@ static inline int test_bits(int nr, int size, const unsigned long *addr)
 
 static MapCache *xen_map_cache_init_single(phys_offset_to_gaddr_t f,
                                            void *opaque,
+                                           unsigned int bucket_shift,
                                            unsigned long max_size)
 {
     unsigned long size;
@@ -108,12 +107,14 @@ static MapCache *xen_map_cache_init_single(phys_offset_to_gaddr_t f,
 
     QTAILQ_INIT(&mc->locked_entries);
 
+    mc->bucket_shift = bucket_shift;
+    mc->bucket_size = 1UL << bucket_shift;
     mc->max_mcache_size = max_size;
 
     mc->nr_buckets =
         (((mc->max_mcache_size >> XC_PAGE_SHIFT) +
-          (1UL << (MCACHE_BUCKET_SHIFT - XC_PAGE_SHIFT)) - 1) >>
-         (MCACHE_BUCKET_SHIFT - XC_PAGE_SHIFT));
+          (1UL << (bucket_shift - XC_PAGE_SHIFT)) - 1) >>
+         (bucket_shift - XC_PAGE_SHIFT));
 
     size = mc->nr_buckets * sizeof(MapCacheEntry);
     size = (size + XC_PAGE_SIZE - 1) & ~(XC_PAGE_SIZE - 1);
@@ -126,6 +127,13 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
 {
     struct rlimit rlimit_as;
     unsigned long max_mcache_size;
+    unsigned int bucket_shift;
+
+    if (HOST_LONG_BITS == 32) {
+        bucket_shift = 16;
+    } else {
+        bucket_shift = 20;
+    }
 
     if (geteuid() == 0) {
         rlimit_as.rlim_cur = RLIM_INFINITY;
@@ -146,7 +154,9 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
         }
     }
 
-    mapcache = xen_map_cache_init_single(f, opaque, max_mcache_size);
+    mapcache = xen_map_cache_init_single(f, opaque,
+                                         bucket_shift,
+                                         max_mcache_size);
     setrlimit(RLIMIT_AS, &rlimit_as);
 }
 
@@ -195,7 +205,7 @@ static void xen_remap_bucket(MapCache *mc,
     entry->valid_mapping = NULL;
 
     for (i = 0; i < nb_pfn; i++) {
-        pfns[i] = (address_index << (MCACHE_BUCKET_SHIFT-XC_PAGE_SHIFT)) + i;
+        pfns[i] = (address_index << (mc->bucket_shift - XC_PAGE_SHIFT)) + i;
     }
 
     /*
@@ -266,8 +276,8 @@ static uint8_t *xen_map_cache_unlocked(MapCache *mc,
     bool dummy = false;
 
 tryagain:
-    address_index  = phys_addr >> MCACHE_BUCKET_SHIFT;
-    address_offset = phys_addr & (MCACHE_BUCKET_SIZE - 1);
+    address_index  = phys_addr >> mc->bucket_shift;
+    address_offset = phys_addr & (mc->bucket_size - 1);
 
     trace_xen_map_cache(phys_addr);
 
@@ -294,14 +304,14 @@ tryagain:
         return mc->last_entry->vaddr_base + address_offset;
     }
 
-    /* size is always a multiple of MCACHE_BUCKET_SIZE */
+    /* size is always a multiple of mc->bucket_size */
     if (size) {
         cache_size = size + address_offset;
-        if (cache_size % MCACHE_BUCKET_SIZE) {
-            cache_size += MCACHE_BUCKET_SIZE - (cache_size % MCACHE_BUCKET_SIZE);
+        if (cache_size % mc->bucket_size) {
+            cache_size += mc->bucket_size - (cache_size % mc->bucket_size);
         }
     } else {
-        cache_size = MCACHE_BUCKET_SIZE;
+        cache_size = mc->bucket_size;
     }
 
     entry = &mc->entry[address_index % mc->nr_buckets];
@@ -419,7 +429,7 @@ static ram_addr_t xen_ram_addr_from_mapcache_single(MapCache *mc, void *ptr)
         trace_xen_ram_addr_from_mapcache_not_in_cache(ptr);
         raddr = RAM_ADDR_INVALID;
     } else {
-        raddr = (reventry->paddr_index << MCACHE_BUCKET_SHIFT) +
+        raddr = (reventry->paddr_index << mc->bucket_shift) +
              ((unsigned long) ptr - (unsigned long) entry->vaddr_base);
     }
     mapcache_unlock(mc);
@@ -582,8 +592,8 @@ static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
     hwaddr address_index, address_offset;
     hwaddr test_bit_size, cache_size = size;
 
-    address_index  = old_phys_addr >> MCACHE_BUCKET_SHIFT;
-    address_offset = old_phys_addr & (MCACHE_BUCKET_SIZE - 1);
+    address_index  = old_phys_addr >> mc->bucket_shift;
+    address_offset = old_phys_addr & (mc->bucket_size - 1);
 
     assert(size);
     /* test_bit_size is always a multiple of XC_PAGE_SIZE */
@@ -592,8 +602,8 @@ static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
         test_bit_size += XC_PAGE_SIZE - (test_bit_size % XC_PAGE_SIZE);
     }
     cache_size = size + address_offset;
-    if (cache_size % MCACHE_BUCKET_SIZE) {
-        cache_size += MCACHE_BUCKET_SIZE - (cache_size % MCACHE_BUCKET_SIZE);
+    if (cache_size % mc->bucket_size) {
+        cache_size += mc->bucket_size - (cache_size % mc->bucket_size);
     }
 
     entry = &mc->entry[address_index % mc->nr_buckets];
@@ -606,8 +616,8 @@ static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
         return NULL;
     }
 
-    address_index  = new_phys_addr >> MCACHE_BUCKET_SHIFT;
-    address_offset = new_phys_addr & (MCACHE_BUCKET_SIZE - 1);
+    address_index  = new_phys_addr >> mc->bucket_shift;
+    address_offset = new_phys_addr & (mc->bucket_size - 1);
 
     trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phys_addr);
 
-- 
2.40.1


