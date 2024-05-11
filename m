Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECFE8C2E4A
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 02:57:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720143.1123209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5b2J-0007dK-JN; Sat, 11 May 2024 00:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720143.1123209; Sat, 11 May 2024 00:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5b2J-0007an-G7; Sat, 11 May 2024 00:56:27 +0000
Received: by outflank-mailman (input) for mailman id 720143;
 Sat, 11 May 2024 00:56:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0W/u=MO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s5b2I-0007ah-KU
 for xen-devel@lists.xenproject.org; Sat, 11 May 2024 00:56:26 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48c17f15-0f31-11ef-b4bb-af5377834399;
 Sat, 11 May 2024 02:56:22 +0200 (CEST)
Received: from PH8P222CA0027.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::28)
 by MW4PR12MB6852.namprd12.prod.outlook.com (2603:10b6:303:207::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.51; Sat, 11 May
 2024 00:56:18 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:510:2d7:cafe::4e) by PH8P222CA0027.outlook.office365.com
 (2603:10b6:510:2d7::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.51 via Frontend
 Transport; Sat, 11 May 2024 00:56:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Sat, 11 May 2024 00:56:17 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 19:56:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 19:56:16 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 10 May 2024 19:56:13 -0500
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
X-Inumbo-ID: 48c17f15-0f31-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xq0vkuxLdWo/Sc9lYOLJ6B2ZllopHfG61h6VmuHNFUpETa/NJxVuIBY46PYhE8sASSoV8fx6Js9MDZ58kAIWlqEjaql481/EWo2u2uNdxhLmKcVYChiG3tNWJo6GKyHqvusuNTC0YQdkR9+/O5sCEsdeq+y2WLAaPwub/fRoRGKdiLYI+81iV4bIf/QoUMH/zFDAV2Z9l6hwFY5FKinTOBcOVLgxCr1D/1PWD5vWTRy0oRPNaUmR7m+SY1Z+oM8wBjhRf5fplDk2KdjAM8s6RTsjBk8YgX6Q98ZDN8CUsFzoFsNVfm28rhQ8vkwytJVOC6hVCUfLxkotMfjbB5P7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yo+gmdMoRH1k9Ot7fqaAxmEZs90haIiaP3UwHtp3dho=;
 b=B8mrNgr6UNA4cCLtx+fDXsFYtiGtJtwVsAcJwU1YY8oshEOXeImokMe5j+TIHZgDRy0jXlOJq7BpS83bVzWoxjJtjNyJEG3qVQ+UguXRA78+f3gI4+v66Q+Yr7WzVVYT9km/91fq9ST6FGQnWKxv8Ed+UA3h8TDMHsAF80J7csmQFlXW/xJOk2rWEEh4RnE6WaECsoI9ZWaspRwcHmXny2VLiDH9apEzOqXVvVTMV3g7JO5lxKK988JS+Od+YfypwLt1w+e3loGKtf8tU8595gMk79fhJNZhDs4tli+yv74woD9sL5YdfxK1aoF6mmuX5I3+JoUQAZ+KiNAFpjLdMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yo+gmdMoRH1k9Ot7fqaAxmEZs90haIiaP3UwHtp3dho=;
 b=dApnrCrvPlJx6S4cad82eHv2l7zgVda/owLMBVBuLKdcNaicASk4uHzVyAGp6qqjUbY+e27Ea4ruwUgr+vB8I5jGQGPDS1b8hyGFxohx+YP+4L4cjn+vUSKxS0EuhtE8zEBDWdpNLhXBIMvffZ+Gwuv+rYXzP8iTAfObkpALpnQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/4] Guest magic region allocation for 11 Dom0less domUs - Take two
Date: Sat, 11 May 2024 08:56:07 +0800
Message-ID: <20240511005611.83125-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|MW4PR12MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: 543b58ec-639f-4d09-ed50-08dc71552a41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|36860700004|1800799015|7416005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8HJAi+UQMJWSpWcWeyUfkoXQq8ER/v4PMkUoAEksdV/pN/s9Mw8LsbBSmXz1?=
 =?us-ascii?Q?ZyXacuVXPKTA8lKwR21p5SVheC/yWQoCCKHejAh1d7CFAIDT+jG77KG6CIhG?=
 =?us-ascii?Q?skyG1sbDuaTWM2eO6tc5D17Mp38lkvmHlpHHTjPMMFVBjn23iPkN+8UVPWeT?=
 =?us-ascii?Q?3qQZYahRMKAACdiKMNi07jLz1cFLFqksbY9Wk4oz/ZoFBHTzIFFD1NQOg/mV?=
 =?us-ascii?Q?TB2t5bBjZtLTI6fvQ0kmcBWQ+Qjm/E/BjZyLXF7pMuZNQvOSxsQdzw85PKuX?=
 =?us-ascii?Q?angmdMjWn1U4GIDO4o+4wNBJoGtdRBdJItUIXjX4IiPi048jpsfTKn+MX/5Y?=
 =?us-ascii?Q?0mzv6ZH+jP8Gi9oZxFoP+BOS4NrComKQ2Xf0HMmnNFRKtkcgw9og8BQxqFI2?=
 =?us-ascii?Q?rtLQKfw0Sa6GQ2sm9RXZLhV4umylz3Mr1VpXPqEbSLBt8wLRgIUmx31vdkGW?=
 =?us-ascii?Q?N+MWf47CrbR/LNwRgJ+0qLdOeUM1++ArFSQARC5JQPDBv/8lEGKe5ymNPNL/?=
 =?us-ascii?Q?Ml27EI/bux37eOzL4mIzMz2Xlvps7aRjM2AROy6k8zWDyO7LRzZEwCdGcJYf?=
 =?us-ascii?Q?PjYS/YdG4tIgwXO4GtNuL3yDQZmRBva4buCMEDbHDZgnYbhi5Gn5cRzJFf6j?=
 =?us-ascii?Q?/amfJBkzdkaN4hlsbhjarBexv4PP+V6MIN70A7lsyRHblYO/y1vuabV+TbCO?=
 =?us-ascii?Q?OWAiDU4EfXxMIvFJgqw10PUZDcvdkDKMF/p8Yrwfdn1D5FpsVuyQXbJWpz1m?=
 =?us-ascii?Q?LEdwDtrHO/OZAF00C4u+XwbZp2yLGIXbQp+BOg2kiV8N31uIMacUijCplPgq?=
 =?us-ascii?Q?c23Ywyt5JN59wK4aeIFCP9oJl11UiOOXygHvzkjRPNBJRwY6I6YHjGRTbXzv?=
 =?us-ascii?Q?2309HZM27BNoONcs03OxKFXVqnuyx+J/YkOLeKrnNkLHhi3gh2WNvl0grnFy?=
 =?us-ascii?Q?vNYKbrmZ7GLCibDaf3v5YjakB8ONagOktOmx6qlq17hNnzbF3kAf23WC6+H0?=
 =?us-ascii?Q?s9/4ecRK6oXi6qLTgloOwy44VJlkiPkJQcASD2YqoyfQgnD6BuvyQczq9uPn?=
 =?us-ascii?Q?hMnP6zyHy5kljNJjkibkhskpE3O5uDqOqGJ3C86aXmBUqgSNqgfNacqKQNbu?=
 =?us-ascii?Q?6M9hA3UlmmMxrbH0/z6gtun6cEGRpzPV72FaxV4lguDwxcGjCo8IJ4n4qvM0?=
 =?us-ascii?Q?It2aErI/spOD1ZrznBCCjcXSJN+5SDF6v4RqXDgmatNc4O294Wv26jb1z4HX?=
 =?us-ascii?Q?vVvqt4nIG+OMruda8qqM1S5L6mJxHtnHTu/d8hUiBJz1vwkkJoHYKXHfpP2D?=
 =?us-ascii?Q?cio20KcBTpC9opXs/JhakyWK1hkPu2Gf2yGCqLHD68hDlA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 00:56:17.3796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 543b58ec-639f-4d09-ed50-08dc71552a41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6852

Hi all,

This series is trying to fix the reported guest magic region allocation
issue for 11 Dom0less domUs, an error message can seen from the
init-dom0less application on 1:1 direct-mapped Dom0less DomUs:
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

In [1] I've tried to fix this issue by the domctl approach, and
discussions in [2] and [3] indicates that a domctl is not really
necessary, as we can simplify the issue to "allocate the Dom0less
guest magic regions at the Dom0less DomU build time and pass the
region base PFN to init-dom0less application". Therefore, the first
patch in this series will allocate magic pages for Dom0less DomUs,
the second patch will store the allocated region base PFN to HVMOP
params like HVM_PARAM_CALLBACK_IRQ, and the third patch uses the
HVMOP to get the stored guest magic region base PFN to avoid hardcoding
GUEST_MAGIC_BASE. The last patch will update documentation.

Gitlab CI for this series can be found in [4].

[1] https://lore.kernel.org/xen-devel/20240409045357.236802-1-xin.wang2@amd.com/
[2] https://lore.kernel.org/xen-devel/c7857223-eab8-409a-b618-6ec70f6165aa@apertussolutions.com/
[3] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2404251508470.3940@ubuntu-linux-20-04-desktop/
[4] https://gitlab.com/xen-project/people/henryw/xen/-/pipelines/1285727622

Henry Wang (4):
  xen/arm: Alloc hypervisor reserved pages as magic pages for Dom0less
    DomUs
  xen/arm: Add new HVM_PARAM_HV_RSRV_{BASE_PFN,SIZE} keys in HVMOP
  tools/init-dom0less: Avoid hardcoding GUEST_MAGIC_BASE
  docs/features/dom0less: Update the late XenStore init protocol

 docs/features/dom0less.pandoc   |  8 ++++---
 tools/helpers/init-dom0less.c   | 40 ++++++++++++++-------------------
 tools/libs/guest/xg_dom_arm.c   |  6 -----
 xen/arch/arm/dom0less-build.c   | 35 +++++++++++++++++++++++++++++
 xen/arch/arm/hvm.c              |  2 ++
 xen/include/public/arch-arm.h   |  6 +++++
 xen/include/public/hvm/params.h | 11 ++++++++-
 7 files changed, 75 insertions(+), 33 deletions(-)

-- 
2.34.1


