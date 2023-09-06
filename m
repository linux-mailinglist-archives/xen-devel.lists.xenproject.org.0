Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E54D79333A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595995.929760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA0-0008J0-S6; Wed, 06 Sep 2023 01:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595995.929760; Wed, 06 Sep 2023 01:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA0-0008Fa-GE; Wed, 06 Sep 2023 01:16:48 +0000
Received: by outflank-mailman (input) for mailman id 595995;
 Wed, 06 Sep 2023 01:16:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdh9y-0006tr-UU
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:16:46 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b4ed898-4c53-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 03:16:46 +0200 (CEST)
Received: from MN2PR19CA0030.namprd19.prod.outlook.com (2603:10b6:208:178::43)
 by MW4PR12MB7312.namprd12.prod.outlook.com (2603:10b6:303:21a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 01:16:43 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:178:cafe::8c) by MN2PR19CA0030.outlook.office365.com
 (2603:10b6:208:178::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:41 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 18:16:41 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:40 -0500
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
X-Inumbo-ID: 0b4ed898-4c53-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqCLErCrKH3HAn/mkGie6vzVVS+mAZA8E27XmjeCvxNdEuWR+UbucMNz9AXJeIwpti+QIIhGpHH9LeHCZsh3+QPnE9J0kgO/9xWzBZPbOa4wcmtQKJ2TEWcI2TpbrjRdxYDnDH3O8ILgeGtbB9WUGEy59UveIqSe3uJ2mPXSe+zOFz/3A098jIWcuy0oOjHlvJMQ/jcw+4Ph5hIo5MqHEgR0Bo3VsNM07SVGI9boDGRGfHS6OgVQPlc+MvxQG+xQZkyYFXEzHrzjv7pT3PUtbbUr/0K/85tfWuePo3uO9eM9R2AmfSx/CjHSmWLYUDDUlw1iaoC5GKBYquH5lXaesQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6x0JurAquc6KiyXO0EZH+9rHRs3E5f2UzTo4cnlYiAw=;
 b=NvlREKPyw5e9WZCwTDCbZhekBIEGuWqza8lNIl1Nnk3Unjcw2TU7/R5zrDG29wSkV3N8ZPByOLXxuuCnLoDMOhRZ5SdHI9iA/3Yb410FNsGsgKHb8JCvhp9bYwWqN17BWuBfoEFKs9PILOWFQuKvcGNhCSOx+yzC+/S8+4gIet+UtadLjrZyq8AzHaKYrsCdLXJ+u+Q1++9ukJ538huEFPGy80tX9OdhuzTfhY4OzTq8q84UjPLomvd0K3Gv1fajifTA5ro05Nwhz8RlKbiALQBib0Ghg7V3lGRxe0WXGqSspr3WMs31JtFB/YrZ3TDObGGhFc/AoVycNpQfNUI15w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6x0JurAquc6KiyXO0EZH+9rHRs3E5f2UzTo4cnlYiAw=;
 b=pJkf2FBJCEVGMHUFYIRrzJs1GeoENxcA9SpTHNBBhLK0IChal3RgyH8FdbgG1l2GFiUIdrKl5gwW3fpCBl9C/yfgFBAEh8/a/9MlEB2QJfxNbcZizUOpl2vuGBjUYt9fogS/pPJBY7fhCTFUSoMgJMEja+UHIbKESh+8SgW1gKk=
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
Subject: [XEN][PATCH v12 09/20] xen/iommu: Move spin_lock from iommu_dt_device_is_assigned to caller
Date: Tue, 5 Sep 2023 18:16:19 -0700
Message-ID: <20230906011631.30310-10-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|MW4PR12MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 081765bc-8498-4c87-6047-08dbae76edb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rHIVzBjxG2ppYS7SqA+2Z5CIVzg4UnsD316X5fE3naZLfheza85XgEwzT/QODQWXUBRfyyKAiTK7BmxZWN7AQQsCeRcG6p06zjI/8OeMGqtk8xaoDkwPLTAm0E/IEHDle1peO83TN0pYVJzX4cU0daNORuzLwF4CXU2EziFlGimsbP/exfqhST62d8Cx23aEbdFKhAo322Cl9vVySaH9NxBQo8O3VvqejF+4QLbG9TF+dlUn3Mo2DJbRJl2zI2yv+4dzg2m4t+jWa2DB/YW0JjFomMP/LJ94r+zgVX4qjfofCyNwFOYm2kqI0qf5gsSPyxhEXVuEtnTQtjWVepHLQhIy68QOaNzC+NhNDy2fm+vLQAyIDXwX9JML3XcpqHvBzb5p3BJtoZ7W4Jp3aj/Fvn6gMqAonpXZBX+7+ZPdrR9pjKJzoLoxdcubEVHxmnRYlonGjd+73NTckuZ0hhbFU+Co0mPvuQRMM6BVxc6sCRV/+8VUKVLG9Mz2aSO9wzRIK00gmF8cmJ44U5JhATlrA2xi9J/9zBr8oK9yI+AWIKXeVlCc/C8uhY5iRE4xwl/0cT71orBJRdymkcs1xtJgI6P+wE4Il+hm1AILnvFnjH05TxPX7Kimb6WeXRQHxOntdGt3c0H7Q5rJD8YuTC9JPELdwyeBLB9hTHhk38eI//DHFa/rWE4/ZdvM9lsxkXT2snyxJzo3O6Uu5YbvprCNjWq0JGshL8SyAc4s3300lajpeoHqWSEs1FiaqC2s3+/o+j0L07MCWNs2otCs8lxhqw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(82310400011)(1800799009)(451199024)(186009)(40470700004)(46966006)(36840700001)(8936002)(5660300002)(2906002)(6916009)(316002)(36756003)(54906003)(70586007)(70206006)(8676002)(44832011)(4326008)(41300700001)(36860700001)(1076003)(40460700003)(40480700001)(426003)(47076005)(6666004)(336012)(82740400003)(81166007)(26005)(356005)(478600001)(83380400001)(2616005)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:41.9721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 081765bc-8498-4c87-6047-08dbae76edb0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7312

Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_locked().

Moving spin_lock to caller was done to prevent the concurrent access to
iommu_dt_device_is_assigned while doing add/remove/assign/deassign. Follow-up
patches in this series introduces node add/remove feature.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>

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


