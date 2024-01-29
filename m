Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AEF840EDD
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 18:19:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673074.1047339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVIE-0000We-Eq; Mon, 29 Jan 2024 17:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673074.1047339; Mon, 29 Jan 2024 17:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVID-0000Lh-SG; Mon, 29 Jan 2024 17:19:33 +0000
Received: by outflank-mailman (input) for mailman id 673074;
 Mon, 29 Jan 2024 17:19:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vh+I=JH=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rUVIB-0005vb-Bh
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 17:19:31 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f8c7d97-beca-11ee-98f5-efadbce2ee36;
 Mon, 29 Jan 2024 18:19:29 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cc9fa5e8e1so32885801fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 09:19:29 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 eo15-20020a056402530f00b005598ec568dbsm3970494edb.59.2024.01.29.09.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 09:19:28 -0800 (PST)
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
X-Inumbo-ID: 8f8c7d97-beca-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706548769; x=1707153569; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOEDeXZz+KvpHcMcDfWEFx1e9GAnCTEDaLyDCycF2TQ=;
        b=QNfB12m7vO4Nj6rT1oA8yx7qRTiEua4Mnk8pc1zyRObZFRpUj0MS7XZmuOmM5eIcEc
         Rstvt63cyP8I/yHiKIxLd/SP2ZFU5pRGN9y7bIxd9GKxL+zjZI7M3k6ZoA/eXC4PBtOM
         wNl04us+Ipm4p1tZyMaB6cRyb9eIcp9JbOaLAnsFYNHz7I0Oq9VvjOmJbcjMnRg6anRx
         hyccWtDUhvEbmJB/0mQgfQVR07xYGeHO+Ua56CbrB7Ddu4Sgnljw8bGAbsdk3tJc+36Z
         cN9RucFEQ9ZyQmDeN3dGzEjCmJ/HS+kK1Y9W2e9nSYqg06plnum3uZvJiQI0FBghXkdL
         kCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548769; x=1707153569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOEDeXZz+KvpHcMcDfWEFx1e9GAnCTEDaLyDCycF2TQ=;
        b=aW4AJXEgSsM+XvVPNWvkrv5ZMUi5sxdESNUxviLFUU1P5aEWmGZcATPJxzhfmoPUpx
         ioTiDuCD6dyBk39wrFOfFYEEDHRsYFFQwmzBnGn1P3Hwoj5aWFAnqeNLIPJ91z6qF9X4
         +cpL3cHszhaRsKEH1dsSRt8+Cf94SCCrElrKeUikf82MipJ9bRhNvyxSt58bYsoB8CnT
         rMeaqC62hjtBV+sDhHxDg+MGGNYMfYkILnOx/Wi5L0op7SDl9bGarav2Dfv10+CvFkAN
         96nRt6dLdIevvLPdaekbIcUgoHR5Hf2Ks3B93sWHIHiOkbjI6zVyK87WYLmP9X8r4/dk
         qc/A==
X-Gm-Message-State: AOJu0YxZ53/FCNDAPDBD+bumUiW6HaSzZzeENpA4GM2a9wgqb8wBWt67
	5KZyQjL78efwKnSoHO7hPETRa0vlNicQA/djXA1cwzATdIhthSw3ppoVr0FzOk5zhbfX8DinXV8
	QjD0=
X-Google-Smtp-Source: AGHT+IEHbmtrPBuSoOGAvYNewKRuZ2nMFc2QPdwPS0snVlLI1HqtmRWiBozo33nTOPw6ibBWT4OnRw==
X-Received: by 2002:a2e:bc86:0:b0:2cf:f748:1aba with SMTP id h6-20020a2ebc86000000b002cff7481abamr5146953ljf.20.1706548769042;
        Mon, 29 Jan 2024 09:19:29 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 13/15] xen/arm: make consider_modules() available for xen relocation
Date: Mon, 29 Jan 2024 18:18:09 +0100
Message-Id: <20240129171811.21382-14-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cache coloring must physically relocate Xen in order to color the hypervisor
and consider_modules() is a key function that is needed to find a new
available physical address.

672d67f339c0 ("xen/arm: Split MMU-specific setup_mm() and related code out")
moved consider_modules() under arm32. Move it back to setup.c and make it
non-static so that it can be used outside.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
v6:
- new patch
---
 xen/arch/arm/arm32/mmu/mm.c      | 93 +-------------------------------
 xen/arch/arm/include/asm/setup.h |  3 ++
 xen/arch/arm/setup.c             | 92 +++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+), 92 deletions(-)

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
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 14cb023783..28f4761705 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -545,6 +545,98 @@ static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
     return fdt;
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
  * Return the end of the non-module region starting at s. In other
  * words return s the start of the next modules after s.
-- 
2.34.1


