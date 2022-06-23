Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADD4557650
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 11:08:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354662.581892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4IpC-0008CG-Dm; Thu, 23 Jun 2022 09:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354662.581892; Thu, 23 Jun 2022 09:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4IpC-00089o-9y; Thu, 23 Jun 2022 09:08:30 +0000
Received: by outflank-mailman (input) for mailman id 354662;
 Thu, 23 Jun 2022 09:08:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4IpB-000897-1G
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 09:08:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b2bdc12-f2d4-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 11:08:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4283.eurprd04.prod.outlook.com (2603:10a6:5:27::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 09:08:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 09:08:24 +0000
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
X-Inumbo-ID: 0b2bdc12-f2d4-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wchljq4g7fLwLOj2nv9dEO9selWLxdoaEzSlGW3eZQn/n0UTcQ6ns7JWAuNqZ50t39XvG1+xOzeZye+tEbpcxreZJgKPdbCab2sEVVttoLSZl2SrjbF7ZsairdYIqvV63U54+cKArw0SgOUztUEhzxTasBfMCN0c6skMLzSvFSobWqwYN4bjdyjAZwdGKe0h3AuxCIpCu7J4Jzmh7wYJU3kOt700TypHQgyKy+n5PCW6UbOX+bm63ht48PtFebbdlIO7FGXaRGGlb9zkZI9x+r2mx+mtS6ffLuOZfOio/dkMnXQQPFjat5geCddOXV917f9o13lonR3M1PLzlOe1Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgNZsoGMltYHNDij42hj6kRqJvaS3/KPArB/mqwR9T0=;
 b=KmGDTDDy2kllGVpLHe/dz/QINlhPSXExSBTOTt8WLQs+AvTsOGXvglppyaxDI6xF85A1UtdTdBeYKWfDZiUjhCWqbbbRS5zNf5b2QxItPHVi9S4jflH4L1jHXEKFttJaBf7vyIe2l3f2Ul2WnZQZp3yiDMXHANLm9jc/twZRNk4IHK5/1/f96V4O/XNGouBnsP5kYww+EetM0XLPZhdtLEkHXyhIyrmSCGNh3RAb+dGxKOqu9CRinnTRC6eKmNfPgHZXKohMETPz+bqxJ5qyk/TNyx6v26T33PR/yhAPpTZI/R4ycsw7y4KdbcBlREShRLSuaza/bCI3AZ4n100A2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgNZsoGMltYHNDij42hj6kRqJvaS3/KPArB/mqwR9T0=;
 b=m53wV/CUluAe+TVNii9QNTLzF2EWIIaiHMz31XkRf+knqN7SAQ2oRO/Hinj8MCplCjRC71Q3luWlg+drT6x3bTfwPKAq96Exsq+Usl5Mtb/Go1chUBFeMf3sHSiuZ3pUvV6miQ/15sUbsNDfHAADNxqP2KpdNxX0MTmcOMC2JSYiYK/CkfsLcM+aBt1DgsBrdgOpEhe9DEbnDAdHKKJTMd3nxYXKLEah4LkwgeAni50+yN5NH11yzp0JN5s57okuCpqN+ugFgb6FATlpgJ+2LUpoGSGECqgvxZLHK8ZvRXY1fCWhcrQwleGKxiazXl0pLs7x+LxUbuBJtEAz4p9Jsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03ba839e-4249-b18b-81bf-86b98cb319b5@suse.com>
Date: Thu, 23 Jun 2022 11:08:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Problem loading linux 5.19 as PV dom0
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5c396832-3102-ff5b-c198-c037ee87d83f@suse.com>
 <922ee651-c211-6e46-7986-6d0f74164e57@suse.com>
 <b74d7347-113b-c608-1346-8f75f1a77cb9@suse.com>
 <53bb13f6-04ec-0ed0-2c19-9c7947654989@suse.com>
 <17124274-05e5-52c4-5505-9de9ad95db55@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <17124274-05e5-52c4-5505-9de9ad95db55@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0007.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 353d2e0f-8953-48ad-3dce-08da54f7ed39
X-MS-TrafficTypeDiagnostic: DB7PR04MB4283:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4283A898AC66EB4F47F3A31FB3B59@DB7PR04MB4283.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k1BI+1gu3l0vFPbaPTCS9UxZCzYAZ82pkWq/AdoSqvv2OXiAxwi0W4tP7R7eumpPPDY3hu4tnDmK4NuDP67qFLKNKzXXoXgeW6GupPuCxOLD3VMpoCLAMn8KoF0lv68L7lRPfAO9pgq0kPO73tmjsRzyR/VXJvHTundGo5JUu1g1RkbyKvchXcLfrv2eFbFQCScmMFdy/AeEeVNoJ2FfFBqHOHPBTHNWAzDSnjRpkneHLB6Sf2TqB5ne2RwMzM8QTnd34WHDZN8Cec+cNpJEqMIjYCa4i6bydTbjaW1SEhQvnUgFKCUm2SGcs/GRdNfRNmNyl5F3fFOSDaUIVm8KznhM5/istKsUTymC2JYdidwy+HkHq6uGn3vN1/tHVxgv2r04mPi9gqGvWVkOy+sb/lqre2fTRit228MwSbFA0NNsbK6rsWHuNOOOLSgyAvFGFwwEsZqMWsCJEMM8TP67x5qTdBryoqgVya1uVvQKHhYW7cmjeLG9R4xMn4tbRORI4vQsX07CBe6M8RCuuDm5BIbxTZYQU0kT2x2+9Hnwl4IsdLWiKkBFmwXh5+5zXcwTNUm9fJokmaRLwA0L/xOW2+7ElNyInrW0SopLHVMw3o4lq88TvaQYPSgIiGU2foPgitKe0/xUvvVuLjRES0es0jXGlxplMxrqp0PR7fihTQ2LpH47YCb990urNKj9ioF1pAxkEFm6vWpubYuXnKahOYT5rZUcKOinXWu3n/frbQzbYrFx6KHsVfHy19QE3dN529mVEFomc0H6dvNZQtW6G3vrHVVoFhcYiUR6IfwzHyo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(136003)(39860400002)(396003)(366004)(41300700001)(6636002)(36756003)(2616005)(186003)(2906002)(66476007)(31686004)(83380400001)(37006003)(316002)(31696002)(5660300002)(4326008)(6506007)(8676002)(66946007)(53546011)(38100700002)(66556008)(478600001)(6486002)(86362001)(6512007)(26005)(8936002)(6862004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1dFSUl6WVlCaVh4bDVicTJZM3I0NTlEM1RYQmFySWUramNGNWF4dFJmdm15?=
 =?utf-8?B?QjJNanFyU2MwaURtdFgrcVFveU5wSm5ocVhnTDFaOFZoTEFpa1MxSStDS3VN?=
 =?utf-8?B?TzNpazY2ZmZPeXd5cmNhR3hnU1o1b3kyK0ltbWhMeUU0Q0ZMak9qVGpYdGdp?=
 =?utf-8?B?d2kyNFJqMmJyNjUweEVuMUxwZElpNWg1R1VWRkVQK21YaXAzTkJ1RXZvRDhI?=
 =?utf-8?B?ZmdENDhrZklUeUYxSGNNa0FvZnJzbmlEV05jeXRTZDZpNEhSMDZZdDNaR2Qy?=
 =?utf-8?B?YVdRNW1sNEhJdEFPdy9CWjIxWk41NHIzL2Uwb1RaQU9EWVF6ak1kZ05ON2NU?=
 =?utf-8?B?T1RMWVRKTmdGR1JES2xIT2ROREJmbVdHck12bHM1YWRQai9vVUJSeTBZS2V3?=
 =?utf-8?B?Sm9TcGl1eWRZd3hWRW9jWXc2eUt1c0ViN05yT2xyQzBQeldUZ2FoeGtseStY?=
 =?utf-8?B?ZWJuZ2ZKcTVqT1UrdFBlMTRjbVNyR2xud3lYV1BuQWJBN1g0TnR1aU01c1h1?=
 =?utf-8?B?eHJKOHd4b1gvZUl4dEZRdTdrRm9yNm51RHl6dUhEMTZnVjE1M25CLzNRZll2?=
 =?utf-8?B?OTN3RFczTkxEQm5CTHFXLzRoZlBZaVkxbEJNVTRwODJkZ2tQeFpZU3NBc29W?=
 =?utf-8?B?WlJLT2xPV0Qrc1JqRTdCbjNPSVE2NmJrVjFiZFBYY0JtWk5KdHZlUDljT0dZ?=
 =?utf-8?B?bm0zaXhPczdJSFB1MzJqcllHODYvL0VPTjdiSjJVWVpyQktZL1IyRFFCZlNm?=
 =?utf-8?B?RGdOcU9VK0FHWTNuQTQ1RDJ2bXY0UmQ1Qms0ZGgwMGVNWTlKK2E1R2h2S2Jo?=
 =?utf-8?B?K1pGNThjZkw1MlNPR3M2L3FRdkpGeGwyZmRacVBJRjg3Mi83SWE2UzJiUVpW?=
 =?utf-8?B?bU1kcC9pWWhyUzY0S2lUL043cDhHVzBudUVncklndUhHa0V2bVpEU3grK1Uz?=
 =?utf-8?B?d2tMcWE4ZHhTaUhOY0tLc0hOdTJ0bnR0ZGM0SFY0WWF4Nnp2UVBha0ZpdU41?=
 =?utf-8?B?RytHTHpDaE83TDFzL2x5UU1ud2dSdkJVRjdndGJ1Ty9YL2d2VHZOZysrOVRJ?=
 =?utf-8?B?WTcyRVVUaFI3NkJJeEFReVB6WUFvTHczUHJYTmp0MXM4aVBxdjYzR3ROcHhI?=
 =?utf-8?B?N1BmUjBXajRqOHJ6NGR0NTJvcjZWdnUxVmY5NW1DK3dWcmM1WnZkY2Rpc2tH?=
 =?utf-8?B?Yk14S2d1amtaN0d1UVdvYU9meXJodldKNXJpZ2tIZXFPby93VUtWV2JvanBm?=
 =?utf-8?B?Wi9DS204UVdBU0JDdkdLbXMvejg5NkUybHZVYlBPRGRidjNlM1JES04vNU56?=
 =?utf-8?B?Smk5eUxUVHdwejN0TGJZdmpHb2NkeHhTKzJySkk2K2RVa1REUHhiODdYMlJW?=
 =?utf-8?B?RWFuNDJjc2NtckVFWUhzNlBIY2VxTTBjRk1XV3N4Y1pRc1pQaWVXaUQ0TDlt?=
 =?utf-8?B?V08vWXlrd2VlS0xURXBMRXpRZmxGTE94MHU1WlE0aWhFVCtEYVUwRHNqSHhJ?=
 =?utf-8?B?cjJvYkM0SUxCTlhzVjZ4TjJPdUlZbkhpcjFRR21jcndWaUFwZDUxaytpYWRO?=
 =?utf-8?B?cWZHQ3llaVQyYXhNa29PcWtVZUMyejdyK3Yra1JoeUpFRnNpK3BPeHJSU25E?=
 =?utf-8?B?dmlVSnhKUmRub2tpTklpWG56SW9KTXRHekFOMjVXSmFNcWZaRlZtbG9DWGYz?=
 =?utf-8?B?Yzh2UWQ0bEpIaFI4YTBPL0lNV2NpYmxMOXc2T0hPNWFJY0ovVXVjTmJSZHA5?=
 =?utf-8?B?RDgrelpDeFdSTXFRSzdGRjBoZDA4YzZ5Y3VzSmFMSk5ObGZGT0ppYzIwNCta?=
 =?utf-8?B?bVNncXcyK0VUMXVGTzU0UVBrSnZxZFhnQUNKNTFTd2VNOVUzTnhZaVlLNVM0?=
 =?utf-8?B?U3hIRk01blNIUTYxVjZXWWFtRnVsN2d6RnNzRVNteWNLZXV1OHZsNUxyMjhw?=
 =?utf-8?B?TmlKQWtIUTN2TnBzb0ZYbENGdE5CYy9FdndHVVJ0WDdmVjVrYllnSytFbURF?=
 =?utf-8?B?eVB5cFlzNytNTFB5Ni9wcFRnbHhMVjlNZUdKMThwcEdGbFRQWmNhNkh2bk5T?=
 =?utf-8?B?djF5NUdKemxkbkt3cW1ZV3hUQ0Q3T1JFVytjRnhPV28wY2pOeXh5QlNlNW9o?=
 =?utf-8?Q?n5Wouixk+69vea+R3WLdeoPkE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 353d2e0f-8953-48ad-3dce-08da54f7ed39
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 09:08:24.1359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rIU3SlBjyXSuiU9q/0IGNtC5Go1E4u5fH9QxyQy85onc4HrSl7Q0T8TwPV7iLFfOK3pkHTC3kf45YmeUP+5IlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4283

On 23.06.2022 11:01, Juergen Gross wrote:
> On 23.06.22 10:47, Jan Beulich wrote:
>> On 23.06.2022 10:06, Juergen Gross wrote:
>>> On 23.06.22 09:55, Jan Beulich wrote:
>>>> On 22.06.2022 18:06, Juergen Gross wrote:
>>>>> A Linux kernel 5.19 can only be loaded as dom0, if it has been
>>>>> built with CONFIG_AMD_MEM_ENCRYPT enabled. This is due to the
>>>>> fact that otherwise the (relevant) last section of the built
>>>>> kernel has the NOLOAD flag set (it is still marked with
>>>>> SHF_ALLOC).
>>>>>
>>>>> I think at least the hypervisor needs to be changed to support
>>>>> this layout. Otherwise it will put the initial page tables for
>>>>> dom0 at the same position as this last section, leading to
>>>>> early crashes.
>>>>
>>>> Isn't Xen using the bzImage header there, rather than any ELF
>>>> one? In which case it would matter how the NOLOAD section is
>>>
>>> For a PV kernel? No, I don't think so.
>>
>> Actually it's a mix (and the same for PV and PVH) - the bzImage
>> header is parsed to get at the embedded ELF header. XenoLinux was
>> what would/could be loaded as plain ELF.
>>
>>>> actually represented in that header. Can you provide a dump (or
>>>> binary representation) of both headers?
>>>
>>> Program Header:
>>>       LOAD off    0x0000000000200000 vaddr 0xffffffff81000000 paddr
>>> 0x0000000001000000 align 2**21
>>>            filesz 0x000000000145e114 memsz 0x000000000145e114 flags r-x
>>>       LOAD off    0x0000000001800000 vaddr 0xffffffff82600000 paddr
>>> 0x0000000002600000 align 2**21
>>>            filesz 0x00000000006b7000 memsz 0x00000000006b7000 flags rw-
>>>       LOAD off    0x0000000002000000 vaddr 0x0000000000000000 paddr
>>> 0x0000000002cb7000 align 2**21
>>>            filesz 0x00000000000312a8 memsz 0x00000000000312a8 flags rw-
>>>       LOAD off    0x00000000020e9000 vaddr 0xffffffff82ce9000 paddr
>>> 0x0000000002ce9000 align 2**21
>>>            filesz 0x00000000001fd000 memsz 0x0000000000317000 flags rwx
>>
>> 20e9000 + 317000 = 240000
>>
>>>       NOTE off    0x000000000165df10 vaddr 0xffffffff8245df10 paddr
>>> 0x000000000245df10 align 2**2
>>>            filesz 0x0000000000000204 memsz 0x0000000000000204 flags ---
>>>
>>>
>>> Sections:
>>> Idx Name          Size      VMA               LMA               File off  Algn
>>> ...
>>>    30 .smp_locks    00009000  ffffffff82edc000  0000000002edc000  022dc000  2**2
>>>                     CONTENTS, ALLOC, LOAD, READONLY, DATA
>>>    31 .data_nosave  00001000  ffffffff82ee5000  0000000002ee5000  022e5000  2**2
>>>                     CONTENTS, ALLOC, LOAD, DATA
>>>    32 .bss          0011a000  ffffffff82ee6000  0000000002ee6000  022e6000  2**12
>>>                     ALLOC
>>
>> 2ee6000 + 11a000 = 240000
>>
>>>    33 .brk          00026000  ffffffff83000000  ffffffff83000000  00000000  2**0
>>>                     ALLOC
>>
>> This space isn't covered by any program header. Which in turn may be a
>> result of its LMA matching its VMA, unlike for all other sections.
>> Looks like a linker script or linker issue to me: While ...
>>
>>> And the related linker script part:
>>>
>>>           __end_of_kernel_reserve = .;
>>>
>>>           . = ALIGN(PAGE_SIZE);
>>>           .brk (NOLOAD) : AT(ADDR(.brk) - LOAD_OFFSET) {
>>
>> ... this AT() looks correct to me, I'm uncertain of the use of NOLOAD.
>> Note that .bss doesn't have NOLOAD, matching the vast majority of the
>> linker scripts ld itself has.
> 
> Yeah, but the filesz and memsz values of the .bss related program header
> differ a lot (basically by the .bss size plus some alignment),

That's the very nature of .bss - no data to be loaded from the file.

> and the
> .bss section flags clearly say that its attributes match those of .brk.
> 
> I'm not sure why the linker wouldn't add .brk to the same pgrogram
> header entry as .bss, but maybe that is some .bss special handling.

I don't know either, but I suspect this to be an effect of using NOLOAD
(without meaning to decide yet whether it's a wrong use of the
attribute or bad handling of it in ld).

> In the end I think this might be a linker issue, but even in this case
> we should really consider to handle it, as otherwise we'd just say
> "hey, due to a linker problem we don't support Linux 5.19 in PV mode".
> 
> In the end we can't control which linker versions are used to link
> the kernel.

Right, but the workaround for such a linker issue (if any) would better
live in Linux 5.19.

Jan

