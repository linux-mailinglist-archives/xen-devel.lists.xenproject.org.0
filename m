Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A5756BA4C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 15:07:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363409.593911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9ngp-0002SP-1S; Fri, 08 Jul 2022 13:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363409.593911; Fri, 08 Jul 2022 13:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9ngo-0002QD-UZ; Fri, 08 Jul 2022 13:06:34 +0000
Received: by outflank-mailman (input) for mailman id 363409;
 Fri, 08 Jul 2022 13:06:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rYmb=XN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o9ngm-0002Q7-T9
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 13:06:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2069.outbound.protection.outlook.com [40.107.22.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c874200e-febe-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 15:06:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4735.eurprd04.prod.outlook.com (2603:10a6:803:53::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 13:06:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 13:06:28 +0000
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
X-Inumbo-ID: c874200e-febe-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGQG2/TF5h0iq7jFABgcbN6ioI2mCcTWtJ5GkWGRJMeQ6GkxIrcFegOt6o7RbmwDukcN28eh4Eqq0UxoLt5Gex5O/Ix/BO7ttvL8+2zDuMxdo42xxW3zDH8YhHChsUSVVjbTkH9c3jnK4TD9cOfyd1IX0ZoW6/KVsxges5tChUrLvZaMza9/r27EZCpoBEvzud3LpCCZik25PTxgqw2MD0izSgB7BN3Ebng5/JZrQC88Ayl6oEUU/TQeQ84skzCRHP8s/BASvC9CmuXc8rlwG3jUA+aT/CjOsNMyaSBm0sM7+agTLrKfO/NrjtJaKwCwfohP/CyZTeZvIZgEO6K5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AabFokN8GS/5Jif5f7ekO232MOoTvFwR/R6Y90bjom0=;
 b=IN2vhQf7+vIJznRMuJ2XsFIjRO3eRMCyAoCTKHbKhRgIvpAeblQDCwvu2VFEV77emQrMNwV9QsJ0q1bUUEidPI3p8E0O64t0yweD9qnioBS8Cu0wUSQJiR8O7TJ2VsdGlCsIuXW5HyX26DaOqyVJ2GDCJnSdDmrpPrWFTKjYOqK+NxW8bRIlJROs8xws7Dfq4ybb3Nja+D9NmnngVk7FF+7TmLZd3Xjsek/NSF5GT2mZv2JYR47AE7glcDgo94C0lcEmlQx/iG8ycL98oDwVeYDZagqvBcoHEFQvbcxvh+D7vmgVnRkBM5PNG5MClK76eHysVXa8v8nTQG7IlodFWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AabFokN8GS/5Jif5f7ekO232MOoTvFwR/R6Y90bjom0=;
 b=IL3Qg8aRoL9DOLpHqowvf1ocG43T+TW42nKiTUgjJjvNDy/d9NzKb9rFE2bOVohfN5d/RArqER+4L3Em9IdtIq0POLJwLkjv0YIZviiqi6BWCgo1YvnioM3tBoOZ3BbdxH6a2IdYHYF77jdswEYteTi2xEWhhNWHtGtcNWZb3PBPrgx5Lor3dDyPBG72pisZBJ1ycD9aRvHYOTtoQycA6CK7k6H9m/PDzRJ5E/1qe3Sjxk+W/1ZyJFxBfgj5fsGQv/xYnLI54puQxZBVCTDXqN60IN9khIiknO+cnq646oVpUTL2g2nmL2Ep/aIxnUVB9vRB5gxWgwc75mDw/SBTFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9697f641-d660-a346-3baf-18bc8ffab717@suse.com>
Date: Fri, 8 Jul 2022 15:06:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 9/9] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220707092244.485936-1-Penny.Zheng@arm.com>
 <20220707092244.485936-10-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220707092244.485936-10-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P250CA0013.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:532::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3931627-f392-47e0-cbb1-08da60e2ab4b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4735:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+9MfoEkez1kGwskkPGYM7Ozuayfn3IImkS7V5rG9jya2V9YaTmmQx0U3NPkjzz/wKomTstZMHtjF3SHVSw4tNOVKPNX0HLBapNM+aaX93d8NLqki+U+VGaJdzIASJpyOBv6Eq1z+Xw4d5SWrT2BC+IK9iXGyVRObQ3xRr7ONfDSpLkVmjc/oLPqiocPBUdC0vPra6OCP49fJxgjjaG1YdpVNlGBs1KY4ZzJVR9wLgqI7VkupWvqXz4pty4Q+E2Kq0RyaSm2zFwEGJJugxbskSaE+EOhLwFVRSgN0p1cko4ZqpwmFrSnPIxysYnNxRtAW6R5T42fML3M/C9j+Bo/uXghBFfiafls7z7EefpK17UrddCvuQo29r4J5KphWk+9BPJh5P+X2QWv7cKOIq7gmTVW8HGuCRWrbffPyZgyi4NJYrZ3UL3Rf/rXSTdpuDlZYHf27EkbcScYomPeCaiuC2JUz3VHGeFSjlFoMhs/lmNfbLslK+3bUuJ04Wd6ZE4VQo1U4JuBg5hgyYiLLGu8SvbdvTW3UoP9ktS+u9T9Vsm290HyJYsU13yv7w8kqiCZFU7/6T0ItJOugvWArDSuhgeapKT7Ru3ptu/riI9ij0a1qB6f+8WudnZL7fIpFwNuAKkFZPCNBB3Z8HWIWBopB9OTRHt/Mpz/w8MNU6snTuJZOAy70/j12s+5CM9lpTZgEKylDrEETwXwAWT6pbiWMVccWJ0D2CH8T0kAIzMHk/CtfLfdv5EHUGTtgu5DadRg7klyjejujsc2nyR692G4/1oV2xr8fYtu24YGyaYqlzFFzJAzG701+wHPgsKxL/i91+tXQWrXBVItolU8ZzePCa7mst128FL8ty1A4WUbfxPI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(396003)(136003)(376002)(346002)(38100700002)(8936002)(478600001)(26005)(54906003)(316002)(6916009)(6486002)(66946007)(4326008)(66556008)(8676002)(186003)(66476007)(2616005)(83380400001)(41300700001)(6512007)(53546011)(31686004)(2906002)(5660300002)(31696002)(86362001)(36756003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c20rSEFON1V0U2tCM1NNZ1hRL3VkVVVLNTU1WC83cXJmdFdtakpkMVYrb0VT?=
 =?utf-8?B?L3ZodjFQK21ydnQwbkxWRkM5WGVOODBibG5PK3ArRm9uSWpNc1lzcWZaODk4?=
 =?utf-8?B?TlhLQXYzOUdWRTVEME4xYW9RWjc4Y28vQXIwbUw1dHNyck9YVG9rSmtlYy9h?=
 =?utf-8?B?WFllUFNKbDF5WGZnU0p3aVZwcEw3a1FBYTg1L2V2T2pTaWM5ZnlOSzBRUDBJ?=
 =?utf-8?B?Vit3ckpLdGg3TWN1TVBBNkZCZ0ZSUWNxVGE3Si8xSkVEK1hSWC9GeGl2WmJh?=
 =?utf-8?B?ZWUzSFZCek8rRHF4aHowY2hQMGEvNGFpcklNUHRZWjNUWXBISEFwbCt4OUtv?=
 =?utf-8?B?clJvSkErcDYzYzlmVjBheDN0bjR3UDh3Ulpsa21SNUdJNUNBVW4wVjVQRlUz?=
 =?utf-8?B?OCtjNTdNZExiV3c0WWlHSkxOR0tsM3EvbHFNUnp3b3N4YndyRmVnUW03RitJ?=
 =?utf-8?B?eWh6RWZHcUIzN1BUN3d1Q3NIVDNESmRKc1BDMmVzQnVGUFRMWFovYXNnaFM4?=
 =?utf-8?B?aHZYdTErakJoQUVaVmRPU0s1czdCSFlESjhRQ1dUNjFuVnlTMFg2bTRjWitI?=
 =?utf-8?B?T1VKaXA5MmxGeDJlUjQ0V09zMWs5eUpSQXJtVXdQUEVmVngwUno1R1pqSHFY?=
 =?utf-8?B?ZDlrOWFvOVczbGFLSjVVdi9rOHV3anlLS1Y3Uk5HZWs3bWFnKys3N2RxTWJJ?=
 =?utf-8?B?YlVVaFZYNld1aWVIM08xcFp4MzVsM2NFRmlhWnYzL2N5S1Njd3FGSTBpSVZG?=
 =?utf-8?B?NVllSVBMNjcyVFhKUjl0NUYzdjlPOTdNZTRYMk1KM3Z4VTg1NXBZMTBDZHpN?=
 =?utf-8?B?UlVVWVBUL3lPRnArdlpUbm5OYS9kd3RoNWFmU3JaaEVtazVteC80OENzS1FS?=
 =?utf-8?B?Y09vQ0RLdGxWQWdlNFRlNjV0UlV2KzZ5UEZOV25CRGh6ZWdnYlExTGRCenox?=
 =?utf-8?B?bkZleE8wY1lYUjIvQnZndkk1QlVoS0xRekZyL2F0eklTT3BVOU15UzlsYldk?=
 =?utf-8?B?dThFTzRyaXE1ekdQaVdGbVJZYmtTN1JuZE4yQ0c0ZlE0QVM4UEh5MzQ0UG9G?=
 =?utf-8?B?aEZWaGlWYTljNE1FdDd5RmlqUlBnSEZ1djNHUWU2MnhYb21GQSt5b0JwY2tl?=
 =?utf-8?B?QzNEaEpWd0dxRkl1ejR4SzJETm5yd1FmVVVSNWpKb1psblNtVURKdkhjL1pv?=
 =?utf-8?B?VkMrWndUaGtrVkVJUnNtbVA0NDlvZzk4WXJKbjYzQUs2Zk50eStsOStURVJm?=
 =?utf-8?B?WHJPcW5jSzBmQzFCRjI2TU9vSTNkMHdyUDJCTkRCM0tVOU1IcUN5Z0lZcEpG?=
 =?utf-8?B?K0F4Uys0blNHN0ZMcHlsU1dHdnpqVHV3bDh0bnR5cXB2S3RnT1BDUXNlTHNs?=
 =?utf-8?B?RU1DSWgvM0MvNG5Bcml3L0ZjRkZpbHJJQXVXSXRRY3ozNFdRSkI5SWFrVHNV?=
 =?utf-8?B?S3BoVkNsRElBTHFUcG9wZnF6dTJtQTkrN0kvTlZ4MkhtcFB5UDJtRGJDSExk?=
 =?utf-8?B?czI3ZXJhTGZ6RCtOZ0Ntc0czaHU4N2dISVNMSU0vTG55QUIrV012YVp2cXF6?=
 =?utf-8?B?UFZvak0vMENKcU83L1FuRjRjbnh6MWpkeG9nb3hPNGRhYU5lQk0zVSt6YWN6?=
 =?utf-8?B?cnBTTk5RclUvYVRDd25NQ28xUGV2RmFhcUxrWUxTRmUzUEJhR0J1c05nMkwx?=
 =?utf-8?B?Q1ZBL0c3bk9UYlQvaUJEZU01UzZWV2hZZkhqNnF1ZjNKK3dOZjRMbXpyMm54?=
 =?utf-8?B?QlhhTzdSQVNQeFlYN3J5TUsxd0dGbC8rV1EwdW1uTXZiOXE4TzNJbGhjc2xi?=
 =?utf-8?B?RVJPYkNzYnBmV2plazlsdzBuYW1INkFHbnVXLzVBTGFmT2w4MlNWNEMvOWVx?=
 =?utf-8?B?bllmc01ZS0J0QU9VTHlQa3pWUUo0NVIyR1Y5Rjk4Rng4eEhtUGN1eEx3Mnht?=
 =?utf-8?B?QmlCd1VjMTY4S0FobUsvVlFpU2wrWnZZMDZ0V2dCT0poUTd3aFFOU0NhUTVQ?=
 =?utf-8?B?NmhuV1lnUXlRTEc5b2xXQU1Hemgzei9BOEhIKy9ORld1RFlaSVNZS0prVTNS?=
 =?utf-8?B?NW1JcUZSQVBkakhiWHRPRDR0bnprSVdpVk9PeVNsRytTVFhkQ0hTaVhqdHNR?=
 =?utf-8?Q?ViGwbzgt5xCy+RgcXrqPIlQtx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3931627-f392-47e0-cbb1-08da60e2ab4b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 13:06:28.0186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rffho7DehExKRcmc5I5r1JfIzj2FDvA+LYQJ1RO8GuXgSi+AKijmUAEnl9oVxVX25snrrgnwtiOoZ8ZyXe6FCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4735

On 07.07.2022 11:22, Penny Zheng wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -245,6 +245,29 @@ static void populate_physmap(struct memop_args *a)
>  
>                  mfn = _mfn(gpfn);
>              }
> +            else if ( is_domain_using_staticmem(d) )
> +            {
> +                /*
> +                 * No easy way to guarantee the retrieved pages are contiguous,
> +                 * so forbid non-zero-order requests here.
> +                 */
> +                if ( a->extent_order != 0 )
> +                {
> +                    gdprintk(XENLOG_WARNING,
> +                             "Cannot allocate static order-%u pages for static %pd\n",
> +                             a->extent_order, d);

I'm probably wrong in thinking that I did point out before that there's
no real reason to have "static" twice in the message. Or am I mistaken
in my understanding that only static domains can ever have static pages?

> @@ -2818,6 +2805,55 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
>  
>      return 0;
>  }
> +
> +/*
> + * Acquire nr_mfns contiguous pages, starting at #smfn, of static memory,
> + * then assign them to one specific domain #d.
> + */
> +int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
> +                                   unsigned int nr_mfns, unsigned int memflags)
> +{
> +    struct page_info *pg;
> +
> +    ASSERT_ALLOC_CONTEXT();
> +
> +    pg = acquire_staticmem_pages(smfn, nr_mfns, memflags);
> +    if ( !pg )
> +        return -ENOENT;
> +
> +    if ( assign_domstatic_pages(d, pg, nr_mfns, memflags) )
> +        return -EINVAL;
> +
> +    return 0;
> +}
> +
> +/*
> + * Acquire a page from reserved page list(resv_page_list), when populating
> + * memory for static domain on runtime.
> + */
> +mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
> +{
> +    struct page_info *page;

Use ASSERT_ALLOC_CONTEXT() here as well?

> +    /* Acquire a page from reserved page list(resv_page_list). */
> +    spin_lock(&d->page_alloc_lock);
> +    page = page_list_remove_head(&d->resv_page_list);
> +    spin_unlock(&d->page_alloc_lock);
> +    if ( unlikely(!page) )
> +        return INVALID_MFN;
> +
> +    if ( !prepare_staticmem_pages(page, 1, memflags) )
> +        goto fail;

Don't you need to undo what this did if ...

> +    if ( assign_domstatic_pages(d, page, 1, memflags) )
> +        goto fail;

... this fails?

Jan

