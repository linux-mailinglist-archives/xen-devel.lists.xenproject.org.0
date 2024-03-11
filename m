Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6DC877D2F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:46:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691340.1077226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjcEX-0005bq-FQ; Mon, 11 Mar 2024 09:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691340.1077226; Mon, 11 Mar 2024 09:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjcEX-0005Ye-Bf; Mon, 11 Mar 2024 09:46:13 +0000
Received: by outflank-mailman (input) for mailman id 691340;
 Mon, 11 Mar 2024 09:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XtLZ=KR=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rjcEV-0005YW-P9
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:46:11 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f3f6f4d-df8c-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 10:46:08 +0100 (CET)
Received: from DS7PR05CA0036.namprd05.prod.outlook.com (2603:10b6:8:2f::25) by
 MW4PR12MB7120.namprd12.prod.outlook.com (2603:10b6:303:222::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 09:46:05 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:8:2f:cafe::73) by DS7PR05CA0036.outlook.office365.com
 (2603:10b6:8:2f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17 via Frontend
 Transport; Mon, 11 Mar 2024 09:46:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Mon, 11 Mar 2024 09:46:04 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Mar
 2024 04:46:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Mar
 2024 02:46:04 -0700
Received: from [10.65.148.173] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 11 Mar 2024 04:46:01 -0500
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
X-Inumbo-ID: 2f3f6f4d-df8c-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFnQI3yypiCq/eX47VxOoJ/pDaSQ0bn5Pqs8Oqs7cyiL/iVHUhIf7P3t6ppY54pjuAvt25uYj00utgCT27dg13PdrFtDvBIeE/dSSrEen7O/TUnBkjU0weTV5zK26lM7W2t/AODX/XKXQPNNLePxpaZ7WklmK6n1Rw61/Xtr2SYA/UkHBKuFWm7VDlSbd3qUjHvNVJxgOrma4M42fYFslo6K3m5msnk8XxOeNFUrnEvmikDv+motTJX/4/dzAXutx+oc3e1+wIz8UXSWi2p5MjOFsWuImcelmHkkZLvYemGUxtJ3J7sT11hnDfquHEJhKc0psyFOiA/ajyLa9ejskg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dimKD9WEZ+AXOmV4JiStlxQSYUnWW7h85oCYHLBQvBQ=;
 b=P4D9eynklWJXXDsyPWYg6qHSt38dP1RCayInkE7zuWrBCC42oQsf6tHixa6sQEMAiPnVn6phJWzI7Z96p0FgatoxUsSPenL142B5CJeNZ6aPcoss6pZXu6zq+4W+U38M8xDy4WeDMFzeLoGv6KZxfAp0N2jsXLZJPMwqh5mHnaNlScrCVAhSOQ2czOyDNETQ2Lk2S29fg4ohSYqkYsk1gnZr3yn1Qn5a1WCs32pSRnorhpLYovJU1S3UpP6chfg79FneOUWX/vt4WVJq5QOWizZbQSJ4uJZHFsJFr79MZPDACLuUo+3hX1pVqsodADe5+obr5N5ZOumVRJ/cjyDfOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dimKD9WEZ+AXOmV4JiStlxQSYUnWW7h85oCYHLBQvBQ=;
 b=v33Fm26CVc62xddAIwQwtn6su5/L2y8KHPlm/yjYhdwDHVAF9xH9905YRRUSt8il88bua4kmYn3DXj/WFTXYSltAIw0iSTGyJh0J0sNnbFMlkPAoTMu5mEc82GYcKEBheweENx5TeZFhQ/TX1bCQPkx2msC6+DMRtydKn58A42s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6c53d4fc-638e-4f88-b25f-8d71065c8984@amd.com>
Date: Mon, 11 Mar 2024 17:46:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] xen/domctl, tools: Introduce a new domctl to get
 guest memory map
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alec Kwapis <alec.kwapis@medtronic.com>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-4-xin.wang2@amd.com>
 <f084464d-fb6d-45c3-a747-4a69804f7d26@amd.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <f084464d-fb6d-45c3-a747-4a69804f7d26@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|MW4PR12MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 63121bf9-77bf-44ca-7169-08dc41b011ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k9zxBKPH44fZ4jnEv4TB+jEI+TKw0bxyJAnHnNkq0zYMwxrnev1tr8Q2va/V4AneXCvYBa5byf8te09JMf6A3aWXlyjgKwRQPiVzxrjSH2dzpBgw6A5vDub5xtzRUyVVVQiaqcH036wXDEbnQXhBDkDnGFiEBMozdMk9Vdt+DYBtv8VbA1A07qWwJJZVc2rMEDRaB62YMKrQDGf28wA2LUxmXVR4NI+ZH2LI2//hfCPQAZq1npv9jdXCX5yuMp9ep1BZiOw7tFlWi7zovafR+nzBJTELiXrXC/ZNE17kvGL9EW3c2ZQH1XKxHeXgXHET/ZKCLVtqc7lHgQqohW7T5aj72BnUQBOZPEnzjcuU44rZMqiYEEwZY8B1oaWhG7oBQbUoOddfCpTtvbcldA4hSB4WYllUhC6AjI4T7zcu0AFgAEzvm3qoGEXTI/bpZ/6Upp6HVcsBG68mrfFz7ejAo10XuN5OMPyxZVt0fWLRqB/zbFC92Nm378a6aVhfD3vdz4eG5g5uydT7vL4IA1zR20yUaUR2wzKLS3vADOmQ7IAdr2t9HZw+u0zfNr9SBmuRB0jp7ySnJmfgxROhHOr/18yJ8hOTvZk3EE2L8C1pwutJLCxZq85ms5a5oW36swH08feI5oJ7bJLtSQ9fTWqMAgMMkTASriEcsz66kduAGlL3TC1LRtje0W1aHotILThzgKvxNI1zXwuyP5O9hngzqeLKaTs1ubTCcOa7mcNe3aQXLinWOkKgr2ifvEeezCVy
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(7416005)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 09:46:04.9456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63121bf9-77bf-44ca-7169-08dc41b011ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7120

Hi Michal,

On 3/11/2024 5:10 PM, Michal Orzel wrote:
> Hi Henry,
>
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 5e7a7f3e7e..54f3601ab0 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -696,6 +696,7 @@ int arch_domain_create(struct domain *d,
>   {
>       unsigned int count = 0;
>       int rc;
> +    struct mem_map_domain *mem_map = &d->arch.mem_map;
>   
>       BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
>   
> @@ -785,6 +786,11 @@ int arch_domain_create(struct domain *d,
>       d->arch.sve_vl = config->arch.sve_vl;
>   #endif
>   
> +    mem_map->regions[mem_map->nr_mem_regions].start = GUEST_MAGIC_BASE;
> You don't check for exceeding max number of regions. Is the expectation that nr_mem_regions
> is 0 at this stage? Maybe add an ASSERT here.

Sure, I will add the checking.

>> +    mem_map->regions[mem_map->nr_mem_regions].size = GUEST_MAGIC_SIZE;
>> +    mem_map->regions[mem_map->nr_mem_regions].type = GUEST_MEM_REGION_MAGIC;
>> +    mem_map->nr_mem_regions++;
>> +
>>       return 0;
>>   
>>   fail:
>> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
>> index ad56efb0f5..92024bcaa0 100644
>> --- a/xen/arch/arm/domctl.c
>> +++ b/xen/arch/arm/domctl.c
>> @@ -148,7 +148,6 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>   
>>           return 0;
>>       }
>> -
>>       case XEN_DOMCTL_vuart_op:
>>       {
>>           int rc;
>> @@ -176,6 +175,24 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>   
>>           return rc;
>>       }
>> +    case XEN_DOMCTL_get_mem_map:
>> +    {
>> +        int rc;
> Without initialization, what will be the rc value on success?

Thanks for catching this (and the copy back issue below). I made a silly 
mistake here and didn't catch it as I also missed checking the rc in the 
toolstack side...I will fix both side.

>> +        /*
>> +         * Cap the number of regions to the minimum value between toolstack and
>> +         * hypervisor to avoid overflowing the buffer.
>> +         */
>> +        uint32_t nr_regions = min(d->arch.mem_map.nr_mem_regions,
>> +                                  domctl->u.mem_map.nr_mem_regions);
>> +
>> +        if ( copy_to_guest(domctl->u.mem_map.buffer,
>> +                           d->arch.mem_map.regions,
>> +                           nr_regions) ||
>> +             __copy_to_guest(u_domctl, domctl, 1) )
> In domctl.h, you wrote that nr_regions is IN/OUT but you don't seem to write back the actual number
> of regions.

Thanks. Added "domctl->u.mem_map.nr_mem_regions = nr_regions;" locally.

>> +/* Guest memory region types */
>> +#define GUEST_MEM_REGION_DEFAULT    0
> What's the purpose of this default type? It seems unusued.

I added it because struct arch_domain (or we should say struct domain) 
is zalloc-ed. So the default type field in struct xen_mem_region is 0. 
Otherwise we may (mistakenly) define a region type as 0 and lead to 
mistakes.
>> +#define GUEST_MEM_REGION_MAGIC      1
>> +
>>   /* Physical Address Space */
>>   
>>   /* Virtio MMIO mappings */
>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>> index a33f9ec32b..77bf999651 100644
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -946,6 +946,25 @@ struct xen_domctl_paging_mempool {
>>       uint64_aligned_t size; /* Size in bytes. */
>>   };
>>   
>> +#define XEN_MAX_MEM_REGIONS 1
> The max number of regions can differ between arches. How are you going to handle it?

I think we can add
```
#ifndef XEN_MAX_MEM_REGIONS

#define XEN_MAX_MEM_REGIONS 1

#endif
```
here and define the arch specific XEN_MAX_MEM_REGIONS in 
public/arch-*.h. I will fix this in v3.

Kind regards,
Henry

> ~Michal


