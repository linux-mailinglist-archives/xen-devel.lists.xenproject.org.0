Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67934D21DA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 20:47:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287461.487517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfnz-0005kc-62; Tue, 08 Mar 2022 19:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287461.487517; Tue, 08 Mar 2022 19:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfny-0005hz-WC; Tue, 08 Mar 2022 19:47:35 +0000
Received: by outflank-mailman (input) for mailman id 287461;
 Tue, 08 Mar 2022 19:47:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RGf4=TT=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1nRfnx-0004Om-16
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 19:47:33 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 974e7593-9f18-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 20:47:32 +0100 (CET)
Received: from SN6PR16CA0066.namprd16.prod.outlook.com (2603:10b6:805:ca::43)
 by PH0PR02MB8732.namprd02.prod.outlook.com (2603:10b6:510:db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Tue, 8 Mar
 2022 19:47:28 +0000
Received: from SN1NAM02FT0027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:ca:cafe::33) by SN6PR16CA0066.outlook.office365.com
 (2603:10b6:805:ca::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 19:47:28 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0027.mail.protection.outlook.com (10.97.4.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 19:47:28 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Mar 2022 11:47:25 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Mar 2022 11:47:25 -0800
Received: from [172.19.2.115] (port=58782 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1nRfnp-000Cws-8n; Tue, 08 Mar 2022 11:47:25 -0800
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
X-Inumbo-ID: 974e7593-9f18-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SW6n1ovMxpxPmckryBrLGZY6+5lXFjpDr1XbY58aLAgFaciVcePgo09O88u/CDqc1y5nKenQstGng+tt6F1WbwrU5/IsEBJeYOVwjOVUsrl3dWecR49n3lacyYXzq5LI91BP0V6u9IVBgv0XckWMrqiMCGXkjVvzLsZiES9HsNjxlc9aFLYAXCwVfW8VMkrJoaewcnxL367SGeg2FW9Fls0dON7xHiN9k+CFbv3JVQP/uN6UOZagcxoz7PiiEIFUbFpPRe8REago3Fc6O/SzFcuZv1vhht9P7UNtqrHXHc7RNNfAysQ201JlvKuIqKUlaRLp4tvEExgv7BNeonLZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfEqKpmJRR5O6DgmlR17CSpSZiZGd6fXDbnnsIWjXck=;
 b=huzsMQmbP/wzhvrRzEyVd396KlOwbWmFHFqWXm3FdTUE4lfgMpszmvy5ecv6/1c6a70ANnpNRopYinUOpm/BcYpoQ4HZ1mvsVXx3ftvRTVm7AE76fywjzs99/Dby7cy5zCpvNl0LZjEtjR4tQ4/RfqB9ObVqoLBtVOjjF6qSf2xYlmhV3d7CRFofnglMBw1IQxoFOTCU7tB53o98oMu1MnAGPH/2p6YEZMmU9feWku6am5pj8fgdpmPj1Kg39PQONResJezBOT0Qmarct0CfUxwCl2+FA3EIRmtOCDi/sMr+L8XmnZPMhxSuk20a2P1o+4t02u+mGq+T0tPPdpyoKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfEqKpmJRR5O6DgmlR17CSpSZiZGd6fXDbnnsIWjXck=;
 b=kkESmhVov3/WUVgzrBubA+XlXU/w+X7ojt2ijb8aU4OaMP5rxjwhoeVsmjimFHDtnS+ILbfjM46IEahd7NOJEhju2Qm6ptXk+lZMHTkAMOrvI7ku43hsMR/a+5l2H1ELVJWH7LhabIsat39YV2TvldX2KJIVfNd7IWNK3LNJs2Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN][RFC PATCH v3 12/14] tools/libs/ctrl: Implement new xc interfaces for dt overlay
Date: Tue, 8 Mar 2022 11:47:02 -0800
Message-ID: <20220308194704.14061-13-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308194704.14061-1-fnu.vikram@xilinx.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f6aaedb-1a4b-4154-736a-08da013c79fc
X-MS-TrafficTypeDiagnostic: PH0PR02MB8732:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR02MB8732C9DC00376589C1C51141BC099@PH0PR02MB8732.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QhO8XzGx9rykcAndvVDyOtxgbWPAt8XNRO/730uxTPPV2tBhthZ2q1blWJ9s2PXsfMobQ97am8n9XmEq2CSH95X1IOIExZ1g+DoTys7RxxbZYI8XSNBFKXNomdtK3vFAUp7+1ZaCbdTdvfnttwbDaAPF3lW+ykFx/Uwd4+pp5wWNgYwfLwmu+AlHD5IAMOca493dsqFEZ6+E28Nh1e0gYeqV/8SpchK54hi+nk+rySHGYs9G5YDUdPwHcVUqQEg7DfTnab4TzVjkbV555atRQtfC2DoyOb/AicjuaT+BJ+n1Dvqxgwwj7WKlKpZBgC5qiv8/QYDVCeuKFOMT1bE1vdlN8ydm8KmbQEpHGF2r2EvCocrIrDidWkbaXPHSVanO6fckccVkzB1zeJdtDTyNtBdS5wN3VrDLu99tKvdqCEhMBeG/SIOmSecP8egjTMwG5VNjZGIM02uk2++EdQQL36z195N2Im5IJvTrEMZ+h46pRpVxhvoaQd8zwPOPofi4Ymj5nPv9BZwGI8rgG/njbbKCr6jVJgKvmqHkTF9lBKuosE6SewPcMFKyIm7a0YgndCBD3vEerdhbFgO5SljBrh508zh75btW/hqGdsSMkkoQCuZAVHfDC1vp2fObax5xrB9VkJW2Jad7i47Ky+6Zvd9SUlb8CnFRXe7QjRQeG5jwucjTmr9DiRqo2bnHSLYiRVLg9zBgzvyC8SJJgaT+TSdOHBXWeWnGbQ4qjqmYHIHnIBXuNY8Nd4agIKTNYt36t6KxvhUpRhp0OioZYzB9weYICRJadAs+5gJ3vbcZrfm/4opj96n6So+pMOACko6s
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(508600001)(6666004)(82310400004)(7696005)(9786002)(1076003)(47076005)(186003)(26005)(36860700001)(426003)(356005)(7636003)(336012)(2616005)(5660300002)(8936002)(4326008)(8676002)(70586007)(70206006)(36756003)(2906002)(54906003)(6916009)(40460700003)(316002)(102446001)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:47:28.1662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6aaedb-1a4b-4154-736a-08da013c79fc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0027.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8732

xc_dt_overlay() sends the device tree binary overlay, size of .dtbo and overlay
operation type i.e. add or remove to xen.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 tools/include/xenctrl.h      |  3 +++
 tools/libs/ctrl/Makefile     |  1 +
 tools/libs/ctrl/xc_overlay.c | 51 ++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 tools/libs/ctrl/xc_overlay.c

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 95bd5eca67..b7552d0d9c 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2629,6 +2629,9 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
 int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
                          xen_pfn_t start_pfn, xen_pfn_t nr_pfns);
 
+int xc_dt_overlay(xc_interface *xch, void *overlay_fdt, int overlay_fdt_size,
+                  uint8_t overlay_op);
+
 /* Compat shims */
 #include "xenctrl_compat.h"
 
diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index ef7362327f..848a8737c7 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 SRCS-y       += xc_altp2m.c
 SRCS-y       += xc_cpupool.c
+SRCS-y       += xc_overlay.c
 SRCS-y       += xc_domain.c
 SRCS-y       += xc_evtchn.c
 SRCS-y       += xc_gnttab.c
diff --git a/tools/libs/ctrl/xc_overlay.c b/tools/libs/ctrl/xc_overlay.c
new file mode 100644
index 0000000000..8fe780d75a
--- /dev/null
+++ b/tools/libs/ctrl/xc_overlay.c
@@ -0,0 +1,51 @@
+/*
+ *
+ * Overlay control functions.
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
+#include "xc_bitops.h"
+#include "xc_private.h"
+#include <xen/hvm/hvm_op.h>
+#include <libfdt.h>
+
+int xc_dt_overlay(xc_interface *xch, void *overlay_fdt, int overlay_fdt_size,
+                  uint8_t overlay_op)
+{
+    int err;
+    DECLARE_SYSCTL;
+
+    DECLARE_HYPERCALL_BOUNCE(overlay_fdt, overlay_fdt_size,
+                        XC_HYPERCALL_BUFFER_BOUNCE_IN);
+
+    if ( (err = xc_hypercall_bounce_pre(xch, overlay_fdt)) )
+        goto err;
+
+    sysctl.cmd = XEN_SYSCTL_dt_overlay;
+    sysctl.u.dt_overlay.overlay_op = overlay_op;
+    sysctl.u.dt_overlay.overlay_fdt_size = overlay_fdt_size;
+
+    set_xen_guest_handle(sysctl.u.dt_overlay.overlay_fdt, overlay_fdt);
+
+    if ( (err = do_sysctl(xch, &sysctl)) != 0 )
+        PERROR("%s failed\n", __func__);
+
+err:
+    xc_hypercall_bounce_post(xch, overlay_fdt);
+
+    return err;
+}
-- 
2.17.1


