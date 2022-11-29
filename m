Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E149C63C3A3
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 16:24:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449491.706272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p02Sc-0007lt-FQ; Tue, 29 Nov 2022 15:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449491.706272; Tue, 29 Nov 2022 15:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p02Sc-0007jU-Bs; Tue, 29 Nov 2022 15:23:50 +0000
Received: by outflank-mailman (input) for mailman id 449491;
 Tue, 29 Nov 2022 15:23:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uAXM=35=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p02Sb-0007jO-5H
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 15:23:49 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0b8a1b8-6ff9-11ed-8fd2-01056ac49cbb;
 Tue, 29 Nov 2022 16:23:47 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 15:23:41 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57%4]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 15:23:41 +0000
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
X-Inumbo-ID: d0b8a1b8-6ff9-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8IIdCytrFE6bh88IMZ5jvkVlQO9sShi9xQO0sXo6X4S4un02NqU1V2GlBtffpjwUI0bvjkvK25Anm23IKd9/hF79FaMINgqSkoFQTSPJOJxpx1HuFBu4EBoYsLdoJLZagFn5Pdj+tJ8ahrE0K2uSWsrCbUZ9wKZrQFjhZTVnBlUFWmayxgU7JWBykoRBqBBI7q1QSG41DgsnxFSynHssnmRKZt1eJBLZX+wxLiEWsXogm/tNpiZGB4atmiOS8ZFC+SjF9bwQF4BvLVPp3W9MeHrSt7C4X3Ek9XSbH4/WhSzkLgiTzPJwoAOnGatKineBBjb2M1IWdyihl4lPriXSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fy9qUZEtCKNyCr9aWUDhk0VI5EFrCeZr6WdTaZrEWoM=;
 b=Msnuln7zhv4pPhpJzk54D1OKVOwXDbog3AcYZMvAqjnleBu+s5L9nFi2RN9fzFpfX9sLj9hnchDME3nsovXD854dVViPaqJegeCPnDeaqWNlkmk2ftrW7RC2sPLC6mdC4wFRAAPuZaPltNSytRWtZiU8s0PdMILyHm7jVg3cPoFjcLoVWnnhwuLbhnI+uX04PnkGaTsmyrZ2iNKuud+2v7FcoJN+dT0aODJzB/ifgJ0ne6wedx7piJc4o6GsPYOpcGcQ/gab6WGMEUMP7h1LG3vb3p/GBZvK2uQoh2qZkhLA4IZyZKsgjacMGQ94c8VYok3q5rlR1WpcEMaOwWJ4yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fy9qUZEtCKNyCr9aWUDhk0VI5EFrCeZr6WdTaZrEWoM=;
 b=Qe5evaOg6+e+JaTzCwQrzI1wJqjQPNXyoVHx91uUHUujld4fPF3LurtoL291B0xmrWOLGIW28WPsoqI17iKTTkCQLkJdDjmiNWTjwbTCDyPtLsVOXrRbfKztiiDu20Lp0xoBN+b3hczuuISnVoXYgO3Bhe4Qbots+GtxvjsV3TI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <65891843-db28-e5dd-6e9e-3fb003fcabc5@amd.com>
Date: Tue, 29 Nov 2022 15:23:35 +0000
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
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <a352eb18-0ae6-a1f3-08e6-87f53494ad8a@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0230.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::6) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MN2PR12MB4488:EE_
X-MS-Office365-Filtering-Correlation-Id: 3133e97d-e347-49de-2559-08dad21db204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/NfxWQJG7wxVVhe3XQLpiE8BgWryZo7FNb7F+bKFq+ZqXqztrgo4Lf4qpLphprB7RR+TehJjOQVeNKn/j5HMKRMMV97CvXVliKyzHhMAxsV8vfKEiMNJDFSN2DMe0TTLfUGOvEAr6fUmWGGWUfjUlvidHu738bseieems3YYwMFc5ayQG6RHSHsmGsiO4OUF+aVCN7dFheZT4uJCL4k9ojcfHCVUpWVeHv1LhyoV/THbL6pjMKnAV7vHm9yecg09ZwrS+3Zo5+j98eWruirr3ym1JbDGYFSJ+PlEt0lq75yXzKGv+6/kIe3NHpW7ukUr6a2vLJAocIy4IuxgzYbJdVw+3jAz7OZPwuW0nEaHUde1GlmcKU8ix6aSBwX/nlgwVL3EcPSjdTYXBHd26fvdGPBRAs4a+SyJ+rCQsYqFMO98ejOKYyKhtNCZhFN58XxdM4XWYYMFqFt0RUigN3ffpvQWmK2Fv7YY13tx7hwe/M1EIwwKVZyunrKUHCJyXa5KfECYQyEYe/SMTrekqmzBD0IMC6EFhJ2ZF0Gtnuh0YZy85Nbc6qVUDcXtzx1yCeLaXOfmPEfOXx6y2RzO+tJu8NUbvl0krlurwe9G3834r4sTU1t8Q9SUJEydsBM94q8HbhlRQjFrN7aJpOgXmPaXdCo3Q4huy/I9EO4cM1wCRos7o125c6HGBW5EdBySxeYN5m2ky4KptWFds+xQoLHR8jre7xjc8vSY1vT41EuMHXs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199015)(2906002)(31686004)(4326008)(41300700001)(66476007)(66556008)(186003)(54906003)(8676002)(36756003)(316002)(110136005)(8936002)(5660300002)(26005)(6512007)(478600001)(6486002)(2616005)(6666004)(31696002)(66946007)(53546011)(6506007)(38100700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXQ1dGE5TzBPTERrV0xBa3lyOTRGdC92bjZ3eVBHQ0cwNTVwQk9QM1AwL1R2?=
 =?utf-8?B?U21xV2NoejFlNDQyKzRITXp2ZnJVS0ZBWGRvRCsxS3RLdjg1NUh0RVpLWkpa?=
 =?utf-8?B?SFNpWFRVZEZ5eEtyaTBCdm1VWWZlNi9Ud3J0Y1lhWUdndkc1NXVkVXB1dEJ1?=
 =?utf-8?B?dFpwR0tJdjlaZnhXbmY5NWtZOVVxSmlFZ1dzSTVzYThSQnVadHpuZXNRajFw?=
 =?utf-8?B?czFPWXo0aThxemhJN29lVHlxYjNkRkx4Z3pKVnhxWVpFMG9aWGprRXZHaTdW?=
 =?utf-8?B?Z2lxMGxpRTVrZDJ1TDd5SnFkZkt2QjV1K01VRllwQjdHbmk1SXFXRVd3OHBv?=
 =?utf-8?B?YUlxS0N3bHJGZW9hbmhYb0JwekFySS9SbXZqdmlZZTRhUyt3ZFI2MkQ2SVFP?=
 =?utf-8?B?bEF1OERWdndzbDlrQnJQZGtqUDNDOW45YjlIVnA0KzFWTnp4SXJpczVnZlpz?=
 =?utf-8?B?WVBNVG5DZjEyMUdEOWQ3L01MZlhPVE9XWlRFZ1FlbFd5MExUa0w1aGJROTJw?=
 =?utf-8?B?SFhKallQQW9qSGl3MGpld3psc3VsSVI5OXZ0T3gvKzZoUHBsemxCUXNQeTdu?=
 =?utf-8?B?R24yUFBtNU9WdlNPWlNNMWlvTUxmdlZpQXRyclNLYUNGVTd2WDA5WHZaaW1Y?=
 =?utf-8?B?a0YrY3pDYjIwalBoa014MEVneUdTaGViSFZ0ZkRFQ3YwV3NwV0hTTFp6WUFj?=
 =?utf-8?B?YUxDaEoydExtOVl4Z3lySEwwN1RyZEsxNmQ4QVRXeElQMFNMT2Rkc3JZbkxj?=
 =?utf-8?B?dUNPWEtxT2tnbUk4MHErRXY2RFdmbTJqT21KWXNPMm1ScWhwc2ZpbWJEN0Ji?=
 =?utf-8?B?QXo4b3hOa3RQdmVLdVRTbjM2S0c3d2pVeEFOeW1kdHk0V052UG5YdjVUMGI3?=
 =?utf-8?B?TGdheXVkRXh4VkJheDI5UVNJOVYrMG55d3NwbGR6aDFqZ3NQNkRUMlZ5MkJo?=
 =?utf-8?B?aTVHSHc3b0Z2UTdROExUQktHWGRhby9TbmR4TDdONzg0ZVpNT3p2dnVBQ2c4?=
 =?utf-8?B?ZlJDVWVBZVM4MDR0Z0FIUmEvYWFWRWZrS1JBSUwxMDQvdDVVNlpQOTdSZmky?=
 =?utf-8?B?ZzFmUE52OUw2MG9ETDlVdmNDVm9KckJ6R2RvclkwYUhSWWxiMjQ0TVZraHdn?=
 =?utf-8?B?ZkZ5dG9rQzh6Ym4xYTdrdnltUnJzd0dBdDIwS3pEQnB4a3NNVzI5RWJnM2Va?=
 =?utf-8?B?WWpPeW93aVkyYWFWN1VyRmFLTFpYdnA5UWNvQmhDaG5iRFl3U3FqK0ZERGlB?=
 =?utf-8?B?cFI5bklPazVVSFdtd0tWa0RJQUlzcE9nRHpXZXdQMGl0UEF2Zkx0OUpyZ3N2?=
 =?utf-8?B?RHhCcEtoZVVzR0pWbysxNTdGdnd3UUVtWExCYVlQa0ZuVEc0YlEwMFJSRXBN?=
 =?utf-8?B?Z0pERzNjM2tZUEg3VFpORldGZCtzOEhwVWdEOFNiZnp0N3NFT0wvVStQVHBZ?=
 =?utf-8?B?cGxqMExkMHBMemlUcGVzcHcwV2ZDR1ZEeU1nU1hobkpzZzU1dXNkM3FvcEF3?=
 =?utf-8?B?eERWaXljaVVqd2pJTE9semgvWGswVE1sdmpUOERDUXZRN2hJM01BT3VyS0RD?=
 =?utf-8?B?M2tPUFluRUNrUExPQVFSWjlBVVhtRENpcXFzTE04LzZiaE54b3dUckFycXhx?=
 =?utf-8?B?VG1uWjZhTjAxNGc3cmpCZjdNODhURXZSekxUZVcyWlFkU1pPNlFLL0hxQW9R?=
 =?utf-8?B?VWlpbmpwY1lZNm5IbzllalpDY2ROc1JHN0d0Mms2eWw1RmNMcXdBQ200TVpa?=
 =?utf-8?B?NUJFU2dxQUh3anJLRTQvaVk0RnBSVi96UXNTR2t4YVdEWFQvU1VRVE1SdGdo?=
 =?utf-8?B?QWpCSzhzYXFsN2JuV3AwRGY1YWFxSUVheFhVWDk4VnA4eGJNMEZIbDVPNlFn?=
 =?utf-8?B?WEFqVkNrejJlaWNLYjhVZm4zL0JBL1NFK1hUS1FGT3pVZ2E2VEhuVGdBS2xZ?=
 =?utf-8?B?SkJjb3VZUUxScDBXaXY5aDUxNmZOc1FsTG1vQUhoa1BlamgyaTg0bVNSdkw4?=
 =?utf-8?B?YXIvN2xick9YYXpacmhQdE9ySTBTRnMyRkVSM3llNE9Nc1g1QUxISEx5eG84?=
 =?utf-8?B?L0ZmSzFPV3lVWVpzUTlLVTRpUnhkNVREUm1VNUVtK2JBcHFLNGZWY0liSElP?=
 =?utf-8?Q?OfyIg7gr6t0K5GuLWRhpk8JjO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3133e97d-e347-49de-2559-08dad21db204
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 15:23:41.1503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: haBYtkZFAJO11BfUX7N8gdGg1dNYnVdCSKxhhvE3DQdmPSwaZt1p9bLTpzMgqq5wOm2TC/BXPyeNtw20rpHf4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4488


On 29/11/2022 14:52, Julien Grall wrote:
>
>
> On 29/11/2022 14:57, Ayan Kumar Halder wrote:
>> Hi All,
>
> Hi,

Hi Julien,

Many thanks for your inputs.

>
>> I am trying to gather opinions on how to support 32 bit physical 
>> addresses to enable Xen running on R52.
>>
>> Refer Cortex R52 TRM, Section 2.2.12 "Memory Model"
>>
>> "...This is because the physical address is always the same as the 
>> virtual address...The virtual and physical address can be treated as 
>> synonyms for Cortex-R52."
>>
>> Thus, I understand that R52 supports 32 bit physical address only. 
>> This is a bit different from Armv7 systems which supports Large 
>> Physical Address Extension (LPAE) ie 40 bit physical addresses. >
>> Please correct me if I misunderstand something. >
>> So currently, Xen supports 64 bit physical address for Arm_32 (ie 
>> Armv7) based system.
>
> Xen supports *up to* 64-bit physical address. This may be lower in the 
> HW (not all the Armv7 HW supports 40-bit address).
>
>> My aim is to enable support for 32 bit physical address.
>
> Technically this is already supported because this is a subset of 
> 64-bit. I can see a use case (even on non R* HW) where you may want to 
> use 32-bit paddr_t to reduce the code size (and registers used).
>
> But I think that's more an optimization that rather than been necessary.
>
>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>> index 6014c0f852..4f8b5fc4be 100644
>> --- a/xen/arch/arm/bootfdt.c
>> +++ b/xen/arch/arm/bootfdt.c
>> @@ -56,10 +56,10 @@ static bool __init 
>> device_tree_node_compatible(const void *fdt, int node,
>>   }
>>
>>   void __init device_tree_get_reg(const __be32 **cell, u32 
>> address_cells,
>> -                                u32 size_cells, u64 *start, u64 *size)
>> +                                u32 size_cells, paddr_t *start, 
>> paddr_t *size)
>
> This needs to stay uint64_t because the Device-Tree may contain 64-bit 
> values and you...

Are you saying that the device tree may contain 64 bit addresses even 
though the platform is 32 bit ?

I think then this approach (ie "typedef u32 paddr_t" for 32 bit system) 
is incorrect.

Then, the other option would be to downcast 64 bit physical addresses to 
32 bits, when we need to translate pa to va.

Do you think this approach looks better ? Or any better suggestions ?

     xen/Arm: AArch32_V8R: Use 32 bits for the physical address

     In the case of MPU (unlike MMU), there is a 1-1 mapping of virtual 
address
     to physical address (ie VA = PA).

     However, the physical addresses defined for aarch32 is u64. This is 
a problem
     for aarch32 mpu systems as the physical addresses = virtual 
addresses = 32 bits.

     Thus, when the memory region for FDT is mapped, it returns the 
virtual address
     (which is the same as physical address but truncated upto the lower 
32 bits).
     Similar logic has been used to convert machine address to virtual 
address and
     for ioremap as well.

     We do not support physical addresses beyond 32 bits.
     As this logic will fail when FDT physical address is more than 32 
bits, we have
     added a BUG() to catch this.

     Thus, the following functions has been adapted :-
     early_fdt_map()
     copy_from_paddr()
     maddr_to_virt()
     ioremap_attr()

     Also disable "BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG)" as 
PADDR_BITS = 40
     and BITS_PER_LONG = 32.

     Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

diff --git a/xen/arch/arm/include/asm/mm_mpu.h 
b/xen/arch/arm/include/asm/mm_mpu.h
index 306a4c497c..f4f5ae1488 100644
--- a/xen/arch/arm/include/asm/mm_mpu.h
+++ b/xen/arch/arm/include/asm/mm_mpu.h
@@ -89,7 +89,18 @@ static inline paddr_t __virt_to_maddr(vaddr_t va)
  static inline void *maddr_to_virt(paddr_t ma)
  {
      /* In MPU system, VA == PA. */
+#ifdef CONFIG_AARCH32_V8R
+    /*
+     * 64 bit physical addresses are not supported.
+     * Raise a bug if one encounters 64 bit address.
+     */
+    if (ma >> BITOP_BITS_PER_WORD)
+        BUG();
+
+    return (void *) ((uint32_t)(ma & GENMASK(31,0)));
+#else
      return (void *)ma;
+#endif
  }

  /*
diff --git a/xen/arch/arm/include/asm/setup.h 
b/xen/arch/arm/include/asm/setup.h
index b3330cd584..3f4ac7f475 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -119,7 +119,11 @@ extern struct bootinfo bootinfo;

  extern domid_t max_init_domid;

+#ifdef CONFIG_AARCH32_V8R
+void copy_from_paddr(void *dst, uint32_t paddr, unsigned long len);
+#else
  void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
+#endif

  size_t estimate_efi_size(unsigned int mem_nr_banks);

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 04c05d7a05..7a7386f33a 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -46,7 +46,11 @@ struct minimal_dtb_header {
   * @paddr: source physical address
   * @len: length to copy
   */
+#ifdef CONFIG_AARCH32_V8R
+void __init copy_from_paddr(void *dst, uint32_t paddr, unsigned long len)
+#else
  void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
+#endif
  {
      void *src = (void *)(unsigned long)paddr;

diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
index df43621ee7..62774aebc6 100644
--- a/xen/arch/arm/mm_mpu.c
+++ b/xen/arch/arm/mm_mpu.c
@@ -29,7 +29,7 @@
  #include <asm/arm64/fw_shareinfo.h>
  #endif

-#ifdef CONFIG_AARCH32_ARMV8_R
+#ifdef CONFIG_AARCH32_V8R
  #include <asm/arm32/armv8r/sysregs.h>
  #endif

@@ -414,7 +414,18 @@ void *ioremap_attr(paddr_t pa, size_t len, unsigned 
int attributes)
          return NULL;
      }

+#ifdef CONFIG_AARCH32_V8R
+    /*
+     * 64 bit physical addresses are not supported.
+     * Raise a bug if one encounters 64 bit address.
+     */
+    if (pa >> BITOP_BITS_PER_WORD)
+        BUG();
+
+    return (void *) ((uint32_t)(pa & GENMASK(31,0)));
+#else
      return (void *)pa;
+#endif
  }

  static void clear_boot_mpumap(void)
@@ -1007,7 +1018,19 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
      nr_xen_mpumap++;

      /* VA == PA */
+#ifdef CONFIG_AARCH32_V8R
+
+    /*
+     * 64 bit physical addresses are not supported.
+     * Raise a bug if one encounters 64 bit address.
+     */
+    if (fdt_paddr >> BITOP_BITS_PER_WORD)
+        BUG();
+
+    fdt_virt = (void *) ((uint32_t)(fdt_paddr & GENMASK(31,0)));
+#else
      fdt_virt = (void *)fdt_paddr;
+#endif

      if ( fdt_magic(fdt_virt) != FDT_MAGIC )
          return NULL;
@@ -1165,13 +1188,13 @@ void __init setup_protection_regions()
          {
              pr_t region;
              access_protection_region(true, &region, NULL, i);
-#ifdef CONFIG_AARCH32_ARMV8_R
+#ifdef CONFIG_AARCH32_V8R
              printk("Boot-time Xen MPU memory configuration. #%u : 
0x%"PRIx32" - 0x%"PRIx32".\n",
                     i, pr_get_base(&region), pr_get_limit(&region));
-#else /* CONFIG_AARCH32_ARMV8_R */
+#else
              printk("Boot-time Xen MPU memory configuration. #%u : 
0x%"PRIx64" - 0x%"PRIx64".\n",
                     i, pr_get_base(&region), pr_get_limit(&region));
-#endif /* CONFIG_AARCH32_ARMV8_R */
+#endif
          }
  }

@@ -1262,8 +1285,13 @@ static int __init relocate_xen_mpumap(void)
      if ( !xen_mpumap )
          return -EINVAL;

+#ifdef CONFIG_AARCH32_V8R
+    copy_from_paddr(xen_mpumap, (uint32_t)(pr_t *)boot_mpumap,
+                    sizeof(pr_t) * next_xen_mpumap_index);
+#else
      copy_from_paddr(xen_mpumap, (paddr_t)(pr_t *)boot_mpumap,
                      sizeof(pr_t) * next_xen_mpumap_index);
+#endif

      clear_boot_mpumap();

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 62afb07bc6..a73bf7de01 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2245,7 +2245,9 @@ void __init xenheap_max_mfn(unsigned long mfn)
  {
      ASSERT(!first_node_initialised);
      ASSERT(!xenheap_bits);
+#ifndef CONFIG_AARCH32_V8R
      BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG);
+#endif
      xenheap_bits = min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS);
      printk(XENLOG_INFO "Xen heap: %u bits\n", xenheap_bits);
  }

- Ayan


