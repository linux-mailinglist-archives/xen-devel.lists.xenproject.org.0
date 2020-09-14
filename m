Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61321268F6F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 17:16:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHqDM-0000bP-Tc; Mon, 14 Sep 2020 15:16:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odsp=CX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kHqDK-0000bB-Sv
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 15:16:18 +0000
X-Inumbo-ID: 017601da-3d09-4390-98c4-86634e7f6059
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 017601da-3d09-4390-98c4-86634e7f6059;
 Mon, 14 Sep 2020 15:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600096577;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=46AEE+gSjE8aQ+JZhvptpm7AsVF1Q57dJvSqXqTMRAM=;
 b=Zpzzic62tlwqearZLXEk6aed+8IdHykx+fDQ0cklkvrLWHOr/FhUCg3r
 L+6p6Jf1pML1f5VWu8BorA8NgTaT8uRVogLmhVvRGPunkrxv5icYdAfrg
 CLR6x3REfSZNt9IQuui3hyqk6QZnx6g7ExjjKVpMHCtp5RFVDyQ0Zl73C U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: pk0+p55F6pTM9aWwqMdrUi+sPeYrjeNB/A8536ATsf3+o/CEDaxGfCDs3bzr7P9NQLDNIisfPY
 XpxCBpACDhzYtwucoI5QhFCz/nlaPVhAfg3sore4ok9IbkgLOa1MlBDJAM7NzYyKTMiFwEy2Pc
 Vi3yEf/wJ0kqVKH4lcFcoNzY2vqbgwBzUsqvUFzwj5VTqkS9RYMIoyR7u4Ukry6ss4tE8l+C9O
 ICfr3hYVmHVNBqda2p82iCVB2RYrsUra8AhHZ/3QybhtittYA7QlZUulxTem8e4py3OYjkQXDL
 2kI=
X-SBRS: 2.7
X-MesageID: 26763887
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,426,1592884800"; d="scan'208";a="26763887"
Date: Mon, 14 Sep 2020 17:16:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@citrix.com>, "Julien
 Grall" <julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
Subject: Re: [PATCH v2 2/2] EFI: free unused boot mem in at least some cases
Message-ID: <20200914151608.GF753@Air-de-Roger>
References: <5dd2fcea-d8ec-1c20-6514-c7733b59047f@suse.com>
 <f474ff55-cd39-fd6e-f96e-942a17e959ee@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f474ff55-cd39-fd6e-f96e-942a17e959ee@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

On Mon, Aug 24, 2020 at 02:08:11PM +0200, Jan Beulich wrote:
> Address at least the primary reason why 52bba67f8b87 ("efi/boot: Don't
> free ebmalloc area at all") was put in place: Make xen_in_range() aware
> of the freed range. This is in particular relevant for EFI-enabled
> builds not actually running on EFI, as the entire range will be unused
> in this case.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Just one comment below.

> ---
> v2: Also adjust the two places where comments point out that they need
>     to remain in sync with xen_in_range(). Add assertions to
>     xen_in_range().
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

I find this extremely confusing, we reuse mod_start/mod_end to contain
a mfn and a size (in bytes) instead of a start and end address (not
something that should be fixed here, but seeing this I assumed it was
wrong).

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

Could you make the ebmalloc size (EBMALLOC_SIZE) 2MB (and aligned), so
that you would only shatter the malloc'ed pages but not the
surrounding mappings?

That would be a good compromise IMO.

Roger.

