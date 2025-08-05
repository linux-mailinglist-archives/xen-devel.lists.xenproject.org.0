Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 636FEB1B769
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 17:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070603.1434273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJSl-000368-F9; Tue, 05 Aug 2025 15:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070603.1434273; Tue, 05 Aug 2025 15:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJSl-00030R-AL; Tue, 05 Aug 2025 15:20:27 +0000
Received: by outflank-mailman (input) for mailman id 1070603;
 Tue, 05 Aug 2025 15:20:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujJSj-0002Ma-IM
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 15:20:25 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2cff0fb-720f-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 17:20:20 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-af93381a1d2so662415266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 08:20:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a076724sm919872766b.23.2025.08.05.08.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 08:20:18 -0700 (PDT)
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
X-Inumbo-ID: b2cff0fb-720f-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754407219; x=1755012019; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SVSQFZHw1NmJNVVc0FIzfrU1PwOHcGlcdeD5EVwCNU4=;
        b=NRclozHeO9z20CYVGQDiAXjYLYhzlpGJzDxz8TD3uPUxY4YybjvYAUWrn+QU+3Eqil
         ykgh9QM4Dwld+I3gTYW5dIHbsbsRu9OAY5AyL+QB9fXvxO8Ffbxfv5I1M/HnmbYOUanU
         snebJTxungpo9cTZvXjPZk0XIrZJviqDu6pYSu6HnwesHwGBbsCIMAGbAJovrU+8D+0B
         u8DfX1bcDrdP/6co7fVqMljz/JEWOTTxUk06KkMaPdmZ5tQNWnJBOAzT2XWaIPBAdcjj
         LYdL+uiuKsY2mMr0nHf7z6lqeGLHGtUsoVGl6KPt7/TlSZZaLcpiP4Ve4fsoSAhh3oZB
         Mxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754407219; x=1755012019;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVSQFZHw1NmJNVVc0FIzfrU1PwOHcGlcdeD5EVwCNU4=;
        b=oKsF/kz9nOWwzhx3eHhvvIFfB4e/irw6gOoEyTQiNXC1JFoi9c0p7OMVCOkLLt7xHT
         SKf0ngjvPxtaZ4rvmwOCce7abUYdiXFX5+/7MTHrHzvVjvpc/pAbztgZqoJq/09x4qKF
         nEUuC5LrtktpMEdVbXB0l1eWvfk4qhnufqYtFY361otc7L5byYXYXTmR2/y2lIyp8way
         7Ysl3xP8Jqj1RveS856BROo7L41lwHfdSdAxdDSVNe2L8GE8K9Xl7GrlL6nt3Ey0L/Y6
         HTpqwGBii7ByKh0vqnd/uf9zxy2tqMMVKjNgdK3xE8Vcg30lSpb5A9oZi+UON/TOeaYc
         ZH2w==
X-Forwarded-Encrypted: i=1; AJvYcCUHotbm78OV+l/pA/9SkdT0STmLqQMykooC+AjZAmT+NNopgZANTwskxPxeQPpxtii+y+ZTzkuzVa8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLmq4uBfKgrJOJq9UTRNVbQwNcORSSEZ3K55zPZZVZoUcCvkWQ
	uPuZrHvu39wHd7eQUc7vYubKCF8QuVY8Ywlt4IkvNAbJnMiHLTbWgJyqFVIa+RuWCw==
X-Gm-Gg: ASbGnctCdQkuxT49gJTHdSu7fZfopvM70m0BMquzUZq6WIuCQAXISSa0jRLo9KP69T7
	sAaxUVtzsv56yd14rbhyMfqXoD8Vps2xdznPRtkdh7LuOMVfrB5QraPVyZ3ILTs5wU1yMFMUsOb
	AVqCTOlNLgPaJ5JD/TfwCsfmwaCg1bIi3Zobg3SyYykVqkY57J/veiFbdgX1LFCdhKZWODtv97i
	E1D4YkedIMoCALIUnTL+XW//e0gxWeZSsIyYQLdf5pXjEfmfyWN+DurKtY+7iNNOr2yrx9dF6Ea
	jAEalGE2MTGFr6ZjjdPwK9QvQFDMb5yE9Cr3FPuFcmTyEKO1R+jSJWOC5moyNOJcooUxyTPKCxc
	g+ZZuZa7r9UhzsjtUIKFw+IT9E8jsPu4wWq3awfjEZ2/3KYH9AR7HnCwhMMQmpFDzgRjdCYj9mS
	GfvmozE+Y=
X-Google-Smtp-Source: AGHT+IEEAOdRiEFZuBtH3m7EiOjD0DiZD7qgJAgAqZhv1HuI51sTOasGzqCMxxaER4v2sDX7AGROAA==
X-Received: by 2002:a17:906:d54f:b0:ad8:9c97:c2e5 with SMTP id a640c23a62f3a-af93fda17edmr1458156266b.0.1754407219209;
        Tue, 05 Aug 2025 08:20:19 -0700 (PDT)
Message-ID: <e7b4b220-4da9-4a87-a4d6-179350849eaa@suse.com>
Date: Tue, 5 Aug 2025 17:20:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/20] xen/riscv: implement function to map memory in
 guest p2m
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <e00dcbecf8f0dbe863628dcc45526100f9ee86a3.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e00dcbecf8f0dbe863628dcc45526100f9ee86a3.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> Implement map_regions_p2mt() to map a region in the guest p2m with
> a specific p2m type. The memory attributes will be derived from the
> p2m type. This function is going to be called from dom0less common
> code.

s/is going to be/is/ ? Such a call exists already, after all.

> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -121,21 +121,22 @@ static inline int guest_physmap_mark_populate_on_demand(struct domain *d,
>      return -EOPNOTSUPP;
>  }
>  
> -static inline int guest_physmap_add_entry(struct domain *d,
> -                                          gfn_t gfn, mfn_t mfn,
> -                                          unsigned long page_order,
> -                                          p2m_type_t t)
> -{
> -    BUG_ON("unimplemented");
> -    return -EINVAL;
> -}
> +/*
> + * Map a region in the guest p2m with a specific p2m type.

What is "the guest p2m"? In your answer, please consider the possible
(and at some point likely necessary) existence of altp2m and nestedp2m.
In patch 04 you introduce p2m_get_hostp2m(), and I expect it's that
what you mean here.

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -9,6 +9,41 @@
>  
>  unsigned int __read_mostly p2m_root_order;
>  
> +/*
> + * Force a synchronous P2M TLB flush.
> + *
> + * Must be called with the p2m lock held.
> + */
> +static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
> +{
> +    struct domain *d = p2m->domain;

Pointer-to-const please. Personally, given the implementation of this
function (and also ...

> +    ASSERT(p2m_is_write_locked(p2m));
> +
> +    sbi_remote_hfence_gvma(d->dirty_cpumask, 0, 0);
> +
> +    p2m->need_flush = false;
> +}
> +
> +void p2m_tlb_flush_sync(struct p2m_domain *p2m)
> +{
> +    if ( p2m->need_flush )
> +        p2m_force_tlb_flush_sync(p2m);
> +}

... this one) I'd further ask for the function parameters to also be
pointer-to-const, but Andrew may object to that. Andrew - it continues to
be unclear to me under what conditions you agree with adding const, and
under what conditions you would object to me asking for such. Please can
you take the time to clarify this?

> +/* Unlock the flush and do a P2M TLB flush if necessary */
> +void p2m_write_unlock(struct p2m_domain *p2m)
> +{
> +    /*
> +     * The final flush is done with the P2M write lock taken to avoid
> +     * someone else modifying the P2M wbefore the TLB invalidation has

Nit: Stray 'w'.

> +     * completed.
> +     */
> +    p2m_tlb_flush_sync(p2m);

Wasn't the plan to have this be conditional?

> @@ -139,3 +174,33 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>  
>      return 0;
>  }
> +
> +static int p2m_set_range(struct p2m_domain *p2m,
> +                         gfn_t sgfn,
> +                         unsigned long nr,
> +                         mfn_t smfn,
> +                         p2m_type_t t)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +static int p2m_insert_mapping(struct p2m_domain *p2m, gfn_t start_gfn,
> +                              unsigned long nr, mfn_t mfn, p2m_type_t t)
> +{
> +    int rc;
> +
> +    p2m_write_lock(p2m);
> +    rc = p2m_set_range(p2m, start_gfn, nr, mfn, t);
> +    p2m_write_unlock(p2m);
> +
> +    return rc;
> +}
> +
> +int map_regions_p2mt(struct domain *d,
> +                     gfn_t gfn,
> +                     unsigned long nr,
> +                     mfn_t mfn,
> +                     p2m_type_t p2mt)
> +{
> +    return p2m_insert_mapping(p2m_get_hostp2m(d), gfn, nr, mfn, p2mt);
> +}

And eventually both helper functions will gain further callers? Otherwise
it's a little hard to see why they would both need to be separate functions.

Jan

