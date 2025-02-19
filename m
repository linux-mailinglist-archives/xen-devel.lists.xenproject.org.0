Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCF3A3C63E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 18:30:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893316.1302231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkntf-0002oS-64; Wed, 19 Feb 2025 17:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893316.1302231; Wed, 19 Feb 2025 17:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkntf-0002l2-2A; Wed, 19 Feb 2025 17:30:07 +0000
Received: by outflank-mailman (input) for mailman id 893316;
 Wed, 19 Feb 2025 17:30:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nfZP=VK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tkntd-0002L9-Gv
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 17:30:05 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2418::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 238ae00f-eee7-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 18:29:58 +0100 (CET)
Received: from BY5PR13CA0012.namprd13.prod.outlook.com (2603:10b6:a03:180::25)
 by DS7PR12MB5717.namprd12.prod.outlook.com (2603:10b6:8:70::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Wed, 19 Feb
 2025 17:29:52 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::f1) by BY5PR13CA0012.outlook.office365.com
 (2603:10b6:a03:180::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.14 via Frontend Transport; Wed,
 19 Feb 2025 17:29:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Wed, 19 Feb 2025 17:29:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Feb
 2025 11:29:49 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Feb
 2025 11:29:49 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 19 Feb 2025 11:29:48 -0600
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
X-Inumbo-ID: 238ae00f-eee7-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxthUMThLqtgEE433xneGjLzgeOpFyVSHq+yYtr2VV0MnCXmU7L2VrwttLsO78XGH4oJE29HYIJIqd5F6AXN2vrCVOtVRIuSG2BU/vAg8ahrS52ltNSQY1PM+MtZRF6YL6j6MeF3te1WLuO0feIDEQ83yA77f3UqwMsgR9tH/2yiYBLtMoOVFaKsvF/9xyIlWPrmaqWlS6oRtrV6gAj2bgyMPgx9QupbZ6YJtDvgq+SldtfrQLrkSUJV9SD7h/vc26DacodUkWxHq3e7klUd7lkuLC0yLEE24QhDPVh+WzE4WV0fm/k/Dozhe1lvIye6wRzSPVWEEvvTe8Ab6+Vh0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAPeOGg/lWgEcPYoLLPb9eya9FoS2OpA9Oj9nfKIrpg=;
 b=FelY9FNCUtI5hIEsEyf7gCJUFo9Dn5+cfmoxo5xb2OoW7p+/g/yiiXz+8y9iF2Uf6LGOPI2ajsqklfehWtbIxOoGrMsbWF8cKIKCg6ym5EW04NPA4/BY+UI5mAlTg9gMFM5UO59ANQnd2ZxXMTVOA+bdN2RxeO85J8mqMdyZj9xeoUbJnu/ZOplAA4d1mF2jut93kmTNLjTZKMVBcaT/fru2TZJEzFVIBjbfLkP83o9jIUcozOgPTS5l2jFZJ1tkgvWQcFnmis0tfcBIbbb4Ko1iekOnEVF3P56U86mBhQCmNddga9XjV9+ghrXrSVAIRrkDlSctWgo098gTKgkAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAPeOGg/lWgEcPYoLLPb9eya9FoS2OpA9Oj9nfKIrpg=;
 b=irt9/tfoX4nhRiRXzyVPLhbpFtiM4SCbXkfV8ccZfO5OMqGo4bcqRDbcQJBqk9rjUdKdaRdoLNKoR/mwNg+KKWTbQPwH4//ikGPCAtCn0YLP2eDhzr24uheuEEnRIjQzi5IGmmbtmy/jU8GOy0RHqUV8iQyvFEfudxqG4X7taxE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Create GIC node using the node name from host dt
Date: Wed, 19 Feb 2025 18:29:46 +0100
Message-ID: <20250219172946.359234-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|DS7PR12MB5717:EE_
X-MS-Office365-Filtering-Correlation-Id: deaca4a3-4220-4b49-0117-08dd510b03f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d9gXUTFc8hnoOd2r0azxqTQvmwrDLaIXxPHXXdM6PeQnnHntRM6XJu3jF6l1?=
 =?us-ascii?Q?2DKK3I1IBqIos4BVp+oOgT0+ZuAejzkjYew6hTk4FN2HfazfacibQn3ZVmXS?=
 =?us-ascii?Q?QU3AO/mNot84q/g+PTMHlwUbT47kGD7GCc3RZLNOK0+oFYJgsifRsay3i2T1?=
 =?us-ascii?Q?kw1EjaSds4ynM3chCXi8eFK8uW81PG3hflzTnysx7eN43W4IYsD+Yrx7O/BT?=
 =?us-ascii?Q?QPY1vJ46OaS/Avr4b96EaUkNgmZtTCrhsVaA1z4b+oABrSAFgNkceRNsQouA?=
 =?us-ascii?Q?nEK98WpzRmHgGQrlN5WgimwzwklDJMiKT9d0dyyxCuSYxsv2UEGyJv94U1V7?=
 =?us-ascii?Q?2ZCTiKrfNbf5Sun7+to3YXQ0uq3Zffj37NxV1LHmh0v1ngwEL+zgHomhuuwe?=
 =?us-ascii?Q?ZSvJKhZip3jIsX3F7dq9SbqAzIH/hRkXKuotpeOJWIJ4A32MfPWnMVPKYbs+?=
 =?us-ascii?Q?JpxXkT+S2BTX2Jq0/+nYrWdRBDBr9YjtVNNkbHUytTspyvgcqi3x9paqKpgC?=
 =?us-ascii?Q?y77imrgpfYRKftEseNGOjIM4GD++n84AvugUE537mTtMHjHAFWY2jMy1JO/C?=
 =?us-ascii?Q?rjKMYR5xBQT570O9qd9L4dbVU2ypVKEA9xx+ZUMDCpU1urB3R9wJigBifLED?=
 =?us-ascii?Q?9yA99iqKV0DZpMW4843jEX0DCGC3dm+/1FX+1ugp0+jJEFTj2PjsTw3vjynw?=
 =?us-ascii?Q?L9lbeuhl/qbpYcduh0xfpiFwCP3wPGD0QDc1KAOfkNdKzQ8dnSZNzW1B2fv5?=
 =?us-ascii?Q?V1v2mCG1cbIzphnM5Cb53yeKFr7GL7UT6JVW5APuyqHG+c5+Be2Ov/BHZX4s?=
 =?us-ascii?Q?N+Q+rNtKan8eWL+aSnm9D+0TcRIPmPyXCri0gSEZvjO0118gEtZo3lURoU3E?=
 =?us-ascii?Q?im8hEi4n2eldPJYDfDtfQE6fH8rodzEy8sfDQsJ42zBkPREHlqTP+KbEHxy+?=
 =?us-ascii?Q?hBM3mI+SKbjg61cxwZDiO8/dmstctm2oxnuVvBvA1//DYGsww7vMydnKQiLM?=
 =?us-ascii?Q?vtqIZi5Azdcfxj4YTuT0LmEdDjetNroJCXGR+CeprPu+bOEqD87xy2JTP/7n?=
 =?us-ascii?Q?Jj87fXFMlc7KGLB0MdmIx6MyN0dNGfE+u0QLp7sg7VqLUHsjzrEBR9f+T0RQ?=
 =?us-ascii?Q?M+GBd4TzeW7M5pAu+5sHqUNK1tya2i0L2BGp/58Sp1tXtLznbbBaJ1igTaYt?=
 =?us-ascii?Q?m4Ti0HY4qxgRIwWxMECB/w3C04sj29pLz0OwJaxN1KdJRnhJGPWahUA994pv?=
 =?us-ascii?Q?M/dmpvvbMhntAvCKJd/Ib+hl0kstwmF8PY4H29uZ1969oxvD6OT9fhHDSvwG?=
 =?us-ascii?Q?k1nTzVelwSoq5IINkR7V/aCVlFO1vWyeo1UbzZWSQDhEKDC0l/DmenfYgK/E?=
 =?us-ascii?Q?D9K3Xr52N2dMrHvgpb5LAAh05B1QSnWMLuezDVWUHC1mJA4knigUZ+s/QxsJ?=
 =?us-ascii?Q?/0q+TDqDi3Z8XiqVdiV5feGbRO36bv1ddN6LqOPZLdGCv8CmhOWBBMsKJmZl?=
 =?us-ascii?Q?5gMPSjoHIrf76RU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 17:29:50.7728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deaca4a3-4220-4b49-0117-08dd510b03f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5717

At the moment the GIC node we create for hwdom has a name
"interrupt-controller". Change it so that we use the same name as the
GIC node from host device tree. This is done for at least 2 purposes:
1) The convention in DT spec is that a node name with "reg" property
is formed "node-name@unit-address".
2) With DT overlay feature, many overlays refer to the GIC node using
the symbol under __symbols__ that we copy to hwdom 1:1. With the name
changed, the symbol is no longer valid and requires error prone manual
change by the user.

The unit-address part of the node name always refers to the first
address in the "reg" property which in case of GIC, always refers to
GICD and hwdom uses host memory layout.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7b47abade196..e760198d8609 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1615,6 +1615,7 @@ static int __init make_gic_node(const struct domain *d, void *fdt,
     int res = 0;
     const void *addrcells, *sizecells;
     u32 addrcells_len, sizecells_len;
+    const char *name;
 
     /*
      * Xen currently supports only a single GIC. Discard any secondary
@@ -1628,7 +1629,11 @@ static int __init make_gic_node(const struct domain *d, void *fdt,
 
     dt_dprintk("Create gic node\n");
 
-    res = fdt_begin_node(fdt, "interrupt-controller");
+    /* Use the same name as the GIC node in host device tree */
+    name = strrchr(gic->full_name, '/');
+    name = name ? name + 1 : gic->full_name;
+
+    res = fdt_begin_node(fdt, name);
     if ( res )
         return res;
 
-- 
2.25.1


