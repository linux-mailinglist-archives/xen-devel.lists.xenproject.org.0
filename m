Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DF863C715
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 19:19:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449594.706442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p05Bm-0002EF-UR; Tue, 29 Nov 2022 18:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449594.706442; Tue, 29 Nov 2022 18:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p05Bm-0002CC-RO; Tue, 29 Nov 2022 18:18:38 +0000
Received: by outflank-mailman (input) for mailman id 449594;
 Tue, 29 Nov 2022 18:18:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uAXM=35=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p05Bl-0002C6-E8
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 18:18:37 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bd6884c-7012-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 19:18:35 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BY5PR12MB5013.namprd12.prod.outlook.com (2603:10b6:a03:1dc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 18:18:30 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57%4]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 18:18:30 +0000
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
X-Inumbo-ID: 3bd6884c-7012-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEs47kX7k/cyjaihOFqdxGx3irDJFi/acXPAchc5crg+RzXOCHO49JCypdCBFQBFg6Y4NRSScyFhKmQ7YAsVB9Iu6SRTcYaT413OVsCSZiksfBO6suNV9xgo4Nwj86AVT3pyYTc1QTM4MdU7nqZIgyAKtv1/KNmWs9VE2f+wY05YFq9rXhd6+J2XBGBTP8aVWOOKo4IxGpc7Wklx/ubnx8KUz9WKOy3hR4C0P+LEqsAB+s9PQMoqIOj//+HOvVpklm2kMKPTFS7cAGAuEX5HRhNzz1UA5t2yzzfbtU01gLEhYZExfO8+o/ngFdJeRnlvIQEFRGbisiPGZGWxzRCFaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLEchdli/7COZ67EyDB2QksOehcQuNWimF4IRF+xfTo=;
 b=WAcx3NKL0WcLvKzBy6B/I0dm3xWriJEVRnasX7Bk1tvRGX2rD9f1g81hNrDnR8vGwosGplxNLqJ4NsyL70WZ+LkFFr0PZ8Yhaa8fVOrK/biSITZOf8iArSmLbYfCHT478rKvsoZ3ZlLKGpk2/ZgPxDYmW4sBLuZDI4xNyK74lRUmB821RSXXvLdGeeoNwsjP+UNfqC84SWQUdExD8aPFrucegRlmMIBMFE1J9ZUweENxfO7tIHfRGmWmq3vLCmkgyUh1cefu/m6q2CwWJkSjouubj1ng/f7wLop33cV5sdEH/CZ8H5XCc/p4AIVBJ/iLljw//hjV3XfTq3f3HgFD+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLEchdli/7COZ67EyDB2QksOehcQuNWimF4IRF+xfTo=;
 b=L20EPAhFgMrOygNT4UZI9bm2F+xvp8fhdTqF8oIfiUtKPU5eU+4yJ59mVLtfaHAJRQ1RPNccjeZkBckuo1mjhFYZdpHO/x1UjJDgtIMfkiDLY+ciG4bd9EnVkIpgs0lCns/rgXV+BAW+vIHBq+MpzcMktxEYz7nzYrfp/Q7n+d0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <105a0d45-5b3d-7986-92c1-9a13eb803bd8@amd.com>
Date: Tue, 29 Nov 2022 18:18:24 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: Arm: AArch32: Need suggestions to support 32 bit physical
 addresses
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andre Przywara <andre.przywara@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>
References: <70651dbc-085d-706d-17d0-a419086a0700@amd.com>
 <a352eb18-0ae6-a1f3-08e6-87f53494ad8a@xen.org>
 <65891843-db28-e5dd-6e9e-3fb003fcabc5@amd.com>
 <ddeb7a03-cab3-2a26-7f64-3a1b5f0882d6@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <ddeb7a03-cab3-2a26-7f64-3a1b5f0882d6@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::20) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BY5PR12MB5013:EE_
X-MS-Office365-Filtering-Correlation-Id: d1562149-2135-427c-b0e3-08dad2361e0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h+sSEd7OhC0dGu7u1tPtV175mE+Y7NjIxE177n/ZTgP4lqGscigMLUoVqQ9FF16ebYngvHES7/S+zPBZjYnxfPvIS0cfCOYtR0a6F2iisfua1N7QTQ/UL4+x4zPeer+zudBx1+zUBFEezjfGiVyLpKRUo+89w7bGuFN3Iz7G58jleWaPhlsYP/FZonc6EZ0qeQ3hXCCOZlDnk7AD9YAdLz3Xt85UQYRLbrjBq1K2Ive/aaTCIDwDaDJ2iXd7mQovqS8vFyyS+/4u3KUEK6yF86Rqj5Z3A+f9LISK634peSlZrBdHkUcf20TeiK9Q2fR663SoDXA/t1nLeqCUXQdEkx8WWE9Ue+Nr4rNJw/ZSvRA/2izINKsaGtAoPh88bzXhn1eC218rMI0KOSuZWsFWVSfJ4drK+JISkEknf+JzvL1V4S4v7rRwjKuP89dU1z0ROvzljgQAfVYVt3q1nwX2jLC2WGA0LKnE8LQzz20OInCNdXzZEv4iw09dXlkaCX+Dqxd6+H81N8eXfcd7ZpG0OAew+VW/ZwARwig7yLpTijoLwrE6IXRG6l4nWNgOQSpdYTHJNY9WH0Mdd/cBrL3BKJ76R5tYRLi+lp1FDPrDUh9fd9eOAlgFMm0It3eVaeaghu3x61BBCv2UrwZEPXFE4Z2j0CAO2oJ7kEGNUmWpY4uescsvRgHNd4GV1pu3ZLKY04JxOWsHBMrT7xb+s6l0m5mafhnYus5UEBcpKqcULgk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(451199015)(6486002)(6506007)(31696002)(83380400001)(478600001)(31686004)(53546011)(6666004)(26005)(316002)(110136005)(6512007)(54906003)(41300700001)(2616005)(5660300002)(38100700002)(2906002)(8936002)(4326008)(66946007)(66476007)(36756003)(186003)(66556008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkZlWFVNZEdEeG13VUF4Q1NiTEtKZllvcHljenNmNnkyWkNuaHhnOVJpUjB1?=
 =?utf-8?B?VWRMVWZ2Nkwwb2gvRHJ0RDZkamhaSFFOVElxUDZSUDMrNlJMNGJkbFFmdGNR?=
 =?utf-8?B?azYxZkh2NzdYNnhQMTRudHJrMW85cmJXMjJ6MEFqS3Z2NVJTZU9zV2lUS1VH?=
 =?utf-8?B?emtsa1lYQUhLbU9XUEVCQ0lmR0JlU1c0UElZUzJwSGVLQ2hMNzJBTXNBK3ZZ?=
 =?utf-8?B?eFlEY21XWUpNNlV6VFExUm1VMGJDbWdZYzc3NkpWc0o5Y09mL1ZINTZIRjdG?=
 =?utf-8?B?M3lLVzVDazZ5UFg4cjdSWWgzQVpVdHZIa3g3Q2hoMStvVHV6QWtHOE5vdVJw?=
 =?utf-8?B?WVlOWWZjWm10SnVudnR2Wk5VSnE5TllHYUlWWVdjS3E2bTRyeHB4SjdKWTVa?=
 =?utf-8?B?dzg3cDBMbTZzdWlVY2E1aFFyNDM5djlpcHFjSVNxdDQ1WWcrZTlqY2NQdkxS?=
 =?utf-8?B?Q3hLU3hoMWFHdWNvY1NOWVFPMHRuRjYvSGMyWGJFY0pOMXBhN29iSVBTK2xS?=
 =?utf-8?B?VHcrbUMyenZsTHpyQUhNNlEvMHNDbEcyUW1kUkxJNHp6S3JGa1d2MmlxbzVl?=
 =?utf-8?B?TzY4aXlDblFCbDdsRkRoNysrOW4xS0U0K1pGY1RaSkFZSHlMUlJzQ3lLK0VI?=
 =?utf-8?B?M0Fmd1hUVDdMZXg0Q0Z3YzFzclBXbEVuQ0hySWVxcHVheTFLUHY4bEZramov?=
 =?utf-8?B?VGc2T2NCOUVHV0tEd2hmT2oyVWpCRC84WGE4bDJ6WVZKblVxanduTVFRTzlE?=
 =?utf-8?B?SFJWdEtod1RsZWNkYzlIWUZhR1ZDckdjcUpOQmZKam5BQTh1ckhuOFlUeXBq?=
 =?utf-8?B?UmdQM2tKSjltY1VNZmRCZ1Rsc3pRUUg3QXpmajd6S3hvamNET2FQM3ZLRnVm?=
 =?utf-8?B?aWZ5SzlxNjJNbGFHbFJkYmg2aFhPTnRCeGhLbVFWR1J3V29paUZqMTRXMjlK?=
 =?utf-8?B?ajljQWZDeWlUanFoTUx6R01GeWlpc05uVDIvVSs3ZjhQMFp6QW9HcEFZOFlo?=
 =?utf-8?B?dVp4ZVdLbFlGb0J2ODNRalRrcXRrSjZraFhSbllyYVJFemxNRC9GYUgxVTYx?=
 =?utf-8?B?ckVsaGFrL2tSZkVsZXh5eUdmS01uUUJydDNhZG9JZlRkMFZXU1JkUWQ3c1dZ?=
 =?utf-8?B?aFQxT2pHUitGL1I1QUZoN0FuR2Y2RUtZdGlhb3UrTFRBQS9PbmVrSnBSdGJj?=
 =?utf-8?B?czJYYTNFNDdwaEw1UHp5bzNVd3lqSGNBY1loVFJaVm1WNkc4a1ZZZUtCazZ2?=
 =?utf-8?B?VEErTVNSdmtPajZlNlEzOWV6dUYwVlFtMDF2d0xaYjF3Y21YbWsxeGM1SUo3?=
 =?utf-8?B?T2VDR1BlSldxVzE5ZEdqYmFhcVkvUzYyVTlPT016MkU2ZXNFbVZ5NVRmSFFV?=
 =?utf-8?B?NDhaWVA3NDJCNWdEMmJtMzc4YktDKysrN1AwR0tNb2h4MkVIa2cvYzdrLzgr?=
 =?utf-8?B?Wm1UaVcrMnRFTGpibCtQQmtaQ3o0MGN6dm40VzFybzVPVHkvNnhsL0VKZ1hP?=
 =?utf-8?B?Y0pyNmxzV1dZTXZxMHNBUUxHNTR6bzdydEtmd1RpU1BIYm9IWTdTKzBYdTl4?=
 =?utf-8?B?UGV5aDBuZ3V0OGNad291UmR4VTBjMlBqdlMrdUlPQXdxdlBDU3RDRDNCVWhy?=
 =?utf-8?B?Y2dGYnp5eVNmY3g0VS9FekE2akMvTFVKWFJCcnBvMm96UkFnTWRHNVFoSTUz?=
 =?utf-8?B?QzRzOUVSL1EvUXNiWUx6QmpRYUpVdkJXR2ZrU0lqWlFQTEIwcnMvd2J5WEdt?=
 =?utf-8?B?V21SdG44U3NqK2x3YUV5Q2ZiYVQ3ZW5GajhPZ2RUSXEydkVxd2FSdnRuOXNJ?=
 =?utf-8?B?ckFNcTV4a1hKKzdocG9vMTFIdzljMTIxWG9Ub0NJOFlVMlBzRHRPbFgwMnJG?=
 =?utf-8?B?L1NwVXROTzZMbHU4QlpQKy84NE9IeldyVU1PYytZS1E4QUVteEg3cGpaWTI0?=
 =?utf-8?B?d2pmVkMrRm55UGNFN1RDNFJ5U1g5RjNRSWZIU1EwWitPRkhOOU9EZUw4WE1k?=
 =?utf-8?B?dEYyNm5CWWFra2NUT1daWXh0VVZqRmhKbTc3RGFUTXQ1UlZnZUxOaHoycUc5?=
 =?utf-8?B?Z2hBbi9RWlBYQTlPTWlueEJIaDZUQVJycngxN1hrZlVOSE0yUGNHMWQzMVFl?=
 =?utf-8?Q?kTVtRLMYRFNXZ6+zV0fjTG0eC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1562149-2135-427c-b0e3-08dad2361e0d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 18:18:30.3751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PYInTNxF2CUZHISAwK5BYAWDfFQTPGBBATZ6Kpg7EXvkPA7sicVvcMWL9FhC7Y3tRTdz/Thv+oG3oQrzekTjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5013

On 29/11/2022 15:52, Julien Grall wrote:
>
>
> On 29/11/2022 16:23, Ayan Kumar Halder wrote:
>>
>> On 29/11/2022 14:52, Julien Grall wrote:
>>>
>>>
>>> On 29/11/2022 14:57, Ayan Kumar Halder wrote:
>>>> Hi All,
>>>
>>> Hi,
Hi Julien,
>>
>> Hi Julien,
>>
>> Many thanks for your inputs.
>>
>>>
>>>> I am trying to gather opinions on how to support 32 bit physical 
>>>> addresses to enable Xen running on R52.
>>>>
>>>> Refer Cortex R52 TRM, Section 2.2.12 "Memory Model"
>>>>
>>>> "...This is because the physical address is always the same as the 
>>>> virtual address...The virtual and physical address can be treated 
>>>> as synonyms for Cortex-R52."
>>>>
>>>> Thus, I understand that R52 supports 32 bit physical address only. 
>>>> This is a bit different from Armv7 systems which supports Large 
>>>> Physical Address Extension (LPAE) ie 40 bit physical addresses. >
>>>> Please correct me if I misunderstand something. >
>>>> So currently, Xen supports 64 bit physical address for Arm_32 (ie 
>>>> Armv7) based system.
>>>
>>> Xen supports *up to* 64-bit physical address. This may be lower in 
>>> the HW (not all the Armv7 HW supports 40-bit address).
>>>
>>>> My aim is to enable support for 32 bit physical address.
>>>
>>> Technically this is already supported because this is a subset of 
>>> 64-bit. I can see a use case (even on non R* HW) where you may want 
>>> to use 32-bit paddr_t to reduce the code size (and registers used).
>>>
>>> But I think that's more an optimization that rather than been 
>>> necessary.
>>>
>>>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>>>> index 6014c0f852..4f8b5fc4be 100644
>>>> --- a/xen/arch/arm/bootfdt.c
>>>> +++ b/xen/arch/arm/bootfdt.c
>>>> @@ -56,10 +56,10 @@ static bool __init 
>>>> device_tree_node_compatible(const void *fdt, int node,
>>>>   }
>>>>
>>>>   void __init device_tree_get_reg(const __be32 **cell, u32 
>>>> address_cells,
>>>> -                                u32 size_cells, u64 *start, u64 
>>>> *size)
>>>> +                                u32 size_cells, paddr_t *start, 
>>>> paddr_t *size)
>>>
>>> This needs to stay uint64_t because the Device-Tree may contain 
>>> 64-bit values and you...
>>
>> Are you saying that the device tree may contain 64 bit addresses even 
>> though the platform is 32 bit ?
>
> There should not be any 32-bit address but you don't know what the 
> device-tree is containing because this is user input.
>
> This is not the business of the Device-Tree parser to decide whether 
> the value should be downcasted or rejected. That's the goal of the 
> callers.
>
>>
>> I think then this approach (ie "typedef u32 paddr_t" for 32 bit 
>> system) is incorrect.
> I am a bit surprised you came to this conclusion just based on the 
> above. As I said before, there are benefits to allow Xen to be built 
> with 32-bit (e.g. smaller code size and better use of the register).
>
>>
>> Then, the other option would be to downcast 64 bit physical addresses 
>> to 32 bits, when we need to translate pa to va.
>>
>> Do you think this approach looks better ?
>
> Some of the changes you propose are questionable (see below).
>
>> Or any better suggestions ?
>
> Rework you previous approach by not touching the Device-Tree code.
>
>> diff --git a/xen/arch/arm/include/asm/mm_mpu.h 
>> b/xen/arch/arm/include/asm/mm_mpu.h
>> index 306a4c497c..f4f5ae1488 100644
>> --- a/xen/arch/arm/include/asm/mm_mpu.h
>> +++ b/xen/arch/arm/include/asm/mm_mpu.h
>> @@ -89,7 +89,18 @@ static inline paddr_t __virt_to_maddr(vaddr_t va)
>>   static inline void *maddr_to_virt(paddr_t ma)
>>   {
>>       /* In MPU system, VA == PA. */
>> +#ifdef CONFIG_AARCH32_V8R
>> +    /*
>> +     * 64 bit physical addresses are not supported.
>> +     * Raise a bug if one encounters 64 bit address.
>> +     */
>> +    if (ma >> BITOP_BITS_PER_WORD)
>> +        BUG();
> I don't particularly like the runtime check when you should be able to 
> sanitize the values before hand.

I think we can replace BUG() with ASSERT(). This is similar to what is 
being done today.

>
>> +
>> +    return (void *) ((uint32_t)(ma & GENMASK(31,0)));
>
> & GENMASK (...) is a bit pointless here given that you above confirmed 
> the top 32-bit are zeroed.
>
>> +#else
>>       return (void *)ma;
>> +#endif
>>   }
>>
>>   /*
>> diff --git a/xen/arch/arm/include/asm/setup.h 
>> b/xen/arch/arm/include/asm/setup.h
>> index b3330cd584..3f4ac7f475 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -119,7 +119,11 @@ extern struct bootinfo bootinfo;
>>
>>   extern domid_t max_init_domid;
>>
>> +#ifdef CONFIG_AARCH32_V8R
>> +void copy_from_paddr(void *dst, uint32_t paddr, unsigned long len);
>> +#else
>>   void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
>> +#endif
>
> I don't understand why the probably needs to be changed here...
>
>>
>>   size_t estimate_efi_size(unsigned int mem_nr_banks);
>>
>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>> index 04c05d7a05..7a7386f33a 100644
>> --- a/xen/arch/arm/kernel.c
>> +++ b/xen/arch/arm/kernel.c
>> @@ -46,7 +46,11 @@ struct minimal_dtb_header {
>>    * @paddr: source physical address
>>    * @len: length to copy
>>    */
>> +#ifdef CONFIG_AARCH32_V8R
>> +void __init copy_from_paddr(void *dst, uint32_t paddr, unsigned long 
>> len)
>> +#else
>>   void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long 
>> len)
>> +#endif
>>   {
>>       void *src = (void *)(unsigned long)paddr;
>
> ... because the code should compile without any issue. If you were 
> really concern about ignore the top 32-bit, then you could add a 
> BUG_ON() (This is OK because this is init code).
Yes, the code compiles fine without the change. I can put a BUG_ON() here.
>
>>
>> diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
>> index df43621ee7..62774aebc6 100644
>> --- a/xen/arch/arm/mm_mpu.c
>> +++ b/xen/arch/arm/mm_mpu.c
>> @@ -29,7 +29,7 @@
>>   #include <asm/arm64/fw_shareinfo.h>
>>   #endif
>>
>> -#ifdef CONFIG_AARCH32_ARMV8_R
>> +#ifdef CONFIG_AARCH32_V8R
>>   #include <asm/arm32/armv8r/sysregs.h>
>>   #endif
>>
>> @@ -414,7 +414,18 @@ void *ioremap_attr(paddr_t pa, size_t len, 
>> unsigned int attributes)
>>           return NULL;
>>       }
>>
>> +#ifdef CONFIG_AARCH32_V8R
>> +    /*
>> +     * 64 bit physical addresses are not supported.
>> +     * Raise a bug if one encounters 64 bit address.
>> +     */
>> +    if (pa >> BITOP_BITS_PER_WORD)
>> +        BUG();
>
> Why not returning NULL?
Ack
>
>> +
>> +    return (void *) ((uint32_t)(pa & GENMASK(31,0)));
>> +#else
>>       return (void *)pa;
>> +#endif
>>   }
>>
>>   static void clear_boot_mpumap(void)
>> @@ -1007,7 +1018,19 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>>       nr_xen_mpumap++;
>>
>>       /* VA == PA */
>> +#ifdef CONFIG_AARCH32_V8R
>> +
>> +    /*
>> +     * 64 bit physical addresses are not supported.
>> +     * Raise a bug if one encounters 64 bit address.
>> +     */
>> +    if (fdt_paddr >> BITOP_BITS_PER_WORD)
>> +        BUG();
>
> Same here question here.
>
>> +
>> +    fdt_virt = (void *) ((uint32_t)(fdt_paddr & GENMASK(31,0)));
>> +#else
>>       fdt_virt = (void *)fdt_paddr;
>> +#endif
>>
>>       if ( fdt_magic(fdt_virt) != FDT_MAGIC )
>>           return NULL;
>> @@ -1165,13 +1188,13 @@ void __init setup_protection_regions()
>>           {
>>               pr_t region;
>>               access_protection_region(true, &region, NULL, i);
>> -#ifdef CONFIG_AARCH32_ARMV8_R
>> +#ifdef CONFIG_AARCH32_V8R
>>               printk("Boot-time Xen MPU memory configuration. #%u : 
>> 0x%"PRIx32" - 0x%"PRIx32".\n",
>>                      i, pr_get_base(&region), pr_get_limit(&region));
>> -#else /* CONFIG_AARCH32_ARMV8_R */
>> +#else
>>               printk("Boot-time Xen MPU memory configuration. #%u : 
>> 0x%"PRIx64" - 0x%"PRIx64".\n",
>>                      i, pr_get_base(&region), pr_get_limit(&region));
>> -#endif /* CONFIG_AARCH32_ARMV8_R */
>> +#endif
>>           }
>>   }
>>
>> @@ -1262,8 +1285,13 @@ static int __init relocate_xen_mpumap(void)
>>       if ( !xen_mpumap )
>>           return -EINVAL;
>>
>> +#ifdef CONFIG_AARCH32_V8R
>> +    copy_from_paddr(xen_mpumap, (uint32_t)(pr_t *)boot_mpumap,
>> +                    sizeof(pr_t) * next_xen_mpumap_index);
>> +#else
>>       copy_from_paddr(xen_mpumap, (paddr_t)(pr_t *)boot_mpumap,
>>                       sizeof(pr_t) * next_xen_mpumap_index);
>> +#endif
>>
>>       clear_boot_mpumap();
>>
>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>> index 62afb07bc6..a73bf7de01 100644
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -2245,7 +2245,9 @@ void __init xenheap_max_mfn(unsigned long mfn)
>>   {
>>       ASSERT(!first_node_initialised);
>>       ASSERT(!xenheap_bits);
>> +#ifndef CONFIG_AARCH32_V8R
>>       BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG);
>> +#endif
>
> BUILD_BUG_ON() are used to indicate that the code would fall over the 
> check pass. I can't find the justification for this change in the 
> commit message.

I had a look at the following commit which introduced this, but I 
couldn't get the explaination for this.

commit 88e3ed61642bb393458acc7a9bd2f96edc337190
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Sep 1 14:02:57 2015 +0200

@Jan :- Do you know why BUILD_BUG_ON() was introduced ?

>
> It is also not clear why you are modifying this path because so far on 
> Arm32 the xenheap and domheap are separated for good reason (i.e. lack 
> of address space). Is this going to change with Armv8-R?
>
See this comment

  * CONFIG_SEPARATE_XENHEAP=y
  *
  *   The xen heap is maintained as an entirely separate heap.
  *
  *   Arch code arranges for some (perhaps small) amount of physical
  *   memory to be covered by a direct mapping and registers that
  *   memory as the Xen heap (via init_xenheap_pages()) and the
  *   remainder as the dom heap.
  *
  *   This mode of operation is most commonly used by 32-bit arches
  *   where the virtual address space is insufficient to map all RAM.

This is not true for R52 as the memory is mapped 1-1. Thus "VA == PA".

I don't think the lack of virtual address space applies to R52. Thus, 
CONFIG_SEPARATE_XENHEAP=N

- Ayan

> Cheers,
>

