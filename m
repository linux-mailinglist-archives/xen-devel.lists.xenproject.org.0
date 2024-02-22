Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6B785F5D3
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 11:33:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684316.1064083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd6NI-0008S0-OJ; Thu, 22 Feb 2024 10:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684316.1064083; Thu, 22 Feb 2024 10:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd6NI-0008QX-LI; Thu, 22 Feb 2024 10:32:20 +0000
Received: by outflank-mailman (input) for mailman id 684316;
 Thu, 22 Feb 2024 10:32:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rd6NH-0008QR-Rj
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 10:32:19 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a647c878-d16d-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 11:32:16 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a3d01a9a9a2so156913366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 02:32:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jj12-20020a170907984c00b00a3e64bcd2c1sm4610852ejc.142.2024.02.22.02.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 02:32:15 -0800 (PST)
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
X-Inumbo-ID: a647c878-d16d-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708597936; x=1709202736; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lOjwQD/mvtqgt+BJpMBjKQhb7S1DGSamUJBOXm3VbCE=;
        b=QYepXBC2s4lr+f1vLOlBL2uJJ1h5NB+x94dup/Ttj9jSJ8P5kuokgwtkIKiZSxy79Y
         dUa8h95n8LTx/qIws05vXyfRwrbQLX+ElQ6l1/sldtW/95Gf9NcUqj1TUEX3arBheZFH
         x1Exluy++GyPWU62IVUnRLQEaFRyedrCswJk7xE6HjGQSHmVjalwIC4QKKQgWtBf7cm4
         D2Hg+MDzF01QUKxWfY4FsApX7l3jcQvei/qlSWphVwdEGtI1r139fo+nFB8DUK5c9Rd+
         9LXqUvZ9sDjFzbA4NE64T+89gr9OXOjZHsjbaerxD2Txz6l97e68APvXeDHkOFoEkN87
         E8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708597936; x=1709202736;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lOjwQD/mvtqgt+BJpMBjKQhb7S1DGSamUJBOXm3VbCE=;
        b=XSlHQF4jfm14pbqc8/DuZFmEc65BSFPrlGXKeFgVA24cO5INkrWJ8Z7dcSHhG4l/pO
         tDK2QKyp2K93s6uAkgCMZWsWgpc70CZea+5nY1qV+Qc8NM7BFlGYOK4Q78/YpokOgE8p
         HvfQPWcy3pRat9k8EkMJdlG+6DQVIBS81GI1PaLN7sEoo18/3i82RPvjazI40C5vCKve
         zVAk5HVzNR+Jhc3MMaJpmW2DRSOIcgo+eQQ16sRla7w0oEH7gQbY8YaOhXa1LHaJtkNS
         37CsbxLqZDnTp1MBKktJtIO38Ze2YZUc3ImXVyyaWjPu9GtfdXKT/fnzru92N3M+8d7z
         VtCw==
X-Forwarded-Encrypted: i=1; AJvYcCW1MxHGkrmWMPXIRXA3jlOwfHFU2O++X9qMeyql/EBsZeecrtwfcD4y03eST8NlHcRMqD4DIAqD3USERQHoO+SMyJ3fBw6+nnbejsrhtgM=
X-Gm-Message-State: AOJu0Yxfdy7wnbh+PPLXI19KOw2HIOUHM2idlq+ypukOVtu5AsZROP7u
	lGeFyWNPHXu3jfyWA83jLoaFdIuGhciSjwAaSr8RTqSasFOErb+iGSAZa9ISKw==
X-Google-Smtp-Source: AGHT+IFVwAs/tfw9ZhmvnHzPVQUJxPKWOEfffpywd1wLFGZfX9YZD8auVNUDMmwkvGNRFTdCWr29iQ==
X-Received: by 2002:a17:906:4f01:b0:a3f:1fd6:6474 with SMTP id t1-20020a1709064f0100b00a3f1fd66474mr4134155eju.43.1708597936257;
        Thu, 22 Feb 2024 02:32:16 -0800 (PST)
Message-ID: <c236f02c-241b-4f1d-b037-1d66a8f87d5a@suse.com>
Date: Thu, 22 Feb 2024 11:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/altcall: use an union as register type for function
 parameters
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240221170331.60605-1-roger.pau@citrix.com>
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
In-Reply-To: <20240221170331.60605-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.02.2024 18:03, Roger Pau Monne wrote:
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
> However under certain circumstances clang >= 16.0.0 with -O2 can generate
> incorrect code,

Considering that the related (wider) ABI issue looks to also be present on
Clang5, is the more specific issue here really limited to >= 16?

> given the following example:
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
> Clang generates the following code:
> 
> func:                                   # @func
>         movl    %edi, %eax
>         retq
> foo:                                    # @foo
>         callq   func
>         retq
> 
> Note the truncation of the unsigned int parameter 'a' of foo() to uint8_t when
> passed into bar() is lost.
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
> So the truncation is not longer lost.

But how do you explain this behavior? I see absolutely no reason why filling
the one union field should lead to zero-extension. If I'm not mistaken the
language allows the rest of the union to retain undefined contents. So to me
this looks like you're converting something that failed to build due to a
(presumed) bug in Clang to something that any compiler would be permitted to
translate to other than what we want.

In this context note in particular that the spec distinguishes aggregates
from unions, and the clause regarding filling unmentioned fields is limited
to aggregates:

"If there are fewer initializers in a brace-enclosed list than there are
 elements or members of an aggregate, or fewer characters in a string
 literal used to initialize an array of known size than there are elements
 in the array, the remainder of the aggregate shall be initialized
 implicitly the same as objects that have static storage duration."

Which makes sense, as a union initializer shall mention a single of the
members only anyway.

All of this of course doesn't invalidate your approach as a possible
workaround, but it then needs limiting to Clang versions where we are sure
the more strict behavior than demanded by the standard actually applies.

Jan

