Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF28B2EE2
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 05:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712371.1113015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0C3N-0006Tx-36; Fri, 26 Apr 2024 03:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712371.1113015; Fri, 26 Apr 2024 03:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0C3M-0006SI-WC; Fri, 26 Apr 2024 03:15:12 +0000
Received: by outflank-mailman (input) for mailman id 712371;
 Fri, 26 Apr 2024 03:15:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9cwh=L7=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s0C3L-0006S7-KK
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 03:15:11 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2405::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e56ee77-037b-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 05:15:06 +0200 (CEST)
Received: from SN7PR04CA0221.namprd04.prod.outlook.com (2603:10b6:806:127::16)
 by MW4PR12MB7031.namprd12.prod.outlook.com (2603:10b6:303:1ef::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23; Fri, 26 Apr
 2024 03:15:03 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:127:cafe::9d) by SN7PR04CA0221.outlook.office365.com
 (2603:10b6:806:127::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.29 via Frontend
 Transport; Fri, 26 Apr 2024 03:15:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 03:15:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 22:15:02 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Apr 2024 22:14:59 -0500
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
X-Inumbo-ID: 2e56ee77-037b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fE8CYxCAvU8JPn5UKin77WngaybzfFvz+MMkacnE4eIljHLNk5MRwByqeR9dKjz/Xy/DBYtuXqxZJWkXUNBpOAB7DGVuBVlVdTG3SUTzsZhILpwknEY48V+KY94a9FyHyEYsIqAxN+rmQWOEFZGIfmDE25LVjbnZ7T7zjPYqrLFf2i4Zau/zuo98o3x0910W/pzbbPZAj7Ojg7V/49X1Z07whJGMh8B3lUn8NTP8fqdOdacPb61YH+aB//8YjyV0w16lM2tvC8YMv0C56hYSkQLVQXXR0VkKukB7iuytOExu8UMCry9vnx6mUjfoaGR/PrZSO+/BOuE2BL5duRwFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4l3odQmbIy9nPjdAMVrsnL7NEqUmVisHZ2I+y7GLVE=;
 b=OnhvsvbmAGb86jht+9ewMyWrJGYuM0eQRvCCzBafqToRHU6OsDc4bJGrbLtTM6R4bnm+3wuJPOgdUXbP7nCNw8PXKJckChrUOn8imYTjWvGDrIIny000gmpohx2UqB/sHzpx8I5hjRmm4vUJGFU4ZrDYcaQk7fT7AkN+7tw2g1X/lNV4SylMYm/3zvKZr64Mk5RCE/3LFJ8m/qcV0fJGt+JkAKl/LPtcSIkJ0gdkTXzm77mMrFNU7mVP7MBXZx5dDcuJsQM+4AOqabtZSDUpcmFzb+QwkJo9+jvPTyqGAY012bYjkjvKrhCn5SDyBiMVV/7YZGSQKwE+3tnGD8nniA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4l3odQmbIy9nPjdAMVrsnL7NEqUmVisHZ2I+y7GLVE=;
 b=BAvIBun5jgCSa+bfDjFTPcZ0xUtNKaQML74651uipCQa+ydapYOV73/Sw0HZUjDstbOSUnbZoHlZcRnINxA/5fwzcUC/z3kKb5UlaUgRtXi/0n4rnGhCBzWwwc8XgUG5RRs91D1PHuc030qox4EWkqp8II8AocgL1y3R0CAWWqc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, "Jan Beulich" <jbeulich@suse.com>
Subject: [PATCH 0/3] Guest magic region allocation for 11 Dom0less domUs - Take two
Date: Fri, 26 Apr 2024 11:14:52 +0800
Message-ID: <20240426031455.579637-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|MW4PR12MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f40c87-390d-4026-c353-08dc659f106a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|7416005|36860700004|1800799015|82310400014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JjhYW7rQSjrH7GUUwCf1v2J8IKbHyETSqvDDih9v/hYo97zDWArd61x2/sBq?=
 =?us-ascii?Q?Ds40lrcdztsWL68jVVubTYfRA7f9394BvUJ4BR0e8MyF5jeca9UJQ5qxZpMo?=
 =?us-ascii?Q?SuAGpV5GSf+cHw+ZylCfCVitOqKWBqfLJzQYrZPfmmgvt4ALNTwxVGmYP0nN?=
 =?us-ascii?Q?2TG61sbjIv5mVXxjN0/2nZu81uousopy6WfTXsiPnkn9pZu+2fhYrHTFdguK?=
 =?us-ascii?Q?GjHU4hfSEZfZ+YH9v9KcvRfnOO+zolZhqzAeK/8T5/yFPGPAwcsOGmkyitwb?=
 =?us-ascii?Q?glBO/3vif4ugzUUsuWgLiZvVzvEzOomehYWy6U+Wl6CwDDMq/6/17I/4lYYy?=
 =?us-ascii?Q?C05g0G+6XWIvf/40RtBO7ZMOHYqgUyEHJCto4ctK0yer/AXrOGTkvS8H1Xhj?=
 =?us-ascii?Q?NpQVcRdaOXy/bzRtjDFBJz40b3ZbsQqCxqlLTGpZjQzGAXQ2mqAfhHuyzdcl?=
 =?us-ascii?Q?9RADh2A1H7xYDxbI3uqxvzX94znCCa8o5gLYAZskiByNelkKEMy7IaQEuYQe?=
 =?us-ascii?Q?uHxd8BcGZ99ponu6Fgp7fIgFWMU8msxFcsMFArNnEE8s5vicRXb3KLbj8y2w?=
 =?us-ascii?Q?vGqKUiFqdzw6rq3vV3O6BAoNOjgni9NBM0folclNSoJMPArxHEkWxn4Aksov?=
 =?us-ascii?Q?fBKrj2eLv+5dxlzaBHms6StHqN3t+8PJ3STApBWOh879EfYnyrA3xQdhCa+g?=
 =?us-ascii?Q?f3NyH3+X42b2zY/GHjF3rDoEAO6wnSJg1xMllPE4LNP+Z/voKdZSpqeCKd7U?=
 =?us-ascii?Q?bqKj4XBCjmIfkY3l1fhDlC5fMhgVMOjNXhoTfal3ul4B0wEPWbBL/iW9raKI?=
 =?us-ascii?Q?xszRnZBGwzdkzt3seEBFbGEIsKNRRCW8pttttkArlCjoGnnR0rQmitUo4/PD?=
 =?us-ascii?Q?GeXs3xR/X94X0i7dUYIzlawKIZtjrH0TjEpyE1LHUjMgxFvags+l9CWfR/Do?=
 =?us-ascii?Q?Lbjq08rusmadds7r24xs/pBX7q6xXnKu7eAiWnNU77A3uDLnEL2r8k+9otNo?=
 =?us-ascii?Q?7vzDaaeJYL90hz5mb2zrUDAklG1YezhmF8IuEnVkXowp3HqftMuQOhyVwkBC?=
 =?us-ascii?Q?VzzdyljWuPoKUDKRloJTOZJ99wF/tFpLJFPie590nW9AjzJJxy/jShi0pJvk?=
 =?us-ascii?Q?VuY79Lq678CzZc1yvFZzXO/21NNsR2FLOaC1gK8wkL7WW88g1YpjITd7Tdl4?=
 =?us-ascii?Q?5YdGQTcwNOA64T+9cQeW2YxjY78zUyuhQarzN087bHMax28oA6Cc2B1c6tro?=
 =?us-ascii?Q?KwSl3geYDLHQhpw5gqgs/TUtqizh2NaB4wfJJsHEc9rRnWMTNXsQjOD0VX/T?=
 =?us-ascii?Q?s/3IOQwMQvUBnlBXIN7fW7OpSTKbh3/JwxG7cEHit6KPbBMgpk1fowVJZIZi?=
 =?us-ascii?Q?XiluxhiRRsxAgVSKP9c8eECULDR6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(7416005)(36860700004)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 03:15:02.8625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f40c87-390d-4026-c353-08dc659f106a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7031

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
GUEST_MAGIC_BASE.

Gitlab CI for this series can be found in [4].

[1] https://lore.kernel.org/xen-devel/20240409045357.236802-1-xin.wang2@amd.com/
[2] https://lore.kernel.org/xen-devel/c7857223-eab8-409a-b618-6ec70f6165aa@apertussolutions.com/
[3] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2404251508470.3940@ubuntu-linux-20-04-desktop/
[4] https://gitlab.com/xen-project/people/henryw/xen/-/pipelines/1268643360

Henry Wang (3):
  xen/arm/dom0less-build: Alloc magic pages for Dom0less DomUs from
    hypervisor
  xen/arm, tools: Add a new HVM_PARAM_MAGIC_BASE_PFN key in HVMOP
  tools/init-dom0less: Avoid hardcoding GUEST_MAGIC_BASE

 tools/helpers/init-dom0less.c   | 38 ++++++++++++++-------------------
 tools/libs/guest/xg_dom_arm.c   |  3 ++-
 xen/arch/arm/dom0less-build.c   | 24 +++++++++++++++++++++
 xen/arch/arm/hvm.c              |  1 +
 xen/include/public/arch-arm.h   |  1 +
 xen/include/public/hvm/params.h |  1 +
 6 files changed, 45 insertions(+), 23 deletions(-)

-- 
2.34.1


