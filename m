Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F49883DDC4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 16:42:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672095.1045813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOLT-0004Cn-Jx; Fri, 26 Jan 2024 15:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672095.1045813; Fri, 26 Jan 2024 15:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOLT-0004Al-Et; Fri, 26 Jan 2024 15:42:19 +0000
Received: by outflank-mailman (input) for mailman id 672095;
 Fri, 26 Jan 2024 15:42:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqdW=JE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rTOLS-00039n-2f
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 15:42:18 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b6c9df7-bc61-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 16:42:16 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5100ed2b33dso1253461e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 07:42:16 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 q5-20020ac25105000000b0050e7ec49881sm208351lfb.21.2024.01.26.07.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 07:42:15 -0800 (PST)
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
X-Inumbo-ID: 7b6c9df7-bc61-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706283736; x=1706888536; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CoC0jYDEb7IzuBO+LTtL41X0IwHwYGfKM4uqjQc6J8=;
        b=ANe1mH2TQ7652+hfoPSK64RggTlI00leWyujtAMlVk7aGlENV2y4iNCJIuepjjdVeU
         c7t/uz6OGyUACRY28HDvrc9l8HzkfOIbNKW89fcb0y2rjQw1VUH6Ry/aa2ZHu+KFsTjl
         XaufhD74BZVGaev/r42K985UDCNiQhEkNs+KeabLXm2GCjj74PUqT+ph5PftGE85ZoWm
         uYr+qvM1uGt9i56UPuSR+d3NgpBBJduKv9H6I83ButZmofeg8ePkz5cyvVEN7AUzpMaL
         Wdc+o4E98FCoNb3pPiLVWEtkbBfPaIaywAEtJhNLrwCwYruFuZpibGMnw2sHdNPkJT5V
         N4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706283736; x=1706888536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CoC0jYDEb7IzuBO+LTtL41X0IwHwYGfKM4uqjQc6J8=;
        b=JFDdA33AJgnI9ffPDSXRpXRTTcQerxUPUtW0A+C2R4HJqgM26z3HVatsqmYWBDQcHE
         VJy0KoGrGuMqOsv091hKwuqBGhXbQI4UGb1y45qvYta/o6kZlYJwBkr/dbZN2t9Jb5MZ
         Nj2y//2BehQ96uMsUVfklnghm05y1KrEiBg5vx+Dk1eOuAincj/74wyRv03bnD3+/Ena
         /S5eIRlSKWbQdHN7nU1ww1IjvM728AKxkRPEal3nQ5iVkJGvXBDuaGjYEZaWfZeMESjz
         I2OQ5o0BywT7jQcOAnSP6elAr56S9wbWnK6lb6u1NEE5TNHw4bOxU1BZ5eRLKBprIDKb
         u65g==
X-Gm-Message-State: AOJu0Yxzs6JjwwImffUKP+AObwvX8V5Rm9DM2WJ70rLdhXesRDjX4YwG
	6hhBz3baCbt/mbCk8w5OBTofLaEi5xyH0yT8ds+NlwP1Dn8tGrpL53WeKivs
X-Google-Smtp-Source: AGHT+IHjD4GEuhO7ompOdwR9Fd6BoQjwV+WsrEoI/sNz6GEohRlCZPloaxtjJeShIRWVokLGuvgn/g==
X-Received: by 2002:a19:f816:0:b0:510:c4a:a02d with SMTP id a22-20020a19f816000000b005100c4aa02dmr810864lff.122.1706283735722;
        Fri, 26 Jan 2024 07:42:15 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 6/7] xen/arm: switch Arm to use asm-generic/device.h
Date: Fri, 26 Jan 2024 17:42:06 +0200
Message-ID: <d5d2b0515516f0554a0532ff4d4fbd9c704e0a1b.1706281994.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706281994.git.oleksii.kurochko@gmail.com>
References: <cover.1706281994.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/device.c             |   5 ++
 xen/arch/arm/domain_build.c       |   2 +-
 xen/arch/arm/gic-v2.c             |   4 +-
 xen/arch/arm/gic-v3.c             |   6 +-
 xen/arch/arm/gic.c                |   4 +-
 xen/arch/arm/include/asm/Makefile |   1 +
 xen/arch/arm/include/asm/device.h | 124 ------------------------------
 7 files changed, 14 insertions(+), 132 deletions(-)
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
-- 
2.43.0


