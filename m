Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DC774479F
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 09:19:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557776.871447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUsn-0007ln-Ez; Sat, 01 Jul 2023 07:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557776.871447; Sat, 01 Jul 2023 07:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUsn-0007fn-7c; Sat, 01 Jul 2023 07:19:01 +0000
Received: by outflank-mailman (input) for mailman id 557776;
 Sat, 01 Jul 2023 07:18:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypVN=CT=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1qFUsl-00074A-4k
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 07:18:59 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ae6847b-17df-11ee-b237-6b7b168915f2;
 Sat, 01 Jul 2023 09:18:57 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-765a7768f1dso259805885a.0
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jul 2023 00:18:57 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83]) by smtp.gmail.com with ESMTPSA id
 s19-20020aa78d53000000b00673e652985bsm4108866pfe.118.2023.07.01.00.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 00:18:55 -0700 (PDT)
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
X-Inumbo-ID: 8ae6847b-17df-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688195936; x=1690787936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZcp6XBY1YAC9oeotb5zJ/fGSdzt/Mx/a1Oe4w1mVBI=;
        b=ILmm9e/9lTp9GTg1saAsg7g1OS7yf4jCGZwg0akeM2mI0eRae5so14i3XdhUMh+qaa
         WvicC4epjfhJ1KgZeK/e5xz4jBIFr1AvNW1MB8zRZGTP3UqrTmEKUDwdJ7lYGNrL0kYo
         W7eJJCHmsS1p5VVGOTbmnt9B25qJIGISHnW/KS3zoRc6b0p5zTwjPDP1RlEkxvb9ai26
         Ff3gpgsic09OIQkUbADqfAmHETGZJiy3Lm/8TvvJqr6fuh3R7hBi4Mqs8pY02gL+6K7m
         Q+oAco6AU+2LzNqpPKBAyn2krxQOaAyH+0px9DeXfCeULpV16sLShIA+hMsZgendVEpi
         DGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688195936; x=1690787936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zZcp6XBY1YAC9oeotb5zJ/fGSdzt/Mx/a1Oe4w1mVBI=;
        b=gMstzg2ZJq6aYPb2GEvCv8vqtB2zsXuRZIvehsreBf9UcaAXI5F3HvfgFGfrU6XGea
         G6+u38UvLdQDOfJecvHaFgDEFnOlXXsnparkLx3XXYQQTFAqzrzWPWf0jBhrJdJx2cYn
         gWbu/JPva7D6/oyTNHuBXbTJOU6/sFR2YWpYh7BYt5YT/VjJmJXcCcG1cY9An5ARexlQ
         xrtLWWcSk1PiTeL1dnZuhUQqnQKiJ8cvMoEO52T9up/psg3VrGvA/ba1E5DIZU2O/m4V
         y3gKZczkTL6bymO536zkmgvLZrnaDTHFnE19GcMuj/mfeat9A7NjxxIe3SeXw5+G+RW+
         4toQ==
X-Gm-Message-State: AC+VfDzsuUMqzIcxBqUcyjhsOotH0TOLONiN8rttpgO2EFu0+vZZV8ez
	OWNB8X/AVzaR9h23vdp3gjxbnZqtBLI=
X-Google-Smtp-Source: ACHHUZ6G4ziS9OlcacmAYXEWytMGOapbZ5lrvuY5UYngxSJMQYFoJYsz5UXL9WWUNXBnxHWZfGdaKA==
X-Received: by 2002:a05:620a:450b:b0:767:2bb9:d187 with SMTP id t11-20020a05620a450b00b007672bb9d187mr6726381qkp.1.1688195936202;
        Sat, 01 Jul 2023 00:18:56 -0700 (PDT)
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
Subject: [PATCH 06/10] x86 setup, microcode: switch to the new bootinfo structures
Date: Sat,  1 Jul 2023 00:18:31 -0700
Message-Id: <20230701071835.41599-7-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230701071835.41599-1-christopher.w.clark@gmail.com>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Next step in incremental work towards adding a non-multiboot internal
representation of boot modules, converting the fields being accessed for
the startup calculations.

Move the per-module scan logic into a dedicated function from the
iteration loop and set the BOOTMOD_UCODE module type when microcode is found.

Completes the conversion from the module_map bitmap in x86 setup so it
can be removed, along with the temporary bootstrap_map multiboot wrapper
since the last code that uses it is removed in this change.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

---
Changes since v1: patch is a subset of v1 series patches 2 and 3.
- Added the removal of the temporary bootstrap map function

 xen/arch/x86/cpu/microcode/core.c    | 148 +++++++++++++++------------
 xen/arch/x86/include/asm/boot.h      |  13 ---
 xen/arch/x86/include/asm/microcode.h |   7 +-
 xen/arch/x86/setup.c                 |   8 +-
 4 files changed, 89 insertions(+), 87 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index ce3c8042a2..d2cae9b6b4 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -22,12 +22,12 @@
  */
 
 #include <xen/alternative-call.h>
+#include <xen/bootinfo.h>
 #include <xen/cpu.h>
 #include <xen/earlycpio.h>
 #include <xen/err.h>
 #include <xen/guest_access.h>
 #include <xen/init.h>
-#include <xen/multiboot.h>
 #include <xen/param.h>
 #include <xen/spinlock.h>
 #include <xen/stop_machine.h>
@@ -57,7 +57,6 @@
  */
 #define MICROCODE_UPDATE_TIMEOUT_US 1000000
 
-static module_t __initdata ucode_mod;
 static signed int __initdata ucode_mod_idx;
 static bool_t __initdata ucode_mod_forced;
 static unsigned int nr_cores;
@@ -150,75 +149,109 @@ static int __init cf_check parse_ucode(const char *s)
 }
 custom_param("ucode", parse_ucode);
 
-void __init microcode_scan_module(
-    unsigned long *module_map,
-    const multiboot_info_t *mbi)
+#define MICROCODE_MODULE_MATCH 1
+#define MICROCODE_MODULE_NONMATCH 0
+
+static int __init microcode_check_module(struct boot_module *mod)
 {
-    module_t *mod = (module_t *)__va(mbi->mods_addr);
     uint64_t *_blob_start;
     unsigned long _blob_size;
-    struct cpio_data cd;
+    struct cpio_data cd = { NULL, 0 };
     long offset;
     const char *p = NULL;
-    int i;
-
-    ucode_blob.size = 0;
-    if ( !ucode_scan )
-        return;
 
     if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
         p = "kernel/x86/microcode/AuthenticAMD.bin";
     else if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
         p = "kernel/x86/microcode/GenuineIntel.bin";
     else
+        return -EFAULT;
+
+    _blob_start = bootstrap_map(mod);
+    _blob_size = mod->size;
+    if ( !_blob_start )
+    {
+        printk("Could not map multiboot module (0x%lx) (size: %ld)\n",
+               mod->start, _blob_size);
+        /* Non-fatal error, so just say no match */
+        return MICROCODE_MODULE_NONMATCH;
+    }
+
+    cd = find_cpio_data(p, _blob_start, _blob_size, &offset /* ignore */);
+
+    if ( cd.data )
+    {
+        ucode_blob.size = cd.size;
+        ucode_blob.data = cd.data;
+
+        mod->bootmod_type = BOOTMOD_UCODE;
+        return MICROCODE_MODULE_MATCH;
+    }
+
+    bootstrap_map(NULL);
+
+    return MICROCODE_MODULE_NONMATCH;
+}
+
+void __init microcode_scan_module(struct boot_info *bootinfo)
+{
+    int i;
+
+    if ( !ucode_scan )
         return;
 
-    /*
-     * Try all modules and see whichever could be the microcode blob.
-     */
-    for ( i = 1 /* Ignore dom0 kernel */; i < mbi->mods_count; i++ )
+    i = bootmodule_index(bootinfo, BOOTMOD_UNKNOWN, 0);
+    while ( i < bootinfo->nr_mods )
     {
-        if ( !test_bit(i, module_map) )
-            continue;
+        int ret = microcode_check_module(&bootinfo->mods[i]);
 
-        _blob_start = bootstrap_map_multiboot(&mod[i]);
-        _blob_size = mod[i].mod_end;
-        if ( !_blob_start )
+        switch ( ret )
         {
-            printk("Could not map multiboot module #%d (size: %ld)\n",
-                   i, _blob_size);
+        case MICROCODE_MODULE_MATCH:
+            return;
+        case MICROCODE_MODULE_NONMATCH:
+            i = bootmodule_index(bootinfo, BOOTMOD_UNKNOWN, ++i);
             continue;
+        default:
+            printk("%s: (err: %d) unable to check microcode\n",
+                   __func__, ret);
+            return;
         }
-        cd.data = NULL;
-        cd.size = 0;
-        cd = find_cpio_data(p, _blob_start, _blob_size, &offset /* ignore */);
-        if ( cd.data )
-        {
-            ucode_blob.size = cd.size;
-            ucode_blob.data = cd.data;
-            break;
-        }
-        bootstrap_map(NULL);
     }
 }
 
-static void __init microcode_grab_module(
-    unsigned long *module_map,
-    const multiboot_info_t *mbi)
+static void __init microcode_grab_module(struct boot_info *bootinfo)
 {
-    module_t *mod = (module_t *)__va(mbi->mods_addr);
+    ucode_blob.size = 0;
 
     if ( ucode_mod_idx < 0 )
-        ucode_mod_idx += mbi->mods_count;
-    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= mbi->mods_count ||
-         !__test_and_clear_bit(ucode_mod_idx, module_map) )
-        goto scan;
-    ucode_mod = mod[ucode_mod_idx];
-scan:
+        ucode_mod_idx += bootinfo->nr_mods;
+    if ( ucode_mod_idx >= 0 &&  ucode_mod_idx <= bootinfo->nr_mods &&
+         bootinfo->mods[ucode_mod_idx].bootmod_type == BOOTMOD_UNKNOWN )
+    {
+        int ret = microcode_check_module(&bootinfo->mods[ucode_mod_idx]);
+
+        switch ( ret )
+        {
+        case MICROCODE_MODULE_MATCH:
+            return;
+        case MICROCODE_MODULE_NONMATCH:
+            break;
+        default:
+            printk("%s: (err: %d) unable to check microcode\n",
+                   __func__, ret);
+            return;
+        }
+    }
+
     if ( ucode_scan )
-        microcode_scan_module(module_map, mbi);
+        microcode_scan_module(bootinfo);
 }
 
+/* Undefining as they are not needed anymore */
+#undef MICROCODE_MODULE_MATCH
+#undef MICROCODE_MODULE_NONMATCH
+
 static struct microcode_ops __ro_after_init ucode_ops;
 
 static DEFINE_SPINLOCK(microcode_mutex);
@@ -738,11 +771,6 @@ static int __init cf_check microcode_init(void)
         ucode_blob.size = 0;
         ucode_blob.data = NULL;
     }
-    else if ( ucode_mod.mod_end )
-    {
-        bootstrap_map(NULL);
-        ucode_mod.mod_end = 0;
-    }
 
     return 0;
 }
@@ -786,8 +814,7 @@ static int __init early_update_cache(const void *data, size_t len)
     return rc;
 }
 
-int __init microcode_init_cache(unsigned long *module_map,
-                                const struct multiboot_info *mbi)
+int __init microcode_init_cache(struct boot_info *bootinfo)
 {
     int rc = 0;
 
@@ -796,12 +823,9 @@ int __init microcode_init_cache(unsigned long *module_map,
 
     if ( ucode_scan )
         /* Need to rescan the modules because they might have been relocated */
-        microcode_scan_module(module_map, mbi);
+        microcode_scan_module(bootinfo);
 
-    if ( ucode_mod.mod_end )
-        rc = early_update_cache(bootstrap_map_multiboot(&ucode_mod),
-                                ucode_mod.mod_end);
-    else if ( ucode_blob.size )
+    if ( ucode_blob.size )
         rc = early_update_cache(ucode_blob.data, ucode_blob.size);
 
     return rc;
@@ -819,11 +843,6 @@ static int __init early_microcode_update_cpu(void)
         len = ucode_blob.size;
         data = ucode_blob.data;
     }
-    else if ( ucode_mod.mod_end )
-    {
-        len = ucode_mod.mod_end;
-        data = bootstrap_map_multiboot(&ucode_mod);
-    }
 
     if ( !data )
         return -ENOMEM;
@@ -842,8 +861,7 @@ static int __init early_microcode_update_cpu(void)
     return microcode_update_cpu(patch);
 }
 
-int __init early_microcode_init(unsigned long *module_map,
-                                const struct multiboot_info *mbi)
+int __init early_microcode_init(struct boot_info *bootinfo)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
     int rc = 0;
@@ -867,11 +885,11 @@ int __init early_microcode_init(unsigned long *module_map,
         return -ENODEV;
     }
 
-    microcode_grab_module(module_map, mbi);
+    microcode_grab_module(bootinfo);
 
     ucode_ops.collect_cpu_info();
 
-    if ( ucode_mod.mod_end || ucode_blob.size )
+    if ( ucode_blob.size )
         rc = early_microcode_update_cpu();
 
     return rc;
diff --git a/xen/arch/x86/include/asm/boot.h b/xen/arch/x86/include/asm/boot.h
index bcf4f2e2e3..e51fd32280 100644
--- a/xen/arch/x86/include/asm/boot.h
+++ b/xen/arch/x86/include/asm/boot.h
@@ -6,19 +6,6 @@
 
 #include <asm/setup.h>
 
-static inline void *bootstrap_map_multiboot(const module_t *mod)
-{
-    struct boot_module bm;
-
-    if ( !mod )
-        return bootstrap_map(NULL);
-
-    bm.start = mod->mod_start << PAGE_SHIFT;
-    bm.size = mod->mod_end;
-
-    return bootstrap_map(&bm);
-}
-
 static inline unsigned long bootmodule_index(
     const struct boot_info *info, bootmod_type_t bootmod_type,
     unsigned long start)
diff --git a/xen/arch/x86/include/asm/microcode.h b/xen/arch/x86/include/asm/microcode.h
index 62ce3418f7..803fbbb270 100644
--- a/xen/arch/x86/include/asm/microcode.h
+++ b/xen/arch/x86/include/asm/microcode.h
@@ -1,6 +1,7 @@
 #ifndef ASM_X86__MICROCODE_H
 #define ASM_X86__MICROCODE_H
 
+#include <xen/bootinfo.h>
 #include <xen/types.h>
 #include <xen/percpu.h>
 
@@ -23,10 +24,8 @@ DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
 
 void microcode_set_module(unsigned int idx);
 int microcode_update(XEN_GUEST_HANDLE(const_void), unsigned long len);
-int early_microcode_init(unsigned long *module_map,
-                         const struct multiboot_info *mbi);
-int microcode_init_cache(unsigned long *module_map,
-                         const struct multiboot_info *mbi);
+int early_microcode_init(struct boot_info *bootinfo);
+int microcode_init_cache(struct boot_info *bootinfo);
 int microcode_update_one(void);
 
 #endif /* ASM_X86__MICROCODE_H */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a616ccc0a8..50a1a124b0 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1023,7 +1023,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     unsigned int initrdidx, num_parked = 0;
     multiboot_info_t *mbi;
     module_t *mod;
-    unsigned long nr_pages, raw_max_page, module_map[1];
+    unsigned long nr_pages, raw_max_page;
     int i, j, e820_warn = 0, bytes = 0;
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
@@ -1190,8 +1190,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     }
 
     /* Dom0 kernel is the first boot module */
-    bitmap_fill(module_map, mbi->mods_count);
-    __clear_bit(0, module_map); /* Dom0 kernel is always first */
     boot_info->mods[0].bootmod_type = BOOTMOD_KERNEL;
 
     if ( pvh_boot )
@@ -1371,7 +1369,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
      * TODO: load ucode earlier once multiboot modules become accessible
      * at an earlier stage.
      */
-    early_microcode_init(module_map, mbi);
+    early_microcode_init(boot_info);
 
     if ( xen_phys_start )
     {
@@ -1906,7 +1904,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     timer_init();
 
-    microcode_init_cache(module_map, mbi); /* Needs xmalloc() */
+    microcode_init_cache(boot_info); /* Needs xmalloc() */
 
     tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
 
-- 
2.25.1


