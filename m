Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22965BC553
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 11:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408651.651460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaD44-0006zr-Ld; Mon, 19 Sep 2022 09:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408651.651460; Mon, 19 Sep 2022 09:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaD44-0006x3-Hq; Mon, 19 Sep 2022 09:27:44 +0000
Received: by outflank-mailman (input) for mailman id 408651;
 Mon, 19 Sep 2022 09:27:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaD42-0006wx-V6
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 09:27:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2081.outbound.protection.outlook.com [40.107.20.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42d6b0df-37fd-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 11:27:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7227.eurprd04.prod.outlook.com (2603:10a6:102:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Mon, 19 Sep
 2022 09:27:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 09:27:39 +0000
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
X-Inumbo-ID: 42d6b0df-37fd-11ed-bad8-01ff208a15ba
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLXivkKfA/atjgTmwy91+llHlSxxy7CUpQpysvRtRYKflu15GD0JCy0cOTdIfDTea5J4Q5BZMZQ5VjdlJFVeLlCWwLtLVUzCyAsFN27um9I6uNgN7HsMrIf8ee41E+IYqHX1rAncc+0ZTvhePh8r99jphvkQTgsuhgt3IV1wOcDIFe5aLPXWuZoNXSzuUgF/x1cwf67rpL8wlqRGkdVd1eAGeQ11Jkigm23jOxHKGTnTAQ6pFeTOmgDX7mPoZmIl8dtEjgIoOU4MVGzMxF8rbRJC79bra0rzGkodBW6vmLSfIjBzr2eiUvSktjEVXGmWnmzTH3vvvY1+NlpAmXjh1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfjF2Ow96NNxWkR0u2rSRqq5+oo8NUCL9NhBeZjuwM4=;
 b=CJEkqlYkEWTG+385JcW8j91TOh1NvNaBEKEcL9j0HwsjhxIcDat7xS1QOW4u3pnK4zIx64vH6I7/913ZzgYM+n0FH9/cytaQGb8sskXuF83vWZiNKfrzg20gKBGBcuA0cC2guBUXVzd9vWcDkshJsHpaNnICRVP5wM390GpWCeZs7KR/aCxCoJzm919HPZe6G9pR0rHnJSuGoNIcvRarxYQf5QOdzUXSX7zsjH54W3YtVIjyI5mTAqAbgo/Ft05J5mA4i7LF+3/uTikyq10J9IlL3PeiDxEtqvu3mp3kCmvSuHmW7jHy60z5d7y64USbjhL59YUjL1X3dZel/060yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfjF2Ow96NNxWkR0u2rSRqq5+oo8NUCL9NhBeZjuwM4=;
 b=QRikdWY+wI+Rw2qpBnueue2oJUEp1phy6+VjV4tzIxQcvBsP6qJBidLPExa00bZARqHpWR3nC/oXCcC9NyIlTncJZBUtRWBBun67vkW/8WspxQIAw9q/wSg8jEHZWRv4EPY3LObU6MO+fhGRhpf950+yGvZwQvKQ4NYexVADNOPQ9xK1kkfOgKyO7KC6rLlXfD/Eq4I+kjZ5KD1XEtV9Zu8/kygs71cpqRs/+1KL+dHlJkQfTy0TXPf/ScMjWXjYF+uUf0RihmjRFYPLjv5gVqyxzYbNJ+n2tSesQLSDNaZjuVYrtKSkYhBUX8IIyP13gTJlnqECH9OAKLXvghST7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <737386d2-ceeb-ad97-39a1-42585b913b9d@suse.com>
Date: Mon, 19 Sep 2022 11:27:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] x86/vpmu: fix race-condition in vpmu_load
Content-Language: en-US
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Tamas K Lengyel <tamas.lengyel@intel.com>
References: <8294476a707d7f20799a40479cc0bf9a1cf07673.1663249988.git.tamas.lengyel@intel.com>
 <9fa4a72f-8b38-fbf0-40c7-8fcd6b34cf10@suse.com>
 <9e79155f-0836-1b18-b648-b6e5422e89c8@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9e79155f-0836-1b18-b648-b6e5422e89c8@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b3a7311-a757-401f-8884-08da9a21326b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eSL9N6Poe4+LjRFNIq0Ryyce0CxSmYJI6RBWTyCLgScNWXDecyxdJ2zvYiJMc0MS74+AVdOR3BExLB5oEi5ARy6Q/I8HzuH5BlohveAM51cyYLkDQhby/WRx7kRpaECAu8TBySDNeCzd4i/0A6xJllaHxIJEURysWgppyDLfDZZzpGRTclBp0REP6eeakEXbtMaLt8cVmVUJo7/t+OajwJQ7qfwxAfq3GYt2IuVBvdTP3cryGtFWtjmD3Ae+t84Jo2I7x/CxaWhRTS/lmVz8Hha9WsIxBKmWMLbkXwnqmAap7ex+G5hWXIYL5uO6CVi7+BE0gSa9Kc1bQa2KxQshWmBCxhYDN5IgEsjr3wO/zmVWOhF55jW2ex8KhnsKq+zV+V7/UblD0k1D8AAZyPS/wbBZ4UfAKl0C8NAmpaikQNdu1nB8VLS4EL5CUdPo7PgkncRT9A3NYeeyYknB3S9PRQezjtjQ4h31xCT4XN5I6d+FcHdnRBG6BdralQo7TL57RBMMghADeFkDcgSxnrs++s3BYJzguvPSkvByQx4UBLn+28ZRs7qrH7fgm6p/FUC5BL6zOgMkXR6Oa2deB5vG5fq+m/3TSCxBE2LMur6shniVB3Bo1wfF12Ce4q8B5YOIaG6m1uKhUaXdUnmRSx9H0cnvWAv8c6lfGhgwLPu0hvQkqJ4ccbcMC4+q1R7LrkTwz2WkjOikwA6iDB+Ggv5GRHjQeSCMZTIloFyKNIiAYANAwWVZBUR54nh+wMMJZ+TTzr5qfVX091anlnJhY722HYzQigzac5V2+3xbGY437OY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199015)(2906002)(31686004)(36756003)(316002)(83380400001)(38100700002)(66556008)(4326008)(8676002)(5660300002)(66476007)(66946007)(31696002)(8936002)(6916009)(54906003)(86362001)(186003)(478600001)(2616005)(6512007)(26005)(6506007)(6486002)(41300700001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmROaWpkT1JmNnorWmQ0WEN3Q3p6NmZROFRkUmZ4OERRa2hjWVpWaHgyeXFn?=
 =?utf-8?B?bGhEQnBvaTB1SVRUZDlNVkt2Vi9Sd0pYZUdhMi9uZ1kwNjV2ZWllM05oSnFy?=
 =?utf-8?B?cVUrVW80NFRvdHlHTlN1NTg0MlRtS1JWQXJqa3ZQbkdHaCt0OWMvVGFkUDFI?=
 =?utf-8?B?RXMyRFhDWHdpNlZRbXM0cGE2UW0wZm05ZUs3NDZwdi9WUUNSZnVzbmpVazIy?=
 =?utf-8?B?aGVrWFJwYW9IczJSR1R5WjNoeTJjRElaTHFDUVR3cFlkZzkxa2FrcU9STzNl?=
 =?utf-8?B?NEtyWEp4a0oybXB4M1F4RXNlOHJNSUJDNE9zZ1plN2dPcUJVV0gvQnAvQW0v?=
 =?utf-8?B?aHFHRVdDeEZEa3g3d2tIY2hkeGhKRnFYRlRHYndrcVYrVmNDNGlxYTgxOExm?=
 =?utf-8?B?SE1mNTJjY0Y0aW9kdHcvZVkvTW1Gd2hCVFpOc21BcUhBUTFubWNFdXVLN1ph?=
 =?utf-8?B?Rm93bW9mMlpva0pGbkdSVXJIekpYQUVsTGduLzhsTjRKekZINnE2TEZCb2l3?=
 =?utf-8?B?bG96MzhaYzZxRUtFN1JlOTVzT2t1SUl6MzNBbDFaclhlM2lpRVptaHprVUov?=
 =?utf-8?B?VjhxZ1Z1WjYrL2U4QytTaG9WSnUwNmNpNW01L0VQZERKajJFTzQ3OEh2NFdH?=
 =?utf-8?B?OTRjOVFndVZMYndUR3ZGOTBCVkd0TEViNDF0RXNVeHZQN2MxT1ZBVzA2TGNR?=
 =?utf-8?B?UWkzTHp4STdMazNtSWFTZFZoTXQ5dWZVOStCRGdNZHA3bkx1MVNZMDJDcVJU?=
 =?utf-8?B?NXVhTyswZXlmZ1U2bS9Ma0VjT3NKejhXN0l5YlV2U01LZjhFc2NkNER5bUhG?=
 =?utf-8?B?ZzNibTdxZHg1SmVFL2xCd3MwWERGWjd1VmxNMFgwalVCam4vOHdHbnFKYlNN?=
 =?utf-8?B?RW82S0xtZldIS1Y1MURxdDNlbnJkSG1aMXNPSmZmcW56cWxYSTdCbjg3K0dP?=
 =?utf-8?B?dWhEY01OUzhwaERzRUwrcU1CdFd3Vlh5TFlyaFBCUFRYOHlMcEhIRWJiT3Uv?=
 =?utf-8?B?V01yS2dGNTRGUWRHcFpJdktCSHo2dDFRcVIrcXhvMEozbC9uYnBJcC9GT1F6?=
 =?utf-8?B?S3NTOGRoNXo5Tkx2YVIvRXRkZUt5Qk52N0JBZlRSa2pKajdDcXBGS3JuVW8x?=
 =?utf-8?B?eVhBaVhjRkJjQXcwMEFNcGJYWWhmS3kveDBrd1A1UVhiZ1ZLZXZ3TE1aY3Rs?=
 =?utf-8?B?ak42RUZuM0tHdVF3SlN2QlpsQmZuK2c0MzhiQWRBUE9QRWZvM3VJbWM5eE1s?=
 =?utf-8?B?bEpQUW44bnVZZ0dTWnFBTk1TSFcyaTVaUmtWbWFJK1VNNjFuMEswc3JadWJr?=
 =?utf-8?B?TVY0MzdRZDUyaUM2MnF1M0FkdDNtRXpob2lRQnhVSHcxY3hCcUg5SmVpczVu?=
 =?utf-8?B?VXhuZjc2anY0SVBtcGEwYlpUWHdqM2s2S0NKNHNrMEV5Wk4xamVid0ZoMklU?=
 =?utf-8?B?M0N5Z0FXYUlGbzhIL1A3Mk5LcUZLREhKYTJ4NFUweU40YlZRVmtqemhVVjky?=
 =?utf-8?B?emhVSXlvNStjTERZWk9tb2lKbldwVzFiNE1QVVBqU05yTDB5d1k2M0NxSU1S?=
 =?utf-8?B?YUZFakRMcUxhWGFzRExBL29rTHJxSG1GbnRLWGRva3lYRVI3SlpzdytvYms4?=
 =?utf-8?B?MkdhUUFsM2srZ0I2N3hVcS9CWTYzTGlKYTZlVGxnSE5JZTVNcFBKTEdmV2xZ?=
 =?utf-8?B?OWo3cHZBOVFrL1BRaVlxd0VCVERCTlBuREh0SlMyV0FxS0NrSlkzS2FLeG1I?=
 =?utf-8?B?ditoRVFQZ0JGelQvNlkrUi9BcE5RNC9HOFBZczNwSXhoeHVyRXEyS2pqNklO?=
 =?utf-8?B?UFZpN1VYaGZReHpob2xYV0dkWEl3czN6QVFLdFNQSFpDeTZXR1dGQmpzekNY?=
 =?utf-8?B?TjFJSlo3VVQ5UldYSDBFU1kwbDRVM3hwRm9uR3RGaStWdFB3TlVYVDlxeHBy?=
 =?utf-8?B?ODJpazBieC9iY1ZaRmNjeWlIZDNqMTFaSndxNUdHbHNMTS9kMnIrYmF0TkVs?=
 =?utf-8?B?UlZ5YWp3ZWE2ZHFCQTJIVGlDLzBNaXpsRURGRENLdVVKTmhWc3Ric1Y2emZP?=
 =?utf-8?B?a0Q5TkgzV21taHAwbW12UmlncWxackVsWHFXbkJOTFIwcTNLSnVzallzUUwv?=
 =?utf-8?Q?ZC56yyG6xGl7lgtbsVNrAWz3Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3a7311-a757-401f-8884-08da9a21326b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 09:27:39.8415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXKNn2nr2k5tKac/+zEYr13EIKiuSIl4ysXkdwXCwOQX9tNFyCuJiQyz/AWVMKJDaLhj/rog6Z8M0NH31opdhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7227

On 16.09.2022 23:35, Boris Ostrovsky wrote:
> 
> On 9/16/22 8:52 AM, Jan Beulich wrote:
>> On 15.09.2022 16:01, Tamas K Lengyel wrote:
>>> While experimenting with the vPMU subsystem an ASSERT failure was
>>> observed in vmx_find_msr because the vcpu_runnable state was true.
>>>
>>> The root cause of the bug appears to be the fact that the vPMU subsystem
>>> doesn't save its state on context_switch. The vpmu_load function will attempt
>>> to gather the PMU state if its still loaded two different ways:
>>>      1. if the current pcpu is not where the vcpu ran before doing a remote save
>>>      2. if the current pcpu had another vcpu active before doing a local save
>>>
>>> However, in case the prev vcpu is being rescheduled on another pcpu its state
>>> has already changed and vcpu_runnable is returning true, thus #2 will trip the
>>> ASSERT. The only way to avoid this race condition is to make sure the
>>> prev vcpu is paused while being checked and its context saved. Once the prev
>>> vcpu is resumed and does #1 it will find its state already saved.
>> While I consider this explanation plausible, I'm worried:
>>
>>> --- a/xen/arch/x86/cpu/vpmu.c
>>> +++ b/xen/arch/x86/cpu/vpmu.c
>>> @@ -419,8 +419,10 @@ int vpmu_load(struct vcpu *v, bool_t from_guest)
>>>           vpmu = vcpu_vpmu(prev);
>>>   
>>>           /* Someone ran here before us */
>>> +        vcpu_pause(prev);
>>>           vpmu_save_force(prev);
>>>           vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
>>> +        vcpu_unpause(prev);
>>>   
>>>           vpmu = vcpu_vpmu(v);
>>>       }
>> We're running with IRQs off here, yet vcpu_pause() waits for the vcpu
>> to actually be de-scheduled. Even with IRQs on this is already a
>> relatively heavy operation (also including its impact on the remote
>> side). Additionally the function is called from context_switch(), and
>> I'm unsure of the usability of vcpu_pause() on such a path. In
>> particular: Is there a risk of two CPUs doing this mutually to one
>> another? If so, is deadlocking excluded?
>>
>> Hence at the very least I think the description wants extending, to
>> discuss the safety of the change.
>>
>> Boris - any chance you could comment here? Iirc that's code you did
>> introduce.
> 
> 
> Is the assertion in vmx_find_msr() really needs to be for runnable vcpu or can it be a check on whether vcpu is actually running (e.g. RUNSTATE_running)?

You cannot safely check for "running", as "runnable" may transition
to/from "running" behind your back.

Jan

> I think call chain vpmu_load()->..->*_vpmu_save()->...->vmx_find_msr() is the only one where we are doing it for non-current vcpu. If we can guarantee that run state is set after vpmu_load() call (maybe it is already, I haven't checked) then testing the state may avoid the assertion.
> 
> 
> -boris
> 


