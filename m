Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C356DE4B4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519868.807012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJX8-0001xP-6m; Tue, 11 Apr 2023 19:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519868.807012; Tue, 11 Apr 2023 19:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJX7-0001tT-Sh; Tue, 11 Apr 2023 19:20:01 +0000
Received: by outflank-mailman (input) for mailman id 519868;
 Tue, 11 Apr 2023 19:19:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUh-0004Ta-FG
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:31 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eab::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80933d9d-d89d-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 21:17:30 +0200 (CEST)
Received: from BN7PR02CA0032.namprd02.prod.outlook.com (2603:10b6:408:20::45)
 by MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Tue, 11 Apr
 2023 19:17:26 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::27) by BN7PR02CA0032.outlook.office365.com
 (2603:10b6:408:20::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:17:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:23 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:23 -0500
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
X-Inumbo-ID: 80933d9d-d89d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJ0O6GHtiT21f4jamG/1nkPHCqa4FcTuvEoiZY7rnNzRVvZcMWqD+22gBPXrCKVZRbuhqzacuoSI40GoahdOs9YmS1GUW5+yVMr/ZuE/dTYJdv8Jv5NNTEJgukvDUr4a9yAD3cmLLDo21ymy8VNH2GtsPC5m4+aNyWl+PlH0v3MgXFDrZ4cxMi45wX2y05e/FdpGkGLOA573pcDtxRkZ/CJe9pYbdh5JC46HIJLI0Fij2qLWr5/Ti/FRgDc4OB5t9wCMzA9hykIEg+4d0EVWwvnHFKXAXAfcJdm56KTciJjx6ZOZE+MBDg2chC1GRaEzxa8wIwoc1fqOnOA6wDFltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91E2KEtRfiC4xks88DcPT08G46pT034ykx3UwRRlezk=;
 b=Uxtz+1EHP7Es6fMd/EjL8S02P7I1hCuklZeceuPRvGkwc418ulHBVILrSdEbq2w4q59M5OA9jDTiy23+Ri6lwJtN4HRAKnhN7O8U1zaro/ZMdCNAw6ym0zTH20WiDj+RiI3/VD7eQ3MdaI8WZc2aHI0O12VpkNTrYocifrJHBWASnr73YLEAD4EioXEyhETX790iFZ41oRe7YM0SQQuEnT6JqP9Hz3FraOoVouW8t0qT/Z/phjJzjL7A7CxPhyeAZu2PiibxbekpY0qokVbEc8GbGzR8caiRTwIIr/npCXSPFMc9nNUV9L78rvMXRXVSoUhnmgRrXKZpmrMfOz3LkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91E2KEtRfiC4xks88DcPT08G46pT034ykx3UwRRlezk=;
 b=jiBfdo0psJ+gincF4tYwny/wZE4YYqB+6weFDtEz4RDwWLvG1btBljprsLUqj7qRKvmdPI0tVipKGrL5HCSTJodkdK7Wum/AeI1WkuOse3Yuh+L8rqsvyudOZPx1cgMZ+NwJH9bS9/63FzMuLOe5hqM9bJkKmMMcC+uA+zTfq6c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN][PATCH v5 16/17] tools/libs/light: Implement new libxl functions for device tree overlay ops
Date: Tue, 11 Apr 2023 12:16:35 -0700
Message-ID: <20230411191636.26926-35-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT012:EE_|MW4PR12MB5667:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a392f45-94a7-4efa-ba31-08db3ac162ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0zobVB8q1qtHq3f8MXBx+n29ojXpLxjihYItaqooTtF8rfKBKAgmA5h2vRJvDxizfMIzSGZ3LBBi1Gb+MQGRui+yi3I327vpPoiHA6f8qRPbFOUhXncHvsUavOxX9l0rF815NWNH3APr3iVo1sRHaBdWhaJuul3bnVEZFvD2MjkSS5yjlYSU3HYX3I1otNAeam3xZ+VQHgQdniUUZ7ZHubJvg7zP3EU3cgzNGi3bJvz1Pv9FJRfVd+aas3ck15keQ8uZUdWwNCkT1H4pEHPGB2R0qlAq5pIzkI/k0EkHc7som6HxPQ32GAnSYTnJ/DTfDOCwvWqEZaofe51SkyeS2TUKVJMohIdXu1mMnZWX6iacg+USLyWny7QAat1VGwpWSV3apZubruWU4t1zDRqeJbBnopkKvUAvQfDUtD6f8XadAllpbvEVe5RzykvQvsAEY16aTGK1fdjpkA6RwQSPMdwLn4muAScMkEUvl93iubdM1r5awDcl3syKXHzdB5nFVpz4NXS7tdmH2uXP7hoXWQDhsdMr1mbV8qPafbv02S4k1nlOgSOlgBu1cBAsx+Lz036WMSxCSaJ9a/8BAqZgzynCiHx8Sxs07e9phhWHsmNXl+jbVvzSFMLr1XS7NTPugI+zeP1gvUBnN661TojN3pliFUBfvmcWhh7t1jnLmgc6gp1908WNuDkzEA2CsBI5nTZPJHa/9v0+Qh+bbdbuEn58S/Dawz7ZFuo1d4Ar3xI99rq912bMGpKJbziARJl6
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(36756003)(44832011)(82310400005)(40460700003)(2906002)(5660300002)(8936002)(86362001)(40480700001)(8676002)(26005)(6666004)(1076003)(36860700001)(54906003)(478600001)(2616005)(47076005)(336012)(426003)(186003)(70206006)(70586007)(81166007)(82740400003)(41300700001)(356005)(4326008)(6916009)(316002)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:26.1174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a392f45-94a7-4efa-ba31-08db3ac162ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5667

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 tools/include/libxl.h               | 11 +++++
 tools/libs/light/Makefile           |  3 ++
 tools/libs/light/libxl_dt_overlay.c | 71 +++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 tools/libs/light/libxl_dt_overlay.c

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index cfa1a19131..1c5e8abaae 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -250,6 +250,12 @@
  */
 #define LIBXL_HAVE_DEVICETREE_PASSTHROUGH 1
 
+#if defined(__arm__) || defined(__aarch64__)
+/**
+ * This means Device Tree Overlay is supported.
+ */
+#define LIBXL_HAVE_DT_OVERLAY 1
+#endif
 /*
  * libxl_domain_build_info has device_model_user to specify the user to
  * run the device model with. See docs/misc/qemu-deprivilege.txt.
@@ -2453,6 +2459,11 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
                                         int *num);
 void libxl_device_pci_list_free(libxl_device_pci* list, int num);
 
+#if defined(__arm__) || defined(__aarch64__)
+int libxl_dt_overlay(libxl_ctx *ctx, void *overlay,
+                     uint32_t overlay_size, uint8_t overlay_op);
+#endif
+
 /*
  * Turns the current process into a backend device service daemon
  * for a driver domain.
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 96daeabc47..563a1e8d0a 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -112,6 +112,9 @@ OBJS-y += _libxl_types.o
 OBJS-y += libxl_flask.o
 OBJS-y += _libxl_types_internal.o
 
+# Device tree overlay is enabled only for ARM architecture.
+OBJS-$(CONFIG_ARM) += libxl_dt_overlay.o
+
 ifeq ($(CONFIG_LIBNL),y)
 CFLAGS_LIBXL += $(LIBNL3_CFLAGS)
 endif
diff --git a/tools/libs/light/libxl_dt_overlay.c b/tools/libs/light/libxl_dt_overlay.c
new file mode 100644
index 0000000000..a6c709a6dc
--- /dev/null
+++ b/tools/libs/light/libxl_dt_overlay.c
@@ -0,0 +1,71 @@
+/*
+ * Copyright (C) 2021 Xilinx Inc.
+ * Author Vikram Garhwal <fnu.vikram@xilinx.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ */
+
+#include "libxl_osdeps.h" /* must come before any other headers */
+#include "libxl_internal.h"
+#include <libfdt.h>
+#include <xenctrl.h>
+
+static int check_overlay_fdt(libxl__gc *gc, void *fdt, size_t size)
+{
+    int r;
+
+    if (fdt_magic(fdt) != FDT_MAGIC) {
+        LOG(ERROR, "Overlay FDT is not a valid Flat Device Tree");
+        return ERROR_FAIL;
+    }
+
+    r = fdt_check_header(fdt);
+    if (r) {
+        LOG(ERROR, "Failed to check the overlay FDT (%d)", r);
+        return ERROR_FAIL;
+    }
+
+    if (fdt_totalsize(fdt) > size) {
+        LOG(ERROR, "Overlay FDT totalsize is too big");
+        return ERROR_FAIL;
+    }
+
+    return 0;
+}
+
+int libxl_dt_overlay(libxl_ctx *ctx, void *overlay_dt, uint32_t overlay_dt_size,
+                     uint8_t overlay_op)
+{
+    int rc;
+    int r;
+    GC_INIT(ctx);
+
+    if (check_overlay_fdt(gc, overlay_dt, overlay_dt_size)) {
+        LOG(ERROR, "Overlay DTB check failed");
+        rc = ERROR_FAIL;
+        goto out;
+    } else {
+        LOG(DEBUG, "Overlay DTB check passed");
+        rc = 0;
+    }
+
+    r = xc_dt_overlay(ctx->xch, overlay_dt, overlay_dt_size, overlay_op);
+
+    if (r) {
+        LOG(ERROR, "%s: Adding/Removing overlay dtb failed.", __func__);
+        rc = ERROR_FAIL;
+    }
+
+out:
+    GC_FREE;
+    return rc;
+}
+
-- 
2.17.1


