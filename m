Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7D2B1DC9D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 19:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073414.1436266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk4gf-0008Bv-Je; Thu, 07 Aug 2025 17:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073414.1436266; Thu, 07 Aug 2025 17:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk4gf-00089x-F8; Thu, 07 Aug 2025 17:45:57 +0000
Received: by outflank-mailman (input) for mailman id 1073414;
 Thu, 07 Aug 2025 17:45:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V1Uc=2T=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uk4ge-0007fc-Da
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 17:45:56 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20613.outbound.protection.outlook.com
 [2a01:111:f403:2414::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5db940cc-73b6-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 19:45:55 +0200 (CEST)
Received: from BYAPR05CA0054.namprd05.prod.outlook.com (2603:10b6:a03:74::31)
 by DM6PR12MB4220.namprd12.prod.outlook.com (2603:10b6:5:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Thu, 7 Aug
 2025 17:45:52 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::57) by BYAPR05CA0054.outlook.office365.com
 (2603:10b6:a03:74::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.8 via Frontend Transport; Thu, 7
 Aug 2025 17:45:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Thu, 7 Aug 2025 17:45:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 12:45:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 12:45:51 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 7 Aug 2025 12:45:50 -0500
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
X-Inumbo-ID: 5db940cc-73b6-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDZCwSz6KW7Z5SEsVCrCKnE62VpN8L+16GKdE3nq70rvb5i25p/V9mPzSFB63uPEHoM1EE/IdFOFbHGGlOYU7Vl+QL9njdMYlzUVi5QEkxm1/JaboJ1JU6g65JicAvUalTgtTgo57TxbsySwYUqN6pBdXY3kUHctxuVnz1AQWMGw3EaV+8YA2lWPX5l2FQz/iHLAlWZjpUJK0qSB3EB86GBqFtPDEhKfWvNmciHjVmg97TmG/ePwUf0Mq6Bp5qfjyfza/LSKFtnY4rBPcuV771vhMCqkFpvN03SIwDAvv2WyIGcPLh+qF5YmrJNU9U2loDpgLwynaHzZhK/6GsmV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0M6b1UL7biVsHoVHL5Bl9AXfjXLOIBxns/y2a41TD6U=;
 b=d0LRGnjg9Y9k0AlDt/xCMzMCkzZ7Fhbn9EcFqSbX4XynC2CqssucMy8W5zV/HrQ22tLZEPbgj84e6FWIEesv8MFMOHMR4/BT4JYS42nb8/KLkEoLnXlagwf4OHbEwnVFvKY5zVKrWEBv7uo/D4tmxS0akP5fdTcK5UR3AjZgEaAxwjM5nIRFR17ROShEPXQahXdrccaSOV9Clr7vJOfmu8rbKWqEJ0wD78777GqireopjmGLkvHQLGMNEsiPsWsN27qeuG40RAg0pKZkuuuWahglp+/24HhH2GaodDZN14TppdHfGM/0ofq3bqbGSv3hU+yeHdU2eShUgdY55AlPuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0M6b1UL7biVsHoVHL5Bl9AXfjXLOIBxns/y2a41TD6U=;
 b=CVPYaBHG6z1OiQEl2S65YpeT7nB6ryx42TgOtf4V2gLSyb4NzQ/Zz5wG/RfsgdsS/SKikqFKZg/fX5EY4wwBnj3U6e4oerPTrwrWQZjOeOHYmiG/pmFg1G4KpAfhwPB5OHMdnFxdWwWBf540Wk7XcH2iN7QgBxpO54S1SuiHDbM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 2/2] arm/mpu: Disable map_domain_page for MPU
Date: Thu, 7 Aug 2025 18:45:29 +0100
Message-ID: <20250807174529.595577-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250807174529.595577-1-ayan.kumar.halder@amd.com>
References: <20250807174529.595577-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|DM6PR12MB4220:EE_
X-MS-Office365-Filtering-Correlation-Id: e78130d8-df1c-4b30-1fa0-08ddd5da4068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fqueSnf+QMKEwm/BzD70RAURYsZTYiXHj+8rfEFNkeql5UgtA1Nw+kSaBoMq?=
 =?us-ascii?Q?WazU0go6uPeqmrORKOMzyfbS6uad910jxl750xKrRH+bynRHrUvMp/YSLJqz?=
 =?us-ascii?Q?1SewUNA0SmAL0sWWaXPihVM3lHVgtmq+CI4WVYRsbtvpNA+h8uVVd2M1Asi4?=
 =?us-ascii?Q?bbpaufO4ZCPuQvXovVrmVbCQ4Xxe9ScEF1OBWE7S4H/Airlsp3Bhbk5NNlzK?=
 =?us-ascii?Q?2lQVIv4zY1/mPjQmR46WKM0v/7bmOh1a/8BZS/1zic9oXMkcWxlAx1cmlAe4?=
 =?us-ascii?Q?mXN0udvXO8uTZ3ZtyX5VTv5tIaHyA6X9QS47ZHrsawRk9quIi/bUoxOPj2W+?=
 =?us-ascii?Q?wyYDBX8D69157uXqMXrc8WGv+OjW/K7FlHdXqkSqW57qRfNXUjh05GRbL5sy?=
 =?us-ascii?Q?Vc09s2s5n6zi6IVBSFlb2p1T49tej8SDIxT4MmfWtZ9S5Dtgg7NCg/bM5+UE?=
 =?us-ascii?Q?hvstaaOvUl+hMEK5KNJXvA3ARnnoc2vhNzBpHpwV0hhYyn9Nm44EWfa8yj3W?=
 =?us-ascii?Q?wNC91FvzjUk4GJkREMboj+v9dIN0W572uZE9ucvqpd8rrIGB/GnF0WiZvHht?=
 =?us-ascii?Q?1DbIYBDoujHWqS1zcsaguMnGgxueRDswMw5maW1udjRf2EobQpXW395Bl4TL?=
 =?us-ascii?Q?LRiuacDlFPKsI/djd8sA2Nc+5bB9DxyBGTg/6ZF8KYMTtRxOHp0Qh2346DhA?=
 =?us-ascii?Q?LzoNnNcZsB8/UTCf1q25Z4LwGrGJj2hx9UyUxX/magBXFM8tczT9iip7cLxJ?=
 =?us-ascii?Q?Yf7lnW8m03pN24C3vAZGOaqBccJ2c3tlbA5pf7FFeUu2L4DIwmBiEpGlGxh8?=
 =?us-ascii?Q?ASW8wVSnsxHWjCxfeI8tEClBS99TAAlXp7wRjeBL2GMLK74WBmwO6vWnpxe+?=
 =?us-ascii?Q?t8Yxz1dnjRjOubp6CMp9JYH7bBTksM2JiXzxtRKBReW7Y7aaWq5XzWRq75lo?=
 =?us-ascii?Q?AYFa7SJkEeiBQrdwKjWzbmhVsNRIQbv/SFo1QZraC3NdabIqw/AUe4b16NAF?=
 =?us-ascii?Q?MtepORAmVJk2JKGqsyvvUXfzFdgEeI+WgTUBbZiI9MuvpX2PRtp6rBKZdZYH?=
 =?us-ascii?Q?ULcNsy/dsH2rcmR09I8fjtNoIdJ/aSFiepmqbGKYFd+92ajh1jK5HUX9/lp+?=
 =?us-ascii?Q?6OhuagVzzJpjnHohKLpG4rO5m8vorchnTw0ngyHmn6PYRYfUGx4MLjMutrbE?=
 =?us-ascii?Q?kL+IcrpZaw+Iu/dLTM6V+a+tOjP7vBSyGRlZNA4x4zt+c7Wo+i7rZCQ4dPmy?=
 =?us-ascii?Q?g/st6UDWSQ4ROb6pTb1O3KCu6tE8rZHafJJAg95GnF4+QZHI1ODaSlcMuSOd?=
 =?us-ascii?Q?cg1rqXopAQ2lnKiyysTy044DriwbssOzN/1NE/0SgJuL5kppQLjaXnhz9eBj?=
 =?us-ascii?Q?mc9lEhpXfVPKLtZYyKFl5bCAeUmQHbgKkxASztvRom02wRaYkplXsWP9YKnF?=
 =?us-ascii?Q?/6Hsb4virTIZvNArP0/xzczdKx4hCpuyTLubEgUZ0CX5VboPbHZEXq3laO98?=
 =?us-ascii?Q?nLJ2Guug6JxpcHuH4bf0sr5DfGosism1aSPW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 17:45:51.5253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e78130d8-df1c-4b30-1fa0-08ddd5da4068
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220

There is no domheap for ARM_32. All of the RAM is mapped and VA == PA.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/Kconfig           |  2 +-
 xen/arch/arm/mpu/domain-page.c | 45 ----------------------------------
 2 files changed, 1 insertion(+), 46 deletions(-)
 delete mode 100644 xen/arch/arm/mpu/domain-page.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a0c8160474..5355534f3d 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -1,7 +1,7 @@
 config ARM_32
 	def_bool y
 	depends on "$(ARCH)" = "arm32"
-	select ARCH_MAP_DOMAIN_PAGE
+	select ARCH_MAP_DOMAIN_PAGE if MMU
 
 config ARM_64
 	def_bool y
diff --git a/xen/arch/arm/mpu/domain-page.c b/xen/arch/arm/mpu/domain-page.c
deleted file mode 100644
index df5e06b6db..0000000000
--- a/xen/arch/arm/mpu/domain-page.c
+++ /dev/null
@@ -1,45 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#include <xen/bug.h>
-#include <xen/domain_page.h>
-#include <xen/mm-frame.h>
-#include <xen/types.h>
-
-void *map_domain_page_global(mfn_t mfn)
-{
-    BUG_ON("unimplemented");
-    return NULL;
-}
-
-/* Map a page of domheap memory */
-void *map_domain_page(mfn_t mfn)
-{
-    BUG_ON("unimplemented");
-    return NULL;
-}
-
-/* Release a mapping taken with map_domain_page() */
-void unmap_domain_page(const void *ptr)
-{
-    BUG_ON("unimplemented");
-}
-
-mfn_t domain_page_map_to_mfn(const void *ptr)
-{
-    BUG_ON("unimplemented");
-    return INVALID_MFN;
-}
-
-void unmap_domain_page_global(const void *va)
-{
-    BUG_ON("unimplemented");
-}
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
-- 
2.25.1


