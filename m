Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 355A1966B7D
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:48:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786651.1196257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9TH-0004TQ-IB; Fri, 30 Aug 2024 21:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786651.1196257; Fri, 30 Aug 2024 21:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9TH-0004R2-Er; Fri, 30 Aug 2024 21:47:55 +0000
Received: by outflank-mailman (input) for mailman id 786651;
 Fri, 30 Aug 2024 21:47:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9TF-0004BO-Gl
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:47:53 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80cc9cb1-6719-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:47:51 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054460817330.6426605494462;
 Fri, 30 Aug 2024 14:47:40 -0700 (PDT)
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
X-Inumbo-ID: 80cc9cb1-6719-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054462; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VVb9AQHQzWR0Xi2YBkK8F9dotHc22hwmVT/LlesQD8Ep099R821c1DgywspI4LquG1hX93Kne+sbnH/DjXwPEPRdyxUN08DnabgJAXPouP59ITtCwrG2jpwejvBzQdo6GEOZO8VqHMDWQ5mqVHVzTaFmcYuDKA2y16NmlXCqWyg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054462; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M4W1+EbYZ1Civ9bhjGdGJrVHK5yOv98KXuuX61z+p3g=; 
	b=cUpNh9U8LgPdyvJKQS3ji/lxd+zIM1Y9zDvfRHx3XDvMvc7/7OX1siznfG8ykfEmXHn7/4LNt8fKcUHr/BpB5snOhE4we4wysUw/fbxgciUHjPFu4I0CcOMf8LN/7hyz7LpZmzo74DaAciz4vK1cYWBWBYmjWHQOypEfbhGT25M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054462;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=M4W1+EbYZ1Civ9bhjGdGJrVHK5yOv98KXuuX61z+p3g=;
	b=sHHzHCuGHGQltokKpd4X2yRE+MQNFBUIgXNLNgudjrJQNsTEkIGzdG7ZgX53oL3G
	Bs570rYESGeIxMHp8DV4M1l39KusyOgGHF9Chuq8gA7oP2a0fLWfRdBdShtfHYeT/9G
	hpZ8ncIhIEf19P9+zBm6Hp478IrYnKcZY0nOar8Y=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
	jason.andryuk@amd.com,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 01/44] x86/boot: move x86 boot module counting into a new boot_info struct
Date: Fri, 30 Aug 2024 17:46:46 -0400
Message-Id: <20240830214730.1621-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Christopher Clark <christopher.w.clark@gmail.com>

An initial step towards a non-multiboot internal representation of boot
modules for common code, starting with x86 setup and converting the fields
that are accessed for the startup calculations.

Introduce a new header, <xen/asm/bootinfo.h>, and populate it with a new
boot_info structure initially containing a count of the number of boot
modules.

No functional change intended.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 25 +++++++++++++
 xen/arch/x86/setup.c                | 58 +++++++++++++++++------------
 2 files changed, 59 insertions(+), 24 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/bootinfo.h

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
new file mode 100644
index 000000000000..e850f80d26a7
--- /dev/null
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -0,0 +1,25 @@
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
+struct boot_info {
+    unsigned int nr_mods;
+};
+
+#endif
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
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index eee20bb1753c..dd94ee2e736b 100644
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
@@ -276,7 +277,16 @@ static int __init cf_check parse_acpi_param(const char *s)
 custom_param("acpi", parse_acpi_param);
 
 static const module_t *__initdata initial_images;
-static unsigned int __initdata nr_initial_images;
+static struct boot_info __initdata *boot_info;
+
+static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
+{
+    static struct boot_info __initdata info;
+
+    info.nr_mods = mbi->mods_count;
+
+    boot_info = &info;
+}
 
 unsigned long __init initial_images_nrpages(nodeid_t node)
 {
@@ -285,7 +295,7 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
     unsigned long nr;
     unsigned int i;
 
-    for ( nr = i = 0; i < nr_initial_images; ++i )
+    for ( nr = i = 0; i < boot_info->nr_mods; ++i )
     {
         unsigned long start = initial_images[i].mod_start;
         unsigned long end = start + PFN_UP(initial_images[i].mod_end);
@@ -301,7 +311,7 @@ void __init discard_initial_images(void)
 {
     unsigned int i;
 
-    for ( i = 0; i < nr_initial_images; ++i )
+    for ( i = 0; i < boot_info->nr_mods; ++i )
     {
         uint64_t start = (uint64_t)initial_images[i].mod_start << PAGE_SHIFT;
 
@@ -309,7 +319,7 @@ void __init discard_initial_images(void)
                            start + PAGE_ALIGN(initial_images[i].mod_end));
     }
 
-    nr_initial_images = 0;
+    boot_info->nr_mods = 0;
     initial_images = NULL;
 }
 
@@ -1034,9 +1044,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         mod = __va(mbi->mods_addr);
     }
 
+    multiboot_to_bootinfo(mbi);
+
     loader = (mbi->flags & MBI_LOADERNAME) ? __va(mbi->boot_loader_name)
                                            : "unknown";
-
     /* Parse the command-line options. */
     if ( mbi->flags & MBI_CMDLINE )
         cmdline = cmdline_cook(__va(mbi->cmdline), loader);
@@ -1141,18 +1152,18 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
            bootsym(boot_edd_info_nr));
 
     /* Check that we have at least one Multiboot module. */
-    if ( !(mbi->flags & MBI_MODULES) || (mbi->mods_count == 0) )
+    if ( !(mbi->flags & MBI_MODULES) || (boot_info->nr_mods == 0) )
         panic("dom0 kernel not specified. Check bootloader configuration\n");
 
     /* Check that we don't have a silly number of modules. */
-    if ( mbi->mods_count > sizeof(module_map) * 8 )
+    if ( boot_info->nr_mods > sizeof(module_map) * 8 )
     {
-        mbi->mods_count = sizeof(module_map) * 8;
+        boot_info->nr_mods = sizeof(module_map) * 8;
         printk("Excessive multiboot modules - using the first %u only\n",
-               mbi->mods_count);
+               boot_info->nr_mods);
     }
 
-    bitmap_fill(module_map, mbi->mods_count);
+    bitmap_fill(module_map, boot_info->nr_mods);
     __clear_bit(0, module_map); /* Dom0 kernel is always first */
 
     if ( pvh_boot )
@@ -1325,9 +1336,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     kexec_reserve_area();
 
     initial_images = mod;
-    nr_initial_images = mbi->mods_count;
 
-    for ( i = 0; !efi_enabled(EFI_LOADER) && i < mbi->mods_count; i++ )
+    for ( i = 0; !efi_enabled(EFI_LOADER) && i < boot_info->nr_mods; i++ )
     {
         if ( mod[i].mod_start & (PAGE_SIZE - 1) )
             panic("Bootloader didn't honor module alignment request\n");
@@ -1351,8 +1361,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
          * respective reserve_e820_ram() invocation below. No need to
          * query efi_boot_mem_unused() here, though.
          */
-        mod[mbi->mods_count].mod_start = virt_to_mfn(_stext);
-        mod[mbi->mods_count].mod_end = __2M_rwdata_end - _stext;
+        mod[boot_info->nr_mods].mod_start = virt_to_mfn(_stext);
+        mod[boot_info->nr_mods].mod_end = __2M_rwdata_end - _stext;
     }
 
     modules_headroom = bzimage_headroom(bootstrap_map(mod), mod->mod_end);
@@ -1412,7 +1422,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         {
             /* Don't overlap with modules. */
             end = consider_modules(s, e, reloc_size + mask,
-                                   mod, mbi->mods_count, -1);
+                                   mod, boot_info->nr_mods, -1);
             end &= ~mask;
         }
         else
@@ -1433,7 +1443,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         }
 
         /* Is the region suitable for relocating the multiboot modules? */
-        for ( j = mbi->mods_count - 1; j >= 0; j-- )
+        for ( j = boot_info->nr_mods - 1; j >= 0; j-- )
         {
             /*
              * 'headroom' is a guess for the decompressed size and
@@ -1448,7 +1458,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
             /* Don't overlap with other modules (or Xen itself). */
             end = consider_modules(s, e, size, mod,
-                                   mbi->mods_count + relocated, j);
+                                   boot_info->nr_mods + relocated, j);
 
             if ( highmem_start && end > highmem_start )
                 continue;
@@ -1475,7 +1485,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         {
             /* Don't overlap with modules (or Xen itself). */
             e = consider_modules(s, e, PAGE_ALIGN(kexec_crash_area.size), mod,
-                                 mbi->mods_count + relocated, -1);
+                                 boot_info->nr_mods + relocated, -1);
             if ( s >= e )
                 break;
             if ( e > kexec_crash_area_limit )
@@ -1490,7 +1500,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     if ( modules_headroom && !mod->reserved )
         panic("Not enough memory to relocate the dom0 kernel image\n");
-    for ( i = 0; i < mbi->mods_count; ++i )
+    for ( i = 0; i < boot_info->nr_mods; ++i )
     {
         uint64_t s = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
 
@@ -1570,7 +1580,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
                     ASSERT(j);
                 }
                 map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
-                for ( j = 0; j < mbi->mods_count; ++j )
+                for ( j = 0; j < boot_info->nr_mods; ++j )
                 {
                     uint64_t end = pfn_to_paddr(mod[j].mod_start) +
                                    mod[j].mod_end;
@@ -1645,7 +1655,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         }
     }
 
-    for ( i = 0; i < mbi->mods_count; ++i )
+    for ( i = 0; i < boot_info->nr_mods; ++i )
     {
         set_pdx_range(mod[i].mod_start,
                       mod[i].mod_start + PFN_UP(mod[i].mod_end));
@@ -2032,8 +2042,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
            cpu_has_nx ? XENLOG_INFO : XENLOG_WARNING "Warning: ",
            cpu_has_nx ? "" : "not ");
 
-    initrdidx = find_first_bit(module_map, mbi->mods_count);
-    if ( bitmap_weight(module_map, mbi->mods_count) > 1 )
+    initrdidx = find_first_bit(module_map, boot_info->nr_mods);
+    if ( bitmap_weight(module_map, boot_info->nr_mods) > 1 )
         printk(XENLOG_WARNING
                "Multiple initrd candidates, picking module #%u\n",
                initrdidx);
@@ -2043,7 +2053,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
     dom0 = create_dom0(mod, modules_headroom,
-                       initrdidx < mbi->mods_count ? mod + initrdidx : NULL,
+                       initrdidx < boot_info->nr_mods ? mod + initrdidx : NULL,
                        kextra, loader);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
-- 
2.30.2


