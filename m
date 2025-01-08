Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CCFA05FE1
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:19:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867492.1279115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXq2-0002y2-95; Wed, 08 Jan 2025 15:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867492.1279115; Wed, 08 Jan 2025 15:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXq1-0002r2-QG; Wed, 08 Jan 2025 15:19:17 +0000
Received: by outflank-mailman (input) for mailman id 867492;
 Wed, 08 Jan 2025 15:19:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVXpz-0008Lg-IS
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:19:15 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb7b0015-cdd3-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 16:19:14 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aaf60d85238so1272591666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:19:14 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae71desm2488412166b.89.2025.01.08.07.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 07:19:13 -0800 (PST)
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
X-Inumbo-ID: eb7b0015-cdd3-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736349554; x=1736954354; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBjkyLdsM17iRKfOvcTvCdENHWOQ8GdEz5R+mPR7wOI=;
        b=OsHcG82ueMHXdbQVs94HoeEMORhwZ7cUMwx9u3+gHCIDprc1cQroBeUZae/XNlU7O2
         CbncZ7V1gB59SuHpwbuiULUAtP8uM18bwjjNJ/ENPVXaMohcPjVpgelZaC4AQOW8WpA/
         6FvucMMpkQd5rCiZsy3dR4w36Dr+ctZ9QhenU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349554; x=1736954354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBjkyLdsM17iRKfOvcTvCdENHWOQ8GdEz5R+mPR7wOI=;
        b=NNw7p9GA8gBr0FRruG7Ynk5WDmRKcHJn7HgeeBlJhIB6n+sWnFyFv3sNP1Me5Z1B66
         qfCw4pbEMO86O+5fSa8W0J6G6k6+Wc1Cf+1l2XPUJBNocgtSYXEUCX9cMOq5OKr2cnK5
         TziD6KJqcTK59LSwQt1tR7fm7IttDNGRzHHM/hLAWqNdo2o2ukRjJ1CZbUK8FN1r/hWr
         FfE04zT5epJ4Es98HCoCnxXTqW5OH0eLZaWRw+XrqbPWYRr+ES0GhyISdrnwU3ZFFPor
         9CElo+d/vXo5LTvvkBkJ7P3JZjYPsndUnjTLPuHkRjfOPmXmLb27sJrj9m8Z8HUithrb
         lKcg==
X-Gm-Message-State: AOJu0YwDtheWfaEVyatbIPdtCi4iCIHml2Av3Q3fR/+BZLwCGHCelGmt
	Jtd4Dv8XIoFBhQFeQEyU8KF0idKXcVwHG56xPHFd2hCa9DDyEgBaJ8IB4GVirvvWvK5tlscdR3F
	uaJAUAQ==
X-Gm-Gg: ASbGncv+0oTllUgdVf47aF6vT+vqFs8aU9eNYj1Yo5rKn4Mix29blmyd+3NMV7nDSyh
	XWIbUL6KgTtGrOeQ/cjVLXHkCFVeRt9+ZRaVf9RIMTbk5iCCBdhniTzpPFyiCM1RYbqFBBOJcSH
	EUNYkgEoMTj2i65Ebi3U3DseMneoElxjny4S0fAayBkI/D/pRZWTmn+0AJzEJggvr3jeCfLuRcs
	BgavPwL70MtpNEai/y1aIXtYUoEdLXc9sPgIfHCc+ejyS69msC7Jpi8K7mdflRy5Jv+eMWaor8t
	Btg=
X-Google-Smtp-Source: AGHT+IFr/4vVsl04wRMj0lsbKLbG9ZbWt/CJpvwrdHYprt+TFDd3PrslNZSj1LFhnlLTVEjrn+bd9Q==
X-Received: by 2002:a17:907:1b12:b0:aae:85b4:a07 with SMTP id a640c23a62f3a-ab2ab675c58mr266911366b.8.1736349553655;
        Wed, 08 Jan 2025 07:19:13 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Elias El Yandouzi <eliasely@amazon.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v5 12/15] xen/arm64: mm: Use per-pCPU page-tables
Date: Wed,  8 Jan 2025 15:18:19 +0000
Message-ID: <20250108151822.16030-13-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, on Arm64, every pCPU is sharing the same page-tables.

In a follow-up patch, we will allow the possibility to remove the
direct map and therefore it will be necessary to have a mapcache.

While we have plenty of spare virtual address space to reserve part
for each pCPU, it means that temporary mappings (e.g. guest memory)
could be accessible by every pCPU.

In order to increase our security posture, it would be better if
those mappings are only accessible by the pCPU doing the temporary
mapping.

In addition to that, a per-pCPU page-tables opens the way to have
per-domain mapping area.

Arm32 is already using per-pCPU page-tables so most of the code
can be re-used. Arm64 doesn't yet have support for the mapcache,
so a stub is provided (moved to its own header asm/domain_page.h).

Take the opportunity to fix a typo in a comment that is modified.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4->v5:
  * Added missing asm/domain_page.h header to arm32. Compilation fails
    otherwise.
  * NOTE: I rebased this patch over the LLC coloring as best as I could
          and may have messed it up. Please do double check.
---
 xen/arch/arm/arm32/mmu/mm.c            |  1 +
 xen/arch/arm/arm64/mmu/mm.c            |  3 ++-
 xen/arch/arm/include/asm/arm32/mm.h    |  8 --------
 xen/arch/arm/include/asm/domain_page.h | 13 +++++++++++++
 xen/arch/arm/include/asm/mm.h          |  3 +++
 xen/arch/arm/include/asm/mmu/mm.h      |  2 ++
 xen/arch/arm/mmu/pt.c                  |  6 +++---
 xen/arch/arm/mmu/setup.c               | 23 ++++++++++-------------
 xen/arch/arm/mmu/smpboot.c             | 16 +---------------
 xen/arch/arm/setup.c                   |  1 +
 10 files changed, 36 insertions(+), 40 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/domain_page.h

diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index 956693232a1b..60b7f4f40512 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -6,6 +6,7 @@
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/pfn.h>
+#include <asm/domain_page.h>
 #include <asm/fixmap.h>
 #include <asm/setup.h>
 #include <asm/static-memory.h>
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index 26361c4fe4c0..7de5885cc776 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -77,6 +77,7 @@ static void __init prepare_runtime_identity_mapping(void)
     paddr_t id_addr = virt_to_maddr(_start);
     lpae_t pte;
     DECLARE_OFFSETS(id_offsets, id_addr);
+    lpae_t *root = this_cpu(xen_pgtable);
 
     if ( id_offsets[0] >= IDENTITY_MAPPING_AREA_NR_L0 )
         panic("Cannot handle ID mapping above %uTB\n",
@@ -87,7 +88,7 @@ static void __init prepare_runtime_identity_mapping(void)
     pte.pt.table = 1;
     pte.pt.xn = 0;
 
-    write_pte(&xen_pgtable[id_offsets[0]], pte);
+    write_pte(&root[id_offsets[0]], pte);
 
     /* Link second ID table */
     pte = pte_of_xenaddr((vaddr_t)xen_second_id);
diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
index 856f2dbec4ad..87a315db013d 100644
--- a/xen/arch/arm/include/asm/arm32/mm.h
+++ b/xen/arch/arm/include/asm/arm32/mm.h
@@ -1,12 +1,6 @@
 #ifndef __ARM_ARM32_MM_H__
 #define __ARM_ARM32_MM_H__
 
-#include <xen/percpu.h>
-
-#include <asm/lpae.h>
-
-DECLARE_PER_CPU(lpae_t *, xen_pgtable);
-
 /*
  * Only a limited amount of RAM, called xenheap, is always mapped on ARM32.
  * For convenience always return false.
@@ -16,8 +10,6 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
     return false;
 }
 
-bool init_domheap_mappings(unsigned int cpu);
-
 static inline void arch_setup_page_tables(void)
 {
 }
diff --git a/xen/arch/arm/include/asm/domain_page.h b/xen/arch/arm/include/asm/domain_page.h
new file mode 100644
index 000000000000..e9f52685e2ec
--- /dev/null
+++ b/xen/arch/arm/include/asm/domain_page.h
@@ -0,0 +1,13 @@
+#ifndef __ASM_ARM_DOMAIN_PAGE_H__
+#define __ASM_ARM_DOMAIN_PAGE_H__
+
+#ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
+bool init_domheap_mappings(unsigned int cpu);
+#else
+static inline bool init_domheap_mappings(unsigned int cpu)
+{
+    return true;
+}
+#endif
+
+#endif /* __ASM_ARM_DOMAIN_PAGE_H__ */
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index f91ff088f6b1..07329a17fffa 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -2,6 +2,9 @@
 #define __ARCH_ARM_MM__
 
 #include <xen/kernel.h>
+#include <xen/percpu.h>
+
+#include <asm/lpae.h>
 #include <asm/page.h>
 #include <public/xen.h>
 #include <xen/pdx.h>
diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
index f5a00558c47b..5a8fde313693 100644
--- a/xen/arch/arm/include/asm/mmu/mm.h
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -2,6 +2,8 @@
 #ifndef __ARM_MMU_MM_H__
 #define __ARM_MMU_MM_H__
 
+DECLARE_PER_CPU(lpae_t *, xen_pgtable);
+
 /* Non-boot CPUs use this to find the correct pagetables. */
 extern uint64_t init_ttbr;
 
diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index da28d669e796..1ed1a53ab1f2 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -607,9 +607,9 @@ static int xen_pt_update(unsigned long virt,
     unsigned long left = nr_mfns;
 
     /*
-     * For arm32, page-tables are different on each CPUs. Yet, they share
-     * some common mappings. It is assumed that only common mappings
-     * will be modified with this function.
+     * Page-tables are different on each CPU. Yet, they share some common
+     * mappings. It is assumed that only common mappings will be modified
+     * with this function.
      *
      * XXX: Add a check.
      */
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 30afe9778194..d9308e0475ff 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -34,17 +34,15 @@
  * PCPUs.
  */
 
-#ifdef CONFIG_ARM_64
-DEFINE_PAGE_TABLE(xen_pgtable);
-static DEFINE_PAGE_TABLE(xen_first);
-#define THIS_CPU_PGTABLE xen_pgtable
-#else
 /* Per-CPU pagetable pages */
 /* xen_pgtable == root of the trie (zeroeth level on 64-bit, first on 32-bit) */
 DEFINE_PER_CPU(lpae_t *, xen_pgtable);
 #define THIS_CPU_PGTABLE this_cpu(xen_pgtable)
 /* Root of the trie for cpu0, other CPU's PTs are dynamically allocated */
 static DEFINE_PAGE_TABLE(cpu0_pgtable);
+
+#ifdef CONFIG_ARM_64
+static DEFINE_PAGE_TABLE(xen_first);
 #endif
 
 /* Common pagetable leaves */
@@ -368,17 +366,20 @@ void __init setup_pagetables(void)
     if ( llc_coloring_enabled )
         create_llc_coloring_mappings();
 
+    p = cpu0_pgtable;
+
+    /* arch_setup_page_tables() may need to access the root page-tables. */
+    per_cpu(xen_pgtable, 0) = cpu0_pgtable;
+
     arch_setup_page_tables();
 
 #ifdef CONFIG_ARM_64
     pte = pte_of_xenaddr((uintptr_t)xen_first);
     pte.pt.table = 1;
     pte.pt.xn = 0;
-    xen_pgtable[zeroeth_table_offset(XEN_VIRT_START)] = pte;
+    p[zeroeth_table_offset(XEN_VIRT_START)] = pte;
 
-    p = (void *) xen_first;
-#else
-    p = (void *) cpu0_pgtable;
+    p = xen_first;
 #endif
 
     /* Map xen second level page-table */
@@ -415,10 +416,6 @@ void __init setup_pagetables(void)
     pte.pt.table = 1;
     xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
 
-#ifdef CONFIG_ARM_32
-    per_cpu(xen_pgtable, 0) = cpu0_pgtable;
-#endif
-
     if ( llc_coloring_enabled )
     {
         ttbr = virt_to_maddr(virt_to_reloc_virt(THIS_CPU_PGTABLE));
diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
index 37e91d72b785..e4bde31605bd 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -7,6 +7,7 @@
 
 #include <xen/domain_page.h>
 
+#include <asm/domain_page.h>
 #include <asm/setup.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
@@ -93,20 +94,6 @@ static void set_init_ttbr(lpae_t *root)
     unmap_domain_page(ptr);
 }
 
-#ifdef CONFIG_ARM_64
-int prepare_secondary_mm(int cpu)
-{
-    clear_boot_pagetables();
-
-    /*
-     * Set init_ttbr for this CPU coming up. All CPUs share a single setof
-     * pagetables, but rewrite it each time for consistency with 32 bit.
-     */
-    set_init_ttbr(xen_pgtable);
-
-    return 0;
-}
-#else
 int prepare_secondary_mm(int cpu)
 {
     lpae_t *root = alloc_xenheap_page();
@@ -136,7 +123,6 @@ int prepare_secondary_mm(int cpu)
 
     return 0;
 }
-#endif
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index c1f2d1b89d43..3b1ab6be3fbd 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -44,6 +44,7 @@
 #include <asm/gic.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
+#include <asm/domain_page.h>
 #include <asm/platform.h>
 #include <asm/procinfo.h>
 #include <asm/setup.h>
-- 
2.47.1


