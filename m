Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D877447A2
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 09:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557771.871404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUsh-0006gF-7T; Sat, 01 Jul 2023 07:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557771.871404; Sat, 01 Jul 2023 07:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUsh-0006cq-3u; Sat, 01 Jul 2023 07:18:55 +0000
Received: by outflank-mailman (input) for mailman id 557771;
 Sat, 01 Jul 2023 07:18:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypVN=CT=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1qFUsf-0006No-Gx
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 07:18:53 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86e20dce-17df-11ee-8611-37d641c3527e;
 Sat, 01 Jul 2023 09:18:51 +0200 (CEST)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a1d9b64837so2114109b6e.0
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jul 2023 00:18:51 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83]) by smtp.gmail.com with ESMTPSA id
 s19-20020aa78d53000000b00673e652985bsm4108866pfe.118.2023.07.01.00.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 00:18:48 -0700 (PDT)
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
X-Inumbo-ID: 86e20dce-17df-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688195929; x=1690787929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4c9WAF4kmb19tJcbTDjvohxu3kd3fgp5qdmTKmSCTJE=;
        b=CrY0CL1mRL0QPuwcnmaQkblnBE5P1R9sxQMKRcx7enujbSgBR6HAPycMDb2gS1AY4c
         GSMdg9Ho2X7dHe+o+SmkXoOa4APm8vLJjz8ed+7vxoyBsabHF/6zFJRtNNnBW4mZqgs0
         /Kh9Zwyvg3GVC2GvbUXvWfC+Zl6imp1Dt83c7Gz7W64GM7H2PsLp9Qawd4CWiMdGbfJ+
         4ZpLlj4Ud3KBQNyr/lOBs7ci3hfKCUjakzYDIIoGJTg8cCPtn9eEPJMUhg1WXlHQsVCH
         55FvRh0m8bfNjA2aTWhCErJlfX/ZnGxZaK4J45t8b1wnqNp9Gr9qRZ6PvA6RDY+LPK40
         MFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688195929; x=1690787929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4c9WAF4kmb19tJcbTDjvohxu3kd3fgp5qdmTKmSCTJE=;
        b=SR70FPibjtK197iqGpuAocUm0X2cDizdg/b5smcuB/qjgWHuBK4bf5+aS2eY0Lylm+
         tiJArrRTZpqAyauRqBFksKgcXP+gaI7OqOvuG5Gc7tqdP+utbVkifE3QwEuDA0ENiT9c
         1sLdARp4psY5vz14g6eXO0L3YFG13DaQHt887/9OqaoFEZqbRQo80OgXw24onADATt7G
         Bx7eZjln+wMmetrJJ0ovP86NDofQ+2C8LG1JBqVthUBx7VPhiW6ZHuF4uS/QkVG9r95F
         qgO5o6RfCW4pNvMc5+iqN1E9zKj0dbGez4k5Upe5hoCB7aMjeyna7+qF1TCknygWHq2n
         pjJw==
X-Gm-Message-State: AC+VfDyiX59a5d3b9UJhgPXVnpUgr2rMyZxbvCcIP9j1ob5yiDOH8HQ5
	HFYikFMPxGKhnj1eONz4J7MPV9m1Cyc=
X-Google-Smtp-Source: ACHHUZ5mpapv9SYTUsV6xBXMbudnVg/NReuMAxR+qtoCnfL+g9iPwcEvsPkpPiGylED5la1TTi9fsw==
X-Received: by 2002:a05:6808:1b0c:b0:3a1:b309:a409 with SMTP id bx12-20020a0568081b0c00b003a1b309a409mr6482050oib.4.1688195929359;
        Sat, 01 Jul 2023 00:18:49 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
	stefano.stabellini@amd.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rich Persaud <persaur@gmail.com>
Subject: [PATCH 01/10] x86 setup: move x86 boot module counting into a new boot_info struct
Date: Sat,  1 Jul 2023 00:18:26 -0700
Message-Id: <20230701071835.41599-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230701071835.41599-1-christopher.w.clark@gmail.com>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An initial step towards a non-multiboot internal representation of boot
modules for common code, starting with x86 setup and converting the
fields that are accessed for the startup calculations.

Introduce a new header, <xen/bootinfo.h>, and populate it with a new
boot_info structure initially containing a count of the number of boot
modules.

The naming of the header, structure and fields is intended to respect
the boot structures on Arm -- see arm/include/asm/setup.h -- as part of
work towards aligning common architecture-neutral boot logic and
structures.

No functional change intended.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

---
Changes since v1: patch is a subset of v1 series patches 2 and 3.

 xen/arch/x86/setup.c       | 58 +++++++++++++++++++++++---------------
 xen/include/xen/bootinfo.h | 20 +++++++++++++
 2 files changed, 55 insertions(+), 23 deletions(-)
 create mode 100644 xen/include/xen/bootinfo.h

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 74e3915a4d..708639b236 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1,3 +1,4 @@
+#include <xen/bootinfo.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/err.h>
@@ -268,7 +269,16 @@ static int __init cf_check parse_acpi_param(const char *s)
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
@@ -277,7 +287,7 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
     unsigned long nr;
     unsigned int i;
 
-    for ( nr = i = 0; i < nr_initial_images; ++i )
+    for ( nr = i = 0; i < boot_info->nr_mods; ++i )
     {
         unsigned long start = initial_images[i].mod_start;
         unsigned long end = start + PFN_UP(initial_images[i].mod_end);
@@ -293,7 +303,7 @@ void __init discard_initial_images(void)
 {
     unsigned int i;
 
-    for ( i = 0; i < nr_initial_images; ++i )
+    for ( i = 0; i < boot_info->nr_mods; ++i )
     {
         uint64_t start = (uint64_t)initial_images[i].mod_start << PAGE_SHIFT;
 
@@ -301,7 +311,7 @@ void __init discard_initial_images(void)
                            start + PAGE_ALIGN(initial_images[i].mod_end));
     }
 
-    nr_initial_images = 0;
+    boot_info->nr_mods = 0;
     initial_images = NULL;
 }
 
@@ -1020,6 +1030,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         mod = __va(mbi->mods_addr);
     }
 
+    multiboot_to_bootinfo(mbi);
+
     loader = (mbi->flags & MBI_LOADERNAME)
         ? (char *)__va(mbi->boot_loader_name) : "unknown";
 
@@ -1127,18 +1139,18 @@ void __init noreturn __start_xen(unsigned long mbi_p)
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
@@ -1311,9 +1323,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     kexec_reserve_area(&boot_e820);
 
     initial_images = mod;
-    nr_initial_images = mbi->mods_count;
+    boot_info->nr_mods = boot_info->nr_mods;
 
-    for ( i = 0; !efi_enabled(EFI_LOADER) && i < mbi->mods_count; i++ )
+    for ( i = 0; !efi_enabled(EFI_LOADER) && i < boot_info->nr_mods; i++ )
     {
         if ( mod[i].mod_start & (PAGE_SIZE - 1) )
             panic("Bootloader didn't honor module alignment request\n");
@@ -1337,8 +1349,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
          * respective reserve_e820_ram() invocation below. No need to
          * query efi_boot_mem_unused() here, though.
          */
-        mod[mbi->mods_count].mod_start = virt_to_mfn(_stext);
-        mod[mbi->mods_count].mod_end = __2M_rwdata_end - _stext;
+        mod[boot_info->nr_mods].mod_start = virt_to_mfn(_stext);
+        mod[boot_info->nr_mods].mod_end = __2M_rwdata_end - _stext;
     }
 
     modules_headroom = bzimage_headroom(bootstrap_map(mod), mod->mod_end);
@@ -1398,7 +1410,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         {
             /* Don't overlap with modules. */
             end = consider_modules(s, e, reloc_size + mask,
-                                   mod, mbi->mods_count, -1);
+                                   mod, boot_info->nr_mods, -1);
             end &= ~mask;
         }
         else
@@ -1419,7 +1431,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         }
 
         /* Is the region suitable for relocating the multiboot modules? */
-        for ( j = mbi->mods_count - 1; j >= 0; j-- )
+        for ( j = boot_info->nr_mods - 1; j >= 0; j-- )
         {
             unsigned long headroom = j ? 0 : modules_headroom;
             unsigned long size = PAGE_ALIGN(headroom + mod[j].mod_end);
@@ -1429,7 +1441,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
             /* Don't overlap with other modules (or Xen itself). */
             end = consider_modules(s, e, size, mod,
-                                   mbi->mods_count + relocated, j);
+                                   boot_info->nr_mods + relocated, j);
 
             if ( highmem_start && end > highmem_start )
                 continue;
@@ -1456,7 +1468,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         {
             /* Don't overlap with modules (or Xen itself). */
             e = consider_modules(s, e, PAGE_ALIGN(kexec_crash_area.size), mod,
-                                 mbi->mods_count + relocated, -1);
+                                 boot_info->nr_mods + relocated, -1);
             if ( s >= e )
                 break;
             if ( e > kexec_crash_area_limit )
@@ -1471,7 +1483,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     if ( modules_headroom && !mod->reserved )
         panic("Not enough memory to relocate the dom0 kernel image\n");
-    for ( i = 0; i < mbi->mods_count; ++i )
+    for ( i = 0; i < boot_info->nr_mods; ++i )
     {
         uint64_t s = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
 
@@ -1540,7 +1552,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                     ASSERT(j);
                 }
                 map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
-                for ( j = 0; j < mbi->mods_count; ++j )
+                for ( j = 0; j < boot_info->nr_mods; ++j )
                 {
                     uint64_t end = pfn_to_paddr(mod[j].mod_start) +
                                    mod[j].mod_end;
@@ -1616,7 +1628,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         }
     }
 
-    for ( i = 0; i < mbi->mods_count; ++i )
+    for ( i = 0; i < boot_info->nr_mods; ++i )
     {
         set_pdx_range(mod[i].mod_start,
                       mod[i].mod_start + PFN_UP(mod[i].mod_end));
@@ -1999,8 +2011,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
            cpu_has_nx ? XENLOG_INFO : XENLOG_WARNING "Warning: ",
            cpu_has_nx ? "" : "not ");
 
-    initrdidx = find_first_bit(module_map, mbi->mods_count);
-    if ( bitmap_weight(module_map, mbi->mods_count) > 1 )
+    initrdidx = find_first_bit(module_map, boot_info->nr_mods);
+    if ( bitmap_weight(module_map, boot_info->nr_mods) > 1 )
         printk(XENLOG_WARNING
                "Multiple initrd candidates, picking module #%u\n",
                initrdidx);
@@ -2010,7 +2022,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
     dom0 = create_dom0(mod, modules_headroom,
-                       initrdidx < mbi->mods_count ? mod + initrdidx : NULL,
+                       initrdidx < boot_info->nr_mods ? mod + initrdidx : NULL,
                        kextra, loader);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
new file mode 100644
index 0000000000..6a7d55d20e
--- /dev/null
+++ b/xen/include/xen/bootinfo.h
@@ -0,0 +1,20 @@
+#ifndef __XEN_BOOTINFO_H__
+#define __XEN_BOOTINFO_H__
+
+#include <xen/types.h>
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
-- 
2.25.1


