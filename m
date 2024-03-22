Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3755886A53
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 11:30:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696756.1087935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rncAE-0001Du-JO; Fri, 22 Mar 2024 10:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696756.1087935; Fri, 22 Mar 2024 10:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rncAE-0001Bf-Gn; Fri, 22 Mar 2024 10:30:18 +0000
Received: by outflank-mailman (input) for mailman id 696756;
 Fri, 22 Mar 2024 10:30:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GlD6=K4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rncAC-0001BZ-EO
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 10:30:16 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:240a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a5cd292-e837-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 11:30:14 +0100 (CET)
Received: from BN9PR03CA0426.namprd03.prod.outlook.com (2603:10b6:408:113::11)
 by PH8PR12MB7159.namprd12.prod.outlook.com (2603:10b6:510:229::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Fri, 22 Mar
 2024 10:30:08 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:113:cafe::a5) by BN9PR03CA0426.outlook.office365.com
 (2603:10b6:408:113::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Fri, 22 Mar 2024 10:30:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Fri, 22 Mar 2024 10:30:07 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 22 Mar
 2024 05:30:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 22 Mar
 2024 03:30:06 -0700
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 22 Mar 2024 05:30:05 -0500
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
X-Inumbo-ID: 2a5cd292-e837-11ee-afe0-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvAakGqV2T7tpIb0aUHOLCtcqhYD+YShDu81mdiW7DN9Vn/jjd1oc6xFtuifHyGkgQ6cvk0B/0b5ja2bWzX2zZk8eDeR9zw8OPakT3bNdk6y2K6rwXi+0F6v+fZlsJuh8W1LCXg7recLtnOowaVnvdJRWEBDRUFOypsFLEiKIPa2JZfrst1mWzeUgFZ+JR6vCaMOwa0GHoT1r89xp8wMq8jfpWx+sJ+twYFvV0NxyiXkJlrsedzouqltQN6a69telb2l3XrSG2txomC2Z5vKgnUC3EyJh3bx9tCaAte+816P11rIQom823TGVFENJZlNyFDxBvw/GsPXZHrvisJ/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zELJwZbc7DZgcyAZiRYp9QmzK2AJTx2/K1xrP3rVSXc=;
 b=LIDfmQxTQuHM1n9PnVy29H9xuLBEI1vi2Vo1E1emolCV6QzbwaBHsLf4w7W2mV68u0+U6VDqE9v9Wp73bHh3dJ9BDWJOTmQ58B2qGfK5pxwYEpwMb2qWTlrv4Nx+tE4OjwwGqhL7P9OCA0xm/ADOoc/lLIbslB1AjWYAXHToOX5EtPyQ/FoB+BoOMApjDg6ozu3/cVzmsP8b9IKZ04+boqL/fR1leUsWagGSIT5cWkGiR3y8v0tSZpjv5os5QBaBgL8VtXaU8k5NzoutNVsmgyBLPyX6Av5OxPopJ9smr24Y/u0QHAsLfq2Ffb/T3/O14V3v3ySXCAPX1tb00yhEmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zELJwZbc7DZgcyAZiRYp9QmzK2AJTx2/K1xrP3rVSXc=;
 b=I07stRSTdKfFsz47sxL70duqpzYUgKCvxid/PO1nf+SL4Ysk82xB005VXnUCaZh8kXp7dvhDjH/S/6mMWGQptR0min/Hqc0yIVvB4GncjVyBH9PP3P8uBy8jjGpy2UvaLjJkJIZ5SeTlaW+BiBjJ/kpam5CGRV1oesKCWZIlEBQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1cfde34b-6d03-4a18-81af-2e2a0195190e@amd.com>
Date: Fri, 22 Mar 2024 11:30:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] xen/arm: Reduce struct membank size on static
 shared memory
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-9-luca.fancellu@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240312130331.78418-9-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|PH8PR12MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 042116e8-6bfb-4d6e-7409-08dc4a5b0b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dh8g30jpGVPg4vtTxQh66sv/H5qFXf+1M4CEOSJabMYivZ3Wpryo+PlJbL/rAffptgEemOD+EcY8cuysWCKUb0ZT5MjNBG9slt175LqqtCePOLlgxkLX3Ur2HDse/VX0aXQw2rBCTYb5gRdVWtIsKMFfeLcj07hbp6D/spqcrNJthvf1xbDVQ2yem1QzVGrr7eEXBH8sk3I5+v0erKumFHGC7LS+05Yq4QCQhGZgg+DOMefRTalbD6hjepXk435ILXIZCXvYCJOVSnZb+5EmKzJO/EYX5fv7JbxKsh3LMpyu+DohwWXE5Nw6xFc10wOkhxbBEJZRE1vDHjFz8//o3L61SYSfHULfnZR61ivhIi98jwGAw2huzIFSnQANCKBBu1shf6JDFTuFvuvSQnh6G3c6BOsoVnG+qQxvi49j8SQCUY5JFs79CvYcvYEfS3yHUBYC0dmdWOedgY/yALjGR4aTXePRho3fce/Hh/VcCoCJATSAzPGnJwGPTO1SeaBUs0NWBEIgDiLIACKThofQminFKrHNiXAXezP7ehYR1VAeOTLA35p7adUL52bJDBYURvsgsSqx5Y56NwTIUNyowi58AOpOWUR4U/5KNRcGflAO16rjXPoIewPX69J3UwCBi9+f6t7pcKqygf+/CZEEQsGvWjQhIPN4oKqWdNxAybJO58F4s0/mz2r8CRJx2suZpyfe3Q4+/AVZkD8HPYuL+yFFuNdh0WFDQRv8hmnLc0PSYHyxZRVMwIWAgaFg68Lm
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 10:30:07.0894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 042116e8-6bfb-4d6e-7409-08dc4a5b0b4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7159

Hi Luca,

On 12/03/2024 14:03, Luca Fancellu wrote:
> 
> 
> Currently the memory footprint of the static shared memory feature
> is impacting all the struct meminfo instances with memory space
> that is not going to be used.
> 
> To solve this issue, rework the static shared memory extra
> information linked to the memory bank to another structure,
> struct shmem_membank_extra, and exploit the struct membank
> padding to host a pointer to that structure in a union with the
NIT: AFAICT the padding will be reused on Arm64 but on Arm32 there will still be 4B padding.

> enum membank_type, with this trick the 'struct membank' has the
> same size with or without the static shared memory, given that
> the 'type' and 'shmem_extra' are never used at the same time.
> 
> Afterwards, create a new structure 'struct shared_meminfo' which
> has the same interface of 'struct meminfo', but requires less
> banks and hosts the extra information for the static shared memory.
> The fields 'bank' and 'extra' of this structure are meant to be
> linked by the index (e.g. extra[idx] will have the information for
> the bank[idx], for i=0..NR_SHMEM_BANKS), the convinient pointer
> 'shmem_extra' of 'struct membank' is then linked to the related
> 'extra' bank to ease the fruition when a function has access only
> to the 'struct membanks common' of 'struct shared_meminfo'.
> 
> The last part of this work is to move the allocation of the
> static shared memory banks from the 'reserved_mem' to a new
> 'shmem' member of the 'struct bootinfo'.
> Change also the 'shm_mem' member type to be 'struct shared_meminfo'
> in order to match the above changes and allow a memory space
> reduction also in 'struct kernel_info'.
Ok, so from this point onwards, when dealing with "reserved" memory, one needs
to account for shmem as well, as it will no longer be part of bootinfo.reserved_mem
(unlike static-mem or static-heap). This is really the only disadvantage. The changes
LGTM, just a few comments below.

> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/arm32/mmu/mm.c             | 24 +++++++++
>  xen/arch/arm/arm64/mmu/mm.c             |  2 +
>  xen/arch/arm/bootfdt.c                  |  1 +
>  xen/arch/arm/domain_build.c             |  4 ++
>  xen/arch/arm/include/asm/kernel.h       |  4 +-
>  xen/arch/arm/include/asm/setup.h        | 41 +++++++++++++--
>  xen/arch/arm/include/asm/static-shmem.h |  8 +++
>  xen/arch/arm/setup.c                    | 25 ++++++++-
>  xen/arch/arm/static-shmem.c             | 69 ++++++++++++++++++-------
>  9 files changed, 154 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
> index e6bb5d934c16..45e42b307e20 100644
> --- a/xen/arch/arm/arm32/mmu/mm.c
> +++ b/xen/arch/arm/arm32/mmu/mm.c
> @@ -7,6 +7,7 @@
>  #include <xen/pfn.h>
>  #include <asm/fixmap.h>
>  #include <asm/static-memory.h>
> +#include <asm/static-shmem.h>
> 
>  static unsigned long opt_xenheap_megabytes __initdata;
>  integer_param("xenheap_megabytes", opt_xenheap_megabytes);
> @@ -42,6 +43,9 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
>                                         int first_mod)
>  {
>      const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
> +#ifdef CONFIG_STATIC_SHM
> +    const struct membanks *shmem = bootinfo_get_shmem();
> +#endif
>      const struct bootmodules *mi = &bootinfo.modules;
>      int i;
>      int nr;
> @@ -118,6 +122,25 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
>              return consider_modules(s, r_s, size, align, i + 1);
>          }
>      }
> +
> +#ifdef CONFIG_STATIC_SHM
> +    nr += reserved_mem->nr_banks;
> +    for ( ; i - nr < shmem->nr_banks; i++ )
> +    {
> +        paddr_t r_s = shmem->bank[i - nr].start;
> +        paddr_t r_e = r_s + shmem->bank[i - nr].size;
> +
> +        if ( s < r_e && r_s < e )
> +        {
> +            r_e = consider_modules(r_e, e, size, align, i + 1);
> +            if ( r_e )
> +                return r_e;
> +
> +            return consider_modules(s, r_s, size, align, i + 1);
> +        }
> +    }
> +#endif
> +
>      return e;
>  }
> 
> @@ -294,6 +317,7 @@ void __init setup_mm(void)
>                         mfn_to_maddr(directmap_mfn_end));
> 
>      init_staticmem_pages();
> +    init_sharedmem_pages();
>  }
> 
>  /*
> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> index f8aaf4ac18be..293acb67e09c 100644
> --- a/xen/arch/arm/arm64/mmu/mm.c
> +++ b/xen/arch/arm/arm64/mmu/mm.c
> @@ -6,6 +6,7 @@
> 
>  #include <asm/setup.h>
>  #include <asm/static-memory.h>
> +#include <asm/static-shmem.h>
> 
>  /* Override macros from asm/page.h to make them work with mfn_t */
>  #undef virt_to_mfn
> @@ -236,6 +237,7 @@ void __init setup_mm(void)
>      max_page = PFN_DOWN(ram_end);
> 
>      init_staticmem_pages();
> +    init_sharedmem_pages();
>  }
> 
>  /*
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index ecbc80d6a112..f2344863062e 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -499,6 +499,7 @@ static void __init early_print_info(void)
>                 mem_resv->bank[j].start,
>                 mem_resv->bank[j].start + mem_resv->bank[j].size - 1);
>      }
> +    early_print_info_shmem();
>      printk("\n");
>      for ( i = 0 ; i < cmds->nr_mods; i++ )
>          printk("CMDLINE[%"PRIpaddr"]:%s %s\n", cmds->cmdline[i].start,
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d0f2ac6060eb..9fad9e8b2c40 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -864,6 +864,7 @@ static int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
>   * regions we exclude every region assigned to Dom0 from the Host RAM:
>   * - domain RAM
>   * - reserved-memory
> + * - static shared memory
>   * - grant table space
>   */
>  static int __init find_unallocated_memory(const struct kernel_info *kinfo,
> @@ -873,6 +874,9 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>          bootinfo_get_mem(),
>          kernel_info_get_mem(kinfo),
>          bootinfo_get_reserved_mem(),
> +#ifdef CONFIG_STATIC_SHM
> +        bootinfo_get_shmem(),
> +#endif
>      };
>      struct rangeset *unalloc_mem;
>      paddr_t start, end;
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 5785da985ccf..937ffcefc73f 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -40,7 +40,7 @@ struct kernel_info {
>      paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
>      struct meminfo mem;
>  #ifdef CONFIG_STATIC_SHM
> -    struct meminfo shm_mem;
> +    struct shared_meminfo shm_mem;
>  #endif
> 
>      /* kernel entry point */
> @@ -84,7 +84,7 @@ struct kernel_info {
>      (&(kinfo)->mem.common)
> 
>  #ifdef CONFIG_STATIC_SHM
> -#define KERNEL_INFO_SHM_MEM_INIT .shm_mem.common.max_banks = NR_MEM_BANKS,
> +#define KERNEL_INFO_SHM_MEM_INIT .shm_mem.common.max_banks = NR_SHMEM_BANKS,
>  #else
>  #define KERNEL_INFO_SHM_MEM_INIT
>  #endif
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index a3e1dc8fdb6c..07011bd776da 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -9,6 +9,7 @@
>  #define MAX_FDT_SIZE SZ_2M
> 
>  #define NR_MEM_BANKS 256
> +#define NR_SHMEM_BANKS 32
> 
>  #define MAX_MODULES 32 /* Current maximum useful modules */
> 
> @@ -46,14 +47,20 @@ enum membank_type {
>  /* Indicates the maximum number of characters(\0 included) for shm_id */
>  #define MAX_SHM_ID_LENGTH 16
> 
> +struct shmem_membank_extra {
> +    char shm_id[MAX_SHM_ID_LENGTH];
> +    unsigned int nr_shm_borrowers;
> +};
> +
>  struct membank {
>      paddr_t start;
>      paddr_t size;
> -    enum membank_type type;
> +    union {
> +        enum membank_type type;
>  #ifdef CONFIG_STATIC_SHM
> -    char shm_id[MAX_SHM_ID_LENGTH];
> -    unsigned int nr_shm_borrowers;
> +        struct shmem_membank_extra *shmem_extra;
>  #endif
> +    };
>  };
> 
>  struct membanks {
> @@ -67,6 +74,12 @@ struct meminfo {
>      struct membank bank[NR_MEM_BANKS];
>  };
> 
> +struct shared_meminfo {
> +    struct membanks common;
> +    struct membank bank[NR_SHMEM_BANKS];
> +    struct shmem_membank_extra extra[NR_SHMEM_BANKS];
> +};
Same as with meminfo, please add a BUILD_BUG_ON for padding between common and bank.

> +
>  /*
>   * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
>   * The purpose of the domU flag is to avoid getting confused in
> @@ -109,6 +122,9 @@ struct bootinfo {
>      struct bootcmdlines cmdlines;
>  #ifdef CONFIG_ACPI
>      struct meminfo acpi;
> +#endif
> +#ifdef CONFIG_STATIC_SHM
> +    struct shared_meminfo shmem;
>  #endif
>      bool static_heap;
>  };
> @@ -119,11 +135,18 @@ struct bootinfo {
>  #define BOOTINFO_ACPI_INIT
>  #endif
> 
> +#ifdef CONFIG_STATIC_SHM
> +#define BOOTINFO_SHMEM_INIT .shmem.common.max_banks = NR_SHMEM_BANKS,
> +#else
> +#define BOOTINFO_SHMEM_INIT
> +#endif
> +
>  #define BOOTINFO_INIT \
>  { \
>      .mem.common.max_banks = NR_MEM_BANKS, \
>      .reserved_mem.common.max_banks = NR_MEM_BANKS, \
>      BOOTINFO_ACPI_INIT \
> +    BOOTINFO_SHMEM_INIT \
>  }
> 
>  struct map_range_data
> @@ -158,6 +181,18 @@ static inline struct membanks *bootinfo_get_acpi(void)
>  }
>  #endif
> 
> +#ifdef CONFIG_STATIC_SHM
> +static inline struct membanks *bootinfo_get_shmem(void)
> +{
> +    return &bootinfo.shmem.common;
> +}
> +
> +static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
> +{
> +    return bootinfo.shmem.extra;
> +}
> +#endif
> +
>  void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
> 
>  size_t estimate_efi_size(unsigned int mem_nr_banks);
> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
> index 108cedb55a9f..c6fac9906656 100644
> --- a/xen/arch/arm/include/asm/static-shmem.h
> +++ b/xen/arch/arm/include/asm/static-shmem.h
> @@ -25,6 +25,10 @@ static inline int process_shm_chosen(struct domain *d,
>  int process_shm_node(const void *fdt, int node, uint32_t address_cells,
>                       uint32_t size_cells);
> 
> +void early_print_info_shmem(void);
> +
> +void init_sharedmem_pages(void);
> +
>  #else /* !CONFIG_STATIC_SHM */
> 
>  static inline int make_resv_memory_node(const struct domain *d,
> @@ -53,6 +57,10 @@ static inline int process_shm_node(const void *fdt, int node,
>      return -EINVAL;
>  }
> 
> +static inline void early_print_info_shmem(void) {};
> +
> +static inline void init_sharedmem_pages(void) {};
> +
>  #endif /* CONFIG_STATIC_SHM */
> 
>  #endif /* __ASM_STATIC_SHMEM_H_ */
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index cc719d508d63..111172a8c4b1 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -208,6 +208,9 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
>                                           unsigned int first)
>  {
>      const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
> +#ifdef CONFIG_STATIC_SHM
> +    const struct membanks *shmem = bootinfo_get_shmem();
> +#endif
>      unsigned int i, nr;
>      int rc;
> 
> @@ -258,6 +261,22 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
>          }
>      }
> 
> +#ifdef CONFIG_STATIC_SHM
> +    nr += reserved_mem->nr_banks;
> +    for ( ; i - nr < shmem->nr_banks; i++ )
> +    {
> +        paddr_t r_s = shmem->bank[i - nr].start;
> +        paddr_t r_e = r_s + shmem->bank[i - nr].size;
> +
> +        if ( s < r_e && r_s < e )
> +        {
> +            dt_unreserved_regions(r_e, e, cb, i + 1);
> +            dt_unreserved_regions(s, r_s, cb, i + 1);
> +            return;
> +        }
> +    }
> +#endif
> +
>      cb(s, e);
>  }
> 
> @@ -344,13 +363,17 @@ bool __init check_reserved_regions_overlap(paddr_t region_start,
>          bootinfo_get_reserved_mem(),
>  #ifdef CONFIG_ACPI
>          bootinfo_get_acpi(),
> +#endif
> +#ifdef CONFIG_STATIC_SHM
> +        bootinfo_get_shmem(),
>  #endif
>      };
>      unsigned int i;
> 
>      /*
>       * Check if input region is overlapping with reserved memory banks or
> -     * ACPI EfiACPIReclaimMemory (when ACPI feature is enabled)
> +     * ACPI EfiACPIReclaimMemory (when ACPI feature is enabled) or static
> +     * shared memory banks (when static shared memory feature is enabled)
>       */
>      for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
>          if ( meminfo_overlap_check(mem_banks[i], region_start, region_size) )
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index 8b7da952be6e..6143f52cb991 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -4,29 +4,30 @@
>  #include <xen/sched.h>
> 
>  #include <asm/domain_build.h>
> +#include <asm/static-memory.h>
>  #include <asm/static-shmem.h>
> 
>  static int __init acquire_nr_borrower_domain(struct domain *d,
>                                               paddr_t pbase, paddr_t psize,
>                                               unsigned long *nr_borrowers)
>  {
> -    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
> +    const struct membanks *shmem = bootinfo_get_shmem();
>      unsigned int bank;
> 
>      /* Iterate reserved memory to find requested shm bank. */
> -    for ( bank = 0 ; bank < reserved_mem->nr_banks; bank++ )
> +    for ( bank = 0 ; bank < shmem->nr_banks; bank++ )
>      {
> -        paddr_t bank_start = reserved_mem->bank[bank].start;
> -        paddr_t bank_size = reserved_mem->bank[bank].size;
> +        paddr_t bank_start = shmem->bank[bank].start;
> +        paddr_t bank_size = shmem->bank[bank].size;
> 
>          if ( (pbase == bank_start) && (psize == bank_size) )
>              break;
>      }
> 
> -    if ( bank == reserved_mem->nr_banks )
> +    if ( bank == shmem->nr_banks )
>          return -ENOENT;
> 
> -    *nr_borrowers = reserved_mem->bank[bank].nr_shm_borrowers;
> +    *nr_borrowers = shmem->bank[bank].shmem_extra->nr_shm_borrowers;
> 
>      return 0;
>  }
> @@ -158,16 +159,22 @@ static int __init assign_shared_memory(struct domain *d,
>      return ret;
>  }
> 
> -static int __init append_shm_bank_to_domain(struct membanks *shm_mem,
> -                                            paddr_t start, paddr_t size,
> -                                            const char *shm_id)
> +static int __init
> +append_shm_bank_to_domain(struct shared_meminfo *kinfo_shm_mem, paddr_t start,
Is there any particular reason to prepend the shm_mem name with kinfo?

~Michal

