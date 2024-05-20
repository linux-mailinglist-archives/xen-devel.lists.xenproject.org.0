Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E9C8C9C0B
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 13:17:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726015.1130280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s910X-0001yV-6t; Mon, 20 May 2024 11:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726015.1130280; Mon, 20 May 2024 11:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s910X-0001wP-3p; Mon, 20 May 2024 11:16:45 +0000
Received: by outflank-mailman (input) for mailman id 726015;
 Mon, 20 May 2024 11:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nMKL=MX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s910V-0001wJ-Qe
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 11:16:43 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eab678e-169a-11ef-909f-e314d9c70b13;
 Mon, 20 May 2024 13:16:42 +0200 (CEST)
Received: from SJ0PR05CA0046.namprd05.prod.outlook.com (2603:10b6:a03:33f::21)
 by PH8PR12MB7159.namprd12.prod.outlook.com (2603:10b6:510:229::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 11:16:38 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::9a) by SJ0PR05CA0046.outlook.office365.com
 (2603:10b6:a03:33f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.16 via Frontend
 Transport; Mon, 20 May 2024 11:16:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 11:16:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 06:16:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 06:16:37 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 06:16:35 -0500
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
X-Inumbo-ID: 6eab678e-169a-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAv34O+/UY2Xn4eus+0r/5nPZesnP3wc7vk+zWpSDyKBcLD6GSDLjO8DZfYjGJzVWNtpLDAacnq9HpwdQjYQ4kYsLoMcY0aYS0CPkubD6YTsTFgsQyY/HaAT9vQ3AWYM6hqprsM3Wik5xO/O926TZ/jtBYzrOxW3T0emDn9+nwVjZ9BpQycCOo2YWPnpn8FEx1Mm8/22rIDI2hIP/iTBHz13EihR6Zel3MVu8p8KnBP9gOd/+kj4xZCCKmr0DZgj0wC6QBlLn3N+IsR8vc+GZBQepM2Ht/4QtryFNvLxDepP/oi0EzbJFUaxad0Y9DV+kEDOtdkK4IDUUuZuLxP5hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDJ3msYQKWjf/JZ1Aqz1pUVl4Q5XyW+mlcb8u/ab4Io=;
 b=cMg2ceiMHEOhwB97Wm3YecpVmvvQ9CPDLHR7fj48eP1oTRTJC2fpbIw2q+8lHbReuo0ljn3ozzN8ukRaaTxxnwiRFqbXQNfUZ77XRsnQiIYGtXkhVSTjj5IV3D+0lRiaeoxgI3+ryJTurgy9eSFIYNIu0uFXoyFEBdDTyGtvRqpOo3EXp6KXOlauTXVPVWsXD4s16xYq04DYhCkMlqv7Ue9sS6UhPHYNFow7HWW2+7Mgm5CXwEr/pdGjR0nWQ5SgzLrRkKmmNvRyj6v4FBY4HXYuWYhASCVoJYP11k/pOkjkFW0ZXtZxusyQFwEzW4aAYg6ZX0A+ZBYq5hYnccbrdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDJ3msYQKWjf/JZ1Aqz1pUVl4Q5XyW+mlcb8u/ab4Io=;
 b=cx1xVznDnZaP8xscjbuRJkpxFRAmA7dKhiQ1gTRl9LDMVDWEfzpdBekwUDj59BCqm4fF0BTUywtKAuCALQy/axkrNUEc0Lt2wpv9VmCF2Ua2sKUW05e/6NIXtpRXfeEyCWb4S3lav1ZDxVBp+YD5y8RnuWrFb+7l/im9+LVtWcc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <cbe1fb4a-9c2b-48eb-acb0-6726aecdfe85@amd.com>
Date: Mon, 20 May 2024 13:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] xen/arm: Implement the logic for static shared
 memory from Xen heap
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240515142626.3480640-1-luca.fancellu@arm.com>
 <20240515142626.3480640-7-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240515142626.3480640-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|PH8PR12MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 61159ad9-1055-40e1-43ce-08dc78be5155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlJyTTlXUjVnM1lPODh1ck9HM2NGdTBVUDh5aCtWVGk0Q1NVd3NCOVdHbG40?=
 =?utf-8?B?VmFDY2p1TGVDYjNDUW9aK0tvZERMRjJFVDlOeUN2bDNmM3R2VjhiV3BGanhq?=
 =?utf-8?B?WTFuUUFTRlBKbk11elFpOVhjWFI1RXdoWUd1NG04eEJ0SENJYytLRWRkZG9E?=
 =?utf-8?B?TmdnY09nTjBsek53eEg5ZjJRRVVzd3RpSStnZmNmSlQrZWxBcDNWUHlORFFq?=
 =?utf-8?B?K2I0aGJsRWtoWEZKOGV0cEJCanUyN1JiL2svdmNyTTlKc3hxVHg3WHVkNUpO?=
 =?utf-8?B?eVZPVmg5REk2VVp3ZkM5bWtDd200SzQxRklmZXpBNHNLVFJ6aENXNURlMEdB?=
 =?utf-8?B?bjRhWlp6Q2oyOXJ6cXBFeDNBTzJ5VnBFbklEZnE2YXMvU1JibXRzdlpMSG56?=
 =?utf-8?B?MkhCQzR5Y3pZK3Z0aENDL0E0aXJMREFleDZyV2ZNcEtFTmxhd013aDM2TzFl?=
 =?utf-8?B?UWt3V2s0N1A2ZzNBKzZobWNBLzY5UW8wVDFSb1BKSlNZZFM3WW5kNlBvNlpj?=
 =?utf-8?B?bWdQQnk2VE5NNUE5L1ZEMlpyeE1RSk52aHNZMGVDcGllUEh4MTc0WWxBaU5B?=
 =?utf-8?B?V2hFaDVpa3Nhdk5oRVZIZWZDM2sreGtFOGhrcFFPOEdjaDZ3NHVJNE1oWGhk?=
 =?utf-8?B?UEs1YSs3YU01YmNkNG84Y29aN0gxWmJsMnNrVzIvK1J6ci9WR0NpUjNFeENH?=
 =?utf-8?B?cjVFZU8wQUJrRjRrcVk3QkNESTJ1a0t3anZNV0V2cHJteFpJTFY2SGtvRTRq?=
 =?utf-8?B?NExXNWwrUjZHTENzdXFkeHFhZVlua3oxWjlwRVNENWgvZmFKNG9EdWgxemVy?=
 =?utf-8?B?dFJlcllTS1lDUzRiSEFhNnNDWk4yQU8rKzR0NS9UU0lYS2tNT2hZMmNQcWg3?=
 =?utf-8?B?YmpmdVdnZHVYRFFaeGNBcXlNZEtqQk54VTVvRGZUQjVQVm55K3dIMnpic3hM?=
 =?utf-8?B?d3RaVHFYRG84Vmd0ZGdiVjRpLy9vRUhzVytlRitNSVFnQjFWdjlSM1plOTkx?=
 =?utf-8?B?UGpPdkxzcWNWc013WXhDeFBUNnZYaGhGSStGOU1MT24zc1Q5bWM0dFZyNkVl?=
 =?utf-8?B?UlI4cWNuZXFML1hLbGN6T3pHOU55RVVQb0RIb3A2NDMzWTh6NWlUWTRRU3Ft?=
 =?utf-8?B?NURaRlIzczJSY1dqdDFXMGt3bklpM0RYQXpQUGFFMzlHR2Y1aTRmT00yNkVY?=
 =?utf-8?B?MWxNbEtXSCtkZWZIS05WK201WVo5cE8yc21nRStZZ2svaStOVlRGSTh5Nk9i?=
 =?utf-8?B?eWZoUFpPMU93MmJPbjFxdlpXY1UvcEVUZlUzQjN2OTJ5NkZEenFCcjZTRVhz?=
 =?utf-8?B?MGF3MDZmM0RNUlZJYmZ3K3Avem94citOQWZsZnRZRTBxSTdIUTZsN29ySjhP?=
 =?utf-8?B?ckZLWXdicWJjZVA5TmVTemJRQjc3QVFlZHVGRTZlUHFmczBWQXR3SlltZjVS?=
 =?utf-8?B?QnFlVUo2em96SG9PVE4xWXkzaEtMSzV3bEhaZUFoR0U0S2E3UHorcUQ1Ymtm?=
 =?utf-8?B?TFlBdkhBNHdhSzhQVVVKUWlSUG10OHlWbmZKZGljWERyRVhNVlJMcHZTaVRZ?=
 =?utf-8?B?RjViYWZ5ZnlCRk10cS96ckJESkRFYTV4eDFhSlRWKy9GaTI2MFZwT283dWox?=
 =?utf-8?B?YStMZkIwOWRZQzZLemtiVzJLY3NINW1ia1Vkclp2NldGN0RHUFJ3SWtHV0hB?=
 =?utf-8?B?TVZvTG5Dd3hCS0VYWFR5NFZ0NmZXK24xWm9sSk5IZlRHWmY4dnl0U0gvdnFF?=
 =?utf-8?B?c1VPbEhPVW5KMWpmWXRJM0NWTCtmZ2JhZlM2RU4wV202WTNsZElJVDZhU3F1?=
 =?utf-8?Q?2UjSn/15PLikfR7ApMi2PdBANtWTz2LqGR3yU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 11:16:38.1710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61159ad9-1055-40e1-43ce-08dc78be5155
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7159

Hi Luca,

On 15/05/2024 16:26, Luca Fancellu wrote:
> 
> 
> This commit implements the logic to have the static shared memory banks
> from the Xen heap instead of having the host physical address passed from
> the user.
> 
> When the host physical address is not supplied, the physical memory is
> taken from the Xen heap using allocate_domheap_memory, the allocation
> needs to occur at the first handled DT node and the allocated banks
> need to be saved somewhere, so introduce the 'shm_heap_banks' static
> global variable of type 'struct meminfo' that will hold the banks
> allocated from the heap, its field .shmem_extra will be used to point
> to the bootinfo shared memory banks .shmem_extra space, so that there
> is not further allocation of memory and every bank in shm_heap_banks
> can be safely identified by the shm_id to reconstruct its traceability
> and if it was allocated or not.
NIT for the future: it's better to split 10 lines long sentence into multiple ones.
Otherwise it reads difficult.

> 
> A search into 'shm_heap_banks' will reveal if the banks were allocated
> or not, in case the host address is not passed, and the callback given
> to allocate_domheap_memory will store the banks in the structure and
> map them to the current domain, to do that, some changes to
> acquire_shared_memory_bank are made to let it differentiate if the bank
> is from the heap and if it is, then assign_pages is called for every
> bank.
> 
> When the bank is already allocated, for every bank allocated with the
> corresponding shm_id, handle_shared_mem_bank is called and the mapping
> are done.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v2 changes:
>  - add static inline get_shmem_heap_banks(), given the changes to the
>    struct membanks interface. Rebase changes due to removal of
>    owner_dom_io arg from handle_shared_mem_bank.
>    Change save_map_heap_pages return type given the changes to the
>    allocate_domheap_memory callback type.
> ---
>  xen/arch/arm/static-shmem.c | 186 ++++++++++++++++++++++++++++++------
>  1 file changed, 155 insertions(+), 31 deletions(-)
> 
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index ddaacbc77740..9c3a83042d8b 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -9,6 +9,22 @@
>  #include <asm/static-memory.h>
>  #include <asm/static-shmem.h>
> 
> +typedef struct {
> +    struct domain *d;
> +    paddr_t gbase;
> +    const char *role_str;
You could swap role_str and gbase to avoid a 4B hole on arm32

> +    struct shmem_membank_extra *bank_extra_info;
> +} alloc_heap_pages_cb_extra;
> +
> +static struct meminfo __initdata shm_heap_banks = {
> +    .common.max_banks = NR_MEM_BANKS
Do we expect that many banks?

> +};
> +
> +static inline struct membanks *get_shmem_heap_banks(void)
> +{
> +    return container_of(&shm_heap_banks.common, struct membanks, common);
> +}
> +
>  static void __init __maybe_unused build_assertions(void)
>  {
>      /*
> @@ -64,7 +80,8 @@ static bool __init is_shm_allocated_to_domio(paddr_t pbase)
>  }
> 
>  static mfn_t __init acquire_shared_memory_bank(struct domain *d,
> -                                               paddr_t pbase, paddr_t psize)
> +                                               paddr_t pbase, paddr_t psize,
> +                                               bool bank_from_heap)
>  {
>      mfn_t smfn;
>      unsigned long nr_pfns;
> @@ -84,19 +101,31 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>      d->max_pages += nr_pfns;
> 
>      smfn = maddr_to_mfn(pbase);
> -    res = acquire_domstatic_pages(d, smfn, nr_pfns, 0);
> +    if ( bank_from_heap )
> +        /*
> +         * When host address is not provided, static shared memory is
> +         * allocated from heap and shall be assigned to owner domain.
> +         */
> +        res = assign_pages(maddr_to_page(pbase), nr_pfns, d, 0);
> +    else
> +        res = acquire_domstatic_pages(d, smfn, nr_pfns, 0);
> +
>      if ( res )
>      {
> -        printk(XENLOG_ERR
> -               "%pd: failed to acquire static memory: %d.\n", d, res);
> -        d->max_pages -= nr_pfns;
> -        return INVALID_MFN;
> +        printk(XENLOG_ERR "%pd: failed to %s static memory: %d.\n", d,
> +               bank_from_heap ? "assign" : "acquire", res);
> +        goto fail;
>      }
> 
>      return smfn;
> +
> + fail:
> +    d->max_pages -= nr_pfns;
> +    return INVALID_MFN;
>  }
> 
>  static int __init assign_shared_memory(struct domain *d, paddr_t gbase,
> +                                       bool bank_from_heap,
>                                         const struct membank *shm_bank)
>  {
>      mfn_t smfn;
> @@ -109,10 +138,7 @@ static int __init assign_shared_memory(struct domain *d, paddr_t gbase,
>      psize = shm_bank->size;
>      nr_borrowers = shm_bank->shmem_extra->nr_shm_borrowers;
> 
> -    printk("%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
> -           d, pbase, pbase + psize);
> -
> -    smfn = acquire_shared_memory_bank(d, pbase, psize);
> +    smfn = acquire_shared_memory_bank(d, pbase, psize, bank_from_heap);
>      if ( mfn_eq(smfn, INVALID_MFN) )
>          return -EINVAL;
> 
> @@ -183,6 +209,7 @@ append_shm_bank_to_domain(struct kernel_info *kinfo, paddr_t start,
> 
>  static int __init handle_shared_mem_bank(struct domain *d, paddr_t gbase,
>                                           const char *role_str,
> +                                         bool bank_from_heap,
>                                           const struct membank *shm_bank)
>  {
>      bool owner_dom_io = true;
> @@ -192,6 +219,9 @@ static int __init handle_shared_mem_bank(struct domain *d, paddr_t gbase,
>      pbase = shm_bank->start;
>      psize = shm_bank->size;
> 
> +    printk("%pd: SHMEM map from %s: mphys 0x%"PRIpaddr" -> gphys 0x%"PRIpaddr", size 0x%"PRIpaddr"\n",
> +           d, bank_from_heap ? "Xen heap" : "Host", pbase, gbase, psize);
This looks more like a debug print since I don't expect user to want to see a machine address.

> +
>      /*
>       * "role" property is optional and if it is defined explicitly,
>       * then the owner domain is not the default "dom_io" domain.
> @@ -211,7 +241,8 @@ static int __init handle_shared_mem_bank(struct domain *d, paddr_t gbase,
>           * We found the first borrower of the region, the owner was not
>           * specified, so they should be assigned to dom_io.
>           */
> -        ret = assign_shared_memory(owner_dom_io ? dom_io : d, gbase, shm_bank);
> +        ret = assign_shared_memory(owner_dom_io ? dom_io : d, gbase,
> +                                   bank_from_heap, shm_bank);
>          if ( ret )
>              return ret;
>      }
> @@ -228,6 +259,39 @@ static int __init handle_shared_mem_bank(struct domain *d, paddr_t gbase,
>      return 0;
>  }
> 
> +static bool __init save_map_heap_pages(struct domain *d, struct page_info *pg,
> +                                       unsigned int order, void *extra)
> +{
> +    alloc_heap_pages_cb_extra *b_extra = (alloc_heap_pages_cb_extra *)extra;
> +    int idx = shm_heap_banks.common.nr_banks;
> +    int ret = -ENOSPC;
> +
> +    BUG_ON(!b_extra);
> +
> +    if ( idx < shm_heap_banks.common.max_banks )
> +    {
> +        shm_heap_banks.bank[idx].start = page_to_maddr(pg);
> +        shm_heap_banks.bank[idx].size = (1ULL << (PAGE_SHIFT + order));
> +        shm_heap_banks.bank[idx].shmem_extra = b_extra->bank_extra_info;
> +        shm_heap_banks.common.nr_banks++;
> +
> +        ret = handle_shared_mem_bank(b_extra->d, b_extra->gbase,
> +                                     b_extra->role_str, true,
> +                                     &shm_heap_banks.bank[idx]);
> +        if ( !ret )
> +        {
> +            /* Increment guest physical address for next mapping */
> +            b_extra->gbase += shm_heap_banks.bank[idx].size;
> +            return true;
> +        }
> +    }
> +
> +    printk("Failed to allocate static shared memory from Xen heap: (%d)\n",
> +           ret);
> +
> +    return false;
> +}
> +
>  int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>                         const struct dt_device_node *node)
>  {
> @@ -265,37 +329,97 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>          pbase = boot_shm_bank->start;
>          psize = boot_shm_bank->size;
> 
> -        if ( INVALID_PADDR == pbase )
> -        {
> -            printk("%pd: host physical address must be chosen by users at the moment", d);
> -            return -EINVAL;
> -        }
> +        /* "role" property is optional */
> +        dt_property_read_string(shm_node, "role", &role_str);
This function returns a value but you seem to ignore it

> 
>          /*
> -         * xen,shared-mem = <pbase, gbase, size>;
> -         * TODO: pbase is optional.
> +         * xen,shared-mem = <[pbase,] gbase, size>;
> +         * pbase is optional.
>           */
>          addr_cells = dt_n_addr_cells(shm_node);
>          size_cells = dt_n_size_cells(shm_node);
>          prop = dt_find_property(shm_node, "xen,shared-mem", NULL);
>          BUG_ON(!prop);
>          cells = (const __be32 *)prop->value;
> -        gbase = dt_read_paddr(cells + addr_cells, addr_cells);
> 
> -        for ( i = 0; i < PFN_DOWN(psize); i++ )
> -            if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
> -            {
> -                printk("%pd: invalid physical address 0x%"PRI_mfn"\n",
> -                       d, mfn_x(mfn_add(maddr_to_mfn(pbase), i)));
> -                return -EINVAL;
> -            }
> +        if ( pbase != INVALID_PADDR )
> +        {
> +            /* guest phys address is after host phys address */
> +            gbase = dt_read_paddr(cells + addr_cells, addr_cells);
> +
> +            for ( i = 0; i < PFN_DOWN(psize); i++ )
> +                if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
> +                {
> +                    printk("%pd: invalid physical address 0x%"PRI_mfn"\n",
> +                        d, mfn_x(mfn_add(maddr_to_mfn(pbase), i)));
> +                    return -EINVAL;
> +                }
> +
> +            /* The host physical address is supplied by the user */
> +            ret = handle_shared_mem_bank(d, gbase, role_str, false,
> +                                         boot_shm_bank);
> +            if ( ret )
> +                return ret;
> +        }
> +        else
> +        {
> +            /*
> +             * The host physical address is not supplied by the user, so it
> +             * means that the banks needs to be allocated from the Xen heap,
> +             * look into the already allocated banks from the heap.
> +             */
> +            const struct membank *alloc_bank =
> +                find_shm_bank_by_id(get_shmem_heap_banks(), shm_id);
> 
> -        /* "role" property is optional */
> -        dt_property_read_string(shm_node, "role", &role_str);
> +            /* guest phys address is right at the beginning */
> +            gbase = dt_read_paddr(cells, addr_cells);
> 
> -        ret = handle_shared_mem_bank(d, gbase, role_str, boot_shm_bank);
> -        if ( ret )
> -            return ret;
> +            if ( !alloc_bank )
> +            {
> +                alloc_heap_pages_cb_extra cb_arg = { d, gbase, role_str,
> +                    boot_shm_bank->shmem_extra };
> +
> +                /* shm_id identified bank is not yet allocated */
> +                if ( !allocate_domheap_memory(NULL, psize, save_map_heap_pages,
> +                                              &cb_arg) )
> +                {
> +                    printk(XENLOG_ERR
> +                           "Failed to allocate (%"PRIpaddr"MB) pages as static shared memory from heap\n",
Why limiting to MB?

> +                           psize >> 20);
> +                    return -EINVAL;
> +                }
> +            }
> +            else
> +            {
> +                /* shm_id identified bank is already allocated */
> +                const struct membank *end_bank =
> +                        &shm_heap_banks.bank[shm_heap_banks.common.nr_banks];
> +                paddr_t gbase_bank = gbase;
> +
> +                /*
> +                 * Static shared memory banks that are taken from the Xen heap
> +                 * are allocated sequentially in shm_heap_banks, so starting
> +                 * from the first bank found identified by shm_id, the code can
> +                 * just advance by one bank at the time until it reaches the end
> +                 * of the array or it finds another bank NOT identified by
> +                 * shm_id
> +                 */
> +                for ( ; alloc_bank < end_bank; alloc_bank++ )
> +                {
> +                    if ( strncmp(shm_id, alloc_bank->shmem_extra->shm_id,
> +                                 MAX_SHM_ID_LENGTH) != 0 )
shm_id has been already validated above, hence no need for a safe version of strcmp

> +                        break;
> +
> +                    ret = handle_shared_mem_bank(d, gbase_bank, role_str, true,
> +                                                 alloc_bank);
> +                    if ( ret )
> +                        return ret;
> +
> +                    /* Increment guest physical address for next mapping */
> +                    gbase_bank += alloc_bank->size;
> +                }
> +            }
> +        }
> 
>          /*
>           * Record static shared memory region info for later setting
> --
> 2.34.1
> 

~Michal

