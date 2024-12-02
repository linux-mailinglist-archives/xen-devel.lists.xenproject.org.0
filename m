Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6089E093F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 18:00:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846773.1262000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9lr-0000si-Ac; Mon, 02 Dec 2024 16:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846773.1262000; Mon, 02 Dec 2024 16:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9lq-0000np-SS; Mon, 02 Dec 2024 16:59:38 +0000
Received: by outflank-mailman (input) for mailman id 846773;
 Mon, 02 Dec 2024 16:59:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=no4W=S3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tI9lp-0006wq-0U
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 16:59:37 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf78e0e6-b0ce-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 17:59:36 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53de8ecafeeso4908664e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 08:59:36 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e64c4sm526802666b.97.2024.12.02.08.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 08:59:35 -0800 (PST)
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
X-Inumbo-ID: cf78e0e6-b0ce-11ef-a0d2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1733158775; x=1733763575; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQLU0z+L0dGPs9j3VJOLeVLjnDV4HcwqVQ59IBOieiw=;
        b=l6secaQPM6CHW3+nmmnL/eFyIXRuh90goQzrmrT6phh58IRCrtrj6uQzpQsZ7+nhM5
         XcqCi9EQ6nwXmqUGWNu2emj3dIXSjWhDqdWxPF3uX+5E3/jD3hc8B80nyphE274o7qpM
         kOzmQTJemldY28GrYMeg0eOxdHgnveekE8PasW/0pohdjTrCCrfC5jyMFKNtS4O5/nCb
         JZE2gopDieSY9HpDwVruEdG+zzqdoNWDAp84B5fGYTsiHGiATYiN3lzd7D/HG9Cjj8SK
         BTmFtRWpe4lytzXk7ng2RckRT6HN2HS2b43CPAKSPddvq0OPUYgG79yc6e4QthbHVmWZ
         F4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733158775; x=1733763575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQLU0z+L0dGPs9j3VJOLeVLjnDV4HcwqVQ59IBOieiw=;
        b=Gww2ztHHMpZgnvJmP95ano3/5PN3CQmOTdvMd1lG+ZGtPujT+UJPyKsxQqfzyFwVpV
         dta1mMgH8FiMeCdPl+/xMSG8+g+HCs+dBhYOVjL5DKgJf1dLPnPGiuZodtfvOakyUzmJ
         mkuy8TXcvb7kJP1t0gwS/9UxJ5YRK7BHVG9pqEjP+zxavaH4uY0czsYZsoc2/ypuFicG
         x1zury2anvqS+5KC/J1Slcvbc82CFLFoRwIiSYZbnHS37fr9ltPusZrZ5XlLzfbFDMyI
         ZUev1Ex8TSUmj7ZGFfF0lo41JOzcAq0tHRQ8il1afoY5KG0Fhj44UguCq6aE5VEQhyrw
         JyNw==
X-Gm-Message-State: AOJu0YywZK9//xO+dVBj5+8HD3Q1QjGthoOZnO/1Qtc0JuBQD2WRhH58
	4GzIM8AIXHx3x/t5CEJ+TDW6+CKbc45fMWjRorVEMPoWOvjfmf/llGadupr2qTZGZfksTVuVBcO
	w
X-Gm-Gg: ASbGnctRly8hboR8KVBSqJUf5UuH3rWC9GJBTQo9dGLv3o+J+eAeqisIEV06lm/jIo2
	dSP5qWy9C0OWLTZygANR5CWbNiPzlRHxcv8pI71xtpFvliKIAYXzP4xCMfF6ydUtElZQ4gVkCyR
	siS8qA2x30Gp5oU/TbeXVqHceB4kivX8in5rtnnz3PqCcAgUn3You8xzfMMDbkmI8SBEeiSIGYN
	5kAjqHLKLuCn/wRu/uOrCHjvTGvB3f73or4vqcfC6eJyUxBbmvtjC+KLEEmPEKEo9Y5mu3FEL1/
	g0rUKuKgFR3LfYYP9y0lumFB7CVncGgmevJiWsIz84gEYCLqtI2o
X-Google-Smtp-Source: AGHT+IFcthVhkf4BkBdZ3UvYNyO3JNKzXHzfDVFYUXTj/ROlFjZIToNYkja9jc7/mLFmlkM7PuSk2A==
X-Received: by 2002:a05:6512:3e1d:b0:539:e12c:bba7 with SMTP id 2adb3069b0e04-53df00a9f2amr12143887e87.12.1733158775555;
        Mon, 02 Dec 2024 08:59:35 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v11 11/12] xen/arm: make consider_modules() available for xen relocation
Date: Mon,  2 Dec 2024 17:59:20 +0100
Message-ID: <20241202165921.249585-12-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cache coloring must physically relocate Xen in order to color the hypervisor
and consider_modules() is a key function that is needed to find a new
available physical address.

672d67f339c0 ("xen/arm: Split MMU-specific setup_mm() and related code out")
moved consider_modules() under arm32. Move it to mmu/setup.c and make it
non-static so that it can be used outside.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v11:
- removed useless #include
v10:
- no changes
v9:
- no changes
v8:
- patch adapted to new changes to consider_modules()
v7:
- moved consider_modules() to arm/mmu/setup.c
v6:
- new patch
---
 xen/arch/arm/arm32/mmu/mm.c      | 95 +-------------------------------
 xen/arch/arm/include/asm/setup.h |  3 +
 xen/arch/arm/mmu/setup.c         | 94 +++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+), 94 deletions(-)

diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index 063611412b..903d946f07 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -7,6 +7,7 @@
 #include <xen/param.h>
 #include <xen/pfn.h>
 #include <asm/fixmap.h>
+#include <asm/setup.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
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
index 9664e85ee6..196974f3e2 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -222,6 +222,100 @@ static void xen_pt_enforce_wnx(void)
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


