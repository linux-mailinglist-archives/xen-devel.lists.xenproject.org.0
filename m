Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD76406A7E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 13:09:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184278.332872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOeOQ-0006uw-7C; Fri, 10 Sep 2021 11:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184278.332872; Fri, 10 Sep 2021 11:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOeOQ-0006sI-3M; Fri, 10 Sep 2021 11:08:26 +0000
Received: by outflank-mailman (input) for mailman id 184278;
 Fri, 10 Sep 2021 11:08:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FfYJ=OA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOeOO-0006sC-Cp
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 11:08:24 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e22acd82-c857-4bed-9850-3d65dd72e900;
 Fri, 10 Sep 2021 11:08:23 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-WcJUBCybPsWRGO0-TsH9WQ-1; Fri, 10 Sep 2021 13:08:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4381.eurprd04.prod.outlook.com (2603:10a6:803:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Fri, 10 Sep
 2021 11:08:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 11:08:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 11:08:18 +0000
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
X-Inumbo-ID: e22acd82-c857-4bed-9850-3d65dd72e900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631272102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U6PaK6ivapCMzL9OJchzgrN1fvV7qgqf9f/WPfBEGH0=;
	b=AM5aj5Nyvh/GP9AfbpXfz2VK983abdbzlN0NNia0yPttvZmFWVokOnnhhfKkezb/FOIo8b
	+NU8ShaLzXnU/4C9ifqR+D0D3Pj1pe/Q4V5+dXQVDZ7KvckS64AAGekISxowj9UvniDuAm
	YqI6aBGQv2k6fL7XJ44e8d5YZlqzDjk=
X-MC-Unique: WcJUBCybPsWRGO0-TsH9WQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CsBb6ve44klN8xjX5VmDG/WLTZSiQutOlvwYkjdHLMV2Bdggg+5k4Zb7MHnh0sj5sec7VijkXNyUp5lp/pl+L4R15nO717p0xsg1HCEm90IUr2mi7KuuCHxWnDso7nowHUA3oLw7/+OjPT6McjTBukP3MgQ9Yo0jKDmYd8Z75yyK9EYZESYD2gyeAykpLKO9/rLgYdbwtQJpKanixUQK6Etr7xmH2MiizDEv4Rxku/VjDwJlwx3Eb1WvqxYRftNpNbZe8jdWy2QV9SjSp4U8b8gorA2h1hu5H6+jflHUwqfxT0NKaSDURVswBKVD4U51g4kKwuluWTQwpz5Q2O+7kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=U6PaK6ivapCMzL9OJchzgrN1fvV7qgqf9f/WPfBEGH0=;
 b=GZocYwOQqKX75sI8g9iC0i2RgsxxbY0SnvlK3WQUYndhXWpuBrN5RwNU27cN3FUjEEkjm1yToAkK0vInf7WN3BwP2RaU0v9bc5VReDWz3VpUKyb3yd+fQGkzAV3D91tZnNUqw1bePjsTdRJO/hsCcr2GFiGcuRd8G7xpDwx6CklLadZlqLrWNSijadyneR7bp9q8aw2BJz23LtlL9amq2sFVxhA+2dJSSjsemjrnVBPrGGMm64CDvsQdZTdsNiOMbcb58q58CmDNt5HTpOVX6JF4mfoK0p0MN5IQRpjZW2Djn2CelgNM4lgyxebDY7ec2WZ+7CHToO2qzymWlDZqGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v7 5/7] xen: re-define assign_pages and introduce a new
 function assign_page
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210910025215.1671073-1-penny.zheng@arm.com>
 <20210910025215.1671073-6-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <acf2e43e-5db1-1374-013e-b152093b41ba@suse.com>
Date: Fri, 10 Sep 2021 13:08:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210910025215.1671073-6-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0176.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c66232eb-8728-4e6c-ed4c-08d9744b4b82
X-MS-TrafficTypeDiagnostic: VI1PR04MB4381:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43812FBC327A9DE03FCF2D97B3D69@VI1PR04MB4381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R1BVq2hMwURoCE2gsHIifSYd4LVVO+lcdlnFTWBtLezkAwUyUwa8/klqpBJ/VdTPxrtncVug+p7GYWc/oGungdjWgeyZH/fVt/Ab2JN/pJEiKftN47ALX24y3fhsD7U+/2zcYlPYxUZAhUIftd5U7z07Ihin7gwVBkxui3wMbG9WkPY3u31qkrdl7Arv6D1MVFrKaA10X+f6L82fjATlmn+SYpAomF4UXqjncRdXjqr4P7ds9WdRE6tUdyi2oD52s1t7NWATRdTDHf+BMX2KpYVDgedXOkYY2qUgkJB337fpvzQV4Q+wpsUxOCNqiPvIn/esWjQgRLvd1GqV8PnBNqevj+buGm1HAUGfv5nJYvdziVc0c2oD6k8BLEuBAey4n2cUumeqhDZlUZ7Qw1CmFII8/Gk3Z4ykhYqI335fYG6UejWG3Yb52DyhhRnVOqtor+XXymZpmCZiNODJB1oygrMovzTQWrahDUP7kc2jla1Vvp5pzf2b0nifhkrqkm9K5nflfREyfYkrA8O/PFUUWW7mYGA2ak/N9pXiEHppjAv4pAej/0kYgxjPhflbbsVXIXA5I+StFhq39dDjZFZU78/5Zebn+rQRQtPxWC/W0kkSuaW511GEUZ+AExe1c4gmWfis/fIfmH4rny4/Lk0NUk2Xkm4RvUC9uzJYOF/80PKs51Efs0CjMFX+uo9sWD8RrAAhrBe7VyFOi7kBWga/pa9MRGnV2N1tGHyJO6PD2S4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(39860400002)(396003)(136003)(366004)(53546011)(31696002)(31686004)(316002)(2906002)(38100700002)(86362001)(956004)(478600001)(16576012)(2616005)(66946007)(36756003)(83380400001)(6486002)(26005)(66556008)(66476007)(6916009)(4326008)(5660300002)(186003)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WndMRWFHVFNrTHFNZWQ5MWtpc3pUVk1zV0NwUWV4K1hEeWxGOEpqZW5BNkZq?=
 =?utf-8?B?eWRIbE5WYzNYK3dwTmZXNG4ycy9hTjRQVVlVZFI0UWZ1R2k4cU5Xd1dUaXZP?=
 =?utf-8?B?eWRHRGhHYmhmaktMQmoyYXNPUTdlRG5veitNbGZ1b09iQzZVZUVRWVZoK0gw?=
 =?utf-8?B?ZkIyRUtOcFArQlJHeXB0S0FYRjZONVhaa2JpckxCUHdETStFaHpHWEVHcHFx?=
 =?utf-8?B?NTdlNXpvVnJEZVBkOXpiUDJQSTZNUkF6Zy9vMzU5Tjhqa3NhQXNrS2Jhc1Ft?=
 =?utf-8?B?UnRiY251UjFsSTBnOHB2SWxGL1paZkpVVUt2MXA3dXAwSHhWckNldDI5VUlU?=
 =?utf-8?B?UDVNMUpuNUkyWk9IazI2eTNxVWpkMU02anRFS0x6cWJ4VW5CbVh3S08yd0l6?=
 =?utf-8?B?OEVZQktqYVRKMExLT0FkUURoNTJnTXlqbkZyN2tXUDVHR0dEOXFjREduaVpP?=
 =?utf-8?B?VnVqMEdIZEt2Wm82Q2hYckhuZHFZZ3AxUjEzcndEOUl5bzZKN2kzc0Rwd2FO?=
 =?utf-8?B?NTFWeEZCcXVsREJwUEJUVC9oalVKNGRHcW5ZeVBZTXQ2UjlONExGVllxR3BV?=
 =?utf-8?B?MEdBR25YQXpBTytDSDh3SmtNd2VMdzdwMGJabWFKbXdacTVqV2RRQTdBekFC?=
 =?utf-8?B?QmtyRjJVS0JMYnU4UlF5NWNsUkY2dkZEM3BCRDI0RG53ZFFmTkdxOWlOSXpS?=
 =?utf-8?B?dUdnZHpVN21oVUJab1hwaGxtVEdBYTZjekJWU0tCTnEwc2VSTUVlYkhvSWZx?=
 =?utf-8?B?Q2d1Z082VS9NYlJ2RXRNRE1NdmhWSHM0d05xZVlFUnhLZlBFdWNDeFVZVHpq?=
 =?utf-8?B?UzNNellGaUViajRkRC9MSVliSGs2VmM4NDc3M0daQytLQ2xhNjJQYnR3M3la?=
 =?utf-8?B?QjdLbFB0Y2drT1lwaWZBaUwwM1M3M0hSdGI0cU1SZGZad3A5QUhCa2hEczZE?=
 =?utf-8?B?V3pKMU4rNzUvMGEwT0dqSFBmdkxndW13ZHBNTjY4MTRFMW1md1l0ZlBKRHRq?=
 =?utf-8?B?ZWVSMCthd3FYSUlHcE93MzF4UTVwRGN1aXVGYndEYlZwVVVJM2o4blBTeVFF?=
 =?utf-8?B?TjgzZk9pMGJsNzYveXNCVERyNWtNRktHblR5eFRjYWFISDZ3ZS80N3pyNXlt?=
 =?utf-8?B?L3cxTmRra21BSC9ZcFZVN3A4bDArWVZOVk5DSWRKYXJLYUowN2haSThPcU5O?=
 =?utf-8?B?Q05NeC9mVGlKaU1HeUtOUzF3TW5YcC9lUTZqZGl2Q3RzWmthUkNicHJMWlpq?=
 =?utf-8?B?RmZMNm91V091Ty9yQU9JcDVrT2RyWm5QbkZ4Mzlsai9VdGd6alBad3ZWZGw4?=
 =?utf-8?B?RytKTEZhLzRXbkpoZ05JWElOOCtEMG5KSXB5bkdseXFObExuRHR4VGlEU0FE?=
 =?utf-8?B?QWdtVjEwMjlWL0wxUUZZRFA1SFZzZDFqMGRiR3c4RnB6eGJNdE5vNCsxdUN0?=
 =?utf-8?B?bEtlM1c4RFFLL2NHNzdCZHIra2wwOVFCdHUvSVNsWVhmakJiYU1ENjVNdmpV?=
 =?utf-8?B?T0YyVXhhY2lCVVVOdTYzdE4xRFlub09qc3kxNlR0MlNFUXh6eHhqZmdLQnAr?=
 =?utf-8?B?OXlldHFIM1FlZ09ydGY4VDBnUGZpN205MUE5QUxnWFc4S2FrVjhNWW0xbmFP?=
 =?utf-8?B?dGxOOHlHNnZhRFBQQmtOdE9zdDEweTEydVpySlJFZFJFYTRCM1dERU1hWUFs?=
 =?utf-8?B?WnFhNEc3dWtacVFNVWVRUUJnT1FFdDZ4OTllYjZOd0RwekRBcWJtS2E2NEgr?=
 =?utf-8?Q?/cZmxQXmgIyGh/9j/YEWfiukJ+llzltHd4kBHh8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c66232eb-8728-4e6c-ed4c-08d9744b4b82
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 11:08:18.9095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMXPDzckw4CcM+ipQWghN2nPnZKBhvE+lk0hBVnVH4Mq8xMeUT/XR/fuPzNZ5TYojASrexqcWJg8valkk/y3ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4381

On 10.09.2021 04:52, Penny Zheng wrote:
> In order to deal with the trouble of count-to-order conversion when page number
> is not in a power-of-two, this commit re-define assign_pages for nr pages and
> assign_page for original page with a single order.
> 
> Backporting confusion could be helped by altering the order of assign_pages
> parameters, such that the compiler would point out that adjustments at call
> sites are needed.

Thanks, this now takes care of my primary concern. However, I (now?) have
another (I thought I would have mentioned this before):

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2259,9 +2259,9 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
>  
>  
>  int assign_pages(
> -    struct domain *d,
>      struct page_info *pg,
> -    unsigned int order,
> +    unsigned long nr,

If this really is to be "unsigned long" (and not "unsigned int"), then...

> @@ -2281,7 +2281,7 @@ int assign_pages(
>      {
>          unsigned int extra_pages = 0;
>  
> -        for ( i = 0; i < (1ul << order); i++ )
> +        for ( i = 0; i < nr; i++ )

... you will want to (a) show that there is a need for this in the
remaining patches of this series and (b) prove that despite the
remaining patches potentially using this, albeit at boot/init time
only, there isn't any problem from ending up with 4 billion (or
more) iteration loops that would then result. On x86 at least I'm
sure this would be an issue.

Otherwise I would request that in the subsequent patches requests
be suitably broken up, with process_pending_softirqs() invoked
in between. Which would get me back to my feeling that the original
assign_pages() is quite good enough, as your new code would need to
split requests now anyway (and to avoid the need for that splitting
was the primary argument in favor of the change here).

> @@ -2290,18 +2290,18 @@ int assign_pages(
>  
>          ASSERT(!extra_pages ||
>                 ((memflags & MEMF_no_refcount) &&
> -                extra_pages == 1u << order));
> +                extra_pages == nr));
>      }
>  #endif
>  
>      if ( pg[0].count_info & PGC_extra )
>      {
> -        d->extra_pages += 1u << order;
> +        d->extra_pages += nr;
>          memflags &= ~MEMF_no_refcount;
>      }
>      else if ( !(memflags & MEMF_no_refcount) )
>      {
> -        unsigned int tot_pages = domain_tot_pages(d) + (1 << order);
> +        unsigned int tot_pages = domain_tot_pages(d) + nr;
>  
>          if ( unlikely(tot_pages > d->max_pages) )
>          {
> @@ -2313,10 +2313,10 @@ int assign_pages(
>      }
>  
>      if ( !(memflags & MEMF_no_refcount) &&
> -         unlikely(domain_adjust_tot_pages(d, 1 << order) == (1 << order)) )
> +         unlikely(domain_adjust_tot_pages(d, nr) == nr) )
>          get_knownalive_domain(d);
>  
> -    for ( i = 0; i < (1 << order); i++ )
> +    for ( i = 0; i < nr; i++ )
>      {
>          ASSERT(page_get_owner(&pg[i]) == NULL);
>          page_set_owner(&pg[i], d);
> @@ -2331,6 +2331,11 @@ int assign_pages(
>      return rc;
>  }
>  
> +int assign_page(struct page_info *pg, unsigned int order, struct domain *d,
> +                unsigned int memflags)
> +{
> +    return assign_pages(pg, 1UL << order, d, memflags);
> +}
>  
>  struct page_info *alloc_domheap_pages(
>      struct domain *d, unsigned int order, unsigned int memflags)
> @@ -2373,7 +2378,7 @@ struct page_info *alloc_domheap_pages(
>                  pg[i].count_info = PGC_extra;
>              }
>          }
> -        if ( assign_pages(d, pg, order, memflags) )
> +        if ( assign_page(pg, order, d, memflags) )

Note that here, for example, order is necessarily no larger than
MAX_ORDER.

Jan


