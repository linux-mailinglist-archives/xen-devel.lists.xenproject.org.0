Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EE5A5FF38
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 19:29:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913302.1319386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsnIm-0000Ph-KP; Thu, 13 Mar 2025 18:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913302.1319386; Thu, 13 Mar 2025 18:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsnIm-0000Np-GN; Thu, 13 Mar 2025 18:29:04 +0000
Received: by outflank-mailman (input) for mailman id 913302;
 Thu, 13 Mar 2025 18:29:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eDg6=WA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tsnIl-0008Kg-4y
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 18:29:03 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2414::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 090ec70c-0039-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 19:29:01 +0100 (CET)
Received: from BY3PR05CA0059.namprd05.prod.outlook.com (2603:10b6:a03:39b::34)
 by MN0PR12MB6247.namprd12.prod.outlook.com (2603:10b6:208:3c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 18:28:57 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::b9) by BY3PR05CA0059.outlook.office365.com
 (2603:10b6:a03:39b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.29 via Frontend Transport; Thu,
 13 Mar 2025 18:28:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 13 Mar 2025 18:28:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 13:28:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 13:28:55 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 13 Mar 2025 13:28:54 -0500
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
X-Inumbo-ID: 090ec70c-0039-11f0-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvnAtkH7r9+IwQJ8IZmS5X4K7Gf6xPq8EpPpnx17VWLlmEPAdykXpbswtlVfmLORWnOAF6fSPBFPe2RUdL5A40u2djtQQxk8tiwaK0VR6l87aZHyWn8UtXruJf/bOiqrJBVyIxjG4xT15esjA1FJSabhkhCin1QhQHLeB3YXYP2yciKFND7J1pvaAbLjgZZMQCtTDzLtTji150Crj4SpjbvxIOhmf540QNCIxIDcYP4kgBIJZChNWGmtotZUfRW/LfnEAQMjiMwbT9xd5VZ0vPaYXN3ueISuMpDyYeKccoRuVwoTh2z+Nfv8GF5QtKDPtWFfDgvtUemSNO0fVHpCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyGmGVp2mRMlL0WSKAMgYyI6Zq0EKA9ZuDqJUwOsVWY=;
 b=Q+dgL33qPAlu7xMEOtCkbFvczlv3rTZ8hzPaOtM3ho4/BMkHpzJkI5VKarum7Ie6XKK/QZx8aze9a7W7yuJxx6d6yLpl7oBKHhKrUSlRTMLhAdFazXBgaZCs7QmuANF0e1icPRextYVEyJOTw1mlAclErsB4gevbAqRssP6P6+8PvANNU2s4B8JRlvx9uRPrfnc3Vth4dfb5KUVZrV5w+ifb/THGsQmEMRfpoH1mw3+nbAfdEgNABIzldE51QuT12hjWfLZXOVyVpnWDzZ8C2J5mehbxtBu5Y6S6Su9ld+rsZh0us7HgTXae6lVGtp7J3ewGxa2EcDB1ueutI3tgig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyGmGVp2mRMlL0WSKAMgYyI6Zq0EKA9ZuDqJUwOsVWY=;
 b=emKmKkdI2/vTjXEoWK/j89KCqJhQ0CtMZWCDt1+hQk73Joq7faqAtfTdpVAkf+nKEMOD80ZuQ8yza/BDwqXIs2DQXFCNCzy3kfovpdlFqkUup3TyD4N/xq2k6v0xSKseC/OB8IO1dA6ce7YTp+6widIPpJn5PL3QQJzZiCzryRM=
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
Subject: [PATCH v2 0/4] Enable early bootup of Armv8-R AArch32 systems
Date: Thu, 13 Mar 2025 18:28:46 +0000
Message-ID: <20250313182850.1527052-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|MN0PR12MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: b3955d8b-ef79-40d1-41ce-08dd625cea6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?enRvQwiCc093Dw+3joPrfyFEUwGgmlZtZO24wlMg5k2hl8TvpBN1gptlXjH4?=
 =?us-ascii?Q?f85F2RfpoFlYGiFPPik/nXc3LHCu6PMUkljbAsXZV0dMNKzwY+0Z3jMQCJer?=
 =?us-ascii?Q?0llfrbbdOeVXq4LibLurQ6yUukev0zmumyyQUf4CgOB5X55Ty8mx6SMpYImJ?=
 =?us-ascii?Q?fjhWiJ4j5cSimBaomaVXph1grnEaAA8153TwPozP0koq/Zx8QHv1kGrW9Gyk?=
 =?us-ascii?Q?S/KFClpwFONztFjn+Pk0H7avBD5EE1AfA3jQW/Q1LhnxvBe1QaoVY8pgA58t?=
 =?us-ascii?Q?7fO+bf0Ky742sF0LERYCz8FLzi3J9jSmK7KK8AYgNjlz1ZPo9iAoUoprvk03?=
 =?us-ascii?Q?K8XO9VvvzWt3trkassPU58Y/9CAWgtpGwJPNQA1lDE6JsjWEAOAXHHDIaO2D?=
 =?us-ascii?Q?E1Aj+cP2VA4mIp/cYESOkn4PZfV8dURkjWRR7otnPYRNPF19nctq3l5ScVcc?=
 =?us-ascii?Q?MQ+RqZn/EG8BsdrZJoVod/QNJPKwzo3IYMeuBYU4GSse46q8WXxmfpn9FoHR?=
 =?us-ascii?Q?LASwr/elIvkURyW74QH99FP0IJ/8STmXj2JPyXlloI0imlvRsCZD7sbvjXx4?=
 =?us-ascii?Q?yDCtUXeoJFNx+PGTjP4IlK5+6JyUH8Wl7M2jakuVg4xz0StxlVaAVHI6A/78?=
 =?us-ascii?Q?MHT+8GkpR1Veh6ttaO8rocExhrk+0R2Oukfngw0WAxYnSzM/ZOfEaW9aYaEO?=
 =?us-ascii?Q?FiSAnm2pEOILgFU6MVeZAEKW486QeiWjcMp33tSm3QsE7m8fk8n+C0jg9/gx?=
 =?us-ascii?Q?cYr3sK7gJ1dqlxgex0tR0WqxktFtKIh29yW9H/z6mOS/k1I+MX0nvfZLygJa?=
 =?us-ascii?Q?ZE6YF3lLTmliwA/diZuqS5fkMQAx+qxPZhScWzEUzUT+8YhuPYjbv12Sw1jg?=
 =?us-ascii?Q?5j/8fpPfq8NcuCBGq1qT/irV9daKf+biizBmpxPt26dOP3zANd9Vhpqzkgd7?=
 =?us-ascii?Q?O3dGOY1h8qMQevU4Sw86t08y/eHPOtUcmafQWyOhD7ZRM50gWZeaVbj2F+Ae?=
 =?us-ascii?Q?aIliDqoxL7XMGAjiBgf01iaY1n38jy8U82FtzQcp3biA2MJ2nQqyQP/Qa2/Z?=
 =?us-ascii?Q?E+N1WJO0lkkd7W4QhwRpSeTLpEXG2Hcmc+QKKd3AXtO7h1NL//tv3tBV/doJ?=
 =?us-ascii?Q?oje46ihwQvC4diZCunMPjaRFuOp2OGnzyGA0jz8QXuzKo9X8k4ZZ9DDWaiAR?=
 =?us-ascii?Q?T54CQK5y9k8+IgxEp/MVSV3GxGphpWz3t7jh0IsiS/ykyqp0Cu/E/NzejdmX?=
 =?us-ascii?Q?ukB9mY0xsDB6+9CfpESfHez/1d+KjGtzKaULZ426DK6vD9feIGn2WMAMlU5V?=
 =?us-ascii?Q?zlTZ+GJYi+PNfWy1mdGHnKXcTWFJvyEX8EWIad2AKPYPBJKiOs4cvq08wDIU?=
 =?us-ascii?Q?cpnYKZeqPu94EpDdCyNS+BeEbjEtFOKBPGO1bxD1DiMy0DEX+5B6hj4w/H+y?=
 =?us-ascii?Q?V4qv3ize8JXDyBbTXmCCKuJfrZzUgiZe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 18:28:56.4589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3955d8b-ef79-40d1-41ce-08dd625cea6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6247

Enabled early booting of Armv8-R AArch32 based systems.

This patch serie with
https://patchwork.kernel.org/project/xen-devel/list/?series=943154 and
https://gitlab.com/xen-project/people/ayankuma/xen/-/commit/b407e5713c619821f3f5a55da65d4f8f380c3778

will enable build on Xen on Armv8-R AArch32 for MPU.

The current patch serie does *not* conflict with the other serie. Thus, any of
them can be committed in any order.

Ayan Kumar Halder (3):
  xen/arm32: Initialize MM specific registers in enable_mmu
  xen/arm32: mpu: Create boot-time MPU protection regions
  xen/arm32: mpu: Implement a dummy enable_secondary_cpu_mm

Michal Orzel (1):
  xen/arm32: Allow ARM_PA_BITS_40 only if !MPU

 xen/arch/arm/Kconfig                  |   2 +-
 xen/arch/arm/arm32/Makefile           |   1 +
 xen/arch/arm/arm32/head.S             |  14 --
 xen/arch/arm/arm32/mmu/head.S         |  15 +++
 xen/arch/arm/arm32/mpu/Makefile       |   1 +
 xen/arch/arm/arm32/mpu/head.S         | 180 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/cpregs.h     |   4 +
 xen/arch/arm/include/asm/mpu/cpregs.h |  21 +++
 8 files changed, 223 insertions(+), 15 deletions(-)
 create mode 100644 xen/arch/arm/arm32/mpu/Makefile
 create mode 100644 xen/arch/arm/arm32/mpu/head.S
 create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h

-- 
2.25.1


