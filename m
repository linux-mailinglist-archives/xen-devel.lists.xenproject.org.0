Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0453C8C1412
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 19:30:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719347.1122119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s57af-0000eR-Vf; Thu, 09 May 2024 17:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719347.1122119; Thu, 09 May 2024 17:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s57af-0000bm-Rj; Thu, 09 May 2024 17:29:57 +0000
Received: by outflank-mailman (input) for mailman id 719347;
 Thu, 09 May 2024 17:29:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QLvV=MM=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s57af-0008Hw-66
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 17:29:57 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0f9c272-0e29-11ef-909c-e314d9c70b13;
 Thu, 09 May 2024 19:29:56 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-51f17ac14daso1451647e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 10:29:56 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f39d2cb0sm364149e87.276.2024.05.09.10.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 10:29:54 -0700 (PDT)
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
X-Inumbo-ID: c0f9c272-0e29-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715275796; x=1715880596; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPCYivsqUnFKto+ateYrmLlKD4VaCAkHPo9leQ/G7oM=;
        b=cdxGtIkoQ2NtQdDstJoE1QMd6RABv6PUMUNpPzqgkafNHpYnkHWPndoFdUG+8RZgUb
         FPh1O0VyQMF31JHf1lAekHquOxoiRdYpdNebtq1YcdNxNWaoIUSJ8QxVOIw+UCJxX1GL
         zUC/Krxo8ASngS/wOFDLk+1Vf/OFR0R1blPebHCPCTB5Yqsr3wEWqO9xu2GBbB4rZDSQ
         4yjitCxpo1wXDjk9rkkMc4yKA2Po2+Ezv1qJSxvIHgXWwtSaO5jPcUrRED0hQDOZi6GD
         dt5zxmVpjckQxKAeznh6cmfenlRiY/4UBNXbi+mdehGpxUhLrh+q9JRxneWaezjpwhRo
         4H1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715275796; x=1715880596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPCYivsqUnFKto+ateYrmLlKD4VaCAkHPo9leQ/G7oM=;
        b=jimZS/YeLK1nKdORtedOOKqSOnxIq7M2oFrd6OeDW5cHnKBIYDCv45KXM7HxS1uWdW
         r4/Gzughpl0H9quEUWZrIAMQeqqjf8Px9KWLBc24Cjy8bA3uuuBOdNWyTSVR9wjlmxr+
         lGRsZvVJAdZfAtyBVhYSYfdaRD9gtJ8U7aA+SzQ1BZY6bCb83zEFxwhuMvqwigNxk/y2
         Qqbm5MlYH0zyQmfxDrTEsAhu5CTfa8/q3+YuOrD67M5o/T1Hv+QEVfZ5woUQ2KFirzaK
         xQdyRWpTu4mpXZqgv4ERsyZZWa5iv/0m537bjJr1ZtxF6GPCDhT55nbN0S23igz0aFJj
         oXFw==
X-Forwarded-Encrypted: i=1; AJvYcCX5FfBL6c2Sd0T9V9J8KxPNp7+dWrt//o3qMM59lSZEC2oQI1eWK8rJlxv9KoR6IxxoduplMFny15K7hdvUKc18S6k1e++lzttb5WeTs6Y=
X-Gm-Message-State: AOJu0YzcHwJJqcQU++seGNKTeBJBMqdQ6BehbZInhkwO5Q0Lp3gMWnD3
	P3iEUmbKgYxveHOxnQ2Z4JkLJ5I2Ug9hlYWpZLs/7k3Q9kQGSkrb
X-Google-Smtp-Source: AGHT+IGXpW00WomSWOz6NY89WyIw3oecHI+P6P9NdIdqTkVjlwXFHCkPAdJcU5KxXWJWBW7z9vO7OA==
X-Received: by 2002:a19:700b:0:b0:521:44ce:2999 with SMTP id 2adb3069b0e04-52210074a29mr116899e87.47.1715275795997;
        Thu, 09 May 2024 10:29:55 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v5 6/8] xen: mapcache: Pass the ram_addr offset to xen_map_cache()
Date: Fri,  3 May 2024 03:44:47 +0200
Message-Id: <20240503014449.1046238-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503014449.1046238-1-edgar.iglesias@gmail.com>
References: <20240503014449.1046238-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Pass the ram_addr offset to xen_map_cache.
This is in preparation for adding grant mappings that need
to compute the address within the RAMBlock.

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c         | 16 +++++++++++-----
 include/sysemu/xen-mapcache.h |  2 ++
 system/physmem.c              |  9 +++++----
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index ec95445696..26bc38a9e3 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -167,7 +167,8 @@ static void xen_remap_bucket(MapCache *mc,
                              void *vaddr,
                              hwaddr size,
                              hwaddr address_index,
-                             bool dummy)
+                             bool dummy,
+                             ram_addr_t ram_offset)
 {
     uint8_t *vaddr_base;
     xen_pfn_t *pfns;
@@ -266,6 +267,7 @@ static void xen_remap_bucket(MapCache *mc,
 
 static uint8_t *xen_map_cache_unlocked(MapCache *mc,
                                        hwaddr phys_addr, hwaddr size,
+                                       ram_addr_t ram_offset,
                                        uint8_t lock, bool dma, bool is_write)
 {
     MapCacheEntry *entry, *pentry = NULL,
@@ -337,14 +339,16 @@ tryagain:
     if (!entry) {
         entry = g_new0(MapCacheEntry, 1);
         pentry->next = entry;
-        xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy);
+        xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy,
+                         ram_offset);
     } else if (!entry->lock) {
         if (!entry->vaddr_base || entry->paddr_index != address_index ||
                 entry->size != cache_size ||
                 !test_bits(address_offset >> XC_PAGE_SHIFT,
                     test_bit_size >> XC_PAGE_SHIFT,
                     entry->valid_mapping)) {
-            xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy);
+            xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy,
+                             ram_offset);
         }
     }
 
@@ -391,13 +395,15 @@ tryagain:
 
 uint8_t *xen_map_cache(MemoryRegion *mr,
                        hwaddr phys_addr, hwaddr size,
+                       ram_addr_t ram_addr_offset,
                        uint8_t lock, bool dma,
                        bool is_write)
 {
     uint8_t *p;
 
     mapcache_lock(mapcache);
-    p = xen_map_cache_unlocked(mapcache, phys_addr, size, lock, dma, is_write);
+    p = xen_map_cache_unlocked(mapcache, phys_addr, size, ram_addr_offset,
+                               lock, dma, is_write);
     mapcache_unlock(mapcache);
     return p;
 }
@@ -632,7 +638,7 @@ static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
     trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phys_addr);
 
     xen_remap_bucket(mc, entry, entry->vaddr_base,
-                     cache_size, address_index, false);
+                     cache_size, address_index, false, new_phys_addr);
     if (!test_bits(address_offset >> XC_PAGE_SHIFT,
                 test_bit_size >> XC_PAGE_SHIFT,
                 entry->valid_mapping)) {
diff --git a/include/sysemu/xen-mapcache.h b/include/sysemu/xen-mapcache.h
index 1ec9e66752..b5e3ea1bc0 100644
--- a/include/sysemu/xen-mapcache.h
+++ b/include/sysemu/xen-mapcache.h
@@ -19,6 +19,7 @@ typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
 void xen_map_cache_init(phys_offset_to_gaddr_t f,
                         void *opaque);
 uint8_t *xen_map_cache(MemoryRegion *mr, hwaddr phys_addr, hwaddr size,
+                       ram_addr_t ram_addr_offset,
                        uint8_t lock, bool dma,
                        bool is_write);
 ram_addr_t xen_ram_addr_from_mapcache(void *ptr);
@@ -37,6 +38,7 @@ static inline void xen_map_cache_init(phys_offset_to_gaddr_t f,
 static inline uint8_t *xen_map_cache(MemoryRegion *mr,
                                      hwaddr phys_addr,
                                      hwaddr size,
+                                     ram_addr_t ram_addr_offset,
                                      uint8_t lock,
                                      bool dma,
                                      bool is_write)
diff --git a/system/physmem.c b/system/physmem.c
index b7847db1a2..33d09f7571 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -2231,13 +2231,14 @@ static void *qemu_ram_ptr_length(RAMBlock *block, ram_addr_t addr,
          */
         if (xen_mr_is_memory(block->mr)) {
             return xen_map_cache(block->mr, block->offset + addr,
-                                 len, lock, lock,
-                                 is_write);
+                                 len, block->offset,
+                                 lock, lock, is_write);
         }
 
         block->host = xen_map_cache(block->mr, block->offset,
-                                    block->max_length, 1,
-                                    lock, is_write);
+                                    block->max_length,
+                                    block->offset,
+                                    1, lock, is_write);
     }
 
     return ramblock_ptr(block, addr);
-- 
2.40.1


