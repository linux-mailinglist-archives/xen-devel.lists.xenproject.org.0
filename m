Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF55587FE36
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 14:11:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695363.1085031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmZEX-00040i-0y; Tue, 19 Mar 2024 13:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695363.1085031; Tue, 19 Mar 2024 13:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmZEW-0003yW-Tm; Tue, 19 Mar 2024 13:10:24 +0000
Received: by outflank-mailman (input) for mailman id 695363;
 Tue, 19 Mar 2024 13:10:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9UIi=KZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rmZEV-0003yL-Fq
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 13:10:23 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0985751e-e5f2-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 14:10:20 +0100 (CET)
Received: from DM6PR14CA0037.namprd14.prod.outlook.com (2603:10b6:5:18f::14)
 by PH8PR12MB7328.namprd12.prod.outlook.com (2603:10b6:510:214::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Tue, 19 Mar
 2024 13:10:15 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:5:18f:cafe::b0) by DM6PR14CA0037.outlook.office365.com
 (2603:10b6:5:18f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Tue, 19 Mar 2024 13:10:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 13:10:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 19 Mar
 2024 08:10:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 19 Mar
 2024 08:10:09 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 19 Mar 2024 08:10:08 -0500
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
X-Inumbo-ID: 0985751e-e5f2-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0u3VfrBJUsLY7MVX3BuSPkl1ubtqGskhoWfCnbE2O3pu2hVnhUqyWxF7Bi7gAZn/QRuB0nbI6vBVO4AGZ08zl7TDOqj/PnC+1O6gYAK7sCAkKvnE4c/68LfOVErSJrnZ211sTxxUk/czyu5xnEhiyDYtgrRgeEI7iBvGeHSddYwKo7tK2LKO+zZhQPTeWBzOttko2ftMu1YbAmIXJZkCN4JDSwb8Fw7PuTeoWkhBkNxkm/X6VghXU4XNy2LaE++jgc7m6uCdhDoZX06np2S38EjeYwjH23UAXo2l8PvCNB33dPOipjsBSBGyfwlFchjgJXWbrpA+OuqYc2dcGoIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsmyBd0bP8uAZJ09PLh60OBCZMw+z+H0XvEyAGsSFqQ=;
 b=O8TC0lcsyvyYIeks+Rb8JVlDWJVrvyAbBWHlICfKqjVRcE2tNStLmbyhaFK0KuFUK/W5rhT0tp8CsB2UMinqdKNNSJW2WNWDhbKaLukBtbykKEAEiMgfezADEgV1nae0UjO3PTAitbqsSKIZmmCFtvRQlE95TPHjrcYdEeV5+ePxrldbpbRuL1Pw5qaAwvkGz1frmYIlBAvcBsRiEljB7OcmRxV80Y3fXNQAzWJCSK+2s8hULqco1aAMuJU0lsQWUm+zzd85XtYUXQv/kVPEW2Mujg7xX+L3SzidNrAXKT2cR0jvYttOl480I2aa9Cdc7jeak4vsw/0njhlsvOLgfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsmyBd0bP8uAZJ09PLh60OBCZMw+z+H0XvEyAGsSFqQ=;
 b=K3kvRyRhWjaoAKexoAZPKSMwh4Q3fvdIA48fnkeDnEBOY47sNx3ovhSrObSh7EOhbWk595Aee6h+tVAR2VSlPvXq3sXzfieYL202sXTBPd7mMudTTgn6+nlcVITDx07R9xpsOzzRrd5g/x9C8Z+axAR66MB7E2w5FVvnAwTkEtw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <73dbf297-31ed-4cf1-b081-c6f82c234de8@amd.com>
Date: Tue, 19 Mar 2024 14:10:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] xen/arm: Introduce a generic way to access memory
 bank structures
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-4-luca.fancellu@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240312130331.78418-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|PH8PR12MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a94ba6-e445-4904-b268-08dc4815e8f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L9ghwBFw7NJgRyz7TXNgG3zBnxKLlxvORK0jD/NV+dE/YbSVmUSw6IOPfpIYgWWO9JuDp1zmDMxio3mBVKIQymsz0Tj/n2cx6Jq0JeORrvLvEAMz7i4hxI6qKNmAxwUx2aNJdVHRZ6rd6dUFGwzj8RHusMvqV7HoF+WMR5PpZxil2AE3b/gLhy0ZM2NE7BoJNXpd6vnoJ6o/9/KKUATamXkJtll1qzzQ18AQS0hfg45beL7+ARZvXJ/XZKhzFxNc+7VDNS/7PzyK3mMHdSbGEWM6Q41yGToRHVPYGs2at9MnkOOT7fjI71eIphG7jbqKecBRnhEHXuzYHhK8ZU4f06yER51EkdpQ2xa9CtiRXVZAiETekhXFswoNb5ZcMte/hrGV2GlGr+8Hka1I0sr/K1jx6ooyn5ZVCTMBgVqkFBgKlTTTTgU0hDXRwLKaTQxKQ2m+8qFQ6pTG5zHz/rJD5n2aQDSadbg7bMwETag4omyMNz3Q0TvkQjW+k2rHMMpmoWtrs8NJgAqkhA021tSkmtfHMiGUsVlP+38u38BpqTyDEox845+vsr4xKkdCMEZ+3t+A6rpAQNzy20P/qo2Dt/z6io5PCKyl+49e6mXcHv6zKRW3IXj2DQg1bVT4mj6QYXk97bliUQYi0vUWJWr5tyypcb92FxsljkD/i72z5vqUjdpxGZLBv175XoP5LE8vxMu0+YKUcsIr6gOWw0R9SKFdZlq1r/RikJZ0/e/rHPqjsTH1Uacdo2GNs/YGk8Q+
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(34020700007)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 13:10:11.8940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a94ba6-e445-4904-b268-08dc4815e8f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7328

Hi Luca,

On 12/03/2024 14:03, Luca Fancellu wrote:
> 
> 
> Currently the 'stuct meminfo' is defining a static defined array of
> 'struct membank' of NR_MEM_BANKS elements, some feature like
> shared memory don't require such amount of memory allocation but
> might want to reuse existing code to manipulate this kind of
> structure that is just as 'struct meminfo' but less bulky.
> 
> For this reason introduce a generic way to access this kind of
> structure using a new stucture 'struct membanks', which implements
s/stucture/structure

> all the fields needed by a structure related to memory banks
> without the need to specify at build time the size of the
> 'struct membank' array.
Might be beneficial here to mention the use of FAM.

> 
> Modify 'struct meminfo' to implement the field related to the new
> introduced structure, given the change all usage of this structure
> are updated in this way:
>  - code accessing bootinfo.{mem,reserved_mem,acpi} field now uses
>    3 new introduced static inline helpers to access the new field
>    of 'struct meminfo' named 'common'.
>  - code accessing 'struct kernel_info *' member 'mem' now use the
>    new introduced macro 'kernel_info_get_mem(...)' to access the
>    new field of 'struct meminfo' named 'common'.
> 
> Constify pointers where needed.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/acpi/domain_build.c        |   6 +-
>  xen/arch/arm/arm32/mmu/mm.c             |  44 +++++-----
>  xen/arch/arm/arm64/mmu/mm.c             |   2 +-
>  xen/arch/arm/bootfdt.c                  |  27 +++---
>  xen/arch/arm/dom0less-build.c           |  18 ++--
>  xen/arch/arm/domain_build.c             | 106 +++++++++++++-----------
>  xen/arch/arm/efi/efi-boot.h             |   8 +-
>  xen/arch/arm/efi/efi-dom0.c             |  13 +--
>  xen/arch/arm/include/asm/domain_build.h |   2 +-
>  xen/arch/arm/include/asm/kernel.h       |   9 ++
>  xen/arch/arm/include/asm/setup.h        |  40 ++++++++-
>  xen/arch/arm/include/asm/static-shmem.h |   4 +-
>  xen/arch/arm/kernel.c                   |  12 +--
>  xen/arch/arm/setup.c                    |  58 +++++++------
>  xen/arch/arm/static-memory.c            |  27 +++---
>  xen/arch/arm/static-shmem.c             |  34 ++++----
>  16 files changed, 243 insertions(+), 167 deletions(-)
Lots of mechanical changes but in general I like this approach.
I'd like other maintainers to share their opinion.

[...]

> @@ -1157,10 +1163,12 @@ int __init make_hypervisor_node(struct domain *d,
>      }
>      else
>      {
> -        ext_regions = xzalloc(struct meminfo);
> +        ext_regions = (struct membanks *)xzalloc(struct meminfo);
You're making assumption that struct membanks is the first member of meminfo but there's no sanity check.
Why not xzalloc_flex_struct()?

>          if ( !ext_regions )
>              return -ENOMEM;

[...]
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 0a23e86c2d37..d28b843c01a9 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -78,6 +78,15 @@ struct kernel_info {
>      };
>  };
> 
> +#define kernel_info_get_mem(kinfo) \
> +    (&(kinfo)->mem.common)
Why this is a macro but for bootinfo you use static inline helpers?

> +
> +#define KERNEL_INFO_INIT \
NIT: in most places we prefer \ to be aligned (the same apply to other places)

> +{ \
> +    .mem.common.max_banks = NR_MEM_BANKS, \
> +    .shm_mem.common.max_banks = NR_MEM_BANKS, \
> +}
> +
>  /*
>   * Probe the kernel to detemine its type and select a loader.
>   *
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index d15a88d2e0d1..a3e1dc8fdb6c 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -56,8 +56,14 @@ struct membank {
>  #endif
>  };
> 
> -struct meminfo {
> +struct membanks {
>      unsigned int nr_banks;
> +    unsigned int max_banks;
> +    struct membank bank[];
> +};
> +
> +struct meminfo {
> +    struct membanks common;
You were supposed to make sure there is no extra padding here. I don't see any check in this patch.
I'd at least do sth like:
BUILD_BUG_ON((offsetof(struct membanks, bank)) != (offsetof(struct meminfo, bank)));

~Michal

