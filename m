Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 731EB416A1D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 04:45:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194772.347052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTbCv-0008FI-4m; Fri, 24 Sep 2021 02:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194772.347052; Fri, 24 Sep 2021 02:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTbCv-0008DX-1Z; Fri, 24 Sep 2021 02:45:01 +0000
Received: by outflank-mailman (input) for mailman id 194772;
 Fri, 24 Sep 2021 02:44:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTbCt-0008DR-8f
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 02:44:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67c7a4c2-1ce1-11ec-ba99-12813bfff9fa;
 Fri, 24 Sep 2021 02:44:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19669610C9;
 Fri, 24 Sep 2021 02:44:57 +0000 (UTC)
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
X-Inumbo-ID: 67c7a4c2-1ce1-11ec-ba99-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632451497;
	bh=DHPIrhRky9S/lVBCYIdFlkJ1ph5Q83A2LaJS2PruxFM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PRShDCR3z0V80XN/6RHhCTL1WEl8igLrx1Dr7fyulx4BdIfzf2dIlLcHerhmfWSsp
	 KWCX2ZemeQvNsmMVB0HdLd9TZT+APuzz4fBPltvdiAbwADvGD+zPMh1KL6/Rr5ACam
	 0T2tWA4m1ZnGIkbv8U24CTDmxCIsZ6i0QUZdubT5WIDAT42GzyZ2oG6ylTG9vLMXDn
	 n/1xZ/7BU8z6lgd4lkHxP3V7q7xQhSgJzfiuzb/UJ/l5C9kaYmCMqgbpX4GpoPPdzv
	 VtCYnEbz3uE6vOlag/yQG4Ql7zU7pRn8rXLwuhxSUXekyFxOckq4pg27PJLyXw5QzG
	 FSHHnFsDaVJwA==
Date: Thu, 23 Sep 2021 19:44:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH 29/37] xen/arm: introduce a helper to parse device tree
 processor node
In-Reply-To: <20210923120236.3692135-30-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231940110.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-30-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> Processor NUMA ID information is stored in device tree's processor
> node as "numa-node-id". We need a new helper to parse this ID from
> processor node. If we get this ID from processor node, this ID's
> validity still need to be checked. Once we got a invalid NUMA ID
> from any processor node, the device tree will be marked as NUMA
> information invalid.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/Makefile           |  1 +
>  xen/arch/arm/numa_device_tree.c | 58 +++++++++++++++++++++++++++++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644 xen/arch/arm/numa_device_tree.c
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 41ca311b6b..c50df2c25d 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -36,6 +36,7 @@ obj-y += mem_access.o
>  obj-y += mm.o
>  obj-y += monitor.o
>  obj-$(CONFIG_NUMA) += numa.o
> +obj-$(CONFIG_DEVICE_TREE_NUMA) += numa_device_tree.o
>  obj-y += p2m.o
>  obj-y += percpu.o
>  obj-y += platform.o
> diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
> new file mode 100644
> index 0000000000..2428fbae0b
> --- /dev/null
> +++ b/xen/arch/arm/numa_device_tree.c
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Arm Architecture support layer for NUMA.
> + *
> + * Copyright (C) 2021 Arm Ltd
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + *
> + */
> +#include <xen/init.h>
> +#include <xen/nodemask.h>
> +#include <xen/numa.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/device_tree.h>
> +
> +/* Callback for device tree processor affinity */
> +static int __init fdt_numa_processor_affinity_init(nodeid_t node)
> +{
> +    if ( srat_disabled() )
> +        return -EINVAL;

fdt_numa_processor_affinity_init is called by fdt_parse_numa_cpu_node
which is already parsing NUMA related info. Should this srat_disabled
check be moved to fdt_parse_numa_cpu_node?


> +    else if ( node == NUMA_NO_NODE || node >= MAX_NUMNODES )
> +    {
> +        bad_srat();
> +        return -EINVAL;
> +	}
> +
> +    numa_set_processor_nodes_parsed(node);
> +    fw_numa = 1;
> +
> +    printk(KERN_INFO "DT: NUMA node %"PRIu7" processor parsed\n", node);
> +
> +    return 0;
> +}
> +
> +/* Parse CPU NUMA node info */
> +static int __init fdt_parse_numa_cpu_node(const void *fdt, int node)
> +{
> +    uint32_t nid;
> +
> +    nid = device_tree_get_u32(fdt, node, "numa-node-id", MAX_NUMNODES);
> +    if ( nid >= MAX_NUMNODES )
> +    {
> +        printk(XENLOG_ERR "Node id %u exceeds maximum value\n", nid);
                                      ^ PRIu32


> +        return -EINVAL;
> +    }
> +
> +    return fdt_numa_processor_affinity_init(nid);
> +}
> -- 
> 2.25.1
> 

