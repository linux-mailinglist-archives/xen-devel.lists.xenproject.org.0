Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2F7840AEE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 17:11:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673018.1047106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUUDt-0004a9-Cs; Mon, 29 Jan 2024 16:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673018.1047106; Mon, 29 Jan 2024 16:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUUDt-0004Xa-9X; Mon, 29 Jan 2024 16:11:01 +0000
Received: by outflank-mailman (input) for mailman id 673018;
 Mon, 29 Jan 2024 16:11:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VQ+3=JH=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1rUUDs-0004XU-FW
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 16:11:00 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd751abc-bec0-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 17:10:59 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e76109cdeso39735795e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 08:10:59 -0800 (PST)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 co6-20020a0560000a0600b0033af4df8e1esm1219957wrb.47.2024.01.29.08.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 08:10:58 -0800 (PST)
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
X-Inumbo-ID: fd751abc-bec0-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706544658; x=1707149458; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPokHMZSaf9YJuvbqyZkKKACp6RuNQ4cINXS/c1TsXk=;
        b=b2/pc+pvgeoKT7LHfR1RryzKWJ7ZTnQ49AMoS5FrnDgePSUOvO/kwvkUVNZFZkdwDC
         t0RNPmPVpC0TtDxDf/5zmu9DYXnahSTEWhKoPkoSbslaLQVJD0Rj1zcxPIFEoLWKI7j8
         h4gbLcJwO48yY3XKUXOXLdFGx/gL+eetOm6BXhiP6/nGW21eqx2u6BkDvP/b1ecgl2Lh
         AozLaXH/Y7DdMdaowcqgJ3+IZsR69s+VSIDPFDY+ePv+bJb06AmBODvS4mKydVCdG4VB
         ZvQddvD+VX3k/NzpMfT/FaZjw8xpUBD2yppQ5W6njVn0nODeSeQI4+tg2t7w0pCAOIVC
         NJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706544658; x=1707149458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPokHMZSaf9YJuvbqyZkKKACp6RuNQ4cINXS/c1TsXk=;
        b=CLnB0v4rEuG19r2DEwq82WOaSkgHpG/QBhHAIyHJLyOE59WKaApAr7wNnmmX2OYHvq
         2G3CGtJ7XX+XNYWPE6YlJmluZyVnxdN8PLwhj0LA0FUCGSCBS58kXV+Rjfei8CSeQisJ
         W9CvzZtpjzsUe0XiSzrJHZ8ECvFiMa/T7Q8uDE5sKqEC7Ww6xsnuRytbQT5cHZcztnQb
         y7Y8iZXt5xz7TdLK58ZnDwDWBPkVLwzGHMUMnpf5SI28d3MjIAlvTlOBkB1wVIvQQoZ0
         KLtrWxiErd0gPbIDZdHjO3iM3NupnQHyWtMSbuna/TwE5Jy4Fc2yHlug9a35nymh3xwV
         7teA==
X-Gm-Message-State: AOJu0YwbhdB4Y/9k1ibCAMyLj9QyMdlHJVuR1lXgqZlz92qGz6yIkOXq
	slQRnW9FQc2bhbH+NMmp99g2XgW69yVCroX5/baaJbZTOCmdr+RGV0QkhKe5iS0=
X-Google-Smtp-Source: AGHT+IH2u+X0jHxP0JLWVS3FK/D/Os2n9uQ6Ne/3EkPY/YogM8wr2ifOFRbEXd/GLM5pC/sG/O6R+Q==
X-Received: by 2002:a05:600c:3547:b0:40e:f5d0:8517 with SMTP id i7-20020a05600c354700b0040ef5d08517mr3106234wmq.33.1706544658554;
        Mon, 29 Jan 2024 08:10:58 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: peter.maydell@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 4/6] hw/xen/xen-mapcache.c: convert DPRINTF to tracepoints
Date: Mon, 29 Jan 2024 18:09:40 +0200
Message-Id: <2fbe1fbc59078e384761c932e97cfa4276a53d75.1706544115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
References: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
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
index 67a6c41926..a65dc0e55f 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -60,3 +60,14 @@ cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, ui
 xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
 xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
 xen_map_cache_return(void* ptr) "%p"
+xen_map_cache_init(uint64_t nr_buckets, uint64_t size) "nr_buckets = 0x%"PRIx64" size 0x%"PRIx64
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


