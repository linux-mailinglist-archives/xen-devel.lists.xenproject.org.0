Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34BA7F71BD
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:41:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640455.998726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TcB-00034X-6Z; Fri, 24 Nov 2023 10:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640455.998726; Fri, 24 Nov 2023 10:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TcB-00031k-31; Fri, 24 Nov 2023 10:40:51 +0000
Received: by outflank-mailman (input) for mailman id 640455;
 Fri, 24 Nov 2023 10:40:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTY-0006hx-DH
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:56 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab5bedd8-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:47 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a00b01955acso252686266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:47 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:45 -0800 (PST)
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
X-Inumbo-ID: ab5bedd8-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821906; x=1701426706; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Kbuuii/+7rQmgonB46PIVQoLZag642OKfw6nsrfRy8=;
        b=iRr6w3Ly3s364ncMCSjNaHERExnErwTYlahSyGgVt71wh/1Wg++l0UDNYkFsRmQQGp
         GTx+kjWJKrQSi4ZJvSz5KuFMKFZvfkZlw8QJ1JIJKCyyjukAnH7UoMirQw0j474PQhYF
         fC/JpM9ocErM40oVMXAL2j1umXieqPRp8/cQsQJq3xSckE0TbKoVbg1mj7/TIsP+wH2j
         rNlwK0U/nDatGZPM6iHWGdId8PtErBMMdNLAbeAh/K0C3cbFq1nMJI0hOnmnvHRzh/6p
         6r5BoYLzY/6p9mNAdjkDjYlqhMjmgDzpJxyrDT2L8/tQPYU+58p7UfnKFpyyROal6Ejm
         n8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821906; x=1701426706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Kbuuii/+7rQmgonB46PIVQoLZag642OKfw6nsrfRy8=;
        b=DsExdc22g7RxIJ0laitI6R3UkJEdWJFiJXTzYlEdTmF5+LzvbjJvFIJtL/7PhRqHvt
         WR6Wi1l1ZbrZ7ku1Ix50Gs4ITkVkWlc46qaOvF+8TqqrQvEBrgGMJO0EI+TlpzQz+hlY
         Fl5WHtaq2FMLmPPgl6FDjetmMZ52eC166w3Rn3lq56cGkgaWoRlNUe70dAQxkqt4QldS
         /E+wq3Ugw70WgIHldXXvXStSXCG4oYEsA1ZTD977nRVtyomJAHavQVCUHdx0npSqYuCI
         Pqgrr2fQS2r5Ph+TrXSsMRv5IsxSRr2KKiRrBBAJrRs5E10X4bBvDfQCiGxCF9/rUqBh
         awhQ==
X-Gm-Message-State: AOJu0YyhrNcWL7Xmx5VSzUW8BwcB6dCscTNwTnSNjqxHooPTsPr+qqHJ
	OrMdwShCvkCXJVKt+S5WRZp9X0O8jRvPJQ==
X-Google-Smtp-Source: AGHT+IFq0SCZr2yLlDzH678tDe2CxkBqcq+l+3icodbXegZpn/4jenHWQrDS1tWTXb1Al9WEgHCi8g==
X-Received: by 2002:a17:906:7385:b0:9b6:aac1:6fa5 with SMTP id f5-20020a170906738500b009b6aac16fa5mr1507668ejl.55.1700821906201;
        Fri, 24 Nov 2023 02:31:46 -0800 (PST)
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
Subject: [PATCH v2 36/39] xen/riscv: add minimal stuff to asm/mm.h to build full Xen
Date: Fri, 24 Nov 2023 12:30:56 +0200
Message-ID: <ec017ed24b1e5274d64d5458e4ab4475c92dece7.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - define stub for arch_get_dma_bitsize(void)
---
 xen/arch/riscv/include/asm/mm.h | 270 +++++++++++++++++++++++++++++++-
 1 file changed, 268 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 07c7a0abba..68460f6659 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -3,10 +3,271 @@
 #ifndef _ASM_RISCV_MM_H
 #define _ASM_RISCV_MM_H
 
+#include <public/xen.h>
+#include <xen/pdx.h>
+#include <xen/types.h>
+
+#include <asm/page.h>
 #include <asm/page-bits.h>
 
-#define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
-#define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
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
+#define maddr_to_virt(pa) ((void *)((paddr_t)(pa) | XEN_VIRT_START))
+
+/* Convert between Xen-heap virtual addresses and machine frame numbers. */
+#define __virt_to_mfn(va) (virt_to_maddr(va) >> PAGE_SHIFT)
+#define __mfn_to_virt(mfn) (maddr_to_virt((paddr_t)(mfn) << PAGE_SHIFT))
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
+            unsigned long val;
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
+        u32 tlbflush_timestamp;
+    };
+    u64 pad;
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
+    return;
+}
+
+/* TODO */
+static inline bool get_page_nr(struct page_info *page, const struct domain *domain,
+                        unsigned long nr)
+{
+    BUG();
+}
+static inline void put_page_nr(struct page_info *page, unsigned long nr)
+{
+    BUG();
+}
+
+static inline void put_page_and_type(struct page_info *page)
+{
+    put_page_type(page);
+    put_page(page);
+}
+
+/*
+ * RISCV does not have an M2P, but common code expects a handful of
+ * M2P-related defines and functions. Provide dummy versions of these.
+ */
+#define INVALID_M2P_ENTRY        (~0UL)
+#define SHARED_M2P_ENTRY         (~0UL - 1UL)
+#define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
+
+/* Xen always owns P2M on PPC */
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
+#ifdef CONFIG_STATIC_MEMORY
+/* Page is static memory */
+#define _PGC_static    PG_shift(3)
+#define PGC_static     PG_mask(1, 3)
+#else
+#define PGC_static     0
+#endif
+/* ... */
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
+// #define max_page (0UL)
+
+#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
+
+#define domain_set_alloc_bitsize(d) ((void)0)
+#define domain_clamp_alloc_bitsize(d, b) (b)
+
+#define PFN_ORDER(_pfn) ((_pfn)->v.free.order)
 
 extern unsigned char cpu0_boot_stack[];
 
@@ -20,4 +281,9 @@ unsigned long calc_phys_offset(void);
 
 void turn_on_mmu(unsigned long ra);
 
+static inline unsigned int arch_get_dma_bitsize(void)
+{
+    return 32; /* TODO */
+}
+
 #endif /* _ASM_RISCV_MM_H */
-- 
2.42.0


