Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C7D838D7B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 12:33:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670391.1043132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSF1P-0000MR-8X; Tue, 23 Jan 2024 11:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670391.1043132; Tue, 23 Jan 2024 11:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSF1P-0000Kk-5k; Tue, 23 Jan 2024 11:32:51 +0000
Received: by outflank-mailman (input) for mailman id 670391;
 Tue, 23 Jan 2024 11:32:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSF1N-0000Hy-AP
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 11:32:49 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21988d86-b9e3-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 12:32:46 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50eaa8b447bso4526101e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 03:32:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bf7-20020a056e02308700b0036276f84d46sm1868240ilb.23.2024.01.23.03.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 03:32:45 -0800 (PST)
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
X-Inumbo-ID: 21988d86-b9e3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706009566; x=1706614366; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HgRhZcxI50mxvrzi+a46dIBBGImG0UkGU3Dy6uBtnRw=;
        b=VnKL0fGW8DAUVPQYHO2n0oaFSWKKON0UPYmAQH+CABjpjMZYwAGAhZPxqxyIzf7jBH
         iA8+VJPnQkOcujnpp2s+klnR/weXeg1eYtpI4EhA+VAp+eXOS//fxNRc/QAxMUYe8Ib6
         OwJ2AaRiRcAwXJQh41UoAuT8+bjD7Jtj9d4hByoyOAWbaX1JDpCFJVdC/ebkUM3prKL9
         m2STmNNGghPW5x02SfssYvkfrcoYXaVJwtwR1gwbB9Cb/VY7W1y3vhd8kQIBEq3athvP
         VEnreOFQwT+0jWldYJ6QYBEXgugENqcHMi7EGVzmODSR5TYIN9gsn4cBWvjaYhy/dAOu
         EMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706009566; x=1706614366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HgRhZcxI50mxvrzi+a46dIBBGImG0UkGU3Dy6uBtnRw=;
        b=DrREHbkgcj35D/pIU7/JfVkgQYwGbIZojFPS5gMWGbMId4EmC5wMpzGOKXNMolzmig
         HQrxibihnY6eCzFo95cqf5CVV4C1ae75mh0ed/zSODWpxDclHKsDCj7IlMOmMgOGEqfB
         1pysF3Pm9086k0tb14EqrAXcvo1J+adI6xjS3Ffcj62wml4Di6H3dlMeyiDbbxmrQ9g6
         0N/8MAB1BG5VHA6BEsTPj7qjvvZcJuaYYcDS39l8MnybIQfnBk6MaZG+3CthsQHbJTbP
         YsQN3EtWSZRYrdhMROWDc1F1skVhWw6xgyiWW+Z48F8LAmVEzMrvaOTuG60rL5hWbzcc
         dXNw==
X-Gm-Message-State: AOJu0Yz9XwjU2ZLneDLsdmmwFxlSx1u34sVnF56Or7CHAcrD1UybL6uY
	3NyIyJbeC13Qxzii4UjHdWpKp6cL0YHreu4ynYv1He4m3CbaVHBi6RwMc0MSyg==
X-Google-Smtp-Source: AGHT+IGw5hCFeKJ3I15NaOIjvTQHVKO4VDU8XoveTeI7t2uEa8ijajFGWnP6m9HtZbUEm6WSmbjaEA==
X-Received: by 2002:a05:6512:15a4:b0:50e:4fcb:dc28 with SMTP id bp36-20020a05651215a400b0050e4fcbdc28mr1611581lfb.35.1706009566337;
        Tue, 23 Jan 2024 03:32:46 -0800 (PST)
Message-ID: <39837f92-d139-49c3-9e5f-a79dd585f050@suse.com>
Date: Tue, 23 Jan 2024 12:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 27/34] xen/riscv: define an address of frame table
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <d0a357e3b9597479b539e88915731b3f15489c04.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d0a357e3b9597479b539e88915731b3f15489c04.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:13, Oleksii Kurochko wrote:
> Also, the patch adds some helpful macros that assist in avoiding
> the redefinition of memory layout for each MMU mode.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V3:
>  - drop OFFSET_BITS, and use PAGE_SHIFT instead.
>  - code style fixes.
>  - add comment how macros are useful.
>  - move all memory related layout definitions close to comment with memory layout description.
>  - make memory layout description generic for any MMU mode.
> ---
> Changes in V2:
>  - Nothing changed. Only rebase.
> ---
>  xen/arch/riscv/include/asm/config.h | 85 +++++++++++++++++++----------
>  1 file changed, 55 insertions(+), 30 deletions(-)
> 
> diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
> index f0544c6a20..fb9fc9daaa 100644
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -6,6 +6,14 @@
>  #include <xen/const.h>
>  #include <xen/page-size.h>
>  
> +#ifdef CONFIG_RISCV_64
> +#define CONFIG_PAGING_LEVELS 3
> +#define RV_STAGE1_MODE SATP_MODE_SV39
> +#else
> +#define CONFIG_PAGING_LEVELS 2
> +#define RV_STAGE1_MODE SATP_MODE_SV32
> +#endif
> +
>  /*
>   * RISC-V64 Layout:
>   *
> @@ -22,25 +30,56 @@
>   *
>   * It means that:
>   *   top VA bits are simply ignored for the purpose of translating to PA.
> +#endif
>   *
> - * ============================================================================
> - *    Start addr    |   End addr        |  Size  | Slot       |area description
> - * ============================================================================
> - * FFFFFFFFC0800000 |  FFFFFFFFFFFFFFFF |1016 MB | L2 511     | Unused
> - * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | L2 511     | Fixmap
> - * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | L2 511     | FDT
> - * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | L2 511     | Xen
> - *                 ...                  |  1 GB  | L2 510     | Unused
> - * 0000003200000000 |  0000007F80000000 | 309 GB | L2 200-509 | Direct map
> - *                 ...                  |  1 GB  | L2 199     | Unused
> - * 0000003100000000 |  00000031C0000000 |  3 GB  | L2 196-198 | Frametable
> - *                 ...                  |  1 GB  | L2 195     | Unused
> - * 0000003080000000 |  00000030C0000000 |  1 GB  | L2 194     | VMAP
> - *                 ...                  | 194 GB | L2 0 - 193 | Unused
> - * ============================================================================
> + *       SATP_MODE_SV32   | SATP_MODE_SV39   | SATP_MODE_SV48   | SATP_MODE_SV57
> + *      ==================|==================|==================|=================
> + * BA0 | FFFFFFFFFFE00000 | FFFFFFFFC0000000 | FFFFFF8000000000 | FFFF000000000000
> + * BA1 | 0000000019000000 | 0000003200000000 | 0000640000000000 | 00C8000000000000
> + * BA2 | 0000000018800000 | 0000003100000000 | 0000620000000000 | 00C4000000000000
> + * BA3 | 0000000018400000 | 0000003080000000 | 0000610000000000 | 00C2000000000000
>   *
> -#endif
> + * ===============================================================================
> + * Start addr     |   End addr          |  Size  | Root PT slot | Area description
> + * ===============================================================================
> + * BA0 + 0x800000 |  FFFFFFFFFFFFFFFF   |1016 MB |     511      | Unused
> + * BA0 + 0x400000 |  BA0 + 0x800000     |  2 MB  |     511      | Fixmap
> + * BA0 + 0x200000 |  BA0 + 0x400000     |  4 MB  |     511      | FDT
> + * BA0            |  BA0 + 0x200000     |  2 MB  |     511      | Xen
> + *                 ...                  |  1 GB  |     510      | Unused
> + * BA1 + 0x000000 |  BA1 + 0x4D80000000 | 309 GB |   200-509    | Direct map

This definitely can't be right for SV32. Others may be problematic,
too, like ...

> + *                 ...                  |  1 GB  |     199      | Unused
> + * BA2 + 0x000000 |  BA2 + 0xC0000000   |  3 GB  |   196-198    | Frametable

... this one. Otoh I'd expect both to potentially be much larger in
SV48 and SV57 modes.

> + *                 ...                  |  1 GB  |     195      | Unused
> + * BA3 + 0x000000 |  BA3 + 0x40000000   |  1 GB  |     194      | VMAP
> + *                 ...                  | 194 GB |   0 - 193    | Unused
> + * ===============================================================================
>   */
> +#define VPN_BITS    (9)

This need to move ...

> +#define HYP_PT_ROOT_LEVEL (CONFIG_PAGING_LEVELS - 1)
> +
> +#ifdef CONFIG_RISCV_64

... here, I think, for not being applicable to SV32?

> +#define SLOTN_ENTRY_BITS        (HYP_PT_ROOT_LEVEL * VPN_BITS + PAGE_SHIFT)
> +#define SLOTN(slot)             (_AT(vaddr_t, slot) << SLOTN_ENTRY_BITS)
> +#define SLOTN_ENTRY_SIZE        SLOTN(1)

Do you have any example of how/where this going to be used?

> +#define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1 - GB(1)) */

Won't /* -GB(1) */ do, thus allowing the line to also be padded such that
it matches neighboring ones in layout?

Jan

> +#define FRAMETABLE_VIRT_START   SLOTN(196)
> +#define FRAMETABLE_SIZE         GB(3)
> +#define FRAMETABLE_NR           (FRAMETABLE_SIZE / sizeof(*frame_table))
> +#define FRAMETABLE_VIRT_END     (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
> +
> +#define VMAP_VIRT_START         SLOTN(194)
> +#define VMAP_VIRT_SIZE          GB(1)
>[...]


