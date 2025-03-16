Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6D6A63731
	for <lists+xen-devel@lfdr.de>; Sun, 16 Mar 2025 20:26:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916073.1321288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tttcB-0005mH-Qk; Sun, 16 Mar 2025 19:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916073.1321288; Sun, 16 Mar 2025 19:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tttcB-0005gT-L1; Sun, 16 Mar 2025 19:25:39 +0000
Received: by outflank-mailman (input) for mailman id 916073;
 Sun, 16 Mar 2025 19:25:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=84OC=WD=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tttc9-0005Uc-Ng
 for xen-devel@lists.xenproject.org; Sun, 16 Mar 2025 19:25:37 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6f3d15a9-029c-11f0-9899-31a8f345e629;
 Sun, 16 Mar 2025 20:25:35 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D10B2573;
 Sun, 16 Mar 2025 12:25:44 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC7F43F694;
 Sun, 16 Mar 2025 12:25:32 -0700 (PDT)
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
X-Inumbo-ID: 6f3d15a9-029c-11f0-9899-31a8f345e629
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v2 6/7] xen: introduce Kconfig HAS_PAGING_MEMPOOL
Date: Sun, 16 Mar 2025 19:24:44 +0000
Message-Id: <20250316192445.2376484-7-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250316192445.2376484-1-luca.fancellu@arm.com>
References: <20250316192445.2376484-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

ARM MPU system doesn't need to use paging memory pool, as MPU memory
mapping table at most takes only one 4KB page, which is enough to
manage the maximum 255 MPU memory regions, for all EL2 stage 1
translation and EL1 stage 2 translation.

Introduce HAS_PAGING_MEMPOOL Kconfig common symbol, selected for Arm
MMU systems.

Wrap the code inside 'construct_domU' that deal with p2m paging
allocation in a new function 'domu_p2m_set_allocation', protected
by HAS_PAGING_MEMPOOL, this is done in this way to prevent polluting
the former function with #ifdefs and improve readability

Introduce arch_{get,set}_paging_mempool_size implementation for MPU
system.

Remove 'struct paging_domain' from Arm 'struct arch_domain' when the
field is not required.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2 changes:
 - make Kconfig HAS_PAGING_MEMPOOL common
 - protect also "xen,domain-p2m-mem-mb" reading with HAS_PAGING_MEMPOOL
 - do not define p2m_teardown{_allocation} in this patch
 - change commit message
---
 xen/arch/arm/Kconfig              |  1 +
 xen/arch/arm/dom0less-build.c     | 48 ++++++++++++++++++++++++-------
 xen/arch/arm/include/asm/domain.h |  2 ++
 xen/arch/arm/mpu/Makefile         |  1 +
 xen/arch/arm/mpu/p2m.c            | 25 ++++++++++++++++
 xen/common/Kconfig                |  3 ++
 6 files changed, 69 insertions(+), 11 deletions(-)
 create mode 100644 xen/arch/arm/mpu/p2m.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 5ac6ec0212d2..6b4bcf12683e 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -76,6 +76,7 @@ choice
 config MMU
 	bool "MMU"
 	select HAS_LLC_COLORING if !NUMA && ARM_64
+	select HAS_PAGING_MEMPOOL
 	select HAS_PMAP
 	select HAS_VMAP
 	select HAS_PASSTHROUGH
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 573b0d25ae41..a65bbbb05301 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -673,6 +673,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     return -EINVAL;
 }
 
+#ifdef CONFIG_HAS_PAGING_MEMPOOL
+
 static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
                                              unsigned int smp_cpus)
 {
@@ -688,6 +690,8 @@ static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
     return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
 }
 
+#endif
+
 static int __init alloc_xenstore_evtchn(struct domain *d)
 {
     evtchn_alloc_unbound_t alloc;
@@ -841,6 +845,38 @@ static void __init domain_vcpu_affinity(struct domain *d,
     }
 }
 
+#ifdef CONFIG_HAS_PAGING_MEMPOOL
+
+static int __init domu_p2m_set_allocation(struct domain *d, u64 mem,
+                                          const struct dt_device_node *node)
+{
+    unsigned long p2m_pages;
+    u32 p2m_mem_mb;
+    int rc;
+
+    rc = dt_property_read_u32(node, "xen,domain-p2m-mem-mb", &p2m_mem_mb);
+    /* If xen,domain-p2m-mem-mb is not specified, use the default value. */
+    p2m_pages = rc ?
+                p2m_mem_mb << (20 - PAGE_SHIFT) :
+                domain_p2m_pages(mem, d->max_vcpus);
+
+    spin_lock(&d->arch.paging.lock);
+    rc = p2m_set_allocation(d, p2m_pages, NULL);
+    spin_unlock(&d->arch.paging.lock);
+
+    return rc;
+}
+
+#else /* !CONFIG_HAS_PAGING_MEMPOOL */
+
+static inline int domu_p2m_set_allocation(struct domain *d, u64 mem,
+                                          const struct dt_device_node *node)
+{
+    return 0;
+}
+
+#endif /* CONFIG_HAS_PAGING_MEMPOOL */
+
 static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
@@ -848,8 +884,6 @@ static int __init construct_domU(struct domain *d,
     const char *dom0less_enhanced;
     int rc;
     u64 mem;
-    u32 p2m_mem_mb;
-    unsigned long p2m_pages;
 
     rc = dt_property_read_u64(node, "memory", &mem);
     if ( !rc )
@@ -859,15 +893,7 @@ static int __init construct_domU(struct domain *d,
     }
     kinfo.unassigned_mem = (paddr_t)mem * SZ_1K;
 
-    rc = dt_property_read_u32(node, "xen,domain-p2m-mem-mb", &p2m_mem_mb);
-    /* If xen,domain-p2m-mem-mb is not specified, use the default value. */
-    p2m_pages = rc ?
-                p2m_mem_mb << (20 - PAGE_SHIFT) :
-                domain_p2m_pages(mem, d->max_vcpus);
-
-    spin_lock(&d->arch.paging.lock);
-    rc = p2m_set_allocation(d, p2m_pages, NULL);
-    spin_unlock(&d->arch.paging.lock);
+    rc = domu_p2m_set_allocation(d, mem, node);
     if ( rc != 0 )
         return rc;
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 50b6a4b00982..fadec7d8fa9e 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -75,7 +75,9 @@ struct arch_domain
 
     struct hvm_domain hvm;
 
+#ifdef CONFIG_HAS_PAGING_MEMPOOL
     struct paging_domain paging;
+#endif
 
     struct vmmio vmmio;
 
diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
index b18cec483671..5424ab6239c8 100644
--- a/xen/arch/arm/mpu/Makefile
+++ b/xen/arch/arm/mpu/Makefile
@@ -1 +1,2 @@
 obj-y += mm.o
+obj-y += p2m.o
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
new file mode 100644
index 000000000000..71f9cdbf2fdb
--- /dev/null
+++ b/xen/arch/arm/mpu/p2m.c
@@ -0,0 +1,25 @@
+
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/domain.h>
+#include <xen/errno.h>
+#include <xen/types.h>
+
+int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
+{
+    return -EOPNOTSUPP;
+}
+
+int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
+{
+    return -EOPNOTSUPP;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6166327f4d14..a3bdf546d02f 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -74,6 +74,9 @@ config HAS_KEXEC
 config HAS_LLC_COLORING
 	bool
 
+config HAS_PAGING_MEMPOOL
+	bool
+
 config HAS_PIRQ
 	bool
 
-- 
2.34.1


