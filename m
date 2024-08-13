Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA0B950B47
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 19:14:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776485.1186650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdv69-0007ct-R0; Tue, 13 Aug 2024 17:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776485.1186650; Tue, 13 Aug 2024 17:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdv69-0007ad-Nw; Tue, 13 Aug 2024 17:14:17 +0000
Received: by outflank-mailman (input) for mailman id 776485;
 Tue, 13 Aug 2024 17:14:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rcsl=PM=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sdv67-0007Zn-QD
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 17:14:15 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2418::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75cc493a-5997-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 19:14:13 +0200 (CEST)
Received: from BN0PR04CA0074.namprd04.prod.outlook.com (2603:10b6:408:ea::19)
 by SA1PR12MB8988.namprd12.prod.outlook.com (2603:10b6:806:38e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 17:14:08 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:408:ea:cafe::3e) by BN0PR04CA0074.outlook.office365.com
 (2603:10b6:408:ea::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Tue, 13 Aug 2024 17:14:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Tue, 13 Aug 2024 17:14:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Aug
 2024 12:14:05 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 13 Aug 2024 12:14:04 -0500
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
X-Inumbo-ID: 75cc493a-5997-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnB88TVG1wAJSbR3kgkN+4E6krQLOT5mgZ+ZNXukmgfyFe1ncuFA0JpvQg8ANUsckJO8o2i+Lh72MVDe9YXT1AnZ9lRQ7tpONzdrqtwFMYeMf0EYjVZafdsyUUSGDRFXONdfUiROMQ76UqcrBmbH7Deb3ve1l7xJlRwXH4hhEfYrI9W2vHGE9lDGvDE1eA+2OPnn9fitT2s4E578kvrWpyj9UkKIcpIHCizGZ040z85bHZ8kXHHdKqlfGC867qxGihuMili1iouyHdqSTDWWf4cTDtztfyH/xvd7GvkiefTlWlF++yaNuGgRwRF4/l7YlrjOCpPOf5/V3dTIrOh36A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GExeTyZpqmeGMzyUHWrGW/i414l2COxtQTsLu5JBV2E=;
 b=ocntKJiLjyUr+JnSd5hqJgkbrrsDTJ7qNIOAGmx3RErVrhu2CVAb0VM96+zIzducStVuYi94S4Rgk/zSZoG7MBa4xVAU3s7M/v8JyrlD6GaRrkgzEnNCcQc2CgwkjTO7XdheQdUQ923kWCfFaSQVqo7dbL/5ZlvjGYpumoZXodiDy/LU+cpFyVJ0enBHbQ9GZx0ER78IsZnfEnNRVWObZVoT69FN3i4nAJ5Dyxa4BiyJuhHq1CK9jvphOwbh1oVU0e+BCAuXs01bkx7zmF0RK5uA8oLvrIN8no5tqfU3Hvxa+38qH+AhzbESNJwyMttJ4hfNEW+5Zi1OdnxENF4oGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GExeTyZpqmeGMzyUHWrGW/i414l2COxtQTsLu5JBV2E=;
 b=Fz+zX/gh6RJHOdXYA7B1u4WTJYP8CTiGTvBVZ4yhtAJDf0KyHp2G6/bBRCx47rOWEYC+9B3gVFOoQszra4ty3IsDfFPENosaDFG5IDD+am362b2Qo8QqvcmbW6fgY5+VK6RvQPwmy3Atq73XZymE68WKXrZ+WpuRNxdxVYlLrhs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <ayan.kumar.halder@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <julien@xen.org>, <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH v3 1/4] xen: arm: Add a new helper update_boot_mapping()
Date: Tue, 13 Aug 2024 18:13:53 +0100
Message-ID: <20240813171356.46760-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|SA1PR12MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: b4587ca2-d72a-4139-0076-08dcbbbb5733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fbNwL5IKGHiu8quXXxlV3ux/ZxBEMDn9R6OMNo+eJpj2X3ynvn/zHENB/Yc0?=
 =?us-ascii?Q?ltL8eYuAlgT3x5oVA/suqgCVGKQmBL+ml5qOrOmQOn8wd6FmU/kVuqPofb0+?=
 =?us-ascii?Q?ikjZSPzvpI8HFlf5iNAGonbOgWwYLSPsdqh2l82B4Fp4NvfSG6NXEl7NreST?=
 =?us-ascii?Q?o+ItZEvGBQquKPEBEmhZRLpTdO0OYYaVZZVch77ncfhpkc0xZYktwGLSAsyH?=
 =?us-ascii?Q?FORgjyHVTCDWccWM6py4Bv0296R6S8jWoBjz9JUoCgD17I3r//EWJCGVkXbU?=
 =?us-ascii?Q?e98ZeKVGCLnEzLRwL14g3nFtfhhzQoErnDvqZFHQNosJ2GMIPlUBdR+r7G35?=
 =?us-ascii?Q?/K+GiMH2T4QxIpGs2Vbu3/9fAvB1xjiy9oXQhynwfYP4WkhEiMg6qvuOgQRJ?=
 =?us-ascii?Q?z4swakWNBbEKUdGxHM/Tp5ujsa9HKaWgXiiX/7jbpgL8TQ6Zf8eCtc3uGjHl?=
 =?us-ascii?Q?nH0Sf6EXtDhMXRGHlULgoYJ8Nbn9gM5aB/F30kzvRHUB9V6aUtzrT8+bG7Tq?=
 =?us-ascii?Q?oeuRqJfsCuSAH5jV7YRZZCdO6Nnvk5m1pjTkPeSxPvFBN6EMjZbD3weJoJyy?=
 =?us-ascii?Q?oq5rCM97ryv0gLzTX6R5PxCrffruu6ELGINapAIf+Vc6Zv1/ak2NSrrh+QPI?=
 =?us-ascii?Q?wsJlVNc1jr8DdC6AgSkoqGEtUziqNUCLijkU3l0sjOJ/usNhLrZSABdt7hSZ?=
 =?us-ascii?Q?xYRNy+HPZE1jC9sPZ9wLR5ikEDJkpR1qKvC96Gk6PEFLODHvWSnOt0l6I0K3?=
 =?us-ascii?Q?76x+Ww/pvLvuXqXmFZK9bDc5Pixuz8XzjLguJfJqRcO9R0GjsyjJPzqxyfVh?=
 =?us-ascii?Q?F6VMPfi7Pwluhqkiu4pSEgKxmM3fmUUSO6kTmAvNBdPafbinjItAtm+DrAcA?=
 =?us-ascii?Q?E0ENP9/G6XiZvRF84JvQQQX2N3uKd7SSwa4hI/VPMcJ1Dl2eArof3S8Gcigl?=
 =?us-ascii?Q?DfEgJdsSbIv/PvgIy0s7U03dW5DMAG0mDHzoyi80bdnxNB1m3tLNBLylquZi?=
 =?us-ascii?Q?JUPpHGnL+s+l8hW/WJfqO1vf+jljUAGzjWxNQeMfTVmdd930JBSIWNh1NNDz?=
 =?us-ascii?Q?OfVXE7EAlHYdNZKigeLOluw9H6kYSljVAjZmuScwhAIcEC6fCyxoR2fVSIzx?=
 =?us-ascii?Q?8ZVVUy84/0LPTJyRoUxfmEmXfiqkhqI0BWoGOLepyBldlaJxYig87H8ShZb8?=
 =?us-ascii?Q?ATy2fEyqmAp8Ea9o0pFjyAnlr4nUvEz4Zr2JAElOoasyFoQxPrNjSrSGyQgD?=
 =?us-ascii?Q?CFKlk9Pj+fbaNDs9Q40T+bj6VBwgahHPF/a/sZ+HT8tBw9BRfALb/HZqtt6c?=
 =?us-ascii?Q?i8TcKGS+i9hAKtXIKG9LKiICo0v3adh2hwdhgvQcIjWdW650SuEMluGagU6U?=
 =?us-ascii?Q?RVq6vwWyHCjTK45/+QgcnyqhKad6sLa9bxYgipr83p0UWjjdmg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 17:14:07.5381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4587ca2-d72a-4139-0076-08dcbbbb5733
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8988

update_boot_mapping() invokes update_identity_mapping() for the MMU specific
code.
Later when the MPU code is added, update_boot_mapping() would invoke the
equivalent.

The common code now invokes update_boot_mapping() instead of
update_identity_mapping(). So, that there is clear abstraction between the
common and MMU/MPU specific logic.

This is in continuation to commit
f661a20aa880: "Extract MMU-specific MM code".

update_identity_mapping() is now marked as static as it is called within
xen/arch/arm/arm64/mmu/mm.c only. Also, updated the prototype to
update_boot_mapping() which is now invoked from other files.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. Introduced update_boot_mapping() which invokes
update_identity_mapping() in MMU specific code.

v2 - 1. Make update_identity_mapping() static and update the prototype.

 xen/arch/arm/arm64/mmu/mm.c         | 7 ++++++-
 xen/arch/arm/arm64/smpboot.c        | 6 +++---
 xen/arch/arm/include/asm/arm64/mm.h | 2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index 293acb67e0..1afbbeda5a 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -111,7 +111,7 @@ void __init arch_setup_page_tables(void)
     prepare_runtime_identity_mapping();
 }
 
-void update_identity_mapping(bool enable)
+static void update_identity_mapping(bool enable)
 {
     paddr_t id_addr = virt_to_maddr(_start);
     int rc;
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
diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
index e0bd23a6ed..ac8d1f5c78 100644
--- a/xen/arch/arm/include/asm/arm64/mm.h
+++ b/xen/arch/arm/include/asm/arm64/mm.h
@@ -21,7 +21,7 @@ void arch_setup_page_tables(void);
  * Note that nested call (e.g. enable=true, enable=true) is not
  * supported.
  */
-void update_identity_mapping(bool enable);
+void update_boot_mapping(bool enable);
 
 #endif /* __ARM_ARM64_MM_H__ */
 
-- 
2.25.1


