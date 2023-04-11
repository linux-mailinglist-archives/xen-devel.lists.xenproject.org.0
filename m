Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249626DE499
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519775.806788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUO-00067I-6n; Tue, 11 Apr 2023 19:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519775.806788; Tue, 11 Apr 2023 19:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUN-0005x3-Ie; Tue, 11 Apr 2023 19:17:11 +0000
Received: by outflank-mailman (input) for mailman id 519775;
 Tue, 11 Apr 2023 19:17:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUL-0004DR-DB
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:09 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72be6fba-d89d-11ed-8611-37d641c3527e;
 Tue, 11 Apr 2023 21:17:07 +0200 (CEST)
Received: from MW3PR05CA0009.namprd05.prod.outlook.com (2603:10b6:303:2b::14)
 by DS7PR12MB6360.namprd12.prod.outlook.com (2603:10b6:8:93::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 19:17:04 +0000
Received: from CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::93) by MW3PR05CA0009.outlook.office365.com
 (2603:10b6:303:2b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.27 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT088.mail.protection.outlook.com (10.13.175.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:17:04 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:17:01 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:00 -0500
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
X-Inumbo-ID: 72be6fba-d89d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDNOOUoUQrDMzJfKXlJfbBxfcLNE2ExFDTv865MP0/28SIEbvp9JnZjJDr5LiG2XgsPaddpgjmGypo4MdsgnlyvwAvcH5/tAVyON4tcV29yB5Ax5/rzMW6ngkXaB1UBKGYvq2j+aZVZmhrNwjVcuwB0KKYXqfz/ptE6F65s+mJEjq8G2VLHNZg4X4aI+pQhT+GVYB2esbpZP5Le+4vQaIRdvSESALv92/hOY2ohpeVzIb8GKRKbpFZlCAH/NKZEy8kHh6QD5+Iy7xS7PSL5SGScUzX7Q3pYlRuIDFqeQ8QY0Umpam1vCOps3ut4ieAid0xpteHShUAq767fEik0JzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qd0QFdZvzHUGWrw0BfIrEu3cWkp8jWSV4vPT9FURuHE=;
 b=BLJ69mgmDOC4R6oelAOdYmiz7bsaXr3tCsp/n9jVQSfNwQkvbwB8mNzPAXedghQGVKl73r9eHZiXnJDEgi6/5PIi785YsAGhLn/NjQVkncwcrUtvIO3Ub6EdFenIHqnvqeDVN+21UtIh+Agwu3sYvQtHLFYcsiEX8fDmQ8SxvaMsHl2nIL8WKgr0dF1fefO9Zd3hLLl1qRtq0ONlThpsSekvWPCjEdCdGe18ABWfwzYnKYzMpFoX/bFTV5a9F1lWAvL7nMGpRo/DHrjB9bZ+Wq0GxePVPj7o0sU+FM9Jnt0wqPJ5dJ0WJKD0FQVylkqF6rg4pG5aaacy8nY5HFtxPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd0QFdZvzHUGWrw0BfIrEu3cWkp8jWSV4vPT9FURuHE=;
 b=ydjZWvY1P/SI3BwD6fN+ts4m/35w6s58norWJb8ajYjmOcxbz3+nrGWMPxgzBAof3asGEfFsqYqJX+24SJKCU0VWnbnkWYCLCKikt1G3NmUzCNGNO6RCVa+N34wH/DUa74ovVoxQDb1Q4ujmxsdoFPr8gxaJg5RL2qb538w68hc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Julien
 Grall" <julien@xen.org>
Subject: [XEN][PATCH v5 09/17] xen/iommu: protect iommu_add_dt_device() with dtdevs_lock
Date: Tue, 11 Apr 2023 12:16:10 -0700
Message-ID: <20230411191636.26926-10-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT088:EE_|DS7PR12MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab94d90-81ed-4d5a-7551-08db3ac1559c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qApyCw/eRhNKr9aze4U/rylhAkLcEqFW2qkkpLpyGUEdW2AgCK6S44/p2a67w1EuRCOHOm8BHUSpGgB9zXZ/Ac8aWvzxeFHcn+Gh5fQCW7wznN0MXMeYGWOr8xRnW2zrjSd8TadH8++Qaqe9vvGXNJaAcKZ5LNgkE/09f4wCEemxWSE/QVJ9HtFE9r9ehK/pb1HXoFwvHKYWhHgipn/QH/68Cj9kOEaQ9eIcIKU2DzYu/x3NWq8hbgQBJxAVoz1FRURZUtTkhzGZVW/DyKVMYu5NjzEBKekSLWPWvrIpLPAU45Acb1aQ/Q15gRkhEnUnPbe4UTxH3INxGJui8bfLeQ65cibYQCatpgNnCYr/08gyMg7prvQrE+8+41WLV4dXlHGSswThx20toJwjzJu0RaGii9JoQossCFqzOwXj3cNVH44tvvejdre2iIAhssiBRrApAzRdaNkLbd0kytp4OYeit8PRWwCskR4Xr7+qfYx1nPDzot+qTkZ31qz4oF5QYy1/VGAolU1Dh9dQSS7K3kF7fUiF+XrYB6Jjem6uybz2J0GNJQ28hMf6vMjeNx7Qj2S20XUxo7Fv+ofCyrSIBSz2JnN1IJvo7PBotlBZk8siV0EgvqNdK1qqC1eJIo3w4GJJ0m7IGxURagIbwE93lQ0DRC/u33VvRuxQlF48aqlSw0gUYORcOya+QbJs79vSJMyWczmowmgjZfg+dN6orTbpzeYxYKZjKFfO4LE+BQM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199021)(40470700004)(46966006)(36840700001)(1076003)(356005)(82740400003)(8936002)(8676002)(4326008)(86362001)(6666004)(5660300002)(6916009)(41300700001)(44832011)(40460700003)(82310400005)(36756003)(316002)(2906002)(478600001)(54906003)(70586007)(70206006)(40480700001)(47076005)(83380400001)(26005)(81166007)(186003)(36860700001)(2616005)(336012)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:04.1067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab94d90-81ed-4d5a-7551-08db3ac1559c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6360

Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access add.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/drivers/passthrough/device_tree.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index bb4cf7784d..457df333a0 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -146,6 +146,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( dev_iommu_fwspec_get(dev) )
         return 0;
 
+    spin_lock(&dtdevs_lock);
+
     /*
      * According to the Documentation/devicetree/bindings/iommu/iommu.txt
      * from Linux.
@@ -158,7 +160,10 @@ int iommu_add_dt_device(struct dt_device_node *np)
          * these callback implemented.
          */
         if ( !ops->add_device || !ops->dt_xlate )
-            return -EINVAL;
+        {
+            rc = -EINVAL;
+            goto fail;
+        }
 
         if ( !dt_device_is_available(iommu_spec.np) )
             break;
@@ -189,6 +194,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( rc < 0 )
         iommu_fwspec_free(dev);
 
+fail:
+    spin_unlock(&dtdevs_lock);
     return rc;
 }
 
-- 
2.17.1


