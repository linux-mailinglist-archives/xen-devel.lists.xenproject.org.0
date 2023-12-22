Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD92881CC25
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:24:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659535.1029232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhNb-0005c5-5b; Fri, 22 Dec 2023 15:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659535.1029232; Fri, 22 Dec 2023 15:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhNb-0005aI-2m; Fri, 22 Dec 2023 15:24:03 +0000
Received: by outflank-mailman (input) for mailman id 659535;
 Fri, 22 Dec 2023 15:24:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDs-0000EM-1v
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:14:00 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b97f9e37-a0dc-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 16:13:56 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50e6ee5b7ffso192009e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:56 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:54 -0800 (PST)
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
X-Inumbo-ID: b97f9e37-a0dc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258035; x=1703862835; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frli1aD+HGGze4OEMxoJ745JDQDclWlmSm+0uAYhNCA=;
        b=fr6dBkE1qS/XjHXGqx5HpFRMFuEohCBx4XiQkmmwBdhAQkQCvz740fIe50uRAudmJe
         33/HgSJo8zJWqth9IzsXM57R4icHdgtRtKqWLjiZha7VoIgorahawtrWrdpkRVplNt+q
         +lyuobcZAQmJp/+xZHRfoo7QKuGNXkyG9DPSPPYfdvrz52Ykz6LoBJUk835vW2R6rlTT
         OL/QFCVHbrMZXiLaqQmOGtlVRGsEWHEmHsYcuEnecs4bw6v4y2/o3P/ZEFUyN5OT4qNY
         KYb520uG8FfP+6TEenvTzBLNpHxQQ+nbWyVSoq7W1Z9dlPRFLPug0z4OnLL8Sur73JzI
         nDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258035; x=1703862835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frli1aD+HGGze4OEMxoJ745JDQDclWlmSm+0uAYhNCA=;
        b=duhpVUAAx7XF9pvk7Rgh1y29RBuLeAW6hzfXl0E4OJvst4CXrkcLnfPH2vgz0KbVUm
         wLQ2wt/xe2CJm0wlXTrQ+wGYx5BqEVBVwsG8Yq8xo9+1cUjxJRxt9YkYLlNxZeoC3Lo2
         u7pug+49kawTpJe16FME/P2xQAo9x27RYRHSiaPyKWymywiyuwo+l40hj3MXHR1I3oXT
         dtFo5e9deR+fNW+GEYb1UX0gQxRsG2h/v6oPvTZ9qiC6mn84dF1WL/1hOT1AZ9jDFrVF
         uoiu4qfoodYx/InoJxN/WT9i+58lHfWYtTLX5Tgf8VDzvPXh9/8VCsSqkAdpkpeILgUB
         OEKA==
X-Gm-Message-State: AOJu0YxzGsM6xMkJa4d/YIqDZFuc1PYODRjDF9zG+5LOPwi2CEt+rnXn
	I2dsdS5+cv6B99UoyMFuqsZoZNLDba0=
X-Google-Smtp-Source: AGHT+IFZCNPquwefqv8QO+Do6E1jJO4MSuvYOlKcjviH7UvUQx1NL8Z7lBrk6DEahlfXPm4tCrV9AA==
X-Received: by 2002:a05:6512:ea8:b0:50e:34df:7530 with SMTP id bi40-20020a0565120ea800b0050e34df7530mr1256572lfb.32.1703258035353;
        Fri, 22 Dec 2023 07:13:55 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 31/34] xen/riscv: add minimal stuff to mm.h to build full Xen
Date: Fri, 22 Dec 2023 17:13:15 +0200
Message-ID: <4411f6af38586074b347cd6005f19f9c670faa74.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - update the commit message
 - introduce DIRECTMAP_VIRT_START.
 - drop changes related pfn_to_paddr() and paddr_to_pfn as they were remvoe in
   [PATCH v2 32/39] xen/riscv: add minimal stuff to asm/page.h to build full Xen
 - code style fixes.
 - drop get_page_nr  and put_page_nr as they don't need for time being
 - drop CONFIG_STATIC_MEMORY related things
 - code style fixes
---
Changes in V2:
 - define stub for arch_get_dma_bitsize(void)
---
 xen/arch/riscv/include/asm/config.h |   2 +
 xen/arch/riscv/include/asm/mm.h     | 248 ++++++++++++++++++++++++++++
 2 files changed, 250 insertions(+)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index fb9fc9daaa..400309f4ef 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -67,6 +67,8 @@
 
 #define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1 - GB(1)) */
 
+#define DIRECTMAP_VIRT_START    SLOTN(200)
+
 #define FRAMETABLE_VIRT_START   SLOTN(196)
 #define FRAMETABLE_SIZE         GB(3)
 #define FRAMETABLE_NR           (FRAMETABLE_SIZE / sizeof(*frame_table))
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 57026e134d..14fce72fde 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -3,8 +3,251 @@
 #ifndef _ASM_RISCV_MM_H
 #define _ASM_RISCV_MM_H
 
+#include <public/xen.h>
+#include <xen/pdx.h>
+#include <xen/types.h>
+
+#include <asm/page.h>
 #include <asm/page-bits.h>
 
+#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
+#define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
+#define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
+#define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
+#define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
+#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)va))
+#define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
+#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
+#define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
+#define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
+#define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
+#define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
+#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)va))
+#define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
+
+#define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
+#define maddr_to_virt(pa) ((void *)((paddr_t)(pa) | DIRECTMAP_VIRT_START))
+
+/* Convert between Xen-heap virtual addresses and machine frame numbers. */
+#define __virt_to_mfn(va) (virt_to_maddr(va) >> PAGE_SHIFT)
+#define __mfn_to_virt(mfn) maddr_to_virt((paddr_t)(mfn) << PAGE_SHIFT)
+
+/* Convert between Xen-heap virtual addresses and page-info structures. */
+static inline struct page_info *virt_to_page(const void *v)
+{
+    BUG();
+    return NULL;
+}
+
+/*
+ * We define non-underscored wrappers for above conversion functions.
+ * These are overriden in various source files while underscored version
+ * remain intact.
+ */
+#define virt_to_mfn(va)     __virt_to_mfn(va)
+#define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
+
+struct page_info
+{
+    /* Each frame can be threaded onto a doubly-linked list. */
+    struct page_list_entry list;
+
+    /* Reference count and various PGC_xxx flags and fields. */
+    unsigned long count_info;
+
+    /* Context-dependent fields follow... */
+    union {
+        /* Page is in use: ((count_info & PGC_count_mask) != 0). */
+        struct {
+            /* Type reference count and various PGT_xxx flags and fields. */
+            unsigned long type_info;
+        } inuse;
+        /* Page is on a free list: ((count_info & PGC_count_mask) == 0). */
+        union {
+            struct {
+                /*
+                 * Index of the first *possibly* unscrubbed page in the buddy.
+                 * One more bit than maximum possible order to accommodate
+                 * INVALID_DIRTY_IDX.
+                 */
+#define INVALID_DIRTY_IDX ((1UL << (MAX_ORDER + 1)) - 1)
+                unsigned long first_dirty:MAX_ORDER + 1;
+
+                /* Do TLBs need flushing for safety before next page use? */
+                bool need_tlbflush:1;
+
+#define BUDDY_NOT_SCRUBBING    0
+#define BUDDY_SCRUBBING        1
+#define BUDDY_SCRUB_ABORT      2
+                unsigned long scrub_state:2;
+            };
+
+                unsigned long val;
+            } free;
+
+    } u;
+
+    union {
+        /* Page is in use, but not as a shadow. */
+        struct {
+            /* Owner of this page (zero if page is anonymous). */
+            struct domain *domain;
+        } inuse;
+
+        /* Page is on a free list. */
+        struct {
+            /* Order-size of the free chunk this page is the head of. */
+            unsigned int order;
+        } free;
+
+    } v;
+
+    union {
+        /*
+         * Timestamp from 'TLB clock', used to avoid extra safety flushes.
+         * Only valid for: a) free pages, and b) pages with zero type count
+         */
+        uint32_t tlbflush_timestamp;
+    };
+    uint64_t pad;
+};
+
+#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
+
+/* PDX of the first page in the frame table. */
+extern unsigned long frametable_base_pdx;
+
+/* Convert between machine frame numbers and page-info structures. */
+#define mfn_to_page(mfn)                                            \
+    (frame_table + (mfn_to_pdx(mfn) - frametable_base_pdx))
+#define page_to_mfn(pg)                                             \
+    pdx_to_mfn((unsigned long)((pg) - frame_table) + frametable_base_pdx)
+
+static inline void *page_to_virt(const struct page_info *pg)
+{
+    return mfn_to_virt(mfn_x(page_to_mfn(pg)));
+}
+
+/*
+ * Common code requires get_page_type and put_page_type.
+ * We don't care about typecounts so we just do the minimum to make it
+ * happy.
+ */
+static inline int get_page_type(struct page_info *page, unsigned long type)
+{
+    return 1;
+}
+
+static inline void put_page_type(struct page_info *page)
+{
+}
+
+static inline void put_page_and_type(struct page_info *page)
+{
+    put_page_type(page);
+    put_page(page);
+}
+
+/*
+ * RISC-V does not have an M2P, but common code expects a handful of
+ * M2P-related defines and functions. Provide dummy versions of these.
+ */
+#define INVALID_M2P_ENTRY        (~0UL)
+#define SHARED_M2P_ENTRY         (~0UL - 1UL)
+#define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
+
+/* Xen always owns P2M on RISC-V */
+#define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
+#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
+
+#define PDX_GROUP_SHIFT (16 + 5)
+
+static inline unsigned long domain_get_maximum_gpfn(struct domain *d)
+{
+    BUG();
+    return 0;
+}
+
+static inline long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    BUG();
+    return 0;
+}
+
+/*
+ * On RISCV, all the RAM is currently direct mapped in Xen.
+ * Hence return always true.
+ */
+static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
+{
+    return true;
+}
+
+#define PG_shift(idx)   (BITS_PER_LONG - (idx))
+#define PG_mask(x, idx) (x ## UL << PG_shift(idx))
+
+#define PGT_none          PG_mask(0, 1)  /* no special uses of this page   */
+#define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
+#define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
+
+ /* Count of uses of this frame as its current type. */
+#define PGT_count_width   PG_shift(2)
+#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
+
+/*
+ * Page needs to be scrubbed. Since this bit can only be set on a page that is
+ * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
+ */
+#define _PGC_need_scrub   _PGC_allocated
+#define PGC_need_scrub    PGC_allocated
+
+//  /* Cleared when the owning guest 'frees' this page. */
+#define _PGC_allocated    PG_shift(1)
+#define PGC_allocated     PG_mask(1, 1)
+  /* Page is Xen heap? */
+#define _PGC_xen_heap     PG_shift(2)
+#define PGC_xen_heap      PG_mask(1, 2)
+/* Page is broken? */
+#define _PGC_broken       PG_shift(7)
+#define PGC_broken        PG_mask(1, 7)
+ /* Mutually-exclusive page states: { inuse, offlining, offlined, free }. */
+#define PGC_state         PG_mask(3, 9)
+#define PGC_state_inuse   PG_mask(0, 9)
+#define PGC_state_offlining PG_mask(1, 9)
+#define PGC_state_offlined PG_mask(2, 9)
+#define PGC_state_free    PG_mask(3, 9)
+// #define page_state_is(pg, st) (((pg)->count_info&PGC_state) == PGC_state_##st)
+
+/* Count of references to this frame. */
+#define PGC_count_width   PG_shift(9)
+#define PGC_count_mask    ((1UL<<PGC_count_width)-1)
+
+#define page_state_is(pg, st) (((pg)->count_info&PGC_state) == PGC_state_##st)
+
+#define _PGC_extra        PG_shift(10)
+#define PGC_extra         PG_mask(1, 10)
+
+#define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
+#define is_xen_heap_mfn(mfn) \
+    (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
+
+#define is_xen_fixed_mfn(mfn)                                   \
+    ((mfn_to_maddr(mfn) >= virt_to_maddr(&_start)) &&           \
+     (mfn_to_maddr(mfn) <= virt_to_maddr((vaddr_t)_end - 1)))
+
+#define page_get_owner(_p)    (_p)->v.inuse.domain
+#define page_set_owner(_p,_d) ((_p)->v.inuse.domain = (_d))
+
+/* TODO: implement */
+#define mfn_valid(mfn) ({ (void) (mfn); 0; })
+
+#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
+
+#define domain_set_alloc_bitsize(d) ((void)0)
+#define domain_clamp_alloc_bitsize(d, b) (b)
+
+#define PFN_ORDER(_pfn) ((_pfn)->v.free.order)
+
 extern unsigned char cpu0_boot_stack[];
 
 void setup_initial_pagetables(void);
@@ -17,4 +260,9 @@ unsigned long calc_phys_offset(void);
 
 void turn_on_mmu(unsigned long ra);
 
+static inline unsigned int arch_get_dma_bitsize(void)
+{
+    return 32; /* TODO */
+}
+
 #endif /* _ASM_RISCV_MM_H */
-- 
2.43.0


