Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673EEAA7B1D
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 22:55:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975113.1362784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAxPl-0006Ds-JZ; Fri, 02 May 2025 20:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975113.1362784; Fri, 02 May 2025 20:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAxPl-0006BP-Gs; Fri, 02 May 2025 20:55:21 +0000
Received: by outflank-mailman (input) for mailman id 975113;
 Fri, 02 May 2025 20:55:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mfxJ=XS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uAxPk-0006BH-3c
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 20:55:20 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1027303-2797-11f0-9eb4-5ba50f476ded;
 Fri, 02 May 2025 22:55:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E1756A41176;
 Fri,  2 May 2025 20:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4797C4CEE9;
 Fri,  2 May 2025 20:55:15 +0000 (UTC)
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
X-Inumbo-ID: c1027303-2797-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746219317;
	bh=yvqgNLHetnyrzYoipfCXgahI3TfB5nKfX9qRpLs/EgE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EnBVaZ0762L85xHCoehtbGnoiTTAmZP+G64xR9syVmVdhHW2plwqnfW2uT8bYJno1
	 NCIVTmD1LgIZWWyvbie9aIns/ANX2wYdh6MWZXInhA8h9u1IJjk0Vjo/v96yR0Ek1V
	 BwbV9mdnyfxjF0TQCnb6BTIEOmOsi0IIgrFcXl67RJeXfFk1UP/LZrlKHWh+UVS6Sg
	 UMwM/GndIzp2S4/KC4gx9o9e/2nTygEv0YHwEqDj1NfZI07IOzCZe2m1zJDCfqneGK
	 mGV8yjIdCYya8S5kQ2ZIRch2rvgV+Uuq2S4bIqkkn6iZsikO4BTIX7LF+bSsUgSmxB
	 RLF7nh1HGoHxA==
Date: Fri, 2 May 2025 13:55:14 -0700 (PDT)
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
Subject: Re: [PATCH v3 5/8] asm-generic: move some parts of Arm's domain_build.h
 to common
In-Reply-To: <bac1324ae98b8cfae12978f7d965d0ecdf8bb769.1746199009.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2505021353150.3879245@ubuntu-linux-20-04-desktop>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com> <bac1324ae98b8cfae12978f7d965d0ecdf8bb769.1746199009.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 2 May 2025, Oleksii Kurochko wrote:
> Nothing changed. Only some functions declaration are moved to xen/include/
> headers as they are expected to be used by common code of domain builing
> or dom0less.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  Chnages in v3:
>  - Drop inclusion of <asm/domain_build.h> from xen/fdt-domain-build.h.
>  - Add empty line after license tag in xen/fdt-domain-build.h.
> ---
>  Chnages in v2:
>   - Add missed declaration of construct_hwdom().
>   - Drop unnessary blank line.
>   - Introduce xen/fdt-domain-build.h and move parts of Arm's domain_build.h to
>     it.
>   - Update the commit message.
> ---
>  xen/arch/arm/acpi/domain_build.c        |  1 +
>  xen/arch/arm/dom0less-build.c           |  1 +
>  xen/arch/arm/domain_build.c             |  1 +
>  xen/arch/arm/include/asm/domain_build.h | 21 ++----------
>  xen/arch/arm/kernel.c                   |  1 +
>  xen/arch/arm/static-shmem.c             |  1 +
>  xen/include/xen/fdt-domain-build.h      | 43 +++++++++++++++++++++++++
>  7 files changed, 51 insertions(+), 18 deletions(-)
>  create mode 100644 xen/include/xen/fdt-domain-build.h
> 
> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
> index f9ca8b47e5..1c3555d814 100644
> --- a/xen/arch/arm/acpi/domain_build.c
> +++ b/xen/arch/arm/acpi/domain_build.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <xen/compile.h>
> +#include <xen/fdt-domain-build.h>
>  #include <xen/fdt-kernel.h>
>  #include <xen/mm.h>
>  #include <xen/sched.h>
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 7eecd06d44..0310579863 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  #include <xen/device_tree.h>
>  #include <xen/domain_page.h>
> +#include <xen/fdt-domain-build.h>
>  #include <xen/fdt-kernel.h>
>  #include <xen/err.h>
>  #include <xen/event.h>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 8c7a054718..9d649b06b3 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  #include <xen/init.h>
>  #include <xen/compile.h>
> +#include <xen/fdt-domain-build.h>
>  #include <xen/fdt-kernel.h>
>  #include <xen/lib.h>
>  #include <xen/llc-coloring.h>
> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
> index df1c0fe301..397e408a1f 100644
> --- a/xen/arch/arm/include/asm/domain_build.h
> +++ b/xen/arch/arm/include/asm/domain_build.h
> @@ -5,28 +5,13 @@
>  #include <xen/sched.h>
>  
>  typedef __be32 gic_interrupt_t[3];
> -typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
> -                                     unsigned int order, void *extra);
> -bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
> -                             alloc_domheap_mem_cb cb, void *extra);
> -bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
> -                          paddr_t tot_size);
> -void allocate_memory(struct domain *d, struct kernel_info *kinfo);
> -int construct_domain(struct domain *d, struct kernel_info *kinfo);
> -int construct_hwdom(struct kernel_info *kinfo,
> -                    const struct dt_device_node *node);
> +
>  int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
> -int make_chosen_node(const struct kernel_info *kinfo);
> -int make_cpus_node(const struct domain *d, void *fdt);
> -int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
> -                         int addrcells, int sizecells);
> -int make_memory_node(const struct kernel_info *kinfo, int addrcells,
> -                     int sizecells, const struct membanks *mem);
>  int make_psci_node(void *fdt);
> -int make_timer_node(const struct kernel_info *kinfo);
>  void evtchn_allocate(struct domain *d);
>  
> -unsigned int get_allocation_size(paddr_t size);
> +int construct_hwdom(struct kernel_info *kinfo,
> +                    const struct dt_device_node *node);

At the end of the series construct_hwdom is only called from within
xen/arch/arm/domain_build.c, so it could be made static and removed from
here. However, one of my review comments was that I think we should
still call construct_hwdom from xen/common/device-tree/dom0less-build.c.
So I think we should keep it.


>  /*
>   * Helper to write an interrupts with the GIC format
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index f00fc388db..5759a3470a 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -7,6 +7,7 @@
>  #include <xen/byteorder.h>
>  #include <xen/domain_page.h>
>  #include <xen/errno.h>
> +#include <xen/fdt-domain-build.h>
>  #include <xen/fdt-kernel.h>
>  #include <xen/guest_access.h>
>  #include <xen/gunzip.h>
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index 14ae48fb1e..1f8441d920 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
>  #include <xen/device_tree.h>
> +#include <xen/fdt-domain-build.h>
>  #include <xen/libfdt/libfdt.h>
>  #include <xen/rangeset.h>
>  #include <xen/sched.h>
> diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
> new file mode 100644
> index 0000000000..b79e9fabfe
> --- /dev/null
> +++ b/xen/include/xen/fdt-domain-build.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __XEN_FDT_DOMAIN_BUILD_H__
> +#define __XEN_FDT_DOMAIN_BUILD_H__
> +
> +#include <xen/bootfdt.h>
> +#include <xen/device_tree.h>
> +#include <xen/fdt-kernel.h>
> +#include <xen/types.h>
> +
> +struct domain;
> +struct page_info;
> +struct membanks;
> +
> +typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
> +                                     unsigned int order, void *extra);
> +bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
> +                             alloc_domheap_mem_cb cb, void *extra);
> +
> +bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
> +                          paddr_t tot_size);
> +void allocate_memory(struct domain *d, struct kernel_info *kinfo);
> +int construct_domain(struct domain *d, struct kernel_info *kinfo);
> +int make_chosen_node(const struct kernel_info *kinfo);
> +int make_cpus_node(const struct domain *d, void *fdt);
> +int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
> +                         int addrcells, int sizecells);
> +int make_memory_node(const struct kernel_info *kinfo, int addrcells,
> +                     int sizecells, const struct membanks *mem);
> +int make_timer_node(const struct kernel_info *kinfo);
> +
> +unsigned int get_allocation_size(paddr_t size);

Many of these functions are not actually moved until later patches. It
would be best to move the declaration at the time the function is also
moved. But if that is difficult for any reason, this is also OK.


> +#endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> -- 
> 2.49.0
> 

