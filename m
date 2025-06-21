Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDCFAE26D6
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 03:21:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021412.1397403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSmua-00027t-W9; Sat, 21 Jun 2025 01:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021412.1397403; Sat, 21 Jun 2025 01:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSmua-00026S-Su; Sat, 21 Jun 2025 01:20:52 +0000
Received: by outflank-mailman (input) for mailman id 1021412;
 Sat, 21 Jun 2025 01:20:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5F1A=ZE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uSmuZ-00026M-P9
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 01:20:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f675163d-4e3d-11f0-a30e-13f23c93f187;
 Sat, 21 Jun 2025 03:20:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 963E35C697A;
 Sat, 21 Jun 2025 01:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F00C4CEE3;
 Sat, 21 Jun 2025 01:20:45 +0000 (UTC)
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
X-Inumbo-ID: f675163d-4e3d-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750468847;
	bh=N/nbsujw+3kQq1xM04ZJE47bDz1RNUPYc9dI3AIt14U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QvzZjQULjoaBLUKOkvCJEAtbf6BfCBZWVDOsOc16eDmBsMGf2LAChBSxXUz2ZTm0x
	 y2Z0l0n9maY5FM0FKN19pKjFL7fnU0Jxo3iAUTIXqejIWwWE7cWk+bbVj7uGtX2aia
	 AoYiq9i6AceeU9ZmpJNY9n7++gAe0RBvpnGHuwxxGNFjRBAaarYpDsWrveX+wzxhv2
	 jRQW6tuUTeW0u0Dt8XlVVCn3yQBsexK7RXbXkpHR0TkNHkWCKSGciTS3hI1yduot2B
	 5mXDCjgORbYhjayaLa/LHznXMJRlCwd8mXJ/Io3fvKWc4hFW/5IroCDb7XbjKPdQb7
	 Dn20d6INGdtYw==
Date: Fri, 20 Jun 2025 18:20:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, Dario Faggioli <dfaggioli@suse.com>, 
    Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: Re: [PATCH v4 06/12] xen/dt: Move bootfdt functions to
 xen/bootfdt.h
In-Reply-To: <20250620182859.23378-7-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506201817010.2978375@ubuntu-linux-20-04-desktop>
References: <20250620182859.23378-1-agarciav@amd.com> <20250620182859.23378-7-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Jun 2025, Alejandro Vallejo wrote:
> Part of an unpicking process to extract bootfdt contents independent of bootinfo
> to a separate file for x86 to take.
> 
> Move functions required for early FDT parsing from device_tree.h and arm's
> setup.h onto bootfdt.h
> 
> Declaration motion only. Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> v4:
>   * Remove bootfdt.h include from device_tree.h
>     (move dt_read_paddr and fix up
>      static-evtchn.c +
>      device-tree.c +
>      boot-cpupool.c +
>      riscv/smpboot.c +
>      riscv/cpufeature.c)
> ---
>  xen/arch/riscv/cpufeature.c            |  1 +
>  xen/arch/riscv/smpboot.c               |  1 +
>  xen/common/device-tree/device-tree.c   |  1 +
>  xen/common/device-tree/static-evtchn.c |  1 +
>  xen/common/sched/boot-cpupool.c        |  1 +
>  xen/include/xen/bootfdt.h              | 91 ++++++++++++++++++++++++++
>  xen/include/xen/device_tree.h          | 66 -------------------
>  7 files changed, 96 insertions(+), 66 deletions(-)
> 
> diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
> index b7d5ec6580..b846a106a3 100644
> --- a/xen/arch/riscv/cpufeature.c
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <xen/bitmap.h>
> +#include <xen/bootfdt.h>
>  #include <xen/ctype.h>
>  #include <xen/device_tree.h>
>  #include <xen/errno.h>
> diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
> index 470f6d1311..3b8bf98e20 100644
> --- a/xen/arch/riscv/smpboot.c
> +++ b/xen/arch/riscv/smpboot.c
> @@ -1,3 +1,4 @@
> +#include <xen/bootfdt.h>
>  #include <xen/cpumask.h>
>  #include <xen/device_tree.h>
>  #include <xen/errno.h>
> diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
> index 886e6c7712..725ff71646 100644
> --- a/xen/common/device-tree/device-tree.c
> +++ b/xen/common/device-tree/device-tree.c
> @@ -7,6 +7,7 @@
>   * benh@kernel.crashing.org
>   */
>  
> +#include <xen/bootfdt.h>
>  #include <xen/types.h>
>  #include <xen/init.h>
>  #include <xen/guest_access.h>
> diff --git a/xen/common/device-tree/static-evtchn.c b/xen/common/device-tree/static-evtchn.c
> index 8b82e6b3d8..88342b44a1 100644
> --- a/xen/common/device-tree/static-evtchn.c
> +++ b/xen/common/device-tree/static-evtchn.c
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> +#include <xen/bootfdt.h>
>  #include <xen/event.h>
>  #include <xen/static-evtchn.h>
>  
> diff --git a/xen/common/sched/boot-cpupool.c b/xen/common/sched/boot-cpupool.c
> index 641f3495cb..03be73efdd 100644
> --- a/xen/common/sched/boot-cpupool.c
> +++ b/xen/common/sched/boot-cpupool.c
> @@ -7,6 +7,7 @@
>   * Copyright (C) 2022 Arm Ltd.
>   */
>  
> +#include <xen/bootfdt.h>
>  #include <xen/acpi.h>
>  #include <xen/sched.h>
>  
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 8ea52290b7..0846317f30 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -2,8 +2,11 @@
>  #ifndef XEN_BOOTFDT_H
>  #define XEN_BOOTFDT_H
>  
> +#include <xen/byteorder.h>
> +#include <xen/bug.h>
>  #include <xen/types.h>
>  #include <xen/kernel.h>
> +#include <xen/lib.h>
>  #include <xen/macros.h>
>  #include <xen/xmalloc.h>
>  
> @@ -16,8 +19,80 @@
>  #define NR_MEM_BANKS 256
>  #define NR_SHMEM_BANKS 32
>  
> +/* Default #address and #size cells */
> +#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
> +#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
> +
>  #define MAX_MODULES 32 /* Current maximum useful modules */
>  
> +#define DEVICE_TREE_MAX_DEPTH 16
> +
> +/* Helper to read a big number; size is in cells (not bytes) */
> +static inline u64 dt_read_number(const __be32 *cell, int size)
> +{
> +    u64 r = 0;
> +
> +    while ( size-- )
> +        r = (r << 32) | be32_to_cpu(*(cell++));
> +    return r;
> +}
> +
> +/* Wrapper for dt_read_number() to return paddr_t (instead of uint64_t) */
> +static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
> +{
> +    uint64_t dt_r;
> +    paddr_t r;
> +
> +    /*
> +     * dt_read_number will return uint64_t whereas paddr_t may not be 64-bit.
> +     * Thus, there is an implicit cast from uint64_t to paddr_t.
> +     */
> +    dt_r = dt_read_number(cell, size);
> +
> +    if ( dt_r != (paddr_t)dt_r )
> +    {
> +        printk("Physical address greater than max width supported\n");
> +        WARN();
> +    }
> +
> +    /*
> +     * Xen will truncate the address/size if it is greater than the maximum
> +     * supported width and it will give an appropriate warning.
> +     */
> +    r = dt_r;
> +
> +    return r;
> +}
> +
> +static inline u64 dt_next_cell(int s, const __be32 **cellp)
> +{
> +    const __be32 *p = *cellp;
> +
> +    *cellp = p + s;
> +    return dt_read_number(p, s);
> +}
> +
> +typedef int (*device_tree_node_func)(const void *fdt,
> +                                     int node, const char *name, int depth,
> +                                     u32 address_cells, u32 size_cells,
> +                                     void *data);
> +
> +/**
> + * device_tree_for_each_node - iterate over all device tree sub-nodes
> + * @fdt: flat device tree.
> + * @node: parent node to start the search from
> + * @func: function to call for each sub-node.
> + * @data: data to pass to @func.
> + *
> + * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
> + *
> + * Returns 0 if all nodes were iterated over successfully.  If @func
> + * returns a value different from 0, that value is returned immediately.
> + */
> +int device_tree_for_each_node(const void *fdt, int node,
> +                              device_tree_node_func func,
> +                              void *data);
> +
>  typedef enum {
>      BOOTMOD_XEN,
>      BOOTMOD_FDT,
> @@ -260,4 +335,20 @@ static inline struct membanks *membanks_xzalloc(unsigned int nr,
>      return banks;
>  }
>  
> +/*
> + * Interpret the property `prop_name` of `node` as a u32.
> + *
> + * Returns the property value on success; otherwise returns `dflt`.
> + */
> +u32 device_tree_get_u32(const void *fdt, int node,
> +                        const char *prop_name, u32 dflt);
> +
> +/*
> + * Interpret the property `prop_name` of `node` as a "reg".
> + *
> + * Returns outputs in `start` and `size`.
> + */
> +void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> +                         uint32_t size_cells, paddr_t *start, paddr_t *size);
> +
>  #endif /* XEN_BOOTFDT_H */
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 75017e4266..b6d16756fc 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -22,8 +22,6 @@
>  #include <xen/list.h>
>  #include <xen/rwlock.h>
>  
> -#define DEVICE_TREE_MAX_DEPTH 16
> -
>  /*
>   * Struct used for matching a device
>   */
> @@ -164,17 +162,8 @@ struct dt_raw_irq {
>      u32 specifier[DT_MAX_IRQ_SPEC];
>  };
>  
> -typedef int (*device_tree_node_func)(const void *fdt,
> -                                     int node, const char *name, int depth,
> -                                     u32 address_cells, u32 size_cells,
> -                                     void *data);
> -
>  extern const void *device_tree_flattened;
>  
> -int device_tree_for_each_node(const void *fdt, int node,
> -                              device_tree_node_func func,
> -                              void *data);
> -
>  /**
>   * dt_unflatten_host_device_tree - Unflatten the host device tree
>   *
> @@ -245,10 +234,6 @@ void intc_dt_preinit(void);
>  #define dt_node_cmp(s1, s2) strcasecmp((s1), (s2))
>  #define dt_compat_cmp(s1, s2) strcasecmp((s1), (s2))
>  
> -/* Default #address and #size cells */
> -#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
> -#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
> -
>  #define dt_for_each_property_node(dn, pp)                   \
>      for ( pp = (dn)->properties; (pp) != NULL; pp = (pp)->next )
>  
> @@ -258,43 +243,6 @@ void intc_dt_preinit(void);
>  #define dt_for_each_child_node(dt, dn)                      \
>      for ( dn = (dt)->child; (dn) != NULL; dn = (dn)->sibling )
>  
> -/* Helper to read a big number; size is in cells (not bytes) */
> -static inline u64 dt_read_number(const __be32 *cell, int size)
> -{
> -    u64 r = 0;
> -
> -    while ( size-- )
> -        r = (r << 32) | be32_to_cpu(*(cell++));
> -    return r;
> -}

I committed your other patch so this doesn't apply any longer.

Other than that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

