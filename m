Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FD672BC3C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 11:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546936.854043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8doP-0007FP-TV; Mon, 12 Jun 2023 09:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546936.854043; Mon, 12 Jun 2023 09:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8doP-0007DI-Qp; Mon, 12 Jun 2023 09:26:09 +0000
Received: by outflank-mailman (input) for mailman id 546936;
 Mon, 12 Jun 2023 09:26:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8doO-0007DC-NX
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 09:26:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2667ec73-0903-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 11:26:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7303.eurprd04.prod.outlook.com (2603:10a6:10:1af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 09:26:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 09:26:00 +0000
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
X-Inumbo-ID: 2667ec73-0903-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhBqQycalWoTjMl/RkmpdQWBvnqa9nCA/PHJrpIppyYvBaaI+0gyuyv2QB7/QmOIKUdfFxRlSWVEKzWFy4ZekYscxtXMQ0pGVYImfcl9mTIiRAuhGTySSGNmq/M7GwTnDioYSKrKq4iLTb26UmYwlduE39jxdAYl775g2P1oaQYhxPFkoxcKQhlPJ7tMhCa/MsyXNpcU5CLlrvxP4v9rFqTQh6yR8fb4y8HKvBDkHrwohARObBdGrNutdfkByEa1jyxPnLiCrjDYpHnZThjS8FmVcTR2BVOhPYqWGCqRYeeNYqjfFa2FYVm5Dzrnk6ihK1eiJlCtfO1m0YiGyBShTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09BtDNx9UzmBRFXX+TSgglDM/+A7VvsneM5XpypdoZ0=;
 b=guSXo+/Z8VQYkAvj5AC7qrt/s45HQEMwhVN603ooFO3xMcirteRcCouOj5juUPDqRfg9yxbAZtwzGbyavffcqnhIgRZA7h8B113tpVzGSvv0J6D/vrZ5lmLkZnF7tOHKGGbHN1ssCXBriok2oUuLpLFbrJggmZX7WkS6SedEHOsAZOvEKfX6yh4kfI7IGi7fpK7qzjqnpeJouFgZuoKZenrxJejIlvKgjOUdSt8s1K0gWYcE+I0bom86fMJovGefY3qQ1XJrcY/O9NgVI6WPoiu+Y961W+LCVzFiNCa2nhDeFIL/NzMcUie74Ow65Lt0Qe3kCH6ZhLnIyyfmt7UDLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09BtDNx9UzmBRFXX+TSgglDM/+A7VvsneM5XpypdoZ0=;
 b=DvwKeTzoUvmK52gg13qswTwQBBLLepObeFxgMPgWP5rcsJqhcZ5ybOlyaS7Q4T4i7OS8ihjnZznERML6WKMxCA8Uxm7pL6eRWPRsi8EziuvyUTfpqgkvSl0qV5WtfyykomPaplMKtyi7JjCSRS0+88KfbU/yRMd6GC21LdM3E4OmU6RjWki51rThI1JUadJjhr6YdvyjQQlYDAgYdA1VUZqLtv4/SmSLl+5NBFJIJNDiFP/pRN6LWfJAzFnl416fYKkUeiwEbJSEPh1co2GeinoS5gs+Oxwb8OMYN2Q+za0VJqglv8TYYthNJT9JgKxVc68PDuai6R3RDeKKJoY6xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d5f7f02e-44ec-e797-641f-ae737d52ba30@suse.com>
Date: Mon, 12 Jun 2023 11:25:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] docs/misra: new rules addition
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: julien@xen.org, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20230607013810.3385316-1-sstabellini@kernel.org>
 <955f134b-75b8-f8a4-2e02-ae6def536ffb@suse.com>
 <alpine.DEB.2.22.394.2306071430160.3567387@ubuntu-linux-20-04-desktop>
 <ecf1fa52-5a78-8f56-6a9c-8f6b2d3119b2@bugseng.com>
 <6a8f2634-8580-e757-c57e-821387642fdc@suse.com>
 <a73f31d8-3e67-600a-6255-61f19aef1bc2@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a73f31d8-3e67-600a-6255-61f19aef1bc2@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dfacae3-4771-479b-4c88-08db6b2708fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xKvwf60Bb/d8p8JmK5HzVoc6Es4gY0uYFXSeU2JsCR6LzxyVRyyaZkKm++1eFoiO73ZI7LXxISSa8NUUciH8KODd0oglatcM6nWl1feNn7OjtgOHFpow3dtcOm/VqSNGhCSz6q2tnjM3eYakxp8wKlTLkdwrvXRvvzZ/9bwwrWXZeRDLWTyl/iytKIVKLgpyaDh1/boqmuWlIrxobpm3X3+LfmY9AhjMX2IsUFaJPSGu5zWAWSNSXfU9yiNMgQIE5Aq5xyT1oHQpeUes5w1ee/hRNvJTJXhity3tTeje7ujL63BYnKMxglEyv9KZZ2PmLyDei84ITHX372GSJbGFY9IBMJoQL/3MQ1rIXgZzLMJ0/YddCvMB2BKS3VqsiIRqm405gjA+72uO+OPRjvLcbUffQxUSiDoVxiR1T9WBMb5azZiHbU0nYryyH9jBPu9bDiGzoziDS7VyRcPVm01PkeHD5kVvrt3iFM1Bgnf9TO+OlTwyNFp7MRg2rdSE5Hs7FeFMoyp641wmyS7ZFLTuq2REYkIm2Zp+DFJC+Y8LQL45mt/2534yKvSCmB/azx1Eg5KOa3b1HYZZ5OaYtWF2t2lDAujp2u4x/v4oJ2o79yszOvA+awjSxrg49s9ty/OlYcs28ibEQhvOPG/CeUkeGA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(39850400004)(376002)(346002)(451199021)(31686004)(6916009)(66946007)(4326008)(66476007)(66556008)(36756003)(186003)(478600001)(2616005)(2906002)(66899021)(54906003)(8676002)(316002)(41300700001)(31696002)(86362001)(6486002)(6506007)(53546011)(8936002)(83380400001)(5660300002)(26005)(38100700002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkNCKzg2V256QW4xQWZlbllFSmVoL0Vvd1QwZmZ5N0Y1bFV3dlU3ak5Pams4?=
 =?utf-8?B?bVJtY2x6Y0xuWXkxdERFZnNTbWFoK3M5Zmg1aEtOc1VsWUlFMlRnenk0aFNj?=
 =?utf-8?B?Q1BOd1lqb1RKdUVmbDJCNGw3MTFiM2pYL0xUdHlLYjFWWWVYY1J5Wmh5cTM0?=
 =?utf-8?B?Q2ZGTmFkQU04WGpaMXRPeCtGRHRXdzE4MDZvL1RHZHhxRnFLS1hUdkZJYnFH?=
 =?utf-8?B?ZmtaZHU1dE9BRWdOaTFvREloNmVLL2xmVC9qTDJoLysxR2pibFpGVUZDL1Bs?=
 =?utf-8?B?V3pkeG15cWlpRVFlTHVSK2JaQXdEbWQ2MlRBenJOUVdnTURjdlQrZ1A5UlJF?=
 =?utf-8?B?SnhnUmJKZEhHZ2Jkd0Z6MkJaenJZL29USU5LcStBdWM4Z29yY1BxUXh1S0dH?=
 =?utf-8?B?TDB0Q214azZuaGdlVnhxZmFPYzJvdmZTdm0wa0VNTkpsbk14NVJtaXdSb3c4?=
 =?utf-8?B?MXdKS0J5Qlc5T2hTT2p0VEpqdG9UTlVYajltL09zQlM0QWp4dVIyRTJRZXEz?=
 =?utf-8?B?enptTE1XU0d1YWxJTzBWdm10a0tUMmlJM0F0L1dLd3ZnbkRac1ZvNVcyY05V?=
 =?utf-8?B?Q1ZlR3MwUVdUT0VZaDRHRktBMnU1Z21laXFRR3QreTRtZWtEQmMvOHJTbGJ6?=
 =?utf-8?B?eTc5RisvU2xLZFFTS3lqUnB5UTZlbTlIMm91d3ZGNEVyeHBFQ0I5UWVNY1Fi?=
 =?utf-8?B?WTkrRHZ0RFN4aXJaZ1lUcVFiZERZR2R3UVRzTUtmNmE3OFFBajFaSTZ2WDl5?=
 =?utf-8?B?ZWwyY0QwcWhQNHl4VHlDUHBGVnljMGptM1hxOWVBdmk2OVJtZTVMTGtpOUhv?=
 =?utf-8?B?RXZPYzRkVzZWQ25rZHJvUzRHMm9aaWpqbmcyYkhLU3EwcEVkZ0UweUtFa1U3?=
 =?utf-8?B?WHBaY01IeGpKdTNOREZBamZQc1d3d1h2UEJQcVBWZmhUYlBRSzlqVzhGSUZE?=
 =?utf-8?B?SjRTNlZVekQyalRaMDJqbE5QeHJ6SlVScmhyejZ0eHlwVE5aa0xoVDZ1aVlI?=
 =?utf-8?B?SVdnWStWRXJHY3JTNHRhK2lxMmNDNnRUR1pETHhidnREWEJIRnZHNS9UNmNn?=
 =?utf-8?B?QlBaQmd5M2VLUnFncXNwZU5YeWh4dHFmcU5SNWhnQ3dBQzkvaHpOS2MycSs2?=
 =?utf-8?B?WkNteTZDRGJrbG4xR0YvWHU2U3p2TmRMOGRIRmwzeDU5UFdBL1NoaTBJZmhm?=
 =?utf-8?B?Mk15TWJ1RWEycEIyY3dod1Q2ZjA2V3gxTFFJNXRlZFZhUjNpbkl5SVNBejEx?=
 =?utf-8?B?NE1HZkRSSGV4NFJnRldxZ3RGeGtIMU1JOGFpMWtSMW11NVZzZ1o4VStNZWFT?=
 =?utf-8?B?ZUV2MDg5YlFpM1Z3akdHMmVtTjNZd0lvZUNXYlU1MzllL2ZjdUlyVE05QXJI?=
 =?utf-8?B?WWU4RXhnOVBlc2RQZURtNFZOZjlkajVMeUVhTTJiZUdUc1RXOSsreHl1LzBk?=
 =?utf-8?B?WUlGc0UwSkI2TDhwa3BuSG9JV3FjUkN1bC9LYnlOWjM0NXpRNVgvSnl2S3hr?=
 =?utf-8?B?Zy9pZUxKdi9EM1V0ekZoWThZY0IzZXJnMUZYSklTZGNXMWdqK3RtUVF6YXpI?=
 =?utf-8?B?QmQzeGluNXBkOVp4a0ZReWhxekNYVllHL3dJemRUc1Jxa3hreGVHYzFOL3ZZ?=
 =?utf-8?B?bkpJb2xoMEpTVTMvVUFoYjhPaWhuKzZrVDQybUlvdHJITG5XM28xRW5LdGM0?=
 =?utf-8?B?SmM2YVAzbmJ2TFQ3a21jdkRjYUlTQXJIdk9zRmdJT0RmWUV5RVdYcW5FZE11?=
 =?utf-8?B?NFZQdTVMc0VzU2F3UHVUVEJtd1NjSlJma3ZwWXpQaVBzYlZoaGhuSGRWYzNz?=
 =?utf-8?B?ekN1L0E4T21vOE84cG9SdUZ4UGpRa1dLMXRobjllbnp2bFhhb24xWkZZWXNQ?=
 =?utf-8?B?QkxwQ2JZd29aUUg0WmloQ1lEMGppbkNZQ1JTb0IwM29VbCtwZmdteXgrRG1C?=
 =?utf-8?B?aW9iYVlWNER6QTBCdDF2TWhCdExFYkU1T1JPOCs0bWU5UWg2ZGl6NnpUTFVu?=
 =?utf-8?B?dVZMZE5ZbHljQjNkK2haZ01kcmtXRFdxa1BSQkZlOXROYzd2Nm9iQ2s5am9O?=
 =?utf-8?B?YkkrL2xGNGhSSmplbSsxc3JCWC9Ycjkxa005dTBOUlJXYzRWNTRlL3FJNGxy?=
 =?utf-8?Q?W5JF1PJQu9TnaC9zR0VgLiDZd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dfacae3-4771-479b-4c88-08db6b2708fc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 09:26:00.3012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: is9hc3HscUuo8SR1ASqFTiD8vPKyYS5VljvN8SNC+Auga9Pxy2N3cvC6KCSl36hgDZ9rv8ZhS95E6wyG6s8plw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7303

On 12.06.2023 10:58, Roberto Bagnara wrote:
> On 09/06/23 10:46, Jan Beulich wrote:
>> On 08.06.2023 13:02, Roberto Bagnara wrote:
>>> On 07/06/23 23:53, Stefano Stabellini wrote:
>>>> On Wed, 7 Jun 2023, Jan Beulich wrote:
>>>>>> +   * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
>>>>>> +     - Required
>>>>>> +     - A typedef name shall be a unique identifier
>>>>>> +     -
>>>>>
>>>>> Considering that the rule requires uniqueness across the entire code
>>>>> base (and hence precludes e.g. two functions having identically named
>>>>> local typedefs), I'm a little puzzled this was adopted. I for one
>>>>> question that a use like the one mentioned is really at risk of being
>>>>> confusing. Instead I think that the need to change at least one of
>>>>> the names is at risk of making the code less readable then, even if
>>>>> ever so slightly. (All of this said - I don't know if we have any
>>>>> violations of this rule.)
>>>>
>>>> I don't think we have many local typedefs and I think we have only few
>>>> violations if I remember right. I'll let Roberto confirm how many. This
>>>> rule was considered not a difficult rule (some difficult rules were
>>>> found, namely 2.1, 5.5 and 7.4.)
>>>
>>> There currently are 30 violations for ARM64:
>>>
>>> - some involve a typedef module_name (in the call it was said this should
>>>     be renamed module_name_t, which will solve the issue);
>>> - most concern repeated typedefs (UINT64 and similar) which are repeated
>>>     in xen/arch/arm/include/asm/arm64/efibind.h
>>>     and xen/include/acpi/actypes.h
>>> - ret_t and phys_addr_t are also redefined in a couple of places.
>>>
>>> There are 90 violations for X86_64, for the same reasons, plus
>>>
>>> - another set of typedefs for basic types (such as u8);
>>> - repeated typedefs for things like guest_l1e_t in the same header file:
>>>
>>> xen/arch/x86/include/asm/guest_pt.h:60.39-60.49:
>>> for program `xen/.xen-syms.0', the identifier for typedef `guest_l1e_t' is reused
>>> xen/arch/x86/include/asm/guest_pt.h:128.22-128.32:
>>> for program `xen/.xen-syms.0', the identifier for typedef `guest_l1e_t' is reused
>>>
>>> The indicated lines read as follows:
>>>
>>> typedef struct { guest_intpte_t l1; } guest_l1e_t;
>>> typedef l1_pgentry_t guest_l1e_t;
>>
>> So this is an example where I don't think we can sensibly do away with the
>> re-use of the same typedef name: We use it so we can build the same source
>> files multiple ways, dealing with different paging modes guests may be in.
> 
> Typedefs being used this way can be deviated with tool configuration.
> Here is a list of candidates for that treatment:
> 
> guest_intpte_t
> guest_l1e_t
> guest_l2e_t
> ret_
> 
> I am not sure about the latter.  Please let me know if this is what
> you would prefer and possible additions to/removals from the above list.

Well, if deviating such is possible despite their extended use (in certain
places), then fine. I was afraid that a deviation with such wide a scope
might be hard to justify.

Jan

