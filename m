Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE21B950B46
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 19:14:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776484.1186641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdv63-0007MP-G0; Tue, 13 Aug 2024 17:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776484.1186641; Tue, 13 Aug 2024 17:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdv63-0007JS-D3; Tue, 13 Aug 2024 17:14:11 +0000
Received: by outflank-mailman (input) for mailman id 776484;
 Tue, 13 Aug 2024 17:14:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rcsl=PM=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sdv61-0007JM-Tg
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 17:14:09 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2416::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 729b05fa-5997-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 19:14:08 +0200 (CEST)
Received: from CH0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:610:b0::25)
 by DM6PR12MB4153.namprd12.prod.outlook.com (2603:10b6:5:212::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 17:14:03 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::9) by CH0PR03CA0020.outlook.office365.com
 (2603:10b6:610:b0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Tue, 13 Aug 2024 17:14:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Tue, 13 Aug 2024 17:14:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Aug
 2024 12:14:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Aug
 2024 12:14:02 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 13 Aug 2024 12:14:01 -0500
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
X-Inumbo-ID: 729b05fa-5997-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PakLdZ/BcDisqXdADFYwPW8WUabJZUiZtSH23FZkuffZSJGpJTA3a0+Ib/ue8JVDPMTKFm/oDTt8CPhOVL9SLn5ydNO+/Ct80od1Q5OTcWRapKptI/MFbphwE0x8DDh7cqEniuk+YQvK5eLgeyDB7OKMjjK/gINsS6ZS66aycLA4uoPtjK0dFwKnHv5c//zmw+qWwPkmUmsnh/WGlyifPy5BYZ4hHgjxPGkTd28ToWZ1OLaqoGxE5pEW4KNS375DiFAF40taaTNhWqeIrtOz7J9fIzVNnuCuVFdTpU0/QEbrR7kDa0HyXSLdlYejB+veMjzyjJKLMqkKiPBIg7rU0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KT6j/B5Nn8jiMhkUoj66gNweNhytDsgexPuGVpNobdY=;
 b=JLiXHLeKSrSVCKDvl65DosdHbLj+i2O05ufXh8czkzT0zodCx4wVA6AJGkbBCwtxQhWHeaPdz590UG5ZV4jCaSRpYjomRyIX7DxgLmjts2/XmgTLB+GiACqj4z2MSX1kEEjcw3eWAYiST5gAINb8zSIwJagJ5ui40TCQz/MpPXBaajxZ3H9vC46okpCsZjgHBAIxC/zGqe0fjWXNcyLDeVIv9ssUN1dxXdXknD4kbIi91JKcR7MyQJzdsuQLfu2bdvHYD3kYaUpKWjbG/vkpUTbL2Wf3ctbcAO9ySBLB2Qok/wX6EbWl0lI90BwqPeUhe1joschYBTUU3sCI3j70Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KT6j/B5Nn8jiMhkUoj66gNweNhytDsgexPuGVpNobdY=;
 b=CVa8PFiuHHJMRrYxCDkXuY9JDzf7xre+5DyL3sPyUYF0wzZTB+0HAeaciCXij4jEJpEuERNAmxFGFySTOYCjIxqx3Y5WyAZ+9Tbw3XmSgIUGHUqPVHqFv6RR2rqdZPW6iN1A53Im/LkEZ8tvJfhYSTEUG6qh6zMHQSPsh/5lQ18=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <ayan.kumar.halder@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <julien@xen.org>, <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH v3 0/4] xen: arm: Split MMU code in preparation for MPU work (part 2)
Date: Tue, 13 Aug 2024 18:13:52 +0100
Message-ID: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|DM6PR12MB4153:EE_
X-MS-Office365-Filtering-Correlation-Id: b0270a2e-ecd6-40d8-5742-08dcbbbb5497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hESJIyGZoB4hEvlqQHBBW/Y7rxBEPLajOaJKfl6hMi55H15VyKDxY32jxRN1?=
 =?us-ascii?Q?CzdFNEdZ0kmx2tmXWVX0TKjsqP2C7qhoLJiaVL1JIpCN5YQAMkATQY1ZWEnn?=
 =?us-ascii?Q?EnYw0Qx3qQpC38saLRJjL5U2bROr/eimotN6SX+7vYYB+qsNCzkErXxiNdyu?=
 =?us-ascii?Q?zbP/Y/pFvu7bbzMAT2TmEYwtq8EsJhLWeD3MMC9KrajolvUSOIpuc6T75jKA?=
 =?us-ascii?Q?WJKcLKXR8M75XL53jyMfaTJA0yeqHO5oCBcoCIfwKq5LhCRsb0CzfPjwJ9KD?=
 =?us-ascii?Q?1z1mZOmBc+LH1Un6YmQ75/WWA43oGRMIaMAWE7dxYSfp0ZB7JSQtpnSIOQIg?=
 =?us-ascii?Q?QHXUZzmRMp8BH+BaloFxhiLoUM2Vn8R3wMGVDlzvbGrvgIASoo6rVPpq00Ls?=
 =?us-ascii?Q?vVb3Z0GGfG+HPL0D51oPXIDI4nZaeabVLiYflv9fBpT6nEDhSLgc05TaHvvm?=
 =?us-ascii?Q?E9L6jsnY2jM1u47guwhwNclGAt7oR9YsXwjd2p5kOwHKri9RTQZIv7neT76Z?=
 =?us-ascii?Q?cX4EdZ5xbIJDQBkXsZlFMH4w0V/0cCoaIHLJPUxetTRKcG/FEK0KRcVSV9Ji?=
 =?us-ascii?Q?R8NHZs3lsmsdulO1kBRjM/kiT0To+v1DVweJYIMvbRQoPXMHX24KQxppmFsA?=
 =?us-ascii?Q?SDitHWMPp2Wvdoz+xYP2G7DEDOU6ct0IOS5exA+m1dGEXzkVxUs7q4NMpF+o?=
 =?us-ascii?Q?m1Uw0p8c5qZdVME+AzIwigPVnOeI0WiaCqaA3g4REwJo01EpDHrCXVkC/y/F?=
 =?us-ascii?Q?WyMdEzbPgbr9LIOOEUe/7h8d9KvO05VEysxr7VCILyQGmRqbhG7tfutyTzz/?=
 =?us-ascii?Q?OptXJlAQb/cfn9KOAcm0yxuRaqXtCZDMzmwBSgz/ZL0xlOnn9vDlYWFZ+o18?=
 =?us-ascii?Q?HKVnpLJcDX7zPj+0eky1Txsdf90d91RBalDOk1ukorYMSgRq7o607Ei/9InD?=
 =?us-ascii?Q?TAFRZq6pkfFRRZmtgT/4H9ZyocHlrq0F8PukAG36H9mc3W8cDTyCtDL0U5KP?=
 =?us-ascii?Q?2CSrKphiyjCx1SxijaVJrl3jeWBOdEUYlREs5deXmTSTfAJ3x3MCyr72Nrqs?=
 =?us-ascii?Q?qnMRCNEQ++audLnRcdVQWcF0IAqPppCGNRih7FuK3x2tjgyT62wG12Xwjatt?=
 =?us-ascii?Q?u4EC8MN82NijMEyFOymWrBg2xwpYvPmKE7E4vB6gVrcJu/bv76W5R1TpIkSs?=
 =?us-ascii?Q?AHORi8yq8oTDGRaJuPM8973uoUUT4y8E+TbN2nKsSAZmYX2Vw7tppdMbE3OL?=
 =?us-ascii?Q?zBPVQp9PWLD9+w/8me6t2dtd4XUDRVtNJiyNtN5Rwqb/qdoXANLN2tZ5z1Vj?=
 =?us-ascii?Q?E2CguYEetgz3gdQCTjBVGKHR5HAGRPk7h3m3/vtmA5D88Mt8RLm2cMDYJscv?=
 =?us-ascii?Q?5nc/ZrQAei+woQcD4Qh0lXhH1VlZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 17:14:03.1313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0270a2e-ecd6-40d8-5742-08dcbbbb5497
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4153

Hi,

In https://patchew.org/Xen/20231116145032.1651305-1-Henry.Wang@arm.com/, Henry has
reorganized some of the code between the MMU specific and generic files.

In this patch serie, we address the remaining code reorg so that MMU specific
code is cleanly separated and we have added stubs wherever necessary to avoid
introducing if-def.

Ayan Kumar Halder (4):
  xen: arm: Add a new helper update_boot_mapping()
  xen: make VMAP only support in MMU system
  xen: arm: Move the functions of domain_page to MMU specific
  xen: arm: Enclose access to EL2 MMU specific registers under
    CONFIG_MMU

 xen/arch/arm/Kconfig                 |  4 +++-
 xen/arch/arm/Makefile                |  1 -
 xen/arch/arm/arm64/mmu/mm.c          |  7 ++++++-
 xen/arch/arm/arm64/smpboot.c         |  6 +++---
 xen/arch/arm/include/asm/arm64/mm.h  |  2 +-
 xen/arch/arm/mmu/Makefile            |  1 +
 xen/arch/arm/{ => mmu}/domain_page.c |  0
 xen/arch/arm/setup.c                 |  2 ++
 xen/arch/arm/traps.c                 | 10 ++++++++++
 xen/arch/x86/Kconfig                 |  2 ++
 xen/common/Kconfig                   |  3 +++
 xen/include/xen/vmap.h               |  2 ++
 12 files changed, 33 insertions(+), 7 deletions(-)
 rename xen/arch/arm/{ => mmu}/domain_page.c (100%)

-- 
2.25.1


