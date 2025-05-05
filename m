Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5C3AA9D15
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 22:20:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976403.1363564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC2I4-0005j4-Ts; Mon, 05 May 2025 20:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976403.1363564; Mon, 05 May 2025 20:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC2I4-0005gx-RK; Mon, 05 May 2025 20:19:52 +0000
Received: by outflank-mailman (input) for mailman id 976403;
 Mon, 05 May 2025 20:19:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/1y=XV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uC2I3-0005gr-F7
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 20:19:51 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 439a21e9-29ee-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 22:19:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B4BA14A60A;
 Mon,  5 May 2025 20:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E00C4CEED;
 Mon,  5 May 2025 20:19:33 +0000 (UTC)
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
X-Inumbo-ID: 439a21e9-29ee-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746476375;
	bh=9QzdqWQzlY8mmANonXjZYlJmP6G69bzQ/ebjcS17X4U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Fg2W5gglvEU5kFI6EI6cYgQt0nytDxgxKBe5nRBmt4AacTbZd0ZnsqFb6Zl8KdxW8
	 3vw7fJiC/iX0vzhvbdp/Zqo1Z8dgnFDdnQXe919BHp7SaTY+0EjNd3SOe/8sO5IBkx
	 OAaEI58xMWEO+0EIHAsTXh1RNH4MmdiJDg22O61EYKYxPv/t7Ku4cvzO5Wi72bOywf
	 HYFe7OnLBSOYweYrzCM/2uMIOJWGGghd4OZMEvxg5gvWbyeZkBmmMy7+crSfl/XhKz
	 SYaYKVUtbBtmGxzu5/nlGrWrjQtdIenixwoOsPFaDovljksEiw4JpAbesscpPMVHSe
	 Iejf4TJAUKdcA==
Date: Mon, 5 May 2025 13:19:32 -0700 (PDT)
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
Subject: Re: [PATCH v4 5/8] asm-generic: move some parts of Arm's domain_build.h
 to common
In-Reply-To: <3e8bcf195a5c7bec8b32aaf01a128dcb25e68b9e.1746468003.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2505051319110.3879245@ubuntu-linux-20-04-desktop>
References: <cover.1746468003.git.oleksii.kurochko@gmail.com> <3e8bcf195a5c7bec8b32aaf01a128dcb25e68b9e.1746468003.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 May 2025, Oleksii Kurochko wrote:
> Nothing changed. Only some functions declaration are moved to xen/include/
> headers as they are expected to be used by common code of domain builing
> or dom0less.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Chnages in v4:
>  - Move declaration of allocate_*() to the patch where defintions of them are introduced.
>  - Move declaration of 'int construct_hwdom(struct kernel_info *kinfo,
>    const struct dt_device_node *node) to fdt-domain-build.h.
>  - Drop declaration of get_allocation_size() from fdt-domain-build.h as defintion/declaration
>    will be added in the further patch of this patch series.
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
>  xen/arch/arm/include/asm/domain_build.h | 11 +-------
>  xen/arch/arm/kernel.c                   |  1 +
>  xen/arch/arm/static-shmem.c             |  1 +
>  xen/include/xen/fdt-domain-build.h      | 35 +++++++++++++++++++++++++
>  7 files changed, 41 insertions(+), 10 deletions(-)
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
> index 7e9cedb0c8..47eb38b9ad 100644
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
> index df1c0fe301..9d72108f35 100644
> --- a/xen/arch/arm/include/asm/domain_build.h
> +++ b/xen/arch/arm/include/asm/domain_build.h
> @@ -9,21 +9,12 @@ typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
>                                       unsigned int order, void *extra);
>  bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
>                               alloc_domheap_mem_cb cb, void *extra);
> +

NIT: no need for new line

I can fix on commit

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

>  bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
>                            paddr_t tot_size);
>  void allocate_memory(struct domain *d, struct kernel_info *kinfo);
> -int construct_domain(struct domain *d, struct kernel_info *kinfo);
> -int construct_hwdom(struct kernel_info *kinfo,
> -                    const struct dt_device_node *node);
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
>  unsigned int get_allocation_size(paddr_t size);
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 34c8233853..aea8f44413 100644
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
> index 0000000000..30d5358a0f
> --- /dev/null
> +++ b/xen/include/xen/fdt-domain-build.h
> @@ -0,0 +1,35 @@
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
> +int construct_domain(struct domain *d, struct kernel_info *kinfo);
> +int construct_hwdom(struct kernel_info *kinfo,
> +                    const struct dt_device_node *node);
> +int make_chosen_node(const struct kernel_info *kinfo);
> +int make_cpus_node(const struct domain *d, void *fdt);
> +int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
> +                         int addrcells, int sizecells);
> +int make_memory_node(const struct kernel_info *kinfo, int addrcells,
> +                     int sizecells, const struct membanks *mem);
> +int make_timer_node(const struct kernel_info *kinfo);
> +
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

