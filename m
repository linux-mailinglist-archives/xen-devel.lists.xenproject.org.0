Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6903916970
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 15:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747734.1155228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6aa-0007OD-0k; Tue, 25 Jun 2024 13:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747734.1155228; Tue, 25 Jun 2024 13:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6aZ-0007L7-Tn; Tue, 25 Jun 2024 13:52:03 +0000
Received: by outflank-mailman (input) for mailman id 747734;
 Tue, 25 Jun 2024 13:52:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM6aY-0006cc-JM
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 13:52:02 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 190958a6-32fa-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 15:52:01 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a72459d8d6aso315885466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 06:52:01 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf560627sm521042666b.148.2024.06.25.06.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 06:52:00 -0700 (PDT)
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
X-Inumbo-ID: 190958a6-32fa-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719323521; x=1719928321; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iACHYw0ViqdZEm1bShLKi0SeTem6kMaBGRGTD9jGGV4=;
        b=ayuQznYTtjidzIXd98NNto4syzQW/jYmpQn9o2Z0qRkQLZkpHD45+wMWq5lyoqdg/W
         +JkRUUSeqQ5a9kLBFYjOzPRL2X872OC0scrdL6kRVN6gKZbrpua/Y6gA+9I3X68KhRk6
         Ng72SdJo6ghYvSOVWy2bbe/EQQG4AkoSAH9CQnAla82sMM1FsE5dp11jB8P+lb5D0HyP
         hTDzMtzt04Fr0SA/KJlnb9TjKdaDJCqp0/3SW8C5fveiiGiPrz4LApmJ4YV98KFt3lue
         Ua1IccMze70+bHb/tYkLBoscunGB1UccmxI5okIuKKco1x/IgjhNvITeLgHKk8XEDNl3
         h59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719323521; x=1719928321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iACHYw0ViqdZEm1bShLKi0SeTem6kMaBGRGTD9jGGV4=;
        b=JjmX0Ngm6il5HqE5shEh3xf3PvitMf/DcLxk6jzpclY+XXXvaNm2iEz/X8FPriO7Fs
         gropWPAOmZRIQGprwuRrKXU+g/xyhzx+ht93u47w5r1mqb/d6Mat/wvkPmG+UkR6h0zO
         W+ugLwB0+RwC6kE10mnl2JoFPUy3pBHIDejKohYAQQrIYNZYSaecO0ATSInIhH6Uhv2a
         +Q/7ZU0IeTmQG9J9g9tiDCzrX3y8H0Yn7Rj3i8ZFTr4znWb3SI069QJPju1yZEiDtz3L
         x22dJOrgHWFDKuOTbUKsC75LDLoS9pZEc3/SIuhA/keayjIdKNTS452dP0ts9w+HwhKp
         qt3A==
X-Gm-Message-State: AOJu0YzLfyYmIsIwbiWVJ4240pecyOoca/z2nj0YoX+xujAhNf5nMXIY
	6jysKyEIbaxrhyiGCk41IAK4DoO+GmzZsiY8KGhBWFONAe+4ZF7J2/QsR1bN
X-Google-Smtp-Source: AGHT+IGV61VTC6egFUh4af5viUarUPSdzr9VVX3CDvva449gjKX/up3ypiw6QSgceVhOOPRd3yYL4g==
X-Received: by 2002:a17:907:a64c:b0:a72:4d91:6223 with SMTP id a640c23a62f3a-a724d916363mr513226366b.62.1719323520449;
        Tue, 25 Jun 2024 06:52:00 -0700 (PDT)
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
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v13 03/10] xen/riscv: add minimal stuff to mm.h to build full Xen
Date: Tue, 25 Jun 2024 15:51:45 +0200
Message-ID: <3d44cf567f5c361cce2713808bcea1b1b6f4f032.1719319093.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719319093.git.oleksii.kurochko@gmail.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V13:
 - redefine mfn_to_page() and mfn_to_page().
 - add inclusion of <xen/section.h> after rebasing on top of staging.
---
Changes in V8-V12:
 - Nothing changed only rebase.
---
Changes in V7:
 - update argument type of maddr_to_virt() function: unsigned long -> paddr_t
 - rename argument of PFN_ORDER(): pfn -> pg.
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V6:
 - drop __virt_to_maddr() ( transform to macro ) and __maddr_to_virt ( rename to maddr_to_virt ).
 - parenthesize va in definition of vmap_to_mfn().
 - Code style fixes.
---
Changes in V5:
 - update the comment around "struct domain *domain;" : zero -> NULL
 - fix ident. for unsigned long val;
 - put page_to_virt() and virt_to_page() close to each other.
 - drop unnessary leading underscore
 - drop a space before the comment: /* Count of uses of this frame as its current type. */
 - drop comment about a page 'not as a shadow'. it is not necessary for RISC-V
---
Changes in V4:
 - update an argument name of PFN_ORDERN macros.
 - drop pad at the end of 'struct page_info'.
 - Change message -> subject in "Changes in V3"
 - delete duplicated macros from riscv/mm.h
 - fix identation in struct page_info
 - align comment for PGC_ macros
 - update definitions of domain_set_alloc_bitsize() and domain_clamp_alloc_bitsize()
 - drop unnessary comments.
 - s/BUG/BUG_ON("...")
 - define __virt_to_maddr, __maddr_to_virt as stubs
 - add inclusion of xen/mm-frame.h for mfn_x and others
 - include "xen/mm.h" instead of "asm/mm.h" to fix compilation issues:
	 In file included from arch/riscv/setup.c:7:
	./arch/riscv/include/asm/mm.h:60:28: error: field 'list' has incomplete type
	   60 |     struct page_list_entry list;
	      |                            ^~~~
	./arch/riscv/include/asm/mm.h:81:43: error: 'MAX_ORDER' undeclared here (not in a function)
	   81 |                 unsigned long first_dirty:MAX_ORDER + 1;
	      |                                           ^~~~~~~~~
	./arch/riscv/include/asm/mm.h:81:31: error: bit-field 'first_dirty' width not an integer constant
	   81 |                 unsigned long first_dirty:MAX_ORDER + 1;
 - Define __virt_to_mfn() and __mfn_to_virt() using maddr_to_mfn() and mfn_to_maddr().
---
Changes in V3:
 - update the commit title
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
 xen/arch/riscv/include/asm/mm.h | 235 ++++++++++++++++++++++++++++++++
 xen/arch/riscv/mm.c             |   2 +-
 xen/arch/riscv/setup.c          |   2 +-
 3 files changed, 237 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 07c7a0abba..8f05937b0d 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -3,11 +3,241 @@
 #ifndef _ASM_RISCV_MM_H
 #define _ASM_RISCV_MM_H
 
+#include <public/xen.h>
+#include <xen/bug.h>
+#include <xen/mm-frame.h>
+#include <xen/pdx.h>
+#include <xen/types.h>
+
 #include <asm/page-bits.h>
 
 #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
 #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
 
+#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
+#define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
+#define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
+#define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
+#define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
+#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)(va)))
+#define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
+
+static inline void *maddr_to_virt(paddr_t ma)
+{
+    BUG_ON("unimplemented");
+    return NULL;
+}
+
+#define virt_to_maddr(va) ({ BUG_ON("unimplemented"); 0; })
+
+/* Convert between Xen-heap virtual addresses and machine frame numbers. */
+#define __virt_to_mfn(va)  mfn_x(maddr_to_mfn(virt_to_maddr(va)))
+#define __mfn_to_virt(mfn) maddr_to_virt(mfn_to_maddr(_mfn(mfn)))
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
+
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
+        } free;
+    } u;
+
+    union {
+        /* Page is in use */
+        struct {
+            /* Owner of this page (NULL if page is anonymous). */
+            struct domain *domain;
+        } inuse;
+
+        /* Page is on a free list. */
+        struct {
+            /* Order-size of the free chunk this page is the head of. */
+            unsigned int order;
+        } free;
+    } v;
+
+    union {
+        /*
+         * Timestamp from 'TLB clock', used to avoid extra safety flushes.
+         * Only valid for: a) free pages, and b) pages with zero type count
+         */
+        uint32_t tlbflush_timestamp;
+    };
+};
+
+#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
+
+/* Convert between machine frame numbers and page-info structures. */
+#define mfn_to_page(mfn)    (frame_table + mfn_x(mfn))
+#define page_to_mfn(pg)     _mfn((unsigned long)((pg) - frame_table))
+
+static inline void *page_to_virt(const struct page_info *pg)
+{
+    return mfn_to_virt(mfn_x(page_to_mfn(pg)));
+}
+
+/* Convert between Xen-heap virtual addresses and page-info structures. */
+static inline struct page_info *virt_to_page(const void *v)
+{
+    BUG_ON("unimplemented");
+    return NULL;
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
+#define set_gpfn_from_mfn(mfn, pfn) do { (void)(mfn), (void)(pfn); } while (0)
+#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
+
+#define PDX_GROUP_SHIFT (PAGE_SHIFT + VPN_BITS)
+
+static inline unsigned long domain_get_maximum_gpfn(struct domain *d)
+{
+    BUG_ON("unimplemented");
+    return 0;
+}
+
+static inline long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    BUG_ON("unimplemented");
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
+/* Count of uses of this frame as its current type. */
+#define PGT_count_width   PG_shift(2)
+#define PGT_count_mask    ((1UL << PGT_count_width) - 1)
+
+/*
+ * Page needs to be scrubbed. Since this bit can only be set on a page that is
+ * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
+ */
+#define _PGC_need_scrub   _PGC_allocated
+#define PGC_need_scrub    PGC_allocated
+
+/* Cleared when the owning guest 'frees' this page. */
+#define _PGC_allocated    PG_shift(1)
+#define PGC_allocated     PG_mask(1, 1)
+/* Page is Xen heap? */
+#define _PGC_xen_heap     PG_shift(2)
+#define PGC_xen_heap      PG_mask(1, 2)
+/* Page is broken? */
+#define _PGC_broken       PG_shift(7)
+#define PGC_broken        PG_mask(1, 7)
+/* Mutually-exclusive page states: { inuse, offlining, offlined, free }. */
+#define PGC_state         PG_mask(3, 9)
+#define PGC_state_inuse   PG_mask(0, 9)
+#define PGC_state_offlining PG_mask(1, 9)
+#define PGC_state_offlined PG_mask(2, 9)
+#define PGC_state_free    PG_mask(3, 9)
+#define page_state_is(pg, st) (((pg)->count_info&PGC_state) == PGC_state_##st)
+
+/* Count of references to this frame. */
+#define PGC_count_width   PG_shift(9)
+#define PGC_count_mask    ((1UL << PGC_count_width) - 1)
+
+#define _PGC_extra        PG_shift(10)
+#define PGC_extra         PG_mask(1, 10)
+
+#define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
+#define is_xen_heap_mfn(mfn) \
+    (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
+
+#define is_xen_fixed_mfn(mfn)                                   \
+    ((mfn_to_maddr(mfn) >= virt_to_maddr((vaddr_t)_start)) &&   \
+     (mfn_to_maddr(mfn) <= virt_to_maddr((vaddr_t)_end - 1)))
+
+#define page_get_owner(p)    (p)->v.inuse.domain
+#define page_set_owner(p, d) ((p)->v.inuse.domain = (d))
+
+/* TODO: implement */
+#define mfn_valid(mfn) ({ (void)(mfn); 0; })
+
+#define domain_set_alloc_bitsize(d) ((void)(d))
+#define domain_clamp_alloc_bitsize(d, b) ((void)(d), (b))
+
+#define PFN_ORDER(pg) ((pg)->v.free.order)
+
 extern unsigned char cpu0_boot_stack[];
 
 void setup_initial_pagetables(void);
@@ -20,4 +250,9 @@ unsigned long calc_phys_offset(void);
 
 void turn_on_mmu(unsigned long ra);
 
+static inline unsigned int arch_get_dma_bitsize(void)
+{
+    return 32; /* TODO */
+}
+
 #endif /* _ASM_RISCV_MM_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 3ebaf6da01..ae381e9581 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -4,13 +4,13 @@
 #include <xen/init.h>
 #include <xen/kernel.h>
 #include <xen/macros.h>
+#include <xen/mm.h>
 #include <xen/pfn.h>
 #include <xen/sections.h>
 
 #include <asm/early_printk.h>
 #include <asm/csr.h>
 #include <asm/current.h>
-#include <asm/mm.h>
 #include <asm/page.h>
 #include <asm/processor.h>
 
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 6593f601c1..98a94c4c48 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -2,9 +2,9 @@
 
 #include <xen/compile.h>
 #include <xen/init.h>
+#include <xen/mm.h>
 
 #include <asm/early_printk.h>
-#include <asm/mm.h>
 
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
-- 
2.45.2


