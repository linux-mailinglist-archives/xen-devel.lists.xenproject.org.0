Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B216945DB9
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 14:15:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771052.1181629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZrBZ-0002sO-JW; Fri, 02 Aug 2024 12:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771052.1181629; Fri, 02 Aug 2024 12:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZrBZ-0002qm-G9; Fri, 02 Aug 2024 12:15:05 +0000
Received: by outflank-mailman (input) for mailman id 771052;
 Fri, 02 Aug 2024 12:15:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sjRO=PB=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sZrBY-0002qa-3q
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 12:15:04 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20620.outbound.protection.outlook.com
 [2a01:111:f403:2414::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6958d7e-50c8-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 14:15:01 +0200 (CEST)
Received: from BYAPR11CA0067.namprd11.prod.outlook.com (2603:10b6:a03:80::44)
 by MW4PR12MB6897.namprd12.prod.outlook.com (2603:10b6:303:20a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 12:14:55 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:80:cafe::14) by BYAPR11CA0067.outlook.office365.com
 (2603:10b6:a03:80::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Fri, 2 Aug 2024 12:14:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Fri, 2 Aug 2024 12:14:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 Aug
 2024 07:14:53 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 2 Aug 2024 07:14:53 -0500
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
X-Inumbo-ID: d6958d7e-50c8-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EU6UWUy+WJ2SdzJVPGyYvRKTr/xK/ckUXw92MqkBS5C1gNOerircKk0RPT4VscZHAxkrilcp09oiWroanKIY3d1CKvxh+BhDXjzb3HZSLtE0pZmRdN5t5yvxWg8kRi5GQfUAdOHrmYUrTcIS6QV8pyR07ctXB4Sy8vpLFjVRq/XMy5oDT6Wz4tqRj0QiLv1FVhxjAJ3GalYLZlLHjEnSOFDJmYsezasUiG7r9pbqChr3dcomz5u44Jp67o/hmQeSUcO9/ZIgJZ9LsYIhPLi+9VXqD8wH328ye+F4BkdRo2JCrlJTqugeZd6Gab80ec0IxNBPtNemPcLWHAdoWsWyHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITrrWosK14v5+EcosBCaPLfPpp+3saTWMWs0TdG6SCY=;
 b=Lqec4XdeLpmXebov2Xfe56Ebghv4r6Of43oZNKMtHW3CNinhNF+MDryabhHKjFTbQGWHsBm1n2hppZEcpnxWd2YkGwOCcM0E9vUhx8/fdqShfP7QBU6/uYw0nLgZT/RdqhSS4kLwasks4eqTpVlA/RMxuT9cU1hi24hftWq8cdtQyzDIEKp3ISNKSLgnoSFuJ6otMyAoF0WQqMB6PVzac9qCGi4rsc+5tQCVVnHM6PLFV5ZOMhmoxnLHfLkW/Vj04qHLt8kadVI0w+uCOACTWaURuoZedGWh4N+t+C8Yb8lGHGIetqKCBbQjXkQNAXruTIquew5Az5cT2A8/8y3q8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITrrWosK14v5+EcosBCaPLfPpp+3saTWMWs0TdG6SCY=;
 b=dJWXEL3dViEzGODHZ732d1xa3LLtOF3HZIRDxelvuWy3lGVdqtp622AyQEgi1NAkCh5+jbOCEl04l6gM5enTA8brcoRtce50HRnoSL1YhwWkpQKMAubf5Dv6kpNjGMW3lKt6NT/f53dmZNUr8qgI/dISdiZgMTMQMPpQ/ZwtRX0=
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
Subject: [PATCH v1 0/4] xen: arm: Split MMU code in preparation for MPU work (part 2)
Date: Fri, 2 Aug 2024 13:14:39 +0100
Message-ID: <20240802121443.1531693-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|MW4PR12MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: d87fad3d-8db1-4aaa-748d-08dcb2ecb84e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?84Owe0XAVjygxau687Y59fsulKs4bBUFWs+Np4wIWqQIU8g1AIQowdmEAhrL?=
 =?us-ascii?Q?IDj3hh42PTWg8zkGoHgP64K+3CD+oeDG1cu0vY/4UgN29EZc4pD+FAD7dhyh?=
 =?us-ascii?Q?PoxAi4TL6hcUr1TfW+yl3I954Xxcpv4k3uUGxqc+bdiHBVrEqFl5I2uK2taH?=
 =?us-ascii?Q?BF6c5B0YKCRL7Erodl8puc3kux3qTmSZ1TLL9SDBN3gKqEil5xJto1eQh5um?=
 =?us-ascii?Q?JMS59KFVS5IK5mM+u+hTe8T/QJTsMYS5iqonLFxqDOsLcU1mZv1l3suISHiY?=
 =?us-ascii?Q?XpVgemyGEk8BPYUSQZ8sQX8R1jsjSrGCLhw9PoQ7TIiGVunCkrae23I8wiSu?=
 =?us-ascii?Q?VN4ZpSxmjBejXAEqZoD/wdjB7eCxMDz8ibbU0tFBFg5LYDX0cTlpmMxnESwt?=
 =?us-ascii?Q?YQtPTI3I1IiTUF8Ey/7Mucu8Eo+TbWO4Lyusb/mA99h3z5WyfWfR7lZCV5XX?=
 =?us-ascii?Q?exAfj8BlfzUHN8bYZkQ63RCHjeWkAqueRdkC9svvRw3egAjbOZ6XxP0PLZvG?=
 =?us-ascii?Q?1N30d36wRIS2MtXTiSgl+ZwcZjxpbKOhV+n+DzIVV3137wVlsEz/Uloa0E/q?=
 =?us-ascii?Q?LPINXNtLOYya4lmfXkXwUWp14PdjRHt5eFiT27aGo4arsIBeWV/X79Yn3cnr?=
 =?us-ascii?Q?0tJfH7wPSP1rkaBQdRTQAQhETGCFYpIwelcqKpNqU3t3nGOFyAh9+MQOxih9?=
 =?us-ascii?Q?hba1RDozIqcC8Ws5Q6cvenCsGOItaSm3QmtIM3BaP9ByJWEXxFc+q+3vuSSB?=
 =?us-ascii?Q?thWQOxkZ2WV6AXPpfnus8vmUdh/YFcYSDC/Dl6JM5kPw6nULDzYqvD9PFgcY?=
 =?us-ascii?Q?0uuI6Up9euqV6taPzggbF4DuDkjzMjOp/+N0TIr9+/rqOqarx6dG9NhEiIGr?=
 =?us-ascii?Q?+jIgmzsMSusKrmtRF47nq13NULjI+qM28zqno/ZAisgpWH7IvcY423Sglqox?=
 =?us-ascii?Q?rrva2RFo2LVybFJBCHpipNSSNlQ1ygulcCPzO2xCMZg2gVQiH8bwGeiitkRM?=
 =?us-ascii?Q?K1GVYGmaXSNg9xGexZNxV9cuVJXx+T6vNMVeX386BLLwjKcvOwdBs+cnNyws?=
 =?us-ascii?Q?LIumll7zKHVKid+FeockCT8DR3Rbv5NwHPsfU7vPKdQIfQGLnwK0RnY7b786?=
 =?us-ascii?Q?3eYHGl0nIUxvMx9YUlCnULesXJt2aH72Bhx2LSqWso2lpPaUAFQIhzBIWswx?=
 =?us-ascii?Q?0BIcmisNltq2l4xOiBW6idmqaV/xl+xE9ans0rSmndno4cy4ix3ADwmcfeYn?=
 =?us-ascii?Q?9S2L6Bqvso3JFlMdhiVF8XyCg0XN7OfOmZKg1mJg2pOvlUz99rnFgn2FPDfg?=
 =?us-ascii?Q?jxiDZ6+28u4nmdUu73lF7UbySbgdD8KxdCzkijnTdWvhVzMa0KQGvKYKM/VY?=
 =?us-ascii?Q?yIc3On+a3uL5Zz5Ypi1E5PiGhI3X?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 12:14:55.1286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d87fad3d-8db1-4aaa-748d-08dcb2ecb84e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6897

Hi,

In https://patchew.org/Xen/20231116145032.1651305-1-Henry.Wang@arm.com/, Henry has
reorganized some of the code between the MMU specific and generic files.

In this patch serie, we address the remaining code reorg so that MMU specific
code is cleanly separated and we have added stubs wherever necessary to avoid
introducing if-def.

Ayan Kumar Halder (4):
  xen: arm: Add an empty stub for update_identity_mapping()
  xen: arm: make VMAP only support in MMU system
  xen: arm: Move the functions of domain_page to MMU specific
  xen: arm: Enclose access to EL2 MMU specific registers under
    CONFIG_MMU

 xen/arch/arm/Kconfig                |   6 +-
 xen/arch/arm/Makefile               |   2 +-
 xen/arch/arm/domain_page.c          | 161 +----------------------
 xen/arch/arm/include/asm/arm32/mm.h |  12 ++
 xen/arch/arm/include/asm/arm64/mm.h |   6 +
 xen/arch/arm/mmu/Makefile           |   1 +
 xen/arch/arm/mmu/domain_page.c      | 194 ++++++++++++++++++++++++++++
 xen/arch/arm/setup.c                |   4 +
 xen/arch/arm/smpboot.c              |   2 +
 xen/arch/arm/traps.c                |   6 +-
 xen/include/xen/vmap.h              |   6 +
 11 files changed, 242 insertions(+), 158 deletions(-)
 create mode 100644 xen/arch/arm/mmu/domain_page.c

-- 
2.25.1


