Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A20857CCF
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 13:40:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682190.1061314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxV6-0007op-Gj; Fri, 16 Feb 2024 12:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682190.1061314; Fri, 16 Feb 2024 12:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxV6-0007m4-Dg; Fri, 16 Feb 2024 12:39:32 +0000
Received: by outflank-mailman (input) for mailman id 682190;
 Fri, 16 Feb 2024 12:39:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=acXU=JZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raxV4-0006oJ-KC
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 12:39:30 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d8db062-ccc8-11ee-8a4f-1f161083a0e0;
 Fri, 16 Feb 2024 13:39:30 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-563d56ee65cso914509a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2024 04:39:30 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lj8-20020a170907188800b00a3db1734b92sm1121608ejc.43.2024.02.16.04.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 04:39:28 -0800 (PST)
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
X-Inumbo-ID: 6d8db062-ccc8-11ee-8a4f-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708087169; x=1708691969; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLqhOGTUK80zlqCeFoI7si1NHAXYOmuSN6ghjuHIAG8=;
        b=DdLycTm+40w/dq3uMaS6vf1l8cze6yLMu35ZdKDSu3lP9DNs9G4bz0IAFXQxeRew3r
         MHQGQx28YIvIR8hHwGWhn810bs41rTGLeIKJg/HNW6tKjveooBM61AGu4687aXD8BcFf
         dAEjNG5CI8OnkGz2Q7mn7OWUV+K+m9xOYVD45eddw2H24cyK6yy06enLxUovCoS6N6v5
         FYI6pVPxRr8siG4+q1uXrEl2wqp2XJVjPM92pexCmluLV0pM2sjfYI0lob8XiLyY3rMx
         aWa8GWR+1Y4fA78WRMBzVew9Q5dRYeZC42+bdH89yZFKF8l5ztLR8vxAFZwD03sD3oJZ
         uN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708087169; x=1708691969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLqhOGTUK80zlqCeFoI7si1NHAXYOmuSN6ghjuHIAG8=;
        b=RItpEegOJdVX19oFlOXDVxmPvJ4UgNWcysp6nhfVXqNQdnnQHKnc49e0gLHCjQogiK
         h8x8TRqPCK8shubh4ittU+/glIFw0tVC1XR8F2+YU97eJp32mefM/6+zC1Yv+GecNYDM
         Fjcmu5igm8ACPZ8w1PBcP1CfKxcZu02adlzbFsbnAWqkT5UVvNHs/4/1KqSf99EKirb4
         HBN93MvRl65Khagu3C/7nYjMFtwzn+9wFQVCP3Z9rABsxdZGfKvBn+10HX4xsddZEESq
         uUvOW2bLgtTyOBOpLYJKOQZZzirpehCXhDXCOAF0LsfqtBePI7D8ehxsf9lepcov3H5O
         theQ==
X-Gm-Message-State: AOJu0Yw8ZLkS3bN8HupkOFWUmnEDiKEfZZlqO7+6gMhTPdILYEMzTY3/
	Mahik4YIviaQWkzguYUTXbVwxE3xYhL8e7Ffgoczb7+yX1JhJCy3HqsQ+zEp
X-Google-Smtp-Source: AGHT+IHvLiLfCT0H+vGdVFTX1p2sg25x/p7DSf50cigHt5WcaHswwiFLYJLcD94eG7smSK8KHoT8sg==
X-Received: by 2002:a17:906:f80e:b0:a3d:eec8:6679 with SMTP id kh14-20020a170906f80e00b00a3deec86679mr810735ejb.54.1708087168577;
        Fri, 16 Feb 2024 04:39:28 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v9 4/7] xen/asm-generic: introduce generic device.h
Date: Fri, 16 Feb 2024 13:39:16 +0100
Message-ID: <e6df4fde7de451d089ac680535f44a7206313e15.1708086092.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708086091.git.oleksii.kurochko@gmail.com>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V9:
 - move 'struct device_desc' to #ifdef CONFIG_HAS_DEVICE_TREE as it is expected to
   have this structure only in case of CONFIG_HAS_DEVICE_TREE.
 - rename name_, namestr_, class_ to dev_name, ident and cls in DT_DEVICE_START and ACPI_DEVICE_START
   macros.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
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
 xen/include/asm-generic/device.h | 145 +++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 xen/include/asm-generic/device.h

diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
new file mode 100644
index 0000000000..f91bb7f771
--- /dev/null
+++ b/xen/include/asm-generic/device.h
@@ -0,0 +1,145 @@
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
+#define DT_DEVICE_START(dev_name, ident, cls)                   \
+static const struct device_desc __dev_desc_##dev_name __used    \
+__section(".dev.info") = {                                      \
+    .name = ident,                                              \
+    .class = cls,
+
+#define DT_DEVICE_END                                           \
+};
+
+struct device_desc {
+    /* Device name */
+    const char *name;
+    /* Device class */
+    enum device_class class;
+
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
+#else /* !CONFIG_HAS_DEVICE_TREE */
+#define dev_is_dt(dev) ((void)(dev), false)
+#endif /* CONFIG_HAS_DEVICE_TREE */
+
+#define dev_is_pci(dev) ((dev)->type == DEV_PCI)
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
+#define ACPI_DEVICE_START(dev_name, ident, cls)                     \
+static const struct acpi_device_desc __dev_desc_##dev_name __used   \
+__section(".adev.info") = {                                         \
+    .name = ident,                                                  \
+    .class = cls,
+
+#define ACPI_DEVICE_END                                             \
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


