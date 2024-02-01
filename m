Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C6B845C2B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 16:53:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674519.1049503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVZNM-000164-QW; Thu, 01 Feb 2024 15:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674519.1049503; Thu, 01 Feb 2024 15:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVZNM-000133-Ms; Thu, 01 Feb 2024 15:53:16 +0000
Received: by outflank-mailman (input) for mailman id 674519;
 Thu, 01 Feb 2024 15:53:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVZNL-00012x-PD
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 15:53:15 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 016915aa-c11a-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 16:53:13 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a3566c0309fso145167566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 07:53:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bv11-20020a170906b1cb00b00a35e7326b69sm3832284ejb.93.2024.02.01.07.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 07:53:12 -0800 (PST)
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
X-Inumbo-ID: 016915aa-c11a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706802793; x=1707407593; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jnPQD2HqisVQvijjQ142klgke++wMuogZ1JRlvcJlRI=;
        b=KSw0As6M4LuqAuqCalTNb85ZhTpEDUtYhaZxsFwdq40HnXqWueRnQb9CxMhUT6AqBD
         2ly67y400kTJ1qdJnsVTQTezO4gBDXcq/Po+vNGHzVvbMP0+Mf+CDA7NGcEAfpapUHMN
         CYPxygi3GqFsRGZZP/7qMFdqSJjUMDSvVrwidMGwniwuNbzcBf1h6gLArFGT/g2hUB3a
         rRbk2vzCwIApEd1Jd9OOwKp/4ES9q6AIJlwg+juyGcl0G/DcSAFZ0vXHicuXx8vgylHp
         +kERuB6AvhsphDi0lIAeFvGsfC0i/5/flhofWyAW2LKAgMphJWYObwepMt3/GiQJtFNk
         vcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706802793; x=1707407593;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnPQD2HqisVQvijjQ142klgke++wMuogZ1JRlvcJlRI=;
        b=QT8FzUJFumOuy1vZUa4aH2EB9LfWb1V1p2yEwGESU5Gncd0FuYr4tQRiKmhdSywzMZ
         KEfxnc85AZ+/TNSwwcCf6FvmOV2PQ6nHskqC/gulBSjcvhE2qzLHVV16mi5gH65jWVxJ
         cg4XzY2AiKxlscX7GjZesIFOIdMWRxkQEaTrCgbybcwfAyucSuIa/3v1dDpOoOzn+dGI
         wAjYiotOXU+UlqSCyF5+WBGr6PUwbJEg0vDeDWTZotm1fgs1fTGsEY92ke6nhVo17Z7e
         erB88hsdcAaJw5KeoJuX2wzj38FpFA4Plefa/uz9+5SJE4JcF+zpLVUfypm3LoIusIgp
         jPcg==
X-Gm-Message-State: AOJu0YylagojWQBpM1g0c27zhwZ15EkmKIW83rXqSfq8Ae6Px5sN8oK1
	/DU4J5SZbL9TC/nh8MnlrSgwNS2qUzNins/WM+fJInNlVK0lh4JPrYelLKFvpA==
X-Google-Smtp-Source: AGHT+IH5atcEZv0GpexmtmtfD2kn1bhOvJUNo+K8fd1EjAJFL1oU1YyrgFAn8+Z45/5Y8avjunghSQ==
X-Received: by 2002:a17:906:e9a:b0:a2d:a6a7:b3bc with SMTP id p26-20020a1709060e9a00b00a2da6a7b3bcmr3386227ejf.4.1706802792683;
        Thu, 01 Feb 2024 07:53:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCURc03naErdxIlak0VCqU9q9pK521sr8P/KDp0LC80O9mFYeQnumZLLigpWFcDJX7+Np7FQcVsgiur4aLUunfU+TtrFUlA50TCdpJWtiTv5UMWEFvqzQhotj4VH2k8EFwHjqz2fD/IqCXPPdo/MbIWN6Q1IEzVoFf02rJfkaezF/Uel1ktroSg5AnLcCyZk6XFKJu5yw3laaVAaVyCzYXFSalw8X0M02CuxY637CnmPKcIo0YvrzEJNrHGiyD2suXVkhnaHCB24rAOt03auaIE9L0oWiX1lI6Xh46FLsvyRKFgYg5XlSqrLBIoIM+JowAyzmJPWtUTwnnEXeII/7LdSPuqOIl5f4jFaSNZx+5/oJpCeackIqZgv1LZsdF+41Um2JQ==
Message-ID: <1739dbb4-5d7e-4d84-8d4b-bfb13c4041d8@suse.com>
Date: Thu, 1 Feb 2024 16:53:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/15] xen: add cache coloring allocator for domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-11-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240129171811.21382-11-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.01.2024 18:18, Carlo Nonato wrote:
> @@ -157,7 +158,11 @@
>  #define PGC_static 0
>  #endif
>  
> -#define PGC_preserved (PGC_extra | PGC_static)
> +#ifndef PGC_colored
> +#define PGC_colored 0
> +#endif
> +
> +#define PGC_preserved (PGC_extra | PGC_static | PGC_colored)
>  
>  #ifndef PGT_TYPE_INFO_INITIALIZER
>  #define PGT_TYPE_INFO_INITIALIZER 0
> @@ -1504,6 +1509,7 @@ static void free_heap_pages(
>              if ( !mfn_valid(page_to_mfn(predecessor)) ||
>                   !page_state_is(predecessor, free) ||
>                   (predecessor->count_info & PGC_static) ||
> +                 (predecessor->count_info & PGC_colored) ||

How about a 2nd #define (e.g. PGC_no_buddy_merge) to use here and ...

>                   (PFN_ORDER(predecessor) != order) ||
>                   (page_to_nid(predecessor) != node) )
>                  break;
> @@ -1528,6 +1534,7 @@ static void free_heap_pages(
>              if ( !mfn_valid(page_to_mfn(successor)) ||
>                   !page_state_is(successor, free) ||
>                   (successor->count_info & PGC_static) ||
> +                 (successor->count_info & PGC_colored) ||

... here? That'll then also avoid me commenting that I don't see why
these two PGC_* checks aren't folded.

> @@ -1943,6 +1950,161 @@ static unsigned long avail_heap_pages(
>      return free_pages;
>  }
>  
> +/*************************
> + * COLORED SIDE-ALLOCATOR
> + *
> + * Pages are grouped by LLC color in lists which are globally referred to as the
> + * color heap. Lists are populated in end_boot_allocator().
> + * After initialization there will be N lists where N is the number of
> + * available colors on the platform.
> + */
> +static struct page_list_head *__ro_after_init _color_heap;
> +static unsigned long *__ro_after_init free_colored_pages;
> +
> +/* Memory required for buddy allocator to work with colored one */
> +#ifdef CONFIG_LLC_COLORING
> +static unsigned long __initdata buddy_alloc_size =
> +    MB(CONFIG_BUDDY_ALLOCATOR_SIZE);
> +size_param("buddy-alloc-size", buddy_alloc_size);
> +
> +#define domain_num_llc_colors(d) (d)->num_llc_colors
> +#define domain_llc_color(d, i)   (d)->llc_colors[(i)]

Nit: Unnecessary parentheses inside the square brackets.

> +#else
> +static unsigned long __initdata buddy_alloc_size;
> +
> +#define domain_num_llc_colors(d) 0
> +#define domain_llc_color(d, i)   0
> +#endif
> +
> +#define color_heap(color) (&_color_heap[color])

Wouldn't this better live next to _color_heap()'s definition?

> +static void free_color_heap_page(struct page_info *pg, bool need_scrub)
> +{
> +    unsigned int color = page_to_llc_color(pg);
> +    struct page_list_head *head = color_heap(color);
> +
> +    spin_lock(&heap_lock);
> +
> +    mark_page_free(pg, page_to_mfn(pg));
> +
> +    if ( need_scrub )
> +    {
> +        pg->count_info |= PGC_need_scrub;
> +        poison_one_page(pg);
> +    }
> +
> +    pg->count_info |= PGC_colored;

The page transiently losing PGC_colored is not an issue then (presumably
because of holding the heap lock)? Did you consider having mark_page_free()
also use PGC_preserved?

> +    free_colored_pages[color]++;
> +    page_list_add(pg, head);
> +
> +    spin_unlock(&heap_lock);
> +}
> +
> +static struct page_info *alloc_color_heap_page(unsigned int memflags,
> +                                               const struct domain *d)
> +{
> +    struct page_info *pg = NULL;
> +    unsigned int i, color = 0;
> +    unsigned long max = 0;
> +    bool need_tlbflush = false;
> +    uint32_t tlbflush_timestamp = 0;
> +    bool scrub = !(memflags & MEMF_no_scrub);
> +
> +    spin_lock(&heap_lock);
> +
> +    for ( i = 0; i < domain_num_llc_colors(d); i++ )
> +    {
> +        unsigned long free = free_colored_pages[domain_llc_color(d, i)];
> +
> +        if ( free > max )
> +        {
> +            color = domain_llc_color(d, i);
> +            pg = page_list_first(color_heap(color));
> +            max = free;
> +        }
> +    }

The apporach is likely fine at least initially, but: By going from where
the most free pages are, you're not necessarily evenly distributing a
domain's pages over the colors it may use, unless the domain uses its
set of colors exclusively.

> +    if ( !pg )
> +    {
> +        spin_unlock(&heap_lock);
> +        return NULL;
> +    }
> +
> +    pg->count_info = PGC_state_inuse | PGC_colored |
> +                     (pg->count_info & PGC_need_scrub);

Isn't PGC_colored already set on the page? Together with ...

> +    free_colored_pages[color]--;
> +    page_list_del(pg, color_heap(color));
> +
> +    if ( !(memflags & MEMF_no_tlbflush) )
> +        accumulate_tlbflush(&need_tlbflush, pg, &tlbflush_timestamp);
> +
> +    init_free_page_fields(pg);
> +
> +    spin_unlock(&heap_lock);
> +
> +    if ( test_and_clear_bit(_PGC_need_scrub, &pg->count_info) && scrub )

... this, can't the above be simplified?

> +        scrub_one_page(pg);
> +    else if ( scrub )
> +        check_one_page(pg);
> +
> +    if ( need_tlbflush )
> +        filtered_flush_tlb_mask(tlbflush_timestamp);
> +
> +    flush_page_to_ram(mfn_x(page_to_mfn(pg)),
> +                      !(memflags & MEMF_no_icache_flush));
> +
> +    return pg;
> +}
> +
> +static void __init init_color_heap_pages(struct page_info *pg,
> +                                         unsigned long nr_pages)
> +{
> +    unsigned int i;
> +    bool need_scrub = opt_bootscrub == BOOTSCRUB_IDLE;
> +
> +    if ( buddy_alloc_size )
> +    {
> +        unsigned long buddy_pages = min(PFN_DOWN(buddy_alloc_size), nr_pages);
> +
> +        init_heap_pages(pg, buddy_pages);
> +        nr_pages -= buddy_pages;
> +        buddy_alloc_size -= buddy_pages << PAGE_SHIFT;
> +        pg += buddy_pages;
> +    }
> +
> +    if ( !_color_heap )
> +    {
> +        unsigned int max_nr_colors = get_max_nr_llc_colors();
> +
> +        _color_heap = xmalloc_array(struct page_list_head, max_nr_colors);
> +        free_colored_pages = xzalloc_array(unsigned long, max_nr_colors);
> +        if ( !_color_heap || !free_colored_pages )
> +            panic("Can't allocate colored heap. Buddy reserved size is too low");
> +
> +        for ( i = 0; i < max_nr_colors; i++ )
> +            INIT_PAGE_LIST_HEAD(color_heap(i));
> +    }
> +
> +    if ( nr_pages )
> +        printk(XENLOG_DEBUG
> +               "Init color heap with %lu pages, start MFN: %"PRI_mfn"\n",
> +               nr_pages, mfn_x(page_to_mfn(pg)));

This message can be issued more than once. Is that really desirable /
necessary?

> @@ -2458,7 +2626,14 @@ struct page_info *alloc_domheap_pages(
>      if ( memflags & MEMF_no_owner )
>          memflags |= MEMF_no_refcount;
>  
> -    if ( !dma_bitsize )
> +    /* Only domains are supported for coloring */
> +    if ( d && llc_coloring_enabled )
> +    {
> +        /* Colored allocation must be done on 0 order */
> +        if ( order || (pg = alloc_color_heap_page(memflags, d)) == NULL )
> +            return NULL;
> +    }

I think I had asked before: What about MEMF_node() or MEMF_bits()
having been used by the caller?

Jan

