Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763E494BD01
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 14:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773964.1184472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc1xq-0001EU-EO; Thu, 08 Aug 2024 12:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773964.1184472; Thu, 08 Aug 2024 12:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc1xq-0001Br-BL; Thu, 08 Aug 2024 12:09:54 +0000
Received: by outflank-mailman (input) for mailman id 773964;
 Thu, 08 Aug 2024 12:09:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqo7=PH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sc1xo-0001Bl-SM
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 12:09:52 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c06f671-557f-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 14:09:50 +0200 (CEST)
Received: from BN0PR07CA0010.namprd07.prod.outlook.com (2603:10b6:408:141::10)
 by PH7PR12MB7820.namprd12.prod.outlook.com (2603:10b6:510:268::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Thu, 8 Aug
 2024 12:09:43 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::e8) by BN0PR07CA0010.outlook.office365.com
 (2603:10b6:408:141::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14 via Frontend
 Transport; Thu, 8 Aug 2024 12:09:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Thu, 8 Aug 2024 12:09:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 07:09:41 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 07:09:41 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 8 Aug 2024 07:09:40 -0500
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
X-Inumbo-ID: 1c06f671-557f-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbzHsrSLf1V4pze56S6llFmcRDYBxoDMHp8IFVQPPKpulBOHDD8AKiZ5rLvkixMtuWdpTBiMDXHII/ZNYI9fcrM9MJrOGw8W103VpcsLez54wryrkVtb81RKH+3Svbu2vaqtgYh2YoQ1mOFiZLYuBhegG1m4Ss5AFg/T9ICVN9cLXxulPwGplrMB9Ke/i6svfu8PsrYW1eEmb2Scsse8GvLY/tb1o8fVdtj6zNv1O6fvd7nWyGWcD49I0C1ZnMDZUpf3Yzxqs20Fpw9lxLs2PhnQ8lTAS2h8qjifa2Ri+ekuwzlcxJilsiHaN8/yAv0nnT3nmMRY7b3M0jKqRULpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yV7NyhtbmiM4x5V4/xuEj04uj/rKjST5nQ5idUZLBpg=;
 b=rwHA4MdnHpU4sRdbgYILODvv6+ufcddyeSbHkgOs0RM9RVIK3CuNcqFUyp10qrTjvyWi/7fZ2Vn3d2P8w3NDP6mfKLsh8C6Lt4/z4kWxYwIIiQsfvM/CaybGY4iyDYZccEig+fIP+8tNRZJ3SHbR/aG3amOHUTNaBgXgkjYk/DDswsdKOI8KQoMYkrk6igOQz77q+v9Py4Blnztr6Nysup3qi75OOCdkKudRFQOsOLnGoqC7Bz7FeShVDQO0gbo2q1RncqXGxgCLOgH/4Vp0S9h5tQMj5wpuk/nr8/2jAwv+IlG1UaTD7H16Y1dT8uBARzX6r7R1It/4xSoUPmgrSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yV7NyhtbmiM4x5V4/xuEj04uj/rKjST5nQ5idUZLBpg=;
 b=J4W0HZs4wYvxw7wivyDvlog12yVK3Ogf69XjE7Mg9YyrxQY/JgS0vcAltSqA6qonYjywoDG4v0yPSbieZXIwr01AJT6cTuxhr3WLPhe7banTIlvhRDe0e/KqeEqUOdjgAQVqyoyCkmoluAxlCKqLhU8V4YUfeH9cO1P1rHjePjk=
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
Subject: [PATCH v2 0/4] xen: arm: Split MMU code in preparation for MPU work (part 2)
Date: Thu, 8 Aug 2024 13:09:32 +0100
Message-ID: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|PH7PR12MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b0d8bc-3ed7-401a-7443-08dcb7a2fcba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C9XlKGkxrCu/5s8GfTnFoGAKXdGPynqGrU/bOeldXtvPvOysUP6g+TMzBmDb?=
 =?us-ascii?Q?CysOHdgYhfNUSzq4UHxHkHpOIP7YlKjYOULCoGlT87JfET6t+C5bw0OeWKLy?=
 =?us-ascii?Q?IgH+9QivnC0EKzloPZ1OJFZNCp3O5Om3tQJ4Yriv+EA7oUoaoelqltLUynOr?=
 =?us-ascii?Q?eluyy/bA9Vw0PnMGMO06waaEU8RBlqz5q5YHJBqv6ynDI3Vnz+Hlrtg7586B?=
 =?us-ascii?Q?yQfjRBmrAAvnWEAveH6OzwNOMFydLYRRo2vcKIrZ4Vx4/pwbrg8fv6LmJ3tF?=
 =?us-ascii?Q?ObSbjAuTSqmtfWviY/s68HW5lgooqrX5nqRS1EHrd+FdWu2cxac2HOJLGE5T?=
 =?us-ascii?Q?sO3b2OBhTXBG6QNLuX/LeeMx8C+l7WrR/1ebA0s05/od/cpE4hFgWMfcJI1Q?=
 =?us-ascii?Q?PAgNHSHZLAIhxop6TJmeo7Dyk+cirr08Gr+dnE/KrLso81zNCVpll110htYb?=
 =?us-ascii?Q?A6jd8RJ8ShHVdAWK5meg4kc+mKX1oEu7Uc0u4PSvPW7ERlqZPAMieS0XIo6R?=
 =?us-ascii?Q?mRraKzSnU5QQOG56UUfMV2pTg4kRiM2wGLQetMiVPNQnVxakU8Re3RoRwrPd?=
 =?us-ascii?Q?kmLJa8puCWOPKaFf+VI9anERddr6CHln41/OvMYLOKdzf+ylMlfrAntiKo29?=
 =?us-ascii?Q?Hv9fDZmvFrNeopd2Tar3qMaS49E2OJ8PNegzC79jnmwWP6HMpikWO31MNk2x?=
 =?us-ascii?Q?YWAwawkEUqtOnhBvS8KkcpTUobMGwWgmyjrXLSdO8I6gmwc9BTJLNpijwg5P?=
 =?us-ascii?Q?pITG5Eq9cnCpRaeRIi6BzuvdRE6Ahg5//GrSRK7tqJKH0bWrgWhBISm6APlG?=
 =?us-ascii?Q?UjH/uD1qAcDVgQwJocoQrtQZAIGNbdmPoABCnwi1bz0HdfmIfVtLUch+5uUI?=
 =?us-ascii?Q?fnNNe9WMjdJTeEbkmWjS8MC1AZ8xq9GGAwNz6aGBvcy9fLSGo3ChF2i/B0wy?=
 =?us-ascii?Q?Qx418mjW03YKH+544DTAJo3XLP5Qgwg71ZoV569wgRUYAYM/YSCSl7Qy+yn0?=
 =?us-ascii?Q?EPsWD4mtztas1+JOb+wb0jaEnmy0rj25v36o7bkfPY9QHCyNSLk1AqvlZXSX?=
 =?us-ascii?Q?qER8YHY3Yq2ZdsDe/MaW7MG3wqhZP37Wdf4CbnmPQvCrgIL7Q9kGhonQ+Upn?=
 =?us-ascii?Q?wqk0nkssiyJqB30ttYWH2XejBzHOqPcZGKM6bkwXcHewvXmZL+8LvQQa386y?=
 =?us-ascii?Q?t6yA5pLJaTc/fiwxCJijJjmg1vTcSDYlDtp9rxuokrRmqbhPYbdQjvtVWMWT?=
 =?us-ascii?Q?OJadlfCop2XaK39AVdQbEHoXGKi7BrL2eDW11Asr0U3QQwwLRZ3C/z+pmbSo?=
 =?us-ascii?Q?kPwy9OrD2HrTYbmveQQhw9o8MvyGpsMSbW1h5qAQV88Z6mfIqzzGGE/RldMC?=
 =?us-ascii?Q?IjNijYoKeAcUxt3Kx35JrLWVXpTi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 12:09:43.1805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b0d8bc-3ed7-401a-7443-08dcb7a2fcba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7820

Hi,

In https://patchew.org/Xen/20231116145032.1651305-1-Henry.Wang@arm.com/, Henry has
reorganized some of the code between the MMU specific and generic files.

In this patch serie, we address the remaining code reorg so that MMU specific
code is cleanly separated and we have added stubs wherever necessary to avoid
introducing if-def.

Ayan Kumar Halder (4):
  xen: arm: Add a new helper update_boot_mapping()
  xen: arm: make VMAP only support in MMU system
  xen: arm: Move the functions of domain_page to MMU specific
  xen: arm: Enclose access to EL2 MMU specific registers under
    CONFIG_MMU

 xen/arch/arm/Kconfig                 | 7 ++++++-
 xen/arch/arm/arm64/mmu/mm.c          | 5 +++++
 xen/arch/arm/arm64/smpboot.c         | 6 +++---
 xen/arch/arm/include/asm/mm.h        | 2 ++
 xen/arch/arm/mmu/Makefile            | 1 +
 xen/arch/arm/{ => mmu}/domain_page.c | 0
 xen/arch/arm/setup.c                 | 2 ++
 xen/arch/arm/traps.c                 | 6 ++++++
 xen/include/xen/vmap.h               | 2 ++
 9 files changed, 27 insertions(+), 4 deletions(-)
 rename xen/arch/arm/{ => mmu}/domain_page.c (100%)

-- 
2.25.1


