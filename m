Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F69E5B1BBE
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 13:42:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403198.645250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWFv9-0001dn-30; Thu, 08 Sep 2022 11:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403198.645250; Thu, 08 Sep 2022 11:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWFv8-0001bB-Vs; Thu, 08 Sep 2022 11:42:10 +0000
Received: by outflank-mailman (input) for mailman id 403198;
 Thu, 08 Sep 2022 11:42:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56Vh=ZL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWFv7-0001b5-BF
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 11:42:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44875d75-2f6b-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 13:42:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7370.eurprd04.prod.outlook.com (2603:10a6:102:92::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Thu, 8 Sep
 2022 11:42:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 11:42:05 +0000
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
X-Inumbo-ID: 44875d75-2f6b-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIz6BIfxxwjEoqKuhXlaKg5IwXfvr/qznCyxWZhIqRncEcjYWNakkd3yW8pFi0EemaSiO4CgHr/PKpJcoHGp08Dto7E+daX5kMyLdHEDg9YOq1/4MI1yLUF6vvLNOrXJdeB2ZcSz3f6aiXHIjgaZyHQYhQ7ZfXxHk+fWN2Z+xcAZ09g8h09oHcTN4OLrDoTOJKr9HDxAj2HuuFkjDHGbtMUU4nFZqfLTZggabzsjKjRBpl+KvrgkeNuOJCBVS2LrehAYsezw7Om+6SnDv5S8WcXcB1cDOolChqjewyky51XlPlWBdF7ouWkDu2SmXGbUwlx1wM3OKEhN39rFelFyKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CM3Y+8Zt92qFax4IxSIdScPezGFPceBw1YOrNuc3kbs=;
 b=OH+WptGQJGiPhlO7/DapM+j7UXvWS5MGTI+WAFM6Q9BrrWeVKZneto/tnri13GFXOblxyyDYF40qoyUSLMdnakJuAc3ZkbVwA2F/WKL/1j9dA7dtgWU3V9fbwDIJWvyUz1WcZqP9uVPUqRdLup7Q6ovSwBrbin5CMfDyK0k1Y5YdFl3bDAC6kvXxNKHPdHcEE1nKV2eMStwolCH2b8HEk3DnbmeX5vcr4SPT5ipLVzPfOs4s4y3mTv1pi8HzAB2MfzuhCaWxpie3zV4MqgbO9Cr+6DTJJRZvhbTdXWUaMfTIu6h18hI3HiR+3HQQ6AwT+tHJyAT76nWSdIpyurNQGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CM3Y+8Zt92qFax4IxSIdScPezGFPceBw1YOrNuc3kbs=;
 b=ItaeFWNT+1dRh8yDueLsp1My/wLQ3XVGEEOr5uevhW68A8qmO/bfLPZDNy/8n6icyjLo4Rt5IVpn93FKddG6bK1BtBYTmo+ASj0xgBUuV/wFzhG4vKi6A9r+g0C4qXhBz376mugHwsFvhVzq3AORxVqKXRG4QHfHvyHKGnVBN6YO9sPhg+8aa/MzeHmBWM0sYmzbtKHx69rdoo5PJ4lbWpAinwER089Xlt7ShTI1GO5icQYxHnzs4j5+QI8H09mRsT17Y6k0ctesOblWk3Z71imK6BzFsvaFZA8qs25o39YYGmZbbO1B/VjHZO7lqMALp0tatDYmM2Su8lJM5TYcBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <085c4903-dab9-2d0e-2e25-d7e0d9479aa6@suse.com>
Date: Thu, 8 Sep 2022 13:42:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v4 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220902033121.540328-1-wei.chen@arm.com>
 <20220902033121.540328-3-wei.chen@arm.com>
 <f775642b-7b44-86b2-70df-540069bc6674@suse.com>
 <a5df9b8e-4925-30e0-e0de-4062ac4cf9f2@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a5df9b8e-4925-30e0-e0de-4062ac4cf9f2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: f86e9651-cf7f-40a0-cd64-08da918f2725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C7r3CMarJLbCsVsnV28tnYXZCrO6GwoxpWEfN4sBNlTiBLqP34DOq4zHRw5s5NH9HG5iAPBKsyOmBBgSBUTckmJ6e52O7AMXpS+gUw9Ikfnv9gfKH44wRhevmUs1sIvZRHdIhRZBCzy+rH4fhEsYzHwReBgN/TCUX2bcrUkRXjzCG5Z9HOqt2WNAyV7utQrbRk50U47p8M4t2hUo7BhDbCifVOv5bA7Tr05g6/PHvz3zMFzZp/bvOozknnzNpyhsLMmtOsnL92Jbhvjw4yi+IHJXVmK9XjGHHHLSmNBlpl2aMo+bVHvhigO4LQnBnVLVBC4NJm77DBkvuFYu8OIe/Ir6KejzYWY0+ela4dhTq3cPv0GtHjUrPOSA9BzPXJvAqMl5/YGwhuyQBMbgSHthpo6bjKTAUAYCVn9tq1if9G754JrgBfAiJvj4aqdtzVRiVK7QfhTh3AmjxrGAr7wdske8zaU+3RZszdRkRx8OF2nIFO2cN02wrbP5CLNHtAhAj28Nqb2djF8aOQfOVjtVOjNbjbXFXmURenQQCQ9zBat1U8yzCbC7spQKLrNBlfMSEgQb/vwuc40BVrEserLShhypTBKWw9p+Xx5vMg0/oV/UDkPFTC96rhXWfLUxLGpYQDLUbkXl+0lKQUyRUqyGjZjq3PZrm5fGiTvFp6bXVdH4tH5twtFNm+elHWywexofFPBxNjRVSIC79IwO2cJob1jE4vVZbdwSWkS66Om44Ea5VXG8Yvl9ngK22VJktsODFWIfhu8F1yC4jxfRufOl3nuaE0CtRy7rRNAx8k8cDNE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(396003)(39860400002)(376002)(5660300002)(31686004)(186003)(38100700002)(6506007)(36756003)(26005)(6512007)(53546011)(41300700001)(86362001)(66946007)(2616005)(31696002)(6486002)(8936002)(316002)(4326008)(66556008)(83380400001)(2906002)(6916009)(54906003)(8676002)(66476007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWtGT3R3d3R3MGRVbVFoTWpla0NQa2R0V0lGTSsxWXZkNHIxclp4TXNhMlVm?=
 =?utf-8?B?ZUp3eFNENkhDOUhBSkltcTZ0c2NJSXdKNXNabkRHaTduNFVwN2NrV3lGM0cr?=
 =?utf-8?B?LzBjV3loWldSLyt5UE14bnJqOHZyTzFWdW82QlNHQlFVb2U4SEtGWS9WRmdU?=
 =?utf-8?B?U2Z4ajZoM2hQR2x1Z05URUtORGk1RVBCbzJzUThXNGE1c0dlWC9DZGtpNTY5?=
 =?utf-8?B?NHpqbkdvMVIydmtuQ3RjRVhaNlJYQ2xPb3JOREs4SDlkRDgxWnlxWkl6d2VK?=
 =?utf-8?B?SmVsNnEvclBpaDd3N2JrM1Rsck1QdTRBSC9LdkJXR1YvbWxmcUxYUHNMYTFn?=
 =?utf-8?B?OXJYNTBUbG9yQWw4NlFtVXlUSDY3NFB0aXA0Nk9SL0VJb0tIbWJwQmtyV25P?=
 =?utf-8?B?Y0ZhMDNlYWgzdEZIekZDa2VTUkNJaTlQSVQ2Tkt4ZDBORXhwc0dYd3p2UUNm?=
 =?utf-8?B?MS9Da2ZZdHRvVFRRZzRxN2gwTWc2YllwNGRWMS84NkdkU00rZi8rZTI4TG1w?=
 =?utf-8?B?cTdMalIrQVBGUkxzSjMzWWw2RGM1MjFTc09zQ3RWbjYyUTcvall4TWxJd3FK?=
 =?utf-8?B?NmJlNnBPQmtPZjM5S0ZMU1BtcCtUSEMvaEFXQTdaeXROOC9RUjV3dTQwQTVl?=
 =?utf-8?B?Y1ZoOUNxV2Q3Z1AwbnduNlI4SFh4RDF2bFljaG1xWkNzZFUyMGlmOFZlWldk?=
 =?utf-8?B?MTVjN3p4SEU1bVNQMDRrT0lDN3pCeVd2Wks5VzBPc3pxODhwVVJwK0hGaFlT?=
 =?utf-8?B?Z3lnZklyM2djNmNsN2VjWWpBc3JJZmxkcWpUc0pNekptWFJYcW04UlY5WHRt?=
 =?utf-8?B?eHJVdTRnMzJqcFZiWEc0c0RwU0hwdXV5V3JDY216QnFyYnIwV2hMTGo0S25G?=
 =?utf-8?B?K0FMY1l1a3FpY3hkVGkxOTA2U3BGc2dnWGx5bzZnKzd1UU10bjhuZFhmSlEx?=
 =?utf-8?B?bUxGNW9CRmFsZDhFRGUzYmNuMXNZODNJSWRHc3VldEw4ODMxYkVJNzdwdmZS?=
 =?utf-8?B?Mjl5LzVrZGZTNERhWU5YWlptY1ZwRHY0ZWNUa0VnUFZlK3VTaUVRdThhTU1s?=
 =?utf-8?B?ZDVFVks5TVJ3VXZqTVkwc1VVNllsRWdmRk0yQ29yU0prcXZzNzZNbElYRkt3?=
 =?utf-8?B?ZndlZE9zMVRUYktDdy95VkJaQi92allFN2cxdGFCdXJvUzRIdnRIZnJvQ1Zr?=
 =?utf-8?B?czFoQWdoQWxKenV0SDZjK21TRThhNVhDQjVkN003SG52RTJiT3dOTmFVUGYz?=
 =?utf-8?B?VGFLKzBQVG4wb3JkUjNXUmMzRjQ4QXA0cHFZWUVBZ3VaN25TNXRTM1VXTEVy?=
 =?utf-8?B?WDZlWEpsMlVNcGdUR2lCeUhZTG1WLzJET2tFOWdyZUtrZzhnYlBjMkZWVFF3?=
 =?utf-8?B?azA5RE9JdmRZNzhjU3dpeFRKV1RRbEtXb0hyenpLUEl6bk93bXRZK2ZvOExZ?=
 =?utf-8?B?ZmViczJhbzljTEpXQlNDSFV1Mk5pQ0FncmxZNHpFcjJGckN2alQ5UnJvVCtU?=
 =?utf-8?B?Q3F5dlZJbVFaWmZGTHNNejZvbCthYzFPaWpSbXB6a2xGb3huQ3hwbmxxVDhO?=
 =?utf-8?B?c1MrNlUyUmNiSWtDbTE3ZWUxMnpMOWRGN1FsdnlUeW0rbThpckJTa3FMdGFZ?=
 =?utf-8?B?dERoazVvM3BMdEM0aUthbEdPcmw5MzVta1g2eW1ibEg4dysrS2Fmd3NZUGVJ?=
 =?utf-8?B?amVCdWtndm40aVE1ZWJhNVYvdHFMMHEyaXU5MmJYRVRPSUJEQmc4NjRTM0Yr?=
 =?utf-8?B?OW41clZGQzdVN3dhSVFEckJ1dUIvaTBtM20xY0xHYk9vQnBNdG04S0RiSFdz?=
 =?utf-8?B?NS95eXRyWjlPYnI2RlMwU25TakdIQkpHQURlODcrcllGYUR6ZS8yZTNtbHJF?=
 =?utf-8?B?aVJTaGt3Tlg5Tm8yTWMybzhqV2h5Y0djcTgrTG5xVSt3UXBwSEU2L1ZYMVpC?=
 =?utf-8?B?ZDVlbkt1YnFJcVlHeC9lY2xOSkt0VVhJZkZ0R1lyWHFsNUFrODEyU1NjeUcz?=
 =?utf-8?B?MUEvT3NrbC9IZVF0WmI3T0dyaVNqMmRHbEFCMXkvb3haN05BWFduR1lieUEy?=
 =?utf-8?B?M0xVcU9JV0tyWFEzeGpGYnYvZUg0bFU4K29odXMrUU1RSk8yTTAwNDVrRi81?=
 =?utf-8?Q?3vdONKVUyWriB1DJZokY68ZBV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86e9651-cf7f-40a0-cd64-08da918f2725
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 11:42:05.1048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SrW9CLQ46pE/mbsQGLdMDcOcRJa8dyuF3OvLamCFOI9AIKg9SYYwTB3mM27nOARH0+eH3FWc4Trg+kxxMp4iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7370

On 08.09.2022 12:32, Wei Chen wrote:
> On 2022/9/8 17:09, Jan Beulich wrote:
>> On 02.09.2022 05:31, Wei Chen wrote:
>>> --- /dev/null
>>> +++ b/xen/common/numa.c
>>> @@ -0,0 +1,442 @@
>>> +/*
>>> + * Generic VM initialization for NUMA setups.
>>> + * Copyright 2002,2003 Andi Kleen, SuSE Labs.
>>> + * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
>>> + */
>>> +
>>> +#include <xen/init.h>
>>> +#include <xen/keyhandler.h>
>>> +#include <xen/mm.h>
>>> +#include <xen/nodemask.h>
>>> +#include <xen/numa.h>
>>> +#include <xen/param.h>
>>> +#include <xen/sched.h>
>>> +#include <xen/softirq.h>
>>> +
>>> +struct node_data __ro_after_init node_data[MAX_NUMNODES];
>>> +
>>> +/* Mapping from pdx to node id */
>>> +unsigned int __ro_after_init memnode_shift;
>>> +unsigned long __ro_after_init memnodemapsize;
>>> +uint8_t *__ro_after_init memnodemap;
>>> +static uint8_t __ro_after_init _memnodemap[64];
>>
>> These last two want to use nodeid_t instead of uint8_t. Originally
>> the latter used typeof(*memnodemap) for (I think - iirc it was me who
>> made it that way) this reason: That way correcting memnodemap's type
>> would have propagated without the need for further adjustments.
>>
> 
> Thanks for this info, should I need to restore it to use
> "typeof(*memnodemap)" in next version ?

That would be more in line with the original code, but it's not
strictly necessary once nodeid_t if properly used for these variables.
I'd leave it up to you as long as you switch to nodeid_t.

>>> +nodeid_t __read_mostly cpu_to_node[NR_CPUS] = {
>>> +    [0 ... NR_CPUS-1] = NUMA_NO_NODE
>>> +};
>>> +
>>> +cpumask_t __read_mostly node_to_cpumask[MAX_NUMNODES];
>>> +
>>> +nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
>>> +
>>> +bool __read_mostly numa_off;
>>
>> The v3 review discussing this possibly becoming __ro_after_init didn't
>> really finish (you didn't reply to my latest request there), but you
>> also didn't change the attribute. Please clarify.
>>
> 
> I think I had answered your question by:
>  >> I think yes, it will be used in numa_disabled and numa_disabled will
>  >> be called in cpu_add."
> 
> And you replied me with:
>  > In the original code I cannot spot such a path - can you please point
>  > out how exactly you see numa_disabled() reachable from cpu_add()? I'm
>  > clearly overlooking something ..."
> 
> But there is a time difference here, your reply was sent after I sent 
> v3, maybe you didn't notice it

Which suggests you might better have waited with sending v3 until the
discussion had settled.

> About the new question:
> cpu_add will call srat_disabled, srat_disabled will access numa_off.
> srat_disabled is a function without __init.

But the request wasn't to make the variable __initdata. That would be
wrong of course. Since srat_disabled() only reads numa_off,
__ro_after_init does look usable to me.

Jan

