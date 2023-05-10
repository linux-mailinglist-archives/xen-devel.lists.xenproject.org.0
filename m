Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 196166FDE5A
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 15:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532798.829102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwjhJ-0002wW-Jw; Wed, 10 May 2023 13:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532798.829102; Wed, 10 May 2023 13:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwjhJ-0002tA-Gh; Wed, 10 May 2023 13:17:37 +0000
Received: by outflank-mailman (input) for mailman id 532798;
 Wed, 10 May 2023 13:17:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwjhI-0002t4-3F
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 13:17:36 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe16::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0551a46d-ef35-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 15:17:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9637.eurprd04.prod.outlook.com (2603:10a6:102:272::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 13:17:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 13:17:28 +0000
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
X-Inumbo-ID: 0551a46d-ef35-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHvcEEGW4owMrKE8MSJ6k6Ar4e/9rFA1zZ4kjaNvz9lKokiUgzBirA6ZLRyiCDOC37ZvzXfNswXBLyvt4kY+gtSL4PrQRkm0jj1Yr8ys+FIXa6RmXXQH/CAN8Xg0pFe8khNCek7zPy7RmzYiyImQJpYStUaMC1OCjlNvZYHmo11xh/fzkhx5LaHas9KD13Jic75LTC3gJMK2ERaCWxstSxYyv3vsxPQzmBIzlwSuqck01v3aOx/fRpdGqU42zq/QoTEKgdlj1uOTFkm/IpW4ZOOhUK5M1mpCIt4KN7eQKSdsUXI2zmauFIbOHhqTXvUEnZqybu6ukURWLhZAUASgKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkoh9VifVEwZQzVn2Y2CdZmtitVrvTfVply5lW35MOk=;
 b=YgDMzpK4JVH1wlcB93aZlREzHVY9o2sIE+TDrK+FX32O8TmN7AYnO21pRPQzwCXFxfayR9uv1BBkUK8IE0OCKKfOv2c7wru3UsdjJkOnwJOO3gy2/ehePaXnht80laNkevBeWtGv3QFRuEaX/JYWjfRueftV4dFeO49bHwMGT85ffYN5KyAYP44nVlnF+6PHGT1YXu4IwOm53lFn94/foGE08cs9Bw35qqRO9AXTXOgXcC340RTYe/bRuo68z8gdHV/xAKfmBP4Yj9lMb9hbjhy4+3Yn2hZdnXdR1CL1rSNrejHY5Vv5ZnyY7QNutADr0+mCjj7y6rc6JhwbW/reCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkoh9VifVEwZQzVn2Y2CdZmtitVrvTfVply5lW35MOk=;
 b=Ypf/j8aFF5lAfx9Yd/6hfYLvkt4BZEbRYbtf6NvB74i6JzyU6cY5I0ZMvBtCdQYRO23oIRyF60dZBv16dgJbT+YASKRwCxmxNTJ1TielVm1ke4sKlOY1/MBXLeXXGQsxGyQ6IVuypbwP8WSV9fNiXO7MV12TLQUlSRfXkJmYndpQOKDzX9xb2jJxQ4UufnqIfHVDLE5KQii4CWmhARM7LnFsXuf6nkqSZTlsRj3vcdMVZLjJcJqfZ2kp2UieRXjyU5m5A2QZwYNXBB5hJJnB2MjYsPqJYTz5Dbwk7y8EGBJ2FeB2CD7c/Jh+2DfdbW5xifXjxeWUekleW8+FNASO/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d32a49b4-5d68-9844-cc08-271a488534ef@suse.com>
Date: Wed, 10 May 2023 15:17:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/3] x86: Use CpuidUserDis if an AMD HVM guest toggles
 CPUID faulting
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
 <20230505175705.18098-4-alejandro.vallejo@cloud.com>
 <d8c9728b-b615-7229-2e76-106d81802a20@suse.com>
 <d0794e7d-604e-044f-000e-3a0bde126425@citrix.com>
 <7d41940f-e671-954c-1afc-510e4fa674fa@suse.com>
 <645b776e.5d0a0220.3ff50.bf0e@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <645b776e.5d0a0220.3ff50.bf0e@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: e44d9632-9d7f-45b7-77da-08db5158e765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CKnWuHyeRsQtoqU4qOkJdjV5c1a4KYwUXyzndytTyu4HLvYerlipFuAYgSgZEdorWEieZL5cJ6YkmfD+0Lw3LW6lG03kdNjgyfM3GIvmpKC5aumM7EYItjMdLWeJHDmEOUIx5nnchAiCFQ/imUSZuTOK41TEzmgFybeusyTAm/ia2udNylOefjyT4NWP9IGUpewrrbWn9tvbyNavFZKfP+K83Nhpep7l3CXCoeJ8weq5y1h60tYg5BaO7bR2vsv+jFFwffKZ80h2Xx9h/8BHt/CxuGnREVl0O/q9Uj+v9pI579vEK5wOQzvMcFiz0fI/LiK3nobQz+HwMoa61B4GhCyJwJPjUn3MKB3SBSASWyaRqaFiHbHuv2dHRwYX+NRSyEA9NcugLi6UA/zYTvv1dUEXWlKblDUREFPCrlUerEuS0z34UKYREvhRsAE2OQ/UXM1wpMAx71V5f6aw33K1nrW1549joknXZFoeZ2SIBKsx0ErvwMFHuJtA2rkrgjcf72b7XB7PHVeX5qLcgxBqA0fMq6pWbNaI+b66W7lnVJSOHMq1TOW21Au/C7DKf22Zb09MfQlTrZtAsfCSAkzsQ6NqsqsMfhR7BVC7rKZFZjoU9PyhJ8Q1S8LJO8Mb+QzeWpdNspeHE87NNdyjMsCgKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199021)(5660300002)(54906003)(31686004)(478600001)(26005)(6486002)(41300700001)(8676002)(316002)(8936002)(6506007)(6512007)(4326008)(66556008)(66476007)(66946007)(6916009)(53546011)(2616005)(2906002)(83380400001)(186003)(31696002)(86362001)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0g5djJVd3RxblkxK3ZLdUVQQmxhZDFobk9xTlpSTGFwaDMxOFNwL0c2RGh0?=
 =?utf-8?B?RTNndzNBVHEzTVYrSUtuc3hCMmRuUVkyYXNvTG5kZ2N3R2tZWklDcExWTkNR?=
 =?utf-8?B?RFEvRXFiaGExMEYzVXhUL1RmdVZ4MGpnQUF1ZE5RZGhuWkZ1U2FwbWYxYnhE?=
 =?utf-8?B?NHkzbTNHeTBlazk2S1MvalFaZkUvOHFlZ1RtVjFISVF1em0xTk9FeWFZUkIx?=
 =?utf-8?B?MzMyOVZoa251SDJGQlFJZUxGZFNIRm95OXlWcjNHQTRoVGw3dTMxdGszWENu?=
 =?utf-8?B?WEIvbmZ3T250c2krVjdUdUR5ZTMyR1c5UnVudzQ0WE5yNEo5WjJhc2N4a0Rn?=
 =?utf-8?B?OTU5WkNaZ0NJUHVwNDE1UG1ZN0RZSW5IbC8wRGNIWmluaWtMRm9RTEErNW1m?=
 =?utf-8?B?SFVkazU0bkpsY2FlZXJMVHdqY3E0QnJFTHVBME8xcHcwWXkyQXN3MmY1cGxG?=
 =?utf-8?B?Lyt2UEtnU1hGL0dZNjI3cmR1VXNmdnZQOHpSbUZwYVZYTVhKbTlMSGFnNHBh?=
 =?utf-8?B?WXVIQjg0RDIvNmZBaEZqUUswRWEzc2d2MVJnc2hqY3AzWVFsUWMxNVpyMTRD?=
 =?utf-8?B?dGxiQ29kZUpHRmYyMGZJdlM2QmZ1elVvUDZLUnMxWlE1SndMUHZZbGpPeUtH?=
 =?utf-8?B?bnIwU0ViT2h4RG0vc2I3eW9lRmN1Z1hwZU9HUGgvbjAxbTVRMGVpSFRJZnlk?=
 =?utf-8?B?bWdpRk9QZWhlcGYzMmhnQXZmN3FLd25LbUNnU0FhMVlqWGwrK2laL1cxa1BJ?=
 =?utf-8?B?dnhwYWZVUlFaSmVaRjhLSE1oODhSaXdGNW8xWWxIaURXRkdzWVNyVGpGd0ZT?=
 =?utf-8?B?VVZtMEUyQ2pYVVpuL3l5M29Pd2xnZE9UdFgxbnV0V1lMdmNjU2pLYWVZVWpG?=
 =?utf-8?B?eFIzQllaRmptTGdDVVVBNWdzdFVJZHRXaHF2QnJId2NlM2dSWlZJeGs3Ui9I?=
 =?utf-8?B?OGJQcWxkMGhxbStTVmRhZVptd1BIblZLa3NIRW40aVRMclVsWjVnTWhRRDln?=
 =?utf-8?B?U1YwZFN2Qk1tZUpqQ1JScnFybjdnaGVZdGR2R0U1eU1ydjJLbFQ3RHZIdGZy?=
 =?utf-8?B?RXRWbk11QnhqcmpEU1V5NXhmcHBETXNuWmpvanVEMTFkMnk3TkIwbzJOaDBD?=
 =?utf-8?B?N3N3S1doM2VPREVJRkF5dGk4RU9vUnZCSVJYWFJqZXM4MEplQTN0SkIySHoy?=
 =?utf-8?B?dkpBaytxWlFOdTJ5SVZSNUswMTFFTG5mVC9RaC9UT2h1NFdkb1RoOU9MN0NB?=
 =?utf-8?B?bkQ1SjNoVU40d1g3Y3JHQWo2Vmp0SnRtUWJqZkRQcXFpQXMrTzhsSDV2QTE2?=
 =?utf-8?B?dFEwUjV2VGpORGUvYXJLbm9yY2RYOGJkSDdnb3Y5ZkJiMVh2UkpFUm0xRWdX?=
 =?utf-8?B?SkdTSWlySmJkMTFuU0h2SmR4cnFFK2t3OWI5cnlwdURDcklSaTV1Z1lNV3lE?=
 =?utf-8?B?Y0ViK2EvdzlpQzJudTE3ekN0ckJXRllIUjJPR1JrSXJvODB0K0tXTnVXaHZB?=
 =?utf-8?B?VUJjbGlHbVJNc01ZR3lRR2QzcUFYVGtSTU91NzNpRXhOOEo5OXRuUEFLOEtJ?=
 =?utf-8?B?NjFEei9pampuOEkxV2I4dUR2TWcyd0NWSThZL1FnWnUxN05vOUI1WU94RWlY?=
 =?utf-8?B?Q1VFM1RnRmJiQjQ4b0lWeGFQUjJGdk5TSHl5VG1FaXUya2kyYjd3ODlBSEM3?=
 =?utf-8?B?cndNWnVjT2Q3TWJIQWJCcTRPTnl3U3g4ejhaZzg2VXZqOTVjVktyZjBKSjls?=
 =?utf-8?B?ODJObmhBOHpmUm80VzFmN0kzM0l1OUV4YUZPanpRMHRyeGJ3WXJZcTVMeU1F?=
 =?utf-8?B?dU5NcElzb1ZPZW5iV2p1UkNudjVKSjlKdlhkanJGYVRVaUJRRkRTWUhaaUZE?=
 =?utf-8?B?QVFmQVA0clp0Z0NGOWZERm1rWktjWUpCRzZNS0ZQS1ZTTzN0azlxNUk4T05G?=
 =?utf-8?B?a0w2b0kzemlkTHNXRE1USWk2TmN0MUxaVWZ5djkxQ3hHR3JwTW5kdXV5RGJ4?=
 =?utf-8?B?TVovT0lyOUtlb1Y5ZDA4WTQ4VXZZWmtCdnQyby9YdSsvczhPTGk5aitsRHFq?=
 =?utf-8?B?NDd3bDRyMlBIZ2QvaWh1OUdrVTdvRlJBRTdyMXBGNWlYZFVHa0NBbzZkTnNV?=
 =?utf-8?Q?GtzigkbbYxtC5iI2RSjjOs5xW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e44d9632-9d7f-45b7-77da-08db5158e765
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 13:17:28.7515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bcPTBpDcoxiW5tp8EDcrt9cucYmHll/D5UowLJjX9MRvbD5MimCHCB2/uxREGEjAl224zfvHkDKdytieKX38Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9637

On 10.05.2023 12:52, Alejandro Vallejo wrote:
> On Wed, May 10, 2023 at 10:15:31AM +0200, Jan Beulich wrote:
>> On 09.05.2023 12:05, Andrew Cooper wrote:
>>> On 08/05/2023 2:18 pm, Jan Beulich wrote:
>>>> On 05.05.2023 19:57, Alejandro Vallejo wrote:
>>>>> This is in order to aid guests of AMD hardware that we have exposed
>>>>> CPUID faulting to. If they try to modify the Intel MSR that enables
>>>>> the feature, trigger levelling so AMD's version of it (CpuidUserDis)
>>>>> is used instead.
>>>>>
>>>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>>>> ---
>>>>>  xen/arch/x86/msr.c | 9 ++++++++-
>>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>> Don't you also need to update cpu-policy.c:calculate_host_policy()
>>>> for the guest to actually know it can use the functionality? Which
>>>> in turn would appear to require some form of adjustment to
>>>> lib/x86/policy.c:x86_cpu_policies_are_compatible().
>>>
>>> I asked Alejandro to do it like this.
>>>
>>> Advertising this to guests requires plumbing another MSR into the
>>> infrastructure which isn't quite set up properly let, and is in flux
>>> from my work.
>>
>> Maybe there was some misunderstanding here, as I realize only now. I
>> wasn't asking to expose the AMD feature, but instead I was after
>>
>>     /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
>>     /* probe_cpuid_faulting() sanity checks presence of MISC_FEATURES_ENABLES */
>>     p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
>>
>> wanting to be extended by "|| boot_cpu_has(X86_FEATURE_CPUID_USER_DIS)".
>> That, afaict, has no connection to plumbing yet another MSR.
> 
> Let me backtrack a little. There's 2 different (but related) matters under
> discussion:
> 
>  1. Trapping PV guest attempts to run the cpuid instruction
>  2. Providing a virtualized CPUID faulting interface so a guest kernel
>     can intercept the CPUID instructions of code running under it.
> 
> This series was meant to provide fix (1) on AMD hardware. I did go a bit
> beyond in v1, trying to provide support for a unified faulting mechanism
> on AMD, but providing a virtualized CPUID faulting interface needs to be
> done a bit more carefully than that. Doing it partially now just adds tech
> debt to be paid when CpuidUserDis is exposed to the domains.
> 
> Changing the policy to expose the Intel interface when AMD is the backend
> falls on (2), which is probably better off done separately in a unified way.
> 
> v2 removes the changes to x86/msr.c so only (1) is addressed.
> 
> Does this make sense?

Certainly. Nevertheless I would like to understand what Andrew meant,
even if only for staying better in sync with all the work he has been
doing (and is still planning to do) in the area of CPU policies and
leveling.

Jan

