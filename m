Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7530A401CB7
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 15:59:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179960.326418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNF99-00050H-8D; Mon, 06 Sep 2021 13:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179960.326418; Mon, 06 Sep 2021 13:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNF99-0004xH-4R; Mon, 06 Sep 2021 13:58:51 +0000
Received: by outflank-mailman (input) for mailman id 179960;
 Mon, 06 Sep 2021 13:58:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNF97-0004xB-Id
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 13:58:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c5d87d3-169e-4820-a44f-fba01049b859;
 Mon, 06 Sep 2021 13:58:48 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-ebv1iwU3NkmyAHjdTbZQbw-1; Mon, 06 Sep 2021 15:58:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2959.eurprd04.prod.outlook.com (2603:10a6:802:8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Mon, 6 Sep
 2021 13:58:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 13:58:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0006.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.20 via Frontend Transport; Mon, 6 Sep 2021 13:58:43 +0000
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
X-Inumbo-ID: 3c5d87d3-169e-4820-a44f-fba01049b859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630936727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NbkbrBJpOYpfUoH/UPnckwv83IdFu2ZkE2MCOi9Y3VM=;
	b=Xvht80B43TV1ig1AtxQm6jmmM554MiLTs7KrlmURg5TbLXImbcjfZVj46m8IWWQYqQg+1A
	FM62FqyYr568RsoBVJzK4Yw9MDuUouw+eITYRkGFq2lZAKS3fBy+hb9cW+Q6fix5YllquE
	1OUgUCN+nGh0lReYH3lVa+65QBXWAIU=
X-MC-Unique: ebv1iwU3NkmyAHjdTbZQbw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/98m7EE/vaNsWFlRjnTFXQoozQBocGC/8V4/k1orNkAwjibJQRUp1lDNnNb2sM52VEyzBFGnzyx3QmloZCpQ2FFL9p0YfyB3R/Lr/bAJ8SaS3AiUYagria4SHQDKFcH47deVEs9B+8djyjpj7pFxFDkDx64jOYz7vOQiuuprJozH/Q25MwlqCRGfy3rQziH+eEtNuapug0S92GLuSZYEL8M+llktfVwleylnaNUcIyclb3kV13Ep43hHrdsqnTSAklUl5bKCJEl/fjcnal9kdH38HZNQqyZesAXKBSIAX02esRoDIVqrCMKQeFeEWJZ30PyAlRaQ5Y4W2r6H7XaPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NbkbrBJpOYpfUoH/UPnckwv83IdFu2ZkE2MCOi9Y3VM=;
 b=LcfZQPEIjveA2wV8SuJFoXoXOTqnZsbfYKCcp8qmggsRYlFe+QntvsRYM83YnWImj+kgqcVWfBL/Z58FEzzce5ym1fpXneVxzQS4xQtwOb5oNAARzr8Wwj6USSs/SbvJ3kKRmE4ALiynacV6TXkBkdqvEX1KEf3UCCt+DYMYKT0tnpEtr5gPTuRog+Q8edCs5c23IM+mRT54/6PfInnmVt/Vur4xBu3H0xy/8b/n5HEpTR7kI9ruGm7cO+DJuGUIYhc3VzoVOwVUKtlz0L249s2B5lWE1y+iIGRh6xDvUrFgWD9OUkivCGor69eVANoAyCKJENV2Kbhg7zzNTKLiXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/9] gnttab: defer allocation of maptrack frames table
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <062bcbd3-420e-e1c0-3aa0-0dfb229e6ae9@suse.com>
 <7b8fba1a-767e-87f8-d0eb-5af5e5427bb4@xen.org>
 <60acd486-1641-6db4-4451-247edcc11522@suse.com>
 <26669864-09e2-a026-67f6-1f6dc48267db@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9fa952e9-086a-559f-bcd6-b1630e3bf5fe@suse.com>
Date: Mon, 6 Sep 2021 15:58:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <26669864-09e2-a026-67f6-1f6dc48267db@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0006.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f102340-cc8a-43f3-a1ab-08d9713e70a6
X-MS-TrafficTypeDiagnostic: VI1PR04MB2959:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2959926C84B7B9B43B79F474B3D29@VI1PR04MB2959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GQpnch5kMXUBIn+0QNlyeh3YgQCxaGY/x8tjjta1c77M+32qhRQ/Q6z82VGuSxHmEmQJPH2xKR436cz4rXUsoDG7wPi545QnWSWH4vCStNC7s/PY5Q/BheJezpMN50tbfFiw4T/A8oXK+LwfLxL4ImwEW3Hz16uSLYoQszaSS9seE8aUypQQivHb2MXjajRvM9zkcU4iyYLMI0bq6oNz6bFymGwauAyRz61K4xfLWsUfzWiwEhFexoGPNrGMYkSgW5Qw56jhg5IIVhi1gRJD/aOKiyZats1Yvx0UEBYsvy7mL2T05fLOzMBu8Utv3gFQF0AVrTOlZ+JK1OC2J+CwCrGeluCrVoA0Y98tvgTXcfrrc/S7raEgw/QasHQ7wbWjgZpksF++COw+uCCd9ywc72wsEE/u7qI+KoJge/FciHpe3lnrYdPrDThMHP06D+FI7UHQuVqxpBJFj4zix06BwzCjQxorgvkK4pN3FWTvlSuYBE3d0uRD9PXIhJIfguyhUbXzriLsJYFYMGIza8m8McsdPTlY1uixq3ydWQMjKKtXq0xD5HPV6tdnpCHBf835nMwazDLZY2mPJwDpceJoPqaeDfx1UWe2lSHtFzYhVfv+d/ugdazig3GEjG+ZzRL/TA5Q0C7zygNTmNbvACfugGaFMAWavnXMe/Bsa5cIywSRs6Iqj/hl9pCiNaEu3FV/6GIUtVTG7DiO03xoMMsgmcUqXFL9/QTR/sjDN5EOBFU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(54906003)(36756003)(38100700002)(16576012)(66556008)(66476007)(508600001)(83380400001)(6916009)(86362001)(2906002)(6486002)(66946007)(8936002)(26005)(5660300002)(186003)(8676002)(31696002)(31686004)(53546011)(956004)(2616005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHF3ejdMYlRGOFZ4VzZLbEg0WDRlWEpBZlhzQVNpKzlydXhxdUdJQkl2TXk4?=
 =?utf-8?B?d0oyUjN4UjhFODlyb0dxSURQazNNQTNLMC9XTGc1dGtKdHA4b09BZnQ2cHZj?=
 =?utf-8?B?THVoTDRPc3BEYXZTRGI2MkdBK2ZhRnp6OEYwL2NQUHgrZFhMaGl4YVZVTDVn?=
 =?utf-8?B?Q3F4bDdqbFFCblBsRnhTKzhrZ2RhVXdvVGlwQkREdkVvUmdzVDEycHlXbndP?=
 =?utf-8?B?dS8zVzhBZUJLZTFBRHVJZHg1RmdTYmF4cS9xbEZGbmFmVVlocVhVSWRLdGxF?=
 =?utf-8?B?eWNBN1RsbmhJKzNNZTFSdi9wZXZNR0JrbVA0L01oQjJlUm5QcmY3YUYzMzVJ?=
 =?utf-8?B?dElwNEd1YSthTU12dzlWejdLd3VacllOT0w4c0luNXI5NzI3YWh4NkZtQUZ6?=
 =?utf-8?B?MUZDZDFXVmV5VXNXWjRTeXU1Wm5HYk1YZVdmRlVoZzQ0bGVKUUo1SUpXeHhU?=
 =?utf-8?B?ZkdJbkJHbVc2dmFVOWUvdFRVKy9vTGt1ZVlaZzB3RkxzZm1YMnVOVUlpYW1a?=
 =?utf-8?B?NVoyU08xbnhBaGcvVnNVL0Z3Rmc5RjdXakpTdXc4TUpnck1mZktkNm01VlJn?=
 =?utf-8?B?MXM0Vkp6REYwOHd4RmI0Z3lBcm8rei9QSTdRY3BvdW05TDFhdEdPa25uVnM3?=
 =?utf-8?B?NkZtZTJiTjJkSUcvZ1FVYjlUekc0bXpHcnpKT1g1SC9VOFlKMlRvTXN4NFZH?=
 =?utf-8?B?TlkzUkFmKzZobTNoYUtEYlBjOFpjNFZJNkFXdG5qNEpDWFRUUnZmK3ZNRnlF?=
 =?utf-8?B?aGhKTDc4ZTZ0RDY0T3E4d0N4Q3NEaU1McmNjdWd4bWdKbFBXN1ZzclF4bytM?=
 =?utf-8?B?T09ZNnhCcjJ1b2RjVEh2MllIRkhpNGczamFRVThXSzR5OG5PczVkbWIwVXBH?=
 =?utf-8?B?bzlZUmwrNUdadld1WUxlcUVuYVZTSDdjSWJuV2VHZGhiVU1QbDhvd0hhSmNC?=
 =?utf-8?B?TTBpci9oQTJDM3VJcEJHV3lwbXB0SGJneXh0V05pZkwwK0l1VHZNdi9PRXN0?=
 =?utf-8?B?QUFRTXd3RUtYaDM5QWI0U2Q1Qi9PUTc3Sm1NVWhFNnc5TU9EbjViTVdkTlV6?=
 =?utf-8?B?bVQ0QzNYWjYvL3pqN2R1dVRleFA4TGQycDd1QTBNVEYxSkgxdEdQeG5CNUVD?=
 =?utf-8?B?M3NGM0Y1akZwODJRT0lESlZmKzRtUWl6TktWUytqUGNVWXdMNUZCMlk4VzJX?=
 =?utf-8?B?eUtPQ0MxTEt5MmxzREZUUVNWQkUzVDFybDlMWW9icGNwaEdQVmVzNFFEOVpU?=
 =?utf-8?B?UGJScnhlWVhLNjlsbHRiSVhCOHkwMndDWVROWkY4UW9JNE8yOERQVDNJSHYz?=
 =?utf-8?B?TTJNVTkxV2VNMVl6RnAyZ0Z3OVRtUGsrRTdDMGpVS1YyMDVGVUozQnlJa243?=
 =?utf-8?B?ZGRKdUZRbHpWaEwwZUhOVEIvSDcwajgvdXBNV3VkK2pGNkhDdXVRR1NBcHR4?=
 =?utf-8?B?bUM4dm5oSWxNeC9vMm1wbXE4d2tQSHpCaHJNaGZ5aGdGdFBDWitIdEVKSGtW?=
 =?utf-8?B?QUhqeEtwdGZINEdxMlhkZjlLbjkzN213OVF1dFFBelA4blZwY09oRVVDL0lZ?=
 =?utf-8?B?QmpkNjFtb1dqelU4VThiNkgyUE9BN0pVdE5obmhQL2pKbnNMeVp3dDg2Rk9H?=
 =?utf-8?B?ZXJzajhxekh3V0dXUEFrRkJaTGdvYnhUY3ZlYVRTZE5uUVRVU0cwSElDY0hW?=
 =?utf-8?B?eElreU51OUkwTFlIaTZrRU93bGJLZHhPT1FVV043Y3pxMXFERXVXaTRCemc4?=
 =?utf-8?Q?zQP0qNiX4T1HvYfO2LeMOwufv9VXfg/BV3VVvVw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f102340-cc8a-43f3-a1ab-08d9713e70a6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 13:58:44.3974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0DeTbpVrGQo58ekRmMSxmp8ivech/v0qGO1a9wCYTEIv44fzj/IXOH4dtofQ653bjYV8mM6DxhGSsf28KOI8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2959

On 06.09.2021 15:33, Julien Grall wrote:
> On 06/09/2021 14:29, Jan Beulich wrote:
>> On 06.09.2021 15:13, Julien Grall wrote:
>>> On 26/08/2021 11:09, Jan Beulich wrote:
>>>> --- a/xen/common/grant_table.c
>>>> +++ b/xen/common/grant_table.c
>>>> @@ -633,6 +633,34 @@ get_maptrack_handle(
>>>>        if ( likely(handle != INVALID_MAPTRACK_HANDLE) )
>>>>            return handle;
>>>>    
>>>> +    if ( unlikely(!read_atomic(&lgt->maptrack)) )
>>>> +    {
>>>> +        struct grant_mapping **maptrack = NULL;
>>>> +
>>>> +        if ( lgt->max_maptrack_frames )
>>>> +            maptrack = vzalloc(lgt->max_maptrack_frames * sizeof(*maptrack));
>>>
>>> While I understand that allocating with a lock is bad idea, I don't like
>>> the fact that multiple vCPUs racing each other would result to
>>> temporarily allocate more memory.
>>>
>>> If moving the call within the lock is not a solution, would using a loop
>>> with a cmpxchg() a solution to block the other vCPU?
>>
>> As with any such loop the question then is for how long to retry. No matter
>> what (static) loop bound you choose, if you exceed it you would return an
>> error to the caller for no reason.
> 
> I was thinking to have an unbound loop. This would be no better no worth 
> than the current implementation because of the existing lock.

Not quite: Ticket locks grant access to the locked region in FIFO manner.
Such an open-coded loop wouldn't, i.e. there would be a risk of a loop
becoming (close to) infinite. Granted this is largely a theoretical risk,
but still ...

>> As to the value to store by cmpxchg() - were you thinking of some "alloc in
>> progress" marker?
> 
> Yes.
> 
>> You obviously can't store the result of the allocation
>> before actually doing the allocation, yet it is unnecessary allocations
>> that you want to avoid (i.e. to achieve your goal the allocation would need
>> to come after the cmpxchg()). A marker would further complicate the other
>> code here, even if (maybe) just slightly ...
> 
> Right, the code will be a bit more complicated (although it would not be 
> that bad if moved in a separate function...) but I feel it is better 
> than the multiple vzalloc().

It's the other way around here - to me it feels better the way I've coded
it. I don't think the risk of an actual race is overly high, the more that
this is a one time event for every domain.

Jan


