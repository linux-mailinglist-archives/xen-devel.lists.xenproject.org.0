Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41875B11836
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057111.1425033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBYV-00041D-5P; Fri, 25 Jul 2025 06:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057111.1425033; Fri, 25 Jul 2025 06:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBYV-0003zx-27; Fri, 25 Jul 2025 06:05:19 +0000
Received: by outflank-mailman (input) for mailman id 1057111;
 Fri, 25 Jul 2025 06:05:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ufBYT-0003zR-Lo
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:05:17 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 522a981f-691d-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 08:05:11 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45600581226so18085755e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 23:05:10 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2ab:e91f:46e4:60d0:c444?
 (p200300cab711f2abe91f46e460d0c444.dip0.t-ipconnect.de.
 [2003:ca:b711:f2ab:e91f:46e4:60d0:c444])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fc6d2e8sm4017623f8f.20.2025.07.24.23.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 23:05:09 -0700 (PDT)
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
X-Inumbo-ID: 522a981f-691d-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753423510; x=1754028310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g9L4+DIrcAvno0zFgOwvvttH0A5KYWZsfsDZkQeh8NI=;
        b=NDF3GhVdMU+zz9X+rEOy7A/3OvJ2jeJjb4VCZr1ITAP10aOyhvppywwsB4wWE5o2RS
         kY95gRJzZZHdsIFOXYA57+187dLDxDxYAP/LrgPdPLwD7f+bLhuHAkhZx1/baOsqD53i
         Mhid0/iKqMEsgybGqcfLE8h05XWDJpy5WHA1+mGSB6vKtbeBTRIxwlW7klkOB6uTiq7y
         zY42IvdsS3KT9i76nrSWpUxm4V8yJ9P96ftiKYB19UAQrMr57E7a9zDHLWuQI0taiMBp
         hPV8ISaPFPj+39x3F42lWgeGXWla0JolJ1/1sBciruB4Y2t6lTd+xXHNApoh+9iqQvov
         W/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753423510; x=1754028310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9L4+DIrcAvno0zFgOwvvttH0A5KYWZsfsDZkQeh8NI=;
        b=iWKIVF5WKb0eFa2taiSEnHA3SxGGjVKSACb51eL/VzYHjvUYjV/Jwk/CfCbei0wjhD
         Ld8dA96ORMzvtJB1ghvq/jYa5k8FFWG4dpQZsWEzVNqFeh+xicDJUc1Olo0pkw9L8dRT
         BykMTHb/8xc31483D08HCXee8M/PnxsnYcXX4MC0DbaZG6k/nff8tzWbx05Xc8oJJ8QY
         8PskiucqHealEMpfu9A+jmR07g3zJ9tBnQlFY1A0PnuMbgdDSPL70BXylo9r87NGf3WX
         6OeT6yYmeCVpMUvXr5LdsLwFPov+Qj3Afj3UOYL0dCWDIeSusFpY34l6PgiBTHcJGhEK
         lJkg==
X-Forwarded-Encrypted: i=1; AJvYcCUq5MTg/wHi28zE7kvvJ2SyG3mC+TZKEhRvp2/8VBIVudREegamnopmnpZd7ufj4ba4aVPl/DSICvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7//7i7F3EwiFS2VTZXzB23QX/gKD3Ur0TnTyMg95XqI/n7ZC8
	iDlZy0BmnxwHYVENC4o6FM/Q1XY9WigtiMdsycJ3b1i1/7x5CCDZJSJjKILTTsMpjQ==
X-Gm-Gg: ASbGncvF8JOzUpeBcW9UQmaFb9bo3yofkL4QZph90YuClN/NLlLbBrkspNcz+DXUtIn
	vIiv5nNQpcnpIwQv+pc0NQ3nridqkIQD3bMxlDxIzs3c4WytY0nw3joVQp54vRaoLfx7YJkLG8x
	5X+uT6Oo6ek0J+2jtcbOlbB5C6ACFMi4PgCyKqHjjJlPhbiU/4iDMlsOPlAynW1texmScecKWlW
	XV4LDT3PPeK29HJ/VRtC49Qtoi+0NaXLp3Ft2QDFtodHbYwNTVHU3xqAYu70eMRfbFRL0tmV27p
	8RJ8Yx0/qcMeFuRc09kW69O/uHzvZivoc9mHXDH4fFFfJbTaT5m/RBlS2tyrnw2FAM03a0OJb9o
	a0qf00aSapGDpIg0I8dQjMoY+k2qqHISV2KaeSJ7kIwxjZrtPQUvO4RQIboDFlr31yi5iaXzsKc
	r6NJNeaoQXMZGVHTGugZ497ZpOoSRuwaVZMhO+qEF+K8rOqv2gwZn12tRo
X-Google-Smtp-Source: AGHT+IGFK4CuAQvNjwxbrAZgt1A2g3FgDp6PqAfVi9ZrmztkeS0ugUh2upsLpOqqzodAE95KFvepog==
X-Received: by 2002:a05:600c:3acf:b0:453:8bc7:5cbb with SMTP id 5b1f17b1804b1-4587655aa54mr4182845e9.25.1753423509655;
        Thu, 24 Jul 2025 23:05:09 -0700 (PDT)
Message-ID: <8d23b930-0abf-42d1-a634-4d9f898375f2@suse.com>
Date: Fri, 25 Jul 2025 08:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen/cache-col: Remove bogus cast in
 domain_llc_coloring_free()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Carlo Nonato <carlo.nonato@minervasys.tech>,
 Marco Solieri <marco.solieri@minervasys.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250724162306.2978741-1-andrew.cooper3@citrix.com>
 <20250724162306.2978741-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250724162306.2978741-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2025 18:23, Andrew Cooper wrote:
> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -309,11 +309,8 @@ int domain_set_llc_colors(struct domain *d,
>  
>  void domain_llc_coloring_free(struct domain *d)
>  {
> -    if ( !llc_coloring_enabled || d->llc_colors == default_colors )
> -        return;
> -
> -    /* free pointer-to-const using __va(__pa()) */
> -    xfree(__va(__pa(d->llc_colors)));
> +    if ( d->llc_colors != default_colors )
> +        xfree(d->llc_colors);
>  }
>  
>  int __init domain_set_llc_colors_from_str(struct domain *d, const char *str)
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index fe53d4fab7ba..df23411869e6 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -649,7 +649,7 @@ struct domain
>  
>  #ifdef CONFIG_LLC_COLORING
>      unsigned int num_llc_colors;
> -    const unsigned int *llc_colors;
> +    unsigned int *llc_colors;
>  #endif
>  
>      /* Console settings. */

Ah yes, I see. Yet no, I don't agree. The only sane course of action
to avoid odd transformations like the above (without using casts to
cast away const-ness) is to finally make xfree() et al take pointers
to const void. Arguments towards why this makes sense were given
before; I don't think they need repeating. Dropping the const here is
rather undesirable: Once set, the colors shouldn't be altered anymore.
Pointers like this hence want to be pointer-to-const, to make
accidental modification less likely. Which in turn calls for the
mentioned adjustment to xfree(). Which you keep objecting to for
reasons I sadly cannot follow.

Jan

