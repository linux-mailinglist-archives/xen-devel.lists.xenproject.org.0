Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7EAA75BA7
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 20:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931681.1333915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyx0p-0005sB-E7; Sun, 30 Mar 2025 18:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931681.1333915; Sun, 30 Mar 2025 18:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyx0p-0005oT-8j; Sun, 30 Mar 2025 18:03:59 +0000
Received: by outflank-mailman (input) for mailman id 931681;
 Sun, 30 Mar 2025 18:03:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bHYC=WR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tyx0n-0004t7-IK
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 18:03:57 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060d.outbound.protection.outlook.com
 [2a01:111:f403:240a::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5394a04c-0d91-11f0-9ea7-5ba50f476ded;
 Sun, 30 Mar 2025 20:03:48 +0200 (CEST)
Received: from BN0PR02CA0016.namprd02.prod.outlook.com (2603:10b6:408:e4::21)
 by IA1PR12MB7613.namprd12.prod.outlook.com (2603:10b6:208:42a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sun, 30 Mar
 2025 18:03:41 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:e4:cafe::2b) by BN0PR02CA0016.outlook.office365.com
 (2603:10b6:408:e4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.46 via Frontend Transport; Sun,
 30 Mar 2025 18:03:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Sun, 30 Mar 2025 18:03:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Mar
 2025 13:03:40 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Sun, 30 Mar 2025 13:03:39 -0500
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
X-Inumbo-ID: 5394a04c-0d91-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mus82b9+mjbuAzK6OLFi2gdeGzqiPtL8fxeLoVwBjhCB0F+QpVcZT5QBOgBl2rUpCZwYAvyLOfPyeiBh6CdP6dfHq2YBKjl2kDS3OB/whky3J7vW/JuAItalJWo6CU5MbLCWQQeI079N94M9+KA32w/2I/4LgGkM2j5m55e5S/xelIHQdi+Chc05zwOsxEpyaDxUNozGBYJBsnnUrgA3PAIKjhon7D5kRCodTm71LYrA1YySjS9B7AwmiY3WpObcd/1eaHAJAGT3+DuH9TK1rCWfwoAjxC9d9XcCjcCkL20lSi8czaD7KHB02LcRlgZE2gBQCJxSNexrjr79SfwfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8fjVeA4EQb7WyZPH3MXGgH/cncLv1FaG6lrBgZSm1k=;
 b=LAhNT18DYfvsXrMUpiKkgpvopnNUx0ncMmDZ4ejXB31jsUTFWUxh+RPGomjYPujX0BpsUv7ozlsHC3xa/HGAL13xwSbAZj4cpYft0Ks1jOdVs2QRPqo1fOLL738gBhfZoVnb/PTWljFAAR2MTNjrv0FR361Wclzp/sgCmp/TQ1EhtOlgYlke6Lhh1ksYgnp/Iqi0A9cFH8aQqNDlIG/BrWqqv0V2C9pw36uNyPZOnmU4Fbhh6ivEq71o03UgGQjn1YQKWhpPBVsA/+uPQU3CYUb/CNWHD+jETUgjtGxIMM4vwvhQ6NCYL4Jv5MAil3LHnYLqM5Tc2oYTLI65OQPDEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8fjVeA4EQb7WyZPH3MXGgH/cncLv1FaG6lrBgZSm1k=;
 b=L52BSY1em1NczGBi6aqNWcn4cDmGOGfgidexZdPwWfvK6m9gmYk2Xg+6vNq0kE5ja6bNwDRDruDrwL66ocev2EFZHax86VOioW15OsInbFS373VPTgMZ07hml34vhWXQKdK+NPHtpZfVqSM3tuTmQcj/zWNSEnccqp8eT0OMRx4=
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
Subject: [PATCH v3 1/5] xen/arm32: Move MM specific registers to enable_mmu
Date: Sun, 30 Mar 2025 19:03:04 +0100
Message-ID: <20250330180308.2551195-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
References: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|IA1PR12MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: ab7244cc-19ba-4514-3b60-08dd6fb5340d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|34020700016|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FCIx6vYTTxQp9alDw6jTNubJTzB6Y23K+S/oN8U3TS/oqO6OXvzpZAFPkVUv?=
 =?us-ascii?Q?gqDHVUNc4GxmhyBYOMRNRwDjK0sATrWMg75vF9xiOiK44PfA63jPY8Wgjbkv?=
 =?us-ascii?Q?eJsE48sSGCiRBvrHo57nWVp5C6oN9UiX+PtzoQ7X18hEJAEfNnhfTggRqZ3Y?=
 =?us-ascii?Q?eutMmrW7Nl+L70xTH4zOhn86VEDUweFlA4yDYNoCpmiMo44xLd0HqESdCVaS?=
 =?us-ascii?Q?pisESGzbTuAMJqUMgLaD3VaPpkZT8PmG+MBNzNgzI3Peg49ShYQsdeXGNjaE?=
 =?us-ascii?Q?YYoq0Amb3HvMo/H7htG+Q1hdxlUrTAH18Y5In+27qnFfHfuKVSvYq16TA9Lm?=
 =?us-ascii?Q?HuW2MdjQCjM1P4tn+yNOArGAJ1eIe99sgtjEYlUIbfvIuv1V1PY0V2FCH4s+?=
 =?us-ascii?Q?hacFRBonmMIo7TEJxXwyfKvWTxW+amZVIIaBCCRY9wb1OUKtJ/IB1vLImU2a?=
 =?us-ascii?Q?vf3nqaEyokohOM1PE3uf6KTNqjMhnBr/zF/cK5GKOOzcb4u36nUu+c0pgMCg?=
 =?us-ascii?Q?ClHWS5aCB/QzwKZNM+xhqvG2NwQvrW+RiSNkK6SY9/MC6UatNAZZAWjBI3/N?=
 =?us-ascii?Q?jBkligr/vuSg6VqNyto5Ro+QrOzAUTcL3iWwe4PSFXDxF9+eYABjuhce3Avh?=
 =?us-ascii?Q?BnadJ8F3q02vCgm3Tn50X9EMCDT7zsyPmfhscdSNUjXiAkh5EcfcpJCjnxH+?=
 =?us-ascii?Q?Cp0gwYtdHs/uT8PaCBTCVC0NTv2cj83XiY8WZdnz/ODQe7E8MmqLWEEKUTQ7?=
 =?us-ascii?Q?tvus6u7OpcR/IjuZpr1fLecuXxDVoXCfzE/0om1Q+TdHaQ4EjNGxdcp0ym8G?=
 =?us-ascii?Q?Q9DyA1rQOGoSD5xPEUoHfgGv+nPW70pj9eKnZcIAMkLSAlvYsT+4arwZgJuY?=
 =?us-ascii?Q?a6NynlQy+JmqwO3fuFTvl5UhJvu8SjFS0BkiaD0O4WeNF1ZmObYpsSEyBsB2?=
 =?us-ascii?Q?4iTHZnBeIXWtfy0GkzqL9cjq1xgs3thejOglZLF1Xhgaob9jn+sHWTCkh6iO?=
 =?us-ascii?Q?pLR3DR2bWwkvDzYl2wEiFQ7k1mDkOXtufgkP3TUXvHOLno7kVh479IGLhEom?=
 =?us-ascii?Q?478CcuX+o17KkCyD/94zlDzXQX+X3+ihxf87Y2A7lLJyRg7F1t2qEtr0W0g3?=
 =?us-ascii?Q?FUDeuc6HzNksJ7K4KtCPyjZHdPlEiohBUHxQMJdewcYPLs4CiSAQc95/3VKC?=
 =?us-ascii?Q?B5Gu2pZkv9e3Xz/KB4xfTOt6HkllR+EDUpYWUYud8EmdYYA7Ahm/74EQhBH7?=
 =?us-ascii?Q?ZRfDR9CWbGHxECZn05w+khUMi2QH7HbFCpEvWYwh7FDurR/4MwUAwv4zo9mH?=
 =?us-ascii?Q?UTIDHu1hJARTRl8m5P13WJlewCW/T5ejLs2K9H7AJHYLNJjIUOwK5hNat0ki?=
 =?us-ascii?Q?AXEilD9jlyk1bYIptT5ZqDnRzR+C3ZWzoYm6jnwV1d69Ue8OC73jgVazHuyl?=
 =?us-ascii?Q?rL1ZHG9BCEqpPpRCDmCIH/Htb+WA0VWi65G51ILlD5nkHnoZ+XdKRA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(34020700016)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 18:03:40.9055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7244cc-19ba-4514-3b60-08dd6fb5340d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7613

All the memory management specific registers are initialized in enable_mmu.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from -

v1 - HTCR and HMAIR{0,1} are not set together with the other memory management
registers in enable_mmu()

Similar changes are to be done in arm64 as well. I prefer to do that in a
separate patch so that all the arm32 changes are kept together in this series.

v2 - Added Michal's R-b.

 xen/arch/arm/arm32/head.S     | 14 --------------
 xen/arch/arm/arm32/mmu/head.S | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 4ff5c220bc..50da179f81 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -218,20 +218,6 @@ cpu_init:
         add   pc, r1, r10                   /* Call paddr(init func) */
 
 cpu_init_done:
-        /* Set up memory attribute type tables */
-        mov_w r0, MAIR0VAL
-        mov_w r1, MAIR1VAL
-        mcr   CP32(r0, HMAIR0)
-        mcr   CP32(r1, HMAIR1)
-
-        /*
-         * Set up the HTCR:
-         * PT walks use Inner-Shareable accesses,
-         * PT walks are write-back, write-allocate in both cache levels,
-         * Full 32-bit address space goes through this table.
-         */
-        mov_w r0, (TCR_RES1|TCR_SH0_IS|TCR_ORGN0_WBWA|TCR_IRGN0_WBWA|TCR_T0SZ(0))
-        mcr   CP32(r0, HTCR)
 
         mov_w r0, HSCTLR_SET
         mcr   CP32(r0, HSCTLR)
diff --git a/xen/arch/arm/arm32/mmu/head.S b/xen/arch/arm/arm32/mmu/head.S
index 1e2bbf0c82..8fa74bd556 100644
--- a/xen/arch/arm/arm32/mmu/head.S
+++ b/xen/arch/arm/arm32/mmu/head.S
@@ -279,6 +279,21 @@ ENDPROC(create_page_tables)
 enable_mmu:
         PRINT("- Turning on paging -\r\n")
 
+        /* Set up memory attribute type tables */
+        mov_w r0, MAIR0VAL
+        mov_w r1, MAIR1VAL
+        mcr   CP32(r0, HMAIR0)
+        mcr   CP32(r1, HMAIR1)
+
+        /*
+         * Set up the HTCR:
+         * PT walks use Inner-Shareable accesses,
+         * PT walks are write-back, write-allocate in both cache levels,
+         * Full 32-bit address space goes through this table.
+         */
+        mov_w r0, (TCR_RES1|TCR_SH0_IS|TCR_ORGN0_WBWA|TCR_IRGN0_WBWA|TCR_T0SZ(0))
+        mcr   CP32(r0, HTCR)
+
         /*
          * The state of the TLBs is unknown before turning on the MMU.
          * Flush them to avoid stale one.
-- 
2.25.1


