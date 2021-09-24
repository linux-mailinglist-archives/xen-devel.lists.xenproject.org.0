Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FB3416A4D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 05:05:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194787.347085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTbWa-0003oj-Fx; Fri, 24 Sep 2021 03:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194787.347085; Fri, 24 Sep 2021 03:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTbWa-0003mg-CR; Fri, 24 Sep 2021 03:05:20 +0000
Received: by outflank-mailman (input) for mailman id 194787;
 Fri, 24 Sep 2021 03:05:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTbWZ-0003m4-D6
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 03:05:19 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f4306e2-1ce4-11ec-ba9b-12813bfff9fa;
 Fri, 24 Sep 2021 03:05:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B69C561100;
 Fri, 24 Sep 2021 03:05:17 +0000 (UTC)
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
X-Inumbo-ID: 3f4306e2-1ce4-11ec-ba9b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632452717;
	bh=zPiaRw7Cz/4I+LwHkh6RTKYtKX7KOesVkVjlk0A4+cw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EnKN3lalzWoCdXne81kvbfgkUTKoJmqtwspMo1y9x96Zifq5dQo8VgAwS0joKmZgr
	 VT0x/KZ6jaoyQD+Yhip83BTEKjmXk+t2Z+ApY2kZO6n9J34PI3qQcJsdl8MIWV8ZCj
	 EU7W8j9ayS/DVVQ8TAvQle5yeM9AcfW1u0NINZiIbv5HMoQimi25+7UZlQPqt4h/PU
	 xVe9Trv1LIgYiNyJAsuaDpnvQTZ+9adSrVd2JxkyOweRfibGcJr+3SunRH1VSegjgq
	 Kv5pUn3fwyCmYkzV1AIVvdjjtYBZecsMrF7UL6hIpiBBlj4GchPulq0D8aZ3lpHejE
	 /QGyaVqqyd6FA==
Date: Thu, 23 Sep 2021 20:05:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH 30/37] xen/arm: introduce a helper to parse device tree
 memory node
In-Reply-To: <20210923120236.3692135-31-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231945190.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-31-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> Memory blocks' NUMA ID information is stored in device tree's
> memory nodes as "numa-node-id". We need a new helper to parse
> and verify this ID from memory nodes.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

There are tabs for indentation in this patch, we use spaces.


> ---
>  xen/arch/arm/numa_device_tree.c | 80 +++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
> index 2428fbae0b..7918a397fa 100644
> --- a/xen/arch/arm/numa_device_tree.c
> +++ b/xen/arch/arm/numa_device_tree.c
> @@ -42,6 +42,35 @@ static int __init fdt_numa_processor_affinity_init(nodeid_t node)
>      return 0;
>  }
>  
> +/* Callback for parsing of the memory regions affinity */
> +static int __init fdt_numa_memory_affinity_init(nodeid_t node,
> +                                paddr_t start, paddr_t size)

Please align the parameters


> +{
> +    int ret;
> +
> +    if ( srat_disabled() )
> +    {
> +        return -EINVAL;
> +    }
> +
> +	if ( !numa_memblks_available() )
> +	{
> +		dprintk(XENLOG_WARNING,
> +                "Too many numa entry, try bigger NR_NODE_MEMBLKS \n");
> +		bad_srat();
> +		return -EINVAL;
> +	}
> +
> +	ret = numa_update_node_memblks(node, start, size, false);
> +	if ( ret != 0 )
> +	{
> +		bad_srat();
> +	    return -EINVAL;
> +	}
> +
> +    return 0;
> +}

Aside from spaces/tabs, this is a lot better!


>  /* Parse CPU NUMA node info */
>  static int __init fdt_parse_numa_cpu_node(const void *fdt, int node)
>  {
> @@ -56,3 +85,54 @@ static int __init fdt_parse_numa_cpu_node(const void *fdt, int node)
>  
>      return fdt_numa_processor_affinity_init(nid);
>  }
> +
> +/* Parse memory node NUMA info */
> +static int __init fdt_parse_numa_memory_node(const void *fdt, int node,
> +    const char *name, uint32_t addr_cells, uint32_t size_cells)

Please align the parameters


> +{
> +    uint32_t nid;
> +    int ret = 0, len;
> +    paddr_t addr, size;
> +    const struct fdt_property *prop;
> +    uint32_t idx, ranges;
> +    const __be32 *addresses;
> +
> +    nid = device_tree_get_u32(fdt, node, "numa-node-id", MAX_NUMNODES);
> +    if ( nid >= MAX_NUMNODES )
> +    {
> +        printk(XENLOG_WARNING "Node id %u exceeds maximum value\n", nid);
> +        return -EINVAL;
> +    }
> +
> +    prop = fdt_get_property(fdt, node, "reg", &len);
> +    if ( !prop )
> +    {
> +        printk(XENLOG_WARNING
> +               "fdt: node `%s': missing `reg' property\n", name);
> +        return -EINVAL;
> +    }
> +
> +    addresses = (const __be32 *)prop->data;
> +    ranges = len / (sizeof(__be32)* (addr_cells + size_cells));
> +    for ( idx = 0; idx < ranges; idx++ )
> +    {
> +        device_tree_get_reg(&addresses, addr_cells, size_cells, &addr, &size);
> +        /* Skip zero size ranges */
> +        if ( !size )
> +            continue;
> +
> +        ret = fdt_numa_memory_affinity_init(nid, addr, size);
> +        if ( ret ) {
> +            return -EINVAL;
> +        }
> +    }

I take it would be difficult to parse numa-node-id and call
fdt_numa_memory_affinity_init from
xen/arch/arm/bootfdt.c:device_tree_get_meminfo. Is it because
device_tree_get_meminfo is called too early?


> +    if ( idx == 0 )
> +    {
> +        printk(XENLOG_ERR
> +               "bad property in memory node, idx=%d ret=%d\n", idx, ret);
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> -- 
> 2.25.1
> 

