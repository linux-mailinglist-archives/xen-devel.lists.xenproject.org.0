Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA1D9BA1C0
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 18:37:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829615.1244633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7I4A-0002is-Bj; Sat, 02 Nov 2024 17:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829615.1244633; Sat, 02 Nov 2024 17:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7I4A-0002cE-7U; Sat, 02 Nov 2024 17:37:38 +0000
Received: by outflank-mailman (input) for mailman id 829615;
 Sat, 02 Nov 2024 17:37:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7HuT-0005zO-Mk
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 17:27:37 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bea09c15-993f-11ef-a0c5-8be0dac302b0;
 Sat, 02 Nov 2024 18:27:34 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730568372958973.0588263222835;
 Sat, 2 Nov 2024 10:26:12 -0700 (PDT)
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
X-Inumbo-ID: bea09c15-993f-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJlYTA5YzE1LTk5M2YtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNTY4NDU1LjAyOTYyOSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730568383; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OMPoFSoueO83CWAIaqTMkpDlMSMCtn2hOusrNcYNXQl3sNtsC4QKoLbKUzNQJKFY/oUofmA2IS4rPE7/5d3LFEGx8g3MjuGq8SFEFMzjYM/duefSMXfqJ6SDUTMdjpD7Y+/VhbaKxUyp9ETOdqPkUlLI+sKy1dhXMcQ9wXT1QRs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730568383; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vCeE70zl4N0GlCwS3QvCnOR8vYrFq8AHq0hy/S+7yQ0=; 
	b=oA2STv2bb9th+YTZ13EEEWc+pQFXqFd8raWxDgm1wcq3t7++2MflaXS5pmFXaXLfx/uaFAWfmkli9Nn0dVYHTADR7D129/Rzkn6DrJsn0CDgjQjgumUtov62ueWyaCOjf5nvOhXLvxOOUyvwrOkJqqafwbW2S8+v7UJCw+fstco=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730568383;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=vCeE70zl4N0GlCwS3QvCnOR8vYrFq8AHq0hy/S+7yQ0=;
	b=S8fnDq3uPgVq4fEhPI629C6RAwGc1s64AkEoF7lmvZc1+qoW5I6SUc7zyiDzLKlZ
	Ak0WkIfciMSYBgq5Z0eqsu3ViRcJkIVzQh9/x2I0rDc+PinmAhc5lKwWD3ZM1KRS6E9
	J1cylnVi4OjPuEOe+UzPd+uheLos2B3NsXS9k8sw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 09/12] x86/boot: add start and size fields to struct boot_module
Date: Sat,  2 Nov 2024 13:25:48 -0400
Message-Id: <20241102172551.17233-10-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241102172551.17233-1-dpsmith@apertussolutions.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce the start and size fields to struct boot_module and
assigns their value during boot_info construction. All uses of module_t to get
the address and size of a module are replaced with start and size.

The EFI entry point is a special case, as the EFI file loading boot service may
load a file beyond the 4G barrier. As a result, to make the address fit in the
32bit integer used by the MB1 module_t structure, the frame number is stored in
mod_start and size in mod_end. Until the EFI entry point is enlightened to work
with boot_info and boot_module, multiboot_fill_boot_info will handle the
alternate values in mod_start and mod_end when EFI is detected.

A result of the switch to start/size removes all uses of the mod field in
struct boot_modules, along with the uses of bootstra_map() and release_module()
functions. With all usage gone, they all are dropped here.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
--
Changes since v7:
- add the start/size change to bootstrap_map_bm()
- convert all BM start/size when introduced, consolidates:
    x86/boot: populate boot module for xen entry
    x86/boot: transition relocation calculations to struct boot_module
- consolidates all the removal commits

Changes since v6:
- put the efi conversion for mod_start and mod_end back along with check
- dropped unnecessary cast
- updated the population of start and size fields to take into account efi

Changes since v5:
- switched EFI population of mod_start/mod_end to addresses

a#    edit 336ac1fc0019 x86/boot: introduce boot domain
---
 xen/arch/x86/cpu/microcode/core.c   |   8 +--
 xen/arch/x86/hvm/dom0_build.c       |   6 +-
 xen/arch/x86/include/asm/bootinfo.h |   6 +-
 xen/arch/x86/include/asm/setup.h    |   2 -
 xen/arch/x86/pv/dom0_build.c        |  17 ++---
 xen/arch/x86/setup.c                | 100 ++++++++++++----------------
 xen/xsm/xsm_policy.c                |   4 +-
 7 files changed, 64 insertions(+), 79 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 349e857f539a..891e6d29c7f4 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -726,8 +726,8 @@ static int __init cf_check microcode_init_cache(void)
         /* early_microcode_load() didn't leave us any work to do. */
         return 0;
 
-    size = bi->mods[early_mod_idx].mod->mod_end;
-    data = __mfn_to_virt(bi->mods[early_mod_idx].mod->mod_start);
+    size = bi->mods[early_mod_idx].size;
+    data = __va(bi->mods[early_mod_idx].start);
 
     /*
      * If opt_scan is set, we're looking for a CPIO archive rather than a raw
@@ -799,7 +799,7 @@ static int __init early_microcode_load(struct boot_info *bi)
             struct boot_module *bm = &bi->mods[idx];
             struct cpio_data cd;
 
-            size = bm->mod->mod_end;
+            size = bm->size;
             data = bootstrap_map_bm(bm);
             if ( !data )
             {
@@ -849,7 +849,7 @@ static int __init early_microcode_load(struct boot_info *bi)
         }
         bi->mods[idx].type = BOOTMOD_MICROCODE;
 
-        size = bi->mods[idx].mod->mod_end;
+        size = bi->mods[idx].size;
         data = bootstrap_map_bm(&bi->mods[idx]);
         if ( !data )
         {
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index cd97f94a168a..e74684f10b12 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -649,8 +649,8 @@ static int __init pvh_load_kernel(
 {
     void *image_base = bootstrap_map_bm(image);
     void *image_start = image_base + image->headroom;
-    unsigned long image_len = image->mod->mod_end;
-    unsigned long initrd_len = initrd ? initrd->mod->mod_end : 0;
+    unsigned long image_len = image->size;
+    unsigned long initrd_len = initrd ? initrd->size : 0;
     const char *cmdline = __va(image->cmdline_pa);
     struct elf_binary elf;
     struct elf_dom_parms parms;
@@ -729,7 +729,7 @@ static int __init pvh_load_kernel(
     if ( initrd != NULL )
     {
         rc = hvm_copy_to_guest_phys(
-            last_addr, mfn_to_virt(initrd->mod->mod_start), initrd_len, v);
+            last_addr, __va(initrd->start), initrd_len, v);
         if ( rc )
         {
             printk("Unable to copy initrd to guest\n");
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 819c8224d715..a5ee90a36607 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -25,9 +25,6 @@ enum bootmod_type {
 };
 
 struct boot_module {
-    /* Transitionary only */
-    module_t *mod;
-
     enum bootmod_type type;
 
     /*
@@ -61,6 +58,9 @@ struct boot_module {
     bool released:1;
 
     paddr_t cmdline_pa;
+
+    paddr_t start;
+    size_t size;
 };
 
 /*
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 1e23f55be51b..0591847c57e6 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -35,11 +35,9 @@ void setup_io_bitmap(struct domain *d);
 extern struct boot_info xen_boot_info;
 
 unsigned long initial_images_nrpages(nodeid_t node);
-void release_module(const module_t *m, bool mapped);
 
 struct boot_module;
 void *bootstrap_map_bm(const struct boot_module *bm);
-void *bootstrap_map(const module_t *mod);
 void bootstrap_unmap(void);
 void release_boot_module(struct boot_module *bm, bool mapped);
 
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 594874cd8d85..5efc650eeff0 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -420,7 +420,7 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
 
     image = &bi->mods[i];
     image_base = bootstrap_map_bm(image);
-    image_len = image->mod->mod_end;
+    image_len = image->size;
     image_start = image_base + image->headroom;
     cmdline = __va(image->cmdline_pa);
 
@@ -428,7 +428,7 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
     if ( i > 0 || i < bi->nr_modules )
     {
         initrd = &bi->mods[i];
-        initrd_len = initrd->mod->mod_end;
+        initrd_len = initrd->size;
     }
 
     d->max_pages = ~0U;
@@ -630,7 +630,8 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
         initrd_pfn = vinitrd_start ?
                      (vinitrd_start - v_start) >> PAGE_SHIFT :
                      domain_tot_pages(d);
-        initrd_mfn = mfn = initrd->mod->mod_start;
+        initrd_mfn = paddr_to_pfn(initrd->start);
+        mfn = initrd_mfn;
         count = PFN_UP(initrd_len);
         if ( d->arch.physaddr_bitsize &&
              ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
@@ -645,10 +646,10 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
                     free_domheap_pages(page, order);
                     page += 1UL << order;
                 }
-            memcpy(page_to_virt(page), mfn_to_virt(initrd->mod->mod_start),
-                   initrd_len);
+            memcpy(page_to_virt(page), __va(initrd->start), initrd_len);
             release_boot_module(initrd, true);
-            initrd->mod->mod_start = initrd_mfn = mfn_x(page_to_mfn(page));
+            initrd_mfn = mfn_x(page_to_mfn(page));
+            initrd->start = pfn_to_paddr(initrd_mfn);
         }
         else
         {
@@ -670,7 +671,7 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
                nr_pages - domain_tot_pages(d));
     if ( initrd )
     {
-        mpt_alloc = (paddr_t)initrd->mod->mod_start << PAGE_SHIFT;
+        mpt_alloc = initrd->start;
         printk("\n Init. ramdisk: %"PRIpaddr"->%"PRIpaddr,
                mpt_alloc, mpt_alloc + initrd_len);
     }
@@ -897,7 +898,7 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
         if ( pfn >= initrd_pfn )
         {
             if ( pfn < initrd_pfn + PFN_UP(initrd_len) )
-                mfn = initrd->mod->mod_start + (pfn - initrd_pfn);
+                mfn = paddr_to_pfn(initrd->start) + (pfn - initrd_pfn);
             else
                 mfn -= PFN_UP(initrd_len);
         }
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d9785acf89b6..18b93d6a272a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -313,13 +313,29 @@ static struct boot_info *__init multiboot_fill_boot_info(
      */
     for ( i = 0; i < MAX_NR_BOOTMODS && i < bi->nr_modules; i++ )
     {
-        bi->mods[i].mod = &mods[i];
-
         bi->mods[i].cmdline_pa = mods[i].string;
+
+        if ( !efi_enabled(EFI_LOADER) )
+        {
+            /*
+             * The EFI loader gives us modules which are already frame/size.
+             * Switch back to address/size.
+             */
+            bi->mods[i].start = mods[i].mod_start;
+            bi->mods[i].size = mods[i].mod_end - mods[i].mod_start;
+        }
+        else
+        {
+            /*
+             * PVH and BIOS loaders give us modules which are start/end.
+             * Switch to address/size.
+             */
+            bi->mods[i].start = pfn_to_paddr(mods[i].mod_start);
+            bi->mods[i].size = mods[i].mod_end;
+        }
     }
 
     /* Variable 'i' should be one entry past the last module. */
-    bi->mods[i].mod = &mods[bi->nr_modules];
     bi->mods[i].type = BOOTMOD_XEN;
 
     return bi;
@@ -335,8 +351,8 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
     for ( nr = i = 0; i < bi->nr_modules; ++i )
     {
-        unsigned long start = bi->mods[i].mod->mod_start;
-        unsigned long end   = start + PFN_UP(bi->mods[i].mod->mod_end);
+        unsigned long start = bi->mods[i].start;
+        unsigned long end   = start + PFN_UP(bi->mods[i].size);
 
         if ( end > node_start && node_end > start )
             nr += min(node_end, end) - max(node_start, start);
@@ -347,8 +363,8 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
 void __init release_boot_module(struct boot_module *bm, bool free_mem)
 {
-    uint64_t start = pfn_to_paddr(bm->mod->mod_start);
-    uint64_t size  = bm->mod->mod_end;
+    uint64_t start = bm->start;
+    uint64_t size  = bm->size;
 
     if ( bm->released )
     {
@@ -363,18 +379,6 @@ void __init release_boot_module(struct boot_module *bm, bool free_mem)
     bm->released = true;
 }
 
-void __init release_module(const module_t *m, bool free_mem)
-{
-    struct boot_info *bi = &xen_boot_info;
-    unsigned int i;
-
-    for ( i = 0; i < bi->nr_modules; i++ )
-    {
-        if ( bi->mods[i].mod == m )
-            release_boot_module(&bi->mods[i], free_mem);
-    }
-}
-
 static void __init discard_unknown_boot_modules(void)
 {
     struct boot_info *bi = &xen_boot_info;
@@ -509,15 +513,9 @@ static void *__init bootstrap_map_addr(paddr_t start, paddr_t end)
     return ret;
 }
 
-void *__init bootstrap_map(const module_t *mod)
-{
-    return bootstrap_map_addr(pfn_to_paddr(mod->mod_start),
-                              pfn_to_paddr(mod->mod_start) + mod->mod_end);
-}
-
 void *__init bootstrap_map_bm(const struct boot_module *bm)
 {
-    return bootstrap_map(bm->mod);
+    return bootstrap_map_addr(bm->start, bm->start + bm->size);
 }
 
 void __init bootstrap_unmap(void)
@@ -695,8 +693,8 @@ static uint64_t __init consider_modules(
 
     for ( i = 0; i < nr_mods ; ++i )
     {
-        uint64_t start = pfn_to_paddr(mods[i].mod->mod_start);
-        uint64_t end = start + PAGE_ALIGN(mods[i].mod->mod_end);
+        uint64_t start = mods[i].start;
+        uint64_t end = start + PAGE_ALIGN(mods[i].size);
 
         if ( i == this_mod )
             continue;
@@ -1427,13 +1425,9 @@ void asmlinkage __init noreturn __start_xen(void)
     set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
     kexec_reserve_area();
 
-    for ( i = 0; !efi_enabled(EFI_LOADER) && i < bi->nr_modules; i++ )
-    {
-        if ( bi->mods[i].mod->mod_start & (PAGE_SIZE - 1) )
+    for ( i = 0; i < bi->nr_modules; i++ )
+        if ( bi->mods[i].start & (PAGE_SIZE - 1) )
             panic("Bootloader didn't honor module alignment request\n");
-        bi->mods[i].mod->mod_end -= bi->mods[i].mod->mod_start;
-        bi->mods[i].mod->mod_start >>= PAGE_SHIFT;
-    }
 
     /*
      * TODO: load ucode earlier once multiboot modules become accessible
@@ -1452,13 +1446,12 @@ void asmlinkage __init noreturn __start_xen(void)
          * respective reserve_e820_ram() invocation below. No need to
          * query efi_boot_mem_unused() here, though.
          */
-        xen->mod->mod_start = virt_to_mfn(_stext);
-        xen->mod->mod_end   = __2M_rwdata_end - _stext;
+        xen->start = virt_to_maddr(_stext);
+        xen->size  = __2M_rwdata_end - _stext;
     }
 
     bi->mods[0].headroom =
-        bzimage_headroom(bootstrap_map_bm(&bi->mods[0]),
-                         bi->mods[0].mod->mod_end);
+        bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
     bootstrap_unmap();
 
 #ifndef highmem_start
@@ -1539,7 +1532,7 @@ void asmlinkage __init noreturn __start_xen(void)
         for ( j = bi->nr_modules - 1; j >= 0; j-- )
         {
             struct boot_module *bm = &bi->mods[j];
-            unsigned long size = PAGE_ALIGN(bm->headroom + bm->mod->mod_end);
+            unsigned long size = PAGE_ALIGN(bm->headroom + bm->size);
 
             if ( bm->relocated )
                 continue;
@@ -1551,14 +1544,11 @@ void asmlinkage __init noreturn __start_xen(void)
             if ( highmem_start && end > highmem_start )
                 continue;
 
-            if ( s < end &&
-                 (bm->headroom ||
-                  ((end - size) >> PAGE_SHIFT) > bm->mod->mod_start) )
+            if ( s < end && (bm->headroom || (end - size) > bm->start) )
             {
-                move_memory(end - size + bm->headroom,
-                            pfn_to_paddr(bm->mod->mod_start), bm->mod->mod_end);
-                bm->mod->mod_start = (end - size) >> PAGE_SHIFT;
-                bm->mod->mod_end += bm->headroom;
+                move_memory(end - size + bm->headroom, bm->start, bm->size);
+                bm->start = (end - size);
+                bm->size += bm->headroom;
                 bm->relocated = true;
             }
         }
@@ -1589,10 +1579,9 @@ void asmlinkage __init noreturn __start_xen(void)
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        const struct boot_module *bm = &bi->mods[i];
-        uint64_t s = pfn_to_paddr(bm->mod->mod_start);
+        uint64_t s = bi->mods[i].start, l = bi->mods[i].size;
 
-        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(bm->mod->mod_end));
+        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(l));
     }
 
     if ( !xen_phys_start )
@@ -1670,8 +1659,7 @@ void asmlinkage __init noreturn __start_xen(void)
                 map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
                 for ( j = 0; j < bi->nr_modules; ++j )
                 {
-                    uint64_t end = pfn_to_paddr(bi->mods[j].mod->mod_start) +
-                                   bi->mods[j].mod->mod_end;
+                    uint64_t end = bi->mods[j].start + bi->mods[j].size;
 
                     if ( map_e < end )
                         map_e = end;
@@ -1745,13 +1733,11 @@ void asmlinkage __init noreturn __start_xen(void)
 
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        const struct boot_module *bm = &bi->mods[i];
+        unsigned long s = bi->mods[i].start, l = bi->mods[i].size;
 
-        set_pdx_range(bm->mod->mod_start,
-                      bm->mod->mod_start + PFN_UP(bm->mod->mod_end));
-        map_pages_to_xen((unsigned long)mfn_to_virt(bm->mod->mod_start),
-                         _mfn(bm->mod->mod_start),
-                         PFN_UP(bm->mod->mod_end), PAGE_HYPERVISOR);
+        set_pdx_range(paddr_to_pfn(s), paddr_to_pfn(s) + PFN_UP(l));
+        map_pages_to_xen((unsigned long)maddr_to_virt(s), maddr_to_mfn(s),
+                         PFN_UP(l), PAGE_HYPERVISOR);
     }
 
 #ifdef CONFIG_KEXEC
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 12c9de5a1fbf..f8836026f63b 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -43,8 +43,8 @@ int __init xsm_multiboot_policy_init(
     {
         struct boot_module *bm = &bi->mods[i];
 
-        _policy_start = bootstrap_map(bm->mod);
-        _policy_len   = bm->mod->mod_end;
+        _policy_start = bootstrap_map_bm(bm);
+        _policy_len   = bm->size;
 
         if ( (xsm_magic_t)(*_policy_start) == XSM_MAGIC )
         {
-- 
2.30.2


