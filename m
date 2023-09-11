Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C60D379A8E1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 16:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599516.934968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfiAd-0004MR-B6; Mon, 11 Sep 2023 14:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599516.934968; Mon, 11 Sep 2023 14:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfiAd-0004Jh-8K; Mon, 11 Sep 2023 14:45:47 +0000
Received: by outflank-mailman (input) for mailman id 599516;
 Mon, 11 Sep 2023 14:45:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfiAb-0004Jb-Le
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 14:45:45 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1d5387e-50b1-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 16:45:42 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by VE1PR04MB7232.eurprd04.prod.outlook.com (2603:10a6:800:1af::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 14:45:39 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 14:45:39 +0000
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
X-Inumbo-ID: e1d5387e-50b1-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHMLNF8PbJZhWXjOpewmT484gC2ldl1r+vk8bkebOTCZrjkKBGdUjm2SmsOXPCMaV7KOzHM2bOGTc+nteLgQGcN5Pm0xqQkP1PTO9lT03as06pg/epEeb30IUopRwDL/IA0JsndorLux6TVwOxcUchiPE+Du5oCX/adnlgpQpBGgGtH6XjMT68Gx4LI2PelEMqq3YiXqm5IoCpMm6T6xIG4EDeQChyKJsbxPgp8dJjjd0JTGZVaizBTUhAVp//SOHEacMOp2aGX8hwb5+asCehAw4+n0nlyPQWlmga0KVappCMU5GdQKhpolQUsCtiHVkk9lZaSAZDlqESLpc4fK/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewtLHnMnrNfimB7NMdSTg4yG96Ai1fQkN9bSyPxqjsk=;
 b=HJS88hxmCwWallt1WDYxbLGB/o/m0PzJMjsQSC/GCmbCLLwLJNn+00MQmIfVjO6ap2pzkwA1nO5ni3/lCq0LOzZslyShEmOrnu73MSg7kk8IYl4W8SVNkyACQjBVW+2kUw/rS0wKeqydIPk4DSoBesciXrfZi4nO623QO+a9XnmRWitu6frStXRa+KOUqX0dfyBsnM6hLZh5zpmODjupe9k5FERWR+sho+e5Cwfz/RZiJiOU2ffa0GJDl4fKQYL8fmw8BriVkMccjHeVP3eMlnAonBu20jay+BVj4RaVsmYHFIFOYoHv50fsL8goefo2rDimnuuaRdRzZRJXtjuvLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewtLHnMnrNfimB7NMdSTg4yG96Ai1fQkN9bSyPxqjsk=;
 b=lH2iCRVKz8Mgzc1aVMS4f9sO0bg9SNg6YgrYi6ENpvA99t4UE91nH6BYLGVieE6M/IzxnFDk0ABpEioQe4YJCtdA0H2a1Y1HClWP0ve79CCSlXJAlNVzyl1e98qq4tKb4lluZt5m8nMozEJmE0spT4nbpkzsAb2btVtlmt2QNI1dbpUu2ULuutlSg97aJHepqiodO7bBsvzGy3xKMqxequ/DuZbUEFbHjp9Z/I9o8BsZx2qNfwFxeOYlXRpN4qLXZyEocsPOI1JlWq0b904WHjtB3Tfc/VYDUN1lAF4bdGIv2/0wNTwxDD2U6neRnA07pszpIj3amrS/c8OH8V+AHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1868edde-1b7e-84c6-6881-ac3b98934932@suse.com>
Date: Mon, 11 Sep 2023 16:45:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 3/5] xen/ppc: Define minimal stub headers required for
 full build
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694211900.git.sanastasio@raptorengineering.com>
 <ec21e13fd3de4142d305924a6f5d55ad15745731.1694211900.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ec21e13fd3de4142d305924a6f5d55ad15745731.1694211900.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::20) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|VE1PR04MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: 92aed111-e2f8-4b44-eab8-08dbb2d5c40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z+rm9qhopWRiIOiFfsaZbEtEq60okDeZb00AS8dVmzGLjBG1eo/6tGWeLEXyNYQPUBH003CnFsbfO9YtNGyBSdz+0UNv2oJsglrL3WpqWgLhnwrBOQd0lLre4ICSmACImVi9/I/ij4dW8vshKQgCngQMIN5Y/xO6dkc0YvEOIGpEwheg7ziisIyIBGPqN+KwF2iJwyV+PlXDmhtKUbN/+p5zlyY6PofUY4ghXPpuaLkKPppf2h05BNXB6MSt8WGx1qTqro5gmNXuup8KE835wUu9ZK9a2it3JJhbsSV8m6X7XnRR254dyhGauWSUtdlZ1y+Ozdxsa7+S6mfE3fJSYpJQDer1MLWMafaNfVapUENTNx5++nw2fcCemk+A5JeeDLveHWDaO3FVDr/8l3k2vZ8PwaCJrQyUjHRwOkKT+SQoMTQabk5kS2gUDHtjhpz4f1Vdjh7/oTBmH+7FndszEtJHae/f0xwspc1ifoZcopRX9JvhXau74PLYpf+vaQBRlAZuV3/qBQN5yV6RvS+uBVp5sDoVFkJ2j1lZVLMLFfrmNRjMf8ziyRE4/lQInr6e8zkgD7IxyEXsd/62mKhDGBNrms5G9p6/Bpsn/iEzIaoh+dMD6rARUXJKaDX7FDYA+E3atlR1u6ZY9jVa6ERgkQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39850400004)(451199024)(1800799009)(186009)(5660300002)(66946007)(6916009)(316002)(41300700001)(54906003)(8676002)(8936002)(31686004)(4326008)(66556008)(66476007)(478600001)(36756003)(38100700002)(6486002)(53546011)(2616005)(6506007)(86362001)(2906002)(31696002)(26005)(83380400001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1RpbGQrRFNSYWZhdjJZT0VQWXF2SmxMaVdCWlhwRnFRd1V4VW0vSDJoUW9J?=
 =?utf-8?B?dkxPM1FTMElwc2ZlbktuZGd2T1pKcHpJYjlZV1JTMnc2aXBMR3pXc1pha25L?=
 =?utf-8?B?YW1RRnZEaklEWUxhS0ZhamxxWEsrTERjWE5uTm1NOTA2Wit6Tm1hdDVycTk1?=
 =?utf-8?B?d2lDUWF0dGpDT2hlZ250LzRYWmpDYTVRRVJSRXlWeW5wczIrd1pQdmRRMGts?=
 =?utf-8?B?b21OalJRbXhIRFhPSVVpVFhvcTBtT2NmRkZZVVdQNURVUDd4V0ZhRXp6eDJR?=
 =?utf-8?B?THRvUnl3MFhyUGFwdmUxWjM3QlFvR0dCNFk2Nm1zMjR5a3pYS0VGa29CcGZY?=
 =?utf-8?B?akMrUGpLV3ZvVE4yVXpybzY3WE9FZXQ2bkNEUTVveFdGbSt3TTNJWDNvMTdI?=
 =?utf-8?B?Q0hRRmx3UVl2Wk5veXI3dWMydnlhKzZZR1JjVTZYMXd1cWhXYjBuak0yeGVO?=
 =?utf-8?B?Yjc3a0RnMHcxWFRpRm9VQ2xOS0tVK2tGeXlDSHhQTzFyYW9vcHBKTkRGMW9U?=
 =?utf-8?B?RnMxM0VjSjZDdVpOTVRCVGRjVy8vQXE4V1FLMTJQZGxscHpweW85b1RFU1h4?=
 =?utf-8?B?ZUpjV3N3R3kwUlVVUVZGSFN6V3BQZUJkVFlNUWo1QU15bXFuNVlMZTNSYXBV?=
 =?utf-8?B?M1lQV25yd28rQnhiYlR5b2NoZGdMa214TkVPYXBvdFNMU3QxN3R4WHVrU0pP?=
 =?utf-8?B?MVBpTkNIN2hBQTRFZjZsS2wvQVVnMDk0R25rSnBrMGxqZ3lvdFBBdGlodWtl?=
 =?utf-8?B?aW9FbzA4MlZKN0JoZm40cVpzZ2JQeEVVTVFyZytZeWVkdEFiZHdxcXhXZzg0?=
 =?utf-8?B?ZmdQRWFoRTBKZFVLb1JEdWo3WklBMFg0N0E3ekZtQy9PNExmdUpXV1dSYVlD?=
 =?utf-8?B?N1MrYStTZ0lQWHc3aHMzRmI2NXhFU3JzRkRzRmRjR2VjZS9udWhrN05iN3BL?=
 =?utf-8?B?NzE0eEw3SVM3YWYzSGJXZk1DOGF1Q3NpeW00WGN1WlBYR095MVFSNFJpQUNV?=
 =?utf-8?B?Zk1BS0cyYnNJVS9IRmpMejh2c28xcG41S214WHZXQnRQQUdPRGQrZ2ZzcjZC?=
 =?utf-8?B?V1dOMjJPenpma2VYMmNkbnJsQ3VMdC9lZzFrY01UTDlZbFppTll0aHlBOTFG?=
 =?utf-8?B?VGZPeS96QlRMQkVDUVJSLy84OWtMdngzTGtwVXZXanpHR0ROSlRZcDljTTkr?=
 =?utf-8?B?OXU0b0JCbDQyRjMzbTYwU29SVlI0b01ZRVJaVGh5OEUvZC8wZ1JPN1ZOakpK?=
 =?utf-8?B?Y1hPbVBjL3dhMTVFR3dRQmZYQk5qUzdqZ1N0eTZ5VmxSUnBrN281TDBsYmV5?=
 =?utf-8?B?WGZmdEZNTXJVMi9CaEttSjlRRG9uSFFKOUJ3bVpZejVya0piU3hJcnJPZzdK?=
 =?utf-8?B?S3ZxUTFNWEFLRTRBR0Zac3lUQzNDZWFkV0VKVDBkM3FEVDdVc25FVFV2Ynpm?=
 =?utf-8?B?TmZacW5laVF1SVphYk9xRysyYkVwTXI0bGszSE1PUnhYWUVtVUVLbHZQRmZq?=
 =?utf-8?B?S2JiZTZUdnIzYzhTVnZNWWYvUHRlN3hFNWZGRkJWeEpldlMwQTdtNyswSVB2?=
 =?utf-8?B?RXhoVkwwV0JjRzRuMlFkTVJiNmorb1JTVVBtc0RSTEV3YmI4bEZJZlFzdGg0?=
 =?utf-8?B?amlTcFJmZmtTZnNLUnNaelZVeGVPRkRScFNaRzU0RG12Y0Q0dHdyRkpyTjcw?=
 =?utf-8?B?NDdsTUJDdFhLc2lqcVFra0hhMGVWa3c5NVZ4bTJJczQ5TTExQnBaUHlQbkRV?=
 =?utf-8?B?YXBNeGNrTFM2ME1BSTFocGRiOG5ZdjBGckxvNkpsWWR1UWhib3hnYlk4eXBq?=
 =?utf-8?B?UmpkbGhYYkl6RVBmcFpKUWFMWVVNRU8vNWhXaWlTeEFLc2VvNEJWU0M0MWE4?=
 =?utf-8?B?bWJUN3JLSy9xQ1pvWVA0TE9FbDV3VUxpNklUYlEwWEVQZG5vVjNPK2N6M3Bp?=
 =?utf-8?B?Unlra3MvUklaa3NyN1NWL1MwRGtlOFlSMnQ3MTFUQmg2WFd2dm5kQW5laFhM?=
 =?utf-8?B?d0RSZW9xVndqMlB5cDJ0U3NOdUIvWW16UEVNMTNaTHhlQnZVbHl0WkFwakdl?=
 =?utf-8?B?UXNEZHJmNVJ4UUw3YWpDQytOa045dldWdGZHVlp3RFdieCs4R1VQaG94a2lB?=
 =?utf-8?Q?J0NS2sgN0rmCsW1ZZsKEkdr1Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92aed111-e2f8-4b44-eab8-08dbb2d5c40b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 14:45:39.0876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZlSteG6/mgx37pQ7eYoTTD/Crvw2aQr3hxPUF6LXAowR3c5Iv7GKsRz5FabkXmxwHNSkL+eQfWnlsFfZ9yc+WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7232

On 09.09.2023 00:50, Shawn Anastasio wrote:
> Additionally, change inclusion of asm/ headers to corresponding xen/ ones
> throughout arch/ppc now that they work.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> 
>  xen/arch/ppc/Kconfig                     |   1 +
>  xen/arch/ppc/include/asm/altp2m.h        |  25 +++
>  xen/arch/ppc/include/asm/bug.h           |   9 +
>  xen/arch/ppc/include/asm/cache.h         |   2 +
>  xen/arch/ppc/include/asm/config.h        |  10 +
>  xen/arch/ppc/include/asm/cpufeature.h    |  10 +
>  xen/arch/ppc/include/asm/current.h       |  43 ++++
>  xen/arch/ppc/include/asm/delay.h         |  12 ++
>  xen/arch/ppc/include/asm/device.h        |  53 +++++
>  xen/arch/ppc/include/asm/div64.h         |  14 ++
>  xen/arch/ppc/include/asm/domain.h        |  47 +++++
>  xen/arch/ppc/include/asm/event.h         |  36 ++++
>  xen/arch/ppc/include/asm/flushtlb.h      |  24 +++
>  xen/arch/ppc/include/asm/grant_table.h   |   5 +
>  xen/arch/ppc/include/asm/guest_access.h  |  68 +++++++
>  xen/arch/ppc/include/asm/guest_atomics.h |  23 +++
>  xen/arch/ppc/include/asm/hardirq.h       |  19 ++
>  xen/arch/ppc/include/asm/hypercall.h     |   5 +
>  xen/arch/ppc/include/asm/io.h            |  16 ++
>  xen/arch/ppc/include/asm/iocap.h         |   8 +
>  xen/arch/ppc/include/asm/iommu.h         |   8 +
>  xen/arch/ppc/include/asm/irq.h           |  33 +++
>  xen/arch/ppc/include/asm/mem_access.h    |   5 +
>  xen/arch/ppc/include/asm/mm.h            | 243 ++++++++++++++++++++++-
>  xen/arch/ppc/include/asm/monitor.h       |  43 ++++
>  xen/arch/ppc/include/asm/nospec.h        |  15 ++
>  xen/arch/ppc/include/asm/numa.h          |  26 +++
>  xen/arch/ppc/include/asm/p2m.h           |  95 +++++++++
>  xen/arch/ppc/include/asm/page.h          |  18 ++
>  xen/arch/ppc/include/asm/paging.h        |   7 +
>  xen/arch/ppc/include/asm/pci.h           |   7 +
>  xen/arch/ppc/include/asm/percpu.h        |  24 +++
>  xen/arch/ppc/include/asm/processor.h     |  10 +
>  xen/arch/ppc/include/asm/random.h        |   9 +
>  xen/arch/ppc/include/asm/setup.h         |   6 +
>  xen/arch/ppc/include/asm/smp.h           |  18 ++
>  xen/arch/ppc/include/asm/softirq.h       |   8 +
>  xen/arch/ppc/include/asm/spinlock.h      |  15 ++
>  xen/arch/ppc/include/asm/system.h        | 219 +++++++++++++++++++-
>  xen/arch/ppc/include/asm/time.h          |  23 +++
>  xen/arch/ppc/include/asm/vm_event.h      |  49 +++++

... this file now wants dropping, and xen/arch/ppc/include/asm/Makefile
instead indicating to use the asm-generic variant.

Note further that xen/arch/ppc/include/asm/numa.h has a leftover Arm
reference that likely wasn't meant to be there.

Jan

