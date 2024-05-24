Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17EB8CE46C
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 12:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729313.1134450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASWu-0006XZ-Oy; Fri, 24 May 2024 10:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729313.1134450; Fri, 24 May 2024 10:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASWu-0006Vc-L1; Fri, 24 May 2024 10:52:08 +0000
Received: by outflank-mailman (input) for mailman id 729313;
 Fri, 24 May 2024 10:52:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2lVY=M3=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sASWs-0005va-Vm
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 10:52:06 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a962440f-19bb-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 12:52:06 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52327368e59so9717754e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 03:52:06 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296e887b1asm152787e87.32.2024.05.24.03.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 03:52:04 -0700 (PDT)
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
X-Inumbo-ID: a962440f-19bb-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716547926; x=1717152726; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFr6EaV5waf3qgpK3N8zYV0AbUxb9xkgU9bBgeST51Y=;
        b=P3AaTpJ52DVX+7ywX6EwtgmL0B3zaO91fBBJ4+IxAspAorXYzTu/HYfHkuvIxQz9HY
         d6jXlbphUk9Wckchxh1dzRWnS3f0P4jwVq1aVIGRBpf5x+hvaef/my/RIvZ4uCdJ5c55
         9e8hWqDZdNGCXydERQWz79woop0dEo+XN1tHHha8OsddYmG4FDLdcjF23UGCq6g0jNzI
         gVFeRpsJWDiawCSsoo28OQ3krSYhfVPkG9RTXq8iWywNF6fYgyO5KNfeI0+cXWyTmrqE
         zIdAqbMtDB+sCI0/FrtGz3xh0si5O+F2A21PthRFeHKIzZhELKFCxQ7OV0MbFcjECpes
         aBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716547926; x=1717152726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFr6EaV5waf3qgpK3N8zYV0AbUxb9xkgU9bBgeST51Y=;
        b=Q349NR6434sQhL3nL7bnQ5QTXZFhr5M5sHNa45y7SOAtERErNruegkd5oDYEdT1wnT
         UTYlbv5xXxunYvD9lkWqsG1fwIhRYN/HFYe+/k34S46QAwfY1WNP1fxuXg+Cyu/DnYKL
         fkuxt2DfQ1IqREjGwsJv6MEoa0cV3jh85wDHUvy83Dxo9M4Cxl9x18BvUVKjuf7LTazm
         q6Fqu8a4w3Eme3z8+RGOvFXdgMOQrlaBnsr7vxPycUwGzjD6vuVwvpZL9Xux2/DBER2k
         WbiSdJUyWqDgzxFg4wVW4Wl6VfEeutzaMbh/zit/0VsU8qkMIIs6g3s2jZwvt6ED4NOr
         X1sA==
X-Forwarded-Encrypted: i=1; AJvYcCV1VJhjJlESgs6YhEIDWtLRMYtmxU4W2Dp3GB/jMjPW2nEypQngCINFbAkYIjfuwXyXVtdrqzlaTiq360XZ9knSu0v1gJ9MA3YQD8kw+C0=
X-Gm-Message-State: AOJu0YwR8BzOCC5tLJhMlVFG+SUBM5z7U6radr7gdK108Iu8UwuL6ef5
	Ugc0F2xjMhUeF/vXsf6gtabHr+6IAA5+xb28Zo+7A++UWjzVaevy
X-Google-Smtp-Source: AGHT+IFH/GXyxK3UUwsYBMOqKtKS+ki8gwKfJtjwB628taZMcmokUZth9SWriOw8oaOj3H6sRigelA==
X-Received: by 2002:a19:9148:0:b0:523:bbf5:4b36 with SMTP id 2adb3069b0e04-529646df136mr834902e87.20.1716547925723;
        Fri, 24 May 2024 03:52:05 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	David Hildenbrand <david@redhat.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v7 6/8] xen: mapcache: Pass the ram_addr offset to xen_map_cache()
Date: Fri, 24 May 2024 12:51:50 +0200
Message-Id: <20240524105152.1301842-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240524105152.1301842-1-edgar.iglesias@gmail.com>
References: <20240524105152.1301842-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Pass the ram_addr offset to xen_map_cache.
This is in preparation for adding grant mappings that need
to compute the address within the RAMBlock.

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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


