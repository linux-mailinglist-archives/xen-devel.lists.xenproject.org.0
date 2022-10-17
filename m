Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6EB600742
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 09:07:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424128.671334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okKCm-0000k4-9Z; Mon, 17 Oct 2022 07:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424128.671334; Mon, 17 Oct 2022 07:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okKCm-0000hF-5k; Mon, 17 Oct 2022 07:06:32 +0000
Received: by outflank-mailman (input) for mailman id 424128;
 Mon, 17 Oct 2022 07:06:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rj3b=2S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1okKCk-0000h7-OY
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 07:06:31 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 379042ed-4dea-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 09:06:28 +0200 (CEST)
Received: from DS7PR06CA0025.namprd06.prod.outlook.com (2603:10b6:8:54::31) by
 BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.30; Mon, 17 Oct 2022 07:06:24 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::24) by DS7PR06CA0025.outlook.office365.com
 (2603:10b6:8:54::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Mon, 17 Oct 2022 07:06:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 07:06:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 02:06:23 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 17 Oct 2022 02:06:21 -0500
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
X-Inumbo-ID: 379042ed-4dea-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5M6on/F5SLfWXjDOV0S84R9UK+GM2ZP1Bk5QeKkGKOXOgfsrkCYHm5/AM0DvmTDgqHXSf0aWO74xug/oet9yrI5oS5u9sznL+19GqYimEZ9IxqNZK6Eb9hpzyQQ49AWxZCD6fuI39vUo06/wzYwLyzBeV1Ic0jdNULA4l3M2YhQ0rigevnFuN0k2GbS8bG6579/rsu6/GXhw3m5ItWKdQvVnSlBVd4zkoZjsPjiUhUMIY3bx2Kb2q1DNqq9EHPY5vGRm2l2Zc5glhv77DIe8NKRIkZ/KNUqj3NNEgbSjui2yzJM+1gJaRfjSmOehtws+Oja2U9yaDqS1pAwkusQnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7r0qS7YFuLWxFPw7XXPeYNjzI0Fwv5ULVPgOadXXCYs=;
 b=MXdtxkprpy7A7mmooQcuq/z3IkBYIZ41S0gNX/OU7fo/rNpojZ9VvQJzPfjaZpR+ZJRple+VwmheY8yX+yu5HenxyJs8upWMYfS4yqa/HkGkcNmdKknFDkK7iHPHwrch7Pv21M9C6GlIjVtfdjKAp7YPcGW+s7KvEJX2nEOgb7k1urkcbZYuSvFueFx2cS1ImfVJhJUGh3xhUqYU7ffZ+25Nqdw7j8uUzWlRAJq4spL6JYSayH9VQ+ELOpX9M+238JXFhfHsagMfouSt/+gRNFC1iiFw9EkiaJqYnRCVslHrG4p2KHlnhnHeTmJza9lA053j4o3+6pAnppkUDuxuVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7r0qS7YFuLWxFPw7XXPeYNjzI0Fwv5ULVPgOadXXCYs=;
 b=RocuIhQHk2XQyFfz5KcR+/HVkNf3gInlF0tjbqVoszt+Vlfk4DCiR2rJVIu4z5N8zRUFcDz/7aPJK1hRj7Jeo+cq12iCQLSnlgHAHPlSqw0CzkcMrc2uiJMHVkC33M2+LIdUrDvktpa83WOOCxctTrptFXJ0EOfxuyxDpIH77bg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ff6a5e85-0867-2e22-e173-15805bfc7843@amd.com>
Date: Mon, 17 Oct 2022 09:06:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 06/12] xen/common: add cache coloring allocator for
 domains
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>,
	<jbeulich@suse.com>, <julien@xen.org>, <stefano.stabellini@amd.com>,
	<wl@xen.org>, <marco.solieri@unimore.it>, <andrea.bastoni@minervasys.tech>,
	<lucmiccio@gmail.com>, Marco Solieri <marco.solieri@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-7-carlo.nonato@minervasys.tech>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20220826125111.152261-7-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|BL1PR12MB5286:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fcdbca6-4540-4c6e-3d20-08dab00e1a53
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zewh0yR3UGnUNEPng4/qzjd6hGfPI4cxJ3TcSBKqDtYZg5/8cGeagwmucNhd/imkA/JoYMqm2q2IFLcYWfgVmd3daBOLG3FMRisfA5d7AOANXBpxPMgumDdMfa6QXj7OKvouwkZ8iocBJwWSVLfyq5p2bVl10hH698kB3lUHrGCnKAgSL/xHmNzqbBVFLaFNVZJV0lRjzP92PeRLjy/dhT++BsiNPfQ1ge4GOLpdnu/sTjCmc3cRyAl+5TTQ++b5tMamEuMwOK1P+O4OyHCHoY3EnCMtxo97OagC9dbE/ZelGMD3umIHpoFtr7AAx3s2UJMEjxInt9Ia4k1FxECfBz0wLXjgIyZP5jDrwCM4OUlVGGAME6BIaPGJfZGC+RXYiNVrDn2/qBnS3LrhuDXl7ljNc9Uu/A3/H/fz9XYLU2aOcZeVccGa4DJyJwibxKA7Fw5XAzEPW3wmSbXRMwpVRxdRWYfY8v2F0LlNHVcnnoUWYKE3DwefcfnVzcUSFE1eBpaoGSvJzV+SnwE1TPjLVoc9KsbdPV7IBZYGViaFgIlp9Mvl/vEF3lYlTVzo15Bq4foW2bG9H5FqD/B4wthaP+Ma/yGIYcwySssGfXnyABE+YDx2CrzLvX/4XprJrYbDSUksuG9ZggwasGF+hJn49lNHsTYR3Thb6YojcLI+syXjrXMRsjC9QMZYKExybNJU4PAnCWCx0ENlMH5aaloDPEnm+ptkwUDKNpU+FXL0AjYVSKNBZzmlBbCuG65tSe1DGRxSE/0F+zWckB1Tu0YpUNDhj1CmPo1zDmGmA7aZTjRKaLFyy7FbtOk4+YFjAqyCotITsAdYBRdurkuu7L6ZaQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(36840700001)(40470700004)(46966006)(31686004)(478600001)(81166007)(356005)(82740400003)(82310400005)(2616005)(186003)(316002)(16576012)(8676002)(4326008)(54906003)(110136005)(70206006)(70586007)(40460700003)(5660300002)(36756003)(26005)(53546011)(36860700001)(41300700001)(8936002)(7416002)(30864003)(426003)(86362001)(40480700001)(44832011)(2906002)(31696002)(47076005)(83380400001)(336012)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 07:06:24.3415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fcdbca6-4540-4c6e-3d20-08dab00e1a53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5286

Hi Carlo,

On 26/08/2022 14:51, Carlo Nonato wrote:

> 
> This commit adds a new memory page allocator that implements the cache
> coloring mechanism. The allocation algorithm follows the given color
> configuration of the domain and maximizes contiguity in the page selection.
> 
> Pages are stored in a color-indexed data structure of lists, sorted by their
> machine addresses, that are collectively called the colored heap. A simple
> initialization function computes the color of any available page and inserts
> it in the corresponding list. When a domain requests a page, the allocator
> takes one from the subset of lists whose colors equals the domain
> configuration. It chooses the page with the highest machine address such that
> contiguous pages are sequentially allocated, if this is made possible by a
> color assignment which includes adjacent colors.
> 
> The allocator can handle only requests with order equals to 0 since the
> single color granularity is represented in memory by one page.
> 
> The buddy allocator must coexist with the colored one because the Xen heap
> isn't colored. For this reason a new Kconfig option and a command line
> parameter are added to let the user set the amount of memory reserved for
> the buddy allocator. Even when cache coloring is enabled, this memory isn't
> managed by the colored allocator.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>  docs/misc/arm/cache-coloring.rst    |  43 +++++-
>  docs/misc/xen-command-line.pandoc   |  14 ++
>  xen/arch/arm/Kconfig                |  12 ++
>  xen/arch/arm/coloring.c             |  10 ++
>  xen/arch/arm/include/asm/coloring.h |   6 +
>  xen/arch/arm/include/asm/mm.h       |   3 +
>  xen/common/page_alloc.c             | 213 ++++++++++++++++++++++++++--
>  7 files changed, 290 insertions(+), 11 deletions(-)
> 
> diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
> index 763acd2d3f..5f9132e525 100644
> --- a/docs/misc/arm/cache-coloring.rst
> +++ b/docs/misc/arm/cache-coloring.rst
> @@ -13,6 +13,9 @@ In order to enable and use it, few steps are needed.
>    (refer to menuconfig help for value meaning and when it should be changed).
> 
>          CONFIG_MAX_CACHE_COLORS=<n>
> +- If needed, change the amount of memory reserved for the buddy allocator either
> +  from the Xen configuration file, via the CONFIG_BUDDY_ALLOCATOR_SIZE value,
> +  or with the command line option. See `Colored allocator and buddy allocator`.
>  - Assign colors to domains using the `Color selection format`_ (see
>    `Coloring parameters`_ for more documentation pointers).
> 
> @@ -157,4 +160,42 @@ Please refer to the relative documentation in
>  "docs/misc/arm/device-tree/booting.txt".
> 
>  Note that if no color configuration is provided for domains, they fallback to
> -the default one, which corresponds simply to all available colors.
> \ No newline at end of file
> +the default one, which corresponds simply to all available colors.
> +
> +Colored allocator and buddy allocator
> +*************************************
> +
> +The colored allocator distributes pages based on color configurations of
> +domains so that each domains only gets pages of its own colors.
> +The colored allocator is meant as an alternative to the buddy allocator because
> +its allocation policy is by definition incompatible with the generic one. Since
> +the Xen heap systems is not colored yet, we need to support the coexistence of
> +the two allocators and some memory must be left for the buddy one.
> +The buddy allocator memory can be reserved from the Xen configuration file or
> +with the help of a command-line option.
> +
> +Known issues and limitations
> +****************************
> +
> +Colored allocator can only make use of order-0 pages
> +####################################################
> +
> +The cache coloring technique relies on memory mappings and on the smallest
> +amount of memory that can be mapped to achieve the maximum number of colors
> +(cache partitions) possible. This amount is what is normally called a page and,
> +in Xen terminology, the order-0 page is the smallest one. The fairly simple
> +colored allocator currently implemented, makes use only of such pages.
> +It must be said that a more complex one could, in theory, adopt higher order
> +pages if the colors selection contained adjacent colors. Two subsequent colors,
> +for example, can be represented by a order-1 page, four colors correspond to
> +a order-2 pages, etc.
> +
> +Fail to boot colored DomUs with large memory size
> +#################################################
> +
> +If the Linux kernel used for Dom0 does not contain the upstream commit
> +3941552aec1e04d63999988a057ae09a1c56ebeb and uses the hypercall buffer device,
> +colored DomUs with memory size larger then 127 MB cannot be created. This is
> +caused by the default limit of this buffer of 64 pages. The solution is to
> +manually apply the above patch, or to check if there is an updated version of
> +the kernel in use for Dom0 that contains this change.
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 910ebeb2eb..4e85c4dfe4 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -299,6 +299,20 @@ can be maintained with the pv-shim mechanism.
>      cause Xen not to use Indirect Branch Tracking even when support is
>      available in hardware.
> 
> +### buddy-alloc-size (arm64)
> +> `= <size>`
> +
> +> Default: `64M`
> +
> +Amount of memory reserved for the buddy allocator when colored allocator is
> +active. This options is parsed only when cache coloring support is enabled.
> +The colored allocator is meant as an alternative to the buddy allocator,
> +because its allocation policy is by definition incompatible with the
> +generic one. Since the Xen heap systems is not colored yet, we need to
> +support the coexistence of the two allocators for now. This parameter, which is
> +optional and for expert only, it's used to set the amount of memory reserved to
> +the buddy allocator.
> +
>  ### clocksource (x86)
>  > `= pit | hpet | acpi | tsc`
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 8acff9682c..abce4bfc25 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -147,6 +147,18 @@ config MAX_CACHE_COLORS
>           colors at boot. Note that if, at any time, a color configuration with more
>           colors than the maximum will be employed an error will be produced.
> 
> +config BUDDY_ALLOCATOR_SIZE
> +       string "Buddy allocator reserved memory size" if CACHE_COLORING
> +       default "64M" if CACHE_COLORING
> +       default "0M" if !CACHE_COLORING
> +       help
> +         Amount of memory reserved for the buddy allocator to work alongside
> +         the colored one. The colored allocator is meant as an alternative to the
> +         buddy allocator because its allocation policy is by definition
> +         incompatible with the generic one. Since the Xen heap systems is not
> +         colored yet, we need to support the coexistence of the two allocators and
> +         some memory must be left for the buddy one.
> +
>  config TEE
>         bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
>         default n
> diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
> index 87e20b952e..3fb86043d1 100644
> --- a/xen/arch/arm/coloring.c
> +++ b/xen/arch/arm/coloring.c
> @@ -300,6 +300,16 @@ void prepare_color_domain_config(struct xen_arch_domainconfig *config,
>      config->num_colors = (uint16_t)num;
>  }
> 
> +unsigned int page_to_color(struct page_info *pg)
> +{
> +    return addr_to_color(page_to_maddr(pg));
> +}
> +
> +unsigned int get_max_colors(void)
> +{
> +    return max_colors;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
> index b7fa323870..0982bc9853 100644
> --- a/xen/arch/arm/include/asm/coloring.h
> +++ b/xen/arch/arm/include/asm/coloring.h
> @@ -29,6 +29,8 @@
> 
>  #include <public/arch-arm.h>
> 
> +struct page_info;
> +
>  bool __init coloring_init(void);
> 
>  int domain_coloring_init(struct domain *d,
> @@ -39,4 +41,8 @@ void domain_dump_coloring_info(struct domain *d);
>  void prepare_color_domain_config(struct xen_arch_domainconfig *config,
>                                   const char *colors_str);
> 
> +unsigned int page_to_color(struct page_info *pg);
> +
> +unsigned int get_max_colors(void);
> +
>  #endif /* !__ASM_ARM_COLORING_H__ */
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index da25251cda..a59fc3791a 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -143,6 +143,9 @@ struct page_info
>  #define PGC_count_width   PG_shift(10)
>  #define PGC_count_mask    ((1UL<<PGC_count_width)-1)
> 
> +#define _PGC_colored      PG_shift(11)
> +#define PGC_colored       PG_mask(1, 11)
> +
>  /*
>   * Page needs to be scrubbed. Since this bit can only be set on a page that is
>   * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index bfd4150be7..4ae3cfe9a7 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -150,6 +150,9 @@
>  #define p2m_pod_offline_or_broken_hit(pg) 0
>  #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
>  #endif
> +#ifdef CONFIG_CACHE_COLORING
> +#include <asm/coloring.h>
> +#endif
> 
>  #ifndef PGC_static
>  #define PGC_static 0
> @@ -231,6 +234,9 @@ static bool __read_mostly scrub_debug;
>  #define scrub_debug    false
>  #endif
> 
> +/* Memory required for buddy allocator to work with colored one */
> +static unsigned long __initdata buddy_alloc_size;
> +
>  /*
>   * Bit width of the DMA heap -- used to override NUMA-node-first.
>   * allocation strategy, which can otherwise exhaust low memory.
> @@ -440,7 +446,172 @@ mfn_t __init alloc_boot_pages(unsigned long nr_pfns, unsigned long pfn_align)
>      BUG();
>  }
> 
> +static DEFINE_SPINLOCK(heap_lock);
> 
> +/* Initialise fields which have other uses for free pages. */
> +static void init_free_page_fields(struct page_info *pg)
> +{
> +    pg->u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
> +    page_set_owner(pg, NULL);
> +}
> +
> +static bool is_page_colored(struct page_info *pg)
> +{
> +    return pg->count_info & PGC_colored;
> +}
> +
> +#ifdef CONFIG_CACHE_COLORING
> +/*************************
> + * COLORED SIDE-ALLOCATOR
> + *
> + * Pages are stored by their color in separate lists. Each list defines a color
> + * and it is initialized during end_boot_allocator, where each page's color
> + * is calculated and the page itself is put in the correct list.
> + * After initialization there will be N lists where N is the number of maximum
> + * available colors on the platform.
> + */
> +typedef struct page_list_head colored_pages_t;
> +static colored_pages_t __ro_after_init *color_heap;
> +
> +#define colored_pages(color) &color_heap[(color)]
> +
> +static void color_heap_insert_page(struct page_info *pg)
> +{
> +    struct page_info *pos;
> +    struct page_list_head *head = colored_pages(page_to_color(pg));
> +
> +    pg->count_info |= PGC_colored;
> +
> +    /* Insert page in list in ascending machine address order */
> +    page_list_for_each( pos, head )
> +    {
> +        if ( page_to_maddr(pos) < page_to_maddr(pg) )
> +        {
> +            head = &pos->list;
> +            break;
> +        }
> +    }
> +
> +    page_list_add_tail(pg, head);
> +}
> +
> +static void color_heap_remove_page(struct page_info *pg)
> +{
> +    page_list_del(pg, colored_pages(page_to_color(pg)));
> +}
> +
> +static void __init init_col_heap_pages(struct page_info *pg,
> +                                       unsigned long nr_pages)
> +{
> +    unsigned int i;
> +
> +    if ( !color_heap )
> +    {
> +        unsigned int max_colors = get_max_colors();
> +        color_heap = xmalloc_array(colored_pages_t, max_colors);
> +        BUG_ON(!color_heap);
> +
> +        for ( i = 0; i < max_colors; i++ )
> +            INIT_PAGE_LIST_HEAD(colored_pages(i));
> +
> +        if ( !buddy_alloc_size )
> +            buddy_alloc_size = parse_size_and_unit(CONFIG_BUDDY_ALLOCATOR_SIZE,
> +                                                   NULL);
> +    }
> +
> +    printk(XENLOG_INFO "Init color heap with %lu pages\n", nr_pages);
> +    printk(XENLOG_INFO "Paging starting from: 0x%"PRIx64"\n",
> +           page_to_maddr(pg));
> +
> +    for ( i = 0; i < nr_pages; i++ )
> +        color_heap_insert_page(pg++);
> +}
> +
> +/* Alloc one page based on domain color configuration */
> +static struct page_info *alloc_col_heap_page(unsigned int memflags,
> +                                             const unsigned int *colors,
> +                                             unsigned int num_colors)
> +{
> +    struct page_info *pg = NULL;
> +    unsigned int i;
> +    bool need_tlbflush = false;
> +    uint32_t tlbflush_timestamp = 0;
> +
> +    spin_lock(&heap_lock);
> +
> +    for ( i = 0; i < num_colors; i++ )
> +    {
> +        struct page_info *tmp;
> +
> +        if ( page_list_empty(colored_pages(colors[i])) )
> +            continue;
> +
> +        tmp = page_list_first(colored_pages(colors[i]));
> +        if ( !pg || page_to_maddr(tmp) > page_to_maddr(pg) )
> +            pg = tmp;
> +    }
> +
> +    if ( !pg )
> +    {
> +        spin_unlock(&heap_lock);
> +        return NULL;
> +    }
> +
> +    pg->count_info = PGC_state_inuse;
> +
> +    if ( !(memflags & MEMF_no_tlbflush) )
> +        accumulate_tlbflush(&need_tlbflush, pg, &tlbflush_timestamp);
> +
> +    init_free_page_fields(pg);
> +    flush_page_to_ram(mfn_x(page_to_mfn(pg)),
> +                      !(memflags & MEMF_no_icache_flush));
> +    color_heap_remove_page(pg);
> +
> +    spin_unlock(&heap_lock);
> +
> +    if ( need_tlbflush )
> +        filtered_flush_tlb_mask(tlbflush_timestamp);
> +
> +    return pg;
> +}
> +
> +static void free_col_domheap_page(struct page_info *pg)
> +{
> +    pg->count_info = PGC_state_free;
> +    page_set_owner(pg, NULL);
> +    color_heap_insert_page(pg);
> +}
> +
> +static struct page_info *alloc_col_domheap_page(struct domain *d,
> +                                                unsigned int memflags)
> +{
> +    struct page_info *pg;
> +
> +    ASSERT(!in_irq());
> +
> +    pg = alloc_col_heap_page(memflags, d->arch.colors, d->arch.num_colors);
> +    if ( !pg )
> +    {
> +        printk(XENLOG_ERR "Colored page is null for domain %pd\n", d);
> +        return NULL;
> +    }
> +
> +    if ( d && !(memflags & MEMF_no_owner) && assign_page(pg, 0, d, memflags) )
> +    {
> +        free_col_domheap_page(pg);
> +        return NULL;
> +    }
> +
> +    return pg;
> +}
> +
> +size_param("buddy-alloc-size", buddy_alloc_size);
> +#else
> +static void free_col_domheap_page(struct page_info *pg)
> +{
> +    return;
> +}
> +#endif /* CONFIG_CACHE_COLORING */
> 
>  /*************************
>   * BINARY BUDDY ALLOCATOR
> @@ -462,7 +633,6 @@ static unsigned long node_need_scrub[MAX_NUMNODES];
>  static unsigned long *avail[MAX_NUMNODES];
>  static long total_avail_pages;
> 
> -static DEFINE_SPINLOCK(heap_lock);
>  static long outstanding_claims; /* total outstanding claims by all domains */
> 
>  unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
> @@ -1027,10 +1197,7 @@ static struct page_info *alloc_heap_pages(
>              accumulate_tlbflush(&need_tlbflush, &pg[i],
>                                  &tlbflush_timestamp);
> 
> -        /* Initialise fields which have other uses for free pages. */
> -        pg[i].u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
> -        page_set_owner(&pg[i], NULL);
> -
> +        init_free_page_fields(&pg[i]);
>      }
> 
>      spin_unlock(&heap_lock);
> @@ -1926,6 +2093,7 @@ static unsigned long avail_heap_pages(
>  void __init end_boot_allocator(void)
>  {
>      unsigned int i;
> +    unsigned long buddy_pages = PFN_DOWN(buddy_alloc_size);
> 
>      /* Pages that are free now go to the domain sub-allocator. */
>      for ( i = 0; i < nr_bootmem_regions; i++ )
> @@ -1939,11 +2107,24 @@ void __init end_boot_allocator(void)
>              break;
>          }
>      }
> -    for ( i = nr_bootmem_regions; i-- > 0; )
> +
> +    for ( i = 0; i < nr_bootmem_regions; i++ )
>      {
>          struct bootmem_region *r = &bootmem_region_list[i];
> +
> +        if ( buddy_pages && (r->s < r->e) )
> +        {
> +            unsigned long pages = MIN(r->e - r->s, buddy_pages);
> +            init_heap_pages(mfn_to_page(_mfn(r->s)), pages);

When cache coloring is enabled we have 2 allocators: colored and buddy.
The amount of memory for buddy allocator comes from the config (64MB by default).
So what about the first block of code at the beginning of end_boot_allocator
that calls init_heap_pages for the first free boot memory region?
There are two issues:
1. Buddy will end up having the buddy_pages + pages from the first free bootmem region.
   This is already incorrect as buddy should have the amount of memory set by the user.
2. Allowing the first free memory bank to go to buddy without imposing any restrictions
   on the size, can significantly lower the amount of memory available to colored allocator.
   If we load the images near the end of memory bank, the first free region can actually
   occupy most of the system memory and lead to issues with not enough colored memory for domains allocations.

I cannot see a reason for you to use that block of code. Before your series there was a split
to prefer allocations from higher memory with the exception of inserting one region residing on
the boot CPU node first (4280d3ee4cb1). Because your series modifies this behavior to prefer allocations
from lower memory in ascending order (and also allowing user to set a buddy size) I think this block
of code should not be executed when cache coloring is enabled.


Apart from that, the memory coming from the buddy is of any color. Shouldn't it be that the memory
allocated for domains comes from colored memory of the colors assigned to them and anything else
should come from colors given to Xen? At the moment, the memory for e.g. allocating P2M tables comes
from the buddy which means it can be of any color and might cause some cache interference.


~Michal

