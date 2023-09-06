Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DB879335C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596086.929871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhIA-0001r8-Ef; Wed, 06 Sep 2023 01:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596086.929871; Wed, 06 Sep 2023 01:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhIA-0001p6-By; Wed, 06 Sep 2023 01:25:14 +0000
Received: by outflank-mailman (input) for mailman id 596086;
 Wed, 06 Sep 2023 01:25:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdhAD-0006tr-MT
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:17:01 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20623.outbound.protection.outlook.com
 [2a01:111:f400:7eab::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13ef21dd-4c53-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 03:17:01 +0200 (CEST)
Received: from CY5PR19CA0010.namprd19.prod.outlook.com (2603:10b6:930:15::14)
 by DM4PR12MB5261.namprd12.prod.outlook.com (2603:10b6:5:398::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 01:16:57 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:930:15:cafe::c0) by CY5PR19CA0010.outlook.office365.com
 (2603:10b6:930:15::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:50 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:50 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:49 -0500
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
X-Inumbo-ID: 13ef21dd-4c53-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d56YR/rPBMe5MbfmAWrkXHY2mM3cXK/a3Z7Vh6oW8KP942Sh/Lw20hBz4Z3/Cf0JQWs6+wYI0VpOOwZAZQoKc2MpjwwUCmYRlfu0EuqQu9gwYOyq/4EYUsjq6KNcF9cTJ/6eAutC/EGNwryD/FfRPMOXVLS6c9UiZhRXkdmTtxEhx3CcEbCrzdHZW5pe+ANzzWIUKJWYB07He4T2z0AwkhcWWptVB6mITxxxUSCzB4DlBlHjYf5U2hspSaIVeKGRwr6OpCjUO/aI5sq7i5VgxeDHnQAh3/+g9RQdsDLUIgAFW7Ewas16Cg9dzDyU51o7Ubvihuf3fMEw46dwPPVAqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTCPtQBNjoIyHEJsEb7hqin0hShKQ1om1xTixiBsYZA=;
 b=eb2dABpz0S361YurgN8F+wNB+bewaZZ5H46s1nAbIJ6X7wG1RxvGJ3ms/T2x/foJ4SfwfyUrkHkFlvq+qSuhFYln4qoPt48dOh6LGH9PW7IjrAupS3PAwCQnc7+FzLWnfT9+ZQ4BLHrFISQuWZB9C0AsSDQr6sliy821QKBD/5KQgwe78xe+Bh5iDsT5BXXidUFlhUn/4HGApLhoC6ex+gdoXISWsH/pTBrJgwApHClLzD55ppUHaXorC3y3WcRuZFNpsJKdG7ax3fsFoswYObD8uXYzPNJzsOkV6H85AnijMIXIYgzu3VRFWiaAGFhYJr2ywJYgziLO9gz5d2dyZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTCPtQBNjoIyHEJsEb7hqin0hShKQ1om1xTixiBsYZA=;
 b=07fn0GtN05eajXibiOW8XkRaruJ5S9U/bUVjyVUc7XaIoRG56BHdjWtZvoxDTeXIqIE7BzZ7gkDyAwiFb17fbezJ6aa1UxAV6mIjYhBDztgFiC2q/sDltRIQPYa3jbDivl+EKGSfh3ZYaOz5VaNRcs0FNlQuHhVtXuxSkRQpxGE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][PATCH v12 19/20] tools/libs/light: Implement new libxl functions for device tree overlay ops
Date: Tue, 5 Sep 2023 18:16:29 -0700
Message-ID: <20230906011631.30310-20-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|DM4PR12MB5261:EE_
X-MS-Office365-Filtering-Correlation-Id: b982ab02-2f3e-43f7-599f-08dbae76f3ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3NduXH4F4IyJR2KnHtwwAc9IZcsZ7EYbXNUubsLkwawdQRTPEdxs9YrVgs+ZIFqufVMsvA5n45/yD1hcytq3YjP16IhMJz7lhNb1hmlxFaeh2V7PvyxcgApQEuqxGHBe1CBF9qQ3ZdW1x0a7L1OhGccuxJAa51ViZe6o9imGK6JtGu4IkKLCfn9YhVRhD9BHo7DCthckoacr9ot624f5+4EDBwNOp5fqWkO63V6BclCtuUcjZWczYBrUOqm5bQm86XQ9sdncBQcXl8JIW6DO9sPtd6RMtgD5tkqXv3xqmzSrlgew/FShp1WgfnZX4aBrKqUyUi0jQGMxpGSefV0IYc7KRsdLNtNeD4BKxPVHjrsF7CvzUEFuAW1lG7U+VQze91XKN+5dB12bnLQB1+zGkMICVjlJU4gEaXg4G07b6YgJQtnN5D7I4Vn7K1XliRG7lrJb76FI7JHs2+sVKzC/4FWS7vQCuPRIP7mdqzs8Y1Fnnz2bhtvUDES99VNY40DJj+MGuECmSCvxVwVGFsSH/SJAYPqtJLXsVuJrfpAQMZ7G7BiilvYRM9+NOuCY2Bbyy5mJXHJP4AwUIOSHqNYddWk8frFWFdarxP2Mo1BlMpDeir5QyiQARaVIgleDaqoMZPbQA4jOFY1iuPXJAl4ejShvAbx+bpnyTGBDl0dvclTv6AM7WDhsXmyA4DCXVlrmyKH9IyDeZ2FUh5+EP4QtX1ydPppSi0H/qOH9ZwhPK2HwK83bG5raFdQ0WIbhSGrqlrKenkbWBQQ4wE+bCz9WnySDkqbiU/uPKwjtDxB4TKc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199024)(82310400011)(186009)(1800799009)(46966006)(36840700001)(40470700004)(2906002)(40460700003)(54906003)(70586007)(70206006)(6916009)(40480700001)(316002)(44832011)(41300700001)(8936002)(4326008)(36756003)(8676002)(5660300002)(86362001)(6666004)(2616005)(1076003)(336012)(81166007)(426003)(26005)(36860700001)(478600001)(356005)(82740400003)(47076005)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:52.4935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b982ab02-2f3e-43f7-599f-08dbae76f3ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5261

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


