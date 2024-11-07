Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8A09C0364
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 12:07:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831655.1246994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90Lg-0001G6-8O; Thu, 07 Nov 2024 11:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831655.1246994; Thu, 07 Nov 2024 11:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90Lg-0001Di-51; Thu, 07 Nov 2024 11:06:48 +0000
Received: by outflank-mailman (input) for mailman id 831655;
 Thu, 07 Nov 2024 11:06:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t90Le-0001CO-Ha
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 11:06:46 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e9d320c-9cf8-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 12:06:42 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-431616c23b5so5006045e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 03:06:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda04211sm1410723f8f.94.2024.11.07.03.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 03:06:41 -0800 (PST)
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
X-Inumbo-ID: 5e9d320c-9cf8-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmMiLCJoZWxvIjoibWFpbC13bTEteDMyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVlOWQzMjBjLTljZjgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTc3NjAyLjcwOTIzNiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730977602; x=1731582402; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nm300VYn7fhW5AekSqn0xroHoaUFuKZGC7bvr8G3deI=;
        b=SJJsF3sMe6GL5LsglERCpGauDuVr2xgeIHNDLjXjWaku7d1MMU9YMlyRDVh4XSZUpu
         YUUtkvjoF85fs0sM9S7KKgQqeCXXDlOf5R4dQJoy6Z1V01Ef7aeB4KyqL+tJRUvXUm4N
         +HO84hckEFJi+J45bFx1AwyOfpO+p1cwo+QVNdtf87rpelstsQSpY3V3oDN5bxhHXBeP
         +kbcJ72BwPjtKbCe06DfHLLL4L54fSsuNrAFFzU77hgr0I7VVlLqBqw+atIA+WAe/DrC
         NlM8zBp4v0pgi69JlsLBFRXbbXcOdXfd9xP7zvlRMkV4Mu/cQRWuia3L5tUSZCyzqdbM
         hlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730977602; x=1731582402;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nm300VYn7fhW5AekSqn0xroHoaUFuKZGC7bvr8G3deI=;
        b=lBpY54UGOtEqLxf/B2d53g/m0736UD3O/cXC8yF8n1XW3FydXipHm1h1Hjscb6c6IR
         NQReOy7du4uKu63liLWjsrVYdv4jVdHQnWXnuqPGnq0+5cB1RXPQH86p5X9mYS7EVYZU
         NYDHvJv13EqoH3Qov44/JzpTTwGZi9R8tYr21qlJwScQyU1nIvLhnQ8znjO//VJviHMx
         by6Ql3Mahsd+dFKZ35EPv63p1NNKIL4WczMbxRHXYwlG8FHLiRs6yDeebvNeWyRu+5XT
         Jo5h4NPr9SUBkzxBtBu7J0evSZcAP7X9ymagnNmKG2JAIUJmVvhwE6e5fqZrXklGVhSr
         A9vw==
X-Forwarded-Encrypted: i=1; AJvYcCXfU+1n2ZbfgG2YlGfTC1xG9MgsQez4XploibktX+bg3hhdsbtpVr2EP9S1zi+aegTX4JL0AI1s1qM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywzqy7Q2D+Zd6T2OG0R42K9C7enO3uJRwyqS1mSWSVTJBLVD523
	6GlukjH7DzpyBhrMLCsBfYuOGOZLiU46ZFaL63kjx7rQXnTGqx3wmI4siKk3ww==
X-Google-Smtp-Source: AGHT+IFLauGEXCoo3UWmPikOWruFSQf7xGo9PIoZ1gRKCPzR0JxfZX8cBOvZ1d/2JgUwQ8cuQ5z+sQ==
X-Received: by 2002:a05:600c:4ed0:b0:42c:b991:98bc with SMTP id 5b1f17b1804b1-432af279e0fmr23952555e9.0.1730977602068;
        Thu, 07 Nov 2024 03:06:42 -0800 (PST)
Message-ID: <2d11d5c6-4e87-4520-af48-844c90462620@suse.com>
Date: Thu, 7 Nov 2024 12:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] x86/mm: special case super page alignment
 detection for INVALID_MFN
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241106122927.26461-1-roger.pau@citrix.com>
 <20241106122927.26461-3-roger.pau@citrix.com>
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
In-Reply-To: <20241106122927.26461-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.11.2024 13:29, Roger Pau Monne wrote:
> --- a/xen/arch/x86/include/asm/page.h
> +++ b/xen/arch/x86/include/asm/page.h
> @@ -202,7 +202,8 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
>  
>  /* Check if an address is aligned for a given slot level. */
>  #define SLOT_IS_ALIGNED(v, m, s) \
> -    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m), (1UL << ((s) - PAGE_SHIFT)) - 1)
> +    IS_ALIGNED(PFN_DOWN(v) | (mfn_eq(m, INVALID_MFN) ? 0 : mfn_x(m)), \
> +               (1UL << ((s) - PAGE_SHIFT)) - 1)
>  #define IS_L3E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L3_PAGETABLE_SHIFT)
>  #define IS_L2E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L2_PAGETABLE_SHIFT)

With this adjustment it feels yet more important for these macros to
become local ones in x86/mm.c. This special property may not be what one
wants in the general case. And m is now also evaluated twice (really:
once or twice), which a "random" user of the macro may not like.

I'm further uncertain now that this is the way to go to address the
original issue. Notably for the 1G-mapping case it may be better to go
from the incoming flags having _PAGE_PRESENT clear. After all we can
always create non-present "large" PTEs. E.g.

        if ( (cpu_has_page1gb || !(flags & _PAGE_PRESENT)) &&
             IS_L3E_ALIGNED(virt, flags & _PAGE_PRESENT ? mfn : _mfn(0)) &&
             nr_mfns >= (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) &&
             !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )

Thoughts?

Jan

