Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E031D8D38BB
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:08:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731994.1137801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJy5-00052d-P7; Wed, 29 May 2024 14:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731994.1137801; Wed, 29 May 2024 14:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJy5-000509-L8; Wed, 29 May 2024 14:07:53 +0000
Received: by outflank-mailman (input) for mailman id 731994;
 Wed, 29 May 2024 14:07:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9nLQ=NA=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sCJy4-0004Fc-46
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:07:52 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d574fccb-1dc4-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 16:07:50 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52ae14e78e5so818072e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:07:50 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529b712e856sm736822e87.197.2024.05.29.07.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:07:48 -0700 (PDT)
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
X-Inumbo-ID: d574fccb-1dc4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716991670; x=1717596470; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Zme5MAc1tBIih0t7wrm5r256IXDIRT3xxgBybd+OME=;
        b=SD1i/pICPsiT+YN882ho54wlay6dFQERXGEeWfrPDo6Bq73nnDx98KqphTWEdscsmW
         aPhqIJ7W4l1Q/GWoI8NruEB+mOmSEm555k1rrtiqH6WmlrHcK51Y4RQ48oNT+k0b9MCH
         9p06J8OiJ4gg4pqh7kUbXQNuCOXT2Ad/UiHQoI8ggyIyfiimbnMRlvNjlPyIFQu4Huvl
         2UM5BeUZTGmRIT64TiSPI8a1kiDIDR9YmHDNMWZRbwTCtRH69hJwAPFVJVSa9GAiyzYa
         l+0PIKLXZbr6LGbNc7E8PJtaXvA6YeBpo/NXmdTJfvYEIWXbUs11Rbjn+JMXpvC3ZQDX
         X8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716991670; x=1717596470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Zme5MAc1tBIih0t7wrm5r256IXDIRT3xxgBybd+OME=;
        b=fSZqa0K7smf7JyEUYSwSSvDmxz4Vs+nUkP2as/k0VEdC47ioLNVnRSH97uPyEzwdrI
         HGf6WGSP9f+CZWqu1SNNozDM6pq+cSPSqgQwCdfZt7ZQAk6YoiTKccvJRhHtLug552KK
         zcP66f4EuxGPWJd82DFrZVSNADAbLsSuw77XlDkXncUsXpD3FF5+2dj1Ac4MFEJ8rPRy
         zWQewrE87+bW7L900LRIZ4p+Zk/2+MV0nuliAq83EZCmFKtF9RCrFMSzKU1N2qVPJwaj
         6gnSWA/UHkxibk92bHVPcGru2poErNqxbsEwbDyGWtzR+RiJxcFwOP6PYflDODDfLZVU
         LMiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/Nt0I7sSn7K+i1vS3JKh8mp92Ig8KvVl6yghKDOl0/ouSLP157LMN04M6aIqFK+5Ro/irIRGMdZRlagbH6h3SP8/QVcUUOXhPvVX4wjI=
X-Gm-Message-State: AOJu0YzotxyBWseCUM7dlkGlrEMX40zkcAeU9Rg5dSLvPgsVKIw1W5MH
	4NquYA8U5zz8m7a74sNYGZboBebvauVnq2L76eWDg9Zo+Nxk5EH3
X-Google-Smtp-Source: AGHT+IG4vbZH58aNNCx5WtguQ+wygMZh32hk2g0EZYP53A4we56wYQmUuGwtdGe8zRPUZLd0GfJq8g==
X-Received: by 2002:a05:6512:3194:b0:51f:3fea:cbcf with SMTP id 2adb3069b0e04-529664dac0cmr11284687e87.52.1716991669796;
        Wed, 29 May 2024 07:07:49 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v8 6/8] xen: mapcache: Pass the ram_addr offset to xen_map_cache()
Date: Wed, 29 May 2024 16:07:37 +0200
Message-Id: <20240529140739.1387692-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240529140739.1387692-1-edgar.iglesias@gmail.com>
References: <20240529140739.1387692-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Pass the ram_addr offset to xen_map_cache.
This is in preparation for adding grant mappings that need
to compute the address within the RAMBlock.

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xen/xen-mapcache.c         | 16 +++++++++++-----
 include/sysemu/xen-mapcache.h |  2 ++
 system/physmem.c              |  9 +++++----
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index ec95445696..a07c47b0b1 100644
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
+                     cache_size, address_index, false, old_phys_addr);
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


