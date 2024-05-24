Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17878CEC82
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:55:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729961.1135302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdoq-0003jA-Aj; Fri, 24 May 2024 22:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729961.1135302; Fri, 24 May 2024 22:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdoq-0003hW-7k; Fri, 24 May 2024 22:55:24 +0000
Received: by outflank-mailman (input) for mailman id 729961;
 Fri, 24 May 2024 22:55:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAdoo-0003hQ-91
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:55:22 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b12c02b0-1a20-11ef-b4bb-af5377834399;
 Sat, 25 May 2024 00:55:19 +0200 (CEST)
Received: from MN2PR10CA0017.namprd10.prod.outlook.com (2603:10b6:208:120::30)
 by DS0PR12MB8271.namprd12.prod.outlook.com (2603:10b6:8:fb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.19; Fri, 24 May 2024 22:55:16 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:120:cafe::76) by MN2PR10CA0017.outlook.office365.com
 (2603:10b6:208:120::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Fri, 24 May 2024 22:55:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 22:55:15 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:55:15 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:55:15 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 24 May 2024 17:55:14 -0500
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
X-Inumbo-ID: b12c02b0-1a20-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P86ml2ImLLdk0tR6fwVig6HAwv6f1oKe4wo8swBuavm1i8csO3VXvyeV881K++Xq8A6jePiAwrevgE8xTpb0aAAhxUki8hBPZee+S0mC387RSMuGT64JZGHq5sLoQzqmX+AWl558TsUP0MUdyhk7cjINDMRqXJAOp1D8K9XNkBX/Ww85+jkuX+pGU6WvCZ0mP7FJboaDs3gBe5/8RwVG7tw9Gfrkc9IuaoUFYc+19aWp41Re3x9Znx2YdXEWXJZYyW1hrDy7MFM66s+jv9EoiVoYux6BTLEyG1rMO9FK8QnSS3jBoHqZh9IrbR1DE+UPWxZTh8hpQtwxMhKdhbV4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zd6BFqoJqToWgUD+RZyQpDUm3wIFhBhW1r1MhJgBycU=;
 b=HCtN/bF8na234H4nRW/nRWfKOqQ5OcMBtDCUCqZ5J2UaFzHdQC7vQyI80/VdGc1UukNqEGuBRksbRtbAVUId6G54hM9PeDQ4rYNa4JW2XhLla12zzjOI+SY/qbnW8l490Xs/uO3kK6nfRuMQCFBIb0jk3iHkiU3geb79GO1W89kG4dmZ0p9HA6zJ5bScqXV1rXs3HpynM6/cFPMrRlPNgqFmH1JBuo7unOk6ti5qmxMyie127IKk1jR+A3zvwryDIM1fOxsd/OueFHeO+ScAN+x4QRuHD8J9T4wkW2XAbcOL3+AqNiboXuCds9iBtpofK4ghKbmpqHfvvrPyrPV3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zd6BFqoJqToWgUD+RZyQpDUm3wIFhBhW1r1MhJgBycU=;
 b=VSsEzGCuLGL5QYFaKjUbZ3QABhzl8S3f8cqLOGZa7b+7qVL+9qURueBlgvVU1fLYZpT0Exp3VglABrRSyn7hERcHrHZn76ifdSde2BbvjwkYAXJP1Rco0ZcJyX3HWtuFVx347YOyu5OmfsQqLxikuJGMGOh7KDDv/Q7Wk+MKcfA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Fri, 24 May 2024 15:55:14 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Anthony PERARD
	<anthony@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/4] Guest XenStore page allocation for 11 Dom0less
 domUs
Message-ID: <alpine.DEB.2.22.394.2405241552240.2557291@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|DS0PR12MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 88e9a090-8f59-498d-f46e-08dc7c4493c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2eIF8jllDoHxAC+ykwwriGf8r73p+yCM5gVA1usKfJHwRUZ89XYCF622QmLL?=
 =?us-ascii?Q?726aSCcRCTAIuxmcPZ77ZeM1Gq1saWWAnZcFYd9jSt6/JvKhF8gZs9YKDPH9?=
 =?us-ascii?Q?4S8P4iZ6W+kuQTOAf+nAUIB/7jDbgh/L+vSsx5dMx0n9Aw1f6ASP8RqbN2uB?=
 =?us-ascii?Q?HPX2agCDaWKETKlWoZNQ0AHW+qbF7FGRSp2bexx5bJc04nDc6Cu/qPgS3LgI?=
 =?us-ascii?Q?ThV+ycnpepWq2wLkEA5vAZWbhD//aDNBssCGbSOVHamsNs8cDVYT/PkInWyC?=
 =?us-ascii?Q?qvF7IScvM4QtKIUx/5P9QpweK53DV201YCk+uYcM4IiGLPqC8fSGRSfJ/b7J?=
 =?us-ascii?Q?iLiZtxaYO0SVOwx/jrZfT/gcjDwkx+YgyQJ/qftATddJAadxAd4DDp+lw9BL?=
 =?us-ascii?Q?3u0uREoMqA4X2l897sYCCF1VMQKm4maHKOcV3zpN+MTLnmvsja+r4POWXcKf?=
 =?us-ascii?Q?V6DjYkKYNGKJnffNsICORSqIkGCiDbx4DkJe0TzhHFEpxRTgJnaGwybXeB45?=
 =?us-ascii?Q?u/DjnB6HLrcDi2MabXU9YN15It5ZgrSVTOprBJIrrj7YtbaGuimfU4tSkFdV?=
 =?us-ascii?Q?+tfbpSp1n6xYCdIPG+pZgmC+h/vEK1b5LeQoswWzhf/O2guc/5pw/+zqZmjm?=
 =?us-ascii?Q?sQ2gnaiz+nJK22W4GyOfTYu3+jEZpeoov0so3d5Tn0BjjA/o+3foNKasXvxq?=
 =?us-ascii?Q?uIkZQ2RQ7uWVX+vE5KuahltRM3MR8yFspcsZGT/dEhRGaBUVHW19PXSfG9Pt?=
 =?us-ascii?Q?lAlvInYqq6kSxquF3DCzOl9SsxdijPJSUP588Ek66wQAEN88efmqEd6O/QU8?=
 =?us-ascii?Q?A2LWoT5VxIXwBVDQFbUdLXoOM9URqyHTBpyYvINmGjUDYOhOLuBvQschkEWc?=
 =?us-ascii?Q?lc3ZeQjs4oKtWhbrf7/tPxc1e+7kW68Fa4nT5EuwZxaZvB90P4xovE+i2CuY?=
 =?us-ascii?Q?ezZop7Fn5TrF1AVbyLUqgDY+fuoZpRwlHP3Xq6/c+D/cXx5osegfnxcpRd6M?=
 =?us-ascii?Q?TdoSrXwQPis0wD0pNQY1R5ghsFnyWH5DwzuajTPVhW6GYCn41Lzwxaid3/Jf?=
 =?us-ascii?Q?Jbr/9EAm84gqkVuMIJhjUoLpktkI0VhBNTj6D0rShblqajtAg8YunqQJXs7Y?=
 =?us-ascii?Q?OvOg6HRaQwhgbFR+7+czZtX79E8WjXxNgXFiQNjL7wzGu1AeXFB8DsIWCArT?=
 =?us-ascii?Q?lwjgwzML6JK3EC2UdYmrujlQSv12DTwQoEIyLOKHp8jTGmZqvwH7ugjOi2y2?=
 =?us-ascii?Q?VBQ/QRTQbRpH22zdfQG5f2VRYlP9O0ueA99iVnSPsBPRAlS3tNQLvKFVPszz?=
 =?us-ascii?Q?HiRU0FcCEcFiFrCYKb6uNqsyFc4p9nl3xl+bxSXkmuH4Xw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 22:55:15.8299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e9a090-8f59-498d-f46e-08dc7c4493c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8271

Hi all,

This series is trying to fix the reported guest magic region alloc
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
region base PFN to init-dom0less application". The later on
discussion [4] reached an agreement that we only need to allocate
one single page for XenStore, and set the HVM_PARAM_STORE_PFN from
hypervisor with some Linux XenStore late init protocol improvements.
Therefore, this series tries to fix the issue based on all discussions.
The first patch puts a restriction that static shared memory on
direct-mapped DomUs should also be direct mapped, as otherwise it will
clash [5]. Patch 2 allocates the XenStore page from Xen and set the
initial connection status to RECONNECTED. Patch 3 is the update of the
init-dom0less application with all of the changes. Patch 4 is the doc
change to reflect the changes introduced by this series.

**NOTE**: This series should work with the Linux change [6].

[1] https://lore.kernel.org/xen-devel/20240409045357.236802-1-xin.wang2@amd.com/
[2] https://lore.kernel.org/xen-devel/c7857223-eab8-409a-b618-6ec70f6165aa@apertussolutions.com/
[3] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2404251508470.3940@ubuntu-linux-20-04-desktop/
[4] https://lore.kernel.org/xen-devel/d33ea00d-890d-45cc-9583-64c953abd70f@xen.org/
[5] https://lore.kernel.org/xen-devel/686ba256-f8bf-47e7-872f-d277bf7df0aa@xen.org/
[6] https://lore.kernel.org/xen-devel/20240517011516.1451087-1-xin.wang2@amd.com/

Henry Wang (4):
  xen/arm/static-shmem: Static-shmem should be direct-mapped for
    direct-mapped domains
  xen/arm: Alloc XenStore page for Dom0less DomUs from hypervisor
  tools/init-dom0less: Avoid hardcoding GUEST_MAGIC_BASE
  docs/features/dom0less: Update the late XenStore init protocol


