Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5745E8CD9FC
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 20:30:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728800.1133849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sADCq-00089C-Ih; Thu, 23 May 2024 18:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728800.1133849; Thu, 23 May 2024 18:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sADCq-00086n-FP; Thu, 23 May 2024 18:30:24 +0000
Received: by outflank-mailman (input) for mailman id 728800;
 Thu, 23 May 2024 18:30:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GulG=M2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sADCp-00086e-51
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 18:30:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 824c4d86-1932-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 20:30:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5628F62E8A;
 Thu, 23 May 2024 18:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A444CC2BD10;
 Thu, 23 May 2024 18:30:17 +0000 (UTC)
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
X-Inumbo-ID: 824c4d86-1932-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716489019;
	bh=p7mhyN9fs29kwWMHIpMXBirzQoL/bUd/WKeU53shb4E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gU7MeHrdSslK3iJGZ/ZQb59244nQQgre2s1Gpa/dNeIVPOaGd75MV7S6KHHzL/BY4
	 mGjixWgAU7IGPyXvaKuUI2/7NbuVLXT8S79SsMzXTxznYkWFhr9CLB+5dtQo2JcczR
	 vvGdvHGb1H7/eFthqU7pWuK6RZDYJ0AzBUrmas4zToUStPDrhnim+E45QZ9STfQcLx
	 wCPWmkrJtxXgaICm6rIvJ+zVMNtCM4PKwk20rf+SYGx1hFvvu28CPugJWxxvGsw8b0
	 t6jYOmMrGOq/1EDFUqQU3I2NrQiY+IbywSiDZ+OM45r1Vn4NDOOeldOEUEeHHhtA5c
	 kVXf9r9K2T3lA==
Date: Thu, 23 May 2024 11:30:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
    xen-devel@lists.xenproject.org, qemu-devel@nongnu.org, 
    sstabellini@kernel.org, jgross@suse.com, 
    "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v6 7/8] xen: mapcache: Add support for grant mappings
In-Reply-To: <CAJy5ezqcnoQ=M4H3RkQ69HAie4jNMEQB42f4NSRZUEWU_5=Gkw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405231129590.2557291@ubuntu-linux-20-04-desktop>
References: <20240516154804.1114245-1-edgar.iglesias@gmail.com> <20240516154804.1114245-8-edgar.iglesias@gmail.com> <dxhms.qrh0wkni3yz@linaro.org> <CAJy5ezqcnoQ=M4H3RkQ69HAie4jNMEQB42f4NSRZUEWU_5=Gkw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1340495454-1716489019=:2557291"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1340495454-1716489019=:2557291
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 23 May 2024, Edgar E. Iglesias wrote:
> On Thu, May 23, 2024 at 9:47 AM Manos Pitsidianakis <manos.pitsidianakis@linaro.org> wrote:
>       On Thu, 16 May 2024 18:48, "Edgar E. Iglesias" <edgar.iglesias@gmail.com> wrote:
>       >From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>       >
>       >Add a second mapcache for grant mappings. The mapcache for
>       >grants needs to work with XC_PAGE_SIZE granularity since
>       >we can't map larger ranges than what has been granted to us.
>       >
>       >Like with foreign mappings (xen_memory), machines using grants
>       >are expected to initialize the xen_grants MR and map it
>       >into their address-map accordingly.
>       >
>       >Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>       >Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>       >---
>       > hw/xen/xen-hvm-common.c         |  12 ++-
>       > hw/xen/xen-mapcache.c           | 163 ++++++++++++++++++++++++++------
>       > include/hw/xen/xen-hvm-common.h |   3 +
>       > include/sysemu/xen.h            |   7 ++
>       > 4 files changed, 152 insertions(+), 33 deletions(-)
>       >
>       >diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
>       >index a0a0252da0..b8ace1c368 100644
>       >--- a/hw/xen/xen-hvm-common.c
>       >+++ b/hw/xen/xen-hvm-common.c
>       >@@ -10,12 +10,18 @@
>       > #include "hw/boards.h"
>       > #include "hw/xen/arch_hvm.h"
>       >
>       >-MemoryRegion xen_memory;
>       >+MemoryRegion xen_memory, xen_grants;
>       >
>       >-/* Check for xen memory.  */
>       >+/* Check for any kind of xen memory, foreign mappings or grants.  */
>       > bool xen_mr_is_memory(MemoryRegion *mr)
>       > {
>       >-    return mr == &xen_memory;
>       >+    return mr == &xen_memory || mr == &xen_grants;
>       >+}
>       >+
>       >+/* Check specifically for grants.  */
>       >+bool xen_mr_is_grants(MemoryRegion *mr)
>       >+{
>       >+    return mr == &xen_grants;
>       > }
>       >
>       > void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
>       >diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
>       >index a07c47b0b1..1cbc2aeaa9 100644
>       >--- a/hw/xen/xen-mapcache.c
>       >+++ b/hw/xen/xen-mapcache.c
>       >@@ -14,6 +14,7 @@
>       >
>       > #include <sys/resource.h>
>       >
>       >+#include "hw/xen/xen-hvm-common.h"
>       > #include "hw/xen/xen_native.h"
>       > #include "qemu/bitmap.h"
>       >
>       >@@ -21,6 +22,8 @@
>       > #include "sysemu/xen-mapcache.h"
>       > #include "trace.h"
>       >
>       >+#include <xenevtchn.h>
>       >+#include <xengnttab.h>
>       >
>       > #if HOST_LONG_BITS == 32
>       > #  define MCACHE_MAX_SIZE     (1UL<<31) /* 2GB Cap */
>       >@@ -41,6 +44,7 @@ typedef struct MapCacheEntry {
>       >     unsigned long *valid_mapping;
>       >     uint32_t lock;
>       > #define XEN_MAPCACHE_ENTRY_DUMMY (1 << 0)
>       >+#define XEN_MAPCACHE_ENTRY_GRANT (1 << 1)
> 
>       Might we get more entry kinds in the future? (for example foreign maps).
>       Maybe this could be an enum.
> 
> 
> Perhaps. Foreign mappings are already supported, this flag separates ordinary foreign mappings from grant foreign mappings.
> IMO, since this is not an external interface it's probably better to change it once we have a concrete use-case at hand.
> 
>  
>       >     uint8_t flags;
>       >     hwaddr size;
>       >     struct MapCacheEntry *next;
>       >@@ -71,6 +75,8 @@ typedef struct MapCache {
>       > } MapCache;
>       >
>       > static MapCache *mapcache;
>       >+static MapCache *mapcache_grants;
>       >+static xengnttab_handle *xen_region_gnttabdev;
>       >
>       > static inline void mapcache_lock(MapCache *mc)
>       > {
>       >@@ -131,6 +137,12 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
>       >     unsigned long max_mcache_size;
>       >     unsigned int bucket_shift;
>       >
>       >+    xen_region_gnttabdev = xengnttab_open(NULL, 0);
>       >+    if (xen_region_gnttabdev == NULL) {
>       >+        error_report("mapcache: Failed to open gnttab device");
>       >+        exit(EXIT_FAILURE);
>       >+    }
>       >+
>       >     if (HOST_LONG_BITS == 32) {
>       >         bucket_shift = 16;
>       >     } else {
>       >@@ -159,6 +171,15 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
>       >     mapcache = xen_map_cache_init_single(f, opaque,
>       >                                          bucket_shift,
>       >                                          max_mcache_size);
>       >+
>       >+    /*
>       >+     * Grant mappings must use XC_PAGE_SIZE granularity since we can't
>       >+     * map anything beyond the number of pages granted to us.
>       >+     */
>       >+    mapcache_grants = xen_map_cache_init_single(f, opaque,
>       >+                                                XC_PAGE_SHIFT,
>       >+                                                max_mcache_size);
>       >+
>       >     setrlimit(RLIMIT_AS, &rlimit_as);
>       > }
>       >
>       >@@ -168,17 +189,24 @@ static void xen_remap_bucket(MapCache *mc,
>       >                              hwaddr size,
>       >                              hwaddr address_index,
>       >                              bool dummy,
>       >+                             bool grant,
>       >+                             bool is_write,
>       >                              ram_addr_t ram_offset)
>       > {
>       >     uint8_t *vaddr_base;
>       >-    xen_pfn_t *pfns;
>       >+    uint32_t *refs = NULL;
>       >+    xen_pfn_t *pfns = NULL;
>       >     int *err;
> 
>       You should use g_autofree to perform automatic cleanup on function exit
>       instead of manually freeing, since the allocations should only live
>       within the function call.
> 
> 
> Sounds good, I'll do that in the next version.
> 
>  
>       >     unsigned int i;
>       >     hwaddr nb_pfn = size >> XC_PAGE_SHIFT;
>       >
>       >     trace_xen_remap_bucket(address_index);
>       >
>       >-    pfns = g_new0(xen_pfn_t, nb_pfn);
>       >+    if (grant) {
>       >+        refs = g_new0(uint32_t, nb_pfn);
>       >+    } else {
>       >+        pfns = g_new0(xen_pfn_t, nb_pfn);
>       >+    }
>       >     err = g_new0(int, nb_pfn);
>       >
>       >     if (entry->vaddr_base != NULL) {
>       >@@ -207,21 +235,51 @@ static void xen_remap_bucket(MapCache *mc,
>       >     g_free(entry->valid_mapping);
>       >     entry->valid_mapping = NULL;
>       >
>       >-    for (i = 0; i < nb_pfn; i++) {
>       >-        pfns[i] = (address_index << (mc->bucket_shift - XC_PAGE_SHIFT)) + i;
>       >+    if (grant) {
>       >+        hwaddr grant_base = address_index - (ram_offset >> XC_PAGE_SHIFT);
>       >+
>       >+        for (i = 0; i < nb_pfn; i++) {
>       >+            refs[i] = grant_base + i;
>       >+        }
>       >+    } else {
>       >+        for (i = 0; i < nb_pfn; i++) {
>       >+            pfns[i] = (address_index << (mc->bucket_shift - XC_PAGE_SHIFT)) + i;
>       >+        }
>       >     }
>       >
>       >-    /*
>       >-     * If the caller has requested the mapping at a specific address use
>       >-     * MAP_FIXED to make sure it's honored.
>       >-     */
>       >+    entry->flags &= ~XEN_MAPCACHE_ENTRY_GRANT;
>       >+
>       >     if (!dummy) {
>       >-        vaddr_base = xenforeignmemory_map2(xen_fmem, xen_domid, vaddr,
>       >-                                           PROT_READ | PROT_WRITE,
>       >-                                           vaddr ? MAP_FIXED : 0,
>       >-                                           nb_pfn, pfns, err);
> 
>       Since err is not NULL here, the function might return a valid pointer
>       but individual frames might have failed.
> 
> 
> Yes but AFAICT, the case when some pages fail foreign mapping is handled further down the function (see the valid_mappings bitmap).
> Note that this series isn't really changing this existing behaviour for foreign mappings. In any case, If we spot a bug in existing code,
> I'm happy to fix it.
> 
>  
> 
>       >+        if (grant) {
>       >+            int prot = PROT_READ;
>       >+
>       >+            if (is_write) {
>       >+                prot |= PROT_WRITE;
>       >+            }
>       >+
>       >+            entry->flags |= XEN_MAPCACHE_ENTRY_GRANT;
>       >+            assert(vaddr == NULL);
>       >+            vaddr_base = xengnttab_map_domain_grant_refs(xen_region_gnttabdev,
>       >+                                                         nb_pfn,
>       >+                                                         xen_domid, refs,
>       >+                                                         prot);
>       >+        } else {
>       >+            /*
>       >+             * If the caller has requested the mapping at a specific address use
>       >+             * MAP_FIXED to make sure it's honored.
>       >+             *
>       >+             * We don't yet support upgrading mappings from RO to RW, to handle
>       >+             * models using ordinary address_space_rw(), foreign mappings ignore
>       >+             * is_write and are always mapped RW.
>       >+             */
>       >+            vaddr_base = xenforeignmemory_map2(xen_fmem, xen_domid, vaddr,
>       >+                                               PROT_READ | PROT_WRITE,
>       >+                                               vaddr ? MAP_FIXED : 0,
>       >+                                               nb_pfn, pfns, err);
>       >+        }
>       >         if (vaddr_base == NULL) {
>       >-            perror("xenforeignmemory_map2");
>       >+            perror(grant ? "xengnttab_map_domain_grant_refs"
>       >+                           : "xenforeignmemory_map2");
>       >             exit(-1);
>       >         }
>       >     } else {
>       >@@ -261,6 +319,7 @@ static void xen_remap_bucket(MapCache *mc,
>       >         }
>       >     }
>       >
>       >+    g_free(refs);
>       >     g_free(pfns);
>       >     g_free(err);
>       > }
>       >@@ -268,7 +327,8 @@ static void xen_remap_bucket(MapCache *mc,
>       > static uint8_t *xen_map_cache_unlocked(MapCache *mc,
>       >                                        hwaddr phys_addr, hwaddr size,
>       >                                        ram_addr_t ram_offset,
>       >-                                       uint8_t lock, bool dma, bool is_write)
>       >+                                       uint8_t lock, bool dma,
>       >+                                       bool grant, bool is_write)
>       > {
>       >     MapCacheEntry *entry, *pentry = NULL,
>       >                   *free_entry = NULL, *free_pentry = NULL;
>       >@@ -340,7 +400,7 @@ tryagain:
>       >         entry = g_new0(MapCacheEntry, 1);
>       >         pentry->next = entry;
>       >         xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy,
>       >-                         ram_offset);
>       >+                         grant, is_write, ram_offset);
>       >     } else if (!entry->lock) {
>       >         if (!entry->vaddr_base || entry->paddr_index != address_index ||
>       >                 entry->size != cache_size ||
>       >@@ -348,7 +408,7 @@ tryagain:
>       >                     test_bit_size >> XC_PAGE_SHIFT,
>       >                     entry->valid_mapping)) {
>       >             xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy,
>       >-                             ram_offset);
>       >+                             grant, is_write, ram_offset);
>       >         }
>       >     }
>       >
>       >@@ -399,12 +459,28 @@ uint8_t *xen_map_cache(MemoryRegion *mr,
>       >                        uint8_t lock, bool dma,
>       >                        bool is_write)
>       > {
>       >+    bool grant = xen_mr_is_grants(mr);
>       >+    MapCache *mc = grant ? mapcache_grants : mapcache;
>       >     uint8_t *p;
>       >
>       >-    mapcache_lock(mapcache);
>       >-    p = xen_map_cache_unlocked(mapcache, phys_addr, size, ram_addr_offset,
>       >-                               lock, dma, is_write);
>       >-    mapcache_unlock(mapcache);
>       >+    if (grant) {
>       >+        /*
>       >+         * Grants are only supported via address_space_map(). Anything
>       >+         * else is considered a user/guest error.
>       >+         *
>       >+         * QEMU generally doesn't expect these mappings to ever fail, so
>       >+         * if this happens we report an error message and abort().
>       >+         */
>       >+        if (!lock) {
> 
>       Nested if conditions that can be flattened, i.e. this could be
> 
>       if (grant && !lock)
> 
> 
> 
> Sounds good, will flatten this in the next version.
>  
> 
>       >+            error_report("Trying access a grant reference without mapping it.");
> 
>       s/Trying access a grant/Tried to access a grant/
> 
> 
> Will fix it, thanks!

Please retain my ack
--8323329-1340495454-1716489019=:2557291--

