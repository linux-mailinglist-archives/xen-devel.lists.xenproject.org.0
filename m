Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 891E08D38B8
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:08:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731990.1137771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJxz-0004HY-2h; Wed, 29 May 2024 14:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731990.1137771; Wed, 29 May 2024 14:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJxy-0004Fs-VU; Wed, 29 May 2024 14:07:46 +0000
Received: by outflank-mailman (input) for mailman id 731990;
 Wed, 29 May 2024 14:07:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9nLQ=NA=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sCJxx-0004Fc-BY
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:07:45 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d13072ec-1dc4-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 16:07:43 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52aea6067c8so855752e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:07:43 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52970c3327esm1261419e87.196.2024.05.29.07.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:07:42 -0700 (PDT)
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
X-Inumbo-ID: d13072ec-1dc4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716991663; x=1717596463; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKmmum6z28VcY8ouSg3YJA3bHZvP87XkBXtO/hd8PR8=;
        b=XX98xi2OKo1rMxHP05l7Ai2sBmm2UHSJYclhGJTbPY6hemQcqpyC8gJ1ERp5o/PSAt
         tEPwxxcgUxzAO6iklFeg6zMb+tinc/T1CmAIfuL2tP1DlBayxR3HKgjPTwK5gjdwkWhY
         raHVbt7P8jJ9trw4DLwEt1P8g0BxlKUvbujbes/LDaIDPu6I9/NMLmFYxaYzcNdB2Ldm
         kvkfXETtSIARjRNGf/NqZ/97Utjhya12PTOVY2dN8Y6XvB+7nrv1z9dIBx81hSSgkK+S
         yrxgRydCpUTQKUgtI86nBZFT2/qITe1LqguQzbuCxyIwh8SWdz2lHnf+xWQ/Bf7p+yBj
         5TUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716991663; x=1717596463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKmmum6z28VcY8ouSg3YJA3bHZvP87XkBXtO/hd8PR8=;
        b=U+fAI+Riu3y+qdXSeL7gDt3hPMpOPwoQ4xS1Yew5UsGWvqUsuYXPEhrzVwfhGD/UL9
         wB2em/Fl/qEBv8AJVWjY4JxogOVN3kX79FZNZX7xuZOF3IAcNtPGQFfuceRcwCo2LOTR
         gCF07Pxa2CQaBQW74jVNxtB1cUjtWHXLEimf0VLMNdckSJPFMjoxd52WnUttWQK54F36
         dCYnKlcZC8sb9Oo8EgQmdQXj+yoVKbxBwusQE8E5blT5hzfy8SgRzyrKfsl79HUtePnj
         TO/Ev5uVqMLeIK+UrsIdio/EE6YuX7P1aOi7Zrzn6vzAScvbELEdrMDKevbT19YugyFi
         eftA==
X-Forwarded-Encrypted: i=1; AJvYcCVJR3HQ8fLNZH6ZQnLxuxES0/b+L8fIX3ZXtoHd9Sx7Hplflj+Es2ACKVVIDEPw9lNPWg6gsBTorteLHiwIfynWXD/xMBuO2ZgZVQzkdEU=
X-Gm-Message-State: AOJu0YyaTlI6Jd5R0gwtX1wOtjRHcfNouhLYANgo6PDIUoX2bInS0L+4
	OByRnvNwXQL6XHNCbJYBdf9AkdQrf/zudAG7B3UuRqGAmOY5UmbZ
X-Google-Smtp-Source: AGHT+IG9X1hyyW5bWOM2Lb/ezgqDrIcsxWZZ6e+vRIDT8WUGaZyhyargSGMsndYosYqEtRb+Y+5fOQ==
X-Received: by 2002:a05:6512:398b:b0:529:a2d8:3009 with SMTP id 2adb3069b0e04-529a2d830e5mr11094033e87.43.1716991662399;
        Wed, 29 May 2024 07:07:42 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v8 1/8] xen: mapcache: Make MCACHE_BUCKET_SHIFT runtime configurable
Date: Wed, 29 May 2024 16:07:32 +0200
Message-Id: <20240529140739.1387692-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240529140739.1387692-1-edgar.iglesias@gmail.com>
References: <20240529140739.1387692-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Make MCACHE_BUCKET_SHIFT runtime configurable per cache instance.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/xen/xen-mapcache.c | 54 ++++++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index fa6813b1ad..bc860f4373 100644
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
@@ -95,11 +93,14 @@ static inline int test_bits(int nr, int size, const unsigned long *addr)
 
 static MapCache *xen_map_cache_init_single(phys_offset_to_gaddr_t f,
                                            void *opaque,
+                                           unsigned int bucket_shift,
                                            unsigned long max_size)
 {
     unsigned long size;
     MapCache *mc;
 
+    assert(bucket_shift >= XC_PAGE_SHIFT);
+
     mc = g_new0(MapCache, 1);
 
     mc->phys_offset_to_gaddr = f;
@@ -108,12 +109,14 @@ static MapCache *xen_map_cache_init_single(phys_offset_to_gaddr_t f,
 
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
@@ -126,6 +129,13 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
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
@@ -146,7 +156,9 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
         }
     }
 
-    mapcache = xen_map_cache_init_single(f, opaque, max_mcache_size);
+    mapcache = xen_map_cache_init_single(f, opaque,
+                                         bucket_shift,
+                                         max_mcache_size);
     setrlimit(RLIMIT_AS, &rlimit_as);
 }
 
@@ -195,7 +207,7 @@ static void xen_remap_bucket(MapCache *mc,
     entry->valid_mapping = NULL;
 
     for (i = 0; i < nb_pfn; i++) {
-        pfns[i] = (address_index << (MCACHE_BUCKET_SHIFT-XC_PAGE_SHIFT)) + i;
+        pfns[i] = (address_index << (mc->bucket_shift - XC_PAGE_SHIFT)) + i;
     }
 
     /*
@@ -266,8 +278,8 @@ static uint8_t *xen_map_cache_unlocked(MapCache *mc,
     bool dummy = false;
 
 tryagain:
-    address_index  = phys_addr >> MCACHE_BUCKET_SHIFT;
-    address_offset = phys_addr & (MCACHE_BUCKET_SIZE - 1);
+    address_index  = phys_addr >> mc->bucket_shift;
+    address_offset = phys_addr & (mc->bucket_size - 1);
 
     trace_xen_map_cache(phys_addr);
 
@@ -294,14 +306,14 @@ tryagain:
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
@@ -422,7 +434,7 @@ static ram_addr_t xen_ram_addr_from_mapcache_single(MapCache *mc, void *ptr)
         trace_xen_ram_addr_from_mapcache_not_in_cache(ptr);
         raddr = RAM_ADDR_INVALID;
     } else {
-        raddr = (reventry->paddr_index << MCACHE_BUCKET_SHIFT) +
+        raddr = (reventry->paddr_index << mc->bucket_shift) +
              ((unsigned long) ptr - (unsigned long) entry->vaddr_base);
     }
     mapcache_unlock(mc);
@@ -585,8 +597,8 @@ static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
     hwaddr address_index, address_offset;
     hwaddr test_bit_size, cache_size = size;
 
-    address_index  = old_phys_addr >> MCACHE_BUCKET_SHIFT;
-    address_offset = old_phys_addr & (MCACHE_BUCKET_SIZE - 1);
+    address_index  = old_phys_addr >> mc->bucket_shift;
+    address_offset = old_phys_addr & (mc->bucket_size - 1);
 
     assert(size);
     /* test_bit_size is always a multiple of XC_PAGE_SIZE */
@@ -595,8 +607,8 @@ static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
         test_bit_size += XC_PAGE_SIZE - (test_bit_size % XC_PAGE_SIZE);
     }
     cache_size = size + address_offset;
-    if (cache_size % MCACHE_BUCKET_SIZE) {
-        cache_size += MCACHE_BUCKET_SIZE - (cache_size % MCACHE_BUCKET_SIZE);
+    if (cache_size % mc->bucket_size) {
+        cache_size += mc->bucket_size - (cache_size % mc->bucket_size);
     }
 
     entry = &mc->entry[address_index % mc->nr_buckets];
@@ -609,8 +621,8 @@ static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
         return NULL;
     }
 
-    address_index  = new_phys_addr >> MCACHE_BUCKET_SHIFT;
-    address_offset = new_phys_addr & (MCACHE_BUCKET_SIZE - 1);
+    address_index  = new_phys_addr >> mc->bucket_shift;
+    address_offset = new_phys_addr & (mc->bucket_size - 1);
 
     trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phys_addr);
 
-- 
2.40.1


