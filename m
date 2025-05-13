Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F753AB5FFE
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 01:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983633.1369863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEzVs-0002By-7n; Tue, 13 May 2025 23:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983633.1369863; Tue, 13 May 2025 23:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEzVs-00029R-4v; Tue, 13 May 2025 23:58:20 +0000
Received: by outflank-mailman (input) for mailman id 983633;
 Tue, 13 May 2025 23:58:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Z5s=X5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uEzVq-00029K-Lu
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 23:58:18 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 228a675f-3056-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 01:58:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7C44844CCA;
 Tue, 13 May 2025 23:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA7EC4CEED;
 Tue, 13 May 2025 23:58:12 +0000 (UTC)
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
X-Inumbo-ID: 228a675f-3056-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747180694;
	bh=mHVywJKDTHyIQaNARwPLhKXQqQyrJqyCPzAPadxHw2E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JHA64Bw6GN9WFiSunr6DjaHH53vSNvuNDeKD1TAgMCQaKM1eqBjpB4gq22uH1PoUA
	 msUaVHgPc1ebr3K5Rk4r8e4OqlpSKmYhI79ed6COxAXmo+J4igfqkek+0IUB6AySOO
	 ++7OFKGs6HlSSaBJi7GcujySZwlvbrEAJEuU8/TfXMcMZDjvAwSKkdupNY1A4lsYa4
	 eEsy6QFyOkQOl0WuLExB6ZpOjZOUB/bg3gj5ilz1x2npNrzutNtzSorQg0FzXlJ3K+
	 IgZpiKtUC7np5u0wl2SU8M+UW+a7K2r0+exXe/yflfmxEUG/E08+njxtapaxoRdeKs
	 Lk3wGd+cs0RKg==
Date: Tue, 13 May 2025 16:58:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v1 2/3] xen/dom0less: refactor architecture-specific DomU
 construction
In-Reply-To: <a13b414ba19c8928dc7b0e70cece6c26a77d514f.1747145897.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2505131657301.368682@ubuntu-linux-20-04-desktop>
References: <cover.1747145897.git.oleksii.kurochko@gmail.com> <a13b414ba19c8928dc7b0e70cece6c26a77d514f.1747145897.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 May 2025, Oleksii Kurochko wrote:
> Refactor construct_domU() to improve architecture separation and reduce
> reliance on ARM-specific logic in common code:
> - Drop set_domain_type() from generic code. This function is specific
>   to ARM and serves no purpose on other architectures like RISC-V,
>   which lack the arch.type field in kernel_info.
> - Introduce arch_construct_domU() to encapsulate architecture-specific
>   DomU construction steps.
> - Implement arch_construct_domU() for ARM. This includes:
>   - Setting the domain type for CONFIG_ARM64.
>   - Handling static memory allocation if xen,static-mem is present in
>     the device tree.
>   - Processing static shared memory.
> - Move call of make_resv_memory_node() to Arm's make_arch_nodes() as
>   this call is specific to CONFIG_STATIC_SHM which is ARM specific,
>   at least, now.
> 
> This cleanup avoids empty stubs on other architectures and moves
> ARM-specific logic into arch code where it belongs.
> 
> Also, don't loose  a return value of functions called in
> Arm's make_arch_nodes().
> 
> Suggested-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/arm/dom0less-build.c            | 42 +++++++++++++++++-------
>  xen/common/device-tree/dom0less-build.c  | 30 ++---------------
>  xen/include/asm-generic/dom0less-build.h |  3 +-
>  3 files changed, 36 insertions(+), 39 deletions(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index a49764f0ad..592173268f 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -220,9 +220,14 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
>  {
>      int ret;
>  
> +    ret = make_resv_memory_node(kinfo, GUEST_ROOT_ADDRESS_CELLS,
> +                                GUEST_ROOT_SIZE_CELLS);
> +    if ( ret )
> +        return ret;
> +
>      ret = make_psci_node(kinfo->fdt);
>      if ( ret )
> -        return -EINVAL;
> +        return ret;
>  
>      if ( kinfo->arch.vpl011 )
>      {
> @@ -230,26 +235,41 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
>          ret = make_vpl011_uart_node(kinfo);
>  #endif
>          if ( ret )
> -            return -EINVAL;
> +            return ret;
>      }
>  
>      return 0;
>  }
>  
> -/* TODO: make arch.type generic ? */
> -#ifdef CONFIG_ARM_64
> -void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
> +int __init arch_construct_domU(struct kernel_info *kinfo,
> +                               const struct dt_device_node *node)
>  {
> +    int rc = 0;
> +    struct domain *d = kinfo->d;
> +
> +#ifdef CONFIG_ARM_64
>      /* type must be set before allocate memory */
>      d->arch.type = kinfo->arch.type;
> -}
> -#else
> -void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
> -{
> -    /* Nothing to do */
> -}
>  #endif

NIT: I think it would be nicer to do 

if ( is_hardware_domain(d) )
    return rc;

but it is also OK as below

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> +    if ( !is_hardware_domain(d) )
> +    {
> +        if ( dt_find_property(node, "xen,static-mem", NULL) )
> +        {
> +            if ( !is_domain_direct_mapped(d) )
> +                allocate_static_memory(d, kinfo, node);
> +            else
> +                assign_static_memory_11(d, kinfo, node);
> +        }
> +
> +        rc = process_shm(d, kinfo, node);
> +        if ( rc < 0 )
> +            return rc;
> +    }
> +
> +    return rc;
> +}
> +
>  int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
>                        const struct dt_device_node *node)
>  {
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 2c56f13771..f6aabc2093 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -28,14 +28,6 @@
>  #include <asm/dom0less-build.h>
>  #include <asm/setup.h>
>  
> -#if __has_include(<asm/static-memory.h>)
> -#   include <asm/static-memory.h>
> -#endif
> -
> -#if __has_include(<asm/static-shmem.h>)
> -#   include <asm/static-shmem.h>
> -#endif
> -
>  #define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
>  
>  static domid_t __initdata xs_domid = DOMID_INVALID;
> @@ -507,12 +499,6 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>      if ( ret )
>          goto err;
>  
> -#ifdef CONFIG_STATIC_SHM
> -    ret = make_resv_memory_node(kinfo, addrcells, sizecells);
> -    if ( ret )
> -        goto err;
> -#endif
> -
>      /*
>       * domain_handle_dtb_bootmodule has to be called before the rest of
>       * the device tree is generated because it depends on the value of
> @@ -787,7 +773,9 @@ static int __init construct_domU(struct domain *d,
>      if ( rc < 0 )
>          return rc;
>  
> -    set_domain_type(d, &kinfo);
> +    rc = arch_construct_domU(&kinfo, node);
> +    if ( rc )
> +        return rc;
>  
>      if ( is_hardware_domain(d) )
>      {
> @@ -799,18 +787,6 @@ static int __init construct_domU(struct domain *d,
>      {
>          if ( !dt_find_property(node, "xen,static-mem", NULL) )
>              allocate_memory(d, &kinfo);
> -#ifdef CONFIG_STATIC_MEMORY
> -        else if ( !is_domain_direct_mapped(d) )
> -            allocate_static_memory(d, &kinfo, node);
> -        else
> -            assign_static_memory_11(d, &kinfo, node);
> -#endif
> -
> -#ifdef CONFIG_STATIC_SHM
> -        rc = process_shm(d, &kinfo, node);
> -        if ( rc < 0 )
> -            return rc;
> -#endif
>  
>          rc = init_vuart(d, &kinfo, node);
>          if ( rc < 0 )
> diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-generic/dom0less-build.h
> index e0ad0429ec..78142e71ca 100644
> --- a/xen/include/asm-generic/dom0less-build.h
> +++ b/xen/include/asm-generic/dom0less-build.h
> @@ -56,7 +56,8 @@ int init_vuart(struct domain *d, struct kernel_info *kinfo,
>  int make_intc_domU_node(struct kernel_info *kinfo);
>  int make_arch_nodes(struct kernel_info *kinfo);
>  
> -void set_domain_type(struct domain *d, struct kernel_info *kinfo);
> +int arch_construct_domU(struct kernel_info *kinfo,
> +                        const struct dt_device_node *node);
>  
>  int init_intc_phandle(struct kernel_info *kinfo, const char *name,
>                        const int node_next, const void *pfdt);
> -- 
> 2.49.0
> 

