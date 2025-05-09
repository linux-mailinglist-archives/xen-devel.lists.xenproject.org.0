Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75283AB1984
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 17:58:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980133.1366634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQ6r-000724-2m; Fri, 09 May 2025 15:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980133.1366634; Fri, 09 May 2025 15:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQ6q-00070A-Uj; Fri, 09 May 2025 15:58:00 +0000
Received: by outflank-mailman (input) for mailman id 980133;
 Fri, 09 May 2025 15:57:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZIRI=XZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uDQ6p-0006Kr-4V
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 15:57:59 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60070bda-2cee-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 17:57:57 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ac289147833so449334566b.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 08:57:57 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21947a88fsm168723766b.81.2025.05.09.08.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 08:57:55 -0700 (PDT)
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
X-Inumbo-ID: 60070bda-2cee-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746806277; x=1747411077; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qPEUHjjXJvBKQ7mRTvnDll4njWE6oo2euZAX0DbEXY=;
        b=NJR8pfusbLPVHo1U6TOp/55/mCzdfKKVV5oxu4bfJ0Q3bHLe+05v9v4Qpy4hv2U9mr
         MA3wPsEc7++v9pRgPBUC/GGNzjigXz/5kw2chwp+Wkj2LXozsbvt1oP4gGecuPoNwDaJ
         QU/OzvCM9b9FJDu/uygpow4cJA5ZuR4fR8aillF8We199XNAaJZK81GPG7iyPeuwrA13
         rPZYKmzqgzRxmUblfzkadzdWZ8g/RJnf/9ZGPfaiFsFHuXmaptB/1NFSfUav7ZIekuVw
         thV+yWnkHg7FeQns8GmKi9W7kJWE/UWb7HVPiYB7iFgsdjnwZisdh913lVc5zNotLJ0l
         jm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806277; x=1747411077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qPEUHjjXJvBKQ7mRTvnDll4njWE6oo2euZAX0DbEXY=;
        b=psfi4voXS5KqJ7YlJLSlmGqsj7I2aLjDtZYeagSAtWpmeAapOBBfsTZq5mt8g7xyYS
         3d7P9EJaCofGCwCbDjan++MG0IhwsOVjWheg24nncc/oju0CjNAKPePww0yWm4i8UfHh
         +uqQqYXeqNKmHOOQnUacKuuz8rQoZxhZGgFqh4hLqGgO1TlNffRmMOnlWTrGjCPCdYRc
         lJWx7g5n5uofb3Ckwg1EKU+WdY0xzh4r5irX48lDTPtrQ30QSckoxX8/Y8kwFcIk8Tf1
         6wsszH2NPafZTylOeLS9LFezwZapgdwQY/XqKgZurXUtQdJJ4bI5vnOhl9q4uVFhshRl
         +Lxg==
X-Gm-Message-State: AOJu0YxcGLZrq1npD/ueXQ5x2iRtm6Po3QOvnjPV1/Jk5+w8zGHUlWiI
	gbPz0IrXdhfEJas/cKLFFMVDf16uMKSPB+45HvTZYCllbg/hi+RseYU97Q==
X-Gm-Gg: ASbGncswzt0N3DWcQIDqu4cufTEgBtWrOMDZxVFafU3WJ4R5ZVY0F/arEeSj0q+EMZw
	uBNYxOWgkfJhprzxK58P1Eve3pyZsDgVjFumnVYk+3IHYMkX01EDOi84eZ3MmEIvQ7YqSX14alm
	UxlchbaEDm1BnIILjHrLqBc0InOAyysYTqDPNVbBx6W4Ara0wfv1HSswNHQ4CFTKlNTstPY2L7u
	xrc/K5u20cAczpjCMlWM2Kl2pAYSz+zSThNkVXcb099z8UMmCyG/VKz662V6lZxV9YtGjol3hX5
	nI2qXDecc7o37aI+citMwROJADBvSXYW8SferzvV5UOo9QYpNtT710ejpCWqM8Vp0jH9McY5nA2
	iW7xRsiZ/gg==
X-Google-Smtp-Source: AGHT+IEqkl5G4yO2sCosJUhojhdkwAJQn7oPU8PxLl4K6nQhDCF7PIykc2HWxZhHQb84HyhPIHTZ1w==
X-Received: by 2002:a17:907:3f25:b0:ace:6a25:f56a with SMTP id a640c23a62f3a-ad218f835acmr472320166b.29.1746806276295;
        Fri, 09 May 2025 08:57:56 -0700 (PDT)
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
Subject: [PATCH v1 2/6] xen/riscv: introduce things necessary for p2m initialization
Date: Fri,  9 May 2025 17:57:47 +0200
Message-ID: <0a03d1f38649cfd8656147f209652dff0f9d170c.1746805907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746805907.git.oleksii.kurochko@gmail.com>
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the following things:
- p2m_domain structure which describe per p2m-table state.
- Update arch_domain structure with the mentioned above structure.
- p2m_get_hostp2m() to recieve domain's p2m structure.
- Introudce p2m_write_lock() and p2m_is_write_locked().
- p2m_init() to initalize p2m:
  - allocate p2m table by using of p2m_alloc_table().
  - initialize lock premitive necessary to protect updates to the p2m.
- Introduce the following functions to implement p2m_alloc_table():
  - p2m_allocate_root() to allocate p2m root table by using another introduced
    helpers p2m_get_clean_page() and clear_and_clean_page().
  - introduce p2m_force_tlb_flush_sync() to flush TLBs after p2m table
    allocation before being used. (it isn't necessary at the current stage of
    development but could be useful once the VMID is marked unused, a new domain
    can reuse the VMID for its own. If the TLB is not flushed, entries can
    contain wrong translation.)
- Implement maddr_to_page() and page_to_maddr().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile             |   1 +
 xen/arch/riscv/include/asm/domain.h |   6 +
 xen/arch/riscv/include/asm/mm.h     |   4 +
 xen/arch/riscv/include/asm/p2m.h    |  76 +++++++++++++
 xen/arch/riscv/p2m.c                | 168 ++++++++++++++++++++++++++++
 5 files changed, 255 insertions(+)
 create mode 100644 xen/arch/riscv/p2m.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index d882c57528..87c5e7e7f2 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -5,6 +5,7 @@ obj-y += entry.o
 obj-y += intc.o
 obj-y += mm.o
 obj-y += pt.o
+obj-y += p2m.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index c3d965a559..48be90a395 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -5,6 +5,8 @@
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
 
+#include <asm/p2m.h>
+
 struct hvm_domain
 {
     uint64_t              params[HVM_NR_PARAMS];
@@ -16,8 +18,12 @@ struct arch_vcpu_io {
 struct arch_vcpu {
 };
 
+
 struct arch_domain {
     struct hvm_domain hvm;
+
+    struct p2m_domain p2m;
+
 };
 
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 01bbd92a06..972ec45448 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -149,6 +149,10 @@ extern struct page_info *frametable_virt_start;
 #define mfn_to_page(mfn)    (frametable_virt_start + mfn_x(mfn))
 #define page_to_mfn(pg)     _mfn((pg) - frametable_virt_start)
 
+/* Convert between machine addresses and page-info structures. */
+#define maddr_to_page(ma) mfn_to_page(maddr_to_mfn(ma))
+#define page_to_maddr(pg) (mfn_to_maddr(page_to_mfn(pg)))
+
 static inline void *page_to_virt(const struct page_info *pg)
 {
     return mfn_to_virt(mfn_x(page_to_mfn(pg)));
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 28f57a74f2..8b46210768 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -3,11 +3,73 @@
 #define ASM__RISCV__P2M_H
 
 #include <xen/errno.h>
+#include <xen/mem_access.h>
+#include <xen/mm.h>
+#include <xen/radix-tree.h>
+#include <xen/rwlock.h>
+#include <xen/types.h>
 
 #include <asm/page-bits.h>
 
 #define paddr_bits PADDR_BITS
 
+/* Get host p2m table */
+#define p2m_get_hostp2m(d) (&(d)->arch.p2m)
+
+/* Per-p2m-table state */
+struct p2m_domain {
+    /*
+     * Lock that protects updates to the p2m.
+     */
+    rwlock_t lock;
+
+    /* Page containing root p2m table */
+    struct page_info *root;
+
+    /* Pages used to construct the p2m */
+    struct page_list_head pages;
+
+    /* Address Translation Table for the p2m */
+    paddr_t hgatp;
+
+    /*
+     * P2M updates may required TLBs to be flushed (invalidated).
+     *
+     * Flushes may be deferred by setting 'need_flush' and then flushing
+     * when the p2m write lock is released.
+     *
+     * If an immediate flush is required (e.g, if a super page is
+     * shattered), call p2m_tlb_flush_sync().
+     */
+    bool need_flush;
+
+    /* Indicate if it is required to clean the cache when writing an entry */
+    bool clean_pte;
+
+    struct radix_tree_root p2m_type;
+
+    /*
+     * Default P2M access type for each page in the the domain: new pages,
+     * swapped in pages, cleared pages, and pages that are ambiguously
+     * retyped get this access type.  See definition of p2m_access_t.
+     */
+    p2m_access_t default_access;
+
+    /* Highest guest frame that's ever been mapped in the p2m */
+    gfn_t max_mapped_gfn;
+
+    /*
+     * Lowest mapped gfn in the p2m. When releasing mapped gfn's in a
+     * preemptible manner this is update to track recall where to
+     * resume the search. Apart from during teardown this can only
+     * decrease.
+     */
+    gfn_t lowest_mapped_gfn;
+
+    /* Back pointer to domain */
+    struct domain *domain;
+};
+
 /*
  * List of possible type for each page in the p2m entry.
  * The number of available bit per page in the pte for this purpose is 2 bits.
@@ -93,6 +155,20 @@ static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
     /* Not supported on RISCV. */
 }
 
+int p2m_init(struct domain *d);
+
+static inline void p2m_write_lock(struct p2m_domain *p2m)
+{
+    write_lock(&p2m->lock);
+}
+
+void p2m_write_unlock(struct p2m_domain *p2m);
+
+static inline int p2m_is_write_locked(struct p2m_domain *p2m)
+{
+    return rw_is_write_locked(&p2m->lock);
+}
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
new file mode 100644
index 0000000000..ad4beef8f9
--- /dev/null
+++ b/xen/arch/riscv/p2m.c
@@ -0,0 +1,168 @@
+#include <xen/domain_page.h>
+#include <xen/iommu.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
+#include <xen/pfn.h>
+#include <xen/rwlock.h>
+#include <xen/sched.h>
+#include <xen/spinlock.h>
+
+#include <asm/page.h>
+#include <asm/p2m.h>
+
+/*
+ * Force a synchronous P2M TLB flush.
+ *
+ * Must be called with the p2m lock held.
+ *
+ * TODO: add support of flushing TLB connected to VMID.
+ */
+static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
+{
+    ASSERT(p2m_is_write_locked(p2m));
+
+    /*
+     * TODO: shouldn't be this flush done for each physical CPU?
+     *       If yes, then SBI call sbi_remote_hfence_gvma() could
+     *       be used for that.
+     */
+#if defined(__riscv_hh) || defined(__riscv_h)
+    asm volatile ( "hfence.gvma" ::: "memory" );
+#else
+    asm volatile ( ".insn r 0x73, 0x0, 0x31, x0, x0, x0" ::: "memory" );
+#endif
+
+    p2m->need_flush = false;
+}
+
+static void p2m_tlb_flush_sync(struct p2m_domain *p2m)
+{
+    if ( p2m->need_flush )
+        p2m_force_tlb_flush_sync(p2m);
+}
+
+/* Unlock the flush and do a P2M TLB flush if necessary */
+void p2m_write_unlock(struct p2m_domain *p2m)
+{
+    /*
+     * The final flush is done with the P2M write lock taken to avoid
+     * someone else modifying the P2M wbefore the TLB invalidation has
+     * completed.
+     */
+    p2m_tlb_flush_sync(p2m);
+
+    write_unlock(&p2m->lock);
+}
+
+static void clear_and_clean_page(struct page_info *page)
+{
+    void *p = __map_domain_page(page);
+
+    clear_page(p);
+    unmap_domain_page(p);
+}
+
+static struct page_info *p2m_get_clean_page(struct domain *d)
+{
+    struct page_info *page;
+
+    /*
+     * As mentioned in the Priviliged Architecture Spec (version 20240411)
+     * As explained in Section 18.5.1, for the paged virtual-memory schemes
+     * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
+     * and must be aligned to a 16-KiB boundary.
+     */
+    page = alloc_domheap_pages(NULL, 2, 0);
+    if ( page == NULL )
+        return NULL;
+
+    clear_and_clean_page(page);
+
+    return page;
+}
+
+static struct page_info *p2m_allocate_root(struct domain *d)
+{
+    return p2m_get_clean_page(d);
+}
+
+static unsigned long hgatp_from_page_info(struct page_info *page_info)
+{
+    unsigned long ppn;
+    unsigned long hgatp_mode;
+
+    ppn = PFN_DOWN(page_to_maddr(page_info)) & HGATP_PPN;
+
+    /* ASID (VMID) not supported yet */
+
+#if RV_STAGE1_MODE == SATP_MODE_SV39
+    hgatp_mode = HGATP_MODE_SV39X4;
+#elif RV_STAGE1_MODE == SATP_MODE_SV48
+    hgatp_mode = HGATP_MODE_SV48X4;
+#else
+    #error "add HGATP_MODE"
+#endif
+
+    return ppn | (hgatp_mode << HGATP_MODE_SHIFT);
+}
+
+static int p2m_alloc_table(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    p2m->root = p2m_allocate_root(d);
+    if ( !p2m->root )
+        return -ENOMEM;
+
+    p2m->hgatp = hgatp_from_page_info(p2m->root);
+
+    /*
+     * Make sure that all TLBs corresponding to the new VMID are flushed
+     * before using it.
+     */
+    p2m_write_lock(p2m);
+    p2m_force_tlb_flush_sync(p2m);
+    p2m_write_unlock(p2m);
+
+    return 0;
+}
+
+int p2m_init(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    int rc;
+
+    rwlock_init(&p2m->lock);
+    INIT_PAGE_LIST_HEAD(&p2m->pages);
+
+    p2m->max_mapped_gfn = _gfn(0);
+    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
+
+    p2m->default_access = p2m_access_rwx;
+
+    radix_tree_init(&p2m->p2m_type);
+
+#ifdef CONFIG_HAS_PASSTHROUGH
+    /*
+     * Some IOMMUs don't support coherent PT walk. When the p2m is
+     * shared with the CPU, Xen has to make sure that the PT changes have
+     * reached the memory
+     */
+    p2m->clean_pte = is_iommu_enabled(d) &&
+        !iommu_has_feature(d, IOMMU_FEAT_COHERENT_WALK);
+#else
+    p2m->clean_pte = true;
+#endif
+
+    /*
+     * "Trivial" initialisation is now complete.  Set the backpointer so
+     * p2m_teardown() and friends know to do something.
+     */
+    p2m->domain = d;
+
+    rc = p2m_alloc_table(d);
+    if ( rc )
+        return rc;
+
+    return 0;
+}
-- 
2.49.0


