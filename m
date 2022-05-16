Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E106528B82
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 19:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330170.553500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqe7Q-0002tM-It; Mon, 16 May 2022 17:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330170.553500; Mon, 16 May 2022 17:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqe7Q-0002qj-F3; Mon, 16 May 2022 17:02:52 +0000
Received: by outflank-mailman (input) for mailman id 330170;
 Mon, 16 May 2022 17:02:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nqe7P-0002qd-NP
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 17:02:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqe7P-0006xf-BG; Mon, 16 May 2022 17:02:51 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqe7P-0005YY-22; Mon, 16 May 2022 17:02:51 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=cq8sllYbdnsvMJxc54TQHqA9ko2N/yUSE4bVjrkEMLI=; b=FOYI/g
	zsKHayTl9XoqCuZ7zP2JVpnNB/Fy4BO1dFMtQXGmWdmSsh80yJqws39Indn6XPV89fPVqmUV11Cni
	VJ1UcBC5PcQagehrQY/HkUZj6cCBgQurkMIBEx2feJif4SByNp20BmlOiVKCnUNctcSllGmgc89Q1
	Ql6DxsRiG10=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: gic-v3-lpi: Allocate the pending table while preparing the CPU
Date: Mon, 16 May 2022 18:02:46 +0100
Message-Id: <20220516170246.19908-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Commit 88a037e2cfe1 "page_alloc: assert IRQs are enabled in heap
alloc/free" extended the checks in the buddy allocator to catch any
use of the helpers from context with interrupts disabled.

Unfortunately, the rule is not followed in the LPI code when allocating
the pending table:

(XEN) Xen call trace:
(XEN)    [<000000000022a678>] alloc_xenheap_pages+0x178/0x194 (PC)
(XEN)    [<000000000022a670>] alloc_xenheap_pages+0x170/0x194 (LR)
(XEN)    [<0000000000237770>] _xmalloc+0x144/0x294
(XEN)    [<00000000002378d4>] _xzalloc+0x14/0x30
(XEN)    [<000000000027b4e4>] gicv3_lpi_init_rdist+0x54/0x324
(XEN)    [<0000000000279898>] arch/arm/gic-v3.c#gicv3_cpu_init+0x128/0x46
(XEN)    [<0000000000279bfc>] arch/arm/gic-v3.c#gicv3_secondary_cpu_init+0x20/0x50
(XEN)    [<0000000000277054>] gic_init_secondary_cpu+0x18/0x30
(XEN)    [<0000000000284518>] start_secondary+0x1a8/0x234
(XEN)    [<0000010722aa4200>] 0000010722aa4200
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 2:
(XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1)' failed at common/page_alloc.c:2212
(XEN) ****************************************

For now the patch extending the checks has been reverted, but it would
be good to re-introduce it (allocation with interrupt is not desirable).

The logic is reworked to allocate the pending table when preparing the
CPU.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

    Changes in v2:
        - Print an error message if we fail to allocate memory for
          secondary CPUs
        - The memory should always be allocated before
          gicv3_lpi_set_pendtable() is called. Add an ASSERT_UNREACHABLE()
          to make it clearer the check is just for sanity.
---
 xen/arch/arm/gic-v3-lpi.c | 91 +++++++++++++++++++++++++++++----------
 1 file changed, 69 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index e1594dd20e4c..a656b531f41f 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -18,6 +18,7 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/cpu.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
 #include <xen/param.h>
@@ -234,18 +235,13 @@ void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
     write_u64_atomic(&hlpip->data, hlpi.data);
 }
 
-static int gicv3_lpi_allocate_pendtable(uint64_t *reg)
+static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
 {
-    uint64_t val;
     void *pendtable;
 
-    if ( this_cpu(lpi_redist).pending_table )
+    if ( per_cpu(lpi_redist, cpu).pending_table )
         return -EBUSY;
 
-    val  = GIC_BASER_CACHE_RaWaWb << GICR_PENDBASER_INNER_CACHEABILITY_SHIFT;
-    val |= GIC_BASER_CACHE_SameAsInner << GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT;
-    val |= GIC_BASER_InnerShareable << GICR_PENDBASER_SHAREABILITY_SHIFT;
-
     /*
      * The pending table holds one bit per LPI and even covers bits for
      * interrupt IDs below 8192, so we allocate the full range.
@@ -265,13 +261,45 @@ static int gicv3_lpi_allocate_pendtable(uint64_t *reg)
     clean_and_invalidate_dcache_va_range(pendtable,
                                          lpi_data.max_host_lpi_ids / 8);
 
-    this_cpu(lpi_redist).pending_table = pendtable;
+    per_cpu(lpi_redist, cpu).pending_table = pendtable;
 
-    val |= GICR_PENDBASER_PTZ;
+    return 0;
+}
+
+static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
+{
+    const void *pendtable = this_cpu(lpi_redist).pending_table;
+    uint64_t val;
+
+    /*
+     * The memory should have been allocated while preparing the CPU (or
+     * before calling this function for the boot CPU).
+     */
+    if ( !pendtable )
+    {
+        ASSERT_UNREACHABLE();
+        return -ENOMEM;
+    }
 
+    ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK(51, 16)));
+
+    val  = GIC_BASER_CACHE_RaWaWb << GICR_PENDBASER_INNER_CACHEABILITY_SHIFT;
+    val |= GIC_BASER_CACHE_SameAsInner << GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT;
+    val |= GIC_BASER_InnerShareable << GICR_PENDBASER_SHAREABILITY_SHIFT;
+    val |= GICR_PENDBASER_PTZ;
     val |= virt_to_maddr(pendtable);
 
-    *reg = val;
+    writeq_relaxed(val, rdist_base + GICR_PENDBASER);
+    val = readq_relaxed(rdist_base + GICR_PENDBASER);
+
+    /* If the hardware reports non-shareable, drop cacheability as well. */
+    if ( !(val & GICR_PENDBASER_SHAREABILITY_MASK) )
+    {
+        val &= ~GICR_PENDBASER_INNER_CACHEABILITY_MASK;
+        val |= GIC_BASER_CACHE_nC << GICR_PENDBASER_INNER_CACHEABILITY_SHIFT;
+
+        writeq_relaxed(val, rdist_base + GICR_PENDBASER);
+    }
 
     return 0;
 }
@@ -340,7 +368,6 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist_base)
 int gicv3_lpi_init_rdist(void __iomem * rdist_base)
 {
     uint32_t reg;
-    uint64_t table_reg;
     int ret;
 
     /* We don't support LPIs without an ITS. */
@@ -352,24 +379,36 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base)
     if ( reg & GICR_CTLR_ENABLE_LPIS )
         return -EBUSY;
 
-    ret = gicv3_lpi_allocate_pendtable(&table_reg);
+    ret = gicv3_lpi_set_pendtable(rdist_base);
     if ( ret )
         return ret;
-    writeq_relaxed(table_reg, rdist_base + GICR_PENDBASER);
-    table_reg = readq_relaxed(rdist_base + GICR_PENDBASER);
 
-    /* If the hardware reports non-shareable, drop cacheability as well. */
-    if ( !(table_reg & GICR_PENDBASER_SHAREABILITY_MASK) )
-    {
-        table_reg &= ~GICR_PENDBASER_INNER_CACHEABILITY_MASK;
-        table_reg |= GIC_BASER_CACHE_nC << GICR_PENDBASER_INNER_CACHEABILITY_SHIFT;
+    return gicv3_lpi_set_proptable(rdist_base);
+}
 
-        writeq_relaxed(table_reg, rdist_base + GICR_PENDBASER);
+static int cpu_callback(struct notifier_block *nfb, unsigned long action,
+                        void *hcpu)
+{
+    unsigned long cpu = (unsigned long)hcpu;
+    int rc = 0;
+
+    switch ( action )
+    {
+    case CPU_UP_PREPARE:
+        rc = gicv3_lpi_allocate_pendtable(cpu);
+        if ( rc )
+            printk(XENLOG_ERR "Unable to allocate the pendtable for CPU%u\n",
+                   cpu);
+        break;
     }
 
-    return gicv3_lpi_set_proptable(rdist_base);
+    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
 }
 
+static struct notifier_block cpu_nfb = {
+    .notifier_call = cpu_callback,
+};
+
 static unsigned int max_lpi_bits = 20;
 integer_param("max_lpi_bits", max_lpi_bits);
 
@@ -381,6 +420,7 @@ integer_param("max_lpi_bits", max_lpi_bits);
 int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
 {
     unsigned int nr_lpi_ptrs;
+    int rc;
 
     /* We rely on the data structure being atomically accessible. */
     BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(unsigned long));
@@ -413,7 +453,14 @@ int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
 
     printk("GICv3: using at most %lu LPIs on the host.\n", MAX_NR_HOST_LPIS);
 
-    return 0;
+    /* Register the CPU notifier and allocate memory for the boot CPU */
+    register_cpu_notifier(&cpu_nfb);
+    rc = gicv3_lpi_allocate_pendtable(smp_processor_id());
+    if ( rc )
+        printk(XENLOG_ERR "Unable to allocate the pendtable for CPU%u\n",
+               smp_processor_id());
+
+    return rc;
 }
 
 static int find_unused_host_lpi(uint32_t start, uint32_t *index)
-- 
2.32.0


