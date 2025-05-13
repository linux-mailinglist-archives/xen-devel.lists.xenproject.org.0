Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E90EAB5AF6
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:18:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983393.1369765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEtGl-0001XM-Te; Tue, 13 May 2025 17:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983393.1369765; Tue, 13 May 2025 17:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEtGl-0001UH-Qr; Tue, 13 May 2025 17:18:19 +0000
Received: by outflank-mailman (input) for mailman id 983393;
 Tue, 13 May 2025 17:18:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FKf8=X5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uEtGk-0001TD-Sa
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:18:19 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2415::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41b7bf71-301e-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 19:18:16 +0200 (CEST)
Received: from BL6PEPF00013E11.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:17) by DS7PR12MB8275.namprd12.prod.outlook.com
 (2603:10b6:8:ec::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 17:18:13 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2a01:111:f403:c803::9) by BL6PEPF00013E11.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 13 May 2025 17:18:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 17:18:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 12:18:12 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 12:18:11 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 13 May 2025 12:18:11 -0500
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
X-Inumbo-ID: 41b7bf71-301e-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZE4kvsiteU1uYoprTkkazu6LLlP8GuJYQBg+YhVz/i8ZqY9gt69AqY5W7iQfrbkgLv5Og9qF2RU5NTnDHvckXu2w5R1bXCNBFeUy5hoaIXCli0Xcco7JthQDX7oblWLwWsnhix5qBFoWBE3EXbitJeTtr6VNKZImtH9X1APsT3UMbB4H87jmcjWkn1ifOmutySHK02Y6oGflPttoN04cmeDbXb/RkvlMDsBvL0gjZ8x3TqpKWqCMZI3ADlTEf8nInaFMaOrUIfg+U2Mwubd2cvy3X2V98NhQ6crIspIIZXTkNLmCgEX932MtRMikGx0JipNAf0Tc5+1+dbpFpAfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtCYZnC/wIbWlCUdzmR/f7W11fazC+u7cNrdBzyIjWg=;
 b=FWE0x4E/LT8r6hPr6r30PJiquESS5G7bmI4cslgCXq3pS+YsAsON9Sh3Q76FJT0e9jX2zviUgwALq1iCpIt5rYTIqgwMEqeGtWO1Pldky4XnwKqeV2H3X7MHe/zxNhbCHPN9lwB7YTFYOiqv3VIEO+fr1GLkbV5Wa6YfZEmeap5AYrFoftea1F+cSKR/5qKqFLTooFVvkMPottNDIxKkxKCNoNUJXEiydEu4Pv5Ybjd4od9UYGHsQbKhVE5q+fhIn/4+CQ9Q2qXqhZtjSUmmMxOIt9hl6t025wN0iEgnv933jGxTHlyQyI/RmdtNOw6hvauT66B51QaFAtQWtof4Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtCYZnC/wIbWlCUdzmR/f7W11fazC+u7cNrdBzyIjWg=;
 b=xztvNNnyovRm741n64ks1KQXbOptk8CWDeKyMhNJt2RdT1taCvchYjgU1DUFip7amaGP0wtZXGkrvbMks+Ek0W5ywysJMQjGSSdVeL6B44AKNgspC5taKWl5zL0r8ftEAbL+aTk/tK2OZkDQnpHxpAmNucftKifxGYjnmcERlCE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 1/2] xen/dom0less: mark domain_p2m_set_allocation __init
Date: Tue, 13 May 2025 13:18:02 -0400
Message-ID: <20250513171810.668370-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|DS7PR12MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: c602e965-903d-49e1-40e0-08dd92422405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cAuuOLwl2LGHZzXmbH7Yp/MQ0PATvgWJ/pYaO8D8AfB4k2e/tRoGar2rFqO9?=
 =?us-ascii?Q?Nj5rvVg8tXSd2KG/75bQ/J6RXHGVBJBqsb3Q2ftRVWhlM1QpzQNkfK1uPFMJ?=
 =?us-ascii?Q?01rBIgTHA5/cKRaGeozx2mIFpXzhMXfirqj26yZugzS94iX3YJUCWfas4G1W?=
 =?us-ascii?Q?fZYhzDupUg/sfHcYLE6JHStRKv+ot0+Ez9wDhmiHfKyjtlouE/vDRKOmWmAK?=
 =?us-ascii?Q?t0tqafSptiz2gT8xNmK1xdhnC11m5kZSoh2WzDvq1jJa835zEVZHTGR6Zvca?=
 =?us-ascii?Q?4AthpYRsfMliY1R0FBaU2vaFogXZxz/hVQe8JKEcVA6hkUp22TgDFVVId7Uj?=
 =?us-ascii?Q?w5UWTYH4WT47RqaI2OxzFWAipTVE8lax/LpFGNfF+hgIKJmjubgs1WFNAMRB?=
 =?us-ascii?Q?YldWf3ASs0SidEvvrcii4byB5PJu6WI43yc8iNjULp6lKcUtM9bvdTOP5J5L?=
 =?us-ascii?Q?Sm4z1hFCYi0Q1pGVblOXXgQGbLN1NX+iVzNH23/W8b59jN59pk9wCAb4QD+5?=
 =?us-ascii?Q?zuP7E4SFQUSC5iVUq8TDV2xHZSlzo4KLHGhUTuG/j8dRl9f+OSamUPfjSOVA?=
 =?us-ascii?Q?KxRzrj4g4yWgOPzo8I4i49PeRr2UBafOg0Tc10HWFf295SYVK+u5m2r0dfyy?=
 =?us-ascii?Q?kJ9aWb5ajOKO2sDfn6It4rUXsIqSzozXEJ/EyqyuL6NLsE4bQQP98ibnaHhO?=
 =?us-ascii?Q?N2HAW1es6zPs4LS9ikWF5swEBKPr/IrtuvUw80mg134Atgcnpk5PuMhlXg1F?=
 =?us-ascii?Q?Kshn7/XFpYhuRrzFG2hnuNlTzxUgsYcEFm7NXDz6gjMxznvYF82sV8MbrfWA?=
 =?us-ascii?Q?LhLlHZLIfMsERCMI4li5I0TuuA6pqndBOQPA0OTKXOladYoF+CWiQZLvlNmw?=
 =?us-ascii?Q?uie3ZaiFiXQ36TSqHw5LOEQAYUjIozJFjy/Vk2HjRbi4gB0CROm+0D9ssFEf?=
 =?us-ascii?Q?QXFWcWdJqcU4qb7hSY9hbX06kj3vwuHh+aTmLc4pc+riNbWT2VMoQW3mSFWI?=
 =?us-ascii?Q?cArZnZBgEoNJ1Qpuf+LKi1CjnjllX8mWULF95aE42eF9T9/cYeV/YSV4Rh8G?=
 =?us-ascii?Q?WOKfOO6yjuiOSbNwe24ZGv3IHp8n9oMalyre0pKijRJzmhpbiMN/7elolsKP?=
 =?us-ascii?Q?Axuec0hL+dT07XqbEwaYxq1QMkbLhb+RgRzvTmKnSFn0kTUmaP2daIhZZ8nW?=
 =?us-ascii?Q?XEFE/DdfjwwMGA4uAcBBUVGi5VmPyFVu1J79Nz04y64UobP6ABd/yzK/qOYM?=
 =?us-ascii?Q?iF8GY845QjX6nHhi48VXW1ziLAsfpi1DeDmx/QPIZy6url6Xl8htMyY61vNx?=
 =?us-ascii?Q?R6OSI1HQKJwf7/P9lBAnNm04LpIOguOUKYWUIicqOe0GwEm++lF751a0Wok1?=
 =?us-ascii?Q?AqCNXyRZwKPItyDC7Uf9F47EvICS1FlW9hugWHptG4Ql1HXgFIrHVUFjL9z4?=
 =?us-ascii?Q?VKDO1vkyN1BznCvuD3xvwFc5imva83zEjSkwNV91scGAYyhP7eaBLGOxMVkj?=
 =?us-ascii?Q?ZhTM6Ruqb05Fco+3J33rk9Z43xupslg5hQAc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:18:12.5879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c602e965-903d-49e1-40e0-08dd92422405
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8275

All functions in dom0less-build.c should be __init.

Fixes: 2705f1adb9df ("xen: introduce Kconfig ARCH_PAGING_MEMPOOL")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/common/device-tree/dom0less-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 2c56f13771ab..39cb2cd5c70e 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -730,8 +730,8 @@ static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
     return rc;
 }
 #else /* !CONFIG_ARCH_PAGING_MEMPOOL */
-static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
-                                            const struct dt_device_node *node)
+static inline int __init domain_p2m_set_allocation(
+    struct domain *d, uint64_t mem, const struct dt_device_node *node)
 {
     return 0;
 }

base-commit: 5873740e41acb8593f92623ddd03caebda2718f6
-- 
2.49.0


