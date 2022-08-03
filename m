Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E291588728
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 08:11:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379554.613082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ7ak-0007Qq-S4; Wed, 03 Aug 2022 06:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379554.613082; Wed, 03 Aug 2022 06:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ7ak-0007OE-PE; Wed, 03 Aug 2022 06:10:50 +0000
Received: by outflank-mailman (input) for mailman id 379554;
 Wed, 03 Aug 2022 06:10:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJ7aj-0007O8-3a
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 06:10:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04482db6-12f3-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 08:10:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8199.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 06:10:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 06:10:46 +0000
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
X-Inumbo-ID: 04482db6-12f3-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAgoidF0m8Y86VmSGolboq4tXEMi59gxzkVYiQ9y4EhzC06umWW0ibUeW5RjCfipu8yTc+N4gYJql7Q8hw+uLmViWa1QmUTR/jvEmRSp1lyyWhR6YGUfPJEPmXBombQmnfswWlFQcDPj/XCHFJgqXqB2aPToNChyk5Y+RfSrNI+hPtoqdTnkNdD2tcRQ0l02D5Qq8eWVbS7e4BrqD+UEQ47xcs+0Ghu1pIyCvWH5GnIWCSkyvnyYCYowkUNysa/rO5p7UGlpQfWDshAhP2eaJR5UlP4fVR8wlcNV0djr2tQ+c/Wg1eLsAUOf2Qu7bw5oKS6xfl7Jz0saDJMKtSD8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0/EfWY5CI1823DjxDrE0eqB3qfVwrqfOeDZjs9dr2Y=;
 b=iePDVNG7syk7DXMpo94PwdjHBgRl6/BwfCEZcbawreFOqeYtDIOqUi4Xr7UlEjBlqn1JAE0hh09xO42oB8uyBrQ2jgMFzLlY+oxYOYrLdfkoylAw3pP04g5R+43CeFDnGcgzk/gcMG7V3vZlzBrSbfGbccAp/o/XFIpVWbj7B8sWcdzzUOUeiRWqcCvoHyevVH0kFBmrZ2uvBD90mCdi5waEOkapMkVPQbjJqEaeHjLTO3joq2h2ePoxyWlAiGZTA/14VsPxArKOC+PENYvwjHavHkmNyb0rUzhqXv/AE57ykFqT6fXywfeP3n1kZdUqHfWalgDU0hjz7WyG/Btqww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0/EfWY5CI1823DjxDrE0eqB3qfVwrqfOeDZjs9dr2Y=;
 b=vbfch6i/QgpkqkfaTbSSaLmYtfj673PNGsXJBp2Tjpdult8ay1l8qz6LR3KDu4T38p8HMRe8jn/cZ2Lfv4SJcNLyOBdbo6xsfhowteUAJLGqjWBoPTQtFS6oKfvLHg3Qvle6cbH9K/eNKls80BMeQwYCOEI3AzxYFBcC2NNO5D58W2WSJ8ouVWdrtthHwY2WJh1k7wFALVCM2xIrbAMUhxOfBYx15UdhCBVCOpaGfLUkpw1LZa99V4sNpMY/1HAFWNNEThe2KlA3Nfl/2Y82bfgHw35APTQoYHZNKTxDrG2RmLHtu41zFr2UdTLodocAOQx4yZYd5pvQfcSZZnDoDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b1ce4b78-c28c-1ad1-af7b-892c069d24ab@suse.com>
Date: Wed, 3 Aug 2022 08:10:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>
References: <20220728134943.1185621-1-burzalodowa@gmail.com>
 <0a8ff178-280d-717f-dacb-4eb9f57a24eb@xen.org>
 <83c17bf6-b9b2-a297-6f7f-dd08231d0f90@suse.com>
 <c71c9522-2df5-35a3-d39c-706d5c9d5263@xen.org>
 <alpine.DEB.2.22.394.2207281551140.4648@ubuntu-linux-20-04-desktop>
 <ec89b2e1-a18a-9ef7-1ca8-edd19e737d4f@gmail.com>
 <c55b9ad0-bfa8-f0b1-6c4e-a794afd75e7c@suse.com>
 <69942917-f2e9-718e-094d-9b01aea16a4a@gmail.com>
 <a9cddfc6-235f-a42f-b522-04ae87990b47@suse.com>
 <b2f2d1e7-0c18-206f-5e9d-d0115e398840@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b2f2d1e7-0c18-206f-5e9d-d0115e398840@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc5351cf-3b7c-4878-d802-08da7516e770
X-MS-TrafficTypeDiagnostic: AS8PR04MB8199:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C4YSNMCddOX3FFszBXXNQ4P3sHOt1sGWkymgdhaezCV3BZ793Q71GJRv2oto+C+QaAxx0d66HN0cAFViudNR0ahjWZSck5a18YFO4a5nTZqRlp+KeDPfqcVbqpHL1SoghnM9A+hX358zoUc/IbnPP3lBqbsK9WDOdj3BlqegMD6WcIcJpn22kHyTLFJcFDcFRduSKd89Vt+dRbZ0MvPgH4i6XWpFfxJN3elOTPm7LjBw+5IILtfvxE2X6HjTxw4p14UDYvpkI03cJnpMN6142IXWonE45mtDbVGNEhiBLGwkohnGCCoCQ0PRphQLl+ghvS531zF57oMt2oyO1mK+V6efzba9TS3YRu2WPY8I+JuHwX+N8WM5v4n+KlmRYngwxLDIjXRnMwTtlrf0WTwEuHq8SmW+HzVflH2jB5wpWe9H5314PxZJtFln82IKbb3sC2MyjTeOGqonjBY3tEWbvvXMmcRJfVc0uxZC1ZXWdKAJLURq5sgasoAUv1iz3UU/JNoqUV7MkmPv5b5WaUKts/1DlRZ8Qjyx1OO5qC6+L13ijuswbALVmbz/ikZSgEp4WEMbX9AxZ+Cr7NFBBg8vfgOvkLuCpi9fhh1MHMCCE4EPbKHNhs/BsEDzWl4D3xwjwnIdv06d3Nf26mU830QIKHmYkN+3tfYztKOlOYlV9U8q1MGObC7O60XNs4jQKQyRGhpaPzEIqkgKJqHOPEPaa15QeeH4BnDtsu8W1Q1lnQJV+w7x5jRdUY0mFMxiYTk09/byuQ/Hc1ZZb/E/QJORwmS27zgZG/ytxyPTva63QQnezJlx0ZQnlsLas5HCmCPUHogwSU65JyAaexsdI605yQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(346002)(136003)(376002)(31686004)(38100700002)(54906003)(316002)(186003)(6916009)(36756003)(4326008)(8676002)(2616005)(66556008)(83380400001)(66476007)(66946007)(478600001)(6486002)(5660300002)(8936002)(2906002)(86362001)(6506007)(31696002)(53546011)(26005)(41300700001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wkl1MWxpOENreG5WZy8rcHkvNFJpVGVWRTBQOG1zN1lJMXhKclFoVGxKc2pj?=
 =?utf-8?B?alkrLzhYZXRQSWdEZEF5ZVFETDVqSWEvR1BMM0IwQ0xnNDZjVGRwQVF1am9S?=
 =?utf-8?B?d3dFdnlkZjJOVXgreFhQN0JTR1J5V3c4eFZ4UXpEWEhSaGsrRXhmMldJMk9D?=
 =?utf-8?B?ekEzc0FObzJvNlcrSkxYT1Q4YmlzM05FVTFEK0s0VHhGMXMyMGFOdHF5STl5?=
 =?utf-8?B?OFhhRXg1c2hDbTNtZEZQUGdpY3RNYmMzRW8vN1pXbVVIaVlZa21uaFpuRGNB?=
 =?utf-8?B?d0hYclloZVNmaDhneHQxY0QxZ1pvdENjWUtYNFNEOG1XODdXVjJIbkpxblBG?=
 =?utf-8?B?WUg1ZzZpWDdocWxtQ3ZvQnhlRlNHT3lDb0tvZVlPdjhPLy83MUwzSGVITFdC?=
 =?utf-8?B?eDIyeUFDSHZCV0wzMTF3Z1REZWdGb3B4dUI3UGlZYVluWE42ZFdFZS9JakRV?=
 =?utf-8?B?MW51K3dSd1Fsd3h0TWdQZ3ZwTURGWUEvbUVqRkRVRkFLTUUxajhSTy9TZGEx?=
 =?utf-8?B?Q3JQRUJFRmpsSFZpVmZYNThpUEh6UGorVnV6SVRVS0RVWFpXUzZiMjhyZWFn?=
 =?utf-8?B?U3UxNGo1dVNadG5wMm9taXlqemhnRGd3R0FsQXBXUE5UcmxTUmlxZy9vQkdx?=
 =?utf-8?B?MVBYZ1VjeDc0ZC9NcElMYW5uUDAvK015UVNFUHk5WGxHOTZaWVJQVGgzSTJx?=
 =?utf-8?B?TFZqd2s2bUgvK2szRzg1a0wxdWs2Qm9IdEVCUmhRam55WXI3eUVtZHI5L3JP?=
 =?utf-8?B?UXF1bWVXRnVNcGdUdlVRcGErcm4rcTFFVlVHa2tudm0zcCtnTEMwZG15MkV6?=
 =?utf-8?B?WlBMVmZwTndia1Jtc2hSOU96K214ME5nMGJzTGdjQnBaZy9TcjFTdWMrLzMw?=
 =?utf-8?B?VUdmRno2MDFySGk4bjZJRlJDV1ZQVXl5ZTA2OWE1SVZ0V09zSlF1QmFUWGsx?=
 =?utf-8?B?bkxGbjljY1djd1BsUGxOcXdQRlFXNUNLY3RnQ2IxUWJZWGFoK1RUYTAwUFRB?=
 =?utf-8?B?eVphc1huZ3NYS3JUZmpmNlZmTnJ4dU9NR3ovemV4U3BwODYzZG5aS2VhcUhH?=
 =?utf-8?B?OGpmVmVOejBTNkI4UlNXUGpZY1JJb3ZmT0g5UnNxRkppYzdCSU9iSTVmajAr?=
 =?utf-8?B?KzlVL2ZVMlFHUENlR1ZkMXJDdzRSL05ZY1kyUkNDci92TWREMlZ4K2U2Zlkv?=
 =?utf-8?B?bzE2REZCQkVNVHkvR3RaMjlJUkZDb0JkNUEyWmxIQUt1REp3MjVMSHlEeDZo?=
 =?utf-8?B?cUcrTS9mdE9vTlhHNElYRVhBNy9wUWJMT1BLdE9DZGE4RmJKS1JhbElpbEpN?=
 =?utf-8?B?UlNPb0tLd2FFdGdLc0lZQUhGZGFjMDNvZUJJUHovUmRhOGN1am9ZZUdDQW13?=
 =?utf-8?B?RzE1WkYycVdaeEZ5N1NCMzEzSHhMaElnSThrOHJJWFNmTjZHTWIxdDdzK2Fw?=
 =?utf-8?B?TGJpZ0FCenZuWEdFSUliWUN3QklyMEg0QXZrbDFtUkNhVjFUczZ2YTJINzNl?=
 =?utf-8?B?RTAvWXZpR0VqUlo5SUx1RE5QT0RVcG9OZmhIaW5yLzdubmR0ckFCS0s5dXA5?=
 =?utf-8?B?dzJnQlA4aTNOdXFFODVhbDdKeDV2cGd4NE5TaHFGbHFmOUFGek1GNzFuUzVx?=
 =?utf-8?B?TnRLa25nczJQWDQwR0tNV1JzdU5PS0lPRjFjd3VPNFpvWE1sRlRWd3p1MldJ?=
 =?utf-8?B?TUlWTnZWWkxGaWZXa3RwTVFncjJEMmxVR1lCbkR1QVllOFdsTXYxU01YbndY?=
 =?utf-8?B?aHdCbkNQeVdoU2hEaDV3Z0dFZnBnb0psR3JrbGsxRjQ3RE0xM1BiMURLRFBU?=
 =?utf-8?B?SW5XSVBXTXdhaFRsc2FkTFpRUDdsYnppcmJkRWRnaUpYaDY4WFBBUUVGUWZq?=
 =?utf-8?B?R2d0THQ5UCtvSXoyL2w5Z3l2bmxLdEdKRCtaNHYwaUNLRzBxandTMmt0L2pz?=
 =?utf-8?B?SnNiYWhpSUs3eGNXcWh0d3NhWUdHSDkxbkkyWHU1cTB2T0xqbXM0aTFjRUlt?=
 =?utf-8?B?VTZkZm13WDllSHZSMStSa1lSaCtneUlwejVwZXNES0ZoK3E5L3BYa0JOVlFk?=
 =?utf-8?B?c2UrZEtiQUNHaEFja2p6b3o0T2dTOVZuOHJuOURlTXdaTEI4dW1oZjJQSkdX?=
 =?utf-8?Q?x81YYH8crK301iexWv7gbwEV2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5351cf-3b7c-4878-d802-08da7516e770
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 06:10:46.0258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMHxKe0107d+nSmHus9WPqrnq3OZydoXaBZ4R+2lB48WvHYLq0G5qISjEQXfz9E+MdP/k/AZlzp6nu1ywGl5MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8199

On 02.08.2022 19:32, Julien Grall wrote:
> Hi Jan,
> 
> On 29/07/2022 08:22, Jan Beulich wrote:
>> On 29.07.2022 09:01, Xenia Ragiadakou wrote:
>>> On 7/29/22 09:16, Jan Beulich wrote:
>>>> On 29.07.2022 07:23, Xenia Ragiadakou wrote:
>>>>> On 7/29/22 01:56, Stefano Stabellini wrote:
>>>>>> On Thu, 28 Jul 2022, Julien Grall wrote:
>>>>>>> On 28/07/2022 15:20, Jan Beulich wrote:
>>>>>>>> On 28.07.2022 15:56, Julien Grall wrote:
>>>>>>>>> On 28/07/2022 14:49, Xenia Ragiadakou wrote:
>>>>>>>>>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>>>>>>>>>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>>>>>>>>>> @@ -461,7 +461,7 @@
>>>>>>>>>>       /* Access to system registers */
>>>>>>>>>>          #define WRITE_SYSREG64(v, name) do {                    \
>>>>>>>>>> -    uint64_t _r = v;                                    \
>>>>>>>>>> +    uint64_t _r = (v);                                              \
>>>>>>>>>
>>>>>>>>> I am failing to see why the parentheses are necessary here. Could you
>>>>>>>>> give an example where the lack of them would end up to different code?
>>>>>>>>
>>>>>>>> I think it is merely good practice to parenthesize the right sides of =.
>>>>>>>> Indeed with assignment operators having second to lowest precedence, and
>>>>>>>> with comma (the lowest precedence one) requiring parenthesization at the
>>>>>>>> macro invocation site, there should be no real need for parentheses here.
>>>>>>>
>>>>>>> I am not really happy with adding those parentheses because they are
>>>>>>> pointless. But if there are a consensus to use it, then the commit message
>>>>>>> should be updated to clarify this is just here to please MISRA (to me "need"
>>>>>>> implies it would be bug).
>>>>>>
>>>>>> Let me premise that I don't know if this counts as a MISRA violation or
>>>>>> not. (Also I haven't checked if cppcheck/eclair report it as violation.)
>>>>>>
>>>>>> But I think the reason for making the change would be to follow our
>>>>>> coding style / coding practices. It makes the code simpler to figure out
>>>>>> that it is correct, to review and maintain if we always add the
>>>>>> parenthesis even in cases like this one where they are not strictly
>>>>>> necessary. We are going to save our future selves some mental cycles.
>>>>>>
>>>>>> So the explanation on the commit message could be along those lines.
>>>>>
>>>>> First, the rule 20.7 states "Expressions resulting from the expansion of
>>>>> macro parameters shall
>>>>>     be enclosed in parentheses". So, here it is a clear violation of the
>>>>> rule because the right side of the assignment operator is an expression.
>>>>>
>>>>> Second, as I stated in a previous email, if v is not enclosed in
>>>>> parentheses, I could write the story of my life in there and compile it
>>>>> :) So, it would be a bug.
>>>>>
>>>>> So, I recommend the title and the explanation i.e
>>>>> "xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
>>>>>
>>>>> The macro parameter 'v' is used as an expression and needs to be enclosed in
>>>>>     parentheses."
>>>>> to remain as is because they are accurate.
>>>>
>>>> I'm afraid you're following the MISRA wording too much to the latter.
>>>> Earlier on you agreed that when macro parameters are used as function
>>>> arguments, the parentheses can be omitted. Yet by what you say above
>>>> those are also expressions.
>>>
>>> Yes, those are also expressions (that's why I added parentheses
>>> initially) and I agreed with you that the parentheses there may not be
>>> necessary because I could not think of an example that will produce
>>> different behaviors with and without the parentheses. This will need a
>>> formal deviation I imagine or maybe a MISRA C expert could provide a
>>> justification regarding why parentheses are needed around function
>>> arguments that we may have not think of.
>>>
>>>> As indicated before - I think parentheses
>>>> are wanted here, but it's strictly "wanted", and hence the title
>>>> better wouldn't say "fix" (but e.g. "improve") and the description
>>>> also should be "softened".
>>>>
>>>
>>> Regarding the latter, are you saying that the parentheses are not needed?
>>> In my opinion they are needed to prevent the bug described in the
>>> previous email i.e passing multiple statements to the macro.
>>
>> Any such use would be rejected during review, I'm sure.
>>
>> However I think there's another case which might indeed make this
>> more than just a "want" (and then responses further down are to be
>> viewed only in the context of earlier discussion):
>>
>> #define wr(v) ({ \
>> 	unsigned r_ = v; \
>> 	asm("" :: "r" (r_)); \
>> })
>>
>> #define M x, y
>>
>> void test(unsigned x) {
>> 	wr(M);
>> }
> 
> Interesting. I would have expected the pre-processor to first expand M 
> and then consider wr() is called with 2 parameters.
> 
>>
>> While this would result in an unused variable warning,
> 
> FWIW, in our case, the compiler is going to throw an error.
> 
>> it's surely
>> misleading (and less certain to be noticed during review) - which
> My expectation is we would notice that M is missing the parentheses. If 
> it is really wanted, the name of the macro should be obvious.
> 
>> is what Misra wants to avoid. Let's see what Julien thinks.
> I am struggling to see how this is different from:
> 
> #define wr(v) printf("%u\n", v)
> 
> If I am not mistaken, you have been arguing against adding the 
> parentheses here.

Yes - not the least because we actually use such in our code (at
the very least in hvmloader, see PRIllx_arg()).

> So, AFAIU, this means we will need to rely on the 
> compiler to notice the extra parameters.
> 
> Anyway, I am not against adding the parentheses in your example. 
> However, I think we should be consistent how we use them.

Indeed I, too, am all for consistency.

Jan

