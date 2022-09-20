Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD315BE8FD
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 16:31:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409472.652424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaeGu-0003Ey-WB; Tue, 20 Sep 2022 14:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409472.652424; Tue, 20 Sep 2022 14:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaeGu-0003Cj-TO; Tue, 20 Sep 2022 14:30:48 +0000
Received: by outflank-mailman (input) for mailman id 409472;
 Tue, 20 Sep 2022 14:30:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaeGs-0003Cb-MK
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 14:30:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfd6d07f-38f0-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 16:30:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8032.eurprd04.prod.outlook.com (2603:10a6:102:ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 14:30:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 14:30:42 +0000
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
X-Inumbo-ID: cfd6d07f-38f0-11ed-bad8-01ff208a15ba
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxrtoG64rhNzTIKKV6O8lDocGmXcPvSRInrh8zWB6Be+6cj0BDVYpgtm4mdzju0n+H4V4kfnuvzT4FZ1EHo0FSCNlZvkqAliUt96oEhjDWX9YKl0rWZg+hp2ZxmHeYtV6wiFrwLXrI5NawHGBzS8HLzcaD5bPKnie2/X+01z7y373eK0dv6BZenQEV3fWAAaah3ZKMxjHgXs+P5IVOgx2OqWD1q8/oG19LXClbJgtlwiO9rQfHypiuLr9hSpRgXpbqInrOFukT+vusuGxldXfGtGXnfB+TR2QOpvuoc3bECXAWQ3QQpFGC/G12uTX8bmDpPPvyIDiSg+AL05KYeruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUWtHTQMBOfiSK/tDeGOWwDkYur51NulFMNRtcE1OJ4=;
 b=PaCQFiG/SNJYKAqcIp6JOQs1MJP31jTM0bDlpWo3am2tYKb6BCYm1F3VhRuBW3fmJyndJ9gwo5BaNvd7EEbbEairFjQzJ+vCbSpcWWDzmOqIrS1AjKZFJDP0WIeMyvOv4otFDqEF/Zrx+ghNBjq2mSnBGBt/AzetZj5qrpzz2IZ9955ZM0wkWgO9BG8KhtAEPVvV/x6JJSfVbbfyYOk+pgtlMRamGApbr8+fbDYTy2tiD/ISTBgsr+CafebEk4Oet1ff5+OslxSJsU+Sc9ftzReG3jDiaN6ENBvQjBiqSkkyOxxg/wXrAnN1YWOC4hujB8LxUALupBG+ffGpBbDfpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUWtHTQMBOfiSK/tDeGOWwDkYur51NulFMNRtcE1OJ4=;
 b=WU7rjbuJtX63BB67zKZCeUhWYzgrOf1D5ENIf0k4SZLOfmUztHlEe0MuYKgPKwUM3NCBJWZkGK3i1I+XoVOUlO6MgAdOBd2NSAUu4cWoXOQCaNS6v0852OtEhgFjZ1cidYs9ssJb4k9eUx4oeazYGtTmItSP40llf4FH6OdS8f+FjSk6YVOUBxxhKhdNxlCeIAknTUFR3c4kjhxyY7NoslCCI2cwNtttUzTHqKS0LN7seoN/AxnQoUTL5YlKEInk1dGifdO00OD2ANRYds3daoxk/w9XWTBy41kHW/G/eHHlewPjA2kvYMk7FIBDC+bKYhP1IyG9yYaaqzDulnBU8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e813f296-ba1d-7ff0-a84c-97737d7ac7a5@suse.com>
Date: Tue, 20 Sep 2022 16:30:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <george.dunlap@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <20200323000946.GH18599@mail-itl>
 <20200929142730.GA25731@mail-itl>
 <d243c1b5-712d-a958-0b6c-b232eb4edc80@suse.com>
 <20200929151627.GE1482@mail-itl>
 <ea53b845-5edf-a61e-62ae-7ababc30b3e0@suse.com>
 <20210131021526.GB6354@mail-itl> <YWHDIQC3K8J3LD8+@mail-itl>
 <YwJZ3X0HpT9w6Veh@mail-itl> <b1df84d5-a1ca-3019-16a7-36d0bb568779@suse.com>
 <YwNTu1fL7uITg0OZ@mail-itl> <YymUZCfLZRWl6xr5@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YymUZCfLZRWl6xr5@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0253.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: a778e3ba-f531-4299-f20a-08da9b14b292
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yiwSaHVsOAOI9a0+GU4pCP5ctoLbSdNYJqWOwGr7BD6iY1uYXgsGVqDYZwlDaB37xNa6Y+kvXdU7AiCWOcAYV/xTHXSwVhjWVTKyzYW7oJpW42roR/FPxJCeBkNRD2/Cp3OVD626YtGfm2GS3gVIxkh5HjbNpCvh3Rb1cafwB1BPgRgvb3bcM2dcWkQb9D9gN0LDKkmErVz7bmwEHTBXTeztW9XLA24tjYj63NetmNUZd4HLJJMz+Q3FJ2BITOMXKt+4rRORSjLj4TR+n5TanGepa7ag6P6YZZo+ZDF5xDbxae2d7vjnOJOFnxi2voLrKQXMqs9cfOeGb15qnPKM4NF1/Oh8SjN6FX31M3PeltQLgRq84Hj66y/Y7Npw7GMYollnODC/1pr/kTUDyynvxTxQxHExBamCdMxH3xVPZM6sZWtgE3XRhz4OtLqCSPMZwJndGzNZ1vJvpjcVlkXgwFwUst/wqI82PffMHked3XGNJ4p3Yf7LfaHxdHWaYMdHBgaQkWEPdBEkJbV21TN5nQ8l9f/BeTmTFpA+XUmfFrhRCS0J1IYBRw+VlCTi3tajyB+3fUOX4OswW6i6HGwEHernCXEGsESBRUESE8fLLAL1vi9mXRXySIPmInsGOaOUym4LhLc8uCULakcgOpDhf7v/eczhyiz0jZQynZVeL1bD+WrdZTsgeVhK3KJmbvYnql7zuXLfeHWDgknHoWa5zWlfhEwpBH1R4Gd+xrPGgWrbLGOJOIE22kdOf7Gz1c6oMckFfXXt0zfUT0jxlVLAaq3JCkAFBa+edBBRofnUMFPemGQn0XYR4i98VSghhvE4CKl6bieAV3ISGHYPPo/B7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199015)(36756003)(31696002)(86362001)(31686004)(66556008)(110136005)(54906003)(83380400001)(966005)(53546011)(316002)(8676002)(38100700002)(6506007)(478600001)(6486002)(6512007)(26005)(4326008)(66946007)(66476007)(41300700001)(107886003)(2616005)(8936002)(2906002)(186003)(5660300002)(66574015)(15650500001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzhjWGFOZXVhelQyNWpYQ0QyYTlhcWJXL2xpeXRxMmtkWWUwTnBhek1KSC96?=
 =?utf-8?B?MmdadGVCUnMzWGZQeS9sQjFGMGx6ZGY3S1ZNVUdkcG9ROFNPQWF3TDhEaGQ4?=
 =?utf-8?B?a1huTWdFa1duaXR5VDluYzFxNEFCVUV4b21KRXdGUFlybDJOazY5TXRNQTVj?=
 =?utf-8?B?ZjQwK25lMXVqcnN3RlRxYTNUUldrYmc1SzVYaktKRTBLT1h2TnVqKy9vdW1K?=
 =?utf-8?B?TERzYlpVNTlEbHJPcFF5Y0s1c1dQNm1ySDQ1aGFDRUlQajZGN0VBd0doVnl0?=
 =?utf-8?B?QWo2UDBKN0NCUXQyOEpIZlBzeHZGWW1MODJLWXZQYmpzNkJnVWZLU3pmT0lx?=
 =?utf-8?B?REhWY0FPK1hNTEp0SktFSnlTdUV3TXVVT2tCNnpaWUJHb25oazk4SkFncnU2?=
 =?utf-8?B?d2tnNHRMUzNrb3g3U2pPblE2dGgwL3BBSS9UWWZnVEsvSGszQitleG9mcTh4?=
 =?utf-8?B?ai9BQ003RmpWdE5GZU5yL2VzRnJacllZakZqOUtkeWFwL3ZIVXV1eVFvSWw4?=
 =?utf-8?B?RHJ5RzFxLzhMRitkVlhSTTRRejhBejl6K1BXQ0dpNy8rYmEzZXpRaVgwR0hL?=
 =?utf-8?B?N24vdkFsMmhwNjRyM1JYbHVWVjF6dE1QQms0TDJoYXRiWUFGQytSNGtpaW01?=
 =?utf-8?B?am9sRG0rcG1FVGJEQTU2WkxLb3pkcFNwc3kxTHpYUHhwclowV3l3V2l5aXJi?=
 =?utf-8?B?dGFoZnNHU1FMZHRFRmdsUjVpc25wckpvSC9FaHYwUWdTcVpicS9HeXN0Qm5Y?=
 =?utf-8?B?ZEM4b3owZjd5OER5UWFDWmFnQ1VwZmdObjlWNkVqS2loc1R2b1ZTeW5aT3JU?=
 =?utf-8?B?bnBzditJS3VUaTZJc2RRTXo5YnI0OW1GL1AwY3ZRWHVLbmNLQ1VLZWFxODFG?=
 =?utf-8?B?MmQzNit3eENLT0VmYWhKMWhXb244bzRxZHVYZHpVMmNRdklIMmNhTUhGUU8x?=
 =?utf-8?B?Q3hUdW9FcDZHczdqem9kc1o3N2JhVHQvZDl0MWhZQzc4VkZ4clA3UzFCWXFo?=
 =?utf-8?B?MnU0UlY3S2VXeTQ2SGpwa2lmRW42RHY3cVVmTWxsN3hRS0NjV3FUZmczbWJa?=
 =?utf-8?B?NFlRcXUwYWZFNWdQcW1wcFRlT2JseGlsTURnM09yMU1weTRhMnJhaWNaNml1?=
 =?utf-8?B?RkljZVVYRG4reFcydDhSV2xLaFBlOFBIQ3pza0l6bU1qL3IvaC9DNk0xN01S?=
 =?utf-8?B?MEZNeUN1SlpOUjVPZlA2OVRQNjlleVYyTTJsUERBc0FmRWRxa1BPeGhVZXFG?=
 =?utf-8?B?Q25nU21HK3RMSmQ0RlNxUG1CNGY5YWdkMjN2YzFDQVVNUXNLNi9udkhZa0J5?=
 =?utf-8?B?czZwdllWN0tBalpOZWhzL3NtU01xWHk4MUNyRUVGUGp2ZEprZDVMbnVIdVR5?=
 =?utf-8?B?Y3AvZlJGdlA5cnEwYzZqdzZQTnBBeU12SXhOZUl3bmxhN1dTVC9qYlVHdWhF?=
 =?utf-8?B?aTB5eGMzcTRob1Q5SDl2NXhBYkhJRjU4VEhKTExSQlVXWGNwL0RMS2lGWUh4?=
 =?utf-8?B?MHFZc3RkQUNJQmw4ejlJcFFVSlM4a3krSnVMbVg2S2ord0dNZURzRTk1U1Vo?=
 =?utf-8?B?VUpyampNRVpXWWxaaEliNG5oNzJ0WlZ2ZTJ5TWd3ZU9LQUhvZDBESzZHMTlm?=
 =?utf-8?B?M2pEWUdIc1pBSTVvbXR4ZzJ3WWx0YUFTemZaVXk2a0NPZUR2YW02QmlseWhF?=
 =?utf-8?B?WkQwRnVIbHphSUtUZVBHZ3I2WXdUUzlEekxSS1h6OFZJbGtPSmRJa3V6ejZw?=
 =?utf-8?B?c2FzOVR5S0ZjaHFXMUlnMG5Kc3d4VnZrR1V6QUNkWDBDaVc0c0Y3MWx1dldR?=
 =?utf-8?B?Q2tkaXJGd3hDMlFTZW1uOUNJNStyM1V4bytSY3JqVmRVK3hzdWhBZmxMUVcx?=
 =?utf-8?B?Zm92dmltbGFiQ251NkdET1BMMHdPVElIK0s2WDd3MHJCUEJqT09BMnhnZElq?=
 =?utf-8?B?b0h4cGRwYmhqUDhVTzVINVRRVnNQVXV1ajZXUXc2RldXMnV4MWpReHB4d1VG?=
 =?utf-8?B?ZUk4d2doekh2S3BNVGJtVVBjTXJiNFpaZFhNcjdreGh4b2swYWR2Y2NYai9O?=
 =?utf-8?B?aVE5cnV5dTkzWmVFNjk1dlZnV1F6U0UrdFF1T3I3TmlQdFBobWthUGJvNnRE?=
 =?utf-8?Q?bM7Z0tpHet+hJcMVBOOquxwMt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a778e3ba-f531-4299-f20a-08da9b14b292
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 14:30:42.5691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6L8YOsU/V25eH5qWDPLcECeE1iBHFp14bwMJSCihJIyLxaNqb2s2g3jduCqYrVS+vyXzuTx02AkdYcOGQ2lPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8032

On 20.09.2022 12:22, Marek Marczykowski-Górecki wrote:
> On Mon, Aug 22, 2022 at 12:00:27PM +0200, Marek Marczykowski-Górecki wrote:
>> On Mon, Aug 22, 2022 at 11:53:50AM +0200, Jan Beulich wrote:
>>> On 21.08.2022 18:14, Marek Marczykowski-Górecki wrote:
>>>> On Sat, Oct 09, 2021 at 06:28:17PM +0200, Marek Marczykowski-Górecki wrote:
>>>>> On Sun, Jan 31, 2021 at 03:15:30AM +0100, Marek Marczykowski-Górecki wrote:
>>>>>> I'm resurrecting this thread as it was recently mentioned elsewhere. I
>>>>>> can still reproduce the issue on the recent staging branch (9dc687f155).
>>>>>>
>>>>>> It fails after the first resume (not always, but frequent enough to
>>>>>> debug it). At least one guest needs to be running - with just (PV) dom0
>>>>>> the crash doesn't happen (at least for the ~8 times in a row I tried).
>>>>>> If the first resume works, the second (almost?) always will fail but
>>>>>> with a different symptoms - dom0 kernel lockups (at least some of its
>>>>>> vcpus). I haven't debugged this one yet at all.
>>>>>>
>>>>>> Any help will be appreciated, I can apply some debug patches, change
>>>>>> configuration etc.
>>>>>
>>>>> This still happens on 4.14.3. Maybe it is related to freeing percpu
>>>>> areas, as it caused other issues with suspend too? Just a thought...
>>>>
>>>> I have reproduced this on current staging(*). And I can reproduce it
>>>> reliably. And also, I got (I believe) closely related crash with credit1
>>>> scheduler.
>>>>
>>>> (*) It isn't plain staging, it's one with my xhci console patches on
>>>> top, including attempt to make it survive S3. I believe the only
>>>> relevant part there is sticking set_timer() into console resume path (or
>>>> just having a timer with rather short delay registered). The actual tree
>>>> at https://github.com/marmarek/xen/tree/master-xue2-debug, including
>>>> quite a lot of debug prints and debug hacks.
>>>>
>>>> Specific crash with credit2:
>>
>> (XEN) Assertion 'c2rqd(sched_unit_master(unit)) == svc->rqd' failed at common/sched/credit2.c:2274
>> (XEN) ----[ Xen-4.17-unstable  x86_64  debug=y  Tainted:   C    ]----
>> (XEN) CPU:    10
>> (XEN) RIP:    e008:[<ffff82d040247a4d>] credit2.c#csched2_unit_wake+0x152/0x154
>> (XEN) RFLAGS: 0000000000010083   CONTEXT: hypervisor (d0v0)
>> (XEN) rax: ffff830251778230   rbx: ffff830251768cb0   rcx: 00000032111d6000
>> (XEN) rdx: ffff8302515c1eb0   rsi: 0000000000000006   rdi: ffff830251769000
>> (XEN) rbp: ffff8302515cfd90   rsp: ffff8302515cfd70   r8:  ffff830251769000
>> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
>> (XEN) r12: ffff830251768dd0   r13: ffff8302515c1d00   r14: 0000000000000006
>> (XEN) r15: ffff82d0405ddb40   cr0: 0000000080050033   cr4: 0000000000372660
>> (XEN) cr3: 000000022f2a1000   cr2: ffff8881012738e0
>> (XEN) fsb: 0000744bf6a0db80   gsb: ffff888255600000   gss: 0000000000000000
>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
>> (XEN) Xen code around <ffff82d040247a4d> (credit2.c#csched2_unit_wake+0x152/0x154):
>> (XEN)  df e8 6f bf ff ff eb ad <0f> 0b f3 0f 1e fa 55 48 89 e5 41 57 41 56 41 55
>> (XEN) Xen stack trace from rsp=ffff8302515cfd70:
>> (XEN)    ffff83025174b000 ffff830251768cb0 ffff830251778270 ffff82d0405c4298
>> (XEN)    ffff8302515cfdd8 ffff82d04024fcb8 0000000000000202 ffff830251778270
>> (XEN)    ffff83025174b000 0000000000000001 ffff830251769018 0000000000000000
>> (XEN)    0000000000000000 ffff8302515cfe48 ffff82d04020a8c9 ffff8882556aedc0
>> (XEN)    0000000000000003 00001910537e623e 0000000b988f78a6 0000000059d4a716
>> (XEN)    00001901f30fa41e 0000000217f96af6 0000000000000000 ffff83025174b000
>> (XEN)    ffff830251756000 0000000000000002 0000000000000001 ffff8302515cfe70
>> (XEN)    ffff82d0402f7968 ffff830251756000 ffff8302515cfef8 0000000000000018
>> (XEN)    ffff8302515cfee8 ffff82d0402ec6de 0000000000000000 ffffffff82f157e0
>> (XEN)    0000000000000000 0000000000000000 ffff8302515cfef8 0000000000000000
>> (XEN)    0000000000000000 ffff8302515cffff ffff830251756000 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 00007cfdaea300e7
>> (XEN)    ffff82d0402012bd 0000000000000000 ffffffff82c51120 ffff88810036cf00
>> (XEN)    0000000000000002 000000000001e120 0000000000000002 0000000000000246
>> (XEN)    ffffffff82f157e0 0000000000000001 0000000000000000 0000000000000018
>> (XEN)    ffffffff81e4a30a 0000000000000000 0000000000000002 0000000000000001
>> (XEN)    0000010000000000 ffffffff81e4a30a 000000000000e033 0000000000000246
>> (XEN)    ffffc9004aef7c18 000000000000e02b fb5ee398d214b10c eb5ef398c214a10c
>> (XEN)    eb56f390c21ca104 ebd6f310c29ca184 0000e0100000000a ffff830251756000
>> (XEN)    0000003211016000 0000000000372660 0000000000000000 80000002963e1002
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d040247a4d>] R credit2.c#csched2_unit_wake+0x152/0x154
>> (XEN)    [<ffff82d04024fcb8>] F vcpu_wake+0xfd/0x267
>> (XEN)    [<ffff82d04020a8c9>] F common_vcpu_op+0x178/0x5d1
>> (XEN)    [<ffff82d0402f7968>] F do_vcpu_op+0x69/0x226
>> (XEN)    [<ffff82d0402ec6de>] F pv_hypercall+0x575/0x657
>> (XEN)    [<ffff82d0402012bd>] F lstar_enter+0x13d/0x150
>> (XEN)
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 10:
>> (XEN) Assertion 'c2rqd(sched_unit_master(unit)) == svc->rqd' failed at common/sched/credit2.c:2274
>> (XEN) ****************************************
> 
> Ok, I think I figured it out!
> 
> I added a function that verifies run queues of all the sched units, and
> called it basically every other line on the resume path. The debug
> function (if anybody is interested):
> 
>     void verify_sched_units(void)
>     {   
>         struct domain *d;
>         const struct sched_unit *unit;
>         
>         for_each_domain ( d )
>         {
>             for_each_sched_unit ( d, unit )
>             {
>                 if ( c2rqd(sched_unit_master(unit)) != csched2_unit(unit)->rqd )
>                 {
>                     printk(XENLOG_WARNING "d%d sched unit %d: rq=%d, unit master %d, rq=%d\n",
>                             d->domain_id, unit->unit_id,
>                             csched2_unit(unit)->rqd ? csched2_unit(unit)->rqd->id : -1,
>                             sched_unit_master(unit),
>                             c2rqd(sched_unit_master(unit))->id);
>                     WARN_ON(1);
>                 }
>             }
>         }
>     }
> 
> It appears that restore_vcpu_affinity() is responsible, specifically
> this part:
> 
> 1216         /*
> 1217          * Re-assign the initial processor as after resume we have no
> 1218          * guarantee the old processor has come back to life again.
> 1219          *
> 1220          * Therefore, here, before actually unpausing the domains, we should
> 1221          * set v->processor of each of their vCPUs to something that will
> 1222          * make sense for the scheduler of the cpupool in which they are in.
> 1223          */
> ...
> 1249         res = get_sched_res(cpumask_any(cpumask_scratch_cpu(cpu)));
> 1250         sched_set_res(unit, res);
> 1251 
> 1252         spin_unlock_irq(lock);
> 1253 
> 1254         /* v->processor might have changed, so reacquire the lock. */
> 1255         lock = unit_schedule_lock_irq(unit);
> 1256         res = sched_pick_resource(unit_scheduler(unit), unit);
> 1257         sched_set_res(unit, res);
> 1258         spin_unlock_irq(lock);
> 1259 
> 1260         if ( old_cpu != sched_unit_master(unit) )
> 1261             sched_move_irqs(unit);
> 
> It calls sched_set_res() directly, which assigns sched resources, but
> does _not_ adjust runqueues (if new pcpu happen to be assigned to
> another runqueue than the one from previous pcpu).
> 
> I have two (non exclusive) ideas here:
> 1. If old_cpu is actually still available, do not move it at all.
> 2. Use sched_migrate() instead of sched_set_res().
> 
> Here is the patch that fixes it for me:
> ---8<---
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 83455fbde1c8..dcf202d8b307 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1246,19 +1246,29 @@ void restore_vcpu_affinity(struct domain *d)
>              }
>          }
>  
> -        res = get_sched_res(cpumask_any(cpumask_scratch_cpu(cpu)));
> +        /* Prefer old cpu if available. */
> +        if ( cpumask_test_cpu(old_cpu, cpumask_scratch_cpu(cpu)) )
> +            res = get_sched_res(old_cpu);
> +        else
> +            res = get_sched_res(cpumask_any(cpumask_scratch_cpu(cpu)));
>          sched_set_res(unit, res);
>  
>          spin_unlock_irq(lock);
>  
> -        /* v->processor might have changed, so reacquire the lock. */
> -        lock = unit_schedule_lock_irq(unit);
> -        res = sched_pick_resource(unit_scheduler(unit), unit);
> -        sched_set_res(unit, res);
> -        spin_unlock_irq(lock);
> -
> +        /*
> +         * If different cpu was chosen, it was random, let scheduler do proper
> +         * decision.
> +         */
>          if ( old_cpu != sched_unit_master(unit) )
> +        {
> +            /* v->processor might have changed, so reacquire the lock. */
> +            lock = unit_schedule_lock_irq(unit);
> +            res = sched_pick_resource(unit_scheduler(unit), unit);
> +            sched_migrate(unit_scheduler(unit), unit, res->master_cpu);
> +            spin_unlock_irq(lock);
> +
>              sched_move_irqs(unit);
> +        }
>      }
>  
>      rcu_read_unlock(&sched_res_rculock);
> ---8<---
> 
> I have several doubts here:
> 
> 1. If old_cpu is available, is sched_set_res() needed at all?
> 2. Should both calls be changed to sched_migrate()? Currently I changed
>    only the second one, in case scheduler could be confused about
>    old_cpu not being available anymore.
> 3. Are there any extra locking requirements for sched_migrate() at this
>    stage? The long comment above sched_unit_migrate_start() suggests
>    there might be, but I'm not sure if that's really the case during
>    resume.
> 4. Related to the above - should thaw_domains() be modified to call
>    restore_vcpu_affinity() for all domains first, and unpause only
>    later? That could reduce locking requirements, I guess.

All questions primarily to the scheduler maintainers - forwarding
accordingly.

Jan

