Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5853F18C8
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:08:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168670.307953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgqU-0000MU-EZ; Thu, 19 Aug 2021 12:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168670.307953; Thu, 19 Aug 2021 12:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgqU-0000Hc-7h; Thu, 19 Aug 2021 12:08:30 +0000
Received: by outflank-mailman (input) for mailman id 168670;
 Thu, 19 Aug 2021 12:08:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HKsV=NK=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mGgqS-0000Gt-Ob
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:08:28 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 292733d4-00e6-11ec-a5f6-12813bfff9fa;
 Thu, 19 Aug 2021 12:08:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F8C631B;
 Thu, 19 Aug 2021 05:08:27 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18D1B3F70D;
 Thu, 19 Aug 2021 05:08:25 -0700 (PDT)
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
X-Inumbo-ID: 292733d4-00e6-11ec-a5f6-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 11/14] xen/arm: Enable the existing x86 virtual PCI support for ARM.
Date: Thu, 19 Aug 2021 13:02:51 +0100
Message-Id: <370f4f87c148eaee5ac5ec69346828e6473f0f2d.1629366665.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
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

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/Makefile         |  1 +
 xen/arch/arm/domain.c         |  4 ++
 xen/arch/arm/vpci.c           | 96 +++++++++++++++++++++++++++++++++++
 xen/arch/arm/vpci.h           | 37 ++++++++++++++
 xen/drivers/passthrough/pci.c |  7 +++
 xen/drivers/vpci/Makefile     |  3 +-
 xen/drivers/vpci/header.c     |  2 +
 xen/include/asm-arm/domain.h  |  5 +-
 xen/include/asm-arm/pci.h     |  8 +++
 xen/include/public/arch-arm.h |  4 ++
 10 files changed, 165 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/arm/vpci.c
 create mode 100644 xen/arch/arm/vpci.h

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 0e14a5e5c8..7cdce684a4 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -7,6 +7,7 @@ obj-y += platforms/
 endif
 obj-$(CONFIG_TEE) += tee/
 obj-$(CONFIG_HAS_PCI) += pci/
+obj-$(CONFIG_HAS_VPCI) += vpci.o
 
 obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
 obj-y += bootfdt.init.o
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 19c756ac3d..d99c653626 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -40,6 +40,7 @@
 #include <asm/vtimer.h>
 
 #include "vuart.h"
+#include "vpci.h"
 
 DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
 
@@ -767,6 +768,9 @@ int arch_domain_create(struct domain *d,
     if ( is_hardware_domain(d) && (rc = domain_vuart_init(d)) )
         goto fail;
 
+    if ( (rc = domain_vpci_init(d)) != 0 )
+        goto fail;
+
     return 0;
 
 fail:
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
new file mode 100644
index 0000000000..da8b1ca13c
--- /dev/null
+++ b/xen/arch/arm/vpci.c
@@ -0,0 +1,96 @@
+/*
+ * xen/arch/arm/vpci.c
+ * Copyright (c) 2021 Arm Ltd.
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
+#include <asm/mmio.h>
+
+/* Do some sanity checks. */
+static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int len)
+{
+    /* Check access size. */
+    if ( len != 1 && len != 2 && len != 4 && len != 8 )
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
+    uint32_t data = 0;
+    unsigned int size = 1U << info->dabt.size;
+
+    sbdf.sbdf = (((info->gpa) & 0x0ffff000) >> 12);
+    reg = (((info->gpa) & 0x00000ffc) | (info->gpa & 3));
+
+    if ( !vpci_mmio_access_allowed(reg, size) )
+        return 1;
+
+    data = vpci_read(sbdf, reg, size);
+
+    memcpy(r, &data, size);
+
+    return 1;
+}
+
+static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
+                           register_t r, void *p)
+{
+    unsigned int reg;
+    pci_sbdf_t sbdf;
+    uint32_t data = r;
+    unsigned int size = 1U << info->dabt.size;
+
+    sbdf.sbdf = (((info->gpa) & 0x0ffff000) >> 12);
+    reg = (((info->gpa) & 0x00000ffc) | (info->gpa & 3));
+
+    if ( !vpci_mmio_access_allowed(reg, size) )
+        return 1;
+
+    vpci_write(sbdf, reg, size, data);
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
index 0000000000..8a093bb705
--- /dev/null
+++ b/xen/arch/arm/vpci.h
@@ -0,0 +1,37 @@
+/*
+ * xen/arch/arm/vpci.h
+ * Copyright (c) 2021 Arm Ltd.
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
index c23c8cb06b..56e261e9bd 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -767,6 +767,13 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     else
         iommu_enable_device(pdev);
 
+#ifdef CONFIG_ARM
+    ret = vpci_add_handlers(pdev);
+    if ( ret ) {
+        printk(XENLOG_ERR "setup of vPCI for failed: %d\n",ret);
+        goto out;
+    }
+#endif
     pci_enable_acs(pdev);
 
 out:
diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
index 55d1bdfda0..1a1413b93e 100644
--- a/xen/drivers/vpci/Makefile
+++ b/xen/drivers/vpci/Makefile
@@ -1 +1,2 @@
-obj-y += vpci.o header.o msi.o msix.o
+obj-y += vpci.o header.o
+obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ba9a036202..f8cd55e7c0 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -96,8 +96,10 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
      * FIXME: punching holes after the p2m has been set up might be racy for
      * DomU usage, needs to be revisited.
      */
+#ifdef CONFIG_HAS_PCI_MSI
     if ( map && !rom_only && vpci_make_msix_hole(pdev) )
         return;
+#endif
 
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index c9277b5c6d..d742b94bd6 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -262,7 +262,10 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
 
 #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
 
-#define has_vpci(d)    ({ (void)(d); false; })
+/* For X86 VPCI is enabled and tested for PVH DOM0 only but
+ * for ARM we enable support VPCI for guest domain also.
+ */
+#define has_vpci(d) ({ (void)(d); IS_ENABLED(CONFIG_HAS_VPCI); })
 
 #endif /* __ASM_DOMAIN_H__ */
 
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 756f8637ab..c58152de80 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -27,6 +27,14 @@ struct arch_pci_dev {
     struct device dev;
 };
 
+/* Arch-specific MSI data for vPCI. */
+struct vpci_arch_msi {
+};
+
+/* Arch-specific MSI-X entry data for vPCI. */
+struct vpci_arch_msix_entry {
+};
+
 /*
  * struct to hold the mappings of a config space window. This
  * is expected to be used as sysdata for PCI controllers that
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 64a2ca30da..0a9749e768 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -422,6 +422,10 @@ typedef uint64_t xen_callback_t;
 #define GUEST_PL011_BASE    xen_mk_ullong(0x22000000)
 #define GUEST_PL011_SIZE    xen_mk_ullong(0x00001000)
 
+/* VPCI ECAM mappings */
+#define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
+#define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
+
 /*
  * 16MB == 4096 pages reserved for guest to use as a region to map its
  * grant table in.
-- 
2.17.1


