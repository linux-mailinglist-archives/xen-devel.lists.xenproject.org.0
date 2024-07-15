Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000EC9310A3
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 10:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758752.1168217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTHRi-000493-Ne; Mon, 15 Jul 2024 08:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758752.1168217; Mon, 15 Jul 2024 08:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTHRi-00046m-Ku; Mon, 15 Jul 2024 08:52:34 +0000
Received: by outflank-mailman (input) for mailman id 758752;
 Mon, 15 Jul 2024 08:52:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSyp=OP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTHRh-00046g-1U
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 08:52:33 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91ec403c-4287-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 10:52:30 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2eee298bd2eso17781761fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 01:52:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ec7d90bsm3827496b3a.138.2024.07.15.01.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 01:52:28 -0700 (PDT)
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
X-Inumbo-ID: 91ec403c-4287-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721033550; x=1721638350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nXtBFTVNvFNoXxeH41CXLTUIY6Uc3KPglBE5cEpCxnw=;
        b=deKOLkiU9LaQFgU7kE73q670JztVIjbWOOeFjgdc8jrbi5qyTzNGpISisVro0ZqL05
         UIJRq298SGMgHc+8wZf9v9V85wQWJOWIphdrle3ba2sB1p07tPvwucilndYe7BT9Vz/k
         kRoSri7WvCd5E7RAZq+aGHFFmcxBu27eiVIGK9YmSohD5Ez2y3DlZjCDulWtMWtVI/0q
         ufhzs61g4azqHaZAkylBu6pa1gpYoWzG6WiVu4p2h9aIsFlEb5bEm+qqolIJo4LrnCS+
         w41RKeup6T9fDD24v8K/5HgkReBBl6vJySR3cdSzeH8CBst8Gh9QX8iuXI9luf8k36xc
         tJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033550; x=1721638350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXtBFTVNvFNoXxeH41CXLTUIY6Uc3KPglBE5cEpCxnw=;
        b=RdDn+he6BU3Zl40YzqW4NVkyFmRkuHTcqTcZnr43nHq8KqzLMK+Ori9wHhgfUlSQSI
         UPNvqZdP0ZmDms07pdq2c7cTfYZy1DgUbXAj/aWv8jk2QCDDmDIjcVso75Xg7PYvU9cc
         DvRZl/sW76m3MGRiWPX3nPeMCuPAx/qSgoUYdIR62cToFeMQhQdJb8+c2Vs1aP6nH7Gp
         caKcTJI9bvL53R2JuEb9wwzv0p7tJDs3wlDSVvBCskAy1BBNe1yK6RuGBHGmlNBHaW20
         803Wol+KKYU+PFApP5fwXhtLVRStv29FjibkOtq4xXiIi7lmoChci21pli+OtioMR9Xm
         m3OA==
X-Forwarded-Encrypted: i=1; AJvYcCVmlFUlU/3EVDoCx/6vupGQoiW7wsdQMLGKkczSChHE6UL311XdcPqiqnreMcRKgQfoVSRBvR7ET7ic0JVjyzubmJtH7uwvY5CN6Jj50Qw=
X-Gm-Message-State: AOJu0YyCPcJFmgnGEU/YP/fgeZzcA1qUikvkCnYHcClyqQ8ZjBe8iTZw
	IlbnYiyJOPI3Jdbn1Xb3lOQCSh9ufVo9Vxzy+rObQWD2Wm09WLtM09h3SD4CLw==
X-Google-Smtp-Source: AGHT+IFRCgCB20DkGdj+rWK3NEthUKmetkTHYhfk8hDDhi9cpdL5en8WLUD5ZRFad6u74gOSr/NYlQ==
X-Received: by 2002:a2e:8199:0:b0:2ec:c8:2755 with SMTP id 38308e7fff4ca-2eeb30fd5fbmr112643411fa.24.1721033549347;
        Mon, 15 Jul 2024 01:52:29 -0700 (PDT)
Message-ID: <bc8d2e10-0898-4f5a-b296-1bc7f528bb77@suse.com>
Date: Mon, 15 Jul 2024 10:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] xen/riscv: introduce early_fdt_map()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <4e4f94817fb3bba5f52336ea0b4491f7bc867d49.1720799926.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4e4f94817fb3bba5f52336ea0b4491f7bc867d49.1720799926.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2024 18:22, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -266,4 +266,6 @@ static inline unsigned int arch_get_dma_bitsize(void)
>  
>  void setup_fixmap_mappings(void);
>  
> +void* early_fdt_map(paddr_t fdt_paddr);

Please can you take care to address comments on earlier versions before
submitting a new one?

> @@ -435,3 +438,55 @@ inline pte_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
>  
>      return mfn_to_pte(mfn);
>  }
> +
> +void * __init early_fdt_map(paddr_t fdt_paddr)
> +{
> +    /* We are using 2MB superpage for mapping the FDT */
> +    paddr_t base_paddr = fdt_paddr & XEN_PT_LEVEL_MAP_MASK(1);
> +    paddr_t offset;
> +    void *fdt_virt;
> +    uint32_t size;
> +    int rc;
> +
> +    /*
> +     * Check whether the physical FDT address is set and meets the minimum
> +     * alignment requirement. Since we are relying on MIN_FDT_ALIGN to be at
> +     * least 8 bytes so that we always access the magic and size fields
> +     * of the FDT header after mapping the first chunk, double check if
> +     * that is indeed the case.
> +     */
> +    BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
> +    if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
> +        return NULL;
> +
> +    /* The FDT is mapped using 2MB superpage */
> +    BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);

May I suggest that you use MB(2) instead of SZ_2M (not just here)? I think
I had voiced opposition to the introduction of xen/sizes.h about 10 years
back, yet sadly it still landed in the tree. I for one think that our KB(),
MB(), and GB() constructs are superior, and (I hope) free of Misra issues
(unlike SZ_2G).

> +    rc = map_pages_to_xen(BOOT_FDT_VIRT_START, maddr_to_mfn(base_paddr),
> +                          SZ_2M >> PAGE_SHIFT,
> +                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
> +    if ( rc )
> +        panic("Unable to map the device-tree.\n");
> +
> +    offset = fdt_paddr % XEN_PT_LEVEL_SIZE(1);
> +    fdt_virt = (void *)BOOT_FDT_VIRT_START + offset;
> +
> +    if ( fdt_magic(fdt_virt) != FDT_MAGIC )
> +        return NULL;
> +
> +    size = fdt_totalsize(fdt_virt);
> +    if ( size > BOOT_FDT_VIRT_SIZE )
> +        return NULL;
> +
> +    if ( (offset + size) > SZ_2M )
> +    {
> +        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
> +                              maddr_to_mfn(base_paddr + SZ_2M),
> +                              SZ_2M >> PAGE_SHIFT,
> +                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
> +        if ( rc )
> +            panic("Unable to map the device-tree\n");
> +    }

Why this two part mapping? And why are you mapping perhaps much more
than "size"?

> @@ -48,6 +49,14 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  
>      setup_fixmap_mappings();
>  
> +    device_tree_flattened = early_fdt_map(dtb_addr);
> +    if ( device_tree_flattened )

Is this condition perhaps inverted?

Jan

> +        panic("Invalid device tree blob at physical address %#lx.\n"
> +              "The DTB must be 8-byte aligned and must not exceed %lld "
> +              "bytes in size.\n\n"
> +              "Please check your bootloader.\n",
> +              dtb_addr, BOOT_FDT_VIRT_SIZE);
> +
>      printk("All set up\n");
>  
>      for ( ;; )


