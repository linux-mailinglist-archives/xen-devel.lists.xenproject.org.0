Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A27C189D877
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 13:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702257.1097283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru9vY-0007kV-UR; Tue, 09 Apr 2024 11:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702257.1097283; Tue, 09 Apr 2024 11:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru9vY-0007gh-L1; Tue, 09 Apr 2024 11:46:12 +0000
Received: by outflank-mailman (input) for mailman id 702257;
 Tue, 09 Apr 2024 11:46:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0lRi=LO=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1ru9vW-0004JG-1R
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 11:46:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c0e8297f-f666-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 13:46:07 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB1BA1007;
 Tue,  9 Apr 2024 04:46:37 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C7693F766;
 Tue,  9 Apr 2024 04:46:06 -0700 (PDT)
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
X-Inumbo-ID: c0e8297f-f666-11ee-94a3-07e782e9044d
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 12/13] xen/device_tree: Introduce function to merge overlapping intervals
Date: Tue,  9 Apr 2024 12:45:42 +0100
Message-Id: <20240409114543.3332150-13-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409114543.3332150-1-luca.fancellu@arm.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a function that given an array of cells containing
(address,size) intervals, merges the overlapping ones, returning
an array with no overlapping intervals.

The algorithm needs to sort the intervals by ascending order
address, so the sort() function already included in the codebase
is used, however in this case additional data is needed for the
compare function, to be able to extract the address from the
interval.
So add one argument to the sort() function and its compare
callback to have additional data and be able to pass, in this
case, the address length. In case the argument is not needed,
NULL can be provided.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2:
 - new patch
---
---
 xen/arch/arm/bootfdt.c        |   5 +-
 xen/arch/arm/io.c             |  11 ++-
 xen/arch/x86/extable.c        |   5 +-
 xen/common/device_tree.c      | 140 ++++++++++++++++++++++++++++++++++
 xen/include/xen/device_tree.h |  19 +++++
 xen/include/xen/sort.h        |  14 ++--
 6 files changed, 181 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 4d708442a19e..a2aba67b45e7 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -521,7 +521,8 @@ static void __init early_print_info(void)
 }
 
 /* This function assumes that memory regions are not overlapped */
-static int __init cmp_memory_node(const void *key, const void *elem)
+static int __init cmp_memory_node(const void *key, const void *elem,
+                                  const void *data)
 {
     const struct membank *handler0 = key;
     const struct membank *handler1 = elem;
@@ -569,7 +570,7 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
      * the banks sorted in ascending order. So sort them through.
      */
     sort(mem->bank, mem->nr_banks, sizeof(struct membank),
-         cmp_memory_node, swap_memory_node);
+         cmp_memory_node, swap_memory_node, NULL);
 
     early_print_info();
 
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 96c740d5636c..c1814491fec4 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -57,7 +57,7 @@ static enum io_state handle_write(const struct mmio_handler *handler,
 }
 
 /* This function assumes that mmio regions are not overlapped */
-static int cmp_mmio_handler(const void *key, const void *elem)
+static int cmp_mmio_handler(const void *key, const void *elem, const void *data)
 {
     const struct mmio_handler *handler0 = key;
     const struct mmio_handler *handler1 = elem;
@@ -71,6 +71,11 @@ static int cmp_mmio_handler(const void *key, const void *elem)
     return 0;
 }
 
+static int bsearch_cmp_mmio_handler(const void *key, const void *elem)
+{
+    return cmp_mmio_handler(key, elem, NULL);
+}
+
 static void swap_mmio_handler(void *_a, void *_b, size_t size)
 {
     struct mmio_handler *a = _a, *b = _b;
@@ -87,7 +92,7 @@ static const struct mmio_handler *find_mmio_handler(struct domain *d,
 
     read_lock(&vmmio->lock);
     handler = bsearch(&key, vmmio->handlers, vmmio->num_entries,
-                      sizeof(*handler), cmp_mmio_handler);
+                      sizeof(*handler), bsearch_cmp_mmio_handler);
     read_unlock(&vmmio->lock);
 
     return handler;
@@ -219,7 +224,7 @@ void register_mmio_handler(struct domain *d,
 
     /* Sort mmio handlers in ascending order based on base address */
     sort(vmmio->handlers, vmmio->num_entries, sizeof(struct mmio_handler),
-         cmp_mmio_handler, swap_mmio_handler);
+         cmp_mmio_handler, swap_mmio_handler, NULL);
 
     write_unlock(&vmmio->lock);
 }
diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index 8415cd1fa249..589e251b29b9 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -23,7 +23,8 @@ static inline unsigned long ex_cont(const struct exception_table_entry *x)
 	return EX_FIELD(x, cont);
 }
 
-static int init_or_livepatch cf_check cmp_ex(const void *a, const void *b)
+static int init_or_livepatch cf_check cmp_ex(const void *a, const void *b,
+                                             const void *data)
 {
 	const struct exception_table_entry *l = a, *r = b;
 	unsigned long lip = ex_addr(l);
@@ -53,7 +54,7 @@ void init_or_livepatch sort_exception_table(struct exception_table_entry *start,
                                  const struct exception_table_entry *stop)
 {
     sort(start, stop - start,
-         sizeof(struct exception_table_entry), cmp_ex, swap_ex);
+         sizeof(struct exception_table_entry), cmp_ex, swap_ex, NULL);
 }
 
 void __init sort_exception_tables(void)
diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 8d1017a49d80..24914a80d03b 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -18,6 +18,7 @@
 #include <xen/lib.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
+#include <xen/sort.h>
 #include <xen/stdarg.h>
 #include <xen/string.h>
 #include <xen/cpumask.h>
@@ -2243,6 +2244,145 @@ int dt_get_pci_domain_nr(struct dt_device_node *node)
     return (u16)domain;
 }
 
+static int __init cmp_mem_reg_cell(const void *key, const void *elem,
+                                   const void *data)
+{
+    const __be32 *cell0 = key;
+    const __be32 *cell1 = elem;
+    const int *addrcells = data;
+    u64 addr0, addr1;
+
+    /* Same address, same element */
+    if ( cell0 == cell1 )
+        return 0;
+
+    BUG_ON(!addrcells || !*addrcells || *addrcells > 2);
+    addr0 = dt_read_number(cell0, *addrcells);
+    addr1 = dt_read_number(cell1, *addrcells);
+
+    if ( addr0 < addr1 )
+        return -1;
+
+    if ( addr0 > addr1 )
+        return 1;
+
+    return 0;
+}
+
+static void __init swap_mem_reg_cell(void *_a, void *_b, size_t size)
+{
+    __be32 tmp[4];
+    __be32 *cell0 = _a;
+    __be32 *cell1 = _b;
+
+    BUG_ON(size > (4 * sizeof(__be32)));
+
+    /* Don't swap the same element */
+    if ( cell0 == cell1 )
+        return;
+
+    /* Swap cell0 and cell1 */
+    memcpy(tmp, cell0, size);
+    memcpy(cell0, cell1, size);
+    memcpy(cell1, tmp, size);
+}
+
+int __init dt_merge_overlapping_addr_size_intervals(__be32 *reg, int *nr_cells,
+                                                    int addrcells,
+                                                    int sizecells)
+{
+    int reg_size = addrcells + sizecells;
+    u64 start_last, size_last, end_last;
+    unsigned int count;
+    unsigned int i = 1;
+    __be32 *last_cell = reg;
+
+    BUG_ON(!nr_cells || !reg);
+
+    if ( (addrcells < 1) || (addrcells > 2) || (sizecells < 1) ||
+         (sizecells > 2) )
+        return -EINVAL;
+
+    count = *nr_cells / reg_size;
+    /* Early stop, only one interval in the array */
+    if ( count == 1 )
+        return 0;
+
+    /* Sort cells by ascending address */
+    sort(reg, count, reg_size * sizeof(__be32), cmp_mem_reg_cell,
+         swap_mem_reg_cell, &addrcells);
+
+    /*
+     * Algorithm to merge overlapping intervals in place, prerequisite for the
+     * intervals is that they must be sorted with ascending order address
+     */
+    start_last = dt_read_number(last_cell, addrcells);
+    size_last = dt_read_number(last_cell + addrcells, sizecells);
+    end_last = start_last + size_last;
+
+    /* The sum is too big */
+    if ( end_last < start_last )
+        return -ERANGE;
+
+    while ( i < count )
+    {
+        __be32 *current_cell = &reg[i * reg_size];
+        u64 start_current = dt_read_number(current_cell, addrcells);
+        u64 size_current = dt_read_number(current_cell + addrcells, sizecells);
+        u64 end_current = start_current + size_current;
+        bool overlap = end_last >= start_current;
+        u64 new_size;
+
+        /* The sum is too big */
+        if ( end_current < start_current )
+            return -ERANGE;
+
+        new_size = MAX(end_last, end_current) - start_last;
+
+        /*
+         * If the last interval end is not connected with the current one, or
+         * if they are connected but the new computed size would not be
+         * representable given the input sizecells, don't merge and advance the
+         * last of one position.
+         */
+        if ( !overlap ||
+             (overlap && (sizecells < 2) && (new_size > UINT32_MAX)) )
+        {
+            /* last element doesn't overlap with the current, advance it */
+            last_cell = last_cell + reg_size;
+            start_last = dt_read_number(last_cell, addrcells);
+            size_last = dt_read_number(last_cell + addrcells, sizecells);
+            end_last = start_last + size_last;
+        }
+        else
+        {
+            /* Temporary pointer because dt_set_cell modifies it */
+            __be32 *tmp_last_cell_size = last_cell + addrcells;
+
+            dt_set_cell(&tmp_last_cell_size, sizecells, new_size);
+            /*
+             * This current interval is merged with the last one, so remove this
+             * interval and shift left all the remaining elements
+             */
+            memmove(current_cell, current_cell + reg_size,
+                    (reg_size * (count - i)) * sizeof(__be32));
+            /* Now the array has less element since we merged two intervals */
+            count--;
+            /*
+             * Next iteration needs to start from the current index, skip
+             * increment
+             */
+            continue;
+        }
+        /* Point to the next element in the array */
+        i++;
+    }
+
+    /* Now count holds the number of intervals in the array */
+    *nr_cells = count * reg_size;
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index e6287305a7b5..95a88a0d3bc9 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -946,6 +946,25 @@ int dt_get_pci_domain_nr(struct dt_device_node *node);
 
 struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
 
+/**
+ * dt_merge_overlapping_addr_size_intervals - Given an array of (address, size)
+ *   cells intervals, returns an array with the overlapping intervals merged.
+ * @reg: Array of (address, size) cells.
+ * @nr_cells: Total number of cells in the array.
+ * @addrcells: Size of the "address" in number of cells.
+ * @sizecells: Size of the "size" in number of cells.
+ *
+ * Return:
+ * * 0       - On success.
+ * * -ERANGE - The interval computation results are not representable.
+ *             (address + size results in truncation overflow).
+ * * -EINVAL - addrcells or sizecells are outside the interval [1, 2]
+ *
+ * Returns in nr_cells the new number of cells in the array.
+ */
+int dt_merge_overlapping_addr_size_intervals(__be32 *reg, int *nr_cells,
+                                             int addrcells, int sizecells);
+
 #ifdef CONFIG_DEVICE_TREE_DEBUG
 #define dt_dprintk(fmt, args...)  \
     printk(XENLOG_DEBUG fmt, ## args)
diff --git a/xen/include/xen/sort.h b/xen/include/xen/sort.h
index b95328628465..1bd4420457c0 100644
--- a/xen/include/xen/sort.h
+++ b/xen/include/xen/sort.h
@@ -23,8 +23,8 @@
 extern gnu_inline
 #endif
 void sort(void *base, size_t num, size_t size,
-          int (*cmp)(const void *a, const void *b),
-          void (*swap)(void *a, void *b, size_t size))
+          int (*cmp)(const void *a, const void *b, const void *data),
+          void (*swap)(void *a, void *b, size_t size), const void *cmp_data)
 {
     /* pre-scale counters for performance */
     size_t i = (num / 2) * size, n = num * size, c, r;
@@ -35,9 +35,10 @@ void sort(void *base, size_t num, size_t size,
         for ( r = i -= size; r * 2 + size < n; r = c )
         {
             c = r * 2 + size;
-            if ( (c < n - size) && (cmp(base + c, base + c + size) < 0) )
+            if ( (c < n - size) &&
+                 (cmp(base + c, base + c + size, cmp_data) < 0) )
                 c += size;
-            if ( cmp(base + r, base + c) >= 0 )
+            if ( cmp(base + r, base + c, cmp_data) >= 0 )
                 break;
             swap(base + r, base + c, size);
         }
@@ -51,9 +52,10 @@ void sort(void *base, size_t num, size_t size,
         for ( r = 0; r * 2 + size < i; r = c )
         {
             c = r * 2 + size;
-            if ( (c < i - size) && (cmp(base + c, base + c + size) < 0) )
+            if ( (c < i - size) &&
+                 (cmp(base + c, base + c + size, cmp_data) < 0) )
                 c += size;
-            if ( cmp(base + r, base + c) >= 0 )
+            if ( cmp(base + r, base + c, cmp_data) >= 0 )
                 break;
             swap(base + r, base + c, size);
         }
-- 
2.34.1


