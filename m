Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77507E7DC9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:31:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630610.983638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPI-0005fR-4v; Fri, 10 Nov 2023 16:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630610.983638; Fri, 10 Nov 2023 16:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPH-0005aV-V2; Fri, 10 Nov 2023 16:30:55 +0000
Received: by outflank-mailman (input) for mailman id 630610;
 Fri, 10 Nov 2023 16:30:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1UPG-0005EV-Hg
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:30:54 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84912742-7fe6-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 17:30:53 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-53e07db272cso3664726a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 08:30:53 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lv19-20020a170906bc9300b009a9fbeb15f5sm4128966ejb.46.2023.11.10.08.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:30:52 -0800 (PST)
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
X-Inumbo-ID: 84912742-7fe6-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699633853; x=1700238653; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvsK0oCsBDBGCpZlSufchPSLev4cFlQbwA0TUCOkL1Q=;
        b=GshP/i/22IMRlwcgpTFKaKppSjDMgRyT3Mj3B6jal3FpXHwn8M/sHvGzPOx/dN38FJ
         h+PmtUkLoE/8MS5XBZFHx0CwYRkfomUEhfj8Ih5kGuA5U1GMArgICZQnHZbiIcgIum/M
         xBuRdg1mln8bc/Cm9Rfy7Odb67kiQprkLoNSgahmBm3q85noP5wfNHYYngf0eUhvYWt5
         uKuZ27zP4paM0rAwyY/MRlgt69EN3jatU/rN3AP+VQmByX8l/mfO8KPRDGM+jf8Uw5pu
         HOeSoarGBH1F1myrYcf2LIVW1S59FuBZeZXfWHULhZEsHT8hRWwP2u9ZwtEKUfQ6KDvy
         5/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699633853; x=1700238653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvsK0oCsBDBGCpZlSufchPSLev4cFlQbwA0TUCOkL1Q=;
        b=G5dRlkvafZm5lRaKjo5/OxhQe+U1IOsgBf5tlHLO2mc8fpmYGrkAlDuqJM6tZNrYGr
         0VhGcUtkn/Dcu44FgLB+kt7XragEHfUmtn/t3KFEEzXrFNfa0/PoIcZ1RDs0H2LXklG0
         4XirafzrujDB/EdvwXqLbbriWAeRJZ76xftjIX0l9orXoxI7IM5eTsrU+6fj3GWEPv8H
         Qflc5sTFZKxZe8vyQG2ILT58EgL9MP3umXBkAEb/A1z9Tcifslk+Ao4MtB1OVFHmKkqh
         HTO2p7vB9eM/CZRj3AMIXbsqRBndvzG1G9AyDgPBkIosyglnzBdhPE+nKfoedFlih+9f
         Wipw==
X-Gm-Message-State: AOJu0YxtASXuTO/SnioOoV428NLXnzM3shx8Rvnuzobw8OrIFtSBsgBs
	tK2Ji2j2JqW5SM6Lt5rM6tp/MIM+0OI=
X-Google-Smtp-Source: AGHT+IGEmb3GoHn5xaJzhgOsHzqLSPOVadzTsuSxZDiBhWqg5YlCH3GYzlm7lPaVmwAcLNZonrU41A==
X-Received: by 2002:a17:907:9287:b0:9be:6ff7:128a with SMTP id bw7-20020a170907928700b009be6ff7128amr6386296ejc.67.1699633852692;
        Fri, 10 Nov 2023 08:30:52 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 02/15] xen/asm-generic: introduce generic device.h
Date: Fri, 10 Nov 2023 18:30:28 +0200
Message-ID: <f006e36726ecfefe5dad3c13401365c4f7276ccd.1699633310.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Arm, PPC and RISC-V use the same device.h thereby device.h
was moved to asm-generic. Arm's device.h was taken as a base with
the following changes:
 - #ifdef PCI related things.
 - #ifdef ACPI related things.
 - Rename #ifdef guards.
 - Add SPDX tag.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
It is still open question if device.h should be in asm-generic. Need more opinions.

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
 xen/include/asm-generic/device.h | 140 +++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 xen/include/asm-generic/device.h

diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
new file mode 100644
index 0000000000..5478fc11ca
--- /dev/null
+++ b/xen/include/asm-generic/device.h
@@ -0,0 +1,140 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_DEVICE_H__
+#define __ASM_GENERIC_DEVICE_H__
+
+enum device_type
+{
+    DEV_DT,
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
+#include <xen/device_tree.h>
+
+#ifdef HAS_PCI
+#define dev_is_pci(dev) ((dev)->type == DEV_PCI)
+#endif
+
+#define dev_is_dt(dev)  ((dev)->type == DEV_DT)
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


