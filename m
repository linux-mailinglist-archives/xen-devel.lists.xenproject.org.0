Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFE46453E9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 07:19:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455861.713538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nlc-0003wA-R7; Wed, 07 Dec 2022 06:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455861.713538; Wed, 07 Dec 2022 06:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nlc-0003rk-Mb; Wed, 07 Dec 2022 06:18:52 +0000
Received: by outflank-mailman (input) for mailman id 455861;
 Wed, 07 Dec 2022 06:18:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p2nlb-0001e0-0d
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 06:18:51 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20627.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 027862e7-75f7-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 07:18:48 +0100 (CET)
Received: from DS7PR03CA0154.namprd03.prod.outlook.com (2603:10b6:5:3b2::9) by
 DM6PR12MB4105.namprd12.prod.outlook.com (2603:10b6:5:217::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.13; Wed, 7 Dec 2022 06:18:45 +0000
Received: from DS1PEPF0000E652.namprd02.prod.outlook.com
 (2603:10b6:5:3b2:cafe::6e) by DS7PR03CA0154.outlook.office365.com
 (2603:10b6:5:3b2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 06:18:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E652.mail.protection.outlook.com (10.167.18.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Wed, 7 Dec 2022 06:18:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:18:45 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 00:18:44 -0600
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
X-Inumbo-ID: 027862e7-75f7-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gl9zA5Rlw6Z18406/kvz9L6rxskXGoVieYrESwNAT9FGrO17EIYKr3qD5Hh93U7dg3j5OdXrcpNJbMJpwVuchm0bRquWUfFcwyQ/3DVMJHNsyVQ7mChOXovHFqm6E8gwN5INEsnwqQZByDUdTxLOyKUHI5jcP/jQC1fI9F3sAjAh4iOD7dzgbpCRG3XL6moj1+5AwWg3+1B/PPcsYpj2EHopOVG/bqNYT47C+/CKdpK5wIlErHyGaRG1FKTC9EIkYA0t8adMQ2gq19ky6u7mbecqW4UumL2xfCLfwI9sL5wLIlnExdqRC56XwusKShEkDH+5365lX3H5y3iRZ2JL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOPPAvQXWI6mBEMr+gwu+U1QiIWcZR6lM0h0oeP5Sao=;
 b=ee2Tk4HAwaQ9cqfiAlRY7yeiOnycD83/2kEdWajTm5S5QzdKHktLmrbmdB+QgU06p4CGOMSf07RGFeqYPv3oDCsSimNmyr78i0H0SFtTjT2zjjNKc6owb329vhHggdkuz3bftB8aw997KkQjBEQzrZIuEDu0s6jTUEK2lxjflz/jVAW0YVegjY+brapXq3bMz/oyGHegt1RoUZZ+BC7hzocawqP1ElC4xItHQSeXIUzQWBKqSQKN61CDj3VwnxQFV4Pkn2/fUWFC8MAVI/b8MaFH7Cy1aj5Koxmrizj9Z8IVs62jGV04wFiCnly5PJ6hvFteWiS9k2oJbp32KZkJKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOPPAvQXWI6mBEMr+gwu+U1QiIWcZR6lM0h0oeP5Sao=;
 b=4bvf5nmqnRYkljZdCWjjctvzN4ZMW0P5h23MHs2YnQRWjX18XifbUtrYEjcZq629x1s/CtIs68FWP2CZXFiVtrP/2DlUTpaC0syZdBrnsTvMquElOAnNbRDrFfv86ba9RdMJ5/9GNkXD0OsZJU6UpHERQO4nwrv8Aj8Zs1xPlbw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <vikram.garhwal@amd.com>,
	<Luca.Fancellu@arm.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][RFC PATCH v4 15/16] tools/libs/light: Implement new libxl functions for device tree overlay ops
Date: Tue, 6 Dec 2022 22:18:14 -0800
Message-ID: <20221207061815.7404-9-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207061815.7404-1-vikram.garhwal@amd.com>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E652:EE_|DM6PR12MB4105:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e5429a2-6bb2-40cc-58cb-08dad81ae590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uQYnwTJBZzzsIDxJKS00fctYfhKUCWfH+75jtjPY809tsXrPz8uqlvA5YwyId370pOzr2fv9Z7koJuuynbp3cNRsn05b17KgKcOPz6xtoYum66NSw8BNxZ0oG6cJ+E3pgckLdUXR9+lQJV8rcznSW1koAr+meuJsSkXMbqm39MaDePOSAgQLy69nhF97pOimj0c8L3AQh+XTCkKcZ3rBg5rWkJiYqLcNCQFQPY47tmqXezdNAGXUfo19FUYXOMG1I2ZdFcYsRJaCBMd60cHOi9d+9dIvztLX2LugYDLIU9NtRQv8PesleLQ9sBSw6ZFXM9JOgJTpjRsFZdWVZego+LiZjXhY3piruPjzCWUUXrN4VY7L4o3dK/FPWblZXCnL6nPNmmsK9JSzzU0y33X0QAJg2REO8ARh0p6h53sRh13CMmNNGG35bR308b7C7uS/vMwKfWPJBDR/LYpq8BHIBaO8ONAZjph9X3XD/Mu2VSSUHr1myz7h5LYRwNvWf20rIgCsMzvsrQD9/48yV1A2n9lC528zTKRiDP4rPXcGs/olPVhT27SABICQCWvZ9s4PdCR4ZN32OY9irg639t1/AMtdDwcICtfPWsQaHvkoqXgqOAJ1ntwU9h7ZJ1k/wcIt6UcH6K5/+/yJgUQMffrKb2VUekjRmPOy0CiygGdsijP7TOMkk7ygGeB+XvC3sl/BWlHfRd/msrlAI67AVdlfXS95Afxy2tyRkqepRsnlwKksbH12AQJGZSleD/BSIdDo
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199015)(46966006)(40470700004)(36840700001)(36756003)(40460700003)(316002)(5660300002)(81166007)(6916009)(54906003)(426003)(336012)(41300700001)(86362001)(2616005)(47076005)(356005)(82310400005)(82740400003)(36860700001)(186003)(6666004)(40480700001)(478600001)(8936002)(26005)(2906002)(8676002)(4326008)(70206006)(1076003)(70586007)(44832011)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 06:18:45.7444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5429a2-6bb2-40cc-58cb-08dad81ae590
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E652.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4105

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
 tools/include/libxl.h               |  8 ++++
 tools/libs/light/Makefile           |  3 ++
 tools/libs/light/libxl_dt_overlay.c | 72 +++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 tools/libs/light/libxl_dt_overlay.c

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 2321a648a5..82fc7ce6b9 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -245,6 +245,11 @@
  */
 #define LIBXL_HAVE_DEVICETREE_PASSTHROUGH 1
 
+/**
+ * This means Device Tree Overlay is supported.
+ */
+#define LIBXL_HAVE_DT_OVERLAY 1
+
 /*
  * libxl_domain_build_info has device_model_user to specify the user to
  * run the device model with. See docs/misc/qemu-deprivilege.txt.
@@ -2448,6 +2453,9 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
                                         int *num);
 void libxl_device_pci_list_free(libxl_device_pci* list, int num);
 
+int libxl_dt_overlay(libxl_ctx *ctx, void *overlay,
+                     uint32_t overlay_size, uint8_t overlay_op);
+
 /*
  * Turns the current process into a backend device service daemon
  * for a driver domain.
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 374be1cfab..2fde58246e 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -111,6 +111,9 @@ OBJS-y += _libxl_types.o
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
index 0000000000..38cab880a0
--- /dev/null
+++ b/tools/libs/light/libxl_dt_overlay.c
@@ -0,0 +1,72 @@
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


