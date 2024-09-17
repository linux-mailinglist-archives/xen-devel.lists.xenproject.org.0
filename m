Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E0F97B0A5
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 15:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799964.1209907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqY1y-00052A-Kl; Tue, 17 Sep 2024 13:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799964.1209907; Tue, 17 Sep 2024 13:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqY1y-0004zy-Hh; Tue, 17 Sep 2024 13:14:10 +0000
Received: by outflank-mailman (input) for mailman id 799964;
 Tue, 17 Sep 2024 13:14:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hZbj=QP=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sqY1w-0004zs-UU
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2024 13:14:09 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2415::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5ab3b20-74f6-11ef-a0b7-8be0dac302b0;
 Tue, 17 Sep 2024 15:14:04 +0200 (CEST)
Received: from BN0PR04CA0189.namprd04.prod.outlook.com (2603:10b6:408:e9::14)
 by DM6PR12MB4467.namprd12.prod.outlook.com (2603:10b6:5:2a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 13:13:53 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:e9:cafe::48) by BN0PR04CA0189.outlook.office365.com
 (2603:10b6:408:e9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Tue, 17 Sep 2024 13:13:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 17 Sep 2024 13:13:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Sep
 2024 08:13:50 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 17 Sep 2024 08:13:49 -0500
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
X-Inumbo-ID: b5ab3b20-74f6-11ef-a0b7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuVs0ywyjQfwUJG7/ACaK1CxYki2Vv0SWS2rVfyqVY3qcMcXG/+E1Hs56ccg4MNyMwESttxDXsTaNJb9KzeB0O4ODFdzJybp1Gh4xdt/HnyMTeI2sR4gupMcrKKQ10lnE8bYvRt7yDy/B96CUw9xaA3jZgafG3JUZ1xqkwILZYbfo43B4qd1xu0CiX+zoLtp+/BfUmf57Ljb5KrRiB4tCxVRCTJzaAhZYZAR5yzEr6tFOBqjif2Xvbk1FfcCf3oyvyeyJNY+IsRZsKgwOGEPU+8WJEaX1eUDUYy+yx+ydvKcRPmi9K7WCikYP9010/i2dMEKjzu0nZDGVCn5kY3NDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBzrrazgE6gkYzdua8Lz+AyTjWaagKRmR5USh26NSyk=;
 b=FTKIfFn3M6IxcNe36p17uT99fSBkHnHeQEtsGbHyTGjcgwpCUUw0SwFDsAuBVieB1V75qSPfoivR77ljiv186ZxI7TwNSFCsXHhFJR7zbQMrwexPMrBap0vX6PxdX1Yw+AGGu0h7YD1ZylYvBwzz0EMvVRy4pQSiG6WkXhb2Xb1Nj0I0XrkoTgIAmSK3GiYTbYJftBczmdqdH0AymTmyB4jQr/qmz2Ue/mV2YnCcp7wKAVifGnt+fhxxO5PLkaXQvsW6KGEHj4xG2hUcl+PCL3wrzq3qEXvfES+la60ZsZWPB/RbhoiQu3ugk/AcdKa/xhH8BLV1j523VPBx/bzMfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBzrrazgE6gkYzdua8Lz+AyTjWaagKRmR5USh26NSyk=;
 b=W99Ea9l+ekMaF1l/U+j6nVgtJnZHSzb7TITeNUyV7lchoVizdcRy54XRYr/hatEeG8gml2oxHXneFl8Abu5IHQ8Yio6jO4ND6bwElC7tWUjPVsjV33ortdzliSReIvIeA8efQzZ4+oO9Mu7WPjaZAfOZeNda0IsLzCNgj/CtF0I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>, Hisao Munakata <hisao.munakata.vt@renesas.com>
Subject: [PATCH v2] docs: fusa: Add requirements for emulated uart
Date: Tue, 17 Sep 2024 14:13:36 +0100
Message-ID: <20240917131336.3783112-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|DM6PR12MB4467:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e94b0d-098a-44da-923d-08dcd71a931e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f1jsttp2lxW0/KvmOcLZd4SM6Drw19l8Nevamks7rqh0dkJHFVWH0FeGXIqk?=
 =?us-ascii?Q?coLZZOM28dfHtEgth2PvJVA/M780K/nxT4+hjCT6OT0vgB35TlaMr36jyW6w?=
 =?us-ascii?Q?qFya6nKfxVB3OD5pTrLIKKdYdRhXWfyKGYCuHA4bLub5t5WlRU2hYudvi4jn?=
 =?us-ascii?Q?3Q44wNPIuIY/+rmHIWo6MBRug1rwzTOLXf5f0xJ/DUbGENCTsjIO0UJ8UOE+?=
 =?us-ascii?Q?fFuQNxEujVgqhOqhfJYMtH/VPdqsc/q63uf6jHl22AGBOTUTSxkTPLa9ySC4?=
 =?us-ascii?Q?CsFvzhozerVhtmRH7+WJtf8cESisbE3Uicv1iAjhzidM5hDyWi69nrur/nYm?=
 =?us-ascii?Q?fu4RTK9rrixB91DK6EL8OFAGmqvzYNZIMo8/Gd3htByZGTQ+N9gr36Ef043M?=
 =?us-ascii?Q?zwJM8b47lP5o49W5EgGSjlFn0rGPWYnZa9iQ+gBY0uDNAuOGnRNLhEoThHbg?=
 =?us-ascii?Q?vEU1CJD+JnykNM05uSyUa0HB60m87lYCppDI5/9PSWuyoTcMc9JByFrizOik?=
 =?us-ascii?Q?37nfF1/kC1wUMjB4oV985Kx1yCuPX7Iuqy0aFe4cxjzCwPWlWTPDWoS3+wwH?=
 =?us-ascii?Q?PqlWBRXmHC9RluYnxjsEiP/hPCqhZr/u5JTD3hOUKGbnh14hx2r4iHijUyJo?=
 =?us-ascii?Q?vPeUY2St9mjS5732Yyee39AjKAfYRT2aAeJWcM/dWPxK93G6UaOJCjA512IC?=
 =?us-ascii?Q?+vBrDPWCvPIDWQBzAJAzHjN8eLVLoSreVqcwqy1/XAulCZB2Jv518rHFdM4H?=
 =?us-ascii?Q?1HYgrSKWCsxIb+HusO7nICBto+pfFC9CRkTQi7NDc86DQTSrS7hpzKa6yqxI?=
 =?us-ascii?Q?Uzs2OSrowuMJR1jvSdUtPhJNI26rdYXpJpctNifzxAVA8GpetfuVChBTiT79?=
 =?us-ascii?Q?gg3yGp08o/vq6p7TKBZtcYoP2d2AZPDaQJnSXz6MWlcBksa7dJiEYVhCeOmN?=
 =?us-ascii?Q?IdjmVdLf51ZTFvROUQCTDOwNRNU59kVCydf9ktc77uFHyGZJ9ejtH4wZeYu4?=
 =?us-ascii?Q?Ia3ls4PWdQ91+OdgUlPm8pddT4K78oHdQkhWTyalEsFHTh/xSYXP4ztaok8o?=
 =?us-ascii?Q?LlTpIBgZbjdOg0KEYQi5067qdS3kGzvaKQmtIR//wMFtgGwZ/ga0GmVahgmG?=
 =?us-ascii?Q?1SEBGp5yRRer4O6wbFMDeCIOyM1w1JFLTUhoBOy7LCYEdLtv3HXtXNmmjhJQ?=
 =?us-ascii?Q?ZkgJu9AmtThnAtggQJmSRXjDSNCY/tHWGQpiimztEKld21TtLOKiuUUXB8jv?=
 =?us-ascii?Q?DgZClqCuTKe2cNQA4BtRaPAEXotPRMF+2GGdjau29+AMvf1PKbEMSkFRVl5k?=
 =?us-ascii?Q?RokiAqrGoChr+upvnIVEu2EDEg+XtLy81vJjuZYs8uWjKbuOpRPocJ8fzF3u?=
 =?us-ascii?Q?xRR+frl+HLGjGYOxr2m7dNQjy9otVCZC5H2YUWiuBGYOozxKpO7tbwuT8Aaj?=
 =?us-ascii?Q?vqAHKidyCeqgso/CbVVJO8PJOnvYj6CG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 13:13:51.4643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e94b0d-098a-44da-923d-08dcd71a931e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4467

From: Michal Orzel <michal.orzel@amd.com>

Add the requirements for emulated SBSA UART.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. Reworded the requirements to remove any ambiguity.
2. Dopped the "virtualization unaware VMs" requirement as it is not easy to
define "virtualization unaware".

 .../fusa/reqs/design-reqs/arm64/sbsa-uart.rst | 224 ++++++++++++++++++
 docs/fusa/reqs/market-reqs/reqs.rst           |  15 ++
 docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  19 ++
 3 files changed, 258 insertions(+)
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst

diff --git a/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst b/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst
new file mode 100644
index 0000000000..89598fa8a5
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst
@@ -0,0 +1,224 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+SBSA UART
+=========
+
+The following are the requirements related to SBSA UART [1] emulated and
+exposed by Xen to Arm64 domains.
+
+Probe the UART device tree node from a domain
+---------------------------------------------
+
+`XenSwdgn~arm64_uart_probe_dt~1`
+
+Description:
+Xen shall generate a device tree node for the SBSA UART (in accordance to Arm
+SBSA UART device tree binding [2]) in the domain device tree.
+
+Rationale:
+
+Comments:
+Domains can detect the presence of the SBSA UART device tree node.
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
+Xen shall support transmission of data in polling mode.
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
+`XenSwdgn~arm64_uart_transmit_data_interrupt_mode~1`
+
+Description:
+Xen shall support transmission of data in interrupt driven mode.
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
+Xen shall support reception of data in polling mode.
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
+`XenSwdgn~arm64_uart_receive_data_interrupt_mode~1`
+
+Description:
+Xen shall support reception of data in interrupt driven mode.
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
+Xen shall emulate the UARTDR register.
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
+Xen shall emulate the UARTRSR register.
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
+Xen shall emulate the UARTFR register.
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
+Xen shall emulate the UARTIMSC register.
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
+Xen shall emulate the UARTRIS register.
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
+Xen shall emulate the UARTMIS register.
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
+Xen shall emulate the UARTICR register.
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
+Xen shall generate UART interrupt when the UART transmit interrupt condition is
+met.
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
+Xen shall generate UART interrupt when the UART receive interrupt condition is
+met.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_uart~1`
+
+[1] Arm Base System Architecture, chapter B
+[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/serial/arm_sbsa_uart.txt
\ No newline at end of file
diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
index 9c98c84a9a..e98f348cf4 100644
--- a/docs/fusa/reqs/market-reqs/reqs.rst
+++ b/docs/fusa/reqs/market-reqs/reqs.rst
@@ -32,3 +32,18 @@ Comments:
 
 Needs:
  - XenProd
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
\ No newline at end of file
diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
index 7aa3eeab6a..97e90813ec 100644
--- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
+++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
@@ -21,3 +21,22 @@ Covers:
 
 Needs:
  - XenSwdgn
+
+Emulated UART
+-------------
+
+`XenProd~emulated_uart~1`
+
+Description:
+Xen shall provide an "Arm SBSA UART" compliant device to the domains.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_vms~1`
+ - `XenMkt~provide_console_vms~1`
+
+Needs:
+ - XenSwdgn
\ No newline at end of file
-- 
2.25.1


