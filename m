Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B0789682C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 10:16:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700364.1093389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvna-0003oq-I2; Wed, 03 Apr 2024 08:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700364.1093389; Wed, 03 Apr 2024 08:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvna-0003lU-Es; Wed, 03 Apr 2024 08:16:46 +0000
Received: by outflank-mailman (input) for mailman id 700364;
 Wed, 03 Apr 2024 08:16:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pmYG=LI=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rrvnY-0003ko-Ko
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 08:16:44 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fc497e2-f192-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 10:16:41 +0200 (CEST)
Received: from SA0PR11CA0203.namprd11.prod.outlook.com (2603:10b6:806:1bc::28)
 by SJ2PR12MB8830.namprd12.prod.outlook.com (2603:10b6:a03:4d0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 08:16:36 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:1bc:cafe::4) by SA0PR11CA0203.outlook.office365.com
 (2603:10b6:806:1bc::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Wed, 3 Apr 2024 08:16:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 3 Apr 2024 08:16:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 03:16:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 03:16:34 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 3 Apr 2024 03:16:31 -0500
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
X-Inumbo-ID: 7fc497e2-f192-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnjP4XEDgfg4oEAthI6FZk80NTl2MV+iyD3OSqK++BJ2EFN3xeLBnpBNcrDpsOQbyWGizm0L/Mj29Uc/1MldHVOoyGXm0g8r8U0JqRXvaPseAjB0ehjaeTnDi+2z/avlScXepwx618Dsy/p8A6XX1ZkfobaCi9/yhsJcJC1b0mHYcBI54EvGDk9MG9ybS9jq4hH8jjLpxFJ/EdVH9oFwgkybH3MVTc1+0OcWGQUMQmq1ZS3l6bOhm75eWBqhPAc/y0ls3GhMcMdTg9Qoit+5oHZN7gdHc8WHdxBfTVGzqs0Weg9givXi4G7o8yucZJvihziIOL07LVKRrrTT0yFCLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shwxAnYik38Fuwf+xRsQq+WZDXb5Gq5iIlZdElM45SI=;
 b=km+cCAZ0ktSsiNpQrd2uYHoM7OO/7lZuMQ5xc0Se0P+/EAy8ZMt9sbGRIlbOMeNXfB/gkR8L1JjmV8GeAf0Aqj3jqaAi1MyR7BbYpNrcYmpxijpkJo1G1BBCrzREzVZZevdbdyBJhHvS575seBkiNcWCLvNMjl1g1W1QrNFQ1rNd9ds6FKvXG/VoKC3tI5wWWAQys90EbDgvAipLu3vZM2Fncr+NR/q7kCtLgatA2xvkoaImRvtkVyxXMqU6LDciSeEcm7mLNsyL5LVNPU/ZOOG8A6I0EnIkcthSkqsSvczWDvEaU/vy6L3oiBQjBHi4ErqYTzDN/28DBoYA7lAHBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shwxAnYik38Fuwf+xRsQq+WZDXb5Gq5iIlZdElM45SI=;
 b=ShwoqNrHfh1OZuomphgN7hAYvi8gQu6HU3V+FgVaeTjVpJCNxYWF3oMhc3sPYUiWCxHubcxVelinONSvLc5aKMV+v8Vo1vCf9WFpVb+cvjYnIklHhFk0Ege4jMXDhmbXHCgUaqm/K747x0c+4sZhdHI7tdAl/uiS9/VdIHSOKbc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/4] DOMCTL-based guest magic region allocation for 11 domUs
Date: Wed, 3 Apr 2024 16:16:22 +0800
Message-ID: <20240403081626.375313-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|SJ2PR12MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: 233e969f-380e-473c-35f2-08dc53b66107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xZYTNQZlL8TjaH6fLdLqCnC65t7Bngo3He71KYcJbwGzX7dm6aqn+kmpVzWIYuHvk4fJqN4D9AD6N7EAcQjmpV/hEcbkMhF3wE3qIXSI6lhDjZjqS8md32DZDxdjbNM/AXfNOQFFTBwGjgDf+ExV0D/sAdDoSsgb6FOxWRtwjwZSyPQ4Y68uwSs5csjESBJQH4o7pzfBogo7LxsUGAJnR0BES0fW26sQsNMCl84syANiT/4JsinCQLOZN7l2dt8v03afR9O2pvSh+Np4BCGko2YsB2xlOjtc0J77MDHbW2wLv6s9nJadMqLg1sgD54Kv6ZCtax/m6LIbH35Rdg6wQ0Nlp/PcIhWd4T0Josug4icUtLBD/YP5mlR5r4Rm4Ba6teWfHZ6F2gjNyVLAHbs+aXD+IJxSD9P79qnaXNmJPjLjT6RwReAxppErIFJOKm3uz5CXCBr78Ej0W0ctCviFvbQwfhcAJP7uOUOJLxGPNKyjiKP6/WBBtPaMFpyNK2kkY6zO0NTryNdLm1lcam3uVsOg0FjstfagmKVydWC0IEaVYsgcKM5vIv2jjYmYy+5UbpFq9hZ3gcp/RzxuMoodP4FBg2+HgErAUzHTiaX/x0IkS21HYJy2EvPSrYxZei0XjGMLzLbg4p7gSLhoZCom+7t4WY12ideqKDnBo1qEZXIPA8IuXn3N8znI+G6PqYhM/k6GrpDo8XdBZSQLDgyFBpZ7W8WmKTTH1CLO3g35dD20cC9Py8qB1R5qUNLebaW0
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 08:16:35.4283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 233e969f-380e-473c-35f2-08dc53b66107
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8830

An error message can seen from the init-dom0less application on
direct-mapped 1:1 domains:
```
Allocating magic pages
memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
Error on alloc magic pages
```

This is because populate_physmap() automatically assumes gfn == mfn
for direct mapped domains. This cannot be true for the magic pages
that are allocated later for 1:1 Dom0less DomUs from the init-dom0less
helper application executed in Dom0. For domain using statically
allocated memory but not 1:1 direct-mapped, similar error "failed to
retrieve a reserved page" can be seen as the reserved memory list
is empty at that time.

This series tries to fix this issue using a DOMCTL-based approach,
because for 1:1 direct-mapped domUs, we need to avoid the RAM regions
and inform the toolstack about the region found by hypervisor for
mapping the magic pages. Patch 1 introduced a new DOMCTL to get the
guest memory map, currently only used for the magic page regions.
Patch 2 generalized the extended region finding logic so that it can
be reused for other use cases such as finding 1:1 domU magic regions.
Patch 3 uses the same approach as finding the extended regions to find
the guest magic page regions for direct-mapped DomUs. Patch 4 avoids
hardcoding all base addresses of guest magic region in the init-dom0less
application by consuming the newly introduced DOMCTL.

Gitlab pipeline for this series:
https://gitlab.com/xen-project/people/henryw/xen/-/pipelines/1238005196

Henry Wang (4):
  xen/domctl, tools: Introduce a new domctl to get guest memory map
  xen/arm: Generalize the extended region finding logic
  xen/arm: Find unallocated spaces for magic pages of direct-mapped domU
  xen/memory, tools: Avoid hardcoding GUEST_MAGIC_BASE in init-dom0less

 tools/helpers/init-dom0less.c            |  36 +++++--
 tools/include/xenctrl.h                  |   4 +
 tools/libs/ctrl/xc_domain.c              |  33 ++++++
 xen/arch/arm/dom0less-build.c            |  11 ++
 xen/arch/arm/domain.c                    |  15 +++
 xen/arch/arm/domain_build.c              | 131 +++++++++++++++--------
 xen/arch/arm/domctl.c                    |  32 +++++-
 xen/arch/arm/include/asm/domain.h        |   8 ++
 xen/arch/arm/include/asm/domain_build.h  |   4 +
 xen/arch/arm/include/asm/setup.h         |   5 +
 xen/arch/arm/include/asm/static-memory.h |   7 ++
 xen/arch/arm/static-memory.c             |  39 +++++++
 xen/common/memory.c                      |  22 +++-
 xen/include/public/arch-arm.h            |  11 ++
 xen/include/public/domctl.h              |  27 +++++
 xen/include/public/memory.h              |   5 +
 xen/include/xen/mm.h                     |   7 ++
 17 files changed, 339 insertions(+), 58 deletions(-)

-- 
2.34.1


