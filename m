Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0896C35CD
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 16:36:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512802.793036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pee1p-0006Fy-Vu; Tue, 21 Mar 2023 15:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512802.793036; Tue, 21 Mar 2023 15:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pee1p-0006Dg-SS; Tue, 21 Mar 2023 15:36:01 +0000
Received: by outflank-mailman (input) for mailman id 512802;
 Tue, 21 Mar 2023 15:36:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pee1o-0006DH-Ri
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 15:36:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13539413-c7fe-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 16:35:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB8020.eurprd04.prod.outlook.com (2603:10a6:20b:244::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 15:35:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 15:35:56 +0000
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
X-Inumbo-ID: 13539413-c7fe-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3PZf+Mlqte9NHyhpcrPxtL0JqnazYv9m4ilEUviAy1Zz8g653f2fBfCUPiS2YSmV6RDozrzxR+ACU7pbwqEnJzFzfFirscmRClUnbvrDxWMVlQvXYLN9RS2e6Ic+ByPTpY/mSmI1ADIlJVSoyWdRP7Ata3nfTOm6itE09unm/jLMzOPvGqYw2BmjKDI6XYHWLukI3XvE3wW6v/T1Gm9dzC0ayWQUIaZfg/2DC1ELpc/PgElrHpbj8qYKN/8ZNmNcZe3So2lqUzVMv9HNqXBHcK0u/Wjgb/TVUkw24iaiA8eI1jm0/M+5dVwia/8ys+TOYju3lLoeeyVY0EtOzv2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OR8m9vyw3SSyqFlEWe4IM1KY+3kZKb6AbxwRWneImdo=;
 b=VPMZwb4RFzE77eBbjy02kdMx71TtmmVSRRBeG1wZcQgMH22qoMvlPlB4KmNHrnvUy7+EP91bkqRyI4+yUNxpjfdyHXJo2kIEcguwhjFhc1CSqg3N2aZGaRCbE3TBBWaw3XGUGRtvpf4KmPoQTTyjzLmQ0VgO2XYK3+CKlPRK+s1ItUQ5LPWlCd3+VYX5qfhqUow91kLPinfpQthnTkCJHdQOSC8T/JB1FQrAkU7iu6VEJPrsvvPJ3BYTVXQ6tZgke79m+IW1jl9IfR7S2y40BV3fG1n379qEG3YUBobG8h7cET6tHEtZviZ6roIy0s0rATXOSfEpWUmzqg1e/wJ2qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OR8m9vyw3SSyqFlEWe4IM1KY+3kZKb6AbxwRWneImdo=;
 b=2GL7PYEcBPSiMYUZ8PIM9Avp34XSZ31aGRv0K0f3jbEN7r6NudF8nHfJpZP2nZS2QTlnAZwlY4UCOLGnCY8R7pbMoNjJewKvpLo4A2CtlxCqeI2z+0+nsadWiS4YvW17nQSe4e9kHPS9nkNDqPjqLE4BA3yK+7WO07Y3bQsl0Vc7Vc/+VB6Erl/S3ld2NlUYcF0cikDDzvdCGXe6pLz2Zv6dDbgLSaWmYVi5nJHRT7wetx7/VT499YTyVsCBnQAb7Ujkxm0gddxCyReSjYEpP8TbDRjX7zlmAsBY5h3NtA6pKrCvRF7t+RQIvB8LXHDEhGMdrVImtDNNVdOXVwNFgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e18b997f-48ba-4090-0c0e-67475f5b3329@suse.com>
Date: Tue, 21 Mar 2023 16:35:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] x86: use POPCNT for hweight<N>() when available
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
 <ZBRNWhExetXH1OaS@Air-de-Roger>
 <011cb7d8-fb32-74b1-2b06-f57be67f5c6a@citrix.com>
 <f1b0e3be-cf23-6471-7a59-c130380be0f8@suse.com>
 <ZBnF2oTLQjJtfZiK@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBnF2oTLQjJtfZiK@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d85914-26e2-47c2-dee2-08db2a21f661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BJ0cvuuCgQHiqgakW5lwh6f+cTT3ui03fqoiFl3jUlZw6VB+UBQWoItLZRmh7Kp6naLWTXwdhcEKnv0yWUNjmaWNJrECGmbKVS3h8YIehaZBDM6/6tjUW6gFqvsupoFF+2AYRa3aPNI9ewPqIoi5EqOvW354VNVT2/X/mrqsr7Bj0Hvj2WPo8uRqg56x2cZdY3aGy1aU3WE2atuCF2/MYJG2fNxLBWdQ1J1+OjL8qq/oPv88gdUiPLmsMcYMkm9Hfvj0qCFflR9GOslOkhQkHOPshrOwR1YVRw0leK0G7sv0/m0477E2ANbBSqUMRBnLHiXaRjkv4YoVqCfSBviyfMA/crMiwTAZq0bp8l7UOAMK2NIA+YN9n3qdlZy6iwbp10ZOBZuKkqJnEWbMXP4a1tWmsRqycP++IqI3l3tqjAfVokPINFgk5km8cenRnz6LaU1mUhlt5zIo4HTOL6nhJF80m5ghi8aA6hvT+Gw8i5FlMqjWQRgYCBkJ9StpBGx9CeSz4a5YKKCstLef3XwsAWwsVciSpFujVIPbiBcx79G84bsSDAn8LUqRAisuQfWEUjYgahknkpZ8aP3PBEoP/3N/5jQ6B9S2NzQscVdOczj1PjZC4/ZyI0RgP+gW7vVQ1yOSivG4ouAmisEThLwdV9x4t2amM1UIVn1AOpp9QINfoFmYiFk3J4fKTEeE/i8SQPQ1gGAcCPwvQyI/gD+wou7vL8kZcgaq2ndhNyyZoVJvlArLKHgmR1YwB3ulzDpVvRe09kY0Xvzo4V+Q+sOzzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199018)(2906002)(31696002)(86362001)(83380400001)(186003)(5660300002)(38100700002)(8936002)(2616005)(41300700001)(26005)(6512007)(31686004)(6506007)(53546011)(54906003)(478600001)(316002)(36756003)(4326008)(6916009)(8676002)(66946007)(66556008)(66476007)(6486002)(16393002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zit1OUUzdGtLMXdlQklZZTlsNVZMK1FxSjBScXNvQ3NmMjFnbUg4QklGcFMv?=
 =?utf-8?B?elJoZFE0QUhhVitxRmg2dCswWmhKSTR4S2UxdlhsSEdpY3lpYlYzNGJHQzA1?=
 =?utf-8?B?TDBvbi8xTVRsRFM1WngxcHJEb1FyWXNSUkJ3d2htUDNsdHNvZ0t1UVNYWHFt?=
 =?utf-8?B?Z2FDcU5JUlJDU0lNTHpzOTlRZlE2MEI1SllKeEdHd0NUOU1jd2RFeFpYS2dN?=
 =?utf-8?B?UlpEQytVcmEweG0yZ1ZSejlzMFEyZCsvSjdYSEtGUUdLc1YrVFgrWksrMG9x?=
 =?utf-8?B?V1lhTEpoeDYyTzZCaFNVNUpSM3RHeEIrMzdsSFkyQmhlZlBrd2FXMHdtekU2?=
 =?utf-8?B?akEwZjE4VTRUUC9JRnZOZkQzK1YwNlNnWVhvODFLdytIL3M4eWRmdFVyeWNl?=
 =?utf-8?B?Q2JxaGRNN1lPWmhiT2ZKOTNxeEl4MmN1WjhlN3JhUUthUVA1eEd0NENzOHZM?=
 =?utf-8?B?c3RzQnBrSmZyK1NLUERYK2l2bHViYm4wY0NuNEFQOCtOSVU4Sy8rMXc2ekFq?=
 =?utf-8?B?NXBMN3NsOHQyWmtaelNKSGZFbGpBU2crL1N4TkhkSVhMQisxc3hWbHFxNUg3?=
 =?utf-8?B?d0JpTDlheVdvcDg4R0tYdXowcUFIN1BpSUFWazNFZ1N3Umd0MHZheFJCRzFP?=
 =?utf-8?B?TkozTkY3amtOS2hTTWZSTjZvVTVVZHBkVjJWN3V2cFNjYXI1Q3owejh5K0d1?=
 =?utf-8?B?TThwTEFMZzFLYi9JV2k2RXBzb0lLbEozZzNoUUxzc2ZSdWVoMGNrdG9zNXds?=
 =?utf-8?B?YlZUbGt6Zi9HdU5laHFuNUhTdlE4b0ZDMlpPSFNMQTR5UlJEUHR4WFJQQk42?=
 =?utf-8?B?ZWl5eTRDdHBzZXBkMVJjR2F5YUlZNllmL3EyMHNNelZwMkh3bDRtbXRLb1lv?=
 =?utf-8?B?SFBLRzhhMEFIT3BibEVhNjJ2SytkVXVKaVhLM21SRFp5dU9zWW5oc1pBNFVy?=
 =?utf-8?B?Y1pkSllqNGIxdzdBckZFemZremU4UG1iRHNuMUN1RVloQUN6djZtYVlqTTdW?=
 =?utf-8?B?NW9VWlZqb01ZYnNZdFhZV01HWFNVZGpQVSt3Wnh4bmk1Y1ZxVzZCbmVkYXB6?=
 =?utf-8?B?MGJzUEpqZ2E4b09SMGlxMGJMSFFQazRPQUZUUE5XR0g5MzdFY3ZLb3dZaXBH?=
 =?utf-8?B?UG1FS3lLZHA2cm9TRkZkZHpaZFJjNDd3SXEzVEVHYm45blNzRWp1SlA2STlJ?=
 =?utf-8?B?S1lXYzZIb0dYQldCd1dMTHBQWHBWNytsMmF0Wi9ZS01rdFVycllteURYYVN3?=
 =?utf-8?B?T2xsWjVQM25jQWhLb0NlNEhaM3V1enVnZmdIWk81U1E3ZVpObWpqN0d2VENF?=
 =?utf-8?B?RU50bGladStzL3IxZTBtU3F5TFJreHA2U1JrYTg2K1ZaL2xrNjVzSzR3SENu?=
 =?utf-8?B?UDNOa1NXUGNPMk9VSGZ0Qy9CT3JvWVpsMnE5bTFHa0VSZzR1SE82dzRIL1pT?=
 =?utf-8?B?TUpHbmVDTVRXQVhDT01RU29qam9XZmw5Yk1vcThhQlc2RE5KL2dtOTJwK0lM?=
 =?utf-8?B?ODg1cWh6QmFDVXlXNHBETktCR29FcVRDR3pIN3ltTy9WRzdobWxOb2R5RmNR?=
 =?utf-8?B?V2VvU0ErYU5taWFpTWZuWDZJRTE2VzNJcVdjejE2enNJQnkwRVBaM0MzbVkr?=
 =?utf-8?B?N1JpOGFSNUk1N1Nyb1pneENqejArZEROVzBuRkovR210M3luaXZRNThicmtO?=
 =?utf-8?B?VnpDT091ME45S3R0K1NHNVh0OXpQTW5oNmRDbEErRUFkT3g2QlI5UW5wUy9K?=
 =?utf-8?B?K0Q1YlFKdTROQWJRanFtZWh5eHJHRUo5WDdXUUEwaWl1RTFpNjV0NjljN0FS?=
 =?utf-8?B?VEZ1dVl4VXJzY2V3ci80Q0h1VDZQbUNoWm1wNGxjZWhteFlreENBY2ZITTY0?=
 =?utf-8?B?c0R1ZHN6b1I1bnNJbG1LSGFObnZKU2VFaE5XRVlueHJZYmtGQVZTQVVSTyt5?=
 =?utf-8?B?a1FTaG5XbEM3RzdHTnh0SUFLNThNTnB2T1dlR0JuZklrS2NpRlg0WHFVNFJS?=
 =?utf-8?B?YkdOVGovamUwWXVvd0FvQlhsOFZHZHNnWWdhN0taRkJYNHg5bkUxUGs2aGov?=
 =?utf-8?B?NkY5L1AvNUdzdjhPU3JhWjljK3lPMnhFTVkycmZ4TEpZOHFqZUJwUXV3ODNj?=
 =?utf-8?Q?1sRttmer0rCQjGlvc8SK1vPIe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d85914-26e2-47c2-dee2-08db2a21f661
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 15:35:56.0359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2bM5DanKSP0JDIUFHcma8n6/34K4WrMaeQehg3Prs7eO2jLcRh42g43NQZSaO4Gqvppni4XGuV4fLUOzDfLeVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8020

On 21.03.2023 15:57, Roger Pau Monné wrote:
> On Mon, Mar 20, 2023 at 10:48:45AM +0100, Jan Beulich wrote:
>> On 17.03.2023 13:26, Andrew Cooper wrote:
>>> On 17/03/2023 11:22 am, Roger Pau Monné wrote:
>>>> On Mon, Jul 15, 2019 at 02:39:04PM +0000, Jan Beulich wrote:
>>>>> This is faster than using the software implementation, and the insn is
>>>>> available on all half-way recent hardware. Therefore convert
>>>>> generic_hweight<N>() to out-of-line functions (without affecting Arm)
>>>>> and use alternatives patching to replace the function calls.
>>>>>
>>>>> Note that the approach doesn#t work for clang, due to it not recognizing
>>>>> -ffixed-*.
>>>> I've been giving this a look, and I wonder if it would be fine to
>>>> simply push and pop the scratch registers in the 'call' path of the
>>>> alternative, as that won't require any specific compiler option.
>>
>> Hmm, ...
>>
>>> It's been a long while, and in that time I've learnt a lot more about
>>> performance, but my root objection to the approach taken here still
>>> stands - it is penalising the common case to optimise some pointless
>>> corner cases.
>>>
>>> Yes - on the call path, an extra push/pop pair (or few) to get temp
>>> registers is basically free.
>>
>> ... what is "a few"? We'd need to push/pop all call-clobbered registers
>> except %rax, i.e. a total of eight. I consider this too much. Unless,
>> as you suggest further down, we wrote the fallback in assembly. Which I
>> have to admit I'm surprised you propose when we strive to reduce the
>> amount of assembly we have to maintain.
> 
> AMD added popcnt in 2007 and Intel in 2008.  While we shouldn't
> mandate popcnt support, I think we also shouldn't overly worry about
> the non-popcnt path.

We agree here.

> Also, how can you assert that the code generated without the scratch
> registers being usable won't be worse than the penalty of pushing and
> popping such registers on the stack and letting the routines use all
> registers freely?

Irrespective of the -ffixed-* the compiler can make itself sufficiently
many registers available to use, by preserving just the ones it actually
uses. So that's pretty certainly not more PUSH/POP than when we would
blindly preserve all which may need preserving (no matter whether
they're actually used).

Yet then both this question and ...

> I very much prefer to have a non-optimal non-popcnt path, but have
> popcnt support for both gcc and clang, and without requiring any
> compiler options.

... this makes me wonder whether we're thinking of fundamentally
different generated code that we would end up with. Since the
(apparently agreed upon) goal is to optimize for the "popcnt
available" case, mainline code should be not significantly longer that
what's needed for the single instruction itself, or alternatively a
CALL insn. Adding pushes/pops of all call clobbered registers around
the CALL would grow mainline code too much (for my taste), i.e.
irrespective of these PUSH/POP all getting NOP-ed out by alternatives
patching. (As an aside I consider fiddling with the stack pointer in
inline asm() risky, and hence I would prefer to avoid such whenever
possible. Yes, it can be written so it's independent of what the
compiler thinks the stack pointer points at, but such constructs are
fragile as soon as one wants to change them a little later on.)

Are you perhaps thinking of indeed having the PUSH/POP in mainline
code? Or some entirely different model?

What I could see us doing to accommodate Clang is to have wrappers
around the actual functions which do as you suggest and preserve all
relevant registers, no matter whether they're used. That'll still be
assembly code to maintain, but imo less of a concern than in Andrew's
model of writing hweight<N>() themselves in assembly (provided I
understood him correctly), for being purely mechanical operations.

Jan

