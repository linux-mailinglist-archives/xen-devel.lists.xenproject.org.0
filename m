Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9C988029C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 17:44:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695504.1085321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmcZ1-00040O-Vs; Tue, 19 Mar 2024 16:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695504.1085321; Tue, 19 Mar 2024 16:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmcZ1-0003xo-Rv; Tue, 19 Mar 2024 16:43:47 +0000
Received: by outflank-mailman (input) for mailman id 695504;
 Tue, 19 Mar 2024 16:43:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmcZ0-0003xN-Ii
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 16:43:46 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9b26163-e60f-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 17:43:44 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5684ea117a3so8526318a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 09:43:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a89-20020a509ee2000000b00568c299eaedsm3946856edf.81.2024.03.19.09.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 09:43:44 -0700 (PDT)
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
X-Inumbo-ID: d9b26163-e60f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710866624; x=1711471424; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B7ziCVcpDDeUQjlCm66oq5vRfuhJ18TkciU8KxvLapU=;
        b=Nsw5faCTUfEoP/aIqAquN825WdqsEZhVmFA/sCLvkeItlkayTj6p2HuHf3zANoMGAA
         cQcM2plo+KK3W1Z75+ngqVjP9ap8/M2P54LoqN/ksC8B0iXJtYj428boTGAvTJ+9xR+J
         zc92AVRpjq+1JDq6S7sWwpBexqu5tmPfOM98xQCbZC5Fs4qO+TsosjQOQwchm1YsGUkQ
         cnioB0cYY6hdR89QarFSAV3JLJgLCJYQeOKKT7Z4drA/G+h35rBUmxps6w0Xto/xxhxo
         SDb3juGM5eLeT+S31zd+pT6RroVjUtphIqnYz8iytd7kXzNq2zU8oWFmztu5RQctQhjh
         tzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710866624; x=1711471424;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7ziCVcpDDeUQjlCm66oq5vRfuhJ18TkciU8KxvLapU=;
        b=Ct+M/MNtRDe3Tq5weg+/7g0Ta0GJuMe8/UOv9X0wDFHwXjQ4cyrUDYeP8a6XoIZhK5
         EDLkM0EUKA0RzVZC0S/LHe3uog09+It8FEqLA0pUWIGBDVfa5ynoF1UQ5w8TMiUFIQJR
         XyNdFt+hG8+Nfu3WQ1NbfKHg/6iKkhEr4oh5Fy2ME6txtWQY6pmePT+8vNuHvCGnfXZ4
         Arqxn9jF4FIIcT5Bf3CqLc3mX6Iul7L0rf25BHK0WBgkMl6fpyyqfA+OopHNo+6bVacj
         WIIrjv0K4K865V9go5AtxsMmHIHsDAqT3+pqvuK1LsTi/ZL8fwIpND1R17L4NFZqsE31
         yLpg==
X-Forwarded-Encrypted: i=1; AJvYcCXs2BtYE+7oOiIji3ND2m27uwciNQqeNd4dYiUurrMYeO90onp04Bwl96NROH4bL5hpZ5rnQLIKK8g0+y70Dig6NOS+BwiB4/LkukPgKmk=
X-Gm-Message-State: AOJu0Yz2363GArjFHn1fFVALCsO2Vji5xVRvzwe3SEMbw7YU91GxFc4C
	H11Dg8Eg8JmuRVHikdUUQplnLmK5jfKPrPQUFbsdt50Z9Md9wzjTz2ilemcJTg==
X-Google-Smtp-Source: AGHT+IGzzQuVqI4kOMfcWTK+Tbg6XiwLB1/LBVMIRkh/c/uaiAhhQMq9V41FARezVUQyAOR1SBcNbQ==
X-Received: by 2002:a05:6402:3589:b0:568:d315:b85e with SMTP id y9-20020a056402358900b00568d315b85emr5307576edc.36.1710866624241;
        Tue, 19 Mar 2024 09:43:44 -0700 (PDT)
Message-ID: <fee07e30-e73a-4c1f-92f3-3e4ef7bc707a@suse.com>
Date: Tue, 19 Mar 2024 17:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/14] xen: add cache coloring allocator for domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-11-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240315105902.160047-11-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 11:58, Carlo Nonato wrote:
> Add a new memory page allocator that implements the cache coloring mechanism.
> The allocation algorithm enforces equal frequency distribution of cache
> partitions, following the coloring configuration of a domain. This allows
> for an even utilization of cache sets for every domain.
> 
> Pages are stored in a color-indexed array of lists. Those lists are filled
> by a simple init function which computes the color of each page.
> When a domain requests a page, the allocator extract the page from the list
> with the maximum number of free pages between those that the domain can
> access, given its coloring configuration.

Minor remark: I'm not a native speaker, but "between" here reads odd to
me. I'd have expected perhaps "among".

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -270,6 +270,20 @@ and not running softirqs. Reduce this if softirqs are not being run frequently
>  enough. Setting this to a high value may cause boot failure, particularly if
>  the NMI watchdog is also enabled.
>  
> +### buddy-alloc-size (arm64)
> +> `= <size>`
> +
> +> Default: `64M`
> +
> +Amount of memory reserved for the buddy allocator when colored allocator is
> +active. This options is parsed only when LLC coloring support is enabled.

Nit: s/parsed/used/ - the option is always parsed as long as LLC_COLORING=y.

> @@ -1945,6 +1949,164 @@ static unsigned long avail_heap_pages(
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
> +#define color_heap(color) (&_color_heap[color])
> +
> +static unsigned long *__ro_after_init free_colored_pages;
> +
> +/* Memory required for buddy allocator to work with colored one */
> +#ifdef CONFIG_LLC_COLORING
> +static unsigned long __initdata buddy_alloc_size =
> +    MB(CONFIG_BUDDY_ALLOCATOR_SIZE);
> +size_param("buddy-alloc-size", buddy_alloc_size);
> +
> +#define domain_num_llc_colors(d) (d)->num_llc_colors
> +#define domain_llc_color(d, i)   (d)->llc_colors[i]
> +#else
> +static unsigned long __initdata buddy_alloc_size;
> +
> +#define domain_num_llc_colors(d) 0
> +#define domain_llc_color(d, i)   0
> +#endif
> +
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
> +    free_colored_pages[color]++;
> +    page_list_add(pg, head);

May I please ask for a comment (or at least some wording in the description)
as to the choice made here between head or tail insertion? When assuming
that across a system there's no sharing of colors, preferably re-using
cache-hot pages is certainly good. Whereas when colors can reasonably be
expected to be shared, avoiding to quickly re-use a freed page can also
have benefits.

> +static struct page_info *alloc_color_heap_page(unsigned int memflags,
> +                                               const struct domain *d)
> +{
> +    struct page_info *pg = NULL;
> +    unsigned int i, color = 0;
> +    unsigned long max = 0;
> +    bool need_tlbflush = false;
> +    uint32_t tlbflush_timestamp = 0;
> +    bool need_scrub;
> +
> +    if ( memflags >> _MEMF_bits )
> +        return NULL;

By mentioning MEMF_bits earlier on I meant to give an example. What
about MEMF_node and in particular MEMF_exact_node? Certain other flags
also aren't obvious as to being okay to silently ignore.

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
> +
> +    if ( !pg )
> +    {
> +        spin_unlock(&heap_lock);
> +        return NULL;
> +    }
> +
> +    need_scrub = pg->count_info & (PGC_need_scrub);
> +    pg->count_info = PGC_state_inuse | (pg->count_info & PGC_colored);

Better PGC_preserved?

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

There's a corner case where init_heap_pages() would break when passed 0
as 2nd argument. I think you want to alter the enclosing if() to
"if ( buddy_alloc_size >= PAGE_SIZE )" to be entirely certain to avoid
that case.

> +static void dump_color_heap(void)
> +{
> +    unsigned int color;
> +
> +    printk("Dumping color heap info\n");
> +    for ( color = 0; color < get_max_nr_llc_colors(); color++ )
> +        if ( free_colored_pages[color] > 0 )
> +            printk("Color heap[%u]: %lu pages\n",
> +                   color, free_colored_pages[color]);
> +}

While having all of the code above from here outside of any #ifdef is
helpful to prevent unintended breakage when changes are made and tested
only on non-Arm64 targets, I'd still like to ask: Halfway recent
compilers manage to eliminate everything? I'd like to avoid e.g. x86
being left with traces of coloring despite not being able at all to use
it.

> @@ -2485,7 +2660,10 @@ struct page_info *alloc_domheap_pages(
>          }
>          if ( assign_page(pg, order, d, memflags) )
>          {
> -            free_heap_pages(pg, order, memflags & MEMF_no_scrub);
> +            if ( pg->count_info & PGC_colored )
> +                free_color_heap_page(pg, memflags & MEMF_no_scrub);
> +            else
> +                free_heap_pages(pg, order, memflags & MEMF_no_scrub);
>              return NULL;
>          }
>      }
> @@ -2568,7 +2746,10 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
>              scrub = 1;
>          }
>  
> -        free_heap_pages(pg, order, scrub);
> +        if ( pg->count_info & PGC_colored )
> +            free_color_heap_page(pg, scrub);
> +        else
> +            free_heap_pages(pg, order, scrub);
>      }

Instead of this, did you consider altering free_heap_pages() to forward
to free_color_heap_page()? That would then also allow to have a single,
central comment and/or assertion that the "order" value here isn't lost.

Jan

