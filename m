Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465FA78F7D6
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:11:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594263.927570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwR9-0001eM-5Y; Fri, 01 Sep 2023 05:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594263.927570; Fri, 01 Sep 2023 05:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwR9-0001YZ-0I; Fri, 01 Sep 2023 05:11:15 +0000
Received: by outflank-mailman (input) for mailman id 594263;
 Fri, 01 Sep 2023 05:11:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbwGZ-0000Nr-Q1
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:19 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e83::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71b98988-4884-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 07:00:19 +0200 (CEST)
Received: from CYZPR12CA0006.namprd12.prod.outlook.com (2603:10b6:930:8b::22)
 by SJ2PR12MB9114.namprd12.prod.outlook.com (2603:10b6:a03:567::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Fri, 1 Sep
 2023 05:00:13 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:930:8b:cafe::8) by CYZPR12CA0006.outlook.office365.com
 (2603:10b6:930:8b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.27 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Fri, 1 Sep 2023 05:00:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:10 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:09 -0500
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
X-Inumbo-ID: 71b98988-4884-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dr5mBEqYlmHRjj1Im62kymab8EtDJgUc9wueBAxgJggdavG6pukTli+nCzSbI5Q6FA2GLnPQUIot67oWzOQpZwVpReDHGeIvb4K/GEzz1q14g0q4Twn6YiJQTDF06s/otON5Ln3qwkecY+sNOS04BHyRbUS5UFBP1w43USpHQWfqkGIyV96bDOTvE5X6AIpqatYps9eoJwk4hPs5P5hVAfsiTYE3LAfEpjEbKAyuhHoxpPq+DMZOUqxOoTd0lrqYBuE6vV6hRmALEjJS2yVv7oF0TbQUw49zOp025yUlllJX+uGKXZY5iP1J40K/JsgubDXQMRj7AvLADlTTbiLAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEOO1lNx/ONa1/nR//BBauJgW25xq4jXfGIfpWrsOLc=;
 b=k7b2W91nzQFMU6ESbBF1UvA30Fkm9sybCmpyb5lFZ80KKO1HwtFI1E9VnUMwHzy50A6GTMU38YAyCeT71hP+gB9ILxXcnk+3iziYcucEvLJpAD+0Wl6xXRWgAmbQpF3QPcP+YQ/mW1eA+QsKcaE3RTyoLeHR2sFw/gqqCl4Ag1FTGeqb9pdcp5FrAZv6ugeRAEKhrsd3tc7vP6+/ynEPhsH02lHJPFSakDNKycu8jNCdHE/NpBJ1AokSX/3NdmvFxbBzgHhPBHY6P1gfnisbJBvMcmYoWt8GgcQ+bl5Uyny2BWlw6dl/o6LkNQJCQPgAu06wNqYmy0TmGiEaJXygqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEOO1lNx/ONa1/nR//BBauJgW25xq4jXfGIfpWrsOLc=;
 b=ARAI2mK0eudpSwKfxdvwb45RpyJcgH1O3rmFk9pR2uXMUVvTZvlQ01qJOJlgchFyAWvrjf443iWb5wEVbaM1//LH9jTc+BMkP5iYT9qu51uf1HjbXlQANPf9ddHW3CTwSlx/q+GmyAfU6wdnHKZQK5QvnItW389ysmoekB00zpM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>
Subject: [XEN][PATCH v11 09/20] xen/iommu: Move spin_lock from iommu_dt_device_is_assigned to caller
Date: Thu, 31 Aug 2023 21:59:36 -0700
Message-ID: <20230901045947.32351-10-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230901045947.32351-1-vikram.garhwal@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|SJ2PR12MB9114:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c03ea69-01cf-4958-6586-08dbaaa85330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7Kd2SX98lWwPVNPqKtEGuM59PRkBCGCpq4TclAqNXgwR3DoBSVEJk+9CQKAsxvrg5w9cciVfOX2E9U6gOdVZtI2HoizZL2anUJKo4pD4fuBvc4seBDuCZC8YMNiwgwQiDZEzBDK8h6J6Xt1E3hwmOBQGp4h5tvva/cE1Tk12hCpvbzV3mF6jQ70XUkX/8eSVs5kk2o/Iyo/VsSwl/piXi97ec4sq+0BClfARgnudKkaVolxyv+J1afcAoFLrI1uIFxmee734KSuKwJfuwTITY+GbCDuyQzebnMTBj6YDqG5G+ooxDM8Y3KKkYoPJXxlxeIeblmrgXUjUVTWMant222Y3Ce8j0nqGVn+ffPl8qx1sqXuMx5xRGwe7cMp9xcT3WZ0RhRkbfw0SC04wxl1iu3P4zFH44ETpxkmYW/L1m6QwKMVb46C5p7KhhGXASfg45GESOr59Lbk+C/LQl36ufayEbPA3conJ0O+1kw+tBcEXhxo+YGRLRKkYlFx7ELxpzjtm0TuWCQl8tGwL5hupL5uMICeLURrSf74RJoj/b6wMHhoJBvGSFNG5Fb4nX3k6FAZ9JbXgqZY83CUWvVmb7QgYez37++xuTrKQ2Sy791WYhyBAkL2XOov5D/o10o03AeUch+nDQ616a4g5142CvaNTE8zQ80UfuXsviP2KNJp2iaDiyrB2EaEZsqjlhiNMwHxOxzYwdyGp4Bqmlh3bRXU+xl+2heuYrh4nUUhDnUyRWVvmOtSHD6ZRn/2ipKf6dgu31oECYJeyKVVvbmCBXA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(186009)(82310400011)(451199024)(1800799009)(46966006)(40470700004)(36840700001)(36756003)(2616005)(40460700003)(40480700001)(83380400001)(4326008)(44832011)(86362001)(5660300002)(41300700001)(36860700001)(8936002)(8676002)(6666004)(426003)(336012)(1076003)(26005)(47076005)(478600001)(82740400003)(2906002)(356005)(81166007)(70206006)(70586007)(6916009)(316002)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:12.8871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c03ea69-01cf-4958-6586-08dbaaa85330
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9114

Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_locked().

Moving spin_lock to caller was done to prevent the concurrent access to
iommu_dt_device_is_assigned while doing add/remove/assign/deassign. Follow-up
patches in this series introduces node add/remove feature.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from v10:
    Move spin_lock before iommu_dt_device_is_assigned_locked() call.
    Rebase the patch with latest Xen.
Changes from v9:
    Make iommu_dt_device_is_assigned_locked() static and delete header.
    Move dtdevs_lock before iommu_dt_device_is_assigned_locked().
Changes from v7:
    Update commit message.
    Add ASSERT().
---
---
 xen/drivers/passthrough/device_tree.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 3c0322c797..a7d86a20a0 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -83,16 +83,16 @@ fail:
     return rc;
 }
 
-static bool iommu_dt_device_is_assigned(const struct dt_device_node *dev)
+static bool iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
 {
     bool assigned = false;
 
+    ASSERT(spin_is_locked(&dtdevs_lock));
+
     if ( !dt_device_is_protected(dev) )
         return 0;
 
-    spin_lock(&dtdevs_lock);
     assigned = !list_empty(&dev->domain_list);
-    spin_unlock(&dtdevs_lock);
 
     return assigned;
 }
@@ -225,12 +225,16 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
 
         if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
         {
-            if ( iommu_dt_device_is_assigned(dev) )
+            spin_lock(&dtdevs_lock);
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
 
-- 
2.17.1


