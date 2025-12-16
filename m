Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5D5CC1B51
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 10:15:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187710.1509047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVR9W-0001ks-1h; Tue, 16 Dec 2025 09:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187710.1509047; Tue, 16 Dec 2025 09:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVR9V-0001hs-Ui; Tue, 16 Dec 2025 09:15:29 +0000
Received: by outflank-mailman (input) for mailman id 1187710;
 Tue, 16 Dec 2025 09:15:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qh75=6W=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vVR9T-0001hm-Vz
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 09:15:28 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfb24594-da5f-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 10:15:23 +0100 (CET)
Received: from SN6PR08CA0027.namprd08.prod.outlook.com (2603:10b6:805:66::40)
 by IA4PR12MB9761.namprd12.prod.outlook.com (2603:10b6:208:550::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 09:15:18 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:805:66:cafe::fa) by SN6PR08CA0027.outlook.office365.com
 (2603:10b6:805:66::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 09:15:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 09:15:17 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 03:15:17 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 03:15:17 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 16 Dec 2025 03:15:15 -0600
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
X-Inumbo-ID: bfb24594-da5f-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cA+FifzoZdwOprvsodYyQre5YZznY8uqrrIlMWDR66kuoVWJ89gzpr5g07zSsb1G7juwsJs7mqe7vVJWbCzO9MmEDGv7zhSdrkbc99dTQNl46LlipaH6wGfQs6fEQannFKzGSSGSJMvXbqOVTyihtflKJsi3GLWxdbZYfjyjNBNq0Wt9ll55z5usdY5z+eUzsilRnGIPoCnVYrOOUiGWMXViUElvSqFd3zG/JG0ASh2geka6KbgQu49H4d/MZi5rPgzjRXAiil+dnSf4eQER7Dp4BLoswUqa+58tQ8hG21pdjuT2tJkWPfAOX0h6l97Z7N12iZlz+Ptvpfr5gPUODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28XlIN6rS34M0VPAhyL4saGIQkng15I5dxuQ2Uigr+k=;
 b=R6euw/8pQvbGlAmybZ1vBbgc9bz2it9Tp/V2URbXJc08kUHg2UsHxxbmfAISa/CPIcie9qkGAYnGionPNkU/jFqHaOuFiBtf4K36pOCj4L/HtpWq8/ZqIRVAU9dBj6I+ArSVxXOIy6x+U8tsDAvDPgr2B5WB32lo1zS4I61Du2u2RgzzZy+gJhxGVF0s2eQlZuCQnL/vJfruSqvxbaA2DzMUTjZzQJS8PI/dM1j7uuYgquDq9PfRIhwm8QSjewOn84wW7bAZX2cJVepybwm8GP+01JZeCCO91L0HGLpVLmq853lEhIBV7XEfoeDtsksUqULs5QKLNSt8tx6zNeE4sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28XlIN6rS34M0VPAhyL4saGIQkng15I5dxuQ2Uigr+k=;
 b=EtqeE0O5IT9oS6lS6vt+VMrIOUXhmbyczQ3GrxSYuKHOI1vr8hkf8dx8t+bFywP2inBRieJk56b5FxhDHSOfIlVin6Z2Om5xqb/gfiOfQzGBKC/NOsxhsWzTMHNnPuAYbND/Bh5aFVJaMg31cIY3Pu2bpIKUAbV1eeZfG8OTTHI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <6acc279f-15d8-43c5-b676-7312de3dde5e@amd.com>
Date: Tue, 16 Dec 2025 10:15:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm/mpu: Introduce modify_after_init_mappings
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Hari Limaye
	<hari.limaye@arm.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
 <20251128095859.11264-5-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251128095859.11264-5-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|IA4PR12MB9761:EE_
X-MS-Office365-Filtering-Correlation-Id: 008a8b85-e4af-4ff2-4825-08de3c83a147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T25WRG1WM0V5MTFrcHdRY0s0VnRJOU9ndisxcGExSFc1WUh5b0hnaHdFcncw?=
 =?utf-8?B?TUUyVlE5T2ZLSjlVSzF5ZFNGRGt2N3Y4dnJHR2Npci8yMDNrTGxET2pRUW9q?=
 =?utf-8?B?M0dLY21rbWhVS1padFRUbXZEUCsxcmtrdVFKdjQ3RVNUYjFjU0pzMittR3Ew?=
 =?utf-8?B?MmtFQk9QcnpCS3V1cS9hRDJMbTJGQlp4eDR6NVhHL0dNL0FjbEo3VHl4Q3Jm?=
 =?utf-8?B?K2dvclVZY0w2VzgrWjNXK2haWFpGUGxWVDliOUo0Y0RveUUzOWNweTU5NzB0?=
 =?utf-8?B?NEpIbUNRek1IWWE1SFNrMi92Qzc3WVpuOHhOZHNxQWdsajJCbUhDVVl2ZldQ?=
 =?utf-8?B?bGZFMmNxbEUwRkJzSHVNUmJiWFdURDhKWWRMTjVNMVkwZ3VlN3NjRFhpMmJx?=
 =?utf-8?B?UnA5K01KUnM1QXhVWUpsUWtsL1lYVlRJRFJsbXhKbFVHVjZDK0twSzRxcnUv?=
 =?utf-8?B?YVdXVWExUDBjM2V4OUErbEJLTWlTU3I4eEdaZzY3dWxDL1pzTk5VOFBGR1dN?=
 =?utf-8?B?TDZNTkZvRi9HbnBMaFNianRUQUZ4Ykx5T0ZBc3kvRUl4TWt1aWt2N092Qnpt?=
 =?utf-8?B?YXdFcWJWOUdJeFBBUWxmZFRSUlFwMEQrckxyQ3VqNHN6ejJVeVZ5cDdMNEYw?=
 =?utf-8?B?TUlnQ1Vjc0J2Q044Z2FFbTZkVXhwOGdIbktzb09WYmJweEJscjJzam93ZzRh?=
 =?utf-8?B?OVY5ODhHVXlqMlM3d0d3WFpFUFQ3N0JFeDhNNUloUW5OT0VFWnd1dGVLeVcr?=
 =?utf-8?B?TWs3allZRmdSRkVIYmRoZkU3a2pyK2ZsZ1Bic3czV085N3BkRC9HWGo1U0Nw?=
 =?utf-8?B?eHhtTEhyaUNVZ0VYK25DaXZVK0FSZldybDBIV3VDaHVZamdMMzlWWmZpSG9s?=
 =?utf-8?B?emZGdHV5MEc4MXBCVjd5dDZKTDR0UHpsZktBNUNZdzhJaGtoTnZ5WlpGb3o4?=
 =?utf-8?B?cmF6dS9vOXNEYjZyWVQwZk5PaHE4UmFOcmVKa3I4eExwbXpBbGN1cXFrV09H?=
 =?utf-8?B?c2VSTWhHY2xCRm1VK25xYmRYVDArVW9KSVNnT1cvTndKWTRLSTRyNS9NUzZy?=
 =?utf-8?B?ajdCTWVRV3hselN3SXNVVDBZTnlwUU5DR1hPWGxxUC9nK3oyRFY5Rk5QcExv?=
 =?utf-8?B?RmE3WnZ6UjkwQk1oODk5TW5NeFN4WFNQTy9JaFlEOVpHb2YvdXE2Z3d2Ui9J?=
 =?utf-8?B?TVd1aEhlT09qZS9jWmFJY0o0M2dPSDBRSFhmbTBIdStsVlU3M2JZYVJxVnhJ?=
 =?utf-8?B?S2JjZ3dtbm9rdDVLbllncExlaEhpdENDeXpPSVNTL0RGRE4wZWlhU20wUElQ?=
 =?utf-8?B?a0k1NXJ0Y3ZVOEQ2UjU3RytCTXdyL1YrcHNMVlVoakFQeWM4VURuenAwQVVB?=
 =?utf-8?B?T0VTVGc4bjVIMG1lZnp6Y0pFNGNGQVloZElZWHZtOGoyc2Y5eW5ycUNBdWNR?=
 =?utf-8?B?elViNk9aeG0yUnJQdnIrT21WVDRPRlgwcVJsS2pTaEY0VUlNTzJBVWVUaWdI?=
 =?utf-8?B?eC9COHZnRHN6Z2NPSVpodXRBWEhDRUJEdzNqNGpvWmpOeUZHVloyRUZSekVm?=
 =?utf-8?B?aEE3RWRLVzl4RDdZMjZHWjYrcDdEc2NYUDN2K2RtZFNXWjZ2Z1E0WjM2NmxR?=
 =?utf-8?B?MXNoS2R0MDdheUlzQkNobytpVmM5WHRWMnlrRnAzUDJSQ0p5aUJZMS9NVGcw?=
 =?utf-8?B?MUVWR1pMcU91cjhuQzhVQ1VXWjhOcWNwME9VZDVPRVV2VkJCdWZxRU9SVExL?=
 =?utf-8?B?cFkrTGlYVGRlRzJBcmJuSENGZC9DNDJWUjRmOVhyWVFldCsxSXdTU09JeXo3?=
 =?utf-8?B?MlAwZEROaDR0QUE5Q2NualR6QkRQR3NicEIxdnJJcXJiY1Jla0o5cDdjb3hY?=
 =?utf-8?B?WUNSQy9oQitCd1RDNkFkdklrbkZ4QnJGT05QMHdneGpkK2xOV2lNNXdobEEr?=
 =?utf-8?B?ODJ2SEM2ektiaXhrMUVrYVJ5MGRlOWViNnBGMCt5NlU1VE52dWw0UXVneXhU?=
 =?utf-8?B?RDNVbzFHNFMyaHI4OGpwdjhmZGNNRTRpZWVyYVoyNjFaV1IvWDAxZ1ZYVERw?=
 =?utf-8?B?Uk5RWWZnNFY3ekgveVBIR29TTVRhYnNNWnFJK3ZRZ2tqb1VJOEZNeXhIWG84?=
 =?utf-8?Q?6voc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:15:17.6746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 008a8b85-e4af-4ff2-4825-08de3c83a147
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9761



On 28/11/2025 10:58, Harry Ramsey wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> During `init_done`, Xen sets the permissions of all symbols marked with
> __ro_after_init to be read-only. Currently this is achieved by calling
> `modify_xen_mappings` and will shrink the RW mapping on one side and
> extend the RO mapping on the other.
Can you be more specific about the sides you mention? How did you deduce it?
I assume you are talking about MMU part.

> 
> This does not work on MPU systems at present because part-region
> modification is not supported. Therefore introduce the function
What else is in that region?
Wouldn't it be better to have one region for this __ro_after_init so that we
don't need to shrink/extend the mappings? Is it done because of number of
regions limitation?

~Michal

> `modify_after_init_mappings` for MMU and MPU, to handle the divergent
> approaches to setting permissions of __ro_after_init symbols.
> 
> As the new function is marked with __init, it needs to be called before
> `free_init_memory`.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
>  xen/arch/arm/include/asm/setup.h |  3 +++
>  xen/arch/arm/mmu/setup.c         | 15 ++++++++++++
>  xen/arch/arm/mpu/mm.c            |  2 +-
>  xen/arch/arm/mpu/setup.c         | 40 ++++++++++++++++++++++++++++++++
>  xen/arch/arm/setup.c             | 15 ++----------
>  5 files changed, 61 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 005cf7be59..899e33925c 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -78,6 +78,9 @@ struct init_info
>  paddr_t consider_modules(paddr_t s, paddr_t e, uint32_t size, paddr_t align,
>                           int first_mod);
>  
> +/* Modify some mappings after the init is done */
> +void modify_after_init_mappings(void);
> +
>  #endif
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> index 9b874f8ab2..d042f73597 100644
> --- a/xen/arch/arm/mmu/setup.c
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -213,6 +213,21 @@ void __init remove_early_mappings(void)
>      BUG_ON(rc);
>  }
>  
> +void __init modify_after_init_mappings(void)
> +{
> +    /*
> +     * We have finished booting. Mark the section .data.ro_after_init
> +     * read-only.
> +     */
> +    int rc = modify_xen_mappings((unsigned long)&__ro_after_init_start,
> +                                 (unsigned long)&__ro_after_init_end,
> +                                 PAGE_HYPERVISOR_RO);
> +
> +    if ( rc )
> +        panic("Unable to mark the .data.ro_after_init section read-only (rc = %d)\n",
> +              rc);
> +}
> +
>  /*
>   * After boot, Xen page-tables should not contain mapping that are both
>   * Writable and eXecutables.
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 8446dddde8..f95ba7c749 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -32,7 +32,7 @@ DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR) \
>  /* EL2 Xen MPU memory region mapping table. */
>  pr_t __cacheline_aligned __section(".data") xen_mpumap[MAX_MPU_REGION_NR];
>  
> -static DEFINE_SPINLOCK(xen_mpumap_lock);
> +DEFINE_SPINLOCK(xen_mpumap_lock);
>  
>  static void __init __maybe_unused build_assertions(void)
>  {
> diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
> index ec264f54f2..55317ee318 100644
> --- a/xen/arch/arm/mpu/setup.c
> +++ b/xen/arch/arm/mpu/setup.c
> @@ -8,11 +8,14 @@
>  #include <xen/pfn.h>
>  #include <xen/types.h>
>  #include <xen/sizes.h>
> +#include <xen/spinlock.h>
>  #include <asm/setup.h>
>  
>  static paddr_t __initdata mapped_fdt_base = INVALID_PADDR;
>  static paddr_t __initdata mapped_fdt_limit = INVALID_PADDR;
>  
> +extern spinlock_t xen_mpumap_lock;
> +
>  void __init setup_pagetables(void) {}
>  
>  void * __init early_fdt_map(paddr_t fdt_paddr)
> @@ -106,6 +109,43 @@ void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
>          panic("Unable to unmap range for copy_from_paddr\n");
>  }
>  
> +void __init modify_after_init_mappings(void)
> +{
> +    int rc;
> +    uint8_t idx_rodata;
> +    uint8_t idx_rwdata;
> +
> +    spin_lock(&xen_mpumap_lock);
> +
> +    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions,
> +                                (unsigned long)_srodata,
> +                                (unsigned long)_erodata,
> +                                &idx_rodata);
> +
> +    if ( rc < MPUMAP_REGION_FOUND )
> +        panic("Unable to find rodata section (rc = %d)\n", rc);
> +
> +    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions,
> +                                (unsigned long)__ro_after_init_start,
> +                                (unsigned long)__init_begin,
> +                                &idx_rwdata);
> +
> +    if ( rc < MPUMAP_REGION_FOUND )
> +        panic("Unable to find rwdata section (rc = %d)\n", rc);
> +
> +    /* Shrink rwdata section to begin at __ro_after_init_end */
> +    pr_set_base(&xen_mpumap[idx_rwdata], (unsigned long)__ro_after_init_end);
> +
> +    /* Extend rodata section to end at __ro_after_init_end */
> +    pr_set_limit(&xen_mpumap[idx_rodata], (unsigned long)__ro_after_init_end);
> +
> +    write_protection_region(&xen_mpumap[idx_rwdata], idx_rwdata);
> +    write_protection_region(&xen_mpumap[idx_rodata], idx_rodata);
> +    context_sync_mpu();
> +
> +    spin_unlock(&xen_mpumap_lock);
> +}
> +
>  void __init remove_early_mappings(void)
>  {
>      int rc = destroy_xen_mappings(round_pgdown(mapped_fdt_base),
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 7ad870e382..6310a47d68 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -66,23 +66,12 @@ domid_t __read_mostly max_init_domid;
>  
>  static __used void noreturn init_done(void)
>  {
> -    int rc;
> -
>      /* Must be done past setting system_state. */
>      unregister_init_virtual_region();
>  
> -    free_init_memory();
> +    modify_after_init_mappings();
>  
> -    /*
> -     * We have finished booting. Mark the section .data.ro_after_init
> -     * read-only.
> -     */
> -    rc = modify_xen_mappings((unsigned long)&__ro_after_init_start,
> -                             (unsigned long)&__ro_after_init_end,
> -                             PAGE_HYPERVISOR_RO);
> -    if ( rc )
> -        panic("Unable to mark the .data.ro_after_init section read-only (rc = %d)\n",
> -              rc);
> +    free_init_memory();
>  
>      startup_cpu_idle_loop();
>  }


