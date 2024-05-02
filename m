Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6AF8BA099
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 20:35:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716149.1118244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2bHE-0001Lv-AE; Thu, 02 May 2024 18:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716149.1118244; Thu, 02 May 2024 18:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2bHE-0001Ji-74; Thu, 02 May 2024 18:35:28 +0000
Received: by outflank-mailman (input) for mailman id 716149;
 Thu, 02 May 2024 18:35:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Qsp=MF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2bHC-0001Jc-Nb
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 18:35:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcfe59ee-08b2-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 20:35:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5D5F761A32;
 Thu,  2 May 2024 18:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159C7C113CC;
 Thu,  2 May 2024 18:35:20 +0000 (UTC)
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
X-Inumbo-ID: bcfe59ee-08b2-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714674923;
	bh=0yDd7DiaX/tc3dq2DQMO4BYmIbyavMLPVq7RLiQanFs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mtEL4HcIdsRFFRbpxki+sFk97j7xLKYlZiw4mneGu0MLEHyfxnJvJ0XYjoU2Q2r10
	 /DaE81p4pMMzXAscBouSyD19qZr8maRJCkQ4/p0dj88ve7qE6VGtwx7EyzXKv78teV
	 i3CJa3Uf6aP/IMHscPA/gaRxXFZGmEw8iqMkaeCTqicus8y2lkzyX4zR3uH0QLeJhB
	 Oxo8QIsESFc8AXJGNV8Og2NlcOK7CMMfJ12QhwJiBdsz0vpuVQXmoymwcRTU5x3l+E
	 2C9+DPjKKLXVxsse6ki2SSdUD3m0sV5G2BnseL5zAkefDXfmrxVkO8W7YPAZhydUiO
	 /6RzEF9IQXTFQ==
Date: Thu, 2 May 2024 11:35:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    nicola.vetrini@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible
 array member not at the end
In-Reply-To: <20240430110922.15052-3-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2405021135060.624854@ubuntu-linux-20-04-desktop>
References: <20240430110922.15052-1-luca.fancellu@arm.com> <20240430110922.15052-3-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, Luca Fancellu wrote:
> Commit 2209c1e35b47 ("xen/arm: Introduce a generic way to access memory
> bank structures") introduced a MISRA regression for Rule 1.1 because a
> flexible array member is introduced in the middle of a struct, furthermore
> this is using a GCC extension that is going to be deprecated in GCC 14 and
> a warning to identify such cases will be present
> (-Wflex-array-member-not-at-end) to identify such cases.
> 
> In order to fix this issue, use the macro __struct_group to create a
> structure 'struct membanks_hdr' which will hold the common data among
> structures using the 'struct membanks' interface.
> 
> Modify the 'struct shared_meminfo' and 'struct meminfo' to use this new
> structure, effectively removing the flexible array member from the middle
> of the structure and modify the code accessing the .common field to use
> the macro container_of to maintain the functionality of the interface.
> 
> Given this change, container_of needs to be supplied with a type and so
> the macro 'kernel_info_get_mem' inside arm/include/asm/kernel.h can't be
> an option since it uses const and non-const types for struct membanks, so
> introduce two static inline, one of which will keep the const qualifier.
> 
> Given the complexity of the interface, which carries a lot of benefit but
> on the other hand could be prone to developer confusion if the access is
> open-coded, introduce two static inline helper for the
> 'struct kernel_info' .shm_mem member and get rid the open-coding
> shm_mem.common access.
> 
> Fixes: 2209c1e35b47 ("xen/arm: Introduce a generic way to access memory bank structures")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/acpi/domain_build.c        |  2 +-
>  xen/arch/arm/domain_build.c             |  6 +++---
>  xen/arch/arm/include/asm/kernel.h       | 11 ++++++++++-
>  xen/arch/arm/include/asm/setup.h        | 18 ++++++++++--------
>  xen/arch/arm/include/asm/static-shmem.h | 12 ++++++++++++
>  xen/arch/arm/static-shmem.c             | 19 +++++++++----------
>  6 files changed, 45 insertions(+), 23 deletions(-)
> 
> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
> index ed895dd8f926..2ce75543d004 100644
> --- a/xen/arch/arm/acpi/domain_build.c
> +++ b/xen/arch/arm/acpi/domain_build.c
> @@ -451,7 +451,7 @@ static int __init estimate_acpi_efi_size(struct domain *d,
>      struct acpi_table_rsdp *rsdp_tbl;
>      struct acpi_table_header *table;
>  
> -    efi_size = estimate_efi_size(kernel_info_get_mem(kinfo)->nr_banks);
> +    efi_size = estimate_efi_size(kernel_info_get_mem_const(kinfo)->nr_banks);
>  
>      acpi_size = ROUNDUP(sizeof(struct acpi_table_fadt), 8);
>      acpi_size += ROUNDUP(sizeof(struct acpi_table_stao), 8);
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 0784e4c5e315..f6550809cfdf 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -805,7 +805,7 @@ int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
>       * static shared memory banks need to be listed as /memory node, so when
>       * this function is handling the normal memory, add the banks.
>       */
> -    if ( mem == kernel_info_get_mem(kinfo) )
> +    if ( mem == kernel_info_get_mem_const(kinfo) )
>          shm_mem_node_fill_reg_range(kinfo, reg, &nr_cells, addrcells,
>                                      sizecells);
>  
> @@ -884,7 +884,7 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>  {
>      const struct membanks *mem = bootinfo_get_mem();
>      const struct membanks *mem_banks[] = {
> -        kernel_info_get_mem(kinfo),
> +        kernel_info_get_mem_const(kinfo),
>          bootinfo_get_reserved_mem(),
>  #ifdef CONFIG_STATIC_SHM
>          bootinfo_get_shmem(),
> @@ -1108,7 +1108,7 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>      uint64_t bankend;
>      const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>      const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
> -    const struct membanks *kinfo_mem = kernel_info_get_mem(kinfo);
> +    const struct membanks *kinfo_mem = kernel_info_get_mem_const(kinfo);
>      int res = -ENOENT;
>  
>      for ( i = 0; i < GUEST_RAM_BANKS; i++ )
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 16a2bfc01e27..7e6e3c82a477 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -80,7 +80,16 @@ struct kernel_info {
>      };
>  };
>  
> -#define kernel_info_get_mem(kinfo) (&(kinfo)->mem.common)
> +static inline struct membanks *kernel_info_get_mem(struct kernel_info *kinfo)
> +{
> +    return container_of(&kinfo->mem.common, struct membanks, common);
> +}
> +
> +static inline const struct membanks *
> +kernel_info_get_mem_const(const struct kernel_info *kinfo)
> +{
> +    return container_of(&kinfo->mem.common, const struct membanks, common);
> +}
>  
>  #ifdef CONFIG_STATIC_SHM
>  #define KERNEL_INFO_SHM_MEM_INIT .shm_mem.common.max_banks = NR_SHMEM_BANKS,
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 28fb659fe946..61c15806a7c4 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -64,18 +64,20 @@ struct membank {
>  };
>  
>  struct membanks {
> -    unsigned int nr_banks;
> -    unsigned int max_banks;
> +    __struct_group(membanks_hdr, common, ,
> +        unsigned int nr_banks;
> +        unsigned int max_banks;
> +    );
>      struct membank bank[];
>  };
>  
>  struct meminfo {
> -    struct membanks common;
> +    struct membanks_hdr common;
>      struct membank bank[NR_MEM_BANKS];
>  };
>  
>  struct shared_meminfo {
> -    struct membanks common;
> +    struct membanks_hdr common;
>      struct membank bank[NR_SHMEM_BANKS];
>      struct shmem_membank_extra extra[NR_SHMEM_BANKS];
>  };
> @@ -166,25 +168,25 @@ extern domid_t max_init_domid;
>  
>  static inline struct membanks *bootinfo_get_mem(void)
>  {
> -    return &bootinfo.mem.common;
> +    return container_of(&bootinfo.mem.common, struct membanks, common);
>  }
>  
>  static inline struct membanks *bootinfo_get_reserved_mem(void)
>  {
> -    return &bootinfo.reserved_mem.common;
> +    return container_of(&bootinfo.reserved_mem.common, struct membanks, common);
>  }
>  
>  #ifdef CONFIG_ACPI
>  static inline struct membanks *bootinfo_get_acpi(void)
>  {
> -    return &bootinfo.acpi.common;
> +    return container_of(&bootinfo.acpi.common, struct membanks, common);
>  }
>  #endif
>  
>  #ifdef CONFIG_STATIC_SHM
>  static inline struct membanks *bootinfo_get_shmem(void)
>  {
> -    return &bootinfo.shmem.common;
> +    return container_of(&bootinfo.shmem.common, struct membanks, common);
>  }
>  
>  static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
> index 3b6569e5703f..806ee41cfc37 100644
> --- a/xen/arch/arm/include/asm/static-shmem.h
> +++ b/xen/arch/arm/include/asm/static-shmem.h
> @@ -45,6 +45,18 @@ int make_shm_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
>  void shm_mem_node_fill_reg_range(const struct kernel_info *kinfo, __be32 *reg,
>                                   int *nr_cells, int addrcells, int sizecells);
>  
> +static inline struct membanks *
> +kernel_info_get_shm_mem(struct kernel_info *kinfo)
> +{
> +    return container_of(&kinfo->shm_mem.common, struct membanks, common);
> +}
> +
> +static inline const struct membanks *
> +kernel_info_get_shm_mem_const(const struct kernel_info *kinfo)
> +{
> +    return container_of(&kinfo->shm_mem.common, const struct membanks, common);
> +}
> +
>  #else /* !CONFIG_STATIC_SHM */
>  
>  /* Worst case /memory node reg element: (addrcells + sizecells) */
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index 09f474ec6050..78881dd1d3f7 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -172,16 +172,16 @@ static int __init assign_shared_memory(struct domain *d,
>  }
>  
>  static int __init
> -append_shm_bank_to_domain(struct shared_meminfo *kinfo_shm_mem, paddr_t start,
> +append_shm_bank_to_domain(struct kernel_info *kinfo, paddr_t start,
>                            paddr_t size, const char *shm_id)
>  {
> -    struct membanks *shm_mem = &kinfo_shm_mem->common;
> +    struct membanks *shm_mem = kernel_info_get_shm_mem(kinfo);
>      struct shmem_membank_extra *shm_mem_extra;
>  
>      if ( shm_mem->nr_banks >= shm_mem->max_banks )
>          return -ENOMEM;
>  
> -    shm_mem_extra = &kinfo_shm_mem->extra[shm_mem->nr_banks];
> +    shm_mem_extra = &kinfo->shm_mem.extra[shm_mem->nr_banks];
>  
>      shm_mem->bank[shm_mem->nr_banks].start = start;
>      shm_mem->bank[shm_mem->nr_banks].size = size;
> @@ -289,8 +289,7 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>           * Record static shared memory region info for later setting
>           * up shm-node in guest device tree.
>           */
> -        ret = append_shm_bank_to_domain(&kinfo->shm_mem, gbase, psize,
> -                                        shm_id);
> +        ret = append_shm_bank_to_domain(kinfo, gbase, psize, shm_id);
>          if ( ret )
>              return ret;
>      }
> @@ -301,7 +300,7 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>  int __init make_shm_resv_memory_node(const struct kernel_info *kinfo,
>                                       int addrcells, int sizecells)
>  {
> -    const struct membanks *mem = &kinfo->shm_mem.common;
> +    const struct membanks *mem = kernel_info_get_shm_mem_const(kinfo);
>      void *fdt = kinfo->fdt;
>      unsigned int i = 0;
>      int res = 0;
> @@ -517,7 +516,7 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>  int __init make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
>                                   int sizecells)
>  {
> -    const struct membanks *mem = &kinfo->shm_mem.common;
> +    const struct membanks *mem = kernel_info_get_shm_mem_const(kinfo);
>      void *fdt = kinfo->fdt;
>      int res = 0;
>      /* Placeholder for reserved-memory\0 */
> @@ -579,7 +578,7 @@ void __init init_sharedmem_pages(void)
>  int __init remove_shm_from_rangeset(const struct kernel_info *kinfo,
>                                      struct rangeset *rangeset)
>  {
> -    const struct membanks *shm_mem = &kinfo->shm_mem.common;
> +    const struct membanks *shm_mem = kernel_info_get_shm_mem_const(kinfo);
>      unsigned int i;
>  
>      /* Remove static shared memory regions */
> @@ -607,7 +606,7 @@ int __init remove_shm_from_rangeset(const struct kernel_info *kinfo,
>  int __init remove_shm_holes_for_domU(const struct kernel_info *kinfo,
>                                       struct membanks *ext_regions)
>  {
> -    const struct membanks *shm_mem = &kinfo->shm_mem.common;
> +    const struct membanks *shm_mem = kernel_info_get_shm_mem_const(kinfo);
>      struct rangeset *guest_holes;
>      unsigned int i;
>      paddr_t start;
> @@ -673,7 +672,7 @@ void __init shm_mem_node_fill_reg_range(const struct kernel_info *kinfo,
>                                          __be32 *reg, int *nr_cells,
>                                          int addrcells, int sizecells)
>  {
> -    const struct membanks *mem = &kinfo->shm_mem.common;
> +    const struct membanks *mem = kernel_info_get_shm_mem_const(kinfo);
>      unsigned int i;
>      __be32 *cells;
>  
> -- 
> 2.34.1
> 

