Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4259EE499
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 11:58:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855751.1268579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgtr-00054U-1I; Thu, 12 Dec 2024 10:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855751.1268579; Thu, 12 Dec 2024 10:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgtq-00052y-UA; Thu, 12 Dec 2024 10:58:30 +0000
Received: by outflank-mailman (input) for mailman id 855751;
 Thu, 12 Dec 2024 10:58:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7GE=TF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tLgtq-0004Y7-9J
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 10:58:30 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20604.outbound.protection.outlook.com
 [2a01:111:f403:2412::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04f48902-b878-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 11:58:29 +0100 (CET)
Received: from CH5P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::20)
 by BY1PR12MB8448.namprd12.prod.outlook.com (2603:10b6:a03:534::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 10:58:23 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::6f) by CH5P220CA0023.outlook.office365.com
 (2603:10b6:610:1ef::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.14 via Frontend Transport; Thu,
 12 Dec 2024 10:58:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 12 Dec 2024 10:58:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Dec
 2024 04:58:21 -0600
Received: from [10.71.192.50] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 12 Dec 2024 04:58:19 -0600
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
X-Inumbo-ID: 04f48902-b878-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAUx+s/Mdfe29BcbSr0ywOAGhtszJNc1aQi4btqYAf0WFn0D5EYA1tC8UdELdva6lv2+gXAgdIdSDjiUpKo5edAMiHQRVOKQFVNCkk6N0PLBlvmd+g4izDoZlMVUDHaY73hQumhTrkAxTkKjLHr3UZEpXBUxhusxoO7G5tTitSuR821iiveymAP1nh1s/5GXh4VXa/85/zbrelz6TbsN6SZCPRixiy1+J7g9WPVcvF3kajS9tz0uAKD1JfUA1U2GZ/YvjJIDPO0wlKEHvy6n+v1x1chXqguaf7AIaVeMEo3TVWcmOrqwFXzpmpYawl/fNyK9Nes1j+CE+o/hdV/AhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gd2Ji8lDuZI4uC7Mx/ebEXSeEldyKS8kZ95rEBZDv4o=;
 b=pj6rXBwW0+bQsMa8bhz1uK5NjajnjZkhbEV0fuMh703ckjrtlNqRQr8yG0HfChdCC7iJv9WEojHPqsIwY804Qv6AUHiRV/5saONBwVKYwXY637QuX6Ush6srD7loW9ab8tz4lQZBcNdAGHOV4lDmTwMSM6EkaguUItWaOdHh5F2CxfffCIO0DthHMjcrnGGacSIED3epzh6MuhSz1N5zoCDW9T42qm7FSbGnFVUhsX/bguiejmPJpbpjX9YX5oE4qNmrFkNJmmmkSC1Xd1VQjIuoW4Xi0e5eYA7WvvrSMyRJJb/V2CHth4JByUby8sZCV4JbGUzSCiMFzNNMBKLW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gd2Ji8lDuZI4uC7Mx/ebEXSeEldyKS8kZ95rEBZDv4o=;
 b=rdJbS2m7sUZUaoQoY+5q8Ot7hq0peDU9QoRzRsbdjhatZMJybNPy41Aguw4o75kJ/S8JnYXAHKgtvfCRpgcfpbhN6iwgCDdyblPBOaFcYc9LfWF4m8qMD407PP0gtXqyr/XVQfdyYEvo9qjyD576isdHpvkM6vru5FX3eBeTMsw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f2ed8708-b9e7-4d4c-93bd-451a500d6943@amd.com>
Date: Thu, 12 Dec 2024 11:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] xen/arm: Check for Static Heap feature when freeing
 resources
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Chen
	<wei.chen@arm.com>
References: <20241212093037.2916713-1-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241212093037.2916713-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|BY1PR12MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: b76df4e4-eeec-4062-7582-08dd1a9be546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGFHa3pSa0VPVnhzNG9xYmlENjZxd1Vmc1QxM0FvaHd1WjhUamI4ZHBudjAv?=
 =?utf-8?B?SUUrdUZLdWx5OXY5dnJ0OXJUSkQ0QXZ0VzU2NngrKy9TL2NQN1QvODY2T2Ft?=
 =?utf-8?B?ckpPTGNKVnUxN2luemM2aXpsQkl4aFplWEpwNWpNRFQzcEZ5OEQyUm1FMkt1?=
 =?utf-8?B?V2FHK0x4blhiVmc5R3QrbVdwY2xOdkFWUC9VVnhlRzJwaDBNWFFEQ3lsdzEy?=
 =?utf-8?B?eFZoZUtqT1hpcFVBK2JyZkNwZ2NObEIycm5wdUp1K0NOOXR6MFczZmFzeFls?=
 =?utf-8?B?ZXR4aHo3RlN5RjMzbzJuSEg0c1ZvRG1kMFpLMXIxTHJLdFpVTTFnQzV5djVE?=
 =?utf-8?B?Uk9LUWwzYWhtbWZucC8vR2lFajRKUjRsdlJVdEd6VFhQMUpmcGlrOHdDL0Vn?=
 =?utf-8?B?U0s1eFlCWUZsVjZFcURJK1ZzeGhFUGpKU1FLUzBjSytIUWFNL0F2U1IrOHZZ?=
 =?utf-8?B?ZVJMRG9IMzBZREdnL1J6djBJWDFteVlMMDU2U3k4dzdMTUJ0VG50WnFIN0Rj?=
 =?utf-8?B?K1ZEa2w3czhobWVxbUhYYTdkTVcycXg3eFEzYWt6elUzenhETnIvT0s5aDVT?=
 =?utf-8?B?VXcwOGtwa0VDSG9jMWgxNmt0bTJ1S000QW5HcXFKWVFVb0NkSlF1VTc4S1Yr?=
 =?utf-8?B?TG9LaUNxV2VkdWZiZnRKQjJha2FzNGt6V1ZjUjBVeGQyeTZHWCtnbG1oYy95?=
 =?utf-8?B?R2R4Tyt3OStoemR0aEZXYUZQQXEvNUJ4S05ScGltNW10V3FXM0NHT1h3ZjZY?=
 =?utf-8?B?cU9xM2JTRktpemZ3aFRXTzRYSDlDbWRsMGFZTUdKeU5JeFdxREE5ZmhhbnhG?=
 =?utf-8?B?bkZBcUI0NVNTYjBvR09BQWtnYzJsekhKeG1HTStNOWNac1huTU9kQlhpQW9y?=
 =?utf-8?B?RENkMEYyTUVLaVhuMTloWDNYdjFoMlJxSmpUZTdINUFyMkdOVmc3UHhHb0pZ?=
 =?utf-8?B?dlFnOGVmVFhEU3RMcm01bW82K2JTUndIY1ZVTndwekY5WERMeWRQMXEweUVT?=
 =?utf-8?B?bmhPa096dGZtSUQ3S2dFT09IVWVpcktFWXVyRWFVOGk5VHRUNVRkd1J3K0xk?=
 =?utf-8?B?ZHBDdG5qekJWSW9wVzJFUUJpSVZTVi9uRjl6dzdpb3NFdmRLUmRPRjRxWG9t?=
 =?utf-8?B?ZTdrOUNDdHNWNSswUjZ0ZlloYUJ3aCtKMDFpRnhBZkpEQUpMYi9CMDNsYkoy?=
 =?utf-8?B?bVBldGlBNUk2bHQxRWtmU25tV0dWdUIraEpQN1RBV3NqTGZuazY3QjA3WGIv?=
 =?utf-8?B?YjAvTzdycVF6T0RYMHB6YmxuS1hJbmltdVhCTkFBYjhuZS82NkRoeTFoeVJx?=
 =?utf-8?B?d01ldDk5SjZ4c3k1aVN0Vk5KMFZnVGpmdU14NnNOL2RNd1VvdnBuN2M1d1pV?=
 =?utf-8?B?cXZxa25sR0Nibi9YbTNHS1c4VngvaUlKUWZDemdGZ3ZJbGRsTWhtU1dNRWhQ?=
 =?utf-8?B?UjZoQlN2UUxlUHphOU5wMlJCOEhGdGUvdjNaUnBXdFRRcVNlVTJjaUQyR3Fp?=
 =?utf-8?B?a3J0OFY2UDMrb1FKc0FSVldWNnVkREhCdnZuN0I2aUkvNmFheHRmQ2xORWpI?=
 =?utf-8?B?RnJYZFV1dzFhb1Y5Ry8rTTl6SHFsY0tvbzk0T29jbzVCemRHcEFhTHdNUVZO?=
 =?utf-8?B?aHRXUHJmcC9xbEpxalh4Yzg2WlhqL3JwcXhMc1FvYm1nUnkxVVROQ0o5dGpK?=
 =?utf-8?B?S1Z6QUtBREJIa28xZGVDbTQ2QkpXb2kyano4d3RKeG5jMno3N1JKUUtsN0hz?=
 =?utf-8?B?L0ZkTnhpMk9oTE9vMXVOYklkb2dkTk5pY0xpaGMxYSt2UUJuV252ZXVLdDln?=
 =?utf-8?B?bDZjRE9pYk5MT2x3Y01VZFRaVEhNVndENW8vUS9LS1lvblhmMmRrYW9vNWtZ?=
 =?utf-8?B?ZVFiWTUzZTVvMzQybDY5K01lVmc0UHhCNmVBWENIRW5mTnludEE1bUltYWZl?=
 =?utf-8?Q?YXFuN1QZy8aHYNiurShUaqLp76g/pnVW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 10:58:22.4550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b76df4e4-eeec-4062-7582-08dd1a9be546
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8448



On 12/12/2024 10:30, Luca Fancellu wrote:
> 
> 
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> If the Xen heap is statically configured in Device Tree, its size is
> definite, so only the defined memory shall be given to the boot
> allocator. Have a check where init_domheap_pages() is called
> which takes into account if static heap feature is used.
> 
> Extract static_heap flag from init data bootinfo, as it will be needed
> after destroying the init data section, rename it to using_static_heap
> and use it to tell whether the Xen static heap feature is enabled.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from v5:
>  - Drop Jan R-by due to the code changes
>  - Static heap is not dependent on static memory, so delete #ifdefs
>    for CONFIG_STATIC_MEMORY
> Changes from v4:
>  - Add R-by Jan
>  - Changed code to reduce nesting in discard_initial_modules (Julien)
> Changes from v3:
>  - Removed helper using_static_heap(), renamed static_heap variable
>    to using_static_heap and simplified #ifdef-ary (Jan suggestion)
> Changes from v2:
>  - Change xen_is_using_staticheap() to using_static_heap()
>  - Move declaration of static_heap to xen/mm.h and import that in
>    bootfdt.h
>  - Reprased first part of the commit message
> Changes from v1:
>  - moved static_heap to common/page_alloc.c
>  - protect static_heap access with CONFIG_STATIC_MEMORY
>  - update comment in arm/kernel.c kernel_decompress()
> ---
> ---
>  xen/arch/arm/arm32/mmu/mm.c       | 4 ++--
>  xen/arch/arm/kernel.c             | 7 ++++---
>  xen/arch/arm/mmu/setup.c          | 8 ++++++--
>  xen/arch/arm/setup.c              | 3 +++
>  xen/common/device-tree/bootfdt.c  | 2 +-
>  xen/common/device-tree/bootinfo.c | 2 +-
>  xen/common/page_alloc.c           | 3 +++
>  xen/include/xen/bootfdt.h         | 1 -
>  xen/include/xen/mm.h              | 2 ++
>  9 files changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
> index 063611412be0..0824d61323b5 100644
> --- a/xen/arch/arm/arm32/mmu/mm.c
> +++ b/xen/arch/arm/arm32/mmu/mm.c
> @@ -199,7 +199,7 @@ void __init setup_mm(void)
> 
>      total_pages = ram_size >> PAGE_SHIFT;
> 
> -    if ( bootinfo.static_heap )
> +    if ( using_static_heap )
>      {
>          const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
> 
> @@ -246,7 +246,7 @@ void __init setup_mm(void)
> 
>      do
>      {
> -        e = bootinfo.static_heap ?
> +        e = using_static_heap ?
>              fit_xenheap_in_static_heap(pfn_to_paddr(xenheap_pages), MB(32)) :
>              consider_modules(ram_start, ram_end,
>                               pfn_to_paddr(xenheap_pages),
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 293d7efaed9c..8270684246ea 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -244,10 +244,11 @@ static __init int kernel_decompress(struct bootmodule *mod, uint32_t offset)
>      size += offset;
> 
>      /*
> -     * Free the original kernel, update the pointers to the
> -     * decompressed kernel
> +     * In case Xen is not using the static heap feature, free the original
> +     * kernel, update the pointers to the decompressed kernel
>       */
> -    fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
> +    if ( !using_static_heap )
You should get out of this function even earlier, before calculating addr and size that are only
used in fw_unreserved_regions.

> +        fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
> 
>      return 0;
>  }
> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> index 9664e85ee6c0..8c87649bc88e 100644
> --- a/xen/arch/arm/mmu/setup.c
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -341,8 +341,12 @@ void free_init_memory(void)
>      if ( rc )
>          panic("Unable to remove the init section (rc = %d)\n", rc);
> 
> -    init_domheap_pages(pa, pa + len);
> -    printk("Freed %ldkB init memory.\n", (long)(__init_end-__init_begin)>>10);
> +    if ( !using_static_heap )
So here, you allow the init region mappings to be destroyed (above), yet ...

> +    {
> +        init_domheap_pages(pa, pa + len);
> +        printk("Freed %ldkB init memory.\n",
> +               (long)(__init_end-__init_begin) >> 10);
> +    }
>  }
> 
>  /**
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 2e27af4560a5..85f743a2c6ad 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -206,6 +206,9 @@ void __init discard_initial_modules(void)
>      struct bootmodules *mi = &bootinfo.modules;
>      int i;
> 
> +    if ( using_static_heap )
> +        return;
... here you would get out without calling remove_early_mappings() that today destroys early FDT
mappings. IMO you should allow to call remove_early_mappings().

With the remarks addressed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


