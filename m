Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B25CA76BB1
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 18:14:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932829.1334892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzHm5-0002x8-5n; Mon, 31 Mar 2025 16:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932829.1334892; Mon, 31 Mar 2025 16:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzHm5-0002uO-2r; Mon, 31 Mar 2025 16:14:09 +0000
Received: by outflank-mailman (input) for mailman id 932829;
 Mon, 31 Mar 2025 16:14:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzHm4-0002uI-4Q
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 16:14:08 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b37e04d-0e4b-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 18:14:06 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39bf44be22fso2339636f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 09:14:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66aeaasm11797639f8f.53.2025.03.31.09.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 09:14:04 -0700 (PDT)
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
X-Inumbo-ID: 2b37e04d-0e4b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743437645; x=1744042445; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VXF5dS3xOnr8BItQn5poZsH936R9nIwkx3u4ZuXLT5U=;
        b=LZMJLwEVih1sqSLxiipFwHXmX8Cmf6xdTJrOjJPfUKF9zErupO36KFC8vw19BFygye
         Us/8kDs0WtKo3IfX2+pxBvqUP1PdRYFKruJxStlypJV5lMTxrzVJVt84lx03mvlUmrlm
         XTrSumFI6IbFNb+rD1VDYgDkMa5f0uZeDA/CUWUJKIb4gw2iQ/8Oqk4nH7VSMqE/5+7G
         iDiZGEJlgkWWLV8bvoWa/YCa+Z57RBkYiHx/d8VnTG2TnUtW0Ej38NaATRfz7FTy5cJO
         rPOsF4Ngqe0uLJAbBwKQqLMMJoaLtgV2p8156ZcaQkrXpQl4C4+LuScxZ1yRIh1pm2Tg
         LpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743437645; x=1744042445;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXF5dS3xOnr8BItQn5poZsH936R9nIwkx3u4ZuXLT5U=;
        b=iVyJTeEjx9teFJ6Qn8cXeQSRgKiDI+V3OfbUjpNySgMQAUaDMuHRKzXZ4VyRjc9NFG
         TRu6j+jSFpX19Qrx7bPzJJ1C+mBtmztnW3/2KolaQXWrEHuQ0Gp7HDGxmOM7IibrdyEu
         nojwZ9KcIPfYrAIQ5B7sWEidJCBlJvgDd0HaR2Ktn9ztIP/c9oR24WHkXDQMgs//EKuD
         jN9LzL+mh98o9KfXvp9OeyUIV6o65QpdenOT0GDSXjrKQYd0AX6JGmhRQ/sVOpfJkRUM
         IRnBN4xpm6b0gmnpA9pRVXup7sPkaB0veEuoogsoxGQ/UJQuq8VtABOvDHvP0M6ygPbr
         TnTg==
X-Forwarded-Encrypted: i=1; AJvYcCW2Rv1P8weD18igouyuC1i10DcElSMRDzsnYnKLM0hWK+a8WJXTb7X/ChrpUCJ84+WquNR1aDhCxuI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyiUzjwD91U4Fmc+WWMGKMivoA5mlsEFzCfDGFU0/PNzuVL3mA
	hRajKUEKjGegA3WI4sf9EjNVkzSJHU07/67L7ranAgi7I59jqn8pY2mLM3D/Cg==
X-Gm-Gg: ASbGncsWaNxQSFH6XnxuWkN6eb95xVjEacLPYKlu8yae0th5tfm4895U1GNBT+W5Zrf
	GKek67YkKCyiw1OqlSgpN3AkjbHOyoSatd0MC3HERr6Vs8B/6r/oAcM+sZ/yic5L+4sDWXDA1iw
	tEri9wUhQDOI1yrTJO27GLh4jcm2+VMznUupRK0M0ONW475z9aAQnW6rD69jGfnLYQdFoxCs4cx
	J/loV+XaYvNc57H4cwvDj1HKPmsCvxEJYyOkiZfl4FgKvgac9wyHsptVHmqZ7sAD++/dABR830O
	z3spoJp1KicIYvfOYJ1f5+HWb+0eupdoaJEeqGn9g8+MSdJ5vHlnK9Pna6NUVsxCplkQ8vqtZRc
	988iaNqLaOYHzgP2RTteUngwGHkAJLw==
X-Google-Smtp-Source: AGHT+IE3mdrzD0utNbyfDMXIQQtWnQrX5za3GNsAx5HoTi1Xn+N26+FhcaojV3XcI7kLUT9zyMMUIw==
X-Received: by 2002:a05:6000:2510:b0:39c:1efb:ec8e with SMTP id ffacd0b85a97d-39c1efbed7fmr2221057f8f.6.1743437645287;
        Mon, 31 Mar 2025 09:14:05 -0700 (PDT)
Message-ID: <54ebdcb7-071f-411f-803a-930dc330a497@suse.com>
Date: Mon, 31 Mar 2025 18:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: Increase XEN_VIRT_SIZE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <e5fa4219ccf43125e2489cc8c49b4404e6ed22ce.1743434164.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e5fa4219ccf43125e2489cc8c49b4404e6ed22ce.1743434164.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.03.2025 17:20, Oleksii Kurochko wrote:
> A randconfig job failed with the following issue:
>   riscv64-linux-gnu-ld: Xen too large for early-boot assumptions
> 
> The reason is that enabling the UBSAN config increased the size of
> the Xen binary.
> 
> Increase XEN_VIRT_SIZE to reserve enough space, allowing both UBSAN
> and GCOV to be enabled together, with some slack for future growth.

At some point you may want to use 2M mappings for .text (rx), .rodata
(r), and .data (rw). Together with .init that would then completely
fill those 8Mb afaict. Hence you may want to go a little further right
away, e.g. to 16Mb.

> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -43,13 +43,19 @@ static inline void *maddr_to_virt(paddr_t ma)
>   */
>  static inline unsigned long virt_to_maddr(unsigned long va)
>  {
> +    const unsigned int vpn1_shift = PAGETABLE_ORDER + PAGE_SHIFT;
> +    const unsigned long va_vpn = va >> vpn1_shift;
> +    const unsigned long xen_virt_starn_vpn =

s/starn/start/ ?

> +        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
> +    const unsigned long xen_virt_end_vpn =
> +        xen_virt_starn_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
> +
>      if ((va >= DIRECTMAP_VIRT_START) &&
>          (va <= DIRECTMAP_VIRT_END))
>          return directmapoff_to_maddr(va - directmap_virt_start);
>  
> -    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
> -    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
> -           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
> +    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(8));

Is it necessary to be != ? Won't > suffice?

> +    ASSERT((va_vpn >= xen_virt_starn_vpn) && (va_vpn <= xen_virt_end_vpn));

Are you sure about <= on the rhs of the && ?

> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -31,20 +31,21 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
>  #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
>  
>  /*
> - * It is expected that Xen won't be more then 2 MB.
> + * It is expected that Xen won't be more then 8 MB.
>   * The check in xen.lds.S guarantees that.
> - * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
> + * At least 6 page tables (in case of Sv39) are needed to cover 8 MB.
>   * One for each page level table with PAGE_SIZE = 4 Kb.
>   *
> - * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
> + * Four L0 page table can cover 8 MB(512 entries of
> + * one page table * PAGE_SIZE).
>   *
>   * It might be needed one more page table in case when Xen load address
>   * isn't 2 MB aligned.
>   *
> - * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
> + * (CONFIG_PAGING_LEVELS + 2) page tables are needed for the identity mapping,
>   * except that the root page table is shared with the initial mapping
>   */
> -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
> +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS + 2) * 2 + 1)

I'm in trouble fitting the comment updates with the update of the #define. Why
would more tables be needed for the identity mapping? Why does XEN_VIRT_SIZE
not appear anywhere here?

Jan

