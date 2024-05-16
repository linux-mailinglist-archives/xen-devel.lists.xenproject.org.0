Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CD28C79AC
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 17:48:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723476.1128374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dLA-0000d2-WC; Thu, 16 May 2024 15:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723476.1128374; Thu, 16 May 2024 15:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dLA-0000Zi-TA; Thu, 16 May 2024 15:48:20 +0000
Received: by outflank-mailman (input) for mailman id 723476;
 Thu, 16 May 2024 15:48:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DxoZ=MT=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s7dLA-0008LQ-1R
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 15:48:20 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7a75bb4-139b-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 17:48:19 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-420298ff5b1so9908645e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 08:48:19 -0700 (PDT)
Received: from gmail.com ([213.0.35.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccee9292sm273969565e9.37.2024.05.16.08.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 08:48:18 -0700 (PDT)
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
X-Inumbo-ID: b7a75bb4-139b-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715874499; x=1716479299; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+z9GUm6j8WzszIWdyc3UrfaOV2gWSdTHpFYF8lhndm8=;
        b=ZetVf7jb3gRKjPFSBfAffCi8AyMsUIznWc4QbVFVZ3r9y0UaP9undzOApaVqq9LtN9
         qTdjxXIHll2VMMl0CEYqh/9X4LtEovcF+nASxO4lM3OD8i3h9eACOGjA/pZJJB4z7Pv5
         UMeLQ+vP7H+evWzV5CcPbtGagl/KJbc089kkRJXNiqffScJ8Uz6gyHx7B6BNoW7MsTHr
         KlPIdJk6v4L1ewoGYObMY+VLD3I5FTxN+b2Ri+1H/EWcWik1eKzsg9rnu2j1xYrFN0ne
         dkeZjlmI+wxyimn3KUbTlV3P49yEMfompFWRpC2KACORYsDGLRsEvT7Kvm2EZVvPAN1r
         aIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715874499; x=1716479299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+z9GUm6j8WzszIWdyc3UrfaOV2gWSdTHpFYF8lhndm8=;
        b=GJ/aoMXJoyIU8jW5crucGE0caY8TcSSj9qkTy+F7QOSRrf9Lt/s9cGikWO3Qk2xOGb
         7nkVvDn0fWLNdGhSG2E7mnIG59V26lQkM2li+VqPNNgV3lfEMZWXf0SmJSLMfMTNRerI
         4hM66rGexXLZGlYForLReH298tExhKdgrSA+DRfBKZB3DZbJJRzWwDRO9Lz4HzhQB4n0
         cAzN84CJA3n0jdHUFvcg4fuh/GUo0a8pYmHCN2NY81v+mHt+RE/LVRK6hOPL5A617oqR
         kqTQZMl94PtaT43gQpfTaTZx2zNiF8ge9p4sgYxE20sqAp33KmTEVZQB+1Jp9QHlo7Cj
         LYqg==
X-Forwarded-Encrypted: i=1; AJvYcCVpqJTZ0MotG7O5qJm/qCFrsnPl4QJekOh4pIXc/+MUwmQo36IHbMEBAnJ0qa1jL7yWr1ZB+GhhBmYVzal+ZrSm8hiYCNltyTxT+FvBBFA=
X-Gm-Message-State: AOJu0YzEUbL9KR1jeZE/pkQSzLYK5nRNG9moUoogmevoCNfC/fNKAIgK
	VecUpMSoOEI6r50sh3gjhEtRrL2ITQ5GqW99GIzAg+5Z1N4HYNmR
X-Google-Smtp-Source: AGHT+IGfNbqzq+QNyeonmsqylEpUTqR0Yl/VLa0jqDvd+rb0LT+CkFvkUWEMXBZQKhr0f0w8Mk8vVg==
X-Received: by 2002:a05:600c:4707:b0:41b:edf4:4071 with SMTP id 5b1f17b1804b1-41fead64731mr176758575e9.35.1715874498887;
        Thu, 16 May 2024 08:48:18 -0700 (PDT)
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
Subject: [PATCH v6 6/8] xen: mapcache: Pass the ram_addr offset to xen_map_cache()
Date: Thu, 16 May 2024 17:48:02 +0200
Message-Id: <20240516154804.1114245-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240516154804.1114245-1-edgar.iglesias@gmail.com>
References: <20240516154804.1114245-1-edgar.iglesias@gmail.com>
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


