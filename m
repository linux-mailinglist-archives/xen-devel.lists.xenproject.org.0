Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13755AC98C6
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 03:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001817.1381945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLB48-00005k-RO; Sat, 31 May 2025 01:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001817.1381945; Sat, 31 May 2025 01:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLB48-0008Uc-OO; Sat, 31 May 2025 01:31:16 +0000
Received: by outflank-mailman (input) for mailman id 1001817;
 Sat, 31 May 2025 01:31:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uLB48-0008UV-6X
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 01:31:16 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb8a871d-3dbe-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 03:31:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A0030629C1;
 Sat, 31 May 2025 01:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39C9C4CEEB;
 Sat, 31 May 2025 01:31:02 +0000 (UTC)
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
X-Inumbo-ID: eb8a871d-3dbe-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748655064;
	bh=rv7lPS6+auAT5hK2K2IgNJt16xMYG8TE0eU6HMgZpNA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PPkc23PWADq38BY4qX9q4w/6gPxGHDD5bTLImLKkkGqJzPvmTBtwITPlLn9+g7t7N
	 +0lQ8n7YdHVlDUnN/socawhM2o52he/9Ey4ytdfMQTlZ6cgIKk3p1SZMkWcHJAkiAc
	 9SdtQ/BUfjuL7GYdGh5Kskp/STcqlllbVVQlyYe2tOCbMkh0ozB7svGtm2pzzoOH7j
	 vnruOclQJ/gwZYuNVVrpWRlDuWvm9Z1QBx09l1AHyjRlCymAkHwZblprrIG23QiVdk
	 zCcuFXlWZfnBLPtfZQ9VPsjBTvRmKvbdUYOnqTaxweW+qZ8K0wD2tYQ2MuiwC8e43K
	 bcbJ4PCI9HFag==
Date: Fri, 30 May 2025 18:31:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 12/19] xen/dt: Move bootfdt functions to xen/bootfdt.h
In-Reply-To: <20250530120242.39398-13-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505301830170.1147082@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-13-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Alejandro Vallejo wrote:
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
>  xen/arch/arm/include/asm/setup.h |  6 ----
>  xen/include/xen/bootfdt.h        | 62 ++++++++++++++++++++++++++++++++
>  xen/include/xen/device_tree.h    | 34 +-----------------
>  3 files changed, 63 insertions(+), 39 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 0f9e531a34..32308837a9 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -55,12 +55,6 @@ void setup_mm(void);
>  extern uint32_t hyp_traps_vector[];
>  void init_traps(void);
>  
> -void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> -                         uint32_t size_cells, paddr_t *start, paddr_t *size);
> -
> -u32 device_tree_get_u32(const void *fdt, int node,
> -                        const char *prop_name, u32 dflt);
> -
>  int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>                    struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
>  
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index fa65e8fcf4..079259c719 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -2,6 +2,7 @@
>  #ifndef XEN_BOOTFDT_H
>  #define XEN_BOOTFDT_H
>  
> +#include <xen/byteorder.h>
>  #include <xen/types.h>
>  #include <xen/kernel.h>
>  #include <xen/macros.h>
> @@ -16,8 +17,53 @@
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
> @@ -246,4 +292,20 @@ static inline struct membanks *membanks_xzalloc(unsigned int nr,
>      return banks;
>  }
>  
> +/*
> + * Interpret the property `prop_name` of `node` as a u32.
> + *
> + * Returns the property value on success; otherwise returns `dflt`.
> + */
> +uint32_t device_tree_get_u32(const void *fdt, int node,
> +                             const char *prop_name, uint32_t dflt);

The u32->uint32_t change is fine by me but you also need to change the
implementation otherwise we are going to get a MISRA error declaration
!= definition.

I'll take this opportunity to suggest you scan this series through
MISRA.


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
> index 6dc1fb5159..0a22b1ba1d 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -10,6 +10,7 @@
>  #ifndef __XEN_DEVICE_TREE_H__
>  #define __XEN_DEVICE_TREE_H__
>  
> +#include <xen/bootfdt.h>
>  #include <xen/byteorder.h>
>  
>  #include <asm/device.h>
> @@ -22,8 +23,6 @@
>  #include <xen/list.h>
>  #include <xen/rwlock.h>
>  
> -#define DEVICE_TREE_MAX_DEPTH 16
> -
>  /*
>   * Struct used for matching a device
>   */
> @@ -164,17 +163,8 @@ struct dt_raw_irq {
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
> @@ -245,10 +235,6 @@ void intc_dt_preinit(void);
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
> @@ -258,16 +244,6 @@ void intc_dt_preinit(void);
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
> -
>  /* Wrapper for dt_read_number() to return paddr_t (instead of uint64_t) */
>  static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
>  {
> @@ -307,14 +283,6 @@ static inline int dt_size_to_cells(int bytes)
>      return (bytes / sizeof(u32));
>  }
>  
> -static inline u64 dt_next_cell(int s, const __be32 **cellp)
> -{
> -    const __be32 *p = *cellp;
> -
> -    *cellp = p + s;
> -    return dt_read_number(p, s);
> -}
> -
>  static inline const char *dt_node_full_name(const struct dt_device_node *np)
>  {
>      return (np && np->full_name) ? np->full_name : "<no-node>";
> -- 
> 2.43.0
> 

