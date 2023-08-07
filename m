Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 905D877245F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 14:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578348.905804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzYC-0004JA-Vp; Mon, 07 Aug 2023 12:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578348.905804; Mon, 07 Aug 2023 12:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzYC-0004GJ-Sn; Mon, 07 Aug 2023 12:41:32 +0000
Received: by outflank-mailman (input) for mailman id 578348;
 Mon, 07 Aug 2023 12:41:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2NL=DY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qSzYB-0004GB-7a
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 12:41:31 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e89::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9b5b17e-351f-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 14:41:28 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CYXPR12MB9319.namprd12.prod.outlook.com (2603:10b6:930:e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Mon, 7 Aug
 2023 12:41:21 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4541:2a3d:737d:b194]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4541:2a3d:737d:b194%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 12:41:23 +0000
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
X-Inumbo-ID: b9b5b17e-351f-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvJHcgKgSJO7iqUWJxQAprIpYpxAbVgQ3W8u1ZDrZwoLXu0WcKnY7s6FGwJmwr0Yb/IXEVWXryyp9JuFd0pNc/6/zPVtBP/9D6tAps4nNT29ue9mZb5vOkgmxRQUMqI9n+J6KYw1kDRVYS2ZtxstqJz4X4GESWSkHJ0ymw0nVC9LLDKCrlj1eB7RNumbGB4vxSw3W8+i+8UiLjKNG2C1CZYcSL3pzRtoDXHWOGLgSCs899132P7WduItF9gpcfn9CzoIpgQIicIyaJdgKBml8qOtuKlFI7nK3tG27Q11cSiqEyWievQF/BScnNMmVikmvBWOJPNc2vrw7nLPUaicJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02CKm/SnpetlFdMVq5ZRrNDcvVOyMucAFhXy8uL9PIQ=;
 b=SiidKtFBA08WylCniIKv/hwlZld51GFl68WG7CU8e3fGtmBAO5kMoGa9oIQcdzyRX0VNJm/gHzMKZ/V93BZ0HbaKxNBeIARXf5GFWUr3j0a/054oyjs/TvAXaK0/YCsWxqPbuFEJNdsiq/ou0QIk/UTCy6ihyXrf+N9ty+yuqRThMuUmz1PivaPizPG4PY1uqgqS9/2TZFhvEOom0LeSm0PsijXt617so39HiZ7dTWbDcL50wBoyu0bIh2FtpuqyVCKLoEIFe5GqLJ7MbBjkA6vsEdwcLj5r8ojco+gkjUKGEzS0IPFJcYc+Z+puAyVTfcFjLTc8I7STJEXjJ2XdOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02CKm/SnpetlFdMVq5ZRrNDcvVOyMucAFhXy8uL9PIQ=;
 b=w46P5mosIAQTIyGdeqB40F1iOJ8771TG+Us7DYMYELd9nRWVb4V+mTxKV89TuHJqPQ4X9d1ifo1CwOJ0LxAxF4bqdn9S4cb1F3/d/Z1m2JxGYai7MJXDcfKYStzvAcNq/kgqS15T/FOvr0Qwtb87Bm7/9t5ZMxAYbEwDNsWtEOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <292660bf-0f12-28d0-c7bd-2b870ed143e3@amd.com>
Date: Mon, 7 Aug 2023 13:41:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v4 01/13] xen/arm64: head.S: Introduce
 enable_{boot,secondary}_cpu_mm
To: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <Penny.Zheng@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-2-Henry.Wang@arm.com>
 <79de42d1-35db-79b1-da2a-f08a72fa53d7@amd.com>
 <AS8PR08MB7991B7C1B78531B9322934E2920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <1366a5b1-4bf4-20d6-73a7-ad1735ab8c10@amd.com>
 <4dadcb55-1c94-4b57-a7fd-32460f4d9604@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <4dadcb55-1c94-4b57-a7fd-32460f4d9604@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0328.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39a::21) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CYXPR12MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: 145c4517-8ec6-47ac-d109-08db97439baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WQXDGrP3JoKv97UYhzSSUCgbACzKYQF7TYN818QFP1BkOHILFycrMqyAC2JvRAhJbiWBI7yUJGm3YgWk3ekLtg5u5GphNMnlEfdvwFpkTpJNcl//Z8bcUfEgIwR6piPJMkUZdDSeg6U4Ckl3HoElMoGvXIz+ncNoCzIFSdhwV6blAGvu59PzJQjX5eODY84SNrXETCuMM1Tib9ItPtDByw3AUROas4dTWkt52mNzwpdRnBEpSeaCugKSYWaSBa1d3y5JsaOv1mkbEDCpkXjhreuv9zTc5pWRe5jCsF2A/Xd14TvzXPzEEeFV+OYdMFbnVUYIUITTErMIA9DAGBGd3h962qXL0nRsW9MenQeQtlxjQiiTyiQ9xlOY+yqsNA07NUmYNyoqM+Qmos7LHBTlr18KHgKxZGjR9er6S3+02LEADpcOwt9XI3USDgI//FwVrzw9u6gUon76qEMV916da96wElSKw2Giyvj543SCkoHmvXpMFiYNP+h6DIuzB29sCcC2kturzvj7a23VXVR6R3CWF9lw8vh6CB94GZyIzxozxBc+3W6rwzkJxrvic593T0dTTNW5AtRROSj8AQfB+rl+dr3rY/bMHKX11Yr7X2xz7QTaFEWQyWG1Shaz01zo1BLQiHU+tOI7v2nzsNjvwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(1800799003)(186006)(2616005)(6486002)(6666004)(6512007)(966005)(478600001)(31696002)(26005)(36756003)(6506007)(53546011)(41300700001)(316002)(5660300002)(8936002)(8676002)(54906003)(110136005)(38100700002)(4326008)(2906002)(66476007)(66556008)(66946007)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnNCc2daRXVPazNlYlZraFNkQVBwYUxNZFhUMWxUcCs5TFZFTUt1aXE4RlNw?=
 =?utf-8?B?TWhxRjVIQ0RPQllHNEtkM3ZtU1VhanJrallLNXJEZTFVd3hmcXhUUit2TWRE?=
 =?utf-8?B?QVZGWEJ6NFkrb1hsYitScnh3OVA0bHpWT0Jyei9xUUJYR2QwL1RCR0E5TXV4?=
 =?utf-8?B?S2J1eUlHMHZuVkVFOVFOQnZLdXBwZUI3QkdaWHRDME5UMkJ5bGVkNWhYTGQx?=
 =?utf-8?B?Qm9MaGJ4K25rUDRYNjNCQTUrek11QS9KZ21SMytJSDl3OUVwbi9ORjZiUktq?=
 =?utf-8?B?MHE5UVVidVZCOElTWUNMSTlONjl4NjI2RjBwV0VJZDFDc1RkRzJCZWJkbjJ0?=
 =?utf-8?B?bE0rTnlrbW1VUGNhMDF0VkJNWUk2bGZzdHN6YUZxa21ERzU5QlJ4RnlwY0xJ?=
 =?utf-8?B?cFVkQ0pwZFNwcEErRXRJZC8zclBLVVFVVnFld2NYNXo0RXdmUzdSajlGcjlY?=
 =?utf-8?B?cytTMVQzUFk0eDRuT0ZKTUwxakhZNVNNTnd5Nmo4YTkwbCsxKzMySTZIbFJ6?=
 =?utf-8?B?Q08wM2MyK2FKTUJ6Mk1Pd1ZjaXNEL0NxT01qUDQ3R2NyZS8vRkMrMzdWa1Rx?=
 =?utf-8?B?YlZCc3M4MFBFWlpKNXZ3OEV5bktuaWtMeEh2ZXBuUi9rS3o3SXRwT2ZYSm5h?=
 =?utf-8?B?Y0xRTFc1ejBZUmhzQXJDTmN0UW4wWkpyeVd1QmNIVGhQTFBidGpxbzcyRTFC?=
 =?utf-8?B?VlpEWHo4dThFTThVNDBaUHh4TW5vTmpGUmlWMzd5SExZTm5wc0J4OUlYWTcr?=
 =?utf-8?B?WnRvei93bytHNnNvS2p2UWFOeFZUdFJDeTZjbGZpRTd1SUp2UGpPZ2luV1lZ?=
 =?utf-8?B?aWVseThwUmc1cElwdFFZa2ZxNGgxS3N2dm5vUnZLa2kyYTlocDg2bDh0K1JB?=
 =?utf-8?B?U2FEMUN1TVRFSk9nSkFoWVhlZFNJNUNXbXFxVXBvUVNyNGEyRXJ2NnZDdVIv?=
 =?utf-8?B?SEcyWWhLWTN4dlRtbVdndU0wVWs1aUZ4T1BmQ2ZJZlpKdHUvbVR1MExZcGxk?=
 =?utf-8?B?dHIyVld6TUJLY3MrN0didTVhYXNscTgwc09vcXB5N0RtQkR1ZytYZ0ExQnJ0?=
 =?utf-8?B?cUFqVDF2azR4Nm9JU3RSNVVRQ3JsWDlhZ0RERm5CUVRwRlhJOFNHVitQakFv?=
 =?utf-8?B?cDBGNExNaURWOUNpR0VrNjZhZVlrU0pCSjJ1OEcvcE9YbkNJQ1BPM0NyNDNM?=
 =?utf-8?B?YWZFdjA2TnhKdCtaS1lLcUFzL2FrK3JGZnBOTHlWSUwyMjgyUWh5RTFMQlA4?=
 =?utf-8?B?eUJXN2ZPcDVBbXNvNHFoNC9HZDBDUnBCaEJsNlp5am5VZENiTU12YUhVdTdC?=
 =?utf-8?B?NXRiWUlOU25TOGpkN3VGUkxPUjNHM1hMRVpmTkdNcnJMUTNieTJjVkI0bjB6?=
 =?utf-8?B?T2pVTFV6RXA1M1luaU5MeVAxTklNM3R2Z2FVYmEwZ0RiZDVxZVRlVFNWSHJO?=
 =?utf-8?B?Nm0rL2lZY3l4b2RGK3RDcml2UzZ4SWFqNTJPeUtLajRjYXMvVmZhdXlxcWdU?=
 =?utf-8?B?M1ErSndvOCs0aFltV2tkekhlT0ZhMkdJUVpvN1B0Qk5QdldMcXV5bmF4VHdB?=
 =?utf-8?B?Qy95aCtmRkgxTTVNMEFINFVON0w1V0dNM3dzcmV1UHNtVTdKSGZLKzBUdEw0?=
 =?utf-8?B?NTltbHRRL1RzSmxMSG81bVpuL29ScjF6MGlzVkM3dVAxVWJ4M1FCTEtHZ2Rl?=
 =?utf-8?B?amRBdjhEclZDdmp3QUg2SThNOVM3VHlCQ0FsOFRUekRzWkRld0VpTXErTGIx?=
 =?utf-8?B?bmF2VFpSbUVBY0x1ajdFZWJGRUVNc1NYYzFYQnNSbmFHYzR6SEw2Sm1uMkw4?=
 =?utf-8?B?bVZYbWlKMklFZGRtTkYrYTJlWTd6MDlYakpRT09TbURWTzZCVlJUa3ppeEh5?=
 =?utf-8?B?ZFhqbU5GYVVsZktaVThlM096cmpkYWJiWGRFaStkSWtPUnI5S2VjdkVRbTd0?=
 =?utf-8?B?QS9FZkk4dmNrWW54MmNZa3dIWTh3RkQvcHZCYWxKY1ZXZzRHUm5IbytEVFpz?=
 =?utf-8?B?MDhRSTRMNzlBb3Z0djY3UGthRHMwdk9KaEdmUTg4dFJYQ0htcGQ1ZWUwMVE5?=
 =?utf-8?B?SDY1TU8zTEZBK3BMa2xXbkNHUExrcmxoSmJVVk0vVHhaSXVtYlBDUllMblVr?=
 =?utf-8?Q?eqvBPBSzJjs9kpdXibMucWzE+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 145c4517-8ec6-47ac-d109-08db97439baa
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 12:41:23.5942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5CE38ibifqbNUKeYKfmUWQcPr8wPFRC76uOAqh8ZqagoBXBFmIY1kLGslwTrwUhf9BHnBWYTJJgBT712Rw76Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9319

Hi Julien/Henry,

Thanks for the explanation.

On 07/08/2023 12:47, Julien Grall wrote:
>
>
> On 07/08/2023 12:43, Ayan Kumar Halder wrote:
>>
>> On 07/08/2023 12:35, Henry Wang wrote:
>>> Hi Ayan,
>>>
>>>> -----Original Message-----
>>>> Hi Henry,
>>>>
>>>>> At the moment, on MMU system, enable_mmu() will return to an
>>>>> address in the 1:1 mapping, then each path is responsible to
>>>>> switch to virtual runtime mapping. Then remove_identity_mapping()
>>>>> is called on the boot CPU to remove all 1:1 mapping.
>>>>>
>>>>> Since remove_identity_mapping() is not necessary on Non-MMU system,
>>>>> and we also avoid creating empty function for Non-MMU system, trying
>>>>> to keep only one codeflow in arm64/head.S, we move path switch and
>>>>> remove_identity_mapping() in enable_mmu() on MMU system.
>>>>>
>>>>> As the remove_identity_mapping should only be called for the boot
>>>>> CPU only, so we introduce enable_boot_cpu_mm() for boot CPU and
>>>>> enable_secondary_cpu_mm() for secondary CPUs in this patch.
>>>>>
>>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>>> With two comments
>>>>
>>>> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>
>>>> Tested-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> Thanks, and...
>>>
>>>>> +/*
>>>>> + * Enable mm (turn on the data cache and the MMU) for secondary 
>>>>> CPUs.
>>>>> + * The function will return to the virtual address provided in LR 
>>>>> (e.g. the
>>>>> + * runtime mapping).
>>>>> + *
>>>>> + * Inputs:
>>>>> + *   lr : Virtual address to return to.
>>>>> + *
>>>>> + * Clobbers x0 - x5
>>>>> + */
>>>>> +enable_secondary_cpu_mm:
>>>> I will prefer "enable_secondary_cpu_mmu" as it is MMU specific. And 
>>>> ...
>>> ...actually this as well as...
>>>
>>>>> +/*
>>>>> + * Enable mm (turn on the data cache and the MMU) for the boot CPU.
>>>>> + * The function will return to the virtual address provided in LR 
>>>>> (e.g. the
>>>>> + * runtime mapping).
>>>>> + *
>>>>> + * Inputs:
>>>>> + *   lr : Virtual address to return to.
>>>>> + *
>>>>> + * Clobbers x0 - x5
>>>>> + */
>>>>> +enable_boot_cpu_mm:
>>>> prefer "enable_boot_cpu_mmu" as it is MMU specific as well.
>>> ...this, are the name suggested by Julien in [1], so probably I will 
>>> stick
>>> to these names, unless he would prefer the proposed names. I would
>>> personally prefer the names that Julien suggested too, because from
>>> the comments above these two functions, these functions not only
>>> enable the MMU, but also turn on the d-cache, hence a more generic
>>> name (using "mm"), is more appropriate here I guess.
>>>
>>> [1] 
>>> https://lore.kernel.org/xen-devel/c10bc254-ad79-dada-d5fb-9ee619934ffb@xen.org/
>>
>> This is fine. My concern is minor.
>>
>> If this file is going to contain MPU specific logic as well in 
>> future, then suffixing a *_mmu might help to distinguish the two.
>
> For this series, it is quite important to look at the end result. In 
> this case, the MMU logic will be moved in its own file. 
> enable_boot_cpu_mm() and enable_second_cpu_mm() will be implemented 
> differently between the MMU and MPU to avoid #ifdeferay in head.S.

Makes sense. I am happy with it.

- Ayan

>
> Cheers,
>

