Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FBF94959A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 18:32:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772954.1183420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbN6l-0006hq-BL; Tue, 06 Aug 2024 16:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772954.1183420; Tue, 06 Aug 2024 16:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbN6l-0006fU-8M; Tue, 06 Aug 2024 16:32:23 +0000
Received: by outflank-mailman (input) for mailman id 772954;
 Tue, 06 Aug 2024 16:32:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kzDu=PF=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sbN6j-0006ds-Gy
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 16:32:21 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2412::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 728445f0-5411-11ef-bc04-fd08da9f4363;
 Tue, 06 Aug 2024 18:32:19 +0200 (CEST)
Received: from SN7PR04CA0108.namprd04.prod.outlook.com (2603:10b6:806:122::23)
 by IA0PR12MB8256.namprd12.prod.outlook.com (2603:10b6:208:407::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 16:32:12 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::1a) by SN7PR04CA0108.outlook.office365.com
 (2603:10b6:806:122::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Tue, 6 Aug 2024 16:32:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 6 Aug 2024 16:32:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 11:32:10 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 6 Aug 2024 11:32:09 -0500
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
X-Inumbo-ID: 728445f0-5411-11ef-bc04-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etdKK395KNo7Yq06oURYqjTqkV/eX5eIJPo3+JD6QPs10VlBNEqCXnLTnJcQG7i52FHMIXH2yIygG25r3Q5rAMHr99Y0Rnl8o2vMjSYlLoFTcVhpr6XiR1yfmvrOWj8SS9CR/TTqDO622DA4EwS4QXa0jmNoPkU93h2VWRsnQsGzv+XNSZjr3+V8eVrO2WmiAtCtzcOvqu/QCFxDTPy4vK+kqXcvjCn3akrZGaOoMVchwqDMaJi9bobFrwBDQrCwraxdiAgmeJoRHr7ya7ZuTRi9jB7P2+T64y0iOSOeGWr9Cqml2Mdgga/DeYEaMTbbV7aVQYb7mv5B26NiFFmqkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ro4RCdbeVMPWPxCUKX0Z9qQcm5SjMsD0JCUP7059ZMU=;
 b=xwXxu9CqW1nRXM01pvOPOHo2dtiKC3MfApNv5o8oO4WnS2hIfexmbPIkRCAUophF3+6AjHgDWgB6EU2hKkGBhdfmp+m9/wkt+AGFZ0ovQSLGLOSLHa/SfBB34Pt5CbfArnlfmYlsdrtYWfwK7hJA+OTibbqd9/2jemIquvUbYKmX2HMCLlnnBg9T/ukKX7C8FITLNUfJaaKfzJT/IeP9dy6oTsBQ7Z84RoM5HqEtcbc8XhmzEd8IBO7zqmx6v2+ljh3CEzH2FiJm4KHpDUGN6RkzqULfXW0drxVcTvSbNL8Flys85TwrUSXZhY8sBDA7mZJAB2j5U4QTEFwOgEm4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ro4RCdbeVMPWPxCUKX0Z9qQcm5SjMsD0JCUP7059ZMU=;
 b=rTISSYUzgj5wSCl3sflUjwFBhlSXoxpUHrblcjAdCM0CeDinSKAIXlY/giWL+pTgkVVL8AhmpIyy91X987WVecVExU/Nc97Yk77VM2osFxmF172iybjeAltkPPnS0X7Pp1L1z3ntTgjzH5kInUA2MOXpEDMgQ/k+vZvlvqjN1Ic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <ayan.kumar.halder@amd.com>,
	<artem_mygaiev@epam.com>, <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH v3 3/3] docs: fusa : reqs: Added a sample of requirements [DO_NOT_MERGE]
Date: Tue, 6 Aug 2024 17:31:57 +0100
Message-ID: <20240806163157.2850636-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240806163157.2850636-1-ayan.kumar.halder@amd.com>
References: <20240806163157.2850636-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|IA0PR12MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 71aa3aa4-1df0-4934-c161-08dcb63552db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NFs7yay+imCQ6Os/a4YaIc4qLiiA08yQ+OJFYK+5j6a2o6ZogB2Fz129vtEw?=
 =?us-ascii?Q?vgisnjyzvKUUkbJS6mtlra+eqSC7w4GvBGuuqf3Lio8qFO8edVWLhJhL1goM?=
 =?us-ascii?Q?Jp0CW23HDbz3IfwYqMC4eO5rrr4ZLnl5ApHUeyJ/0eWtl0juPgV4vx4Ffof/?=
 =?us-ascii?Q?ZZy+paVgYSCxBc/D3o+FJEM0Yw24SdV1proSBxvaK2QouajwUHs4WjFUsYs4?=
 =?us-ascii?Q?RgDOScbbDFAas9KZWmwjT/kA1bB8JJgmp+dsrdzzOfMjk0NKo8hrR6Elcqb4?=
 =?us-ascii?Q?ErOVfqNK5AjTGWk/By/BNPZvBRRjLMzfz7Tdpn/E0Rbs9S5D2govzhpqBkoF?=
 =?us-ascii?Q?rDu1eb2Qtl39GvH2M2poifA/+eqo2k9tpXrX+j13W+zCOMyqu7mBzJ1yldJD?=
 =?us-ascii?Q?yRrBXPhvAApDpBO5RhlF8yrYDwBx0MTstd9j2nND26ju9G0HHzakgdQ10JaW?=
 =?us-ascii?Q?oVnHPCE17TGWuPiePvniSqm6Wxr60pIANqnF3Po/xfoD7i1ScQX4ssiGjqTK?=
 =?us-ascii?Q?TI3diJHWUCuBljaz3H08zbTHXi6/jdW9CcCtb0+EdR6QHPuuPm7os1Q2gp15?=
 =?us-ascii?Q?aDd9NgSbtYZ9WdgoeZBQKmytox5F2+hSvH2rw0U6grvEN/wkWZ8utiIBQ6+S?=
 =?us-ascii?Q?dCbv2K3F/hFbRZs8a2upqkpnuC19V1Hb0TyYsvO9RS7zvrb10/hY1sCrgqwi?=
 =?us-ascii?Q?zKe5RJu8eM3AD9fklCSZyXbZ7D3egTqF4cX7rqZvG0KRKxj0zEMlAtX7dVJk?=
 =?us-ascii?Q?A738t4MBrIBUnHuaiNyme+ImziN9cZeNXJVpag4cZ4zlWsGi1lQM2JlC7R19?=
 =?us-ascii?Q?X40nk22hbCXpA0UXXZD033/o6imeSuEhRgKTSM0MsOcE4NY+bi7l4gXgLcMy?=
 =?us-ascii?Q?6fmvfqu1SfBsGCHWGJpInMPEiA9reggQimM5VlYXnMr1HqtLWpm5zu7zt8v+?=
 =?us-ascii?Q?LrTBkQeKq8BxWzr7PFQWGQTinIZJtPsiVH98NeFpyFkjM/AEf9d2jXmo+U2x?=
 =?us-ascii?Q?bfEm2xyILCagSSjfYRopBaTbhHsDOgmrvZuWVfGmXQXeh4d5L4mQVKdEnTgo?=
 =?us-ascii?Q?6UBMWYLU+CDm8eWQWRX5EzDkNhz3RUPMmY9e1PVXjgRUPvS6j+xXMchB20YZ?=
 =?us-ascii?Q?YCijyeB2ORV83F4Ca3T9NFlvbX2c98g24Ab9g6mypYsEMAg3XMn16OTpok2i?=
 =?us-ascii?Q?I/HQ0LDTt75KEEHNTriMikFof7ui3AltViXZUGpbAoAtmhA3xOHakUHWI6if?=
 =?us-ascii?Q?PLBgCTfgka5t35CgLLar7zLbTfKpB8JvBKEW1iEPKdAu3BiDq67n9R6qET03?=
 =?us-ascii?Q?T5sXqsMc1A7c/TjlQ4yp4VVbRIZKC2eojkFUOTrpPlqj6Acy/7iwMHRrBB4o?=
 =?us-ascii?Q?8vc+gxJg7i0NNsGDoo9j42qSsp9l?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 16:32:11.8485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71aa3aa4-1df0-4934-c161-08dcb63552db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8256

Added a sample of market, product and design requirements. This is to
help explain how we are writing the requirements and understand the
context of the first patch.
We will be sending these requirements for review in the subsequent
patches.

Please do not merge this patch.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1, v2 - No changes.

 .../reqs/design-reqs/arm64/emulated-uart.rst  | 240 ++++++++++++++++++
 .../reqs/design-reqs/arm64/generic-timer.rst  | 146 +++++++++++
 docs/fusa/reqs/design-reqs/xen-version.rst    | 207 +++++++++++++++
 docs/fusa/reqs/market-reqs/reqs.rst           |  77 ++++++
 docs/fusa/reqs/product-reqs/reqs.rst          |  64 +++++
 5 files changed, 734 insertions(+)
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/emulated-uart.rst
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
 create mode 100644 docs/fusa/reqs/design-reqs/xen-version.rst
 create mode 100644 docs/fusa/reqs/market-reqs/reqs.rst
 create mode 100644 docs/fusa/reqs/product-reqs/reqs.rst

diff --git a/docs/fusa/reqs/design-reqs/arm64/emulated-uart.rst b/docs/fusa/reqs/design-reqs/arm64/emulated-uart.rst
new file mode 100644
index 0000000000..483db92fa8
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/arm64/emulated-uart.rst
@@ -0,0 +1,240 @@
+UART
+====
+
+The following are the requirements related to SBSA UART [1] emulated and
+exposed by Xen to Arm64 domains.
+
+Probe the UART device tree node
+-------------------------------
+
+`XenSwdgn~arm64_uart_probe_dt_node~1`
+
+Description:
+Xen shall generate a device tree node for the SBSA UART (in accordance to Arm
+SBSA UART device tree binding [2]) to allow domains to probe it.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_uart~1`
+
+Transmit data in software polling mode
+--------------------------------------
+
+`XenSwdgn~arm64_uart_transmit_data_poll_mode~1`
+
+Description:
+Domain shall transmit data in polling mode (i.e. without involving interrupts).
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_uart~1`
+
+Transmit data in interrupt driven mode
+--------------------------------------
+
+`XenSwdgn~arm64_uart_transmit_data_irq_mode~1`
+
+Description:
+Domain shall transmit data in interrupt driven mode.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_uart~1`
+
+Receive data in software polling mode
+-------------------------------------
+
+`XenSwdgn~arm64_uart_receive_data_polling_mode~1`
+
+Description:
+Domain shall receive data in polling mode (i.e. without involving interrupts).
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_uart~1`
+
+Receive data in interrupt driven mode
+-------------------------------------
+
+`XenSwdgn~arm64_uart_receive_data_interrupt_driven_mode~1`
+
+Description:
+Domain shall receive data in interrupt driven mode.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_uart~1`
+
+Access UART data register
+-------------------------
+
+`XenSwdgn~arm64_uart_access_data_register~1`
+
+Description:
+Domain shall access (read/write) UART data register.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_uart~1`
+
+Access UART receive status register
+-----------------------------------
+
+`XenSwdgn~arm64_uart_access_receive_status_register~1`
+
+Description:
+Domain shall access (read/write) UART receive status register.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_uart~1`
+
+Access UART flag register
+-------------------------
+
+`XenSwdgn~arm64_uart_access_flag_register~1`
+
+Description:
+Domain shall access (read only) UART flag register.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_uart~1`
+
+Access UART mask set/clear register
+-----------------------------------
+
+`XenSwdgn~arm64_uart_access_mask_register~1`
+
+Description:
+Domain shall access (read/write) UART mask set/clear register.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_uart~1`
+
+Access UART raw interrupt status register
+-----------------------------------------
+
+`XenSwdgn~arm64_uart_access_raw_interrupt_status_register~1`
+
+Description:
+Domain shall access (read only) UART raw interrupt status register.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_uart~1`
+
+Access UART masked interrupt status register
+--------------------------------------------
+
+`XenSwdgn~arm64_uart_access_mask_irq_status_register~1`
+
+Description:
+Domain shall access (read only) UART masked interrupt status register.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_uart~1`
+
+Access UART interrupt clear register
+------------------------------------
+
+`XenSwdgn~arm64_uart_access_irq_clear_register~1`
+
+Description:
+Domain shall access (write only) UART interrupt clear register.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_uart~1`
+
+Receive UART TX interrupt
+-------------------------
+
+`XenSwdgn~arm64_uart_receive_tx_irq~1`
+
+Description:
+Domain shall receive UART TX interrupt
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_uart~1`
+
+Receive UART RX interrupt reception
+-----------------------------------
+
+`XenSwdgn~arm64_uart_receive_rx_irq~1`
+
+Description:
+Domain shall receive UART RX interrupt
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_uart~1`
+
+Initial State
+=============
+
+Access UART in an initial (reset) state
+---------------------------------------
+
+`XenSwdgn~arm64_uart_access_reset_state~1`
+
+Description:
+Domain shall be given the access to the UART in a state, where all registers
+hold the reset value according to the specification [3] (only for registers
+implemented as part of SBSA UART).
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_uart~1`
+
+| [1] Arm Base System Architecture, chapter B
+| [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/serial/arm_sbsa_uart.txt
+| [3] PrimeCell UART (PL011)
diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
new file mode 100644
index 0000000000..00228448a3
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
@@ -0,0 +1,146 @@
+Generic Timer
+=============
+
+The following are the requirements related to ARM Generic Timer [1] interface
+exposed by Xen to Arm64 domains.
+
+Probe the Generic Timer device tree node from a domain
+------------------------------------------------------
+
+`XenSwdgn~arm64_probe_generic_timer_dt~1`
+
+Description:
+Xen shall generate a device tree node for the Generic Timer (in accordance to
+ARM architected timer device tree binding [2]) to allow domains to probe it.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_timer~1`
+
+Read system counter frequency
+-----------------------------
+
+`XenSwdgn~arm64_read_system_counter_freq~1`
+
+Description:
+Domain shall read the frequency of the system counter (either via CNTFRQ_EL0
+register or "clock-frequency" device tree property if present).
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_timer~1`
+
+Access CNTKCTL_EL1 system register from a domain
+------------------------------------------------
+
+`XenSwdgn~arm64_access_cntkctl_el1_system_register~1`
+
+Description:
+Domain shall access the counter-timer kernel control register to allow
+controlling the access to the timer from userspace (EL0).
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_timer~1`
+
+Access virtual timer from a domain
+----------------------------------
+
+`XenSwdgn~arm64_access_virtual_timer~1`
+
+Description:
+Domain shall access and make use of the virtual timer by accessing the following
+system registers:
+CNTVCT_EL0,
+CNTV_CTL_EL0,
+CNTV_CVAL_EL0,
+CNTV_TVAL_EL0.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_timer~1`
+
+Access physical timer from a domain
+-----------------------------------
+
+`XenSwdgn~arm64_access_physical_timer~1`
+
+Description:
+Domain shall access and make use of the physical timer by accessing the
+following system registers:
+CNTPCT_EL0,
+CNTP_CTL_EL0,
+CNTP_CVAL_EL0,
+CNTP_TVAL_EL0.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_timer~1`
+
+Trigger the virtual timer interrupt from a domain
+-------------------------------------------------
+
+`XenSwdgn~arm64_trigger_virtual_timer_interrupt~1`
+
+Description:
+Domain shall program the virtual timer to generate the interrupt when the
+asserted condition is met.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_timer~1`
+
+Trigger the physical timer interrupt from a domain
+--------------------------------------------------
+
+`XenSwdgn~arm64_trigger_physical_timer_interrupt~1`
+
+Description:
+Domain shall program the physical timer to generate the interrupt when the
+asserted condition is met.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_timer~1`
+
+Assumption of Use on the Firmware
+=================================
+
+Expose system timer frequency
+-----------------------------
+
+`XenSwdgn~arm64_program_cntfrq_el0_or_dt_prop_system_timer_freq~1`
+
+Description:
+Underlying firmware shall program CNTFRQ_EL0 with the system timer frequency.
+As an alternative, "clock-frequency" dt property (in the host device tree) can
+also be used to specify the system timer frequency. This helps in case of buggy
+firmware when CNTFRQ_EL0 is programmed incorrectly or not programmed at all.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_timer~1`
diff --git a/docs/fusa/reqs/design-reqs/xen-version.rst b/docs/fusa/reqs/design-reqs/xen-version.rst
new file mode 100644
index 0000000000..c5c58bb2df
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/xen-version.rst
@@ -0,0 +1,207 @@
+Hypercall xen_version
+=====================
+
+The following are the requirements related to __HYPERVISOR_xen_version hypercall
+[1] exposed by Xen to Arm64 and AMD64 PVH domains.
+
+Access hypercall __HYPERVISOR_xen_version for getting xen version
+-----------------------------------------------------------------
+
+`XenSwdgn~access_hyp_xen_version_read_ver~1`
+
+Description:
+Domain shall access __HYPERVISOR_xen_version passing XENVER_version
+as a command.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hypercall~1`
+
+Validate the xen version returned by the XENVER_version command
+---------------------------------------------------------------
+
+`XenSwdgn~validate_version_hyp_xen_version~1`
+
+Description:
+The xen version returned should correspond to 4.18.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hypercall~1`
+
+Access hypercall __HYPERVISOR_xen_version for getting xen extraversion
+----------------------------------------------------------------------
+
+`XenSwdgn~access_hyp_xen_version_get_extraversion~1`
+
+Description:
+Domain shall access __HYPERVISOR_xen_version passing XENVER_extraversion as a
+command.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hypercall~1`
+
+Access hypercall __HYPERVISOR_xen_version for getting compile information
+-------------------------------------------------------------------------
+
+`XenSwdgn~access_hyp_xen_version_get_compile_info~1`
+
+Description:
+Domain shall access __HYPERVISOR_xen_version passing XENVER_compile_info as a
+command.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hypercall~1`
+
+Access hypercall __HYPERVISOR_xen_version for getting capabilities
+------------------------------------------------------------------
+
+`XenSwdgn~access_hyp_xen_version_get_capabilities~1`
+
+Description:
+Domain shall access __HYPERVISOR_xen_version passing XENVER_capabilities as a
+command.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hypercall~1`
+
+Validate the capabilities returned by XENVER_capabilities command
+-----------------------------------------------------------------
+
+`XenSwdgn~validate_cap_return_xenver_capabilities~1`
+
+Description:
+For Arm64, the capabilities returned should be xen-*-aarch64 string.
+For AMD64 PVH, the capabilities returned should be hvm-*-x86_64 string.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hypercall~1`
+
+Access hypercall __HYPERVISOR_xen_version for getting changeset
+---------------------------------------------------------------
+
+`XenSwdgn~access_hyp_xen_version_get_changeset~1`
+
+Description:
+Domain shall access __HYPERVISOR_xen_version passing XENVER_changeset
+as a command.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hypercall~1`
+
+Access hypercall __HYPERVISOR_xen_version for getting features
+--------------------------------------------------------------
+
+`XenSwdgn~access_hyp_xen_version_get_features~1`
+
+Description:
+Domain shall access __HYPERVISOR_xen_version passing XENVER_get_features as a
+command.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hypercall~1`
+
+Check supported features returned by the XENVER_get_features command when the submap index passed is 0
+------------------------------------------------------------------------------------------------------
+
+`XenSwdgn~check_supported_features_xenver_get_features~1`
+
+Description:
+For Arm64, the bit position corresponding to the supported features should be 1.
+Examples of Arm64 supported features:
+
+ * XENFEAT_ARM_SMCCC_supported
+
+For AMD64 PVH, the bit positions corresponding to the supported features should
+be 1.
+Examples of AMD64 PVH supported features:
+
+ * XENFEAT_memory_op_vnode_supported
+ * XENFEAT_vcpu_time_phys_area
+ * XENFEAT_runstate_phys_area
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hypercall~1`
+
+Access hypercall __HYPERVISOR_xen_version for getting guest handle
+------------------------------------------------------------------
+
+`XenSwdgn~access_hyp_xen_version_get_guest_handle~1`
+
+Description:
+Domain shall access __HYPERVISOR_xen_version passing XENVER_guest_handle as a
+command.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hypercall~1`
+
+Access hypercall __HYPERVISOR_xen_version for getting xen pagesize
+------------------------------------------------------------------
+
+`XenSwdgn~access_hyp_xen_version_get_xen_pagesize~1`
+
+Description:
+Domain shall access __HYPERVISOR_xen_version passing XENVER_pagesize
+as a command and NULL as the guest handle.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hypercall~1`
+
+Validate the page size returned by XENVER_pagesize command
+----------------------------------------------------------
+
+`XenSwdgn~validate_page_size_xenver_pagesize_cmd~1`
+
+Description:
+The returned page size should be 4KB.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hypercall~1`
+
+| [1] https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/version.h;hb=HEAD
diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
new file mode 100644
index 0000000000..a3f84cd503
--- /dev/null
+++ b/docs/fusa/reqs/market-reqs/reqs.rst
@@ -0,0 +1,77 @@
+Functional Requirements
+=======================
+
+Run Arm64 VMs
+-------------
+
+`XenMkt~run_arm64_vms~1`
+
+Description:
+Xen shall run Arm64 VMs.
+
+Rationale:
+
+Comments:
+
+Needs:
+ - XenProd
+
+Run AMD-x86 VMs
+---------------
+
+`XenMkt~run_x86_vms~1`
+
+Description:
+Xen shall run AMD-x86 VMs.
+
+Rationale:
+
+Comments:
+
+Needs:
+ - XenProd
+
+Support non paravirtualised VMs
+-------------------------------
+
+`XenMkt~non_pv_vms_support~1`
+
+Description:
+Xen shall support running guests which are not virtualisation aware.
+
+Rationale:
+
+Comments:
+
+Needs:
+ - XenProd
+
+Provide console to the VMs
+--------------------------
+
+`XenMkt~provide_console_vms~1`
+
+Description:
+Xen shall provide a console to a VM.
+
+Rationale:
+
+Comments:
+
+Needs:
+ - XenProd
+
+Provide timer to the VMs
+------------------------
+
+`XenMkt~provide_timer_vms~1`
+
+Description:
+Xen shall provide a timer to a VM.
+
+Rationale:
+
+Comments:
+
+Needs:
+ - XenProd
diff --git a/docs/fusa/reqs/product-reqs/reqs.rst b/docs/fusa/reqs/product-reqs/reqs.rst
new file mode 100644
index 0000000000..9954b7532a
--- /dev/null
+++ b/docs/fusa/reqs/product-reqs/reqs.rst
@@ -0,0 +1,64 @@
+Domain Creation And Runtime
+===========================
+
+Emulated UART
+-------------
+
+`XenProd~emulated_uart~1`
+
+Description:
+Xen shall emulate Arm SBSA UART on behalf of the domains.
+
+Rationale:
+
+Comments:
+The domains can use it to write/read to/from the console.
+
+Covers:
+ - `XenMkt~run_arm64_vms~1`
+ - `XenMkt~non_pv_vms_support~1`
+ - `XenMkt~provide_console_vms~1`
+
+Needs:
+ - XenSwdgn
+
+Emulated Timer
+--------------
+
+`XenProd~emulated_timer~1`
+
+Description:
+Xen shall emulate Arm Generic Timer timer on behalf of domains.
+
+Rationale:
+
+Comments:
+The domains can use it for e.g. scheduling.
+
+Covers:
+ - `XenMkt~run_arm64_vms~1`
+ - `XenMkt~non_pv_vms_support~1`
+ - `XenMkt~provide_timer_vms~1`
+
+Needs:
+ - XenSwdgn
+
+Version Hypercall
+-----------------
+
+`XenProd~version_hypercall~1`
+
+Description:
+Xen shall provide an interface to expose Xen version, type and compile
+information.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_vms~1`
+ - `XenMkt~run_x86_vms~1`
+
+Needs:
+ - XenSwdgn
-- 
2.25.1


