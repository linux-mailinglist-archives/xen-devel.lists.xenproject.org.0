Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAE7A3BBB0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 11:30:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892592.1301556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhLi-0004jW-Rt; Wed, 19 Feb 2025 10:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892592.1301556; Wed, 19 Feb 2025 10:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhLi-0004hH-OX; Wed, 19 Feb 2025 10:30:38 +0000
Received: by outflank-mailman (input) for mailman id 892592;
 Wed, 19 Feb 2025 10:30:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tkhLh-0004fy-3d
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 10:30:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tkhLg-00AZrs-2U;
 Wed, 19 Feb 2025 10:30:36 +0000
Received: from [15.248.2.31] (helo=[10.24.66.255])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tkhLg-0021Gf-0h;
 Wed, 19 Feb 2025 10:30:36 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Mm9yWofGMymIIA37T/XSzMaufetZUNbiMpifKmaXhl4=; b=sHefF+xWZBYc8U5kvg/NzLFjjc
	oFwvj+e1aLvvIqH9z3COiL9J/XVeTrqDIU0R/+moNslU/XM22DKjSO6SwzeWCPs7OvRieZSSJc8fk
	aZHVAG4Qd0NWTBmdZZZJvO9K2TuzgOadIDVh+aiTqzWPO329cB50pOyc2SueLOxW3seU=;
Message-ID: <921bd786-f0d1-4c3f-ba3f-8a9e6c517572@xen.org>
Date: Wed, 19 Feb 2025 10:30:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/dom0less: support for vcpu affinity
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, dpsmith@apertussolutions.com,
 xenia.ragiadakou@amd.com
References: <alpine.DEB.2.22.394.2502181227580.1085376@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2502181227580.1085376@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 18/02/2025 20:29, Stefano Stabellini wrote:
> Add vcpu affinity to the dom0less bindings. Example:
> 
>      dom1 {
>              ...
>              cpus = <4>;
>              vcpu0 {
>                     compatible = "xen,vcpu-affinity";

I would prefer if the compatible is "xen,vcpu". This would allow us to 
extend for anything that vCPU specific. I would also look less odd if 
someone ...

>                     id = <0>;
>                     hard-affinity = "4-7";

... doesn't specify hard-affinity which is optional.

>              };
>              vcpu1 {
>                     compatible = "xen,vcpu-affinity";
>                     id = <1>;
>                     hard-affinity = "0-3";

NIT: This example is exactly the same as vcpu0. How about changing to a 
list of range/single value? This would make clear that a mix is possible.

>              };
>              vcpu2 {
>                     compatible = "xen,vcpu-affinity";
>                     id = <2>;
>                     hard-affinity = "1,6";
>              };
>              ...
> 
> Note that the property hard-affinity is optional. It is possible to add
> other properties in the future not only to specify soft affinity, but
> also to provide more precise methods for configuring affinity. For
> instance, on ARM the MPIDR could be use to specify the pCPU. For now, it
> is left to the future.
> 
> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v3:
> - improve commit message
> - improve binding doc
> - add panic on invalid pCPU
> - move parsing to a separate function
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 9c881baccc..10e55c825c 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -324,6 +324,27 @@ The ramdisk sub-node has the following properties:
>       property because it will be created by the UEFI stub on boot.
>       This option is needed only when UEFI boot is used.
>   
> +Under the "xen,domain" compatible node, it is possible optionally to add
> +one or more sub-nodes to configure vCPU affinity. The vCPU affinity
> +sub-node has the following properties:
> +
> +- compatible
> +
> +    "xen,vcpu-affinity"
> +
> +- id
> +
> +    A 32-bit integer that specifies the vCPU id. 0 is the first vCPU.
> +    The last vCPU is cpus-1, where "cpus" is the number of vCPUs
> +    specified with the "cpus" property under the "xen,domain" node.

I think it would be worth mentioning that each node must have a unique 
ID. It is not necessary to check in the code, but it would avoid the 
question of what happen if someone specify twice the VCPU with different 
affinity.

> +
> +- hard-affinity
> +
> +    Optional. A string specifying the hard affinity configuration for the
> +    vCPU: a comma-separated list of pCPUs or ranges of pCPUs is used.
> +    Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive
> +    on both sides. The numbers refer to pCPU ids.

Technically MPIDRs are pCPUs ID. So I would add "logical" in front of 
pCPU ids to make clear what IDs are we talking about

> +
>   
>   Example
>   =======

No update to the example?

> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 49d1f14d65..e364820189 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -810,6 +810,68 @@ static int __init construct_domU(struct domain *d,
>       return rc;
>   }
>   
> +static void __init domain_vcpu_affinity(struct domain *d,
> +                                        const struct dt_device_node *node)
 > +{> +    const char *hard_affinity_str = NULL;
> +    struct dt_device_node *np;
> +    uint32_t val;
> +    int rc;

Can you expain why 'rc', 'val', 'hard_affinity_str' are defined outside 
of the loop when ...

> +
> +    dt_for_each_child_node(node, np)
> +    {
> +        const char *s;
> +        struct vcpu *v;
> +        cpumask_t affinity;

... they are not? Yet they have the same property (i.e. only called 
within the loop).

> +
> +        if ( !dt_device_is_compatible(np, "xen,vcpu-affinity") )
> +            continue;
> +
> +        if ( !dt_property_read_u32(np, "id", &val) )

Looking at the binding you wrote, "id" is mandatory. So I think we 
should throw an error if it is not present.

> +            continue;
 > +> +        if ( val >= d->max_vcpus )
> +            panic("Invalid vcpu_id %u for domain %s\n", val, dt_node_name(node));

NIT: Maybe print the maximum number of vCPUs? This would make easier to 
know what's wrong with the ID.

> +
> +        v = d->vcpu[val];
> +        rc = dt_property_read_string(np, "hard-affinity", &hard_affinity_str);
> +        if ( rc < 0 )
> +            continue;
> +
> +        s = hard_affinity_str;

OOI, you don't seem to use hard_affinity_str afterwards, so why can't we 
use 'hard_affinity_str' directly and avoid an extra variable?

> +        cpumask_clear(&affinity);
> +        while ( *s != '\0' )
> +        {
> +            unsigned int start, end;
> +
> +            start = simple_strtoul(s, &s, 0);
> +
> +            if ( *s == '-' )    /* Range */
> +            {
> +                s++;
> +                end = simple_strtoul(s, &s, 0);
> +            }
> +            else                /* Single value */
> +                end = start;
> +
> +            if ( end >= nr_cpu_ids )
> +                panic("Invalid pCPU %u for domain %s\n", end, dt_node_name(node));
> +
> +            for ( ; start <= end; start++ )
> +                cpumask_set_cpu(start, &affinity);
> +
> +            if ( *s == ',' )
> +                s++;
> +            else if ( *s != '\0' )
> +                break;

NIT: We seem to have various place in Xen parsing range (e.g. 
init_boot_pages()). Could we provide an helper to avoid duplicating the 
code?

> +        }
> +
> +        rc = vcpu_set_hard_affinity(v, &affinity);
> +        if ( rc )
> +            panic("vcpu%d: failed to set hard affinity\n", v->vcpu_id);

Can we print the domain name like you do before and also 'rc'? This 
would help any debugging.


> +    }
> +}
> +
>   void __init create_domUs(void)
>   {
>       struct dt_device_node *node;
> @@ -992,6 +1054,8 @@ void __init create_domUs(void)
>           if ( rc )
>               panic("Could not set up domain %s (rc = %d)\n",
>                     dt_node_name(node), rc);
> +
> +        domain_vcpu_affinity(d, node);

Shouldn't this call be part of construct_domU?

>       }
>   }
>   

Cheers,

-- 
Julien Grall


