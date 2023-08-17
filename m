Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F07D77EE74
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585044.916065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDb-0002bG-D5; Thu, 17 Aug 2023 00:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585044.916065; Thu, 17 Aug 2023 00:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDb-0002Uj-5X; Thu, 17 Aug 2023 00:50:31 +0000
Received: by outflank-mailman (input) for mailman id 585044;
 Thu, 17 Aug 2023 00:50:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR4L-000280-GD
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:57 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8fed452-3c96-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 02:40:55 +0200 (CEST)
Received: from CY8PR12CA0040.namprd12.prod.outlook.com (2603:10b6:930:49::7)
 by SJ2PR12MB8009.namprd12.prod.outlook.com (2603:10b6:a03:4c7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Thu, 17 Aug
 2023 00:40:50 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:930:49:cafe::ac) by CY8PR12CA0040.outlook.office365.com
 (2603:10b6:930:49::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 00:40:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:49 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:48 -0500
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
X-Inumbo-ID: b8fed452-3c96-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qcm+y2pTwXs8njTbMNWCgMDWcrsZSWJ68nlqxEpFtmiQyCDhZvfcPBd3Vf4dgGZ5fuz7eMMPaLX3Pj9VF0qDwQ1kc55lpfC8TFJpyPcbM/lRJFFP8DW+xpUhavlPcyd02rLpOaZbC72giheCSgOxy/3+u5VtuEcSrE9iFtKHNtscNt0Vn8PQxV+ppYorEFxQZgUjkh4tufAKU2LUruYX2uvOdjX1IGVA6gCLstG59WxUJIJhqfpS/b7R2I0oljmsBRfatXaY4UFJn8QAy9qjiCLClAnW0vyIe1zn6QQRaf7YhoYDEJBnc7S8gfOJ/DGerws9+mqTWrP+NQsFgkHP9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSMRF97QlKBb4iu384YTAKHEZ9yf+f7ss37J2EfX8aY=;
 b=VTitIQwA7optyatii0KSWzgghiSyBOOHKAV70dV1xGvj6pDRIH6/Er4PN+zmjO4xyqVxQAimkIoZavzYGQXAt0Z8QUbDJ22EUcvvNJo2H3esbhX6Lmam/ZOopzbWir52zCtgvHeF6EijujXAndc2kpy6vGM/HHSP8V0IkGiwclvFCRWAPK2JbFYjn2u38jhuhVX5S2wYfeZbs9ZBYA8VBiKi9OpNW4Z+6jH2BT7a4FnQNwtmF94Y21xQ2ScLlsl+a0QZT/sZ90w6vAp8RrCu2JjaZEDN0C44iiLDSMsx3pk1RR+z8RMj9G81d346rbhOcx87sRxx+ZGx+iWX+07PBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSMRF97QlKBb4iu384YTAKHEZ9yf+f7ss37J2EfX8aY=;
 b=qYD4FlY9c8V5d4r/8ALnxd92D/0nVvvW6Q6/pAPaVONq2TWj0gi4dtyzrrW97YcShigEvshMAS4lnfYQjmiOqsOssxpc4OyeRe0u2u81Z9G5Kk3Hf1F3u02Uo3QYL8CXYibu0psmTY5bEId2iErAFij8tY680vsO1Tucj/y2iF8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][PATCH v8 17/19] tools/libs/ctrl: Implement new xc interfaces for dt overlay
Date: Wed, 16 Aug 2023 17:39:45 -0700
Message-ID: <20230817003947.3849-18-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|SJ2PR12MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: 24576dce-386b-4089-7b14-08db9eba9abd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	33KCuYqF4YXXGidB2WHCu5XhWP6P5YuNPAjg+CCWSw82AplDLAlHERu1vaNIGErKjyCSIyV54jhBzh3lSErgNK8zeeWyVsaQaXIydG6VtjLk+VZpthFjiDRm3hvfZ7VcMyi4tHGgS1cMxAnZlyVkpMX84Ip8hdoz179fUGPQfYsCLpLxyZcHl5QSOiT97x5FEqqB/QzbQKwCqTlbCGqU6PU2Tqw0kqqj0m/oGmhKl9A7hcOQ08R2EyKWTZSaygxF8XUoxV4VyoeFNOChn63TiadEegqKtYd+5vphEJgngcCnw+ZzmslURFOkKACZZnc3rhv+mQrM3dBSXvUt/FoHTt0ePdeCwkpNq2FTB1djptFrGuacY0yUue6OK4T7QIZYxCVyPM1sN/635aPPjIt7H8wecmVOXZM6iYNVqUjaO613+O4rBkN0QX9iGI+gU+HCF+rZXWTyMFVTFZbiWkgpyddGiGgQ7YIDu7AKYEUwk00cN6wNZ5JeijdMUVv3RfJN3nPHmdC+m0xNxaXGocxeONnGd+WC8uJglpSF8l4sJwVr9SdijnJZxuIsemn6qjnZecEZll0hVhbYtmkvOdGcBQara2u6G9HTR+61tw5dJaBnIO0H36Qrpdb3Z17fpl5WT9iH7JIwPaaSXNLcTJLw4wApdMnZu5rPBxNNIg6WiWYm6XbuO2x1b1vF7jU5cF6Cl/D9n1WfLfLO/HBS4siBi83exEihoiEhn1w/NvsA/dMUADlhVUyG0mbLoN0pYYdLECgh+8Un2dtypse3HdiZMItDWLfOfv9mi4YOF2wJMVk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(316002)(54906003)(356005)(82740400003)(6916009)(81166007)(70586007)(70206006)(5660300002)(41300700001)(36860700001)(44832011)(47076005)(4326008)(8936002)(8676002)(26005)(2906002)(40460700003)(40480700001)(426003)(336012)(478600001)(86362001)(36756003)(6666004)(1076003)(2616005)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:49.9334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24576dce-386b-4089-7b14-08db9eba9abd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8009

xc_dt_overlay() sends the device tree binary overlay, size of .dtbo and overlay
operation type i.e. add or remove to xen.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 tools/include/xenctrl.h         |  5 ++++
 tools/libs/ctrl/Makefile.common |  1 +
 tools/libs/ctrl/xc_dt_overlay.c | 51 +++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 tools/libs/ctrl/xc_dt_overlay.c

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index faec1dd824..3da602586c 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2643,6 +2643,11 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
 int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
                          xen_pfn_t start_pfn, xen_pfn_t nr_pfns);
 
+#if defined(__arm__) || defined(__aarch64__)
+int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
+                  uint32_t overlay_fdt_size, uint8_t overlay_op);
+#endif
+
 /* Compat shims */
 #include "xenctrl_compat.h"
 
diff --git a/tools/libs/ctrl/Makefile.common b/tools/libs/ctrl/Makefile.common
index 0a09c28fd3..247afbe5f9 100644
--- a/tools/libs/ctrl/Makefile.common
+++ b/tools/libs/ctrl/Makefile.common
@@ -24,6 +24,7 @@ OBJS-y       += xc_hcall_buf.o
 OBJS-y       += xc_foreign_memory.o
 OBJS-y       += xc_kexec.o
 OBJS-y       += xc_resource.o
+OBJS-$(CONFIG_ARM)  += xc_dt_overlay.o
 OBJS-$(CONFIG_X86) += xc_psr.o
 OBJS-$(CONFIG_X86) += xc_pagetab.o
 OBJS-$(CONFIG_Linux) += xc_linux.o
diff --git a/tools/libs/ctrl/xc_dt_overlay.c b/tools/libs/ctrl/xc_dt_overlay.c
new file mode 100644
index 0000000000..58283b9ef6
--- /dev/null
+++ b/tools/libs/ctrl/xc_dt_overlay.c
@@ -0,0 +1,51 @@
+/*
+ *
+ * Device Tree Overlay functions.
+ * Copyright (C) 2021 Xilinx Inc.
+ * Author Vikram Garhwal <fnu.vikram@xilinx.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2.1 of the License.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "xc_private.h"
+
+int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
+                  uint32_t overlay_fdt_size, uint8_t overlay_op)
+{
+    int err;
+    DECLARE_SYSCTL;
+
+    DECLARE_HYPERCALL_BOUNCE(overlay_fdt, overlay_fdt_size,
+                             XC_HYPERCALL_BUFFER_BOUNCE_IN);
+
+    if ( (err = xc_hypercall_bounce_pre(xch, overlay_fdt)) )
+        goto err;
+
+    sysctl.cmd = XEN_SYSCTL_dt_overlay;
+    sysctl.u.dt_overlay.overlay_op = overlay_op;
+    sysctl.u.dt_overlay.overlay_fdt_size = overlay_fdt_size;
+    sysctl.u.dt_overlay.pad[0]= 0;
+    sysctl.u.dt_overlay.pad[1]= 0;
+    sysctl.u.dt_overlay.pad[2]= 0;
+
+    set_xen_guest_handle(sysctl.u.dt_overlay.overlay_fdt, overlay_fdt);
+
+    if ( (err = do_sysctl(xch, &sysctl)) != 0 )
+        PERROR("%s failed", __func__);
+
+err:
+    xc_hypercall_bounce_post(xch, overlay_fdt);
+
+    return err;
+}
-- 
2.17.1


