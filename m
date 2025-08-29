Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2EBB3B3C1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 09:04:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100650.1453989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urt9k-0005J8-Vh; Fri, 29 Aug 2025 07:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100650.1453989; Fri, 29 Aug 2025 07:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urt9k-0005Gp-Sd; Fri, 29 Aug 2025 07:04:16 +0000
Received: by outflank-mailman (input) for mailman id 1100650;
 Fri, 29 Aug 2025 07:04:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mo2k=3J=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1urt9i-0005Fh-Co
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 07:04:14 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5def9469-84a6-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 09:04:13 +0200 (CEST)
Received: from BYAPR01CA0037.prod.exchangelabs.com (2603:10b6:a03:94::14) by
 SA3PR12MB9225.namprd12.prod.outlook.com (2603:10b6:806:39e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.17; Fri, 29 Aug
 2025 07:04:06 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::7e) by BYAPR01CA0037.outlook.office365.com
 (2603:10b6:a03:94::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.19 via Frontend Transport; Fri,
 29 Aug 2025 07:03:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Fri, 29 Aug 2025 07:04:06 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Aug
 2025 02:04:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 29 Aug
 2025 00:04:03 -0700
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 29 Aug 2025 02:04:00 -0500
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
X-Inumbo-ID: 5def9469-84a6-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAI+BhYN3n9d6+fs+QZk8d732s+izqvtmEI8+j0rrJFkd4fd5Ny3KUn+UDLVNeCXeyjBX9+UMmrnPDvL3tFEAlXfejywvDrvzNBem2IEiaIJQzafqSumeXnKbYmMU1wb/GRQ8Ay1a7iVyJ95oJDLCjphkJdQwR6fi4h4SZ7DVrE2O6XaWjbYuwghM6AfSnwANmMkebwdpnGPGfwwx18J7iXxs3u4JKfg+EhiPiQg+ZiImmk+Q18fthtQ6zS1j2MhK/pQr+6m14ypxtkjdkXKOFbRbBdkSGP2cUpj9QT4PmSIxA3FQ8wJq8LW5jbi9lopGuCVtnh6YdCLN9vMFIgDZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0aDw56Ks0qLUMD5JL6Bv8O/0/8nij4QzHfOTQaOd9s=;
 b=v0GkPkUY54x5n2wkw8gMF8PziM+DGhqJ46FH9rn0ET4rPSHkMOUzuiDRWJyHaozXpExNbTuVIXDcDCa6vewOVHaznnj75AyG/rkK2dfw1/IZN0E5sy2aH0rO2geykO21VMaanWwFTJCw4AsuqZLESmM/Nh8z5fhVXA+rGmjNadFN1RzPHsXjtWpeWN2faEBp26+nvKrRZeWXn6Cy9JijnmzXiebP82wuumpZvuL6d4q4gwvPAEQz5QdirxITX/oH3FcTGh7rfhfJv/aJyPXJGJWrk57sXaGkHjaV885D0F2nUD7l2pM7gDB/Mcf5qy3HGZ2JzNZK90Elk8VirnbaEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0aDw56Ks0qLUMD5JL6Bv8O/0/8nij4QzHfOTQaOd9s=;
 b=2Sue4ewBetwYV+HoHGBMhqumxuBurpYZ2RSC7pWQ+EllF5RNNfh5BaksPiPp2nTKO1MlxotyD1wO4+CX8f0zZC0nJ66BegOGQIC8CEQbtk7lSGLH6rDXRZXl9FfARz0lYAnCva2TKqEji/mQqbjQ0xxCEvQMgD0Lz+AqhVV97iA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <cf9f35a5-5c67-48b9-851a-67736050230a@amd.com>
Date: Fri, 29 Aug 2025 09:04:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] xen/arm: map static memory on demand
To: Hari Limaye <hari.limaye@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Chen
	<wei.chen@arm.com>
References: <cover.1756379422.git.hari.limaye@arm.com>
 <30cbc79f765c21759d74377e55cc471210fc2575.1756379422.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <30cbc79f765c21759d74377e55cc471210fc2575.1756379422.git.hari.limaye@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|SA3PR12MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee3b914-cafd-4989-a336-08dde6ca3e7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1gwMUlVZ0xUR09oejdzY3gveUtEaWZ3MWRQTk1DN0xVRlgyWENodW80NjBv?=
 =?utf-8?B?RlZFQ0JoZHJIUEVyM3ZkUW9zaGdpWEdFTmhWaHowZ1V1SWx2ZWpGUE11Z0Zw?=
 =?utf-8?B?R0V1YTNSTG1mdnREOEZMbjdMM1g5ZVpUQVR6b1BGZE5FYzNTTWx4V2pISVBo?=
 =?utf-8?B?YWsrTWxsaGNPWjQ4QjhhTWhYR2FLWHo3blV5MHVmQnlJdS9kaWZVcWJ3TWRT?=
 =?utf-8?B?N3VOVzl4RWxzU2sxQ3N0NVBCVWNTSndxMmsxWDFXb3R6a3ZGblMwL0pjZGpF?=
 =?utf-8?B?TmpsM0g2RkFveTFidE1NYlBZRDZPT0JiSVRCeHZ6SEtUVTdsOWlPVVpJMENj?=
 =?utf-8?B?NUhoMXoyZjhQN21kTHRWeXUrM2FqWnVZSXZnZG5reVNkUlNYa1VkTFFGUmI3?=
 =?utf-8?B?anlRRHByM2U2VXJMY241N0JTdVBwQ1ZoWEd4dWJRK09XZDVPT3JGNGVOS3Rn?=
 =?utf-8?B?ZFlUbFpVL2JjenJvaVovakZjeG5XYmcxY0hQeFZkWFVXbG1RZldld2F6aXRG?=
 =?utf-8?B?SXBWY04xeE9zWG9LdEFvNjlWUkVERjNHZXZCRzB5SE1xTXJwOUZ5Slo3c1pI?=
 =?utf-8?B?WTd1b0R3VzhrM1NXNWsrQkpKYmp5dzkvdVF0YWJZbS9ZZCtaRnBwSU5kQWI5?=
 =?utf-8?B?VnJvWnkwTG5GUEhYcU5qV2ZpVnBOYmgzUnlpaUJ6RGxuNG1ONU9seDZiSG1z?=
 =?utf-8?B?Q3NmS0w4TUNtamU2cTMzLy9PdzdTdFdqMjV2cTFscm5pUEgySmFSUWJhTjBL?=
 =?utf-8?B?QWdGdDBOR3RjdzBFejMxeHZWUmFzcnBMR2VGNnVYbjJteVpaTEFnNHZURXZ3?=
 =?utf-8?B?dk10NWgvWlVLMjN4WE1ESnJscVp4dkY2YlBRNFJpNnRMZnZBNkJCdnBrU1Jw?=
 =?utf-8?B?c0Q4WnMvOFZoWlVON0lXOVNqbTVVSk42ejlnellQZWRLd0ErYnFFSUpXNEYv?=
 =?utf-8?B?MkNETlVlVFVXSU5iTUh2NFMzTkZJYVRDWHZXa0lmQkU0RlA0NDJTZC9pVXda?=
 =?utf-8?B?eTlxei9kb3g0TjE0dENnRWpLNSs5ZThnaGRBd3NzR0trbkZCNzdrQ2hFOFF5?=
 =?utf-8?B?MmFZQVBjMlI3T3hQN2hxampSdnZidmluTEdkWjd2WXhaVjJYZU1ha1d4OGNi?=
 =?utf-8?B?QnVHTzBwL2t3d0ZPM0lMVm94K0lORUpEUDlSZGJQTDFzS0VqcDQxZ2w5YU11?=
 =?utf-8?B?SzRVOG5aVE1Fekp5WTBFVzluQ2VWNFBtY1FVRFJSeVBVNVpTR1ViVHFUUHBq?=
 =?utf-8?B?RitRK25qbjdDL0VpaDlLRy9pdWpuOVIweHk4OXVWY21PNDdjV1RUTzdFblpF?=
 =?utf-8?B?Zit3ME40ZHJEd3BBQ3BhT1RzTXJMWFd6dXE2SWVOSENDR3AzeFdRSGdBQ0JE?=
 =?utf-8?B?Q3BEb1RIM0VuRDJlVkRvSWpTV1BOeFBUNWNka1djTFloUFpZUTM4Qk8vWlVq?=
 =?utf-8?B?S2c2UkZ0Um1YSTJBaXdLSHpDaHlvRFlHN3pYWjA1ZEhLQ1FoNEREZFF6OTV5?=
 =?utf-8?B?bEd3R01OSm9WdEs5WVNQVjkrNUZ6N3VxY0V2S25GT05DZE8yUGdGOUZoOTV3?=
 =?utf-8?B?V2ZERkZzTWFGVUVrNDNMcnRXQ2k1aFVkNGJaU3h1UGk3MklPc2lnc2VzdGox?=
 =?utf-8?B?S3h1bWRaQ0JaT0lUSkk5Tm1uUGdMYytvdUE0bHpPVDBKMEc4MTJsSDVlaWRq?=
 =?utf-8?B?TmxxUTlxdGdPU0VvdUhtSEE3SmRSUUx4YTlMWnNzdW5ucEI0dzBNTVR2OUFO?=
 =?utf-8?B?QmJod3p6UUNERFVFM0tlSkdtcTFqY1NuMkExVFdCdHNKWmhFbkF0ZWdNRUsx?=
 =?utf-8?B?eE84QjlCdnBxZE1TUjdSbWRoMUVHQ3RHZnZENGk1Q2wxaEl0akJVVGpkQjF1?=
 =?utf-8?B?UE84RXRSZ282dTEvTlZCcW5nQW03cUlNU2VSTVJTUXpsZFdJNzhrRDlNNjlH?=
 =?utf-8?B?M2V2dGdDV3hIbkFyV0svZXgxekdOWmkyTUhqdEpJRnBVaEN3ZGdvQ0dvakY0?=
 =?utf-8?B?bHlvMEx1aVhFYWl0UFZZd0xsdnBmc0FkYzBnSGpZTlNkZGhHQkN1emVOd1lD?=
 =?utf-8?Q?MKUW9Y?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 07:04:06.1394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee3b914-cafd-4989-a336-08dde6ca3e7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9225



On 28/08/2025 13:12, Hari Limaye wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> In the function `init_staticmem_pages` we need to have mapped static
> memory banks for initialization. Unlike on an MMU system, we cannot map
> the entire RAM on an MPU system as we have a limited number of MPU
> memory regions. To solve this, transiently map the static memory banks
> for initialization.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Given that the freeze date will likely be extended, I'd prefer to take this tag
back and request this patch to be changed due to reasons listed below.

> ---
> Changes from v2:
> - Add Michal's R-b
> ---
>  xen/arch/arm/include/asm/mmu/mm.h |  3 +++
>  xen/arch/arm/include/asm/mpu/mm.h |  4 ++++
>  xen/arch/arm/mpu/setup.c          | 11 +++++++++++
>  xen/include/xen/static-memory.h   |  8 ++++++++
>  4 files changed, 26 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
> index 7f4d59137d..645a0ea3cb 100644
> --- a/xen/arch/arm/include/asm/mmu/mm.h
> +++ b/xen/arch/arm/include/asm/mmu/mm.h
> @@ -110,6 +110,9 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
>  extern void switch_ttbr(uint64_t ttbr);
>  extern void relocate_and_switch_ttbr(uint64_t ttbr);
>  
> +static inline void map_staticmem_pages_to_xen(paddr_t start, paddr_t end) {}
> +static inline void unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end) {}
> +
>  #endif /* __ARM_MMU_MM_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index efb0680e39..4cc769418e 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -123,6 +123,10 @@ void *map_mm_range(paddr_t base, paddr_t limit, unsigned int flags);
>   */
>  void unmap_mm_range(paddr_t base);
>  
> +/* {un}map_staticmem_pages_to_xen used while initializing static memory banks */
> +void map_staticmem_pages_to_xen(paddr_t start, paddr_t end);
> +void unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end);
> +
>  /*
>   * Checks whether a given memory range is present in the provided table of
>   * MPU protection regions.
> diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
> index 163573b932..dbc3107333 100644
> --- a/xen/arch/arm/mpu/setup.c
> +++ b/xen/arch/arm/mpu/setup.c
> @@ -83,6 +83,17 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>      return fdt_virt;
>  }
>  
> +void __init map_staticmem_pages_to_xen(paddr_t start, paddr_t end)
> +{
> +    if ( !map_mm_range(start, end, PAGE_HYPERVISOR) )
> +        panic("Unable to map staticmem pages to Xen!");
> +}
> +
> +void __init unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end)
> +{
> +    unmap_mm_range(start);
> +}
> +
>  /*
>   * copy_from_paddr - copy data from a physical address
>   * @dst: destination virtual address
> diff --git a/xen/include/xen/static-memory.h b/xen/include/xen/static-memory.h
> index e445aa8057..d99abac113 100644
> --- a/xen/include/xen/static-memory.h
> +++ b/xen/include/xen/static-memory.h
> @@ -18,7 +18,15 @@ static inline void init_staticmem_bank(const struct membank *bank)
>      if ( mfn_x(bank_end) <= mfn_x(bank_start) )
>          return;
>  
> +    /* Map temporarily before initialization */
> +    map_staticmem_pages_to_xen(mfn_to_maddr(bank_start),
> +                               mfn_to_maddr(bank_end));
Static memory is not Arm only feature, it is common and as such should not (and
does not) make calls to Arm only functions. If at all, such helpers should be
made generic so other arches that could enable static memory can re-define them
if needed (as you pointed out, on MMU you don't need to map/unmap this region
temporarily).

~Michal


