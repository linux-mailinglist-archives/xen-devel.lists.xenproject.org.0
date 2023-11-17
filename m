Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6422A7EF28F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:25:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635110.990868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xtx-0000qn-Eo; Fri, 17 Nov 2023 12:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635110.990868; Fri, 17 Nov 2023 12:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xtx-0000p4-Bl; Fri, 17 Nov 2023 12:24:49 +0000
Received: by outflank-mailman (input) for mailman id 635110;
 Fri, 17 Nov 2023 12:24:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3wv=G6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3xtv-0000ZQ-Po
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:24:47 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bcdeb31-8544-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 13:24:47 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-507a98517f3so2564999e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:24:47 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a18-20020ac25e72000000b005094d95e8bcsm209811lfr.218.2023.11.17.04.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:24:45 -0800 (PST)
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
X-Inumbo-ID: 4bcdeb31-8544-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700223886; x=1700828686; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LN0bvvve1DpmJsPjq9NE3VGNIjDtWaZGExInp1NauPs=;
        b=OwOSKF5WzR7S7Z9jNItdJBGNhXsKdaXgc2R03lX6LGWY6m5hgwRKVY6WlSUmaGm/tf
         UKl4JR94+bnf7jDkyJdYks5GAPLN07STUksOArZaosCToH6ztGcvpr7zgWuO2Gn9c4aI
         +WxNWxAVMNTvOZrC7TD8bPaZQKDT8CELQjQCy7zWXW/n2qtbZYHj+vJ+CDtmCYRE8mps
         h868O0iKrRWaYODhcKZV0Mj8lGEZR6ZWy58UHKGSSMw4UhoUfZ3/IiBGSib0qBS5zveI
         k5dEGjKovlDHphToLDVPEvUUaHgvOuJuOB/rGtyIGTwAyQvBBvQOPBo4ukO0ja41Hz7R
         5aFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700223886; x=1700828686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LN0bvvve1DpmJsPjq9NE3VGNIjDtWaZGExInp1NauPs=;
        b=D812Lykr+Kg7lckeoXjX9tZHyAeq7U4HlTd8xdg8bVAck8K8eikDrQG4i9NHtc++n7
         Mn7vvgRiJIrXrQiKX53Eknk6iS/VU45AxsQp6zTuS+V3OCA9dwGoWnnf8nBNx1C3wvkw
         v9aydRRt7w323OFG8mIXjb326WOe/glh7A9e5OAtMVda/h773VnPiNthDT7qrXaM5Ubc
         5VlOO9PWBj9CrZIjF8xP6r/2xxJUTX2Nn4WsZUa3DIzQHGtlr9DmT6ZX65rkOecu70fY
         wB9VsBB0Y0UV0fdkQyPtE0PqdvGzVGIHuC+3nQDbFDVeYaCcEd7+kB7xgT/AMmdU3YL9
         AHjg==
X-Gm-Message-State: AOJu0YzBpQf7hf5WnC0Vwj1qB7uvlRM/GG030Wg5QM+SKkYBX6S4TMzb
	jAC42e3l8/nYE4ugpnc753b5XwYpKDM=
X-Google-Smtp-Source: AGHT+IF67ZRX0UqMzyh8WW4r/CzmO2Dr45fBHwMVN3SCPNp/QKbIvpatSLW5SPiO9V+dnUXjM/DIoA==
X-Received: by 2002:a19:e047:0:b0:50a:5df2:f322 with SMTP id g7-20020a19e047000000b0050a5df2f322mr12757530lfj.13.1700223885914;
        Fri, 17 Nov 2023 04:24:45 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 02/14] xen/asm-generic: introduce generic device.h
Date: Fri, 17 Nov 2023 14:24:26 +0200
Message-ID: <65b267137539704df7f22b37e3b0a9b372a82b33.1700221559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1700221559.git.oleksii.kurochko@gmail.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
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

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
It is still open question if device.h should be in asm-generic. Need more opinions.
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
 xen/include/asm-generic/device.h | 147 +++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 xen/include/asm-generic/device.h

diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
new file mode 100644
index 0000000000..7ef5aa955a
--- /dev/null
+++ b/xen/include/asm-generic/device.h
@@ -0,0 +1,147 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_DEVICE_H__
+#define __ASM_GENERIC_DEVICE_H__
+
+enum device_type
+{
+#ifdef CONFIG_HAS_DEVICE_TREE
+    DEV_DT,
+#endif
+
+#ifdef HAS_PCI
+    DEV_PCI,
+#endif
+};
+
+struct dev_archdata {
+    void *iommu;    /* IOMMU private data */
+};
+
+/* struct device - The basic device structure */
+struct device
+{
+    enum device_type type;
+#ifdef CONFIG_HAS_DEVICE_TREE
+    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
+#endif
+    struct dev_archdata archdata;
+    struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU instance data */
+};
+
+typedef struct device device_t;
+
+#ifdef CONFIG_HAS_DEVICE_TREE
+#include <xen/device_tree.h>
+#endif
+
+#ifdef HAS_PCI
+#define dev_is_pci(dev) ((dev)->type == DEV_PCI)
+#endif
+
+#ifdef CONFIG_HAS_DEVICE_TREE
+#define dev_is_dt(dev)  ((dev)->type == DEV_DT)
+#endif
+
+enum device_class
+{
+    DEVICE_SERIAL,
+    DEVICE_IOMMU,
+    DEVICE_IC,
+#ifdef HAS_PCI
+    DEVICE_PCI_HOSTBRIDGE,
+#endif
+    /* Use for error */
+    DEVICE_UNKNOWN,
+};
+
+struct device_desc {
+    /* Device name */
+    const char *name;
+    /* Device class */
+    enum device_class class;
+    /* List of devices supported by this driver */
+    const struct dt_device_match *dt_match;
+    /*
+     * Device initialization.
+     *
+     * -EAGAIN is used to indicate that device probing is deferred.
+     */
+    int (*init)(struct dt_device_node *dev, const void *data);
+};
+
+#ifdef CONFIG_ACPI
+
+struct acpi_device_desc {
+    /* Device name */
+    const char *name;
+    /* Device class */
+    enum device_class class;
+    /* type of device supported by the driver */
+    const int class_type;
+    /* Device initialization */
+    int (*init)(const void *data);
+};
+
+/**
+ *  acpi_device_init - Initialize a device
+ *  @class: class of the device (serial, network...)
+ *  @data: specific data for initializing the device
+ *
+ *  Return 0 on success.
+ */
+int acpi_device_init(enum device_class class,
+                     const void *data, int class_type);
+
+#endif /* CONFIG_ACPI */
+
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
+};
+
+#ifdef CONFIG_ACPI
+
+#define ACPI_DEVICE_START(_name, _namestr, _class)                    \
+static const struct acpi_device_desc __dev_desc_##_name __used           \
+__section(".adev.info") = {                       \
+    .name = _namestr,                                               \
+    .class = _class,                                                \
+
+#define ACPI_DEVICE_END                                               \
+};
+
+#endif /* CONFIG_ACPI */
+
+#endif /* __ASM_GENERIC_DEVICE_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


