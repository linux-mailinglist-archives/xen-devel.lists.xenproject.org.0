Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3AA9BDA76
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 01:40:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830530.1245586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8U5R-0008Pf-IQ; Wed, 06 Nov 2024 00:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830530.1245586; Wed, 06 Nov 2024 00:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8U5R-0008MB-By; Wed, 06 Nov 2024 00:39:53 +0000
Received: by outflank-mailman (input) for mailman id 830530;
 Wed, 06 Nov 2024 00:39:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNbQ=SB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8U5P-0007Sp-Hs
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 00:39:51 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f75ffdf-9bd7-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 01:39:46 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-539fb49c64aso8556873e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 16:39:46 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16d66b9sm198664166b.59.2024.11.05.16.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 16:39:43 -0800 (PST)
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
X-Inumbo-ID: 9f75ffdf-9bd7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmEiLCJoZWxvIjoibWFpbC1sZjEteDEyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjlmNzVmZmRmLTliZDctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODUzNTg2Ljg3MzAzNywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730853585; x=1731458385; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyQgfKHqhnuRdlQlcXH14Fl/zjVPFh80mAHLBVNbFoE=;
        b=W7rdOxpRRvNDCCxPPPWSSkc+98NwwSA8Hk4Uq1Fjy7EeptD7U3B8fjwJBS0xskkr8Z
         tc/h1hoikENk+3DJ8OR5KwSf8I+u6IAXRTCKl7iXgtImVQYAHYmP5W8toLAP5e2eTjG1
         EUx2I0zOGUmVyrdKarlGyM7ebHJyE4KVKqDuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730853585; x=1731458385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zyQgfKHqhnuRdlQlcXH14Fl/zjVPFh80mAHLBVNbFoE=;
        b=Y8CkVtRrrvfdRAd0MErnJAabLBv5WVVzIG4satQ+c/Zmhrmf/L0Dd33fnFp/25TUnM
         aEaHFTPZ0baQFqtfSBwhzv8Nz9VnSQiktwnyoKl0gzWGlSMKJ1ECtbyt9MLXm0H+hHI8
         +sylPtl9yWiYcawy5DbyavvZmlqw3aN8JEDZ0lD1aaXzK1IgubI34VtFmjJV5Tyb2lzc
         3OsmDMFvd4ms8/yfCXGtuLZQWxi+XIQBymUsXTQBlgGya9LuC6YKTyB1KGM6MjJPmOGI
         DGqGZUKDBnN6m/tzsPzGkHAU27qG9JN2y9/wra3gpWO9yZ9ZDQjjNnUijeQsNlucfgPU
         vKgg==
X-Gm-Message-State: AOJu0YzK8TSgFNNhE75CZhJuwsqakHYNbv6g+dKGK2v0ig8EbDHJ+nBC
	QuT0JUNJrom/dQiby6ZT8vjd2P1mTchaeN9GRh136JATSAaisfOEuw0PXvbNmeqGotsu+Cj8Hjl
	N
X-Google-Smtp-Source: AGHT+IFAZmdgCeIMlHYBymCGBplHOzq9/OfOVuXyHDj3nTWLCsZO4+Y9UYY974om2FQDApwkbRwIsA==
X-Received: by 2002:a05:6512:b94:b0:53b:1e70:6ab4 with SMTP id 2adb3069b0e04-53d65de3260mr14384511e87.14.1730853585415;
        Tue, 05 Nov 2024 16:39:45 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/4] x86/ucode: Drop ucode_mod and ucode_blob
Date: Wed,  6 Nov 2024 00:39:37 +0000
Message-Id: <20241106003938.3453243-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241106003938.3453243-1-andrew.cooper3@citrix.com>
References: <20241106003938.3453243-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Both are used to pass information from early_microcode_load() to
microcode_init_cache(), and both constitute use-after-free's in certain cases.
Later still in microcode_init() is a failed attempt to "free" this
information, long after the damage has been done.

 * ucode_mod is a copy of the module_t identified by `ucode=$n`.  It is a copy
   of the physical pointer from prior to Xen relocating the modules.
   microcode_init_cache() might happen to find the data still intact in it's
   old location, but it might be an arbitrary part of some other module.

 * ucode_blob is a stashed virtual pointer to a bootstrap_map() which becomes
   invalid the moment control returns to __start_xen(), where other logic is
   free to to make temporary mappings.  This was even noticed and
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

Delete microcode_init() entirely.  It was never legitimate logic.

This resolves all issues to do with holding pointers (physical or virtual)
across returning to __start_xen().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

v2:
 * Merge "x86/ucode: Delete the microcode_init() initcall" into this patch.
---
 xen/arch/x86/cpu/microcode/core.c | 194 ++++++++++++++----------------
 1 file changed, 89 insertions(+), 105 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index a2b03c52e86a..74b816a98b17 100644
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
 
@@ -176,46 +161,6 @@ custom_param("ucode", parse_ucode);
 
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
@@ -754,28 +699,6 @@ int microcode_update(XEN_GUEST_HANDLE(const_void) buf,
     return continue_hypercall_on_cpu(0, microcode_update_helper, buffer);
 }
 
-static int __init cf_check microcode_init(void)
-{
-    /*
-     * At this point, all CPUs should have updated their microcode
-     * via the early_microcode_* paths so free the microcode blob.
-     */
-    if ( ucode_blob.size )
-    {
-        bootstrap_unmap();
-        ucode_blob.size = 0;
-        ucode_blob.data = NULL;
-    }
-    else if ( ucode_mod.mod_end )
-    {
-        bootstrap_unmap();
-        ucode_mod.mod_end = 0;
-    }
-
-    return 0;
-}
-__initcall(microcode_init);
-
 /* Load a cached update to current cpu */
 int microcode_update_one(void)
 {
@@ -815,23 +738,47 @@ static int __init early_update_cache(const void *data, size_t len)
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
+
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
 
-    if ( ucode_mod.mod_end )
-        rc = early_update_cache(bootstrap_map(&ucode_mod),
-                                ucode_mod.mod_end);
-    else if ( ucode_blob.size )
-        rc = early_update_cache(ucode_blob.data, ucode_blob.size);
+    rc = early_update_cache(data, size);
 
     return rc;
 }
@@ -845,7 +792,7 @@ presmp_initcall(microcode_init_cache);
  */
 static int __init early_microcode_load(struct boot_info *bi)
 {
-    const void *data = NULL;
+    void *data = NULL;
     size_t size;
     struct microcode_patch *patch;
     int idx = opt_mod_idx;
@@ -858,7 +805,40 @@ static int __init early_microcode_load(struct boot_info *bi)
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
@@ -882,26 +862,21 @@ static int __init early_microcode_load(struct boot_info *bi)
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
@@ -917,6 +892,15 @@ static int __init early_microcode_load(struct boot_info *bi)
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


