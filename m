Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A582F78586A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 14:57:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589209.921004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYnPp-0005x9-Un; Wed, 23 Aug 2023 12:56:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589209.921004; Wed, 23 Aug 2023 12:56:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYnPp-0005to-R6; Wed, 23 Aug 2023 12:56:53 +0000
Received: by outflank-mailman (input) for mailman id 589209;
 Wed, 23 Aug 2023 12:56:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYnPo-0005ti-Ea
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 12:56:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8632272d-41b4-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 14:56:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6812.eurprd04.prod.outlook.com (2603:10a6:10:f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 12:56:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 12:56:47 +0000
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
X-Inumbo-ID: 8632272d-41b4-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPpTEYyLGEwlzOZw5glAxaCsQlamlMPPwHOPCjzeOaXZWhm8PIF/+UjD2LHI8Qa5eTBJjQy8VrWdA3zhISk3Ufiij7DanwhlSEf22l2GAQIurUH1r3CabiEzFgcY+/Ih87XDV/bfVl+cCXj1r8+Fhb6rsADtpySXafwKo8NZB7ngPX1FNRDPr9CR8l5mnZW4gjOqs+7LiFHxda9LdcxiWWq6oPz776yWUmEH/8vVl6PdCF2ZD4wDkJfskmil8+4vVBGhZVdFQNgWEylQ/s56Llpv5eAyn2Wter8mXdENHHS/u3CoZFMxQftXh6mKSVI/SSxbvo1bGVBDBmTh7W0nJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0epKzk3TasY2gvBS8OqyDEHuZsZVEDBQwqn8QQc5As=;
 b=DWOBSTaPC00J9hWkL/M6qI8vgdCFEGhwePRZ77PSXWJIwyPeueiFIHR3S74u5H9amFM/XA6C3X2Hx6E60/8CRddAByFA3A5ikfbKKBEGrrWKhIKvoojMnljD8Eyqa35cEzTjx5UeflvAlAYCs/aIyLV6cRR1VCmXbvpiKxmCAuuQeblhLW2eCuGe2UiHZ8gh6wuDUhWBfhWfAUekQON6Pt7Ro8MjyUKxkLyLKXLjlTJ0o4xAE8RBcD/OJoHeuuephtXBb0L7lHAF5ZvodTySDpVpe7wINOrIhFmfPgbVZGl4xnmklU9z0NYiX2t/9PcPTIYxRA1rtnU8Vnuc9GOyow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0epKzk3TasY2gvBS8OqyDEHuZsZVEDBQwqn8QQc5As=;
 b=kW4hMWioBeO5Cq1R7RaIz338m1OTD/MTocm9zOZw6achW/y3T+So2PWnpGvRBggX2Z2OQruskn82G40INkxIn+C1JQjnw5c5SIMCSk8iU8ypI7X1IwSzAjtpn3PdEdS8IcMG+Jxou1F4nKnqSx1XHGbz2eKwIDMdhkI0u0U27o5auhZJRH7CvSBUfXxB9HhOR8NIPPMehRTUMBfZ3/N21KZ0eteA/++i8COpCliKdG+gFz2yCfyZkdTcyvPkIT3x2osAyHWNgeaoFgpZALjR1JSYAP4Dr5BAx0SuuosfRJyV1+V13ui+FYaeaWxiPn8602GdZXLDB7cOtMztvAiLOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <26c50dc7-adf3-dbf1-253b-ce333d31911c@suse.com>
Date: Wed, 23 Aug 2023 14:56:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Simon Gaiser <simon@invisiblethingslab.com>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com>
 <2c97ff5b-03b0-3c17-c7f0-9bc8c9317762@invisiblethingslab.com>
 <cecbeec3-57cb-c8de-be06-bf8f6e9cc5f5@suse.com>
 <298af911-f4f0-165d-c493-90407d649945@citrix.com>
 <cfc853dc-0512-da20-5bf3-968a38d7a759@suse.com>
 <635f0055-7001-f68c-9274-6c078d07a22a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <635f0055-7001-f68c-9274-6c078d07a22a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: 575a0185-6b04-4865-ba28-08dba3d868e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1nmwfLRXxSpaV1EEz13+OFz+6pv5zuB7xT0S6sW1GCRJEbTiLlnxZHEKjd1cWTshU0cUyV+VIiTNw/xMD92jA+wOZ4uh4YPwJ3b5JacQ3K0N1R7DpS6dUcRTDayleOmnaP+g/9K+e+W8BaQs8AFbJtYSWnrMFte1lFyLVLqHakFaOSDGG21omoPbFxhmS7bhP1OrZiHWuuB9b72z/yAiuoLTPs4BBHv9D7hccNsBzbwMPYF+hjVJVOSEEde8bFd196DFTdUi0NZNTxnT3ONr7lpDgwes0nM0XXJL+hBMmy/u5hRKb/NYx8mxfRwPVGW8PPRRDQoNheR6qdfxNUJOlCcdXk0D98D7YBfCJRI0kxoqvZ9E54gO73KLc3bC53TUj79TqfCOCSC4MhX1RCQodUxY6Nfpdki9+C2d1btpwkShW+vIT/AioPlB/gqVf3cIZ7az0nZEJXBA7lf48wJUwKnJaZcqdWNPKzP20MgOMQA+CAVHRbeqseEH0s991mpBjBd5wdW05aH7bPkhdejVLoS3GQtyDTe8q95KD2ugTNPcA7wloCJltkDIOgi1096P2+0HapxbCTA/qSC3RiO5dGYdb8CQKxkM/bqh65lRlKuD5WlGs8isXnUguf5v67SCugOcDrbti/vwgKwVSxnYSA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(376002)(366004)(136003)(396003)(451199024)(1800799009)(186009)(2906002)(53546011)(6486002)(6506007)(38100700002)(83380400001)(5660300002)(86362001)(31686004)(31696002)(26005)(2616005)(8936002)(4326008)(66946007)(316002)(54906003)(66476007)(66556008)(6916009)(6512007)(478600001)(8676002)(41300700001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0haaTlBR0srUFlzdmJobHhpYVFoK2piTDFJV2laL0ZWUWJrZmc2aVZ0SkVh?=
 =?utf-8?B?QWpBamc2b083cDVoUE1BMEU1ekVwK0JFRHRndmZCc1pOSEsvOXArUjBvYWtx?=
 =?utf-8?B?aXRsOFh6Q3pDditpM0piYlVyTmVSemc3MnJjT3BOZXgrYXRiNXNVYnYvT3Ft?=
 =?utf-8?B?Q09oVVhYT2hpajlUdkcwQjBIWDk2d0FDTFJVTlVEY0NGUXBhWUlXb1dEZ3h6?=
 =?utf-8?B?NzdsSHhHejlwRFNrUlJScE1INnNoOGRWWmtUMzMxcFMraVh6eExXd2RXV1NG?=
 =?utf-8?B?cnlEK2laUzFZL2ZlUkdhWXdLODVGOXlGU2tFaUZaeFVOMlEyUXpBTlgyNnJw?=
 =?utf-8?B?NGJ3NWNYc0xabTl6RExXdzNaMU5TR3A4c1pGd01qTittTzJhUEdKWjBOVDRw?=
 =?utf-8?B?ZEZxdEc4cDFNT0RlVTNjTjlNSkE3UEwyQm1uNURQdVdNcXprMGhnWWZpT1FW?=
 =?utf-8?B?cm1neDY5NElVRUY2QjY2RWxubG0wZEFVUm5IbGRPbFVZYjYyR2lBQlU5NmFB?=
 =?utf-8?B?QVBmRUczdHFuaDQ3ZXc1blowYTRyM21MNmNxcTV6c1c0eU9wQjNxN0NjVk40?=
 =?utf-8?B?Smpoc1lrMzdycmtucGd1eVNnUmR2eVdIRFlNcSsxVXcvRTRzcFpDOHZzV0wx?=
 =?utf-8?B?WlBCN3VPVGdGdndxRkhJS21UK01pZ2VHODByWUdiOEhvNXB1UDM2NEFyZUNs?=
 =?utf-8?B?d3hob1FnTHZBOVI3K1FtZ2UrdzQwU29uUFBYcFFKM0NRL0JvWmk0TG1tbk1W?=
 =?utf-8?B?akdFSVA0Nm9pcXFXUlR3TG0waGI4MlBYL2xraUVPd2IxM3h0TlNuaUVLTEl5?=
 =?utf-8?B?NTFNZ0Y3cjFCMkdhbDhqbEtHb05kMFhLL2E2VnlxRjNFbHFUM2E1VzhmMzlW?=
 =?utf-8?B?QUtKUEZhWVpoL1BoMm9OZzdIQTlmOWVhdzJDREhWRi9RdWtmblF2TVpRcW5n?=
 =?utf-8?B?a0tEVWQ2QmJzV3ZpaHpNUUwvM01YZm0wOWtQZGxsOWVDVTdkZ2RDU1l0T21J?=
 =?utf-8?B?SGtzUG5iYzZnVzFJNVVaOXg0UDFmaC9xbkZLYkhwaVJQa3lIU3ZhbFowbnhD?=
 =?utf-8?B?NkpjRFh3RnA5N0dNNXB6V0xBSWJnQTdSYXZ2dCtsZ2pSbnpLQTB5SGMrYU9k?=
 =?utf-8?B?R1FXU29KZzhlSVBHNnhBUDAySEdJeWlFdkJQMkNqTDE1R29ZQWVKNnd1ZzFV?=
 =?utf-8?B?aXh1MFBRV3FIZkx2ckk2eGtMTC9FQ0ZETlZZbjFVYkozSmpsRDl0aXByY29T?=
 =?utf-8?B?TjR0bjJ4cmZoRzZDSldWV0xOanZwQmxlMXorUktNNU5JQTJTV25CR1VaeGIw?=
 =?utf-8?B?WnJndUxKd1lteWVZNVlwZEpFT1JRUjZUbkNGWlJTMno2d25FeTZDSU8zYXF5?=
 =?utf-8?B?T2RzTU9OZjZRYkFBbGt6TWxJSnlzbGFtVW1HZERHQ3lJTE52cXBrSVdhSVhu?=
 =?utf-8?B?NnZFTUFTdS9scVlyMXhkcGlrMW1RbUlSUzNvZDZoaTlWbHAraXhvd200REpE?=
 =?utf-8?B?ZFhBMUZuYUZUTlJPWVc4eURueTZFR3Vnb3c4aGtad1VoZFBEL1JTcWdyK2xr?=
 =?utf-8?B?bm9iL1FKZGpPYzRtV2dSK2o3YWVwYW5uZ0toQXhYVGlzc0dtUE1WYlFQbzZt?=
 =?utf-8?B?Y2VWaGVFL0R4Z2VkM2p5QnN0bnlVMy94bGZ0ZEFXTkRIeEx3dUdzSytzV2Iz?=
 =?utf-8?B?U3NlOVlZNU9EbjhWejI1YnRLaEVYeWJsT2ExMkpGc3pJTWwrQ0NTQnB5SFJY?=
 =?utf-8?B?T0VoQjlTNDNVQkV0azRPcDJkZlhTVExpWjNtRnExaExrL3I0TmVTWFBZRkNu?=
 =?utf-8?B?dlhRcjRmc09GcHRmV0xaWmlWM2ZJbmxMdnMyNC9ZNGhubTFHdE9lRWRpMW5u?=
 =?utf-8?B?OGN5L05CU1F3cXZLQU9YcEJaYS9FS0RUN2pJOVBGaStOU1NGb2JodExZc1Rn?=
 =?utf-8?B?WGFCYzVMTHJHeXgrTmwrK1Bhc2NyMjlVVS84NzIrNUluakpuVWUzcjFqaDFI?=
 =?utf-8?B?QytGNnJtY3ljNUxjV3RTc1FYZjlDS2dZM0xiMytsaTAvd0lqY0VvYXluQ1FF?=
 =?utf-8?B?MVBlWmxYQU4xTXM1eDhwd2phQ1RvbnJLSnkzd2xTOWNuTDNpbytockc4bjZy?=
 =?utf-8?Q?K3JmAGVMJmfHi3nZUouILxRyh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 575a0185-6b04-4865-ba28-08dba3d868e5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 12:56:47.2619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYb5eRAQjWlTNOUE23307AHgf61kq1knIgDnaiiIJruav0za1sl37NbuNp+DmVy0yVJYPpEXiY7IWIiSIZrkMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6812

On 23.08.2023 11:21, Andrew Cooper wrote:
> On 07/08/2023 3:18 pm, Jan Beulich wrote:
>> On 07.08.2023 16:04, Andrew Cooper wrote:
>>> On 07/08/2023 2:17 pm, Jan Beulich wrote:
>>>> On 07.08.2023 14:55, Simon Gaiser wrote:
>>>>> Jan Beulich:
>>>>>> On 07.08.2023 11:38, Simon Gaiser wrote:
>>>>>>> It seems some firmwares put dummy entries in the ACPI MADT table for non
>>>>>>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
>>>>>>> 0xff. Linux already has code to handle those cases both in
>>>>>>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
>>>>>>> same check to Xen.
>>>>>> I'm afraid it doesn't become clear to me what problem you're trying to
>>>>>> solve.
>>>>> I want Xen to not think there are possible CPUs that actually never can
>>>>> be there.
>>>> Did you try using "maxcpus=" on the command line? If that doesn't work
>>>> well enough (perhaps because of causing undesirable log messages), maybe
>>>> we need some way to say "no CPU hotplug" on the command line.
>>> The ACPI tables are broken, and Xen's parsing of them is wrong.
>>>
>>> And irrespective - it's unreasonable to have users work around bugs in
>>> Xen by adding more command line.
>> Well, considering how rare CPU hotplug appears to be, such a new option
>> could default to "no hotplug".
> 
> ... or Xen could not be buggy and think there's a chance of hotplug on
> the 99% of servers where there isn't.

Why do you say "buggy" when there's no clear cut indication of whether
hotplug is possible, even not all so old ACPI versions?

>>>>> Without ignoring those dummy entries Xen thinks my NUC has 2 sockets and
>>>>> that there are 8 logical CPUs that are currently disabled but could be
>>>>> hotplugged.
>>>> Yet it's exactly this which ACPI is telling us here (with some vagueness,
>>>> which isn't easy to get around; see below).
>>>>
>>>>> I'm moderately sure that soldering in another CPU is not supported, even
>>>>> less so at runtime ;]
>>>> On your system. What about others, which are hotplug-capable?
>>> It is required that all APIC ID are stated *ahead of time*.
>> Would you mind pointing me at where this is stated?
> 
> In the spec, exactly where you'd expect to find them...
> 
> "OSPM does not expect the information provided in this table to be
> updated if the processor information changes during the lifespan of an
> OS boot."

I don't think this tells us anything about the ID not possibly changing.
It merely tells us that OSPM is not expected to parse this table again
(IOW firmware updating just this table isn't going to be enough). IDs
possibly changing is expressed by (a) the "if the processor information
changes", and (b) the next sentence, forbidding them to change while the
system is asleep: "While in the sleeping state, logical processors must
not be added or removed, nor can their ... ID or ... Flags change."

> Which is wordsmithing for "Some firmware was found to be modifying them
> and this was deemed to be illegal under the spec".

That's your reading of it; I certainly don't infer such from that
sentence.

Jan

