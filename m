Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8887C74850C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 15:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559187.873948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH2dY-0002cZ-Qz; Wed, 05 Jul 2023 13:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559187.873948; Wed, 05 Jul 2023 13:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH2dY-0002an-O4; Wed, 05 Jul 2023 13:33:40 +0000
Received: by outflank-mailman (input) for mailman id 559187;
 Wed, 05 Jul 2023 13:33:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gl5h=CX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qH2dX-0002ah-Hr
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 13:33:39 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b8486a0-1b38-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 15:33:37 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS0PR12MB8199.namprd12.prod.outlook.com (2603:10b6:8:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 13:33:34 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 13:33:34 +0000
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
X-Inumbo-ID: 8b8486a0-1b38-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3ZTC3Vp8S4UO5Y1CFQZ9IdG0OBCZHotp6UH+NtQsEnR5XD/yW1x0BhLQTwkahW2D+oLiTSVEZNUziaO6n7fIy22ZT5l/m8UqDEaV5Ib/KN2rG93hLJ354n5q14ERbcPrQGi2lQieGjZN0ZCrSMVghJRgF0Ej+Wf0TdCbSVkM+0oYzXnBK69uuZHAH75fTg408dISlxp66qMmjuq+OZzUYRut9HgcnvIM7KO+K0d2Qhj41HsC6jUHz9wEgTCrVQsXsQz2T1XNy1xpvCC+ryP9p/AN9H4X9n1k/UFpBQGsgl0bDG0Gp6MRS32bUzW7I8qWtkeJ+sYjFVfJBLIUqpdvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmxiVaawXqxwBbjDUbbsZNK9Ny7gAEItquCWJR+ztws=;
 b=eP8obBVhYh0RpFR0yvhU3xpDl41mGPZ1q51dDVMQYgVb6CG2ZMvFOus47tZnR926do2xYndWh7ibgjhgi8prSfunGbHBqk9gblPc4GKW7WtyjnjGChOjyMFSJnOqun8Qg6RpQ8IqFlAczhf/OHIK5zHpff3KYwfgp5Os/AKtRrygJCCgzjCwMgRYXVGzNI3yf3Ou0JXHAN4BdQEd/PPxjxDeVok50YEldXOkRkKv4UJRtaeysNRPQHQe4L7DZFd25gQTIHUterBvCQeiCqNG3qbpoO+ycfxBq8q95h0pn1w4f/myLnUf3fz9GZT2LX4LBpRP0Vu9skxdyhETIm2prQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmxiVaawXqxwBbjDUbbsZNK9Ny7gAEItquCWJR+ztws=;
 b=OX6QOFdBZdK1fxuvRTcdKeATJKUeMXwoGzqWnmiluZSj6zMWIlNSlICM7dhhhNDclNiz70FEWDe559B8HTjBPMTuUKFZ7wi6OK1aKPDc3VdZZs/zZdCuXUQhPiCpktUN0gHrIlrLRFCCBKG4qes5kV72ZkkCneNgsoKVs5ofBS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ae0f338b-e86e-79db-8cb1-65cdd36c0911@amd.com>
Date: Wed, 5 Jul 2023 14:33:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 35/52] xen/arm: map static memory on demand
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-36-Penny.Zheng@arm.com>
 <16428e2d-423c-6a9c-5caa-6ff5770a840e@amd.com>
 <add845b8-31c1-52a6-18ff-b19a6cb6ef38@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <add845b8-31c1-52a6-18ff-b19a6cb6ef38@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0089.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::22) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS0PR12MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9af914-5930-4f5c-f9fa-08db7d5c6df5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+W+fjTTEzGSec4jzHfapoDZpqC97tG227B1tEkvDM5XYIh72yge9+DEzst0t1E9IiH5vTqTR4A+izi2kwSQLEPkFGcpx2zMnnQouoiU/MefsHgo95+iLqeVx3BQrceqR8c75LpR9Pc3rKmPriYKg9yTklCadL2HeRDjHYbHiM0dWg8By5J4X3FG7z3UqDKGvnZR230zxxkrV/ISlZJvHdW8iQHPzORC1Dv/NfYXfwhwsHOtNvbG4/mdBaPV2qt/oeoDgXBL0xuF2Q2KBPXdEGfgV4aPLV6U4yYATksHITWC+mRWm2NB8vTaWcfXluW4NZsuOuA6yrO1DXY9Vs6be6MJ0DBBZR+HxI5UUAbLmqMDXqGDyPfput4r0VSa7+wwNxIfYEMspgX8HZqrWIZsyAMmPgNoURYG8vk3fgwfdPNWyds5KPU53RaiL+ZSxtatAH3JCrwM7/uTWu1B3qEOBPwHWkXhunHprlE6/AXzsaMePs9+uN9XHEDWq3eMpcPVUJuqLRRbL0kxJgGp5WfXdFvzzEwNHJS7pZpuzaVuwmDHErKXs/cec4U+ORs+5VECkkTBNMMhDW/06rVdW2L41BfRusLY0VxuoeyXDagVadkATFq7VCEtf0MFpkIlCR2SPmngcY1bYUOEoVE7rDSqUzzEE5tbDO3OCt5pK+Vtrgak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(41300700001)(478600001)(6512007)(54906003)(31696002)(38100700002)(6666004)(6486002)(4326008)(36756003)(316002)(83380400001)(66556008)(66476007)(66946007)(2616005)(8936002)(8676002)(2906002)(5660300002)(31686004)(186003)(53546011)(6506007)(26005)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2ZkMTVhcjhHcjlhTy9pUWJvOVdTYUNmTFZRQjF4TEtpVDFqa0wyZlRxbjh5?=
 =?utf-8?B?WUJidzU3S0tuLy9BdlptOFhRdFNjZEhuS1NiaGcwdXN3YVB5SkcrcXM0ako2?=
 =?utf-8?B?bXlJU2pndXlRcC9HeHZqSWZMektINStjc3FLdk9DV3RxQWk0aVM1RnJEeith?=
 =?utf-8?B?ak4xdGpyQVk3dFhNSU9kc09oZFRyWkRzdkkwR3dNOTBiajA0WGpaSTlVbFZW?=
 =?utf-8?B?azdaaWhidWszejFMR05kTzFFTERDNERjOFhmY3NreDNrUUxDUEcwbkJjMDVZ?=
 =?utf-8?B?Z0NJQ0lxVm1PU1hNbTRyY2FlZk1XMGgzeXJrS0sxaTY5NkhmY3E0R2g1RjEv?=
 =?utf-8?B?T3E1RkRDTFp2NzBqd0JZNGdZblhxYkJybTdGNHJGVDlXUTdYNzB4ZG5Wbjhn?=
 =?utf-8?B?RUlVSno3M3pFV0ZrQjVuckwrbkdPanBFT0M3ak1JWEhneGJUMUxxcVhzRlJB?=
 =?utf-8?B?VDVneXZpRW1LeTNvcUtjUUh4V0VseFJ5Y0NoRDhsTFJicjNDQzErNjhtNTdG?=
 =?utf-8?B?aVpjZ2tjc2hTWVl2MXZ1MENtQjRwWjJadFMrdUV0eWM1RHNUcldZUHBtTUR5?=
 =?utf-8?B?RFN4Rk9sUjhjOUJvemdGNE1CR3JEV2s5a3AvZUFIMGNrZGFodjVUQ2ZmaEZW?=
 =?utf-8?B?WTZDVitoZnRvZkZOMC83c21zSnBSeTJQS1R3SFJZYzI3SmR5QVc1WnRiY0Fu?=
 =?utf-8?B?cjllR0M5VE50RDF3eGsrR1oyQlROZWVPeXpjeFZhL1FPSW9HYlhYaTNyQmxX?=
 =?utf-8?B?aUcrTHludHgzbkwvY3plUk42alh6S3FnNFA5eDl2MFAwSzJaVnkrcXhnREIz?=
 =?utf-8?B?QitRMmQvRWFpWmp1ZDBOQmJFSVJNdGpGbjhEZ05WSTYxNktsQTNraUxvMkFj?=
 =?utf-8?B?ejRnejdQMFdsWWVSQ2c3MmRTL2wrbFlrZFpMOTdCQzRUTEJzYzVXVkkzUllz?=
 =?utf-8?B?cHBvQlpqNHVUUTN3VFNNdDQwWmdpdUFSUllaRDJHUUxIM1ZqTktxMDduZFBr?=
 =?utf-8?B?dkx6eG5Fem56dWVaR0xTRU9JR1BCNTRzb3phZTdUeG11ZTBEaklHOGpBQjhY?=
 =?utf-8?B?MlpOa3QwcnMwR3h6QjhJWmROQm9YZ0ZqV1BSK2NRZmdoY2pOVWUzaXg1c20y?=
 =?utf-8?B?T0tDc0xVc1MwY2F2VktYUUd5ekFjdnF5Q1JjNC9jbk1VVkcxZEExMjlVMzZV?=
 =?utf-8?B?T2RQUmFabVh5QkxpNFUzV21KT3ByUU41RExaQTlqVktxcElBcVZmVlRmTWw2?=
 =?utf-8?B?K1RNT3pYU2VGbkV6RGEwOENacUphUjkyRFBzbGhIejI5bFBORXFYNEt2dG1r?=
 =?utf-8?B?Nm9JbGtzejU1Z1ZBRVc5bXczd2RXcE15WXNuKzIybjRvdHFNS25CeGxrc0Ri?=
 =?utf-8?B?d0lSdmVaRDdHK25MQzhjbTN1eUpPZk9iQWlhODIwYVRjb1dlQndzVlRWZ2ox?=
 =?utf-8?B?cTI0VWxXOVMzVnNlcHYrRk1HcEdVT1ptalVycTNRYTVydzc2YmRjTDJlcjVU?=
 =?utf-8?B?c0dVTmY3Mm51bTNxZ0tobkplWHlOeUtvd3pTUlFFa1ZUMy9YbmVDNEtJdC9Q?=
 =?utf-8?B?RDBPUXkzQ093RkZHa3dJOGVMODgwajBSeHVYdHo5T05JM0lpajR2RkIxQnll?=
 =?utf-8?B?NnQzOUtPK3dPRi9rY09sU1N2SGxaWFhFYkhSQlo4VmgxdHgxaHp1MnFBSXIw?=
 =?utf-8?B?SkZiRXEwd1FBaWRnVGNGRE05NW9vajM0aHk0REZsSTNac29aMGo4ZFRpZlJw?=
 =?utf-8?B?RG8zckN4enk5MnlCQ3JabTFXdUpybzMyaTdsODZvT2hpKzd6d0w2NmRJZFV0?=
 =?utf-8?B?MHhOMWFUK2FWazVCcS9PYk55RmNONHlzUmVUQy9mcFF1ZDNraDlOMFRHSGda?=
 =?utf-8?B?TVNrTDBoU0RiRktHMTc0dGxFQzk2aWt2b0ZRREZzWjJValFmWXdsalM2d3BM?=
 =?utf-8?B?YjFPbzl2dStoNTZsSnpuYUpuR0JES1lkMi9XOEdGTjRlMUtrTjBKbVRtc1U0?=
 =?utf-8?B?RGlab3ZZdlBEYzV2bFFxcG96dG9zS21tM3JINTFoS0dzT2hDNzJVQTZRM05u?=
 =?utf-8?B?Qis3eDZkeTZOaUtUMUJaRk1MR1NjZWt6eCtKSjNIUS9TZmRzYkhsYm9CcjRr?=
 =?utf-8?Q?SKclPzx6vaSoAMdS716vVNcOi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9af914-5930-4f5c-f9fa-08db7d5c6df5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 13:33:34.1246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFHKKduELXteVPH9CykIwWmUdiJGNsKASIXJMOqEqXh5GKc1ZHHQdN6HaN+R3gE1O11yMC56jFwybAiTXnQQ5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8199


On 05/07/2023 11:16, Penny Zheng wrote:
> Hi Ayan
Hi Penny,
>
> On 2023/7/4 23:10, Ayan Kumar Halder wrote:
>> Hi Penny,
>>
>> On 26/06/2023 04:34, Penny Zheng wrote:
>>> CAUTION: This message has originated from an External Source. Please 
>>> use proper judgment and caution when opening attachments, clicking 
>>> links, or responding to this email.
>>>
>>>
>>> In function init_staticmem_pages, we need the access to static memory
>>> for proper initialization.
>>> It is not a problem in MMU system, as Xen map the whole RAM in
>>> setup_mm(). However, with limited MPU memory regions, it is too luxury
>>> to map the whole RAM.
>>> As a result, we follow the rule of "map on demand", to map static 
>>> memory
>>> temporarily before its initialization, and unmap immediately after its
>>> initialization.
>>
>> I could see that you are using _PAGE_TRANSIENT  to map memory 
>> temporarily. However, I don't see this being translated to any of the 
>> MPU hardware features (ie _PAGE_TRANSIENT does not seem to translate 
>> to any of the attributes in PRBAR, PRLAR, PRENR, etc). Thus, how is 
>> it different from mapping the memory in "non temporary" way ?
>>
>
> It is only software feature.
> It is designed for implementing functions like ioremap_xxx(), or 
> map_staticmem_pages_to_xen() here, which are always occuring with its 
> reverse unmapping function nearby like iounmap(), or 
> unmap_staticmem_pages_to_xen(), to map a chunk of memory 
> *temporarily*, for a very short time.
I understand that it is a software only feature. But why does the 
software need to know if the memory is mapped temporarily or not ? What 
difference does it make ?
> I want to check this flag in the unmapping function, to ensure that we 
> are unmapping the proper MPU region.

I had a look at unmap_staticmem_pages_to_xen() --> xen_mpumap_update() 
--> control_mpu_region_from_index() and I don't see this flag used anywhere.

- Ayan

>
> Fixed MPU regions are like Xen text section, Xen data section, etc.
>
>> Please let me know what I am missing.
>>
>> - Ayan
>>
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>> v3:
>>> - new commit
>>> ---
>>>   xen/arch/arm/include/asm/mm.h |  2 ++
>>>   xen/arch/arm/mmu/mm.c         | 10 ++++++++++
>>>   xen/arch/arm/mpu/mm.c         | 10 ++++++++++
>>>   xen/arch/arm/setup.c          | 21 +++++++++++++++++++++
>>>   4 files changed, 43 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/include/asm/mm.h 
>>> b/xen/arch/arm/include/asm/mm.h
>>> index 66d98b9a29..cffbf8a595 100644
>>> --- a/xen/arch/arm/include/asm/mm.h
>>> +++ b/xen/arch/arm/include/asm/mm.h
>>> @@ -224,6 +224,8 @@ extern void mm_init_secondary_cpu(void);
>>>   extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
>>>   /* map a physical range in virtual memory */
>>>   void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int 
>>> attributes);
>>> +extern int map_staticmem_pages_to_xen(paddr_t start, paddr_t end);
>>> +extern int unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end);
>>>
>>>   static inline void __iomem *ioremap_nocache(paddr_t start, size_t 
>>> len)
>>>   {
>>> diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
>>> index 2f29cb53fe..4196a55c32 100644
>>> --- a/xen/arch/arm/mmu/mm.c
>>> +++ b/xen/arch/arm/mmu/mm.c
>>> @@ -1113,6 +1113,16 @@ int populate_pt_range(unsigned long virt, 
>>> unsigned long nr_mfns)
>>>       return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_POPULATE);
>>>   }
>>>
>>> +int __init map_staticmem_pages_to_xen(paddr_t start, paddr_t end)
>>> +{
>>> +    return 0;
>>> +}
>>> +
>>> +int __init unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end)
>>> +{
>>> +    return 0;
>>> +}
>>> +
>>>   /*
>>>    * Local variables:
>>>    * mode: C
>>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>>> index a40055ae5e..9d5c1da39c 100644
>>> --- a/xen/arch/arm/mpu/mm.c
>>> +++ b/xen/arch/arm/mpu/mm.c
>>> @@ -614,6 +614,16 @@ void __init setup_frametable_mappings(paddr_t 
>>> ps, paddr_t pe)
>>>              frametable_size - (nr_pdxs * sizeof(struct page_info)));
>>>   }
>>>
>>> +int __init map_staticmem_pages_to_xen(paddr_t start, paddr_t end)
>>> +{
>>> +    return xen_mpumap_update(start, end, PAGE_HYPERVISOR | 
>>> _PAGE_TRANSIENT);
>>> +}
>>> +
>>> +int __init unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end)
>>> +{
>>> +    return xen_mpumap_update(start, end, 0);
>>> +}
>>> +
>>>   /*
>>>    * Local variables:
>>>    * mode: C
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>> index f42b53d17b..c21d1db763 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -637,12 +637,33 @@ void __init init_staticmem_pages(void)
>>>               mfn_t bank_start = 
>>> _mfn(PFN_UP(bootinfo.reserved_mem.bank[bank].start));
>>>               unsigned long bank_pages = 
>>> PFN_DOWN(bootinfo.reserved_mem.bank[bank].size);
>>>               mfn_t bank_end = mfn_add(bank_start, bank_pages);
>>> +            int res;
>>>
>>>               if ( mfn_x(bank_end) <= mfn_x(bank_start) )
>>>                   return;
>>>
>>> +            /* Map temporarily before initialization */
>>> +            res = map_staticmem_pages_to_xen(mfn_to_maddr(bank_start),
>>> + mfn_to_maddr(bank_end));
>>> +            if ( res )
>>> +            {
>>> +                printk(XENLOG_ERR "Failed to map static memory to 
>>> Xen: %d\n",
>>> +                       res);
>>> +                return;
>>> +            }
>>> +
>>> unprepare_staticmem_pages(mfn_to_page(bank_start),
>>>                                         bank_pages, false);
>>> +
>>> +            /* Unmap immediately after initialization */
>>> +            res = 
>>> unmap_staticmem_pages_to_xen(mfn_to_maddr(bank_start),
>>> + mfn_to_maddr(bank_end));
>>> +            if ( res )
>>> +            {
>>> +                printk(XENLOG_ERR "Failed to unmap static memory to 
>>> Xen: %d\n",
>>> +                       res);
>>> +                return;
>>> +            }
>>>           }
>>>       }
>>>   #endif
>>> -- 
>>> 2.25.1
>>>
>>>

