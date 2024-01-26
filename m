Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC59E83DDC1
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 16:42:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672094.1045800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOLS-0003oS-Ee; Fri, 26 Jan 2024 15:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672094.1045800; Fri, 26 Jan 2024 15:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOLS-0003hn-7f; Fri, 26 Jan 2024 15:42:18 +0000
Received: by outflank-mailman (input) for mailman id 672094;
 Fri, 26 Jan 2024 15:42:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqdW=JE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rTOLR-00039n-3B
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 15:42:17 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ae2e924-bc61-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 16:42:15 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51022133a84so642725e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 07:42:15 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 q5-20020ac25105000000b0050e7ec49881sm208351lfb.21.2024.01.26.07.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 07:42:14 -0800 (PST)
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
X-Inumbo-ID: 7ae2e924-bc61-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706283735; x=1706888535; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLBEcEhjguKvXHdTuEC4hoUJhlDOkKsN5bndKqUwPUQ=;
        b=bsaA9S/JUS1UyIS+31G5cqoW3XJXQGbFetJ5f/JQl4ztwutXVuL0mmBb56FWoqQ4Rt
         0Js0PAmPMqiLJSYlxkypEVUJH3Stwambj16KCZBS/AjRcAZS4+pdM5ZHxEeq1oFhMPfC
         wSmkootA+0W6SU6S3nZ5cmvVF1l4YMo+MhXb659EpbnrkjV8Kn9MuRvJqGQTBNgMIIDC
         WETffYKszlBS22oV8IaLrY0/t/7/a320fSupKModrGsIaniATBR3pR23/ZZ1+I1PHb4S
         HUU5kR0CBJCO/ou1cE5jPoprJPrM+iLLoilW9KE/5sFZbc8/spKjgZRtDF8g1ZtTAV+y
         7GAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706283735; x=1706888535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLBEcEhjguKvXHdTuEC4hoUJhlDOkKsN5bndKqUwPUQ=;
        b=gvecNdiOsvuZ0FXn8w25bK21+SySM9YWovNKIRxXYbUWPvMRqbOlxcaGyCn7sXLBj9
         LDJQ32c7cz9k9Q52jRUFkIf/gwgx6mrWKvacmsi6r7NPhhB4A7dMAyly8jgO++aLQeEs
         FidAjhX0Tptc3grUGHNiM9IqqJNmqwQWjA2IQaizPrCDXet/Lhmtjvfh3dRK5270SoZA
         IfkZh8CHiH+F8og2ex2ceF+HmRJM6VKkZAKxFMVyukHAfp6fcP4Iigr1C6/1NkxvEgwD
         IuN2/wwgO5Vxw5q9M7KuDabDFqxFcv3FDqtP+6JuQ459nS5pAZxTO1CM1tR2eDPchJzF
         TM4Q==
X-Gm-Message-State: AOJu0YypZCD62pIx5i8g069zF27HgfbrOq2rfGcEVyKLvqHynJ+RFHZv
	vp8EV6MQog0/EfRhUOURKscFfSVT4amQTDD+02s2qvgcdjH1aBe07ScjM3Tf
X-Google-Smtp-Source: AGHT+IFpaeOqR1Lx9X/+OfhLDLRNmlovnlRSZA2BL1j7RuqIt8Q1MlPu+uZ7fMMcS7Tds8AECo3DnQ==
X-Received: by 2002:a19:e05a:0:b0:50e:7c08:1a55 with SMTP id g26-20020a19e05a000000b0050e7c081a55mr43653lfj.18.1706283734802;
        Fri, 26 Jan 2024 07:42:14 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 5/7] xen/asm-generic: introduce generic device.h
Date: Fri, 26 Jan 2024 17:42:05 +0200
Message-ID: <621ff5bd992ea8e6202ec03fa52c0e09aacd8f83.1706281994.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706281994.git.oleksii.kurochko@gmail.com>
References: <cover.1706281994.git.oleksii.kurochko@gmail.com>
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

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/include/asm-generic/device.h | 162 +++++++++++++++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 xen/include/asm-generic/device.h

diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
new file mode 100644
index 0000000000..f12b30dc43
--- /dev/null
+++ b/xen/include/asm-generic/device.h
@@ -0,0 +1,162 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_DEVICE_H__
+#define __ASM_GENERIC_DEVICE_H__
+
+#include <xen/stdbool.h>
+
+/*
+ * DEV_TYPE_MAX is currently not in use, but it was added because the enum may
+ * be empty when !HAS_DEVICE_TREE and !HAS_PCI, which could lead to
+ * a compilation error.
+ */
+enum device_type
+{
+#ifdef CONFIG_HAS_DEVICE_TREE
+    DEV_DT,
+#endif
+
+#ifdef CONFIG_HAS_PCI
+    DEV_PCI,
+#endif
+    DEV_TYPE_MAX,
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
+#define DT_DEVICE_START(_name, _namestr, _class)                    \
+static const struct device_desc __dev_desc_##_name __used           \
+__section(".dev.info") = {                                          \
+    .name = _namestr,                                               \
+    .class = _class,                                                \
+
+#define DT_DEVICE_END                                               \
+};
+
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
+#define ACPI_DEVICE_START(_name, _namestr, _class)              \
+static const struct acpi_device_desc __dev_desc_##_name __used  \
+__section(".adev.info") = {                                     \
+    .name = _namestr,                                           \
+    .class = _class,                                            \
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


