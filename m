Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C36668E257
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 21:57:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491430.760514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPV1L-0001IC-Co; Tue, 07 Feb 2023 20:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491430.760514; Tue, 07 Feb 2023 20:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPV1L-0001FB-8L; Tue, 07 Feb 2023 20:56:55 +0000
Received: by outflank-mailman (input) for mailman id 491430;
 Tue, 07 Feb 2023 20:56:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Z3Z=6D=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pPV1J-0001F5-Kd
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 20:56:53 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f14421e1-a729-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 21:56:51 +0100 (CET)
Received: from MW2PR2101CA0026.namprd21.prod.outlook.com (2603:10b6:302:1::39)
 by SA1PR12MB5638.namprd12.prod.outlook.com (2603:10b6:806:229::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Tue, 7 Feb
 2023 20:56:48 +0000
Received: from CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::c2) by MW2PR2101CA0026.outlook.office365.com
 (2603:10b6:302:1::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.4 via Frontend
 Transport; Tue, 7 Feb 2023 20:56:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT079.mail.protection.outlook.com (10.13.175.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.32 via Frontend Transport; Tue, 7 Feb 2023 20:56:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Feb
 2023 14:56:46 -0600
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Feb 2023 14:56:44 -0600
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
X-Inumbo-ID: f14421e1-a729-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzQv5BvbKcz7n7sSt7PoA7TY0ntC2eRXDhKRaiB2ZgH0pCENeTtDZiDZDR5zTY6EhCrSFGyPKT3OL96tGPZ7cTsnOmROo2YdaEVE/6iypLyPD6ZSQ7RFH+6n+MyN/1QgkUbfzExLmMKjq+R9pwVk5K3k/CG5htwp5ZwVskDXwPX4p8/Iq2pXOlyzPquywgyL2sNpEkwG8PvjCn6t6iSPzEzJx9Ljhw3vtxZGBvDbS7K3zNvg4sXMd9yn+NY2z5qPbqHxWEfoNAXHOYXULFtWq3ogHLWd3hIrg4iBY809zfGEEc8zoaB+BF9h8/rAxBjpHnM5AXMN5Px14pgJHZVveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqGXqn6aTEqAgnWHoNZpiEyEkTFc3xIH9PWXXXBy0qE=;
 b=QlK38YSQAf0pivr9oExILxzyUUa6UiW0IKgyxmvlj6VFNsxp7yBnS30WxGrTFI9EP7EGa/tHcBPe3koJt0K5L8pZLMRmjIXWPMbTBcQAppx7w1WsvWICueVkO0ZYI08iN1KdFMPFIXS2+6YidqaYK+C4bAitb31VNiiPX0t44pgfXEaSREMlQm9sc/yc5pgZfF+1iJG3TStC1o+vKXnqEIKZI0Kv2q7/fS9L+T1rJOhRoAZGA+ZwoXjC7oeNMxmofdhWd6T0/y3Wzn1zKWfoFbI+tjxkSiclnUbimdNtlqLh2gODRZ9djihfVCJzbFs2Lr3TSFiyb9oFpX9/5HawKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqGXqn6aTEqAgnWHoNZpiEyEkTFc3xIH9PWXXXBy0qE=;
 b=WFve+6sTEo3UIOiJ1xzsojSye+lneCe6ojHVsteJ7y/ZrMQxUJGeDehBEaqnB7poonAMZUkiRTsOxMQrI8jLngOyf3BT95A6QfwgQ0ZeBmUc55x2aMErNvVx6FcY9Xiqfs+QAAW+CiIlnnyQmjoE75W2+k9WB9Y0wy69t9rNPJ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <522e5499-76eb-6aed-cce4-7c70c1bf0d1f@amd.com>
Date: Tue, 7 Feb 2023 15:56:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 03/13] xen/arm: introduce allocate_domheap_memory and
 guest_physmap_memory
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-4-Penny.Zheng@arm.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20221115025235.1378931-4-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT079:EE_|SA1PR12MB5638:EE_
X-MS-Office365-Filtering-Correlation-Id: 9983e3cf-d6ea-46de-16e7-08db094dd3d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hUeCdG90KIl6bVrrG+xDoSrme1q9Fvf3Ybv2KfV5e6kDWTHDUXossk0yNc29Rh5Uv2DH2id+XR4dmXd11qn2ixEhA05VKVuW7GxVXL5VnsNAN3QiH4R+O60iuNZu7GuS4APY61ClwYwMogPttNfy1PmlcW8NwI5lDrw0jv5IWO3KPMagIjDbECvL7O6jlu7Bu+PcLxQsbkkut+9BSaeeWFkLjr6E4ZO+ka83Tcaz7HtZFBQulVqd3YevfoxtMZ51OaaJ41gIgSjLzOlEoOHJHVRFeRd20JkAG/K6/j2ZQ5u08OYXbZjvl+GnYx3usrZiumXpldNbePMHBT6YGQhuZXdA1FoXk5wLLLQTrSDpaFCTdWUujfj52rRIBdlWmnLsjHax2H7OW1RXHYCzUudiANQ0R34QRM8DTC6PCEMBFt52Rnr5v3WXpcdFaD1omazRdmAV0TaDkKuDKexHLyJC5HapIRTQS5QeCh3rRGTiTCPuHQjMUm9Q0wZ426/94/b562ul+dyKsfiJfEh/UmQq9HdHPH0n6QuYBpT7vy9n57HuAGMWL0M2Bu0gRTohyCnXO22fwPtw56ltJauLxnKBAkK642E4FxFWS3vjaO2xUjCCwdQ3Oce81uPsCnkF0vsBvB2yJUlhE9qZi3/wLpz4N4EMcKGSKOF4I/cFzSDx8na5TOb6kH955NVoEBfywIN/VcAR4RqZ2FnfP9tYD4w4FCF0JlXjvZGUjt36Is2u85a3w4qPuZHCA0eRnMP+RK+xdItiKt/aR7YTYG8dTbAbAQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199018)(36840700001)(46966006)(40470700004)(36860700001)(82740400003)(31686004)(336012)(40480700001)(83380400001)(26005)(86362001)(2616005)(31696002)(81166007)(186003)(47076005)(36756003)(356005)(426003)(70586007)(40460700003)(70206006)(53546011)(316002)(110136005)(44832011)(41300700001)(2906002)(16576012)(478600001)(54906003)(4326008)(5660300002)(8676002)(8936002)(82310400005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 20:56:47.2846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9983e3cf-d6ea-46de-16e7-08db094dd3d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5638

Hi Penny,

On 11/14/22 21:52, Penny Zheng wrote:
> We split the codes of allocate_bank_memory into two parts,
> allocate_domheap_memory and guest_physmap_memory.
> 
> One is about allocating guest RAM from heap, which could be re-used later for
> allocating static shared memory from heap when host address is not provided.
> 
> The other is building up guest P2M mapping.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>  xen/arch/arm/domain_build.c | 93 +++++++++++++++++++++++++++----------
>  1 file changed, 68 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d2b9e60b5c..92763e96fc 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -390,34 +390,18 @@ static void __init allocate_memory_11(struct domain *d,
>      }
>  }
> 
> -static bool __init allocate_bank_memory(struct domain *d,
> -                                        struct kernel_info *kinfo,
> -                                        gfn_t sgfn,
> -                                        paddr_t tot_size)
> +static bool __init allocate_domheap_memory(struct domain *d,
> +                                           paddr_t tot_size,
> +                                           struct meminfo *mem)
>  {
> -    int res;
>      struct page_info *pg;
> -    struct membank *bank;
>      unsigned int max_order = ~0;
> 
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
> -
>      while ( tot_size > 0 )
>      {
>          unsigned int order = get_allocation_size(tot_size);
> 
>          order = min(max_order, order);
> -
>          pg = alloc_domheap_pages(d, order, 0);
>          if ( !pg )
>          {
> @@ -437,15 +421,74 @@ static bool __init allocate_bank_memory(struct domain *d,
>              continue;
>          }
> 
> -        res = guest_physmap_add_page(d, sgfn, page_to_mfn(pg), order);
> -        if ( res )
> -        {
> -            dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
> +        if ( mem->nr_banks == NR_MEM_BANKS )
>              return false;
> -        }
> +
> +        mem->bank[mem->nr_banks].start = mfn_to_maddr(page_to_mfn(pg));
> +        mem->bank[mem->nr_banks].size = 1UL << (PAGE_SHIFT + order);
> +        mem->nr_banks++;
> +        tot_size -= (1UL << (PAGE_SHIFT + order));

Why the change from 1ULL to 1UL?

> +    }
> +
> +    return true;
> +}
> +
> +static int __init guest_physmap_memory(struct domain *d,
> +                                       const struct meminfo *mem, gfn_t sgfn)
> +{
> +    unsigned int i;
> +    int res;
> +
> +    for ( i = 0; i < mem->nr_banks; i++ )
> +    {
> +        paddr_t size = mem->bank[i].size;
> +        unsigned int order = get_order_from_bytes(size);
> +
> +        /* Size must be power of two */
> +        BUG_ON(!size || (size & (size - 1)));
> +        res = guest_physmap_add_page(d, sgfn, maddr_to_mfn(mem->bank[i].start),
> +                                     order);
> +        if ( res )
> +            return res;
> 
>          sgfn = gfn_add(sgfn, 1UL << order);
> -        tot_size -= (1ULL << (PAGE_SHIFT + order));
> +    }
> +
> +    return 0;
> +}
> +
> +static bool __init allocate_bank_memory(struct domain *d,
> +                                        struct kernel_info *kinfo,
> +                                        gfn_t sgfn,
> +                                        paddr_t total_size)
> +{
> +    struct membank *bank;
> +    struct meminfo host = {0};

This function uses 6k of stack, largely due to the sizeof struct meminfo.

arch/arm/domain_build.c: In function ‘allocate_bank_memory’:
arch/arm/domain_build.c:461:20: warning: stack usage is 6224 bytes [-Wstack-usage=]
  461 | static bool __init allocate_bank_memory(struct domain *d,
      |                    ^~~~~~~~~~~~~~~~~~~~

It may be fine for now, but I wanted to at least check if anyone else had an opinion on allocating "struct meminfo host" by some other means, such as xzalloc/free or by making it static:

static struct meminfo __initdata host;
memset(&host, 0, sizeof(struct meminfo));

Particularly if we ever plan on increasing NR_MEM_BANKS again in the future.

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
> +    if ( !allocate_domheap_memory(d, total_size, &host) )
> +    {
> +        printk(XENLOG_ERR "Failed to allocate (%"PRIpaddr"MB) pages to %pd\n",
> +               total_size >> 20, d);
> +        return false;
> +    }
> +
> +    if ( guest_physmap_memory(d, &host, sgfn) )
> +    {
> +        printk(XENLOG_ERR "Failed to map (%"PRIpaddr"MB) pages to %pd\n",
> +               total_size >> 20, d);
> +        return false;
>      }
> 
>      kinfo->mem.nr_banks++;
> --
> 2.25.1
> 
> 

