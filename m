Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAA56488D9
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 20:12:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458188.716069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3ilg-0008GJ-1F; Fri, 09 Dec 2022 19:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458188.716069; Fri, 09 Dec 2022 19:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3ilf-0008Do-UO; Fri, 09 Dec 2022 19:10:43 +0000
Received: by outflank-mailman (input) for mailman id 458188;
 Fri, 09 Dec 2022 19:10:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z6kw=4H=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p3ile-0008Di-35
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 19:10:42 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2086.outbound.protection.outlook.com [40.107.212.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a2ff57d-77f5-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 20:10:38 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SJ2PR12MB7919.namprd12.prod.outlook.com (2603:10b6:a03:4cc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 19:10:32 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c%5]) with mapi id 15.20.5880.018; Fri, 9 Dec 2022
 19:10:32 +0000
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
X-Inumbo-ID: 2a2ff57d-77f5-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2wgI55YptvlTLIfHOJWiiIni+KhDdNj9uq2trJbvE7bAFUoMpBDZ/phX2afjcrZjePT115L08/J3lgv4ea4w4YT54UZyfPUaHR9/QvKd3Sey8zFR1hAlUHcnLi8/9dkCAPZ6v1wIDJi6sEc3TyhyH/s7F++p0PhATa7c58PDcufiy3oYlVqPdemkeF9vXlM6JL0a7BKRl7OMEgwp33brH1nwxK1Q1oWA22+fNTgNpUXDyHwfJtKBOrsmSLZBfwBW88BanOVHZedtvNzzOpYwJN3DemdAwktpTSRzLv5DHfIk/6hJcVjxRYl5HRBLA2njg53Gc2RUQ7np5eHF9ep0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSkNWcIjT6t8LH090uQfgDrDcnv3CoYucWPwnBK51G4=;
 b=gkLoIT9ivFfGa+inGoayI+76r6AGjouqFzY3khVWBlyns9K1tMWGXcBJ3sg1G0iJNHsw8gTd9QKWwhborzTVEQib0D94yEtF4HW5IyaNeFz7wUQhQ/GJqWk0lCPKNQAz6KbEuE1tXHrvPTPhzevydoQk/ekGs9mukybButGzyNn2CFVdrgslk3tlAqsOyEhsBfnXGmDhT3xlx3Uvya0htUQ61AtGcaZ8Y2yA6jjMO+VX2l6TkGVfHFV+lIN5el1T2xUY5bGfelsZYsbdToxO8GpsqJ6ZkvD+rksNxLh1dGZoQz8Dx1o6rjb6ORiNGrnj28befK0/AOwD+eFdWBCqTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSkNWcIjT6t8LH090uQfgDrDcnv3CoYucWPwnBK51G4=;
 b=OeQ7pkHiZLiC/4J5a9ntkHxXWR51sHoljPanO/e+he30DRNOZjsiPd1rbWBpUN9/sPal4rnxQS94DzGD/XuNqj7rKKoMJ+v9ZK5zGA1w7I+kvJZxKtphg5oGOGBrRHzjWH8avh19GT4YUPZ4xd/C+Dj/Iq/UjC2tKgM6HicXqds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ba76ce47-b999-7daa-3248-0f0be6f49131@amd.com>
Date: Fri, 9 Dec 2022 19:10:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN v1] xen/Arm: Probe the entry point address of an uImage
 correctly
To: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20221208124929.55268-1-ayan.kumar.halder@amd.com>
 <1ad3ee8c-991f-6e15-255f-ccc24dd5b84f@xen.org>
 <e8aff19a-4992-9d35-4e78-9e64aec384f9@amd.com>
 <00ab59fa-d449-255b-bfe3-aaacb87e34dd@xen.org>
 <ca2db58b-0183-8972-0336-25bcabc99824@amd.com>
 <00793926-ef60-405b-e450-b42ccf939f5e@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <00793926-ef60-405b-e450-b42ccf939f5e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::25) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SJ2PR12MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 6557da35-e87c-4a74-852b-08dada190b13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MNhoV82b/augLx6nix5uad312BXjsdaIJIk0ONDWgGeqvp79Y/haLvhA/CeAEGRHfIz+g2YZAukcXrSx/BszV54hDfSEGAsD60gCteAXUP5jhL0yElx91gnpeNjLs4bdCKqWfH+vlTHzHSmSkeTAgsFtkPMP9sHuo0NExku1h05Os+tP0cwlzS3TQrpQoRrFV/sIsEiNXBkzr7ur4ZrXS2UItaZLNL476yfkMtXIgVi4DsQTyeWvOFr/pofKKc8ZJ8ue/nJmMnbFInYcvmYH8p5yrcc8XsPOxPbQlWhdWfnlldh6/JxgW1o1igFXCZj4g0iiuID3cVfJenR3yMb9VtU66tlyyDjLNP0PWFgOn8TdiRneKeU35lmU4JnuMPxwoJyNewjstN6gcSNWuW/32GWuK1TgPj+CTSPyI+J6Y2Y8hP2a8MjPjF3o2m7RCQE5aMgW+NjdkrqA3KIKTjPGAXvQVmOGuTPgmMugboWRahLMUse/LQlgaOvRrL+tmWdKJcPXUGRkL2nd0KaYGy0CtD9vSMLVf/6J0jrb3PT8SqnRPecPFpl3L39692wFlYXVPZgYnBmiwAvP54uYSu7w919jNiFL8hXRkccOHhipaRZvoayQXjq6jjK69Ut6lTeTRsW1mmoY/Kh/xmTC0RAJ6rPzmH5TH16G62R+iehaMlMXQ48y1wo+FO0sIrEq2xb3HVsNUU77jMGWeT6bl6AlyniCUb3oTfSXMvnZEXMddQGRlKDO3Q4Y6w1slu9gcDm4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199015)(2906002)(2616005)(83380400001)(31696002)(41300700001)(8936002)(36756003)(8676002)(186003)(5660300002)(4326008)(38100700002)(478600001)(6486002)(966005)(66946007)(53546011)(110136005)(66556008)(6512007)(26005)(66476007)(316002)(6666004)(6506007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWNMQzZtYzJraXhRRHZaWEdEWnZRVGZ6OUNzeTRJZldzeG9idmhtaFgwUHV6?=
 =?utf-8?B?di9NQUpxWkl0Lzh6QWlUdDFOMWE5VWN3NDlkZ2lWd3UrQ0dBbWp2STVSWTRM?=
 =?utf-8?B?R0laKzNHRzc5TUtxQzY5OVRkL1ZFbXNhUXFJeHRiZjBZa2VmbmR6ZVJ6SktX?=
 =?utf-8?B?Yklyb1A5WkdqelhyUkIvVm8yZUV4bVp6QXVZVXRQYU1jWVVUZHp4RnFDRDcy?=
 =?utf-8?B?L1ROTEwzQ3d3QzYwOUQ2RE9FODQybTlRNnp1Uzh1bG1SZkF6Rk9LZjVPQ3Jy?=
 =?utf-8?B?UXhwT0d5VGVlQ01RRG5QdTdNNzNFYUVpblkrenRpaWZWQlk1cmI3UGx5RW9I?=
 =?utf-8?B?bTR6dURIQktlOE5jaTNnUnB0eGNJN0dXaEVmbFBaaGExT3d5S3hFb2hZZ1lk?=
 =?utf-8?B?T1pLdUZLK2JXOU1nSWJDbm1oSkoyeGRRREo1SUhQaUZRcG5HTTdkT05td041?=
 =?utf-8?B?NG9aMTNoN0Y3NVJDWW9DLzBEWC9nNVhJaGptUHdvRmZKMXJRUmtJa2xFYW1h?=
 =?utf-8?B?eWg5QzVSTmova0pGUWhxVGd4VUZKR2FuTlI2M2VWMHFqcnNITUtoVFAzekpN?=
 =?utf-8?B?RTdRVzlrbkNvdk1WYzNMbjFzNlRvbGtZZFZZMW5udTdrQ2VEb2NpRk05L2hX?=
 =?utf-8?B?MzlUd2pma0dCcEJ6WklzNkdnSmdhT21NVVRUTGlwZmRWNGxqTUlhOVpuRzFo?=
 =?utf-8?B?T1ZUVWEvTEtJU2EzZUVNa2FrWlZuNXZBUUwwQW5qYzJjaWQ3SW5pM3VGbHJS?=
 =?utf-8?B?TDlBcGZNZkRubWxxOWlqcWxOS0RBVVdJL1lIeURQdmFZM0VlNnlVRHRKMUxS?=
 =?utf-8?B?N01TczMvVWJFUDAzVUpZaXN3dDhiaFJ0aHZDSWxEQnphTHZWOGpGTklDeUhD?=
 =?utf-8?B?dzB1dzNid1RuWUZmbEs4VlM5Szcrb25iR01pWXhZUjcrZWRpbUlBN3hLNjc4?=
 =?utf-8?B?bzczdktIVnNyV201M09NM0FEZkxsYUVlc1QwTnlWSUxHWHFBWkVwOEw2S2tZ?=
 =?utf-8?B?dWl0cnEvUDcveEtNdlBKYlZHcHZ0R0gyOUZna0diMVFqYk5pT2owUUFjZ1Jr?=
 =?utf-8?B?V1daTWw3Tnorb2xnamVWZnZxd0pNODk3OWhtVGdLNkJKVTR0eUxTVDk3cFpX?=
 =?utf-8?B?VDNPbTVVVmxTUncrZTRNRVFTR3l2TjZCVmovZFBBbFl5WUY1K1B6ckRCOFB0?=
 =?utf-8?B?UkJ4dVRpWFZmU1NhR2J4MmVYM1BYYlRMNUVuT25oR2M4MHVTUDRaa1hyTTRB?=
 =?utf-8?B?VjRZSWlFT2poWndCQUUvOVdnVXMvTjNuK1BvR2UvN0dkU1I1RGdFNmZPZHBx?=
 =?utf-8?B?Q3BEUkdGZGZKTStSckZoeFZKcjE2N3NiZ1lCbmJtbFAvNkFzdGVUYXMrV0xp?=
 =?utf-8?B?Z3l2Vmg3RTFuMmxVUWQ1ZXk2cEJtMFdqUVRIVCt2TVhTZGJCZkJJZWs1RG1x?=
 =?utf-8?B?Q3VWZVpZV00zVFdJVk1aQXRPak1KdEF0RTRuRW83eDdFN1BGRy95bEJEN2lT?=
 =?utf-8?B?TTJma1BicUdXbmd6UjdIZzNBZGFsdDRER1hpTzQzLzRzZFhxK1d6TFptelQ4?=
 =?utf-8?B?Z0lLR3M0RFZaQmF6eVV5ZTRDcTdOMmZoNTFiSWJtVkJsMk5UNzZTalNibU03?=
 =?utf-8?B?KzBiTCtwWXprOVo3bnI3eXRUbFQ3bC91ZHVwY3FNczJtTHFWaU91R0gwNU9L?=
 =?utf-8?B?RXZZN25jT1QzODVXTkl0TnJDYTNHSHZ3UUw4SXZtUjhXY2l6ZHpZa1JQeTBS?=
 =?utf-8?B?VENXSDUrdDJibWZCRXhmZWJNNUhPV1FEUHNlNDNVdks3MG5oNDMwejFNSEtN?=
 =?utf-8?B?dnBYUGVVQXZKeFY3cElaSzZmaDdsMis0MTlMNE4xTFZtVVhZTEN3QmNSMk1L?=
 =?utf-8?B?NDl5RDQyTW1nU1hLek5NeDZGN2VtTU5mOUdCejMybzlEdk9mdDNYS1JyeXJJ?=
 =?utf-8?B?N0g1OWwzTm5ySXJFZEk0c2kyWXk0OXM4cFEyVklJRUxZK0RtRys1Y3VvVEVl?=
 =?utf-8?B?UnFQSkE0K1JiMWE4QjRmNWxadG1heWh0eFY2MGN3Ny96dFVmbXFON01OU2du?=
 =?utf-8?B?aHBvcnYzRUVBdkxjbWJNYWs3aGNvcFZNQ0dwQ1BUZG5iOHZiUjliYzZxR0tl?=
 =?utf-8?Q?q8T2I+EzThAk9js1stGk66A2t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6557da35-e87c-4a74-852b-08dada190b13
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 19:10:32.4024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZhRPwfaw1RlbgWW1dUOrd2ebmOpuu4rYjwO//9s8sXI18xb2lnYMcDulb33O7Pt06/3Yv66REsetq8UgC7q1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7919

Hi Michal,

On 09/12/2022 08:53, Michal Orzel wrote:
> On 08/12/2022 19:42, Ayan Kumar Halder wrote:
>> On 08/12/2022 16:53, Julien Grall wrote:
>>> Hi,
>> Hi,
>>> On 08/12/2022 15:24, Michal Orzel wrote:
>>>> On 08/12/2022 14:51, Julien Grall wrote:
>>>>> Caution: This message originated from an External Source. Use proper
>>>>> caution when opening attachments, clicking links, or responding.
>>>>>
>>>>>
>>>>> Hi,
>>>>>
>>>>> Title extra NIT: I have seen it multiple time and so far refrain to say
>>>>> it. Please use 'arm' rather than 'Arm'. This is for consistency in the
>>>>> way we name the subsystem in the title.
>>>>>
>>>>> On 08/12/2022 12:49, Ayan Kumar Halder wrote:
>>>>>> Currently, kernel_uimage_probe() does not set info->zimage.start. As a
>>>>>> result, it contains the default value (ie 0). This causes,
>>>>>> kernel_zimage_place() to treat the binary (contained within uImage) as
>>>>>> position independent executable. Thus, it loads it at an incorrect
>>>>>> address.
>>>>>>
>>>>>> The correct approach would be to read "uimage.ep" and set
>>>>>> info->zimage.start. This will ensure that the binary is loaded at the
>>>>>> correct address.
>>>>> In non-statically allocated setup, a user doesn't know where the memory
>>>>> for dom0/domU will be allocated.
>>>>>
>>>>> So I think this was correct to ignore the address. In fact, I am worry
>>>>> that...
>>>>>
>>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>>> ---
>>>>>>
>>>>>> I uncovered this issue while loading Zephyr as a dom0less domU with
>>>>>> Xen on
>>>>>> R52 FVP. Zephyr builds with static device tree. Thus, the load
>>>>>> address is
>>>>>> always fixed.
>>>>>>
>>>>>>     xen/arch/arm/kernel.c | 2 ++
>>>>>>     1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>>>>>> index 2556a45c38..e4e8c67669 100644
>>>>>> --- a/xen/arch/arm/kernel.c
>>>>>> +++ b/xen/arch/arm/kernel.c
>>>>>> @@ -222,6 +222,8 @@ static int __init kernel_uimage_probe(struct
>>>>>> kernel_info *info,
>>>>>>         if ( len > size - sizeof(uimage) )
>>>>>>             return -EINVAL;
>>>>>>
>>>>>> +    info->zimage.start = be32_to_cpu(uimage.ep);
>>>>> ... this will now ended up to break anyone that may have set an address
>>>>> but didn't care where it should be loaded.
>>>>>
>>>>> I also understand your use case but now, we have contradictory
>>>>> approaches. I am not entirely sure how we can solve it. We may have to
>>>>> break those users (Cc some folks that may use it). But we should figure
>>>>> out what is the alternative for them.
>>>>>
>>>>> If we decide to break those users, then this should be documented in
>>>>> the
>>>>> commit message and in docs/misc/arm/booting.txt (which interestingly
>>>>> didn't mention uImage).
>>>>>
>>>> So the first issue with Zephyr is that it does not support zImage
>>>> protocol for arm32.
>>>> Volodymyr added support only for Image header for arm64 Zephyr.
>>>> I guess this is why Ayan, willing to boot it on Xen (arm32), decided
>>>> to add u-boot header.
>>> If that's the only reason, then I would rather prefer if we go with
>>> zImage for a few reasons:
>>>   - The zImage protocol has at least some documentation (not perfect)
>>> of the expected state of the memory/registers when jumping to the image.
>>>   - AFAICT libxl is not (yet) supporting uImage. So this means zephyr
>>> cannot be loaded on older Xen releases (not great).
>> I am exploring for a similar option as Volodymyr ie support zimage
>> protocol for arm32.
>>
>> But for that I need some public documentation that explains the zimage
>> header format for arm32.
>>
>> Refer xen/arch/arm/kernel.c
>>
>> #define ZIMAGE32_MAGIC_OFFSET 0x24
>> #define ZIMAGE32_START_OFFSET 0x28
>> #define ZIMAGE32_END_OFFSET   0x2c
>> #define ZIMAGE32_HEADER_LEN   0x30
>>
>> #define ZIMAGE32_MAGIC 0x016f2818
>>
>> Is this documented anywhere ?
>>
>> I had a look at
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm/booting.rst
>> , but there is nothing that explains the header format.
>>
>>> Note this doesn't mean we should not fix Xen for uImage.
>>>
>>>> Now, there is also a question about supporting arm64 uImage kernels.
>>>> In Xen kernel_zimage_place,
>>>> we do:
>>>> #ifdef CONFIG_ARM_64
>>>>       if ( info->type == DOMAIN_64BIT )
>>>>           return info->mem.bank[0].start + info->zimage.text_offset;
>>>> #endif
>>>>
>>>> So if we modify the uImage behavior for arm32, we will break
>>>> consistency with arm64
>>>> (we would take uImage entry point address into account for arm32 but
>>>> not for arm64).
>>>> At the moment at least they are in sync.
>>> That's a good point. It would be best if the behavior is consistent.
>> Currently, kernel_zimage_place() is called for both uImage and zImage.
>>
>> Will it be sane if we write a different function for uImage ?
>>
>> Something like this ...
>>
>> static paddr_t __init kernel_uimage_place(struct kernel_info *info)
>>
>> {
>>
>>       /* Read and return uImage header's load address */
>>
>>       return be32_to_cpu(uimage.load);
>>
>> }
>>
>> This will be consistent across arm32 and arm64
>>
> All of these does not make a lot of sense because we are allocating memory for a domain
> before probing the kernel image. This means that the load/entry address for a kernel
> must be within the bank allocated for a domain. So the kernel already needs to know
> that it is running e.g. as a Xen domU, and add corresponding u-boot header to load
> us at e.g. GUEST_RAM0_BASE. Otherwise Xen will fail trying to copy the kernel into domain's
> memory. Whereas for domU it is easy to guess the memory bank, for dom0 it is not.

I am trying to see if I understand you correctly.

Currently, the sequence is like this. Refer construct_domU()

1. kernel_probe()

2. allocate_memory()

So, we allocate memory after we probe the kernel image.

In kernel_probe(), we do read the headers in kernel_zimage32_probe() and 
set "info->zimage.kernel_addr" accordingly.

Later in allocate_memory(), we determine the memory for the domain.

IIUC, it is assumed that "info->zimage.kernel_addr" is within the memory 
range for the domain. Else, Xen may crash.

If this is correct understanding, then we should also be able to probe 
uImage header and set the kernel_addr (similar to kernel_zimage32_probe()).

>
> zImage and Image are image protocols, uImage is not. It is just a legacy u-boot header (no requirements
> \wrt booting,memory,registers, etc.). It can be added on top of anything (even vmlinux or a text file).
> So I guess this is why Xen states that it supports zImage/Image and does not mention uImage.
> A header is one thing, the boot requirements are another. Supporting uImage is ok but if we specify
> that it must be a u-boot header added on top of zImage/Image.

Let me first confine to Arm32 only.

zephyr.bin has to be loaded at a fixed address with which it has been built.

So, we could either use zImage header (where 'start_address' can be used 
to specify the load address).

Or uImage (where -a  is used to specify the load address).

Adding uImage header on top of zImage does not make sense.

Now for Arm64,  we do need to parse the zImage header

#ifdef CONFIG_ARM_64
     if ( info->type == DOMAIN_64BIT )
     {
         return info->mem.bank[0].start + info->zimage.text_offset;
     }
#endif

Again, adding uImage header on top of zImage header does not make sense 
as well.

Also, I believe zImage boot requirements are specific for linux kernel.

zephyr or any other RTOS may not follow the same boot requirements.

- Ayan


>
>> - Ayan
>>
>>> Cheers,
>>>
> ~Michal
>

