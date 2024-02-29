Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1E486CAA3
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 14:49:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687128.1070058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgmp-0004DH-7m; Thu, 29 Feb 2024 13:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687128.1070058; Thu, 29 Feb 2024 13:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgmp-0004Ba-4i; Thu, 29 Feb 2024 13:49:23 +0000
Received: by outflank-mailman (input) for mailman id 687128;
 Thu, 29 Feb 2024 13:49:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfgmn-0004BU-KR
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 13:49:21 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 561c55a9-d709-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 14:49:19 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a3e7f7b3d95so140875666b.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 05:49:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 pv25-20020a170907209900b00a3ee9305b02sm705750ejb.20.2024.02.29.05.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 05:49:18 -0800 (PST)
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
X-Inumbo-ID: 561c55a9-d709-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709214559; x=1709819359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tmw1rCRlcBdk+SpLJM+j+TD/uGvXzBehuhQ32pC4rsc=;
        b=Jm06GsEKQ2N8vDM/sBnI3gsupy9K8/SDhq4cuK8xMZ5z+HJs5eVSk+gR0WYHQfj3Ay
         f8/PlpsTChrYKksF5FIngCUmgsD3hDalRbDUaYsFXtFoBdF+cD4f6CB3FVJmuBbpMOYo
         2hbNNheWqrtHbQLrdwQo0tpaQ4PCIwJGyh4ceTMZIuaK9SKXH17cl/qfln7m4U8Bkyko
         GlZuNSahOYht1FJJ3Jc2eTB7JYgZy4hT+muKsh7hHmuJ1oL/R8zkTfxbQ8LLWut2vywD
         sI6VP6PzXP2XqtRYWLhGhPIhJoNGg2qDtEgXZQj2YmQDwxjWXDunFGSaCIEA8DwHn49s
         4arQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709214559; x=1709819359;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tmw1rCRlcBdk+SpLJM+j+TD/uGvXzBehuhQ32pC4rsc=;
        b=raua1tCB2sWApheOsTkJfdvyOEflipgUOPYIp3DFs1YpAJJYrGixN3lqDYizgvAvgM
         YKogL/5d2hLmW4oOTb1E1bBfeMCCTQT7iWFSxd8RknEd0RT/gmDrrsMRqvNbdusCCOec
         5wRzVgkgm7tN6fFdzO78krm7gpBj8r6CSGa6g8iRfdqtxJf4e2gUbQUcmwtzTfyUaIa6
         sHEqtTjb7W+f98j1VbEWcaI/pP/A8+PwjCj37p7/z6rcvmemXX41xxP+unexzprq7+0Z
         FNJiyzq9zMmDCGCjKcbeQB+Mq5YBZFGWHZ3XE3gkNDdnZ33i5SCLmp45SA2UV80N32Sr
         pZJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrT+cL0bsWYA6JzBcfz3f/w9tcjO0rqWoz0S85/biqTR8zcJLaS14DCOj6khk+4hXvY6U2PHLT5Y8UCLLLyRekdgZ3zpO9l7kGTMpzwQM=
X-Gm-Message-State: AOJu0Ywzl5FzBXcA3juCfJrjJKd+WR/ZgCQhhl1cUiZ3ub0FVRL8SuJ2
	u0xAukX9xoI8lYq+BOEDLnrr6q7n9ebzMsN00GlpkkOn9/nMvCW0zB1/P61dmw==
X-Google-Smtp-Source: AGHT+IG2fV8aLvsB7VYAQh101YPygnqihyfjDEkAvqylgVXyKtfgD5dNl0nuo+U5anxRapgaRMnO8g==
X-Received: by 2002:a17:906:e2d4:b0:a44:296a:5e4c with SMTP id gr20-20020a170906e2d400b00a44296a5e4cmr1592354ejb.26.1709214559103;
        Thu, 29 Feb 2024 05:49:19 -0800 (PST)
Message-ID: <d9b1a07c-d1b6-4bc1-a12f-396620ea7d24@suse.com>
Date: Thu, 29 Feb 2024 14:49:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] xen/spinlock: add explicit non-recursive locking
 functions
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-8-jgross@suse.com>
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
In-Reply-To: <20231212094725.22184-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2023 10:47, Juergen Gross wrote:
> In order to prepare a type-safe recursive spinlock structure, add
> explicitly non-recursive locking functions to be used for non-recursive
> locking of spinlocks, which are used recursively, too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
preferably with ...

> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -101,6 +101,8 @@ struct lock_profile_qhead {
>  };
>  
>  #define _LOCK_PROFILE(lockname) { .name = #lockname, .lock = &lockname, }
> +#define _RLOCK_PROFILE(lockname) { .name = #lockname, .rlock = &lockname,     \
> +    .is_rlock = 1, }

... "true" used here, ...

> @@ -133,13 +135,16 @@ struct lock_profile_qhead {
>              break;                                                            \
>          }                                                                     \
>          prof->name = #l;                                                      \
> -        prof->lock = &(s)->l;                                                 \
> +        prof->lockptr = &(s)->l;                                              \
> +        prof->is_rlock = isr;                                                 \
>          prof->next = (s)->profile_head.elem_q;                                \
>          (s)->profile_head.elem_q = prof;                                      \
>      } while( 0 )
>  
> -#define spin_lock_init_prof(s, l) __spin_lock_init_prof(s, l, spinlock_t)
> -#define rspin_lock_init_prof(s, l) __spin_lock_init_prof(s, l, rspinlock_t)
> +#define spin_lock_init_prof(s, l)                                             \
> +    __spin_lock_init_prof(s, l, lock, spinlock_t, 0)

... "false" here, ...

> +#define rspin_lock_init_prof(s, l)                                            \
> +    __spin_lock_init_prof(s, l, rlock, rspinlock_t, 1)

... "true" again here, and ...

> @@ -174,6 +179,7 @@ struct lock_profile_qhead { };
>  
>  #endif
>  
> +
>  typedef union {
>      uint32_t head_tail;
>      struct {

... definitely with this hunk dropped.

Jan

