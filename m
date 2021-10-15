Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7682C42F498
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 15:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210639.367601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbNkR-0002OE-Sg; Fri, 15 Oct 2021 13:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210639.367601; Fri, 15 Oct 2021 13:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbNkR-0002M7-Mm; Fri, 15 Oct 2021 13:59:47 +0000
Received: by outflank-mailman (input) for mailman id 210639;
 Fri, 15 Oct 2021 13:59:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mbNkQ-00020z-76
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 13:59:46 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 12d6442e-a78f-46ee-800c-93c651db31c7;
 Fri, 15 Oct 2021 13:59:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 119C614BF;
 Fri, 15 Oct 2021 06:59:42 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 653133F694;
 Fri, 15 Oct 2021 06:59:40 -0700 (PDT)
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
X-Inumbo-ID: 12d6442e-a78f-46ee-800c-93c651db31c7
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Rahul Singh <rahul.singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 2/5] xen/arm: Enable the existing x86 virtual PCI support for ARM
Date: Fri, 15 Oct 2021 14:59:19 +0100
Message-Id: <847d430fdeb19e695176ddea71eeb11dcef8b23e.1634305870.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634305870.git.bertrand.marquis@arm.com>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rahul Singh <rahul.singh@arm.com>

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

This patch is also doing some small fixes to fix compilation errors on
arm32 of vpci and prevent 64bit accesses on 32bit:
- use %zu instead of lu in header.c for print
- prevent 64bit accesses in vpci_access_allowed
- ifdef out using CONFIG_64BIT handling of len 8 in
vpci_ecam_{read/write}

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v7:
- adapt to changes in vpci generic functions (name and type)
- remove call to pci_cleanup_msi on error exit
- move pci_add_handlers to be only done when pdev->domain is not NULL
- Remove cast to unsigned long in header.c and use %zu for print
- Fix non ascii chars in arch-arm.h
- Use CONFIG_64BIT inside vpci_access_allowed to prevent 64bit access on
32bit platforms
- Use CONFIG_64BIT to compile out 64bit cases in vpci_ecam_{read/write}
Changes in v6:
- Use new vpci_ecam_ helpers for PCI access
- Do not set XEN_DOMCTL_CDF_vpci for dom0 for now (will be done in a
future patch once everything is ready)
- rename REGISTER_OFFSET to ECAM_REG_OFFSET and move it to pci.h
- remove not needed local variables in vpci_mmio_write, the one in read
has been kept to ensure proper compilation on arm32
- move call to vpci_add_handlers before iommu init to simplify exit path
- move call to pci_cleanup_msi in the out section of pci_add_device if
pdev is not NULL and on error
- initialize pdev to NULL to handle properly exit path call of
pci_cleanup_msi
- keep has_vpci to return false for now as CFG_vpci has been removed.
Added a comment on top of the definition.
- fix compilation errors on arm32 (print in header.c, cast missing in
mmio_write.
- local variable was kept in vpci_mmio_read on arm to prevent a cast
error in arm32.
Change in v5:
- Add pci_cleanup_msi(pdev) incleanup part.
- Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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
 xen/arch/arm/Makefile         |  1 +
 xen/arch/arm/domain.c         |  4 ++
 xen/arch/arm/vpci.c           | 77 +++++++++++++++++++++++++++++++++++
 xen/arch/arm/vpci.h           | 36 ++++++++++++++++
 xen/drivers/passthrough/pci.c | 14 +++++++
 xen/drivers/vpci/header.c     |  2 +-
 xen/drivers/vpci/vpci.c       | 10 +++++
 xen/include/asm-arm/domain.h  |  1 +
 xen/include/public/arch-arm.h |  7 ++++
 xen/include/xen/pci.h         |  2 +
 10 files changed, 153 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/vpci.c
 create mode 100644 xen/arch/arm/vpci.h

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 64518848b2..07f634508e 100644
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
index eef0661beb..96e1b23550 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -39,6 +39,7 @@
 #include <asm/vgic.h>
 #include <asm/vtimer.h>
 
+#include "vpci.h"
 #include "vuart.h"
 
 DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
@@ -773,6 +774,9 @@ int arch_domain_create(struct domain *d,
     if ( is_hardware_domain(d) && (rc = domain_vuart_init(d)) )
         goto fail;
 
+    if ( (rc = domain_vpci_init(d)) != 0 )
+        goto fail;
+
     return 0;
 
 fail:
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
new file mode 100644
index 0000000000..a312d02f3d
--- /dev/null
+++ b/xen/arch/arm/vpci.c
@@ -0,0 +1,77 @@
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
+#include <xen/vpci.h>
+
+#include <asm/mmio.h>
+
+static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
+                          register_t *r, void *p)
+{
+    pci_sbdf_t sbdf;
+    /* data is needed to prevent a pointer cast on 32bit */
+    unsigned long data;
+
+    /* We ignore segment part and always handle segment 0 */
+    sbdf.sbdf = VCPI_ECAM_BDF(info->gpa);
+
+    if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
+                        1U << info->dabt.size, &data) )
+    {
+        *r = data;
+        return 1;
+    }
+
+    *r = ~0ul;
+
+    return 0;
+}
+
+static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
+                           register_t r, void *p)
+{
+    pci_sbdf_t sbdf;
+
+    /* We ignore segment part and always handle segment 0 */
+    sbdf.sbdf = VCPI_ECAM_BDF(info->gpa);
+
+    return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
+                           1U << info->dabt.size, r);
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
index 3aa8c3175f..082892c8a2 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -766,7 +766,21 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         list_add(&pdev->domain_list, &hardware_domain->pdev_list);
     }
     else
+    {
+#ifdef CONFIG_ARM
+        /*
+         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
+         * when Dom0 inform XEN to add the PCI devices in XEN.
+         */
+        ret = vpci_add_handlers(pdev);
+        if ( ret )
+        {
+            printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
+            goto out;
+        }
+#endif
         iommu_enable_device(pdev);
+    }
 
     pci_enable_acs(pdev);
 
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index f8cd55e7c0..40ff79c33f 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -373,7 +373,7 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
         /* If the value written is the current one avoid printing a warning. */
         if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
             gprintk(XENLOG_WARNING,
-                    "%pp: ignored BAR %lu write with memory decoding enabled\n",
+                    "%pp: ignored BAR %zu write with memory decoding enabled\n",
                     &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
         return;
     }
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index ef690f15a9..decf7d87a1 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -485,6 +485,12 @@ bool vpci_access_allowed(unsigned int reg, unsigned int len)
     if ( len != 1 && len != 2 && len != 4 && len != 8 )
         return false;
 
+#ifndef CONFIG_64BIT
+    /* Prevent 64bit accesses on 32bit */
+    if ( len == 8 )
+        return false;
+#endif
+
     /* Check that access is size aligned. */
     if ( (reg & (len - 1)) )
         return false;
@@ -500,8 +506,10 @@ bool vpci_ecam_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
         return false;
 
     vpci_write(sbdf, reg, min(4u, len), data);
+#ifdef CONFIG_64BIT
     if ( len == 8 )
         vpci_write(sbdf, reg + 4, 4, data >> 32);
+#endif
 
     return true;
 }
@@ -526,8 +534,10 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
      *  4byte accesses.
      */
     *data = vpci_read(sbdf, reg, min(4u, len));
+#ifdef CONFIG_64BIT
     if ( len == 8 )
         *data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
+#endif
 
     return true;
 }
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 14e575288f..9b3647587a 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -263,6 +263,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
 
 #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
 
+/* vPCI is not available on Arm */
 #define has_vpci(d)    ({ (void)(d); false; })
 
 #endif /* __ASM_DOMAIN_H__ */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 96ead3de07..b4c615bcdf 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -418,6 +418,13 @@ typedef uint64_t xen_callback_t;
 #define GUEST_GICV3_GICR0_BASE     xen_mk_ullong(0x03020000) /* vCPU0..127 */
 #define GUEST_GICV3_GICR0_SIZE     xen_mk_ullong(0x01000000)
 
+/*
+ * 256 MB is reserved for VPCI configuration space based on calculation
+ * 256 buses x 32 devices x 8 functions x 4 KB = 256 MB
+ */
+#define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
+#define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
+
 /* ACPI tables physical address */
 #define GUEST_ACPI_BASE xen_mk_ullong(0x20000000)
 #define GUEST_ACPI_SIZE xen_mk_ullong(0x02000000)
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 70ac25345c..b6d7e454f8 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -40,6 +40,8 @@
 #define PCI_SBDF3(s,b,df) \
     ((pci_sbdf_t){ .sbdf = (((s) & 0xffff) << 16) | PCI_BDF2(b, df) })
 
+#define ECAM_REG_OFFSET(addr)  ((addr) & 0x00000fff)
+
 typedef union {
     uint32_t sbdf;
     struct {
-- 
2.25.1


