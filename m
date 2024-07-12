Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C38592FE65
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 18:23:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758173.1167580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJ38-00014R-KE; Fri, 12 Jul 2024 16:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758173.1167580; Fri, 12 Jul 2024 16:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJ38-0000v4-AO; Fri, 12 Jul 2024 16:23:10 +0000
Received: by outflank-mailman (input) for mailman id 758173;
 Fri, 12 Jul 2024 16:23:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Ov5=OM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sSJ36-00088h-PV
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 16:23:08 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05fd12a3-406b-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 18:23:07 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a77cb7c106dso279992566b.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 09:23:07 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ffa13sm358464966b.129.2024.07.12.09.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 09:23:05 -0700 (PDT)
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
X-Inumbo-ID: 05fd12a3-406b-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720801387; x=1721406187; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWR9u/DFztx4X5hMN6i8BpIu/Ck9lY/W4gNwlahQKjY=;
        b=IbGpmWA7GNrxKblnL522RZP4bMPWRYFjCFvrKYy5iElG5mCndPXe+xmiDOV1I1aVu3
         Arf9BuotPRj/3c4KF0bmDpWcmNuCbcmDCzGeGgm4G+I9CROPrqOUSgyg3gwTWfz9QkHJ
         fb7kTc35QtJmEcqhDWV7LhvhV79yJauPUjZmH/zJpuIxWrrOzVHuYAyoeuzk7/6cLzfc
         JcS85kB/9jD1HBSbe/frzgZte8MqCfbcrUZVdj9qNf6La2vX2hmpD5F7IzIz9xiTjBGD
         8Wz8fAu/CG//ZEf5u6Sb0aMnpDsMvUncvPhga0PLNGa90x6CGR1xNGylbrlOBS8gZiM6
         7Ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720801387; x=1721406187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWR9u/DFztx4X5hMN6i8BpIu/Ck9lY/W4gNwlahQKjY=;
        b=AzcbEazI6Ftrm18j1D6eCygRjCr/+xyGuoGTmUij2zT0zgzTPdPhL/uFEK8WpR6gbS
         edbCPrvlYWuzGR6SqHc7mmQLYcaK6tb/6/V/diLK+/9eSxVuoc3+Nl6BBn+rX936tHJd
         gj7ncEqMx/Ee1mrLdFcbeE26U6sxS+8DyNHDts2Fv7dVEicPi6Bh7BnATRtNRPtZUuUi
         mrUc0K8xUZCVlNnCfWrE7iGrEwAea1sNPeIa0NTKWbJj4Wm55KhQu6oW6etRuWA+YvU0
         n1gT7f6gERFbhbHi/251MZrD7PTdJztdJgg1G8eka6UUQAK6IB99WBVxLZk0cbv4Sjoa
         hqAQ==
X-Gm-Message-State: AOJu0YyJPhGl+Jzmqrgsr4pFu5JUTAzi3iHZvQ6TmbnQBgfRBzHiDUW2
	FXHPZXRGtoNuu/tPDEt19nnWFcXMaJ0QCEnJggqeKfcf4x/SuCQT1T5gfO5r
X-Google-Smtp-Source: AGHT+IEngSyXRFQLz0VWoMksFEQJXVAngrEfZ9SU/Ck1cjg53Eo85Fox/gBvL/miOp9/VkauMcJ5rQ==
X-Received: by 2002:a17:906:f588:b0:a77:c364:c4f3 with SMTP id a640c23a62f3a-a780b8855dcmr1076082166b.55.1720801385801;
        Fri, 12 Jul 2024 09:23:05 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 6/8] xen/riscv: introduce generic Xen page table handling
Date: Fri, 12 Jul 2024 18:22:55 +0200
Message-ID: <f2d7f538edb7db8990bf26b791df9da3d390bf05.1720799926.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720799925.git.oleksii.kurochko@gmail.com>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At least, between Arm and RISC-V most of the code related to Xen page
table handling are common.

This GENERIC_PT code is based on Arm's arm/mmu/pt.c except some minor
changes such as introduction of the following functions:
  * get_root_page()
  * xen_pt_check_contig()
  * set_pte_table_bit()
  * sanity_arch_specific_pte_checks()
  * get_contig_bit()
  * set_pte_permissions()
  * flush_xen_tlb_range_va()
It was done because not every functions has the generic pte_flags and
it could be a different positions of the PTE bits in a PTE.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - newly introduced patch
---
 xen/common/Kconfig   |   5 +
 xen/common/Makefile  |   1 +
 xen/common/mmu/pt.c  | 441 +++++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/mm.h |  24 +++
 4 files changed, 471 insertions(+)
 create mode 100644 xen/common/mmu/pt.c

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 565ceda741..6534b77cc9 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -47,6 +47,11 @@ config ARCH_MAP_DOMAIN_PAGE
 config GENERIC_BUG_FRAME
 	bool
 
+config GENERIC_PT
+	bool
+	help
+	  Introduces common function to work with page table when MMU is enabled.
+
 config HAS_ALTERNATIVE
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 21359bab02..e1fb6a5fe8 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -2,6 +2,7 @@ obj-$(CONFIG_ARGO) += argo.o
 obj-y += bitmap.o
 obj-bin-$(CONFIG_SELF_TESTS) += bitops.init.o
 obj-$(CONFIG_GENERIC_BUG_FRAME) += bug.o
+obj-$(CONFIG_GENERIC_PT) += mmu/pt.o
 obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
diff --git a/xen/common/mmu/pt.c b/xen/common/mmu/pt.c
new file mode 100644
index 0000000000..7e488eba24
--- /dev/null
+++ b/xen/common/mmu/pt.c
@@ -0,0 +1,441 @@
+#include <xen/bug.h>
+#include <xen/domain_page.h>
+#include <xen/errno.h>
+#include <xen/mm.h>
+#include <xen/mm-frame.h>
+#include <xen/pmap.h>
+#include <xen/spinlock.h>
+
+/* Sanity check of the entry */
+static bool xen_pt_check_entry(pte_t entry, mfn_t mfn, unsigned int level,
+                               unsigned int flags)
+{
+    /* Sanity check when modifying an entry. */
+    if ( (flags & _PAGE_PRESENT) && mfn_eq(mfn, INVALID_MFN) )
+    {
+        /* We don't allow modifying an invalid entry. */
+        if ( !pte_is_valid(entry) )
+        {
+            printk("Modifying invalid entry is not allowed.\n");
+            return false;
+        }
+
+        /* We don't allow modifying a table entry */
+        if ( !pte_is_mapping(entry, level) )
+        {
+            printk("Modifying a table entry is not allowed.\n");
+            return false;
+        }
+
+        if ( !sanity_arch_specific_pte_checks(entry) )
+        {
+            printk("sanity check failed\n");
+            return false;
+        }
+    }
+    /* Sanity check when inserting a mapping */
+    else if ( flags & _PAGE_PRESENT )
+    {
+        /* We should be here with a valid MFN. */
+        ASSERT(!mfn_eq(mfn, INVALID_MFN));
+
+        /*
+         * We don't allow replacing any valid entry.
+         *
+         * Note that the function xen_pt_update() relies on this
+         * assumption and will skip the TLB flush. The function will need
+         * to be updated if the check is relaxed.
+         */
+        if ( pte_is_valid(entry) )
+        {
+            if ( pte_is_mapping(entry, level) )
+                printk("Changing MFN for a valid entry is not allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
+                          mfn_x(pte_get_mfn(entry)), mfn_x(mfn));
+            else
+                printk("Trying to replace a table with a mapping.\n");
+            return false;
+        }
+    }
+    /* Sanity check when removing a mapping. */
+    else if ( (flags & (_PAGE_PRESENT|_PAGE_POPULATE)) == 0 )
+    {
+        /* We should be here with an invalid MFN. */
+        ASSERT(mfn_eq(mfn, INVALID_MFN));
+
+        /* We don't allow removing a table */
+        if ( pte_is_table(entry, level) )
+        {
+            printk("Removing a table is not allowed.\n");
+            return false;
+        }
+
+        if ( get_contig_bit(entry) )
+        {
+            printk("Removing entry with contiguous bit set is not allowed.\n");
+            return false;
+        }
+    }
+    /* Sanity check when populating the page-table. No check so far. */
+    else
+    {
+        ASSERT(flags & _PAGE_POPULATE);
+        /* We should be here with an invalid MFN */
+        ASSERT(mfn_eq(mfn, INVALID_MFN));
+    }
+
+    return true;
+}
+
+static pte_t *xen_map_table(mfn_t mfn)
+{
+    /*
+     * During early boot, map_domain_page() may be unusable. Use the
+     * PMAP to map temporarily a page-table.
+     */
+    if ( system_state == SYS_STATE_early_boot )
+        return pmap_map(mfn);
+
+    return map_domain_page(mfn);
+}
+
+static void xen_unmap_table(const pte_t *table)
+{
+    /*
+     * During early boot, xen_map_table() will not use map_domain_page()
+     * but the PMAP.
+     */
+    if ( system_state == SYS_STATE_early_boot )
+        pmap_unmap(table);
+    else
+        unmap_domain_page(table);
+}
+
+static int create_xen_table(pte_t *entry)
+{
+    mfn_t mfn;
+    void *p;
+    pte_t pte;
+
+    if ( system_state != SYS_STATE_early_boot )
+    {
+        struct page_info *pg = alloc_domheap_page(NULL, 0);
+
+        if ( pg == NULL )
+            return -ENOMEM;
+
+        mfn = page_to_mfn(pg);
+    }
+    else
+        mfn = alloc_boot_pages(1, 1);
+
+    p = xen_map_table(mfn);
+    clear_page(p);
+    xen_unmap_table(p);
+
+    pte = mfn_to_xen_entry(mfn, MT_NORMAL);
+
+    set_pte_table_bit(&pte, 1);
+
+    write_pte(entry, pte);
+
+    return 0;
+}
+
+#define XEN_TABLE_MAP_FAILED 0
+#define XEN_TABLE_SUPER_PAGE 1
+#define XEN_TABLE_NORMAL_PAGE 2
+
+/*
+ * Take the currently mapped table, find the corresponding entry,
+ * and map the next table, if available.
+ *
+ * The read_only parameters indicates whether intermediate tables should
+ * be allocated when not present.
+ *
+ * Return values:
+ *  XEN_TABLE_MAP_FAILED: Either read_only was set and the entry
+ *  was empty, or allocating a new page failed.
+ *  XEN_TABLE_NORMAL_PAGE: next level mapped normally
+ *  XEN_TABLE_SUPER_PAGE: The next entry points to a superpage.
+ */
+static int xen_pt_next_level(bool read_only, unsigned int level,
+                             pte_t **table, unsigned int offset)
+{
+    pte_t *entry;
+    int ret;
+    mfn_t mfn;
+
+    entry = *table + offset;
+
+    if ( !pte_is_valid(*entry) )
+    {
+        if ( read_only )
+            return XEN_TABLE_MAP_FAILED;
+
+        ret = create_xen_table(entry);
+        if ( ret )
+            return XEN_TABLE_MAP_FAILED;
+    }
+
+    if ( pte_is_mapping(*entry, level) )
+    {
+        return XEN_TABLE_SUPER_PAGE;
+    }
+
+    mfn = pte_get_mfn(*entry);
+
+    xen_unmap_table(*table);
+    *table = xen_map_table(mfn);
+
+    return XEN_TABLE_NORMAL_PAGE;
+}
+
+/* Update an entry at the level @target. */
+static int xen_pt_update_entry(mfn_t root, unsigned long virt,
+                               mfn_t mfn, unsigned int arch_target,
+                               unsigned int flags)
+{
+    int rc;
+    unsigned int level = convert_level(HYP_PT_ROOT_LEVEL);
+    unsigned int arch_level = convert_level(level);
+    unsigned int target = convert_level(arch_target);
+    pte_t *table;
+    /*
+     * The intermediate page tables are read-only when the MFN is not valid
+     * and we are not populating page table.
+     * This means we either modify permissions or remove an entry.
+     */
+    bool read_only = mfn_eq(mfn, INVALID_MFN) && !(flags & _PAGE_POPULATE);
+    pte_t pte, *entry;
+
+    /* convenience aliases */
+    DECLARE_OFFSETS(offsets, (paddr_t)virt);
+
+    /* _PAGE_POPULATE and _PAGE_PRESENT should never be set together. */
+    ASSERT((flags & (_PAGE_POPULATE|_PAGE_PRESENT)) != (_PAGE_POPULATE|_PAGE_PRESENT));
+
+    table = xen_map_table(root);
+    for ( ; level < target; level++, arch_level = convert_level(level) )
+    {
+        rc = xen_pt_next_level(read_only, arch_level, &table, offsets[arch_level]);
+        if ( rc == XEN_TABLE_MAP_FAILED )
+        {
+            /*
+             * We are here because xen_pt_next_level has failed to map
+             * the intermediate page table (e.g the table does not exist
+             * and the pt is read-only). It is a valid case when
+             * removing a mapping as it may not exist in the page table.
+             * In this case, just ignore it.
+             */
+            if ( flags & (_PAGE_PRESENT | _PAGE_POPULATE) )
+            {
+                printk("%s: Unable to map level %u\n", __func__, arch_level);
+                rc = -ENOENT;
+                goto out;
+            }
+            else
+            {
+                rc = 0;
+                goto out;
+            }
+        }
+        else if ( rc != XEN_TABLE_NORMAL_PAGE ) {
+            break;
+        }
+    }
+
+    if ( arch_level != arch_target )
+    {
+        printk("%s: Shattering superpage is not supported\n", __func__);
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+
+    entry = table + offsets[arch_level];
+
+    rc = -EINVAL;
+    if ( !xen_pt_check_entry(*entry, mfn, arch_level, flags) )
+        goto out;
+
+    /* If we are only populating page-table, then we are done. */
+    rc = 0;
+    if ( flags & _PAGE_POPULATE )
+        goto out;
+
+    /* We are removing the page */
+    if ( !(flags & _PAGE_PRESENT) )
+        memset(&pte, 0x00, sizeof(pte));
+    else
+    {
+        /* We are inserting a mapping => Create new pte. */
+        if ( !mfn_eq(mfn, INVALID_MFN) )
+        {
+            pte = mfn_to_xen_entry(mfn, PAGE_AI_MASK(flags));
+
+            set_pte_table_bit(&pte, (arch_level == 3));
+        }
+        else /* We are updating the permission => Copy the current pte. */
+            pte = *entry;
+
+        set_pte_permissions(&pte, flags);
+    }
+
+    write_pte(entry, pte);
+
+    rc = 0;
+
+out:
+    xen_unmap_table(table);
+
+    return rc;
+}
+
+static DEFINE_SPINLOCK(xen_pt_lock);
+
+/* Return the level where mapping should be done */
+int xen_pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
+                                unsigned int flags)
+{
+    unsigned int level = 0;
+    unsigned long mask;
+    unsigned int i = 0;
+
+    /*
+     * Don't take into account the MFN when removing mapping (i.e
+     * MFN_INVALID) to calculate the correct target order.
+     *
+     * Per the Arm Arm, `vfn` and `mfn` must be both superpage aligned.
+     * They are or-ed together and then checked against the size of
+     * each level.
+     *
+     * `left` is not included and checked separately to allow
+     * superpage mapping even if it is not properly aligned (the
+     * user may have asked to map 2MB + 4k).
+     */
+    mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
+    mask |= vfn;
+
+    /*
+    * Always use level 3 mapping unless the caller request block
+    * mapping.
+    */
+    if ( likely(!(flags & _PAGE_BLOCK)) )
+        return level;
+
+    for ( i = 0; i < CONFIG_PAGING_LEVELS; i++ )
+    {
+        if ( !(mask & (BIT(XEN_PT_LEVEL_ORDER(convert_level(i)), UL) - 1)) &&
+            (nr >= BIT(XEN_PT_LEVEL_ORDER(convert_level(i)), UL)) )
+        {
+            level = convert_level(i);
+            break;
+        }
+    }
+
+    return level;
+}
+
+static int xen_pt_update(unsigned long virt,
+                         mfn_t mfn,
+                         /* const on purpose as it is used for TLB flush */
+                         const unsigned long nr_mfns,
+                         unsigned int flags)
+{
+    int rc = 0;
+    unsigned long vfn = virt >> PAGE_SHIFT;
+    unsigned long left = nr_mfns;
+
+    /*
+     * For arm32, page-tables are different on each CPUs. Yet, they share
+     * some common mappings. It is assumed that only common mappings
+     * will be modified with this function.
+     *
+     * XXX: Add a check.
+     */
+    const mfn_t root = get_root_page();
+
+    /*
+     * The hardware was configured to forbid mapping both writeable and
+     * executable.
+     * When modifying/creating mapping (i.e _PAGE_PRESENT is set),
+     * prevent any update if this happen.
+     */
+    if ( (flags & _PAGE_PRESENT) && !PAGE_RO_MASK(flags) &&
+         !PAGE_XN_MASK(flags) )
+    {
+        printk("Mappings should not be both Writeable and Executable.\n");
+        return -EINVAL;
+    }
+
+    if ( flags & _PAGE_CONTIG )
+    {
+        printk("_PAGE_CONTIG is an internal only flag.\n");
+        return -EINVAL;
+    }
+
+    if ( !IS_ALIGNED(virt, PAGE_SIZE) )
+    {
+        printk("The virtual address is not aligned to the page-size.\n");
+        return -EINVAL;
+    }
+
+    spin_lock(&xen_pt_lock);
+
+    while ( left )
+    {
+        unsigned int order, level, nr_contig, new_flags;
+
+        level = xen_pt_mapping_level(vfn, mfn, left, flags);
+        order = XEN_PT_LEVEL_ORDER(level);
+
+        ASSERT(left >= BIT(order, UL));
+
+        /*
+         * Check if we can set the contiguous mapping and update the
+         * flags accordingly.
+         */
+        nr_contig = xen_pt_check_contig(vfn, mfn, level, left, flags);
+        new_flags = flags | ((nr_contig > 1) ? _PAGE_CONTIG : 0);
+
+        for ( ; nr_contig > 0; nr_contig-- )
+        {
+            rc = xen_pt_update_entry(root, vfn << PAGE_SHIFT, mfn, level,
+                                     new_flags);
+            if ( rc )
+                break;
+
+            vfn += 1U << order;
+            if ( !mfn_eq(mfn, INVALID_MFN) )
+                mfn = mfn_add(mfn, 1U << order);
+
+            left -= (1U << order);
+        }
+
+        if ( rc )
+            break;
+    }
+
+    /*
+     * The TLBs flush can be safely skipped when a mapping is inserted
+     * as we don't allow mapping replacement (see xen_pt_check_entry()).
+     *
+     * For all the other cases, the TLBs will be flushed unconditionally
+     * even if the mapping has failed. This is because we may have
+     * partially modified the PT. This will prevent any unexpected
+     * behavior afterwards.
+     */
+    if ( !((flags & _PAGE_PRESENT) && !mfn_eq(mfn, INVALID_MFN)) )
+        flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
+
+    spin_unlock(&xen_pt_lock);
+
+    return rc;
+}
+
+int map_pages_to_xen(unsigned long virt,
+                     mfn_t mfn,
+                     unsigned long nr_mfns,
+                     unsigned int flags)
+{
+    return xen_pt_update(virt, mfn, nr_mfns, flags);
+}
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 7561297a75..47cd5326da 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -648,4 +648,28 @@ static inline void put_page_alloc_ref(struct page_info *page)
     }
 }
 
+#ifdef CONFIG_GENERIC_PT
+
+/* is needed because of pte_t. */
+#include <asm/page.h>
+
+const mfn_t get_root_page(void);
+
+unsigned int xen_pt_check_contig(unsigned long vfn, mfn_t mfn,
+                                 unsigned int level, unsigned long left,
+                                 unsigned int flags);
+
+void set_pte_table_bit(pte_t *pte, unsigned int tbl_bit_val);
+
+bool sanity_arch_specific_pte_checks(pte_t entry);
+
+unsigned int get_contig_bit(pte_t entry);
+
+void set_pte_permissions(pte_t *pte, unsigned int flags);
+
+void flush_xen_tlb_range_va(vaddr_t va,
+                            unsigned long size);
+
+#endif /* CONFIG_GENERIC_PT */
+
 #endif /* __XEN_MM_H__ */
-- 
2.45.2


