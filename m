Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA649BB7C6
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 15:29:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830031.1244983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7y4b-0007c0-Rd; Mon, 04 Nov 2024 14:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830031.1244983; Mon, 04 Nov 2024 14:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7y4b-0007Yc-Mo; Mon, 04 Nov 2024 14:28:53 +0000
Received: by outflank-mailman (input) for mailman id 830031;
 Mon, 04 Nov 2024 14:28:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhFb=R7=bounce.vates.tech=bounce-md_30504962.6728da18.v1-a5238e467f4843fe9cd9f855abfe221b@srs-se1.protection.inumbo.net>)
 id 1t7y4Z-0006XR-7M
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 14:28:51 +0000
Received: from mail128-130.atl41.mandrillapp.com
 (mail128-130.atl41.mandrillapp.com [198.2.128.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 191ed1cb-9ab9-11ef-a0c5-8be0dac302b0;
 Mon, 04 Nov 2024 15:28:46 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-130.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4Xhv3D1YTRzS62J2K
 for <xen-devel@lists.xenproject.org>; Mon,  4 Nov 2024 14:28:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a5238e467f4843fe9cd9f855abfe221b; Mon, 04 Nov 2024 14:28:40 +0000
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
X-Inumbo-ID: 191ed1cb-9ab9-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEyOC4xMzAiLCJoZWxvIjoibWFpbDEyOC0xMzAuYXRsNDEubWFuZHJpbGxhcHAuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE5MWVkMWNiLTlhYjktMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNzMwNTI2LjU1Mzk5LCJzZW5kZXIiOiJib3VuY2UtbWRfMzA1MDQ5NjIuNjcyOGRhMTgudjEtYTUyMzhlNDY3ZjQ4NDNmZTljZDlmODU1YWJmZTIyMWJAYm91bmNlLnZhdGVzLnRlY2giLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1730730520; x=1730991020;
	bh=FUjt+mT8Pwu/BVxhEtSMdShv/mmeEmV9wgs/qrMzUx0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GBvMmcMvMWUz2cI0Z7qpJa/QSK/TPXOWVg0tvANDDbJGK2+0FYcq8FWk50sGpRN7R
	 60HRKjKSVyDCNaXhyKIzxtbXeAitqNu6+McE74QBxLnMb7rzr8w8uQkJRkQawJyweD
	 MRW16R7fY9cAJCz4wwCIMNH6IeDCTGeUL19HAk+XFWuNFyKRQcuRcTDyQ/u/kjroEF
	 A8ofXI8sIz5CAPKaAmSfY2KPXFxAgz5NAe1GfduvNMu+1OuFmUt8A6+n2Ixp/AgXKw
	 9WnATzIqqKIf//mIF5+jItTcPo5ow3ljmbsvKn9pShLuKwMsCc+aJ8Biu9rIynnuO2
	 CC3GvKu46osbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1730730520; x=1730991020; i=teddy.astie@vates.tech;
	bh=FUjt+mT8Pwu/BVxhEtSMdShv/mmeEmV9wgs/qrMzUx0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SOpXY68ZQWeqzI7XgbzbOvAJMnLuZr/jgEB679UfcUJR+BxMKNfsD++azN7HF2RhX
	 C5d2Pf27NXE+PY/5eHggi784KtF+8igepCjx2j/90Y4W17aTXrWv6kWSTyleNiKwUH
	 D0z/mrRDA4WuRH+jv7rqKDm9YtUgib771dePVA02IXi1uAMlje2AnH/Y+xySDI3wKm
	 Y8k7xGJuDLW3ktzGf4BRY1RJL+Mq/vFJF/oFAtfL/x2bIJpSUic9H7Zt0lTTuK+3sv
	 8AQ96Ov973rnIt/gXFTg75Ggpxdcord6jyJzUFWIjqlVwtYNkPDuogRGVNY5OwGp6D
	 ehqzUDVk8b0Xg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20RFC=20PATCH=20v4=204/5]=20VT-d:=20Port=20IOMMU=20driver=20to=20new=20subsystem?=
X-Mailer: git-send-email 2.45.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1730730518275
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Message-Id: <05a4114976be6f72fbaba653d10fe705bb86f8f4.1730718102.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1730718102.git.teddy.astie@vates.tech>
References: <cover.1730718102.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a5238e467f4843fe9cd9f855abfe221b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241104:md
Date: Mon, 04 Nov 2024 14:28:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Port the driver with guidances specified in iommu-contexts.md.

Add a arena-based allocator for allocating a fixed chunk of memory and
split it into 4k pages for use by the IOMMU contexts. This chunk size
is configurable with X86_ARENA_ORDER and dom0-iommu=arena-order=N.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
Changed in V2:
* cleanup some unneeded includes
* s/dettach/detach/
* don't dump IOMMU context of non-iommu domains (fix crash with DomUs)

Changed in v4:
* add "no-dma" support
* use new locking logic
---
 xen/arch/x86/include/asm/arena.h     |   54 +
 xen/arch/x86/include/asm/iommu.h     |   58 +-
 xen/arch/x86/include/asm/pci.h       |   17 -
 xen/drivers/passthrough/vtd/Makefile |    2 +-
 xen/drivers/passthrough/vtd/extern.h |   14 +-
 xen/drivers/passthrough/vtd/iommu.c  | 1478 +++++++++-----------------
 xen/drivers/passthrough/vtd/quirks.c |   20 +-
 xen/drivers/passthrough/x86/Makefile |    1 +
 xen/drivers/passthrough/x86/arena.c  |  157 +++
 xen/drivers/passthrough/x86/iommu.c  |  270 +++--
 10 files changed, 984 insertions(+), 1087 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/arena.h
 create mode 100644 xen/drivers/passthrough/x86/arena.c

diff --git a/xen/arch/x86/include/asm/arena.h b/xen/arch/x86/include/asm/arena.h
new file mode 100644
index 0000000000..7555b100e0
--- /dev/null
+++ b/xen/arch/x86/include/asm/arena.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/**
+ * Simple arena-based page allocator.
+ */
+
+#ifndef __XEN_IOMMU_ARENA_H__
+#define __XEN_IOMMU_ARENA_H__
+
+#include "xen/domain.h"
+#include "xen/atomic.h"
+#include "xen/mm-frame.h"
+#include "xen/types.h"
+
+/**
+ * struct page_arena: Page arena structure
+ */
+struct iommu_arena {
+    /* mfn of the first page of the memory region */
+    mfn_t region_start;
+    /* bitmap of allocations */
+    unsigned long *map;
+
+    /* Order of the arena */
+    unsigned int order;
+
+    /* Used page count */
+    atomic_t used_pages;
+};
+
+/**
+ * Initialize a arena using domheap allocator.
+ * @param [out] arena Arena to allocate
+ * @param [in] domain domain that has ownership of arena pages
+ * @param [in] order order of the arena (power of two of the size)
+ * @param [in] memflags Flags for domheap_alloc_pages()
+ * @return -ENOMEM on arena allocation error, 0 otherwise
+ */
+int iommu_arena_initialize(struct iommu_arena *arena, struct domain *domain,
+                           unsigned int order, unsigned int memflags);
+
+/**
+ * Teardown a arena.
+ * @param [out] arena arena to allocate
+ * @param [in] check check for existing allocations
+ * @return -EBUSY if check is specified
+ */
+int iommu_arena_teardown(struct iommu_arena *arena, bool check);
+
+struct page_info *iommu_arena_allocate_page(struct iommu_arena *arena);
+bool iommu_arena_free_page(struct iommu_arena *arena, struct page_info *page);
+
+#define iommu_arena_size(arena) (1LLU << (arena)->order)
+
+#endif
diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index 8dc464fbd3..533bb8d777 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -2,14 +2,18 @@
 #ifndef __ARCH_X86_IOMMU_H__
 #define __ARCH_X86_IOMMU_H__
 
+#include <xen/bitmap.h>
 #include <xen/errno.h>
 #include <xen/list.h>
 #include <xen/mem_access.h>
 #include <xen/spinlock.h>
+#include <xen/stdbool.h>
 #include <asm/apicdef.h>
 #include <asm/cache.h>
 #include <asm/processor.h>
 
+#include "arena.h"
+
 #define DEFAULT_DOMAIN_ADDRESS_WIDTH 48
 
 struct g2m_ioport {
@@ -31,27 +35,45 @@ typedef uint64_t daddr_t;
 #define dfn_to_daddr(dfn) __dfn_to_daddr(dfn_x(dfn))
 #define daddr_to_dfn(daddr) _dfn(__daddr_to_dfn(daddr))
 
-struct arch_iommu
+struct arch_iommu_context
 {
-    spinlock_t mapping_lock; /* io page table lock */
-    struct {
-        struct page_list_head list;
-        spinlock_t lock;
-    } pgtables;
-
+    struct page_list_head pgtables;
     struct list_head identity_maps;
 
+    /* Queue for freeing pages */
+    struct page_list_head free_queue;
+
+    /* Is this context reusing domain P2M ? */
+    bool hap_context;
+
     union {
         /* Intel VT-d */
         struct {
             uint64_t pgd_maddr; /* io page directory machine address */
+            domid_t *didmap; /* per-iommu DID */
+            unsigned long *iommu_bitmap; /* bitmap of iommu(s) that the context uses */
+            uint32_t superpage_progress; /* superpage progress during teardown */
+        } vtd;
+        /* AMD IOMMU */
+        struct {
+            struct page_info *root_table;
+        } amd;
+    };
+};
+
+struct arch_iommu
+{
+    struct iommu_arena pt_arena; /* allocator for non-default contexts */
+
+    union {
+        /* Intel VT-d */
+        struct {
             unsigned int agaw; /* adjusted guest address width, 0 is level 2 30-bit */
-            unsigned long *iommu_bitmap; /* bitmap of iommu(s) that the domain uses */
         } vtd;
         /* AMD IOMMU */
         struct {
             unsigned int paging_mode;
-            struct page_info *root_table;
+            struct guest_iommu *g_iommu;
         } amd;
     };
 };
@@ -109,10 +131,13 @@ static inline void iommu_disable_x2apic(void)
         iommu_vcall(&iommu_ops, disable_x2apic);
 }
 
-int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
-                           paddr_t base, paddr_t end,
+int iommu_identity_mapping(struct domain *d, struct iommu_context *ctx,
+                           p2m_access_t p2ma, paddr_t base, paddr_t end,
                            unsigned int flag);
-void iommu_identity_map_teardown(struct domain *d);
+void iommu_identity_map_teardown(struct domain *d, struct iommu_context *ctx);
+bool iommu_identity_map_check(struct domain *d, struct iommu_context *ctx,
+                              mfn_t mfn);
+
 
 extern bool untrusted_msi;
 
@@ -128,14 +153,19 @@ unsigned long *iommu_init_domid(domid_t reserve);
 domid_t iommu_alloc_domid(unsigned long *map);
 void iommu_free_domid(domid_t domid, unsigned long *map);
 
-int __must_check iommu_free_pgtables(struct domain *d);
+struct iommu_context;
+int __must_check iommu_free_pgtables(struct domain *d, struct iommu_context *ctx);
 struct domain_iommu;
 struct page_info *__must_check iommu_alloc_pgtable(struct domain_iommu *hd,
+                                                   struct iommu_context *ctx,
                                                    uint64_t contig_mask);
-void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg);
+void iommu_queue_free_pgtable(struct iommu_context *ctx, struct page_info *pg);
 
 /* Check [start, end] unity map range for correctness. */
 bool iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end);
+int arch_iommu_context_init(struct domain *d, struct iommu_context *ctx, u32 flags);
+int arch_iommu_context_teardown(struct domain *d, struct iommu_context *ctx, u32 flags);
+int arch_iommu_flush_free_queue(struct domain *d, struct iommu_context *ctx);
 
 #endif /* !__ARCH_X86_IOMMU_H__ */
 /*
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index fd5480d67d..214c1a0948 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -15,23 +15,6 @@
 
 struct arch_pci_dev {
     vmask_t used_vectors;
-    /*
-     * These fields are (de)initialized under pcidevs-lock. Other uses of
-     * them don't race (de)initialization and hence don't strictly need any
-     * locking.
-     */
-    union {
-        /* Subset of struct arch_iommu's fields, to be used in dom_io. */
-        struct {
-            uint64_t pgd_maddr;
-        } vtd;
-        struct {
-            struct page_info *root_table;
-        } amd;
-    };
-    domid_t pseudo_domid;
-    mfn_t leaf_mfn;
-    struct page_list_head pgtables_list;
 };
 
 int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
diff --git a/xen/drivers/passthrough/vtd/Makefile b/xen/drivers/passthrough/vtd/Makefile
index fde7555fac..81e1f46179 100644
--- a/xen/drivers/passthrough/vtd/Makefile
+++ b/xen/drivers/passthrough/vtd/Makefile
@@ -5,4 +5,4 @@ obj-y += dmar.o
 obj-y += utils.o
 obj-y += qinval.o
 obj-y += intremap.o
-obj-y += quirks.o
+obj-y += quirks.o
\ No newline at end of file
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index 667590ee52..0201ed9dc5 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -80,12 +80,10 @@ uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node);
 void free_pgtable_maddr(u64 maddr);
 void *map_vtd_domain_page(u64 maddr);
 void unmap_vtd_domain_page(const void *va);
-int domain_context_mapping_one(struct domain *domain, struct vtd_iommu *iommu,
-                               uint8_t bus, uint8_t devfn,
-                               const struct pci_dev *pdev, domid_t domid,
-                               paddr_t pgd_maddr, unsigned int mode);
-int domain_context_unmap_one(struct domain *domain, struct vtd_iommu *iommu,
-                             uint8_t bus, uint8_t devfn);
+int apply_context_single(struct domain *domain, struct iommu_context *ctx,
+                         struct vtd_iommu *iommu, uint8_t bus, uint8_t devfn);
+int unapply_context_single(struct domain *domain, struct vtd_iommu *iommu,
+                           uint8_t bus, uint8_t devfn);
 int cf_check intel_iommu_get_reserved_device_memory(
     iommu_grdm_t *func, void *ctxt);
 
@@ -106,8 +104,8 @@ void platform_quirks_init(void);
 void vtd_ops_preamble_quirk(struct vtd_iommu *iommu);
 void vtd_ops_postamble_quirk(struct vtd_iommu *iommu);
 int __must_check me_wifi_quirk(struct domain *domain, uint8_t bus,
-                               uint8_t devfn, domid_t domid, paddr_t pgd_maddr,
-                               unsigned int mode);
+                               uint8_t devfn, domid_t domid,
+                               unsigned int mode, struct iommu_context *ctx);
 void pci_vtd_quirk(const struct pci_dev *);
 void quirk_iommu_caps(struct vtd_iommu *iommu);
 
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index e13be244c1..5619d323ae 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -20,6 +20,7 @@
 
 #include <xen/irq.h>
 #include <xen/sched.h>
+#include <xen/mem_access.h>
 #include <xen/xmalloc.h>
 #include <xen/domain_page.h>
 #include <xen/err.h>
@@ -30,12 +31,20 @@
 #include <xen/time.h>
 #include <xen/pci.h>
 #include <xen/pci_regs.h>
+#include <xen/sched.h>
+#include <xen/event.h>
 #include <xen/keyhandler.h>
+#include <xen/list.h>
+#include <xen/spinlock.h>
+#include <xen/iommu.h>
+#include <xen/lib.h>
 #include <asm/msi.h>
-#include <asm/nops.h>
 #include <asm/irq.h>
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/p2m.h>
+#include <asm/bitops.h>
+#include <asm/iommu.h>
+#include <asm/page.h>
 #include <mach_apic.h>
 #include "iommu.h"
 #include "dmar.h"
@@ -46,14 +55,6 @@
 #define CONTIG_MASK DMA_PTE_CONTIG_MASK
 #include <asm/pt-contig-markers.h>
 
-/* dom_io is used as a sentinel for quarantined devices */
-#define QUARANTINE_SKIP(d, pgd_maddr) ((d) == dom_io && !(pgd_maddr))
-#define DEVICE_DOMID(d, pdev) ((d) != dom_io ? (d)->domain_id \
-                                             : (pdev)->arch.pseudo_domid)
-#define DEVICE_PGTABLE(d, pdev) ((d) != dom_io \
-                                 ? dom_iommu(d)->arch.vtd.pgd_maddr \
-                                 : (pdev)->arch.vtd.pgd_maddr)
-
 bool __read_mostly iommu_igfx = true;
 bool __read_mostly iommu_qinval = true;
 #ifndef iommu_snoop
@@ -66,7 +67,6 @@ static unsigned int __ro_after_init min_pt_levels = UINT_MAX;
 static struct tasklet vtd_fault_tasklet;
 
 static int cf_check setup_hwdom_device(u8 devfn, struct pci_dev *);
-static void setup_hwdom_rmrr(struct domain *d);
 
 static bool domid_mapping(const struct vtd_iommu *iommu)
 {
@@ -206,26 +206,14 @@ static bool any_pdev_behind_iommu(const struct domain *d,
  * clear iommu in iommu_bitmap and clear domain_id in domid_bitmap.
  */
 static void check_cleanup_domid_map(const struct domain *d,
+                                    const struct iommu_context *ctx,
                                     const struct pci_dev *exclude,
                                     struct vtd_iommu *iommu)
 {
-    bool found;
-
-    if ( d == dom_io )
-        return;
-
-    found = any_pdev_behind_iommu(d, exclude, iommu);
-    /*
-     * Hidden devices are associated with DomXEN but usable by the hardware
-     * domain. Hence they need considering here as well.
-     */
-    if ( !found && is_hardware_domain(d) )
-        found = any_pdev_behind_iommu(dom_xen, exclude, iommu);
-
-    if ( !found )
+    if ( !any_pdev_behind_iommu(d, exclude, iommu) )
     {
-        clear_bit(iommu->index, dom_iommu(d)->arch.vtd.iommu_bitmap);
-        cleanup_domid_map(d->domain_id, iommu);
+        clear_bit(iommu->index, ctx->arch.vtd.iommu_bitmap);
+        cleanup_domid_map(ctx->arch.vtd.didmap[iommu->index], iommu);
     }
 }
 
@@ -312,8 +300,9 @@ static u64 bus_to_context_maddr(struct vtd_iommu *iommu, u8 bus)
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
@@ -323,10 +312,9 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
     u64 pte_maddr = 0;
 
     addr &= (((u64)1) << addr_width) - 1;
-    ASSERT(spin_is_locked(&hd->arch.mapping_lock));
     ASSERT(target || !alloc);
 
-    if ( !hd->arch.vtd.pgd_maddr )
+    if ( !ctx->arch.vtd.pgd_maddr )
     {
         struct page_info *pg;
 
@@ -334,13 +322,13 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
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
@@ -376,7 +364,7 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
             }
 
             pte_maddr = level - 1;
-            pg = iommu_alloc_pgtable(hd, DMA_PTE_CONTIG_MASK);
+            pg = iommu_alloc_pgtable(hd, ctx, DMA_PTE_CONTIG_MASK);
             if ( !pg )
                 break;
 
@@ -428,38 +416,25 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
     return pte_maddr;
 }
 
-static paddr_t domain_pgd_maddr(struct domain *d, paddr_t pgd_maddr,
-                                unsigned int nr_pt_levels)
+static paddr_t get_context_pgd(struct domain *d, struct iommu_context *ctx,
+                               unsigned int nr_pt_levels)
 {
-    struct domain_iommu *hd = dom_iommu(d);
     unsigned int agaw;
+    paddr_t pgd_maddr = ctx->arch.vtd.pgd_maddr;
 
-    ASSERT(spin_is_locked(&hd->arch.mapping_lock));
-
-    if ( pgd_maddr )
-        /* nothing */;
-    else if ( iommu_use_hap_pt(d) )
+    if ( !ctx->arch.vtd.pgd_maddr )
     {
-        pagetable_t pgt = p2m_get_pagetable(p2m_get_hostp2m(d));
+        /*
+         * Ensure we have pagetables allocated down to the smallest
+         * level the loop below may need to run to.
+         */
+        addr_to_dma_page_maddr(d, ctx, 0, min_pt_levels, NULL, true);
 
-        pgd_maddr = pagetable_get_paddr(pgt);
+        if ( !ctx->arch.vtd.pgd_maddr )
+            return 0;
     }
-    else
-    {
-        if ( !hd->arch.vtd.pgd_maddr )
-        {
-            /*
-             * Ensure we have pagetables allocated down to the smallest
-             * level the loop below may need to run to.
-             */
-            addr_to_dma_page_maddr(d, 0, min_pt_levels, NULL, true);
-
-            if ( !hd->arch.vtd.pgd_maddr )
-                return 0;
-        }
 
-        pgd_maddr = hd->arch.vtd.pgd_maddr;
-    }
+    pgd_maddr = ctx->arch.vtd.pgd_maddr;
 
     /* Skip top level(s) of page tables for less-than-maximum level DRHDs. */
     for ( agaw = level_to_agaw(4);
@@ -727,28 +702,18 @@ static int __must_check iommu_flush_all(void)
     return rc;
 }
 
-static int __must_check cf_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
+static int __must_check cf_check iommu_flush_iotlb(struct domain *d,
+                                                   struct iommu_context *ctx,
+                                                   dfn_t dfn,
                                                    unsigned long page_count,
                                                    unsigned int flush_flags)
 {
-    struct domain_iommu *hd = dom_iommu(d);
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
     bool flush_dev_iotlb;
     int iommu_domid;
     int ret = 0;
 
-    if ( flush_flags & IOMMU_FLUSHF_all )
-    {
-        dfn = INVALID_DFN;
-        page_count = 0;
-    }
-    else
-    {
-        ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
-        ASSERT(flush_flags);
-    }
-
     /*
      * No need pcideves_lock here because we have flush
      * when assign/deassign device
@@ -759,13 +724,20 @@ static int __must_check cf_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
 
         iommu = drhd->iommu;
 
-        if ( !test_bit(iommu->index, hd->arch.vtd.iommu_bitmap) )
-            continue;
+        if ( ctx )
+        {
+            if ( !test_bit(iommu->index, ctx->arch.vtd.iommu_bitmap) )
+                continue;
+
+            iommu_domid = get_iommu_did(ctx->arch.vtd.didmap[iommu->index], iommu, true);
+
+            if ( iommu_domid == -1 )
+                continue;
+        }
+        else
+            iommu_domid = 0;
 
         flush_dev_iotlb = !!find_ats_dev_drhd(iommu);
-        iommu_domid = get_iommu_did(d->domain_id, iommu, !d->is_dying);
-        if ( iommu_domid == -1 )
-            continue;
 
         if ( !page_count || (page_count & (page_count - 1)) ||
              dfn_eq(dfn, INVALID_DFN) || !IS_ALIGNED(dfn_x(dfn), page_count) )
@@ -784,10 +756,13 @@ static int __must_check cf_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
             ret = rc;
     }
 
+    if ( !ret && ctx )
+        arch_iommu_flush_free_queue(d, ctx);
+
     return ret;
 }
 
-static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int level)
+static void queue_free_pt(struct iommu_context *ctx, mfn_t mfn, unsigned int level)
 {
     if ( level > 1 )
     {
@@ -796,13 +771,13 @@ static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int level
 
         for ( i = 0; i < PTE_NUM; ++i )
             if ( dma_pte_present(pt[i]) && !dma_pte_superpage(pt[i]) )
-                queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(pt[i])),
+                queue_free_pt(ctx, maddr_to_mfn(dma_pte_addr(pt[i])),
                               level - 1);
 
         unmap_domain_page(pt);
     }
 
-    iommu_queue_free_pgtable(hd, mfn_to_page(mfn));
+    iommu_queue_free_pgtable(ctx, mfn_to_page(mfn));
 }
 
 static int iommu_set_root_entry(struct vtd_iommu *iommu)
@@ -1433,11 +1408,6 @@ static int cf_check intel_iommu_domain_init(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
 
-    hd->arch.vtd.iommu_bitmap = xzalloc_array(unsigned long,
-                                              BITS_TO_LONGS(nr_iommus));
-    if ( !hd->arch.vtd.iommu_bitmap )
-        return -ENOMEM;
-
     hd->arch.vtd.agaw = width_to_agaw(DEFAULT_DOMAIN_ADDRESS_WIDTH);
 
     return 0;
@@ -1448,7 +1418,7 @@ static void __hwdom_init cf_check intel_iommu_hwdom_init(struct domain *d)
     struct acpi_drhd_unit *drhd;
 
     setup_hwdom_pci_devices(d, setup_hwdom_device);
-    setup_hwdom_rmrr(d);
+
     /* Make sure workarounds are applied before enabling the IOMMU(s). */
     arch_iommu_hwdom_init(d);
 
@@ -1465,32 +1435,22 @@ static void __hwdom_init cf_check intel_iommu_hwdom_init(struct domain *d)
     }
 }
 
-/*
- * This function returns
- * - a negative errno value upon error,
- * - zero upon success when previously the entry was non-present, or this isn't
- *   the "main" request for a device (pdev == NULL), or for no-op quarantining
- *   assignments,
- * - positive (one) upon success when previously the entry was present and this
- *   is the "main" request for a device (pdev != NULL).
+/**
+ * Apply a context on a device.
+ * @param domain Domain of the context
+ * @param iommu IOMMU hardware to use (must match device iommu)
+ * @param ctx IOMMU context to apply
+ * @param devfn PCI device function (may be different to pdev)
  */
-int domain_context_mapping_one(
-    struct domain *domain,
-    struct vtd_iommu *iommu,
-    uint8_t bus, uint8_t devfn, const struct pci_dev *pdev,
-    domid_t domid, paddr_t pgd_maddr, unsigned int mode)
+int apply_context_single(struct domain *domain, struct iommu_context *ctx,
+                         struct vtd_iommu *iommu, uint8_t bus, uint8_t devfn)
 {
-    struct domain_iommu *hd = dom_iommu(domain);
     struct context_entry *context, *context_entries, lctxt;
-    __uint128_t old;
+    __uint128_t res, old;
     uint64_t maddr;
-    uint16_t seg = iommu->drhd->segment, prev_did = 0;
-    struct domain *prev_dom = NULL;
+    uint16_t seg = iommu->drhd->segment, prev_did = 0, did;
     int rc, ret;
-    bool flush_dev_iotlb;
-
-    if ( QUARANTINE_SKIP(domain, pgd_maddr) )
-        return 0;
+    bool flush_dev_iotlb, overwrite_entry = false;
 
     ASSERT(pcidevs_locked());
     spin_lock(&iommu->lock);
@@ -1499,28 +1459,15 @@ int domain_context_mapping_one(
     context = &context_entries[devfn];
     old = (lctxt = *context).full;
 
-    if ( context_present(lctxt) )
-    {
-        domid_t domid;
+    did = ctx->arch.vtd.didmap[iommu->index];
 
+    if ( context_present(*context) )
+    {
         prev_did = context_domain_id(lctxt);
-        domid = did_to_domain_id(iommu, prev_did);
-        if ( domid < DOMID_FIRST_RESERVED )
-            prev_dom = rcu_lock_domain_by_id(domid);
-        else if ( pdev ? domid == pdev->arch.pseudo_domid : domid > DOMID_MASK )
-            prev_dom = rcu_lock_domain(dom_io);
-        if ( !prev_dom )
-        {
-            spin_unlock(&iommu->lock);
-            unmap_vtd_domain_page(context_entries);
-            dprintk(XENLOG_DEBUG VTDPREFIX,
-                    "no domain for did %u (nr_dom %u)\n",
-                    prev_did, cap_ndoms(iommu->cap));
-            return -ESRCH;
-        }
+        overwrite_entry = true;
     }
 
-    if ( iommu_hwdom_passthrough && is_hardware_domain(domain) )
+    if ( iommu_hwdom_passthrough && is_hardware_domain(domain) && !ctx->id )
     {
         context_set_translation_type(lctxt, CONTEXT_TT_PASS_THRU);
     }
@@ -1528,16 +1475,10 @@ int domain_context_mapping_one(
     {
         paddr_t root;
 
-        spin_lock(&hd->arch.mapping_lock);
-
-        root = domain_pgd_maddr(domain, pgd_maddr, iommu->nr_pt_levels);
+        root = get_context_pgd(domain, ctx, iommu->nr_pt_levels);
         if ( !root )
         {
-            spin_unlock(&hd->arch.mapping_lock);
-            spin_unlock(&iommu->lock);
             unmap_vtd_domain_page(context_entries);
-            if ( prev_dom )
-                rcu_unlock_domain(prev_dom);
             return -ENOMEM;
         }
 
@@ -1546,98 +1487,39 @@ int domain_context_mapping_one(
             context_set_translation_type(lctxt, CONTEXT_TT_DEV_IOTLB);
         else
             context_set_translation_type(lctxt, CONTEXT_TT_MULTI_LEVEL);
-
-        spin_unlock(&hd->arch.mapping_lock);
     }
 
-    rc = context_set_domain_id(&lctxt, domid, iommu);
+    rc = context_set_domain_id(&lctxt, did, iommu);
     if ( rc )
-    {
-    unlock:
-        spin_unlock(&iommu->lock);
-        unmap_vtd_domain_page(context_entries);
-        if ( prev_dom )
-            rcu_unlock_domain(prev_dom);
-        return rc;
-    }
-
-    if ( !prev_dom )
-    {
-        context_set_address_width(lctxt, level_to_agaw(iommu->nr_pt_levels));
-        context_set_fault_enable(lctxt);
-        context_set_present(lctxt);
-    }
-    else if ( prev_dom == domain )
-    {
-        ASSERT(lctxt.full == context->full);
-        rc = !!pdev;
         goto unlock;
-    }
-    else
-    {
-        ASSERT(context_address_width(lctxt) ==
-               level_to_agaw(iommu->nr_pt_levels));
-        ASSERT(!context_fault_disable(lctxt));
-    }
-
-    if ( cpu_has_cx16 )
-    {
-        __uint128_t res = cmpxchg16b(context, &old, &lctxt.full);
 
-        /*
-         * Hardware does not update the context entry behind our backs,
-         * so the return value should match "old".
-         */
-        if ( res != old )
-        {
-            if ( pdev )
-                check_cleanup_domid_map(domain, pdev, iommu);
-            printk(XENLOG_ERR
-                   "%pp: unexpected context entry %016lx_%016lx (expected %016lx_%016lx)\n",
-                   &PCI_SBDF(seg, bus, devfn),
-                   (uint64_t)(res >> 64), (uint64_t)res,
-                   (uint64_t)(old >> 64), (uint64_t)old);
-            rc = -EILSEQ;
-            goto unlock;
-        }
-    }
-    else if ( !prev_dom || !(mode & MAP_WITH_RMRR) )
-    {
-        context_clear_present(*context);
-        iommu_sync_cache(context, sizeof(*context));
+    context_set_address_width(lctxt, level_to_agaw(iommu->nr_pt_levels));
+    context_set_fault_enable(lctxt);
+    context_set_present(lctxt);
 
-        write_atomic(&context->hi, lctxt.hi);
-        /* No barrier should be needed between these two. */
-        write_atomic(&context->lo, lctxt.lo);
-    }
-    else /* Best effort, updating DID last. */
-    {
-         /*
-          * By non-atomically updating the context entry's DID field last,
-          * during a short window in time TLB entries with the old domain ID
-          * but the new page tables may be inserted.  This could affect I/O
-          * of other devices using this same (old) domain ID.  Such updating
-          * therefore is not a problem if this was the only device associated
-          * with the old domain ID.  Diverting I/O of any of a dying domain's
-          * devices to the quarantine page tables is intended anyway.
-          */
-        if ( !(mode & (MAP_OWNER_DYING | MAP_SINGLE_DEVICE)) )
-            printk(XENLOG_WARNING VTDPREFIX
-                   " %pp: reassignment may cause %pd data corruption\n",
-                   &PCI_SBDF(seg, bus, devfn), prev_dom);
+    res = cmpxchg16b(context, &old, &lctxt.full);
 
-        write_atomic(&context->lo, lctxt.lo);
-        /* No barrier should be needed between these two. */
-        write_atomic(&context->hi, lctxt.hi);
+    /*
+     * Hardware does not update the context entry behind our backs,
+     * so the return value should match "old".
+     */
+    if ( res != old )
+    {
+        printk(XENLOG_ERR
+                "%pp: unexpected context entry %016lx_%016lx (expected %016lx_%016lx)\n",
+                &PCI_SBDF(seg, bus, devfn),
+                (uint64_t)(res >> 64), (uint64_t)res,
+                (uint64_t)(old >> 64), (uint64_t)old);
+        rc = -EILSEQ;
+        goto unlock;
     }
 
     iommu_sync_cache(context, sizeof(struct context_entry));
-    spin_unlock(&iommu->lock);
 
     rc = iommu_flush_context_device(iommu, prev_did, PCI_BDF(bus, devfn),
-                                    DMA_CCMD_MASK_NOBIT, !prev_dom);
+                                    DMA_CCMD_MASK_NOBIT, !overwrite_entry);
     flush_dev_iotlb = !!find_ats_dev_drhd(iommu);
-    ret = iommu_flush_iotlb_dsi(iommu, prev_did, !prev_dom, flush_dev_iotlb);
+    ret = iommu_flush_iotlb_dsi(iommu, prev_did, !overwrite_entry, flush_dev_iotlb);
 
     /*
      * The current logic for returns:
@@ -1653,230 +1535,55 @@ int domain_context_mapping_one(
     if ( rc > 0 )
         rc = 0;
 
-    set_bit(iommu->index, hd->arch.vtd.iommu_bitmap);
+    set_bit(iommu->index, ctx->arch.vtd.iommu_bitmap);
 
     unmap_vtd_domain_page(context_entries);
+    spin_unlock(&iommu->lock);
 
     if ( !seg && !rc )
-        rc = me_wifi_quirk(domain, bus, devfn, domid, pgd_maddr, mode);
-
-    if ( rc && !(mode & MAP_ERROR_RECOVERY) )
-    {
-        if ( !prev_dom ||
-             /*
-              * Unmapping here means DEV_TYPE_PCI devices with RMRRs (if such
-              * exist) would cause problems if such a region was actually
-              * accessed.
-              */
-             (prev_dom == dom_io && !pdev) )
-            ret = domain_context_unmap_one(domain, iommu, bus, devfn);
-        else
-            ret = domain_context_mapping_one(prev_dom, iommu, bus, devfn, pdev,
-                                             DEVICE_DOMID(prev_dom, pdev),
-                                             DEVICE_PGTABLE(prev_dom, pdev),
-                                             (mode & MAP_WITH_RMRR) |
-                                             MAP_ERROR_RECOVERY) < 0;
-
-        if ( !ret && pdev && pdev->devfn == devfn )
-            check_cleanup_domid_map(domain, pdev, iommu);
-    }
+        rc = me_wifi_quirk(domain, bus, devfn, did, 0, ctx);
 
-    if ( prev_dom )
-        rcu_unlock_domain(prev_dom);
+    return rc;
 
-    return rc ?: pdev && prev_dom;
+    unlock:
+        unmap_vtd_domain_page(context_entries);
+        spin_unlock(&iommu->lock);
+        return rc;
 }
 
-static const struct acpi_drhd_unit *domain_context_unmap(
-    struct domain *d, uint8_t devfn, struct pci_dev *pdev);
-
-static int domain_context_mapping(struct domain *domain, u8 devfn,
-                                  struct pci_dev *pdev)
+int apply_context(struct domain *d, struct iommu_context *ctx,
+                  struct pci_dev *pdev, u8 devfn)
 {
     const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
-    const struct acpi_rmrr_unit *rmrr;
-    paddr_t pgd_maddr = DEVICE_PGTABLE(domain, pdev);
-    domid_t orig_domid = pdev->arch.pseudo_domid;
     int ret = 0;
-    unsigned int i, mode = 0;
-    uint16_t seg = pdev->seg, bdf;
-    uint8_t bus = pdev->bus, secbus;
-
-    /*
-     * Generally we assume only devices from one node to get assigned to a
-     * given guest.  But even if not, by replacing the prior value here we
-     * guarantee that at least some basic allocations for the device being
-     * added will get done against its node.  Any further allocations for
-     * this or other devices may be penalized then, but some would also be
-     * if we left other than NUMA_NO_NODE untouched here.
-     */
-    if ( drhd && drhd->iommu->node != NUMA_NO_NODE )
-        dom_iommu(domain)->node = drhd->iommu->node;
-
-    ASSERT(pcidevs_locked());
-
-    for_each_rmrr_device( rmrr, bdf, i )
-    {
-        if ( rmrr->segment != pdev->seg || bdf != pdev->sbdf.bdf )
-            continue;
 
-        mode |= MAP_WITH_RMRR;
-        break;
-    }
+    if ( !drhd )
+        return -EINVAL;
 
-    if ( domain != pdev->domain && pdev->domain != dom_io )
+    if ( pdev->type == DEV_TYPE_PCI_HOST_BRIDGE ||
+         pdev->type == DEV_TYPE_PCIe_BRIDGE ||
+         pdev->type == DEV_TYPE_PCIe2PCI_BRIDGE ||
+         pdev->type == DEV_TYPE_LEGACY_PCI_BRIDGE )
     {
-        if ( pdev->domain->is_dying )
-            mode |= MAP_OWNER_DYING;
-        else if ( drhd &&
-                  !any_pdev_behind_iommu(pdev->domain, pdev, drhd->iommu) &&
-                  !pdev->phantom_stride )
-            mode |= MAP_SINGLE_DEVICE;
+        printk(XENLOG_WARNING VTDPREFIX " Ignoring apply_context on PCI bridge\n");
+        return 0;
     }
 
-    switch ( pdev->type )
-    {
-        bool prev_present;
-
-    case DEV_TYPE_PCI_HOST_BRIDGE:
-        if ( iommu_debug )
-            printk(VTDPREFIX "%pd:Hostbridge: skip %pp map\n",
-                   domain, &PCI_SBDF(seg, bus, devfn));
-        if ( !is_hardware_domain(domain) )
-            return -EPERM;
-        break;
-
-    case DEV_TYPE_PCIe_BRIDGE:
-    case DEV_TYPE_PCIe2PCI_BRIDGE:
-    case DEV_TYPE_LEGACY_PCI_BRIDGE:
-        break;
-
-    case DEV_TYPE_PCIe_ENDPOINT:
-        if ( !drhd )
-            return -ENODEV;
-
-        if ( iommu_quarantine && orig_domid == DOMID_INVALID )
-        {
-            pdev->arch.pseudo_domid =
-                iommu_alloc_domid(drhd->iommu->pseudo_domid_map);
-            if ( pdev->arch.pseudo_domid == DOMID_INVALID )
-                return -ENOSPC;
-        }
-
-        if ( iommu_debug )
-            printk(VTDPREFIX "%pd:PCIe: map %pp\n",
-                   domain, &PCI_SBDF(seg, bus, devfn));
-        ret = domain_context_mapping_one(domain, drhd->iommu, bus, devfn, pdev,
-                                         DEVICE_DOMID(domain, pdev), pgd_maddr,
-                                         mode);
-        if ( ret > 0 )
-            ret = 0;
-        if ( !ret && devfn == pdev->devfn && ats_device(pdev, drhd) > 0 )
-            enable_ats_device(pdev, &drhd->iommu->ats_devices);
-
-        break;
-
-    case DEV_TYPE_PCI:
-        if ( !drhd )
-            return -ENODEV;
-
-        if ( iommu_quarantine && orig_domid == DOMID_INVALID )
-        {
-            pdev->arch.pseudo_domid =
-                iommu_alloc_domid(drhd->iommu->pseudo_domid_map);
-            if ( pdev->arch.pseudo_domid == DOMID_INVALID )
-                return -ENOSPC;
-        }
-
-        if ( iommu_debug )
-            printk(VTDPREFIX "%pd:PCI: map %pp\n",
-                   domain, &PCI_SBDF(seg, bus, devfn));
-
-        ret = domain_context_mapping_one(domain, drhd->iommu, bus, devfn,
-                                         pdev, DEVICE_DOMID(domain, pdev),
-                                         pgd_maddr, mode);
-        if ( ret < 0 )
-            break;
-        prev_present = ret;
-
-        if ( (ret = find_upstream_bridge(seg, &bus, &devfn, &secbus)) < 1 )
-        {
-            if ( !ret )
-                break;
-            ret = -ENXIO;
-        }
-        /*
-         * Strictly speaking if the device is the only one behind this bridge
-         * and the only one with this (secbus,0,0) tuple, it could be allowed
-         * to be re-assigned regardless of RMRR presence.  But let's deal with
-         * that case only if it is actually found in the wild.  Note that
-         * dealing with this just here would still not render the operation
-         * secure.
-         */
-        else if ( prev_present && (mode & MAP_WITH_RMRR) &&
-                  domain != pdev->domain )
-            ret = -EOPNOTSUPP;
-
-        /*
-         * Mapping a bridge should, if anything, pass the struct pci_dev of
-         * that bridge. Since bridges don't normally get assigned to guests,
-         * their owner would be the wrong one. Pass NULL instead.
-         */
-        if ( ret >= 0 )
-            ret = domain_context_mapping_one(domain, drhd->iommu, bus, devfn,
-                                             NULL, DEVICE_DOMID(domain, pdev),
-                                             pgd_maddr, mode);
-
-        /*
-         * Devices behind PCIe-to-PCI/PCIx bridge may generate different
-         * requester-id. It may originate from devfn=0 on the secondary bus
-         * behind the bridge. Map that id as well if we didn't already.
-         *
-         * Somewhat similar as for bridges, we don't want to pass a struct
-         * pci_dev here - there may not even exist one for this (secbus,0,0)
-         * tuple. If there is one, without properly working device groups it
-         * may again not have the correct owner.
-         */
-        if ( !ret && pdev_type(seg, bus, devfn) == DEV_TYPE_PCIe2PCI_BRIDGE &&
-             (secbus != pdev->bus || pdev->devfn != 0) )
-            ret = domain_context_mapping_one(domain, drhd->iommu, secbus, 0,
-                                             NULL, DEVICE_DOMID(domain, pdev),
-                                             pgd_maddr, mode);
-
-        if ( ret )
-        {
-            if ( !prev_present )
-                domain_context_unmap(domain, devfn, pdev);
-            else if ( pdev->domain != domain ) /* Avoid infinite recursion. */
-                domain_context_mapping(pdev->domain, devfn, pdev);
-        }
+    ASSERT(pcidevs_locked());
 
-        break;
+    ret = apply_context_single(d, ctx, drhd->iommu, pdev->bus, devfn);
 
-    default:
-        dprintk(XENLOG_ERR VTDPREFIX, "%pd:unknown(%u): %pp\n",
-                domain, pdev->type, &PCI_SBDF(seg, bus, devfn));
-        ret = -EINVAL;
-        break;
-    }
+    if ( !ret && ats_device(pdev, drhd) > 0 )
+        enable_ats_device(pdev, &drhd->iommu->ats_devices);
 
     if ( !ret && devfn == pdev->devfn )
         pci_vtd_quirk(pdev);
 
-    if ( ret && drhd && orig_domid == DOMID_INVALID )
-    {
-        iommu_free_domid(pdev->arch.pseudo_domid,
-                         drhd->iommu->pseudo_domid_map);
-        pdev->arch.pseudo_domid = DOMID_INVALID;
-    }
-
     return ret;
 }
 
-int domain_context_unmap_one(
-    struct domain *domain,
-    struct vtd_iommu *iommu,
-    uint8_t bus, uint8_t devfn)
+int unapply_context_single(struct domain *domain, struct vtd_iommu *iommu,
+                           uint8_t bus, uint8_t devfn)
 {
     struct context_entry *context, *context_entries;
     u64 maddr;
@@ -1928,8 +1635,8 @@ int domain_context_unmap_one(
     unmap_vtd_domain_page(context_entries);
 
     if ( !iommu->drhd->segment && !rc )
-        rc = me_wifi_quirk(domain, bus, devfn, DOMID_INVALID, 0,
-                           UNMAP_ME_PHANTOM_FUNC);
+        rc = me_wifi_quirk(domain, bus, devfn, DOMID_INVALID, UNMAP_ME_PHANTOM_FUNC,
+                           NULL);
 
     if ( rc && !is_hardware_domain(domain) && domain != dom_io )
     {
@@ -1947,143 +1654,28 @@ int domain_context_unmap_one(
     return rc;
 }
 
-static const struct acpi_drhd_unit *domain_context_unmap(
-    struct domain *domain,
-    uint8_t devfn,
-    struct pci_dev *pdev)
-{
-    const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
-    struct vtd_iommu *iommu = drhd ? drhd->iommu : NULL;
-    int ret;
-    uint16_t seg = pdev->seg;
-    uint8_t bus = pdev->bus, tmp_bus, tmp_devfn, secbus;
-
-    switch ( pdev->type )
-    {
-    case DEV_TYPE_PCI_HOST_BRIDGE:
-        if ( iommu_debug )
-            printk(VTDPREFIX "%pd:Hostbridge: skip %pp unmap\n",
-                   domain, &PCI_SBDF(seg, bus, devfn));
-        return ERR_PTR(is_hardware_domain(domain) ? 0 : -EPERM);
-
-    case DEV_TYPE_PCIe_BRIDGE:
-    case DEV_TYPE_PCIe2PCI_BRIDGE:
-    case DEV_TYPE_LEGACY_PCI_BRIDGE:
-        return ERR_PTR(0);
-
-    case DEV_TYPE_PCIe_ENDPOINT:
-        if ( !iommu )
-            return ERR_PTR(-ENODEV);
-
-        if ( iommu_debug )
-            printk(VTDPREFIX "%pd:PCIe: unmap %pp\n",
-                   domain, &PCI_SBDF(seg, bus, devfn));
-        ret = domain_context_unmap_one(domain, iommu, bus, devfn);
-        if ( !ret && devfn == pdev->devfn && ats_device(pdev, drhd) > 0 )
-            disable_ats_device(pdev);
-
-        break;
-
-    case DEV_TYPE_PCI:
-        if ( !iommu )
-            return ERR_PTR(-ENODEV);
-
-        if ( iommu_debug )
-            printk(VTDPREFIX "%pd:PCI: unmap %pp\n",
-                   domain, &PCI_SBDF(seg, bus, devfn));
-        ret = domain_context_unmap_one(domain, iommu, bus, devfn);
-        if ( ret )
-            break;
-
-        tmp_bus = bus;
-        tmp_devfn = devfn;
-        if ( (ret = find_upstream_bridge(seg, &tmp_bus, &tmp_devfn,
-                                         &secbus)) < 1 )
-        {
-            if ( ret )
-            {
-                ret = -ENXIO;
-                if ( !domain->is_dying &&
-                     !is_hardware_domain(domain) && domain != dom_io )
-                {
-                    domain_crash(domain);
-                    /* Make upper layers continue in a best effort manner. */
-                    ret = 0;
-                }
-            }
-            break;
-        }
-
-        ret = domain_context_unmap_one(domain, iommu, tmp_bus, tmp_devfn);
-        /* PCIe to PCI/PCIx bridge */
-        if ( !ret && pdev_type(seg, tmp_bus, tmp_devfn) == DEV_TYPE_PCIe2PCI_BRIDGE )
-            ret = domain_context_unmap_one(domain, iommu, secbus, 0);
-
-        break;
-
-    default:
-        dprintk(XENLOG_ERR VTDPREFIX, "%pd:unknown(%u): %pp\n",
-                domain, pdev->type, &PCI_SBDF(seg, bus, devfn));
-        return ERR_PTR(-EINVAL);
-    }
-
-    if ( !ret && pdev->devfn == devfn &&
-         !QUARANTINE_SKIP(domain, pdev->arch.vtd.pgd_maddr) )
-        check_cleanup_domid_map(domain, pdev, iommu);
-
-    return drhd;
-}
-
-static void cf_check iommu_clear_root_pgtable(struct domain *d)
+static void cf_check iommu_clear_root_pgtable(struct domain *d, struct iommu_context *ctx)
 {
-    struct domain_iommu *hd = dom_iommu(d);
-
-    spin_lock(&hd->arch.mapping_lock);
-    hd->arch.vtd.pgd_maddr = 0;
-    spin_unlock(&hd->arch.mapping_lock);
+    ctx->arch.vtd.pgd_maddr = 0;
 }
 
 static void cf_check iommu_domain_teardown(struct domain *d)
 {
-    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx = iommu_default_context(d);
     const struct acpi_drhd_unit *drhd;
 
     if ( list_empty(&acpi_drhd_units) )
         return;
 
-    iommu_identity_map_teardown(d);
-
-    ASSERT(!hd->arch.vtd.pgd_maddr);
+    ASSERT(!ctx->arch.vtd.pgd_maddr);
 
     for_each_drhd_unit ( drhd )
         cleanup_domid_map(d->domain_id, drhd->iommu);
-
-    XFREE(hd->arch.vtd.iommu_bitmap);
-}
-
-static void quarantine_teardown(struct pci_dev *pdev,
-                                const struct acpi_drhd_unit *drhd)
-{
-    struct domain_iommu *hd = dom_iommu(dom_io);
-
-    ASSERT(pcidevs_locked());
-
-    if ( !pdev->arch.vtd.pgd_maddr )
-        return;
-
-    ASSERT(page_list_empty(&hd->arch.pgtables.list));
-    page_list_move(&hd->arch.pgtables.list, &pdev->arch.pgtables_list);
-    while ( iommu_free_pgtables(dom_io) == -ERESTART )
-        /* nothing */;
-    pdev->arch.vtd.pgd_maddr = 0;
-
-    if ( drhd )
-        cleanup_domid_map(pdev->arch.pseudo_domid, drhd->iommu);
 }
 
 static int __must_check cf_check intel_iommu_map_page(
     struct domain *d, dfn_t dfn, mfn_t mfn, unsigned int flags,
-    unsigned int *flush_flags)
+    unsigned int *flush_flags, struct iommu_context *ctx)
 {
     struct domain_iommu *hd = dom_iommu(d);
     struct dma_pte *page, *pte, old, new = {};
@@ -2094,33 +1686,24 @@ static int __must_check cf_check intel_iommu_map_page(
     ASSERT((hd->platform_ops->page_sizes >> IOMMUF_order(flags)) &
            PAGE_SIZE_4K);
 
-    /* Do nothing if VT-d shares EPT page table */
-    if ( iommu_use_hap_pt(d) )
-        return 0;
-
-    /* Do nothing if hardware domain and iommu supports pass thru. */
-    if ( iommu_hwdom_passthrough && is_hardware_domain(d) )
+    if ( ctx->opaque )
         return 0;
 
-    spin_lock(&hd->arch.mapping_lock);
-
     /*
      * IOMMU mapping request can be safely ignored when the domain is dying.
      *
-     * hd->arch.mapping_lock guarantees that d->is_dying will be observed
+     * hd->lock guarantees that d->is_dying will be observed
      * before any page tables are freed (see iommu_free_pgtables())
      */
     if ( d->is_dying )
     {
-        spin_unlock(&hd->arch.mapping_lock);
         return 0;
     }
 
-    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), level, flush_flags,
+    pg_maddr = addr_to_dma_page_maddr(d, ctx, dfn_to_daddr(dfn), level, flush_flags,
                                       true);
     if ( pg_maddr < PAGE_SIZE )
     {
-        spin_unlock(&hd->arch.mapping_lock);
         return -ENOMEM;
     }
 
@@ -2141,7 +1724,6 @@ static int __must_check cf_check intel_iommu_map_page(
 
     if ( !((old.val ^ new.val) & ~DMA_PTE_CONTIG_MASK) )
     {
-        spin_unlock(&hd->arch.mapping_lock);
         unmap_vtd_domain_page(page);
         return 0;
     }
@@ -2170,7 +1752,7 @@ static int __must_check cf_check intel_iommu_map_page(
         new.val &= ~(LEVEL_MASK << level_to_offset_bits(level));
         dma_set_pte_superpage(new);
 
-        pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), ++level,
+        pg_maddr = addr_to_dma_page_maddr(d, ctx, dfn_to_daddr(dfn), ++level,
                                           flush_flags, false);
         BUG_ON(pg_maddr < PAGE_SIZE);
 
@@ -2180,11 +1762,10 @@ static int __must_check cf_check intel_iommu_map_page(
         iommu_sync_cache(pte, sizeof(*pte));
 
         *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
-        iommu_queue_free_pgtable(hd, pg);
+        iommu_queue_free_pgtable(ctx, pg);
         perfc_incr(iommu_pt_coalesces);
     }
 
-    spin_unlock(&hd->arch.mapping_lock);
     unmap_vtd_domain_page(page);
 
     *flush_flags |= IOMMU_FLUSHF_added;
@@ -2193,7 +1774,7 @@ static int __must_check cf_check intel_iommu_map_page(
         *flush_flags |= IOMMU_FLUSHF_modified;
 
         if ( IOMMUF_order(flags) && !dma_pte_superpage(old) )
-            queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(old)),
+            queue_free_pt(ctx, maddr_to_mfn(dma_pte_addr(old)),
                           IOMMUF_order(flags) / LEVEL_STRIDE);
     }
 
@@ -2201,7 +1782,8 @@ static int __must_check cf_check intel_iommu_map_page(
 }
 
 static int __must_check cf_check intel_iommu_unmap_page(
-    struct domain *d, dfn_t dfn, unsigned int order, unsigned int *flush_flags)
+    struct domain *d, dfn_t dfn, unsigned int order, unsigned int *flush_flags,
+    struct iommu_context *ctx)
 {
     struct domain_iommu *hd = dom_iommu(d);
     daddr_t addr = dfn_to_daddr(dfn);
@@ -2215,29 +1797,19 @@ static int __must_check cf_check intel_iommu_unmap_page(
      */
     ASSERT((hd->platform_ops->page_sizes >> order) & PAGE_SIZE_4K);
 
-    /* Do nothing if VT-d shares EPT page table */
-    if ( iommu_use_hap_pt(d) )
+    if ( ctx->opaque )
         return 0;
 
-    /* Do nothing if hardware domain and iommu supports pass thru. */
-    if ( iommu_hwdom_passthrough && is_hardware_domain(d) )
-        return 0;
-
-    spin_lock(&hd->arch.mapping_lock);
     /* get target level pte */
-    pg_maddr = addr_to_dma_page_maddr(d, addr, level, flush_flags, false);
+    pg_maddr = addr_to_dma_page_maddr(d, ctx, addr, level, flush_flags, false);
     if ( pg_maddr < PAGE_SIZE )
-    {
-        spin_unlock(&hd->arch.mapping_lock);
         return pg_maddr ? -ENOMEM : 0;
-    }
 
     page = map_vtd_domain_page(pg_maddr);
     pte = &page[address_level_offset(addr, level)];
 
     if ( !dma_pte_present(*pte) )
     {
-        spin_unlock(&hd->arch.mapping_lock);
         unmap_vtd_domain_page(page);
         return 0;
     }
@@ -2255,7 +1827,7 @@ static int __must_check cf_check intel_iommu_unmap_page(
 
         unmap_vtd_domain_page(page);
 
-        pg_maddr = addr_to_dma_page_maddr(d, addr, level, flush_flags, false);
+        pg_maddr = addr_to_dma_page_maddr(d, ctx, addr, level, flush_flags, false);
         BUG_ON(pg_maddr < PAGE_SIZE);
 
         page = map_vtd_domain_page(pg_maddr);
@@ -2264,42 +1836,31 @@ static int __must_check cf_check intel_iommu_unmap_page(
         iommu_sync_cache(pte, sizeof(*pte));
 
         *flush_flags |= IOMMU_FLUSHF_all;
-        iommu_queue_free_pgtable(hd, pg);
+        iommu_queue_free_pgtable(ctx, pg);
         perfc_incr(iommu_pt_coalesces);
     }
 
-    spin_unlock(&hd->arch.mapping_lock);
-
     unmap_vtd_domain_page(page);
 
     *flush_flags |= IOMMU_FLUSHF_modified;
 
     if ( order && !dma_pte_superpage(old) )
-        queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(old)),
+        queue_free_pt(ctx, maddr_to_mfn(dma_pte_addr(old)),
                       order / LEVEL_STRIDE);
 
     return 0;
 }
 
 static int cf_check intel_iommu_lookup_page(
-    struct domain *d, dfn_t dfn, mfn_t *mfn, unsigned int *flags)
+    struct domain *d, dfn_t dfn, mfn_t *mfn, unsigned int *flags,
+    struct iommu_context *ctx)
 {
-    struct domain_iommu *hd = dom_iommu(d);
     uint64_t val;
 
-    /*
-     * If VT-d shares EPT page table or if the domain is the hardware
-     * domain and iommu_passthrough is set then pass back the dfn.
-     */
-    if ( iommu_use_hap_pt(d) ||
-         (iommu_hwdom_passthrough && is_hardware_domain(d)) )
+    if ( ctx->opaque )
         return -EOPNOTSUPP;
 
-    spin_lock(&hd->arch.mapping_lock);
-
-    val = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 0, NULL, false);
-
-    spin_unlock(&hd->arch.mapping_lock);
+    val = addr_to_dma_page_maddr(d, ctx, dfn_to_daddr(dfn), 0, NULL, false);
 
     if ( val < PAGE_SIZE )
         return -ENOENT;
@@ -2320,7 +1881,7 @@ static bool __init vtd_ept_page_compatible(const struct vtd_iommu *iommu)
 
     /* EPT is not initialised yet, so we must check the capability in
      * the MSR explicitly rather than use cpu_has_vmx_ept_*() */
-    if ( rdmsr_safe(MSR_IA32_VMX_EPT_VPID_CAP, ept_cap) != 0 ) 
+    if ( rdmsr_safe(MSR_IA32_VMX_EPT_VPID_CAP, ept_cap) != 0 )
         return false;
 
     return (ept_has_2mb(ept_cap) && opt_hap_2mb) <=
@@ -2329,44 +1890,6 @@ static bool __init vtd_ept_page_compatible(const struct vtd_iommu *iommu)
             (cap_sps_1gb(vtd_cap) && iommu_superpages);
 }
 
-static int cf_check intel_iommu_add_device(u8 devfn, struct pci_dev *pdev)
-{
-    struct acpi_rmrr_unit *rmrr;
-    u16 bdf;
-    int ret, i;
-
-    ASSERT(pcidevs_locked());
-
-    if ( !pdev->domain )
-        return -EINVAL;
-
-    for_each_rmrr_device ( rmrr, bdf, i )
-    {
-        if ( rmrr->segment == pdev->seg && bdf == PCI_BDF(pdev->bus, devfn) )
-        {
-            /*
-             * iommu_add_device() is only called for the hardware
-             * domain (see xen/drivers/passthrough/pci.c:pci_add_device()).
-             * Since RMRRs are always reserved in the e820 map for the hardware
-             * domain, there shouldn't be a conflict.
-             */
-            ret = iommu_identity_mapping(pdev->domain, p2m_access_rw,
-                                         rmrr->base_address, rmrr->end_address,
-                                         0);
-            if ( ret )
-                dprintk(XENLOG_ERR VTDPREFIX, "%pd: RMRR mapping failed\n",
-                        pdev->domain);
-        }
-    }
-
-    ret = domain_context_mapping(pdev->domain, devfn, pdev);
-    if ( ret )
-        dprintk(XENLOG_ERR VTDPREFIX, "%pd: context mapping failed\n",
-                pdev->domain);
-
-    return ret;
-}
-
 static int cf_check intel_iommu_enable_device(struct pci_dev *pdev)
 {
     struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
@@ -2382,49 +1905,16 @@ static int cf_check intel_iommu_enable_device(struct pci_dev *pdev)
     return ret >= 0 ? 0 : ret;
 }
 
-static int cf_check intel_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
-{
-    const struct acpi_drhd_unit *drhd;
-    struct acpi_rmrr_unit *rmrr;
-    u16 bdf;
-    unsigned int i;
-
-    if ( !pdev->domain )
-        return -EINVAL;
-
-    drhd = domain_context_unmap(pdev->domain, devfn, pdev);
-    if ( IS_ERR(drhd) )
-        return PTR_ERR(drhd);
-
-    for_each_rmrr_device ( rmrr, bdf, i )
-    {
-        if ( rmrr->segment != pdev->seg || bdf != PCI_BDF(pdev->bus, devfn) )
-            continue;
-
-        /*
-         * Any flag is nothing to clear these mappings but here
-         * its always safe and strict to set 0.
-         */
-        iommu_identity_mapping(pdev->domain, p2m_access_x, rmrr->base_address,
-                               rmrr->end_address, 0);
-    }
-
-    quarantine_teardown(pdev, drhd);
-
-    if ( drhd )
-    {
-        iommu_free_domid(pdev->arch.pseudo_domid,
-                         drhd->iommu->pseudo_domid_map);
-        pdev->arch.pseudo_domid = DOMID_INVALID;
-    }
-
-    return 0;
-}
-
 static int __hwdom_init cf_check setup_hwdom_device(
     u8 devfn, struct pci_dev *pdev)
 {
-    return domain_context_mapping(pdev->domain, devfn, pdev);
+    if (pdev->type == DEV_TYPE_PCI_HOST_BRIDGE ||
+        pdev->type == DEV_TYPE_PCIe_BRIDGE ||
+        pdev->type == DEV_TYPE_PCIe2PCI_BRIDGE ||
+        pdev->type == DEV_TYPE_LEGACY_PCI_BRIDGE)
+        return 0;
+
+    return iommu_attach_context(hardware_domain, pdev, 0);
 }
 
 void clear_fault_bits(struct vtd_iommu *iommu)
@@ -2518,7 +2008,7 @@ static int __must_check init_vtd_hw(bool resume)
 
     /*
      * Enable queue invalidation
-     */   
+     */
     for_each_drhd_unit ( drhd )
     {
         iommu = drhd->iommu;
@@ -2539,7 +2029,7 @@ static int __must_check init_vtd_hw(bool resume)
 
     /*
      * Enable interrupt remapping
-     */  
+     */
     if ( iommu_intremap != iommu_intremap_off )
     {
         int apic;
@@ -2594,34 +2084,53 @@ static int __must_check init_vtd_hw(bool resume)
     return iommu_flush_all();
 }
 
-static void __hwdom_init setup_hwdom_rmrr(struct domain *d)
+static struct iommu_state {
+    uint32_t fectl;
+} *__read_mostly iommu_state;
+
+static void arch_iommu_dump_domain_contexts(struct domain *d)
 {
-    struct acpi_rmrr_unit *rmrr;
-    u16 bdf;
-    int ret, i;
+    unsigned int i, iommu_no;
+    struct pci_dev *pdev;
+    struct iommu_context *ctx;
+    struct domain_iommu *hd = dom_iommu(d);
 
-    pcidevs_lock();
-    for_each_rmrr_device ( rmrr, bdf, i )
+    printk("d%hu contexts\n", d->domain_id);
+
+    for (i = 0; i < (1 + hd->other_contexts.count); ++i)
     {
-        /*
-         * Here means we're add a device to the hardware domain.
-         * Since RMRRs are always reserved in the e820 map for the hardware
-         * domain, there shouldn't be a conflict. So its always safe and
-         * strict to set 0.
-         */
-        ret = iommu_identity_mapping(d, p2m_access_rw, rmrr->base_address,
-                                     rmrr->end_address, 0);
-        if ( ret )
-            dprintk(XENLOG_ERR VTDPREFIX,
-                     "IOMMU: mapping reserved region failed\n");
+        if ( (ctx = iommu_get_context(d, i)) )
+        {
+            printk(" Context %d (%"PRIx64")\n", i, ctx->arch.vtd.pgd_maddr);
+
+            for (iommu_no = 0; iommu_no < nr_iommus; iommu_no++)
+                printk("  IOMMU %hu (used=%u; did=%hu)\n", iommu_no,
+                       test_bit(iommu_no, ctx->arch.vtd.iommu_bitmap),
+                       ctx->arch.vtd.didmap[iommu_no]);
+
+            list_for_each_entry(pdev, &ctx->devices, context_list)
+            {
+                printk("  - %pp\n", &pdev->sbdf);
+            }
+
+            iommu_put_context(ctx);
+        }
     }
-    pcidevs_unlock();
 }
 
-static struct iommu_state {
-    uint32_t fectl;
-} *__read_mostly iommu_state;
+static void arch_iommu_dump_contexts(unsigned char key)
+{
+    struct domain *d;
 
+    for_each_domain(d)
+        if (is_iommu_enabled(d)) {
+            struct domain_iommu *hd = dom_iommu(d);
+            printk("d%hu arena page usage: %d\n", d->domain_id,
+                atomic_read(&hd->arch.pt_arena.used_pages));
+
+            arch_iommu_dump_domain_contexts(d);
+        }
+}
 static int __init cf_check vtd_setup(void)
 {
     struct acpi_drhd_unit *drhd;
@@ -2749,6 +2258,7 @@ static int __init cf_check vtd_setup(void)
     iommu_ops.page_sizes |= large_sizes;
 
     register_keyhandler('V', vtd_dump_iommu_info, "dump iommu info", 1);
+    register_keyhandler('X', arch_iommu_dump_contexts, "dump iommu contexts", 1);
 
     return 0;
 
@@ -2763,192 +2273,6 @@ static int __init cf_check vtd_setup(void)
     return ret;
 }
 
-static int cf_check reassign_device_ownership(
-    struct domain *source,
-    struct domain *target,
-    u8 devfn, struct pci_dev *pdev)
-{
-    int ret;
-
-    if ( !QUARANTINE_SKIP(target, pdev->arch.vtd.pgd_maddr) )
-    {
-        if ( !has_arch_pdevs(target) )
-            vmx_pi_hooks_assign(target);
-
-#ifdef CONFIG_PV
-        /*
-         * Devices assigned to untrusted domains (here assumed to be any domU)
-         * can attempt to send arbitrary LAPIC/MSI messages. We are unprotected
-         * by the root complex unless interrupt remapping is enabled.
-         */
-        if ( !iommu_intremap && !is_hardware_domain(target) &&
-             !is_system_domain(target) )
-            untrusted_msi = true;
-#endif
-
-        ret = domain_context_mapping(target, devfn, pdev);
-
-        if ( !ret && pdev->devfn == devfn &&
-             !QUARANTINE_SKIP(source, pdev->arch.vtd.pgd_maddr) )
-        {
-            const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
-
-            if ( drhd )
-                check_cleanup_domid_map(source, pdev, drhd->iommu);
-        }
-    }
-    else
-    {
-        const struct acpi_drhd_unit *drhd;
-
-        drhd = domain_context_unmap(source, devfn, pdev);
-        ret = IS_ERR(drhd) ? PTR_ERR(drhd) : 0;
-    }
-    if ( ret )
-    {
-        if ( !has_arch_pdevs(target) )
-            vmx_pi_hooks_deassign(target);
-        return ret;
-    }
-
-    if ( devfn == pdev->devfn && pdev->domain != target )
-    {
-        write_lock(&source->pci_lock);
-        list_del(&pdev->domain_list);
-        write_unlock(&source->pci_lock);
-
-        pdev->domain = target;
-
-        write_lock(&target->pci_lock);
-        list_add(&pdev->domain_list, &target->pdev_list);
-        write_unlock(&target->pci_lock);
-    }
-
-    if ( !has_arch_pdevs(source) )
-        vmx_pi_hooks_deassign(source);
-
-    /*
-     * If the device belongs to the hardware domain, and it has RMRR, don't
-     * remove it from the hardware domain, because BIOS may use RMRR at
-     * booting time.
-     */
-    if ( !is_hardware_domain(source) )
-    {
-        const struct acpi_rmrr_unit *rmrr;
-        u16 bdf;
-        unsigned int i;
-
-        for_each_rmrr_device( rmrr, bdf, i )
-            if ( rmrr->segment == pdev->seg &&
-                 bdf == PCI_BDF(pdev->bus, devfn) )
-            {
-                /*
-                 * Any RMRR flag is always ignored when remove a device,
-                 * but its always safe and strict to set 0.
-                 */
-                ret = iommu_identity_mapping(source, p2m_access_x,
-                                             rmrr->base_address,
-                                             rmrr->end_address, 0);
-                if ( ret && ret != -ENOENT )
-                    return ret;
-            }
-    }
-
-    return 0;
-}
-
-static int cf_check intel_iommu_assign_device(
-    struct domain *d, u8 devfn, struct pci_dev *pdev, u32 flag)
-{
-    struct domain *s = pdev->domain;
-    struct acpi_rmrr_unit *rmrr;
-    int ret = 0, i;
-    u16 bdf, seg;
-    u8 bus;
-
-    if ( list_empty(&acpi_drhd_units) )
-        return -ENODEV;
-
-    seg = pdev->seg;
-    bus = pdev->bus;
-    /*
-     * In rare cases one given rmrr is shared by multiple devices but
-     * obviously this would put the security of a system at risk. So
-     * we would prevent from this sort of device assignment. But this
-     * can be permitted if user set
-     *      "pci = [ 'sbdf, rdm_policy=relaxed' ]"
-     *
-     * TODO: in the future we can introduce group device assignment
-     * interface to make sure devices sharing RMRR are assigned to the
-     * same domain together.
-     */
-    for_each_rmrr_device( rmrr, bdf, i )
-    {
-        if ( rmrr->segment == seg && bdf == PCI_BDF(bus, devfn) &&
-             rmrr->scope.devices_cnt > 1 )
-        {
-            bool relaxed = flag & XEN_DOMCTL_DEV_RDM_RELAXED;
-
-            printk(XENLOG_GUEST "%s" VTDPREFIX
-                   " It's %s to assign %pp"
-                   " with shared RMRR at %"PRIx64" for %pd.\n",
-                   relaxed ? XENLOG_WARNING : XENLOG_ERR,
-                   relaxed ? "risky" : "disallowed",
-                   &PCI_SBDF(seg, bus, devfn), rmrr->base_address, d);
-            if ( !relaxed )
-                return -EPERM;
-        }
-    }
-
-    if ( d == dom_io )
-        return reassign_device_ownership(s, d, devfn, pdev);
-
-    /* Setup rmrr identity mapping */
-    for_each_rmrr_device( rmrr, bdf, i )
-    {
-        if ( rmrr->segment == seg && bdf == PCI_BDF(bus, devfn) )
-        {
-            ret = iommu_identity_mapping(d, p2m_access_rw, rmrr->base_address,
-                                         rmrr->end_address, flag);
-            if ( ret )
-            {
-                printk(XENLOG_G_ERR VTDPREFIX
-                       "%pd: cannot map reserved region [%"PRIx64",%"PRIx64"]: %d\n",
-                       d, rmrr->base_address, rmrr->end_address, ret);
-                break;
-            }
-        }
-    }
-
-    if ( !ret )
-        ret = reassign_device_ownership(s, d, devfn, pdev);
-
-    /* See reassign_device_ownership() for the hwdom aspect. */
-    if ( !ret || is_hardware_domain(d) )
-        return ret;
-
-    for_each_rmrr_device( rmrr, bdf, i )
-    {
-        if ( rmrr->segment == seg && bdf == PCI_BDF(bus, devfn) )
-        {
-            int rc = iommu_identity_mapping(d, p2m_access_x,
-                                            rmrr->base_address,
-                                            rmrr->end_address, 0);
-
-            if ( rc && rc != -ENOENT )
-            {
-                printk(XENLOG_ERR VTDPREFIX
-                       "%pd: cannot unmap reserved region [%"PRIx64",%"PRIx64"]: %d\n",
-                       d, rmrr->base_address, rmrr->end_address, rc);
-                domain_crash(d);
-                break;
-            }
-        }
-    }
-
-    return ret;
-}
-
 static int cf_check intel_iommu_group_id(u16 seg, u8 bus, u8 devfn)
 {
     u8 secbus;
@@ -3073,6 +2397,11 @@ static void vtd_dump_page_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
     if ( level < 1 )
         return;
 
+    if (pt_maddr == 0) {
+        printk(" (empty)\n");
+        return;
+    }
+
     pt_vaddr = map_vtd_domain_page(pt_maddr);
 
     next_level = level - 1;
@@ -3103,158 +2432,374 @@ static void vtd_dump_page_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
 
 static void cf_check vtd_dump_page_tables(struct domain *d)
 {
-    const struct domain_iommu *hd = dom_iommu(d);
+    struct domain_iommu *hd = dom_iommu(d);
+    unsigned int i;
 
-    printk(VTDPREFIX" %pd table has %d levels\n", d,
+    printk(VTDPREFIX " %pd table has %d levels\n", d,
            agaw_to_level(hd->arch.vtd.agaw));
-    vtd_dump_page_table_level(hd->arch.vtd.pgd_maddr,
-                              agaw_to_level(hd->arch.vtd.agaw), 0, 0);
+
+    for (i = 1; i < (1 + hd->other_contexts.count); ++i)
+    {
+        struct iommu_context *ctx = iommu_get_context(d, i);
+
+        printk(VTDPREFIX " %pd context %d: %s\n", d, i,
+               ctx ? "allocated" : "non-allocated");
+
+        if (ctx)
+        {
+            vtd_dump_page_table_level(ctx->arch.vtd.pgd_maddr,
+                                      agaw_to_level(hd->arch.vtd.agaw), 0, 0);
+            iommu_put_context(ctx);
+        }
+    }
 }
 
-static int fill_qpt(struct dma_pte *this, unsigned int level,
-                    struct page_info *pgs[6])
+static int intel_iommu_context_init(struct domain *d, struct iommu_context *ctx, u32 flags)
 {
-    struct domain_iommu *hd = dom_iommu(dom_io);
-    unsigned int i;
-    int rc = 0;
+    struct acpi_drhd_unit *drhd;
+
+    ctx->arch.vtd.didmap = xzalloc_array(u16, nr_iommus);
 
-    for ( i = 0; !rc && i < PTE_NUM; ++i )
+    if ( !ctx->arch.vtd.didmap )
+        return -ENOMEM;
+
+    ctx->arch.vtd.iommu_bitmap = xzalloc_array(unsigned long,
+                                               BITS_TO_LONGS(nr_iommus));
+    if ( !ctx->arch.vtd.iommu_bitmap )
+        return -ENOMEM;
+
+    ctx->arch.vtd.superpage_progress = 0;
+
+    if ( flags & IOMMU_CONTEXT_INIT_default )
     {
-        struct dma_pte *pte = &this[i], *next;
+        ctx->arch.vtd.pgd_maddr = 0;
 
-        if ( !dma_pte_present(*pte) )
+        /*
+         * Context is considered "opaque" (non-managed) in these cases :
+         *  - HAP is enabled, in this case, the pagetable is not managed by the
+         *    IOMMU code, thus opaque
+         *  - IOMMU is in passthrough which means that there is no actual pagetable
+         *
+         * If no-dma mode is specified, it's always non-opaque as the pagetable is
+         * always managed regardless of the rest.
+         */
+        ctx->arch.hap_context = !iommu_hwdom_no_dma && (iommu_use_hap_pt(d) || iommu_hwdom_passthrough);
+
+        ctx->opaque = ctx->arch.hap_context;
+
+        /* Populate context DID map using domain id. */
+        for_each_drhd_unit(drhd)
         {
-            if ( !pgs[level] )
-            {
-                /*
-                 * The pgtable allocator is fine for the leaf page, as well as
-                 * page table pages, and the resulting allocations are always
-                 * zeroed.
-                 */
-                pgs[level] = iommu_alloc_pgtable(hd, 0);
-                if ( !pgs[level] )
-                {
-                    rc = -ENOMEM;
-                    break;
-                }
-
-                if ( level )
-                {
-                    next = map_vtd_domain_page(page_to_maddr(pgs[level]));
-                    rc = fill_qpt(next, level - 1, pgs);
-                    unmap_vtd_domain_page(next);
-                }
-            }
+            ctx->arch.vtd.didmap[drhd->iommu->index] =
+                convert_domid(drhd->iommu, d->domain_id);
+        }
+    }
+    else
+    {
+        /* Populate context DID map using pseudo DIDs */
+        for_each_drhd_unit(drhd)
+        {
+            ctx->arch.vtd.didmap[drhd->iommu->index] =
+                iommu_alloc_domid(drhd->iommu->pseudo_domid_map);
+        }
+    }
 
-            dma_set_pte_addr(*pte, page_to_maddr(pgs[level]));
-            dma_set_pte_readable(*pte);
-            dma_set_pte_writable(*pte);
+    if ( !ctx->opaque )
+        /* Create initial context page */
+        addr_to_dma_page_maddr(d, ctx, 0, min_pt_levels, NULL, true);
+
+    return arch_iommu_context_init(d, ctx, flags);
+}
+
+static int intel_iommu_cleanup_pte(uint64_t pte_maddr, bool preempt)
+{
+    size_t i;
+    struct dma_pte *pte = map_vtd_domain_page(pte_maddr);
+
+    for (i = 0; i < (1 << PAGETABLE_ORDER); ++i)
+        if ( dma_pte_present(pte[i]) )
+        {
+            /* Remove the reference of the target mapping (if needed) */
+            mfn_t mfn = maddr_to_mfn(dma_pte_addr(pte[i]));
+
+            if ( mfn_valid(mfn) )
+                put_page(mfn_to_page(mfn));
+
+            if ( preempt )
+                dma_clear_pte(pte[i]);
         }
-        else if ( level && !dma_pte_superpage(*pte) )
+
+    unmap_vtd_domain_page(pte);
+
+    return 0;
+}
+
+/**
+ * Cleanup logic :
+ * Walk through the entire page table, progressively removing mappings if preempt.
+ *
+ * Return values :
+ *  - Report preemption with -ERESTART.
+ *  - Report empty pte/pgd with 0.
+ *
+ * When preempted during superpage operation, store state in vtd.superpage_progress.
+ */
+
+static int intel_iommu_cleanup_superpage(struct iommu_context *ctx,
+                                          unsigned int page_order, uint64_t pte_maddr,
+                                          bool preempt)
+{
+    size_t i = 0, page_count = 1 << page_order;
+    struct page_info *page = maddr_to_page(pte_maddr);
+
+    if ( preempt )
+        i = ctx->arch.vtd.superpage_progress;
+
+    for (; i < page_count; page++)
+    {
+        put_page(page);
+
+        if ( preempt && (i & 0xff) && general_preempt_check() )
         {
-            next = map_vtd_domain_page(dma_pte_addr(*pte));
-            rc = fill_qpt(next, level - 1, pgs);
-            unmap_vtd_domain_page(next);
+            ctx->arch.vtd.superpage_progress = i + 1;
+            return -ERESTART;
         }
     }
 
-    return rc;
+    if ( preempt )
+        ctx->arch.vtd.superpage_progress = 0;
+
+    return 0;
 }
 
-static int cf_check intel_iommu_quarantine_init(struct pci_dev *pdev,
-                                                bool scratch_page)
+static int intel_iommu_cleanup_mappings(struct iommu_context *ctx,
+                                         unsigned int nr_pt_levels, uint64_t pgd_maddr,
+                                         bool preempt)
 {
-    struct domain_iommu *hd = dom_iommu(dom_io);
-    struct page_info *pg;
-    unsigned int agaw = hd->arch.vtd.agaw;
-    unsigned int level = agaw_to_level(agaw);
-    const struct acpi_drhd_unit *drhd;
-    const struct acpi_rmrr_unit *rmrr;
-    unsigned int i, bdf;
-    bool rmrr_found = false;
+    size_t i;
     int rc;
+    struct dma_pte *pgd;
 
-    ASSERT(pcidevs_locked());
-    ASSERT(!hd->arch.vtd.pgd_maddr);
-    ASSERT(page_list_empty(&hd->arch.pgtables.list));
+    if ( ctx->opaque )
+        /* don't touch opaque contexts */
+        return 0;
+
+    pgd = map_vtd_domain_page(pgd_maddr);
 
-    if ( pdev->arch.vtd.pgd_maddr )
+    for (i = 0; i < (1 << PAGETABLE_ORDER); ++i)
     {
-        clear_domain_page(pdev->arch.leaf_mfn);
-        return 0;
+        if ( dma_pte_present(pgd[i]) )
+        {
+            uint64_t pte_maddr = dma_pte_addr(pgd[i]);
+
+            if ( dma_pte_superpage(pgd[i]) )
+                rc = intel_iommu_cleanup_superpage(ctx, nr_pt_levels * SUPERPAGE_ORDER,
+                                                   pte_maddr, preempt);
+            else if ( nr_pt_levels > 2 )
+                /* Next level is not PTE */
+                rc = intel_iommu_cleanup_mappings(ctx, nr_pt_levels - 1,
+                                                  pte_maddr, preempt);
+            else
+                rc = intel_iommu_cleanup_pte(pte_maddr, preempt);
+
+            if ( preempt && !rc )
+                /* Fold pgd (no more mappings in it) */
+                dma_clear_pte(pgd[i]);
+            else if ( preempt && (rc == -ERESTART || general_preempt_check()) )
+            {
+                unmap_vtd_domain_page(pgd);
+                return -ERESTART;
+            }
+        }
     }
 
-    drhd = acpi_find_matched_drhd_unit(pdev);
-    if ( !drhd )
-        return -ENODEV;
+    unmap_vtd_domain_page(pgd);
 
-    pg = iommu_alloc_pgtable(hd, 0);
-    if ( !pg )
-        return -ENOMEM;
+    return 0;
+}
 
-    rc = context_set_domain_id(NULL, pdev->arch.pseudo_domid, drhd->iommu);
+static int intel_iommu_context_teardown(struct domain *d, struct iommu_context *ctx, u32 flags)
+{
+    struct acpi_drhd_unit *drhd;
+    pcidevs_lock();
 
-    /* Transiently install the root into DomIO, for iommu_identity_mapping(). */
-    hd->arch.vtd.pgd_maddr = page_to_maddr(pg);
+    // Cleanup mappings
+    if ( intel_iommu_cleanup_mappings(ctx, agaw_to_level(d->iommu.arch.vtd.agaw),
+                                      ctx->arch.vtd.pgd_maddr,
+                                      flags & IOMMUF_preempt) < 0 )
+    {
+        pcidevs_unlock();
+        return -ERESTART;
+    }
 
-    for_each_rmrr_device ( rmrr, bdf, i )
+    if (ctx->arch.vtd.didmap)
     {
-        if ( rc )
-            break;
+        for_each_drhd_unit(drhd)
+        {
+            iommu_free_domid(ctx->arch.vtd.didmap[drhd->iommu->index],
+                drhd->iommu->pseudo_domid_map);
+        }
+
+        xfree(ctx->arch.vtd.didmap);
+    }
 
-        if ( rmrr->segment == pdev->seg && bdf == pdev->sbdf.bdf )
+    pcidevs_unlock();
+    return arch_iommu_context_teardown(d, ctx, flags);
+}
+
+static int intel_iommu_dev_rmrr(struct domain *d, struct pci_dev *pdev,
+                                struct iommu_context *ctx, bool unmap)
+{
+    struct acpi_rmrr_unit *rmrr;
+    u16 bdf;
+    int ret, i;
+
+    for_each_rmrr_device(rmrr, bdf, i)
+    {
+        if ( PCI_SBDF(rmrr->segment, bdf).sbdf == pdev->sbdf.sbdf )
         {
-            rmrr_found = true;
-
-            rc = iommu_identity_mapping(dom_io, p2m_access_rw,
-                                        rmrr->base_address, rmrr->end_address,
-                                        0);
-            if ( rc )
-                printk(XENLOG_ERR VTDPREFIX
-                       "%pp: RMRR quarantine mapping failed\n",
-                       &pdev->sbdf);
+            ret = iommu_identity_mapping(d, ctx,
+                                         unmap ? p2m_access_x : p2m_access_rw,
+                                         rmrr->base_address, rmrr->end_address,
+                                         0);
+
+            if ( ret < 0 )
+                return ret;
         }
     }
 
-    iommu_identity_map_teardown(dom_io);
-    hd->arch.vtd.pgd_maddr = 0;
-    pdev->arch.vtd.pgd_maddr = page_to_maddr(pg);
+    return 0;
+}
 
-    if ( !rc && scratch_page )
+static int intel_iommu_attach(struct domain *d, struct pci_dev *pdev,
+                              struct iommu_context *ctx)
+{
+    int ret;
+    const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
+
+    if (!pdev || !drhd)
+        return -EINVAL;
+
+    if ( !ctx->opaque || ctx->arch.hap_context )
     {
-        struct dma_pte *root;
-        struct page_info *pgs[6] = {};
+        ret = intel_iommu_dev_rmrr(d, pdev, ctx, false);
+
+        if ( ret )
+            return ret;
+    }
+
+    ret = apply_context(d, ctx, pdev, pdev->devfn);
+
+    if ( ret )
+        return ret;
+
+    pci_vtd_quirk(pdev);
+
+    return ret;
+}
+
+static int intel_iommu_detach(struct domain *d, struct pci_dev *pdev,
+                              struct iommu_context *prev_ctx)
+{
+    int ret;
+    const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
+
+    if (!pdev || !drhd)
+        return -EINVAL;
+
+    ret = unapply_context_single(d, drhd->iommu, pdev->bus, pdev->devfn);
+
+    if ( ret )
+        return ret;
+
+    if ( !prev_ctx->opaque || prev_ctx->arch.hap_context )
+        WARN_ON(intel_iommu_dev_rmrr(d, pdev, prev_ctx, true));
+
+    check_cleanup_domid_map(d, prev_ctx, NULL, drhd->iommu);
+
+    return ret;
+}
 
-        root = map_vtd_domain_page(pdev->arch.vtd.pgd_maddr);
-        rc = fill_qpt(root, level - 1, pgs);
-        unmap_vtd_domain_page(root);
+static int intel_iommu_reattach(struct domain *d, struct pci_dev *pdev,
+                                struct iommu_context *prev_ctx,
+                                struct iommu_context *ctx)
+{
+    int ret;
+    const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
+
+    if (!pdev || !drhd)
+        return -EINVAL;
 
-        pdev->arch.leaf_mfn = page_to_mfn(pgs[0]);
+    if ( !ctx->opaque || ctx->arch.hap_context )
+    {
+        ret = intel_iommu_dev_rmrr(d, pdev, ctx, false);
+
+        if ( ret )
+            return ret;
     }
 
-    page_list_move(&pdev->arch.pgtables_list, &hd->arch.pgtables.list);
+    ret = apply_context_single(d, ctx, drhd->iommu, pdev->bus, pdev->devfn);
+
+    if ( ret )
+        return ret;
 
-    if ( rc || (!scratch_page && !rmrr_found) )
-        quarantine_teardown(pdev, drhd);
+    if ( !prev_ctx->opaque || prev_ctx->arch.hap_context )
+        WARN_ON(intel_iommu_dev_rmrr(d, pdev, prev_ctx, true));
 
-    return rc;
+    /* We are overwriting an entry, cleanup previous domid if needed. */
+    check_cleanup_domid_map(d, prev_ctx, pdev, drhd->iommu);
+
+    pci_vtd_quirk(pdev);
+
+    return ret;
+}
+
+static int intel_iommu_add_devfn(struct domain *d, struct pci_dev *pdev,
+                                 u16 devfn, struct iommu_context *ctx)
+{
+    const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
+
+    if (!pdev || !drhd)
+        return -EINVAL;
+
+    return apply_context(d, ctx, pdev, devfn);
+}
+
+static int intel_iommu_remove_devfn(struct domain *d, struct pci_dev *pdev,
+                                    u16 devfn)
+{
+    const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
+
+    if (!pdev || !drhd)
+        return -EINVAL;
+
+    return unapply_context_single(d, drhd->iommu, pdev->bus, devfn);
+}
+
+static uint64_t intel_iommu_get_max_iova(struct domain *d)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+
+    return (1LLU << agaw_to_width(hd->arch.vtd.agaw)) - 1;
 }
 
 static const struct iommu_ops __initconst_cf_clobber vtd_ops = {
     .page_sizes = PAGE_SIZE_4K,
     .init = intel_iommu_domain_init,
     .hwdom_init = intel_iommu_hwdom_init,
-    .quarantine_init = intel_iommu_quarantine_init,
-    .add_device = intel_iommu_add_device,
+    .context_init = intel_iommu_context_init,
+    .context_teardown = intel_iommu_context_teardown,
+    .attach = intel_iommu_attach,
+    .detach = intel_iommu_detach,
+    .reattach = intel_iommu_reattach,
+    .add_devfn = intel_iommu_add_devfn,
+    .remove_devfn = intel_iommu_remove_devfn,
     .enable_device = intel_iommu_enable_device,
-    .remove_device = intel_iommu_remove_device,
-    .assign_device  = intel_iommu_assign_device,
     .teardown = iommu_domain_teardown,
     .clear_root_pgtable = iommu_clear_root_pgtable,
     .map_page = intel_iommu_map_page,
     .unmap_page = intel_iommu_unmap_page,
     .lookup_page = intel_iommu_lookup_page,
-    .reassign_device = reassign_device_ownership,
     .get_device_group_id = intel_iommu_group_id,
     .enable_x2apic = intel_iommu_enable_eim,
     .disable_x2apic = intel_iommu_disable_eim,
@@ -3269,6 +2814,7 @@ static const struct iommu_ops __initconst_cf_clobber vtd_ops = {
     .iotlb_flush = iommu_flush_iotlb,
     .get_reserved_device_memory = intel_iommu_get_reserved_device_memory,
     .dump_page_tables = vtd_dump_page_tables,
+    .get_max_iova = intel_iommu_get_max_iova,
 };
 
 const struct iommu_init_ops __initconstrel intel_iommu_init_ops = {
diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
index 950dcd56ef..568a1a06d5 100644
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -408,9 +408,8 @@ void __init platform_quirks_init(void)
 
 static int __must_check map_me_phantom_function(struct domain *domain,
                                                 unsigned int dev,
-                                                domid_t domid,
-                                                paddr_t pgd_maddr,
-                                                unsigned int mode)
+                                                unsigned int mode,
+                                                struct iommu_context *ctx)
 {
     struct acpi_drhd_unit *drhd;
     struct pci_dev *pdev;
@@ -422,18 +421,17 @@ static int __must_check map_me_phantom_function(struct domain *domain,
 
     /* map or unmap ME phantom function */
     if ( !(mode & UNMAP_ME_PHANTOM_FUNC) )
-        rc = domain_context_mapping_one(domain, drhd->iommu, 0,
-                                        PCI_DEVFN(dev, 7), NULL,
-                                        domid, pgd_maddr, mode);
+        rc = apply_context_single(domain, ctx, drhd->iommu, 0,
+                                  PCI_DEVFN(dev, 7));
     else
-        rc = domain_context_unmap_one(domain, drhd->iommu, 0,
-                                      PCI_DEVFN(dev, 7));
+        rc = unapply_context_single(domain, drhd->iommu, 0, PCI_DEVFN(dev, 7));
 
     return rc;
 }
 
 int me_wifi_quirk(struct domain *domain, uint8_t bus, uint8_t devfn,
-                  domid_t domid, paddr_t pgd_maddr, unsigned int mode)
+                  domid_t domid, unsigned int mode,
+                  struct iommu_context *ctx)
 {
     u32 id;
     int rc = 0;
@@ -457,7 +455,7 @@ int me_wifi_quirk(struct domain *domain, uint8_t bus, uint8_t devfn,
             case 0x423b8086:
             case 0x423c8086:
             case 0x423d8086:
-                rc = map_me_phantom_function(domain, 3, domid, pgd_maddr, mode);
+                rc = map_me_phantom_function(domain, 3, mode, ctx);
                 break;
             default:
                 break;
@@ -483,7 +481,7 @@ int me_wifi_quirk(struct domain *domain, uint8_t bus, uint8_t devfn,
             case 0x42388086:        /* Puma Peak */
             case 0x422b8086:
             case 0x422c8086:
-                rc = map_me_phantom_function(domain, 22, domid, pgd_maddr, mode);
+                rc = map_me_phantom_function(domain, 22, mode, ctx);
                 break;
             default:
                 break;
diff --git a/xen/drivers/passthrough/x86/Makefile b/xen/drivers/passthrough/x86/Makefile
index 75b2885336..1614f3d284 100644
--- a/xen/drivers/passthrough/x86/Makefile
+++ b/xen/drivers/passthrough/x86/Makefile
@@ -1,2 +1,3 @@
 obj-y += iommu.o
+obj-y += arena.o
 obj-$(CONFIG_HVM) += hvm.o
diff --git a/xen/drivers/passthrough/x86/arena.c b/xen/drivers/passthrough/x86/arena.c
new file mode 100644
index 0000000000..984bc4d643
--- /dev/null
+++ b/xen/drivers/passthrough/x86/arena.c
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/**
+ * Simple arena-based page allocator.
+ *
+ * Allocate a large block using alloc_domheam_pages and allocate single pages
+ * using iommu_arena_allocate_page and iommu_arena_free_page functions.
+ *
+ * Concurrent {allocate/free}_page is thread-safe
+ * iommu_arena_teardown during {allocate/free}_page is not thread-safe.
+ *
+ * Written by Teddy Astie <teddy.astie@vates.tech>
+ */
+
+#include <asm/bitops.h>
+#include <asm/page.h>
+#include <xen/atomic.h>
+#include <xen/bug.h>
+#include <xen/config.h>
+#include <xen/mm-frame.h>
+#include <xen/mm.h>
+#include <xen/xmalloc.h>
+
+#include <asm/arena.h>
+
+/* Maximum of scan tries if the bit found not available */
+#define ARENA_TSL_MAX_TRIES 5
+
+int iommu_arena_initialize(struct iommu_arena *arena, struct domain *d,
+                           unsigned int order, unsigned int memflags)
+{
+    struct page_info *page;
+
+    /* TODO: Maybe allocate differently ? */
+    page = alloc_domheap_pages(d, order, memflags);
+
+    if ( !page )
+        return -ENOMEM;
+
+    arena->map = xzalloc_array(unsigned long, BITS_TO_LONGS(1LLU << order));
+    arena->order = order;
+    arena->region_start = page_to_mfn(page);
+
+    _atomic_set(&arena->used_pages, 0);
+    bitmap_zero(arena->map, iommu_arena_size(arena));
+
+    printk(XENLOG_DEBUG "IOMMU: Allocated arena (%llu pages, start=%"PRI_mfn")\n",
+           iommu_arena_size(arena), mfn_x(arena->region_start));
+    return 0;
+}
+
+int iommu_arena_teardown(struct iommu_arena *arena, bool check)
+{
+    BUG_ON(mfn_x(arena->region_start) == 0);
+
+    /* Check for allocations if check is specified */
+    if ( check && (atomic_read(&arena->used_pages) > 0) )
+        return -EBUSY;
+
+    free_domheap_pages(mfn_to_page(arena->region_start), arena->order);
+
+    arena->region_start = _mfn(0);
+    _atomic_set(&arena->used_pages, 0);
+    xfree(arena->map);
+    arena->map = NULL;
+
+    return 0;
+}
+
+struct page_info *iommu_arena_allocate_page(struct iommu_arena *arena)
+{
+    unsigned int index;
+    unsigned int tsl_tries = 0;
+
+    BUG_ON(mfn_x(arena->region_start) == 0);
+
+    if ( atomic_read(&arena->used_pages) == iommu_arena_size(arena) )
+        /* All pages used */
+        return NULL;
+
+    do
+    {
+        index = find_first_zero_bit(arena->map, iommu_arena_size(arena));
+
+        if ( index >= iommu_arena_size(arena) )
+            /* No more free pages */
+            return NULL;
+
+        /*
+         * While there shouldn't be a lot of retries in practice, this loop
+         * *may* run indefinetly if the found bit is never free due to being
+         * overwriten by another CPU core right after. Add a safeguard for
+         * such very rare cases.
+         */
+        tsl_tries++;
+
+        if ( unlikely(tsl_tries == ARENA_TSL_MAX_TRIES) )
+        {
+            printk(XENLOG_ERR "ARENA: Too many TSL retries !");
+            return NULL;
+        }
+
+        /* Make sure that the bit we found is still free */
+    } while ( test_and_set_bit(index, arena->map) );
+
+    atomic_inc(&arena->used_pages);
+
+    return mfn_to_page(mfn_add(arena->region_start, index));
+}
+
+bool iommu_arena_free_page(struct iommu_arena *arena, struct page_info *page)
+{
+    unsigned long index;
+    mfn_t frame;
+
+    if ( !page )
+    {
+        printk(XENLOG_WARNING "IOMMU: Trying to free NULL page");
+        WARN();
+        return false;
+    }
+
+    frame = page_to_mfn(page);
+
+    /* Check if page belongs to our arena */
+    if ( (mfn_x(frame) < mfn_x(arena->region_start))
+        || (mfn_x(frame) >= (mfn_x(arena->region_start) + iommu_arena_size(arena))) )
+    {
+        printk(XENLOG_WARNING
+               "IOMMU: Trying to free outside arena region [mfn=%"PRI_mfn"]",
+               mfn_x(frame));
+        WARN();
+        return false;
+    }
+
+    index = mfn_x(frame) - mfn_x(arena->region_start);
+
+    /* Sanity check in case of underflow. */
+    ASSERT(index < iommu_arena_size(arena));
+
+    if ( !test_and_clear_bit(index, arena->map) )
+    {
+        /*
+         * Bit was free during our arena_free_page, which means that
+         * either this page was never allocated, or we are in a double-free
+         * situation.
+         */
+        printk(XENLOG_WARNING
+               "IOMMU: Freeing non-allocated region (double-free?) [mfn=%"PRI_mfn"]",
+               mfn_x(frame));
+        WARN();
+        return false;
+    }
+
+    atomic_dec(&arena->used_pages);
+
+    return true;
+}
\ No newline at end of file
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 8b1e0596b8..849f57c1ce 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -12,6 +12,12 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/keyhandler.h>
+#include <xen/lib.h>
+#include <xen/pci.h>
+#include <xen/bitmap.h>
+#include <xen/list.h>
+#include <xen/mm.h>
 #include <xen/cpu.h>
 #include <xen/sched.h>
 #include <xen/iocap.h>
@@ -28,6 +34,10 @@
 #include <asm/mem_paging.h>
 #include <asm/pt-contig-markers.h>
 #include <asm/setup.h>
+#include <asm/iommu.h>
+#include <asm/arena.h>
+#include <asm/page.h>
+#include <asm/p2m.h>
 
 const struct iommu_init_ops *__initdata iommu_init_ops;
 struct iommu_ops __ro_after_init iommu_ops;
@@ -183,19 +193,66 @@ void __hwdom_init arch_iommu_check_autotranslated_hwdom(struct domain *d)
         panic("PVH hardware domain iommu must be set in 'strict' mode\n");
 }
 
-int arch_iommu_domain_init(struct domain *d)
+int arch_iommu_context_init(struct domain *d, struct iommu_context *ctx, u32 flags)
+{
+    INIT_PAGE_LIST_HEAD(&ctx->arch.pgtables);
+    INIT_PAGE_LIST_HEAD(&ctx->arch.free_queue);
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
+
+    return 0;
+}
+
+int arch_iommu_flush_free_queue(struct domain *d, struct iommu_context *ctx)
+{
+    struct page_info *pg;
+    struct domain_iommu *hd = dom_iommu(d);
+
+    while ( (pg = page_list_remove_head(&ctx->arch.free_queue)) )
+        iommu_arena_free_page(&hd->arch.pt_arena, pg);
+
+    return 0;
+}
+
+int arch_iommu_pviommu_init(struct domain *d, uint16_t nb_ctx, uint32_t arena_order)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+
+    if ( arena_order == 0 )
+        return 0;
+
+    return iommu_arena_initialize(&hd->arch.pt_arena, NULL, arena_order, 0);
+}
+
+int arch_iommu_pviommu_teardown(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
 
-    spin_lock_init(&hd->arch.mapping_lock);
+    if ( iommu_arena_teardown(&hd->arch.pt_arena, true) )
+    {
+        printk(XENLOG_WARNING "IOMMU Arena used while being destroyed\n");
+        WARN();
 
-    INIT_PAGE_LIST_HEAD(&hd->arch.pgtables.list);
-    spin_lock_init(&hd->arch.pgtables.lock);
-    INIT_LIST_HEAD(&hd->arch.identity_maps);
+        /* Teardown anyway */
+        iommu_arena_teardown(&hd->arch.pt_arena, false);
+    }
 
     return 0;
 }
 
+int arch_iommu_domain_init(struct domain *d)
+{
+    return 0;
+}
+
 void arch_iommu_domain_destroy(struct domain *d)
 {
     /*
@@ -203,8 +260,9 @@ void arch_iommu_domain_destroy(struct domain *d)
      * domain is destroyed. Note that arch_iommu_domain_destroy() is
      * called unconditionally, so pgtables may be uninitialized.
      */
-    ASSERT(!dom_iommu(d)->platform_ops ||
-           page_list_empty(&dom_iommu(d)->arch.pgtables.list));
+    struct domain_iommu *hd = dom_iommu(d);
+
+    ASSERT(!hd->platform_ops);
 }
 
 struct identity_map {
@@ -214,32 +272,104 @@ struct identity_map {
     unsigned int count;
 };
 
-int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
-                           paddr_t base, paddr_t end,
+static int unmap_identity_region(struct domain *d, struct iommu_context *ctx,
+                                 unsigned int base_pfn, unsigned int end_pfn)
+{
+    int ret = 0;
+
+    if ( ctx->arch.hap_context )
+    {
+        this_cpu(iommu_dont_flush_iotlb) = true;
+        while ( base_pfn < end_pfn )
+        {
+            if ( p2m_remove_identity_entry(d, base_pfn) )
+                ret = -ENXIO;
+
+            base_pfn++;
+        }
+        this_cpu(iommu_dont_flush_iotlb) = false;
+    }
+    else
+    {
+        size_t page_count = end_pfn - base_pfn + 1;
+        unsigned int flush_flags;
+
+        ret = iommu_unmap(d, _dfn(base_pfn), page_count, 0, &flush_flags,
+                          ctx->id);
+
+        if ( ret )
+            return ret;
+
+        ret = iommu_iotlb_flush(d, _dfn(base_pfn), page_count,
+                                flush_flags, ctx->id);
+    }
+
+    return ret;
+}
+
+static int map_identity_region(struct domain *d, struct iommu_context *ctx,
+                               unsigned int base_pfn, unsigned int end_pfn,
+                               p2m_access_t p2ma, unsigned int flag)
+{
+    int ret = 0;
+    unsigned int flush_flags = 0;
+    size_t page_count = end_pfn - base_pfn + 1;
+
+    if ( ctx->arch.hap_context )
+    {
+        this_cpu(iommu_dont_flush_iotlb) = true;
+        while ( base_pfn < end_pfn )
+        {
+            ret = p2m_add_identity_entry(d, base_pfn, p2ma, flag);
+
+            if ( ret )
+            {
+                this_cpu(iommu_dont_flush_iotlb) = false;
+                return ret;
+            }
+
+            base_pfn++;
+        }
+        this_cpu(iommu_dont_flush_iotlb) = false;
+    }
+    else
+    {
+        ret = iommu_map(d, _dfn(base_pfn), _mfn(base_pfn), page_count,
+                        p2m_access_to_iommu_flags(p2ma), &flush_flags,
+                        ctx->id);
+
+        if ( ret )
+            return ret;
+    }
+
+    ret = iommu_iotlb_flush(d, _dfn(base_pfn), page_count, flush_flags,
+                            ctx->id);
+
+    return ret;
+}
+
+/* p2m_access_x removes the mapping */
+int iommu_identity_mapping(struct domain *d, struct iommu_context *ctx,
+                           p2m_access_t p2ma, paddr_t base, paddr_t end,
                            unsigned int flag)
 {
     unsigned long base_pfn = base >> PAGE_SHIFT_4K;
     unsigned long end_pfn = PAGE_ALIGN_4K(end) >> PAGE_SHIFT_4K;
     struct identity_map *map;
-    struct domain_iommu *hd = dom_iommu(d);
+    int ret = 0;
 
     ASSERT(pcidevs_locked());
     ASSERT(base < end);
 
-    /*
-     * No need to acquire hd->arch.mapping_lock: Both insertion and removal
-     * get done while holding pcidevs_lock.
-     */
-    list_for_each_entry( map, &hd->arch.identity_maps, list )
+    list_for_each_entry( map, &ctx->arch.identity_maps, list )
     {
         if ( map->base == base && map->end == end )
         {
-            int ret = 0;
-
             if ( p2ma != p2m_access_x )
             {
                 if ( map->access != p2ma )
                     return -EADDRINUSE;
+
                 ++map->count;
                 return 0;
             }
@@ -247,12 +377,9 @@ int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
             if ( --map->count )
                 return 0;
 
-            while ( base_pfn < end_pfn )
-            {
-                if ( clear_identity_p2m_entry(d, base_pfn) )
-                    ret = -ENXIO;
-                base_pfn++;
-            }
+            printk("Unmapping [%"PRI_mfn"x:%"PRI_mfn"] for d%dc%d\n", base_pfn, end_pfn,
+                   d->domain_id, ctx->id);
+            ret = unmap_identity_region(d, ctx, base_pfn, end_pfn);
 
             list_del(&map->list);
             xfree(map);
@@ -271,47 +398,43 @@ int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
     if ( !map )
         return -ENOMEM;
 
-    map->base = base;
-    map->end = end;
-    map->access = p2ma;
-    map->count = 1;
-
-    /*
-     * Insert into list ahead of mapping, so the range can be found when
-     * trying to clean up.
-     */
-    list_add_tail(&map->list, &hd->arch.identity_maps);
+    printk("Mapping [%"PRI_mfn"x:%"PRI_mfn"] for d%dc%d\n", base_pfn, end_pfn,
+           d->domain_id, ctx->id);
+    ret = map_identity_region(d, ctx, base_pfn, end_pfn, p2ma, flag);
 
-    for ( ; base_pfn < end_pfn; ++base_pfn )
+    if ( ret )
     {
-        int err = set_identity_p2m_entry(d, base_pfn, p2ma, flag);
-
-        if ( !err )
-            continue;
-
-        if ( (map->base >> PAGE_SHIFT_4K) == base_pfn )
-        {
-            list_del(&map->list);
-            xfree(map);
-        }
-        return err;
+        xfree(map);
+        return ret;
     }
 
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
     }
 }
 
+bool iommu_identity_map_check(struct domain *d, struct iommu_context *ctx,
+                              mfn_t mfn)
+{
+    struct identity_map *map;
+    uint64_t addr = pfn_to_paddr(mfn_x(mfn));
+
+    list_for_each_entry ( map, &ctx->arch.identity_maps, list )
+        if (addr >= map->base && addr < map->end)
+            return true;
+
+    return false;
+}
+
 static int __hwdom_init cf_check map_subtract(unsigned long s, unsigned long e,
                                               void *data)
 {
@@ -369,7 +492,7 @@ static int __hwdom_init cf_check identity_map(unsigned long s, unsigned long e,
             if ( iomem_access_permitted(d, s, s) )
             {
                 rc = iommu_map(d, _dfn(s), _mfn(s), 1, perms,
-                               &info->flush_flags);
+                               &info->flush_flags, 0);
                 if ( rc < 0 )
                     break;
                 /* Must map a frame at least, which is what we request for. */
@@ -379,7 +502,7 @@ static int __hwdom_init cf_check identity_map(unsigned long s, unsigned long e,
             s++;
         }
         while ( (rc = iommu_map(d, _dfn(s), _mfn(s), e - s + 1,
-                                perms, &info->flush_flags)) > 0 )
+                                perms, &info->flush_flags, 0)) > 0 )
         {
             s += rc;
             process_pending_softirqs();
@@ -408,6 +531,10 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
     if ( iommu_hwdom_reserved == -1 )
         iommu_hwdom_reserved = 1;
 
+    if ( iommu_hwdom_no_dma )
+        /* Skip special mappings with no-dma mode */
+        return;
+
     if ( iommu_hwdom_inclusive )
     {
         printk(XENLOG_WARNING
@@ -545,7 +672,6 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 
 void arch_pci_init_pdev(struct pci_dev *pdev)
 {
-    pdev->arch.pseudo_domid = DOMID_INVALID;
 }
 
 unsigned long *__init iommu_init_domid(domid_t reserve)
@@ -576,8 +702,6 @@ domid_t iommu_alloc_domid(unsigned long *map)
     static unsigned int start;
     unsigned int idx = find_next_zero_bit(map, UINT16_MAX - DOMID_MASK, start);
 
-    ASSERT(pcidevs_locked());
-
     if ( idx >= UINT16_MAX - DOMID_MASK )
         idx = find_first_zero_bit(map, UINT16_MAX - DOMID_MASK);
     if ( idx >= UINT16_MAX - DOMID_MASK )
@@ -603,7 +727,7 @@ void iommu_free_domid(domid_t domid, unsigned long *map)
         BUG();
 }
 
-int iommu_free_pgtables(struct domain *d)
+int iommu_free_pgtables(struct domain *d, struct iommu_context *ctx)
 {
     struct domain_iommu *hd = dom_iommu(d);
     struct page_info *pg;
@@ -612,18 +736,18 @@ int iommu_free_pgtables(struct domain *d)
     if ( !is_iommu_enabled(d) )
         return 0;
 
-    /* After this barrier, no new IOMMU mappings can be inserted. */
-    spin_barrier(&hd->arch.mapping_lock);
-
     /*
      * Pages will be moved to the free list below. So we want to
      * clear the root page-table to avoid any potential use after-free.
      */
-    iommu_vcall(hd->platform_ops, clear_root_pgtable, d);
+    iommu_vcall(hd->platform_ops, clear_root_pgtable, d, ctx);
 
-    while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
+    while ( (pg = page_list_remove_head(&ctx->arch.pgtables)) )
     {
-        free_domheap_page(pg);
+        if (ctx->id == 0)
+            free_domheap_page(pg);
+        else
+            iommu_arena_free_page(&hd->arch.pt_arena, pg);
 
         if ( !(++done & 0xff) && general_preempt_check() )
             return -ERESTART;
@@ -633,6 +757,7 @@ int iommu_free_pgtables(struct domain *d)
 }
 
 struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
+                                      struct iommu_context *ctx,
                                       uint64_t contig_mask)
 {
     unsigned int memflags = 0;
@@ -644,7 +769,11 @@ struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
         memflags = MEMF_node(hd->node);
 #endif
 
-    pg = alloc_domheap_page(NULL, memflags);
+    if (ctx->id == 0)
+        pg = alloc_domheap_page(NULL, memflags);
+    else
+        pg = iommu_arena_allocate_page(&hd->arch.pt_arena);
+
     if ( !pg )
         return NULL;
 
@@ -677,9 +806,7 @@ struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
 
     unmap_domain_page(p);
 
-    spin_lock(&hd->arch.pgtables.lock);
-    page_list_add(pg, &hd->arch.pgtables.list);
-    spin_unlock(&hd->arch.pgtables.lock);
+    page_list_add(pg, &ctx->arch.pgtables);
 
     return pg;
 }
@@ -718,17 +845,20 @@ static void cf_check free_queued_pgtables(void *arg)
     }
 }
 
-void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg)
+void iommu_queue_free_pgtable(struct iommu_context *ctx, struct page_info *pg)
 {
     unsigned int cpu = smp_processor_id();
 
-    spin_lock(&hd->arch.pgtables.lock);
-    page_list_del(pg, &hd->arch.pgtables.list);
-    spin_unlock(&hd->arch.pgtables.lock);
+    page_list_del(pg, &ctx->arch.pgtables);
 
-    page_list_add_tail(pg, &per_cpu(free_pgt_list, cpu));
+    if ( !ctx->id )
+    {
+        page_list_add_tail(pg, &per_cpu(free_pgt_list, cpu));
 
-    tasklet_schedule(&per_cpu(free_pgt_tasklet, cpu));
+        tasklet_schedule(&per_cpu(free_pgt_tasklet, cpu));
+    }
+    else
+        page_list_add_tail(pg, &ctx->arch.free_queue);
 }
 
 static int cf_check cpu_callback(
-- 
2.45.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

