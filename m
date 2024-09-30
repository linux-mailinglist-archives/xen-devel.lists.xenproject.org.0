Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B33698A86F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:30:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807494.1218996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svILr-0004UI-3N; Mon, 30 Sep 2024 15:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807494.1218996; Mon, 30 Sep 2024 15:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svILr-0004Se-0L; Mon, 30 Sep 2024 15:30:19 +0000
Received: by outflank-mailman (input) for mailman id 807494;
 Mon, 30 Sep 2024 15:30:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svILp-0004SY-CM
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:30:17 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e49ff08e-7f40-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 17:30:16 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42cc43454d5so33069235e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:30:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e969ddb1fsm153650515e9.3.2024.09.30.08.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 08:30:15 -0700 (PDT)
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
X-Inumbo-ID: e49ff08e-7f40-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727710216; x=1728315016; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xyd1WporG4UxZK2qiBa0vPNozi7QlBf54JuEadnuw+M=;
        b=dKoBz1jcr0xDi/K60iNfLHp4oOXQDMur+/oA2wfDfnJ8pX90WgiB+j7V7GajhChvSH
         j07+UOsMdkZq7I10nPRxgweUaBQ626GZnpvWS2DfAjGqCEsJmKtAxuu4ljK5T2UpCAmU
         H8PBTKF4iMvSc96SLdTHzPw2jE5odhF0yn0ZhGrXDGA2AfKJtbC/dtviR7L2RUx6pA4U
         tib/kZtf+bgsCTfj7ni/UjDtiKVg6tiAiYv1QxXybDpzYVMmX8hZp3LjHTSMiEuRK1Y/
         YO/Ymkcjk9AFLzMRSvRSHgL3xp6VvaxVwJgXXjKxp5Pfde6q146Upy2kJ9PsHimSpIPB
         oJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727710216; x=1728315016;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyd1WporG4UxZK2qiBa0vPNozi7QlBf54JuEadnuw+M=;
        b=cer24Xm0lq7Y5GRa1d8FCK0WfJfUaOYTL6bX1KvhGgMazhx7V6TfZ8rkdpoA8adf11
         JRwm1JGP/xbaJfS9NDb5s0h9BPJB7yDw1H1tsE/BxflkHYyoq+JqZV7Fap9RUgAENjvp
         /o6nIOyWkxiq/ifMDmwErM3u+QXzGTzyDtnehfEGpC9BmLrZ2FPQpm8ExmqUvJtVVIeh
         cjXvQnCP6+EagiQiD2dykVkC9Sz5lt1mtYICJIJNQXkUwuEno7QztJ6tYxNQyxaZ0qBk
         5L3zuLSG8Dkiwoan13y11TqKqRbOstxm3HW1gVuUMxl0S3rnzzfocsdeLTScx1wskda3
         b4Mw==
X-Forwarded-Encrypted: i=1; AJvYcCW4n7n0APTZ5dZHb4EFEphVEFS0ErklvPKblJOAy3YD6Rg+1mmt5r90qSdJvtny/3o67+fbtGBQ1Vg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/d3POs3fPI042yXL4MZZwnXD7YZ67YwXSSOR2gDozZAMO/J1g
	Fc6Y2BC2mMfZhUzmx0NAplnTvQ5JFE5dDMgcl6i1e7TMLVyjQ0zhfiVG3idqMw==
X-Google-Smtp-Source: AGHT+IFUs73h5X0vBKLW7KZldPIex4iow/SAEw9Oy24EK5VGkQyeguX9Nit2v3r4zTb05iLM4q1Rrg==
X-Received: by 2002:a05:600c:1d8a:b0:426:593c:935d with SMTP id 5b1f17b1804b1-42f58409f9dmr88816035e9.5.1727710215712;
        Mon, 30 Sep 2024 08:30:15 -0700 (PDT)
Message-ID: <1fabd6e5-4c90-4415-8748-bab53145c1a3@suse.com>
Date: Mon, 30 Sep 2024 17:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/7] xen/riscv: page table handling
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1727449154.git.oleksii.kurochko@gmail.com>
 <ead52f68ce47d55a78e2062aa4ef4d8675258091.1727449154.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ead52f68ce47d55a78e2062aa4ef4d8675258091.1727449154.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.09.2024 18:33, Oleksii Kurochko wrote:
> +static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned int flags)
> +{
> +    /* Sanity check when modifying an entry. */
> +    if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID_MFN) )
> +    {
> +        /* We don't allow modifying an invalid entry. */
> +        if ( !pte_is_valid(entry) )
> +        {
> +            dprintk(XENLOG_ERR, "Modifying invalid entry is not allowed\n");
> +            return false;
> +        }
> +
> +        /* We don't allow modifying a table entry */
> +        if ( pte_is_table(entry) )
> +        {
> +            dprintk(XENLOG_ERR, "Modifying a table entry is not allowed\n");
> +            return false;
> +        }
> +    }
> +    /* Sanity check when inserting a mapping */
> +    else if ( flags & PTE_VALID )
> +    {
> +        /*
> +         * We don't allow replacing any valid entry.
> +         *
> +         * Note that the function pt_update() relies on this
> +         * assumption and will skip the TLB flush (when Svvptc
> +         * extension will be ratified). The function will need
> +         * to be updated if the check is relaxed.
> +         */
> +        if ( pte_is_valid(entry) )
> +        {
> +            if ( pte_is_mapping(entry) )
> +                dprintk(XENLOG_ERR, "Changing MFN for valid PTE is not allowed (%#"PRI_mfn" -> %#"PRI_mfn")\n",
> +                       mfn_x(mfn_from_pte(entry)), mfn_x(mfn));

Nit: Indentation is now off by one.

> +#define XEN_TABLE_MAP_NONE 0
> +#define XEN_TABLE_MAP_NOMEM 1
> +#define XEN_TABLE_SUPER_PAGE 2
> +#define XEN_TABLE_NORMAL 3
> +
> +/*
> + * Take the currently mapped table, find the corresponding entry,
> + * and map the next table, if available.
> + *
> + * The alloc_tbl parameters indicates whether intermediate tables should
> + * be allocated when not present.
> + *
> + * Return values:
> + *  XEN_TABLE_MAP_FAILED: Either alloc_only was set and the entry
> + *  was empty, or allocating a new page failed.
> + *  XEN_TABLE_NORMAL: next level or leaf mapped normally
> + *  XEN_TABLE_SUPER_PAGE: The next entry points to a superpage.

This part of the comment is now stale.

> + */
> +static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
> +{
> +    pte_t *entry;
> +    mfn_t mfn;
> +
> +    entry = *table + offset;
> +
> +    if ( !pte_is_valid(*entry) )
> +    {
> +        if ( !alloc_tbl )
> +            return XEN_TABLE_MAP_NONE;
> +
> +        if ( create_table(entry) )
> +            return XEN_TABLE_MAP_NOMEM;

At the risk of being overly picky: You still lose -ENOMEM here. I'd suggest
to make create_table() return boolean (success / fail) to eliminate that
concern. Any hypothetical plan for someone to add another error code there
will then hit the return type aspect, pointing out that call sites need
looking at for such a change to be correct.

Jan

