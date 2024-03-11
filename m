Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A78B0877C51
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:12:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691335.1077214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbgd-0001Pe-TX; Mon, 11 Mar 2024 09:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691335.1077214; Mon, 11 Mar 2024 09:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbgd-0001Nv-MR; Mon, 11 Mar 2024 09:11:11 +0000
Received: by outflank-mailman (input) for mailman id 691335;
 Mon, 11 Mar 2024 09:11:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ICL+=KR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rjbgb-0001Np-Pj
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:11:10 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a3abd23-df87-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 10:11:06 +0100 (CET)
Received: from DS7PR03CA0026.namprd03.prod.outlook.com (2603:10b6:5:3b8::31)
 by PH8PR12MB8606.namprd12.prod.outlook.com (2603:10b6:510:1ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 09:11:01 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:5:3b8:cafe::77) by DS7PR03CA0026.outlook.office365.com
 (2603:10b6:5:3b8::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35 via Frontend
 Transport; Mon, 11 Mar 2024 09:11:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Mon, 11 Mar 2024 09:11:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Mar
 2024 04:10:59 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 11 Mar 2024 04:10:57 -0500
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
X-Inumbo-ID: 4a3abd23-df87-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOoBJ1abOBTHg8Ftshmo6/+6gbJk0DQWc7wFpEl0yU+e8PlNUnPBa/ePEtpVk0RDbE6X/jln2NHhEtwT+H7mzaNknkxR2MnJzGJrIpDY1dnzjPZ8AmS/Orgcf0HMerbog/7ELG2pSTomx5RVS1Tag0myd3UE+jvSddLC7OhOCiX3eDQGDvtsE0pA1V54tuFBUTl/K+X4OIQ2kbEGdQpdC6JZutHkkCszVy+Pt1B9gogUuSTbBN5JSBx1w5G+JvIzlABRnQVbZz+sJxVnlDnQEpOqk/ZfA1MZKdJ4LvLJoPSu8da/fmWn2KhPUPlBd19o7/wxGCyG9uvwu3kKZUIaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYT6tYCtp9BiW0YOTbTimG9Dk+e985YPJ1amZ/gULAc=;
 b=AbsT9jd9Z02f82vJm0UrV1rFYtLsyNHbPgG3beHfJEdoJZeRFcT6mdtceX4bo2WMiYPFz3db+zOThM3oocxny2R3HrkAKgqv9E3n4peIIplgMrYeH20qN2qL7AZijJ9j9cwD6xGp1J7Uy7jLu8JpoRIV6S+hpauWYGZc53IVpj560uZjiMsOAGiX7qkQ8TZvfHdienkZS0WHLcdoV9a8UbzpFlAnMWI7+miNLZsUvvHjHhvaGK8bNz0bEqPkEKTncFgDv4Eh2GsqR791fRik/z2k9FvY6b9fOeuAEFsTKfNlVxkvCXJH9lRNvo68Foz8H1PbZQAElWQzilwfwwPpRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYT6tYCtp9BiW0YOTbTimG9Dk+e985YPJ1amZ/gULAc=;
 b=h3pEkDZeLw5AvreoQB2IvcQUBGhFX+X2nYTnhpIgViGW2XIugFOOt/FmZfeQKq3a98niCmiHgxiEplvn9ZfSlikKiKB9Lq1JnYb4gnHjXuakL+WrBZDOQtJTy5xXUIH39h33ISuJtu6KsUxejHlrTMG5LBRlod8NsbSnEb8KFGg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f084464d-fb6d-45c3-a747-4a69804f7d26@amd.com>
Date: Mon, 11 Mar 2024 10:10:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] xen/domctl, tools: Introduce a new domctl to get
 guest memory map
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alec Kwapis <alec.kwapis@medtronic.com>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-4-xin.wang2@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240308015435.4044339-4-xin.wang2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|PH8PR12MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c5d7bf-6bc0-4d3c-2e25-08dc41ab2ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/dKsxQzC7B2i/euBkD2qnAfkLtaLxqlJlsXf2t1zkwTzWaUZ3CpBNCkBvuLnIDdjfD19IGC8sP/Y9PW7VFRdd1OTYvtPzSwbEU12cGnu9MoGGMPLaFKTKE4+Fj388bKAxeeJG1NU6W0iQTktFGOOoYlVCM3McWpfMscTpRuohciYj8dhH4qSmYuJIQGuIWYJPKCtNWTXQdwH+vZBYxoeZC807N/gtcN95PbMINvz5UIj+LGY4ZCxgltV0HTButRZIAjOv+xapLj9JFbb/hA15ZAUY7rMgwxGDnwd+3m28A/hu8RxJ8KqwaCcPwyXBNaLXrdJ9B9hK5B4mF3RVoXsevjReukPuAgsCkWILWJXQ15W7WVQN9t99AXKpurHPK1BMvf494k5emgtcMBLhk7ZQGzGRUuOGIdr2a2O22tSdw5tYdWn4+BGcxlXXRRFsTQmNyMlWNBbKeMpVfV/5RaKPu/Pp8NldHZKJyLfEAs37wJusyzfagWVyZJUdL9FzH1876KqfcupgU4RjkOp09bLllHaoAEyGM5z+BqoWUBJI6fh7/z4kLIKVIMrQ8e9fJj/0hm79ko77ximv/lmC+HcaysbcAOq7Kbm23AAxLSVKz4sFWrs5D5LMAFIvFY77HYVy6sddPX3j3Jy2BHVrEYweoP/nRrMuCOUE/fMtmFZqA5N+4IIpendwH0TYbRe5/Tag8vCOIe57YFfbt0MvlldNOR2oVZXchFbRlYFKv5WtZI7JuQ4skmvAdd7oRXuOnp9
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 09:11:00.5804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c5d7bf-6bc0-4d3c-2e25-08dc41ab2ba0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8606

Hi Henry,

On 08/03/2024 02:54, Henry Wang wrote:
> There are some use cases where the toolstack needs to know the guest
> memory map. For example, the toolstack helper application
> "init-dom0less" needs to know the guest magic page regions for 1:1
> direct-mapped dom0less DomUs to allocate magic pages.
> 
> To address such needs, add XEN_DOMCTL_get_mem_map hypercall and
> related data structures to query the hypervisor for the guest memory
> map. The guest memory map is recorded in the domain structure and
> currently only guest magic page region is recorded in the guest
> memory map. The guest magic page region is initialized at the domain
> creation time as the layout in the public header, and it is updated
> for 1:1 dom0less DomUs (see the following commit) to avoid conflict
> with RAM.
> 
> Take the opportunity to drop an unnecessary empty line to keep the
> coding style consistent in the file.
> 
> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
> v2:
> - New patch
> RFC: I think the newly introduced "struct xen_domctl_mem_map" is
> quite duplicated with "struct xen_memory_map", any comment on reuse
> the "struct xen_memory_map" for simplicity?
> ---
>  tools/include/xenctrl.h           |  4 ++++
>  tools/libs/ctrl/xc_domain.c       | 32 +++++++++++++++++++++++++++++++
>  xen/arch/arm/domain.c             |  6 ++++++
>  xen/arch/arm/domctl.c             | 19 +++++++++++++++++-
>  xen/arch/arm/include/asm/domain.h |  8 ++++++++
>  xen/include/public/arch-arm.h     |  4 ++++
>  xen/include/public/domctl.h       | 21 ++++++++++++++++++++
>  7 files changed, 93 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 2ef8b4e054..b25e9772a2 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1195,6 +1195,10 @@ int xc_domain_setmaxmem(xc_interface *xch,
>                          uint32_t domid,
>                          uint64_t max_memkb);
>  
> +int xc_get_domain_mem_map(xc_interface *xch, uint32_t domid,
> +                          struct xen_mem_region mem_regions[],
> +                          uint32_t *nr_regions);
> +
>  int xc_domain_set_memmap_limit(xc_interface *xch,
>                                 uint32_t domid,
>                                 unsigned long map_limitkb);
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index f2d9d14b4d..64b46bdfb4 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -697,6 +697,38 @@ int xc_domain_setmaxmem(xc_interface *xch,
>      return do_domctl(xch, &domctl);
>  }
>  
> +int xc_get_domain_mem_map(xc_interface *xch, uint32_t domid,
> +                          struct xen_mem_region mem_regions[],
> +                          uint32_t *nr_regions)
> +{
> +    int rc;
> +    struct xen_domctl domctl = {
> +        .cmd         = XEN_DOMCTL_get_mem_map,
> +        .domain      = domid,
> +        .u.mem_map = {
> +            .nr_mem_regions = *nr_regions,
> +        },
> +    };
> +
> +    DECLARE_HYPERCALL_BOUNCE(mem_regions,
> +                             sizeof(xen_mem_region_t) * (*nr_regions),
> +                             XC_HYPERCALL_BUFFER_BOUNCE_OUT);
> +
> +    if ( !mem_regions || xc_hypercall_bounce_pre(xch, mem_regions) ||
> +         (*nr_regions) < 1 )
> +        return -1;
> +
> +    set_xen_guest_handle(domctl.u.mem_map.buffer, mem_regions);
> +
> +    rc = do_domctl(xch, &domctl);
> +
> +    xc_hypercall_bounce_post(xch, mem_regions);
> +
> +    *nr_regions = domctl.u.mem_map.nr_mem_regions;
> +
> +    return rc;
> +}
> +
>  #if defined(__i386__) || defined(__x86_64__)
>  int xc_domain_set_memory_map(xc_interface *xch,
>                                 uint32_t domid,
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 5e7a7f3e7e..54f3601ab0 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -696,6 +696,7 @@ int arch_domain_create(struct domain *d,
>  {
>      unsigned int count = 0;
>      int rc;
> +    struct mem_map_domain *mem_map = &d->arch.mem_map;
>  
>      BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
>  
> @@ -785,6 +786,11 @@ int arch_domain_create(struct domain *d,
>      d->arch.sve_vl = config->arch.sve_vl;
>  #endif
>  
> +    mem_map->regions[mem_map->nr_mem_regions].start = GUEST_MAGIC_BASE;
You don't check for exceeding max number of regions. Is the expectation that nr_mem_regions
is 0 at this stage? Maybe add an ASSERT here.

> +    mem_map->regions[mem_map->nr_mem_regions].size = GUEST_MAGIC_SIZE;
> +    mem_map->regions[mem_map->nr_mem_regions].type = GUEST_MEM_REGION_MAGIC;
> +    mem_map->nr_mem_regions++;
> +
>      return 0;
>  
>  fail:
> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> index ad56efb0f5..92024bcaa0 100644
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -148,7 +148,6 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>  
>          return 0;
>      }
> -
>      case XEN_DOMCTL_vuart_op:
>      {
>          int rc;
> @@ -176,6 +175,24 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>  
>          return rc;
>      }
> +    case XEN_DOMCTL_get_mem_map:
> +    {
> +        int rc;
Without initialization, what will be the rc value on success?

> +        /*
> +         * Cap the number of regions to the minimum value between toolstack and
> +         * hypervisor to avoid overflowing the buffer.
> +         */
> +        uint32_t nr_regions = min(d->arch.mem_map.nr_mem_regions,
> +                                  domctl->u.mem_map.nr_mem_regions);
> +
> +        if ( copy_to_guest(domctl->u.mem_map.buffer,
> +                           d->arch.mem_map.regions,
> +                           nr_regions) ||
> +             __copy_to_guest(u_domctl, domctl, 1) )
In domctl.h, you wrote that nr_regions is IN/OUT but you don't seem to write back the actual number
of regions.

> +            rc = -EFAULT;
> +
> +        return rc;
> +    }
>      default:
>          return subarch_do_domctl(domctl, d, u_domctl);
>      }
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index f1d72c6e48..a559a9e499 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -10,6 +10,7 @@
>  #include <asm/gic.h>
>  #include <asm/vgic.h>
>  #include <asm/vpl011.h>
> +#include <public/domctl.h>
>  #include <public/hvm/params.h>
>  
>  struct hvm_domain
> @@ -59,6 +60,11 @@ struct paging_domain {
>      unsigned long p2m_total_pages;
>  };
>  
> +struct mem_map_domain {
> +    unsigned int nr_mem_regions;
> +    struct xen_mem_region regions[XEN_MAX_MEM_REGIONS];
> +};
> +
>  struct arch_domain
>  {
>  #ifdef CONFIG_ARM_64
> @@ -77,6 +83,8 @@ struct arch_domain
>  
>      struct paging_domain paging;
>  
> +    struct mem_map_domain mem_map;
> +
>      struct vmmio vmmio;
>  
>      /* Continuable domain_relinquish_resources(). */
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index a25e87dbda..a06eaf2dab 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -420,6 +420,10 @@ typedef uint64_t xen_callback_t;
>   * should instead use the FDT.
>   */
>  
> +/* Guest memory region types */
> +#define GUEST_MEM_REGION_DEFAULT    0
What's the purpose of this default type? It seems unusued.

> +#define GUEST_MEM_REGION_MAGIC      1
> +
>  /* Physical Address Space */
>  
>  /* Virtio MMIO mappings */
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index a33f9ec32b..77bf999651 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -946,6 +946,25 @@ struct xen_domctl_paging_mempool {
>      uint64_aligned_t size; /* Size in bytes. */
>  };
>  
> +#define XEN_MAX_MEM_REGIONS 1
The max number of regions can differ between arches. How are you going to handle it?

~Michal

