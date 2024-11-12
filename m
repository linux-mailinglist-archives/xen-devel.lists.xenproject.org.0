Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4989C564D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 12:23:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834385.1250016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAoz8-0002Q3-8f; Tue, 12 Nov 2024 11:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834385.1250016; Tue, 12 Nov 2024 11:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAoz8-0002Nw-61; Tue, 12 Nov 2024 11:23:02 +0000
Received: by outflank-mailman (input) for mailman id 834385;
 Tue, 12 Nov 2024 11:23:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAoz6-0002Nq-2r
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 11:23:00 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 778fe981-a0e8-11ef-a0c6-8be0dac302b0;
 Tue, 12 Nov 2024 12:22:57 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53b34ed38easo5458654e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 03:22:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05c1f56sm204128805e9.34.2024.11.12.03.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 03:22:56 -0800 (PST)
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
X-Inumbo-ID: 778fe981-a0e8-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmMiLCJoZWxvIjoibWFpbC1sZjEteDEyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc3OGZlOTgxLWEwZTgtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDEwNTc3LjEyNjYzNCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731410576; x=1732015376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f0zn5qLNjMJBaxfWeCflJF/SguG8+s50GLDJxt7T8bs=;
        b=YlX5iI17Y+EtO6ysWPHqK7YyIVWOvX8mFFZ9nR6B6GRBxyEG0KerEhH68rOMBWrjv2
         VFtXqw4xx3fvjhj5jYrPcBYXRTMMKyyQ12f6kfiMrQcl3d6MWf8ZJ8SA6Z8L2y6FOGnQ
         iDGQnPApuNGjSMkTe57dgNSMmrSEPmin0p04KI80FRPyq7VKLQmYxqx6a5GI8lhsUkK9
         f0GlZCs5qT0EuSWPvVu71vIDjP3IOs0EfAW8H349yNjvrWBVVMPNzmMJYMQbVCY0c5PO
         B6L0yvByG0u0nv/KlIiV5sdjEv2rQwXoBnvpNFTgHh2CUV9iJQIPnF1L3AgAcUZPWkwD
         Qgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731410576; x=1732015376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0zn5qLNjMJBaxfWeCflJF/SguG8+s50GLDJxt7T8bs=;
        b=lUMAX9HuZYwrLSGhx21PzGsBECwm/nOaWRimlqrRXQWztK/NEDEjJ+QyTx/QdSUoA/
         UiYThn1iQ68plE1h88EYnZVye9DBEDH9xcWbOuhHimQGJOQfSpetgxzz/PfdAaOjX7fL
         ODDs7AqrJFRH4+37gVYGyrBYUerBQJHpYQIi5xLVZn2qMjbwd1n9YTsrJLQAx3LR8OF8
         cLl1br5PuW9I847VlEpcduNnlawLAKTcXWejQ0WA29f3Vd1P5fH9drC9DeFohtnNlh6b
         6TY+fh9SzkFDb6pf3NYkaxmXdoa2o8lxIy43mu3sBonHfa0gjIA/Dk5/mrq+k1IZoQSo
         yRcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+wz+Vv2WOPRyDVN6nZCZHLORNR3tud3V0KJ5Q/bta16YjKbNsDj248SKHboH5inNK+/oyTu72Ck8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6M2rX3tG40DVsqAqY/C2xqxGROlt2BIcQcLWMhrCATh2AJSKU
	JUfVk7QJRN1DPjtJQ4G7OT/r5rci2mO8CzWTPF6I94r4Wgfr2OZ1lEsR9AYLUw==
X-Google-Smtp-Source: AGHT+IHv5tJZM/CZtZkzb35diPegJbA7tGqzJqnhO2m/FKOrZtxKnNeufvS4Z8dinQsWnVaJMt57mA==
X-Received: by 2002:a05:6512:238c:b0:52f:d0f0:e37e with SMTP id 2adb3069b0e04-53d862e4fc4mr7676419e87.42.1731410576549;
        Tue, 12 Nov 2024 03:22:56 -0800 (PST)
Message-ID: <acd75f3d-da7d-4487-afde-877405c24c2a@suse.com>
Date: Tue, 12 Nov 2024 12:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/riscv: introduce setup_mm()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1731344883.git.oleksii.kurochko@gmail.com>
 <c3640fe453cb8a0eff4d50d21d57535f67f7b92a.1731344883.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c3640fe453cb8a0eff4d50d21d57535f67f7b92a.1731344883.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2024 19:16, Oleksii Kurochko wrote:
> @@ -25,8 +27,11 @@
>  
>  static inline void *maddr_to_virt(paddr_t ma)
>  {
> -    BUG_ON("unimplemented");
> -    return NULL;
> +    unsigned long va_offset = maddr_to_directmapoff(ma);
> +
> +    ASSERT(va_offset < DIRECTMAP_SIZE);

Much like with the consideration towards virt_to_maddr() that was
corrected from v4, I think this one also needs adjusting:

    ASSERT(va_offset < DIRECTMAP_SIZE + (DIRECTMAP_VIRT_START -
                                         directmap_virt_start));

This is because ...

> +    return (void *)(directmap_virt_start + va_offset);

... you're offsetting the VA here. It may then want accompanying
by

    ASSERT(va_offset >= DIRECTMAP_VIRT_START - directmap_virt_start);

(probably to go first).

> @@ -423,3 +429,147 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>  
>      return fdt_virt;
>  }
> +
> +vaddr_t __ro_after_init directmap_virt_start = DIRECTMAP_VIRT_START;
> +
> +struct page_info *__ro_after_init frametable_virt_start = frame_table;
> +
> +#ifndef CONFIG_RISCV_32
> +
> +/* Map a frame table to cover physical addresses ps through pe */
> +static void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
> +{
> +    static mfn_t __initdata frametable_mfn_start = INVALID_MFN_INITIALIZER;
> +
> +    paddr_t aligned_ps = ROUNDUP(ps, PAGE_SIZE);
> +    paddr_t aligned_pe = ROUNDDOWN(pe, PAGE_SIZE);
> +    unsigned long nr_mfns = PFN_DOWN(aligned_pe - aligned_ps);
> +    unsigned long frametable_size = nr_mfns * sizeof(*frame_table);
> +    mfn_t base_mfn;
> +
> +    if ( mfn_eq(frametable_mfn_start, INVALID_MFN) )
> +    {
> +        frametable_mfn_start = maddr_to_mfn(aligned_ps);
> +
> +        frametable_virt_start -= paddr_to_pfn(aligned_ps);
> +    }
> +    else
> +        panic("%s shouldn't be called twice\n", __func__);

As said on the v4 thread - I don't think this is needed. Aiui Misra would
actually dislike it, as it's unreachable code. Just to re-iterate: My
complaint there wasn't about this missing check, but about the function
partly giving the impression of expecting to be called more than once.

> +    if ( frametable_size > FRAMETABLE_SIZE )
> +        panic("The frametable cannot cover [%#"PRIpaddr", %#"PRIpaddr")\n",
> +              ps, pe);
> +
> +    /*
> +     * align base_mfn and frametable_size to MB(2) to have superpage mapping
> +     * in map_pages_to_xen()
> +     */
> +    frametable_size = ROUNDUP(frametable_size, MB(2));
> +    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, PFN_DOWN(MB(2)));

As you already use PFN_DOWN() once, why do you open-code it for the other
argument? You also use it ...

> +    if ( map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
> +                          PFN_DOWN(frametable_size),

... here, where the purpose of the argument is exactly the same.

> +void __init setup_mm(void)
> +{
> +    const struct membanks *banks = bootinfo_get_mem();
> +    paddr_t ram_start = INVALID_PADDR;
> +    paddr_t ram_end = 0;
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
> +    for ( i = 0; i < banks->nr_banks; i++ )
> +    {
> +        const struct membank *bank = &banks->bank[i];
> +        paddr_t bank_start = ROUNDUP(bank->start, PAGE_SIZE);
> +        paddr_t bank_end = ROUNDDOWN(bank->start + bank->size, PAGE_SIZE);
> +        unsigned long bank_size = bank_end - bank_start;
> +
> +        ram_start = min(ram_start, bank_start);
> +        ram_end = max(ram_end, bank_end);
> +
> +        setup_directmap_mappings(PFN_DOWN(bank_start), PFN_DOWN(bank_size));
> +    }
> +
> +    setup_frametable_mappings(ram_start, ram_end);

Just to double check: There is a guarantee that ->nr_banks isn't going to
be zero? Else the setup_frametable_mappings() invocation here would badly
degenerate.

Jan

