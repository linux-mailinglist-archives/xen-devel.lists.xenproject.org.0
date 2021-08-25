Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7290D3F76AA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 15:56:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172392.314537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mItNx-0000Qo-Fz; Wed, 25 Aug 2021 13:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172392.314537; Wed, 25 Aug 2021 13:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mItNx-0000Od-CD; Wed, 25 Aug 2021 13:56:09 +0000
Received: by outflank-mailman (input) for mailman id 172392;
 Wed, 25 Aug 2021 13:56:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mItNv-0000OL-RV
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 13:56:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mItNu-0006SH-Vi; Wed, 25 Aug 2021 13:56:06 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mItNu-0006Pk-Pw; Wed, 25 Aug 2021 13:56:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=n/AU32IRlgscmQqHqg2VsAxf/1pZSghjHTm4YaO3jTE=; b=jQMNIl+7X3grwBQkLTcB6aPo0o
	PonqcyXFuZfFwKvH1CNC854wA7Mbh3X1uQbKovoxoJ7rxjltjVp4vz7UIDZb6p8moRGjRcCNn97GU
	se9DKEm5DrJlfKOHqPg5X9m/xJMr+NdPhQDvCUv3/B6OMgdw6lFWIHDjHH6HFAeWlaCo=;
Subject: Re: [XEN RFC PATCH 24/40] xen/arm: introduce a helper to parse device
 tree NUMA distance map
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Jan Beulich <jbeulich@suse.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-25-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e15cdda1-1665-4baa-5764-76e17dd3bb74@xen.org>
Date: Wed, 25 Aug 2021 14:56:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-25-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:24, Wei Chen wrote:
> A NUMA aware device tree will provide a "distance-map" node to
> describe distance between any two nodes. This patch introduce a

s/introduce/introduces/

> new helper to parse this distance map.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/numa_device_tree.c | 67 +++++++++++++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
> 
> diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
> index bbe081dcd1..6e0d1d3d9f 100644
> --- a/xen/arch/arm/numa_device_tree.c
> +++ b/xen/arch/arm/numa_device_tree.c
> @@ -200,3 +200,70 @@ device_tree_parse_numa_memory_node(const void *fdt, int node,
>   
>       return 0;
>   }
> +
> +/* Parse NUMA distance map v1 */
> +int __init
> +device_tree_parse_numa_distance_map_v1(const void *fdt, int node)
> +{
> +    const struct fdt_property *prop;
> +    const __be32 *matrix;
> +    int entry_count, len, i;

entry_count and i should be unsigned. len unfortunately can't because 
fdt_get_property expects a signed int.

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

I understand that entry_count may be 0. But I can't see how it can be 
negative as the property len cannot be (even if it is a signed type). So 
I think this wants to be "== 0".

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

You can use dt_next_cell() which will update the pointer for you.

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
> +    }
> +
> +    return 0;
> +}
> 

Cheers,

-- 
Julien Grall

