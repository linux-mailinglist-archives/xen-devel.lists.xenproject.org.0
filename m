Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587FB945DBC
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 14:15:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771056.1181669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZrBo-00043i-PN; Fri, 02 Aug 2024 12:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771056.1181669; Fri, 02 Aug 2024 12:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZrBo-0003zM-M6; Fri, 02 Aug 2024 12:15:20 +0000
Received: by outflank-mailman (input) for mailman id 771056;
 Fri, 02 Aug 2024 12:15:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sjRO=PB=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sZrBn-0002qa-1y
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 12:15:19 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e05818b6-50c8-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 14:15:17 +0200 (CEST)
Received: from SJ0PR05CA0176.namprd05.prod.outlook.com (2603:10b6:a03:339::31)
 by SA1PR12MB8096.namprd12.prod.outlook.com (2603:10b6:806:326::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Fri, 2 Aug
 2024 12:15:12 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::f7) by SJ0PR05CA0176.outlook.office365.com
 (2603:10b6:a03:339::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.7 via Frontend
 Transport; Fri, 2 Aug 2024 12:15:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Fri, 2 Aug 2024 12:15:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 Aug
 2024 07:15:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 Aug
 2024 07:15:07 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 2 Aug 2024 07:15:06 -0500
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
X-Inumbo-ID: e05818b6-50c8-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oslAwda1dOk84CVTp2i4/WK6dl3r8449U7UftkgNjVvtkM0MiUShwwEPU+P6nVNRUsPqzqp0PCyUIyxnLKAJANf72Kjh/AF3kelOoHceuv1ciPazigdRZ9CFDp5OlnIuXEpG935mwTJ+eC+hHy/PmD/59CNQf2Wu5T0UQKbvg6JOyFZnF4Z0oE+Q0XwOIhrMip5Ao1hNB3h/PN5o8My3NujsVSlJHecU172J/oyORkJ7pcYCrjpWqHGYE1d9ZmbvyCfXtByFGNS1aUTU7Hib3NoHdiVegP6xWGVnwfbXltSrUHv2PQQ7ENFuz734nwZ1OsVmef1SUUmpg9una7OgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEyWPlBd3oxoq5owatePmHZPc7oCgtMUIdm8ZJtjgDM=;
 b=Nz5oqFLGW1FaAJgIeLYcn0pVWE/Lx0kbirLzp8JriOoTZZicQwJfxyvBSTVG9eqdeUg/PX65v8qg13f0grendsE5hPTugstn8vdf6+VEQKGOSTcShiJT5YFb9+k6DR/3NXeyewWCLiKL5rAslquwPnc/5Xfqifi2+mIcVsgdJUSSZx7GUShbF0BLlbGxaoHGfOultfL+/7tLT0/FIp5oGEpMWDFKia9zHqIn8G75uYU6AJUmcF27JZWBnTfC8AzviPs1DpC3CfLUq8+aPzE6YBjQvMLCcAN42eJXAr1OYjBukvHCBd2mfGTQfyM1FOcmwJD0Z6quiq/CYNhSTuSRBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEyWPlBd3oxoq5owatePmHZPc7oCgtMUIdm8ZJtjgDM=;
 b=J7+3DMvNiP53g8Qb0wDSiXR8RdWZMqekooLUY9YaEA7RT3zwChmSYuKpCxJILyr/Zg3C4SP9hE/S+1loshqhp9tqTAuJWzF2e/BMWKi6XSO0t5w87tDVJr++ZMctgmTu7dEPXBqhtgk6MNQ7L5EaqEUokYfQvr7xT2/rorem6sc=
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
Subject: [PATCH v1 4/4] xen: arm: Enclose access to EL2 MMU specific registers under CONFIG_MMU
Date: Fri, 2 Aug 2024 13:14:43 +0100
Message-ID: <20240802121443.1531693-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240802121443.1531693-1-ayan.kumar.halder@amd.com>
References: <20240802121443.1531693-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|SA1PR12MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 61979d1a-0a7f-4ef2-82d2-08dcb2ecc254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RK9Z/YLBpjoTcRSgGwROFfWHPvL/1mP1tAZiD1aCfCFXZCeINf8iELG5aMGR?=
 =?us-ascii?Q?P8DZbIlFgWbXAYRGijGLk1PZ8W5FxqfLFCPn3gYl9b27zyo3DmUeLrYSIHls?=
 =?us-ascii?Q?0IT1QnkDZcI/ZmN0vrNtKSeIn6ea4mCetCDRne+6+N3ivEkuXopIL/SZu6pB?=
 =?us-ascii?Q?WpKXd98WOJwQMURgWItSDvanA/u7/1O4qJg9maEXxiueE9tuaQ+4GQ95wZAx?=
 =?us-ascii?Q?MNf31izaNNTOBl/0/y9+R+AoLXZ6B2GyE5eEJirPYZ1AFXeumuyiCTgJmgpb?=
 =?us-ascii?Q?9ww0JiIiUjGNG6t0ZbwsZ6wIckGWVNB3qv0m5n70ola1jJsjz95i3uQF8DG4?=
 =?us-ascii?Q?Ug9NbrAi/2Ai8lz4NN1/VvixvoHkkcn/V+P1friweP/ghCfnRFpUldRHfoj3?=
 =?us-ascii?Q?GHh3f+KkizxeEVoNZjTx3SkWq7WEyh2uv3Ro2UmbAqZx5DRDThHNOuZRApqD?=
 =?us-ascii?Q?2WsqpmD3zUiazQ3MYX5Lg0mo4bh4uBcdTfnHssZVrP86RSbR+8uB9tN6cHVy?=
 =?us-ascii?Q?GCbEudB/4BEZ43/fMnJEuc0x4Q0PSmqgXf0ShuMEnWeX0Hq5FhNNOo4HrN2q?=
 =?us-ascii?Q?z4DlIP1clCZ/hVtESvQqCXxjMFc5YDCAQZb7jaSteV1E2N/i0qQlI5OnTsnU?=
 =?us-ascii?Q?0u8DlQtYpsLMN0pgP6V7CLR6OlqC+2Iswed3e15xvQPt0aWQS9gPF2RvvGTc?=
 =?us-ascii?Q?JDxmBUJR846DWpv2oOCIyx/Fh5JIwmIVxM/LkEJ5ss0ICaLqlurnQOBWiOz/?=
 =?us-ascii?Q?WEovErJl/i5XdmDDoQmtf3Nr75TQOib34TUBRpX6iWIw1jAVUP2rxFkiZtRq?=
 =?us-ascii?Q?qjdBeukIvD72pGvWq00w1/J4G33QgwKCpnRsOA3+BSRpCFSFwJYOSqYuJZsi?=
 =?us-ascii?Q?nuBkRxv5yNNp4TwAWmtDkPGB3zoDK4Stf/BUi46qkZQbhST0U8QNO4iXrD2P?=
 =?us-ascii?Q?Q5hd2wDT5q2rk6Ca6A5w8jE6AORuq75YEcWOS1weWkzltTBLDubWQ+okw0L+?=
 =?us-ascii?Q?df8K6tAoDOyqurpsJTaj/aarcjG5HZNiX1+BkkW8P5WtCd8l/gOhKFiaoono?=
 =?us-ascii?Q?fUwLzab9J1RxfcgcUTZKNmtsl4N3yKSuwOcqF7Zto3hFcHXMUxiYT6ICD2Rk?=
 =?us-ascii?Q?O4HYb4hbFzOnuiUV4t8LNORyOVx31mMHC85gBVAVhuCpRIsHiO89YHTHbopA?=
 =?us-ascii?Q?ZVpUEPgCjM4k7wfNMglYiwcdPvyLzYt+MVvpD4bYKkaRP8dmIbP1KuBCdNu/?=
 =?us-ascii?Q?ODrjIJ5twYy7C3PF3jC2yp1siAkhkKPsdW+wgtsv+hvzu129iEQ3GOkHpI47?=
 =?us-ascii?Q?qMkMyE17ZX6eTWoPc4LM2RsZVP6wULbtJ4/lN9ILtYwWLN4PEbMuRR/gTVRg?=
 =?us-ascii?Q?s8iDNj5tK12cJ5nywMVDCKzEeSFqtDSCeMiG3u1qUKlZp9O4ntlprISvq3V6?=
 =?us-ascii?Q?fW5uoljkAWnMxogm+XZxeeB+lXeGd5x3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 12:15:11.9612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61979d1a-0a7f-4ef2-82d2-08dcb2ecc254
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8096

All the EL2 MMU specific registers are enclosed within CONFIG_MMU.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/traps.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index aac6c599f8..766aacee77 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -919,12 +919,14 @@ static void _show_registers(const struct cpu_user_regs *regs,
 #endif
     }
     printk("  VTCR_EL2: %"PRIregister"\n", READ_SYSREG(VTCR_EL2));
-    printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);
     printk("\n");
 
     printk(" SCTLR_EL2: %"PRIregister"\n", READ_SYSREG(SCTLR_EL2));
     printk("   HCR_EL2: %"PRIregister"\n", READ_SYSREG(HCR_EL2));
+#ifdef CONFIG_MMU
+    printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);
     printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
+#endif
     printk("\n");
     printk("   ESR_EL2: %"PRIregister"\n", regs->hsr);
     printk(" HPFAR_EL2: %"PRIregister"\n", READ_SYSREG(HPFAR_EL2));
@@ -956,7 +958,9 @@ void show_registers(const struct cpu_user_regs *regs)
     if ( guest_mode(regs) && is_32bit_domain(current->domain) )
         ctxt.ifsr32_el2 = READ_SYSREG(IFSR32_EL2);
 #endif
+#ifdef CONFIG_MMU
     ctxt.vttbr_el2 = READ_SYSREG64(VTTBR_EL2);
+#endif
 
     _show_registers(regs, &ctxt, guest_mode(regs), current);
 }
-- 
2.25.1


