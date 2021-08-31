Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 756433FC01B
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 02:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175354.319521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKrx1-0000Nn-DN; Tue, 31 Aug 2021 00:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175354.319521; Tue, 31 Aug 2021 00:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKrx1-0000L1-AK; Tue, 31 Aug 2021 00:48:31 +0000
Received: by outflank-mailman (input) for mailman id 175354;
 Tue, 31 Aug 2021 00:48:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QH02=NW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mKrx0-0000Kv-9P
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 00:48:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 413dc68a-b9c8-48d8-b762-ccd5ca69ac26;
 Tue, 31 Aug 2021 00:48:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2700F600AA;
 Tue, 31 Aug 2021 00:48:28 +0000 (UTC)
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
X-Inumbo-ID: 413dc68a-b9c8-48d8-b762-ccd5ca69ac26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630370908;
	bh=If2g6gvLVaIRjJVL76Tu4sVZuWVIkgyVgQVdB5EiF6M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JnCTwWnE9tVvHCE3fIkr7wEA7WfnAir66bu5fISq122Ejfsj108Jm6MMPmLV87GNS
	 iRw/bnUr4iuk6HzBj+SbcSVW47M/WWHNjBTiFp9PUs6NJs5DPFHCAAChItD9rze7pb
	 anV88LKyLZrJjb0+oWTll+s1He1AbDdwD5GOpm+PLwJpWNHn74zWTu6rL8OEsGmQYg
	 mtrSm7m9oC5PFkzavaiW1a6M8d7aKpdthAf/ycWMhLTDzAse/XAK+e1ADSQ+DdOp+l
	 MnuMr3UmUCjFOIIjLiAuE3LHmPL3DuYbI424DP3zIdzXTrHNtDc9fbDnHjq+hv1FKs
	 vzrPUGrrQLuTA==
Date: Mon, 30 Aug 2021 17:48:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    jbeulich@suse.com, Bertrand.Marquis@arm.com
Subject: Re: [XEN RFC PATCH 24/40] xen/arm: introduce a helper to parse device
 tree NUMA distance map
In-Reply-To: <20210811102423.28908-25-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2108301740500.17851@sstabellini-ThinkPad-T480s>
References: <20210811102423.28908-1-wei.chen@arm.com> <20210811102423.28908-25-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Aug 2021, Wei Chen wrote:
> A NUMA aware device tree will provide a "distance-map" node to
> describe distance between any two nodes. This patch introduce a
> new helper to parse this distance map.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/numa_device_tree.c | 67 +++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
> index bbe081dcd1..6e0d1d3d9f 100644
> --- a/xen/arch/arm/numa_device_tree.c
> +++ b/xen/arch/arm/numa_device_tree.c
> @@ -200,3 +200,70 @@ device_tree_parse_numa_memory_node(const void *fdt, int node,
>  
>      return 0;
>  }
> +
> +/* Parse NUMA distance map v1 */
> +int __init
> +device_tree_parse_numa_distance_map_v1(const void *fdt, int node)
> +{
> +    const struct fdt_property *prop;
> +    const __be32 *matrix;
> +    int entry_count, len, i;
> +
> +    printk(XENLOG_INFO "NUMA: parsing numa-distance-map\n");
> +
> +    prop = fdt_get_property(fdt, node, "distance-matrix", &len);
> +    if ( !prop )
> +    {
> +        printk(XENLOG_WARNING
> +               "NUMA: No distance-matrix property in distance-map\n");
> +
> +        return -EINVAL;
> +    }
> +
> +    if ( len % sizeof(uint32_t) != 0 )
> +    {
> +        printk(XENLOG_WARNING
> +               "distance-matrix in node is not a multiple of u32\n");
> +        return -EINVAL;
> +    }
> +
> +    entry_count = len / sizeof(uint32_t);
> +    if ( entry_count <= 0 )
> +    {
> +        printk(XENLOG_WARNING "NUMA: Invalid distance-matrix\n");
> +
> +        return -EINVAL;
> +    }
> +
> +    matrix = (const __be32 *)prop->data;
> +    for ( i = 0; i + 2 < entry_count; i += 3 )
> +    {
> +        uint32_t from, to, distance;
> +
> +        from = dt_read_number(matrix, 1);
> +        matrix++;
> +        to = dt_read_number(matrix, 1);
> +        matrix++;
> +        distance = dt_read_number(matrix, 1);
> +        matrix++;
> +
> +        if ( (from == to && distance != NUMA_LOCAL_DISTANCE) ||
> +            (from != to && distance <= NUMA_LOCAL_DISTANCE) )
> +        {
> +            printk(XENLOG_WARNING
> +                   "Invalid nodes' distance from node#%d to node#%d = %d\n",
> +                   from, to, distance);
> +            return -EINVAL;
> +        }
> +
> +        printk(XENLOG_INFO "NUMA: distance from node#%d to node#%d = %d\n",
> +               from, to, distance);
> +        numa_set_distance(from, to, distance);
> +
> +        /* Set default distance of node B->A same as A->B */
> +        if (to > from)
> +             numa_set_distance(to, from, distance);

I am a bit unsure about this last 2 lines: why calling numa_set_distance
in the opposite direction only when to > from? Wouldn't it be OK to
always do both:

numa_set_distance(from, to, distance);
numa_set_distance(to, from, distance);

?


But in any case, I have a different suggestion. The binding states that
"distances are equal in either direction". Also it has an example where
only one direction is expressed unfortunately (at the end of the
document).

So my suggestion is to parse it as follows:

- call numa_set_distance just once from
  device_tree_parse_numa_distance_map_v1

- in numa_set_distance:
    - set node_distance_map[from][to] = distance;
    - check node_distance_map[to][from]
          - if unset, node_distance_map[to][from] = distance;
          - if already set to the same value, return success;
          - if already set to a different value, return error;

