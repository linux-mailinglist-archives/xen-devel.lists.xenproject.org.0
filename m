Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6500678293
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 18:08:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483153.749134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK0IX-0004Fk-92; Mon, 23 Jan 2023 17:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483153.749134; Mon, 23 Jan 2023 17:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK0IX-0004Ds-69; Mon, 23 Jan 2023 17:07:57 +0000
Received: by outflank-mailman (input) for mailman id 483153;
 Mon, 23 Jan 2023 17:07:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozL9=5U=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pK0IV-0004Dm-Qf
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 17:07:56 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2051.outbound.protection.outlook.com [40.107.100.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78eee164-9b40-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 18:07:53 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 17:07:49 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 17:07:49 +0000
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
X-Inumbo-ID: 78eee164-9b40-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbhZCkfxCbeCrqnwkhUL7AY9fDAHChnbFBCWSqOehalrhDWm8FOauFsLDDQ/3ARaOSFLONMzT2p86tp4d+NK+peS6Csw8YCSMTxQflavjYZ5v233AP6aKKkzK3lWyHJ6lxj2LKsYmDIkNNskcBlZAEsAFNuo/MH5hRpJ/AGkMzYdxKGiBLe7UTGlYRgiIkbeyYC9jZNCSHH4JCp/7FkN7DKtLNBuLMo5Yfr5+THazy+A5PkaCRSSt5VSTmPBjLGLuRtmLiLEkhP0HyiPMP73QwrgjDYMH4RDaYl5ob1hadWgAfierdQPVoeU7wa2ExtT66/x5gAdgdbHLer7ls/mgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1NhhlgkYmiyjOuNwuPRzQIdQAahxEJSbuj37pvXjV0=;
 b=Lr6lSxxYWsC42s1AeQD/pxRjOAxiGG+pd39luHckNF73AxuXyS/6GqQ5tUANPQSfNcQnL+XjSfz1IN2z4uR1EBQHVsthvVmqCkgZqWJmrzyUN7b5TGjeWErUFZsKQltNTDWlU+jcKSakSZ3uCEDOWZwjVx4vCa+zueuIhaaB0JmFIdSlNvkK1vSlTQORWnDNzDl4pVEywCJtVcvKidXxsc4uUK6I/xS5npoa6ePvImZXnczxR4jaD7cbcj3x9fnPs7LSYhK+lX8agFC9nNFnzzhzeGEmLVmLfDvkI5hsGFZCNhmOPziMTBGkH+HN4MJgIBvR54UPA+p7YvSKnk5QiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1NhhlgkYmiyjOuNwuPRzQIdQAahxEJSbuj37pvXjV0=;
 b=TFVFCKd5YG8N7+PFrsATi4bDFr/l9AVzXWZ2sWDh35fTAo1i7ivfRHw4c0PVf5zTkUnhgcRydJP9ieWgUUa1xBSIulIkRVvt80u1QU6a9oOypZUTDfE+Z40lTr3jIgALoJ+ZO9+MYzwzWeiFkhbkN/PROVnC7wwy0PVTp/Q07ps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d311518f-c464-29a3-d517-565a30e36dcd@amd.com>
Date: Mon, 23 Jan 2023 17:07:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 12/40] xen/mpu: introduce helpers for MPU enablement
To: xen-devel@lists.xenproject.org
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-13-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230113052914.3845596-13-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0237.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::33) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c3ecef-5dd6-4746-016b-08dafd645b2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hxaCWB1nj7+mOj0F9M0ErtO9M4oVfiEUlFeOA8WVA659vxZR1InJQ26/IHOHUd5wwBzYqUbzzLHVGR183h/BJPm3LpPksrBzXBIVctPFwYx+9pdknl0sQ/8UtRHqpREnLcSqpmmyozgn1Y54qXRLSOPjedH4lchpJ43nQ9Ih834hXfpCg8GdxV81Eqr8B0BsWQfO7tWDCdOOyhgD9wQv5jLzCz2QOh9IYhgnUMyCxTaHG8lJLwgWax9zyuTcuWHAeg1U+iZkjbfedydffuJHR3M0+s9slLrOMPUpSx2hrOy9Nxs9F7OpxbLmcmiTpS9mP7wPybQxq0B8x2kaAKxyGOeVr+zJ463AXkfU/jFCBkPm41HMYVNPIJuRRjHWjY7KFOo/+rqZqjEpJ4D1EQCkkHIo62tn+fM/Ez7sJVVsaH48Xry0tgMWXZmstVAJ1KMsGwYaCQmK7DpHQEqdvvDTzMsc5GNnsMqJ2LWPjoQ+76mVEAyyqT7sv8saOudJ8Q8LsQSQdkCyo/3A/Kt/842K1ncgPoiXNKNpz4j/zdz25zsE7NLbqnrYUocsr/0RSsxgAb7dK8ywzA0vw1neaP5FDVtdD+387R2u88n4m2hp96tcgaL0nmKy1PA/dbjOj5pNfiNmIYNdm4I6J6bo9+nSfNkzHabWsFb9kXVAQjSUyc27EOo8FbS0gt0V0uGuff9N+2f+tRl8gXXsjgjcMJw2O6QQksP4GfMeieR/qnzsfOA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199015)(38100700002)(36756003)(31696002)(478600001)(316002)(66946007)(6486002)(8676002)(66556008)(6916009)(66476007)(2616005)(2906002)(31686004)(6506007)(53546011)(83380400001)(26005)(6666004)(5660300002)(6512007)(41300700001)(186003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1FhMmdxR0FTeTJCem10ZWVFSFpWQzExWENHRlRaVktoY2FkVmFhcFh2Z0o5?=
 =?utf-8?B?dlNNN3FxNnI2ODczdHBESWh6WU03b2ZkdWtzS01BK0JWN0JQc1NMNHV3aHl6?=
 =?utf-8?B?YThwdEU3eFdtWDQwVnc2bWMyMUJveFVQSjZHMWVzdlM4Z3hqK28ySHNEZGtH?=
 =?utf-8?B?aVVlMWJZMkJ0bk0wdkEyWktmc2FWaXVhV0V2MmM1akcxWFM2bEZ0WU5DZjdW?=
 =?utf-8?B?c0E4dEV2ZCtQajNsdGxmSnJ5bmFWMk5jUDRuYmE0RGxBZTZaTlpjcHlNekhC?=
 =?utf-8?B?bjB0SDdRMjZteC82UGpKMUo0U3ZUdCtxMXhKNnpsR0EyZHUxb1d1U0lsaVNF?=
 =?utf-8?B?eStKL3ZMZ1hiaEVhZ25FUEdoK25nUy9URGwvMDVwUldEVTl3enE1YUxUaGFK?=
 =?utf-8?B?R1ZGQkF3bGw3dlVaYTRqK3I2U2RuQ2pteUlVejV6NHVqQiswOHdPVjFvVnF2?=
 =?utf-8?B?NmpNQmJEQTlJWFdEMG1iVWg2T3ZORFJVL2JFdU9wQ01mT2g0b2VwUU9GbUFi?=
 =?utf-8?B?MmR2SHRhQTRPY1g2bzRhTzhYWnF3UmZsUzZBUnUvVElSNkYreFVkVGdQNWdW?=
 =?utf-8?B?Q3VLQlpvOSsrM3NaVzhnSk12WkEyOTcySDBFQ0tLTDVSMlhBSFdiaTJnWFFw?=
 =?utf-8?B?clcvYmtSNW16N1g1RG9lYWZ4UW1oaDBQUXpqRWE0a0w4YTA4OEVpWUN6K1RM?=
 =?utf-8?B?MGc1R3hpRXZ5WnRTZjFEL3V2UURHbmhucVY5ZEFVTmV1Zld6eEYzWHFiSVBV?=
 =?utf-8?B?bHBxaU1QREtvdlFBNmtEWWZMNXJ4TTBDUDRFOXI0MmE2bWl2Ly9vMkRIWW9o?=
 =?utf-8?B?aFRuRVVPalYvUFBYV3kvYXQ2NmRrM2hxZmJWUENwWWVubUZFdTVXN0tpN0JG?=
 =?utf-8?B?TldwS0lEVFpnbExqVE1VSUZpVXAyZGhvQ3Jac2M1OUxBNFczLzc3U2dyR1NC?=
 =?utf-8?B?M3l5OWRsbFRkK0E4M0g2TXdOamVJcWhselBMcU4xa1RZK09UeVh2UklVUVgx?=
 =?utf-8?B?bUx1UWxLM2YvSWpKNFd2NW9vV0Q4TkVKLzFMdVlvM21jaXppNkpleHpzVjR6?=
 =?utf-8?B?c3ZNZzhFQVJZN3NSUTF3Z3FlZy9FTUdEM2RYak1oaVVzWGVUWEhvNUI4YjVP?=
 =?utf-8?B?dlBNbEtkWmhHU0ZsdnlNcjhXeCtKYjdOWk56Z2FiUnNaVWtkaDJQQzZoVldU?=
 =?utf-8?B?N3RYbHNpWjU1NStmb0dETmp2V0xWV1M0ZWdZRXNwOUNRb2JCU3dDaU5QbGo4?=
 =?utf-8?B?U3drdVgwMUxRZUNhS3F6NWZWNU5BMUNEWVkwdzVQVlYxaERuaVBVeUtjUTRz?=
 =?utf-8?B?K1Q5VFY1d20wcjRydFRzMlY2dnFGRW5zZy9ZeXNTUWpLTzNwbXVZSk9vSnpG?=
 =?utf-8?B?WmpUZTZrdVJzNHRmVG1qc21vOVc3VXJIcW83MUVMTnIrZTh4T3g4OFhVcUt6?=
 =?utf-8?B?OEhkMzRyaEJIRy9YczhzRkhSaW1wTzFzNUVKWmxzSzlVWkJiM0xDUWx0b1V1?=
 =?utf-8?B?a0Job2VROE9aWGlBcjNmbVFuNG1CekJzcS80K2RWQW5USFVSUzUrTEM5a0Jl?=
 =?utf-8?B?R3ZmQjNLNE1PaGxZQThHT0VJV1hKWW10Vk5YQVhMTk5TNHlqdnRlRVlwK3Ex?=
 =?utf-8?B?U0dRZlpvRy9KVXEwWmthVUU2MThHTTJCQ281K0lZREJ0Z0N4NUpFaXl5cjRn?=
 =?utf-8?B?clYzbEJyV0FxQmJ4SGVNOUhoQ0RnWVptanBiUUo2NFlOZFd6dHozRWsybTlY?=
 =?utf-8?B?N1dVYkxMaGNwNnVvc0p4TWI0RWwya0l0N2k1TVBTdlVOcStmK3EvS0JqY1ky?=
 =?utf-8?B?MTlkUFp5bVp2WjB4T05SOU9rcFpOKzJSY2puRGdCZ1huNXg0MFJaQnBycXZN?=
 =?utf-8?B?RFlHd1REL0k4U2RoVzBSRlJDSEFCM1V6a3VsRzFydEd0RWZTaStoUjNsdVVN?=
 =?utf-8?B?Wm5oT3dvM1RqcS9iOWwzanBUY0pRbHpsSG9kZjlKemR2UE5hUVR3MTFQWFY0?=
 =?utf-8?B?SGd6anZsam10dFhnRGYvK2x1aklLV2UyTGVFMG82c1g4azNIRVpNdjk4Rjgy?=
 =?utf-8?B?Mm5ZdDM0a3pwU2NCQ2RMY2xlOVhtOW1qNm5QbE83RzA2SFBUaFFlU05RK0tI?=
 =?utf-8?Q?7DuSO08+KCsdPxTLFYfNlMlqO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c3ecef-5dd6-4746-016b-08dafd645b2b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 17:07:49.6635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ri9ddwSJMBhj/hBNvM87L+tuDFXLkgQdmf8sywf77cRHh5CACS0ryih+EHIy8g5sgiuL3veFK5hd+oiSwW1+zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784

Hi Penny,

On 13/01/2023 05:28, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> We need a new helper for Xen to enable MPU in boot-time.
> The new helper is semantically consistent with the original enable_mmu.
>
> If the Background region is enabled, then the MPU uses the default memory
> map as the Background region for generating the memory
> attributes when MPU is disabled.
> Since the default memory map of the Armv8-R AArch64 architecture is
> IMPLEMENTATION DEFINED, we always turn off the Background region.
>
> In this patch, we also introduce a neutral name enable_mm for
> Xen to enable MMU/MPU. This can help us to keep one code flow
> in head.S
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/arm64/head.S     |  5 +++--
>   xen/arch/arm/arm64/head_mmu.S |  4 ++--
>   xen/arch/arm/arm64/head_mpu.S | 19 +++++++++++++++++++
>   3 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 145e3d53dc..7f3f973468 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -258,7 +258,8 @@ real_start_efi:
>            * and memory regions for MPU systems.
>            */
>           bl    prepare_early_mappings
> -        bl    enable_mmu
> +        /* Turn on MMU or MPU */
> +        bl    enable_mm
>
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
>           ldr   x0, =primary_switched
> @@ -316,7 +317,7 @@ GLOBAL(init_secondary)
>           bl    check_cpu_mode
>           bl    cpu_init
>           bl    prepare_early_mappings
> -        bl    enable_mmu
> +        bl    enable_mm
>
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
>           ldr   x0, =secondary_switched
> diff --git a/xen/arch/arm/arm64/head_mmu.S b/xen/arch/arm/arm64/head_mmu.S
> index 2346f755df..b59c40495f 100644
> --- a/xen/arch/arm/arm64/head_mmu.S
> +++ b/xen/arch/arm/arm64/head_mmu.S
> @@ -217,7 +217,7 @@ ENDPROC(prepare_early_mappings)
>    *
>    * Clobbers x0 - x3
>    */
> -ENTRY(enable_mmu)
> +ENTRY(enable_mm)
>           PRINT("- Turning on paging -\r\n")
>
>           /*
> @@ -239,7 +239,7 @@ ENTRY(enable_mmu)
>           msr   SCTLR_EL2, x0          /* now paging is enabled */
>           isb                          /* Now, flush the icache */
>           ret
> -ENDPROC(enable_mmu)
> +ENDPROC(enable_mm)
>
>   /*
>    * Remove the 1:1 map from the page-tables. It is not easy to keep track
> diff --git a/xen/arch/arm/arm64/head_mpu.S b/xen/arch/arm/arm64/head_mpu.S
> index 0b97ce4646..e2ac69b0cc 100644
> --- a/xen/arch/arm/arm64/head_mpu.S
> +++ b/xen/arch/arm/arm64/head_mpu.S
> @@ -315,6 +315,25 @@ ENDPROC(prepare_early_mappings)
>
>   GLOBAL(_end_boot)
>
> +/*
> + * Enable EL2 MPU and data cache
> + * If the Background region is enabled, then the MPU uses the default memory
> + * map as the Background region for generating the memory
> + * attributes when MPU is disabled.
> + * Since the default memory map of the Armv8-R AArch64 architecture is
> + * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
> + */
> +ENTRY(enable_mm)
> +    mrs   x0, SCTLR_EL2
> +    orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
> +    orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
> +    orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
> +    dsb   sy
> +    msr   SCTLR_EL2, x0
> +    isb
> +    ret
> +ENDPROC(enable_mm)

Can this be renamed to enable_mpu or enable_mpu_and_cache() ?

Can we also have the corresponding disable function in this patch ?

Also (compared with "[PATCH v6 10/11] xen/arm64: introduce helpers for 
MPU enable/disable"), I see that you have added #SCTLR_Axx_ELx_WXN. What 
is the reason for this ?

- Ayan

> +
>   /*
>    * Local variables:
>    * mode: ASM
> --
> 2.25.1
>
>

