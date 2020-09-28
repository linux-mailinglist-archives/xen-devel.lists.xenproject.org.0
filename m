Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F13F27A969
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 10:18:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMoMR-000508-T2; Mon, 28 Sep 2020 08:18:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMoMP-000503-TX
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 08:18:13 +0000
X-Inumbo-ID: 6f39a702-2726-4b95-90ec-b37b73ae88dc
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f39a702-2726-4b95-90ec-b37b73ae88dc;
 Mon, 28 Sep 2020 08:18:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601281092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yDaS79HIkKSC1oB88t4NzWG1CHqraOGj7iV+uwhKiRk=;
 b=pQeZFN5e5q02C+5mi9/qaZmCIN59lqU8J4dQ5cE6EPVI0PHNtTUx0RHC8nk1X7eOXe+PPf
 j0vjEAl25ckYVrbvolHxZuH007kI+KpkecNXIK3fo27hviTt63SvgVwNN13iM8h/lXI/aN
 DbeEfvAqjvY/avSoW0r9RQi8tnfGgws=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3B47B1A9;
 Mon, 28 Sep 2020 08:18:11 +0000 (UTC)
Subject: Re: [PATCH 1/4] xen/acpi: Rework acpi_os_map_memory() and
 acpi_os_unmap_memory()
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
 masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200926205542.9261-1-julien@xen.org>
 <20200926205542.9261-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fe055799-de10-891a-bcee-bbb01a8c0b3d@suse.com>
Date: Mon, 28 Sep 2020 10:18:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200926205542.9261-2-julien@xen.org>
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

On 26.09.2020 22:55, Julien Grall wrote:
> @@ -49,6 +53,12 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
>      return ((char *) base + offset);
>  }
>  
> +bool __acpi_unmap_table(void *ptr, unsigned long size)
> +{
> +    return ( vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) &&
> +             vaddr < (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE) );

Nit: If this wasn't Arm code, I'd ask for the parentheses to be
dropped altogether, but at least the stray blanks should go away
imo.

> --- a/xen/arch/x86/acpi/lib.c
> +++ b/xen/arch/x86/acpi/lib.c
> @@ -46,6 +46,10 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
>  	if ((phys + size) <= (1 * 1024 * 1024))
>  		return __va(phys);
>  
> +	/* No arch specific implementation after early boot */
> +	if (system_state >= SYS_STATE_boot)
> +		return NULL;

Considering the code in context above, the comment isn't entirely
correct.

> @@ -66,6 +70,20 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
>  	return ((char *) base + offset);
>  }
>  
> +bool __acpi_unmap_table(void *ptr, unsigned long size)

Is there anything standing in the way of making ptr "const void *"?

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

Indentation is slightly wrong here. Also please consider reducing
the number of parentheses here; at the very least the return and
the earlier if() want to be consistent in when ones are(n't) used.

> --- a/xen/drivers/acpi/osl.c
> +++ b/xen/drivers/acpi/osl.c
> @@ -92,27 +92,29 @@ acpi_physical_address __init acpi_os_get_root_pointer(void)
>  void __iomem *
>  acpi_os_map_memory(acpi_physical_address phys, acpi_size size)
>  {
> -	if (system_state >= SYS_STATE_boot) {
> -		mfn_t mfn = _mfn(PFN_DOWN(phys));
> -		unsigned int offs = phys & (PAGE_SIZE - 1);
> -
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

Open-coding PAGE_OFFSET()?

> +	/* Try the arch specific implementation first */
> +	ptr = __acpi_map_table(phys, size);
> +	if (ptr)
> +		return ptr;
> +
> +	/* No common implementation for early boot map */
> +	if (unlikely(system_state < SYS_STATE_boot))
> +	     return NULL;

Consistently hard tabs for indentation here, please.

> +	ptr = __vmap(&mfn, PFN_UP(offs + size), 1, 1,
> +		     ACPI_MAP_MEM_ATTR, VMAP_DEFAULT);
> +
> +	return !ptr ? NULL : (ptr + offs);

Slightly odd that you don't let the success case go first, the
more that it's minimally shorter:

	return ptr ? ptr + offs : NULL;

Jan

