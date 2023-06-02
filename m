Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B7C71F759
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542806.847222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syl-0006E3-Jo; Fri, 02 Jun 2023 00:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542806.847222; Fri, 02 Jun 2023 00:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syk-0005im-6z; Fri, 02 Jun 2023 00:49:18 +0000
Received: by outflank-mailman (input) for mailman id 542806;
 Fri, 02 Jun 2023 00:49:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4sya-0000if-LA
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:49:08 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e89::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4672f294-00df-11ee-b231-6b7b168915f2;
 Fri, 02 Jun 2023 02:49:07 +0200 (CEST)
Received: from DM6PR06CA0073.namprd06.prod.outlook.com (2603:10b6:5:336::6) by
 DS7PR12MB6216.namprd12.prod.outlook.com (2603:10b6:8:94::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.23; Fri, 2 Jun 2023 00:49:03 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::8) by DM6PR06CA0073.outlook.office365.com
 (2603:10b6:5:336::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Fri, 2 Jun 2023 00:49:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:49:03 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:49:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:49:01 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:49:00 -0500
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
X-Inumbo-ID: 4672f294-00df-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtkySiu92kbpUP5+5t4mKoHZjPr8zWEEIAy1VXBmeRb0Wy4ypXck61NzGoCCM0Fojjgz2kifPC6u38dI0fMpfE28OXLCaRfLcd80hfUNWqqmKFM9ENdyZYYtNpgv5Gb0Eb3AUFNzcr6dNdxdakxjQggQpeLcXvKa8pwyHKl0DndWBlGrSuAtAfV601rgm54k4vpVPzYzO5OZtj4lUlDVAs0UPfMvMuUE6CbCeYMnxgOANNrQVWB+Z1qWqvNyT+aPXf6Pve4gcBtP31cqrc84tmx0JjVizhOPKu6A2giRfc8gKUzXuwm46uSADddIXg+NgS6Yc/KDQQyHnUbdvBkWkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COSto2fMoVPbrVEP8xV0305ulVdAAdS/6g5EZut49Do=;
 b=j2v3qN7cor5hAuiOEbLvboSVUfsDnqnqraL/G0XrqiTWV9IGRQnVmByckraNVwJrx9HBUsbMlNkMhRgQf1E1/AKZtkT+KYCRvY1N2GGhOpKfHy4a7Ufq4IZvsY+Wf+mTxbFJrBrtTsMdp0Dg3a95S0IAlkaeJjHZpWLhnlRX8T6pq3sEVZI4IOEUx6FXr5PF+1ArVqz6ftDBcS/bec3otrcwftw8nSMVU7dMAprvTdAiCv13frmnsM28gDY/aRrfNyNxkteLRqLn34U4bFX0i5LDCwuEdhWgEuLJ7q2+L+3AzHALr6RR43eqSx0dg+smfbgfEGv8jFg+b1EuMJ8uoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COSto2fMoVPbrVEP8xV0305ulVdAAdS/6g5EZut49Do=;
 b=t1Xf7E+3jv0LytBWnyx+7CZCGHBOWwontdnoRTv0TWtANlyMv6Etb4jkurgQaomJjQ7z+3NKqQu/D4hoAtJ9SfemNhXgEbBxrxCHBA0lk1FBruKvqGO0HJIuBSCbKdHhSVYZPGpd/E4XRc2AM8iDid5ZUlbC6lw55qoKJMgvIjY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][PATCH v7 18/19] tools/libs/light: Implement new libxl functions for device tree overlay ops
Date: Thu, 1 Jun 2023 17:48:23 -0700
Message-ID: <20230602004824.20731-19-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT028:EE_|DS7PR12MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: d698fe06-80c2-4ea7-8868-08db6303294b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xtvCz6rMCYb/uOeBt29yv/HDcJ0NqicELGOsT3V13EoNcQAIy9JHi1+7/1RAp6kRxHIGoOT6nW8l9f0BtzrCSxQ5Eze21OeoVHV1wKecOaoTujqFRaR1/8gQXRgPMsayBlV9t1J0/WDXovM7HkbT7R90I7Vit4Te1UMRif3nfTictj9wLdAjq1RpNDcqH/1L8PAvpfTjBSnvExabByaw+j7SsN+VOf7XdXycC3f4d0EHgpyWFPJYQEtHvBUg+r9sxJCVhTa6+myzXLc+npr9QgDjZGouJPAXpEn1ZmpOEoBnS84I8dkoOHi/oCd2i6XwgTdRjrugbs5xkvVLt2r+ZGoRKJikqFGOFOMe4kMF3LD50WriSTnjKk2hZKMewHtR8EuWNadMEzCI0iLo1XYR4kYriekUhNPjy84/rj9OeUO7UY1O9YfWef5XPHfkI7dG49NYet6djoLnvNrO3nhmIHNI3c8DrJ/deQT3lB/yAbHuqiBkcVZTjsBxd2vnynt8xPxW0Q6YG9nFZ4eFZJqEMh9hKs24tHW9xrSgxTUJTLFbR/6IPdQD3taBK/OBpwuFi0Fy0xpf6YjC3Wkb47zu65fWeCAbSyOr9S67XUlNbpKHai/j/ceOH22j1hnaRyJ7WeDbRAPEC9rJ64CqiWnWFwKNrXHxYzZ982eq89ucow1OK4fc1yPaIiUp1IiFtbMTlDVDCVHgwKxK8dM3+VaWUx0eIe7QLRZyJ0H2RInPDB60TZIKT6FsjXSnruk8Fw2UkodgPptSlqqwVO/wUtd1UMh9XGcGurXsLdwCvaoJAAI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(40470700004)(46966006)(36840700001)(41300700001)(316002)(44832011)(5660300002)(2906002)(54906003)(478600001)(70586007)(8676002)(70206006)(6916009)(4326008)(8936002)(6666004)(40460700003)(82740400003)(356005)(81166007)(40480700001)(1076003)(186003)(26005)(336012)(47076005)(426003)(36860700001)(36756003)(86362001)(82310400005)(2616005)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:49:03.0987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d698fe06-80c2-4ea7-8868-08db6303294b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6216

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
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


