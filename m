Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5969AFEF0
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 11:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825720.1240112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4GyK-000153-BD; Fri, 25 Oct 2024 09:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825720.1240112; Fri, 25 Oct 2024 09:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4GyK-00012W-6Y; Fri, 25 Oct 2024 09:51:08 +0000
Received: by outflank-mailman (input) for mailman id 825720;
 Fri, 25 Oct 2024 09:51:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r3YV=RV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1t4GyI-0006YL-5v
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 09:51:06 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6435bd3-92b6-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 11:51:04 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c96936065dso2020749a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2024 02:51:04 -0700 (PDT)
Received: from carlo-ubuntu.home
 (dynamic-adsl-94-34-131-227.clienti.tiscali.it. [94.34.131.227])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb629e17dsm446938a12.34.2024.10.25.02.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 02:51:03 -0700 (PDT)
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
X-Inumbo-ID: a6435bd3-92b6-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1729849863; x=1730454663; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toVf4KyxnPp4I0KVV2BzelFhOJn1fnz1pf3z2+XUHUg=;
        b=w6M+a5XImTiGIwFz2XvO1ypyB7bCo3wlK69zHVSarc4SPrfBy3Stt2tlwkDMVBElpF
         nZlES3p+TxW0ZpZq44oXrHAXbU4DpnXZwF2RPyNYMa4b7Hz8DWmf0wMF3cF8MYyCIAsf
         ahHyTGy0P+4b0UdwzdiXSjXar2MkJOBRmOJ0Lbsdx/FjM+NM07hr0F5Bc9CU9WeySLkG
         ByBMSKnLGlL7wGb1R/elJ5oq91Wf0PacQvY9FjFNyEWaGfsGTg14F4V/Gvj1mh4PFNbK
         +gTZ6OpKfgpDa+XUSCieiP7HViHNtgI8rubmqZJF6wvqSYF9OxQpG0eAfIza3kZq/lVP
         NbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729849863; x=1730454663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=toVf4KyxnPp4I0KVV2BzelFhOJn1fnz1pf3z2+XUHUg=;
        b=rr0pGNLuNup/pT1BR04YFsQUBBHgkg4/KISLLB/X3QDbX0a0dIDN5JFPHCmso0L+8D
         T4AypT29n4sVm2b843D1o6gRjWBT5vcoiyWadAubu7onBoLL9Q8NK+siO1pfElx1hxa+
         0k+MGhM2k8hZUXbAyWIMr+vhPBulgFEs1FbUgW/KfklbdtrK/+g+b4zRo6QjmYHG+X7f
         fWKhrrYDBJRVFAJNi/vFCAjA/tqoZLnLBvM8vhLwIoehHr1Mc4I6j3BpVzhTfQgA/63X
         pA8XQgFCa11Wzmqv1w5IeBapzc2C3IUwkwCHA7UGH1EJ8829cUKSqBhDEB+JlNx2t3tk
         tYsw==
X-Gm-Message-State: AOJu0YzrAkISF79KiyMBbCim+H0ESAuoEWGErSgJYLUXqDXqQL8lJg28
	Fs5vc6SFQSvMac6SD+z5Zah0QsuRiW5tKa3v7hAX6SxUCrmZqhdOB6kOBfA0a11z4hD0L+GVMzA
	PbZU=
X-Google-Smtp-Source: AGHT+IEv/1ADfL9tXdzn9+EzoF/Kf/RBlXUk3bkSOjvUqhG6oc2zB/euhgD8ddJwwIQGP0lvjsLV/w==
X-Received: by 2002:a17:907:7251:b0:a9a:26a5:d508 with SMTP id a640c23a62f3a-a9abf84b05bmr759593266b.9.1729849863396;
        Fri, 25 Oct 2024 02:51:03 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 12/13] xen/arm: make consider_modules() available for xen relocation
Date: Fri, 25 Oct 2024 11:50:13 +0200
Message-ID: <20241025095014.42376-13-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cache coloring must physically relocate Xen in order to color the hypervisor
and consider_modules() is a key function that is needed to find a new
available physical address.

672d67f339c0 ("xen/arm: Split MMU-specific setup_mm() and related code out")
moved consider_modules() under arm32. Move it to mmu/setup.c and make it
non-static so that it can be used outside.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
v9:
- no changes
v8:
- patch adapted to new changes to consider_modules()
v7:
- moved consider_modules() to arm/mmu/setup.c
v6:
- new patch
---
 xen/arch/arm/arm32/mmu/mm.c      | 95 +------------------------------
 xen/arch/arm/include/asm/setup.h |  3 +
 xen/arch/arm/mmu/setup.c         | 97 ++++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+), 94 deletions(-)

diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index 063611412b..c5fcd19291 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -9,6 +9,7 @@
 #include <asm/fixmap.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
+#include <asm/setup.h>
 
 static unsigned long opt_xenheap_megabytes __initdata;
 integer_param("xenheap_megabytes", opt_xenheap_megabytes);
@@ -31,100 +32,6 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
     directmap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
 }
 
-/*
- * Returns the end address of the highest region in the range s..e
- * with required size and alignment that does not conflict with the
- * modules from first_mod to nr_modules.
- *
- * For non-recursive callers first_mod should normally be 0 (all
- * modules and Xen itself) or 1 (all modules but not Xen).
- */
-static paddr_t __init consider_modules(paddr_t s, paddr_t e,
-                                       uint32_t size, paddr_t align,
-                                       int first_mod)
-{
-    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
-#ifdef CONFIG_STATIC_SHM
-    const struct membanks *shmem = bootinfo_get_shmem();
-#endif
-    const struct bootmodules *mi = &bootinfo.modules;
-    int i;
-    int nr;
-
-    s = (s+align-1) & ~(align-1);
-    e = e & ~(align-1);
-
-    if ( s > e ||  e - s < size )
-        return 0;
-
-    /* First check the boot modules */
-    for ( i = first_mod; i < mi->nr_mods; i++ )
-    {
-        paddr_t mod_s = mi->module[i].start;
-        paddr_t mod_e = mod_s + mi->module[i].size;
-
-        if ( s < mod_e && mod_s < e )
-        {
-            mod_e = consider_modules(mod_e, e, size, align, i+1);
-            if ( mod_e )
-                return mod_e;
-
-            return consider_modules(s, mod_s, size, align, i+1);
-        }
-    }
-
-    /*
-     * i is the current bootmodule we are evaluating, across all
-     * possible kinds of bootmodules.
-     *
-     * When retrieving the corresponding reserved-memory addresses, we
-     * need to index the reserved_mem bank starting from 0, and only counting
-     * the reserved-memory modules. Hence, we need to use i - nr.
-     */
-    nr = mi->nr_mods;
-    for ( ; i - nr < reserved_mem->nr_banks; i++ )
-    {
-        paddr_t r_s = reserved_mem->bank[i - nr].start;
-        paddr_t r_e = r_s + reserved_mem->bank[i - nr].size;
-
-        if ( s < r_e && r_s < e )
-        {
-            r_e = consider_modules(r_e, e, size, align, i + 1);
-            if ( r_e )
-                return r_e;
-
-            return consider_modules(s, r_s, size, align, i + 1);
-        }
-    }
-
-#ifdef CONFIG_STATIC_SHM
-    nr += reserved_mem->nr_banks;
-    for ( ; i - nr < shmem->nr_banks; i++ )
-    {
-        paddr_t r_s, r_e;
-
-        r_s = shmem->bank[i - nr].start;
-
-        /* Shared memory banks can contain INVALID_PADDR as start */
-        if ( INVALID_PADDR == r_s )
-            continue;
-
-        r_e = r_s + shmem->bank[i - nr].size;
-
-        if ( s < r_e && r_s < e )
-        {
-            r_e = consider_modules(r_e, e, size, align, i + 1);
-            if ( r_e )
-                return r_e;
-
-            return consider_modules(s, r_s, size, align, i + 1);
-        }
-    }
-#endif
-
-    return e;
-}
-
 /*
  * Find a contiguous region that fits in the static heap region with
  * required size and alignment, and return the end address of the region
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 64c227d171..0c560d141f 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -89,6 +89,9 @@ struct init_info
     unsigned int cpuid;
 };
 
+paddr_t consider_modules(paddr_t s, paddr_t e, uint32_t size, paddr_t align,
+                         int first_mod);
+
 #endif
 /*
  * Local variables:
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 9664e85ee6..1cf62390e3 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -6,7 +6,10 @@
  */
 
 #include <xen/init.h>
+#include <xen/lib.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/libfdt/libfdt-xen.h>
+#include <xen/llc-coloring.h>
 #include <xen/sections.h>
 #include <xen/sizes.h>
 #include <xen/vmap.h>
@@ -222,6 +225,100 @@ static void xen_pt_enforce_wnx(void)
     flush_xen_tlb_local();
 }
 
+/*
+ * Returns the end address of the highest region in the range s..e
+ * with required size and alignment that does not conflict with the
+ * modules from first_mod to nr_modules.
+ *
+ * For non-recursive callers first_mod should normally be 0 (all
+ * modules and Xen itself) or 1 (all modules but not Xen).
+ */
+paddr_t __init consider_modules(paddr_t s, paddr_t e,
+                                uint32_t size, paddr_t align,
+                                int first_mod)
+{
+    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
+#ifdef CONFIG_STATIC_SHM
+    const struct membanks *shmem = bootinfo_get_shmem();
+#endif
+    const struct bootmodules *mi = &bootinfo.modules;
+    int i;
+    int nr;
+
+    s = (s+align-1) & ~(align-1);
+    e = e & ~(align-1);
+
+    if ( s > e ||  e - s < size )
+        return 0;
+
+    /* First check the boot modules */
+    for ( i = first_mod; i < mi->nr_mods; i++ )
+    {
+        paddr_t mod_s = mi->module[i].start;
+        paddr_t mod_e = mod_s + mi->module[i].size;
+
+        if ( s < mod_e && mod_s < e )
+        {
+            mod_e = consider_modules(mod_e, e, size, align, i+1);
+            if ( mod_e )
+                return mod_e;
+
+            return consider_modules(s, mod_s, size, align, i+1);
+        }
+    }
+
+    /*
+     * i is the current bootmodule we are evaluating, across all
+     * possible kinds of bootmodules.
+     *
+     * When retrieving the corresponding reserved-memory addresses, we
+     * need to index the reserved_mem bank starting from 0, and only counting
+     * the reserved-memory modules. Hence, we need to use i - nr.
+     */
+    nr = mi->nr_mods;
+    for ( ; i - nr < reserved_mem->nr_banks; i++ )
+    {
+        paddr_t r_s = reserved_mem->bank[i - nr].start;
+        paddr_t r_e = r_s + reserved_mem->bank[i - nr].size;
+
+        if ( s < r_e && r_s < e )
+        {
+            r_e = consider_modules(r_e, e, size, align, i + 1);
+            if ( r_e )
+                return r_e;
+
+            return consider_modules(s, r_s, size, align, i + 1);
+        }
+    }
+
+#ifdef CONFIG_STATIC_SHM
+    nr += reserved_mem->nr_banks;
+    for ( ; i - nr < shmem->nr_banks; i++ )
+    {
+        paddr_t r_s, r_e;
+
+        r_s = shmem->bank[i - nr].start;
+
+        /* Shared memory banks can contain INVALID_PADDR as start */
+        if ( INVALID_PADDR == r_s )
+            continue;
+
+        r_e = r_s + shmem->bank[i - nr].size;
+
+        if ( s < r_e && r_s < e )
+        {
+            r_e = consider_modules(r_e, e, size, align, i + 1);
+            if ( r_e )
+                return r_e;
+
+            return consider_modules(s, r_s, size, align, i + 1);
+        }
+    }
+#endif
+
+    return e;
+}
+
 /*
  * Boot-time pagetable setup.
  * Changes here may need matching changes in head.S
-- 
2.43.0


