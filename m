Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBC6278077
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 08:20:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLh63-0006L7-Hk; Fri, 25 Sep 2020 06:20:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ocWZ=DC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kLh62-0006JE-RK
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 06:20:42 +0000
X-Inumbo-ID: 125fdf91-0a91-4c58-ab05-d9d3cc9008a3
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 125fdf91-0a91-4c58-ab05-d9d3cc9008a3;
 Fri, 25 Sep 2020 06:20:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601014836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RxQT5GqxULjW+/bO7Bu3gT13lS41GQ9AYZk6ZaY5Fi4=;
 b=KtgBsfE+AkTJeIv5EA3uFNN9Go+plt45vECVpm7m/CZAiB/1FaeiRISGwOPT+xDMrDCgLJ
 CWvF/kOHGYjvZL0OzcEwbMRgg+EgrrwkDlTf/ciplWgXRWLgVaEC7BNgiRnlcwUNZpFjKF
 5nTFgQ0AftoXZOzs3btkB9SeFDdDBuE=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 876C2B12F;
 Fri, 25 Sep 2020 06:20:36 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 3/3] tools/lixenguest: hide struct elf_dom_parms layout
 from users
Date: Fri, 25 Sep 2020 08:20:31 +0200
Message-Id: <20200925062031.12200-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200925062031.12200-1-jgross@suse.com>
References: <20200925062031.12200-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Don't include struct elf_dom_parms in struct xc_dom_image, but rather
use a pointer to reference it. Together with adding accessor functions
for the externally needed elements this enables to drop including the
Xen private header xen/libelf/libelf.h from xenguest.h.

Fixes: 7e0165c19387 ("tools/libxc: untangle libxenctrl from libxenguest")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/grub/kexec.c                | 18 +++---
 tools/libs/guest/include/xenguest.h | 29 +++-------
 tools/libs/guest/xg_dom_core.c      | 85 +++++++++++++++++++++++------
 tools/libs/guest/xg_private.h       |  1 +
 tools/libxl/libxl_x86_acpi.c        |  5 +-
 5 files changed, 88 insertions(+), 50 deletions(-)

diff --git a/stubdom/grub/kexec.c b/stubdom/grub/kexec.c
index e9a69d2a32..3da80b5b4a 100644
--- a/stubdom/grub/kexec.c
+++ b/stubdom/grub/kexec.c
@@ -222,6 +222,7 @@ void kexec(void *kernel, long kernel_size, void *module, long module_size, char
     char features[] = "";
     struct mmu_update *m2p_updates;
     unsigned long nr_m2p_updates;
+    uint64_t virt_base;
 
     DEBUG("booting with cmdline %s\n", cmdline);
     xc_handle = xc_interface_open(0,0,0);
@@ -294,10 +295,11 @@ void kexec(void *kernel, long kernel_size, void *module, long module_size, char
         goto out;
     }
 
+    virt_base = xc_dom_virt_base(dom);
     /* copy hypercall page */
     /* TODO: domctl instead, but requires privileges */
-    if (dom->parms.virt_hypercall != -1) {
-        pfn = PHYS_PFN(dom->parms.virt_hypercall - dom->parms.virt_base);
+    if (xc_dom_virt_hypercall(dom) != -1) {
+        pfn = PHYS_PFN(xc_dom_virt_hypercall(dom) - virt_base);
         memcpy((void *) pages[pfn], hypercall_page, PAGE_SIZE);
     }
 
@@ -313,11 +315,11 @@ void kexec(void *kernel, long kernel_size, void *module, long module_size, char
     /* Move current console, xenstore and boot MFNs to the allocated place */
     do_exchange(dom, dom->console_pfn, start_info.console.domU.mfn);
     do_exchange(dom, dom->xenstore_pfn, start_info.store_mfn);
-    DEBUG("virt base at %llx\n", dom->parms.virt_base);
+    DEBUG("virt base at %llx\n", virt_base);
     DEBUG("bootstack_pfn %lx\n", dom->bootstack_pfn);
-    _boot_target = dom->parms.virt_base + PFN_PHYS(dom->bootstack_pfn);
+    _boot_target = virt_base + PFN_PHYS(dom->bootstack_pfn);
     DEBUG("_boot_target %lx\n", _boot_target);
-    do_exchange(dom, PHYS_PFN(_boot_target - dom->parms.virt_base),
+    do_exchange(dom, PHYS_PFN(_boot_target - virt_base),
             virt_to_mfn(&_boot_page));
 
     if ( dom->arch_hooks->setup_pgtables )
@@ -373,13 +375,13 @@ void kexec(void *kernel, long kernel_size, void *module, long module_size, char
     _boot_oldpdmfn = virt_to_mfn(start_info.pt_base);
     DEBUG("boot old pd mfn %lx\n", _boot_oldpdmfn);
     DEBUG("boot pd virt %lx\n", dom->pgtables_seg.vstart);
-    _boot_pdmfn = dom->pv_p2m[PHYS_PFN(dom->pgtables_seg.vstart - dom->parms.virt_base)];
+    _boot_pdmfn = dom->pv_p2m[PHYS_PFN(dom->pgtables_seg.vstart - virt_base)];
     DEBUG("boot pd mfn %lx\n", _boot_pdmfn);
     _boot_stack = _boot_target + PAGE_SIZE;
     DEBUG("boot stack %lx\n", _boot_stack);
-    _boot_start_info = dom->parms.virt_base + PFN_PHYS(dom->start_info_pfn);
+    _boot_start_info = virt_base + PFN_PHYS(dom->start_info_pfn);
     DEBUG("boot start info %lx\n", _boot_start_info);
-    _boot_start = dom->parms.virt_entry;
+    _boot_start = xc_dom_virt_entry(dom);
     DEBUG("boot start %lx\n", _boot_start);
 
     /* Keep only useful entries */
diff --git a/tools/libs/guest/include/xenguest.h b/tools/libs/guest/include/xenguest.h
index dba6a21643..a9984dbea5 100644
--- a/tools/libs/guest/include/xenguest.h
+++ b/tools/libs/guest/include/xenguest.h
@@ -22,8 +22,6 @@
 #ifndef XENGUEST_H
 #define XENGUEST_H
 
-#include <xen/libelf/libelf.h>
-
 #define XC_NUMA_NO_NODE   (~0U)
 
 #define XCFLAGS_LIVE      (1 << 0)
@@ -109,7 +107,7 @@ struct xc_dom_image {
     uint32_t f_requested[XENFEAT_NR_SUBMAPS];
 
     /* info from (elf) kernel image */
-    struct elf_dom_parms parms;
+    struct elf_dom_parms *parms;
     char *guest_type;
 
     /* memory layout */
@@ -390,6 +388,13 @@ void *xc_dom_pfn_to_ptr_retcount(struct xc_dom_image *dom, xen_pfn_t first,
                                  xen_pfn_t count, xen_pfn_t *count_out);
 void xc_dom_unmap_one(struct xc_dom_image *dom, xen_pfn_t pfn);
 void xc_dom_unmap_all(struct xc_dom_image *dom);
+void *xc_dom_vaddr_to_ptr(struct xc_dom_image *dom,
+                          xen_vaddr_t vaddr, size_t *safe_region_out);
+uint64_t xc_dom_virt_base(struct xc_dom_image *dom);
+uint64_t xc_dom_virt_entry(struct xc_dom_image *dom);
+uint64_t xc_dom_virt_hypercall(struct xc_dom_image *dom);
+char *xc_dom_guest_os(struct xc_dom_image *dom);
+bool xc_dom_feature_get(struct xc_dom_image *dom, unsigned int nr);
 
 static inline void *xc_dom_seg_to_ptr_pages(struct xc_dom_image *dom,
                                       struct xc_dom_seg *seg,
@@ -411,24 +416,6 @@ static inline void *xc_dom_seg_to_ptr(struct xc_dom_image *dom,
     return xc_dom_seg_to_ptr_pages(dom, seg, &dummy);
 }
 
-static inline void *xc_dom_vaddr_to_ptr(struct xc_dom_image *dom,
-                                        xen_vaddr_t vaddr,
-                                        size_t *safe_region_out)
-{
-    unsigned int page_size = XC_DOM_PAGE_SIZE(dom);
-    xen_pfn_t page = (vaddr - dom->parms.virt_base) / page_size;
-    unsigned int offset = (vaddr - dom->parms.virt_base) % page_size;
-    xen_pfn_t safe_region_count;
-    void *ptr;
-
-    *safe_region_out = 0;
-    ptr = xc_dom_pfn_to_ptr_retcount(dom, page, 0, &safe_region_count);
-    if ( ptr == NULL )
-        return ptr;
-    *safe_region_out = (safe_region_count << XC_DOM_PAGE_SHIFT(dom)) - offset;
-    return ptr + offset;
-}
-
 static inline xen_pfn_t xc_dom_p2m(struct xc_dom_image *dom, xen_pfn_t pfn)
 {
     if ( xc_dom_translated(dom) )
diff --git a/tools/libs/guest/xg_dom_core.c b/tools/libs/guest/xg_dom_core.c
index c0d4a0aa2f..f846d8e1ed 100644
--- a/tools/libs/guest/xg_dom_core.c
+++ b/tools/libs/guest/xg_dom_core.c
@@ -735,6 +735,7 @@ void xc_dom_release(struct xc_dom_image *dom)
         xc_dom_unmap_all(dom);
     xc_dom_free_all(dom);
     free(dom->arch_private);
+    free(dom->parms);
     free(dom);
 }
 
@@ -753,6 +754,12 @@ struct xc_dom_image *xc_dom_allocate(xc_interface *xch,
     memset(dom, 0, sizeof(*dom));
     dom->xch = xch;
 
+    dom->parms = malloc(sizeof(*dom->parms));
+    if (!dom->parms)
+        goto err;
+    memset(dom->parms, 0, sizeof(*dom->parms));
+    dom->alloc_malloc += sizeof(*dom->parms);
+
     dom->max_kernel_size = XC_DOM_DECOMPRESS_MAX;
     dom->max_module_size = XC_DOM_DECOMPRESS_MAX;
     dom->max_devicetree_size = XC_DOM_DECOMPRESS_MAX;
@@ -762,12 +769,12 @@ struct xc_dom_image *xc_dom_allocate(xc_interface *xch,
     if ( features )
         elf_xen_parse_features(features, dom->f_requested, NULL);
 
-    dom->parms.virt_base = UNSET_ADDR;
-    dom->parms.virt_entry = UNSET_ADDR;
-    dom->parms.virt_hypercall = UNSET_ADDR;
-    dom->parms.virt_hv_start_low = UNSET_ADDR;
-    dom->parms.elf_paddr_offset = UNSET_ADDR;
-    dom->parms.p2m_base = UNSET_ADDR;
+    dom->parms->virt_base = UNSET_ADDR;
+    dom->parms->virt_entry = UNSET_ADDR;
+    dom->parms->virt_hypercall = UNSET_ADDR;
+    dom->parms->virt_hv_start_low = UNSET_ADDR;
+    dom->parms->elf_paddr_offset = UNSET_ADDR;
+    dom->parms->p2m_base = UNSET_ADDR;
 
     dom->flags = SIF_VIRT_P2M_4TOOLS;
 
@@ -920,8 +927,8 @@ int xc_dom_parse_image(struct xc_dom_image *dom)
     for ( i = 0; i < XENFEAT_NR_SUBMAPS; i++ )
     {
         dom->f_active[i] |= dom->f_requested[i]; /* cmd line */
-        dom->f_active[i] |= dom->parms.f_required[i]; /* kernel   */
-        if ( (dom->f_active[i] & dom->parms.f_supported[i]) !=
+        dom->f_active[i] |= dom->parms->f_required[i]; /* kernel   */
+        if ( (dom->f_active[i] & dom->parms->f_supported[i]) !=
              dom->f_active[i] )
         {
             xc_dom_panic(dom->xch, XC_INVALID_PARAM,
@@ -1142,8 +1149,8 @@ int xc_dom_build_image(struct xc_dom_image *dom)
         goto err;
     }
     page_size = XC_DOM_PAGE_SIZE(dom);
-    if ( dom->parms.virt_base != UNSET_ADDR )
-        dom->virt_alloc_end = dom->parms.virt_base;
+    if ( dom->parms->virt_base != UNSET_ADDR )
+        dom->virt_alloc_end = dom->parms->virt_base;
 
     /* load kernel */
     if ( xc_dom_alloc_segment(dom, &dom->kernel_seg, "kernel",
@@ -1157,7 +1164,7 @@ int xc_dom_build_image(struct xc_dom_image *dom)
     /* Don't load ramdisk / other modules now if no initial mapping required. */
     for ( mod = 0; mod < dom->num_modules; mod++ )
     {
-        unmapped_initrd = (dom->parms.unmapped_initrd &&
+        unmapped_initrd = (dom->parms->unmapped_initrd &&
                            !dom->modules[mod].seg.vstart);
 
         if ( dom->modules[mod].blob && !unmapped_initrd )
@@ -1199,10 +1206,10 @@ int xc_dom_build_image(struct xc_dom_image *dom)
 
     /* allocate other pages */
     if ( !dom->arch_hooks->p2m_base_supported ||
-         dom->parms.p2m_base >= dom->parms.virt_base ||
-         (dom->parms.p2m_base & (XC_DOM_PAGE_SIZE(dom) - 1)) )
-        dom->parms.p2m_base = UNSET_ADDR;
-    if ( dom->arch_hooks->alloc_p2m_list && dom->parms.p2m_base == UNSET_ADDR &&
+         dom->parms->p2m_base >= dom->parms->virt_base ||
+         (dom->parms->p2m_base & (XC_DOM_PAGE_SIZE(dom) - 1)) )
+        dom->parms->p2m_base = UNSET_ADDR;
+    if ( dom->arch_hooks->alloc_p2m_list && dom->parms->p2m_base == UNSET_ADDR &&
          dom->arch_hooks->alloc_p2m_list(dom) != 0 )
         goto err;
     if ( dom->arch_hooks->alloc_magic_pages(dom) != 0 )
@@ -1228,7 +1235,7 @@ int xc_dom_build_image(struct xc_dom_image *dom)
 
     for ( mod = 0; mod < dom->num_modules; mod++ )
     {
-        unmapped_initrd = (dom->parms.unmapped_initrd &&
+        unmapped_initrd = (dom->parms->unmapped_initrd &&
                            !dom->modules[mod].seg.vstart);
 
         /* Load ramdisk / other modules if no initial mapping required. */
@@ -1247,11 +1254,11 @@ int xc_dom_build_image(struct xc_dom_image *dom)
     }
 
     /* Allocate p2m list if outside of initial kernel mapping. */
-    if ( dom->arch_hooks->alloc_p2m_list && dom->parms.p2m_base != UNSET_ADDR )
+    if ( dom->arch_hooks->alloc_p2m_list && dom->parms->p2m_base != UNSET_ADDR )
     {
         if ( dom->arch_hooks->alloc_p2m_list(dom) != 0 )
             goto err;
-        dom->p2m_seg.vstart = dom->parms.p2m_base;
+        dom->p2m_seg.vstart = dom->parms->p2m_base;
     }
 
     return 0;
@@ -1260,6 +1267,48 @@ int xc_dom_build_image(struct xc_dom_image *dom)
     return -1;
 }
 
+void *xc_dom_vaddr_to_ptr(struct xc_dom_image *dom,
+                          xen_vaddr_t vaddr, size_t *safe_region_out)
+{
+    unsigned int page_size = XC_DOM_PAGE_SIZE(dom);
+    xen_pfn_t page = (vaddr - dom->parms->virt_base) / page_size;
+    unsigned int offset = (vaddr - dom->parms->virt_base) % page_size;
+    xen_pfn_t safe_region_count;
+    void *ptr;
+
+    *safe_region_out = 0;
+    ptr = xc_dom_pfn_to_ptr_retcount(dom, page, 0, &safe_region_count);
+    if ( ptr == NULL )
+        return ptr;
+    *safe_region_out = (safe_region_count << XC_DOM_PAGE_SHIFT(dom)) - offset;
+    return ptr + offset;
+}
+
+uint64_t xc_dom_virt_base(struct xc_dom_image *dom)
+{
+    return dom->parms->virt_base;
+}
+
+uint64_t xc_dom_virt_entry(struct xc_dom_image *dom)
+{
+    return dom->parms->virt_entry;
+}
+
+uint64_t xc_dom_virt_hypercall(struct xc_dom_image *dom)
+{
+    return dom->parms->virt_hypercall;
+}
+
+char *xc_dom_guest_os(struct xc_dom_image *dom)
+{
+    return dom->parms->guest_os;
+}
+
+bool xc_dom_feature_get(struct xc_dom_image *dom, unsigned int nr)
+{
+    return elf_xen_feature_get(nr, dom->parms->f_supported);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index 9940d554ef..fee3191cd4 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -31,6 +31,7 @@
 
 #include <xen/memory.h>
 #include <xen/elfnote.h>
+#include <xen/libelf/libelf.h>
 
 #ifndef ELFSIZE
 #include <limits.h>
diff --git a/tools/libxl/libxl_x86_acpi.c b/tools/libxl/libxl_x86_acpi.c
index 1a4e9e98de..3eca1c7a9f 100644
--- a/tools/libxl/libxl_x86_acpi.c
+++ b/tools/libxl/libxl_x86_acpi.c
@@ -220,9 +220,8 @@ int libxl__dom_load_acpi(libxl__gc *gc,
      * and so we need to put RSDP in location that can be discovered by ACPI's
      * standard search method, in R-O BIOS memory (we chose last 64 bytes)
      */
-    if (strcmp(dom->parms.guest_os, "linux") ||
-        elf_xen_feature_get(XENFEAT_linux_rsdp_unrestricted,
-                            dom->parms.f_supported))
+    if (strcmp(xc_dom_guest_os(dom), "linux") ||
+        xc_dom_feature_get(dom, XENFEAT_linux_rsdp_unrestricted))
         dom->acpi_modules[0].guest_addr_out = ACPI_INFO_PHYSICAL_ADDRESS +
             (1 + acpi_pages_num) * libxl_ctxt.page_size;
     else
-- 
2.26.2


