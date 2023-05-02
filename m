Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B1A6F3D2C
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 08:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528343.821359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptj3w-00089K-QY; Tue, 02 May 2023 06:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528343.821359; Tue, 02 May 2023 06:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptj3w-00085y-N7; Tue, 02 May 2023 06:00:32 +0000
Received: by outflank-mailman (input) for mailman id 528343;
 Tue, 02 May 2023 06:00:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptj3u-00085s-P4
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 06:00:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4191ef1-e8ae-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 08:00:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9149.eurprd04.prod.outlook.com (2603:10a6:150:24::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 05:59:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 05:59:58 +0000
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
X-Inumbo-ID: a4191ef1-e8ae-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmBzpeFU5yhVNK2nG3nUwqCaQ9wAtkOdDP7XjUpVNmAxmYX5rjZfd8M2NCy4utLq2w79ffgelFSTivHvQjwTLEpdiNs920d0VaNGQbZgGqKuqNzqQRpabM+E2Yft8CG7MYFAWJb+K36rICMxwIesPCuW2Xx7rFuM96HLmHeGdczpJRXFjJN2mk/dSMHtsKFbBl/CTleh8ORbU0r5fcLI5/EfnkkyQlHBe9d1VGJ7S5bT8JrUyvfqJ4zRD2I+hsnrGWNAMuHjD4rjcR4DMrV7jnHVAalkxgHJkFb5J6oYmvzUvPPMpF0WQN1gFN5McQ4L6wiFDrwNYX8nYfnIQXjquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqUDT48TZ44wEPoY2YLLLr65qaAbK6lEv81awHVxLKE=;
 b=UesVRjxai+9smaFUJa/clDWj6iOI5t+HZrsl6GU4jAcaj2yddayF1w+IEU0y0zitnt0Oo5s/TSF8Z0Z++lPP1eoeC4f2pdEf8kEMmBBrYfRAoPsafsQggX6Krq8+gLV4l3PYGyWlmYNoxW71tDqzDf+s+iPwYOh6OjsTuKlNli7ll5J41aXWVNENaLHCx8C115rS9lYCU2gncavV7p8UwPzORTAMN3nzDnOGAVw3X1Whh9kw+FS9fn92jqbYHD5bcwe5/d7H/u7xNN9XXqkuSAR2JiLn8zaFqOYre5gX1HIKD97Dv/wx2DR8lmudAAgIS9xM7t/49Rb3B+eWlO6FVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqUDT48TZ44wEPoY2YLLLr65qaAbK6lEv81awHVxLKE=;
 b=KZDEwZuVNYbydsBXnsQpDm0SxNSB1sJeUh2OKAhiaW0oqgXBrh+WTeSNedjqni5iWS64ewA8sOqyugp77VptoIblb+f1+n8/pVzKW9fbQP62/ZA2RBzvffU1RG/DHZdhY42h6Xx+PBrpkgdHLzFySl1pIBqTgmG8TftZgbRCGMmqevGr/juqT+4cFo/kjCRcOTyTN8PxF2yzn9pHAlB29vajaJQ2DTfpElcYks/qG8bc/2hXuEu0ekNGEu9xR4T39V2R8fx6htW/ZXw9k3WgCky0M+e3BrtISaLXPEcKIQzspp2UU5xxS//vFJQZekk/m2rVOfyW8Ew7T1l+Vk6Y7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <211ad193-07d3-2e9b-2215-c31858b854f2@suse.com>
Date: Tue, 2 May 2023 07:59:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [BUG] x2apic broken with current AMD hardware
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
References: <a2e5cb62-9aef-4f91-b5e9-35fee6739fc8@suse.com>
 <ZAkVVhIldUv/xQqt@mattapan.m5p.com>
 <21436010-8212-7b09-a577-09d3f57156bf@suse.com>
 <ZAvGvokloPf+ltr9@mattapan.m5p.com>
 <f33c9b8a-f25d-caab-659d-d34ba21ebc25@suse.com>
 <ZBOSKo+sT/FtWY9C@mattapan.m5p.com>
 <e5b28dae-3699-cb0d-ab7e-42fdd42d3222@suse.com>
 <ZBSi2KfoQXo7hr6z@mattapan.m5p.com>
 <b2eaeacc-de5f-ebe9-a330-fbf9e20626b1@suse.com>
 <a2de5d87-ada8-46b9-090b-00dc43309362@suse.com>
 <ZE6iaaUvScHUjoKy@mattapan.m5p.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZE6iaaUvScHUjoKy@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0211.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9149:EE_
X-MS-Office365-Filtering-Correlation-Id: 449bc788-c9cb-4930-6828-08db4ad27580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JgJYAeKkDKBpjlZ3zqwp9ORsnCrZTbI5x8Ad3xTLN+eDZZYYJTzZ5QD9iaTTzwDmXU6D1RatC9yRyUr3CHNzqy1vvsNuI+F3fRkY6cHrsonlwOl9ISwDdvSAF/5UBoxosK+SldFCfA4m+lIlU3qOUl8uyPTzRcLCHLN/CpzI3l2SFiiU49j01tlHJXr3QH+EokvLO7KK1wDv4wMg6IW172RHOuRDn0o7UnLqH8dwnJSxAUqWwQ2KGvXOTM7l8v9YNPKVjAxxKfMMLQY4G73Upp7PuCBfJ2W5YZFYbg85bLkslMwTQki6/0urQk+W0vduOHMqZakSlCkdFB1mU/itMLJ2HUoZxS8bBpd92Tx99wuEEc4EsPhORV5EOhC6FVo7ErAuIlHRPpfYQAKQpX7ZNknfvQWW7fX7gqcEOhlq2EW5gjjgfstm4MBSq5jgVG46yEojE2gyjYliSn2BYeIPFPV6RAn856AcEOk9gNXTy/R6nADm5r/fk0pVYp4vBp56nYBa3RHQqM7nw0NIBYs1ymdz83TZKK90YLh6kr53h3cZbo7GbpsurMR3UMkP9/JHSTuSlXb5hhX38MZWZ95bQDdUilSZJRDPIOHcITaUIeF0oYP+RPrujiW1nCR0+A08Vi1fvM1S8gzsYjrULn9G4Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199021)(2616005)(83380400001)(478600001)(53546011)(31696002)(6486002)(26005)(6512007)(6506007)(66946007)(66476007)(66556008)(316002)(4326008)(186003)(31686004)(41300700001)(8676002)(5660300002)(8936002)(38100700002)(2906002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmxuNDVlcjVoQktUODh4RzZRSXRrWVpJMFZDL2hVMW5vRkVmWEZtNVdsaU43?=
 =?utf-8?B?cHhNbGFQUm1PN2ZSeDdMdzhLRko2WFhocE1POERJM0ZlOXR6U3ZqLzNRdWRz?=
 =?utf-8?B?YnlaVzBZWmlBMXNpa1pleGhBQnVWYU14ajZOVnZKempUTUJYQnVMYmw5bC9V?=
 =?utf-8?B?cVQvVjFUVlQxY0VFQi9SdzcvOFZBaWZMNnpZM2JXUGt3M1V0Z0NWUG1ibVZ4?=
 =?utf-8?B?OGoyM0p1N1NEY0hJTXFmd0dUcnhpUDdMdWpRUUJCeDdaclpRc2V2QXlaTi96?=
 =?utf-8?B?TG1SZ1psbXZ5SWd5NlZ3Y0p6ME94aHRJT1RCUXo3dzJmVG9sK2VqcHJUSWlD?=
 =?utf-8?B?OGdyU3Bhck1ZSEJOT1FVemhuRmk5Vmd6aU5Hdnh1MHpKTm1WSVJWeUJkSGNj?=
 =?utf-8?B?emE4Q3YxWm11K0Q0Y2t5OElJSGFWYitleHBkbk1sR1VueXVVM3BzYk9zOGpL?=
 =?utf-8?B?VmQ3cjY1RW9lT2ROd0hDeW9IUGQ5Q3dUdDZjajc5VmdIU2xFdWlPYWVlWmNs?=
 =?utf-8?B?MEcydWpZaGk4cjFwVTV5NWoxWU1zaDNYTVBzYVB2b01hRWNJdWFXNHVjc3g3?=
 =?utf-8?B?U1BlVDY1MXJGQmhTSXRVNDQzOEFwdkdCbzdSMUwzZmx3Vm84RlBQMU1obkhq?=
 =?utf-8?B?ZFNrVm9KS2J6ZzlkU1RyNzlISjVKdTJVcC8vNVljSncza0p0REpiZU9KZyt6?=
 =?utf-8?B?ejdiVlpYVVhFaUFabXFjbDg0Vlg5V2VQaFNtZS9Fb2UybU5wUVRtNnNzNDYr?=
 =?utf-8?B?Ny9LMVZObkw0c3hVNUxYZlMwdndVaTlHM21XcFduREN1TWFUQzZnU25mbmQw?=
 =?utf-8?B?a1FQV0NGN1pESUk5L2owL1FIcis0VXVMY2RYUXdMLy9qZy8za28zUVlCZnds?=
 =?utf-8?B?K3Y4S1BVRllRQkI0NXR6ay92WWFOa1p5cXNyNjF3OHQrZlFONkNyN2tsNFpU?=
 =?utf-8?B?RDZOdyt6c1pFNWNQa2xPMGJ5Q25WYjZLTU1vQmlldHFQazRrVUx1ZDRCTHR3?=
 =?utf-8?B?NWEybm1SbU5LSkhyMWRaNVlTdThMNWtGcVhLNUIwMXh5cVhuWjYxOHRsOWpH?=
 =?utf-8?B?L0FrQkhTeEtvSVdQQ3R0dnhVMU45djJHV1BaQ1BFdTJVN1o1QmtXRi9xV0V5?=
 =?utf-8?B?YTBxWC9ScDk5VU5wemNtTnB2djhPYnBvT2RrYlkyVFQybDZmOCtnT3grNmFl?=
 =?utf-8?B?OGhKVXluTlFuZ0srdWNwYWVyaEY1V0VadlE3Yno5ZU00VEhWazFNOWVSWHZ0?=
 =?utf-8?B?WCtEZG5RemJvNmRSZy9wUTdJUjk3SktiU1B0MjB1dFZOd3dVNXdxRmV6c0h6?=
 =?utf-8?B?NDFvRklLQlc2Y1N4Sk1TNnBrd2ZxQlppZk9rTzk3SEtXTlkvT2gzM25uUlRT?=
 =?utf-8?B?TGkwZk04ZEVKcXN1Q09hT1E0ZWlNQjJWbkZtV2JZaFVmZUxDVUp2SFpnM0xJ?=
 =?utf-8?B?bEt3Wkkza1ZkSUkvWUE1b0VEN29Tc09wODI4MHZoWHYveHNZWERlaEpWbVZR?=
 =?utf-8?B?akJTU1R4bVF2RkFETE5aQVhyZGRJczVPVVpJMDZmelFnT3d1QlpJaUI4OFJz?=
 =?utf-8?B?ckhzMHd2MU5PMlhGMG5BOEp6MUFEWHFnME1GQW9IdXIrY0lxTWI5amlEeC9s?=
 =?utf-8?B?a1RMejd3MjBUM2Z6bmh5SEFuUnBJdnBRbDFnYW1RcVF2UjBFSDRTS3JsSldz?=
 =?utf-8?B?emVneXBWK1FmWXBXNUhlWlRxWmNIMUthNEtpZzMzMEl4eXEzNC9OOE9odmVj?=
 =?utf-8?B?aDd5d1pVZjJ2RlFpYndWYXBweURubmxwZXVJWDhRQ3JaVEpyZHh0TjFSbHF1?=
 =?utf-8?B?VFpWT1U4K1JGc2V3cnRyWks5TDRiT3JWQ1RIalB2dy9LWk9HMEZ1THZ2dkpD?=
 =?utf-8?B?eWliRHhNcU5reGJMeHh0YkZwSnRGM2ExVWFoVU9nUldiQWR0ZDlGbFZGYjNM?=
 =?utf-8?B?eVcrNDVjWkIwck4zSFFreGhvSS9kckw0eHNMVWNrczh6Uk9pak95QXBtVWFT?=
 =?utf-8?B?UXZ2RnlmU2lNQWovTlhsMmNQTVB4SFp1OUUreWpNdHByUXNrNGk0bTAyclFs?=
 =?utf-8?B?UE9pWi9tdHM1dU1IRFhsSkUycHA3WDhPM3dVSUM1d2NhdC9IQlRTU3plRXBn?=
 =?utf-8?Q?XGtixyIqmTZ5EXcF1SeQeCwHZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 449bc788-c9cb-4930-6828-08db4ad27580
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 05:59:58.0233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGt4dYGuEVT4xri3+6/MtU0EppJg+5wr6l0E8jloxUNuw7uEUaqC3EgNJUIvHU5ut3P/PO7oN3ht2xBBz9D09A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9149

On 30.04.2023 19:16, Elliott Mitchell wrote:
> On Mon, Mar 20, 2023 at 09:28:20AM +0100, Jan Beulich wrote:
>> On 20.03.2023 09:14, Jan Beulich wrote:
>>> On 17.03.2023 18:26, Elliott Mitchell wrote:
>>>> On Fri, Mar 17, 2023 at 09:22:09AM +0100, Jan Beulich wrote:
>>>>> On 16.03.2023 23:03, Elliott Mitchell wrote:
>>>>>> On Mon, Mar 13, 2023 at 08:01:02AM +0100, Jan Beulich wrote:
>>>>>>> On 11.03.2023 01:09, Elliott Mitchell wrote:
>>>>>>>> On Thu, Mar 09, 2023 at 10:03:23AM +0100, Jan Beulich wrote:
>>>>>>>>>
>>>>>>>>> In any event you will want to collect a serial log at maximum verbosity.
>>>>>>>>> It would also be of interest to know whether turning off the IOMMU avoids
>>>>>>>>> the issue as well (on the assumption that your system has less than 255
>>>>>>>>> CPUs).
>>>>>>>>
>>>>>>>> I think I might have figured out the situation in a different fashion.
>>>>>>>>
>>>>>>>> I was taking a look at the BIOS manual for this motherboard and noticed
>>>>>>>> a mention of a "Local APIC Mode" setting.  Four values are listed
>>>>>>>> "Compatibility", "xAPIC", "x2APIC", and "Auto".
>>>>>>>>
>>>>>>>> That is the sort of setting I likely left at "Auto" and that may well
>>>>>>>> result in x2 functionality being disabled.  Perhaps the x2APIC
>>>>>>>> functionality on AMD is detecting whether the hardware is present, and
>>>>>>>> failing to test whether it has been enabled?  (could be useful to output
>>>>>>>> a message suggesting enabling the hardware feature)
>>>>>>>
>>>>>>> Can we please move to a little more technical terms here? What is "present"
>>>>>>> and "enabled" in your view? I don't suppose you mean the CPUID bit (which
>>>>>>> we check) and the x2APIC-mode-enable one (which we drive as needed). It's
>>>>>>> also left unclear what the four modes of BIOS operation evaluate to. Even
>>>>>>> if we knew that, overriding e.g. "Compatibility" (which likely means some
>>>>>>> form of "disabled" / "hidden") isn't normally an appropriate thing to do.
>>>>>>> In "Auto" mode Xen likely should work - the only way I could interpret the
>>>>>>> the other modes are "xAPIC" meaning no x2APIC ACPI tables entries (and
>>>>>>> presumably the CPUID bit also masked), "x2APIC" meaning x2APIC mode pre-
>>>>>>> enabled by firmware, and "Auto" leaving it to the OS to select. Yet that's
>>>>>>> speculation on my part ...
>>>>>>
>>>>>> I provided the information I had discovered.  There is a setting for this
>>>>>> motherboard (likely present on some similar motherboards) which /may/
>>>>>> effect the issue.  I doubt I've tried "compatibility", but none of the
>>>>>> values I've tried have gotten the system to boot without "x2apic=false"
>>>>>> on Xen's command-line.
>>>>>>
>>>>>> When setting to "x2APIC" just after "(XEN) AMD-Vi: IOMMU Extended Features:"
>>>>>> I see the line "(XEN) - x2APIC".  Later is the line
>>>>>> "(XEN) x2APIC mode is already enabled by BIOS."  I'll guess "Auto"
>>>>>> leaves the x2APIC turned off since neither line is present.
>>>>>
>>>>> When "(XEN) - x2APIC" is absent the IOMMU can't be switched into x2APIC
>>>>> mode. Are you sure that's the case when using "Auto"?
>>>>
>>>> grep -eAPIC\ driver -e-\ x2APIC:
>>>>
>>>> "Auto":
>>>> (XEN) Using APIC driver default
>>>> (XEN) Overriding APIC driver with bigsmp
>>>> (XEN) Switched to APIC driver x2apic_cluster
>>>>
>>>> "x2APIC":
>>>> (XEN) Using APIC driver x2apic_cluster
>>>> (XEN) - x2APIC
>>>>
>>>> Yes, I'm sure.
>>>
>>> Okay, this then means we're running in a mode we don't mean to run
>>> in: When the IOMMU claims to not support x2APIC mode (which is odd in
>>> the first place when at the same time the CPU reports x2APIC mode as
>>> supported), amd_iommu_prepare() is intended to switch interrupt
>>> remapping mode to "restricted" (which in turn would force x2APIC mode
>>> to "physical", not "clustered"). I notice though that there are a
>>> number of error paths in the function which bypass this setting. Could
>>> you add a couple of printk()s to understand which path is taken (each
>>> time; the function can be called more than once)?
>>
>> I think I've spotted at least one issue. Could you give the patch below
>> a try please? (Patch is fine for master and 4.17 but would need context
>> adjustment for 4.16.)
> 
> Given the patch didn't fix the problem, that wasn't the issue.  I did
> though manage to try another variant of BIOS settings for this
> motherboard.  Setting "Local APIC Mode" to "x2APIC" in the BIOS neither
> breaks anything additional, nor fixes issues.  What was in Xen's dmesg
> did change slightly and looks likely better for my purposes.  Some more
> snippets from 4.17 Xen dmesg, with "x2apic_phys=true":
> 
> (XEN) AMD-Vi: IOMMU Extended Features:
> (XEN) - Peripheral Page Service Request
> (XEN) - x2APIC
> (XEN) - NX bit
> (XEN) - Guest APIC Physical Processor Interrupt
> (XEN) - Invalidate All Command
> (XEN) - Guest APIC
> (XEN) - Performance Counters
> (XEN) - Host Address Translation Size: 0x2
> (XEN) - Guest Address Translation Size: 0
> (XEN) - Guest CR3 Root Table Level: 0x1
> (XEN) - Maximum PASID: 0xf
> (XEN) - SMI Filter Register: 0x1
> (XEN) - SMI Filter Register Count: 0x1
> (XEN) - Guest Virtual APIC Modes: 0x1
> (XEN) - Dual PPR Log: 0x2
> (XEN) - Dual Event Log: 0x2
> (XEN) - Secure ATS
> (XEN) - User / Supervisor Page Protection
> (XEN) - Device Table Segmentation: 0x3
> (XEN) - PPR Log Overflow Early Warning
> (XEN) - PPR Automatic Response
> (XEN) - Memory Access Routing and Control: 0x1
> (XEN) - Block StopMark Message
> (XEN) - Performance Optimization
> (XEN) - MSI Capability MMIO Access
> (XEN) - Guest I/O Protection
> (XEN) - Enhanced PPR Handling
> (XEN) - Invalidate IOTLB Type
> (XEN) - VM Table Size: 0x2
> (XEN) - Guest Access Bit Update Disable
> (XEN) AMD-Vi: Disabled HAP memory map sharing with IOMMU
> (XEN) AMD-Vi: IOMMU 0 Enabled.
> 
> 
> (XEN) I/O virtualisation enabled
> (XEN)  - Dom0 mode: Relaxed
> (XEN) Interrupt remapping enabled
> (XEN) nr_sockets: 1
> (XEN) Enabled directed EOI with ioapic_ack_old on!
> (XEN) Enabling APIC mode:  Physical.  Using 2 I/O APICs
> (XEN) ENABLING IO-APIC IRQs
> (XEN)  -> Using old ACK method
> 
> 
> (XEN) SVM: Supported advanced features:
> (XEN)  - Nested Page Tables (NPT)
> (XEN)  - Last Branch Record (LBR) Virtualisation
> (XEN)  - Next-RIP Saved on #VMEXIT
> (XEN)  - VMCB Clean Bits
> (XEN)  - DecodeAssists
> (XEN)  - Virtual VMLOAD/VMSAVE
> (XEN)  - Virtual GIF
> (XEN)  - Pause-Intercept Filter
> (XEN)  - Pause-Intercept Filter Threshold
> (XEN)  - TSC Rate MSR
> (XEN)  - NPT Supervisor Shadow Stack
> (XEN)  - MSR_SPEC_CTRL virtualisation
> (XEN) HVM: SVM enabled
> 
> If I'm reading that correctly, everything is there for x2APIC.  As such
> there seem to be 1 or 2 bugs:
> 
> The definite bug is the x2apic_cluster APIC driver fails on recent AMD
> processors.
> 
> I'm unsure whether selecting the x2apic_cluster APIC driver is correct or
> not.  Capabilities you used to only find a multi-socket server
> motherboards are now being found on desktop motherboards.  My
> understanding is this processor does NUMA on a single die, not merely a
> single-socket.  As such it may well need the features of x2apic_cluster,
> perhaps the driver assumes nr_socket > 1 which is untrue here?

Just to answer this one (I don't think there's much more I can do at
this point, without further information): No, there certainly isn't
such an assumption. Iirc the x2APIC code also predates the existence
of the nr_sockets variable (and the respective log line) by quite a
bit.

Jan

> Does appear "x2apic_phys=true" plus "tsc_mode = 'always_emulate'" are
> adaquate workarounds all the way back to 4.14.  Now for the second
> correct bugfix.
> 
> 


