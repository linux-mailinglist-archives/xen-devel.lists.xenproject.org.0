Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7606655F5DE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 07:55:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357527.586127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Qfv-0003Mo-44; Wed, 29 Jun 2022 05:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357527.586127; Wed, 29 Jun 2022 05:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Qfv-0003KG-1I; Wed, 29 Jun 2022 05:55:43 +0000
Received: by outflank-mailman (input) for mailman id 357527;
 Wed, 29 Jun 2022 05:55:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NFaf=XE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o6Qft-0003KA-Fn
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 05:55:41 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130071.outbound.protection.outlook.com [40.107.13.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ac8e8ba-f770-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 07:55:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB2963.eurprd04.prod.outlook.com (2603:10a6:206:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 05:55:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 05:55:33 +0000
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
X-Inumbo-ID: 1ac8e8ba-f770-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5OqECYlIjQ0cn/w0Ixy/KkYA5bHdbNKu75wl+UOmoRPMssH1JveW91Xp2rkMzl683p9mKkGyUV8XbfmhAFky50MqQ7sWjYURxRj0l5rW1Eb/q4TAX/5OT6wad1GERkS9J6UdWqn1TIz86AgA9vCQn5Dda0URUhVTkOmHylNMdUshmtZb+HIljaygL9lNm/+N8dZn5/uOv8R9xz0IOGSTzUihQwhs+7bjItFca7Q+ozW+w7B0sDxPD7x0UoMsNxkPkig8ClLDJ1JkYfWd2xa/RKc+4ghpFsSTgrqrWbQRVcQXFAGoZT6degG1GbzT8fAuWr9GvEdnkh+d0rFRdAEDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z25N6SSFNyje+IEz5RjNnP9mb6RXVGvFh2/tUE7zZWk=;
 b=LStCsGjT7uYBzi1Rkj+FF9lKOIKRakgv391yfSwDFhzxa1JYGqIW3mvLiYeeBIq8hPGgZqGkpOIUCb3hRHfhCE/WtSiBUTzEem0YxmGWcXDqk1fZ7EuUCvTs1oFPFzYyN8+7IjMk8KNrUHzvtH4Lx+Xl7RXAdTK5wxCqDC8PCvUnJ+HPxioCPfahqo7+5zC55ih/vZS+hG59y+xqglv2YcvZq42vyqe/aNS5KOufcZPxqZywc0ivtN6GvMIOc2u5KMmRYZObHI+IEbYk2/ZhthD/zjvsrdThAf4gzZB4xov7YlN19RCe71be6fBUcmmNS5/aRzOYvxmqU7nG76jO2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z25N6SSFNyje+IEz5RjNnP9mb6RXVGvFh2/tUE7zZWk=;
 b=bDGBQ96+KQ7ud9TPnblbFiXhql9dewp9EBzQfVHPcxi64VBH6f9R7FTfdTlKjr7kzYJYJCzsoFCphrhfwS2HQfqrj14JEHdXjXIZUwW7y+q3I5p1y5QEeTVqv4qRTTPzcuWKDeeh9JakV5+vUpEq9RH7ZLf6pMJ4AWOslUq+tiEYEKZdhPCvAfred6udz4WAR17hL5ojvAAnB2NMpeUFlwR4S3ds1d6UMG9pC4JSbMc02K7lWFp13WdMCEh5LNd1Bn0jX4zYc4un4tSmXweNRT2RgSELsdjOrYUbBTBlUhPlaHWSUb/aNyFKjKNPalSAGZqburIQ/WRFB3yzBwEnrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6cfca3ce-219e-f9e4-e30c-40d7a74ea523@suse.com>
Date: Wed, 29 Jun 2022 07:55:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 7/9] xen/arm: unpopulate memory when domain is static
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
 <20220620024408.203797-8-Penny.Zheng@arm.com>
 <5ac0e46d-2100-331e-b4d2-8fc715973b71@suse.com>
 <DU2PR08MB73255B2995B4692B5D46252FF7B99@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <380b2610-fe2f-6246-e6a4-f0dd8295d488@xen.org>
 <DU2PR08MB732507EFB0CC4FEAA4872B3AF7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB732507EFB0CC4FEAA4872B3AF7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9a6276a-7768-4227-8ef1-08da5993fb06
X-MS-TrafficTypeDiagnostic: AM5PR04MB2963:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	697eIi1PUkCPbH7u8A2KgMiDWxxzrfG1NslntYNvCEmIU1UVyo/sSdpVKYBsXLtI4Fg2P8+PSqOxmGgZJSW/qyNd9QIZUbKNBi5lFcZWR3skmcGM07fiTN7z89c9m7fhbO9mKgOzKPEId8isZqMZ8EE0tdiqaS9fvWBg3nKgUs+2g+AsxgFAS1PrJ1LQulDgclQ0WG5eRWvUI078iK3i4TwThMDV6LWDUtNnmboSvGrAnsOYzVKH5nNTjPg9q+VkLhoF4iHp88J/Bw/MzEMQ4jBcWntHWdoCJ+wGgwUPI7So8PfElXu8+WqIVZ7gVOMLtVh+OYOBdXnrwIEmRUpec0BXrmuuJ/tgQX5u8p2YKT+qFEYPB2n4TguNm5g815YtN/foUVF0fFK+CkBeLCm7+37NqyUPBi8mjdlfJt/54fxN9892xeU5EyyP562YP23oqlGRKoCGlSZag6QiPqnRB81OmgzzMFtUHwBSsH4jicnpGqImFbOIZVcvQnCvIZt6XumGPw1HA++Rk4Itut1T95MZqgX7esx53gcv1mvLcy11f2BFkQ1oWEfbor6YdJQn3Aq/Wi7j1I6bmw3slA/q+MS56z4+856FPwgTgn85lAOaB9FWt1+9stiPNBYYeHhylO57RoZ+MKlcgJeHQO6gArMs9VURW0SVev61gf/oMFMkj+gfCL3gYTUYVJeg9CD275Ooa05gQkbnZsuCOs8uwPeeP6jEDPK2O2qIzEjdxk6vDLcYZu7VJnYESGXzw379SF3j4P09ZXrQJXbIEM5AHfRwLmZTJDl0g23jTRT2vmpbL6agi7kqSIBQYpnkl+MXrcS+l9QJ65xG/8qTpk5nPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(366004)(39860400002)(396003)(346002)(6486002)(66476007)(186003)(31696002)(2616005)(6862004)(26005)(478600001)(5660300002)(4326008)(54906003)(6512007)(8676002)(316002)(66946007)(83380400001)(36756003)(53546011)(6506007)(41300700001)(38100700002)(66556008)(86362001)(2906002)(31686004)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWpxR01YbDB2S29yYVV0SXljRjI1dG9wTnM1R1ZCenhDNWxnUG5Tc1pGWHlO?=
 =?utf-8?B?amdlTzNhMGFtL0VKNkZtWWQ5RkdzcVNDSmEra1BPUmF5NlNKUXVKR291Vm8x?=
 =?utf-8?B?K1hoTWc3VVRJdHhaRzVsaE1QSnhuK1dBZjBJb2pmbzRBQjQ3eDREeEIyc0Z4?=
 =?utf-8?B?U0x0cFMzbFRKZ0JJVEZxbjJmSzVuZHJwMlhacEF3d29LeU0vTnMvbEVFcHNS?=
 =?utf-8?B?ekM5aUhHUDl4eWYvbHFDWDZ2dkRRNTNCU2FVUzJjUHJKc3VacWZFTVZwNng2?=
 =?utf-8?B?dnEwWUc5dlZ1TE9FNkdWRGpqYXVNS1ZWVzNSQVdZKzF6MndUZUphQlpIcTZC?=
 =?utf-8?B?VGwyeG1BRWl4Mk9GdVZwTEo0N09LNE8zcVpDeXdjZ1RqUXlFSHF2MFRPZDB2?=
 =?utf-8?B?Qjl1cEhadk93UDVFUFFCWk0xaHd3VEl3eVoyZ2NCQjkvUlJFcHhNV3BBc1NT?=
 =?utf-8?B?MWdpRlJxNERVdnUvS0Rxb3RBQXlYK1R4Q3kxV3d3RlNCZzhydEVIMkhxUnBp?=
 =?utf-8?B?M1Bic21FUFRYaHRIRmNDQ1lFUk1uOEFqUUhrNFJ5TFI1QUo4dXhSV0F4MSti?=
 =?utf-8?B?ck9hZmlVK0xtdUhBZG1uNGhFY1ByTUNEVFE1M1NVZnN2NGRudEwvRjdKSTBW?=
 =?utf-8?B?MXZjbjNpUUNOdkNUY1RveVpiUnh3WHZsU25BNUVVN2kwaUhsQnQrSXBqL055?=
 =?utf-8?B?dnM4VU9zczhGMjdUbGcyNzFrOUFySFc0NE5WbHFXcVF1djE1ejI1aDJ6QnU0?=
 =?utf-8?B?elFNTW5uNmFDTkZuL3dHajJibkQ5N2hmMmMwU3NQeUtBTjNMVTlVNWwyWk1x?=
 =?utf-8?B?OC9vSXR3aTlGOXl2VUN5ODJKSWVuQmg2RERZRTc2MXNpYmtZaUxGOFNxZW9v?=
 =?utf-8?B?S1hGYnE4ekQwVUxDTlNCbWhhZG9zOVlIS0dlZVZmVnMrOHFFN1JLcXFiUDBs?=
 =?utf-8?B?WVZ2WkF6M0hBaTRKbDdMVTVmZGdNeHlmUTVMTUNyMnh5ODdjNUxrTkpzRm9C?=
 =?utf-8?B?cnBGa2R0b0ZtU0huNE9qTFhIaTArVzdtWE9adGVGMzZmRUwxUUM1ZTlqNmhx?=
 =?utf-8?B?d1Q5d3pSWXArUmVwa1NNaVd1czhzazU3bWd5aGYwWXpBeW44V1JCVFdPUm90?=
 =?utf-8?B?TThGd1BQa1MrdnJONHZMR3dZWFRVWjlEQ1FKWU8vTGlNZ3Jrd3pSS0M5Z2lO?=
 =?utf-8?B?QXhIUW8yUER2Mllta1BjbWptVmhCY1N1N2V0UHhSc05hU0JHT2NLU0VLUmNR?=
 =?utf-8?B?UFl6UExJQ0NyM0RLZ1BvSnJCWXpHR09aM0NNeDVTd0MxY1RBajlJMjZJaDZC?=
 =?utf-8?B?YnNGTlhjK05jZ3R0NGJKZW5KRjY5RmpaSkZXZTdVeW5EQmVzQXpGdnR0MGJa?=
 =?utf-8?B?bjM1RERWd2ppNEQ2Tllld25XaDZiZ2VkMEZDVmZVV0c1NnRBZFFWMzVPR1hz?=
 =?utf-8?B?Tm5pQWlyWjcyNUdwK3RzZDlYTkZqald6Y1MwMzNKODJ4WlVVR25XZ1AyV0tB?=
 =?utf-8?B?N2JGajU2WE1uOUg5cVExQlNyclU0WFpnajF6ZjI4ZmFwazdrcTJSZDdTSVVT?=
 =?utf-8?B?cjJtQkZtZjVRTWRVM0g1c0pzbDF4SGZ3dXJYS05hTHg2b2xRcS8zQmdYeWZq?=
 =?utf-8?B?SFUvVnBDQUNmR1cvOFBKYW0ydDB6d2NxeEJXMHJvUDdGR3Z5MmRYMlZhTDJO?=
 =?utf-8?B?eURpVlJhaWg5WUhPQkxrNnlYTG9rMjBLdzBnd0N5MFdTZ0xsa2RwNUpFQTBO?=
 =?utf-8?B?NklodUs4THIrTUM3YWNRSjR5c2pkNlZRVURXTmRMUzFKeHZCZFlMSVV1R1ZS?=
 =?utf-8?B?bGQrL21sZzgwSTZrRVR3cjZBOTJVN0xpYlNqbCs4WkZ5Ukp0cWh5SGk1RTl0?=
 =?utf-8?B?UXd6VXZ2Smo0T01TeGN4Z3gvelo4SEFaMFVmRTBsbjdrMkIyWkZPT1ZDRE43?=
 =?utf-8?B?c3QvYXRUMTVKR0l1UHlJWmRDcEJRcVR5Z0p5WTBEN1NVbFlDQkNGSkVmaWJk?=
 =?utf-8?B?dE5IWUM2V0RQZWVFYlZ2SUNYSmdNQk5JS2MzVkVBUFhKUzRBY2R1cXJmSFVC?=
 =?utf-8?B?R3pSVlYxSEI0YVNaUzlGWTZwelF2NlV0ZEo2UHhvVk1JV0p6eGtRakxrY2p0?=
 =?utf-8?Q?P8aLAsCRBG4PUO7Rh4WhXISzA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a6276a-7768-4227-8ef1-08da5993fb06
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 05:55:33.3859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xYN5PpbcjFNFtbdBHIFybh2X0s+rtZwMemT5RbvQkWZrvREP8qQai34tR15lFca9P2xrp90klhifagOaaAeNzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB2963

On 29.06.2022 05:12, Penny Zheng wrote:
> Hi Julien and Jan
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Monday, June 27, 2022 6:19 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; Jan Beulich <jbeulich@suse.com>
>> Cc: Wei Chen <Wei.Chen@arm.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>;
>> Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v7 7/9] xen/arm: unpopulate memory when domain is
>> static
>>
>>
>>
>> On 27/06/2022 11:03, Penny Zheng wrote:
>>> Hi jan
>>>
>>>> -----Original Message-----
>>> put_static_pages, that is, adding pages to the reserved list, is only
>>> for freeing static pages on runtime. In static page initialization
>>> stage, I also use free_statimem_pages, and in which stage, I think the
>>> domain has not been constructed at all. So I prefer the freeing of
>>> staticmem pages is split into two parts: free_staticmem_pages and
>>> put_static_pages
>>
>> AFAIU, all the pages would have to be allocated via
>> acquire_domstatic_pages(). This call requires the domain to be allocated and
>> setup for handling memory.
>>
>> Therefore, I think the split is unnecessary. This would also have the
>> advantage to remove one loop. Admittly, this is not important when the
>> order 0, but it would become a problem for larger order (you may have to
>> pull the struct page_info multiple time in the cache).
>>
> 
> How about this:
> I create a new func free_domstatic_page, and it will be like:
> "
> static void free_domstatic_page(struct domain *d, struct page_info *page)
> {
>     unsigned int i;
>     bool need_scrub;
> 
>     /* NB. May recursively lock from relinquish_memory(). */
>     spin_lock_recursive(&d->page_alloc_lock);
> 
>     arch_free_heap_page(d, page);
> 
>     /*
>      * Normally we expect a domain to clear pages before freeing them,
>      * if it cares about the secrecy of their contents. However, after
>      * a domain has died we assume responsibility for erasure. We do
>      * scrub regardless if option scrub_domheap is set.
>      */
>     need_scrub = d->is_dying || scrub_debug || opt_scrub_domheap;
> 
>     free_staticmem_pages(page, 1, need_scrub);
> 
>     /* Add page on the resv_page_list *after* it has been freed. */
>     put_static_page(d, page);
> 
>     drop_dom_ref = !domain_adjust_tot_pages(d, -1);
> 
>     spin_unlock_recursive(&d->page_alloc_lock);
> 
>     if ( drop_dom_ref )
>         put_domain(d);
> }
> "
> 
> In free_domheap_pages, we just call free_domstatic_page:
> 
> "
> @@ -2430,6 +2430,9 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
> 
>      ASSERT_ALLOC_CONTEXT();
> 
> +    if ( unlikely(pg->count_info & PGC_static) )
> +        return free_domstatic_page(d, pg);
> +
>      if ( unlikely(is_xen_heap_page(pg)) )
>      {
>          /* NB. May recursively lock from relinquish_memory(). */
> @@ -2673,6 +2676,38 @@ void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> "
> 
> Then the split could be avoided and we could save the loop as much as possible.
> Any suggestion? 

Looks reasonable at the first glance (will need to see it in proper
context for a final opinion), provided e.g. Xen heap pages can never
be static.

Jan

