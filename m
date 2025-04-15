Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50825A8997A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:07:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952458.1347901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dCa-00015l-KF; Tue, 15 Apr 2025 10:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952458.1347901; Tue, 15 Apr 2025 10:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dCa-000138-H8; Tue, 15 Apr 2025 10:07:36 +0000
Received: by outflank-mailman (input) for mailman id 952458;
 Tue, 15 Apr 2025 10:07:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4dCY-000119-OF
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:07:34 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72527328-19e1-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 12:07:32 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso51320935e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 03:07:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2f64sm202425975e9.16.2025.04.15.03.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 03:07:31 -0700 (PDT)
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
X-Inumbo-ID: 72527328-19e1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744711652; x=1745316452; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EdKbKBUarX8IRtK9PoQ+DxM9G6nXsdYKh0cPrIiWhBo=;
        b=Iy46Va0HnmwWi3ZJqJrJYHa+2D8cLnwabqjlK3etozgY+Nje+CdiVU3qKD7X7HE2AV
         H7GOdpB7O89a45NTPe+rZOw5RQelAz6QY0heS2x575a/TcpLStG94xBMn2QNumr405kh
         WlxiU6EmaO+kkjDLN0lGpRntWyBLsYpX1XExg3am16WoLt5lODBaBN9CK2ZVX9IdtJk5
         LayAm3uDLsXTI7LnwydcFs6lT+8odZ7FySqzVaPCoSG9n2n7l1wYRbNgunUmKsk/wALN
         ba8kLFv83ZTB9VBUsCXBLd9cfJ+V8cpS/It/Eae6CaS4J6nzkws3GRiDgxmph8JwlDJ3
         1Tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744711652; x=1745316452;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdKbKBUarX8IRtK9PoQ+DxM9G6nXsdYKh0cPrIiWhBo=;
        b=AuoIkTL7NCtlfmQFX5TC5oR372uOThFT8eNTH0p3QtPeCYB4O/BMOSVrVJjvDc7y/i
         ftk1FctLKKkXUWAA6nJhcJTNkPu9QFzBYxx25UuCBsqM7c8HO3ZihWuNfJHvK3jwXoc7
         m4HzrQ7bj0TMAhvxxxBt/IEdv0gv3oj/lwCYTm7FBz+6BLz7iS3eTwL58Pbj2AvgXeK2
         E4XsvNSJFAxbzSvwWGbcfpSdF7HG4o/SICSWudn6t9cBgIzCY5w21XxfjR1dMNC4jRxw
         lztVW3ccSYnUWu0X3t/PQ8JLK6NBBRMXh/M0qZDz6XzubiqqobWdUS62lz9Q5TIcN82M
         Qxdg==
X-Forwarded-Encrypted: i=1; AJvYcCUcj2pi9zPN/4Ad6nQFgW3dmTZrct6IO3wSGOlxyYqXt3NIpVHpbv9IdCNF50+NOlgwnpLWCIHTGKA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtacX4rUS596MQhWjHlOkUsaizjTgpHcLOPmmdCpiyk5qdfdV3
	UDKdibiW85dzR49pd+gVeAJIj5zoIf1vwZYryQUXfbmbuBtA/P/x3cFyojDD7A==
X-Gm-Gg: ASbGncu+jxQR4+dJ37KLL2dHaD6p5oA4ZeBT6OqfoCkQYa9dnSnF0WOyn/9rAJnt9qn
	2KzwJoT7J8gSpGgb7xuqP9EnYn6r7Wi4yU7Va3Hw4+swzC22G58oxiyIu3hDmBsIA0TNoZqBcwu
	kkizGIePpkBnqUWwl38rHuRHZvpVYf+PCMMfEfgg5akhkpx/g9xPcf9Z6APl/FsoCWXm0r0BM9c
	6O7wxgA8sMec7JBgKuVV0muFcsrOWcF5+swvj9XOYbqb2gtxe9fGZl2Zfi4u7y1c5t/ohC7ub99
	47m+DOvRRntlIKEypJktzfRhFH6QMV9Elhspem/xZH6S5emlbNHmWzHmQ43rEM1JDp0/vpoGtkl
	bBfDf+2qBDOADkwXB13TM30TplYcK4ntWItQs
X-Google-Smtp-Source: AGHT+IGlr3CF3+B9t64PgIeaADf1cM0KeeV4hsKRtjqL/1bh92KC6gGVEjJtDNPCEpK2lrDc7i6zOg==
X-Received: by 2002:a05:600c:1d83:b0:43c:f3e4:d6f7 with SMTP id 5b1f17b1804b1-43f3a9afdeamr159238685e9.31.1744711651993;
        Tue, 15 Apr 2025 03:07:31 -0700 (PDT)
Message-ID: <6ea52f30-7aa4-494b-9719-9fdffc56e3c8@suse.com>
Date: Tue, 15 Apr 2025 12:07:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/riscv: Increase XEN_VIRT_SIZE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <0815b65aa0b526b85c737f5923148b119cc4104f.1744639515.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0815b65aa0b526b85c737f5923148b119cc4104f.1744639515.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 17:56, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -31,20 +31,30 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
>  #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
>  
>  /*
> - * It is expected that Xen won't be more then 2 MB.
> + * It is expected that Xen won't be more then XEN_VIRT_SIZE.
>   * The check in xen.lds.S guarantees that.
> - * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
> - * One for each page level table with PAGE_SIZE = 4 Kb.
>   *
> - * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
> + * Root page table is shared with the initial mapping and is declared
> + * separately. (look at stage1_pgtbl_root)
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
> + *   one L0 is needed for identity mapping.
>   */
> -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
> +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 2) * 2 + \
> +                             (XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1)) + 1)

I'm still struggling here. In the original expression, the +1 was to cover
the root page table, wasn't it? By now subtracting 2 from
CONFIG_PAGING_LEVELS, you reduce the overall result by 2. One of these two
is accounted for by the Xen size calculation now. Where's the other one?
Or are you suggesting that for some (not obvious to me) reason we
previously calculated one too many?

> +/* Changing these checks can require an update of PGTBL_INITIAL_COUNT */
> +_Static_assert(IS_ALIGNED(XEN_VIRT_START, GB(1)),
> +               "XEN_VIRT_START should be 1gb aligned");
> +_Static_assert(IS_ALIGNED(XEN_VIRT_SIZE, MB(2)),
> +               "XEN_VIRT_SIZE should be 2mb aligned");

Why would you need to open-code BUILD_BUG_ON() here? See the various
build_assertions() functions we've accumulated.

Jan

