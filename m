Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6CC78F7E2
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:12:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594329.927676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwS6-0007ZY-9E; Fri, 01 Sep 2023 05:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594329.927676; Fri, 01 Sep 2023 05:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwS6-0007QV-3t; Fri, 01 Sep 2023 05:12:14 +0000
Received: by outflank-mailman (input) for mailman id 594329;
 Fri, 01 Sep 2023 05:12:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbwGt-0000Nr-EI
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:39 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e83::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e21e25c-4884-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 07:00:38 +0200 (CEST)
Received: from DS7PR03CA0162.namprd03.prod.outlook.com (2603:10b6:5:3b2::17)
 by SJ1PR12MB6338.namprd12.prod.outlook.com (2603:10b6:a03:455::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Fri, 1 Sep
 2023 05:00:32 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:5:3b2:cafe::f6) by DS7PR03CA0162.outlook.office365.com
 (2603:10b6:5:3b2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.25 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Fri, 1 Sep 2023 05:00:32 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:30 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:30 -0500
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
X-Inumbo-ID: 7e21e25c-4884-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqAEX/Aia6VR6eHcLHNQ4K4Bfpc1cFBzh/TycvhH1Ei/DFNzO/ctL2TyOi4DQnhE9dDSrWN10koo5fAx2BMEC5nrBJiPMcfDx1nBJXy0EREG5888qAM1UlF3X/qOg2BRZPMtN0cd1y8VjL6cX1ZMAkMzDvHgko4sp6gZ3T0Pbv+Bzh1TF01DIHLF+tssJLB9dWDh+FReWr2QFtjbxf7/eylOzHCWnZwBLSNjoeZ1iBOxg5M5JRJfg9QSApoAAaPZz04rs8iRiPqf6CNqmDS/6V45mkR0+OMKXPUVL+XRD9Te7L2obMGckqg7zV7WRx/qBl0Q98OMuT/g+/YqYMWsfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTCPtQBNjoIyHEJsEb7hqin0hShKQ1om1xTixiBsYZA=;
 b=UL+uajtCXEF8s+UfOdk+0K4L4cfmh2KXdQye6aoagTBiY114zW94lF3vqxOlsK78eWdq7hXFQMOOVp5Em95X/ShHo2tf4l3efJQw09ErXlYo24J2wBeWpuMfdqXXMpWcAbcZ8Gd4SFdAwJAEqYHi9U+BoyQk6MYhu2dY2nOweS46ABlKp4dDJsToIHD1xtiOnBCXbInoJN72JAgaykqdXUSBvBevKiYHxgeZTqfON/SHlF0smIsAFcOlqFsSiLLaoBPvDfCGhpbumTKLfJ4BYZSShhXhmdMI+KN7jr20dZeWJJvhRZbYNGxdrNb0alEQXiiPLSfNWe1xBfKwumU2ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTCPtQBNjoIyHEJsEb7hqin0hShKQ1om1xTixiBsYZA=;
 b=C7pNEwTj7YlLGY5iutzDUK9P+6dDmxWvdYcCesM/vhscApPjnyLc9ucAmVYpfasG7uapgb3KAtyUfyVjVps/C1v3YVWjC79ybetYvw+D5hDWK8VVqznGDo0gDc1WtAv0A2jwwSxUQ3E3LyYI2Gf7R17kzlWfNKO83UGnnv0P/CA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][PATCH v11 19/20] tools/libs/light: Implement new libxl functions for device tree overlay ops
Date: Thu, 31 Aug 2023 21:59:46 -0700
Message-ID: <20230901045947.32351-20-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230901045947.32351-1-vikram.garhwal@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|SJ1PR12MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d21bdfd-7d6d-449d-cf04-08dbaaa85ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ejNHlH2jMBZEeXTHwY/5N/u3gBFXbpvNSt4TMFbC1SrVDeGjKzKykuFfy8T4l63BBmt5d16BEkeiVUf5oGgywnJ+z5NjCeioeT6G+ONgr0CbrRuEYwy/qg6Q9IThD6x7uXD5bOUCPLz2cNAqv9j0bcJo4pk8CxgDBZO54c9vlIlQLBJWaoJ4uORSEIXas9mmPUPuLDLLfDHdfBarfAV5mb1PjT1Se2k853fBzggaBUCFK+mrXfeME3enYWn5sEszTOc9zDT0tUQHVSXt5Yi3TRej8K5c4bWmh4/H6MyyARlK/uzyOhSxGzbfkOct2MhQ/VZTHri0X/JtgP68Fv0LCoff+YXgr0Etz0hcmRNX5ycQnpOa1/w5/RLgUbshY+6z/dvdW1slrGOHc7Y7AKO5R3wiQgiDCZ/U+ajbTmZFVZEgmAZooEXiM3nnnTK0pcsSsAH4nKG2wraLN2aDEM/tSLYZTAgfCL8+eqZVyTM5EZVjLWdd0W5726ghONR7pTQtoaAmnJ+xM2Zeukr4IYXryj5GjeW1Xbm8qgARpr6c+uWZFhBSKaquYQb9yYULA3KbIRyCAz5Acs1UJxp7b8sGJe8KHLCpS/qs/rS8UdziTbrUk7QmZzBiTSGqqY+cM50WmrW7MU8JgvDnQfgaep6yLc1My1VPkPzKhTMk7KmyRUgP0HSQfFOELScPVHJyksXf9RkOMmMGibb4omAYc2XP6M/HZwEQKNsG1rInX+5PEk1MsTdVrjn8nmlXzgkL2i1RYYHZdbfFbFLh46rpfsjtGFAksABZOc9nxqcAtlHvxIQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199024)(1800799009)(186009)(82310400011)(40470700004)(46966006)(36840700001)(70206006)(2906002)(36756003)(5660300002)(86362001)(44832011)(40460700003)(82740400003)(356005)(81166007)(40480700001)(36860700001)(47076005)(4326008)(8676002)(336012)(41300700001)(8936002)(426003)(1076003)(2616005)(26005)(316002)(54906003)(6666004)(478600001)(70586007)(6916009)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:32.1377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d21bdfd-7d6d-449d-cf04-08dbaaa85ea9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6338

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/include/libxl.h               | 11 +++++
 tools/libs/light/Makefile           |  3 ++
 tools/libs/light/libxl_dt_overlay.c | 71 +++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 tools/libs/light/libxl_dt_overlay.c

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 82b764ff57..abc5fd52da 100644
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
@@ -2498,6 +2504,11 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
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


