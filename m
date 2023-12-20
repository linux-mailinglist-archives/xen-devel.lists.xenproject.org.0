Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DFA81A0C4
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 15:09:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657922.1027095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFn-0007RI-BH; Wed, 20 Dec 2023 14:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657922.1027095; Wed, 20 Dec 2023 14:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFn-0007NF-6Y; Wed, 20 Dec 2023 14:08:55 +0000
Received: by outflank-mailman (input) for mailman id 657922;
 Wed, 20 Dec 2023 14:08:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RD2L=H7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFxFl-0004kf-It
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 14:08:53 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d5a4a11-9f41-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 15:08:51 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cc88818ff0so7978951fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 06:08:51 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05651c089300b002cc83c337absm593892ljq.70.2023.12.20.06.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 06:08:50 -0800 (PST)
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
X-Inumbo-ID: 4d5a4a11-9f41-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703081330; x=1703686130; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5hZac8T3jtrrOdrwYepDlnvnIB7as+Cequ/jYw4TJQ=;
        b=HDl0koUi7HoSeFsD3CCpXaoqQYBXvCWW2zEHXg0eywG+N+NcbC4IfDWsUHtjKegHk8
         t8wn5HlsvjYR2sKWR6+6WrynrUVGf52Ew+J/gdr5D208c50xIiS8HXrPDWBev/LC9aYy
         d1KzR2TbhOH0ZQ8sWulbQuKe+kcFHXxwlHV1vNJSlyKzTjFdvCSfyEdhEqAIKGPq1hKO
         Cdx2JA9I5V+RFvOluwvbteXnW8E7btpmNSbcG4iNBAUyHGDggS09t2k84S8USm5K+Aqx
         XZelxpCqz10uLxXqQy4deEucjqdJt10rC3aIQ82n3oTePHaTtDyVmXgmR/lkxcnVDrEs
         VB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703081330; x=1703686130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5hZac8T3jtrrOdrwYepDlnvnIB7as+Cequ/jYw4TJQ=;
        b=J4mmvJE+7PcEZSXXRGBwEigA4iTbOradsNCq1YOPoe/pwVPmVwl7Kmh9Wzq7cWTdIK
         Z/OyT7JBa9Q+Rd0Yjwz9ncHfrvy24f8WslBLO5iL3fEuRPq5+7Y89L8W1QsTiCcFI6sZ
         1XRMD7Pi+ztllWH8/oe8v8g2kFjN8knoAyzsnYgIbs9A0fX6eziWhHNmqI9hNHXvwg23
         ZNhgAkcyeP5k2/tSs7LiKWt4TyDtMWqUbueoL3zNrCRLdqhuMBicorcK1uQO2pl2Ekqt
         Cn0yZYenLW+EZag7MYIVvJGBj3jMsFN2QkgkLjUNUjwzm/UaAlOCpZKuyWxJdy/XJM50
         t/Wg==
X-Gm-Message-State: AOJu0YzcP7zKAhP78klfCtA87eIamjQ1Og/rb6UQvO9s1rc3pxfphuym
	2bhgspdnqaiJdYT7wzGisFFsR5IaSItXJQ==
X-Google-Smtp-Source: AGHT+IHeZWoaNplXjFJwqDGfAWMCs59YzB4vAzO6nirkM+j526FuX3lgGxa0m7RVeqSvthqMkW0r6Q==
X-Received: by 2002:a05:651c:201d:b0:2cc:9320:bccb with SMTP id s29-20020a05651c201d00b002cc9320bccbmr505992ljo.2.1703081330318;
        Wed, 20 Dec 2023 06:08:50 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v6 9/9] xen/asm-generic: introduce generic device.h
Date: Wed, 20 Dec 2023 16:08:31 +0200
Message-ID: <55d6810e2f8b0f54261c504354bf879c5b887c40.1703072575.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703072575.git.oleksii.kurochko@gmail.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Arm, PPC and RISC-V use the same device.h thereby device.h
was moved to asm-generic. Arm's device.h was taken as a base with
the following changes:
 - #ifdef PCI related things.
 - #ifdef ACPI related things.
 - Rename #ifdef guards.
 - Add SPDX tag.
 - #ifdef CONFIG_HAS_DEVICE_TREE related things.
 - #ifdef-ing iommu related things with CONFIG_HAS_PASSTHROUGH.

Also Arm and PPC are switched to asm-generic version of device.h

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---

     Jan wrote the following:
       Overall I think there are too many changes done all in one go here.
       But it's mostly Arm which is affected, so I'll leave judging about that
       to the Arm maintainers.
     
     Arm maintainers, will it be fine for you to not split the patch?
---
Changes in V6:
 - Rebase only.
---
Changes in V5:
  - Removed generated file: xen/include/headers++.chk.new
  - Removed pointless #ifdef CONFIG_HAS_DEVICE_TREE ... #endif for PPC as
    CONFIG_HAS_DEVICE_TREE will be always used for PPC.
---
Changes in V4:
 - Updated the commit message
 - Switched Arm and PPC to asm-generic version of device.h
 - Replaced HAS_PCI with CONFIG_HAS_PCI
 - ifdef-ing iommu filed of dev_archdata struct with CONFIG_HAS_PASSTHROUGH
 - ifdef-ing iommu_fwspec of device struct with CONFIG_HAS_PASSTHROUGH
 - ifdef-ing DT related things with CONFIG_HAS_DEVICE_TREE
 - Updated the commit message ( remove a note with question about
   if device.h should be in asm-generic or not )
 - Replaced DEVICE_IC with DEVICE_INTERRUPT_CONTROLLER
 - Rationalized usage of CONFIG_HAS_* in device.h
 - Fixed indents for ACPI_DEVICE_START and ACPI_DEVICE_END
---
Changes in V3:
 - ifdef device tree related things.
 - update the commit message
---
Changes in V2:
	- take ( as common ) device.h from Arm as PPC and RISC-V use it as a base.
	- #ifdef PCI related things.
	- #ifdef ACPI related things.
	- rename DEVICE_GIC to DEVIC_IC.
	- rename #ifdef guards.
	- switch Arm and PPC to generic device.h
	- add SPDX tag
	- update the commit message

---
 xen/arch/arm/device.c                         |  15 ++-
 xen/arch/arm/domain_build.c                   |   2 +-
 xen/arch/arm/gic-v2.c                         |   4 +-
 xen/arch/arm/gic-v3.c                         |   6 +-
 xen/arch/arm/gic.c                            |   4 +-
 xen/arch/arm/include/asm/Makefile             |   1 +
 xen/arch/ppc/include/asm/Makefile             |   1 +
 xen/arch/ppc/include/asm/device.h             |  53 --------
 .../asm => include/asm-generic}/device.h      | 125 +++++++++++-------
 9 files changed, 102 insertions(+), 109 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/device.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/device.h (79%)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 1f631d3274..affbe79f9a 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -16,7 +16,10 @@
 #include <xen/lib.h>
 
 extern const struct device_desc _sdevice[], _edevice[];
+
+#ifdef CONFIG_ACPI
 extern const struct acpi_device_desc _asdevice[], _aedevice[];
+#endif
 
 int __init device_init(struct dt_device_node *dev, enum device_class class,
                        const void *data)
@@ -45,6 +48,7 @@ int __init device_init(struct dt_device_node *dev, enum device_class class,
     return -EBADF;
 }
 
+#ifdef CONFIG_ACPI
 int __init acpi_device_init(enum device_class class, const void *data, int class_type)
 {
     const struct acpi_device_desc *desc;
@@ -61,6 +65,7 @@ int __init acpi_device_init(enum device_class class, const void *data, int class
 
     return -EBADF;
 }
+#endif
 
 enum device_class device_get_class(const struct dt_device_node *dev)
 {
@@ -329,9 +334,13 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
     struct map_range_data mr_data = {
         .d = d,
         .p2mt = p2mt,
-        .skip_mapping = !own_device ||
-                        (is_pci_passthrough_enabled() &&
-                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),
+        .skip_mapping =
+                        !own_device
+#ifdef CONFIG_HAS_PCI
+                        || (is_pci_passthrough_enabled() &&
+                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE))
+#endif
+                        ,
         .iomem_ranges = iomem_ranges,
         .irq_ranges = irq_ranges
     };
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 46161848dc..085d88671e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1651,7 +1651,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
      * Replace these nodes with our own. Note that the original may be
      * used_by DOMID_XEN so this check comes first.
      */
-    if ( device_get_class(node) == DEVICE_GIC )
+    if ( device_get_class(node) == DEVICE_INTERRUPT_CONTROLLER )
         return make_gic_node(d, kinfo->fdt, node);
     if ( dt_match_node(timer_matches, node) )
         return make_timer_node(kinfo);
diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index cf392bfd1c..5d6885e389 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1366,7 +1366,7 @@ static const struct dt_device_match gicv2_dt_match[] __initconst =
     { /* sentinel */ },
 };
 
-DT_DEVICE_START(gicv2, "GICv2", DEVICE_GIC)
+DT_DEVICE_START(gicv2, "GICv2", DEVICE_INTERRUPT_CONTROLLER)
         .dt_match = gicv2_dt_match,
         .init = gicv2_dt_preinit,
 DT_DEVICE_END
@@ -1381,7 +1381,7 @@ static int __init gicv2_acpi_preinit(const void *data)
     return 0;
 }
 
-ACPI_DEVICE_START(agicv2, "GICv2", DEVICE_GIC)
+ACPI_DEVICE_START(agicv2, "GICv2", DEVICE_INTERRUPT_CONTROLLER)
         .class_type = ACPI_MADT_GIC_VERSION_V2,
         .init = gicv2_acpi_preinit,
 ACPI_DEVICE_END
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 18289cd645..9e135aeb3d 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1879,7 +1879,7 @@ static const struct dt_device_match gicv3_dt_match[] __initconst =
     { /* sentinel */ },
 };
 
-DT_DEVICE_START(gicv3, "GICv3", DEVICE_GIC)
+DT_DEVICE_START(gicv3, "GICv3", DEVICE_INTERRUPT_CONTROLLER)
         .dt_match = gicv3_dt_match,
         .init = gicv3_dt_preinit,
 DT_DEVICE_END
@@ -1894,12 +1894,12 @@ static int __init gicv3_acpi_preinit(const void *data)
     return 0;
 }
 
-ACPI_DEVICE_START(agicv3, "GICv3", DEVICE_GIC)
+ACPI_DEVICE_START(agicv3, "GICv3", DEVICE_INTERRUPT_CONTROLLER)
         .class_type = ACPI_MADT_GIC_VERSION_V3,
         .init = gicv3_acpi_preinit,
 ACPI_DEVICE_END
 
-ACPI_DEVICE_START(agicv4, "GICv4", DEVICE_GIC)
+ACPI_DEVICE_START(agicv4, "GICv4", DEVICE_INTERRUPT_CONTROLLER)
         .class_type = ACPI_MADT_GIC_VERSION_V4,
         .init = gicv3_acpi_preinit,
 ACPI_DEVICE_END
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index d922ea67aa..b5a9c8266c 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -234,7 +234,7 @@ static void __init gic_dt_preinit(void)
         if ( !dt_get_parent(node) )
             continue;
 
-        rc = device_init(node, DEVICE_GIC, NULL);
+        rc = device_init(node, DEVICE_INTERRUPT_CONTROLLER, NULL);
         if ( !rc )
         {
             /* NOTE: Only one GIC is supported */
@@ -262,7 +262,7 @@ static void __init gic_acpi_preinit(void)
 
     dist = container_of(header, struct acpi_madt_generic_distributor, header);
 
-    if ( acpi_device_init(DEVICE_GIC, NULL, dist->version) )
+    if ( acpi_device_init(DEVICE_INTERRUPT_CONTROLLER, NULL, dist->version) )
         panic("Unable to find compatible GIC in the ACPI table\n");
 }
 #else
diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index a28cc5d1b1..c3f4291ee2 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += altp2m.h
+generic-y += device.h
 generic-y += hardirq.h
 generic-y += iocap.h
 generic-y += numa.h
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index efd72862c8..adb752b804 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += altp2m.h
+generic-y += device.h
 generic-y += div64.h
 generic-y += hardirq.h
 generic-y += hypercall.h
diff --git a/xen/arch/ppc/include/asm/device.h b/xen/arch/ppc/include/asm/device.h
deleted file mode 100644
index 8253e61d51..0000000000
--- a/xen/arch/ppc/include/asm/device.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_DEVICE_H__
-#define __ASM_PPC_DEVICE_H__
-
-enum device_type
-{
-    DEV_DT,
-    DEV_PCI,
-};
-
-struct device {
-    enum device_type type;
-#ifdef CONFIG_HAS_DEVICE_TREE
-    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
-#endif
-};
-
-enum device_class
-{
-    DEVICE_SERIAL,
-    DEVICE_IOMMU,
-    DEVICE_PCI_HOSTBRIDGE,
-    /* Use for error */
-    DEVICE_UNKNOWN,
-};
-
-struct device_desc {
-    /* Device name */
-    const char *name;
-    /* Device class */
-    enum device_class class;
-    /* List of devices supported by this driver */
-    const struct dt_device_match *dt_match;
-    /*
-     * Device initialization.
-     *
-     * -EAGAIN is used to indicate that device probing is deferred.
-     */
-    int (*init)(struct dt_device_node *dev, const void *data);
-};
-
-typedef struct device device_t;
-
-#define DT_DEVICE_START(name_, namestr_, class_)                    \
-static const struct device_desc __dev_desc_##name_ __used           \
-__section(".dev.info") = {                                          \
-    .name = namestr_,                                               \
-    .class = class_,                                                \
-
-#define DT_DEVICE_END                                               \
-};
-
-#endif /* __ASM_PPC_DEVICE_H__ */
diff --git a/xen/arch/arm/include/asm/device.h b/xen/include/asm-generic/device.h
similarity index 79%
rename from xen/arch/arm/include/asm/device.h
rename to xen/include/asm-generic/device.h
index b5d451e087..063c448c4e 100644
--- a/xen/arch/arm/include/asm/device.h
+++ b/xen/include/asm-generic/device.h
@@ -1,14 +1,37 @@
-#ifndef __ASM_ARM_DEVICE_H
-#define __ASM_ARM_DEVICE_H
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_DEVICE_H__
+#define __ASM_GENERIC_DEVICE_H__
+
+#include <xen/stdbool.h>
 
 enum device_type
 {
+#ifdef CONFIG_HAS_DEVICE_TREE
     DEV_DT,
+#endif
+
+#ifdef CONFIG_HAS_PCI
     DEV_PCI,
+#endif
+    DEV_TYPE_MAX,
+};
+
+enum device_class
+{
+    DEVICE_SERIAL,
+    DEVICE_IOMMU,
+    DEVICE_INTERRUPT_CONTROLLER,
+#ifdef CONFIG_HAS_PCI
+    DEVICE_PCI_HOSTBRIDGE,
+#endif
+    /* Use for error */
+    DEVICE_UNKNOWN,
 };
 
 struct dev_archdata {
+#ifdef CONFIG_HAS_PASSTHROUGH
     void *iommu;    /* IOMMU private data */
+#endif
 };
 
 /* struct device - The basic device structure */
@@ -19,31 +42,65 @@ struct device
     struct dt_device_node *of_node; /* Used by drivers imported from Linux */
 #endif
     struct dev_archdata archdata;
+#ifdef CONFIG_HAS_PASSTHROUGH
     struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU instance data */
+#endif
 };
 
 typedef struct device device_t;
 
+#ifdef CONFIG_HAS_DEVICE_TREE
+
 #include <xen/device_tree.h>
 
-#define dev_is_pci(dev) ((dev)->type == DEV_PCI)
 #define dev_is_dt(dev)  ((dev)->type == DEV_DT)
 
-enum device_class
-{
-    DEVICE_SERIAL,
-    DEVICE_IOMMU,
-    DEVICE_GIC,
-    DEVICE_PCI_HOSTBRIDGE,
-    /* Use for error */
-    DEVICE_UNKNOWN,
+/**
+ *  device_init - Initialize a device
+ *  @dev: device to initialize
+ *  @class: class of the device (serial, network...)
+ *  @data: specific data for initializing the device
+ *
+ *  Return 0 on success.
+ */
+int device_init(struct dt_device_node *dev, enum device_class class,
+                const void *data);
+
+/**
+ * device_get_type - Get the type of the device
+ * @dev: device to match
+ *
+ * Return the device type on success or DEVICE_ANY on failure
+ */
+enum device_class device_get_class(const struct dt_device_node *dev);
+
+#define DT_DEVICE_START(_name, _namestr, _class)                    \
+static const struct device_desc __dev_desc_##_name __used           \
+__section(".dev.info") = {                                          \
+    .name = _namestr,                                               \
+    .class = _class,                                                \
+
+#define DT_DEVICE_END                                               \
 };
 
+#else /* !CONFIG_HAS_DEVICE_TREE */
+#define dev_is_dt(dev) ((void)(dev), false)
+#endif /* CONFIG_HAS_DEVICE_TREE */
+
+#ifdef CONFIG_HAS_PCI
+#define dev_is_pci(dev) ((dev)->type == DEV_PCI)
+#else
+#define dev_is_pci(dev) ((void)(dev), false)
+#endif
+
 struct device_desc {
     /* Device name */
     const char *name;
     /* Device class */
     enum device_class class;
+
+#ifdef CONFIG_HAS_DEVICE_TREE
+
     /* List of devices supported by this driver */
     const struct dt_device_match *dt_match;
     /*
@@ -52,8 +109,12 @@ struct device_desc {
      * -EAGAIN is used to indicate that device probing is deferred.
      */
     int (*init)(struct dt_device_node *dev, const void *data);
+
+#endif
 };
 
+#ifdef CONFIG_ACPI
+
 struct acpi_device_desc {
     /* Device name */
     const char *name;
@@ -75,44 +136,18 @@ struct acpi_device_desc {
 int acpi_device_init(enum device_class class,
                      const void *data, int class_type);
 
-/**
- *  device_init - Initialize a device
- *  @dev: device to initialize
- *  @class: class of the device (serial, network...)
- *  @data: specific data for initializing the device
- *
- *  Return 0 on success.
- */
-int device_init(struct dt_device_node *dev, enum device_class class,
-                const void *data);
-
-/**
- * device_get_type - Get the type of the device
- * @dev: device to match
- *
- * Return the device type on success or DEVICE_ANY on failure
- */
-enum device_class device_get_class(const struct dt_device_node *dev);
+#define ACPI_DEVICE_START(_name, _namestr, _class)              \
+static const struct acpi_device_desc __dev_desc_##_name __used  \
+__section(".adev.info") = {                                     \
+    .name = _namestr,                                           \
+    .class = _class,                                            \
 
-#define DT_DEVICE_START(_name, _namestr, _class)                    \
-static const struct device_desc __dev_desc_##_name __used           \
-__section(".dev.info") = {                                          \
-    .name = _namestr,                                               \
-    .class = _class,                                                \
-
-#define DT_DEVICE_END                                               \
+#define ACPI_DEVICE_END                                         \
 };
 
-#define ACPI_DEVICE_START(_name, _namestr, _class)                    \
-static const struct acpi_device_desc __dev_desc_##_name __used           \
-__section(".adev.info") = {                       \
-    .name = _namestr,                                               \
-    .class = _class,                                                \
-
-#define ACPI_DEVICE_END                                               \
-};
+#endif /* CONFIG_ACPI */
 
-#endif /* __ASM_ARM_DEVICE_H */
+#endif /* __ASM_GENERIC_DEVICE_H__ */
 
 /*
  * Local variables:
-- 
2.43.0


