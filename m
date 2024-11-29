Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5009DC279
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 12:03:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845897.1261214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGykx-0005Ek-Pq; Fri, 29 Nov 2024 11:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845897.1261214; Fri, 29 Nov 2024 11:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGykx-0005Cr-N8; Fri, 29 Nov 2024 11:01:51 +0000
Received: by outflank-mailman (input) for mailman id 845897;
 Fri, 29 Nov 2024 11:01:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGykw-0005Cg-5X
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 11:01:50 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52e9609a-ae41-11ef-99a3-01e77a169b0f;
 Fri, 29 Nov 2024 12:01:46 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa543c4db92so230913666b.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2024 03:01:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e6fa4sm161089666b.116.2024.11.29.03.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 03:01:45 -0800 (PST)
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
X-Inumbo-ID: 52e9609a-ae41-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmIiLCJoZWxvIjoibWFpbC1lajEteDYyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjUyZTk2MDlhLWFlNDEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyODc4MTA2LjA1MzM1OSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732878105; x=1733482905; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aPIfRx9b1D9I9+Kwy+ccj2KaU+kZ+7/oX/Sc7S+tCr4=;
        b=be7pV1BAuw3omkqfzElqy31+UsFkrIAebb1EtQL+BH0zaP5d77678etRZpDR+NoCJB
         V6WjPiByJCxj663eiGD3UdnIdaakZtLPOY8aGE9kXWLSfIlK31wYOcB1SbuWcW4tJPFJ
         JaHm8sufPAo5LLjk3g4lkwN5oD+0WIuPtPZqRC+41TgzG7nw4Tmz3WYmQBWEq70dFc3d
         3A/OZPxSs9ApiJD2u1Rt4OqFao6+jp/Inm7hK8hIcjVodbY9aYLpGtoTCUN8LMKP0igE
         N+cQDvBUk4sqZLKW2exXfQuAha4Z4CrRL4Pa4Z7cWviFWGBww/050KYJxhv22k6Sgnnq
         Dd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732878105; x=1733482905;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPIfRx9b1D9I9+Kwy+ccj2KaU+kZ+7/oX/Sc7S+tCr4=;
        b=SYgE4RcJxnd13pPF/4PUUklcYAHOjW47pxux/N4PSWc4uHY/FTuZNQgAFjWdspqX9+
         Fmop3mWYIsG5Wddm6GQ8LedqSB7KpS8L+P4VSB1RXXHzHkSb3rRVpKEdL41QrwiXDlKs
         p3qIdK+VCUY+MiChoSXL+L/16c/KNycqOUEWsV1bsEtS9PT/8ydS5Qnfvw+lc8ezDLeO
         tN4cFW9dI/yejoebhfSKLKcAnHh+AKimvlqHvQ/ABJ6Yi2r/JvigmBq0rhNi3bLkfC80
         PRhWDeFpBxppQdaaarfbLUA0aILjxSVXUpwe52QnFzrlvVw4EtPme+8LgOpaYKshdTrx
         u1Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXnTHVfSDrQ6wVv8hCwY90g/w8Nl4uwH8uxwpOCAqd/KbKLCZrIc23K+qR1Fpg/rz82VSSVQVb4CIk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzC1/bUYWdN10C60gFDQp7eE6snKjoFiay3rY76cpLse22zKHWc
	RmRNXfsZp6Sw+MFVmnrlKNvUwsAHNtfJhf48TgIxUmRugtIwa03yR7XmRebucw==
X-Gm-Gg: ASbGnct9neploVKDeED0f/jBXRk9Hz1Gse1cH41DDVzpS1KzM6YD0EIUpEn/fJcWWbK
	dpTyGQBqBKLisRim1EVycJtHRjSM1LZgT+jGxr+yxDglW29bmNp8YELtgyg+zqLdgB5ixy7RSUT
	GDbczGAb/42cCq7ZCXVyKtLBnuXel1kEIujhk+j7ckWdWMPAVrne2ooLGTPr4nrDMejR68n7o1Z
	EokWLD94e8R2ChBQ3d014V3TNyfowLDfx/szJg6hhDHnlg3MbzcqmD5FRbQH0qeUa1VQfpq1GWM
	hBXh5lVskbp3nWSKZVp30SqIiDi9+Za15AU=
X-Google-Smtp-Source: AGHT+IHrYcTuWe4yOEFtAYGRXb+UsYPxdHswYjS/mGAjt+O83pOCcDlw0mR2dbPVZvEWCZJXMeRk4g==
X-Received: by 2002:a17:907:7852:b0:aa5:1957:342d with SMTP id a640c23a62f3a-aa580ed02a6mr778902666b.11.1732878105402;
        Fri, 29 Nov 2024 03:01:45 -0800 (PST)
Message-ID: <e1b4d634-da27-4855-bee1-8dc0797a7a1e@suse.com>
Date: Fri, 29 Nov 2024 12:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] xen/arm: Check for Static Heap feature when
 freeing resources
To: Luca Fancellu <luca.fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Chen <wei.chen@arm.com>,
 xen-devel@lists.xenproject.org
References: <20241129091237.3409304-1-luca.fancellu@arm.com>
 <20241129091237.3409304-5-luca.fancellu@arm.com>
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
In-Reply-To: <20241129091237.3409304-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.11.2024 10:12, Luca Fancellu wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -165,6 +165,11 @@
>  #define PGT_TYPE_INFO_INITIALIZER 0
>  #endif
>  
> +#ifdef CONFIG_STATIC_MEMORY
> +/* Flag saved when Xen is using the static heap feature (xen,static-heap) */
> +bool __ro_after_init static_heap;
> +#endif

I'm afraid I can't make sense of the last (parenthesized) part of the comment.
Presumably this is a DT-ism, but in a non-DT source file this then needs saying
one way or another.

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -72,6 +72,19 @@
>  
>  struct page_info;
>  
> +#ifdef CONFIG_STATIC_MEMORY
> +extern bool static_heap;
> +#endif
> +
> +static inline bool using_static_heap(void)
> +{
> +#ifdef CONFIG_STATIC_MEMORY
> +    return static_heap;
> +#else
> +    return false;
> +#endif
> +}

Or, with less #ifdef-ary (and like we do elsewhere in similar situations):

#ifdef CONFIG_STATIC_MEMORY
extern bool static_heap;
#else
#define static_heap false
#endif

static inline bool using_static_heap(void)
{
    return static_heap;
}

At which point it becomes questionable whether a wrapper function is
actually needed, and if not whether the variable itself could/should be
named using_static_heap then.

Jan

