Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EBB878F1A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 08:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691672.1077885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjwgw-0002Ga-Uj; Tue, 12 Mar 2024 07:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691672.1077885; Tue, 12 Mar 2024 07:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjwgw-0002EZ-S4; Tue, 12 Mar 2024 07:36:54 +0000
Received: by outflank-mailman (input) for mailman id 691672;
 Tue, 12 Mar 2024 07:36:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Msr=KS=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rjwgv-0002ET-Mq
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 07:36:53 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49a04de4-e043-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 08:36:51 +0100 (CET)
Received: from SN4PR0501CA0048.namprd05.prod.outlook.com
 (2603:10b6:803:41::25) by MW4PR12MB6708.namprd12.prod.outlook.com
 (2603:10b6:303:1ed::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Tue, 12 Mar
 2024 07:36:47 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:803:41:cafe::9f) by SN4PR0501CA0048.outlook.office365.com
 (2603:10b6:803:41::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18 via Frontend
 Transport; Tue, 12 Mar 2024 07:36:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.83) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Tue, 12 Mar 2024 07:36:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 12 Mar
 2024 02:36:45 -0500
Received: from [10.65.148.173] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 12 Mar 2024 02:36:43 -0500
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
X-Inumbo-ID: 49a04de4-e043-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2qf4i8oXxXt+SccMk5O/6oQ7h04iPMGuXNW97y2CZmRBIrLz8/0SmSNdxXgWD7g4+h433RTzD2qIqpDIzTjTsQ3MIuh7BhrGo3n2Lq3BCmLRlwxhAzH/gsjIKnlp7pqcNbzFvxdm459u48vxsnFy7VgHTMO28/EwLmsbpAxhK3DI7RbxnYhU6m0q+qjF66PwomVIDCVd9WkA+7Q/2JvzkthFc44RZHNPYblqrEPwyFyNM/sRdCE/2sCp/C0nHH6yuLNdiOX4C0iXoORAULXQqTW5AImz9IHDnPoVdErLA7ky1DZwroHyZPFD/8G/5SvAdUbc/TW6AGmeXF5gU3u7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXLRgGXa/GHyCQHgRtman8uGCjv6NBxjHbeCydiRMmY=;
 b=fpBbN9F/n2TOCbk+BP95aXjdSIrlnrDq+Wsn5Sjk6SquYFV467Hqe0zQppxNJ2TaVDsIIPNUZ9fhKvtbhMnVbqCy2qKG8CkOh7nmWu5EREURVMnRtsjj67ajaXBKFGf+eI3cxpJ3cyb4uX2pUNe5H9HmRvUA4CHGI5v0qRiQaufGUpLp9u2REjM4Wm+SgfUZRp9+p/jHxFTRPAuvUooaDbZ00xBZ2Tv5vg9r6ECM+7kLbD62uP4KYY8XJO8gyXXScOM821UhnTzLw/mu28mgKUWZabyZ172Z3Od7V3gg+NZknTMZzaCusL9VytDGnh0wTaJ+5rG032UwdQfUXPZ/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXLRgGXa/GHyCQHgRtman8uGCjv6NBxjHbeCydiRMmY=;
 b=1lN6ye2IkoD166CG2eKisSau3ARxm3rzfZgvc8WplLMgTua/3qTd/oYn2xjRFiKhv9cpgKlWQbe2ovECBZBy1shA6fZL/umXj/ltQdF9B0WXMRnr1NQ/VXHb3wyuRSTa1F+IUkvUpHxNDn5jNahE08gNZxax45crIFGkD0Fn1Ls=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8a4da09f-b880-46f5-a2ad-b29b77f39108@amd.com>
Date: Tue, 12 Mar 2024 15:36:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] xen/memory, tools: Make init-dom0less consume
 XEN_DOMCTL_get_mem_map
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Alec Kwapis <alec.kwapis@medtronic.com>, <xen-devel@lists.xenproject.org>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-6-xin.wang2@amd.com>
 <1cb8bca3-58b6-4a8d-ac46-8338ea5807e7@suse.com>
 <294ff8fb-825c-4950-857a-166b65474a53@amd.com>
 <7b9f3e46-8a70-403f-a98c-e53bea04b389@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <7b9f3e46-8a70-403f-a98c-e53bea04b389@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|MW4PR12MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: cbb59859-b180-4c28-9e3c-08dc42672bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UYD8LGobvkutqWncPGvqec5miUOSnVnOgBvKq6AU4dzBMjtMEN6iwEtIQbWInn3UMZzqbujZiZulMWHHsRgo868EEqzBIBLXSjZlzQFfPpTsRybcySIcuSKjt5LN9GuXHeYGR4frFs/+npOy7K9tsJE3rhpzt+gvRIoVaLnP5fFDyQ2XEmBk4bPhnT796wd5a76/GURd5In9F7Fhgy8boXvQi7OA7XFJedQXtBmIaxlsDeI317nNfZAifcOo7dsVWWTKvdtIkWwX3k9DPmxh/NzM3+RO+id2hu4s3xpBTuvWPxXzBTDGU58OHSu2P2JoqeUWBAAUkuE9zrfR6pTtJr9Dczg2SHKd2z+KSH4KqtfcZAWa1X2Ts/6Sm8+bcZAjKTO4K/iOuhXbM5Ld15OWgMnO7FKUfiUNhK+1WHt2vSJAC0DQiM/nfwPDcv9+Mhcp7sb2S9ebm9VMTPIbKv9UdTi/7+UHBYMWL1Y6u66mrRhSVKg8/cHAfrk7d4wL8d1B8K915aYalBNKjjdYEYmUWUuCDREEU96mxWtnzxEIJeCxtsm1+PYqC3k7xyMuMws9RGJFnm2IP3yQzJqtQXFKlMz4QylLpl1T9aJwu2z2xJNgA16zQzIEKxyAg4Cm3fbySWcv8VD/gicoJ+Wnu/zg/IDeaN7Dd3DB/hKtuRflKDObkQVTtRHx5aDf5Abj8ZDuTfJflXM9visQsM4NIuZZHw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 07:36:46.2110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb59859-b180-4c28-9e3c-08dc42672bc5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6708

Hi Jan,

On 3/12/2024 3:34 PM, Jan Beulich wrote:
> On 12.03.2024 04:44, Henry Wang wrote:
>> On 3/12/2024 1:07 AM, Jan Beulich wrote:
>>> On 08.03.2024 02:54, Henry Wang wrote:
>>>> --- a/xen/include/public/memory.h
>>>> +++ b/xen/include/public/memory.h
>>>> @@ -41,6 +41,11 @@
>>>>    #define XENMEMF_exact_node(n) (XENMEMF_node(n) | XENMEMF_exact_node_request)
>>>>    /* Flag to indicate the node specified is virtual node */
>>>>    #define XENMEMF_vnode  (1<<18)
>>>> +/*
>>>> + * Flag to force populate physmap to use pages from domheap instead of 1:1
>>>> + * or static allocation.
>>>> + */
>>>> +#define XENMEMF_force_heap_alloc  (1<<19)
>>>>    #endif
>>> If this is for populate_physmap only, then other sub-ops need to reject
>>> its use.
>>>
>>> I have to admit I'm a little wary of allocating another flag here and ...
>>>
>>>> --- a/xen/include/xen/mm.h
>>>> +++ b/xen/include/xen/mm.h
>>>> @@ -205,6 +205,8 @@ struct npfec {
>>>>    #define  MEMF_no_icache_flush (1U<<_MEMF_no_icache_flush)
>>>>    #define _MEMF_no_scrub    8
>>>>    #define  MEMF_no_scrub    (1U<<_MEMF_no_scrub)
>>>> +#define _MEMF_force_heap_alloc 9
>>>> +#define  MEMF_force_heap_alloc (1U<<_MEMF_force_heap_alloc)
>>>>    #define _MEMF_node        16
>>>>    #define  MEMF_node_mask   ((1U << (8 * sizeof(nodeid_t))) - 1)
>>>>    #define  MEMF_node(n)     ((((n) + 1) & MEMF_node_mask) << _MEMF_node)
>>> ... here - we don't have that many left. Since other sub-ops aren't
>>> intended to support this flag, did you consider adding another (perhaps
>>> even arch-specific) sub-op instead?
>> Not really, I basically followed the discussion from [1] to implement
>> this patch. However I understand your concern. Just want to make sure if
>> I understand your suggestion correctly, by "adding another sub-op" you
>> mean adding a sub-op similar as "XENMEM_populate_physmap" but only with
>> executing the "else" part I want, so we can drop the use of these two
>> added flags? Thanks!
>>
>> [1]
>> https://lore.kernel.org/xen-devel/3982ba47-6709-47e3-a9c2-e2d3b4a2d8e3@xen.org/
> In which case please check with Julien (and perhaps other Arm maintainers)
> before deciding on whether to go this alternative route.

Yes sure, I will wait a bit longer for the agreement of the discussion 
before implementing the code.

Kind regards,
Henry

> Jan


