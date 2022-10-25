Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8095860CB84
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 14:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429831.681088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onIk4-0000Fy-UW; Tue, 25 Oct 2022 12:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429831.681088; Tue, 25 Oct 2022 12:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onIk4-0000EO-Q7; Tue, 25 Oct 2022 12:09:12 +0000
Received: by outflank-mailman (input) for mailman id 429831;
 Tue, 25 Oct 2022 12:09:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/6Q6=22=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1onIk2-0000EG-KB
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 12:09:10 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d409501a-545d-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 14:09:08 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id kt23so6346980ejc.7
 for <xen-devel@lists.xenproject.org>; Tue, 25 Oct 2022 05:09:08 -0700 (PDT)
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
X-Inumbo-ID: d409501a-545d-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0EMS6neoH1wLgevffmxusZO+/2W3737BWX+uyWfd0A=;
        b=vpcDohbWBC7kKW+Vs2agdu5exk4suWVVj8egUR2qTvxUSAeUIJq/k5+osn4zq260Js
         ZgacO8y/a+FfzuCOe2ewFtd79S+sj+cV5LUiqW+hrG1TD/FO+KkdcQdJL8bWFTECz3uh
         Jm6VevyrqtiNNBXarBKijZC4Wv9z1RJD7bvUSMutguXolgp9GsFGFRgqIEmYiXeA2rgn
         sBwq6TA4cMfc8drwNOOZSEW+iOpgvhPvvQCcSv0B0TWsb09U3DLey4B80VWMBIFlDFQg
         5uw0BF9Wy8u8jREQdZgq2joELNeSaMdG+h19QPiYpMfF4xxGYv4iaRk8utQ11BGr3Igl
         xT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0EMS6neoH1wLgevffmxusZO+/2W3737BWX+uyWfd0A=;
        b=748SPTALrR8KWoS+/QCg6CCM0c6z36ATARPXGVdw0vXysu1kHjA269L8SGQeI+PBY6
         RpNHexLQ5hYTwx1s60FDW0dkJEdPRkF8AJErKwwLrinwzJXv9aue8oSIqZU5+HFAZeEG
         fM52XRQnVsobUqJm30d5dQ5geacJNlbuCVI/67hQDY1gf9rEoqlnrvYtfhwHzsxzESrE
         dz306VgSvsioVmeH//tDGa5micIn9mB6+50GWgh8j2PlgZ4CywKuVdIjeBnfuvCAJeX6
         iovkv7vXb5ajg0kKWbW8O6T1OlS/abjVQv2cp00JogKywrg1YZaE6grtQn1cV/ekqTQl
         /sgw==
X-Gm-Message-State: ACrzQf1ak3wRyrTFDic46wjUq+joTZzv3j6o+NxjBqbeeiG1OUvHlQ1o
	EJuaaXdY1TGyvzRcwNDdQY9F3y25CzJ7lMFJYDRxr3/Tfz8=
X-Google-Smtp-Source: AMsMyM5CgrdLr4ireJ6jwnIFq+0FELmXZskis58ikt1/kyekup74geq6rLuVlC96TlD3+YyhS/AThnck3FD1XKYXQqk=
X-Received: by 2002:a17:907:a055:b0:7a4:48e1:65c3 with SMTP id
 gz21-20020a170907a05500b007a448e165c3mr11679641ejc.764.1666699747327; Tue, 25
 Oct 2022 05:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech> <20221022155120.7000-7-carlo.nonato@minervasys.tech>
In-Reply-To: <20221022155120.7000-7-carlo.nonato@minervasys.tech>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 25 Oct 2022 14:08:56 +0200
Message-ID: <CAG+AhRXFGG6q5mABQXgJtnswzBzzdBEmMnvBkV6o22eJekPk_w@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] xen/common: add cache coloring allocator for domains
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@unimore.it, andrea.bastoni@minervasys.tech, 
	lucmiccio@gmail.com, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 22, 2022 at 5:51 PM Carlo Nonato
<carlo.nonato@minervasys.tech> wrote:
>
> From: Luca Miccio <lucmiccio@gmail.com>
>
> This commit adds a new memory page allocator that implements the cache
> coloring mechanism. The allocation algorithm follows the given domain color
> configuration and maximizes contiguity in the page selection of multiple
> subsequent requests.
>
> Pages are stored in a color-indexed array of lists, each one sorted by
> machine address, that is called the colored heap. A simple initialization
> function computes the color of any available page and inserts it in the
> corresponding list. When a domain requests a page, the allocator takes one
> from the subset of lists whose colors equals the domain configuration. It
> chooses the page with the highest machine address such that contiguous
> pages are sequentially allocated, if this is made possible by a color
> assignment which includes adjacent colors.
>
> The allocator can handle only requests with order equals to 0 since the
> single color granularity is represented in memory by one page.
>
> The buddy allocator must coexist with the colored one because the Xen heap
> isn't colored. For this reason a new Kconfig option and a command line
> parameter are added to let the user set the amount of memory reserved for
> the buddy allocator. Even when cache coloring is enabled, this memory isn't
> managed by the colored allocator.
>
> Colored heap information is dumped in the dump_heap() debug-key function.
>
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> ---
> v3:
> - fixed PGC_colored bits values
> - merged debug-key for dump_color_heap() with the one for dump_heap()
> - number of pages for each color in an array to easily dump color heap info
> - heap_lock in colored allocator to ensure atomicity and clarify it with a
>   comment
> - added page_list_add_{next|prev} to add pages in the middle of the list
> - p2m tables use pages of same colors as domain
> - CONFIG_BUDDY_ALLOCATOR_SIZE is now an int (MiB)
> - buddy allocator reserved size is now respected as configured in Kconfig
> - removed useless functions and refactored the code
> - fixed PGC_colored flag that was removed when a page was allocated
> - merged with #7 since it would have been too small
> ---
>  docs/misc/arm/cache-coloring.rst    |  39 ++++-
>  docs/misc/xen-command-line.pandoc   |  14 ++
>  xen/arch/arm/Kconfig                |  12 ++
>  xen/arch/arm/coloring.c             |  10 ++
>  xen/arch/arm/include/asm/coloring.h |   6 +
>  xen/arch/arm/include/asm/mm.h       |   3 +
>  xen/arch/arm/p2m.c                  |   7 +-
>  xen/common/page_alloc.c             | 259 +++++++++++++++++++++++++---
>  xen/include/xen/mm.h                |  43 +++++
>  9 files changed, 371 insertions(+), 22 deletions(-)
>
> diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
> index dd2e851a26..0c89278aee 100644
> --- a/docs/misc/arm/cache-coloring.rst
> +++ b/docs/misc/arm/cache-coloring.rst
> @@ -16,6 +16,9 @@ In order to enable and use it, few steps are needed.
>    (refer to menuconfig help for value meaning and when it should be changed).
>
>          CONFIG_MAX_CACHE_COLORS=<n>
> +- If needed, change the amount of memory reserved for the buddy allocator either
> +  from the Xen configuration file, via the CONFIG_BUDDY_ALLOCATOR_SIZE value,
> +  or with the command line option. See `Colored allocator and buddy allocator`.
>  - Assign colors to domains using the `Color selection format`_ (see
>    `Coloring parameters`_ for more documentation pointers).
>
> @@ -162,6 +165,18 @@ Please refer to the relative documentation in
>  Note that if no color configuration is provided for domains, they fallback to
>  the default one, which corresponds simply to all available colors.
>
> +Colored allocator and buddy allocator
> +*************************************
> +
> +The colored allocator distributes pages based on color configurations of
> +domains so that each domains only gets pages of its own colors.
> +The colored allocator is meant as an alternative to the buddy allocator because
> +its allocation policy is by definition incompatible with the generic one. Since
> +the Xen heap is not colored yet, we need to support the coexistence of the two
> +allocators and some memory must be left for the buddy one.
> +The buddy allocator memory can be reserved from the Xen configuration file or
> +with the help of a command-line option.
> +
>  Known issues and limitations
>  ****************************
>
> @@ -182,7 +197,6 @@ configuration structure size used in domain creation. "uint16_t" is the biggest
>  integer type that fit the constraint and 2^15 is the biggest power of 2 it can
>  easily represent. This value is big enough for the generic case, though.
>
> -
>  "xen,static-mem" isn't supported when coloring is enabled
>  #########################################################
>
> @@ -190,3 +204,26 @@ In the domain configuration, "xen,static-mem" allows memory to be statically
>  allocated to the domain. This isn't possibile when cache coloring is enabled,
>  because that memory can't be guaranteed to be of the same colors assigned to
>  that domain.
> +
> +Colored allocator can only make use of order-0 pages
> +####################################################
> +
> +The cache coloring technique relies on memory mappings and on the smallest
> +amount of memory that can be mapped to achieve the maximum number of colors
> +(cache partitions) possible. This amount is what is normally called a page and,
> +in Xen terminology, the order-0 page is the smallest one. The fairly simple
> +colored allocator currently implemented, makes use only of such pages.
> +It must be said that a more complex one could, in theory, adopt higher order
> +pages if the colors selection contained adjacent colors. Two subsequent colors,
> +for example, can be represented by an order-1 page, four colors correspond to
> +an order-2 page, etc.
> +
> +Fail to boot colored DomUs with large memory size
> +#################################################
> +
> +If the Linux kernel used for Dom0 does not contain the upstream commit
> +3941552aec1e04d63999988a057ae09a1c56ebeb and uses the hypercall buffer device,
> +colored DomUs with memory size larger then 127 MB cannot be created. This is
> +caused by the default limit of this buffer of 64 pages. The solution is to
> +manually apply the above patch, or to check if there is an updated version of
> +the kernel in use for Dom0 that contains this change.
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 3f04414134..25a59dd6a9 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -299,6 +299,20 @@ can be maintained with the pv-shim mechanism.
>      cause Xen not to use Indirect Branch Tracking even when support is
>      available in hardware.
>
> +### buddy-alloc-size (arm64)
> +> `= <size>`
> +
> +> Default: `64M`
> +
> +Amount of memory reserved for the buddy allocator when colored allocator is
> +active. This options is parsed only when cache coloring support is enabled.
> +The colored allocator is meant as an alternative to the buddy allocator,
> +because its allocation policy is by definition incompatible with the
> +generic one. Since the Xen heap systems is not colored yet, we need to
> +support the coexistence of the two allocators for now. This parameter, which is
> +optional and for expert only, it's used to set the amount of memory reserved to
> +the buddy allocator.
> +
>  ### clocksource (x86)
>  > `= pit | hpet | acpi | tsc`
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index c45a9c5917..4cfa75b2ef 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -153,6 +153,18 @@ config MAX_CACHE_COLORS
>           Note that if, at any time, a color configuration with more colors than the
>           maximum is employed, an error is produced.
>
> +config BUDDY_ALLOCATOR_SIZE
> +       int "Buddy allocator reserved memory size (MiB)"
> +       default "64"
> +       depends on CACHE_COLORING
> +       help
> +         Amount of memory reserved for the buddy allocator to work alongside
> +         the colored one. The colored allocator is meant as an alternative to the
> +         buddy allocator because its allocation policy is by definition
> +         incompatible with the generic one. Since the Xen heap is not colored yet,
> +         we need to support the coexistence of the two allocators and some memory
> +         must be left for the buddy one.
> +
>  config TEE
>         bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
>         default n
> diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
> index 685a431c3d..2cae215cd2 100644
> --- a/xen/arch/arm/coloring.c
> +++ b/xen/arch/arm/coloring.c
> @@ -322,6 +322,16 @@ void prepare_color_domain_config(struct xen_arch_domainconfig *config,
>      config->num_colors = (uint16_t)num_colors;
>  }
>
> +unsigned int page_to_color(const struct page_info *pg)
> +{
> +    return addr_to_color(page_to_maddr(pg));
> +}
> +
> +unsigned int get_max_colors(void)
> +{
> +    return max_colors;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
> index 549eb408a3..0147f95968 100644
> --- a/xen/arch/arm/include/asm/coloring.h
> +++ b/xen/arch/arm/include/asm/coloring.h
> @@ -31,6 +31,8 @@
>
>  #include <public/arch-arm.h>
>
> +struct page_info;
> +
>  bool __init coloring_init(void);
>
>  int domain_coloring_init(struct domain *d,
> @@ -41,6 +43,10 @@ void domain_dump_coloring_info(struct domain *d);
>  void prepare_color_domain_config(struct xen_arch_domainconfig *config,
>                                   const char *colors_str);
>
> +unsigned int page_to_color(const struct page_info *pg);
> +
> +unsigned int get_max_colors(void);
> +
>  #else /* !CONFIG_CACHE_COLORING */
>
>  static inline bool __init coloring_init(void) { return true; }
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 68adcac9fa..e848fa4adf 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -128,6 +128,9 @@ struct page_info
>  #else
>  #define PGC_static     0
>  #endif
> +/* Page is cache colored */
> +#define _PGC_colored      PG_shift(4)
> +#define PGC_colored       PG_mask(1, 4)
>  /* ... */
>  /* Page is broken? */
>  #define _PGC_broken       PG_shift(7)
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 8449f97fe7..9ac7dc6216 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -661,7 +661,12 @@ static int p2m_create_table(struct p2m_domain *p2m, lpae_t *entry)
>
>      ASSERT(!p2m_is_valid(*entry));
>
> -    page = alloc_domheap_page(NULL, 0);
> +    /* If cache coloring is enabled, p2m tables are allocated using the domain
> +     * coloring configuration to prevent cache interference. */
> +    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
> +        page = alloc_domheap_page(p2m->domain, MEMF_no_refcount);
> +    else
> +        page = alloc_domheap_page(NULL, 0);
>      if ( page == NULL )
>          return -ENOMEM;

This diff can't be applied to the current master. I need to check
how things have changed in the meantime.

> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 62afb07bc6..fe214cd6ac 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -150,6 +150,9 @@
>  #define p2m_pod_offline_or_broken_hit(pg) 0
>  #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
>  #endif
> +#ifdef CONFIG_HAS_CACHE_COLORING
> +#include <asm/coloring.h>
> +#endif
>
>  #ifndef PGC_static
>  #define PGC_static 0
> @@ -231,6 +234,14 @@ static bool __read_mostly scrub_debug;
>  #define scrub_debug    false
>  #endif
>
> +/* Memory required for buddy allocator to work with colored one */
> +#ifdef CONFIG_BUDDY_ALLOCATOR_SIZE
> +static unsigned long __initdata buddy_alloc_size =
> +    CONFIG_BUDDY_ALLOCATOR_SIZE << 20;
> +#else
> +    static unsigned long __initdata buddy_alloc_size = 0;
> +#endif
> +
>  /*
>   * Bit width of the DMA heap -- used to override NUMA-node-first.
>   * allocation strategy, which can otherwise exhaust low memory.
> @@ -440,7 +451,180 @@ mfn_t __init alloc_boot_pages(unsigned long nr_pfns, unsigned long pfn_align)
>      BUG();
>  }
>
> +static DEFINE_SPINLOCK(heap_lock);
>
> +/* Initialise fields which have other uses for free pages. */
> +static void init_free_page_fields(struct page_info *pg)
> +{
> +    pg->u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
> +    page_set_owner(pg, NULL);
> +}
> +
> +#ifdef CONFIG_CACHE_COLORING
> +/*************************
> + * COLORED SIDE-ALLOCATOR
> + *
> + * Pages are stored by their color in separate lists. Each list defines a color
> + * and it is initialized during end_boot_allocator, where each page's color
> + * is calculated and the page itself is put in the correct list.
> + * After initialization there will be N lists where N is the number of
> + * available colors on the platform.
> + * The {free|alloc}_color_heap_page overwrite pg->count_info, but they do it in
> + * the same way as the buddy allocator corresponding functions do:
> + * protecting the access with a critical section using heap_lock.
> + */
> +typedef struct page_list_head colored_pages_t;
> +static colored_pages_t *__ro_after_init _color_heap;
> +static unsigned long *__ro_after_init free_colored_pages;
> +
> +#define color_heap(color) (&_color_heap[color])
> +
> +static void free_color_heap_page(struct page_info *pg)
> +{
> +    struct page_info *pos;
> +    unsigned int color = page_to_color(pg);
> +    colored_pages_t *head = color_heap(color);
> +
> +    spin_lock(&heap_lock);
> +
> +    pg->count_info = PGC_state_free | PGC_colored;
> +    page_set_owner(pg, NULL);
> +    free_colored_pages[color]++;
> +
> +    page_list_for_each( pos, head )
> +    {
> +        if ( page_to_maddr(pos) < page_to_maddr(pg) )
> +            break;
> +    }
> +
> +    page_list_add_next(pg, pos, head);
> +
> +    spin_unlock(&heap_lock);
> +}
> +
> +static struct page_info *alloc_color_heap_page(unsigned int memflags,
> +                                               const unsigned int *colors,
> +                                               unsigned int num_colors)
> +{
> +    struct page_info *pg = NULL;
> +    unsigned int i, color;
> +    bool need_tlbflush = false;
> +    uint32_t tlbflush_timestamp = 0;
> +
> +    spin_lock(&heap_lock);
> +
> +    for ( i = 0; i < num_colors; i++ )
> +    {
> +        struct page_info *tmp;
> +
> +        if ( page_list_empty(color_heap(colors[i])) )
> +            continue;
> +
> +        tmp = page_list_first(color_heap(colors[i]));
> +        if ( !pg || page_to_maddr(tmp) > page_to_maddr(pg) )
> +            pg = tmp;
> +    }
> +
> +    if ( !pg )
> +    {
> +        spin_unlock(&heap_lock);
> +        return NULL;
> +    }
> +
> +    pg->count_info = PGC_state_inuse | PGC_colored;
> +
> +    if ( !(memflags & MEMF_no_tlbflush) )
> +        accumulate_tlbflush(&need_tlbflush, pg, &tlbflush_timestamp);
> +
> +    init_free_page_fields(pg);
> +    flush_page_to_ram(mfn_x(page_to_mfn(pg)),
> +                      !(memflags & MEMF_no_icache_flush));
> +
> +    color = page_to_color(pg);
> +    free_colored_pages[color]--;
> +    page_list_del(pg, color_heap(color));
> +
> +    spin_unlock(&heap_lock);
> +
> +    if ( need_tlbflush )
> +        filtered_flush_tlb_mask(tlbflush_timestamp);
> +
> +    return pg;
> +}
> +
> +static void __init init_color_heap_pages(struct page_info *pg,
> +                                         unsigned long nr_pages)
> +{
> +    unsigned int i;
> +
> +    if ( !_color_heap )
> +    {
> +        unsigned int max_colors = get_max_colors();
> +
> +        _color_heap = xmalloc_array(colored_pages_t, max_colors);
> +        BUG_ON(!_color_heap);
> +        free_colored_pages = xzalloc_array(unsigned long, max_colors);
> +        BUG_ON(!free_colored_pages);
> +
> +        for ( i = 0; i < max_colors; i++ )
> +            INIT_PAGE_LIST_HEAD(color_heap(i));
> +    }
> +
> +    printk(XENLOG_DEBUG
> +           "Init color heap with %lu pages starting from: %#"PRIx64"\n",
> +           nr_pages, page_to_maddr(pg));
> +
> +    for ( i = 0; i < nr_pages; i++ )
> +        free_color_heap_page(&pg[i]);
> +}
> +
> +static struct page_info *alloc_color_domheap_page(struct domain *d,
> +                                                  unsigned int memflags)
> +{
> +    struct page_info *pg;
> +
> +    pg = alloc_color_heap_page(memflags, d->arch.colors, d->arch.num_colors);
> +    if ( !pg )
> +        return NULL;
> +
> +    if ( !(memflags & MEMF_no_owner) )
> +    {
> +        if ( memflags & MEMF_no_refcount )
> +            pg->count_info |= PGC_extra;
> +        if ( assign_page(pg, 0, d, memflags) )
> +        {
> +            free_color_heap_page(pg);
> +            return NULL;
> +        }
> +    }
> +
> +    return pg;
> +}
> +
> +static void dump_color_heap(void)
> +{
> +    unsigned int color;
> +
> +    printk("Dumping coloring heap info\n");
> +    for ( color = 0; color < get_max_colors(); color++ )
> +        printk("Color heap[%u]: %lu pages\n", color, free_colored_pages[color]);
> +}
> +
> +integer_param("buddy-alloc-size", buddy_alloc_size);
> +
> +#else /* !CONFIG_CACHE_COLORING */
> +
> +static void __init init_color_heap_pages(struct page_info *pg,
> +                                         unsigned long nr_pages) {}
> +static struct page_info *alloc_color_domheap_page(struct domain *d,
> +                                                  unsigned int memflags)
> +{
> +    return NULL;
> +}
> +static void free_color_heap_page(struct page_info *pg) {}
> +static void dump_color_heap(void) {}
> +
> +#endif /* CONFIG_CACHE_COLORING */
>
>  /*************************
>   * BINARY BUDDY ALLOCATOR
> @@ -462,7 +646,6 @@ static unsigned long node_need_scrub[MAX_NUMNODES];
>  static unsigned long *avail[MAX_NUMNODES];
>  static long total_avail_pages;
>
> -static DEFINE_SPINLOCK(heap_lock);
>  static long outstanding_claims; /* total outstanding claims by all domains */
>
>  unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
> @@ -1027,10 +1210,7 @@ static struct page_info *alloc_heap_pages(
>              accumulate_tlbflush(&need_tlbflush, &pg[i],
>                                  &tlbflush_timestamp);
>
> -        /* Initialise fields which have other uses for free pages. */
> -        pg[i].u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
> -        page_set_owner(&pg[i], NULL);
> -
> +        init_free_page_fields(&pg[i]);
>      }
>
>      spin_unlock(&heap_lock);
> @@ -1926,24 +2106,49 @@ static unsigned long avail_heap_pages(
>  void __init end_boot_allocator(void)
>  {
>      unsigned int i;
> +    unsigned long buddy_pages;
>
> -    /* Pages that are free now go to the domain sub-allocator. */
> -    for ( i = 0; i < nr_bootmem_regions; i++ )
> +    buddy_pages = PFN_DOWN(buddy_alloc_size);
> +
> +    if ( !IS_ENABLED(CONFIG_CACHE_COLORING) )
>      {
> -        struct bootmem_region *r = &bootmem_region_list[i];
> -        if ( (r->s < r->e) &&
> -             (phys_to_nid(pfn_to_paddr(r->s)) == cpu_to_node(0)) )
> +        /* Pages that are free now go to the domain sub-allocator. */
> +        for ( i = 0; i < nr_bootmem_regions; i++ )
>          {
> -            init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
> -            r->e = r->s;
> -            break;
> +            struct bootmem_region *r = &bootmem_region_list[i];
> +            if ( (r->s < r->e) &&
> +                (phys_to_nid(pfn_to_paddr(r->s)) == cpu_to_node(0)) )
> +            {
> +                init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
> +                r->e = r->s;
> +                break;
> +            }
>          }
>      }
> +
>      for ( i = nr_bootmem_regions; i-- > 0; )
>      {
> -        struct bootmem_region *r = &bootmem_region_list[i];
> +        struct bootmem_region *r;
> +
> +        if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
> +            r = &bootmem_region_list[nr_bootmem_regions - i - 1];
> +        else
> +            r = &bootmem_region_list[i];
> +
> +        if ( buddy_pages && (r->s < r->e) )
> +        {
> +            unsigned long pages = MIN(r->e - r->s, buddy_pages);
> +            init_heap_pages(mfn_to_page(_mfn(r->s)), pages);
> +            r->s += pages;
> +            buddy_pages -= pages;
> +        }
>          if ( r->s < r->e )
> -            init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
> +        {
> +            if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
> +                init_color_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
> +            else
> +                init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
> +        }
>      }
>      nr_bootmem_regions = 0;
>
> @@ -2344,7 +2549,8 @@ int assign_pages(
>
>          for ( i = 0; i < nr; i++ )
>          {
> -            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
> +            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static |
> +                                          PGC_colored)));
>              if ( pg[i].count_info & PGC_extra )
>                  extra_pages++;
>          }
> @@ -2429,6 +2635,15 @@ struct page_info *alloc_domheap_pages(
>
>      ASSERT_ALLOC_CONTEXT();
>
> +    /* Only domains are supported for coloring */
> +    if ( IS_ENABLED(CONFIG_CACHE_COLORING) && d )
> +    {
> +        /* Colored allocation must be done on 0 order */
> +        if ( order )
> +            return NULL;
> +        return alloc_color_domheap_page(d, memflags);
> +    }
> +
>      bits = domain_clamp_alloc_bitsize(memflags & MEMF_no_owner ? NULL : d,
>                                        bits ? : (BITS_PER_LONG+PAGE_SHIFT));
>
> @@ -2546,7 +2761,10 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
>              scrub = 1;
>          }
>
> -        free_heap_pages(pg, order, scrub);
> +        if ( pg->count_info & PGC_colored )
> +            free_color_heap_page(pg);
> +        else
> +            free_heap_pages(pg, order, scrub);
>      }
>
>      if ( drop_dom_ref )
> @@ -2653,6 +2871,9 @@ static void cf_check dump_heap(unsigned char key)
>              continue;
>          printk("Node %d has %lu unscrubbed pages\n", i, node_need_scrub[i]);
>      }
> +
> +    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
> +        dump_color_heap();
>  }
>
>  static __init int cf_check register_heap_trigger(void)
> @@ -2785,9 +3006,7 @@ static bool prepare_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>           * to PGC_state_inuse.
>           */
>          pg[i].count_info = PGC_static | PGC_state_inuse;
> -        /* Initialise fields which have other uses for free pages. */
> -        pg[i].u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
> -        page_set_owner(&pg[i], NULL);
> +        init_free_page_fields(&pg[i]);
>      }
>
>      spin_unlock(&heap_lock);
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index a925028ab3..0d48502e75 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -297,6 +297,37 @@ page_list_add_tail(struct page_info *page, struct page_list_head *head)
>      }
>      head->tail = page;
>  }
> +static inline void
> +_page_list_add(struct page_info *new, struct page_info *prev,
> +               struct page_info *next)
> +{
> +    new->list.prev = page_to_pdx(prev);
> +       new->list.next = page_to_pdx(next);
> +       prev->list.next = page_to_pdx(new);
> +       next->list.prev = page_to_pdx(new);
> +}
> +static inline void
> +page_list_add_next(struct page_info *new, struct page_info *prev,
> +                   struct page_list_head *head)
> +{
> +       struct page_info *next = page_list_next(prev, head);
> +
> +    if ( !next )
> +        page_list_add_tail(new, head);
> +    else
> +        _page_list_add(new, prev, next);
> +}
> +static inline void
> +page_list_add_prev(struct page_info *new, struct page_info *next,
> +                   struct page_list_head *head)
> +{
> +       struct page_info *prev = page_list_prev(next, head);
> +
> +    if ( !prev )
> +        page_list_add(new, head);
> +    else
> +        _page_list_add(new, prev, next);
> +}
>  static inline bool_t
>  __page_list_del_head(struct page_info *page, struct page_list_head *head,
>                       struct page_info *next, struct page_info *prev)
> @@ -449,6 +480,18 @@ page_list_add_tail(struct page_info *page, struct page_list_head *head)
>      list_add_tail(&page->list, head);
>  }
>  static inline void
> +page_list_add_next(struct page_info *new, struct page_info *prev,
> +                   struct page_list_head *head)
> +{
> +       page_list_add_tail(new, &prev->list);
> +}
> +static inline void
> +page_list_add_prev(struct page_info *new, struct page_info *next,
> +                   struct page_list_head *head)
> +{
> +    page_list_add(new, &next->list);
> +}
> +static inline void
>  page_list_del(struct page_info *page, struct page_list_head *head)
>  {
>      list_del(&page->list);
> --
> 2.34.1
>

