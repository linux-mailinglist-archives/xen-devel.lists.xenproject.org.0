Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BA371F768
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:57:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542853.847265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4t6n-0004LH-2l; Fri, 02 Jun 2023 00:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542853.847265; Fri, 02 Jun 2023 00:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4t6m-0004JG-V3; Fri, 02 Jun 2023 00:57:36 +0000
Received: by outflank-mailman (input) for mailman id 542853;
 Fri, 02 Jun 2023 00:57:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syZ-00018B-8O
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:49:07 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e88::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4675de5e-00df-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 02:49:05 +0200 (CEST)
Received: from MW4P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::30)
 by DM4PR12MB5358.namprd12.prod.outlook.com (2603:10b6:5:39c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 00:49:02 +0000
Received: from CO1NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::8b) by MW4P222CA0025.outlook.office365.com
 (2603:10b6:303:114::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Fri, 2 Jun 2023 00:49:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT110.mail.protection.outlook.com (10.13.175.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:49:01 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:49:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:49:00 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:48:59 -0500
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
X-Inumbo-ID: 4675de5e-00df-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TauGtZi1ivIHOeFQ3l6inG9iV6k3zV2VA73TNg8zza5eqMjxBMKpz8tWk/qS+CHi+t/mM9vLOTcv7qszMss/jdEuAiU41BZwEOkd0IEFSGLfscIY+YpIGabZJoI5xfnNJCX2N3OdMrb/72m7z5ONJsd4d5/t106i/S80ueEXS7knnMEaiEdrhRQCz7YBTGWWWHmfeRvG7rsPoO+m29YISiXuhAbMJ7950kAYsdWpXRLC1Kik096HZWpdElGJ3+gdmcSEP8QitNwumWPfB7Hc+dXV/b6O4dxf+9VLyPFCjcQ7v2V4jESkUxvBzZfWLSChhClTBdp/Z0Xqe/j9q4RWGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZGk9VcPBJGLjL1ph26BvCEzkwM9dKWSwelsy6V24KU=;
 b=hX+H4m41p2e34ujKPSZ+Doykr3pOBI5eJCK3C5/6z9GLoESDWwZEsGEAeO+OSu0ljqMP7C/z1eZSc17WEcQlKFR2XiCjYocyC54wV8GazCj4qUMl4oZb3KkUzTWzSWX3pgPnMcO3VwzPzupepM9aJSwGgVIeFVQSaexjPx9abHj8GYxm/D8JjCct3Mnv22oR1RVj/zjKUETxvTEwFOSlJTBKUWjAo6zgIbTfoTcuqea1NBMOFTsyAft9DNXtHvRh/Tzf6EqlZx73QfkFFaWBO7nM48mq/ZxKCWapuewCJFtFcvq7zfCyPzsyeN+CX5+7MVkfWDs3maPvs7VGFz3AXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZGk9VcPBJGLjL1ph26BvCEzkwM9dKWSwelsy6V24KU=;
 b=dWPT2bYrFbENwMIvJLlkzUxMzkDFfe1dRX9sM6f2uFLctJKFhNj3Coc2cK6+OGhl5nR152wiRnShIY92V1EZsAQBDW7Arc9eDz6C4uryNwZTUNrRfDyYOAC+ylOSMbgUYwp0pyJy9rqHJ/AJ0e2yZV0mm6l3xsOfTk24nKvknmo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][PATCH v7 17/19] tools/libs/ctrl: Implement new xc interfaces for dt overlay
Date: Thu, 1 Jun 2023 17:48:22 -0700
Message-ID: <20230602004824.20731-18-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT110:EE_|DM4PR12MB5358:EE_
X-MS-Office365-Filtering-Correlation-Id: 90157362-c37e-483b-0007-08db63032845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9PpV3p1v7aloBea8/vLI+nUSwJj4tWOT8cxE2OWrNSrDEnA++NiYzMzM1G0flPrEGa47ybWsz98DFhiLykZw0myxcTbOmBguo4V6NbDO6nc3WE6doXt7HP1RJNZN8fVAQ/yk80EojmVUGUpXzYXrSrWRCaqE1KOkKEsLf9f/RUbGOv4IJmQozDvzlcScJPnoGBbzx6Gj/lOPcQwjQ9x4Ez+v85TI4g56lbTxTR8Xtg1hatd/1MK+scqJS7kcuaO4MJBFgt4Zc0erDQkCaxr5GttkQTivPO0QhfjBXIMMrT8SDY0pR6mJKb19Lf+UeGkMA+w7vdgVL2SoqCTqVw73HYICNDAjoKSGzrolLCC135+J88lR7/MsQ7V0fNG7rQmsQfWxudG+2bsTVagePKCr/vdqrEv4h5ntdbUSJVKmT7FuV3pdvs+sNsuLwYU9aqp9yBYzqi+2T6bm5K99ZJrWJCXOpO5E6/4Md70TJ8nbLf6xw+XFAJ+G+x16TxTFCw/LsqcXm8wBZ9vSjNhzu8IiXdhh6aKl4PYMprhKjN4wL82h21om9hsdPgRwlq1OCbq0p6f4YRejte5yo1ONi3eSLCNrtfdEhSAr6I9kRxiidNyNIU5kQU8oWH5cY3D04YTj+iJJRP8X+J1hMLeEhUiHyS1GyuvHngT4i9xdLbs3ptZO4UGsxa9C5OZb33tVZChAu7Ouk8EGK6RsHDcLpe3Hxzk5pKb8gSW1Y7bJ+/jo1m4SnZlZo4JNzIlkFmKJQvv8xR4qShXmM66UCKVH35P9tQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199021)(40470700004)(46966006)(36840700001)(81166007)(82740400003)(36756003)(356005)(86362001)(82310400005)(40460700003)(41300700001)(8676002)(8936002)(2906002)(1076003)(44832011)(5660300002)(26005)(40480700001)(186003)(2616005)(336012)(426003)(47076005)(70586007)(478600001)(70206006)(54906003)(316002)(36860700001)(4326008)(6916009)(6666004)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:49:01.3157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90157362-c37e-483b-0007-08db63032845
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5358

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
index dba33d5d0f..411f7ef04b 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2626,6 +2626,11 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
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


