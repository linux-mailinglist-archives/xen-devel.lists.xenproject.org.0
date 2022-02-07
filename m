Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F65A4AB776
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 10:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266603.460294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH0CL-00046p-Cr; Mon, 07 Feb 2022 09:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266603.460294; Mon, 07 Feb 2022 09:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH0CL-00044n-9i; Mon, 07 Feb 2022 09:20:37 +0000
Received: by outflank-mailman (input) for mailman id 266603;
 Mon, 07 Feb 2022 09:20:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH0CJ-00044h-Op
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 09:20:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3400838a-87f7-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 10:20:34 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17--5yqlGBnMNOmLppktJ3P7Q-1; Mon, 07 Feb 2022 10:20:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB3612.eurprd04.prod.outlook.com (2603:10a6:7:7f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 09:20:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 09:20:31 +0000
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
X-Inumbo-ID: 3400838a-87f7-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644225634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NWVIcuAI03ir6QzaPqtvoKoNBC94D5lPp1xYNb/0onk=;
	b=gKnY24edqyXQSppBQSTvDfb+uKB5hbxy4Kh6R1KNPLEXjexq0GGbpYj6N1sVp6z+rc9O5j
	AkgfnVJeFYOruJFg859ztQDdSAFVD6BP3nUIVIpuZH1YQttG/EAoXXqp9Py/9Ag8exUL7H
	cid1i7x76YUc+fSAC0lGITkwjnqymoQ=
X-MC-Unique: -5yqlGBnMNOmLppktJ3P7Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMIkYtAS2IMwZRXFvkB0fs39kZA6AwZSIbN1RGuB5yO4/MkV7sz4v2diXYQuYjlMRgRRtUewAnabW7FIlt5azQzRM3T4TEptnZ9/Hn1cb8+aG20jSp7k6LOGg7JR4G3pO0DUFoVI9HxJABzpwkWhMqh7nlfqKbko0oTF0ATWbjA+KBvp3cgqXdgCNegDgbNgxelz8WlUs5uy62DnQA7Gp/qIRWEwVxp1kJuOqbvb6ZXCZj+a5/qqvNNfI28WJC+kLpqDrInTmixgT1XDw+Js2snZzxOI1bUt3w7pu5EPdxhesbd2BgMpDzq5CqMlyyorJUPQfR7ga010P8WsUutAoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWVIcuAI03ir6QzaPqtvoKoNBC94D5lPp1xYNb/0onk=;
 b=mUM/XoffOR4gLUEBn9snH9yDiSjJA1vIvZr7WVbrD84f0DJ6rKbpCK39A2XTJ7URwBGB73ZuccM7HX9ujXWfix25Oiq9H2ji1URyhHPhwF5b4vcQ9fFkBVRcqNAbREPo0u0wPLBoiYaoii3nz///uQ2GYpGrlCqCAZSG7iPMcQ4oUvVDLLflCtjZhewPdjfFq5GHz1oXL8LqnGjoepx8d9oD6tfu6XRHGoNsJAfjtsbfFT/T31QJYOLg9Gpcq8iXbJ5ZKrvisPUISzJnGC3CF4TADJoE1qK9dftZWHegwFtgnluyeIm+/v0PbEvBKWKMucCx60SbHfkmKQYVmny8nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49e85771-b20b-6aa8-4afd-562c6fb202b5@suse.com>
Date: Mon, 7 Feb 2022 10:20:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/16] x86/P2M: rename p2m_remove_page()
Content-Language: en-US
To: George Dunlap <dunlapg@umich.edu>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <fc340862-6842-3db4-1093-d2df44c1aa9c@suse.com>
 <CAFLBxZa3qZ0+1MHxULZCciFPyYppv12TTe=LjcEyJAEr-KJRsg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAFLBxZa3qZ0+1MHxULZCciFPyYppv12TTe=LjcEyJAEr-KJRsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0094.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4d8abd7-f9a0-4e0a-f50d-08d9ea1b1665
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3612:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB3612934BD8356792B8EA62EDB32C9@HE1PR0402MB3612.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RnOrMGOYl0SLGzHqZkNO1UiSrDLXHpL4PCGvXQB5W7DpHvXH70tZKeDJVj/RuJm5MZ+hBPeLauvxYvx5pZ7B3jKJ2XcWyNWdcsBjYZrAS2o00lCl+Ujn8gm1Nm91DFjQiweA+YS5iZ8dGPpcbY7Eg6k6RYDLyXEW110GRrSfdpnSPNUif2oiUtOjXNkTYTbJ4K43W9J75529DQXGeOOG9YHNQyYqIKDHrGsdLwFYz2gZI3uL8jMjcvO/QMjatzbyEmzqCJREUzbO4H6m11hRBpuGFotOBfdZdreSP9IcB70/igoHJQ03U2AHAjVI8HRnRIz26qrO3vmdko/j6bnkN4ZPr4IVVFdEsyRsfHfg5cSj8T6JYMXJH6gHu7EJ/EaXvIdGuen5G65EAR7cN3N3SYW8At0YlCPmdH9B5WCtJ6GQQ0TBy+Tgz7Ghtst43AD23YbgHhG9IY08cUZ856Ajddg9tZASM44f/GbCTZyonV7oenZ5L+5mfas1tyhf3FrmhGU5GnKRh4OP4oAaqt+UVb95LMCSKdg+b5NAMUrljAT5puCBz83kVvvG9qSAVVsqPYWcwxXFSG5CnXuTL2+Wj/iDWDOCbN3zn/udoMvVgcXMTG9qqQdKcno0LQhNef7vms2xHleYkUC9AZmsK9jA3Mw+KqcH9lBWyQiF72Euiy5ADSXlVX+mFXg+dGxTgp9vwit+VrR/tWpYbuc5q+LDiQj6HFWzNcCXcLsDcHJ43WE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(6486002)(86362001)(31696002)(2906002)(54906003)(316002)(6916009)(508600001)(5660300002)(6512007)(186003)(26005)(2616005)(83380400001)(31686004)(4326008)(66946007)(38100700002)(8676002)(66476007)(66556008)(53546011)(8936002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dExBNXhObDg3K2lYWE90SXE4YStHTStUZW9odnRZM3k3elh6NS9Fcnhvb3NE?=
 =?utf-8?B?L1ZXUzIzWFlBeXJ1d0lHU0ZWeVZmWXlBZXpkdFZKY1lpTzJISWY3TzdnL0tl?=
 =?utf-8?B?SlNPQlMxbnNOTVNnaUVjSEM2UGhEQm53RFlBMktYUVp3VlJsb0Iva0ZpWVAx?=
 =?utf-8?B?SXAvdXp4bjlGWkl4TWpRWTlhQUtEZnF2WDh2VGcrVHZITjd4ejRaRTI3Tkxx?=
 =?utf-8?B?TjU2ZGxyT2ZETWgxaWdVZVdHNGNtSXlJd0lkNmdEZGNCaUhpWk9VNFEwckdx?=
 =?utf-8?B?eGJiOWNSdGxFQjBSTHFyaUhFQmRSUXIvd0sva3FwWFlxTmlYcEh2eVRkUUdt?=
 =?utf-8?B?aE9NVFdkLzJ4TXNqeDdRUnhzaEhTNERVQ1MzRnZGS1RWMm5QbTFPMDk5bWpt?=
 =?utf-8?B?SSs2YkhUOUR6RTA3endRM0ExYXdrZHRwRTNHK1Yzbmt1T2k4cjFUejBOWGk2?=
 =?utf-8?B?YnBkMUtBNEpNeTNOVkpSRmhSc0RRK3M1aXNXcU1RcnpZM3ZRR0QzTlRyN0tn?=
 =?utf-8?B?K0FaVjRYVHZvT1dncmZkS2NWdUZxalZqYmJMNytJczNLWVJ5cWdKSzg3cVFZ?=
 =?utf-8?B?VDdNYzJXSHlIelJjRjZRQnU3ZG45OGxOMVZEU3JlWTZCbW1VNnZHSEVyT1RF?=
 =?utf-8?B?aVc0YnM4ZEs2UGUvajRINS9NVjA0QnUzSkR5THpVbi82RlNhYXUrMkp0RTA0?=
 =?utf-8?B?bFZUZmlQRTV1aFdVZ3FkYjUxbVU1amtyK0xzV1IwSDJsYVFtTnBIR0VCWTBT?=
 =?utf-8?B?TC9YTzYwOGRvK2RQMGJ0a3NaQUZmS1g1enJkU1Z1TTY5SHI1QjU0R1o4dEpG?=
 =?utf-8?B?a1NpTXpjdnZ2V0dZVW9XazljODhtdjhjclRWOUFkOWg1WFhkNHd3NWVsWjN0?=
 =?utf-8?B?b2Y0VEh0Q1JiVXNyZ1B1V1pyUkJBYzNZVFJMN2tLeUxaOUV4anJLM3p3UHA5?=
 =?utf-8?B?RGpSN0lRQU1sSjg2aENEajRWaVNkNlhXUW03R1ZPck9nZXF6a2g2OENQRnVz?=
 =?utf-8?B?d0NmQ0JsZjJlNTlDYmg5TjAwRXRabWRKd2RDdlhEbmxhUDkyYS9OQzNqM2kx?=
 =?utf-8?B?dmNXbVFqaEh0cEQ1UnpvQmFUbGYyc0hjWklQRW9kL05kTVJCT1hXUkRNNGcv?=
 =?utf-8?B?dDZOeG9ESzdFbDVjSXFjNjhEYUZybUtWV3loWDhIR2dQdXBWaHBsejYwSTV2?=
 =?utf-8?B?b0VrOXNwZmJzNUxFbzlvUkc0a2tEcGg1SSt3WXlJQXRkeU41bHpOQWozZ0Ez?=
 =?utf-8?B?Rjh3VUxpaVExaEpVTnpBTmJuM2wrTTBjRnlmVUI4djhXNk4zbkVSdG5leWVo?=
 =?utf-8?B?UUo4Qmw5d2tWNGxWMDgrNkZiSFFZZ1Z3eWRHOGN5bmo2VEdUR01paVRqNTA3?=
 =?utf-8?B?dEc3K0JwdVY2R0d6dG5ucXdUY3JSYWFiR3hiVFJCMDhwcEw2dHJNbmEvb1VW?=
 =?utf-8?B?MEtEUDFVM3dqbjNUMUZWR2JwcVBaMy9GRjRVOWJpZ2ZIcTBSeUwvWlJQL2Jp?=
 =?utf-8?B?amFQWThLd2JiRXdva0RUVHhhK2JZeXhCVWdzdk5tdHhsSDNwQlNlaXZ3WTR3?=
 =?utf-8?B?OEtyZ0U0ZTFud2dUV3hYVE92SXB0VGFCZHlUdGNCNEpyeEZERDVTQjhOanM4?=
 =?utf-8?B?TkxGRHd1azdwcnJvZ1Y0Skhaamd1MFIvbmhxa3JFKzdMbVB0VGRBSW84QXFX?=
 =?utf-8?B?MmgzRENVNDJYQzQwKzB0KzdtSGdXWHdSa00wS21HVVdwODZxZ3JTS09YcU4x?=
 =?utf-8?B?MUhaR3Z4dFhUQVJpdEZBQzdsU0FWem83dlBzM3VHRkZKSFJyR2ZpUXIzSEhi?=
 =?utf-8?B?aHhjbzlnaDhRQlUrdnBod2RYTmdiRlhsdFRrbEhjU1dNTk5wUVJFbjN0clY5?=
 =?utf-8?B?Y01jZ1oyTnBLRVgrejM1YkVwWEIyY1pTT3BycWtKYnZoaWF3QjBCMFVRLzFh?=
 =?utf-8?B?RkRUSGJPWm9tTVdKbWhZNlQvdUlKZ0VUcHpCR3cyR2ZHaHh0ekRmVldqWDhD?=
 =?utf-8?B?Y2FMbG1xU3hSV3NDanNQZkl5Q2FGdGJjOVQ3OGNnWGJqNVY1dVFaaEJON0Y0?=
 =?utf-8?B?bld3akhxaVlDQVB5aERRQXd3WG9PdGVKRnFHVkNPR0dLZjdUM1UvQmhNOS9u?=
 =?utf-8?B?U1FBNmYxMFE5Ui9KSE5rUFh4YmlaNG1Td2puMGJ5ZjVzcVdJOS9rQmJiWlVH?=
 =?utf-8?Q?9W7ffct/EIB7B+LLqvWxa2M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d8abd7-f9a0-4e0a-f50d-08d9ea1b1665
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 09:20:31.2620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgGgt19aDJy0ZMwJxtLo9b6rDbdhlZTy6Qyy9kYcodErW1Nwk7q4/2oShOG1AtzKf/iDUyHuO+fsYVyMiiTJDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3612

On 04.02.2022 22:54, George Dunlap wrote:
> On Mon, Jul 5, 2021 at 5:05 PM Jan Beulich <jbeulich@suse.com> wrote:
> --- a/xen/arch/x86/mm/p2m.c
>> +++ b/xen/arch/x86/mm/p2m.c
>> @@ -788,8 +788,8 @@ void p2m_final_teardown(struct domain *d
>>  #ifdef CONFIG_HVM
>>
>>  static int __must_check
>> -p2m_remove_page(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
>> -                unsigned int page_order)
>> +p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
>> +                 unsigned int page_order)
>>
> 
> One question that's naturally raised for both this and the following patch
> is, what is the new naming "scheme" for these renamed functions, and how do
> they relate to the old scheme?
> 
> Overall it seems like the intention is that "guest_physmap_..." can be
> called on a domain which may be PV or HVM, while "p2m_..." should only be
> called on HVM domains.

Yes. I think by the end of the series all p2m_...() named functions
pertain to HVM domains only.

> There's also "..._entry" vs "..._page".  Is the p2m_remove_page /
> p2m_remove_entry distinction have a meaning, and is it the same meaning as
> guest_physmap_add_page / guest_physmap_add_entry?

In the next patch a pair p2m_{add,remove}_page() is introduced.
p2m_remove_entry() remains a static helper for the latter of the two,
assuming the GFN is already locked. I've used the "page" vs "entry" in
the names just like it was used prior to patch 2; I'd be happy to take
suggestions on what else could be used in place of "entry" (but I'd
like to stick to "page").

Jan


