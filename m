Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587D7416A4C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 05:05:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194785.347075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTbWR-0003Vk-7f; Fri, 24 Sep 2021 03:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194785.347075; Fri, 24 Sep 2021 03:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTbWR-0003Ss-4K; Fri, 24 Sep 2021 03:05:11 +0000
Received: by outflank-mailman (input) for mailman id 194785;
 Fri, 24 Sep 2021 03:05:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTbWO-0003Sl-SJ
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 03:05:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38bc3e24-1ce4-11ec-ba9b-12813bfff9fa;
 Fri, 24 Sep 2021 03:05:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8BC160EE4;
 Fri, 24 Sep 2021 03:05:06 +0000 (UTC)
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
X-Inumbo-ID: 38bc3e24-1ce4-11ec-ba9b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632452706;
	bh=/eA7/u9DaTW6tNWxh5lPmgqSrcwL+FYI1a0bOogpyOM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cxbYxoMB1iplY7Kz+9HKEjO5N72QFskIAAluWg1zC7IMv9wTOULt8kPHZkl/ETZ9w
	 OHpRnaleRIL+9kj8a944tcEkgIkw84c7PsWwwPl9Z2WOLlS1VVjLge0owiqu16EcmO
	 POuYZaXBJJ86RH1vV+sx2RmZzA8S50ZOIqJR3yEjHwHXoDnqWlMEaaTZV0jxphWATC
	 2rP5WoSQe2DJszKUgEmSfKH6rzUjz8VuhRKdQuYm5Uv6MGzghpvafXYXTRK23zQ8zt
	 c5FDX+GfpzL5gT2LX1ws+ezx1Y9H538eZZUGDBeDegHHANOgB6P/i31KnXMHmO9clG
	 /1UnlBE0hRpcg==
Date: Thu, 23 Sep 2021 20:05:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH 31/37] xen/arm: introduce a helper to parse device tree
 NUMA distance map
In-Reply-To: <20210923120236.3692135-32-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231958250.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-32-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> A NUMA aware device tree will provide a "distance-map" node to
> describe distance between any two nodes. This patch introduce a
> new helper to parse this distance map.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/numa_device_tree.c | 106 ++++++++++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 
> diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
> index 7918a397fa..e7fa84df4c 100644
> --- a/xen/arch/arm/numa_device_tree.c
> +++ b/xen/arch/arm/numa_device_tree.c
> @@ -136,3 +136,109 @@ static int __init fdt_parse_numa_memory_node(const void *fdt, int node,
>  
>      return 0;
>  }
> +
> +
> +/* Parse NUMA distance map v1 */
> +static int __init fdt_parse_numa_distance_map_v1(const void *fdt, int node)
> +{
> +    const struct fdt_property *prop;
> +    const __be32 *matrix;
> +    uint32_t entry_count;
> +    int len, i;
> +
> +    printk(XENLOG_INFO "NUMA: parsing numa-distance-map\n");
> +
> +    prop = fdt_get_property(fdt, node, "distance-matrix", &len);
> +    if ( !prop )
> +    {
> +        printk(XENLOG_WARNING
> +               "NUMA: No distance-matrix property in distance-map\n");

I haven't seen where this is called from yet but make sure to print an
error here only if NUMA info is actually expected and required, not on
regular non-NUMA boots on non-NUMA machines.


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
> +    if ( entry_count == 0 )
> +    {
> +        printk(XENLOG_WARNING "NUMA: Invalid distance-matrix\n");
> +
> +        return -EINVAL;
> +    }
> +
> +    matrix = (const __be32 *)prop->data;
> +    for ( i = 0; i + 2 < entry_count; i += 3 )
> +    {
> +        uint32_t from, to, distance, opposite;
> +
> +        from = dt_next_cell(1, &matrix);
> +        to = dt_next_cell(1, &matrix);
> +        distance = dt_next_cell(1, &matrix);
> +        if ( (from == to && distance != NUMA_LOCAL_DISTANCE) ||
> +            (from != to && distance <= NUMA_LOCAL_DISTANCE) )
> +        {
> +            printk(XENLOG_WARNING
> +                   "NUMA: Invalid distance: NODE#%u->NODE#%u:%u\n",
> +                   from, to, distance);
> +            return -EINVAL;
> +        }
> +
> +        printk(XENLOG_INFO "NUMA: distance: NODE#%u->NODE#%u:%u\n",
> +               from, to, distance);
> +
> +        /* Get opposite way distance */
> +        opposite = __node_distance(from, to);

This is not checking for the opposite node distance but...


> +        if ( opposite == 0 )
> +        {
> +            /* Bi-directions are not set, set both */
> +            numa_set_distance(from, to, distance);
> +            numa_set_distance(to, from, distance);

...since you set both directions here at once then it is OK. You are
checking if this direction has already been set which is correct I
think. But the comment "Get opposite way distance" and the variable name
"opposite" are wrong.


> +        }
> +        else
> +        {
> +            /*
> +             * Opposite way distance has been set to a different value.
> +             * It may be a firmware device tree bug?
> +             */
> +            if ( opposite != distance )
> +            {
> +                /*
> +                 * In device tree NUMA distance-matrix binding:
> +                 * https://www.kernel.org/doc/Documentation/devicetree/bindings/numa.txt
> +                 * There is a notes mentions:
> +                 * "Each entry represents distance from first node to
> +                 *  second node. The distances are equal in either
> +                 *  direction."
> +                 *
> +                 * That means device tree doesn't permit this case.
> +                 * But in ACPI spec, it cares to specifically permit this
> +                 * case:
> +                 * "Except for the relative distance from a System Locality
> +                 *  to itself, each relative distance is stored twice in the
> +                 *  matrix. This provides the capability to describe the
> +                 *  scenario where the relative distances for the two
> +                 *  directions between System Localities is different."
> +                 *
> +                 * That means a real machine allows such NUMA configuration.
> +                 * So, place a WARNING here to notice system administrators,
> +                 * is it the specail case that they hijack the device tree
> +                 * to support their rare machines?
> +                 */
> +                printk(XENLOG_WARNING
> +                       "Un-matched bi-direction! NODE#%u->NODE#%u:%u, NODE#%u->NODE#%u:%u\n",
> +                       from, to, distance, to, from, opposite);

PRIu32


> +            }
> +
> +            /* Opposite way distance has been set, just set this way */
> +            numa_set_distance(from, to, distance);
> +        }
> +    }
> +
> +    return 0;
> +}
> -- 
> 2.25.1
> 

