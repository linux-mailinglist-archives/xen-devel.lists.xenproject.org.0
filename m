Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCAE7CE69D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 20:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618768.962843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtBJP-0004s1-V4; Wed, 18 Oct 2023 18:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618768.962843; Wed, 18 Oct 2023 18:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtBJP-0004pd-RQ; Wed, 18 Oct 2023 18:30:31 +0000
Received: by outflank-mailman (input) for mailman id 618768;
 Wed, 18 Oct 2023 18:30:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y8Bi=GA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qtBJO-0004pX-AJ
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 18:30:30 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20608.outbound.protection.outlook.com
 [2a01:111:f400:7eab::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67fca7e2-6de4-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 20:30:27 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY5PR12MB6454.namprd12.prod.outlook.com (2603:10b6:930:36::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 18:30:21 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::7364:56e9:5097:3562]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::7364:56e9:5097:3562%4]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 18:30:21 +0000
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
X-Inumbo-ID: 67fca7e2-6de4-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6keN5RmxynHmykJZxirbpQRgEcTQkFZhCB0Nrh+EezCcVhqfWXk0v732iTTNKRLkLWYrnck18pe9lxRmknIsmZCe6f6UAMhKr8/k+jaI3tyUYRNmYwFmR97TAFc+iTi6t4f9sSXUgCJeLeM8tbaTSksR4BuXshWeKF74l42N+A/pTtDYWtwqPLD7Cj6vQMV0b8tqLN8Dp3Idwiu8Hv3ps/D8BUb5LBhj+QI/iUWEwxs/LUn+WTo4p2ZiZg+0FvRUn+z+xaFFFuA1IH+59lVkNe1haMQsCDoGgYR9jdxc9k4kCXS/zvcgyA8N7sxMjGrfJTWVFQVwFfqm3ZnrzLr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XuyeoLfyduaMwZa3Ewy35abtmHmC0a7soRbcPyvRyYY=;
 b=avdsUPFZlxARu381phnkBANLjjf2n8ZfpEeTgygy+L46S8AMz97nXyK9inUAdYFdbghO8kIxYmWa73G2hsNz8mlYjbpCdY45yvjXuSo6loxzLkIX6tPoZs3IDFkPg2CVVsrCk+n8/OZyOJ5YkHVcB6VyQ2Ie00616LcQqrKr/BSgRNo+70zRqUYtZXDjmoju9sLyB06MrXr+WHc56kI/Wjamv3SXCA7TGTBwbeU1z8ABB1uMgV54TYG53msPRFLaoVSwEW2roXOpj+Lb7HECyhp3iqaMM82J6FQB/mhpwc+Rlh1Kg7MxPmv1kdfYcL29FRDs124Qa5HE4sCFhr9Vlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XuyeoLfyduaMwZa3Ewy35abtmHmC0a7soRbcPyvRyYY=;
 b=dAe5iS1gRr6myj8/CNAJOvWkahBw84M+mn3t5dunq+5MUd76NbdXHwbOdtdInHFsvcqLeNKIf+mWAxpxDijxUCuqdYmekcQRMYGRHJbZ9naR+kRhUNC0uifDEBJ4+Wd/IsXTgvzti0b6kVavfcZaNmNFZSyjpvTcAlf/mJc2feg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a94601b3-0100-4cbf-89eb-17959f6ef6cf@amd.com>
Date: Wed, 18 Oct 2023 19:30:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v1 3/4] xen/arm32: Split and move MMU-specific head.S to
 mmu/head.S
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, wei.chen@arm.com,
 penny.zheng@arm.com, henry.wang@arm.com
References: <20230911135942.791206-1-ayan.kumar.halder@amd.com>
 <20230911135942.791206-4-ayan.kumar.halder@amd.com>
 <bb9f1242-adfb-484d-b9fc-57b9e12b78c7@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <bb9f1242-adfb-484d-b9fc-57b9e12b78c7@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR0P264CA0152.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::20) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CY5PR12MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e9fc9b-95ac-48f7-0467-08dbd00848e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vOAhFfKPF/Zn9KS0DS3oBnTuQhiFID36lNOD/fjW+NPzukrx3YKJ1D28Ittx8cvRZ8rR/02IwCIk+weMVZcU1x0xfoQrxi/wja3w69oEQMXzHwaxSeNNxP8GMrBW6O9hLHM6BHY+gZfbXq6O9JINWEFrNZBpk5SZa+Okf3A0a5C4R+gSVHSXXfN7kTYxRtJpovKNQ8Gq7hL/YWsk+PyEncgpaQ6XmfRTGitGyDlK9VIQu0NP5ZHjoUdvWLZ2s8Sarh4XIVtyTcSCtjPGQHJWHQVwoFQPix9ben9YMTuJ+9H7DjkGeZLpN7gqVYTTqy8iqsO4QYp35avN0VYnOeD4uXWkPD794lgeLCJuDPoqGoZ0XbAswUS3SNThPfjii3+v5NmJ55mXDQLHCA7Gne0MQDLlNG0Sg+li3eKBikAax1Ls2tZDDruxWNbrBO4rB2wr3ol0PUXc7QphhrBqnKGrhhmh65pCPuMd8jXwHlKD7z6h0hawuLViPG/m59dLfkxp7z0y5/oWwWQyUKyTh9M3c0TrpHHwG4BFLeNIRF+vy5JZ39lX5Q7hkk4dcMa7tkmvbY+w/RwybNYY3tOeS0aU99q+jCnI5xutA+obWsKQZkbpaSn2DAmpJMRSVzGJf27+e/8zm6E0WamumebmNa4tQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(39860400002)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(2616005)(53546011)(6666004)(6506007)(6512007)(83380400001)(8936002)(5660300002)(41300700001)(8676002)(4326008)(2906002)(966005)(478600001)(6486002)(316002)(66556008)(110136005)(66946007)(66476007)(38100700002)(31696002)(26005)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDV5WlBRUFRBME1ndm1nM3FSZnpNeVduSjd2MkRIVE1SYWFVVFJpZ3hRNTNq?=
 =?utf-8?B?SzBJT1paQnkzdFdaZFNlczhhcjBBVUJoSTlNTWhqaDRUNWlQem5qYVY1T29P?=
 =?utf-8?B?QlJrM2hCOG1Fc2ZWWUpoZDFYRGEzMzFyNC9XNWVaUkN4UmRDcy8zcmhSSUsz?=
 =?utf-8?B?anVCMThDZmxaZ3F0c1NhVGdxelcyWjNSWXpNS09ZNEtWNE5KMERkOEZvUG9j?=
 =?utf-8?B?QzFSYkFPNGRLYWg4V1MzVUpXYWRDMXpoeGpJdkVTUmlENmpUMTR2RS80MVVw?=
 =?utf-8?B?NEE2RDZ5bVhqdW1hYi9jNnd2TklYb0dsdUVwenhyVXJybDQxbFhsRW4rRmZa?=
 =?utf-8?B?d0FKclZjZDRvb1VxMUpHNmdkMzVTMldERkRoa2J0d3ZhdVNWUXBqaEFnOHpT?=
 =?utf-8?B?azhMZ2pDNzA0MzRNTE1PYThkWm84a2ZaTEFrMHl6NUtqT0NYaDQrNmNoV0lj?=
 =?utf-8?B?MXF3MmZEaHBHdFB2TVJhNGFxSk9IdkRuTStEc0lENytXR1NBN3ducHFjUTNh?=
 =?utf-8?B?WlJBcmZ0MThWemxuSnM3V1pSS2FjS2Y0T016SHpBNDNHSWZnd0I4c2gyL1dM?=
 =?utf-8?B?bWZBc29YcC9zMUdLbXZmVnBrTUNVZlhFRjl5bm5YaXRwbmVFdCtKNXM3QWhS?=
 =?utf-8?B?cWVSSFo3MEViYXlCUjM3NU5oelUreHVWSzJSNmNqQ0Fia1J5M0h5Y05Ea0p2?=
 =?utf-8?B?a3lMZkJtZ243M0JjOE9YcTZ5M1B1Znk1aHNCVXdqdmVXTWpzMVo2WVJvWWt3?=
 =?utf-8?B?N3Z2d0RIc1BXdGY1STRxNXRiMGd3cEF5UUNkcjNpMFpxRVNEMUoxdUZpWThZ?=
 =?utf-8?B?N0x4SHAyM2o1djdaWnAvaTRpeGp1NW9QelV6empOOUduMW1OZmhPdzRVQVR5?=
 =?utf-8?B?TkNLdjljRmthbm5qelRGT1RTZ1N3ZmdLM05KRmpyRSswL0dzQ1UxNTI5WGl1?=
 =?utf-8?B?Y09XUnVkTmNNaFhRV3lXT0NBT212UWNFdVZDVXFrTkRSTitBTENNYlU2UGNj?=
 =?utf-8?B?QkhQS09JSTJ4dFRzYmJCNHUxenBNdVdjTURDc2pZbUs4S3pwSVRaRzZJZ0Fy?=
 =?utf-8?B?ZXJ2VVp5Wkhza2haWVVEaVk3VmpqYlFmbEtNcXVkTDI3Zml4NEM4QWwxclVt?=
 =?utf-8?B?ZlF4LzRzWDluaGZtbVR6bG1ORDhPa0d0VGx5cmdRQTVoVzllOENhNnlyZTRF?=
 =?utf-8?B?V0F6SEk1ZEREaWFMYjQ3MEJGbnloRHNtTVloaW1Na3R1K1VSMldzSnMxU0tT?=
 =?utf-8?B?Nk9zYnRPZzdlWFdRQzZDa2VOMDBhVU5Ta25HSDd4UUdpeVRvclRQeVhVeGJw?=
 =?utf-8?B?K0NmdHZ0V3dvT1o2Vkw5WlNrK2ludmhaNTRRU3g5SWN4MW41eFlvU0p0N21z?=
 =?utf-8?B?NjVYbmptTzV3c2RaWjNVTXYxbWRVOUwrTGU4b0hDb0xLTnV3aWVhNFhZd05N?=
 =?utf-8?B?eDlWbFNIRWQvM2k4WE42dENJWE9YMXpzQkNKNXhmQ3Q5Ui9jVno5YWlwd3Bj?=
 =?utf-8?B?NkpCa1ZaSVpuMUUvU2pyaTl1OGwvU2cvZ21CL1RGSUhqVDdoOHBNcDliazcx?=
 =?utf-8?B?OXBhSVM1VW1XbzdIZVZycGZyaG1QOUJBaUtzLzdiaHZ4VEl5VjFIOXY5bVJE?=
 =?utf-8?B?NDJzdWkwSHYxSlcvUTZyS29EYkR2MDM0NDJSdVA5RFFHRVNGWGVVU2kwZ09n?=
 =?utf-8?B?T0NtQjhpdktVanU5TXJ6a2cwbjJOWUlaM1V3amdEUG41OVR1blJCL0Nzb25l?=
 =?utf-8?B?aWl5WmNGRUlxRmxubTNFTDd0bTdQNHJIeE1IT205bDJWNjBOd01YKzNPU251?=
 =?utf-8?B?T1hPNE51Y3FMc3ArZW0zM04xQmtnaHU5cGdoMlhrMUIzOVUzWGNJOFpvcVoy?=
 =?utf-8?B?ZHZQN3I0c0ZhcHNBSG1mdlRxbDN2b3FjcGVYTk8xQXh4SlFXU3lBVmtVU0Fz?=
 =?utf-8?B?bWdzam5MZ3NFT3lYVHZWWDFKVzF0NGNJVHU0NEhuMGkyUjI4Z3BkZkh1Sm9w?=
 =?utf-8?B?TnpDb3hNcDh5WWVSWjdYU2NzeWtlcm9lWUpOU0J6cnJLMnhrejM1VDRWaW9w?=
 =?utf-8?B?MXJsajJlSXJLUThmV2lFZnZXOGZOWno1N3JUS3QwaG92ZEZCeGFkbHpKM3Bk?=
 =?utf-8?Q?OmzpMZGKHMPk/UmL9B7hrxaWX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e9fc9b-95ac-48f7-0467-08dbd00848e3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 18:30:21.5097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TDOt4ZO5LRH5ZCbHMuzsZknWApqSi+8obkQczdBO9Ifgx7/P220XcmJSQukPdA65hzbTOtWetXK2VvhqGH1xvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6454


On 16/10/2023 19:45, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 11/09/2023 14:59, Ayan Kumar Halder wrote:
>> This is based on
>> "[PATCH v6 03/13] xen/arm64: Split and move MMU-specific head.S to 
>> mmu/head.S"
>>
>> https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg151920.html 
>>
>
> Same remark as patch #1. Please provide a proper commit message.
>
> [...]
>
>> diff --git a/xen/arch/arm/include/asm/arm32/macros.h 
>> b/xen/arch/arm/include/asm/arm32/macros.h
>> index a4e20aa520..64fbe4876a 100644
>> --- a/xen/arch/arm/include/asm/arm32/macros.h
>> +++ b/xen/arch/arm/include/asm/arm32/macros.h
>> @@ -1,8 +1,70 @@
>>   #ifndef __ASM_ARM_ARM32_MACROS_H
>>   #define __ASM_ARM_ARM32_MACROS_H
>>   +/* Offset between the early boot xen mapping and the runtime xen 
>> mapping */
>> +#define XEN_TEMPORARY_OFFSET      (TEMPORARY_XEN_VIRT_START - 
>> XEN_VIRT_START)
>> +
>>       .macro ret
>>           mov     pc, lr
>>       .endm
>>   +/*
>> + * Move an immediate constant into a 32-bit register using movw/movt
>> + * instructions.
>> + */
>> +.macro mov_w reg, word
>> +        movw  \reg, #:lower16:\word
>> +        movt  \reg, #:upper16:\word
>> +.endm
>> +
>> +/*
>> + * Pseudo-op for PC relative adr <reg>, <symbol> where <symbol> is
>> + * within the range +/- 4GB of the PC.
>> + *
>> + * @dst: destination register
>> + * @sym: name of the symbol
>> + */
>> +.macro adr_l, dst, sym
>> +        mov_w \dst, \sym - .Lpc\@
>> +        .set  .Lpc\@, .+ 8          /* PC bias */
>> +        add   \dst, \dst, pc
>> +.endm
>> +
>> +.macro load_paddr rb, sym
>> +        mov_w \rb, \sym
>> +        add   \rb, \rb, r10
>> +.endm
>
> I see that we are still using load_paddr in arm64/head.S. But I don't 
> think it makes entirely sense as r10 (x20) would always be 0 for the MPU.
>
> In fact all the use in arm{32, 64}/head.S after this patch could be 
> easily replaced with adr_l because they are called when the MMU is off 
> so the return address will be a physical address.
>
> So can you add a prequisite patch for arm32 to replace the remaining 
> some of the load_paddr? With that, load_paddr can be moved in mmu/head.S.
Sure, I am doing this. I will send you a patch in next few days.
>
> I will take care of the arm64 part.

I see you have already sent the patch. :)

- Ayan

>
> Cheers,
>

