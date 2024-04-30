Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16EF8B7D9A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715061.1116598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgf-0006wh-LT; Tue, 30 Apr 2024 16:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715061.1116598; Tue, 30 Apr 2024 16:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgf-0006qR-Ch; Tue, 30 Apr 2024 16:50:37 +0000
Received: by outflank-mailman (input) for mailman id 715061;
 Tue, 30 Apr 2024 16:50:35 +0000
Received: from [94.247.172.50] (helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/Z8=MD=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s1qgd-0003oL-4A
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:50:35 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2bdc16b-0711-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 18:50:33 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51ca95db667so5702717e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:50:33 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a19380f000000b0051aaf26f4a0sm4359741lfa.101.2024.04.30.09.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:50:32 -0700 (PDT)
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
X-Inumbo-ID: c2bdc16b-0711-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714495833; x=1715100633; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DU0xtzI9Cm5N5WksUYgPVqXR4B2xCZmxh2qO529TbRk=;
        b=icEAr3fJlsY3SDSaakoAm+1KtPRerKSExKsinllkHYcrmX60zXseeGtyHOQLsP7Ejl
         aTEhSoBh+jff1fevOs6KiNB6/wCYCxtQxKez8s5RIDBFie3pYBLq2gWJIuH6NYW+YmE9
         mij1d5Lc/9zm5RDTrDXYfkzjUNW2Z32XN7S7Tfg5023pcF4hlevg9cBJyw/zzKJKZqPj
         +eRxaJCgsKtU/c/OyO39j9nTDOWvlwIZnPMW756jFpy8S3hsNNJLZtbOKgX2cPcuI2j1
         LhvrVvXiKcTmYGJPnOT+UHbPDUIUpTuhizS46k3lpJg4+BlSd4jhYIJ5fioMUTDxQH57
         hJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495833; x=1715100633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DU0xtzI9Cm5N5WksUYgPVqXR4B2xCZmxh2qO529TbRk=;
        b=PoQw33cqBMZ7y5V1QxJnSeA1BuT305q3oxde2Wu6CT/WcJY22y7EqxXZLItuqSnHnD
         0PKk1kQFRKba4Ed9YNx3k/AVwm6ZGVtXRVZUE+epZm4motNt0iGsStpM3R2+TnevOpBk
         pDvPpNHejG2XyFIN3pe0rDIIyJW5LO1aR85XkNNGgx+mgXxDKplv9DVL5w6v3OQvu63u
         GFW2WRTyCoh8lJ7A1WUuWxUwtCteFRR954Gl7zal2bznAM1dVY43ZV8N4Wh8e1o9px8I
         +zy+fGqow+UivgZ9ttloJwA8Dpxewj4tfxZ7KHxVYXwqM5wZCwKg5RypB6Jc8+RFpFVB
         4h3g==
X-Forwarded-Encrypted: i=1; AJvYcCWivmB0f4d4SFx7uBIkhF7rBXerWR5aDxd9AsB9520qecJ9QFYUTPP56rpYM5HlfJkw+DH1Ed3lmhFKs4nGIZMSICxivS6tCYM2spUMKig=
X-Gm-Message-State: AOJu0YyfsvJlD0/zMRB9tljvtvcSlAGUN5BSj8Tefpe7l0dWKgmd1C67
	ofnXQbbcPvMVKBybrdBTsMWDDJKPzg7rwIY82U3SUqZ7pd4Id04q
X-Google-Smtp-Source: AGHT+IH5mCn6s8y3JJfLC094G9xqUv22UPPMyi0CQHk4jd06RZgbi6+GzYUXShvTx3wLunuX1iTX8w==
X-Received: by 2002:ac2:4852:0:b0:515:a8c9:6e99 with SMTP id 18-20020ac24852000000b00515a8c96e99mr42447lfy.5.1714495833071;
        Tue, 30 Apr 2024 09:50:33 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 13/17] softmmu: Pass RAM MemoryRegion and is_write xen_map_cache()
Date: Tue, 30 Apr 2024 18:49:35 +0200
Message-Id: <20240430164939.925307-14-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430164939.925307-1-edgar.iglesias@gmail.com>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Propagate MR and is_write to xen_map_cache().
This is in preparation for adding support for grant mappings.

No functional change.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c         | 10 ++++++----
 include/sysemu/xen-mapcache.h | 11 +++++++----
 system/physmem.c              | 31 +++++++++++++++++++++++--------
 3 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 0365311788..09b5f36d9c 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -264,7 +264,7 @@ static void xen_remap_bucket(MapCache *mc,
 
 static uint8_t *xen_map_cache_unlocked(MapCache *mc,
                                        hwaddr phys_addr, hwaddr size,
-                                       uint8_t lock, bool dma)
+                                       uint8_t lock, bool dma, bool is_write)
 {
     MapCacheEntry *entry, *pentry = NULL,
                   *free_entry = NULL, *free_pentry = NULL;
@@ -387,13 +387,15 @@ tryagain:
     return mc->last_entry->vaddr_base + address_offset;
 }
 
-uint8_t *xen_map_cache(hwaddr phys_addr, hwaddr size,
-                       uint8_t lock, bool dma)
+uint8_t *xen_map_cache(MemoryRegion *mr,
+                       hwaddr phys_addr, hwaddr size,
+                       uint8_t lock, bool dma,
+                       bool is_write)
 {
     uint8_t *p;
 
     mapcache_lock(mapcache);
-    p = xen_map_cache_unlocked(mapcache, phys_addr, size, lock, dma);
+    p = xen_map_cache_unlocked(mapcache, phys_addr, size, lock, dma, is_write);
     mapcache_unlock(mapcache);
     return p;
 }
diff --git a/include/sysemu/xen-mapcache.h b/include/sysemu/xen-mapcache.h
index 10c2e3082a..1ec9e66752 100644
--- a/include/sysemu/xen-mapcache.h
+++ b/include/sysemu/xen-mapcache.h
@@ -18,8 +18,9 @@ typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
 
 void xen_map_cache_init(phys_offset_to_gaddr_t f,
                         void *opaque);
-uint8_t *xen_map_cache(hwaddr phys_addr, hwaddr size,
-                       uint8_t lock, bool dma);
+uint8_t *xen_map_cache(MemoryRegion *mr, hwaddr phys_addr, hwaddr size,
+                       uint8_t lock, bool dma,
+                       bool is_write);
 ram_addr_t xen_ram_addr_from_mapcache(void *ptr);
 void xen_invalidate_map_cache_entry(uint8_t *buffer);
 void xen_invalidate_map_cache(void);
@@ -33,10 +34,12 @@ static inline void xen_map_cache_init(phys_offset_to_gaddr_t f,
 {
 }
 
-static inline uint8_t *xen_map_cache(hwaddr phys_addr,
+static inline uint8_t *xen_map_cache(MemoryRegion *mr,
+                                     hwaddr phys_addr,
                                      hwaddr size,
                                      uint8_t lock,
-                                     bool dma)
+                                     bool dma,
+                                     bool is_write)
 {
     abort();
 }
diff --git a/system/physmem.c b/system/physmem.c
index f114b972a5..ad7a8c7d95 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -2190,11 +2190,22 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t length)
 
 /*
  * Return a host pointer to guest's ram.
+ * For Xen, foreign mappings get created if they don't already exist.
+ *
+ * @block: block for the RAM to lookup (optional and may be NULL).
+ * @addr: address within the memory region.
+ * @size: pointer to requested size (optional and may be NULL).
+ *        size may get modified and return a value smaller than
+ *        what was requested.
+ * @lock: wether to lock the mapping in xen-mapcache until invalidated.
+ * @is_write: hint wether to map RW or RO in the xen-mapcache.
+ *            (optional and may always be set to true).
  *
  * Called within RCU critical section.
  */
 static void *qemu_ram_ptr_length(RAMBlock *block, ram_addr_t addr,
-                                 hwaddr *size, bool lock)
+                                 hwaddr *size, bool lock,
+                                 bool is_write)
 {
     hwaddr len = 0;
 
@@ -2217,10 +2228,13 @@ static void *qemu_ram_ptr_length(RAMBlock *block, ram_addr_t addr,
          * In that case just map the requested area.
          */
         if (block->offset == 0) {
-            return xen_map_cache(addr, len, lock, lock);
+            return xen_map_cache(block->mr, addr, len, lock, lock,
+                                 is_write);
         }
 
-        block->host = xen_map_cache(block->offset, block->max_length, 1, lock);
+        block->host = xen_map_cache(block->mr, block->offset,
+                                    block->max_length, 1,
+                                    lock, is_write);
     }
 
     return ramblock_ptr(block, addr);
@@ -2236,7 +2250,7 @@ static void *qemu_ram_ptr_length(RAMBlock *block, ram_addr_t addr,
  */
 void *qemu_map_ram_ptr(RAMBlock *ram_block, ram_addr_t addr)
 {
-    return qemu_ram_ptr_length(ram_block, addr, NULL, false);
+    return qemu_ram_ptr_length(ram_block, addr, NULL, false, true);
 }
 
 /* Return the offset of a hostpointer within a ramblock */
@@ -2746,7 +2760,7 @@ static MemTxResult flatview_write_continue_step(MemTxAttrs attrs,
     } else {
         /* RAM case */
         uint8_t *ram_ptr = qemu_ram_ptr_length(mr->ram_block, mr_addr, l,
-                                               false);
+                                               false, true);
 
         memmove(ram_ptr, buf, *l);
         invalidate_and_set_dirty(mr, mr_addr, *l);
@@ -2839,7 +2853,7 @@ static MemTxResult flatview_read_continue_step(MemTxAttrs attrs, uint8_t *buf,
     } else {
         /* RAM case */
         uint8_t *ram_ptr = qemu_ram_ptr_length(mr->ram_block, mr_addr, l,
-                                               false);
+                                               false, false);
 
         memcpy(buf, ram_ptr, *l);
 
@@ -3233,7 +3247,7 @@ void *address_space_map(AddressSpace *as,
     *plen = flatview_extend_translation(fv, addr, len, mr, xlat,
                                         l, is_write, attrs);
     fuzz_dma_read_cb(addr, *plen, mr);
-    return qemu_ram_ptr_length(mr->ram_block, xlat, plen, true);
+    return qemu_ram_ptr_length(mr->ram_block, xlat, plen, true, is_write);
 }
 
 /* Unmaps a memory region previously mapped by address_space_map().
@@ -3329,7 +3343,8 @@ int64_t address_space_cache_init(MemoryRegionCache *cache,
         l = flatview_extend_translation(cache->fv, addr, len, mr,
                                         cache->xlat, l, is_write,
                                         MEMTXATTRS_UNSPECIFIED);
-        cache->ptr = qemu_ram_ptr_length(mr->ram_block, cache->xlat, &l, true);
+        cache->ptr = qemu_ram_ptr_length(mr->ram_block, cache->xlat, &l, true,
+                                         is_write);
     } else {
         cache->ptr = NULL;
     }
-- 
2.40.1


