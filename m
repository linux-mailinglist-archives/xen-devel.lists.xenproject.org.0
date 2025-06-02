Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61619ACBC44
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 22:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003803.1383416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMBj4-000194-OM; Mon, 02 Jun 2025 20:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003803.1383416; Mon, 02 Jun 2025 20:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMBj4-00016z-Ln; Mon, 02 Jun 2025 20:25:42 +0000
Received: by outflank-mailman (input) for mailman id 1003803;
 Mon, 02 Jun 2025 20:25:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+w/=YR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uMBj3-00016t-QN
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 20:25:41 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be4e5753-3fef-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 22:25:38 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1748895930344260.98692996946454;
 Mon, 2 Jun 2025 13:25:30 -0700 (PDT)
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
X-Inumbo-ID: be4e5753-3fef-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; t=1748895932; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HKzHGpEXYnRqGPCUZkth+IDpmu5A0WYc9TeI7GmpfXAgfIujcJsynV2gunhlCRjB/xAghjroyAs4aJG9dp82gsxHl2EVKobt0fF/DhCmx7ln6W2wujvFRzxc6R0Hktf0vdRVYm//tbZKaGMqmmkAW33Hds773T/T1NzUZkDIXvo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748895932; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OFbGuhWeDFUWODp5A9qftGfaGuYqssnm/PhkfG9YU5w=; 
	b=KxomQ/5+NJpEQwXuUc+gG28Pji4yjQfmlm0JVwhOpiOmTFnZRpBJzk7jm+NREknj1iFD7HPjfTDva4vHsdfJBr+93qwpbbQio4zLi8DecfYloXc05HSNvGtWomrnMFO6YvfaVPWSTAdPAPtCybJB2t1Nlk0PXrhGslGbcn/PzRI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748895932;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=OFbGuhWeDFUWODp5A9qftGfaGuYqssnm/PhkfG9YU5w=;
	b=mlhx98A3RzWDcWBp1F/+rPLX2TlRSx98QyzoIcTZ9GR9kyv2AF8UGTqVZuTk3tuz
	yeEEjweC2ByB8zZSgjyHxeaH9cXPXt74r82QhPHJ6iKL3G8nMRdg5B8dRkT56hc51Ty
	pxsdbagBqiNwYOHEwfS10dlPZ5UGZY2S6AO5Cqzw=
Message-ID: <a66c11c4-cfac-4934-b1f5-e07c728db8de@apertussolutions.com>
Date: Mon, 2 Jun 2025 16:25:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] xen/dt: Move bootfdt functions to xen/bootfdt.h
Content-Language: en-US
To: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-13-agarciav@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <20250530120242.39398-13-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/30/25 08:02, Alejandro Vallejo wrote:
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
>   xen/arch/arm/include/asm/setup.h |  6 ----
>   xen/include/xen/bootfdt.h        | 62 ++++++++++++++++++++++++++++++++
>   xen/include/xen/device_tree.h    | 34 +-----------------
>   3 files changed, 63 insertions(+), 39 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 0f9e531a34..32308837a9 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -55,12 +55,6 @@ void setup_mm(void);
>   extern uint32_t hyp_traps_vector[];
>   void init_traps(void);
>   
> -void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> -                         uint32_t size_cells, paddr_t *start, paddr_t *size);
> -
> -u32 device_tree_get_u32(const void *fdt, int node,
> -                        const char *prop_name, u32 dflt);
> -
>   int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>                     struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
>   
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index fa65e8fcf4..079259c719 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -2,6 +2,7 @@
>   #ifndef XEN_BOOTFDT_H
>   #define XEN_BOOTFDT_H
>   
> +#include <xen/byteorder.h>
>   #include <xen/types.h>
>   #include <xen/kernel.h>
>   #include <xen/macros.h>
> @@ -16,8 +17,53 @@
>   #define NR_MEM_BANKS 256
>   #define NR_SHMEM_BANKS 32
>   
> +/* Default #address and #size cells */
> +#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
> +#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
> +
>   #define MAX_MODULES 32 /* Current maximum useful modules */
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

I know you are trying to keep code changes to a minimal but let's not 
allow poorly constructed logic like this to continue to persist. This is 
an unbounded, arbitrary read function that is feed parameters via 
externally input. The DT spec declares only two number types for a 
property, u32 and u64, see Table 2.3 in Section 2.2.4. There is no 
reason to have an unbounded, arbitrary read function lying around 
waiting to be leveraged in exploitation.


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
>   typedef enum {
>       BOOTMOD_XEN,
>       BOOTMOD_FDT,
> @@ -246,4 +292,20 @@ static inline struct membanks *membanks_xzalloc(unsigned int nr,
>       return banks;
>   }
>   
> +/*
> + * Interpret the property `prop_name` of `node` as a u32.
> + *
> + * Returns the property value on success; otherwise returns `dflt`.
> + */
> +uint32_t device_tree_get_u32(const void *fdt, int node,
> +                             const char *prop_name, uint32_t dflt);
> +
> +/*
> + * Interpret the property `prop_name` of `node` as a "reg".
> + *
> + * Returns outputs in `start` and `size`.
> + */
> +void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> +                         uint32_t size_cells, paddr_t *start, paddr_t *size);
> +
>   #endif /* XEN_BOOTFDT_H */
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 6dc1fb5159..0a22b1ba1d 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -10,6 +10,7 @@
>   #ifndef __XEN_DEVICE_TREE_H__
>   #define __XEN_DEVICE_TREE_H__
>   
> +#include <xen/bootfdt.h>
>   #include <xen/byteorder.h>
>   
>   #include <asm/device.h>
> @@ -22,8 +23,6 @@
>   #include <xen/list.h>
>   #include <xen/rwlock.h>
>   
> -#define DEVICE_TREE_MAX_DEPTH 16
> -
>   /*
>    * Struct used for matching a device
>    */
> @@ -164,17 +163,8 @@ struct dt_raw_irq {
>       u32 specifier[DT_MAX_IRQ_SPEC];
>   };
>   
> -typedef int (*device_tree_node_func)(const void *fdt,
> -                                     int node, const char *name, int depth,
> -                                     u32 address_cells, u32 size_cells,
> -                                     void *data);
> -
>   extern const void *device_tree_flattened;
>   
> -int device_tree_for_each_node(const void *fdt, int node,
> -                              device_tree_node_func func,
> -                              void *data);
> -
>   /**
>    * dt_unflatten_host_device_tree - Unflatten the host device tree
>    *
> @@ -245,10 +235,6 @@ void intc_dt_preinit(void);
>   #define dt_node_cmp(s1, s2) strcasecmp((s1), (s2))
>   #define dt_compat_cmp(s1, s2) strcasecmp((s1), (s2))
>   
> -/* Default #address and #size cells */
> -#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
> -#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
> -
>   #define dt_for_each_property_node(dn, pp)                   \
>       for ( pp = (dn)->properties; (pp) != NULL; pp = (pp)->next )
>   
> @@ -258,16 +244,6 @@ void intc_dt_preinit(void);
>   #define dt_for_each_child_node(dt, dn)                      \
>       for ( dn = (dt)->child; (dn) != NULL; dn = (dn)->sibling )
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
>   /* Wrapper for dt_read_number() to return paddr_t (instead of uint64_t) */
>   static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
>   {
> @@ -307,14 +283,6 @@ static inline int dt_size_to_cells(int bytes)
>       return (bytes / sizeof(u32));
>   }
>   
> -static inline u64 dt_next_cell(int s, const __be32 **cellp)
> -{
> -    const __be32 *p = *cellp;
> -
> -    *cellp = p + s;
> -    return dt_read_number(p, s);
> -}
> -
>   static inline const char *dt_node_full_name(const struct dt_device_node *np)
>   {
>       return (np && np->full_name) ? np->full_name : "<no-node>";


