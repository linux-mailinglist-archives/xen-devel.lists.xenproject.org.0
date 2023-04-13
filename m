Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1826E157E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 21:56:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520937.809099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn32s-0007mr-UR; Thu, 13 Apr 2023 19:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520937.809099; Thu, 13 Apr 2023 19:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn32s-0007jO-PY; Thu, 13 Apr 2023 19:55:50 +0000
Received: by outflank-mailman (input) for mailman id 520937;
 Thu, 13 Apr 2023 19:55:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbVr=AE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pn32r-00078B-1J
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 19:55:49 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20616.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e1cf23e-da35-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 21:55:48 +0200 (CEST)
Received: from DM6PR06CA0074.namprd06.prod.outlook.com (2603:10b6:5:336::7) by
 BN9PR12MB5228.namprd12.prod.outlook.com (2603:10b6:408:101::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30; Thu, 13 Apr 2023 19:55:43 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::86) by DM6PR06CA0074.outlook.office365.com
 (2603:10b6:5:336::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 19:55:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 19:55:43 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 14:55:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 12:55:42 -0700
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 13 Apr 2023 14:55:41 -0500
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
X-Inumbo-ID: 2e1cf23e-da35-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1RumNiDMJmG1hM1kZQr0d4OTr4PfEOdC5AHLO9hw1ReWAj7YL81K26iwHiojYIn/N4RAIjY3I2MJsrqwVVBYJtE3Aj1+xQhme/uqAyAbUNtaH3E/axOptF18F9fKmBnevVNZxBSjiTOcDMM8KrYaJ7z+P8to2BZsRYxFLzymSnbdtLr20kf5DLXHbFKZz1lU8DsWVcZ1MrXQWgZxhU4R6SyaPEOLj7pl8etuvFusyKoBCGhy4DJ9sEkaJjxqkBhic2kXAWEMOIvN9RydWU1tJ452JiORA+Fnnn78XGNhAUUzD/Ny4+CEdWnEfIHojq6VhvOTdWj6lbVTJ4DX01ftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/18PWwB/WDEzRgk5tqv7qd4aPS6M0W9Cu4ti6yz3Lfo=;
 b=hAbMo//v3mMHziciVHh5Y7530YWttAzOzNPZfkzpF3yNzH3IbOE/0sQmOz6Kxv+BmH2E2It+Qtz3EhLEhc3GdlOfTkrXXbpsL49/A6BPP2Gki+G9ryGxdzIgRcgerm2gMTBIwiTh0cafmaX0vSNld4e4PSoCSdUuLO3M03KuvejRz/9+qiGnBz38XfsaDKW8eHxEeABfviLAOKWGplzjEXdGHW8Cv817ctSY1F+39HddrJKZdUX/hz8EEA+jFvKgGqvTTTZV6tTSyk0uFHQPHb4vLafS51QaJX0suB1eoor1Yc7H7M626u8x1GQAi7sEYvCblVKe4N16IhWi+wwUIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/18PWwB/WDEzRgk5tqv7qd4aPS6M0W9Cu4ti6yz3Lfo=;
 b=4FkaS2PfIbRuoZqv+2k60RXGkkSUoHbzzroS3WMZmszwrqGA98zxyQKOVt7s2IsgNIdVg27tc93+viBF1MuFQHcdOHJDToeEygtu0637SwMBEBYHysml05sKP40xjokL2Yw9/JA+Yy2s7b6RVE/Dt4/R0eP4Sbn/s7pm7/1qHIU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <abbd3be3-be30-58a9-74e8-17aa5b2a8e84@amd.com>
Date: Thu, 13 Apr 2023 15:55:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 5/8] xen/arm: support static shared memory when host
 address not provided
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230223054105.2357217-1-Penny.Zheng@arm.com>
 <20230223054105.2357217-6-Penny.Zheng@arm.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20230223054105.2357217-6-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT054:EE_|BN9PR12MB5228:EE_
X-MS-Office365-Filtering-Correlation-Id: 2891d8cd-9fc8-44e0-7c45-08db3c5910fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+btdOB3tVf1KrCcTvt4szeT2vlKwzr17aB44/LLJZE+iHp4pov4PLadHkQLus+G3FR0WpEz+z7OHLQ9VkDzhg/imOYtSxIsxQigcWJ4eOO8ZBgUHG1bkifDXsCKVgO31FLaAuIDp3gs+/hI3BHb4NJA4u/ZTK98oqq0usXuJHwifturc+1ngdfUjVJN1wcfd8eVMAtKpdX8TeRSSkX3xUOt6UHJz9/E1zxrLgALhUtOrT9cOgkhDqC9IlY61keH9ZFp/bTe7YcPrP8o5KTXd3O4b5YzH1vRU2ZBZ3EyJEl4U/0C3EUzKOPGrvkGnXvZ1VrG0z/aB6hGwMNwV0LEH5OXunAOGv0RRRXUjZZZi2vBuPNpZF7VYtwy+H1iP7vMiEPTmtUe9dU8ic6jD6mm3x/1IKzF9bSw9GExCuxS6BpImZ48x+WhB24fUMRSgvU/qmRlpqORtcJVyzwUiMCWG0F+Qqkc9bo5gzT25Bvz6un24js7BYm/hn2D2Hn522uho/f9NTivpF1nABFmV7IbZX7AP4fN3NegE/lt/1FLCGsZ5IXxQt82f6JYBBH1j9PUB85+R/zTAUyLLITtkeSpHPWr1HpVHKJdedoj/a6FBLFIpLgbC2w3uWNW6D6Iiy4kYnWfVapEBV1ar6eHQPPKjjCiMZG0L0srN8wsLnbRAE/me4B6dR4EHDPfjBAQNj8aX+YW+znZNZBAUV8QjXu8zzA5eW/BcGS3+QAUTdhsBQJyeNAAPflg010z2lGxKX+y0S6LDIncCezVMIpw5D5vAZA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199021)(40470700004)(36840700001)(46966006)(336012)(426003)(26005)(31686004)(40480700001)(70586007)(70206006)(53546011)(36756003)(31696002)(2906002)(30864003)(83380400001)(82310400005)(47076005)(2616005)(186003)(36860700001)(4326008)(40460700003)(44832011)(110136005)(54906003)(86362001)(16576012)(5660300002)(8676002)(8936002)(81166007)(478600001)(316002)(356005)(41300700001)(82740400003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 19:55:43.7301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2891d8cd-9fc8-44e0-7c45-08db3c5910fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5228

Hi Penny

On 2/23/23 00:41, Penny Zheng wrote:
> In order to support static shared memory when host address not provided,
> we shall do the following modification:
> - we shall let Xen allocate memory from heap for static shared memory
> at first domain, no matter it is owner or borrower.
> - In acquire_shared_memory_bank, as static shared memory has already
> been allocated from heap, we shall assign them to the owner domain
> using function "assign_pages".
> - Function get_shm_pages_reference is created to add as many
> additional reference as the number of borrowers.
> - We implement a new helper "add_foreign_mapping_for_borrower" to set
> up foreign memory mapping for borrower.
> 
> Instead of using multiple function parameters to deliver various shm-related
> info, like host physical address, SHMID, etc, and with the introduction
> of new struct "shm_memnode" to include banked host memory info, we switch to
> use "shm_memnode" as function parameter to replace them all, to make codes more
> clear and tidy.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v1 -> v2:
> - combine commits 4 - 6 in Serie 1
> - Adapt to changes of introducing "struct shm_memnode"
> ---
>  xen/arch/arm/domain_build.c | 222 +++++++++++++++++++++++++-----------
>  1 file changed, 155 insertions(+), 67 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 91feb8f37c..9b4aabaf22 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -869,6 +869,11 @@ static void __init assign_static_memory_11(struct domain *d,
>  }
> 
>  #ifdef CONFIG_STATIC_SHM
> +static bool __init is_shm_allocated_from_heap(struct shm_memnode *node)
> +{
> +    return (node->meminfo.nr_banks != 0);
> +}
> +
>  static int __init acquire_nr_borrower_domain(const char *shm_id,
>                                               unsigned long *nr_borrowers)
>  {
> @@ -912,12 +917,12 @@ static struct shm_memnode * __init find_shm_memnode(const char *shm_id)
>   * This function checks whether the static shared memory region is
>   * already allocated to dom_io.
>   */
> -static bool __init is_shm_allocated_to_domio(paddr_t pbase)
> +static bool __init is_shm_allocated_to_domio(struct shm_memnode *node)
>  {
>      struct page_info *page;
>      struct domain *d;
> 
> -    page = maddr_to_page(pbase);
> +    page = maddr_to_page(node->meminfo.bank[0].start);
>      d = page_get_owner_and_reference(page);
>      if ( d == NULL )
>          return false;
> @@ -935,67 +940,129 @@ static bool __init is_shm_allocated_to_domio(paddr_t pbase)
>  }
> 
>  static mfn_t __init acquire_shared_memory_bank(struct domain *d,
> -                                               paddr_t pbase, paddr_t psize)
> +                                               struct shm_meminfo *meminfo,
> +                                               bool paddr_assigned)
>  {
> -    mfn_t smfn;
> -    unsigned long nr_pfns;
>      int res;
> +    unsigned int i = 0;
> 
> -    /*
> -     * Pages of statically shared memory shall be included
> -     * into domain_tot_pages().
> -     */
> -    nr_pfns = PFN_DOWN(psize);
> -    if ( (UINT_MAX - d->max_pages) < nr_pfns )
> +    for ( ; i < meminfo->nr_banks; i++ )
>      {
> -        printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages: %lu.\n",
> -               d, nr_pfns);
> +        paddr_t pbase = meminfo->bank[i].start, psize = meminfo->bank[i].size;
> +        unsigned long nr_pfns;
> +
> +        /*
> +         * Pages of statically shared memory shall be included
> +         * into domain_tot_pages().
> +         */
> +        nr_pfns = PFN_DOWN(psize);
> +        if ( (UINT_MAX - d->max_pages) < nr_pfns )
> +        {
> +            printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages: %lu.\n",
> +                   d, nr_pfns);
> +            return INVALID_MFN;
> +        }
> +        d->max_pages += nr_pfns;
> +
> +        if ( paddr_assigned )
> +        {
> +            res = acquire_domstatic_pages(d, maddr_to_mfn(pbase), nr_pfns, 0);
> +            if ( res )
> +            {
> +                printk(XENLOG_ERR
> +                       "%pd: failed to acquire static memory: %d.\n", d, res);
> +                goto fail;
> +            }
> +        }
> +        else
> +            /*
> +             * When host address is not provided, static shared memory is
> +             * allocated from heap and shall be assigned to owner domain.
> +             */
> +            if ( assign_pages(maddr_to_page(pbase), nr_pfns, d, 0) )
> +                goto fail;
> +    }
> +
> +    return maddr_to_mfn(meminfo->bank[0].start);
> +
> + fail:
> +        while( --i >= 0 )

This is an infinite loop. When building with EXTRA_CFLAGS_XEN_CORE="-Wtype-limits -Wno-error=type-limits", we see:

arch/arm/domain_build.c: In function ‘acquire_shared_memory_bank’:
arch/arm/domain_build.c:989:20: warning: comparison of unsigned expression in ‘>= 0’ is always true [-Wtype-limits]
  989 |         while( --i >= 0 )
      |                    ^~


Also, the indentation seems off here.

> +            d->max_pages -= PFN_DOWN(meminfo->bank[i].size);
>          return INVALID_MFN;
> +}
> +
> +static int __init get_shm_pages_reference(struct domain *d,
> +                                          struct shm_meminfo *meminfo,
> +                                          unsigned long count)
> +{
> +    struct page_info *page;
> +    unsigned int i = 0, j;
> +
> +    for ( ; i < meminfo->nr_banks; i++ )
> +    {
> +        paddr_t pbase = meminfo->bank[i].start, psize = meminfo->bank[i].size;
> +        unsigned long nr_pages = PFN_DOWN(psize);
> +
> +        page = maddr_to_page(pbase);
> +        for ( j = 0; j < nr_pages; j++ )
> +        {
> +            if ( !get_page_nr(page + j, d, count) )
> +            {
> +                printk(XENLOG_ERR
> +                       "Failed to add %lu references to page %"PRI_mfn".\n",
> +                       count, mfn_x(page_to_mfn(page + j)));
> +                goto fail;
> +            }
> +        }
>      }
> -    d->max_pages += nr_pfns;
> 
> -    smfn = maddr_to_mfn(pbase);
> -    res = acquire_domstatic_pages(d, smfn, nr_pfns, 0);
> -    if ( res )
> +    return 0;
> +
> + fail:
> +    while ( --j >= 0 )

Infinite loop [-Wtype-limits]

> +        put_page_nr(page + j, count);
> +    while ( --i >= 0 )

Infinite loop [-Wtype-limits]

>      {
> -        printk(XENLOG_ERR
> -               "%pd: failed to acquire static memory: %d.\n", d, res);
> -        d->max_pages -= nr_pfns;
> -        return INVALID_MFN;
> +        page = maddr_to_page(meminfo->bank[i].start);
> +        j = PFN_DOWN(meminfo->bank[i].size);
> +        while ( --j >= 0 )

Infinite loop [-Wtype-limits]

> +            put_page_nr(page + j, count);
>      }
> +    return -EINVAL;
> 
> -    return smfn;
>  }
> -
>  static int __init assign_shared_memory(struct domain *d,
> -                                       paddr_t pbase, paddr_t psize,
> -                                       paddr_t gbase, const char *shm_id)
> +                                       struct shm_memnode *node, paddr_t gbase,
> +                                       bool paddr_assigned)
>  {
>      mfn_t smfn;
> -    int ret = 0;
> -    unsigned long nr_pages, nr_borrowers, i;
> -    struct page_info *page;
> -
> -    printk("%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
> -           d, pbase, pbase + psize);
> +    int ret;
> +    unsigned long nr_borrowers, i;
> +    struct shm_meminfo *meminfo = &node->meminfo;
> 
> -    smfn = acquire_shared_memory_bank(d, pbase, psize);
> +    smfn = acquire_shared_memory_bank(d, meminfo, paddr_assigned);
>      if ( mfn_eq(smfn, INVALID_MFN) )
>          return -EINVAL;
> 
> -    /*
> -     * DOMID_IO is not auto-translated (i.e. it sees RAM 1:1). So we do not need
> -     * to create mapping in the P2M.
> -     */
> -    nr_pages = PFN_DOWN(psize);
> -    if ( d != dom_io )
> +    for ( i = 0; i < meminfo->nr_banks; i++ )
>      {
> -        ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn,
> -                                      PFN_DOWN(psize));
> -        if ( ret )
> +        paddr_t pbase = meminfo->bank[i].start, psize = meminfo->bank[i].size;
> +
> +        /*
> +         * DOMID_IO is not auto-translated (i.e. it sees RAM 1:1). So we do
> +         * not need to create mapping in the P2M.
> +         */
> +        if ( d != dom_io )
>          {
> -            printk(XENLOG_ERR "Failed to map shared memory to %pd.\n", d);
> -            return ret;
> +            ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase),
> +                                          maddr_to_mfn(pbase),
> +                                          PFN_DOWN(psize));
> +            if ( ret )
> +            {
> +                printk(XENLOG_ERR "Failed to map shared memory to %pd.\n", d);
> +                return ret;
> +            }
> +            gbase += psize;
>          }
>      }
> 
> @@ -1003,7 +1070,7 @@ static int __init assign_shared_memory(struct domain *d,
>       * Get the right amount of references per page, which is the number of
>       * borrower domains.
>       */
> -    ret = acquire_nr_borrower_domain(shm_id, &nr_borrowers);
> +    ret = acquire_nr_borrower_domain(node->shm_id, &nr_borrowers);
>      if ( ret )
>          return ret;
> 
> @@ -1015,24 +1082,30 @@ static int __init assign_shared_memory(struct domain *d,
>       * So if the borrower is created first, it will cause adding pages
>       * in the P2M without reference.
>       */
> -    page = mfn_to_page(smfn);
> -    for ( i = 0; i < nr_pages; i++ )
> +    return get_shm_pages_reference(d, meminfo, nr_borrowers);
> +}
> +
> +static int __init add_foreign_mapping_for_borrower(struct domain *d,
> +                                                   struct shm_memnode *node,
> +                                                   paddr_t gbase)
> +{
> +    unsigned int i = 0;
> +    struct shm_meminfo *meminfo = &node->meminfo;
> +
> +    for ( ; i < meminfo->nr_banks; i++ )
>      {
> -        if ( !get_page_nr(page + i, d, nr_borrowers) )
> -        {
> -            printk(XENLOG_ERR
> -                   "Failed to add %lu references to page %"PRI_mfn".\n",
> -                   nr_borrowers, mfn_x(smfn) + i);
> -            goto fail;
> -        }
> +        paddr_t pbase = meminfo->bank[i].start, psize = meminfo->bank[i].size;
> +        int ret;
> +
> +        /* Set up P2M foreign mapping for borrower domain. */
> +        ret = map_regions_p2mt(d, _gfn(PFN_UP(gbase)), PFN_DOWN(psize),
> +                               _mfn(PFN_UP(pbase)), p2m_map_foreign_rw);
> +        if ( ret )
> +            return ret;
> +        gbase += psize;
>      }
> 
>      return 0;
> -
> - fail:
> -    while ( --i >= 0 )
> -        put_page_nr(page + i, nr_borrowers);
> -    return ret;
>  }
> 
>  static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
> @@ -1156,7 +1229,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
> 
>      dt_for_each_child_node(node, shm_node)
>      {
> -        paddr_t gbase, pbase, psize;
> +        paddr_t gbase;
>          int ret = 0;
>          const char *role_str;
>          const char *shm_id;
> @@ -1185,15 +1258,30 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>                                           shm_id);
>          if ( !shm_memnode )
>              return -EINVAL;
> -        pbase = shm_memnode->meminfo.bank[0].start;
> -        psize = shm_memnode->meminfo.bank[0].size;
> +
> +        /*
> +         * When host address is not provided in "xen,shared-mem",
> +         * we let Xen allocate memory from heap at first domain.
> +         */
> +        if ( !paddr_assigned && !is_shm_allocated_from_heap(shm_memnode) )
> +        {
> +            if ( !allocate_domheap_memory(NULL, shm_memnode->meminfo.tot_size,
> +                                          (void *)&shm_memnode->meminfo,
> +                                          SHM_MEMINFO) )
> +            {
> +                printk(XENLOG_ERR
> +                       "Failed to allocate (%"PRIpaddr"MB) pages as static shared memory from heap\n",
> +                       shm_memnode->meminfo.tot_size >> 20);
> +                return -EINVAL;
> +            }
> +        }
> 
>          /*
>           * DOMID_IO is a fake domain and is not described in the Device-Tree.
>           * Therefore when the owner of the shared region is DOMID_IO, we will
>           * only find the borrowers.
>           */
> -        if ( (owner_dom_io && !is_shm_allocated_to_domio(pbase)) ||
> +        if ( (owner_dom_io && !is_shm_allocated_to_domio(shm_memnode)) ||
>               (!owner_dom_io && strcmp(role_str, "owner") == 0) )
>          {
>              /*
> @@ -1201,16 +1289,14 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>               * specified, so they should be assigned to dom_io.
>               */
>              ret = assign_shared_memory(owner_dom_io ? dom_io : d,
> -                                       pbase, psize, gbase, shm_id);
> +                                       shm_memnode, gbase, paddr_assigned);
>              if ( ret )
>                  return ret;
>          }
> 
>          if ( owner_dom_io || (strcmp(role_str, "borrower") == 0) )
>          {
> -            /* Set up P2M foreign mapping for borrower domain. */
> -            ret = map_regions_p2mt(d, _gfn(PFN_UP(gbase)), PFN_DOWN(psize),
> -                                   _mfn(PFN_UP(pbase)), p2m_map_foreign_rw);
> +            ret = add_foreign_mapping_for_borrower(d, shm_memnode, gbase);
>              if ( ret )
>                  return ret;
>          }
> @@ -1219,7 +1305,9 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>           * Record static shared memory region info for later setting
>           * up shm-node in guest device tree.
>           */
> -        ret = append_shm_bank_to_domain(kinfo, gbase, psize, shm_id);
> +        ret = append_shm_bank_to_domain(kinfo, gbase,
> +                                        shm_memnode->meminfo.tot_size,
> +                                        shm_memnode->shm_id);
>          if ( ret )
>              return ret;
>      }
> --
> 2.25.1
> 
> 

