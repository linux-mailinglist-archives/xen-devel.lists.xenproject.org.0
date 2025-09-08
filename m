Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3285B490E5
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 16:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115295.1461974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvcbF-0003ap-CW; Mon, 08 Sep 2025 14:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115295.1461974; Mon, 08 Sep 2025 14:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvcbF-0003Yl-9s; Mon, 08 Sep 2025 14:12:05 +0000
Received: by outflank-mailman (input) for mailman id 1115295;
 Mon, 08 Sep 2025 14:12:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uvcbD-0003Pu-IB
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 14:12:03 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca148e11-8cbd-11f0-9809-7dc792cee155;
 Mon, 08 Sep 2025 16:12:01 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b0415e03e25so619682466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 07:12:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0470f11088sm1238911966b.111.2025.09.08.07.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 07:12:00 -0700 (PDT)
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
X-Inumbo-ID: ca148e11-8cbd-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757340721; x=1757945521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ge1iyHHTlaM4s1ETZlW2q1Im8RFT7Hpk7sY6IEPE3Bc=;
        b=TAx5SD2VsR6JuwDIo6t4N3YvrYiywC9B3JX4/6uIOJ0bQFlymvDVa0N/IU6b5ZNnew
         hJRvoxZXeyg2WCT8RLiQ1BoWNMb6cbiozoI+2DiUtJs9MKK5sH/N3Pl9qw7v/7pyuiIN
         C0qri4ptAPtr4GvJszq4GGUuTLWRgZSp3r8gBAB1GiGOXH2wRA1uUeps8zJqKuHcyp+g
         qs+lJfDrJMt8+7Cj8yYEZ28YdSEdixQpQBogKl7/w63xG7o1BqQUms9+UfzYgIX+hc3Q
         HoXWwVHkgk6lKTr6Z1o3uQWLUuHUjreFWRDiXeXf2O2Q1jLl6UaNb1PC93xoWyFz8+IT
         QIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757340721; x=1757945521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ge1iyHHTlaM4s1ETZlW2q1Im8RFT7Hpk7sY6IEPE3Bc=;
        b=T5DkNXF/g9aVCjT0ci1d3FVQdsLvpeNrEwr0Nc/TS8PGR/YOHuYunGzlXiM7+oP921
         XA08ehlLEKqN2dCGMYaNbnZS2K3U4PQvpSHn6WerqrNgdLJK78Bczkx64wWp3qWzNtBH
         9T4cG5ER8qSQ7QWdwvID+eMOgRTbvqKmtA7s8/XodCJwTmLZ/nTHigBxE1aKK5lWPZH5
         looYXjB3D6/KEdP6FC1H7AgO9aIPFGv47+PbLS1ziyrLt8nceTchUempzFgEXNZS8f7n
         dmC2nTFPuNvwief9kr+fcSKqgSBBVWs+qeO0lx9p19x1klgMh0Y9D9POFODkv8NQLElx
         i5eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwciCMW6XZUfzfRCCrkErwZUBBgtKbRmEMvYATrDamv+D3734FwXNGvQK2lSux69I2R15wpFgiqxI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBJ3RmuE2JeHDBeDcIzI2db7L1doLOaZFzDif7n0ZnpAx0u7SU
	ORNaG/Ys7CYbFYYjgLFTtqACkfu5ReW6ij7fLw+2I/GFZXPJR0hhv1Itz9vY0yCNBA==
X-Gm-Gg: ASbGncva6Ufa2xBocRvxsFF9TjyIF4kQHHL6UF3GjtcS2Mwo/QznJeR2qWlzM3Mymp4
	27+Zy6pfa5NUEKSKXSBxPN1CcEqpcomaDyEru14sO4lx5mkVObO6dovgJ+hRAGPW4/rdJuN4zxK
	2ZNmfsNNbF3E/B83Z9WVlVpgygJugW4wcRyqF7YDtUJ2vfjTexIN/PLCIGPv7JwBBAe8bVzYtyZ
	4JAUTnq5AFzZH4jkT7zMuFCu0pRoRGohi/acEE7035NZ/QgXLNs3dr3G9JLTvlcQEPWsrm2dRuO
	t1j3sy4clCyk++njxo91DP+QACex91hMVRWP0fhnXthMovQH84paw9gHZkGz2A6xgGrpFTziu4R
	aqbsLOoPxvrQY6QDgGLrDAZ0D6M4geilCxoAuWH7VFg/67OsWHY/1w4YBkI34xCP/sejAKuOGjg
	kHH5BwvkkSHlQhYbhUmQ==
X-Google-Smtp-Source: AGHT+IEivTXhx/++/qoAsdmqe8PiAEFkfJd/UObwawZmR2YVftE/x4hbgDmYZ8FB+Ugv1u1FIj+S1g==
X-Received: by 2002:a17:907:890d:b0:b04:9ad9:5b2c with SMTP id a640c23a62f3a-b04b140d270mr698827966b.25.1757340720914;
        Mon, 08 Sep 2025 07:12:00 -0700 (PDT)
Message-ID: <b495c5f8-07d2-4ff2-a4ec-7a819335442a@suse.com>
Date: Mon, 8 Sep 2025 16:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] xen/numa: Add per_node() variables paralleling
 per_cpu() variables
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1757261045.git.bernhard.kaindl@cloud.com>
 <2a2e557f84ba4785f3f8788d31d3edf64e689da0.1757261045.git.bernhard.kaindl@cloud.com>
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
In-Reply-To: <2a2e557f84ba4785f3f8788d31d3edf64e689da0.1757261045.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.09.2025 18:15, Bernhard Kaindl wrote:
> During the review of the 3rd commit of the NUMA claims v1 series, it
> was found to be concerning (performance-wise) add add another array
> like this that randomly written from all nodes:
> 
> +/* Per-node counts of free pages */
> +static unsigned long pernode_avail_pages[MAX_NUMNODES];
> 
> As solution, it was suggested to introduce per_node() paralleling
> per_cpu(), or (less desirable) to make sure one particular cache
> line would only ever be written from a single node.
> 
> It was mentioned that node_need_scrub[] could/should use it, and
> I assume others may benefit too.
> 
> per_cpu() is a simple standard blueprint that is easy to copy, add
> per_node(), paralleling per_cpu() as the preferred suggestion:
> 
> It is entirely derived from per_cpu(), with a few differences:
> 
> - No add/remove callback: Nodes are onlined on boot and never offlined.
> 
> - As per_node(avail_pages) and pernode(outstanding_claims) are used by
>   the buddy allocator itself, and the buddy allocator is used to alloc
>   the per_node() memory from the local NUMA node, there is a catch:
> 
>   per_node() must already be working to have a working buddy allocator:
> 
>   - Init per_node() before the buddy allocator is ready as it needs
>     to be setup before its use, e.g. to init per_node(avail_pages)!
> 
>   Use an early static __initdata array during early boot and migrate
>   it to the NUMA-node-local xenheap before we enable the secondary CPUs.

Hmm, this is awkward, especially the need to update the offsets. See
comment further down. This aspect may put under question whether the
underlying idea was actually a good one.

> Cc: Jan Beulich <jbeulich@suse.com>

Cc: here is a little odd, for my taste at least. This may want to be
Requested-by:.

> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
> 
> ---
> Changes:
> - This is patch is new in v3 to resolve the the suggestion from the review.
> - The previous patch #2 is removed from the series as not required,
>   which is best visualized by how claims are used:
> 
>   - Claim needed memory
>   - Allocate all domain memory
>   - Cancel a possible leftover claim
>   - Finish building the domain and unpause it.
> 
>   As it makes no sense to repeat "Claim needed memory" at any time,
>   the change made had no practical significance.  It can be applied
>   later as a tiny, not important cleanup, e.g. with multi-node claims.
> 
> Implementation note on this patch (not needed for the commit message):
> 
> Instead of the __initdata array, I tried to alloc bootmem, but it
> caused paging_init() to panic with not enough memory for p2m on a
> very large 4-Socket, 480 pCPU, 4TiB RAM host (or it caused boot to
> hang after the microcode updates of the 480 pCPUs)

That's odd, but without any details it's hard to make a suggestion.

> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -320,6 +320,51 @@ static bool __init nodes_cover_memory(void)
>      return true;
>  }
>  
> +/* Defined on the BSS in xen.lds.S, used for area sizes and relative offsets */
> +extern const char __pernode_start[];
> +extern const char __pernode_end[];

May I suggest to use unsigned char throughout?

> +unsigned long __read_mostly __pernode_offset[MAX_NUMNODES];

With what you say in the description as to differences from per-CPU data,
this can be __ro_after_init, I expect?

> +#define EARLY_PERNODE_AREA_SIZE (SMP_CACHE_BYTES)

On what basis was this chosen? And how would we, at build time, notice when
this became too small?

> +static char early_pernode_area[MAX_NUMNODES][EARLY_PERNODE_AREA_SIZE]
> +    __initdata __cacheline_aligned;
> +
> +/* per_node() needs to be ready before the first alloc call using the heap */
> +static void __init early_init_pernode_areas(void)
> +{
> +    unsigned int node;
> +
> +    if (__pernode_end - __pernode_start > EARLY_PERNODE_AREA_SIZE)

Nit: Style.

> +        panic("per_node() area too small, increase EARLY_PERNODE_AREA_SIZE");
> +
> +    for_each_online_node(node)
> +        __pernode_offset[node] = early_pernode_area[node] - __pernode_start;

percpu_init_areas() poisons all slots, i.e. unused ones will remain poisoned.
I think something like that is wanted here, too.

> +}
> +
> +/* Before going SMP, migrate the per_node memory areas to their NUMA nodes */
> +static int __init init_pernode_areas(void)

This lacks cf_check, for its use with presmp_initcall() below.

> +{
> +    const int pernode_size = __pernode_end - __pernode_start;  /* size in BSS */

Why plain int? The value can't go negative.

> +    unsigned int node;
> +
> +    for_each_online_node(node)
> +    {
> +        char *p = alloc_xenheap_pages(get_order_from_bytes(pernode_size),
> +                                      MEMF_node(node));

Is per-node data really in need of being page granular? (Question also
applies to the new linker script construct.) Then again I realize we still
don't really have NUMA-aware sub-page-allocator functions. So a comment
here may have to do for now.

Further, like done for CPU0, imo node 0 will want to use the .bss area,
rather than having something allocated for it. That would partly address
the non-NUMA related comment given elsewhere.

> +        if ( !p )
> +            return -ENOMEM;

How's this going to work? Initcalls don't really have their return values
checked, iirc.

> +        /* migrate the pernode data from the bootmem area to the xenheap */

Nit (style): Capital letter at start of comment please.

> +        memcpy(p, early_pernode_area[node], SMP_CACHE_BYTES);

This SMP_CACHE_BYTES (which really means to be EARLY_PERNODE_AREA_SIZE aiui)
wants to become a suitable ARRAY_SIZE().

This also doesn't look to be safe towards an interrupt kicking in, when
sooner or later some interrupt handling code may also access per-node
data.

> +        __pernode_offset[node] = p - __pernode_start;
> +    }
> +    return 0;
> +}
> +
> +presmp_initcall(init_pernode_areas);

Nit: We prefer no blank line between the function and such an annotation.

> @@ -617,7 +662,7 @@ static int __init numa_emulation(unsigned long start_pfn,
>  }
>  #endif
>  
> -void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
> +static void __init init_nodes(unsigned long start_pfn, unsigned long end_pfn)
>  {
>      unsigned int i;
>      paddr_t start = pfn_to_paddr(start_pfn);
> @@ -656,6 +701,12 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
>      setup_node_bootmem(0, start, end);
>  }
>  
> +void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
> +{
> +    init_nodes(start_pfn, end_pfn);
> +    early_init_pernode_areas(); /* With all nodes registered, init per_node() */
> +}

This file is built only when CONFIG_NUMA=y. Non-NUMA configurations, however,
also need to have a working per_node(), with only ever 0 passed in as the node
ID.

> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -152,4 +152,19 @@ static inline nodeid_t mfn_to_nid(mfn_t mfn)
>  
>  #define page_to_nid(pg) mfn_to_nid(page_to_mfn(pg))
>  
> +/* Per NUMA node data area handling based on per-cpu data area handling. */
> +extern unsigned long __pernode_offset[];
> +
> +#define DECLARE_PER_NODE(type, name) \
> +    extern __typeof__(type) pernode__ ## name
> +
> +#define __DEFINE_PER_NODE(attr, type, name) \
> +    attr __typeof__(type) pernode_ ## name

I would suggest to omit this as long as there's just a single use.

> +#define DEFINE_PER_NODE(type, name) \
> +    __DEFINE_PER_NODE(__section(".bss.pernode"), type, _ ## name)
> +
> +#define per_node(var, node)  \
> +    (*RELOC_HIDE(&pernode__##var, __pernode_offset[node]))

I'm glad you didn't add this_node() (yet). As per discussion with Andrew earlier
today, there may want to be a comment here as to its absence, explaining that
what "this node" is first needs determining. There can, after all, be a CPU, a
memory, and a device view. While for devices we may not want to use this_node(),
for memory it may well happen. Hence something entirely CPU-centric may not work.

Furthermore Andrew pointed out that the ACPI exposed granularity may not be
sufficient for all purposes. He suggested to make clear here that for the time
being all of this is entirely SRAT based. (Iirc there was some DT work towards
supporting NUMA there as well, but my impression is that this work was abandoned.)

Jan

