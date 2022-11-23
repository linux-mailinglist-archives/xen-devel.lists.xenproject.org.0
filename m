Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B9A63556A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 10:19:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447459.703688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxltj-00069U-0s; Wed, 23 Nov 2022 09:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447459.703688; Wed, 23 Nov 2022 09:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxlti-00066U-UI; Wed, 23 Nov 2022 09:18:26 +0000
Received: by outflank-mailman (input) for mailman id 447459;
 Wed, 23 Nov 2022 09:18:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BfOp=3X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oxlth-00066O-8I
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 09:18:25 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c786532b-6b0f-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 10:18:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8993.eurprd04.prod.outlook.com (2603:10a6:20b:42c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Wed, 23 Nov
 2022 09:18:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 09:18:21 +0000
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
X-Inumbo-ID: c786532b-6b0f-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8Eglrj+hhVW1vqs8SvlxDrV7FlzzrsGCiQD97ULpRFTlExnLKB6ayElCH1nyyPg6HyohNRCGvELgatUKQZTjaepYTjoM1FJwSM8FpzSbjftZNAHglHstMqlEm1yEirfvjGHg28GLmIG3SD67RT/Bf351gbSUW1tLTJ9QT6Pt4uIYC7lCEpfZ8kbUxMoomVeb8RfcWS7MqZXAoH8+TZx4N+XtLOfI4upGbqBRK2JsrRzWBnFgoFS3C5EIHWZF/GCz8VQPmbXAIKEdslNtDYgjEUs8LP9yBBnyQQDpsbEmK2jxP1wG2+ePHnqVPO+gqRn+w/0Bvtlu2/ew8MAqHAPFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJGCgj/XYyZeBK7y0xZEQz/TMcDfe99jO4xKpvvGKUI=;
 b=cTpWS4jU6EwImNESDwziA0KZ+b2lFDPlmIycY3Jn+TOB6YoU7z/lSF0/SivDrdob5+leCDQO0jNVQKTlb3ZkPFRElljr23DfjGMAoQIw8i/uHbv649IWcTpq11/jgBqye5VIFZmVX/gBn7ZCPAOIocIlkWuX0BwYGIHRSYXw/LrrsTcXOYQluKOG3pvkMWCxbkWDcSMi9xhOpEmgHfAGajd03spmbPysmfcJRFeJdd6SuZO+mUsVgAW+mLXXD9wQ4ln3xiviV43jLydyhVflMz3c9SYYQvO8AJ27G6GdzgGjxyiqu4vtG4H5pJ/NpSL68bvDmbBLJ7Kuu8PsLaJsvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJGCgj/XYyZeBK7y0xZEQz/TMcDfe99jO4xKpvvGKUI=;
 b=MI8oOKL7Ki6RhwvawucZo/H1Pk+7GUSBzGfX2byK/yr6InZPaIO7kmbtMCF5SDVfCdawIiJo+PzBDhmq3zHe5LhJ7AmoL75xt3LJdji7hyEZQ3r9elxdwsWQsn4bBKq7UGQzk6zIAB1XSC/JGOZeJbohR96oaDT5+8W3dgtIh7wm5vMK19ttHqYzbOlC+nZffr92+KSz1N/OB/7N3zA8Tr3YrIKJfxxV5OvYen6T7Za9QLx6WW9ev5N2sqq5HBGX9UAapWffVpEFnREbyzA1e7G8V2raMHOoV7roi7qnWz7NuXkkgGZ97Wz8IM/jER44w4K2AEtfGYsEtK3t1Z7Kqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7491ca33-291f-1dfe-6826-2a210a1d08ae@suse.com>
Date: Wed, 23 Nov 2022 10:18:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: EFI's -mapbs option may cause Linux to panic()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <60663f81-09cd-e46b-bb94-1afe50519086@suse.com>
 <Y3uryky3urmQlIjs@Air-de-Roger>
 <296f95d8-5506-c95d-1c14-915cbf3e4f30@suse.com>
 <Y3yanWFrRpPg4bKW@Air-de-Roger>
 <a7af879c-0e58-d12b-287d-22ae7b9d9e2e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a7af879c-0e58-d12b-287d-22ae7b9d9e2e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8993:EE_
X-MS-Office365-Filtering-Correlation-Id: a40f33e6-b94e-47d8-4207-08dacd33aaa3
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3wUSsg4RINZsnpCxFLnEj2Q7++TlYXvCOz82yt6ZZGN9G9Cc2+dipeM9O+8wbZifKLylLvld/kmJguUgC8x3P7KgI7lIp/1YT0pDghiRDqbV/a0PLjZXej+YxUR6gAsGe9Nq45U9+TxdExI6fXMBo7oNQo2YCubcvHzBb7/keDo5+AmF3Osysrb97PeZqJuhozP9hIAQ9J49Y2uyCg+ltZqlQqB8taG2IhrPMr6tHenO4n5eNBHE5u6S2u63G2TO0dPJj0B6ckafdIs/kfJXAim8K27Ef8a/tpwVwNqocgcNXUcwH44OMxY78KUr3st3baDLx85NblSO9zeunSW3tCrG4wH0fHjUdHd8p3j3b24S2w/aXo/1mCGmByy12MBKQ75qbovy7MvgRcgp75MsRRMBhj40ICyJXlBM1QCt1IptiTTN+2KDSLy5yMDxpRKqd1qXJY/Qm3YfAiCLuU8GUQ21kWV4L29XFpTJI6FSMEENvUtLSAbVMLM4/PQRabUXx4wQ2rR6hh+UvqfutQ066prqgCK/yGb6vTQTkEpDh2U0zwot4swPwIYBstvtV4//85KqGb2dJyD6R3IJNqY27DjAAh46uS/wIEszLCQDa1MmWiTWcksRELFKkPxGa1lL6+YHDTivMQIKuPEEIRUxb0a4mzLSfGDJi9YJB0l0iBSKYcWVpWP+dcZzS7gxOcm05VOH/ZV6H85QlW6KdNJoy1GxtMK0mWHwCV74ZgkbbwU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199015)(8936002)(186003)(53546011)(5660300002)(36756003)(41300700001)(6506007)(478600001)(66556008)(6486002)(6862004)(26005)(2906002)(6512007)(38100700002)(2616005)(31696002)(86362001)(83380400001)(66476007)(66946007)(37006003)(316002)(31686004)(54906003)(6636002)(8676002)(66899015)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFMwNVB1K1NUZzhFWVhVZGt0MnVJQ0ZVck0vUmRZV3J6YjFvYnZzU2ZtTjJX?=
 =?utf-8?B?S2dZU2huNWFHdlgvQ080MlVDLzEyYUsyY2tHdDdjYThianh1OEpnejBwS0cv?=
 =?utf-8?B?Mm9hK3c3VzlwN3NXcTI4UFY0dEZZSUlDOWxxM1hLem05dWsxaVFESGVoamxS?=
 =?utf-8?B?VGZGU0FURDgwN3VJZ3lMSWdJZWtTME5uQldOaHNVdCtZNXJIOTl5cnhaL3Y4?=
 =?utf-8?B?bkxLNmg2QlZkbmFmZHFrSGdhRnFSVHFwMlp5anBxZG82MFhmQ3R5L29MZkhm?=
 =?utf-8?B?aGFEaVp5OVRGK2dFTmhKcUJ3VmgvMXl6bWtBUHFuVWw4R2JzZUZaV0xsUmll?=
 =?utf-8?B?eEs5ZVZSeTdMQXdzZko2eVZ5bGI2OGtzR0daczExN0pKdUhFTnhLUGMwRFJK?=
 =?utf-8?B?Ty84Rld4eUxCS0MzSmNmYUVtbjh0VEorT0toY0VjQVc2M0diOXZPVlRkamJJ?=
 =?utf-8?B?UWcxWURjYXFlQXdGcnRpcnhGdXVYa2x3S1BiVHh6ME9vSkF4MXZnMjUrUGlB?=
 =?utf-8?B?S1BjSU44dzlrb20vbnI4U2lweXJHYnZqQVU5a1k0bHRKQlR3TzdHSTJpMkxJ?=
 =?utf-8?B?SUUzR0hwME9kMTd0OTMzQVhOcklSOU5GZXlyNFU5ZDFpNFJPSDVGUFNNa1da?=
 =?utf-8?B?bVk0L0FmWFUzMkdtVlhkbUtHc1pKYnJRNG5VK3Vya1p0ak9qOElqWUo2NnY1?=
 =?utf-8?B?WHlOY0NYZWRjMUhMR2IvOG1GT3daMEQzZkFCR1Jkak1HNDFycndNM3lLM1ZN?=
 =?utf-8?B?SWFoZlBFek1GdS9VZ09RZnp2Wm1tQ0luaHNmZE9sNjlScXREcENON0tKaVNG?=
 =?utf-8?B?d2djejFOWlZwTmlXdkczVlVNbCtwV2w1YXQvZlJRU0tPOHNXZzRYMjZPV1RL?=
 =?utf-8?B?ZzMzRXU0RFJ0b1NIOVkrQnFOSlpJaW13SGVaZ0poSEx1NE5hWnV4bWxINEVG?=
 =?utf-8?B?dVo3bXZrVThORkVXc29vOXNEMGd0TnI1UkNEYTNHMUtzUFlyV2k1TXhqK3U4?=
 =?utf-8?B?MUFMUTM5MXBUa3l3V1ZsRWZFWEFEdDd3cS9TUmNRWndKQTN2aHdzTEZHRy85?=
 =?utf-8?B?a3pBK1YwbjdXc05ZSDllU1BwRisrZFhZL0ZUeVpyNDJvTnlpMk83R3EyS2lC?=
 =?utf-8?B?aWNQclZXcUZHNk92VzVJWWlQak9RSEVGc0Z1LzFMc00zTXFrT3R2UFAwSHZN?=
 =?utf-8?B?Ym1LYlpyclltMjdJdFVibHJBUXVoa1BnRDUzVmdHazFBQ1VpQytiVnFOdFZV?=
 =?utf-8?B?RG5iTWIyTlJuZk5RY1RHdnUxWlc0NisyT2Q4Wnk0alBacUlCbGV1Q1ZFb1pT?=
 =?utf-8?B?NGlEQm1qVW4vMlY4RXI0K2orV2k5R2VVamV5M0VWNFV2VEsxaFJLblFIVnE5?=
 =?utf-8?B?SGdEdS9wbVlWSjNNL2hpU0JLYlozbysyck15QUdvdURuK1dxMWVZeHVQSWxw?=
 =?utf-8?B?eTJZQ0Z3RzVCdk1RMnk4ckU2UkNKUjZFeU1UcHNoYzZRd0tLZC9ncnVXZFlG?=
 =?utf-8?B?MGJUeGhTUWhHa3k1WUdsZkxodlp1dVI0L2JpTThyS1RqcFNrRngrVGJvQmx1?=
 =?utf-8?B?ZGw1WFBBNzBkOTRJWW5WQTZJNlk2d054clprV3d2TDUvamp0T2lYN00rS1Fa?=
 =?utf-8?B?ZC82VVlLN2ZnQVJlYjZ6a0RHOTI1ZjNOTTN5eUdhQmVvWTFYdGU1OGdWbm8v?=
 =?utf-8?B?QUtDbHZSNmNLUGYvcmZWY0s5TmhTWFUvWGtLY3lqTFJCeTR1clF1ZCtGYUdZ?=
 =?utf-8?B?aWJiTUhqVnB1c0hGY0FwUzdZaTIwZ1VjYVo0eUpML0t4Qkx3dnFjanVFYWFK?=
 =?utf-8?B?YzJhc1pITS9PZXBjNTZXazQwNE9TYVRhV1VEVXY3bzlWNzhCT3puczhpb29h?=
 =?utf-8?B?ZGNjZ21IdmVaL2dkdTNjamJZVkRVYVR2ZlgxUkhQMGhCTHIwK3NhY3VGSmc0?=
 =?utf-8?B?aXVUL3FsWXNpKzZsaTl0YnVPdUVocXlmb1IxNkhscms4amgzaU5KRFJCbjVo?=
 =?utf-8?B?cEJmY3QvWXJtYUZtZVlXK1pJMm9DZHBJVzhhRGFKblMvWGhmUWJMb0J3YVpL?=
 =?utf-8?B?cHltd2tlT0Jzc1l6VmlvdTR1eFVwbUNZNXV5aWpZWEF2aG9idXJsblo4bGxD?=
 =?utf-8?Q?DKL5GPhGdyPJTd+FUWkYIieKW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a40f33e6-b94e-47d8-4207-08dacd33aaa3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 09:18:21.7448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUdV/sBb/a3Q75qX6nnNcIRDIVIOgt5BbylAgLSnfZYrtbfg5e66UXvrOUDkVq1ugpXTsJY0yObkDdTxd92ivQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8993

On 23.11.2022 08:39, Juergen Gross wrote:
> On 22.11.22 10:47, Roger Pau Monné wrote:
>> On Mon, Nov 21, 2022 at 06:01:00PM +0100, Jan Beulich wrote:
>>> On 21.11.2022 17:48, Roger Pau Monné wrote:
>>>> On Mon, Nov 21, 2022 at 05:27:16PM +0100, Jan Beulich wrote:
>>>>> Hello,
>>>>>
>>>>> on a system with these first two EFI memory map entries
>>>>>
>>>>> (XEN)  0000000000000-000000009dfff type=4 attr=000000000000000f
>>>>> (XEN)  000000009e000-000000009ffff type=2 attr=000000000000000f
>>>>>
>>>>> i.e. except for 2 pages all space below 1M being BootServicesData, the
>>>>> -mapbs option has the effect of marking reserved all that space. Then
>>>>> Linux fails trying to allocate its lowmem trampoline (which really it
>>>>> shouldn't need when running in PV mode), ultimately leading to
>>>>>
>>>>> 		panic("Real mode trampoline was not allocated");
>>>>>
>>>>> in their init_real_mode().
>>>>>
>>>>> While for PV I think it is clear that the easiest is to avoid
>>>>> trampoline setup in the first place, iirc PVH Dom0 also tries to
>>>>> mirror the host memory map to its own address space. Does PVH Linux
>>>>> require a lowmem trampoline?
>>>>
>>>> Yes, it does AFAIK.  I guess those two pages won't be enough for
>>>> Linux boot trampoline requirements then.
>>>>
>>>> I assume native Linux is fine with this memory map because it reclaims
>>>> the EfiBootServicesData region and that's enough.
>>>
>>> That's my understanding as well.
>>>
>>>>> While the two pages here are just enough for Xen's trampoline, I still
>>>>> wonder whether we want to adjust -mapbs behavior. Since whatever we
>>>>> might do leaves a risk of conflicting with true firmware (mis)use of
>>>>> that space, the best I can think of right now would be another option
>>>>> altering behavior (or providing altered behavior). Yet such an option
>>>>> would likely need to be more fine-grained then than covering all of
>>>>> the low Mb in one go. Which feels like both going too far and making
>>>>> it awkward for people to figure out what value(s) to use ...
>>>>>
>>>>> Thoughts anyone?
>>>>
>>>> I'm unsure what to recommend.  The mapbs option is a workaround for
>>>> broken firmware, and it's not enabled by default, so we might be lucky
>>>> and never find a system with a memory map like you describe that also
>>>> requires mapbs in order to boot.
>>>
>>> Guess how we've learned of the issue: Systems may boot fine without
>>> -mapbs, but they may fail to reboot because of that (in)famous issue of
>>> firmware writers not properly separating boot services code paths from
>>> runtime services ones. And there we're dealing with a system where I
>>> suspect this to be the case, just that - unlike in earlier similar
>>> cases - there's no "clean" crash proving the issue (the system simply
>>> hangs). Hence my request that they use -mapbs to try to figure out.
>>>
>>> And yes, "reboot=acpi" helps there, but they insist on knowing what
>>> component is to blame.
>>
>> Well, if reboot=acpi fixes it then it's quite clear EFI reboot method
>> is to blame?
>>
>> Or they want to know the exact cause that makes EFI reboot fail,
>> because that's quite difficult to figure out from our end.
>>
>> But I'm afraid I don't see any solution to make mapbs work with a PVH
>> dom0 on a system with a memory map like you provided, short of adding
>> some kind of bodge to not map and mark as reserved memory below 1MB
>> (but that kind of defeats the purpose of mapbs).
> 
> What we could do in such a case would be to inhibit suspending the
> system, and to run dom0 with a single cpu only. An error message
> indicating that the system should be booted without mapbs should be
> issued, of course.

That's going to be awkward: Linux can't very well issue a message
suggesting to remove the use of a hypervisor option (behavior of which
is an implementation detail to some degree, and hence the message
could end up being misleading later). Xen also can't very well issue
such a message, since it doesn't know how much of lowmem is going to
be enough for whichever Dom0 OS there's going to be booted. In
principle an OS may get away with less than a single page. Hence Xen
at best could issue a "may not work" message (unless no space at all
was available at some 4k-aligned boundary), and even then it being a
false indication on some (many?) systems may lead to people not paying
attention when they should.

Jan

