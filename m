Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5C34D21E8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 20:48:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287479.487608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoL-0000sh-Gk; Tue, 08 Mar 2022 19:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287479.487608; Tue, 08 Mar 2022 19:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoK-0000eO-R8; Tue, 08 Mar 2022 19:47:56 +0000
Received: by outflank-mailman (input) for mailman id 287479;
 Tue, 08 Mar 2022 19:47:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RGf4=TT=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1nRfoH-0004Df-Af
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 19:47:53 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a364e957-9f18-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 20:47:52 +0100 (CET)
Received: from DS7PR06CA0046.namprd06.prod.outlook.com (2603:10b6:8:54::13) by
 SN6PR02MB4720.namprd02.prod.outlook.com (2603:10b6:805:98::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Tue, 8 Mar 2022 19:47:48 +0000
Received: from DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::18) by DS7PR06CA0046.outlook.office365.com
 (2603:10b6:8:54::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13 via Frontend
 Transport; Tue, 8 Mar 2022 19:47:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT023.mail.protection.outlook.com (10.13.5.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 19:47:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Mar 2022 11:47:26 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Mar 2022 11:47:26 -0800
Received: from [172.19.2.115] (port=58782 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1nRfnq-000Cws-QV; Tue, 08 Mar 2022 11:47:26 -0800
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
X-Inumbo-ID: a364e957-9f18-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmOAUVnNBNpPZc7bqD88t0rW5jGi+VG1IRkGjhzyurV8IkaGa0crf14DLDN/YwPhuEaUGQuPdwKVp1mbPpPkZNFJWtyv8bdeyPeRNbe5nchPmEJGWBUWy5xQ9ZXOHiZGP2SRZXJY3csfVohvz4bJmZ3NBpv+N0s+nr8s6r3iY0UOQe1F+qjMxdq4vnWoYaQiyRMvAliOBApZ07EItC6OEQjM6mKmQeiAk7eHFojY1YSLBtXGQtBuJtHB6ddM6w/Wtk3O8W0qJkK6EYUbP9eRvdHsO9ucaLhJtun+4376ZOhuP2sWFRL4/p8j5P7AQ0wahXU6TicIDyAERo01QedCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7zkeDAGnOQcMYph4tEAaHti6ByfmmWahNuniPhChE4=;
 b=j6VTeevhv8Ds29dPFOh6SBhLMorR+xVuecgRh9WcJH4ZH0ujXf60G4TWhQaXjABPGMpTcQFKxauBclqNWnoi/GQPVyO7Q1tPefsrQFwc/gU0F8vRGZoxTBCGYlcuDNCpYSZsoFGchwRyvPSLtjPFVb3m5aLumz0iUc1UOkulW7NxZMEzf3dZuQ5NNgTqWllOqx04ntH0SZAHELlkSONVrMQ5nD7BFEfI5HbCrhSOAZBagkqsoLMmRei1lWPuE85HTivVM1Rt5D3pPfhpeMCuV2yBAMH88g7sC6cZUOMlTHVCiUKJCJinnKfRgKMmNKsBJDJN8MJj/1DkQIQpzjuGPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7zkeDAGnOQcMYph4tEAaHti6ByfmmWahNuniPhChE4=;
 b=UYbIbwfV4/YBCkzOo5HGokNt3G2dQAxDI3NNaWF8oX4LySY3/6UoZgTsvMZJ4BLmu+zEjKwlMfnI9mPHcSPGe3IYK2E06oJNOHRiWvLX7TzwL+K7RjWGiQu2OP0EvNhVvnZB0onzu8M4hWv40qdVNbzBqD4egCCxUVpFRUfeNRM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN][RFC PATCH v3 14/14] tools/xl: Add new xl command overlay for device tree overlay support
Date: Tue, 8 Mar 2022 11:47:04 -0800
Message-ID: <20220308194704.14061-15-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308194704.14061-1-fnu.vikram@xilinx.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 280302db-73eb-4084-5c27-08da013c85f7
X-MS-TrafficTypeDiagnostic: SN6PR02MB4720:EE_
X-Microsoft-Antispam-PRVS:
	<SN6PR02MB472095D65DC38B74500A2600BC099@SN6PR02MB4720.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z/PtrEmXEFjsusmiHv467GDfGqXhivWYVfhcp2AX1iS3NN+uWFATbecWk5S5pCwJUu8i57Q6yVxpbiRssQE6NeIZGbZKh26eL34F7QDwWD8kOPcASUPgmUbniqwB1xsNY+LoO/4e29Iq/0QvGdm4qU2m9GkSDZY44xvbGyedeIyI2oe4BD0ACh3CbdmTAZk6fGdvURT8uzyBvwfVPTvu3g4Kl7VUg2geZo7Fjq52iBLzC51XMWMhuc5fowHOiVcEDGC2ZMp2sFIuG5uqUj5LJvsqxYP64MhnMCkDHbOMpDDAfRrklCTuRBqC5XLcIotPNu4XEZJ6NzrP8LpT2HOVU2Xz62YXq7w6gYMa20WpElidjkJuKMwJKB2u+H5zMfl2pJhRn0dCdhNeLZOERjkainnpxHEdbQ2+7E8wZ7LAMTTVKFB+ank8+O92ACjpkMbHk1g3TyworqTxwtc7Sc+6WrxrtFv3ChcPOSu8iUhGFxyM8smROKLdIEP3fPvWX2kVYDKwOXWIO+Oy5nQru68jZ6qTLvaEeL8xvEd9Z3ca7eJMEpjyKtgQBmFSIqJ5A6WFOsATUiPbq0uCEqXYmM9XwhE8zncbamFKwl8Pn2LUzH+FH9t/9If8S3I02AB2eqBkfQR2dgAnkKIfHFGIPuSSCKpM4RjED0w2aVIeKwhC2prLdcq/hlP87cK/U5YUT75RSsFzyOjtPoR9PIknF+DrTQ==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(8936002)(36756003)(2906002)(9786002)(316002)(508600001)(54906003)(6916009)(7696005)(5660300002)(6666004)(356005)(2616005)(47076005)(7636003)(36860700001)(82310400004)(40460700003)(1076003)(186003)(26005)(8676002)(4326008)(70206006)(70586007)(83380400001)(426003)(336012)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:47:48.2655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 280302db-73eb-4084-5c27-08da013c85f7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4720

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 tools/xl/xl.h           |  4 ++++
 tools/xl/xl_cmdtable.c  |  6 ++++++
 tools/xl/xl_vmcontrol.c | 45 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index c5c4bedbdd..604fd5bb94 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -97,6 +97,9 @@ struct save_file_header {
 
 #define SAVEFILE_BYTEORDER_VALUE ((uint32_t)0x01020304UL)
 
+#define XL_DT_OVERLAY_ADD                   1
+#define XL_DT_OVERLAY_REMOVE                2
+
 void save_domain_core_begin(uint32_t domid,
                             int preserve_domid,
                             const char *override_config_file,
@@ -139,6 +142,7 @@ int main_shutdown(int argc, char **argv);
 int main_reboot(int argc, char **argv);
 int main_list(int argc, char **argv);
 int main_vm_list(int argc, char **argv);
+int main_dt_overlay(int argc, char **argv);
 int main_create(int argc, char **argv);
 int main_config_update(int argc, char **argv);
 int main_button_press(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 661323d488..5812d19db8 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -20,6 +20,12 @@
 #include "xl.h"
 
 const struct cmd_spec cmd_table[] = {
+    { "overlay",
+      &main_dt_overlay, 1, 1,
+      "Add/Remove a device tree overlay",
+      "add/remove <.dtbo>"
+      "-h print this help\n"
+    },
     { "create",
       &main_create, 1, 1,
       "Create a domain from config file <filename>",
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 435155a033..76b969dc33 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -1262,6 +1262,51 @@ int main_create(int argc, char **argv)
     return 0;
 }
 
+int main_dt_overlay(int argc, char **argv)
+{
+    const char *overlay_ops = argv[1];
+    const char *overlay_config_file = argv[2];
+    void *overlay_dtb = NULL;
+    int rc;
+    uint8_t op;
+    int overlay_dtb_size = 0;
+
+    if (overlay_ops == NULL) {
+        fprintf(stderr, "No overlay operation mode provided\n");
+        return ERROR_FAIL;
+    }
+
+    if (strcmp(overlay_ops, "add") == 0)
+        op = XL_DT_OVERLAY_ADD;
+    else if (strcmp(overlay_ops, "remove") == 0)
+        op = XL_DT_OVERLAY_REMOVE;
+    else {
+        fprintf(stderr, "Invalid dt overlay operation\n");
+        return ERROR_FAIL;
+    }
+
+    if (overlay_config_file) {
+        rc = libxl_read_file_contents(ctx, overlay_config_file,
+                                      &overlay_dtb, &overlay_dtb_size);
+
+        if (rc) {
+            fprintf(stderr, "failed to read the overlay device tree file %s\n",
+                    overlay_config_file);
+            free(overlay_dtb);
+            return ERROR_FAIL;
+        }
+    } else {
+        fprintf(stderr, "overlay dtbo file not provided\n");
+        return ERROR_FAIL;
+    }
+
+    rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);
+    if (rc)
+        fprintf(stderr, "Overlay operation failed\n");
+
+    free(overlay_dtb);
+    return rc;
+}
 /*
  * Local variables:
  * mode: C
-- 
2.17.1


