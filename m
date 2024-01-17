Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C7C83014B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 09:31:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668267.1040307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ1JT-0002h8-BJ; Wed, 17 Jan 2024 08:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668267.1040307; Wed, 17 Jan 2024 08:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ1JT-0002ed-7m; Wed, 17 Jan 2024 08:30:19 +0000
Received: by outflank-mailman (input) for mailman id 668267;
 Wed, 17 Jan 2024 08:30:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2QPC=I3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rQ1JR-0002eX-CG
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 08:30:17 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3940b96-b512-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 09:30:15 +0100 (CET)
Received: from CYXPR02CA0083.namprd02.prod.outlook.com (2603:10b6:930:ce::18)
 by BL3PR12MB6619.namprd12.prod.outlook.com (2603:10b6:208:38e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.28; Wed, 17 Jan
 2024 08:30:11 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:930:ce:cafe::6f) by CYXPR02CA0083.outlook.office365.com
 (2603:10b6:930:ce::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23 via Frontend
 Transport; Wed, 17 Jan 2024 08:30:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.83) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Wed, 17 Jan 2024 08:30:10 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 17 Jan
 2024 02:30:09 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 17 Jan
 2024 02:30:09 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 17 Jan 2024 02:30:07 -0600
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
X-Inumbo-ID: a3940b96-b512-11ee-98f2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hlmC72qkb2iuP/wg7osjV15YcRlXDupfcWE81hRjeNTzS9MyHZjgDfEXNYGqBGhOG/d0oa35SWeVvAn4UNkHrSfAHyoFWkv7fCNOP7v9Cb8NyGxgeqy/T6zqAStVMlImmd9a6nZKyl/tpn1L/T24dqWbYSmu2K05nopazz1Uixb/nGkhetUcqqTU6Ao3MQNAFzydgx+CYllIrcJWQXX3NW9e3O7kknmx6HBygtoO/EjlcIYx9cbrnfA5CkZo7+d8Eujg0VAHtU030x8QpnF5JaRJibwwsJt8IlNk/kD7ZX0rGjhAEM4EvmFxKgAezTrYnxgczRH7c39BtWS/jsCn+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zexvQ98nuwYij04/6SoRcy1xqGxy1CX19dR0GVD/N/Q=;
 b=drS8A1Xibqd3j+y4KqDdH5ewHptLmySzyThXXdsOCnjd52tShxI/nyMhCIGKWMYoiX3gT9TeKnvhOEotQAc2Xd8CxdDR7wX7gzRuxtq923+d/YPNfm3XmYgw1TT2qjlN7uCqHN7JlQlah3vqs9B8zt4jBP2x4xB6Qbs2FJ6EIWI8zXvsj4jRuiOTX/3f08kY9pHa5XOEia5of4tTF27GFG0z4sP4PtOYmSLWibGci3cvhDRfR5XC36DaaOnOAInZe0Iq6LbTNaYfw7FtIQydt4vZ8qHLvlOgHUs2uygkKqc6MXZ8/uCJvN9EA1T6vPthryRk+RnLoFERfeoRbmSJCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zexvQ98nuwYij04/6SoRcy1xqGxy1CX19dR0GVD/N/Q=;
 b=b8hI+GE5ECAZ4MLj+hg0o5bmj0Q4zEP81Cmfr1damy1sl1gYfvP86dNabMOb+7IZP3vTmYK77eGWKvlIMktwGehwYV6Q2m9KqNxESJYcV7Y2rKDPsHHwoImIh4zov/ZlmZsoY8fgdVZmEus4w/RJpkLnkcL7JUK/nj2n9VTjV7I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6b4bfccf-4455-40c0-b6bb-c5dd7c154ac3@amd.com>
Date: Wed, 17 Jan 2024 09:30:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 repost 1/4] arm/mmu: Move init_ttbr to a new section
 .data.idmap
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <carlo.nonato@minervasys.tech>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240116143709.86584-1-julien@xen.org>
 <20240116143709.86584-2-julien@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240116143709.86584-2-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|BL3PR12MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b2890b-3f76-4765-8e63-08dc17368523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O79bypX5OQcRG6CYk75XCbbKft4LkI67l30zdtM/NCtblnHiK7Rx2m2XY1/UKBPFjRaR/gzMlW71kfkrZw6Qy/FCiZf627uu4xtnj2agTeVUnto60FN3CabRXD3zPua62fNBi3czjBNTgNMmWe4fJ4MxOaG8XTtOYE4YxjzfsCzoYZQxEk3b9txUafi/R2T1o40adfYwpNNbfsPquvbeBpIi3vf2vN/2JlLKstuuvVy/Ly+CNKQfW0lYUKDg/GwIn5IKRBpG2d1MgkU6DpF54n61wDGpaCQ5nuTeVSp5jCmaDh43+cHsszleqVblmBH+0Rng2kGscYeIBLPYM1m3o8BJi+eus0yNMNmKupFLqvlqJSeHf2tVZcOy6oFj7MJe+k2nhD0P3037mxsjAD4j3nX70BSPYAXxfkJvbnDRaisGvmjaXLZ8m3rvVV03QQKwWjFc0FSCfEd+tJK7n71Y1OvMHyy2DgUpopZzd7G3Bo65EYbk+Pl85NoIB1FgNFxlpdTLFQR20WqzbU6tXfydpdviJrLGnjmjTd0haHSjIcLyFCBurHI3+6vIzWzDQ4jwyL9BOEe3k4qVJXTh2BiUaThXpkWlpO0rTCv2Uype73gN0k9ARl7U6qPwEbuX3LfgJPpXThqekxG/l3A//fGchMGhbrBv7ml+phgF90Ts/IeoLBXhndSP8l+h3Oc1NZwCedzzGBrKzweeucgbTc3T3jmQlPGHOq0HzqkNxKgyR4wGONkird0BJD+5X/sVfpEumYg+/bnBoi0XWTiMjYdBeYmx2PTUKPYSwgOBL8jXU14ymm15FkxZJV2uLZyydfpiUj0Jwo7FW4cJCnii/Ih2eA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(64100799003)(451199024)(82310400011)(1800799012)(186009)(36840700001)(46966006)(40470700004)(6666004)(83380400001)(426003)(36860700001)(82740400003)(47076005)(2906002)(41300700001)(31696002)(86362001)(36756003)(356005)(81166007)(53546011)(54906003)(70206006)(8936002)(70586007)(316002)(16576012)(478600001)(5660300002)(336012)(4326008)(2616005)(26005)(44832011)(8676002)(110136005)(40460700003)(31686004)(40480700001)(142923001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 08:30:10.8046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b2890b-3f76-4765-8e63-08dc17368523
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6619

Hi Julien,

On 16/01/2024 15:37, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> With the upcoming work to color Xen, the binary will not be anymore
> physically contiguous. This will be a problem during boot as the
> assembly code will need to work out where each piece of Xen reside.
> 
> An easy way to solve the issue is to have all code/data accessed
> by the secondary CPUs while the MMU is off within a single page.
> 
> Right now, init_ttbr is used by secondary CPUs to find there page-tables
> before the MMU is on. Yet it is currently in .data which is unlikely
> to be within the same page as the rest of the idmap.
> 
> Create a new section .data.idmap that will be used for variables
> accessed by the early boot code. The first one is init_ttbr.
> 
> The idmap is currently part of the text section and therefore will
> be mapped read-only executable. This means that we need to temporarily
> remap init_ttbr in order to update it.
> 
> Introduce a new function set_init_ttbr() for this purpose so the code
> is not duplicated between arm64 and arm32.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

with ...

> ---
>  xen/arch/arm/mmu/smpboot.c | 34 +++++++++++++++++++++++++++++-----
>  xen/arch/arm/xen.lds.S     |  1 +
>  2 files changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
> index b6fc0aae07f1..f1cf9252710c 100644
> --- a/xen/arch/arm/mmu/smpboot.c
> +++ b/xen/arch/arm/mmu/smpboot.c
> @@ -9,6 +9,10 @@
> 
>  #include <asm/setup.h>
> 
> +/* Override macros from asm/page.h to make them work with mfn_t */
> +#undef virt_to_mfn
> +#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> +
>  /*
>   * Static start-of-day pagetables that we use before the allocators
>   * are up. These are used by all CPUs during bringup before switching
> @@ -44,7 +48,7 @@ DEFINE_BOOT_PAGE_TABLE(boot_second);
>  DEFINE_BOOT_PAGE_TABLES(boot_third, XEN_NR_ENTRIES(2));
> 
>  /* Non-boot CPUs use this to find the correct pagetables. */
> -uint64_t init_ttbr;
> +uint64_t __section(".data.idmap") init_ttbr;
Do we need to keep the declaration in mmu/mm.h? This variable is only used in this file
and in assembly, so maybe better to drop declaration and use asmlinkage instead?

> 
>  /* Clear a translation table and clean & invalidate the cache */
>  static void clear_table(void *table)
> @@ -68,6 +72,27 @@ static void clear_boot_pagetables(void)
>      clear_table(boot_third);
>  }
> 
> +static void set_init_ttbr(lpae_t *root)
> +{
> +    /*
> +     * init_ttbr is part of the identity mapping which is read-only. So
> +     * We need to re-map the region so it can be updated
Would you mind fixing s/So We/So we/ and add a full stop after last sentence?

> +     */
> +    void *ptr = map_domain_page(virt_to_mfn(&init_ttbr));
> +
> +    ptr += PAGE_OFFSET(&init_ttbr);
> +
> +    *(uint64_t *)ptr = virt_to_maddr(root);
> +
> +    /*
> +     * init_ttbr will be accessed with the MMU off, so ensure the update
> +     * is visible by cleaning the cache.
> +     */
> +    clean_dcache(ptr);
> +
> +    unmap_domain_page(ptr);
> +}
> +
>  #ifdef CONFIG_ARM_64
>  int prepare_secondary_mm(int cpu)
>  {
> @@ -77,8 +102,8 @@ int prepare_secondary_mm(int cpu)
>       * Set init_ttbr for this CPU coming up. All CPUs share a single setof
>       * pagetables, but rewrite it each time for consistency with 32 bit.
>       */
> -    init_ttbr = virt_to_maddr(xen_pgtable);
> -    clean_dcache(init_ttbr);
> +    set_init_ttbr(xen_pgtable);
> +
>      return 0;
>  }
>  #else
> @@ -109,8 +134,7 @@ int prepare_secondary_mm(int cpu)
>      clear_boot_pagetables();
> 
>      /* Set init_ttbr for this CPU coming up */
> -    init_ttbr = __pa(first);
> -    clean_dcache(init_ttbr);
> +    set_init_ttbr(first);
> 
>      return 0;
>  }
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 20598c6963ce..470c8f22084f 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -36,6 +36,7 @@ SECTIONS
>         *(.text.header)
>         *(.text.idmap)
>         *(.rodata.idmap)
> +       *(.data.idmap)
>         _idmap_end = .;
> 
>         *(.text.cold)
> --
> 2.40.1
> 

~Michal

