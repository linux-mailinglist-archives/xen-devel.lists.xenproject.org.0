Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 599A85BCDC1
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 15:58:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408763.651625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaHID-0006um-Qc; Mon, 19 Sep 2022 13:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408763.651625; Mon, 19 Sep 2022 13:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaHID-0006rj-Nd; Mon, 19 Sep 2022 13:58:37 +0000
Received: by outflank-mailman (input) for mailman id 408763;
 Mon, 19 Sep 2022 13:58:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaHIC-0005F1-E4
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 13:58:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 276b8fc0-3823-11ed-9647-05401a9f4f97;
 Mon, 19 Sep 2022 15:58:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9439.eurprd04.prod.outlook.com (2603:10a6:102:2ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 19 Sep
 2022 13:58:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 13:58:34 +0000
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
X-Inumbo-ID: 276b8fc0-3823-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiUevjIDluKJwmwqLSrkpCTwTgUFFmbi99hShdNv6apjwDwTYtTrU1QQAfSvaWleMp3vgHRQR/ep9QU2dee7qlxXnu8P0aT+hEnnvd9Mh1TEUSeSWnbQts0v7ffBofi0nzHerkeESIy/i5bfuqqunkmWXlSsuB3qXV/5ciz5ll0y10de3neN9zETl5OPNclE7E1Fv1iRp280eXWn7SU31HLo8rVDkoJD55jmUxeS9cP0K7PhPccGidlF6DIs8fzG9h/IZ/4frctUKaDU+NcohtPVMy5VfwVLPWG2UouZLdotpaL8LAn/ouNgO3wAlUY0GrY0tmW86vpC2UVO7YMHvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70h6zE93Yjhpm8cfkbsJwWQgswYjHgzw136/Ypnf52k=;
 b=Aol3a06rBsbGI8VzTTapGHfmPgJTeNjOiY0zc0LgJaBMbM3NWJzIm5HZeAJglaScH3gM4G7eQM6G2qwNH2MWhwPj2rAV7Xxe191f9DJovfPW9t5SlzarXZbM+Sfl3kEoFhQV8kZ/9wpJOZ/LDASJYNTS9E59G+VQSAl3FO7a132atZTjcH5dlfAox1evyTN5FPsnjTxReOu7N0H35fEDPxJWpHLgnbDglZpS1YYTuSN0hJVP1BA6rVltKu+Fc0uUQt9bB364S6J9mO2UJGR4Fn4FFjsBUNvWHn+zaQNGANC31oBiXHuNvd61mQCBbqpO29Nr3q9GHKiKXZ1+fh7A0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70h6zE93Yjhpm8cfkbsJwWQgswYjHgzw136/Ypnf52k=;
 b=l+xqbyACvEO2FZO6rF6424TcHMQWeuRjifFGnhX1WAcQ9MJIhzVESa0Bdb4uZFosEt26owJT+6moEX3p8kM8zeKxGVGc5X/Mv59fb8uxgRjsF3k7YVlAcX9Z2n3s4Q2Q1cl7dFI3rxuGfJgXsyzjavWjz3b1IIRvaalpdIrkdQYn2eNoeQo6+gMnfsOYGcq52cmrB4pEkEEeXlV+9LANvz/lWqgUp8upH2ToEsPSVo62mVuMprWJvFn8/lW7TyRAXxFDD3yQF3hsuuFgcBXE0O4Le/4Bb3O9it2IS7iHq7TBkzjiwPHKIvWD825vLTpAruW3lA6ohv19QbfA+xijjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <406b7f6e-d092-fb6a-d0dd-60a9743027f6@suse.com>
Date: Mon, 19 Sep 2022 15:58:32 +0200
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
 <29d29f64-b799-d56c-1292-661fb5127728@suse.com>
 <CABfawhnRUhQAc0cRybz8sLLkxjuZCO6JVA5QYHBERG7gf0zpZQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhnRUhQAc0cRybz8sLLkxjuZCO6JVA5QYHBERG7gf0zpZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0033.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::21)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9439:EE_
X-MS-Office365-Filtering-Correlation-Id: b56939b8-1172-4971-fe66-08da9a470aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+7DVDcCOfPFlcyCuapyU8IXWTzToKISGTN4Y4sr1ecc4oZLmfbVr6IMkHuJaiMlQ60tNjIaPE0YDgMe3PlqEdx1kb1WQwCvzEMyAUXedUV9/7JH+R9oe6Gh0yFU6m7EJP86jyzMID3o9+KG/G/9aikUAd+4Bxs8DUGzgwFCet6LDksljsNXw+TVdA/tPzulraFUr2u2+uM0ks/Lxab0BYG6asz5Kwia32qLBr8t3dJdP8d7YggKsyTV/Ii6Z24o2JEjv5RfU+OL23670ninyBdB+JqP+rJaNW5EXluHOXau7i+1Rs4Cw0UtZzMuIEBdrJvjVwo3lSgyufUoM7cE4Wuh0Rf/Bb2j22Op+WTgk1PC5vFrqGlRTXKosvBiEnRFxJGHiybaiyHMASSrXxZT/hmca4p+uq67WJEbcg8BFPYL5r0xlf3lqJZ8rJqJSxS2GXSOvPcAGT8AKWwL26VLr183s6W8kum9/NIn0xyNLdbFDcPK6i39XjnwJB2QR9Y9fKwuqg+4rjB1XHWdGXxR7za7RoF37z6VlXpXIyGCpGllrf2vDFFZlCe565DMp0eyC7sQXDc92x/ncsSq+BcG6cpymtwfSXInePmlYvTj7XD6T5AtbbTg7eGSt7c9AHqJ08/999i3I/GcfC1AVkdvc0iF8icoWYSpH+OGHtu9ThIYGFi+gH668LqRLfYHUFwSqV3o9xQH5pruMYolinlzVG3obP0Ku5yk69IMF4FPeXWglSTjNpxH63BQLNHNzSYYFSoO58PSLD7qIX4O+AuslwR7s6e/T1npIJUueANRVA0o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199015)(66946007)(66556008)(2616005)(66476007)(54906003)(26005)(53546011)(41300700001)(478600001)(6486002)(86362001)(8676002)(2906002)(83380400001)(316002)(4326008)(6506007)(6916009)(38100700002)(5660300002)(31686004)(186003)(31696002)(36756003)(8936002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEhMT24yTytsZlYyWHlaYTBZYk1lRjlaZUp6cjhJUzI5cVp3d1JmN1FvWTlL?=
 =?utf-8?B?ZFB1UnJIWlo4UUJqNmF0NG5Ca0hkK3Q1eGRFZ1VYemxmUkZsQVh6a1BqWDNN?=
 =?utf-8?B?alBRYTEvUHlxWHZsMjBoYW8zVUM4M0xuTGJQRURNaG9kTCsxSGp1NUd3bHBQ?=
 =?utf-8?B?eEVlSkVlM3F0T09lWEhTdTNTL0g3K01QQ0JWcHN5VDVaZGFaQytoT0tFQW5H?=
 =?utf-8?B?VVE0czJLbUtJeFV0N0pNT2R3T0F0dEc4aVpIWlFnem9vbndvSENqNFJOSHpH?=
 =?utf-8?B?dmFzTGg5eEN6SkpkdC9qczA2NEMwbVZQaGU1elBYNXZnZ0tRRVVlOEpWUHhl?=
 =?utf-8?B?Q3ozM0Urd2xFTWUrcW1hVzErQVR3N3JuWVV2aVhDSWJocEN4ZXdXL0FOcURr?=
 =?utf-8?B?UVdiSSt2bWhJR1UxWHdUVDFzOEROK3ZlZEN0ajdJUiszd3Z5SjNOZUxlaUpX?=
 =?utf-8?B?ODdvUWZSbUpueTYyejdBYTdkaVFlTmlkOE9GNWpuWnpPejNDRlZxcy9EMm1G?=
 =?utf-8?B?TmM2a09CN0R6ejAvM1I0Wi9nQlZrdUJxQWNJWC9aQVkyWndZeFBzQi9oS0o1?=
 =?utf-8?B?MTlnL01lUjdSUXAxWURuZUJXRGwvbkExTmY0UmNLd2ljUHo5aXJ4dStHV0NG?=
 =?utf-8?B?ajdPUnZMaStJMmtVR3BhV2YxRkMybWUwSTNJS2FSSDNPQXFZaHFCZThnL3dh?=
 =?utf-8?B?UTErVGtwMUFXcW0vaE9CVS80RXNZUVdqV2tQN25Ldk1kYmJLby9iRC9laVhu?=
 =?utf-8?B?QTBIUmluM2N6QmE0ZG04NDZqdTc3bWtIUXpKandUekt6WVhGdGUyaWljVGJh?=
 =?utf-8?B?MEZZS3oxZUFIdUc5QVRYam00Ym9rSW41RGJ5a2RvZWpnaGYwdXprQ2c3UnBY?=
 =?utf-8?B?S3ZLRzYzSSs1UzV6c0FIbW5SV3ROZHhhKzY1MEIxS1pEbWFqcWUxMUN3Vkd0?=
 =?utf-8?B?MUNsN2hQNXRid2pjcW8vcHY2ZnVNZDlrV0pJU3hTWC9udWNOY21ROXNrc0Rv?=
 =?utf-8?B?YlVWY1N0R2pkbnJGekYzS0ZtMXpYaWQ5MDJYR3NhcGJ4dzFRNEg3YTdaV0do?=
 =?utf-8?B?S1VCaXhmWTVKUHE5TDlRK0MwRVpVdW9ZTUtmbXdGVURoOHVCMmJZYkNucytB?=
 =?utf-8?B?L0VGNE9ZbUtWZDRNQXBaU1I3eFlXZ2F0bWNSemlsMisraUFZWTh3RGJMaEVB?=
 =?utf-8?B?L2pxR2JHU3owREtVTStId2tQZjJKSk0rMXV5bnFHZTR1MHp0a1JueTYzLzJw?=
 =?utf-8?B?alZvOEZ0Z3NWZVdLMThUNDBDUHZOdXlNSURYalUza0JUT1ViMVo3N2dxb09r?=
 =?utf-8?B?L2htSk8wRGR4SXZGYzBDd2tTY25UTmZrVHZvWTl2NHZBbVZoQUQvNnBPU210?=
 =?utf-8?B?dkVOR3orTWhlSWRiSFl0Vk1EK3hxbUNlVFA2UGw1bHFGTTgreDBzYnpNa2FI?=
 =?utf-8?B?eThMeGt0TEQ3TU9paGJuTjgyL1Q5b3dDelkwWjE5SXVQUFVKYUUvclpGLzdX?=
 =?utf-8?B?TnZMT0ZIeERnOGRXbTcxM21aQS81MVlOWmQydG9KajduMFpOZHlCK05RdU9P?=
 =?utf-8?B?VTMzejVFVW9ocFJaY1liRkRjSE9oSEZQWWVZLy91RXp3WGlJMWgycnNWNlFj?=
 =?utf-8?B?Ri96cGY4cmVYUE5UcHRvTllUd1ZGanBDeUdaWnBOTEp5TGkwTTYvQmNxZUxM?=
 =?utf-8?B?a0RoY3BFZk1ZU3pMN1AweDFJMkM5QWd6TE82MTBreTR1SmRxNlY4TFdtbzJL?=
 =?utf-8?B?WXE3Y3VMQzRzd2ZENVU3ZzZLaHZUSkNZV2N1MytGZVhEaHA4UGtuSWpVdWlk?=
 =?utf-8?B?c1c5aFZlNlVDbTFNWFJwWEMzNDhvUUxnSDd3b0JNaHdBZkRkM0JlRGxRclNQ?=
 =?utf-8?B?bTZvb0piaU5uVktSZm5DQWlzeXVlVzhQa2ZtTVVwdHI5N2dFaGo1eWhqS3Qx?=
 =?utf-8?B?VmlTdW1odVBiM2tKSWNha0szdVFicGF3bmJrVXpwSGdCMU9iWGI1cGlxanVP?=
 =?utf-8?B?NDNpQzNPdUhGR05DVmMwdmxzNlFranhjYTRnS1FsNEd3OVRXWHNWeTFkbklV?=
 =?utf-8?B?ZTRtNEVWMENITGJqWnZ4TU9YOW4vU2lScHNyL3Q4djlUQ0plMGlndGVlUzNX?=
 =?utf-8?Q?whZ44GUzonsD+EK8D/cTjeA2u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b56939b8-1172-4971-fe66-08da9a470aa1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 13:58:33.9340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuvRBnTMtuTTlKjhr6eI3hRQDQlNqmwF2f5CHSyXgXTpb64fqoeRLnXsUhFFgUj55faZk2L20un9ADNN4WclOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9439

On 19.09.2022 15:24, Tamas K Lengyel wrote:
> On Mon, Sep 19, 2022 at 9:21 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 19.09.2022 14:25, Tamas K Lengyel wrote:
>>> On Mon, Sep 19, 2022 at 5:28 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 16.09.2022 23:35, Boris Ostrovsky wrote:
>>>>>
>>>>> On 9/16/22 8:52 AM, Jan Beulich wrote:
>>>>>> On 15.09.2022 16:01, Tamas K Lengyel wrote:
>>>>>>> While experimenting with the vPMU subsystem an ASSERT failure was
>>>>>>> observed in vmx_find_msr because the vcpu_runnable state was true.
>>>>>>>
>>>>>>> The root cause of the bug appears to be the fact that the vPMU subsystem
>>>>>>> doesn't save its state on context_switch.
>>
>> For the further reply below - is this actually true? What is the
>> vpmu_switch_from() (resolving to vpmu_save()) doing then early
>> in context_switch()?
>>
>>>>>>> The vpmu_load function will attempt
>>>>>>> to gather the PMU state if its still loaded two different ways:
>>>>>>>      1. if the current pcpu is not where the vcpu ran before doing a remote save
>>>>>>>      2. if the current pcpu had another vcpu active before doing a local save
>>>>>>>
>>>>>>> However, in case the prev vcpu is being rescheduled on another pcpu its state
>>>>>>> has already changed and vcpu_runnable is returning true, thus #2 will trip the
>>>>>>> ASSERT. The only way to avoid this race condition is to make sure the
>>>>>>> prev vcpu is paused while being checked and its context saved. Once the prev
>>>>>>> vcpu is resumed and does #1 it will find its state already saved.
>>>>>> While I consider this explanation plausible, I'm worried:
>>>>>>
>>>>>>> --- a/xen/arch/x86/cpu/vpmu.c
>>>>>>> +++ b/xen/arch/x86/cpu/vpmu.c
>>>>>>> @@ -419,8 +419,10 @@ int vpmu_load(struct vcpu *v, bool_t from_guest)
>>>>>>>           vpmu = vcpu_vpmu(prev);
>>>>>>>
>>>>>>>           /* Someone ran here before us */
>>>>>>> +        vcpu_pause(prev);
>>>>>>>           vpmu_save_force(prev);
>>>>>>>           vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
>>>>>>> +        vcpu_unpause(prev);
>>>>>>>
>>>>>>>           vpmu = vcpu_vpmu(v);
>>>>>>>       }
>>>>>> We're running with IRQs off here, yet vcpu_pause() waits for the vcpu
>>>>>> to actually be de-scheduled. Even with IRQs on this is already a
>>>>>> relatively heavy operation (also including its impact on the remote
>>>>>> side). Additionally the function is called from context_switch(), and
>>>>>> I'm unsure of the usability of vcpu_pause() on such a path. In
>>>>>> particular: Is there a risk of two CPUs doing this mutually to one
>>>>>> another? If so, is deadlocking excluded?
>>>>>>
>>>>>> Hence at the very least I think the description wants extending, to
>>>>>> discuss the safety of the change.
>>>>>>
>>>>>> Boris - any chance you could comment here? Iirc that's code you did
>>>>>> introduce.
>>>>>
>>>>>
>>>>> Is the assertion in vmx_find_msr() really needs to be for runnable vcpu or can it be a check on whether vcpu is actually running (e.g. RUNSTATE_running)?
>>>>
>>>> You cannot safely check for "running", as "runnable" may transition
>>>> to/from "running" behind your back.
>>>
>>> The more I look at this the more I think the only sensible solution is
>>> to have the vPMU state be saved on vmexit for all vCPUs.
>>
>> Do you really mean vmexit? It would suffice if state was reliably
>> saved during context-switch-out, wouldn't it? At that point the
>> vCPU can't be resumed on another pCPU, yet.
>>
>>> That way all
>>> this having to figure out where and when a context needs saving during
>>> scheduling goes away. Yes, it adds a bit of overhead for cases where
>>> the vCPU will resume on the same pCPU and that context saved could
>>> have been skipped,
>>
>> If you really mean vmexit, then I'm inclined to say that's more
>> than just "a bit of overhead". I'd agree if you really meant
>> context-switch-out, but as said further up it looks to me as if
>> that was already occurring. Apparently I'm overlooking something
>> crucial ...
> 
> Yes, the current setup is doing exactly that, saving the vPMU context
> on context-switch-out, and that's where the ASSERT failure occurs
> because the vCPU it needs to save the context for is already runnable
> on another pCPU.

Well, if that's the scenario (sorry for not understanding it that
way earlier on), then the assertion is too strict: While in context
switch, the vCPU may be runnable, but certainly won't actually run
anywhere. Therefore I'd be inclined to suggest to relax the
condition just enough to cover this case, without actually going to
checking for "running".

Jan

