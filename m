Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C234A5F40EF
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 12:40:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415387.659950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1offLW-0006Nt-5l; Tue, 04 Oct 2022 10:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415387.659950; Tue, 04 Oct 2022 10:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1offLW-0006Lf-2z; Tue, 04 Oct 2022 10:40:18 +0000
Received: by outflank-mailman (input) for mailman id 415387;
 Tue, 04 Oct 2022 10:40:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1offLU-0006LZ-12
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 10:40:16 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20069.outbound.protection.outlook.com [40.107.2.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edefd1ba-43d0-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 12:40:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8649.eurprd04.prod.outlook.com (2603:10a6:20b:43c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 10:40:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 10:40:12 +0000
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
X-Inumbo-ID: edefd1ba-43d0-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6v1xTPhIOBE4+aHCinAvbNInNYfx5DhEz/IxlzakKYX9H89aG6xgRGztNfsMXIFtgY+NA7naJYWRbvMUYs3/9ZUQM0sE6CntksAiWsqemQlXgazWKarFqXNAu3x5UGZHgZOMf4qNBn5lgBQBP35J5P+X7F/dgdK9dqmsaeW7O8emu29ztKEtjh4Wh1HUBuIdPGxB09Sv0JFLcvhhIOG0LvGyzaiO7kxIUCSzISS2bv0fIv6svDg/Dr3Cx1GRtBa5FfrqYm0//2ROCXodO6/0O9DYUU6/oXyg89Adcz1bm36hn3VwsHBg0+UPZT3UTKJF/rGdEmoEa13SFPA0ndyZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUMUb4rDVIPGGhMJuXs1xXw3TYdDQJYRwxQy55Zh8MM=;
 b=Xt4qafiKxuhBvaa4TCH84HOP2kPulE0NDb/Wskoh0uVtd/pVDpo0A5njh82LLeVDWSc2MuaAnRwqWNpwSN34nI/BhWGZ67W67ASefsPGpJxPPa78c+bdsbx7D7Np0PUYmK2nFg7B8Wn47x/UTYh2crZRwkR6mumdSCp9IfU074Jon7KsXNxViPaKLw9b901XVxWYbtzl2f0+tLB6cU9hFUPzk0M3+LBzbnTZk70jZI4xRz8HsbfGUm2yuFYAqEWfZDAMZc8qLOLl1wpbTD4bkVDnVQInxYB7Ys7OGPuZMk0Ol9exHrg6bYrwWnI3vO2ITk4rqW72FaqeC8NAXsv2fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUMUb4rDVIPGGhMJuXs1xXw3TYdDQJYRwxQy55Zh8MM=;
 b=cABjS7F4u+uGhfGFl5Q+pqwX+HnquwaCjsPkmRU95fN/R5mAhZyeWVZA3hb7zcXQIfItgAltbxKL77+FFc6D1lZJUychUMOPG5e6NNe1QNw/+Nn1SXE1j8U43m87feyvykKtGVICeVCnFanMAdOUh3NEp2jQkaUsmA3Tn3uKrsYAbBnR2FgmxapifnOaP1Bjj0QkKnMHNOmR7DfbuEWXfJ3E/cSavroSf/aJXqAjOajo+kmgvWbFj3nuTjVjaJcs4EwV+30BRLE8UYAlkONqPnnwPx75IkZZdJZuS4GMzc2jix1tahRkw4g7WO7/ykYoFTxh6rPH5rtwprNYNZUmKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea544e76-0dfd-4f24-89ef-25265f7b049a@suse.com>
Date: Tue, 4 Oct 2022 12:40:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH for-4.17] x86/efi: don't translate EFI memory map MMIO
 regions to e820 RESERVED
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220930141737.67574-1-roger.pau@citrix.com>
 <e3235c0f-5964-0f95-fcc0-bcc44bf9d784@suse.com>
 <Yzv8lpnf28aXgQQM@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yzv8lpnf28aXgQQM@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0051.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8649:EE_
X-MS-Office365-Filtering-Correlation-Id: dfe18a0e-886c-49e4-4b7e-08daa5f4d11b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lgIlyLBmzl3TLsxfTXWSAE81VtfihUctRTxDqNRtEHeS3rD97eDKW9K7jzC9VP3sqfX5LTWPz7AnJOPzQB+2mNpCAmKavlM+MtENSs1BvzF+iL46A0Wrfrj/aco5hivTj3Q1j4BLGMZEtSGWmMvtTlOins+xygMAq0+teRT86iQOcooGbZre4TZzxEYNei+JNEHzCKYNDoZOrA9FNHzf619kA4t2nnWsVl1ZrNr3+LaCAgZacWL6EfKaBjT0UNpN/eMtM6nCwAivtuH/8XwEcnV/Wzs9S8q0/YrB1bnIpS2zgQSOvtdVV6rKSIGjDtMtzfdMQf+v1CyMuzUFeyq0p0Bm/BO/5CcWEFHIGHaK1MO/8kisNPEOwiLlYKJ2Q5mKdhJFjkCLwQXxYu+xl9LKeMfVrQz2fMIAXtDHVRFsJPt/388OE7j51Ya9qq9obhowJF6HWBkuony2zPTzg4VzunIs+t2YKAkob8dSILuQt22Ma64e6fIo8ET8KAz0feHmBZdFbNmksH+GDqmp2gJiphGId0Gxvcdw8BKQZDkzDjsbH6OEw8eRUfHkE35YBswULt7hm2CVHOUwRxGGasj3hll4eqXNLNqhsFH7NqnBEpaCyUo9aIO1uF9yJ0uH4MU2tcxG0ybWiQOKbNm3rFkkComNza/lsAemUvynL3bjosorKJd01h6RnYXi3ORd9UqtGV6gPyS0AamctVmlZN9B0bsa53c79YBOr067Xyuo/1/E44l4oGiDwBMpHaztOJvKwJWatWyN+iD+j/T9TcD5F+7TZhUS/BFk2e/JhvoByLE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199015)(66476007)(66556008)(66946007)(26005)(4326008)(8676002)(6512007)(83380400001)(186003)(86362001)(478600001)(6916009)(6486002)(54906003)(38100700002)(316002)(2616005)(31696002)(36756003)(8936002)(31686004)(5660300002)(41300700001)(2906002)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0owcnV3d3dOV0NmY1VSaWpwWDJrK1dyc0o1cEo3b1BJZzJ2eGQyamh1cy9y?=
 =?utf-8?B?Z0ZvN215QVlpVXBjRlowSlY1bTJjTEtwRjVvOFdLSk1MR0ZYUTQ5YkQ4dDZJ?=
 =?utf-8?B?TTdKZ1g3aXE4Q2x3SmhDK0oxaXpCSTFHdWVBQTQ0dGRuSExHUWFvQU9xWDBn?=
 =?utf-8?B?dm5rVysweWl0djN3QUFmZ2xJcDlVUlgrT3ZsTExZZ0ExMlJSVkxJcVVZdTFy?=
 =?utf-8?B?aDVBZ3J5cWJmMERaeFcyQTBLNksrOUVzUm1Zc042V2V5N0R0cld5UnIreFRk?=
 =?utf-8?B?RnM4bXVRZVE0clB0S0dCbEtob1I3T2lSSW9GNVJqTEZXUk1iQTJ3eHBkZVRJ?=
 =?utf-8?B?a0tZaC84ZDVYSkN3aFIvTndNb1lFamhZTExPVTNIUWxjL1ZSMVViRFp6cGtE?=
 =?utf-8?B?ZjJmZ2FUc2dCNWgraFJkOHJYTS9mdlpITzVlaTYrMFRoeEk2bGs2eWxEWGJM?=
 =?utf-8?B?QkRxSGF3TXBGVTdmaGhFcTl1aGFSMTVIbTBQT05yQTltVUFseVVMT3B4UmRQ?=
 =?utf-8?B?NmdsWFhwWmxIanlqOEwvaHFQWDBKNVRKTS9rUGg2Nm5TRU5wYU1uT2lUekZ3?=
 =?utf-8?B?QkZMVTEwcFNEbDR6YmcrczVRT1E4cVBrZnI2d05FVjBocCtodTV6cUs4N3oy?=
 =?utf-8?B?b0RUOVIxYkorVEQyWmFhYkVzdnp1Ykh3c1VXMnhXb3hIeXUvb2pkc2Ezdm9S?=
 =?utf-8?B?WVk5LzZ6T2h2VkhUei9pQ0hPdTF0eUxsU0F0MG9XNDd0MVNHVjB0SUpnKzNh?=
 =?utf-8?B?ODlaQXFDVFdPakJyakljRlFQVTl2ZngxV0FkSFRsT2JIQ29pRkZ2dUx4dTRa?=
 =?utf-8?B?RUtFMDV1V1VBU1FETkk2bzVTdHhEbzgydXhMUGxVbTFoSm0xRkpzc1k2ZUlK?=
 =?utf-8?B?TG5hYjA2TjZiaUFBTFpmRnlmTUNlUjMvMnFjeVhISXBZbjQxZVlhbklsRkVw?=
 =?utf-8?B?T0owb2dnY2w5cnBHcnE0RmI2eTRFMDlhYTZGbkNnei9kL3NMTUVFaDBMR2RX?=
 =?utf-8?B?WisxaFFDeGdVenQrLzZJb1JGdy9zWkJNVWlkUzVmVFJwQ3FZM1pVa0ZzUGx5?=
 =?utf-8?B?QjJFcnVGWXhHa3pZUFFaT2lueU1aTDlGRnd3RitRMXZLM1JpSStudnF4c1lJ?=
 =?utf-8?B?aHV2V0diL0JJWDZnUHB0NE9JNlQ0a0xXTnFQQWF5SUpVSUQ3U0lCa0RFaHMx?=
 =?utf-8?B?bUs4UWFYR09PM1ZnS2VhZ01iQ3dNdjJ6MU1FOUJxb1l5d09LTnVnT2ozMDYy?=
 =?utf-8?B?MjhXQlhIS2hWbXFscGhmRFBzZ2xLZm55TDVoU3FvdHprVkVDRU0zRkFRRkZl?=
 =?utf-8?B?eUlVQ0NiNytiS3RuOTAvSU9TQTI1Zk1KWHFtTVAxcEpUc2NCblh3RnJib0Ra?=
 =?utf-8?B?Rk1TRkh3VVhJTm9TZFc4S3RHOEhjTlBGbUhDdmk0MlBjYk01bzMvbjBxcktK?=
 =?utf-8?B?dWkvQk1IaU5YVElockJoVDVCMTFYb09udDBqTVJsbnFBam1vME8xYkh4ektj?=
 =?utf-8?B?Z2hEaHdUbFdFVjV5dFkxd01LbzBvZHlHenh0V3dGSXB3cXFNYWJOQnJ1YTQr?=
 =?utf-8?B?Y21tL04wNngyZGFLSzh6MXI3ZmNiWFNKZmV0bkVrQ3MwTWZkQy9aMnh6YzNh?=
 =?utf-8?B?TCszMkJxOUV4bmN1TWhxSjB4Y2FOcko3WnR0NkFRR1E4RWMzYWtvcWhvajFW?=
 =?utf-8?B?RDhvRE5aWUh5dW9JY0NTSlM1Y0hWNC9LcjEyeUp0OXA4c0FBTWZ4YWQyMysz?=
 =?utf-8?B?enc0RE9BWDlEWHEybUgwMjdFS1hDekJkdTdML2IyQlV1OXpMeE0wbVhMelFy?=
 =?utf-8?B?d0FrdjhaRDJ4a3h3Mm0rL2tNQ2JhREVHMGxHSUNYOXlYSFIrREhGeUc0TFEw?=
 =?utf-8?B?WmdxRDg1NXA4Y294OUlGOVo3czlsVDgvbzBsUTN2eVhCcnpFMkdCU0VqRFlE?=
 =?utf-8?B?Z1ZkZURVdXdkaDM0bERjbUh2SGxpOVZHL0dXZXpnNWk4dkVOMzhoQ3FGalZl?=
 =?utf-8?B?NWwwUHhjcFBUT0VoSkpmSWs4OWdlS1RJOXFobUR3OWRCaXdGTEhva0pFaWhx?=
 =?utf-8?B?TGRGUWo4Z3NZazVCL21jZGlEdjdnb0VLS3pGajJlc3lTbHV2dDRoTklwVGM4?=
 =?utf-8?Q?O3mLX5De4fJXh8ZIqMUGJtW9Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe18a0e-886c-49e4-4b7e-08daa5f4d11b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 10:40:12.6582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmXtiPBGQ7rg/tYfQr5qRhgpofhymHvjLI3+Ckh0hURLBtFBJc0EReyfY0yg59N1lVIcwdS5f+61yCeeYVfaOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8649

On 04.10.2022 11:27, Roger Pau Monné wrote:
> On Tue, Oct 04, 2022 at 11:01:18AM +0200, Jan Beulich wrote:
>> On 30.09.2022 16:17, Roger Pau Monne wrote:
>>> The EFI memory map contains two memory types (EfiMemoryMappedIO and
>>> EfiMemoryMappedIOPortSpace) used to describe IO memory areas of
>>> devices used by EFI.
>>>
>>> The current parsing of the EFI memory map was translating
>>> EfiMemoryMappedIO and EfiMemoryMappedIOPortSpace to E820_RESERVED on
>>> x86.  This is an issue because device MMIO regions (BARs) should not
>>> be positioned on reserved regions.  Any BARs positioned on non-hole
>>> areas of the memory map will cause is_memory_hole() to return false,
>>> which would then cause memory decoding to be disabled for such device.
>>> This leads to EFI firmware malfunctions when using runtime services.
>>>
>>> The system under which this was observed has:
>>>
>>> EFI memory map:
>>> [...]
>>>  00000fd000000-00000fe7fffff type=11 attr=800000000000100d
>>> [...]
>>> 0000:00:1f.5 disabled: BAR [0xfe010, 0xfe010] overlaps with memory map
>>>
>>> The device behind this BAR is:
>>>
>>> 00:1f.5 Serial bus controller [0c80]: Intel Corporation Lewisburg SPI Controller (rev 09)
>>> 	Subsystem: Super Micro Computer Inc Device 091c
>>> 	Flags: fast devsel
>>> 	Memory at fe010000 (32-bit, non-prefetchable) [size=4K]well
>>>
>>> For the record, the symptom observed in that machine was a hard freeze
>>> when attempting to set an EFI variable (XEN_EFI_set_variable).
>>>
>>> Fix by not adding regions with type EfiMemoryMappedIO or
>>> EfiMemoryMappedIOPortSpace to the e820 memory map, that allows BARs to
>>> be positioned there.
>>>
>>> Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> In the best case this is moving us from one way of being wrong to another:
>> So far we wrongly include BARs in E820_RESERVED (_if_ they can be
>> legitimately covered by a EfiMemoryMappedIO region in the first place,
>> which I'm not sure is actually permitted - iirc just like E820_RESERVED
>> may not be used for BARs, this memory type also may not be), whereas with
>> your change we would no longer report non-BAR MMIO space (chipset specific
>> ranges for example) as reserved. In fact I think the example you provide
>> is at least partly due to bogus firmware behavior: The BAR is put in space
>> normally used for firmware specific memory (MMIO) ranges. I think firmware
>> should either assign the BAR differently or exclude the range from the
>> memory map.
> 
> Hm, I'm not sure the example is bogus, how would firmware request a BAR
> to be mapped for run time services to access it otherwise if it's not
> using EfiMemoryMappedIO?
> 
> Not adding the BAR to the memory map in any way would mean the OS is
> free to not map it for runtime services to access.

My view is that BARs should not be marked for runtime services use. Doing
so requires awareness of the driver inside the OS, which I don't think
one can expect. If firmware needs to make use of a device in a system, it
ought to properly hide it from the OS. Note how the potential sharing of
an RTC requires special provisions in the spec, mandating driver awareness.

Having a BAR expressed in the memory map also contradicts the ability of
an OS to relocate all BARs of all devices, if necessary.

>> I guess instead we want to handle the example you give by a firmware quirk
>> workaround.
> 
> I'm unconvinced we need a quirk for this. AFAICT such usage of
> EfiMemoryMappedIO doesn't go against the UEFI spec, and hence we need
> to handle it without requiring specific firmware quirks.
> 
>>> ---
>>> I don't understand the definition of EfiMemoryMappedIOPortSpace:
>>>
>>> "System memory-mapped IO region that is used to translate memory
>>> cycles to IO cycles by the processor."
>>
>> That's something (only?) IA-64 used, where kind of as a "replacement" for
>> x86 I/O port accesses equivalents thereof were provided (iirc 4 ports
>> per page) via MMIO accesses. It is this compatibility MMIO space which is
>> marked this way. Such ranges should never be seen on (current) x86.
> 
> I've heard the Arm guys speak about something similar.
> 
> There's a clarification note in newer versions of the UEFI spec:
> 
> "Note: There is only one region of type EfiMemoryMappedIoPortSpace
> defined in the architecture for Itanium-based platforms. As a result,
> there should be one and only one region of type
> EfiMemoryMappedIoPortSpace in the EFI memory map of an Itanium-based
> platform."
> 
>>> But given its name I would assume it's also likely used to mark ranges
>>> in use by PCI device BARs.
>>>
>>> It would also be interesting to forward this information to dom0, so
>>> it doesn't attempt to move the BARs of this device(s) around, or else
>>> issues will arise.
>>
>> None of this is device specific. There's simply (typically) one MMIO
>> range covering the entire 64k or I/O port space.
> 
> So this translation region won't be in a BAR of a host bridge for
> example?

I have to admit that I don't recall at which layer the conversion happens.
I also didn't think (host) bridges would typically have BARs. Bridges (but
iirc not host bridges) have bridge windows, but that's different.

Jan

