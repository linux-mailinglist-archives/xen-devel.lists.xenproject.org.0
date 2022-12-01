Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F11F63F4E4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:11:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450982.708541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m9w-0007x7-AE; Thu, 01 Dec 2022 16:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450982.708541; Thu, 01 Dec 2022 16:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m9w-0007v0-7O; Thu, 01 Dec 2022 16:11:36 +0000
Received: by outflank-mailman (input) for mailman id 450982;
 Thu, 01 Dec 2022 16:11:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0m5A-0001G4-2n
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:06:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 22f967f6-7192-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 17:06:38 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D00BED1;
 Thu,  1 Dec 2022 08:06:44 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDA703F73B;
 Thu,  1 Dec 2022 08:06:36 -0800 (PST)
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
X-Inumbo-ID: 22f967f6-7192-11ed-8fd2-01056ac49cbb
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 05/21] xen/arm: vsmmuv3: Add dummy support for virtual SMMUv3 for guests
Date: Thu,  1 Dec 2022 16:02:29 +0000
Message-Id: <6d25bcb543190d78c26db15a0f07e9af79349884.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

domain_viommu_init() will be called during domain creation and will add
the dummy trap handler for virtual IOMMUs for guests.

A host IOMMU list will be created when host IOMMU devices are probed
and this list will be used to create the IOMMU device tree node for
dom0. For dom0, 1-1 mapping will be established between vIOMMU in dom0
and physical IOMMU.

For domUs, the 1-N mapping will be established between domU and physical
IOMMUs. A new area has been reserved in the arm guest physical map at
which the emulated vIOMMU node is created in the device tree.

Also set the vIOMMU type to vSMMUv3 to enable vIOMMU framework to call
vSMMUv3 domain creation/destroy functions.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/domain.c                  |   3 +-
 xen/arch/arm/include/asm/domain.h      |   4 +
 xen/arch/arm/include/asm/viommu.h      |  20 ++++
 xen/drivers/passthrough/Kconfig        |   8 ++
 xen/drivers/passthrough/arm/Makefile   |   1 +
 xen/drivers/passthrough/arm/smmu-v3.c  |   7 ++
 xen/drivers/passthrough/arm/viommu.c   |  30 ++++++
 xen/drivers/passthrough/arm/vsmmu-v3.c | 124 +++++++++++++++++++++++++
 xen/drivers/passthrough/arm/vsmmu-v3.h |  20 ++++
 xen/include/public/arch-arm.h          |   7 +-
 10 files changed, 222 insertions(+), 2 deletions(-)
 create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.c
 create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.h

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 2a85209736..9a2b613500 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -692,7 +692,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
+    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE &&
+         config->arch.viommu_type != viommu_get_type() )
     {
         dprintk(XENLOG_INFO,
                 "vIOMMU type requested not supported by the platform or Xen\n");
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 2ce6764322..8eb4eb5fd6 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -114,6 +114,10 @@ struct arch_domain
     void *tee;
 #endif
 
+#ifdef CONFIG_VIRTUAL_IOMMU
+    struct list_head viommu_list;     /* List of virtual IOMMUs */
+#endif
+
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
index 7cd3818a12..4785877e2a 100644
--- a/xen/arch/arm/include/asm/viommu.h
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -5,9 +5,21 @@
 #ifdef CONFIG_VIRTUAL_IOMMU
 
 #include <xen/lib.h>
+#include <xen/list.h>
 #include <xen/types.h>
 #include <public/xen.h>
 
+extern struct list_head host_iommu_list;
+
+/* data structure for each hardware IOMMU */
+struct host_iommu {
+    struct list_head entry;
+    const struct dt_device_node *dt_node;
+    paddr_t addr;
+    paddr_t size;
+    uint32_t irq;
+};
+
 struct viommu_ops {
     /*
      * Called during domain construction if toolstack requests to enable
@@ -35,6 +47,8 @@ struct viommu_desc {
 int domain_viommu_init(struct domain *d, uint16_t viommu_type);
 int viommu_relinquish_resources(struct domain *d);
 uint16_t viommu_get_type(void);
+void add_to_host_iommu_list(paddr_t addr, paddr_t size,
+                            const struct dt_device_node *node);
 
 #else
 
@@ -56,6 +70,12 @@ static inline int viommu_relinquish_resources(struct domain *d)
     return 0;
 }
 
+static inline void add_to_host_iommu_list(paddr_t addr, paddr_t size,
+                                          const struct dt_device_node *node)
+{
+    return;
+}
+
 #endif /* CONFIG_VIRTUAL_IOMMU */
 
 #endif /* __ARCH_ARM_VIOMMU_H__ */
diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index 19924fa2de..4c725f5f67 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -41,6 +41,14 @@ config VIRTUAL_IOMMU
 	help
 	 Support virtual IOMMU infrastructure to implement vIOMMU.
 
+config VIRTUAL_ARM_SMMU_V3
+	bool "ARM Ltd. Virtual SMMUv3 Support (UNSUPPORTED)" if UNSUPPORTED
+	depends on ARM_SMMU_V3 && VIRTUAL_IOMMU
+	help
+	 Support for implementations of the virtual ARM System MMU architecture
+	 version 3. Virtual SMMUv3 is unsupported feature and should not be used
+	 in production.
+
 endif
 
 config IOMMU_FORCE_PT_SHARE
diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough/arm/Makefile
index 4cc54f3f4d..e758a9d6aa 100644
--- a/xen/drivers/passthrough/arm/Makefile
+++ b/xen/drivers/passthrough/arm/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_ARM_SMMU) += smmu.o
 obj-$(CONFIG_IPMMU_VMSA) += ipmmu-vmsa.o
 obj-$(CONFIG_ARM_SMMU_V3) += smmu-v3.o
 obj-$(CONFIG_VIRTUAL_IOMMU) += viommu.o
+obj-$(CONFIG_VIRTUAL_ARM_SMMU_V3) += vsmmu-v3.o
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 9174d2dedd..4f96fdb92f 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -91,6 +91,7 @@
 #include <asm/platform.h>
 
 #include "smmu-v3.h"
+#include "vsmmu-v3.h"
 
 #define ARM_SMMU_VTCR_SH_IS		3
 #define ARM_SMMU_VTCR_RGN_WBWA		1
@@ -2680,6 +2681,9 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	list_add(&smmu->devices, &arm_smmu_devices);
 	spin_unlock(&arm_smmu_devices_lock);
 
+    /* Add to host IOMMU list to initialize vIOMMU for dom0 */
+	add_to_host_iommu_list(ioaddr, iosize, dev_to_dt(pdev));
+
 	return 0;
 
 
@@ -2936,6 +2940,9 @@ static __init int arm_smmu_dt_init(struct dt_device_node *dev,
 
 	iommu_set_ops(&arm_smmu_iommu_ops);
 
+	/* Set vIOMMU type to SMMUv3 */
+	vsmmuv3_set_type();
+
 	return 0;
 }
 
diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
index 7ab6061e34..53ae46349a 100644
--- a/xen/drivers/passthrough/arm/viommu.c
+++ b/xen/drivers/passthrough/arm/viommu.c
@@ -2,12 +2,42 @@
 
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/irq.h>
 #include <xen/types.h>
 
 #include <asm/viommu.h>
 
+/* List of all host IOMMUs */
+LIST_HEAD(host_iommu_list);
+
 const struct viommu_desc __read_mostly *cur_viommu;
 
+/* Common function for adding to host_iommu_list */
+void add_to_host_iommu_list(paddr_t addr, paddr_t size,
+                            const struct dt_device_node *node)
+{
+    struct host_iommu *iommu_data;
+
+    iommu_data = xzalloc(struct host_iommu);
+    if ( !iommu_data )
+        panic("vIOMMU: Cannot allocate memory for host IOMMU data\n");
+
+    iommu_data->addr = addr;
+    iommu_data->size = size;
+    iommu_data->dt_node = node;
+    iommu_data->irq = platform_get_irq(node, 0);
+    if ( iommu_data->irq < 0 )
+    {
+        gdprintk(XENLOG_ERR,
+                 "vIOMMU: Cannot find a valid IOMMU irq\n");
+        return;
+    }
+
+    printk("vIOMMU: Found IOMMU @0x%"PRIx64"\n", addr);
+
+    list_add_tail(&iommu_data->entry, &host_iommu_list);
+}
+
 int domain_viommu_init(struct domain *d, uint16_t viommu_type)
 {
     if ( viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE )
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
new file mode 100644
index 0000000000..6b4009e5ef
--- /dev/null
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -0,0 +1,124 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+
+#include <xen/param.h>
+#include <xen/sched.h>
+#include <asm/mmio.h>
+#include <asm/viommu.h>
+
+/* Struct to hold the vIOMMU ops and vIOMMU type */
+extern const struct viommu_desc __read_mostly *cur_viommu;
+
+struct virt_smmu {
+    struct      domain *d;
+    struct      list_head viommu_list;
+};
+
+static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
+                              register_t r, void *priv)
+{
+    return IO_HANDLED;
+}
+
+static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
+                             register_t *r, void *priv)
+{
+    return IO_HANDLED;
+}
+
+static const struct mmio_handler_ops vsmmuv3_mmio_handler = {
+    .read  = vsmmuv3_mmio_read,
+    .write = vsmmuv3_mmio_write,
+};
+
+static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size)
+{
+    struct virt_smmu *smmu;
+
+    smmu = xzalloc(struct virt_smmu);
+    if ( !smmu )
+        return -ENOMEM;
+
+    smmu->d = d;
+
+    register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
+
+    /* Register the vIOMMU to be able to clean it up later. */
+    list_add_tail(&smmu->viommu_list, &d->arch.viommu_list);
+
+    return 0;
+}
+
+int domain_vsmmuv3_init(struct domain *d)
+{
+    int ret;
+    INIT_LIST_HEAD(&d->arch.viommu_list);
+
+    if ( is_hardware_domain(d) )
+    {
+        struct host_iommu *hw_iommu;
+
+        list_for_each_entry(hw_iommu, &host_iommu_list, entry)
+        {
+            ret = vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size);
+            if ( ret )
+                return ret;
+        }
+    }
+    else
+    {
+        ret = vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE);
+        if ( ret )
+            return ret;
+    }
+
+    return 0;
+}
+
+int vsmmuv3_relinquish_resources(struct domain *d)
+{
+    struct virt_smmu *pos, *temp;
+
+    /* Cope with unitialized vIOMMU */
+    if ( list_head_is_null(&d->arch.viommu_list) )
+        return 0;
+
+    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_list )
+    {
+        list_del(&pos->viommu_list);
+        xfree(pos);
+    }
+
+    return 0;
+}
+
+static const struct viommu_ops vsmmuv3_ops = {
+    .domain_init = domain_vsmmuv3_init,
+    .relinquish_resources = vsmmuv3_relinquish_resources,
+};
+
+static const struct viommu_desc vsmmuv3_desc = {
+    .ops = &vsmmuv3_ops,
+    .viommu_type = XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3,
+};
+
+void __init vsmmuv3_set_type(void)
+{
+    const struct viommu_desc *desc = &vsmmuv3_desc;
+
+    if ( cur_viommu && (cur_viommu != desc) )
+    {
+        printk("WARNING: Cannot set vIOMMU, already set to a different value\n");
+        return;
+    }
+
+    cur_viommu = desc;
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
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.h b/xen/drivers/passthrough/arm/vsmmu-v3.h
new file mode 100644
index 0000000000..e11f85b431
--- /dev/null
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+#ifndef __ARCH_ARM_VSMMU_V3_H__
+#define __ARCH_ARM_VSMMU_V3_H__
+
+#include <asm/viommu.h>
+
+#ifdef CONFIG_VIRTUAL_ARM_SMMU_V3
+
+void vsmmuv3_set_type(void);
+
+#else
+
+static inline void vsmmuv3_set_type(void)
+{
+    return;
+}
+
+#endif /* CONFIG_VIRTUAL_ARM_SMMU_V3 */
+
+#endif /* __ARCH_ARM_VSMMU_V3_H__ */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 33d32835e7..24b52fa017 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -297,7 +297,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_NONE      0
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
 
-#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
+#define XEN_DOMCTL_CONFIG_VIOMMU_NONE       0
+#define XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3     1
 
 struct xen_arch_domainconfig {
     /* IN/OUT */
@@ -418,6 +419,10 @@ typedef uint64_t xen_callback_t;
 #define GUEST_GICV3_GICR0_BASE     xen_mk_ullong(0x03020000) /* vCPU0..127 */
 #define GUEST_GICV3_GICR0_SIZE     xen_mk_ullong(0x01000000)
 
+/* vsmmuv3 ITS mappings */
+#define GUEST_VSMMUV3_BASE     xen_mk_ullong(0x04040000)
+#define GUEST_VSMMUV3_SIZE     xen_mk_ullong(0x00040000)
+
 /*
  * 256 MB is reserved for VPCI configuration space based on calculation
  * 256 buses x 32 devices x 8 functions x 4 KB = 256 MB
-- 
2.25.1


