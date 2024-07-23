Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C31939E92
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 12:07:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762961.1173203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWCQb-0007ng-Gz; Tue, 23 Jul 2024 10:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762961.1173203; Tue, 23 Jul 2024 10:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWCQb-0007lA-Dy; Tue, 23 Jul 2024 10:07:29 +0000
Received: by outflank-mailman (input) for mailman id 762961;
 Tue, 23 Jul 2024 10:07:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rd17=OX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWCQa-0007l4-9p
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 10:07:28 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d4281be-48db-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 12:07:27 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ef2d7d8854so23032881fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 03:07:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ccf8092da9sm8699754a91.37.2024.07.23.03.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 03:07:26 -0700 (PDT)
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
X-Inumbo-ID: 5d4281be-48db-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721729247; x=1722334047; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p74SxLq2dEWp9ZGQVN+Lvnkp8KTTjzqhjk9NmTUGt58=;
        b=C8s00kctkgfFVmxqkyVpxpcsxuRD5ajz6r8mEj/ykZPC4pBG+rUOE5SxVu56fjaQrM
         VWYnjMc85BLGX95R/5JqDN5KdcE108HSK/s4f46/qWGa1gFbq4ze1cg+edsvlcU56GNb
         zgJdXpcC6JVMx2yF6AUvrahFd9s4yeKq75HSe2QDMM4cY2LiieWz6Z+au/H1CdVOjwe1
         l1wDiRodzMgJ/KZWUUUlaCbqpErqcyagInEXoniVjHvRIg6NG0GVKn+n7xaWq9Nv1mq4
         AqIiYAR82c9BKQebYQPTOKwVmKSlMQVmp3yHlr9xvuafSj9HuDs/aST5znRsVqjZkaGM
         RhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721729247; x=1722334047;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p74SxLq2dEWp9ZGQVN+Lvnkp8KTTjzqhjk9NmTUGt58=;
        b=pDN/TNik3Bfdju7AQNkO2jZstUlF7rRWKcMNHFEjOhmP4nwHniDGGbb85u0nkyhajr
         rWQKU+jtwwLob/7iyCsiI9778LiSnPdocDqtJWquyEY4rg1bxDkp8icZMFekiVb1n0up
         oPeV5+cdnds04joSYOUp8zxi576flT/3gcLxXoClX/g/FwelDyg0PaYog3PlIPLNiHtC
         O6bhlim8lOn61I/Rgc0uRY6OJC3CfJaFShea2lubaZ2bSRfJpwBxYXPiHAoTwrRIyhRt
         OeaIdes64z+kS5sYLLAeiAhQKqAZjl5HVWKQHVifuDAuzFoXUWcRC5/x7G/ogZheg3HS
         Qs+A==
X-Forwarded-Encrypted: i=1; AJvYcCW+DCXgcl3NkfRQJpN92dLcTKb7fcCM/DAXzpceWSNBshX5OxS+TrkbPqq3eoPk+xgvT6N2MJkvWtYtgpQmVCXxPyGc7u0M0QitRNuFCEU=
X-Gm-Message-State: AOJu0Yyb7iRjKtbfOzXCMLn5bMSF2Mpjtpro6P+kvTuILf4aBUeM6uZM
	wxrvFGjhBW80+cIV7buvciT3TI7lfh4dRenAfX6WkSTqS2DHZdXlUQOm/0vLDw==
X-Google-Smtp-Source: AGHT+IGkYBM9ECwR7LcsuBf+IyL8oYna1/B2se7nS8kr7HptRu1RGHFB5g+m4KRfwdvK20lONG/fBw==
X-Received: by 2002:a2e:240f:0:b0:2ef:a504:65b8 with SMTP id 38308e7fff4ca-2f01ea56ec0mr13847481fa.13.1721729246579;
        Tue, 23 Jul 2024 03:07:26 -0700 (PDT)
Message-ID: <04b96cce-d2a0-4948-9db7-ee2073248472@suse.com>
Date: Tue, 23 Jul 2024 12:07:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] x86/altcall: fix clang code-gen when using
 altcall in loop constructs
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20240723093117.99487-1-roger.pau@citrix.com>
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
In-Reply-To: <20240723093117.99487-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.07.2024 11:31, Roger Pau Monne wrote:
> Yet another clang code generation issue when using altcalls.
> 
> The issue this time is with using loop constructs around alternative_{,v}call
> instances using parameter types smaller than the register size.
> 
> Given the following example code:
> 
> static void bar(bool b)
> {
>     unsigned int i;
> 
>     for ( i = 0; i < 10; i++ )
>     {
>         int ret_;
>         register union {
>             bool e;
>             unsigned long r;
>         } di asm("rdi") = { .e = b };
>         register unsigned long si asm("rsi");
>         register unsigned long dx asm("rdx");
>         register unsigned long cx asm("rcx");
>         register unsigned long r8 asm("r8");
>         register unsigned long r9 asm("r9");
>         register unsigned long r10 asm("r10");
>         register unsigned long r11 asm("r11");
> 
>         asm volatile ( "call %c[addr]"
>                        : "+r" (di), "=r" (si), "=r" (dx),
>                          "=r" (cx), "=r" (r8), "=r" (r9),
>                          "=r" (r10), "=r" (r11), "=a" (ret_)
>                        : [addr] "i" (&(func)), "g" (func)
>                        : "memory" );
>     }
> }
> 
> See: https://godbolt.org/z/qvxMGd84q
> 
> Clang will generate machine code that only resets the low 8 bits of %rdi
> between loop calls, leaving the rest of the register possibly containing
> garbage from the use of %rdi inside the called function.  Note also that clang
> doesn't truncate the input parameters at the callee, thus breaking the psABI.
> 
> Fix this by turning the `e` element in the anonymous union into an array that
> consumes the same space as an unsigned long, as this forces clang to reset the
> whole %rdi register instead of just the low 8 bits.
> 
> Fixes: 2ce562b2a413 ('x86/altcall: use a union as register type for function parameters on clang')
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



