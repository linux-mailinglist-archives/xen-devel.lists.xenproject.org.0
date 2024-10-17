Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D75F9A2A31
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:06:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820865.1234532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Twv-0002D5-14; Thu, 17 Oct 2024 17:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820865.1234532; Thu, 17 Oct 2024 17:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Twu-0002AY-Tr; Thu, 17 Oct 2024 17:06:08 +0000
Received: by outflank-mailman (input) for mailman id 820865;
 Thu, 17 Oct 2024 17:06:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Twt-00014B-Ui
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:06:07 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1804ce12-8caa-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:06:06 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184636285638.5734527381169;
 Thu, 17 Oct 2024 10:03:56 -0700 (PDT)
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
X-Inumbo-ID: 1804ce12-8caa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184638; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q7r4nHSVDq5gQXeVmJvZns0msN1qkLbRSMFtRD5dm70aFF+PWpFc9HhCBHNHiwhcrnnrVJU5z0T11OUvA7SbRwyS8bBP96XEq725q8PBS3K1ydYyKq0p02JMgxLo06WS1dk0yvRgFdGlM530DJaZDSaGgEVjkzm5KLo0kvlQ9b8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184638; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mEfInqFkYxY5RZVtNiKPHgUhdYnWLo2IuwYz96mD0y4=; 
	b=OH1WOhblMEbskTZ5gd+jMxSUbyekb8sDrrjgoZQnFHiPmoNYPa67XBnVOC0AxJdVSv2JR+uWr4KY9I00adDOzWa9rWFbqaydd5wRH59kt92xWbxAZrJlmu5lsH9a83Yh8QEzpVS69p89p8CZ5mfCQj/eG3H7IwaE5hgpK9L21MM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184638;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=mEfInqFkYxY5RZVtNiKPHgUhdYnWLo2IuwYz96mD0y4=;
	b=MjxdYnmfmkS1pCZB/lpCPSatWm43UxUnNJX+nozJAGKBP0cslJgLTjHS3LJrSHvW
	2T87ZTKb7c9Aeds2mQX+kEef9L/3CK8NtlJ2zryo/GEWYvycGDYOCViiBu8s/nNw2Ku
	VpIdn5Yy5AmnFbTtbgGhfaqCn9M5vw2p9VH1GurE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 17/44] x86/boot: convert microcode loading to consume struct boot_info
Date: Thu, 17 Oct 2024 13:02:57 -0400
Message-Id: <20241017170325.3842-18-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
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
Changes since v5:
- moved bootstrap_map_bm definition to this commit
---
 xen/arch/x86/cpu/microcode/core.c    | 37 +++++++++++++---------------
 xen/arch/x86/include/asm/bootinfo.h  |  1 +
 xen/arch/x86/include/asm/microcode.h | 14 ++++++-----
 xen/arch/x86/include/asm/setup.h     |  2 ++
 xen/arch/x86/setup.c                 | 12 +++++++--
 5 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 8564e4d2c94c..22fea80bc97e 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -35,6 +35,7 @@
 #include <xen/watchdog.h>
 
 #include <asm/apic.h>
+#include <asm/bootinfo.h>
 #include <asm/cpu-policy.h>
 #include <asm/nmi.h>
 #include <asm/processor.h>
@@ -153,10 +154,8 @@ static int __init cf_check parse_ucode(const char *s)
 custom_param("ucode", parse_ucode);
 
 static void __init microcode_scan_module(
-    unsigned long *module_map,
-    const multiboot_info_t *mbi)
+    unsigned long *module_map, const struct boot_info *bi)
 {
-    module_t *mod = (module_t *)__va(mbi->mods_addr);
     uint64_t *_blob_start;
     unsigned long _blob_size;
     struct cpio_data cd;
@@ -178,16 +177,16 @@ static void __init microcode_scan_module(
     /*
      * Try all modules and see whichever could be the microcode blob.
      */
-    for ( i = 1 /* Ignore dom0 kernel */; i < mbi->mods_count; i++ )
+    for ( i = 1 /* Ignore dom0 kernel */; i < bi->nr_modules; i++ )
     {
         if ( !test_bit(i, module_map) )
             continue;
 
-        _blob_start = bootstrap_map(&mod[i]);
-        _blob_size = mod[i].mod_end;
+        _blob_start = bootstrap_map_bm(&bi->mods[i]);
+        _blob_size = bi->mods[i].size;
         if ( !_blob_start )
         {
-            printk("Could not map multiboot module #%d (size: %ld)\n",
+            printk("Could not map boot module #%d (size: %ld)\n",
                    i, _blob_size);
             continue;
         }
@@ -205,20 +204,18 @@ static void __init microcode_scan_module(
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
@@ -822,8 +819,8 @@ static int __init early_update_cache(const void *data, size_t len)
     return rc;
 }
 
-int __init microcode_init_cache(unsigned long *module_map,
-                                const struct multiboot_info *mbi)
+int __init microcode_init_cache(
+    unsigned long *module_map, const struct boot_info *bi)
 {
     int rc = 0;
 
@@ -832,7 +829,7 @@ int __init microcode_init_cache(unsigned long *module_map,
 
     if ( ucode_scan )
         /* Need to rescan the modules because they might have been relocated */
-        microcode_scan_module(module_map, mbi);
+        microcode_scan_module(module_map, bi);
 
     if ( ucode_mod.mod_end )
         rc = early_update_cache(bootstrap_map(&ucode_mod),
@@ -879,7 +876,7 @@ static int __init early_microcode_update_cpu(void)
 }
 
 int __init early_microcode_init(unsigned long *module_map,
-                                const struct multiboot_info *mbi)
+                                struct boot_info *bi)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
     int rc = 0;
@@ -922,7 +919,7 @@ int __init early_microcode_init(unsigned long *module_map,
         return -ENODEV;
     }
 
-    microcode_grab_module(module_map, mbi);
+    microcode_grab_module(module_map, bi);
 
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 6903ab00ec90..19a0ed16ab27 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -20,6 +20,7 @@ enum bootmod_type {
     BOOTMOD_XEN,
     BOOTMOD_KERNEL,
     BOOTMOD_RAMDISK,
+    BOOTMOD_MICROCODE,
 };
 
 struct boot_module {
diff --git a/xen/arch/x86/include/asm/microcode.h b/xen/arch/x86/include/asm/microcode.h
index 57c08205d475..495c8f7a7cc5 100644
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
+    unsigned long *module_map, const struct boot_info *bi);
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
index 852454c161ee..04de06ba1400 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -482,6 +482,14 @@ void *__init bootstrap_map(const module_t *mod)
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
@@ -1377,7 +1385,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * TODO: load ucode earlier once multiboot modules become accessible
      * at an earlier stage.
      */
-    early_microcode_init(module_map, mbi);
+    early_microcode_init(module_map, bi);
 
     if ( xen_phys_start )
     {
@@ -1929,7 +1937,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     timer_init();
 
-    microcode_init_cache(module_map, mbi); /* Needs xmalloc() */
+    microcode_init_cache(module_map, bi); /* Needs xmalloc() */
 
     tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
 
-- 
2.30.2


