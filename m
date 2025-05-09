Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349BEAB1980
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 17:58:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980136.1366664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQ6u-0007pE-9f; Fri, 09 May 2025 15:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980136.1366664; Fri, 09 May 2025 15:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQ6u-0007j9-1t; Fri, 09 May 2025 15:58:04 +0000
Received: by outflank-mailman (input) for mailman id 980136;
 Fri, 09 May 2025 15:58:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZIRI=XZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uDQ6s-0006Ks-Ar
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 15:58:02 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 626e0f93-2cee-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 17:58:01 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac2ab99e16eso450199566b.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 08:58:01 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21947a88fsm168723766b.81.2025.05.09.08.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 08:57:59 -0700 (PDT)
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
X-Inumbo-ID: 626e0f93-2cee-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746806281; x=1747411081; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fggvTYSwOTWplurf3s3S6bhydsxGV/TZFhAArb8TvRo=;
        b=QHt7T9vOpEWWNdoL4q0sPa0nh2MSlBb2mGXhPGqDHbQ5zHoZ+oWuyCO2pO+q9wAJn5
         yQOxR59igIdgEKXs4NuXk8X6uClmUzqUzMTky3lFczXd/o4MYVHEDb3Yv1UcVzGnwpGt
         hWEcScj2FpAjfEvp95yZ0UhCFRg0MIvRd8CCEGAiLMOYM13cia8UkNseR3LbDsqL6N+g
         PaFO5tqIOup3CSMOJnwRWK5RR//XD+VxATlmaqYRtL6ea1LSiTd8f7ADmHQIrebh6zcL
         W8G9tIjarxBQhE1JVYDAgbLhye8minV16x7MB1KfhmUY8BSvrtSe/aUZH5Cv+F1xJIWw
         DTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806281; x=1747411081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fggvTYSwOTWplurf3s3S6bhydsxGV/TZFhAArb8TvRo=;
        b=XZiYj/gOqpxMWv/AXTFVWcwfRz1XM1/dIvR9OnWWf1zVFesFF4q6WQWpHx68+Zo/aN
         qxpCoQx5+uKEZHjWnYpwDxsHOgd31l4eQ12NAgMeXihUhu9ZsZleOs8+bHoAIO3Igy44
         VZaBIdGqhHCLSl8VBOBcGHM6CDPYfsiiR9CTcWpIgChOLu3jDOF4C7aoecskjSW4L+vQ
         6LS52ynW5Ml6239g7b1fy9NGEgUdVcnWow3DW4aYYdhAYDS/Itnp8OeBI+SbUB6bmFA9
         FyST+Qs4YXnS0RFM0LJ1J20H01tY4kvxPhTcOkJbF1nZIzNP+Jm+neNE2DbAeHnZJ8Ag
         o51w==
X-Gm-Message-State: AOJu0YyFrfLWQ0zg3o9jIHUQGvCC2BK+WXe8qDTWt/cv3wdHIJ0NgMk6
	b+JpTWXX611/MKovmhubxOhWKQGrUH2G7L+EL+0WNv6QtjVJ22MfYYaYBg==
X-Gm-Gg: ASbGncsPLmwYo/AuwVNLbbk19f6lBu64l71sMiRDM76szxyXiOzapbc/ugDlMHXKjoT
	BciI8p3jShA++TH/vSq6YAk99bq7Xagg4PCwpHraJI/J5EVsRE1jv6Mn+UWs92tsNs78uzXMG0O
	nZIy+WZpW/xTz+lSc+s83G3hvEHKizqgEW/uLhdShZeEHCRzQq96RbjtZvKF8BaV49oJOL0DZKR
	iA1pE8wXb5vqUEHBpD1y4kpn/5+5Y0VSs00M8yG5teLCZsxGWpv408hr4fjKaJ4qqUEAAlCAQ7Q
	CsILpS3PFDSqnFTmjKnMbIwOKUkfTej1U6+7vZwFWbrYojYUPQ808dCajhY46tERJaXLUVUHqtz
	NzRegr7Sm0w==
X-Google-Smtp-Source: AGHT+IERO9vfGg9X90kgPsdY4amzJgxeoNXm8QvJJwy506pTVmqWxyWlwT+eJtke7o4974rMf/304g==
X-Received: by 2002:a17:907:7da2:b0:ad1:f880:5796 with SMTP id a640c23a62f3a-ad21901c802mr436898466b.33.1746806280319;
        Fri, 09 May 2025 08:58:00 -0700 (PDT)
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
Subject: [PATCH v1 6/6] xen/riscv: implement p2m mapping functionality
Date: Fri,  9 May 2025 17:57:51 +0200
Message-ID: <c6324b268bf985e8a5e7254a4b181842a860dd94.1746805907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746805907.git.oleksii.kurochko@gmail.com>
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These utilities are needed for building and managing RISC-V guest page
tables and MMIO mappings by using functions map_regions_p2mt() and
guest_physmap_add_entry().

To implement p2m mapping functionality the following is introduced:
- Define P2M root level/order and entry count.
- Introdude radix type for p2m types as it isn't enough free bits in pte
  and the helpers (p2m_type_radix_{get,set}()) to deal with them.
- Introduce p2m_is_*() helpers() as  pte_is_*() helpers are checking
  the valid bit set in the PTE but we have to check p2m_type instead
  (look at the comment above p2m_is_valid() for some details).
- Introduce helper to set p2m's pte permission: p2m_set_permissions().
- Introduce helper to create p2m entry based on mfn, p2m_type_t and
  p2m_access_t.
- Introduce helper to generate table entry with correct attributes:
  page_to_p2m_table().
- Introduce p2m page allocation function: p2m_alloc_page().
- Introduce functions to write/remove p2m's entries: p2m_{write,remove}_pte().
- Introduce function to allocate p2m table: p2m_create_table().
- Introduce functions used to free p2m entry.
- Introduce function for table walking: p2m_next_level().
- Introduce function to insert an entry in the p2m (p2m_set_entry()).
- Introduce superpage splitting: p2m_split_superpage()).
- Introduce page table type defines (PGT_{none,writable_page}, etc).

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/mm.h   |  32 +-
 xen/arch/riscv/include/asm/p2m.h  |  17 +-
 xen/arch/riscv/include/asm/page.h |  11 +
 xen/arch/riscv/p2m.c              | 780 ++++++++++++++++++++++++++++++
 4 files changed, 829 insertions(+), 11 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 972ec45448..c1e4519839 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -12,6 +12,7 @@
 #include <xen/sections.h>
 #include <xen/types.h>
 
+#include <asm/cmpxchg.h>
 #include <asm/page-bits.h>
 
 extern vaddr_t directmap_virt_start;
@@ -229,9 +230,21 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 #define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
 #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
 
-/* Count of uses of this frame as its current type. */
-#define PGT_count_width   PG_shift(2)
-#define PGT_count_mask    ((1UL << PGT_count_width) - 1)
+ /* 9-bit count of uses of this frame as its current type. */
+#define PGT_count_mask    PG_mask(0x3FF, 10)
+
+/*
+ * Sv32 has 22-bit GFN. Sv{39, 48, 57} have 44-bit GFN.
+ * Thereby we can use for `type_info` 10 bits for all modes, having the same
+ * amount of bits for `type_info` for all MMU modes let us avoid introducing
+ * an extra #ifdef to that header:
+ *   if we go with maximum possible bits for count on each configuration
+ *   we would need to have a set of PGT_count_* and PGT_gfn_*).
+ */
+#define PGT_gfn_width     PG_shift(10)
+#define PGT_gfn_mask      (BIT(PGT_gfn_width, UL) - 1)
+
+#define PGT_INVALID_XENHEAP_GFN   _gfn(PGT_gfn_mask)
 
 /*
  * Page needs to be scrubbed. Since this bit can only be set on a page that is
@@ -283,6 +296,19 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 
 #define PFN_ORDER(pg) ((pg)->v.free.order)
 
+static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
+{
+    gfn_t gfn_ = gfn_eq(gfn, INVALID_GFN) ? PGT_INVALID_XENHEAP_GFN : gfn;
+    unsigned long x, nx, y = p->u.inuse.type_info;
+
+    ASSERT(is_xen_heap_page(p));
+
+    do {
+        x = y;
+        nx = (x & ~PGT_gfn_mask) | gfn_x(gfn_);
+    } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
+}
+
 extern unsigned char cpu0_boot_stack[];
 
 void setup_initial_pagetables(void);
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 0fcfec7f03..9f4633501f 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -9,8 +9,13 @@
 #include <xen/rwlock.h>
 #include <xen/types.h>
 
+#include <asm/page.h>
 #include <asm/page-bits.h>
 
+#define P2M_ROOT_LEVEL  HYP_PT_ROOT_LEVEL
+#define P2M_ROOT_ORDER  XEN_PT_LEVEL_ORDER(P2M_ROOT_LEVEL)
+#define P2M_ROOT_PAGES  (1U << P2M_ROOT_ORDER)
+
 #define paddr_bits PADDR_BITS
 
 /* Get host p2m table */
@@ -145,14 +150,10 @@ static inline int guest_physmap_mark_populate_on_demand(struct domain *d,
     return -EOPNOTSUPP;
 }
 
-static inline int guest_physmap_add_entry(struct domain *d,
-                                          gfn_t gfn, mfn_t mfn,
-                                          unsigned long page_order,
-                                          p2m_type_t t)
-{
-    BUG_ON("unimplemented");
-    return -EINVAL;
-}
+int guest_physmap_add_entry(struct domain *d,
+                            gfn_t gfn, mfn_t mfn,
+                            unsigned long page_order,
+                            p2m_type_t t);
 
 /* Untyped version for RAM only, for compatibility */
 static inline int __must_check
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index cb3dea309c..a5c6f5140d 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -22,6 +22,7 @@
 #define XEN_PT_LEVEL_SIZE(lvl)      (_AT(paddr_t, 1) << XEN_PT_LEVEL_SHIFT(lvl))
 #define XEN_PT_LEVEL_MAP_MASK(lvl)  (~(XEN_PT_LEVEL_SIZE(lvl) - 1))
 #define XEN_PT_LEVEL_MASK(lvl)      (VPN_MASK << XEN_PT_LEVEL_SHIFT(lvl))
+#define XEN_PT_ENTRIES              (_AT(unsigned int, 1) << PAGETABLE_ORDER)
 
 /*
  * PTE format:
@@ -69,10 +70,20 @@
 #define PTE_PMBT_NOCACHE    BIT(61, UL)
 #define PTE_PMBT_IO         BIT(62, UL)
 
+enum pmbt_type_t {
+    pbmt_pma,
+    pbmt_nc,
+    pbmt_io,
+    pbmt_rsvd,
+    pbmt_max,
+};
+
 #define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
 
 #define PTE_PBMT_MASK   (PTE_PMBT_NOCACHE | PTE_PMBT_IO)
 
+#define P2M_CLEAR_PERM(p2m_pte) ((p2m_pte).pte & ~PTE_ACCESS_MASK)
+
 /* Calculate the offsets into the pagetables for a given VA */
 #define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
 
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index a890870391..84cb3d28af 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -135,6 +135,37 @@ static int p2m_alloc_table(struct domain *d)
     return 0;
 }
 
+static p2m_type_t p2m_type_radix_get(struct p2m_domain *p2m, pte_t pte)
+{
+    void *ptr;
+
+    ptr = radix_tree_lookup(&p2m->p2m_type, pte.pte);
+
+    if ( !ptr )
+        return p2m_invalid;
+
+    return radix_tree_ptr_to_int(ptr);
+}
+
+static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
+{
+    int rc;
+
+    rc = radix_tree_insert(&p2m->p2m_type, pte.pte,
+                           radix_tree_int_to_ptr(t));
+    if ( rc == -EEXIST )
+    {
+        /* If a setting already exists, change it to the new one */
+        radix_tree_replace_slot(
+            radix_tree_lookup_slot(
+                &p2m->p2m_type, pte.pte),
+            radix_tree_int_to_ptr(t));
+        rc = 0;
+    }
+
+    return rc;
+}
+
 int p2m_init(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
@@ -233,3 +264,752 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
 
     return 0;
 }
+
+/*
+ * Find and map the root page table. The caller is responsible for
+ * unmapping the table.
+ *
+ * The function will return NULL if the offset of the root table is
+ * invalid.
+ */
+static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
+{
+    unsigned long root_table;
+
+    root_table = gfn_x(gfn) >> XEN_PT_LEVEL_ORDER(P2M_ROOT_LEVEL);
+    if ( root_table >= P2M_ROOT_PAGES )
+        return NULL;
+
+    return __map_domain_page(p2m->root + root_table);
+}
+
+/*
+ * In the case of the P2M, the valid bit is used for other purpose. Use
+ * the type to check whether an entry is valid.
+ */
+static inline bool p2m_is_valid(struct p2m_domain *p2m, pte_t pte)
+{
+    return p2m_type_radix_get(p2m, pte) != p2m_invalid;
+}
+
+/*
+ * pte_is_* helpers are checking the valid bit set in the
+ * PTE but we have to check p2m_type instead (look at the comment above
+ * p2m_is_valid())
+ * Provide our own overlay to check the valid bit.
+ */
+static inline bool p2m_is_mapping(struct p2m_domain *p2m, pte_t pte)
+{
+    return p2m_is_valid(p2m, pte) && (pte.pte & PTE_ACCESS_MASK);
+}
+
+static inline bool p2m_is_superpage(struct p2m_domain *p2m, pte_t pte,
+                                    unsigned int level)
+{
+    return p2m_is_valid(p2m, pte) && (pte.pte & PTE_ACCESS_MASK) &&
+           (level > 0);
+}
+
+static void p2m_set_permission(pte_t *e, p2m_type_t t, p2m_access_t a)
+{
+    /* First apply type permissions */
+    switch ( t )
+    {
+    case p2m_ram_rw:
+        e->bits.r = 1;
+        e->bits.w = 1;
+        e->bits.x = 1;
+
+        break;
+
+    case p2m_mmio_direct_dev:
+        e->bits.r = 1;
+        e->bits.w = 1;
+        e->bits.x = 0;
+        break;
+
+    case p2m_invalid:
+        e->bits.r = 0;
+        e->bits.w = 0;
+        e->bits.x = 0;
+        break;
+
+    default:
+        BUG();
+        break;
+    }
+
+    /* Then restrict with access permissions */
+    switch ( a )
+    {
+    case p2m_access_rwx:
+        break;
+    case p2m_access_wx:
+        e->bits.r = 0;
+        break;
+    case p2m_access_rw:
+        e->bits.x = 0;
+        break;
+    case p2m_access_w:
+        e->bits.r = 0;
+        e->bits.x = 0;
+        break;
+    case p2m_access_rx:
+    case p2m_access_rx2rw:
+        e->bits.w = 0;
+        break;
+    case p2m_access_x:
+        e->bits.r = 0;
+        e->bits.w = 0;
+        break;
+    case p2m_access_r:
+        e->bits.w = 0;
+        e->bits.x = 0;
+        break;
+    case p2m_access_n:
+    case p2m_access_n2rwx:
+        e->bits.r = 0;
+        e->bits.w = 0;
+        e->bits.x = 0;
+        break;
+    default:
+        BUG();
+        break;
+    }
+}
+
+static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t, p2m_access_t a)
+{
+    pte_t e = (pte_t) {
+        .bits.v = 1,
+    };
+
+    switch ( t )
+    {
+    case p2m_mmio_direct_dev:
+        e.bits.pbmt = pbmt_io;
+        break;
+
+    default:
+        e.bits.pbmt = pbmt_pma;
+        break;
+    }
+
+    p2m_set_permission(&e, t, a);
+
+    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK));
+
+    pte_set_mfn(&e, mfn);
+
+    BUG_ON(p2m_type_radix_set(p2m, e, t));
+
+    return e;
+}
+
+/* Generate table entry with correct attributes. */
+static pte_t page_to_p2m_table(struct p2m_domain *p2m, struct page_info *page)
+{
+    /*
+     * Since this function generates a table entry, according to "Encoding
+     * of PTE R/W/X fields," the entry's r, w, and x fields must be set to 0
+     * to point to the next level of the page table.
+     * Therefore, to ensure that an entry is a page table entry,
+     * `p2m_access_n2rwx` is passed to `mfn_to_p2m_entry()` as the access value,
+     * which overrides whatever was passed as `p2m_type_t` and guarantees that
+     * the entry is a page table entry by setting r = w = x = 0.
+     */
+    return p2m_entry_from_mfn(p2m, page_to_mfn(page), p2m_ram_rw, p2m_access_n2rwx);
+}
+
+static struct page_info *p2m_alloc_page(struct domain *d)
+{
+    struct page_info *pg;
+
+    /*
+     * For hardware domain, there should be no limit in the number of pages that
+     * can be allocated, so that the kernel may take advantage of the extended
+     * regions. Hence, allocate p2m pages for hardware domains from heap.
+     */
+    if ( is_hardware_domain(d) )
+    {
+        pg = alloc_domheap_page(d, MEMF_no_owner);
+        if ( pg == NULL )
+            printk(XENLOG_G_ERR "Failed to allocate P2M pages for hwdom.\n");
+    }
+    else
+    {
+        spin_lock(&d->arch.paging.lock);
+        pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
+        spin_unlock(&d->arch.paging.lock);
+    }
+
+    return pg;
+}
+
+static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_pte)
+{
+    write_pte(p, pte);
+    if ( clean_pte )
+        clean_dcache_va_range(p, sizeof(*p));
+}
+
+static inline void p2m_remove_pte(pte_t *p, bool clean_pte)
+{
+    pte_t pte;
+
+    memset(&pte, 0x00, sizeof(pte));
+    p2m_write_pte(p, pte, clean_pte);
+}
+
+/* Allocate a new page table page and hook it in via the given entry. */
+static int p2m_create_table(struct p2m_domain *p2m, pte_t *entry)
+{
+    struct page_info *page;
+    pte_t *p;
+
+    ASSERT(!p2m_is_valid(p2m, *entry));
+
+    page = p2m_alloc_page(p2m->domain);
+    if ( page == NULL )
+        return -ENOMEM;
+
+    page_list_add(page, &p2m->pages);
+
+    p = __map_domain_page(page);
+    clear_page(p);
+
+    unmap_domain_page(p);
+
+    p2m_write_pte(entry, page_to_p2m_table(p2m, page), p2m->clean_pte);
+
+    return 0;
+}
+
+#define GUEST_TABLE_MAP_NONE 0
+#define GUEST_TABLE_MAP_NOMEM 1
+#define GUEST_TABLE_SUPER_PAGE 2
+#define GUEST_TABLE_NORMAL 3
+
+/*
+ * Take the currently mapped table, find the corresponding GFN entry,
+ * and map the next table, if available. The previous table will be
+ * unmapped if the next level was mapped (e.g GUEST_TABLE_NORMAL
+ * returned).
+ *
+ * `alloc_tbl` parameter indicates whether intermediate tables should
+ * be allocated when not present.
+ *
+ * Return values:
+ *  GUEST_TABLE_MAP_NONE: a table allocation isn't permitted.
+ *  GUEST_TABLE_MAP_NOMEM: allocating a new page failed.
+ *  GUEST_TABLE_SUPER_PAGE: next level or leaf mapped normally.
+ *  GUEST_TABLE_NORMAL: The next entry points to a superpage.
+ */
+static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
+                          unsigned int level, pte_t **table,
+                          unsigned int offset)
+{
+    pte_t *entry;
+    int ret;
+    mfn_t mfn;
+
+    entry = *table + offset;
+
+    if ( !p2m_is_valid(p2m, *entry) )
+    {
+        if ( !alloc_tbl )
+            return GUEST_TABLE_MAP_NONE;
+
+        ret = p2m_create_table(p2m, entry);
+        if ( ret )
+            return GUEST_TABLE_MAP_NOMEM;
+    }
+
+    /* The function p2m_next_level() is never called at the last level */
+    ASSERT(level != 0);
+    if ( p2m_is_mapping(p2m, *entry) )
+        return GUEST_TABLE_SUPER_PAGE;
+
+    mfn = mfn_from_pte(*entry);
+
+    unmap_domain_page(*table);
+    *table = map_domain_page(mfn);
+
+    return GUEST_TABLE_NORMAL;
+}
+
+static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
+                                unsigned int level, unsigned int target,
+                                const unsigned int *offsets)
+{
+    struct page_info *page;
+    unsigned int i;
+    pte_t pte, *table;
+    bool rv = true;
+
+    /* Convenience aliases */
+    mfn_t mfn = pte_get_mfn(*entry);
+    unsigned int next_level = level - 1;
+    unsigned int level_order = XEN_PT_LEVEL_ORDER(next_level);
+
+    /*
+     * This should only be called with target != level and the entry is
+     * a superpage.
+     */
+    ASSERT(level > target);
+    ASSERT(p2m_is_superpage(p2m, *entry, level));
+
+    page = p2m_alloc_page(p2m->domain);
+    if ( !page )
+        return false;
+
+    page_list_add(page, &p2m->pages);
+    table = __map_domain_page(page);
+
+    /*
+     * We are either splitting a first level 1G page into 512 second level
+     * 2M pages, or a second level 2M page into 512 third level 4K pages.
+     */
+    for ( i = 0; i < XEN_PT_ENTRIES; i++ )
+    {
+        pte_t *new_entry = table + i;
+
+        /*
+         * Use the content of the superpage entry and override
+         * the necessary fields. So the correct permission are kept.
+         */
+        pte = *entry;
+        pte_set_mfn(&pte, mfn_add(mfn, i << level_order));
+
+        write_pte(new_entry, pte);
+    }
+
+    /*
+     * Shatter superpage in the page to the level we want to make the
+     * changes.
+     * This is done outside the loop to avoid checking the offset to
+     * know whether the entry should be shattered for every entry.
+     */
+    if ( next_level != target )
+        rv = p2m_split_superpage(p2m, table + offsets[next_level],
+                                 level - 1, target, offsets);
+
+    /* TODO: why it is necessary to have clean here? Not somewhere in the caller */
+    if ( p2m->clean_pte )
+        clean_dcache_va_range(table, PAGE_SIZE);
+
+    unmap_domain_page(table);
+
+    /*
+     * Even if we failed, we should install the newly allocated PTE
+     * entry. The caller will be in charge to free the sub-tree.
+     */
+    p2m_write_pte(entry, page_to_p2m_table(p2m, page), p2m->clean_pte);
+
+    return rv;
+}
+
+static void p2m_put_foreign_page(struct page_info *pg)
+{
+    /*
+     * It's safe to do the put_page here because page_alloc will
+     * flush the TLBs if the page is reallocated before the end of
+     * this loop.
+     */
+    put_page(pg);
+}
+
+/* Put any references on the single 4K page referenced by mfn. */
+static void p2m_put_4k_page(mfn_t mfn, p2m_type_t type)
+{
+    /* TODO: Handle other p2m types */
+    if ( p2m_is_foreign(type) )
+    {
+        ASSERT(mfn_valid(mfn));
+        p2m_put_foreign_page(mfn_to_page(mfn));
+    }
+    /* Detect the xenheap page and mark the stored GFN as invalid. */
+    else if ( p2m_is_ram(type) && is_xen_heap_mfn(mfn) )
+        page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
+}
+
+/* Put any references on the superpage referenced by mfn. */
+static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
+{
+    struct page_info *pg;
+    unsigned int i;
+
+    /*
+     * TODO: Handle other p2m types, but be aware that any changes to handle
+     * different types should require an update on the relinquish code to handle
+     * preemption.
+     */
+    if ( !p2m_is_foreign(type) )
+        return;
+
+    ASSERT(mfn_valid(mfn));
+
+    pg = mfn_to_page(mfn);
+
+    for ( i = 0; i < XEN_PT_ENTRIES; i++, pg++ )
+        p2m_put_foreign_page(pg);
+}
+
+/* Put any references on the page referenced by pte. */
+static void p2m_put_page(struct p2m_domain *p2m, const pte_t pte,
+                         unsigned int level)
+{
+    mfn_t mfn = pte_get_mfn(pte);
+    p2m_type_t p2m_type = p2m_type_radix_get(p2m, pte);
+
+    ASSERT(p2m_is_valid(p2m, pte));
+
+    /*
+     * TODO: Currently we don't handle level 2 super-page, Xen is not
+     * preemptible and therefore some work is needed to handle such
+     * superpages, for which at some point Xen might end up freeing memory
+     * and therefore for such a big mapping it could end up in a very long
+     * operation.
+     */
+    if ( level == 1 )
+        return p2m_put_2m_superpage(mfn, p2m_type);
+    else if ( level == 0 )
+        return p2m_put_4k_page(mfn, p2m_type);
+}
+
+static void p2m_free_page(struct domain *d, struct page_info *pg)
+{
+    if ( is_hardware_domain(d) )
+        free_domheap_page(pg);
+    else
+    {
+        spin_lock(&d->arch.paging.lock);
+        page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
+        spin_unlock(&d->arch.paging.lock);
+    }
+}
+
+/* Free pte sub-tree behind an entry */
+static void p2m_free_entry(struct p2m_domain *p2m,
+                           pte_t entry, unsigned int level)
+{
+    unsigned int i;
+    pte_t *table;
+    mfn_t mfn;
+    struct page_info *pg;
+
+    /* Nothing to do if the entry is invalid. */
+    if ( !p2m_is_valid(p2m, entry) )
+        return;
+
+    if ( p2m_is_superpage(p2m, entry, level) || (level == 0) )
+    {
+#ifdef CONFIG_IOREQ_SERVER
+        /*
+         * If this gets called then either the entry was replaced by an entry
+         * with a different base (valid case) or the shattering of a superpage
+         * has failed (error case).
+         * So, at worst, the spurious mapcache invalidation might be sent.
+         */
+        if ( p2m_is_ram( p2m_type_radix_get(p2m, entry)) &&
+             domain_has_ioreq_server(p2m->domain) )
+            ioreq_request_mapcache_invalidate(p2m->domain);
+#endif
+
+        p2m_put_page(p2m, entry, level);
+
+        return;
+    }
+
+    table = map_domain_page(pte_get_mfn(entry));
+    for ( i = 0; i < XEN_PT_ENTRIES; i++ )
+        p2m_free_entry(p2m, *(table + i), level - 1);
+
+    unmap_domain_page(table);
+
+    /*
+     * Make sure all the references in the TLB have been removed before
+     * freing the intermediate page table.
+     * XXX: Should we defer the free of the page table to avoid the
+     * flush?
+     */
+    p2m_tlb_flush_sync(p2m);
+
+    mfn = pte_get_mfn(entry);
+    ASSERT(mfn_valid(mfn));
+
+    pg = mfn_to_page(mfn);
+
+    page_list_del(pg, &p2m->pages);
+    p2m_free_page(p2m->domain, pg);
+}
+
+/*
+ * Insert an entry in the p2m. This should be called with a mapping
+ * equal to a page/superpage.
+ */
+static int __p2m_set_entry(struct p2m_domain *p2m,
+                           gfn_t sgfn,
+                           unsigned int page_order,
+                           mfn_t smfn,
+                           p2m_type_t t,
+                           p2m_access_t a)
+{
+    unsigned int level;
+    unsigned int target = page_order / PAGETABLE_ORDER;
+    pte_t *entry, *table, orig_pte;
+    int rc;
+    /* A mapping is removed if the MFN is invalid. */
+    bool removing_mapping = mfn_eq(smfn, INVALID_MFN);
+    DECLARE_OFFSETS(offsets, gfn_to_gaddr(sgfn));
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    /*
+     * Check if the level target is valid: we only support
+     * 4K - 2M - 1G mapping.
+     */
+    ASSERT(target <= 2);
+
+    table = p2m_get_root_pointer(p2m, sgfn);
+    if ( !table )
+        return -EINVAL;
+
+    for ( level = P2M_ROOT_LEVEL; level > target; level-- )
+    {
+        /*
+         * Don't try to allocate intermediate page table if the mapping
+         * is about to be removed.
+         */
+        rc = p2m_next_level(p2m, !removing_mapping,
+                            level, &table, offsets[level]);
+        if ( (rc == GUEST_TABLE_MAP_NONE) || (rc == GUEST_TABLE_MAP_NOMEM) )
+        {
+            /*
+             * We are here because p2m_next_level has failed to map
+             * the intermediate page table (e.g the table does not exist
+             * and they p2m tree is read-only). It is a valid case
+             * when removing a mapping as it may not exist in the
+             * page table. In this case, just ignore it.
+             */
+            rc = removing_mapping ?  0 : -ENOENT;
+            goto out;
+        }
+        else if ( rc != GUEST_TABLE_NORMAL )
+            break;
+    }
+
+    entry = table + offsets[level];
+
+    /*
+     * If we are here with level > target, we must be at a leaf node,
+     * and we need to break up the superpage.
+     */
+    if ( level > target )
+    {
+        /* We need to split the original page. */
+        pte_t split_pte = *entry;
+
+        ASSERT(p2m_is_superpage(p2m, *entry, level));
+
+        if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets) )
+        {
+            /* Free the allocated sub-tree */
+            p2m_free_entry(p2m, split_pte, level);
+
+            rc = -ENOMEM;
+            goto out;
+        }
+
+        /* Follow the break-before-sequence to update the entry. */
+        p2m_remove_pte(entry, p2m->clean_pte);
+        p2m_force_tlb_flush_sync(p2m);
+
+        p2m_write_pte(entry, split_pte, p2m->clean_pte);
+
+        /* Then move to the level we want to make real changes */
+        for ( ; level < target; level++ )
+        {
+            rc = p2m_next_level(p2m, true, level, &table, offsets[level]);
+
+            /*
+             * The entry should be found and either be a table
+             * or a superpage if level 0 is not targeted
+             */
+            ASSERT(rc == GUEST_TABLE_NORMAL ||
+                   (rc == GUEST_TABLE_SUPER_PAGE && target > 0));
+        }
+
+        entry = table + offsets[level];
+    }
+
+    /*
+     * We should always be there with the correct level because
+     * all the intermediate tables have been installed if necessary.
+     */
+    ASSERT(level == target);
+
+    orig_pte = *entry;
+
+    /*
+     * The access type should always be p2m_access_rwx when the mapping
+     * is removed.
+     */
+    ASSERT(!mfn_eq(INVALID_MFN, smfn) || (a == p2m_access_rwx));
+
+    /*
+     * Always remove the entry in order to follow the break-before-make
+     * sequence when updating the translation table.
+     */
+    if ( pte_is_valid(orig_pte) || removing_mapping )
+        p2m_remove_pte(entry, p2m->clean_pte);
+
+    if ( removing_mapping )
+        /* Flush can be deferred if the entry is removed */
+        p2m->need_flush |= !!pte_is_valid(orig_pte);
+    else
+    {
+        pte_t pte = p2m_entry_from_mfn(p2m, smfn, t, a);
+
+        /*
+         * It is necessary to flush the TLB before writing the new entry
+         * to keep coherency when the previous entry was valid.
+         *
+         * Although, it could be defered when only the permissions are
+         * changed (e.g in case of memaccess).
+         */
+        if ( pte_is_valid(orig_pte) )
+        {
+            if ( P2M_CLEAR_PERM(pte) != P2M_CLEAR_PERM(orig_pte) )
+                p2m_force_tlb_flush_sync(p2m);
+            else
+                p2m->need_flush = true;
+        }
+
+        p2m_write_pte(entry, pte, p2m->clean_pte);
+
+        p2m->max_mapped_gfn = gfn_max(p2m->max_mapped_gfn,
+                                      gfn_add(sgfn, (1UL << page_order) - 1));
+        p2m->lowest_mapped_gfn = gfn_min(p2m->lowest_mapped_gfn, sgfn);
+    }
+
+#ifdef CONFIG_HAS_PASSTHROUGH
+    if ( is_iommu_enabled(p2m->domain) &&
+         (pte_is_valid(orig_pte) || pte_is_valid(*entry)) )
+    {
+        unsigned int flush_flags = 0;
+
+        if ( pte_is_valid(orig_pte) )
+            flush_flags |= IOMMU_FLUSHF_modified;
+        if ( pte_is_valid(*entry) )
+            flush_flags |= IOMMU_FLUSHF_added;
+
+        rc = iommu_iotlb_flush(p2m->domain, _dfn(gfn_x(sgfn)),
+                               1UL << page_order, flush_flags);
+    }
+    else
+#endif
+        rc = 0;
+
+    /*
+     * Free the entry only if the original pte was valid and the base
+     * is different (to avoid freeing when permission is changed).
+     */
+    if ( p2m_is_valid(p2m, orig_pte) &&
+         !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
+        p2m_free_entry(p2m, orig_pte, level);
+
+out:
+    unmap_domain_page(table);
+
+    return rc;
+}
+
+int p2m_set_entry(struct p2m_domain *p2m,
+                  gfn_t sgfn,
+                  unsigned long nr,
+                  mfn_t smfn,
+                  p2m_type_t t,
+                  p2m_access_t a)
+{
+    int rc = 0;
+
+    /*
+     * Any reference taken by the P2M mappings (e.g. foreign mapping) will
+     * be dropped in relinquish_p2m_mapping(). As the P2M will still
+     * be accessible after, we need to prevent mapping to be added when the
+     * domain is dying.
+     */
+    if ( unlikely(p2m->domain->is_dying) )
+        return -ENOMEM;
+
+    while ( nr )
+    {
+        unsigned long mask;
+        unsigned long order = 0;
+        /* 1gb, 2mb, 4k mappings are supported */
+        unsigned int i = ( P2M_ROOT_LEVEL > 2 ) ? 2 : P2M_ROOT_LEVEL;
+
+        /*
+         * Don't take into account the MFN when removing mapping (i.e
+         * MFN_INVALID) to calculate the correct target order.
+         *
+         * XXX: Support superpage mappings if nr is not aligned to a
+         * superpage size.
+         */
+        mask = !mfn_eq(smfn, INVALID_MFN) ? mfn_x(smfn) : 0;
+        mask |= gfn_x(sgfn) | nr;
+
+        for ( ; i != 0; i-- )
+        {
+            if ( !(mask & (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)) )
+            {
+                    order = XEN_PT_LEVEL_ORDER(i);
+                    break;
+            }
+        }
+
+        rc = __p2m_set_entry(p2m, sgfn, order, smfn, t, a);
+        if ( rc )
+            break;
+
+        sgfn = gfn_add(sgfn, (1 << order));
+        if ( !mfn_eq(smfn, INVALID_MFN) )
+           smfn = mfn_add(smfn, (1 << order));
+
+        nr -= (1 << order);
+    }
+
+    return rc;
+}
+
+static int p2m_insert_mapping(struct domain *d, gfn_t start_gfn,
+                              unsigned long nr, mfn_t mfn, p2m_type_t t)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    int rc;
+
+    p2m_write_lock(p2m);
+    rc = p2m_set_entry(p2m, start_gfn, nr, mfn, t, p2m->default_access);
+    p2m_write_unlock(p2m);
+
+    return rc;
+}
+
+int map_regions_p2mt(struct domain *d,
+                     gfn_t gfn,
+                     unsigned long nr,
+                     mfn_t mfn,
+                     p2m_type_t p2mt)
+{
+    return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);
+}
+
+int guest_physmap_add_entry(struct domain *d,
+                            gfn_t gfn,
+                            mfn_t mfn,
+                            unsigned long page_order,
+                            p2m_type_t t)
+{
+    return p2m_insert_mapping(d, gfn, (1 << page_order), mfn, t);
+}
-- 
2.49.0


