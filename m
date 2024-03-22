Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D1D886F76
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 16:09:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696931.1088170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rngWZ-00076V-0y; Fri, 22 Mar 2024 15:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696931.1088170; Fri, 22 Mar 2024 15:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rngWY-00073l-Ua; Fri, 22 Mar 2024 15:09:38 +0000
Received: by outflank-mailman (input) for mailman id 696931;
 Fri, 22 Mar 2024 15:09:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GlD6=K4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rngWX-00073f-2k
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 15:09:37 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2407::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3062944b-e85e-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 16:09:34 +0100 (CET)
Received: from PR0P264CA0090.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::30)
 by DM4PR12MB6160.namprd12.prod.outlook.com (2603:10b6:8:a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 15:09:30 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10a6:100:18:cafe::aa) by PR0P264CA0090.outlook.office365.com
 (2603:10a6:100:18::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Fri, 22 Mar 2024 15:09:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Fri, 22 Mar 2024 15:09:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 22 Mar
 2024 10:09:27 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 22 Mar 2024 10:09:26 -0500
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
X-Inumbo-ID: 3062944b-e85e-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ei/A0iEx4xr4Ua8XSlgmqO4vrkggFR/mu/qZWokazr+28TjyVsB65/20viKFskU3nIfiPZRa18d7mppJjWDqxKqxn4zLhU2ERszP3q54kPdysDQFzOL0UI73cnmgcB3HD/1rX/ECMXbRBlnUUidpNVN58KiQ5ec5S/uRogD99kswSbsFCwNHg6Qzs4UdgwQnmwFtm3jXUY3U4VR40DGR4R3R3q8E8HAz6srtovsOlcDppdt0GIUkbrvHkQnARCGO7BZsldFqRbWc4vGfmhms5bBzJpjS0jgvgnbTmYr/d6AMqXpgK7NmKF4hGhmLggxAfgHnYmyxLpEWzWCXdxItRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lan5XMue9Z2MeH7IagdyYeJt/D0KfB5exFiH/6YnwcM=;
 b=ELzGvTfwBK2N7reUQ+QBqmt6ZeKo4GcVB1pYcWNWYE0/BfPcKOD3VHdMyHGXSRCNVEWBk47lFerCk3dheyarLK0pcBD50zAw7d3YWSu+WZcC2ZDaHUXEzSlUaV1ofEvmlWtt16ijTZdhF6BttuCWqkAcLuopNqy+xTdKenNltWoEV4Vx3DucmiG9az+C3g2e3CTqlOhK++VCtbr3sRNQggAeDr+bUGEoOzo+NkPG8lnV9CzN2tink64pUeEvGUMFzK7DkJNAmr9jO8o+HZy7CzYBKxtZvNgkOXHvFBYgUF0ujHges5MzxU4hfMPiLXxG5ZOv2/8UV6TBhq9VL3lvqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lan5XMue9Z2MeH7IagdyYeJt/D0KfB5exFiH/6YnwcM=;
 b=2PInbwcq0BHClIT4p0S3peZQ10KRpIAs9JrqvuTE2WupvSwjfooOh3TsAM3mmQ6+VKoW3Tr+REaOslQItEnTfagDUIf/1oMvLEdBsyStzLbKoIH1VpJTYPo5Zdxz0kR3UA/b2XrM5rAgDVYvZCyU4Np2OItbuumPVSD673/evKw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9edf6716-77d9-445a-8f65-0914ffb97e3f@amd.com>
Date: Fri, 22 Mar 2024 16:09:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] xen/arm: remove shm holes for extended regions
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-10-luca.fancellu@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240312130331.78418-10-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|DM4PR12MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: 20399999-8153-4a68-93de-08dc4a821257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AF+sLU1pfo2KWnq7HbcBhk8jj3yrbWOqjpuRtasDoA47NbNbx9aKv0fZihAIdmW4K9wK8zwUOIgSvtO3Q0qrW/jhiJLXG7YoVz1mV12q/sr/xlDqJW5aow1zR+JB0Ulut/n/a+wVBSTGIAMCvcbDDMsCdtvAD4LVpcoVH56AIktqhhOGD1pYOIw4BlD0G5pdoZz3CuX+sJfEOzZ+D54CveEaiiJeimLU1NhZXdTRSWk8ex9ZiQRsEDpPM/CFfAN5WWuvj1ClcMm+0WnL5VC5kDPWTqq63Vgt6BHSrt9G3+jnLgBx5XEcRqHk/tfNDg2KEvtxD7DAF5RVg0NX/Z9w1RQVUTjz2eJ512uuEiFFuARsLAd14KUODpMIAGe2pP0yaBxUTegW86U9+bF9F6PqfUrDqKXNvH5CDxgSwLDBEInm4tsJ0EyF4qPdYVHVqdmpxZ6CfctJTNllVO7gqiO7sKhqpcX5d/Wublf9Yq7+7FTb5Fotl0phyUzsS75fu28wgCkQcBfFMz5GlHTOIJefxnQo/j1bg3FV0bJfilB4exEeKx6VVEpVrSeMw9eByoyFSPsY/CRP5o3Fytb/TfRbfxL3X2BL+hMoDKsrwCtEaEt9VA8Dat1NSoT9JaQWamfOzKoVA+U+8Rbzgec1o4Tv3RD9j9CTn1MVwH9dwkaE4eakwkGQo+4gkWrefMKfJhMWNSP2Ovd2AJ2uf2deN9uLDw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 15:09:29.1357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20399999-8153-4a68-93de-08dc4a821257
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6160

Hi Luca,

NIT: title s/for/from?

On 12/03/2024 14:03, Luca Fancellu wrote:
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
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v1:
>  - Rework of https://patchwork.kernel.org/project/xen-devel/patch/20231206090623.1932275-8-Penny.Zheng@arm.com/
> ---
>  xen/arch/arm/domain_build.c             | 16 ++++-
>  xen/arch/arm/include/asm/domain_build.h |  2 +
>  xen/arch/arm/include/asm/static-shmem.h | 18 ++++++
>  xen/arch/arm/static-shmem.c             | 86 +++++++++++++++++++++++++
>  4 files changed, 119 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9fad9e8b2c40..740c483ea2db 100644
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
> @@ -969,6 +969,8 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
>   * - MMIO
>   * - Host RAM
>   * - PCI aperture
> + * - Static shared memory regions, which are described by special property
> + *   "xen,domain-shared-memory-v1"
I'm not sure if providing a compatible here makes sense. If at all, I would put "xen,shared-mem" which holds the addresses.

>   */
>  static int __init find_memory_holes(const struct kernel_info *kinfo,
>                                      struct membanks *ext_regions)
> @@ -985,6 +987,11 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>      if ( !mem_holes )
>          return -ENOMEM;
> 
> +    /* Remove static shared memory regions */
> +    res = remove_shm_from_rangeset(kinfo, mem_holes);
> +    if ( res )
> +        goto out;
How can you remove from a rangeset without first adding to it?
This should be moved after rangeset_add_range().
Also, usually (and this is the case in this function) we pass frames
to rangeset and not addresses (argument is of type ul). However...

> +
>      /* Start with maximum possible addressable physical memory range */
>      start = 0;
>      end = (1ULL << p2m_ipa_bits) - 1;
> @@ -1089,7 +1096,10 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
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
> index c6fac9906656..2f70aed53ac7 100644
> --- a/xen/arch/arm/include/asm/static-shmem.h
> +++ b/xen/arch/arm/include/asm/static-shmem.h
> @@ -29,6 +29,12 @@ void early_print_info_shmem(void);
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
>  static inline int make_resv_memory_node(const struct domain *d,
> @@ -61,6 +67,18 @@ static inline void early_print_info_shmem(void) {};
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
> index 6143f52cb991..b3e2105dd3f2 100644
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
> @@ -564,6 +565,91 @@ void __init init_sharedmem_pages(void)
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
... here, these hold physical addresses and...

> +        int res;
> +
> +        start = shm_mem->bank[i].start;
> +        end = shm_mem->bank[i].start + shm_mem->bank[i].size - 1;
> +        res = rangeset_remove_range(rangeset, start, end);
you will end up in a mix which won't work. Switch to PFN_DOWN()

> +        if ( res )
What's the point of res variable if it is not printed below?

> +        {
> +            printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
> +                   start, end);
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
> +    dt_dprintk("Remove static shared memory holes for extended regions of DomU\n");
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
> +        res = rangeset_add_range(guest_holes, start, end);
Ditto, PFN_DOWN().

~Michal

