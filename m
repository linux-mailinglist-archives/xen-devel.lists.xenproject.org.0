Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6CE8C79AA
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 17:48:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723473.1128342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dL5-0008IA-8F; Thu, 16 May 2024 15:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723473.1128342; Thu, 16 May 2024 15:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dL5-0008GG-5Q; Thu, 16 May 2024 15:48:15 +0000
Received: by outflank-mailman (input) for mailman id 723473;
 Thu, 16 May 2024 15:48:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DxoZ=MT=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s7dL3-0008G5-6y
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 15:48:13 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b29c2323-139b-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 17:48:11 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-51f99f9e0faso1127787e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 08:48:11 -0700 (PDT)
Received: from gmail.com ([213.0.35.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4201916e7c6sm134563085e9.12.2024.05.16.08.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 08:48:08 -0700 (PDT)
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
X-Inumbo-ID: b29c2323-139b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715874490; x=1716479290; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKmmum6z28VcY8ouSg3YJA3bHZvP87XkBXtO/hd8PR8=;
        b=bj5mbrg4u13toU1ZMHMQUOYAMIi/iXYNkmjkQDeQwMW0bc6bpM6WA1uzq+iagJcJu3
         f1IJMawXAD5LDbxU2idU6XWYrBu8K7Urh+QEHt87Qi22ZMBaxq6vj0d8RlU3ANCurJ6a
         DNenn++Y8PWkaVBD0TF4ujhv9Nc+WtAax9fIkkjNbL4yjrp3zHzdg/ullslwr+CoL3Ze
         HhNF4DD6834YMZfitg4Ld/BlrB1hb6g1np9T7hIka9I0SKjLfe38WWX8YePEnYGZirjb
         +rMg0qTwkpoJCFXgoOh/GXROBb79rrxD2DKUruw7GmKxNiKelFa2eIECY+lBW6DENXyA
         8suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715874490; x=1716479290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKmmum6z28VcY8ouSg3YJA3bHZvP87XkBXtO/hd8PR8=;
        b=GO87EKIyebVt1vb8/8PcrrrxttAdwFlGeMY6VQh10XPckExG8Wr4bTn3LfHSLdzJor
         A/aA5f84JIgJYdmpKqopBarjlVVqd0P6zYjk2SclifSVkF2tBvP1xUuy4yHWEi+B0XJd
         /sfpV4ZHwJ75F/C0zj6zgyccEnXdbWcME4qAWoFf4gh2uf7Y+HYZVMdOFUI4YyPgqugm
         RV23FzY9cUCfgdnlvMoqn9TDJ4Y4JESg6UDwtShd6m5LNgiM26XDxuTiXODgVSSk+oMk
         aGETJf2P4rz492AtQkFf2TrBpijS23q2hQ+R395a4+IzldGnVByX4jr+xEGtZiQyK0RT
         5E7w==
X-Forwarded-Encrypted: i=1; AJvYcCVaf3jWqQ/4MUv1qnzsfvVLj8ry2jeHRGDFyZIECLZuRebIRloBn14bCqsivm+weWbt1/q8+Frnty/7hVpYgz4mnbSaONbzpqt0v9E18zg=
X-Gm-Message-State: AOJu0Yz33OB/AF+cdtvFV2HhGyKdc6ejQVBKDuK7Z0lufKPzMNdVvHVF
	oqSUaJh/8KScU/Q2S5yRNDYGsCLdU+LKGD6ylf+9WsW4ZLMyYH/O
X-Google-Smtp-Source: AGHT+IHDyhM75rM+/tSd8KHYsc2vk/F/hAtrKLe2KyivanA+rMbH+7GZB6FdXDOstgD6teeWWR65AQ==
X-Received: by 2002:a05:6512:b15:b0:51a:ca75:9ffe with SMTP id 2adb3069b0e04-5221057b50bmr17367040e87.42.1715874490119;
        Thu, 16 May 2024 08:48:10 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v6 1/8] xen: mapcache: Make MCACHE_BUCKET_SHIFT runtime configurable
Date: Thu, 16 May 2024 17:47:57 +0200
Message-Id: <20240516154804.1114245-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240516154804.1114245-1-edgar.iglesias@gmail.com>
References: <20240516154804.1114245-1-edgar.iglesias@gmail.com>
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


