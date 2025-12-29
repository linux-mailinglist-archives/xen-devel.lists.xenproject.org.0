Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C76ACE72D4
	for <lists+xen-devel@lfdr.de>; Mon, 29 Dec 2025 16:13:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194091.1512581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaEvt-0000Zt-A0; Mon, 29 Dec 2025 15:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194091.1512581; Mon, 29 Dec 2025 15:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaEvt-0000XC-7M; Mon, 29 Dec 2025 15:13:17 +0000
Received: by outflank-mailman (input) for mailman id 1194091;
 Mon, 29 Dec 2025 15:13:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PeLl=7D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vaEvs-0000X4-0J
 for xen-devel@lists.xenproject.org; Mon, 29 Dec 2025 15:13:16 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e55ef9c3-e4c8-11f0-b15c-2bf370ae4941;
 Mon, 29 Dec 2025 16:13:14 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47d1d8a49f5so43683295e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Dec 2025 07:13:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be273e4d5sm601847255e9.6.2025.12.29.07.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 07:13:13 -0800 (PST)
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
X-Inumbo-ID: e55ef9c3-e4c8-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767021193; x=1767625993; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cEMNAZJfg4M6BLD1chz6Ll2NrohFfZ5xUwnF0tVr3P8=;
        b=C6uBlLf6QJvjSti1ne9t3Kb+5Dx+0igsDJAwEV2f8VZAAnNF+HGC0mWqKrf94YzXki
         gCIelHvyRfce7UKK28FRLb4iynwjvhLVHmkwMWCsoNRAjQDLoiBADOw6Kg7A8kG+2bxx
         4evu6I4rJt1vjF9Ibus3jQ0ClhYTiB+IU4F/yw6WZr6DrhoMV6OgbSgrgz/WwAh0cwKO
         CGm4Q4pA3/DTM8g76Yvz5eWjxLR6rYGlpw77zDMDtHDF954TBqVntrqjb00b3aoxx4J1
         pDHMMN3kdxRKIxPXHlN3dagqne9KwsUYKm/mPKCoEhZusH8Bu2XclzwoKUSPR+xvDkEy
         ZTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767021194; x=1767625994;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEMNAZJfg4M6BLD1chz6Ll2NrohFfZ5xUwnF0tVr3P8=;
        b=QOyflxBaSTlab3uQe3Bt1Cp8rmgA7GaWJ4UXOZ2e5B8DWgaZzeFGjC/v45ycLBN45Y
         ptcvd2HF/Hb9YAo0llKBICj6FctCP+SSGAzvNfhwI1v1jS+uS60xhALMJkkkViJaiAUb
         zH1CWaPwB1Zk1y2zLURTi+4XMPSyTQEmS+I3u8zQBgG3Y+nPGfXPkVN+xXwXrx6ehwYR
         mkejjDf7ydangBZsm+rCS9eWBwy4+HeIujKft2ycZZCq8G+PdPSLUmNyoEUjLATaDoJ8
         5+aYMXOFMrEibs8JWgZ9yP3/+c6FoZAmTq926VrU2OQZt2UxEddDjFoU5eAQgJxQGAUs
         KqQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd1aSVb0tjCOwI0q+/r2WFQl8dQuXQ2Y1Uo57Tp286lkZzh2xbQ2NnYLC8GnYwjQRm83jropn3zcw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlGWnI6Z9hvTOW/soS/S05gmOtYQhm7EF5PMSg9ckjFibVPTlY
	hP5WxepvKL+MMcRp9RSL4OnFIkOI+1/hqEei+y7TjtsIggA71OQTQa2ZMMjy999Hwg==
X-Gm-Gg: AY/fxX6oQGZZCZhLN0ZWVrUVV493AOMuTzE8nOl+cfsPLSdU931XwKyaeqQpRomDVU4
	JPmIjy5kEl29PO5C4xRrjAcGSnsfwZhAhwVEo6BIpaMuBPDGL48yJw49mol9eZvlANe7BVYohQc
	GOA+5H5HY7weAgrtj9U+RE34oPnoA8DDIcArMV/9xuIm9nJgHOSIG3JNd2sICMLf6ZCBzDH9bxd
	ei3eOypbG3nt66NP7UZXNsdkJ4pIOedR/BAmHahnr/hZKVEzwCEefKP0kIF7tgU/aQhwfArJu00
	AZM7vYuEkhF+bewXlVNb71O/eN4+6PMOy7VV9JB9YcCzI1zMPw5floWwaZUrx1rbvCZeH1DaVAN
	5pusLGCM+lbqafFjh8K2yXlBbXTqZO2aJlvj5jxSXv1RL3KyzZW2NBBfmSA20wVyLznQzGwQOom
	SQyAFhAy74hTjbvwoF9cj4v6ugL+3mAS9fmg04N/StFpHdiHHlKBvQhi9S6G67WmMy6E2cBf2AJ
	qU=
X-Google-Smtp-Source: AGHT+IEQQor23baGQpqgmj00MRK4HFtA48l2g20WC6VPZZV0WoL4ka1/1COdDqZVelsSsUeruESk9Q==
X-Received: by 2002:a05:600c:45cf:b0:47a:7fdd:2906 with SMTP id 5b1f17b1804b1-47d1954a550mr348010855e9.12.1767021193568;
        Mon, 29 Dec 2025 07:13:13 -0800 (PST)
Message-ID: <0a4fb29a-a0b5-4e20-91c4-425702677d11@suse.com>
Date: Mon, 29 Dec 2025 16:13:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] xen/riscv: introduce metadata table to store P2M
 type
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766406895.git.oleksii.kurochko@gmail.com>
 <127d893e3b6a0da1195f9a128c8d0591e6ef473d.1766406895.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <127d893e3b6a0da1195f9a128c8d0591e6ef473d.1766406895.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.12.2025 17:37, Oleksii Kurochko wrote:
> @@ -370,24 +396,96 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
>      return pg;
>  }
>  
> -static int p2m_set_type(pte_t *pte, p2m_type_t t)
> +/*
> + * `pte` – PTE entry for which the type `t` will be stored.
> + *
> + * If `t` >= p2m_first_external, a valid `ctx` must be provided.
> + */
> +static void p2m_set_type(pte_t *pte, p2m_type_t t,
> +                         const struct p2m_pte_ctx *ctx)
>  {
> -    int rc = 0;
> +    struct page_info **md_pg;
> +    struct md_t *metadata = NULL;
>  
> -    if ( t > p2m_first_external )
> -        panic("unimplemeted\n");
> -    else
> -        pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
> +    /*
> +     * It is sufficient to compare ctx->index with PAGETABLE_ENTRIES because,
> +     * even for the p2m root page table (which is a 16 KB page allocated as
> +     * four 4 KB pages), calc_offset() guarantees that the page-table index
> +     * will always fall within the range [0, 511].
> +     */
> +    ASSERT(ctx && ctx->index < PAGETABLE_ENTRIES);
>  
> -    return rc;
> +    /*
> +     * At the moment, p2m_get_root_pointer() returns one of four possible p2m
> +     * root pages, so there is no need to search for the correct ->pt_page
> +     * here.
> +     * Non-root page tables are 4 KB pages, so simply using ->pt_page is
> +     * sufficient.
> +     */
> +    md_pg = &ctx->pt_page->v.md.pg;
> +
> +    if ( !*md_pg && (t >= p2m_first_external) )
> +    {
> +        /*
> +         * Since p2m_alloc_page() initializes an allocated page with
> +         * zeros, p2m_invalid is expected to have the value 0 as well.
> +         */
> +        BUILD_BUG_ON(p2m_invalid);
> +
> +        ASSERT(ctx->p2m);

I think I previously asked for this to be moved out of the if(). Else you
may not notice a caller side issue until a point where a metadata page
actually needs allocating. (This could simply be folded into the earlier
ASSERT().)

Jan

