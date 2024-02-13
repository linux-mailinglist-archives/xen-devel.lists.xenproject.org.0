Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B333E85348C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 16:26:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680017.1057823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZueg-0001UP-8j; Tue, 13 Feb 2024 15:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680017.1057823; Tue, 13 Feb 2024 15:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZueg-0001Rk-5Z; Tue, 13 Feb 2024 15:25:06 +0000
Received: by outflank-mailman (input) for mailman id 680017;
 Tue, 13 Feb 2024 15:25:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZuef-0001Re-75
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 15:25:05 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0eb2b1f1-ca84-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 16:25:02 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-411d715c401so600775e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 07:25:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v8-20020a5d43c8000000b0033b512b2031sm9778889wrr.114.2024.02.13.07.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 07:25:01 -0800 (PST)
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
X-Inumbo-ID: 0eb2b1f1-ca84-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707837902; x=1708442702; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C0R4a2pKzNuVqPKYAumSSAkLZHs8wRdapQvHR8QtOf0=;
        b=IIa8IlSBLIDiaqhRrPiz+/VfPdiT4Rg1bqRZggMC39UJD852+jPe0GIKh9Zio4xDQC
         zL5650MPugQf4OQARnDa7nInpVg1oUc4neQzBJTibrDmSzgkfaXOG8TUMb84/bkzq6rM
         u8EHqzjFiKl3YcvmRe7h7GdetR4U1vcBMPQyyO+sxfMbY8iB3Wn6wOOzdApZtM3F5oc/
         r7PEY/DMpXfWlsjX2Cavy8c9FoF6ysd3AiRI5LSZynYZbLyrXmhPxjcEr9CYLuW1zEvx
         /RCR2O8ZbCKV6e/KR3FZDD2796tv/SLdbns7BIZL/HT+SQ09cyGLwArsxS3qtEE6NZPF
         MsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707837902; x=1708442702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0R4a2pKzNuVqPKYAumSSAkLZHs8wRdapQvHR8QtOf0=;
        b=Glw/cO22Dd7HdPkqu2cUDGa6UPCvK/1mh/YkXDrDr9B3hStCacl6T0H8ytC5/piJ6/
         t8f1L+Wk0qZpiDAC9re5UhO5Phkxdf0jV4+3w55TiWhxdhqHMS3cWPv6pVOaI58ISFSN
         tqIzEx/6KG3oqHMSi0gD2K/p/Ww4H34w7j8xjIpMRRBYfvzkDSRRs4OvNIGiaG0TG05+
         zX7RYQ4HSj0SJzNaenIbvKspXC6IC1G2hMKO5WLQRxscrhUTahFjvZKt+/akF8AqC2mj
         /vtPyLM0m4E4Dd2fgRIiSeiLaERFPBSvOJp30GmRYXMjRdnsX5mzO6zALdYrIwPWX8jl
         k2hw==
X-Forwarded-Encrypted: i=1; AJvYcCWcvMxGiUjVcyVZdX6R64FMRrCkAi79EbzwXGP2Ec2Y55Qs1NdeWgezbeJRAjsBpR/l8Fq3wMG58Zw4PE41jL+svXtSHrrMZ5Clu2fQJj4=
X-Gm-Message-State: AOJu0YwgZXE7rtk1wyutEh+aL2pusfzqy1jpdzgslwUNrpAcNJGIWbmj
	MCmVbLX8VFAaHYCYOe5mX5pH5itYdhnMuQpwcRiZ2WuQFvZhxEsUAokm/2afMA==
X-Google-Smtp-Source: AGHT+IE5rWeYLXHvDtCRv8YZFlk6pzhyOe5psstwr/EoNYQxNq+plaWvrLAnHC8AMnKx3dsOqhGuMA==
X-Received: by 2002:a05:600c:1912:b0:411:b66a:5bf6 with SMTP id j18-20020a05600c191200b00411b66a5bf6mr1736939wmq.5.1707837902246;
        Tue, 13 Feb 2024 07:25:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1mO7Voo81TUSeuXr37oga6+ibvkHl0yaF9EV6FJo+eSSjyeKwDm7iuPnbkHvsEssrCuXNfSV4MZ7au25U+HzrZvD2h0P9jD1gA4wf257PobFD5E5nc3RKFtVEBxmvYykoKN8I1WrAgE3EiYDQCdYM8eWq8ouFgrhDGNq1EUu/vNDYDvmh26Gx+FvdlSCvGfoE1hXtaifK4Xppa0qIgQGK28zJNZfK8jm+8ns149I30GFWKvMCPhJyyansHRwaR7iAm+06wApyw2rNMP3N0MFNkv5W8IOlqQcQcqlz10E02tCuBzSJ6urbQqG5wy1QWExw+KJnjojlxNokqVuIOKvzbk5AwLHl+JZSkE3dDD6R1ee0+bFgxEfr3dDGYqPyhFHYuw==
Message-ID: <a66e3131-1de1-49cb-9b26-5fb1fd77bc20@suse.com>
Date: Tue, 13 Feb 2024 16:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/15] xen/arm: add cache coloring support for Xen
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-15-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240129171811.21382-15-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.01.2024 18:18, Carlo Nonato wrote:
> @@ -218,9 +230,44 @@ static void xen_pt_enforce_wnx(void)
>      flush_xen_tlb_local();
>  }
>  
> +static void __init create_llc_coloring_mappings(void)
> +{
> +    lpae_t pte;
> +    unsigned int i;
> +    struct bootmodule *xen_bootmodule = boot_module_find_by_kind(BOOTMOD_XEN);
> +    mfn_t mfn = maddr_to_mfn(xen_bootmodule->start);
> +
> +    for_each_xen_colored_mfn( mfn, i )

Nit: Either you consider the construct a pseudo-keyword, then

    for_each_xen_colored_mfn ( mfn, i )

or you don't, then

    for_each_xen_colored_mfn(mfn, i)

please.

> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -29,6 +29,8 @@ static unsigned int __ro_after_init xen_num_colors;
>  
>  #define mfn_color_mask              (max_nr_colors - 1)
>  #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
> +#define mfn_set_color(mfn, color)   (_mfn((mfn_x(mfn) & ~mfn_color_mask) | \
> +                                     (color)))

Nit: The wrapped line wants further indenting, such that it becomes
immediately clear what parentheses are still open. Alternatively:

#define mfn_set_color(mfn, color) \
    (_mfn((mfn_x(mfn) & ~mfn_color_mask) | (color)))

This is certainly an "interesting" construct: I, for one, wouldn't expect
that setting the color actually changes the MFN.

> @@ -316,6 +318,27 @@ unsigned int get_max_nr_llc_colors(void)
>      return max_nr_colors;
>  }
>  
> +paddr_t __init xen_colored_map_size(void)
> +{
> +    return ROUNDUP((_end - _start) * max_nr_colors, XEN_PADDR_ALIGN);
> +}
> +
> +mfn_t __init xen_colored_mfn(mfn_t mfn)
> +{
> +    unsigned int i, color = mfn_to_color(mfn);
> +
> +    for( i = 0; i < xen_num_colors; i++ )

Nit: Missing blank.

> +    {
> +        if ( color == xen_colors[i] )
> +            return mfn;
> +        else if ( color < xen_colors[i] )
> +            return mfn_set_color(mfn, xen_colors[i]);

How do you know that this or ...

> +    }
> +
> +    /* Jump to next color space (max_nr_colors mfns) and use the first color */
> +    return mfn_set_color(mfn_add(mfn, max_nr_colors), xen_colors[0]);

... this MFN are actually valid and in (available) RAM?

> --- a/xen/include/xen/llc-coloring.h
> +++ b/xen/include/xen/llc-coloring.h
> @@ -24,6 +24,17 @@ static inline void domain_llc_coloring_free(struct domain *d) {}
>  static inline void domain_dump_llc_colors(const struct domain *d) {}
>  #endif
>  
> +/**
> + * Iterate over each Xen mfn in the colored space.
> + * @mfn:    the current mfn. The first non colored mfn must be provided as the
> + *          starting point.
> + * @i:      loop index.
> + */
> +#define for_each_xen_colored_mfn(mfn, i)        \
> +    for ( i = 0, mfn = xen_colored_mfn(mfn);    \
> +          i < (_end - _start) >> PAGE_SHIFT;    \
> +          i++, mfn = xen_colored_mfn(mfn_add(mfn, 1)) )

While the comment mentions it, I still consider it problematic that
- unlike other for_each_* constructs we have - this requires one of
the iteration variables to be set up front. Question is why it needs
to be that way: Isn't it the MFN underlying _start which you mean to
start from?

Jan

