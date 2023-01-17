Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BB866DCC7
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 12:44:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479343.743163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHkNZ-00080P-Sp; Tue, 17 Jan 2023 11:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479343.743163; Tue, 17 Jan 2023 11:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHkNZ-0007xL-OW; Tue, 17 Jan 2023 11:43:49 +0000
Received: by outflank-mailman (input) for mailman id 479343;
 Tue, 17 Jan 2023 11:43:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pwid=5O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pHkNY-0007u4-2y
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 11:43:48 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3185a38d-965c-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 12:43:44 +0100 (CET)
Received: from BN9PR03CA0923.namprd03.prod.outlook.com (2603:10b6:408:107::28)
 by PH7PR12MB7870.namprd12.prod.outlook.com (2603:10b6:510:27b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 11:43:40 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::75) by BN9PR03CA0923.outlook.office365.com
 (2603:10b6:408:107::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 11:43:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT056.mail.protection.outlook.com (10.13.177.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 11:43:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 05:43:39 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 17 Jan 2023 05:43:38 -0600
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
X-Inumbo-ID: 3185a38d-965c-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIlGlNDXojU95gIuu15c38zz1HhtMPUgbJcqGGBtk5UytZzaPE3cVTQiy5EdxaNKs1hRNxVM5ZomvethdPZpanIfHpd6Zc2tHw6WkBS37Uf/WtL7WrFy2Qbhgce153hDzUuq4xgJFRvlIMXkEBD4Wf8uKILsr8cN5Tx9TLdF3sAHrk4zww1arTBQVdynIzkC8irX+goTriB3sHPWgDD4MJ0keiXsCRhd/VdumLe0PQF7+DV0iQY8YuTAw8KjSvdzJ685VqeP/P62733LumVrDXOqdKamciF+ZiagGy5Y7QBKtWSJm1DTYj/zUCi87tp9pZeoUiOf51ViETFgRvkNmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBk4GWZPUaRaWdlny3PTQIfOw4ZMvGrW1IesvtQGku0=;
 b=jdCxzIOMSUKePSXGLSEdWoJAsjOkwgAoy2nopAdZuWRcWAQh53xPLmVfQdge2VLE3ESf9qBL8YWCsPFvqNMgB+6t8WX6nqUSy4S+2l3dpPzldwF9s92Pdm7krwypPV0ajIL399+tcuFj6tGi8dBW1xFwtBBcPDXMyVSrw0S42mzyGnlTODy61nCRZP1epVIJy7fNhnxZbgHNVPmF6ihDy8ylm7X4+CnRQMJLgbfmQf6WP/RuD3ksxBKbAiMNZO+KhqGet6GmwaMrI3I3ZmYEDyn7/LIaH6FusOtvpuqGH+xxLCALORtj2OuNhV/b/ASkXAXCYBRJQ6TRoz0FI58fZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBk4GWZPUaRaWdlny3PTQIfOw4ZMvGrW1IesvtQGku0=;
 b=OHJbCktYU6FqtrNO4vxFqitlZ+NVJLT4FPhKTVvcqFVvryV4tcnklIPGJUKzL0iUBQDj4c7wYQhu27nB2M2jl288U7XwVE9NCLcmMNDdMbbMB+pw75kzqeASoYNxAN0VSvMxDdzSXCLB0LpI1+ceM0WWujB6qVGXl5A3w5Ak1Qw=
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
Subject: [PATCH v2 3/3] xen/arm: Harden setup_frametable_mappings
Date: Tue, 17 Jan 2023 12:43:32 +0100
Message-ID: <20230117114332.25863-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230117114332.25863-1-michal.orzel@amd.com>
References: <20230117114332.25863-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT056:EE_|PH7PR12MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: cab52fef-2382-48fd-479b-08daf8801426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TLi6s1V0vFWJAuwCzu9SdER67/2xMVCxxY9ShPIu5IqcBHUkVhn+r8E3YP8Gk3lN3gF+VjXgo5XQ4j1RpXUNH7gLfeSLFsUOv5rVYhlAbsfUC8t0ZLeEYig8upKkZ07AJSuHniOyp/NLgvh+jiDXTChDxcgFmI2DwZAd267MHOGtlVnGB8gvHyE0LPd/CcL9M7CXLwreD6igNaosqz8MAI0BiqXo28nyLQLx96T025jSDLJL0ddYI9valbb8I5jcNyPf1iqwHNQPclTtzUeijTJl1a2SylEkke4KYxJcqqU9M8PfBWvQbD/tbPHD+iOGYZfd0izLZ7iLI7HEq+e2/gyoI8bofEtIRPkDVDZYXLfZb/mb+CF9qP/r8Uuitl1mobeRDsPMB+ccy7owHGHqVdYjy5n39pEq+wyAV2ieO1+Bk38TUHYSKghuGrv/b9sWepP6at1/cpynKwHwbDzNNQAX+SPcphA4lZCn01eBvvIzhHNNeWQF8wNVXJIbYKippda2FxP16YAtw742cjpOw0Y6B0/BrGpayXSR17XPtLjqEoZgEd6XE6OTaCtd3TY8z8ridYzk6woolC6kWYAVd4ZCGBhYhd56BJaVJM0bVRktNvRP41jkYVPmZcTIysSW/4uM5L2CTVMbZ+oSsMUNZE3AHqBbT7AjhG5yWQlfNbQt9rN+jDfFdvEGTAXFirZxFzxY32DuUhYEZbrLwzhwy/JH5XaaxvKXLVbV6LA8OOU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199015)(36840700001)(40470700004)(46966006)(2616005)(83380400001)(54906003)(4326008)(316002)(8936002)(336012)(6916009)(40480700001)(426003)(70586007)(47076005)(70206006)(8676002)(5660300002)(44832011)(2906002)(1076003)(36860700001)(41300700001)(81166007)(356005)(82310400005)(86362001)(478600001)(82740400003)(6666004)(186003)(36756003)(40460700003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 11:43:40.3433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cab52fef-2382-48fd-479b-08daf8801426
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7870

The amount of supported physical memory depends on the frametable size
and the number of struct page_info entries that can fit into it. Define
a macro PAGE_INFO_SIZE to store the current size of the struct page_info
(i.e. 56B for arm64 and 32B for arm32) and add a sanity check in
setup_frametable_mappings to be notified whenever the size of the
structure changes. Also call a panic if the calculated frametable_size
exceeds the limit defined by FRAMETABLE_SIZE macro.

Update the comments regarding the frametable in asm/config.h.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - refactor panic message
 - move removal of FRAMETABLE_VIRT_END to a separate patch
---
 xen/arch/arm/include/asm/config.h |  4 ++--
 xen/arch/arm/include/asm/mm.h     | 11 +++++++++++
 xen/arch/arm/mm.c                 |  6 ++++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 6661a41583c6..d8f99776986f 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -82,7 +82,7 @@
  * ARM32 layout:
  *   0  -  12M   <COMMON>
  *
- *  32M - 128M   Frametable: 24 bytes per page for 16GB of RAM
+ *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
  * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
  *                    space
  *
@@ -95,7 +95,7 @@
  *
  *   1G -   2G   VMAP: ioremap and early_ioremap
  *
- *  32G -  64G   Frametable: 24 bytes per page for 5.3TB of RAM
+ *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
  *
  * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [1..255])
  *  Unused
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 68adcac9fa8d..23dec574eb31 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -26,6 +26,17 @@
  */
 #define PFN_ORDER(_pfn) ((_pfn)->v.free.order)
 
+/*
+ * The size of struct page_info impacts the number of entries that can fit
+ * into the frametable area and thus it affects the amount of physical memory
+ * we claim to support. Define PAGE_INFO_SIZE to be used for sanity checking.
+*/
+#ifdef CONFIG_ARM_64
+#define PAGE_INFO_SIZE 56
+#else
+#define PAGE_INFO_SIZE 32
+#endif
+
 struct page_info
 {
     /* Each frame can be threaded onto a doubly-linked list. */
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 0fc6f2992dd1..1a94b52cce7e 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -676,6 +676,12 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
     const unsigned long mapping_size = frametable_size < MB(32) ? MB(2) : MB(32);
     int rc;
 
+    BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
+
+    if ( frametable_size > FRAMETABLE_SIZE )
+        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
+              ps, pe);
+
     frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
     /* Round up to 2M or 32M boundary, as appropriate. */
     frametable_size = ROUNDUP(frametable_size, mapping_size);
-- 
2.25.1


