Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D614387CBC8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 12:00:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693761.1082333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5I4-0004Np-K2; Fri, 15 Mar 2024 10:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693761.1082333; Fri, 15 Mar 2024 10:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5I4-00044U-3x; Fri, 15 Mar 2024 10:59:56 +0000
Received: by outflank-mailman (input) for mailman id 693761;
 Fri, 15 Mar 2024 10:59:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnwS=KV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rl5I0-0000xG-0U
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 10:59:52 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24eda1b6-e2bb-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 11:59:50 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5684db9147dso2707411a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 03:59:50 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 en6-20020a17090728c600b00a465a012cf1sm1621493ejc.18.2024.03.15.03.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 03:59:48 -0700 (PDT)
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
X-Inumbo-ID: 24eda1b6-e2bb-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1710500389; x=1711105189; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LB6BgYTUa1kOXdqGeJqi23zdypFJzo1UCspbeuE4GtA=;
        b=UE5vEGiKQOPdsxZ3bxtagA1/fKYRhyfVURi2X+drUIt98poyLuu1htH5TAxALtxeIj
         s0HlQWSvJwNCXFaup3gAeVf2jOnrc3a+9GPqQ8wCljSKVwHVHpB066joR3DFOb3nrmrh
         CpVRZwqp1shj3KdFPMaANG66MpXXceoYZkOqi0s2Ky9IWz2STjfw+9/FPYxsDF0CcAbv
         N7VLSga1ZMNylxXpiwBgYH58lBOiWtyZmkN8F9whf+EzCtMFgHx7mCYJKEJ5eyEcMzKB
         5ctFQ39dfFU/fu6ry3leuJECyXUSvg/nhRzfwNDlQzwSYwD6Kzq5IqIliHZNjk1J95aA
         g4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710500389; x=1711105189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LB6BgYTUa1kOXdqGeJqi23zdypFJzo1UCspbeuE4GtA=;
        b=wZsZibVbXpSBSztV7CSaPKJZUoES47cFK202rYbIuEKhoV/BSYk0MnFBUICVYaMYBq
         522MnKTnULGlI5SeEpLyL3eZ8qCVVW+SQj+C8DIEL/EdvKZlQtJ8XGhXIz9iKYKYuP+G
         T6nKCp5rq242Io3WIpDU+hGNNEMedQj8kLRCRG4O2aMJXPgR9fKFpy9QeoKsdSoKhq9F
         byMypFfrXFZyZhEDY+TZw+h/XXj9/3/x0NRYASNxKuGw8gXhI/8Lep6Avx4EeJ+f21yK
         t2HVOzf2XUl8H3LMVfCWNrloscdr08w+eu+jYXWhvTMcIURHY5EGQV4Jf2ueXzadRDV8
         oigA==
X-Gm-Message-State: AOJu0Yz8uo7Jj5XlCi4/HSU0MtHHxI/yl0gPt1Qo3r4qovtxYhs1Bh5r
	9SAB3DmwFli+qytI46E995g7O/GfPVrrbTsE6VYiBcet3bGxA0wBkc1knJJl7Fj1S+bK/TosQJW
	IWF8=
X-Google-Smtp-Source: AGHT+IEWF9JpYIT8wllQAlXqsumloaAQUttwEWWZ8iRrRYvP2s6KNOSHgSAVlGUfoE5QYhlPJBU5jg==
X-Received: by 2002:a17:907:c783:b0:a46:42d4:fbd4 with SMTP id tz3-20020a170907c78300b00a4642d4fbd4mr3545057ejc.35.1710500389201;
        Fri, 15 Mar 2024 03:59:49 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 13/14] xen/arm: make consider_modules() available for xen relocation
Date: Fri, 15 Mar 2024 11:59:01 +0100
Message-Id: <20240315105902.160047-14-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
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
v7:
- moved consider_modules() to arm/mmu/setup.c
v6:
- new patch
---
 xen/arch/arm/arm32/mmu/mm.c      | 93 +------------------------------
 xen/arch/arm/include/asm/setup.h |  3 +
 xen/arch/arm/mmu/setup.c         | 95 ++++++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+), 92 deletions(-)

diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index cb441ca87c..e9e1e48f9f 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -7,6 +7,7 @@
 #include <xen/pfn.h>
 #include <asm/fixmap.h>
 #include <asm/static-memory.h>
+#include <asm/setup.h>
 
 static unsigned long opt_xenheap_megabytes __initdata;
 integer_param("xenheap_megabytes", opt_xenheap_megabytes);
@@ -29,98 +30,6 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
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
-    /* Now check any fdt reserved areas. */
-
-    nr = fdt_num_mem_rsv(device_tree_flattened);
-
-    for ( ; i < mi->nr_mods + nr; i++ )
-    {
-        paddr_t mod_s, mod_e;
-
-        if ( fdt_get_mem_rsv_paddr(device_tree_flattened,
-                                   i - mi->nr_mods,
-                                   &mod_s, &mod_e ) < 0 )
-            /* If we can't read it, pretend it doesn't exist... */
-            continue;
-
-        /* fdt_get_mem_rsv_paddr returns length */
-        mod_e += mod_s;
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
-     * need to index the bootinfo.reserved_mem bank starting from 0, and
-     * only counting the reserved-memory modules. Hence, we need to use
-     * i - nr.
-     */
-    nr += mi->nr_mods;
-    for ( ; i - nr < bootinfo.reserved_mem.nr_banks; i++ )
-    {
-        paddr_t r_s = bootinfo.reserved_mem.bank[i - nr].start;
-        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i - nr].size;
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
-    return e;
-}
-
 /*
  * Find a contiguous region that fits in the static heap region with
  * required size and alignment, and return the end address of the region
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index d15a88d2e0..37c0e345f0 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -207,6 +207,9 @@ struct init_info
     unsigned int cpuid;
 };
 
+paddr_t consider_modules(paddr_t s, paddr_t e, uint32_t size, paddr_t align,
+                         int first_mod);
+
 #endif
 /*
  * Local variables:
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 57f1b46499..de036c1f49 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -6,7 +6,10 @@
  */
 
 #include <xen/init.h>
+#include <xen/lib.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/libfdt/libfdt-xen.h>
+#include <xen/llc-coloring.h>
 #include <xen/sizes.h>
 #include <xen/vmap.h>
 
@@ -218,6 +221,98 @@ static void xen_pt_enforce_wnx(void)
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
+    /* Now check any fdt reserved areas. */
+
+    nr = fdt_num_mem_rsv(device_tree_flattened);
+
+    for ( ; i < mi->nr_mods + nr; i++ )
+    {
+        paddr_t mod_s, mod_e;
+
+        if ( fdt_get_mem_rsv_paddr(device_tree_flattened,
+                                   i - mi->nr_mods,
+                                   &mod_s, &mod_e ) < 0 )
+            /* If we can't read it, pretend it doesn't exist... */
+            continue;
+
+        /* fdt_get_mem_rsv_paddr returns length */
+        mod_e += mod_s;
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
+     * need to index the bootinfo.reserved_mem bank starting from 0, and
+     * only counting the reserved-memory modules. Hence, we need to use
+     * i - nr.
+     */
+    nr += mi->nr_mods;
+    for ( ; i - nr < bootinfo.reserved_mem.nr_banks; i++ )
+    {
+        paddr_t r_s = bootinfo.reserved_mem.bank[i - nr].start;
+        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i - nr].size;
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
+    return e;
+}
+
 /*
  * Boot-time pagetable setup.
  * Changes here may need matching changes in head.S
-- 
2.34.1


