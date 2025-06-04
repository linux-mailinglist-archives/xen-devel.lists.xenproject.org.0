Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9008AACDE1B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 14:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005486.1384943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMnKs-0007Js-PM; Wed, 04 Jun 2025 12:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005486.1384943; Wed, 04 Jun 2025 12:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMnKs-0007IQ-Mq; Wed, 04 Jun 2025 12:35:14 +0000
Received: by outflank-mailman (input) for mailman id 1005486;
 Wed, 04 Jun 2025 12:35:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMnKr-0007IK-58
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 12:35:13 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5af4853f-4140-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 14:35:11 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a375888197so3521965f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 05:35:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afeab82csm11380773b3a.55.2025.06.04.05.35.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 05:35:09 -0700 (PDT)
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
X-Inumbo-ID: 5af4853f-4140-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749040510; x=1749645310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1tAd5m2TcM3QJHb3JDxfCf5+jsBmE8HBnvy/3Jh1sts=;
        b=bR0lK1m3U7oUxzKvuRf5GcVl5LHbrq1wxDKN1NQETMFtZGY06RRuLAPLZuwUxyK45t
         sCnS6C65fKB4QrDcq57rNs7zCzXKi1GNZnmFbDLuRpkVv7q7AOgC/L/vzTX3eGfQImy5
         xla8adJv2qcegOfhC4I9EsKj8aUX7y5d02SpKpITMaSnxrymAqsO8AHicptk+PFcIqOA
         eQbo6j6//0xyggLB0Qjw1UffFyckUDt6hu623m82joUrHPPFWEbUMrJ71DroaXcoETPt
         X4Wd/E/hrdNLidvKZsfT0yd2iISjhBOXnBZ8PqfrkqfnZ4l6Qxz4Fxw6eDrLf6SHlCVD
         VczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749040510; x=1749645310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tAd5m2TcM3QJHb3JDxfCf5+jsBmE8HBnvy/3Jh1sts=;
        b=g2McoOcO21fJQfH4saOyeUegBXO8NY7VtdR1MLt4woD4wxUqjdjgnYNbHaSJ5zgN18
         e5JeAUCvRelUKOPo70j5i1dftTRflCOPKRwdT/Uh5VMcRGEgNv/ijXCYKzOc9JLckY5p
         LMYaRwKdt5sn963FrWL7RxXgdlaqvl63jpuPNiJuFkPFw8I2jVijqNM/JDO3xn03dx7c
         Z7oV+9f577D+uQ+S+rVjmzWbcUU6Mcva84Dd1rY4aLiPmugGVJbEg5ubdTMdmYTQVPqz
         kmVHenM6AFlZze6x7LbhCWt/f+ew1vNQ1DlfgmMzJeUBx0IghGyDnPMg61Db7TYfY2r1
         aseQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOQCYfQ1XrF8EeEs50Laqc7ZnuvslMvmPU9Ba8cN2yIkwkro07Lp/dXmgXUiZ9V0m2SBxfjv5GCUM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbQQWemedaXx4GzyNxkkFnyjjp7FoyF8cR+b3anwFCxALBb+Yd
	UfhOLP2oC0e+tQB4pdFBXiYt2EbWkRpbkWqsEzBg0lKVbQFH+JFte6sM6c7JLrB+zA==
X-Gm-Gg: ASbGncuNUI9Uy3YOGy1lNbsp5FueIV8hVtP4sGox+sMQdeaMYPuR/JigW+X6d+GX997
	fUz6u92EstCtW8bnfMwhEf5uqBZRRWcYBr2ed+IbKqsXNxt7GFGPWEFoddNyY8RFNlbanRlzLr8
	+TV0mWl8dLpitnmsNhXi2SwsgS3XQ5n+II/x/PyjTn+pHOmLXtI3Bff9dcFojgXF+hcayWW7rhT
	HD7INiitOGBOYOOaiuUyuytkDO6MyiSWFqHdy1q7aU8eRmyckkc5pvhkpCXElpbrI+YT40cWXFH
	p09qbwuStU0JYvIuRs/PiXvmTfo+En041rqbHgqbL97wE60zI2/yBaSmaTAaYHCb5A8yE+FxyMo
	icpLTY6hwisdLy3cdUlrfyXUk2UxLMG9+IOJO
X-Google-Smtp-Source: AGHT+IFe5xYdohDuhW9RkI44ugFsu2qAySQWdut7u0gzj5yoBiqyHmWVaMgK37lDMAUnIdj8tIqIwg==
X-Received: by 2002:a05:6000:430c:b0:3a4:f435:5801 with SMTP id ffacd0b85a97d-3a51d923793mr2129251f8f.17.1749040510348;
        Wed, 04 Jun 2025 05:35:10 -0700 (PDT)
Message-ID: <d3856421-59ce-4cd1-9fc5-ad330bf760ca@suse.com>
Date: Wed, 4 Jun 2025 14:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/numa: introduce per-NUMA node flush locks
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250522084815.825-1-roger.pau@citrix.com>
 <20250522084815.825-3-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250522084815.825-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2025 10:48, Roger Pau Monne wrote:
> Contention around the global flush_lock increases as the amount of physical
> CPUs on the host also increases.  Sadly this doesn't scale on big boxes.
> However most of the time Xen doesn't require broadcasting flushes to all
> CPUs on the system, and hence more fine grained (ie: covering less CPUs)
> locks could be used.
> 
> A natural boundary to use when splitting the locks are NUMA nodes.  Most
> domains will be limited to running on a single node, specifically the one
> where the domain memory has been allocated from.  Flushes related to
> domains are most likely to be limited to a single NUMA node, and hence
> being able to execute per-node flushes allows to reduce the contention
> around the global flush_lock, while also allowing to perform concurrent
> flushes on different nodes.
> 
> This however doesn't come for free.  A new vector must be allocated to be
> used for the per-NUMA flushes, and more logic is required in the flush
> dispatcher to figure out whether a flush is limited to a single node.
> 
> The figures on a 2-node NUMA system are as follows, after having been
> running the same XenRT boot storm workload for 90 minutes.
> 
> Without the per-NUMA node flush:
> 
> Global flush_lock: addr=ffff82d040837340, lockval=d8ded8de, not locked
>   lock:21878876(98178042228), block:1603338(6043805110)
> 
> So a total block time of ~6s, and average block time of 3.7us.
> 
> With the per-node locks:
> 
> Global flush_lock: addr=ffff82d040837360, lockval=78e678e6, not locked
>   lock:6781028(41032945811), block:583712(2025657239)
> NUMA node 1 flush_lock: addr=ffff832fd085b110, lockval=5cd65cd6, not locked
>   lock:220374(766500536), block:4091(9933129)
> NUMA node 0 flush_lock: addr=ffff8310336a7110, lockval=5c715c71, not locked
>   lock:547953(1658170241), block:23856(51266297)
> 
> The total block time goes down to ~2s, and the average block time is 3.4us.
> The total block time of the per-node locks is much lower compared to the
> global flush_lock, 9ms and 51ms respectively.
> 
> Note the example here is possibly the system where such split locks don't
> make a lot of difference, being a 2 node system, but still there's a
> non-trivial difference between the block times.  On a 4 or 9 node system
> the figures should likely be even better.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

The savings must be from TLB flushes only? Cache flushes, as we have discussed
recently, need to be global anyway, and hence there are no savings to be had.
This may want reflecting the subject and/or description.

> @@ -126,3 +129,95 @@ int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
>  
>      return 0;
>  }
> +
> +static struct arch_numa_node {
> +    const void *flush_va;
> +    unsigned int flush_flags;
> +    cpumask_t flush_mask;
> +    spinlock_t flush_lock;
> +    struct lock_profile_qhead profile_head;
> +} *node_info[MAX_NUMNODES];

__ro_after_init or at least __read_mostly?

> +static int __init cf_check arch_numa_init(void)
> +{
> +    unsigned int i;
> +
> +    if ( num_online_nodes() == 1 )
> +        return 0;
> +
> +    for_each_online_node ( i )
> +    {
> +        struct arch_numa_node *node =
> +            alloc_xenheap_pages(get_order_from_bytes(sizeof(*node)),
> +                                                     MEMF_node(i));

A full page for what may cover just a cacheline or two? I realize ...

> +        if ( node )
> +            clear_page(node);
> +        else
> +            node = xvzalloc(typeof(*node));

... this (sadly) still has no NUMA-capable counterpart, but I'd have expected
at least a brief comment to justify.

> +void cf_check invalidate_tbl_numa(void)

Nit: s/tbl/tlb/ ?

> +bool flush_numa_node(const cpumask_t *mask, const void *va, unsigned int flags)
> +{
> +    nodeid_t node = num_online_nodes() > 1 ? cpumask_to_node(mask)
> +                                           : NUMA_NO_NODE;
> +    struct arch_numa_node *info;
> +
> +    if ( node == NUMA_NO_NODE )
> +        return false;
> +
> +    info = node_info[node];
> +
> +    if ( !info )
> +        return false;
> +
> +    spin_lock(&info->flush_lock);
> +    cpumask_and(&info->flush_mask, mask, &cpu_online_map);
> +    cpumask_clear_cpu(smp_processor_id(), &info->flush_mask);

IOW this function is strictly a helper of flush_area_mask(), relying on
the local CPU to have had its flushing done already. Might it not be
better if this was put as a static in smp.c then? Or, to keep struct
arch_numa_node local to this file, split it into two parts?

> +    info->flush_va = va;
> +    info->flush_flags = flags;
> +    send_IPI_mask(&info->flush_mask, INVALIDATE_NUMA_VECTOR);

This one similarly depends on flush_area_mask() behavior, not calling here
when mask has solely the local CPU set.

> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -689,6 +689,29 @@ static int __init cf_check numa_setup(const char *opt)
>  }
>  custom_param("numa", numa_setup);
>  
> +/*
> + * Return the NUMA node index if all CPUs in the mask belong to the same node,
> + * otherwise return NUMA_NO_NODE.
> + */
> +nodeid_t cpumask_to_node(const cpumask_t *mask)
> +{
> +    unsigned int cpu;
> +    nodeid_t node = NUMA_NO_NODE;
> +
> +    if ( num_online_nodes() == 1 )
> +        return cpu_to_node[0];

The sole caller checks this already, so strictly speaking Misra would consider
this dead / unreachable code.

Similarly Misra may not like this on Arm, where it's unused right now. Then
again looks like NUMA work there was abandoned, so for now all ought to be
fine here.

Jan

