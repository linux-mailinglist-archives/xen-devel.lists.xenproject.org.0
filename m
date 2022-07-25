Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DFD5801F6
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 17:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374662.606790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG07M-0000CX-Te; Mon, 25 Jul 2022 15:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374662.606790; Mon, 25 Jul 2022 15:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG07M-00009O-QN; Mon, 25 Jul 2022 15:35:36 +0000
Received: by outflank-mailman (input) for mailman id 374662;
 Mon, 25 Jul 2022 15:35:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oG07L-00009I-JY
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 15:35:35 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140051.outbound.protection.outlook.com [40.107.14.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c88c3e0-0c2f-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 17:35:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8746.eurprd04.prod.outlook.com (2603:10a6:20b:43f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Mon, 25 Jul
 2022 15:35:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 15:35:32 +0000
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
X-Inumbo-ID: 6c88c3e0-0c2f-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAvqz3SSisAzinBkF3QTTF0u62qdfoDL2yXvg8g7Vg6FnUdR2aaD3diRTLJGz69i3i3FziddjUxqMXSgqLUKD82xDvJKUvAiYeXiCSk7aljWQNi2RT/SPjRy47lyfhQZ/Ul57EUOmsd+IPHT/dnLZOwJ/d03l9ZlgWhqq6dbJPVLRpUmlRa/S4m+u7ztsTMlbBP0ZWx2WdV3oQH7z5bUDGEd1gQDQoH2s2PxUqE6Q20ZAnKzSC8fpimBq9H+3Ap/XfvExam1GtAQ7Ah7QZTh7IqwzR9X3VYUXEXbuVdRJGqywGh9X29Ps+iNSbn22fX0OuKY+eKe8QPByx2vFtgsvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQRQ4PQdqjivhqvwrVdrxAnblF6BKWoJt05WMl82ao0=;
 b=Ki+Q6ShyKMkjinObUHUF57xhCZ7YCk++Q/3jjQYULlh+78AXCjd0HiYtr0gA/7rpH2aXjSH8Av1Y8S90gZPIExflK2AiGbBI56fvJKWIhbW85mLkpRAylOszw0lUY9X3JtOh9LixZaoJqhcXkBzZCB5OChE1uZ3648RZxwbMUq2H8cvwhjz3Xfu28K/+hJLnyj6dUHO0Q9zORVbd7UMUVydR7ebUg5a+JkHtGCv5LIjMokuHdO8dcT+fIiXyejwEfFODRi+Z8LdPaHuzXzWgACq2Ptc56tU5IzzQTzOrOg1um7JmLioFu9510XV/8NxrtkApazwcJiO4ggdKkA5bTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQRQ4PQdqjivhqvwrVdrxAnblF6BKWoJt05WMl82ao0=;
 b=QIj6gCjD+1s7ffIoE0cXY49JX+dcAJ6hftWDuBUmbbjMGcCjoVD9poW2nlyTijru7yeHi8bLAbW9ZSS1q8Keyi3g8909ARdXOnF1MPmXc+Pw65xTPRyMUYFcYUiTmr/mIPz01a+f5qbnLwwyGAR9VDWLeVR1t6DuCDXnIY4VfrS/jt09ieALVE9HZpUjhEQng2KJhGdeQN1NqczJLQ3HAkLvZfoCccOU+XfmL550O14sB/lZ+QT2My2VbdQ0A2nNWojupdkjzBTf91BbI3e3bDDbrtiQv66ABVRIjpRYY+lh4YClrLCbwgy9F4RG9ickE8KuSDLFzHTJtHD56PVADA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <903b6203-a475-5a83-0b2a-f3a8fa345b73@suse.com>
Date: Mon, 25 Jul 2022 17:35:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9 6/8] xen/arm: unpopulate memory when domain is static
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220720054611.2695787-1-Penny.Zheng@arm.com>
 <20220720054611.2695787-7-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220720054611.2695787-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0016.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 654bae5c-a686-49a5-5c63-08da6e534fa9
X-MS-TrafficTypeDiagnostic: AM9PR04MB8746:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dv3nNNGGEN8kSgjG+oBJgvEk96j6Dea91gLjoDffxbzAGOoKieiRV1ww9T/dAbTEwjfaC6IReN0LqKpA5wNICwMhXpmqkgNZHqOKvSomCvAkQRcDsW6IZjlW9Xt/V1t8r+vjvZVMqAkol/ELHsVzExXCjZQ2dx6yvN4UhcuyS1scaAPmOM33zkcSRKLx5r7Uao4zDMOJVftwOUKSj974dI+0Q3swdIy/c3aiGzIXuy0PQhxB5t6GSII6T/gNRPVFbWHUG5dh0ivBSLZ/e832ToXqz19vwpUqZlsvPSxH53jpzGILOsd0Jy5wa1ZmISad8hjCkot6n+5Dw5X+EXR2v5gKlP3WN+ieL7xFtG1iJcLSlfMgHLWf3cmo1H6TEzqnxnECG0eiJxRRwoHQi0IA6XiDaMhCwmKaBEIujSAHImUKSJHHPTSrUFNlEE6GY0LlEZaxXBBO9TvlxSOhCUvD2j9TqJTwGS1o5kajxIWxoMynLcMyqJsjNguBREYQwaig/Qy3BgoeHNhw+0b4uMQ8Ny7rjFjx65YzD0XqCWKdRVls61g92yjg7sg8DDOWnc1LcxxihPCqFUy4GfTaCHBunThUWyCeH8b2Q2OKNuFA3It20kh6CSJ5njg0WG7y2iVzM4yk4pe8t3scBeAEMqimLF9QiQ9GGRiL+9AAOR4NGIS1FvGXDZw4PiAF+dmt+CpqOsuGr3TgdM6+iOngwVALCfkSaDG8fbR0ogTNsjBVEg9W6eBVgNuvaPNJZgsDW9lz+fkUyCb2sfJm3yDbHujIzu3ilbj2BHwdJbEN6GvFSP3LElfeJvN3FCZJSsvY+mRiqmn5Susaf+lgqypnOkFDnA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(366004)(376002)(39860400002)(396003)(86362001)(31696002)(83380400001)(6512007)(186003)(26005)(53546011)(6506007)(36756003)(2616005)(31686004)(41300700001)(54906003)(6916009)(6486002)(316002)(8936002)(38100700002)(8676002)(66556008)(5660300002)(66476007)(4326008)(66946007)(2906002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDFUZ2d4eFVXaXA3SWNyaFNvSk4xTEx2MWtkWXdnMEU3TjlNMjdFdlBESWFP?=
 =?utf-8?B?TXRzMWhUSnRHNHZRbVRILzFmTG8yTUtPVzVScElZS21vVkhNaTN1OGZLU3pa?=
 =?utf-8?B?c0lLQWdBUVJhTENiL2pNVm1LYjI5YjZZNGhJQXVBMTNtYUdMMWc2alUyQ0kw?=
 =?utf-8?B?QzBGMzRIMzJOcEQ3ZnFRMDF2Z056UVFOSy8xeUd6QkQ5YmU1VU94WU5WVHVr?=
 =?utf-8?B?WCsyWTRZOVZHR0Z6MFlIS0ZzbVlhb2dKc0F4Vm5tS00rc250Vi9VeC9kYnRS?=
 =?utf-8?B?a1lhak5vTG1oTGR0bCtNem50Ly84NTE3bzYxb2FReU9EMGQxdGEvNjJtb3dt?=
 =?utf-8?B?bnFBZUlCcjRBZkdpR3Avcnp3WFY1SXFuMHJNVkxsMUtNVHN5eFBscmZsdFhm?=
 =?utf-8?B?aVJWWExhbWZhVFBnRWtNNlJjWmtxbHoxYkJXeTZoTXRjMEMrdVVyUnN4ZnNT?=
 =?utf-8?B?UHJUK0RlSHJteXc4UndMY2tLTU5rZkN3Q2Jva1VpVnVxL2hoZ0RCSnZmYTd0?=
 =?utf-8?B?VDUyRTA1d1lJOUpOVUdBQnViRjRqNVo0SGJZN3NnM05CQUNRWEQzaTQwOTlY?=
 =?utf-8?B?cVE3dmszRmtLMTAzZEprbi94cHNlSFo5OTQ4NTBKdzFqQ0NEK25uRnUzRk8r?=
 =?utf-8?B?S1lqcnFrWWJ3TitLRmFsOFpDTDBlYlpkRkp6a1BBcEVwUDhESDlNZ0UzWFFX?=
 =?utf-8?B?NnNIYWJ1K0svanptZGJkR3VRVTJUckxITjdzUmpnaytJRXZydlRkdnl0MnNT?=
 =?utf-8?B?UXdhanh0Y3gyUGpuNXFjMmJiZGRaYXZ1VnNLdEF0RXlsQXp4TFROMytPL2Nj?=
 =?utf-8?B?K0dUWmlhVy9vRFlVaEpKbVFFb2pBblVOU0N4NkV1dW5weTJJeUZ1TXZpY01x?=
 =?utf-8?B?M21ycCtwc0hvYjVUK2NSQ2NtbGoxUDVhUm1MZkJtb3Ywcko1NVUzRmhveDBU?=
 =?utf-8?B?dDYzcFR1eVphemIzSnBmN21BUEJ1ZWpFY1BlTXJrQkU1ODR0UFJEakc1SVNm?=
 =?utf-8?B?ajVRdnAvMGFRS3BFQ0FwYVBNZitId2xEZ21PVFAwNlpLMkp0SlNXQzQ3cldS?=
 =?utf-8?B?ZHNHU2dlM3RPSmh2V3RMM1BaWEdSKytxOVpwSFZyekw1TjlXVmhhMDd6Nkln?=
 =?utf-8?B?WmJJbmxlb0VQTTVxNEdFRHRBWEYyN2dmek1QUGxaYThaem9USnNObkRzdy9u?=
 =?utf-8?B?QWoxZGlVSDRISnJQS2tSZ2tkZHljMXNrTzNSOGhZVjc0SmI3N1ZENlNtemRi?=
 =?utf-8?B?WDUrZEFMNVZJNlRZVUM2TjVoRjd5blBsbllDUEFhb3pzOTl6SldmUnFjNDFH?=
 =?utf-8?B?WUtiYVVCMVVTVHI0RVdPbHhFR3Zrc0JSajBPalBCRitZRWRqMGl3YXlSMmNz?=
 =?utf-8?B?dm0yV1BGVk0vVzVlMmZ1ODgwWVA2VUlKOG93WUhGV3c1Y0hZWkpla3k0YUJT?=
 =?utf-8?B?bFlIeVRvUG9NWTlDRWJ2OFJsWllSaGQ0aG14alErME9XaUVpcFJSUmVZK3h4?=
 =?utf-8?B?K0ZWaEdQcFpsZ3NyRGQwODYybFFuUm5yOVBEQisxY2xnVERORGZMWEtsUCt3?=
 =?utf-8?B?cEJTZURJWVJZMXArSTlhUjk0Y1QwN1V3SnFtZHFGWlRFSC9tdVRsQWtnVGZJ?=
 =?utf-8?B?Wi9KQ2UrV3dnU2pUb211NDIyaFhlSWw3YzJQMzhUYVpKalVUc2JXVDhEWlh4?=
 =?utf-8?B?OVdUby9nell4N1VSTzNiTXNrM3hBalA2TlRSUit4aENxa05IOU81UkFuT2lr?=
 =?utf-8?B?dHl5eHFJWU9Wbk1MU3pCbGJhVmIxOFREKzJXZnJIRy9uNDMwK3pGQ1dFQ09v?=
 =?utf-8?B?YnYrYjMrZ1RFN3dEZ2c4Q2tuSU1XMlRBbVRYVHdWcWRGV21sZ0pqMFdtRm1x?=
 =?utf-8?B?T1Q1ZmRJMXpvSjBOb0hnMDNHQWNWQWd4TmphMjhDOE9TRW1MSlQ0VG1RYUpH?=
 =?utf-8?B?WWNKNFhKNGtPaVdqV1Y0em1JU0ZDUHBydFpSZlZlRDAxMWtyYnF1MnZFSTA3?=
 =?utf-8?B?azFxbS90ckwwTWhteGFSdHk2L2tMUEFFSThqcFBPdlo5ZFZxcGk4aUIvN05H?=
 =?utf-8?B?Q3BZQnppRmt3L3ppSDh0OWpDVWJ4MjhiUW96RFNYNnBXTXRubE1PMTZDR3pn?=
 =?utf-8?Q?s24EleTbdJI77ejiP9IU85iIw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654bae5c-a686-49a5-5c63-08da6e534fa9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 15:35:32.5592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJD9nGoPPLCC+Sohc9BGuki3HEFN9uWwURTjqhtFbrmsdehZsoOzA54B3M8BzYjHIyPs0Xv0vsX6p9i69pTL/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8746

On 20.07.2022 07:46, Penny Zheng wrote:
> Today when a domain unpopulates the memory on runtime, they will always
> hand the memory back to the heap allocator. And it will be a problem if domain
> is static.
> 
> Pages as guest RAM for static domain shall be reserved to only this domain
> and not be used for any other purposes, so they shall never go back to heap
> allocator.
> 
> This commit puts reserved pages on the new list resv_page_list only after
> having taken them off the "normal" list, when the last ref dropped.

I guess this wording somehow relates to ...

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2674,10 +2674,14 @@ void free_domstatic_page(struct page_info *page)
>  
>      drop_dom_ref = !domain_adjust_tot_pages(d, -1);
>  
> -    spin_unlock_recursive(&d->page_alloc_lock);
> -
>      free_staticmem_pages(page, 1, scrub_debug);
>  
> +    /* Add page on the resv_page_list *after* it has been freed. */
> +    if ( !drop_dom_ref )
> +        page_list_add_tail(page, &d->resv_page_list);

... the conditional used here. I cannot, however, figure why there is
this conditional (and said part of the description also doesn't help
me figure it out).

As an aside: A title prefix of xen/arm: suggests you're mostly
touching Arm code. But you're touching exclusively common code here.
I for one would almost have skipped this patch (more than once) when
deciding which ones (may) want me looking at them.

Jan

