Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705014D3158
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 15:59:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287916.488227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRxm6-0002Tj-O8; Wed, 09 Mar 2022 14:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287916.488227; Wed, 09 Mar 2022 14:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRxm6-0002QG-KG; Wed, 09 Mar 2022 14:58:50 +0000
Received: by outflank-mailman (input) for mailman id 287916;
 Wed, 09 Mar 2022 14:58:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRxm5-0002E2-KA
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 14:58:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cc8dd8a-9fb9-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 15:58:48 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-vdhhtt3QNFmst6Swu22opA-1; Wed, 09 Mar 2022 15:58:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB9140.eurprd04.prod.outlook.com (2603:10a6:102:22f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 14:58:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 14:58:45 +0000
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
X-Inumbo-ID: 6cc8dd8a-9fb9-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646837928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2DDYZ1HkK7B0NjXMi72+t7QXaFJlZEG9PQd31XCZQ2Y=;
	b=c7M+HrIJxPBl/0Yn3UTdzsXWRd5LdppeWk1+ySQTryaTj9t0P62Q6zkUwi+XoefHjXo1e1
	9Z3OuJ1XEErdsWuGq/R+llhcN8P9XwCTBcTQl1Dy+lQNfRtUODWUlHLkncK4ZEfLeyPiSl
	Y0vtnBPolLUp5/VHxC/X40e6ovlTWOg=
X-MC-Unique: vdhhtt3QNFmst6Swu22opA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDY1vvFG9ggq0m5hdGKvmjNSctthLR/PuUmv+3icxVxXMIAW9jgqWdFCsLGgQnPoStFHuTNz3dN6zVP6TIlfmUbeVsRY9Zcw7eP2b8D180Y6nP7UkYTb7L3TeEy8rFiByCM1wy8jWz9rzUg3OtYUUuqiI7ofy9/un+9QZe4h+OeAnfip+oUrvVc8PKCO+/GCgD+9Pfcj9WySOcRenTvMZWaZ/mFWhEaetGHA4Cd+uqzPuOo7L5xMx+L77jr+myqsiuVyCKZYg1ityi6ywTFyx9QuUNkTQAKlKHkeRXlEuqxZ+GGSq2up4iHtu0+xIHhlCGqAQcPKQSV79ddLAlA7Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DDYZ1HkK7B0NjXMi72+t7QXaFJlZEG9PQd31XCZQ2Y=;
 b=Z4wF0S7WiHFbjdIMAN7jEcPrTUgiz1lT+chieXngBGtPXP/NK5AH7xbBd986wLxjHOpGhcv9COemBZeT98EwtrlY6SBxh0jQExrPaUsuDpYU9MJvzi8RTCruuJE6ezKzFwnh/jW2cCsBeQ+8/HsFkpDV1Q9oLiUdVfrkpNp0kCZYGH69XLx9EWTwtShBV97DmNtglxqYxBNjIW/iyFgH9ihOZs/OaaSw6ITr20b5hkoynRT+NBjqTUG8PrPDqhJTQ9GI1tCkfD8jpcUy1WLpeRs7HXlXrzcYLCMnoqSsGJO7LlmzoWD20c5u70KICxXPLHTqzp76gMppFXtPfvsUdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7f28f72b-291a-2b1c-c3fe-1c4bc882a203@suse.com>
Date: Wed, 9 Mar 2022 15:58:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 21/36] xen/common: add colored allocator initialization
Content-Language: en-US
To: Marco Solieri <marco.solieri@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>, Luca Miccio <206497@studenti.unimore.it>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-22-marco.solieri@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220304174701.1453977-22-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0058.eurprd06.prod.outlook.com
 (2603:10a6:206::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 794af318-4aa4-4ced-e794-08da01dd4ede
X-MS-TrafficTypeDiagnostic: PAXPR04MB9140:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB9140CE64F3267F65AA19FEA8B30A9@PAXPR04MB9140.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nVkhP6Ji0wha1jttfMaebuYfahNLTI0irkznGpNM2WyrXmW3sjjctx/ePtJmu1jaboz56QL5ZHJWXmddID0ekHsXdB96GO7Lmk+CPfi1BCMxILv0I0qg5LZzgyXawyUN1MzJamiN20BQlyJLPd+J5MwuEn/Q+Ib0/1J0myN5i7GeV4ynpv0W1sLaXXsL+AzIGaec5dm9pdGYU6Ey9LqumyV6ON7e/i0VkQ4pFH0aXWTbaoH01h0vimt/xNa+dw9H5GDKAABiz0i3Li26CVwRB2AQh2mhyJcHK1FnbMxuwUfQOqRHqElnCqPm7QTXKOSUSd5X8FcpbAZcNfEQQyoxrJiVhwASmotgbrVh3HwMyyQqmVltRGr7uNB1CYXLI/AUMLGaJ8pOk6WOAOtXmxZ3hYPZmRUpyboLfNRqJOrUWI9cCVRvUFa1fuVZWZ6undswSLskYX6lZi3gNmh3LcxznLGRqaCtoT6+rGWRda5VokwZvqCvTOlGuCLQxoBPuKvBAsdYPw56GpK4rivkXnfIF0QWIdtKUnX8VVfH4qbURGINJKlRh68cOpUvFhXqo6lcllCUK7FhIe+kAGUje1T7ltHWNE5ZMLexGgwSrDh0jy8D4iV/arCG38hO8CxymInFiF3W+jQokb1sm+0HHlTBv9HySYDwqrVIl4oVkb+WnO2MuQUIl2VZ2B1oR2S0k1UBSg4JhhwmydV5SmPylhQnID+SQwtY3QifLVHCBK558ne9LCu6QhmQmy0aLGl1/pFe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(38100700002)(6916009)(66946007)(31696002)(8936002)(5660300002)(86362001)(2906002)(316002)(8676002)(4326008)(54906003)(66556008)(6666004)(31686004)(6512007)(7416002)(53546011)(6506007)(36756003)(83380400001)(186003)(6486002)(26005)(508600001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nk9RcnZaSG5saUM1T1NrMFRHd3kxNmYyRU1WWUY4MG82NWJ0T2I1QTg5d3M1?=
 =?utf-8?B?bkwxRWhFZzRFdlJ5K1dzaEsyWFlXZlNEb2gyeEVVajc1R3ZkZEpHUzR1NlVO?=
 =?utf-8?B?U1l4Q3NkUisvZ3Q4WklqZFJSVlIxYmNSdE9SVDJTY3M5ZVpUZlZwSGdFR3dN?=
 =?utf-8?B?RHZHOVhEcWRaMGNLcm1FR1p0bE5MQm0ySWxZcUxWWkQ5a3hzajEyeVZKOS9Y?=
 =?utf-8?B?NjJocWhZUzU0N1k0RXZLUlQrbjV6ckNDUTdRaUhKMHVKOHlVMUNaUVJnYUN6?=
 =?utf-8?B?YVFrZ3ZGQlRxOE1udVdoeXovVHg4bEdNY1FjM0dKNSs4VUdOT2FvNllROVJF?=
 =?utf-8?B?YUY1aUNna1ZhRSthem04NHhodDVsbWlMUnRMUGVySXVRaGEvOG1BVURTdW83?=
 =?utf-8?B?MGh0dDFBdlpScm5LbzhVYVdLVDM0R0ZsQzZSbk42TUphalM5bU8vbUZ5KzFO?=
 =?utf-8?B?R2pjUHQwNFNDZEwrbmFCK3BxMjdkcTI4eGtjZEdXWGJ0ZWpOSkNTMjI3UkRM?=
 =?utf-8?B?WGtHK1VGRWdPb3RiVFhNWFpWTTdzVE1FYy9rWHpwdnU1TnFxbkN6TEo5VkRi?=
 =?utf-8?B?ZWZUdG9IbTl4WWlWQ3hTeStxVVo4ekhuSmlTTm9hZG1WZ0ZYRUtRTys2a281?=
 =?utf-8?B?WUllUDdHQTFRcWJPRmM5RzE3SklNdVEyNnF4ZXBwbU9VamloQVVKWFVHcnh1?=
 =?utf-8?B?Szl5eVE1bGpaTVVCRTdRYkdJOWdXUUt4ZzlrVWxaSU5JYzBWRzNISzljUUt0?=
 =?utf-8?B?VVo5YzhxRHFUK1BPNEN0NUpvSFdtVWpXOHpXbWlIM1JmK3NJYVRIb1BsWmhW?=
 =?utf-8?B?TWQyRjFFblh2eUs0M2JCRUpRSmx6dExxbkxmaWhsc0s4MFRLcEYvVEtFQXlP?=
 =?utf-8?B?WUgrOStQaHMxZWh1QXkvcmdFemhWTHVtUjIwUVVoMlNYaG5WdlNuQ2J6dFE4?=
 =?utf-8?B?and3UG1ReHM0YThGdXkrQ0p4M1QzYlNoV2ZWVnFjWm9VYjdSTG9sdnYyQVp5?=
 =?utf-8?B?OVNkU3BNc3Z4a1dMNk5yMXRXN0JESHJpUlpvNHA4VEVrN1RENHh0NVZ3Z256?=
 =?utf-8?B?aXBUSTc0VGw4OGJLMDBMU0hqY1Q3T01JSC9jenJlWnYzT2E0QU1ldTBPK1oy?=
 =?utf-8?B?OHFXOFo0T21qVUVjVEJwRTRmSDVmVDI0ZnV1amhNYW1yUWNFL3FuQWYyMnNM?=
 =?utf-8?B?ZlllU2pkQU0xcWdnQUhxd1BZODAyd1hScFNETkVOK0k2dVZwK2RJRjhKRFFJ?=
 =?utf-8?B?L3ZoN2NaMUZ0VktVVzA2Sy9QSVNScGE2b0FnL0ZHTXlZMkhLTDJZL1VBREZE?=
 =?utf-8?B?MHZUYy9uaVBkMTVkQS9PcVZyRFd1eXVXRXNKSXFVdy9PTHRFQlBVZDJBWVNE?=
 =?utf-8?B?Z3FvOWpXdm9OUjdkeU1WY0NVam5oTldQOWMrRlB2ZWFZVzA1RTdQNzg1WHRB?=
 =?utf-8?B?OXRWdjh0NXoydzN3MTQ0V3Fqa3p2TUkxa2dyTXkzWUhLUmxxb2ozekZBMG0y?=
 =?utf-8?B?MDZWMklNekpOWUcvN29xM1lJcEtMMVZ5eEp1cjF3V2Ixclg1eUNwV2VBTHVv?=
 =?utf-8?B?MFVTWXcrdjExOVp1TStHaHc3eXhQWmVZSlNvTmtNNjdHRk5HRkkvT3BKNVJ3?=
 =?utf-8?B?WDJvSEExTVNzNjFrZ21IKzNEQ0YzOVAzTEpjam1CNDlOUWJVSDBrdGJHRXM1?=
 =?utf-8?B?V05KTFlRRzRyRit3bHhocW90Qnk5cXdPTlFNS0xDZzNzZ2lzVUlNaCtFR2FQ?=
 =?utf-8?B?WnI5akgyQTVjMHRZTWJxcUpOcHVjcDhqT3NEM3R4VXFvRFkxSVFoRmpQMzRr?=
 =?utf-8?B?NkxSZktaUS9zTXN3eGRESkpuZjVmTjV4MVN5Nzk3NDZYTStYak9nMEU0NnVS?=
 =?utf-8?B?ak9TSnh5QVRrRC9MRkFCSkRDRmNiMXFLdk1Udmt0cVVQaU9MODczYXFDZmRo?=
 =?utf-8?B?Ty9yRllzZG9vMW1LMWxVd2xuSXdmZ2VCNi8rL1FUT2ZmZnViK2tSOER4NUVp?=
 =?utf-8?B?RVNFMWlwSDk1M0FPRmx0ZEs0RXcya1NiSFJMVXFYNUNqcVo0djB5M2ZmM1U1?=
 =?utf-8?B?ZTlJV2pvSC9IeFBFcjlWR0M5ZHQzMVA0VmhFN1hoaDZRQncwb0xxdGp5Q2kz?=
 =?utf-8?B?YTFNUUpXaEFNNVhKSW8vOWpGWTZkUC8vTGhCT0hXQ0M2akp2eW9RbzU1Y1Vl?=
 =?utf-8?Q?3AmqyWf4LFOniRvmp0lWk94=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 794af318-4aa4-4ced-e794-08da01dd4ede
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 14:58:45.0540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tl7PC9hLvEj/bgOlDe/1QJsgFOH9oJzGDEbgW9pv7bc0qT+W2bkRG9HIMvqgUDrxxL6+bzAboh+nGW5RCzJi4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9140

On 04.03.2022 18:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Initialize colored heap and allocator data structures. It is assumed
> that pages are given to the init function is in ascending order.

I don't think this is a good assumption to make.

> To
> ensure that, pages are retrieved from bootmem_regions starting from the
> first one. Moreover, this allows quickly insertion of freed pages into
> the colored allocator's internal data structures -- sorted lists.

I wouldn't call insertion by linear scan "quick", to be honest.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2154,11 +2154,26 @@ void __init end_boot_allocator(void)
>              break;
>          }
>      }
> -    for ( i = nr_bootmem_regions; i-- > 0; )
> +
> +    for ( i = 0; i < nr_bootmem_regions; i++ )
>      {
>          struct bootmem_region *r = &bootmem_region_list[i];
> -        if ( r->s < r->e )
> -            init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
> +
> +        /*
> +         * Find the first region that can fill the buddy allocator memory
> +         * specified by buddy_required_size.
> +         */

Why would all of this memory need to come from a single region? And
why would any region - regardless of address - be okay?

> +        if ( buddy_required_size && (r->e - r->s) >
> +            PFN_DOWN(buddy_required_size) )

I think >= will do here?

Also - nit: Indentation.

> +        {
> +            init_heap_pages(mfn_to_page(_mfn(r->s)),
> +                PFN_DOWN(buddy_required_size));

And again - indentation.

> +            r->s += PFN_DOWN(buddy_required_size);
> +            buddy_required_size = 0;
> +        }
> +
> +        init_col_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);

Judging from this, buddy_required_size can actually be __initdata in
the previous patch. Being able to spot such is another reason to not
split patches like this.

> @@ -2619,9 +2634,12 @@ int assign_pages(
>          page_set_owner(&pg[i], d);
>          smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
>          pg[i].count_info =
> -            (pg[i].count_info & (PGC_extra | PGC_reserved)) | PGC_allocated | 1;
> +             (pg[i].count_info & (PGC_extra | PGC_reserved)) | PGC_allocated | 1;

Why the change?

> @@ -2642,6 +2660,15 @@ struct page_info *alloc_domheap_pages(
>      unsigned int bits = memflags >> _MEMF_bits, zone_hi = NR_ZONES - 1;
>      unsigned int dma_zone;
>  
> +    /* Only Dom0 and DomUs are supported for coloring */
> +    if ( d && d->max_colors > 0 )
> +    {
> +        /* Colored allocation must be done on 0 order */
> +        if (order)

Nit: Missing blanks.

> @@ -2761,8 +2788,10 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
>              scrub = 1;
>          }
>  
> -        free_heap_pages(pg, order, scrub);
> -    }
> +        if ( is_page_colored(pg) )
> +            free_col_heap_page(pg);
> +        else
> +            free_heap_pages(pg, order, scrub);}

Very interesting brace placement.

Jan


