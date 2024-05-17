Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 990EB8C8026
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 05:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723783.1128857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7oBM-0006R6-Jh; Fri, 17 May 2024 03:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723783.1128857; Fri, 17 May 2024 03:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7oBM-0006PG-Gx; Fri, 17 May 2024 03:22:56 +0000
Received: by outflank-mailman (input) for mailman id 723783;
 Fri, 17 May 2024 03:22:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6mIz=MU=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7oBK-0006PA-Oe
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 03:22:54 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2408::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be683921-13fc-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 05:22:53 +0200 (CEST)
Received: from PH7PR03CA0028.namprd03.prod.outlook.com (2603:10b6:510:339::18)
 by DM3PR12MB9413.namprd12.prod.outlook.com (2603:10b6:8:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Fri, 17 May
 2024 03:22:48 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:510:339:cafe::f8) by PH7PR03CA0028.outlook.office365.com
 (2603:10b6:510:339::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.29 via Frontend
 Transport; Fri, 17 May 2024 03:22:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 03:22:47 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 22:22:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 22:22:02 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 22:21:59 -0500
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
X-Inumbo-ID: be683921-13fc-11ef-909e-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCrKt3jND6ubuKXsINud70JZHnV0lNzSXOqsXyTvIaxJJjqcsKXaK7x5By9HtT3OIsz7TzyUNAoa2epfmMCf0QwvyLQjETNUdskqm3tp/42IyWaRwode3/cn10bgPwfTCC894JZCSAXSOdF8dRhMmbBx6fQ9QdWVzTf78OMwdXKjfLW//Hhbvnx3GpcbCPNzEiZ+93R1Od/V9N9koSjj2xxMqYkEIyg50Zr00oG7UPyyR/CN6UXO3iZ+DiKGFi0J+ixg294eLNahR6DTPi1nrNGffmGlLoPOqsBHvXt9HA+IVSjUdcWWDaHuvHpg2UBUB/KCRAGCbnYknNvAg+Kb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxU6vjuvVdOW/ywnLEm/VDAKtSigYMJONUnO/ZgkylA=;
 b=EcbiQJ8ERHn3C8lROE6Z4zS2Ky8iNv6GNTgz7/B4jefJxomsyV/XWZcGxLHXS+dIqopRct03s35Q0Yh2cZ/xnA8J/hRwkWefE4fNzvszVGnT38EVxU1sOC0DXUWjKaF27/I94ZS0svyvsD53mZy0SFR/oizYfTcBppGdF39G9RF4HX9Nzd0xNXoMz68VQrvgVZNBep0G6NO4/fYm6v+D3xSuvEz3/BOfUh6YQ+QJnCGHYN5bT/elxlTyuRqPyntQTC4Y8u88hw9ef002YRL0E/Cx/lqnVlLDmCKzBYhOR1d7Kix953I6atR5fWvaQv+Z+mT94v1whfyBoH6csSOZ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxU6vjuvVdOW/ywnLEm/VDAKtSigYMJONUnO/ZgkylA=;
 b=R7VHd7YiqWv7SmuMiIqL+ZUTtOsh0wyMu3U2LUgpGfEf18y26kssrXb10F63zS8V9CLrRkI6zFKD7ot9pqddVlDUyGxd3XGydasJohL3QTBUbFpb8Tu227C5SUkIylTPjtbLhMHRNOWT8HJgfj67SHAbCpxhqZTO3TemuyNSb+U=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Anthony PERARD
	<anthony@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/4] Guest XenStore page allocation for 11 Dom0less domUs
Date: Fri, 17 May 2024 11:21:52 +0800
Message-ID: <20240517032156.1490515-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|DM3PR12MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f31c08-1c31-4087-a14f-08dc7620a02b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DqsI+RJvLtXVKscPqyFU08PoQTL82k8F0s8CuprgE66bG0EfKlkVHGeQxGvs?=
 =?us-ascii?Q?Z0pP/n/FWkKOwflWI+m3Uus5gUBjyq9XSz5EOToyrUnJmdQ8ivm7kKot0emR?=
 =?us-ascii?Q?F6aE5iaPaxU7cw48v9GzFysDqr62BBVDEahVSAEeSzoCqgDWTSiQ0LfI5LPq?=
 =?us-ascii?Q?+YaEMd5oaQ4hZgqJkOqZE1/glBHMnn4VH3pc7Itmfhn/QJexECrrsh+W1VrF?=
 =?us-ascii?Q?eGg3T1ZndoomPtC/Bt7RmbInwyQ9ISAOGaFjovCOG33hGTTUepISTl7tbCIp?=
 =?us-ascii?Q?RupzaWVzsLgwpov1erqHilrx78Im0Ql1GMT4AMH/xrAZ7DKUyGB7l26ShWXX?=
 =?us-ascii?Q?+LtcF9Bxu8Kb3C60csKNAa185pZ7TStcaXnBWmEpNMEFhPMNdieMise7bMR7?=
 =?us-ascii?Q?3sztI3V3FHiW5PsDasOnM+qBeudub3o+v2AiyGTHCEsiGgX2TDzdeGzW6rLk?=
 =?us-ascii?Q?891/h2SVYQbZgdV9BlyMvDAh3grntCRt2ubJZQkSaCDG7enUFUHiR98Dk7Th?=
 =?us-ascii?Q?mxBMT0kOjo61pEv3odU5ZV1Uvf+jFNWtXOe3eZJtTSPTfxPxFF/5dssEKOH/?=
 =?us-ascii?Q?EBZ3oFXq7a+C7d7fgs7kRYrUzRjebqOXP6uBOB5c993Ynwwu1muIExFhq0oS?=
 =?us-ascii?Q?YsEtP5Z+z3vU5r3WsYJqtZRmF5L125qr/FKwskXrsW22qkc309PtzBTG5OxP?=
 =?us-ascii?Q?BBft6vY7NV/g8teSftfSvqOJFn8sN7MDo+VdM38g9rkrpvwCIht7ndRRVAAb?=
 =?us-ascii?Q?bj/QbR9ZdF0j0ETDst7TkiKZTbvd7gRQyriiFEsptQO0pugq5OFZO0yTPSaz?=
 =?us-ascii?Q?z/ZWFFIkqiWIEBn61sdzzNLI2GLb90c6V6WgX6cxIqxNr70dsvMw4mdVHaEQ?=
 =?us-ascii?Q?Fe7YkKEXpCu/kzAb10YCMIfh9Ck8lVFC4AXUMOFKbvAnjJrSVs60WB3eDeb8?=
 =?us-ascii?Q?0wCxW2Fq92mkK3X0qFj+LCMb3AaovJkDIUaerXMcnL67OZJ13CLScThWWqnZ?=
 =?us-ascii?Q?xD+klsBInfCmtbUL1AOA4mSrmO38nRKj9Fnlf8PZms3jd5pTyQV1W4QUMZr7?=
 =?us-ascii?Q?/G/h1NSc0X47XBrt6ZAe8KDRxWBsXqKZprSzdiPMkuR92vrcztFVdwvvfeDO?=
 =?us-ascii?Q?tDQPUl2rXZ2zR7SuHYj4nhBk/PtwsKDtDSISC/dTvFSAzuinxqJI4uySyPuM?=
 =?us-ascii?Q?NGq2mii6yVobtYWxgxOb65aT6hxRvz1rMkbM8a2fBVPc8pIQuHYcmYA5Os+p?=
 =?us-ascii?Q?I3wRECLckd/J0gdREuIS4G2cahkkBZfwrgypMPcuTcff1WJ4jkzD9Lm19Q2f?=
 =?us-ascii?Q?yPI1Yyy1UngUMXCJtIn8u+dkM5VnZ/BKg45ntNrpQeKMbw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 03:22:47.7387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f31c08-1c31-4087-a14f-08dc7620a02b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9413

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

 docs/features/dom0less.pandoc         | 12 +++---
 docs/misc/arm/device-tree/booting.txt |  3 ++
 tools/helpers/init-dom0less.c         | 58 +++++++--------------------
 xen/arch/arm/dom0less-build.c         | 44 +++++++++++++++++++-
 xen/arch/arm/static-shmem.c           |  6 +++
 5 files changed, 73 insertions(+), 50 deletions(-)

-- 
2.34.1


