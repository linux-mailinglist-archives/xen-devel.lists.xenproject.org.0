Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E383966BA9
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:56:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786778.1196576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bd-0005Un-Dd; Fri, 30 Aug 2024 21:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786778.1196576; Fri, 30 Aug 2024 21:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bd-0005SC-3h; Fri, 30 Aug 2024 21:56:33 +0000
Received: by outflank-mailman (input) for mailman id 786778;
 Fri, 30 Aug 2024 21:56:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9VB-00065G-Hn
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:49:53 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c894741f-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:49:52 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054478301324.8472500488509;
 Fri, 30 Aug 2024 14:47:58 -0700 (PDT)
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
X-Inumbo-ID: c894741f-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054480; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aHPpeIVNL0p7qiPf3/PYT+YdR6pGnPsfotpzxAxe9GUrjvMnDEtSTs4Dk7hTqj5wy3JyImccl2jqZR1xratTWf8HWFUK+p8kdn8bt6PapBN9+LUIF0dzdjZ5D8plYKrSzXWUwRnbjgOp9UvYGyUzJbjaWvoJyDiCqhCVXOb17uw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054480; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kpui6t02X83Vt5ycf0OvPFAWFtuSlnhdgDe57IspVC4=; 
	b=OCoZcvqymaIice8IHgu574wZY7TeKr1nbbVPrk7vxy4EqMBByu+A6/LA19hgJkc9F4KrZyOAMpSR/VYLlGNWe6X6UJnEtIMWJ122jphDwZR90nyrXwb0RB1KqeRWvO1mJueAZdT3ZKUaWNWw76O4ipQWjZobTMYNy14SXtvSS00=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054480;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=kpui6t02X83Vt5ycf0OvPFAWFtuSlnhdgDe57IspVC4=;
	b=asyp2iG7GLWIyAHoBvsqrdEJxpqLGDn8v/EQGypHao6+NgVAPgY9HEf/WtRcea/A
	La6bCLcPWupK4OAoTQKQ5isgBTlaNw5y9Mtjx8N6n6ngvm17DlAWKtw7K2W6ux5SqB7
	4HSImcYDn9PusSujYjI4tl2gg/TdPeVZ/2vacvPg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 17/44] x86/boot: convert microcode loading to consume struct boot_info
Date: Fri, 30 Aug 2024 17:47:02 -0400
Message-Id: <20240830214730.1621-18-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Convert the microcode loading functions to take struct boot_info, and then
using struct boot_module to map and check for microcode. To keep the changes
focused, continue using the struct mod to hold the reference to the microcode
that is used by the late microcode logic.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/cpu/microcode/core.c    | 37 +++++++++++++---------------
 xen/arch/x86/include/asm/bootinfo.h  |  1 +
 xen/arch/x86/include/asm/microcode.h | 14 ++++++-----
 xen/arch/x86/setup.c                 |  4 +--
 4 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 8a9e744489b9..653a725173ba 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -35,6 +35,7 @@
 #include <xen/watchdog.h>
 
 #include <asm/apic.h>
+#include <asm/bootinfo.h>
 #include <asm/cpu-policy.h>
 #include <asm/nmi.h>
 #include <asm/processor.h>
@@ -152,10 +153,8 @@ static int __init cf_check parse_ucode(const char *s)
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
@@ -177,16 +176,16 @@ static void __init microcode_scan_module(
     /*
      * Try all modules and see whichever could be the microcode blob.
      */
-    for ( i = 1 /* Ignore dom0 kernel */; i < mbi->mods_count; i++ )
+    for ( i = 1 /* Ignore dom0 kernel */; i < bi->nr_mods; i++ )
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
@@ -204,20 +203,18 @@ static void __init microcode_scan_module(
 }
 
 static void __init microcode_grab_module(
-    unsigned long *module_map,
-    const multiboot_info_t *mbi)
+    unsigned long *module_map, const struct boot_info *bi)
 {
-    module_t *mod = (module_t *)__va(mbi->mods_addr);
-
     if ( ucode_mod_idx < 0 )
-        ucode_mod_idx += mbi->mods_count;
-    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= mbi->mods_count ||
+        ucode_mod_idx += bi->nr_mods;
+    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_mods ||
          !__test_and_clear_bit(ucode_mod_idx, module_map) )
         goto scan;
-    ucode_mod = mod[ucode_mod_idx];
+    bi->mods[ucode_mod_idx].type = BOOTMOD_MICROCODE;
+    ucode_mod = *bi->mods[ucode_mod_idx].early_mod;
 scan:
     if ( ucode_scan )
-        microcode_scan_module(module_map, mbi);
+        microcode_scan_module(module_map, bi);
 }
 
 static struct microcode_ops __ro_after_init ucode_ops;
@@ -805,8 +802,8 @@ static int __init early_update_cache(const void *data, size_t len)
     return rc;
 }
 
-int __init microcode_init_cache(unsigned long *module_map,
-                                const struct multiboot_info *mbi)
+int __init microcode_init_cache(
+    unsigned long *module_map, const struct boot_info *bi)
 {
     int rc = 0;
 
@@ -815,7 +812,7 @@ int __init microcode_init_cache(unsigned long *module_map,
 
     if ( ucode_scan )
         /* Need to rescan the modules because they might have been relocated */
-        microcode_scan_module(module_map, mbi);
+        microcode_scan_module(module_map, bi);
 
     if ( ucode_mod.mod_end )
         rc = early_update_cache(bootstrap_map(&ucode_mod),
@@ -862,7 +859,7 @@ static int __init early_microcode_update_cpu(void)
 }
 
 int __init early_microcode_init(unsigned long *module_map,
-                                const struct multiboot_info *mbi)
+                                const struct boot_info *bi)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
     int rc = 0;
@@ -905,7 +902,7 @@ int __init early_microcode_init(unsigned long *module_map,
         return -ENODEV;
     }
 
-    microcode_grab_module(module_map, mbi);
+    microcode_grab_module(module_map, bi);
 
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 740308693629..1cef48457c66 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -17,6 +17,7 @@ enum bootmod_type {
     BOOTMOD_XEN,
     BOOTMOD_KERNEL,
     BOOTMOD_RAMDISK,
+    BOOTMOD_MICROCODE,
 };
 
 struct boot_module {
diff --git a/xen/arch/x86/include/asm/microcode.h b/xen/arch/x86/include/asm/microcode.h
index 57c08205d475..02fdb56bb82b 100644
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
+    unsigned long *module_map, const struct boot_info *bi);
+int microcode_init_cache(
+    unsigned long *module_map, const struct boot_info *bi);
 int microcode_update_one(void);
 
 #endif /* ASM_X86__MICROCODE_H */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index da75dfce083d..6495ab393576 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1398,7 +1398,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * TODO: load ucode earlier once multiboot modules become accessible
      * at an earlier stage.
      */
-    early_microcode_init(module_map, mbi);
+    early_microcode_init(module_map, boot_info);
 
     if ( xen_phys_start )
     {
@@ -1952,7 +1952,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     timer_init();
 
-    microcode_init_cache(module_map, mbi); /* Needs xmalloc() */
+    microcode_init_cache(module_map, boot_info); /* Needs xmalloc() */
 
     tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
 
-- 
2.30.2


