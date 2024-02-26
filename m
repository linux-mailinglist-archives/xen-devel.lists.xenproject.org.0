Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB6B866B4F
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 08:48:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685275.1065735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reViR-0001MB-P2; Mon, 26 Feb 2024 07:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685275.1065735; Mon, 26 Feb 2024 07:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reViR-0001Jj-MQ; Mon, 26 Feb 2024 07:47:59 +0000
Received: by outflank-mailman (input) for mailman id 685275;
 Mon, 26 Feb 2024 07:47:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reViQ-0001Jd-2A
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 07:47:58 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b05cb20-d47b-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 08:47:56 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a3e550ef31cso291214166b.3
 for <xen-devel@lists.xenproject.org>; Sun, 25 Feb 2024 23:47:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 tl18-20020a170907c31200b00a437d3e975esm101078ejc.210.2024.02.25.23.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Feb 2024 23:47:56 -0800 (PST)
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
X-Inumbo-ID: 5b05cb20-d47b-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708933676; x=1709538476; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubgvHi/fNke8SNLpcolxIjm9OoEI4/HbtZuXFNgGEpw=;
        b=fwaolVc3ZezIYJ8+e4q7kNEbT3ez7+yQ+CBUvwRbzywOAYQHJ68/LIyjkjezmG1V10
         cJAUcxPaUrMTUBIbnHUIkeAGwlvUwVjnbQvQeACjaidggrDzF5YL5l3pUOFcBdEuZlS4
         gmP6zBhwXOYRbp1UTi0PQug8+kojcPyoxLJM8qrWnWJrOw8wnUwZg3sQlaQvUQ6lbHtd
         bACVlWQMt7vwoVmRsJCqqaaJgXxVOAZX8b2BcqJyJO+d8rZZD9Ef06v9md3nsw8DyBi9
         ApSCy3fKam+trmERnThr5/lIiLEXwdaZyCWyqhHcIj5Ga7AWSgfgfZAKXjl2/hxSNP+j
         EYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708933676; x=1709538476;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ubgvHi/fNke8SNLpcolxIjm9OoEI4/HbtZuXFNgGEpw=;
        b=gGRBgGZSaow1ez+jGsyk4hkhgUPMecH5jIu+QCm4biz02Pnaipk+BpwJZp/ohpVh8I
         CkvvW8m0JMbsoaYuP8zUzeidDoXYaYAuWCQKtwNYlBnq3QFRVz0nfKuy1bBWu7eDBnaI
         Q7vjXuNnSnVDgx8cozCnMIFjGzm8r2o6BO+GuepDHg2tdVt6AkeOeVWHn3IfpKe+7YzZ
         NjWF5//KQpGcBQRRtz6fO6lmwn32GLZArA93pUmxeRdkM8/b73B4kHBegCCiWafk7MbU
         IOPf2skU/n5LIlpJvEIbKAztgiu/vtjq0b+vqTCLMD+CevuCDV3wCbrupi2rgQi9Kzrg
         W9lA==
X-Forwarded-Encrypted: i=1; AJvYcCXq26AhT94LYmAh+XvQcj+6bYnd1PTkMYBoR3eof37QKJGHVuQlP4kL7i0acrqJpo4PeAuXxSg0NuGf1BghmVl9SeZRxc7V91QWZUTEcXI=
X-Gm-Message-State: AOJu0YwEgttsMzxM+x85DRwYdTT9/Qh1V83UZrWU38hvdWD3awAW7Y4C
	nQo+0o+wJnbtZ+sGkDPhjgO3MFDsL+IfDMnkmJHUrJ88/4B99Z7VD8Y2aXEfPA==
X-Google-Smtp-Source: AGHT+IHuAtwmynR1hxiZ3RodGJnTmG1kMnplqrT6Wr4OGCuxLmrqSGsLzM06YRHH/Zp38KZ6wpn/CA==
X-Received: by 2002:a17:906:fb87:b0:a43:793b:5b05 with SMTP id lr7-20020a170906fb8700b00a43793b5b05mr280562ejb.60.1708933676463;
        Sun, 25 Feb 2024 23:47:56 -0800 (PST)
Message-ID: <8f312718-dc6f-4fb5-a78c-39977921fe98@suse.com>
Date: Mon, 26 Feb 2024 08:47:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/altcall: use an union as register type for
 function parameters on clang
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Matthew Grooms <mgrooms@shrew.net>
References: <20240223130354.73936-1-roger.pau@citrix.com>
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
In-Reply-To: <20240223130354.73936-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.02.2024 14:03, Roger Pau Monne wrote:
> The current code for alternative calls uses the caller parameter types as the
> types for the register variables that serve as function parameters:
> 
> uint8_t foo;
> [...]
> alternative_call(myfunc, foo);
> 
> Would expand roughly into:
> 
> register unint8_t a1_ asm("rdi") = foo;
> register unsigned long a2_ asm("rsi");
> [...]
> asm volatile ("call *%c[addr](%%rip)"...);
> 
> However with -O2 clang will generate incorrect code, given the following
> example:
> 
> unsigned int func(uint8_t t)
> {
>     return t;
> }
> 
> static void bar(uint8_t b)
> {
>     int ret_;
>     register uint8_t di asm("rdi") = b;
>     register unsigned long si asm("rsi");
>     register unsigned long dx asm("rdx");
>     register unsigned long cx asm("rcx");
>     register unsigned long r8 asm("r8");
>     register unsigned long r9 asm("r9");
>     register unsigned long r10 asm("r10");
>     register unsigned long r11 asm("r11");
> 
>     asm volatile ( "call %c[addr]"
>                    : "+r" (di), "=r" (si), "=r" (dx),
>                      "=r" (cx), "=r" (r8), "=r" (r9),
>                      "=r" (r10), "=r" (r11), "=a" (ret_)
>                    : [addr] "i" (&(func)), "g" (func)
>                    : "memory" );
> }
> 
> void foo(unsigned int a)
> {
>     bar(a);
> }
> 
> Clang generates the following assembly code:
> 
> func:                                   # @func
>         movl    %edi, %eax
>         retq
> foo:                                    # @foo
>         callq   func
>         retq
> 
> Note the truncation of the unsigned int parameter 'a' of foo() to uint8_t when
> passed into bar() is lost.  clang doesn't zero extend the parameters in the
> callee when required, as the psABI mandates.
> 
> The above can be worked around by using an union when defining the register
> variables, so that `di` becomes:
> 
> register union {
>     uint8_t e;
>     unsigned long r;
> } di asm("rdi") = { .e = b };
> 
> Which results in following code generated for `foo()`:
> 
> foo:                                    # @foo
>         movzbl  %dil, %edi
>         callq   func
>         retq
> 
> So the truncation is not longer lost.  Apply such workaround only when built
> with clang.
> 
> Reported-by: Matthew Grooms <mgrooms@shrew.net>
> Link: https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=277200
> Link: https://github.com/llvm/llvm-project/issues/12579
> Link: https://github.com/llvm/llvm-project/issues/82598
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
in the hopes that this isn't going to bite us later.

Jan

