Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBC356740F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 18:20:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361477.591031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8lH9-0004qP-77; Tue, 05 Jul 2022 16:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361477.591031; Tue, 05 Jul 2022 16:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8lH9-0004oE-3t; Tue, 05 Jul 2022 16:19:47 +0000
Received: by outflank-mailman (input) for mailman id 361477;
 Tue, 05 Jul 2022 16:19:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8lH7-0004o6-4g
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 16:19:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 475cfcf9-fc7e-11ec-924f-1f966e50362f;
 Tue, 05 Jul 2022 18:19:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB3321.eurprd04.prod.outlook.com (2603:10a6:7:8b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 16:19:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 16:19:40 +0000
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
X-Inumbo-ID: 475cfcf9-fc7e-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4ZuIUl79vvkVSDjUEZKhsmRTmfCsc3bGAeoy3QDWrDeEFiJq7PO1BGtTwFpa5jrM1zusTk0RHrh4TS1yIfOl+MWb3CpM5NRRp88wHm1pFnV1bpMWQpW8M6jyeVYoTF8NGEQ90g3aBOJnBaTccLVf8IifttW5JpVa/CILUh2TTkYC6Q+UCycxV1iZD+K/fexiGk83oP88APiDJbQWQjK+8VWmuAen01KtcoVdUOSBiRQzoOBmzTe4E2A9onzVQC4TFSk420EeFNqI2n2KkVnrRXV5iedygmFgFQ3GorKZZMy8hT60VS2XDkRWsPDsXUEAMc5C2ClAa1KRd0Nxmntog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzAGOelRAv5ki/nbdjsf/zB4fwKknW20ezHFghZgY8g=;
 b=M2TmKJsYF98KUqavCWE7+z2M0gejEMxbFhPLLaRHqVIJ0vonbMn+kb2GUoGGv1Cx8J5TNkTu95+4WxlbkPamiOFmyzYT7UM9tH93y+hDxeNl1KoIybC1XRbi1W7sPSePtWi4JVHfcafq8l0zq1NKpinIZN7Q/A2g74bOR2MVLP2MCzyMjM3Ig2Uc7YiVEKg+t95NQiqqrmkQ44dw3m8hgLmd0mIiyynFAwVKkcRGYT1yJ7Ydjl3OEzISACN99IhZz4KkHTVuGvS9oJaOnjq6fL4dKr9slugDw/x9GD1EP5K15hHFV3mcfTkP76i1r2FkyY/lNalqFCsinKB3GMQTcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzAGOelRAv5ki/nbdjsf/zB4fwKknW20ezHFghZgY8g=;
 b=Kd770PXo2I4GjKM/09w0poxc8ch+CEg7nKh93o43lh1dBRVBQSuVkxr5vGLFXSVKYI8IRfieP59tY3sZbHJBmyb/WyZ0cjJiI27lh+YDV020is91NyKsm5cWkfI1r3b8DWmPkP2DyAjFO8kwyTtwNX1Q6GAcZJT2Fqk9tXAZ/vQyLZnR8RUQbgfwxfuEzMhu0FLMjok6BovBd/KacdX1AcWgzwbW68LLKBQJMA78VPeY6WEL0VjoEanUCs7cqTSvFICGzWQjHG+RpG28smWKrT9M3loCO0jem4BPqCCKEMTDQgYSRxrPgxp5uBhAJQaizRuCDoULGYJyLacRNYyolQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a5a1efc-e610-e151-fa58-25cfd9177f26@suse.com>
Date: Tue, 5 Jul 2022 18:19:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: =?UTF-8?Q?Ping=c2=b2=3a_=5bPATCH=5d_x86=3a_enable_interrupts_around?=
 =?UTF-8?Q?_dump=5fexecstate=28=29?=
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com>
 <ff12f0df-a2c4-ae9b-b956-a602cc0bb844@srcf.net>
 <f0ca952c-1d44-56ab-6b81-6bba3fe1c016@suse.com>
 <66616751-24a8-7678-774b-35f6da4ad0b3@suse.com>
In-Reply-To: <66616751-24a8-7678-774b-35f6da4ad0b3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0502CA0057.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a108c00a-aa67-4a7d-39a2-08da5ea2299b
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3321:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vTBmpQYcpbj6MYJQyYWpPnbkU3XHJXPoXX7fDflyVmUbv7YTKZOVwn/XnDB4Me+2ojNPE8Ts/0b2Z4ikESHF6jSjGIlm2SmcnXDGj4jkonyomZ5r3fXg7aYvVxppYzkP5qlyjXSsb31Awm+PvWHUpxfhS1G1DVUM+949ARD87nm24fVTHCw3qGrdAZStUayZYTRWD6m1/M5V6KM9iZrjtbP0kqBgnbGnsCJzAMt75tGPpzluaNiFI+8AT9vWG8gRC6Xp4ReV9PHvd+DFYemQDGcmDH5UPnRnSOBntO5nMH0O02yGQ12jhZgfV2RTHq9jWPuqm37mMRZsiTCBUR8D8OsOvhmod3AxkD4X+4v8lihEP1yMKvjcMEMQSW1kzrlPTFZUzg/pwMduHJGPNRjaIrxw30qNmc0nBm8FjhBNHDQEmiuZ24ExUSbz9NoclNJdawmq4a5SLeizGJqoj31teFnZ6rxl+2w5HC5xq5+o15vg0HtIPRZy35DcNeK9ce/a9m7aJxNdOz9YC8SW91rXUrJO1Ov3twHUaH0Nf7CZ2+ABDF2shTNy239X+1a96OLd8M/hPTrDNIDiZFplLSTrf3a9nlsNL52StDEYiw3DIPQtGPmdzOAn7XEi43NPZL0AUUbp4K3m6XiGBH72iLrnDeXZ/Hbh1IXyYKgXeoWYoRVOtlnML9LgwdwvWDdIcFyIMLQ+FmlLvgctp/fmk/FLldIwKGZSlVygRAz+aqb5vxpvHP44wy962Rv+4M/hWnwq1mz1ZQ1VWi0g45YRaWsYXJ4nPJCW/xuYX5RVuu9LJajn4NVija14kpsaDW7nk6kSrw9I7tHYnXmRmqspIJbNI2TcFrAy4wzhsb2yuz4q++0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(136003)(376002)(346002)(39860400002)(26005)(6512007)(66946007)(83380400001)(41300700001)(2906002)(4326008)(66476007)(66556008)(5660300002)(6486002)(8936002)(2616005)(478600001)(186003)(53546011)(31696002)(110136005)(54906003)(36756003)(6506007)(31686004)(316002)(38100700002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c25yVmVrdlRFL0huVkVQbnRiRnBESTJmRjY4b0lIM1N6ZkJQYjJaQlpGSVZm?=
 =?utf-8?B?dEVMZEJiYWFkWFZnL2JDekJESmVCemZyMDhIb0RUZ3g0RlFsVGwrd3BmTit1?=
 =?utf-8?B?MGExMUlKMHlUYy9wMFViWGRtMmxZVTViUDJ1UEV4SmpRcyt1MkRwdG5nNEd4?=
 =?utf-8?B?Y0hlbFlOTzdFRS9ZUjJJMlMzK2VFb1A0T3BTaDdxcGtoMzdldmQ4KzQvcFhn?=
 =?utf-8?B?NEhoV0JvVWlwREFjdGNUWDhSOGJGaE5Wd0pSLzU4NDdvbkVFZTFmQ2gzTG9W?=
 =?utf-8?B?V0xJRHZQaDNna21LZzBLQjBveDM2QmNWbXp1OTFTK1IvdmFVWFg5ZHlvNkJZ?=
 =?utf-8?B?R1g1N0VaOTY1cVIzU2ZQaWZmZ1JuZUJ2bi9FRG9ySVBJQVJDWE05czN1ZEYw?=
 =?utf-8?B?Y1hiUzB2YUFMR2JYblhOU1g3VGpERmlZQjhVOFVtSHNuOHhVL3YwWXdiTzJH?=
 =?utf-8?B?cmxOSU5lTjR4VFdSRU0yTDB2TkhnYmpGT2dNazd1citMdDI0YitSQkZLbG1K?=
 =?utf-8?B?SHBBKy8xVmJtbUc2V2VMR0NVYWNBbDVtbGoxNVB1c2tQZ0lhZTFhQ1FuUlc5?=
 =?utf-8?B?cXVwbk1lQjVqbmg0L0N1Q1kxTWYrOFYyeGpiS1Zlb3ZpbUlIMU1GSmo4TGdo?=
 =?utf-8?B?b3VHc1AwTmZPZThGQmExQU1Xc3czbGM5QzdkWmMzMS8xYUkvK2x6cEw5YnN2?=
 =?utf-8?B?SWFFaUdHckVpclJ5M205YlcwUC82NllVcEJWVkViWkJIK3A1MFZFVUZIWTln?=
 =?utf-8?B?RkdMZG5RekZCcU54MkJMRThTK014eGFKNWk3SmQ0SjRzMmFGZVA3WjZqNDJx?=
 =?utf-8?B?QWlPclVaUnMyVVgyMTFrdXZWWk5SWjNuTFAxUFRUL1M0aGFZT3BXcGw3c0o5?=
 =?utf-8?B?Vzd1Sk02a2xnMjhGL0pMQ1A2bjhKOUZiY3FIMmZGUGhENm5mTUZ0dGkxenJW?=
 =?utf-8?B?cEpIQWxTZ0NkMFB5Vm5ZWEJpdHVYTWQvU2xqem9hRGYzMTdmbGxyV2NwYVlK?=
 =?utf-8?B?TGozSTVvTUNZcU9iNzIyU0ZNL2J4VW5vRjIvZlhBbm1QaHFHdjFwY0NPa1NB?=
 =?utf-8?B?RlZlSktiYnVrMzl2cjR4bzl4MHFRZjFXdm9KZERzQzlPc2ltUWplWEZqR0hT?=
 =?utf-8?B?QmlYSU5GT0d2N2JMQmwyYU12RDB5bEI0Z0lydmtheUd5TnA5R3lwMml3WjhB?=
 =?utf-8?B?ZUpFeFlKa2JLMkhaU2VTTDlkMWRiNUlWM1dzK011LzMrbzlBY29USG4rTHdH?=
 =?utf-8?B?dzMwSXFqemR0eVdjbytDTjhObW9KaTZYR3cvdVNBVGk5OHVnUWlpTWRQVXk1?=
 =?utf-8?B?Smh5RDRxSTlNRHFESzFPRjZQeXl1SDFzMzl0NlVsRElvTXlIS0NvTno0eWRV?=
 =?utf-8?B?Yk84MDNQUGI3VnNFcEgwMUd6dVE4bVhvUjF3UTVvV1hzNGRNT05BMVA5czNO?=
 =?utf-8?B?WWtIakc4eUxBdmNFSnpzTWdpbGZuTFJTaDdaZ0RWczN3azdFQ3YvaXFQbkV0?=
 =?utf-8?B?S1lBL0ZMOEpncVlYOEw4RlVPQkcxRmJpN2FNUGhHcHpWTm9Fc050STlCY1Y1?=
 =?utf-8?B?M2FqbFZRU2JRK2dudWNlaFFtV3owSExZM0tvcmNWanlzSGNocW9MemZhcFNr?=
 =?utf-8?B?cXZFc2lJWEtzRDMvS252cit6dVUreTN5SERVUFViYUlyTE1NYXk0RjdsODhl?=
 =?utf-8?B?SXNtZXRCR0tuZHFsWFNHUGJpKzdjWlRPUE1uTlNTMU5IakIrYlBGKzVMeHhP?=
 =?utf-8?B?WkRQbEdicVJoYmtTSngyMnlqQTlHajkrZUtpejNoZTBjRVllVEJCWVdKVTFB?=
 =?utf-8?B?eHZxaTNwUzdGcGxMbVJxT3VLUGxZUlE0SGZOZjFYUEZHY2x1QjlOYWt0b3Zh?=
 =?utf-8?B?eWRnemUxd3BRc3hzaXROeWJUUzMvRE5JSTdPaDFTdnFrVjZ3MytKaE5qVTZS?=
 =?utf-8?B?cC80eEp3MEpXYm93d1hlU1ZveUNHbnpFZStueW16ZWtHTExHdTcraDhvL0NN?=
 =?utf-8?B?WnNoMmJtRlF3aTVKenlMSlk2RkJZdE9LZyt0VzdRS0p3RE9TT0lpZVQ3NitI?=
 =?utf-8?B?TUZLUDdScnRqek5ZeHIxckFsdENYaUlVd0lIdDJ6dDlGWlBaRXMxd1M2b1Zx?=
 =?utf-8?Q?YePG1sf8lpx/0yTiL4i8N3x7p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a108c00a-aa67-4a7d-39a2-08da5ea2299b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 16:19:40.3660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtpbPGL14HrdnpspuDSQ50pjfn8EX7KlzMAwWLaTyXhAnp+gJN+86D5/wFRVncPXAsZdRmzlKQKYQqfq/P/bTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3321

On 11.01.2022 11:08, Jan Beulich wrote:
> On 16.12.2021 14:33, Jan Beulich wrote:
>> On 16.12.2021 12:54, Andrew Cooper wrote:
>>> On 13/12/2021 15:12, Jan Beulich wrote:
>>>> show_hvm_stack() requires interrupts to be enabled to avoids triggering
>>>> the consistency check in check_lock() for the p2m lock. To do so in
>>>> spurious_interrupt() requires adding reentrancy protection / handling
>>>> there.
>>>>
>>>> Fixes: adb715db698b ("x86/HVM: also dump stacks from show_execution_state()")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> There's a bug here which we need to deal with one way or another.
> May I please ask for a response to the issues pointed out with
> what you said in your earlier reply?

I sincerely hope we won't ship another major version with this
issue unfixed. The only option beyond applying this patch that I'm
aware of is to revert the commit pointed at by Fixes:, which imo
would be a shame (moving us further away from proper PVH support,
including Dom0).

Thanks, Jan

>>>> ---
>>>> The obvious (but imo undesirable) alternative is to suppress the call to
>>>> show_hvm_stack() when interrupts are disabled.
>>>
>>> show_execution_state() need to work in any context including the #DF
>>> handler,
>>
>> Why? There's no show_execution_state() on that path.
>>
>>> and
>>>
>>>     /*
>>>      * Stop interleaving prevention: The necessary P2M lookups
>>>      * involve locking, which has to occur with IRQs enabled.
>>>      */
>>>     console_unlock_recursive_irqrestore(flags);
>>>     
>>>     show_hvm_stack(curr, regs);
>>>
>>> is looking distinctly dodgy...
>>
>> Well, yes, it does. If you have any better idea ...
>>
>>> For these kinds of purposes, it ought to be entirely fine to do a
>>> lockless pagewalk of the p2m, because we have to maintain atomicity of
>>> updates vs the hardware pagewalk anyway.  We do not care about any side
>>> effects if the target isn't a RAM page.
>>>
>>> That ought to remove any IRQ problems from the equation.
>>
>> First - how do you suggest to signal to the page walk logic that there
>> should be no lock acquired? And then I don't think there's a direct
>> relationship here with what we need to guarantee correct hardware page
>> walk behavior. Unless you mean to suggest that here we want to rely on
>> either locking or interrupts being off (the latter guaranteeing that
>> flush IPIs wouldn't complete while we're still doing software walking
>> here).
>>
>> Jan
>>
>>
> 


