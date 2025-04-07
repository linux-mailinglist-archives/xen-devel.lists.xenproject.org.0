Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C1AA7DAC5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 12:10:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939589.1339631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1jQI-0005IJ-JP; Mon, 07 Apr 2025 10:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939589.1339631; Mon, 07 Apr 2025 10:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1jQI-0005GT-GP; Mon, 07 Apr 2025 10:09:46 +0000
Received: by outflank-mailman (input) for mailman id 939589;
 Mon, 07 Apr 2025 10:09:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u1jQH-0005GL-GY
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 10:09:45 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bb43417-1398-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 12:09:41 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so33839525e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 03:09:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec342a1fesm126845145e9.3.2025.04.07.03.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 03:09:40 -0700 (PDT)
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
X-Inumbo-ID: 6bb43417-1398-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744020581; x=1744625381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AhP1AQBGNc83wnsfiwp7skWV7p2PKliYKPvBZlWWSro=;
        b=Yqp/6u0LeNb290nma1jnJQYr5Zf3RGfeKivkb8GSR5B1fXD7IjQk+Juxtc2Mrygl7U
         vnQBtSY71UjfFQhQtDc0QJQDYeqoNRwFQXUeu7xq5JqTayRLZ+hy7a8dUxgOdEChHbCX
         eepOX3ClhunybC+O2rT+vWG/cOVU0QYpxaCF8lodfN8w3Gt4B22o7gT4jEz9iRjn23fA
         kjZ/PJ6HfEy7HjDJJ/obXWY4H29busej5T1KMZ/PSktbs6q3RWRdpgtoGNYd8Ys95rs9
         rmQNn05l6xAFHUGI5Pl4gHn+Kr3miY4DJtfqWE77cXX5qAjjpURXVVV8ChPv96grW7i8
         z3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744020581; x=1744625381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhP1AQBGNc83wnsfiwp7skWV7p2PKliYKPvBZlWWSro=;
        b=eda82Dy3Dn7x0hLjNs0TRKLK1nhhhH/2zdl+zBf/o74v+92xScbHw+gHuzvnBTew3r
         CO/s/KqPuX4V5zJB5q0U8ypa+H8uXGzfkbutaLDYkEWl6PTuGgR9s+2Uci7lEp9ZSMFn
         ao/tcX3XcVqGr5MtP+p9Xo9gO5xqJNws+TAEI+2oVAzlbTI5ef1ODjfTotf6MuCwTOVz
         LhTnEG0pxhXKitD3WT9XVuasf8EMZhPfJasiw45C6kDywuJLPL20uhrKWaYBH+tUUekK
         jBDdWYFsgoY7BBCLvd8RizacFg/jTMjI7+VnUF8CP9Ei6FJryAqlMUxHzgB2I4o5taEP
         n9aA==
X-Forwarded-Encrypted: i=1; AJvYcCVOyqBT4fo5xbNEFZ0eePEfHDCkl3lwcao/VoQub0SWcVnhPcmaCCW3OBouod/SQkQnVvDOgTtMF6E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1HZ95G7KV/HjtWH8w4jn/fNX1HUltqPu8BsVa+JoFZ2XRW7F6
	uviI3l9BB4yfRYt855hkn6T5hrxtZg4BdiY9AlVVY8do9cUaisluLIiuLEoTCg==
X-Gm-Gg: ASbGncvofMtZu3j/Y7r36q1k96lI/QqocjZNIS0BAObWCWSeDeZ2dhdCu7tYxJaY+Hw
	B6GouTNFslLzvmrp+xFKzAGYpjit8uxW94N2v4apDNTyifczdmjviuKVW2b8RQA2EEYGEg8uq53
	msfKAeYuknizRe9MwxU+rtk/BjvJhveBv21IhJpDm7cSj5Y/VsCJhSQvxcjEsGJNXpM5MINn7DP
	dR+ioDTb+pZSBsn+TGQ6wzZhCf1XiLLiYOMnqfzSiZh1FjBd6AMO+A/XEpYSPV7mMGzeAJDpaNd
	sj0Cm5r6yBFb9rwAj9MBiIfp6wzdLdMLidB+Gbu1dT3dq+AbnAna2Mki8BBXYyam6puL5Q+A5Jg
	LH+vA6lMbLjQBrlL5bgkVnPMxL8oQPQ==
X-Google-Smtp-Source: AGHT+IG+yy8Sx+s/6LIO6gEepdoVZ0wWGSvaPvdVxkDtcCTwOag8jc+POcxoXgNCcEs4v/3R0prsKA==
X-Received: by 2002:a05:600c:1d8e:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-43ecef0230cmr106391095e9.16.1744020580728;
        Mon, 07 Apr 2025 03:09:40 -0700 (PDT)
Message-ID: <e5f6ccb3-498f-44cf-8c06-61fa502d93db@suse.com>
Date: Mon, 7 Apr 2025 12:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: Increase XEN_VIRT_SIZE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <808d1b346bc90dde38fd19a6b92ab78d78e42936.1743766932.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <808d1b346bc90dde38fd19a6b92ab78d78e42936.1743766932.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.04.2025 18:04, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -41,11 +41,11 @@
>   * Start addr          | End addr         | Slot       | area description
>   * ============================================================================
>   *                   .....                 L2 511          Unused
> - *  0xffffffffc0a00000  0xffffffffc0bfffff L2 511          Fixmap
> + *  0xffffffffc1800000  0xffffffffc1afffff L2 511          Fixmap

Isn't the upper bound 0xffffffffc19fffff now?

> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -43,13 +43,19 @@ static inline void *maddr_to_virt(paddr_t ma)
>   */
>  static inline unsigned long virt_to_maddr(unsigned long va)
>  {
> +    const unsigned int vpn1_shift = PAGETABLE_ORDER + PAGE_SHIFT;
> +    const unsigned long va_vpn = va >> vpn1_shift;
> +    const unsigned long xen_virt_start_vpn =
> +        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
> +    const unsigned long xen_virt_end_vpn =
> +        xen_virt_start_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
> +
>      if ((va >= DIRECTMAP_VIRT_START) &&
>          (va <= DIRECTMAP_VIRT_END))
>          return directmapoff_to_maddr(va - directmap_virt_start);
>  
> -    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
> -    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
> -           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
> +    BUILD_BUG_ON(XEN_VIRT_SIZE > GB(1));
> +    ASSERT((va_vpn >= xen_virt_start_vpn) && (va_vpn <= xen_virt_end_vpn));

Not all of the range is backed by memory, and for the excess space the
translation is therefore (likely) wrong. Which better would be caught by
the assertion?

> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -31,20 +31,27 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
>  #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
>  
>  /*
> - * It is expected that Xen won't be more then 2 MB.
> + * It is expected that Xen won't be more then XEN_VIRT_SIZE MB.
>   * The check in xen.lds.S guarantees that.
> - * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
> - * One for each page level table with PAGE_SIZE = 4 Kb.
>   *
> - * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
> + * Root page table is shared with the initial mapping and is declared
> + * separetely. (look at stage1_pgtbl_root)
>   *
> - * It might be needed one more page table in case when Xen load address
> - * isn't 2 MB aligned.
> + * An amount of page tables between root page table and L0 page table
> + * (in the case of Sv39 it covers L1 table):
> + *   (CONFIG_PAGING_LEVELS - 2) are needed for an identity mapping and
> + *   the same amount are needed for Xen.
>   *
> - * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
> - * except that the root page table is shared with the initial mapping
> + * An amount of L0 page tables:
> + *   (512 entries of one L0 page table covers 2MB == 1<<XEN_PT_LEVEL_SHIFT(1))
> + *   XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1) are needed for Xen and
> + *   one L0 is needed for indenity mapping.
> + *
> + *   It might be needed one more page table in case when Xen load
> + *   address isn't 2 MB aligned.

Shouldn't we guarantee that? What may require an extra page table is when Xen
crosses a 1Gb boundary (unless we also guaranteed that it won't).

Jan

