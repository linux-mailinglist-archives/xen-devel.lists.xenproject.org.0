Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7061627F675
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 02:07:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972.3287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNm7d-0006JL-5N; Thu, 01 Oct 2020 00:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972.3287; Thu, 01 Oct 2020 00:06:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNm7d-0006Iw-27; Thu, 01 Oct 2020 00:06:57 +0000
Received: by outflank-mailman (input) for mailman id 972;
 Thu, 01 Oct 2020 00:06:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=thWI=DI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kNm7b-0006Ir-7k
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 00:06:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc9086a4-b977-4f98-99e2-0fedf366f8ef;
 Thu, 01 Oct 2020 00:06:54 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B3022067C;
 Thu,  1 Oct 2020 00:06:53 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=thWI=DI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kNm7b-0006Ir-7k
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 00:06:55 +0000
X-Inumbo-ID: cc9086a4-b977-4f98-99e2-0fedf366f8ef
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cc9086a4-b977-4f98-99e2-0fedf366f8ef;
	Thu, 01 Oct 2020 00:06:54 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6B3022067C;
	Thu,  1 Oct 2020 00:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601510813;
	bh=MMeaSunKQGlKKUocp6u14CEm8/aY9P233Y0l8uhIKnw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mBo86eV9QJlMDK7ysLcwHjCbQ0qaY1iEf62hHf6Xp4GH4vzLmx3+M/bHW1rQ6ifmY
	 3Xe6MbJMJ2xAQLN4+IqN7pGa44IYnJQeh9YemiG4mLk6Qe6+4wqdUNxsnJb0ehm8n2
	 NH/xoZcm74HfV2v50ultqVuWtMhax2sIFJ4lRcAc=
Date: Wed, 30 Sep 2020 17:06:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org, 
    masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/4] xen/acpi: Rework acpi_os_map_memory() and
 acpi_os_unmap_memory()
In-Reply-To: <20200926205542.9261-2-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2009301659350.10908@sstabellini-ThinkPad-T480s>
References: <20200926205542.9261-1-julien@xen.org> <20200926205542.9261-2-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 26 Sep 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The functions acpi_os_{un,}map_memory() are meant to be arch-agnostic
> while the __acpi_os_{un,}map_memory() are meant to be arch-specific.
> 
> Currently, the former are still containing x86 specific code.
> 
> To avoid this rather strange split, the generic helpers are reworked so
> they are arch-agnostic. This requires the introduction of a new helper
> __acpi_os_unmap_memory() that will undo any mapping done by
> __acpi_os_map_memory().
> 
> Currently, the arch-helper for unmap is basically a no-op so it only
> returns whether the mapping was arch specific. But this will change
> in the future.
> 
> Note that the x86 version of acpi_os_map_memory() was already able to
> able the 1MB region. Hence why there is no addition of new code.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/acpi/lib.c | 10 ++++++++++
>  xen/arch/x86/acpi/lib.c | 18 ++++++++++++++++++
>  xen/drivers/acpi/osl.c  | 34 ++++++++++++++++++----------------
>  xen/include/xen/acpi.h  |  1 +
>  4 files changed, 47 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/arch/arm/acpi/lib.c b/xen/arch/arm/acpi/lib.c
> index 4fc6e17322c1..2192a5519171 100644
> --- a/xen/arch/arm/acpi/lib.c
> +++ b/xen/arch/arm/acpi/lib.c
> @@ -30,6 +30,10 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
>      unsigned long base, offset, mapped_size;
>      int idx;
>  
> +    /* No arch specific implementation after early boot */
> +    if ( system_state >= SYS_STATE_boot )
> +        return NULL;
> +
>      offset = phys & (PAGE_SIZE - 1);
>      mapped_size = PAGE_SIZE - offset;
>      set_fixmap(FIXMAP_ACPI_BEGIN, maddr_to_mfn(phys), PAGE_HYPERVISOR);
> @@ -49,6 +53,12 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
>      return ((char *) base + offset);
>  }
>  
> +bool __acpi_unmap_table(void *ptr, unsigned long size)
> +{
> +    return ( vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) &&
> +             vaddr < (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE) );
> +}

vaddr or ptr?  :-)

lib.c: In function '__acpi_unmap_table':
lib.c:58:14: error: 'vaddr' undeclared (first use in this function)
     return ( vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) &&
              ^
lib.c:58:14: note: each undeclared identifier is reported only once for each function it appears in
lib.c:60:1: error: control reaches end of non-void function [-Werror=return-type]
 }
 ^
cc1: all warnings being treated as errors



>  /* True to indicate PSCI 0.2+ is implemented */
>  bool __init acpi_psci_present(void)
>  {
> diff --git a/xen/arch/x86/acpi/lib.c b/xen/arch/x86/acpi/lib.c
> index 265b9ad81905..77803f4d4c63 100644
> --- a/xen/arch/x86/acpi/lib.c
> +++ b/xen/arch/x86/acpi/lib.c
> @@ -46,6 +46,10 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
>  	if ((phys + size) <= (1 * 1024 * 1024))
>  		return __va(phys);
>  
> +	/* No arch specific implementation after early boot */
> +	if (system_state >= SYS_STATE_boot)
> +		return NULL;
> +
>  	offset = phys & (PAGE_SIZE - 1);
>  	mapped_size = PAGE_SIZE - offset;
>  	set_fixmap(FIX_ACPI_END, phys);
> @@ -66,6 +70,20 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
>  	return ((char *) base + offset);
>  }
>  
> +bool __acpi_unmap_table(void *ptr, unsigned long size)
> +{
> +	unsigned long vaddr = (unsigned long)ptr;
> +
> +	if (vaddr >= DIRECTMAP_VIRT_START &&
> +	    vaddr < DIRECTMAP_VIRT_END) {
> +		ASSERT(!((__pa(ptr) + size - 1) >> 20));
> +		return true;
> +	}
> +
> +	return (vaddr >= __fix_to_virt(FIX_ACPI_END)) &&
> +		(vaddr < (__fix_to_virt(FIX_ACPI_BEGIN) + PAGE_SIZE));
> +}
> +
>  unsigned int acpi_get_processor_id(unsigned int cpu)
>  {
>  	unsigned int acpiid, apicid;
> diff --git a/xen/drivers/acpi/osl.c b/xen/drivers/acpi/osl.c
> index 4c8bb7839eda..100eee72def2 100644
> --- a/xen/drivers/acpi/osl.c
> +++ b/xen/drivers/acpi/osl.c
> @@ -92,27 +92,29 @@ acpi_physical_address __init acpi_os_get_root_pointer(void)
>  void __iomem *
>  acpi_os_map_memory(acpi_physical_address phys, acpi_size size)
>  {
> -	if (system_state >= SYS_STATE_boot) {
> -		mfn_t mfn = _mfn(PFN_DOWN(phys));
> -		unsigned int offs = phys & (PAGE_SIZE - 1);
> -		/* The low first Mb is always mapped on x86. */
> -		if (IS_ENABLED(CONFIG_X86) && !((phys + size - 1) >> 20))
> -			return __va(phys);
> -		return __vmap(&mfn, PFN_UP(offs + size), 1, 1,
> -			      ACPI_MAP_MEM_ATTR, VMAP_DEFAULT) + offs;
> -	}
> -	return __acpi_map_table(phys, size);
> +	void *ptr;
> +	mfn_t mfn = _mfn(PFN_DOWN(phys));
> +	unsigned int offs = phys & (PAGE_SIZE - 1);
> +
> +	/* Try the arch specific implementation first */
> +	ptr = __acpi_map_table(phys, size);
> +	if (ptr)
> +		return ptr;
> +
> +	/* No common implementation for early boot map */
> +	if (unlikely(system_state < SYS_STATE_boot))
> +	     return NULL;
> +
> +	ptr = __vmap(&mfn, PFN_UP(offs + size), 1, 1,
> +		     ACPI_MAP_MEM_ATTR, VMAP_DEFAULT);
> +
> +	return !ptr ? NULL : (ptr + offs);
>  }
>  
>  void acpi_os_unmap_memory(void __iomem * virt, acpi_size size)
>  {
> -	if (IS_ENABLED(CONFIG_X86) &&
> -	    (unsigned long)virt >= DIRECTMAP_VIRT_START &&
> -	    (unsigned long)virt < DIRECTMAP_VIRT_END) {
> -		ASSERT(!((__pa(virt) + size - 1) >> 20));
> +	if (__acpi_unmap_table(virt, size))
>  		return;
> -	}
>  
>  	if (system_state >= SYS_STATE_boot)
>  		vunmap((void *)((unsigned long)virt & PAGE_MASK));
> diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
> index c945ab05c864..5a84a4bf54e0 100644
> --- a/xen/include/xen/acpi.h
> +++ b/xen/include/xen/acpi.h
> @@ -68,6 +68,7 @@ typedef int (*acpi_table_entry_handler) (struct acpi_subtable_header *header, co
>  
>  unsigned int acpi_get_processor_id (unsigned int cpu);
>  char * __acpi_map_table (paddr_t phys_addr, unsigned long size);
> +bool __acpi_unmap_table(void *ptr, unsigned long size);
>  int acpi_boot_init (void);
>  int acpi_boot_table_init (void);
>  int acpi_numa_init (void);
> -- 
> 2.17.1
> 

