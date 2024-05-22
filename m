Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E338CC282
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727715.1132348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mQy-0008Er-Lt; Wed, 22 May 2024 13:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727715.1132348; Wed, 22 May 2024 13:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mQy-0008Cn-JH; Wed, 22 May 2024 13:55:12 +0000
Received: by outflank-mailman (input) for mailman id 727715;
 Wed, 22 May 2024 13:55:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9mQx-0008Ch-9e
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:55:11 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e709f4e9-1842-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 15:55:09 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57822392a0dso2789788a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 06:55:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574eb5ec296sm11232001a12.35.2024.05.22.06.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 06:55:08 -0700 (PDT)
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
X-Inumbo-ID: e709f4e9-1842-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716386109; x=1716990909; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5VfCPRgty1hG9lABhHk5bd6u9p+3qZJD+Cfif/QAzxw=;
        b=dzWonH18rtCsOuLYpoS6yFYy96MjGwK2AimcjPRtRYpYfC07q60w9ZywB5LIjsxz5x
         47jVQFvTv72Cp3QWESCD5wJnm1U88KRWHHEEwiEyRX0FIiem4wNe5ST05RvHU88aLVOx
         FZ64cX9pL1S8Ice0lX+eoaWzDrKmRhsiQGXnMDQ9PPdUgoE+NRbOjzgUdKyyGfBdUqrU
         0mg2QYkhx4oZXizs3CYPedHgpGzt334SwqtE8BBpUL0PL5qnwGbxHEsQxODvcI/VTbSw
         8OotUu8LzeezsbbMQ3U6no0G8w4lD/V0cMEVj2Nu/c4uLZ8fxPlqkw2OVvXQwlSNnWiS
         2C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716386109; x=1716990909;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5VfCPRgty1hG9lABhHk5bd6u9p+3qZJD+Cfif/QAzxw=;
        b=pQHWvyCTqW1Ns0YRR7QRF/gFsL5MLzP/z90QzpVRpXht9cc3NxJ+L94kTR4aILAPQh
         faaW/K49jmm+G1npwTx+gg/ckrezVO/V3lZU4kD84N8ZHOd+I1owDw9WQTapcc09YbLd
         UrgMCfvypWSX5dOcWDklON1F4S/88x94PfSvhjyQm74XXC0+ERw6y5zfRcF91TPfpLan
         YBYafRiEZkNjlQUWivq4/yk9WCUu8RkuZ7FZAJbSUfK8U3bFJqy7xkZ3DV31+68r/J2L
         H6YQBnFNumLFVaVSi3iAvHBHXIjopGuZC/6E6rPkGqruJiBnUt1eknTSt2UYrqpsYmgh
         p6Cw==
X-Forwarded-Encrypted: i=1; AJvYcCU46GHSg1WFH5ToRRqsxU8f4o2RryN6O++BuR9oAb8sFFa5NKgxjncOcfKWOiRM63QyrdsahgvFYwr16ZoFPxG8gn4qMpRoqvEzoM/Cz5M=
X-Gm-Message-State: AOJu0YzESwYMFsuAB68i7XSgJ9PyiY+tknvJ7L7l4XorchFxzQ6TvM9g
	MyLp7AQmRrjUNCws1mYQJA3mchg42MoeMlYrthocW+tQxopCfLTmUEl49j4n9g==
X-Google-Smtp-Source: AGHT+IGcSAMotn3gImB5JJ5L4r0S+ZOKG7PU0LH1lDQu7hHe2JXX5HrrhOeIiNqTWJzM4vOxzFYJSQ==
X-Received: by 2002:a50:baa2:0:b0:572:a049:c4bb with SMTP id 4fb4d7f45d1cf-57832a847d9mr1316839a12.20.1716386109120;
        Wed, 22 May 2024 06:55:09 -0700 (PDT)
Message-ID: <fa825c2d-28c9-4164-828e-566caa8efc56@suse.com>
Date: Wed, 22 May 2024 15:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] x86/shadow: Rework trace_shadow_emulate_other() as
 sh_trace_gfn_va()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240522131703.30839-1-andrew.cooper3@citrix.com>
 <20240522131703.30839-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240522131703.30839-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.05.2024 15:17, Andrew Cooper wrote:
> sh_trace_gfn_va() is very similar to sh_trace_gl1e_va(), and a rather shorter
> name than trace_shadow_emulate_other().  Like sh_trace_gl1e_va(), there is no
> need to pack the trace record.

Provided record size can freely change (here for the 3-level case) without
breaking consumers, i.e. similar to patch 2.

> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -2010,29 +2010,30 @@ static void sh_trace_gl1e_va(uint32_t event, guest_l1e_t gl1e, guest_va_t va)
>      }
>  }
>  
> -static inline void trace_shadow_emulate_other(u32 event,
> -                                                 guest_va_t va,
> -                                                 gfn_t gfn)
> +/* Shadow trace event with a gfn, linear address and flags. */
> +static void sh_trace_gfn_va(uint32_t event, gfn_t gfn, guest_va_t va)
>  {
>      if ( tb_init_done )
>      {
> -        struct __packed {
> -            /* for PAE, guest_l1e may be 64 while guest_va may be 32;
> -               so put it first for alignment sake. */
> +        struct {
> +            /*
> +             * For GUEST_PAGING_LEVELS=3 (PAE paging), gfn is 64 while
> +             * guest_va is 32.  Put it first to avoid padding.
> +             */
>  #if GUEST_PAGING_LEVELS == 2
> -            u32 gfn;
> +            uint32_t gfn;
>  #else
> -            u64 gfn;
> +            uint64_t gfn;
>  #endif
>              guest_va_t va;
> -        } d;
> -
> -        event |= ((GUEST_PAGING_LEVELS-2)<<8);
> -
> -        d.gfn=gfn_x(gfn);
> -        d.va = va;
> +            uint32_t flags;
> +        } d = {
> +            .gfn = gfn_x(gfn),
> +            .va = va,
> +            .flags = this_cpu(trace_shadow_path_flags),
> +        };

There's again no function call involved here, so having tb_init_done checked
only in (inlined) sh_trace() ought to again be enough?

Jan

