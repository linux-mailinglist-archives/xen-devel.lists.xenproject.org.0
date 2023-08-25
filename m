Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9F3788176
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:03:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590551.922909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmh-000091-Qt; Fri, 25 Aug 2023 08:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590551.922909; Fri, 25 Aug 2023 08:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmh-00005p-J3; Fri, 25 Aug 2023 08:03:11 +0000
Received: by outflank-mailman (input) for mailman id 590551;
 Fri, 25 Aug 2023 08:03:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZRmf-0007G4-MR
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:03:09 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20616.outbound.protection.outlook.com
 [2a01:111:f400:7eab::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2ee0ab7-431d-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 10:03:08 +0200 (CEST)
Received: from MW4PR03CA0047.namprd03.prod.outlook.com (2603:10b6:303:8e::22)
 by DS0PR12MB7748.namprd12.prod.outlook.com (2603:10b6:8:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:03:04 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:303:8e:cafe::56) by MW4PR03CA0047.outlook.office365.com
 (2603:10b6:303:8e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29 via Frontend
 Transport; Fri, 25 Aug 2023 08:03:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.2 via Frontend Transport; Fri, 25 Aug 2023 08:03:04 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:03:03 -0500
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
X-Inumbo-ID: d2ee0ab7-431d-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h03teoUtXTEV/W8gpGhhQcH40HUtjrLF15Kg2oY6m5hsrhNUvYFLLCRw3rQyxQCUwv/SMsh3tBJ6JHCVzgsNYI8zxW0DuhNqPBoBfuQO+yfwia4aOBasQio9lPtxytxSBtyAVrZSgqGAh6nFO1ETbIHb+07eaTm4xh07mM0OlzVf76H9VHD9cENPqg+yfYIKZrxV0b1k7xnHh2kcUGJWzn+jbe92XMFjVCiQADCM9MqGSuq4imgf52DjcnlsSCDEunAp24hrajOuEhW9taK42cTA92NqiYXL0NGC/9UY1FwpXtafaxsiHvVqCCQuYHMoZrXC/wwnEYsBkLKep7SU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46ebdCxwn7EavFAkYu+2lsP3rPq7Dn3Zw3ob+HqOtOg=;
 b=JY9doyFZHXaTMqM577rz0iGf8/LkJgA+aAu3dIB76ZHCJKTFmRFDdTwM6H4c5AXSLH45MYgN9T7dDSWHqTQYzdHd5P1EyTRUFT3oGSDHXzjwX55y/mSALyA18BSgFN6IMorg30gjKb1Qa0WNJPlQMbNBQ8ATuepY5XhBRzXp9jiVgj5H9pYsKqYYwGWntc69TzBfpe2SWJauXOkcx+w5yEVTuYgaktCzghh/+U4iHksW7wA22AVJPbrIs08DygqrNBu6D/5IohExTE8MBrELkX+lfJ90y/+0UpQfcXRgqtKBVchayMCjOYj7bjeX/5rFqufb8XpL/uRRHw6VHAvp8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46ebdCxwn7EavFAkYu+2lsP3rPq7Dn3Zw3ob+HqOtOg=;
 b=0z11GyZrE9IDmI33qPbF9JpTL+Y4CBZ6Jgz1ugiSlmfz9KDlsRHR3mL+y1egwSocddlM44HcFobHOnnhxoTMRXFLHTUkZSdbXgvhlpKa8xVwdrTr+wY1PD0SojevrktgQ7GvrVYBm1+MPqATB05n3qXrJ8Ohfv+d7LNzugGOEOA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <julien@xen.org>
Subject: [XEN][PATCH v10 10/20] xen/iommu: protect iommu_add_dt_device() with dtdevs_lock
Date: Fri, 25 Aug 2023 01:02:12 -0700
Message-ID: <20230825080222.14247-11-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825080222.14247-1-vikram.garhwal@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|DS0PR12MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d2bb6a4-4657-4993-a52d-08dba541b5ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AMDpI54a7bopD2A3IdXCBMqqrnt//2RJBvEqL/d8tH1oLrLeSYxL9cLHwwUVDkekLULQE8/tNnacjtDMR32YrI2LTPBlMhDhIbbd74F1DkwIRoBKz6Gy4ofkzEKb0vPQmmYe5IAtd1HfwkhuJacpREFVnjj+L8jIHL8Wh9fmfTccgmAhe0mHFx75+2kKIwA/EV1splDCTSy4vglH657XKpH5elO7/SMsFDf++iKppyAL5HVw5gZJEgud8QLKUVBMvEZayrsrpMs4w81OnFwbHBN+KO91E1qGOC4fLMmlraq456leVuDCbqRW2FcMmz5Uyzu62Rr2Ym2tiphbL1gDwYG0QGjFTYalQrL9fmMbhSoNfg1+Dhz6sp5MxKOGFEvdpmtU3a1Vmfw2PJEcMYQLDxEYQzgwwgwXaDqTyX72NWNEbkPy8+XFr99U+ae+OEU4NsYJHgH8f6Hazd5nmUoeNxD8rr7Xer4jUqcGUB9w+KlNXT/wFFs60/Hp8T7aiNV7obyeA7NQ/Jf29DYTH7it8iVWhSRiBjzwlPWsZs8ZJzS00j0/nnaTDWIeLhaY7LCFi8shvcExqKT+iRuvaPtP9e3miR5rYgwPGIFz43u3fmF4l6qvOU62F1CaYuqDgMJRmLFZZnmeM+wIR1/8k2fB2QfgQ9tqkzeqwn2uusFvVgBXzDWK7jtXVpr0YkZhUXPBDDV59AGVvR8iGvdRw4z3o9Uy5+NYJ3pglceXQYvtkCjQK2UO6OUF3VC6Ew8OVKXyEn86D241fvmyhQh9w0nwGQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(82310400011)(1800799009)(186009)(451199024)(40470700004)(36840700001)(46966006)(1076003)(40460700003)(2616005)(5660300002)(8936002)(4326008)(8676002)(336012)(47076005)(426003)(36756003)(83380400001)(44832011)(36860700001)(26005)(82740400003)(40480700001)(356005)(6666004)(81166007)(6916009)(70206006)(70586007)(54906003)(316002)(478600001)(41300700001)(2906002)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:03:04.5489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2bb6a4-4657-4993-a52d-08dba541b5ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7748

Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access
to add/remove/assign/deassign.
With addition of dynamic programming feature(follow-up patches in this series),
this function can be concurrently accessed by while making a device
assign/deassign for passthrough and by dynamic node add/remove using device tree
overlays.

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
index 5d84c07b50..1202eac625 100644
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


