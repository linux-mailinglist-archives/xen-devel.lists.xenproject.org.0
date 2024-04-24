Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293008AFFC3
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 05:35:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711017.1110658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTPf-00039U-72; Wed, 24 Apr 2024 03:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711017.1110658; Wed, 24 Apr 2024 03:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTPf-00036D-2m; Wed, 24 Apr 2024 03:35:15 +0000
Received: by outflank-mailman (input) for mailman id 711017;
 Wed, 24 Apr 2024 03:35:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z4K=L5=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rzTPd-0002In-SH
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 03:35:13 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a828a1fe-01eb-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 05:35:12 +0200 (CEST)
Received: from BLAPR03CA0041.namprd03.prod.outlook.com (2603:10b6:208:32d::16)
 by MN0PR12MB6245.namprd12.prod.outlook.com (2603:10b6:208:3c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 03:35:08 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:32d:cafe::24) by BLAPR03CA0041.outlook.office365.com
 (2603:10b6:208:32d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23 via Frontend
 Transport; Wed, 24 Apr 2024 03:35:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 03:35:07 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:35:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 20:35:06 -0700
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Apr 2024 22:35:04 -0500
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
X-Inumbo-ID: a828a1fe-01eb-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyKfnslBHUGSFb+U1g7rUkgwdiou/ZcNHLpd2EtH6LMQwIfu6mAyhdxNIMaz9q20IoSPZSJSuuhak5CKkC0Oxl/OPKS1r2srfnoyKV0EwkRBYqkRQ3eNm5rMI8tI5hecKM0TXRNhFkPvMjnzP+B5ST2Ncdy9IMxwMXavQHH1AkLQ5k55ZkT0/V3aOjzzc8T+yFFRRIfXGVOuRoEXKQ24qm1N4sb7GApTPdPWUJpWpyRts+MawUB1qOTqbJqcG2M2UjcTE4tUTvY07rbsi3UFunRgBlilD/HxcB7tCi4xLQb2IhefcU/JXr+5SCMw2RYr9YPYrmrQPGfjKh+JZK9wWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71+mKXETSrKvqqiB26Vzc3zFez3NgUks8pMM+W1JiUo=;
 b=QXPq3AJwNthBY1mqJIf7+j5udijF3rcURmfDt5slmyIMkeDyW+f8jrw4ylwze/WXeOU2mG7YUnJWkIBtQdh17RCV4ImzhNUVEnf7fkST3Z9VnRqdkGdmezUA7QoCs5m9mnVJSdn9fdAC62fFJTgRAiVrg/QaK/pXhuOgswxisZKV7j2elliIkgfukno1jEvFWjqC5OTXQGXmwKT1QwKICILFHpjIboeJy6uc/Lqj8PwjF7M8ivTMPcKpzoatoKX39Cmy8p3HR3gVjg4l3tY2A58mSCNhW/2OKSd2x6AgALT16yWVVxzXF2OhfII9vhyT1WQ0fXK/eEuCLKyc+Z0+bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71+mKXETSrKvqqiB26Vzc3zFez3NgUks8pMM+W1JiUo=;
 b=tDJldnezdawTsLP7hJqnQjfwme/BKg/ApBCTczBMh5bpdhdRJNwQ9Cd59aFmihxtZSFcohumCLbD9BJ56wrLkPp/HPrx95KojSXLiW/PtCbEUt2lnlsZUwzDL3Yr4sEr+sAd1we+f0RGGAVIiit10dr6vE+rsWUfJc3Rawn5cDw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Vikram Garhwal <fnu.vikram@xilinx.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Henry Wang <xin.wang2@amd.com>
Subject: [PATCH 03/15] xen/arm: Always enable IOMMU
Date: Wed, 24 Apr 2024 11:34:37 +0800
Message-ID: <20240424033449.168398-4-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424033449.168398-1-xin.wang2@amd.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|MN0PR12MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: ebbf373b-8405-468b-5ba0-08dc640f89be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400014|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3HMUgQPmwsD+InmnusLeZYmqBWwE8K7hNQMnrxLWCLcqPUpMJ1+cZUW6YfWM?=
 =?us-ascii?Q?gemu7NaQtarL2uuhg0WJVkjowH6Sga3WCBipcYKQ/F0VEXYe+wrQXdZBH+WU?=
 =?us-ascii?Q?7KA8zakcpuoYi78BiItXXlcVFqPpgav0DM6pZH+F2MfmrHvagWw0qac/+rtx?=
 =?us-ascii?Q?MjWkqBIWK3dO5XK49zBuNCP971HZvngBrN2XWNoKEho7NJTsesTsv5N+r6YA?=
 =?us-ascii?Q?pLhkCSTG7/pogEhV81gZGvBU2+j9P3EnyxZ6S7CVE1eyxRxcMo/9s+Kvos1G?=
 =?us-ascii?Q?ouMLqNHosIhI+L2Cr8or2AH18zBJpn6AgdM+UMrdQhj1rWBpydfCSZosA8Eo?=
 =?us-ascii?Q?0/qXWiI0XWxV33s2mE0giM0qrJIycciv1BtdRBaF6JpMy2sPC4UtyGwa0A6j?=
 =?us-ascii?Q?1rACipoAVeE+uSkLu+O9/afDIlZk0FXxYKXtd8/u1qQR/o8Eq0AfjS5ggVwB?=
 =?us-ascii?Q?3qs0zFzJa1ZeZbNyqkGvr4I+F64Wo+dgXPu2Lx+QXONIQXe39rJUPPFpwS+z?=
 =?us-ascii?Q?iUd90OK/h6FKHo1gr7mOknBUo/RPhfieKDIP5a4n3CeCZ7gDhD4uSZpZgKWD?=
 =?us-ascii?Q?ApN6cizUKKySsnhYhkMdwb9HsllxnAifeHFjwubiiJhf804jkt/N7O2RXeSL?=
 =?us-ascii?Q?WKuQ2iS9hWBB2oQXhWbjxCuFf6h/CXsC4FHMPxDPLoYTeEz4TFbqBL5cn4S9?=
 =?us-ascii?Q?D4l8lz4lUMbgfa1R+tgt8hfWXXIXFzti6pggg3zNGA9m1bWVCCuNUziHJ9kP?=
 =?us-ascii?Q?jV11wql+DtbXI4+whwKz0YfashCxmeOa42WlE8VrGnHdYvLmDuzYd1Sw7ZDj?=
 =?us-ascii?Q?kVisFyopSz5qwYFmcSKPOkP3z2aD1lQpB2aQ/rZ3r8gxtgAylnjBZNDAZKz1?=
 =?us-ascii?Q?8r3Q0uGncGFLI+UyJg5KxOho1K01HPVHAf0hXVtlT+5VDdz4hoz4+5JkF6tc?=
 =?us-ascii?Q?nrY2sU5U3w5QQyJU3L5wrYoldoeqkvUFkRwzzPvGBfB+TVIKuJYkTNcLlsSN?=
 =?us-ascii?Q?yCVnp6YEg8ixYQcQ69jAxkdQTmezO+gLW1UPq5zhg0Z5SKQDCO7Lnc6bcpin?=
 =?us-ascii?Q?XjCwkC6OLlBPTQaH5hYTmcYSL0alYIFZO76tlo9D7A+Yf91qVI5sta84A1w0?=
 =?us-ascii?Q?3vKaLMoxuO3Wz0Gx4IweBynVdn0BOSA3L011hJHxQ8dOVNbdIwq5U1f+CkQ4?=
 =?us-ascii?Q?ucnJK34Yhus7H/pj6DLIo9DMSxhFHeODMzEw/rA9pRD2syWTiISMyzv/nlUf?=
 =?us-ascii?Q?eDWwYadsn7grZtgBnSWE+PqgRUuot9lT42EOJyvRqH6ZOmoJioPhgXt2buJo?=
 =?us-ascii?Q?PBRmmoAgexqxbGPxgey+wEiJ+hmn2LKn1pzGQ2Bh1fEa6WF2+BFsx7J30jv7?=
 =?us-ascii?Q?3H+Mi3w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:35:07.7539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbf373b-8405-468b-5ba0-08dc640f89be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6245

From: Vikram Garhwal <fnu.vikram@xilinx.com>

For overlay with iommu functionality to work with running VMs, we need to enable
IOMMU by default for the domains.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 xen/arch/arm/dom0less-build.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index fb63ec6fd1..2d1fd1e214 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -894,7 +894,8 @@ void __init create_domUs(void)
             panic("Missing property 'cpus' for domain %s\n",
                   dt_node_name(node));
 
-        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") &&
+        if ( (IS_ENABLED(CONFIG_OVERLAY_DTB) ||
+              dt_find_compatible_node(node, NULL, "multiboot,device-tree")) &&
              iommu_enabled )
             d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
-- 
2.34.1


