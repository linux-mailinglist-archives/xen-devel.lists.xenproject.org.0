Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA4B8B3074
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 08:32:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712439.1113145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0F7Z-0001ZH-PS; Fri, 26 Apr 2024 06:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712439.1113145; Fri, 26 Apr 2024 06:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0F7Z-0001Xo-Mm; Fri, 26 Apr 2024 06:31:45 +0000
Received: by outflank-mailman (input) for mailman id 712439;
 Fri, 26 Apr 2024 06:31:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s0F7Y-0001Xi-DN
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 06:31:44 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5179435-0396-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 08:31:42 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-518a3e0d2ecso2669411e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 23:31:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l18-20020a170906645200b00a55bb18e3d7sm5342383ejn.168.2024.04.25.23.31.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 23:31:41 -0700 (PDT)
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
X-Inumbo-ID: a5179435-0396-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714113102; x=1714717902; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p99WBQ/9wiZu2njHgNMl+oXSQfxyFoaK/urHQo9AY+s=;
        b=VVIQ4rQ+gvbLEYCjhtDxNwWqnGHRu7zSmkBbbjWPb/70mDPwpAeeK/Lu5CXte3B5Ky
         Zs+iCUrk/5OhhPnxCktSb3k8CdkJcJ+jE9nfn46yRPddkqGdQ9LXF8zSPyJE9Le6COlX
         y8Vv7GxzRH83geWkmxXYKw2hkHAI9Iiw5vy3pPO7ZNDmTeKUfFIea5d8G2IZqAEKgE2V
         OgeGXgc11Pgt0xtZgPBNzxKNoggsRH/KtB1uWmSOgzWCx7oneA0dkEl+KcY3Dpp3epBn
         A/2ReX0CMrsEGVt82BXn/O7zh9b0EXvRHt8zXJcIWylnoLSsIzyj+kBrdYGuCtUEJqkr
         fxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714113102; x=1714717902;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p99WBQ/9wiZu2njHgNMl+oXSQfxyFoaK/urHQo9AY+s=;
        b=X9N2mRBxGPAzGb87XHpgO5jiUTE+y0FCRo5YJEM0FW3zSTfN61Pt9/SdSMqdTvBGXL
         dUEL/QllHgP0v7aI80IlodEpF1WF0n20SJDxhsT6AmDt1mTLHtqp3fVUzdzO6JBYlInm
         FTnrZSxf48lm3i41Rjac0+WZY9d0ZR4mmFaO4Eg08N76JkLuuReNVOJEap0IbVLvdZ6S
         zRinNKpdyDUy4kXPLmV1LfF40PT2ejflzxCXo9WClxupKfR++6FDSwsOzqpOFVrrNV2q
         uHWRo70iM5+up6kRTpGH3lAVoLDVAh/k/OyUck4eK0SWQR7H3C8Tb02Ae+95JBrJF528
         hS5g==
X-Forwarded-Encrypted: i=1; AJvYcCVD6flWxj+y3zTGw+Sa1rAI+aYRJRR72BabwJNJsSKAH/GRQuwTBzE/cix6QGLLPJassjK7t9gzx6mm68EDN05s/mRQzdrPURMQ0917SBI=
X-Gm-Message-State: AOJu0Yx9NveBg13xhbB4ha83kqWv2xSpdo+WKMnmucM5DWKDkuOStfJb
	zXLWITCHTVO9frkM5C8RIh7tT93m9d1E++FbeJMIWJRF7zNLRvBkmwLPooUatQ==
X-Google-Smtp-Source: AGHT+IElteWomLSed6tz12zKION/DAJCUm+vpFT8Hx37IXBVvUzDSckkeyEujgvOw0VtHoxgpaLO3g==
X-Received: by 2002:ac2:5f67:0:b0:51c:647c:c209 with SMTP id c7-20020ac25f67000000b0051c647cc209mr1111875lfc.50.1714113101671;
        Thu, 25 Apr 2024 23:31:41 -0700 (PDT)
Message-ID: <08165a0d-d8ee-4405-ba04-e1cfb51489b4@suse.com>
Date: Fri, 26 Apr 2024 08:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/spinlock: use correct pointer
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240425204547.658536-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240425204547.658536-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.04.2024 22:45, Stewart Hildebrand wrote:
> The ->profile member is at different offsets in struct rspinlock and
> struct spinlock. When initializing the profiling bits of an rspinlock,
> an unrelated member in struct rspinlock was being overwritten, leading
> to mild havoc. Use the correct pointer.
> 
> Fixes: b053075d1a7b ("xen/spinlock: make struct lock_profile rspinlock_t aware")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -789,7 +789,11 @@ static int __init cf_check lock_prof_init(void)
>      {
>          (*q)->next = lock_profile_glb_q.elem_q;
>          lock_profile_glb_q.elem_q = *q;
> -        (*q)->ptr.lock->profile = *q;
> +
> +        if ( (*q)->is_rlock )
> +            (*q)->ptr.rlock->profile = *q;
> +        else
> +            (*q)->ptr.lock->profile = *q;
>      }
>  
>      _lock_profile_register_struct(LOCKPROF_TYPE_GLOBAL,

Just to mention it: Strictly speaking spinlock_profile_print_elem()'s

    printk("%s: addr=%p, lockval=%08x, ", data->name, data->ptr.lock, lockval);

isn't quite right either (and I would be surprised if Misra didn't have
to say something about it).

Jan

