Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 314B6B1DC9E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 19:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073413.1436257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk4ge-0007yd-Au; Thu, 07 Aug 2025 17:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073413.1436257; Thu, 07 Aug 2025 17:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk4ge-0007vP-6r; Thu, 07 Aug 2025 17:45:56 +0000
Received: by outflank-mailman (input) for mailman id 1073413;
 Thu, 07 Aug 2025 17:45:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V1Uc=2T=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uk4gd-0007fc-88
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 17:45:55 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2412::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c49c568-73b6-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 19:45:53 +0200 (CEST)
Received: from BL1PR13CA0404.namprd13.prod.outlook.com (2603:10b6:208:2c2::19)
 by PH7PR12MB9201.namprd12.prod.outlook.com (2603:10b6:510:2e8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Thu, 7 Aug
 2025 17:45:49 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::3) by BL1PR13CA0404.outlook.office365.com
 (2603:10b6:208:2c2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.7 via Frontend Transport; Thu, 7
 Aug 2025 17:45:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Thu, 7 Aug 2025 17:45:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 12:45:48 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 7 Aug 2025 12:45:47 -0500
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
X-Inumbo-ID: 5c49c568-73b6-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AO6sQEy15Fkp8pfP4sRM3ncTDlk4XCt0MBpx1EN3x21tipoag1m2q2kE2z2VRhsUCPJazRY7jY76/UDORSDp2Oqxsqt/hRIyD7LTQ05+iXIa6aDx3tvr5PVEu2cNKX4PMngFa8aL4w7mmHhw2p1txkpljoQJqGtpe1FKOCk0UhKgAXXlXieDvlT5eTAnjTxXfcY3+AjXYGJg69sDVOeWdlFIOB4CxWcrPOfdomSksP/tfxQ/MFJotE4AmKPe5GeiLoCDuVCxEdbrmViiFVjGQ2jzQ0nsLuWsiVu6FTOXLZA9Pg09/f3W1nOvtljeKeP0CItE7LhZBBtMWty3mQX7kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMjZy1iH3csi0rSCh35yuz6rLVOJdV8SmtS3FK8InZo=;
 b=ywtbl8sZuKbPT0A0PrFw6VJm3rM+VSSeAXdNNGKHu1iZWnsN8cOE9HKqGCFuQ4Xuzy3CQVZ/MS9Zc9R4JOJHK1pxqLUb/s1ff3/HIH6v2kCOCCNHdW2LO5EE18EmwDm6Paw2GF+WFdBpUKB75WcIO2+yysHl6xGwNWaWHPGdPDsaLK7t6VC+geT01O8DkKmd9X8dYWCEe/dTjrSiVHak8ss3sXYnDz76NG2tC13vwyN12HzJk3QhuW5LRB4ObkAPJTLCR0AvmCdxke5mmh8XZSN4Nu6VlHBlOOJ5YORT93oZjLgcdGSBbuL4eJyVViBZMkk88zdz6bTdGQNhm/NVjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMjZy1iH3csi0rSCh35yuz6rLVOJdV8SmtS3FK8InZo=;
 b=Y9Zg3HbKI85I41nsodcaZhcnBXRfFpSOoArQNRur5yVBLsB5V40mPVHE8/WqcxNhB8uT44smtRRbJm9qQBulgCnUnOw30hZJUoc5KyQEBnXUPb95s9ya5OSK9hvy5ug+T1ZioklDmRfgJSeaV2T9hUAhrmUKbNYHlMDyERZyaG0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 1/2] arm/mpu: Enable is_xen_heap_page and co for ARM_32
Date: Thu, 7 Aug 2025 18:45:28 +0100
Message-ID: <20250807174529.595577-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250807174529.595577-1-ayan.kumar.halder@amd.com>
References: <20250807174529.595577-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|PH7PR12MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae6579a-18f1-448b-6553-08ddd5da3eb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2TlelXw/KcqJ3mhkmey5v+vQ3FxTvif2dgpLswM2lUseYzoJieDdzNLfD68l?=
 =?us-ascii?Q?ZeRFzCnKNpkzww3kQ+GQVX2mnE+qCzbhdbGbMZ8Db4PJsCMMvALY1Z+6XnzY?=
 =?us-ascii?Q?2D9d6Yo2C1FiTQYjBi7Hp4cp249cL7oXJAXhGJZEjrnKPENxjZT2qHwN3PZQ?=
 =?us-ascii?Q?X+solLVFL0fBo8WhRlaSxK1bGwDlHnDKf3V3mjmQvK6vhmvpWXi066/aVAKq?=
 =?us-ascii?Q?BFE0YWo1rEWVsH2BPPyCN0aNTDbXzBW0/8YUoItQhU5w3+cCXZAYT/BI4ZCl?=
 =?us-ascii?Q?PVAdIsvLhGCPD3Sogzdtx+3nj6r/ncSuFCHMMZd6fS9Jra70t0mluO9QiIZb?=
 =?us-ascii?Q?Fdm+yuOSQ0DjEVajpf0xfYI/FXm3lF9srzSR5VzTnTSTJiszPro/+bgC8Sth?=
 =?us-ascii?Q?XJaWMHTGF0H3NwoJhSdBiKmoG4szxPb4GnYGux7sPBWs8sEdoVtnaG/snH7s?=
 =?us-ascii?Q?bWkm2Ls7VAfSlTkCGLvo/K4Nkh2o1rQMQWKmUlU2De/krVsq8kfpavDFDmk+?=
 =?us-ascii?Q?X2paeItLKlb6S5mkz3ZsfdiJuaNH7HOWiAEvx1XawVUFlKj3HVgbxju0aq3N?=
 =?us-ascii?Q?B/Fb61oCxXNUqqHC7qQklnwxm3VZgw1JeYqBb6HxFYFznR5kROTXFvyFVgTM?=
 =?us-ascii?Q?B/tbHwKx5z7LjGuUUqby82zQ2TyE18TvKLS/Yw+x21eGgrMQWvjZ46ucA8R8?=
 =?us-ascii?Q?I84mpd6h5pP8JX4wnMBl8vn//RTGjzL4AggEIFSk++l1wc5tF8sX+y6Anp5L?=
 =?us-ascii?Q?unCPayfoplHt73PolO1ukbAR8smLhY49fjgPBzH468no7lhtpqmI/Ces8hHH?=
 =?us-ascii?Q?odpgy3Nwy5dsYQZJm9TzxLZY7ZG9KDH3+iud1sTyTsTAhuzk0gy8lWR9VU3O?=
 =?us-ascii?Q?ImQpNx3j/GRSfAjlo40uwANyXyFxAwBiowAbP6bzhUBDqSXxBRfqiZYVSRXL?=
 =?us-ascii?Q?vNECKQHOrkZeX1Qig/A/eIuPzbQoZ9E5o2KnjP2nYTKjVSHpIghfyE/gzkPi?=
 =?us-ascii?Q?NphKPjfTdsrD/q51IMa7OS8pc65AMQPn3kxFidSEWkC51GCpOeN9/svSOk1s?=
 =?us-ascii?Q?+U6xut3eGlxp4Wsx4HKkzU1xKzhOQqbs2+aviulUsd+dUXwvA/eIiAzIBBOu?=
 =?us-ascii?Q?xWPWftY6txLjDxkLZT8nNfafEw3XKWZVcUd1rXRG66fECHYkVos+XfI3w2YC?=
 =?us-ascii?Q?NqtpFcAHO/3beuMPwXsVoYq3O5w0lW/aMnaSalyabrSWpzdzrtE6b7ijmly8?=
 =?us-ascii?Q?wr+Z8z2Y4HT9046HO/+9SLDbpWRxyTbn9q3bqKr/vxZbtRsbYcI8eHjTHAdC?=
 =?us-ascii?Q?P/rWzlbyeePiZ7oBN2m86DOiSQt2dXh7ZWTOZvWw7Ns6UoHyhQtIjrYYwh69?=
 =?us-ascii?Q?uEte/kpYiqG4QP/SEQr27uSJe+isah0AOnS7sQatmLp9HBkSm8QOVqn5qbwR?=
 =?us-ascii?Q?irPlUaedoTJZmE2X5PE2fSW+O4doUP3rbsuL4HgrvQx4RRRq5Faa72oZJ6QK?=
 =?us-ascii?Q?ZUs7PBHfvnYY+1L1aa9lH5cyPNT9nv0Kumay?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 17:45:48.7902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae6579a-18f1-448b-6553-08ddd5da3eb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9201

In case of ARM_32, all of the RAM will be covered by a permanent contiguous
mapping (where VA == PA) and there will be a single heap. Thus, the memory
allocated from Xen heap uses PGC_xen_heap.
This is similar to the scenario described for
"CONFIG_SEPARATE_XENHEAP=n W/ DIRECT MAP OF ALL RAM" in common/page_alloc.c.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/include/asm/mm.h     | 2 --
 xen/arch/arm/include/asm/mpu/mm.h | 5 -----
 2 files changed, 7 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index fb79aeb088..4eaa81d5e8 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -170,11 +170,9 @@ struct page_info
 #define _PGC_need_scrub   _PGC_allocated
 #define PGC_need_scrub    PGC_allocated
 
-#ifdef CONFIG_ARM_64
 #define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
 #define is_xen_heap_mfn(mfn) \
     (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
-#endif
 
 #define is_xen_fixed_mfn(mfn)                                   \
     ((mfn_to_maddr(mfn) >= virt_to_maddr(&_start)) &&           \
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index c32fac8905..e1ded6521d 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -27,11 +27,6 @@ extern pr_t xen_mpumap[MAX_MPU_REGION_NR];
 
 #define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
 
-#ifdef CONFIG_ARM_32
-#define is_xen_heap_page(page) ({ BUG_ON("unimplemented"); false; })
-#define is_xen_heap_mfn(mfn) ({ BUG_ON("unimplemented"); false; })
-#endif
-
 /* On MPU systems there is no translation, ma == va. */
 static inline void *maddr_to_virt(paddr_t ma)
 {
-- 
2.25.1


