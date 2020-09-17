Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB7B26D962
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 12:46:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIrPt-00008d-Ds; Thu, 17 Sep 2020 10:45:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7l8=C2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kIrPr-00008Y-Tg
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 10:45:27 +0000
X-Inumbo-ID: 244103e4-af23-4ae3-ba55-ee72fd1b8fe0
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 244103e4-af23-4ae3-ba55-ee72fd1b8fe0;
 Thu, 17 Sep 2020 10:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600339526;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=08vfPymQGwXx3l9isvR3zU9MXruYe2fcpEtTN2d5Juc=;
 b=FSmHCQp9KxU8pcQd/Ng4Ol73WRXWvbtDWZ61ucgvV9RbQ+pWyxVkr1Px
 BzhKNm+e/QcvZO8/NGi1RDJJSmQtawZAY1qvqawZB75WR7GfYIbiuGFcZ
 NidMwpuvFCO8ANcdg0yw7R6CcUHoHAIIm8JCKVvriuR2+x34fmWYHrnwO w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: INalKbsOSVDTf6ov/c0epwO+GqsIVoLzEP1ufFp0/VyIlWTL9bKzcOtBs0YNOORi5hiDEMxJG2
 gCojlQksxEZ/SaKXeaUVed1ue92cMq5xhQ5957RT3r9+SywkyexznTkkj5o18SvldTVvlQEqvd
 40Nd6s3Zy7WCKmihV8HZy7H/1mNGcycnRD5E1brrVPZeBqGB6zkvYtHrgRmITMJ8R00NIo3eIF
 NM/VydyzFXzKXGrp2ssfd/BZ8u2zZHsXBB56XJKsQIbYUMKOwKSRwEQsqQ9NFXjS2O+BIdNoQ6
 9f4=
X-SBRS: 2.7
X-MesageID: 27251055
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,436,1592884800"; d="scan'208";a="27251055"
Date: Thu, 17 Sep 2020 12:45:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@citrix.com>, "Julien
 Grall" <julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
Subject: Re: [PATCH v4] EFI: free unused boot mem in at least some cases
Message-ID: <20200917104516.GB19254@Air-de-Roger>
References: <5dd2fcea-d8ec-1c20-6514-c7733b59047f@suse.com>
 <d8b1bcc8-ffcc-f7fe-b4ad-ce7dcdaed491@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <d8b1bcc8-ffcc-f7fe-b4ad-ce7dcdaed491@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

On Wed, Sep 16, 2020 at 02:20:54PM +0200, Jan Beulich wrote:
> Address at least the primary reason why 52bba67f8b87 ("efi/boot: Don't
> free ebmalloc area at all") was put in place: Make xen_in_range() aware
> of the freed range. This is in particular relevant for EFI-enabled
> builds not actually running on EFI, as the entire range will be unused
> in this case.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v4: Address PV shim breakage (stub function also needed adjustment).
> v3: Don't free the memory twice.
> v2: Also adjust the two places where comments point out that they need
>     to remain in sync with xen_in_range(). Add assertions to
>     xen_in_range().
> ---
> The remaining issue could be addressed too, by making the area 2M in
> size and 2M-aligned.
> 
> --- a/xen/arch/x86/efi/stub.c
> +++ b/xen/arch/x86/efi/stub.c
> @@ -52,6 +52,13 @@ bool efi_enabled(unsigned int feature)
>  
>  void __init efi_init_memory(void) { }
>  
> +bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
> +{
> +    if ( start || end )

Shouldn't this be start && end?

Or else you might be de-referencing a NULL pointer?

> +        *start = *end = (unsigned long)_end;
> +    return false;
> +}
> +
>  void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e) { }
>  
>  bool efi_rs_using_pgtables(void)
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
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
> @@ -1417,8 +1419,18 @@ void __init noreturn __start_xen(unsigne
>      if ( !xen_phys_start )
>          panic("Not enough memory to relocate Xen\n");
>  
> +    /* FIXME: Putting a hole in .bss would shatter the large page mapping. */
> +    if ( using_2M_mapping() )
> +        efi_boot_mem_unused(NULL, NULL);

This seems really weird IMO...

> +
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
> @@ -1979,7 +1991,7 @@ int __hwdom_init xen_in_range(unsigned l
>      paddr_t start, end;
>      int i;
>  
> -    enum { region_s3, region_ro, region_rw, nr_regions };
> +    enum { region_s3, region_ro, region_rw, region_bss, nr_regions };
>      static struct {
>          paddr_t s, e;
>      } xen_regions[nr_regions] __hwdom_initdata;
> @@ -2004,6 +2016,14 @@ int __hwdom_init xen_in_range(unsigned l
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
> @@ -1,5 +1,6 @@
>  #include "efi.h"
>  #include <xen/init.h>
> +#include <xen/mm.h>
>  
>  #ifdef CONFIG_ARM
>  /*
> @@ -21,7 +22,7 @@
>  
>  static char __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>      ebmalloc_mem[EBMALLOC_SIZE];
> -static unsigned long __initdata ebmalloc_allocated;
> +static unsigned long __read_mostly ebmalloc_allocated;
>  
>  /* EFI boot allocator. */
>  void __init *ebmalloc(size_t size)
> @@ -36,17 +37,37 @@ void __init *ebmalloc(size_t size)
>      return ptr;
>  }
>  
> +bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
> +{
> +    if ( !start && !end )
> +    {
> +        ebmalloc_allocated = sizeof(ebmalloc_mem);
> +        return false;
> +    }

... I would instead place the using_2M_mapping check here and return
start = end in that case.

Thanks, Roger.

