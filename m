Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 573AB8B7D92
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715063.1116617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgj-0007cH-1P; Tue, 30 Apr 2024 16:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715063.1116617; Tue, 30 Apr 2024 16:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgi-0007Wo-Pq; Tue, 30 Apr 2024 16:50:40 +0000
Received: by outflank-mailman (input) for mailman id 715063;
 Tue, 30 Apr 2024 16:50:38 +0000
Received: from [94.247.172.50] (helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/Z8=MD=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s1qgg-0003oL-JM
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:50:38 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4c4c297-0711-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 18:50:37 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-516d68d7a8bso5469247e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:50:37 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 v28-20020ac2593c000000b0051905a9c212sm4531378lfi.195.2024.04.30.09.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:50:35 -0700 (PDT)
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
X-Inumbo-ID: c4c4c297-0711-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714495836; x=1715100636; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1O0c3lbCIPcVTDP2OG2o9vVTYuu5kyg6TUhLFf8SY0=;
        b=LMfGWXvxGMH/lkQExl6XjNof1EQ/88r/lQJJ9Uf8TX0QdRxbBdGMBftfuM3voPhI8D
         zlWFA0GCNQXx+6yWti9L+EXVU5Q12fIrl2gupYOyN3pUTN+rT+wLJGgZbRON+v850A7z
         aXZKYXJfWhGSzRN1O7Ef8SVqysUh5fvUe3Z3RsK+ajXhVKKEsiyIeY6Cz9swd8Zmcfr3
         9cASj3hl5ujIU9qbHee7E9/ZXQHHN3QRGF0fN1tXFIwqG6n+KYwfH53D1XDnvIuAMWo2
         YLhKeEWTupwNtW/W1eSBj+bxoviRt1XhLPs0b0uYk2q8IjmbCqFIjx6rXJ/DA6ixCEeb
         DnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495836; x=1715100636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1O0c3lbCIPcVTDP2OG2o9vVTYuu5kyg6TUhLFf8SY0=;
        b=fM/rsQ4jg/XMchvgm/RbAIlLpSfRLIdVMB1/dlSDv7kqInN/GtWggqwN/d5Wl4k2kM
         mEpXqCezoRX34P6JE7Ja7o1+06M65OZ+aJ2GrAXFZD/8AvBn2CPu75xE66TGDysDe326
         KfRwjl5aD1A3J4svcSFAEEax24nOEemPqeKpOy61rqkWzzZglpxtx3gVHZ+zXTq2R+md
         9xSfk6Etl6MiaCsjtdDQ8/P3PoTuZal0foI6W7XhvS8KPGp+YHcdHc5HDyCncrow3BGd
         JkptzmXmokpWxhRN3Y28dJhtuQHdoAPn/8OveVFnEphI3RC0KT+++06hq+2UNeFjfKxb
         VcjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXppVESB1DGLCdCLO69BLl8U35b6xq8XiLLVvWmPDi+VOjmpO6rwOTj1fpWJrWpqsw8KlxHomJjrDemorlj/88wDwnZos9kQYqDTmXUOU8=
X-Gm-Message-State: AOJu0YzYkgy+kdYlYy//wLsPwEOKmaK1XAQNADwxTJd9M1fHG/JymO+t
	IRzDHiNGMwLl3RShQ9XbiKtaddpF2tGz5uEfSlHU826elTnMQ1V+
X-Google-Smtp-Source: AGHT+IEvjQlWDNSp7Iep3p7LGdRlo9ppcQEfRdIFgR8UUsJQ+BGno9B+qbCWNATble5SB4/21MS5zA==
X-Received: by 2002:a05:6512:21e:b0:51a:bd22:12a7 with SMTP id a30-20020a056512021e00b0051abd2212a7mr1077307lfo.26.1714495836367;
        Tue, 30 Apr 2024 09:50:36 -0700 (PDT)
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
Subject: [PATCH v4 15/17] xen: mapcache: Remove assumption of RAMBlock with 0 offset
Date: Tue, 30 Apr 2024 18:49:37 +0200
Message-Id: <20240430164939.925307-16-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430164939.925307-1-edgar.iglesias@gmail.com>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

The current mapcache assumes that all memory is mapped
in a single RAM MR (the first one with offset 0). Remove
this assumption and propagate the offset to the mapcache
so it can do reverse mappings (from hostptr -> ram_addr).

This is in preparation for adding grant mappings.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c         | 25 ++++++++++++++++++-------
 include/sysemu/xen-mapcache.h |  2 ++
 system/physmem.c              |  8 ++++----
 3 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 09b5f36d9c..1b32d0c003 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -43,6 +43,9 @@ typedef struct MapCacheEntry {
 #define XEN_MAPCACHE_ENTRY_DUMMY (1 << 0)
     uint8_t flags;
     hwaddr size;
+
+    /* Keep ram_addr offset for reverse mappings (hostptr -> ram_addr).  */
+    ram_addr_t ram_offset;
     struct MapCacheEntry *next;
 } MapCacheEntry;
 
@@ -165,7 +168,8 @@ static void xen_remap_bucket(MapCache *mc,
                              void *vaddr,
                              hwaddr size,
                              hwaddr address_index,
-                             bool dummy)
+                             bool dummy,
+                             ram_addr_t ram_offset)
 {
     uint8_t *vaddr_base;
     xen_pfn_t *pfns;
@@ -244,6 +248,7 @@ static void xen_remap_bucket(MapCache *mc,
     entry->size = size;
     entry->valid_mapping = g_new0(unsigned long,
                                   BITS_TO_LONGS(size >> XC_PAGE_SHIFT));
+    entry->ram_offset = ram_offset;
 
     if (dummy) {
         entry->flags |= XEN_MAPCACHE_ENTRY_DUMMY;
@@ -264,6 +269,7 @@ static void xen_remap_bucket(MapCache *mc,
 
 static uint8_t *xen_map_cache_unlocked(MapCache *mc,
                                        hwaddr phys_addr, hwaddr size,
+                                       ram_addr_t ram_offset,
                                        uint8_t lock, bool dma, bool is_write)
 {
     MapCacheEntry *entry, *pentry = NULL,
@@ -335,14 +341,16 @@ tryagain:
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
 
@@ -389,13 +397,15 @@ tryagain:
 
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
@@ -432,7 +442,8 @@ static ram_addr_t xen_ram_addr_from_mapcache_single(MapCache *mc, void *ptr)
         raddr = RAM_ADDR_INVALID;
     } else {
         raddr = (reventry->paddr_index << mc->bucket_shift) +
-             ((unsigned long) ptr - (unsigned long) entry->vaddr_base);
+             ((unsigned long) ptr - (unsigned long) entry->vaddr_base) +
+             entry->ram_offset;
     }
     mapcache_unlock(mc);
     return raddr;
@@ -627,8 +638,8 @@ static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
 
     trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phys_addr);
 
-    xen_remap_bucket(mapcache, entry, entry->vaddr_base,
-                     cache_size, address_index, false);
+    xen_remap_bucket(mc, entry, entry->vaddr_base,
+                     cache_size, address_index, false, entry->ram_offset);
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
index 1a5ffcba2a..5b16eeccca 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -2228,13 +2228,13 @@ static void *qemu_ram_ptr_length(RAMBlock *block, ram_addr_t addr,
          * In that case just map the requested area.
          */
         if (xen_mr_is_memory(block->mr)) {
-            return xen_map_cache(block->mr, addr, len, lock, lock,
-                                 is_write);
+            return xen_map_cache(block->mr, addr, len, block->offset,
+                                 lock, lock, is_write);
         }
 
         block->host = xen_map_cache(block->mr, block->offset,
-                                    block->max_length, 1,
-                                    lock, is_write);
+                                    block->max_length, 0,
+                                    1, lock, is_write);
     }
 
     return ramblock_ptr(block, addr);
-- 
2.40.1


