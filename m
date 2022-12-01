Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D828F63F4C2
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:06:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450937.708475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m4m-0003GB-HX; Thu, 01 Dec 2022 16:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450937.708475; Thu, 01 Dec 2022 16:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m4m-0003Du-Er; Thu, 01 Dec 2022 16:06:16 +0000
Received: by outflank-mailman (input) for mailman id 450937;
 Thu, 01 Dec 2022 16:06:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0m4k-0001UO-80
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:06:14 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 13b66383-7192-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 17:06:13 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A3EDED1;
 Thu,  1 Dec 2022 08:06:19 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37B9B3F73B;
 Thu,  1 Dec 2022 08:06:11 -0800 (PST)
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
X-Inumbo-ID: 13b66383-7192-11ed-91b6-6bf2151ebd3b
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 04/21] xen/arm: vIOMMU: add generic vIOMMU framework
Date: Thu,  1 Dec 2022 16:02:28 +0000
Message-Id: <505b4566579b65afa0696c3a8772416a4c7cf59f.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds basic framework for vIOMMU.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/domain.c                | 17 +++++++
 xen/arch/arm/domain_build.c          |  3 ++
 xen/arch/arm/include/asm/viommu.h    | 70 ++++++++++++++++++++++++++++
 xen/drivers/passthrough/Kconfig      |  6 +++
 xen/drivers/passthrough/arm/Makefile |  1 +
 xen/drivers/passthrough/arm/viommu.c | 48 +++++++++++++++++++
 xen/include/public/arch-arm.h        |  4 ++
 7 files changed, 149 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/viommu.h
 create mode 100644 xen/drivers/passthrough/arm/viommu.c

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 38e22f12af..2a85209736 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -37,6 +37,7 @@
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
+#include <asm/viommu.h>
 #include <asm/vtimer.h>
 
 #include "vpci.h"
@@ -691,6 +692,13 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
+    {
+        dprintk(XENLOG_INFO,
+                "vIOMMU type requested not supported by the platform or Xen\n");
+        return -EINVAL;
+    }
+
     return 0;
 }
 
@@ -783,6 +791,9 @@ int arch_domain_create(struct domain *d,
     if ( (rc = domain_vpci_init(d)) != 0 )
         goto fail;
 
+    if ( (rc = domain_viommu_init(d, config->arch.viommu_type)) != 0 )
+        goto fail;
+
     return 0;
 
 fail:
@@ -998,6 +1009,7 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
 enum {
     PROG_pci = 1,
     PROG_tee,
+    PROG_viommu,
     PROG_xen,
     PROG_page,
     PROG_mapping,
@@ -1048,6 +1060,11 @@ int domain_relinquish_resources(struct domain *d)
         if (ret )
             return ret;
 
+    PROGRESS(viommu):
+        ret = viommu_relinquish_resources(d);
+        if (ret )
+            return ret;
+
     PROGRESS(xen):
         ret = relinquish_memory(d, &d->xenpage_list);
         if ( ret )
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index bd30d3798c..abbaf37a2e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -27,6 +27,7 @@
 #include <asm/setup.h>
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
+#include <asm/viommu.h>
 #include <xen/event.h>
 
 #include <xen/irq.h>
@@ -3858,6 +3859,7 @@ void __init create_domUs(void)
         struct domain *d;
         struct xen_domctl_createdomain d_cfg = {
             .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
+            .arch.viommu_type = viommu_get_type(),
             .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
             /*
              * The default of 1023 should be sufficient for guests because
@@ -4052,6 +4054,7 @@ void __init create_dom0(void)
         printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
     dom0_cfg.arch.tee_type = tee_get_type();
     dom0_cfg.max_vcpus = dom0_max_vcpus();
+    dom0_cfg.arch.viommu_type = viommu_get_type();
 
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
new file mode 100644
index 0000000000..7cd3818a12
--- /dev/null
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+#ifndef __ARCH_ARM_VIOMMU_H__
+#define __ARCH_ARM_VIOMMU_H__
+
+#ifdef CONFIG_VIRTUAL_IOMMU
+
+#include <xen/lib.h>
+#include <xen/types.h>
+#include <public/xen.h>
+
+struct viommu_ops {
+    /*
+     * Called during domain construction if toolstack requests to enable
+     * vIOMMU support.
+     */
+    int (*domain_init)(struct domain *d);
+
+    /*
+     * Called during domain destruction to free resources used by vIOMMU.
+     */
+    int (*relinquish_resources)(struct domain *d);
+};
+
+struct viommu_desc {
+    /* vIOMMU domains init/free operations described above. */
+    const struct viommu_ops *ops;
+
+    /*
+     * ID of vIOMMU. Corresponds to xen_arch_domainconfig.viommu_type.
+     * Should be one of XEN_DOMCTL_CONFIG_VIOMMU_xxx
+     */
+    uint16_t viommu_type;
+};
+
+int domain_viommu_init(struct domain *d, uint16_t viommu_type);
+int viommu_relinquish_resources(struct domain *d);
+uint16_t viommu_get_type(void);
+
+#else
+
+static inline uint8_t viommu_get_type(void)
+{
+    return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
+}
+
+static inline int domain_viommu_init(struct domain *d, uint16_t viommu_type)
+{
+    if ( likely(viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE) )
+        return 0;
+
+    return -ENODEV;
+}
+
+static inline int viommu_relinquish_resources(struct domain *d)
+{
+    return 0;
+}
+
+#endif /* CONFIG_VIRTUAL_IOMMU */
+
+#endif /* __ARCH_ARM_VIOMMU_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index 479d7de57a..19924fa2de 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -35,6 +35,12 @@ config IPMMU_VMSA
 	  (H3 ES3.0, M3-W+, etc) or Gen4 SoCs which IPMMU hardware supports stage 2
 	  translation table format and is able to use CPU's P2M table as is.
 
+config VIRTUAL_IOMMU
+	bool "Virtual IOMMU Support (UNSUPPORTED)" if UNSUPPORTED
+	default n
+	help
+	 Support virtual IOMMU infrastructure to implement vIOMMU.
+
 endif
 
 config IOMMU_FORCE_PT_SHARE
diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough/arm/Makefile
index c5fb3b58a5..4cc54f3f4d 100644
--- a/xen/drivers/passthrough/arm/Makefile
+++ b/xen/drivers/passthrough/arm/Makefile
@@ -2,3 +2,4 @@ obj-y += iommu.o iommu_helpers.o iommu_fwspec.o
 obj-$(CONFIG_ARM_SMMU) += smmu.o
 obj-$(CONFIG_IPMMU_VMSA) += ipmmu-vmsa.o
 obj-$(CONFIG_ARM_SMMU_V3) += smmu-v3.o
+obj-$(CONFIG_VIRTUAL_IOMMU) += viommu.o
diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
new file mode 100644
index 0000000000..7ab6061e34
--- /dev/null
+++ b/xen/drivers/passthrough/arm/viommu.c
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/types.h>
+
+#include <asm/viommu.h>
+
+const struct viommu_desc __read_mostly *cur_viommu;
+
+int domain_viommu_init(struct domain *d, uint16_t viommu_type)
+{
+    if ( viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE )
+        return 0;
+
+    if ( !cur_viommu )
+        return -ENODEV;
+
+    if ( cur_viommu->viommu_type != viommu_type )
+        return -EINVAL;
+
+    return cur_viommu->ops->domain_init(d);
+}
+
+int viommu_relinquish_resources(struct domain *d)
+{
+    if ( !cur_viommu )
+        return 0;
+
+    return cur_viommu->ops->relinquish_resources(d);
+}
+
+uint16_t viommu_get_type(void)
+{
+    if ( !cur_viommu )
+        return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
+
+    return cur_viommu->viommu_type;
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
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 1528ced509..33d32835e7 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -297,10 +297,14 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_NONE      0
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
 
+#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
+
 struct xen_arch_domainconfig {
     /* IN/OUT */
     uint8_t gic_version;
     /* IN */
+    uint8_t viommu_type;
+    /* IN */
     uint16_t tee_type;
     /* IN */
     uint32_t nr_spis;
-- 
2.25.1


