Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D525ACAFCB4
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 12:38:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181498.1504533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSw2l-00069r-0e; Tue, 09 Dec 2025 11:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181498.1504533; Tue, 09 Dec 2025 11:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSw2k-00067K-UD; Tue, 09 Dec 2025 11:38:10 +0000
Received: by outflank-mailman (input) for mailman id 1181498;
 Tue, 09 Dec 2025 11:38:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sSjK=6P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSw2j-00067E-R2
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 11:38:09 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8895d41b-d4f3-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 12:38:08 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42e2e6aa22fso2595627f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 03:38:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d330b20sm30293764f8f.29.2025.12.09.03.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 03:38:07 -0800 (PST)
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
X-Inumbo-ID: 8895d41b-d4f3-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765280288; x=1765885088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sfGTAzmOGepjRtubgeW/98EheXXXw06qLmTB8PXQAFA=;
        b=egf6kJHWW/47VmpBX9Yml6IonP9muqyfyz5A8IymXcpqWSvc5pgUVLSihakqTKoeeO
         nf9eqyJZa5AhfvTAZhj6HWiKmuV7UIocICGhWZyxI0TfCbQRLq/2wJh2KNuiZX0GF3tp
         Myisr6KoTg4fy8mS5/SL8VL2rqe9BH+jEl5XwePWCAvewRTgWlJjnHiYLoEEGgC2NlQ8
         wc9b4rh4dVE80VsRJ4FkCAfuvBAZHW+CM6JwheMk71N0S4Ss4MYIKpBa4Y1CKySWpXA9
         p71Vp+OtEbJaOfoepNLa5g+mUN+NbeXRyE4E8HR8FdLU7T8FztW/N9ZtnM1mG834HO2Q
         60dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765280288; x=1765885088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfGTAzmOGepjRtubgeW/98EheXXXw06qLmTB8PXQAFA=;
        b=eF7BaeKnZcJ96wvux4O2UhPnjhzAY0INgLEY7a1EksZQNgEfmtHDF9dY/QS5acMS1w
         oqEGDfeBohwlBS4+D4Pq4ZYTlU6VcVxxhoEj1kUE464cNhGmH+Xxc2WiyDn6vxhrCPEc
         Gzz8aWQJAgBxV1H1QSkY+RrC7ynUBj5L/jCG5lknod811sjt2VEIH4s7/DXrwupME+hb
         aAqXOPccNwDxMUkjfkWT6Kg4hKRv31QF6o4wa6o79y9oiFhnhYNWKQHc9mkOpPTAJ1rT
         pdfRN1TzyZP/ebMP92IdQZQViyVKLsjIy24ruhKuKXIMsXNoDC3qvfgYWbJgQM10KPLe
         OzkA==
X-Forwarded-Encrypted: i=1; AJvYcCUKK5g3ENPgdjREPbzpIZxiiLb4ojG7+Ttsed3AFL/l3BZhsvj2vhW8QDRE6t00dFBtTvutqLtDssg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1Ab/NAe1xEE+r7LddP2YbiExsp6fbH8QMlDuQH01NaVC8xxGC
	mbUxZzX/X1eJv2WlQxbN1zm33O3efmhz8SweeRe7TOitpn70gzqNgfymRGOgv1hpyA==
X-Gm-Gg: ASbGncvrGl6TSsTeZupIzBkIQvxcdELjrnLPldkTMS8FwcHh+i1cuXaZ7FSwXisvtqu
	/+EGt5Wwgo1KSEE2rsCzG6FHZq1/xcQnQgcVq5r1fiYbaTNtPEbMaN8gEqaCzF5zXwRISIoBxgU
	cCcooSBuGPSTEGkbYT+L7JV6rqiq7iTLaKxbZii1VcAXC2iFVqrEo9xVv4p3tXyIMauh7l+fzzE
	gZ3xSmBgsJljrH/yEjeDxJlhy9uO93wk/uQ39+mYjfHROmplZFlRlEtro4v7cusTTB9pI7yops7
	mpa5h524UppTXurIxRFeuBMoh9jf0QCrasDu4BRaz/UOvYrmlj8SAkG9lliyBGkOBlcQnwdBIYx
	Nb+p+6PipI8Lb8I9bKTfxIzzacNpjFQdUa+9YVmrmckV7bJZmxJ72IxGCZ1hUsp7VA4G/8aBilF
	h96cTtTRGfcdooI6PVnlG5VsxcbEhiF97wPx/Cm6wMZU4+yTSUPVGKQQb4xU2+JbhnGpiKvEMGE
	Gs=
X-Google-Smtp-Source: AGHT+IGyeW2NX/e2wMXOHzrC/6ypCmtshFmXHiiW/Iv7frhoz92kVpfzDqImT3CshvEftCQu2MkPxg==
X-Received: by 2002:a05:6000:40c8:b0:429:b525:6dc2 with SMTP id ffacd0b85a97d-42f89f1419dmr10680409f8f.17.1765280287632;
        Tue, 09 Dec 2025 03:38:07 -0800 (PST)
Message-ID: <69dce344-4dee-4778-99c2-0621c4e17cfc@suse.com>
Date: Tue, 9 Dec 2025 12:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/19] xen/riscv: add support of page lookup by GFN
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <48a58cde3de6a459885465c6d29d00d046ae4a37.1763986955.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <48a58cde3de6a459885465c6d29d00d046ae4a37.1763986955.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2025 13:33, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -1061,3 +1061,186 @@ int map_regions_p2mt(struct domain *d,
>  
>      return rc;
>  }
> +
> +/*
> + * p2m_get_entry() should always return the correct order value, even if an
> + * entry is not present (i.e. the GFN is outside the range):
> + *   [p2m->lowest_mapped_gfn, p2m->max_mapped_gfn]    (1)
> + *
> + * This ensures that callers of p2m_get_entry() can determine what range of
> + * address space would be altered by a corresponding p2m_set_entry().
> + * Also, it would help to avoid costly page walks for GFNs outside range (1).
> + *
> + * Therefore, this function returns true for GFNs outside range (1), and in
> + * that case the corresponding level is returned via the level_out argument.
> + * Otherwise, it returns false and p2m_get_entry() performs a page walk to
> + * find the proper entry.
> + */
> +static bool check_outside_boundary(const struct p2m_domain *p2m, gfn_t gfn,
> +                                   gfn_t boundary, bool is_lower,
> +                                   unsigned int *level_out)
> +{
> +    unsigned int level = P2M_ROOT_LEVEL(p2m);
> +    bool ret = false;
> +
> +    ASSERT(p2m);
> +
> +    if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
> +                  : gfn_x(gfn) > gfn_x(boundary) )
> +    {
> +        unsigned long mask = 0;
> +
> +        for ( ; level; level-- )
> +        {
> +            unsigned long masked_gfn;
> +
> +            mask |= PFN_DOWN(P2M_LEVEL_MASK(p2m, level));
> +            masked_gfn = gfn_x(gfn) & mask;
> +            masked_gfn |= (is_lower * (BIT(P2M_LEVEL_ORDER(level), UL) - 1));

I fear I still don't fully understand this. I would have expected the same mask to
be used for setting / clearing bits (once inverted, obviously). Why would you clear
only some of the lower bits in one case but set all of them in the other?

Overall, this alternative of clearing / setting of bits may also better (more
clearly / readably) be expressed using if/else or a conditional operator.

> +            if ( is_lower ? masked_gfn < gfn_x(boundary)
> +                          : masked_gfn > gfn_x(boundary) )
> +                break;
> +        }
> +
> +        ret = true;
> +    }
> +
> +    if ( level_out )
> +        *level_out = level;
> +
> +    return ret;
> +}
> +
> +/*
> + * Get the details of a given gfn.
> + *
> + * If the entry is present, the associated MFN will be returned and the
> + * p2m type of the mapping.

There may be a word order issue in this sentence, or there are words missing
at the end. It more likely being the former, isn't the order being returned
also worth mentioning, ...

> + * The page_order will correspond to the order of the mapping in the page
> + * table (i.e it could be a superpage).

... since this really is a separate piece of commentary?

> + * If the entry is not present, INVALID_MFN will be returned and the
> + * page_order will be set according to the order of the invalid range.

... and type will be "invalid".

> + */
> +static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
> +                           p2m_type_t *t,
> +                           unsigned int *page_order)
> +{
> +    unsigned int level = 0;
> +    pte_t entry, *table;
> +    int rc;
> +    mfn_t mfn = INVALID_MFN;
> +    P2M_BUILD_LEVEL_OFFSETS(p2m, offsets, gfn_to_gaddr(gfn));
> +
> +    ASSERT(p2m_is_locked(p2m));
> +
> +    if ( t )
> +        *t = p2m_invalid;

The sole caller passes non-NULL right now. Are you having patches pending
where NULL would be passed? Else, this being a static helper, I'd suggest
to drop the check here (and the other one further down).

Jan

