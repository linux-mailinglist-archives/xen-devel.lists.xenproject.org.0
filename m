Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CD93FC02C
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 02:54:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175359.319532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKs2U-0001u8-2i; Tue, 31 Aug 2021 00:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175359.319532; Tue, 31 Aug 2021 00:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKs2T-0001rp-Ur; Tue, 31 Aug 2021 00:54:09 +0000
Received: by outflank-mailman (input) for mailman id 175359;
 Tue, 31 Aug 2021 00:54:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QH02=NW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mKs2S-0001rj-Oc
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 00:54:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5178a044-3df4-42d6-b8d3-3bfc83250c7b;
 Tue, 31 Aug 2021 00:54:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCE9860FE8;
 Tue, 31 Aug 2021 00:54:06 +0000 (UTC)
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
X-Inumbo-ID: 5178a044-3df4-42d6-b8d3-3bfc83250c7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630371247;
	bh=FaKuwKqQUcsjUnrI1i/0e0tvTWt6JI37L5ai0bE4JAo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DevcFLNxq6xZqOWsQh/AAkgdg7TQiENZniFUbZrWShQwDU+A/z4RD0zA+HTnUmgTa
	 yKxN03uM+TZZwzAQPSNQ41OAZifxBsk7r9SID0+NbL7FhXYeyz2ylUIRJl4G6NxIBo
	 gzJjl1K/85BgXn0RKrs5vylkULjzgR8vnNkHUjqPMuiRKlzl4ZzMVAOP5RgDz89BqY
	 nSkNhuqa7BAdLcNSYechHUWZqY8hALAktwrGirpdiLk2J4+DVcjUlwdRg96uBI4UW6
	 cvaDosDEPyMQTlskK/Xd4o4kjyL/2DMFwtKBW5voKDFcyKSRXo/hXKx79h86sL8kyV
	 ib+/59W6s/54A==
Date: Mon, 30 Aug 2021 17:54:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>, julien@xen.org
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, jbeulich@suse.com, 
    Bertrand.Marquis@arm.com
Subject: Re: [XEN RFC PATCH 25/40] xen/arm: unified entry to parse all NUMA
 data from device tree
In-Reply-To: <20210811102423.28908-26-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2108301752501.17851@sstabellini-ThinkPad-T480s>
References: <20210811102423.28908-1-wei.chen@arm.com> <20210811102423.28908-26-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Aug 2021, Wei Chen wrote:
> In this API, we scan whole device tree to parse CPU node id, memory
> node id and distance-map. Though early_scan_node will invoke has a
> handler to process memory nodes. If we want to parse memory node id
> in this handler, we have to embeded NUMA parse code in this handler.
> But we still need to scan whole device tree to find CPU NUMA id and
> distance-map. In this case, we include memory NUMA id parse in this
> API too. Another benefit is that we have a unique entry for device
> tree NUMA data parse.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/numa_device_tree.c | 31 ++++++++++++++++++++++++++++---
>  xen/include/asm-arm/numa.h      |  1 +
>  2 files changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
> index 6e0d1d3d9f..27ffb72f7b 100644
> --- a/xen/arch/arm/numa_device_tree.c
> +++ b/xen/arch/arm/numa_device_tree.c
> @@ -131,7 +131,8 @@ save_memblk:
>  }
>  
>  /* Parse CPU NUMA node info */
> -int __init device_tree_parse_numa_cpu_node(const void *fdt, int node)
> +static int __init
> +device_tree_parse_numa_cpu_node(const void *fdt, int node)
>  {
>      uint32_t nid;
>  
> @@ -147,7 +148,7 @@ int __init device_tree_parse_numa_cpu_node(const void *fdt, int node)
>  }
>  
>  /* Parse memory node NUMA info */
> -int __init
> +static int __init
>  device_tree_parse_numa_memory_node(const void *fdt, int node,
>      const char *name, uint32_t addr_cells, uint32_t size_cells)
>  {
> @@ -202,7 +203,7 @@ device_tree_parse_numa_memory_node(const void *fdt, int node,
>  }
>  
>  /* Parse NUMA distance map v1 */
> -int __init
> +static int __init
>  device_tree_parse_numa_distance_map_v1(const void *fdt, int node)
>  {
>      const struct fdt_property *prop;
> @@ -267,3 +268,27 @@ device_tree_parse_numa_distance_map_v1(const void *fdt, int node)
>  
>      return 0;
>  }
> +
> +static int __init fdt_scan_numa_nodes(const void *fdt,
> +                int node, const char *uname, int depth,
> +                u32 address_cells, u32 size_cells, void *data)
> +{
> +    int ret = 0;
> +
> +    if ( fdt_node_check_type(fdt, node, "cpu") == 0 )
> +        ret = device_tree_parse_numa_cpu_node(fdt, node);
> +    else if ( fdt_node_check_type(fdt, node, "memory") == 0 )
> +        ret = device_tree_parse_numa_memory_node(fdt, node, uname,
> +                                address_cells, size_cells);
> +    else if ( fdt_node_check_compatible(fdt, node,
> +                                "numa-distance-map-v1") == 0 )
> +        ret = device_tree_parse_numa_distance_map_v1(fdt, node);
> +
> +    return ret;
> +}

Julien, do you have an opinion on whether it might be worth reusing the
existing early_scan_node function for this to avoiding another full FDT
scan (to avoid another call to device_tree_for_each_node)?

