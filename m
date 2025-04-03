Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED66CA7B19C
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 23:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937345.1338401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SOK-0001tX-Gh; Thu, 03 Apr 2025 21:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937345.1338401; Thu, 03 Apr 2025 21:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SOK-0001qZ-Am; Thu, 03 Apr 2025 21:46:28 +0000
Received: by outflank-mailman (input) for mailman id 937345;
 Thu, 03 Apr 2025 21:46:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GOX3=WV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u0SOI-0000LE-0t
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 21:46:26 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20602.outbound.protection.outlook.com
 [2a01:111:f403:2009::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 162cdd88-10d5-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 23:46:24 +0200 (CEST)
Received: from DM5PR07CA0063.namprd07.prod.outlook.com (2603:10b6:4:ad::28) by
 IA0PPF8FC6E1236.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bda)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Thu, 3 Apr
 2025 21:46:20 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:4:ad:cafe::50) by DM5PR07CA0063.outlook.office365.com
 (2603:10b6:4:ad::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.25 via Frontend Transport; Thu,
 3 Apr 2025 21:46:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 21:46:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 16:46:17 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Apr 2025 16:46:16 -0500
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
X-Inumbo-ID: 162cdd88-10d5-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiTviR1Xx0CZQD0VY+KQWh47Q8sD7Xp/aXXO0fQnXcT74HfLIRA7cHij/H1thr9Rp2vEFZBVnxF+gnludMGAo6xtErHyfptvscvqclaVaVuX6O8Yo78rsFkkrwGE0geRG20yfguHEJBr4QLao8BttnGQJkJ/eBm8Bo8HAHHSpXTZYLpMp5epOsZk+tY+3IGEFESYubkM491eSkjTHh1j/e3gwYdbrEfKA/q8KpCWFO3uwMjizinhGNZLRJ0GsMx4Ua8vnD7tLGqbQGO2XxDQX4Ei23Ima1eF22bytmQhjqKSWD7R6bCdmeEZVNvcT8t8jEsH3BwwRaNCvcJ+WX/7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdsPqj84Hib8NMMJalt8pI/N2yD+bj+m4mgWcFIdJM4=;
 b=nurlZ8CqZbwbcb8d0GCUwSYtk0uEZNIfXkO2bEyOd+zRGe3VJKWlOBYFE1oZZxxdVyoJ2z6hg7JyuzBZrmTLKEU31wrRSVtFw30na5zZtrGgX508TCjCIDr3ZizQYhpOvKv5TrSpU+76Q3Vrcd4coG/hch+6U/g9/YnIDdwDlw76y4+ZEXH88/rOxRTRVziUbTivr3y9v9fW6DiNDZVViIJKDvJWP3jj3HWCGj2pgEdCBb3YK7MR6N3O1z2m8tyMNZumm6HSUQAyi9qGICr7l9VIapP9YyFURrNYLHmrXHiO8jt5Bz/tTiaoYJyksDbsoPvApNdvh9Np5oyYZ9Vnvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdsPqj84Hib8NMMJalt8pI/N2yD+bj+m4mgWcFIdJM4=;
 b=FY7SBnF0Dytfvluu/DD/PO+NOXr0lsMbt16g6nYevHtbuYW+DyoRyt3ERnwf8zCbLr+w93j0DfM1B3D9STz84rLZD8l4SlyPLyMr6SXhEa2kb5lyx1ET4onbUn6YjxaoVGrnGEN+zaSp8uQUEXgl/S+K3kajO35cbyZUq5os62M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 6/7] xen/arm: dom0less use has_dtb local variable
Date: Thu, 3 Apr 2025 17:46:07 -0400
Message-ID: <20250403214608.152954-7-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403214608.152954-1-jason.andryuk@amd.com>
References: <20250403214608.152954-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|IA0PPF8FC6E1236:EE_
X-MS-Office365-Filtering-Correlation-Id: 43a04bde-3635-4d8a-0e00-08dd72f8f821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ng294MpNCQwzdsijiCh1CsstudgxCEnpjk21l/C+ij0twjG8YPW51d7iBITJ?=
 =?us-ascii?Q?9oZSEe3OgGfVJoippoRDnrcbEAU2gDbpNZnTCmjPV6R554lEtUPQ5eqDkN3D?=
 =?us-ascii?Q?gNVlCsouacESu+7sOsAP1UNF+OqnVx/zvE8bWkR5OavqApcU76BTWPjyFr7S?=
 =?us-ascii?Q?CuK/HLBA3SMBoLdIuQmihgT+dwg3TDFUBJhfxXKSph8CQ2m5c6OeSYXemkBz?=
 =?us-ascii?Q?qXpgQ9MJhLIpEyujAYmYFVTcQISo9/89OFcFeySNQEIrKGqbKeqdirZqDMCM?=
 =?us-ascii?Q?2o+c1IK8zctdq6nQWkhEL1waznT8p38chocHyTiF1EUNBlciay26zSwWY4je?=
 =?us-ascii?Q?UkCPkvfQf8moNk09rmBgDzJBK9fLi6wZxbkHO6CDk8g1sT+ztD40Ujrb9Q49?=
 =?us-ascii?Q?NRQCd66HibzlTJzM9MKW2GzxGeL80ZbtpOXXAh62r/5ZhrGrmArYEZP+v21F?=
 =?us-ascii?Q?uDY8mhPvZpeHVXDAPHzu0ObwhEcLsuFXDjxAdYb/XR7AZ4uHveDFZ0YoL3Pi?=
 =?us-ascii?Q?1gGtFxM+TFvimNr4o8VrON+l2bPYhq+aQgPp427Kr2YSKQ770c3XfFsvacqB?=
 =?us-ascii?Q?s/nUNM5CkrejxAz2hMqbBzXWClJoz95e1+05IeEQ8b5ktaVn6vkx6HYfKFGh?=
 =?us-ascii?Q?t1x+WE/pNAXxxlx9kSPe8peFq24FMp208rYubTYkwcKJ7DUB72e20sznDwv2?=
 =?us-ascii?Q?P7d5kNRy+wDhFw8oyWlTlwnxpIsmtF2sJJj35wvX8lo106+V1hQaFkawp4h4?=
 =?us-ascii?Q?2IXknQj12AtN1WrpS6hE+zfyhXTET41L6Qyi3PAKkXkqOKiFVI4oQW4jkT04?=
 =?us-ascii?Q?orYXt1+A3iYcRQeaX9xEoLVN/XKiOptqVsWr7JuY10oR7McVQMEAnTwVEuvt?=
 =?us-ascii?Q?8fnXPkZhc1YSBFbl+Z6i1Kyhr/BN7qRh4b76Imk5xE0v8trSJjujNlwUUl7B?=
 =?us-ascii?Q?invfxNXMjCASGSgyXOP6JtNaDydsEK1AZILlze8HS6R0NGL08HuAmG+m/UnU?=
 =?us-ascii?Q?GFhyMrXmzfe8zkvQBTc4LkvoD9a7BS63KSz5f3RyiMvFDZTKD/iDn4lGFQed?=
 =?us-ascii?Q?HOjEBn3LSXNB5cDTYGxxB7o1Gh61GVOM0Zjz7bZzWI4dXq/TwfrrRJ9HKFbc?=
 =?us-ascii?Q?+fKwLy9JZqqbma6YvRarUzph2KVow/ESgk/mQQs0bdfajt9C5RF/+FVEmLXe?=
 =?us-ascii?Q?OP2pDjUDBel04V3++ZQvn08hnpvHxIQ/0RGBINf+xd187jWmdGQizaZIk6zi?=
 =?us-ascii?Q?O+qj/saeUporpYTdb8/hVyFTHxLReRDaD9fB+fPa+dIQbqK8AiXAGMYQ7x5I?=
 =?us-ascii?Q?SCJQCgKyLDEoOP8AC01J6rS2ZibvI2DlrK7tys2stn4D0DSam3wyHBXDnPYR?=
 =?us-ascii?Q?/bXvtomohqjjUdEgcwrRGpuMSsHLLj4mJ0jP0i/VuZvvTl7QRize78D//m7h?=
 =?us-ascii?Q?w+sZ+C2QsTstrm4rDa+KhW3V4EMoxqoDh4Yg/7vvslOva4lHbRT5Iifv2Kjq?=
 =?us-ascii?Q?FLaRKGb9aZtn1pA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:46:19.5443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a04bde-3635-4d8a-0e00-08dd72f8f821
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF8FC6E1236

Store the result of finding a "multiboot,device-tree" node.  This will
simplity adding hardware domain checks.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
New

Could be squashed into the next patch, but this helps make the next one
cleaner.
---
 xen/arch/arm/dom0less-build.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 284190d54f..a72961dfb4 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -1031,6 +1031,7 @@ void __init create_domUs(void)
             .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
         };
         unsigned int flags = 0U;
+        bool has_dtb = false;
         uint32_t val;
         int rc;
 
@@ -1065,9 +1066,10 @@ void __init create_domUs(void)
              !strcmp(dom0less_iommu, "enabled") )
             iommu = true;
 
-        if ( iommu_enabled &&
-             (iommu || dt_find_compatible_node(node, NULL,
-                                               "multiboot,device-tree")) )
+        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
+            has_dtb = true;
+
+        if ( iommu_enabled && (iommu || has_dtb) )
             d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
-- 
2.49.0


