Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15573D674
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555025.866632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4z-0007zN-PD; Mon, 26 Jun 2023 03:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555025.866632; Mon, 26 Jun 2023 03:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4y-0007j3-Qc; Mon, 26 Jun 2023 03:39:52 +0000
Received: by outflank-mailman (input) for mailman id 555025;
 Mon, 26 Jun 2023 03:39:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd2d-0007ej-7C
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:37:27 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c4cd8afc-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:37:26 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE4681FB;
 Sun, 25 Jun 2023 20:38:09 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 425AF3F64C;
 Sun, 25 Jun 2023 20:37:23 -0700 (PDT)
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
X-Inumbo-ID: c4cd8afc-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 44/52] xen/mpu: P2M initialization in MPU system
Date: Mon, 26 Jun 2023 11:34:35 +0800
Message-Id: <20230626033443.2943270-45-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We inherit p2m_init() to do P2M initialization in MPU system, including
VMID assignment, setting up P2M MPU region mapping table, etc.

p2m_alloc_table() is responsible for allocating per-domain P2M MPU memory
region mapping table. As a MPU memory region structure(pr_t) takes 16 bytes,
even with maximum supported MPU memory regions, 255, MPU memory mapping table
at most takes up less than 4KB.

VSCTLR_EL2, Virtualization System Control Register, provides configuration
information for VMSAv8-64 and PMSAv8-64 virtualization using stage 2
of EL1&0 translation regime, bit[63:48] of which determines VMID for the
EL1-Guest-OS.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new commit
---
 xen/arch/arm/include/asm/mpu/mm.h |  3 ++
 xen/arch/arm/include/asm/p2m.h    |  5 +++
 xen/arch/arm/mpu/mm.c             | 22 ++++++++++
 xen/arch/arm/mpu/p2m.c            | 69 +++++++++++++++++++++++++++++++
 4 files changed, 99 insertions(+)

diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index a83519ad13..4df69245c6 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -2,6 +2,8 @@
 #ifndef __ARCH_ARM_MM_MPU__
 #define __ARCH_ARM_MM_MPU__
 
+#include <asm/arm64/mpu.h>
+
 extern struct page_info *frame_table;
 extern unsigned long frametable_pdx_end;
 
@@ -11,6 +13,7 @@ extern uint8_t is_mm_range_mapped(paddr_t pa, paddr_t len);
 extern void *map_mm_range(paddr_t pa, size_t len, unsigned int attributes);
 extern void unmap_mm_range(paddr_t pa);
 extern bool is_mm_range_mapped_transient(paddr_t pa, paddr_t len);
+extern pr_t *alloc_mpumap(void);
 
 #endif /* __ARCH_ARM_MM_MPU__ */
 
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index d9c91d4a98..c3598d514e 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -61,8 +61,13 @@ struct p2m_domain {
     /* Current VMID in use */
     uint16_t vmid;
 
+#ifndef CONFIG_HAS_MPU
     /* Current Translation Table Base Register for the p2m */
     uint64_t vttbr;
+#else
+    /* Current Virtualization System Control Register for the p2m */
+    uint64_t vsctlr;
+#endif
 
     /* Highest guest frame that's ever been mapped in the p2m */
     gfn_t max_mapped_gfn;
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 27d924e449..de5da96b80 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -872,6 +872,28 @@ void __init remove_early_mappings(paddr_t dtb_paddr)
             panic("Unable to destroy early Device-Tree mapping.\n");
 }
 
+/*
+ * Standard entry to dynamically allocate MPU memory region mapping table.
+ * A 4KB page is enough for holding the maximum supported MPU memory
+ * regions.
+ */
+pr_t *alloc_mpumap(void)
+{
+    pr_t *map;
+
+    /*
+     * A MPU memory region structure(pr_t) takes 16 bytes, even with maximum
+     * supported MPU memory regions, 255, MPU memory mapping table at most
+     * takes up less than 4KB.
+     */
+    map = alloc_xenheap_pages(0, 0);
+    if ( map == NULL )
+        return NULL;
+
+    clear_page(map);
+    return map;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index a7a3912a9a..8f728f8957 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -4,6 +4,7 @@
 #include <xen/sched.h>
 #include <xen/warning.h>
 
+#include <asm/mpu/mm.h>
 #include <asm/p2m.h>
 #include <asm/processor.h>
 #include <asm/sysregs.h>
@@ -97,6 +98,74 @@ fault:
     panic("Hardware with no PMSAv8-64 support in any translation regime.\n");
 }
 
+static uint64_t __init generate_vsctlr(uint16_t vmid)
+{
+    return ((uint64_t)vmid << 48);
+}
+
+static int __init p2m_alloc_table(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    pr_t* p2m_map;
+
+    p2m_map = alloc_mpumap();
+    if ( !p2m_map )
+    {
+        printk(XENLOG_G_ERR "DOM%pd: p2m: unable to allocate P2M MPU mapping table\n", d);
+        return -ENOMEM;
+    }
+
+    p2m->root = virt_to_page((const void *)p2m_map);
+
+    return 0;
+}
+
+int p2m_init(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    int rc = 0;
+    unsigned int cpu;
+
+    rwlock_init(&p2m->lock);
+    spin_lock_init(&d->arch.paging.lock);
+
+    p2m->vmid = INVALID_VMID;
+    p2m->max_mapped_gfn = _gfn(0);
+    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
+
+    p2m->default_access = p2m_access_rwx;
+    /* mem_access is NOT supported in MPU system. */
+    p2m->mem_access_enabled = false;
+
+    /*
+     * Make sure that the type chosen to is able to store an vCPU ID
+     * between 0 and the maximum of virtual CPUS supported as long as
+     * the INVALID_VCPU_ID.
+     */
+    BUILD_BUG_ON((1 << (sizeof(p2m->last_vcpu_ran[0]) * 8)) < MAX_VIRT_CPUS);
+    BUILD_BUG_ON((1 << (sizeof(p2m->last_vcpu_ran[0]) * 8)) < INVALID_VCPU_ID);
+
+    for_each_possible_cpu(cpu)
+       p2m->last_vcpu_ran[cpu] = INVALID_VCPU_ID;
+
+    /*
+     * "Trivial" initialisation is now complete.  Set the backpointer so
+     * p2m_teardown() and friends know to do something.
+     */
+    p2m->domain = d;
+
+    rc = p2m_alloc_vmid(d);
+    if ( rc )
+        return rc;
+    p2m->vsctlr = generate_vsctlr(p2m->vmid);
+
+    rc = p2m_alloc_table(d);
+    if ( rc )
+        return rc;
+
+    return rc;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


