Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0201AD9960
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 03:17:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015161.1393097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQFW4-0001Ip-Bi; Sat, 14 Jun 2025 01:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015161.1393097; Sat, 14 Jun 2025 01:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQFW4-0001Gj-97; Sat, 14 Jun 2025 01:17:04 +0000
Received: by outflank-mailman (input) for mailman id 1015161;
 Sat, 14 Jun 2025 01:17:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SRxw=Y5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uQFW2-0001Gd-Ts
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 01:17:02 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 457687ce-48bd-11f0-a309-13f23c93f187;
 Sat, 14 Jun 2025 03:17:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B1E06A50F80;
 Sat, 14 Jun 2025 01:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8C3C4CEE3;
 Sat, 14 Jun 2025 01:16:58 +0000 (UTC)
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
X-Inumbo-ID: 457687ce-48bd-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749863819;
	bh=6JESW/cI/lnx2FyTaKKVLeDgkRtZNQyle9Q+LwpGlYk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=H7JCwUnCkTeXgXF0yk7DVzQKMs28wh/Kloj2ZElpjgD7ECfLc2T2392MHyNeZ0QCF
	 QRq3abskyXXygsdzNU3t6kyF09MKbZf5ytgrucTmiJQXrHLJNIalXZZO3qNvbRWcNW
	 n20OXATtTHy6Bin9JE0ASHFRN9SgIk1SJXYlFbEvDIR7vWCY/nDKEjEKfObM4wzOtp
	 YghJoEZ7I25BLKIZYZagYGhO1AXDEqyFSF0RwY2+52hvb8vIptbdrJEDJ81vYlYb05
	 JkKsQeW9APycXE+Z1y/Hy6Gv949bDTqaHkA66zB0g8z8PnQ7exg8Rhg681PIGBrZ6J
	 9asyw2s9K+l5g==
Date: Fri, 13 Jun 2025 18:16:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 08/14] xen/dt: Move bootfdt functions to
 xen/bootfdt.h
In-Reply-To: <20250613151612.754222-9-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506131815200.8480@ubuntu-linux-20-04-desktop>
References: <20250613151612.754222-1-agarciav@amd.com> <20250613151612.754222-9-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Jun 2025, Alejandro Vallejo wrote:
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
> v3:
>   * Avoid mutations during code motion
> ---
>  xen/include/xen/bootfdt.h     | 62 +++++++++++++++++++++++++++++++++++
>  xen/include/xen/device_tree.h | 40 +---------------------
>  2 files changed, 63 insertions(+), 39 deletions(-)
> 
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 8ea52290b7..b6ae7d6aa6 100644
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
> @@ -260,4 +306,20 @@ static inline struct membanks *membanks_xzalloc(unsigned int nr,
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
> index 75017e4266..0a22b1ba1d 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -10,6 +10,7 @@
>  #ifndef __XEN_DEVICE_TREE_H__
>  #define __XEN_DEVICE_TREE_H__
>  
> +#include <xen/bootfdt.h>
>  #include <xen/byteorder.h>

This should not be needed?


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
> @@ -949,12 +917,6 @@ int dt_get_pci_domain_nr(struct dt_device_node *node);
>  
>  struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
>  
> -void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> -                         uint32_t size_cells, paddr_t *start, paddr_t *size);
> -
> -u32 device_tree_get_u32(const void *fdt, int node,
> -                        const char *prop_name, u32 dflt);
> -
>  #ifdef CONFIG_DEVICE_TREE_DEBUG
>  #define dt_dprintk(fmt, args...)  \
>      printk(XENLOG_DEBUG fmt, ## args)
> -- 
> 2.43.0
> 

