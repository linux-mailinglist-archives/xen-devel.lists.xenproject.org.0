Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14DAAD380A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:05:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010788.1389041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfn-0006Ma-7o; Tue, 10 Jun 2025 13:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010788.1389041; Tue, 10 Jun 2025 13:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfn-0006JF-1h; Tue, 10 Jun 2025 13:05:51 +0000
Received: by outflank-mailman (input) for mailman id 1010788;
 Tue, 10 Jun 2025 13:05:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyfl-0004iH-17
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:05:49 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a09ba216-45fb-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:05:48 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-addfe17ec0bso1197577466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:48 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:45 -0700 (PDT)
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
X-Inumbo-ID: a09ba216-45fb-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560747; x=1750165547; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9hLIUfPcNIKsmfZjWqaz9gsdigw2uPwEp+WXF0YeaY=;
        b=RHpBVplvWGQO4tqk0h9Q6ECwXkuaG2kfCFS5NDDbNpRRBsKUY5NZC3qDbqia7zbB2q
         9yGtIy65Fj/U2fnsNwOGZwZ5yy7Q0HWJAoPpVuUCveFXwDH8QAW5EBX9i6ZBS5FMuNFp
         z00mhkIx+5G0WeqHX0QEqhGn2ljDQku9sgvmlYMVzLz8yOK2T2NHYh4zWM1s3vzAUIbO
         Dru4p716LQw1si6v0H5c/1MdDmRW8UDnJitRgMTXzwWDZO0PlM2p35C3/3f8O89qufIf
         p9TEYTzX3l6LpVJnO1IGbQR1kezQaOfxJt01et/5fOPAPkLOADN2SD6x4YGwjbB7fQJn
         wA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560747; x=1750165547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9hLIUfPcNIKsmfZjWqaz9gsdigw2uPwEp+WXF0YeaY=;
        b=SaVwJru/ffUn2JRnpuiEF3pa/FVGwZpd+3iYXILbQVlkQovEqTtJouR9NF9Lp/SjXK
         Mr0/xJKP+tVz4KrvrouXC9I5rmLZfazyvYvA6dDuWlk1Kutt/xigkKIVQGbCOgZzoPnZ
         K8n/9xr6UdR5fjBUM8EWNWIaqi0sZpejDk0Rh4NRY2rFVKVZupUgA+9UuAwmqeLVso8n
         zr/gD3gpu1UKDDEgZo0SaDRTQXh58Ag+VArj2fycwdr4MDZ13JWkRONa24KWMH+4zWi4
         aX3j2/EI5b3yv+yOscu48LyLd9ezFNrlOBtUbxWNnC102NAZIk+q3b4Tx4L/jVr7MOPC
         ZmgA==
X-Gm-Message-State: AOJu0YzCSVFMgK5ao9QfrMc2LJphAx/GEHvVkoNrTDYvMbggsymS2A+a
	wEsd95976WCguUsQ+jQC5c0MmipZCU9mNnQlSPWsQM315Bx4ns6/xjTHQDedlA==
X-Gm-Gg: ASbGncuXaDqAPatycN0yBo+EHRcIaaRuaffRiPtnpAdE4yHrPis366jCR3PRoiBza3q
	RJ/d3LFH2D3cITPpm4KzbiPFlM5snOixbH3j+fUNJTEVBhQRQBFxcXzEOqERecA+JZ/Pe3M/qqA
	1DfBGGAONEjgMBgRVTFO8IomA3hg9WYiN+pEL0dtgevrKT+VTLwsv0V02kMoqcYFZaRGBNixi9y
	ussyro2fq5Rm5M3h/oZYrRM9b8Wii0ZpZnX00Jv/KW4R4hEw8yzg9+59gCmz6tUOCog0v0JR11W
	/JiN+JUeZ40HjyB5KJlok2/RUk2YDDLD6/jCYcXsT2U2OKPDjPAX+vnS5mGlhsVSqLTOW01A6DM
	/ll7LrVJPgX9PkI45g+pLByU4ZtmT
X-Google-Smtp-Source: AGHT+IFihu1rI2wMBHoXh5YoFH0UgxCCFKSkuzc1RFwjRhSWVuUdAk/0XgNrOroqtrfUkLA8y16lQQ==
X-Received: by 2002:a17:907:7ea2:b0:ad8:6dc0:6a8a with SMTP id a640c23a62f3a-ade771274a6mr309558066b.1.1749560746070;
        Tue, 10 Jun 2025 06:05:46 -0700 (PDT)
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
Subject: [PATCH v2 06/17] xen/riscv: add root page table allocation
Date: Tue, 10 Jun 2025 15:05:21 +0200
Message-ID: <76675ddb7517e4cceb63472c94944046b255da01.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749555949.git.oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce support for allocating and initializing the root page table
required for RISC-V stage-2 address translation.

To implement root page table allocation the following is introduced:
- p2m_get_clean_page() and p2m_allocate_root() helpers to allocate and
  zero a 16 KiB root page table, as mandated by the RISC-V privileged
  specification for Sv39x4/Sv48x4 modes.
- Add hgatp_from_page() to construct the hgatp register value from the
  allocated root page.
- Update p2m_init() to allocate the root table and initialize
  p2m->root and p2m->hgatp.
- Add maddr_to_page() and page_to_maddr() macros for easier address
  manipulation.
- Allocate root p2m table after p2m pool is initialized.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/p2m.h            |  6 ++
 xen/arch/riscv/include/asm/riscv_encoding.h |  4 +
 xen/arch/riscv/p2m.c                        | 94 +++++++++++++++++++++
 4 files changed, 108 insertions(+)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 01bbd92a06..912bc79e1b 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -149,6 +149,10 @@ extern struct page_info *frametable_virt_start;
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
index 9570eff014..a31b05bd50 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -26,6 +26,12 @@ struct p2m_domain {
     /* Pages used to construct the p2m */
     struct page_list_head pages;
 
+    /* The root of the p2m tree. May be concatenated */
+    struct page_info *root;
+
+    /* Address Translation Table for the p2m */
+    paddr_t hgatp;
+
     /* Indicate if it is required to clean the cache when writing an entry */
     bool clean_pte;
 
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 6cc8f4eb45..a71b7546ef 100644
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
@@ -181,6 +184,7 @@
 #define HGATP_VMID_SHIFT		HGATP32_VMID_SHIFT
 #define HGATP_VMID_MASK			HGATP32_VMID_MASK
 #define HGATP_MODE_SHIFT		HGATP32_MODE_SHIFT
+#define HGATP_MODE_MASK			HGATP32_MODE_MASK
 #endif
 
 #define TOPI_IID_SHIFT			16
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index e409997499..2419a61d8c 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -41,6 +41,91 @@ void p2m_write_unlock(struct p2m_domain *p2m)
     write_unlock(&p2m->lock);
 }
 
+static void clear_and_clean_page(struct page_info *page)
+{
+    clean_dcache_va_range(page, PAGE_SIZE);
+    clear_domain_page(page_to_mfn(page));
+}
+
+static struct page_info *p2m_allocate_root(struct domain *d)
+{
+    struct page_info *page;
+    unsigned int order = get_order_from_bytes(KB(16));
+    unsigned int nr_pages = _AC(1,U) << order;
+
+    /* Return back nr_pages necessary for p2m root table. */
+
+    if ( ACCESS_ONCE(d->arch.paging.p2m_total_pages) < nr_pages )
+        panic("Specify more xen,domain-p2m-mem-mb\n");
+
+    for ( unsigned int i = 0; i < nr_pages; i++ )
+    {
+        /* Return memory to domheap. */
+        page = page_list_remove_head(&d->arch.paging.p2m_freelist);
+        if( page )
+        {
+            ACCESS_ONCE(d->arch.paging.p2m_total_pages)--;
+            free_domheap_page(page);
+        }
+        else
+        {
+            printk(XENLOG_ERR
+                   "Failed to free P2M pages, P2M freelist is empty.\n");
+            return NULL;
+        }
+    }
+
+    /* Allocate memory for p2m root table. */
+
+    /*
+     * As mentioned in the Priviliged Architecture Spec (version 20240411)
+     * As explained in Section 18.5.1, for the paged virtual-memory schemes
+     * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
+     * and must be aligned to a 16-KiB boundary.
+     */
+    page = alloc_domheap_pages(d, order, MEMF_no_owner);
+    if ( page == NULL )
+        return NULL;
+
+    for ( unsigned int i = 0; i < nr_pages; i++ )
+        clear_and_clean_page(page + i);
+
+    return page;
+}
+
+static unsigned long hgatp_from_page(struct p2m_domain *p2m)
+{
+    struct page_info *p2m_root_page = p2m->root;
+    unsigned long ppn;
+    unsigned long hgatp_mode;
+
+    ppn = PFN_DOWN(page_to_maddr(p2m_root_page)) & HGATP_PPN;
+
+#if RV_STAGE1_MODE == SATP_MODE_SV39
+    hgatp_mode = HGATP_MODE_SV39X4;
+#elif RV_STAGE1_MODE == SATP_MODE_SV48
+    hgatp_mode = HGATP_MODE_SV48X4;
+#else
+#   error "add HGATP_MODE"
+#endif
+
+    return ppn | MASK_INSR(p2m->vmid, HGATP_VMID_MASK) |
+           MASK_INSR(hgatp_mode, HGATP_MODE_MASK);
+}
+
+static int p2m_alloc_root_table(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    p2m->root = p2m_allocate_root(d);
+    if ( !p2m->root )
+        return -ENOMEM;
+
+    p2m->hgatp = hgatp_from_page(p2m);
+
+    return 0;
+}
+
 static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
 
 /*
@@ -228,5 +313,14 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
         }
     }
 
+    /*
+    * First, wait for the p2m pool to be initialized. Then allocate the root
+    * table so that the necessary pages can be returned from the p2m pool,
+    * since the root table must be allocated using alloc_domheap_pages(...)
+    * to meet its specific requirements.
+    */
+    if ( !d->arch.p2m.root )
+        p2m_alloc_root_table(d);
+
     return 0;
 }
-- 
2.49.0


