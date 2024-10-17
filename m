Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0DC9A2641
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 17:16:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820707.1234279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1SEF-00011f-JD; Thu, 17 Oct 2024 15:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820707.1234279; Thu, 17 Oct 2024 15:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1SEF-00010B-GL; Thu, 17 Oct 2024 15:15:55 +0000
Received: by outflank-mailman (input) for mailman id 820707;
 Thu, 17 Oct 2024 15:15:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rwie=RN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t1SEE-000105-9B
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 15:15:54 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2246155-8c9a-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 17:15:51 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d5689eea8so772964f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 08:15:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43158c39c47sm29193915e9.12.2024.10.17.08.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 08:15:50 -0700 (PDT)
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
X-Inumbo-ID: b2246155-8c9a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729178151; x=1729782951; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lm/qdeiQvY6WvHdvvmGMQN1rSYOXspNo5iR6WVnD02g=;
        b=ACR3uoEwn9O2TQ5/uSuGruA3CTHwV/Uh3fwk8Egvk52Z9Y0b4af7zR+bpyt9oE7Nh5
         h/GltpQD4NE8NFr4YKDy+ADAPN0Wd/cgTJtyR46wTA417GE9zhODVIYywQk7Kjxeht5A
         V2yRi4oqegkNjhy13duLeXWl1NTsjuPtJmvtBiIc6HWotj+tqVViq64l4Qn3xrc2gR+v
         i613bb8S/QRbUJnpAWZKmlCzMHiiD2se+TwX7S49VDty0C16ZIU/V9DRH1niB4U//lm7
         jfPDRphb59mZPUQHz3df/cAGRLMrTH4wh2scgQEh47tk+SUp/ewsZav0jUKK2CZfGduJ
         CnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729178151; x=1729782951;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lm/qdeiQvY6WvHdvvmGMQN1rSYOXspNo5iR6WVnD02g=;
        b=GnGJ6jMnn2FzlDv9pUW858Z7xYnb+KdNlpSXWCwqTdw6TTP3AxvY/Gw9sVaRSyNQ7N
         TwzFskPKJkpHQqreFNTM81gaSN4vY2dCg26wXCY+mP6S8k6MNKp4GQcnpZLBxClTFIPm
         DpHNLiQQ0Zs/9nNHF/dQ87eWPKuRF5v2uJrJK4WmlagIZnZSFB1qBJL+g4ZXkv+VgEyP
         3P2Uh1gh3QzF7MSc6pUuCobXAvknAuDBUi3uvbgQ/NmH+y1SVX3dqV5Z0vIbBT2XUYvD
         7nk4LYl6neoZQ/Lnlp4pOG85VyfFKT3kAH8UCw0QGYvVMz36VjrQMQSFH3x1lGhRmZpP
         d0tw==
X-Forwarded-Encrypted: i=1; AJvYcCXpbPci2EABjuSDUB0HFBQ2Hq0r0CAkYw6RFPSQgnE1EEK2/YyaoepAf1znBv0DDQ+i4f41iFAR4bY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwS6zEWorFkhCF0A4uWNRIZ25mJPV8tKR3D64Y0P8wG90XKc5mv
	8b6sq9QcYZR4qfllCOfE6qobaPLSfu7gzy2pmIVjM90HHfslPs1XI0WHI4WMBA==
X-Google-Smtp-Source: AGHT+IGX6SWrBwayOcHom/neT4JzniDsKZC3oepW2VIddGFfS9Gzkz/swJJAav6gyEm4W60pR5+0YQ==
X-Received: by 2002:adf:a31d:0:b0:374:c92e:f6b1 with SMTP id ffacd0b85a97d-37d86bc3939mr4812155f8f.23.1729178150812;
        Thu, 17 Oct 2024 08:15:50 -0700 (PDT)
Message-ID: <37929e86-0394-499e-ada1-4686ff77d3f7@suse.com>
Date: Thu, 17 Oct 2024 17:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] xen/riscv: introduce setup_mm()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
 <300a4a5911766d42ec01c3fcaee664d72b484296.1729068334.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <300a4a5911766d42ec01c3fcaee664d72b484296.1729068334.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.10.2024 11:15, Oleksii Kurochko wrote:
> @@ -423,3 +424,95 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>  
>      return fdt_virt;
>  }
> +
> +#ifndef CONFIG_RISCV_32
> +/* Map the region in the directmap area. */
> +static void __init setup_directmap_mappings(unsigned long nr_mfns)
> +{
> +    if ( nr_mfns > PFN_DOWN(DIRECTMAP_SIZE) )
> +        panic("The directmap cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
> +              0UL, nr_mfns << PAGE_SHIFT);

Here and elsewhere can you please use mathematical range expressions
(apparently "[%"PRIpaddr", %#"PRIpaddr")" here), to avoid ambiguity?

> +    if ( map_pages_to_xen((vaddr_t)mfn_to_virt(0),
> +                          _mfn(0), nr_mfns,
> +                          PAGE_HYPERVISOR_RW) )
> +        panic("Unable to setup the directmap mappings.\n");
> +}
> +
> +/* Map a frame table to cover physical addresses ps through pe */
> +static void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
> +{
> +    unsigned long nr_mfns = mfn_x(mfn_add(maddr_to_mfn(pe), -1)) -

This looks to be accounting for a partial page at the end.

> +                            mfn_x(maddr_to_mfn(ps)) + 1;

Whereas this doesn't do the same at the start. The sole present caller
passes 0, so that's going to be fine for the time being. Yet it's a
latent pitfall. I'd recommend to either drop the function parameter, or
to deal with it correctly right away.

> +    unsigned long frametable_size = nr_mfns * sizeof(struct page_info);
> +    mfn_t base_mfn;
> +
> +    if ( frametable_size > FRAMETABLE_SIZE )
> +        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
> +              ps, pe);
> +
> +    frametable_size = ROUNDUP(frametable_size, MB(2));
> +    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 2<<(20-12));

Nit: Missing blanks in binary expressions. Also please don't open-code
PFN_DOWN() (and again below).

> +    if ( map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
> +                          frametable_size >> PAGE_SHIFT,
> +                          PAGE_HYPERVISOR_RW) )
> +        panic("Unable to setup the frametable mappings.\n");

Nit (as indicated before): No full stop please at the end of log or
panic messages.

> +    memset(&frame_table[0], 0, nr_mfns * sizeof(struct page_info));
> +    memset(&frame_table[nr_mfns], -1,
> +           frametable_size - (nr_mfns * sizeof(struct page_info)));
> +}
> +
> +vaddr_t directmap_virt_end __read_mostly;

__ro_after_init? And moved ahead of the identifier, just like ...

> +/*
> + * Setup memory management
> + *
> + * RISC-V 64 has a large virtual address space (the minimum supported
> + * MMU mode is Sv39, which provides TBs of VA space).
> + * In the case of RISC-V 64, the directmap and frametable are mapped
> + * starting from physical address 0 to simplify the page_to_mfn(),
> + * mfn_to_page(), and maddr_to_virt() calculations, as there is no need
> + * to account for {directmap, frametable}_base_pdx in this setup.
> + */
> +void __init setup_mm(void)

... __init is placed e.g. here.

It's also unclear why the variable needs to be non-static.

> +{
> +    const struct membanks *banks = bootinfo_get_mem();
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
> +        ram_size = ram_size + bank->size;
> +        ram_end = max(ram_end, bank_end);
> +    }
> +
> +    setup_directmap_mappings(PFN_DOWN(ram_end));

While you may want to use non-offset-ed mappings, I can't see how you can
validly map just a single huge chunk, no matter whether there are holes
in there. Such holes could hold MMIO regions, which I'm sure would require
more careful mapping (to avoid cacheable accesses, or even speculative
ones).

> +    total_pages = PFN_DOWN(ram_size);

Imo the rounding down to page granularity needs to be done when ram_size
is accumulated, such that partial pages simply won't be counted. Unless
of course there's a guarantee that banks can never have partial pages at
their start/end.

Jan

