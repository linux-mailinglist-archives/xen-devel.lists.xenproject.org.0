Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C761B7881A6
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:11:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590661.923060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRuM-00035F-TL; Fri, 25 Aug 2023 08:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590661.923060; Fri, 25 Aug 2023 08:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRuM-00031b-PG; Fri, 25 Aug 2023 08:11:06 +0000
Received: by outflank-mailman (input) for mailman id 590661;
 Fri, 25 Aug 2023 08:11:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZRnR-0007G4-VX
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:03:57 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20629.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef577e2f-431d-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 10:03:55 +0200 (CEST)
Received: from DS7PR03CA0121.namprd03.prod.outlook.com (2603:10b6:5:3b4::6) by
 CYYPR12MB8990.namprd12.prod.outlook.com (2603:10b6:930:ba::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.27; Fri, 25 Aug 2023 08:03:52 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:5:3b4:cafe::8c) by DS7PR03CA0121.outlook.office365.com
 (2603:10b6:5:3b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27 via Frontend
 Transport; Fri, 25 Aug 2023 08:03:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Fri, 25 Aug 2023 08:03:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:03:48 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 03:03:47 -0500
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
X-Inumbo-ID: ef577e2f-431d-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLo3fxcaTuBsC2MILQLHZ8lfJJkazX7WWIDvk3pVcit1kuRnQ1B9QYdiuBlySvhQtxKHITcUe8dCfCYbGfW3wnZVcQvp3MpXWbzwnZ5SJxtoWYkQz4xZ/PPotiDgnzdDA0OMHFZ93BZs5zlR68K4Rlgv0wvwThaf5oejjbDpau6Xkq+UdR98hyq6Grm0AKvC17848AnmtBUC5w5c+7nwSBfyUTrPBitxThgBHfRUqwbWNeCqWOudInxsPQhQvd9KvgFOK1rFawXLv0JcQHUwoN2/FwUuXXEWhWonlkEcXOumRxAzRpESDO71sukYKWeK+WZlHhfx8SXIOoZMVsh7/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niCrThl8tSMKvN20vRpMYz3k/B1BccExVBIC4Bh0pr4=;
 b=VyfLVwdUlW/FmYMCVSvTFp3JZZYjTCyxSwJiKGtmFEPYo4wdkt/Rc42Td+Wq/EWyPgx04if76thCihq/Y+NgVN05e797aToiR3wfF9f0RIlnm6Yn+ULddNvPPD3HYlkLEPUHn5I2iaT+Tma+PLkZ659mH6ucF7r+8xVMjerz7lzK2DYWl/FADapdMZj3O8D5NF9/jmRtzGLNNppl0VWPt3NBN72pjONCjfV9pOMBguDOa/cIjh/pZO16tgJwOBFO3xsHV1gSjdK7FXW18AxED8dMu7ka3F/JpksG7JUd7UdKgxogw63iwOI1r/ilTR17O7F4GiuL9XeezB5Wta2pJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niCrThl8tSMKvN20vRpMYz3k/B1BccExVBIC4Bh0pr4=;
 b=zHsPWq58zZQcfafpKRxauLFgN2q9C4bDCAVAiIMdEySqtrFZlYt2E8D5v4gPZ0U6YWGSPjUJbCKd8WwPDY9Us5wE2vaTuw5FIxQctMxMkT3rkSanYlkvXi5boaHN1D03TojsP7/WdjUYy20aUvvJDIQHnCIxLAoCOB0kb9wwFb0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <julien@xen.org>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][PATCH v10 19/20] tools/libs/light: Implement new libxl functions for device tree overlay ops
Date: Fri, 25 Aug 2023 01:02:21 -0700
Message-ID: <20230825080222.14247-20-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825080222.14247-1-vikram.garhwal@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|CYYPR12MB8990:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4ad94c-00ec-47eb-4ca2-08dba541d266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pgdUs4g2kYSopWsUhShitsqu0Q48qz1uQ7QrqQdua1D+G4tAPILy+zpvqLYwNN6yy4oPfoX5Y0G26ZqZdR0FR+8QBBXoj3L489hkUfikFxCqA8+NDX28G8nXiCjnk68QfLboXvxq71YDvt2H7kGbWdz2uU75mKh4LiOIqLfjsH2LnjQ7fMaYtJnJgbHYf8rd4knrBa6KwKNbhyURd9fzYk+yhh1oysS18wECbOGYnzJOAMROiOvsg2Nfx2AJSdX33l7ROTeC4W9ubHNltN5EzInpEKzfxlhIEqrcBHYB0obDZyzqfJNqsLYMMpRqgFiUqBMm/hWSJASVzF7vXSWyQG4DDRGEP6PDOtJqIvaAywfhgGkzBeFHy0kX/kXAQBHuvPo/xE9q0tLlK5IWMshK2eTTpE1vM9xpEsdUnpu+GcvaN1JtC2+jUEOy/4PnXyh4CRo0viTCXVW/6p/KSOY60gihLC1voLIem5dRPzBVjOvZpb9itt8x8wcz0AcuG8WDihtvoQH84D5jCZG4QHhKVdt6Xpx7YkYpkZspAb1/DmFYAEktr3sr8lu/dA9PRka5HODA7EtwtMH+IgWu9jeNU2KU38UQrlHrGbYv71LulNDxx7Q06yWhEWlS7luXCrDJ809FF1pULaNhHXZj38VELTrgf3fCNCmR91m0gQriKKNDqXBgcKh+KWxpe+rcIHYYc3XYKEihVT/qwAZuxGLSrH5mbR11MXfg2bhkk4ZPEKs12QKPmqpjYw7aNwQpC5N8SQJtOt/9OktGQlmKHSmm1VtsjYmJUjfhnc9VUfXc4Bo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(82310400011)(1800799009)(186009)(451199024)(40470700004)(36840700001)(46966006)(1076003)(40460700003)(2616005)(5660300002)(8936002)(4326008)(8676002)(336012)(47076005)(426003)(36756003)(44832011)(36860700001)(26005)(82740400003)(40480700001)(356005)(6666004)(81166007)(6916009)(70206006)(70586007)(54906003)(316002)(478600001)(41300700001)(2906002)(86362001)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:03:52.3809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4ad94c-00ec-47eb-4ca2-08dba541d266
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8990

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/include/libxl.h               | 11 +++++
 tools/libs/light/Makefile           |  3 ++
 tools/libs/light/libxl_dt_overlay.c | 71 +++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 tools/libs/light/libxl_dt_overlay.c

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index aa5b1c98d4..b4f2a69b34 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -259,6 +259,12 @@
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
@@ -2493,6 +2499,11 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
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
index 5d7ff94b05..ba4c1b7933 100644
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


