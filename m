Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0F28CE46E
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 12:52:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729314.1134459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASWy-0006s7-0w; Fri, 24 May 2024 10:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729314.1134459; Fri, 24 May 2024 10:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASWx-0006ow-Ty; Fri, 24 May 2024 10:52:11 +0000
Received: by outflank-mailman (input) for mailman id 729314;
 Fri, 24 May 2024 10:52:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2lVY=M3=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sASWv-0005h8-Oz
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 10:52:09 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa3e8c9b-19bb-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 12:52:07 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5241b49c0daso7005963e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 03:52:07 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296e887a61sm154331e87.62.2024.05.24.03.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 03:52:06 -0700 (PDT)
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
X-Inumbo-ID: aa3e8c9b-19bb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716547927; x=1717152727; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3di7O7tdApxOVr1CI1JAQSoCPPyk5/k7Mjm3E5eqE1c=;
        b=jN3z9wtM4t82GsLPogJgNzy7eWWyvkz+/hIKpThBnhfJtnWPx9JNuZOis7W6c+tOOi
         tvFXigdcx9p/moZvnwgtOPsX4HF8BHKTW9FK8myrMsxaAcwoXvXpr7J6lhb1b0ALoB/s
         3ZheCfrRTywd2PWUlwa4TZxChUmUP/+xIBCJfRXnXkVpLaz5oGkKZiZiX43jLve9lCmK
         E2M/UJvp27ks8Xc/9yz6BXem8YEp3BQjM6YdTjc3rlNrXARb+r0M8aiNeKi2QcIzC36D
         JH45V+3mMi2ku/fFUOjFVQ1GbVjUFCMdFTtq9IaTDK5WvZq7KkeOvOnSKMoymUslsoxv
         WNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716547927; x=1717152727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3di7O7tdApxOVr1CI1JAQSoCPPyk5/k7Mjm3E5eqE1c=;
        b=f3rN9SLLAO0r14lm005c15EmBxEIdTg6kiMIa0ytlWms/6H9UpF0MnlFon08xCozJa
         uip+3nsxiIA8XNI5nourw5eptIC9Wts0gzKLsOZgZtqRpM4uPeLFQ69saLqtGmwLONO5
         TJI2loSwJMaHRMSnLKUVmyRuPfIbJ12MGAw5Kfl7LFUxuj1cGT1NSkf2Wiap+iVik4cC
         xdM044Pk6JJ+yFd/fhF1Lizj9hEQK+3E2kiQJbDFh1MIqK31Ie5bweJ+3PLheQP6Ufux
         qyYA8wtmgxwugP1+H4Ja/0c2+5HtgcVsCQrnHzfWK8o4dl2Dw299MZxpqoLtEyQW0aHK
         s2wA==
X-Forwarded-Encrypted: i=1; AJvYcCXpeDemqxzpDRBIfZX3Tk/ksnVl9jI7NZb82AVAnsTMXKDo6UIk0UnqTiGCDHSQ7Zt/rFSQHS2ZqxELVnkuFxRrRdgYsIcIUpZ8RXz0VOg=
X-Gm-Message-State: AOJu0YwaYC/hzoargSP4kAyyNTq4Gnc2l1dgFY4Cwingrq4tXYrQfd/V
	5h9uMF3z34OwJ5KgOtKuCX4/o8YZl23M10Hl61ljYvqZ4CKswWJ1
X-Google-Smtp-Source: AGHT+IE5CtpteyyNazgBiJLIGSkabCL02X/CfF2Skfk8qN39LOCmJrRorp9B6cUUA2WoRJaRtcGV5Q==
X-Received: by 2002:ac2:5932:0:b0:521:b1ca:9c99 with SMTP id 2adb3069b0e04-529645e2556mr1097227e87.5.1716547927180;
        Fri, 24 May 2024 03:52:07 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v7 7/8] xen: mapcache: Add support for grant mappings
Date: Fri, 24 May 2024 12:51:51 +0200
Message-Id: <20240524105152.1301842-8-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240524105152.1301842-1-edgar.iglesias@gmail.com>
References: <20240524105152.1301842-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a second mapcache for grant mappings. The mapcache for
grants needs to work with XC_PAGE_SIZE granularity since
we can't map larger ranges than what has been granted to us.

Like with foreign mappings (xen_memory), machines using grants
are expected to initialize the xen_grants MR and map it
into their address-map accordingly.

CC: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/xen/xen-hvm-common.c         |  12 ++-
 hw/xen/xen-mapcache.c           | 165 +++++++++++++++++++++++++-------
 include/hw/xen/xen-hvm-common.h |   3 +
 include/sysemu/xen.h            |   7 ++
 4 files changed, 150 insertions(+), 37 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index a0a0252da0..b8ace1c368 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -10,12 +10,18 @@
 #include "hw/boards.h"
 #include "hw/xen/arch_hvm.h"
 
-MemoryRegion xen_memory;
+MemoryRegion xen_memory, xen_grants;
 
-/* Check for xen memory.  */
+/* Check for any kind of xen memory, foreign mappings or grants.  */
 bool xen_mr_is_memory(MemoryRegion *mr)
 {
-    return mr == &xen_memory;
+    return mr == &xen_memory || mr == &xen_grants;
+}
+
+/* Check specifically for grants.  */
+bool xen_mr_is_grants(MemoryRegion *mr)
+{
+    return mr == &xen_grants;
 }
 
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index a07c47b0b1..5f23b0adbe 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -14,6 +14,7 @@
 
 #include <sys/resource.h>
 
+#include "hw/xen/xen-hvm-common.h"
 #include "hw/xen/xen_native.h"
 #include "qemu/bitmap.h"
 
@@ -21,6 +22,8 @@
 #include "sysemu/xen-mapcache.h"
 #include "trace.h"
 
+#include <xenevtchn.h>
+#include <xengnttab.h>
 
 #if HOST_LONG_BITS == 32
 #  define MCACHE_MAX_SIZE     (1UL<<31) /* 2GB Cap */
@@ -41,6 +44,7 @@ typedef struct MapCacheEntry {
     unsigned long *valid_mapping;
     uint32_t lock;
 #define XEN_MAPCACHE_ENTRY_DUMMY (1 << 0)
+#define XEN_MAPCACHE_ENTRY_GRANT (1 << 1)
     uint8_t flags;
     hwaddr size;
     struct MapCacheEntry *next;
@@ -71,6 +75,8 @@ typedef struct MapCache {
 } MapCache;
 
 static MapCache *mapcache;
+static MapCache *mapcache_grants;
+static xengnttab_handle *xen_region_gnttabdev;
 
 static inline void mapcache_lock(MapCache *mc)
 {
@@ -131,6 +137,12 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
     unsigned long max_mcache_size;
     unsigned int bucket_shift;
 
+    xen_region_gnttabdev = xengnttab_open(NULL, 0);
+    if (xen_region_gnttabdev == NULL) {
+        error_report("mapcache: Failed to open gnttab device");
+        exit(EXIT_FAILURE);
+    }
+
     if (HOST_LONG_BITS == 32) {
         bucket_shift = 16;
     } else {
@@ -159,6 +171,15 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
     mapcache = xen_map_cache_init_single(f, opaque,
                                          bucket_shift,
                                          max_mcache_size);
+
+    /*
+     * Grant mappings must use XC_PAGE_SIZE granularity since we can't
+     * map anything beyond the number of pages granted to us.
+     */
+    mapcache_grants = xen_map_cache_init_single(f, opaque,
+                                                XC_PAGE_SHIFT,
+                                                max_mcache_size);
+
     setrlimit(RLIMIT_AS, &rlimit_as);
 }
 
@@ -168,17 +189,24 @@ static void xen_remap_bucket(MapCache *mc,
                              hwaddr size,
                              hwaddr address_index,
                              bool dummy,
+                             bool grant,
+                             bool is_write,
                              ram_addr_t ram_offset)
 {
     uint8_t *vaddr_base;
-    xen_pfn_t *pfns;
-    int *err;
+    g_autofree uint32_t *refs = NULL;
+    g_autofree xen_pfn_t *pfns = NULL;
+    g_autofree int *err;
     unsigned int i;
     hwaddr nb_pfn = size >> XC_PAGE_SHIFT;
 
     trace_xen_remap_bucket(address_index);
 
-    pfns = g_new0(xen_pfn_t, nb_pfn);
+    if (grant) {
+        refs = g_new0(uint32_t, nb_pfn);
+    } else {
+        pfns = g_new0(xen_pfn_t, nb_pfn);
+    }
     err = g_new0(int, nb_pfn);
 
     if (entry->vaddr_base != NULL) {
@@ -207,21 +235,51 @@ static void xen_remap_bucket(MapCache *mc,
     g_free(entry->valid_mapping);
     entry->valid_mapping = NULL;
 
-    for (i = 0; i < nb_pfn; i++) {
-        pfns[i] = (address_index << (mc->bucket_shift - XC_PAGE_SHIFT)) + i;
+    if (grant) {
+        hwaddr grant_base = address_index - (ram_offset >> XC_PAGE_SHIFT);
+
+        for (i = 0; i < nb_pfn; i++) {
+            refs[i] = grant_base + i;
+        }
+    } else {
+        for (i = 0; i < nb_pfn; i++) {
+            pfns[i] = (address_index << (mc->bucket_shift - XC_PAGE_SHIFT)) + i;
+        }
     }
 
-    /*
-     * If the caller has requested the mapping at a specific address use
-     * MAP_FIXED to make sure it's honored.
-     */
+    entry->flags &= ~XEN_MAPCACHE_ENTRY_GRANT;
+
     if (!dummy) {
-        vaddr_base = xenforeignmemory_map2(xen_fmem, xen_domid, vaddr,
-                                           PROT_READ | PROT_WRITE,
-                                           vaddr ? MAP_FIXED : 0,
-                                           nb_pfn, pfns, err);
+        if (grant) {
+            int prot = PROT_READ;
+
+            if (is_write) {
+                prot |= PROT_WRITE;
+            }
+
+            entry->flags |= XEN_MAPCACHE_ENTRY_GRANT;
+            assert(vaddr == NULL);
+            vaddr_base = xengnttab_map_domain_grant_refs(xen_region_gnttabdev,
+                                                         nb_pfn,
+                                                         xen_domid, refs,
+                                                         prot);
+        } else {
+            /*
+             * If the caller has requested the mapping at a specific address use
+             * MAP_FIXED to make sure it's honored.
+             *
+             * We don't yet support upgrading mappings from RO to RW, to handle
+             * models using ordinary address_space_rw(), foreign mappings ignore
+             * is_write and are always mapped RW.
+             */
+            vaddr_base = xenforeignmemory_map2(xen_fmem, xen_domid, vaddr,
+                                               PROT_READ | PROT_WRITE,
+                                               vaddr ? MAP_FIXED : 0,
+                                               nb_pfn, pfns, err);
+        }
         if (vaddr_base == NULL) {
-            perror("xenforeignmemory_map2");
+            perror(grant ? "xengnttab_map_domain_grant_refs"
+                           : "xenforeignmemory_map2");
             exit(-1);
         }
     } else {
@@ -260,15 +318,13 @@ static void xen_remap_bucket(MapCache *mc,
             bitmap_set(entry->valid_mapping, i, 1);
         }
     }
-
-    g_free(pfns);
-    g_free(err);
 }
 
 static uint8_t *xen_map_cache_unlocked(MapCache *mc,
                                        hwaddr phys_addr, hwaddr size,
                                        ram_addr_t ram_offset,
-                                       uint8_t lock, bool dma, bool is_write)
+                                       uint8_t lock, bool dma,
+                                       bool grant, bool is_write)
 {
     MapCacheEntry *entry, *pentry = NULL,
                   *free_entry = NULL, *free_pentry = NULL;
@@ -340,7 +396,7 @@ tryagain:
         entry = g_new0(MapCacheEntry, 1);
         pentry->next = entry;
         xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy,
-                         ram_offset);
+                         grant, is_write, ram_offset);
     } else if (!entry->lock) {
         if (!entry->vaddr_base || entry->paddr_index != address_index ||
                 entry->size != cache_size ||
@@ -348,7 +404,7 @@ tryagain:
                     test_bit_size >> XC_PAGE_SHIFT,
                     entry->valid_mapping)) {
             xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy,
-                             ram_offset);
+                             grant, is_write, ram_offset);
         }
     }
 
@@ -399,12 +455,26 @@ uint8_t *xen_map_cache(MemoryRegion *mr,
                        uint8_t lock, bool dma,
                        bool is_write)
 {
+    bool grant = xen_mr_is_grants(mr);
+    MapCache *mc = grant ? mapcache_grants : mapcache;
     uint8_t *p;
 
-    mapcache_lock(mapcache);
-    p = xen_map_cache_unlocked(mapcache, phys_addr, size, ram_addr_offset,
-                               lock, dma, is_write);
-    mapcache_unlock(mapcache);
+    if (grant && !lock) {
+        /*
+         * Grants are only supported via address_space_map(). Anything
+         * else is considered a user/guest error.
+         *
+         * QEMU generally doesn't expect these mappings to ever fail, so
+         * if this happens we report an error message and abort().
+         */
+        error_report("Tried to access a grant reference without mapping it.");
+        abort();
+    }
+
+    mapcache_lock(mc);
+    p = xen_map_cache_unlocked(mc, phys_addr, size, ram_addr_offset,
+                               lock, dma, grant, is_write);
+    mapcache_unlock(mc);
     return p;
 }
 
@@ -449,7 +519,14 @@ static ram_addr_t xen_ram_addr_from_mapcache_single(MapCache *mc, void *ptr)
 
 ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
 {
-    return xen_ram_addr_from_mapcache_single(mapcache, ptr);
+    ram_addr_t addr;
+
+    addr = xen_ram_addr_from_mapcache_single(mapcache, ptr);
+    if (addr == RAM_ADDR_INVALID) {
+        addr = xen_ram_addr_from_mapcache_single(mapcache_grants, ptr);
+    }
+
+    return addr;
 }
 
 static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
@@ -460,6 +537,7 @@ static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
     hwaddr paddr_index;
     hwaddr size;
     int found = 0;
+    int rc;
 
     QTAILQ_FOREACH(reventry, &mc->locked_entries, next) {
         if (reventry->vaddr_req == buffer) {
@@ -502,7 +580,14 @@ static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
     }
 
     ram_block_notify_remove(entry->vaddr_base, entry->size, entry->size);
-    if (munmap(entry->vaddr_base, entry->size) != 0) {
+    if (entry->flags & XEN_MAPCACHE_ENTRY_GRANT) {
+        rc = xengnttab_unmap(xen_region_gnttabdev, entry->vaddr_base,
+                             entry->size >> mc->bucket_shift);
+    } else {
+        rc = munmap(entry->vaddr_base, entry->size);
+    }
+
+    if (rc) {
         perror("unmap fails");
         exit(-1);
     }
@@ -521,14 +606,24 @@ typedef struct XenMapCacheData {
     uint8_t *buffer;
 } XenMapCacheData;
 
+static void xen_invalidate_map_cache_entry_single(MapCache *mc, uint8_t *buffer)
+{
+    mapcache_lock(mc);
+    xen_invalidate_map_cache_entry_unlocked(mc, buffer);
+    mapcache_unlock(mc);
+}
+
+static void xen_invalidate_map_cache_entry_all(uint8_t *buffer)
+{
+    xen_invalidate_map_cache_entry_single(mapcache, buffer);
+    xen_invalidate_map_cache_entry_single(mapcache_grants, buffer);
+}
+
 static void xen_invalidate_map_cache_entry_bh(void *opaque)
 {
     XenMapCacheData *data = opaque;
 
-    mapcache_lock(mapcache);
-    xen_invalidate_map_cache_entry_unlocked(mapcache, data->buffer);
-    mapcache_unlock(mapcache);
-
+    xen_invalidate_map_cache_entry_all(data->buffer);
     aio_co_wake(data->co);
 }
 
@@ -543,9 +638,7 @@ void coroutine_mixed_fn xen_invalidate_map_cache_entry(uint8_t *buffer)
                                 xen_invalidate_map_cache_entry_bh, &data);
         qemu_coroutine_yield();
     } else {
-        mapcache_lock(mapcache);
-        xen_invalidate_map_cache_entry_unlocked(mapcache, buffer);
-        mapcache_unlock(mapcache);
+        xen_invalidate_map_cache_entry_all(buffer);
     }
 }
 
@@ -597,6 +690,7 @@ void xen_invalidate_map_cache(void)
     bdrv_drain_all();
 
     xen_invalidate_map_cache_single(mapcache);
+    xen_invalidate_map_cache_single(mapcache_grants);
 }
 
 static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
@@ -632,13 +726,16 @@ static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
         return NULL;
     }
 
+    assert((entry->flags & XEN_MAPCACHE_ENTRY_GRANT) == 0);
+
     address_index  = new_phys_addr >> mc->bucket_shift;
     address_offset = new_phys_addr & (mc->bucket_size - 1);
 
     trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phys_addr);
 
     xen_remap_bucket(mc, entry, entry->vaddr_base,
-                     cache_size, address_index, false, old_phys_addr);
+                     cache_size, address_index, false,
+                     false, false, old_phys_addr);
     if (!test_bits(address_offset >> XC_PAGE_SHIFT,
                 test_bit_size >> XC_PAGE_SHIFT,
                 entry->valid_mapping)) {
diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 65a51aac2e..3d796235dc 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -16,6 +16,7 @@
 #include <xen/hvm/ioreq.h>
 
 extern MemoryRegion xen_memory;
+extern MemoryRegion xen_grants;
 extern MemoryListener xen_io_listener;
 extern DeviceListener xen_device_listener;
 
@@ -29,6 +30,8 @@ extern DeviceListener xen_device_listener;
     do { } while (0)
 #endif
 
+#define XEN_GRANT_ADDR_OFF (1ULL << 63)
+
 static inline uint32_t xen_vcpu_eport(shared_iopage_t *shared_page, int i)
 {
     return shared_page->vcpu_ioreq[i].vp_eport;
diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
index dc72f83bcb..19dccf4d71 100644
--- a/include/sysemu/xen.h
+++ b/include/sysemu/xen.h
@@ -35,6 +35,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
                    struct MemoryRegion *mr, Error **errp);
 
 bool xen_mr_is_memory(MemoryRegion *mr);
+bool xen_mr_is_grants(MemoryRegion *mr);
 
 #else /* !CONFIG_XEN_IS_POSSIBLE */
 
@@ -55,6 +56,12 @@ static inline bool xen_mr_is_memory(MemoryRegion *mr)
     return false;
 }
 
+static inline bool xen_mr_is_grants(MemoryRegion *mr)
+{
+    g_assert_not_reached();
+    return false;
+}
+
 #endif /* CONFIG_XEN_IS_POSSIBLE */
 
 #endif
-- 
2.40.1


