Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B7E561A6D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 14:37:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358489.587730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6tP5-0001UJ-ON; Thu, 30 Jun 2022 12:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358489.587730; Thu, 30 Jun 2022 12:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6tP5-0001Rh-Jp; Thu, 30 Jun 2022 12:36:15 +0000
Received: by outflank-mailman (input) for mailman id 358489;
 Thu, 30 Jun 2022 12:36:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bdU=XF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o6tP3-0001Qj-W2
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 12:36:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 377d9cf2-f871-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 14:36:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5216.eurprd04.prod.outlook.com (2603:10a6:803:5f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 12:36:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 12:36:06 +0000
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
X-Inumbo-ID: 377d9cf2-f871-11ec-bdce-3d151da133c5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQKQ/4CAzABtz9qO5jATMGChJxImiJAIyLWv1VRsGJRQMQ0QavcBQsQgU7NkDgSJwt78Ed9LvwnzD2VGyjs3U/u9x+tkk+/gTW8oy/yrerJiGWGuL7yHKbbaBrpQ+lH83EAPJAaIIFtS1WhOFmifxz0xLxEAg8ZWemO1Ngrj+30fajndi001M4E7wuEzjgcC9kdoCxRE+n3cr1Pwnf7+wOnbtkUblw1wSPevCfmECBgN8dMA+v+3oL+WWToKolzPXM8w6wa4EYrRFVHts2HiYmguAaT04obQ7B19LatPVK6NbJ6+LCaUl6jOWgdHoAgM2/MZ8M62OCL3yYvDjhWJ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3ScU5qTu5fIg3pdM6dsY8gOQ4Btdo3OCIM0d6ZRRGY=;
 b=k/y0HcDZLSdcQuFK2VJ6NNcmdlhyRY5xa29OFVN/1uzFegr2c6BgTtTgsq2Z2dxgaGxAJeHdNfCPusd0xYSyZKpdNy4xmnMhlYucKDcvd6nIpd1YY+Ndh/8FMjOnc9h0RcMTe1m2NsGWE0GKXdqmaBT0D638OH4uXbLXk1n/bXY1etOK7OBJ+LQt5YfmveyT5ra3c5bp11ghLjwlh0u+g6ulDwx6/XaQrKA8LDlYe3UKA1hKcnXAuMZJTDyUWJzfciRaXk6TWpwbAxABkdDa48/aoNqCMahZkljTfGLb8KL6gBm85bC4VjIr8yxTZmavXYUD68BIEHc4Zyo6UwgWQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3ScU5qTu5fIg3pdM6dsY8gOQ4Btdo3OCIM0d6ZRRGY=;
 b=EMI0YzBZ5E+lDjdTOK+W+rd4CD4zQhI9csuSCzlgcCQHSIoWldaF2sIKvqi2LkcTlWbDb1QorGSql3A8PhQAmeLvnxFdppfKLhnkctK8gUd+SyLam2Kq26u83BOL+8bHF5DLPc8xYA1piXxWzMRibJY10nOjTtbzR2fAaLE7PckL8qRHG0yY1m7CoZseknkpMg8E3AgWUFzT554xTyBdue8VNv9oAJZJCQRYSpu6Ncghgyv1eCdZZB1wgL07r3OAcDxTmoTZmdNXKmhCDdmRvH5lxMuMGGl5YMCgl5ZavDlvklsvFakhg2Jft6EJCg9R0rOao9owto45/u6HJdXlVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1d488f5d-bfd3-a816-dab1-515f49a57f67@suse.com>
Date: Thu, 30 Jun 2022 14:36:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <20220610055316.2197571-1-wei.chen@arm.com>
 <20220610055316.2197571-2-wei.chen@arm.com>
 <05dadcda-505d-d46a-776a-bb29b8915815@suse.com>
 <PAXPR08MB74205A192C0E6E2E4BDD64BB9EB49@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <8e44e765-c47f-4480-ee44-704ea13a170d@xen.org>
 <cd5d728c-a21e-780e-3b79-0cfb163eb824@suse.com>
 <a6844d62-c1aa-a29f-56ba-3556bc1d4dac@xen.org>
 <6e91d7d0-78d2-2eec-3b14-9aea00b2a028@suse.com>
 <bad83568-94c6-6d90-308b-ae9965f54754@suse.com>
 <PAXPR08MB7420AD8092F0FBA43C359DD19EBA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420AD8092F0FBA43C359DD19EBA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9552a6d3-6608-4b19-3369-08da5a951a15
X-MS-TrafficTypeDiagnostic: VI1PR04MB5216:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4fzDLyrQEbROXvo0vRKfw4PRLS2V7cIaelL2X83xfvsQkAIZf+H/Y13xXfAsoFaL0T/lVIF06lEaWsqkw/NuwimH6hxGD5DbqVt2GUQEbODi42CTzHaQcaPoOBJDGuFbn5KT/DbJ/KHAPzPk9iwm5Rtz6MzXY7hRBpmDV3VNl8/dqPRTLYMco+x2dQYs1V/U3aaZlXc0Y/P4Xw9r6A8bf5cK2lB8HLG9iy2UTi7dYYFyV3isEYHxaKeFF7gymJtx3tRERL3FEnt05x+Gm/GUI5y+u3c5PxIvRNZfzG+27uE8uao5VzNCXLglNp3oVLvhd9+Vay1QYm3HlVoeSo9iB771+6r1KfYAxqyfwz6bMuCv4kjm/SBLZ5vooQrhaMKUMXs6Eizq8nUG6DIutvvI6KsXIhgwICTPPguLcywXVbV4qb8Bvk619BnyHdkPAuLiPtPlhz9X3uxsmZOHpNu4Li/ywmZ0sltO8ogtI6fdUSWxMb+IOHMCR14pVQD5ZgJy2jqdiK6gm64ni23GoPVoaVaDwEmK6j2XPfx43dpCU7UcJ7WB8mpMNrvuT828mBtqjLBEAayI4TBbLlH+2rmLtLYiAd1ak3HZ3NcOyQHb5adkGfd8U1n+vZLEmUN5nuv5BBWNusE1M4145jOMGXFnEuWES5yPWue/SIkeTwd4ddEujq1QEtaWJTLhcwYkodaoZOo0KVQDW95Amdvp0+p3kJgRpxRXsg57fhK+bJhzU5BsPFqNc5ILwahWImYKvVMJUT+2Mae1JwmFKLSLw+U375o2owbjch9WeQfE57i+RO897piesCmdmoMJI9BMun96cETiXAZUKmwkxkhvijX9GEhCXkyPZbul16Hg23vhHXw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(346002)(396003)(376002)(316002)(66946007)(31686004)(8936002)(478600001)(186003)(2906002)(7416002)(2616005)(54906003)(6862004)(53546011)(38100700002)(31696002)(8676002)(6506007)(41300700001)(66556008)(5660300002)(86362001)(66476007)(6512007)(36756003)(26005)(6486002)(83380400001)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnNyckdxdldaSmZYWUJLRUp5L0pDNkhvazQ5RlkzdUJyZnpNVHVJYk8xcHZJ?=
 =?utf-8?B?eWRXaVpTMUtjeXJpZ1BmeVdNMW5JTXg2cnhWclFmK2FyeHVnYytUS2YzZDF1?=
 =?utf-8?B?ZmxaRXVaSEdjakYxMzJEL0srS01aMEtEOGkxVWw4VXhNK0RhWlBtT0FQWUZs?=
 =?utf-8?B?cFRSRm90RFB6eDEySFNqQ1dvYzUyQjg4RWFPemYyb012T2YzOWxtSEZqNDN6?=
 =?utf-8?B?V3FxTSt5U1doMkF3bVZMd3R5MURxSVYxNEFxL2ZPUjh1T2tqU0FLU0RwTUZD?=
 =?utf-8?B?WlQ5a0FLcjY0TklKbU5RU1NjMjhpUE1TM29KN29GdUR5WEFwS2NpU2dzNGFt?=
 =?utf-8?B?UFlHZ01nOVdUME80dnRmZXROUmNXYndrT0RqUTlZTFY4K1BsUFh4Q2crUWJT?=
 =?utf-8?B?ZFFJUE56emttZnpsWG5oemdLcjN4QkxnQVBCaE5ncUFkZURySFJKZDZTenNB?=
 =?utf-8?B?OU9SaXBLUTdnM0xWcitXQ3ltV1VXYVZMS0VpL05vSDBxY1ZuSnFIWjdEelow?=
 =?utf-8?B?TEFnWklJMTM2Y3UxZGZTR3Z6WEtOcE0rb3RNR3ZKQWltNERyQ1RCblB6bWtx?=
 =?utf-8?B?L3dMcEtVUXZxVXd2R1NyNXlzQ0JyRWoxY2dYWkx0VjRTMzRQeHV0TmJVaHN0?=
 =?utf-8?B?bkZONU9DUHoybTVoOTMyVTNtemZHeHlGQ1prWUpKNnFPdzBjQzQrZXR6VzRL?=
 =?utf-8?B?UU8yeDZHRFlwTG9Gc1ZEemZkYUNXdFVxdkNzTzg3OEw5eE92Z1dxWGYzRmFO?=
 =?utf-8?B?c1RQSjhrV1EzcGtpT3g0M0tiNmNINDQzUm85M3NkRnRoWFQvYTloL29Wbkdq?=
 =?utf-8?B?Q0dITWxLd1FNV3pZUlMrRDlLZ0Qxck9RMk1pRmhhdi9ZT1IwQ3hMVk04MXVh?=
 =?utf-8?B?LzZqd1BGTTZpazNkU0NtemN5SU5JenNMN0ZJZFpaaTdXN2pyUVFpUklVMm9J?=
 =?utf-8?B?eTZKQkhjK0UrL0Y1bGluN2lxaWZLWGNtanZadkYyZXhNQUJxRy91d3pxSHNo?=
 =?utf-8?B?d0oxaEdrY0JWMXlpKzhrSkdwQjBPaUlSeXRoRUlsZk5aNTRQNWEycGd5Mkdl?=
 =?utf-8?B?TjVqVE5IVmw3c3E0SVVGZ0ZQVmR1TldKYnd4TTJvSlMwbVdpSXc5N25rcmlo?=
 =?utf-8?B?aWVwb3VUMS9nZUVtWG1oeGVRcm9HZTQ3N2F6RHNLTUZTKzBCQUVUNnNiM09O?=
 =?utf-8?B?NGFxNDJjS1BXZERtOTd5NGlyQzRpK2hTTENabFNwV2JTcDF6ODNFUFRnNWNl?=
 =?utf-8?B?K2U3czNNS2FFdjZTaWpyT2dLZjQxVjlHZXlMN3N4cDNTUkQwdGdIelBYYVlO?=
 =?utf-8?B?aVc5S2NTbVBnQ2JKTUdIeUVSYjVMM0tzZFJzeDYyeEtRaEVuSE1xVUM3dWVH?=
 =?utf-8?B?SElaMlcxL25kbGIxSld1RzBnamx0dFFnMmFsN2RFZXVPMktvaGUrMkNhTHp0?=
 =?utf-8?B?OWJoUnp5akMxUDFrMFA1NkdvWWxiSlowbVVzaVRpOHh1L3lSaTY3QTVSamVN?=
 =?utf-8?B?TXBoUlFQZVJaZCtEUGYzRHdocWM4OXBJR3RFK0R5WStURXloNzQxdTJFU05s?=
 =?utf-8?B?cVA3MWZsWjR3L3U0M1o0djRhWkEzOC85dCtsalVIcW5JVk5CVnhIUk5yN01l?=
 =?utf-8?B?VVkrTVFjakFGbXplbUJ5ZytYcjFHdHRxbm93VUI0V0plRzdVOXRGSUxmRWNQ?=
 =?utf-8?B?NXlxWVVTWk9TM3NjU3I3TXkvdnQySUVIVkN3c1MzTTlqWit1RFFYWnMvRkNp?=
 =?utf-8?B?K3hRQTFOUmZkZE54cGNZcmRHZkZxeWt5dFo4clV3TU5vWFkzaUFOeHVzYXZv?=
 =?utf-8?B?MndpZTQ4RFFGMlNWWHRlZzZMZ2dwUElUY3VDb1BwMlFNb2V0NHBScEYzS1RC?=
 =?utf-8?B?c1R6VS9RZ0RTaDBJSDZpNjliWERzWHlaS3JVZW45V3VBaXl6ZXE1RC9Ub0Ra?=
 =?utf-8?B?eVJyTVhTaURlb1VJRVlTT0tzcmV1UjdvWFNxMyttWEVLZDMwWVBZNStDOFRH?=
 =?utf-8?B?RmpoNUZyZ3pGTVJ6VHM5Mmk5RXFqcXQ2RzNJRyt6bStzTGplV0hTOWVVMW1Q?=
 =?utf-8?B?cnV0OWE5SkVKYU5ubWJhcDZoYnE4dXFKSmZiM2FmMUova05JUlBzNWhYbWhx?=
 =?utf-8?Q?xc22iU6Sck8ZLLKbjt46TfJPa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9552a6d3-6608-4b19-3369-08da5a951a15
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 12:36:06.1820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jy9ez4ny/SASEUdkRr+d7JsyFTV6QbmCXjbiibxpDTBn3NmXFEA9A8jrvlcs6LSepa/wP51AAE0Z6WxBWtG7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5216

On 30.06.2022 13:25, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年6月24日 18:09
>>
>> On 24.06.2022 12:05, Jan Beulich wrote:
>>> On 24.06.2022 11:49, Julien Grall wrote:
>>>>>>>>> --- a/xen/arch/arm/efi/Makefile
>>>>>>>>> +++ b/xen/arch/arm/efi/Makefile
>>>>>>>>> @@ -1,4 +1,12 @@
>>>>>>>>>    include $(srctree)/common/efi/efi-common.mk
>>>>>>>>>
>>>>>>>>> +ifeq ($(CONFIG_ARM_EFI),y)
>>>>>>>>>    obj-y += $(EFIOBJ-y)
>>>>>>>>>    obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
>>>>>>>>> +else
>>>>>>>>> +# Add stub.o to EFIOBJ-y to re-use the clean-files in
>>>>>>>>> +# efi-common.mk. Otherwise the link of stub.c in arm/efi
>>>>>>>>> +# will not be cleaned in "make clean".
>>>>>>>>> +EFIOBJ-y += stub.o
>>>>>>>>> +obj-y += stub.o
>>>>>>>>> +endif
>>>>>>>>
>>>>>>>> This has caused
>>>>>>>>
>>>>>>>> ld: warning: arch/arm/efi/built_in.o uses 2-byte wchar_t yet the
>> output is
>>>>>>>> to use 4-byte wchar_t; use of wchar_t values across objects may
>> fail
>>>>>>>>
>>>>>>>> for the 32-bit Arm build that I keep doing every once in a while,
>> with
>>>>>>>> (if it matters) GNU ld 2.38. I guess you will want to consider
>> building
>>>>>>>> all of Xen with -fshort-wchar, or to avoid building stub.c with
>> that
>>>>>>>> option.
>>>>>>>>
>>>>>>>
>>>>>>> Thanks for pointing this out. I will try to use -fshort-wchar for
>> Arm32,
>>>>>>> if Arm maintainers agree.
>>>>>>
>>>>>> Looking at the code we don't seem to build Xen arm64 with -fshort-
>> wchar
>>>>>> (aside the EFI files). So it is not entirely clear why we would want
>> to
>>>>>> use -fshort-wchar for arm32.
>>>>>
>>>>> We don't use wchar_t outside of EFI code afaict. Hence to all other
>> code
>>>>> it should be benign whether -fshort-wchar is in use. So the suggestion
>>>>> to use the flag unilaterally on Arm32 is really just to silence the ld
>>>>> warning;
>>>>
>>>> Ok. This is odd. Why would ld warn on arm32 but not other arch?
>>>
>>> Arm32 embeds ABI information in a note section in each object file.
>>
>> Or a note-like one (just to avoid possible confusion); I think it's
>> ".ARM.attributes".
>>
>> Jan
>>
>>> The mismatch of the wchar_t part of this information is what causes
>>> ld to emit the warning.
>>>
>>>>> off the top of my head I can't see anything wrong with using
>>>>> the option also for Arm64 or even globally. Yet otoh we typically try
>> to
>>>>> not make changes for environments where they aren't really needed.
>>>>
>>>> I agree. If we need a workaround, then my preference would be to not
>>>> build stub.c with -fshort-wchar.
>>>
>>> This would need to be an Arm-special then, as on x86 it needs to be
>> built
>>> this way.
> 
> I have taken a look into this warning:
> This is because the "-fshort-wchar" flag causes GCC to generate
> code that is not binary compatible with code generated without
> that flag. Why this warning hasn't been triggered in Arm64 is
> because we don't use any wchar in Arm64 codes.

I don't think that's quite right - you actually say below that we
do use it there when interacting with UEFI. There's no warning
there solely because the information isn't embedded in the object
files there, from all I can tell.

> We are also not
> using wchar in Arm32 codes, but Arm32 will embed ABI information
> in ".ARM.attributes" section. This section stores some object
> file attributes, like ABI version, CPU arch and etc. And wchar
> size is described in this section by "Tag_ABI_PCS_wchar_t" too.
> Tag_ABI_PCS_wchar_t is 2 for object files with "-fshort-wchar",
> but for object files without "-fshort-wchar" is 4. Arm32 GCC
> ld will check this tag, and throw above warning when it finds
> the object files have different Tag_ABI_PCS_wchar_t values.
> 
> As gnu-efi-3.0 use the GCC option "-fshort-wchar" to force wchar
> to use short integers (2 bytes) instead of integers (4 bytes).
> We can't remove this option from x86 and Arm64, because they need
> to interact with EFI firmware. So I have to options:
> 1. Remove "-fshort-wchar" from efi-common.mk and add it back by
>    x86 and arm64's EFI Makefile
> 2. Add "-no-wchar-size-warning" to Arm32's linker flags
> 
> I personally prefer option#1, because Arm32 doesn't need to interact
> with EFI firmware, all it requires are some stub functions. And
> "-no-wchar-size-warning" may hide some warnings we should aware in
> future.

I don't mind #1, but I think your subsequently proposed #3 would be
the first thing to try. There may be caveats, so if that doesn't work
out I'd suggest falling back to #1. Albeit ideally the flag setting
wouldn't be moved back (it _is_ a common EFI thing, after all), but
rather Arm32 arranging for its addition to be suppressed.

Jan

