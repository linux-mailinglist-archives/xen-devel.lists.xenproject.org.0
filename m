Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8E2832A5A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 14:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669035.1041601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQorj-0005JP-Mx; Fri, 19 Jan 2024 13:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669035.1041601; Fri, 19 Jan 2024 13:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQorj-0005HF-KD; Fri, 19 Jan 2024 13:24:59 +0000
Received: by outflank-mailman (input) for mailman id 669035;
 Fri, 19 Jan 2024 13:24:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NYCc=I5=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1rQori-0005H3-8Z
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 13:24:58 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22c726c0-b6ce-11ee-9b0f-b553b5be7939;
 Fri, 19 Jan 2024 14:24:55 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2cd0d05838fso9843551fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 05:24:55 -0800 (PST)
Received: from localhost.localdomain (adsl-138.37.6.1.tellas.gr. [37.6.1.138])
 by smtp.gmail.com with ESMTPSA id
 b11-20020aa7dc0b000000b00558fc426affsm8568310edu.88.2024.01.19.05.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 05:24:55 -0800 (PST)
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
X-Inumbo-ID: 22c726c0-b6ce-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705670695; x=1706275495; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTGa3/BzlzS0hEzKw7dcC9l7LHJA830QpWxPRNzttIo=;
        b=Hihtt50MmPkOkMXa6+qC329UF1cQiG1LLrHtd8uzM+22/aDtYV9TEfUV5Xz5c9NE07
         mATl9bRLbGHu9FQMUXvC1+CrHWjK098EV5hOrc7JxdmN8NkQIo7F0zVD9XDYB/y9dqNw
         O3htMAaRTTN1J030A2p17OKA0SgEFmq2EmRF6vrTNiH4uCK7eWSjhqb9QV8GRlnaRSQd
         YW/LjV/jiJnwOpPPqBb5L6hHwO+Hz1GhU45FzhthJAbS4qYJGatSv4c2+40/wDqLm1fo
         hbAsJ5q0+Jh0MqHNjTL12umUXtUtJF8ZEhMT8qzqjiZS//F9d6LoMrMhRbbj4T6LM3tL
         d0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705670695; x=1706275495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTGa3/BzlzS0hEzKw7dcC9l7LHJA830QpWxPRNzttIo=;
        b=NsaicQp3oTvUPfdCjH07b9NgdZ29s35hrbBtYMigU2RH0sgsQyxIxVa5257yYJhBb3
         979T7Cu9lglu5troPS8tX6ONMYUlYKmXCsmF1vjiRrR7vS3fHAppKoS9yhiy6JyYlrK2
         /qOGwCEGTApSU0BUZstqXUjiIum8jSmttYGTDNjgymPZiFO7P7d1GL/wBhtAHCwlAzH6
         1vP+mtxJuGOCfYfG1/DRcPuTF/reMcpn93tIJ0Yp1UJ9RIVWEzWZ1Xh3e3vXAsLW3hKp
         onL5HF2YMHVRLLdbfOTpbwfwBcFrq7nira9fV/IqI3iW79RBLAe0VaSCHabR21/5sozG
         4Ktw==
X-Gm-Message-State: AOJu0YzXjtjmgObQPu6koem+nTQ8Q1VyXhjcCvDBnX95+uVHQMy7NjW8
	jBH4NEvs59Jdbxwd8WCmHtOKI6xKkpBWUqgP+Jotw7pR6mdPVbY/USwze49IgRc=
X-Google-Smtp-Source: AGHT+IG9I+j9LM471ccGVtYsEUWl1UfRThaE1vuqUryfI5wGDHH2Am9SAFPIvurxpbUcLK8NO6cNXg==
X-Received: by 2002:a05:6512:3e29:b0:50e:e2e2:b69b with SMTP id i41-20020a0565123e2900b0050ee2e2b69bmr838216lfv.4.1705670695453;
        Fri, 19 Jan 2024 05:24:55 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 3/5] hw/xen/xen-mapcache.c: convert DPRINTF to tracepoints
Date: Fri, 19 Jan 2024 15:24:45 +0200
Message-Id: <d5493e864f41ea1fe35fc96e91c7679ceb9ab60f.1705670342.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705670342.git.manos.pitsidianakis@linaro.org>
References: <cover.1705670342.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit

Tracing DPRINTFs to stderr might not be desired. A developer that relies
on tracepoints should be able to opt-in to each tracepoint and rely on
QEMU's log redirection, instead of stderr by default.

This commit converts DPRINTFs in this file that are used for tracing
into tracepoints.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/xen/trace-events   | 11 +++++++++
 hw/xen/xen-mapcache.c | 54 +++++++++++++++++++------------------------
 2 files changed, 35 insertions(+), 30 deletions(-)

diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index 67a6c41926..1b748dba09 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -60,3 +60,14 @@ cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, ui
 xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
 xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
 xen_map_cache_return(void* ptr) "%p"
+xen_map_cache_init(uint64_t nr_buckets, uint64_t size) "nr_buckets = 0x%lx size %lu"
+xen_replace_cache_entry_dummy(uint64_t old_phys_addr, uint64_t new_phys_addr) "Replacing a dummy mapcache entry for 0x%"PRIx64" with 0x%"PRIx64
+xen_invalidate_map_cache_entry_unlocked_not_found(void *p) "could not find %p"
+xen_invalidate_map_cache_entry_unlocked_found(uint64_t addr, void *p) "   0x%"PRIx64" -> %p is present"
+xen_invalidate_map_cache_entry_unlocked_miss(void *buffer) "Trying to unmap address %p that is not in the mapcache"
+xen_replace_cache_entry_unlocked_could_not_update_entry(uint64_t old_phys_addr) "Unable to update a mapcache entry for 0x%"PRIx64
+xen_ram_addr_from_mapcache_not_found(void *p) "could not find %p"
+xen_ram_addr_from_mapcache_found(uint64_t addr, void *p) "   0x%"PRIx64" -> %p is present"
+xen_ram_addr_from_mapcache_not_in_cache(void *p) "Trying to find address %p that is not in the mapcache"
+xen_replace_cache_entry_unlocked(uint64_t old_phys_addr) "Trying to update an entry for 0x%"PRIx64" that is not in the mapcache"
+xen_invalidate_map_cache(uint64_t paddr_index, void *vaddr_req) "Locked DMA mapping while invalidating mapcache 0x%"PRIx64" -> %p is present"
diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index f7d974677d..336c212376 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -22,16 +22,6 @@
 #include "trace.h"
 
 
-//#define MAPCACHE_DEBUG
-
-#ifdef MAPCACHE_DEBUG
-#  define DPRINTF(fmt, ...) do { \
-    fprintf(stderr, "xen_mapcache: " fmt, ## __VA_ARGS__); \
-} while (0)
-#else
-#  define DPRINTF(fmt, ...) do { } while (0)
-#endif
-
 #if HOST_LONG_BITS == 32
 #  define MCACHE_BUCKET_SHIFT 16
 #  define MCACHE_MAX_SIZE     (1UL<<31) /* 2GB Cap */
@@ -145,8 +135,7 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
 
     size = mapcache->nr_buckets * sizeof (MapCacheEntry);
     size = (size + XC_PAGE_SIZE - 1) & ~(XC_PAGE_SIZE - 1);
-    DPRINTF("%s, nr_buckets = %lx size %lu\n", __func__,
-            mapcache->nr_buckets, size);
+    trace_xen_map_cache_init(mapcache->nr_buckets, size);
     mapcache->entry = g_malloc0(size);
 }
 
@@ -286,7 +275,9 @@ tryagain:
         test_bits(address_offset >> XC_PAGE_SHIFT,
                   test_bit_size >> XC_PAGE_SHIFT,
                   mapcache->last_entry->valid_mapping)) {
-        trace_xen_map_cache_return(mapcache->last_entry->vaddr_base + address_offset);
+        trace_xen_map_cache_return(
+            mapcache->last_entry->vaddr_base + address_offset
+        );
         return mapcache->last_entry->vaddr_base + address_offset;
     }
 
@@ -368,7 +359,9 @@ tryagain:
         QTAILQ_INSERT_HEAD(&mapcache->locked_entries, reventry, next);
     }
 
-    trace_xen_map_cache_return(mapcache->last_entry->vaddr_base + address_offset);
+    trace_xen_map_cache_return(
+        mapcache->last_entry->vaddr_base + address_offset
+    );
     return mapcache->last_entry->vaddr_base + address_offset;
 }
 
@@ -402,10 +395,10 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
         }
     }
     if (!found) {
-        fprintf(stderr, "%s, could not find %p\n", __func__, ptr);
+        trace_xen_ram_addr_from_mapcache_not_found(ptr);
         QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
-            DPRINTF("   "HWADDR_FMT_plx" -> %p is present\n", reventry->paddr_index,
-                    reventry->vaddr_req);
+            trace_xen_ram_addr_from_mapcache_found(reventry->paddr_index,
+                                                   reventry->vaddr_req);
         }
         abort();
         return 0;
@@ -416,7 +409,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
         entry = entry->next;
     }
     if (!entry) {
-        DPRINTF("Trying to find address %p that is not in the mapcache!\n", ptr);
+        trace_xen_ram_addr_from_mapcache_not_in_cache(ptr);
         raddr = 0;
     } else {
         raddr = (reventry->paddr_index << MCACHE_BUCKET_SHIFT) +
@@ -443,9 +436,12 @@ static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
         }
     }
     if (!found) {
-        DPRINTF("%s, could not find %p\n", __func__, buffer);
+        trace_xen_invalidate_map_cache_entry_unlocked_not_found(buffer);
         QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
-            DPRINTF("   "HWADDR_FMT_plx" -> %p is present\n", reventry->paddr_index, reventry->vaddr_req);
+            trace_xen_invalidate_map_cache_entry_unlocked_found(
+                reventry->paddr_index,
+                reventry->vaddr_req
+            );
         }
         return;
     }
@@ -463,7 +459,7 @@ static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
         entry = entry->next;
     }
     if (!entry) {
-        DPRINTF("Trying to unmap address %p that is not in the mapcache!\n", buffer);
+        trace_xen_invalidate_map_cache_entry_unlocked_miss(buffer);
         return;
     }
     entry->lock--;
@@ -502,9 +498,8 @@ void xen_invalidate_map_cache(void)
         if (!reventry->dma) {
             continue;
         }
-        fprintf(stderr, "Locked DMA mapping while invalidating mapcache!"
-                " "HWADDR_FMT_plx" -> %p is present\n",
-                reventry->paddr_index, reventry->vaddr_req);
+        trace_xen_invalidate_map_cache(reventry->paddr_index,
+                                       reventry->vaddr_req);
     }
 
     for (i = 0; i < mapcache->nr_buckets; i++) {
@@ -562,24 +557,23 @@ static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
         entry = entry->next;
     }
     if (!entry) {
-        DPRINTF("Trying to update an entry for "HWADDR_FMT_plx \
-                "that is not in the mapcache!\n", old_phys_addr);
+        trace_xen_replace_cache_entry_unlocked(old_phys_addr);
         return NULL;
     }
 
     address_index  = new_phys_addr >> MCACHE_BUCKET_SHIFT;
     address_offset = new_phys_addr & (MCACHE_BUCKET_SIZE - 1);
 
-    fprintf(stderr, "Replacing a dummy mapcache entry for "HWADDR_FMT_plx \
-            " with "HWADDR_FMT_plx"\n", old_phys_addr, new_phys_addr);
+    trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phys_addr);
 
     xen_remap_bucket(entry, entry->vaddr_base,
                      cache_size, address_index, false);
     if (!test_bits(address_offset >> XC_PAGE_SHIFT,
                 test_bit_size >> XC_PAGE_SHIFT,
                 entry->valid_mapping)) {
-        DPRINTF("Unable to update a mapcache entry for "HWADDR_FMT_plx"!\n",
-                old_phys_addr);
+        trace_xen_replace_cache_entry_unlocked_could_not_update_entry(
+            old_phys_addr
+        );
         return NULL;
     }
 
-- 
γαῖα πυρί μιχθήτω


