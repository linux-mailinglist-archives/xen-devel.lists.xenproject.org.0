Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0B2959BB8
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 14:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781069.1190628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgkOp-0004T1-Qf; Wed, 21 Aug 2024 12:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781069.1190628; Wed, 21 Aug 2024 12:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgkOp-0004Qi-Np; Wed, 21 Aug 2024 12:25:15 +0000
Received: by outflank-mailman (input) for mailman id 781069;
 Wed, 21 Aug 2024 12:25:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rYNs=PU=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sgkOo-0004Qc-Hs
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 12:25:14 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20609.outbound.protection.outlook.com
 [2a01:111:f403:2414::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 696d013e-5fb8-11ef-a508-bb4a2ccca743;
 Wed, 21 Aug 2024 14:25:13 +0200 (CEST)
Received: from SJ0PR03CA0027.namprd03.prod.outlook.com (2603:10b6:a03:33a::32)
 by SJ0PR12MB6784.namprd12.prod.outlook.com (2603:10b6:a03:44f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.29; Wed, 21 Aug
 2024 12:25:09 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::83) by SJ0PR03CA0027.outlook.office365.com
 (2603:10b6:a03:33a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Wed, 21 Aug 2024 12:25:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024 12:25:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 07:25:08 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 07:25:08 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 21 Aug 2024 07:25:06 -0500
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
X-Inumbo-ID: 696d013e-5fb8-11ef-a508-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYL2bj51vPURx8WeG8XCDOwy48U14S5tU6oHhva9amzTn7J3HabQsB/8eGVEU+aioczRv1GYgZ+uxgLlxoyg9i9p1JSMzDvMlaicdUhIkUh3MHay6UkaiI8tI3I0vxMenM8m4AO7XWQD86uDCt+8EYwoVH2XApLLjs3dS2KuPEKSNdbVJ68cy3Ii4G0qN+JyU32mjQnbmKkbzoOCmDBTLuB+khZnqMStelv7MmR0ISeVHl58q7MX6aznuU7KIQvKVTbc6xxrajyPYTJ3H4WRyvaWnmAzbvhf1l1rmjDOCfHXoFPO8Uh4Vtr6rKfUooBJxpmO+4uUSy9Awg3YmbpnMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9z2Vlsc/1LlZUwNq9ZO7O+VdhHXAVt0rlCBhRyaeMzY=;
 b=QrCvEkeNvO77BxeRTZ7KTQnKKcc3yBshcr4KMMHbURP2BdZyPY2WQKHJr9oQiWGtbeUfzHb7zSkDGDoD2qdeoaL9WrBUUCT3Sv11hZKHq9C1qcm14XdyOVQ+DKhxKyMGjlCaOOhD11mCTUWTUUgPgEHUsDmX7dqTU9s3sXeCtFyvRYPBAFv24YVOfu+I8LQ1xfQCq8+qThuMBAb6GJh8/oiAvpifold2DsC/eGNDFcLCObgest/S4AgA+44BKX5QM+HlyPXcnp/Ejon+KB1TQMYmyu9rgK863afJD6HFyiKCwD4SnpVmbngQSfey01YtyCrTP9AN0spKNaTAJuBc8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9z2Vlsc/1LlZUwNq9ZO7O+VdhHXAVt0rlCBhRyaeMzY=;
 b=qxC/kdR5ClafT4A13a2FRydl7SsFiBXWTVXmefCcOrA4ALZZWmDRFxOmMH4oDvikUfO85uxZZthGWozZuz0KSxkm2d2nvWSwlpCGy1MIb2CtTZPE2eW8sYQdMMLlF0XIg8RkXXhDQDmvog8XnAseL65C21k8rTyiD/+S5CPHPWA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v4 0/4] xen: arm: Split MMU code in preparation for MPU work (part 2)
Date: Wed, 21 Aug 2024 13:24:59 +0100
Message-ID: <20240821122503.2315844-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|SJ0PR12MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a7b704-c4c1-45a4-f497-08dcc1dc4c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vPG5+OHW/RjnisUYnN4AFIW2N4aJ96rMHGsoYATY886IyUC5heO/F9QMw/ej?=
 =?us-ascii?Q?7UCQy43ju/+Qksyg5+EauCtK+mT/RGtK7cR65drk9tSvb+9PnjbJUR9taB3u?=
 =?us-ascii?Q?16dNF7aLmfcvnnOwVT2wugoQKcRXqhMWy9ZSQ5/dBsawm82TMliNzb3dXdAO?=
 =?us-ascii?Q?ZZUv+mSLuWEbajAEM+l9JJC/N/hrJPvVUj1/EG2DZswPraySBqedAGYqs2MC?=
 =?us-ascii?Q?BwMj+zPRyT/ieJfp6OqHsV5+pqDNf3JMuknfzXEE5KfYgmfZqYM31dGBMM5L?=
 =?us-ascii?Q?jI0Cd6KoFc/cFlcTE5t39ioL6F+n8fLQ70rdEHyrjSRQRFG48H4zv0dtnQxs?=
 =?us-ascii?Q?g9vY0S7L0SsMHiY0paQ7rtonL+vCMBIxX9hRbKhl3ZKLUcyFy4ciUN3Pj3bQ?=
 =?us-ascii?Q?Kdt1UHZk2EnebAJReDdefr2vZgPgHzBiYO/3MUn9QltoZHDoyUIJBAUNr7in?=
 =?us-ascii?Q?2g4jGfhJ7UWUor3DgNrmPDmYuls5InIrV8XKaZnAp1vyyqK398InYuCcqJmg?=
 =?us-ascii?Q?/YEkNzMryxEHLRBsqefkCZkv/1TpwhsQt7nk25uePanv/94q2f8YhPznHjPh?=
 =?us-ascii?Q?X+ZTZGF5sVIa2hHekU8dWDCmHaxnSC1zIY4VMVHWREqX0Tzy04u6K+WbDO36?=
 =?us-ascii?Q?q2xMVdtCvr64Dx05mxW1FwSUxtJruviXog/3sazbTFzkGheurnwpL2o4haX2?=
 =?us-ascii?Q?/jNz57ibswRkphvfypyXpqGWrAL66UjPGnXnBLzeBx4/IXByH8NxOKgb4l9p?=
 =?us-ascii?Q?kIqn2Tkr/ItxV5fE5rgyoFhYGYkIY8Ysosf+IQ7LkbtoucK6Iyie2EDxk6fY?=
 =?us-ascii?Q?Rf542nm2Exv0+cJ5E1WOYs35gwEbZ7ZcCt6RXA9FzoUS8bqlIS0TP6c7uWsb?=
 =?us-ascii?Q?xOuK5y0L4/aopWtCc30WXghSQKVaC7POBEpvXTYu+7gSJXkLvzPX/cD8tIXw?=
 =?us-ascii?Q?r3mjM/qrbjYVcYtYJ5nRZfr0z9mCwiPkCDJAjsn+LudA5njiyo6GI8r+x0XH?=
 =?us-ascii?Q?MlSqr3sMX/G6AMzvClQftHXoO8BdKqdW9OmBdYi9jLTP2Otet+oL5mvjyMLr?=
 =?us-ascii?Q?XOpFKyee4CtaxAhMH3dw31+xdBKh55Q4yGcAOJqMAfyhVJ0XbuKhLaaXWpX3?=
 =?us-ascii?Q?51QgMBV+vKeE+yRX8PULUlBUPS0OqfSXcQ9rgwT0pu3bpolr5h3ncWRo2BlW?=
 =?us-ascii?Q?2zyMf7O5hD146PL0sqxEv8KvSYB/D2dBZsmLmXrIq9K3VhOFuECdHKmP8GAX?=
 =?us-ascii?Q?+4q9KlWHkQDR3vxoMTCb/VSWi9B4Xf5eAvh7yIAamtmyqzcVArtPp8K2Qm7D?=
 =?us-ascii?Q?ufLiE1JIW4D3wpIx7QThCJyf0db6u/BcYs2NjBXQYTXdUDaWMbl2McwCpQF9?=
 =?us-ascii?Q?8u0b45QKWDAWY6gGy4UKwRrFwuiB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 12:25:09.1033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a7b704-c4c1-45a4-f497-08dcc1dc4c04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6784

Hi,

In https://patchew.org/Xen/20231116145032.1651305-1-Henry.Wang@arm.com/, Henry has
reorganized some of the code between the MMU specific and generic files.

In this patch serie, we address the remaining code reorg so that MMU specific
code is cleanly separated and we have added stubs wherever necessary to avoid
introducing if-def.

Changes from :-

v1..v2 - mentioned in individual patches.
v3 - Reordered the patches so that first 3 can be committed (as they have been
reviewed).

Ayan Kumar Halder (4):
  xen: arm: Add a new helper update_boot_mapping()
  xen: arm: Move domain_page.c to MMU specific
  xen: arm: Enclose access to EL2 MMU specific registers under
    CONFIG_MMU
  xen: make VMAP support in MMU system only

 xen/arch/arm/Kconfig                 |  4 +++-
 xen/arch/arm/Makefile                |  1 -
 xen/arch/arm/arm64/mmu/mm.c          | 14 +++++++++++++-
 xen/arch/arm/arm64/smpboot.c         |  6 +++---
 xen/arch/arm/include/asm/arm64/mm.h  |  9 +--------
 xen/arch/arm/mmu/Makefile            |  1 +
 xen/arch/arm/{ => mmu}/domain_page.c |  0
 xen/arch/arm/setup.c                 |  2 ++
 xen/arch/arm/traps.c                 | 10 ++++++++++
 xen/arch/ppc/Kconfig                 |  1 +
 xen/arch/riscv/Kconfig               |  1 +
 xen/arch/x86/Kconfig                 |  1 +
 xen/common/Kconfig                   |  3 +++
 xen/common/Makefile                  |  2 +-
 xen/common/vmap.c                    |  2 --
 xen/include/xen/vmap.h               |  2 ++
 16 files changed, 42 insertions(+), 17 deletions(-)
 rename xen/arch/arm/{ => mmu}/domain_page.c (100%)

-- 
2.25.1


