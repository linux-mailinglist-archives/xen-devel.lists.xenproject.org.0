Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E623A28B3
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 11:49:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139789.258412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrHJG-0004ok-4V; Thu, 10 Jun 2021 09:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139789.258412; Thu, 10 Jun 2021 09:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrHJG-0004mG-0i; Thu, 10 Jun 2021 09:49:10 +0000
Received: by outflank-mailman (input) for mailman id 139789;
 Thu, 10 Jun 2021 09:49:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iP0d=LE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrHJE-0004mA-ON
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 09:49:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c676d11-95af-4097-ae64-13aea946c175;
 Thu, 10 Jun 2021 09:49:07 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-3ZnUP_CJObmNmbl8f2_10Q-1; Thu, 10 Jun 2021 11:49:05 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Thu, 10 Jun
 2021 09:49:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 09:49:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Thu, 10 Jun 2021 09:49:04 +0000
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
X-Inumbo-ID: 1c676d11-95af-4097-ae64-13aea946c175
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623318546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrWb6uhs+xIbu8V1eJhmX0UnPGTxkFdKLE4tq8T6iho=;
	b=hW6wS3EryyjXhxx7driX7MxbsMLVwL0pKY1Np3lCC3REe1ESsflIjkE9Umajp3ZjMFmp8n
	YR63Nb/yGgEioLocD1/ReqUPiB+tzAAaK4efWxcNZb7duXT4iKHI5cOvb3XFL7KWKul7A3
	yxmbvgjM02bF17GBr1cvdGpvbl/IERc=
X-MC-Unique: 3ZnUP_CJObmNmbl8f2_10Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5KvKPKR1F21iYqju82ynCLSwyo5OFELbVIhmh2ZY/ZaOvmRv6MpL+3w3fyK7kwjJy0N4GdTx0tHtuYvC27w+Pkvaj5v1YPDQWOIUXX7GvGQ8z6njwVwE+/wKl75yHvq6S6Wbx+y64W84nTw07DlhaR9EcPMY8E00Ynw0HHKQAsMjgyEQaKmjnOeyt723sXWhUZ1CI/1GnwQuHwW963Sz5aaVAaC/aAW6cOrpqf8NxwauXurSVsZ2rkL3eV14BxEZv/XxPjWD9OggpnBf3asGg3hDqHm36HDcrSd+mcmd1O1weu/t/Rw7r8ClLH8U/C3GLLpXEI73G7dAhDuU/07Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrWb6uhs+xIbu8V1eJhmX0UnPGTxkFdKLE4tq8T6iho=;
 b=LsQglGjQ4/19ow/ADOWdKHF37PMGDaxNRfWBOFW0+NOJX5nfMF3oICnBvK3aV6lOHX7ToeF3rKkibPT0eih3dDuNzhIo3yRjKL2UVXC1N3whwWSJHKLrotnnRO1IPALFRxzVSCKYDIZHh85oyy7YfZCLjiU0n6RJb16S6O8jNaAYx8rfAAXc8WE1ks+/xJFYqtb+T/cMgUce98z75c6plnABeTik4BcsjUEJ7gPF4Vt8pPPnRPVtSyva0lyjrIxSZAZ2FaXVD9EI/BOjWG/sIPewIrpMDgYrb/WV59RvqfTet+sp+jaWOJdXGIYY+TSWLBJGR/ccHpBQJiGej/LMAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 5/9] xen: introduce assign_pages_nr
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-6-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <41a7389b-630c-6cf4-fa28-7d80cb79176b@suse.com>
Date: Thu, 10 Jun 2021 11:49:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210607024318.3988467-6-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b870ddec-4941-4a90-6d72-08d92bf4fba8
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2333E7F08D1EE67967ED18CAB3359@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o4pvImjm9xdNSjlb9KU3TAoMSQIJCeTbNiE90SaTmHputqwps7kRxX6wfKb0FR64wJtiztW9p+meZ7+iOCan+gR0hUArqBE+WQMNB3jZwvkqlkUm3PW7TlxymJC92BWXRxR04Pi6IxMow1PiE+Gw1hqnVlk9VkGKbfIbwzvrqfRLYwc8OTfYSeMDdEXKMZAbCY0bVCx6BdNmREyJIP8P6Q8xvnsBNCmlKUNJWDxXl+hJsPMsKb3ujgshVfSu4WUae5NxtG8gsidBkR1cT9o/7Vo3JuR40YzdDkaL5+p1O7go+QRoHY82Vy1ZsibMIaUny4b4hMH4jIfH1Lp9GmS6NX5G2WdA3zR8khqSqSPd56+oBI2vwR7KkRKvkjo35lqKHVezTgKgF4iAi/VRjYjAEPYCuKco4ukimJ2ZLM8BTXDxTS7/c1qmfh8xswpgO8LEat4MtnNFkNzOH5JN6bes70IW4OsUNmoFzNlDOR+fcKdvIGfwkn2zBoS2vokNlUgztZwnmAbWt89k9mPQL5/BNRpOXC1N9ta6mvVoqvTM64gxoNoWdjOAqRvIoWi5nhnK1uheYNWENf1V0Zo7/+34b6Kwdk2eVcPqmJKUNO8fGR0czL+2ikHeqQx5iKkcdltOLDreWBhRiljR2Y7E5YTI0ORLG4U58Ccp2IcbIIkUsKG+15MWn/M79fiUvaTo/KVT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(39850400004)(396003)(136003)(186003)(86362001)(5660300002)(316002)(16576012)(38100700002)(53546011)(6916009)(31696002)(16526019)(8936002)(2906002)(66556008)(4326008)(8676002)(956004)(36756003)(31686004)(2616005)(66476007)(6486002)(66946007)(83380400001)(478600001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?RmY0UmpKYlhFRU9hUWsyZFBDb3R1NnJZWmUyVUo2SXNhNnArNitMcmtiUzcx?=
 =?utf-8?B?UGV3eXM0ZzVpOVM0WTJ2ZkdhanFQOW03SklZTUpZaFNzUzZWOHNUcDBaYkYx?=
 =?utf-8?B?cm92bXRCb0VzRW9OR3pxT1I4b3htTFRKWitzZjJQNGJGa1JyOG11MnA4TklW?=
 =?utf-8?B?YjZ6VEpTVkltZmRNa0RlMWtRTy8zV3ROZ0lVOGM3WWdSc282SjIwSUowdDBD?=
 =?utf-8?B?aERKcFJ0SWgza0dvdzRTZEZ1U2pWNTJKdE9VNEtaWDhTbFBmdDhuRnpBL3NP?=
 =?utf-8?B?NnAwU2wxYjV5L2ZpS0QzODEwQnYrYzFjc0lnZlMzeWI2RkF1WDdkOE45WXAx?=
 =?utf-8?B?R3J3aWlrSHV2bkVsZjZBZ21qTDR5aXB0NUpQUE5YbzE5bzNNcEFsM0xocFFU?=
 =?utf-8?B?a01TTTVQRE9rMGQ4MkRqMWtPZnRaeFkzZGNZaTVFWDlVNGtjRTYwWU9FQlAx?=
 =?utf-8?B?QlJBaXRxdFNGQUlKTFZYRGRXWVVjRjQ1V0hiZUZFU3lTc1Jrem9MS0h2WnJr?=
 =?utf-8?B?Y3Z2SFR5dEVObE9oaU4zZlcwaWQ0SlNnM1hPZ2dRaWt1c1Z5N3kxbTBHajBO?=
 =?utf-8?B?TjR0WlZhMHVOSkFjSEZhUlVOUkw1M3Rud2dTYUptZkFLUUdVN0tLZGJzVHQz?=
 =?utf-8?B?dldwWTFXVmEwbDVidWc3dWlRZkIyczdtMGc3VXBEaVpmczZSd09YSFJOa09j?=
 =?utf-8?B?c2VnV3BranM4cU5FZFdhNUtBWTNCbGorWU0wZytnZHFNUjd3WHg3YzlWNUZ0?=
 =?utf-8?B?SHNGWWVIc0V0WWlMUndsT3VtbjNyZkRqejZBeE4xTG4yZ3FhbjdwT2NvUFFZ?=
 =?utf-8?B?a2Iwd1BrZEl0SmhLV2RxbnRmdkZid1BiSHFPMVFCak9MWVliYW1NL2s3ZHNB?=
 =?utf-8?B?STVNVmJmdThRaGx3TSs5WVZDQW94M24zTVYxcytOY1RjMDZyQ0Z2Nmhic0RT?=
 =?utf-8?B?NE1lbXgvRXBqazBQNjBlYythWGV6akFuVUF0QmI3Y1dXWklFRmlwbTdqdVp0?=
 =?utf-8?B?NlVqS1c4Z2lRQk15WE1jMkdrS2t3OXR2VVhmUUdtdElGd3BhU1praGtUVjV0?=
 =?utf-8?B?SE1XMC9FRHRna0VtcUdnTW13TWt5UC8raUt6MWg4STFrSjl2eGhHVnh1b3lm?=
 =?utf-8?B?U2c3cTJkbUtlWktPZ2Z4MTd5b1hRZDUwMXFJbkNKUW9WdlZlVmF2am0rOUE0?=
 =?utf-8?B?d04yRTR2bGN2dm55aE11K1RtVU1MNFR1VEVpVW5BSCtkYkNKV203ZC9rMlZk?=
 =?utf-8?B?S0hEUmZrSzBkaWVhWmNSL3NKdDFHWGY2cTh3SUhnL0VZL3g1NGQ2MUduNEY0?=
 =?utf-8?B?ek81ZUFUakprSGNLTlc2SVRRR1IzdXlNam9UdzRmQ3BMa3MydVBHMWRyT1pm?=
 =?utf-8?B?NkdFRy9FaWFTclRYT3pwOXN4YkYyZE1rTzM4dzJYcTdRWDhoZUdvcUlEeGpW?=
 =?utf-8?B?STQ1OXB5YUJWMnIvTzVlaG9TQW1jU3RMR2d4TmtTQ3Z2WFRLdzNVMnM3MDh0?=
 =?utf-8?B?Rk83L2Nkczg4TmJ2bTdIbzNITGpkVGhNTTBTOXZZM3NDK0hjSEdnL2dFOWVR?=
 =?utf-8?B?UDVPTTRpNlNyVVlkbDhBTjk2N0NYNU9Td1hBMENHZmVab2JleXh6bmhJZ3pj?=
 =?utf-8?B?YUw2ZHFMYVIyTThmYTlrM3VUSUtIVVdhOHBGVEM0emlpNEtGSExKTk15U0dk?=
 =?utf-8?B?U0NQTnVxSjVZa0lkeER0MUNhSGdzWEFnMmc3aFBaNmNqZDREVlVmd2FwOW1l?=
 =?utf-8?Q?yxOMXAuPWX7uJ2VoFvmyHz2nOd7u9Vzh0IoQBj+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b870ddec-4941-4a90-6d72-08d92bf4fba8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 09:49:04.4999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9IET/Zl4YNKnGpsRQpaIpcpu3OWrQ/0R9XUYAZavPbpNmXG4hGHBZwB2wa6RDXc+I83ImdnmkRI2hI5++QzZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

On 07.06.2021 04:43, Penny Zheng wrote:
> Introduce new interface assign_pages_nr to deal with when page number is
> not in a power-of-two, which will save the trouble each time user needs
> to split the size in a power of 2 to use assign_pages.

First of all I still don't see why in this one special case it is a
meaningful burden to do the count-to-order conversion in the caller you
mean to add, and hence why we really need this new function (to keep it
simple, you could even have the caller not break down to arbitrary
power-of-2 chunks, but simply iterate over all individual [order-0]
pages). The more that I'm not happy with the chosen name, despite it
having been suggested during v1 review. _If_ we needed two functions,
imo they ought to be named assign_page() (dealing with a single page of
the given order) and assign_pages(). Backporting confusion could be
helped by altering the order of parameters, such that the compiler
would point out that adjustments at call sites are needed.

Irrespective of this a few remarks on the code change itself:

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2301,14 +2301,14 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
>  }
>  
>  
> -int assign_pages(
> +int assign_pages_nr(
>      struct domain *d,
>      struct page_info *pg,
> -    unsigned int order,
> +    unsigned int nr_pfns,

Even leaving the naming aspect of "pfns" aside, I can't see why this
can't be simply "nr" (of appropriate type, see next remark).

>      unsigned int memflags)
>  {
>      int rc = 0;
> -    unsigned long i;
> +    unsigned int i;

This is not an acceptable type change, at least not as long as it's not
justified at all in the description. While both Arm and x86 will be
fine this way, the code here is supposed to be generic, and hence would
better remain generally correct.

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -131,12 +131,18 @@ int query_page_offline(mfn_t mfn, uint32_t *status);
>  
>  void heap_init_late(void);
>  
> -int assign_pages(
> +int assign_pages_nr(
>      struct domain *d,
>      struct page_info *pg,
> -    unsigned int order,
> +    unsigned int nr_pfns,
>      unsigned int memflags);
>  
> + int assign_pages(
> +     struct domain *d,
> +     struct page_info *pg,
> +     unsigned int order,
> +     unsigned int memflags);

Bogus extra leading space on all lines of this addition.

Jan


