Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC3A5FEB75
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 11:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422610.668753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGsU-00070J-Tq; Fri, 14 Oct 2022 09:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422610.668753; Fri, 14 Oct 2022 09:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGsU-0006ws-Ql; Fri, 14 Oct 2022 09:21:14 +0000
Received: by outflank-mailman (input) for mailman id 422610;
 Fri, 14 Oct 2022 09:21:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+Di=2P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ojGsT-0006wm-Pm
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 09:21:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ba7c610-4ba1-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 11:21:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7226.eurprd04.prod.outlook.com (2603:10a6:102:8e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Fri, 14 Oct
 2022 09:21:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 09:21:10 +0000
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
X-Inumbo-ID: 8ba7c610-4ba1-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmBjyOZdWnrSonQfF/WZcFhJsTa4WrvQLlXBTHGIrmUgQLVQJBYLaxWSCQJW/i0xfyJ2dCLegQSgAOo5UhndIK+zK9kIfSFlUzbLLC4fMtG5nWgBmbDYV+RIQ/RSg6QZ24pBwcxX09kKjoWZGAfyJCUnUkOaJSZdUAbUkQv+/U4e+vFaob7HW4hSDJVat4eNd9FgGmGGI1EZDpUT9GhqAif4hCQqzcnb62h/qMPFmkOfdF1PflteYpklR766WNBGt9gMAt9ELXAy4zAYVt1uyslRH/1sjWe+sdtfqPLahyo5o+b8UJjqma+nd2C3YGfPz3sRuMNWuOABDyhMhu0F8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03wwF/dVQjIzfT260xxVyDdVXv1EHXZkwy2odbHHj3M=;
 b=IupBgLlWXgprui/vuvyw+2mqUYC8GyLNJoZQWxASd0KxY2O0OG09/gyoaAr+364AMkdBUCT2XyJm3HzCA7cVUiu1Xgy0ijF7OEAWevU+Iwr023WJdO+wcWboOjxJA06jXjAW0mFBnQ/WPI3tX8OJPjqFb2MlOTGKE5cs5aYOxZrZDaV1ZJSEJ4AMJblIWuAK/Wg0BbNDFfDrsH1zK4wj0H3liX2nfWl39Dk1lXXxyLQ1JAumSg5+w5EF9SCvBYr7UcryliLjVfYVsLNk0UA8YnohBY3CtY9PmniqVfV6DmzdmXadKxtPKc6GBAZKzCblzCzG2t5TG1uvbT5otyHDaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03wwF/dVQjIzfT260xxVyDdVXv1EHXZkwy2odbHHj3M=;
 b=GEeAYQlVsHcYYZnR3lCbJC4AynX5MUxLpGTMQ6IBchMacv1tGaQvXUwA2LXfT0/W7zeT69R9OhKB4nnHYUCv2abrca4HGsDDm69xtbe5SO68LTzoWmN1SQxo6QcOi8qgNUB1XnnTuuRz2KwmqygX2QRTjyFsfxzW1K3Tpai2BM8vezfcOctEgz1wljKVQg1aPDEFnAiJMnaNDGhPy6aBTkDzCck34nAu/Tt8zeRIhT0J0DPzaDnauUCivJ/ihyFbKfcTmV7P3ZLfVE+DcOzdpOgVC6MD73k/ODIxAHQuCsQ21E7CN1jM+zJGNb2Eh2X0mj0m/Fv3MUnTg+/RpzO05A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <70670b7c-e87d-9eb7-691f-48c44e9d57db@suse.com>
Date: Fri, 14 Oct 2022 11:21:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Wei Chen <wei.chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20221014080917.14980-1-Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221014080917.14980-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7226:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a00e155-6c35-4164-2a07-08daadc56e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j4RE54uDWCdo5l2vm9qryOva9h3ZMM5y2V8tfLEjuCSY1ExbDk0GiynAKi/osy6gV1v8jnMkfEsYRLvJkVZMFprFkseIIQ/mCMewSGRrHOO/dZ0/gF3uZ0RppSOcYwdSzPIN/LDyIwlrXmBYmMo+6KjrGz7hpBHfl4is/yZINnTvBiI5Kqvz5JZZlsa/HyoX4M7YWALw6Tz7gHGVl6khOPGk5XsesU8GqqzvNHW69+asL5YaZWBdEILd2jlfYBpXY8me75GrX8jm3+kNLraZs/LQMxWkSq17h6lOpP1oWvcTTneWlP+ZwLMp2Ltx5TRykKWQKv3rhwIInK5f4VMK7H0mXZAPtgA9HTlI2d18R2eDoMYIboFhpNZwDFOZiPkTb/U7rdF/sXlEvubwZuAB0CX8VXAIlXSl57iiaa7/tiCcjjb2I9B9K5rDtyzeF5OiVZAdvWRTM20PPk+n/JiMc/0NWmelaXUOJSuKO0wQUiPKyBcIdu2w63Hp4OTVqnxSf9LdY8YgCDjSuVOdLMOoneW23LEBEc76r+OcST+39c87zwEhDRC8JfRcue29s3RHT1hF9Acl4pgjvP2YGp2QWsYLxfUsOZSoo2DctQSEddVaOLvSw48eSo44bzhdUwqtLy+hUxTfwbvkX7LEWsdcuXDw5UMpmODeO4XP6z0ZQ5KMq2fG4ejq3hzmUoaDbhlAmHMMIfWBy46AkiSENHvMOvewgo6dPJNuv3Rfhqp4K5wSbfzORiTjnc55+XoH5c5hvyJSCpnTF9SM6DhvPVFPVp5bzQrYOywewF3eyX/ALQc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199015)(31696002)(86362001)(36756003)(31686004)(38100700002)(2906002)(5660300002)(83380400001)(2616005)(6506007)(26005)(478600001)(53546011)(6512007)(186003)(6486002)(54906003)(6916009)(66946007)(4326008)(41300700001)(66476007)(8676002)(66556008)(316002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2oyZ1UrZGlzUmRiRkFIR01TT3ZYdENTOE9NTkZPV3U5UFFwSXF2Z25xZGZQ?=
 =?utf-8?B?TFBBUkQzVkdMdTViTnJTUVdyYmRPT2FoK2k5QUtzM0tYNm1JTHFNaTNkSmdI?=
 =?utf-8?B?a3ovQ2tuQ1Z6UzVMd0psK3Y2bWNYOEJheU1lZWkzWFc4cU1HNzJkNjh5Z2FM?=
 =?utf-8?B?ZVdrSzE1clV2SmVQRnp5cmFlT1ZNT0p5WWduc1cwckJhbGc1b2d6a0xpaDJE?=
 =?utf-8?B?MC9XYnl6OEhhTWVicXJranVreTVBR2lCZ1FlclpzZW1IUm9scW4wMUQ1dXFT?=
 =?utf-8?B?clFiQzliM0VIVTR4cTRwQVpvWEJvWUUzSXQ1YytOTVFnQ01ucUtoblo0VHVR?=
 =?utf-8?B?U25HSm81czR1b1R5ekJSY2YyVFJwblg1eXN4S1FPS095UVpqTGhPaUpJb0sw?=
 =?utf-8?B?QXl6YjVQV1hJMkdwTEhLbCs3Ujh3Z2k0aU15OHp6Z2xNQ1prZVdhZTZKYnBP?=
 =?utf-8?B?NWx1QktEd21XdDNsYmsyTVVXL2hLeGZuYkZNUVY2ZDlRcmgwTkZNSUUzTjQ1?=
 =?utf-8?B?ZFhqcm5SdUN4L3NvYjYrdy9TaGVSNDU5ZHB3dVMrbjN6bmNndVgxTko1czlu?=
 =?utf-8?B?T21KdVJSMllieUhhMldxdTRjeTh5Vk1kMnRlKzR1cTNQVWtjdjJ4ZklEZVRE?=
 =?utf-8?B?dmhOMk4rUXUvM3VwM1hPUmh1MlRHSXRwWVVHVjZiR0NxckNpWG1nRlFVYTJ1?=
 =?utf-8?B?MVpYRkQ0U2pVVnpaYU8zYlM0aDR4UUVCMkp2OUhNcWFESjU2bXVaK3RaYXRH?=
 =?utf-8?B?c1FyN1V4bmFVK0FqTkFyamtmM1dSRFFvMnpma3BmZHZxR2xxZk96WTBnN2ZK?=
 =?utf-8?B?QitMNjFJbnlWa2ZmTHZpOVZzM3J5WkQ3ZmR0MW40YlAvK3c3RTN2YWpZQVl6?=
 =?utf-8?B?QlR3b0l1QmZQUmFKekU5YWpIZUxEdnc0WW1OTzlUUjg3YjlCK2FCQldCbWZi?=
 =?utf-8?B?RmRzWW5SNEpLRFFhL1hmd0dIcjMxN2ZHbmZ1K292TE9jV0Zob1NxUG5nTUpl?=
 =?utf-8?B?SW1IdFJ0S3V6NTJkUlI5QkdQNWJXd2dhRWJtTnl6YktEQWdBcjJsbVAzMlZG?=
 =?utf-8?B?TGtSNTdZWWMwMEdTcmxRdlg0MTltdWxiaTk3MC9uQ1FqWlA1RGl5cTdteE5B?=
 =?utf-8?B?UFpEUC9KTWpaMWFob3JxWko3UlNYVVgrSmtxQUFPV1YrU0pOT2JxUGpNMmQ0?=
 =?utf-8?B?bWNiREQ1di8zc1V3TlhCOGNlYlNjV2dLSFA2dk5HaGJPOGQyRU4xRVdwcm91?=
 =?utf-8?B?RE5CejErdW9oMlhlZ1phQnBZM1hybmh6NGZGZkZxYit6WnhvQVVyTjY0RC91?=
 =?utf-8?B?QjZvenAwaHZFemF4azh5bW1JRVlKTEZmd2xzRk42Ynl0UFFvY1JheUlRRk0y?=
 =?utf-8?B?SHdVRmxRbzNSTU0xbktkLzY1OUtPL0pjVGFBS1BwSWxWemZmQ0JsU29LME8r?=
 =?utf-8?B?dm1xKy9Sd3BDZEFvQmFsSEJGVHAzM3M2OXNQVFdUeDFKSmNKUlE4T3FLa1lk?=
 =?utf-8?B?elFQOTR2bkdVU1JmVFhQdnUxbDVrZWluM0NKbDdaNzl1L095V2todk8zRU9q?=
 =?utf-8?B?cFF4U1diQzgxVFpEMmZnYXVpaXdrTUVYZE1INmMwSVFmVE5pbEtISDg2eW4z?=
 =?utf-8?B?djFOaVJYVWVGdndXQ2tSaWtKQUlRVnlOM3V3Yk5BNkd5UmRtZzBoQ3V4aGNn?=
 =?utf-8?B?M1daWUlHaHVsbVJ4dGJpbFdJZnk0d1o1K3BVMzFBSk5qMS9jMEJES2REcVRW?=
 =?utf-8?B?K2xzVU5IYk9jWXNPdWNUZHZ2MlZvbzJEUENoLzJaSGhNTVg5TmdSNHFzT3I5?=
 =?utf-8?B?NU9MaVdqVkJvdnBTZWJ6K0V4QTVOSHdBanVSK2NkeXJDWjFEd1Bvdjc4d3V0?=
 =?utf-8?B?dEdVa2owNjlZYllYTHZHTDJPMjYyK0ZFc3hNRm5OR2hzSk12aTA3WkdyWWpY?=
 =?utf-8?B?Y0ZLcUpady80WEpGQ2RpZG5QTi91OWRDcUlSQTJpd0t4WkM5akQ4MVJqUThO?=
 =?utf-8?B?MTlGai9yMXVWejY0NWtZRHJCMnpLeDBoemhiczdmUGVVTUVyUk0vVG41SUVB?=
 =?utf-8?B?T0kxNW9kaVNwYk05WjVOVWl3K2JOUkRVdGlrL3JnUGlTWTlrcEJLZHVvNGYw?=
 =?utf-8?Q?z0Iyz6o6vQdbx3FtnKXuKECgn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a00e155-6c35-4164-2a07-08daadc56e6d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 09:21:09.9938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjG3wEAcCZOpfmxkhZ4a0jMo0u/UI9AVo+pdq0k8+qZGR5F7Ko+Ql87iweoEWUQ86Pgo01M7ulqhD+ZuD3tg8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7226

On 14.10.2022 10:09, Henry Wang wrote:
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -740,6 +740,20 @@ int arch_domain_create(struct domain *d,
>          BUG();
>      }
>  
> +    /*
> +     * Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
> +     * when the domain is created. Considering the worst case for page
> +     * tables and keep a buffer, populate 16 pages to the P2M pages pool here.
> +     * For GICv3, the above-mentioned P2M mapping is not necessary, but since
> +     * the allocated 16 pages here would not be lost, hence populate these
> +     * pages unconditionally.
> +     */
> +    spin_lock(&d->arch.paging.lock);
> +    rc = p2m_set_allocation(d, 16, NULL);
> +    spin_unlock(&d->arch.paging.lock);
> +    if ( rc != 0 )
> +        goto fail;

Putting this level of knowledge here feels like a layering violation to
me. My first suggestion would be to move this call somewhere under
p2m_init(). If that's not possible for some reason, I'd like to suggest
passing 1 here as the count and then adding a min-acceptable check to
p2m_set_allocation() along the lines of x86'es shadow_set_allocation().
That way you'd also guarantee the minimum number of pages in case a
subsequent tiny allocation request came in via domctl.

> @@ -1736,6 +1736,17 @@ void p2m_final_teardown(struct domain *d)
>      if ( !p2m->domain )
>          return;
>  
> +    if ( !page_list_empty(&p2m->pages) )
> +        p2m_teardown(d, false);
> +
> +    if ( d->arch.paging.p2m_total_pages != 0 )
> +    {
> +        spin_lock(&d->arch.paging.lock);
> +        p2m_set_allocation(d, 0, NULL);
> +        spin_unlock(&d->arch.paging.lock);
> +        ASSERT(d->arch.paging.p2m_total_pages == 0);
> +    }

Is it intentional to largely open-code p2m_teardown_allocation() here?

Jan

