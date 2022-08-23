Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1084559E64E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 17:45:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392045.630171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQW5i-0004mE-RE; Tue, 23 Aug 2022 15:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392045.630171; Tue, 23 Aug 2022 15:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQW5i-0004js-NQ; Tue, 23 Aug 2022 15:45:22 +0000
Received: by outflank-mailman (input) for mailman id 392045;
 Tue, 23 Aug 2022 15:45:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQW5g-0004jm-OS
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 15:45:21 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00074.outbound.protection.outlook.com [40.107.0.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 962adf50-22fa-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 17:45:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4776.eurprd04.prod.outlook.com (2603:10a6:20b:f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 15:45:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 15:45:16 +0000
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
X-Inumbo-ID: 962adf50-22fa-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJbox1OU/GUAmEly7F68UVVCOpqyF1q20fcfzFB2O7TyWJRbiHLVSLsbw8Qw1OnLXzsAhzLea1dT1bQdGLhg+8aOEqY5My/7my13ssu7QSx4TEdCAa0KJLyrakI0lmp6n3aZClhQTWdmcxKKTKDzI+2NPqjppdoAMuVObqQPEj8QQs3/ofh47iknksQpQ7bIe3ZEUhrpP0+eqwWHdCJYVfBKW45ie/y9ySUcp8pXq1d58OV0a+0kzFX09iUNNmEcBsnFyuef2H3LsOPjhUa6+UktOOmoRJIeRrIpsWVLqK5oLK62LyT977brLjysC1OAs2J2dEphPLjQug5+ycYeCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFIesEOhJDnpoT0eqmVKnof/p1/Ej6WXm7rLsNC7Bh8=;
 b=eKWxzW2pmLtGtzZvufgzXkUMuwzT6uxOTOHe7xeJvrn/RYrnUdpv8O90x01RuSDh/CQZffoJGtzZnBDAZcTUSvGEfwyMr2El2YJ5NyrRkXYVk42qgIZZk1qlbb0eVpxwWEUg34IoEWIfeWbZCVDtuAL8nI61bqgdl/HewaHVGgcXaHcS+mwb6FJgco7o1iWY/oelZtHO93cutnd9aYMlEaDR9WgisZvBXmMVznFaHZ4P4LSDwPJ5efoJq5yCi2jVc30suwFZIVisZaOZ5pP5f6Ds9DssNujqvxMimSi3TBfjGpgeIpf4zIH8mYqCF3eSNC9QfJYL2ENYq0jF3WUA1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFIesEOhJDnpoT0eqmVKnof/p1/Ej6WXm7rLsNC7Bh8=;
 b=lOc3Gb+SNedoFOnqNB9DYXnZ9BhSl4ST/HOHPeKPgguwJnG9vBDknv/wNXtdD9FQyBBCP9J3/D1FiRS24JLJRZa2sjvBMEp9uWlACXUFgbB3x8DzIfhz0oe717zQbkmvKD5Gs1DOFPO0KUBWGESisDCYkcrBou3bbh1vQHwew83+vwB7UGRzlqIbQsQAvRm5jkfM+6tOLNVzwjxyRfQ69r6GJ4GeybN5Zrb/nhyItZSY4BXi+0VVfTIjqv7FVMc6QYK8errfWXAKnwzHVZGYVlySEv324onwnl1ZPcpP0OJivRBoKXQ5LKuyP59gzqxD29GbzED0HTbu4W+FhRESKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <348e6d5c-d846-3d8a-e26c-316ba6a98938@suse.com>
Date: Tue, 23 Aug 2022 17:45:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH] libacpi: Fix cross building x86 on arm
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c3d431217010f669de809a76c2f1c15a0313ae53.1661246753.git.bertrand.marquis@arm.com>
 <844e0164-96b1-8a56-a9c0-0f432b9e648a@suse.com>
 <B2DC2AC4-E59C-4C96-8993-D4812D73E799@arm.com>
 <74994bdd-8c70-7f5c-2146-157a36c843a0@suse.com>
 <87AD61AE-5C50-4F04-AF60-300C6A113A85@arm.com>
 <C7766EB8-B741-4443-99C3-EB14C1EA9804@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <C7766EB8-B741-4443-99C3-EB14C1EA9804@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92a4aeab-dc8e-493a-53d7-08da851e7973
X-MS-TrafficTypeDiagnostic: AM6PR04MB4776:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U7Zrntu8XAovvR2UQxgn5a3TzdwjKmjVV3uM7XIKXFRdGV64KgEsEw2i2hj2oC2ilUc0QU0fcxFaz1FqV3i2cXTbpJiHaIEzDt2G2ThDth0ykse/JJD8TRp+m7bZLbQLIsPRfCJSyw3aCdydi9fPZuLjoVykhYCLhCUgPhEGc+5DTs7xGSBruUF+BdvhB/mTyjZCnGn/W44wjVfSakoAnRM+CKzgkyJ8o10bLKW5L66HszH9b9R1RoN+EjjT27MYpcaYEUNvt4lRxnF5op4hpguN2+dfLBwBi5RmbO9Ea70QqqS+bSC6u3SFw4MFTt2awYSjXGhgInkHspYmr34cKE0o0tQaiPhEsLIOFqVqKQw26WxzAlojpkZPpyIS0EfB5tbh+esuBkvaBeBNXrIafwnFrsePCx5QE7ldEXPew9wNvQKbCNrO1LjCCkcL+JuVRnbHamRPDEOv0cBWidgS0l7vvwa1DdSy4pQSbTpnpMXn1988ZQgZcgdzDXqyDaHZbk3fScKFbzDiQR79/cW9/8OFm01cJfs4N/Wemia6mKftBQ7rMdtDB1y4fNQFwRgr/nsYmmLnObLbtXloD+2t20QLbjBGLZrA9W6EhhK2fS6RfKnf+f04TCrtfjCbyMvy+Cryiv3JC0cJnI7OnOhROTcBCirLpF8MIKZEeZyd1QEd9SVMuV5AQmxMoerFDF453lZeYReEiLk52BtkpiWcRO6dB6G6M3q+AyLEH8+uSRRJ6gSz9GmFrIdodSgGhu0vToYES86Jbr1+iyHWgjGqB2blU7+2zfeG0+WFPZQ9VNk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(396003)(136003)(39860400002)(366004)(8676002)(4326008)(26005)(478600001)(6512007)(6506007)(53546011)(186003)(38100700002)(6486002)(31686004)(5660300002)(36756003)(8936002)(41300700001)(83380400001)(2906002)(31696002)(86362001)(66946007)(66556008)(6916009)(2616005)(316002)(54906003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TE9wdUM5UGpDWDBYcGkyWXZJZFowMFpLdk9SZTF1ZDkrdnNlYXB1OGdKZmVy?=
 =?utf-8?B?TTc1aG9HVDU4OTNUcXYzekIxSy9lU29nOG1jcHpLcjMyRnB3cXRWTk5JNlYr?=
 =?utf-8?B?Smg1TTFTQjFYNWRaMmdxbHhNWlB0NjZTdDEwU3ZISy9GSkR3cTR3eWpVWU5h?=
 =?utf-8?B?cjl0R3R2My9RemJEWU9HZDdrdE9BZnByb1k4WE9vQTZ4THFrVmc1T0krVzJI?=
 =?utf-8?B?a0hvZ2sxWk5mLzhqL1ozZnlUMmRxckNUMkdCdVhDbytDdlZmTmJhdXI4ekkr?=
 =?utf-8?B?QjVSUnNaK2lLVTd5azB5WXpKZ1dZRFBNcWdFSm1xcEU1ZEgyYXl2QWExZUd1?=
 =?utf-8?B?WndvWXZTM2xUdkNMV3MvckdaUGV6SUl1N0g2akozaS9FeXFIelp2OHExMDQv?=
 =?utf-8?B?OFJoY1hUWDhnVkVNZFE2bVlYWFB6WXNVSmUyMUFyTjZuSVdCU2REd0t3T25D?=
 =?utf-8?B?cGk5S0doUURzRzc4azhHYVpFQU81TytlVjRXKzZWZ1N6eWtIM1o4cHRTa2tH?=
 =?utf-8?B?cjhQMExaTmxneGtLZE4wOWJRaGV6OVpwYy81N2M2c204cU41TnVQQTQ4YWlm?=
 =?utf-8?B?MEsrZGhKektSbEhIWlQ3aVNkMTRGWmRzdlhNQW56RDUvdE9obXJ2RXFFQUJK?=
 =?utf-8?B?b2tzeXZZZVI1b3p2eWh5Wk9sL0E3RFpsTjZBam82KzdBWUxOdmIyejlHdVBG?=
 =?utf-8?B?cWt1bmtuVWJOaDhYQlEvZXp0MXZuRnZhSDZ4YkwxUHVzekRMUitWMzlsK3hl?=
 =?utf-8?B?YnMxQWM3Q0gwVEFqUSsxenNoNnhUODdEVW83ODkxV2Mxb0FCZ290enhjRUVB?=
 =?utf-8?B?VDdKRGw5UThiTmlwMmhjbnBIRWZJZFpzTlZ6b1BlWVJqNTVNNXRzdU52TDR6?=
 =?utf-8?B?VlN3SUlhMWFQTWJwV0ZHZm1iTzNOUHVKYzBuLzlSdlN1YW0yR05MWGIydGw2?=
 =?utf-8?B?TjFFbEhoTVBXWHRZeGQ3N1E3MnNoaDdRdnl0UmtvWGFFN1huV0xSZTdTL1J3?=
 =?utf-8?B?MWxCd1FJV0MrWVNJWmZxTzV3d0V6QXo1a29NeUVOWEVHLzd2MGJRc0NmUWZz?=
 =?utf-8?B?eTVBUDd0NGJaTW9wK0UwUTA0OFNnM2lvOXdOR09QTzgrYW9mNVNxVVR3WHhh?=
 =?utf-8?B?UytGQ0hZRGVzV1oxL3FwekJPdTFpSUJ4WXRxb3BybU9PRC9MQXpVWDZHMXRI?=
 =?utf-8?B?V1Z0MlJqakQ0QUNmUGZiTVNNclNMWVhqa0NGQldWcWdPMUI3NWRHeEMwbUph?=
 =?utf-8?B?eFdVNzFFOXc2VlZzUVhMem1WaElzWVNXandpb3Z5eUhXQzF1ZWJYTU1MMERB?=
 =?utf-8?B?L09KaDIvN1pIWStCWFhiYmRFeElMMDcxSU1YdHZMNkxjSWxISFg3cXV0eUxo?=
 =?utf-8?B?Q0szUWFwbVZ2RFhpZllmZFFtUjBvQ3JBMjJhYTBFa3Vsdi9ibXQ2K052cTRi?=
 =?utf-8?B?WElWc0FycTVYUHVZTW5qZUk0MkNId2dIWExtT0oyY3ZGM2V5Si8vc2FsR0RP?=
 =?utf-8?B?VXRNZG1mbWRRemh4Mll2U2xOdGtKNUtUWFlCYmUrdUltM0gzZzc1Wm9zOHFq?=
 =?utf-8?B?VHArSThOcnpXVWl2SWkzK014dm8wM0N2RzI0NGxVUVR0dmppT3RtWTdrMDYy?=
 =?utf-8?B?UVZacG9JbFo5UFdSMmxhZ0orYkM2RWJDR2h0NEFlNkdaRlVBRGw1SWxuOEs3?=
 =?utf-8?B?UUtIS3R5S3hMdXhxVFF5NVJkK3VXN2s5YWNTZjc0ZVRRQ0piM0p2bGVkN3JO?=
 =?utf-8?B?Y0dxWlYvbGt6Z0Yrc1A0OHJoa1QxRHdQTWlzM2RuVzc1YnQyZ0lIRXQ2ZkNx?=
 =?utf-8?B?aTVSalFtVU43Z0hLMXhMelJUSXl5S0JsSTJoMTlVNFVZR2ZZZjNJdUh2WUJ2?=
 =?utf-8?B?Y2c1QjRPUG1zSXhlVWxNbnZlN2JrQk9EWFZxd2ZOUWd0OFM5ZEdEOHNsa2dm?=
 =?utf-8?B?NWJyZlJrODZIL1ZQUTRabjhlUHFWbGpjUnZwNjNYNHZOankrY0s5MkRyMWlY?=
 =?utf-8?B?K0RMNi9oT0N5Y0xzY2FDc1ZEb21TRGlGem9tNGZ5cmgvdElmejNSTGN4bEpZ?=
 =?utf-8?B?eHRBVVBobExxZEoxQi9xNVRSWVluaTh2d2hmQVBQbzhrclVSM3FYNC9XaHNT?=
 =?utf-8?Q?Bik3El/RIGdEycyKp6z9G5RCg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a4aeab-dc8e-493a-53d7-08da851e7973
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 15:45:16.0242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpTA1tk+bnrwpBFeHFEhzoVGwGTPhF3C7SknITDt3ZAT1N6n+58Evseo+q65BOmZCUtXMAGYQ5SQ/ASQVdftXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4776

On 23.08.2022 17:09, Bertrand Marquis wrote:
>> On 23 Aug 2022, at 15:41, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>>> On 23 Aug 2022, at 15:31, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 23.08.2022 15:34, Bertrand Marquis wrote:
>>>>> On 23 Aug 2022, at 13:33, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 23.08.2022 12:24, Bertrand Marquis wrote:
>>>>>> --- a/tools/libacpi/mk_dsdt.c
>>>>>> +++ b/tools/libacpi/mk_dsdt.c
>>>>>> @@ -18,6 +18,16 @@
>>>>>> #include <stdlib.h>
>>>>>> #include <stdbool.h>
>>>>>> #if defined(CONFIG_X86)
>>>>>> +/*
>>>>>> + * When building on non x86 host, arch-x86/xen.h will include xen.h which will
>>>>>> + * try to include the arch xen.h (for example if built on arm, x86/xen.h will
>>>>>> + * include xen.h which will include arch-arm.h).
>>>>>> + * To prevent this effect, define x86 to have the proper sub arch included when
>>>>>> + * the compiler does not define it.
>>>>>> + */
>>>>>> +#if !(defined(__i386__) || defined(__x86_64__))
>>>>>> +#define __x86_64__
>>>>>> +#endif
>>>>>
>>>>> Besides being confusing this depends on the order of checks in xen.h.
>>>>>
>>>>>> #include <xen/arch-x86/xen.h>
>>>>>> #include <xen/hvm/hvm_info_table.h>
>>>>>> #elif defined(CONFIG_ARM_64)
>>>>>
>>>>> At the very least you will want to #undef the auxiliary define as soon
>>>>> as practically possible.
>>>>
>>>> Ack
>>>>
>>>>>
>>>>> But I think a different solution will want finding. Did you check what
>>>>> the #include is needed for, really? I've glanced through the file
>>>>> without being able to spot anything ... After all this is a build tool,
>>>>> which generally can't correctly use many of the things declared in the
>>>>> header.
>>>>
>>>> As stated in the comment after the commit message, this is not a good
>>>> solution but an hack.
>>>>
>>>> Now I do not completely agree here, the tool is not really the problem
>>>> but the headers are.
>>>
>>> Well - the issue is the tool depending on these headers.
>>
>> Yes but the tool itself cannot solve the issue, we need to have the values
>> in properly accessible headers.
>>
>>>
>>>> There is not such an issue on arm.
>>>
>>> Then why does the tool include xen/arch-arm.h for Arm64?
>>
>> Because this header defines the values required and as no such thing as include xen.h.
>> The point is on arm, the arch-arm.h header does not depend on per cpu defines.
>>
>>>
>>>> The tool needs at least:
>>>> HVM_MAX_VCPUS
>>>> XEN_ACPI_CPU_MAP
>>>> XEN_ACPI_CPU_MAP_LEN
>>>> XEN_ACPI_GPE0_CPUHP_BIT
>>>>
>>>> Which are defined in arch-x86/xen.h and hvm_info_table.h.
>>>>
>>>> I am not quite sure how to get those without the current include
>>>
>>> 1) Move those #define-s to a standalone header, which the ones
>>> currently defining them would simply include. The tool would then
>>> include _only_ this one header.
>>
>> Shouldn’t we try to unify a little bit what is done on arm and x86 here ?
>> Not only for this tool but in general in the public headers

Where possible I'm all for it.

>> I will try to reduce the problem a bit more to find what we would need to
>> pull out in a standalone header.
> 
> Only the 3 XEN_ACPI_ are needed

Yet XEN_ACPI_CPU_MAP_LEN drives from HVM_MAX_VCPUS.

> and those are in fact only used by mk_dsdt.c.

Well - that's the only thing we talk about here. Building target code
is fine to use the headers. Building code to run on the build system
is where the headers should not be used.

> How about moving those to a xen-acpi.h header and include that one in xen.h ?

In principle okay, if there wasn't the need for HVM_MAX_VCPUS. With a
suitable comment it may be okay to live there. I'd be curious what
others think.

> Other solution as those are only used in mk_dsdt, I could just define them there …

Please let's try hard to avoid doing so.

>>> 2) Seddery on the headers, producing a local one to be used by the
>>> tool.
>>
>> You mean autogenerating something ? This would just move the problem.

Why?

Jan

