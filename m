Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0859B2B2E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 10:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826302.1240578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5LuB-0007px-De; Mon, 28 Oct 2024 09:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826302.1240578; Mon, 28 Oct 2024 09:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5LuB-0007mC-87; Mon, 28 Oct 2024 09:19:19 +0000
Received: by outflank-mailman (input) for mailman id 826302;
 Mon, 28 Oct 2024 09:19:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5Lu9-0005yk-Bo
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 09:19:17 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3b74dd4-950d-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 10:19:15 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a6b4ca29bso503396966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 02:19:15 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f05deb6sm355961566b.88.2024.10.28.02.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 02:19:12 -0700 (PDT)
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
X-Inumbo-ID: b3b74dd4-950d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730107154; x=1730711954; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOxfpCoQr1fVtkc55vOO7DIo2+McEVShrt/nmgVD2Nc=;
        b=ZeSyhCJ9M5/oLw/pxpLB2C93bnM91u4GJabTWZWu3xA5S02ZmmtuL6BL1xVgm7YDmP
         yp+UX+9tWCW1nFii1JXN0u/W/BZdJSvfkWauYgCAWmN1WeX4YZtoxtCyZhtxWmDLDl1m
         v+/QxC+LGWEEW1CBK56Vy6dWUOocdPWiMAzHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107154; x=1730711954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOxfpCoQr1fVtkc55vOO7DIo2+McEVShrt/nmgVD2Nc=;
        b=Ly5hP/OE8X765z3apa+BQVnLJS9/K1Yh4aPi73poLGsZ0cfDz++ecAvIFZROjCLxPs
         lP14kip70zBc5rM+38KgIlWlcYOE/9VcFQOvynzOHkMdJHMYZDypRXqALjoy7AuDu4lW
         fzBegri8tHP/ALCbwVEEjL7/ARUXSrBuiZYgRTJmTBpqfJeq64K9kKDG0GGGwXp34stz
         Wj/RXoJEc/SGw6dVV0JkeL9oyB2UIXyuV0NsrkqeTuB11rjGmJ985XrFpIH6XBmEyUho
         zAPpw+/ROASBXHCxWCIy9xjpVgbbXUawGIIVPr9HUegsUZHeeueNj8JzE/AjIrdvz05x
         fdmg==
X-Gm-Message-State: AOJu0Yw/nINDAVsfKGyNjmDuQ/UN3gpgGMzuBd/aAL+8HA07wE9cPcwv
	H7krMlo5nNX/j6nv+V66Y1AS/8WlCzboEar5TOnGdI63scc9HXSQaJONTfEQCZD47kD3oIg4hS5
	A
X-Google-Smtp-Source: AGHT+IF5Zj0+DmUz/iiGI9arwyEOISVm/s8FlkCO7Eh2n/FJlgucYcavycgcmFQ19nPK9n9r6tR4sQ==
X-Received: by 2002:a17:907:1b81:b0:a99:6036:90a with SMTP id a640c23a62f3a-a9de5ce2501mr517120566b.14.1730107153579;
        Mon, 28 Oct 2024 02:19:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 09/10] x86/ucode: Drop ucode_mod and ucode_blob
Date: Mon, 28 Oct 2024 09:18:55 +0000
Message-Id: <20241028091856.2151603-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Both are used to pass information from early_microcode_load() to
microcode_init_cache(), and both constitute use-after-free's in certain cases.

 * ucode_mod is a copy of the module_t identified by `ucode=$n`.  Except it's
   a copy from prior to Xen relocating the modules.  microcode_init_cache()
   might happen to find the data still intact in it's old location, but it
   might be an arbitrary part of some other module.

 * ucode_blob is a stashed pointer to a bootstrap_map() which becomes invalid
   the moment control returns to __start_xen(), where other logic is free to
   to make temporary mappings.  This was even noticed and
   microcode_init_cache() adjusted to "fix" the stashed pointers.

The information which should be passed between these two functions is which
module to look in.  Introduce early_mod_idx for this purpose.  opt_scan can be
reused to distinguish between CPIO archives and raw containers.

Notably this means microcode_init_cache() doesn't need to scan all modules any
more; we know exactly which one to look in.  However, we do re-parse the CPIO
header for simplicity.

Furthermore, microcode_init_cache(), being a presmp_initcall does not need to
use bootstrap_map() to access modules; it can use mfn_to_virt() directly,
which avoids needing to funnel exit paths through bootstrap_unmap().

Fold microcode_scan_module() into what is now it's single caller.  It operates
on the function-wide idx/data/size state which allows for a unified "found"
path irrespective of module selection method.

This resolves all issues to do with holding pointers (physical or virtual)
across returning to __start_xen().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/cpu/microcode/core.c | 172 ++++++++++++++++--------------
 1 file changed, 89 insertions(+), 83 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 28cfeab75a81..591c13ad91fb 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -28,7 +28,6 @@
 #include <xen/err.h>
 #include <xen/guest_access.h>
 #include <xen/init.h>
-#include <xen/multiboot.h>
 #include <xen/param.h>
 #include <xen/spinlock.h>
 #include <xen/stop_machine.h>
@@ -59,7 +58,6 @@
  */
 #define MICROCODE_UPDATE_TIMEOUT_US 1000000
 
-static module_t __initdata ucode_mod;
 static bool __initdata ucode_mod_forced;
 static unsigned int nr_cores;
 
@@ -79,24 +77,11 @@ static enum {
     LOADING_EXIT,
 } loading_state;
 
-/*
- * If we scan the initramfs.cpio for the early microcode code
- * and find it, then 'ucode_blob' will contain the pointer
- * and the size of said blob. It is allocated from Xen's heap
- * memory.
- */
-struct ucode_mod_blob {
-    const void *data;
-    size_t size;
-};
-
 struct patch_with_flags {
     unsigned int flags;
     const struct microcode_patch *patch;
 };
 
-static struct ucode_mod_blob __initdata ucode_blob;
-
 /* By default, ucode loading is done in NMI handler */
 static bool ucode_in_nmi = true;
 
@@ -172,46 +157,6 @@ custom_param("ucode", parse_ucode);
 
 static struct microcode_ops __ro_after_init ucode_ops;
 
-static void __init microcode_scan_module(struct boot_info *bi)
-{
-    uint64_t *_blob_start;
-    unsigned long _blob_size;
-    struct cpio_data cd;
-    int i;
-
-    ucode_blob.size = 0;
-    if ( !opt_scan )
-        return;
-
-    /*
-     * Try all modules and see whichever could be the microcode blob.
-     */
-    for ( i = 1 /* Ignore dom0 kernel */; i < bi->nr_modules; i++ )
-    {
-        if ( !test_bit(i, bi->module_map) )
-            continue;
-
-        _blob_start = bootstrap_map(bi->mods[i].mod);
-        _blob_size = bi->mods[i].mod->mod_end;
-        if ( !_blob_start )
-        {
-            printk("Could not map multiboot module #%d (size: %ld)\n",
-                   i, _blob_size);
-            continue;
-        }
-        cd.data = NULL;
-        cd.size = 0;
-        cd = find_cpio_data(ucode_ops.cpio_path, _blob_start, _blob_size);
-        if ( cd.data )
-        {
-            ucode_blob.size = cd.size;
-            ucode_blob.data = cd.data;
-            break;
-        }
-        bootstrap_unmap();
-    }
-}
-
 static DEFINE_SPINLOCK(microcode_mutex);
 
 DEFINE_PER_CPU(struct cpu_signature, cpu_sig);
@@ -789,23 +734,47 @@ static int __init early_update_cache(const void *data, size_t len)
     return rc;
 }
 
+/*
+ * Set by early_microcode_load() to indicate where it found microcode, so
+ * microcode_init_cache() can find it again and initalise the cache.  opt_scan
+ * tells us whether we're looking for a raw container or CPIO archive.
+ */
+static int __initdata early_mod_idx = -1;
+
 static int __init cf_check microcode_init_cache(void)
 {
     struct boot_info *bi = &xen_boot_info;
+    void *data;
+    size_t size;
     int rc = 0;
 
-    if ( !ucode_ops.apply_microcode )
-        return -ENODEV;
+    if ( early_mod_idx < 0 )
+        /* early_microcode_load() didn't leave us any work to do. */
+        return 0;
+
+    size = bi->mods[early_mod_idx].mod->mod_end;
+    data = __mfn_to_virt(bi->mods[early_mod_idx].mod->mod_start);
 
+    /*
+     * If opt_scan is set, we're looking for a CPIO archive rather than a raw
+     * microcode container.  Look within it.
+     */
     if ( opt_scan )
-        /* Need to rescan the modules because they might have been relocated */
-        microcode_scan_module(bi);
+    {
+        struct cpio_data cd = find_cpio_data(ucode_ops.cpio_path, data, size);
 
-    if ( ucode_mod.mod_end )
-        rc = early_update_cache(bootstrap_map(&ucode_mod),
-                                ucode_mod.mod_end);
-    else if ( ucode_blob.size )
-        rc = early_update_cache(ucode_blob.data, ucode_blob.size);
+        if ( !cd.data )
+        {
+            printk(XENLOG_WARNING "Microcode: %s not found in CPIO archive\n",
+                   strrchr(ucode_ops.cpio_path, '/') + 1);
+            return -ENOENT;
+        }
+
+        data = cd.data;
+        size = cd.size;
+    }
+
+    rc = early_update_cache(data, size);
 
     return rc;
 }
@@ -819,7 +788,7 @@ presmp_initcall(microcode_init_cache);
  */
 static int __init early_microcode_load(struct boot_info *bi)
 {
-    const void *data = NULL;
+    void *data = NULL;
     size_t size;
     struct microcode_patch *patch;
     int idx = opt_mod_idx;
@@ -832,7 +801,40 @@ static int __init early_microcode_load(struct boot_info *bi)
     ASSERT(idx == 0 || !opt_scan);
 
     if ( opt_scan ) /* Scan for a CPIO archive */
-        microcode_scan_module(bi);
+    {
+        for ( idx = 1; idx < bi->nr_modules; ++idx )
+        {
+            struct cpio_data cd;
+
+            if ( !test_bit(idx, bi->module_map) )
+                continue;
+
+            size = bi->mods[idx].mod->mod_end;
+            data = bootstrap_map_bm(&bi->mods[idx]);
+            if ( !data )
+            {
+                printk(XENLOG_WARNING "Microcode: Could not map module %d, size %zu\n",
+                       idx, size);
+                continue;
+            }
+
+            cd = find_cpio_data(ucode_ops.cpio_path, data, size);
+            if ( !cd.data )
+            {
+                /* CPIO archive, but no cpio_path.  Try the next module */
+                bootstrap_unmap();
+                continue;
+            }
+
+            data = cd.data;
+            size = cd.size;
+            goto found;
+        }
+
+        printk(XENLOG_WARNING "Microcode: %s not found during CPIO scan\n",
+               strrchr(ucode_ops.cpio_path, '/') + 1);
+        return -ENODEV;
+    }
 
     if ( idx ) /* Specific module nominated */
     {
@@ -856,26 +858,21 @@ static int __init early_microcode_load(struct boot_info *bi)
             return -ENODEV;
         }
 
-        ucode_mod = *bi->mods[idx].mod;
-    }
-
-    if ( !ucode_mod.mod_end && !ucode_blob.size )
-        return 0;
-
-    if ( ucode_blob.size )
-    {
-        size = ucode_blob.size;
-        data = ucode_blob.data;
-    }
-    else if ( ucode_mod.mod_end )
-    {
-        size = ucode_mod.mod_end;
-        data = bootstrap_map(&ucode_mod);
+        size = bi->mods[idx].mod->mod_end;
+        data = bootstrap_map_bm(&bi->mods[idx]);
+        if ( !data )
+        {
+            printk(XENLOG_WARNING "Microcode: Could not map module %d, size %zu\n",
+                   idx, size);
+            return -ENODEV;
+        }
+        goto found;
     }
 
-    if ( !data )
-        return -ENOMEM;
+    /* No method of finding microcode specified.  Nothing to do. */
+    return 0;
 
+ found:
     patch = ucode_ops.cpu_request_microcode(data, size, false);
     if ( IS_ERR(patch) )
     {
@@ -891,6 +888,15 @@ static int __init early_microcode_load(struct boot_info *bi)
         goto unmap;
     }
 
+    /*
+     * We've found a microcode patch suitable for this CPU.
+     *
+     * Tell microcode_init_cache() which module we found it in.  We cache it
+     * irrespective of whether the BSP successfully loads it; Some platforms
+     * are known to update the BSP but leave the APs on older ucode.
+     */
+    early_mod_idx = idx;
+
     rc = microcode_update_cpu(patch, 0);
 
  unmap:
-- 
2.39.5


