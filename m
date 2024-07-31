Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E77894269A
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 08:26:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768231.1178998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ2ml-0000RK-1c; Wed, 31 Jul 2024 06:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768231.1178998; Wed, 31 Jul 2024 06:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ2mk-0000Oq-V0; Wed, 31 Jul 2024 06:26:06 +0000
Received: by outflank-mailman (input) for mailman id 768231;
 Wed, 31 Jul 2024 06:26:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZ2mj-0000Ob-Ex
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 06:26:05 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c31d69fc-4f05-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 08:26:04 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7a9a7af0d0so697965966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 23:26:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab23f62sm736170366b.16.2024.07.30.23.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 23:26:03 -0700 (PDT)
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
X-Inumbo-ID: c31d69fc-4f05-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722407163; x=1723011963; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JrjF6L5WcSMM40/SdRL6ldbH43TXBjMIj6JkVAnEW9Y=;
        b=Vdry2fXbWb/rY1AFnTqylOqu9LTnha3wQinWR3hY1FB+Hq5JmSNJDUQM/vBKqXHuqy
         ws9r5+qhr0eYgeohlTH7OAUlfCls6rhxhvT+evbPb6Tmgxn+B4fmaKv+UcJ2BCsyhAEo
         GBrx3at1QbXIpt8lRxrnpFVe/ycpXJgmoCFJTY+NItOcCM/ks/gTcHCwrMVDtL/BwUxB
         xnVISYjYFOW+5CZDKsh8sWjlRo5QYwvRR24XWo7YPf72T1Qg9gIDxou5qHxK4YJnLTvf
         /uoYh8fJF0qXuZai+dk0gWdmMus27zWXNHAT5LqogVzMZS11daChKsubxNn+ylamqWLP
         4I9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722407163; x=1723011963;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrjF6L5WcSMM40/SdRL6ldbH43TXBjMIj6JkVAnEW9Y=;
        b=Wf42dKVwcUWjU7ELOprIqYdQZ5l2Q1TRao/VlMpkmQx/GK2JqtWNWjCnDBsviwTN7W
         84wNi/hWQnJnO8ZanHYkI1JwTc/hXQ0UhAyiBqPKUEPmeLj28fYu3Ia24KzgpeKbBvmM
         m0BUz6QMmG95BorLcIBdCaDS45hIvL3cupwzL/p2OcPeKmjRju8oNFyOjwIyZCj5vjoO
         1YkVP5Y+MtW3Jl0fsm9qKXalx+B4UDoF3VcqvEEplKKUXb+GXz/imIh4mYog+8KKTBl1
         VCSXbUmdlmaK2lKcZ2zE6vVRvg7dZSB559V5Lw4pW9HaHjjrFrJ9DWb+UTABDL5IxZqP
         odXw==
X-Forwarded-Encrypted: i=1; AJvYcCUBpbx3AiMWPdu0gKOmaIHge9efepvPZ/1thDEcMx8sYUakCXb1izk17u604XkoNDHyq7BAZQm/AcDdOaTrPQmUbHp0DiJQkGvLoUCpKAQ=
X-Gm-Message-State: AOJu0YwY8A/baSD/GklT8ln0XZ7UAUV+RawM+E+mgQ9IhoMltcPCgQLc
	9eNLQv3YNrJBu1fSVfyaKr0t7L9617BAuOTZOeFH8rPP0DnHPuUQWVyw2tglVA==
X-Google-Smtp-Source: AGHT+IF/0hlhY07Af7abz7YRJFgToHhWyzX+ZkWoyoDi/zHTP6shIpX9qepIwUQT6wkYt7eQxhXXCg==
X-Received: by 2002:a17:906:dc8b:b0:a7a:a4be:2f98 with SMTP id a640c23a62f3a-a7d3ff7bceamr1011136466b.10.1722407163367;
        Tue, 30 Jul 2024 23:26:03 -0700 (PDT)
Message-ID: <8701cfdf-a44c-4bec-8190-7d38e8267a78@suse.com>
Date: Wed, 31 Jul 2024 08:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/altcall: further refine clang workaround
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20240730155305.49172-1-roger.pau@citrix.com>
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
In-Reply-To: <20240730155305.49172-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2024 17:53, Roger Pau Monne wrote:
> The current code in ALT_CALL_ARG() won't successfully workaround the clang
> code-generation issue if the arg parameter has a size that's not a power of 2.
> While there are no such sized parameters at the moment, improve the workaround
> to also be effective when such sizes are used.
> 
> Instead of using a union with a long use an unsigned long that's first
> initialized to 0 and afterwards set to the argument value.
> 
> Reported-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Suggested-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
Albeit if you don't mind ...

> --- a/xen/arch/x86/include/asm/alternative.h
> +++ b/xen/arch/x86/include/asm/alternative.h
> @@ -169,27 +169,25 @@ extern void alternative_branches(void);
>  
>  #ifdef CONFIG_CC_IS_CLANG
>  /*
> - * Use a union with an unsigned long in order to prevent clang from
> - * skipping a possible truncation of the value.  By using the union any
> - * truncation is carried before the call instruction, in turn covering
> - * for ABI-non-compliance in that the necessary clipping / extension of
> - * the value is supposed to be carried out in the callee.
> + * Clang doesn't follow the psABI and doesn't truncate parameter values at the
> + * callee.  This can lead to bad code being generated when using alternative
> + * calls.
>   *
> - * Note this behavior is not mandated by the standard, and hence could
> - * stop being a viable workaround, or worse, could cause a different set
> - * of code-generation issues in future clang versions.
> + * Workaround it by using a temporary intermediate variable that's zeroed
> + * before being assigned the parameter value, as that forces clang to zero the
> + * register at the caller.
>   *
>   * This has been reported upstream:
>   * https://github.com/llvm/llvm-project/issues/12579
>   * https://github.com/llvm/llvm-project/issues/82598
>   */
>  #define ALT_CALL_ARG(arg, n)                                            \
> -    register union {                                                    \
> -        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
> -        unsigned long r;                                                \
> -    } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
> -        .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
> -    }
> +    register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) = ({   \
> +        unsigned long tmp = 0;                                          \
> +        *(typeof(arg) *)&tmp = (arg);                                   \
> +        BUILD_BUG_ON(sizeof(arg) > sizeof(unsigned long));              \

... I'd like to switch around these two lines while committing.

Jan

> +        tmp;                                                            \
> +    })
>  #else
>  #define ALT_CALL_ARG(arg, n) \
>      register typeof(arg) a ## n ## _ asm ( ALT_CALL_arg ## n ) = \


