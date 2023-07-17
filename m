Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DA7756840
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 17:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564712.882346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQQl-0006M3-IS; Mon, 17 Jul 2023 15:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564712.882346; Mon, 17 Jul 2023 15:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQQl-0006K7-FM; Mon, 17 Jul 2023 15:46:35 +0000
Received: by outflank-mailman (input) for mailman id 564712;
 Mon, 17 Jul 2023 15:46:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLQQj-0006K1-Vt
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 15:46:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19bd1b15-24b9-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 17:46:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7908.eurprd04.prod.outlook.com (2603:10a6:20b:24c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 15:46:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 15:46:02 +0000
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
X-Inumbo-ID: 19bd1b15-24b9-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FR3KG2H8uR3HW5K7OV7mF/E7fTF0HW1eTVtl0ZF4bxyCLYKvk0E6SRhdPwxs8vqKcR8RVMqtzw6XfdbE0L56kdN+dpdgVB3xuVO7f80yfPI+gf3nUVcRXS93TXIC4ptOzx8hFn/c60et3OhoMMZhCvYjjUud5hwikQ2xsULcJwrztVzMFbRrn/zOg8RYLCXO8VoZKi3YGoUJwtsvk6kLXMq6OTZIyKGS7W2Q9wKNsRvF+WwpmMe0xUC4A3NDkO1yXSi17WGHaundsPdqeYHq0LTw5bfHpb3tjS/4cLMkjYtfcancHpS5KB1Ce9b5reu63gxSay+jvaHTh76j04AU6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpLexldcu4MmDHL8LiHJAOQH6PDsJ6m6CBOmsX8QNS8=;
 b=Y39lZmJgeBoedPEc4Nrv8iZTXqDUqpEkyqqfBJsLZ9AQImhgOpg0Uiad/mP7Iva12kmrhzvqw0K07RbwuMv7lgEbY+3vx3Vsrg3s3FGVLXpziu38OU/o4mSQ06iJg0XBrkT+4b33il2d97CmYmrTtMEtEY1JK2lXnd1VjX8yXPu4RPqdltpcB6JfAAusRRdvkDBeomeb35adCYD97ZDA3Zx6tpIt+R2CujhMmh7L4/7CayuEfwRqWJSNQ8sesS/zu4w1tz66HIeuqdKZZEZYbRWyRw40/GR60DRzK9ejqRfHL84nFpumHX/+8Ie5dP6OmwnCAwV7eoZJBro7EQHybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpLexldcu4MmDHL8LiHJAOQH6PDsJ6m6CBOmsX8QNS8=;
 b=ZNqJgiZk8p7CUQOLoN+AQbwT+1XRt+IeLUkAwrAM63HbV0hqdBlxfn4TAnUg44oFsdaeblia2q42a2PyBhotxKyfaGzJMfZ0wjd9WCrTs4zpWm8TK0IpB7HsoWryllPlQdkImQr1z1Oa6mSqKk+Jen/aWJ9Ja9ppuHfFj3NIetD57Gf4LwOmESESqZG4B0u4izcnk4gTaxp65r3aty/TTbPPQ91LgtfqkJ5lIj1dSFj7MtxsAchKW2v+psH+GibOT5t8GOSHomfxz4WMbNhp+P9LdinGgY6099IC+IhDUPc02zBu4qnzd7FpDLe3bjWmn1SBm7qK4aIkDp+VVa3+7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <996e3d7d-96db-2f3d-8f4e-0805a2c60a6f@suse.com>
Date: Mon, 17 Jul 2023 17:46:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized variable
 inside a macro
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
 <CB1B8DB0-7708-454D-9E73-171CA894E304@arm.com>
 <f24d12ec-3edc-5aea-f399-05ed52ec1cbc@suse.com>
 <3356b44e-a596-8cff-afd9-66bbcca53b30@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3356b44e-a596-8cff-afd9-66bbcca53b30@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f726f30-b9bb-4f68-8396-08db86dcecbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KPQ4yJbuB753Xa4HM5wsREnLpUpdBJbVgU3oKsBicPuaLcekNgS/qqzMHqcrJqLPoAoLaZFIrPBOOtVy5rY1KRO+TZW3+Tv1B5zp1JEOUEyVJN6cl0NvlAWozNwGYEYVGsDSLgBcfvo8Zu4OLTcw0n3Ug+Auawp4SGJXeG45vCxz42cajn86y82Jz8ghijK++yhl3NICN9GH5veYUYj8uoDnqQM/+xayImm0zlL6dsUHSv6di/j9ZoOjdH8QY0a+MPwd+UMxhuA5KyuZUwKGHC+Iry2CbzzP5O2SIehqjar0h+UW8yMfb47khQoUV/uaUPGRGLnxygfVlKOPBhDe0owm3Tx1yYR1lRH9vJSA/DAVcPNWiWCwJwjHVjMSlBywLKxIT/l0ppfhrToP6Qjy16xDFY/2YoRJ642ofzeoYnTqt1PT5yhxPfRVO4y7Jh9cC366yKr041JspWXVnYRgFtqcxM/s21U0U2qdmHirkIhrM/Xj3eo78dghHy3ZKzHqw33z8p174/BPu902sQuViqzSVzUeUib1zjzLL1X7xcdHgmy6Q/jfEhxTjoCpFZwpjNgtaRg0idV8DeagjLlwFfkzcmGzUoeU6BVSZ2AH1HaWPPJPP/okKdLNfv5ymtAUI45bMUSMnwfNl3BRfP3LwgVKKqZ+SV+iy+AiDZ2OTwXuYMRezC7ZlBWc8bGjbM8L7XKoC5FJCvp4oHVEV5o0AA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199021)(31686004)(31696002)(86362001)(2906002)(36756003)(7416002)(6512007)(186003)(83380400001)(6506007)(53546011)(26005)(38100700002)(6486002)(54906003)(316002)(5660300002)(66476007)(6916009)(66946007)(66556008)(2616005)(4326008)(478600001)(41300700001)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SENPa254MjhKYndWUWZvVnMyWms2cXEyVzNvTzFPdnhwazNnUUMyZzJIQTJs?=
 =?utf-8?B?ZjFIRUZyNEhyUkhBd201S0M4OW5MUmZaR1ZqdzFGdkpMZFpCbGZvOGRBOEpt?=
 =?utf-8?B?T1hmdkNqcU4xWUoyWWNQRnVvcmh2SVNiOS9yRm9KUk10S3BJbG1IaXo2bGNX?=
 =?utf-8?B?RGk1bzNtNzhQRDNEMTRRZWJxbDRZQ1NmcCtBUHhva2t1S2htMCs0bDlsUFd6?=
 =?utf-8?B?VFUrSWt5VlNweld3eFBLWUlUZzMranNLTnNiR1V0VnZBVW1hT3pUczczZEhZ?=
 =?utf-8?B?dDB0cFhOV1M5MjRTa0NXOGEyR0FZNkRXUXduT1E3c3VKN28vTHFOdE12dDRY?=
 =?utf-8?B?cER0R1FLM1BKV3NNYXFESTlkZnhES25iR0ZST2JHeDRsdnNLNVdobGQ4ZUZp?=
 =?utf-8?B?SnZGSzMwOUlCNHNPMGRONnF6ZnYxOUZYTllMRk53c0FNUVFQUDBHcFBsSmZF?=
 =?utf-8?B?MSt5by8zbitmOWhRZHQ0eEMvQUJva2lGelZxbXRDaGtmQnh6Zk1tcm91M1lo?=
 =?utf-8?B?dkJVSHpybGxhTzhWQmdHbGFhUVhaZ09MeENpcVNiK3p1TWdKOWpkQVhkd2VL?=
 =?utf-8?B?TkdlVnZnemFlNEpkckorWUduZnA0eWlDZTUrYUxRdWhWK2R2bUFwdTdVTEhV?=
 =?utf-8?B?RUh4MGRSWi9nQUN1ZjBORXd1Wmx0QmRGRHh3WWI2Z3NBYytRczlIdDg3N0Y1?=
 =?utf-8?B?OVJEcENOQjFIU1Z2R29tb2xITk81aCtOZzZTYXpoQVVLNHdlRDhJTVFrbTY0?=
 =?utf-8?B?dTRmbEQ5RmVyYnFHVGt3eHEydTF3LzNDSlBmZmlZTWdFbERGNi9oNFNkZ1dw?=
 =?utf-8?B?UVEzMGh6eGMyUGFDeWVmK3YvblFNMUVuMUZzbFdoeWZXV0pDMVVHZUp1aU0y?=
 =?utf-8?B?QWZWTHpQUjhycjhibTJyRzdQei9RTGtwMm8va1gzdGNaZEt5QSs1U1gwU0ZZ?=
 =?utf-8?B?NzlBSDNxcXpjQXdkUUxVZWt4Zit2RFJsM2JhQWV1bFVnSFhiRFdRRDNmT1Vn?=
 =?utf-8?B?U3RpeW4xYW9nNHNhQXh3b2NkR3RvMG14STVyTzYvT0o3cGFidWN1VXJsRHhM?=
 =?utf-8?B?K2Zkcm9GQmNOaTBUalcyV3NpdVM4bGh0SW5hSzU1a0M4aHgyVGdQaHB2c1VH?=
 =?utf-8?B?UmxTZmY3M0dja1dyVHZKMjVjM2g0Y01CUytLOEEybm1Dbk9LSjNlVzlEUGVj?=
 =?utf-8?B?RHUzZjRnRjRTN3dzRWhCUkV5VlFGLyt1MG1MTDhyb0hyNWVlcXRST3VPU3hO?=
 =?utf-8?B?YUExWmJqdHVnbk1HNkxCcXROczdXaDMyRW5ldGlnRUpkVGZBa1RHV2hmWnJ2?=
 =?utf-8?B?SGkyVUNpUjNsQjFNNklIZE9mSlFUcXIwMUZBTzNRUm43UEt0ZzBzMnNzcTcv?=
 =?utf-8?B?U3JPYmZrQUVlSitJaUQ1S3VRRExjaytOOFhWVUJIb1krKzVmR1FONWZkS2hV?=
 =?utf-8?B?N29LdERVN2hnaXRiNlA3dm9ia293VG5iZWc1Y01yTHllK2FEK0ZrRXZpVFpK?=
 =?utf-8?B?aXRoUWVwdHF4em9Sb3lPWURiTUN4OVVkYnVYZHRkT1J1UDVYMi9NdEJjQ0Ey?=
 =?utf-8?B?NmgrdFFnS2tTMXFXZWJUNjNmaW0zUHJGc05GZHp0TWxZcEJmdE1GZ0FmRWhm?=
 =?utf-8?B?dmx1cmhrNUtlekhaMXZDWDExSmJ6dlBiN2JIV1hzbUowZmFTY2w0QlRXeExq?=
 =?utf-8?B?S05OekpzaHBGWGsraHpwdXFMZk5UOVJHYnJRZ2NaNVpMUDd4ZUFXd0NEazdW?=
 =?utf-8?B?NGpkckhIUk00bzRmRDc2VHRpOFZ2Y09COTRlZjhhQzYrWXBDK0NQemtWaUxX?=
 =?utf-8?B?VkRMQklPcU1sTnRhTGNabCs1a2h0UU5oejlkdXMveEl0YThYc2kxMjdndHlw?=
 =?utf-8?B?b2l3OTVkTi9jMjB5WmUxekcrUXM3R2pMc0FaNEYwcTFBVHY3VGEyNzlQVWRC?=
 =?utf-8?B?Mnkzbm5kVFpZNWliSDNQNjF4eWxsNzVYM05PNlRqMUk3YitZZW54Rk9JN25i?=
 =?utf-8?B?dU1ERWlhb0VmMlBvVG9Wc1I4Q2FNVWZxYzM2cTRRUW1ERVAxbTZaOUhEZEMy?=
 =?utf-8?B?WURUSUNTUXpxM2ppZnJQTmhzMEsza2ZHMHpSTEtIK2V3OGNQWWx3WXBtWGJi?=
 =?utf-8?Q?fXxLxpaPLODd/VvwmJk6WSYyl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f726f30-b9bb-4f68-8396-08db86dcecbb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 15:46:02.6736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeJDdoBafsQQcLXGR1dK0+aGePWtHtTwPWzbQJfEBunVFeJIBoOFqHOs7BuvE6zQ8aWh336roI/dE91wAvwXgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7908

On 17.07.2023 17:28, Nicola Vetrini wrote:
> 
> 
> On 17/07/23 15:59, Jan Beulich wrote:
>> On 14.07.2023 16:20, Luca Fancellu wrote:
>>>
>>>
>>>> On 14 Jul 2023, at 12:49, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>>>
>>>> The macro 'testop' expands to a function that declares the local
>>>> variable 'oldbit', which is written before being set, but is such a
>>>> way that is not amenable to automatic checking.
>>>>
>>>> Therefore, a deviation comment, is introduced to document this situation.
>>>>
>>>> A similar reasoning applies to macro 'guest_testop'.
>>>>
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>> ---
>>>> docs/misra/safe.json                     | 16 ++++++++++++++++
>>>> xen/arch/arm/arm64/lib/bitops.c          |  3 +++
>>>> xen/arch/arm/include/asm/guest_atomics.h |  3 +++
>>>> 3 files changed, 22 insertions(+)
>>>>
>>>> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
>>>> index 244001f5be..4cf7cbf57b 100644
>>>> --- a/docs/misra/safe.json
>>>> +++ b/docs/misra/safe.json
>>>> @@ -20,6 +20,22 @@
>>>>          },
>>>>          {
>>>>              "id": "SAF-2-safe",
>>>> +            "analyser": {
>>>> +                "eclair": "MC3R1.R9.1"
>>>> +            },
>>>> +            "name": "Rule 9.1: initializer not needed",
>>>> +            "text": "The following local variables are possibly subject to being read before being written, but code inspection ensured that the control flow in the construct where they appear ensures that no such event may happen."
>>>> +        },
>>>> +        {
>>>> +            "id": "SAF-3-safe",
>>>> +            "analyser": {
>>>> +                "eclair": "MC3R1.R9.1"
>>>> +            },
>>>> +            "name": "Rule 9.1: initializer not needed",
>>>> +            "text": "The following local variables are possibly subject to being read before being written, but code inspection ensured that the control flow in the construct where they appear ensures that no such event may happen."
>>>> +        },
>>>
>>> Since the rule and the justification are the same, you can declare only once and use the same tag on top of the offending lines, so /* SAF-2-safe MC3R1.R9.1 */,
>>
>> +1
>>
>> I'm puzzled by the wording vs comment placement though: The comments
>> are inserted ahead of the macro invocations, so there are no "following
>> local variables". Plus does this imply the comment would suppress the
>> checking on _all_ of them, rather than just the one that was confirmed
>> to be safe? What if another new one was added, that actually introduces
>> a problem?
>>
>>> also, I remember some maintainers not happy about the misra rule being put after the tag, now I don’t recall who
>>
>> Me, at least. The annotations should be tool-agnostic imo, or else the
>> more tools we use, the longer these comments might get.
> 
> No problem for both: Given the earlier remarks by Julien on patch 1/4, I 
> think we can devise something along the lines of
> 
> /* SAF-x-safe MISRA:C 2012 Rule 9.1 <Justification> */
> int var;
> 
> and then write a generic justification in docs/misra/safe.json, while
> <Justification> contains a specific one (e.g., this loop does so and so 
> to ensure that no access to unset variables happens).

But that still mentions the rule. What if a new MISRA:C 2025 appears,
with different rule numbers? I don't mind the comment mentioning, in
a sufficiently terse way, what problem is circumvented. But I don't
think tools or specifications should be referenced here. That's the
purpose of the referenced "database" entry.

Jan

