Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EF2265E52
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 12:44:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGgX6-00041h-8s; Fri, 11 Sep 2020 10:43:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eh3a=CU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGgX4-00041c-HN
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 10:43:54 +0000
X-Inumbo-ID: 1727403d-8dd7-4268-b09b-1f145f7f3e9b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1727403d-8dd7-4268-b09b-1f145f7f3e9b;
 Fri, 11 Sep 2020 10:43:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 321F2AD08;
 Fri, 11 Sep 2020 10:44:08 +0000 (UTC)
Subject: Ping: [PATCH v2 2/2] EFI: free unused boot mem in at least some cases
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
References: <5dd2fcea-d8ec-1c20-6514-c7733b59047f@suse.com>
 <f474ff55-cd39-fd6e-f96e-942a17e959ee@suse.com>
Message-ID: <4c8e6dad-bcc8-818f-0f58-e2111ff28b5f@suse.com>
Date: Fri, 11 Sep 2020 12:43:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f474ff55-cd39-fd6e-f96e-942a17e959ee@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.08.2020 14:08, Jan Beulich wrote:
> Address at least the primary reason why 52bba67f8b87 ("efi/boot: Don't
> free ebmalloc area at all") was put in place: Make xen_in_range() aware
> of the freed range. This is in particular relevant for EFI-enabled
> builds not actually running on EFI, as the entire range will be unused
> in this case.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Also adjust the two places where comments point out that they need
>     to remain in sync with xen_in_range(). Add assertions to
>     xen_in_range().

Anyone?

> ---
> The remaining issue could be addressed too, by making the area 2M in
> size and 2M-aligned.
> 
> --- a/xen/arch/x86/efi/stub.c
> +++ b/xen/arch/x86/efi/stub.c
> @@ -52,6 +52,12 @@ bool efi_enabled(unsigned int feature)
>  
>  void __init efi_init_memory(void) { }
>  
> +bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
> +{
> +    *start = *end = (unsigned long)_end;
> +    return false;
> +}
> +
>  void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e) { }
>  
>  bool efi_rs_using_pgtables(void)
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -608,7 +608,7 @@ static void __init kexec_reserve_area(st
>  #endif
>  }
>  
> -static inline bool using_2M_mapping(void)
> +bool using_2M_mapping(void)
>  {
>      return !l1_table_offset((unsigned long)__2M_text_end) &&
>             !l1_table_offset((unsigned long)__2M_rodata_start) &&
> @@ -830,6 +830,7 @@ void __init noreturn __start_xen(unsigne
>      module_t *mod;
>      unsigned long nr_pages, raw_max_page, modules_headroom, module_map[1];
>      int i, j, e820_warn = 0, bytes = 0;
> +    unsigned long eb_start, eb_end;
>      bool acpi_boot_table_init_done = false, relocated = false;
>      int ret;
>      struct ns16550_defaults ns16550 = {
> @@ -1145,7 +1146,8 @@ void __init noreturn __start_xen(unsigne
>  
>          /*
>           * This needs to remain in sync with xen_in_range() and the
> -         * respective reserve_e820_ram() invocation below.
> +         * respective reserve_e820_ram() invocation below. No need to
> +         * query efi_boot_mem_unused() here, though.
>           */
>          mod[mbi->mods_count].mod_start = virt_to_mfn(_stext);
>          mod[mbi->mods_count].mod_end = __2M_rwdata_end - _stext;
> @@ -1418,7 +1420,13 @@ void __init noreturn __start_xen(unsigne
>          panic("Not enough memory to relocate Xen\n");
>  
>      /* This needs to remain in sync with xen_in_range(). */
> -    reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));
> +    if ( efi_boot_mem_unused(&eb_start, &eb_end) )
> +    {
> +        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start));
> +        reserve_e820_ram(&boot_e820, __pa(eb_end), __pa(__2M_rwdata_end));
> +    }
> +    else
> +        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));
>  
>      /* Late kexec reservation (dynamic start address). */
>      kexec_reserve_area(&boot_e820);
> @@ -1979,7 +1987,7 @@ int __hwdom_init xen_in_range(unsigned l
>      paddr_t start, end;
>      int i;
>  
> -    enum { region_s3, region_ro, region_rw, nr_regions };
> +    enum { region_s3, region_ro, region_rw, region_bss, nr_regions };
>      static struct {
>          paddr_t s, e;
>      } xen_regions[nr_regions] __hwdom_initdata;
> @@ -2004,6 +2012,14 @@ int __hwdom_init xen_in_range(unsigned l
>          /* hypervisor .data + .bss */
>          xen_regions[region_rw].s = __pa(&__2M_rwdata_start);
>          xen_regions[region_rw].e = __pa(&__2M_rwdata_end);
> +        if ( efi_boot_mem_unused(&start, &end) )
> +        {
> +            ASSERT(__pa(start) >= xen_regions[region_rw].s);
> +            ASSERT(__pa(end) <= xen_regions[region_rw].e);
> +            xen_regions[region_rw].e = __pa(start);
> +            xen_regions[region_bss].s = __pa(end);
> +            xen_regions[region_bss].e = __pa(&__2M_rwdata_end);
> +        }
>      }
>  
>      start = (paddr_t)mfn << PAGE_SHIFT;
> --- a/xen/arch/x86/tboot.c
> +++ b/xen/arch/x86/tboot.c
> @@ -1,3 +1,4 @@
> +#include <xen/efi.h>
>  #include <xen/init.h>
>  #include <xen/types.h>
>  #include <xen/lib.h>
> @@ -364,6 +365,8 @@ void tboot_shutdown(uint32_t shutdown_ty
>      /* if this is S3 then set regions to MAC */
>      if ( shutdown_type == TB_SHUTDOWN_S3 )
>      {
> +        unsigned long s, e;
> +
>          /*
>           * Xen regions for tboot to MAC. This needs to remain in sync with
>           * xen_in_range().
> @@ -378,6 +381,15 @@ void tboot_shutdown(uint32_t shutdown_ty
>          /* hypervisor .data + .bss */
>          g_tboot_shared->mac_regions[2].start = (uint64_t)__pa(&__2M_rwdata_start);
>          g_tboot_shared->mac_regions[2].size = __2M_rwdata_end - __2M_rwdata_start;
> +        if ( efi_boot_mem_unused(&s, &e) )
> +        {
> +            g_tboot_shared->mac_regions[2].size =
> +                s - (unsigned long)__2M_rwdata_start;
> +            g_tboot_shared->mac_regions[3].start = __pa(e);
> +            g_tboot_shared->mac_regions[3].size =
> +                (unsigned long)__2M_rwdata_end - e;
> +            g_tboot_shared->num_mac_regions = 4;
> +        }
>  
>          /*
>           * MAC domains and other Xen memory
> --- a/xen/common/efi/ebmalloc.c
> +++ b/xen/common/efi/ebmalloc.c
> @@ -1,5 +1,9 @@
>  #include "efi.h"
>  #include <xen/init.h>
> +#include <xen/mm.h>
> +#ifdef CONFIG_X86
> +#include <asm/setup.h>
> +#endif
>  
>  #ifdef CONFIG_ARM
>  /*
> @@ -21,7 +25,7 @@
>  
>  static char __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>      ebmalloc_mem[EBMALLOC_SIZE];
> -static unsigned long __initdata ebmalloc_allocated;
> +static unsigned long __read_mostly ebmalloc_allocated;
>  
>  /* EFI boot allocator. */
>  void __init *ebmalloc(size_t size)
> @@ -36,17 +40,32 @@ void __init *ebmalloc(size_t size)
>      return ptr;
>  }
>  
> +bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
> +{
> +    *start = (unsigned long)ebmalloc_mem + PAGE_ALIGN(ebmalloc_allocated);
> +    *end = (unsigned long)ebmalloc_mem + sizeof(ebmalloc_mem);
> +
> +    return *start < *end;
> +}
> +
>  void __init free_ebmalloc_unused_mem(void)
>  {
> -#if 0 /* FIXME: Putting a hole in the BSS breaks the IOMMU mappings for dom0. */
>      unsigned long start, end;
>  
> -    start = (unsigned long)ebmalloc_mem + PAGE_ALIGN(ebmalloc_allocated);
> -    end = (unsigned long)ebmalloc_mem + sizeof(ebmalloc_mem);
> +#ifdef CONFIG_X86
> +    /* FIXME: Putting a hole in .bss would shatter the large page mapping. */
> +    if ( using_2M_mapping() )
> +    {
> +        ebmalloc_allocated = sizeof(ebmalloc_mem);
> +        return;
> +    }
> +#endif
> +
> +    if ( !efi_boot_mem_unused(&start, &end) )
> +        return;
>  
>      destroy_xen_mappings(start, end);
>      init_xenheap_pages(__pa(start), __pa(end));
>  
>      printk(XENLOG_INFO "Freed %lukB unused BSS memory\n", (end - start) >> 10);
> -#endif
>  }
> --- a/xen/include/asm-x86/setup.h
> +++ b/xen/include/asm-x86/setup.h
> @@ -9,6 +9,8 @@ extern const char __2M_rodata_start[], _
>  extern char __2M_init_start[], __2M_init_end[];
>  extern char __2M_rwdata_start[], __2M_rwdata_end[];
>  
> +bool using_2M_mapping(void);
> +
>  extern unsigned long xenheap_initial_phys_start;
>  extern uint64_t boot_tsc_stamp;
>  
> --- a/xen/include/xen/efi.h
> +++ b/xen/include/xen/efi.h
> @@ -33,6 +33,7 @@ struct compat_pf_efi_runtime_call;
>  
>  bool efi_enabled(unsigned int feature);
>  void efi_init_memory(void);
> +bool efi_boot_mem_unused(unsigned long *start, unsigned long *end);
>  bool efi_rs_using_pgtables(void);
>  unsigned long efi_get_time(void);
>  void efi_halt_system(void);
> 


