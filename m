Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A55FA37FC4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:18:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890010.1299109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyCt-00020U-An; Mon, 17 Feb 2025 10:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890010.1299109; Mon, 17 Feb 2025 10:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyCt-0001qL-2w; Mon, 17 Feb 2025 10:18:31 +0000
Received: by outflank-mailman (input) for mailman id 890010;
 Mon, 17 Feb 2025 10:18:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XXfn=VI=bounce.vates.tech=bounce-md_30504962.67b30cef.v1-a3bc10c83c634101bf8dbbdbe1fbb292@srs-se1.protection.inumbo.net>)
 id 1tjyCr-0008Nl-9f
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:18:29 +0000
Received: from mail13.wdc04.mandrillapp.com (mail13.wdc04.mandrillapp.com
 [205.201.139.13]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 852e5ae5-ed18-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 11:18:24 +0100 (CET)
Received: from pmta16.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail13.wdc04.mandrillapp.com (Mailchimp) with ESMTP id 4YxJWz6N4FzNCdCf0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 10:18:23 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a3bc10c83c634101bf8dbbdbe1fbb292; Mon, 17 Feb 2025 10:18:23 +0000
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
X-Inumbo-ID: 852e5ae5-ed18-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1739787503; x=1740057503;
	bh=bzfNvWE5kbPAbUkvS+oqP/fh38Hyfkhqt9wTC3oGwMA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=P4pJcXtqIZb8rjypb3pSidHMF8UD8INqTrYrMJSrQl9wIUyuDlj75Yaz9fPRkOeV7
	 AtdSBnWYyHD4kuKtNDohL/MyaOd4OFwdSBCy99Q4gYzOfg2/FDyJ7OFda7hLh3oeMr
	 992fKEERMmk8s+GKgCaAOVd3KdE4NeBBzDNfUokdksPm/1fDwNhLC5X4pSYx+zbI84
	 qIx49jS4ky5CIXAZwbTE0IT/Tu91YBd6Ty9Oz2Q3r0AuqZp7ytPlqJX4VC959h5oF5
	 55RHP6O3GiAVBFASY6Lqu9NcLqnuxPt3TaSS1w5ud0uWyAx2ma/8InNOeGMTewFJER
	 zLHJfprVjkrtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1739787503; x=1740048003; i=teddy.astie@vates.tech;
	bh=bzfNvWE5kbPAbUkvS+oqP/fh38Hyfkhqt9wTC3oGwMA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=rJatvqD04TbD9W1Ss7x6UBVWoVwBH8KBw0VueBTnpOTaWYd6OeyADqBs/3BtLd72i
	 /f+yrxBFsGsIndLYAoPKMZCF429PVAvn6oSKU5I1MnkcnvWzKrb2E1iyQXHSEebmpx
	 JSABY4RvZXoulbZcGxO/NnNlisBBpG2oRsdFEFLPii32MoAUG+QuO+kk0r33Kzim01
	 Z9Fn9WwJ8lKNI2HKRADAj7Q8wiCAvUTuTlvKbnAIHtMP26QvUyt7KZZrTeBPZX+3g9
	 gtNwSruJwgNOjCQKxTh9usHbkNVi/HJ6AaFp1WISikPaiiWYttAXEjMN1g6QB34d69
	 aZF8JqmEyt7MA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20RFC=20PATCH=20v6=2004/11]=20iommu:=20Move=20IOMMU=20domain=20related=20structures=20to=20(arch=5F)iommu=5Fcontext?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1739787500484
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall" <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Michal Orzel" <michal.orzel@amd.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Lukasz Hawrylko" <lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Mateusz=20M=C3=B3wka?=" <mateusz.mowka@intel.com>
Message-Id: <0cd25b4114458dc957c0fb818d01162dfab9548b.1739785339.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1739785339.git.teddy.astie@vates.tech>
References: <cover.1739785339.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a3bc10c83c634101bf8dbbdbe1fbb292?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250217:md
Date: Mon, 17 Feb 2025 10:18:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Preparatory work for IOMMU redesign.

Introduce a new structure (arch_)iommu_context that will hold all
per-IOMMU context related informations for the IOMMU drivers.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/arm/include/asm/iommu.h            |   4 +
 xen/arch/ppc/include/asm/iommu.h            |   3 +
 xen/arch/x86/domain.c                       |   4 +-
 xen/arch/x86/include/asm/iommu.h            |  50 +++--
 xen/arch/x86/tboot.c                        |   3 +-
 xen/drivers/passthrough/amd/iommu.h         |   5 +-
 xen/drivers/passthrough/amd/iommu_init.c    |   8 +-
 xen/drivers/passthrough/amd/iommu_map.c     | 102 +++++-----
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  81 ++++----
 xen/drivers/passthrough/iommu.c             |   6 +
 xen/drivers/passthrough/vtd/extern.h        |   4 +-
 xen/drivers/passthrough/vtd/iommu.c         | 208 +++++++++++---------
 xen/drivers/passthrough/vtd/quirks.c        |   3 +-
 xen/drivers/passthrough/x86/iommu.c         |  62 +++---
 xen/include/xen/iommu.h                     |  10 +
 15 files changed, 320 insertions(+), 233 deletions(-)

diff --git a/xen/arch/arm/include/asm/iommu.h b/xen/arch/arm/include/asm/iommu.h
index d57bd8a38c..5ca56cc663 100644
--- a/xen/arch/arm/include/asm/iommu.h
+++ b/xen/arch/arm/include/asm/iommu.h
@@ -20,6 +20,10 @@ struct arch_iommu
     void *priv;
 };
 
+struct arch_iommu_context
+{
+};
+
 const struct iommu_ops *iommu_get_ops(void);
 void iommu_set_ops(const struct iommu_ops *ops);
 
diff --git a/xen/arch/ppc/include/asm/iommu.h b/xen/arch/ppc/include/asm/iommu.h
index 024ead3473..8367505de2 100644
--- a/xen/arch/ppc/include/asm/iommu.h
+++ b/xen/arch/ppc/include/asm/iommu.h
@@ -5,4 +5,7 @@
 struct arch_iommu {
 };
 
+struct arch_iommu_context {
+};
+
 #endif /* __ASM_PPC_IOMMU_H__ */
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 48bf9625e2..26729c879c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -678,7 +678,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     if ( nested_virt && !hvm_nested_virt_supported() )
     {
         dprintk(XENLOG_INFO, "Nested virt requested but not available\n");
-        return -EINVAL;        
+        return -EINVAL;
     }
 
     if ( nested_virt && !hap )
@@ -2392,7 +2392,7 @@ int domain_relinquish_resources(struct domain *d)
 
     PROGRESS(iommu_pagetables):
 
-        ret = iommu_free_pgtables(d);
+        ret = iommu_free_pgtables(d, iommu_default_context(d));
         if ( ret )
             return ret;
 
diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index 8dc464fbd3..94513ba9dc 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -31,22 +31,21 @@ typedef uint64_t daddr_t;
 #define dfn_to_daddr(dfn) __dfn_to_daddr(dfn_x(dfn))
 #define daddr_to_dfn(daddr) _dfn(__daddr_to_dfn(daddr))
 
-struct arch_iommu
-{
-    spinlock_t mapping_lock; /* io page table lock */
-    struct {
-        struct page_list_head list;
-        spinlock_t lock;
-    } pgtables;
+struct iommu_context;
 
+struct arch_iommu_context
+{
+    struct page_list_head pgtables;
     struct list_head identity_maps;
 
+
+    spinlock_t mapping_lock; /* io page table lock */
+
     union {
         /* Intel VT-d */
         struct {
             uint64_t pgd_maddr; /* io page directory machine address */
-            unsigned int agaw; /* adjusted guest address width, 0 is level 2 30-bit */
-            unsigned long *iommu_bitmap; /* bitmap of iommu(s) that the domain uses */
+            unsigned long *iommu_bitmap; /* bitmap of iommu(s) that the context uses */
         } vtd;
         /* AMD IOMMU */
         struct {
@@ -56,6 +55,24 @@ struct arch_iommu
     };
 };
 
+struct arch_iommu
+{
+    /* Queue for freeing pages */
+    struct page_list_head free_queue;
+
+    union {
+        /* Intel VT-d */
+        struct {
+            unsigned int agaw; /* adjusted guest address width, 0 is level 2 30-bit */
+        } vtd;
+        /* AMD IOMMU */
+        struct {
+            unsigned int paging_mode;
+            struct guest_iommu *g_iommu;
+        };
+    };
+};
+
 extern struct iommu_ops iommu_ops;
 
 # include <asm/alternative.h>
@@ -109,10 +126,10 @@ static inline void iommu_disable_x2apic(void)
         iommu_vcall(&iommu_ops, disable_x2apic);
 }
 
-int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
-                           paddr_t base, paddr_t end,
+int iommu_identity_mapping(struct domain *d, struct iommu_context *ctx,
+                           p2m_access_t p2ma, paddr_t base, paddr_t end,
                            unsigned int flag);
-void iommu_identity_map_teardown(struct domain *d);
+void iommu_identity_map_teardown(struct domain *d, struct iommu_context *ctx);
 
 extern bool untrusted_msi;
 
@@ -128,14 +145,19 @@ unsigned long *iommu_init_domid(domid_t reserve);
 domid_t iommu_alloc_domid(unsigned long *map);
 void iommu_free_domid(domid_t domid, unsigned long *map);
 
-int __must_check iommu_free_pgtables(struct domain *d);
+int __must_check iommu_free_pgtables(struct domain *d, struct iommu_context *ctx);
 struct domain_iommu;
 struct page_info *__must_check iommu_alloc_pgtable(struct domain_iommu *hd,
+                                                   struct iommu_context *ctx,
                                                    uint64_t contig_mask);
-void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg);
+void iommu_queue_free_pgtable(struct domain *d, struct iommu_context *ctx,
+                              struct page_info *pg);
 
 /* Check [start, end] unity map range for correctness. */
 bool iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end);
+int arch_iommu_context_init(struct domain *d, struct iommu_context *ctx, u32 flags);
+int arch_iommu_context_teardown(struct domain *d, struct iommu_context *ctx, u32 flags);
+int arch_iommu_flush_free_queue(struct domain *d);
 
 #endif /* !__ARCH_X86_IOMMU_H__ */
 /*
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index d5db60d335..0a5aee8b92 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -220,7 +220,8 @@ static void tboot_gen_domain_integrity(const uint8_t key[TB_KEY_SIZE],
         {
             const struct domain_iommu *dio = dom_iommu(d);
 
-            update_iommu_mac(&ctx, dio->arch.vtd.pgd_maddr,
+            update_iommu_mac(&ctx,
+                             iommu_default_context(d)->arch.vtd.pgd_maddr,
                              agaw_to_level(dio->arch.vtd.agaw));
         }
     }
diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index c32e9e9a16..6095bc6a21 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -26,6 +26,7 @@
 #include <xen/tasklet.h>
 #include <xen/sched.h>
 #include <xen/domain_page.h>
+#include <xen/iommu.h>
 
 #include <asm/msi.h>
 #include <asm/apicdef.h>
@@ -199,10 +200,10 @@ int __must_check cf_check amd_iommu_unmap_page(
     struct domain *d, dfn_t dfn, unsigned int order,
     unsigned int *flush_flags);
 int __must_check amd_iommu_alloc_root(struct domain *d);
-int amd_iommu_reserve_domain_unity_map(struct domain *d,
+int amd_iommu_reserve_domain_unity_map(struct domain *d, struct iommu_context *ctx,
                                        const struct ivrs_unity_map *map,
                                        unsigned int flag);
-int amd_iommu_reserve_domain_unity_unmap(struct domain *d,
+int amd_iommu_reserve_domain_unity_unmap(struct domain *d, struct iommu_context *ctx,
                                          const struct ivrs_unity_map *map);
 int cf_check amd_iommu_get_reserved_device_memory(
     iommu_grdm_t *func, void *ctxt);
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 3023625020..41e241ccc8 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -604,7 +604,6 @@ static void iommu_check_event_log(struct amd_iommu *iommu)
                    sizeof(event_entry_t), parse_event_log_entry);
 
     spin_lock_irqsave(&iommu->lock, flags);
-    
     /* Check event overflow. */
     entry = readl(iommu->mmio_base + IOMMU_STATUS_MMIO_OFFSET);
     if ( entry & IOMMU_STATUS_EVENT_LOG_OVERFLOW )
@@ -660,9 +659,8 @@ static void iommu_check_ppr_log(struct amd_iommu *iommu)
 
     iommu_read_log(iommu, &iommu->ppr_log,
                    sizeof(ppr_entry_t), parse_ppr_log_entry);
-    
-    spin_lock_irqsave(&iommu->lock, flags);
 
+    spin_lock_irqsave(&iommu->lock, flags);
     /* Check event overflow. */
     entry = readl(iommu->mmio_base + IOMMU_STATUS_MMIO_OFFSET);
     if ( entry & IOMMU_STATUS_PPR_LOG_OVERFLOW )
@@ -1545,7 +1543,7 @@ static void invalidate_all_domain_pages(void)
 static int cf_check _invalidate_all_devices(
     u16 seg, struct ivrs_mappings *ivrs_mappings)
 {
-    unsigned int bdf; 
+    unsigned int bdf;
     u16 req_id;
     struct amd_iommu *iommu;
 
@@ -1595,7 +1593,7 @@ void cf_check amd_iommu_resume(void)
     for_each_amd_iommu ( iommu )
     {
        /*
-        * To make sure that iommus have not been touched 
+        * To make sure that iommus have not been touched
         * before re-enablement
         */
         disable_iommu(iommu);
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index dde393645a..7514384789 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -18,6 +18,7 @@
  */
 
 #include <xen/acpi.h>
+#include <xen/iommu.h>
 
 #include "iommu.h"
 
@@ -264,9 +265,9 @@ void __init iommu_dte_add_device_entry(struct amd_iommu_dte *dte,
  * {Re, un}mapping super page frames causes re-allocation of io
  * page tables.
  */
-static int iommu_pde_from_dfn(struct domain *d, unsigned long dfn,
-                              unsigned int target, unsigned long *pt_mfn,
-                              unsigned int *flush_flags, bool map)
+static int iommu_pde_from_dfn(struct domain *d, struct iommu_context *ctx,
+                              unsigned long dfn, unsigned int target,
+                              unsigned long *pt_mfn, unsigned int *flush_flags, bool map)
 {
     union amd_iommu_pte *pde, *next_table_vaddr;
     unsigned long  next_table_mfn;
@@ -274,8 +275,8 @@ static int iommu_pde_from_dfn(struct domain *d, unsigned long dfn,
     struct page_info *table;
     struct domain_iommu *hd = dom_iommu(d);
 
-    table = hd->arch.amd.root_table;
-    level = hd->arch.amd.paging_mode;
+    table = ctx->arch.amd.root_table;
+    level = ctx->arch.amd.paging_mode;
 
     if ( !table || target < 1 || level < target || level > 6 )
     {
@@ -311,7 +312,7 @@ static int iommu_pde_from_dfn(struct domain *d, unsigned long dfn,
             mfn = next_table_mfn;
 
             /* allocate lower level page table */
-            table = iommu_alloc_pgtable(hd, IOMMU_PTE_CONTIG_MASK);
+            table = iommu_alloc_pgtable(hd, ctx, IOMMU_PTE_CONTIG_MASK);
             if ( table == NULL )
             {
                 AMD_IOMMU_ERROR("cannot allocate I/O page table\n");
@@ -346,7 +347,7 @@ static int iommu_pde_from_dfn(struct domain *d, unsigned long dfn,
 
             if ( next_table_mfn == 0 )
             {
-                table = iommu_alloc_pgtable(hd, IOMMU_PTE_CONTIG_MASK);
+                table = iommu_alloc_pgtable(hd, ctx, IOMMU_PTE_CONTIG_MASK);
                 if ( table == NULL )
                 {
                     AMD_IOMMU_ERROR("cannot allocate I/O page table\n");
@@ -376,7 +377,8 @@ static int iommu_pde_from_dfn(struct domain *d, unsigned long dfn,
     return 0;
 }
 
-static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int level)
+static void queue_free_pt(struct domain *d, struct iommu_context *ctx, mfn_t mfn,
+                          unsigned int level)
 {
     if ( level > 1 )
     {
@@ -387,13 +389,13 @@ static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int level
             if ( pt[i].pr && pt[i].next_level )
             {
                 ASSERT(pt[i].next_level < level);
-                queue_free_pt(hd, _mfn(pt[i].mfn), pt[i].next_level);
+                queue_free_pt(d, ctx, _mfn(pt[i].mfn), pt[i].next_level);
             }
 
         unmap_domain_page(pt);
     }
 
-    iommu_queue_free_pgtable(hd, mfn_to_page(mfn));
+    iommu_queue_free_pgtable(d, ctx, mfn_to_page(mfn));
 }
 
 int cf_check amd_iommu_map_page(
@@ -401,6 +403,7 @@ int cf_check amd_iommu_map_page(
     unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx = iommu_default_context(d);
     unsigned int level = (IOMMUF_order(flags) / PTE_PER_TABLE_SHIFT) + 1;
     bool contig;
     int rc;
@@ -410,7 +413,7 @@ int cf_check amd_iommu_map_page(
     ASSERT((hd->platform_ops->page_sizes >> IOMMUF_order(flags)) &
            PAGE_SIZE_4K);
 
-    spin_lock(&hd->arch.mapping_lock);
+    spin_lock(&ctx->arch.mapping_lock);
 
     /*
      * IOMMU mapping request can be safely ignored when the domain is dying.
@@ -420,24 +423,24 @@ int cf_check amd_iommu_map_page(
      */
     if ( d->is_dying )
     {
-        spin_unlock(&hd->arch.mapping_lock);
+        spin_unlock(&ctx->arch.mapping_lock);
         return 0;
     }
 
     rc = amd_iommu_alloc_root(d);
     if ( rc )
     {
-        spin_unlock(&hd->arch.mapping_lock);
+        spin_unlock(&ctx->arch.mapping_lock);
         AMD_IOMMU_ERROR("root table alloc failed, dfn = %"PRI_dfn"\n",
                         dfn_x(dfn));
         domain_crash(d);
         return rc;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, true) ||
+    if ( iommu_pde_from_dfn(d, ctx, dfn_x(dfn), level, &pt_mfn, flush_flags, true) ||
          !pt_mfn )
     {
-        spin_unlock(&hd->arch.mapping_lock);
+        spin_unlock(&ctx->arch.mapping_lock);
         AMD_IOMMU_ERROR("invalid IO pagetable entry dfn = %"PRI_dfn"\n",
                         dfn_x(dfn));
         domain_crash(d);
@@ -449,12 +452,12 @@ int cf_check amd_iommu_map_page(
                                 flags & IOMMUF_writable,
                                 flags & IOMMUF_readable, &contig);
 
-    while ( unlikely(contig) && ++level < hd->arch.amd.paging_mode )
+    while ( unlikely(contig) && ++level < ctx->arch.amd.paging_mode )
     {
         struct page_info *pg = mfn_to_page(_mfn(pt_mfn));
         unsigned long next_mfn;
 
-        if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags,
+        if ( iommu_pde_from_dfn(d, ctx, dfn_x(dfn), level, &pt_mfn, flush_flags,
                                 false) )
             BUG();
         BUG_ON(!pt_mfn);
@@ -464,11 +467,11 @@ int cf_check amd_iommu_map_page(
                               flags & IOMMUF_writable,
                               flags & IOMMUF_readable, &contig);
         *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
-        iommu_queue_free_pgtable(hd, pg);
+        iommu_queue_free_pgtable(d, ctx, pg);
         perfc_incr(iommu_pt_coalesces);
     }
 
-    spin_unlock(&hd->arch.mapping_lock);
+    spin_unlock(&ctx->arch.mapping_lock);
 
     *flush_flags |= IOMMU_FLUSHF_added;
     if ( old.pr )
@@ -476,7 +479,7 @@ int cf_check amd_iommu_map_page(
         *flush_flags |= IOMMU_FLUSHF_modified;
 
         if ( IOMMUF_order(flags) && old.next_level )
-            queue_free_pt(hd, _mfn(old.mfn), old.next_level);
+            queue_free_pt(d, ctx, _mfn(old.mfn), old.next_level);
     }
 
     return 0;
@@ -487,6 +490,7 @@ int cf_check amd_iommu_unmap_page(
 {
     unsigned long pt_mfn = 0;
     struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx = iommu_default_context(d);
     unsigned int level = (order / PTE_PER_TABLE_SHIFT) + 1;
     union amd_iommu_pte old = {};
 
@@ -496,17 +500,17 @@ int cf_check amd_iommu_unmap_page(
      */
     ASSERT((hd->platform_ops->page_sizes >> order) & PAGE_SIZE_4K);
 
-    spin_lock(&hd->arch.mapping_lock);
+    spin_lock(&ctx->arch.mapping_lock);
 
-    if ( !hd->arch.amd.root_table )
+    if ( !ctx->arch.amd.root_table )
     {
-        spin_unlock(&hd->arch.mapping_lock);
+        spin_unlock(&ctx->arch.mapping_lock);
         return 0;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, false) )
+    if ( iommu_pde_from_dfn(d, ctx, dfn_x(dfn), level, &pt_mfn, flush_flags, false) )
     {
-        spin_unlock(&hd->arch.mapping_lock);
+        spin_unlock(&ctx->arch.mapping_lock);
         AMD_IOMMU_ERROR("invalid IO pagetable entry dfn = %"PRI_dfn"\n",
                         dfn_x(dfn));
         domain_crash(d);
@@ -520,30 +524,30 @@ int cf_check amd_iommu_unmap_page(
         /* Mark PTE as 'page not present'. */
         old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
 
-        while ( unlikely(free) && ++level < hd->arch.amd.paging_mode )
+        while ( unlikely(free) && ++level < ctx->arch.amd.paging_mode )
         {
             struct page_info *pg = mfn_to_page(_mfn(pt_mfn));
 
-            if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn,
+            if ( iommu_pde_from_dfn(d, ctx, dfn_x(dfn), level, &pt_mfn,
                                     flush_flags, false) )
                 BUG();
             BUG_ON(!pt_mfn);
 
             clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
             *flush_flags |= IOMMU_FLUSHF_all;
-            iommu_queue_free_pgtable(hd, pg);
+            iommu_queue_free_pgtable(d, ctx, pg);
             perfc_incr(iommu_pt_coalesces);
         }
     }
 
-    spin_unlock(&hd->arch.mapping_lock);
+    spin_unlock(&ctx->arch.mapping_lock);
 
     if ( old.pr )
     {
         *flush_flags |= IOMMU_FLUSHF_modified;
 
         if ( order && old.next_level )
-            queue_free_pt(hd, _mfn(old.mfn), old.next_level);
+            queue_free_pt(d, ctx, _mfn(old.mfn), old.next_level);
     }
 
     return 0;
@@ -646,7 +650,7 @@ int cf_check amd_iommu_flush_iotlb_pages(
     return 0;
 }
 
-int amd_iommu_reserve_domain_unity_map(struct domain *d,
+int amd_iommu_reserve_domain_unity_map(struct domain *d, struct iommu_context *ctx,
                                        const struct ivrs_unity_map *map,
                                        unsigned int flag)
 {
@@ -664,14 +668,14 @@ int amd_iommu_reserve_domain_unity_map(struct domain *d,
         if ( map->write )
             p2ma |= p2m_access_w;
 
-        rc = iommu_identity_mapping(d, p2ma, map->addr,
+        rc = iommu_identity_mapping(d, ctx, p2ma, map->addr,
                                     map->addr + map->length - 1, flag);
     }
 
     return rc;
 }
 
-int amd_iommu_reserve_domain_unity_unmap(struct domain *d,
+int amd_iommu_reserve_domain_unity_unmap(struct domain *d, struct iommu_context *ctx,
                                          const struct ivrs_unity_map *map)
 {
     int rc;
@@ -681,7 +685,7 @@ int amd_iommu_reserve_domain_unity_unmap(struct domain *d,
 
     for ( rc = 0; map; map = map->next )
     {
-        int ret = iommu_identity_mapping(d, p2m_access_x, map->addr,
+        int ret = iommu_identity_mapping(d, ctx, p2m_access_x, map->addr,
                                          map->addr + map->length - 1, 0);
 
         if ( ret && ret != -ENOENT && !rc )
@@ -771,6 +775,7 @@ static int fill_qpt(union amd_iommu_pte *this, unsigned int level,
                     struct page_info *pgs[IOMMU_MAX_PT_LEVELS])
 {
     struct domain_iommu *hd = dom_iommu(dom_io);
+    struct iommu_context *ctx = iommu_default_context(dom_io);
     unsigned int i;
     int rc = 0;
 
@@ -787,7 +792,7 @@ static int fill_qpt(union amd_iommu_pte *this, unsigned int level,
                  * page table pages, and the resulting allocations are always
                  * zeroed.
                  */
-                pgs[level] = iommu_alloc_pgtable(hd, 0);
+                pgs[level] = iommu_alloc_pgtable(hd, ctx, 0);
                 if ( !pgs[level] )
                 {
                     rc = -ENOMEM;
@@ -823,14 +828,15 @@ static int fill_qpt(union amd_iommu_pte *this, unsigned int level,
 int cf_check amd_iommu_quarantine_init(struct pci_dev *pdev, bool scratch_page)
 {
     struct domain_iommu *hd = dom_iommu(dom_io);
-    unsigned int level = hd->arch.amd.paging_mode;
+    struct iommu_context *ctx = iommu_default_context(dom_io);
+    unsigned int level = ctx->arch.amd.paging_mode;
     unsigned int req_id = get_dma_requestor_id(pdev->seg, pdev->sbdf.bdf);
     const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(pdev->seg);
     int rc;
 
     ASSERT(pcidevs_locked());
-    ASSERT(!hd->arch.amd.root_table);
-    ASSERT(page_list_empty(&hd->arch.pgtables.list));
+    ASSERT(!ctx->arch.amd.root_table);
+    ASSERT(page_list_empty(&ctx->arch.pgtables));
 
     if ( !scratch_page && !ivrs_mappings[req_id].unity_map )
         return 0;
@@ -843,19 +849,19 @@ int cf_check amd_iommu_quarantine_init(struct pci_dev *pdev, bool scratch_page)
         return 0;
     }
 
-    pdev->arch.amd.root_table = iommu_alloc_pgtable(hd, 0);
+    pdev->arch.amd.root_table = iommu_alloc_pgtable(hd, ctx, 0);
     if ( !pdev->arch.amd.root_table )
         return -ENOMEM;
 
     /* Transiently install the root into DomIO, for iommu_identity_mapping(). */
-    hd->arch.amd.root_table = pdev->arch.amd.root_table;
+    ctx->arch.amd.root_table = pdev->arch.amd.root_table;
 
-    rc = amd_iommu_reserve_domain_unity_map(dom_io,
+    rc = amd_iommu_reserve_domain_unity_map(dom_io, ctx,
                                             ivrs_mappings[req_id].unity_map,
                                             0);
 
-    iommu_identity_map_teardown(dom_io);
-    hd->arch.amd.root_table = NULL;
+    iommu_identity_map_teardown(dom_io, ctx);
+    ctx->arch.amd.root_table = NULL;
 
     if ( rc )
         AMD_IOMMU_WARN("%pp: quarantine unity mapping failed\n", &pdev->sbdf);
@@ -871,7 +877,7 @@ int cf_check amd_iommu_quarantine_init(struct pci_dev *pdev, bool scratch_page)
         pdev->arch.leaf_mfn = page_to_mfn(pgs[0]);
     }
 
-    page_list_move(&pdev->arch.pgtables_list, &hd->arch.pgtables.list);
+    page_list_move(&pdev->arch.pgtables_list, &ctx->arch.pgtables);
 
     if ( rc )
         amd_iommu_quarantine_teardown(pdev);
@@ -881,16 +887,16 @@ int cf_check amd_iommu_quarantine_init(struct pci_dev *pdev, bool scratch_page)
 
 void amd_iommu_quarantine_teardown(struct pci_dev *pdev)
 {
-    struct domain_iommu *hd = dom_iommu(dom_io);
+    struct iommu_context *ctx = iommu_default_context(dom_io);
 
     ASSERT(pcidevs_locked());
 
     if ( !pdev->arch.amd.root_table )
         return;
 
-    ASSERT(page_list_empty(&hd->arch.pgtables.list));
-    page_list_move(&hd->arch.pgtables.list, &pdev->arch.pgtables_list);
-    while ( iommu_free_pgtables(dom_io) == -ERESTART )
+    ASSERT(page_list_empty(&ctx->arch.pgtables));
+    page_list_move(&ctx->arch.pgtables, &pdev->arch.pgtables_list);
+    while ( iommu_free_pgtables(dom_io, ctx) == -ERESTART )
         /* nothing */;
     pdev->arch.amd.root_table = NULL;
 }
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index f96f59440b..a3815d71be 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -19,6 +19,7 @@
 
 #include <xen/iocap.h>
 #include <xen/softirq.h>
+#include <xen/iommu.h>
 
 #include <asm/acpi.h>
 
@@ -86,12 +87,12 @@ int get_dma_requestor_id(uint16_t seg, uint16_t bdf)
 
 static int __must_check allocate_domain_resources(struct domain *d)
 {
-    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx = iommu_default_context(d);
     int rc;
 
-    spin_lock(&hd->arch.mapping_lock);
+    spin_lock(&ctx->arch.mapping_lock);
     rc = amd_iommu_alloc_root(d);
-    spin_unlock(&hd->arch.mapping_lock);
+    spin_unlock(&ctx->arch.mapping_lock);
 
     return rc;
 }
@@ -125,7 +126,7 @@ static bool use_ats(
 }
 
 static int __must_check amd_iommu_setup_domain_device(
-    struct domain *domain, struct amd_iommu *iommu,
+    struct domain *domain, struct iommu_context *ctx, struct amd_iommu *iommu,
     uint8_t devfn, struct pci_dev *pdev)
 {
     struct amd_iommu_dte *table, *dte;
@@ -133,7 +134,6 @@ static int __must_check amd_iommu_setup_domain_device(
     unsigned int req_id, sr_flags;
     int rc;
     u8 bus = pdev->bus;
-    struct domain_iommu *hd = dom_iommu(domain);
     const struct ivrs_mappings *ivrs_dev;
     const struct page_info *root_pg;
     domid_t domid;
@@ -141,7 +141,7 @@ static int __must_check amd_iommu_setup_domain_device(
     if ( QUARANTINE_SKIP(domain, pdev) )
         return 0;
 
-    BUG_ON(!hd->arch.amd.paging_mode || !iommu->dev_table.buffer);
+    BUG_ON(!ctx->arch.amd.paging_mode || !iommu->dev_table.buffer);
 
     rc = allocate_domain_resources(domain);
     if ( rc )
@@ -161,7 +161,7 @@ static int __must_check amd_iommu_setup_domain_device(
 
     if ( domain != dom_io )
     {
-        root_pg = hd->arch.amd.root_table;
+        root_pg = ctx->arch.amd.root_table;
         domid = domain->domain_id;
     }
     else
@@ -177,7 +177,7 @@ static int __must_check amd_iommu_setup_domain_device(
         /* bind DTE to domain page-tables */
         rc = amd_iommu_set_root_page_table(
                  dte, page_to_maddr(root_pg), domid,
-                 hd->arch.amd.paging_mode, sr_flags);
+                 ctx->arch.amd.paging_mode, sr_flags);
         if ( rc )
         {
             ASSERT(rc < 0);
@@ -219,7 +219,7 @@ static int __must_check amd_iommu_setup_domain_device(
         else
             rc = amd_iommu_set_root_page_table(
                      dte, page_to_maddr(root_pg), domid,
-                     hd->arch.amd.paging_mode, sr_flags);
+                     ctx->arch.amd.paging_mode, sr_flags);
         if ( rc < 0 )
         {
             spin_unlock_irqrestore(&iommu->lock, flags);
@@ -270,7 +270,7 @@ static int __must_check amd_iommu_setup_domain_device(
                     "root table = %#"PRIx64", "
                     "domain = %d, paging mode = %d\n",
                     req_id, pdev->type, page_to_maddr(root_pg),
-                    domid, hd->arch.amd.paging_mode);
+                    domid, ctx->arch.amd.paging_mode);
 
     ASSERT(pcidevs_locked());
 
@@ -352,11 +352,12 @@ static int cf_check iov_enable_xt(void)
 int amd_iommu_alloc_root(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx = iommu_default_context(d);
 
-    if ( unlikely(!hd->arch.amd.root_table) && d != dom_io )
+    if ( unlikely(!ctx->arch.amd.root_table) && d != dom_io )
     {
-        hd->arch.amd.root_table = iommu_alloc_pgtable(hd, 0);
-        if ( !hd->arch.amd.root_table )
+        ctx->arch.amd.root_table = iommu_alloc_pgtable(hd, ctx, 0);
+        if ( !ctx->arch.amd.root_table )
             return -ENOMEM;
     }
 
@@ -368,7 +369,7 @@ int __read_mostly amd_iommu_min_paging_mode = 1;
 
 static int cf_check amd_iommu_domain_init(struct domain *d)
 {
-    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx = iommu_default_context(d);
     int pglvl = amd_iommu_get_paging_mode(
                     1UL << (domain_max_paddr_bits(d) - PAGE_SHIFT));
 
@@ -379,7 +380,7 @@ static int cf_check amd_iommu_domain_init(struct domain *d)
      * Choose the number of levels for the IOMMU page tables, taking into
      * account unity maps.
      */
-    hd->arch.amd.paging_mode = max(pglvl, amd_iommu_min_paging_mode);
+    ctx->arch.amd.paging_mode = max(pglvl, amd_iommu_min_paging_mode);
 
     return 0;
 }
@@ -455,7 +456,7 @@ static void amd_iommu_disable_domain_device(const struct domain *domain,
         AMD_IOMMU_DEBUG("Disable: device id = %#x, "
                         "domain = %d, paging mode = %d\n",
                         req_id, dte->domain_id,
-                        dom_iommu(domain)->arch.amd.paging_mode);
+                        iommu_default_context(domain)->arch.amd.paging_mode);
     }
     else
         spin_unlock_irqrestore(&iommu->lock, flags);
@@ -466,6 +467,8 @@ static int cf_check reassign_device(
     struct pci_dev *pdev)
 {
     struct amd_iommu *iommu;
+    struct iommu_context *target_ctx = iommu_default_context(target);
+    struct iommu_context *source_ctx = iommu_default_context(source);
     int rc;
 
     iommu = find_iommu_for_device(pdev->seg, pdev->sbdf.bdf);
@@ -478,7 +481,7 @@ static int cf_check reassign_device(
 
     if ( !QUARANTINE_SKIP(target, pdev) )
     {
-        rc = amd_iommu_setup_domain_device(target, iommu, devfn, pdev);
+        rc = amd_iommu_setup_domain_device(target, target_ctx, iommu, devfn, pdev);
         if ( rc )
             return rc;
     }
@@ -509,7 +512,7 @@ static int cf_check reassign_device(
         unsigned int bdf = PCI_BDF(pdev->bus, devfn);
 
         rc = amd_iommu_reserve_domain_unity_unmap(
-                 source,
+                 source, source_ctx,
                  ivrs_mappings[get_dma_requestor_id(pdev->seg, bdf)].unity_map);
         if ( rc )
             return rc;
@@ -528,7 +531,8 @@ static int cf_check amd_iommu_assign_device(
     unsigned int bdf = PCI_BDF(pdev->bus, devfn);
     int req_id = get_dma_requestor_id(pdev->seg, bdf);
     int rc = amd_iommu_reserve_domain_unity_map(
-                 d, ivrs_mappings[req_id].unity_map, flag);
+                 d, iommu_default_context(d),
+                 ivrs_mappings[req_id].unity_map, flag);
 
     if ( !rc )
         rc = reassign_device(pdev->domain, d, devfn, pdev);
@@ -536,7 +540,8 @@ static int cf_check amd_iommu_assign_device(
     if ( rc && !is_hardware_domain(d) )
     {
         int ret = amd_iommu_reserve_domain_unity_unmap(
-                      d, ivrs_mappings[req_id].unity_map);
+                      d, iommu_default_context(d),
+                      ivrs_mappings[req_id].unity_map);
 
         if ( ret )
         {
@@ -553,22 +558,25 @@ static int cf_check amd_iommu_assign_device(
 
 static void cf_check amd_iommu_clear_root_pgtable(struct domain *d)
 {
-    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx = iommu_default_context(d);
 
-    spin_lock(&hd->arch.mapping_lock);
-    hd->arch.amd.root_table = NULL;
-    spin_unlock(&hd->arch.mapping_lock);
+    spin_lock(&ctx->arch.mapping_lock);
+    ctx->arch.amd.root_table = NULL;
+    spin_unlock(&ctx->arch.mapping_lock);
 }
 
 static void cf_check amd_iommu_domain_destroy(struct domain *d)
 {
-    iommu_identity_map_teardown(d);
-    ASSERT(!dom_iommu(d)->arch.amd.root_table);
+    struct iommu_context *ctx = iommu_default_context(d);
+
+    iommu_identity_map_teardown(d, ctx);
+    ASSERT(!ctx->arch.amd.root_table);
 }
 
 static int cf_check amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
 {
     struct amd_iommu *iommu;
+    struct iommu_context *ctx;
     u16 bdf;
     struct ivrs_mappings *ivrs_mappings;
     bool fresh_domid = false;
@@ -577,6 +585,8 @@ static int cf_check amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
     if ( !pdev->domain )
         return -EINVAL;
 
+    ctx = iommu_default_context(pdev->domain);
+
     for_each_amd_iommu(iommu)
         if ( pdev->seg == iommu->seg && pdev->sbdf.bdf == iommu->bdf )
             return is_hardware_domain(pdev->domain) ? 0 : -ENODEV;
@@ -633,7 +643,7 @@ static int cf_check amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
     }
 
     if ( amd_iommu_reserve_domain_unity_map(
-             pdev->domain,
+             pdev->domain, ctx,
              ivrs_mappings[ivrs_mappings[bdf].dte_requestor_id].unity_map,
              0) )
         AMD_IOMMU_WARN("%pd: unity mapping failed for %pp\n",
@@ -647,7 +657,7 @@ static int cf_check amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
         fresh_domid = true;
     }
 
-    ret = amd_iommu_setup_domain_device(pdev->domain, iommu, devfn, pdev);
+    ret = amd_iommu_setup_domain_device(pdev->domain, ctx, iommu, devfn, pdev);
     if ( ret && fresh_domid )
     {
         iommu_free_domid(pdev->arch.pseudo_domid, iommu->domid_map);
@@ -660,12 +670,15 @@ static int cf_check amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
 static int cf_check amd_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
 {
     struct amd_iommu *iommu;
+    struct iommu_context *ctx;
     u16 bdf;
     struct ivrs_mappings *ivrs_mappings;
 
     if ( !pdev->domain )
         return -EINVAL;
 
+    ctx = iommu_default_context(pdev->domain);
+
     iommu = find_iommu_for_device(pdev->seg, pdev->sbdf.bdf);
     if ( !iommu )
     {
@@ -680,7 +693,7 @@ static int cf_check amd_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
     bdf = PCI_BDF(pdev->bus, devfn);
 
     if ( amd_iommu_reserve_domain_unity_unmap(
-             pdev->domain,
+             pdev->domain, ctx,
              ivrs_mappings[ivrs_mappings[bdf].dte_requestor_id].unity_map) )
         AMD_IOMMU_WARN("%pd: unity unmapping failed for %pp\n",
                        pdev->domain, &PCI_SBDF(pdev->seg, bdf));
@@ -755,14 +768,14 @@ static void amd_dump_page_table_level(struct page_info *pg, int level,
 
 static void cf_check amd_dump_page_tables(struct domain *d)
 {
-    const struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx = iommu_default_context(d);
 
-    if ( !hd->arch.amd.root_table )
+    if ( !ctx->arch.amd.root_table )
         return;
 
-    printk("AMD IOMMU %pd table has %u levels\n", d, hd->arch.amd.paging_mode);
-    amd_dump_page_table_level(hd->arch.amd.root_table,
-                              hd->arch.amd.paging_mode, 0, 0);
+    printk("AMD IOMMU %pd table has %u levels\n", d, ctx->arch.amd.paging_mode);
+    amd_dump_page_table_level(ctx->arch.amd.root_table,
+                              ctx->arch.amd.paging_mode, 0, 0);
 }
 
 static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 9e74a1fc72..662da49766 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -403,12 +403,15 @@ long iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
     unsigned long i;
     unsigned int order, j = 0;
     int rc = 0;
+    struct iommu_context *ctx;
 
     if ( !is_iommu_enabled(d) )
         return 0;
 
     ASSERT(!(flags & ~IOMMUF_preempt));
 
+    ctx = iommu_default_context(d);
+
     for ( i = 0; i < page_count; i += 1UL << order )
     {
         dfn_t dfn = dfn_add(dfn0, i);
@@ -468,10 +471,13 @@ int iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
                       unsigned int *flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx;
 
     if ( !is_iommu_enabled(d) || !hd->platform_ops->lookup_page )
         return -EOPNOTSUPP;
 
+    ctx = iommu_default_context(d);
+
     return iommu_call(hd->platform_ops, lookup_page, d, dfn, mfn, flags);
 }
 
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index c16583c951..3dcb77c711 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -80,8 +80,8 @@ uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node);
 void free_pgtable_maddr(u64 maddr);
 void *map_vtd_domain_page(u64 maddr);
 void unmap_vtd_domain_page(const void *va);
-int domain_context_mapping_one(struct domain *domain, struct vtd_iommu *iommu,
-                               uint8_t bus, uint8_t devfn,
+int domain_context_mapping_one(struct domain *domain, struct iommu_context *ctx,
+                               struct vtd_iommu *iommu, uint8_t bus, uint8_t devfn,
                                const struct pci_dev *pdev, domid_t domid,
                                paddr_t pgd_maddr, unsigned int mode);
 int domain_context_unmap_one(struct domain *domain, struct vtd_iommu *iommu,
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 9d7a9977a6..f60f39ee1d 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -54,7 +54,7 @@
 #define DEVICE_DOMID(d, pdev) ((d) != dom_io ? (d)->domain_id \
                                              : (pdev)->arch.pseudo_domid)
 #define DEVICE_PGTABLE(d, pdev) ((d) != dom_io \
-                                 ? dom_iommu(d)->arch.vtd.pgd_maddr \
+                                 ? iommu_default_context(d)->arch.vtd.pgd_maddr \
                                  : (pdev)->arch.vtd.pgd_maddr)
 
 bool __read_mostly iommu_igfx = true;
@@ -227,7 +227,7 @@ static void check_cleanup_domid_map(const struct domain *d,
 
     if ( !found )
     {
-        clear_bit(iommu->index, dom_iommu(d)->arch.vtd.iommu_bitmap);
+        clear_bit(iommu->index, iommu_default_context(d)->arch.vtd.iommu_bitmap);
         cleanup_domid_map(d->domain_id, iommu);
     }
 }
@@ -315,8 +315,9 @@ static u64 bus_to_context_maddr(struct vtd_iommu *iommu, u8 bus)
  *   PTE for the requested address,
  * - for target == 0 the full PTE contents below PADDR_BITS limit.
  */
-static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
-                                       unsigned int target,
+static uint64_t addr_to_dma_page_maddr(struct domain *domain,
+                                       struct iommu_context *ctx,
+                                       daddr_t addr, unsigned int target,
                                        unsigned int *flush_flags, bool alloc)
 {
     struct domain_iommu *hd = dom_iommu(domain);
@@ -326,10 +327,10 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
     u64 pte_maddr = 0;
 
     addr &= (((u64)1) << addr_width) - 1;
-    ASSERT(spin_is_locked(&hd->arch.mapping_lock));
+    ASSERT(spin_is_locked(&ctx->arch.mapping_lock));
     ASSERT(target || !alloc);
 
-    if ( !hd->arch.vtd.pgd_maddr )
+    if ( !ctx->arch.vtd.pgd_maddr )
     {
         struct page_info *pg;
 
@@ -337,13 +338,13 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
             goto out;
 
         pte_maddr = level;
-        if ( !(pg = iommu_alloc_pgtable(hd, 0)) )
+        if ( !(pg = iommu_alloc_pgtable(hd, ctx, 0)) )
             goto out;
 
-        hd->arch.vtd.pgd_maddr = page_to_maddr(pg);
+        ctx->arch.vtd.pgd_maddr = page_to_maddr(pg);
     }
 
-    pte_maddr = hd->arch.vtd.pgd_maddr;
+    pte_maddr = ctx->arch.vtd.pgd_maddr;
     parent = map_vtd_domain_page(pte_maddr);
     while ( level > target )
     {
@@ -379,7 +380,7 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
             }
 
             pte_maddr = level - 1;
-            pg = iommu_alloc_pgtable(hd, DMA_PTE_CONTIG_MASK);
+            pg = iommu_alloc_pgtable(hd, ctx, DMA_PTE_CONTIG_MASK);
             if ( !pg )
                 break;
 
@@ -431,13 +432,12 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
     return pte_maddr;
 }
 
-static paddr_t domain_pgd_maddr(struct domain *d, paddr_t pgd_maddr,
-                                unsigned int nr_pt_levels)
+static paddr_t domain_pgd_maddr(struct domain *d, struct iommu_context *ctx,
+                                paddr_t pgd_maddr, unsigned int nr_pt_levels)
 {
-    struct domain_iommu *hd = dom_iommu(d);
     unsigned int agaw;
 
-    ASSERT(spin_is_locked(&hd->arch.mapping_lock));
+    ASSERT(spin_is_locked(&ctx->arch.mapping_lock));
 
     if ( pgd_maddr )
         /* nothing */;
@@ -449,19 +449,19 @@ static paddr_t domain_pgd_maddr(struct domain *d, paddr_t pgd_maddr,
     }
     else
     {
-        if ( !hd->arch.vtd.pgd_maddr )
+        if ( !ctx->arch.vtd.pgd_maddr )
         {
             /*
              * Ensure we have pagetables allocated down to the smallest
              * level the loop below may need to run to.
              */
-            addr_to_dma_page_maddr(d, 0, min_pt_levels, NULL, true);
+            addr_to_dma_page_maddr(d, ctx, 0, min_pt_levels, NULL, true);
 
-            if ( !hd->arch.vtd.pgd_maddr )
+            if ( !ctx->arch.vtd.pgd_maddr )
                 return 0;
         }
 
-        pgd_maddr = hd->arch.vtd.pgd_maddr;
+        pgd_maddr = ctx->arch.vtd.pgd_maddr;
     }
 
     /* Skip top level(s) of page tables for less-than-maximum level DRHDs. */
@@ -734,7 +734,7 @@ static int __must_check cf_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
                                                    unsigned long page_count,
                                                    unsigned int flush_flags)
 {
-    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx = iommu_default_context(d);
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
     bool flush_dev_iotlb;
@@ -762,7 +762,7 @@ static int __must_check cf_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
 
         iommu = drhd->iommu;
 
-        if ( !test_bit(iommu->index, hd->arch.vtd.iommu_bitmap) )
+        if ( !test_bit(iommu->index, ctx->arch.vtd.iommu_bitmap) )
             continue;
 
         flush_dev_iotlb = !!find_ats_dev_drhd(iommu);
@@ -790,7 +790,8 @@ static int __must_check cf_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
     return ret;
 }
 
-static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int level)
+static void queue_free_pt(struct domain *d, struct iommu_context *ctx, mfn_t mfn,
+                          unsigned int level)
 {
     if ( level > 1 )
     {
@@ -799,13 +800,13 @@ static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int level
 
         for ( i = 0; i < PTE_NUM; ++i )
             if ( dma_pte_present(pt[i]) && !dma_pte_superpage(pt[i]) )
-                queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(pt[i])),
+                queue_free_pt(d, ctx, maddr_to_mfn(dma_pte_addr(pt[i])),
                               level - 1);
 
         unmap_domain_page(pt);
     }
 
-    iommu_queue_free_pgtable(hd, mfn_to_page(mfn));
+    iommu_queue_free_pgtable(d, ctx, mfn_to_page(mfn));
 }
 
 static int iommu_set_root_entry(struct vtd_iommu *iommu)
@@ -1435,10 +1436,11 @@ void __init iommu_free(struct acpi_drhd_unit *drhd)
 static int cf_check intel_iommu_domain_init(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx = iommu_default_context(d);
 
-    hd->arch.vtd.iommu_bitmap = xzalloc_array(unsigned long,
+    ctx->arch.vtd.iommu_bitmap = xzalloc_array(unsigned long,
                                               BITS_TO_LONGS(nr_iommus));
-    if ( !hd->arch.vtd.iommu_bitmap )
+    if ( !ctx->arch.vtd.iommu_bitmap )
         return -ENOMEM;
 
     hd->arch.vtd.agaw = width_to_agaw(DEFAULT_DOMAIN_ADDRESS_WIDTH);
@@ -1479,11 +1481,11 @@ static void __hwdom_init cf_check intel_iommu_hwdom_init(struct domain *d)
  */
 int domain_context_mapping_one(
     struct domain *domain,
+    struct iommu_context *ctx,
     struct vtd_iommu *iommu,
     uint8_t bus, uint8_t devfn, const struct pci_dev *pdev,
     domid_t domid, paddr_t pgd_maddr, unsigned int mode)
 {
-    struct domain_iommu *hd = dom_iommu(domain);
     struct context_entry *context, *context_entries, lctxt;
     __uint128_t res, old;
     uint64_t maddr;
@@ -1531,12 +1533,12 @@ int domain_context_mapping_one(
     {
         paddr_t root;
 
-        spin_lock(&hd->arch.mapping_lock);
+        spin_lock(&ctx->arch.mapping_lock);
 
-        root = domain_pgd_maddr(domain, pgd_maddr, iommu->nr_pt_levels);
+        root = domain_pgd_maddr(domain, ctx, pgd_maddr, iommu->nr_pt_levels);
         if ( !root )
         {
-            spin_unlock(&hd->arch.mapping_lock);
+            spin_unlock(&ctx->arch.mapping_lock);
             spin_unlock(&iommu->lock);
             unmap_vtd_domain_page(context_entries);
             if ( prev_dom )
@@ -1550,7 +1552,7 @@ int domain_context_mapping_one(
         else
             context_set_translation_type(lctxt, CONTEXT_TT_MULTI_LEVEL);
 
-        spin_unlock(&hd->arch.mapping_lock);
+        spin_unlock(&ctx->arch.mapping_lock);
     }
 
     rc = context_set_domain_id(&lctxt, domid, iommu);
@@ -1624,7 +1626,7 @@ int domain_context_mapping_one(
     if ( rc > 0 )
         rc = 0;
 
-    set_bit(iommu->index, hd->arch.vtd.iommu_bitmap);
+    set_bit(iommu->index, ctx->arch.vtd.iommu_bitmap);
 
     unmap_vtd_domain_page(context_entries);
 
@@ -1642,7 +1644,7 @@ int domain_context_mapping_one(
              (prev_dom == dom_io && !pdev) )
             ret = domain_context_unmap_one(domain, iommu, bus, devfn);
         else
-            ret = domain_context_mapping_one(prev_dom, iommu, bus, devfn, pdev,
+            ret = domain_context_mapping_one(prev_dom, ctx, iommu, bus, devfn, pdev,
                                              DEVICE_DOMID(prev_dom, pdev),
                                              DEVICE_PGTABLE(prev_dom, pdev),
                                              (mode & MAP_WITH_RMRR) |
@@ -1661,8 +1663,8 @@ int domain_context_mapping_one(
 static const struct acpi_drhd_unit *domain_context_unmap(
     struct domain *d, uint8_t devfn, struct pci_dev *pdev);
 
-static int domain_context_mapping(struct domain *domain, u8 devfn,
-                                  struct pci_dev *pdev)
+static int domain_context_mapping(struct domain *domain, struct iommu_context *ctx,
+                                  u8 devfn, struct pci_dev *pdev)
 {
     const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
     const struct acpi_rmrr_unit *rmrr;
@@ -1731,7 +1733,7 @@ static int domain_context_mapping(struct domain *domain, u8 devfn,
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCIe: map %pp\n",
                    domain, &PCI_SBDF(seg, bus, devfn));
-        ret = domain_context_mapping_one(domain, drhd->iommu, bus, devfn, pdev,
+        ret = domain_context_mapping_one(domain, ctx, drhd->iommu, bus, devfn, pdev,
                                          DEVICE_DOMID(domain, pdev), pgd_maddr,
                                          mode);
         if ( ret > 0 )
@@ -1757,7 +1759,7 @@ static int domain_context_mapping(struct domain *domain, u8 devfn,
             printk(VTDPREFIX "%pd:PCI: map %pp\n",
                    domain, &PCI_SBDF(seg, bus, devfn));
 
-        ret = domain_context_mapping_one(domain, drhd->iommu, bus, devfn,
+        ret = domain_context_mapping_one(domain, ctx, drhd->iommu, bus, devfn,
                                          pdev, DEVICE_DOMID(domain, pdev),
                                          pgd_maddr, mode);
         if ( ret < 0 )
@@ -1788,7 +1790,7 @@ static int domain_context_mapping(struct domain *domain, u8 devfn,
          * their owner would be the wrong one. Pass NULL instead.
          */
         if ( ret >= 0 )
-            ret = domain_context_mapping_one(domain, drhd->iommu, bus, devfn,
+            ret = domain_context_mapping_one(domain, ctx, drhd->iommu, bus, devfn,
                                              NULL, DEVICE_DOMID(domain, pdev),
                                              pgd_maddr, mode);
 
@@ -1804,7 +1806,7 @@ static int domain_context_mapping(struct domain *domain, u8 devfn,
          */
         if ( !ret && pdev_type(seg, bus, devfn) == DEV_TYPE_PCIe2PCI_BRIDGE &&
              (secbus != pdev->bus || pdev->devfn != 0) )
-            ret = domain_context_mapping_one(domain, drhd->iommu, secbus, 0,
+            ret = domain_context_mapping_one(domain, ctx, drhd->iommu, secbus, 0,
                                              NULL, DEVICE_DOMID(domain, pdev),
                                              pgd_maddr, mode);
 
@@ -1813,7 +1815,7 @@ static int domain_context_mapping(struct domain *domain, u8 devfn,
             if ( !prev_present )
                 domain_context_unmap(domain, devfn, pdev);
             else if ( pdev->domain != domain ) /* Avoid infinite recursion. */
-                domain_context_mapping(pdev->domain, devfn, pdev);
+                domain_context_mapping(pdev->domain, ctx, devfn, pdev);
         }
 
         break;
@@ -2001,44 +2003,44 @@ static const struct acpi_drhd_unit *domain_context_unmap(
 
 static void cf_check iommu_clear_root_pgtable(struct domain *d)
 {
-    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx = iommu_default_context(d);
 
-    spin_lock(&hd->arch.mapping_lock);
-    hd->arch.vtd.pgd_maddr = 0;
-    spin_unlock(&hd->arch.mapping_lock);
+    spin_lock(&ctx->arch.mapping_lock);
+    ctx->arch.vtd.pgd_maddr = 0;
+    spin_unlock(&ctx->arch.mapping_lock);
 }
 
 static void cf_check iommu_domain_teardown(struct domain *d)
 {
-    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx = iommu_default_context(d);
     const struct acpi_drhd_unit *drhd;
 
     if ( list_empty(&acpi_drhd_units) )
         return;
 
-    iommu_identity_map_teardown(d);
+    iommu_identity_map_teardown(d, ctx);
 
-    ASSERT(!hd->arch.vtd.pgd_maddr);
+    ASSERT(!ctx->arch.vtd.pgd_maddr);
 
     for_each_drhd_unit ( drhd )
         cleanup_domid_map(d->domain_id, drhd->iommu);
 
-    XFREE(hd->arch.vtd.iommu_bitmap);
+    XFREE(ctx->arch.vtd.iommu_bitmap);
 }
 
 static void quarantine_teardown(struct pci_dev *pdev,
                                 const struct acpi_drhd_unit *drhd)
 {
-    struct domain_iommu *hd = dom_iommu(dom_io);
+    struct iommu_context *ctx = iommu_default_context(dom_io);
 
     ASSERT(pcidevs_locked());
 
     if ( !pdev->arch.vtd.pgd_maddr )
         return;
 
-    ASSERT(page_list_empty(&hd->arch.pgtables.list));
-    page_list_move(&hd->arch.pgtables.list, &pdev->arch.pgtables_list);
-    while ( iommu_free_pgtables(dom_io) == -ERESTART )
+    ASSERT(page_list_empty(&ctx->arch.pgtables));
+    page_list_move(&ctx->arch.pgtables, &pdev->arch.pgtables_list);
+    while ( iommu_free_pgtables(dom_io, ctx) == -ERESTART )
         /* nothing */;
     pdev->arch.vtd.pgd_maddr = 0;
 
@@ -2051,6 +2053,7 @@ static int __must_check cf_check intel_iommu_map_page(
     unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx = iommu_default_context(d);
     struct dma_pte *page, *pte, old, new = {};
     u64 pg_maddr;
     unsigned int level = (IOMMUF_order(flags) / LEVEL_STRIDE) + 1;
@@ -2067,7 +2070,7 @@ static int __must_check cf_check intel_iommu_map_page(
     if ( iommu_hwdom_passthrough && is_hardware_domain(d) )
         return 0;
 
-    spin_lock(&hd->arch.mapping_lock);
+    spin_lock(&ctx->arch.mapping_lock);
 
     /*
      * IOMMU mapping request can be safely ignored when the domain is dying.
@@ -2077,15 +2080,15 @@ static int __must_check cf_check intel_iommu_map_page(
      */
     if ( d->is_dying )
     {
-        spin_unlock(&hd->arch.mapping_lock);
+        spin_unlock(&ctx->arch.mapping_lock);
         return 0;
     }
 
-    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), level, flush_flags,
+    pg_maddr = addr_to_dma_page_maddr(d, ctx, dfn_to_daddr(dfn), level, flush_flags,
                                       true);
     if ( pg_maddr < PAGE_SIZE )
     {
-        spin_unlock(&hd->arch.mapping_lock);
+        spin_unlock(&ctx->arch.mapping_lock);
         return -ENOMEM;
     }
 
@@ -2106,7 +2109,7 @@ static int __must_check cf_check intel_iommu_map_page(
 
     if ( !((old.val ^ new.val) & ~DMA_PTE_CONTIG_MASK) )
     {
-        spin_unlock(&hd->arch.mapping_lock);
+        spin_unlock(&ctx->arch.mapping_lock);
         unmap_vtd_domain_page(page);
         return 0;
     }
@@ -2135,7 +2138,7 @@ static int __must_check cf_check intel_iommu_map_page(
         new.val &= ~(LEVEL_MASK << level_to_offset_bits(level));
         dma_set_pte_superpage(new);
 
-        pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), ++level,
+        pg_maddr = addr_to_dma_page_maddr(d, ctx, dfn_to_daddr(dfn), ++level,
                                           flush_flags, false);
         BUG_ON(pg_maddr < PAGE_SIZE);
 
@@ -2145,11 +2148,11 @@ static int __must_check cf_check intel_iommu_map_page(
         iommu_sync_cache(pte, sizeof(*pte));
 
         *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
-        iommu_queue_free_pgtable(hd, pg);
+        iommu_queue_free_pgtable(d, ctx, pg);
         perfc_incr(iommu_pt_coalesces);
     }
 
-    spin_unlock(&hd->arch.mapping_lock);
+    spin_unlock(&ctx->arch.mapping_lock);
     unmap_vtd_domain_page(page);
 
     *flush_flags |= IOMMU_FLUSHF_added;
@@ -2158,7 +2161,7 @@ static int __must_check cf_check intel_iommu_map_page(
         *flush_flags |= IOMMU_FLUSHF_modified;
 
         if ( IOMMUF_order(flags) && !dma_pte_superpage(old) )
-            queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(old)),
+            queue_free_pt(d, ctx, maddr_to_mfn(dma_pte_addr(old)),
                           IOMMUF_order(flags) / LEVEL_STRIDE);
     }
 
@@ -2169,6 +2172,7 @@ static int __must_check cf_check intel_iommu_unmap_page(
     struct domain *d, dfn_t dfn, unsigned int order, unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx = iommu_default_context(d);
     daddr_t addr = dfn_to_daddr(dfn);
     struct dma_pte *page = NULL, *pte = NULL, old;
     uint64_t pg_maddr;
@@ -2188,12 +2192,12 @@ static int __must_check cf_check intel_iommu_unmap_page(
     if ( iommu_hwdom_passthrough && is_hardware_domain(d) )
         return 0;
 
-    spin_lock(&hd->arch.mapping_lock);
+    spin_lock(&ctx->arch.mapping_lock);
     /* get target level pte */
-    pg_maddr = addr_to_dma_page_maddr(d, addr, level, flush_flags, false);
+    pg_maddr = addr_to_dma_page_maddr(d, ctx, addr, level, flush_flags, false);
     if ( pg_maddr < PAGE_SIZE )
     {
-        spin_unlock(&hd->arch.mapping_lock);
+        spin_unlock(&ctx->arch.mapping_lock);
         return pg_maddr ? -ENOMEM : 0;
     }
 
@@ -2202,7 +2206,7 @@ static int __must_check cf_check intel_iommu_unmap_page(
 
     if ( !dma_pte_present(*pte) )
     {
-        spin_unlock(&hd->arch.mapping_lock);
+        spin_unlock(&ctx->arch.mapping_lock);
         unmap_vtd_domain_page(page);
         return 0;
     }
@@ -2220,7 +2224,7 @@ static int __must_check cf_check intel_iommu_unmap_page(
 
         unmap_vtd_domain_page(page);
 
-        pg_maddr = addr_to_dma_page_maddr(d, addr, level, flush_flags, false);
+        pg_maddr = addr_to_dma_page_maddr(d, ctx, addr, level, flush_flags, false);
         BUG_ON(pg_maddr < PAGE_SIZE);
 
         page = map_vtd_domain_page(pg_maddr);
@@ -2229,18 +2233,18 @@ static int __must_check cf_check intel_iommu_unmap_page(
         iommu_sync_cache(pte, sizeof(*pte));
 
         *flush_flags |= IOMMU_FLUSHF_all;
-        iommu_queue_free_pgtable(hd, pg);
+        iommu_queue_free_pgtable(d, ctx, pg);
         perfc_incr(iommu_pt_coalesces);
     }
 
-    spin_unlock(&hd->arch.mapping_lock);
+    spin_unlock(&ctx->arch.mapping_lock);
 
     unmap_vtd_domain_page(page);
 
     *flush_flags |= IOMMU_FLUSHF_modified;
 
     if ( order && !dma_pte_superpage(old) )
-        queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(old)),
+        queue_free_pt(d, ctx, maddr_to_mfn(dma_pte_addr(old)),
                       order / LEVEL_STRIDE);
 
     return 0;
@@ -2249,7 +2253,7 @@ static int __must_check cf_check intel_iommu_unmap_page(
 static int cf_check intel_iommu_lookup_page(
     struct domain *d, dfn_t dfn, mfn_t *mfn, unsigned int *flags)
 {
-    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx = iommu_default_context(d);
     uint64_t val;
 
     /*
@@ -2260,11 +2264,11 @@ static int cf_check intel_iommu_lookup_page(
          (iommu_hwdom_passthrough && is_hardware_domain(d)) )
         return -EOPNOTSUPP;
 
-    spin_lock(&hd->arch.mapping_lock);
+    spin_lock(&ctx->arch.mapping_lock);
 
-    val = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 0, NULL, false);
+    val = addr_to_dma_page_maddr(d, ctx, dfn_to_daddr(dfn), 0, NULL, false);
 
-    spin_unlock(&hd->arch.mapping_lock);
+    spin_unlock(&ctx->arch.mapping_lock);
 
     if ( val < PAGE_SIZE )
         return -ENOENT;
@@ -2285,7 +2289,7 @@ static bool __init vtd_ept_page_compatible(const struct vtd_iommu *iommu)
 
     /* EPT is not initialised yet, so we must check the capability in
      * the MSR explicitly rather than use cpu_has_vmx_ept_*() */
-    if ( rdmsr_safe(MSR_IA32_VMX_EPT_VPID_CAP, ept_cap) != 0 ) 
+    if ( rdmsr_safe(MSR_IA32_VMX_EPT_VPID_CAP, ept_cap) != 0 )
         return false;
 
     return (ept_has_2mb(ept_cap) && opt_hap_2mb) <=
@@ -2297,6 +2301,7 @@ static bool __init vtd_ept_page_compatible(const struct vtd_iommu *iommu)
 static int cf_check intel_iommu_add_device(u8 devfn, struct pci_dev *pdev)
 {
     struct acpi_rmrr_unit *rmrr;
+    struct iommu_context *ctx;
     u16 bdf;
     int ret, i;
 
@@ -2305,6 +2310,8 @@ static int cf_check intel_iommu_add_device(u8 devfn, struct pci_dev *pdev)
     if ( !pdev->domain )
         return -EINVAL;
 
+    ctx = iommu_default_context(pdev->domain);
+
     for_each_rmrr_device ( rmrr, bdf, i )
     {
         if ( rmrr->segment == pdev->seg && bdf == PCI_BDF(pdev->bus, devfn) )
@@ -2315,7 +2322,7 @@ static int cf_check intel_iommu_add_device(u8 devfn, struct pci_dev *pdev)
              * Since RMRRs are always reserved in the e820 map for the hardware
              * domain, there shouldn't be a conflict.
              */
-            ret = iommu_identity_mapping(pdev->domain, p2m_access_rw,
+            ret = iommu_identity_mapping(pdev->domain, ctx, p2m_access_rw,
                                          rmrr->base_address, rmrr->end_address,
                                          0);
             if ( ret )
@@ -2324,7 +2331,7 @@ static int cf_check intel_iommu_add_device(u8 devfn, struct pci_dev *pdev)
         }
     }
 
-    ret = domain_context_mapping(pdev->domain, devfn, pdev);
+    ret = domain_context_mapping(pdev->domain, ctx, devfn, pdev);
     if ( ret )
         dprintk(XENLOG_ERR VTDPREFIX, "%pd: context mapping failed\n",
                 pdev->domain);
@@ -2353,10 +2360,13 @@ static int cf_check intel_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
     struct acpi_rmrr_unit *rmrr;
     u16 bdf;
     unsigned int i;
+    struct iommu_context *ctx;
 
     if ( !pdev->domain )
         return -EINVAL;
 
+    ctx = iommu_default_context(pdev->domain);
+
     drhd = domain_context_unmap(pdev->domain, devfn, pdev);
     if ( IS_ERR(drhd) )
         return PTR_ERR(drhd);
@@ -2370,7 +2380,7 @@ static int cf_check intel_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
          * Any flag is nothing to clear these mappings but here
          * its always safe and strict to set 0.
          */
-        iommu_identity_mapping(pdev->domain, p2m_access_x, rmrr->base_address,
+        iommu_identity_mapping(pdev->domain, ctx, p2m_access_x, rmrr->base_address,
                                rmrr->end_address, 0);
     }
 
@@ -2389,7 +2399,9 @@ static int cf_check intel_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
 static int __hwdom_init cf_check setup_hwdom_device(
     u8 devfn, struct pci_dev *pdev)
 {
-    return domain_context_mapping(pdev->domain, devfn, pdev);
+    struct iommu_context *ctx = iommu_default_context(pdev->domain);
+
+    return domain_context_mapping(pdev->domain, ctx, devfn, pdev);
 }
 
 void clear_fault_bits(struct vtd_iommu *iommu)
@@ -2483,7 +2495,7 @@ static int __must_check init_vtd_hw(bool resume)
 
     /*
      * Enable queue invalidation
-     */   
+     */
     for_each_drhd_unit ( drhd )
     {
         iommu = drhd->iommu;
@@ -2504,7 +2516,7 @@ static int __must_check init_vtd_hw(bool resume)
 
     /*
      * Enable interrupt remapping
-     */  
+     */
     if ( iommu_intremap != iommu_intremap_off )
     {
         int apic;
@@ -2561,6 +2573,7 @@ static int __must_check init_vtd_hw(bool resume)
 
 static void __hwdom_init setup_hwdom_rmrr(struct domain *d)
 {
+    struct iommu_context *ctx = iommu_default_context(d);
     struct acpi_rmrr_unit *rmrr;
     u16 bdf;
     int ret, i;
@@ -2574,7 +2587,7 @@ static void __hwdom_init setup_hwdom_rmrr(struct domain *d)
          * domain, there shouldn't be a conflict. So its always safe and
          * strict to set 0.
          */
-        ret = iommu_identity_mapping(d, p2m_access_rw, rmrr->base_address,
+        ret = iommu_identity_mapping(d, ctx, p2m_access_rw, rmrr->base_address,
                                      rmrr->end_address, 0);
         if ( ret )
             dprintk(XENLOG_ERR VTDPREFIX,
@@ -2739,6 +2752,8 @@ static int cf_check reassign_device_ownership(
 
     if ( !QUARANTINE_SKIP(target, pdev->arch.vtd.pgd_maddr) )
     {
+        struct iommu_context *target_ctx = iommu_default_context(target);
+
         if ( !has_arch_pdevs(target) )
             vmx_pi_hooks_assign(target);
 
@@ -2753,7 +2768,7 @@ static int cf_check reassign_device_ownership(
             untrusted_msi = true;
 #endif
 
-        ret = domain_context_mapping(target, devfn, pdev);
+        ret = domain_context_mapping(target, target_ctx, devfn, pdev);
 
         if ( !ret && pdev->devfn == devfn &&
              !QUARANTINE_SKIP(source, pdev->arch.vtd.pgd_maddr) )
@@ -2802,6 +2817,7 @@ static int cf_check reassign_device_ownership(
     if ( !is_hardware_domain(source) )
     {
         const struct acpi_rmrr_unit *rmrr;
+        struct iommu_context *ctx = iommu_default_context(source);
         u16 bdf;
         unsigned int i;
 
@@ -2813,7 +2829,7 @@ static int cf_check reassign_device_ownership(
                  * Any RMRR flag is always ignored when remove a device,
                  * but its always safe and strict to set 0.
                  */
-                ret = iommu_identity_mapping(source, p2m_access_x,
+                ret = iommu_identity_mapping(source, ctx, p2m_access_x,
                                              rmrr->base_address,
                                              rmrr->end_address, 0);
                 if ( ret && ret != -ENOENT )
@@ -2828,6 +2844,7 @@ static int cf_check intel_iommu_assign_device(
     struct domain *d, u8 devfn, struct pci_dev *pdev, u32 flag)
 {
     struct domain *s = pdev->domain;
+    struct iommu_context *ctx = iommu_default_context(d);
     struct acpi_rmrr_unit *rmrr;
     int ret = 0, i;
     u16 bdf, seg;
@@ -2875,7 +2892,7 @@ static int cf_check intel_iommu_assign_device(
     {
         if ( rmrr->segment == seg && bdf == PCI_BDF(bus, devfn) )
         {
-            ret = iommu_identity_mapping(d, p2m_access_rw, rmrr->base_address,
+            ret = iommu_identity_mapping(d, ctx, p2m_access_rw, rmrr->base_address,
                                          rmrr->end_address, flag);
             if ( ret )
             {
@@ -2898,7 +2915,7 @@ static int cf_check intel_iommu_assign_device(
     {
         if ( rmrr->segment == seg && bdf == PCI_BDF(bus, devfn) )
         {
-            int rc = iommu_identity_mapping(d, p2m_access_x,
+            int rc = iommu_identity_mapping(d, ctx, p2m_access_x,
                                             rmrr->base_address,
                                             rmrr->end_address, 0);
 
@@ -3071,10 +3088,11 @@ static void vtd_dump_page_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
 static void cf_check vtd_dump_page_tables(struct domain *d)
 {
     const struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx = iommu_default_context(d);
 
     printk(VTDPREFIX" %pd table has %d levels\n", d,
            agaw_to_level(hd->arch.vtd.agaw));
-    vtd_dump_page_table_level(hd->arch.vtd.pgd_maddr,
+    vtd_dump_page_table_level(ctx->arch.vtd.pgd_maddr,
                               agaw_to_level(hd->arch.vtd.agaw), 0, 0);
 }
 
@@ -3082,6 +3100,7 @@ static int fill_qpt(struct dma_pte *this, unsigned int level,
                     struct page_info *pgs[6])
 {
     struct domain_iommu *hd = dom_iommu(dom_io);
+    struct iommu_context *ctx = iommu_default_context(dom_io);
     unsigned int i;
     int rc = 0;
 
@@ -3098,7 +3117,7 @@ static int fill_qpt(struct dma_pte *this, unsigned int level,
                  * page table pages, and the resulting allocations are always
                  * zeroed.
                  */
-                pgs[level] = iommu_alloc_pgtable(hd, 0);
+                pgs[level] = iommu_alloc_pgtable(hd, ctx, 0);
                 if ( !pgs[level] )
                 {
                     rc = -ENOMEM;
@@ -3132,6 +3151,7 @@ static int cf_check intel_iommu_quarantine_init(struct pci_dev *pdev,
                                                 bool scratch_page)
 {
     struct domain_iommu *hd = dom_iommu(dom_io);
+    struct iommu_context *ctx = iommu_default_context(dom_io);
     struct page_info *pg;
     unsigned int agaw = hd->arch.vtd.agaw;
     unsigned int level = agaw_to_level(agaw);
@@ -3142,8 +3162,8 @@ static int cf_check intel_iommu_quarantine_init(struct pci_dev *pdev,
     int rc;
 
     ASSERT(pcidevs_locked());
-    ASSERT(!hd->arch.vtd.pgd_maddr);
-    ASSERT(page_list_empty(&hd->arch.pgtables.list));
+    ASSERT(!ctx->arch.vtd.pgd_maddr);
+    ASSERT(page_list_empty(&ctx->arch.pgtables));
 
     if ( pdev->arch.vtd.pgd_maddr )
     {
@@ -3155,14 +3175,14 @@ static int cf_check intel_iommu_quarantine_init(struct pci_dev *pdev,
     if ( !drhd )
         return -ENODEV;
 
-    pg = iommu_alloc_pgtable(hd, 0);
+    pg = iommu_alloc_pgtable(hd, ctx, 0);
     if ( !pg )
         return -ENOMEM;
 
     rc = context_set_domain_id(NULL, pdev->arch.pseudo_domid, drhd->iommu);
 
     /* Transiently install the root into DomIO, for iommu_identity_mapping(). */
-    hd->arch.vtd.pgd_maddr = page_to_maddr(pg);
+    ctx->arch.vtd.pgd_maddr = page_to_maddr(pg);
 
     for_each_rmrr_device ( rmrr, bdf, i )
     {
@@ -3173,7 +3193,7 @@ static int cf_check intel_iommu_quarantine_init(struct pci_dev *pdev,
         {
             rmrr_found = true;
 
-            rc = iommu_identity_mapping(dom_io, p2m_access_rw,
+            rc = iommu_identity_mapping(dom_io, ctx, p2m_access_rw,
                                         rmrr->base_address, rmrr->end_address,
                                         0);
             if ( rc )
@@ -3183,8 +3203,8 @@ static int cf_check intel_iommu_quarantine_init(struct pci_dev *pdev,
         }
     }
 
-    iommu_identity_map_teardown(dom_io);
-    hd->arch.vtd.pgd_maddr = 0;
+    iommu_identity_map_teardown(dom_io, ctx);
+    ctx->arch.vtd.pgd_maddr = 0;
     pdev->arch.vtd.pgd_maddr = page_to_maddr(pg);
 
     if ( !rc && scratch_page )
@@ -3199,7 +3219,7 @@ static int cf_check intel_iommu_quarantine_init(struct pci_dev *pdev,
         pdev->arch.leaf_mfn = page_to_mfn(pgs[0]);
     }
 
-    page_list_move(&pdev->arch.pgtables_list, &hd->arch.pgtables.list);
+    page_list_move(&pdev->arch.pgtables_list, &ctx->arch.pgtables);
 
     if ( rc || (!scratch_page && !rmrr_found) )
         quarantine_teardown(pdev, drhd);
diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
index dc3dac749c..7937eb8c2b 100644
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -422,7 +422,8 @@ static int __must_check map_me_phantom_function(struct domain *domain,
 
     /* map or unmap ME phantom function */
     if ( !(mode & UNMAP_ME_PHANTOM_FUNC) )
-        rc = domain_context_mapping_one(domain, drhd->iommu, 0,
+        rc = domain_context_mapping_one(domain, iommu_default_context(domain),
+                                        drhd->iommu, 0,
                                         PCI_DEVFN(dev, 7), NULL,
                                         domid, pgd_maddr, mode);
     else
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 8b1e0596b8..4a3fe059cb 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -19,6 +19,7 @@
 #include <xen/paging.h>
 #include <xen/guest_access.h>
 #include <xen/event.h>
+#include <xen/spinlock.h>
 #include <xen/softirq.h>
 #include <xen/vm_event.h>
 #include <xsm/xsm.h>
@@ -185,26 +186,31 @@ void __hwdom_init arch_iommu_check_autotranslated_hwdom(struct domain *d)
 
 int arch_iommu_domain_init(struct domain *d)
 {
-    struct domain_iommu *hd = dom_iommu(d);
+    INIT_PAGE_LIST_HEAD(&dom_iommu(d)->arch.free_queue);
+    return 0;
+}
 
-    spin_lock_init(&hd->arch.mapping_lock);
+int arch_iommu_context_init(struct domain *d, struct iommu_context *ctx, u32 flags)
+{
+    spin_lock_init(&ctx->arch.mapping_lock);
 
-    INIT_PAGE_LIST_HEAD(&hd->arch.pgtables.list);
-    spin_lock_init(&hd->arch.pgtables.lock);
-    INIT_LIST_HEAD(&hd->arch.identity_maps);
+    INIT_PAGE_LIST_HEAD(&ctx->arch.pgtables);
+    INIT_LIST_HEAD(&ctx->arch.identity_maps);
+
+    return 0;
+}
+
+int arch_iommu_context_teardown(struct domain *d, struct iommu_context *ctx, u32 flags)
+{
+    /* Cleanup all page tables */
+    while ( iommu_free_pgtables(d, ctx) == -ERESTART )
+        /* nothing */;
 
     return 0;
 }
 
 void arch_iommu_domain_destroy(struct domain *d)
 {
-    /*
-     * There should be not page-tables left allocated by the time the
-     * domain is destroyed. Note that arch_iommu_domain_destroy() is
-     * called unconditionally, so pgtables may be uninitialized.
-     */
-    ASSERT(!dom_iommu(d)->platform_ops ||
-           page_list_empty(&dom_iommu(d)->arch.pgtables.list));
 }
 
 struct identity_map {
@@ -214,14 +220,13 @@ struct identity_map {
     unsigned int count;
 };
 
-int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
-                           paddr_t base, paddr_t end,
+int iommu_identity_mapping(struct domain *d, struct iommu_context *ctx,
+                           p2m_access_t p2ma, paddr_t base, paddr_t end,
                            unsigned int flag)
 {
     unsigned long base_pfn = base >> PAGE_SHIFT_4K;
     unsigned long end_pfn = PAGE_ALIGN_4K(end) >> PAGE_SHIFT_4K;
     struct identity_map *map;
-    struct domain_iommu *hd = dom_iommu(d);
 
     ASSERT(pcidevs_locked());
     ASSERT(base < end);
@@ -230,7 +235,7 @@ int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
      * No need to acquire hd->arch.mapping_lock: Both insertion and removal
      * get done while holding pcidevs_lock.
      */
-    list_for_each_entry( map, &hd->arch.identity_maps, list )
+    list_for_each_entry( map, &ctx->arch.identity_maps, list )
     {
         if ( map->base == base && map->end == end )
         {
@@ -280,7 +285,7 @@ int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
      * Insert into list ahead of mapping, so the range can be found when
      * trying to clean up.
      */
-    list_add_tail(&map->list, &hd->arch.identity_maps);
+    list_add_tail(&map->list, &ctx->arch.identity_maps);
 
     for ( ; base_pfn < end_pfn; ++base_pfn )
     {
@@ -300,12 +305,11 @@ int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
     return 0;
 }
 
-void iommu_identity_map_teardown(struct domain *d)
+void iommu_identity_map_teardown(struct domain *d, struct iommu_context *ctx)
 {
-    struct domain_iommu *hd = dom_iommu(d);
     struct identity_map *map, *tmp;
 
-    list_for_each_entry_safe ( map, tmp, &hd->arch.identity_maps, list )
+    list_for_each_entry_safe ( map, tmp, &ctx->arch.identity_maps, list )
     {
         list_del(&map->list);
         xfree(map);
@@ -603,7 +607,7 @@ void iommu_free_domid(domid_t domid, unsigned long *map)
         BUG();
 }
 
-int iommu_free_pgtables(struct domain *d)
+int iommu_free_pgtables(struct domain *d, struct iommu_context *ctx)
 {
     struct domain_iommu *hd = dom_iommu(d);
     struct page_info *pg;
@@ -613,7 +617,7 @@ int iommu_free_pgtables(struct domain *d)
         return 0;
 
     /* After this barrier, no new IOMMU mappings can be inserted. */
-    spin_barrier(&hd->arch.mapping_lock);
+    spin_barrier(&ctx->arch.mapping_lock);
 
     /*
      * Pages will be moved to the free list below. So we want to
@@ -621,7 +625,7 @@ int iommu_free_pgtables(struct domain *d)
      */
     iommu_vcall(hd->platform_ops, clear_root_pgtable, d);
 
-    while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
+    while ( (pg = page_list_remove_head(&ctx->arch.pgtables)) )
     {
         free_domheap_page(pg);
 
@@ -633,6 +637,7 @@ int iommu_free_pgtables(struct domain *d)
 }
 
 struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
+                                      struct iommu_context *ctx,
                                       uint64_t contig_mask)
 {
     unsigned int memflags = 0;
@@ -677,9 +682,7 @@ struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
 
     unmap_domain_page(p);
 
-    spin_lock(&hd->arch.pgtables.lock);
-    page_list_add(pg, &hd->arch.pgtables.list);
-    spin_unlock(&hd->arch.pgtables.lock);
+    page_list_add(pg, &ctx->arch.pgtables);
 
     return pg;
 }
@@ -718,13 +721,12 @@ static void cf_check free_queued_pgtables(void *arg)
     }
 }
 
-void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg)
+void iommu_queue_free_pgtable(struct domain *d, struct iommu_context *ctx,
+                              struct page_info *pg)
 {
     unsigned int cpu = smp_processor_id();
 
-    spin_lock(&hd->arch.pgtables.lock);
-    page_list_del(pg, &hd->arch.pgtables.list);
-    spin_unlock(&hd->arch.pgtables.lock);
+    page_list_del(pg, &ctx->arch.pgtables);
 
     page_list_add_tail(pg, &per_cpu(free_pgt_list, cpu));
 
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index b928c67e19..11d23cdafb 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -343,9 +343,18 @@ extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
 # define iommu_vcall iommu_call
 #endif
 
+struct iommu_context {
+    #ifdef CONFIG_HAS_PASSTHROUGH
+    u16 id; /* Context id (0 means default context) */
+
+    struct arch_iommu_context arch;
+    #endif
+};
+
 struct domain_iommu {
 #ifdef CONFIG_HAS_PASSTHROUGH
     struct arch_iommu arch;
+    struct iommu_context default_ctx;
 #endif
 
     /* iommu_ops */
@@ -380,6 +389,7 @@ struct domain_iommu {
 #define dom_iommu(d)              (&(d)->iommu)
 #define iommu_set_feature(d, f)   set_bit(f, dom_iommu(d)->features)
 #define iommu_clear_feature(d, f) clear_bit(f, dom_iommu(d)->features)
+#define iommu_default_context(d) (&dom_iommu(d)->default_ctx) /* does not lock ! */
 
 /* Are we using the domain P2M table as its IOMMU pagetable? */
 #define iommu_use_hap_pt(d)       (IS_ENABLED(CONFIG_HVM) && \
-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

