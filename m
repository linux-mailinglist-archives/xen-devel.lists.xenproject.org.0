Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65334AE32F7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 01:12:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021952.1397673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTTrM-0006SL-1a; Sun, 22 Jun 2025 23:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021952.1397673; Sun, 22 Jun 2025 23:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTTrL-0006Px-V8; Sun, 22 Jun 2025 23:12:23 +0000
Received: by outflank-mailman (input) for mailman id 1021952;
 Sun, 22 Jun 2025 23:12:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoFT=ZF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uTTrK-0006Pr-Nx
 for xen-devel@lists.xenproject.org; Sun, 22 Jun 2025 23:12:22 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 587bec60-4fbe-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 01:12:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D30D543F46;
 Sun, 22 Jun 2025 23:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F620C4CEE3;
 Sun, 22 Jun 2025 23:12:17 +0000 (UTC)
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
X-Inumbo-ID: 587bec60-4fbe-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750633938;
	bh=ftw3Nnyp+J/D1Ry3KAIg1f+d2yn7R+AUvj3Rjiit4JE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hX2tWnHpfCqSzchZ/8exjgKntV02/xPrJLIvaJv1Y0sGM3ZBZZpuf/9ibcpYSmNo2
	 XxpQxgnznTIWkRHWKtDQsn30TCvv3H77kEL6Ovw6i8YUqcdFwA7fyff8NbVfztlh9H
	 IVpHJhHMLoKEXijc0BHsiX/gdvbu8ivtSiBN5nJLxa/d1mEvtz9X4X+/Dcvwzb2BYa
	 YepvfHzyk7I3TIT1u73rCFbJw/Vpp4QEWooqltGXC8Og9hVNSmZBpK1S8CbC8MYQox
	 PpdLC2GuL+LNGsau75uGTQbB2BAZROEg+33x6X0mXAD0XtpDr9tLshe+pRsOSu/kED
	 HaOP0yAb+58yg==
Date: Sun, 22 Jun 2025 16:12:15 -0700 (PDT)
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
Subject: Re: [RFC PATCH 3/4] xen/arm: Move make_resv_memory_node()
In-Reply-To: <20250621151201.896719-4-den@valinux.co.jp>
Message-ID: <alpine.DEB.2.22.394.2506221608030.8066@ubuntu-linux-20-04-desktop>
References: <20250621151201.896719-1-den@valinux.co.jp> <20250621151201.896719-4-den@valinux.co.jp>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-513018135-1750633744=:8066"
Content-ID: <alpine.DEB.2.22.394.2506221612130.8066@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-513018135-1750633744=:8066
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2506221612131.8066@ubuntu-linux-20-04-desktop>

On Sun, 22 Jun 2025, Koichiro Den wrote:
> The /reserved-memory node is inherently not specific to static-shmem. In
> the next commit, child nodes will be added under /reserved-memory for
> the stolen time shared memory regions.
> 
> No functional changes intended.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

This causes a build failure when CONFIG_STATIC_SHM is missing.

arch/arm/domain_build.c: In function ‘make_resv_memory_node’:
arch/arm/domain_build.c:1567:34: error: implicit declaration of function ‘kernel_info_get_shm_mem_const’; did you mean ‘kernel_info_get_mem_const’? [-Werror=implicit-function-declaration]
 1567 |     const struct membanks *mem = kernel_info_get_shm_mem_const(kinfo);
      |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                  kernel_info_get_mem_const
arch/arm/domain_build.c:1567:34: error: nested extern declaration of ‘kernel_info_get_shm_mem_const’ [-Werror=nested-externs]
arch/arm/domain_build.c:1567:34: error: initialization of ‘const struct membanks *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]



> ---
>  xen/arch/arm/domain_build.c           | 40 +++++++++++++++++++++++++++
>  xen/common/device-tree/static-shmem.c | 40 ---------------------------
>  xen/include/xen/fdt-domain-build.h    |  2 ++
>  xen/include/xen/static-shmem.h        |  9 ------
>  4 files changed, 42 insertions(+), 49 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 967ca6f375ca..85b6909e2b0e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1561,6 +1561,46 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
>      return res;
>  }
>  
> +int __init make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
> +                                 int sizecells)
> +{
> +    const struct membanks *mem = kernel_info_get_shm_mem_const(kinfo);
> +    void *fdt = kinfo->fdt;
> +    int res = 0;
> +    /* Placeholder for reserved-memory\0 */
> +    const char resvbuf[16] = "reserved-memory";
> +
> +    if ( mem->nr_banks == 0 )
> +        /* No shared memory provided. */
> +        return 0;
> +
> +    dt_dprintk("Create reserved-memory node\n");
> +
> +    res = fdt_begin_node(fdt, resvbuf);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property(fdt, "ranges", NULL, 0);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(fdt, "#address-cells", addrcells);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(fdt, "#size-cells", sizecells);
> +    if ( res )
> +        return res;
> +
> +    res = make_shm_resv_memory_node(kinfo, addrcells, sizecells);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_end_node(fdt);
> +
> +    return res;
> +}
> +
>  static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>                                struct dt_device_node *node,
>                                p2m_type_t p2mt)
> diff --git a/xen/common/device-tree/static-shmem.c b/xen/common/device-tree/static-shmem.c
> index 8023c0a484c1..7eede97fa25d 100644
> --- a/xen/common/device-tree/static-shmem.c
> +++ b/xen/common/device-tree/static-shmem.c
> @@ -730,46 +730,6 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>      return 0;
>  }
>  
> -int __init make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
> -                                 int sizecells)
> -{
> -    const struct membanks *mem = kernel_info_get_shm_mem_const(kinfo);
> -    void *fdt = kinfo->fdt;
> -    int res = 0;
> -    /* Placeholder for reserved-memory\0 */
> -    const char resvbuf[16] = "reserved-memory";
> -
> -    if ( mem->nr_banks == 0 )
> -        /* No shared memory provided. */
> -        return 0;
> -
> -    dt_dprintk("Create reserved-memory node\n");
> -
> -    res = fdt_begin_node(fdt, resvbuf);
> -    if ( res )
> -        return res;
> -
> -    res = fdt_property(fdt, "ranges", NULL, 0);
> -    if ( res )
> -        return res;
> -
> -    res = fdt_property_cell(fdt, "#address-cells", addrcells);
> -    if ( res )
> -        return res;
> -
> -    res = fdt_property_cell(fdt, "#size-cells", sizecells);
> -    if ( res )
> -        return res;
> -
> -    res = make_shm_resv_memory_node(kinfo, addrcells, sizecells);
> -    if ( res )
> -        return res;
> -
> -    res = fdt_end_node(fdt);
> -
> -    return res;
> -}
> -
>  void __init early_print_info_shmem(void)
>  {
>      const struct membanks *shmem = bootinfo_get_shmem();
> diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
> index 45981dbec0b8..e9418857e386 100644
> --- a/xen/include/xen/fdt-domain-build.h
> +++ b/xen/include/xen/fdt-domain-build.h
> @@ -25,6 +25,8 @@ int construct_domain(struct domain *d, struct kernel_info *kinfo);
>  int construct_hwdom(struct kernel_info *kinfo,
>                      const struct dt_device_node *node);
>  int make_chosen_node(const struct kernel_info *kinfo);
> +int make_resv_memory_node(const struct kernel_info *kinfo,
> +                          int addrcells, int sizecells);
>  int make_cpus_node(const struct domain *d, void *fdt);
>  int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
>                           int addrcells, int sizecells);
> diff --git a/xen/include/xen/static-shmem.h b/xen/include/xen/static-shmem.h
> index 76a49869126c..4afa9107de5d 100644
> --- a/xen/include/xen/static-shmem.h
> +++ b/xen/include/xen/static-shmem.h
> @@ -11,9 +11,6 @@
>  /* Worst case /memory node reg element: (addrcells + sizecells) */
>  #define DT_MEM_NODE_REG_RANGE_SIZE ((NR_MEM_BANKS + NR_SHMEM_BANKS) * 4)
>  
> -int make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
> -                          int sizecells);
> -
>  int process_shm(struct domain *d, struct kernel_info *kinfo,
>                  const struct dt_device_node *node);
>  
> @@ -50,12 +47,6 @@ kernel_info_get_shm_mem_const(const struct kernel_info *kinfo)
>  /* Worst case /memory node reg element: (addrcells + sizecells) */
>  #define DT_MEM_NODE_REG_RANGE_SIZE (NR_MEM_BANKS * 4)
>  
> -static inline int make_resv_memory_node(const struct kernel_info *kinfo,
> -                                        int addrcells, int sizecells)
> -{
> -    return 0;
> -}
> -
>  static inline int process_shm(struct domain *d, struct kernel_info *kinfo,
>                                const struct dt_device_node *node)
>  {
> -- 
> 2.48.1
> 
--8323329-513018135-1750633744=:8066--

