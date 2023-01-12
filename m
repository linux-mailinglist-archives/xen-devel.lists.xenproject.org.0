Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C209666FF2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 11:43:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475969.737909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFv34-0002YH-Sd; Thu, 12 Jan 2023 10:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475969.737909; Thu, 12 Jan 2023 10:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFv34-0002VM-P6; Thu, 12 Jan 2023 10:43:06 +0000
Received: by outflank-mailman (input) for mailman id 475969;
 Thu, 12 Jan 2023 10:43:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFv33-0002VG-NL
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 10:43:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3a96eac-9265-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 11:43:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 10:43:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 10:43:00 +0000
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
X-Inumbo-ID: e3a96eac-9265-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ed/8imk65PyNLgtUf+88xhSGQ6/PKjzxRMFENwEr/Ox4z5q8yhnOASG2F6speCxuHMAIDe8UNR/+pgo94zg6k0fXJ2K+L3fySISCbctpA4UwnwzZLyXYZ7igXPVAJ9r0vLgkJoFDclGR6EIXwH6I+d79pvQymeAsCngwEAGUXBYmBmHxH+tvDHVQCazEwI996H+Nn0ImBCTzCalRHftXEeWXmf0ADkH4gD+Q1AsXk46J2K8Eocnlz0XQQ+XxNMxbLMyPkmkKehByV4kTANPnHbPL9UA2P7yTW3s5bDcqnujFjVwvDtfKFqQZ//NF5ANxgPmF3xu4QBj8zXb54UssJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5L1kQiY5uTx4IWBhotb8+wwYea9jsU5PILmCT8+5Gzg=;
 b=Ram6RUzwRxY/FmX2AJvnutOH66FSDsGAHSD204VpNZIFzoyaTmHz5pugIaBcygVmxIwEXc9QZKM4m7nLGzjbz2SRk/d1Gsq5l0OTe+8WXNS7sxvY75hJ8ULjHg53tQH24ICdsXEHUkcq+XjwspE5KHpP64YX5cztmQ7gwCHL0J3q4A0fxwBXy731ATJ3fRL9Rsplqb+Lz7oyMYw04yaWWN+OuAJWVc1wUK5zUo7hfvl8dt6W7j6Rd0MFZlLmBfjpkqq6oETkKHzHDRi/c7yh+nY/5gJO8ZcQkAYmnDkvlrWAVBaCped9EAPrkVQnVsoLbw8NkMwhlkev9BW1m3et8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5L1kQiY5uTx4IWBhotb8+wwYea9jsU5PILmCT8+5Gzg=;
 b=H9M9jengHjLLdLorjfj0vq+ZKQTTYHYIxseaHGjkKm1wS1aGrpc00uxrgMQVDzjOhx7aJI6fQgm9UGctQve0efbTn55hl9IPAjy45cpoWivLHOCLN2GF+6yIB4JUc0N/K1AxPxUu1SzgPZw5rTlKeLLpdruhbuwzwxwy5jDkbQS0eYDK9Ox+SIBxb4LPCn6RtQO3vKNZr+qFF03SzshFNTYFVEiSfr7NPF8lR67MgB7Y5n+Vv+v7ywM8p+Nhito2ywX0nXNbmhSTEnQ77/ydSNQfA4CBP/bmGHq6HFgN1mcaf6uzOyyk+wM7ptsJwAuCRH9D7OLO0lBN7nWuD3UJAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b49793f8-55be-0746-815d-ab7b627d3baa@suse.com>
Date: Thu, 12 Jan 2023 11:42:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 9/9] x86/shadow: harden shadow_size()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <9bea51eb-4fbd-b061-52d7-c6c234d060a1@suse.com>
 <c5d201ac-89ca-6baa-d685-5bef2497183f@citrix.com>
 <a438f16b-7d45-d7e4-2191-4ed7b2077785@suse.com>
 <71e7ba34-f1ea-16fd-ec01-bb2aa454270c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <71e7ba34-f1ea-16fd-ec01-bb2aa454270c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5e894f-fbb9-4339-65a1-08daf489c5fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vs19dBtWdtSBobt4xBtJ4/TRiadBmO+SJCtR6lQn0NoXN7pRu3JTBwqXC19pfVHgtv0tyi0iVpali81bXKsjfsUbAHPD4V0TaMW+ZwDahonoOUF0q5Vfzyg/u51To4JX0771Ko40gARkkOLtOJEjAGooIPBueJDN/4EEavZwhJeksPAzOiULNgTct2MDG0C5BgzewPtiKl4tfbmrYYKtoJqX8ZVqlNZkcQgRtpYdHeudzyXLhXaH8E/oE2Ya2c4mTqHQhRdPlTw4GFq2xL6WkJN2WwXIFrYiDb3FwyLRt2oSA6pR10iGYHQAWqNP6alN/zdBLXZtukUIrSYOtuh2NN+okRMyfzSX6lKm9vMD4O941l+lMDbveVHeidxU45jWe4HoheLvIlF6sVQ1Sj33Jv6PPVxGtqZaxx0DVfiuYNvNSaYBLhczHi1IVjRukw+3lL5t0PV6drTVjx1TL4lfV9NEUQCKwIvtfNOTESUXrOZNdEyNGubJW7+Guvb5QLp6koDmZERpo8Ju/mz/fGyBKa/SHTnJ/Flx25ziAp9LnACTl0eer7z/ZwIFs0Xo5XmIv51In0skbGSqJEePtqtnUK3bbjM7R4wQDUrqBTq4aA6bMYe7My36U9SxCmeF91wQX1dvqUe5g4tVKdeIV2iyPfBa1mobCu2iuMhrSOwDp0AhZgAA2SMUZsmTh4++Eka4rUIV8M+tTE3o0YkFe0STNLf0wx3US2OCXoAT9ZHmXec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(366004)(136003)(376002)(39860400002)(451199015)(41300700001)(6506007)(8936002)(5660300002)(31686004)(6666004)(2906002)(53546011)(83380400001)(4326008)(6916009)(8676002)(66946007)(66556008)(38100700002)(66476007)(316002)(54906003)(36756003)(478600001)(6486002)(2616005)(86362001)(186003)(31696002)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dy9uM1VHTUR2c3lVbWNiY1lhTmtCMldLWUtmU3RIS3lFeVdsTUJLSmdSbDRu?=
 =?utf-8?B?cnBVYkxySmgrNVhFSXZZVU16MWxHcjJGUGNZZ1pmUEdUcDk1UnBTZVNLVkFX?=
 =?utf-8?B?SzBoWmUzVmZjZ1Q0MS96anBVRGZzQ0FSbVgzRElMaTFuRzJwNjJNemZwVk9v?=
 =?utf-8?B?ZUhOSDdOR0NpMVNMbFRGd3Z1VnZwSG1ubW44ZlN0cFF4ckFvMUdYeVVWeCtP?=
 =?utf-8?B?cnRuR21xUHZyakIvWVZhUk9hRDh6SHRoMnJ4dG43eEQ2T3ZwZGluWWpzRklP?=
 =?utf-8?B?OG1XSzdPL05MRGgzbVlNUlRUNm1LNDkyN0dTV1V6SDlnUzU4VEIvVXhST3Fk?=
 =?utf-8?B?bUdLd0NYV2ttK2l0dDdYc1ZRd084R3FiYlZ5S1U2aEpBTWpnQmYrQTlCVnkr?=
 =?utf-8?B?USsxenNDUFVhckdZN1NINTBnNlJmcTNYZ1ZtbHAweldrYU91cUZTOFV2cFBu?=
 =?utf-8?B?TFZVa1J4TmJsNUk2RGlSYTkrNHN6Y1ZlQ0JZYXQ3V3pJU1czUkllTHB2Vnhh?=
 =?utf-8?B?ZStjanBtcWRWU1RMRFRwQTk5QW80V21uUXNSQ2w2dWZ4R01MRUtaSk5xTkFu?=
 =?utf-8?B?ZnZBMVRIMG43YXZVNUoxOEJyUnNzU29WYmVDU1Y5dzgwWW9RcThWTzBZWWEz?=
 =?utf-8?B?ZUE5R2RKR1pFaWtrbm9yQVFZR3dPL3VBWVZ0Wkk1bThab2o5ZUNuTDI2a3Np?=
 =?utf-8?B?Sjhabk1aK1U5Wmh2Z0xPWUk1RklQMVZ2S2p2UjBjcVpnMU5Fa1BGVFB1VUtr?=
 =?utf-8?B?SmtGYzBFNmhBNUhiVWI4c3F2T3pJNmgvQUs0VGhVcGhHSHZZaHNHRkplK284?=
 =?utf-8?B?SkNGeUFya21DMkNqZHY0Y2xnaG45MVNZZHRmQzcxTG4wQlNLNUZhQUdSYWcy?=
 =?utf-8?B?Uk5JVkVqdUE5WVlQeEp3ZENhcnhkWnNmN1NNTzNnZUNUSDR1c3hLenZWVFZG?=
 =?utf-8?B?aUZSblNLM1FLbElIdDJmSU5TbVBRQ2VVL0xObDRDRW9NN3dGUFV1eUlJdDlt?=
 =?utf-8?B?aXVTeUY0RnRmT0FFK1N2V1piMlBaNk43WC96bTJnczV3UFdJcG9ZdTdKOXcx?=
 =?utf-8?B?dXhhR3VRV2VTeFRlcTBIMm5aek9KdUQ3aU55YlhKN0FIcDBJcHRUVHkzN3JN?=
 =?utf-8?B?ZnpSSUNVbUVGOEVUeGw3Q0tTMDkxYm5RVnpLRVBFUkJXMHB2OGg2MFczR2xH?=
 =?utf-8?B?andpdTh0MkxhT2NycThnSzRNbmd4QlJGejlyTTdZQUVYNWNTNmhCTEkrRE9N?=
 =?utf-8?B?MDMxdERnQXRsU0s5ZWp4dlYvL3E0TkNPQlcxV2phc3ZXNmlUblZwQy9oN012?=
 =?utf-8?B?NGtLT1hHbmtlV0FLeUs5V2hWVzViM2pCOGFYbVZmMUhHOEJrTG1PYURXVGhF?=
 =?utf-8?B?YjIwTDBVQmR6MC9Vd1NqaWhPNUt5UVN3WHJEcEQ1MXBya0toUWJ6dEc0OGtF?=
 =?utf-8?B?Y2M4VGcvd3pGYTBjN0lJVDVHMm1PVlB0M1krTVFwcWRybDlNNTZ0TURLNVlU?=
 =?utf-8?B?dHRIL0p5MjlrbHgvM3doSk9OSWEvNTBpaGtzeDhZQUxCTUR6YTEwSjFwQlht?=
 =?utf-8?B?RGlXSFV1aTNrNGFsOEFxNzNPK0pHOElNelg2WkFZRkpPcE5zNlV4M1ZBZ1NF?=
 =?utf-8?B?akFDK0pxd2MrMkNtaDd5NlVRY0JvaGpKRHNQSmx3M1dLcElqamtYMmU4N3Bw?=
 =?utf-8?B?V1lRaWNaNHdaS3dVYVZVVVNCWWRNNzJzS3JFcEpqbklLNlN5TzZYREJSVVJv?=
 =?utf-8?B?eG9CVlQxMG1YeUcvandjTlBpckZHTm8xSkVOckJsZlBCeTM5Z3V6NUthZzdP?=
 =?utf-8?B?SHFFcmZFakN1OW5tR044eHBmMisrcmZKMlVGNlovMks0REhHOTRVU0RFL2hD?=
 =?utf-8?B?SHUwdTVhaTRSVTBUTEQ2M3dXTEdUVmRJanczK1kvUnNYcGdIUFl6WUJNN1I0?=
 =?utf-8?B?ZFdxS3dEbG0xT2JzcitqVjdJQzNtU1pSZU9vRlAwcEdPRWczWjhicjJBZGR3?=
 =?utf-8?B?aFI0bnlzOHZSSnZuOW02R2xQbjdaR3hhbjdjWC9LSUJCcVppazE4dDcvcld1?=
 =?utf-8?B?dHNWd29FbnB1bWd5QTZLd1ZEbnN0OGRkZTErUmF6UjQ1bk9pNHdGTFZidnpv?=
 =?utf-8?Q?L9iGmIW6MJsvqczFr3QEsTcge?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5e894f-fbb9-4339-65a1-08daf489c5fd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 10:42:59.7480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKH1B+LjzoOvQ+9yq1SSc4Hvd9q6obpIzDvvc9oxJYi9dCvVrBz5waTTRMkrfdaJ4PsWtlarKMIso5iuBC+yww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930

On 12.01.2023 11:31, Andrew Cooper wrote:
> On 12/01/2023 9:47 am, Jan Beulich wrote:
>> On 12.01.2023 00:15, Andrew Cooper wrote:
>>> On 11/01/2023 1:57 pm, Jan Beulich wrote:
>>>> Make HVM=y release build behavior prone against array overrun, by
>>>> (ab)using array_access_nospec(). This is in particular to guard against
>>>> e.g. SH_type_unused making it here unintentionally.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> v2: New.
>>>>
>>>> --- a/xen/arch/x86/mm/shadow/private.h
>>>> +++ b/xen/arch/x86/mm/shadow/private.h
>>>> @@ -27,6 +27,7 @@
>>>>  // been included...
>>>>  #include <asm/page.h>
>>>>  #include <xen/domain_page.h>
>>>> +#include <xen/nospec.h>
>>>>  #include <asm/x86_emulate.h>
>>>>  #include <asm/hvm/support.h>
>>>>  #include <asm/atomic.h>
>>>> @@ -368,7 +369,7 @@ shadow_size(unsigned int shadow_type)
>>>>  {
>>>>  #ifdef CONFIG_HVM
>>>>      ASSERT(shadow_type < ARRAY_SIZE(sh_type_to_size));
>>>> -    return sh_type_to_size[shadow_type];
>>>> +    return array_access_nospec(sh_type_to_size, shadow_type);
>>> I don't think this is warranted.
>>>
>>> First, if the commit message were accurate, then it's a problem for all
>>> arrays of size SH_type_unused, yet you've only adjusted a single instance.
>> Because I think the risk is higher here than for other arrays. In
>> other cases we have suitable build-time checks (HASH_CALLBACKS_CHECK()
>> in particular) which would trip upon inappropriate use of one of the
>> types which are aliased to SH_type_unused when !HVM.
>>
>>> Secondly, if it were reliably 16 then we could do the basically-free
>>> "type &= 15;" modification.  (It appears my change to do this
>>> automatically hasn't been taken yet.), but we'll end up with lfence
>>> variation here.
>> How could anything be "reliably 16"? Such enums can change at any time:
>> They did when making HVM types conditional, and they will again when
>> adding types needed for 5-level paging.
>>
>>> But the value isn't attacker controlled.  shadow_type always comes from
>>> Xen's metadata about the guest, not the guest itself.  So I don't see
>>> how this can conceivably be a speculative issue even in principle.
>> I didn't say anything about there being a speculative issue here. It
>> is for this very reason that I wrote "(ab)using".
> 
> Then it is entirely wrong to be using a nospec accessor.
> 
> Speculation problems are subtle enough, without false uses of the safety
> helpers.
> 
> If you want to "harden" against runtime architectural errors, you want
> to up the ASSERT() to a BUG(), which will execute faster than sticking
> an hiding an lfence in here, and not hide what is obviously a major
> malfunction in the shadow pagetable logic.

I should have commented on this earlier already: What lfence are you
talking about? As to BUG() - the goal here specifically is to avoid a
crash in release builds, by forcing the function to return zero (via
having it use array slot zero for out of range indexes).

Jan

