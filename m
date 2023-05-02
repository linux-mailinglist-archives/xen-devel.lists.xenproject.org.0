Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C86C6F4DA1
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528862.822577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzYz-0007BS-ME; Tue, 02 May 2023 23:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528862.822577; Tue, 02 May 2023 23:37:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzYz-00078z-Il; Tue, 02 May 2023 23:37:41 +0000
Received: by outflank-mailman (input) for mailman id 528862;
 Tue, 02 May 2023 23:37:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzYy-0004sC-BZ
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:40 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e88::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52edf28a-e942-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 01:37:39 +0200 (CEST)
Received: from BN9PR03CA0346.namprd03.prod.outlook.com (2603:10b6:408:f6::21)
 by SA0PR12MB4591.namprd12.prod.outlook.com (2603:10b6:806:9d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 23:37:37 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::97) by BN9PR03CA0346.outlook.office365.com
 (2603:10b6:408:f6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Tue, 2 May 2023 23:37:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 23:37:36 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 16:37:34 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:33 -0500
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
X-Inumbo-ID: 52edf28a-e942-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oU0ePOBiG+WFuk03h0aJuvgatXHo+HtslAsPF8/SjrUbRNz8GXcE6/2YtKyf2A3WNBqM/by7vOzfKMQPzzDyeXALfUbt7/SeNc4I3gJAEiWCEVZ5eOKWK9oviDcLb0JSPdTN0yse3ah6rZMytRmMZhM6PaQtXJg/fszsXPDNQmLVN/OUtJWZyjTKPHoEfSo+i87cYeYVhnDW9R0dupPBdcbaYxu1X5xBCG1Lsmbo6YU/j/rTWYzIdHKNkaoyBmembCoYu2+LKlVCwUnOCY7UoYKNFj2xydv8oaQQSC512dihHORCxXyXCFSngN0q5bM75KMH67vUboctcWB0vEepxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7a8SO//tZf8dnpDvLiol5y8mZo4siOv2JmDmv476O8=;
 b=VqaAMbUA8W+NWm2MXFVLuvfkaddrdbCs+sVauAxPeDyqqEHIRgL7MJ8bhyh/EEQPXoyNCU3kX2TvQKvx25tQjvMUQnNDBXpx22lvHABtkG/Wvk+Md/sWQTU7Vl+3dqdo7A/wN60WgtkcPw8W3jjzteyRTl+tR0R4r2+MMjiYruO5hdJLH7xlWYh569bXNu01MTUaZUy7Gp1tAmOHNgtra0doncKwGbvqufaZ/qjaewJeeNZzO9vZrjZdAVukKILS8jVlNiZWJKnTSrZtS/x4HiqtKHxmUVBfxFhlt2xH3+Gt9RgbKt5uUZCcjvJdv/Wv/Ep0kg0KWjvwcZAyWKkgkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7a8SO//tZf8dnpDvLiol5y8mZo4siOv2JmDmv476O8=;
 b=Y//I1YxSxs07Ke9XfwSAHsAWj3cIR16fafxzouwyg7k7PxSVdnm/R327CwyfLaFnMIwvGCTaQ5iaEwIhXnlPPsD5xCnQ76ZtuXM3DbJ4ruYvVuu4W2dDGBJpceuYQM6u0e6v5lpEAhlJ/vxyg9E7eLcFNVACK57GfkN7yPy3fU0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN][PATCH v6 09/19] xen/iommu: Move spin_lock from iommu_dt_device_is_assigned to caller
Date: Tue, 2 May 2023 16:36:40 -0700
Message-ID: <20230502233650.20121-10-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT047:EE_|SA0PR12MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: 86cb0c46-2d1f-4b3b-d4d2-08db4b6635fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r57mn/8nqbzEuAz8S7ebrddM+Jxdwf2cJa/mk60QqgcX+ghGXqbDvH7/hBVwN65/HxegsidKm5aDS+lpeVGcb6F9Z0cJreUAUojCavL7rczSVca3BYtsQKK7ixCyalADViBc2aMjyLILeoA/TINRadND2fd1Hp77IMkkffNScPof4TttK6FiH0/mOospzN8mam1RCAUC9pdeRSQ1+AClmYzPWdQ72O4e+nffDx75VM0yUtL2XwW43Bz6A5olRP5fwDBRTBDE38wAs4iekfeix2VYzysm0RzggOJ7ZVxjLSQ4xDrU7vZAwj4o7hmp2EgPIV7koe5E21v+WsVzT0XpkSqI8ctgGPd822o2osF20PxaeBNug8p2Qdpr8BF7uPcJyXLwUdf/0BFjez4VyanZzn0du8D2iMiBhPdkdQnfNnH6baW2EzFVZx2w4gPGivf73B3MWCYHLyuNticlldp/cHx/aCKI36ldyK8/kTYFZ53DiD1CJi5HVuJc36P1bXMXmBmp/hiDlMFhu72uYkKCpiQ/g8VHXilp5Wdf9AewmIH5Y05OdLhm2038GIe6ImZWMUOso9jrlKSn4eR9EE5yGjp/RnnwEsHL+AfUNYHLzQWLKsYHe7ou3VMroIqwcLj0Yp25sQIlwdZFJqCfZT3Y6fuTyl14bBEysGXBPKJVaGrTEZB+CZkx7mvJb5ZmkLbYlRvz7+J5R+c9gZ3DdRcieIACPBOdFVPtxtbecppjMpE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(46966006)(36840700001)(40470700004)(47076005)(40460700003)(2616005)(426003)(186003)(336012)(40480700001)(36756003)(86362001)(82310400005)(356005)(81166007)(82740400003)(83380400001)(36860700001)(8936002)(6666004)(8676002)(316002)(41300700001)(44832011)(5660300002)(54906003)(478600001)(4326008)(6916009)(70206006)(70586007)(26005)(1076003)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:36.7188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86cb0c46-2d1f-4b3b-d4d2-08db4b6635fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4591

Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_locked().
Remove static type so this can also be used by SMMU drivers to check if the
device is being used before removing.

Moving spin_lock to caller was done to prevent the concurrent access to
iommu_dt_device_is_assigned while doing add/remove/assign/deassign.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/drivers/passthrough/device_tree.c | 19 +++++++++++++++----
 xen/include/xen/iommu.h               |  1 +
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 1c32d7b50c..c386fda3e4 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -83,16 +83,14 @@ fail:
     return rc;
 }
 
-static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
+bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
 {
     bool_t assigned = 0;
 
     if ( !dt_device_is_protected(dev) )
         return 0;
 
-    spin_lock(&dtdevs_lock);
     assigned = !list_empty(&dev->domain_list);
-    spin_unlock(&dtdevs_lock);
 
     return assigned;
 }
@@ -213,27 +211,40 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         if ( (d && d->is_dying) || domctl->u.assign_device.flags )
             break;
 
+        spin_lock(&dtdevs_lock);
+
         ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
                                     domctl->u.assign_device.u.dt.size,
                                     &dev);
         if ( ret )
+        {
+            spin_unlock(&dtdevs_lock);
             break;
+        }
 
         ret = xsm_assign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
         if ( ret )
+        {
+            spin_unlock(&dtdevs_lock);
             break;
+        }
 
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
 
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 405db59971..76add226ec 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -214,6 +214,7 @@ struct msi_msg;
 #include <xen/device_tree.h>
 
 int iommu_assign_dt_device(struct domain *d, struct dt_device_node *dev);
+bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev);
 int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev);
 int iommu_dt_domain_init(struct domain *d);
 int iommu_release_dt_devices(struct domain *d);
-- 
2.17.1


