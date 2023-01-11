Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4512665DAA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 15:24:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475398.737102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFc15-0004ZY-Op; Wed, 11 Jan 2023 14:23:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475398.737102; Wed, 11 Jan 2023 14:23:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFc15-0004X8-LP; Wed, 11 Jan 2023 14:23:47 +0000
Received: by outflank-mailman (input) for mailman id 475398;
 Wed, 11 Jan 2023 14:23:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFc14-0004X2-Cj
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 14:23:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cc1aadd-91bb-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 15:23:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7206.eurprd04.prod.outlook.com (2603:10a6:10:1a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 14:23:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 14:23:40 +0000
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
X-Inumbo-ID: 8cc1aadd-91bb-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ab+R12EWg1Mx0zro3Bc7XelMyMCLFWgn0NW+YWWn89VFL1uPSXU9yrIgsD38APfktCBcml7/8rpnjtJOPSp9Ta40ZSUJKebL0m3NgplS7NlCZ2vsSCmxnR3EUf5MX9vHgY3p2MdhC4NCsmcqMuTTfqYH8tQDeAzcxJDec0F9EAkCHPl138ytOXskmQ01VfuH0TOcU0qd4oeqaj4bSH9RI5TYYkxh+xl2crBaGrTCIbGe1GW6gj2XKaZinv7U3vmdiOtvOKJ9VBQn4iI4VzjQS/HBcsgwFlrxnjpHEAjQTPmRMkjphP3wTitrw4sBBR7TZKpCCOY9K4rGw+froheLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMBTdI2Yk2d2vY0X7k+8AX2NLn5sYOGt2PdfXWSDWsc=;
 b=Xm2+EdB1vIx1YFmR12A7vt+7xaRi2oAAKSdWGofupK066Eom+bVC3ZnHCAwEqAYLsxItB0faig7u6mtFZZ5Bn+/nObKZbN2bYoBBm1QMoCGgUShBPmKm+43XqbIx9J679NWfuDgU2yz63WM39xlhwLVxta1SAl2UG2XFihtFCsmHv6NCKKDUDdfMoAYKfOYeCgkoqy5yjOceB2mb23wfi6cqKI5eZKhYnFNLKJbRqCk/OljB8jZxid8nc8gBvmBgj1EMKJCWFHe+DwJbWPZRPlvbN/ZAnX7S9b8TLcP7FsLN1z4dxhFGpe5ChQAqPCNRGpLhJsRF+SZQSAWQeceNYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMBTdI2Yk2d2vY0X7k+8AX2NLn5sYOGt2PdfXWSDWsc=;
 b=WfwpB8t82bcuBjjGob6bqhj/rn7GVmqOjsrcqqYUWL0Wcg23TyexWaP3hyow4rGAZJSbk0mE9ZyjdZzpyg70DHQTBIlKWXdaXh3GXF38i5Zc28GTRWvmczZ7GeqtMzzHcUJoDRtlH91Y7hYbCphyyHz3nasoj4wIJZbtWDDtoJuyUIkmt0tMgR+Osb2tSYggGrMQKturG4sstC05G6q5xJ5Euww6nmXdAl4JRw8/ZEj/U80AlS45hH696oCutqqpWiDfFU/ZPOMRh4P2Uuv7jbMPdslhx3ht146Vow5V3moIKfHhXgarWCaIborx/q8intLRIqVyjkZiQ5NAN1/0zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ad82ad8-7762-8014-a55b-a6f8316f398e@suse.com>
Date: Wed, 11 Jan 2023 15:23:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 15/22] xen/page_alloc: add a path for xenheap when there
 is no direct map
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-16-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-16-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7206:EE_
X-MS-Office365-Filtering-Correlation-Id: 50cc3b31-62f9-43ea-fbf7-08daf3df6fd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z4tii7jzPiWW1LW46ete0wtS3FFa08xCKJ6G0P1nLkmJyUcUg7r019nRukBnBv8VQJJSO1tMFRdEaDoXOilk7eNa4jON50uN5+a/l3COc0537qgmEh1K/J8BXd4w3TXHOhozv79XKgzUjXNtjAAfBRts46AJE4CDqUMvwcI9PfNG8pdPreuVlZyWFfIObkTMN/0wM9l0ZqsFSoYCXLBSBK2uiJm5vm6h0camt0Wmi7KpOt8POjrnLUbmsGShJxV/8+arWL1+NfAUyccPOktMwtnS5ZKeLVB9UxUDX8DrMRhOFBv5DJMvKjzJ1Y9l1WyZ9frSbdwYuai2UWov6KFrZ3oekUVRDkVXvd/zksc/UNrQhtL5FWKT/C11v8ju5XPFJm2ys9SP2JbEAra80+DRho9qLZ07iBiEGMsst6ja996DP1TYEiu/GKEm28Yp3bjI2QcSXUQ+xQbO2pUX1fQFtya9OQ866GKc4Tf+w7vGZXtRZLsAAFzJVG4sCXVfm97ih91S43GVoiZA1kcmuOSVJSRkeMTSjhF6FPfdmBvsmDETZWH5T/cvb0NDbDlR2hGkN3MPBcyFI58OYzDri47cNlabTW9UzWlnr8JmZRNNNs/+I/xLL41tLh71SdW+HR+Z8u6zQQef44Tmee+WLlFydT8rCMjxQqnVrBG8Zk1QH4scDkMRCmcIJBwq4qbU19oz6+YuNeWAtM67yAKCAyLO3oTpJIh6OT25U9IC0xvpUqA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199015)(2906002)(83380400001)(2616005)(66556008)(66476007)(6916009)(66946007)(5660300002)(8936002)(53546011)(36756003)(186003)(26005)(6506007)(6512007)(31686004)(6486002)(478600001)(38100700002)(41300700001)(8676002)(54906003)(86362001)(316002)(4326008)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjFsMldPUTdkMjFsTWcwbStyOUxkQ3RDTmxnSE4rM25GTTNWUWlZQlk5NmVH?=
 =?utf-8?B?SUI2dm13M0ZrWEN6RVdDemt0c0o1K1R2SUZ5eGlxTnVJMjNCZEIzRmJQcmhG?=
 =?utf-8?B?NjVJTU84cm9EL3VtVDZPd3laWlVkUDNsSjJ1bE40RktabFNWTTJoQ3NOWnZn?=
 =?utf-8?B?ZU9PUkNreWhEQ0lQbSt5b1piUnQ1VSt3TEpaZ0UwblZvRTJweUdLOW9zZnB6?=
 =?utf-8?B?ckpBWnVKZ1RuWGZHN08xRVNXMGhYekpXdzJ1cGNBQWRDQWtYdU9mK05va1VP?=
 =?utf-8?B?QmRzMXo1c1Q1eGo3cXptc3B4U0tiRElhWitwTTlZK2h6Y0FkUm9rdDBycW1a?=
 =?utf-8?B?cXRwdktjOXR2ZzhFQkV0QkFWQ2tlMi9jTWFRcGxYeXZiUUQyUU1iTmlWUWo4?=
 =?utf-8?B?RVp5b1Z3K2tqdVcvMXJvYXZIN3FYNi9JMmhQYjl3VmsrTFRJQ1dGVVZJL2Rs?=
 =?utf-8?B?VEZnT3NmdnI5N0VjUXpjZlEzN0loc2pjUlZ0dVVMSFgyelpEcWpsaFVkWDNZ?=
 =?utf-8?B?Rk5kWXJOeDBVU3ZXeWRMemx1ekxKd3NvbkszVEowSUhXS1V3aTRTN3lWbUhW?=
 =?utf-8?B?NmNkQ0JGeWJ0dEh4b284d0lLNlJYdWNDb1lKT2xxVWFBZHdnNTEvcWF6SGxm?=
 =?utf-8?B?WWdvU3A3aFp0R3BaaUtzS1FkSWZHSzlXKzVNRHdHc2E2bzRKeXhmZkVjaXJq?=
 =?utf-8?B?NXpoRHplZXY4THZuUEhraml5MklnWWtrdlpPZ0FUakhOTVhQWHRIbnA4dnVu?=
 =?utf-8?B?YlJRMVp5MVNlRHpTSmxqTGVxNGk4Y0dGOWxyamZBZzVMeHpUbnhJamVlbE1E?=
 =?utf-8?B?SkZvM25EUUt2OGNHbkpxQUhuN3NoNlFDMStkbHRSN3dZeTdIczBIc0JNNmo4?=
 =?utf-8?B?ZjJ1azJEMEFERTFFWDVGdFduVVMrdHQ5U3BFTmV0SlJoeDVlZndYeGdnRmF4?=
 =?utf-8?B?Zjg5b1hmUHRnWlBROVBxWEFNTzlMQUJHMGtlR0dqR0FPMmQrejBjVDVTYTJR?=
 =?utf-8?B?T3ljUW0vVEVRQ2w2L0twUEFVZ0cyMkdTS2RGd0d6TzBYcTQ1UVh4K2RWaEI3?=
 =?utf-8?B?Sm1zRVVSekN3ZzNhcUUrblpWRjMwb0lqMXlXSHMwYkhsM0JqWktxWkhEY3Vw?=
 =?utf-8?B?QlRyNWxqRHlnejlSc2pkMlJ6a20vVVdFWjIyTEl2d3cvclJWcmZaVHA4NEVl?=
 =?utf-8?B?WmY4UEo0Ryt5amhqMk5Idzg3OEZNN21yMmdiM3ZYVC9VL04xSzYyUmh4bTk0?=
 =?utf-8?B?V3VXMjQ3MFRCVlRqVm1SQVNlYlUxVjBZTGR4Zng0dnd6a05XN1poemR5NnVI?=
 =?utf-8?B?eVZMM0R1WVR2RXBCbXVjdE5HdUxBZzFHSEh1UmErMEN5dEE5ME9JNnA0MmtE?=
 =?utf-8?B?WFoxUWdrR2VEWEhTMFlJYTAwcUY2WFQzWW9zeS9xK29JdngrNnVsOGZ5ekFn?=
 =?utf-8?B?U2pFUjJmVVNxT0VqT1lpRWVKOUxHdG8rcE1BOXlQY25sTldiN1B4aFBmKzFw?=
 =?utf-8?B?WFlLOUpLYWxKcE1GY25Wa3JsMUlrWElTT1RmZTdTOEIwRnhZQ0JoK1VNUFc5?=
 =?utf-8?B?OERaT2c2bGlIYi94ZDhmUWVhYXZZVUZWeUdsaTE5TVdNM1oxZjBWUFZmRDNL?=
 =?utf-8?B?NHVrdWk2Q0dybHY2TjFoanFxYjBMeXpmTnN3TkR1Mm1pdTNuUnNiWEVoQ1Z0?=
 =?utf-8?B?dE1EM1JEeWZZMHg3THBvaUdEdFBkMkFRSGJQLzZWUnZ2SVJSREozZDgzNTlv?=
 =?utf-8?B?SVgwZzM5M0FueDRFeFdOdVYyOC9XVWptNk8wWkF5azdmVTlzY2Rwbzc2OStL?=
 =?utf-8?B?c1ZhbC85bHkwVUs5eEVzZHRrWUI1SkljNk13ZVU0cXVYRGdZZ0l4YTlSa1Fw?=
 =?utf-8?B?RlRlYlROakRpYUFEMkJFOTBraWVDbzRxNFRmWmNsL3hLTWEydnBOSkVyY3Fu?=
 =?utf-8?B?S09ITS9ZN0UwaTgrOE5nRzBQL3Jid0ROeGtvSjArbFN3eGVQTVRRSGRMQ0Ey?=
 =?utf-8?B?YmQzdldzUk4wS3VhTXdYaTdyMzZ1di95enhjL1RMYjdabjQvZVVXbVVuRFBK?=
 =?utf-8?B?U3c4Yk9Hd3JoU05CZVdWOTUvc0Q0L2VFdHBrTEhmSTBwRFBxSXBta004REE3?=
 =?utf-8?Q?nX+Se7rwnUb4xEmDyo7w1yGNw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50cc3b31-62f9-43ea-fbf7-08daf3df6fd0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 14:23:40.6351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lqnJrlm5LhEpBeEjbR8kWb+wu4A+6UwHibyjTtL25EGkoJxA4CdGiF+Y31Hoe0fu/hueRAycvKKFB00sDu9IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7206

On 16.12.2022 12:48, Julien Grall wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> When there is not an always-mapped direct map, xenheap allocations need
> to be mapped and unmapped on-demand.

Hmm, that's still putting mappings in the directmap, which I thought we
mean to be doing away with. If that's just a temporary step, then please
say so here.

>     I have left the call to map_pages_to_xen() and destroy_xen_mappings()
>     in the split heap for now. I am not entirely convinced this is necessary
>     because in that setup only the xenheap would be always mapped and
>     this doesn't contain any guest memory (aside the grant-table).
>     So map/unmapping for every allocation seems unnecessary.

But if you're unmapping, that heap won't be "always mapped" anymore. So
why would it need mapping initially?

>     Changes since Hongyan's version:
>         * Rebase
>         * Fix indentation in alloc_xenheap_pages()

Looks like you did in one of the two instances only, as ...

> @@ -2230,17 +2231,36 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>      if ( unlikely(pg == NULL) )
>          return NULL;
>  
> +    ret = page_to_virt(pg);
> +
> +    if ( !arch_has_directmap() &&
> +         map_pages_to_xen((unsigned long)ret, page_to_mfn(pg), 1UL << order,
> +                          PAGE_HYPERVISOR) )
> +        {
> +            /* Failed to map xenheap pages. */
> +            free_heap_pages(pg, order, false);
> +            return NULL;
> +        }

... this looks wrong.

An important aspect here is that to be sure of no recursion,
map_pages_to_xen() and destroy_xen_mappings() may no longer use Xen
heap pages. May be worth saying explicitly in the description (I can't
think of a good place in code where such a comment could be put _and_
be likely to be noticed at the right point in time).

>  void free_xenheap_pages(void *v, unsigned int order)
>  {
> +    unsigned long va = (unsigned long)v & PAGE_MASK;
> +
>      ASSERT_ALLOC_CONTEXT();
>  
>      if ( v == NULL )
>          return;
>  
> +    if ( !arch_has_directmap() &&
> +         destroy_xen_mappings(va, va + (1UL << (order + PAGE_SHIFT))) )
> +        dprintk(XENLOG_WARNING,
> +                "Error while destroying xenheap mappings at %p, order %u\n",
> +                v, order);

Doesn't failure here mean (intended) security henceforth isn't guaranteed
anymore? If so, a mere dprintk() can't really be sufficient to "handle"
the error.

Jan

