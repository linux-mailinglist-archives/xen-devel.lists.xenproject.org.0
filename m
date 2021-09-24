Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B197416994
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 03:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194732.346975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTaIc-0004uw-VL; Fri, 24 Sep 2021 01:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194732.346975; Fri, 24 Sep 2021 01:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTaIc-0004t9-SD; Fri, 24 Sep 2021 01:46:50 +0000
Received: by outflank-mailman (input) for mailman id 194732;
 Fri, 24 Sep 2021 01:46:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTaIb-0004t3-BM
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 01:46:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 213c8d99-62c5-40dd-9b10-afd71bbf6e99;
 Fri, 24 Sep 2021 01:46:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B08D60E54;
 Fri, 24 Sep 2021 01:46:47 +0000 (UTC)
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
X-Inumbo-ID: 213c8d99-62c5-40dd-9b10-afd71bbf6e99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632448007;
	bh=Q4mXo7T9EFe41mvEVyeat151K0Zw1kVacXSGaj5zNYI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OcEjokzaSIkm3CtKitKDV5K7bPGDKQAMg3RuBJ16FspBalFK0pw5xjQfGxoatMsZD
	 WxehN4KESDY5Bff9tnrgdtSybokfoOMsWqQ4P8Ns11AJhOgES5nemp49G1OTjGBRPd
	 64iuDysHwRNItRKDXEofdhDQ/WU1MDlPEsxuvrTAizrpv1kwkP5JHhuqR4icJOAuZq
	 VwFsbt21ttq01o68zdaAkCoacPfuMKMS8XQTjmn8Bj0aCESf7W2qSKAxcMEJoNPTdT
	 4iVG+3OrAl1cF5xDLqpsUH4+MD/RiCsvRTifj1mMFCwMDB0N20mYEkSeJTR113Jq07
	 IyZVpkg0RvjkA==
Date: Thu, 23 Sep 2021 18:46:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH 23/37] xen/arm: implement node distance helpers for Arm
In-Reply-To: <20210923120236.3692135-24-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231843530.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-24-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> We will parse NUMA nodes distances from device tree or ACPI
> table. So we need a matrix to record the distances between
> any two nodes we parsed. Accordingly, we provide this
> node_set_distance API for device tree or ACPI table parsers
> to set the distance for any two nodes in this patch.
> When NUMA initialization failed, __node_distance will return
> NUMA_REMOTE_DISTANCE, this will help us avoid doing rollback
> for distance maxtrix when NUMA initialization failed.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/Makefile      |  1 +
>  xen/arch/arm/numa.c        | 69 ++++++++++++++++++++++++++++++++++++++
>  xen/include/asm-arm/numa.h | 13 +++++++
>  3 files changed, 83 insertions(+)
>  create mode 100644 xen/arch/arm/numa.c
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index ae4efbf76e..41ca311b6b 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_LIVEPATCH) += livepatch.o
>  obj-y += mem_access.o
>  obj-y += mm.o
>  obj-y += monitor.o
> +obj-$(CONFIG_NUMA) += numa.o
>  obj-y += p2m.o
>  obj-y += percpu.o
>  obj-y += platform.o
> diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
> new file mode 100644
> index 0000000000..3f08870d69
> --- /dev/null
> +++ b/xen/arch/arm/numa.c
> @@ -0,0 +1,69 @@
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
> +#include <xen/numa.h>
> +
> +static uint8_t __read_mostly
> +node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
> +    { 0 }
> +};
> +
> +void __init numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance)
> +{
> +    if ( from >= MAX_NUMNODES || to >= MAX_NUMNODES )
> +    {
> +        printk(KERN_WARNING
> +               "NUMA: invalid nodes: from=%"PRIu8" to=%"PRIu8" MAX=%"PRIu8"\n",
> +               from, to, MAX_NUMNODES);
> +        return;
> +    }
> +
> +    /* NUMA defines 0xff as an unreachable node and 0-9 are undefined */
> +    if ( distance >= NUMA_NO_DISTANCE ||
> +        (distance >= NUMA_DISTANCE_UDF_MIN &&
> +         distance <= NUMA_DISTANCE_UDF_MAX) ||
> +        (from == to && distance != NUMA_LOCAL_DISTANCE) )
> +    {
> +        printk(KERN_WARNING
> +               "NUMA: invalid distance: from=%"PRIu8" to=%"PRIu8" distance=%"PRIu32"\n",
> +               from, to, distance);
> +        return;
> +    }
> +
> +    node_distance_map[from][to] = distance;
> +}
> +
> +uint8_t __node_distance(nodeid_t from, nodeid_t to)
> +{
> +    /* When NUMA is off, any distance will be treated as remote. */
> +    if ( srat_disabled() )

Given that this is ARM specific code and specific to ACPI, I don't think
we should have any call to something called "srat_disabled".

I suggest to either rename srat_disabled to numa_distance_disabled.

Other than that, this patch looks OK to me.


> +        return NUMA_REMOTE_DISTANCE;
> +
> +    /*
> +     * Check whether the nodes are in the matrix range.
> +     * When any node is out of range, except from and to nodes are the
> +     * same, we treat them as unreachable (return 0xFF)
> +     */
> +    if ( from >= MAX_NUMNODES || to >= MAX_NUMNODES )
> +        return from == to ? NUMA_LOCAL_DISTANCE : NUMA_NO_DISTANCE;
> +
> +    return node_distance_map[from][to];
> +}
> +EXPORT_SYMBOL(__node_distance);
> diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> index 21569e634b..758eafeb05 100644
> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -9,8 +9,21 @@ typedef u8 nodeid_t;
>  
>  #ifdef CONFIG_NUMA
>  
> +/*
> + * In ACPI spec, 0-9 are the reserved values for node distance,
> + * 10 indicates local node distance, 20 indicates remote node
> + * distance. Set node distance map in device tree will follow
> + * the ACPI's definition.
> + */
> +#define NUMA_DISTANCE_UDF_MIN   0
> +#define NUMA_DISTANCE_UDF_MAX   9
> +#define NUMA_LOCAL_DISTANCE     10
> +#define NUMA_REMOTE_DISTANCE    20
> +
>  #define NR_NODE_MEMBLKS NR_MEM_BANKS
>  
> +extern void numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance);
> +
>  #else
>  
>  /* Fake one node for now. See also node_online_map. */
> -- 
> 2.25.1
> 

