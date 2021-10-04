Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E03420A7E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 13:57:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201378.355860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXMb8-00072w-Bx; Mon, 04 Oct 2021 11:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201378.355860; Mon, 04 Oct 2021 11:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXMb8-00070N-8L; Mon, 04 Oct 2021 11:57:34 +0000
Received: by outflank-mailman (input) for mailman id 201378;
 Mon, 04 Oct 2021 11:57:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJPG=OY=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mXMb6-0006zq-Rg
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 11:57:32 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id db4b6544-c31e-4f0d-84dd-2883e49dd428;
 Mon, 04 Oct 2021 11:57:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0678D6E;
 Mon,  4 Oct 2021 04:57:30 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D4D53F70D;
 Mon,  4 Oct 2021 04:57:28 -0700 (PDT)
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
X-Inumbo-ID: db4b6544-c31e-4f0d-84dd-2883e49dd428
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 11/14] xen/arm: Enable the existing x86 virtual PCI support for ARM.
Date: Mon,  4 Oct 2021 12:52:06 +0100
Message-Id: <f093de681c2560a7196895bcd666ef8840885c1d.1633340795.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633340795.git.rahul.singh@arm.com>
References: <cover.1633340795.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The existing VPCI support available for X86 is adapted for Arm.
When the device is added to XEN via the hyper call
“PHYSDEVOP_pci_device_add”, VPCI handler for the config space
access is added to the Xen to emulate the PCI devices config space.

A MMIO trap handler for the PCI ECAM space is registered in XEN
so that when guest is trying to access the PCI config space,XEN
will trap the access and emulate read/write using the VPCI and
not the real PCI hardware.

For Dom0less systems scan_pci_devices() would be used to discover the
PCI device in XEN and VPCI handler will be added during XEN boots.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Change in v4:
- Move addition of XEN_DOMCTL_CDF_vpci flag to separate patch
Change in v3:
- Use is_pci_passthrough_enabled() in place of pci_passthrough_enabled variable
- Reject XEN_DOMCTL_CDF_vpci for x86 in arch_sanitise_domain_config()
- Remove IS_ENABLED(CONFIG_HAS_VPCI) from has_vpci()
Change in v2:
- Add new XEN_DOMCTL_CDF_vpci flag
- modify has_vpci() to include XEN_DOMCTL_CDF_vpci
- enable vpci support when pci-passthough option is enabled.
---
---
 xen/arch/arm/Makefile         |   1 +
 xen/arch/arm/domain.c         |   4 ++
 xen/arch/arm/domain_build.c   |   3 +
 xen/arch/arm/vpci.c           | 102 ++++++++++++++++++++++++++++++++++
 xen/arch/arm/vpci.h           |  36 ++++++++++++
 xen/drivers/passthrough/pci.c |  17 ++++++
 xen/include/asm-arm/domain.h  |   7 ++-
 xen/include/asm-x86/pci.h     |   2 -
 xen/include/public/arch-arm.h |   7 +++
 xen/include/xen/pci.h         |   2 +
 10 files changed, 178 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/arm/vpci.c
 create mode 100644 xen/arch/arm/vpci.h

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 44d7cc81fa..fb9c976ea2 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -7,6 +7,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
 obj-y += platforms/
 endif
 obj-$(CONFIG_TEE) += tee/
+obj-$(CONFIG_HAS_VPCI) += vpci.o
 
 obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
 obj-y += bootfdt.init.o
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 36138c1b2e..fbb52f78f1 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -39,6 +39,7 @@
 #include <asm/vgic.h>
 #include <asm/vtimer.h>
 
+#include "vpci.h"
 #include "vuart.h"
 
 DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
@@ -767,6 +768,9 @@ int arch_domain_create(struct domain *d,
     if ( is_hardware_domain(d) && (rc = domain_vuart_init(d)) )
         goto fail;
 
+    if ( (rc = domain_vpci_init(d)) != 0 )
+        goto fail;
+
     return 0;
 
 fail:
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index c5afbe2e05..f4c89bde8c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3053,6 +3053,9 @@ void __init create_dom0(void)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
+    if ( is_pci_passthrough_enabled() )
+        dom0_cfg.flags |= XEN_DOMCTL_CDF_vpci;
+
     dom0 = domain_create(0, &dom0_cfg, true);
     if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
         panic("Error creating domain 0\n");
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
new file mode 100644
index 0000000000..76c12b9281
--- /dev/null
+++ b/xen/arch/arm/vpci.c
@@ -0,0 +1,102 @@
+/*
+ * xen/arch/arm/vpci.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <xen/sched.h>
+
+#include <asm/mmio.h>
+
+#define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
+
+/* Do some sanity checks. */
+static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int len)
+{
+    /* Check access size. */
+    if ( len > 8 )
+        return false;
+
+    /* Check that access is size aligned. */
+    if ( (reg & (len - 1)) )
+        return false;
+
+    return true;
+}
+
+static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
+                          register_t *r, void *p)
+{
+    unsigned int reg;
+    pci_sbdf_t sbdf;
+    unsigned long data = ~0UL;
+    unsigned int size = 1U << info->dabt.size;
+
+    sbdf.sbdf = MMCFG_BDF(info->gpa);
+    reg = REGISTER_OFFSET(info->gpa);
+
+    if ( !vpci_mmio_access_allowed(reg, size) )
+        return 0;
+
+    data = vpci_read(sbdf, reg, min(4u, size));
+    if ( size == 8 )
+        data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
+
+    *r = data;
+
+    return 1;
+}
+
+static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
+                           register_t r, void *p)
+{
+    unsigned int reg;
+    pci_sbdf_t sbdf;
+    unsigned long data = r;
+    unsigned int size = 1U << info->dabt.size;
+
+    sbdf.sbdf = MMCFG_BDF(info->gpa);
+    reg = REGISTER_OFFSET(info->gpa);
+
+    if ( !vpci_mmio_access_allowed(reg, size) )
+        return 0;
+
+    vpci_write(sbdf, reg, min(4u, size), data);
+    if ( size == 8 )
+        vpci_write(sbdf, reg + 4, 4, data >> 32);
+
+    return 1;
+}
+
+static const struct mmio_handler_ops vpci_mmio_handler = {
+    .read  = vpci_mmio_read,
+    .write = vpci_mmio_write,
+};
+
+int domain_vpci_init(struct domain *d)
+{
+    if ( !has_vpci(d) )
+        return 0;
+
+    register_mmio_handler(d, &vpci_mmio_handler,
+                          GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
+
+    return 0;
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
+
diff --git a/xen/arch/arm/vpci.h b/xen/arch/arm/vpci.h
new file mode 100644
index 0000000000..d8a7b0e3e8
--- /dev/null
+++ b/xen/arch/arm/vpci.h
@@ -0,0 +1,36 @@
+/*
+ * xen/arch/arm/vpci.h
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __ARCH_ARM_VPCI_H__
+#define __ARCH_ARM_VPCI_H__
+
+#ifdef CONFIG_HAS_VPCI
+int domain_vpci_init(struct domain *d);
+#else
+static inline int domain_vpci_init(struct domain *d)
+{
+    return 0;
+}
+#endif
+
+#endif /* __ARCH_ARM_VPCI_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index e1b735d9e8..b36d5a4811 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -766,6 +766,23 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     else
         iommu_enable_device(pdev);
 
+#ifdef CONFIG_ARM
+    /*
+     * On ARM PCI devices discovery will be done by Dom0. Add vpci handler when
+     * Dom0 inform XEN to add the PCI devices in XEN.
+     */
+    ret = vpci_add_handlers(pdev);
+    if ( ret )
+    {
+        printk(XENLOG_ERR "setup of vPCI failed: %d\n", ret);
+        ret = iommu_remove_device(pdev);
+        if ( pdev->domain )
+            list_del(&pdev->domain_list);
+        free_pdev(pseg, pdev);
+        goto out;
+    }
+#endif
+
     pci_enable_acs(pdev);
 
 out:
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index c9277b5c6d..91d614b37e 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -2,6 +2,7 @@
 #define __ASM_DOMAIN_H__
 
 #include <xen/cache.h>
+#include <xen/nospec.h>
 #include <xen/timer.h>
 #include <asm/page.h>
 #include <asm/p2m.h>
@@ -262,7 +263,11 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
 
 #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
 
-#define has_vpci(d)    ({ (void)(d); false; })
+/*
+ * For X86 VPCI is enabled and tested for PVH DOM0 only but
+ * for ARM we enable support VPCI for guest domain also.
+ */
+#define has_vpci(d) evaluate_nospec((d)->options & XEN_DOMCTL_CDF_vpci)
 
 #endif /* __ASM_DOMAIN_H__ */
 
diff --git a/xen/include/asm-x86/pci.h b/xen/include/asm-x86/pci.h
index e076951032..c4a4fdcbc2 100644
--- a/xen/include/asm-x86/pci.h
+++ b/xen/include/asm-x86/pci.h
@@ -6,8 +6,6 @@
 #define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000) >> 16)
 #define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000))
 
-#define MMCFG_BDF(addr)  ( ((addr) & 0x0ffff000) >> 12)
-
 #define IS_SNB_GFX(id) (id == 0x01068086 || id == 0x01168086 \
                         || id == 0x01268086 || id == 0x01028086 \
                         || id == 0x01128086 || id == 0x01228086 \
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index d46c61fca9..44be337dec 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -418,6 +418,13 @@ typedef uint64_t xen_callback_t;
 #define GUEST_GICV3_GICR0_BASE     xen_mk_ullong(0x03020000) /* vCPU0..127 */
 #define GUEST_GICV3_GICR0_SIZE     xen_mk_ullong(0x01000000)
 
+/*
+ * 256 MB is reserved for VPCI configuration space based on calculation
+ * 256 buses × 32 devices × 8 functions × 4 KB = 256 MB
+ */
+#define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
+#define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
+
 /* ACPI tables physical address */
 #define GUEST_ACPI_BASE xen_mk_ullong(0x20000000)
 #define GUEST_ACPI_SIZE xen_mk_ullong(0x02000000)
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 70ac25345c..43b8a08170 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -40,6 +40,8 @@
 #define PCI_SBDF3(s,b,df) \
     ((pci_sbdf_t){ .sbdf = (((s) & 0xffff) << 16) | PCI_BDF2(b, df) })
 
+#define MMCFG_BDF(addr)  (((addr) & 0x0ffff000) >> 12)
+
 typedef union {
     uint32_t sbdf;
     struct {
-- 
2.25.1


