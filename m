Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7401A938F35
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 14:42:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761888.1171935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVsMt-0006AM-5p; Mon, 22 Jul 2024 12:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761888.1171935; Mon, 22 Jul 2024 12:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVsMt-000680-2d; Mon, 22 Jul 2024 12:42:19 +0000
Received: by outflank-mailman (input) for mailman id 761888;
 Mon, 22 Jul 2024 12:42:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVsMr-00066N-EM
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 12:42:17 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d39492f6-4827-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 14:42:16 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a77e2f51496so430970866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 05:42:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c785f31sm416374466b.30.2024.07.22.05.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 05:42:15 -0700 (PDT)
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
X-Inumbo-ID: d39492f6-4827-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721652136; x=1722256936; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cu5FYPa3xDXi8Co0MiMRV9ZwcRFK9Bx4tlWAmxNchAA=;
        b=Dx2a97Mdnnazfd0ORd7ocThoxES/HN3U0NK3IYKPeeAwHeEW8SIrgGchhaR5hl+wqm
         qfqS7G0UBHU5nfgUFlUdq9zyva9IDlqAuUJs/RiD9rOBt5SWqhnMlH1tLB3KMOaTkpbc
         5ZYtRIOQQpBIpvredZOBK4gAsOJKCGk2hYU0oEHci2AkuqjY236QzB0bL+TuvBo3kqD3
         Wk4/ESkEDqxND23SxPUTtvht0os0eseHAT3T21TfI8zHQBK1eN6SaaS+eoyf+Nm7sE+t
         w6bu5H4duj7Z/8JIhFxG8KvUIuKTUEIHNA1UPEH9t5fGjp9DQIUb88eegP5uG2cfnwaG
         AUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721652136; x=1722256936;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cu5FYPa3xDXi8Co0MiMRV9ZwcRFK9Bx4tlWAmxNchAA=;
        b=sS0tJhrOHXwyyUNHghLclACUP4VreftLYZI5qfWVEpyzJ/pHgEi0WILKVoZS4irsoI
         qSbIygOt8plpQ8+522xKKFGKiDjuM98Q4I3p1gFYbzUZH1+i9TEMaToOCjTPLE4gy5pd
         Fxzx0u8tnc/5N9HXl5T/tpHYt88gPMQde9GU7N5b1nZV4b7AUXh51/YVKnRfEdIi8opU
         GTHTfE7gT37WkItqX00X38rlYHaPtnNfB0qr76Skt1rpEHvfdyEWFK0pAV9daCRt9QQv
         uxHmWYzvN8DcLyH3q652LBQiWoyrLemsJTtdWUhh9URmEmPhl3/ZoEAEQzOOqHKc3s+J
         GLgg==
X-Forwarded-Encrypted: i=1; AJvYcCUi1BQ07iMHSh7MRoOO45ghD/65HSbplY3w5RY1a57eOQPxU8KzF/3AaWCqdyHABi49IpHg3YX65W5IglZvQ7Zqz6ojt5hdoUmtLRay1Gg=
X-Gm-Message-State: AOJu0Yzau6ikkHmcV3Aw4XGdzxFw5uhUCDP0niYBwhKymCjihSj7zol2
	UdSMmeb+i0ukA0VtuMPDJWxiThW+W7wauCF+lyel9djViPVxS8Vz9lzgAYSOSg==
X-Google-Smtp-Source: AGHT+IEIEcXXu13amj/sNql9hhkbADHp46yUR1y2USBO12JSj8ICivhHvOJBfH45LgBJP7+kbecAzA==
X-Received: by 2002:a17:906:d555:b0:a72:8a75:6559 with SMTP id a640c23a62f3a-a7a4c3f8f77mr416527666b.47.1721652135743;
        Mon, 22 Jul 2024 05:42:15 -0700 (PDT)
Message-ID: <16648c6c-416d-4205-8d16-38c006251bb9@suse.com>
Date: Mon, 22 Jul 2024 14:42:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] xen/riscv: setup fixmap mapping
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <b1776fb20603cb56b0aea17ef998ea951d2bbda9.1720799926.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b1776fb20603cb56b0aea17ef998ea951d2bbda9.1720799926.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2024 18:22, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -74,11 +74,20 @@
>  #error "unsupported RV_STAGE1_MODE"
>  #endif
>  
> +#define XEN_SIZE                MB(2)
> +#define XEN_VIRT_END            (XEN_VIRT_START + XEN_SIZE)
> +
> +#define BOOT_FDT_VIRT_START     XEN_VIRT_END
> +#define BOOT_FDT_VIRT_SIZE      MB(4)
> +
>  #define DIRECTMAP_SLOT_END      509
>  #define DIRECTMAP_SLOT_START    200
>  #define DIRECTMAP_VIRT_START    SLOTN(DIRECTMAP_SLOT_START)
>  #define DIRECTMAP_SIZE          (SLOTN(DIRECTMAP_SLOT_END) - SLOTN(DIRECTMAP_SLOT_START))
>  
> +#define FIXMAP_BASE             (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
> +#define FIXMAP_ADDR(n)          (FIXMAP_BASE + (n) * PAGE_SIZE)

Why exactly do you insert this here, and not adjacent to BOOT_FDT_VIRT_*,
which it actually is adjacent with? Then ...

>  #define FRAMETABLE_SCALE_FACTOR  (PAGE_SIZE/sizeof(struct page_info))
>  #define FRAMETABLE_SIZE_IN_SLOTS (((DIRECTMAP_SIZE / SLOTN(1)) / FRAMETABLE_SCALE_FACTOR) + 1)

... this would also stay next to DIRECTMAP_*, which it uses.

> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -81,6 +81,13 @@ static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
>      BUG_ON("unimplemented");
>  }
>  
> +/* Write a pagetable entry. */
> +static inline void write_pte(pte_t *p, pte_t pte)
> +{
> +    *p = pte;
> +    asm volatile ("sfence.vma");

When they don't have operands, asm()-s are volatile anyway (being explicit
about this may still be desirable, yes). But: Can you get away without
operands here? Don't you need a memory clobber for the fence to actually
remain where it is needed?

Also, nit (style): Blanks missing.

> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -49,6 +49,9 @@ stage1_pgtbl_root[PAGETABLE_ENTRIES];
>  pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>  stage1_pgtbl_nonroot[PGTBL_INITIAL_COUNT * PAGETABLE_ENTRIES];
>  
> +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> +xen_fixmap[PAGETABLE_ENTRIES];

Any reason this cannot be static?

Jan

