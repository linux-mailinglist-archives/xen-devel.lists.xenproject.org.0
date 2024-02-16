Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9DD857CD3
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 13:40:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682191.1061324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxV8-000886-Sr; Fri, 16 Feb 2024 12:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682191.1061324; Fri, 16 Feb 2024 12:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxV8-00084t-OV; Fri, 16 Feb 2024 12:39:34 +0000
Received: by outflank-mailman (input) for mailman id 682191;
 Fri, 16 Feb 2024 12:39:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=acXU=JZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raxV7-0006oP-4Q
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 12:39:33 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e5a3f02-ccc8-11ee-98f5-efadbce2ee36;
 Fri, 16 Feb 2024 13:39:31 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a3deb3f563bso51047466b.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2024 04:39:31 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lj8-20020a170907188800b00a3db1734b92sm1121608ejc.43.2024.02.16.04.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 04:39:29 -0800 (PST)
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
X-Inumbo-ID: 6e5a3f02-ccc8-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708087170; x=1708691970; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrSY4X90IuSAbrPbKK2oOfiNpaRxGc61KTsJ00MVrAM=;
        b=czg1v7XYdT9o/V/v13CAIKI0vIlr264WjINv5uI5G/UN73bdM/2Xw6UowfSeI6zTDC
         Hkl5hFaWsKxFjOaknAEWAdW4VL1WVUjPywqWXP178LreDJ78VyBQ1slcyOPnA92HMNQ8
         85/Pwye+cQfbZlMbuERXumaIOFUSzFvdkaSkyjGIHdYoMced0A+KEm6ACMoNqGmg7FZu
         x3aXie4189E5VMH6fwmTAy8pZtYIiC45CB3Z4pCd4+EC3j67qG/PoxECBhXycIfjos+r
         ENcjBANvz39WSEovaiTH1/NNgAIcxW7TVb3NNdyiWZt1lxYNeWMBb/TrzQjV+7gr5pEv
         oNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708087170; x=1708691970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrSY4X90IuSAbrPbKK2oOfiNpaRxGc61KTsJ00MVrAM=;
        b=Cj+ToHO4DdqTtYwer6L5KsxsVMzwwsEgybyLt8OsRxzG/Z+YjnAiaAILfBHlfSX56D
         ScKxuo3bsSXvIdvlc1U5l9DOxI9p0daE9sx54F6KpyIah5Ra1ksx1NXL5POw8s2pezRt
         vURLJojDFHvxPJNOtYFsa90Y+0n1CDjowy7saNAO3XnJIaqS/WNhfV5av56ZvH4m9hjr
         a5A7Jqiwlhh/e0MACPih8bT7gESvvCjTwC7TlinA5XPzj0E1uEW0PhIgwKMlxzNX64Vn
         ieIieyv3eHevsKGTKVtTWIvbTM+rX6DE6sNPKMh8uniDD0qKMKmIjL8I5D5EUW3fpy4z
         u18w==
X-Gm-Message-State: AOJu0Yz8dmeudbG+upMi08okSNWMh02QvY83/D0rvyC6anYe9/d/lpRr
	h7KfN+DTR8Oe6mwic545m2nUKrD7S+malkh7OAxa5/smjiUQIOxpZD2aTAsi
X-Google-Smtp-Source: AGHT+IEshWja8Iu0W37U0QhlRH6bVp5bEopQ6HBO0evdbwZ9+7eDnlQ2tD47VoC+ACQhbgr2qdhHjA==
X-Received: by 2002:a17:906:e28f:b0:a3d:8a86:a8fd with SMTP id gg15-20020a170906e28f00b00a3d8a86a8fdmr867935ejb.30.1708087170060;
        Fri, 16 Feb 2024 04:39:30 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v9 5/7] xen/arm: switch Arm to use asm-generic/device.h
Date: Fri, 16 Feb 2024 13:39:17 +0100
Message-ID: <bd6d5295425b6263e5a952b93c832b229b3fda6b.1708086092.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708086091.git.oleksii.kurochko@gmail.com>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes were done as a result of switching to
asm-generic/device.h:
 * DEVICE_GIC was renamed to DEVICE_INTERRUPT_CONTROLLER according
   to definition of enum device_class in asm-generic/device.h.
 * acpi-related things in Arm code were guarded by #ifdef CONFIG_ACPI
   as struct acpi_device_desc was guarded in asm-generic, also functions
   acpi_device_init() was guarded too as they are using structure
   acpi_device_desc inside.
 * drop arm/include/asm/device.h and update arm/include/asm/Makefile
   to use asm-generic/device.h instead.

As 'struct device_desc' is protected by CONFIG_HAS_DEVICE_TREE,
_sdevice, _edevice, device_init(), and device_get_class should also be
protected.
However, this protection was not implemented because Arm always has
CONFIG_HAS_DEVICE_TREE=y at the moment.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
Changes in V9:
 - protect .adev_info in Arm linker script by #ifdef CONFIG_ACPI.
 - update the commit message. 
 - add Reviewed-by: Julien Grall <jgrall@amazon.com>
---
Changes in V8:
 - update the commit message
---
Changes in V7:
 - newly introduced patch which is based on the previous version of the patch:
     [PATCH v6 9/9] xen/asm-generic: introduce generic device.h
---
 xen/arch/arm/device.c             |   5 ++
 xen/arch/arm/domain_build.c       |   2 +-
 xen/arch/arm/gic-v2.c             |   4 +-
 xen/arch/arm/gic-v3.c             |   6 +-
 xen/arch/arm/gic.c                |   4 +-
 xen/arch/arm/include/asm/Makefile |   1 +
 xen/arch/arm/include/asm/device.h | 124 ------------------------------
 xen/arch/arm/xen.lds.S            |   2 +
 8 files changed, 16 insertions(+), 132 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/device.h

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 1f631d3274..3e02cff008 100644
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
index bf0e5c1b75..1cb1360606 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1909,7 +1909,7 @@ static const struct dt_device_match gicv3_dt_match[] __initconst =
     { /* sentinel */ },
 };
 
-DT_DEVICE_START(gicv3, "GICv3", DEVICE_GIC)
+DT_DEVICE_START(gicv3, "GICv3", DEVICE_INTERRUPT_CONTROLLER)
         .dt_match = gicv3_dt_match,
         .init = gicv3_dt_preinit,
 DT_DEVICE_END
@@ -1924,12 +1924,12 @@ static int __init gicv3_acpi_preinit(const void *data)
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
index 505cb49090..4a4036c951 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += altp2m.h
+generic-y += device.h
 generic-y += hardirq.h
 generic-y += iocap.h
 generic-y += paging.h
diff --git a/xen/arch/arm/include/asm/device.h b/xen/arch/arm/include/asm/device.h
deleted file mode 100644
index b5d451e087..0000000000
--- a/xen/arch/arm/include/asm/device.h
+++ /dev/null
@@ -1,124 +0,0 @@
-#ifndef __ASM_ARM_DEVICE_H
-#define __ASM_ARM_DEVICE_H
-
-enum device_type
-{
-    DEV_DT,
-    DEV_PCI,
-};
-
-struct dev_archdata {
-    void *iommu;    /* IOMMU private data */
-};
-
-/* struct device - The basic device structure */
-struct device
-{
-    enum device_type type;
-#ifdef CONFIG_HAS_DEVICE_TREE
-    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
-#endif
-    struct dev_archdata archdata;
-    struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU instance data */
-};
-
-typedef struct device device_t;
-
-#include <xen/device_tree.h>
-
-#define dev_is_pci(dev) ((dev)->type == DEV_PCI)
-#define dev_is_dt(dev)  ((dev)->type == DEV_DT)
-
-enum device_class
-{
-    DEVICE_SERIAL,
-    DEVICE_IOMMU,
-    DEVICE_GIC,
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
-struct acpi_device_desc {
-    /* Device name */
-    const char *name;
-    /* Device class */
-    enum device_class class;
-    /* type of device supported by the driver */
-    const int class_type;
-    /* Device initialization */
-    int (*init)(const void *data);
-};
-
-/**
- *  acpi_device_init - Initialize a device
- *  @class: class of the device (serial, network...)
- *  @data: specific data for initializing the device
- *
- *  Return 0 on success.
- */
-int acpi_device_init(enum device_class class,
-                     const void *data, int class_type);
-
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
-
-#define DT_DEVICE_START(_name, _namestr, _class)                    \
-static const struct device_desc __dev_desc_##_name __used           \
-__section(".dev.info") = {                                          \
-    .name = _namestr,                                               \
-    .class = _class,                                                \
-
-#define DT_DEVICE_END                                               \
-};
-
-#define ACPI_DEVICE_START(_name, _namestr, _class)                    \
-static const struct acpi_device_desc __dev_desc_##_name __used           \
-__section(".adev.info") = {                       \
-    .name = _namestr,                                               \
-    .class = _class,                                                \
-
-#define ACPI_DEVICE_END                                               \
-};
-
-#endif /* __ASM_ARM_DEVICE_H */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 470c8f2208..2266c9536f 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -138,12 +138,14 @@ SECTIONS
       _edevice = .;
   } :text
 
+#ifdef CONFIG_ACPI
   . = ALIGN(8);
   .adev.info : {
       _asdevice = .;
       *(.adev.info)
       _aedevice = .;
   } :text
+#endif
 
   . = ALIGN(8);
   .teemediator.info : {
-- 
2.43.0


