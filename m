Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F2EC8D71B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 10:08:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173593.1498615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOXz8-0003aK-D3; Thu, 27 Nov 2025 09:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173593.1498615; Thu, 27 Nov 2025 09:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOXz8-0003XG-9a; Thu, 27 Nov 2025 09:08:18 +0000
Received: by outflank-mailman (input) for mailman id 1173593;
 Thu, 27 Nov 2025 09:08:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOXz6-0003XA-9Q
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 09:08:16 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a78735e-cb70-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 10:08:13 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42b32a5494dso360528f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 01:08:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1cab9af3sm2260975f8f.41.2025.11.27.01.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 01:08:12 -0800 (PST)
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
X-Inumbo-ID: 9a78735e-cb70-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764234493; x=1764839293; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mjbmciW33d5meull/UZCBrNptpHir15RTAuWpoGEF/o=;
        b=OxDq3tdWaSZr0ZCgX3QorggsN/dU1mWPkvRQRagERLbcOrdaZ2SlKE1IKXMASoXLd/
         cEBy+136EkCWAqbzT6QPzJZi78SPI2qwabO56TqlDBfAS+jhccfsyXr6S53TTCNvxFeX
         gqCZ1XsejJAqtA7uTl7j8PxUkjnA/1tkQGNAXiND+83nEm9XKzeZKIEiQjiuGnD0jOBW
         Cn2qHqYkD7M9Aakrqf8ruNB3j7FXNYT3+zxkUi+jIqZ8EsUk75YEJQYAAzOThUOSXPV+
         XiCw/hstmXqqfd+bMYDUNPvANjrPYlA+LsRD+QabTnPcmWj+EzmFDXzBpcoWMK02mqsa
         AwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764234493; x=1764839293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjbmciW33d5meull/UZCBrNptpHir15RTAuWpoGEF/o=;
        b=ucZ9Mmk9Wd1augafbjUzUmAnhC1jbslFx7FgsrLespylxLnZSuEN3/4IWVr0/Arx8v
         AGXF/FUm4H3Ejzuytpfj9v93RLTi3nDtvRxmxmUTg5xak4W5TYIYz01LUPxriiNNwaiF
         KoiP1Wzf7/xYuvUxuI3/rY2sWiXbv7FtsuCNunhbDkJ2cjJtrwHA3A6sXdHAM/9redCQ
         KVkG5cw1wrK2A44CQOb4FeXuPyzo1ZsHsis7Yh7WJs74e0mkfVgBZhccR5u+aTO82Own
         WPZ01Y0VyNvwruJXL4dDwWEEoNPaLecGk4H35+2jVJhZ7+WajVw8EhCgnmWxlMDZFuUy
         SCrA==
X-Forwarded-Encrypted: i=1; AJvYcCUX7FQyvR4slvYHP0QawSP6XFKqYOvrm4jAtGmnhoGKPfPQ1MOUhNMvumPhmZchQldPFfMVlzMhOwk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNGQT48RAMK5rzpzrM+RWK5R8Qu5Ig8qdwQykScH+rEyxGtD8R
	ymBVEuXMMXJIyaZw4bvpgcdaPVGhbk3x0hSoFkw+cnSyOneFB/05cEIHEnZcDM0onA==
X-Gm-Gg: ASbGnctZpg5ZPN0D8pnrpYVIvaVsrgXwW7GNgGGQr3VslwraBPKhWhB/G9uOQWw7PlS
	iXwFK1OqA0IkD0eZfcoXLyceaEIZF2H2sPImaJb3ZD+8FVA+Y5PLoEPVcQ7RI4iL8D/ZnTveB9X
	ysi+d+Nx/zZPnxZstiWk2UkepVB8zc8IuEWiaykKHlsqq5pE6a3FeiR8Q6w/6hmpr4ZdSbB0EwS
	ZJ9spJeaspR6tcpIucEVF7sDXyyghQ6CCAzXNuVcW66Y4mD0UoLt9fMAWUKmzViajZd4PI3CJ8c
	9WjAM6pNJ21w2hyC8Px94YbmzR6Gd/wDMfWvycvWsGF6n+iSubpX02cvVW9QeS5Mx2q6ZChUc1T
	9Kwnk600AoeIZnxXmlb7n+o1guvs9vWY2uyKkEMXG1P21bxuSis0zKl6DWfI35obUMmyFZKvh57
	hBDvtXNE66U+AW3D43EM2lVUFtiglSL2y5Rn+BHNRfSWjoYLqXD42BiiBqzGjcthXNBAzng1oVA
	6Ra3g2pIlXxrw==
X-Google-Smtp-Source: AGHT+IHpz1p/HV1qSOFe8sa4Y+ksN9Kt+3DVdqceu0yOZLJfHzw4YUWf/VXjP6YfqNTcXomqAsx9lw==
X-Received: by 2002:a05:6000:400f:b0:42b:3c3e:5d53 with SMTP id ffacd0b85a97d-42cc1cedbf7mr25137120f8f.16.1764234493038;
        Thu, 27 Nov 2025 01:08:13 -0800 (PST)
Message-ID: <684e2b32-6669-4319-8d9b-e041304b86cc@suse.com>
Date: Thu, 27 Nov 2025 10:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251126204331.3395888-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251126204331.3395888-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 21:43, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The d->arch.physaddr_bitsize field is used only by PV32 code, so:
> 
> - move domain_set_alloc_bitsize() function into PV32 code and clean up
> unused domain_set_alloc_bitsize() defines from other arches

This could be two separate patches, which likely would be pretty uncontroversial
(and hence be able to go in quickly): One to drop the entirely unused #define-s
for non-x86, and the other to move the x86 function so it can become static in
the sole file using it.

The former patch may want to have several Fixes: tags (as to being Misra
violations), as from all I can see there had never been a need to introduce
those #define-s. Even in 3.2.x they were already confined to x86-only code.

> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -314,10 +314,10 @@ struct arch_domain
>  
>  #ifdef CONFIG_PV32
>      unsigned int hv_compat_vstart;
> -#endif
>  
>      /* Maximum physical-address bitwidth supported by this guest. */
>      unsigned int physaddr_bitsize;
> +#endif

I'm not happy to see the anomaly here being widened. PV-only items really
belong in struct pv_domain.

> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -619,9 +619,6 @@ void __iomem *ioremap_wc(paddr_t pa, size_t len);
>  
>  extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm);
>  
> -void domain_set_alloc_bitsize(struct domain *d);
> -unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bits);
> -
>  unsigned long domain_get_maximum_gpfn(struct domain *d);
>  
>  /* Definition of an mm lock: spinlock with extra fields for debugging */
> @@ -659,4 +656,11 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>      return (mfn + nr) <= (virt_to_mfn(eva - 1) + 1);
>  }
>  
> +#ifdef CONFIG_PV32
> +unsigned int _domain_clamp_alloc_bitsize(const struct domain *d,
> +                                         unsigned int bits);

This introduces a (C language spec) naming violation - identifiers with
this kind of a name a reserved for file-scope use.

> +#define domain_clamp_alloc_bitsize(d, bits)                                    \
> +    _domain_clamp_alloc_bitsize((d), (bits))

Nit: No need for the inner parentheses; they only hamper readability.

> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -230,6 +230,27 @@ unsigned long pv_make_cr4(const struct vcpu *v)
>  }
>  
>  #ifdef CONFIG_PV32
> +unsigned int _domain_clamp_alloc_bitsize(const struct domain *d,
> +                                         unsigned int bits)
> +{
> +    if ( (d == NULL) || (d->arch.physaddr_bitsize == 0) )
> +        return bits;
> +    return min(d->arch.physaddr_bitsize, bits);
> +}

While moving, please make minimal style adjustments: Add the missing blank
line before the final "return" here, and ...

> +static void domain_set_alloc_bitsize(struct domain *d)
> +{
> +    if ( !is_pv_32bit_domain(d) ||
> +         (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page) ||
> +         d->arch.physaddr_bitsize > 0 )
> +        return;
> +    d->arch.physaddr_bitsize =
> +        /* 2^n entries can be contained in guest's p2m mapping space */
> +        fls(MACH2PHYS_COMPAT_NR_ENTRIES(d)) - 1
> +        /* 2^n pages -> 2^(n+PAGE_SHIFT) bits */
> +        + PAGE_SHIFT;
> +}

... add a blank line between the two statements here. In the former function
please further consider switching == NULL and == 0 to our more common use of !.

Jan

