Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7E7A5BFD4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 12:56:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907961.1315158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryDn-0000p4-8N; Tue, 11 Mar 2025 11:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907961.1315158; Tue, 11 Mar 2025 11:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryDn-0000nD-3U; Tue, 11 Mar 2025 11:56:31 +0000
Received: by outflank-mailman (input) for mailman id 907961;
 Tue, 11 Mar 2025 11:56:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WQE=V6=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1trxbS-00061U-VN
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 11:16:54 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55919bee-fe6a-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 12:16:52 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-549967c72bcso3886836e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 04:16:52 -0700 (PDT)
Received: from epuakyiw0a98.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae45fa8sm1755729e87.52.2025.03.11.04.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 04:16:46 -0700 (PDT)
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
X-Inumbo-ID: 55919bee-fe6a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741691812; x=1742296612; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wR0JYxxte1bhZ8sh6yCrPXhqI+ZP9qFcPRuW8qo1VM=;
        b=VRIxBeqnnSnOMqrsVvtW87EAOkAaj8ai0xFDS3Hez5Z01U6CENTNVfCIus4YXyQOJf
         sRPDygVn/LO+a38q6tab9l5W99RY1f5BamezobjjIVJ4Pnlsqr8mWOHp7nJWR/64C9cr
         PNGOH6Q94RzZfHoFL1mdbbEuTzmyYygmmkPQAWtr5bFKfSoXtLCG21G8p+ZXSrzsqAHU
         CtnrYjsVa8wAOp+ADXrgNxLVe2NAKHVITL+//wWT1z0q9lI1z+5awIuDr9zyCP4aXufQ
         Ex/PMgP5+E6yIFkpc53K/JW/QBu/QrTpZBpE1vmFptRVRtDiTAgnIvHH4j+SIHOx8Rsq
         W6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741691812; x=1742296612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wR0JYxxte1bhZ8sh6yCrPXhqI+ZP9qFcPRuW8qo1VM=;
        b=RDkliEj7AOjan9O/ARRtlk7bkTklsbPxlmEEwQoSYg7Dlhtpom9Uv3wFpq7uLA3OIa
         Fl5VlEI38y13yDIiJHFiXZ9et0ROudchtnDbIVIzBArdp9dbh807mFDifh039R3lu12/
         VvFTtPtJQgpmIbVDs+dT534J0HwzHYRlL0l7lKpITGKYWgTU1+UzaRt5yKlD6t7o/76I
         rscqwRotdhZzHsUi0WOrhVrZNmPXHkH9HVH0MxMEqSN/8znTfO/ZTF8DOZ3+Xu8dARZ2
         miq9navycPVbiPHWcK9px8l45zYTgnhW0MrcxCEDg77r1fPdMAlVJzYOdSyFotHHN6qm
         uvVg==
X-Gm-Message-State: AOJu0YxnKcypI23fRi9gt2y7zd8vtSYOCBDQ6BrkhAKp1P7WpxPyadB0
	aLU1LfNx0AAf31P8pvo/Q7aGGv1hbM/uGKaSI8eREgrKm5dC/vpQOM9eSQ==
X-Gm-Gg: ASbGnctVCO1RFCpTdz+bERLs+LOOXfxp4QSymzpjBwvw1GGqQUHaTyt7DCBbieiE1cl
	JwcoKhL7xe9La6tcEj1ksFFKnKdcLoDuV5vjZ+bByJvkOmhCxAxEJ5kGrRumwR8CtKdmXKs1ZN1
	4xRaSo8gyuFIOAJA4rZtM8lr3B9uvdiK4tCW8qz5cShZ3GtLv8o1DXYAppmQ+raYKros1WBfzDB
	IAv97IIn6NeV0yaqlLBLrxjOt2b4lw7VWSuFWx1HulffdNwCzj3+FhXGl1LC4PVVFe241OecKhy
	Lv7pNY1xkn7TBzTpHXqybr/xM8wmGofu2uFcnBXdFj0UdD1kFW73QCoHO7GJImFiFKdfy30oK6n
	yiDQH3JAaRyEy2sdPO8zGmhppwhJVG9ju/jraLw==
X-Google-Smtp-Source: AGHT+IG26J7NKqoiAtVdI7Uj/LA73Tb1+MkPu25XYvQn8u3Jxdn5WZsSviRv1ozk/kK+Fu6pEBCesQ==
X-Received: by 2002:a05:6512:b14:b0:545:c89:2bc9 with SMTP id 2adb3069b0e04-549910cb4a9mr6523148e87.43.1741691807076;
        Tue, 11 Mar 2025 04:16:47 -0700 (PDT)
From: Grygorii Strashko <gragst.linux@gmail.com>
X-Google-Original-From: Grygorii Strashko <grygorii_strashko@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	"Roger Pau Monne" <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH v3 6/7] xen/arm: Export host device-tree to hypfs
Date: Tue, 11 Mar 2025 13:16:17 +0200
Message-Id: <20250311111618.1850927-7-grygorii_strashko@epam.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311111618.1850927-1-grygorii_strashko@epam.com>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

If enabled, host device-tree will be exported to hypfs and can be
accessed through /devicetree path.
Exported device-tree has the same format, as the device-tree
exported to the sysfs by the Linux kernel.
This is useful when XEN toolstack needs an access to the host device-tree.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---
 xen/arch/arm/Kconfig           | 16 ++++++++++++++++
 xen/arch/arm/Makefile          |  1 +
 xen/arch/arm/host_dtb_export.c | 28 ++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 xen/arch/arm/host_dtb_export.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a26d3e11827c..fa51244e2706 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -125,6 +125,22 @@ config DOM0LESS_BOOT
 	  Xen boot without the need of a control domain (Dom0), which could be
 	  present anyway.
 
+config HOST_DTB_EXPORT
+	bool "Export host device tree to hypfs if enabled"
+	depends on ARM && HYPFS && !ACPI
+	help
+
+	  Export host device-tree to hypfs so toolstack can have an access for the
+	  host device tree from Dom0. If you unsure say N.
+
+config HOST_DTB_MAX_SIZE
+	int "Max host dtb export size"
+	depends on HOST_DTB_EXPORT
+	default 8192
+	help
+
+	  Maximum size of the host device-tree exported to hypfs.
+
 config GICV3
 	bool "GICv3 driver"
 	depends on !NEW_VGIC
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 43ab5e8f2550..1518592deb64 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-y += domain.o
 obj-y += domain_build.init.o
 obj-y += domctl.o
+obj-$(CONFIG_HOST_DTB_EXPORT) += host_dtb_export.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += efi/
 obj-y += gic.o
diff --git a/xen/arch/arm/host_dtb_export.c b/xen/arch/arm/host_dtb_export.c
new file mode 100644
index 000000000000..c9beb2803883
--- /dev/null
+++ b/xen/arch/arm/host_dtb_export.c
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Export host FDT to the hypfs
+ *
+ * Copyright (C) 2024 EPAM Systems
+ */
+
+#include <xen/device_tree.h>
+#include <xen/hypfs.h>
+#include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
+
+static HYPFS_VARSIZE_INIT(dt_prop, XEN_HYPFS_TYPE_BLOB,
+        "devicetree", CONFIG_HOST_DTB_MAX_SIZE,
+        &hypfs_leaf_ro_funcs);
+
+static int __init host_dtb_export_init(void)
+{
+    ASSERT(dt_host && (dt_host->sibling == NULL));
+
+    dt_prop.u.content = device_tree_flattened;
+    dt_prop.e.size = fdt_totalsize(device_tree_flattened);
+    hypfs_add_leaf(&hypfs_root, &dt_prop, true);
+
+    return 0;
+}
+
+__initcall(host_dtb_export_init);
-- 
2.34.1


