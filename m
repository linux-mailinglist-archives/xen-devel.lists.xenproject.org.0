Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5375677EE73
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585035.916048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDN-0001sR-LP; Thu, 17 Aug 2023 00:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585035.916048; Thu, 17 Aug 2023 00:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDN-0001ov-Hv; Thu, 17 Aug 2023 00:50:17 +0000
Received: by outflank-mailman (input) for mailman id 585035;
 Thu, 17 Aug 2023 00:50:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR4G-000280-Vb
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:52 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20626.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b658278d-3c96-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 02:40:51 +0200 (CEST)
Received: from SN4PR0501CA0046.namprd05.prod.outlook.com
 (2603:10b6:803:41::23) by PH0PR12MB5468.namprd12.prod.outlook.com
 (2603:10b6:510:ea::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 00:40:44 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:803:41:cafe::60) by SN4PR0501CA0046.outlook.office365.com
 (2603:10b6:803:41::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 00:40:44 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 17:40:37 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:37 -0500
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
X-Inumbo-ID: b658278d-3c96-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/J2kOAhk46W6QbyYtpcJ+1nY6rR7+pkglNypNUOaCrbFm5XUcxiyeQaoGz83560/wCR9s4JDJqdkiE/MjpkpLwPJ2N9vN8CSJHUAqdIBYN3s1nvp+7yzV59FJBIZ7zjrTpi+i1PUtBSXxuAeWm/nLK8EH7nhWIiCeg5tHF/Q/29QRfZMnXtcM7hYIBe6UR3Z2XiwMlEaWpr3D7qLGlQszUHWr7DvHX+Hh05qu96z9Q3ZxdKsDF54otLVt1FfMrnGFVTFWn2vzCoFkUzumtN7m3ALH8x1OlDVF1BKQbnLBfqpW/+q6VJEZNOvSz1BLoqNFBoIbWHvwSlKYH9+VS5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKa7svLG+XqwpbOJFC3IlsmtdaRP7xcFFG8yBKHlK2o=;
 b=LXSJ08Plb3EAmpJMYbOy3OFZ21H9p+FaEcIFT1W1INl+8tqZlJxnjpkMjqc1fR/2LBucxX1BWG5dq+25PHowWilq4mx6VNlrDEU7N9BzJzf7AoJrDGZorIIFkJ2k15d6ugwPT5YGIgYHhZxk5S1ReEVoflLJ65E+LF7j4s7W+2VZ2TdSOuvpMkyA86dQJBuXnyvbIaGLuinhjvrg/+dnZu9sZzyXJOR4FoeGWQGdm7E2mGGfISoC0NbNUBGa7LZpUgbP56KTBWcW2bcSIyKXNY59GE4VShrx5SDNlF2rfTS/g7or4g260baHGJDVhHEsLLEVtdXRd/+Tz1XJj6HFZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKa7svLG+XqwpbOJFC3IlsmtdaRP7xcFFG8yBKHlK2o=;
 b=blsIGMF/msahoLBZj/NYzCTBLqXhZ1KxGWi854bVr9ciI74l8G+PmwBSuYwJV2svbgb5cXQQvRfcnjujkDm8MhkXCVHoA97T8/18oj8OvtBV7OeQcpGMBII+Ts8UUmriJEb4j5U6dhlOlROepildEcV/eJg4tpTQ4+ThwCFOCZo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v8 10/19] xen/iommu: protect iommu_add_dt_device() with dtdevs_lock
Date: Wed, 16 Aug 2023 17:39:38 -0700
Message-ID: <20230817003947.3849-11-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|PH0PR12MB5468:EE_
X-MS-Office365-Filtering-Correlation-Id: 20262333-23a5-4846-e541-08db9eba978c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7CQm6EFisSNZimRQ6JoUKPjbIWnN7ZT44Nu57FXM7YhTZQRWHGfmDzXExWx+9yqPbZ6993RJ4HHGQZSr9L5Y0mXvIj1Q1ef+7SSolb7YjMHwIuRAhweJeemk91JoYnadewaq7QxOBHGgnIbChiUrG4toxcPBzamL2EkDDsDwZkEBLYonBqfTVAfmKJay15WOkaj0biqpFtHGNhekMow/kuW9YZxkxYqP8H7bbTLXaqU9pIDRaQuJJxtyPQh/mRpQVFUZExNw2+f0wzKZmFMdFIIRkX/vOZ0pcOG10qwlKs7ao1MHzygG2QCQ+0y8gyNkza9vQ7iE2yDJfFZOjONzbL4wFu5w85mSzQz5ZD28bM/CjTSYib2RhSDlaIjgAP6OM21QYxQOTdFR2PsqY1s+uN6Uo5j+ugAgvpSzehwDrT8llZcVbE5CagRdG6vPQ8Qxw2BgcqB1pl9NyuxLLoMwCa7WLCXRAXYdabEazdd7uehjfwZX7SWiRuB/FSCoVL0Dy1CFTf0atWniChMFZtr4myFc1Q7dcMzL6sa1+8iNXFuIQHfuG3YCIpWDqKjgtfEFy1J5IeQoPr8MFcR3X42mUaZMD28KzNeWPBLX0Zd8F+ohDzhPSh0l1/SqCgyyu2J7zlCy89B39Qu2xxvplxSRBNLYvd7dYyZ4aow+/UxPjv8EQWyZT0fDNMaaaKosJC1p5M0SHwh5a2ow1wbY7FC4Ci7SnOpoNkHTgLyapHcbWeUrGpEEsAfInKRmWivqN66GEGDJnI30lLM4eJbeuQyk0g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(316002)(54906003)(356005)(82740400003)(6916009)(81166007)(70586007)(70206006)(5660300002)(41300700001)(36860700001)(44832011)(47076005)(4326008)(8936002)(8676002)(26005)(2906002)(40460700003)(83380400001)(40480700001)(426003)(336012)(478600001)(86362001)(36756003)(1076003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:44.6131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20262333-23a5-4846-e541-08db9eba978c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5468

Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access
to add/remove/assign/deassign.
With addition of dynamic programming feature(follow-up patches in this series),
this function can be concurrently access by pci device assign/deassign and also
by dynamic node add/remove using device tree overlays.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

---
    Changes from v7:
        Update commit message and fix indent.
---
---
 xen/drivers/passthrough/device_tree.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 5796ee1f93..096ef2dd68 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -148,6 +148,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( dev_iommu_fwspec_get(dev) )
         return 0;
 
+    spin_lock(&dtdevs_lock);
+
     /*
      * According to the Documentation/devicetree/bindings/iommu/iommu.txt
      * from Linux.
@@ -160,7 +162,10 @@ int iommu_add_dt_device(struct dt_device_node *np)
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
@@ -191,6 +196,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( rc < 0 )
         iommu_fwspec_free(dev);
 
+ fail:
+    spin_unlock(&dtdevs_lock);
     return rc;
 }
 
-- 
2.17.1


