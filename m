Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 345DB7AD5AA
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 12:16:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607769.946063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkicT-0003k3-Jv; Mon, 25 Sep 2023 10:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607769.946063; Mon, 25 Sep 2023 10:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkicT-0003iC-HH; Mon, 25 Sep 2023 10:15:13 +0000
Received: by outflank-mailman (input) for mailman id 607769;
 Mon, 25 Sep 2023 10:15:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3u+g=FJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qkicS-0003i6-Mz
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 10:15:12 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe02::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6865f463-5b8c-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 12:15:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9588.eurprd04.prod.outlook.com (2603:10a6:10:31d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 10:15:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303%3]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 10:15:08 +0000
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
X-Inumbo-ID: 6865f463-5b8c-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekTvcAP0wyxJLtjzLZD5zI7t+63r/9eQZkFhi3vNyrk8Wgdfw3tjawPlpMefp7meLXUhAhvSzqKRlgPNKf999zgxJoswlBq8Dp13ACpk8GKlBCizYbfsz+j6l9Q3pkoZ6AWwTxD9pUmD0gOnuW9Jr03w/ygHADj6jRxHg6LFi9NqYvO5O1pQrg/KkzmjwJ4WyjVcY7GoLRzUyeptqNDiCHLen8gEN3QbnDozSb63cSD+c2iS8XNAV4r+l1kzvMKMc5G1i/N+2lOF0uR0N/XD7j+gRPxvsFrdlyfaPn4uLasE2CS67X0oebKmLhOZMrklZJv5NWBvR5kaHQ6n9YAr1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzHRahnFty70n84vwIqaw+xyhYXP2aHICyT9GKPyIM8=;
 b=aNxYMqsPlrVrtL/5Cx/A8GtA8P6DNUAJIGCIY/BDkW+yufINiThAxQJ7IjR0bP8E65c641ni2bqRPGXLJFNUEq1j9ZeohwSkfBqPmFqO4YIaCliyeRn1CoGLNQvanWV8Aqwg9RFvP2RBaDH+U+gK369T8XsE+TeO41/1dE/+FsYdV+uo+LWTXXY6UJh9C2G8NDhOyYzO2FOpkkH4CapPrITnF3rPqXCEfbM1ykpc3d+Kfe6a3+jkkpqKDLYwoYuzXp9o0TO3W3eeH1lH8PuDXNv87Bq/NRr2skBr5Fqm2+tibNmHpsWaWTOI43UP+yWGWuuLzJzhpXBSE2x7FRso1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzHRahnFty70n84vwIqaw+xyhYXP2aHICyT9GKPyIM8=;
 b=JXgaUGO+cGPboyQuzfYtbett97NBCzGfprdIEnIHvqZ46+DqlBB8nP84QkQlUWNhu4wNgq4jsQD0D1a8Ke2QEF0kWGUYrfblpuHIEtafMPinkZvQleXbsveytLYKfS5I95fl4OIUqSr1sDzcvh/+ENr20ATMHnTM5Tk8ugRGLwV7KUkc1yM0u43/nCVonUViProApOSqtI2zz+o4w8Pts+Ti34OQZVLftkDiV+pospjwSaRtO7KmttoQlu8ha5fGxyykngCM9Wl0RX1mZ3ObfHv35hEIW1TxmoWSXR8yNg6uYhTCg7KzQOk4PV/dKlCKZIJg5vlKNTUmLf5CHm5HRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <319c38ee-798d-0f15-e537-230c79a367b3@suse.com>
Date: Mon, 25 Sep 2023 12:15:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 4/4] pdx: Add CONFIG_PDX_COMPRESSION as a common
 Kconfig option
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, Henry Wang <Henry.Wang@arm.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
 <20230808130220.27891-5-alejandro.vallejo@cloud.com>
 <d462f419-4cd2-53c4-7694-b43b7fa68d88@citrix.com>
 <b0296908-5081-5d34-8487-b8293eee97ca@suse.com>
 <ZRFXA0dUHk5Rmlan@MacBookPdeRoger>
 <62622205-09fe-ff43-a5b6-51e159fc19ad@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <62622205-09fe-ff43-a5b6-51e159fc19ad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9588:EE_
X-MS-Office365-Filtering-Correlation-Id: 7752375e-a4f8-47be-4afb-08dbbdb04bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iH1sd+u3oUTf937hNRMPFbNCGVns6//8+edX7/t5mAM9mRiHXrNzj1nT11o9uD3JUIne2pbGD1EGLmUsFVsRUE1rQtuQlQdV3/IMJZITVfvMl2AHjCT4XjdXQXsn8f4xYWHJMob62TWV/xe30t+Qqm0KNndqDHsN0aJ1i7UVcS5cGuJ6oqj1Ong23g70Ky6xmuJWixmoIO/0/tf5cvVDFlm43qyF1hGOcSqRIBP1cB/783Bg/XJnhszRv4U2dATgRg92LnZNsEA2WHttSzqjs6A6VIc+qy88RjwWW+BqSoQxH/x2lbvUaP2LvX9MqgvTkfd6mq/i0hsfUUa95Coy0kiBZ5DJlnQflu4p8Fy0AWmy5WBJCGNJMsQxtN+6OvcZ0k11lOF3AlTERbt7MCIon8W34YRtQ4IiukkdNGX6zhZUN/NSNw32s2U/tB5Gl+DFcNMGkXi5wOI18kpR+5/Ywi39UodeXhWaAc4WuXddJx/TKNDVcOMlg7qLVQ6/X0g8DS7BJe+coPSwFHfVA9ecdausvnks5UBpDR87PYMBUiXpDnNoCMl2wY7AAR9/jy+LEenRCCHlEOYQtIbEkjMrT3SY+x8pkPJcdSeTc2zgaF5vVohQ/sZEZTXeDs4wezcnEF888eCv05YPuAUF18KaEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(39860400002)(366004)(396003)(230922051799003)(451199024)(186009)(1800799009)(54906003)(316002)(41300700001)(31686004)(66556008)(66476007)(66946007)(110136005)(7416002)(6512007)(8936002)(8676002)(2906002)(4326008)(478600001)(26005)(5660300002)(6486002)(38100700002)(6506007)(53546011)(36756003)(2616005)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWpHV0FuSVdBV2VKZG5kRHp2OTY1NEtaWk5hTEsxS2wxKzBPb1JkVTRlWm9R?=
 =?utf-8?B?bFNSQVdxaWJ4d3pwOGYvZ2R5bW1BSlp2NGV2Wkpuek0yN2V2V2IyNjdzMjhx?=
 =?utf-8?B?cjFHK2lieXV5SVBOdDdzTm5oSHMxQ2o2WHVOR1Jkc0ZmNTQvQ1JCbm45cWM2?=
 =?utf-8?B?eUppSGYrVXZvSHJRQzZPTm03MkZiTVlJWm1tMU5hWGJrQWFrZHR5N1EzT0hQ?=
 =?utf-8?B?ZkJ5eHh3QTdBNTRKT3VJS0pyVjB4N2syR0FlZXZHb1l2N3pEUi9TeFlTVmFi?=
 =?utf-8?B?ZXZJNUk1UXR0c0diK09aQm13UFNiZkhkSjkveEVCWWtBaWc2VmtzNXdEdncv?=
 =?utf-8?B?U1h6Tmppenh4a0kxSmlwVS9jU3l6Mk5sODh4S3ZoWTlHSFgwY1lWTlg2MFEy?=
 =?utf-8?B?VjVGbENJeEdyOUhGYTNvWWZuNVFQa1RYK1N1VVlJaEZabU5SdDlVczNxc2E4?=
 =?utf-8?B?MTg1TmZmN1hTYnhOOWk1NkpPRkFzeithVTk5WnQ2bVEzZXpoaGpDNVlZOEp6?=
 =?utf-8?B?UEJuU3ZiU1RSNlhRZ2JhL2ZETVI4RTE1clFEcnlhd1dsUGJVVFVPWXB5Rjdj?=
 =?utf-8?B?cU9lekpsc2ZhRXl5SGlyZGVqaTdjRE92aXF5WVpUQW1GRGd3MmxxS2cxc0Jp?=
 =?utf-8?B?Y3EwQWM0RkV6aDdNTjgxUDNqc090dFZJRzcvTzhmQTNPZVRlT1lOc2NLMFls?=
 =?utf-8?B?NzJsNnl3Uzl5V3c3SWRUNEJXOEQ5enZEZU1VZ2dTTnNpaFQweXJ0dWJZenpW?=
 =?utf-8?B?ZUlTc29PYjhxOWhmamJQaHN0TExmZkE5STAxSjNqTkw5cjN3ckFwR3NqOXBN?=
 =?utf-8?B?cTR1ZUF6bEgyK3JzNnQzREZUQVliZ1lpaVJjS2wzVDByb2lWZ3ZQcXFkZE9H?=
 =?utf-8?B?dk9KeUdISlhnQndMc3JFbHk3L0ZSSHQ1eFZLWVArZ1FxNTJBaHhYTjNnQUMr?=
 =?utf-8?B?bHRaaXVURUYyRFR2ZVQ3U0pHL0dEbEsrUURnNyt1LzVrR0diL1JOek1pMmhz?=
 =?utf-8?B?Q09QanpOb3U2ZXE1QUJ2N0VONVZERkN2UTNXK0hZdGY2NkQzajM1S2NuVUxs?=
 =?utf-8?B?NDJKbUNBTlVZSFBPUHN2RDBiMWdjMTdnS25hSXZTTStOVWhQZWdhNzJab0lB?=
 =?utf-8?B?cGFlbTVTaXRVQk1wdHJQSEFiU09yRWNwSE1HWndla3VqeHBlQjQxQVhwZFJ5?=
 =?utf-8?B?TUhMcVhYRUk2N3NSMGpISEU3RzVMNDh3dzZpdnFPNnhOc1dtcTBzSEZqTnZX?=
 =?utf-8?B?UVdoN1g5VWZZR2VRMkJRcHdKai9rUnRWVjRXWG45L0hYcnMrRUJjR2ZQclpp?=
 =?utf-8?B?YXNCVE52R0JLOEJIWUEyRHc2UVNwVldhYjZzTFhBdkxMTGFkdzN3cGdqb3pm?=
 =?utf-8?B?Wm84Sk03Vy8wUzdBdjVVN3dBTGY0Sk1xRExaRXA3MjJTRFlMVTRjZWFCNlpj?=
 =?utf-8?B?ek9FS01xckhJa2FpTnEyMHFDTVJLSVRlYUhPUFprc01RVFhrSmR6RitXdzNz?=
 =?utf-8?B?V3NuZDV5R0lSaFd0TXFibXZrNFlSb2hGYVpYbFBFcE1kaWg4SDJ6bGtTYlYx?=
 =?utf-8?B?MkFOTFNzS3dmUUs0cnR4SXZkbXY3VDJmWnhPUWtnN3pwN0dZeWQ3N3ZuZ0hm?=
 =?utf-8?B?d1FKd2lTYVB1SmRVTUFLU2NSMFl3U3JPMitpL2YvNjdqekZLMkRpbnB3OUpn?=
 =?utf-8?B?d0MydEYwTzVKUlAzeFNJK2RYUUNvUU5CM2VQK2k1L3RNTVlob0JlWXpOYlZE?=
 =?utf-8?B?SGg4aEx1TnozdXFQdWxoMkFNOEhzUUp4UzNvQlIybUZVaVM5VE1DM1FYRk5G?=
 =?utf-8?B?d2UrQ2xnQ0d6VzFYNFJjMzRLWWh0SVJWVExvbWRNdDRSQTJmNjZzYWQ4U2pR?=
 =?utf-8?B?djB1ZldNdExwNHhKVXFtMUV0MStsLzBUZm5KOThpUnRoN3kzUEM0SGVkbjA0?=
 =?utf-8?B?R05sOGxrQkpMcXZBWmMyZHQxZS9OUGNkOVZwNEl2L1JSdzk5cm0wSTdEQjVo?=
 =?utf-8?B?ei9KZER4WUFmTm1xNE1kaFQya3ZvYW1wSnRicmNVOHkvTmpDVFg2dEZGYWEr?=
 =?utf-8?B?TlAyTTVVZnlLVnV5SklKZVRuY0trTHI0cjZvT3FXNDA3SkRtNXdjbDlIYnRo?=
 =?utf-8?Q?JQBFxTkLxCfPyEbbzGYd1d3YL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7752375e-a4f8-47be-4afb-08dbbdb04bc8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 10:15:08.7648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JW35Qf3axkH0ghzIsYh185Pbb7NZIftuHVl9lZGR0Km0Yo2Q9VNv9t/rTi+2kdcQQ7WqZAvnz4IjaT3IFimdPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9588

On 25.09.2023 12:01, Andrew Cooper wrote:
> On 25/09/2023 10:46 am, Roger Pau Monné wrote:
>> On Mon, Sep 25, 2023 at 08:36:03AM +0200, Jan Beulich wrote:
>>> On 22.09.2023 22:03, Andrew Cooper wrote:
>>>> On 08/08/2023 2:02 pm, Alejandro Vallejo wrote:
>>>>> --- a/xen/common/Kconfig
>>>>> +++ b/xen/common/Kconfig
>>>>> @@ -23,6 +23,16 @@ config GRANT_TABLE
>>>>>  
>>>>>  	  If unsure, say Y.
>>>>>  
>>>>> +config PDX_COMPRESSION
>>>>> +	bool "PDX (Page inDeX) compression support" if EXPERT
>>>> This still needs hiding on x86.  The minimal hack for 4.18 is "if EXPERT
>>>> && !X86".
>>> If you insist on complete hiding and I insist on allowing it to be used by
>>> people who want to play with exotic hardware, then this won't go anywhere.
>>> I think I've come far enough with accepting a compromise, and so I think
>>> it's your turn now to also take a step from your original position.
>> Just because I'm not familiar with this, is there any x86 hardware
>> that has such sparse memory map that would benefit from PDX?
> 
> There is one known system which never shipped.  Xen's implementation was
> from the anticipation of that system shipping.  Nothing else known.
> 
> None of the other major kernels have facilities such as this, which is
> very likely a contributory factor to the system not shipping.

Possibly, yet there's one important difference (mentioned before): VA space
that Xen can use (for directmap and frame_table[]) is far more constrained
than for baremetal systems (Linux, Windows). Hence the guys who got in touch
back at the time were not in need of Linux side changes at all (as far as I
was told back then).

Jan

