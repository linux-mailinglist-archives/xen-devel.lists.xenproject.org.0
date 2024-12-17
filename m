Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D6D9F520F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 18:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859690.1271822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNb8t-0006Qe-Cc; Tue, 17 Dec 2024 17:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859690.1271822; Tue, 17 Dec 2024 17:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNb8t-0006Nn-8w; Tue, 17 Dec 2024 17:13:55 +0000
Received: by outflank-mailman (input) for mailman id 859690;
 Tue, 17 Dec 2024 17:13:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+zK=TK=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tNb25-0006B0-EB
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 17:06:53 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fc67774-bc99-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 18:06:52 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6f6cf69so2358997a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 09:06:52 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab963910f7sm461362666b.166.2024.12.17.09.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 09:06:51 -0800 (PST)
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
X-Inumbo-ID: 4fc67774-bc99-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734455212; x=1735060012; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCbAePzsxXQgANJpC00dfwQGE1Jow0ZuHgQ13Xppu60=;
        b=j/ZzIEnB4VV4cXfFGPY3ch1vkcWy38dNKUiCM9QKNGoItZH+9jU7zPpnbg3Mq6sPQI
         gBz8MUozu60sMbQsIlOawGf5dYunKKral3Hic8UVcbc3cO0UtvYoaamL1N/4TzQ/Rz9e
         OQU0kHptcZZH1kWE/dUbhp1OoybLCm+3qkhcX5jlNn8tau0bainmzTvk3/niDlUCPv2r
         dzocQnw21O7SKd/xAxUi5G9Fv6+JFHJnzEa3y2vhMfhxhUHAQ5hkS6vDvA9ztV5PjQ2l
         vo0uUq5cJh/FdsqXVzlgZIy2QAxFVFKndPX4Qt5ZzyqRgdeCuXQrX52qVFniPi8S2LGF
         ltxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734455212; x=1735060012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCbAePzsxXQgANJpC00dfwQGE1Jow0ZuHgQ13Xppu60=;
        b=O76mdhAWM4Dv1AInCE7xfiCZ5RyA1FvZKJpzdP9RT5rDocQKLkYZArezk6B6lSWY4X
         mQxSwGksOdiKTATbE4K9NzNFFAKCm6Ea/G8cfYgWomHwJE8HpLxBTy7QnD5XSiPwz8Rj
         z/3mAbuthn4TcKKqa05t5UNhwOMt8MSMlJdBOK053SL9R43ky+jZ4mHkMRjEgqtiHpVT
         p0p97Vd5fWMvCBpZHopLynM/S9QDB9gmolUi83ceuLtu5cz9y4bJfrpfVkSEuANP7/CW
         Ln3SwPI0c/g8ME9mFLfNt95Ih/zA8jKZlNd4At8qk0+BNBB+LDgV4OCRPqnRa51dANXN
         p17g==
X-Gm-Message-State: AOJu0YxNPxVfgfdN+m32Wn4F+Npeytoi38VXSBAp+kR6Js5L+j/TMOtg
	AlqHALLwHhUKhC5Gg9fKui6YVRH5gqmY9TKe86xFS0a5KN0KCt+SmGPRnqYZyxZ78eFtWKHjUIi
	xCns=
X-Gm-Gg: ASbGnctKGWAPsC8NizkdhW2shxIySnpY4I1/KrLu7jFnQfTpAd3rAJgSjlxpgslrhOp
	GNydDNQbdyBeibKvraaKC9x9VQ7VRGXtUs/bi0ZQlDyQ5MZkWJ+n0aAXOuOpq//oBFAFbwUx6lp
	QsH1ggC9m0OPSrRTCi/FmC33ebcMIlQVwOOfVs9OAU1gkZ1Eu3yJUzWoV3VCXsgEBDrqd0EeJA5
	vJcpMxKBCKog3eKsXrQMXljmQ4bOMAfz8hGcg8Yi63BfU6NIlZWSaEYMnyIOK9ztql3ODe3Qq31
	PW2ewv6lFR/9cY2yDL9PsWHCtjyf/PSWPVxjuOSX3iw87J3FgeYIgbu7dHc=
X-Google-Smtp-Source: AGHT+IHANdNcEuSk3JUmNF8b1IphrGJ40kUtQEAyVIqtsJvzWh7W5bLvH9nHff5RehXKbMMNmLeUAA==
X-Received: by 2002:a17:907:3e1d:b0:aa6:800a:1292 with SMTP id a640c23a62f3a-aab779ab53dmr1811455166b.25.1734455211849;
        Tue, 17 Dec 2024 09:06:51 -0800 (PST)
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
Subject: [PATCH v13 11/12] xen/arm: make consider_modules() available for xen relocation
Date: Tue, 17 Dec 2024 18:06:36 +0100
Message-ID: <20241217170637.233097-12-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
References: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
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
v13:
- no changes
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
index 0824d61323..956693232a 100644
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
index 8c87649bc8..041e3fc1b6 100644
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


