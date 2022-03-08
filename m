Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000C54D21E7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 20:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287475.487584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoH-0008PC-Qg; Tue, 08 Mar 2022 19:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287475.487584; Tue, 08 Mar 2022 19:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoH-0008Fd-3N; Tue, 08 Mar 2022 19:47:53 +0000
Received: by outflank-mailman (input) for mailman id 287475;
 Tue, 08 Mar 2022 19:47:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RGf4=TT=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1nRfoE-0004Df-UX
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 19:47:51 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7eae::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0fb9c64-9f18-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 20:47:48 +0100 (CET)
Received: from DS7PR06CA0052.namprd06.prod.outlook.com (2603:10b6:8:54::30) by
 MWHPR0201MB3626.namprd02.prod.outlook.com (2603:10b6:301:77::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Tue, 8 Mar
 2022 19:47:45 +0000
Received: from DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::f2) by DS7PR06CA0052.outlook.office365.com
 (2603:10b6:8:54::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 19:47:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT023.mail.protection.outlook.com (10.13.5.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 19:47:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Mar 2022 11:47:26 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Mar 2022 11:47:26 -0800
Received: from [172.19.2.115] (port=58782 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1nRfnp-000Cws-Ux; Tue, 08 Mar 2022 11:47:25 -0800
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
X-Inumbo-ID: a0fb9c64-9f18-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJ/9LP3IjTq1HpjojWR4DRKOH/RiiupFn8vgqXYhr69OIC+KKWf10dcdFVs0ClEVzuQcsu/kutMOurD0mYh95anFF9kVn4Ypo/e+BQ9B9cL+UXox7z/pJ8B83UbV47mjbyEOEhOJ+mqZOBHDThpmdReFejheTBvNBRweUyZvuKWhMCWgFUQmYiILAy5cwM/jDJDvjeLeQWKp9mX7SNAxk/YHVNCiFfVnWLjnK/IJ07xxjCe183vEFSFGq6zTZOMzzrLJRICJjCi+DMTAFveGe2jjx5Z87zpkT2b0F3FkbgtVUmlYUgmRbbjMtacT+iy1Tkb1eqpTEqEmlNPws0UGPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0mw2y4BYfrLOmQKhWhdHmTRvK5Ny8UEy4PO2h9XNts=;
 b=E7YLZo25We6jEghN5JYnGXlhdi+DVL9Qz3y2ttEPrDINduLLQ54wenb9CEQfB8TtTNpuE31rMW3HuaVVec+lGSNIHOa0GUxWDjepeeeDaBBkwJh9TYnolnAkAyP5x4fsHgVCxLMbw2q77k4SnVNxTHtwk+vtR9SiiTN1Uyd1+jTXuPJGLem5U9Jv1UFyCu+SNVRdg29O4wOAr/AfO71HXxeTPEoJJnDdyrPenL3Eoql2OcqYBPofvcZ3hb+cmfaWq0uHfrrWfieSsLFa8OycB7n0Id8GSTZ0LLlgh2CnS9zeVT/Kf4v7jx9KYzpp9JBfdEMh+68ztzbXigA95y1qog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0mw2y4BYfrLOmQKhWhdHmTRvK5Ny8UEy4PO2h9XNts=;
 b=eM6utED1MC17LS6pwcCgYaHiSIiTR4ME+F6uLz9f5snLuWdxMeszEWsw0YH5npBhBFrX/GApPEsaytrllxMaa/BJ6I6y7vAoPUpDr+usf8j81erxy4h9lZHybQaF79Mb6CQ40o6liALWdB6Dd0EUW85L/l8TVf3TixD+wvG5zic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN][RFC PATCH v3 13/14] tools/libs/light: Implement new libxl functions for device tree overlay ops
Date: Tue, 8 Mar 2022 11:47:03 -0800
Message-ID: <20220308194704.14061-14-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308194704.14061-1-fnu.vikram@xilinx.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95d1b2e3-fbf6-4ac7-3fcf-08da013c840c
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3626:EE_
X-Microsoft-Antispam-PRVS:
	<MWHPR0201MB3626E6CB5462EDC4F844FCA1BC099@MWHPR0201MB3626.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NdDwXP0WZ+dIH2Wa+zvGFH3Pkuxzm0MzF82YgvCUfzK6wsv979eCU7cw/Zh7/QwaCV2ug6cMUr0pi9/V3Ba9b5WYe8Dav03KPEES4m+DEO1a8WX1nK+OEBwblxUXy3u9wNgIKDfywrcuc8Qu5NPXKkJ6NDrN0JIlfiQ9JWI2mgNfOlkqW+L1a9gThvEQIcNEoKTAGGbWxpIlQZ5C+9I4cs0f6utIxzzFE37JKuqbSPMRjKNDmkOjT77gkaWNgY2+f4j1PBQTaQlH3MT5Ag+rCPPSqNc7a6q1jW0OiG9Ti7t3tF1QR1zEbG3fgX+pyGz60rTvXz39od2nDmQh0qMBr3KttSHh4+eproBDcGMNQrdkB3NhR4VUFrn/c9u/xRc1nBaguI7LbXYHTGV0lSndoxrffbm7l7cpiuJj1D+tCTgcy9KV/FFep3vw0tRsuycIltUiAyYDZMUDqURZXOpHL5pOEIP0FUBLs2bKO88ZyiSJ4vqiAuwENV4fMHOfA/hsvTdZnW/Unpz4IYYEaZ0iBwumC9U7mPxFxyRiE3Ul/bjPpedmOLPdlLjcegNdg9zjwzyj7b0FImiu3es7X39ON2O5IihFGxshFsizfRyHwacJz2/N2XfANKLquyLPHRP1WN4XOZsj0/Svq4Q14SZRmxYII/SLwpWd6rMjgxWjzx0BMspeY4QdpUgHjL5Dif4Djlk6B9r5UQW8RxL28KIOFWPtOjDRG/YnQ2VN6K7Cuq0=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(8676002)(36756003)(36860700001)(2906002)(40460700003)(4326008)(82310400004)(70206006)(508600001)(26005)(186003)(426003)(336012)(1076003)(2616005)(70586007)(356005)(7636003)(8936002)(5660300002)(6916009)(54906003)(316002)(6666004)(9786002)(47076005)(7696005)(102446001)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:47:45.0313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d1b2e3-fbf6-4ac7-3fcf-08da013c840c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3626

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 tools/include/libxl.h            |  3 ++
 tools/libs/light/Makefile        |  1 +
 tools/libs/light/libxl_overlay.c | 67 ++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 tools/libs/light/libxl_overlay.c

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 51a9b6cfac..b31e17c2ce 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -2419,6 +2419,9 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
                                         int *num);
 void libxl_device_pci_list_free(libxl_device_pci* list, int num);
 
+int libxl_dt_overlay(libxl_ctx *ctx, void *overlay,
+                     int overlay_size, uint8_t overlay_op);
+
 /*
  * Turns the current process into a backend device service daemon
  * for a driver domain.
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 453bea0067..405115c13c 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -116,6 +116,7 @@ SRCS-y += libxl_genid.c
 SRCS-y += _libxl_types.c
 SRCS-y += libxl_flask.c
 SRCS-y += _libxl_types_internal.c
+SRCS-y += libxl_overlay.o
 
 ifeq ($(CONFIG_LIBNL),y)
 CFLAGS_LIBXL += $(LIBNL3_CFLAGS)
diff --git a/tools/libs/light/libxl_overlay.c b/tools/libs/light/libxl_overlay.c
new file mode 100644
index 0000000000..e370e8cac8
--- /dev/null
+++ b/tools/libs/light/libxl_overlay.c
@@ -0,0 +1,67 @@
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
+#include <xenguest.h>
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
+int libxl_dt_overlay(libxl_ctx *ctx, void *overlay_dt, int overlay_dt_size,
+                     uint8_t overlay_op)
+{
+    int rc = 0;
+    GC_INIT(ctx);
+
+    if (check_overlay_fdt(gc, overlay_dt, overlay_dt_size)) {
+        LOG(ERROR, "Overlay DTB check failed\n");
+        GC_FREE;
+        return ERROR_FAIL;
+    } else
+        LOG(DEBUG, "Overlay DTB check passed\n");
+
+    /* We don't need to do  xc_interface_open here. */
+    rc = xc_dt_overlay(ctx->xch, overlay_dt, overlay_dt_size, overlay_op);
+
+    if (rc)
+        LOG(ERROR, "%s: Adding/Removing overlay dtb failed.\n", __func__);
+
+    GC_FREE;
+    return rc;
+}
+
-- 
2.17.1


