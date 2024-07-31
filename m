Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18941943437
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 18:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768991.1179914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZCJo-0002br-OK; Wed, 31 Jul 2024 16:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768991.1179914; Wed, 31 Jul 2024 16:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZCJo-0002ZF-KL; Wed, 31 Jul 2024 16:36:52 +0000
Received: by outflank-mailman (input) for mailman id 768991;
 Wed, 31 Jul 2024 16:36:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HDmI=O7=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sZCJm-0001qR-V8
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 16:36:51 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 150f12a4-4f5b-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 18:36:49 +0200 (CEST)
Received: from SA9P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::23)
 by SN7PR12MB8103.namprd12.prod.outlook.com (2603:10b6:806:355::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 16:36:45 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:806:26:cafe::a2) by SA9P223CA0018.outlook.office365.com
 (2603:10b6:806:26::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.35 via Frontend
 Transport; Wed, 31 Jul 2024 16:36:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 16:36:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 31 Jul
 2024 11:36:43 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 31 Jul 2024 11:36:42 -0500
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
X-Inumbo-ID: 150f12a4-4f5b-11ef-bc01-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqyquOu/LGLT1qOOi9KmBSKD8OP+zPLS9CMvXfX98yo2v6OTIpPqZT8oqYxEj/5cgi6ibGueO+O3NUvwanKvCuyB/+sBToRMMw6vzb2PAGyZfOMX31/hGfKy8hhys5d8jiHp30A2rKAxgPdLGsjPWJXypnWNWCwLkQPq3j/qxPMe7UF0cfnx5CnCPMGyFjNJQ5gTlB7M+9QW+C2fT0PLBVlZ1kx74FbywwOZkAJfS6VA8D/ZKD715469CFkR8JmBAixwxYODKrDGtGGkQYjnVI7hDuZMxgoQtDqCK6EajlKRVN8vByIbgPMz0uNMqJnSRa/dIjDLtHaJ2RmuFZxY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBXgRjh5xjfF1yHaJmzjGnCzrgVZE3+PjGkwDH+2Dl4=;
 b=w93eKxLsIdqjc5BtnXHRcHgo+qzWo2Co1HxuhuMPjZCTJoVXfRhVChwSZMMASOK8fb+wENiKNyqQTIS0yBaYvSRvs1DW6MeMjR0fJ+hCqqEdWsIjCoA6aYFDMC4cMoKrhIJUlny8k/Mb/4Vu1OO7HQ6LKGZHFu+KqS3qvCAYZ8SssQcZJ6QOJGMG9gQPF8RrCIJm+1JRqUL/RiafQvfYmbiBQTE9w9oFfZBr0J4+ENo/vC4SrpPwKKBetRN7NhIpScplF9Ix4o1jkVmlUTlwPcevKOgJVUCg6jmAiNJKe0lW+e9Rxw+rLJvfTxOMPveETDbnTqi8rq2R0pngV5Zrsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBXgRjh5xjfF1yHaJmzjGnCzrgVZE3+PjGkwDH+2Dl4=;
 b=CTWTmMxfJAGDe3iFCSaV/68BF4oRh0KzFPc5rt3CWKCaktaVlvupnJa7ygjyUdf3w6jihN66FkaMuMSFY+TNXenHihBQfCBTXxrEhNWLbF0oEh62D16NWcbrtWmDCzZmeOCxPOyFaJJGj4ttf0KCZTukrEh3uFUhKKA+JKeAuZQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <ayan.kumar.halder@amd.com>,
	<artem_mygaiev@epam.com>, <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH 2/2] docs: fusa : reqs: Added a sample of requirements [DO_NOT_MERGE]
Date: Wed, 31 Jul 2024 17:36:14 +0100
Message-ID: <20240731163614.616162-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240731163614.616162-1-ayan.kumar.halder@amd.com>
References: <20240731163614.616162-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|SN7PR12MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: ec1766cf-156e-4fde-e843-08dcb17ef6f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ODm7aVhC/tFpzc5B12fuWIQrAUmD3AmK+26dqo2sDfZm0nEG2nNQnBrejuKc?=
 =?us-ascii?Q?3zEgupH+zZ2ZkDpcyoJGFE3Is9RqIJjwz0ugA+xOiRT8aVMQPadJh2fhS4ZQ?=
 =?us-ascii?Q?xwwq8y5L1MtxeKpkhHbLiVxlugzIp+4C5Y5wQOewzQjV7GP7lJ9kUAXEf3At?=
 =?us-ascii?Q?IEV3pqvE/cxRY+HQN627n9B51Tt9K4xyt30Q5zwLWXLKZsnPBOUJOrc4RXs6?=
 =?us-ascii?Q?UBdG9+Nn9zZrvRwNviISPMxnXZdSvaeP+uv5ipm/VFhY6tM+uIke2N9SVW0X?=
 =?us-ascii?Q?6Mr1QGQz0YjXh9hvOKkRZORJnEFKwPpGrRojpsvVqusXvPpqUDgD4TrSMJAl?=
 =?us-ascii?Q?R5j+ydttRBqyxvvRgXqzi1IYIM7c0Olfzi/YAd8B9dkzZPtIwrP0QV+geSAf?=
 =?us-ascii?Q?WDl2h+34bDXVWy0D+raqsddev53UxZMScwIk3R993LjcpJQip8p1aRwl9HaA?=
 =?us-ascii?Q?FllqcamtGIr+us2drT9QMjT3CyXacVonSgnL7fvQe7jLCoEdimdXLxZGclms?=
 =?us-ascii?Q?tPNDCrN7v5mU78by5+HW4g+T+anYdN1hgo4aJs/MesK6ZLS25DNKRk5sKFF1?=
 =?us-ascii?Q?PEyu9g8O0MF+bVjIjXpD1h0gfsGTbk+jXtYYmyA4C6nO/54Uf+y926HurjG+?=
 =?us-ascii?Q?T47YZ9WX+VCrWMc8I5q4A0rOEBOiK44nnIsWVs3WanTX0DaJcefjUDUoqPMk?=
 =?us-ascii?Q?qBtF6t3iCApOF6qk0Uh/Gm7DE7NFMfB+YSM3zMlwtkR/WdPELVxaUzVIUTlJ?=
 =?us-ascii?Q?qcYKiPrUaz9+s56Nio/OPhfor28qtc+n3YUS3YBWUwRy6bjk1sJSg+XsQsVV?=
 =?us-ascii?Q?J+56ZNfY4/6TViLIEDKeF7zhdhi+a9rhf/fCsPhu/BZBCRM0Vju2UJ4Egv0I?=
 =?us-ascii?Q?6vqGTAeBxI+sPwxelyq3CXozoeDyoWtMf5Re+5xc/lAmsiYGLecPl4kTSOq2?=
 =?us-ascii?Q?xKFsJn5kLQj0Wj3JLiIdg1YYTx5zs8TLSY85oOcD4t46JgVAeQhe7sHP39F8?=
 =?us-ascii?Q?NMcpm74Cevm/NLIkXD+MvpdhaaNe+7ZcjXgCYUtX6CrAu5EKU7B9tzOjgVsd?=
 =?us-ascii?Q?fwH8nVZcYFkXIcvjsesTfwWcMK8lnx1K5KVDRlHv99UFEmQvhSzmScoFU4k8?=
 =?us-ascii?Q?d+2m4Xo84PBmwElH+sJCNnTWgWD02DRw+mt3Sw59a5XGShtOOjsczRuaVvWV?=
 =?us-ascii?Q?9uKEIJfEhJHVXIHGlcHna1J9kvZHxkuJq/S7ZOvBk5QMqkS5yiyXtwUhvh6H?=
 =?us-ascii?Q?hQgh5wShDZ11KiEQq5plflxiLTSlOA57jM1IK6rVFyTJfD60+RIyw47J/tjX?=
 =?us-ascii?Q?s73anBCLWQZLXhQIb+pyfWqnt7nLp3WcuhRn7C/G23b0oe5KBdWKRo7uUbq3?=
 =?us-ascii?Q?8SKH9MuR8FQJtDpE83tr2kYFszTF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 16:36:44.6267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1766cf-156e-4fde-e843-08dcb17ef6f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8103

Added a sample of market, product and design requirements. This is to
help explain how we are writing the requirements and understand the
context of the first patch.
We will be sending these requirements for review in the subsequent
patches.

Please do not merge this patch.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 .../reqs/design_reqs/arm64/emulated_uart.rst  | 240 ++++++++++++++++++
 .../reqs/design_reqs/arm64/generic_timer.rst  | 146 +++++++++++
 docs/fusa/reqs/design_reqs/xen_version.rst    | 207 +++++++++++++++
 docs/fusa/reqs/market_reqs/reqs.rst           |  77 ++++++
 docs/fusa/reqs/product_reqs/reqs.rst          |  64 +++++
 5 files changed, 734 insertions(+)
 create mode 100644 docs/fusa/reqs/design_reqs/arm64/emulated_uart.rst
 create mode 100644 docs/fusa/reqs/design_reqs/arm64/generic_timer.rst
 create mode 100644 docs/fusa/reqs/design_reqs/xen_version.rst
 create mode 100644 docs/fusa/reqs/market_reqs/reqs.rst
 create mode 100644 docs/fusa/reqs/product_reqs/reqs.rst

diff --git a/docs/fusa/reqs/design_reqs/arm64/emulated_uart.rst b/docs/fusa/reqs/design_reqs/arm64/emulated_uart.rst
new file mode 100644
index 0000000000..483db92fa8
--- /dev/null
+++ b/docs/fusa/reqs/design_reqs/arm64/emulated_uart.rst
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
diff --git a/docs/fusa/reqs/design_reqs/arm64/generic_timer.rst b/docs/fusa/reqs/design_reqs/arm64/generic_timer.rst
new file mode 100644
index 0000000000..00228448a3
--- /dev/null
+++ b/docs/fusa/reqs/design_reqs/arm64/generic_timer.rst
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
diff --git a/docs/fusa/reqs/design_reqs/xen_version.rst b/docs/fusa/reqs/design_reqs/xen_version.rst
new file mode 100644
index 0000000000..c5c58bb2df
--- /dev/null
+++ b/docs/fusa/reqs/design_reqs/xen_version.rst
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
diff --git a/docs/fusa/reqs/market_reqs/reqs.rst b/docs/fusa/reqs/market_reqs/reqs.rst
new file mode 100644
index 0000000000..a3f84cd503
--- /dev/null
+++ b/docs/fusa/reqs/market_reqs/reqs.rst
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
diff --git a/docs/fusa/reqs/product_reqs/reqs.rst b/docs/fusa/reqs/product_reqs/reqs.rst
new file mode 100644
index 0000000000..9954b7532a
--- /dev/null
+++ b/docs/fusa/reqs/product_reqs/reqs.rst
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


