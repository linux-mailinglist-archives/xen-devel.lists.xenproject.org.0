Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC4BAE38AD
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 10:42:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022173.1397904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTckT-0001WM-I1; Mon, 23 Jun 2025 08:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022173.1397904; Mon, 23 Jun 2025 08:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTckT-0001U3-Eg; Mon, 23 Jun 2025 08:41:53 +0000
Received: by outflank-mailman (input) for mailman id 1022173;
 Mon, 23 Jun 2025 08:41:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uTckS-0001Tx-8c
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 08:41:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uTckR-00GA45-16;
 Mon, 23 Jun 2025 08:41:51 +0000
Received: from [2a02:8012:3a1:0:bd17:6d03:6e6c:1c7e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uTckQ-00ER50-24;
 Mon, 23 Jun 2025 08:41:50 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Lce3v2lnLDSzHOgj5m5InyIrlRGAMBDn6RG4aQB3Ogs=; b=aUr/H5QDjZ7e1nKsZWMIsiP/PO
	J5/KFdmTOKaEbzTKVAkUwEdAhT1L4lqZYe8i7gMzvPVA786HS57VBlKZ20qoLieuJNkfufINZMIm0
	TvcnGOEUqQxcpns3/TcBdn1awWeJ/fzoU/Sl6LUhVoS0hb/ANABNXOfwwro7dYrkaB6o=;
Message-ID: <21cbc79b-2209-42ef-8085-81c41e8e697b@xen.org>
Date: Mon, 23 Jun 2025 09:41:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/4] xen/arm: Implement standard PV time interface as
 per ARM DEN 0057A
Content-Language: en-GB
To: Koichiro Den <den@valinux.co.jp>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250621151201.896719-1-den@valinux.co.jp>
 <20250621151201.896719-5-den@valinux.co.jp>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250621151201.896719-5-den@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Koichiro,

I haven't checked all the details. I will mainly comment on the Xen 
internals.

On 21/06/2025 16:12, Koichiro Den wrote:
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
>   xen/arch/arm/domain.c                   | 30 +++++++++
>   xen/arch/arm/domain_build.c             | 87 ++++++++++++++++++++++++-
>   xen/arch/arm/include/asm/domain.h       | 17 +++++
>   xen/arch/arm/include/asm/smccc.h        | 12 ++++
>   xen/arch/arm/vsmc.c                     | 38 +++++++++++
>   xen/common/device-tree/dom0less-build.c |  2 +-
>   xen/include/xen/fdt-domain-build.h      |  2 +-
>   7 files changed, 183 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index be58a23dd725..e895e4111f1b 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -277,6 +277,18 @@ static void ctxt_switch_to(struct vcpu *n)
>       WRITE_SYSREG(n->arch.mdcr_el2, MDCR_EL2);
>   }
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
>   static void schedule_tail(struct vcpu *prev)
>   {
>       ASSERT(prev != current);
> @@ -291,6 +303,8 @@ static void schedule_tail(struct vcpu *prev)
>   
>       update_runstate_area(current);
>   
> +    update_stolen_time(current);
> +
>       /* Ensure that the vcpu has an up-to-date time base. */
>       update_vcpu_system_time(current);
>   }
> @@ -586,6 +600,8 @@ int arch_vcpu_create(struct vcpu *v)
>       if ( get_ssbd_state() == ARM_SSBD_RUNTIME )
>           v->arch.cpu_info->flags |= CPUINFO_WORKAROUND_2_FLAG;
>   
> +    v->arch.pv_time_region = &v->domain->arch.pv_time_regions[v->vcpu_id];
> +
>       return rc;
>   
>   fail:
> @@ -707,6 +723,7 @@ int arch_domain_create(struct domain *d,
>                          unsigned int flags)
>   {
>       unsigned int count = 0;
> +    int order;
>       int rc;
>   
>       BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
> @@ -791,6 +808,19 @@ int arch_domain_create(struct domain *d,
>       d->arch.sve_vl = config->arch.sve_vl;
>   #endif
>   
> +    /*
> +     * Preallocate the stolen time shared memory regions for all the
> +     * possible vCPUs.
> +     */
> +    order = get_order_from_bytes(d->max_vcpus * sizeof(struct pv_time_region));

As this is an order, we could end up to waste memory fairly quickly. So 
we should try to free the unused pages from the order. That said, the 
maximum number of virtual CPUs we currently support is 128. If I am not 
mistaken, this could fit in 2 4KB pages. So I would also be ok with a 
BUILD_BUG_ON(MAX_VIRT_CPUS <= 128) and we defer this work.

> +    d->arch.pv_time_regions_gfn = INVALID_GFN;

Does this mean PV time is optional? If so, shouldn't we allocate the 
memory conditionally?

Also, looking at the code below, you seem to cater domains created via 
dom0less but not from the toolstack. I think both should be supported 
for the PV time.

Lastly, you probably only want to allocate the memory for 64-bit domain 
as this is unusable for 32-bit domains.

> +    d->arch.pv_time_regions = alloc_xenheap_pages(order, 0);
 > +    if ( !d->arch.pv_time_regions ) {> +        rc = -ENOMEM;
> +        goto fail;
> +    }
> +    memset(d->arch.pv_time_regions, 0, PAGE_SIZE << order);
 > +>       return 0;
>   
>   fail:
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 85b6909e2b0e..1c51b53d9c6b 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1561,8 +1561,80 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
>       return res;
>   }
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
> +
> +    /* Find unused regions */
> +    regions_len = PAGE_ALIGN(d->max_vcpus * 64);

I would be best to avoid hardcoding the size of the region and use the 
size of struct pv_time_region.

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
> +                        pv_time_mfn, p2m_ram_rw, p2m_access_r);

p2m_access_* are used for restricting temporarily permission by 
memaccess. So on a data abort, we will call p2m_mem_access_check() which 
will then forward the fault to the memaccess agent.

If you want to restrict permission forever, then you need to use a 
different p2m_type_t. In this case, I am guessing you want p2m_ram_ro.

[...]

> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index a3487ca71303..c231c45fe40f 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -59,6 +59,18 @@ struct paging_domain {
>       unsigned long p2m_total_pages;
>   };
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
>   struct arch_domain
>   {
>   #ifdef CONFIG_ARM_64
> @@ -121,6 +133,9 @@ struct arch_domain
>       void *tee;
>   #endif
>   
> +    struct pv_time_region *pv_time_regions;
> +    gfn_t pv_time_regions_gfn;

Given the feature is 32-bit specific, shouldn't the field be protected 
with #define CONFIG_ARM_32?

Cheers,

-- 
Julien Grall


