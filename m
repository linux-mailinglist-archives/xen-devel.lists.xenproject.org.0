Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017C75BCCFB
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 15:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408723.651548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaGia-00008Y-E4; Mon, 19 Sep 2022 13:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408723.651548; Mon, 19 Sep 2022 13:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaGia-00005V-BG; Mon, 19 Sep 2022 13:21:48 +0000
Received: by outflank-mailman (input) for mailman id 408723;
 Mon, 19 Sep 2022 13:21:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaGiZ-00005P-2B
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 13:21:47 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2042.outbound.protection.outlook.com [40.107.105.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01ed5faa-381e-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 15:21:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9423.eurprd04.prod.outlook.com (2603:10a6:102:2b3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 13:21:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 13:21:42 +0000
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
X-Inumbo-ID: 01ed5faa-381e-11ed-bad8-01ff208a15ba
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Os4mcu8msuIl8+5V9jnsGl39VNdWX2up76anL7T7dTbC/Eh5ujwN4ABQcHtTUGoxp50Fn+B9l7ts7ds2awi4CoSe0J5jP/O+Kd+75EdZ3V5ZnnHsNW5pFABCWbey02ukbC+v40FraMb9/80zppCD0Eq7xmcqNIoIysaaJ+mbi/3GcppWrREFsjBUfFWKCK6MwIS6INPwXefe2g9V28Rz57zn5hVoDinxcLwkW6Dr7i4PvUZSPlLkKGSb813czkenSXGzHJPg/3L95IwUlbbieRmiCJtVOXTYyw9rmGHBASjMXQNJf5Eaq445c7S0YAeMiQveVTz1R1IQRGgyEFAqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIWZ0/lDECLxy5/HW67iD21PHxulpsqP+pyianc6Py8=;
 b=kU6DMMS1E8natU8SEHg/XX7No96vZTyxYOAM0b/9NWk36+EUBOt93uaobLhz8Cnh/OaWGx/QZGBASO+HLC8ZrKyeDEV1wwhJQAy7khWT3rRKr22yAbTU8GibrHTfAveugL943o6hv+O/a1h2ZyDvTmDNCpX684zic3UUqCRvjzWzSlHN8r/+i1jm4QJlKmFQILH6rLaqRj96f2K3gNsqYBOHs4timRR8+1vL5KNIyHVDnMLEqLL2vlwbYND7HnyZTgvESwtmKunlT+8aXzV/iperXZOjd3N2kjYkyCeJv1RQSvbjv77cnSCmuL5EJQ5hzgIjUu+M7Ctqk5/k7SdT3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIWZ0/lDECLxy5/HW67iD21PHxulpsqP+pyianc6Py8=;
 b=J7AA5Bd1OQnHCVj3S0oBxUi3AEh49uh2yZK3Pwm6SDwT7eA2qfqgisKYTJaEZHQ7ALvy1ZQ5b3444k9g51lQw33ILqQPXTp62pEfxcTITJ1qpj0Ecf8M/qcFPRSgGmi/jHrUYyQhT8DXgzNhOZ5LDvYh/7tOunB/xHRl1FI6cAiuAiFChrF2Jtqal4EjPq17izCrpmhauqucJMcUgd9HgNgynDOaN51JE+W5OBwazMFTVa+LL6OkxhhT8sfm7dW7FtApG4fGrCOBDloJSkOvzf8QTjNJVIfRGf+p+Mjyl3s1ZWVEMc1JorasgsuYx61fB+YVFsFU5g6ZoXTyjOv43g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29d29f64-b799-d56c-1292-661fb5127728@suse.com>
Date: Mon, 19 Sep 2022 15:21:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] x86/vpmu: fix race-condition in vpmu_load
Content-Language: en-US
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Tamas K Lengyel <tamas.lengyel@intel.com>
References: <8294476a707d7f20799a40479cc0bf9a1cf07673.1663249988.git.tamas.lengyel@intel.com>
 <9fa4a72f-8b38-fbf0-40c7-8fcd6b34cf10@suse.com>
 <9e79155f-0836-1b18-b648-b6e5422e89c8@oracle.com>
 <737386d2-ceeb-ad97-39a1-42585b913b9d@suse.com>
 <CABfawhk+TByRwVvGjv-e6-2UFeO7g6xBz3-CR_QOtYM2_37U=Q@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhk+TByRwVvGjv-e6-2UFeO7g6xBz3-CR_QOtYM2_37U=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0058.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9423:EE_
X-MS-Office365-Filtering-Correlation-Id: e80faf34-251e-4631-0e77-08da9a41e481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	36utEoHzg25/zZJxziv6/OTZQQiF54XqZTy1i6YXeOnZVQX0OeOptjNXVHp7M5ttAmUxcRjCH/3plTqx2xCSVYMWTVuOJkjV+e73GvY82LjYg1GYljnw1Gd2fHykHcJL4wG25jxuHgcDQXlee/wjMdWCkoJni/iEpx9jYSdf50rrCWkdAl0KMtYSHbGXYRs/yh35v0GxfArYoPEvzyosCr4MkfSehq5N3drIGYNnvXPpM6+i6aBOPOy8EjET+78lHd97yGGWYJFFIwNJRzJvlKLxGKOGTLaerTnn/bpJGVaTJbGPEJJK5lLIXsOXna9LR3fuqsPQFcPOOXiSUMigTP3Gfyp/o/fP44w17H6e7ga/L+VzJH0nXk80pfdNuZl9Kv/cSbKo9NBpQhjCdasYXC1fQw+P7cnJpmDqQsnkGH42vMuTj+ir0yEFTDrux6F8x4IwGZcKjWCE8aCsbN8e2fKwtJ0fHW+riiwxuzWcR0sIkVMPyMR7+ldCNb9tzjxas7US502tCvnjitvVTuzn2d3pbWjzEdGZY+kx/qLzABixE4TIjusfT0uM8qBMbuEn0XOnLA1YTKFSZRcej7+OqbWJ+wE9JxpmIU0mZHBAr9yGZgI0Ki3BDOoXWxy4fxGYWRrWSr/pllVf53alMLL4p8aG5oMEBhc02vPdROgrNvutXRFf/r+3D/nXME6EFcgMkRli9Al5X1ZnpuNL9wuN/P98BuaU0gQa4IaUC44FpMJ5ji1l8X+Aty4BmGh146wheBTD2oeDYwwZdspnxNWjA8MXdxMHZEoRDenhvx0cDD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199015)(53546011)(26005)(6512007)(6506007)(2616005)(31686004)(38100700002)(478600001)(6486002)(2906002)(5660300002)(66476007)(36756003)(86362001)(31696002)(186003)(41300700001)(83380400001)(4326008)(66946007)(66556008)(8676002)(6916009)(54906003)(316002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d25jNk0zOW1oOWNHUFk1SkxaVDVhWU1BOWRPangxeWJUelRzdXdRY1NqRzZ2?=
 =?utf-8?B?Qk5hbjRTU0J2b1FKQlJXWmpQMWIzRW10ZHNQaUIyYzhJcVQvcVkwNkkzZ2Qz?=
 =?utf-8?B?NXR2MFFWWHByeE9SdU5VSE93aHRNZW5jV1Q0SHJKdDRsWDdad2Z0RXNpdXg1?=
 =?utf-8?B?WHRjNkVnZTNyc0pGNjgyMEhBQTNkWThLbzM0Mm9KUWsrWnpMMzFmRndmL2pQ?=
 =?utf-8?B?Nm9xYkZPT1hRN3RsSGk3S0NCb3psWFhKbUdibnhCOEdpYysyMElJOW9FOGhL?=
 =?utf-8?B?bHJRVE9lTklFdzVidW9WZi9nVWswZlhwK0JuZDZxOTFmeGg0aUhwVGRVTWRL?=
 =?utf-8?B?ZG1zOEVEeFliWGpaZWhVQjl6TVBaUU4waTI5U3gxK0k5WjF2RXBxcVFQUEJV?=
 =?utf-8?B?czAzWnFNODZUVzFDWlNHcnpWSGJiZll2MU4yRGJYODYrSDVyckNDVGx1QVdz?=
 =?utf-8?B?OFN6b0IxcTRCOHIvVDhCRlFURnlvcE1xb0d4aERSbDRBMnVxWnZrUTNqSTcw?=
 =?utf-8?B?dDUvM1FOWVorR0dldWhmY25QM1NzNkZsejdUVTFaN1k2QVM4ZVlrSm1scXJn?=
 =?utf-8?B?LzFJaFUrQmpiR2xPYzd2UE9vK3BxWnZDeFNZeUhwMldVMWo3M2V5Ym96eURt?=
 =?utf-8?B?bnlJYjNEL2h3c3pIZ2NVM3ZpamhwMENLNjgxUExOQkNhQytZOWRaTnZoQWty?=
 =?utf-8?B?TzIyRU9nVUVwU29vNjN1a01wSlcyekhvc2tEaHNDb0pVZFY2VUM2R29Qa2Zw?=
 =?utf-8?B?Ni9kSmdIMThTTjZXMXpVUWNiVmo0TU12dkV5dGhXRVFRZlpmYVU4WmRxRmlR?=
 =?utf-8?B?YnNCcjE2clRFN2ZKOEZJRTRaazBVZklERlFGcldHWExHV2E0N253V2xFMHk1?=
 =?utf-8?B?NjU4STI4dzE5SnJXZU1yZHBWU0lQakFWM2hFUXJQUmhpbVNsdWxFU2dFd1By?=
 =?utf-8?B?WktrYzBxUjdKeVRucVFaNExkVjJoUkU0RXlESitnK0ZXUWxFaFNSQmhON0lF?=
 =?utf-8?B?dTRNcFdQT1BJNVBpbHdBR0ZzVWI2TGd3RjBZOURCek50SG42c3k2RmNsMTJM?=
 =?utf-8?B?bXNmcGlSZWNKb1lZL3U4UGpIQVNoTktCbUU5K1k4bnIxN1Y2SlhlMVNjcmJE?=
 =?utf-8?B?bEsvdHdVTzJWb2pnaUV6SXE0OEx0a3R5dWVNRDZMRFR1SU9OTW9iWE1qWVpz?=
 =?utf-8?B?d1ZFVEZ2NUNvOGd3RmlkZmhIS0gzbFRnMEpZTWlCNldLYysveDJVTXgrTEZZ?=
 =?utf-8?B?cEptOERlSFZpbHNpZTFXbE9jcjc3cGpJQ0tDSDFyYU52bWIrbXJlcGFBNktv?=
 =?utf-8?B?eTNSY0Fnd29nbDV5a3hwV0FUVDRrWHV0SjByQXRleDRtanp5QlJqOFJldGND?=
 =?utf-8?B?cTM1eG1tMnJuVU5rVzYxZzlId1JyT0prbUhaODk0MWlHSThYc3NMdWlocThy?=
 =?utf-8?B?OUpyc3RoOTlIaWZuSmFQT2dMVXY4ZVVkMWJRUm9HVlMyQk1nN0JVbnY2N25w?=
 =?utf-8?B?T1JwZE42VUJpY1Jac0orSE03NFN2d003T292bHE0eENBQ0dyeS9FV0IxaTMx?=
 =?utf-8?B?U1hQbWp4OUNWSng4Q01RR0ZEeXdYMGNWMk1NaEE5dW55S0p6ZEJkeW1nMlV3?=
 =?utf-8?B?aWkyWmlXTXZGZDB2TzhONTZjeXlnczNwRnRuK1NYK1AzTkdyZzZhTkRsYVgv?=
 =?utf-8?B?Z0lpS1dKWGdER1pQT2dGNEJXdGxpRTVxSVVTYU04ejI4czZJcUtjakUwSmlt?=
 =?utf-8?B?cFhWamowWm5LY0VScmorYzI2eFRuUTBORCtiZjRHbnd4dG1SeWVuVEFsUGtZ?=
 =?utf-8?B?TFVGbzV5UmsyRWY5Zjh2SE45VUtMbkFLc0o5bENzaGtUb1FqZzZHTGRZL1Rs?=
 =?utf-8?B?cXBVVHk4Nis2aVBkMkdlNEZzQVppRG9jaXRpWVFYT2dDS2k2MjEwMG52eDd1?=
 =?utf-8?B?SmVnKzRmeFZBN3lFbTNETzZJVzk2R0RucHN1NW12NE1hTVY1VEZLd3JsNGtn?=
 =?utf-8?B?RjlNQlpwZEFVckdqbjVGekhGMkFvd1ZTOExtYnNlWmozWnVzaWVIM0JGY09k?=
 =?utf-8?B?ZGx3b2hnTnROWHpNMUdmTlJEZDh0N2x5UVVnc0RjQkxUR1hDME9tbDhEN0ZG?=
 =?utf-8?Q?2m6Cleeur6g+wNlOqiW90E22j?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e80faf34-251e-4631-0e77-08da9a41e481
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 13:21:42.8092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoXgeIxhAy/a5P4Ywh0WOocX23LOdl72BlWur41rcVMeVmbq/feTpS5tBngJn7SiIzuM1zN4SPvY/Yt35HGtwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9423

On 19.09.2022 14:25, Tamas K Lengyel wrote:
> On Mon, Sep 19, 2022 at 5:28 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 16.09.2022 23:35, Boris Ostrovsky wrote:
>>>
>>> On 9/16/22 8:52 AM, Jan Beulich wrote:
>>>> On 15.09.2022 16:01, Tamas K Lengyel wrote:
>>>>> While experimenting with the vPMU subsystem an ASSERT failure was
>>>>> observed in vmx_find_msr because the vcpu_runnable state was true.
>>>>>
>>>>> The root cause of the bug appears to be the fact that the vPMU subsystem
>>>>> doesn't save its state on context_switch.

For the further reply below - is this actually true? What is the
vpmu_switch_from() (resolving to vpmu_save()) doing then early
in context_switch()?

>>>>> The vpmu_load function will attempt
>>>>> to gather the PMU state if its still loaded two different ways:
>>>>>      1. if the current pcpu is not where the vcpu ran before doing a remote save
>>>>>      2. if the current pcpu had another vcpu active before doing a local save
>>>>>
>>>>> However, in case the prev vcpu is being rescheduled on another pcpu its state
>>>>> has already changed and vcpu_runnable is returning true, thus #2 will trip the
>>>>> ASSERT. The only way to avoid this race condition is to make sure the
>>>>> prev vcpu is paused while being checked and its context saved. Once the prev
>>>>> vcpu is resumed and does #1 it will find its state already saved.
>>>> While I consider this explanation plausible, I'm worried:
>>>>
>>>>> --- a/xen/arch/x86/cpu/vpmu.c
>>>>> +++ b/xen/arch/x86/cpu/vpmu.c
>>>>> @@ -419,8 +419,10 @@ int vpmu_load(struct vcpu *v, bool_t from_guest)
>>>>>           vpmu = vcpu_vpmu(prev);
>>>>>
>>>>>           /* Someone ran here before us */
>>>>> +        vcpu_pause(prev);
>>>>>           vpmu_save_force(prev);
>>>>>           vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
>>>>> +        vcpu_unpause(prev);
>>>>>
>>>>>           vpmu = vcpu_vpmu(v);
>>>>>       }
>>>> We're running with IRQs off here, yet vcpu_pause() waits for the vcpu
>>>> to actually be de-scheduled. Even with IRQs on this is already a
>>>> relatively heavy operation (also including its impact on the remote
>>>> side). Additionally the function is called from context_switch(), and
>>>> I'm unsure of the usability of vcpu_pause() on such a path. In
>>>> particular: Is there a risk of two CPUs doing this mutually to one
>>>> another? If so, is deadlocking excluded?
>>>>
>>>> Hence at the very least I think the description wants extending, to
>>>> discuss the safety of the change.
>>>>
>>>> Boris - any chance you could comment here? Iirc that's code you did
>>>> introduce.
>>>
>>>
>>> Is the assertion in vmx_find_msr() really needs to be for runnable vcpu or can it be a check on whether vcpu is actually running (e.g. RUNSTATE_running)?
>>
>> You cannot safely check for "running", as "runnable" may transition
>> to/from "running" behind your back.
> 
> The more I look at this the more I think the only sensible solution is
> to have the vPMU state be saved on vmexit for all vCPUs.

Do you really mean vmexit? It would suffice if state was reliably
saved during context-switch-out, wouldn't it? At that point the
vCPU can't be resumed on another pCPU, yet.

> That way all
> this having to figure out where and when a context needs saving during
> scheduling goes away. Yes, it adds a bit of overhead for cases where
> the vCPU will resume on the same pCPU and that context saved could
> have been skipped,

If you really mean vmexit, then I'm inclined to say that's more
than just "a bit of overhead". I'd agree if you really meant
context-switch-out, but as said further up it looks to me as if
that was already occurring. Apparently I'm overlooking something
crucial ...

Jan

> but it makes it so that the vCPU can be resumed on
> any pCPU without having to have evidently fragile checks that may
> potentially lead to deadlocks (TBH I don't know if that's a real
> concern at the moment because the current setup is very hard to reason
> about). We can still keep track if the context needs reloading from
> the saved context and skip that if we know the state is still active.
> Any objection to that change in light of these issues?
> 
> Tamas


