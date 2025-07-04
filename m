Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1083AF8DA5
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033071.1406488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcPW-0002hq-PU; Fri, 04 Jul 2025 09:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033071.1406488; Fri, 04 Jul 2025 09:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcPW-0002fB-Lz; Fri, 04 Jul 2025 09:08:46 +0000
Received: by outflank-mailman (input) for mailman id 1033071;
 Fri, 04 Jul 2025 09:08:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aOXq=ZR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uXcPW-0002f5-2M
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:08:46 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20603.outbound.protection.outlook.com
 [2a01:111:f403:2414::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b517149-58b6-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 11:08:43 +0200 (CEST)
Received: from MW4PR04CA0308.namprd04.prod.outlook.com (2603:10b6:303:82::13)
 by BN7PPF8FCE094C0.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Fri, 4 Jul
 2025 09:08:39 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::3d) by MW4PR04CA0308.outlook.office365.com
 (2603:10b6:303:82::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Fri,
 4 Jul 2025 09:08:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 09:08:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 04:08:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 04:08:35 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 4 Jul 2025 04:08:34 -0500
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
X-Inumbo-ID: 7b517149-58b6-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5fA5xxCdMseAeQq1TVlaDSbR+Fb38LUu7HGM4b2MoL4qIsJwT0VD3VqNiFZb4MbD/R3kkeeAGHgiC5gvZhnLAzc9ewuAMDrlHAJps5hLTy9Trtyqa+wkBP/fpNpwvSz7M0vGhKOvEvdpdR/VyhAcGkl5WISHDPj6nf7cV9vdRAuKYT2BPdA9/bAkz06OSEF12ZNXEA0keurXSqn3XQwPQ7TKMq1475BKem2nJWxFH9Nqp9fMZqNMPtnF22N/FKVzkwYtSzmPWEMcqkY/QnMQbyee5TWEx79nH2aPrOJ6/iqvMYPWSi+MgaNGSYLFSCdwlX/S/un5IrmHhcsnPyKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18lvsKu0Ub9IRk6zvJZ93t73GuhtCzAUDne4pgEDIRI=;
 b=A3pVaQgQ+PEB5Tig2OWw9k2dMbCbj7Kf3sHueBjXlQuv1bsiHON0/A2dwl7OkWHluLOBHLges4CcIRGwL51cmR2gvKHda8ixYBRBLlDHoFMS+qC2m9n0KIxLcw0Rkvd3JeFpp30ijhdxyNJ5XZdWeGEtn0jJFKPirVNwOZbbFNO8xdHNcoe6TNRqF1F+DcHYlPqK/j2zyu0dEJfAac91EIX9Vcc/T80yHwvRz4/+DUy3bEmea9kJJJiRtHGw9idSg6sDlcxXAseMxg3FVaBZjQk+Q27ldQcDJwT6f0DNbLab0IV888Oe/CKCAsSsGnVDaYdDu0du+kpzAlbrVEDMdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18lvsKu0Ub9IRk6zvJZ93t73GuhtCzAUDne4pgEDIRI=;
 b=GslqHNCgYhCAeg7qNXVzFFr8sLHoZtMYECIvpD9lOfYFEYMfKZafqH90CpO3NVIy8zfCe3xNioqH4uOI09XKD0lf1diahZ4HCcq+NoPaT/bJ1cT+Xs/EtVNcr3Fists6tEszwHUsNfZY58AGLj/pvZGN63Ein67VFE69sGNOSQ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm32: Tidy up setup_mm()
Date: Fri, 4 Jul 2025 11:08:31 +0200
Message-ID: <20250704090831.45804-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|BN7PPF8FCE094C0:EE_
X-MS-Office365-Filtering-Correlation-Id: 383fb7a2-4b5e-466b-daa6-08ddbada5cca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?99SwilMptFwQLK9BkuFJyHt1lza5aY5A72dg73apbfw4eIBS8PwNOAsROV7Z?=
 =?us-ascii?Q?Xq7TYMN/Ag+AjI4fWCV3tYbAv3pDZU9eDoxovwDwxhF3ffT1hZpOvW/sPKLd?=
 =?us-ascii?Q?RUJZD1BtqDz6uuvHeUu82UIAO31fDhRV7o864MAkBgyvujvohahVx3DEx8gY?=
 =?us-ascii?Q?3CEf8c533019Mo+LUfsGguB12r/IgM665MHCVW620FDQKaxIjL50GKMJjHNE?=
 =?us-ascii?Q?nUF+4sBwt0GskPUhB7kD6d3iT/AfyMdRXt+Dyp2VZIjuFs2HtsLk+8r1wMvp?=
 =?us-ascii?Q?S5l+KXnXHsNJxh+65ksbDUDk6HE6E/N5BogT5IaSHVGb2c7sdC8HMjd4Y3XG?=
 =?us-ascii?Q?JDgFHY0fRkIz+zPjmjfN+bCWqSO8HWYNmLpIqJAFnbeCYA0PFL0tMPIiC/dH?=
 =?us-ascii?Q?tA4BWPHXFOHdSRFxu+flBTUPPleJ82bLzEqSEedjz0MjTI3EKgH1ubM08FLL?=
 =?us-ascii?Q?gG2p5IjF4zz351wJHSA0Qo0fw5AxTmcF/0ALaVTZ54ZIhX3b7Xc0IKix9Xt8?=
 =?us-ascii?Q?AdvtuANTch1Dgii2vESuzEM3605HLNKadQ8A4FKrHTZglAjJRR5fJ5Pbw1lM?=
 =?us-ascii?Q?aW0JfEReMwQHYp6KCkrGi0vVYnFddfPE0B91s2wK/0Lhvm+Qxyj4luDF1wrP?=
 =?us-ascii?Q?HVW/WggYsT6XtJ0y27p6LXA0xATwdQiYil7LATEm84FbSyMk2w/ccu037FEC?=
 =?us-ascii?Q?DlmTuh2mKNwRBtjY9wo6GspHRTyWA9SHAxwe+RGzSLwfQnQVK8CNZNJ5dAQE?=
 =?us-ascii?Q?ne0Zw8Puc7STRCusO/ogB9rkax6kDx15FCttsth7rK90ChfIFWAvnpBveYs0?=
 =?us-ascii?Q?pveQ9vsTqRboKpk0H5BxdXu3ZzJMeQ+cUX8Li0CVxEQHVf1/KkJiXhsDFhl2?=
 =?us-ascii?Q?758fQgLpg9Dte4vzwHU1T9h/7Be6KcDZZvKHTOCVbfJpMZbcs+4jUrW2CI8I?=
 =?us-ascii?Q?thc+m3bXeyLhCPSkkQDasLQPbiVFEev44rMebRmwoK8bCLZbIbykDrBoOCrP?=
 =?us-ascii?Q?KW7I4FFY3BT9jfmTOa7kcelbxCNatz2/ffUYSQEfu0W/3/1FPd1ALoCfJseP?=
 =?us-ascii?Q?YBJ2K+yh9sa5uh/Ti7Z6A+z3VDAmkaxtcs1TMrbStpc640dZGBXJfI02Imwr?=
 =?us-ascii?Q?HfQhJvqRLPJg6d2pYmApHzh8+5VMLSUjePI0V6LTPZbkRNFbjBTPeOZHoOSO?=
 =?us-ascii?Q?bd88Xu82X+ldJxlPzIQtjZRaH9CJKJaEj0m6vingm8l3nN9zDMWW7QtheNro?=
 =?us-ascii?Q?+b8FKm7QmHQbVGtVqyoP5DHFeKMzLCi2aVHMQDazw8Er/1vXm40sHwPEKY/w?=
 =?us-ascii?Q?oWgUiR+1iPU08ZPWru8P13w7AB7UgZQ7OGFkPqAFF/IdWfhWk8KBFgpkPDL+?=
 =?us-ascii?Q?rGRmv4On3glGglAaJcfJM0z431T6pBkp0R/Skz4KwvmZQ3Q9ukMDYaZXPadH?=
 =?us-ascii?Q?9RjSXw8XRx6jtuxGmDSTbC33RN9CnHAnHy19xX6lCCRgnAajQoqauJO5pdrs?=
 =?us-ascii?Q?u4ahBtGmY4Yi4+/u/X0z2eV7Mq00RDWleYht?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:08:37.7572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 383fb7a2-4b5e-466b-daa6-08ddbada5cca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF8FCE094C0

The current look and feel of setup_mm() leaves a lot to be desired. The
scope of variables is not the best, many variables are not really needed
while some others are set but not used. The first iteration of membanks
is split from the loop for no reason. Tidy up this function for better
readability.

No functional change.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/arm32/mmu/mm.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index e6d9b49acd3c..5e4766ddcf65 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -74,8 +74,7 @@ static paddr_t __init fit_xenheap_in_static_heap(uint32_t size, paddr_t align)
 void __init setup_mm(void)
 {
     const struct membanks *mem = bootinfo_get_mem();
-    paddr_t ram_start, ram_end, ram_size, e, bank_start, bank_end, bank_size;
-    paddr_t static_heap_end = 0, static_heap_size = 0;
+    paddr_t ram_start = INVALID_PADDR, ram_end = 0, ram_size = 0, e;
     unsigned long heap_pages, xenheap_pages, domheap_pages;
     unsigned int i;
     const uint32_t ctr = READ_CP32(CTR);
@@ -89,19 +88,14 @@ void __init setup_mm(void)
 
     init_pdx();
 
-    ram_start = mem->bank[0].start;
-    ram_size  = mem->bank[0].size;
-    ram_end   = ram_start + ram_size;
-
-    for ( i = 1; i < mem->nr_banks; i++ )
+    for ( i = 0; i < mem->nr_banks; i++ )
     {
-        bank_start = mem->bank[i].start;
-        bank_size = mem->bank[i].size;
-        bank_end = bank_start + bank_size;
+        const struct membank *bank = &mem->bank[i];
+        paddr_t bank_end = bank->start + bank->size;
 
-        ram_size  = ram_size + bank_size;
-        ram_start = min(ram_start,bank_start);
-        ram_end   = max(ram_end,bank_end);
+        ram_size = ram_size + bank->size;
+        ram_start = min(ram_start, bank->start);
+        ram_end = max(ram_end, bank_end);
     }
 
     total_pages = ram_size >> PAGE_SHIFT;
@@ -109,18 +103,14 @@ void __init setup_mm(void)
     if ( using_static_heap )
     {
         const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
+        paddr_t static_heap_size = 0;
 
         for ( i = 0 ; i < reserved_mem->nr_banks; i++ )
         {
             if ( reserved_mem->bank[i].type != MEMBANK_STATIC_HEAP )
                 continue;
 
-            bank_start = reserved_mem->bank[i].start;
-            bank_size = reserved_mem->bank[i].size;
-            bank_end = bank_start + bank_size;
-
-            static_heap_size += bank_size;
-            static_heap_end = max(static_heap_end, bank_end);
+            static_heap_size += reserved_mem->bank[i].size;
         }
 
         heap_pages = static_heap_size >> PAGE_SHIFT;
-- 
2.25.1


