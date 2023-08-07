Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C01D87721A8
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 13:24:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578174.905573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyLE-0007iG-FI; Mon, 07 Aug 2023 11:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578174.905573; Mon, 07 Aug 2023 11:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyLE-0007gS-Cb; Mon, 07 Aug 2023 11:24:04 +0000
Received: by outflank-mailman (input) for mailman id 578174;
 Mon, 07 Aug 2023 11:24:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2NL=DY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qSyLD-0007gM-Kl
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 11:24:03 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6bacaad-3514-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 13:24:01 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4862.namprd12.prod.outlook.com (2603:10b6:5:1b7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 11:23:55 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4541:2a3d:737d:b194]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4541:2a3d:737d:b194%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 11:23:55 +0000
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
X-Inumbo-ID: e6bacaad-3514-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vyn+ugfKva6Ol2VbfD7KopPEChSkzbj0vCUv2sS6sNmi2UJaOqjvvXEaGWxnz3RT1T1Cr02fQLmv6iqreZ1JBaM5O5LZQTwLBnng0e64dmLCStVBsxZHw6y6epA32XLAeHMihj4xnEWAGYDY+GwXjZCJ9VN3g17HDDnXfX9hkOdpTwlGo44i6ghO+WPNrPMjR236xkcQPDpZ2VNnN4S6BPG8KnI4gtDnj3CGrn+Ftw5hZ/NO+8Jst/dJ2oyZEq6O20antqcChtdjaEeMJlM0AMElvnlAS793FDoGksIyPeEI8dyYf0YVbgYN398fW1f0TbVKLohbkZI+dwQ0OAmdpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvOt5/tl3yC/oNNRETEh24zwDsRxp4LDd3mEtXQlZgI=;
 b=T5sRqE/8wwOBTM9+rya6YsJf3OnaLz4EJ4KDApL0xI7mTkgAjRJqZhuJvDS2nnJCYH8N87VOtRCQ489HIW2bIzfO5L3rz16vwj5Ki0z4z/+/BWYy/iigf0zUSUr6SPzUXoeU4Nt5A4q39T7f2sAHYY8eorxzifJ+QYMgNTqsg8vEIIrKnfj7XPc5com3wzUaLh3F3Xi9jNxIE+HKep8Cx/CTvHPY32aEygfJmSoYK+Y38d4boH2lzSWg49hFUucTOXtDjq3+qUBWrzvMiW4eHjXrsIpll8tuZj/ZGGyWSSUB39tRyJHkmgQ38YfRxMoehOIA2nRZK+M8doeZlmtOwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvOt5/tl3yC/oNNRETEh24zwDsRxp4LDd3mEtXQlZgI=;
 b=FqIDyHo1zlqMCUmyai1kw+R449lSfbEgps1Ndc2hu4uOPSBhRvhbJQH5X3Fnji5K9vwmgZfezt3nxJP1EmQ0SWzbOscHnBT+MIDC15BGzYha0A0I4CATB50UiDy4xVw++3sFCJN44hXY1UqJagIW/IRqi6O3bZj53Oqwbg0Uom0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <79de42d1-35db-79b1-da2a-f08a72fa53d7@amd.com>
Date: Mon, 7 Aug 2023 12:23:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v4 01/13] xen/arm64: head.S: Introduce
 enable_{boot,secondary}_cpu_mm
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-2-Henry.Wang@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230801034419.2047541-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0472.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::28) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM6PR12MB4862:EE_
X-MS-Office365-Filtering-Correlation-Id: 8766813a-b5f0-49db-76bb-08db9738c903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VForp5SiL38FF1PvA5dObd9eCYgABmA/tjJqUKoRjpt06Ue3Rw630lOTGSF3BiO2vd4mHwhJUF3p1CH61hq5FCqqlRP3loNt6Y0QW9seJ4hcM3bUKwELVt+xMwkQKz/Vjr6IG2+XpwErhlE6kIcX/CN4n6dc/APMpAs0OyWufYUhS/OFU0bUJ2eYOwALQi3X8HrhrktsNHNsXsEVFZB9QupofkY1e0rGqPRmeQ33rvmJHE06a8Gy0KqINlXdKCmEH39TkzQbbRl9M1bzzgbwlq1KS6wksX2RXpvWyluSHShijXlukPgft7vy6aPnjtuhzgWWm+ZE4G0wWWyBjQXJngX4cE2kHUerbT2Z/jm39tZb4Zo0ZDHCtjne/qHh/SyO+WH9AocY0fcix1T84xpESvF6xB+x51gT78SNowdEcduYWMK8aU2SCNTh2Dcu5Kr+jZe4aLx17H5IPhb5kWvoUvZpuBqF8SlBDwShswj8d8wvIqByNYc+bjfA6Jwzo7WowU4atjThw2g/UPVMx1FWoT1nYVmabQNPl8Du2/zuZoUmcHF7yODPUtil0UNCrMk1f2ug6pnqhkoanBS0NYq0h3+O3sdPwJxCCIKBA0XhtZbz4y/WLrAJ83emOHc8bbjfcuw7dwOfmIX13cFFTDQURg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199021)(186006)(1800799003)(2616005)(36756003)(6512007)(4326008)(316002)(478600001)(54906003)(38100700002)(6666004)(66946007)(6486002)(66556008)(66476007)(31696002)(53546011)(6506007)(41300700001)(26005)(8676002)(8936002)(2906002)(83380400001)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmtzaVFaTWpSZGZzS2hvTVByRndtS1R0ekJ6NjE4WCtTOWJZdmJ5WHlHN1F1?=
 =?utf-8?B?VFloYkhmcDFwRkc2YXZ2UGw1ZXRBVjVEZXVLMTZEK1Y2Z0RpRFJrSGt0eHRN?=
 =?utf-8?B?bk1wMWFINlhjZXBJR2lrL2ZZQmhFeUk1M1g3cCtKbngzSlN2KzdTYS9zZGpU?=
 =?utf-8?B?U3pWeW5ibXZuSTJkT2lrV1NnUEw3WmFhNnV5ZFFWQ0FhMnJoYVMyQS90bEdQ?=
 =?utf-8?B?WW1SaEkwOEhOWWlTLy96N2swQ3l2YUlvSFJSM2U4VXRlTmRNb0hQTlJiZnhw?=
 =?utf-8?B?WERKdkZMQVFpanA2VitiK2lDYWJzd2tnRHN0QjZoNmRyUDdUN0xzcG5aUFFk?=
 =?utf-8?B?TGI3Uzc2R2ZlaWd5N3VFL1pub09uM1FIWWJRc3BQRWZNZHRWMWYzTXRaTmJX?=
 =?utf-8?B?WjZYR1JGRXlaTVkzTDRJLzNkSEl3NXBHS2p2ZmlDMUF4REtrdGFXcXh1OWFP?=
 =?utf-8?B?YWl3ZzlWZkNNVkxaMnU3ZFBHeVUvMjcyeTJscGwwU25oMm1mc0gwaUpWR1FC?=
 =?utf-8?B?SFBLMGk0V01DSFhlRTZ6dXk4ZkV3aGFiUnR2WWJKM24yNzNHM2J4UTFtenR0?=
 =?utf-8?B?RlhVU28vQU5SRWFPWlFPVTdjOXRjZ0IzUXQzZE55NnkzelNtTWVpZVRqZmJj?=
 =?utf-8?B?cG56YU9pVFNrMzBLdDdGS1M0cGpVemovbmV1VVVUZFlBSDkwY05yaGJnOFdl?=
 =?utf-8?B?cTR2Y25hYjRBcGJzWXVZRDlHTjBRekZsUWNKdUpNNSt1WlRVZ2J2ZDNvVW1P?=
 =?utf-8?B?LzFDdWVBUE9EWTR6TTBvNW5NbjZmVksvM0N1SWNUUnAzSm94RVltRDlPeTJ1?=
 =?utf-8?B?Z0V3dUpYQVRPUVR1Mk9kSEVaL0RncU0vTm1ZdlRMRU0rVlR0QVlIcWtsYWxn?=
 =?utf-8?B?MTRsRzhoUytrTG82NzAybVdKY3BXSllpbms4OWRiRlBjZzk1K3J2N3FVb0Q0?=
 =?utf-8?B?aURkdlZDRzlZQThsOFdzY09OUTJRY2dvNUhlMGVIVW5TSnF4VHRqVU1oTEVw?=
 =?utf-8?B?c0J2ZklkWWwyNFNPaWNuY1luL3RnZnJLai9BK2UzUyswMXJiRmEySXFSajFB?=
 =?utf-8?B?L3ZyRFBwRFV2MkpnR3Q2RXB2UjFIbmE2NEUzN3ZYZFdWdHFzZm13NE9JMVd5?=
 =?utf-8?B?aE9BQlRQeVJXYUlzNjUxR1l6Q2NTdk04Y2hVeFVnVlRCZGw4ZEFlTUp3dHpl?=
 =?utf-8?B?SnZjdDBpeG5pSW9MMXdRdXkxY2pPZnl4SkcxR1VaSXVjaGxCTnRVNWRjeVZQ?=
 =?utf-8?B?YTk4RmVkRnNCSmhBQ0tCYzBGbGtsOExWOEV1YWhmMWs4YnJOeHVrQmNZM2ZL?=
 =?utf-8?B?REI1bkZmUWx5alk0NWV5RUNFTlFHbTNFMG55eHg4WFgxai92TXZTK0FwU3Zi?=
 =?utf-8?B?b1F3L3p2YTBBbWNyQ2luQjBkdi9XM1FIem93Y2syOFdLRE9QTStNSmlBWW5r?=
 =?utf-8?B?QTNuRW9laVl5Q090TGUzd2t1VmhKcFRYam1sN3o4cUJmZno3NUU5ajZIU2pE?=
 =?utf-8?B?bHF5WXpnNHVQbVQ4bFp2S05KSW5FMTJqbDRHTzZVVllINENqRXlEUWMzWWw5?=
 =?utf-8?B?cDJJSWxKaHJnU1VJR1BSWWFRYlgzdXRSVHRuOEdUaGJUcHp6NzN0K0t1VUlH?=
 =?utf-8?B?Sm5BVmNCM3FHb0tBL0pIUEtBN0hiQk5LZDUwTDBSVGR6WS83S1A2SEVLaWZD?=
 =?utf-8?B?OWVPeWpLclorL2Z2Wm1BZFVJbWdTWStHbUdBOUJRVnk4K2taUTlHYWhBRWRt?=
 =?utf-8?B?YXNSWGZTZTdNbDgwMDNMOVBEQlpjYzQwNWhCTWJ2YXdEVUNqbFI0VkY3UlhK?=
 =?utf-8?B?NE5VWExPY2dmVWZtQkFTcVAvNUJqRW1FK0NaUDZ0MVlRSXhqVHdIRDBoaE95?=
 =?utf-8?B?V1ZBem5Qd1MwZ3BXajBWWDdJTVlLbUgyeGtEcmIxTTk0b3pTa0dNU0NFK1BM?=
 =?utf-8?B?eUQxQklhVHhJNGVVWTkyZHlOUC9ReURqYmIzVnJxQUNRY3hxMXFtOVdjN3lD?=
 =?utf-8?B?UEg1c2NybVRsWTVaS3BYeTV1cUZNdExZaXUrR2dZSG51MWZQSVJyRHJsVkRT?=
 =?utf-8?B?ZDZtcGtaUktabmYxcXRCZ1B4bHVjRWZZVGRUOXd4YzR4YlBvbWxwb0FJYjRt?=
 =?utf-8?Q?paj2/jwK+uMs41JFqGv4qInQo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8766813a-b5f0-49db-76bb-08db9738c903
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 11:23:55.2558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7R5tIoPRb+IRwelSVHurPqHXbn4Z8haDCfRSUr3BfhJ7/B7idSGbsh1W/vhZkgaP04fU1SL4VNARmHw0CnpoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4862

Hi Henry,

On 01/08/2023 04:44, Henry Wang wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Wei Chen <wei.chen@arm.com>
>
> At the moment, on MMU system, enable_mmu() will return to an
> address in the 1:1 mapping, then each path is responsible to
> switch to virtual runtime mapping. Then remove_identity_mapping()
> is called on the boot CPU to remove all 1:1 mapping.
>
> Since remove_identity_mapping() is not necessary on Non-MMU system,
> and we also avoid creating empty function for Non-MMU system, trying
> to keep only one codeflow in arm64/head.S, we move path switch and
> remove_identity_mapping() in enable_mmu() on MMU system.
>
> As the remove_identity_mapping should only be called for the boot
> CPU only, so we introduce enable_boot_cpu_mm() for boot CPU and
> enable_secondary_cpu_mm() for secondary CPUs in this patch.
>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

With two comments

Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Tested-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

> ---
> v4:
> - Clarify remove_identity_mapping() is called on boot CPU and keep
>    the function/proc format consistent in commit msg.
> - Drop inaccurate (due to the refactor) in-code comment.
> - Rename enable_{boot,runtime}_mmu to enable_{boot,secondary}_cpu_mm.
> - Reword the in-code comment on top of enable_{boot,secondary}_cpu_mm.
> - Call "fail" for unreachable code.
> v3:
> - new patch
> ---
>   xen/arch/arm/arm64/head.S | 89 ++++++++++++++++++++++++++++++---------
>   1 file changed, 70 insertions(+), 19 deletions(-)
>
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 31cdb54d74..2af9f974d5 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -313,21 +313,11 @@ real_start_efi:
>
>           bl    check_cpu_mode
>           bl    cpu_init
> -        bl    create_page_tables
> -        load_paddr x0, boot_pgtable
> -        bl    enable_mmu
>
> -        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> -        ldr   x0, =primary_switched
> -        br    x0
> +        ldr   lr, =primary_switched
> +        b     enable_boot_cpu_mm
> +
>   primary_switched:
> -        /*
> -         * The 1:1 map may clash with other parts of the Xen virtual memory
> -         * layout. As it is not used anymore, remove it completely to
> -         * avoid having to worry about replacing existing mapping
> -         * afterwards.
> -         */
> -        bl    remove_identity_mapping
>           bl    setup_fixmap
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Use a virtual address to access the UART. */
> @@ -372,13 +362,10 @@ GLOBAL(init_secondary)
>   #endif
>           bl    check_cpu_mode
>           bl    cpu_init
> -        load_paddr x0, init_ttbr
> -        ldr   x0, [x0]
> -        bl    enable_mmu
>
> -        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> -        ldr   x0, =secondary_switched
> -        br    x0
> +        ldr   lr, =secondary_switched
> +        b     enable_secondary_cpu_mm
> +
>   secondary_switched:
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Use a virtual address to access the UART. */
> @@ -737,6 +724,70 @@ enable_mmu:
>           ret
>   ENDPROC(enable_mmu)
>
> +/*
> + * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
> + * The function will return to the virtual address provided in LR (e.g. the
> + * runtime mapping).
> + *
> + * Inputs:
> + *   lr : Virtual address to return to.
> + *
> + * Clobbers x0 - x5
> + */
> +enable_secondary_cpu_mm:
I will prefer "enable_secondary_cpu_mmu" as it is MMU specific. And ...
> +        mov   x5, lr
> +
> +        load_paddr x0, init_ttbr
> +        ldr   x0, [x0]
> +
> +        bl    enable_mmu
> +        mov   lr, x5
> +
> +        /* return to secondary_switched */
> +        ret
> +ENDPROC(enable_secondary_cpu_mm)
> +
> +/*
> + * Enable mm (turn on the data cache and the MMU) for the boot CPU.
> + * The function will return to the virtual address provided in LR (e.g. the
> + * runtime mapping).
> + *
> + * Inputs:
> + *   lr : Virtual address to return to.
> + *
> + * Clobbers x0 - x5
> + */
> +enable_boot_cpu_mm:

prefer "enable_boot_cpu_mmu" as it is MMU specific as well.

- Ayan

> +        mov   x5, lr
> +
> +        bl    create_page_tables
> +        load_paddr x0, boot_pgtable
> +
> +        bl    enable_mmu
> +        mov   lr, x5
> +
> +        /*
> +         * The MMU is turned on and we are in the 1:1 mapping. Switch
> +         * to the runtime mapping.
> +         */
> +        ldr   x0, =1f
> +        br    x0
> +1:
> +        /*
> +         * The 1:1 map may clash with other parts of the Xen virtual memory
> +         * layout. As it is not used anymore, remove it completely to
> +         * avoid having to worry about replacing existing mapping
> +         * afterwards. Function will return to primary_switched.
> +         */
> +        b     remove_identity_mapping
> +
> +        /*
> +         * Below is supposed to be unreachable code, as "ret" in
> +         * remove_identity_mapping will use the return address in LR in advance.
> +         */
> +        b     fail
> +ENDPROC(enable_boot_cpu_mm)
> +
>   /*
>    * Remove the 1:1 map from the page-tables. It is not easy to keep track
>    * where the 1:1 map was mapped, so we will look for the top-level entry
> --
> 2.25.1
>
>

