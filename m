Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A18A74A45
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:05:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930607.1333204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty9No-0002zv-2l; Fri, 28 Mar 2025 13:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930607.1333204; Fri, 28 Mar 2025 13:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty9Nn-0002xJ-WB; Fri, 28 Mar 2025 13:04:23 +0000
Received: by outflank-mailman (input) for mailman id 930607;
 Fri, 28 Mar 2025 13:04:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hnye=WP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ty9Nm-0002xD-SU
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:04:22 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29e1ae72-0bd5-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 14:04:20 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3912baafc58so1705951f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:04:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b6588d0sm2536073f8f.7.2025.03.28.06.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 06:04:19 -0700 (PDT)
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
X-Inumbo-ID: 29e1ae72-0bd5-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743167060; x=1743771860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BZHLXK8B/PjnAgdDc8+ZhE8zBlvGgaM02nfJyklFA30=;
        b=aR1dHOROCQ0CBe8NNMrun2ZchwHdi87jip96xXACHn89mseMUOLTpyXOzDAHRVqVK5
         8WyxeaDTScAz24OdIrjDB9UiZI9h/xYQjIhgVx6URuLOenFkx2CG1+QgerSUvDg4AzgP
         D4CfD/RbF8dngWnh7jHoG3veyztk3FxjrCXKqjBTAS15DAQRZ/Ws7puGOPzPlsMb1zCM
         yGgIoMNOKDQvoeZObcFiuq430diL3FnJAzCR0ySmTPRmRaVYXVU8DQM0DiKnSdIUsWM2
         IggO5pscYGpBrtOWeBLima6KzjEj1xENTy9qI5FFVTDaYRbFOK0U9NDaVhMovZj+tAkE
         Ur5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743167060; x=1743771860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZHLXK8B/PjnAgdDc8+ZhE8zBlvGgaM02nfJyklFA30=;
        b=cFokrgiyt8sw8obLulDsm/4WdoFikyFMuZf1lYFnrrgYIDlDOfqwVeJPJzBmchSj6N
         mWQ2NOtKck4YExqy1YnTp8pT3tmTPguiDxWYvJNHbRB6sCMJ7WLwrBNTEsdFrg2+UCaX
         qoihf+VW2biMPjno+9iSO12zhwdzo0PbIk9gD1lxYD/QKeVPxRe5KXezDF4Xh1ZE1k4r
         p6nuivMYiFM+nIUqXvAXd8W+aGujlTUymmNi2NY+U5SuWNckpJF0HQ84wsJDO97HBM+h
         abXLA/mxu+mH8FgIT8KUuaHYNI1M0JRZEi/ZrnqaGlELeEQGM2oFnFWF0znBUJi7mOj4
         xOJg==
X-Forwarded-Encrypted: i=1; AJvYcCVyAgDhNxLdl691xQdWccMHG+hsl+LG+US4Ndz39i2OauhKUK1/bkv5QCyZeegJlQg3LepIdQChkq4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxvn8LJpy9xheArE8aYSVt5aTVpZpnJpNI0i2H3wfJwz7MkxML6
	iZGjvQgluuw/V1+1AOwfoh2km6Lxf0nAWjuxkscCj0E3vth3I2jYVDETozvXdw==
X-Gm-Gg: ASbGnctAmfLgzg8eCq4osGy/MfFpNnGnKRRW6RDAx7oFRUQPzuldlNwR8f0A6YxsgfE
	FwUFk/k0iPIndBD0elDXEkuxPPHGzGyPnTtlKc0H4SsGsVka1hm/KJlBHWdE5/VoyxIdXPJWCl9
	6z7a7U+bu/m5+CNBXYUfHwMbeeGjnSXACqviIk1l+EXCNM9ju8f9dPYStZfJLZuZ9bdacg2Ti3H
	WQpHEx9K/XmX/IGspqcDmqxDqzANRRHQMmLM8pUcyIsWxXQk7oBtUZL6Jo2dlQziisJLzCWgDW6
	Y5XDzjFP2Hn8zE26XjRmNX4bi3fCAEln2s2KCKW98KOiZZS+l/NQoXDAcpJ3koyAD9YnTE1tqrP
	LzttstOzmN8uuM8JQg9BmTnvBQaLtGg==
X-Google-Smtp-Source: AGHT+IE651vZxxMgK1wcA4w3CTvHXPr7HNvjFOevflMqtVGvdliQzB5NjJgktMMBHv4T6HHvzcroDw==
X-Received: by 2002:a5d:584a:0:b0:391:41c9:7a87 with SMTP id ffacd0b85a97d-39ad17988dcmr7280626f8f.51.1743167059699;
        Fri, 28 Mar 2025 06:04:19 -0700 (PDT)
Message-ID: <df7853d6-14c9-4dc6-9910-2fd735cf797c@suse.com>
Date: Fri, 28 Mar 2025 14:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen: x86: irq: use do-while loop in create_irq()
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250328121902.2134020-1-volodymyr_babchuk@epam.com>
 <20250328121902.2134020-3-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250328121902.2134020-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.03.2025 13:19, Volodymyr Babchuk wrote:
> While building xen with GCC 14.2.1 with "-fcondition-coverage" option,
> the compiler produces a false positive warning:
> 
>   arch/x86/irq.c: In function ‘create_irq’:
>   arch/x86/irq.c:281:11: error: ‘desc’ may be used uninitialized [-Werror=maybe-uninitialized]
>     281 |     ret = init_one_irq_desc(desc);
>         |           ^~~~~~~~~~~~~~~~~~~~~~~
>   arch/x86/irq.c:269:22: note: ‘desc’ was declared here
>     269 |     struct irq_desc *desc;
>         |                      ^~~~
>   cc1: all warnings being treated as errors
>   make[2]: *** [Rules.mk:252: arch/x86/irq.o] Error 1
> 
> The same behavior can be observed when building Xen with "-Og"
> optimization level. Fix this by using "do { } while" loop instead of
> "for" loop.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> Changes in v2:
> 
>  - Use do { } while loop instead of initializing desc with NULL
> ---

I'm afraid to disappoint you by saying that I liked v1 better; all it was
lacking was a comment. Such a comment is still lacking here. Without that,
someone may come and convert this back to the more normal (in this
situation) "for" loop.

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -264,15 +264,19 @@ void __init clear_irq_vector(int irq)
>  
>  int create_irq(nodeid_t node, bool grant_access)
>  {
> -    int irq, ret;
> +    int ret;
> +    int irq = nr_irqs_gsi;
>      struct irq_desc *desc;
>  
> -    for (irq = nr_irqs_gsi; irq < nr_irqs; irq++)
> +    if ( irq >= nr_irqs )
> +        return -ENOSPC;
> +
> +    do
>      {

Nit: The brace goes on the same line as the "do", just like ...

>          desc = irq_to_desc(irq);
>          if (cmpxchg(&desc->arch.used, IRQ_UNUSED, IRQ_RESERVED) == IRQ_UNUSED)
>             break;
> -    }
> +    } while ( ++irq < nr_irqs );

... it's on the same line as the "while" here.

Jan

