Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88100CCBDAE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 13:55:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189560.1510318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWDXD-00025W-9b; Thu, 18 Dec 2025 12:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189560.1510318; Thu, 18 Dec 2025 12:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWDXD-00022Q-6u; Thu, 18 Dec 2025 12:55:11 +0000
Received: by outflank-mailman (input) for mailman id 1189560;
 Thu, 18 Dec 2025 12:55:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWDXC-00022K-4F
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 12:55:10 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7ef55ae-dc10-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 13:55:08 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso4827065e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 04:55:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3020f25sm45559445e9.6.2025.12.18.04.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 04:55:07 -0800 (PST)
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
X-Inumbo-ID: c7ef55ae-dc10-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766062508; x=1766667308; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f+kVThU9cCW60pfANQ5ApGFVtqmwBzEYyE2ua5P7vqE=;
        b=ZCCZvjY3PWyVVXVnhPiVjUnmZn1sqEV6zIWKJ4NfC0zoTcueEwwba3V/ggLGnrRen7
         Dv0Q2/o3/gWvcJwZHvY5NkNbuGgpFQ64q/ADF/AVdS/uZPWb5KP1XRwcYfx1LNoRW3dR
         UYsU68nJ/jeZcKTevvehok305BzL5UbYsX9kmhP9IL37h7cfbwy3E1aHTCE1AUCbYbSl
         ijzPIVhF+XzYXLoRVe0IXddTk1cEVzfH48gPHGOcXy11MF38CMTdS2HJezaVunJNRD9Q
         y09kZAKayHEwYAToZuJ2nnN+teLfi/tsGB6b7u716L9pvuoDujG04MkAtynrqltY3lJy
         bpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766062508; x=1766667308;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+kVThU9cCW60pfANQ5ApGFVtqmwBzEYyE2ua5P7vqE=;
        b=UZ9OBKFcpEGQ0D/mNmbcQJ5lkUIhBqpv9z+iy3uRMwbiV3S/eI1+Idk9XtloksiSFd
         1+LmM/zYX/4UB85sH+OuMqvotjmJFvkFFPlFQetQUknXxvnxwszNaWVlYZDMnEXesPxH
         CJe23QTub3tgosmuqDhLzz2d/9RtPrq+ovgrr3b5CwOVIErcgqMWFny2+H92aLz+V5yZ
         HPLD0MlkO1IEq0yc/z+iq5anC7vvq61kEzJThf0S9SyYbKzHmdOk36kERTfIE6uWrjwG
         +UeAoIc5MIjNpUS7FrSM4KAMz4hukfKckvljGn6Bu5Cdyo3y2l57F22PetMBW+5vkBpv
         Spvg==
X-Forwarded-Encrypted: i=1; AJvYcCUzzHU0dZwP4OFcUhgUY5umGzCti2Awm6PasVPJDoOjPwx2zr6q86tqDYWVeAQFVOWH9eb5az78Sp4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFZtM66mog3GAk8F4G85XLLowMIIwwO4UxFMGjYAD52EodyqCZ
	WYszcVKXdijjauDZnJ0koHV4SEkTzFkKfOq7QX5+iC6e65YlY/c/U4rn1r1cZJK/9A==
X-Gm-Gg: AY/fxX4Hk8zPVG5iINLvRYEsnZ2Iz3WXqqtmDYDupZD9tt2Eef0R+vzbFiWvAyqntgM
	WYigMLIPPyg0qp4QbjGJn4OqZbLOdRikIV9FlHaFqThLzqstRSRFnJY3jPNHkbzwAk9+wk64Db0
	q2KPG2sVhNwtmDLzPVPPCb7cbSqXcIOry627+ouaOROuoFp1irV1p9GQrIxIfCfw1qrn6K9S78Q
	AlXwYm9v5kVPbYiXxpdEqDi5hsAJ4LiRgdUjWdtJhA/QZtlGuCu6sJC/7KETenVaY8RuyoBa7Hx
	bhTl+N3Fjt4IKqJWClIggCUEx+I7MCECBznBXYtEJ0RhvWX2tsFk+4IC+aAccfrz3M/m628yiGe
	ixOG/ecK/FuIKozQVVJLa0tQHTyXPfRah9LpH2eisSG3EKp50jF3Rv2ICOa63XSCo2L5568oLgd
	Huv15RiktPAANpWV17WPqKxKWkYdzhv2DU4XVha4yUzpRr0YI+WP8DBneb6M+fHDAk46HMo8eqP
	2yiex2iQXKScQ==
X-Google-Smtp-Source: AGHT+IGefmEjr5sN7qRc0Lq10CCOiUoILkPS69i0wmNR6zx6hw4yRjPBP4i3yEx9SufLfzIO/5Oxcg==
X-Received: by 2002:a05:600c:4751:b0:477:7b9a:bb0a with SMTP id 5b1f17b1804b1-47a8f907e5dmr218095055e9.21.1766062507617;
        Thu, 18 Dec 2025 04:55:07 -0800 (PST)
Message-ID: <9d4d89f1-81c1-4532-8646-c736ac56e7f3@suse.com>
Date: Thu, 18 Dec 2025 13:55:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 17/19] xen/riscv: add support of page lookup by GFN
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
 <4cef2922ff0fa82eb70e50c737cb00ef27ef13a3.1765879052.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4cef2922ff0fa82eb70e50c737cb00ef27ef13a3.1765879052.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.12.2025 17:55, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -1057,3 +1057,187 @@ int map_regions_p2mt(struct domain *d,
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
> +        for ( ; level; level-- )
> +        {
> +            unsigned long mask = BIT(P2M_GFN_LEVEL_SHIFT(level), UL) - 1;
> +            unsigned long masked_gfn;
> +
> +            if ( is_lower )
> +                masked_gfn = gfn_x(gfn) | mask;
> +            else
> +                masked_gfn = gfn_x(gfn) & ~mask;
> +
> +            if ( is_lower ? masked_gfn < gfn_x(boundary)
> +                          : masked_gfn > gfn_x(boundary) )
> +                break;

Having two is_lower conditionals here is imo unhelpful. Likely the compiler
would manage to fold them, but imo

            if ( is_lower ? (gfn_x(gfn) | mask) < gfn_x(boundary)
                          : (gfn_x(gfn) & ~mask) > gfn_x(boundary) )
                break;

would be more clear to the reader as well. I'm not going to insist, though.

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
> + * If the entry is present, the associated MFN, the p2m type of the mapping,
> + * and the page order of the mapping in the page table (i.e., it could be a
> + * superpage) will be returned.
> + *
> + * If the entry is not present, INVALID_MFN will be returned, page_order will
> + * be set according to the order of the invalid range, and the type will be
> + * p2m_invalid.
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
> +    *t = p2m_invalid;
> +
> +    if ( gfn_x(gfn) > (BIT(PADDR_BITS - PAGE_SHIFT + 1, UL) - 1) )
> +        return mfn;

Since on all other error paths you set *page_order (as long as the pointer
is non-NULL), shouldn't you do so here as well (to the order corresponding
to the full [2nd-level] address space)?

Furthermore, is PADDR_BITS really the right basis? Don't things rather depend
on the number of levels the 2nd-level page tables have for the given guest?

Jan

