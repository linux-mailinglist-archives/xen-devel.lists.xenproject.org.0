Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C195C5A0B62
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 10:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393158.631932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR8An-0005Ed-Ms; Thu, 25 Aug 2022 08:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393158.631932; Thu, 25 Aug 2022 08:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR8An-0005Bj-Ji; Thu, 25 Aug 2022 08:25:09 +0000
Received: by outflank-mailman (input) for mailman id 393158;
 Thu, 25 Aug 2022 08:25:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oR8Ak-0005Bd-Uh
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 08:25:07 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150087.outbound.protection.outlook.com [40.107.15.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bf3f608-244f-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 10:25:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9113.eurprd04.prod.outlook.com (2603:10a6:10:2f4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 08:25:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 08:25:02 +0000
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
X-Inumbo-ID: 6bf3f608-244f-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiBwCMALjDEEeY/xh6JUVugeb5l50zKRpoWwN04XkADs+D2EDUV0UXUGnWauQSmukNjTs7rh/xWWOJ2ojmEF2kLKCjUCQF6BOgU+MgG0TOrlJXlKUo7AoCts9hxXjheHNm2Rv79cORqfzO4i3kIZQgC/y9Y9PcYYDOLHNlHxqCwRpnfOEGh4YJDx5y0yGEjJsxqF9wMsz6kd6qvHqsGdjdp33mJ9L0px6KL0HyRVWWSFPsEbw1LEA94XQn8/np5enDehNPidhzQgCHTe67ZJQSBZtla7XoC1GgN/lQGUvmbN4faP5QQWqUqX0m2bVzOeXGTs7eLIjlZmCcdNUMKIww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hU8b9h4Pm5djiD1yho7zHS4U7eIBozg9RB4hpeNkgeU=;
 b=fhM+j9lajQYXoMg8HY1Av2l+/U1Z9w2xP4ihEoAOPZaE6GSGoxT7D3oXgsUScyONCh7jS1WNuAiDLa9s7RE6o65abxWEZh+aMMCoKNdyj9o8wCS8s1W4CK5pTHvKH9jvTO46XAlP/X8FZ9r+meUJWPwNrcAMLBkYTWa8Lz+DDtlLEWUf99oheOC49+DgS98rTCoS/stRu3HzlY3KBp/vdcEHyVRQT3LE7ABMJrBIU2igAP2sc4LvyZQ2RtdZ98JIzVG0xkADiBTqEuznHlECU/z+/DH3QFQ9ePJyf5Y+uTnZJk78lMYuSSv44PBGARFJK/YBtZOIgPKyjM35JV7IaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hU8b9h4Pm5djiD1yho7zHS4U7eIBozg9RB4hpeNkgeU=;
 b=Mc9tK6no7UWIXEbQ2X/FkulUggb061lRz71xnS5CYA2cgFZ2eJZLX1vF9bow+MRbfdNqcZ3Erf27vhkXDEJFnZvXCehlTRrboMDkqyz1OSoCStf+IcZAcHQpWmu9Wq8pFdt/IRyvuCRD17QECWA5joot5ooFM/d40y+aqKZFhBBCro6Zy3N3acNIHlHcHt5YxNsA4UC2lcJwovAPee18IqfO6SGXeCd8VUv0/clIsHqMSvQtsk8m+bFmbp5Ayjegyyw802tre6aq+k3cYLCPn9/FAFzLCRK5ZRBzB5+UAf2NFk5pEWW5w7i2ptkvroFBPpDQy6eZu2Qm3GGOgdvMpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ff949e4-5f02-f476-7b14-252252d1b8b5@suse.com>
Date: Thu, 25 Aug 2022 10:25:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 7/7] xen/device_tree: Fix MISRA C 2012 Rule 20.7
 violations
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
 <20220819194359.1196539-8-burzalodowa@gmail.com>
 <9b053c3f-0274-a63b-2a6b-a1715c639092@suse.com>
 <25e4c770-9b97-a96d-5f5a-fea815bf9737@gmail.com>
 <7d32d3d3-daa6-5492-02fb-db6ca5f154c9@suse.com>
 <852c68d0-bda1-e56e-85c0-500c498054a0@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <852c68d0-bda1-e56e-85c0-500c498054a0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9e42a2c-15f5-4c62-7532-08da86734e8d
X-MS-TrafficTypeDiagnostic: DU2PR04MB9113:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+mSzylx7JlU3AktNtzj0KCDEqTJjbpbKimmRcDvH2/T4mNfwDVGrHVXS5s+7TJIRrEB1gMmXOPJNIyexWfc8Yo3Oicjfq0a4GOA6k9NsgYZOJL0ywCwbdhXgGuS6m6YSwYBLbkp7RC7jBUIcXp2La7OxRvzd7F+pvr187EfxHisTwQO0FffByMfWEgZl5Mf1WhDM3nInPh8ezln3wF4JTfE0XvsXjUHw9+8t9mDXOZH27lQiQpq+JD7BGtqIojk8MOVR1/8Mw/JvhZEVQiIWE3+qzaKoY5jA6lKO1qFSQniZm/Zgr1ulpnZ+dkzSkLEwIasQYyz4DDR5YLl7DSUijG2M/ziAqBniONd30TnMum2hRPpJzq6QKaH2/paq1yxw6yHZhXyUFalzGymfXCojshONdc7q5s+4r23qbZ3V3BH5VImY29Sl1dDtgFM/ZmYkCvVf8JruqGWX+apnVSR3xC2c2VvCOB1Ito55wOyFTYHB4m90J9rBGPJVv8urhK54xhdReF9FR7DKbYsKHK+fjGqPOPd2nmHQ7dMOYoDTCdYteeR/Vafyu1fJxxZ7oLJ2T3CoTbujdjIWdxbphvREU01QXbw/MBBWqeiORwP9XLI9G51dQQS0M6K1GmuZiVGZ5DnLANDWFMq4DG6Mqj3I269lGjE6vKeF2pUgs6AS4InmI3GMymrlSi/TwKwsqg6vpWjbULd+f+tn9H0Iy0FAy/7gytfdS/8j/IgIXp+qXnP3qEnoOFglYcEX+LTkJEfESrdodDt5Xe4UoeIzfXRZLxkz3Gooi0xa0OYT/1qubss=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(136003)(366004)(346002)(396003)(38100700002)(54906003)(53546011)(86362001)(4326008)(31696002)(41300700001)(6506007)(66476007)(8676002)(66556008)(66946007)(316002)(26005)(6512007)(5660300002)(8936002)(36756003)(6916009)(478600001)(31686004)(186003)(2616005)(6486002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEI2dWRMS2NmaUd0enJTdndHWEJHdmpmUFRFdzRTL2ZXSVZqd3NCWWVTbHkr?=
 =?utf-8?B?dzZRN0JHNHBGV2dmZmVGcmRHUW1XVnF0UUJmbmwvSUZQQmYxSkF4aWc1TWtr?=
 =?utf-8?B?bUVQZ0NVZjBXN0VIZmZMWitPNm9yd00va0ZkWkE5RWtyQk9qdHQvV2VKZGEv?=
 =?utf-8?B?YUxSYmZ3a3J5d2VKbFVrckxJRFM0L1lvcW5mWjV2eit5N1lsQVFySS8vUlNh?=
 =?utf-8?B?dUNLejl3QUlLczdVZEp1SUsrV1I3N0g2Qkh4VzVTZVlmTkJTUmNuYU1sRGVz?=
 =?utf-8?B?cWEzRXgxanVPdVByamhpcnQvekZBdjl4WEtQN3dHdnJpSWw0T3FUK1doQTJT?=
 =?utf-8?B?TmhDcjlFLy9YZEpSTGJxWDlRU0hzSWxuY1ZjZTV0R0xHOWRQWDNmaW1URVZX?=
 =?utf-8?B?L2RXNkJ3S2xRejl6NDZ2L1FlOTlsK3dGUjZnbTlpSW5wNDBWSW9xbElkWCtN?=
 =?utf-8?B?bzd3bHVoM29WVWM5S1g1OWU5amVGRHJFSnlBL3ZJZnB2bXc0SlBIZnYvazV3?=
 =?utf-8?B?YWQ4MGliUTZtNk02OVFTZk9IQ25jSUZSQ2ZZOVRaN2RaWFIrcElYd2xUc01j?=
 =?utf-8?B?dFB6bksxZTEyVUl5OHRjWkNwOWtjQTNwcmRqbUxwVVpjWGQrM0RPb0xqV3E3?=
 =?utf-8?B?bVViWi95aTdwZGhvRlJaN2VWaTJONzUxeDNzYmY0RHp6QlgyN0ZTY0Ezajc0?=
 =?utf-8?B?bDNxZGFyQ3cyTmFDdG9iNGFmVFNwZ2hmWHdoVThQc3JkMk00N0xaZDV4RkJU?=
 =?utf-8?B?NjRsazFuaFF2SjN2N2pGSEdFYVJyOXNvOGVkb2FiWitONithL29IYmJNaGZF?=
 =?utf-8?B?c1R1djRyTFVrZDBTbzBxbnJqTmJNQ3h6UHZaQ2o1T3J0OEZNWTB1bXJHNTd5?=
 =?utf-8?B?MUFBekdkUXBvSW1GTXZkM21CbUZpM05pUUlNWWhhZ3ExZGtYN2hiaHhMWTd2?=
 =?utf-8?B?UmVIOThjWnZkN3VXOVArclU0amJ6TjJPd2xRVHJZOXFEUGdCLzc0bXl0YXBr?=
 =?utf-8?B?NW1jWk5zZlljdVY3clpMZXExNENzYkl4eEVYTmxIYUxjWlpmWnN0M3V5Y3Vr?=
 =?utf-8?B?emdkVTRpSUk1Y1lwOVQ0L056OXZQb1VRbDlSUTU4dm5pNzFvRnM0SEhaSm1u?=
 =?utf-8?B?TCtRL1c0cFEyZlJzci81SGJVWVc5N0dkNzZieTBPYnlHL29tcCtnS3gwY0ZQ?=
 =?utf-8?B?VDdHNnB4U0pHSUVXb0NDVEQ3TE1admc2TlUwRDhBZEhqczk1M0pPcjNoU2lM?=
 =?utf-8?B?SzFUaEd5b0wxeGNJeVZEdThtMzd2dGZQSHFrZjFTZXBiUWtqTS90RjFDLzFG?=
 =?utf-8?B?UVVHakZqNUc3dklKMGpYd2l3cXZiZ3FrWllneUg1SHVpVG42QWMxVWFoZlM2?=
 =?utf-8?B?bHRFNFo0RTJUcGZtV1JNTFpoeEFYa3ZOSG05SDdScm1RNXF1dWhCUWJ5Um9G?=
 =?utf-8?B?L3NyWUFYVVc3TXNVT3dobjNyekI4OTU0SkFoUmdEb1ZGR01QWVFkL2tjRENM?=
 =?utf-8?B?eDUrN0c0V0RhWTQraENJUGdxVDBGMW1WUUV5RlJIMjR1bEdEa251WVJFZlJj?=
 =?utf-8?B?NVN3VGxzMGJFRHVoQWptMWc5MXFXRTloZVRNVXRTbU5FVkVVanptUEwrLzRO?=
 =?utf-8?B?Mk8yaERLaG54Q05EYjBJNEt3d0tnaFJLejNncFR0Z1J6SU5nUU44d1l1KzhF?=
 =?utf-8?B?VUFxQ1hZdmE1cjVGeXUxTkVySW90SjUyemhZL3N3c1VNbVpJWUFiUWJFeEdS?=
 =?utf-8?B?MnJMWHlyeHNIalUxaWZKSlMwZjYwZ1FwT1BYL1VHamxvcGJSVG02dm9kTVJR?=
 =?utf-8?B?THlYclFCSHhHb0FBNHJNaGNzcEVoUWZ1aTBKSlVtSkdOVkhvYW9ZYmlZZHZL?=
 =?utf-8?B?OUZxZUo2WENiNlZaT3RCZVhIZFdyLzlvR3hXV2Y3R0liNEp0dDRmOW1LNkZP?=
 =?utf-8?B?WkxlbHFOcXJCemUzdGIrZnVnRE02ZWpuMnhRTHJDclVLOEYrMnJsS0tlUE5q?=
 =?utf-8?B?RW9NdUNSRUxSN0VVUDZweXdFNnFpbFVKdjJObXl2cnVpTXUyTE9MN3V2czJn?=
 =?utf-8?B?eWNFSzhrS0NBazBEZWVKSk9aTkYrOTVjRi9GU3R6aEd2bHNkeVl0cTBEWFBU?=
 =?utf-8?Q?AY0hZkZYSDRm+WsANz7kRQu8e?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e42a2c-15f5-4c62-7532-08da86734e8d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 08:25:02.5007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8VndNdtAAMOxVgTwoVO8CFtyY4YxaVlzJdkqTHH5cYvHIeC4qO/Np0tQZDR6KhiDFWU2Xr4Y3puEOZYbq7ZyBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9113

On 25.08.2022 10:02, Xenia Ragiadakou wrote:
> On 8/22/22 14:48, Jan Beulich wrote:
>> On 22.08.2022 12:43, Xenia Ragiadakou wrote:
>>> On 8/22/22 12:59, Jan Beulich wrote:
>>>> On 19.08.2022 21:43, Xenia Ragiadakou wrote:
>>>>> In macros dt_for_each_property_node(), dt_for_each_device_node() and
>>>>> dt_for_each_child_node(), add parentheses around the macro parameters that
>>>>> have the arrow operator applied, to prevent against unintended expansions.
>>>>
>>>> Why is this relevant only when -> is used? For comparisons and the rhs of
>>>> assignments it's as relevant, ad even for the lhs of assignments I doubt
>>>> it can be generally omitted.
>>>
>>> Yes, I agree with you but some older patches that I sent that were
>>> adding parentheses around the lhs of the assignments were not accepted
>>> and I thought that the rhs of the assignments as well these comparisons
>>> fall to the same category.
>>>
>>> Personally, I would expect to see parentheses, also, around the macro
>>> parameters that are used as the lhs or the rhs of assignments, the
>>> operands of comparison or the arguments of a function.
>>> Not only because they can prevent against unintentional bugs but because
>>> the parentheses help me to identify more easily the macro parameters
>>> when reading a macro definition. I totally understand that for other
>>> people parentheses may reduce readability.
>>
>> Afair Julien's comments were very specific to the lhs of assignments.
>> So at the very least everything else ought to be parenthesized imo.
>>
> 
> So, IIUC, the only deviations from the MISRA C 2012 Rule 20.7 will be 
> for macro parameters used as the lhs of assignments and function arguments?

Afaic I don't consider that discussion settled.

> This feels a bit of a hack to parenthesize the macro parameters that are 
> used as the rhs of an assignment but not those used as the lhs.

lhs and rhs of assignments are quite different, and hence making such a
distinction wouldn't look to be a "hack" to me. In fact I've always
considered this part of the language somewhat strange: To me
parenthesizing e.g. an identifier already makes it (visually) an
rvalue. Leaving aside odd (and easy to spot as odd) uses at the call
sizes, I don't think I can come up with a case where parentheses are
really needed. Anything needing parenthesizing actually yields an
rvalue afaics, thus causing a diagnostic anyway.

>  From previous discussions on the topic, I understood that the 
> parentheses are considered needed only when they eliminate operator 
> precedence problems, while for the wrong parameter format bugs we can 
> rely on the reviewers.
> 
> I think we need to decide if the rule will be applied as is and if not 
> which will be the deviations along with their justification and add it 
> to the document.

Yes. But this shouldn't hinder adjustments for all other, non-
controversial cases.

Jan

