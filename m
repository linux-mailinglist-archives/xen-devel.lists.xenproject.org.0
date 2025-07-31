Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59781B17475
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:58:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065872.1431250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVg2-0002m5-VP; Thu, 31 Jul 2025 15:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065872.1431250; Thu, 31 Jul 2025 15:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVg2-0002gX-Mq; Thu, 31 Jul 2025 15:58:42 +0000
Received: by outflank-mailman (input) for mailman id 1065872;
 Thu, 31 Jul 2025 15:58:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVg1-0001FB-Bi
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:41 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 397bfc85-6e27-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:58:39 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-55b7454c6b0so579841e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:39 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:38 -0700 (PDT)
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
X-Inumbo-ID: 397bfc85-6e27-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977519; x=1754582319; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49cBhv+bsfX2NNvsCTVAGnNs0eP38Nq2mxipt6UO56Y=;
        b=P+JdK2h6eqM2x/9/+OeQ7Us1gxwstPcVbRQIugKjQcRLeF0uHTXSCKKoDw1sP610Jd
         Sp+Q84JCsSbVL4IqQslqFoM0+zT5xm1ct0YhP4zcjZg0Sw7N8y5eWofiv9jxtchg94vi
         uFaRxxpCn9kfCc3+b1f7hRfGMmwOVx9Hmqb4rd0Q7lcoO9wmz0YLAlqGOHrV1maJRpiV
         EQ9MyKemWYHX/hRVs8YRSoW0Kyglq425v5GQi8mvSL8fdi22xS0AeJuyIkpuxejBh5qf
         upBrIMw685Rc29yk5I7t7lJssTnZCm4keKNTU86a2ljTNB4+o59/cv4CRoI4I9m5gtI5
         r5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977519; x=1754582319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49cBhv+bsfX2NNvsCTVAGnNs0eP38Nq2mxipt6UO56Y=;
        b=wHTC0ZQs5H3dldIwyS9pEVZCGjky0znCQM65wf8yBnGkTQYcu27it/1koaFOiMJFQm
         CGK2/nwGETPazVXvc7g8Xqub6rpad1RRgJIiSyBdxjNIJ7tb5CSGVm6LwjIm/OEI8RtT
         MAgg1CW7ovjch3SOrT9Bbc0x8rEf9qBpZNOXEqNFQnykzPYztArXMVf1rb0U8WpRmUcT
         DUF8rrMorUQ/vweF0BG74COHK4E3Cdr0fxQnoz1jlspmAYTJN1Gl6PL+1AVmo4f+Riqc
         UUZmZjqjA5FpILSib5euPwBK/e/1TmM1JZYXFBwl2PgbshP3pS3Zi5W2i/B195lZ49b7
         gS+w==
X-Gm-Message-State: AOJu0YxV8m8C+JgfhkcuJa2LhRrJagXbJQhVr7ayxVdpzx5SWUGA3YPO
	Xl8Mdkim8xL2qfDf7nkD3MRSpbRH8uM5WQiMFAHQoILx1ILQ5hgtKFaVl23VDA==
X-Gm-Gg: ASbGnct37lALH+rGLc4HIddUgY+c/H1UoUfCtLrUoeQxjhIVPUaTr/euJ3qVclNjGrO
	AqBB/EvQq0sqhZ2XEpQrReA/OjB5OfGbOhfv8BBMuFWJfjacwm66him7o+E6nZbceexMoGeHCcQ
	PNWKDxkYYMHg6YcxJcxKaWsyjGOO8D8zG5f5SqaJPF/BSYTArUMfJvNwBYpuWjql3IwJHdbNswj
	pbFBpfvMI0tKJQIXjh796W7UV7P16bYipPBlZaP58bnrPV1WZ0tGQtlfUgceoKD0oINNc4Ot/3a
	XlC8AiUaPCtR8I7izZHIYZaiIAdT4I6AUwzM8HVncCJ5e6PkhWLgUA6YcFvIMohfb8irx/CRxYy
	/jn3bie9U6boLDbCsRW/zjAgXRrwsukJGxIDHHpNBlnmPUqZ/SBOnNMhJm/qff10GcEiBgnvJ
X-Google-Smtp-Source: AGHT+IEttbQXq7FEKRn1TaR0w+pfXFD3Zr+SAmyYNGaXXvKBmMp9ZcMs5JrzXtfLt7QjNaAmKN9Mrg==
X-Received: by 2002:a05:6512:23a1:b0:553:297b:3d4e with SMTP id 2adb3069b0e04-55b7c0a1a35mr2788480e87.52.1753977518588;
        Thu, 31 Jul 2025 08:58:38 -0700 (PDT)
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
Subject: [PATCH v3 06/20] xen/riscv: add root page table allocation
Date: Thu, 31 Jul 2025 17:58:05 +0200
Message-ID: <23c79f07221dee7eb782ebb160442f3a796a41b2.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/mm.h             |  4 +
 xen/arch/riscv/include/asm/p2m.h            | 12 +++
 xen/arch/riscv/include/asm/paging.h         |  2 +
 xen/arch/riscv/include/asm/riscv_encoding.h |  6 ++
 xen/arch/riscv/p2m.c                        | 90 +++++++++++++++++++++
 xen/arch/riscv/paging.c                     | 30 +++++++
 6 files changed, 144 insertions(+)

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
index f8051ed893..3c37a708db 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -9,6 +9,10 @@
 
 #include <asm/page-bits.h>
 
+extern unsigned int p2m_root_order;
+#define P2M_ROOT_ORDER  p2m_root_order
+#define P2M_ROOT_PAGES  BIT(P2M_ROOT_ORDER, U)
+
 #define paddr_bits PADDR_BITS
 
 /* Get host p2m table */
@@ -24,6 +28,12 @@ struct p2m_domain {
     /* Pages used to construct the p2m */
     struct page_list_head pages;
 
+    /* The root of the p2m tree. May be concatenated */
+    struct page_info *root;
+
+    /* G-stage (stage-2) address translation mode */
+    unsigned long hgatp_mode;
+
     /* Indicate if it is required to clean the cache when writing an entry */
     bool clean_pte;
 
@@ -127,6 +137,8 @@ static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
     /* Not supported on RISCV. */
 }
 
+unsigned long construct_hgatp(struct p2m_domain *p2m, uint16_t vmid);
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/include/asm/paging.h b/xen/arch/riscv/include/asm/paging.h
index 8fdaeeb2e4..557fbd1abc 100644
--- a/xen/arch/riscv/include/asm/paging.h
+++ b/xen/arch/riscv/include/asm/paging.h
@@ -10,4 +10,6 @@ int paging_domain_init(struct domain *d);
 int paging_freelist_init(struct domain *d, unsigned long pages,
                          bool *preempted);
 
+bool paging_ret_pages_to_domheap(struct domain *d, unsigned int nr_pages);
+
 #endif /* ASM_RISCV_PAGING_H */
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 6cc8f4eb45..8362df8784 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -133,11 +133,13 @@
 #define HGATP_MODE_SV48X4		_UL(9)
 
 #define HGATP32_MODE_SHIFT		31
+#define HGATP32_MODE_MASK		_UL(0x80000000)
 #define HGATP32_VMID_SHIFT		22
 #define HGATP32_VMID_MASK		_UL(0x1FC00000)
 #define HGATP32_PPN			_UL(0x003FFFFF)
 
 #define HGATP64_MODE_SHIFT		60
+#define HGATP64_MODE_MASK		_ULL(0xF000000000000000)
 #define HGATP64_VMID_SHIFT		44
 #define HGATP64_VMID_MASK		_ULL(0x03FFF00000000000)
 #define HGATP64_PPN			_ULL(0x00000FFFFFFFFFFF)
@@ -170,6 +172,7 @@
 #define HGATP_VMID_SHIFT		HGATP64_VMID_SHIFT
 #define HGATP_VMID_MASK			HGATP64_VMID_MASK
 #define HGATP_MODE_SHIFT		HGATP64_MODE_SHIFT
+#define HGATP_MODE_MASK			HGATP64_MODE_MASK
 #else
 #define MSTATUS_SD			MSTATUS32_SD
 #define SSTATUS_SD			SSTATUS32_SD
@@ -181,8 +184,11 @@
 #define HGATP_VMID_SHIFT		HGATP32_VMID_SHIFT
 #define HGATP_VMID_MASK			HGATP32_VMID_MASK
 #define HGATP_MODE_SHIFT		HGATP32_MODE_SHIFT
+#define HGATP_MODE_MASK			HGATP32_MODE_MASK
 #endif
 
+#define GUEST_ROOT_PAGE_TABLE_SIZE	KB(16)
+
 #define TOPI_IID_SHIFT			16
 #define TOPI_IID_MASK			0xfff
 #define TOPI_IPRIO_MASK		0xff
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 214b4861d2..cac07c51c9 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1,8 +1,86 @@
+#include <xen/domain_page.h>
 #include <xen/mm.h>
 #include <xen/rwlock.h>
 #include <xen/sched.h>
 
 #include <asm/paging.h>
+#include <asm/p2m.h>
+#include <asm/riscv_encoding.h>
+
+unsigned int __read_mostly p2m_root_order;
+
+static void clear_and_clean_page(struct page_info *page)
+{
+    clear_domain_page(page_to_mfn(page));
+
+    /*
+     * If the IOMMU doesn't support coherent walks and the p2m tables are
+     * shared between the CPU and IOMMU, it is necessary to clean the
+     * d-cache.
+     */
+    clean_dcache_va_range(page, PAGE_SIZE);
+}
+
+static struct page_info *p2m_allocate_root(struct domain *d)
+{
+    struct page_info *page;
+
+    /*
+     * As mentioned in the Priviliged Architecture Spec (version 20240411)
+     * in Section 18.5.1, for the paged virtual-memory schemes  (Sv32x4,
+     * Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB and must
+     * be aligned to a 16-KiB boundary.
+     */
+    page = alloc_domheap_pages(d, P2M_ROOT_ORDER, MEMF_no_owner);
+    if ( !page )
+        return NULL;
+
+    for ( unsigned int i = 0; i < P2M_ROOT_PAGES; i++ )
+        clear_and_clean_page(page + i);
+
+    return page;
+}
+
+unsigned long construct_hgatp(struct p2m_domain *p2m, uint16_t vmid)
+{
+    unsigned long ppn;
+
+    ppn = PFN_DOWN(page_to_maddr(p2m->root)) & HGATP_PPN;
+
+    /* TODO: add detection of hgatp_mode instead of hard-coding it. */
+#if RV_STAGE1_MODE == SATP_MODE_SV39
+    p2m->hgatp_mode = HGATP_MODE_SV39X4;
+#elif RV_STAGE1_MODE == SATP_MODE_SV48
+    p2m->hgatp_mode = HGATP_MODE_SV48X4;
+#else
+#   error "add HGATP_MODE"
+#endif
+
+    return ppn | MASK_INSR(p2m->hgatp_mode, HGATP_MODE_MASK) |
+                 MASK_INSR(vmid, HGATP_VMID_MASK);
+}
+
+static int p2m_alloc_root_table(struct p2m_domain *p2m)
+{
+    struct domain *d = p2m->domain;
+    struct page_info *page;
+    const unsigned int nr_root_pages = P2M_ROOT_PAGES;
+
+    /*
+     * Return back nr_root_pages to assure the root table memory is also
+     * accounted against the P2M pool of the domain.
+     */
+    if ( !paging_ret_pages_to_domheap(d, nr_root_pages) )
+        return -ENOMEM;
+
+    page = p2m_allocate_root(d);
+    if ( !page )
+        return -ENOMEM;
+
+    p2m->root = page;
+
+    return 0;
+}
 
 int p2m_init(struct domain *d)
 {
@@ -32,6 +110,8 @@ int p2m_init(struct domain *d)
 #   error "Add init of p2m->clean_pte"
 #endif
 
+    p2m_root_order = get_order_from_bytes(GUEST_ROOT_PAGE_TABLE_SIZE);
+
     return 0;
 }
 
@@ -42,10 +122,20 @@ int p2m_init(struct domain *d)
  */
 int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
 {
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc;
 
     if ( (rc = paging_freelist_init(d, pages, preempted)) )
         return rc;
 
+    /*
+     * First, initialize p2m pool. Then allocate the root
+     * table so that the necessary pages can be returned from the p2m pool,
+     * since the root table must be allocated using alloc_domheap_pages(...)
+     * to meet its specific requirements.
+     */
+    if ( !p2m->root )
+        p2m_alloc_root_table(p2m);
+
     return 0;
 }
diff --git a/xen/arch/riscv/paging.c b/xen/arch/riscv/paging.c
index 8882be5ac9..bbe1186900 100644
--- a/xen/arch/riscv/paging.c
+++ b/xen/arch/riscv/paging.c
@@ -54,6 +54,36 @@ int paging_freelist_init(struct domain *d, unsigned long pages,
 
     return 0;
 }
+
+bool paging_ret_pages_to_domheap(struct domain *d, unsigned int nr_pages)
+{
+    struct page_info *page;
+
+    ASSERT(spin_is_locked(&d->arch.paging.lock));
+
+    if ( ACCESS_ONCE(d->arch.paging.total_pages) < nr_pages )
+        return false;
+
+    for ( unsigned int i = 0; i < nr_pages; i++ )
+    {
+        /* Return memory to domheap. */
+        page = page_list_remove_head(&d->arch.paging.freelist);
+        if( page )
+        {
+            ACCESS_ONCE(d->arch.paging.total_pages)--;
+            free_domheap_page(page);
+        }
+        else
+        {
+            printk(XENLOG_ERR
+                   "Failed to free P2M pages, P2M freelist is empty.\n");
+            return false;
+        }
+    }
+
+    return true;
+}
+
 /* Domain paging struct initialization. */
 int paging_domain_init(struct domain *d)
 {
-- 
2.50.1


