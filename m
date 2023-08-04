Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1535770AB8
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 23:20:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577337.904402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS2DI-00075t-NW; Fri, 04 Aug 2023 21:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577337.904402; Fri, 04 Aug 2023 21:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS2DI-00074D-K1; Fri, 04 Aug 2023 21:20:00 +0000
Received: by outflank-mailman (input) for mailman id 577337;
 Fri, 04 Aug 2023 21:19:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qS2DG-000734-Rm
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 21:19:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a80c6d19-330c-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 23:19:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26CAA62039;
 Fri,  4 Aug 2023 21:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5FEC433C7;
 Fri,  4 Aug 2023 21:19:51 +0000 (UTC)
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
X-Inumbo-ID: a80c6d19-330c-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691183993;
	bh=MjH+DgMHp7Kz20cod7LEVtviJLOzWuuJbcDcC5kF8PA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AG46CrKNwHHdZGOGkWXZ5ojdUjdTacGHR6YetlOmiUHbc1Ur+A5++N7+rw0wPVbRv
	 Vm+kSIPLEZtwakUGH6bWBKvuPm9S3EoxGHc0NSyqNpT/wCH8pe1qrhFn4USTgbqxyf
	 2JgSz06bFCO8cWiwWfPCEOybGxhnIILJcIvWudPJZcz4wi5G7s9/1nnmljHkhXb+IA
	 WjBtAPe9ULJBQhhJ967E8rxzRwW9iD3zjqp0cbgItPnLLr8Yv/s+1oWmbtwXMlbH1I
	 4C9edrXG266C+Y7uqY8DO9GfsgEy0v3MHMq8gmCPRmB8DX4F0kk2rZ9ytnXzG5DpV0
	 NpOF5MOkOysow==
Date: Fri, 4 Aug 2023 14:19:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/6] x86: rename variable 'e820' to address MISRA
 C:2012 Rule 5.3
In-Reply-To: <896a2235560fd348f79eded33731609c5d2e74ab.1691162261.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308041405240.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com> <896a2235560fd348f79eded33731609c5d2e74ab.1691162261.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Aug 2023, Nicola Vetrini wrote:
> The variable declared in the header file 'xen/arch/x86/include/asm/e820.h'
> is shadowed by many function parameters, so it is renamed to avoid these
> violations.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> This patch is similar to other renames done on previous patches, and the
> preferred strategy there was to rename the global variable. This one
> has more occurrences that are spread in various files, but
> the general pattern is the same.
> ---
>  xen/arch/x86/dom0_build.c                | 10 ++--
>  xen/arch/x86/e820.c                      | 66 ++++++++++++------------
>  xen/arch/x86/guest/xen/xen.c             |  4 +-
>  xen/arch/x86/hvm/dom0_build.c            |  6 +--
>  xen/arch/x86/include/asm/e820.h          |  2 +-
>  xen/arch/x86/mm.c                        | 49 +++++++++---------
>  xen/arch/x86/numa.c                      |  8 +--
>  xen/arch/x86/setup.c                     | 22 ++++----
>  xen/arch/x86/srat.c                      |  6 +--
>  xen/arch/x86/x86_64/mmconf-fam10h.c      |  2 +-
>  xen/drivers/passthrough/amd/iommu_acpi.c |  2 +-

There are missing changes to xen/arch/x86/tboot.c

There a few stray changes below.

Everything else is correct.


>  11 files changed, 89 insertions(+), 88 deletions(-)
> 
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 8b1fcc6471..bfb6400376 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -534,13 +534,13 @@ int __init dom0_setup_permissions(struct domain *d)
>      }
>  
>      /* Remove access to E820_UNUSABLE I/O regions above 1MB. */
> -    for ( i = 0; i < e820.nr_map; i++ )
> +    for ( i = 0; i < e820_map.nr_map; i++ )
>      {
>          unsigned long sfn, efn;
> -        sfn = max_t(unsigned long, paddr_to_pfn(e820.map[i].addr), 0x100ul);
> -        efn = paddr_to_pfn(e820.map[i].addr + e820.map[i].size - 1);
> -        if ( (e820.map[i].type == E820_UNUSABLE) &&
> -             (e820.map[i].size != 0) &&
> +        sfn = max_t(unsigned long, paddr_to_pfn(e820_map.map[i].addr), 0x100ul);
> +        efn = paddr_to_pfn(e820_map.map[i].addr + e820_map.map[i].size - 1);
> +        if ( (e820_map.map[i].type == E820_UNUSABLE) &&
> +             (e820_map.map[i].size != 0) &&
>               (sfn <= efn) )
>              rc |= iomem_deny_access(d, sfn, efn);
>      }
> diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
> index 0b89935510..4425011c01 100644
> --- a/xen/arch/x86/e820.c
> +++ b/xen/arch/x86/e820.c
> @@ -34,7 +34,7 @@ boolean_param("e820-mtrr-clip", e820_mtrr_clip);
>  static bool __initdata e820_verbose;
>  boolean_param("e820-verbose", e820_verbose);
>  
> -struct e820map e820;
> +struct e820map e820_map;
>  struct e820map __initdata e820_raw;
>  
>  /*
> @@ -47,8 +47,8 @@ int __init e820_all_mapped(u64 start, u64 end, unsigned type)
>  {
>  	unsigned int i;
>  
> -	for (i = 0; i < e820.nr_map; i++) {
> -		struct e820entry *ei = &e820.map[i];
> +	for (i = 0; i < e820_map.nr_map; i++) {
> +		struct e820entry *ei = &e820_map.map[i];
>  
>  		if (type && ei->type != type)
>  			continue;
> @@ -75,17 +75,17 @@ int __init e820_all_mapped(u64 start, u64 end, unsigned type)
>  static void __init add_memory_region(unsigned long long start,
>                                       unsigned long long size, int type)
>  {
> -    unsigned int x = e820.nr_map;
> +    unsigned int x = e820_map.nr_map;
>  
> -    if (x == ARRAY_SIZE(e820.map)) {
> +    if (x == ARRAY_SIZE(e820_map.map)) {
>          printk(KERN_ERR "Ooops! Too many entries in the memory map!\n");
>          return;
>      }
>  
> -    e820.map[x].addr = start;
> -    e820.map[x].size = size;
> -    e820.map[x].type = type;
> -    e820.nr_map++;
> +    e820_map.map[x].addr = start;
> +    e820_map.map[x].size = size;
> +    e820_map.map[x].type = type;
> +    e820_map.nr_map++;
>  }
>  
>  void __init print_e820_memory_map(const struct e820entry *map,
> @@ -347,13 +347,13 @@ static unsigned long __init find_max_pfn(void)
>      unsigned int i;
>      unsigned long max_pfn = 0;
>  
> -    for (i = 0; i < e820.nr_map; i++) {
> +    for (i = 0; i < e820_map.nr_map; i++) {
>          unsigned long start, end;
>          /* RAM? */
> -        if (e820.map[i].type != E820_RAM)
> +        if (e820_map.map[i].type != E820_RAM)
>              continue;
> -        start = PFN_UP(e820.map[i].addr);
> -        end = PFN_DOWN(e820.map[i].addr + e820.map[i].size);
> +        start = PFN_UP(e820_map.map[i].addr);
> +        end = PFN_DOWN(e820_map.map[i].addr + e820_map.map[i].size);
>          if (start >= end)
>              continue;
>          if (end > max_pfn)
> @@ -372,21 +372,21 @@ static void __init clip_to_limit(uint64_t limit, const char *warnmsg)
>      for ( ; ; )
>      {
>          /* Find a RAM region needing clipping. */
> -        for ( i = 0; i < e820.nr_map; i++ )
> -            if ( (e820.map[i].type == E820_RAM) &&
> -                 ((e820.map[i].addr + e820.map[i].size) > limit) )
> +        for ( i = 0; i < e820_map.nr_map; i++ )
> +            if ( (e820_map.map[i].type == E820_RAM) &&
> +                 ((e820_map.map[i].addr + e820_map.map[i].size) > limit) )
>                  break;
>  
>          /* If none found, we are done. */
> -        if ( i == e820.nr_map )
> -            break;        
> +        if ( i == e820_map.nr_map )
> +            break;
>  
>          old_limit = max_t(
> -            uint64_t, old_limit, e820.map[i].addr + e820.map[i].size);
> +            uint64_t, old_limit, e820_map.map[i].addr + e820_map.map[i].size);
>  
>          /* We try to convert clipped RAM areas to E820_UNUSABLE. */
> -        if ( e820_change_range_type(&e820, max(e820.map[i].addr, limit),
> -                                    e820.map[i].addr + e820.map[i].size,
> +        if ( e820_change_range_type(&e820_map, max(e820_map.map[i].addr, limit),
> +                                    e820_map.map[i].addr + e820_map.map[i].size,
>                                      E820_RAM, E820_UNUSABLE) )
>              continue;
>  
> @@ -394,15 +394,15 @@ static void __init clip_to_limit(uint64_t limit, const char *warnmsg)
>           * If the type change fails (e.g., not space in table) then we clip or 
>           * delete the region as appropriate.
>           */
> -        if ( e820.map[i].addr < limit )
> +        if ( e820_map.map[i].addr < limit )
>          {
> -            e820.map[i].size = limit - e820.map[i].addr;
> +            e820_map.map[i].size = limit - e820_map.map[i].addr;
>          }
>          else
>          {
> -            memmove(&e820.map[i], &e820.map[i+1],
> -                    (e820.nr_map - i - 1) * sizeof(struct e820entry));
> -            e820.nr_map--;
> +            memmove(&e820_map.map[i], &e820_map.map[i+1],
> +                    (e820_map.nr_map - i - 1) * sizeof(struct e820entry));
> +            e820_map.nr_map--;
>          }
>      }
>  
> @@ -497,7 +497,7 @@ static void __init reserve_dmi_region(void)
>          if ( !what )
>              break;
>          if ( ((base + len) > base) &&
> -             reserve_e820_ram(&e820, base, base + len) )
> +             reserve_e820_ram(&e820_map, base, base + len) )
>              printk("WARNING: %s table located in E820 RAM %"PRIpaddr"-%"PRIpaddr". Fixed.\n",
>                     what, base, base + len);
>      }
> @@ -517,12 +517,12 @@ static void __init machine_specific_memory_setup(struct e820map *raw)
>  
>      if ( opt_availmem )
>      {
> -        for ( i = size = 0; (i < e820.nr_map) && (size <= opt_availmem); i++ )
> -            if ( e820.map[i].type == E820_RAM )
> -                size += e820.map[i].size;
> +        for ( i = size = 0; (i < e820_map.nr_map) && (size <= opt_availmem); i++ )
> +            if ( e820_map.map[i].type == E820_RAM )
> +                size += e820_map.map[i].size;
>          if ( size > opt_availmem )
>              clip_to_limit(
> -                e820.map[i-1].addr + e820.map[i-1].size - (size-opt_availmem),
> +                e820_map.map[i-1].addr + e820_map.map[i-1].size - (size-opt_availmem),
>                  NULL);
>      }
>  
> @@ -694,10 +694,10 @@ unsigned long __init init_e820(const char *str, struct e820map *raw)
>      machine_specific_memory_setup(raw);
>  
>      if ( cpu_has_hypervisor )
> -        hypervisor_e820_fixup(&e820);
> +        hypervisor_e820_fixup(&e820_map);
>  
>      printk("%s RAM map:\n", str);
> -    print_e820_memory_map(e820.map, e820.nr_map);
> +    print_e820_memory_map(e820_map.map, e820_map.nr_map);
>  
>      return find_max_pfn();
>  }
> diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
> index f93dfc89f7..3ec828b98d 100644
> --- a/xen/arch/x86/guest/xen/xen.c
> +++ b/xen/arch/x86/guest/xen/xen.c
> @@ -147,9 +147,9 @@ static void __init init_memmap(void)
>                                            PFN_DOWN(GB(4) - 1))) )
>          panic("unable to add RAM to in-use PFN rangeset\n");
>  
> -    for ( i = 0; i < e820.nr_map; i++ )
> +    for ( i = 0; i < e820_map.nr_map; i++ )
>      {
> -        struct e820entry *e = &e820.map[i];
> +        struct e820entry *e = &e820_map.map[i];
>  
>          if ( rangeset_add_range(mem, PFN_DOWN(e->addr),
>                                  PFN_UP(e->addr + e->size - 1)) )
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index bc0e290db6..98203f7a52 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -333,13 +333,13 @@ static __init void pvh_setup_e820(struct domain *d, unsigned long nr_pages)
>       * Add an extra entry in case we have to split a RAM entry into a RAM and a
>       * UNUSABLE one in order to truncate it.
>       */
> -    d->arch.e820 = xzalloc_array(struct e820entry, e820.nr_map + 1);
> +    d->arch.e820 = xzalloc_array(struct e820entry, e820_map.nr_map + 1);
>      if ( !d->arch.e820 )
>          panic("Unable to allocate memory for Dom0 e820 map\n");
>      entry_guest = d->arch.e820;
>  
>      /* Clamp e820 memory map to match the memory assigned to Dom0 */
> -    for ( i = 0, entry = e820.map; i < e820.nr_map; i++, entry++ )
> +    for ( i = 0, entry = e820_map.map; i < e820_map.nr_map; i++, entry++ )
>      {
>          *entry_guest = *entry;
>  
> @@ -392,7 +392,7 @@ static __init void pvh_setup_e820(struct domain *d, unsigned long nr_pages)
>   next:
>          d->arch.nr_e820++;
>          entry_guest++;
> -        ASSERT(d->arch.nr_e820 <= e820.nr_map + 1);
> +        ASSERT(d->arch.nr_e820 <= e820_map.nr_map + 1);
>      }
>      ASSERT(cur_pages == nr_pages);
>  }
> diff --git a/xen/arch/x86/include/asm/e820.h b/xen/arch/x86/include/asm/e820.h
> index 213d5b5dd2..0865825f7d 100644
> --- a/xen/arch/x86/include/asm/e820.h
> +++ b/xen/arch/x86/include/asm/e820.h
> @@ -34,7 +34,7 @@ extern int e820_add_range(
>  extern unsigned long init_e820(const char *str, struct e820map *raw);
>  extern void print_e820_memory_map(const struct e820entry *map,
>      unsigned int entries);
> -extern struct e820map e820;
> +extern struct e820map e820_map;
>  extern struct e820map e820_raw;
>  
>  /* These symbols live in the boot trampoline. */
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index be2b10a391..6920ac939f 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -295,12 +295,12 @@ void __init arch_init_memory(void)
>      /* Any areas not specified as RAM by the e820 map are considered I/O. */
>      for ( i = 0, pfn = 0; pfn < max_page; i++ )
>      {
> -        while ( (i < e820.nr_map) &&
> -                (e820.map[i].type != E820_RAM) &&
> -                (e820.map[i].type != E820_UNUSABLE) )
> +        while ( (i < e820_map.nr_map) &&
> +                (e820_map.map[i].type != E820_RAM) &&
> +                (e820_map.map[i].type != E820_UNUSABLE) )
>              i++;
>  
> -        if ( i >= e820.nr_map )
> +        if ( i >= e820_map.nr_map )
>          {
>              /* No more RAM regions: mark as I/O right to end of memory map. */
>              rstart_pfn = rend_pfn = max_page;
> @@ -309,9 +309,10 @@ void __init arch_init_memory(void)
>          {
>              /* Mark as I/O just up as far as next RAM region. */
>              rstart_pfn = min_t(unsigned long, max_page,
> -                               PFN_UP(e820.map[i].addr));
> +                               PFN_UP(e820_map.map[i].addr));
>              rend_pfn   = max_t(unsigned long, rstart_pfn,
> -                               PFN_DOWN(e820.map[i].addr + e820.map[i].size));
> +                               PFN_DOWN(e820_map.map[i].addr
> +                               + e820_map.map[i].size));
>          }
>  
>          /*
> @@ -387,9 +388,9 @@ int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
>      uint64_t maddr = pfn_to_paddr(mfn);
>      int i;
>  
> -    for ( i = 0; i < e820.nr_map; i++ )
> +    for ( i = 0; i < e820_map.nr_map; i++ )
>      {
> -        switch ( e820.map[i].type )
> +        switch ( e820_map.map[i].type )
>          {
>          case E820_RAM:
>              if ( mem_type & RAM_TYPE_CONVENTIONAL )
> @@ -414,8 +415,8 @@ int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
>          }
>  
>          /* Test the range. */
> -        if ( (e820.map[i].addr <= maddr) &&
> -             ((e820.map[i].addr + e820.map[i].size) >= (maddr + PAGE_SIZE)) )
> +        if ( (e820_map.map[i].addr <= maddr) &&
> +             ((e820_map.map[i].addr + e820_map.map[i].size) >= (maddr + PAGE_SIZE)) )
>              return 1;
>      }
>  
> @@ -427,17 +428,17 @@ unsigned int page_get_ram_type(mfn_t mfn)
>      uint64_t last = 0, maddr = mfn_to_maddr(mfn);
>      unsigned int i, type = 0;
>  
> -    for ( i = 0; i < e820.nr_map;
> -          last = e820.map[i].addr + e820.map[i].size, i++ )
> +    for ( i = 0; i < e820_map.nr_map;
> +          last = e820_map.map[i].addr + e820_map.map[i].size, i++ )
>      {
> -        if ( (maddr + PAGE_SIZE) > last && maddr < e820.map[i].addr )
> +        if ( (maddr + PAGE_SIZE) > last && maddr < e820_map.map[i].addr )
>              type |= RAM_TYPE_UNKNOWN;
>  
> -        if ( (maddr + PAGE_SIZE) <= e820.map[i].addr ||
> -             maddr >= (e820.map[i].addr + e820.map[i].size) )
> +        if ( (maddr + PAGE_SIZE) <= e820_map.map[i].addr ||
> +             maddr >= (e820_map.map[i].addr + e820_map.map[i].size) )
>              continue;
>  
> -        switch ( e820.map[i].type )
> +        switch ( e820_map.map[i].type )
>          {
>          case E820_RAM:
>              type |= RAM_TYPE_CONVENTIONAL;
> @@ -778,9 +779,9 @@ bool is_memory_hole(mfn_t start, mfn_t end)
>      unsigned long e = mfn_x(end);
>      unsigned int i;
>  
> -    for ( i = 0; i < e820.nr_map; i++ )
> +    for ( i = 0; i < e820_map.nr_map; i++ )
>      {
> -        const struct e820entry *entry = &e820.map[i];
> +        const struct e820entry *entry = &e820_map.map[i];
>  
>          if ( !entry->size )
>              continue;
> @@ -4763,16 +4764,16 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  
>          store = !guest_handle_is_null(ctxt.map.buffer);
>  
> -        if ( store && ctxt.map.nr_entries < e820.nr_map + 1 )
> +        if ( store && ctxt.map.nr_entries < e820_map.nr_map + 1 )
>              return -EINVAL;
>  
>          buffer = guest_handle_cast(ctxt.map.buffer, e820entry_t);
>          if ( store && !guest_handle_okay(buffer, ctxt.map.nr_entries) )
>              return -EFAULT;
>  
> -        for ( i = 0, ctxt.n = 0, ctxt.s = 0; i < e820.nr_map; ++i, ++ctxt.n )
> +        for ( i = 0, ctxt.n = 0, ctxt.s = 0; i < e820_map.nr_map; ++i, ++ctxt.n )
>          {
> -            unsigned long s = PFN_DOWN(e820.map[i].addr);
> +            unsigned long s = PFN_DOWN(e820_map.map[i].addr);
>  
>              if ( s > ctxt.s )
>              {
> @@ -4786,12 +4787,12 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>              }
>              if ( store )
>              {
> -                if ( ctxt.map.nr_entries <= ctxt.n + (e820.nr_map - i) )
> +                if ( ctxt.map.nr_entries <= ctxt.n + (e820_map.nr_map - i) )
>                      return -EINVAL;
> -                if ( __copy_to_guest_offset(buffer, ctxt.n, e820.map + i, 1) )
> +                if ( __copy_to_guest_offset(buffer, ctxt.n, e820_map.map + i, 1) )
>                      return -EFAULT;
>              }
> -            ctxt.s = PFN_UP(e820.map[i].addr + e820.map[i].size);
> +            ctxt.s = PFN_UP(e820_map.map[i].addr + e820_map.map[i].size);
>          }
>  
>          if ( ctxt.s )
> diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
> index 4b0b297c7e..76827f5f32 100644
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -102,14 +102,14 @@ unsigned int __init arch_get_dma_bitsize(void)
>  
>  int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
>  {
> -    if ( idx >= e820.nr_map )
> +    if ( idx >= e820_map.nr_map )
>          return -ENOENT;
>  
> -    if ( e820.map[idx].type != E820_RAM )
> +    if ( e820_map.map[idx].type != E820_RAM )
>          return -ENODATA;
>  
> -    *start = e820.map[idx].addr;
> -    *end = *start + e820.map[idx].size;
> +    *start = e820_map.map[idx].addr;
> +    *end = *start + e820_map.map[idx].size;
>  
>      return 0;
>  }
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 80ae973d64..9c6003e374 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1163,7 +1163,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>      }
>      else if ( efi_enabled(EFI_BOOT) )
>          memmap_type = "EFI";
> -    else if ( (e820_raw.nr_map = 
> +    else if ( (e820_raw.nr_map =

stray change


>                     copy_bios_e820(e820_raw.map,
>                                    ARRAY_SIZE(e820_raw.map))) != 0 )
>      {
> @@ -1300,13 +1300,13 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>      }
>  
>      /* Create a temporary copy of the E820 map. */
> -    memcpy(&boot_e820, &e820, sizeof(e820));
> +    memcpy(&boot_e820, &e820_map, sizeof(e820_map));
>  
>      /* Early kexec reservation (explicit static start address). */
>      nr_pages = 0;
> -    for ( i = 0; i < e820.nr_map; i++ )
> -        if ( e820.map[i].type == E820_RAM )
> -            nr_pages += e820.map[i].size >> PAGE_SHIFT;
> +    for ( i = 0; i < e820_map.nr_map; i++ )
> +        if ( e820_map.map[i].type == E820_RAM )
> +            nr_pages += e820_map.map[i].size >> PAGE_SHIFT;
>      set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
>      kexec_reserve_area(&boot_e820);
>  
> @@ -1631,7 +1631,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>          unsigned long e = min(s + PFN_UP(kexec_crash_area.size),
>                                PFN_UP(__pa(HYPERVISOR_VIRT_END - 1)));
>  
> -        if ( e > s ) 
> +        if ( e > s )

stray change


>              map_pages_to_xen((unsigned long)__va(kexec_crash_area.start),
>                               _mfn(s), e - s, PAGE_HYPERVISOR);
>      }
> @@ -1677,9 +1677,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>                          PAGE_HYPERVISOR_RO);
>  
>      nr_pages = 0;
> -    for ( i = 0; i < e820.nr_map; i++ )
> -        if ( e820.map[i].type == E820_RAM )
> -            nr_pages += e820.map[i].size >> PAGE_SHIFT;
> +    for ( i = 0; i < e820_map.nr_map; i++ )
> +        if ( e820_map.map[i].type == E820_RAM )
> +            nr_pages += e820_map.map[i].size >> PAGE_SHIFT;
>      printk("System RAM: %luMB (%lukB)\n",
>             nr_pages >> (20 - PAGE_SHIFT),
>             nr_pages << (PAGE_SHIFT - 10));
> @@ -1771,7 +1771,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>  
>      open_softirq(NEW_TLBFLUSH_CLOCK_PERIOD_SOFTIRQ, new_tlbflush_clock_period);
>  
> -    if ( opt_watchdog ) 
> +    if ( opt_watchdog )
>          nmi_watchdog = NMI_LOCAL_APIC;

stray change


>      find_smp_config();
> @@ -1983,7 +1983,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>  
>      do_initcalls();
>  
> -    if ( opt_watchdog ) 
> +    if ( opt_watchdog )
>          watchdog_setup();

stray change


>      if ( !tboot_protect_mem_regions() )
> diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
> index 3f70338e6e..bbd04978ae 100644
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -301,11 +301,11 @@ void __init srat_parse_regions(paddr_t addr)
>  	acpi_table_parse_srat(ACPI_SRAT_TYPE_MEMORY_AFFINITY,
>  			      srat_parse_region, 0);
>  
> -	for (mask = srat_region_mask, i = 0; mask && i < e820.nr_map; i++) {
> -		if (e820.map[i].type != E820_RAM)
> +	for (mask = srat_region_mask, i = 0; mask && i < e820_map.nr_map; i++) {
> +		if (e820_map.map[i].type != E820_RAM)
>  			continue;
>  
> -		if (~mask & pdx_region_mask(e820.map[i].addr, e820.map[i].size))
> +		if (~mask & pdx_region_mask(e820_map.map[i].addr, e820_map.map[i].size))
>  			mask = 0;
>  	}
>  
> diff --git a/xen/arch/x86/x86_64/mmconf-fam10h.c b/xen/arch/x86/x86_64/mmconf-fam10h.c
> index a834ab3149..bbebf9219f 100644
> --- a/xen/arch/x86/x86_64/mmconf-fam10h.c
> +++ b/xen/arch/x86/x86_64/mmconf-fam10h.c
> @@ -135,7 +135,7 @@ static void __init get_fam10h_pci_mmconf_base(void)
>  	return;
>  
>  out:
> -	if (e820_add_range(&e820, start, start + SIZE, E820_RESERVED))
> +	if (e820_add_range(&e820_map, start, start + SIZE, E820_RESERVED))
>  		fam10h_pci_mmconf_base = start;
>  }
>  
> diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
> index 3b577c9b39..7ad9e12b8a 100644
> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -418,7 +418,7 @@ static int __init parse_ivmd_block(const struct acpi_ivrs_memory *ivmd_block)
>  
>              if ( type == RAM_TYPE_UNKNOWN )
>              {
> -                if ( e820_add_range(&e820, addr, addr + PAGE_SIZE,
> +                if ( e820_add_range(&e820_map, addr, addr + PAGE_SIZE,
>                                      E820_RESERVED) )
>                      continue;
>                  AMD_IOMMU_ERROR("IVMD: page at %lx couldn't be reserved\n",
> -- 
> 2.34.1
> 

