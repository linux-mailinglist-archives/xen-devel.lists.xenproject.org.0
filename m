Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DE2788180
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:03:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590561.922984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmr-0002Wk-2F; Fri, 25 Aug 2023 08:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590561.922984; Fri, 25 Aug 2023 08:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmq-0002EI-Gw; Fri, 25 Aug 2023 08:03:20 +0000
Received: by outflank-mailman (input) for mailman id 590561;
 Fri, 25 Aug 2023 08:03:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZRmk-0007GZ-Er
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:03:14 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5f05c61-431d-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 10:03:11 +0200 (CEST)
Received: from SJ0PR13CA0202.namprd13.prod.outlook.com (2603:10b6:a03:2c3::27)
 by BL1PR12MB5706.namprd12.prod.outlook.com (2603:10b6:208:385::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 08:03:07 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::3b) by SJ0PR13CA0202.outlook.office365.com
 (2603:10b6:a03:2c3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Fri, 25 Aug 2023 08:03:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Fri, 25 Aug 2023 08:03:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:03:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:03:02 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 03:03:02 -0500
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
X-Inumbo-ID: d5f05c61-431d-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AibZfvB1j1eJmcQxa9jPL9SsdKUIKL/J9ZgWdVJa7KcwnVhYskpucGOZe+RQOlvyp0BS/fjbW4ruHwhZO9VCl/WlEZNaEEaVn6huN9UoGbi+2D0rWMMbPdOFbwe+lM24cB7QCzJI7rtvxpN4bVL01sO5Z6MRuRZpx8ti+eW0G5v78UJITyyLFsQlHMzcqOXZAK0Kvwxhx40hFPuwsQ5Q/SOxggG7pd8wRHZHT2GHDzPhmFkCpJ1AEaVn3EXVh8E+2fU3NvWfauKO+DulTq5r1gDUDNEhb0x6SCSYCMThOkeBvWwVz4bDIwsV84dThCYjlPo3SPzSh2TQJHVld4WLag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbLjByfblu66od1Vdrl71+ZR1WzFVQiYpHtzjdK7oJE=;
 b=JgZmabtjnrUSQyY139mI246NXEqOR1/m/2UoBHxKatWJL89GUW00VJ3Klx9L/AIPgDVcorP0eE86dyNmruwLPyy0ySnMrqXBmXkeAXdBc2KP8iou0dj25+fQ4jvt7YH4idFgmizqAIcXnct6FjkNRmCFLdRIzSSrnve9OtjH/ocTbrG1l0V3vkPSBE7jYnUOj6Fi0oXY89rKj0J7PuwksTBEguN2kGjm8GhXIzZtqoH71xtib1pk4doILmFEokRVv0Ipebpet7tUyeRZzJ4GY2kuhg7VWqOkPYz3L71/ShjRXFokZh33XY9uqj8wjye2Zs8roOy3aKIm0DsVy4zrEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbLjByfblu66od1Vdrl71+ZR1WzFVQiYpHtzjdK7oJE=;
 b=CFxt1tLjr1yErFOh+K8+rgeOfMdbHPMLh40gwdgP9JWtnqDyo21nmp/dBnbqSUPM1gCOsSnVBZyBSUxlAZ5yMbQWq08E61DOhNBNIMVgT0rftisg+Q9MC7FQVsYTdEouYr9pi1mfst9nHFaf/ps27sdbwySyflFerDXvHwFVV3s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <julien@xen.org>
Subject: [XEN][PATCH v10 09/20] xen/iommu: Move spin_lock from iommu_dt_device_is_assigned to caller
Date: Fri, 25 Aug 2023 01:02:11 -0700
Message-ID: <20230825080222.14247-10-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825080222.14247-1-vikram.garhwal@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|BL1PR12MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: 8607ac54-e699-4797-b404-08dba541b709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4UZi/QuVEXYlI1/AmUrqeTIJ7P+rJWg5nPk1/sqtzFiDNFDHuvOCFoAsYHErYf0db5oSWswGP904QVMCHriN1ptRp5LZ5dU4VS6Xp6izgntc7uaFx400pvWxPHF1b4+MBhzjim9sSkNsPcv2ufdUwbrb+/A1BoUVdVajceUr4oO2j9ZjCRdV7M6XQvpLsI2uJgcz5WBYPHOdlp1grmDra+T/o4UrMAGE+xuHkoWLajsA/9wi3lz7WJJNm64kWa8s6G9eIY9SVx8bNpkK8X+okvU2Tji6n1G6RSDHtF+p3nU5GcnBDWs0+fkORCQ1aFA9tYSmumzeQib67XWFqTbEmzLDgd7ykp81xuzM836CPeDF0QtpFnxCY/CHrPUkLRSVIzMgRHWGr23juYsBGfiynDCnDxRMUuUtgxdT4EAsV8hDVBLG/lG2db+mydp+bACLBd8Iy5yxbH/gPhKh7m0wy3/gTRN0nPALluIPlqmr7I79MKA9dAcpsFABA8PHnMa1dKGhx9kwpRtR/nV6WHKVGIhzsJ76bAdnPFmkSU+6BP4aKabouGPKtKghtbJ2Pgziala9Z3WIVlJ9jl0dTNMFHUbGM4pWuDQMK7RZYyiTJMQ+j07ZC3euvkrp/Vq8p16mW+vhWhAsC2CKQJoq2J9cTZu2PH23kfwxfpoSBCV60PYPximvzoAXF10TyrcyG/E9NhIsfKfduOTlGlgAnI+PUw8BuhnxAGI5D5S3FYpfibhzG2Q8YNjFYASbU9lAHi0aZMSR3iWo4v5r4JPXB1z4qA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(82310400011)(451199024)(1800799009)(186009)(46966006)(40470700004)(36840700001)(82740400003)(81166007)(356005)(40460700003)(8676002)(4326008)(8936002)(54906003)(41300700001)(6666004)(316002)(36756003)(6916009)(70586007)(70206006)(86362001)(40480700001)(47076005)(26005)(478600001)(336012)(36860700001)(1076003)(44832011)(83380400001)(2906002)(2616005)(426003)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:03:06.3662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8607ac54-e699-4797-b404-08dba541b709
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5706

Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_locked().

Moving spin_lock to caller was done to prevent the concurrent access to
iommu_dt_device_is_assigned while doing add/remove/assign/deassign. Follow-up
patches in this series introduces node add/remove feature.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

---
Changes from v9:
    Make iommu_dt_device_is_assigned_locked() static and delete header.
    Move dtdevs_lock before iommu_dt_device_is_assigned_locked().
Changes from v7:
    Update commit message.
    Add ASSERT().
---
---
 xen/drivers/passthrough/device_tree.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 1c32d7b50c..5d84c07b50 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -83,16 +83,17 @@ fail:
     return rc;
 }
 
-static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
+static bool_t
+iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
 {
     bool_t assigned = 0;
 
+    ASSERT(spin_is_locked(&dtdevs_lock));
+
     if ( !dt_device_is_protected(dev) )
         return 0;
 
-    spin_lock(&dtdevs_lock);
     assigned = !list_empty(&dev->domain_list);
-    spin_unlock(&dtdevs_lock);
 
     return assigned;
 }
@@ -223,17 +224,24 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         if ( ret )
             break;
 
+        spin_lock(&dtdevs_lock);
+
         if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
         {
-            if ( iommu_dt_device_is_assigned(dev) )
+
+            if ( iommu_dt_device_is_assigned_locked(dev) )
             {
                 printk(XENLOG_G_ERR "%s already assigned.\n",
                        dt_node_full_name(dev));
                 ret = -EINVAL;
             }
+
+            spin_unlock(&dtdevs_lock);
             break;
         }
 
+        spin_unlock(&dtdevs_lock);
+
         if ( d == dom_io )
             return -EINVAL;
 
-- 
2.17.1


