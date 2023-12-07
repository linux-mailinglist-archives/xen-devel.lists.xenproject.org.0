Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167AA8084D3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 10:38:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649672.1014478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAq8-00057y-PK; Thu, 07 Dec 2023 09:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649672.1014478; Thu, 07 Dec 2023 09:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAq8-00056L-MN; Thu, 07 Dec 2023 09:38:40 +0000
Received: by outflank-mailman (input) for mailman id 649672;
 Thu, 07 Dec 2023 09:38:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3y0a=HS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rBAq7-00056B-I2
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 09:38:39 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65800c01-94e4-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 10:38:37 +0100 (CET)
Received: from DS7P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::22) by
 DM4PR12MB6109.namprd12.prod.outlook.com (2603:10b6:8:ae::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.25; Thu, 7 Dec 2023 09:38:32 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:8:2e:cafe::b8) by DS7P222CA0013.outlook.office365.com
 (2603:10b6:8:2e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Thu, 7 Dec 2023 09:38:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.26 via Frontend Transport; Thu, 7 Dec 2023 09:38:32 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 7 Dec
 2023 03:38:31 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 7 Dec
 2023 03:38:31 -0600
Received: from [10.71.193.58] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 7 Dec 2023 03:38:30 -0600
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
X-Inumbo-ID: 65800c01-94e4-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJboShSG4sXGacjYm4dbXk74VpUaWOzBFSyJbfec21YzAHGiYg8XaS0K1kFokCnN5TvrZ9IrHb3mI00iq647PNNTyNTdkLOULOnUQqnfwLWBTQjB/ZCVvAQflv65VApUuzj14f2xZUAldmMLqUmQ7u/c3SieuwUMMuApClRWK1/pshvwhCQOstV1F4INBgCG/63ymcb1TJEd5gh40rI1JzJ5fvkj6ljPIVOUqphRQyD2iCguZ998yYKeXNCIoSyNHoAOhoXQ6NifO3UvPbSUOsFFxoOO/t3V2xkxEdaKKoa9Q1xBGzlu5y9InNdyGq8Jwn6ri5gEH7TYu91sftxLDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohhPVOq4uyuU6USWFJ0krj831+BS4ot3JhlRc9Iha0g=;
 b=lNXocBLVOk3tyn5YrSS53W5oS8kBjjLiYTYd/Gy2OyMH8h47Xqpm5yqcXrqLI3yaiGufBZAYUmiLAFG7P8xmG7dkgRUdkQsT73rODf721MoR8MW/d24bZZ8FgoUfh53+GhN56zL0gFN8sXwh1qe2/CUU4bRPRwMyN6iNabPw0GdPANtgjzDTFF7oI0TeosSNj6SbIdf2SlWPTcuv7nNJE4ne0cVc+JJ1ugcy4L4+1O55CugezwfoMDQgtjMS8nVrzZPSNONfr3ZPDLrWWYdEBl470BfzDvos7AZLXUUY82c4etiBN3ijuXR4ZN+wOHwZN6pIUWf9FWH6mncEn2PoKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohhPVOq4uyuU6USWFJ0krj831+BS4ot3JhlRc9Iha0g=;
 b=D8xqrFWsMHjaYVBwQY7CpgE3CzFqmUnPWSuNXaanWjPS+I+IaOSZwJGuLbOIAhD/DHxGm225bZZRrNrvmreRt4cmYm3cE+pD2+HmswJpvcYBNFFGNvlH0+A7KAmTl2Sk0Z/Lf3BZ4HTlZoMb8GYgFYAb9CDvbk2Z0G9GNyVFuNA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <992ba724-8dfa-4285-8e92-16dfb870e4ed@amd.com>
Date: Thu, 7 Dec 2023 10:38:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/11] xen/arm: introduce allocate_domheap_memory and
 guest_physmap_memory
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
 <20231206090623.1932275-5-Penny.Zheng@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231206090623.1932275-5-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|DM4PR12MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad3c977-fa37-4c04-439d-08dbf70846e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b4nmBIeA3dEf5bmjQ7nsAfFkVa2Sy4d4+2or4wWbDAmqTTpC+8J4sKh4S7ybY+EgNe5VXe2yXKdjaHEkrQwDimfj5orvo8zjpnsbtSm9Rl0A88JgLE7Zdh2ex9kip41OjpsMc9gP88WTy/+5uc+Cw4LoPz0pCh0/nezn7CmgBa7b2x0Q7okY2jGy3501r3iPbmSpGW8ygknT5rfroF/zwyWe0Fq9o0z3Q9+/8q5WJF7YY1A1QgF68f4+6Z3P8GbM9IwTYC02mbeKPt2OQ13ULSIytgcN6bvfkwePFZYKWSVxva4hx1AvpeRSstUgJCTcpYU2Xx1a350I//VPrsncKV4sxcxDflhVfgckfgEbZYKiqsaZ1xx0gfXO5HbscOsQ427r9NjsJ7pb+jy51uW/yAwRTdzx6ilzyQsTiAcbdz0eetP2fTnR6dyCaj80Akma3jqwOcv1a2HNVtAaU+FyWw94LbTN7RJOWdiMhbtz56oe9GK5KAwV1EXXfqimoQHSInhIzzdkFGkwGvjTwW3B7Jds6ytMQ+yhUycW5c7NZyHpl9LL2rp8CtNmCwcAkHHI2Axu+6QrUWU0kSnn4luxEUl4GF2aOQ1OcARGNqIumRRIK/iX+iSsHQYQ3QCc5JFhvkQGARNxOXxUCByXv2HGC7hYn41pHMrcjbSYUFvD+Nt58AneP5yheo9w7G3D1FtuzRfYnIfPtgAQWXKFFRkO9nHpPgzwN5v1Mi4/c1i7eBl151cyJPjZgUgsS6g1Cl1SZ8wXOKsfxMPuO/NJ0q37s3zUBcNqZhTqUnc8EpxlhzoLg9nssqx0BBETaPhfXF28
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(82310400011)(40470700004)(46966006)(36840700001)(54906003)(8676002)(8936002)(110136005)(40480700001)(316002)(16576012)(47076005)(36860700001)(70206006)(44832011)(4326008)(31686004)(70586007)(426003)(40460700003)(26005)(336012)(5660300002)(2616005)(82740400003)(6666004)(36756003)(83380400001)(478600001)(81166007)(53546011)(31696002)(86362001)(41300700001)(356005)(2906002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 09:38:32.2617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad3c977-fa37-4c04-439d-08dbf70846e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6109

Hi Penny,

On 06/12/2023 10:06, Penny Zheng wrote:
> 
> 
> We split the code of allocate_bank_memory into two parts,
> allocate_domheap_memory and guest_physmap_memory.
> 
> One is about allocating guest RAM from heap, which could be re-used later for
> allocating static shared memory from heap when host address is not provided.
> The other is building up guest P2M mapping.
> 
> We also define a set of MACRO helpers to access common fields in data
> structure of "meminfo" type, e.g. "struct meminfo" is one of them, and
> later new "struct shm_meminfo" is also one of them.
> This kind of structures must have the following characteristics:
> - an array of "struct membank"
> - a member called "nr_banks" indicating current array size
> - a field indicating the maximum array size
> When introducing a new data structure, according callbacks with function type
> "retrieve_fn" shall be defined for using MACRO helpers.
> This commit defines callback "retrieve_meminfo" for data structure
> "struct meminfo".
This patch introduces quite a bit of complexity with all these helpers, so adding a rationale is crucial.
AFAIU, all of this is because we don't want to reuse struct meminfo where NR_MEM_BANKS is defined as 256,
which is a lot more than we need for shmem. Am I right?

I would like others to share the opinion here as well.

If we decide to go with this approach, what about static inline helpers instead of macros here for type checking and overall
protection such as when there is no retriever function defined (at the moment it would most probably result
in some trap).

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v1 -> v2:
> -  define a set of MACRO helpers to access common fields in data structure of
> "meminfo" type. "struct meminfo" is one of them, and according callback
> "retrieve_meminfo" is also introduced here.
> - typo of changing 1ULL to 1UL
> ---
> v2 -> v3
> - rebase and no changes
> ---
> v3 -> v4:
> rebase and no change
> ---
> v4 -> v5:
> rebase and no change
> ---
>  xen/arch/arm/domain_build.c      | 119 +++++++++++++++++++++++++------
>  xen/arch/arm/include/asm/setup.h |  33 +++++++++
>  2 files changed, 129 insertions(+), 23 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 64ae944431..a8bc78baa5 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -51,6 +51,28 @@ boolean_param("ext_regions", opt_ext_regions);
>  static u64 __initdata dom0_mem;
>  static bool __initdata dom0_mem_set;
> 
> +#ifdef CONFIG_DOM0LESS_BOOT
> +static void __init retrieve_meminfo(void *mem, unsigned int *max_mem_banks,
const void *mem

> +                                    struct membank **bank,
> +                                    unsigned int **nr_banks)
> +{
> +    struct meminfo *meminfo = (struct meminfo *)mem;
> +
> +    if ( max_mem_banks )
> +        *max_mem_banks = NR_MEM_BANKS;
> +
> +    if ( nr_banks )
> +        *nr_banks = &(meminfo->nr_banks);
> +
> +    if ( bank )
> +        *bank = meminfo->bank;
> +}
> +
> +retrieve_fn __initdata retrievers[MAX_MEMINFO_TYPE] = {
meminfo_retrievers

> +    [NORMAL_MEMINFO] = retrieve_meminfo,
> +};
> +#endif
> +
>  static int __init parse_dom0_mem(const char *s)
>  {
>      dom0_mem_set = true;
> @@ -415,32 +437,20 @@ static void __init allocate_memory_11(struct domain *d,
>  }
> 
>  #ifdef CONFIG_DOM0LESS_BOOT
> -bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
> -                                 gfn_t sgfn, paddr_t tot_size)
> +static bool __init allocate_domheap_memory(struct domain *d,
> +                                           paddr_t tot_size,
> +                                           void *mem, enum meminfo_type type)
>  {
> -    int res;
>      struct page_info *pg;
> -    struct membank *bank;
>      unsigned int max_order = ~0;
> -
> -    /*
> -     * allocate_bank_memory can be called with a tot_size of zero for
> -     * the second memory bank. It is not an error and we can safely
> -     * avoid creating a zero-size memory bank.
> -     */
> -    if ( tot_size == 0 )
> -        return true;
> -
> -    bank = &kinfo->mem.bank[kinfo->mem.nr_banks];
> -    bank->start = gfn_to_gaddr(sgfn);
> -    bank->size = tot_size;
> +    unsigned int *nr_banks = GET_NR_BANKS(mem, type);
what if mem is NULL? You would end up dereferencing NULL pointer

> 
>      while ( tot_size > 0 )
>      {
>          unsigned int order = get_allocation_size(tot_size);
> +        struct membank *membank;
> 
>          order = min(max_order, order);
> -
>          pg = alloc_domheap_pages(d, order, 0);
>          if ( !pg )
>          {
> @@ -460,15 +470,78 @@ bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
>              continue;
>          }
> 
> -        res = guest_physmap_add_page(d, sgfn, page_to_mfn(pg), order);
> -        if ( res )
> -        {
> -            dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
> +        if ( *nr_banks == MAX_MEM_BANKS(type) )
shouldn't you move this check at the beginning of the loop before the allocation?
what if you enter this function with this condition being true.

>              return false;
> -        }
> +
The name of the function does not reflect that apart from allocation you will also
register the allocated memory regions.

> +        membank = GET_MEMBANK(mem, type, *nr_banks);
> +        membank->start = mfn_to_maddr(page_to_mfn(pg));
page_to_maddr

> +        membank->size = 1ULL << (PAGE_SHIFT + order);
> +        (*nr_banks)++;
> +        tot_size -= membank->size;
> +    }
> +
> +    return true;
> +}
> +
> +static int __init guest_physmap_memory(struct domain *d,
> +                                       void *mem, enum meminfo_type type,
> +                                       gfn_t sgfn)
> +{
> +    unsigned int i;
> +    int res;
> +    unsigned int *nr_banks = GET_NR_BANKS(mem, type);
what if mem is NULL? You would end up dereferencing NULL pointer

> +
> +    for ( i = 0; i < *nr_banks; i++ )
> +    {
> +        struct membank *membank = GET_MEMBANK(mem, type, i);
> +        paddr_t start = membank->start;
> +        paddr_t size = membank->size;
> +        unsigned int order = get_order_from_bytes(size);
> +
> +        /* Size must be power of two */
> +        BUG_ON(!size || (size & (size - 1)));
> +        res = guest_physmap_add_page(d, sgfn, maddr_to_mfn(start), order);
> +        if ( res )
> +            return res;
Here, you return a rc, but ...

> 
>          sgfn = gfn_add(sgfn, 1UL << order);
> -        tot_size -= (1ULL << (PAGE_SHIFT + order));
> +    }
> +
> +    return 0;
> +}
> +
> +bool __init allocate_bank_memory(struct domain *d,
> +                                 struct kernel_info *kinfo,
> +                                 gfn_t sgfn,
> +                                 paddr_t total_size)
> +{
> +    struct membank *bank;
> +    struct meminfo host = { 0 };
> +
> +    /*
> +     * allocate_bank_memory can be called with a total_size of zero for
> +     * the second memory bank. It is not an error and we can safely
> +     * avoid creating a zero-size memory bank.
> +     */
> +    if ( total_size == 0 )
> +        return true;
> +
> +    bank = &kinfo->mem.bank[kinfo->mem.nr_banks];
> +    bank->start = gfn_to_gaddr(sgfn);
> +    bank->size = total_size;
> +
> +    if ( !allocate_domheap_memory(d, total_size, (void *)&host, NORMAL_MEMINFO) )
> +    {
> +        printk(XENLOG_ERR "Failed to allocate (%"PRIpaddr"MB) pages to %pd\n",
> +               total_size >> 20, d);
> +        return false;
> +    }
> +
> +    if ( guest_physmap_memory(d, (void *)&host, NORMAL_MEMINFO, sgfn) )
... here you are not making use of it (to print the error code).

> +    {
> +        printk(XENLOG_ERR "Failed to map (%"PRIpaddr"MB) pages to %pd\n",
> +               total_size >> 20, d);
> +        return false;
>      }
> 
>      kinfo->mem.nr_banks++;
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 3a2b35ea46..bc5f08be97 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -57,6 +57,39 @@ struct meminfo {
>      struct membank bank[NR_MEM_BANKS];
>  };
> 
A comment with a meaning of each value would be handy
> +enum meminfo_type {
> +    NORMAL_MEMINFO,
> +    MAX_MEMINFO_TYPE,
do you have a need for checking the max? If so, I would try to name the values in a similar, more informative way,
e.g. MEMINFO_TYPE_NORMAL

> +};
> +
> +/*
> + * Define a set of MACRO helpers to access meminfo_type, like "struct meminfo"
> + * as type of NORMAL_MEMINFO, etc.
> + * This kind of structure must have a array of "struct membank",
> + * a member called nr_banks indicating the current array size, and also a field
> + * indicating the maximum array size.
field? Looking at struct meminfo and then shm_meminfo you just have a macro to indicate max nr.

> + */
> +typedef void (*retrieve_fn)(void *, unsigned int *, struct membank **,
I think MISRA requires that parameters should be named.
void * can be const since there is no helper modifying the passed structure (here and in macros when casting)

> +                            unsigned int **);
> +
> +#define MAX_MEM_BANKS(type) ({                              \
> +    unsigned int _max_mem_banks;                            \
> +    retrievers[type](NULL, &_max_mem_banks, NULL, NULL);    \
> +    _max_mem_banks;                                         \
> +})
> +
> +#define GET_MEMBANK(mem, type, index) ({                    \
> +    struct membank *_bank;                                  \
> +    retrievers[type]((void *)(mem), NULL, &_bank, NULL);    \
> +    &(_bank[index]);                                        \
> +})
> +
> +#define GET_NR_BANKS(mem, type) ({                          \
> +    unsigned int *_nr_banks;                                \
> +    retrievers[type]((void *)mem, NULL, NULL, &_nr_banks);  \
> +    _nr_banks;                                              \
> +})
> +
>  /*
>   * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
>   * The purpose of the domU flag is to avoid getting confused in
> --
> 2.25.1
> 

~Michal


