Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9960970B654
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 09:19:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537772.837271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0zoj-0001s6-8K; Mon, 22 May 2023 07:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537772.837271; Mon, 22 May 2023 07:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0zoj-0001pI-4P; Mon, 22 May 2023 07:18:53 +0000
Received: by outflank-mailman (input) for mailman id 537772;
 Mon, 22 May 2023 07:18:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q0zoh-0001pB-8o
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 07:18:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7d00::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e62acfb4-f870-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 09:18:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9051.eurprd04.prod.outlook.com (2603:10a6:10:2e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 07:18:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 07:18:47 +0000
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
X-Inumbo-ID: e62acfb4-f870-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfvOKYBFGS7n4q4nU4GyScZrOqXkeCa49eU3fr+bvj6+dxsTxB2TKz1MPIIyLnBHwtKM78orLd0TXLqhOOUTq0Jgau1Y/zeoTpgRMiMbC81UKYYsVlggWLjrqHklfYx4IjSTF2OQOj0t9HtYaoeM8E6aiG1CZHekfLO9sGvfHdPoCxb+8XcFSr/FL9Fw5avt4z6xyE6BQ+stEWE1IF8OIKYL+qsmjkFFU+yl9HPh+B3+NRE6lo7ScYtKJtcyukNVVcMx6o/CgrYhtz8Dpmd63KkrRZRtZWKeO3OdTOKVweXLd5XOBSb1wjSyp+LJg2oIpVkFVTu5YRScQ4ndJ4Pemw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGK13Y0pIU3hCvD9V8NXj+phVVSQ9Etm7kb0ZOZ52zI=;
 b=MNuEIG20EVEdAvebO2XuA/Dur/wgknQ6o2DWJIDG7yBVwNwAfdvnh/EwgKaZ6iwTvipyLlfPEWkoH2VRfpemklb4h4VXKB5xFolvb3jy9lpP8kQJiPQ6UKp+5H1QN97cZ8jipZ8V3qLV4CuRC7/OkYnXoCnYMaDSXn+wUYRHYz0S4EmYKqw1o+9fvV40M8lZBjMcP1zH2/khh3tW/k9uRpbBatWqHmVQcSXA3uc3YtoxgjDEg4sxxxo0Adees9yM9jZ4BZ7TpTC350q3qvfLg8N2EzDXqBIOL/GRFGLP3QrnC2iFWhibM+w/gt9ipvADzicAwd9Xb4Z+V0SJLlxaBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGK13Y0pIU3hCvD9V8NXj+phVVSQ9Etm7kb0ZOZ52zI=;
 b=x88yo1j4yBPqjVxjqt9QoLDa6HSQNfBv/lpUZ/R2HC/ul0eOsrfVMX11pehx/mbHQLoyuJ/4BgIwjtk+2LVtf/xMMLzN1VkZ36zmBuOGTsoXQe7gUVgL7qRY9MDZC/qigciKOaYCSIqXlLUN2t+u37FMwmyZbl3BdvYDXHNxdi7wzdjrVUiBHlc+YtWEWkkWA1iHnBjUqQBZtXpq1eO1X2N9SMawNdoS3nTvyNDNo3xheNkZxiFW24mjNv/nY/0pRuSEj0+3+DaF5Ia1s8Qbt9mHWJHR8xgXrZ4CKe6FD6ECLI2LtUCsb4mHV0SXT+XEJYYdsopjPdfNpl/XayUkJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3248d4a9-13a6-d85c-65e6-151fcca79cbd@suse.com>
Date: Mon, 22 May 2023 09:18:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/6] x86/cpu-policy: Infrastructure for MSR_ARCH_CAPS
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-4-andrew.cooper3@citrix.com>
 <347219e4-6c3a-a0ad-b010-4dbd7282c7ad@suse.com>
 <ea8bb0da-6326-55d6-18b7-0ce681046d53@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ea8bb0da-6326-55d6-18b7-0ce681046d53@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: 931aba74-dc0e-45a3-2f58-08db5a94c894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w/AVZ11JdJy589XZ57VJUOH2yzaV5ix77lZ6vZJfk2XlJSYAe+0rHjraBHBv3zzrwao9OJayU5VSAZKiY6dfs90qtezMRqnWkVtZpj2I7ODMV/OSp12gTdVnkd+4UsVnhlq1QE5UaFMfAmQ/z1r2r6ZcYrebYG4fsyZhS+UK3QcNSVtLAScukTOOpAPl1JvL4tq616VqXRKSouJ3UMyRvTeQYnQYgte9HRyW0D/al/I+bI/w9ErmerUiirPJ2h3TimJss6Xzz629ZL1uJKrUPtzaBEuuKoHHc6SCVySITwLd2S9gpTY6JRURMht2KGh6TGGMQawu6XqzcSRDN3i+7Y3LaxPn4k+Y6XeoRco1oAFOfw+Uro7lRPyxuIVC/cETqBWV4KejLGnFfB3mbt8fgCwQFxgXPaVx2D6PAIp7xaINSCyohEGYLUq+DOFfCmPLcRaGWzXNQ13qpyGdNj7mQlgKUfOx5MX9GQtWFUuLuTGegIDqdipDcQuA9MAIq0EUpOaNP62YkaDFy9CP8A81cwR+1RejqcIZGLDqoh4gcKoaEh6S+295yqenkEIRArtazBzOkCmobtA3T+9lqJ/4hurmu9IGhBjp8xZ9e98/ADY6PHxkfhMspl6bdN7523XjHGdWXcPPmeN4tng97EkV+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39850400004)(346002)(376002)(366004)(451199021)(8676002)(8936002)(5660300002)(83380400001)(53546011)(186003)(6512007)(6506007)(26005)(31696002)(2616005)(86362001)(38100700002)(41300700001)(6486002)(478600001)(4326008)(36756003)(66946007)(66556008)(66476007)(316002)(54906003)(110136005)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHNRSGwwenFvNzMxcU5hVU0yTkxxS3ZKK085SERVT1R1bUNlaGNYK0loajRU?=
 =?utf-8?B?MFR6TDBLZ21rNjNudkxEL2RkMkhZcUQ5WVd5YTR4ODhQT0tLN3VtaGJDSXBx?=
 =?utf-8?B?ZzYvODM4cGo4OVg5a1dwUEZiRlNHUkRDWVR5UDA3WlR2ejk5VHQ1bXdncG5q?=
 =?utf-8?B?T0wrQkM2c1hPamNMVUFkdEY5QWxTNmhSYUplMUtJcnZRMVhTb0FYS0hET3M5?=
 =?utf-8?B?NHZKUEJXTnpKWmYxcmIvTzVjV09makIvbU53OXpEVjBveW02TGpuekVNMU5q?=
 =?utf-8?B?bURuVTR0Nzl1UmpwV1VHeGVnTEJJeGwxWGh1MFA2eTh5dHpjOGh6dlFjUVpJ?=
 =?utf-8?B?S05zU1JzZHdKUUZleHBicElLNGZyZEYxT2kwMkU0SU5tb1hLWDNZa1d0UVdS?=
 =?utf-8?B?WFh5bmNoRXJKZ25kanZWN1ZPMC9TWHcwelhmcWlJUk1MUVcrR3hWMXFzbGdp?=
 =?utf-8?B?UzEzSk03S1pBT1FIUGt3S0ttM0JBbXZsZ1JxVyt5a0tyaTJxZHBobVhVOFIv?=
 =?utf-8?B?SkdraDBqL21GYm0yNzVGcEhiYm5KT2VpVEkzTnJGQlJIWVBBc0Iza2RzVUJU?=
 =?utf-8?B?UnBNbEpISDcxb05DNk8vYllEeFpUczNpUnpBTk9SSE5odGV3bmhWdEphK09r?=
 =?utf-8?B?TVIrTnFKcnJqWC9DWVR3blJURU13NW8wMCszNTM2M0RCd3FzRW5xYWR0Y3dE?=
 =?utf-8?B?MWhQTmx0c1RsUno5YXc2YTlQOXVtTU5yRzJmQmpVYXEyY1dITkhVdERUSjB2?=
 =?utf-8?B?eitxaGFpMGZHN0pLcWhVOS9PRlZZTlhoMlpnclMzNGVFU2RhS2dLYlNSenBQ?=
 =?utf-8?B?ZjNMVGc3d0JzT2ROdmk0eU1OSEc5UlhEODRhNkdRZ29vc1lVN0IrUWpoZUlo?=
 =?utf-8?B?OWJSai92MExaaC8ySWlMaUExaXBxS1RuK2c5b2Nrdzg4SS9FNU81RXdRQ1BY?=
 =?utf-8?B?UjZJYkg1N0hJY3RBckVnOGhrN3Q5WmYzNmg5RDNYUDVFMmJ0SDJPcjh6R1ov?=
 =?utf-8?B?SXVQSEZLb1RHOG9XWGFtdGNQRjlkWm5KK2RDOE05RWRSMUlzblIvYmI1QmJ0?=
 =?utf-8?B?b0N1YVFQMjVyK05sdU9XYTRkU0Z5RWtQV2dCb2ZHWGdVdWcxWlI3RVlGdnhC?=
 =?utf-8?B?cTlFQ1JHVjM0TGo0R0xhREprRDJjWllMa0tSZWxENUdzV3lnZlZjanlCcmZv?=
 =?utf-8?B?VUY2TmxnZUhJUjdxRUtCMjVnK3Zaeitna1hWVGdyK3FYT1BLMXRMaUJBclBj?=
 =?utf-8?B?STJ1M1RwZkh6Z0l3RU12bE9JUjczd3BtVndibHY5bE1XUkl1cERGMFpTQVpD?=
 =?utf-8?B?bjNlUHJ6a1h2OTAvdTk1dlRpR3FJOE05dmdMaGNITDVuL29UaGltcDJQazlT?=
 =?utf-8?B?SmlzU0FPeURtYjQzRDZNUUc2RWNUUnBnTFhNd0kxN1Q2MHQ0dXM3ZHRMVUxz?=
 =?utf-8?B?V0FFN3Mwb29heDNiK0JGWGFveURJR1FNOGw4VWtBYTRDQTVrZ0xJOHNScTgv?=
 =?utf-8?B?RFdpYXNLaDJ1YS9XVEM0enQzblJzcnZVSXpBcEpzVjZnOVZmeEROY2kwdEhK?=
 =?utf-8?B?QXhBa2xEWjFOZ1oyNnFUMFFER2owSjkreVBoZ05kZTh0OUxJMlZRcTI3V1JR?=
 =?utf-8?B?Ui9PcmFMVGV3eFRkQ2tjMmNzTUZjamVqSndwRmhZOFhJOTZDOGh6Rm5wOGkx?=
 =?utf-8?B?M2QySjdJVlUwT0RZN3NuZmxyZzNHcnlQN2hxUlN1R3IxRGxsdlZXZDBWNlNY?=
 =?utf-8?B?YU5rM2FGaFh1UU1USGYzbzhEOFV0czR0S0hKR0ZwTmhDSmZQQk9HUkN4Rzgz?=
 =?utf-8?B?Rk1mQzV1VTFhWVZZaDZQSktVMWZnb0UvUjdLKytrejZQZWN5bTdsbFVGTlNx?=
 =?utf-8?B?VVNKYldRZ1gvL3NlbHRlb0lwNGhEME1ZZlUrdTVLa08rdGt3OGhNKzFmRkZo?=
 =?utf-8?B?UGZCZGJlN2JOTHUvOVhWZ1pxUTNUb2RrbzIveklWdnhyRlVRRTZlNmFjeitP?=
 =?utf-8?B?Wko4Z2pOSStweFFCeVZBK0tyM2dKbXE1dCtqckZrUjAyTjRpRmFtSGJuMUV6?=
 =?utf-8?B?bFMzZG1ZZmkrUGEvdVV1alN5aGVqdTdlOWRxSDE3VVVoNVNVTFBSa2hIOE1o?=
 =?utf-8?Q?oUKdy+y1CnxtLAp4IZOkW/O9h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 931aba74-dc0e-45a3-2f58-08db5a94c894
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 07:18:47.1264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjxR+oMSxL7z+tIy+JGA8yc+nJI9uzpteNywURp7EXU2X6aXN63MIfurdPYBcrOxzJm8D5Lk5tbV2HDHaUxvmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9051

On 19.05.2023 17:36, Andrew Cooper wrote:
> On 16/05/2023 1:02 pm, Jan Beulich wrote:
>> On 15.05.2023 16:42, Andrew Cooper wrote:
>>> Bits through 24 are already defined, meaning that we're not far off needing
>>> the second word.  Put both in right away.
>>>
>>> The bool bitfield names in the arch_caps union are unused, and somewhat out of
>>> date.  They'll shortly be automatically generated.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> I'm largely okay, but I'd like to raise a couple of naming / presentation
>> questions:
>>
>>> --- a/tools/misc/xen-cpuid.c
>>> +++ b/tools/misc/xen-cpuid.c
>>> @@ -226,6 +226,14 @@ static const char *const str_7d2[32] =
>>>      [ 4] = "bhi-ctrl",      [ 5] = "mcdt-no",
>>>  };
>>>  
>>> +static const char *const str_10Al[32] =
>>> +{
>>> +};
>>> +
>>> +static const char *const str_10Ah[32] =
>>> +{
>>> +};
>>> +
>>>  static const struct {
>>>      const char *name;
>>>      const char *abbr;
>>> @@ -248,6 +256,8 @@ static const struct {
>>>      { "0x00000007:2.edx", "7d2", str_7d2 },
>>>      { "0x00000007:1.ecx", "7c1", str_7c1 },
>>>      { "0x00000007:1.edx", "7d1", str_7d1 },
>>> +    { "0x0000010a.lo",   "10Al", str_10Al },
>>> +    { "0x0000010a.hi",   "10Ah", str_10Ah },
>> The MSR-ness can certainly be inferred from the .lo / .hi and l/h
>> suffixes of the strings, but I wonder whether having it e.g. like
>>
>>     { "MSR0000010a.lo",   "m10Al", str_10Al },
>>     { "MSR0000010a.hi",   "m10Ah", str_10Ah },
>>
>> or
>>
>>     { "MSR[010a].lo",   "m10Al", str_10Al },
>>     { "MSR[010a].hi",   "m10Ah", str_10Ah },
>>
>> or even
>>
>>     { "ARCH_CAPS.lo",   "m10Al", str_10Al },
>>     { "ARCH_CAPS.hi",   "m10Ah", str_10Ah },
>>
>> wouldn't make it more obvious.
> 
> Well, it's takes something which is consistent, and introduces
> inconsistencies.
> 
> The e is logically part of the leaf number, so using m for MSRs is not
> equivalent.  If you do want to prefix MSRs, you need to prefix the
> non-extended leaves, and c isn't obviously CPUID when there's the
> Centaur range at 0xC000xxxx
> 
> Nor can you reasonably have MSR[...] in the long names without
> CPUID[...] too, and that's taking some pretty long lines and making them
> even longer.

I disagree, simply because of the name of the tool we're talking about
here. It's all about CPUID, so calling that out isn't relevant. Calling
out parts which aren't CPUID is, imo.

>>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>>> @@ -307,6 +307,10 @@ XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
>>>  XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
>>>  XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
>>>  
>>> +/* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
>>> +
>>> +/* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 */
>> Right here I'd be inclined to omit the MSR index; the name ought to
>> be sufficient.
> 
> It doesn't hurt to have it, and it it might be helpful for people who
> don't know the indices off by heart.

I'm one of those who don't, yet I still view the number as odd here.
Imo it has no relevance in this context. But anyway, I'm going to
accept this part whichever way you want it, while I continue to be
unconvinced of the xen-cpuid side of things.

Roger, do you have any opinion here? If you and Andrew agreed, I'd
certainly accept that.

Jan

