Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7814E9B600A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 11:26:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828004.1242788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t65tL-0003ly-2r; Wed, 30 Oct 2024 10:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828004.1242788; Wed, 30 Oct 2024 10:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t65tK-0003jC-VS; Wed, 30 Oct 2024 10:25:30 +0000
Received: by outflank-mailman (input) for mailman id 828004;
 Wed, 30 Oct 2024 10:25:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t65tK-0003j6-CL
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 10:25:30 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46d8438c-96a9-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 11:25:25 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2fb3debdc09so50710051fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 03:25:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9aa09fsm16896105e9.37.2024.10.30.03.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 03:25:24 -0700 (PDT)
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
X-Inumbo-ID: 46d8438c-96a9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmUiLCJoZWxvIjoibWFpbC1sajEteDIyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ2ZDg0MzhjLTk2YTktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjgzOTI1LjU0NDE3NCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730283925; x=1730888725; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eGvHqEKMo1+jupQ/nfzRO0U7r1zxaBgcteOnvoQgPsc=;
        b=eNy+X2vS4uVmBTkYkHfinNe4sLt9UjiirjuxTQ1fuS0Z6/V11x1lZtsqzzsSyXlGmc
         FS2mel45lOZ9Igr8gFle2KjdCOmYAFE6EKrwHRCFQ6atr91UiZ/5N1XzCyICevyCS97u
         F5WaZsENQa49Wj1a7R59ahw4whkO/tPEOnlzLcngKQ2NZJHhz7ZGTslUPxFm8ENUuy2J
         OQLgSqNOokbkqHB9AglVMkKVsOw0hlJ+8151P1doqEf/JrxNFBJh9qNq87nLXQ2A+5vv
         CplACQiK6wOXKYA30MWdSmEsd3j9kcz+hsHTxJblsLrQrq++k1DCGHamk/C0sFU3I0jl
         zYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730283925; x=1730888725;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGvHqEKMo1+jupQ/nfzRO0U7r1zxaBgcteOnvoQgPsc=;
        b=Vv963lOSkNl1n5W1J4SnKv/pwslf5Oucr+S0CjWaqkD4D0B3CB3EyVfxULj1fXBq4S
         T/FiXc4Z1+Sr67DXEW9L6SeEfwKJ/drRJDlffnrsk6QGLrGZ/9q71LKt5NKwa6OESQ5g
         2XHPvHVcx/ftKOC4cm8ISXKd1hY3QlglPEfirK9XKBASOHjgpcsdStdujh8HdIlgXkPm
         aUb2SOtli5XJSd4nQzRR4Y+yaPKQ0KTt16ElfvUOd6O64DPHadc6vgbhSN6Rn2ikND4V
         zlklJZjWptOerfV3X4P5p/8q8SXyq48lnYdC36EyQsMPREme1DM5DxsneuHEuXbXotaA
         XuBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUGOHr/4dMXEGGT+m+FM0QHmsg0sRzI568KeAoqJ+/1IpGKXHKRXwvWtwIsKjrSWTIEy92PMdLVMg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdMFEjKrtu8L8aqKAvJ5IYen/Ja77IATU92+LqklZm5EaSeBOo
	Z7MiwZy+LtZhc+i+5T7XrC5T/qjz48SlKReTJ1cuw1MDoo/i5PC27n1zTzsqTA==
X-Google-Smtp-Source: AGHT+IF9vzvXCBX0L81knGhPLh5otjIyJOcFgEavo1DrmFLtoH6ukcYosgF6Cmcvh+IBqxhOZvjhbw==
X-Received: by 2002:a05:651c:199e:b0:2fb:5740:9f9a with SMTP id 38308e7fff4ca-2fcbe07871dmr73763581fa.29.1730283924744;
        Wed, 30 Oct 2024 03:25:24 -0700 (PDT)
Message-ID: <8ec6463e-40a8-4d60-b4c2-ea964a06c572@suse.com>
Date: Wed, 30 Oct 2024 11:25:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce setup_mm()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1729697111.git.oleksii.kurochko@gmail.com>
 <28240dcfc04a11237db553c4e0ecb372aa0fe9ac.1729697111.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
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
In-Reply-To: <28240dcfc04a11237db553c4e0ecb372aa0fe9ac.1729697111.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.10.2024 17:50, Oleksii Kurochko wrote:
> Introduce the implementation of setup_mm(), which includes:
> 1. Adding all free regions to the boot allocator, as memory is needed
>    to allocate page tables used for frame table mapping.
> 2. Calculating RAM size and the RAM end address.
> 3. Setting up direct map mappings from each RAM bank and initialize
>    directmap_virt_start (also introduce XENHEAP_VIRT_START which is
>    defined as directmap_virt_start) to be properly aligned with RAM
>    start to use more superpages to reduce pressure on the TLB.
> 4. Setting up frame table mappings from physical address 0 to ram_end
>    to simplify mfn_to_page() and page_to_mfn() conversions.
> 5. Setting up total_pages and max_page.
> 
> Update virt_to_maddr() to use introduced XENHEAP_VIRT_START.
> 
> Implement maddr_to_virt() function to convert a machine address
> to a virtual address. This function is specifically designed to be used
> only for the DIRECTMAP region, so a check has been added to ensure that
> the address does not exceed DIRECTMAP_SIZE.

I'm unconvinced by this. Conceivably the function could be used on
"imaginary" addresses, just to calculate abstract positions or e.g.
deltas. At the same time I'm also not going to insist on the removal of
that assertion, so long as it doesn't trigger.

> After the introduction of maddr_to_virt() the following linkage error starts
> to occur and to avoid it share_xen_page_with_guest() stub is added:
>   riscv64-linux-gnu-ld: prelink.o: in function `tasklet_kill':
>   /build/xen/common/tasklet.c:176: undefined reference to
>      `share_xen_page_with_guest'
>   riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `share_xen_page_with_guest'
>     isn't defined riscv64-linux-gnu-ld: final link failed: bad value
> 
> Despite the linkger fingering tasklet.c, it's trace.o which has the undefined
> refenrece:
>   $ find . -name \*.o | while read F; do nm $F | grep share_xen_page_with_guest &&
>     echo $F; done
>                      U share_xen_page_with_guest
>     ./xen/common/built_in.o
>                      U share_xen_page_with_guest
>     ./xen/common/trace.o
>                      U share_xen_page_with_guest
>     ./xen/prelink.o
> 
> Looking at trace.i, there is call of share_xen_page_with_guest() but in case of
> when maddr_to_virt() is defined as "return NULL" compiler optimizes the part of
> common/trace.c code where share_xen_page_with_priviliged_guest() is called
> ( there is no any code in dissambled common/trace.o ) so there is no real call
> of share_xen_page_with_priviliged_guest().

I don't think it's the "return NULL", but rather BUG_ON()'s (really BUG()'s)
unreachable(). Not the least because the function can't validly return NULL,
and hence callers have no need to check for NULL.

> @@ -25,8 +27,11 @@
>  
>  static inline void *maddr_to_virt(paddr_t ma)
>  {
> -    BUG_ON("unimplemented");
> -    return NULL;
> +    unsigned long va_offset = maddr_to_directmapoff(ma);
> +
> +    ASSERT(va_offset < DIRECTMAP_SIZE);
> +
> +    return (void *)(XENHEAP_VIRT_START + va_offset);
>  }

I'm afraid I'm not following why this uses XENHEAP_VIRT_START, when
it's all about the directmap. I'm in trouble with XENHEAP_VIRT_START
in the first place: You don't have a separate "heap" virtual address
range, do you?

> @@ -37,9 +42,9 @@ static inline void *maddr_to_virt(paddr_t ma)
>   */
>  static inline unsigned long virt_to_maddr(unsigned long va)
>  {
> -    if ((va >= DIRECTMAP_VIRT_START) &&
> +    if ((va >= XENHEAP_VIRT_START) &&
>          (va < (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE)))
> -        return directmapoff_to_maddr(va - DIRECTMAP_VIRT_START);
> +        return directmapoff_to_maddr(va - XENHEAP_VIRT_START);

Same concern here then.

> @@ -423,3 +424,123 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>  
>      return fdt_virt;
>  }
> +
> +#ifndef CONFIG_RISCV_32

I'd like to ask that you be more selective with this #ifdef (or omit it
altogether here). setup_mm() itself, for example, looks good for any mode.
Like does ...

> +#define ROUNDDOWN(addr, size)  ((addr) & ~((size) - 1))

... this #define. Then again this macro may better be placed in
xen/macros.h anyway, next to ROUNDUP().

> +/* Map a frame table to cover physical addresses ps through pe */
> +static void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
> +{
> +    paddr_t aligned_ps = ROUNDDOWN(ps, PAGE_SIZE);
> +    paddr_t aligned_pe = ROUNDUP(pe, PAGE_SIZE);
> +    unsigned long nr_mfns = PFN_DOWN(aligned_pe - aligned_ps);
> +    unsigned long frametable_size = nr_mfns * sizeof(struct page_info);

Nit: Better sizeof(*frame_table).

> +    mfn_t base_mfn;
> +
> +    if ( frametable_size > FRAMETABLE_SIZE )
> +        panic("The frametable cannot cover the physical region [%#"PRIpaddr" - %#"PRIpaddr")\n",
> +              ps, pe);

As per prior comments of mine: Imo the message is too verbose (and too
long). "frametable cannot cover [%#"PRIpaddr", %#"PRIpaddr")\n" doesn't
leave any ambiguity, I think. (Please take this as a general remark, i.e.
potentially applicable elsewhere as well.)

Note also the adjustment to how the range is presented. As said before,
using mathematical intervals is (imo) least ambiguous.

> +    frametable_size = ROUNDUP(frametable_size, MB(2));
> +    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, PFN_DOWN(MB(2)));

The 2Mb aspect wants a (brief) comment, imo.

> +    if ( map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
> +                          PFN_DOWN(frametable_size),
> +                          PAGE_HYPERVISOR_RW) )
> +        panic("Unable to setup the frametable mappings\n");
> +
> +    memset(&frame_table[0], 0, nr_mfns * sizeof(struct page_info));
> +    memset(&frame_table[nr_mfns], -1,
> +           frametable_size - (nr_mfns * sizeof(struct page_info)));

Here (see comments on v1) you're still assuming ps == 0.

> +}
> +
> +

Nit: No double blank lines please.

> +static mfn_t __ro_after_init directmap_mfn_start = INVALID_MFN_INITIALIZER;

This is used only by __init code, and hence ought to be __initdata. In
fact as it's used by just one function afaics, it may want to move into
that function (to limit its scope).

> +vaddr_t __ro_after_init directmap_virt_start;

Even if largely benign, I think this would better be initialized to
DIRECTMAP_VIRT_START.

> +/* Map the region in the directmap area. */
> +static void __init setup_directmap_mappings(unsigned long base_mfn,
> +                                            unsigned long nr_mfns)
> +{
> +    int rc;
> +
> +    /* First call sets the directmap physical and virtual offset. */
> +    if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
> +    {
> +        directmap_mfn_start = _mfn(base_mfn);
> +
> +        /*
> +         * The base address may not be aligned to the second level
> +         * size (e.g. 1GB when using 4KB pages). This would prevent
> +         * superpage mappings for all the regions because the virtual
> +         * address and machine address should both be suitably aligned.
> +         *
> +         * Prevent that by offsetting the start of the directmap virtual
> +         * address.
> +         */
> +        directmap_virt_start = DIRECTMAP_VIRT_START + pfn_to_paddr(base_mfn);

Don't you need to mask off top bits of the incoming MFN here, or else you
may waste a huge part of direct map space?

> +    }
> +
> +    if ( base_mfn < mfn_x(directmap_mfn_start) )
> +        panic("cannot add directmap mapping at %#lx below heap start %#lx\n",
> +              base_mfn, mfn_x(directmap_mfn_start));
> +
> +    rc = map_pages_to_xen((vaddr_t)mfn_to_virt(base_mfn),
> +                          _mfn(base_mfn), nr_mfns,
> +                          PAGE_HYPERVISOR_RW);
> +    if ( rc )
> +        panic("Unable to setup the directmap mappings.\n");

Might help to also log the range in question. Also, to repeat a prior nit:
No full stop please at the end of log messages.

> +}
> +
> +/*
> + * Setup memory management
> + *
> + * RISC-V 64 has a large virtual address space (the minimum supported
> + * MMU mode is Sv39, which provides TBs of VA space).

Is it really TBs? According to my math you'd need more than 40 bits to
map a single Tb (alongside other stuff).

> + * In the case of RISC-V 64, the directmap and frametable are mapped
> + * starting from physical address 0 to simplify the page_to_mfn(),
> + * mfn_to_page(), and maddr_to_virt() calculations, as there is no need
> + * to account for {directmap, frametable}_base_pdx in this setup.

This looks somewhat stale for the directmap part, now that you have
directmap_virt_start.

> + */
> +void __init setup_mm(void)
> +{
> +    const struct membanks *banks = bootinfo_get_mem();
> +    paddr_t ram_start = INVALID_PADDR;
> +    paddr_t ram_end = 0;
> +    paddr_t ram_size = 0;
> +    unsigned int i;
> +
> +    /*
> +     * We need some memory to allocate the page-tables used for the directmap
> +     * mappings. But some regions may contain memory already allocated
> +     * for other uses (e.g. modules, reserved-memory...).
> +     *
> +     * For simplicity, add all the free regions in the boot allocator.
> +     */
> +    populate_boot_allocator();
> +
> +    total_pages = 0;
> +
> +    for ( i = 0; i < banks->nr_banks; i++ )
> +    {
> +        const struct membank *bank = &banks->bank[i];
> +        paddr_t bank_end = bank->start + bank->size;
> +
> +        ram_size += ROUNDDOWN(bank->size, PAGE_SIZE);

As before - if a bank doesn't cover full pages, this may give the impression
of there being more "total pages" than there are.

> +        ram_start = min(ram_start, bank->start);
> +        ram_end = max(ram_end, bank_end);
> +
> +        setup_directmap_mappings(PFN_DOWN(bank->start),
> +                                 PFN_DOWN(bank->size));

Similarly I don't think this is right when both start and size aren't
multiple of PAGE_SIZE. You may map an unsuable partial page at the start,
and then fail to map a fully usable page at the end.

> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -2,7 +2,9 @@
>  #include <xen/cpumask.h>
>  #include <xen/domain.h>
>  #include <xen/irq.h>
> +#include <xen/mm.h>
>  #include <xen/nodemask.h>
> +#include <xen/sched.h>
>  #include <xen/sections.h>
>  #include <xen/time.h>
>  #include <public/domctl.h>

Neither of these are needed afaict, even without the further comment below.

> @@ -409,3 +411,11 @@ unsigned long get_upper_mfn_bound(void)
>  {
>      BUG_ON("unimplemented");
>  }
> +
> +/* mm.c */
> +
> +void share_xen_page_with_guest(struct page_info *page, struct domain *d,
> +                               enum XENSHARE_flags flags)
> +{
> +    BUG_ON("unimplemented");
> +}

Why not right in mm.c? I thought stubs.c exists only for functions which
don't have a proper "home" source file yet.

Jan

