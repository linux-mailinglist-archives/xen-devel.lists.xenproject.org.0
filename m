Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0450CC478B5
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 16:30:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158452.1486809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vITpu-0008T8-8e; Mon, 10 Nov 2025 15:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158452.1486809; Mon, 10 Nov 2025 15:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vITpu-0008Qw-5p; Mon, 10 Nov 2025 15:29:42 +0000
Received: by outflank-mailman (input) for mailman id 1158452;
 Mon, 10 Nov 2025 15:29:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vITpt-0008Qq-3U
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 15:29:41 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11f3823f-be4a-11f0-980a-7dc792cee155;
 Mon, 10 Nov 2025 16:29:38 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-640ace5f283so3849896a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 07:29:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f6780b7sm11604534a12.0.2025.11.10.07.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 07:29:37 -0800 (PST)
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
X-Inumbo-ID: 11f3823f-be4a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762788578; x=1763393378; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O5pYIZhbo7pLnFAv55ABo3MihsiXamJgbeGRbEuDLt4=;
        b=Y82uhdIqp2awIucIWz1LRolNZmeg0qJb31sS54vHtbGVOth89mAbryFnuho63gNUK7
         XtanEJf0SI+hAedTADZutRU3SnBAtCLyX7chpp0LMWJvObYJ2IIVmuiG8EMKEfP8qxW2
         hwbTgL50Dst3U5xaKxBMOHHjkQd4yuZxABVlLX4CBjzEkdkrPz+2mxhy26POY4v9KGfE
         +toPNshCdEXFAhFSl63nFeBe7ORoJfQBIomgo4LsXNwu51szZCe7X6M3nev3YSph1nRS
         qgmXKMfw9QGeajWVuroQkmCusvLj8ruxtmT0eHtN49pR1QVAa690ggL4gHoIygbQB58a
         67Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762788578; x=1763393378;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5pYIZhbo7pLnFAv55ABo3MihsiXamJgbeGRbEuDLt4=;
        b=dJSAkhyVGhkoWXrOnr97B/GwFgKtBXsJxviTFFqiY0Ea4LiBtvfWKkBsU3+Dr+EFaR
         dgiV2bbS7QoPDlM9i2lNC9jrsanFfeXymNnXHpdCceQiltZqO639BkGgUDWnDMeWDRjP
         farQH6DTZZPVs4FqCvXzW7bCoUD5uwH3mDmpmfuottOsIJjrYfonU3n2b1jhKjhE2IsY
         syyzFcX3p7isRfiy95X8ta4v57RYZDUUXdRQW2FL5ljTANvTMcSxN48Mqq3Zw8orlBg3
         NCHJAKL1+pKs84HbJAFBk4cEurzmWKaZBc8cGS55d8F3TI5G3ReBLwahDtDZpulptrD2
         S+MA==
X-Forwarded-Encrypted: i=1; AJvYcCVyCWj6lXiLcnF+bUpBjfphreFfd6ZTw16Wp7ZwgggpbzeT/k/exT4LnA+9QiGM8O/UtoTDubaUEGc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywDWronE/Yfp4tFBaS+GV4Y1HuquNffYJW6l7PbeJXkYLlCmA8
	TGQSmxKO2YqcTOD2HcCDsQgTYRDnCotm3SXQ5AiXoxKUSl/m641MpDmVS6gi8jCfuw==
X-Gm-Gg: ASbGnctme/FtakQeR6DJKuFbCgMIV1/QEw/lpQI9UFB9AhNciJ8nHpi0JXsuAiHkS05
	1wP7DQ7Dmzp+hdMfbhibwYFiqwy2NXCKgUyl1JuDTW+MBzrReuBgilkKhZUqH5hEqsRvpxxQMRY
	DnOGGz0MQle2sMeUq0L/vCcdJgl2Yi/MtwHb61ZEi55HEVTAbFYla5exXIGnx66n41XNyfBhDDJ
	c/5sprtebUaFeXVpGfDmQD16qkK47d1Nv3wRbkrFgB69HODlbX438wmKoSi/yVGRiz0hCB/eaZc
	ZParnBSo5rsrMzrWvJmUu/D/s/rsjMhIeR3t0vjwpgE7T1sYMKB2WubA1Wesv4mPPLm6T0EtBOM
	xuKCdBGzMbkpEBVp6pb8ORDG1CaPdzD1cZk08uuBAQ/yhM/Tb+t1LZ9sXSIFPfBf2IbQpR7MMkf
	REe8P9sfLSec125UFJ1l09aqbDJ5/WqsrQEo5NYDfm3i3iqVqiYXlbcppxEyW5QCX3Mjm6su/J8
	Ik=
X-Google-Smtp-Source: AGHT+IH/4zhIB2uMBG2OnoWRdrqhwu+IHpi7OSeKRePgsK8ctr4xguPgxqqHF2HVGhTDGscue+MbIw==
X-Received: by 2002:a05:6402:51cd:b0:641:1f22:fc68 with SMTP id 4fb4d7f45d1cf-6415e6efc9bmr7671037a12.24.1762788578094;
        Mon, 10 Nov 2025 07:29:38 -0800 (PST)
Message-ID: <acf32e9d-4c07-45dd-baac-29e6d93cff56@suse.com>
Date: Mon, 10 Nov 2025 16:29:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 11/18] xen/riscv: Implement p2m_free_subtree() and
 related helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <24928a25f63f81ee72b78830306881b2c4c5a1e4.1760974017.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <24928a25f63f81ee72b78830306881b2c4c5a1e4.1760974017.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.10.2025 17:57, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -110,6 +110,8 @@ typedef enum {
>      p2m_mmio_direct_io, /* Read/write mapping of genuine Device MMIO area,
>                             PTE_PBMT_IO will be used for such mappings */
>      p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
> +    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
> +    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
>  
>      /* Sentinel — not a real type, just a marker for comparison */
>      p2m_first_external = p2m_ext_storage,
> @@ -120,15 +122,28 @@ static inline p2m_type_t arch_dt_passthrough_p2m_type(void)
>      return p2m_mmio_direct_io;
>  }
>  
> +/*
> + * Bits 8 and 9 are reserved for use by supervisor software;
> + * the implementation shall ignore this field.
> + * We are going to use to save in these bits frequently used types to avoid
> + * get/set of a type from radix tree.
> + */
> +#define P2M_TYPE_PTE_BITS_MASK  0x300

Better use PTE_RSW in place of the raw number?

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -17,6 +17,8 @@
>  #include <asm/riscv_encoding.h>
>  #include <asm/vmid.h>
>  
> +#define P2M_SUPPORTED_LEVEL_MAPPING 2

I fear without a comment it's left unclear what this is / represents.

> @@ -403,11 +415,147 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>      return P2M_TABLE_MAP_NONE;
>  }
>  
> +static void p2m_put_foreign_page(struct page_info *pg)
> +{
> +    /*
> +     * It’s safe to call put_page() here because arch_flush_tlb_mask()
> +     * will be invoked if the page is reallocated, which will trigger a
> +     * flush of the guest TLBs.
> +     */
> +    put_page(pg);
> +}
> +
> +/* Put any references on the single 4K page referenced by mfn. */

To me this and ...

> +static void p2m_put_4k_page(mfn_t mfn, p2m_type_t type)
> +{
> +    /* TODO: Handle other p2m types */
> +
> +    if ( p2m_is_foreign(type) )
> +    {
> +        ASSERT(mfn_valid(mfn));
> +        p2m_put_foreign_page(mfn_to_page(mfn));
> +    }
> +}
> +
> +/* Put any references on the superpage referenced by mfn. */

... to a lesser degree this comment are potentially misleading. Down here at
least there is something plural-ish (the 4k pages that the 2M one consists
of), but especially for the single page case above "any" could easily mean
"anything that's still outstanding, anywhere". I'm also not quite sure "on"
is really what you mean (I'm not a native speaker, so my gut feeling may be
wrong here).

> +static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
> +{
> +    struct page_info *pg;
> +    unsigned int i;
> +
> +    /*
> +     * TODO: Handle other p2m types, but be aware that any changes to handle
> +     * different types should require an update on the relinquish code to
> +     * handle preemption.
> +     */

I guess if I was to address this TODO, I wouldn't know what the latter part
of the sentence is warning me of.

> +    if ( !p2m_is_foreign(type) )
> +        return;

Are super-page foreign mappings actually intended to be permitted, conceptually?

>  /* Free pte sub-tree behind an entry */
>  static void p2m_free_subtree(struct p2m_domain *p2m,
>                               pte_t entry, unsigned int level)
>  {
> -    panic("%s: hasn't been implemented yet\n", __func__);
> +    unsigned int i;
> +    pte_t *table;
> +    mfn_t mfn;
> +    struct page_info *pg;
> +
> +    /*
> +     * Check if the level is valid: only 4K - 2M - 1G mappings are supported.
> +     * To support levels > 2, the implementation of p2m_free_subtree() would
> +     * need to be updated, as the current recursive approach could consume
> +     * excessive time and memory.
> +     */
> +    ASSERT(level <= P2M_SUPPORTED_LEVEL_MAPPING);
> +
> +    /* Nothing to do if the entry is invalid. */
> +    if ( !pte_is_valid(entry) )
> +        return;
> +
> +    if ( (level == 0) || pte_is_superpage(entry, level) )

Considering what pte_is_superpage() expands to, simply pte_is_mapping()?

> +    {
> +        p2m_type_t p2mt = p2m_get_type(entry);
> +
> +#ifdef CONFIG_IOREQ_SERVER
> +        /*
> +         * If this gets called then either the entry was replaced by an entry
> +         * with a different base (valid case) or the shattering of a superpage
> +         * has failed (error case).
> +         * So, at worst, the spurious mapcache invalidation might be sent.
> +         */
> +        if ( p2m_is_ram(p2mt) &&
> +             domain_has_ioreq_server(p2m->domain) )
> +            ioreq_request_mapcache_invalidate(p2m->domain);
> +#endif
> +
> +        p2m_put_page(entry, level, p2mt);
> +
> +        return;
> +    }
> +
> +    table = map_domain_page(pte_get_mfn(entry));
> +    for ( i = 0; i < P2M_PAGETABLE_ENTRIES(level); i++ )
> +        p2m_free_subtree(p2m, table[i], level - 1);
> +
> +    unmap_domain_page(table);

Please can the use of blank lines in such cases be symmetric: Either have them
ahead of and after the loop, or have them nowhere?

> @@ -435,7 +583,7 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>       * Check if the level target is valid: we only support
>       * 4K - 2M - 1G mapping.
>       */
> -    ASSERT(target <= 2);
> +    ASSERT(target <= P2M_SUPPORTED_LEVEL_MAPPING);

Ah, this is where that constant comes into play. It wants moving to the earlier
patch, and with this being the purpose I guess it also wants to include MAX in
its name.

Jan

