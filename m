Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6F06ECBCD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 14:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525340.816478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pquzu-00043k-6E; Mon, 24 Apr 2023 12:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525340.816478; Mon, 24 Apr 2023 12:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pquzu-00040p-3E; Mon, 24 Apr 2023 12:08:46 +0000
Received: by outflank-mailman (input) for mailman id 525340;
 Mon, 24 Apr 2023 12:08:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wwt=AP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pquzs-00040d-Hl
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 12:08:44 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e89::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfb5978b-e298-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 14:08:41 +0200 (CEST)
Received: from BN9PR03CA0078.namprd03.prod.outlook.com (2603:10b6:408:fc::23)
 by SA1PR12MB7409.namprd12.prod.outlook.com (2603:10b6:806:29c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Mon, 24 Apr
 2023 12:08:36 +0000
Received: from BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::c1) by BN9PR03CA0078.outlook.office365.com
 (2603:10b6:408:fc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 12:08:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT077.mail.protection.outlook.com (10.13.177.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 12:08:35 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 24 Apr
 2023 07:08:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 24 Apr
 2023 05:08:31 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 24 Apr 2023 07:08:29 -0500
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
X-Inumbo-ID: bfb5978b-e298-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQhr/spC1I5ImLjbsuuothYCZKce5G39HzJgYk7cjtnpOYghPMe7qaOV2dDX9j6qBQnp+uiYH00H3TR4YVsnZeV6drUmuV4EcB/3g163ez8EqtkTaaVlBqWD/snVFkow7ldJQBva1cYgZFSt8dDCXmI9mSO2ZHgukNGd6eWbWi+8FTiMtTjmRRTRplj4ilAcv0+MR9xCkG0KYK6WofphTr4NBa8CZzzqB9WtIuawqdjEX2qEyNeyM6ti/CYwgnSIF66eaRRy9vv/awI1cSWX3EESIAxe5u1G9lN3XfCETgWkl0+ud6twhkTEmTUap7FbTCufxY3SLl9BsRO2Lbc1qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzCZ6OwnIpGRLsrvkEjJ8Q4GOcTCd5aFi9nRFFZQ/J8=;
 b=cZZSY0v+4lq+1fnvWLnA3U16WhUAutKic9lh9mtUkcnlCWyll/3gfvSw0+E0CZrYLdyyAbP9E+2mleYi8pLBT7MekDt6FublQJJpBF5+BOFnt9McAy5vY6IlOdj0WD4aPdFajjahFJVbOGIiGGaZLpB+1Eh/qT9NH4uskGxgWnidLCEAdKiwjJka81leAk0je964n/glC/sbp7gPaCMypWJ6qkzkStHQ2R9VJtJqnA0OosCrJ73/xghBK1H/48Mr2IdIVrHgFe/JW2R5IlZ7DpZCoeMIxFHYTSs+ejgtZkiPeUYOGNhbO95444MWCOJFh9D2lQ8FCuTGPUflWpzcYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzCZ6OwnIpGRLsrvkEjJ8Q4GOcTCd5aFi9nRFFZQ/J8=;
 b=5ruGh9ZLDtPs01b54FgVh+uqePfcTns1Tq5rKMAAEV4X1V7sdYvQ24KMc/oymaItLQjGdeC3f1AvFg/NWJ+YEz63JRzylrGOP9ISyQOanyGS9jI/QW5lptnoFwmBvWulL3OzgYAUBRWMF95j2BPGCuKrSqiGNP0pME0/CRKQtc8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ca8fd34c-3755-161d-38c1-651cf08ef589@amd.com>
Date: Mon, 24 Apr 2023 14:08:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN v5 05/10] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-6-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230413173735.48387-6-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT077:EE_|SA1PR12MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a56cba-dbed-4a7f-cfc8-08db44bca17d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LdVh97DfdLZp1227d4UrxW7qjyUL6Sa/13bsx7CcZRL4tSziobx4eghirjqsHC2HWSCfajS41v1u3nDFX4lAgfMwaAiL7rzlm2eN4hdVU7GYP1jnUJ/csa+6S1KkU48CtSTaZxv4XJq669Y71JrqQDrt0gxIBg2hj9Pw2VlProX6xcD2mZBrRxnezsrYKm31tCXNB76q+ibH18Wh5hKA3JAgyVh0391ol6mEoOBJEgYQ6DrNgr05llCGdcv/YbNJMXHnrTMhEHKpPfu5vSV+QbBJC3kLx1ymobcJdp0p8qPh4MUvcNVR7MRbFHmJhwc4BsFHpqskT83ZzFKNfZWGYLXYguFscd9Z8ekdS1WYGHvbbGxvdj8gyE9IM+pkeh+DxO/x1s23b40sj7uMhRsjwNyHqSoPC7zEjoid+k4cgGBjpKjotcdaYptE49//JtFBflD8jGW294ApVjvAOfg/wlf8h/2jf3tvttq0LvYD4hu1bgStH8R11r2aWAvkS5ZOn4vzCFlSxvNW8Fq0V6ub2umJUmFlCojKcv9f7mys3m7zZLe3IzvyoT1fZX1vvfU3BMW8xc2WVJKUIKxdZtjDKsop1DllkG0PTn9H6+EwiVovipD1lh2Q+i/Mjpw/ftjNUqGtvwiXmcBUe+iroXxstE8F08L3OTwpUAjxHP3M1/zmn2OmBMKA32HVe1r1zxZ4BilWQJA7nbGcvjHMk6wRV6d0+7K/fR5v2l6smCDsZ47WpJRjaEt5aFHcAPk7m4v09gzvDVHugobuybbz0f6zOfvBO1uMWoQ2NSoOBZ/jUQs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199021)(36840700001)(40470700004)(46966006)(70586007)(2616005)(336012)(426003)(83380400001)(36860700001)(4326008)(41300700001)(47076005)(31686004)(8676002)(8936002)(82740400003)(70206006)(356005)(81166007)(53546011)(5660300002)(316002)(110136005)(16576012)(186003)(7416002)(54906003)(40460700003)(31696002)(44832011)(478600001)(82310400005)(26005)(40480700001)(36756003)(86362001)(2906002)(21314003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 12:08:35.6505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a56cba-dbed-4a7f-cfc8-08db44bca17d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7409

Hi Ayan,

On 13/04/2023 19:37, Ayan Kumar Halder wrote:
> 
> 
> Some Arm based hardware platforms which does not support LPAE
> (eg Cortex-R52), uses 32 bit physical addresses.
> Also, users may choose to use 32 bits to represent physical addresses
> for optimization.
> 
> To support the above use cases, we have introduced arch independent
> configs to choose if the physical address can be represented using
> 32 bits (PHYS_ADDR_T_32) or 64 bits (!PHYS_ADDR_T_32).
> For now only ARM_32 provides support to enable 32 bit physical
> addressing.
> 
> When PHYS_ADDR_T_32 is defined, PADDR_BITS is set to 32.
> When PHYS_ADDR_T_32 is not defined for ARM_32, PADDR_BITS is set to 40.
> When PHYS_ADDR_T_32 is not defined for ARM_64, PADDR_BITS is set to 48.
> The last two are same as the current configuration used today on Xen.
> 
> PADDR_BITS is also set to 48 when ARM_64 is defined. The reason being
> the choice to select ARM_PA_BITS_32/ARM_PA_BITS_40/ARM_PA_BITS_48 is
> currently allowed when ARM_32 is defined.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from -
> v1 - 1. Extracted from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".
> 
> v2 - 1. Introduced Kconfig choice. ARM_64 can select PHYS_ADDR_64 only whereas
> ARM_32 can select PHYS_ADDR_32 or PHYS_ADDR_64.
> 2. For CONFIG_ARM_PA_32, paddr_t is defined as 'unsigned long'.
> 
> v3 - 1. Allow user to define PADDR_BITS by selecting different config options
> ARM_PA_BITS_32, ARM_PA_BITS_40 and ARM_PA_BITS_48.
> 2. Add the choice under "Architecture Features".
> 
> v4 - 1. Removed PHYS_ADDR_T_64 as !PHYS_ADDR_T_32 means PHYS_ADDR_T_32.
> 
>  xen/arch/Kconfig                     |  3 +++
>  xen/arch/arm/Kconfig                 | 37 ++++++++++++++++++++++++++--
>  xen/arch/arm/include/asm/page-bits.h |  6 +----
>  xen/arch/arm/include/asm/types.h     |  6 +++++
>  xen/arch/arm/mm.c                    |  5 ++++
>  5 files changed, 50 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> index 7028f7b74f..67ba38f32f 100644
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -1,6 +1,9 @@
>  config 64BIT
>         bool
> 
> +config PHYS_ADDR_T_32
> +       bool
> +
>  config NR_CPUS
>         int "Maximum number of CPUs"
>         range 1 4095
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 239d3aed3c..3f6e13e475 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -19,13 +19,46 @@ config ARM
>         select HAS_PMAP
>         select IOMMU_FORCE_PT_SHARE
> 
> +menu "Architecture Features"
> +
> +choice
> +       prompt "Physical address space size" if ARM_32
Why is it protected by ARM_32 but in the next line you add something protected by ARM_64?
This basically means that for arm64, ARM_PA_BITS_XXX is never defined.

> +       default ARM_PA_BITS_48 if ARM_64
> +       default ARM_PA_BITS_40 if ARM_32
> +       help
> +         User can choose to represent the width of physical address. This can
> +         sometimes help in optimizing the size of image when user chooses a
> +         smaller size to represent physical address.
> +
> +config ARM_PA_BITS_32
> +       bool "32-bit"
> +       help
> +         On platforms where any physical address can be represented within 32 bits,
> +         user should choose this option. This will help is reduced size of the
> +         binary.
> +       select PHYS_ADDR_T_32
> +       depends on ARM_32
> +
> +config ARM_PA_BITS_40
> +       bool "40-bit"
> +       depends on ARM_32
> +
> +config ARM_PA_BITS_48
> +       bool "40-bit"
40-bit? I think this should be 48-bit.

> +       depends on ARM_48
What is ARM_48? Shouldn't it be ARM_64?
And if so, why bother defining it given everything here is protected by ARM_32.

> +endchoice
> +
> +config PADDR_BITS
> +       int
> +       default 32 if ARM_PA_BITS_32
> +       default 40 if ARM_PA_BITS_40
> +       default 48 if ARM_PA_BITS_48 || ARM_64
This reads as if on arm32 we could have 48-bit PA space which is not true (LPAE is 40 bit unless I missed something).
You could get rid of || ARM_64 if the choice wasn't protected by ARM_32 and fixing ARM_48 to ARM_64.

> +
>  config ARCH_DEFCONFIG
>         string
>         default "arch/arm/configs/arm32_defconfig" if ARM_32
>         default "arch/arm/configs/arm64_defconfig" if ARM_64
> 
> -menu "Architecture Features"
> -
>  source "arch/Kconfig"
> 
>  config ACPI
> diff --git a/xen/arch/arm/include/asm/page-bits.h b/xen/arch/arm/include/asm/page-bits.h
> index 5d6477e599..deb381ceeb 100644
> --- a/xen/arch/arm/include/asm/page-bits.h
> +++ b/xen/arch/arm/include/asm/page-bits.h
> @@ -3,10 +3,6 @@
> 
>  #define PAGE_SHIFT              12
> 
> -#ifdef CONFIG_ARM_64
> -#define PADDR_BITS              48
> -#else
> -#define PADDR_BITS              40
> -#endif
> +#define PADDR_BITS              CONFIG_PADDR_BITS
> 
>  #endif /* __ARM_PAGE_SHIFT_H__ */
> diff --git a/xen/arch/arm/include/asm/types.h b/xen/arch/arm/include/asm/types.h
> index e218ed77bd..e3cfbbb060 100644
> --- a/xen/arch/arm/include/asm/types.h
> +++ b/xen/arch/arm/include/asm/types.h
> @@ -34,9 +34,15 @@ typedef signed long long s64;
>  typedef unsigned long long u64;
>  typedef u32 vaddr_t;
>  #define PRIvaddr PRIx32
> +#if defined(CONFIG_PHYS_ADDR_T_32)
> +typedef unsigned long paddr_t;
> +#define INVALID_PADDR (~0UL)
> +#define PRIpaddr "08lx"
> +#else
>  typedef u64 paddr_t;
>  #define INVALID_PADDR (~0ULL)
>  #define PRIpaddr "016llx"
> +#endif
>  typedef u32 register_t;
>  #define PRIregister "08x"
>  #elif defined (CONFIG_ARM_64)
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index b99806af99..6dc37be97e 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -690,6 +690,11 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>      const unsigned long mapping_size = frametable_size < MB(32) ? MB(2) : MB(32);
>      int rc;
> 
> +    /*
> +     * The size of paddr_t should be sufficient for the complete range of
> +     * physical address.
> +     */
> +    BUILD_BUG_ON((sizeof(paddr_t) * 8) < PADDR_BITS);
Just FYI, there is a macro BITS_PER_BYTE defined in bitops.h that you could use instead of 8.
Although I'm not sure if this would be better :)

>      BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
> 
>      if ( frametable_size > FRAMETABLE_SIZE )
> --
> 2.17.1
> 
> 

~Michal

