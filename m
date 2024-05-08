Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9545D8BFCEB
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 14:10:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718771.1121255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4g71-0005AX-7i; Wed, 08 May 2024 12:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718771.1121255; Wed, 08 May 2024 12:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4g71-00057U-4T; Wed, 08 May 2024 12:09:31 +0000
Received: by outflank-mailman (input) for mailman id 718771;
 Wed, 08 May 2024 12:09:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ompu=ML=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s4g6z-00057L-BY
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 12:09:29 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceb2459d-0d33-11ef-b4bb-af5377834399;
 Wed, 08 May 2024 14:09:24 +0200 (CEST)
Received: from SJ0PR03CA0021.namprd03.prod.outlook.com (2603:10b6:a03:33a::26)
 by MW6PR12MB8960.namprd12.prod.outlook.com (2603:10b6:303:23e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 12:09:20 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::bd) by SJ0PR03CA0021.outlook.office365.com
 (2603:10b6:a03:33a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Wed, 8 May 2024 12:09:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Wed, 8 May 2024 12:09:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 8 May
 2024 07:09:18 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 8 May 2024 07:09:17 -0500
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
X-Inumbo-ID: ceb2459d-0d33-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrsNPWbMss67TDAn1mJfgMgD34hAhSZGfWAmHTakd6xxFlLyTggAVzPjJ+l+INXgYM6ut8ZbDBY5R+m1thon8ShZZQhQ2BOnFS9ofRrhxhTad7eb3+Af0xYYa/qXi6knyr+ByqySSA1ZDlDIL9Wmc7qAVrYYl9uWC47oFHKu1wGg7lVZARx8dDudmZ3GFfvlij2jVoE6dtD7b7mGNtE616/gglWAaiidyR+/3eDBBGp6NWiLN+S+olMbf7Bv36MsXh/0gnAYs0dz9qj/x03DHX91NXFOdyeZ1Do5FF/GLZOtXDYn/yKEVn+vR1hGF9E9u5vlgZzlVGFZ+Z9fnqyI6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQ97iZJtt9Thg0nMoKUUPhZ0X3mcr4cpwmkH/PCWogk=;
 b=GEn+gd+SeLZdO3m87bo8XUlFM+1/C3Mqt4eo3T3DB9/XSTO5O4X05mHriQDyAb7MDqfL4VsvN1cjrHKi1M7GQzmeho+HxkS9vBC32K3gw5gpRlWIMNdLeL75L/cgMIpVWEal0E7qjiRryr1WZZYKitpRAZNzxsHYqLB+pKVWgD/1KU8NRu7hWeF1XxB7NfM7hLv0Sa4al39zSY1lVP4TTm2Y/K+vdR9h529U27pV/Z4YgbmRExR12JQTOcpUnHb9NpebTCChQ3J4KJkOH8kIsB9v3Xm8Dr+SsNQ7+MwuUGw7V1n14SEEzmOnmzYoC6+QC6m7idYN1QULuXVTYLfxgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQ97iZJtt9Thg0nMoKUUPhZ0X3mcr4cpwmkH/PCWogk=;
 b=es2zWZqUEC79XP0BIrAPUKowIOtx3iJGxSGGRcyZjJqQDKln3I5clD2EgE4RPi7UpgPLsgXv06dehZQ+5xcmxPV54JJRfv+G3Yhsr6/bmFMqtk2dY8eGoYfs1+h5evAhn1dyeqwwuJf8LH1V2LxPe9xpxG387iFwVpaihvZYudw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <59b02ed2-e543-4bfd-946e-6a82919c582d@amd.com>
Date: Wed, 8 May 2024 14:09:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] xen/arm: Parse xen,shared-mem when host phys address
 is not provided
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-5-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240423082532.776623-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|MW6PR12MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef0010e-17f0-47e0-bad3-08dc6f57b078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzhaVEljS0VZRjN6dnkyVWlkMTVLN2M1dWVKNnUwcnN3SExYTmUyVHloWXVk?=
 =?utf-8?B?cnc5ekVRZDZjSHRvckRoaVNJOVg5M2puRHN5d2k0THdacDNWYjBYR0xHN3lq?=
 =?utf-8?B?K0ZENnY3bDVmNHQrdld5VXVHcUdKSER4TmZaZHk1R3kvK2xiYzZGVWxWWkR3?=
 =?utf-8?B?RnErcEZpaWo4ell6TkQ5TWh3OEppcFZ4VHRXRjkwN085QlE0d2VCd1RrKzh4?=
 =?utf-8?B?QjU0eStxU2crMitBRXUxOHRaMmVvMkovYk94OVZMVXRiaDg4OFY5VjBFTGVw?=
 =?utf-8?B?am1vSlcxTkZBVmM3MDJKQ3dQVDNYME5aS29pK2FnSmluOTZyN0xUQXVOMy9Z?=
 =?utf-8?B?bzUzRXZITmNLOXo5NThzNXBUVXRSbStYbXJScDd1R1Ftd20zRGloYmtZRGNt?=
 =?utf-8?B?TWVwRTNicmNsWk5ZRGFMRDVZTlkwVmQxYUlVcHowTkFibmJlV3FEd0RKZUtN?=
 =?utf-8?B?c2hYV3JpbVNha2RSdjhFT2NQRVMvc3hkMWJlMnJVT0NEa2hvRzJNdnN5Zkli?=
 =?utf-8?B?TWZCWkVtQXlXaUNWaDBFNWVGQlc5TC9aK1hIdlB6WUFJZjBiK2F4QndjK1lm?=
 =?utf-8?B?Ti80OG91cVRGOUdvNjFTUk1MSzhmV3pnYi8vaVhyTzBhcFQxYWxiMmNrRGpI?=
 =?utf-8?B?WFhWZkhnaFN3MWNIY0hqeUtsUUg2a3MwRlJmeDhFYjV2RzVQUnByK0dhT2k2?=
 =?utf-8?B?U0VIcXdoTDJidElHVzA3cmFzQzZKVmU3cExtYmRFTlAzQ1FYTHRGNEE4Yis4?=
 =?utf-8?B?VS9qK25iUytuaHlqWm5nQVl1UEhYZWFTOTVZUmU5ZFp0aU5KTmMyVzJJanVG?=
 =?utf-8?B?ZzM0RXVLTjdUR01wbkZNLzFBN0RaRlFoWnczTzRLWFFxQmhEc0J5MXpiMGYy?=
 =?utf-8?B?Q2ZmZGZ4SFZ0SVJwY3RhV0JQT1EyL3F1ZFpmejZ0a3U4VWl0MG16LzZyR1ZU?=
 =?utf-8?B?QWJRY0lNejhkYnJLQUw5c2JTdTlTZXl1VWRQMHVzejBzTGd4ZGhiMDQraVAw?=
 =?utf-8?B?NVU5UHNncTl4b1Nvdy9jVFZReEZsSTdXL0ptaEZJazkyOGJ4R2d0b29lQ1FL?=
 =?utf-8?B?SHZJNmdwMmtlNTBRbVNYeVRqdlVabnYrdEQ5RmtKTjN5ZnI3SDBlamJiMFY3?=
 =?utf-8?B?dUlPZ1FZb09STDA4TC9DYkVucnRRSHI1ekw0VW1aK0lPZlZjRWdBVW9hZDFY?=
 =?utf-8?B?cFpUc1hTWGFSbXBVVDFPNitqRk95OEh5MFFmbHB4aHd4cExTOXI3K0xHUUo2?=
 =?utf-8?B?LytkYUZHLzJRc1NpNllTd3ZHSXVGN0Y1eDN0TVRiZHk3OG5DWXFRMVAxRWhL?=
 =?utf-8?B?cEdaS1MvSkkwMXdkZzRKTFhwSDZXVGlxNTRadno2L3FRc3NTaC9uK1ZPQjZO?=
 =?utf-8?B?K2d6N09ETTBFcTdlUkZyRmdza2RCSUJWUXcrcUJtQ1VOY3M2UnJpem8zL3F5?=
 =?utf-8?B?NWlOczE0d3d0WXBkOTdVU01RNGovZ0QwcVFnaERUVEpsemRzTlFEcUpwRUlm?=
 =?utf-8?B?YzkrWlpVQkttelYyZVZPOHJxY1Z0aWFGRGFyWFVXRVlHbHpRS2JmQ0R5cFk3?=
 =?utf-8?B?aHY0UUlKRlg5QWZ4UXVQcllxTCtJQWgzWU41eWMzS3U2bVdRVVlLaUNLb2hh?=
 =?utf-8?B?SitVaS9NaWM3bUpBSlZHL3ZXV05HYzNUUlExTyt3SFdHUllqL2xGcmlJQkh1?=
 =?utf-8?B?VTdGcXRjWmprMHR1Vlc5Qk94MjNlMGNRUkdlTC9aWEhhSmVlL0RTblljK1Nj?=
 =?utf-8?B?LzlLOWozeVgvS3lWaGw0NzZHWGIzZ0x6Y21GcWZHMUJRRmNPa1hROXlVV1FY?=
 =?utf-8?B?TVRTeDU1VEpMc2JZd2h3K0EvYXpYUnpWdjM4dEUrbXdFNUQzSjUwYVd6Tjhz?=
 =?utf-8?Q?aERGeP9AV1QAE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 12:09:19.2057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef0010e-17f0-47e0-bad3-08dc6f57b078
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8960

Hi Luca,

On 23/04/2024 10:25, Luca Fancellu wrote:
> 
> 
> Handle the parsing of the 'xen,shared-mem' property when the host physical
> address is not provided, this commit is introducing the logic to parse it,
> but the functionality is still not implemented and will be part of future
> commits.
> 
> Rework the logic inside process_shm_node to check the shm_id before doing
> the other checks, because it ease the logic itself, add more comment on
> the logic.
> Now when the host physical address is not provided, the value
> INVALID_PADDR is chosen to signal this condition and it is stored as
> start of the bank, due to that change also early_print_info_shmem and
> init_sharedmem_pages are changed, to don't handle banks with start equal
> to INVALID_PADDR.
> 
> Another change is done inside meminfo_overlap_check, to skip banks that
> are starting with the start address INVALID_PADDR, that function is used
> to check banks from reserved memory and ACPI and it's unlikely for these
also from shmem

> bank to have the start address as INVALID_PADDR. The change holds
> because of this consideration.
On arm64 and LPAE arm32 we don't have this problem. In theory we could have a bank
starting at INVALID_PADDR if PA range was 32bit but as the comment above the function states,
wrapping around is not handled. You might want to use it as a justification to be clear.

> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/setup.c        |   3 +-
>  xen/arch/arm/static-shmem.c | 129 +++++++++++++++++++++++++-----------
>  2 files changed, 93 insertions(+), 39 deletions(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index d242674381d4..f15d40a85a5f 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -297,7 +297,8 @@ static bool __init meminfo_overlap_check(const struct membanks *mem,
>          bank_start = mem->bank[i].start;
>          bank_end = bank_start + mem->bank[i].size;
> 
> -        if ( region_end <= bank_start || region_start >= bank_end )
> +        if ( INVALID_PADDR == bank_start || region_end <= bank_start ||
> +             region_start >= bank_end )
>              continue;
>          else
>          {
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index 24e40495a481..1c03bb7f1882 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -264,6 +264,12 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>          pbase = boot_shm_bank->start;
>          psize = boot_shm_bank->size;
> 
> +        if ( INVALID_PADDR == pbase )
> +        {
> +            printk("%pd: host physical address must be chosen by users at the moment.", d);
The dot at the end is not needed.

> +            return -EINVAL;
> +        }
> +
>          /*
>           * xen,shared-mem = <pbase, gbase, size>;
>           * TODO: pbase is optional.
> @@ -382,7 +388,8 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>  {
>      const struct fdt_property *prop, *prop_id, *prop_role;
>      const __be32 *cell;
> -    paddr_t paddr, gaddr, size, end;
> +    paddr_t paddr = INVALID_PADDR;
> +    paddr_t gaddr, size, end;
>      struct membanks *mem = bootinfo_get_shmem();
>      struct shmem_membank_extra *shmem_extra = bootinfo_get_shmem_extra();
>      unsigned int i;
> @@ -437,24 +444,37 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>      if ( !prop )
>          return -ENOENT;
> 
> +    cell = (const __be32 *)prop->data;
>      if ( len != dt_cells_to_size(address_cells + size_cells + address_cells) )
>      {
> -        if ( len == dt_cells_to_size(size_cells + address_cells) )
> -            printk("fdt: host physical address must be chosen by users at the moment.\n");
> -
> -        printk("fdt: invalid `xen,shared-mem` property.\n");
> -        return -EINVAL;
> +        if ( len == dt_cells_to_size(address_cells + size_cells) )
> +            device_tree_get_reg(&cell, address_cells, size_cells, &gaddr,
> +                                &size);
> +        else
> +        {
> +            printk("fdt: invalid `xen,shared-mem` property.\n");
> +            return -EINVAL;
> +        }
>      }
> +    else
> +    {
> +        device_tree_get_reg(&cell, address_cells, address_cells, &paddr,
> +                            &gaddr);
> +        size = dt_next_cell(size_cells, &cell);
> 
> -    cell = (const __be32 *)prop->data;
> -    device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
> -    size = dt_next_cell(size_cells, &cell);
> +        if ( !IS_ALIGNED(paddr, PAGE_SIZE) )
> +        {
> +            printk("fdt: physical address 0x%"PRIpaddr" is not suitably aligned.\n",
> +                paddr);
> +            return -EINVAL;
> +        }
> 
> -    if ( !IS_ALIGNED(paddr, PAGE_SIZE) )
> -    {
> -        printk("fdt: physical address 0x%"PRIpaddr" is not suitably aligned.\n",
> -               paddr);
> -        return -EINVAL;
> +        end = paddr + size;
> +        if ( end <= paddr )
> +        {
> +            printk("fdt: static shared memory region %s overflow\n", shm_id);
> +            return -EINVAL;
> +        }
>      }
> 
>      if ( !IS_ALIGNED(gaddr, PAGE_SIZE) )
> @@ -476,41 +496,69 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>          return -EINVAL;
>      }
> 
> -    end = paddr + size;
> -    if ( end <= paddr )
> -    {
> -        printk("fdt: static shared memory region %s overflow\n", shm_id);
> -        return -EINVAL;
> -    }
> -
>      for ( i = 0; i < mem->nr_banks; i++ )
>      {
>          /*
>           * Meet the following check:
> +         * when host address is provided:
- when would read better

>           * 1) The shm ID matches and the region exactly match
>           * 2) The shm ID doesn't match and the region doesn't overlap
>           * with an existing one
> +         * when host address is not provided:
> +         * 1) The shm ID matches and the region size exactly match
>           */
> -        if ( paddr == mem->bank[i].start && size == mem->bank[i].size )
> +        bool paddr_assigned = INVALID_PADDR == paddr;
parenthesis around INVALID_PADDR == paddr

> +        bool shm_id_match = strncmp(shm_id, shmem_extra[i].shm_id,
> +                                    MAX_SHM_ID_LENGTH) == 0;
why not if ( strncmp... given no other use of this variable other than the one below?

> +        if ( shm_id_match )
>          {
> -            if ( strncmp(shm_id, shmem_extra[i].shm_id,
> -                         MAX_SHM_ID_LENGTH) == 0  )
> +            /*
> +             * Regions have same shm_id (cases):
> +             * 1) physical host address is supplied:
> +             *    - OK:   paddr is equal and size is equal (same region)
> +             *    - Fail: paddr doesn't match or size doesn't match (there
> +             *            cannot exists two shmem regions with same shm_id)
> +             * 2) physical host address is NOT supplied:
> +             *    - OK:   size is equal (same region)
> +             *    - Fail: size is not equal (same shm_id must identify only one
> +             *            region, there can't be two different regions with same
> +             *            shm_id)
> +             */
> +            bool start_match = paddr_assigned ? (paddr == mem->bank[i].start) :
> +                                                true;
> +
> +            if ( start_match && size == mem->bank[i].size )
>                  break;
>              else
>              {
> -                printk("fdt: xen,shm-id %s does not match for all the nodes using the same region.\n",
> +                printk("fdt: different shared memory region could not share the same shm ID %s\n",
>                         shm_id);
>                  return -EINVAL;
>              }
>          }
> -        else if ( strncmp(shm_id, shmem_extra[i].shm_id,
> -                          MAX_SHM_ID_LENGTH) != 0 )
> -            continue;
>          else
>          {
There is no need for this else and entire block given that the block within if either calls break or return

> -            printk("fdt: different shared memory region could not share the same shm ID %s\n",
> -                   shm_id);
> -            return -EINVAL;
> +            /*
> +             * Regions have different shm_id (cases):
> +             * 1) physical host address is supplied:
> +             *    - OK:   paddr different, or size different (case where paddr
> +             *            is equal but psize is different are wrong, but they
> +             *            are handled later when checking for overlapping)
> +             *    - Fail: paddr equal and size equal (the same region can't be
> +             *            identified with different shm_id)
> +             * 2) physical host address is NOT supplied:
> +             *    - OK:   Both have different shm_id so even with same size they
> +             *            can exists
> +             */
> +            if ( !paddr_assigned || paddr != mem->bank[i].start ||
> +                 size != mem->bank[i].size )
> +                continue;
> +            else
> +            {
> +                printk("fdt: xen,shm-id %s does not match for all the nodes using the same region.\n",
> +                       shm_id);
> +                return -EINVAL;
> +            }
>          }
>      }
> 
> @@ -518,7 +566,8 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>      {
>          if (i < mem->max_banks)
>          {
> -            if ( check_reserved_regions_overlap(paddr, size) )
> +            if ( (paddr != INVALID_PADDR) &&
> +                 check_reserved_regions_overlap(paddr, size) )
>                  return -EINVAL;
> 
>              /* Static shared memory shall be reserved from any other use. */
> @@ -588,13 +637,16 @@ void __init early_print_info_shmem(void)
>  {
>      const struct membanks *shmem = bootinfo_get_shmem();
>      unsigned int bank;
> +    unsigned int printed = 0;
> 
>      for ( bank = 0; bank < shmem->nr_banks; bank++ )
> -    {
> -        printk(" SHMEM[%u]: %"PRIpaddr" - %"PRIpaddr"\n", bank,
> -               shmem->bank[bank].start,
> -               shmem->bank[bank].start + shmem->bank[bank].size - 1);
> -    }
> +        if ( shmem->bank[bank].start != INVALID_PADDR )
> +        {
> +            printk(" SHMEM[%u]: %"PRIpaddr" - %"PRIpaddr"\n", printed,
> +                shmem->bank[bank].start,
> +                shmem->bank[bank].start + shmem->bank[bank].size - 1);
> +            printed++;
NIT: you could initialize and increment it as part of the for loop

> +        }
>  }
> 
>  void __init init_sharedmem_pages(void)
> @@ -603,7 +655,8 @@ void __init init_sharedmem_pages(void)
>      unsigned int bank;
> 
>      for ( bank = 0 ; bank < shmem->nr_banks; bank++ )
> -        init_staticmem_bank(&shmem->bank[bank]);
> +        if ( shmem->bank[bank].start != INVALID_PADDR )
> +            init_staticmem_bank(&shmem->bank[bank]);
>  }
> 
>  int __init remove_shm_from_rangeset(const struct kernel_info *kinfo,
> --
> 2.34.1
> 

~Michal


