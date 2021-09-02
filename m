Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA303FE97A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:51:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176934.322177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYz-00075M-2X; Thu, 02 Sep 2021 06:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176934.322177; Thu, 02 Sep 2021 06:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYy-0006gN-0y; Thu, 02 Sep 2021 06:51:04 +0000
Received: by outflank-mailman (input) for mailman id 176934;
 Thu, 02 Sep 2021 06:08:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=393g=NY=xilinx.com=fnuv@srs-us1.protection.inumbo.net>)
 id 1mLftL-0004km-3p
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:08:03 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (unknown
 [40.107.236.50]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21108f96-0bb4-11ec-ae3e-12813bfff9fa;
 Thu, 02 Sep 2021 06:08:01 +0000 (UTC)
Received: from BN1PR14CA0017.namprd14.prod.outlook.com (2603:10b6:408:e3::22)
 by DM6PR02MB4043.namprd02.prod.outlook.com (2603:10b6:5:9f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 2 Sep
 2021 06:08:00 +0000
Received: from BN1NAM02FT024.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::64) by BN1PR14CA0017.outlook.office365.com
 (2603:10b6:408:e3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 06:08:00 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT024.mail.protection.outlook.com (10.13.2.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 06:07:59 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Sep 2021 23:07:21 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Sep 2021 23:07:21 -0700
Received: from [172.19.2.115] (port=56596 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mLfsf-000F6q-32; Wed, 01 Sep 2021 23:07:21 -0700
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
X-Inumbo-ID: 21108f96-0bb4-11ec-ae3e-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wha1qfH0ZPATby9Q4mskRJHLQuUFsgYuFwayM2JLL9kFOEi6UTuLqfGD7h0DHAwEvM25P+v7FwjXuyf8LxrWZm+lLPC/JyxnMaLUs45BrdupAe0jyBpmKlBjoSuJWsik/UbiO+vbYwJ0hek69GpbGuFMtormyMIFSRCXRsMJhGspWj5k+2+KICf2Kx5bW+PxLfEjejhWYExkrM/y+r5acvQ/WI+lVWYzKSlwypNrCqMsJ9euHDgfCUbxaQwpTwrHqqdBhaaZcfaJAJmDJGz3SuJqxM+JSuQUYvKvQwdfL+6RRmaIMp7/hSd5tJqjJRd4FkSXYzwT5AHjn6L7OefJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vRNUT8x84jkmg4e61wPSC8IbP4rdyDEfRG2ff/C/Jw=;
 b=JBGHCjEfJN7w/dKGMVnu9wvudHVio860healWWmpFiTxuP0vQ8rclTzp3VqJrrIluzImVYGDwVm8+ENZCeQtJ9LJktWjDSmJ65qSD/3tJ6ETgjEpIoyDUuqv3zPOglf2fpSWz7N7bNe8boXWH98nR1bVLSg1ZdRyyTm7qoGiWAdzNEyJxOnS1upCl3WuhptAsGsxq+jxW/skkfjLog2CCuPY1YyN7OqVEXca5FUULzEUr3lsCOYJRKCbSoqq4xM/1XPYPajy/Ba4OTYwyINvv7KsIxkVuv9QOL9FtJ8lnz9ZzWzYZzYCsKaRn8rB60+kIrld0xEhbpIAmP9CRa0lgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vRNUT8x84jkmg4e61wPSC8IbP4rdyDEfRG2ff/C/Jw=;
 b=D7zaaaYViPL0cynA6mP7xFHD5UMNWK19BWJoTPyo4QVUQovhGIpQmJT0Ckg1aJwVQxS2U7kPrTTZRbHpgVM7eCNnBe1hytLGalfNRyYYkfp+HXu/qBirtZznZuDsQyhglo6zq1pBjvcCPgxocRHUrQXOFMIw56X2OQ+z0sO2v50=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN][RFC PATCH 11/13] tools/libs/ctrl: Implement new xc interfaces for fpga-add and fpga-del
Date: Wed, 1 Sep 2021 23:06:01 -0700
Message-ID: <1630562763-390068-12-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: becd6285-e0dd-4a35-7bf2-08d96dd80433
X-MS-TrafficTypeDiagnostic: DM6PR02MB4043:
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB4043D97CCF955D32A752F967BCCE9@DM6PR02MB4043.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u+EdAWF8Cc9fzd1XrneN/sHZ+iXJv8tDOsLWUoefmZO87ab09jnLPwNvpTIrdRuyfJ8yiVlSwU387RfV53S3f8AnPgHqed9e0SxF3idUHXTl2LnuLB9AS73NSST9YDr8mriSWDu/+lGUB83RTkfB2ZafObA1jk8Z9ucKCyfMmlmkJFNPF/fuOyykc4t2uC1+TQJim2D+QP+UYH6kONTgaKelrjNAmGFlJXDbiaEMraCQQqAAZOdBhd/61P/mf1i8UbWktvzArgodv9Bae6HNw5/h5TK6WkgbMvksl2MAEst/KgzzW4AtNPxo0ZhHAXsLFk6tEIckc3qVCaXpMEVBL/8F/ca0Kaqyd+6gOUC9hTe1QLZfpe19vNQSjuE8R280yO6J2ZWShVYeHpVU2ZL4FVI9p0mk0f1SStGX8z98SQaNkLVqG9Lqw7y6HeimywkEApQIvwYG6vvWNHF/e/+gQiwbatYrcoIC5pY4u3m20RI2ARhBqLWTHp2THuGUacTDXFW+G3BHoHb6tmMyXQRk9v4uRHPkKKMaqmb0+B3WkXGUaYTM0ansGwfup+m33drd5WU+Y+75XtoSV0bO/6K5YeBLmIsqEidFRcb5tTa+PT9uUEC4vv9CMQlE4LXJ+9W1oPK8IqUAqSZoIti85EZlzN/q/skqWfkEUAi0x/vup2QenryjPDemBN5PA0N9ofLyrtZn8ItZSZzclp2yoEogRDYHRmF1QjbUs9A7o6kwNrmVtEcmdFAAwQpK/ZzIynuKUdAnWMymH2Tu1hZbHzOWsFeB659FH7F6bIDo+R798gxude+KJ1GxwNjRlCLZdH/mnt8R3LA1JM6zGBXNTADcdg==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(36840700001)(46966006)(478600001)(82740400003)(47076005)(36756003)(8676002)(70206006)(82310400003)(6666004)(36906005)(26005)(8936002)(36860700001)(2616005)(186003)(7636003)(336012)(426003)(2906002)(4326008)(7696005)(5660300002)(316002)(70586007)(9786002)(356005)(6916009)(54906003)(102446001)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 06:07:59.9152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: becd6285-e0dd-4a35-7bf2-08d96dd80433
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT024.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4043

xc_domain_add_fpga() sends the device tree binary overlay and size of .dtbo to
xen.
xc_domain_del_fpga() sends full path for the node to be removed.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 tools/include/xenctrl.h   |  4 +++
 tools/libs/ctrl/Makefile  |  1 +
 tools/libs/ctrl/xc_fpga.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 tools/libs/ctrl/xc_fpga.c

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index b77726e..d14b3df 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2679,6 +2679,10 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
 int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
                          xen_pfn_t start_pfn, xen_pfn_t nr_pfns);
 
+int xc_domain_add_fpga(xc_interface *xch, void *pfdt, int pdft_size);
+int xc_domain_del_fpga(xc_interface *xch, char *full_dt_node_path);
+
+
 /* Compat shims */
 #include "xenctrl_compat.h"
 
diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index 519246b..95021b9 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 SRCS-y       += xc_altp2m.c
 SRCS-y       += xc_cpupool.c
+SRCS-$(CONFIG_ARM) += xc_fpga.c
 SRCS-y       += xc_domain.c
 SRCS-y       += xc_evtchn.c
 SRCS-y       += xc_gnttab.c
diff --git a/tools/libs/ctrl/xc_fpga.c b/tools/libs/ctrl/xc_fpga.c
new file mode 100644
index 0000000..41c37b5
--- /dev/null
+++ b/tools/libs/ctrl/xc_fpga.c
@@ -0,0 +1,82 @@
+/*
+ *
+ * FPGA control functions.
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
+int xc_domain_add_fpga(xc_interface *xch, void *pfdt, int pfdt_size)
+{
+    int err;
+    DECLARE_DOMCTL;
+
+    DECLARE_HYPERCALL_BOUNCE(pfdt, pfdt_size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
+
+    if ( (err = xc_hypercall_bounce_pre(xch, pfdt)) )
+        goto err;
+
+    domctl.cmd = XEN_DOMCTL_addfpga;
+    /* Adding the device to hardware domain by default. */
+    domctl.domain = 0;
+    domctl.u.fpga_add_dt.pfdt_size = pfdt_size;
+
+    set_xen_guest_handle(domctl.u.fpga_add_dt.pfdt, pfdt);
+
+    if ( (err = do_domctl(xch, &domctl)) != 0 )
+        PERROR("%s failed\n", __func__);
+
+err:
+    xc_hypercall_bounce_post(xch, pfdt);
+
+    return err;
+}
+
+int xc_domain_del_fpga(xc_interface *xch, char *full_dt_node_path)
+{
+    int err;
+    DECLARE_DOMCTL;
+    size_t size = strlen(full_dt_node_path) + 1;
+
+    DECLARE_HYPERCALL_BOUNCE(full_dt_node_path, size,
+                             XC_HYPERCALL_BUFFER_BOUNCE_IN);
+
+    if ( (err = xc_hypercall_bounce_pre(xch, full_dt_node_path)) )
+        goto err;
+
+    domctl.cmd = XEN_DOMCTL_delfpga;
+    /*
+     * Remove the device from the dt_host, setting hardware domain by
+     * default.
+     */
+    domctl.domain = 0;
+    domctl.u.fpga_del_dt.size = size;
+
+    set_xen_guest_handle(domctl.u.fpga_del_dt.full_dt_node_path,
+                         full_dt_node_path);
+
+    if ( (err = do_domctl(xch, &domctl)) != 0 )
+        PERROR("%s failed\n", __func__);
+
+err:
+    xc_hypercall_bounce_post(xch, full_dt_node_path);
+
+    return err;
+}
-- 
2.7.4


