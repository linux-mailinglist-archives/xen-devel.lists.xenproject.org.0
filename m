Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE69C828402
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 11:29:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664368.1034537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN9Ld-00083u-GP; Tue, 09 Jan 2024 10:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664368.1034537; Tue, 09 Jan 2024 10:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN9Ld-00081T-D5; Tue, 09 Jan 2024 10:28:41 +0000
Received: by outflank-mailman (input) for mailman id 664368;
 Tue, 09 Jan 2024 10:28:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RTBC=IT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rN9Lb-00081N-He
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 10:28:39 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9d6e004-aed9-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 11:28:38 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ccbded5aa4so31756021fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 02:28:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e12-20020a92690c000000b00360039199cesm505847ilc.3.2024.01.09.02.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 02:28:37 -0800 (PST)
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
X-Inumbo-ID: d9d6e004-aed9-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704796118; x=1705400918; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GNdk5Ex6JR4m/28YnrDOTyU29gJ0chF6f7TZlKGfmcw=;
        b=JTxtPucIlCoT38a3tuO7vljtanbAnhO7gQmaXzJXrIXRNz3Wpnf64clCufKhlcb78w
         dEIOqWebBKh2pNwiXPGrMokz3x6lIaxrlTtk2eK7y9FLeGd7egTvnHu8odx0ksm/jPIv
         TcdNE0Ox1JB6gXvRqMogKivrcSPJY2V7K+hYGxMxzut+B6Jb0EJ6hRwhR2sAsWRBdG6s
         LIP4OxwY+hlKHjSeVp+dzbL81ufDqrqN9PXv/1vW5N/MsniMciroYsuJD/dj6+1UdLx5
         pFSL1l6Hzl0E2hX2YZIUVm+n/V/xtSXgNMBUBkzv1tKFIVsfBVSehlSxN/0+lcWczbdv
         QhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704796118; x=1705400918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GNdk5Ex6JR4m/28YnrDOTyU29gJ0chF6f7TZlKGfmcw=;
        b=vY1x89MReNldRZ9n0HrCXHXRN9lQ5izeBOAgWeOKmTzhoxpgdqMqhPJApskc1HOsFC
         ICiMIlL45U6Ey30px6NnDSe+9dDve+EWHP2uGFWuWLMh/1yd7a2+bp/oa+i/kAOOqrD4
         FhIvL1h5CYgLEb5pkDH58DGNgYWcpaUy0wk+kInMiNqYlTzqv4dU356CoLOkOAhCmBhe
         joj/oLzBYSFRGy0SUbIfav2cC86Hlq7fmHs4IzBzDr75h6y6+SPVzO0sxuLVrFVtO03r
         /ZrS0VUSvHz9xGuaONXLXLN1H8jg5FEn2jQyoK/Rj2JzfJklbq4k/PyFH2CNpJGoQlmi
         X6sw==
X-Gm-Message-State: AOJu0YzhEmQm0rvtmmPkS00AIfT5+KREHrPAuv9A7mho0cc1cc6bjuVh
	RJ4YSaKcA64NuwSC0r3cyRBW7gq12Jf+
X-Google-Smtp-Source: AGHT+IHr/lBqmYEY5y90zViGIxaM4u4CenSRsQQSp9hYBJ5xOw4tSGZow/TjyvtnZT0KruAkzPyRpA==
X-Received: by 2002:a2e:311:0:b0:2cd:3b14:5c10 with SMTP id 17-20020a2e0311000000b002cd3b145c10mr2301206ljd.90.1704796117671;
        Tue, 09 Jan 2024 02:28:37 -0800 (PST)
Message-ID: <7fbe9526-60cf-4844-8b48-58ab69ec1b29@suse.com>
Date: Tue, 9 Jan 2024 11:28:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/13] xen: add cache coloring allocator for domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-10-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240102095138.17933-10-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2024 10:51, Carlo Nonato wrote:
> This commit adds a new memory page allocator that implements the cache
> coloring mechanism. The allocation algorithm enforces equal frequency
> distribution of cache partitions, following the coloring configuration of a
> domain. This allows an even utilization of cache sets for every domain.
> 
> Pages are stored in a color-indexed array of lists. Those lists are filled
> by a simple init function which computes the color of each page.
> When a domain requests a page, the allocator extract the page from the list
> with the maximum number of free pages between those that the domain can
> access, given its coloring configuration.
> 
> The allocator can only handle requests of order-0 pages. This allows for
> easier implementation and since cache coloring targets only embedded systems,
> it's assumed not to be a major problem.

I'm curious about the specific properties of embedded systems that makes
the performance implications of deeper page walks less of an issue for
them.

Nothing is said about address-constrained allocations. Are such entirely
of no interest to domains on Arm, not even to Dom0 (e.g. for filling
Linux'es swiotlb)? Certainly alloc_color_heap_page() should at least
fail when it can't satisfy the passed in memflags.

> ---
> v5:
> - Carlo Nonato as the new author
> - the colored allocator balances color usage for each domain and it searches
>   linearly only in the number of colors (FIXME removed)

While this addresses earlier concerns, meanwhile NUMA work has also
been progressing. What's the plan of interaction of coloring with it?

> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -47,3 +47,15 @@ config NR_LLC_COLORS
>  	  bound. The runtime value is autocomputed or manually set via cmdline.
>  	  The default value corresponds to an 8 MiB 16-ways LLC, which should be
>  	  more than what needed in the general case.
> +
> +config BUDDY_ALLOCATOR_SIZE
> +	int "Buddy allocator reserved memory size (MiB)"
> +	default "64"
> +	depends on LLC_COLORING
> +	help
> +	  Amount of memory reserved for the buddy allocator to work alongside
> +	  the colored one. The colored allocator is meant as an alternative to
> +	  the buddy allocator because its allocation policy is by definition
> +	  incompatible with the generic one. Since the Xen heap is not colored
> +	  yet, we need to support the coexistence of the two allocators and some
> +	  memory must be left for the buddy one.

Imo help text should be about the specific option, not general
documentation. How about

	  Amount of memory reserved for the buddy allocator, to serve Xen's
	  heap, to work alongside the colored one.

or some such?

> --- a/xen/arch/arm/llc-coloring.c
> +++ b/xen/arch/arm/llc-coloring.c
> @@ -30,6 +30,9 @@ static unsigned int __ro_after_init nr_colors = CONFIG_NR_LLC_COLORS;
>  static unsigned int __ro_after_init dom0_colors[CONFIG_NR_LLC_COLORS];
>  static unsigned int __ro_after_init dom0_num_colors;
>  
> +#define mfn_color_mask              (nr_colors - 1)

This is used solely ...

> +#define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)

... here, and this one in turn is used solely ...

> @@ -312,6 +315,16 @@ int domain_set_llc_colors_from_str(struct domain *d, const char *str)
>      return domain_check_colors(d);
>  }
>  
> +unsigned int page_to_llc_color(const struct page_info *pg)
> +{
> +    return mfn_to_color(page_to_mfn(pg));
> +}

... here. What's the point in having those (private) macros?

> @@ -1946,6 +1951,162 @@ static unsigned long avail_heap_pages(
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

It's "just" two pointers, but still - what use are they when ...

> +/* Memory required for buddy allocator to work with colored one */
> +#ifdef CONFIG_LLC_COLORING

... this isn't defined?

> +static unsigned long __initdata buddy_alloc_size =
> +    MB(CONFIG_BUDDY_ALLOCATOR_SIZE);
> +size_param("buddy-alloc-size", buddy_alloc_size);
> +
> +#define domain_num_llc_colors(d) ((d)->num_llc_colors)
> +#define domain_llc_color(d, i)   ((d)->llc_colors[(i)])

Nit: No need to parenthesize i when used like this.

> +#else
> +static unsigned long __initdata buddy_alloc_size;
> +
> +#define domain_num_llc_colors(d) 0
> +#define domain_llc_color(d, i)   0
> +#define page_to_llc_color(p)     0
> +#define get_nr_llc_colors()      0
> +#endif
> +
> +#define color_heap(color) (&_color_heap[color])
> +
> +void free_color_heap_page(struct page_info *pg, bool need_scrub)

Likely applicable further down as well - this is dead code when
!CONFIG_LLC_COLORING. Besides me, Misra also won't like this. The
function also looks to want to be static, at which point DCE would
apparently take care of removing it (and others, and then hopefully
also the two static variables commented on above).

> +struct page_info *alloc_color_heap_page(unsigned int memflags, struct domain *d)

I don't think d is written through in the function, so it wants to
be pointer-to-const.

> +void __init init_color_heap_pages(struct page_info *pg, unsigned long nr_pages)
> +{
> +    unsigned int i;
> +    bool need_scrub = (system_state < SYS_STATE_active &&

Can this part of the condition be false, seeing we're in an __init
function?

> +                       opt_bootscrub == BOOTSCRUB_IDLE);
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

So whatever is passed into this function first is going to fill the
Xen heap, without regard to address. I expect you're sure this won't
cause issues on Arm. On x86 certain constraints exist which would
require lower address ranges to be preferred.

> +void dump_color_heap(void)
> +{
> +    unsigned int color;
> +
> +    printk("Dumping color heap info\n");
> +    for ( color = 0; color < get_nr_llc_colors(); color++ )
> +        if ( free_colored_pages[color] > 0 )
> +            printk("Color heap[%u]: %lu pages\n",
> +                   color, free_colored_pages[color]);
> +}

What's a typical range of number of colors on a system? I expect more
than 9, but I'm not sure about a reasonable upper bound. For the
output to be easy to consume, [%u] may want to become at least [%2u].

Jan

