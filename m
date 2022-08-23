Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E430C59E6BC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 18:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392058.630193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQWZ7-0001AU-HY; Tue, 23 Aug 2022 16:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392058.630193; Tue, 23 Aug 2022 16:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQWZ7-000187-Eg; Tue, 23 Aug 2022 16:15:45 +0000
Received: by outflank-mailman (input) for mailman id 392058;
 Tue, 23 Aug 2022 16:15:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQWZ5-000181-CU
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 16:15:43 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50049.outbound.protection.outlook.com [40.107.5.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d525404c-22fe-11ed-bd2e-47488cf2e6aa;
 Tue, 23 Aug 2022 18:15:41 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.23; Tue, 23 Aug
 2022 16:15:38 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::d6e:b15e:4c8f:a907]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::d6e:b15e:4c8f:a907%4]) with mapi id 15.20.5546.021; Tue, 23 Aug 2022
 16:15:38 +0000
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
X-Inumbo-ID: d525404c-22fe-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqp2Ks3I636Hgv+zj4cfxI66w6qFqaZ5cqD8dSx1mbNbnMJXmzoTe7g1D9Lu2rZIqoL7pY5FjK/Sh9UJ7w5W7SCFmTeg/GtFBR9eCP71UyW8uozauW5xL1vmnqtNWRSVwqTa1yJvnzQAhCveKr7AJJsq6Zm8xMZLNjYPhweEhelPSuloxrNA4FnUEhLTN2vFvjekGtjfubsGwV+2Ockxrs795H3lh+Fvgj5eoO+gvOGJT8x+O1OW4q5rWHDD12RtShiPw3MWCwqXoJ99pFxOEIA/QgupfqUM1c1RNG/t7pBVdMbfYujefWTb+d7Ht+dkM4PfcDoW1B7+7oFKD+jURQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xE+8Zf3Ld4qAW7RUD6s/LnYiLlHMrnTAEmP9qpLRDSE=;
 b=h/8XUs9BK6+RiR/EObF5AW0Swknzv4LBJNGH1duaZa6GUtWZA6KRIqPRwofHDlC0PxAFwjZIe31g8jIL2BnVfysFmr0Ti3b5rZJY1tvJQZkP/r2niUMMdcklVicpw69UBNSPI8IR7YZl9OYDL6abrDi1MIOjb11TO3PJnjurc340LWuB4ZxQg41fZYuaSN2bwbTDdWCDazRvL8scvFCD89Kk3sjLLQiPvqh5HMJ6e0qRwYcjy/VnVJUNBwK1zE2GN4eR6vAtOPCzBfBFAWiU0X7XPq9AUUzjsnu8YbUgiAdLyF/mDN5GUWqzBPO5UlR4OpVh32z17q6UXJJ7NMnxdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xE+8Zf3Ld4qAW7RUD6s/LnYiLlHMrnTAEmP9qpLRDSE=;
 b=RhtxFsEjPcahx0E6AwpkE03MP49bgh31g6dxXnCrAJTvoEmrd88A9O90aklV+wvVpj0PTQIo5XRXWIGc0VkXJENrIAjckLQNq6SHXjX88/rHFJ8N/oH2+twaIKrJZZAttXTwOzdTXP6MBbzt9xZDBBK1osFRrmjG2cXS+bvNEfN41+/NNlglnjMcbnfKJIy0xJBm1aJSgqcnNxST6pYHMOABjhW6cveN3+XGGs3e9Dwss2ZGzI8gNmJMV7oOFufUJ0dnrWlvmA7iVqS72goQi+dXBA/Cni1ecYEm9Isx0ZinYJ6MUGyBXRA4r22hyNBAKqXog7EeEp7uW1NiU+rPsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <824f5b58-4a54-45a6-a5e9-bdc8532e89cc@suse.com>
Date: Tue, 23 Aug 2022 18:15:36 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87AD61AE-5C50-4F04-AF60-300C6A113A85@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e799f92-bb4b-4916-7328-08da8522b79a
X-MS-TrafficTypeDiagnostic: DU0PR04MB9418:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mqjsPZzix/pZJ/s1newdZRxu0lSOMrr52uDQwMtm7pXJB94gPvci8fDfUcggATAOSsGAS5waZQO3njkxKnM1qS3iLXgWR8XpuFqUm0lXCaGgzdpvS7/KG79nWdRyLjrcBiplXzFt8Xw3D8rd0SIRv+zM4YhsypRWTud9Mas+COw4kOHo/CDctHrzLSYwyEAFeSLyBf0s6HwiKlsGKGu9tJjpgLPCwKcgyJH6h1krZd/jT0NBFM57+YW9bAAguZY5AwALhjoO1PZ0TpRoSQTtikD1ZGiKCOxT0dmHA3x8bOeChDVoEaIBzwazFflG6nA7z3j7jXTiTWI544rPb0ypHpFXMHHfNtvrzH00KHjEDhqcUrxkIvAT12Q8ZK5P4rzssiBEqKVUENF0fQkS/OPoZU6UMT/DntxhpruBVV9EcxiF4LyS+7RoyYH1KoWlviO0QH/S9bS2snJ7iqrruCdxc4KPpD+G6Yxv+4+LEGp6k0i6Ed6zh/CHyUdSNkhMAQnSSt7hpQodhlbXrY6MBQ0aLvySLLY+C/CKMjHRYEQX5PCeZpN9qLLPjPqRTdOrVi0Mt34b+B7UsDgXPurlHg7+cAiIKu6Wb7FRg59R6/P++ByfuXSDa55vfUJ34xkArVjkhNmTxIJMwetCwIUDfqQshVppuEQpyaZY0NseoWRSdn+7TOe2M5Hl9Mz1djhqoEBts1WmDwAJGFIHi1Nh2f93jSfoSpMQc29tesWTlZjUrNYpI6vUZQnls0I33sb/g2pxz+mEw2v9IbRuWMPgUc2xuvUk6fXDhpAdu/A5GFOkxQM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(396003)(136003)(39860400002)(366004)(86362001)(31696002)(38100700002)(316002)(6916009)(54906003)(8936002)(2906002)(4326008)(66476007)(5660300002)(66556008)(66946007)(83380400001)(8676002)(2616005)(186003)(478600001)(6486002)(53546011)(6506007)(41300700001)(6512007)(31686004)(36756003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTdGYytKb3FKN3pwbmE3TTM0Nk0wNUdtcjVJTDlCalBNL0Rlb1RhRkFTY3JJ?=
 =?utf-8?B?Vm1pc0ZlaU5kYnBaSlQwS3V4MDY4dnRuV2ZISlAzK3kvcjE3azZTQS9DTVk3?=
 =?utf-8?B?L21hd0VCdWRzVk9hTEh3WkRmektWekJ3aDJ6VkY2aGJ3cUhYcEJVQ2hIdDBs?=
 =?utf-8?B?QU9QS2RzT1JYbys1bXNIY3pJRmEzbEZIVmtYbzFMVUpVWG5yaUpuN25xcTdw?=
 =?utf-8?B?bU13NmNua25DVk1iUWl1ZTZXd3k2K0FlZzE5Q2NOQ3VqdnNJdnFOdFVFOExP?=
 =?utf-8?B?VVVsbitKZlFjQzBQbVdGbElDcy8wb3dWS0tab0MzZ3M4S2JIOEZ6M2l5a01p?=
 =?utf-8?B?YzhQbm52TW1hZ0licW95ak83ZWJEaFd0cFhNMVBXdWtnbnZnY3ovcXR4UTZh?=
 =?utf-8?B?ZElTSmZablhST3N3MXFUb2QzU0N5UDdINUpaTUlESTNsMk5icjNOVjJPUzBp?=
 =?utf-8?B?SmlVMWlwb1M4RTlXUXZiR3F0L0liOENyQVAxNWlFRzVpd0d0MHdaYXNJSGJ6?=
 =?utf-8?B?UmEwN0U1OEt3cVN3cHZ0OXJMMWhmN0NUY1ZHVkVMSW9xbU1mM0RISlE3UW91?=
 =?utf-8?B?cFNUSnZ0Z09XZjZCSjJpcGYxL3d6MlEyTWtCVkFKS2hGTlhrSWFRQ2FqQUhl?=
 =?utf-8?B?L3hvR0FpeGtUMjVnUzRtYzdwLzA4MzQ0L2Q1NWxDamMvOTFQMmRpSFlpWVUy?=
 =?utf-8?B?QnprRzNRSEloT1lKTHp0MTM4bkowMS9TNk4vamZoWHYwRG5JVDJaYkdCV09z?=
 =?utf-8?B?bnIrY21PNHJnWUJTMytWMmtHeHp3c1M3Y0NBNmY0ZWVTR09iL21nT3RuL1FQ?=
 =?utf-8?B?MmoycmEvNkM0VktBZXlhZ0p4VnkzWTVrZFRJTlhXem5TSzZYV2dnQnc0Q2Z0?=
 =?utf-8?B?N1lHc2xyQVRaY0NaVlVPczc3RWVmWCtwYTZ3bUhjWjdrdzRreVovVlVTNDA5?=
 =?utf-8?B?MjlidFdWMHpoL0VOTG1QM2FwU3kyNDFnVE9ZM3RqWmp5Tkl6NHRSNUFYSkVj?=
 =?utf-8?B?VlZCeXBNcjQrcjAwUWVTcHV5dmNrSSsrUDhnZktpWjkycTQ4bTFlOVNPY3VE?=
 =?utf-8?B?cFB6WTBqNWk2bGhLdzhPeG5zSEFpS2tHMW5oOWkzeHRnanMzaFpzR1VXWjZU?=
 =?utf-8?B?c2xXY1N2WWc5aXZZUkxVeENVc0lxeHNHS1dyMXByUWFDbWxGQkR0ZnpNL1Nt?=
 =?utf-8?B?YmdRa012MWFSM1RVbkkyRUJlSFN0cStNRy9UdUZEbDdaY1BTSUxKeUZhR3NZ?=
 =?utf-8?B?RHNibWhMbE92RExMaUFlOEt3S0VnWEdneTNMRFRxdXZKR1hYRmVOdDZCUys5?=
 =?utf-8?B?QXpZSHNoNWV5RjFBdWVXcFhuR056T3N6SzdMZHVBT0NZd1Z4SEVXdy9rSTdC?=
 =?utf-8?B?bHFoOWJQbHlwTzNpZ1RhNzNkcE5rRHdUNnp0My9FUnN3VWdoU3kxYXFaamo4?=
 =?utf-8?B?bVUzSmI3RC92U2pPMmR4cjhSL3VGd2g3cXRYODhicmlaOXQzNVowVHVZeC82?=
 =?utf-8?B?NGp1R1Fpd21zRzhHVnpsaUl6R1Z1UWlZMzMwT0FRQkgrOHpPY29vclRVbERy?=
 =?utf-8?B?UkIrRlRaS05oa1VvSUwwTWkwMnpWcnpYYWh5b0lZcmU1OFRGWldEcm9LMEQz?=
 =?utf-8?B?SXN2TWtaVEw4K2c5N0hjd2JHcnArM3ppWHZqZnc3QlIyN1lVR002Ym1SZXdy?=
 =?utf-8?B?L2NOZXpITDA1WTJ5cVV6YWkvZUVML0hxQ3o1UXh2R2c0Rk12Rm5JSkxVVE1h?=
 =?utf-8?B?dXJDclkzbVRnUWE5M0M0QTlQOEhib1RaUGI4UTNqMzh0bG5WNWpyMXpMTEYv?=
 =?utf-8?B?RDRHTmpsSmNxUGsrOFJnRnpCZ3VlREh2aGdIWUFKbS96MUtrV0FleVV4NWF3?=
 =?utf-8?B?c1JEaTg3WnVhU0VWQmZpZG1qNmw3b0VvanQ3WlZFL01PaGdUZzNqSnZERXVX?=
 =?utf-8?B?cWJUYm0yRGFQenZlaHhvTmdOckd0RXZTL2FIelZnUWpWT09rTStxMS9VclpV?=
 =?utf-8?B?alZROWxKOXlXU0hHOHh1ZUJVMzlGblFRejBFNWtaWEg5T2VuRC93T05pUFRh?=
 =?utf-8?B?N3VJOUhEOThTUUlvSUlDaWtKMFVqMVQrM0FSZjdlUVdXYXZncWtGTEo2SVdj?=
 =?utf-8?Q?CvvPbrtAYfVKl2Tpkyi76iDrR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e799f92-bb4b-4916-7328-08da8522b79a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 16:15:38.3175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FsB0rJLQs4WwVVoP0pRap1Mv3Fqq0ihUeHDU/908SzY0K/am/dAQyPGX+3SVG3Hw+QqfLFINE77/XKQ30mdPQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9418

On 23.08.2022 16:41, Bertrand Marquis wrote:
> 
> 
>> On 23 Aug 2022, at 15:31, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 23.08.2022 15:34, Bertrand Marquis wrote:
>>>> On 23 Aug 2022, at 13:33, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 23.08.2022 12:24, Bertrand Marquis wrote:
>>>>> --- a/tools/libacpi/mk_dsdt.c
>>>>> +++ b/tools/libacpi/mk_dsdt.c
>>>>> @@ -18,6 +18,16 @@
>>>>> #include <stdlib.h>
>>>>> #include <stdbool.h>
>>>>> #if defined(CONFIG_X86)
>>>>> +/*
>>>>> + * When building on non x86 host, arch-x86/xen.h will include xen.h which will
>>>>> + * try to include the arch xen.h (for example if built on arm, x86/xen.h will
>>>>> + * include xen.h which will include arch-arm.h).
>>>>> + * To prevent this effect, define x86 to have the proper sub arch included when
>>>>> + * the compiler does not define it.
>>>>> + */
>>>>> +#if !(defined(__i386__) || defined(__x86_64__))
>>>>> +#define __x86_64__
>>>>> +#endif
>>>>
>>>> Besides being confusing this depends on the order of checks in xen.h.
>>>>
>>>>> #include <xen/arch-x86/xen.h>
>>>>> #include <xen/hvm/hvm_info_table.h>
>>>>> #elif defined(CONFIG_ARM_64)
>>>>
>>>> At the very least you will want to #undef the auxiliary define as soon
>>>> as practically possible.
>>>
>>> Ack
>>>
>>>>
>>>> But I think a different solution will want finding. Did you check what
>>>> the #include is needed for, really? I've glanced through the file
>>>> without being able to spot anything ... After all this is a build tool,
>>>> which generally can't correctly use many of the things declared in the
>>>> header.
>>>
>>> As stated in the comment after the commit message, this is not a good
>>> solution but an hack.
>>>
>>> Now I do not completely agree here, the tool is not really the problem
>>> but the headers are.
>>
>> Well - the issue is the tool depending on these headers.
> 
> Yes but the tool itself cannot solve the issue, we need to have the values
> in properly accessible headers.
> 
>>
>>> There is not such an issue on arm.
>>
>> Then why does the tool include xen/arch-arm.h for Arm64?
> 
> Because this header defines the values required and as no such thing as include xen.h.
> The point is on arm, the arch-arm.h header does not depend on per cpu defines.

At first I was surprised you get away there without including xen.h -
this may change at any time, as soon as you grow a dependency.

But then the inclusion by arch-x86/xen.h looks suspicious, since xen.h
itself includes arch-x86/xen.h (first thing), so unless I'm missing
something arch-x86/xen.h can't really have a dependency on xen.h. So
maybe in the short term you could get away with removing that include
as a "fix"?

Jan

