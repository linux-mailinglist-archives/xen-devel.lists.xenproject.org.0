Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4597971CE
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 13:35:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597275.931497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeDHv-0008ML-Id; Thu, 07 Sep 2023 11:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597275.931497; Thu, 07 Sep 2023 11:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeDHv-0008Ke-F3; Thu, 07 Sep 2023 11:35:07 +0000
Received: by outflank-mailman (input) for mailman id 597275;
 Thu, 07 Sep 2023 11:35:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=luvz=EX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qeDHt-0008KY-E8
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 11:35:05 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e83::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94113e24-4d72-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 13:35:01 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SJ0PR12MB7460.namprd12.prod.outlook.com (2603:10b6:a03:48d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 11:34:56 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9a2:f8ec:7c75:fe95]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9a2:f8ec:7c75:fe95%6]) with mapi id 15.20.6745.030; Thu, 7 Sep 2023
 11:34:56 +0000
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
X-Inumbo-ID: 94113e24-4d72-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyKICM1YvNuYlq351bbW7KBlhG7VDXuilZzNqnLjWryeAG118ib22QiCHzN9QXTsZRv0euM00jqf5WH3y9F5BuBxEQJiqqX49iP3I3jXghUi1vgnBOQDUesq4PkOYbfYRxBUIEueAyYHLpp54C4iXTD6LOjeGwsYcuoLQpEZW5t5duMqsZmWrPdARKsN3kNYvUQAiZYSLF/i3zMt9R+FnS45Ubu9MVBlr5syWPY1NQ/PErcbA3Xz2rgQf+PklMf32PhuruERgcvkobZGl/KKVw/07MqyGLPRVBDqqb2XdsXQN7e7iaxZ+KT/agfNC+iQoTh1frUmQYP9vw56PdNt0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7MEhcBReUYfjT4shwjeXzko7Kg1VmpMdZu5fufU4CY=;
 b=a5xLNe+gq79lXR0eweRDdDQ+d5m9kDCLv4kten26tEOY0O/qPr64BOojfDz48D/4bEkGp3fy4ExLb9gcVqHVu29hpLMOI6uLg3d4nNad3jEG7Z1W33awrppb/XBmh9b1V3FbfTaggr4NHjlhahP11Dtf/+ei8NbQVl85EUb4LrNA1EP80lwJP5BG9BiC1RQ6YHlbygSVPpUN7RKCoGNOxb3G8muUqk+rP2FgeWhd3JdU8aepIPPD9LBhO8fQSnmCCZTJ62VBkIdtGytM6S+NToVsYBIxh1RD6Q1KRRW48cKgMf4tWThQjKyEtL2EMhW6Qst1Uc218+td4YCe7WWo+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7MEhcBReUYfjT4shwjeXzko7Kg1VmpMdZu5fufU4CY=;
 b=ATpgXblLGuG69oathy2SHsd5ezNPZCJKsKULksvYqCtQWcCbziJ9gWk9ASlD2xE4XLe9Fxt9beqNnzdx7BMn7agk4f1ejd1HmfjfDnG906eOKqKp7psvsOn24Zzc12FMdfY+eebYX8cjrcQbVnHm//uFJ+u4hEj28vO+DqmwmcY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3e32512e-07d1-34c7-bc51-11dfe061f903@amd.com>
Date: Thu, 7 Sep 2023 12:34:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v6 09/13] xen/arm: Extract MMU-specific MM code
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Wei Chen <wei.chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-10-Henry.Wang@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230828013224.669433-10-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0043.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::22) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SJ0PR12MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: e22f58f6-51d4-4a98-736b-08dbaf9675ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WLhR2BMDzsHvJYJZO8+qP+Mclz565lPUNWofG6U4OQ7HjXNzfBq1q5ykwJ3xVDs5Ipnk6XiGoQui0r57bO2Q7ihGFwgwh6CVk/OitFWL/UFmMRDL4hFMhoeOgGZoSr+KHJxVtXnEsqiKoVwiiDjH0Ch7QacoxyR3u4JTIpwnmwBL5scP9ECpNpla1tC9V4xEaHEotnl7K27uB3Xb7sR+p2lxM4nenN+ins+GaL9bbq2NuHbBfsl65u4pohLX8JmC3lSVUeFYn2y19X8H640UIN400/UJfw/GL/MD0VTB+zhLKiYIRTrNI3skqRmE1/MGkLYZbx/8l0dv0y2HKpPCbSVgrNVpQdrWwDYU879VuM3iFO7KIeYbg2ARKWvyNJarWQESkgEsH8rvbtDGwfvCdbPEnZ3zjt50F3ceEBGYmvIph0IrLAxkI1SUga19yNZ6aYhf6qp8zx4KD5G77+D+PTivZHme3zub972toJSqpm0vuqCbEOZ3o2TPcrzmj+YeXJvrlyVROHd48644Tf42dkQAVGIVK/OCdGxSfUfFXFtbAV7VsBiA8Sna/IyknThuLERRJ8DTkiwAw61rCcr93fRBdX5hsVUvRnWD9IpmyWSva0zgrDhs2WzK4nHn4grNOKGuVL1xAs8JZb/fhemJSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(1800799009)(186009)(451199024)(31686004)(53546011)(6486002)(6666004)(6506007)(31696002)(36756003)(38100700002)(2616005)(2906002)(30864003)(26005)(478600001)(6512007)(83380400001)(66476007)(8936002)(41300700001)(8676002)(4326008)(5660300002)(316002)(66556008)(66946007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEZBL3NHY1hqN2tyODl1VmVlaVlxVW16RDRVQ09hdEw3N0d5aEQwRlRuekxU?=
 =?utf-8?B?Ym84c296OWRxckhubzBOQ3NaMHRzZ216VE82K1ZUSnZsRDVIMDl6R3kwUUNo?=
 =?utf-8?B?aW9IWXRpYWdHWFpuZ2IwQW1CaHJIOUd2WDhQRnJZU25sSUNLY29wNkxrWGxT?=
 =?utf-8?B?cldDM2c2RFRERmFnMEFUbkhmdzdUVFVVQzhEbnprand6Rk5UT254UFVPdC9M?=
 =?utf-8?B?VWRmenBwZVc1RW1HdW9ha3JYdFFZaS9JYWdMN2NaZHNEUlBpYnY5VEwyRGta?=
 =?utf-8?B?S245R2Z4NnRYM2V4dy9EWXhSdWhCcHVzSERNNk9TS2duelM2RnhPdlZUdmxC?=
 =?utf-8?B?dkVWcWUyRUU1UktMSnVsS25Eakt3elpsU20yVUdhUlN6YllTSy9QU1FQM2pH?=
 =?utf-8?B?clVLclIxSFRseDlFUUNIMkU2RCtOdVZIMzVKRlI4Z3lMTVpyMThPQms0aUJQ?=
 =?utf-8?B?SGJmeG53a25BdDRxV083NG9Td3p4U0srQkx3Znl3bzRubjlkbDhHazQxdDNN?=
 =?utf-8?B?ZHBRWDhFcWRteXV0emo3MEZGS2FYNXRzSkRDT25iVng2eGd5dVhnWHV4T1Q4?=
 =?utf-8?B?U3dUN2dsaFd0MHBHRk1RSG5QQXZyV09aelJDcEpVSll6cEdkOWVSS3VkbmRQ?=
 =?utf-8?B?VlZZbGFnQ0RXWnU3dUlJZFRZWWIvUjUyRGlRTmEwbTNqcmVPM1locGViNmhv?=
 =?utf-8?B?Q092SUN3Q24yNG5ycDJCbkZneFZmSHVxbDVpeDhOVnBEb1QybVVHSTdyYVB3?=
 =?utf-8?B?WkZaMFFocmxUMEpGOTNhK3FqK0FLc1NBTUlyNVF0eDZ6QXh3dHRQY21adnhB?=
 =?utf-8?B?SlZRaDVTMXIyblFoTitrWWw4eENBUEZMbTR4QkZLdG9wRk1JSW4vSFVNTkVI?=
 =?utf-8?B?VDNvU0RRMHh6RHFVQ1VONmVjZ3BCb2hoNnkvdU85N2R1OUl2ejBvRXk2UUM1?=
 =?utf-8?B?WlJlakJnT2Y4OHRXQ3RtRFhEQTVqYnpBNkZ3ZytJbXdQOHdYaXdoc01OMUE3?=
 =?utf-8?B?S0JEN2MrQ0dqdDN2R3RkV0dDb2FscU1QamVXdm91VDdscU40MDc1MWRGOUYx?=
 =?utf-8?B?QUpuNmVLZUhsMVkrajQ3bjAyeVA5ZW43clJUTmpKeVUxUUdYRitJSXJjWTB4?=
 =?utf-8?B?bkZVa0dMNDZkQ2Q1UUM0ajVrUmM0TFJJRVloTzlWMnpIdjZXbkRwdGxwMURm?=
 =?utf-8?B?Yy9tOVZKc2ZhNkFtR29wTWVqNzVkVmY5TXoraGllaWtodHkyMzNFMHp6MlNQ?=
 =?utf-8?B?a0dFYlBzWTFoK3dFN0lCYVdPL05TQW5hRnBaOUFnZXlFTytvS3VPQ3lteFV2?=
 =?utf-8?B?TndZRHlzUUZQRUVaNWVYSktXeU5pd0NaSWlmT2I4RERJcUlBUnJ1ZUJjK2Rt?=
 =?utf-8?B?bDFJWGF2cGIzaUpsL2xJcHp3eDN0aUtOVFhtS3JVR3N3NUVOaG1CMm9SUjFz?=
 =?utf-8?B?eXNRN3pnZGRDYTk1YU1mRjJYYUd4Tkl0ZzgyTFhzdUZMcnNkS1hUNm11TzRB?=
 =?utf-8?B?QzFGOEpXcC9Qc2NlN1RpYWptTHYvcTd2UkQzR0hya2krS1VVZ3hVRjhQN21w?=
 =?utf-8?B?NEdiUFJ5OXBHdmJ3RXVZRDhDK2xCWjB4elJkQmVwa29FRFZaSDNKZ210am1h?=
 =?utf-8?B?SDFYMmdvSndJRnlaRTB5bzU5c3NPeGN0eThabyt0MHo2YWRHanJ6MGdDbTFE?=
 =?utf-8?B?V2JXVm1MT1BicTVHUHd1ZEZJSzlDc3RtcndQRDVYWjJkSlo0aWZWNDEwamls?=
 =?utf-8?B?c25JNExzWFdsU2YzR3AwL3dPaC8rSXp3djl3dmRURHdPSXBHV3RRd05maWZB?=
 =?utf-8?B?ODJWRmdDU3RsYjdvQTBtVnR0TVdjZkFzWnJlSE5TUHJUVWhYdFN1c3lKY1hr?=
 =?utf-8?B?V1RZZ0FhL01HbXB6QVZQcm5EbHdKL1VkZ1BpejU4SEhEWVhQcFg4SnMzZ0dy?=
 =?utf-8?B?VGY1WmJpK05mQjUzNnV5L3crU2tkWnducms2RkNmTDlORkZtN0dQSTJISzli?=
 =?utf-8?B?WExielBaUjBCbHBJNFc1VHUyU1hvTDd6L1V1UmtqbW5iLzdRaEppM0pNaVls?=
 =?utf-8?B?ZXozMTM1MFNCMEFpNDh5cU9IaHphbVB6QTJ2SjZBaCthd2FhV05UaFY2VDhu?=
 =?utf-8?Q?7VqUp/7tYOKt5X5QY0rk0QHBt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e22f58f6-51d4-4a98-736b-08dbaf9675ee
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 11:34:56.4037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTC2JX/mewcwsXJci+2clT9vhkICxx25Kzl3T0mJhXehD64d4KGVZbl1AQfYZ6OVegzhfYwaj07cvzb0NjMBvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7460

Hi Henry,

On 28/08/2023 02:32, Henry Wang wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Currently, most of the code is in arm/mm.{c,h} and arm/arm64/mm.c
> is MMU-specific. To make the MM code extendable, this commit extracts
> the MMU-specific MM code.
>
> Extract the boot CPU MM bringup code from arm/mm.c to mmu/setup.c.
> Move arm/arm64/mm.c to arm/arm64/mmu/mm.c. Since the function
> setup_directmap_mappings() has different implementations between
> arm32 and arm64, move their arch-specific implementation to
> arch-specific arm{32,64}/mmu/mm.c instead using #ifdef again.
>
> For header files, move MMU-related function declarations in
> asm/mm.h and the declaration of dump_pt_walk() in asm/page.h to
> asm/mmu/mm.h
>
> Also modify the build system (Makefiles in this case) to pick above
> mentioned code changes.
>
> Take the opportunity to fix the in-code comment coding styles when
> possible, and drop the unnecessary #include headers in the original
> arm/mm.c.
>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v6:
> - Rework the original patch
>    "[v5,07/13] xen/arm: Extract MMU-specific code"
> ---
>   xen/arch/arm/arm32/Makefile       |   1 +
>   xen/arch/arm/arm32/mmu/Makefile   |   1 +
>   xen/arch/arm/arm32/mmu/mm.c       |  31 +++
>   xen/arch/arm/arm64/Makefile       |   1 -
>   xen/arch/arm/arm64/mmu/Makefile   |   1 +
>   xen/arch/arm/arm64/{ => mmu}/mm.c |  37 +++
>   xen/arch/arm/include/asm/mm.h     |  22 +-
>   xen/arch/arm/include/asm/mmu/mm.h |  47 ++++
>   xen/arch/arm/include/asm/page.h   |  15 --
>   xen/arch/arm/mm.c                 | 381 ------------------------------
>   xen/arch/arm/mmu/Makefile         |   1 +
>   xen/arch/arm/mmu/setup.c          | 345 +++++++++++++++++++++++++++
>   12 files changed, 470 insertions(+), 413 deletions(-)
>   create mode 100644 xen/arch/arm/arm32/mmu/Makefile
>   create mode 100644 xen/arch/arm/arm32/mmu/mm.c
>   rename xen/arch/arm/arm64/{ => mmu}/mm.c (75%)
>   create mode 100644 xen/arch/arm/include/asm/mmu/mm.h
>   create mode 100644 xen/arch/arm/mmu/setup.c
>
> diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
> index 520fb42054..40a2b4803f 100644
> --- a/xen/arch/arm/arm32/Makefile
> +++ b/xen/arch/arm/arm32/Makefile
> @@ -1,4 +1,5 @@
>   obj-y += lib/
> +obj-$(CONFIG_MMU) += mmu/
>
>   obj-$(CONFIG_EARLY_PRINTK) += debug.o
>   obj-y += domctl.o
> diff --git a/xen/arch/arm/arm32/mmu/Makefile b/xen/arch/arm/arm32/mmu/Makefile
> new file mode 100644
> index 0000000000..b18cec4836
> --- /dev/null
> +++ b/xen/arch/arm/arm32/mmu/Makefile
> @@ -0,0 +1 @@
> +obj-y += mm.o
> diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
> new file mode 100644
> index 0000000000..647baf4a81
> --- /dev/null
> +++ b/xen/arch/arm/arm32/mmu/mm.c
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <xen/init.h>
> +#include <asm/fixmap.h>
> +
> +/*
> + * Set up the direct-mapped xenheap:
> + * up to 1GB of contiguous, always-mapped memory.
> + */
> +void __init setup_directmap_mappings(unsigned long base_mfn,
> +                                     unsigned long nr_mfns)
> +{
> +    int rc;
> +
> +    rc = map_pages_to_xen(XENHEAP_VIRT_START, _mfn(base_mfn), nr_mfns,
> +                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> +    if ( rc )
> +        panic("Unable to setup the directmap mappings.\n");
> +
> +    /* Record where the directmap is, for translation routines. */
> +    directmap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
> index f89d5fb4fb..72161ff22e 100644
> --- a/xen/arch/arm/arm64/Makefile
> +++ b/xen/arch/arm/arm64/Makefile
> @@ -11,7 +11,6 @@ obj-y += entry.o
>   obj-y += head.o
>   obj-y += insn.o
>   obj-$(CONFIG_LIVEPATCH) += livepatch.o
> -obj-y += mm.o
>   obj-y += smc.o
>   obj-y += smpboot.o
>   obj-$(CONFIG_ARM64_SVE) += sve.o sve-asm.o
> diff --git a/xen/arch/arm/arm64/mmu/Makefile b/xen/arch/arm/arm64/mmu/Makefile
> index 3340058c08..a8a750a3d0 100644
> --- a/xen/arch/arm/arm64/mmu/Makefile
> +++ b/xen/arch/arm/arm64/mmu/Makefile
> @@ -1 +1,2 @@
>   obj-y += head.o
> +obj-y += mm.o
> diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> similarity index 75%
> rename from xen/arch/arm/arm64/mm.c
> rename to xen/arch/arm/arm64/mmu/mm.c
> index 78b7c7eb00..36073041ed 100644
> --- a/xen/arch/arm/arm64/mm.c
> +++ b/xen/arch/arm/arm64/mmu/mm.c
> @@ -151,6 +151,43 @@ void __init switch_ttbr(uint64_t ttbr)
>       update_identity_mapping(false);
>   }
>
> +/* Map the region in the directmap area. */
> +void __init setup_directmap_mappings(unsigned long base_mfn,
> +                                     unsigned long nr_mfns)
> +{
> +    int rc;
> +
> +    /* First call sets the directmap physical and virtual offset. */
> +    if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
> +    {
> +        unsigned long mfn_gb = base_mfn & ~((FIRST_SIZE >> PAGE_SHIFT) - 1);
> +
> +        directmap_mfn_start = _mfn(base_mfn);
> +        directmap_base_pdx = mfn_to_pdx(_mfn(base_mfn));
> +        /*
> +         * The base address may not be aligned to the first level
> +         * size (e.g. 1GB when using 4KB pages). This would prevent
> +         * superpage mappings for all the regions because the virtual
> +         * address and machine address should both be suitably aligned.
> +         *
> +         * Prevent that by offsetting the start of the directmap virtual
> +         * address.
> +         */
> +        directmap_virt_start = DIRECTMAP_VIRT_START +
> +            (base_mfn - mfn_gb) * PAGE_SIZE;
> +    }
> +
> +    if ( base_mfn < mfn_x(directmap_mfn_start) )
> +        panic("cannot add directmap mapping at %lx below heap start %lx\n",
> +              base_mfn, mfn_x(directmap_mfn_start));
> +
> +    rc = map_pages_to_xen((vaddr_t)__mfn_to_virt(base_mfn),
> +                          _mfn(base_mfn), nr_mfns,
> +                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> +    if ( rc )
> +        panic("Unable to setup the directmap mappings.\n");
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index a66aa219b1..ded6d076c5 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -14,6 +14,12 @@
>   # error "unknown ARM variant"
>   #endif
>
> +#if defined(CONFIG_MMU)
> +# include <asm/mmu/mm.h>
> +#else
> +# error "Unknown memory management layout"
> +#endif
> +
>   /* Align Xen to a 2 MiB boundary. */
>   #define XEN_PADDR_ALIGN (1 << 21)
>
> @@ -170,13 +176,6 @@ extern uint64_t init_ttbr;
>
>   extern paddr_t phys_offset;
>
> -extern mfn_t directmap_mfn_start, directmap_mfn_end;
> -extern vaddr_t directmap_virt_end;
> -#ifdef CONFIG_ARM_64
> -extern vaddr_t directmap_virt_start;
> -extern unsigned long directmap_base_pdx;
> -#endif
> -
>   #ifdef CONFIG_ARM_32
>   #define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
>   #define is_xen_heap_mfn(mfn) ({                                 \
> @@ -199,7 +198,6 @@ extern unsigned long directmap_base_pdx;
>
>   #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
>
> -#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
>   /* PDX of the first page in the frame table. */
>   extern unsigned long frametable_base_pdx;
>
> @@ -209,19 +207,11 @@ extern unsigned long frametable_base_pdx;
>   extern void setup_pagetables(unsigned long boot_phys_offset);
>   /* Map FDT in boot pagetable */
>   extern void *early_fdt_map(paddr_t fdt_paddr);
> -/* Switch to a new root page-tables */
> -extern void switch_ttbr(uint64_t ttbr);
>   /* Remove early mappings */
>   extern void remove_early_mappings(void);
>   /* Allocate and initialise pagetables for a secondary CPU. Sets init_ttbr to the
>    * new page table */
>   extern int init_secondary_pagetables(int cpu);
> -/*
> - * For Arm32, set up the direct-mapped xenheap: up to 1GB of contiguous,
> - * always-mapped memory. Base must be 32MB aligned and size a multiple of 32MB.
> - * For Arm64, map the region in the directmap area.
> - */
> -extern void setup_directmap_mappings(unsigned long base_mfn, unsigned long nr_mfns);
>   /* Map a frame table to cover physical addresses ps through pe */
>   extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
>   /* map a physical range in virtual memory */
> diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
> new file mode 100644
> index 0000000000..5e3b14519b
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mmu/mm.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef __ARM_MMU_MM_H__
> +#define __ARM_MMU_MM_H__
> +
> +extern mfn_t directmap_mfn_start, directmap_mfn_end;

As you are declaring them for MMU specific , you also need this change :-

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 89ecb54be2..19b60c5d1b 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -670,7 +670,7 @@ void __init populate_boot_allocator(void)

              s = bootinfo.reserved_mem.bank[i].start;
              e = s + bootinfo.reserved_mem.bank[i].size;
-#ifdef CONFIG_ARM_32
+#if (CONFIG_ARM_32 && CONFIG_MMU)
              /* Avoid the xenheap, note that the xenheap cannot across 
a bank */
              if ( s <= mfn_to_maddr(directmap_mfn_start) &&
                   e >= mfn_to_maddr(directmap_mfn_end) )
@@ -708,7 +708,7 @@ void __init populate_boot_allocator(void)
              if ( e > bank_end )
                  e = bank_end;

-#ifdef CONFIG_ARM_32
+#if (CONFIG_ARM_32 && CONFIG_MMU)
              /* Avoid the xenheap */
              if ( s < mfn_to_maddr(directmap_mfn_end) &&
                   mfn_to_maddr(directmap_mfn_start) < e )

So that directmap_mfn_end and directmap_mfn_start is used only when MMU 
is enabled.

- Ayan

> +extern vaddr_t directmap_virt_end;
> +#ifdef CONFIG_ARM_64
> +extern vaddr_t directmap_virt_start;
> +extern unsigned long directmap_base_pdx;
> +#endif
> +
> +#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
> +
> +/*
> + * Print a walk of a page table or p2m
> + *
> + * ttbr is the base address register (TTBR0_EL2 or VTTBR_EL2)
> + * addr is the PA or IPA to translate
> + * root_level is the starting level of the page table
> + *   (e.g. TCR_EL2.SL0 or VTCR_EL2.SL0 )
> + * nr_root_tables is the number of concatenated tables at the root.
> + *   this can only be != 1 for P2M walks starting at the first or
> + *   subsequent level.
> + */
> +void dump_pt_walk(paddr_t ttbr, paddr_t addr,
> +                  unsigned int root_level,
> +                  unsigned int nr_root_tables);
> +
> +/* Switch to a new root page-tables */
> +extern void switch_ttbr(uint64_t ttbr);
> +/*
> + * For Arm32, set up the direct-mapped xenheap: up to 1GB of contiguous,
> + * always-mapped memory. Base must be 32MB aligned and size a multiple of 32MB.
> + * For Arm64, map the region in the directmap area.
> + */
> +extern void setup_directmap_mappings(unsigned long base_mfn, unsigned long nr_mfns);
> +
> +#endif /* __ARM_MMU_MM_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
> index 657c4b33db..ac65f0277a 100644
> --- a/xen/arch/arm/include/asm/page.h
> +++ b/xen/arch/arm/include/asm/page.h
> @@ -257,21 +257,6 @@ static inline void write_pte(lpae_t *p, lpae_t pte)
>   /* Flush the dcache for an entire page. */
>   void flush_page_to_ram(unsigned long mfn, bool sync_icache);
>
> -/*
> - * Print a walk of a page table or p2m
> - *
> - * ttbr is the base address register (TTBR0_EL2 or VTTBR_EL2)
> - * addr is the PA or IPA to translate
> - * root_level is the starting level of the page table
> - *   (e.g. TCR_EL2.SL0 or VTCR_EL2.SL0 )
> - * nr_root_tables is the number of concatenated tables at the root.
> - *   this can only be != 1 for P2M walks starting at the first or
> - *   subsequent level.
> - */
> -void dump_pt_walk(paddr_t ttbr, paddr_t addr,
> -                  unsigned int root_level,
> -                  unsigned int nr_root_tables);
> -
>   /* Print a walk of the hypervisor's page tables for a virtual addr. */
>   extern void dump_hyp_walk(vaddr_t addr);
>   /* Print a walk of the p2m for a domain for a physical address. */
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 3ee74542ba..eeb65ca6bb 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -11,139 +11,19 @@
>   #include <xen/domain_page.h>
>   #include <xen/grant_table.h>
>   #include <xen/guest_access.h>
> -#include <xen/libfdt/libfdt.h>
>   #include <xen/mm.h>
> -#include <xen/sizes.h>
>
>   #include <xsm/xsm.h>
>
> -#include <asm/setup.h>
> -
>   #include <public/memory.h>
>
>   /* Override macros from asm/page.h to make them work with mfn_t */
>   #undef virt_to_mfn
>   #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> -#undef mfn_to_virt
> -#define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))
> -
> -/* Main runtime page tables */
> -
> -/*
> - * For arm32 xen_pgtable are per-PCPU and are allocated before
> - * bringing up each CPU. For arm64 xen_pgtable is common to all PCPUs.
> - *
> - * xen_second, xen_fixmap and xen_xenmap are always shared between all
> - * PCPUs.
> - */
> -
> -#ifdef CONFIG_ARM_64
> -DEFINE_PAGE_TABLE(xen_pgtable);
> -static DEFINE_PAGE_TABLE(xen_first);
> -#define THIS_CPU_PGTABLE xen_pgtable
> -#else
> -/* Per-CPU pagetable pages */
> -/* xen_pgtable == root of the trie (zeroeth level on 64-bit, first on 32-bit) */
> -DEFINE_PER_CPU(lpae_t *, xen_pgtable);
> -#define THIS_CPU_PGTABLE this_cpu(xen_pgtable)
> -/* Root of the trie for cpu0, other CPU's PTs are dynamically allocated */
> -DEFINE_PAGE_TABLE(cpu0_pgtable);
> -#endif
> -
> -/* Common pagetable leaves */
> -/* Second level page table used to cover Xen virtual address space */
> -static DEFINE_PAGE_TABLE(xen_second);
> -/* Third level page table used for fixmap */
> -DEFINE_BOOT_PAGE_TABLE(xen_fixmap);
> -/*
> - * Third level page table used to map Xen itself with the XN bit set
> - * as appropriate.
> - */
> -static DEFINE_PAGE_TABLES(xen_xenmap, XEN_NR_ENTRIES(2));
> -
> -/* Non-boot CPUs use this to find the correct pagetables. */
> -uint64_t init_ttbr;
> -
> -paddr_t phys_offset;
> -
> -/* Limits of the Xen heap */
> -mfn_t directmap_mfn_start __read_mostly = INVALID_MFN_INITIALIZER;
> -mfn_t directmap_mfn_end __read_mostly;
> -vaddr_t directmap_virt_end __read_mostly;
> -#ifdef CONFIG_ARM_64
> -vaddr_t directmap_virt_start __read_mostly;
> -unsigned long directmap_base_pdx __read_mostly;
> -#endif
>
>   unsigned long frametable_base_pdx __read_mostly;
>   unsigned long frametable_virt_end __read_mostly;
>
> -extern char __init_begin[], __init_end[];
> -
> -/* Checking VA memory layout alignment. */
> -static void __init __maybe_unused build_assertions(void)
> -{
> -    /* 2MB aligned regions */
> -    BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
> -    BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
> -    /* 1GB aligned regions */
> -#ifdef CONFIG_ARM_32
> -    BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);
> -#else
> -    BUILD_BUG_ON(DIRECTMAP_VIRT_START & ~FIRST_MASK);
> -#endif
> -    /* Page table structure constraints */
> -#ifdef CONFIG_ARM_64
> -    /*
> -     * The first few slots of the L0 table is reserved for the identity
> -     * mapping. Check that none of the other regions are overlapping
> -     * with it.
> -     */
> -#define CHECK_OVERLAP_WITH_IDMAP(virt) \
> -    BUILD_BUG_ON(zeroeth_table_offset(virt) < IDENTITY_MAPPING_AREA_NR_L0)
> -
> -    CHECK_OVERLAP_WITH_IDMAP(XEN_VIRT_START);
> -    CHECK_OVERLAP_WITH_IDMAP(VMAP_VIRT_START);
> -    CHECK_OVERLAP_WITH_IDMAP(FRAMETABLE_VIRT_START);
> -    CHECK_OVERLAP_WITH_IDMAP(DIRECTMAP_VIRT_START);
> -#undef CHECK_OVERLAP_WITH_IDMAP
> -#endif
> -    BUILD_BUG_ON(first_table_offset(XEN_VIRT_START));
> -#ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
> -    BUILD_BUG_ON(DOMHEAP_VIRT_START & ~FIRST_MASK);
> -#endif
> -    /*
> -     * The boot code expects the regions XEN_VIRT_START, FIXMAP_ADDR(0),
> -     * BOOT_FDT_VIRT_START to use the same 0th (arm64 only) and 1st
> -     * slot in the page tables.
> -     */
> -#define CHECK_SAME_SLOT(level, virt1, virt2) \
> -    BUILD_BUG_ON(level##_table_offset(virt1) != level##_table_offset(virt2))
> -
> -#define CHECK_DIFFERENT_SLOT(level, virt1, virt2) \
> -    BUILD_BUG_ON(level##_table_offset(virt1) == level##_table_offset(virt2))
> -
> -#ifdef CONFIG_ARM_64
> -    CHECK_SAME_SLOT(zeroeth, XEN_VIRT_START, FIXMAP_ADDR(0));
> -    CHECK_SAME_SLOT(zeroeth, XEN_VIRT_START, BOOT_FDT_VIRT_START);
> -#endif
> -    CHECK_SAME_SLOT(first, XEN_VIRT_START, FIXMAP_ADDR(0));
> -    CHECK_SAME_SLOT(first, XEN_VIRT_START, BOOT_FDT_VIRT_START);
> -
> -    /*
> -     * For arm32, the temporary mapping will re-use the domheap
> -     * first slot and the second slots will match.
> -     */
> -#ifdef CONFIG_ARM_32
> -    CHECK_SAME_SLOT(first, TEMPORARY_XEN_VIRT_START, DOMHEAP_VIRT_START);
> -    CHECK_DIFFERENT_SLOT(first, XEN_VIRT_START, TEMPORARY_XEN_VIRT_START);
> -    CHECK_SAME_SLOT(second, XEN_VIRT_START, TEMPORARY_XEN_VIRT_START);
> -#endif
> -
> -#undef CHECK_SAME_SLOT
> -#undef CHECK_DIFFERENT_SLOT
> -}
> -
>   void flush_page_to_ram(unsigned long mfn, bool sync_icache)
>   {
>       void *v = map_domain_page(_mfn(mfn));
> @@ -163,222 +43,6 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
>           invalidate_icache();
>   }
>
> -void * __init early_fdt_map(paddr_t fdt_paddr)
> -{
> -    /* We are using 2MB superpage for mapping the FDT */
> -    paddr_t base_paddr = fdt_paddr & SECOND_MASK;
> -    paddr_t offset;
> -    void *fdt_virt;
> -    uint32_t size;
> -    int rc;
> -
> -    /*
> -     * Check whether the physical FDT address is set and meets the minimum
> -     * alignment requirement. Since we are relying on MIN_FDT_ALIGN to be at
> -     * least 8 bytes so that we always access the magic and size fields
> -     * of the FDT header after mapping the first chunk, double check if
> -     * that is indeed the case.
> -     */
> -    BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
> -    if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
> -        return NULL;
> -
> -    /* The FDT is mapped using 2MB superpage */
> -    BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
> -
> -    rc = map_pages_to_xen(BOOT_FDT_VIRT_START, maddr_to_mfn(base_paddr),
> -                          SZ_2M >> PAGE_SHIFT,
> -                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
> -    if ( rc )
> -        panic("Unable to map the device-tree.\n");
> -
> -
> -    offset = fdt_paddr % SECOND_SIZE;
> -    fdt_virt = (void *)BOOT_FDT_VIRT_START + offset;
> -
> -    if ( fdt_magic(fdt_virt) != FDT_MAGIC )
> -        return NULL;
> -
> -    size = fdt_totalsize(fdt_virt);
> -    if ( size > MAX_FDT_SIZE )
> -        return NULL;
> -
> -    if ( (offset + size) > SZ_2M )
> -    {
> -        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
> -                              maddr_to_mfn(base_paddr + SZ_2M),
> -                              SZ_2M >> PAGE_SHIFT,
> -                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
> -        if ( rc )
> -            panic("Unable to map the device-tree\n");
> -    }
> -
> -    return fdt_virt;
> -}
> -
> -void __init remove_early_mappings(void)
> -{
> -    int rc;
> -
> -    /* destroy the _PAGE_BLOCK mapping */
> -    rc = modify_xen_mappings(BOOT_FDT_VIRT_START,
> -                             BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE,
> -                             _PAGE_BLOCK);
> -    BUG_ON(rc);
> -}
> -
> -/*
> - * After boot, Xen page-tables should not contain mapping that are both
> - * Writable and eXecutables.
> - *
> - * This should be called on each CPU to enforce the policy.
> - */
> -static void xen_pt_enforce_wnx(void)
> -{
> -    WRITE_SYSREG(READ_SYSREG(SCTLR_EL2) | SCTLR_Axx_ELx_WXN, SCTLR_EL2);
> -    /*
> -     * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
> -     * before flushing the TLBs.
> -     */
> -    isb();
> -    flush_xen_tlb_local();
> -}
> -
> -/* Boot-time pagetable setup.
> - * Changes here may need matching changes in head.S */
> -void __init setup_pagetables(unsigned long boot_phys_offset)
> -{
> -    uint64_t ttbr;
> -    lpae_t pte, *p;
> -    int i;
> -
> -    phys_offset = boot_phys_offset;
> -
> -    arch_setup_page_tables();
> -
> -#ifdef CONFIG_ARM_64
> -    pte = pte_of_xenaddr((uintptr_t)xen_first);
> -    pte.pt.table = 1;
> -    pte.pt.xn = 0;
> -    xen_pgtable[zeroeth_table_offset(XEN_VIRT_START)] = pte;
> -
> -    p = (void *) xen_first;
> -#else
> -    p = (void *) cpu0_pgtable;
> -#endif
> -
> -    /* Map xen second level page-table */
> -    p[0] = pte_of_xenaddr((uintptr_t)(xen_second));
> -    p[0].pt.table = 1;
> -    p[0].pt.xn = 0;
> -
> -    /* Break up the Xen mapping into pages and protect them separately. */
> -    for ( i = 0; i < XEN_NR_ENTRIES(3); i++ )
> -    {
> -        vaddr_t va = XEN_VIRT_START + (i << PAGE_SHIFT);
> -
> -        if ( !is_kernel(va) )
> -            break;
> -        pte = pte_of_xenaddr(va);
> -        pte.pt.table = 1; /* third level mappings always have this bit set */
> -        if ( is_kernel_text(va) || is_kernel_inittext(va) )
> -        {
> -            pte.pt.xn = 0;
> -            pte.pt.ro = 1;
> -        }
> -        if ( is_kernel_rodata(va) )
> -            pte.pt.ro = 1;
> -        xen_xenmap[i] = pte;
> -    }
> -
> -    /* Initialise xen second level entries ... */
> -    /* ... Xen's text etc */
> -    for ( i = 0; i < XEN_NR_ENTRIES(2); i++ )
> -    {
> -        vaddr_t va = XEN_VIRT_START + (i << XEN_PT_LEVEL_SHIFT(2));
> -
> -        pte = pte_of_xenaddr((vaddr_t)(xen_xenmap + i * XEN_PT_LPAE_ENTRIES));
> -        pte.pt.table = 1;
> -        xen_second[second_table_offset(va)] = pte;
> -    }
> -
> -    /* ... Fixmap */
> -    pte = pte_of_xenaddr((vaddr_t)xen_fixmap);
> -    pte.pt.table = 1;
> -    xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
> -
> -#ifdef CONFIG_ARM_64
> -    ttbr = (uintptr_t) xen_pgtable + phys_offset;
> -#else
> -    ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
> -#endif
> -
> -    switch_ttbr(ttbr);
> -
> -    xen_pt_enforce_wnx();
> -
> -#ifdef CONFIG_ARM_32
> -    per_cpu(xen_pgtable, 0) = cpu0_pgtable;
> -#endif
> -}
> -
> -#ifdef CONFIG_ARM_32
> -/*
> - * Set up the direct-mapped xenheap:
> - * up to 1GB of contiguous, always-mapped memory.
> - */
> -void __init setup_directmap_mappings(unsigned long base_mfn,
> -                                     unsigned long nr_mfns)
> -{
> -    int rc;
> -
> -    rc = map_pages_to_xen(XENHEAP_VIRT_START, _mfn(base_mfn), nr_mfns,
> -                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> -    if ( rc )
> -        panic("Unable to setup the directmap mappings.\n");
> -
> -    /* Record where the directmap is, for translation routines. */
> -    directmap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
> -}
> -#else /* CONFIG_ARM_64 */
> -/* Map the region in the directmap area. */
> -void __init setup_directmap_mappings(unsigned long base_mfn,
> -                                     unsigned long nr_mfns)
> -{
> -    int rc;
> -
> -    /* First call sets the directmap physical and virtual offset. */
> -    if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
> -    {
> -        unsigned long mfn_gb = base_mfn & ~((FIRST_SIZE >> PAGE_SHIFT) - 1);
> -
> -        directmap_mfn_start = _mfn(base_mfn);
> -        directmap_base_pdx = mfn_to_pdx(_mfn(base_mfn));
> -        /*
> -         * The base address may not be aligned to the first level
> -         * size (e.g. 1GB when using 4KB pages). This would prevent
> -         * superpage mappings for all the regions because the virtual
> -         * address and machine address should both be suitably aligned.
> -         *
> -         * Prevent that by offsetting the start of the directmap virtual
> -         * address.
> -         */
> -        directmap_virt_start = DIRECTMAP_VIRT_START +
> -            (base_mfn - mfn_gb) * PAGE_SIZE;
> -    }
> -
> -    if ( base_mfn < mfn_x(directmap_mfn_start) )
> -        panic("cannot add directmap mapping at %lx below heap start %lx\n",
> -              base_mfn, mfn_x(directmap_mfn_start));
> -
> -    rc = map_pages_to_xen((vaddr_t)__mfn_to_virt(base_mfn),
> -                          _mfn(base_mfn), nr_mfns,
> -                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> -    if ( rc )
> -        panic("Unable to setup the directmap mappings.\n");
> -}
> -#endif
> -
>   /* Map a frame table to cover physical addresses ps through pe */
>   void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>   {
> @@ -418,51 +82,6 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>       frametable_virt_end = FRAMETABLE_VIRT_START + (nr_pdxs * sizeof(struct page_info));
>   }
>
> -void *__init arch_vmap_virt_end(void)
> -{
> -    return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
> -}
> -
> -/* Release all __init and __initdata ranges to be reused */
> -void free_init_memory(void)
> -{
> -    paddr_t pa = virt_to_maddr(__init_begin);
> -    unsigned long len = __init_end - __init_begin;
> -    uint32_t insn;
> -    unsigned int i, nr = len / sizeof(insn);
> -    uint32_t *p;
> -    int rc;
> -
> -    rc = modify_xen_mappings((unsigned long)__init_begin,
> -                             (unsigned long)__init_end, PAGE_HYPERVISOR_RW);
> -    if ( rc )
> -        panic("Unable to map RW the init section (rc = %d)\n", rc);
> -
> -    /*
> -     * From now on, init will not be used for execution anymore,
> -     * so nuke the instruction cache to remove entries related to init.
> -     */
> -    invalidate_icache_local();
> -
> -#ifdef CONFIG_ARM_32
> -    /* udf instruction i.e (see A8.8.247 in ARM DDI 0406C.c) */
> -    insn = 0xe7f000f0;
> -#else
> -    insn = AARCH64_BREAK_FAULT;
> -#endif
> -    p = (uint32_t *)__init_begin;
> -    for ( i = 0; i < nr; i++ )
> -        *(p + i) = insn;
> -
> -    rc = destroy_xen_mappings((unsigned long)__init_begin,
> -                              (unsigned long)__init_end);
> -    if ( rc )
> -        panic("Unable to remove the init section (rc = %d)\n", rc);
> -
> -    init_domheap_pages(pa, pa + len);
> -    printk("Freed %ldkB init memory.\n", (long)(__init_end-__init_begin)>>10);
> -}
> -
>   int steal_page(
>       struct domain *d, struct page_info *page, unsigned int memflags)
>   {
> diff --git a/xen/arch/arm/mmu/Makefile b/xen/arch/arm/mmu/Makefile
> index 0e82015ee1..98aea965df 100644
> --- a/xen/arch/arm/mmu/Makefile
> +++ b/xen/arch/arm/mmu/Makefile
> @@ -1,2 +1,3 @@
>   obj-y += pt.o
> +obj-y += setup.o
>   obj-y += smpboot.o
> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> new file mode 100644
> index 0000000000..eb0dda00dc
> --- /dev/null
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -0,0 +1,345 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * xen/arch/arm/mmu/setup.c
> + *
> + * MMU system boot CPU MM bringup code.
> + */
> +
> +#include <xen/init.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/sizes.h>
> +
> +#include <asm/fixmap.h>
> +
> +/* Override macros from asm/page.h to make them work with mfn_t */
> +#undef mfn_to_virt
> +#define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))
> +
> +/* Main runtime page tables */
> +
> +/*
> + * For arm32 xen_pgtable are per-PCPU and are allocated before
> + * bringing up each CPU. For arm64 xen_pgtable is common to all PCPUs.
> + *
> + * xen_second, xen_fixmap and xen_xenmap are always shared between all
> + * PCPUs.
> + */
> +
> +#ifdef CONFIG_ARM_64
> +DEFINE_PAGE_TABLE(xen_pgtable);
> +static DEFINE_PAGE_TABLE(xen_first);
> +#define THIS_CPU_PGTABLE xen_pgtable
> +#else
> +/* Per-CPU pagetable pages */
> +/* xen_pgtable == root of the trie (zeroeth level on 64-bit, first on 32-bit) */
> +DEFINE_PER_CPU(lpae_t *, xen_pgtable);
> +#define THIS_CPU_PGTABLE this_cpu(xen_pgtable)
> +/* Root of the trie for cpu0, other CPU's PTs are dynamically allocated */
> +DEFINE_PAGE_TABLE(cpu0_pgtable);
> +#endif
> +
> +/* Common pagetable leaves */
> +/* Second level page table used to cover Xen virtual address space */
> +static DEFINE_PAGE_TABLE(xen_second);
> +/* Third level page table used for fixmap */
> +DEFINE_BOOT_PAGE_TABLE(xen_fixmap);
> +/*
> + * Third level page table used to map Xen itself with the XN bit set
> + * as appropriate.
> + */
> +static DEFINE_PAGE_TABLES(xen_xenmap, XEN_NR_ENTRIES(2));
> +
> +/* Non-boot CPUs use this to find the correct pagetables. */
> +uint64_t init_ttbr;
> +
> +paddr_t phys_offset;
> +
> +/* Limits of the Xen heap */
> +mfn_t directmap_mfn_start __read_mostly = INVALID_MFN_INITIALIZER;
> +mfn_t directmap_mfn_end __read_mostly;
> +vaddr_t directmap_virt_end __read_mostly;
> +#ifdef CONFIG_ARM_64
> +vaddr_t directmap_virt_start __read_mostly;
> +unsigned long directmap_base_pdx __read_mostly;
> +#endif
> +
> +extern char __init_begin[], __init_end[];
> +
> +/* Checking VA memory layout alignment. */
> +static void __init __maybe_unused build_assertions(void)
> +{
> +    /* 2MB aligned regions */
> +    BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
> +    BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
> +    /* 1GB aligned regions */
> +#ifdef CONFIG_ARM_32
> +    BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);
> +#else
> +    BUILD_BUG_ON(DIRECTMAP_VIRT_START & ~FIRST_MASK);
> +#endif
> +    /* Page table structure constraints */
> +#ifdef CONFIG_ARM_64
> +    /*
> +     * The first few slots of the L0 table is reserved for the identity
> +     * mapping. Check that none of the other regions are overlapping
> +     * with it.
> +     */
> +#define CHECK_OVERLAP_WITH_IDMAP(virt) \
> +    BUILD_BUG_ON(zeroeth_table_offset(virt) < IDENTITY_MAPPING_AREA_NR_L0)
> +
> +    CHECK_OVERLAP_WITH_IDMAP(XEN_VIRT_START);
> +    CHECK_OVERLAP_WITH_IDMAP(VMAP_VIRT_START);
> +    CHECK_OVERLAP_WITH_IDMAP(FRAMETABLE_VIRT_START);
> +    CHECK_OVERLAP_WITH_IDMAP(DIRECTMAP_VIRT_START);
> +#undef CHECK_OVERLAP_WITH_IDMAP
> +#endif
> +    BUILD_BUG_ON(first_table_offset(XEN_VIRT_START));
> +#ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
> +    BUILD_BUG_ON(DOMHEAP_VIRT_START & ~FIRST_MASK);
> +#endif
> +    /*
> +     * The boot code expects the regions XEN_VIRT_START, FIXMAP_ADDR(0),
> +     * BOOT_FDT_VIRT_START to use the same 0th (arm64 only) and 1st
> +     * slot in the page tables.
> +     */
> +#define CHECK_SAME_SLOT(level, virt1, virt2) \
> +    BUILD_BUG_ON(level##_table_offset(virt1) != level##_table_offset(virt2))
> +
> +#define CHECK_DIFFERENT_SLOT(level, virt1, virt2) \
> +    BUILD_BUG_ON(level##_table_offset(virt1) == level##_table_offset(virt2))
> +
> +#ifdef CONFIG_ARM_64
> +    CHECK_SAME_SLOT(zeroeth, XEN_VIRT_START, FIXMAP_ADDR(0));
> +    CHECK_SAME_SLOT(zeroeth, XEN_VIRT_START, BOOT_FDT_VIRT_START);
> +#endif
> +    CHECK_SAME_SLOT(first, XEN_VIRT_START, FIXMAP_ADDR(0));
> +    CHECK_SAME_SLOT(first, XEN_VIRT_START, BOOT_FDT_VIRT_START);
> +
> +    /*
> +     * For arm32, the temporary mapping will re-use the domheap
> +     * first slot and the second slots will match.
> +     */
> +#ifdef CONFIG_ARM_32
> +    CHECK_SAME_SLOT(first, TEMPORARY_XEN_VIRT_START, DOMHEAP_VIRT_START);
> +    CHECK_DIFFERENT_SLOT(first, XEN_VIRT_START, TEMPORARY_XEN_VIRT_START);
> +    CHECK_SAME_SLOT(second, XEN_VIRT_START, TEMPORARY_XEN_VIRT_START);
> +#endif
> +
> +#undef CHECK_SAME_SLOT
> +#undef CHECK_DIFFERENT_SLOT
> +}
> +
> +void * __init early_fdt_map(paddr_t fdt_paddr)
> +{
> +    /* We are using 2MB superpage for mapping the FDT */
> +    paddr_t base_paddr = fdt_paddr & SECOND_MASK;
> +    paddr_t offset;
> +    void *fdt_virt;
> +    uint32_t size;
> +    int rc;
> +
> +    /*
> +     * Check whether the physical FDT address is set and meets the minimum
> +     * alignment requirement. Since we are relying on MIN_FDT_ALIGN to be at
> +     * least 8 bytes so that we always access the magic and size fields
> +     * of the FDT header after mapping the first chunk, double check if
> +     * that is indeed the case.
> +     */
> +    BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
> +    if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
> +        return NULL;
> +
> +    /* The FDT is mapped using 2MB superpage */
> +    BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
> +
> +    rc = map_pages_to_xen(BOOT_FDT_VIRT_START, maddr_to_mfn(base_paddr),
> +                          SZ_2M >> PAGE_SHIFT,
> +                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
> +    if ( rc )
> +        panic("Unable to map the device-tree.\n");
> +
> +
> +    offset = fdt_paddr % SECOND_SIZE;
> +    fdt_virt = (void *)BOOT_FDT_VIRT_START + offset;
> +
> +    if ( fdt_magic(fdt_virt) != FDT_MAGIC )
> +        return NULL;
> +
> +    size = fdt_totalsize(fdt_virt);
> +    if ( size > MAX_FDT_SIZE )
> +        return NULL;
> +
> +    if ( (offset + size) > SZ_2M )
> +    {
> +        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
> +                              maddr_to_mfn(base_paddr + SZ_2M),
> +                              SZ_2M >> PAGE_SHIFT,
> +                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
> +        if ( rc )
> +            panic("Unable to map the device-tree\n");
> +    }
> +
> +    return fdt_virt;
> +}
> +
> +void __init remove_early_mappings(void)
> +{
> +    int rc;
> +
> +    /* destroy the _PAGE_BLOCK mapping */
> +    rc = modify_xen_mappings(BOOT_FDT_VIRT_START,
> +                             BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE,
> +                             _PAGE_BLOCK);
> +    BUG_ON(rc);
> +}
> +
> +/*
> + * After boot, Xen page-tables should not contain mapping that are both
> + * Writable and eXecutables.
> + *
> + * This should be called on each CPU to enforce the policy.
> + */
> +static void xen_pt_enforce_wnx(void)
> +{
> +    WRITE_SYSREG(READ_SYSREG(SCTLR_EL2) | SCTLR_Axx_ELx_WXN, SCTLR_EL2);
> +    /*
> +     * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
> +     * before flushing the TLBs.
> +     */
> +    isb();
> +    flush_xen_tlb_local();
> +}
> +
> +/*
> + * Boot-time pagetable setup.
> + * Changes here may need matching changes in head.S
> + */
> +void __init setup_pagetables(unsigned long boot_phys_offset)
> +{
> +    uint64_t ttbr;
> +    lpae_t pte, *p;
> +    int i;
> +
> +    phys_offset = boot_phys_offset;
> +
> +    arch_setup_page_tables();
> +
> +#ifdef CONFIG_ARM_64
> +    pte = pte_of_xenaddr((uintptr_t)xen_first);
> +    pte.pt.table = 1;
> +    pte.pt.xn = 0;
> +    xen_pgtable[zeroeth_table_offset(XEN_VIRT_START)] = pte;
> +
> +    p = (void *) xen_first;
> +#else
> +    p = (void *) cpu0_pgtable;
> +#endif
> +
> +    /* Map xen second level page-table */
> +    p[0] = pte_of_xenaddr((uintptr_t)(xen_second));
> +    p[0].pt.table = 1;
> +    p[0].pt.xn = 0;
> +
> +    /* Break up the Xen mapping into pages and protect them separately. */
> +    for ( i = 0; i < XEN_NR_ENTRIES(3); i++ )
> +    {
> +        vaddr_t va = XEN_VIRT_START + (i << PAGE_SHIFT);
> +
> +        if ( !is_kernel(va) )
> +            break;
> +        pte = pte_of_xenaddr(va);
> +        pte.pt.table = 1; /* third level mappings always have this bit set */
> +        if ( is_kernel_text(va) || is_kernel_inittext(va) )
> +        {
> +            pte.pt.xn = 0;
> +            pte.pt.ro = 1;
> +        }
> +        if ( is_kernel_rodata(va) )
> +            pte.pt.ro = 1;
> +        xen_xenmap[i] = pte;
> +    }
> +
> +    /* Initialise xen second level entries ... */
> +    /* ... Xen's text etc */
> +    for ( i = 0; i < XEN_NR_ENTRIES(2); i++ )
> +    {
> +        vaddr_t va = XEN_VIRT_START + (i << XEN_PT_LEVEL_SHIFT(2));
> +
> +        pte = pte_of_xenaddr((vaddr_t)(xen_xenmap + i * XEN_PT_LPAE_ENTRIES));
> +        pte.pt.table = 1;
> +        xen_second[second_table_offset(va)] = pte;
> +    }
> +
> +    /* ... Fixmap */
> +    pte = pte_of_xenaddr((vaddr_t)xen_fixmap);
> +    pte.pt.table = 1;
> +    xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
> +
> +#ifdef CONFIG_ARM_64
> +    ttbr = (uintptr_t) xen_pgtable + phys_offset;
> +#else
> +    ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
> +#endif
> +
> +    switch_ttbr(ttbr);
> +
> +    xen_pt_enforce_wnx();
> +
> +#ifdef CONFIG_ARM_32
> +    per_cpu(xen_pgtable, 0) = cpu0_pgtable;
> +#endif
> +}
> +
> +void *__init arch_vmap_virt_end(void)
> +{
> +    return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
> +}
> +
> +/* Release all __init and __initdata ranges to be reused */
> +void free_init_memory(void)
> +{
> +    paddr_t pa = virt_to_maddr(__init_begin);
> +    unsigned long len = __init_end - __init_begin;
> +    uint32_t insn;
> +    unsigned int i, nr = len / sizeof(insn);
> +    uint32_t *p;
> +    int rc;
> +
> +    rc = modify_xen_mappings((unsigned long)__init_begin,
> +                             (unsigned long)__init_end, PAGE_HYPERVISOR_RW);
> +    if ( rc )
> +        panic("Unable to map RW the init section (rc = %d)\n", rc);
> +
> +    /*
> +     * From now on, init will not be used for execution anymore,
> +     * so nuke the instruction cache to remove entries related to init.
> +     */
> +    invalidate_icache_local();
> +
> +#ifdef CONFIG_ARM_32
> +    /* udf instruction i.e (see A8.8.247 in ARM DDI 0406C.c) */
> +    insn = 0xe7f000f0;
> +#else
> +    insn = AARCH64_BREAK_FAULT;
> +#endif
> +    p = (uint32_t *)__init_begin;
> +    for ( i = 0; i < nr; i++ )
> +        *(p + i) = insn;
> +
> +    rc = destroy_xen_mappings((unsigned long)__init_begin,
> +                              (unsigned long)__init_end);
> +    if ( rc )
> +        panic("Unable to remove the init section (rc = %d)\n", rc);
> +
> +    init_domheap_pages(pa, pa + len);
> +    printk("Freed %ldkB init memory.\n", (long)(__init_end-__init_begin)>>10);
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.25.1
>
>

