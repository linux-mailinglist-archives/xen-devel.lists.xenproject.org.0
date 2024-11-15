Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9E59CDFA7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 14:13:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837570.1253507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBw89-0008HO-Pt; Fri, 15 Nov 2024 13:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837570.1253507; Fri, 15 Nov 2024 13:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBw89-0008ED-N5; Fri, 15 Nov 2024 13:12:57 +0000
Received: by outflank-mailman (input) for mailman id 837570;
 Fri, 15 Nov 2024 13:12:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=54cC=SK=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tBw87-0006v7-CX
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 13:12:55 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5044f3bd-a353-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 14:12:51 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1731676335598530.5770613675592;
 Fri, 15 Nov 2024 05:12:15 -0800 (PST)
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
X-Inumbo-ID: 5044f3bd-a353-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjUwNDRmM2JkLWEzNTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjc2MzcxLjM4NzQyOCwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1731676337; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YK4fThjfWMkx7UnS7pUTpgrBac5kNQwQjNGa2TF1XEjZ+nApX7OYRt9eiesEiMLHj5N83yJe4uQ4RoK0bAJpWe3i+UGTcqv9zU8bimccWgI2dyeI3Ls1HfN9+njWiZLfseMMdxl0723KgonHV7yXnjZe+o0UVZ1uQPHuMIc+9ng=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731676337; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lC7UJWnbMWc4RpQfKr8UGN6FjxqhttPxoGHw6Bmoiok=; 
	b=fb0a3fpq/S9A5mkGf0IbAbisZfTPWEy692iO8T2NV9tHSU/lciibLl7AwZD5rGoMrNtqZB1glAB3cdeexdMiJAuoP5wznGERktEp17pAJhx2Z8jQZI/uLN22CQELXbkxKgmCH1YHUXToGRtyQ/HIh+yJjPM1FRSEWWNxoeW8a70=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731676337;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=lC7UJWnbMWc4RpQfKr8UGN6FjxqhttPxoGHw6Bmoiok=;
	b=QMX62pqmtCSqfZm7BiRT9rNSaXG2tKNRwRpTrdPGbcImjUnl6bhWYfs/tDayC4la
	yjrMYxDTg5JRvnh8r7GRZfaNO+WM4rSg5ltmb2KkUiflVVxCe9I/D02wzeUNMR2XiZF
	Cjqv2wVFpU9dVHokHRk4IF4PkhkMGu4sSH2hk2ek=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v9 3/6] x86/boot: add start and size fields to struct boot_module
Date: Fri, 15 Nov 2024 08:12:01 -0500
Message-Id: <20241115131204.32135-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241115131204.32135-1-dpsmith@apertussolutions.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
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
Changes since v8:
- reversed logic for efi case in multiboot_fill_bootinfo()
- corrected missed paddr_to_pfn()

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
---
 xen/arch/x86/cpu/microcode/core.c   |  8 +--
 xen/arch/x86/hvm/dom0_build.c       |  6 +-
 xen/arch/x86/include/asm/bootinfo.h |  6 +-
 xen/arch/x86/include/asm/setup.h    |  1 -
 xen/arch/x86/pv/dom0_build.c        | 15 +++--
 xen/arch/x86/setup.c                | 89 ++++++++++++++---------------
 xen/xsm/xsm_policy.c                |  2 +-
 7 files changed, 60 insertions(+), 67 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index fd4b08b45388..1176d5fbd502 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -709,8 +709,8 @@ static int __init cf_check microcode_init_cache(void)
         /* early_microcode_load() didn't leave us any work to do. */
         return 0;
 
-    size = bi->mods[early_mod_idx].mod->mod_end;
-    data = __mfn_to_virt(bi->mods[early_mod_idx].mod->mod_start);
+    size = bi->mods[early_mod_idx].size;
+    data = __va(bi->mods[early_mod_idx].start);
 
     /*
      * If opt_scan is set, we're looking for a CPIO archive rather than a raw
@@ -786,7 +786,7 @@ static int __init early_microcode_load(struct boot_info *bi)
                  bm->type != BOOTMOD_RAMDISK )
                 continue;
 
-            size = bm->mod->mod_end;
+            size = bm->size;
             data = bootstrap_map_bm(bm);
             if ( !data )
             {
@@ -840,7 +840,7 @@ static int __init early_microcode_load(struct boot_info *bi)
         }
         bi->mods[idx].type = BOOTMOD_MICROCODE;
 
-        size = bi->mods[idx].mod->mod_end;
+        size = bi->mods[idx].size;
         data = bootstrap_map_bm(&bi->mods[idx]);
         if ( !data )
         {
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index d1410e1a02b0..0bd1e4277bff 100644
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
@@ -727,7 +727,7 @@ static int __init pvh_load_kernel(
     if ( initrd != NULL )
     {
         rc = hvm_copy_to_guest_phys(
-            last_addr, mfn_to_virt(initrd->mod->mod_start), initrd_len, v);
+            last_addr, __va(initrd->start), initrd_len, v);
         if ( rc )
         {
             printk("Unable to copy initrd to guest\n");
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index f76876386763..f8b422913063 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -26,9 +26,6 @@ enum bootmod_type {
 };
 
 struct boot_module {
-    /* Transitionary only */
-    module_t *mod;
-
     enum bootmod_type type;
 
     /*
@@ -62,6 +59,9 @@ struct boot_module {
     unsigned long headroom;
 
     paddr_t cmdline_pa;
+
+    paddr_t start;
+    size_t size;
 };
 
 /*
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 4ad493637892..5c2391a8684b 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -38,7 +38,6 @@ void free_boot_modules(void);
 
 struct boot_module;
 void *bootstrap_map_bm(const struct boot_module *bm);
-void *bootstrap_map(const module_t *mod);
 void bootstrap_unmap(void);
 
 void release_boot_module(struct boot_module *bm);
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 2580162f3df4..09df12dce694 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -421,7 +421,7 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
 
     image = &bi->mods[i];
     image_base = bootstrap_map_bm(image);
-    image_len = image->mod->mod_end;
+    image_len = image->size;
     image_start = image_base + image->headroom;
     cmdline = __va(image->cmdline_pa);
 
@@ -429,7 +429,7 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
     if ( i < bi->nr_modules )
     {
         initrd = &bi->mods[i];
-        initrd_len = initrd->mod->mod_end;
+        initrd_len = initrd->size;
     }
 
     d->max_pages = ~0U;
@@ -631,7 +631,7 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
         initrd_pfn = vinitrd_start ?
                      (vinitrd_start - v_start) >> PAGE_SHIFT :
                      domain_tot_pages(d);
-        initrd_mfn = initrd->mod->mod_start;
+        initrd_mfn = paddr_to_pfn(initrd->start);
         mfn = initrd_mfn;
         count = PFN_UP(initrd_len);
         if ( d->arch.physaddr_bitsize &&
@@ -647,8 +647,7 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
                     free_domheap_pages(page, order);
                     page += 1UL << order;
                 }
-            memcpy(page_to_virt(page), mfn_to_virt(initrd->mod->mod_start),
-                   initrd_len);
+            memcpy(page_to_virt(page), __va(initrd->start), initrd_len);
             /*
              * The initrd was copied but the initrd variable is reused in the
              * calculations below. As to not leak the memory used for the
@@ -656,7 +655,7 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
              */
             release_boot_module(initrd);
             initrd_mfn = mfn_x(page_to_mfn(page));
-            initrd->mod->mod_start = initrd_mfn;
+            initrd->start = pfn_to_paddr(initrd_mfn);
         }
         else
         {
@@ -683,7 +682,7 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
                nr_pages - domain_tot_pages(d));
     if ( initrd )
     {
-        mpt_alloc = pfn_to_paddr(initrd->mod->mod_start);
+        mpt_alloc = initrd->start;
         printk("\n Init. ramdisk: %"PRIpaddr"->%"PRIpaddr,
                mpt_alloc, mpt_alloc + initrd_len);
     }
@@ -911,7 +910,7 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
         if ( pfn >= initrd_pfn )
         {
             if ( pfn < initrd_pfn + PFN_UP(initrd_len) )
-                mfn = initrd->mod->mod_start + (pfn - initrd_pfn);
+                mfn = paddr_to_pfn(initrd->start) + (pfn - initrd_pfn);
             else
                 mfn -= PFN_UP(initrd_len);
         }
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 0bda1326a485..b4eba122d8a5 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -314,13 +314,29 @@ static struct boot_info *__init multiboot_fill_boot_info(
      */
     for ( i = 0; i < MAX_NR_BOOTMODS && i < bi->nr_modules; i++ )
     {
-        bi->mods[i].mod = &mods[i];
-
         bi->mods[i].cmdline_pa = mods[i].string;
+
+        if ( efi_enabled(EFI_LOADER) )
+        {
+            /*
+             * The EFI loader gives us modules which are in frame/size. Switch
+             * to address/size.
+             */
+            bi->mods[i].start = pfn_to_paddr(mods[i].mod_start);
+            bi->mods[i].size = mods[i].mod_end;
+        }
+        else
+        {
+            /*
+             * PVH and BIOS loaders give us modules which are start/end.
+             * Switch to address/size.
+             */
+            bi->mods[i].start = mods[i].mod_start;
+            bi->mods[i].size = mods[i].mod_end - mods[i].mod_start;
+        }
     }
 
     /* Variable 'i' should be one entry past the last module. */
-    bi->mods[i].mod = &mods[bi->nr_modules];
     bi->mods[i].type = BOOTMOD_XEN;
 
     return bi;
@@ -336,8 +352,8 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
     for ( nr = i = 0; i < bi->nr_modules; ++i )
     {
-        unsigned long start = bi->mods[i].mod->mod_start;
-        unsigned long end   = start + PFN_UP(bi->mods[i].mod->mod_end);
+        unsigned long start = paddr_to_pfn(bi->mods[i].start);
+        unsigned long end   = start + PFN_UP(bi->mods[i].size);
 
         if ( end > node_start && node_end > start )
             nr += min(node_end, end) - max(node_start, start);
@@ -348,12 +364,9 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
 void __init release_boot_module(struct boot_module *bm)
 {
-    uint64_t start = pfn_to_paddr(bm->mod->mod_start);
-    uint64_t size  = bm->mod->mod_end;
-
     ASSERT(!bm->released);
 
-    init_domheap_pages(start, start + PAGE_ALIGN(size));
+    init_domheap_pages(bm->start, bm->start + PAGE_ALIGN(bm->size));
 
     bm->released = true;
 }
@@ -485,15 +498,9 @@ static void *__init bootstrap_map_addr(paddr_t start, paddr_t end)
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
@@ -671,8 +678,8 @@ static uint64_t __init consider_modules(
 
     for ( i = 0; i < nr_mods ; ++i )
     {
-        uint64_t start = pfn_to_paddr(mods[i].mod->mod_start);
-        uint64_t end = start + PAGE_ALIGN(mods[i].mod->mod_end);
+        uint64_t start = mods[i].start;
+        uint64_t end = start + PAGE_ALIGN(mods[i].size);
 
         if ( i == this_mod )
             continue;
@@ -1403,13 +1410,9 @@ void asmlinkage __init noreturn __start_xen(void)
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
@@ -1428,13 +1431,12 @@ void asmlinkage __init noreturn __start_xen(void)
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
@@ -1515,7 +1517,7 @@ void asmlinkage __init noreturn __start_xen(void)
         for ( j = bi->nr_modules - 1; j >= 0; j-- )
         {
             struct boot_module *bm = &bi->mods[j];
-            unsigned long size = PAGE_ALIGN(bm->headroom + bm->mod->mod_end);
+            unsigned long size = PAGE_ALIGN(bm->headroom + bm->size);
 
             if ( bm->relocated )
                 continue;
@@ -1527,14 +1529,11 @@ void asmlinkage __init noreturn __start_xen(void)
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
@@ -1565,10 +1564,9 @@ void asmlinkage __init noreturn __start_xen(void)
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
@@ -1646,8 +1644,7 @@ void asmlinkage __init noreturn __start_xen(void)
                 map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
                 for ( j = 0; j < bi->nr_modules; ++j )
                 {
-                    uint64_t end = pfn_to_paddr(bi->mods[j].mod->mod_start) +
-                                   bi->mods[j].mod->mod_end;
+                    uint64_t end = bi->mods[j].start + bi->mods[j].size;
 
                     if ( map_e < end )
                         map_e = end;
@@ -1721,13 +1718,11 @@ void asmlinkage __init noreturn __start_xen(void)
 
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        const struct boot_module *bm = &bi->mods[i];
+        unsigned long s = bi->mods[i].start, l = bi->mods[i].size;
 
-        set_pdx_range(bm->mod->mod_start,
-                      bm->mod->mod_start + PFN_UP(bm->mod->mod_end));
-        map_pages_to_xen((unsigned long)mfn_to_virt(bm->mod->mod_start),
-                         _mfn(bm->mod->mod_start),
-                         PFN_UP(bm->mod->mod_end), PAGE_HYPERVISOR);
+        set_pdx_range(paddr_to_pfn(s), paddr_to_pfn(s + l) + 1);
+        map_pages_to_xen((unsigned long)maddr_to_virt(s), maddr_to_mfn(s),
+                         PFN_UP(l), PAGE_HYPERVISOR);
     }
 
 #ifdef CONFIG_KEXEC
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 76280903d5be..7f70d860bd65 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -43,7 +43,7 @@ int __init xsm_multiboot_policy_init(
         struct boot_module *bm = &bi->mods[i];
 
         _policy_start = bootstrap_map_bm(bm);
-        _policy_len   = bm->mod->mod_end;
+        _policy_len   = bm->size;
 
         if ( (xsm_magic_t)(*_policy_start) == XSM_MAGIC )
         {
-- 
2.30.2


