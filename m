Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09889647487
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 17:43:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457369.715255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Jze-0006N0-3c; Thu, 08 Dec 2022 16:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457369.715255; Thu, 08 Dec 2022 16:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Jze-0006Kh-0w; Thu, 08 Dec 2022 16:43:30 +0000
Received: by outflank-mailman (input) for mailman id 457369;
 Thu, 08 Dec 2022 16:43:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEW2=4G=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p3Jzc-0006KX-R5
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 16:43:28 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f796aa8-7717-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 17:43:27 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by PH0PR12MB7983.namprd12.prod.outlook.com (2603:10b6:510:28e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 16:43:22 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c%5]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 16:43:22 +0000
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
X-Inumbo-ID: 6f796aa8-7717-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ineSjuaZmzKVlRlQgXmiDYBQ2y8yJEPFltHGumnM6Syu+mGxYC1ADcynl6D2G1lLQVTQJvYfBVtHmf3QKQZ+22khvULvUt4XGeeYVz9ArfYgB/YQgJHLB/vQzxoxkF7ykzuvE9BjyliI4gc6KuTKczqaFT6akujcseoUu9RCWka/q5qzmupAcGmjEz/UIk9rJpN2/xsfywUC2PZWuvy7TsU3+xuFDgoFquOyXqaTC9jEJRxDWPQ0vjUFWWK0HVYecZb7weHOwy82Sb2F/Syl+xlz96ZIMwYdb2zv+fjEHC1o8SXpYNZ6/r6iDssw3rSmfbBLtp8AgkeB3QRODtL+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uBjLKKpDPL2N6TFYF+fPQL5JbTMW/VvE9QKLNfh9lg=;
 b=mOG2vQHcYcxGBFgK6lB9NBMqpvupWqSckTXJcb0sPtvDDUumJsYxPkzdk8WkE7MP8YtmNJACPHO6nnE0eHSy156+ReKUinbSKgdMt1Us1LcKbFMkF6vWn1sqWzbhMY/9g7Q+kdCBKlLLd2smRU6Wyxmn1n2AWOuWE/IFxDCbUZzhq4M5JEhftlcFCgMQRsc1VWyu59UXwv+pBmW5s1DGGjF9SqMd0yCUwtUgtoRGHG77EjJvdJ3CpYQ0O9LlfNoPTVB3EoMv6gXUDLGOBv3ui62Gzzno6zQuvXEecJhW8BRp8fhXEZFnz5PWL/l646OspscTkJzeYFSiZGp2rKyDJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uBjLKKpDPL2N6TFYF+fPQL5JbTMW/VvE9QKLNfh9lg=;
 b=fbftwfahMrBLVKwWLGe2XAqCqe1fPsD7tJwHSEHQRC3brf9m9xcZmzbIaDdnzMIZuhOb/UDKT145lCq2KC2CfRBrDmM4ec9ysKIJfU18UqfEss6akvyXQ0f95CFlw6v/1JGJWyDPtF/tRmwxcERVpwImsnKlVQ5IscBwmK40myA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <aa129163-cfad-415a-7067-1fb948087e2c@amd.com>
Date: Thu, 8 Dec 2022 16:43:16 +0000
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
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <e8aff19a-4992-9d35-4e78-9e64aec384f9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0165.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::8) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|PH0PR12MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a79cf1d-9188-473e-3912-08dad93b51c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zsTyalZ+cezgR9qeRzPUQi9OsV12l37FWAC0YBFhK3NVATy4kfPymG4nZpaia3fkH2R64CJ4XGwj94nTgUzmLC01WMyKvztbPpfdXZ7TWtWyI22F1eCBK8I/LO1RK82QiEPhr2M7JADAKS5vuNtLSyTc4IOfYOl+nna8zg1R8+dr1Kj0Vx+QFYBcryvJDkcWLV40vwzjp/YyGMibASdKdgFajrHdNCmE74esCL/fOV6ZWJ4FHy8n5Midh5RcbcBnUHw17QgnKspmA+L5NCYXidEAkeD7BdL+tQfzVtxHUCeBbHxHbgqREUWjXc5YUIPzthB0d+a+hmSppt6okoSkEw6dZzFD2XAycm6E9pFsjl1vyx0wbjxDcds0yMGZlTwDTaAoH9TNy0OeobbLAGHWI38TAEuchhjJxgAvn04At4T5sPmuDn8STOnUhiUqa1WZKjjChfTwsdZ2FvhjTzqMpfSg01wpDb5cblAlbPrj+AykBcIhWb8RAhnTPhRs+zNAS9jJiWT7FLdbrW1eWAzTeg5j+IFapTYQtsxsNXKqG/mo+FsvBXxNepR8tymz6wizTRFnwscEUqWbIDUIQHdAidaBvgq9znfIZSo6NkCvYGUQ8RQVzwgbjTvG7Ylr76DICAgTMT/2CCobf2YJ1JJEWENkEx3a5hsEgijc2l+ORSDqrs2/G2j7T/zEyusCA612y/c0pcSid8zt/W+7DcI9TtWgF/W5iNOKsl+sLy+CQTY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199015)(83380400001)(31686004)(31696002)(186003)(2616005)(26005)(6512007)(53546011)(6506007)(6666004)(110136005)(316002)(6486002)(38100700002)(4326008)(478600001)(66556008)(36756003)(66476007)(5660300002)(66946007)(41300700001)(8936002)(8676002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnJzc2FydHdiZitQTG5OeDFjdTRWWmYyQ2cxb1U3bUZ1UThDN2hwclI3UGhC?=
 =?utf-8?B?RE1WVTBVVFJ0b1JnT2U1dHYzZHVvUTZRRnZvMFJZNmgzOWFRM3p5NVhZSHd6?=
 =?utf-8?B?WWNSS3RuR014K0kycXNqdldlanFvcUJsSWQxYThJY1FHeXhJYkZBWmxCb2ZM?=
 =?utf-8?B?OWwybzFYdHpVYlA5ZHNZWFdUb1RjN0xtUTIvL2lWa3o2ejZwL0hZV1o2U20y?=
 =?utf-8?B?UmYzbGVKc3VremRlU0I0eklLNFJIUzBWVTFORFVmVk1zYW5aSDVNOFJMNm5S?=
 =?utf-8?B?OFNTeTVSTm43Zk01UllEcDNkV0E5TCtXdmJqR3FVVzdyNUsxTytMRFJRemhB?=
 =?utf-8?B?RnNzSnB3clp4QXlMU0lhMVp3MjdIVHQ0MGdDWnJPQVh0Qm1xV2pqZFR1WGg0?=
 =?utf-8?B?WXdNanFaVzU1SVN0b1pCVjNqLzdSNllMY3gxRmxLUlRzUEFVL2NIRXBkSkFY?=
 =?utf-8?B?SGhQYjBNWEpyRFFETmJPSXNjQ2R4dzRlMGh0RnA1TkNiaHFaY0MyQjVtaW1Z?=
 =?utf-8?B?ZUxRR3lDeFJyOWdSaVdIYlFuRUZ3QUpYUEV3bFRtNFlWTnFxdVRVRU5wa0gy?=
 =?utf-8?B?a004YU9ud3FkZEI0QjhnTGN4TXIrSURvVEg0a1B3c09wV3dIVlRtUnQxZWt4?=
 =?utf-8?B?SkFOWi9aaVJKcE9DN05BeTZqeEVxbzJnWFNjUDJYVGtDeEtoanZlbWhORUNB?=
 =?utf-8?B?Qm1md21OUFBIRWZMc1dCeW5FYUxkNmFqNDhYL3VBdFJ0MlB1a1hDcWNmQmNN?=
 =?utf-8?B?Tm5kZFhEejFVUnBmcVNtV2dySGtxVkR6UHA0TWI3MmFBZy8vc1ZYenR2L3dQ?=
 =?utf-8?B?QklmZjJEVXA2eE9vMVFrR0gzTXdPcHZVS1NtZEJMNS9jc0xnSHZNN21XVzY1?=
 =?utf-8?B?czZSOVhMOERnYlFZc21TTlJtUDUvazNLM3Ewb3d0Y2YzM0RIYUF2cjd3V001?=
 =?utf-8?B?YmliWGFPQkplb3lJLzZJOXF4Qnk1ZFJsZHVVeDdranBCZHhjb2JvUzNFcVBO?=
 =?utf-8?B?RGRuSDcrdC9yUnZrSGVEbEl0c3FSNkt1b0svdWF6eXVBMUNXTWc2U2JKOUVn?=
 =?utf-8?B?MGl6VmFlYXlIUE53d1JSdXd5YTNLQWo1ZHRkd1d3Y2lKR1VqcjlhTjVyMkxk?=
 =?utf-8?B?S1NPZVpScGNYVy9KVUNIMkNTdkVoZ1VOcHJiWHFNRk11dVovWDl0VVVQMHVO?=
 =?utf-8?B?eC9BeTlyM3VFbjBzRXNUemJWMEwzSFBPanQzeW1hTHJqYWtkRXZRTzdKbTRi?=
 =?utf-8?B?MmRGVUdXKzVGOVlWOFJ4TGFqVUNmZWJNdVl3dy82ZUR2QytLaXZJUko5a1ZX?=
 =?utf-8?B?ckFaRG15N0trRWw2TDNYTkhjTU9WU2hZcnJxMkJ5aDVSakVCQTd1VGRaYkUr?=
 =?utf-8?B?QzVwc1c3SHozZ3dRTG82bzdId1l4YUZzU0V5R2lkOGdoNTQyWUd0RjZPYnRO?=
 =?utf-8?B?Um1IK1oxdndoZW9mY1NEMTN6WDJOMHBrb0I5TWRGUXVNbi9HRDhiUllJVVdG?=
 =?utf-8?B?Zm41SGppK0htV0NUZkFJMzNMRWJCQUFIOC8zQ28yb2RmUEVWakUra3JZLytm?=
 =?utf-8?B?ZHlRRHVweVFpOVZPZGZNUytlVnhXWUYrM2R1MC9zVEtiWVlKWkZiQVRGUmtD?=
 =?utf-8?B?L0FPNml5Q0JDcERvc3d5Q2ZXYVNuT2puazFOcnhyZENOUmlYdGxua2ovV3ZV?=
 =?utf-8?B?V29iRE1MLzdDelQ0MmJmaXF1UXNFTjByZlo2dkFnNDd1NjkyZ1VUMHRQdWFu?=
 =?utf-8?B?RDh5R1hTcHo3czlOVnBDc3ZtOVcyMXNrREtHOTFHdTlZc0I3cWdpNkU0Q3JD?=
 =?utf-8?B?Wi8rcFRGNTYwRloyOUNCQ1k5ODhlR3VRbW9NL2ZIUlRxMGlCYXBwdWtpMFhX?=
 =?utf-8?B?OG90aGk4aWhTNFhZQXNCdzkxNHhYWmVYSEtCYkdzem45TlZBU2dmTXJZZitJ?=
 =?utf-8?B?eWI2WHBleTVuZDZYL2l1MUVsQ3JyQ3hzNlBaMEwrR0wxZ0MrYW9jajJSVWR6?=
 =?utf-8?B?TkhKYi9qcDhKZ2xXb0wxdkN0endpbUt0L3lyQVhzV3dBdkNDVCtHUmx4bTN5?=
 =?utf-8?B?cUNDRUJBbTkzdUFrOVFpRkk4aEd4emJlbXEvUm1kUDNyblg1QXZ4VXpJVFN1?=
 =?utf-8?Q?nXWvBr5Iumo+wo2/NrXCm44JO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a79cf1d-9188-473e-3912-08dad93b51c3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 16:43:22.6892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nW4lFDhv2yQt8SpIe4bOJ+MBTv50sCHoi1vj3o7rMtGi5Q3xdnrc1vFogVwEePmc5/JpIkWp6SHvivMySjASAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7983


On 08/12/2022 15:24, Michal Orzel wrote:
> Hi,
Hi,
>
> On 08/12/2022 14:51, Julien Grall wrote:
>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>
>>
>> Hi,
>>
>> Title extra NIT: I have seen it multiple time and so far refrain to say
>> it. Please use 'arm' rather than 'Arm'. This is for consistency in the
>> way we name the subsystem in the title.
>>
>> On 08/12/2022 12:49, Ayan Kumar Halder wrote:
>>> Currently, kernel_uimage_probe() does not set info->zimage.start. As a
>>> result, it contains the default value (ie 0). This causes,
>>> kernel_zimage_place() to treat the binary (contained within uImage) as
>>> position independent executable. Thus, it loads it at an incorrect address.
>>>
>>> The correct approach would be to read "uimage.ep" and set
>>> info->zimage.start. This will ensure that the binary is loaded at the
>>> correct address.
>> In non-statically allocated setup, a user doesn't know where the memory
>> for dom0/domU will be allocated.
>>
>> So I think this was correct to ignore the address. In fact, I am worry
>> that...
>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>>
>>> I uncovered this issue while loading Zephyr as a dom0less domU with Xen on
>>> R52 FVP. Zephyr builds with static device tree. Thus, the load address is
>>> always fixed.
>>>
>>>    xen/arch/arm/kernel.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>>> index 2556a45c38..e4e8c67669 100644
>>> --- a/xen/arch/arm/kernel.c
>>> +++ b/xen/arch/arm/kernel.c
>>> @@ -222,6 +222,8 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>>        if ( len > size - sizeof(uimage) )
>>>            return -EINVAL;
>>>
>>> +    info->zimage.start = be32_to_cpu(uimage.ep);
>> ... this will now ended up to break anyone that may have set an address
>> but didn't care where it should be loaded.
>>
>> I also understand your use case but now, we have contradictory
>> approaches. I am not entirely sure how we can solve it. We may have to
>> break those users (Cc some folks that may use it). But we should figure
>> out what is the alternative for them.
>>
>> If we decide to break those users, then this should be documented in the
>> commit message and in docs/misc/arm/booting.txt (which interestingly
>> didn't mention uImage).
>>
> So the first issue with Zephyr is that it does not support zImage protocol for arm32.
> Volodymyr added support only for Image header for arm64 Zephyr.
> I guess this is why Ayan, willing to boot it on Xen (arm32), decided to add u-boot header.
>
> Now, there is also a question about supporting arm64 uImage kernels. In Xen kernel_zimage_place,
> we do:
> #ifdef CONFIG_ARM_64
>      if ( info->type == DOMAIN_64BIT )
>          return info->mem.bank[0].start + info->zimage.text_offset;
> #endif
>
> So if we modify the uImage behavior for arm32, we will break consistency with arm64
> (we would take uImage entry point address into account for arm32 but not for arm64).
> At the moment at least they are in sync.

IIUC, at present arm64 and arm32 are not in sync.

For Arm32, we do not consider "info->zimage.text_offset".

- Ayan

>
>
>> Cheers,
>>
>> --
>> Julien Grall
> ~Michal

