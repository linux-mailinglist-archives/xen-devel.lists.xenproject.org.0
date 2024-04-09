Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBFC89CFDB
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 03:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702107.1096913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru0LF-0003xL-22; Tue, 09 Apr 2024 01:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702107.1096913; Tue, 09 Apr 2024 01:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru0LE-0003vn-Ur; Tue, 09 Apr 2024 01:32:04 +0000
Received: by outflank-mailman (input) for mailman id 702107;
 Tue, 09 Apr 2024 01:32:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5At3=LO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1ru0LC-0003vh-LJ
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 01:32:02 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3c067bf-f610-11ee-843a-3f19d20e7db6;
 Tue, 09 Apr 2024 03:31:58 +0200 (CEST)
Received: from SN7PR04CA0044.namprd04.prod.outlook.com (2603:10b6:806:120::19)
 by DM4PR12MB9070.namprd12.prod.outlook.com (2603:10b6:8:bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Tue, 9 Apr
 2024 01:31:54 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:806:120:cafe::44) by SN7PR04CA0044.outlook.office365.com
 (2603:10b6:806:120::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.36 via Frontend
 Transport; Tue, 9 Apr 2024 01:31:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 9 Apr 2024 01:31:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 20:31:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 20:31:53 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 8 Apr 2024 20:31:50 -0500
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
X-Inumbo-ID: f3c067bf-f610-11ee-843a-3f19d20e7db6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRfxPA7in46LYtM3pM8a2Z/ONeSQYs0c7Od0Fyx3AJio9U+bF3Cli9x86F/CO3bHbj1wuLUGyL4tWae64ECpBSBBnTd8sx+8cdKC4jJTK1nDwJSmEqm6a4dR+1EdeMiX12+p0hUq2z1qppE5D5eImnKED/6k8gvFqShHNOhS2waNcd8NR12qctLL0uGC+iWDLeDOQEtdnV8oL7gjRb3zpWp4LhCDKOzHFFt15W6rXalOBX87lg6lwuLZymuqy9C8ajVPsqRDGw5E3HY8KLWDniyrrlQwWCmghMY5Z539QkqozND4LqEc5GeVCDCySsbiEdPNtIWRzDIereZBidzypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBQiYhx2/u7iDK+d75y9e0ckUxg4OkW4+Ni2XY8pzik=;
 b=lRcgwwyuGHkfw3g+vzhaBIIg52LLgRjuLGwLz9zL1qPgbbobfIf6KZ6mw5O1y+0AVukly5ntB7EVp3qj9NaKn4od+yJhcXRCIvSd4RikFP/QyI81rvfXCX0OgyDCANYZwE6M8m+xSxE/IqaM6mkOpFUTHFA3KnuwTfcqDTSdORImQ4n92NKkv7RXe2QzNLT72sEjGfVzxVQMEFD4eSRjjdRQmwNcbJGdy+HfSuMqdSUoaT5/E/Vg0u5luwe8Hh0n+VjZzHx1ZTq6PUbla7nZN+rLnsELFxMGL2ugZuNQAtJnxEkFhRZBx4uXd3zQty1dB2MQZZaa4EVYqr7HZTGNew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBQiYhx2/u7iDK+d75y9e0ckUxg4OkW4+Ni2XY8pzik=;
 b=SUn0CqH1A+I0Q+Bu1aEuckGsU9WXhVeaEVIwjG9j7zmyYxbu7TpsvB5rBRNxrArKPskZpO25VV8qf5DuV/Ums/xJaKAD3GqroEkAaaCnmqk+fwB2/lUOtJeLHGvoemFmX0nkST+vMSpfinzZHtSTThpRBs2KAQWhAT+CoQp5+cg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <86826aef-b0ab-4899-800b-38597b07ab6d@amd.com>
Date: Tue, 9 Apr 2024 09:31:49 +0800
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
 <d2685464-65ae-4b88-b458-8873599027ff@amd.com>
 <531cc2c1-a2ac-4700-9f50-8c2e5c8680c7@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <531cc2c1-a2ac-4700-9f50-8c2e5c8680c7@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|DM4PR12MB9070:EE_
X-MS-Office365-Filtering-Correlation-Id: fcfd31bb-78de-42e8-c403-08dc5834d66b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C4mx7mvvRJHezR+5LsVv8Wfg0YTLwCVI0jcA7SpRZ0h2qe0MGZpze8jkxYKjBeWbPU2r5v3KeQyI9n64+5Lk74a9vx//NpFGv+38OuIdSIyr8oPXuxCleZnVclhI/EImwH5dr8CjfasuqBff5jU1ITFt8BLdziZ7FeuT7d55T30WqW3aCY9aoQY7N2FsinxgBc/kzT1l884ys0xhvGb2PigHcDFjkhYpiu2y+uLscrC+y6Hj16qhXqtIeR+nLrKmhdhj4N46l0L4lvQ78TyRwjm8A/om+ddPB1nHy0CIP+SpLWo40VkuqFeekkhy3/w03xq+w/HgtQzJKyYD3m+9be+v8OTOdQWVUHF6UESS3ljWYUheYrT5T2vnD2Uc/Kjc88uQgekG52ba6yd8z50QPc4Qaj22bbumthJ0rSAIKRO4NWWqDL7cKx+VUyBjtDtiNDuvbx9EFyVl5DmnE6nbodg7SNSoevcdREvTVbWmiIARpoA1MRZtwqzpKxrPkxa98d9PgJiVqjILDZ55yce/sOPewQ/WkEMrQYBnMtLD+FAOwANebMZQAT6Skdc/mJcLNjSU2s+Pk0BYXV1jJD5nn518ajHPHP02awRWO2pBDxLR0O7p40VZlm2VzOd46RDKoUYyeNraFLVfARq9VQd2LSKAnpTUpSunap6IR5yGLTHX1N1ifvmyOJh+vfHC+yBIIJnIJYg13ggULIrgT/2pSYlt5iLDe8fgU9zyZ3HvW8MsDHTM9CPC+ciCP2HA59RI
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 01:31:53.8073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcfd31bb-78de-42e8-c403-08dc5834d66b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9070

Hi Jan,

On 4/8/2024 2:19 PM, Jan Beulich wrote:
> On 08.04.2024 05:08, Henry Wang wrote:
>> On 4/4/2024 5:28 PM, Jan Beulich wrote:
>>> On 03.04.2024 10:16, Henry Wang wrote:
>>>> --- a/xen/arch/arm/domain.c
>>>> +++ b/xen/arch/arm/domain.c
>>>> @@ -696,6 +696,7 @@ int arch_domain_create(struct domain *d,
>>>>    {
>>>>        unsigned int count = 0;
>>>>        int rc;
>>>> +    struct mem_map_domain *mem_map = &d->arch.mem_map;
>>>>    
>>>>        BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
>>>>    
>>>> @@ -785,6 +786,20 @@ int arch_domain_create(struct domain *d,
>>>>        d->arch.sve_vl = config->arch.sve_vl;
>>>>    #endif
>>>>    
>>>> +    if ( mem_map->nr_mem_regions < XEN_MAX_MEM_REGIONS )
>>>> +    {
>>>> +        mem_map->regions[mem_map->nr_mem_regions].start = GUEST_MAGIC_BASE;
>>>> +        mem_map->regions[mem_map->nr_mem_regions].size = GUEST_MAGIC_SIZE;
>>>> +        mem_map->regions[mem_map->nr_mem_regions].type = GUEST_MEM_REGION_MAGIC;
>>>> +        mem_map->nr_mem_regions++;
>>>> +    }
>>>> +    else
>>>> +    {
>>>> +        printk("Exceed max number of supported memory map regions\n");
>>> Debugging leftover?
>> Well, not really, I did this on purpose to print some info before exit.
>> But now I realize other error paths in arch_domain_create() do not do
>> that. I will drop this printk in v4.
>>
>>>> @@ -176,6 +175,37 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>>>    
>>>>            return rc;
>>>>        }
>>>> +    case XEN_DOMCTL_get_mem_map:
>>> ... separating blank line above this line and ...
>>>
>>>> +    {
>>>> +        int rc = 0;
>>>> +        uint32_t nr_regions, i;
>>>> +
>>>> +        if ( domctl->u.mem_map.pad )
>>>> +            return -EINVAL;
>>>> +
>>>> +        /*
>>>> +         * Cap the number of regions to the minimum value between toolstack and
>>>> +         * hypervisor to avoid overflowing the buffer.
>>>> +         */
>>>> +        nr_regions = min(d->arch.mem_map.nr_mem_regions,
>>>> +                         domctl->u.mem_map.nr_mem_regions);
>>>> +
>>>> +        domctl->u.mem_map.nr_mem_regions = nr_regions;
>>>> +
>>>> +        for ( i = 0; i < nr_regions; i++ )
>>>> +        {
>>>> +            if ( d->arch.mem_map.regions[i].pad )
>>>> +                return -EINVAL;
>>>> +        }
>>>> +
>>>> +        if ( copy_to_guest(domctl->u.mem_map.buffer,
>>>> +                           d->arch.mem_map.regions,
>>>> +                           nr_regions) ||
>>>> +             __copy_to_guest(u_domctl, domctl, 1) )
>>>> +            rc = -EFAULT;
>>>> +
>>>> +        return rc;
>>>> +    }
>>>>        default:
>>> ... this one.
>> ...personally I don't have strong opinions on the style as long as we
>> keep consistent. I can switch the Arm one following the x86 style or
>> just leave it as is.
>>
>>> Further with the way you use min() above, how is the caller going to know
>>> whether it simply specified too small an array?
>> I am a bit unsure if we need to forbid caller to specify a smaller value
>> than the max number of regions supported by the hypervisor, technically
>> it is legal, although I agree it will lead to some issues in the
>> toolstack side. It looks like the similar hypercall of e820 also does
>> not forbid this (see get_mem_mapping_layout() and related
>> XENMEM_memory_map). Do you have any suggestions?
> Fill only as much of the array as there is space for, but return the full
> count to the caller. Another option (less desirable imo) would be to return
> -ENOBUFS. If to be written anew now, I'd likely code XENMEM_memory_map
> handling that way, too. But that's too late now.

Thanks for the input! Sure I will follow the suggestion in v4.

>>> And then you check d->arch.mem_map.regions[i].pad. Why's that? And even
>>> if needed here for some reason, that's surely not EINVAL, but an internal
>>> error in Xen.
>> I did that under the impression that we need to check the value of
>> padding field being 0. Also you mentioned in one of the comments below
>> that Xen should guarantee that the padding field should be 0 before
>> return. Apologize if I misunderstand your comment. The -EINVAL is taken
>> from the same way of checking the padding field in XEN_DOMCTL_vuart_op
>> above. Personally I would keep some consistency, but I am open to
>> suggestions to make it better.
> In XEN_DOMCTL_vuart_op it is caller input which is being checked (and
> needs checking). You're checking internal Xen state here instead.
> Considering the nature of the issue arising if the assumption was broken,
> ASSERT() would seem to be the construct to use for the internal state
> check.

You are right, I will drop the Xen internal state check here.

>>> Finally instead of __copy_to_guest() can't you use __copy_field_to_guest(),
>>> for just nr_regions?
>> You mean replacing __copy_to_guest(u_domctl, domctl, 1) with only the
>> __copy_field_to_guest(u_domctl, domctl, u.mem_map.nr_mem_regions)? Ok I
>> can do that in v4.
> Yes (unless there are technical reasons not to, of course).

Thanks for confirming, I will do this way.

Kind regards,
Henry

> Jan


