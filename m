Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B36614CF0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 15:44:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.434722.687091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opsUS-0005rJ-6t; Tue, 01 Nov 2022 14:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 434722.687091; Tue, 01 Nov 2022 14:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opsUS-0005pW-3t; Tue, 01 Nov 2022 14:43:44 +0000
Received: by outflank-mailman (input) for mailman id 434722;
 Tue, 01 Nov 2022 14:43:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5zcP=3B=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1opsUQ-0005pQ-2r
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 14:43:42 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 921f458e-59f3-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 15:43:39 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SA1PR12MB6919.namprd12.prod.outlook.com (2603:10b6:806:24e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Tue, 1 Nov
 2022 14:43:35 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 14:43:34 +0000
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
X-Inumbo-ID: 921f458e-59f3-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhLaPXakoACxCC6SSgh8lvDEye4tQakzmrzDs7IuHtEaAwdjUp2ek1mLZ65W0poHJ7Zdx1DEjDQLN6c7ITJvqNCQOeibMxIkoHLfYOQoiFLZZxqfJeKDrN2Yb3aHC290yWG64MtP107gu8MA0yKwdZQXrTo/cE6Nagc99ITGBN/s7rwlxE70P1uBINmvMGyfzF9TFAym1+LBbESK7SGdTffbWNwzJ4/5JnkvKkby3SD/gEIzZe4ElcY+IbDmgeqZXBnFYs5yMvF1IUSz6cz9l5WpmECcFVgjZPi7ERtF4tfkL+76b5N04nIMzhlNz5/G3NUtYsfs3BCbXsllvharqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGNckTtpVsAtin8tuowT5MZxIdcWk/p2dn94h3ibjPA=;
 b=Nn2oklDhnM/7PnGxhrbyF2GSUcXAcbub9IiKmOb6w83xQZfNUkXi5sa8syAS9l0+ssQDJEabrjgQ4ocsijfh4Yd4jDvl7my7qB14RAONaEmYzIdV5ommS7VGf9YsD+zEyCQkAR5t+uxovQthFI7RyywRC9j79jJplVAjWbBhLKpzP5P3nm8u28vjmFpAXduuEx5dWVYuyG+fIETgP2c6fLhPgVf142iJ8mh8nKaX7kk3NKAPgaj3YoBPwQ0mL4eTCQydiNJAjcsoZYB+hKBhMFkwwQzqD4mIrlfv0rX0shSgYcHkebq7DakazZ0S8+gKS06klq0HhJ+fB2v9Vx8y0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGNckTtpVsAtin8tuowT5MZxIdcWk/p2dn94h3ibjPA=;
 b=DqbeFfnNPtxvPUiQ/yvRdECZeI4zLn2s9vWl1kEBO/Nl/xoHiul0qM6qwJByKZ4gaH/3o+V1W628uB+2NeZCm1lblyj2uHf7ZDYBp24JmHxU61KEkKAyiRR87eaSIqJ/YIi3ftgWbEpVbiRRnEPEwqT0X6jQiPnPmW/HK+t9cGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <0a8b2d0e-1352-cb69-f567-e63b5bbbabef@amd.com>
Date: Tue, 1 Nov 2022 14:43:29 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 10/12] xen/Arm: GICv3: Use ULL instead of UL for 64bits
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-11-ayankuma@amd.com>
 <ef8d46ce-479f-8f03-f126-9ee71dc9ebb3@gmail.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <ef8d46ce-479f-8f03-f126-9ee71dc9ebb3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0118.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::8) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SA1PR12MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 315cc084-2564-4ded-1166-08dabc1773c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yT+1gkb44U6cajs2It+ONGCAuV9FUzRXnAL7Fte00p40lTKMc9m0Vm7hW1kV3/GdplRtF8IVH1Icj8drAc4MyozxUITGdzVk+g+D3SGVPjqQKAvp4rvYF0EU08zzccWKsfs0rHUzG9bNivor45Y8jT5TIcduqRRnmnMlKmf+X+252DhA8CpEI9UKfK/jKmE2nl+FLrXiS+quVqSVGyehj6GmzLU5bfT8GhEcArXnFv4ylPpV/7gGmZK8iapD8U8jD49t46QiOwKseSFoProb/ihGw+4CR26jQaj32xMsDoTW0SDW6D20WXy/JcSTyR02LIz5bzE9VzVsvNwD302AgWZYaKTYGGqki8lwl/WsK+6zbJFCJMua7RZ9q6qVMZWSfZfRmE1L6Ghl9OX8pWqx3mwm29uRMlKNdbM12qo/KJuvYutyCkOsYbVGa7RU6xKtIUt0wa3h/9y4EpFOyZAy8yzbweC9tzPF7DxmlYefL6OSnCOdc8n2AzGyJ+I2bLGw4e3JVWAu6tZqtXaE9byCDcvKsr00TJn6dxIJMks7WixDyZR+smUjN+wVDDG2OisQp4D4/z+HFT/XDQ7lisJb430EZE4i0LxI8bxg5pfoWHwxvq4E1oqtNaIt4oK9jBhSlITc4boW+ooH2RdYzzsGioC7R+h0cGe4DSoRrXShA90xB5LykGKWs5gd1DQToCzmuY8r+fOwqHTEMKUJd8vzHu2KlqSIyMmMZc86OQPsDb9F2/eRhSCY+56VGr90bRhhjQH8k2HVXOql+kuds/W4BYBkab4HruiI6pNUuxmGfOE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199015)(186003)(38100700002)(2906002)(31696002)(316002)(53546011)(4326008)(8676002)(6506007)(6666004)(66556008)(66476007)(66946007)(36756003)(2616005)(41300700001)(26005)(6512007)(5660300002)(8936002)(478600001)(31686004)(83380400001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnB6V2xaSHJLOWpsdk11eFlYQkp6TGUzKzFMTTlSZGxkQUhoeUpCeldjbjNi?=
 =?utf-8?B?OXNDQnV1MHhtUndrNFYydjEvRHUwdDFNLzg5ajF2N0FGMDFxaHJQbVBoRU53?=
 =?utf-8?B?TUoxbG1jVzdzQjlsVVF6ZmN2MHZVTEh3OU5tWTVHWHgyNEIzM0xCTEZEckZ6?=
 =?utf-8?B?TG45NXdKRUVzdGQyMlNHbElaTERETFNQV3BGZWNlOHRwWXFSMGQzVG9YYUFC?=
 =?utf-8?B?eEtlNERxSWM4K2dhbnZSejJWYkVycFc1aTRGZnZUN3pVOW9hcDl2eE9RRUNP?=
 =?utf-8?B?dks0b0dJb2hMYklvK2ZqS1NIR09GVXlVRFd5MVdLT0FuMVdVTEpWUDFUYVFM?=
 =?utf-8?B?THUxR1NSUTVKaTBycEFmNEVrQUZMT2kyN1FHdE5haHpNSHJpZlc0eFZSMVZa?=
 =?utf-8?B?OUp0aXQwaDZPamxkNkI0VW10YjIxSnpRVmZIaUQyV2ZQNjhwZ3RMbTBoc1FN?=
 =?utf-8?B?NjZzYVFNWW00YjFXS3hYUUErTm5HWFZNblNiYTZYVmI0SWVBUHFIUm5iRDIw?=
 =?utf-8?B?Rm84YXVHWXRpbERYOU53SFZxd2hpQzlISWwwMVhlYU1uWFA1clpKM2dqMVkr?=
 =?utf-8?B?OW5DQnBISVNQMU1PcmlVc2d3bSsrY3NhM2tidWRMa1k4SHdKclRjcGk4bEI3?=
 =?utf-8?B?eDl0S3BRVGZjUmFGcFU1SGJsS1Zwck53NjhESUlpdzVTSUpzM2tzL1VoaXFx?=
 =?utf-8?B?ZTJOOFFva1JEcW5uTkt2c0lwUGVGeng4dGhteXRoRGtPeUdKZndXdlAyMVly?=
 =?utf-8?B?QW4yL0cyTU4yVmhBZHFpdUYrZjMvcFFZMDU0NktJUlZsOUphNTAzekpuSjBF?=
 =?utf-8?B?dUthVWNnSjZpTzlRZUR2dTQ4ZmVwVUpHRHUxdnd0aWlqTWlOZlZGaS9BVlRK?=
 =?utf-8?B?MWZaK2dKSU1oNHEvbXZCRHdpa1ZHWFlCUEVnd2xaZ0V2amI2MEtkVmdnQ2E3?=
 =?utf-8?B?OUp4cFhPRFNaMVc2dHdLdjlaR2ROcE5Jbnp5c25VVlA4dXE0SXBUNlk4VkNC?=
 =?utf-8?B?U2s1OU5oVWRscU8zS0NWZVZodGRjUlBnL0NuVk8zcGdUS09DVmEwdFBHZjZV?=
 =?utf-8?B?YlY0WmtRQVZmL0ZmR05WcHhwcUdlK3Z0SEZzSnkycXRUcTRqcTMrRUs3azRi?=
 =?utf-8?B?UWp3Qno5a2RDMzJMcDJEQ3JYdVhjUHdwRTRXVDBOTUE5QkpIU2lXWWJ0YkNP?=
 =?utf-8?B?SGNMSXNKNmIzK1RmRWZMbGNKK3NueEZJcTMzTEtWVFNxdUN3RkVNL2Y4Y0g4?=
 =?utf-8?B?T2l6R21wMXBpL1dLUGlCQlU1MnVxRnhvMlVjN1VXRzZidDlvbVEvdGZxRnJ0?=
 =?utf-8?B?MUpDQkY4M012aENNREhObWZGVzN5TFhZT214Mmc3NGNvQ2dEcnRCZUpLMDdQ?=
 =?utf-8?B?dWFtbTEwYXpsa3FmaTl0MnJqa05XUStjOW51K05mNzRzM1NRbzdPRHBYTFU0?=
 =?utf-8?B?WmJ1c1hKME9tMERYQkU2Tys5R1l1aG5ZcG14UEgrTFhPQURubnNLREU0RjB0?=
 =?utf-8?B?eHZqOWJLSkltS1o1UVdpdGd4TjIxa3UvMVhmK3JFcWZtcHlpRFRKd0IyclJ6?=
 =?utf-8?B?WHlpbVJvVmxVRWhrQ3dra05iUm1QTjZHMU5ITjhBTnN2QjJsVnc1QkcxMmtF?=
 =?utf-8?B?azFDTjlDbWFCK2lxLzhkendlUitIR1dSRmd0cU1iYWx5dkEzVmFWSHN3QUJV?=
 =?utf-8?B?elE0RnZDMGNJWU9DMW90MFc1VlFSQ0pLay9MQUlITWVmNENnODFnRW1NcVlP?=
 =?utf-8?B?YVByRERBbU14ZklxSVFlVFo2dmxvcVJYd25sdlJkVHljWjc1R21teEhOaFQ1?=
 =?utf-8?B?NFZ0d1lkZ2xQTWd1clJSRFozRnNlTjkwdU8xUHZnSmtPbm90dEp3V3U4OXFX?=
 =?utf-8?B?UGpuNWwybU5jUDlnMzE0eHBPY0tST0ZWMWU3WnRHN1gwdi9raCt1b0pGb2tj?=
 =?utf-8?B?NzVJdjZaSTJFZFZqZWVLcWFDVlI2d2VEMERLVDZTOEFDcXZmS3lUTXJFMkFE?=
 =?utf-8?B?Qmx5VkptWDh0R1pxQUlHZUEwdXRnTXd5WWVoMjl2K1Q4NHhPcGFSK045bUFr?=
 =?utf-8?B?MWw0STh3Um83Y1NzV1NzM0VCSWYwNElvMnV1UFdQbUF0c0p1c1ZNTWlDZEow?=
 =?utf-8?Q?roh/Y+jkC4VzRkoCMxUb7YjQh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 315cc084-2564-4ded-1166-08dabc1773c2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 14:43:34.2776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mc+rgG6IbFP75ywWCKQmnQCz4HVo6u+NE89RhsnkPVBYLdMsBdct3fjmW8zU1Y4UU0OxOFGducX2XaON9oXDWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6919


On 01/11/2022 10:03, Xenia Ragiadakou wrote:
> Hi Ayan,
Hi Xenia,
>
> On 10/31/22 17:13, Ayan Kumar Halder wrote:
>> "unsigned long long" is defined as 64 bits on AArch64 and AArch32
>> Thus, one should this instead of "unsigned long" which is 32 bits
>> on AArch32.
>>
>> Also use 'PRIx64' instead of 'lx' or 'llx' to print uint64_t.
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> ---
>>
>> Changed from :-
>> v1 - 1. Replace PRIu64 with PRIx64 so that the values are printed in 
>> hex as
>> desired.
>> 2. Use ULL in GITS_BASER_RO_MASK as MMIO registers are always unsigned.
>>
>>   xen/arch/arm/gic-v3-lpi.c              |  8 ++++----
>>   xen/arch/arm/gic-v3.c                  |  4 ++--
>>   xen/arch/arm/include/asm/gic_v3_defs.h |  2 +-
>>   xen/arch/arm/include/asm/gic_v3_its.h  |  2 +-
>>   xen/arch/arm/vgic-v3-its.c             | 17 +++++++++--------
>>   5 files changed, 17 insertions(+), 16 deletions(-)
>>
>> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
>> index 61d90eb386..9ca74bc321 100644
>> --- a/xen/arch/arm/gic-v3-lpi.c
>> +++ b/xen/arch/arm/gic-v3-lpi.c
>> @@ -134,7 +134,7 @@ void gicv3_set_redist_address(paddr_t address, 
>> unsigned int redist_id)
>>   uint64_t gicv3_get_redist_address(unsigned int cpu, bool use_pta)
>>   {
>>       if ( use_pta )
>> -        return per_cpu(lpi_redist, cpu).redist_addr & GENMASK(51, 16);
>> +        return per_cpu(lpi_redist, cpu).redist_addr & 
>> GENMASK_ULL(51, 16);
>>       else
>>           return per_cpu(lpi_redist, cpu).redist_id << 16;
>>   }
>> @@ -253,7 +253,7 @@ static int gicv3_lpi_allocate_pendtable(unsigned 
>> int cpu)
>>           return -ENOMEM;
>>         /* Make sure the physical address can be encoded in the 
>> register. */
>> -    if ( virt_to_maddr(pendtable) & ~GENMASK(51, 16) )
>> +    if ( virt_to_maddr(pendtable) & ~GENMASK_ULL(51, 16) )
>>       {
>>           xfree(pendtable);
>>           return -ERANGE;
>> @@ -281,7 +281,7 @@ static int gicv3_lpi_set_pendtable(void __iomem 
>> *rdist_base)
>>           return -ENOMEM;
>>       }
>>   -    ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK(51, 16)));
>> +    ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK_ULL(51, 16)));
>>         val  = GIC_BASER_CACHE_RaWaWb << 
>> GICR_PENDBASER_INNER_CACHEABILITY_SHIFT;
>>       val |= GIC_BASER_CACHE_SameAsInner << 
>> GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT;
>> @@ -329,7 +329,7 @@ static int gicv3_lpi_set_proptable(void __iomem * 
>> rdist_base)
>>               return -ENOMEM;
>>             /* Make sure the physical address can be encoded in the 
>> register. */
>> -        if ( (virt_to_maddr(table) & ~GENMASK(51, 12)) )
>> +        if ( (virt_to_maddr(table) & ~GENMASK_ULL(51, 12)) )
>>           {
>>               xfree(table);
>>               return -ERANGE;
>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>> index 8b4b168e78..d8ce0f46c6 100644
>> --- a/xen/arch/arm/gic-v3.c
>> +++ b/xen/arch/arm/gic-v3.c
>> @@ -417,12 +417,12 @@ static void gicv3_dump_state(const struct vcpu *v)
>>       if ( v == current )
>>       {
>>           for ( i = 0; i < gicv3_info.nr_lrs; i++ )
>> -            printk("   HW_LR[%d]=%llx\n", i, gicv3_ich_read_lr(i));
>> +            printk("   HW_LR[%d]=%" PRIx64 "\n", i, 
>> gicv3_ich_read_lr(i));
>>       }
>>       else
>>       {
>>           for ( i = 0; i < gicv3_info.nr_lrs; i++ )
>> -            printk("   VCPU_LR[%d]=%llx\n", i, v->arch.gic.v3.lr[i]);
>> +            printk("   VCPU_LR[%d]=%" PRIx64 "\n", i, 
>> v->arch.gic.v3.lr[i]);
>>       }
>>   }
>>   diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h 
>> b/xen/arch/arm/include/asm/gic_v3_defs.h
>> index 87115f8b25..3a24bd4825 100644
>> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
>> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
>> @@ -195,7 +195,7 @@
>>     #define ICH_SGI_IRQMODE_SHIFT        40
>>   #define ICH_SGI_IRQMODE_MASK         0x1
>> -#define ICH_SGI_TARGET_OTHERS        1UL
>> +#define ICH_SGI_TARGET_OTHERS        1ULL
>>   #define ICH_SGI_TARGET_LIST          0
>>   #define ICH_SGI_IRQ_SHIFT            24
>>   #define ICH_SGI_IRQ_MASK             0xf
>> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h 
>> b/xen/arch/arm/include/asm/gic_v3_its.h
>> index fae3f6ecef..5ae50b18ea 100644
>> --- a/xen/arch/arm/include/asm/gic_v3_its.h
>> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
Changes not required as ITS is not supported on AArch32 v8R GIC.
>> @@ -38,7 +38,7 @@
>>   #define GITS_PIDR2                      GICR_PIDR2
>>     /* Register bits */
>> -#define GITS_VALID_BIT                  BIT(63, UL)
>> +#define GITS_VALID_BIT                  BIT(63, ULL)
>>     #define GITS_CTLR_QUIESCENT             BIT(31, UL)
>>   #define GITS_CTLR_ENABLE                BIT(0, UL)
>
> It seems that you forgot GITS_BASER_INDIRECT, that is BIT(62, UL).
>
>> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
>> index 58d939b85f..c5e02b2c41 100644
>> --- a/xen/arch/arm/vgic-v3-its.c
>> +++ b/xen/arch/arm/vgic-v3-its.c
Changes not required as ITS is not supported on AArch32 v8R GIC.
>> @@ -96,13 +96,13 @@ typedef uint16_t coll_table_entry_t;
>>    * in the lowest 5 bits of the word.
>>    */
>>   typedef uint64_t dev_table_entry_t;
>> -#define DEV_TABLE_ITT_ADDR(x) ((x) & GENMASK(51, 8))
>> +#define DEV_TABLE_ITT_ADDR(x) ((x) & GENMASK_ULL(51, 8))
>>   #define DEV_TABLE_ITT_SIZE(x) (BIT(((x) & GENMASK(4, 0)) + 1, UL))
>>   #define DEV_TABLE_ENTRY(addr, bits)                     \
>>           (((addr) & GENMASK(51, 8)) | (((bits) - 1) & GENMASK(4, 0)))
>>     #define GITS_BASER_RO_MASK       (GITS_BASER_TYPE_MASK | \
>> -                                  (0x1fL << 
>> GITS_BASER_ENTRY_SIZE_SHIFT))
>> +                                  (0x1ULL << 
>> GITS_BASER_ENTRY_SIZE_SHIFT))
>
> You have accidently dropped 'f' from the mask.

Yes, actually I intentionally dropped it.

AFAIU, 'fL' represent a floating point literal. This does not make sense 
are the MMIO registers are always unsigned long (32 bit) or unsigned 
long long (64 bit).

So, I corrected it.

>
> I noticed that you change to ULL only a part of GENMASK and BIT 
> occurences, I cannot see why. Maybe I m missing sth.
Actually, I am trying to change only where the shift exceeds 32 bits.
>
> Also, with patch [XEN v2 12/12] xen/Arm: GICv3: Enable GICv3 for 
> AArch32, you disable ITS support for arm32, so it seems that those 
> changes in ITS related files are not required (not that do any harm to 
> have).

Sorry, this is my mistake. I should not have changed gic_v3_its.h or 
vgic-v3-its.c as they are not used for AArch32 v8R GIC.

I will fix this in v3.

- Ayan

>
>>     /*
>>    * The physical address is encoded slightly differently depending on
>> @@ -112,10 +112,10 @@ typedef uint64_t dev_table_entry_t;
>>   static paddr_t get_baser_phys_addr(uint64_t reg)
>>   {
>>       if ( reg & BIT(9, UL) )
>> -        return (reg & GENMASK(47, 16)) |
>> +        return (reg & GENMASK_ULL(47, 16)) |
>>                   ((reg & GENMASK(15, 12)) << 36);
>>       else
>> -        return reg & GENMASK(47, 12);
>> +        return reg & GENMASK_ULL(47, 12);
>>   }
>>     /* Must be called with the ITS lock held. */
>> @@ -414,7 +414,7 @@ static int update_lpi_property(struct domain *d, 
>> struct pending_irq *p)
>>       if ( !d->arch.vgic.rdists_enabled )
>>           return 0;
>>   -    addr = d->arch.vgic.rdist_propbase & GENMASK(51, 12);
>> +    addr = d->arch.vgic.rdist_propbase & GENMASK_ULL(51, 12);
>>         ret = access_guest_memory_by_ipa(d, addr + p->irq - LPI_OFFSET,
>>                                        &property, sizeof(property), 
>> false);
>> @@ -897,7 +897,8 @@ out_unlock:
>>     static void dump_its_command(uint64_t *command)
>>   {
>> -    gdprintk(XENLOG_WARNING, "  cmd 0x%02lx: %016lx %016lx %016lx 
>> %016lx\n",
>> +    gdprintk(XENLOG_WARNING, "  cmd 0x%" PRIx64 ": %" PRIx64
>> +             "%" PRIx64 "%" PRIx64 "%" PRIx64 "\n",
>>                its_cmd_get_command(command),
>>                command[0], command[1], command[2], command[3]);
>>   }
>> @@ -909,7 +910,7 @@ static void dump_its_command(uint64_t *command)
>>    */
>>   static int vgic_its_handle_cmds(struct domain *d, struct virt_its 
>> *its)
>>   {
>> -    paddr_t addr = its->cbaser & GENMASK(51, 12);
>> +    paddr_t addr = its->cbaser & GENMASK_ULL(51, 12);
>>       uint64_t command[4];
>>         ASSERT(spin_is_locked(&its->vcmd_lock));
>> @@ -1122,7 +1123,7 @@ read_as_zero_64:
>>     read_impl_defined:
>>       printk(XENLOG_G_DEBUG
>> -           "%pv: vGITS: RAZ on implementation defined register 
>> offset %#04lx\n",
>> +           "%pv: vGITS: RAZ on implementation defined register 
>> offset %" PRIx64 "#04llx\n",
>>              v, info->gpa & 0xffff);
>>       *r = 0;
>>       return 1;
>

