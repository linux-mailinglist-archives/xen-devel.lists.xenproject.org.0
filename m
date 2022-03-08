Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F23224D21E2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 20:47:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287468.487556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoD-0007Vv-G4; Tue, 08 Mar 2022 19:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287468.487556; Tue, 08 Mar 2022 19:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoD-0007NM-3h; Tue, 08 Mar 2022 19:47:49 +0000
Received: by outflank-mailman (input) for mailman id 287468;
 Tue, 08 Mar 2022 19:47:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RGf4=TT=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1nRfoA-0004Df-Tl
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 19:47:47 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20613.outbound.protection.outlook.com
 [2a01:111:f400:7eab::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dc8150a-9f18-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 20:47:44 +0100 (CET)
Received: from DS7PR06CA0038.namprd06.prod.outlook.com (2603:10b6:8:54::19) by
 BL3PR02MB8161.namprd02.prod.outlook.com (2603:10b6:208:35c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.15; Tue, 8 Mar 2022 19:47:39 +0000
Received: from DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::f5) by DS7PR06CA0038.outlook.office365.com
 (2603:10b6:8:54::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 19:47:39 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT023.mail.protection.outlook.com (10.13.5.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 19:47:39 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Mar 2022 11:47:21 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Mar 2022 11:47:21 -0800
Received: from [172.19.2.115] (port=58782 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1nRfnl-000Cws-Px; Tue, 08 Mar 2022 11:47:21 -0800
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
X-Inumbo-ID: 9dc8150a-9f18-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZ/5wE7D9jBOwYwBEyQgN5cHRcTrRomQr0ye7YjnVC/Ed4oTfmSlNb2Wf4pkS5WW+IGw1D+qWY0DY4WBmVMC7v5ofnLCDD8dGvUpKRhu7z8P9UHuVm1929hI1PchcGes06yJh06+YekQTtlCHuDMOsk9V+JQwyEsS9ukDiOdZK/QOz/efCKgxCVVSZ07J2ySwx2mVkpgMOlGR3PTnnRjToKZdfPXH1NY9IQytQ96k53VkIYPO8J5TYvWZsrPhsDb/WLBnf6isxfL/WTQrGrTat0tCcSLcCbXgqC9YjS7lG8pB9lHHMekvEUvqPn3f5pk+vLYjwA8a7gUbsG3X7TIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4E5KeTGHuyUkTzR8/a8yq2xjltDv0G0kEA7U7nbO7M=;
 b=bry9dVVFKrnyNLLm13blu/q7Pn6UMNdF8ACy6ZndOcHwgMmxNSaKK1S+7mhqTsww0sULTh3m7IceRlWPWlJsbuq8OuDN/bS8ueKi+dtoKMDCHEHJLFfnyVRK2shNiZNu0RepG9Dv5fxuQuSO4hoEXqtjq3fdEHSSAz6sA2bXsj1KU2SZ0Hc0NY7U7oglL8bC1vUsrfER5S2Yaeh8GlVfHzx2CheqV8Ao+ydN3AcXhKVnGGe5xvB+CjuAYo9C4azcepLHdrtRcUPEYyb3408MOrBucGNrsNluljKDlKnuClXM078a7rvHtVVHcs9XoJxuPb++SeG/AWQRM3xCx+3NNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4E5KeTGHuyUkTzR8/a8yq2xjltDv0G0kEA7U7nbO7M=;
 b=d659+CeKBo0KqQL4JG/FwUOalGibM+BEQYq2w8vXyy/NOYthdTAnCCC0O3sODCb13yLpbDWOXZMV1ERs2FaeKTs7Kt+MpqJLhoqLtx4sJaBe840JOjSlOH7yO0CuckOdMGwt1X/Io7udXrHi21mUQim90u7zrPEnjkZoFBLWTPc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>
Subject: [XEN][RFC PATCH v3 07/14] xen/iommu: Move spin_lock from iommu_dt_device_is_assigned to caller
Date: Tue, 8 Mar 2022 11:46:57 -0800
Message-ID: <20220308194704.14061-8-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308194704.14061-1-fnu.vikram@xilinx.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66a19008-cac4-4baf-c20c-08da013c80d5
X-MS-TrafficTypeDiagnostic: BL3PR02MB8161:EE_
X-Microsoft-Antispam-PRVS:
	<BL3PR02MB816194BE3154489DAC1E02C0BC099@BL3PR02MB8161.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yI18U2FpnYgabbtahPvrZvth0sOxswSTH/tFgHVSxLUjpPq3MC9vDGI9FRgTNbCjB5N39H8KT3JanZlHnMo5yYp3dTxQHCeh8lF07E9zh/FDCHtBoCgsIRBZgxKrE34uZhs6d709u1jgEX5NI2opTFXVg5C06MKmt0O/euu5Qwh2GlmWmZiBzfPYa7N4lPpQkTXx45qFunkP2tNww+JmqWQp6/pWU6+04YWs1a6R0pYk05wVo0KZd+stPW9N4aAtRBmVAWhipgpxz01SLA1nB68Ax1XCP/XO+kfF7nYrykYW6c80xe/pEqwTqCzluUHHz0R4nfJyXO1owTNVpo7UMBNKy4MDgLEcZDDOzyOOWpCvvY6k5uq+5MdswE9feeRQYgEhCcJlJj0K6+pHcRHADg2DXUNpPsLwMC/y2RKj4uf6z9ElVC4yE/RBmCi/D2akd6xgwar8nTfVy2rCmNeHq7gzzYGPsKAxx45wS6rruN+PpbJ62ZU5FZywpqA1U4Qxvu29fGHJlVzKwklQS3Mu31ZWSWNbk58KYs0kj9uz0ULveHI51KvzHg4kbV10wIfoo6bovodZpWz61Hr+MYKK739HLgAKRKuI87pEywgUqC2kMeoyCceUIe42T/oHZmkPrTxQbpMTzPg/TtFvFChCrxYyl2pb68jQtqnBS4ZWffLOSZr2pPT0K4VJjC0C8j2JtB/ShJFjcy4g8YPUiTzSJw==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(40460700003)(36860700001)(356005)(7636003)(6916009)(70206006)(70586007)(4326008)(54906003)(316002)(2906002)(9786002)(8936002)(5660300002)(426003)(336012)(8676002)(107886003)(1076003)(186003)(26005)(47076005)(83380400001)(2616005)(508600001)(7696005)(6666004)(82310400004)(36756003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:47:39.6567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a19008-cac4-4baf-c20c-08da013c80d5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8161

Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_lock().

Moving spin_lock to caller was done to prevent the concurrent access to
iommu_dt_device_is_assigned while doing add/remove/assign/deassign.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/drivers/passthrough/device_tree.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 98f2aa0dad..b3b04f8e03 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -83,16 +83,14 @@ fail:
     return rc;
 }
 
-static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
+static bool_t iommu_dt_device_is_assigned_lock(const struct dt_device_node *dev)
 {
     bool_t assigned = 0;
 
     if ( !dt_device_is_protected(dev) )
         return 0;
 
-    spin_lock(&dtdevs_lock);
     assigned = !list_empty(&dev->domain_list);
-    spin_unlock(&dtdevs_lock);
 
     return assigned;
 }
@@ -225,12 +223,17 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
 
         if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
         {
-            if ( iommu_dt_device_is_assigned(dev) )
+            spin_lock(&dtdevs_lock);
+
+            if ( iommu_dt_device_is_assigned_lock(dev) )
             {
                 printk(XENLOG_G_ERR "%s already assigned.\n",
                        dt_node_full_name(dev));
                 ret = -EINVAL;
             }
+
+            spin_unlock(&dtdevs_lock);
+
             break;
         }
 
-- 
2.17.1


