Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739A783C3CE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 14:37:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671525.1044903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSzuc-0006QH-At; Thu, 25 Jan 2024 13:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671525.1044903; Thu, 25 Jan 2024 13:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSzuc-0006OB-7f; Thu, 25 Jan 2024 13:36:58 +0000
Received: by outflank-mailman (input) for mailman id 671525;
 Thu, 25 Jan 2024 13:36:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSzub-0006O5-Ap
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 13:36:57 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd8b6655-bb86-11ee-98f5-efadbce2ee36;
 Thu, 25 Jan 2024 14:36:55 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cddb2c2b54so68585521fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 05:36:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c1-20020a056e02058100b0036194d1dad6sm456689ils.40.2024.01.25.05.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 05:36:53 -0800 (PST)
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
X-Inumbo-ID: cd8b6655-bb86-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706189814; x=1706794614; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pm3S5uxI+0hPBVUwoJRnuc869OgqXz66WJKWBP9M0GM=;
        b=OtZPQuGg+nUiLhCijxBRhPEaOhtA8sKqFUKakn7NzoJZ8jZw8KLOKGkLGVKXCVxD+/
         rMdcyx4NBCInEkgdK2AYynafFw15QYm8cZnq5Prbxut0IkSka0oiZCa9YItDC0MYO2Dg
         i9cPzn7JzocW7MEMdBAChQFiGL7DwBLMry7uLU9QXbQJp+VkPGezUyeZrONDGCf/0q0E
         a+k57Z1X2pPK6MOO29fcJbvtkdr00c6at2KOjCcgXA0FeT4CDMcdNNcJcHTFqCFJ2l7g
         hXt0yOm9abEfM243fx8PDs1hVH4/b2ZidHwoiEKPU2VTbi9gV8C4hrgVBFUhL0xMWPQH
         F61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706189814; x=1706794614;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pm3S5uxI+0hPBVUwoJRnuc869OgqXz66WJKWBP9M0GM=;
        b=iYneV9kfIQtY/zSOtrOmcaQ3/B2SFm2Sibu6y8j48cTjCUwxgeduBOkz52znqSxB2+
         M7NtN2hnZcc/KbaVrFugUW+8iQlfD/ML+vL3xmtuTaYN/6jBbQuaT9DHIrPExn/4yu39
         augOamY9BJC3sJEFPhtS4MkZ6h2JNy0D4sD+UghqUoD47tCgVn2/xsAGUMFufAMSrjec
         gUyoLYtHasEZczttWrlBRrW5EVhphvKZjt5xKIrAzyd8WK+669gSy1nHufnhvqW3+HXw
         EW5OXvBvl0zJCnrpc16862KdqY4+TbvyhQZUYD0bS3W6zRUuAEmifi1SgnmcH8rp0yjp
         S62w==
X-Gm-Message-State: AOJu0YydACHAszLLuVSwL1jEi89LgKQb+WpL7sR/R2BGDG99/m4wZLSk
	37/sTxjudtjWJkMKdqCmYo2Lk6FbXJOM8wVcrks2AUJuDkRATrHcNcclzR0rag==
X-Google-Smtp-Source: AGHT+IGvKEuw/9cyaoSJcUoRJEPixkLG3kkjWvQs/bryOIeUY/xB6kW6zEH8Pgkq74Y/Y8XsNvsBjw==
X-Received: by 2002:a05:651c:210c:b0:2cc:7b19:1b05 with SMTP id a12-20020a05651c210c00b002cc7b191b05mr1103505ljq.48.1706189813931;
        Thu, 25 Jan 2024 05:36:53 -0800 (PST)
Message-ID: <210c11b0-4948-45cb-be96-d048d36082ca@suse.com>
Date: Thu, 25 Jan 2024 14:36:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] x86/iommu: remove regions not to be mapped
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20240124172953.29814-2-roger.pau@citrix.com>
 <20240125132626.34553-1-roger.pau@citrix.com>
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
In-Reply-To: <20240125132626.34553-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.01.2024 14:26, Roger Pau Monne wrote:
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -2138,6 +2138,54 @@ int __hwdom_init xen_in_range(unsigned long mfn)
>      return 0;
>  }
>  
> +int __hwdom_init remove_xen_ranges(struct rangeset *r)
> +{
> +    paddr_t start, end;
> +    int rc;
> +
> +    /* S3 resume code (and other real mode trampoline code) */
> +    rc = rangeset_remove_range(r, PFN_DOWN(bootsym_phys(trampoline_start)),
> +                               PFN_DOWN(bootsym_phys(trampoline_end) - 1));

As per further v5 comments this wants to be

    rc = rangeset_remove_range(r, PFN_DOWN(bootsym_phys(trampoline_start)),
                               PFN_DOWN(bootsym_phys(trampoline_start)));

or some such, with suitable cross-referencing comments added here and on
the other side as to this only being a single page (unless this is already
somehow abstracted; I can't spot any respective assertion in xen.lds.S
though, for example).

Jan

