Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A552596C89
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 12:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388803.625556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOFv1-0004xg-3U; Wed, 17 Aug 2022 10:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388803.625556; Wed, 17 Aug 2022 10:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOFv1-0004uq-0E; Wed, 17 Aug 2022 10:04:59 +0000
Received: by outflank-mailman (input) for mailman id 388803;
 Wed, 17 Aug 2022 10:04:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOFuz-0004uk-IA
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 10:04:57 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50065.outbound.protection.outlook.com [40.107.5.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b9487c9-1e14-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 12:04:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8232.eurprd04.prod.outlook.com (2603:10a6:20b:3b2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 10:04:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 10:04:53 +0000
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
X-Inumbo-ID: 0b9487c9-1e14-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHTWZ66BTYH16ia5rdc2ejE2bz6e7Qm2R0aLhYByL7knHm6MKfzjDFQ3Q0n+uHT+KjNuUFzq/1bwyt2BS9GcG8bO+WZNs8DT5tA78i2YQEu0zSVrZJidaI5EDyTmg+QL7wsLdaMpX5G/cdj6z9Mw6jdebrl+R1ABBpOYoUYBdQFzrEOx/N45+8M/dbbwSz5xTTFMRLtU87P4oCjsUVfyiez4ZbgqwP36YVzRpMPggU+RsgwUG6Q/q0sC+H594mgWa/5UDot1H9mFe+jCDQSG1jLeQrwrLE8YQyX9lnfhkwKsGmrslnLEtN69CF0ifC4CTwY8JddGQxSee4JNyeXJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWdgy2/ltqh8Rqw5iGAIvSZaMw//DgtmkNlGaeRY+UQ=;
 b=mTnG55nA3BGSKfuH5KQ0pN4E5gObLqS7ZenjAkqdm6rxIzGywyK3o6+JPyIGwadPqhHuIeYJo//3s8sp9w7BfJaJ33qXbtm5jRi9MkD2oRMSmXtXMqqq9weVReoabw3il1UfCMjfX2ZUcY3qXawWEaIjC0Bh6cSd5WW0pApjdA3w5hFeYuzSjJkgszXJ1MoH5wJRx0nlDhsj6S4XbjhIl4lqJ39bzlT3a6zvHoI0PXq1PdTvV/IP8yCX/Ex3NoVpeZSeLkJlzccu6DQ6gyLZK23C1VYD5aFPxtdrjJwEQBUQnmYkWbUPYYMrgn9xm8WsDyjkP3wRCQbzXPCxRPtHig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWdgy2/ltqh8Rqw5iGAIvSZaMw//DgtmkNlGaeRY+UQ=;
 b=KUWgCruLPitsR+uLMlrktW2NaMMFtyDwiOkO4Vf64dvZCDPcPzGy07oZtyCq0IbSiHkFGngYUmu8VkaWI9pC6S4BqHRA92QdyRW37CtICAURBKFCvgxt+RX0d/QE5IIAlGZvyTjkcDX9DbHJFohbgMK0FcPBoOGVXq0IbRh92CZ0AQ2KLWYTvX2ibKGonRN6NUmRHYEgM+gGhGkTSZaEtzMO28nlmjcO7zSh76wnVFxCscJjfffb0lORWWACaAXZXbsR9PbxbuAkj0upwKCIQKF5unQ33kL0O7gzVyKlB6/OEw3RVg9+E12y79NHvCT2Qek0MLiLW2rDd/a+u1To+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <691b68f0-db68-b400-5473-558583f8dbc1@suse.com>
Date: Wed, 17 Aug 2022 12:04:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v10 8/9] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
 <20220816023658.3551936-9-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220816023658.3551936-9-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a3cac28-420f-4342-3206-08da8037ee4d
X-MS-TrafficTypeDiagnostic: AS8PR04MB8232:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UBxJJrRMDy12NavCUKyq7LbgZg5Ogj05TXWX7Cp2Q0PyYRyeLgak7PbETwkv+NT8hGHjN6xJHc64dNfscXyW65cYHDTUjIXxog2Fp0mjkpcjYIuPeSegSZUcQqYyAy62HyVNq376QOk0LLPhK6pYpb0/9AlkguhyCD0RPFCpqREwJRDtjyVm/e6DA+4F/w78l9CQhSMdRhQEhmXlEHVzIn0X6u0oo6AsAMcJ4xeYzd4G9VoSCQZAq5qQ0LpSJvmTtI/tFkC93ouc0Mx1zDnjEPfK5XCbGScEpyz4eHexvmAiRhRDQ1uK2RKqvXXXTI0f/WBDkIe3WGP4w0LY5NKdOtY2FkcmXV3V0Ct5bZdkbaJpevC1ziAAjz4mv0cYg4x1cYknZatARYe6kNEkHCpX7WoEsYwjLU96ouTBOMGDWfmo2vqAQOtylcp+mPMG9ix7hnJaZ8wjXNmKIq5HbswgKAdmxeaZffrLokAeytul/b/BWA9DK1FrCAWj2yt6VRLFYpaQDHdvj+GWet/HanHtRlkZSjO2k4w3P4EHVldT2CRGtG5GIVBIb6zJWPZIIF10LuN72VIWNaqLx3Fef1RGQeiKCYXuo3kxxZ0S4cbDer44J99orZTIEuZaa+3C8/ftK05sr3AzZVYTnv1Yc1I8542PSdJamwsskGNkwsGxxNE4JNceEAg9QyarLn1By7SexJ7WLEYIJGs7UWlbnfQLWVKftZVEOXpWAlvi2ccfKE9c4zLZ29sF6FLS3Sgd4u4fvNI3eOVShwqYQm5Uev6Ff89nls3orjhHqfq/t3EziTbTB5wW0YwXzCvwKUVt+PB+AOyCld5KSP277ItUxVgGzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(346002)(396003)(39860400002)(366004)(31686004)(41300700001)(186003)(86362001)(478600001)(26005)(31696002)(6506007)(6512007)(2616005)(83380400001)(36756003)(53546011)(6486002)(66476007)(54906003)(8676002)(66946007)(4326008)(316002)(66556008)(6916009)(5660300002)(2906002)(8936002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVZJYzZaNlRlaENBVmt0NWRxOFg3b2hzM2ZqVUVOQXU5M3p3ZDV6MU5sM2xM?=
 =?utf-8?B?elMxUi9HVlpaM0htUnNsM2hhdFhZdXk5b1BhVGxpK1d0TEUra1ZHODlQeHJt?=
 =?utf-8?B?MkFzbTM5V3ZKKzFQSEhOcXpmOTVnNHV1MEJGbStFTDRQV0pRWlRyWTNJb1Fo?=
 =?utf-8?B?YWR3MU9hMkkyRi9sY0J5Nk1hcDFJRmRkVVFRUDd4SHc5Y2JkOXR2RzRaTGJ4?=
 =?utf-8?B?TCtLVmNsSGZJMmwrcXdnRTNkdS9JT1JRNms4d2JqZ09YZ3Y0OUpkdE1oblky?=
 =?utf-8?B?ZHBNS01RZjVKSE1TQnl0ckZ0eWFzZm1FK0R4dHcrQXBHd2hIYzdBSzRuZ09D?=
 =?utf-8?B?NG9NV0xBTjkxemlCcmNRdkkxckU0eTVLcFIzU3pJSXlhNkFtL2M0c3RJRkdv?=
 =?utf-8?B?Wnl3SDYvUDV4aUF3K05LR01JNlNVN2pLU0NFSFhpb1lkZGxpUlY1Z3htOTFK?=
 =?utf-8?B?MDVwYUFvWUlzNTEyU2VqZ0w1V0xRZnBadE45T01OMW5WT2R3RlNWaEVaSkx6?=
 =?utf-8?B?akhoWDZ4TlFLSk5PamtxQnRnYkpLak9ZZGhWZGtBZ1VXYVg0TGMvQ2d5Zy82?=
 =?utf-8?B?L1kvT3NOS1d3ck43UWFBY1JKMWd2L0xjTll0MjVXYm1Tay8vZjlJZy80SGtV?=
 =?utf-8?B?WUNhU3lNRk9RbFZBWTExdVBuV3pmYnJYdHQrMmgyZU8reVU3eXZCcWkveGRp?=
 =?utf-8?B?OWYzRjlEdlZQeG5yRU9SWkNIbDdkeVY5NVVsN1FwcGFsU1Y2VU9MSWVMMWht?=
 =?utf-8?B?ekNzQ3RYYXpCRnFGTjRjUTFzcHpnRmxkTUNJWjVhTmMwTHFZaW1qK0lDTmhu?=
 =?utf-8?B?ZWVaVUlXNnBCc0UrM0xSUFRBZHMzSS9LQ0NwV3Y2MTllRUp1ajYxNXRtNGwx?=
 =?utf-8?B?SkUxR0VlQUtKdmlid0QvN3VhdXBkMjJ3WTIzaTQ5M21DMTEramJxTndyZ1Ev?=
 =?utf-8?B?NHJRL2tMQWVrcTlHcGZXbWxlUWRUQ3BZSTZWSzdreXZZUERUS3l3dkxsbzRT?=
 =?utf-8?B?a3NER0lpZ25pTHRsYVFHcEZXZWJpQkRPM2taY3hER2ZCWmFoSEpIOTVldG1P?=
 =?utf-8?B?My8zSnhmRW0wenUvN1Z6N2lIZ2RBVFZHajlWWjkzMEVucUxMYnpKbVpMbVdy?=
 =?utf-8?B?U0JNNjRuWUQ4eW1zRWk3Mk5KQkpUTmVCdFJMbS9JM3FpVGoyWTFCZTNPTEh0?=
 =?utf-8?B?a05uVnpaYWpMdWlQRFFib3JCWm13VGNOR3VXejRVTnVVQ0NWUHJEdlI1Ykty?=
 =?utf-8?B?c3Y0TXF0TE5lcnMwRnJVQzlVR3NpL1NqUmIzcENwUnZsajk3cnErN0VrVSs2?=
 =?utf-8?B?M2N0ZWZlN1BBSmFYMjR2bmNDMG1GK0ZJTjhieEVweUpWSXFYM05PeE1NcndD?=
 =?utf-8?B?cjEwYjYwN1FDeElQby9xMEV6NGFvb0k0RlA2eVZJbzN0L0dNSm5TeVNkcU9G?=
 =?utf-8?B?b1RDS3RVMmpSVURpMlpWQnF2cHA0Vk8zTzJQUmdKcXkyVHBTWDZvb3VKQURa?=
 =?utf-8?B?OTAxYnUvSFo1dDFLdUJxeXU5MCtXKy9vcjdNNGlleVNsRlJIbTVXWmM3N2Zh?=
 =?utf-8?B?RDNwRWVIY2dteVhiQjZUTTNDT1FPQTIxRlJXZG11ZEFUbVpJSDhsM1lNbkZk?=
 =?utf-8?B?aGhFakljWndJd3huVTlRcW5jQ1NHRFpMd2prMUcwS2lLTXBCcTBENFJDOUNY?=
 =?utf-8?B?Ym96VGRVam52ZG5xR3pFLzBINnI1RDQvRUZsdWxST2NOK2RvODNhUyt3YUQ2?=
 =?utf-8?B?Mm1KaVBYekdJWjRxTjRZWjRMMEpJS1N4VjdqZDZ1cVJyYzJ6UEtxV3NyWXRE?=
 =?utf-8?B?RGJtRU4vRnJzUVJ2UEVRdm1abmJtbmhOTm94R1FQVGlTZ1JsSEpZSERqOXVJ?=
 =?utf-8?B?bkZXS0Y1Tm45VjRGMmJiZG5COU0rZ0hqaGhzMkRLSXpSTGtrbllnd1UzcnB6?=
 =?utf-8?B?Ry9DaVpRUWZBRWVLaW9CNlhQR2dLMUhxWFdIa3BDc1luU0Z4Y0tjNjNaYTFC?=
 =?utf-8?B?WWJmV0oxZDZDN1AwNFE2L016RUJwaXk5ZUNIc3dPcllQc09HdVIwV0J0Sm90?=
 =?utf-8?B?Z2doQXBWVE5WWGd0RjQ1MTBtTmhJakdTNEV5bkIzOFVwczR3MlA1RVVCcEJ3?=
 =?utf-8?Q?DrbIyGIRtje5iC4Da2Xi4eWkO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3cac28-420f-4342-3206-08da8037ee4d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 10:04:53.7033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXfniA94Nr+RtqhV663vHuTUTRMpgQICSEmXrud39jYz8rNGBBTQHPEFIGD2m2b2GPdkZptqeYv30287g2CMWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8232

On 16.08.2022 04:36, Penny Zheng wrote:
> @@ -2867,6 +2854,61 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
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
> +
> +    ASSERT_ALLOC_CONTEXT();
> +
> +    /* Acquire a page from reserved page list(resv_page_list). */
> +    spin_lock(&d->page_alloc_lock);
> +    page = page_list_remove_head(&d->resv_page_list);
> +    spin_unlock(&d->page_alloc_lock);
> +    if ( unlikely(!page) )
> +        return INVALID_MFN;
> +
> +    if ( !prepare_staticmem_pages(page, 1, memflags) )
> +        goto fail;
> +
> +    if ( assign_domstatic_pages(d, page, 1, memflags) )
> +        goto fail_assign;
> +
> +    return page_to_mfn(page);
> +
> + fail_assign:
> +    free_staticmem_pages(page, 1, memflags & MEMF_no_scrub);

Doesn't this need to be !(memflags & MEMF_no_scrub)? And then -
with assignment having failed and with it being just a single page
we're talking about, the page was not exposed to the guest at any
point afaict. So I don't see the need for scrubbing in the first
place.

Also I think the rename of the function would better be done first,
since then you wouldn't need to touch this line again right in the
next patch, and the prepare/unprepare pairing would also be visible
right here. This would then also better fit with the introduction
of prepare_*() in the previous patch (which, afaic, the name
change could also be merged into; FTAOD I don't mind it to be
separate).

Jan

