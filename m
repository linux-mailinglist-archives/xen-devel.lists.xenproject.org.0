Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A42788CC267
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:47:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727683.1132299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mJM-0003Wx-RH; Wed, 22 May 2024 13:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727683.1132299; Wed, 22 May 2024 13:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mJM-0003V5-NW; Wed, 22 May 2024 13:47:20 +0000
Received: by outflank-mailman (input) for mailman id 727683;
 Wed, 22 May 2024 13:47:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9mJL-0002lX-KE
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:47:19 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cde0ea1c-1841-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 15:47:17 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56e47843cc7so9432688a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 06:47:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17f0dsm1777980866b.211.2024.05.22.06.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 06:47:17 -0700 (PDT)
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
X-Inumbo-ID: cde0ea1c-1841-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716385637; x=1716990437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XJYP15VwKFL3djmvZ3a+FhRBTqtbBevvFkBpnASPt7I=;
        b=T5Caaqo+23kvmFCvFH/gSgXi+NAgECsMTjJaFVH0v5gfIGgSH7S1svFKTYX2Vn+qdl
         o5udiWoSxfaxuwNgpFk/TiQK6AW1Rlyai4isYLXd6RZ7YOr90eh8iHMrmOvrekGPuKFT
         gxrhH/zVZqzr08YufO2dMxSlopz/1CQbP7iJOCevz660vWF11D1lcjSDA3jddhxpZ4F8
         ++XxLYz3FAPFtiGBqYk5vmaC8qnWM75/bfRIKvgaFj44geL+gQLnICgEXB6JMfY1XMwD
         m69mIzuU5IsP7HoTAwUuDwTi5MUHGpRuJB7BoIa4qJ6aeNV1AyTbMHyks9rRsvbJO0l0
         9swg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716385637; x=1716990437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJYP15VwKFL3djmvZ3a+FhRBTqtbBevvFkBpnASPt7I=;
        b=bRIJrdT192iHlqhoXvdANB+mtztZs7Ja0uMIiWmjniQxqhe78gmI7C3XySFrWsT10b
         rMVtUn9C/ycdLtlMCS9MrSgzbZkp1NYlE33JX+xh7O519DT+chxnygJYjvsAiZds4DhV
         ViXyjxegzW8wiTkZkzGdhY1cofJ/0NAT8wFT9XFmSGsww9r+j9IlX0tgeBQXmI/uCdOz
         Di8mNdrvuS1/MSUhWk2bEUlzRpK7Ohqlm5DcZM0XCIPrPHwfsL2P87nzVlSiwxHyrMW+
         2KeLWUwGz2y+pQRT8xjjyhLsSRMlE+OVZaWJ5f7bUd0sYIB14UX86PBcM0BG0uubWuJl
         zMwA==
X-Forwarded-Encrypted: i=1; AJvYcCU9LaMgXna8Z+haKEubg+IAsSMgOQGY7lF2v/tNu4KJdTmA5u+Bbyk++0dJCxtBS32VqLdrjkcUNPU/U8E92m9/svNn4/BGy0d5jOai0dE=
X-Gm-Message-State: AOJu0YyHafxiSLA+UtBqcYFvcW8F6MyKQJZSmuxHIL8XuV18/+Ck3qDv
	hv52H9CM/ToTZXccoxcrh71X6OgF22kQymhMAJmCdkFTq5o8M2TCBxJS8lrctw==
X-Google-Smtp-Source: AGHT+IEAZIHPi8DuEOcfh6XzYpQ2v59n46gbHda5F/OuWK3hniG4xTK9/FATj27/PHTNdZbA6XmKSA==
X-Received: by 2002:a17:906:3ad8:b0:a59:bd78:34ca with SMTP id a640c23a62f3a-a62280a1976mr146335366b.36.1716385637400;
        Wed, 22 May 2024 06:47:17 -0700 (PDT)
Message-ID: <e0f0d9e7-ab53-414a-b689-dde9a9089f5d@suse.com>
Date: Wed, 22 May 2024 15:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] x86/shadow: Introduce sh_trace_gl1e_va()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240522131703.30839-1-andrew.cooper3@citrix.com>
 <20240522131703.30839-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240522131703.30839-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.05.2024 15:17, Andrew Cooper wrote:
> trace_shadow_fixup() and trace_not_shadow_fault() both write out identical
> trace records.  Reimplement them in terms of a common sh_trace_gl1e_va().
> 
> There's no need to pack the trace record, even in the case of PAE paging.

Isn't this altering the generated trace record for the 4-level case, in
size changing from 20 to 24 bytes?

> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -1987,51 +1987,26 @@ static void sh_trace_va(uint32_t event, guest_va_t va)
>          sh_trace(event, sizeof(va), &va);
>  }
>  
> -static inline void trace_shadow_fixup(guest_l1e_t gl1e,
> -                                      guest_va_t va)
> +/* Shadow trace event with a gl1e, linear address and flags. */
> +static void sh_trace_gl1e_va(uint32_t event, guest_l1e_t gl1e, guest_va_t va)
>  {
>      if ( tb_init_done )
>      {
> -        struct __packed {
> -            /* for PAE, guest_l1e may be 64 while guest_va may be 32;
> -               so put it first for alignment sake. */
> -            guest_l1e_t gl1e;
> -            guest_va_t va;
> -            u32 flags;
> -        } d;
> -        u32 event;
> -
> -        event = TRC_SHADOW_FIXUP | ((GUEST_PAGING_LEVELS-2)<<8);
> -
> -        d.gl1e = gl1e;
> -        d.va = va;
> -        d.flags = this_cpu(trace_shadow_path_flags);
> -
> -        trace(event, sizeof(d), &d);
> -    }
> -}
> -
> -static inline void trace_not_shadow_fault(guest_l1e_t gl1e,
> -                                          guest_va_t va)
> -{
> -    if ( tb_init_done )
> -    {
> -        struct __packed {
> -            /* for PAE, guest_l1e may be 64 while guest_va may be 32;
> -               so put it first for alignment sake. */
> +        struct {
> +            /*
> +             * For GUEST_PAGING_LEVELS=3 (PAE paging), guest_l1e is 64 while
> +             * guest_va is 32.  Put it first to avoid padding.
> +             */
>              guest_l1e_t gl1e;
>              guest_va_t va;
> -            u32 flags;
> -        } d;
> -        u32 event;
> -
> -        event = TRC_SHADOW_NOT_SHADOW | ((GUEST_PAGING_LEVELS-2)<<8);
> -
> -        d.gl1e = gl1e;
> -        d.va = va;
> -        d.flags = this_cpu(trace_shadow_path_flags);
> -
> -        trace(event, sizeof(d), &d);
> +            uint32_t flags;
> +        } d = {
> +            .gl1e = gl1e,
> +            .va = va,
> +            .flags = this_cpu(trace_shadow_path_flags),
> +        };
> +
> +        sh_trace(event, sizeof(d), &d);
>      }
>  }

Unlike in patch 1, it's less clear here whether leaving the tb_init_done
check is actually better to keep where it is. In principle the compiler
should be able to re-arrange code enough to make it identical no matter
which way it's written, at which point it might again be more desirable
to have the check solely in sh_trace().

Jan

