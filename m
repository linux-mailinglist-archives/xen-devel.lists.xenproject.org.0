Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D20BF2400
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146535.1478996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH5-0005nW-Sf; Mon, 20 Oct 2025 15:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146535.1478996; Mon, 20 Oct 2025 15:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH5-0005fh-Iz; Mon, 20 Oct 2025 15:58:19 +0000
Received: by outflank-mailman (input) for mailman id 1146535;
 Mon, 20 Oct 2025 15:58:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsH3-0004DQ-DH
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:17 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 970d4cf2-adcd-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 17:58:16 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-63c4b41b38cso5340706a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:16 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:15 -0700 (PDT)
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
X-Inumbo-ID: 970d4cf2-adcd-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975896; x=1761580696; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4LeRwtBJOEwSyKwlZa0Bl0iTw2Zj2W4a/5enu+YqJ8=;
        b=hSR6k43tg7soNRAVefJQhOPIKNx15U/hqBuDaqMKcFBu2W4ClNJr0PqCmS6aXMo6Xa
         TMmB7KRh8lf7u9ZnvNh6rC2oME9SwmNHlDUVQvzKTUg3KzmZ/e9TejgtGUJZoiGy8xFr
         Ou/vNcLqBAOFnDA3M+JodtUywSCOcqkUysy+8EvdY1ksLOPtlPt7vp7Eltv6zGlajw/6
         RiM31WJLhlpyu58+7yyXja7KSOaapO0mgUg47jTYtiwl7i51iRCTr8fb8413IbLE2mN2
         0QQyyLWkLhZfLxIDbnK3Og9vHd3RPmJMRlVwRyx9uQnbEedIcS3lZk1jEdH+RmmUwwih
         +9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975896; x=1761580696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4LeRwtBJOEwSyKwlZa0Bl0iTw2Zj2W4a/5enu+YqJ8=;
        b=qHXG4vkXU6HEx5tUolwfEkdUdybgG4CBTrSo3DiDCrnMf7fo0vBYyrTrPuyjzG/O5J
         8HMmSxAXPLfltsFak8f6l2HFKI8+dkOYYHewKnYKLpoR7TH8ybflFhsFjQ/aBC+Gnor9
         yAlvjPCcg+YjroPeJyEzZ9hS70ZYGnpMNmr9wsu+1oS+gXr9lXvI3l+kYomzQ6W8S4dn
         rE9i4o2O3sH4LoIbb5TngmBRtrfxf6MXwmZpgzJcFnp06T1dx0e+fzvUcN/gbvG1LxAr
         O9MT8gJevIG+tB6JEOTdYtCInZsclxLaQ86taoSTYRGE3FoZz46F2S9u9SNGf+toiyN4
         Ct4Q==
X-Gm-Message-State: AOJu0YySKX8+m+CP0PckFttvOiLlkisLFSPsKDaclE8n/zuHKhwcel72
	KdY7D6u3wE2dfJQlTKqJMfWrkebvCbnTMuInE5ZZlpSzZ8eYxiKos7hL2ZeWKQ==
X-Gm-Gg: ASbGncsAkOHPQq2g+C9CDOIIh8MzG9kZbgC3CwybNqzRIAvducyKhTGzP738t3LV3Wi
	gR/2oEEfIE+828tYpPrgl+phVC+jEcvxWFMW8rrLLA3kTstPGLUkAdHl8lCQxnN6KG66Dgj0XXp
	TmPGglX+bui6kdR5BHbjcOed+GbSFtBckv4tHuxYQg1fbn+UNlTIoAmyGaZ/mmyhhaEXcokJdC2
	2v/DZ7MRx39pc9CYYVL8U8RLS40FomvjyILanV5QCX4+GDVJxLRraxRfgqasS3oElbL7VfiieTv
	ehrimj/hvVXATLDm+ufFbL0gGWEBtqrVKpEELubOoDnisaZcR6lRYtSqBP5hfa/0xtN0GyyxANI
	kGjiJgANAWYDiDoTycUer2ui68gv12L9xjhztS34c2tu5V5OVPfBlZ8aBoDUeVQhaYb1YtCBXaQ
	b+87wbp8YMOIED5K6UHG/4dZ2ldZ9CkUaKvxPCwfJW3otXhqkMTEhjjTHnEA==
X-Google-Smtp-Source: AGHT+IFJQ4tzjCRFl1l5SlcEZOMRZ3mRDVgFRBD3B/BNJiHeEfvqumBQ/X1gqPJN+ZQTGtPRx2od8w==
X-Received: by 2002:a05:6402:1e95:b0:634:5381:530b with SMTP id 4fb4d7f45d1cf-63c1f64596dmr12858074a12.13.1760975895488;
        Mon, 20 Oct 2025 08:58:15 -0700 (PDT)
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
Subject: [for 4.22 v5 05/18] xen/riscv: add root page table allocation
Date: Mon, 20 Oct 2025 17:57:48 +0200
Message-ID: <81d36dc5277d4756442f3ad5d64f37148787394a.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760974017.git.oleksii.kurochko@gmail.com>
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
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
- Introduce paging_ret_to_domheap() to return some pages before
  allocate 16 KiB pages for root page table.
- Allocate root p2m table after p2m pool is initialized.
- Add construct_hgatp() to construct the hgatp register value based on
  p2m->root, p2m->hgatp_mode and VMID.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 - Update proto of construct_hgatp(): make first argument pointer-to-const.
 - Code style fixes.
 - s/paging_ret_pages_to_freelist/paging_refill_from_domheap.
 - s/paging_ret_pages_to_domheap/paging_ret_to_domheap.
 - s/paging_ret_page_to_freelist/paging_add_page_to_freelist.
 - Drop ACCESS_ONCE() as all the cases where it is used are used under spinlock() hence ACCESS_ONCE() is redundant.
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
 xen/arch/riscv/paging.c                     | 110 +++++++++++++++-----
 6 files changed, 195 insertions(+), 29 deletions(-)

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
index a129ed8392..85e67516c4 100644
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
 
 extern unsigned char gstage_mode;
 
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
@@ -125,6 +138,8 @@ void pre_gstage_init(void);
 
 int p2m_init(struct domain *d);
 
+unsigned long construct_hgatp(const struct p2m_domain *p2m, uint16_t vmid);
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/include/asm/paging.h b/xen/arch/riscv/include/asm/paging.h
index 98d8b06d45..01be45528f 100644
--- a/xen/arch/riscv/include/asm/paging.h
+++ b/xen/arch/riscv/include/asm/paging.h
@@ -10,4 +10,7 @@ int paging_domain_init(struct domain *d);
 int paging_freelist_adjust(struct domain *d, unsigned long pages,
                            bool *preempted);
 
+int paging_ret_to_domheap(struct domain *d, unsigned int nr_pages);
+int paging_refill_from_domheap(struct domain *d, unsigned int nr_pages);
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
index d670e7612a..c9ffad393f 100644
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
@@ -103,6 +104,70 @@ void __init pre_gstage_init(void)
     vmid_init();
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
+unsigned long construct_hgatp(const struct p2m_domain *p2m, uint16_t vmid)
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
+    if ( (rc = paging_ret_to_domheap(d, P2M_ROOT_PAGES)) )
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
+        paging_refill_from_domheap(d, P2M_ROOT_PAGES);
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
@@ -118,6 +183,19 @@ int p2m_init(struct domain *d)
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
 
@@ -128,10 +206,20 @@ int p2m_init(struct domain *d)
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
index 2df8de033b..c87e9b7f7f 100644
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
+        d->arch.paging.total_pages--;
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
+static int paging_add_page_to_freelist(struct domain *d)
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
+    d->arch.paging.total_pages++;
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
+            rc = paging_add_page_to_freelist(d);
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
@@ -55,6 +76,39 @@ int paging_freelist_adjust(struct domain *d, unsigned long pages,
     return 0;
 }
 
+int paging_refill_from_domheap(struct domain *d, unsigned int nr_pages)
+{
+    ASSERT(spin_is_locked(&d->arch.paging.lock));
+
+    for ( unsigned int i = 0; i < nr_pages; i++ )
+    {
+        int rc = paging_add_page_to_freelist(d);
+
+        if ( rc )
+            return rc;
+    }
+
+    return 0;
+}
+
+int paging_ret_to_domheap(struct domain *d, unsigned int nr_pages)
+{
+    ASSERT(spin_is_locked(&d->arch.paging.lock));
+
+    if ( d->arch.paging.total_pages < nr_pages )
+        return false;
+
+    for ( unsigned int i = 0; i < nr_pages; i++ )
+    {
+        int rc = paging_ret_page_to_domheap(d);
+
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


