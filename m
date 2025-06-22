Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 374E5AE32FD
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 01:27:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021961.1397684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTU5P-0008Aa-6g; Sun, 22 Jun 2025 23:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021961.1397684; Sun, 22 Jun 2025 23:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTU5P-000897-3z; Sun, 22 Jun 2025 23:26:55 +0000
Received: by outflank-mailman (input) for mailman id 1021961;
 Sun, 22 Jun 2025 23:26:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoFT=ZF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uTU5O-000891-7J
 for xen-devel@lists.xenproject.org; Sun, 22 Jun 2025 23:26:54 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 604f7e2f-4fc0-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 01:26:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E7F6EA4051C;
 Sun, 22 Jun 2025 23:26:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CBAAC4CEE3;
 Sun, 22 Jun 2025 23:26:49 +0000 (UTC)
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
X-Inumbo-ID: 604f7e2f-4fc0-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750634810;
	bh=ILtXhClwxoT9nUN+jADhH2hlhodqWENmBlZlzZ0o/FI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=W0o30gyd9kzvz1jCzU64nIzEMdsBhLa26syPChVmmE3xwFxfXnmyy4DKyYPXftKPx
	 pJl6rTL4PkwvqE86mg/8w/HV8p4YO8Fj+7auCLPPzLSNvDX9Np1lhiObraYsX3MfZ7
	 H9rrwEnEuoRtJ8jIcr8DEFiq8sIMGjGxor9JJ2frYOeriSWN3EWikotYa3pD0LwtdJ
	 pu1HkH2UZjtThV+WSP/o78m5q+g/fp79XupXa/01/oCsA53NDEwlnysduDdoggrSpW
	 F/Y6DOpMTgurBMOpT4Y75Ba3tKe6Xo610xeDanc+xvms0FMK4uU/tvSYoMEr+R8eeF
	 sYsDPGYlKFmBg==
Date: Sun, 22 Jun 2025 16:26:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Koichiro Den <den@valinux.co.jp>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 4/4] xen/arm: Implement standard PV time interface
 as per ARM DEN 0057A
In-Reply-To: <20250621151201.896719-5-den@valinux.co.jp>
Message-ID: <alpine.DEB.2.22.394.2506221616330.8066@ubuntu-linux-20-04-desktop>
References: <20250621151201.896719-1-den@valinux.co.jp> <20250621151201.896719-5-den@valinux.co.jp>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 22 Jun 2025, Koichiro Den wrote:
> The VCPUOP_register_runstate_memory_area hypercall is still actively
> used, e.g., in the Linux arm64 codebase. When KPTI is enabled, the area
> was not registered from the beginning due to the VA not always being
> valid. In such cases, Linux falls back to using the standard PV time
> interface (ARM DEN 0057A), but this interface has not been implemented
> in Xen for ARM64 (until this commit).
> 
> The VCPUOP_register_runstate_phys_area was introduced, though it's
> unclear whether this would be used in Linux arm64 and when it will be
> prevalent amongst every possible downstream domain Linux variant. And of
> course Linux is not an only option for the Xen arm64 domains.
> 
> Therefore, implementing the standard way of sharing PV time is
> generically beneficial, avoiding reliance on specially crafted
> hypercalls, the usage of which by guest VMs is not always guaranteed.
> Note that the PV_TIME_ST interface communicates with IPA (GPA), not GVA.
> 
> Add the PV time interface according to ARM DEN 0057A.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
>  xen/arch/arm/domain.c                   | 30 +++++++++
>  xen/arch/arm/domain_build.c             | 87 ++++++++++++++++++++++++-
>  xen/arch/arm/include/asm/domain.h       | 17 +++++
>  xen/arch/arm/include/asm/smccc.h        | 12 ++++
>  xen/arch/arm/vsmc.c                     | 38 +++++++++++
>  xen/common/device-tree/dom0less-build.c |  2 +-
>  xen/include/xen/fdt-domain-build.h      |  2 +-
>  7 files changed, 183 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index be58a23dd725..e895e4111f1b 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -277,6 +277,18 @@ static void ctxt_switch_to(struct vcpu *n)
>      WRITE_SYSREG(n->arch.mdcr_el2, MDCR_EL2);
>  }
>  
> +static void update_stolen_time(struct vcpu *n)
> +{
> +    uint64_t tot_stolen;
> +
> +    if ( is_idle_vcpu(current) )
> +        return;
> +
> +    tot_stolen = n->runstate.time[RUNSTATE_runnable] +
> +                 n->runstate.time[RUNSTATE_offline];
> +    write_atomic(&n->arch.pv_time_region->stolen_time, tot_stolen);
> +}
> +
>  static void schedule_tail(struct vcpu *prev)
>  {
>      ASSERT(prev != current);
> @@ -291,6 +303,8 @@ static void schedule_tail(struct vcpu *prev)
>  
>      update_runstate_area(current);
>  
> +    update_stolen_time(current);
> +
>      /* Ensure that the vcpu has an up-to-date time base. */
>      update_vcpu_system_time(current);
>  }
> @@ -586,6 +600,8 @@ int arch_vcpu_create(struct vcpu *v)
>      if ( get_ssbd_state() == ARM_SSBD_RUNTIME )
>          v->arch.cpu_info->flags |= CPUINFO_WORKAROUND_2_FLAG;
>  
> +    v->arch.pv_time_region = &v->domain->arch.pv_time_regions[v->vcpu_id];
> +
>      return rc;
>  
>  fail:
> @@ -707,6 +723,7 @@ int arch_domain_create(struct domain *d,
>                         unsigned int flags)
>  {
>      unsigned int count = 0;
> +    int order;

unsigned int


>      int rc;
>  
>      BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
> @@ -791,6 +808,19 @@ int arch_domain_create(struct domain *d,
>      d->arch.sve_vl = config->arch.sve_vl;
>  #endif
>  
> +    /*
> +     * Preallocate the stolen time shared memory regions for all the
> +     * possible vCPUs.
> +     */
> +    order = get_order_from_bytes(d->max_vcpus * sizeof(struct pv_time_region));
> +    d->arch.pv_time_regions_gfn = INVALID_GFN;
> +    d->arch.pv_time_regions = alloc_xenheap_pages(order, 0);
> +    if ( !d->arch.pv_time_regions ) {
> +        rc = -ENOMEM;
> +        goto fail;
> +    }
> +    memset(d->arch.pv_time_regions, 0, PAGE_SIZE << order);
> +
>      return 0;
>  
>  fail:
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 85b6909e2b0e..1c51b53d9c6b 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1561,8 +1561,80 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
>      return res;
>  }
>  
> -int __init make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
> -                                 int sizecells)
> +int __init make_pv_time_resv_memory_node(struct domain *d,
> +                                         const struct kernel_info *kinfo,
> +                                         int addrcells, int sizecells)
> +{
> +    __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
> +    unsigned int len = (addrcells + sizecells) * sizeof(__be32);
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +    struct membanks *unused_banks = NULL;
> +    void *fdt = kinfo->fdt;
> +    unsigned regions_len;
> +    gfn_t pv_time_gfn;
> +    mfn_t pv_time_mfn;
> +    paddr_t aligned;
> +    paddr_t avail;
> +    __be32 *cells;
> +    int res;
> +    int i;

unsigned int i


> +    /* Find unused regions */
> +    regions_len = PAGE_ALIGN(d->max_vcpus * 64);
> +    unused_banks = membanks_xzalloc(NR_MEM_BANKS, MEMORY);
> +    if ( !unused_banks )
> +        return -ENOMEM;
> +
> +    res = find_unused_regions(d, kinfo, unused_banks);
> +    if ( res ) {
> +        printk(XENLOG_WARNING "%pd: failed to find unused regions\n", d);
> +        goto fail;
> +    }
> +    for ( i = 0; i < unused_banks->nr_banks; i++ ) {
> +        const struct membank *bank = &unused_banks->bank[i];
> +        aligned = PAGE_ALIGN(bank->start);
> +        avail = bank->size - (aligned - bank->start);
> +        if ( avail >= regions_len )
> +            break;
> +    }
> +    if ( i == unused_banks->nr_banks ) {
> +        res = -ENOSPC;
> +        goto fail;
> +    }
> +
> +    /* Insert P2M entry */
> +    pv_time_mfn = virt_to_mfn(d->arch.pv_time_regions);
> +    pv_time_gfn = gaddr_to_gfn(aligned);
> +    p2m_write_lock(p2m);
> +    res = p2m_set_entry(p2m, pv_time_gfn, regions_len / PAGE_SIZE,

PFN_DOW


> +                        pv_time_mfn, p2m_ram_rw, p2m_access_r);
> +    p2m_write_unlock(p2m);
> +    if ( res ) {
> +        printk(XENLOG_WARNING "%pd: failed to set P2M entry for PV_TIME\n", d);
> +        goto fail;
> +    }
> +    d->arch.pv_time_regions_gfn = pv_time_gfn;
> +
> +    /* Reserve the selected GFN */
> +    res = domain_fdt_begin_node(fdt, "pv-time", gfn_x(pv_time_gfn));
> +    if ( res )
> +        goto fail;
> +
> +    cells = reg;
> +    dt_child_set_range(&cells, addrcells, sizecells, gfn_x(pv_time_gfn), regions_len);
> +    res = fdt_property(fdt, "reg", reg, len);
> +    if ( res )
> +        goto fail;
> +
> +    res = fdt_end_node(fdt);
> +
> +  fail:
> +    xfree(unused_banks);
> +    return res;
> +}
> +
> +int __init make_resv_memory_node(struct domain *d, const struct kernel_info *kinfo,
> +                                 int addrcells, int sizecells)
>  {
>      const struct membanks *mem = kernel_info_get_shm_mem_const(kinfo);
>      void *fdt = kinfo->fdt;
> @@ -1596,6 +1668,10 @@ int __init make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
>      if ( res )
>          return res;
>  
> +    res = make_pv_time_resv_memory_node(d, kinfo, addrcells, sizecells);
> +    if ( res )
> +        return res;
> +
>      res = fdt_end_node(fdt);
>  
>      return res;
> @@ -1744,6 +1820,11 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>                                          dt_n_size_cells(node));
>          if ( res )
>              return res;
> +
> +        res = make_pv_time_resv_memory_node(d, kinfo, dt_n_addr_cells(node),
> +                                            dt_n_size_cells(node));
> +        if ( res )
> +            return res;
>      }
>  
>      for ( child = node->child; child != NULL; child = child->sibling )
> @@ -1791,7 +1872,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>  
>          if ( !res_mem_node_found )
>          {
> -            res = make_resv_memory_node(kinfo, addrcells, sizecells);
> +            res = make_resv_memory_node(d, kinfo, addrcells, sizecells);
>              if ( res )
>                  return res;
>          }
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index a3487ca71303..c231c45fe40f 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -59,6 +59,18 @@ struct paging_domain {
>      unsigned long p2m_total_pages;
>  };
>  
> +/* Stolen time shared memory region (ARM DEN 0057A.b) */
> +struct pv_time_region {
> +    /* This field must be 0 as per ARM DEN 0057A.b */
> +    uint32_t revision;
> +
> +    /* This field must be 0 as per ARM DEN 0057A.b */
> +    uint32_t attribute;
> +
> +    /* Total stolen time in nanoseconds */
> +    uint64_t stolen_time;
> +} __aligned(64);
> +
>  struct arch_domain
>  {
>  #ifdef CONFIG_ARM_64
> @@ -121,6 +133,9 @@ struct arch_domain
>      void *tee;
>  #endif
>  
> +    struct pv_time_region *pv_time_regions;
> +    gfn_t pv_time_regions_gfn;
> +
>  }  __cacheline_aligned;
>  
>  struct arch_vcpu
> @@ -243,6 +258,8 @@ struct arch_vcpu
>       */
>      bool need_flush_to_ram;
>  
> +    struct pv_time_region *pv_time_region;
> +
>  }  __cacheline_aligned;
>  
>  void vcpu_show_registers(struct vcpu *v);
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
> index a289c48b7ffd..6207ac74b715 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -380,6 +380,18 @@ void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
>                         ARM_SMCCC_OWNER_ARCH,        \
>                         0x3FFF)
>  
> +#define ARM_SMCCC_HYP_PV_TIME_FEATURES              \
> +    ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,         \
> +                       ARM_SMCCC_CONV_64,           \
> +                       ARM_SMCCC_OWNER_HYPERVISOR,  \
> +                       0x20)
> +
> +#define ARM_SMCCC_HYP_PV_TIME_ST                    \
> +    ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,         \
> +                       ARM_SMCCC_CONV_64,           \
> +                       ARM_SMCCC_OWNER_HYPERVISOR,  \
> +                       0x21)
> +
>  /* SMCCC error codes */
>  #define ARM_SMCCC_NOT_REQUIRED          (-2)
>  #define ARM_SMCCC_ERR_UNKNOWN_FUNCTION  (-1)
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 6081f14ed0c1..1e2fbc1a62b4 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -12,6 +12,7 @@
>  #include <public/arch-arm/smccc.h>
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
> +#include <asm/domain.h>
>  #include <asm/monitor.h>
>  #include <asm/regs.h>
>  #include <asm/smccc.h>
> @@ -127,6 +128,10 @@ static bool handle_arch(struct cpu_user_regs *regs)
>              if ( cpus_have_cap(ARM_WORKAROUND_BHB_SMCC_3) )
>                  ret = ARM_SMCCC_SUCCESS;
>              break;
> +        case ARM_SMCCC_HYP_PV_TIME_FEATURES:
> +            if ( !gfn_eq(current->domain->arch.pv_time_regions_gfn, INVALID_GFN) )
> +                ret = ARM_SMCCC_SUCCESS;
> +            break;
>          }
>  
>          set_user_reg(regs, 0, ret);
> @@ -162,6 +167,35 @@ static bool handle_arch(struct cpu_user_regs *regs)
>      return false;
>  }
>  
> +static bool fill_pv_time_features(struct cpu_user_regs *regs)
> +{
> +    uint32_t arch_func_id = get_user_reg(regs, 1);
> +    int ret = ARM_SMCCC_NOT_SUPPORTED;
> +
> +    if ( arch_func_id == ARM_SMCCC_HYP_PV_TIME_ST &&
> +         !gfn_eq(current->domain->arch.pv_time_regions_gfn, INVALID_GFN) )
> +        ret = ARM_SMCCC_SUCCESS;
> +
> +    set_user_reg(regs, 0, ret);
> +
> +    return true;
> +}
> +
> +static bool fill_pv_time_st(struct cpu_user_regs *regs)
> +{
> +    register_t ret = ARM_SMCCC_NOT_SUPPORTED;
> +    paddr_t gaddr;
> +
> +    if ( !gfn_eq(current->domain->arch.pv_time_regions_gfn, INVALID_GFN) )
> +    {
> +        gaddr = gfn_to_gaddr(current->domain->arch.pv_time_regions_gfn);
> +        ret = gaddr + current->vcpu_id * sizeof(struct pv_time_region);
> +    }
> +
> +    set_user_reg(regs, 0, ret);
> +    return true;
> +}
> +
>  /* SMCCC interface for hypervisor. Tell about itself. */
>  static bool handle_hypervisor(struct cpu_user_regs *regs)
>  {
> @@ -176,6 +210,10 @@ static bool handle_hypervisor(struct cpu_user_regs *regs)
>      case ARM_SMCCC_REVISION_FID(HYPERVISOR):
>          return fill_revision(regs, XEN_SMCCC_MAJOR_REVISION,
>                               XEN_SMCCC_MINOR_REVISION);
> +    case ARM_SMCCC_HYP_PV_TIME_FEATURES:
> +        return fill_pv_time_features(regs);
> +    case ARM_SMCCC_HYP_PV_TIME_ST:
> +        return fill_pv_time_st(regs);

This file is common across 32-bit and 64-bit guests. Looking at the
implementation of fill_pv_time_st, which returns a 64-bit address on a
potentially 32-bit register, it looks like this interface is only meant
for 64-bit guests?

If so, then we should have a check here and return "not supported" for
32-bit callers.


>      default:
>          return false;
>      }
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 3d503c697337..fa31b1733388 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -502,7 +502,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>      if ( ret )
>          goto err;
>  
> -    ret = make_resv_memory_node(kinfo, addrcells, sizecells);
> +    ret = make_resv_memory_node(d, kinfo, addrcells, sizecells);
>      if ( ret )
>          goto err;
>  
> diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
> index e9418857e386..645e7d0a54aa 100644
> --- a/xen/include/xen/fdt-domain-build.h
> +++ b/xen/include/xen/fdt-domain-build.h
> @@ -25,7 +25,7 @@ int construct_domain(struct domain *d, struct kernel_info *kinfo);
>  int construct_hwdom(struct kernel_info *kinfo,
>                      const struct dt_device_node *node);
>  int make_chosen_node(const struct kernel_info *kinfo);
> -int make_resv_memory_node(const struct kernel_info *kinfo,
> +int make_resv_memory_node(struct domain *d, const struct kernel_info *kinfo,
>                            int addrcells, int sizecells);
>  int make_cpus_node(const struct domain *d, void *fdt);
>  int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
> -- 
> 2.48.1
> 

