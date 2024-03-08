Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D85F4875C2A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 02:55:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690075.1075738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riPRj-00028C-Qi; Fri, 08 Mar 2024 01:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690075.1075738; Fri, 08 Mar 2024 01:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riPRj-000268-N9; Fri, 08 Mar 2024 01:54:51 +0000
Received: by outflank-mailman (input) for mailman id 690075;
 Fri, 08 Mar 2024 01:54:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfa=KO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1riPRi-000262-P4
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 01:54:50 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20602.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d78fdf4e-dcee-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 02:54:48 +0100 (CET)
Received: from DM6PR10CA0001.namprd10.prod.outlook.com (2603:10b6:5:60::14) by
 PH0PR12MB7010.namprd12.prod.outlook.com (2603:10b6:510:21c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Fri, 8 Mar
 2024 01:54:44 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:5:60:cafe::9b) by DM6PR10CA0001.outlook.office365.com
 (2603:10b6:5:60::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27 via Frontend
 Transport; Fri, 8 Mar 2024 01:54:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Fri, 8 Mar 2024 01:54:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 19:54:43 -0600
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 19:54:38 -0600
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
X-Inumbo-ID: d78fdf4e-dcee-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNuE5xxsvFf4xHIugzT8Xm6ceMac17QjOcve+bIo68ipvAzytXEtJDELHgLh0PfFAquexVWxKc1cumvQCJ3nO7iTY9gaOFI5bVBQxeV2/dDRcGDi30BRsBO08tz9hfJMgPnU+/Hu5Eogywvi+xgVFx8JcSBU1vAxLRV90n3gqIQDPqDDZBa+gi8TniYRQqHO5e/1Ei4x3EvtmTnAINDLGSu54isA144MwiHbUv9yGADlQuKsi1gTWBl41NFqjjdgwOZoZiseRtVSjLBCvG4BGh0P5eHpnzq14am6jbashu32+/pD5NbhM3hEEwsUxs4gIvDWA9fwVynwvajAER7q6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhUdtdfcxsQe269IkHKqtEwCey5V9ybQdEKmYerVnUM=;
 b=hoNJmeMXSoGSx9zUSDAOzAofVMkbge7EcYZYwrN6jGDQwzWX+GmNKq8gg7VNmckS4YzmGoKzZnJ4eDJ1DNHE8YsF/9bgFn7adsbN8BznxwAsnNhDl06k99+wgKxzVFwAzIkFAhMFVbB5ND9PXm8fAP3zq94ylQ/lkNt7tdOMgxkOR06gHjZjQgTqr+mw/fKbmvsuDnZaQtzPLq0JjtozDzAnD9JDJaIjaWus4kVW+oKXmPlrtE2+Ix5Az0WaG081n/xQtm1jRfnQuSe0Uk1GE8i2WBZ7oKEBqNHr0Ly8454rRiuLDp9Oy7Imrmav9KZ5tmwrAJ+BAXZH447DKF7Duw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhUdtdfcxsQe269IkHKqtEwCey5V9ybQdEKmYerVnUM=;
 b=D1W5aYFB/iZGkco2/plYdO7HKqwdNWUi/Os5C5FnoNwINBGpQEgQd38ZX7L7vhhMNMJ23cbPH5lWJ+8KKoVnP5luLhvX97wKEPpCspeBPxe3zQx/PEX3QVaaADWr9v0LIbK0hvEPOUGCo4+XE2YvhrPDUMAjls0ilgZGhc4rpP4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>
Subject: [PATCH v2 0/5] DOMCTL-based guest magic regions allocation for dom0less
Date: Fri, 8 Mar 2024 09:54:30 +0800
Message-ID: <20240308015435.4044339-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|PH0PR12MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: 1528252f-2a49-4dc1-c6f7-08dc3f12b9b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QApuq2I/5jo41AUlwKjCZbFfkPNGDTO46qJuEFKoFhM+0b5xNWY5CG97EPWhTgi76j7acTz0QehJ11G6KrIGrP9iJtE8flETBhqPWU+MYucxgTLWlYwy4YznZLVkSpulMoBJHZTFUhniAWVUuHr7xemPul3wvsxPE/Ryrn1kIjwW8iVdIxx/VWmZu6LRcf2YD5B673BV0/d66nh3EL+stxRVwdN35lWtFb4eOiBKYgQnSDqkE/xMt72jeDX8YkBiI6SOvNegzumRvyQj1GfICSw21X7Sp5NmILUhZ5z9yHMyGeboErF9/yjVv5+mrQfxKpLFVz8ICoLmj8qdmMKacD0XkQnYjdcETfqTs97LiRqvEQKKUrlXYCiwX34etYbgFAC67myT49HAA/VLCBjR2TVI5k41s00KmuePVq62QEd0Gwdub7CaRYoDYDiTE1rZmxmPh7Vq2P5EYISPqmcWtByzd3w4MGqFZrTDCXrkeNuEUODjREmQlllzurxF1Ivfok8HRrIb3PUFZpk+aatrvS8UNWiivuAJ6GOBLFLqanHeTmb69KF7yQ2bHsBIKG1vgC7ASi5+xpSCOancQfYCD4b0D6sgYoj1SIOgH38Ym3p8HBXDD9ylHfW/2xwnX6Uxx9bTaONqN1n+oA6/OmzdAa0KkhuNSB35n6Fx9rx+LiH4a6iw37mCgiQPPlu/advAsXOh7GKZQRyxMy3z3NmdIwWYDkqkQ5iFRUZnBY+KBXvOeoOtow3oVtVZkXX1qHNh
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 01:54:43.6892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1528252f-2a49-4dc1-c6f7-08dc3f12b9b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7010

An error message can seen from the init-dom0less application on
direct-mapped 1:1 domains:
```
Allocating magic pages
memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
Error on alloc magic pages
```

This is because populate_physmap() automatically assumes gfn == mfn
for direct mapped domains. This cannot be true for the magic pages
that are allocated later for Dom0less DomUs from the init-dom0less
helper application executed in Dom0. For domain using statically
allocated memory but not 1:1 direct-mapped, similar error "failed to
retrieve a reserved page" can be seen as the reserved memory list
is empty at that time.

This series tries to fix this issue using a DOMCTL-based approach,
because for 1:1 direct-mapped domUs, we need to avoid the RAM regions
and inform the toolstack about the region found by hypervisor for
mapping the magic pages. The first 2 patches are simple clean-ups.
Patch 3 introduced a new DOMCTL to get the guest memory map, currently
only used for the magic page regions. Patch 4 uses the same approach
as finding the extended regions to find the guest magic page regions
for direct-mapped DomUs. Patch 5 makes the init-dom0less application
consume the DOMCTL to avoid hardcoding the guest magic base address.

Henry Wang (5):
  xen/arm: Rename assign_static_memory_11() for consistency
  xen/domain.h: Centrialize is_domain_direct_mapped()
  xen/domctl, tools: Introduce a new domctl to get guest memory map
  xen/arm: Find unallocated spaces for magic pages of direct-mapped domU
  xen/memory, tools: Make init-dom0less consume XEN_DOMCTL_get_mem_map

 tools/helpers/init-dom0less.c            | 22 +++++++++---
 tools/include/xenctrl.h                  |  4 +++
 tools/libs/ctrl/xc_domain.c              | 32 +++++++++++++++++
 xen/arch/arm/dom0less-build.c            | 45 +++++++++++++++++++++++-
 xen/arch/arm/domain.c                    |  6 ++++
 xen/arch/arm/domain_build.c              | 30 ++++++++++------
 xen/arch/arm/domctl.c                    | 19 +++++++++-
 xen/arch/arm/include/asm/domain.h        | 10 ++++--
 xen/arch/arm/include/asm/domain_build.h  |  2 ++
 xen/arch/arm/include/asm/static-memory.h |  8 ++---
 xen/arch/arm/static-memory.c             |  5 +--
 xen/arch/ppc/include/asm/domain.h        |  2 --
 xen/arch/riscv/include/asm/domain.h      |  2 --
 xen/arch/x86/include/asm/domain.h        |  1 -
 xen/common/memory.c                      | 10 ++++--
 xen/include/public/arch-arm.h            |  4 +++
 xen/include/public/domctl.h              | 21 +++++++++++
 xen/include/public/memory.h              |  5 +++
 xen/include/xen/domain.h                 |  3 ++
 xen/include/xen/mm.h                     |  2 ++
 20 files changed, 201 insertions(+), 32 deletions(-)

-- 
2.34.1


