Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAD6C4814A
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 17:47:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158621.1486946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIV2Y-0000ms-JO; Mon, 10 Nov 2025 16:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158621.1486946; Mon, 10 Nov 2025 16:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIV2Y-0000lR-Gp; Mon, 10 Nov 2025 16:46:50 +0000
Received: by outflank-mailman (input) for mailman id 1158621;
 Mon, 10 Nov 2025 16:46:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vIV2X-0000lL-L1
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 16:46:49 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d84f21b6-be54-11f0-980a-7dc792cee155;
 Mon, 10 Nov 2025 17:46:46 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b725ead5800so428154166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 08:46:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bfa0f37csm1125001066b.64.2025.11.10.08.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 08:46:45 -0800 (PST)
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
X-Inumbo-ID: d84f21b6-be54-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762793206; x=1763398006; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vMaAnMq1S1h5nBzqUg9PRKg5j8qtxsXvMkJvhFl3xkc=;
        b=eWET3o1sPrLphriBB04280bxufxuyLL5iumvx0e72/FXIqbeXPHDZxt5pZkBB9uQFh
         iskIULRne5b05a+ZtcYn4hEVig07abrZz0YQt9BtwyExGdX9OGEw0tf2jDwpFDnCpkdS
         BQODyUw8hR4kX7Psco5bv15vhQq1dy/iwxLDeX7M0gFore7jvRvL+VLsU2+p5iPcE7pN
         SsYOS+6esVj3hObrdyrV1zXateSM3RiE0oJmgXVsY2sFumQT8rLgVgXmYtK3Q34mM7Dr
         P/foQ01pyGlc9PvqIwCfm5cW5DhJChAIkzL9anU9rh3lsEeMeWvWvStUJ0LHUiIcDn6m
         R9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762793206; x=1763398006;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMaAnMq1S1h5nBzqUg9PRKg5j8qtxsXvMkJvhFl3xkc=;
        b=fzstmTp2KT5M0B0/50FDu5Wv/yR3foc4MOsAFr7cjsWNCk0HtchGzMsafzjVdCKCy2
         dBy8FYXwtuQ97F+TatpYQfnkIC4h7iuB5WOwgu70RO7D3SwwLb6Gygz1NzLUo0DdjYMh
         jymiIVyouq8tOXT2cVPRLJA3z6YYChPwFG6x8k5LeFhDQfgSdWNY40OCjEIreWEmqoTc
         j5m8mcNYmOb22UTCu3Y0NklV2L4L6LenMBgRMPmk1har4bDWQljGhkEfsR3ENQZVWZ5p
         gp78NFX+R0X10ZrHB1a73FDiwBBHWFPew4lattx01OiSZArKxGa1lz+D/jx+ZkdHHrxz
         tygg==
X-Forwarded-Encrypted: i=1; AJvYcCXaNHwAOen6OqTE/XNjy6TMAPfc4armtTEj7Ud1OY81lAh02MQBW8nz8Dkmrm1tQRXJolNk0T1FhHA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywlxw/v+1J0uMgLTmf45b6QdIImbdS0d83c34k+ZBNXxdJePGyE
	LHRwP7sABIuJsyrCE5eNZqq6x/2uaT9wC6/CsqWqmAYGi6GIe0LFcQ3JWWe+SReaWw==
X-Gm-Gg: ASbGncuRDdtNiDj+YPfTYaufWb2izwtNc91cKKeRw//YXovFxiXgyAMC8nwDjq1Wzsz
	VKfIG+IKNpXaQqULfMIntYXFF0OdFn+HAluiRnyzAPeBZmXXkauoXh+ktUl+FknPXYPF+CnUoEt
	CZlLZ3bMEQq532Mz3DZZ7L2B3u4fHjsiAwNIk1hiZb8vJ5zb6ZA9q2JEZAZ7SARZaev2dJfqV8+
	o+LKpMR1vz3MsFXojtNzwy/m/sg/W16jTPFHPfQXXBbxoqPJwnNeAJqMJF5FIl3yUOu95POwZkM
	lP4D/k62s0EWx7b6t2qQRZBXmZqFudq/4kTxxMXERcAcZ9qiRQh7YBe4DFUuj0HGsATVZ1KNvJb
	LvpK9mRwS1TlEYsgCFMWuUvcqVU1MtBJYrgLFQWgCtczfQZ57nhkMCJfQrskaMtuRHrK96fLedn
	U1bvES/NIMKHDlbMaWQzpWFw7J9IIkh1N+9iV+ZSx4fj649fDsLtGf+H9u/SmbbxgTe4HSXDlW6
	JI=
X-Google-Smtp-Source: AGHT+IGWt6it8T2LMnBSKMAzRlrs5QzgCbc3mBhJppPH+OKUapWDU8AjOuwo9704Eb72gnNv1J3ZXQ==
X-Received: by 2002:a17:907:7ba4:b0:b6d:8e29:8f67 with SMTP id a640c23a62f3a-b72e02dcc65mr858100966b.26.1762793205959;
        Mon, 10 Nov 2025 08:46:45 -0800 (PST)
Message-ID: <c40be165-0db3-4115-b96b-92624b669e74@suse.com>
Date: Mon, 10 Nov 2025 17:46:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 17/18] xen/riscv: add support of page lookup by GFN
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <3eea04894401202666ea0bb7ee1240a23ba54d8a.1760974017.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3eea04894401202666ea0bb7ee1240a23ba54d8a.1760974017.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.10.2025 17:58, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -1049,3 +1049,178 @@ int map_regions_p2mt(struct domain *d,
>  
>      return rc;
>  }
> +
> +/*
> + * p2m_get_entry() should always return the correct order value, even if an
> + * entry is not present (i.e. the GFN is outside the range):
> + *   [p2m->lowest_mapped_gfn, p2m->max_mapped_gfn]).    (1)

There's one closing parenthesis too many here (likely the one before the colon).

> + * This ensures that callers of p2m_get_entry() can determine what range of
> + * address space would be altered by a corresponding p2m_set_entry().
> + * Also, it would help to avoid cost page walks for GFNs outside range (1).

DYM "costly"?

> + * Therefore, this function returns true for GFNs outside range (1), and in
> + * that case the corresponding level is returned via the level_out argument.
> + * Otherwise, it returns false and p2m_get_entry() performs a page walk to
> + * find the proper entry.
> + */
> +static bool check_outside_boundary(gfn_t gfn, gfn_t boundary, bool is_lower,
> +                                   unsigned int *level_out)
> +{
> +    unsigned int level;
> +
> +    if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
> +                  : gfn_x(gfn) > gfn_x(boundary) )
> +    {
> +        unsigned long mask = 0;
> +
> +        for ( level = P2M_ROOT_LEVEL; level; level-- )
> +        {
> +            unsigned long masked_gfn;
> +
> +            mask |= PFN_DOWN(P2M_LEVEL_MASK(level));
> +            masked_gfn = gfn_x(gfn) & mask;
> +
> +            if ( is_lower ? masked_gfn < gfn_x(boundary)
> +                          : masked_gfn > gfn_x(boundary) )
> +            {
> +                *level_out = level;

For this to be correct in the is_lower case, don't you need to fill the
bottom bits of masked_gfn with all 1s, rather than with all 0s? Otherwise
the tail of the range may be above boundary.

> +struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
> +                                        p2m_type_t *t)
> +{
> +    struct page_info *page;
> +    p2m_type_t p2mt = p2m_invalid;
> +    mfn_t mfn;
> +
> +    p2m_read_lock(p2m);
> +    mfn = p2m_get_entry(p2m, gfn, t, NULL);
> +
> +    if ( !mfn_valid(mfn) )
> +    {
> +        p2m_read_unlock(p2m);
> +        return NULL;
> +    }
> +
> +    if ( t )
> +        p2mt = *t;

Doesn't it need to be the other way around? The way you have it, when a caller
passes NULL for t, p2m_get_entry() won't give you a type, and you'll do all
further work with p2m_invalid.

Also, might this better move ahead of the earlier if()? Callers might be able
to do still something based on the type, when they get back NULL as function
return value. (Practically this might only become of interest once you add
something like PoD, paging, or sharing.)

Jan

