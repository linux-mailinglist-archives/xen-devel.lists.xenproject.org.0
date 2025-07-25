Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D601B11FB5
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 16:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057888.1425577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJ0g-0002CV-VO; Fri, 25 Jul 2025 14:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057888.1425577; Fri, 25 Jul 2025 14:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJ0g-00029p-SD; Fri, 25 Jul 2025 14:02:54 +0000
Received: by outflank-mailman (input) for mailman id 1057888;
 Fri, 25 Jul 2025 14:02:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=22Yz=2G=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ufJ0g-00029K-4X
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 14:02:54 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2408::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c416ee7-6960-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 16:02:50 +0200 (CEST)
Received: from BL1PR13CA0119.namprd13.prod.outlook.com (2603:10b6:208:2b9::34)
 by SN7PR12MB7249.namprd12.prod.outlook.com (2603:10b6:806:2a9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Fri, 25 Jul
 2025 14:02:45 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::5b) by BL1PR13CA0119.outlook.office365.com
 (2603:10b6:208:2b9::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.7 via Frontend Transport; Fri,
 25 Jul 2025 14:02:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 14:02:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 09:02:34 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 09:02:33 -0500
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
X-Inumbo-ID: 0c416ee7-6960-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9hVxvV/yrr+H2Hcc6qmjMxGx4I5fs03z1a6+d9YgCNVxlqi38QrwZNmq8HstMYESfy37v35PdiiJm0Sly/hqRHECONH4USR3PqOPf9to3MWHbq04AFAhKpswRYCzX9bZJ9HatGtR4Q2gbfngps5mm2N8tBOMZmxFhnZ1MSLaHuWLMGjqEYcMlchxWHFwGb1KkY0D62w7wFxE+jJde/X1CDF5nK46ALlZj/QEOugohLQbN+YxFG6XO6X2Br77rOPS1pztUpp1IVFZruqzfZAVgqnzvHX/Jy1+7lsLUmyU0fbTvHcHkHh3X24JbV2NaaDxkVTr52Y4P8DWS6PVwnnmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdUn/H06mPicegLoC7yAFARWd0bp5RMwygayFQBYZ5U=;
 b=tCVqWR6vLaD8HR/Bg9PJhgn57StYP+d+H71FuojC4dNJNtS8jDwZLX1reOAA0XAPa4u5u/+eiW0BNvs3KSomAv82kFJdJJCBFX7dj38zl/QXSiL37czJqw3CDzPTaDdOJveDT22B8SsC01TZ70r6lzWGbNNF3ad7H4/pRoIczaHyXixKqTYmVeNGGaTl48Hf6d9SnV/Qs6ylFU1CNEBwnhGrcwZiPUWrhM/iUh1oSHLUg53Zvxs+JpbO3bsRzbxrr8Nb6pJVsA8eb+tSnVMJ85rtGCCb9ohJtYSO4+GWeK+fn9KsyTCyQer+kU12DZn3Fz7mg7Jj5kkERkU1T+J6AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdUn/H06mPicegLoC7yAFARWd0bp5RMwygayFQBYZ5U=;
 b=c/lH52LVnw7435GqTxoPG56Ny5LHot/49lkArg5mPpvltbroTCQDmtyxCrV6tGnwSs3nE+Ez+BaMRqx2yAmZYmxEf6lFRWwgyOXbQ2a1eVksrqIow9nnzU5rmd+HOOYVM8UNtMmA39HgU/JR4QdLzeYFUB1jD1ca4qV8fYRO3ws=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v5 2/2] xen/arm: allow translated iommu mappings
Date: Fri, 25 Jul 2025 10:01:26 -0400
Message-ID: <20250725140130.4008-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725140130.4008-1-stewart.hildebrand@amd.com>
References: <20250725140130.4008-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|SN7PR12MB7249:EE_
X-MS-Office365-Filtering-Correlation-Id: 2abb871d-582e-4557-a927-08ddcb83ed7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+CClLNo1QOTCC0Wdy5/oeAbuqpYGa33yM37EP8k/hS0j6Ab9VJN/Mp/8XCjP?=
 =?us-ascii?Q?g5oWfN/B5GRXtq0jh4HKqLOS65RrZ/pYQlOYkTCCPBvjC0n14n/KEcRgKjTp?=
 =?us-ascii?Q?D669qHM0UK2LgA68bzLjCCT35lmZMQ2djkmS4t94s+XsOTV8a9GySDkJTN6A?=
 =?us-ascii?Q?Xrn+yQkMUHO1M7y87UuIsCapsRQaLvG1r2S2KSxBJjnwZXJbWm1IMEOBuNyq?=
 =?us-ascii?Q?ZYVh+rwfQvbIONFYZDmWTLRkP2Q4h6AD7L01TS0MVACu0sLNrBhI0rTvGlNA?=
 =?us-ascii?Q?9IKMq+JBgukKpVnX8/DN7ulFqg29GNM2Qj89ssdHdobDbdeLt0MuKsY0Oxa4?=
 =?us-ascii?Q?p2AgVkyqQfC7+6+C5t1It63B0On0lhPV57gDDY1YScZZMHfPD82pml4xj9yO?=
 =?us-ascii?Q?zYvoS0qYVCGofmsNOxqmjhcUI9ZMexWTjJOSbmgqC0b24IueqFoIbrZSqC9g?=
 =?us-ascii?Q?nSSZUvkn0njU6Z0J+3416kUisUy3b+VbY50I4lo+uaDVpE+c/D8KweyFHfuP?=
 =?us-ascii?Q?Jcg+5j9IQ9lgnmDgrVOO6XQsLZIV/XfRLXhdoZc0TOl0Uz8jQ1Ie3/kVfxXx?=
 =?us-ascii?Q?uyUT0iTxFc9PvPAJ4J1W3hQxs22tniSsUTPFWjj7YLCQ+WIr18lRHAEWKqaM?=
 =?us-ascii?Q?100rO1A4DSuQZxcCgzlUdAEFyt+XpBOk009n30ul/1eqRv5CJcwHOACQVu6c?=
 =?us-ascii?Q?0aAr7340eCJEJn33cHxGarUOwsR2btmspM5ipXgWHReRtbHHfpfFu7AobuI3?=
 =?us-ascii?Q?g4k+6TLTD72T1ApGG+JBY9O8jRLvD195/JuRgmpcL0SNilr7lyyMD3NBGx5e?=
 =?us-ascii?Q?U3EUVxMNX2cRgOwGOUzzSHXqYN6VNd6Xdonif5Q9pFt8L3E1jM5tLkClpgQF?=
 =?us-ascii?Q?BgwdQfW2PbOQYlPPk9GRj07IzADlaGf1Mytj1PNGdsP/PqGfSTbuh8tcJB+D?=
 =?us-ascii?Q?kRjTvmC+jCwrSUo6PIbGKGejNtDjTP+LPO8fXbhW6FbPKcTftu31109gufAS?=
 =?us-ascii?Q?pN4wkfLRm4XM/e49mMfmPjBnmlkxqpK5Mddt8/jLLIyyYL0h5q7kUbSM8Wlf?=
 =?us-ascii?Q?MBaNqm1TrM9V0v2I5bL3zlXUCc4n9zPgEhPCaSyYJoL/urNUx7399z8U+nwv?=
 =?us-ascii?Q?jdTJJhJcKZtII4YmJ36CxbuXxem/IurPd1ob4uFHgJuKzjE7mHOwgeVHx+fq?=
 =?us-ascii?Q?0DvHab44veYLx0qIeJ6eEYSCrewOjnb7iLZj6j4erVo29o1I1+a8QGkBsKBX?=
 =?us-ascii?Q?Ks5GWY5kQ7UDlefLrm8S6u5QPCGBQjRj7Z0Gm3hlyTFVaseo5q89/nwUTpSE?=
 =?us-ascii?Q?AHqoHGMxD0/R2wr3lA1ZbO3db2MneUvRQU87gntMPPTclneHX77cVIWbJ4+J?=
 =?us-ascii?Q?5Lb9hNoVAvygG6lzXbsxtvymiUVrnKYZbJOziqfIKF8ZLbud3lGJbVOsQNtT?=
 =?us-ascii?Q?tcUTZKPdDhZDDqzxy2zyp3m9sIYvPs0GkY8CYDjHR4/ytVHk7SA2uAdJKLPp?=
 =?us-ascii?Q?jq+EQHAENHMPWPshBOtEW2MckBTe/dTTayo+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 14:02:44.1697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abb871d-582e-4557-a927-08ddcb83ed7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7249

From: Stefano Stabellini <stefano.stabellini@amd.com>

In preparation of exposing vITS to domUs, generalize arm_iommu_map_page
and arm_iommu_unmap_page to allow ITS doorbell mappings with dfn != mfn.

The mfn does not need to be passed to guest_physmap_remove_page since
there is no mfn checking on the p2m_iommu_map_{rw,ro} p2m types during
unmap. Pass INVALID_MFN to guest_physmap_remove_page.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v4->v5:
* no change

v3->v4:
* no change

v2->v3:
* split change from ("xen/arm: fix arm_iommu_map_page after f9f6b22ab")
* both map and unmap
---
 xen/drivers/passthrough/arm/iommu_helpers.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/passthrough/arm/iommu_helpers.c
index bdb271584b0d..a3e3cafb8705 100644
--- a/xen/drivers/passthrough/arm/iommu_helpers.c
+++ b/xen/drivers/passthrough/arm/iommu_helpers.c
@@ -36,9 +36,6 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
 {
     p2m_type_t t;
 
-    BUG_ON(!domain_use_host_layout(d));
-    BUG_ON(mfn_x(mfn) != dfn_x(dfn));
-
     /* We only support readable and writable flags */
     if ( !(flags & (IOMMUF_readable | IOMMUF_writable)) )
         return -EINVAL;
@@ -49,7 +46,7 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
      * The function guest_physmap_add_entry replaces the current mapping
      * if there is already one...
      */
-    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
+    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), mfn,
                                    IOMMUF_order(flags), t);
 }
 
@@ -58,11 +55,7 @@ int __must_check arm_iommu_unmap_page(struct domain *d, dfn_t dfn,
                                       unsigned int order,
                                       unsigned int *flush_flags)
 {
-    if ( !domain_use_host_layout(d) )
-        return -EINVAL;
-
-    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
-                                     order);
+    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), INVALID_MFN, order);
 }
 
 /*
-- 
2.50.1


