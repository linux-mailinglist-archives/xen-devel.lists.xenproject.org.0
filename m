Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1868AA6F9
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 04:31:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708627.1107655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxe2Y-0000sH-Mq; Fri, 19 Apr 2024 02:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708627.1107655; Fri, 19 Apr 2024 02:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxe2Y-0000pw-KA; Fri, 19 Apr 2024 02:31:50 +0000
Received: by outflank-mailman (input) for mailman id 708627;
 Fri, 19 Apr 2024 02:31:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=52U1=LY=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rxe2X-0000pn-Cn
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 02:31:49 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f74e39af-fdf4-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 04:31:47 +0200 (CEST)
Received: from BL1PR13CA0239.namprd13.prod.outlook.com (2603:10b6:208:2bf::34)
 by CH3PR12MB9195.namprd12.prod.outlook.com (2603:10b6:610:1a3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.43; Fri, 19 Apr
 2024 02:31:41 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:2bf:cafe::13) by BL1PR13CA0239.outlook.office365.com
 (2603:10b6:208:2bf::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.29 via Frontend
 Transport; Fri, 19 Apr 2024 02:31:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 19 Apr 2024 02:31:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 21:31:41 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 21:31:41 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Apr 2024 21:31:38 -0500
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
X-Inumbo-ID: f74e39af-fdf4-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etTvsyyd48O5GVegNMEQ+4xUOaTFT5kThmtI0TXIUJJX1MufdSAB9PMY18biFqioBBqF50OkLJEvILx9fJ4Ol7isjYxKQ1ecyZlh/e8dADveMRwXIh5O79Jk6n8QVTuG7p6kerCbOYPbIKEv1uztwzX0uw0Uv0avE2e5z+NB4aMVxy4NvofpR3zUWGP52k4KmfP0ZIw2s66DEAq9KqJOP21o92MOYMpH1f22UBe5SYofbhWr1XkDt/5KOqzrxcuAyvrp5sSSn3o/+HYvkKLZHnS0F6rSRGh/4LOEectTu+3YO57Z+L3IrhsfXN9rFFHLvlBjU+3oF+hLXEU7FNgsTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUZRukvAfZ5neDu0ABl0uR5S6MvEatH59LzEPtV7y58=;
 b=iQZwV9leuiQ9vqg3IiDwfnGhJI05RE7oMw3Q7rRxjVkwZkWe8RxnVRisyFN8N6ZO6rNIfAcCXC9hWpX12WpchdPLbzjSdGhNFddc8BdWeN5xZ+E64CVNz+HtixEj/g4PCz5jKYce5j43QhA6Oz2yQCXXnfatq4K4wrbmUff8+HcHJazf+pZP6Ve/Rc9lf082l8DCvqdOkI7RoDLMVyIS/GoglHEO3hpkx8a1iOH6/HUIZ4K7XpKwCynz8AZ3/WTMGXPhpnB4xye3EQdKIH1JDBIrM6J63lJw6yDbBh48YlyC18w9HYVeJq0vDBY5SPRuSgfpnmyzGxfCU6HmVXzcGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUZRukvAfZ5neDu0ABl0uR5S6MvEatH59LzEPtV7y58=;
 b=Y1aJ9+FZfQjFrB1sC/VHhrntpwU3quTSBZ5L2xKvNxWv9cbDuejmvKHeksWLw9m1zTIPKJLbslmFUmTKvnTfGIKF08hVthAjisKB+ib4L2wgDts9sOz3Q6FILmkZg0k2JW9o0ns37KMWDzliLqiQdX0NhRAI1VbzoHNzDV+RAB4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <eaad1ad2-e6ec-42a6-a0fb-236ce93f0a9e@amd.com>
Date: Fri, 19 Apr 2024 10:31:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] xen/memory, tools: Avoid hardcoding
 GUEST_MAGIC_BASE in init-dom0less
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Juergen Gross" <jgross@suse.com>, Alec Kwapis <alec.kwapis@medtronic.com>,
	<xen-devel@lists.xenproject.org>, Daniel Smith <dpsmith@apertussolutions.com>
References: <20240409045357.236802-1-xin.wang2@amd.com>
 <20240409045357.236802-5-xin.wang2@amd.com>
 <cc4fd69b-4866-4f1b-b780-64c5fac7d2d6@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <cc4fd69b-4866-4f1b-b780-64c5fac7d2d6@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|CH3PR12MB9195:EE_
X-MS-Office365-Filtering-Correlation-Id: f8cd9427-de87-44ac-cba5-08dc6018d915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PZ/T48zK7Dcv6agbLMYPlFZ/2bKuNAvtycS1+9hOpMy628ot28BImQVa8hJ7/uFnong4PdIrs3bCFcJAn6lHLAIwO0c3a0YvTTNP8vW5InwiKpvT5XSCqdxgoZtU3Z7GC+zqcrW0kpt48mESpRQmB9rxKPJW6a9NXAgYETOIPUgKoLKn/DUS9REJDmX/eFjN8mwQLPucaGq/D0LXteocekcCMQKp3GaKRqff1QsJUnAyAMi0znRgNbm0+9QS+BRcfSZN0SnkTvzf5Yq5Zd5nWQtL2SUo57Y+zEUmoMVIw/YR+27V20MrFcIKOYefBbdAQT1EyaALCuHNVyr0ad4Fr5xOA9/Cjts/nXxP/uuFzaBfSZGxYLmSfqJexF0VWdzxK8rgv/25Qvf5l1G0ojHIYntN17u0xHqDLOqYqCZcZTg960xPROxPQcWu7GcXG1mTU6sSbKY6/LgHBSXvvgGOhDZcPg+wWXHwP+BsaDP5k0ROZ+NqUE40whQpL/vwgk223JBmmGlMm76F5WZpuqUbT4+LA1MUL6HGLgwvqFabmyThvH7RyeSyHbQPKAYZAZEcGrOPVI8XmJumwSWl8moP4ZyXVxso9O3ajMr7QedBN3hWkvrmMzdZXKuqpXRDwyY/5/dK9jshP3UZl0fknIIZNqbr2G0zUHLXUqqIBSuWGXo9CxZhBM1XVeEUzjefxyjSPquXTqrx7FRSr8WFSGvj0AtBHIBRdcaugevWeId3XLUMlx/3P6fg9QXPlHqe8ckc
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(7416005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 02:31:41.6864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8cd9427-de87-44ac-cba5-08dc6018d915
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9195

Hi Jan,

On 4/18/2024 8:54 PM, Jan Beulich wrote:
> On 09.04.2024 06:53, Henry Wang wrote:
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -155,6 +155,14 @@ static void increase_reservation(struct memop_args *a)
>>       a->nr_done = i;
>>   }
>>   
>> +/*
>> + * Alias of _MEMF_no_refcount to avoid introduction of a new, single-use flag.
>> + * This flag should be used for populate_physmap() only as a re-purposing of
>> + * _MEMF_no_refcount to force a non-1:1 allocation from domheap.
>> + */
>> +#define _MEMF_force_heap_alloc _MEMF_no_refcount
>> +#define  MEMF_force_heap_alloc (1U<<_MEMF_force_heap_alloc)
> Nit (style): Blanks around << please.
>
> Also do you really need both constants? I dont think so.
>
> Plus please make sure to #undef the constant once no longer needed, to
> help spotting / avoiding misuses.

Sounds good, I will fix the NIT, drop the first #define and properly add 
#undef.

>> @@ -219,7 +227,8 @@ static void populate_physmap(struct memop_args *a)
>>           }
>>           else
>>           {
>> -            if ( is_domain_direct_mapped(d) )
>> +            if ( is_domain_direct_mapped(d) &&
>> +                 !(a->memflags & MEMF_force_heap_alloc) )
>>               {
>>                   mfn = _mfn(gpfn);
>>   
>> @@ -246,7 +255,8 @@ static void populate_physmap(struct memop_args *a)
>>   
>>                   mfn = _mfn(gpfn);
>>               }
>> -            else if ( is_domain_using_staticmem(d) )
>> +            else if ( is_domain_using_staticmem(d) &&
>> +                      !(a->memflags & MEMF_force_heap_alloc) )
>>               {
>>                   /*
>>                    * No easy way to guarantee the retrieved pages are contiguous,
>> @@ -271,6 +281,14 @@ static void populate_physmap(struct memop_args *a)
>>               }
>>               else
>>               {
>> +                /*
>> +                 * Avoid passing MEMF_force_heap_alloc down to
>> +                 * alloc_domheap_pages() where the meaning would be the
>> +                 * original MEMF_no_refcount.
>> +                 */
>> +                if ( unlikely(a->memflags & MEMF_force_heap_alloc) )
>> +                    a->memflags &= ~MEMF_force_heap_alloc;
> As asked before: Why the if()?

I think there is no need to clear the flag if it is not set. But you are 
correct, the if is not needed. I can drop it.

>> @@ -1404,6 +1422,7 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>       {
>>       case XENMEM_increase_reservation:
>>       case XENMEM_decrease_reservation:
>> +    case XENMEM_populate_physmap_heap_alloc:
>>       case XENMEM_populate_physmap:
>>           if ( copy_from_guest(&reservation, arg, 1) )
>>               return start_extent;
> Nit or not: Please insert the new case label last.

Sure.

>> @@ -1433,6 +1452,11 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>                && (reservation.mem_flags & XENMEMF_populate_on_demand) )
>>               args.memflags |= MEMF_populate_on_demand;
>>   
>> +        /* Assert flag is not set from construct_memop_from_reservation(). */
>> +        ASSERT(!(args.memflags & MEMF_force_heap_alloc));
>> +        if ( op == XENMEM_populate_physmap_heap_alloc )
>> +            args.memflags |= MEMF_force_heap_alloc;
> Wouldn't this more logically live ...
>
>>           if ( xsm_memory_adjust_reservation(XSM_TARGET, curr_d, d) )
>>           {
>>               rcu_unlock_domain(d);
>> @@ -1453,7 +1477,7 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>           case XENMEM_decrease_reservation:
>>               decrease_reservation(&args);
>>               break;
> here, as
>
>            case XENMEM_populate_physmap_heap_alloc:
>                ...
>                fallthrough;

Ok.

>> -        default: /* XENMEM_populate_physmap */
>> +        default: /* XENMEM_populate_{physmap, physmap_heap_alloc} */
> Otherwise: Just XENMEM_populate_physmap{,_heap_alloc} perhaps?

Sounds good, thanks for the suggestion.

>> --- a/xen/include/public/memory.h
>> +++ b/xen/include/public/memory.h
>> @@ -21,6 +21,7 @@
>>   #define XENMEM_increase_reservation 0
>>   #define XENMEM_decrease_reservation 1
>>   #define XENMEM_populate_physmap     6
>> +#define XENMEM_populate_physmap_heap_alloc 29
> Without a comment, how is one supposed to know what the difference is of
> this new sub-op compared to the "normal" one? I actually wonder whether
> referring to a Xen internal (allocation requested to come from the heap)
> is actually a good idea here. I'm inclined to suggest to name this after
> the purpose it has from the guest or tool stack perspective.
>
> Speaking of which: Is this supposed to be guest-accessible, or is it
> intended for tool-stack use only (I have to admit I don't even know where
> init-dom0less actually runs)? In the latter case that also wants enforcing.
> This may require an adjustment to the XSM hook in use here. Cc-ing Daniel
> for possible advice.

This sub-op should be called by the init-dom0less application (toolstack 
side), which runs in Dom0. Daniel has proposed an alternative solution 
which is based on the hypfs. If we decide to go that route, I think I 
will rewrite the series. I will wait for the discussion settled. Thanks 
for looping in Daniel!

Kind regards,
Henry

>
> Jan


