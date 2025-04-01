Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D83D7A77713
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 10:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933684.1335609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXSr-00040r-PL; Tue, 01 Apr 2025 08:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933684.1335609; Tue, 01 Apr 2025 08:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXSr-0003ya-Hq; Tue, 01 Apr 2025 08:59:21 +0000
Received: by outflank-mailman (input) for mailman id 933684;
 Tue, 01 Apr 2025 08:59:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=heJ8=WT=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tzXSq-0002OX-0D
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 08:59:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 983424ac-0ed7-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 10:59:18 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64E2F14BF;
 Tue,  1 Apr 2025 01:59:21 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 400733F694;
 Tue,  1 Apr 2025 01:59:15 -0700 (PDT)
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
X-Inumbo-ID: 983424ac-0ed7-11f0-9ea7-5ba50f476ded
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
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v4 6/7] xen: introduce Kconfig ARCH_PAGING_MEMPOOL
Date: Tue,  1 Apr 2025 09:58:57 +0100
Message-Id: <20250401085858.2228991-7-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401085858.2228991-1-luca.fancellu@arm.com>
References: <20250401085858.2228991-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

ARM MPU system doesn't need to use paging memory pool, as MPU memory
mapping table at most takes only one 4KB page, which is enough to
manage the maximum 255 MPU memory regions, for all EL2 stage 1
translation and EL1 stage 2 translation.

Introduce ARCH_PAGING_MEMPOOL Kconfig common symbol, selected for Arm
MMU systems and x86. Removed stubs from RISC-V now that the common code
provide them and the functions are not gonna be used.

Wrap the code inside 'construct_domU' that deal with p2m paging
allocation in a new function 'domain_p2m_set_allocation', protected
by ARCH_PAGING_MEMPOOL, this is done in this way to prevent polluting
the former function with #ifdefs and improve readability

Introduce arch_{get,set}_paging_mempool_size stubs for architecture
with !ARCH_PAGING_MEMPOOL.

Remove 'struct paging_domain' from Arm 'struct arch_domain' when the
field is not required.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com> # arm
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> # riscv
---
v4 changes:
 - removed arch_{get,set}_paging_mempool_size from RISC-V since they
   are not gonna be used (confirmed by Oleksii)
 - Removed blank lines around #ifdef/#else/#endif
 - Add Michal R-by #arm
 - Add Oleksii R-by #riscv
v3 changes:
 - Introduced ARCH_PAGING_MEMPOOL instead of HAS_PAGING_MEMPOOL
v2 changes:
 - make Kconfig HAS_PAGING_MEMPOOL common
 - protect also "xen,domain-p2m-mem-mb" reading with HAS_PAGING_MEMPOOL
 - do not define p2m_teardown{_allocation} in this patch
 - change commit message
---
 xen/arch/arm/Kconfig              |  1 +
 xen/arch/arm/dom0less-build.c     | 70 +++++++++++++++++++------------
 xen/arch/arm/include/asm/domain.h |  2 +
 xen/arch/riscv/stubs.c            | 11 -----
 xen/arch/x86/Kconfig              |  1 +
 xen/common/Kconfig                |  3 ++
 xen/include/xen/domain.h          | 17 ++++++++
 7 files changed, 68 insertions(+), 37 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 7a7658812d0e..565f28833118 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -75,6 +75,7 @@ choice
 
 config MMU
 	bool "MMU"
+	select ARCH_PAGING_MEMPOOL
 	select HAS_LLC_COLORING if !NUMA && ARM_64
 	select HAS_PMAP
 	select HAS_VMAP
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 573b0d25ae41..bd15563750e8 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -673,21 +673,6 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     return -EINVAL;
 }
 
-static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
-                                             unsigned int smp_cpus)
-{
-    /*
-     * Keep in sync with libxl__get_required_paging_memory().
-     * 256 pages (1MB) per vcpu, plus 1 page per MiB of RAM for the P2M map,
-     * plus 128 pages to cover extended regions.
-     */
-    unsigned long memkb = 4 * (256 * smp_cpus + (maxmem_kb / 1024) + 128);
-
-    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
-
-    return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
-}
-
 static int __init alloc_xenstore_evtchn(struct domain *d)
 {
     evtchn_alloc_unbound_t alloc;
@@ -841,6 +826,49 @@ static void __init domain_vcpu_affinity(struct domain *d,
     }
 }
 
+#ifdef CONFIG_ARCH_PAGING_MEMPOOL
+static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
+                                             unsigned int smp_cpus)
+{
+    /*
+     * Keep in sync with libxl__get_required_paging_memory().
+     * 256 pages (1MB) per vcpu, plus 1 page per MiB of RAM for the P2M map,
+     * plus 128 pages to cover extended regions.
+     */
+    unsigned long memkb = 4 * (256 * smp_cpus + (maxmem_kb / 1024) + 128);
+
+    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
+
+    return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
+}
+
+static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
+                                            const struct dt_device_node *node)
+{
+    unsigned long p2m_pages;
+    uint32_t p2m_mem_mb;
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
+#else /* !CONFIG_ARCH_PAGING_MEMPOOL */
+static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
+                                            const struct dt_device_node *node)
+{
+    return 0;
+}
+#endif /* CONFIG_ARCH_PAGING_MEMPOOL */
+
 static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
@@ -848,8 +876,6 @@ static int __init construct_domU(struct domain *d,
     const char *dom0less_enhanced;
     int rc;
     u64 mem;
-    u32 p2m_mem_mb;
-    unsigned long p2m_pages;
 
     rc = dt_property_read_u64(node, "memory", &mem);
     if ( !rc )
@@ -859,15 +885,7 @@ static int __init construct_domU(struct domain *d,
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
+    rc = domain_p2m_set_allocation(d, mem, node);
     if ( rc != 0 )
         return rc;
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 50b6a4b00982..a3487ca71303 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -75,7 +75,9 @@ struct arch_domain
 
     struct hvm_domain hvm;
 
+#ifdef CONFIG_ARCH_PAGING_MEMPOOL
     struct paging_domain paging;
+#endif
 
     struct vmmio vmmio;
 
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 5951b0ce91ed..cd594eb6b849 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -335,11 +335,6 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 
 /* p2m.c */
 
-int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
-{
-    BUG_ON("unimplemented");
-}
-
 int unmap_mmio_regions(struct domain *d,
                        gfn_t start_gfn,
                        unsigned long nr,
@@ -362,12 +357,6 @@ int set_foreign_p2m_entry(struct domain *d, const struct domain *fd,
     BUG_ON("unimplemented");
 }
 
-/* Return the size of the pool, in bytes. */
-int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
-{
-    BUG_ON("unimplemented");
-}
-
 int guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
                               unsigned int page_order)
 {
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 18efdb2e3130..de2fa37f088d 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -9,6 +9,7 @@ config X86
 	select ACPI_NUMA
 	select ALTERNATIVE_CALL
 	select ARCH_MAP_DOMAIN_PAGE
+	select ARCH_PAGING_MEMPOOL
 	select ARCH_SUPPORTS_INT128
 	imply CORE_PARKING
 	select FUNCTION_ALIGNMENT_16B
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index a6aa2c5c1456..218357d593b7 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -44,6 +44,9 @@ config ALTERNATIVE_CALL
 config ARCH_MAP_DOMAIN_PAGE
 	bool
 
+config ARCH_PAGING_MEMPOOL
+	bool
+
 config GENERIC_BUG_FRAME
 	bool
 
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 83069de50118..a34daa7d10ab 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -2,6 +2,7 @@
 #ifndef __XEN_DOMAIN_H__
 #define __XEN_DOMAIN_H__
 
+#include <xen/errno.h>
 #include <xen/numa.h>
 #include <xen/types.h>
 
@@ -114,9 +115,25 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c);
 int arch_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
 int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
 
+#ifdef CONFIG_ARCH_PAGING_MEMPOOL
+
 int arch_get_paging_mempool_size(struct domain *d, uint64_t *size /* bytes */);
 int arch_set_paging_mempool_size(struct domain *d, uint64_t size /* bytes */);
 
+#else /* !CONFIG_ARCH_PAGING_MEMPOOL */
+
+static inline int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
+{
+    return -EOPNOTSUPP;
+}
+
+static inline int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
+{
+    return -EOPNOTSUPP;
+}
+
+#endif /* CONFIG_ARCH_PAGING_MEMPOOL */
+
 bool update_runstate_area(struct vcpu *v);
 
 int domain_relinquish_resources(struct domain *d);
-- 
2.34.1


