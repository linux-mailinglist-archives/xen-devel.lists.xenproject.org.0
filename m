Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF83652526
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 18:08:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467249.726288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7g5r-0008RC-0D; Tue, 20 Dec 2022 17:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467249.726288; Tue, 20 Dec 2022 17:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7g5q-0008Oq-Sl; Tue, 20 Dec 2022 17:07:54 +0000
Received: by outflank-mailman (input) for mailman id 467249;
 Tue, 20 Dec 2022 17:07:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gzLQ=4S=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p7g5o-0008Og-TC
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 17:07:53 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5264633-8088-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 18:07:51 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY5PR12MB6227.namprd12.prod.outlook.com (2603:10b6:930:21::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 17:07:47 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c%5]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 17:07:47 +0000
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
X-Inumbo-ID: d5264633-8088-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwnT9XFhIFyW8WuGpEdgOSVGePMoWVSuNT/3ky4pH0fxp79nyGslwMVjdFxo+qVCQUI446tJH7Pm+zVrQLJtqipGNnK4H6X8KSNOmsyDK9KkZWJI7T9Lb2dt1AosT00qrevXhCzW6U18aApaockaa9BB3r6WR8Or/PV45Ic3XphfW/B6fOJZ05Ju3OXz4KnConsteU2jrPBz+MBRMDW4G2xEUTEo6Q6Cba7XICiACEzMy3aSRE/yripg9sX/e0W15g8jcP9T2T2NK20rsb02fPACEltjXDsMrDY2zcEC1WoTHLaw12g+BFTcK4GvFKIsUwXFckXWVuMgkzzftkYh9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEhGUn/lQwdw2g/z3zvgUxb3zB1m0xeJzjd34kUn9Gc=;
 b=aeJWha45xKNNwKwbMj2mppwVpMrNOAC8BrNN9zydhJxG/SY2+33olo7vkrUq/2kEyatRlJtWedbkRNGEkO4/VRwXYCKiYuclY4/qK6V6bCdiSJ+i04zfqIxKMhquv0a/AkV1676gbQjrrJxVeoxLKxYlsL9iXJ+zuJjBc8/r4uaWlbTbxAvQUYPOK8N1Zx3An4NqfawjYGg+E1zdUfAzZp+wWsTzj4NG1+OfCzaqEzZPgyaDALBfKG1vjh+WE3BMBskd6OBxlxJMvs71CmENDy0LMVGK0aW3oWCl3ISeiSDpREGGmyjMudM8Xje01OifpVz85uOwq6NeXoYHtIVzDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEhGUn/lQwdw2g/z3zvgUxb3zB1m0xeJzjd34kUn9Gc=;
 b=krZAKX5R1sICk7JHd5PJmovxxc27YCwqeSWh9qtUOuRlSPrCa0riVDeM/EWl/qjBlybWcexBkv/zs9LuyfHxFp3qSxkDtrY2RTgpID2vrgmBvPD0+e9zmpFYxjHWQNoimsO+iSFSKJpHf0K4ayngWhWU4loRC2HvbSpvrVwk21Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <90d42b8c-4919-0c7f-edfc-1f90ad347425@amd.com>
Date: Tue, 20 Dec 2022 17:07:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [XEN v3] xen/arm: Probe the entry point address of an uImage
 correctly
From: Ayan Kumar Halder <ayankuma@amd.com>
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221217193801.19485-1-ayan.kumar.halder@amd.com>
 <75635251-5f51-fbe0-28be-a99480541116@amd.com>
 <6e2b1f97-3e72-34b9-8faa-f00e79587b39@xen.org>
 <e2101505-ef3e-59f7-be2c-351ca9363249@amd.com>
 <9bd1a0a4-5d12-6984-0eb9-ed10303d5aae@xen.org>
 <b815229e-86da-f588-1b00-38c529504918@amd.com>
In-Reply-To: <b815229e-86da-f588-1b00-38c529504918@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0525.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::8) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CY5PR12MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: c1fb8a10-3f24-4a91-95dc-08dae2acb7f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hp2FiFcNVMQxEue7NwuJ8opsVZA2lLUGHYNMst1GaIwyETK/hzPWD75ltZivQeXvjMVkxgX2tdJeBb/B9oJAEAD7rlkoYf31wRtB4BHW5Z7bF/GT6RYiT+XCa8iq6CcBJGH6r9I0DA4kEXpNlXsfLE1eAK6gZ3OZn8wxaFjE8LM2KDfKjwAevDL+urlG3HxPVHyj6vT26Q9k9rfazkE+W3UYHQD5fXT1TGyy8pXp955hEd3Wd/zIPDvEirmflXBdagxCTcos85tyGbYLkmahsPaStzAuGkjxxdrQuJUlLfJGUQKq36d/bZqoARUCgyqoZr1YiaSDoA9IIr+38FxIjeSh9acQSe9ji2NIPDm0TKWKDbPL9jS2mgPhu1H3pJSMdxsw5I1l0+vKp1V28l93RDXsTq4GfqgqbxSGH7KKUCvWOprLX4/v8wDggVOu6Aa0iwVXU9hSYvGnBujVRGWSvTJpStfrgECrYJsFl7tSOj5YGl0sPWWZ3O6KmL4h7W/O9fEm4NDUlZkAZwDcB5CbTqf+amHsaBf2xVavJ3m6ukp6XZlxqIWr0nS6R2KclwUTkAOMgoKmJgmRmwCEmM/yAbfedoNtzPpMW6RyQST2WE7qcG2FMl1GBpF1A2LorvF5F6DEER0E+ADB/z/SHOxUxgCszQRPGzRu/XWap2aX2R5YNr+AtS6mzm8RXmhQio+ima0cj5aPqr2WjC4yHqPJKM7tlLQZRGbJZbcuC9RnsFQfHKOOIfNtXYlcOAqRGybB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199015)(6512007)(31696002)(66946007)(4326008)(66556008)(186003)(41300700001)(478600001)(2616005)(2906002)(83380400001)(6506007)(110136005)(53546011)(6666004)(316002)(38100700002)(966005)(5660300002)(66476007)(8936002)(6486002)(26005)(31686004)(36756003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWpyTEFya242dXVsWXpHUFdDT3p5OWtTcmdvS2JTVkI1Y0lUaGtSZHRUYUNV?=
 =?utf-8?B?UDZPd2pKbzAvV0RzcGphemVCOGhRSDJVcEpTaXlWU2tZL0tyWlpFZFQ4dXYx?=
 =?utf-8?B?QTRRNm91T3RWcnZ5eFdKa2xTOXRlYzArNmg2U3VTZy9KUHh5K0VEL1FzUHdq?=
 =?utf-8?B?aVB1UEh6eTJQWUFTSlNNVFgwQWFUSHRHY2IxSXd6YWp5Vy9jNDNZdTRaTmNx?=
 =?utf-8?B?dFoyT3dBSmtVVkt6aUZmNldGK2ZNTUZ4MXd4cTlXTmVXejlGb1BLdUZ3VGhq?=
 =?utf-8?B?eTUyZ2VHYUFVb2R3bDcvWkM4NkNOY2NVWGQ5SHdTYUZodzdUUWs4a1VYU0Y3?=
 =?utf-8?B?eko4a3ZWNEQ1VW1jWmtHeE5UN0NFNGZkaHpyMHViV1ExU2ttcFZNSW5vWTEw?=
 =?utf-8?B?dkVxeDhhblhFYURzeVFOK2ROVHh3ZUswdmpaZjlPZG04VWMyb21qdnBoQVFC?=
 =?utf-8?B?dG9LKzhNNzhTZkFadVd5Slo0NzkveDhUcmJIc2tMbkpiREp6SFBZV2gxWklX?=
 =?utf-8?B?NFMwV21OeWgvQWJROWo1UlRMcm9zU1VKUVB3UklodFlMdVFpUUxWS3Q4K050?=
 =?utf-8?B?STl2ZkJ4dlBETklyL1lGdG80VzNyMC8vQmk5bTlrRldzMkdTQURZMklKZ3lJ?=
 =?utf-8?B?MCs5cHhIZDRzd1l4YVJZN1JwQXZ4VGdjRUU5cFI0WmN5Sk1kMWdleTByKzhE?=
 =?utf-8?B?cGxPR3VacEhUTmNLMkJhbTh5Uzd5UnVKMFVKYmlMdEgrd0pwY1h5TnJ1Vk1D?=
 =?utf-8?B?ejJvdmNTc3lmQ3FjZHdjL0Z0dUtCUzlhQzREZTFpNUU1T0UzSjYrWWNFcEFt?=
 =?utf-8?B?dzUwM050RjY5WXlScjNEaGdCZ0VOWEhsU050RFdGRlBXT3Q5L3M1WXU4YmhD?=
 =?utf-8?B?OElxMUxKWVJpUTJtZkxFd3NPdkdIR0lwaTltWnB1eVprcWtMR3NkQTQ0ZmJN?=
 =?utf-8?B?ZzJ2blF6dVMvdDNZSzdYNTNqT2ptYVFlYTcrS3orSGg4bDU5UFY5d01HVjdt?=
 =?utf-8?B?M1BrYWFYS3VRR2VTQ2g0eUZaVFFyL3Y5dGRDcnAyazBKbXY4WnAvUGVkcmlo?=
 =?utf-8?B?enV2Z2RIMXhiWVhsK0VmMGhXYjlORFFDYVJ3UEtZV253OWQ1N1lER3pBd0x1?=
 =?utf-8?B?UXVpWmN1QXpxdXFYdnBQdVRud0RsZGxPcldBSnJkQzdxcnY4TkFuUzRzMGVC?=
 =?utf-8?B?Nk1odjh6bXVMZWc0Tncyc2kvNkZ1Q3U5OWp1dm43SWliMXRhTzM5c2JBRS9q?=
 =?utf-8?B?bTFDbTRRNElCWU16eGRuK21wOWpJQ3RqNFlxMjM1U1NERjhlZUdXc1RUb3hC?=
 =?utf-8?B?bGFvZG5SekdmYy9uaFRGRlBIN1NtdWJEUW1TMmtnd2JUMzdTNHVSYUdRY3NU?=
 =?utf-8?B?aTJKbjU1RnFlbUVWOWJjckNYdlFSODJxTjVWNXpXbzdscHFFZkxoTDFON0ly?=
 =?utf-8?B?V0QwMVRJYStJWVFOZGNPQ3U5eEQ2ci9YMC9nQUdkZkFpUWpyT3RzT2ZPQU8x?=
 =?utf-8?B?K3JwUk43bU9HUU1pU2ZER096dWlRRHFtVXNaYzFqNE95Zll4ZmY1VUt5RmFX?=
 =?utf-8?B?cWJ2dnVEMEpoRXdvT2RpeHRKcVc2Uk9HWE5mOCt5aEJuSG5uajc1S1N6UWsy?=
 =?utf-8?B?SXo2VmtJRXFBR0srK3QwMjZKc3JSZ01pR0p0WUtHWUk0TFNIOTJIV2MzaytV?=
 =?utf-8?B?dDVsamNpUDFncW9FSXF0Uk81Y1crUDlJRlFwNmI5bkM1UGMxRUl0Y3UrMks1?=
 =?utf-8?B?U0gvL2VMampHSnFVWlNVUFZHK3Z5M0RPUUNQT05qaDdlZFFEYTVqSS9zZVJp?=
 =?utf-8?B?Vk5wTFMxZWJReS9MSkY0Qlh1Mml5TDA3OVYyOTBzUzVSNGUwYWREOUE5TS9q?=
 =?utf-8?B?bGMvTjdJa1FFdlJzbTNUdk1vSCtUOEdVYzJiWXdEdzhoeVZCS1gvQ3ZSNEJm?=
 =?utf-8?B?dWpqZ1hXbStlamJOUHhqKzhKdTBuRUJyY1ppVjJsZ3BxNmc2cER4QnlYR1FY?=
 =?utf-8?B?bWpsSlYzUkY2WWx5Z0RSMm40RzlGNjdMc3NFVDFuM3NlYk1XODF0Qm5rUnRY?=
 =?utf-8?B?K1lpMmRxWXJnUEJDNG5YL2FtWUJrZ2kzVUZuRnFOalpPbUNBY1pUQlFCcks2?=
 =?utf-8?Q?CWs0WUIi0N2P11n0E3jHn6nEQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fb8a10-3f24-4a91-95dc-08dae2acb7f7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 17:07:47.7711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XyPRxtearQgI8ssgI9mhJr5PWd+rfaRRnUBL7azWRbHteMNViiRHjxEcU1kJPuCal/ttDJv71DUvqqEl4IeEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6227

Hi Julien,

I need a clarification.

On 20/12/2022 12:51, Ayan Kumar Halder wrote:
>
> On 20/12/2022 12:14, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 20/12/2022 10:44, Ayan Kumar Halder wrote:
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Currently, we support uImage headers for uncompressed 
>>>>>> images only.
>>>>>> +     * Thus, it is valid for the load address and start address 
>>>>>> to be the
>>>>>> +     * same. This is consistent with the uboot behavior (Refer
>>>>>> +     * "case IH_COMP_NONE" in image_decomp().
>>>>> Please make it clear that you are referring to uboot function.
>>>>
>>>> Could we avoid to mention the u-boot function? The reason I am 
>>>> asking is the code is in a different repo and the function name can 
>>>> easily change without us noticing (so the comment would rot).
>>>>
>>>> Is the behavior documented somewhere in U-boot (or online)? If not, 
>>>> what's the guarantee that it will not change?
>>>
>>> I could not find any documentation which states this. I found this 
>>> from the following in uboot source code.
>>>
>>> https://source.denx.de/u-boot/u-boot/-/blob/master/boot/image.c#L458
>>>
>>> AFAIU when kernel_uimage_probe() get invoked, the image has already 
>>> been decompressed. So, I added this as a limitation.
>>
>> I e looked at the U-boot code and, AFAIU, the check is merely to 
>> avoid the memcpy() if the image start matches the start of the 
>> decompression area. So I don't understand why we need the limitation 
>> in Xen.
>>
>> Now the lack of documentation (or at least I didn't find any) makes a 
>> bit more tricky to understand what the fields in the U-boot header 
>> are for. I have skimmed through the code and I disagree with the 
>> implementation you chose for Xen.
>>
>> The comment for 'ih_ep' suggests this is the entry point address. 
>> That's may be different from the beginning of your blob. I think this 
>> is what ih_load is for.
>>
>> So I think we want to load the blob at ih_load and then set pc to 
>> point to ih_ep. This will require a bit more work in Xen because the 
>> assumption so far is the entry point matches the start of the blob.
>>
>> Please let me known if I missed anything.
>
> I think you are correct. I will rework this to correctly handle load 
> address and entry point.

Is it fine to keep these two constraints ?

     /*
      * While uboot considers 0x0 to be a valid load/start address, for Xen
      * to mantain parity with zimage, we consider 0x0 to denote position
      * independent image. That means Xen is free to load such an image at
      * any valid address.
      * Thus, we will print an appropriate message.
      */
     if ( info->zimage.start == 0 )
         printk(XENLOG_INFO
                "No load address provided. Xen will decide where to load 
it.\n");

     /*
      * If the image supports position independent execution, then user 
cannot
      * provide an entry point as Xen will load such an image at any 
appropriate
      * memory address. Thus, we need to return error
      */
     if ( (info->zimage.start == 0) && (info->entry != 0) )
     {
         printk(XENLOG_ERROR
                "Entry point cannot be non zero for PIE image.\n");
         return -EINVAL;
     }

- Ayan

>
> - Ayan
>
>>
>> Cheers,
>>

