Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D18D8BCBC0
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717441.1119739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNn-0004T6-S5; Mon, 06 May 2024 10:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717441.1119739; Mon, 06 May 2024 10:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNn-0004I6-DJ; Mon, 06 May 2024 10:15:43 +0000
Received: by outflank-mailman (input) for mailman id 717441;
 Mon, 06 May 2024 10:15:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loHM=MJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s3vNk-0001cU-K0
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:15:40 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 969ede62-0b91-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 12:15:39 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59d0810f59so128966066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:15:39 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h8-20020a17090634c800b00a59b8e16ac7sm2160242ejb.36.2024.05.06.03.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 03:15:38 -0700 (PDT)
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
X-Inumbo-ID: 969ede62-0b91-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714990539; x=1715595339; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lk6VYyilFs08cUPdzoh60bmbO+59bOcEn0s9QuoGbXk=;
        b=lRYjD1N/cMmXGWOMFiSHf/X4RIcYw+qxIHGwLchTuEbejRtzCOYoXJzm9bWTMUYr9o
         wulXY4XLdnqlUk08Jmxul1e5Fr3TW+X3GkOlD4Ad/D3dug4Z7kaB8zdjOfa/DHKYLWrx
         Q7Pk7HbBAbUeppNMFGrpKC4fzpVI+TbapDHLrUdnssgJjIDOAThYvuo/4anpWCVbBSiP
         +5z/gMfkqstmNhZW3Vt3V6rSx/bu9jnHh8DhREWfgMD0MM0JferElN41JCzOrzDEhojO
         a2/aM7EHnL+W8qg+O4YAdxzRaJuDJv4VDFfjo5mNEw0B1P0Y6lWW6ycQlVwwoZr4h/rQ
         +ZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990539; x=1715595339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lk6VYyilFs08cUPdzoh60bmbO+59bOcEn0s9QuoGbXk=;
        b=Bd6A3U83bDKXC4JIgj7JS3Q5kq/NwB2pVl3jfSIQyihNQaLS7Csed/326/yr5TsgDH
         rvqMDkZaDePEerSHNDvGYpVze97sKA5iypNxfcLrfNAKcNPgEDy31dNkuQwWQI1uT0c+
         3htN3fiCqYmIUvHBUtXdQK6zlhsaJCJXAewHGEVShuZhIHe1qpkgS9kZNWn49PrF+yLC
         lOqm979n1RymBlABAr25dU1jcC/gpAkUrqc8w+ttd12U8Z+W6XHo2D6udTAya/FKInwX
         W9niuvZJgWcys51FPoAVMVK8lOW8BAh79+y+uTxDcQSFn6kdFg8hWGVZIeVJ8hclaqDI
         JZIg==
X-Gm-Message-State: AOJu0YyXSKjgV2i1voVUy6JkaD94W255O4YiZu5Ci/lIxd7S6lbq6ANc
	EOrSk06g6r5SGpYEBaRZGbImKCqM30RaXFO3TBbzPZw++C49EYxScjF0NQ==
X-Google-Smtp-Source: AGHT+IGXXf4PJZWtyl5eyDzLpRVjcbHq+4Z1XT5ssfDhCAQYWWpoFfUnmSbW6OyckZh0vFg22++kxQ==
X-Received: by 2002:a17:907:3f18:b0:a59:cbff:a05 with SMTP id hq24-20020a1709073f1800b00a59cbff0a05mr2228667ejc.20.1714990538989;
        Mon, 06 May 2024 03:15:38 -0700 (PDT)
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
Subject: [PATCH v9 11/15] xen/riscv: add minimal stuff to mm.h to build full Xen
Date: Mon,  6 May 2024 12:15:20 +0200
Message-ID: <4240462c3d34afb62df56859a06a2199647a1f5a.1714988096.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1714988096.git.oleksii.kurochko@gmail.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V8-V9:
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
 xen/arch/riscv/include/asm/mm.h | 240 ++++++++++++++++++++++++++++++++
 xen/arch/riscv/mm.c             |   2 +-
 xen/arch/riscv/setup.c          |   2 +-
 3 files changed, 242 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 07c7a0abba..cc4a07a71c 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -3,11 +3,246 @@
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
@@ -20,4 +255,9 @@ unsigned long calc_phys_offset(void);
 
 void turn_on_mmu(unsigned long ra);
 
+static inline unsigned int arch_get_dma_bitsize(void)
+{
+    return 32; /* TODO */
+}
+
 #endif /* _ASM_RISCV_MM_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 053f043a3d..fe3a43be20 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -5,12 +5,12 @@
 #include <xen/init.h>
 #include <xen/kernel.h>
 #include <xen/macros.h>
+#include <xen/mm.h>
 #include <xen/pfn.h>
 
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
2.45.0


