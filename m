Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A74167CF688
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:20:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619217.963933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtR4I-0004nB-Is; Thu, 19 Oct 2023 11:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619217.963933; Thu, 19 Oct 2023 11:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtR4I-0004kv-G4; Thu, 19 Oct 2023 11:19:58 +0000
Received: by outflank-mailman (input) for mailman id 619217;
 Thu, 19 Oct 2023 11:19:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtR4H-0004kf-7V
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:19:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e7ed979-6e71-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 13:19:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9069.eurprd04.prod.outlook.com (2603:10a6:150:20::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Thu, 19 Oct
 2023 11:19:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:19:52 +0000
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
X-Inumbo-ID: 6e7ed979-6e71-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATjgnNZuoVLxeUDmdH+WdVrjLmmt3ZDv56+Av3gSNRNNtGpuotLIQf5mlELfTuZYOUiAOdXsDLqUhcav1KaXtPkqCYnYMvFb2lHMhGbcfFJ3MMfqdDZsUaAEw7Xu4ntBlrFntdtiBkn84+60dZRrshk7IozyIY46squMho9cx2j2S2I/UjngKJ0vLHHmbKOFUNkllr45leyyUMyVUhP3KukxhHzls/j4djQb/Y8OFPsjVU/TM6cCEj67bb9bKChLR0jK2HLOi8+i+klNp2yJQiRv9NRH7ekTU/ujRxFi4YhWeYuEJCjoI09/8Nv/bxTsjHk8S2to28sbz/ikKRpl4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJnRviuH5kVqzhbJRUDVKYJ0B7nGICAbdQehwGjRISk=;
 b=GfwHySPyZeG2mSi/I3LzzGHAuO5SK21aCXJ8UmHYhnvz5Dc4UgeUsKQKsnEbeZtXwnAOCNVyoGurqZfgwOQMi0Wu7rxMzNYgT5Z4xGEvMJZPjl3MQBoVnmXAmJp8+sS/jQz26ABBxdZrfyiW/uhFZpSWJwzpwksWnn+NrJI7NnJ5qTalKvSxMiL74ArGqr8acC6S5FfGkKbfGyyXDHbTGl9/3HPMko4JqJ14ER1syqKmQkdYzZc56WJJgg8Hk3LPe04xPERWcAEIXQMhzhY2ezolf2+lBOjSh/qbV7+YBUx38fHmTsIazkfJ9DjDKVSAEjcQvE0gXCD8h5JoMcGmtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJnRviuH5kVqzhbJRUDVKYJ0B7nGICAbdQehwGjRISk=;
 b=y/dBMDyJ9wWMVD1kQZqaTPOIvL9KIFpDaK7oCyE9B71NSR4/9n01EBNoH0mXjjXBV/6RFf979tPHumFs++BXRBeNoBO75paOoZLXwU7wrgWYuxRzuCNqw3euc7SgDSeKQ0NyAHemqqp2eOS9d/Yb3ZhlwSr5vl3hwuLsH1AATqjilyStBJM8xHmsZI1gSqDJBgQ3LuQp3AL1R+JbWNzTW6MM57Hpr0cdASGeHhLn6yd/hLU57Re1paaUNH18L84OPEwgMTiQgkrTZ4ijVwtOoYJRCturDk0yM31QNM3AC3Zut3S/KqijwgkEpD6bpeEXRyRgBWXCHEYn//qGwVCLJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5c9b851f-6f64-f6bd-970a-63aefdab5b41@suse.com>
Date: Thu, 19 Oct 2023 13:19:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 4/4] xen: address violations of MISRA C:2012 Rule 13.1
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <1e0f12095bcbc82ae3585c9fcf57bec7e324049c.1697638210.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2310181803351.965337@ubuntu-linux-20-04-desktop>
 <78a7b73a-fefb-6884-90c5-abad2860a521@suse.com>
 <27fcfc87-aa8f-4bfb-863a-91a75c763050@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <27fcfc87-aa8f-4bfb-863a-91a75c763050@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9069:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf5d81d-6121-4d4f-e659-08dbd095504b
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kT8hT/5D5bs5NMNKyHzdlCVQRnC20oQrBTdnKiD4B5AY0uB/WZkyNNizmhu89sNNQHf4D+CHf+eigHM0StLCyIvtlbJSd3Ec8eZ4gD/Ut55tNKrVKuZpVeN/r/hQyDtwjSELOAWjv9rqPkIV8Gsqo7tV7QVGBS3IT7J0q2xd8cv/vZwJSMrPfiLN0BLC4HghV2hkGlzb/BP6RLB+Cnt4v5rih6oJliZFRebBUgdIHT0DL8LMJfSx+s/t61VNQbnpJQ3a4CjndCWY3b5JoYF/yKddAYLyiD5DhXFhbETgkLe0la8UZhCwqBq9Md7p4Q/TpL54vvSehczLW+3R7SXcjRthqZSy0xIf6XaM6aNiW3ak24v5BspzCLv0Z53ZVZe1xJKdeS5a1gqckAbW0If2OHr4ZTXyXxRoWDNjGSkNe/slnxIPoMehuVT/MKLER3gD29a1pT4FbSdY9b1T5JAu/VlMoPfY57eezku4xKLiCl2T+3SiGM6kQd4oLjEyv/RF8zDyZ9OedVvs/8wPlrhJyA7b8Ty6SPhfQyzmnpl1csZSbqGZYIj6k2uYPBY152wyG7kSxrfigK+8cRDYt+dH0uDlFpbT2vRgc8ILrbIeLpgte1e/l4tCiUiKaefxHrKQaCXqK/Lkemf8sivVRn6nLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(136003)(396003)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(2906002)(5660300002)(4326008)(6916009)(54906003)(66476007)(66946007)(8936002)(66556008)(316002)(6666004)(478600001)(6486002)(8676002)(41300700001)(36756003)(86362001)(31696002)(38100700002)(2616005)(53546011)(6506007)(83380400001)(26005)(6512007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlJvVVhkRlRDTEVOSWg1VXNVVTkyVWF4cnlpVGlKOTB1THlvN2F5MzY4c1dN?=
 =?utf-8?B?dXZQamY1UFhwbjhOVzdvaEV1Z0Vvbnk2MHByQ3JCRS80SmViengvaG55Rmtn?=
 =?utf-8?B?dDRMc2gwSUVQSlFhekZ1NVliZWFlYUx2L09OVHJIekFKRU1JM2FteWh2aVNx?=
 =?utf-8?B?Q1pvK3p3SWlmUGRTdVhyaTludWxiTVZrdWVJNENmWCttNk1rWlZZZFNjQTZY?=
 =?utf-8?B?OEFPS0d1bzNCb1QyZFErdXBoOW9LM3kvVU1lRnFEcTJHQjdMTGJVOFpRblhn?=
 =?utf-8?B?NUt1cENUZ21lUmwyWjVhWmUzV3NON2VIRHh2dlI0bFBmYkNMYVpJMndMNFc5?=
 =?utf-8?B?Ny9abUNGVHYzVnNjb0xCTlRTR2lSSFZDMFpFMnZPNit5Q0IzR0NPNzhLMkxW?=
 =?utf-8?B?dXFMU2F6UDdxK3h5bzhVcUdZQm1yeGVueS94ZEFjZCtHU0xpY2pOZDhBdmtU?=
 =?utf-8?B?SHBrbEVIb1AwT0FQbFRBL0JjazNLK0hWYWQrMEorTmlvdGR0cEhPK2k5SXM4?=
 =?utf-8?B?aGVoaGdlcURPYjY3aWhrQU94SmVoeW4vb1VhbmdYY1pIRytxaEpSRXMvdXZ5?=
 =?utf-8?B?S2c5dFp5VGxuYTJtOGY1NVFBUTYvMmdEeW1jTHNkRlhHdHR4bHFhVHUwMkpL?=
 =?utf-8?B?aWt5VnFmNFZ3K2RSOEdwMzg0Z1hQWEJyalpCckIwc3dYZ2VsZmxqU1FJUVhm?=
 =?utf-8?B?dC8wOFl3Sk1ZZGFYUHNwT1hCdjFKbEtqczBYL3pTZm9HTGo4cEtlcVhiemFF?=
 =?utf-8?B?eGovdzN5N1M2OTdSdHpuMWJleDQ0ZG84OGFNZDFRdFpaanFBWTVlUm9kTGZs?=
 =?utf-8?B?U29USlpHLzhSai96eTkrdVIwdnNvSFp4bjNYRm8vSkU2TEFXT0xGRVdiZUNN?=
 =?utf-8?B?UVI1allqRVZkMnErUVdhMGwwMFZOcWpZekJYOHRVWmVwNnBQYmpIMHdEcERX?=
 =?utf-8?B?amFXOUVOSjNTWkFoa1hTeFQ4SC9hSTl0WXNRbm83bXhUc21zTmg3aVVuNHAy?=
 =?utf-8?B?a3hvSVVPdzIwL2k4R0p0Z0pac0t6L2ZLRlFKcGFBRXlqdzFTdkJZS1lPL2FX?=
 =?utf-8?B?NWxQVzlqRCtFQzNpeVQvUnVlalNIV00zRWU4dnJGVVgyMDJWSkgrT2JtRkxF?=
 =?utf-8?B?YjNRYTdtZjFMNDFjSmM2VWFQSFZMeWI2VzZjRDY1cVdkYkluNi93S003c2l4?=
 =?utf-8?B?eGZDM2d2MXZMYUJwTytSZm1WWStMYzdtZ0krVmY4M0R1b3o0TENhd0NQclBN?=
 =?utf-8?B?UW9TQWE4VGNmUDREYUpWM1ZEczF5UU45eStMWHh1ajM1UkRVb0RyV2dHWU5l?=
 =?utf-8?B?MWZDZEYrMm1ONUV2TU4vd3Zmd3R4MC9jZ1R0b0J4dVN4RS9oS3ovZjg2ZHJv?=
 =?utf-8?B?ZU5aVlBuZG9weWJ3ck1yVHkydC8yOFJwOUFTZWx0cmF2YUQzZHpaejNIc0Ew?=
 =?utf-8?B?V2phYkZ2WWJKUU1uMThjMVdnbHlZUENld2ZjYnVaZDM3dXY0cTJpOEdUZmNM?=
 =?utf-8?B?by9RTUFzWXJra1Nnb1RVTmRvZFBhdDZrdEdMQTBCdko0UlRWeVVCS1Z5Z0dz?=
 =?utf-8?B?dkVIL1hnbFE1UFEzQnZoK01qb1MwelBtMzFrZ2hza1MxZHNKTjNIRCtGM2Jk?=
 =?utf-8?B?SWkxZDRKb096S2tNYjdKODNiSWRUeldXNklEOTFaMnpPSUNwS3ZMT3I2TEZn?=
 =?utf-8?B?WkpZUy82UmsxUFlIdURvYU1vVllzZXJKU2hnSWxrWEZKU2pXblhnc24vUVRS?=
 =?utf-8?B?Qm15RFF1SXBUczM1cVF3OWN6WTd0bkZjNTFpRFgyOXdHRndNY2JLU0FjRTE4?=
 =?utf-8?B?MkZEeEFmdkpLUnhpanhPaEt3cWZTZE1MY1FpMVVrclU4VHo1VWQwbkd6dlFQ?=
 =?utf-8?B?NkxwYzYrcVdqbkhXN2lRNUI4TWZKVEcxWC9SUW4vQnRzY2xiRTdhMC9VNkll?=
 =?utf-8?B?T3p5M1I2ZTB1OG1lN1pkU2c2ek5OQlN1ZnI1NjZFcGc5a3pqV2xBNnRPYis1?=
 =?utf-8?B?cWdPM25pRnVEVUF5RVlRZ1lLUE0wMUJtWEhlWlZYeDV0REtRcDZ5MGdnT0xK?=
 =?utf-8?B?bWIxN1FHdjhsUlFiVWJGdzhqY1JUMms5QUhZNEt6Qml3WSs5MWFveUZPaWor?=
 =?utf-8?Q?k4VdR+yWDKSGdHHPPMkXkq3UM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf5d81d-6121-4d4f-e659-08dbd095504b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:19:51.9970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +SO70PeeAIbtd+Ryyl0BCt1Dnv5Fe+9Z8nRKoF53NTMAzm9hjjJCxscqpjFfpbZVRSdZs0jP192si8o+wehZCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9069

On 19.10.2023 13:12, Simone Ballarin wrote:
> On 19/10/23 11:35, Jan Beulich wrote:
>> On 19.10.2023 03:06, Stefano Stabellini wrote:
>>> On Wed, 18 Oct 2023, Simone Ballarin wrote:
>>>> --- a/xen/common/sched/core.c
>>>> +++ b/xen/common/sched/core.c
>>>> @@ -1504,6 +1504,8 @@ long vcpu_yield(void)
>>>>   {
>>>>       struct vcpu * v=current;
>>>>       spinlock_t *lock;
>>>> +    domid_t domain_id;
>>>> +    int vcpu_id;
>>>>   
>>>>       rcu_read_lock(&sched_res_rculock);
>>>>   
>>>> @@ -1515,7 +1517,9 @@ long vcpu_yield(void)
>>>>   
>>>>       SCHED_STAT_CRANK(vcpu_yield);
>>>>   
>>>> -    TRACE_2D(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
>>>> +    domain_id = current->domain->domain_id;
>>>> +    vcpu_id = current->vcpu_id;
>>>> +    TRACE_2D(TRC_SCHED_YIELD, domain_id, vcpu_id);
>>>
>>> Also here it looks like accessing the current pointer is considered a
>>> side effect. Why? This is a just a global variable that is only accessed
>>> for reading.
>>
>> Not exactly. It's a per-CPU variable access on Arm, but involves a
>> function call on x86. Still that function call has no other side
>> effects, but I guess Misra wouldn't honor this.
>>
>> I'm afraid though that the suggested change violates rule 2.2, as
>> the two new assignments are dead code when !CONFIG_TRACEBUFFER.
> 
> I confirm that there is no problem in X86: I will simply propose a patch
> adding __attribute_pure__ to get_cpu_info.

I specifically did not suggest that, because I'm afraid the "pure" attribute
may not be used there. Besides this attribute typically being discarded for
inline functions in favor of the compiler's own judgement, it would allow
the compiler to squash multiple invocations. This might even be desirable in
most cases, but would break across a stack pointer change. (In this context
you also need to keep in mind late optimizations done by LTO.)

Jan

