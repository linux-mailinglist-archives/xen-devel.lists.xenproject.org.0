Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36CB68E26D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 21:58:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491445.760535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPV38-0002RX-6C; Tue, 07 Feb 2023 20:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491445.760535; Tue, 07 Feb 2023 20:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPV38-0002PO-3D; Tue, 07 Feb 2023 20:58:46 +0000
Received: by outflank-mailman (input) for mailman id 491445;
 Tue, 07 Feb 2023 20:58:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Z3Z=6D=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pPV36-0001Ev-ML
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 20:58:44 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34461414-a72a-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 21:58:43 +0100 (CET)
Received: from DM5PR08CA0034.namprd08.prod.outlook.com (2603:10b6:4:60::23) by
 CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.36; Tue, 7 Feb 2023 20:58:40 +0000
Received: from DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::1) by DM5PR08CA0034.outlook.office365.com
 (2603:10b6:4:60::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36 via Frontend
 Transport; Tue, 7 Feb 2023 20:58:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT011.mail.protection.outlook.com (10.13.172.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.16 via Frontend Transport; Tue, 7 Feb 2023 20:58:40 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Feb
 2023 14:58:39 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Feb
 2023 12:58:39 -0800
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Feb 2023 14:58:37 -0600
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
X-Inumbo-ID: 34461414-a72a-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFOEBFDy6BNMGaaOBF6SjgM+VeCINujcEKQb5cBotnLp/PD0mvP86LDGb84DLd4tE+cD8QiRATY0ZVFZl+Pi1RQ2a7V7255vUESPG3T50caP8px+P85zwnW6ZgUnR1vhEuPcw4VZO9jY4E1BJAJhZE5lF3Nju/Q++qMTe3wB0uAQgjs/ECqILI+oYIZuwQ5k/JX9YaIbimmKNZvLO2HuVLhMgRu95VXXLbNtNluB/vok/TfE6FmxamTKfy34wcsNnQcdEVNapiNdJmELgM4/9hO6Yshr6ALgEndlKtXN6Ovp9c39RUweL/GEnyUjywYosXI5t4EtMqEQcBmp0wOs8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcWWu3sdWRHgqCgYw3wtJptaHraof7I55haYkmrwPo8=;
 b=bebhgvePiXpqLyZ3/2fHmXGgQr694PrP7OinAi3H127QKN9bn3mal5ng1nJa0zaXQBa3PCuSHR+FItCuHbVGdx9CmraFYc5kjOINJXjZtfebCMIdVugoSR4AwzzWahnpbTF7Nb2xo7AL2Co9yCovmus61b7q7hfHMzhFT92iiANEKGr3x2x52upeGDj/QaFycRZqzguNz55B48mp2UOU56iB1Zg8mPWhjpR7hRmnw3LAe//CrIyVFnYAj0suucUh3TAV000ruAewApf/nW2tmVKfTsIXbZ0HGznz4b/mD012TsSb2vZ6K/5CDVhkHIHWz1RnAiRpTPOrmAPI43G2OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcWWu3sdWRHgqCgYw3wtJptaHraof7I55haYkmrwPo8=;
 b=NpsBiV8no1NKlPQAZiRAm8fi4b6apLOcbopzM11Ne/qEWgXydu6BbKz3WUZdJRvCHeAlS7b3vBi1x7Oy0MO7ZcNi65KQE9yoM2mmaQbrpQiib1uwA1QOGMtSLp0QVH9zb+vRp0W+7qNJQs7uLpt1Wi8mNTmWrlZV83T1MqfDKhc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <11cd5c7c-235b-2daf-d12f-0c3cfe7e8185@amd.com>
Date: Tue, 7 Feb 2023 15:58:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v1 06/13] xen/arm: assign shared memory to owner when host
 address not provided
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-7-Penny.Zheng@arm.com>
Content-Language: en-US
In-Reply-To: <20221115025235.1378931-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT011:EE_|CH2PR12MB4311:EE_
X-MS-Office365-Filtering-Correlation-Id: 4658e963-0150-4aba-1038-08db094e171b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K77+EtG/fiqBFFNOj+RmebA4gehZihBxQ2/t6Xcf72kZ53ORMOvCXhmaZbszf3UVDg2nm9R7Wfvsn+A1m+mTyTw19LAAn3MCXeHXiF0BVIkjBfHbSwGiIoWsuzhm1jhWnQ+75yI/UolY2/v7y2ZZ7fu0yVlrSCnscBUZXBrv5AwiJj9FzV6S6NnEBH33vpCI68d1O/IzW/NEcRsEor7bMagRNzfuD2LXhiZpum0febjtU7DXL1HbwkYFc9QE8Aws+RSSVR7XAMMXY80CCKazLfdIAkyTWHpE0AztwgxDOrcsbv6rHetSfmmmtdIyCifPOm5rq/+I7tlDWB0n71233ChZgMZO95pKGCJJP8OCRLezhC1KYjAljTWsKvpquzwsk0jupgzFt4+0oASHsviFRfPj+c8EpyUhPZ1qFBOk95+XQcEynfSoEhR6qe9CLuEovYf2fBcrIiTc0fpNG112jcXLNuu0q4CNtB6yNLjBheMxzRF0m/H0m8DYaT6xtdNAjen/DywMkJdOgP0aFgcLHSVKPXJzbDUeLwMlX+U+VrxutD2FSqSyVl4M8s1CdmnnF5IwjQifFB07mBIZ3KlMpq1cwwdvCMrFrD0AmJRekzgAJS/nu4Ev3f1j0M9/mPPezw+LnKyuxVLb/0l03PqAcC/aRrwtGrw/GG+CEDnnS41VNwJrDpo2+gKiNqvtiIGX8jpkq1HrqapZZeb2vFCOaXh7tDRfP8Gl/zpPa/vgT9hKemwKDvXAMh+om3de7OYH7xNUvfB6gSorgzALmwS89A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199018)(46966006)(36840700001)(40470700004)(40460700003)(40480700001)(82310400005)(47076005)(83380400001)(426003)(336012)(36860700001)(6666004)(478600001)(53546011)(356005)(2616005)(186003)(26005)(81166007)(31696002)(86362001)(36756003)(31686004)(82740400003)(8936002)(5660300002)(70586007)(41300700001)(70206006)(2906002)(44832011)(316002)(16576012)(110136005)(54906003)(4326008)(8676002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 20:58:40.1868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4658e963-0150-4aba-1038-08db094e171b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4311

Hi Penny,

On 11/14/22 21:52, Penny Zheng wrote:
> With the introduction of new scenario where host address is not provided
> in "xen,shared-mem", the function "assign_shared_memory" shall be adapted
> to it too.
> 
> Shared memory will already be allocated from heap, when calling
> "assign_shared_memory" with unprovided host address.
> So in "assign_shared_memory", we just need to assign these static shared pages
> to its owner domain using function "assign_pages", and add as many
> additional reference as the number of borrowers.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>  xen/arch/arm/domain_build.c | 160 ++++++++++++++++++++++++++++++------
>  1 file changed, 133 insertions(+), 27 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 3de96882a5..faf0784bb0 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -817,8 +817,12 @@ static bool __init is_shm_allocated_to_domio(struct shm_membank *shm_membank)
>  {
>      struct page_info *page;
>      struct domain *d;
> +    paddr_t pbase;
> 
> -    page = maddr_to_page(shm_membank->mem.bank->start);
> +    pbase = shm_membank->mem.banks.meminfo ?
> +            shm_membank->mem.banks.meminfo->bank[0].start :
> +            shm_membank->mem.bank->start;
> +    page = maddr_to_page(pbase);
>      d = page_get_owner_and_reference(page);
>      if ( d == NULL )
>          return false;
> @@ -907,6 +911,7 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>      mfn_t smfn;
>      unsigned long nr_pfns;
>      int res;
> +    struct page_info *page;
> 
>      /*
>       * Pages of statically shared memory shall be included
> @@ -922,33 +927,82 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>      d->max_pages += nr_pfns;
> 
>      smfn = maddr_to_mfn(pbase);
> -    res = acquire_domstatic_pages(d, smfn, nr_pfns, 0);
> -    if ( res )
> +    page = mfn_to_page(smfn);
> +    /*
> +     * If page is allocated from heap as static shared memory, then we just
> +     * assign it to the owner domain
> +     */
> +    if ( page->count_info == (PGC_state_inuse | PGC_static) )
>      {
> -        printk(XENLOG_ERR
> -               "%pd: failed to acquire static memory: %d.\n", d, res);
> -        d->max_pages -= nr_pfns;
> -        return INVALID_MFN;
> +        res = assign_pages(page, nr_pfns, d, 0);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR
> +                   "%pd: failed to assign static memory: %d.\n", d, res);
> +            return INVALID_MFN;
> +        }
> +    }
> +    else
> +    {
> +        res = acquire_domstatic_pages(d, smfn, nr_pfns, 0);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR
> +                   "%pd: failed to acquire static memory: %d.\n", d, res);
> +                   d->max_pages -= nr_pfns;
> +            return INVALID_MFN;
> +        }
>      }
> 
>      return smfn;
>  }
> 
> -static int __init assign_shared_memory(struct domain *d,
> -                                       struct shm_membank *shm_membank,
> -                                       paddr_t gbase)
> +static void __init remove_shared_memory_ref(struct page_info *page,
> +                                            unsigned long nr_pages,
> +                                            unsigned long nr_borrowers)
>  {
> -    mfn_t smfn;
> -    int ret = 0;
> -    unsigned long nr_pages, nr_borrowers, i;
> -    struct page_info *page;
> -    paddr_t pbase, psize;
> +    while ( --nr_pages >= 0 )

arch/arm/domain_build.c: In function ‘remove_shared_memory_ref’:
arch/arm/domain_build.c:969:24: warning: comparison of unsigned expression in ‘>= 0’ is always true [-Wtype-limits]
  969 |     while ( --nr_pages >= 0 )
      |                        ^~

> +         put_page_nr(page + nr_pages, nr_borrowers);
> +}
> 
> -    pbase = shm_membank->mem.bank->start;
> -    psize = shm_membank->mem.bank->size;
> +static int __init add_shared_memory_ref(struct domain *d, struct page_info *page,
> +                                        unsigned long nr_pages,
> +                                        unsigned long nr_borrowers)
> +{
> +    unsigned int i;
> 
> -    printk("%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
> -           d, pbase, pbase + psize);
> +    /*
> +     * Instead of letting borrower domain get a page ref, we add as many
> +     * additional reference as the number of borrowers when the owner
> +     * is allocated, since there is a chance that owner is created
> +     * after borrower.
> +     * So if the borrower is created first, it will cause adding pages
> +     * in the P2M without reference.
> +     */
> +    for ( i = 0; i < nr_pages; i++ )
> +    {
> +        if ( !get_page_nr(page + i, d, nr_borrowers) )
> +        {
> +            printk(XENLOG_ERR
> +                   "Failed to add %lu references to page %"PRI_mfn".\n",
> +                   nr_borrowers, mfn_x(page_to_mfn(page)) + i);
> +            goto fail;
> +        }
> +    }
> +    return 0;
> +
> + fail:
> +    remove_shared_memory_ref(page, i, nr_borrowers);
> +    return -EINVAL;
> +}
> +
> +static int __init acquire_shared_memory(struct domain *d,
> +                                        paddr_t pbase, paddr_t psize,
> +                                        paddr_t gbase)
> +{
> +    mfn_t smfn;
> +    int ret = 0;
> +    unsigned long nr_pages;

When building with EXTRA_CFLAGS_XEN_CORE="-Wunused-but-set-variable -Wno-error=unused-but-set-variable"
arch/arm/domain_build.c: In function ‘acquire_shared_memory’:
arch/arm/domain_build.c:1010:19: warning: variable ‘nr_pages’ set but not used [-Wunused-but-set-variable]
 1010 |     unsigned long nr_pages;
      |                   ^~~~~~~~

> 
>      smfn = acquire_shared_memory_bank(d, pbase, psize);
>      if ( mfn_eq(smfn, INVALID_MFN) )
> @@ -970,6 +1024,44 @@ static int __init assign_shared_memory(struct domain *d,
>          }
>      }
> 
> +    return 0;
> +}
> +
> +static int __init assign_shared_memory(struct domain *d,
> +                                       struct shm_membank *shm_membank,
> +                                       paddr_t gbase)
> +{
> +    int ret = 0;
> +    unsigned long nr_pages, nr_borrowers;
> +    struct page_info *page;
> +    unsigned int i;
> +    struct meminfo *meminfo;
> +
> +    /* Host address is not provided in "xen,shared-mem" */
> +    if ( shm_membank->mem.banks.meminfo )
> +    {
> +        meminfo = shm_membank->mem.banks.meminfo;
> +        for ( i = 0; i < meminfo->nr_banks; i++ )
> +        {
> +            ret = acquire_shared_memory(d,
> +                                        meminfo->bank[i].start,
> +                                        meminfo->bank[i].size,
> +                                        gbase);
> +            if ( ret )
> +                return ret;
> +
> +            gbase += meminfo->bank[i].size;
> +        }
> +    }
> +    else
> +    {
> +        ret = acquire_shared_memory(d,
> +                                    shm_membank->mem.bank->start,
> +                                    shm_membank->mem.bank->size, gbase);
> +        if ( ret )
> +            return ret;
> +    }
> +
>      /*
>       * Get the right amount of references per page, which is the number of
>       * borrower domains.
> @@ -984,23 +1076,37 @@ static int __init assign_shared_memory(struct domain *d,
>       * So if the borrower is created first, it will cause adding pages
>       * in the P2M without reference.
>       */
> -    page = mfn_to_page(smfn);
> -    for ( i = 0; i < nr_pages; i++ )
> +    if ( shm_membank->mem.banks.meminfo )
>      {
> -        if ( !get_page_nr(page + i, d, nr_borrowers) )
> +        meminfo = shm_membank->mem.banks.meminfo;
> +        for ( i = 0; i < meminfo->nr_banks; i++ )
>          {
> -            printk(XENLOG_ERR
> -                   "Failed to add %lu references to page %"PRI_mfn".\n",
> -                   nr_borrowers, mfn_x(smfn) + i);
> -            goto fail;
> +            page = mfn_to_page(maddr_to_mfn(meminfo->bank[i].start));
> +            nr_pages = PFN_DOWN(meminfo->bank[i].size);
> +            ret = add_shared_memory_ref(d, page, nr_pages, nr_borrowers);
> +            if ( ret )
> +                goto fail;
>          }
>      }
> +    else
> +    {
> +        page = mfn_to_page(
> +                maddr_to_mfn(shm_membank->mem.bank->start));
> +        nr_pages = shm_membank->mem.bank->size >> PAGE_SHIFT;
> +        ret = add_shared_memory_ref(d, page, nr_pages, nr_borrowers);
> +        if ( ret )
> +            return ret;
> +    }
> 
>      return 0;
> 
>   fail:
>      while ( --i >= 0 )

I'm aware that this line is unchanged, and I'm not trying to introduce scope creep, but I still wanted to point this out because (1) it is similar in nature to other occurrences introduced in this series and (2) the body of the loop is changed:
arch/arm/domain_build.c: In function ‘assign_shared_memory’:
arch/arm/domain_build.c:1109:17: warning: comparison of unsigned expression in ‘>= 0’ is always true [-Wtype-limits]
 1109 |     while ( --i >= 0 )
      |                 ^~

> -        put_page_nr(page + i, nr_borrowers);
> +    {
> +        page = mfn_to_page(maddr_to_mfn(meminfo->bank[i].start));
> +        nr_pages = PFN_DOWN(meminfo->bank[i].size);
> +        remove_shared_memory_ref(page, nr_pages, nr_borrowers);
> +    }
>      return ret;
>  }
> 
> --
> 2.25.1
> 
> 

