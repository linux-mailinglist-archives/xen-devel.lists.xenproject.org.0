Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD3F40C34A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 12:06:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187443.336303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQRo2-0001Db-Re; Wed, 15 Sep 2021 10:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187443.336303; Wed, 15 Sep 2021 10:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQRo2-0001BI-OR; Wed, 15 Sep 2021 10:06:18 +0000
Received: by outflank-mailman (input) for mailman id 187443;
 Wed, 15 Sep 2021 10:06:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQRo1-0001BC-J5
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 10:06:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90347723-160c-11ec-b4f5-12813bfff9fa;
 Wed, 15 Sep 2021 10:06:16 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2053.outbound.protection.outlook.com [104.47.0.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-cZJSWAaCMu2gAYE6nDkJEw-1; Wed, 15 Sep 2021 12:06:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 10:06:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 10:06:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0091.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 10:06:10 +0000
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
X-Inumbo-ID: 90347723-160c-11ec-b4f5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631700375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4q+qC6paFk7/bef8SZIkopLvKrBsYyd+6Xvwu8ov/lg=;
	b=iyszW3yaiKanrePj2IAPaqCE+WWIEforvGk+9U4YCdqXo0sAV/LneFCVXg/MaoYT0u7SQe
	c70Ji8ZD5NhXM9DLnlJFAm3o/yi4HIf1nDZKLaozUZux76Ms0ITlvXOD9tomBxM7bMaNv9
	KHL0ju7M0/DzfZ+SBPHLFR6Lp2ScS/I=
X-MC-Unique: cZJSWAaCMu2gAYE6nDkJEw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrCeiHYwwCeRVy3hZNIIj0k+45s1N+JwBRym8JqNaB37Rb9o6dCDwC0wn9RDi430VkHxkppCT3Cg1ScO48c3bSFIs4RYyC1KQhGhyMvZG7clmevQwj1Z7RKGXLPCYA2dszop7tPu8IfzLhrVLMuNqhKObBE5G1aW9C6EzwbokntdHnM+S4lrllJXENGrQvqNv8Ag1jqdfio8N0hSH1cYNq1iNA5g89r5tTEgwKM7cLg3j+Q7MgYHxoN3XEUmMp6KKjFOlU08zoYHCEjRFUdLbASt/5wP8/RnT/c8vhj5WIqMb5EeKmBXOcNEU7wk5tyZGBXP1zKWbNljvnGap80xgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4q+qC6paFk7/bef8SZIkopLvKrBsYyd+6Xvwu8ov/lg=;
 b=HixSVFkmjkvxm5FqD6qfsh5oAN1vvq5k+s8KfDyi5wbUZijs9E7J7fXpaxHDTcxWAYRDSiWb54rhctzxsLTdGu+nEWN1MuwyJz3XFvdvZbOQ88DLSS3IqmFYbQ3Nf3b1D7Onw5EVGzWvUSH3qWRv5ahED52y3eqxysZljjUkUeP2iIpcYAA8qUL75vFyesrMFOBI1WabljbhUfC7nc3XOXN6qhhUaspTOXb5J0lIEz1cCCJO+9KoiLdFQY6Dbsv/fF5oOCF1WXaCYrSzm7SODXDLL9gC+sLGWLbVzln8PA7WsvDAaOanePJozVm5jzJeELUIxFwyw/yJXg9dgk3heQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [RFC PATCH V2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <1631652245-30746-1-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b6744333-4d43-ef24-0f9b-b5cd54680660@suse.com>
Date: Wed, 15 Sep 2021 12:06:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1631652245-30746-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0091.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecb48d85-4a34-4b8e-6e4b-08d9783071c5
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB715297E410A35B94ED708EFEB3DB9@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wYGEIuOAHypYyZN9S7cDbfCsJDYlhazQJmRhxw/LvkxaWjjC22BzoKIPnzBsBE/civkhz+CQwapiS9zZfZt86UbcixLWaElo3JmkFFe3W7jw/Q2Ij5RlWupOE2byo9HTeK/SjfEvWX2Kh/rzX9vq01mxA69gxhwgc011JhljCjHBdnwwsXmNRsCCtQZZbTSvq5m0tCfH7JsS7p2zJJMCqbQe+3Q5ku0yc/Fxgfk3HS3iz+8Ki31gZ42TJxPjgDzsFbqrAOlDa/Tiw4vZWF4Eob1eOBwygkyPV8SAHg2mbPHc+lvw4hf+N/xbCbYmtS3OYpmNpF6sBW0UKalhoppcF2+WEXYcVvzVWvZfgvt+yOWnhYALQAGkHoz3Ck2z9Nw3oTwS2FEjm3Iir2F7HGIdIIin1UkQP9yrsF6Wl0lN5GE0FEn79RJ6gJFkPbCj9zax8zB8SljCCSK2Mok/JnameZQkDWyJ84kTiUolpOY3FFUrVkaqzdfB9qkD95T40w5JbyLttPZRBHig8VsMHUcNlZ78VdPinMpXMcMT1df/ZQr7trqunb3GYsEHxPw3sG54MNvx8Mh8NS8kD9eu5EXVfAQLlxI/QdO+IOmUFOGErko8fR7zMoObu0yZc5zCAIFxCikwfdpC8sa8Eg3VjFq/e3Xj43lJMiABY7x7UftaDVkOYLu64UQhWpsBNnR22iBQhbirEVNeXpzETphhEl3MDwKKUs1Ah9+srnnQaw4M2k7p4RtyWSsw1ht/EqwcKEfH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(366004)(376002)(136003)(346002)(5660300002)(4326008)(86362001)(83380400001)(8676002)(956004)(66476007)(54906003)(316002)(16576012)(66946007)(2616005)(66556008)(7416002)(36756003)(6486002)(53546011)(26005)(38100700002)(31686004)(31696002)(6916009)(2906002)(478600001)(186003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUQvVUlLRlBuMTdlRUk1U2hlRnlDajliTTNNeXNwT2ltVXZpdUpLUlZtc2R0?=
 =?utf-8?B?cnVtZlBiYnIwN0JTRnh3Y0pScGsvUk1xMGRQZCtaK1NDZ0NQVk5WcEUvK0JD?=
 =?utf-8?B?WWRhWWtnM2hZSzBwMXVMaUpXdFE5Q2JJY2FoZENpTGNYM01jL25WWkNmZCtR?=
 =?utf-8?B?aUZKMTF6WUk4ZEFDamZpT2hpSHVUQmdWTWxRS05CRnJpa00rUyt1bUxXZVkx?=
 =?utf-8?B?d2ZWYlpCSURCLzBTN2IwTE5nT1lZTmNub1ZIRURsdlc0YjdUMTVTVXFxTkNE?=
 =?utf-8?B?STV2MWsrTnpYQ0V0dU12Q1pmTVFkNEtFaXlXdG0rMlRWeUxrcDJxbmJBY2pS?=
 =?utf-8?B?RW1lV1MyWGNNMXdNL0FIbThaUFN4WjA3Mm5pZjZLdmdhZ0UrNzFhVnBYcGVa?=
 =?utf-8?B?YzFBdDFUaXFBb3FXWmlRVVZRdHNXbmVuamwrNkJjVHpkNEpPcy9MTzNjaWdZ?=
 =?utf-8?B?YVBwdE40Q213bkROZmUvR09VZ0Z0U1BXZHhXb1JOQnlycVkxUWhocGlidnVx?=
 =?utf-8?B?d2FYT1pzRkdxZkc3R3l4K1pMSUZBQ2pwb1gwZVduVTZqUE44ZkdmdDIxZFpE?=
 =?utf-8?B?YmplQ2p4cEpXcklla1cxZ1BSVFdPaTgxVlI0RU1KQ0tPUU1EK2w2N3ZhWElS?=
 =?utf-8?B?N0o4MHBjckk5REFJU1FBVmFacG00bFpwNERYeEhFb3RmYmozcGhndU5EeW10?=
 =?utf-8?B?KzJsVWpLWUZFZVdMaDlOZitZeUk1ZFg5ZkIrb3IyUHVZcFNaMHZmQ3UvT0Jz?=
 =?utf-8?B?WlkweE53WU1FOEdtWHdjZ05uZWptc2RadXlqcm1SenQ0SHdYeDJmaUhJK0hG?=
 =?utf-8?B?eTMyNElyaE5CNW4wY2JpbkptSXNmMXhjaDVzYlFZV3NNZHpiTE1WUlFOVFcw?=
 =?utf-8?B?S0pZUVI4eVBNU0VWRk1Kd2FZNjQybU1mWHVDU0pjZGlNVDZQNnFoOWpIVGVu?=
 =?utf-8?B?ODU4S1QxZzB4SnZzUEpyZjZSZG1JQXNkYWZhTko2bWY0cFhzM3ZsaXVzUlN5?=
 =?utf-8?B?RytWbFRkd2RFdCtkRmVublBxbEdlSWZXczd4cytLa2FyU1hraGNzWlN3OHI5?=
 =?utf-8?B?N2RzWDZubmg0bHlReFhRQVBVL3lKTDQ4QWw2Rkh0QjdOZWNkTXBHQWRBQjh2?=
 =?utf-8?B?WktmQisxejZhR3NBMVFQUjVubk9RRERSYUtvQmFTd1lUOVdQZ0dLK1dIYTNG?=
 =?utf-8?B?RW0rMktXMFRONERTVmU2TEYyTXRNdUFGaEZWWlFwcjV4YmErSlZXQmYzcisw?=
 =?utf-8?B?UVd4TVF3VXNrVlMyMUVmYkJudFBVZGY0bllHTDEvOExYZmdwSVY3MFcyMHFU?=
 =?utf-8?B?MWFDdFk0VjVFVU5wOFAyY0pUZVIzbUp1WDA3b0FyZFlsNEZmVEprZldrSzVk?=
 =?utf-8?B?OUZ6cnBHaUV0cXA4aFVTOEljWjRCczlaTmozZGlZdkc1bG96aHN0c3pwV0Ux?=
 =?utf-8?B?Zy94SHBVVU14SEprSTFrRmo0WEhWUlFjc3daN0xITkx5S2JycUN5a2ZsWk1a?=
 =?utf-8?B?RThxcnQwOXhpeGVPU0Y2Zm05bjdZS3N0YWdEL0Y2RDM4bkIrMU1mMjNiZjhO?=
 =?utf-8?B?N25DV3hGb05CZ3RjRnpMWkFTUktXdTVPRTVNUWhyZG5PR0xlNS9jM1h0M25Y?=
 =?utf-8?B?UlJ4dS9lWFZoMjJEOWRvYUNaM3ZNQjY3UjlYRTFybG9RbG9VT1A2SE50MTFs?=
 =?utf-8?B?QTFVbThNalV0OWxJSk82R3RyTW84Uy9XczB4Ym43b0h6ZEtJUTNHbVB0STVD?=
 =?utf-8?Q?pUGH+Wv0FmSMHt7fP6H0bcHqAn+LGZ7bIjfimPN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb48d85-4a34-4b8e-6e4b-08d9783071c5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 10:06:11.3032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2d1g9fU3hSml/FVQVfYR9mRMMev1FAzPmIprzMI3kEzIAcRMMlFK7vmskE568GvHupo27advKCMsKoSGsJuCyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 14.09.2021 22:44, Oleksandr Tyshchenko wrote:
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1376,14 +1376,18 @@ unsigned long domain_get_maximum_gpfn(struct domain *d)
>  void share_xen_page_with_guest(struct page_info *page, struct domain *d,
>                                 enum XENSHARE_flags flags)
>  {
> +    unsigned long type_info;
> +
>      if ( page_get_owner(page) == d )
>          return;
>  
>      spin_lock(&d->page_alloc_lock);
>  
>      /* The incremented type count pins as writable or read-only. */
> -    page->u.inuse.type_info =
> -        (flags == SHARE_ro ? PGT_none : PGT_writable_page) | 1;
> +    type_info = page->u.inuse.type_info & ~(PGT_type_mask | PGT_count_mask);
> +    page->u.inuse.type_info = type_info |
> +        (flags == SHARE_ro ? PGT_none : PGT_writable_page) |
> +        (1UL << PGT_count_base);

Just as a note: If this was x86 code, I'd request the redundant
PGT_count_base to be dropped. Constructs like the above is what we
have MASK_INSR() for.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2204,7 +2204,10 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>          return NULL;
>  
>      for ( i = 0; i < (1u << order); i++ )
> +    {
>          pg[i].count_info |= PGC_xen_heap;
> +        arch_alloc_xenheap_page(&pg[i]);
> +    }
>  
>      return page_to_virt(pg);
>  }
> @@ -2222,7 +2225,10 @@ void free_xenheap_pages(void *v, unsigned int order)
>      pg = virt_to_page(v);
>  
>      for ( i = 0; i < (1u << order); i++ )
> +    {
>          pg[i].count_info &= ~PGC_xen_heap;
> +        arch_free_xenheap_page(&pg[i]);
> +    }
>  
>      free_heap_pages(pg, order, true);
>  }

You look to only be adjusting the !SEPARATE_XENHEAP instances of the
functions. Isn't 32-bit Arm using SEPARATE_XENHEAP?

> --- a/xen/include/asm-arm/mm.h
> +++ b/xen/include/asm-arm/mm.h
> @@ -98,9 +98,18 @@ struct page_info
>  #define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
>  #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
>  
> - /* Count of uses of this frame as its current type. */
> -#define PGT_count_width   PG_shift(2)
> -#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
> + /* 3-bit count of uses of this frame as its current type. */
> +#define PGT_count_base    PG_shift(4)
> +#define PGT_count_mask    PG_mask(7, 4)
> +
> +/*
> + * Stored in bits [27:0] or [59:0] GFN if page is used for grant table frame.

I don't know enough Arm details to tell whether this is properly
one bit more than the maximum number of physical address bits.
Without the extra bit you wouldn't be able to tell apart a
guest specified GFN matching the value of PGT_INVALID_FRAME_GFN
from an entry which was set from INVALID_GFN.

> + * This only valid for the xenheap pages.
> + */
> +#define PGT_gfn_width     PG_shift(4)
> +#define PGT_gfn_mask      ((1UL<<PGT_gfn_width)-1)

Any reason you don't use PG_mask() here? Any open-coding is prone
to people later making mistakes.

Jan


