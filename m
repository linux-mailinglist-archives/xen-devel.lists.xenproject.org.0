Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D963A9AC860
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 12:58:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824525.1238682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Z46-0000tl-5m; Wed, 23 Oct 2024 10:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824525.1238682; Wed, 23 Oct 2024 10:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Z46-0000rS-18; Wed, 23 Oct 2024 10:58:10 +0000
Received: by outflank-mailman (input) for mailman id 824525;
 Wed, 23 Oct 2024 10:58:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jJ8W=RT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3Z43-0000Ow-Pw
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 10:58:07 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae8928c7-912d-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 12:58:06 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c903f5bd0eso4136111a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 03:58:06 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91571e3asm462067266b.147.2024.10.23.03.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 03:58:03 -0700 (PDT)
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
X-Inumbo-ID: ae8928c7-912d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729681085; x=1730285885; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8SPZF1bqa9Lk4OYKepi92x25hB7trhEWs2vbib+stU=;
        b=rKzP6aNekPT1RcD7Grp+I8wlneptF9Pvpxiqk9NDhctfpOednbGGwiGdUurbYpFujC
         DLgYAeM7t3bDNbrIk2D2vTB+zN5vqEKU7Xz1WVqzhUuZ4EOOvISYki3Byd+w/6FtdgxZ
         7RmbXkxPQKy5HujHsy8thc7dl4HBAUbWI+t4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729681085; x=1730285885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8SPZF1bqa9Lk4OYKepi92x25hB7trhEWs2vbib+stU=;
        b=QThtI+/Hgs0keBL/I1VMWQ20r7bMmRRPq0FGjzf2H4WcxZBFM2/Smqu1dHJzSjUXC2
         7mEJs4iAMNN3zYt67sby+C7SLYyxOIjWRzukil880JXP3UHZfdc3NvIS/EE9yLlvCp3O
         z7ecux8GI7ejV/iYG34gXTkNguzwZgSxWjd1h0CD09B8ZfN8AdgtvacKn/JsXhb+N4sj
         b0lvAQoBVVrn9Bfam5/HXpl3A6tpzowGb8QN0VV70lWTHxcCunXdjAB5soriXfqIGrcE
         A7VTiwdNZctn1/cM+1feqfXIcIqhMFZ1a/5DsRnzMtgJRWU6WEvwVvQYNHrA/UDlPA6X
         U54w==
X-Gm-Message-State: AOJu0YxqmYHqJFxyCkCHCXKOTtcFJMq1e7CeOEs0zlu7WJdJsw7Vy1NS
	hDS+Rn+WzA+tDzT+Vuzn2e8pPPKfGBIm6jX2tULDsKPHcQg5S1/eUkWGOvgGBzC0xASmyy6bYSn
	G
X-Google-Smtp-Source: AGHT+IHmTNn0JVHgpbYVl+Y31smPoUXgo9AyjVpRj/G14FOate2Tlhsisc8tNZ2unCNQ/s/U0173Tg==
X-Received: by 2002:a17:907:3dac:b0:a99:ce2f:b0ff with SMTP id a640c23a62f3a-a9abf8a4f1dmr207886566b.33.1729681085103;
        Wed, 23 Oct 2024 03:58:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/3] x86/boot: Fix microcode module handling during PVH boot
Date: Wed, 23 Oct 2024 11:57:55 +0100
Message-Id: <20241023105756.641695-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241023105756.641695-1-andrew.cooper3@citrix.com>
References: <20241023105756.641695-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

As detailed in commit 0fe607b2a144 ("x86/boot: Fix PVH boot during boot_info
transition period"), the use of __va(mbi->mods_addr) constitutes a
use-after-free on the PVH boot path.

This pattern has been in use since before PVH support was added.  Inside a PVH
VM, it will go unnoticed as long as the microcode container parser doesn't
choke on the random data it finds.

The use within early_microcode_init() happens to be safe because it's prior to
move_xen().  microcode_init_cache() is after move_xen(), and therefore unsafe.

Plumb the boot_info pointer down, replacing module_map and mbi.  Importantly,
bi->mods[].mod is a safe way to access the module list during PVH boot.

Note: microcode_scan_module() is still bogusly stashing a bootstrap_map()'d
      pointer in ucode_blob.data, which constitutes a different
      use-after-free, and only works in general because of a second bug.  This
      is unrelated to PVH, and needs untangling differently.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

Refectored/extracted from the hyperlaunch series.

There's no good Fixes tag for this, because it can't reasonably be "introduce
PVH", nor can the fix as-is reasonably be backported.  If we want to fix the
bug in older trees, we need to plumb the mod pointer down alongside mbi.
---
 xen/arch/x86/cpu/microcode/core.c    | 40 +++++++++++-----------------
 xen/arch/x86/include/asm/microcode.h |  8 +++---
 xen/arch/x86/setup.c                 |  4 +--
 3 files changed, 22 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 8564e4d2c94c..1d58cb0f3bc1 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -35,6 +35,7 @@
 #include <xen/watchdog.h>
 
 #include <asm/apic.h>
+#include <asm/bootinfo.h>
 #include <asm/cpu-policy.h>
 #include <asm/nmi.h>
 #include <asm/processor.h>
@@ -152,11 +153,8 @@ static int __init cf_check parse_ucode(const char *s)
 }
 custom_param("ucode", parse_ucode);
 
-static void __init microcode_scan_module(
-    unsigned long *module_map,
-    const multiboot_info_t *mbi)
+static void __init microcode_scan_module(struct boot_info *bi)
 {
-    module_t *mod = (module_t *)__va(mbi->mods_addr);
     uint64_t *_blob_start;
     unsigned long _blob_size;
     struct cpio_data cd;
@@ -178,13 +176,13 @@ static void __init microcode_scan_module(
     /*
      * Try all modules and see whichever could be the microcode blob.
      */
-    for ( i = 1 /* Ignore dom0 kernel */; i < mbi->mods_count; i++ )
+    for ( i = 1 /* Ignore dom0 kernel */; i < bi->nr_modules; i++ )
     {
-        if ( !test_bit(i, module_map) )
+        if ( !test_bit(i, bi->module_map) )
             continue;
 
-        _blob_start = bootstrap_map(&mod[i]);
-        _blob_size = mod[i].mod_end;
+        _blob_start = bootstrap_map(bi->mods[i].mod);
+        _blob_size = bi->mods[i].mod->mod_end;
         if ( !_blob_start )
         {
             printk("Could not map multiboot module #%d (size: %ld)\n",
@@ -204,21 +202,17 @@ static void __init microcode_scan_module(
     }
 }
 
-static void __init microcode_grab_module(
-    unsigned long *module_map,
-    const multiboot_info_t *mbi)
+static void __init microcode_grab_module(struct boot_info *bi)
 {
-    module_t *mod = (module_t *)__va(mbi->mods_addr);
-
     if ( ucode_mod_idx < 0 )
-        ucode_mod_idx += mbi->mods_count;
-    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= mbi->mods_count ||
-         !__test_and_clear_bit(ucode_mod_idx, module_map) )
+        ucode_mod_idx += bi->nr_modules;
+    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
+         !__test_and_clear_bit(ucode_mod_idx, bi->module_map) )
         goto scan;
-    ucode_mod = mod[ucode_mod_idx];
+    ucode_mod = *bi->mods[ucode_mod_idx].mod;
 scan:
     if ( ucode_scan )
-        microcode_scan_module(module_map, mbi);
+        microcode_scan_module(bi);
 }
 
 static struct microcode_ops __ro_after_init ucode_ops;
@@ -822,8 +816,7 @@ static int __init early_update_cache(const void *data, size_t len)
     return rc;
 }
 
-int __init microcode_init_cache(unsigned long *module_map,
-                                const struct multiboot_info *mbi)
+int __init microcode_init_cache(struct boot_info *bi)
 {
     int rc = 0;
 
@@ -832,7 +825,7 @@ int __init microcode_init_cache(unsigned long *module_map,
 
     if ( ucode_scan )
         /* Need to rescan the modules because they might have been relocated */
-        microcode_scan_module(module_map, mbi);
+        microcode_scan_module(bi);
 
     if ( ucode_mod.mod_end )
         rc = early_update_cache(bootstrap_map(&ucode_mod),
@@ -878,8 +871,7 @@ static int __init early_microcode_update_cpu(void)
     return microcode_update_cpu(patch, 0);
 }
 
-int __init early_microcode_init(unsigned long *module_map,
-                                const struct multiboot_info *mbi)
+int __init early_microcode_init(struct boot_info *bi)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
     int rc = 0;
@@ -922,7 +914,7 @@ int __init early_microcode_init(unsigned long *module_map,
         return -ENODEV;
     }
 
-    microcode_grab_module(module_map, mbi);
+    microcode_grab_module(bi);
 
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
diff --git a/xen/arch/x86/include/asm/microcode.h b/xen/arch/x86/include/asm/microcode.h
index 57c08205d475..a278773f8b5d 100644
--- a/xen/arch/x86/include/asm/microcode.h
+++ b/xen/arch/x86/include/asm/microcode.h
@@ -24,10 +24,10 @@ DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
 void microcode_set_module(unsigned int idx);
 int microcode_update(XEN_GUEST_HANDLE(const_void) buf,
                      unsigned long len, unsigned int flags);
-int early_microcode_init(unsigned long *module_map,
-                         const struct multiboot_info *mbi);
-int microcode_init_cache(unsigned long *module_map,
-                         const struct multiboot_info *mbi);
 int microcode_update_one(void);
 
+struct boot_info;
+int early_microcode_init(struct boot_info *bi);
+int microcode_init_cache(struct boot_info *bi);
+
 #endif /* ASM_X86__MICROCODE_H */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d8001867c925..c75b8f15fa5d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1392,7 +1392,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * TODO: load ucode earlier once multiboot modules become accessible
      * at an earlier stage.
      */
-    early_microcode_init(module_map, mbi);
+    early_microcode_init(bi);
 
     if ( xen_phys_start )
     {
@@ -1936,7 +1936,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     timer_init();
 
-    microcode_init_cache(module_map, mbi); /* Needs xmalloc() */
+    microcode_init_cache(bi); /* Needs xmalloc() */
 
     tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
 
-- 
2.39.5


