Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BA09A585D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823026.1237085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gjV-0007tA-8z; Mon, 21 Oct 2024 00:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823026.1237085; Mon, 21 Oct 2024 00:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gjV-0007qT-3v; Mon, 21 Oct 2024 00:57:17 +0000
Received: by outflank-mailman (input) for mailman id 823026;
 Mon, 21 Oct 2024 00:57:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gaM-0000Dk-GX
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:47:50 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 173a9453-8f46-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 02:47:48 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471596570279.0068470318946;
 Sun, 20 Oct 2024 17:46:36 -0700 (PDT)
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
X-Inumbo-ID: 173a9453-8f46-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729471598; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=agHxrAwa/gwzl0lF5c5hip/jZgdb1dhKrC1ik3YA170glJuri75yKhD9UI67dwapoHyA9EjKvz/WXRos8xcugos7BEmfcTMQGQ6LO7gTsqyIia8uW3Y/B8ZT8EofVAwhUNlMsZNnbXEpifwh+RYSf2cOWkexOWjiIHZyqQK6M+E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471598; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7htI5l3h8JWhW9QL/lD8LlUYIubTfk49/4+QzqSxcrQ=; 
	b=krd8hze8VMzYJtvT2OSd6aAWsm/sPOqLdBc2RqSKe/HKcnEW/0Mg/Du6r2FwwK9N1TM+BxxQVGLVyWwWltiHbAt8NjP59wgw39Nu9j8W9cnlQWsALVcGzyS+mY8aCgrLbwG4uQo5NokcYCywfdbmtEuucS8Pb2Mo53ur6Si1TwQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471598;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=7htI5l3h8JWhW9QL/lD8LlUYIubTfk49/4+QzqSxcrQ=;
	b=bv47YzelbM1dTZhrhRFsvaBP0z7QgwF8k3fOdDYcVDZe2XE5Op9/ATadSWjWYUNJ
	3orK/xI63WsWFuC/jdx7wcEhco1O6xUKzhIv6PRnhKCKcsh6zprhr+Um/PXSei0f+R7
	JxaMfcS9mNjvckgxQloywrc8H4/mVBzrZRs/UQV8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 11/38] x86/boot: convert microcode loading to consume struct boot_info
Date: Sun, 20 Oct 2024 20:45:46 -0400
Message-Id: <20241021004613.18793-12-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Convert the microcode loading functions to take struct boot_info, and then
using struct boot_module to map and check for microcode. To keep the changes
focused, continue using the struct mod to hold the reference to the microcode
that is used by the late microcode logic.

To support loading the microcode boot module in to the bootstrap map, introduce
bootstrap_map_bm() for mapping struct boot_module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v6:
- introduce helpers for_each_boot_module and boot_module_index
- drop const due to object use changes done by helpers
- converted boot module search to use for each helper
- make bootstrap unmap call match bootstrap map

Changes since v5:
- moved bootstrap_map_bm definition to this commit
---
 xen/arch/x86/cpu/microcode/core.c    | 46 ++++++++++++----------------
 xen/arch/x86/include/asm/bootinfo.h  | 25 +++++++++++++++
 xen/arch/x86/include/asm/microcode.h | 14 +++++----
 xen/arch/x86/include/asm/setup.h     |  2 ++
 xen/arch/x86/setup.c                 | 12 ++++++--
 5 files changed, 65 insertions(+), 34 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 8564e4d2c94c..11a0ba978a33 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -35,6 +35,7 @@
 #include <xen/watchdog.h>
 
 #include <asm/apic.h>
+#include <asm/bootinfo.h>
 #include <asm/cpu-policy.h>
 #include <asm/nmi.h>
 #include <asm/processor.h>
@@ -153,16 +154,14 @@ static int __init cf_check parse_ucode(const char *s)
 custom_param("ucode", parse_ucode);
 
 static void __init microcode_scan_module(
-    unsigned long *module_map,
-    const multiboot_info_t *mbi)
+    unsigned long *module_map, struct boot_info *bi)
 {
-    module_t *mod = (module_t *)__va(mbi->mods_addr);
     uint64_t *_blob_start;
     unsigned long _blob_size;
     struct cpio_data cd;
     long offset;
     const char *p = NULL;
-    int i;
+    struct boot_module *bm;
 
     ucode_blob.size = 0;
     if ( !ucode_scan )
@@ -178,17 +177,14 @@ static void __init microcode_scan_module(
     /*
      * Try all modules and see whichever could be the microcode blob.
      */
-    for ( i = 1 /* Ignore dom0 kernel */; i < mbi->mods_count; i++ )
+    for_each_boot_module(bi, bm, BOOTMOD_UNKNOWN)
     {
-        if ( !test_bit(i, module_map) )
-            continue;
-
-        _blob_start = bootstrap_map(&mod[i]);
-        _blob_size = mod[i].mod_end;
+        _blob_start = bootstrap_map_bm(bm);
+        _blob_size = bm->size;
         if ( !_blob_start )
         {
-            printk("Could not map multiboot module #%d (size: %ld)\n",
-                   i, _blob_size);
+            printk("Could not map boot module #%d (size: %ld)\n",
+                   boot_module_index(bi, bm), _blob_size);
             continue;
         }
         cd.data = NULL;
@@ -200,25 +196,23 @@ static void __init microcode_scan_module(
             ucode_blob.data = cd.data;
             break;
         }
-        bootstrap_map(NULL);
+        bootstrap_map_bm(NULL);
     }
 }
 
 static void __init microcode_grab_module(
-    unsigned long *module_map,
-    const multiboot_info_t *mbi)
+    unsigned long *module_map, struct boot_info *bi)
 {
-    module_t *mod = (module_t *)__va(mbi->mods_addr);
-
     if ( ucode_mod_idx < 0 )
-        ucode_mod_idx += mbi->mods_count;
-    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= mbi->mods_count ||
+        ucode_mod_idx += bi->nr_modules;
+    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
          !__test_and_clear_bit(ucode_mod_idx, module_map) )
         goto scan;
-    ucode_mod = mod[ucode_mod_idx];
+    bi->mods[ucode_mod_idx].type = BOOTMOD_MICROCODE;
+    ucode_mod = *bi->mods[ucode_mod_idx].mod;
 scan:
     if ( ucode_scan )
-        microcode_scan_module(module_map, mbi);
+        microcode_scan_module(module_map, bi);
 }
 
 static struct microcode_ops __ro_after_init ucode_ops;
@@ -822,8 +816,8 @@ static int __init early_update_cache(const void *data, size_t len)
     return rc;
 }
 
-int __init microcode_init_cache(unsigned long *module_map,
-                                const struct multiboot_info *mbi)
+int __init microcode_init_cache(
+    unsigned long *module_map, struct boot_info *bi)
 {
     int rc = 0;
 
@@ -832,7 +826,7 @@ int __init microcode_init_cache(unsigned long *module_map,
 
     if ( ucode_scan )
         /* Need to rescan the modules because they might have been relocated */
-        microcode_scan_module(module_map, mbi);
+        microcode_scan_module(module_map, bi);
 
     if ( ucode_mod.mod_end )
         rc = early_update_cache(bootstrap_map(&ucode_mod),
@@ -879,7 +873,7 @@ static int __init early_microcode_update_cpu(void)
 }
 
 int __init early_microcode_init(unsigned long *module_map,
-                                const struct multiboot_info *mbi)
+                                struct boot_info *bi)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
     int rc = 0;
@@ -922,7 +916,7 @@ int __init early_microcode_init(unsigned long *module_map,
         return -ENODEV;
     }
 
-    microcode_grab_module(module_map, mbi);
+    microcode_grab_module(module_map, bi);
 
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 3eb9930904c0..e470df48700d 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -20,6 +20,7 @@ enum bootmod_type {
     BOOTMOD_XEN,
     BOOTMOD_KERNEL,
     BOOTMOD_RAMDISK,
+    BOOTMOD_MICROCODE,
 };
 
 struct boot_module {
@@ -69,6 +70,30 @@ struct boot_info {
     struct boot_module mods[MAX_NR_BOOTMODS + 1];
 };
 
+static inline struct boot_module *__init next_boot_module_by_type(
+    struct boot_info *bi, struct boot_module *bm, enum bootmod_type t)
+{
+    if ( bm == NULL )
+        bm = &bi->mods[0];
+    else
+        bm++;
+
+    for ( ; bm <= &bi->mods[bi->nr_modules]; bm++ )
+    {
+        if ( bm->type == t )
+            return bm;
+    }
+
+    return NULL;
+}
+
+#define for_each_boot_module(bi, bm, t)                                     \
+    for ( bm = &bi->mods[0]; bm != NULL && bm <= &bi->mods[bi->nr_modules]; \
+          bm = next_boot_module_by_type(bi, bm, t) )
+
+#define boot_module_index(bi, bm)                   \
+    (unsigned int)(bm - &bi->mods[0])
+
 #endif /* X86_BOOTINFO_H */
 
 /*
diff --git a/xen/arch/x86/include/asm/microcode.h b/xen/arch/x86/include/asm/microcode.h
index 57c08205d475..9e7c7ab004ed 100644
--- a/xen/arch/x86/include/asm/microcode.h
+++ b/xen/arch/x86/include/asm/microcode.h
@@ -4,6 +4,8 @@
 #include <xen/types.h>
 #include <xen/percpu.h>
 
+#include <asm/bootinfo.h>
+
 #include <public/xen.h>
 
 struct multiboot_info;
@@ -22,12 +24,12 @@ struct cpu_signature {
 DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
 
 void microcode_set_module(unsigned int idx);
-int microcode_update(XEN_GUEST_HANDLE(const_void) buf,
-                     unsigned long len, unsigned int flags);
-int early_microcode_init(unsigned long *module_map,
-                         const struct multiboot_info *mbi);
-int microcode_init_cache(unsigned long *module_map,
-                         const struct multiboot_info *mbi);
+int microcode_update(
+    XEN_GUEST_HANDLE(const_void) buf, unsigned long len, unsigned int flags);
+int early_microcode_init(
+    unsigned long *module_map, struct boot_info *bi);
+int microcode_init_cache(
+    unsigned long *module_map, struct boot_info *bi);
 int microcode_update_one(void);
 
 #endif /* ASM_X86__MICROCODE_H */
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 3d189521189d..729f68ca23b8 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -2,6 +2,7 @@
 #define __X86_SETUP_H_
 
 #include <xen/multiboot.h>
+#include <asm/bootinfo.h>
 #include <asm/numa.h>
 
 extern const char __2M_text_start[], __2M_text_end[];
@@ -37,6 +38,7 @@ extern struct boot_info xen_boot_info;
 unsigned long initial_images_nrpages(nodeid_t node);
 void discard_initial_images(void);
 void *bootstrap_map(const module_t *mod);
+void *bootstrap_map_bm(const struct boot_module *bm);
 
 int remove_xen_ranges(struct rangeset *r);
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a623f9cd9df9..272d5a725c54 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -499,6 +499,14 @@ void *__init bootstrap_map(const module_t *mod)
                               pfn_to_paddr(mod->mod_start) + mod->mod_end);
 }
 
+void *__init bootstrap_map_bm(const struct boot_module *bm)
+{
+    if ( !bm )
+        return bootstrap_map_addr(0, 0);
+
+    return bootstrap_map_addr(bm->start, bm->start + bm->size);
+}
+
 static void __init move_memory(
     uint64_t dst, uint64_t src, unsigned int size)
 {
@@ -1401,7 +1409,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * TODO: load ucode earlier once multiboot modules become accessible
      * at an earlier stage.
      */
-    early_microcode_init(module_map, mbi);
+    early_microcode_init(module_map, bi);
 
     if ( xen_phys_start )
     {
@@ -1948,7 +1956,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     timer_init();
 
-    microcode_init_cache(module_map, mbi); /* Needs xmalloc() */
+    microcode_init_cache(module_map, bi); /* Needs xmalloc() */
 
     tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
 
-- 
2.30.2


