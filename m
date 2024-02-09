Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C292584FB61
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 19:01:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678785.1056349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYVBO-0008Se-FK; Fri, 09 Feb 2024 18:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678785.1056349; Fri, 09 Feb 2024 18:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYVBO-0008Nq-4E; Fri, 09 Feb 2024 18:01:02 +0000
Received: by outflank-mailman (input) for mailman id 678785;
 Fri, 09 Feb 2024 18:01:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnec=JS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rYVBM-0007AX-Nh
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 18:01:00 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ddff2de-c775-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 19:00:59 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so1616253a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 10:00:59 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 fd1-20020a056402388100b00561103f29fbsm984503edb.75.2024.02.09.10.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 10:00:57 -0800 (PST)
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
X-Inumbo-ID: 2ddff2de-c775-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707501658; x=1708106458; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOVmqMl/hPpGvSwcX+N7nK/RY+xiJRv2+tQc7IlhjtY=;
        b=Idrm/AYIkfpGgJW6TYYHdiw/pDE3ZYx0GrWFGdULZyEfk9nLF5hhkl9EAK/prfXFQm
         hMcB1X/GPV7CqTmIpndbaPL5qRcyISWW0UaxaAUcHh63drVZpf4yd312kGnY2iZM7v8x
         sw4CpKNl4cH2f6iEQ4m54AdMEbx4KD5QmmYjVw8qGTllQFHzivUtk6L7BSofHP3atlzX
         tzc8Tz0Zmj8OUtrm/jEFR8vF60N4hZ/XWenS2yKET5N19P826V6jVlg6QfM6GcC3rZUp
         AJ+dZGpPT7803us1XDg3jRTsu0jkaLllxt8C6/hsS02Wr9Vr2inJx+XEr8mjrbZn3ftR
         DpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501658; x=1708106458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOVmqMl/hPpGvSwcX+N7nK/RY+xiJRv2+tQc7IlhjtY=;
        b=W6g5Jv3ysciWJEAvNxq3SMYW0zgsDuDq3Q8VwDk65yCUtp7ZWetQhItx0+pqDGhGhm
         VR4zWFFePWAx5YPX4TGMgppjYh5Z3UGMI5ERg7LBXcz2T+DsHleGgzZWVjoXOPMJqYgW
         ZqXtBw+IPo5Qke56At6ynIsUbYGE7lE/7KctuNFp6rDjwe3FndfT7NHt+6b0A2ehOkax
         /R5ETEq6gRnj7PZcd9ElAVnAzIPku3DGASSrtZRQXABFrtJdc3kLFhL/Z65lp3dM1rOV
         /gopH4hNcNH/ToIoqoG0PGBrVFU4tTmxyqFQ5iCSRYxdEnYf7YOH84wK3MABj2exQGAa
         bRJQ==
X-Gm-Message-State: AOJu0YyEymcsMQ+zsqv85zEj1PeycLBOoY7h6t+rfM8O/BvT6tU4m+2n
	FQ+oU4FN7AQ/B8z2hcuLNy40VZf+ui37wNKyKtiC6ZHn/kzPM0hIhRp32WG7
X-Google-Smtp-Source: AGHT+IGZNhtlYMhLN+J3mwCuT+VlPUB2Wjdy1BQurwwsaXJBlp4ljXSYf5RPXU8CDNNMBxOHwgV+6g==
X-Received: by 2002:a05:6402:784:b0:55f:ec52:73c4 with SMTP id d4-20020a056402078400b0055fec5273c4mr1966265edy.34.1707501658375;
        Fri, 09 Feb 2024 10:00:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXNBSTd3EyIu7gvwXGI3lavhZQHbrnmmpBNhyJw51rTjTslLUNeFbc8AGpni/IrW6EYgoT3AAP/JdD4/bZDkBci240carThCRmd4TrdB3kel+XrUwUAf/XI1l8uqTU4zV18I2qh1txcoAMFDHm2t5I0xn5+OTdXOLtgqDKa4GgaHgAXm4XNlegFjZeIbDGUJT+VL4TNHGt7Cm+kGKlsSK3q/RQ183fHfNMcFw==
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v8 5/7] xen/asm-generic: introduce generic device.h
Date: Fri,  9 Feb 2024 19:00:47 +0100
Message-ID: <4ecb5e5f4a1dbf585ac7a9ebe40b5fd8e4709182.1707499278.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707499278.git.oleksii.kurochko@gmail.com>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Arm, PPC and RISC-V introduce the same things in asm/device.h, so
generic device.h was introduced.
Arm's device.h was taken as a base with the following changes:
 - #ifdef ACPI related things.
 - Rename #ifdef guards.
 - Add SPDX tag.
 - #ifdef CONFIG_HAS_DEVICE_TREE related things.
 - #ifdef-ing iommu related things with CONFIG_HAS_PASSTHROUGH.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V8:
 - drop #ifdef HAS_PCI around DEV_PCI in enum device_type to be consistent with DEVICE_PCI_HOSTBRIDGE
 - drop the comment above enum device_type, after DEV_PCI is alaways present in enum device_type, so
   there is no need anymore in comment and DEV_TYPE_MAX.
 - drop #ifdef HAS_PCI around dev_is_pci() as DEV_PCI is alwayds define now.
 - rename args _name, _namestr, _class to name, namestr, class.
 - drop unnessary backslash after .class = class in defines ACPI_DEVICE_START() and DT_DEVICE_START()
 - update the commit message 
---
Changes in V7:
 - keeping DEVICE_PCI_HOSTBRIDGE available for every build based on the reply:
    https://lore.kernel.org/xen-devel/926a5c12-7f02-42ec-92a8-1c82d060c710@xen.org/
 - add comment above enum device_type.h with explanation about DEV_TYPE_MAX.        
 - separate patch  "[PATCH v6 9/9] xen/asm-generic: introduce generic device.h" into 3 patches.
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
 xen/include/asm-generic/device.h | 149 +++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)
 create mode 100644 xen/include/asm-generic/device.h

diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
new file mode 100644
index 0000000000..6e56658271
--- /dev/null
+++ b/xen/include/asm-generic/device.h
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_DEVICE_H__
+#define __ASM_GENERIC_DEVICE_H__
+
+#include <xen/stdbool.h>
+
+enum device_type
+{
+#ifdef CONFIG_HAS_DEVICE_TREE
+    DEV_DT,
+#endif
+    DEV_PCI
+};
+
+enum device_class
+{
+    DEVICE_SERIAL,
+    DEVICE_IOMMU,
+    DEVICE_INTERRUPT_CONTROLLER,
+    DEVICE_PCI_HOSTBRIDGE,
+    /* Use for error */
+    DEVICE_UNKNOWN,
+};
+
+struct dev_archdata {
+#ifdef CONFIG_HAS_PASSTHROUGH
+    void *iommu;    /* IOMMU private data */
+#endif
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
+#ifdef CONFIG_HAS_PASSTHROUGH
+    struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU instance data */
+#endif
+};
+
+typedef struct device device_t;
+
+#ifdef CONFIG_HAS_DEVICE_TREE
+
+#include <xen/device_tree.h>
+
+#define dev_is_dt(dev)  ((dev)->type == DEV_DT)
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
+#define DT_DEVICE_START(name_, namestr_, class_)            \
+static const struct device_desc __dev_desc_##name_ __used   \
+__section(".dev.info") = {                                  \
+    .name = namestr_,                                       \
+    .class = class_,
+
+#define DT_DEVICE_END                                       \
+};
+
+#else /* !CONFIG_HAS_DEVICE_TREE */
+#define dev_is_dt(dev) ((void)(dev), false)
+#endif /* CONFIG_HAS_DEVICE_TREE */
+
+#define dev_is_pci(dev) ((dev)->type == DEV_PCI)
+
+struct device_desc {
+    /* Device name */
+    const char *name;
+    /* Device class */
+    enum device_class class;
+
+#ifdef CONFIG_HAS_DEVICE_TREE
+
+    /* List of devices supported by this driver */
+    const struct dt_device_match *dt_match;
+    /*
+     * Device initialization.
+     *
+     * -EAGAIN is used to indicate that device probing is deferred.
+     */
+    int (*init)(struct dt_device_node *dev, const void *data);
+
+#endif
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
+#define ACPI_DEVICE_START(name_, namestr_, class_)              \
+static const struct acpi_device_desc __dev_desc_##name_ __used  \
+__section(".adev.info") = {                                     \
+    .name = namestr_,                                           \
+    .class = class_,
+
+#define ACPI_DEVICE_END                                         \
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
2.43.0


