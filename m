Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 882139921C8
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811318.1223880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZ8w-0005Iw-8G; Sun, 06 Oct 2024 21:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811318.1223880; Sun, 06 Oct 2024 21:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZ8w-0005Fv-4n; Sun, 06 Oct 2024 21:50:22 +0000
Received: by outflank-mailman (input) for mailman id 811318;
 Sun, 06 Oct 2024 21:50:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZ8u-00051E-J4
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:50:20 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9951dd3-842c-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 23:50:18 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 17282514052498.635198092673818;
 Sun, 6 Oct 2024 14:50:05 -0700 (PDT)
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
X-Inumbo-ID: f9951dd3-842c-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728251408; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ihZbQCud266+NDUZz2Tb/rukXT5+D9DC8M1a/qEZipprStrdI2AHKPJdnMFZVgs+nvC2S3KgblZsic6TZbhaG3HmfGdW2TMsaoeQMfMct7sLxNSJGaRwQxGct7krLILYqp4z4u5PvI4HYBHT4XtO0n5Q5z35hkOFkuaUb6jcEjM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251408; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mR5FDOsbmFDquT3lrYY8U7kNVFC0meHVwZwznJGSBOs=; 
	b=QPkEm0FNYGl5Ed01FczVBht0VCsONZJDTzm8Tu70R8WQnd6yyqdhcPRl0moS7LKsdbAAuJsgoA9q9YPWR+51tA/XXk8iE3hxUhjfVckVe+nDeqt/i/2OrvAqXSUuyENOmGTyfvrL/Zuja2FaB5UFWFoCHyOofgRvE4WQof+uAFE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251408;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=mR5FDOsbmFDquT3lrYY8U7kNVFC0meHVwZwznJGSBOs=;
	b=mKYOERorUmP3k1v8c443KDu4vtZA9h9TZxKLEqeoL8SKmDr+5neBKJOiCMvDRHVc
	gzFGNyVePiuEVriUFxzy1gTYguQFlOwDKOMUZ5FLIhi/v25hHXJEvgPfW2+7ilqjJZE
	uewvKoYSwLt6jjeHx+O9CbzRZrVe+KBXgvkaI7uc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 01/44] x86/boot: move x86 boot module counting into a new boot_info struct
Date: Sun,  6 Oct 2024 17:49:12 -0400
Message-Id: <20241006214956.24339-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Christopher Clark <christopher.w.clark@gmail.com>

An initial step towards a non-multiboot internal representation of boot
modules for common code, starting with x86 setup and converting the fields
that are accessed for the startup calculations.

Introduce a new header, <asm/bootinfo.h>, and populate it with a new boot_info
structure initially containing a count of the number of boot modules.

No functional change intended.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 29 +++++++++++++
 xen/arch/x86/include/asm/setup.h    |  2 +
 xen/arch/x86/setup.c                | 64 ++++++++++++++++++-----------
 3 files changed, 71 insertions(+), 24 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/bootinfo.h

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
new file mode 100644
index 000000000000..a649500ee3a2
--- /dev/null
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
+ * Copyright (c) 2024 Apertus Solutions, LLC
+ * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
+ */
+
+#ifndef __XEN_X86_BOOTINFO_H__
+#define __XEN_X86_BOOTINFO_H__
+
+/*
+ * Xen internal representation of information provided by the
+ * bootloader/environment, or derived from the information.
+ */
+struct boot_info {
+    unsigned int nr_modules;
+};
+
+#endif /* __XEN_X86_BOOTINFO_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index d75589178b91..3d189521189d 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -32,6 +32,8 @@ int construct_dom0(
     const char *cmdline);
 void setup_io_bitmap(struct domain *d);
 
+extern struct boot_info xen_boot_info;
+
 unsigned long initial_images_nrpages(nodeid_t node);
 void discard_initial_images(void);
 void *bootstrap_map(const module_t *mod);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a6e77c9ed9fc..b75deb4fe4ee 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -32,6 +32,7 @@
 #include <compat/xen.h>
 #endif
 #include <xen/bitops.h>
+#include <asm/bootinfo.h>
 #include <asm/smp.h>
 #include <asm/processor.h>
 #include <asm/mpspec.h>
@@ -274,16 +275,28 @@ static int __init cf_check parse_acpi_param(const char *s)
 custom_param("acpi", parse_acpi_param);
 
 static const module_t *__initdata initial_images;
-static unsigned int __initdata nr_initial_images;
+
+struct boot_info __initdata xen_boot_info;
+
+static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
+{
+    struct boot_info *bi = &xen_boot_info;
+    const multiboot_info_t *mbi = __va(mbi_p);
+
+    bi->nr_modules = (mbi->flags & MBI_MODULES) ? mbi->mods_count : 0;
+
+    return bi;
+}
 
 unsigned long __init initial_images_nrpages(nodeid_t node)
 {
+    struct boot_info *bi = &xen_boot_info;
     unsigned long node_start = node_start_pfn(node);
     unsigned long node_end = node_end_pfn(node);
     unsigned long nr;
     unsigned int i;
 
-    for ( nr = i = 0; i < nr_initial_images; ++i )
+    for ( nr = i = 0; i < bi->nr_modules; ++i )
     {
         unsigned long start = initial_images[i].mod_start;
         unsigned long end = start + PFN_UP(initial_images[i].mod_end);
@@ -297,9 +310,10 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
 void __init discard_initial_images(void)
 {
+    struct boot_info *bi = &xen_boot_info;
     unsigned int i;
 
-    for ( i = 0; i < nr_initial_images; ++i )
+    for ( i = 0; i < bi->nr_modules; ++i )
     {
         uint64_t start = (uint64_t)initial_images[i].mod_start << PAGE_SHIFT;
 
@@ -307,7 +321,7 @@ void __init discard_initial_images(void)
                            start + PAGE_ALIGN(initial_images[i].mod_end));
     }
 
-    nr_initial_images = 0;
+    bi->nr_modules = 0;
     initial_images = NULL;
 }
 
@@ -969,6 +983,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     void *bsp_stack;
     struct cpu_info *info = get_cpu_info(), *bsp_info;
     unsigned int initrdidx, num_parked = 0;
+    struct boot_info *bi;
     multiboot_info_t *mbi;
     module_t *mod;
     unsigned long nr_pages, raw_max_page, modules_headroom, module_map[1];
@@ -1015,6 +1030,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         mod = __va(mbi->mods_addr);
     }
 
+    bi = multiboot_fill_boot_info(mbi_p);
+
     loader = (mbi->flags & MBI_LOADERNAME) ? __va(mbi->boot_loader_name)
                                            : "unknown";
 
@@ -1122,18 +1139,18 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
            bootsym(boot_edd_info_nr));
 
     /* Check that we have at least one Multiboot module. */
-    if ( !(mbi->flags & MBI_MODULES) || (mbi->mods_count == 0) )
+    if ( !bi->nr_modules )
         panic("dom0 kernel not specified. Check bootloader configuration\n");
 
     /* Check that we don't have a silly number of modules. */
-    if ( mbi->mods_count > sizeof(module_map) * 8 )
+    if ( bi->nr_modules > sizeof(module_map) * 8 )
     {
-        mbi->mods_count = sizeof(module_map) * 8;
-        printk("Excessive multiboot modules - using the first %u only\n",
-               mbi->mods_count);
+        bi->nr_modules = sizeof(module_map) * 8;
+        printk("Excessive boot modules - using the first %u only\n",
+               bi->nr_modules);
     }
 
-    bitmap_fill(module_map, mbi->mods_count);
+    bitmap_fill(module_map, bi->nr_modules);
     __clear_bit(0, module_map); /* Dom0 kernel is always first */
 
     if ( pvh_boot )
@@ -1306,9 +1323,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     kexec_reserve_area();
 
     initial_images = mod;
-    nr_initial_images = mbi->mods_count;
 
-    for ( i = 0; !efi_enabled(EFI_LOADER) && i < mbi->mods_count; i++ )
+    for ( i = 0; !efi_enabled(EFI_LOADER) && i < bi->nr_modules; i++ )
     {
         if ( mod[i].mod_start & (PAGE_SIZE - 1) )
             panic("Bootloader didn't honor module alignment request\n");
@@ -1332,8 +1348,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
          * respective reserve_e820_ram() invocation below. No need to
          * query efi_boot_mem_unused() here, though.
          */
-        mod[mbi->mods_count].mod_start = virt_to_mfn(_stext);
-        mod[mbi->mods_count].mod_end = __2M_rwdata_end - _stext;
+        mod[bi->nr_modules].mod_start = virt_to_mfn(_stext);
+        mod[bi->nr_modules].mod_end = __2M_rwdata_end - _stext;
     }
 
     modules_headroom = bzimage_headroom(bootstrap_map(mod), mod->mod_end);
@@ -1393,7 +1409,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         {
             /* Don't overlap with modules. */
             end = consider_modules(s, e, reloc_size + mask,
-                                   mod, mbi->mods_count, -1);
+                                   mod, bi->nr_modules, -1);
             end &= ~mask;
         }
         else
@@ -1414,7 +1430,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         }
 
         /* Is the region suitable for relocating the multiboot modules? */
-        for ( j = mbi->mods_count - 1; j >= 0; j-- )
+        for ( j = bi->nr_modules - 1; j >= 0; j-- )
         {
             /*
              * 'headroom' is a guess for the decompressed size and
@@ -1429,7 +1445,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
             /* Don't overlap with other modules (or Xen itself). */
             end = consider_modules(s, e, size, mod,
-                                   mbi->mods_count + relocated, j);
+                                   bi->nr_modules + relocated, j);
 
             if ( highmem_start && end > highmem_start )
                 continue;
@@ -1456,7 +1472,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         {
             /* Don't overlap with modules (or Xen itself). */
             e = consider_modules(s, e, PAGE_ALIGN(kexec_crash_area.size), mod,
-                                 mbi->mods_count + relocated, -1);
+                                 bi->nr_modules + relocated, -1);
             if ( s >= e )
                 break;
             if ( e > kexec_crash_area_limit )
@@ -1471,7 +1487,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     if ( modules_headroom && !mod->reserved )
         panic("Not enough memory to relocate the dom0 kernel image\n");
-    for ( i = 0; i < mbi->mods_count; ++i )
+    for ( i = 0; i < bi->nr_modules; ++i )
     {
         uint64_t s = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
 
@@ -1551,7 +1567,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
                     ASSERT(j);
                 }
                 map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
-                for ( j = 0; j < mbi->mods_count; ++j )
+                for ( j = 0; j < bi->nr_modules; ++j )
                 {
                     uint64_t end = pfn_to_paddr(mod[j].mod_start) +
                                    mod[j].mod_end;
@@ -1626,7 +1642,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         }
     }
 
-    for ( i = 0; i < mbi->mods_count; ++i )
+    for ( i = 0; i < bi->nr_modules; ++i )
     {
         set_pdx_range(mod[i].mod_start,
                       mod[i].mod_start + PFN_UP(mod[i].mod_end));
@@ -2011,8 +2027,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
            cpu_has_nx ? XENLOG_INFO : XENLOG_WARNING "Warning: ",
            cpu_has_nx ? "" : "not ");
 
-    initrdidx = find_first_bit(module_map, mbi->mods_count);
-    if ( bitmap_weight(module_map, mbi->mods_count) > 1 )
+    initrdidx = find_first_bit(module_map, bi->nr_modules);
+    if ( bitmap_weight(module_map, bi->nr_modules) > 1 )
         printk(XENLOG_WARNING
                "Multiple initrd candidates, picking module #%u\n",
                initrdidx);
@@ -2022,7 +2038,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
     dom0 = create_dom0(mod, modules_headroom,
-                       initrdidx < mbi->mods_count ? mod + initrdidx : NULL,
+                       initrdidx < bi->nr_modules ? mod + initrdidx : NULL,
                        kextra, loader);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
-- 
2.30.2


