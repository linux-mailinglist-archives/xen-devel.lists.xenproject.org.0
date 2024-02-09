Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC3284FB62
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 19:01:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678786.1056354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYVBO-0000BW-Vm; Fri, 09 Feb 2024 18:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678786.1056354; Fri, 09 Feb 2024 18:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYVBO-0008Sa-PE; Fri, 09 Feb 2024 18:01:02 +0000
Received: by outflank-mailman (input) for mailman id 678786;
 Fri, 09 Feb 2024 18:01:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnec=JS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rYVBN-0007U9-6o
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 18:01:01 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2eb5f52c-c775-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 19:01:00 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-560c696ccffso4008420a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 10:01:00 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 fd1-20020a056402388100b00561103f29fbsm984503edb.75.2024.02.09.10.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 10:00:58 -0800 (PST)
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
X-Inumbo-ID: 2eb5f52c-c775-11ee-8a4b-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707501659; x=1708106459; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZxnCL12H+ZDFR5vLYR2Fa8H1VelnALrYXWhEz3aNg4=;
        b=N6FuLSU318UjDePVp4JLJu6GT/2hhh2apCe9NgTUVd0UjSSudeJCfua2CmdNr6i1ch
         KbXvwj1AQgetQUCZkDAG0klJPSLbe8VMkQ6PyRSLsOKXaETFsSWwyqWud3cfWwlyLZuA
         yZRlpScPN+VG7oFyycYizcKA91Tu3Jk5BJPMt2vgbitE7DStTNOMYDcvHUZgUjh26z18
         GwNoPG7f+G3oswwoDeCv82z2/3ldrNLRN1XddFc3BjYMQ8BcfcuQnt4DJO9MWVTN7CFk
         yNf5C+jlXAoxu5BWvTiCDpM9hJvv3ltpUPhwrdmd4xEvWfGtGxg1AKCjTYymAxX5miX9
         DKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501659; x=1708106459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZxnCL12H+ZDFR5vLYR2Fa8H1VelnALrYXWhEz3aNg4=;
        b=qr09f4NVEjrYHmIqZvZ2iN+1MVhK4Lo5avln1cMJHYEWxJjcSWLBWQ+pQnEdAaB0bm
         zYZGEAF4Ac8EBP9T2P28Gr6v1ZBnnqNDGkxDWoFGCRAxLCTYVbVGvc5ZvU2c1hmAcddp
         JeI9IoSx663gtNV4qZx1zHUopGR+7ipq2CD/8NsVNzkpinkd+mkWYfiy6hU6M/k1TwxE
         x4UtznmAYZexqxLIsVwVDCifc+6MWgzWTYWKITjmltsh36KqVdXE7M/DwdqKnKUuiE4u
         FMWYlP64UmUUexR/kwohMvHRwf4RiJEY/51ZNjH2y9V//jFtSZyy76Ug6e8tcKpaH5Dx
         V5CQ==
X-Gm-Message-State: AOJu0YzZ7dMbn/YW4bSZY2D6NBTvFSvNKJvnAwaBZCM2frRLB+wG9L0J
	Aq95o79W/fuqcz/LGXD/mnyznr9GYBsUoohg4+3EJ3BR9UKUK+1HMwLJyRQS
X-Google-Smtp-Source: AGHT+IGW1gnVN8wsBtZuIzYKExcTmqqfEH1F9xffamnzp5f18zkBRyLMCfeGTgTtHd+FxfHWMDTdSg==
X-Received: by 2002:a05:6402:3410:b0:55f:5197:6314 with SMTP id k16-20020a056402341000b0055f51976314mr1764168edc.18.1707501659252;
        Fri, 09 Feb 2024 10:00:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfF3SdaH0Hp4Jo9YeYcEvD7pVnwVeVJuG1jZmmx8lgUsmz+i3i1ZTu0HGjlH/cg2uiXiCeCn5o8z6wNqAIlnnvoIdXt0nyvj7wESsm3GQClePV3re9qKFxWtHwZuMhpSFtFSf2ebV1F13JWfqHQA/qVS0hjVqCIwG2F5fGkqp4G82gzINpKtK1CK38FVsHl7cC5JyO6TtvUrnqgD1xj4wfiiE=
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v8 6/7] xen/arm: switch Arm to use asm-generic/device.h
Date: Fri,  9 Feb 2024 19:00:48 +0100
Message-ID: <ae256e804cbfd3c5d17ef9d17f100ebbf17c48fc.1707499278.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707499278.git.oleksii.kurochko@gmail.com>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
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

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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


