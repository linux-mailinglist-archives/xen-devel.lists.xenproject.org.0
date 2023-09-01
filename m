Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC4778F7E0
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594325.927656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwS2-0006sP-Cj; Fri, 01 Sep 2023 05:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594325.927656; Fri, 01 Sep 2023 05:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwS2-0006jy-5c; Fri, 01 Sep 2023 05:12:10 +0000
Received: by outflank-mailman (input) for mailman id 594325;
 Fri, 01 Sep 2023 05:12:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbwGt-0001Hn-FD
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:39 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b152e34-4884-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 07:00:34 +0200 (CEST)
Received: from DS7PR03CA0168.namprd03.prod.outlook.com (2603:10b6:5:3b2::23)
 by CYYPR12MB8921.namprd12.prod.outlook.com (2603:10b6:930:c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 05:00:30 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:5:3b2:cafe::5a) by DS7PR03CA0168.outlook.office365.com
 (2603:10b6:5:3b2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Fri, 1 Sep 2023 05:00:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:29 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:29 -0500
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
X-Inumbo-ID: 7b152e34-4884-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=br+vnSfFGe89wBRfE1hfe9zveK1u9F1Iq8b0lCb/nbOKksW5AheSyhg0LiOSS+2XPFpA+jBvWSe+jHuMRhxXixc0Ar91uXnO4LU+QU4qmelF0jzb9THMjFxgIOs4GT1glEuuhCpg6B6oiRCkOZxxZRUygyg7VaMH8TGX3141o+IT+Q/NLVSOzNjKhYv0Q8VGzMcJ30CrQgRAaASgdcIT9jZvzquLnMf9uwMPnJDm4CK/Z5ql+MLXejX0gB7GJjm2SFm9g9jrSWC6bEMipEGefpDWMocuGNlBgDSCMOWDLHDsbK4Glgyz7SykFwOdxc6Z8sy+gor8W2DBcLjYkLZTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3CXFnL+4aLIWZtU9p5mMJcpke4wuyPy6FqvOY6YZ1o=;
 b=ZYQ4qbXcuRQ5T2XIbqn4ApBVIoRq9noZWlen+q+VBeIcpoH1xMV9BzdV2rYR1l9yaFJVPTWy+nhd7uxFAccef9c9YB8RjyXZgc35jNa3Q7v0u/Db9Ve1njSuazr0C+uRapfJO5evYLHw3hOC15a70QcI6FUjFT2sj/T6RaryT2m3uULwBwfRe77DEJysIOYTvRow1v15S4w5kYjwFZOa42rhIj+v7UQ58VhEo1Gpznq5b9BFArQqfR1WGITK62+QKiF7tysheZIoR4G1R+5+730Ja7TDyIyGsLLTDto+uE/+qS8C8WajQ1UdqGjfYibaDP8kXmfYhIGBv+uFloZbsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3CXFnL+4aLIWZtU9p5mMJcpke4wuyPy6FqvOY6YZ1o=;
 b=GguLGdsVWl7X/nGtZ1nYh0L/CIk92WxYRzCYP5aSrdmUALqURTuiDlvOB58jIZyU+GTaaGOwm0hs5r0iuf7ZTE37dYIuMjCQR54BT3vlqgjvdsNW2xSz1Q4jM/VqF1+OsB941r9rIkGWP7u/uixAvjF5ITz8WRAZzaT1hgtsCkg=
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
Subject: [XEN][PATCH v11 18/20] tools/libs/ctrl: Implement new xc interfaces for dt overlay
Date: Thu, 31 Aug 2023 21:59:45 -0700
Message-ID: <20230901045947.32351-19-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230901045947.32351-1-vikram.garhwal@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|CYYPR12MB8921:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2dd0b3-e953-4150-3d3d-08dbaaa85db4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MvRa/6J4rDug4nsKud19NijEpszhflc0hexeCt0gli0S3WpmOEdsyImkaLc34KHmeCwABDsDgbfx5qu6cF5/vyskpahSzfuC4BiTIgTqf3iIObGAqhhKdssmcqJeMvbyypW9wcdPSLocspjEDFTpDR3RxYd/EQ3k9Gtx0sBAOHSx+a6UWhQpGwdDsnucdc+8iFlGyaVbTA5n3VIWSQBqu1POSZNLp/2VpApunUqPf5TMvISJ8e+H4lxFlyTbYZWntq3wHnRtYzKijIjSqn4IoTof9vrsIafrsjJLA5/FZk9WA8+R7LnOjmxpYCNxo8boQ6rRSODCfbMKnHPlu0meFea/Sv7HdovP50Xgq4H20KQ8lIhFeiNNNFphcholy684ur02+kuqaK4tNgojJlFvg/x+ATbsyXT4GTY90nUizFgaADsEeU+xHEEmd3NDjoCxAktfAWdvb9IoE7hHnmoN1hR5QKX1V3CtqUwXPcngJNBphG+h8QehK0OpvmF0Y0bki2pEBWR/41rJdxcOXm2BnAA5YeDYPwkCpaBXitwVen+BhJibexgSK+TaYz5eLZ428HghDwWeFdinILpYYbSohKRLJBBUYhVd18ZMUb8Z0WtR2ekNz/i0e2l6vT6RLDb01yWsKAQnLG78cdjAK7xmT05MKJy3xJkPSovU4mg+DStg4exY8xGvz8//6+H0ZAXAGvzVNfi7b9nu5CCBJYuNrEJ+MCzceXK/yRNXR62b6pB/pMWpSfYp36+F0IUIDin6oBXWMn4M7rsA9f66ok1Ia8boTaMmjNx9aUhmBzPEVTQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199024)(186009)(82310400011)(1800799009)(36840700001)(40470700004)(46966006)(356005)(82740400003)(6666004)(36756003)(40460700003)(86362001)(81166007)(40480700001)(47076005)(36860700001)(2616005)(2906002)(426003)(336012)(26005)(1076003)(478600001)(5660300002)(8936002)(70586007)(70206006)(8676002)(4326008)(6916009)(44832011)(41300700001)(316002)(54906003)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:30.5284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2dd0b3-e953-4150-3d3d-08dbaaa85db4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8921

xc_dt_overlay() sends the device tree binary overlay, size of .dtbo and overlay
operation type i.e. add or remove to xen.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/include/xenctrl.h         |  5 ++++
 tools/libs/ctrl/Makefile.common |  1 +
 tools/libs/ctrl/xc_dt_overlay.c | 50 +++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 tools/libs/ctrl/xc_dt_overlay.c

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 12dca13b69..2ef8b4e054 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2653,6 +2653,11 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
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
index 0000000000..c2224c4d15
--- /dev/null
+++ b/tools/libs/ctrl/xc_dt_overlay.c
@@ -0,0 +1,50 @@
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
+    struct xen_sysctl sysctl = {
+        .cmd = XEN_SYSCTL_dt_overlay,
+        .u.dt_overlay = {
+            .overlay_op = overlay_op,
+            .overlay_fdt_size = overlay_fdt_size,
+        }
+    };
+
+    DECLARE_HYPERCALL_BOUNCE(overlay_fdt, overlay_fdt_size,
+                             XC_HYPERCALL_BUFFER_BOUNCE_IN);
+
+    if ( (err = xc_hypercall_bounce_pre(xch, overlay_fdt)) )
+        goto err;
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


