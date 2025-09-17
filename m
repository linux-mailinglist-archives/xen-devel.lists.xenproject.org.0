Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3B0B820B1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 23:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125586.1467526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08A-00009Q-7n; Wed, 17 Sep 2025 21:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125586.1467526; Wed, 17 Sep 2025 21:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08A-00006M-2T; Wed, 17 Sep 2025 21:56:02 +0000
Received: by outflank-mailman (input) for mailman id 1125586;
 Wed, 17 Sep 2025 21:56:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz088-0007Lu-BM
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:56:00 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17d37a5c-9411-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 23:55:59 +0200 (CEST)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2680cf68265so2365365ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:55:59 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:55:56 -0700 (PDT)
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
X-Inumbo-ID: 17d37a5c-9411-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146157; x=1758750957; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KISvI+cSCGQuBbffB7BgGhIGyaXm3yteTEaBjxd0dvw=;
        b=hwc+KA/djX59hShLamXAJ8W1Ym6pcbUSk8vGcRXAleDHdbfFtdjWllZjEV5+7M3fXi
         MQ/u4unguCblMIZkdArAXBFPXppvp4E8cInf6H3han5j7A8vR2MqaQdSF8WPn/XIwBfK
         t1Xj83sBKcxFxG6QT/9yHnuM9BK40Dp7UpdeZQdtOdz4/RYJzIAir6MRz5/+uZZeFGCA
         l95xvLGrP2de9q8b2BP7pBtio5M5B4edarT7m4YRr6F3Fl2Wgyjd8n62GK+EQXHRIFmK
         e2qLHLRvjGc8d8IEDcOJc9bLoFbbmLQC8n4Qz5onMva7RuIcgrOTY4IMt5So9UZ4mVpz
         BXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146157; x=1758750957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KISvI+cSCGQuBbffB7BgGhIGyaXm3yteTEaBjxd0dvw=;
        b=I5AlVK4R4XRDJQOcFjrEMl7GqCT5sWxndAlzuDbOWwpgI9aCLPk+wiOBYlwIyAeuK+
         V1Vnvnu+KxmMm/uink3d/4g8RtPxvddR5mj+LVWNFMhxFLPzNBas+w7JQzqYYwBdhkcA
         kMrQffeJum6zuVxayOPbYg/XxaeBrgRTL00XXess1FkUukirIZ6DDnchMgdlFnPIm6AN
         IyBVcroZL9WG435+lIobjAkFyeK4ZfVyWLi7e+/uLnAADZrwSwo2TiD7g7MesVHorwY/
         kdFPhI4nOZf4O7HQXkkcdXChyjo3noSqCuNnIfb4UlsrTIMLl1kMKx/LBLtrcMRgQo/1
         yKIw==
X-Gm-Message-State: AOJu0YzV9eOzuSWltj2HcBDlGh/HRncGDF7K3gfZNZG4jzRD7Dj1zK8F
	SnRH9VdVa44GkC++W+DodblAJxmrL4CIFY7+Jmd/Gc9hxoP+7Tai3C7hzD0Bth5feDs=
X-Gm-Gg: ASbGncvPH5Cw7jgGvwZR+I6T9ClI0ZIKWPInDM6johiTHaN3b4rEMpYgYNI4Nr5RMmO
	6ApyDgnJt1w52iephm2aEayHdyDRzTLtUUyqSc4pL6jRH3PEKl0LaM9kT8wp+6FluoPLB0/PcD4
	/g054Xr1hVmqLzG0v2Itz+Pjd0H+5LOn7jK40qwU/8/+aRWxM6bQ6laujXMEw+Gy5BsyLxO794J
	Pov1tJsEhP7dbzdNwAOS4b6xcWNxUZXJ6j6Dkc+5YN7xiGFtsBWZncozQP9DV4CNTcj1lgKvkiN
	3U2P0aCJZWITehRtFX5Wwz/a0mvacG3pCdO7A2RgsF+rVuYZlO4jCgHl1nSfe8E8mVUT/dbbCTc
	O1lJhgZWpcZ2poJYX6y5VySXpHZlSUweyAnH1pt2vKus3XXtLk13qYrk=
X-Google-Smtp-Source: AGHT+IH7EiuupKV2fG/SCMRtQtoVRqq5BxwZOQlRResiuZUa4MT3z9f4dMDqxoKUMA4xzS3nbJZfTA==
X-Received: by 2002:a17:902:ec86:b0:24c:7b94:2f53 with SMTP id d9443c01a7336-268119b8394mr52036305ad.6.1758146157270;
        Wed, 17 Sep 2025 14:55:57 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 05/18] xen/riscv: add root page table allocation
Date: Wed, 17 Sep 2025 23:55:25 +0200
Message-ID: <2b636ea03bf82cae50df87d525e3f58b68f16cb2.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758145428.git.oleksii.kurochko@gmail.com>
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce support for allocating and initializing the root page table
required for RISC-V stage-2 address translation.

To implement root page table allocation the following is introduced:
- p2m_get_clean_page() and p2m_alloc_root_table(), p2m_allocate_root()
  helpers to allocate and zero a 16 KiB root page table, as mandated
  by the RISC-V privileged specification for Sv32x4/Sv39x4/Sv48x4/Sv57x4
  modes.
- Update p2m_init() to inititialize p2m_root_order.
- Add maddr_to_page() and page_to_maddr() macros for easier address
  manipulation.
- Introduce paging_ret_pages_to_domheap() to return some pages before
  allocate 16 KiB pages for root page table.
- Allocate root p2m table after p2m pool is initialized.
- Add construct_hgatp() to construct the hgatp register value based on
  p2m->root, p2m->hgatp_mode and VMID.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - Drop hgatp_mode from p2m_domain as gstage_mode was introduced and
   initlialized earlier patch. So use gstage_mode instead.
 - s/GUEST_ROOT_PAGE_TABLE_SIZE/GSTAGE_ROOT_PAGE_TABLE_SIZE.
 - Drop p2m_root_order and re-define P2M_ROOT_ORDER:
     #define P2M_ROOT_ORDER  (ilog2(GSTAGE_ROOT_PAGE_TABLE_SIZE) - PAGE_SHIFT)
 - Update implementation of construct_hgatp(): use introduced gstage_mode
   and use MASK_INSRT() to construct ppn value.
 - Drop nr_root_pages variable inside p2m_alloc_root_table().
 - Update the printk's message inside paging_ret_pages_to_domheap().
 - Add an introduction of clean_pte member of p2m_domain structure to this
   patch as it is started to be used here.
   Rename clean_pte to clean_dcache.
 - Drop p2m_allocate_root() function as it is going to be used only in one
   place.
 - Propogate rc from p2m_alloc_root_table() in p2m_set_allocation().
 - Return P2M_ROOT_PAGES to freelist in case of allocation of root page
   table failed.
 - Add allocated root tables pages to p2m->pages pool so a usage of pages
   could be properly taken into account.
---
Changes in v3:
 - Drop insterting of p2m->vmid in hgatp_from_page() as now vmid is allocated
   per-CPU, not per-domain, so it will be inserted later somewhere in
   context_switch or before returning control to a guest.
 - use BIT() to init nr_pages in p2m_allocate_root() instead of open-code
   BIT() macros.
 - Fix order in clear_and_clean_page().
 - s/panic("Specify more xen,domain-p2m-mem-mb\n")/return NULL.
 - Use lock around a procedure of returning back pages necessary for p2m
   root table.
 - Update the comment about allocation of page for root page table.
 - Update an argument of hgatp_from_page() to "struct page_info *p2m_root_page"
   to be consistent with the  function name.
 - Use p2m_get_hostp2m(d) instead of open-coding it.
 - Update the comment above the call of p2m_alloc_root_table().
 - Update the comments in p2m_allocate_root().
 - Move part which returns some page to domheap before root page table allocation
   to paging.c.
 - Pass p2m_domain * instead of struct domain * for p2m_alloc_root_table().
 - Introduce construct_hgatp() instead of hgatp_from_page().
 - Add vmid and hgatp_mode member of struct p2m_domain.
 - Add explanatory comment above clean_dcache_va_range() in
   clear_and_clean_page().
 - Introduce P2M_ROOT_ORDER and P2M_ROOT_PAGES.
 - Drop vmid member from p2m_domain as now we are using per-pCPU
   VMID allocation.
 - Update a declaration of construct_hgatp() to recieve VMID as it
   isn't per-VM anymore.
 - Drop hgatp member of p2m_domain struct as with the new VMID scheme
   allocation construction of hgatp will be needed more often.
 - Drop is_hardware_domain() case in p2m_allocate_root(), just always
   allocate root using p2m pool pages.
 - Refactor p2m_alloc_root_table() and p2m_alloc_table().
---
Changes in v2:
 - This patch was created from "xen/riscv: introduce things necessary for p2m
   initialization" with the following changes:
   - [clear_and_clean_page()] Add missed call of clean_dcache_va_range().
   - Drop p2m_get_clean_page() as it is going to be used only once to allocate
     root page table. Open-code it explicittly in p2m_allocate_root(). Also,
     it will help avoid duplication of the code connected to order and nr_pages
     of p2m root page table.
   - Instead of using order 2 for alloc_domheap_pages(), use
     get_order_from_bytes(KB(16)).
   - Clear and clean a proper amount of allocated pages in p2m_allocate_root().
   - Drop _info from the function name hgatp_from_page_info() and its argument
     page_info.
   - Introduce HGATP_MODE_MASK and use MASK_INSR() instead of shift to calculate
     value of hgatp.
   - Drop unnecessary parentheses in definition of page_to_maddr().
   - Add support of VMID.
   - Drop TLB flushing in p2m_alloc_root_table() and do that once when VMID
     is re-used. [Look at p2m_alloc_vmid()]
   - Allocate p2m root table after p2m pool is fully initialized: first
     return pages to p2m pool them allocate p2m root table.
---
 xen/arch/riscv/include/asm/mm.h             |   4 +
 xen/arch/riscv/include/asm/p2m.h            |  15 +++
 xen/arch/riscv/include/asm/paging.h         |   3 +
 xen/arch/riscv/include/asm/riscv_encoding.h |   2 +
 xen/arch/riscv/p2m.c                        |  90 +++++++++++++++-
 xen/arch/riscv/paging.c                     | 108 +++++++++++++++-----
 6 files changed, 193 insertions(+), 29 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 9283616c02..dd8cdc9782 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -167,6 +167,10 @@ extern struct page_info *frametable_virt_start;
 #define mfn_to_page(mfn)    (frametable_virt_start + mfn_x(mfn))
 #define page_to_mfn(pg)     _mfn((pg) - frametable_virt_start)
 
+/* Convert between machine addresses and page-info structures. */
+#define maddr_to_page(ma) mfn_to_page(maddr_to_mfn(ma))
+#define page_to_maddr(pg) mfn_to_maddr(page_to_mfn(pg))
+
 static inline void *page_to_virt(const struct page_info *pg)
 {
     return mfn_to_virt(mfn_x(page_to_mfn(pg)));
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 2672dcdecb..7b263cb354 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -2,6 +2,7 @@
 #ifndef ASM__RISCV__P2M_H
 #define ASM__RISCV__P2M_H
 
+#include <xen/bitops.h>
 #include <xen/errno.h>
 #include <xen/mm.h>
 #include <xen/rwlock.h>
@@ -11,6 +12,9 @@
 
 extern unsigned long gstage_mode;
 
+#define P2M_ROOT_ORDER  (ilog2(GSTAGE_ROOT_PAGE_TABLE_SIZE) - PAGE_SHIFT)
+#define P2M_ROOT_PAGES  BIT(P2M_ROOT_ORDER, U)
+
 #define paddr_bits PADDR_BITS
 
 /* Get host p2m table */
@@ -26,6 +30,9 @@ struct p2m_domain {
     /* Pages used to construct the p2m */
     struct page_list_head pages;
 
+    /* The root of the p2m tree. May be concatenated */
+    struct page_info *root;
+
     /* Back pointer to domain */
     struct domain *domain;
 
@@ -39,6 +46,12 @@ struct p2m_domain {
      * shattered), call p2m_tlb_flush_sync().
      */
     bool need_flush;
+
+    /*
+     * Indicate if it is required to clean the cache when writing an entry or
+     * when a page is needed to be fully cleared and cleaned.
+     */
+    bool clean_dcache;
 };
 
 /*
@@ -125,6 +138,8 @@ void gstage_mode_detect(void);
 
 int p2m_init(struct domain *d);
 
+unsigned long construct_hgatp(struct p2m_domain *p2m, uint16_t vmid);
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/include/asm/paging.h b/xen/arch/riscv/include/asm/paging.h
index 98d8b06d45..befad14f82 100644
--- a/xen/arch/riscv/include/asm/paging.h
+++ b/xen/arch/riscv/include/asm/paging.h
@@ -10,4 +10,7 @@ int paging_domain_init(struct domain *d);
 int paging_freelist_adjust(struct domain *d, unsigned long pages,
                            bool *preempted);
 
+int paging_ret_pages_to_domheap(struct domain *d, unsigned int nr_pages);
+int paging_ret_pages_to_freelist(struct domain *d, unsigned int nr_pages);
+
 #endif /* ASM_RISCV_PAGING_H */
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index b15f5ad0b4..8890b903e1 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -188,6 +188,8 @@
 #define HGATP_MODE_MASK			HGATP32_MODE_MASK
 #endif
 
+#define GSTAGE_ROOT_PAGE_TABLE_SIZE	KB(16)
+
 #define TOPI_IID_SHIFT			16
 #define TOPI_IID_MASK			0xfff
 #define TOPI_IPRIO_MASK		0xff
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index dc0f2b2a23..ad0478f155 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -3,6 +3,7 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/macros.h>
+#include <xen/domain_page.h>
 #include <xen/mm.h>
 #include <xen/paging.h>
 #include <xen/rwlock.h>
@@ -95,6 +96,70 @@ void __init gstage_mode_detect(void)
     local_hfence_gvma_all();
 }
 
+static void clear_and_clean_page(struct page_info *page, bool clean_dcache)
+{
+    clear_domain_page(page_to_mfn(page));
+
+    /*
+     * If the IOMMU doesn't support coherent walks and the p2m tables are
+     * shared between the CPU and IOMMU, it is necessary to clean the
+     * d-cache.
+     */
+    if ( clean_dcache )
+        clean_dcache_va_range(page, PAGE_SIZE);
+}
+
+unsigned long construct_hgatp(struct p2m_domain *p2m, uint16_t vmid)
+{
+    return MASK_INSR(mfn_x(page_to_mfn(p2m->root)), HGATP_PPN) |
+           MASK_INSR(gstage_mode, HGATP_MODE_MASK) |
+           MASK_INSR(vmid, HGATP_VMID_MASK);
+}
+
+static int p2m_alloc_root_table(struct p2m_domain *p2m)
+{
+    struct domain *d = p2m->domain;
+    struct page_info *page;
+    int rc;
+
+    /*
+     * Return back P2M_ROOT_PAGES to assure the root table memory is also
+     * accounted against the P2M pool of the domain.
+     */
+    if ( (rc = paging_ret_pages_to_domheap(d, P2M_ROOT_PAGES)) )
+        return rc;
+
+    /*
+     * As mentioned in the Priviliged Architecture Spec (version 20240411)
+     * in Section 18.5.1, for the paged virtual-memory schemes  (Sv32x4,
+     * Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB and must
+     * be aligned to a 16-KiB boundary.
+     */
+    page = alloc_domheap_pages(d, P2M_ROOT_ORDER, MEMF_no_owner);
+    if ( !page )
+    {
+        /*
+         * If allocation of root table pages fails, the pages acquired above
+         * must be returned to the freelist to maintain proper freelist
+         * balance.
+         */
+        paging_ret_pages_to_freelist(d, P2M_ROOT_PAGES);
+
+        return -ENOMEM;
+    }
+
+    for ( unsigned int i = 0; i < P2M_ROOT_PAGES; i++ )
+    {
+        clear_and_clean_page(page + i, p2m->clean_dcache);
+
+        page_list_add(page + i, &p2m->pages);
+    }
+
+    p2m->root = page;
+
+    return 0;
+}
+
 int p2m_init(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
@@ -110,6 +175,19 @@ int p2m_init(struct domain *d)
     rwlock_init(&p2m->lock);
     INIT_PAGE_LIST_HEAD(&p2m->pages);
 
+    /*
+     * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
+     * is not ready for RISC-V support.
+     *
+     * When CONFIG_HAS_PASSTHROUGH=y, p2m->clean_dcache must be properly
+     * initialized.
+     * At the moment, it defaults to false because the p2m structure is
+     * zero-initialized.
+     */
+#ifdef CONFIG_HAS_PASSTHROUGH
+#   error "Add init of p2m->clean_dcache"
+#endif
+
     return 0;
 }
 
@@ -120,10 +198,20 @@ int p2m_init(struct domain *d)
  */
 int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
 {
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc;
 
     if ( (rc = paging_freelist_adjust(d, pages, preempted)) )
         return rc;
 
-    return 0;
+    /*
+     * First, initialize p2m pool. Then allocate the root
+     * table so that the necessary pages can be returned from the p2m pool,
+     * since the root table must be allocated using alloc_domheap_pages(...)
+     * to meet its specific requirements.
+     */
+    if ( !p2m->root )
+        rc = p2m_alloc_root_table(p2m);
+
+    return rc;
 }
diff --git a/xen/arch/riscv/paging.c b/xen/arch/riscv/paging.c
index 2df8de033b..ed537fee07 100644
--- a/xen/arch/riscv/paging.c
+++ b/xen/arch/riscv/paging.c
@@ -4,46 +4,67 @@
 #include <xen/sched.h>
 #include <xen/spinlock.h>
 
+static int paging_ret_page_to_domheap(struct domain *d)
+{
+    struct page_info *page;
+
+    ASSERT(spin_is_locked(&d->arch.paging.lock));
+
+    /* Return memory to domheap. */
+    page = page_list_remove_head(&d->arch.paging.freelist);
+    if( page )
+    {
+        ACCESS_ONCE(d->arch.paging.total_pages)--;
+        free_domheap_page(page);
+    }
+    else
+    {
+        printk(XENLOG_ERR
+                "Failed to free P2M pages, P2M freelist is empty.\n");
+        return -ENOMEM;
+    }
+
+    return 0;
+}
+
+static int paging_ret_page_to_freelist(struct domain *d)
+{
+    struct page_info *page;
+
+    ASSERT(spin_is_locked(&d->arch.paging.lock));
+
+    /* Need to allocate more memory from domheap */
+    page = alloc_domheap_page(d, MEMF_no_owner);
+    if ( page == NULL )
+    {
+        printk(XENLOG_ERR "Failed to allocate pages.\n");
+        return -ENOMEM;
+    }
+    ACCESS_ONCE(d->arch.paging.total_pages)++;
+    page_list_add_tail(page, &d->arch.paging.freelist);
+
+    return 0;
+}
+
 int paging_freelist_adjust(struct domain *d, unsigned long pages,
                            bool *preempted)
 {
-    struct page_info *pg;
-
     ASSERT(spin_is_locked(&d->arch.paging.lock));
 
     for ( ; ; )
     {
+        int rc = 0;
+
         if ( d->arch.paging.total_pages < pages )
-        {
-            /* Need to allocate more memory from domheap */
-            pg = alloc_domheap_page(d, MEMF_no_owner);
-            if ( pg == NULL )
-            {
-                printk(XENLOG_ERR "Failed to allocate pages.\n");
-                return -ENOMEM;
-            }
-            ACCESS_ONCE(d->arch.paging.total_pages)++;
-            page_list_add_tail(pg, &d->arch.paging.freelist);
-        }
+            rc = paging_ret_page_to_freelist(d);
         else if ( d->arch.paging.total_pages > pages )
-        {
-            /* Need to return memory to domheap */
-            pg = page_list_remove_head(&d->arch.paging.freelist);
-            if ( pg )
-            {
-                ACCESS_ONCE(d->arch.paging.total_pages)--;
-                free_domheap_page(pg);
-            }
-            else
-            {
-                printk(XENLOG_ERR
-                       "Failed to free pages, freelist is empty.\n");
-                return -ENOMEM;
-            }
-        }
+            rc = paging_ret_page_to_domheap(d);
         else
             break;
 
+        if ( rc )
+            return rc;
+
         /* Check to see if we need to yield and try again */
         if ( preempted && general_preempt_check() )
         {
@@ -55,6 +76,37 @@ int paging_freelist_adjust(struct domain *d, unsigned long pages,
     return 0;
 }
 
+int paging_ret_pages_to_freelist(struct domain *d, unsigned int nr_pages)
+{
+    ASSERT(spin_is_locked(&d->arch.paging.lock));
+
+    for ( unsigned int i = 0; i < nr_pages; i++ )
+    {
+        int rc = paging_ret_page_to_freelist(d);
+        if ( rc )
+            return rc;
+    }
+
+    return 0;
+}
+
+int paging_ret_pages_to_domheap(struct domain *d, unsigned int nr_pages)
+{
+    ASSERT(spin_is_locked(&d->arch.paging.lock));
+
+    if ( ACCESS_ONCE(d->arch.paging.total_pages) < nr_pages )
+        return false;
+
+    for ( unsigned int i = 0; i < nr_pages; i++ )
+    {
+        int rc = paging_ret_page_to_domheap(d);
+        if ( rc )
+            return rc;
+    }
+
+    return 0;
+}
+
 /* Domain paging struct initialization. */
 int paging_domain_init(struct domain *d)
 {
-- 
2.51.0


