Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F74644A74C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 08:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223712.386626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkLA5-0003i1-1g; Tue, 09 Nov 2021 07:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223712.386626; Tue, 09 Nov 2021 07:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkLA4-0003Ug-5v; Tue, 09 Nov 2021 07:03:16 +0000
Received: by outflank-mailman (input) for mailman id 223712;
 Tue, 09 Nov 2021 07:03:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+rF7=P4=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mkLA1-0008WR-9S
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 07:03:13 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1925f301-412b-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 08:03:10 +0100 (CET)
Received: from SN7PR04CA0015.namprd04.prod.outlook.com (2603:10b6:806:f2::20)
 by DM6PR02MB4745.namprd02.prod.outlook.com (2603:10b6:5:fd::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 07:03:05 +0000
Received: from SN1NAM02FT0031.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:f2:cafe::3e) by SN7PR04CA0015.outlook.office365.com
 (2603:10b6:806:f2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Tue, 9 Nov 2021 07:03:05 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0031.mail.protection.outlook.com (10.97.4.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 07:03:05 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 23:02:50 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 8 Nov 2021 23:02:50 -0800
Received: from [172.19.2.115] (port=44056 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mkL9e-000Ga6-0h; Mon, 08 Nov 2021 23:02:50 -0800
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
X-Inumbo-ID: 1925f301-412b-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzW/NvmKvxmoNPyLTIGLQP//Vgg0VZ9k9PQx2XDXegxBcyUrSX/ppez/Jzcaxaj/1FGjmz/shZv9o46DNs0r2ppsPyT28M/Ip3AdGU18DHoais+/fS7eq/mQ/Uj7pMal4QbymqKH6fZXuwpYDnMmhqditHGPHDewMv/0OSXD9KX16bWM1TVFvBd7R6Qs1eLPlHF/LwBIbu9Xqw2OYn4y7CKdEQI6V5WCdEGM1hmVzdd/BAVaiWYyN/i5YUwFm3jIL5bXM4mpqxPSVj7/kkZkieLT3ldtFkGX/zVvzpFI0KmX3er6MOz0Q5yDtxEGfJ595luABKQpJyls0VRZxMfSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujbtJPA/WbrVfjNedBqDlhpazGXXQ7bSk/0Y/imNNWc=;
 b=dSb3QIHFXr4lVL7bZrkCzIJ8X8vQuKyKwbbNf222PAnK6zAljM4Ypg62axnnYdkxFCtDC6JvpZgNTCzLfpADKHpPgLvAo/510dJ5e9Q6vLV6HBdKkfqhsbLSpPE5od0dFL9Oj3rukP/LtvQVG/ZEgxUYgHp+C2tOW/Crig4FDmH5GKBUgdHg6Q6yog5jv745CPoyy77Y9ySQ0WSHFqDIM3K+NN53WUJMYFxcNetI0VcdWe0hFrAoImnDfHcjl4qRm4T04EiZrXrubBxMSuxN+n2Sr1SoHXjDzp3Wv2JWmKuik9seT9eR47l9teRR1Z0EPH9rp5RCC9Tc9IDRtGz5Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujbtJPA/WbrVfjNedBqDlhpazGXXQ7bSk/0Y/imNNWc=;
 b=EaXIpKaw8LiRQAXNY/d3rksmbHF/nVKJ1/5IJ2keLcDa8934QTeqCUoNaD/5SIMPBSM/7E+3o4zj0A0Njr/RihgEeVyXrt9mfSMjuA4u3V6U7+G5PLoN1jGsCqdE5IWpiAchc60rOA2w1fYrarETHgroTJdkeUI0a6APCrhavqM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN][RFC PATCH v2 10/12] tools/libs/ctrl: Implement new xc interfaces for dt overlay
Date: Mon, 8 Nov 2021 23:02:25 -0800
Message-ID: <1636441347-133850-11-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c29dba09-5c53-4513-132c-08d9a34efa8d
X-MS-TrafficTypeDiagnostic: DM6PR02MB4745:
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB4745944FC2596011667634F4BC929@DM6PR02MB4745.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pqNyJ9iOnux0HjCv7wMjg0hBvit40EHolFNkI6T037OwjxVYFDy9mVLFEKCYINMph+BFT9zAIrJfWdbpj4ALP1aEKs1yiPA3y8pVsLGDfmXHr1UIKuFa97910Q9fhcAHA5NssSFC6RJd0G2MtloN7kr7gN+X6lKdWRtsQnpHUnR97hY2+b6YdLPM3ZZ1GMaHelxC3HJ607P1Lr/bthrAXP1U1G5rYhBIY0FNVuIYk6Hyv4jFVjAP2VFATipC0b4sGxdtnyT1s9pZEvcTn9R0w5DrT7EcZ79bUorBipr+wQe8ny9qRCDZjdrq+a91fw407prO/qTUaPBNBupQ7KrP3Gsg3aSltC2CFlhyJj8v6z/BtVh4F7cxPMPgq5DmR0SG6t/P0C2g+/PuD6LypGPfCvmvzQfrvUMvCOzB9CXTeKE/sPGj+u4rb2zoer0WFbLOnelnRkl53SamCVEMLHrBGUROQAca99EhuYrgV796FLu8616zBcuGUgnzIPBLmhXGJHkm9CtDN2B6MXYADr923iiCFKwJi5v0YAoCYj62Az1pk7F8izu0YE23XLJWhMm0eqVkPVb/Dk+6IW70eh8JE2XOfeephoJQlkA/CskZvZ/Kh6uHY4l7cmwiGywpCBcaLx0eddVa6EXCGpK2Xsmck5l+UFMe4c1urTEytDJkEvp+qeWcPI/6p/6zymlDQ43bSYYbf1koZOZ6IwaMQ6GLBYM7+5RKtGKtzqkerhkRoB+rVcePOfFpkHoHdxHlRkyoVm74Xa5wt/wT6Gg/wf7EOF/9sx4b+qv4m1FDVFcBP9LLpMQ8JQqcnNqN9NIGoOxmzIcSRPGmdo24+kQ57PAAMg==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(426003)(2616005)(36906005)(26005)(8676002)(70206006)(186003)(356005)(4326008)(5660300002)(336012)(7696005)(6916009)(6666004)(8936002)(70586007)(82310400003)(36860700001)(9786002)(2906002)(508600001)(54906003)(316002)(36756003)(47076005)(7636003)(102446001)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 07:03:05.5102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c29dba09-5c53-4513-132c-08d9a34efa8d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0031.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4745

xc_dt_overlay() sends the device tree binary overlay, size of .dtbo and overlay
operation type i.e. add or remove to xen.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 tools/include/xenctrl.h      |  5 +++++
 tools/libs/ctrl/Makefile     |  1 +
 tools/libs/ctrl/xc_overlay.c | 51 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 tools/libs/ctrl/xc_overlay.c

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 07b96e6..cfd7c5c 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2684,6 +2684,11 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
 int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
                          xen_pfn_t start_pfn, xen_pfn_t nr_pfns);
 
+#if defined (CONFIG_OVERLAY_DTB)
+int xc_dt_overlay(xc_interface *xch, void *overlay_fdt, int overlay_fdt_size,
+                  uint8_t overlayop);
+#endif
+
 /* Compat shims */
 #include "xenctrl_compat.h"
 
diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index 519246b..a21a949 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 SRCS-y       += xc_altp2m.c
 SRCS-y       += xc_cpupool.c
+SRCS-$(CONFIG_OVERLAY_DTB) += xc_overlay.c
 SRCS-y       += xc_domain.c
 SRCS-y       += xc_evtchn.c
 SRCS-y       += xc_gnttab.c
diff --git a/tools/libs/ctrl/xc_overlay.c b/tools/libs/ctrl/xc_overlay.c
new file mode 100644
index 0000000..77f9edc
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
+                  uint8_t op)
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
+    sysctl.cmd = XEN_SYSCTL_overlay;
+    sysctl.u.overlay_dt.overlay_op= op;
+    sysctl.u.overlay_dt.overlay_fdt_size = overlay_fdt_size;
+
+    set_xen_guest_handle(sysctl.u.overlay_dt.overlay_fdt, overlay_fdt);
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
2.7.4


