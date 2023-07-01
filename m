Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71357744599
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 02:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557672.871275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFOWn-0001A7-RH; Sat, 01 Jul 2023 00:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557672.871275; Sat, 01 Jul 2023 00:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFOWn-00017y-Mu; Sat, 01 Jul 2023 00:31:53 +0000
Received: by outflank-mailman (input) for mailman id 557672;
 Sat, 01 Jul 2023 00:31:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypVN=CT=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1qFOWl-0007yM-CS
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 00:31:51 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa5d7fcc-17a6-11ee-8611-37d641c3527e;
 Sat, 01 Jul 2023 02:31:49 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-76728ae3162so224236785a.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jun 2023 17:31:49 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83]) by smtp.gmail.com with ESMTPSA id
 s68-20020a632c47000000b0055b61cd99a1sm1824296pgs.81.2023.06.30.17.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 17:31:46 -0700 (PDT)
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
X-Inumbo-ID: aa5d7fcc-17a6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688171507; x=1690763507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNP8VdblK4Rt8e2FoRKT44HjkzeP53PPJ4jpSpNQaUw=;
        b=dZsj6vciSfnMLCMaU0cMPpVzsvTf2cA6H5rK4dqitVEHa7PIl9bqnNbVX3YCmArVSD
         IMEXc7JXp9i0n/PGdZX9qMeKuVaEdqi1JfQcIbGoD4A3Tg/fYHZ5qWS5LnG8xrnN8FH1
         Qri/PoGiBRsUxe8lInpy/Y3tNDsK+N/06FDCG77bszgiEqbDDNt1ISOCF7hrbk0zEJZF
         u3xEDplqMMf5QyYIZXM+igxM68XL6fyrQU/HlA+q/V8iig/rjo8PHvxFVZnmdcg9lZsV
         5KpUfri4831gj2h32ooplKW5XrDdfAHBoQV/NLL9yEaAH4ZJQQM+UxajHNgk+edO/lhN
         CM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688171507; x=1690763507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tNP8VdblK4Rt8e2FoRKT44HjkzeP53PPJ4jpSpNQaUw=;
        b=OzBtmcktinPgWc4XhtkaIz/SXeaJ6nzCQuxZxTc2JMoAV2ZcCRLdjcX+gt+dJcGZKY
         A6IzBRT5MOmL5RBHqkdqyRD4PR4clvF+tD583EyrF+YdyOfAUuylU1Cg3BQEIi4g1SjI
         OvuG/96KKedmGW08c1W8twytVnn3Z4IZpNGIGldqXFu1T6hQHnrUL8gQZDRU6aAH+w1h
         uDrAevlVcDerI55VGHvTwEQ640xI9B1QjbD8QQoEVSJ/XhKgBFcr4RHmGZRggjQyyNA4
         Y9f0KegaY0Pgq1kn560TCPt0rE2xrEWFotxKeIJf2QUS4dpbS74EmzR33hdzSKUHaHUP
         RpKg==
X-Gm-Message-State: ABy/qLawIMHRzXLb3UaViZv69lx9jqBV9Ddkd89tCgnFNahEBlioCNmd
	uhRiyZjbQweGuNo9EAqK8cFOjEtlfxw=
X-Google-Smtp-Source: APBJJlHXadhO0zI3fny7/VsDSq54jA5+/G/AaPurjt0vF6Vo+E7TEPOAcjmOGo6hXLaSNWVGV0iNyg==
X-Received: by 2002:a05:620a:29d2:b0:767:3999:5277 with SMTP id s18-20020a05620a29d200b0076739995277mr5531547qkp.70.1688171507611;
        Fri, 30 Jun 2023 17:31:47 -0700 (PDT)
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
Subject: [PATCH 06/11] x86 setup, microcode: switch to the new bootinfo structures
Date: Fri, 30 Jun 2023 17:31:27 -0700
Message-Id: <20230701003132.2210306-7-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230701003132.2210306-1-christopher.w.clark@gmail.com>
References: <20230701003132.2210306-1-christopher.w.clark@gmail.com>
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

changes since v1:
- an incremental subset of patch 3
- added the drop of the temporary bootstrap map
---
 xen/arch/x86/cpu/microcode/core.c    | 148 +++++++++++++++------------
 xen/arch/x86/include/asm/boot.h      |  13 ---
 xen/arch/x86/include/asm/microcode.h |   7 +-
 xen/arch/x86/setup.c                 |   8 +-
 4 files changed, 89 insertions(+), 87 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index e720a89167..c674ccf88c 100644
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
@@ -737,11 +770,6 @@ static int __init cf_check microcode_init(void)
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
@@ -785,19 +813,15 @@ static int __init early_update_cache(const void *data, size_t len)
     return rc;
 }
 
-int __init microcode_init_cache(unsigned long *module_map,
-                                const struct multiboot_info *mbi)
+int __init microcode_init_cache(struct boot_info *bootinfo)
 {
     int rc = 0;
 
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
@@ -815,11 +839,6 @@ static int __init early_microcode_update_cpu(void)
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
@@ -838,8 +857,7 @@ static int __init early_microcode_update_cpu(void)
     return microcode_update_cpu(patch);
 }
 
-int __init early_microcode_init(unsigned long *module_map,
-                                const struct multiboot_info *mbi)
+int __init early_microcode_init(struct boot_info *bootinfo)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
     int rc = 0;
@@ -863,11 +881,11 @@ int __init early_microcode_init(unsigned long *module_map,
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


