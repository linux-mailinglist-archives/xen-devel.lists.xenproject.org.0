Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ACA8C42D9
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 16:08:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721005.1124144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6WLQ-0004YQ-II; Mon, 13 May 2024 14:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721005.1124144; Mon, 13 May 2024 14:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6WLQ-0004WW-Fa; Mon, 13 May 2024 14:08:00 +0000
Received: by outflank-mailman (input) for mailman id 721005;
 Mon, 13 May 2024 14:07:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6Vvr-0002lY-Os
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 13:41:35 +0000
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com
 [99.78.197.217]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8031db8c-112e-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 15:41:30 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.214])
 by smtp-border-fw-80006.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 13:41:28 +0000
Received: from EX19MTAUEA002.ant.amazon.com [10.0.0.204:18499]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.32.236:2525]
 with esmtp (Farcaster)
 id a8122ecf-7fd9-4f59-993e-fba829406aa3; Mon, 13 May 2024 13:41:27 +0000 (UTC)
Received: from EX19D008UEA001.ant.amazon.com (10.252.134.62) by
 EX19MTAUEA002.ant.amazon.com (10.252.134.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:27 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA001.ant.amazon.com (10.252.134.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:26 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 13:41:25 +0000
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
X-Inumbo-ID: 8031db8c-112e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715607690; x=1747143690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SVsOmDKOmFhMFa0LMfYH4rjGO+/XR9rqN+YrORlcGU8=;
  b=FmV0JThiGHomkIF1ZwyUKyGi+HV8jmCwydiLpEgrZ7lfcIvU6SSGkSvK
   gIwP86Va6QZmCa2H7Qtgjn2/Rlh+p4IqTiEExvu4NZxiU/uTnnqOI6VtA
   gccA902/jW1qEMULSH/OI5YljpEufZtKBvovWQTYYrBB67SCRDFolXefW
   k=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="294692592"
X-Farcaster-Flow-ID: a8122ecf-7fd9-4f59-993e-fba829406aa3
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH V3 (resend) 17/19] xen/arm64: mm: Use per-pCPU page-tables
Date: Mon, 13 May 2024 13:40:44 +0000
Message-ID: <20240513134046.82605-18-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513134046.82605-1-eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

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

----

    Changelog since v1:
        * Rebase
        * Fix typoes

diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index 293acb67e0..2ec1ffe1dc 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -76,6 +76,7 @@ static void __init prepare_runtime_identity_mapping(void)
     paddr_t id_addr = virt_to_maddr(_start);
     lpae_t pte;
     DECLARE_OFFSETS(id_offsets, id_addr);
+    lpae_t *root = this_cpu(xen_pgtable);
 
     if ( id_offsets[0] >= IDENTITY_MAPPING_AREA_NR_L0 )
         panic("Cannot handle ID mapping above %uTB\n",
@@ -86,7 +87,7 @@ static void __init prepare_runtime_identity_mapping(void)
     pte.pt.table = 1;
     pte.pt.xn = 0;
 
-    write_pte(&xen_pgtable[id_offsets[0]], pte);
+    write_pte(&root[id_offsets[0]], pte);
 
     /* Link second ID table */
     pte = pte_of_xenaddr((vaddr_t)xen_second_id);
diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/domain_page.c
index 3a43601623..ac2a6d0332 100644
--- a/xen/arch/arm/domain_page.c
+++ b/xen/arch/arm/domain_page.c
@@ -3,6 +3,8 @@
 #include <xen/pmap.h>
 #include <xen/vmap.h>
 
+#include <asm/domain_page.h>
+
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
index 856f2dbec4..87a315db01 100644
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
index 0000000000..e9f52685e2
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
index 2bca3f9e87..60e0122cba 100644
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
index c5e03a66bf..c03c3a51e4 100644
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
index da28d669e7..1ed1a53ab1 100644
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
index f4bb424c3c..7b981456e6 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -28,17 +28,15 @@
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
@@ -228,19 +226,22 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
     lpae_t pte, *p;
     int i;
 
+    p = cpu0_pgtable;
+
     phys_offset = boot_phys_offset;
 
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
@@ -283,19 +284,11 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
     pte.pt.table = 1;
     xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
 
-#ifdef CONFIG_ARM_64
-    ttbr = (uintptr_t) xen_pgtable + phys_offset;
-#else
     ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
-#endif
 
     switch_ttbr(ttbr);
 
     xen_pt_enforce_wnx();
-
-#ifdef CONFIG_ARM_32
-    per_cpu(xen_pgtable, 0) = cpu0_pgtable;
-#endif
 }
 
 void *__init arch_vmap_virt_end(void)
diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
index e29b6f34f2..eb51d6aae9 100644
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
@@ -138,7 +125,6 @@ int prepare_secondary_mm(int cpu)
 
     return 0;
 }
-#endif
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d242674381..d15987d6ea 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -42,6 +42,7 @@
 #include <asm/gic.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
+#include <asm/domain_page.h>
 #include <asm/platform.h>
 #include <asm/procinfo.h>
 #include <asm/setup.h>
-- 
2.40.1


