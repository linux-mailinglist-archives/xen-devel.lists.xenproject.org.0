Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6042289B649
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 05:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701704.1096060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtfN2-0001IC-P7; Mon, 08 Apr 2024 03:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701704.1096060; Mon, 08 Apr 2024 03:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtfN2-0001Fg-LN; Mon, 08 Apr 2024 03:08:32 +0000
Received: by outflank-mailman (input) for mailman id 701704;
 Mon, 08 Apr 2024 03:08:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pPud=LN=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rtfN1-0001Eo-4y
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 03:08:31 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 447e69e0-f555-11ee-a1ef-f123f15fe8a2;
 Mon, 08 Apr 2024 05:08:27 +0200 (CEST)
Received: from CH2PR19CA0022.namprd19.prod.outlook.com (2603:10b6:610:4d::32)
 by DS7PR12MB5840.namprd12.prod.outlook.com (2603:10b6:8:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Mon, 8 Apr
 2024 03:08:24 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::b5) by CH2PR19CA0022.outlook.office365.com
 (2603:10b6:610:4d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.35 via Frontend
 Transport; Mon, 8 Apr 2024 03:08:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 8 Apr 2024 03:08:24 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 7 Apr
 2024 22:08:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 7 Apr
 2024 20:08:23 -0700
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 7 Apr 2024 22:08:20 -0500
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
X-Inumbo-ID: 447e69e0-f555-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Of4+zAH+R8TUaWT7OoR35huqCuRWjvJUuHAcdxFfyV10+IGjH6wu7cVEfj7bsWpv8Pb7aKV61hv12dlf2Ii5oQAAx715DTvOYu4Y3auSafYhXYzzP5E8CyVTv/dCI7kw1F2+I9JCwy/0T/bFfKK23oc9w3RtEHxavUpLjj13tcUSG2VLM9W9xZXSXRRAfpXKVeLPElLr8ot4d4hRYRA9cVVg+NQ1T2DQSlKGfo/1IAKeQSh5ckxGHZ5v3el9V34iK+woPBraSxVwBK+sfm8aIMO0tq2EDUvCgzPNmGETgFBgB6wps3+5TmntC4BGC424oT7XMTL/SoxmcVoQJCtpLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvVRMNMOFKaO1BPX62jpqeSqGzWwDmShaFi5mN32T4c=;
 b=aO03SMsgneQ07689/1lppC/euZbSKcc1gS+9zAwozYORkRwnfb3VfNLNbcgIJhQj3ShIhgfLdlHJN43ATJFEC/vuSveNAGUwhUcCszlsGvUX8X+wenxR09NlUMaeKYNJ6C0b6vSId70JcXFsjv8eMDZyyAm4Zrhv39jehsEbebTFXVpvtz+I4nTVHSDGa+lJmhLtoSr6ifHqzBKdCMM2U5me+Hbg4kUXMa6q2AG6irOpDyLDf9wswTPwqhgKh3uHPqqugjeOgTCDKsXlAG1y4hh5nMMoNyxKwLrtLt2Ky6jedFJ8xerhDu+GcVwOQSkPyD9YrY28xzn2D3g5H7KfWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvVRMNMOFKaO1BPX62jpqeSqGzWwDmShaFi5mN32T4c=;
 b=hYF5/5NV/cgP/7flneyo6I8QEjWFPo8axcgtt26Od4LXlKH1sEmjYt1vA3EK63JUDtb2hJPkdPAEwrThhvlZ6z+e5FKj5RP/7JkuYOMCqvuKTlfJudqXh9HmVMqTGENDaiobyHmvNkpCS6DDOy3cKj5NnVH+gTsBrqlqaQ1NOO0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d2685464-65ae-4b88-b458-8873599027ff@amd.com>
Date: Mon, 8 Apr 2024 11:08:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] xen/domctl, tools: Introduce a new domctl to get
 guest memory map
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alec Kwapis <alec.kwapis@medtronic.com>, <xen-devel@lists.xenproject.org>
References: <20240403081626.375313-1-xin.wang2@amd.com>
 <20240403081626.375313-2-xin.wang2@amd.com>
 <3ba13bce-d301-49bb-9028-6d48a05fd077@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <3ba13bce-d301-49bb-9028-6d48a05fd077@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|DS7PR12MB5840:EE_
X-MS-Office365-Filtering-Correlation-Id: 865255d2-3609-452f-3e6d-08dc57792776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5HZ42ZiHQWw1zP3tSFwO3kt0ztSF2nLN9/ByryNsAuERkfouskcSml2kclF4ZH5XpADUa7cQIPRyHF+aZYbLxA9FUrSJT0EMatc8SmhzgqOOfdpt3XWILWVFllKVgPe5O1BDo97FdPvHJ/ORBAysMUTd6vLMuWRUM9ztA3ehA3i9/EIY0YJrFyt69m3/WmslqV6arAfN1Rl9TcrbA7/BWGo3RMeR4G98WM09SNEXpXV2lMdJ65gpy8y/eArlhiB0z8xtYB2Zy1Jgu3obkA6kAv2FvKpes29DzJ5sr/U+7BGH/K3Mwi0kjSBi2SM96AnfnRbshpkk1Cvbf83Gxy3aquxUDd/NjW+cfMt/WqUZ2WKulfbq12alxV0Bd8nsv1AmqtogrXP1OM0IQRdYIPuwNCwnEmFaojdIoC1iVO6TFjLgKSxBzhivaEeEbskb20qe6VTUimVtNYQuG9XfPKP6CuEYxvRL8iW8++Ey0VQJOqrJxcDeeTf/iaB+IFiQZIS4ihzgHsgP+sJ9WHtQZwuhpUlfFNgEcZQouru8y8IdBEMav0KW/fBrYu0rR2Ky5fqrm9L+QTfxx7LqRRSmnTmwpxyBDIO110XCNPh8UmelJFAOwgCtOBncr12trssmra8z81RMJkcStR3WaknfloYYzlGKUH7SvZqGGS8xEcv9GKzrLd7qxPnXLmusYHeYOCFVDS7mEd4KjqlyNKg0aAXnpU9HHTH7xJxV9fqpeWt6AeHOEK6F4zMstUu+SrmSCtVy
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 03:08:24.3550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 865255d2-3609-452f-3e6d-08dc57792776
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5840

Hi Jan,

On 4/4/2024 5:28 PM, Jan Beulich wrote:
> On 03.04.2024 10:16, Henry Wang wrote:
>> --- a/tools/libs/ctrl/xc_domain.c
>> +++ b/tools/libs/ctrl/xc_domain.c
>> @@ -697,6 +697,39 @@ int xc_domain_setmaxmem(xc_interface *xch,
>>       return do_domctl(xch, &domctl);
>>   }
>>   
>> +int xc_get_domain_mem_map(xc_interface *xch, uint32_t domid,
>> +                          struct xen_mem_region mem_regions[],
>> +                          uint32_t *nr_regions)
>> +{
>> +    int rc;
>> +    struct xen_domctl domctl = {
>> +        .cmd         = XEN_DOMCTL_get_mem_map,
>> +        .domain      = domid,
>> +        .u.mem_map = {
>> +            .nr_mem_regions = *nr_regions,
>> +            .pad            = 0,
> This isn't needed: By there being an initializer for the struct, all
> unmentioned fields will be set to 0 anyway.

Ok, I can drop the initialization of the .pad field.

>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -696,6 +696,7 @@ int arch_domain_create(struct domain *d,
>>   {
>>       unsigned int count = 0;
>>       int rc;
>> +    struct mem_map_domain *mem_map = &d->arch.mem_map;
>>   
>>       BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
>>   
>> @@ -785,6 +786,20 @@ int arch_domain_create(struct domain *d,
>>       d->arch.sve_vl = config->arch.sve_vl;
>>   #endif
>>   
>> +    if ( mem_map->nr_mem_regions < XEN_MAX_MEM_REGIONS )
>> +    {
>> +        mem_map->regions[mem_map->nr_mem_regions].start = GUEST_MAGIC_BASE;
>> +        mem_map->regions[mem_map->nr_mem_regions].size = GUEST_MAGIC_SIZE;
>> +        mem_map->regions[mem_map->nr_mem_regions].type = GUEST_MEM_REGION_MAGIC;
>> +        mem_map->nr_mem_regions++;
>> +    }
>> +    else
>> +    {
>> +        printk("Exceed max number of supported memory map regions\n");
> Debugging leftover?

Well, not really, I did this on purpose to print some info before exit. 
But now I realize other error paths in arch_domain_create() do not do 
that. I will drop this printk in v4.

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
> Why? Instead you want ...

Because there are no empty line between the other sub-ops in the arm 
version of arch_do_domctl(). Since there is no explicit guideline in 
CODING_STYLE, I was trying to take the opportunity to keep the coding 
style consistent within the file. However since you are asking, I 
realized that the x86 arch_do_domctl() is using the other way, i.e 
adding an empty line between the sub-ops, so...

>> @@ -176,6 +175,37 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>   
>>           return rc;
>>       }
>> +    case XEN_DOMCTL_get_mem_map:
> ... separating blank line above this line and ...
>
>> +    {
>> +        int rc = 0;
>> +        uint32_t nr_regions, i;
>> +
>> +        if ( domctl->u.mem_map.pad )
>> +            return -EINVAL;
>> +
>> +        /*
>> +         * Cap the number of regions to the minimum value between toolstack and
>> +         * hypervisor to avoid overflowing the buffer.
>> +         */
>> +        nr_regions = min(d->arch.mem_map.nr_mem_regions,
>> +                         domctl->u.mem_map.nr_mem_regions);
>> +
>> +        domctl->u.mem_map.nr_mem_regions = nr_regions;
>> +
>> +        for ( i = 0; i < nr_regions; i++ )
>> +        {
>> +            if ( d->arch.mem_map.regions[i].pad )
>> +                return -EINVAL;
>> +        }
>> +
>> +        if ( copy_to_guest(domctl->u.mem_map.buffer,
>> +                           d->arch.mem_map.regions,
>> +                           nr_regions) ||
>> +             __copy_to_guest(u_domctl, domctl, 1) )
>> +            rc = -EFAULT;
>> +
>> +        return rc;
>> +    }
>>       default:
> ... this one.

...personally I don't have strong opinions on the style as long as we 
keep consistent. I can switch the Arm one following the x86 style or 
just leave it as is.

> Further with the way you use min() above, how is the caller going to know
> whether it simply specified too small an array?

I am a bit unsure if we need to forbid caller to specify a smaller value 
than the max number of regions supported by the hypervisor, technically 
it is legal, although I agree it will lead to some issues in the 
toolstack side. It looks like the similar hypercall of e820 also does 
not forbid this (see get_mem_mapping_layout() and related 
XENMEM_memory_map). Do you have any suggestions?

> And then you check d->arch.mem_map.regions[i].pad. Why's that? And even
> if needed here for some reason, that's surely not EINVAL, but an internal
> error in Xen.

I did that under the impression that we need to check the value of 
padding field being 0. Also you mentioned in one of the comments below 
that Xen should guarantee that the padding field should be 0 before 
return. Apologize if I misunderstand your comment. The -EINVAL is taken 
from the same way of checking the padding field in XEN_DOMCTL_vuart_op 
above. Personally I would keep some consistency, but I am open to 
suggestions to make it better.

> Finally instead of __copy_to_guest() can't you use __copy_field_to_guest(),
> for just nr_regions?

You mean replacing __copy_to_guest(u_domctl, domctl, 1) with only the 
__copy_field_to_guest(u_domctl, domctl, u.mem_map.nr_mem_regions)? Ok I 
can do that in v4.

>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -946,6 +946,31 @@ struct xen_domctl_paging_mempool {
>>       uint64_aligned_t size; /* Size in bytes. */
>>   };
>>   
>> +#ifndef XEN_MAX_MEM_REGIONS
>> +#define XEN_MAX_MEM_REGIONS 1
>> +#endif
>> +
>> +struct xen_mem_region {
>> +    uint64_aligned_t start;
>> +    uint64_aligned_t size;
>> +    uint32_t         type;
> What is this field set to? I see no #define(s) in this header. If it's
> the GUEST_MEM_REGION_* in the Arm header, a connection needs to be made.
> Also note that GUEST_MEM_REGION_* violate name space requirements: New
> additions should have XEN_ / xen_ prefixes on their names.

Yeah it is the GUEST_MEM_REGION_* in the Arm header. The default value 
will be set to 0 when struct domain is created. I will switch to the 
XEN_* prefix in v4.

>> +    /* Must be zero */
>> +    uint32_t         pad;
> This, being OUT only, should not be required to be set by the caller. As
> long as no use appears, Xen merely ought to guarantee that it'll be 0 upon
> return.

See above.

Kind regards,
Henry

> Jan


