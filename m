Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A72607AC9
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 17:32:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427747.677162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0a-0002lI-8B; Fri, 21 Oct 2022 15:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427747.677162; Fri, 21 Oct 2022 15:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0a-0002jp-0L; Fri, 21 Oct 2022 15:32:28 +0000
Received: by outflank-mailman (input) for mailman id 427747;
 Fri, 21 Oct 2022 15:32:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJ2K=2W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1olu0Y-0000AU-4R
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 15:32:26 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2063.outbound.protection.outlook.com [40.107.212.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f59fa01-5155-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 17:32:24 +0200 (CEST)
Received: from DS7PR06CA0034.namprd06.prod.outlook.com (2603:10b6:8:54::18) by
 CH2PR12MB5514.namprd12.prod.outlook.com (2603:10b6:610:62::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.35; Fri, 21 Oct 2022 15:32:21 +0000
Received: from CY4PEPF0000B8EA.namprd05.prod.outlook.com
 (2603:10b6:8:54:cafe::2a) by DS7PR06CA0034.outlook.office365.com
 (2603:10b6:8:54::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Fri, 21 Oct 2022 15:32:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8EA.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Fri, 21 Oct 2022 15:32:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:32:17 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 21 Oct 2022 10:32:16 -0500
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
X-Inumbo-ID: 8f59fa01-5155-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2gv/0G4+wuOp1E0CdQnkSG9yYNdonBA7eGT+0sPg1p7s7LY2iAiox5aGvF9gIx2fqe216wdanN9SfdLcpMfUIDtJRem+qiUse/5CJ7tQ4wNV1zE3G2Jg0jirbGt3MfcLxZwv16/fUWw/wiRmvut+lY0FjHHeuRojAMlgKwY6tCZLK6QmuTKU6QyITRecYnRWo9ldDbgMrKlcNIBBENnqVoK9QbUKhTOsOtlrTibRxA+5qAkRJuJZFdBlBvjQ7DXzBw3mst+Ji41az1E3HJGn3EWpoy9XCiB/IUkZu9ZJ3INjxzZDUWVrTPSqDvdmukvOkpGOLOcrLLHE4egUNqNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmDx4afjf7Hk3KdCSZeZ9Tvo7rmO4RVpxVthRWoG+NA=;
 b=dT5xvxLzwuin0Rqh4maljLRQ1bV6Hx9kiSbUVQ8b90FYiPoQsefRnKALwiAFllgVCczZFPqlSdWHAPNQAc1xnuGYp6qtBEsC1HR6KrPCvkVSQt5uaKRb5udTE+arnbnjVfRDuQOQTpksKlYlS8TljOwfyPiFHPjemDHZalEpHXqCnHGoOg9+lM5tUY0BJdtkThlkbI2nbbOCWjYGeUjZ4wjnjaFBa45LKIep/yVWfxtDxZwQ9sAAg7UZdLTEIJdXT2alTM+Zaa+88knwjcagR9LkBz6XvgJVucScyye4so9SGDzqJDBJ7YQVeLHa8/pqiq7FHVaZ/mH5nYRRNYGZ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmDx4afjf7Hk3KdCSZeZ9Tvo7rmO4RVpxVthRWoG+NA=;
 b=YxqWZlkByLXfOZqz/gaRBgS0MJldkNvzfoX7L/sNCkJC1nmZTw4reb1568LFstDNYJ6XPAsP9C1hI+QDgLBgNEEE71JZGznygDDYSPAGqgJmLrsMe+BsOQ1rS1idzAq9N3gqVCZTOcqjhwG6L0pw03/rfdGCI5I7yeoQFupze94=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
Subject: [RFC PATCH v1 07/12] Arm: GICv3: Emulate ICH_LR<n>_EL2 on AArch32
Date: Fri, 21 Oct 2022 16:31:23 +0100
Message-ID: <20221021153128.44226-8-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021153128.44226-1-ayankuma@amd.com>
References: <20221021153128.44226-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EA:EE_|CH2PR12MB5514:EE_
X-MS-Office365-Filtering-Correlation-Id: 656ac450-729b-4212-7b4b-08dab37971b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lTbYthDK2Ef/Y/g+gf0RLANT9h8Ixr1enPSqD/KxR9WOM540/f1ytOjBVhXbb67b6e9CeUwUKXtgLrNTzhDks6ZDshg94U0w32g8ARCPqyd4PKLXFRwiSp7F44csWxcoIEhYqR/YJon9JB7SzuVJm+nICVw+5g+nDvidmV1p0bNzOcQpNO5doHoyoHO18pVSltOXzTpwTIWff/L76RxVoSDrlsKv4RfwbDjIs/nfpAuiMlArmPJBOmEZM1IbGTsK+uv6LMZqp55u9PXSacFCKXVkcSHkJzKREr2abfBmZ1WYHWz5vBRL0qHvMLCQl3z78javsiYDmD21FMIKBUp0SRCFnV2P4yyuMlxhQ1uJK0H0ciJgkwTotai6qgML/RwOOImPWxC3vSCACl3sEWNOZBnJNQQJgJ3BfSrDywd0Mmuxj6CE7dXpISwFHURGONiIoXzwAS+USk24be3dEuH414XvjO/8dtuWgDq/igqwPGEkWkNKW/KHCIt5oK/XT74mfkxTcn23Q1E6PYkCEsD53kgbsmNKJrfbVJZnfijXkyzclq6tAy91d/XRVbiFxbdHuLDYKnYj7VpWgQoV80aT77UwB9MmmlbIshPZFugHXaLqjBruY7B9d7DZX9inqHmo2OSLW2oPXFN/9M8AFf0XMYHZSmdd5VV/g8YG5o2jRQdBuKljNc4BeXcQ826aunQBc1ljq9qZxQZ3L85aHDR483D1DqIGKQIde1yY1KQzuDfyQM83uxyzL3Z8RqCwbVq+jl6mE5OVy2R+jHxiMzdH8gLSdUjiMVBVSXZBsx8RaxA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(40470700004)(46966006)(36840700001)(1076003)(478600001)(186003)(2616005)(2906002)(36860700001)(8676002)(26005)(41300700001)(316002)(6916009)(40480700001)(70586007)(40460700003)(6666004)(36756003)(4326008)(81166007)(82740400003)(5660300002)(82310400005)(54906003)(30864003)(8936002)(356005)(70206006)(47076005)(426003)(336012)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:32:20.4267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 656ac450-729b-4212-7b4b-08dab37971b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000B8EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5514

Refer "Arm IHI 0069H ID020922", 12.4.6, Interrupt Controller List Registers

AArch64 System register ICH_LR<n>_EL2 bits [31:0] are architecturally
mapped to AArch32 System register ICH_LR<n>[31:0].
AArch64 System register ICH_LR<n>_EL2 bits [63:32] are architecturally
mapped to AArch32 System register ICH_LRC<n>[31:0].

Defined ICH_LR<0...15>_EL2 and ICH_LRC<0...15>_EL2 for Aarch32.
For AArch32, the link register is stored as :-
(((uint64_t) ICH_LRC<0...15>_EL2) << 32) | ICH_LR<0...15>_EL2

Also, ICR_LR macros need to be modified as ULL is 64 bits for AArch32 and
AArch64.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---
 xen/arch/arm/gic-v3.c                    | 132 +++++++++++------------
 xen/arch/arm/include/asm/arm32/sysregs.h |  52 +++++++++
 xen/arch/arm/include/asm/arm64/sysregs.h |   7 +-
 xen/arch/arm/include/asm/gic_v3_defs.h   |   6 +-
 4 files changed, 126 insertions(+), 71 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 018fa0dfa0..8b4b168e78 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -73,37 +73,37 @@ static inline void gicv3_save_lrs(struct vcpu *v)
     switch ( gicv3_info.nr_lrs )
     {
     case 16:
-        v->arch.gic.v3.lr[15] = READ_SYSREG(ICH_LR15_EL2);
+        v->arch.gic.v3.lr[15] = READ_SYSREG_LR(15);
     case 15:
-        v->arch.gic.v3.lr[14] = READ_SYSREG(ICH_LR14_EL2);
+        v->arch.gic.v3.lr[14] = READ_SYSREG_LR(14);
     case 14:
-        v->arch.gic.v3.lr[13] = READ_SYSREG(ICH_LR13_EL2);
+        v->arch.gic.v3.lr[13] = READ_SYSREG_LR(13);
     case 13:
-        v->arch.gic.v3.lr[12] = READ_SYSREG(ICH_LR12_EL2);
+        v->arch.gic.v3.lr[12] = READ_SYSREG_LR(12);
     case 12:
-        v->arch.gic.v3.lr[11] = READ_SYSREG(ICH_LR11_EL2);
+        v->arch.gic.v3.lr[11] = READ_SYSREG_LR(11);
     case 11:
-        v->arch.gic.v3.lr[10] = READ_SYSREG(ICH_LR10_EL2);
+        v->arch.gic.v3.lr[10] = READ_SYSREG_LR(10);
     case 10:
-        v->arch.gic.v3.lr[9] = READ_SYSREG(ICH_LR9_EL2);
+        v->arch.gic.v3.lr[9] = READ_SYSREG_LR(9);
     case 9:
-        v->arch.gic.v3.lr[8] = READ_SYSREG(ICH_LR8_EL2);
+        v->arch.gic.v3.lr[8] = READ_SYSREG_LR(8);
     case 8:
-        v->arch.gic.v3.lr[7] = READ_SYSREG(ICH_LR7_EL2);
+        v->arch.gic.v3.lr[7] = READ_SYSREG_LR(7);
     case 7:
-        v->arch.gic.v3.lr[6] = READ_SYSREG(ICH_LR6_EL2);
+        v->arch.gic.v3.lr[6] = READ_SYSREG_LR(6);
     case 6:
-        v->arch.gic.v3.lr[5] = READ_SYSREG(ICH_LR5_EL2);
+        v->arch.gic.v3.lr[5] = READ_SYSREG_LR(5);
     case 5:
-        v->arch.gic.v3.lr[4] = READ_SYSREG(ICH_LR4_EL2);
+        v->arch.gic.v3.lr[4] = READ_SYSREG_LR(4);
     case 4:
-        v->arch.gic.v3.lr[3] = READ_SYSREG(ICH_LR3_EL2);
+        v->arch.gic.v3.lr[3] = READ_SYSREG_LR(3);
     case 3:
-        v->arch.gic.v3.lr[2] = READ_SYSREG(ICH_LR2_EL2);
+        v->arch.gic.v3.lr[2] = READ_SYSREG_LR(2);
     case 2:
-        v->arch.gic.v3.lr[1] = READ_SYSREG(ICH_LR1_EL2);
+        v->arch.gic.v3.lr[1] = READ_SYSREG_LR(1);
     case 1:
-         v->arch.gic.v3.lr[0] = READ_SYSREG(ICH_LR0_EL2);
+         v->arch.gic.v3.lr[0] = READ_SYSREG_LR(0);
          break;
     default:
          BUG();
@@ -120,37 +120,37 @@ static inline void gicv3_restore_lrs(const struct vcpu *v)
     switch ( gicv3_info.nr_lrs )
     {
     case 16:
-        WRITE_SYSREG(v->arch.gic.v3.lr[15], ICH_LR15_EL2);
+        WRITE_SYSREG_LR(15, v->arch.gic.v3.lr[15]);
     case 15:
-        WRITE_SYSREG(v->arch.gic.v3.lr[14], ICH_LR14_EL2);
+        WRITE_SYSREG_LR(14, v->arch.gic.v3.lr[14]);
     case 14:
-        WRITE_SYSREG(v->arch.gic.v3.lr[13], ICH_LR13_EL2);
+        WRITE_SYSREG_LR(13, v->arch.gic.v3.lr[13]);
     case 13:
-        WRITE_SYSREG(v->arch.gic.v3.lr[12], ICH_LR12_EL2);
+        WRITE_SYSREG_LR(12, v->arch.gic.v3.lr[12]);
     case 12:
-        WRITE_SYSREG(v->arch.gic.v3.lr[11], ICH_LR11_EL2);
+        WRITE_SYSREG_LR(11, v->arch.gic.v3.lr[11]);
     case 11:
-        WRITE_SYSREG(v->arch.gic.v3.lr[10], ICH_LR10_EL2);
+        WRITE_SYSREG_LR(10, v->arch.gic.v3.lr[10]);
     case 10:
-        WRITE_SYSREG(v->arch.gic.v3.lr[9], ICH_LR9_EL2);
+        WRITE_SYSREG_LR(9, v->arch.gic.v3.lr[9]);
     case 9:
-        WRITE_SYSREG(v->arch.gic.v3.lr[8], ICH_LR8_EL2);
+        WRITE_SYSREG_LR(8, v->arch.gic.v3.lr[8]);
     case 8:
-        WRITE_SYSREG(v->arch.gic.v3.lr[7], ICH_LR7_EL2);
+        WRITE_SYSREG_LR(7, v->arch.gic.v3.lr[7]);
     case 7:
-        WRITE_SYSREG(v->arch.gic.v3.lr[6], ICH_LR6_EL2);
+        WRITE_SYSREG_LR(6, v->arch.gic.v3.lr[6]);
     case 6:
-        WRITE_SYSREG(v->arch.gic.v3.lr[5], ICH_LR5_EL2);
+        WRITE_SYSREG_LR(5, v->arch.gic.v3.lr[5]);
     case 5:
-        WRITE_SYSREG(v->arch.gic.v3.lr[4], ICH_LR4_EL2);
+        WRITE_SYSREG_LR(4, v->arch.gic.v3.lr[4]);
     case 4:
-        WRITE_SYSREG(v->arch.gic.v3.lr[3], ICH_LR3_EL2);
+        WRITE_SYSREG_LR(3, v->arch.gic.v3.lr[3]);
     case 3:
-        WRITE_SYSREG(v->arch.gic.v3.lr[2], ICH_LR2_EL2);
+        WRITE_SYSREG_LR(2, v->arch.gic.v3.lr[2]);
     case 2:
-        WRITE_SYSREG(v->arch.gic.v3.lr[1], ICH_LR1_EL2);
+        WRITE_SYSREG_LR(1, v->arch.gic.v3.lr[1]);
     case 1:
-        WRITE_SYSREG(v->arch.gic.v3.lr[0], ICH_LR0_EL2);
+        WRITE_SYSREG_LR(0, v->arch.gic.v3.lr[0]);
         break;
     default:
          BUG();
@@ -161,22 +161,22 @@ static uint64_t gicv3_ich_read_lr(int lr)
 {
     switch ( lr )
     {
-    case 0: return READ_SYSREG(ICH_LR0_EL2);
-    case 1: return READ_SYSREG(ICH_LR1_EL2);
-    case 2: return READ_SYSREG(ICH_LR2_EL2);
-    case 3: return READ_SYSREG(ICH_LR3_EL2);
-    case 4: return READ_SYSREG(ICH_LR4_EL2);
-    case 5: return READ_SYSREG(ICH_LR5_EL2);
-    case 6: return READ_SYSREG(ICH_LR6_EL2);
-    case 7: return READ_SYSREG(ICH_LR7_EL2);
-    case 8: return READ_SYSREG(ICH_LR8_EL2);
-    case 9: return READ_SYSREG(ICH_LR9_EL2);
-    case 10: return READ_SYSREG(ICH_LR10_EL2);
-    case 11: return READ_SYSREG(ICH_LR11_EL2);
-    case 12: return READ_SYSREG(ICH_LR12_EL2);
-    case 13: return READ_SYSREG(ICH_LR13_EL2);
-    case 14: return READ_SYSREG(ICH_LR14_EL2);
-    case 15: return READ_SYSREG(ICH_LR15_EL2);
+    case 0: return READ_SYSREG_LR(0);
+    case 1: return READ_SYSREG_LR(1);
+    case 2: return READ_SYSREG_LR(2);
+    case 3: return READ_SYSREG_LR(3);
+    case 4: return READ_SYSREG_LR(4);
+    case 5: return READ_SYSREG_LR(5);
+    case 6: return READ_SYSREG_LR(6);
+    case 7: return READ_SYSREG_LR(7);
+    case 8: return READ_SYSREG_LR(8);
+    case 9: return READ_SYSREG_LR(9);
+    case 10: return READ_SYSREG_LR(10);
+    case 11: return READ_SYSREG_LR(11);
+    case 12: return READ_SYSREG_LR(12);
+    case 13: return READ_SYSREG_LR(13);
+    case 14: return READ_SYSREG_LR(14);
+    case 15: return READ_SYSREG_LR(15);
     default:
         BUG();
     }
@@ -187,52 +187,52 @@ static void gicv3_ich_write_lr(int lr, uint64_t val)
     switch ( lr )
     {
     case 0:
-        WRITE_SYSREG(val, ICH_LR0_EL2);
+        WRITE_SYSREG_LR(0, val);
         break;
     case 1:
-        WRITE_SYSREG(val, ICH_LR1_EL2);
+        WRITE_SYSREG_LR(1, val);
         break;
     case 2:
-        WRITE_SYSREG(val, ICH_LR2_EL2);
+        WRITE_SYSREG_LR(2, val);
         break;
     case 3:
-        WRITE_SYSREG(val, ICH_LR3_EL2);
+        WRITE_SYSREG_LR(3, val);
         break;
     case 4:
-        WRITE_SYSREG(val, ICH_LR4_EL2);
+        WRITE_SYSREG_LR(4, val);
         break;
     case 5:
-        WRITE_SYSREG(val, ICH_LR5_EL2);
+        WRITE_SYSREG_LR(5, val);
         break;
     case 6:
-        WRITE_SYSREG(val, ICH_LR6_EL2);
+        WRITE_SYSREG_LR(6, val);
         break;
     case 7:
-        WRITE_SYSREG(val, ICH_LR7_EL2);
+        WRITE_SYSREG_LR(7, val);
         break;
     case 8:
-        WRITE_SYSREG(val, ICH_LR8_EL2);
+        WRITE_SYSREG_LR(8, val);
         break;
     case 9:
-        WRITE_SYSREG(val, ICH_LR9_EL2);
+        WRITE_SYSREG_LR(9, val);
         break;
     case 10:
-        WRITE_SYSREG(val, ICH_LR10_EL2);
+        WRITE_SYSREG_LR(10, val);
         break;
     case 11:
-        WRITE_SYSREG(val, ICH_LR11_EL2);
+        WRITE_SYSREG_LR(11, val);
         break;
     case 12:
-        WRITE_SYSREG(val, ICH_LR12_EL2);
+        WRITE_SYSREG_LR(12, val);
         break;
     case 13:
-        WRITE_SYSREG(val, ICH_LR13_EL2);
+        WRITE_SYSREG_LR(13, val);
         break;
     case 14:
-        WRITE_SYSREG(val, ICH_LR14_EL2);
+        WRITE_SYSREG_LR(14, val);
         break;
     case 15:
-        WRITE_SYSREG(val, ICH_LR15_EL2);
+        WRITE_SYSREG_LR(15, val);
         break;
     default:
         return;
@@ -417,12 +417,12 @@ static void gicv3_dump_state(const struct vcpu *v)
     if ( v == current )
     {
         for ( i = 0; i < gicv3_info.nr_lrs; i++ )
-            printk("   HW_LR[%d]=%lx\n", i, gicv3_ich_read_lr(i));
+            printk("   HW_LR[%d]=%llx\n", i, gicv3_ich_read_lr(i));
     }
     else
     {
         for ( i = 0; i < gicv3_info.nr_lrs; i++ )
-            printk("   VCPU_LR[%d]=%lx\n", i, v->arch.gic.v3.lr[i]);
+            printk("   VCPU_LR[%d]=%llx\n", i, v->arch.gic.v3.lr[i]);
     }
 }
 
diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
index 6841d5de43..f3b4dfbca8 100644
--- a/xen/arch/arm/include/asm/arm32/sysregs.h
+++ b/xen/arch/arm/include/asm/arm32/sysregs.h
@@ -62,9 +62,61 @@
 #define READ_SYSREG(R...)       READ_SYSREG32(R)
 #define WRITE_SYSREG(V, R...)   WRITE_SYSREG32(V, R)
 
+#define ICH_LR_REG(INDEX)        ICH_LR ## INDEX ## _EL2
+#define ICH_LRC_REG(INDEX)       ICH_LRC ## INDEX ## _EL2
+
+#define READ_SYSREG_LR(INDEX)    ((((uint64_t) \
+                                 (READ_SYSREG(ICH_LRC_REG(INDEX)))) << 32) | \
+                                 (READ_SYSREG(ICH_LR_REG(INDEX))))
+
+#define WRITE_SYSREG_LR(INDEX, V) WRITE_SYSREG \
+                                  (V&0xFFFFFFFF, ICH_LR_REG(INDEX)); \
+                                  WRITE_SYSREG(V>>32, ICH_LRC_REG(INDEX));
+
 /* MVFR2 is not defined on ARMv7 */
 #define MVFR2_MAYBE_UNDEFINED
 
+#define ___CP32(a,b,c,d,e)   a,b,c,d,e
+#define __LR0_EL2(x)              ___CP32(p15,4,c12,c12,x)
+#define __LR8_EL2(x)              ___CP32(p15,4,c12,c13,x)
+
+#define __LRC0_EL2(x)             ___CP32(p15,4,c12,c14,x)
+#define __LRC8_EL2(x)             ___CP32(p15,4,c12,c15,x)
+
+#define ICH_LR0_EL2               __LR0_EL2(0)
+#define ICH_LR1_EL2               __LR0_EL2(1)
+#define ICH_LR2_EL2               __LR0_EL2(2)
+#define ICH_LR3_EL2               __LR0_EL2(3)
+#define ICH_LR4_EL2               __LR0_EL2(4)
+#define ICH_LR5_EL2               __LR0_EL2(5)
+#define ICH_LR6_EL2               __LR0_EL2(6)
+#define ICH_LR7_EL2               __LR0_EL2(7)
+#define ICH_LR8_EL2               __LR8_EL2(0)
+#define ICH_LR9_EL2               __LR8_EL2(1)
+#define ICH_LR10_EL2              __LR8_EL2(2)
+#define ICH_LR11_EL2              __LR8_EL2(3)
+#define ICH_LR12_EL2              __LR8_EL2(4)
+#define ICH_LR13_EL2              __LR8_EL2(5)
+#define ICH_LR14_EL2              __LR8_EL2(6)
+#define ICH_LR15_EL2              __LR8_EL2(7)
+
+#define ICH_LRC0_EL2               __LRC0_EL2(0)
+#define ICH_LRC1_EL2               __LRC0_EL2(1)
+#define ICH_LRC2_EL2               __LRC0_EL2(2)
+#define ICH_LRC3_EL2               __LRC0_EL2(3)
+#define ICH_LRC4_EL2               __LRC0_EL2(4)
+#define ICH_LRC5_EL2               __LRC0_EL2(5)
+#define ICH_LRC6_EL2               __LRC0_EL2(6)
+#define ICH_LRC7_EL2               __LRC0_EL2(7)
+#define ICH_LRC8_EL2               __LRC8_EL2(0)
+#define ICH_LRC9_EL2               __LRC8_EL2(1)
+#define ICH_LRC10_EL2              __LRC8_EL2(2)
+#define ICH_LRC11_EL2              __LRC8_EL2(3)
+#define ICH_LRC12_EL2              __LRC8_EL2(4)
+#define ICH_LRC13_EL2              __LRC8_EL2(5)
+#define ICH_LRC14_EL2              __LRC8_EL2(6)
+#define ICH_LRC15_EL2              __LRC8_EL2(7)
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ASM_ARM_ARM32_SYSREGS_H */
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 54670084c3..d45fe815f9 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -469,8 +469,11 @@
     asm volatile("mrs  %0, "__stringify(name) : "=r" (_r));         \
     _r; })
 
-#define READ_SYSREG(name)     READ_SYSREG64(name)
-#define WRITE_SYSREG(v, name) WRITE_SYSREG64(v, name)
+#define READ_SYSREG(name)          READ_SYSREG64(name)
+#define WRITE_SYSREG(v, name)      WRITE_SYSREG64(v, name)
+#define ICH_LR_REG(index)          ICH_LR ## index ## _EL2
+#define WRITE_SYSREG_LR(index, v)  WRITE_SYSREG(v, ICH_LR_REG(index))
+#define READ_SYSREG_LR(index)      READ_SYSREG(ICH_LR_REG(index))
 
 #endif /* _ASM_ARM_ARM64_SYSREGS_H */
 
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
index 48a1bc401e..87115f8b25 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -185,9 +185,9 @@
 #define ICH_LR_HW_SHIFT              61
 #define ICH_LR_GRP_MASK              0x1
 #define ICH_LR_GRP_SHIFT             60
-#define ICH_LR_MAINTENANCE_IRQ       (1UL<<41)
-#define ICH_LR_GRP1                  (1UL<<60)
-#define ICH_LR_HW                    (1UL<<61)
+#define ICH_LR_MAINTENANCE_IRQ       (1ULL<<41)
+#define ICH_LR_GRP1                  (1ULL<<60)
+#define ICH_LR_HW                    (1ULL<<61)
 
 #define ICH_VTR_NRLRGS               0x3f
 #define ICH_VTR_PRIBITS_MASK         0x7
-- 
2.17.1


