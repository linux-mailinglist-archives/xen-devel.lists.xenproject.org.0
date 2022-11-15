Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ED66292C2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 08:54:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443790.698529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouqlZ-0004Bv-8J; Tue, 15 Nov 2022 07:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443790.698529; Tue, 15 Nov 2022 07:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouqlZ-00049Y-4q; Tue, 15 Nov 2022 07:53:57 +0000
Received: by outflank-mailman (input) for mailman id 443790;
 Tue, 15 Nov 2022 07:53:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ouqlW-00049S-Lx
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 07:53:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70052.outbound.protection.outlook.com [40.107.7.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a56f1437-64ba-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 08:53:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8974.eurprd04.prod.outlook.com (2603:10a6:102:20d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Tue, 15 Nov
 2022 07:53:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 07:53:22 +0000
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
X-Inumbo-ID: a56f1437-64ba-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Drh7SXiTG0azDADop78JrE1U+qkRnU45OvqAKAQXg+oZPYjQSv0OH3IKAgiMnxKu76rbgy+pmpJBPuaH3fhiahRobmxCGlPn5Ic/iFIIc7pCK4uk1i1daqlm+k176M4aYbs/Tj/T0ZAsYfeiurxb4tL4ICGGwIF/nMVPeMtIlzj+AccJRNChknrdhuji/otUe+BO7oJxzaFf/fBtGNXvUyAPLyxGJpJujLPowtl5nNgDxYey4YzMsj3/NxmhJscY+XUXSUspr3h3h2NaJqg4t4XjXnPxJT6x8SgyXKgqoBYM88MfxwU9kvjT0N5N1niQjf8zOG86P69TE3ZIwhRFRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EXECTV9C6oDhySzkOcsb6G9UHw6CqFTXb5TGZTafo0=;
 b=GUE8YIBJHI6Cdo/PyGQSRTePj/zW/t8oS+KUMp6+o7AtzFmrPX6I4km/K+tU0D16dy7HBuqTVHef277u5lyTrQYHHopx3RdNb1FyiaHR5fuN/nKCzyJ5IiXMQC4X/UEjB7AnAoQ3bQLwXrIDl5MiIMbeNABa5gcb7TDTwU6nq4Dn51FLoEUESw6YJ9BXsTV4BQQFBEZ54OLX0yHxDD7onfemAoF5JwMwy2mC+hsbCCuJdHW1w6CQJ1ol5oUhvzG20c5dvjBAO/WOmTiIPD5ZzSxwEXVqY5pHwLzOj+rKKe69ItxMG2JTc98dzVMcw4NsqisVKuCCiuDxiFj/BLoG/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EXECTV9C6oDhySzkOcsb6G9UHw6CqFTXb5TGZTafo0=;
 b=4lQtVddk1mTcoqSuxb963UXJoGCHWyQ5GfYCOQjAtBChHYcRg7GrIBT3yeNQh/mgY7yLN1ICr9KqFXlbV7GidtKbrLdKgjBbwykn7uM/FznP4jxpsD2+vczK+hEtyRXVxqLd5VwXmx/haXLqfU4wxRNRerRWcx9TgP+FXaSGcQreVgHCHW5w5p2PqkJU7TWWbEKkSEYWO7oEp2bR3nDkXB8FLtN8VGlgtC+hIVvo/Vte6zAjzCg21VMUiFZpMz0CwTBSX6hXcYyUAY3mSnOjJNbn6RBmFrQsvOlPSkOc0sKKA8UYbddJa+wZkf6wRZfQM60gl0bwWs3/oJHGucAfVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <083341c0-8169-e422-e72e-8c83f7699959@suse.com>
Date: Tue, 15 Nov 2022 08:53:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 6/9] xen/common: add cache coloring allocator for
 domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: marco.solieri@unimore.it, andrea.bastoni@minervasys.tech,
 lucmiccio@gmail.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
 <20221022155120.7000-7-carlo.nonato@minervasys.tech>
 <d7ecb1c6-4340-f44f-4f5e-f74236b900f3@suse.com>
 <CAG+AhRXeuNeLEWArZ+7b+=jZgLSs2LLL2nEt+jwyQZVOorqxkg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAG+AhRXeuNeLEWArZ+7b+=jZgLSs2LLL2nEt+jwyQZVOorqxkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8974:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f40e0a-5c4c-48cd-7e33-08dac6de782a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dGw+1/Za4ds8CmLUrx1JoUgf28Nwp+HAF5rIho19f6tDCw8T6BHTqVjduYj4C/ebLSSmrK2DBnGI4XB8EST4UMw3w0zZaTz0/Nv/h4Hj9qPTDJxuyVixKEqZvpqsIV8A3t9AksbpJFc+fbdfCUKAE9OTn9YvOiXGEy6EsQVsF+1dvc2qbej5iLzQCyjQAJkJCKmGDgjjOMOB7jfmd0WnAQPwClEj5D0DwCLm2fT2qcs6+VA0KFzEtKxj9tJLu3H+u6dguIRr13kqDno5F6sMeoQfZlM+p6QHWWBTGu77AkfBv0vEfmbkAZZiMlBQtK+0B/AjhfxrxqOf8kOq3baSHXA2DvdpyNvpBzlhmG+GfHplQ4xTvIIs6DseKLcIUkhh+LQugK7VCF9nOD1BqLzBDbASunIxvCo8H/jUDSbqSOfQnEfg25VpOtRmhj9AWaTX76TCe4jD6H11e4+rNwKtWok7wkrei8SnGb7cAdLvGnOJpsnNrUIfYtQcnmvuOrBCZUZNnZz+6QA5ipQD8nDealBqjQVf6DJ//p4RWOePwJc/qONQLmqeOuIACB+MdL31DSZh3XuoUT8I0aJwze3xI2zWV561nSMjNGja6Y9DLUdJrYTimibqZ2KAqcNNbEmt8TKEZW/3acN3Z2vI/l2Tl0a7elb0AY7u2zzEaXWcP8+Wmdc7blfCaeSWFfj82zGC6xPCkne3dFCftZEue0gEnjoQMoa+Yh9xQmzBn+kdqXDhGDAtOrP+QroaUG7soI/NNA52mxa78ev9wQa6G3EGrIRDzw3nhzMnc3Izdsjcw8c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199015)(6666004)(186003)(2616005)(6916009)(4326008)(54906003)(6486002)(66556008)(2906002)(66946007)(36756003)(66476007)(8676002)(6512007)(8936002)(7416002)(38100700002)(26005)(86362001)(5660300002)(316002)(53546011)(6506007)(31696002)(31686004)(41300700001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE9NMEFjL0wzM3NhZHdyNSs3T0tXdGFsb2xzU0kxak9DdXFib2d4aVdTQnh3?=
 =?utf-8?B?VEVpSzlZSWIrd1drUFZ2TkF2R3VvL3ZqQU1DbEVYeHF4UFRpMmNOdzU1U0Ns?=
 =?utf-8?B?K29rcWdMeUV6S0xMZHJCRnRHL2J2RktiZmJoTWttVC8zem9MdHlBQXJieXdI?=
 =?utf-8?B?MjVvci9QNFVneEpoYTdFSnpjVHFlbEhSQ0pKSTUwa1NVY3pYanByaG9yZmMx?=
 =?utf-8?B?bmpSS1A4RXJ5V0J3MmVZY3pFTXcra0E4Yk8vakRJTTZldGlyUVhyN2EzbjlK?=
 =?utf-8?B?TnJSN1VtZEhmRi80dXlxWVZHYm5UbFpwTTRkYnd1bjhBQ3FRcGZVT1pyQXpw?=
 =?utf-8?B?bmF4aklLZnV2NWlTczZjeGZ6dGdGMUp3V1RuTm9rOHNFaWtRa2Z1eDZTbjgz?=
 =?utf-8?B?bFNKLzRUekxKM0M4dGpZUjd0b0hhUzZTWW93S3ZsQ3VBY3ROL1YzSlVvQmpW?=
 =?utf-8?B?Zk4vSUM5UlRNUGQ5anNGWXRBbjFXeG9zRUpCNHRUeDl5ejJhUVJHNmkvNSsv?=
 =?utf-8?B?WjlnczFwWFgzRWFySUhEODFFOGdwWm5ONmtDKzZKVUQxTnNjSUpyM2dsbDFl?=
 =?utf-8?B?aWF5eWNLb3d1cDcrY3oyMTdLQW51bC80Z3dqOFJZNHRaYUdGZGxtTHl2RElz?=
 =?utf-8?B?blU5b0RoWXdLamxaMzYxdDNPbHU4Um9LQzZmUmVkWjdmb0x6cFZBN2FGdUdB?=
 =?utf-8?B?ajFXZXUyQW1kSmdSQXoySlVseUsybkRaWDBpYnJtSnhJTEM5Y3RZdU1XT2k2?=
 =?utf-8?B?eDVYRUx0dFczdkFzbk03KzNSckpKcGg1ZjUrU2ZYUVExWE84aHBQNlhWL0JX?=
 =?utf-8?B?WGRscXBkUkVrMlhUYzBuNmhrZjdEWXppd2t1ZEc5bjNDQXh4SkRUZHJYRzda?=
 =?utf-8?B?Kzh6dFdxMG5lMHlhUWE0emZSWTNqT2xaU2ZGbnBKcDgwODJLbjJIVVV3a3lQ?=
 =?utf-8?B?V0NNc1lSSGNFbTZ6RWRBSUlTam4rUmFMb2xuVDZRUGM0RE5aRVVqQkpsRGZh?=
 =?utf-8?B?UXk4a2RTZW1XNHVPZEE3R0xsMm82VkJGaUtaZ0lSb1lpQVNGVCtyL1EvK1Ni?=
 =?utf-8?B?M3FEa1J0bEloYU52QmpZb1lFbE1tQXZybEVjcklBcWxIbmxKNFNvT0VDWC9F?=
 =?utf-8?B?MG9SMzRuWXBQTlkxMFpQb2xnM0REMjR4OUlqS3Z3ZHltRE9EVnNUeFg4RlJh?=
 =?utf-8?B?ZG9ZaXcxdEFUcTZlb0R4MnNZTUJQMmYycE52b0FTM1BFTGhYQTZiNnJrT3pG?=
 =?utf-8?B?aVJiWGZCMy9uTjlmUlBDWEhFQWNiZHdLdEFrWUJueTAydUZCTHhXSktabUZj?=
 =?utf-8?B?QkljNmRMM0w0Q014Y2RRdGFqMVYzL1hxU3Z5bit4ZzExUURKc3lHNnowWlVI?=
 =?utf-8?B?Z1FOUXBDZUIwb0JCbjZrUWZmUS9HdzE0aXRiZTM0YTV1WStqdU9INERZYkxS?=
 =?utf-8?B?enlSeE01OGd4RGliZTdwRlFXeURiTXc2ZWpuK1hwb2lCTG8wSHdPWWZRMjlC?=
 =?utf-8?B?djNvY3lFOU54UGxjSG5uVDE4ejBCR20vMEgwRVdxbmJsN3A1WlBzQmRLUktU?=
 =?utf-8?B?U2tMRTdFNkhRVXRtTGhzY05yb3hPK3k0cUR0SkJRLzZpV3hCcG1jMlM2dTRR?=
 =?utf-8?B?akkyTit3VWNqMGpZSVFrSXlEa2liU2ozY2ZzZ0dRLzNJMnJLdVVhbFRTYWtl?=
 =?utf-8?B?SzJSK1hEVmhsdERGSlQwcldqMFlYZTRZbEY5RFh6WVV6MzhadWdKaTBpZTc1?=
 =?utf-8?B?VEQ5NjZ1b2xBZmd5UFZsenRHSVdZZ2tnLzFjNm9hb3lqYmVQRmR6V045NkpS?=
 =?utf-8?B?RVlML0JxcHZVaEpjN1VvbW5JY052SlB4dUs2TkZ1dkU1bEkxc2xFaEZnckE4?=
 =?utf-8?B?RFdDMENObExTb2RGWSsrWGIxVktMTko0ZmNtL0lvRHRnbWIzdThHc05zSDR0?=
 =?utf-8?B?dGRGUHB6RFpKL3FiN0NUR3JOT0t3VFhNTUZSWnZNOW91TGlscCtWSC9JUUtz?=
 =?utf-8?B?OFFZOG94NnRZT0ZSRDFXWGNENml0WkV2MVF4bXllZnJTcmllcHlMZjVISzVM?=
 =?utf-8?B?di9VcUpiakl4MWpLRWw5MStzUjZadlo5TUdsOEIxZ0RGZ3IyVnBEdU1OMVc2?=
 =?utf-8?Q?mg89cgfIN4jeOh7lAnJjmHFj9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f40e0a-5c4c-48cd-7e33-08dac6de782a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 07:53:22.8374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4Rico850OAsCdqisMkeMZZ7tpD402inlINh3VgDHMTAtcON37h0TLUF8fgjncOhCgEUIwDjKIghhQ5+yRJcRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8974

On 14.11.2022 16:04, Carlo Nonato wrote:
> On Thu, Nov 10, 2022 at 5:47 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 22.10.2022 17:51, Carlo Nonato wrote:
>>> --- a/xen/arch/arm/p2m.c
>>> +++ b/xen/arch/arm/p2m.c
>>> @@ -661,7 +661,12 @@ static int p2m_create_table(struct p2m_domain *p2m, lpae_t *entry)
>>>
>>>      ASSERT(!p2m_is_valid(*entry));
>>>
>>> -    page = alloc_domheap_page(NULL, 0);
>>> +    /* If cache coloring is enabled, p2m tables are allocated using the domain
>>> +     * coloring configuration to prevent cache interference. */
>>> +    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
>>> +        page = alloc_domheap_page(p2m->domain, MEMF_no_refcount);
>>
>> Are you sure you don't mean MEMF_no_owner (which implies MEMF_no_refcount)
>> here? And then ...
> 
> Yes. I've already fixed it in the v4 that I'm working on right now.
> 
>>> +    else
>>> +        page = alloc_domheap_page(NULL, 0);
>>
>> ... is it really necessary to keep the two cases separate?
> 
> Not sure. I don't know the reason behind the original code.

The difference becomes noticable in the NUMA case, which is only being
worked on for Arm. Yet that means that converting the original call in
a prereq patch, stating the NUMA effect as the justification, might be
the way to go. (See commit a7596378e454, which introduces the flag.)

>>> @@ -1926,24 +2106,49 @@ static unsigned long avail_heap_pages(
>>>  void __init end_boot_allocator(void)
>>>  {
>>>      unsigned int i;
>>> +    unsigned long buddy_pages;
>>>
>>> -    /* Pages that are free now go to the domain sub-allocator. */
>>> -    for ( i = 0; i < nr_bootmem_regions; i++ )
>>> +    buddy_pages = PFN_DOWN(buddy_alloc_size);
>>
>> Any reason this can't be the initializer of the variable?
> 
> Nope. The end_boot_allocator() changes are a bit messy. In v4 I'm doing
> things more nicely, moving everything in init_color_heap_pages().
> 
>>> +    if ( !IS_ENABLED(CONFIG_CACHE_COLORING) )
>>>      {
>>> -        struct bootmem_region *r = &bootmem_region_list[i];
>>> -        if ( (r->s < r->e) &&
>>> -             (phys_to_nid(pfn_to_paddr(r->s)) == cpu_to_node(0)) )
>>> +        /* Pages that are free now go to the domain sub-allocator. */
>>> +        for ( i = 0; i < nr_bootmem_regions; i++ )
>>>          {
>>> -            init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
>>> -            r->e = r->s;
>>> -            break;
>>> +            struct bootmem_region *r = &bootmem_region_list[i];
>>> +            if ( (r->s < r->e) &&
>>
>> Even if you're only re-indenting the original code (which personally I'd
>> prefer if it was avoided), please add the missing blank line between
>> declaration and statement here.
>>
>>> +                (phys_to_nid(pfn_to_paddr(r->s)) == cpu_to_node(0)) )
>>> +            {
>>> +                init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
>>> +                r->e = r->s;
>>> +                break;
>>> +            }
>>>          }
>>>      }
>>> +
>>>      for ( i = nr_bootmem_regions; i-- > 0; )
>>>      {
>>> -        struct bootmem_region *r = &bootmem_region_list[i];
>>> +        struct bootmem_region *r;
>>> +
>>> +        if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
>>> +            r = &bootmem_region_list[nr_bootmem_regions - i - 1];
>>
>> If you want to handle things low-to-high, why don't you alter the
>> earlier loop rather than skipping (and re-indenting) it?
> 
> Yes, you're right.
> 
>> However,
>> considering that in alloc_color_heap_page() you prefer pages at
>> higher addresses, I continue to find it odd that here you want to
>> process low address pages first.
> 
> It doesn't matter if alloc_color_heap_page() returns higher or lower
> addresses. The important thing is to create a sorted list so that min or
> max are easily found. Having a sorted list means that it's easier to insert
> pages if their addresses are always increasing or always decreasing, so that
> starting either from the head or from the tail, the position where to insert
> is found in O(1). If regions are processed high-to-low but pages of each
> region are instead low-to-high, the always-decreasing/always-increasing
> property doesn't hold anymore and the linear search needs to be repeated
> multiple times. This problem can be solved in many ways and doing
> everything low-to-high is one solution.

Of course. But please also put code churn in the set of a criteria to
apply. Page lists are doubly linked, so it shouldn't matter whether
you insert forwards or backwards.

Jan

