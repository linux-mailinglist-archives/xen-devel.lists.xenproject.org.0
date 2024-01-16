Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B277282F55A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:28:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668118.1040125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp72-0004dI-Hm; Tue, 16 Jan 2024 19:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668118.1040125; Tue, 16 Jan 2024 19:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp72-0004bM-ET; Tue, 16 Jan 2024 19:28:40 +0000
Received: by outflank-mailman (input) for mailman id 668118;
 Tue, 16 Jan 2024 19:28:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp5U-0003Xv-35
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:27:04 +0000
Received: from smtp-fw-52002.amazon.com (smtp-fw-52002.amazon.com
 [52.119.213.150]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 395d8250-b4a5-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 20:27:02 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2c-m6i4x-d2040ec1.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-52002.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:27:01 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
 by email-inbound-relay-pdx-2c-m6i4x-d2040ec1.us-west-2.amazon.com (Postfix)
 with ESMTPS id 90AE540D7F; Tue, 16 Jan 2024 19:26:59 +0000 (UTC)
Received: from EX19MTAUEB002.ant.amazon.com [10.0.29.78:14119]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.57.22:2525]
 with esmtp (Farcaster)
 id 193c356f-d5a1-4ec0-b9d7-e823c4fd556c; Tue, 16 Jan 2024 19:26:58 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEB002.ant.amazon.com (10.252.135.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:46 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:46 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:45 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 395d8250-b4a5-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433223; x=1736969223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HBVAS715RpCNC8CvMLRfobjdzDnsKgjKWFL+xKdoEXs=;
  b=i4udLAip7iPs8rJsBIgH6ZhDtid5EH+Du6YLwpmLgFbxxE2o99m3zaVJ
   tyOl4eewHaTALD5eTHySaeGJhSluultpsqmZ9WqKXwUfjhGQ3TRnktEOr
   GLdsZHiN0WIE6NU7U+eJE1c8h5T4eMQ+PfTKBXywe3jZx7N6c1Cf6B9pv
   k=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="606818936"
X-Farcaster-Flow-ID: 193c356f-d5a1-4ec0-b9d7-e823c4fd556c
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH v2 (resend) 25/27] xen/arm64: mm: Use per-pCPU page-tables
Date: Tue, 16 Jan 2024 19:26:09 +0000
Message-ID: <20240116192611.41112-26-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
References: <20240116192611.41112-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

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
index d2651c9486..4f339efb7b 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -75,6 +75,7 @@ static void __init prepare_runtime_identity_mapping(void)
     paddr_t id_addr = virt_to_maddr(_start);
     lpae_t pte;
     DECLARE_OFFSETS(id_offsets, id_addr);
+    lpae_t *root = this_cpu(xen_pgtable);
 
     if ( id_offsets[0] >= IDENTITY_MAPPING_AREA_NR_L0 )
         panic("Cannot handle ID mapping above %uTB\n",
@@ -85,7 +86,7 @@ static void __init prepare_runtime_identity_mapping(void)
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
index 9a94d7eaf7..a76578a16f 100644
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
index a7755728ae..e772ab4e66 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -606,9 +606,9 @@ static int xen_pt_update(unsigned long virt,
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
index 57f1b46499..8c81e26da3 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -26,17 +26,15 @@
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
index fb5df667ba..fdd9b9c580 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -7,6 +7,7 @@
 
 #include <xen/domain_page.h>
 
+#include <asm/domain_page.h>
 #include <asm/setup.h>
 
 /*
@@ -68,20 +69,6 @@ static void clear_boot_pagetables(void)
     clear_table(boot_third);
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
-    init_ttbr = virt_to_maddr(xen_pgtable);
-    clean_dcache(init_ttbr);
-    return 0;
-}
-#else
 int prepare_secondary_mm(int cpu)
 {
     lpae_t *root = alloc_xenheap_page();
@@ -112,7 +99,6 @@ int prepare_secondary_mm(int cpu)
 
     return 0;
 }
-#endif
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7e28f62d09..3dec365c57 100644
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


