Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85441A1D411
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 11:06:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877571.1287708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcM0h-0007er-Gu; Mon, 27 Jan 2025 10:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877571.1287708; Mon, 27 Jan 2025 10:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcM0h-0007cj-E2; Mon, 27 Jan 2025 10:06:27 +0000
Received: by outflank-mailman (input) for mailman id 877571;
 Mon, 27 Jan 2025 10:06:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcM0f-0007cQ-Df
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 10:06:25 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ceade93-dc96-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 11:06:23 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5dc10fe4e62so7726841a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 02:06:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc186183eesm5187647a12.10.2025.01.27.02.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 02:06:22 -0800 (PST)
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
X-Inumbo-ID: 5ceade93-dc96-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737972383; x=1738577183; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxEmDsMo+/gBOLwpFJjk0+oatht2X6UlbmkSSleeHPI=;
        b=LCoKVpwE8WecBiA+tNDWNflmxVtKyP4P1My8ZDu35s38iUpVNhJ7nK2Qyha73Eot9X
         tsY/xKp9WVkQRX7CWj0jTGW96muBT+BYDBzI/1iXuqrwrefeLL2TzWpKk1959nWOj5gq
         8p2Db4T4qVXVVe/aWjghyfqB/TTYKqt+ljqhxFFdarOM0oyP6vTGxz5NrhSlxyeK81bv
         TC2Pd1A5aXJRU81sWIm5SS58yPUF8Yn/GMZv/9EgzhU9ZpuK5Y1EfJfSwC7ATJ49vLZn
         x3bYdIrhGgNKot5lzdZe+Tg7U4O1Olwo9ztdpiP7y25M7sa7RsReVh2IZszof/AQIsvx
         1AMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737972383; x=1738577183;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxEmDsMo+/gBOLwpFJjk0+oatht2X6UlbmkSSleeHPI=;
        b=uQkUv6u8zk1OxJ6OVEEVaMvmFuHXKNL42nVK7se7bbeAO0MLNHigdLMs4PeFwmiMJ3
         f6q9dQyzDPNPA29ph4UFBeV3uxL6SmErOLueLyMmlkI5wx7C6JyHxrvmk5rGaATB7xTk
         8ODvDrrqhbeV51tFddFo0mRfD6lfRWGW7jxpt1PjIoYHRYZrDV7e07ehrpOd5OE908I/
         q6yq2Sp2yOdOEXwfnXGp8Y8Uk1+tJe8GNq48fMduN9UQpRhYWxzjCAI4PJGo6bvw1idf
         EpntMUcLNJS4h584iVPY3kVZiz8fnJA6iTuokWrJKuvLc1PYZTBy2qsMcPX27qFCnOcn
         RQaA==
X-Forwarded-Encrypted: i=1; AJvYcCVj0z8hfR2GdE5RftjeZbcdCOg84g3f1EEY0CV/FojxueBuJ1Htjon0yjoxu2VqQMAMIVkkJ7lraCA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxf59+8tk8JWhT7WAjvO83qDT4Lea5tW1fkSf69OPvA2qsMDOVq
	Rzo9A/Xw5BM+G+OxTCmZMTlUIS+IU0WDKn/51vy+V2p5FtQ4HCjD+52CJzvbaQ==
X-Gm-Gg: ASbGncsxKzn1vzUIzdpccA5JKHLWc5SPIBzwe7HriYD+6jeoAVf7qiYEo2TnNxzKvEL
	1ADwGU1OnnXUOLj5HEfgUOm0xum2C9LdlAvJ6FNAbu4jKQY5fo4SOHn+Kl/iB2X88mCVGDPp2fG
	Ylb7Oq76tOMyCAPrzIi84JZ3+YALTusJeZJxcZcWEWXhAmh2/IvLxXHhYYupoWsL4W97iFm1IeT
	7vimG5rnbpwwHM83apPTMIFXJVNywltXQ+9E5WAftzu4UOw116GsYTzeXmc/6uMmrmPql0UXOnB
	mi/Z2r7hum2G8bG+L/Q4JKz0NpiP7SVm6U0DBto2PVHvS6ENcCs1wm3B6LhoB5o8tw==
X-Google-Smtp-Source: AGHT+IEn3B8C3oJOAraoTae1gQ94YDTGMGSsKqimyCZYBtgSVZEtwOjZ9A68F1tu3BvFsqVBSNUwoQ==
X-Received: by 2002:a05:6402:5203:b0:5d3:e766:6143 with SMTP id 4fb4d7f45d1cf-5db7db078a1mr39509010a12.30.1737972382913;
        Mon, 27 Jan 2025 02:06:22 -0800 (PST)
Message-ID: <21bfd2f5-74b8-409e-956c-dd736a3c0be2@suse.com>
Date: Mon, 27 Jan 2025 11:06:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: implement software page table walking
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1737391102.git.oleksii.kurochko@gmail.com>
 <00dfc71569bc9971b53e29b36a80e9e020ac61ac.1737391102.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <00dfc71569bc9971b53e29b36a80e9e020ac61ac.1737391102.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.01.2025 17:54, Oleksii Kurochko wrote:
> RISC-V doesn't have hardware feature to ask MMU to translate
> virtual address to physical address ( like Arm has, for example ),
> so software page table walking in implemented.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/include/asm/mm.h |  2 ++
>  xen/arch/riscv/pt.c             | 56 +++++++++++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
> 
> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
> index 292aa48fc1..d46018c132 100644
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -15,6 +15,8 @@
>  
>  extern vaddr_t directmap_virt_start;
>  
> +paddr_t pt_walk(vaddr_t va);

In the longer run, is returning just the PA really going to be sufficient?
If not, perhaps say a word on the limitation in the description.

> --- a/xen/arch/riscv/pt.c
> +++ b/xen/arch/riscv/pt.c
> @@ -274,6 +274,62 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
>      return rc;
>  }
>  
> +paddr_t pt_walk(vaddr_t va)
> +{
> +    const mfn_t root = get_root_page();
> +    /*
> +     * In pt_walk() only XEN_TALE_MAP_NONE and XEN_TABLE_SUPER_PAGE are

Nit: s/TALE/TABLE/ ?

> +     * handled ( as they are only possible for page table walking ), so

Nit: Blanks again inside parentheses in a comment.

> +     * initialize `ret` with "impossible" XEN_TABLE_MAP_NOMEM.
> +    */
> +    int ret = XEN_TABLE_MAP_NOMEM;
> +    unsigned int level = HYP_PT_ROOT_LEVEL;
> +    paddr_t pa = 0;

Seeing 0 as initializer here, just to double check: You do prevent MFN 0
to be handed to the page allocator, and you also don't use it "manually"
anywhere?

> +    pte_t *table;
> +
> +    DECLARE_OFFSETS(offsets, va);
> +
> +    table = map_table(root);
> +
> +    /*
> +     * Find `pa` of an entry which corresponds to `va` by iterating for each
> +     * page level and checking if the entry points to a next page table or
> +     * to a page.
> +     *
> +     * Two cases are possible:
> +     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was find;
> +     *   (Despite of the name) XEN_TABLE_SUPER_PAGE covers 4k mapping too.
> +     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
> +     *   mapped.
> +     */
> +    while ( (ret != XEN_TABLE_MAP_NONE) && (ret != XEN_TABLE_SUPER_PAGE) )
> +    {
> +        /*
> +         * This case shouldn't really occur as it will mean that for table
> +         * level 0 a pointer to next page table has been written, but at
> +         * level 0 it could be only a pointer to 4k page.
> +         */
> +        ASSERT(level <= HYP_PT_ROOT_LEVEL);
> +
> +        ret = pt_next_level(false, &table, offsets[level]);
> +        level--;
> +    }
> +
> +    if ( ret == XEN_TABLE_MAP_NONE )
> +        dprintk(XENLOG_WARNING, "Is va(%#lx) really mapped?\n", va);

Even if it's a dprintk(), I'd recommend against adding such.

> +    else if ( ret == XEN_TABLE_SUPER_PAGE )
> +        pa = pte_to_paddr(*(table + offsets[level + 1]));

Missing "else if ( ret == XEN_TABLE_NORMAL )" (or maybe simply "else")?

> +    /*
> +     * There is no need for unmap_table() after each pt_next_level() call as
> +     * pt_next_level() will do unmap_table() for the previous table before
> +     * returning next level table.
> +     */
> +    unmap_table(table);

I don't think the comment is needed. You map once before the loop, so it's
natural that you unmap once after.

> +    return pa;

Don't you want to OR in the low 12 bits of VA here (unless "pa" is still 0)?

Jan

