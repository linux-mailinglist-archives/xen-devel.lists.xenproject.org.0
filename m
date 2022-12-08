Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 270526475B8
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 19:43:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457408.715310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3LrT-0007KM-MT; Thu, 08 Dec 2022 18:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457408.715310; Thu, 08 Dec 2022 18:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3LrT-0007I3-Ji; Thu, 08 Dec 2022 18:43:11 +0000
Received: by outflank-mailman (input) for mailman id 457408;
 Thu, 08 Dec 2022 18:43:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEW2=4G=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p3LrR-0007Hv-Sr
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 18:43:10 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20608.outbound.protection.outlook.com
 [2a01:111:f400:7eab::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25fe4e19-7728-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 19:43:05 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by PH0PR12MB5647.namprd12.prod.outlook.com (2603:10b6:510:144::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 18:43:02 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c%5]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 18:43:02 +0000
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
X-Inumbo-ID: 25fe4e19-7728-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V97heCySFwHHTIMQTyRV/llJ8JZL/7IO46H8z8lChvPSf7RPdmcitD7Qc8yKbIJB5K1JIs2/LhAgCXKFci5rzk+TNF8xNW52emLRX/GZNLN28XJaV4lCFvnqWBvUnQM3NidoMDwyN/Sp8zb7JUrrZrA7oGDilvpiH8bloZ/Y1qBxeAiK0yHApJt01keHuGmuD4LgpPOJOaizT7A/gHctXWyrRHh4gO0A6CrrGUhqEAKwIvu3O1i0rab6mYayQ1KpfOdDvDqB91mDMKCYspWARjxwVC3RQF+SzdwdP2dkJuGTChI146MNdoaCe5AN/c7RC/+JFZFFP0fHkWC6IFxYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3YNEGkRvOkFETdR44KinoqJSJ89kKx4bXB/ZW9X+p8=;
 b=e0V3CZMVhby59EMr4o8Mq+2t0AwTKdAR67K+9/yYo5LULcjq8ooyVK4wSm1nsSMGMSmn+zIJEDCLx5Wxx10hBG9g9ti1iA4J+xXXlNNTCojL46HoerLqCdulGzeKllXucEu0Z/PFgyInIos5lvK1BVm+VQjcaUbV/xZ1HGX+O2hiTBRkrGYByqXevGdqxHevbVUoGMjKtnNjPoGTUDu6dpQjCsjffghMP9AheK5xhR8+/0Q7DuWa3Z4h8S6kShzagxyyhkNPB3Ksk2p789/7ZU5YDTR5IjrN0BF1kfcg+g0UUxbzQ9qIXzODB6k98Slc0iWyRoTiSOtmabStivHwHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3YNEGkRvOkFETdR44KinoqJSJ89kKx4bXB/ZW9X+p8=;
 b=GoIrPrr2M7qII5R3f4fQTy78+lNjmgZSdOHbrx1oIf8/DTvub6fgJhhB/THNjYNkdcv3Mj0aqfkesSVMPCnsZFOIixXBkKxC+oXya99mjeotEVO6LJGBtuuKF8T50AXwX3LBSsAX7/mbxeN6s1ZlTq6ypxdXbWJTBmXU2AIzlqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ca2db58b-0183-8972-0336-25bcabc99824@amd.com>
Date: Thu, 8 Dec 2022 18:42:56 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN v1] xen/Arm: Probe the entry point address of an uImage
 correctly
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20221208124929.55268-1-ayan.kumar.halder@amd.com>
 <1ad3ee8c-991f-6e15-255f-ccc24dd5b84f@xen.org>
 <e8aff19a-4992-9d35-4e78-9e64aec384f9@amd.com>
 <00ab59fa-d449-255b-bfe3-aaacb87e34dd@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <00ab59fa-d449-255b-bfe3-aaacb87e34dd@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0178.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::21) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|PH0PR12MB5647:EE_
X-MS-Office365-Filtering-Correlation-Id: e708e888-79c0-498e-d8f9-08dad94c093f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J3HHr77GPFBAOoe/tUyw9+6ncCXUbJv5wK5meagQuQCZATSxeiZURe7mdLaU08ITf0zkIamkq0UkIKkqwUvsmRSasHaOfgyytpiF9o/OFgYthDUJyB13tfohut2WP/BEeMsN9IJI8CSj8ophz+B8mppS6RLxPOUuBrjNoeBdeeL2FLEIdXDBW8AZ2Hou1/u+pTaEFhrFlX/a7PMADXjR+dL0VzBkzl902A6f+al4t6HkGOjadRxLL8XBlOgbmp6V3k3gPcKTbJCESKOT6ujTNPHFSXZqN3K7XpHxTJEaCBz6p+cv3fJ/dHS6DdZjs/FxIe0JzoDIRBlybANGmMQsE4hBo3YNMLggAADTOHiRjPPexu3ZKpKqYYSRzfwWpWfoEoCmPgAkpqUetaO/HKSwICTO7jgFhdEU5KemI05/UUcXFITLjCJQL/TRy+DkAKJVH93rwkOENO+Cb3v0DE2ipxQZdCU4hbvBGVMd1totBHIrxgNgjN2zj3YwjZPH2Z2wreozmbMasOwLp0DS+nqsmTQ3398wwJnLHuxAVqIshQ6p5jw/mSzyigv7hPHf70+60KGILNUIeHqzFrkdOCX39A7whBKKgM7O/A4WoLHlopAx9BpiH1k3LJEGQewDPjGif9Gii/J2K90O6LuNTnnIalGUG5v/Upmr7hbhxIA7d2kuQ+sNZkaueb0Vkf7HDW9oin5G7KdZTHet/Oh+qalD85OM9hJOWIvmgHPGfDx17mh2d8G0rT349Tpx+sNMxWK8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199015)(38100700002)(6486002)(966005)(31686004)(6666004)(6506007)(53546011)(2616005)(478600001)(316002)(6512007)(186003)(83380400001)(31696002)(36756003)(66556008)(8676002)(4326008)(66946007)(41300700001)(66476007)(26005)(2906002)(110136005)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTViWjNHU1liaW01OEx4OUJHWjVuTTNkSm5FTkFpYVFSejhGUTl0WWY1RGxM?=
 =?utf-8?B?NXhwQnlwR2RDMWQ4N0RidTU5Z0tFQ0xOeVNzb0tKL2JBZG1PTE4wWkJURUV2?=
 =?utf-8?B?YW5NQlVsNVo2SXRqVzZ6eXFjQ2ZTN054NGcybXg1K01yOE1FR0szTkF3WXRU?=
 =?utf-8?B?RDdMUktWMFFVeHUxL1hscjNVNEpJUUtJRUVYOGV0alBhKzBpU1V3Z21Uc2xy?=
 =?utf-8?B?UXdhOEFRbmNlQVE0Tm5USjJXRWg1TUoxVHVRL1dBdWJDaGhRejBiZnBLRmdV?=
 =?utf-8?B?MXpIK3YyVVZqTk5zUm94eXN0cVVQSHpCa09yc0U0RVp6NSs3aW9ZMnNKQlhl?=
 =?utf-8?B?dnExSGp5UjZHNUZLUUtKYlFrQ040emgxajJQblhEZW1MTmx1cjNtS2xOSk9B?=
 =?utf-8?B?OW1IaWtkblZnbk5Xb05uYmxiY1NrdEdPcmtGQVZqZ1hxc3o0RTdJQUtFSUNB?=
 =?utf-8?B?VUF3Rktsb0JsN3RuTlhMQkVXcG9CVnF3K0UrdXpGbVpaaytZWUZrS3VTdnQ3?=
 =?utf-8?B?cmxqays0MW1HZDJQbHRpdmNlTGdDWCtSN1c1MVk1QWxmditJeHVZTWg5Nlpo?=
 =?utf-8?B?RUhDcG1hSVlQNkUySlBHbEJ6ajRocWlvS0dvc2JlN3FPK1hhMm9JUWlMR2pZ?=
 =?utf-8?B?MXhsV0hMNCtDNk9nQjJFS1RUNW15N1Q1MGVFUldSZFZTVU51YUZvMHpzUFYv?=
 =?utf-8?B?NTFGZFh1Vm5ocUttQVlvZmIyN3BNZWNXMUl6ZGNnMEdxUjN0Um10cUV5ckRH?=
 =?utf-8?B?QWVUSFBJL3FwOFRVazV1Z0VBYnIwRjhWRWZlNCtTdlo2Y2J5NUhOSDcxMjU0?=
 =?utf-8?B?UjZsQlVjVlJUejhnZlcycEs0QVl2elVzbFNNcitPWkVGbnNSWXhmNXhQbGlw?=
 =?utf-8?B?Y0wwL01BeXJoQ2g1b2pseUlUdkhmbHVBT0R6KzhJU0NzZTI1aFdzR1FQRHdv?=
 =?utf-8?B?WGt0QXlpV3h0T3gwOVZ2VTRwT3JwTFlNa3drQlQ3dlhwZmxsN1RTdzF6OG93?=
 =?utf-8?B?MEdYTnhGQS8rbzBRZ2dhT2ZOdXJGU2ZIbmtGM0RmbTZYTE1YdW92VUFsNjhX?=
 =?utf-8?B?K013cWQ4WEpySmNjcDYrd2ROaTlKYkg4TnFKcllCM3BtdEpjUy9Fb0VLTlEw?=
 =?utf-8?B?T0UwSnZwc2pmSHJPU1FmRWVOMUZIdms4aVR2SVVxeUhEZVFNMFRGa25ZUCtX?=
 =?utf-8?B?UlBGL0YrU2hFcEhNaTFZcDNTdHplaklpbEZOY0RWdk1CWjQreHpzNXpFUlNj?=
 =?utf-8?B?MmlKeVFXcFJTcGgwQVliRWtOM1F4SGV3MktpVHZrMjhyM05XaWkzaFJLR1R1?=
 =?utf-8?B?SExySFFQQlpGWGU5SEtlTkNUTDBCeGw3S1NKUnJxdFJQd05sWTlYWUtLcUl2?=
 =?utf-8?B?SW4vaVU2dHFJZ2dQTndpV3E4dDl1cVpVSWlPa0JWeWNTWDhQSHZxZTdzNmdX?=
 =?utf-8?B?eldTUm9BbnF4MHdhSld5ejBBRkJQQ0MzSWJLVkFrRjZCYnJacU0zRWQxSUJk?=
 =?utf-8?B?OHBvYlBQWFBVaHZXOC9iZVZCbXcvdlU2Q0pPNjIzeEhPWmcvQUhORXhSVUdu?=
 =?utf-8?B?aHVlREdJck9DKzBQSVFkQXlGeFR5WHByYzRRSDlSYnpFZ1hyNXBCcUxINnhp?=
 =?utf-8?B?K2RuQ0JJcmUyK2xNWW9JRzcwb08yRDZpdjFPRktFL0ZZc0NtQTluZ216ajBZ?=
 =?utf-8?B?UkVqNjdVSkdOTWd2b29JZEI4Z0ZNdXArMVVsU0RKdE9OYjVCNHhNRVB6d3hl?=
 =?utf-8?B?dkthY1liRTlGcW9VaHZ6YkJialpmMUhHdmZ4cTJOM1NKWXpOMUxUcE5NVXp0?=
 =?utf-8?B?dEIvK0hHMmhtT2EvcDZKZ3RibWl2V2JCMCtvc24vb1p0MkRTWkdybU1FZ2pm?=
 =?utf-8?B?MVZSaFVqaUkrNXd5NG9mYjZUejFuTkFXaEFZUDNBZWp1UXNSQ2g3NWJOa2hS?=
 =?utf-8?B?VVllRzE4ZXNqMkIydFdxcEt0akY5RGZyZ2tndWhDblcxTUZYMElBdEdGZTY2?=
 =?utf-8?B?WWpQbVhSanJETjlrN3lEQU43V0hFNmFjRGpqUmFJamIwMTJvSmRkQ0FERFE0?=
 =?utf-8?B?NHRnOUVJN1RsZEgwREdGQjhKN0ttUFlpeHBtMFROenJURmxuVzZsNTB4UVgx?=
 =?utf-8?Q?22lNVlmMp0FAFdhOUJA1FlPTE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e708e888-79c0-498e-d8f9-08dad94c093f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 18:43:02.4454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PIt7ptq/uQDb6UIRzP5OXRir3lftVKVmW+x5FsZ7oR7AUgOb/EhwDtaGBPXJS2ChB+QuFjpYpDdtJE9n6o89YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5647


On 08/12/2022 16:53, Julien Grall wrote:
> Hi,
Hi,
>
> On 08/12/2022 15:24, Michal Orzel wrote:
>> On 08/12/2022 14:51, Julien Grall wrote:
>>> Caution: This message originated from an External Source. Use proper 
>>> caution when opening attachments, clicking links, or responding.
>>>
>>>
>>> Hi,
>>>
>>> Title extra NIT: I have seen it multiple time and so far refrain to say
>>> it. Please use 'arm' rather than 'Arm'. This is for consistency in the
>>> way we name the subsystem in the title.
>>>
>>> On 08/12/2022 12:49, Ayan Kumar Halder wrote:
>>>> Currently, kernel_uimage_probe() does not set info->zimage.start. As a
>>>> result, it contains the default value (ie 0). This causes,
>>>> kernel_zimage_place() to treat the binary (contained within uImage) as
>>>> position independent executable. Thus, it loads it at an incorrect 
>>>> address.
>>>>
>>>> The correct approach would be to read "uimage.ep" and set
>>>> info->zimage.start. This will ensure that the binary is loaded at the
>>>> correct address.
>>>
>>> In non-statically allocated setup, a user doesn't know where the memory
>>> for dom0/domU will be allocated.
>>>
>>> So I think this was correct to ignore the address. In fact, I am worry
>>> that...
>>>
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> ---
>>>>
>>>> I uncovered this issue while loading Zephyr as a dom0less domU with 
>>>> Xen on
>>>> R52 FVP. Zephyr builds with static device tree. Thus, the load 
>>>> address is
>>>> always fixed.
>>>>
>>>>    xen/arch/arm/kernel.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>>>> index 2556a45c38..e4e8c67669 100644
>>>> --- a/xen/arch/arm/kernel.c
>>>> +++ b/xen/arch/arm/kernel.c
>>>> @@ -222,6 +222,8 @@ static int __init kernel_uimage_probe(struct 
>>>> kernel_info *info,
>>>>        if ( len > size - sizeof(uimage) )
>>>>            return -EINVAL;
>>>>
>>>> +    info->zimage.start = be32_to_cpu(uimage.ep);
>>> ... this will now ended up to break anyone that may have set an address
>>> but didn't care where it should be loaded.
>>>
>>> I also understand your use case but now, we have contradictory
>>> approaches. I am not entirely sure how we can solve it. We may have to
>>> break those users (Cc some folks that may use it). But we should figure
>>> out what is the alternative for them.
>>>
>>> If we decide to break those users, then this should be documented in 
>>> the
>>> commit message and in docs/misc/arm/booting.txt (which interestingly
>>> didn't mention uImage).
>>>
>> So the first issue with Zephyr is that it does not support zImage 
>> protocol for arm32.
>> Volodymyr added support only for Image header for arm64 Zephyr.
>> I guess this is why Ayan, willing to boot it on Xen (arm32), decided 
>> to add u-boot header.
>
> If that's the only reason, then I would rather prefer if we go with 
> zImage for a few reasons:
>  - The zImage protocol has at least some documentation (not perfect) 
> of the expected state of the memory/registers when jumping to the image.
>  - AFAICT libxl is not (yet) supporting uImage. So this means zephyr 
> cannot be loaded on older Xen releases (not great).

I am exploring for a similar option as Volodymyr ie support zimage 
protocol for arm32.

But for that I need some public documentation that explains the zimage 
header format for arm32.

Refer xen/arch/arm/kernel.c

#define ZIMAGE32_MAGIC_OFFSET 0x24
#define ZIMAGE32_START_OFFSET 0x28
#define ZIMAGE32_END_OFFSET   0x2c
#define ZIMAGE32_HEADER_LEN   0x30

#define ZIMAGE32_MAGIC 0x016f2818

Is this documented anywhere ?

I had a look at 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm/booting.rst 
, but there is nothing that explains the header format.

>
> Note this doesn't mean we should not fix Xen for uImage.
>
>> Now, there is also a question about supporting arm64 uImage kernels. 
>> In Xen kernel_zimage_place,
>> we do:
>> #ifdef CONFIG_ARM_64
>>      if ( info->type == DOMAIN_64BIT )
>>          return info->mem.bank[0].start + info->zimage.text_offset;
>> #endif
>>
>> So if we modify the uImage behavior for arm32, we will break 
>> consistency with arm64
>> (we would take uImage entry point address into account for arm32 but 
>> not for arm64).
>> At the moment at least they are in sync.
>
> That's a good point. It would be best if the behavior is consistent.

Currently, kernel_zimage_place() is called for both uImage and zImage.

Will it be sane if we write a different function for uImage ?

Something like this ...

static paddr_t __init kernel_uimage_place(struct kernel_info *info)

{

     /* Read and return uImage header's load address */

     return be32_to_cpu(uimage.load);

}

This will be consistent across arm32 and arm64

- Ayan

>
> Cheers,
>

