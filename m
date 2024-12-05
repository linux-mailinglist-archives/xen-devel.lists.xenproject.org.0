Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E789E5191
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 10:41:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849010.1263743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ8LY-0000vs-AA; Thu, 05 Dec 2024 09:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849010.1263743; Thu, 05 Dec 2024 09:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ8LY-0000tc-6J; Thu, 05 Dec 2024 09:40:32 +0000
Received: by outflank-mailman (input) for mailman id 849010;
 Thu, 05 Dec 2024 09:40:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GtMJ=S6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tJ8LW-0000tU-Kr
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 09:40:30 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2413::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f531686f-b2ec-11ef-a0d5-8be0dac302b0;
 Thu, 05 Dec 2024 10:40:28 +0100 (CET)
Received: from MW4PR03CA0162.namprd03.prod.outlook.com (2603:10b6:303:8d::17)
 by DM4PR12MB6134.namprd12.prod.outlook.com (2603:10b6:8:ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Thu, 5 Dec
 2024 09:40:23 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:303:8d:cafe::d9) by MW4PR03CA0162.outlook.office365.com
 (2603:10b6:303:8d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.17 via Frontend Transport; Thu,
 5 Dec 2024 09:40:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.1 via Frontend Transport; Thu, 5 Dec 2024 09:40:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Dec
 2024 03:40:21 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 5 Dec 2024 03:40:19 -0600
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
X-Inumbo-ID: f531686f-b2ec-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+9K7ypO0yIMGKnTkU6IkuRqqcEdwoD2nReLD2GQvjR7Fi1oCkASTQsSlePNdwMVNYEAp1Qx8hR///eTrFVOJBKDwIaeBZ1ttaM43G2q6anPe/V8P1BluGQF/lTB+UMlwbdMh/RrEjcyaGU8D8murW82QynngeWtsGrAYojv9oO6NdcRT9zMwzZRuCVfXLZN08Qr2Tt7G15K0SAm4Vd/TvpdveoP1peWwiAL3K68j2nqlNbTHWmVUFp40lo82DJfsY4AwUnpvF1hc2X7zmZSVfhx2EQQhrQUYM6j35Ze7bGDHfQNVzcBv4wlXOTgvFnxapBVkFLSZ/1e/UwfX87VIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hznBQeb1ExTflNfXH0aGJrt9LW+eNoot1BZVA6crNNY=;
 b=QVC1s6UFBocKB5UC+Woi0zve5SrcQVlCrR1gBAbyEGIufFbfL4Z5yjiLJab5ppdelM553xuCzSEjUOdojOP0AgfEa7WyqBh/a7Ej84hRngCS3qWcZULGs/GRD4aCVFL5IYVO3IdxCVyIsUTJBwBximS5WFYX6LNLQOKaYFjv/x8KkXAFvKO7BKIIDzez+tnWc5UCxQJAjYm0BtOW1AUAE4YvgHQ7IDT5kj8Si3GRWtuVWjUB67bIovOTAsfsGqzAFPd75fW0Kne1YxqPVjFRJ/ikwEeCURKnM36KBWqv9rBcOSaN/Pru02GpDx954ZXWnewJ+BMMnlIgEA+T3eGy/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hznBQeb1ExTflNfXH0aGJrt9LW+eNoot1BZVA6crNNY=;
 b=G2U61Ee6mlKvyIZrV0c0g3CJ9SuEFw2wG+duTqygVY+oaR6z+gkDUk1Dal6hL7xfw9xTp1qcuNbqAnNiSxRePgmHqaIjwjX69CJePHgw+Yb31v2wUQIO4GcuNk5TsCvXCGsKjxPxpLlqVOKwOrhe1qkjeuM6/AUlpfAVN00qXcc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <bc40c381-0998-4dd2-b5c9-5b70b45805ce@amd.com>
Date: Thu, 5 Dec 2024 10:40:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/12] xen/arm: permit non direct-mapped Dom0
 construction
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, <marco.solieri@minervasys.tech>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-4-carlo.nonato@minervasys.tech>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241202165921.249585-4-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|DM4PR12MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 290108a0-6c05-40cf-9787-08dd1510d6d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGlEYkFaWkxjeWxUYmdlUzAvaHlTdjZMVDR0MERHdCtVc0dNbC9oWmhGcWgw?=
 =?utf-8?B?L1lmZG15Umxpbm9kNWN1c1N2WDBsQldlcUxLaDFJMzdaT0tJa0dhaXVtQlo1?=
 =?utf-8?B?aDUva2hmU3lRczh5Zy9QbGJnK201MXY1R24rVGswbzk3bEgxa3kwY0UvSUJs?=
 =?utf-8?B?Nkk5TlFsRTBZTVpGdjFwTWJwU25Uekg0d0s3emp2azF2Q2JGdDZPbGFUZXJn?=
 =?utf-8?B?dVYrVmRuM1V6ejJ5QVNMS0JodXloY1huNytjaDZTOFcvaWl2Z2pJcTVzODdW?=
 =?utf-8?B?Skl6K3MwT1Y1clY0WDZVbERyMXl1N3lPOEtUa09ZVlk2SHFKV1N0emRUd1pW?=
 =?utf-8?B?eDVSbk1xMkJRRVBhVWRENGNJY1A1a1FjMUhLRXZSTERWa2NZdGdoRGlFcGhu?=
 =?utf-8?B?aU5zWWlaTjhNVmsySzllYWhwMW9lSDNkYkFnUlZob1FxMERXaUd3b0FpdWNH?=
 =?utf-8?B?VEg5cSswaXpGdmU3NEhUby9FdFNqMnhqT2VIY2kvOTVPN2RsUElYcU0vMkpC?=
 =?utf-8?B?OEdKQXRhRk9Hb3pXZjRHVmFhZUVsL0FWTnphOFAzNTBpNjlPakgyZ3czL2FK?=
 =?utf-8?B?OXNiZ3RDeUlzMEFxbWZJV0pyaGlaSG5YVHZ6NGV1TkQxQ2pZRDVsd3dnQ3VX?=
 =?utf-8?B?cFVhV0NST3pER2p0aEx0M295QUc0WGVvNUxiaVowb05Dcm1KclRCaWdGVmMz?=
 =?utf-8?B?dk01L3M0ZHc0ZVYramJOOW5SYzRuUjB4UUQ4YkRzeWlCdkJZWnE4S0M1OHN1?=
 =?utf-8?B?SW5HWlErTVZsZU5CUmFmMXdjaUJDUHNRcXExVnd2WlFmaEZaVUJueDEwSXMw?=
 =?utf-8?B?Wmh1cXNjeTZyS0c5L0xjcURtQUtRT2JkMVh5ai9qU0FGMDVJVXI5SmN3ckl6?=
 =?utf-8?B?ZWVBWURiMVI4QkZqQ3A5cjdjRFhMRFlFTCtKeER4R1NnOXdaRG1Vd1hnR1c3?=
 =?utf-8?B?QkoyQXpzWllSa0Y5c2Z2VGlDQUFRZU1PanVhSytKM1c3YllpalhNMGhiVDk1?=
 =?utf-8?B?QUZKU3ZmSXdyNmN0S3VoM0w1RkxGeGF1RVRqYkM0NGFhYytMU3FaT0liZlZu?=
 =?utf-8?B?ckRyaUtoUzRFZlFXUHRGSnhRWFhKaWxqYjZDL2pRMEdxd3VpSHJrZWtEV3R4?=
 =?utf-8?B?elcwbFV4aXhQTmc5QWdtbE9wU0pkOU0vcjVldUJyMHp1TzdoeFdkM1BzdSsw?=
 =?utf-8?B?WDluK1R3M0hjaCtDR0pqam5mWHBCYjZmeXVmMk1Va0FwVC9OZEdLczlKT3NS?=
 =?utf-8?B?N3lJRmhOSk02ZVppM2UyN1NIRXUrZkdOM2F0cTVDLzcraGw0UEI1N3JzcDNV?=
 =?utf-8?B?TU1UTC9vSmtJNmZEZXdGbDVCZTl6bUNnUldySkFnb3QrUHJoVVNsU0Y5NHh6?=
 =?utf-8?B?Z1RFOGMyNkwyWXRrb1QzVHRFa2ExbkUzaWFRM1hweStnUkk2dVZ1M1Fib29U?=
 =?utf-8?B?TG9jbFlZNVFyeWNkNjZ2V2ZZOXpQVk1TYk8zS3NSWGp1cUJMcS9zMElpR09a?=
 =?utf-8?B?bGdzK2ozbkp4NFo2M040OWQ3SGVDVWtoV0hwam1pNE9xZjRya1o1ZWU4REcx?=
 =?utf-8?B?QWFUbFhBR3VHK3VCU2lxQy9UbUMwSU5EQ2JpbC9ySVBPUnk1NUVrN1dXU3Zl?=
 =?utf-8?B?TCtHRGdabTUyVzV2RGhVZkV2QnQxR01SMEIwcFFLcHYycUJlMmVPU29MY0ZX?=
 =?utf-8?B?OVp0WWluRmNNd2hPWndhanpkbmNOb1R0clJlaUpFRUZaSnBodlJVUEdiRWY2?=
 =?utf-8?B?YXI2L29oUkN5TDhSYmNob2pMQWNDT1BBcnpuY1YzbjJnL0FqaFNEV05TdHha?=
 =?utf-8?B?NXRhdFM2YmdiWGlaQ08yV2xiSk9kcWltcmJtbzNseVB1RVBsbngyNWdmMEJY?=
 =?utf-8?B?WU1qbXljd2Q3Nnp4NS9QMmlPMUR3clBaZVBCZ29wdXBUNHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 09:40:22.2414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 290108a0-6c05-40cf-9787-08dd1510d6d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6134



On 02/12/2024 17:59, Carlo Nonato wrote:
> 
> 
> Cache coloring requires Dom0 not to be direct-mapped because of its non
> contiguous mapping nature, so allocate_memory() is needed in this case.
> 8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separate module")
> moved allocate_memory() in dom0less_build.c. In order to use it
> in Dom0 construction bring it back to domain_build.c and declare it in
> domain_build.h.
> 
> Take the opportunity to adapt the implementation of allocate_memory() so
> that it uses the host layout when called on the hwdom, via
> find_unallocated_memory().
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> ---
> v11:
> - GUEST_RAM_BANKS instead of hardcoding the number of banks in allocate_memory()
> - hwdom_ext_regions -> hwdom_free_mem in allocate_memory()
> - added a comment in allocate_memory() when skipping small banks
> v10:
> - fixed a compilation bug that happened when dom0less support was disabled
> v9:
> - no changes
> v8:
> - patch adapted to new changes to allocate_memory()
> v7:
> - allocate_memory() now uses the host layout when called on the hwdom
> v6:
> - new patch
> ---
>  xen/arch/arm/dom0less-build.c           | 44 -----------
>  xen/arch/arm/domain_build.c             | 97 ++++++++++++++++++++++++-
>  xen/arch/arm/include/asm/domain_build.h |  1 +
>  3 files changed, 94 insertions(+), 48 deletions(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index d93a85434e..67b1503647 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -49,50 +49,6 @@ bool __init is_dom0less_mode(void)
>      return ( !dom0found && domUfound );
>  }
> 
> -static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
> -{
> -    struct membanks *mem = kernel_info_get_mem(kinfo);
> -    unsigned int i;
> -    paddr_t bank_size;
> -
> -    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
> -           /* Don't want format this as PRIpaddr (16 digit hex) */
> -           (unsigned long)(kinfo->unassigned_mem >> 20), d);
> -
> -    mem->nr_banks = 0;
> -    bank_size = MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
> -                               bank_size) )
> -        goto fail;
> -
> -    bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
> -                               bank_size) )
> -        goto fail;
> -
> -    if ( kinfo->unassigned_mem )
> -        goto fail;
> -
> -    for( i = 0; i < mem->nr_banks; i++ )
> -    {
> -        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
> -               d,
> -               i,
> -               mem->bank[i].start,
> -               mem->bank[i].start + mem->bank[i].size,
> -               /* Don't want format this as PRIpaddr (16 digit hex) */
> -               (unsigned long)(mem->bank[i].size >> 20));
> -    }
> -
> -    return;
> -
> -fail:
> -    panic("Failed to allocate requested domain memory."
> -          /* Don't want format this as PRIpaddr (16 digit hex) */
> -          " %ldKB unallocated. Fix the VMs configurations.\n",
> -          (unsigned long)kinfo->unassigned_mem >> 10);
> -}
> -
>  #ifdef CONFIG_VGICV2
>  static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>  {
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 2c30792de8..2b8cba9b2f 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -416,7 +416,6 @@ static void __init allocate_memory_11(struct domain *d,
>      }
>  }
> 
> -#ifdef CONFIG_DOM0LESS_BOOT
>  bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
>                                      alloc_domheap_mem_cb cb, void *extra)
>  {
> @@ -508,7 +507,6 @@ bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
> 
>      return true;
>  }
> -#endif
> 
>  /*
>   * When PCI passthrough is available we want to keep the
> @@ -1003,6 +1001,94 @@ out:
>      return res;
>  }
> 
> +void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
> +{
> +    struct membanks *mem = kernel_info_get_mem(kinfo);
> +    unsigned int i, nr_banks = GUEST_RAM_BANKS;
> +    paddr_t bank_start, bank_size;
Limit the scope

> +    struct membanks *hwdom_free_mem = NULL;
> +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
> +    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
Limit the scope

> +
> +    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
> +           /* Don't want format this as PRIpaddr (16 digit hex) */
> +           (unsigned long)(kinfo->unassigned_mem >> 20), d);
> +
> +    mem->nr_banks = 0;
> +    /*
> +     * Use host memory layout for hwdom. Only case for this is when LLC coloring
> +     * is enabled.
> +     */
> +    if ( is_hardware_domain(d) )
> +    {
> +        ASSERT(llc_coloring_enabled);
This patch does not build because of declaration not being visible. You must include <xen/llc-coloring.h>.

> +
> +        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
> +                                             NR_MEM_BANKS);
> +        if ( !hwdom_free_mem )
> +            goto fail;
> +
> +        hwdom_free_mem->max_banks = NR_MEM_BANKS;
> +
> +        if ( find_unallocated_memory(kinfo, hwdom_free_mem) )
My remarks for the use of find_unallocated_memory() 1:1 have not been addressed. You did not even
change the comments inside the function. The problem is that the function is specifically designed
for finding extended regions and assumes being called at certain point i.e. dom0 RAM allocated, gnttab
region allocated, etc. My opinion is that we should attempt to make the function generic so that in your
case you can choose which regions to exclude, define even your own function to grab free regions (at the moment
add_ext_regions grabs banks >= 64M but you still discards banks >= 128M, so it's a bit wasteful.

My very short attempt to make the function as generic as possible in the first iteration:
https://paste.debian.net/1338334/

For coloring, you could define your own add_free_regions and only pass RSVD and GNTTAB banks to be excluded.

As said before, I still wait for other Arm maintainers to provide their own opinion.

~Michal


