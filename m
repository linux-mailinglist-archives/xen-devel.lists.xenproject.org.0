Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B2FCADCA3
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 17:53:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181008.1504094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSeTt-0004Vh-Lx; Mon, 08 Dec 2025 16:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181008.1504094; Mon, 08 Dec 2025 16:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSeTt-0004TV-Iz; Mon, 08 Dec 2025 16:53:01 +0000
Received: by outflank-mailman (input) for mailman id 1181008;
 Mon, 08 Dec 2025 16:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSeTs-0004TP-3G
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 16:53:00 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 591e2ecf-d456-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 17:52:57 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47778b23f64so29435325e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 08:52:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479310b693csm245813425e9.4.2025.12.08.08.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 08:52:56 -0800 (PST)
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
X-Inumbo-ID: 591e2ecf-d456-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765212777; x=1765817577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AkK4SbevVGpFc9xrhQZRO7dsOuBxGU85PZ4zZvmTVO8=;
        b=IganNhztVIslFSYxtK9HR25Bhf2DrnLhnCs0QpxTEo+5j+3czOqR7/WgJgncUwosM3
         XHJIDcTiGk4JyYhdA614Q/SA2mw2DqxsIH8aLCqFVlZOJWi80wEV1QW7fnduaVIipsom
         SlA6SQm947dsrUPfVaaCRPIrz1IwWICE6BWzrvC9dBpjN4If2L7hvYdJk2qU0/F0bS3r
         Pxo2MMNS4nZ4MZEUFWHyXvlpOBxPz6nMjlrKWr6xC3/kXGJ7naWHLSA1aieWev0jOO8M
         IkQMv3Y2ExmwSzd94EdPtlB6D1Gmog7aQC35azqNB6ebeoi75Dq8KQe75DeeJK3+L9yz
         H6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765212777; x=1765817577;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkK4SbevVGpFc9xrhQZRO7dsOuBxGU85PZ4zZvmTVO8=;
        b=L90juLMYvdChaE+xiPyzawOtZqX5W98/6WrdG7B1VAck+pL42Ih4AUNf9LCBOydDnz
         Lmsg0qrzqa3KAa1XiJ2XLq6CD0i7R2QMDSFI6KqQUXOGkD++77mhN1+we8iqoypwug0C
         mN2TEzw0PHTHDMpIRUkp9jwLcQek14VukpHUCoSm8IUivpi3tJEVxde7Jql7A+lq0KNg
         YjuZ7dmB9lgD2nkRselsBRpDx8nC14Caln5M7daUpfEbv4h4ASnWlFAcAfUPa1Hx6LcZ
         OlcHPrdeIWpIzUYozj0/sVjqkBLSGHsYqppHLbY7rW22DzYRbYJ9cx9zXH2EiEJBzrYI
         4zGg==
X-Forwarded-Encrypted: i=1; AJvYcCXP5J3ymqCYg8r5uTfm8fdR7xrAehbKTLxaGpfy7Qo2jodGTpwlMyXJXiAzixZ+36hojTolDZsWFdk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweV1wU/TADfrxHEaplJIUutKniA0ji+b8glJug9ahEIar2a/bx
	2g1mqgTzZ1IPhyEf8gr94LKvcCRkkuJ2baCpaOkp7PIKxepk1og3VtaBMuimUqzc1w==
X-Gm-Gg: ASbGncuW+bmpH40WnMM2K+iYIiOqAsMorSfTYVmOJdmv7Wcq6OPXyXW2nxOA9ZAwwzd
	un9XpH3znQGWub4b54/2z6e5Uix/n82xnhf/3lDJBAYHtvIqtMwUXRPhshMBqD9JYqCW/d3qVJr
	Di49GCoj/YBG9t2GIWh9n7lRnbVdo/TbSiKRiM7TTp2ZesLR9eTohc60GAsvTCT+4fIJRuE/5N9
	VOKGkutW4LlWqAi7UynwngEcxLwDE3rw9waGe3Vt79nJaimf2BIfyp3ZnAKhZtnIt8wnUQBY2UE
	/48L6J8Pu9fS587KBNIL2sPaapAr6r1hJ/WpKqqzRRtIW9p7oZBSGL5v6Pq1M3Ut5SSD2MmtVfz
	evmWmySuKmJHus3s3vsE9jkdU1O7c4DwybLZdVgtwJbGnWXTdqjOD9WajzaD2gbMdvXvhMVhR0i
	Gra8m1mL4c+j9x1n8pXrnL35sT9jIw6nP7Zul31uIhzAG2AI9JyO1/HJ+WybwcXqj5txAxJxwFi
	WQ=
X-Google-Smtp-Source: AGHT+IGFE68OxoCxypPQ6IJzfstn6YAYQWkJLyeONVXIzAD1hb+EEH857OovJt+FQVlgGh5y9HAu+A==
X-Received: by 2002:a05:600c:43c5:b0:479:3a88:de60 with SMTP id 5b1f17b1804b1-4793a88dec8mr51086355e9.37.1765212777067;
        Mon, 08 Dec 2025 08:52:57 -0800 (PST)
Message-ID: <8b95ccca-7924-4cf8-818a-094782c6bbea@suse.com>
Date: Mon, 8 Dec 2025 17:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/19] xen/riscv: implement p2m_set_range()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <5f2812bb3b82ba1f9178eb00f68a85388f862f09.1763986955.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5f2812bb3b82ba1f9178eb00f68a85388f862f09.1763986955.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2025 13:33, Oleksii Kurochko wrote:
> @@ -28,6 +36,77 @@ unsigned char get_max_supported_mode(void)
>      return max_gstage_mode.mode;
>  }
>  
> +static inline unsigned int calc_offset(const struct p2m_domain *p2m,
> +                                       const unsigned int lvl,
> +                                       const paddr_t gpa)
> +{
> +    unsigned int off = (gpa >> P2M_GFN_LEVEL_SHIFT(lvl)) &
> +                       P2M_TABLE_OFFSET(p2m, lvl);
> +
> +    /*
> +     * For P2M_ROOT_LEVEL, `offset` ranges from 0 to 2047, since the root
> +     * page table spans 4 consecutive 4KB pages.
> +     * We want to return an index within one of these 4 pages.
> +     * The specific page to use is determined by `p2m_get_root_pointer()`.
> +     *
> +     * Example: if `offset == 512`:
> +     *  - A single 4KB page holds 512 entries.
> +     *  - Therefore, entry 512 corresponds to index 0 of the second page.
> +     *
> +     * At all other levels, only one page is allocated, and `offset` is
> +     * always in the range 0 to 511, since the VPN is 9 bits long.
> +     */
> +    return off & (PAGETABLE_ENTRIES - 1);
> +}
> +
> +#define P2M_MAX_ROOT_LEVEL 5
> +
> +#define P2M_BUILD_LEVEL_OFFSETS(p2m, var, addr) \
> +    unsigned int var[P2M_MAX_ROOT_LEVEL] = {-1}; \

What use is this initializer? Slot 0 ...

> +    BUG_ON(P2M_ROOT_LEVEL(p2m) >= P2M_MAX_ROOT_LEVEL); \
> +    for ( unsigned int i = 0; i <= P2M_ROOT_LEVEL(p2m); i++ ) \
> +        var[i] = calc_offset(p2m, i, addr);

... is guaranteed to be written to, afaics. With this simplified (or an
explanation given for why it is needed)
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

