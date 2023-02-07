Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB04668E25F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 21:57:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491439.760525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPV26-0001t5-TS; Tue, 07 Feb 2023 20:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491439.760525; Tue, 07 Feb 2023 20:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPV26-0001q0-Pm; Tue, 07 Feb 2023 20:57:42 +0000
Received: by outflank-mailman (input) for mailman id 491439;
 Tue, 07 Feb 2023 20:57:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Z3Z=6D=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pPV24-0001F5-Oe
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 20:57:40 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d5cbae3-a72a-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 21:57:38 +0100 (CET)
Received: from MW4PR04CA0336.namprd04.prod.outlook.com (2603:10b6:303:8a::11)
 by PH7PR12MB6881.namprd12.prod.outlook.com (2603:10b6:510:1b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 20:57:34 +0000
Received: from CO1NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::9b) by MW4PR04CA0336.outlook.office365.com
 (2603:10b6:303:8a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36 via Frontend
 Transport; Tue, 7 Feb 2023 20:57:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT070.mail.protection.outlook.com (10.13.175.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.16 via Frontend Transport; Tue, 7 Feb 2023 20:57:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Feb
 2023 14:57:33 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Feb
 2023 14:57:33 -0600
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Feb 2023 14:57:31 -0600
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
X-Inumbo-ID: 0d5cbae3-a72a-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFi2acilOQyyZ5F0R+S4QIOISzOghcyURqkW2K/UqqaLVLeaKxkMog3GRE1jj3eZyrxJlGi9kGVvUPVEG3wblpCUU8HwewDA0zhbUNioqsducnFGqg1nLN360SG4yKi6nU1O2fFo5YOz0yKZLTHv7XarXysOuCxhOhFb9pS1Q1Bn4wL+QGrJavT+R4PiRQ4fF98KZpQWaeZrXaNAoNndXhZDCKN+oLLoJsC43FtD0jDe2C1lxgMpnWP1HBga9BoR9kh4g6Nd+2lDG7IEdEPwAeg83yNjv1RsRoBu4DW2vas6DCUyiVuMpPhYvrLaELdYa/fu2fs6uPVo2laqGO/fRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jYxCp6nCsjb+AHMJH4nWQu9hbmn/AD2c7tuvYBI2Fo=;
 b=k5OXh7WVluVUNLjwIzYiHbCnK8boIQIQnZf7xjmZDNWXXzEDCKeM/SCoZLFu6dkIlL4p0CiHJdITqjhZJv7l0Awx9Er4b8OC2xnOYbNB2h+p5fYNoxddHFOgOUutxNlhXd1wILiOQTJCjOX3Wgd+rYHd8mzwb02tqpLn6BW73HbAD8U8yDEY8FKFAtG5dqnkrRtl4ROscYM71VdHU8sQ0kmRE6DBJfIseljm311WYM3s2FAzmWZhYSvf6mAcVfYJnrt8Y2iAX4cFSrQMDAqo1wEfX6cAW/1vcnfjx0dhCVctVp7UShqys3SSe6cXsIgr7szX/rPvjN87k9PjsXhtfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jYxCp6nCsjb+AHMJH4nWQu9hbmn/AD2c7tuvYBI2Fo=;
 b=o2p5MiDYTJfX5FyrWeXbl2bM11uKcS+7tQdSO3ed+ZtD4eGudhkq5uwAwFhZHSM001mlHapq/mVhnWc8XYvKJklF1qRlN4JTBXBEFiCYCLaxUMqB6tTIOySdSKaRVeTGzqlmoHGNh9jHR+Q2cVRX7YuH+Wb95J0iUBjSvhL05Sg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <093e99aa-608e-728c-6710-9fd100c16027@amd.com>
Date: Tue, 7 Feb 2023 15:57:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v1 05/13] xen/arm: allocate shared memory from heap when
 host address not provided
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-6-Penny.Zheng@arm.com>
Content-Language: en-US
In-Reply-To: <20221115025235.1378931-6-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT070:EE_|PH7PR12MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 866c5ee9-2a7c-436c-b7a6-08db094defdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RoulFy/4zKzeBgdgte/pCfjToMXi8aPplvls4mUn9uAzHzAvC2mRYr0dP4AhMLKc6+S6rIoyEPPhke2NCvMtnOYHm2zdjkZ9QJ2937s4ethkNqOiYWcFVp+V0ZkM5ZusLLpMXyhdEBHfX+6g+CqrylyxsjPIQixRUD05AKd58VkJRpYaYAXxOEMGQuKrEVAf+BtMWOjfdqlvEsrsDnlGAKk/uN5xV/MYu5ni3G7mxQLcwNVbkSMQy7l8U6rWyzGF6wDcr5SOhz0Yv5464K0e0kKE73/uR0mvtVxa2OKvffowPYN2eu0XjqEcGM9yfg2rSe3r65sYGRwEL3qj2UHwKFhLQ8dHVReQc9F/gLYoLVL78+Y7tk7h8wAKLDm81pYP64bGrtUV6fNXSmiCElMZusLOgQZxUquV1NXg61Vq4XUG3mejU4zRw2lWRkmMpKgYe+W1yj0/F0YT78Rvbrg40DVLeudoFMoHjJrBapOa5iOskcBNzg64phojAzNrinXXzy0IcLXi70gIGpYHyPeND43L3ngDsQbUSMjhKzRTuCvf8BLidhjOB6jBytO8PC9IrV3QrUe0Ux5kQBkH84OHy0/uZZyYt3hyFDXLt2VEGAsDKby9FZFbbNEY6l02tkJMABGVu9NcWQEVkrzVM46BCrNR9V5AyVncOBrSUKzjFrgcQ/kLeVQyEc1WD3ONksLoFwkSq+HRSWsQnFxzM1I44VnasBxoPDX8du3peVhnNJ9Nsr3smdJz742TEBRrQ2iLJMVac1gDhU9xh3uadKAzRg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199018)(46966006)(40470700004)(36840700001)(8936002)(86362001)(44832011)(41300700001)(5660300002)(4326008)(70586007)(8676002)(316002)(16576012)(110136005)(54906003)(82310400005)(40480700001)(36756003)(70206006)(2906002)(40460700003)(31696002)(47076005)(2616005)(426003)(83380400001)(26005)(53546011)(186003)(336012)(6666004)(31686004)(82740400003)(356005)(81166007)(36860700001)(478600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 20:57:34.2886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 866c5ee9-2a7c-436c-b7a6-08db094defdf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6881

On 11/14/22 21:52, Penny Zheng wrote:
> when host address is not provided in "xen,shared-mem", we let Xen
> allocate requested shared memory from heap, and once the shared memory is
> allocated, it will be marked as static(PGC_static), which means that it will be
> reserved as static memory, and will not go back to heap even on freeing.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>  xen/arch/arm/domain_build.c | 83 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 82 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index fbb196d8a4..3de96882a5 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -835,6 +835,72 @@ static bool __init is_shm_allocated_to_domio(struct shm_membank *shm_membank)
>      return true;
>  }
> 
> +static int __init mark_shared_memory_static(struct shm_membank *shm_membank)
> +{
> +    unsigned int bank;
> +    unsigned long i, nr_mfns;
> +    struct page_info *pg;
> +    struct meminfo *meminfo;
> +
> +    BUG_ON(!shm_membank->mem.banks.meminfo);
> +    meminfo = shm_membank->mem.banks.meminfo;
> +    for ( bank = 0; bank < meminfo->nr_banks; bank++ )
> +    {
> +        pg = mfn_to_page(maddr_to_mfn(meminfo->bank[bank].start));
> +        nr_mfns = PFN_DOWN(meminfo->bank[bank].size);
> +
> +        for ( i = 0; i < nr_mfns; i++ )
> +        {
> +            /* The page should be already allocated from heap. */
> +            if ( !pg[i].count_info & PGC_state_inuse )
> +            {
> +                printk(XENLOG_ERR
> +                       "pg[%lu] MFN %"PRI_mfn" c=%#lx\n",
> +                       i, mfn_x(page_to_mfn(pg)) + i, pg[i].count_info);
> +                goto fail;
> +            }
> +
> +           pg[i].count_info |= PGC_static;
> +        }
> +    }
> +
> +    return 0;
> +
> + fail:
> +    while ( bank >= 0 )

When building with EXTRA_CFLAGS_XEN_CORE="-Wtype-limits -Wno-error=type-limits", we get the following warning:
arch/arm/domain_build.c: In function ‘mark_shared_memory_static’:
arch/arm/domain_build.c:879:18: warning: comparison of unsigned expression in ‘>= 0’ is always true [-Wtype-limits]
  879 |     while ( bank >= 0 )
      |                  ^~

> +    {
> +        while ( --i >= 0 )

Similarly here:
arch/arm/domain_build.c:881:21: warning: comparison of unsigned expression in ‘>= 0’ is always true [-Wtype-limits]
  881 |         while ( --i >= 0 )
      |                     ^~

> +            pg[i].count_info &= ~PGC_static;
> +        i = PFN_DOWN(meminfo->bank[--bank].size);
> +    }
> +
> +    return -EINVAL;
> +}
> +
> +static int __init allocate_shared_memory(struct shm_membank *shm_membank,
> +                                         paddr_t psize)
> +{
> +    struct meminfo *banks;
> +    int ret;
> +
> +    BUG_ON(shm_membank->mem.banks.meminfo != NULL);
> +
> +    banks = xmalloc_bytes(sizeof(struct meminfo));
> +    if ( banks == NULL )
> +        return -ENOMEM;
> +    shm_membank->mem.banks.meminfo = banks;
> +    memset(shm_membank->mem.banks.meminfo, 0, sizeof(struct meminfo));
> +
> +    if ( !allocate_domheap_memory(NULL, psize, shm_membank->mem.banks.meminfo) )
> +        return -EINVAL;
> +
> +    ret = mark_shared_memory_static(shm_membank);
> +    if ( ret )
> +        return ret;
> +
> +    return 0;
> +}
> +
>  static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>                                                 paddr_t pbase, paddr_t psize)
>  {
> @@ -975,7 +1041,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>          unsigned int i;
>          const char *role_str;
>          const char *shm_id;
> -        bool owner_dom_io = true;
> +        bool owner_dom_io = true, paddr_assigned = true;
>          struct shm_membank *shm_membank;
> 
>          if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
> @@ -1035,6 +1101,21 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>              return -ENOENT;
>          }
> 
> +        /*
> +         * When host address is not provided in "xen,shared-mem",
> +         * we let Xen allocate requested memory from heap at first domain.
> +         */
> +        if ( !paddr_assigned && !shm_membank->mem.banks.meminfo )
> +        {
> +            ret = allocate_shared_memory(shm_membank, psize);
> +            if ( ret )
> +            {
> +                printk("%pd: failed to allocate shared memory bank(%"PRIpaddr"MB) from heap: %d\n",
> +                       d, psize >> 20, ret);
> +                return ret;
> +            }
> +        }
> +
>          /*
>           * DOMID_IO is a fake domain and is not described in the Device-Tree.
>           * Therefore when the owner of the shared region is DOMID_IO, we will
> --
> 2.25.1
> 
> 

