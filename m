Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D866DE4B1
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:20:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519877.807033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJXB-0002nw-Fi; Tue, 11 Apr 2023 19:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519877.807033; Tue, 11 Apr 2023 19:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJXB-0002fC-3a; Tue, 11 Apr 2023 19:20:05 +0000
Received: by outflank-mailman (input) for mailman id 519877;
 Tue, 11 Apr 2023 19:20:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUc-0004Ta-Ky
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:26 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e83::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dc924f3-d89d-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 21:17:26 +0200 (CEST)
Received: from MW4PR03CA0021.namprd03.prod.outlook.com (2603:10b6:303:8f::26)
 by PH0PR12MB5419.namprd12.prod.outlook.com (2603:10b6:510:e9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Tue, 11 Apr
 2023 19:17:23 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::8e) by MW4PR03CA0021.outlook.office365.com
 (2603:10b6:303:8f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:17:22 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:17:18 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:17 -0500
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
X-Inumbo-ID: 7dc924f3-d89d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mc7+AWllmzix4mhii1U8rnfn6L8ASn96uvHv2soW2G7oS/3cPcG/WPHUuDLB+gHbOMNpDcX5jRXZqCgLhpusyEg1R0n+mz/yllTm5QaeY4RI32zVz4/gYMdFKTJKM1aSfofl01QwWJ60BIb5tzqUHYHmw2+LokFw44QIaOMTEccm+xh/MP4D6Mr2c0WftqUjLDtMZuFXUbW1dP573ft+kB+iOw8Uec9EU+SgqOkjEmleM400hkhMhM1xTVs1yzcTwh8cv/23Fibu5oHI/h5g6ToYlPm1PWlzi/cXlBbGWYHRZTJ4Et9UEnxpUwGWGtm91S/vxOibgh5Reu43WmfIUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLWShZkghSoju5aCTSrHjPTktEFI3gdZrQ2ShX60hx0=;
 b=ZzvG+mK/iy4AgUZDTYFPIQYPZO+KAPqS1wjw2S3ySjkMCrDPW/p7P0Pb9tYbfao7N2wXlSB+GOhajUT1r93LBMrYMaOStDb2tWPzI1R0WOlD2uNAFRdBX/nd4IY8s/4ELcLxSCcTfOUBOWR8olwMUeKCZ12nCKQlN2Z/0tPfdDw05IlQHVJA5ojUFqjObsvOzDxxicj2mBS9V+asAN7T7vGq1+42BEvVUnrPd3H8jN/pln2atHXnmNF6xB57s6Oz0oW80KFunQ8oA34qGYuswx/4ZWg52NjAa/27D57vY+zFiyoq9ZOx5T/F1ZoYLY9KF5aDQg10Mv/Dn3cK+QCDVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLWShZkghSoju5aCTSrHjPTktEFI3gdZrQ2ShX60hx0=;
 b=KVktFdAFizbAL/V23oXfjwGQ1VwQmvuLOLNg9ydmkLqePyqfEfZtuz9SgQnQ3IGivyHAElCOHj9+oLQza55PUBKSr1IglMdUNBPbvmbJZ0zY59ftKxbgf49iWnuXKBY0p2zGrDCylHIKyzQ/gfZDtc+nt8cYRs7fhLIAcfwjGUk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Julien
 Grall" <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN][PATCH v5 10/17] xen/iommu: Introduce iommu_remove_dt_device()
Date: Tue, 11 Apr 2023 12:16:29 -0700
Message-ID: <20230411191636.26926-29-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT048:EE_|PH0PR12MB5419:EE_
X-MS-Office365-Filtering-Correlation-Id: 6efa7f57-ca98-45af-4f83-08db3ac160c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9q1fBSp1v32ZaZSlxWE5iV198r5t8GU1JGK5iYoab7v6pemY0mVsLrBfn3g3VIFB+ZSQeujLUZ9GW0FrxRlTMlchWsvewHOZF8yrhIrEucnfpn4+KA9W2R5ZvXMlIfrd8QPZzs2Gck1ubm3WL0SbOe5FbHeVHi5DFRWO0LRfN8m1oKh6WguUgZF19ZQ8yjHqSmHEpt7WnWGL9OSUamL9m9t9z53G88xg96P6nnkUCkjLmhyBq/lA8gflXEfMAXNgI6BSWXo0817OFAar17z0qEkXP0siB+Jittc3yAtJPsLuihLnllrhjOjZzttP4/NaUCOShrajkPSXmVEMM2zaqnUWZ5EufNFS4NVEqqutDC7y+m8ILU4iLtPdq5CTFf51CrrXc+eaxZKyx1UghtgQOqucUCkY8lgDEv3Mjpy0zVCb2n5cgoWDtSUNYcEGdqzow+n6uVl38+8AEoWXjMdEsd0Z8kz4NJ6guUKHMgmEk4uOj1lG339ZbES9JzzTqfoJWqExFGTlNBk00PGOs15RDv2ArSC/ZjN61mGL56Bu77qclZqQqIwZN3c03bJCo0AjvIQl9OSx7UJPGoqclZEsRfVrpNz+5MYCSvEStuGF0HAgwqGcU6smopMuGzBx4N6dUNB1H0DMqDnDqH/CmkOhJSPcCkAbasO1aeOr9qiXSZOO5yTaz/aAV/1180qKkVw4BCdR74iZ4fR4pPPZn0njt3mA1CNd+NPtSbNRVLB8YOk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(70206006)(478600001)(54906003)(70586007)(4326008)(6916009)(8676002)(41300700001)(316002)(86362001)(36756003)(83380400001)(426003)(2616005)(336012)(26005)(1076003)(6666004)(8936002)(2906002)(44832011)(40480700001)(5660300002)(82310400005)(36860700001)(82740400003)(356005)(186003)(81166007)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:22.7966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efa7f57-ca98-45af-4f83-08db3ac160c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5419

Remove master device from the IOMMU. This will be helpful when removing the
overlay nodes using dynamic programming during run time.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/drivers/passthrough/device_tree.c | 38 +++++++++++++++++++++++++++
 xen/include/xen/iommu.h               |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 457df333a0..a77a217f3d 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -126,6 +126,44 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
 
+int iommu_remove_dt_device(struct dt_device_node *np)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
+    struct device *dev = dt_to_dev(np);
+    int rc;
+
+    if ( !ops )
+        return -EOPNOTSUPP;
+
+    spin_lock(&dtdevs_lock);
+
+    if ( iommu_dt_device_is_assigned_locked(np) )
+    {
+        rc = -EBUSY;
+        goto fail;
+    }
+
+    /*
+     * The driver which supports generic IOMMU DT bindings must have
+     * these callback implemented.
+     */
+    if ( !ops->remove_device )
+    {
+        rc = -EOPNOTSUPP;
+        goto fail;
+    }
+
+    /* Remove master device from the IOMMU if latter is present and available. */
+    rc = ops->remove_device(0, dev);
+
+    if ( !rc )
+        iommu_fwspec_free(dev);
+
+fail:
+    spin_unlock(&dtdevs_lock);
+    return rc;
+}
+
 int iommu_add_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 405db59971..079c06321e 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -218,6 +218,8 @@ int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev);
 int iommu_dt_domain_init(struct domain *d);
 int iommu_release_dt_devices(struct domain *d);
 
+int iommu_remove_dt_device(struct dt_device_node *np);
+
 /*
  * Helper to add master device to the IOMMU using generic IOMMU DT bindings.
  *
-- 
2.17.1


