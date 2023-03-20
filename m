Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DA46C0D31
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 10:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511799.791050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peBkc-0004Ov-RF; Mon, 20 Mar 2023 09:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511799.791050; Mon, 20 Mar 2023 09:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peBkc-0004Ly-Nh; Mon, 20 Mar 2023 09:24:22 +0000
Received: by outflank-mailman (input) for mailman id 511799;
 Mon, 20 Mar 2023 09:24:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peBka-0004Ls-Hn
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 09:24:20 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fccafcef-c700-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 10:24:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 09:24:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 09:24:11 +0000
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
X-Inumbo-ID: fccafcef-c700-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dj65fbCYpTn1Van6VgalzVbCEkszEqkZHLxZYdEKxHvmLhXCetdNmSx63hamQGAI7B2RQSez/kfBDEWKVRj4ics1PKr0p0Du27VYOkBnscutrsszwJW6hjs98nshSlzEXIjMQQ0IbXjzevWhjzcd60SAwrhVUbzScJDzoIjvVBBGum/V2Kj6UUaAqgc20TvjT9lhOikrgHMdCN7MWGeZ55W+yDJ5IJ9qZweQxumc7TgpcUz42Zjfldyn9EpEFxEBPGDNdG1XfgWyAOeptYtjgb61HzQlmF1gPZOTDQvaGzgpHDp8b4Ej4eLXOJksKYk0L4Bp5zVKefv+AM4vwVlk1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqVTmnjHZXKZ7Fq15XdGFcWddqPM6ObnFZpubJkk2ew=;
 b=RoljEUTjaEmgJjOBx3x4Ce/WVZ+x3zkxxwRBCFc3e9IUnjTrTUpSmPa/XUwPpP1ntVW2sutLe/DIcRtVEsa9uXkJ6dtbT2xUqa353tWRdrsLompzO8O+p9GNEp+3FjXb0FzcsVSKJ1jnnDIEEHfmKUCp17YBRH9jb0PjAsP7ddcywjhPs8dRzkW2sc1j/ufw+1+zGyBjSZFF4Jmj317/sf6o3zOVqiwZ123XOlASx5+3yKxVI6E3tU5qXjqQEL2tVuxhP9NlEMv1ZDIY80mS1w84u8RvGCgMZL9ZLv9H4yDhoHVwAIItHxQLjKJd66K4IQ3QbZRcuvLKdaEiDx16Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqVTmnjHZXKZ7Fq15XdGFcWddqPM6ObnFZpubJkk2ew=;
 b=s3kPfkQUzotFlGLZ2KX9P+YJZU/WcAnvTYfoyUMQ6M8isz0ViJWnXdC6d4inw44nkAvZRO71NgnrPrQwytWFCHEMyRAoIuod9fRIjwbCmYZJmg38gKuWxrd3nuc0Kq3MmvirF+0Yla9/nR9ViL9ejV5MQzlNVk8epa3tTBH+kIe0NvLMpwiG5f0KmBrRvFTjdltHhw+5V8QGeXcL8ETRTZECzqFx/n/a2mRMYFtii2TJSDJKD8FzhH24GjIMc8FeP1j8D5EVZt9gb6NDjZdccgtLUK2yKrhydIadivNaQyiRq4PF5TkFfze496cnSqgeln8O3DRkpjLRxpUiLZ98QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <02cc1db2-90e6-a60e-4922-d88b4ca98b45@suse.com>
Date: Mon, 20 Mar 2023 10:24:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] x86: extend coverage of HLE "bad page" workaround
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <b238f66d-37a9-3080-4f2b-90225ea17102@suse.com>
 <424d1b72-5eb6-f2bc-20fe-e59bacda8dd9@citrix.com>
 <c27d838e-0331-3cab-25bf-dd16b4645152@suse.com>
 <2c0ff1f3-ee0c-6d14-a51c-d82b65338005@citrix.com>
 <0df22405-bda8-8f4d-63b4-e9c4d57843b1@suse.com>
 <ZBRRbnBjWHXAM1ug@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBRRbnBjWHXAM1ug@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: 96cb2ac8-01d0-4526-14ee-08db2924dd2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G1NMhBbGioQml6CrrhRq9f2lFcL8nGxbEsIyMNy58QgqsetybG5GakXeR8qS6jsHBFZg7XXcQDhuFnahnW3EssdvgRfPBa4oGHl6vV0Nspaj9B5RavWzzjhTZ2L4+XSsFXGmtFPXIeMHklIOyGX4QG8s4Oges8HjdB/wSRQtrbTWXtwXfhGxZ0ys2JVd2wC4Vh5FNjClE+jhAduHc9JuCt+Kg+LD55q00wNMOW990TicKte/em0qHEcuEuuIbuYf8ePRn/dqFI1R43J1D8p+9cmP6wzMOKDcJFfnbkyr4RH/T8b3tkOBJ4txJ+M68xK3N4aJfqsgU/iP2yViqL9d/Teb4x8c1ETW4+oFVxKtiDFSWsJp445v1/NQaPN60N7lW/L943rLw7qSplDO801AQR8qeo0DyMSRYqQf3hnARnQAzUGrUrvrZ1Cdg6BU3pNStoRodQmHeHRZ4m0L2cRZJNWJqMG+FEuSkmnmUlaDx/cLu8strhcN4DFEe+nEVc4GsWHcz72iS1JGsDDtXHBJEUSumULq18RwItdGy/CB9XwNhmQLmgHepDFG0IALMZj4Dq4s/LgDbU5gdjkCUzA+beW5iAnd+OmjLM6lA5xsFz+5HTyQHHZp1/ruFzGAWfa3h4kId4dkh/bydRAj7HlnjuNG7HmP0CAyVVfG127K3I/KQXqLfsqvJGOdQ4NjSHvZhtEIWvoc7TROkbPhzFTFEyVKqusRrtRRcy7iPWi/CcY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199018)(8936002)(41300700001)(5660300002)(4326008)(31696002)(86362001)(36756003)(38100700002)(2906002)(54906003)(83380400001)(6506007)(31686004)(53546011)(6512007)(478600001)(186003)(6486002)(26005)(66899018)(8676002)(66946007)(66556008)(66476007)(6916009)(2616005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUd1V2JSaC9JNkNoNnd0emxsMFhsU2ZXNEMrT2Q1MWNubEhRLzV1c1MyRXBj?=
 =?utf-8?B?SjFTUURXZjNiZTRoOWpIZmlDSVZhUERvVW1PdXlGanFnMi83cldVUDMyTVdw?=
 =?utf-8?B?VG5GMHh3VDV0akRIRUFKSXlnMDk1Rk1PdERVQWJWaXdRdktIbXpvRW1wT3Z3?=
 =?utf-8?B?WlFhdDNRZlNaKzVRZVFMQm1FTTM1dW9SRit6VjQ5Wk5SZnJPVmFLZGVLa0I4?=
 =?utf-8?B?QjdJNklwYmJkM2hHdEZXbys3b3F5alpIM21ZS05MeFNqWjVxc0dQRFMweXNC?=
 =?utf-8?B?Tk92bmdJV2srY3FYTTVJeWJOa0VMOTA0MFY5YmROMXdWNHZXRE4vVHJNZkpI?=
 =?utf-8?B?YVQxbU1samVPbkk0ekFrNXZ5MkZ4ODJLTE5xRVFPZUNVOThlM2djVFpBKy9m?=
 =?utf-8?B?MEFwSmpkRGhCZUswVHlUbGlnRVpHUmpqaFk3a1k4aEt3amRtakdiLzNHRkky?=
 =?utf-8?B?OGw5UDRFRnhrYWNMbkVNVit0MzN1RGtlU1pmN0xkdHlEWTh3RnJrNWI1MTY4?=
 =?utf-8?B?NlBXUmxIcEVaZXNZTkJCL0ZhWms2UnkrYVlheXlRMVk2T2tLSlVvMjdRem56?=
 =?utf-8?B?ZHhpMW9ZTWtENGN4NEI3Rkl1aHIxR0dlMWFnNEdydC93VlpYNldmOVQzd041?=
 =?utf-8?B?Tk0rZHl6ZEdHR285am5oZkpndmV2dmNCSzlwQ1ZZKzc3MWpicEdHNnk1Z0Ny?=
 =?utf-8?B?c3Q3a3pRcmJieDlOU2EwZEM1V1ZBNnNvd0pzVkh1NmxCQ242WDJWUlk1ZTFV?=
 =?utf-8?B?M1JRTzlFMTZvU242Mm5QTnlQVEF2SXBvMG1mc3ZiZzZYN01jdlMxUDBNYVBK?=
 =?utf-8?B?TmowUkFvbm5RUWg5aGVYOS9ZN3M5WmNqbms5c3VBbXdTZHFNYzdMbG9LNGt4?=
 =?utf-8?B?d3J4UWpXSXhCQ0Vsa1RHOVJKMVh3WkNLdW5zQXVpRGhkWGkwTXh0ZW5wNzZl?=
 =?utf-8?B?M204SmZFc1BHTVlmSFhrOVBqQnp5NDJaOUhRN0NnZURzcXRrQmtqNlp4ZUdH?=
 =?utf-8?B?TEE1VlJ4SE5tS2hSNW9OVTBTZVNvVVIvbDVtRFJ0MTkzclpjSjdDSnk3SlVs?=
 =?utf-8?B?QW1BZ2VKcytHeTVId1hOSVBaeVZudGsxNlErS0FwSitsd2QrMWE1TW9RUXdw?=
 =?utf-8?B?amV3cW51aG03ZnUycUtyRGt5clY3Q2hDTXZjemNpTmFBUTkxbVBQemxvWHEy?=
 =?utf-8?B?SXBhbTlMbm12ZU82OVRvblo4TGNKR1FaOVVGeEp6OTkrWU5XMUpHWFg3bUhr?=
 =?utf-8?B?bnhDTWJ1cWdqRjFJOWg4enFFd2VZN1Y5bFQ1OTdWV0sxZENVcmhGS1VNTnNL?=
 =?utf-8?B?a1o3MGJVYzJ4aWM3YnZsemlLcTdrS3UzTTE2TkovN1N0U2lqYW1LcUxuNEg1?=
 =?utf-8?B?UERLaFJ4ZmtvTkdqOWNNOFlnQVVYdVBXQ2JBdXhhODhrS3p1YVUrLy92dHNq?=
 =?utf-8?B?dnNvMGNjc1ZwbThqaVM2aU92ZHIzZ3lLY0VkeEIwL0JIQ0VuNldMUjBGWG1u?=
 =?utf-8?B?Vlp5clZoc3RYWGdTa2R6ZmxoR0FkbFUyRWF2ZDl4d25HUUdwSGxnWjVTSkg0?=
 =?utf-8?B?Vi9URS9rZ0ltTUJ5VDh1OHRLUTBIam5IUmg0UnYvcEhKV2M5Ymt4YUtKV2RP?=
 =?utf-8?B?dWo3Q2JkU21tV2xVVGlxYmF2YURUYnY5bmRhS0x6bHpLR2VRQ1pLOEFBVnlN?=
 =?utf-8?B?MXdheXh1RG9MZmFpZzBsY2dkOUlQTkRRcU95WTBCbVpUTU1KZ0hyeXVTVDBa?=
 =?utf-8?B?MndteG9MZ3BjRndUZExtME55Q2l5RkZnVkw1UnhCNkJxYXVpdWZmLzlrM2VS?=
 =?utf-8?B?WVpabmxObnZld3cxSTRRL1lINTV1a0E4MThJQUMrTXpHbjZUdGpNVW84QXRC?=
 =?utf-8?B?T295dmxXd2xMR28vRGR6MXdTbWVlR1RVWTVrVFV1cUVoYlRIVGppL0xyZjla?=
 =?utf-8?B?aCtPVFdUT05wMWJGd2Q0ZkVWbGYyNE1uclFZSHpRWkR0WlBTOEpDZnA5T2pu?=
 =?utf-8?B?UzNjQTBETEk5ZlAvRU9qTkwwVE9jV1pCQkU4ZUJjWXpuKzViSjN4U1l3NndG?=
 =?utf-8?B?UXhNejdkWWEwaVFpWDAyVThNRkVPbGphSWNQNEpLaVZ0MnErTEFoMXRMOGVv?=
 =?utf-8?Q?50o/wpZUHH5OaklLEFt/SJTeT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96cb2ac8-01d0-4526-14ee-08db2924dd2b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 09:24:11.0769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l54XfAFFFmICBFiD1cWuT9hHLTvNrUHw7ARtbxLF9I7lCYSeUNXAHid05Ak6ENJPQzqlmJXKmBEy8dHgKGW7+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8366

On 17.03.2023 12:39, Roger Pau Monné wrote:
> On Tue, May 26, 2020 at 06:40:16PM +0200, Jan Beulich wrote:
>> On 26.05.2020 17:01, Andrew Cooper wrote:
>>> On 26/05/2020 14:35, Jan Beulich wrote:
>>>> On 26.05.2020 13:17, Andrew Cooper wrote:
>>>>> On 26/05/2020 07:49, Jan Beulich wrote:
>>>>>> Respective Core Gen10 processor lines are affected, too.
>>>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>
>>>>>> --- a/xen/arch/x86/mm.c
>>>>>> +++ b/xen/arch/x86/mm.c
>>>>>> @@ -6045,6 +6045,8 @@ const struct platform_bad_page *__init g
>>>>>>      case 0x000506e0: /* errata SKL167 / SKW159 */
>>>>>>      case 0x000806e0: /* erratum KBL??? */
>>>>>>      case 0x000906e0: /* errata KBL??? / KBW114 / CFW103 */
>>>>>> +    case 0x000a0650: /* erratum Core Gen10 U/H/S 101 */
>>>>>> +    case 0x000a0660: /* erratum Core Gen10 U/H/S 101 */
>>>>> This is marred in complexity.
>>>>>
>>>>> The enumeration of MSR_TSX_CTRL (from the TAA fix, but architectural
>>>>> moving forwards on any TSX-enabled CPU) includes a confirmation that HLE
>>>>> no longer exists/works.  This applies to IceLake systems, but possibly
>>>>> not their initial release configuration (hence, via a later microcode
>>>>> update).
>>>>>
>>>>> HLE is also disabled in microcode on all older parts for errata reasons,
>>>>> so in practice it doesn't exist anywhere now.
>>>>>
>>>>> I think it is safe to drop this workaround, and this does seem a more
>>>>> simple option than encoding which microcode turned HLE off (which sadly
>>>>> isn't covered by the spec updates, as even when turned off, HLE is still
>>>>> functioning according to its spec of "may speed things up, may do
>>>>> nothing"), or the interactions with the CPUID hiding capabilities of
>>>>> MSR_TSX_CTRL.
>>>> I'm afraid I don't fully follow: For one, does what you say imply HLE is
>>>> no longer enumerated in CPUID?
>>>
>>> No - sadly not.  For reasons of "not repeating the Haswell/Broadwell
>>> microcode fiasco", the HLE bit will continue to exist and be set. 
>>> (Although on CascadeLake and later, you can turn it off with MSR_TSX_CTRL.)
>>>
>>> It was always a weird CPUID bit.  You were supposed to put
>>> XACQUIRE/XRELEASE prefixes on your legacy locking, and it would be a nop
>>> on old hardware and go faster on newer hardware.
>>>
>>> There is nothing runtime code needs to look at the HLE bit for, except
>>> perhaps for UI reporting purposes.
>>
>> Do you know of some public Intel doc I could reference for all of this,
>> which I would kind of need in the description of a patch ...
>>
>>>> But then this
>>>> erratum does not have the usual text effectively meaning that an ucode
>>>> update is or will be available to address the issue; instead it says
>>>> that BIOS or VMM can reserve the respective address range.
>>>
>>> This is not surprising at all.  Turning off HLE was an unrelated
>>> activity, and I bet the link went unnoticed.
>>>
>>>> This - assuming the alternative you describe is indeed viable - then is surely
>>>> a much more intrusive workaround than needed. Which I wouldn't assume
>>>> they would suggest in such a case.
>>>
>>> My suggestion was to drop the workaround, not to complicated it with a
>>> microcode revision matrix.
>>
>> ... doing this? I don't think I've seen any of this in writing so far,
>> except by you. (I don't understand how this reply of yours relates to
>> what I was saying about the spec update. I understand what you are
>> suggesting. I merely tried to express that I'd have expected Intel to
>> point out the much easier workaround, rather than just a pretty involved
>> one.) Otherwise, may I suggest you make such a patch, to make sure it
>> has an adequate description?
> 
> Seeing as there seems to be some data missing to justify the commit -
> was has Linux done with those erratas?

While they deal with the SNB erratum in a similar way, I'm afraid I'm
unaware of Linux having or having had a workaround for the errata here.
Which, granted, is a little surprising when we did actually even issue
an XSA for this.

In fact I find Andrew's request even more surprising with that fact (us
having issued XSA-282 for it) in mind, which originally I don't think I
had paid attention to (nor recalled).

Jan

