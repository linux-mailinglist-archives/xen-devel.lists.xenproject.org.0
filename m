Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9795A2F39C
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 17:32:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884905.1294651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thWi3-0005Lb-Sj; Mon, 10 Feb 2025 16:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884905.1294651; Mon, 10 Feb 2025 16:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thWi3-0005Je-Pb; Mon, 10 Feb 2025 16:32:35 +0000
Received: by outflank-mailman (input) for mailman id 884905;
 Mon, 10 Feb 2025 16:32:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thWi2-0005JY-Ek
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 16:32:34 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0a5aa52-e7cc-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 17:32:32 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ab7430e27b2so889725466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 08:32:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab773331db7sm892509466b.127.2025.02.10.08.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 08:32:31 -0800 (PST)
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
X-Inumbo-ID: a0a5aa52-e7cc-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739205152; x=1739809952; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ILtJcGf/Ax4SX3tVzVheEMRGX/5Koq6bGze/UyduLt8=;
        b=dkprSXd3iDaZYAJ0HxqZEcvMdRungNv9PDlvpcLPOtYzgEUz8zEyBbyS/YZAEk5HQM
         TFaOUjbsIaWO4iFJpEVjbK6Vz/J2lMxoQD4fn3SGhmX4iSk7+A5psUYY/UKjO8sBtz2O
         QvCLPeU68yyIF/iC3PlTY4EJi7za++Clf6R7/n54qSOkW+tByo+Sh6DAsUFYRwMrUVE0
         OC3nILesTPFT6gQCGQz5YQCuMCV27k0vflzTsDGi5ekMJrSGWun2Cz844IwoJvOujMw5
         CoJVd6bZzj2cP8b/8WfdPLH/Vqn1JizX20hSm0YdWL/0b+HbpXAjDuS6f6WEXyINFfQK
         D60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739205152; x=1739809952;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILtJcGf/Ax4SX3tVzVheEMRGX/5Koq6bGze/UyduLt8=;
        b=ViVeQukn/YG4kTAfBHRORxAetKlTc/YHGNpGth1CTSOXnSHkqgns2OmK4Nq9/zaYYE
         rbtTfYraj/0NzHfoXBbDWDHpOb5vIIA6EEJeHls4LaNwIstcdeu38u9NRv3vdx0vFwEl
         sfkmv9wXKEHbTg9RpjO4aOjYmhbdC/Ze2i9Uvbb9lUlA0F2FnJdS1qQEAfGavxeaLxue
         8AsCZMt75yVb2Xjc68UUrdb8Ct7sG2Oo6UccylHC+kVcu4PodZLmXzRSItMeUCR4ltlg
         ge71fvXgsIHKZrxIhHbudkanR47f3U7AzhoY7K9P2+NHtT3RfavktlgbRW4UiRY+sYjF
         1bGw==
X-Forwarded-Encrypted: i=1; AJvYcCUmpMKDDs/nFcWMeoa/FuuO/PR06t/H3L4Jv0fQG1cy9kSGD2dCOt5nFIAv6m4Cyan2gr0Jx/JQx+I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwL02WFdwiGreZylSKC3CTH9O3S2ulSVbWgQ3dIUnX+wgxRDhj8
	dWyNJC/5oUslZNMuVYouAq155U9w6gOY1a99qg/OgWz1JR8hD+OZVpfKBaG9Rw==
X-Gm-Gg: ASbGnctrokrMBxwbeQGw+ph8EEVpic9yF6Ri59xnpVQWS2CjHyaA59DrDVWeVb6cCyC
	LI5dC1ERBM11f3JMQRujnkon1n46NVNNS8HEoejiNcNaShcF0rxdYSpE6aOEj9+03f46XIzneIx
	qOqtmBlpIm220u+qnq1HMlMZhvrYMTcvDUAILjPwY/M10qmvjmeYpTig8U9U9VVkm7hjea6uUfP
	Ok7v3CGEf0d70CenT1UMunVId8BXrQLrdXioIX1Q+P/f2OaJxpMlpzgOn2rhU5/q9eUiyU97ihY
	1bXIWCznb3D1vFxuS9ubyIpcmtE96OY+B6o9tye6aDkvbFCQDxhfviMlt9bLRjmjv/S5OezE1J3
	N
X-Google-Smtp-Source: AGHT+IFfsYiUwjre33omaiaN/+NyrZ1S56jsKq7PJ1s0/aCvp1BeHcOG9jVa7sqrpqo8oVgmIIQkmg==
X-Received: by 2002:a17:907:c1b:b0:ab6:36fd:942a with SMTP id a640c23a62f3a-ab789c6cedbmr1560687566b.50.1739205152237;
        Mon, 10 Feb 2025 08:32:32 -0800 (PST)
Message-ID: <c6916159-d314-4121-b1aa-f5fd26bdb7b1@suse.com>
Date: Mon, 10 Feb 2025 17:32:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20? v3 1/3] xen/riscv: implement software page table
 walking
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1738933678.git.oleksii.kurochko@gmail.com>
 <e78679b00df63bde40eb3a4d97e3ab9d1faf9382.1738933678.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e78679b00df63bde40eb3a4d97e3ab9d1faf9382.1738933678.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2025 14:13, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/pt.c
> +++ b/xen/arch/riscv/pt.c
> @@ -185,6 +185,57 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
>      return XEN_TABLE_NORMAL;
>  }
>  
> +/*
> + * _pt_walk() performs software page table walking and returns the pte_t of
> + * a leaf node or the leaf-most not-present pte_t if no leaf node is found
> + * for further analysis.
> + * Additionally, _pt_walk() returns the level of the found pte.

That's optional, which I think wants expressing here.

> + */
> +static pte_t *_pt_walk(vaddr_t va, unsigned int *pte_level)
> +{
> +    const mfn_t root = get_root_page();
> +    unsigned int level;
> +    pte_t *table;
> +
> +    DECLARE_OFFSETS(offsets, va);
> +
> +    table = map_table(root);

This mapping operation doesn't look to have a counterpart. Aiui ...

> +    /*
> +     * Find `table` of an entry which corresponds to `va` by iterating for each
> +     * page level and checking if the entry points to a next page table or
> +     * to a page.
> +     *
> +     * Two cases are possible:
> +     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was found;
> +     *   (Despite the name) XEN_TABLE_SUPER_PAGE also covers 4K mappings. If
> +     *   pt_next_level() is called for page table level 0, it results in the
> +     *   entry being a pointer to a leaf node, thereby returning
> +     *   XEN_TABLE_SUPER_PAGE, despite of the fact this leaf covers 4k mapping.
> +     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
> +     *   mapped.
> +     */
> +    for ( level = HYP_PT_ROOT_LEVEL; ; --level )
> +    {
> +        int ret = pt_next_level(false, &table, offsets[level]);

... the mapping may be replaced here, but a new mapping will then still
be held by this function and ...

> +        if ( ret == XEN_TABLE_MAP_NONE || ret == XEN_TABLE_SUPER_PAGE )
> +            break;
> +
> +        ASSERT(level);
> +    }
> +
> +    if ( pte_level )
> +        *pte_level = level;
> +
> +    return table + offsets[level];
> +}

... the final one then be transferred to the caller.

> +pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
> +{
> +    return *_pt_walk(va, pte_level);
> +}

Hence aiui there needs to be an unmap operation here.

Jan

