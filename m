Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3226FF3B7
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 16:11:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533405.830044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px70X-00075N-7c; Thu, 11 May 2023 14:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533405.830044; Thu, 11 May 2023 14:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px70X-00073b-3V; Thu, 11 May 2023 14:11:01 +0000
Received: by outflank-mailman (input) for mailman id 533405;
 Thu, 11 May 2023 14:10:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px70V-00073T-8j
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 14:10:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a658fa90-f005-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 16:10:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7892.eurprd04.prod.outlook.com (2603:10a6:20b:235::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Thu, 11 May
 2023 14:10:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 14:10:54 +0000
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
X-Inumbo-ID: a658fa90-f005-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhKtI0n8/ZME3zsVh1IjI5eNEIlHR+vUxpwEwP87lxiSqRZib8UuBaCYZTqLkEUzzuxujgSwG3Nfth4EQI7fYgdRP9S1eK4R/uqanJqAU771cVNlZScRE+9LRc3k5sDzBCJGMw6qKRCEDZHGi4Y4gOFAx6u2naQn8W+hmohQ+ZUGoiUYA/eiK6FbY/Oh5LGdApa2/Mi4GGD0omI3ZqnCl+gKHmm2VnbSLI3hJMQoI6gcsTsDCtVx22XL1fWQwp2gP68Ak1OrE2WT+vjyEPvxVKT7Xf1vkikc9m4jHG3TYNISKKjQJ38OEGtlEjTR3FT3ta2DvKiihtLh5pppHc45WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60h4Ji5aH6BWI3I0HTaMMmDfMGn15K/ZLYgwIKV8H2o=;
 b=D1YFlvTFyMtKS0uK+38NuaLrtuOaR83CXYiK1ALcQpYbbIfwmhWurGPo/4lTfynx5WkM94CZJOf3qPAPyGfJeAowSPsnHgRMkecdVoj0TZFLK/0pcLKAwzqVC5ONo4EH7UhOF28ITvHztoYJwoVmEfVk0+lCy5QeUXi2zYexM7xe/NZTG28k7WK55GLLiWd530f0OiCEx2kptur4A1HEIU1OV77Pif9KwqWS4lpVw2jG4EI/19tU/xCyPhljUJ/2Wm9yBIU/7B6pWwM8madC5asCgof8weUUjRgkvdVNKrM+9etvOr8kN0MiXzSjD12i4YtAZlo+aVj6MtFU6EZ8Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60h4Ji5aH6BWI3I0HTaMMmDfMGn15K/ZLYgwIKV8H2o=;
 b=xdcyy0Y9Ohr4WiX31W4TCDfy2WyRrw7JGV/BWW0yDCsnJXD+maZfOELwAYQeIcRK5B0YP6udvcxeFniRUPAfqKcwRTfZTO887oevexoFKSP+NBkvzmHKWPX9Py/Cbn60btwzVObb2UF//7/3cH7DAb9Or9WCrReOvYFdWfE5uoy26BSFp0oSp466oAPCBHE1Ra/Jo4O8kAQGk42TdRJISMIQmr48xJyoC8pvpgJaCfTtNi7JrRZEAAKBf3voAhWc6eBnAgbddUPWK4NJvx8JASBF7ktAiKQknUQvD7p+E3ce65aJEy+W96fcyqedvSGMkW6l0K7e8OiboGBxdB5vRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <559c7f4f-113e-8e58-d4d0-3c0c36f27960@suse.com>
Date: Thu, 11 May 2023 16:10:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 07/14 RESEND] cpufreq: Export HWP parameters to
 userspace
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-8-jandryuk@gmail.com>
 <7db38688-1233-bc16-03f3-7afdc3394054@suse.com>
 <9cf71407-6209-296a-489a-9732b1928246@suse.com>
 <CAKf6xptOf7eSzstzjfbbSU0tMBpNjtPEwt2uNzj=2TucrgFRiA@mail.gmail.com>
 <80ccf9c7-5d22-b368-dac6-01fe6cec7add@suse.com>
 <CAKf6xptLpj_L_G3Qk+KA-yaTcaMHLJLL9soFP9HD6Ro+8Lk7CA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xptLpj_L_G3Qk+KA-yaTcaMHLJLL9soFP9HD6Ro+8Lk7CA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: 088fe856-7f58-471f-a4d8-08db52298878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ptmc2Et4InGtcHMv3cPfXAakV0L7oc/IO4n5d+oGbAt7P5syj9mwG6PXVy+F7zmMbPpPtLfLNsrVGhJZ5Xpj9tk7pKd7Jx+j72Uw8h96zkVHk4B3ATvahv8CEPSPcwn636p/QtvSKemkHazD9jKsqkpbBsx9mzB+HRZF4rgb+sDVfali4O/5IdK92/MSAKegWgDosPTiBqIlZ9P4RIAUiePxU6wCUWmeWq266HL6+2DQkw9jTWkUZrBagOq1TN4JhBLDKtF2D/9XVG7y1fUXfGcnbWM862uGrwt67VBXqbjwAa2253nffqOqzP5y2sqok82nQoFLPkGNVl38fmcBGpYjoGN+7udMncRvS70xXy4ZIzIJKCvhDx4eXlHDTMbJugsUGzirSCfs+f0cYPOalDZQoIp694D5AnqSoaWjhpF7PQ7Y287iHwzKpW23AlD8OTm2hOReb4tOBbiOhlGTV9S2vs2J4Lpey5cITJyNyxXEMw2G1cCNaL4R0T66o5asnOKvb9LVilZJXFpziCT7B5k5L4WnMyJiDmC5e1fmc9b7wjQ5we8WwbuyXoHHa8rS/0Ge7iZgmUPW4D+d/MIWg549s+cRIlhQweXKA1knfqOdiMTQ4tMTzpUYCqVYpuc99iaTAiRQxxvztTmEtJoaeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199021)(86362001)(38100700002)(36756003)(31696002)(31686004)(8676002)(8936002)(966005)(26005)(6506007)(478600001)(5660300002)(186003)(53546011)(6486002)(2616005)(83380400001)(2906002)(66556008)(66476007)(316002)(6666004)(41300700001)(54906003)(66946007)(4326008)(6916009)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEx2WjduWnM1a0c0VjdvMnRYT0tBSzdiL2UvSnN1S2pwTjA2Z2wxd0NCdUhL?=
 =?utf-8?B?bnVYbWRLeXp5bnVZVkNDS1JnL0xRYXN6dUdTQTlwYWt4Zi9vZm1QditFR1dh?=
 =?utf-8?B?bG9EenB0SVNOTkdtSXVGZEdCNS9rRWlpUzcrNG5TcnZhYUFmRER3QzRiRnl3?=
 =?utf-8?B?WHJ2Q1Q0SGFQZmxCUXhSRzZvVGJGbjNMVGgyaFdubUFSeG9UNENzcmt6S1BM?=
 =?utf-8?B?cTZCS3pSTWlxb1VuSm5UVEZ0cWttQXBPSUxwNitwT1RRMG1rTUFXUVdud2x4?=
 =?utf-8?B?UkZzWm1USXhMOVV6M3pyQzBVSi9IS0h3bUEzakd2OEtUVjB1TmNhTVpqWnZK?=
 =?utf-8?B?MW5sT2pDYXg0MlNob1dRWlJkS1VYWkFENlg2M2hLUkVwa20wK0VvZEs2MVYx?=
 =?utf-8?B?YjZiZWMydUlIZFp0Y1VxMHB3SkwyUzRrc0pla1VNbDJpZXpoS2JyUzkwTVpS?=
 =?utf-8?B?ZmhmU3BWdDVKRSsrZGo5Q0NxOG96N0JYQjAvbHZYTHQzNUhqcFNKdk9JZTFB?=
 =?utf-8?B?akJnRk9qdFFkbzJLb0czTk52OG1sc1hCUTR2UnBqU0FReldGRWI4T2lnR2xv?=
 =?utf-8?B?RFZXMEdWelIzZzBkQXY0Sk9leUJ5V2ZSZmFCbjFQWk53WGtoZVhqcDk3aXgw?=
 =?utf-8?B?QzFEaVdoT3hpVk1jNW4xSzR6c1VHSVBYRmRuL2Zzak4weC9iQ3MvYVJ5UW0z?=
 =?utf-8?B?U1Z2ejYvL3ExT09NRjRpWGhtcFBCK29rNEFaVzlkSm9BZ2FsWVRKSlBucEVB?=
 =?utf-8?B?eGtmSnBaNnVPbVNiRXgvYXp4YmtLU2c5VVI1ZnY1aTVCTkZTMzVYcWtHdnBI?=
 =?utf-8?B?SUU1K2Y1U1R5dGtESDBoSWJuUmp5NmVkTitSc3BDVzVKRkRaM3gvSG5aczlt?=
 =?utf-8?B?ZlhXalo1L3dHeXNMUmgrd3ZKR1BFK1dQSE5DSVpYKzJWNFVaaUNZR296Q1RZ?=
 =?utf-8?B?WGZCTWV0bzY5RmIyaXZiY2poTm13OE5mbVNVZ28wV1RLOWg5V0dtMytPVVFs?=
 =?utf-8?B?UUFSUG1iMkQyR29HOWpiWjV1aDNIdThVOGpnVXZJdXl1ZEFtTU9oS2pseHlw?=
 =?utf-8?B?Q0g0TEU2Tmh6dlFOa3R6aDZMMEM1d1lZZlBEbGZFU1pTY0NiZENLUjBhbVlS?=
 =?utf-8?B?MEJCZTZ3VjlHYy9uS21Lc0RjU3FhRWxCNlZHTmpOREtWYjk0STRNaW1vcCtj?=
 =?utf-8?B?YXgwS0d0WmpjTk5hRzNVSHNVcU5VRy81aU5vYVEwRUN5bmhBTkMrQitjb3hH?=
 =?utf-8?B?UjNxTGZMWWlkeGN6UWFEMStHM1NwVm9NdDUvK3lpdlBqcXp2WEoyMC80MWR4?=
 =?utf-8?B?YmVNL2xvNS9tVFlIZWtFM0I4VmhmUkR1M0lLN3V4WlhFckFZV1Jjc2tDUjVu?=
 =?utf-8?B?R3FTRTJTZXZjOWpZYXNYM25lYjZBMTVWeExHbEtTamJuNG1KNEdHenlWZnc0?=
 =?utf-8?B?Z0ttdVQwYnlBbjBQQ1M0dUp5bjMzR0lRR3hYbGFHc0RSeTVwSWhzbEtpaVU4?=
 =?utf-8?B?MGI0ZEtJVC8xRnJQVXdaTWIwL0lPS3h6T2tZK1RXRkc4b21vc1ZFTXJGaW5s?=
 =?utf-8?B?V0paNWkwTzZZbGg4V2QrSWJ4Q2dDQXhHYTZsZjB1TEY5WVZTVWpZZWprMXlw?=
 =?utf-8?B?WUtGVkNjOU5ZaFRUeWNZNUhBWmFES3JqOFYwWEd1TXdDWFdnYkdVUnozUUZ0?=
 =?utf-8?B?TFlVcldrV2k2emFCMG1jNWtwZTVsblU0dHRhWEwwK09WdUhuZjFKdEpHYjhr?=
 =?utf-8?B?ZTVwM2laQVFLaXlIMWRvNVpBTURDRnNxMjBkcUZ5WWg3ZHBtU0pvcklBcHI1?=
 =?utf-8?B?NEZDN0JGbThhMnIrU0VGNFJ0U1RESXpOb1N2RHpiUDJ3V0VUYzJ5TGJLTmQ2?=
 =?utf-8?B?ZS9pMTZuTGtWaGswTXU2aWZCZU9ybWg2MEdScS9uekxVSkZDWFNUWDcwRGc3?=
 =?utf-8?B?M051Wk9tVCt6YnZFUG04bzFjbitoWTRiM0xOT3UzMlFOWmRSK212bm1RS0ZC?=
 =?utf-8?B?ZU5XTE1sRzVINmdEU05ScCtXNFIvaFUxeUZrM3hsQ2VTNWc2NDJlMHBZMHNa?=
 =?utf-8?B?enMxcDh2RW9LMzdrRndlZTFCQ3U3THAxRHp4bHc4WnhmQkkvbEEvd2E4bm4y?=
 =?utf-8?Q?iyNusO6Th/G/CLJwJ9+8yN2Eg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 088fe856-7f58-471f-a4d8-08db52298878
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 14:10:54.3532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4jB2rlhA0M6jcossvqzjXqUHy2r89MclCQT7yjRJe/P9fpJP+/HgOY6sdAFXUXif05OjWQ1PKbk/krVRmnGPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7892

On 11.05.2023 15:49, Jason Andryuk wrote:
> On Thu, May 11, 2023 at 2:21 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 10.05.2023 19:49, Jason Andryuk wrote:
>>> On Mon, May 8, 2023 at 6:26 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 01.05.2023 21:30, Jason Andryuk wrote:
>>>>> Extend xen_get_cpufreq_para to return hwp parameters.  These match the
>>>>> hardware rather closely.
>>>>>
>>>>> We need the features bitmask to indicated fields supported by the actual
>>>>> hardware.
>>>>>
>>>>> The use of uint8_t parameters matches the hardware size.  uint32_t
>>>>> entries grows the sysctl_t past the build assertion in setup.c.  The
>>>>> uint8_t ranges are supported across multiple generations, so hopefully
>>>>> they won't change.
>>>>
>>>> Still it feels a little odd for values to be this narrow. Aiui the
>>>> scaling_governor[] and scaling_{max,min}_freq fields aren't (really)
>>>> used by HWP. So you could widen the union in struct
>>>> xen_get_cpufreq_para (in a binary but not necessarily source compatible
>>>> manner), gaining you 6 more uint32_t slots. Possibly the somewhat oddly
>>>> placed scaling_cur_freq could be included as well ...
>>>
>>> The values are narrow, but they match the hardware.  It works for HWP,
>>> so there is no need to change at this time AFAICT.
>>>
>>> Do you want me to make this change?
>>
>> Well, much depends on what these 8-bit values actually express (I did
>> raise this question in one of the replies to your patches, as I wasn't
>> able to find anything in the SDM). That'll then hopefully allow to
>> make some educated prediction on on how likely it is that a future
>> variant of hwp would want to widen them.
> 
> Sorry for not providing a reference earlier.  In the SDM,
> HARDWARE-CONTROLLED PERFORMANCE STATES (HWP) section, there is this
> second paragraph:
> """
> In contrast, HWP is an implementation of the ACPI-defined
> Collaborative Processor Performance Control (CPPC), which specifies
> that the platform enumerates a continuous, abstract unit-less,
> performance value scale that is not tied to a specific performance
> state / frequency by definition. While the enumerated scale is roughly
> linear in terms of a delivered integer workload performance result,
> the OS is required to characterize the performance value range to
> comprehend the delivered performance for an applied workload.
> """
> 
> The numbers are "continuous, abstract unit-less, performance value."
> So there isn't much to go on there, but generally, smaller numbers
> mean slower and bigger numbers mean faster.
> 
> Cross referencing the ACPI spec here:
> https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#collaborative-processor-performance-control
> 
> Scrolling down you can find the register entries such as
> 
> Highest Performance
> Register or DWORD Attribute:  Read
> Size:                         8-32 bits
> 
> AMD has its own pstate implementation that is similar to HWP.  Looking
> at the Linux support, the AMD hardware also use 8 bit values for the
> comparable fields:
> https://elixir.bootlin.com/linux/latest/source/arch/x86/include/asm/msr-index.h#L612
> 
> So Intel and AMD are 8bit for now at least.  Something could do 32bits
> according to the ACPI spec.
> 
> 8 bits of granularity for slow to fast seems like plenty to me.  I'm
> not sure what one would gain from 16 or 32 bits, but I'm not designing
> the hardware.  From the earlier xenpm output, "highest" was 49, so
> still a decent amount of room in an 8 bit range.

Hmm, thanks for the pointers. I'm still somewhat undecided. I guess I'm
okay with you keeping things as you have them. If and when needed we can
still rework the structure - it is possible to change it as it's (for
the time being at least) still an unstable interface.

Jan

