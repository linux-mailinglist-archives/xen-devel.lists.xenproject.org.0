Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 917C7A11090
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 19:58:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872002.1282974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXm6O-0007um-J8; Tue, 14 Jan 2025 18:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872002.1282974; Tue, 14 Jan 2025 18:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXm6O-0007rp-Fc; Tue, 14 Jan 2025 18:57:24 +0000
Received: by outflank-mailman (input) for mailman id 872002;
 Tue, 14 Jan 2025 18:57:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dohy=UG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tXm6N-0007qS-EN
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 18:57:23 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2405::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 615f1a77-d2a9-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 19:57:20 +0100 (CET)
Received: from BN9PR03CA0727.namprd03.prod.outlook.com (2603:10b6:408:110::12)
 by SN7PR12MB8026.namprd12.prod.outlook.com (2603:10b6:806:34b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 18:57:15 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:110:cafe::fc) by BN9PR03CA0727.outlook.office365.com
 (2603:10b6:408:110::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Tue,
 14 Jan 2025 18:57:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.0 via Frontend Transport; Tue, 14 Jan 2025 18:57:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 14 Jan
 2025 12:57:14 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 14 Jan 2025 12:57:13 -0600
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
X-Inumbo-ID: 615f1a77-d2a9-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mmr8MXbAwENZkyKTHNs0pPPXdBqwvAiipm1hKGeEA1vI/hG86JUZArI/QNV9S5X+RkoliLqskoKk1mBtcQ7CRgIZIqjPyY2YIo74mrjSSezZ/RJ11YA0wPXee/kZHAB9DfAdI1pjYvj9aNJG/e6/nL/tiLZYMAznadLHdcnHInuD3VpZZaxADc/fRNN7oKWrOq7JLKPctUAPDdaWvt9xN4KnNbAniALMH7fzNCZ5h0+m6PCctO3xJvMVpQQLVIQvEfnqDI61azP2n7J6rHBqHcWAFRwrrqQTjMreRO6V3/RIWP3RibzRsdO0p6xIzyxhm9q0AQF9sWjDMdJor6wIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSX8u7kgRxqQsAkDUZACV08DYvo5axEZDtDDpGJj2EM=;
 b=NFDJzhLo4s1tPwKuy05hg34DSwjKsUF1bGeaqYl/M5R4beUV88U8jK93c0gh5LYUD/63ACuG0KiV6SY3Ph7QV5UAeXKrFr4OxavgxNT9vUoaA2Q4xBFUcaKkARbpBsJ8sqJZchpioKz8qLFsUkkgHF6nNONeyOlDpgrQTlafaPgnMbM5oIQ0c19xj2BWy/2s+24Ndik1lydaSmH4u4yXPENmEV16LIKxQEA0XTFzV7JRZtCtYTqmIGIkXxmjoZRwBz89uee63ju6bO1VWQzZADRiq0LoKZEamLjuEX6iPuudXphCyRRaqlI04WrdyFNyWKDjinFInOWTWjubai+M/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSX8u7kgRxqQsAkDUZACV08DYvo5axEZDtDDpGJj2EM=;
 b=wqijbo724tPOqmL2+LXgPtL36BHyrgvCCaTj0AXK3npw5pG4gCL+dmjRLgKIrB4FEgmctcK/iOyN7LtiokkgjBHaqLQp9QHyjYgMLpA+Zzmnouf0unrSNAykVVt758TbmuwWgYlIDkXF82gYiIYM1E3lHPWOIn20S5wiDwh1mjs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
Subject: [PATCH] docs: fusa: Fix OFT tags for the design requirements
Date: Tue, 14 Jan 2025 18:57:07 +0000
Message-ID: <20250114185707.3376960-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|SN7PR12MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d26bbe-d154-4021-4151-08dd34cd42e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JMCcfBsQ2p8gbpaMXlDSjjsROivEFU2jQ2RrOE1IZO35vxA1RIWPl0ybxEEY?=
 =?us-ascii?Q?+7g+t4KeiblSolVD3Khxwz78LpMjTz09mqQIVsyroql9qBwZt/qxVcxAVS/q?=
 =?us-ascii?Q?N5frd/3jTIf0+OvDF/KyMFcQtLs/+a1ieq/U8sTQ4Twap5AKSjVZgfLXTGcB?=
 =?us-ascii?Q?iqPhlcMyBi13ym91XGQZZizcQH0h5NI+KBK+97BiiC9Brnlk4ZKEpmHPjxnW?=
 =?us-ascii?Q?nXgek6GdDO5a8D3fufhBxGJPkfRhLugOeDbs8U0IlKdVCFh/BEDyLaRUwErC?=
 =?us-ascii?Q?cgNnL3Une7Bs8g0OpA2IFw2sLmHAaSK+wtehmEFcGrb8dY4j7q2nERKLBw9V?=
 =?us-ascii?Q?pxVin4dpCbVX+5sAeUz52G+IoFU52v55ORi0Qz82f0zJficxUqVZhsYgh+y4?=
 =?us-ascii?Q?pxDR5vSgwfzs2S/JA1ypjOFQh6Vqu87tB8SxUYpRumdyGSuLOdZEBz+B610d?=
 =?us-ascii?Q?St0lUj0F7Cap1CyJsrhwNgNDtWynpqOaBwlWS9RAiPQsS3KCZNOfCTt5xYp4?=
 =?us-ascii?Q?LOfxr20uo6F18CQ49eGCE1AbgH+6ddEcgTgeYoCn3oUU+jtNf0qt34ZEzyQ/?=
 =?us-ascii?Q?xW6y3M+t6WbvOElwmk9zdvUSBSC9HI95x7ynXvjEYbzBM2Lj7S2J0dgVlNZ3?=
 =?us-ascii?Q?Sk9w+PwjsPK3SZ7GXIVCqlVwwSdPDFeqRUaeXs/Wi+vu61nsOcTrYnS/TKRX?=
 =?us-ascii?Q?D5cB30cNYcSUHq4I8XtSLT/qwdkCbDuU0+ckRXAjuntZB/rdIQp3skIOvaYa?=
 =?us-ascii?Q?fyd+tuMt6kNYHMXOM6891O65QI9Zz5VEAkGaGGOKzt0oF2C3WJzzlsrXfsuZ?=
 =?us-ascii?Q?/KeitTWTQH3Y2CrGodsHjmAr4vtN4C1rzCCiqw3NtyO24OghtzhPUutj1vnO?=
 =?us-ascii?Q?3sqJrrXG7Pxi4kM/66ax+pdF0JuvXGP/zhEqEN00pqqkB/k3RMtJSZYpv4Vz?=
 =?us-ascii?Q?0WcZkMgtp/la8zO3JQ0+VCblLAIw9+OE9Mh+AImS3N4DDh0PHBMNflMN02vl?=
 =?us-ascii?Q?Rs7sQGhYvIQXLVBQT8wmal3gOxrqVOrr8DRZksUJAXKR4To1TAvPmPa9wwCk?=
 =?us-ascii?Q?R5rowpZPOLHoEVuMnZP8WjjTR9sROirx6i9M+vBYrhypi9LwXap7yFTewxT0?=
 =?us-ascii?Q?2pdRgpFNprFLizcnn9QHG7X8ZlKrcjhXbzjBQHAHuskIBN7zd4XHqVZPhwbh?=
 =?us-ascii?Q?kAj5KmO5eXpwi6McPAqDnwMN547b0nhfMJ7sWvCcS/o3Ki8LyCCjVsLOlgE8?=
 =?us-ascii?Q?whvJ/5hbrc4LSobbvH90/Resrpnb5UD36bdU83V6Jy6LujBpZTxUHjc7L7wU?=
 =?us-ascii?Q?2XLMGZ4gqsQL8XUoZnnEFqRXTgTPrgxBx2ffdfQ/PAv9mVBongP5+81+S59g?=
 =?us-ascii?Q?vbZplHcJpBDZboN/2ZVgb7T+K4dFT6b+q3ApjA12ecQyR1phI5qbfyPyTHGT?=
 =?us-ascii?Q?f67OaaJVMA82/EHApTb/WWgEk8Iql05J?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 18:57:15.0983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d26bbe-d154-4021-4151-08dd34cd42e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8026

The OFT tags for the design requirements are updated.

Fixes: b9f9b396452 ("docs: fusa: Add dom0less domain configuration requirements")
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 .../reqs/design-reqs/arm64/generic-timer.rst  | 16 +++++-----
 .../fusa/reqs/design-reqs/arm64/sbsa-uart.rst | 30 +++++++++----------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
index 9d2a5a8085..745e755638 100644
--- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
+++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
@@ -21,7 +21,7 @@ Comments:
 Domains can detect the presence of the Generic Timer device tree node.
 
 Covers:
- - `XenProd~emulated_timer~1`
+ - `XenProd~arm64_emulated_timer~1`
 
 Read system counter frequency
 -----------------------------
@@ -37,7 +37,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_timer~1`
+ - `XenProd~arm64_emulated_timer~1`
 
 Access CNTKCTL_EL1 system register from a domain
 ------------------------------------------------
@@ -53,7 +53,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_timer~1`
+ - `XenProd~arm64_emulated_timer~1`
 
 Access virtual timer from a domain
 ----------------------------------
@@ -69,7 +69,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_timer~1`
+ - `XenProd~arm64_emulated_timer~1`
 
 Access physical timer from a domain
 -----------------------------------
@@ -85,7 +85,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_timer~1`
+ - `XenProd~arm64_emulated_timer~1`
 
 Trigger the virtual timer interrupt from a domain
 -------------------------------------------------
@@ -101,7 +101,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_timer~1`
+ - `XenProd~arm64_emulated_timer~1`
 
 Trigger the physical timer interrupt from a domain
 --------------------------------------------------
@@ -117,7 +117,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_timer~1`
+ - `XenProd~arm64_emulated_timer~1`
 
 Assumption of Use on the Platform
 =================================
@@ -139,7 +139,7 @@ While there is a provision to get this value by reading the "clock-frequency"
 dt property [2], the use of this property is strongly discouraged.
 
 Covers:
- - `XenProd~emulated_timer~1`
+ - `XenProd~arm64_emulated_timer~1`
 
 [1] Arm Architecture Reference Manual for A-profile architecture, Chapter 11
 [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
diff --git a/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst b/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst
index 89598fa8a5..9aaf081f16 100644
--- a/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst
+++ b/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst
@@ -21,7 +21,7 @@ Comments:
 Domains can detect the presence of the SBSA UART device tree node.
 
 Covers:
- - `XenProd~emulated_uart~1`
+ - `XenProd~arm64_emulated_uart~1`
 
 Transmit data in software polling mode
 --------------------------------------
@@ -36,7 +36,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_uart~1`
+ - `XenProd~arm64_emulated_uart~1`
 
 Transmit data in interrupt driven mode
 --------------------------------------
@@ -51,7 +51,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_uart~1`
+ - `XenProd~arm64_emulated_uart~1`
 
 Receive data in software polling mode
 -------------------------------------
@@ -66,7 +66,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_uart~1`
+ - `XenProd~arm64_emulated_uart~1`
 
 Receive data in interrupt driven mode
 -------------------------------------
@@ -81,7 +81,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_uart~1`
+ - `XenProd~arm64_emulated_uart~1`
 
 Access UART data register
 -------------------------
@@ -96,7 +96,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_uart~1`
+ - `XenProd~arm64_emulated_uart~1`
 
 Access UART receive status register
 -----------------------------------
@@ -111,7 +111,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_uart~1`
+ - `XenProd~arm64_emulated_uart~1`
 
 Access UART flag register
 -------------------------
@@ -126,7 +126,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_uart~1`
+ - `XenProd~arm64_emulated_uart~1`
 
 Access UART mask set/clear register
 -----------------------------------
@@ -141,7 +141,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_uart~1`
+ - `XenProd~arm64_emulated_uart~1`
 
 Access UART raw interrupt status register
 -----------------------------------------
@@ -156,7 +156,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_uart~1`
+ - `XenProd~arm64_emulated_uart~1`
 
 Access UART masked interrupt status register
 --------------------------------------------
@@ -171,7 +171,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_uart~1`
+ - `XenProd~arm64_emulated_uart~1`
 
 Access UART interrupt clear register
 ------------------------------------
@@ -186,7 +186,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_uart~1`
+ - `XenProd~arm64_emulated_uart~1`
 
 Receive UART TX interrupt
 -------------------------
@@ -202,7 +202,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_uart~1`
+ - `XenProd~arm64_emulated_uart~1`
 
 Receive UART RX interrupt reception
 -----------------------------------
@@ -218,7 +218,7 @@ Rationale:
 Comments:
 
 Covers:
- - `XenProd~emulated_uart~1`
+ - `XenProd~arm64_emulated_uart~1`
 
 [1] Arm Base System Architecture, chapter B
-[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/serial/arm_sbsa_uart.txt
\ No newline at end of file
+[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/serial/arm_sbsa_uart.txt
-- 
2.25.1


