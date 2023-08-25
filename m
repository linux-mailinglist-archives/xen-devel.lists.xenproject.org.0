Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AD87881AB
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:11:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590677.923069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRui-00043r-8n; Fri, 25 Aug 2023 08:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590677.923069; Fri, 25 Aug 2023 08:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRui-00040j-5g; Fri, 25 Aug 2023 08:11:28 +0000
Received: by outflank-mailman (input) for mailman id 590677;
 Fri, 25 Aug 2023 08:11:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZRnP-0007GZ-Vf
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:03:55 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee93e141-431d-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 10:03:54 +0200 (CEST)
Received: from MW4PR03CA0250.namprd03.prod.outlook.com (2603:10b6:303:b4::15)
 by DM4PR12MB7741.namprd12.prod.outlook.com (2603:10b6:8:103::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:03:50 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:303:b4:cafe::6b) by MW4PR03CA0250.outlook.office365.com
 (2603:10b6:303:b4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27 via Frontend
 Transport; Fri, 25 Aug 2023 08:03:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.2 via Frontend Transport; Fri, 25 Aug 2023 08:03:49 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:03:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 01:03:47 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 03:03:46 -0500
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
X-Inumbo-ID: ee93e141-431d-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HduS80hfQ0RwZJd0/kGyZfPxMKe3oh/7ym6qJXU0D0uXxWrIM8NTXtk7KEfWYgNhPjKz0mTUxNkFLhxN7P5NEtEs2M1SRRm76qB/rR1tlxP7EPlDS3BzM4jjW/IL0+T4VX0RnfNIwbH77FVuJHYt9Rmpq+YH0a0Wk/r+Y412WORSEYVI8IdsU6lgquk3yM1gzrQYE2ZGojQERCtxKfkn7ope9VhmlwjfeJYtaJ3w4txdZ81eoXiMzSWT9betNQJ42mOHS7Vp85nnZhouef7tSozVk1QAJRusVePqQmovP2UoE4OWMG08y2NfmuuEzI/CcO9qicdM1l84Okfmlp+goQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/se936Ujxc8NjdpD2oq8brh4lkajza78rV0iq3rKEiM=;
 b=Kk5A+8cuq7YC4VIHwTP/pAc3H45XHLYb4kCqIreJkFE03agFifiwJEgLKMNskc4diGGiry2ehvoP+yMVCo5+xYaSgE9z5yOLokLi2z21km3tT0lnPaFzewLjKZuQmogpzuT2y5R4RgwS3MIA2kLAMvWpmQ5/OsbObONrgTzOP4DPhXn1wU/IeUMBcgAKLd7/DM7/uP0N6drjLo3361w5h3sYV1d1IP5WVfUyRRSOtgsLkKQ+deWdYgTFWgI4Nwdv4dV7vdMIhWBcodHWRwu7tJeiAAp3D9RpAOzLNfwCISOG9kOyMdLQsEPkVlbQEkajTfemPcAB016A6MLKUb1ZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/se936Ujxc8NjdpD2oq8brh4lkajza78rV0iq3rKEiM=;
 b=ndeV2ql1xIc9PaY3udxvRiQw9/KhcDbmHx4PlijIZ1XkZBE1C/X7mPCitbcpoo/Rn3bQO6r3Fp7wuY+uSH39Gzxwk+b6T8W7gTI4ojI+GV9qdXUZ0g/gZ0R0SiyvyBK82SPbwLeZY1oEEi5K0vVU/bdHPn+ScFsLK2ufSnIGUDo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <julien@xen.org>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][PATCH v10 18/20] tools/libs/ctrl: Implement new xc interfaces for dt overlay
Date: Fri, 25 Aug 2023 01:02:20 -0700
Message-ID: <20230825080222.14247-19-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825080222.14247-1-vikram.garhwal@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|DM4PR12MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: 271ee5a1-108b-4bd1-6d56-08dba541d0c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gl4nc7i3IzLezFZW3pdIAD0X9FAznfF5Im7s0Ba02g3aMLdXYjkIZx8hgaS2OuaBxaGKv7RasXotEo2gd6kYcJUPsPA+3W/zpWhEmRwj+uzpbVjflf3prk00I38lKi9R7D/z08rBWIir61ll8uDV2zwoDjWHJCljZm/GvhOZb8NoYG0AFgEB2cZld+QHCJd+kgChNxXzSa/uHjcZ7gBCK85FMObyrKBq1L9fjsORzlmowzRMH6IrD+QVX+Z/a2b6qO3fpMI5qnO9vGmO2Pt9FIK+rm4mUjhwi/VYQCbhR6u94fxaXevurCL5r2LjV3C+sS43KyeQiE9hpMhJZOY+A8TNr7X6xgFRd4dWpbHnySUICqapsblUndKJ6BaqZC7XlCMy1YQxHEGIdBzUVwu4ulflAacSJeBD7nNB64yBY49r4XZ4f4aLF+SIK6xek2uG01f5KMCTJdt22YLyOYbhDlChJSg0LJo1/nnDAMHM4KkUQfRA0mRMJJ7osqdAWjcKPySegFG4o86XAf3nFxRV0PR1NrHd/ibSWNSKk+fw91cKUh/4V/sayG7vjLFvnDJxMkPTd6po0T8DCmmuNU2UBn0XAsuRIQI7DC0xfTACGcoApfSTh1l8Yp4cjRD7riU6J3m15p9aEKf0gEYynkmrh55Udiw2F4sCinpNt7B+Zn8NsNvFB3AU6Drpuf6ghEMPrPP885e/3ES7Os4u86ldU6IPmWDeluQQKw9b1AL5n+BSDfDcM5mjxXNiN2we1n+o3Cm25LJal6ObLTgv/J4L61IcuBk1bKGD+f05KX3k5MQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(82310400011)(186009)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(1076003)(40460700003)(2616005)(5660300002)(4326008)(8676002)(8936002)(336012)(426003)(47076005)(36756003)(44832011)(36860700001)(26005)(40480700001)(82740400003)(356005)(6666004)(81166007)(70586007)(70206006)(54906003)(6916009)(316002)(478600001)(41300700001)(2906002)(86362001)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:03:49.4770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 271ee5a1-108b-4bd1-6d56-08dba541d0c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7741

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


