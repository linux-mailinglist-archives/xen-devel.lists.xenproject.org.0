Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F8E9921CB
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:52:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811339.1223929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZB2-0007ty-Kp; Sun, 06 Oct 2024 21:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811339.1223929; Sun, 06 Oct 2024 21:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZB2-0007rg-Gm; Sun, 06 Oct 2024 21:52:32 +0000
Received: by outflank-mailman (input) for mailman id 811339;
 Sun, 06 Oct 2024 21:52:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZB0-0007Zk-N2
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:52:30 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47b2d596-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:52:29 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251424241362.33263729658347;
 Sun, 6 Oct 2024 14:50:24 -0700 (PDT)
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
X-Inumbo-ID: 47b2d596-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251426; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Dj3EA8If0G5yMwKqaTp3FThzMtbUDefDpjUIs0gY1Jf2Qa/BGak3dAZk5/HG3TKYRZajafvTlz1e9aqQnGR7Noom6ODChTxju1n4YuKgcucbdbiIsoo1RuaNBWdYpwdZCiru3u/93GthrtAT0DRt4EhYwuR9bKB9dROapyAFvCw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251426; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HEqo8d6ZIFv5zBQXXADComdO+6rAups1e2Re1r6sRig=; 
	b=WEzs8n0cuOpxJcvDVmDkrXvbVBzRownzeqaChiAo5YUQF/XnUvrFE5BRdi1O0aGj79QDYK4S0u1QZdhAXCZbuq5Xps3/qt5gJEE1KHckC8e3zwckB3UrvoSR1g8xZKn71UDMJyqWyqDQzqOI7Xbj4EkdU7jxvFROlArt3GlDP7I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251426;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=HEqo8d6ZIFv5zBQXXADComdO+6rAups1e2Re1r6sRig=;
	b=SPTLkQK7xclopGcA5Q0I2EftBiP9yT7m6KmGKxBTxb7NoG/y4DlSJfWd8PFuTgyS
	odp0LsCDIwHxY6syyR7Tm/ktYZHSx2J3ZfeyzQxjSGQWrXQIXINIMnllnQqTmqRBRqm
	VboEVnRN+okPH4L9y3BpwPqVaJJVSBk5F4v4JKoc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 17/44] x86/boot: convert microcode loading to consume struct boot_info
Date: Sun,  6 Oct 2024 17:49:28 -0400
Message-Id: <20241006214956.24339-18-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
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
index 7833b065eff1..1ec29a423061 100644
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
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 235b4e41f653..48c509b62a4c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1382,7 +1382,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * TODO: load ucode earlier once multiboot modules become accessible
      * at an earlier stage.
      */
-    early_microcode_init(module_map, mbi);
+    early_microcode_init(module_map, bi);
 
     if ( xen_phys_start )
     {
@@ -1939,7 +1939,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     timer_init();
 
-    microcode_init_cache(module_map, mbi); /* Needs xmalloc() */
+    microcode_init_cache(module_map, bi); /* Needs xmalloc() */
 
     tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
 
-- 
2.30.2


