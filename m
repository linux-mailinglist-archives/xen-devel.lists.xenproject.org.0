Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0779894E39
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 11:05:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700051.1092610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rra3l-0000f7-7g; Tue, 02 Apr 2024 09:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700051.1092610; Tue, 02 Apr 2024 09:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rra3l-0000cj-4M; Tue, 02 Apr 2024 09:04:01 +0000
Received: by outflank-mailman (input) for mailman id 700051;
 Tue, 02 Apr 2024 09:03:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6R5e=LH=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rra3j-0000cd-SO
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 09:03:59 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f00c51d3-f0cf-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 11:03:58 +0200 (CEST)
Received: from BYAPR08CA0018.namprd08.prod.outlook.com (2603:10b6:a03:100::31)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 09:03:54 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a03:100:cafe::b5) by BYAPR08CA0018.outlook.office365.com
 (2603:10b6:a03:100::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Tue, 2 Apr 2024 09:03:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 2 Apr 2024 09:03:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Apr
 2024 04:03:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Apr
 2024 04:03:53 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 2 Apr 2024 04:03:51 -0500
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
X-Inumbo-ID: f00c51d3-f0cf-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATT0cv4dNW3b6YGjNn85ijf5H+/FwcXebzzqj3fF7d+ljvdc6yod1HFUQ+XO6uSRmDsQXRWMEhsQAPxSw9CIAdxSvxLK9eKAxrBnf+xaaTO5dJYN/9/1QdoVqQOirD4RvKD+3wUECxvi8uuXxW59b7eWAGR885fJ596yufLtNbYYdnXQusiR0evIkWyh/4WJhR4MJYfuLtsW4J43crMpCqzV1rTFaBVel/SaghHhIQn+SrAgFaDOIuAQFSIvormUqlMIiscYteNbqsdaIdKAR7ibAOyMiU654x6FM7Dhc9u5RiqdGORAxjplx6jKys0rHzmwn1Ziszge5CevLQn81Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ot3IJUV1xdELtyZiGrWHJxSTxoYg9ChiuQXnKiMQWHI=;
 b=B3/FqW3frhzVIHaQTH0U9ZCjNs7mUM77x3pwWtAwl1fr+b79l/2LqTZBy7dVCbc5CZkQ2A2vwiEZJE64eyFs+RW2403kZflVCvIuQfzJvFBMd+ceKHH1vnR8EhOrN6O/D9N9jXNv6sy1aZ0kfLY3A79jgTyJ0vAtEqi6OrJpQS3ZO3V68I3rBEkgFbI7oRtPMfj5Io++VN5ZdIW7RHABCSb1uYpme6OD3f05P7KFTrmCEO4aKSaMpz6IxrbW1jyhXdqhDjW4T9XfFFxXYMJ+qRJJ0l4rWldPdPK2EUXRHtgSl0/dTgxjEPyY805DUvF17r27rWpGcHMP9AFf9U3yXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ot3IJUV1xdELtyZiGrWHJxSTxoYg9ChiuQXnKiMQWHI=;
 b=dQ2AcP9CkkRrXCjQ4i6/FG8+W6lNOUMXhNWUO0ZTKpJtMyxBNKCG/PzKOc9I5d/5Ahx7e4ouSCGs3rVzV1mjeg6sj79HFYm1a1Am/uHqF8fza9ulYslnZCvryGnTda87xGgZ63Is/+E5UBgYHZ9/Y3vDodzsP2zGr6jS4HBJ/yc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <269e2df4-dee9-4863-8888-f23516e2e833@amd.com>
Date: Tue, 2 Apr 2024 17:03:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] xen/memory, tools: Make init-dom0less consume
 XEN_DOMCTL_get_mem_map
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Alec Kwapis <alec.kwapis@medtronic.com>,
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-6-xin.wang2@amd.com>
 <1cb8bca3-58b6-4a8d-ac46-8338ea5807e7@suse.com>
 <b1393dbe-42c2-4839-8ca3-7dc71fe72969@amd.com>
 <d9e3b7c4-d8be-4642-9212-b48ae885b46a@suse.com>
 <4a0e4c60-9401-4031-bf80-66033ad068e3@amd.com>
 <133d81d2-9ab1-446b-918f-d86e86833cd5@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <133d81d2-9ab1-446b-918f-d86e86833cd5@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 086af3df-fa11-4bc2-01b2-08dc52f3d2b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vex4vjjkBV0bzF17BXjgNNOCi1IdzTrMy+gAoLfhbfITWD2WLt8oUqjAsBP5a8XWH5m62+xWIpPHwRyCXZNcuz8dycrkeJpmKpJl8GPfzLUdVHquu0rsYw6CXA0KLkSiRim6cI0oBZ8von80+DSdiIyJGe5nphXi08s4IH0zC2FHujGYucbr5SAWEyDW6yHde4pW8cGNfgbTjXmmcSy1iM99U8SwhbUKthnPKA5tKHjMpWQmSiOXikPrdWAmpvdgdXVsz3ZhkryvKBXess7W1IeZGOWeuxDhXvRjvqiNJHvxW95Mu4nN+0oRppr6anEJfrws9Cqerl7foieARgx37BO8GjuvdrQqQy6dymtieu57qJOGkmKvDv2G8boGu2OZdMXqSz67xM3hA6StplebmuWmkS35aji7oLrg7Zutrq2wHrzU11Mo2FDwETcfDP1uN4O4yJHBgmmLO8To9sgz7nesFadsOVe1MH/IuBhJLnrkx+XSm/+WuFKuayJA9sjDmPzbLqHWCi7JJW9PA2NTttkyeK34v+fpWsnbsnluFzQzykahi+A3MzDr+6djGRMd4N73ZFvGqiqhuWqdh9LlMdkTNkMkPuG5gVwhtvgt7aBEFm5HlONP9v1FjTcSilaxjlAQltYIMY5De6Hy7w9vj47tdzeA91KymfZjDe5gA27iMuwJ/KcQP4//jrt0B1RAqLvl6IG0+gO7rbNg3SsddPdfkphYh7WoIAaORZH07TIkSZtPEgviK+nDHWTOu4Ce
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 09:03:54.3748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 086af3df-fa11-4bc2-01b2-08dc52f3d2b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863

Hi Jan,

On 4/2/2024 4:51 PM, Jan Beulich wrote:
> On 02.04.2024 10:43, Henry Wang wrote:
>> On 4/2/2024 3:05 PM, Jan Beulich wrote:
>>> On 29.03.2024 06:11, Henry Wang wrote:
>>>> On 3/12/2024 1:07 AM, Jan Beulich wrote:
>>>>>> +/*
>>>>>> + * Flag to force populate physmap to use pages from domheap instead of 1:1
>>>>>> + * or static allocation.
>>>>>> + */
>>>>>> +#define XENMEMF_force_heap_alloc  (1<<19)
>>>>>>     #endif
>>>>> If this is for populate_physmap only, then other sub-ops need to reject
>>>>> its use.
>>>>>
>>>>> I have to admit I'm a little wary of allocating another flag here and ...
>>>>>
>>>>>> --- a/xen/include/xen/mm.h
>>>>>> +++ b/xen/include/xen/mm.h
>>>>>> @@ -205,6 +205,8 @@ struct npfec {
>>>>>>     #define  MEMF_no_icache_flush (1U<<_MEMF_no_icache_flush)
>>>>>>     #define _MEMF_no_scrub    8
>>>>>>     #define  MEMF_no_scrub    (1U<<_MEMF_no_scrub)
>>>>>> +#define _MEMF_force_heap_alloc 9
>>>>>> +#define  MEMF_force_heap_alloc (1U<<_MEMF_force_heap_alloc)
>>>>>>     #define _MEMF_node        16
>>>>>>     #define  MEMF_node_mask   ((1U << (8 * sizeof(nodeid_t))) - 1)
>>>>>>     #define  MEMF_node(n)     ((((n) + 1) & MEMF_node_mask) << _MEMF_node)
>>>>> ... here - we don't have that many left. Since other sub-ops aren't
>>>>> intended to support this flag, did you consider adding another (perhaps
>>>>> even arch-specific) sub-op instead?
>>>> While revisiting this comment when trying to come up with a V3, I
>>>> realized adding a sub-op here in the same level as
>>>> XENMEM_populate_physmap will basically duplicate the function
>>>> populate_physmap() with just the "else" (the non-1:1 allocation) part,
>>>> also a similar xc_domain_populate_physmap_exact() & co will be needed
>>>> from the toolstack side to call the new sub-op. So I am having the
>>>> concern of the duplication of code and not sure if I understand you
>>>> correctly. Would you please elaborate a bit more or clarify if I
>>>> understand you correctly? Thanks!
>>> Well, the goal is to avoid both code duplication and introduction of a new,
>>> single-use flag. The new sub-op suggestion, I realize now, would mainly have
>>> helped with avoiding the new flag in the public interface. That's still
>>> desirable imo. Internally, have you checked which MEMF_* are actually used
>>> by populate_physmap()? Briefly looking, e.g. MEMF_no_dma and MEMF_no_refcount
>>> aren't. It therefore would be possible to consider re-purposing one that
>>> isn't (likely to be) used there. Of course doing so requires care to avoid
>>> passing that flag down to other code (page_alloc.c functions in particular),
>>> where the meaning would be the original one.
>> I think you made a good point, however, to be honest I am not sure about
>> the repurposing flags such as MEMF_no_dma and MEMF_no_refcount, because
>> I think the name and the purpose of the flag should be clear and
>> less-misleading. Reusing either one for another meaning, namely forcing
>> a non-heap allocation in populate_physmap() would be confusing in the
>> future. Also if one day these flags will be needed in
>> populate_physmap(), current repurposing approach will lead to a even
>> confusing code base.
> For the latter - hence "(likely to be)" in my earlier reply.

Agreed.

> For the naming - of course an aliasing #define ought to be used then, to
> make the purpose clear at the use sites.

Well I have to admit the alias #define approach is clever (thanks) and I 
am getting persuaded gradually, as there will be also another benefit 
for me to do less modification from my side :) I will firstly try this 
approach in v3 if ...

>> I also do agree very much that we need to also avoid the code
>> duplication, so compared to other two suggested approach, adding a new
>> MEMF would be the cleanest solution IMHO, as it is just one bit and MEMF
>> flags are not added very often.
>>
>> I would also curious what the other common code maintainers will say on
>> this issue: @Andrew, @Stefano, @Julien, any ideas? Thanks!

...not receiving any other input, and we can continue the discussion in 
v3. Thanks!

Kind regards,
Henry

> Jan


