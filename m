Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB5494BCFE
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 14:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773968.1184512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc1xw-0002CR-MP; Thu, 08 Aug 2024 12:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773968.1184512; Thu, 08 Aug 2024 12:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc1xw-00029e-GX; Thu, 08 Aug 2024 12:10:00 +0000
Received: by outflank-mailman (input) for mailman id 773968;
 Thu, 08 Aug 2024 12:09:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqo7=PH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sc1xv-0001oM-K1
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 12:09:59 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2412::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f2c40e6-557f-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 14:09:58 +0200 (CEST)
Received: from BL1PR13CA0274.namprd13.prod.outlook.com (2603:10b6:208:2bc::9)
 by DS0PR12MB9346.namprd12.prod.outlook.com (2603:10b6:8:1be::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14; Thu, 8 Aug
 2024 12:09:51 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:2bc:cafe::2c) by BL1PR13CA0274.outlook.office365.com
 (2603:10b6:208:2bc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14 via Frontend
 Transport; Thu, 8 Aug 2024 12:09:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Thu, 8 Aug 2024 12:09:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 07:09:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 07:09:43 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 8 Aug 2024 07:09:42 -0500
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
X-Inumbo-ID: 1f2c40e6-557f-11ef-bc04-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMlQP4+y2FrFx9H4bhyS2a6nkR262E4IcYDsLvcYEwjgRym92KV4cyS+nhW0+PPNRLA4nSeWU1ohHEOOPvQPmg7K6yBcm9aAvblosMZd64VDqkVLmA2s1tfvVYbM1QHKhMfnJYdccIrJBBhymPm2R40qJyXhG6DMmnEhICnswULWxyElQFbjq5e9uN9MhUEPiFeghhyQojJRZ15sw88Z3cvw4c1tDHSytCwg84u8TTrGJfvF/1d9a6yGKSud7XXBRBkU058UUPhY/s/xBlfs6fSCoDODHSzz9vlptvMVKK9KXqVyG1850TRaBrXp6DfkWV/U04b6ZgWXU3VcMnz0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifeqpzTG7mgd8CW0d8omyR5cvab2skN6+VC4y+ldVDE=;
 b=Yp6FTioob0DIU9V56uPrkKk9bpej9Yhvf2vHElIYWVUsiNo11bcQZlTazBIX85Pi3jEoLp30AFLEW9sgVori9TvYgw7QgIjnDq+1XtupeSswLIFrjNHKAS0xDOG3oeZzetxL6aKf75eqml8j4csO2vrE9OQFaRbyHieQ1KyuOQvq2enTqaJVs4v+u8MKSEwX37z8AzJnS/P4JjtDKx0IQdCaJ6rZV9gSbzEpmQsrxbEtcJgmIxRAwSklh3/hMzzbPlGoZtX8+/Do4M6lbEQGH12L2jf6E7PvG2zJjdenmoi4pZ9a2kw4iiwpQ993CMUdexV1zO0ocio7iCMn80nclg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifeqpzTG7mgd8CW0d8omyR5cvab2skN6+VC4y+ldVDE=;
 b=ZHpW0KBDGLfxOl1gkKYcfHyc0vPUphc7ulVK8iCq1iPjCtQ+OuiVmsp6pnDHjYRG+NPmyw5a99LxtCUCCvF4p1G8kB0w0ReWRf8PwE/qLEf83eJuflW5l3A6yP8YNCUqgXpRkRGiF76hIWQyC8m2rWijnJ5+cVKkmCellzccgcI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <ayan.kumar.halder@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 1/4] xen: arm: Add a new helper update_boot_mapping()
Date: Thu, 8 Aug 2024 13:09:33 +0100
Message-ID: <20240808120936.3299937-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
References: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|DS0PR12MB9346:EE_
X-MS-Office365-Filtering-Correlation-Id: ba38611a-041f-4eda-b6a3-08dcb7a30190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iMFINjeaRhphnzIhdQ8+XbUmpPzE8dHzYcTwRERtE1wuA/qlYjtX4e+poJSM?=
 =?us-ascii?Q?CCVwnmA7JXiVb5mIiiVOYJnMqGs59k9EXi+Sq/3hrNqmfX08TkTh2o01iWRQ?=
 =?us-ascii?Q?M2YqrURrPpe4EUWB0bFN5Xhkpbo911LQCogrXzx4c8/WVvdiwMWp33/wAkOg?=
 =?us-ascii?Q?Iiq+bNXFKHcmpJ/vHSc8Wgggm9FB7nOyL/0JEownpHRrDg5SsL2C0rNWEFCR?=
 =?us-ascii?Q?tcLaBaenCj5LW4Xy27WmS4tqewoklgynw6fvgar6j5RNdazwSzdoSIcyGVIv?=
 =?us-ascii?Q?kLsletkW8rwYInyoZ9HOniO9+ZZLuQ4Mg8z85DjFIMxhq3yq0+0IMPFCIPn1?=
 =?us-ascii?Q?E0GEYyArgOBO5guYQCSfUs6SlW5ZTFs815zQr2ey+48cp5Oa4WRH+NRiKgpr?=
 =?us-ascii?Q?pTIazFF8k/p98S20eFKW8vAzUG4j4CCWPEw0MuHk7GpWQcjmfM1Xw95kDLZs?=
 =?us-ascii?Q?HF0n4j14zIJD82g7VE65FAn03ORy2vhERYraTCDa8kmlTpK1PR1TohZ/yFbl?=
 =?us-ascii?Q?oTUMpPnx99NpLyGY7SoruE/aH/A3DMg1IBgqt98nJoyAM4qJCxRk7IU3n6S8?=
 =?us-ascii?Q?/ir2nnEMOx6koYrYhgFH0GNY6iHhh0E60WceaYX6uol4QmaHqWOdh2SS256N?=
 =?us-ascii?Q?PfLapAlQhsZQfvIjvjrpPv5tW2jOfxVbhTp1+Ih2AlKnahlp+pJRerrK5yeJ?=
 =?us-ascii?Q?fDf1FPFJ3O3EDPTbOphhbE6XKZPAECnXHxglZYkRDkBYgycyUYSyUXQIO2cC?=
 =?us-ascii?Q?9/K0KL7xYU088TZRseIsQyry9VNrq7o4HnQtOk2MRLQ8NGO+w04H47Wam8AP?=
 =?us-ascii?Q?o49UQF24E9zUkPaSi2nQLbz4s2BRXZf8LzWSXMP68hQa7ivQq8DfMid4VbhY?=
 =?us-ascii?Q?/1QpPaKN9+z2mTXVa7LK1iO+FUd/J+LtK55h3DXZwO9KAn8kZGQK8cnBjyYs?=
 =?us-ascii?Q?QWeqxi72GpyV9fZ7jYieo4Tot38/1sHCLmeXxBeX3gI9nfwDm5loPVO0fDHX?=
 =?us-ascii?Q?u0n1+CfrTaTIVMPBa8c8e0k1Bd2taHxvL6H10CvHsUfb6jiPHWVbnyRlngFs?=
 =?us-ascii?Q?8oYsV4oO6YIlaQE7muyZ/OibDV9QIGPXa+wjBffnwLqMOWQdNUVrtgEHzBIQ?=
 =?us-ascii?Q?/06KS1u/acFzr1eh5Tqwj7nsRMOLqgrHthtcjM3r1/ufkpcN3nMOFGn/CsSD?=
 =?us-ascii?Q?V7tVjtyrNtYaNXhSp36s2Ydt8tOHQY0CEXxatPEVkjDP9DCxsd8szcwd4kM7?=
 =?us-ascii?Q?vyq3r8rcBlPdljcBIXJgYRhsHpKxnQY/yQIHPMitkQaw9AP1aKqQ3/tMIbTF?=
 =?us-ascii?Q?4sakFYtmZoniEPOZQPkG8gvmmey1MtC2tv6c7gaQfmmi3B+OY8Imwn1tno41?=
 =?us-ascii?Q?WgrpGV5xJ/qTgfvKOSrRmRZft4MkBCj/7oyYfluDh+je5OWZdPIbQ2EW9JN6?=
 =?us-ascii?Q?CozlBzp3IG+Cr/gd8zIRUgcjNS3Q/J6B?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 12:09:51.2956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba38611a-041f-4eda-b6a3-08dcb7a30190
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9346

update_boot_mapping() invokes update_identity_mapping() for the MMU specific
code.
Later when the MPU code is added, update_boot_mapping() would invoke the
equivalent.

The common code now invokes update_boot_mapping() instead of
update_identity_mapping(). So, that there is clear abstraction between the
common and MMU/MPU specific logic.

This is in continuation to commit
f661a20aa880: "Extract MMU-specific MM code".

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. Introduced update_boot_mapping() which invokes
update_identity_mapping() in MMU specific code.

 xen/arch/arm/arm64/mmu/mm.c   | 5 +++++
 xen/arch/arm/arm64/smpboot.c  | 6 +++---
 xen/arch/arm/include/asm/mm.h | 2 ++
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index 293acb67e0..72e089a339 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -125,6 +125,11 @@ void update_identity_mapping(bool enable)
     BUG_ON(rc);
 }
 
+void update_boot_mapping(bool enable)
+{
+    update_identity_mapping(enable);
+}
+
 extern void switch_ttbr_id(uint64_t ttbr);
 
 typedef void (switch_ttbr_fn)(uint64_t ttbr);
diff --git a/xen/arch/arm/arm64/smpboot.c b/xen/arch/arm/arm64/smpboot.c
index a225fae64d..789f352ab6 100644
--- a/xen/arch/arm/arm64/smpboot.c
+++ b/xen/arch/arm/arm64/smpboot.c
@@ -112,18 +112,18 @@ int arch_cpu_up(int cpu)
     if ( !smp_enable_ops[cpu].prepare_cpu )
         return -ENODEV;
 
-    update_identity_mapping(true);
+    update_boot_mapping(true);
 
     rc = smp_enable_ops[cpu].prepare_cpu(cpu);
     if ( rc )
-        update_identity_mapping(false);
+        update_boot_mapping(false);
 
     return rc;
 }
 
 void arch_cpu_up_finish(void)
 {
-    update_identity_mapping(false);
+    update_boot_mapping(false);
 }
 
 /*
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index f6ba611f01..e769d2d3b3 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -426,6 +426,8 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
     } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
 }
 
+void update_boot_mapping(bool enable);
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
-- 
2.25.1


