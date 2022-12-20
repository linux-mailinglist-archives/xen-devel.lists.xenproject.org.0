Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21541651F2A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 11:45:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466965.725946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7a7E-0002fC-Sl; Tue, 20 Dec 2022 10:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466965.725946; Tue, 20 Dec 2022 10:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7a7E-0002cK-PO; Tue, 20 Dec 2022 10:44:56 +0000
Received: by outflank-mailman (input) for mailman id 466965;
 Tue, 20 Dec 2022 10:44:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gzLQ=4S=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p7a7D-0002cB-1w
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 10:44:55 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 554f424f-8053-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 11:44:53 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by PH8PR12MB6841.namprd12.prod.outlook.com (2603:10b6:510:1c8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 10:44:49 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c%5]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 10:44:49 +0000
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
X-Inumbo-ID: 554f424f-8053-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrVjlKKxgGIOPI/Ppi+WdVBpYlkFTaLeSkWUc7YpTtvQc82WuOWfeH0oOGZNsZnzvJ/P91Z7hWFskPWQZ25Iszrvo2cee7jjpNZQOflQi+nKg2oa1KnTPn7zhwxF50Wg6oLBqKzQn2DyhC5mpJNT9LIPO/5iIz94HfGoaz9aP/+EwgCdGo5VEmYjesF58G6wbqq+2tLg0NpQi35l5jZs+iKv5ZusDPqqsUtyLy3OzvI/zKL2k9kZmUTMwy1ohiZf17845pZYpctZfR9HNTFxuBeaDjXo63Cxwu85UgxGDZ6GpaLB0K0FNFGbCli9kDf2jT72EH0hGgX9kz7Qu3SuSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alVjjCBc9Qbj9Eq3dvwKscZeevP39Zs8u574WBatGL0=;
 b=C4n7LrJ9oYoWWv4llwF52L10f3HlYu9C0w/P9idToGhTmGtnOkVEe26UqdwhekIHYUz04ZiaGi/LRfWME3JHO4vB/LWeJom4TkSlE9u3nVjzfgUHqFh+NcEmdrjdcxejNXBb/LFLzzrETcB0YGLgK9OlcjGSU8XzM4AnUnqLU37INRWHK6GT21I5znxu4EtQs/C7W81jB+2DALCFL4QLxrsoV0j6ro0S5PzYA4tTmUdH4LM7mOK8nNDIQWpDSPjWGmw45yU6PnTsqq5/8cawGWjWFpIs+wFbupp6sQ0vzuHZWHSXT4sTaPnQsYQWm0FnfINg6SFjJaRyM/VZjXWyZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alVjjCBc9Qbj9Eq3dvwKscZeevP39Zs8u574WBatGL0=;
 b=aWWIYs8Y/8JbO1338fqyZEzlbsAu9OyaTZnkEyv1enhYvPWw3283LzDZZiuUXKxf2XpkVGPoBbEDjJNhIWdQmWLkTR0Zz5AnjfnN43S3mzakWL1ASrC0yH+l1yxeMXcPYxivGefLqEcy+FOMZN2JpKm6aGC8Wvwfav2zTBq703g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e2101505-ef3e-59f7-be2c-351ca9363249@amd.com>
Date: Tue, 20 Dec 2022 10:44:42 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [XEN v3] xen/arm: Probe the entry point address of an uImage
 correctly
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221217193801.19485-1-ayan.kumar.halder@amd.com>
 <75635251-5f51-fbe0-28be-a99480541116@amd.com>
 <6e2b1f97-3e72-34b9-8faa-f00e79587b39@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <6e2b1f97-3e72-34b9-8faa-f00e79587b39@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0376.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::21) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|PH8PR12MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dbefa49-48b2-49a1-9bec-08dae2773792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	07eV8rXy5VPW5fdleuch4CzaQrct1fZGqFsXVguhQBqF3EP9l6reEMbx8ZW51gjtcKdv6AItaSVgobvf4GlcY7rMKxpJKD4T1KtkMDbcOsJmdp10sFZak5FtO8MfdYgAvXYUs3ljv4p/ToAq9jNvpmm8GAXqOQEIbwI6oA9/D67VfR91tfDYaoNJcLuA/PXIu0cFkh+e4wreuAn8CFf+fmIBnPuFSlqQ35byI3kr9qBO6WJ3IBW/CG3wDrPHy1ck7E2wb+0ecWHrtyZHGHdRMbqjc4p8cwfZ/dNKcarcwp7xRYMTUR/Xcaz/sA6EHV79ISog/wCvP9rcG7qIjYc2XeR4VBskZ6FDiWKRVl2WuBiXSZBVVRIoL2bhRy6Bdb6PdBYhfKBzrzsYrjgThN9LZ2AnyML1F0LToo95JZ/tgfgaoYXR1HrovvrC3IjnrOBbnWJINo8eyueZ5QcGbV9QwiWkFiWoZjL6GqtMbVlNm/tnKVaPbcE59jCrKj4MkW+SPEfzRp7o8OSf5oAfgV8QBu3lO/82It2U4uf509FvXE4W9vFDTXjKaI6Yo2aPmaTScQ+029pfkpQHOCoIDGoXCIC6WD/2xrB5nzdUtUviONDF3YE3/y0FVOl79Itlz2MVIvEct6aXPcqzyRqHLt8UA0FwUzjM+xJfm5zc1agtgBG9K3v8gYkIBS/ohrUSUBRkf+X5616v1IIu6B2etcVQm/eVFZkvzMMUK7ZRULUDNcd695l3ml3Xh0L6ibHkkpbkTznuPKocQbqJ4S87wumubXjEqIdcF18TZDQ6g6KEEZc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199015)(31686004)(38100700002)(2906002)(41300700001)(36756003)(316002)(26005)(6512007)(186003)(31696002)(5660300002)(83380400001)(4326008)(478600001)(8676002)(66946007)(2616005)(6506007)(66476007)(66556008)(110136005)(6486002)(8936002)(6666004)(966005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzBKd3d6cW0xZVYvUFZoVVpDZHpONnV1YklQM1VoTG00b2RMTUkwVFV3Qk9q?=
 =?utf-8?B?QllDZEpMVGw1UTFraXY1R1VLTjZ5cnU2MFYrR2hzT3h0MERUbU5jU3daVDdn?=
 =?utf-8?B?RVJReDZpTHExWEFrSmNHOVp3NnZPd2V0Q3UySVEwYk9ibXgxN05maCs5K1BM?=
 =?utf-8?B?bFpGOTZwV1pXT1VIN041K2VRN1JFQjJ4WUtmQ1N6YUpIQ0NUeXhTamhxZmpR?=
 =?utf-8?B?UlhEVnhqc2FEYlQwVU1TOTFRS2dsN3AxY3hKdTJqR3hMdytoNzc0LzhkT3Vu?=
 =?utf-8?B?aSttcmZsbCt1ZlZNT2NGLzQ4Z3p5RjczUDFQZ2llWTFubGdRVWRldXhENlFm?=
 =?utf-8?B?TW1HbHFNVHFneEo4NGZwd3BZcFVpRjRhYVA0QmxHT1kwanVNNW1GUjdBWkQ1?=
 =?utf-8?B?akluMVZqMkY5aDQ4dFhQb3RLMkJPR2M1Ym5FWTlGOG9uVWhLUkZFUm5TWjlL?=
 =?utf-8?B?OUVHM0RxQmhqVWVjSXFnUGVBTmNYRVdrUDhsWFZQMmFIRDJsd1owa2hib29E?=
 =?utf-8?B?dVJ5eU51TXowQWNSTGhIZDJjbGloY1dqVjhnNkVYMXRLRjhTRzE4L0Npd3Ra?=
 =?utf-8?B?YmQ3djVsQmFud0RtTlhubWw1WU44ajlYZVorZnRDNWJTbEprQWxudzY2OEtR?=
 =?utf-8?B?RU9Hb1FtNWtUWVhsN3h2ZEFRRGxkTkc2N2lPZ1gwQ0YyTWFCREx1TEpWMlFT?=
 =?utf-8?B?QlFXZVoyamhyVjIrUUFKbGRqdnFGTzg4ZFdtU2VDajBhSVUrQ05VTGxsRGtG?=
 =?utf-8?B?VU5SdDE1cDhFWTdtQWFsSEx1eGpURFEvY1ZvMDd0VHhOd3Z3UVVsNE1XMmdF?=
 =?utf-8?B?WUlUblZCWGFxVUlRd21mdzQ0aG40RG4yWmRSajVsTS9PdER1aGV3YloxV3hT?=
 =?utf-8?B?bzJrZ0pwOFNUWUZ1UzVuWVdEdjBmdkFna1pMcVJ5Z3RUV2pWc0FhT2tweEZk?=
 =?utf-8?B?TjlGL0F2emRLUytjTS9TUW5VdkkvTGNpQktjbm5DS09zTGVBajRibC9oWStJ?=
 =?utf-8?B?ZGFsdlRzWFFFYVdoT0M0RTVjUU42Y3UxY29Ba29wOEJ3M3g1bTA4MlJPY0tT?=
 =?utf-8?B?d3BhL2h5NEFaTllwTW80ckpVYUN6UkhlWklLNlY2SWxQK3VKUVo4TVlpSDJu?=
 =?utf-8?B?aEtYVHNrT0N5Y1MwQ0RMdEZRRW1xZHpDOHRLWlpGSzZWM04ybCsxZDlBUkg2?=
 =?utf-8?B?UTlUVnZSRTVINndVK3pLM1dLeFRpMjNhMHpNRzRQRDVmYzljaGZtazh4OU5M?=
 =?utf-8?B?THljUDhMbjNpOU5wSzVDMjVsT1NJT0FMUjAxVHFJUW5BeFFLT0dqMlVzM1hF?=
 =?utf-8?B?T2xxV3FDaXJnZ0J6TVN5d2gwTDNqMmRjdXZrczF5aW9EUStiQlFNZFB0c2E0?=
 =?utf-8?B?NGc1L0VxUE1ITEJTd0lxQzZ5WXVVa1NjcytTOG9IV3VQTjZzbGlWUDE4a0hR?=
 =?utf-8?B?d2hwdXlFMzdzY2hUdEkvVU9yajEzaWZBV3liTDI2Y2hiZnBTbW1qMlU5Wm5D?=
 =?utf-8?B?N0VjNm00WEVCcElUcjZKeEFreWIwdnYvOHZUeTBlbDdvTWNPQThESnAxWUQx?=
 =?utf-8?B?S1ZKb3hHY3FOUThZUkNKNTlSclRYYXZOMHQxWDloSFYvb0JVNkNmYUlURFhW?=
 =?utf-8?B?WlloV2RkTEpuSjZHaUV0UWVNcW9CZTdPN2g2MXhkRzR2TnB5Qy9yVkZvTGpW?=
 =?utf-8?B?T3VVL1VvdndmTFVTSVBBUjNzV0FGSURxM3ZlNFhSTTVpc29aT2Q3R1BKMUhU?=
 =?utf-8?B?QlpycktsM1pQcytYY2NJcXVRVmVxNHRHL3RyNnFrNVhLSG9JcXd4TDZWRjF0?=
 =?utf-8?B?VmpSTnpjaWM4d3JPWGxlTGk0dE43YS9MSnlKNC9LdUZqemtudmJJQW9KNHNp?=
 =?utf-8?B?ckpXT1lJSXlZV0NHaThCRjM0bGpnT2lkTVUyN25QUVp2b0ZGUHR0NnpJMyti?=
 =?utf-8?B?ZlFNWHExWm5vd1FOYnlsYVJVRHZTb1lTYTBnYnE0YnRTSFJOSktMT3dtenlk?=
 =?utf-8?B?SllpYVBTUzREVlZrVGNtYVVTbUgxR1UxaDlTbVFoUGlaTVFFUC9laHF5RERy?=
 =?utf-8?B?ejhLUnJ6cVFPUlArYmJnVnBOWVhMc2JXbURBdXhDakpMMkdaeC9ZeEdnaFc5?=
 =?utf-8?Q?OVsSFm6rUyhRnd7W26FIB9cSY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbefa49-48b2-49a1-9bec-08dae2773792
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 10:44:48.9874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QK97uFO0UgwDmNjSl4pj/4A1pNzGkPojFT12EVUtrheKg8i7/nJi3J3mnJ7jGoZ8l6D0zXZvbVaFj/38Ldnquw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6841

Hi Julien/Michal,

On 20/12/2022 10:05, Julien Grall wrote:
> On 20/12/2022 09:44, Michal Orzel wrote:
>> Hi Ayan,
>>
>> On 17/12/2022 20:38, Ayan Kumar Halder wrote:
>>> Currently, kernel_uimage_probe() does not set info->zimage.start. As a
>>> result, it contains the default value (ie 0). This causes,
>>> kernel_zimage_place() to treat the binary (contained within uImage) as
>>> position independent executable. Thus, it loads it at an incorrect 
>>> address.
>>>
>>> The correct approach would be to read "uimage.ep" and set
>>> info->zimage.start. This will ensure that the binary is loaded at the
>>> correct address. Also, it checks that the load address and entry 
>>> address
>>> are the same. The reason being we currently support non compressed 
>>> images
>>> for uImage header. And as seen in uboot sources(image_decomp(), case
>>> IH_COMP_NONE), load address and entry address can be the same.
>>>
>>> This behavior is applicable for both arm and arm64 platforms.
>>>
>>> Earlier for arm32 and arm64 platforms, Xen was ignoring the entry point
>>> address set in the uImage header. With this commit, Xen will use the
>>> kernel entry point address as specified in the header. This makes the
>>> behavior of Xen consistent with uboot for uimage headers.
>>>
>>> Users who want to use Xen with statically partitioned domains, can
>>> provide the fixed non zero load address for the dom0/domU kernel.
>>>
>>> A deviation from uboot behaviour is that we consider load address == 
>>> 0x0,
>>> to denote that the image supports position independent execution. This
>>> is to make the behavior consistent across uImage and zImage.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>>
>>> Changes from v1 :-
>>> 1. Added a check to ensure load address and entry address are the same.
>>> 2. Considered load address == 0x0 as position independent execution.
>>> 3. Ensured that the uImage header interpretation is consistent across
>>> arm32 and arm64.
>>>
>>> v2 :-
>>> 1. Mentioned the change in existing behavior in booting.txt.
>>> 2. Updated booting.txt with a new section to document "Booting Guests".
>>>
>>>   docs/misc/arm/booting.txt         | 21 +++++++++++++++++++++
>>>   xen/arch/arm/include/asm/kernel.h |  2 +-
>>>   xen/arch/arm/kernel.c             | 27 ++++++++++++++++++++++++++-
>>>   3 files changed, 48 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
>>> index 3e0c03e065..01b12b49a5 100644
>>> --- a/docs/misc/arm/booting.txt
>>> +++ b/docs/misc/arm/booting.txt
>>> @@ -23,6 +23,24 @@ The exceptions to this on 32-bit ARM are as follows:
>>>     There are no exception on 64-bit ARM.
>>>   +Booting Guests
>>> +--------------
>>> +
>>> +Xen supports the legacy image protocol[3], zImage protocol for 
>>> 32-bit ARM
>> uImage is not a protocol. It is just a header with no other 
>> information \wrt
>> boot requirements.
>>
>>> +Linux[1] and Image protocol defined for ARM64[2].
>>> +
>>> +Earlier for legacy image protocol, Xen ignored the load address and 
>>> entry
>>> +point specified in the header. This has now changed.
>>> +
>>> +Now, it loads the image at the load address provided in the header.
>>> +For now, it supports images where load address is same as entry point.
>> Would be beneficial to add explanation why load address must be equal 
>> to start address.
Answered below.
>>
>>> +
>>> +A deviation from uboot is that, Xen treats "load address == 0x0" as
>>> +position independent execution. Thus, Xen will load such an image 
>>> at an
>>> +address it considers appropriate.
>>> +
>>> +Users who want to use Xen with statically partitioned domains, can 
>>> provide
>>> +the fixed non zero load address for the dom0/domU kernel.
>>
>> I think this section is missing a note that in case of not PIE, a 
>> load/start address
>> specified by the user in a header must be within the memory region 
>> allocated by Xen.
>>
>>>     Firmware/bootloader requirements
>>>   --------------------------------
>>> @@ -39,3 +57,6 @@ Latest version: 
>>> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/t
>>>     [2] linux/Documentation/arm64/booting.rst
>>>   Latest version: 
>>> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst
>>> +
>>> +[3] legacy format header
>>> +Latest version: 
>>> https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h#L315
>>> diff --git a/xen/arch/arm/include/asm/kernel.h 
>>> b/xen/arch/arm/include/asm/kernel.h
>>> index 5bb30c3f2f..4617cdc83b 100644
>>> --- a/xen/arch/arm/include/asm/kernel.h
>>> +++ b/xen/arch/arm/include/asm/kernel.h
>>> @@ -72,7 +72,7 @@ struct kernel_info {
>>>   #ifdef CONFIG_ARM_64
>>>               paddr_t text_offset; /* 64-bit Image only */
>>>   #endif
>>> -            paddr_t start; /* 32-bit zImage only */
>>> +            paddr_t start; /* Must be 0 for 64-bit Image */
>>>           } zimage;
>>>       };
>>>   };
>>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>>> index 23b840ea9e..e9c18993ef 100644
>>> --- a/xen/arch/arm/kernel.c
>>> +++ b/xen/arch/arm/kernel.c
>>> @@ -127,7 +127,7 @@ static paddr_t __init kernel_zimage_place(struct 
>>> kernel_info *info)
>>>       paddr_t load_addr;
>>>     #ifdef CONFIG_ARM_64
>>> -    if ( info->type == DOMAIN_64BIT )
>>> +    if ( (info->type == DOMAIN_64BIT) && (info->zimage.start == 0) )
>>>           return info->mem.bank[0].start + info->zimage.text_offset;
>>>   #endif
>>>   @@ -223,6 +223,31 @@ static int __init kernel_uimage_probe(struct 
>>> kernel_info *info,
>>>       if ( len > size - sizeof(uimage) )
>>>           return -EINVAL;
>>>   +    info->zimage.start = be32_to_cpu(uimage.ep);
>>> +
>>> +    /*
>>> +     * Currently, we support uImage headers for uncompressed images 
>>> only.
>>> +     * Thus, it is valid for the load address and start address to 
>>> be the
>>> +     * same. This is consistent with the uboot behavior (Refer
>>> +     * "case IH_COMP_NONE" in image_decomp().
>> Please make it clear that you are referring to uboot function.
>
> Could we avoid to mention the u-boot function? The reason I am asking 
> is the code is in a different repo and the function name can easily 
> change without us noticing (so the comment would rot).
>
> Is the behavior documented somewhere in U-boot (or online)? If not, 
> what's the guarantee that it will not change?

I could not find any documentation which states this. I found this from 
the following in uboot source code.

https://source.denx.de/u-boot/u-boot/-/blob/master/boot/image.c#L458

AFAIU when kernel_uimage_probe() get invoked, the image has already been 
decompressed. So, I added this as a limitation.

I will remove the limitation if it does not look correct.

- Ayan

>
> Cheers,
>

