Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DA589F07B
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 13:16:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703025.1098821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruVw3-0005JR-PO; Wed, 10 Apr 2024 11:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703025.1098821; Wed, 10 Apr 2024 11:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruVw3-0005Hk-Lc; Wed, 10 Apr 2024 11:16:11 +0000
Received: by outflank-mailman (input) for mailman id 703025;
 Wed, 10 Apr 2024 11:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23xn=LP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ruVw2-0005HV-2G
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 11:16:10 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba1ff2ea-f72b-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 13:16:07 +0200 (CEST)
Received: from SA9PR10CA0017.namprd10.prod.outlook.com (2603:10b6:806:a7::22)
 by PH7PR12MB6395.namprd12.prod.outlook.com (2603:10b6:510:1fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.54; Wed, 10 Apr
 2024 11:16:02 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:a7:cafe::87) by SA9PR10CA0017.outlook.office365.com
 (2603:10b6:806:a7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 11:16:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 11:16:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 06:16:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 06:16:01 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 10 Apr 2024 06:15:59 -0500
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
X-Inumbo-ID: ba1ff2ea-f72b-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obmBtnIt2af9tosTzjYRFqHExQsAk5rVOyiVK5WsHjrM/sjtzq7/LaZzW7TBUVGl9UsU8W8PgNfrcp4lEfWmgacCpERd5aIIO3I0MWvAfOWEIurbdpSzTc/SLse+Ok02d3EU34gUO5Es8cpDzy1OovI4O1LJBKN/9cJ3za6vlRu+qirncv5WHtaJNAJFLth1en/r9CidlLQFo+68E1z+9H4yUIF8dO1zxM8DAaAwQqty+IS+9Ang3ZP2XD/4trDQfOdN8vYvFPwh29AVLqtC+jA95P8CJPTbqTdbRKgt+QweoBW5lo4fFHCEOQg5R2D7eZlK7zYKFDSSOFwoCqxiOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pL9tmG2X2EpNkipyFusGJHfiKOtbhOR8CPqrm1NPHxg=;
 b=WZRXRisz12pS1GcqbfC5pVLT2iQBbPUQ+lBNXg8Eo1G5r6V7FHPSWCaVdJkOmzyG1k0UZaWu8nwjKU+kPNx1pJh86nFqpje7j8WIjDSAY73CGVttpbXx9Eeti/1V/jN2PDa9Xa77PTT54a84Y25xQ5Ve8i2hV9dr1Ff7PfmyY37+W0elhArcLZ6X46AabJE+opvBYuO7jNbJC0/ApBI746oIMPaaoCeixp0IOgHDrvI6otPDakbnQJQDpbWTDcxV6ckm2+nwLCBg2uJeT+ks0gMKE0YnOtj1RckHzOs/0/UuCrfjtyErx5Ogz96eojmO0ge7H6iGyXI8uI9Yg/fLnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pL9tmG2X2EpNkipyFusGJHfiKOtbhOR8CPqrm1NPHxg=;
 b=wpUyWlfe4W4T7HbPSgkNwKlhvghBxhpcQ8awNgbE+FNO+IQAI4ME787hkNIEiesMeFBs657hRa63Vhn+BWROZyzH8WLSMpEuvEECXRCIk+O0BAEpVbtA2Jof8HeXBZCaHniYuw+6qf74BLFGBYNDoWbb4fgJfPfZXpPqCiHefQY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <38281ab3-0680-44d3-8c81-14b09d52680b@amd.com>
Date: Wed, 10 Apr 2024 13:15:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/13] xen/arm: remove shm holes from extended regions
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-11-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240409114543.3332150-11-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|PH7PR12MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c283145-b14c-4c27-6e2c-08dc594f9b05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X1/GU4PRddSCSkm7obLoffmnwrHJ0YzebEUOwf8dZ37oAZTqMcdtpWdB/PaiDPX8hzSumHat9KeqFQOfBmOhNH5Bj70ylRQS2u97HXMAREsIBXye+2nufU1TzNZNBdApegeUogI3vfnTh2b8q2nsCHeMxJE/uYrkEHSxggTYZbFyfxTIB/+/xda2aHveTUXB6n/jMIk0r7QV8LFCTsMIAWnWVw8rqBb86UGz3dNMGdNq7cRYJRpmLlknpPYBMQkBqBlGVNRRgyrChAm+y9Z2Na8UWT047Ufx8E2RK52OT5HyvJkfn5teu1jdIg8HMNHPSlj41UpHrJfJUauCfVKqo2l5UyFTc0/G+BFBOF6BGvYJrKQr2O6DXwBJ9fhYjk08sryUqUmKRKiiO4OTD0wfCS+D7H2ctw0bzNDOldO4xw0Ul9407TU7cJ8SGbYHQZNe7mZ4PNnfOaoCWN3MCjyVij2KjUpqjm/Hd//CypupS1YOkGV/g68A5ql14B1T/IlJt0Y+vj0tJigpGtOlnk5yckWCs7o8WjZr7esygK9D6C0LB7VqhIiARCP6tDs0+1RkP/B8Sc9zxLoVeUaSfM+JaFy6RFtb8OOrpi1Pi0OvjyT5diRMLH2bsxkuUVfY3OWo+hO2MOwoFXCOMLDal9kp6coVVOQkmcgK8EicwaAEgutg3sMOJ0luMircWuhI+RUCkrH0ZOqPlHsBjYLxjGwpQoTjnCaz75WogHq8nrD8OQeEVrI7939CjopqQRRydkn8
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 11:16:01.7411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c283145-b14c-4c27-6e2c-08dc594f9b05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6395

Hi Luca,

On 09/04/2024 13:45, Luca Fancellu wrote:
> 
> 
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> Static shared memory acts as reserved memory in guest, so it shall be
> excluded from extended regions.
> 
> Extended regions are taken care of under three different scenarios:
> normal DomU, direct-map domain with iommu on, and direct-map domain
> with iommu off.
> 
> For normal DomU, we create a new function "remove_shm_holes_for_domU",
> to firstly transfer original outputs into the format of
> "struct rangeset", then use "remove_shm_from_rangeset" to remove static
> shm from them.
> 
> For direct-map domain with iommu on, after we get guest shm info from "kinfo",
> we use "remove_shm_from_rangeset" to remove static shm.
> 
> For direct-map domain with iommu off, as static shm has already been taken
> care of through reserved memory banks, we do nothing.
Stale info given that shmem is no longer part of reserved memory banks. It's been taken care
of by removing shmem regions in find_unallocated_memory()

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v2:
>  - Fixed commit title, fixed comment, moved call of remove_shm_from_rangeset
>    after populating rangeset in find_memory_holes, print error code when
>    possible
>  - used PFN_DOWN where needed
> v1:
>  - Rework of https://patchwork.kernel.org/project/xen-devel/patch/20231206090623.1932275-8-Penny.Zheng@arm.com/
> ---
> ---
>  xen/arch/arm/domain_build.c             | 16 ++++-
>  xen/arch/arm/include/asm/domain_build.h |  2 +
>  xen/arch/arm/include/asm/static-shmem.h | 18 +++++
>  xen/arch/arm/static-shmem.c             | 88 +++++++++++++++++++++++++
>  4 files changed, 121 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 01d66fbde92b..9b36d6bb70c9 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -817,8 +817,8 @@ int __init make_memory_node(const struct domain *d,
>      return res;
>  }
> 
> -static int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
> -                                  void *data)
> +int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
> +                           void *data)
>  {
>      struct membanks *ext_regions = data;
>      paddr_t start, size;
> @@ -978,6 +978,8 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
>   * - MMIO
>   * - Host RAM
>   * - PCI aperture
> + * - Static shared memory regions, which are described by special property
> + *   "xen,shared-mem"
>   */
>  static int __init find_memory_holes(const struct kernel_info *kinfo,
>                                      struct membanks *ext_regions)
> @@ -1005,6 +1007,11 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>          goto out;
>      }
> 
> +    /* Remove static shared memory regions */
> +    res = remove_shm_from_rangeset(kinfo, mem_holes);
> +    if ( res )
> +        goto out;
> +
>      /*
>       * Remove regions described by "reg" and "ranges" properties where
>       * the memory is addressable (MMIO, RAM, PCI BAR, etc).
> @@ -1097,7 +1104,10 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>          res = 0;
>      }
> 
> -    return res;
> +    if ( res )
> +        return res;
> +
> +    return remove_shm_holes_for_domU(kinfo, ext_regions);
>  }
> 
>  int __init make_hypervisor_node(struct domain *d,
> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
> index a6f276cc4263..026d975da28e 100644
> --- a/xen/arch/arm/include/asm/domain_build.h
> +++ b/xen/arch/arm/include/asm/domain_build.h
> @@ -51,6 +51,8 @@ static inline int prepare_acpi(struct domain *d, struct kernel_info *kinfo)
>  int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
>  #endif
> 
> +int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *data);
> +
>  #endif
> 
>  /*
> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
> index 90aafc81e740..2e8b138eb989 100644
> --- a/xen/arch/arm/include/asm/static-shmem.h
> +++ b/xen/arch/arm/include/asm/static-shmem.h
> @@ -28,6 +28,12 @@ void early_print_info_shmem(void);
> 
>  void init_sharedmem_pages(void);
> 
> +int remove_shm_from_rangeset(const struct kernel_info *kinfo,
> +                             struct rangeset *rangeset);
> +
> +int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
> +                              struct membanks *ext_regions);
> +
>  #else /* !CONFIG_STATIC_SHM */
> 
>  static inline int make_resv_memory_node(const struct kernel_info *kinfo,
> @@ -59,6 +65,18 @@ static inline void early_print_info_shmem(void) {};
> 
>  static inline void init_sharedmem_pages(void) {};
> 
> +static inline int remove_shm_from_rangeset(const struct kernel_info *kinfo,
> +                                           struct rangeset *rangeset)
> +{
> +    return 0;
> +}
> +
> +static inline int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
> +                                            struct membanks *ext_regions)
> +{
> +    return 0;
> +}
> +
>  #endif /* CONFIG_STATIC_SHM */
> 
>  #endif /* __ASM_STATIC_SHMEM_H_ */
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index fcf8227bf404..a08413ff44e2 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> 
>  #include <xen/libfdt/libfdt.h>
> +#include <xen/rangeset.h>
>  #include <xen/sched.h>
> 
>  #include <asm/domain_build.h>
> @@ -574,6 +575,93 @@ void __init init_sharedmem_pages(void)
>          init_staticmem_bank(&shmem->bank[bank]);
>  }
> 
> +int __init remove_shm_from_rangeset(const struct kernel_info *kinfo,
> +                                    struct rangeset *rangeset)
> +{
> +    const struct membanks *shm_mem = &kinfo->shm_mem.common;
> +    unsigned int i;
> +
> +    /* Remove static shared memory regions */
> +    for ( i = 0; i < shm_mem->nr_banks; i++ )
> +    {
> +        paddr_t start, end;
> +        int res;
> +
> +        start = shm_mem->bank[i].start;
> +        end = shm_mem->bank[i].start + shm_mem->bank[i].size - 1;
If you look at other rangeset_remove_range use cases and error messages, 1 is subtracted
in PFN_DOWN() so that the error message contains end unchanged. Please adhere to that so that
printed messages are consistent.

> +        res = rangeset_remove_range(rangeset, PFN_DOWN(start), PFN_DOWN(end));
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR
> +                   "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr", error: %d\n",
> +                   start, end, res);
> +            return -EINVAL;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +int __init remove_shm_holes_for_domU(const struct kernel_info *kinfo,
> +                                     struct membanks *ext_regions)
> +{
> +    const struct membanks *shm_mem = &kinfo->shm_mem.common;
> +    struct rangeset *guest_holes;
> +    unsigned int i;
> +    paddr_t start;
> +    paddr_t end;
> +    int res;
> +
> +    /* No static shared memory region. */
> +    if ( shm_mem->nr_banks == 0 )
> +        return 0;
> +
> +    dt_dprintk("Remove static shared memory holes from extended regions of DomU\n");
> +
> +    guest_holes = rangeset_new(NULL, NULL, 0);
> +    if ( !guest_holes )
> +        return -ENOMEM;
> +
> +    /* Copy extended regions sets into the rangeset */
> +    for ( i = 0; i < ext_regions->nr_banks; i++ )
> +    {
> +        start = ext_regions->bank[i].start;
> +        end = start + ext_regions->bank[i].size - 1;
> +
> +        res = rangeset_add_range(guest_holes, PFN_DOWN(start), PFN_DOWN(end));
same remark about the end

> +        if ( res )
> +        {
> +            printk(XENLOG_ERR
> +                   "Failed to add: %#"PRIpaddr"->%#"PRIpaddr", error: %d\n",
> +                   start, end, res);
> +            goto out;
> +        }
> +    }
> +
> +    /* Remove static shared memory regions */
> +    res = remove_shm_from_rangeset(kinfo, guest_holes);
> +    if ( res )
> +        goto out;
> +
Could you please add a comment explaining here what's done below?
> +    i = ext_regions->nr_banks - 1;
> +    start = ext_regions->bank[0].start;
> +    end = ext_regions->bank[i].start + ext_regions->bank[i].size - 1;
> +
> +    /* Reset original extended regions to hold new value */
> +    ext_regions->nr_banks = 0;
> +    res = rangeset_report_ranges(guest_holes, PFN_DOWN(start), PFN_DOWN(end),
> +                                 add_ext_regions, ext_regions);
> +    if ( res )
> +        ext_regions->nr_banks = 0;
> +    else if ( !ext_regions->nr_banks )
> +        res = -ENOENT;
> +
> + out:
> +    rangeset_destroy(guest_holes);
> +
> +    return res;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> --
> 2.34.1
> 

~Michal


