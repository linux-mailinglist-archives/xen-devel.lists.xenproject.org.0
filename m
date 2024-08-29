Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AAC9646AD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 15:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785891.1195415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjfHG-0006Qa-7r; Thu, 29 Aug 2024 13:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785891.1195415; Thu, 29 Aug 2024 13:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjfHG-0006Ow-40; Thu, 29 Aug 2024 13:33:30 +0000
Received: by outflank-mailman (input) for mailman id 785891;
 Thu, 29 Aug 2024 13:33:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0cO=P4=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sjfHE-0006Oq-BQ
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 13:33:28 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f403:200a::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43e6a596-660b-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 15:33:25 +0200 (CEST)
Received: from DM6PR02CA0118.namprd02.prod.outlook.com (2603:10b6:5:1b4::20)
 by PH8PR12MB6963.namprd12.prod.outlook.com (2603:10b6:510:1be::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 13:33:20 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:5:1b4:cafe::48) by DM6PR02CA0118.outlook.office365.com
 (2603:10b6:5:1b4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28 via Frontend
 Transport; Thu, 29 Aug 2024 13:33:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 13:33:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 08:33:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 08:33:18 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 29 Aug 2024 08:33:17 -0500
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
X-Inumbo-ID: 43e6a596-660b-11ef-99a0-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbHhYZUgmF59EEYVYZHH3YiGocPEAE7lnF9NhBxmHsguzW0Ok83IajRXAEdUqwf3IcymypusrIpYvelj1ib0w0JooVWkmqJiGsihTbrTmDhOnHX31LXwlJhqpcFTHm2T10Vzcubtafo4ELSBYq3pJUp/OFNLjiJRa7NUeywPMinSdYyDZeS7QNFn5zLpJqgKq+qg3spOhpiNMTg6ZM4U1SbUtYCjseSNJi3xFptnQmsyokOHBjEfQfdGIWD/1TjwmHN0/6OXe4aKTvd0TaImuWswgSV0amNSzV7kEsSlQ0eb3xajSg+sUWIBUfWGIgTF1Nku0ea+ei+tmiQCdhx/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mt926UbtbaScBSxfteAtZruswq8iCIhAVzKnK055V28=;
 b=Ivdcth/oW+bJfPSlJBWacjUI1jGJ2quHm7Zb/NVAgcb9vzi/qIGiIHEi2KbTfH6aRmh+5UV64dujQaZJjy/d9nIfkXpPsoLwGbYmB6Ba5T9MXvhcr37qcMyBUvWWsVyPUxNruFpW5YoOzWMzCwLuHVBX5zne1M+5r23FTDxdNrrDvz7+Klhs2EBKUm+E5kUwrWE9dAXSl4pyubh03J6ASIlepyZSgBq3QqItlCTiGozNAV6Q6a2DjPL5FtsWp+BQjNJqRODeFs+y6rofVtXCcu2nGOsbrvg/OcH7fkEsvAH3FYoZaC8ldQ4mGrZOiRyJrrX2uhaOSpIyVtryde75xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mt926UbtbaScBSxfteAtZruswq8iCIhAVzKnK055V28=;
 b=C1kZCk6DJJi/Ff3MRrcKtFMLkG2blZZFmzTsJ3W3OqiR5NmiY/nFrRSaFQ8d16an6eGB4hrCFYhCfLIrAjLCBRR0BLkrex+UI7vJWXKcqFSi5mMbPdxCwhzQ2VhpNMdYckCAa0nwN30Cajfka9e7VY4yEcK8T2qyyk9OxHS2yVI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>, Hisao Munakata <hisao.munakata.vt@renesas.com>
Subject: [PATCH] docs: fusa: Add requirements for emulated uart
Date: Thu, 29 Aug 2024 14:33:14 +0100
Message-ID: <20240829133314.4042845-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|PH8PR12MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c9984a1-5cfc-4397-836d-08dcc82f259f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TvP7DX5ZuyKAXrUw6NxCoVN7wqB7vDoydHkqCn5gT697SYCKhrhNYaO6jRlj?=
 =?us-ascii?Q?ET+lM1J/vHi9+VDajMDK6Oj2LRxnxFFY9WoZFqHu/eWsaCwHnCC/EymXqJO0?=
 =?us-ascii?Q?uF2gCdKGmoRrvjic77B1GHJGLErHuWOH902xvKF0OqhCHWqOoExChmsMjWD8?=
 =?us-ascii?Q?9T1tXD5YYC/xIhX6JAR0hhJ8Hc6zaFgQjKzoki8nfxIXh6gKP2WZXvOoxuz5?=
 =?us-ascii?Q?2jZrz4EvEhC+BvZiLZr0C7DznIQeRIzkCKqCgO13WG9XwaFOQN9nQKLxpc7i?=
 =?us-ascii?Q?U9JjN8LJu44sbY8nJtMV6TKkAZmVKj5wJIDloRozo5XMYEyTLBW5jpv5r+9Q?=
 =?us-ascii?Q?N/LLWpWQJO5/N1bJDieV3RIJPMWeS8yDdtJRAkz9373BWha12k2yit4LhQde?=
 =?us-ascii?Q?1rXpUILSJnEqzBxQC4iIMFp7+nDFkAPmbx71AA1Sw9rhJnI88XQm6VQrAIES?=
 =?us-ascii?Q?CzIll3nj9G0XHAYwUQ+3f2yb+bf3CS1LpMENu6dBUB07Sjl89O6MurgsAiGu?=
 =?us-ascii?Q?th/3pxHVjLHVzr0MTW2tQrogmmDicXjhY2Oe0T98c7iTWUqSOl3QCBMiUDQ9?=
 =?us-ascii?Q?LsaL4JGxEIcj3oRY97L5ACPCrL6h3bDocesUtDtFTEwYRfY9tZSpQXRky2KT?=
 =?us-ascii?Q?mQoQH69k5g4bwNFzY5QFtMmLwLegb16JyWLSWEF1Vpd7TBr57AZUz/pp6JOw?=
 =?us-ascii?Q?8e5XRo+h1Un6tg+ZSQxLSzrWYhi1hOrKcIT0t91Wl9DA7MPhMli6/d84c9pA?=
 =?us-ascii?Q?siLTKzLHPreGIr6Mm/A5Kkkp35VXmYaLIHaTkWfGBzCJ7XcZgBmBjveI/AZr?=
 =?us-ascii?Q?HI7RL6aUijgF47kCztrVFzz7NbkMB/rsv/jENxJr4IlguBDpBb0/9Eht1J+F?=
 =?us-ascii?Q?dELr5cpdzQLGekFMpT+11hlJqBvB38+gC8TmoSH3ILKsuxwfbYg/glPntN3O?=
 =?us-ascii?Q?DtOl57IbUke6MxsjdU8/cjLDy8zXJRr/33Af6gqqwVzLh8lYZZVE+p3ROPiX?=
 =?us-ascii?Q?ULg3M74DBLylR3AJsrAf9zDBEFVa7Zz313LzINtGO0oHgd7NbCDgaCqPdsmj?=
 =?us-ascii?Q?8uX78PPU/0H45OUTY786ShQuQc3qqr6Ez1nGCqgL3ksiDhhQeEaE8sOjvFyf?=
 =?us-ascii?Q?cMU1xUjswkf6Vnm6qYduga6OW6yUdBoU6wrLcuEIOhGnV18s/6Hy4NDDieU3?=
 =?us-ascii?Q?rrP10kuVrfpSD/rV0I2LzkaxJeetuVZyQTuu98LuzjnAeAoAirVc+3kKjSmq?=
 =?us-ascii?Q?AKYrBe2yJ5SlfX//tMOU3Ucm5jAJrguWjJ+Cz2vdjgohsRhHtvJgqjZ0jOA+?=
 =?us-ascii?Q?MO9VbclBG6b4L2AsqeqV/vI5po7mXi97WuZCmR7qEYOHHPJegsgMQbzALJpZ?=
 =?us-ascii?Q?ushNy/eda3L3bzoHsuDHPl5hpOg+DPMx3jiC2Vkw5wBfMKd9YmCGE82uVSH4?=
 =?us-ascii?Q?K8EdcdoFiStFeCbNy8EkZNj0DnR6+qG7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 13:33:19.6715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9984a1-5cfc-4397-836d-08dcc82f259f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6963

From: Michal Orzel <michal.orzel@amd.com>

Add the requirements for emulated SBSA UART.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 .../fusa/reqs/design-reqs/arm64/sbsa-uart.rst | 224 ++++++++++++++++++
 docs/fusa/reqs/market-reqs/reqs.rst           |  31 +++
 docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  21 ++
 3 files changed, 276 insertions(+)
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst

diff --git a/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst b/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst
new file mode 100644
index 0000000000..aac3facce6
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
+Xen shall enable transmission of data in polling mode for domains.
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
+Xen shall enable transmission of data in interrupt driven mode for domains.
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
+Xen shall enable reception of data in polling mode for domains.
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
+Xen shall enable reception of data in interrupt driven mode for domains.
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
+Xen shall expose the UARTDR register to the domains.
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
+Xen shall expose the UARTRSR register to the domains.
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
+Xen shall expose the UARTFR register to the domains.
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
+Xen shall expose the UARTIMSC register to the domains.
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
+Xen shall expose the UARTRIS register to the domains.
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
+Xen shall expose the UARTMIS register to the domains.
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
+Xen shall expose the UARTICR register to the domains.
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
+Xen shall generate UART TX interrupt when the UART transmit interrupt condition
+is met. 
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
+Xen shall generate UART RX interrupt when the UART receive interrupt condition
+is met.
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
index 9c98c84a9a..b69699e5fb 100644
--- a/docs/fusa/reqs/market-reqs/reqs.rst
+++ b/docs/fusa/reqs/market-reqs/reqs.rst
@@ -15,6 +15,22 @@ Rationale:
 
 Comments:
 
+Needs:
+ - XenProd
+
+Run virtualization unaware VMs
+------------------------------
+
+`XenMkt~run_virtualization_unaware_vms~1`
+
+Description:
+Xen shall run VMs which haven't been modified for Xen.
+
+Rationale:
+Any kernel/RTOS can run as a VM on top of Xen.
+
+Comments:
+
 Needs:
  - XenProd
 
@@ -32,3 +48,18 @@ Comments:
 
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
index 7aa3eeab6a..e90f275148 100644
--- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
+++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
@@ -17,7 +17,28 @@ Comments:
 
 Covers:
  - `XenMkt~run_arm64_vms~1`
+ - `XenMkt~run_virtualization_unaware_vms~1`
  - `XenMkt~provide_timer_vms~1`
 
 Needs:
  - XenSwdgn
+
+Emulated UART
+-------------
+
+`XenProd~emulated_uart~1`
+
+Description:
+Xen shall grant access to "Arm SBSA UART" for the domains.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_vms~1`
+ - `XenMkt~run_virtualization_unaware_vms~1`
+ - `XenMkt~provide_console_vms~1`
+
+Needs:
+ - XenSwdgn
\ No newline at end of file
-- 
2.25.1


