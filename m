Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8E99F1222
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 17:28:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856875.1269458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8X1-0007JT-59; Fri, 13 Dec 2024 16:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856875.1269458; Fri, 13 Dec 2024 16:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8X1-0007HQ-1H; Fri, 13 Dec 2024 16:28:47 +0000
Received: by outflank-mailman (input) for mailman id 856875;
 Fri, 13 Dec 2024 16:28:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bZM=TG=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tM8Wy-0003wJ-Vf
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 16:28:44 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51898afc-b96f-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 17:28:43 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aab925654d9so39315266b.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 08:28:43 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech ([193.207.202.156])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa673474d96sm841759266b.96.2024.12.13.08.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 08:28:42 -0800 (PST)
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
X-Inumbo-ID: 51898afc-b96f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734107322; x=1734712122; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgbePI0AttbYCT39ufoypfo88obicULa6RDxOdvlbAE=;
        b=OIYJgvHDH1xmriJ1GQbKmbeJHGFK1QulEMEJIV96OKUX3rSDAbgq3KLCjX53dalI1n
         xAb1qc++MnXMkkcBMdL+Ltq8+Tf1CxajQ4YByAs2zGDOL1MddfX+E//Ycs64psltlvbu
         RLiDj10/PhxEOpxk5gbwfbdkdL5JEWmVW/tI41x4w28msSB5eDDJYYMVE1glrqxtJB7j
         lCxceRrK3afiIMVbFMT5ROAIj+Y//e86NhagCL3s7NxiAGdfzoIX/S7cxTBk7KVpxIS+
         dIQw4dXszQGb54/zIOtJ+/RgbPgZKucvBfaGcyH3WGJqYZZmGeJ4QRtMyoQgD5gn0iK5
         mceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107322; x=1734712122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgbePI0AttbYCT39ufoypfo88obicULa6RDxOdvlbAE=;
        b=nRbSj1AoKlObsaJyz4mvx34vtTwh4CdnCUaFfrvu9OkIi3s0bldL+vBhvokk+FMbPE
         biuqi9CipXdVCzJ4iV2ymwsiQ8FkOYkAPI7ptflxaOh8K4jM8vmbLGkn5LH/ZUeANT18
         Zg7yK89Hbps9kZGJeZQLRiOVahOIsXrouH9GxURSRK5vkLeJZfCdSbCotjnp/dJXvTOg
         saWUF3uI53rAc6jO7mXhzCC1ankqgDem9Z73LBotX+Q7ynKXvUdV0AkUwB+SPx8e2RQA
         A4s6XPixbW115YDIXcYe/JXqbBzRCXnKlZBjd3pFrwWrEqkjndflHdCvv1FKdR8vwfMv
         0GTg==
X-Gm-Message-State: AOJu0YxBZFxKgCqegR5qvInAf9nYYkeSyT9IWYXClm709d04XR7VkOuG
	YgPA4rUZDS/Vdl3RQTIoPG4yFeWmlQUqZ/87katMDfOYsHkBb8Ly8K65EWaseYRlCvXUmkR1ku0
	fsWw=
X-Gm-Gg: ASbGnct0aLMBddkNd5yB/v8Y/03fYkpoO29cE2zcEgIAthSqWDvoEYj1x2rDaaKcOGr
	8QbDB1+ZUDYIAwyTQ318e4k+tLDphLviHv1EVdCPJhpHMOzMved/obINetnQD0CDBvOK0PTfz6M
	WcAZbBg0eCRiBiI/Q2qOE8EG/pR7J0JekljN56RaoclGC1PUupRO7ViXLe2nTZgV9YLB3D62Mjg
	7GmzHhT63V9moEJUoofQAhJQl9p3sWoUr9matPAtCkIcdydQ9LG+YGYqns7sv0kR1cbi0YRgCL6
	6zegQQe/MDAQ7RCg
X-Google-Smtp-Source: AGHT+IHIXXIN+KmQgkKmBq54I0q9oKub3ahwQfBOGNdnL9of2AipdboITRWoaFpRmuiWBoDNe1F7Pg==
X-Received: by 2002:a17:907:3e1c:b0:aa6:8160:849a with SMTP id a640c23a62f3a-aab7793eb15mr329641066b.22.1734107322492;
        Fri, 13 Dec 2024 08:28:42 -0800 (PST)
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
Subject: [PATCH v12 11/12] xen/arm: make consider_modules() available for xen relocation
Date: Fri, 13 Dec 2024 17:28:14 +0100
Message-ID: <20241213162815.9196-12-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
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
v12:
- no changes
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
index a5a80d9b47..6cf272c160 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -81,6 +81,9 @@ struct init_info
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


