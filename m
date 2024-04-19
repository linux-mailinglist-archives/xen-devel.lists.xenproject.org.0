Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 454478AA866
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 08:25:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708740.1107824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxhgH-0004Zl-9k; Fri, 19 Apr 2024 06:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708740.1107824; Fri, 19 Apr 2024 06:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxhgH-0004YF-6n; Fri, 19 Apr 2024 06:25:05 +0000
Received: by outflank-mailman (input) for mailman id 708740;
 Fri, 19 Apr 2024 06:25:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxhgG-0004Y9-26
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 06:25:04 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d913e82-fe15-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 08:25:01 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-418e4cd2196so11776725e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 23:25:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b00418a6d62ad0sm9024206wmq.34.2024.04.18.23.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 23:25:01 -0700 (PDT)
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
X-Inumbo-ID: 8d913e82-fe15-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713507901; x=1714112701; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tfp7wn/JfpDqx1l+B05bPGx2h3PUtgGSIifLgk1vEUc=;
        b=BpHwPDEbbMWn4K67QwDmtWBBObEHAybIz8Ha80fn4F0k2m3IljdOuhVMwByZWTL+3f
         4UbskTWfto+8LOVakuNieLsgcA8qAo3R/e7zZz3IK102i8VhxLECwN9WNE2Oh9+ialRR
         ZXqcWcOOvTI1hg4fMvwe7phz7g8cyN4X3DzF9+spqIpaN8Q+A1jIeZOpnI/dlFZJDeT3
         llf8x0kQqJ0JlYF0F6IAEBujqEylR4ofo4x7BesDySOIt/nLf+HQJ8DzshQ2qjJuMxpR
         zV7uK1YPjz8lO1bZubcPWafAcGlOHwernZfb8wv8O0AFaoL6KXXXQgXzrgy06GALCbwL
         cXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713507901; x=1714112701;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfp7wn/JfpDqx1l+B05bPGx2h3PUtgGSIifLgk1vEUc=;
        b=q+nJxe3yty3S0tQ8ZigXsMuMr4kgx3ZpFd9ExYB5kL7pLha9Y8avYzFfAOdnWnUUIi
         FnvdGQoMga4GQoHkFpxDIZ0U09GUkIbNhbklOGCKWIpyxJOTNqxXGhSAK7XvJNIzmiXS
         oST2IvaEm9ZMZLbB5wmecrstGRkDuQt39m3xVVBhjLkamA0DCockMpQpUbNFLjBRjekg
         Ptnmu+AfEZLHBxxLyadBk1fmLWsqs97Y1LjP+dAhRDXXD3xR75+MnaGnRxCUvGD5jBrU
         ynwTMQHla5jGZ4CsWijCya+5fdhZHtvtbyOLgdLV6Pk0LwJ3ostwmQ0ArdyTbr9FZt2Q
         kI5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV034k/OHzj0+EMazhBX+8b+g7dR3kspzojN7C5dRAmPZeva3rLKPWisfKJXqv1H3Y5hW/pMOUnPRUVP7NRsh/J/amoDAMlHCqsW/kxBKM=
X-Gm-Message-State: AOJu0YyKhVh+cueAUtS1OaJLr8hEAFQxhKD7075bdOKXv7DGzAniqMoM
	ZFWXFSdSOiJXUf57xnxUasFBlMUKFbrd5GC6DuBCugEAsVHeYlvOuHGaDQAUKPu6qA++h3eN/J4
	=
X-Google-Smtp-Source: AGHT+IGH/1rSkM1rQD3K7yCa06JBqCTKSANJnzB1EC+QQVvxSsyKcEgN0LEtMNjAGMo7zudkBl32Zw==
X-Received: by 2002:a05:600c:444f:b0:418:e140:dae with SMTP id v15-20020a05600c444f00b00418e1400daemr705337wmn.28.1713507901348;
        Thu, 18 Apr 2024 23:25:01 -0700 (PDT)
Message-ID: <26b9cbda-4f9b-4ddf-ab27-643e6f78b076@suse.com>
Date: Fri, 19 Apr 2024 08:25:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/spec: adjust logic to logic that elides lfence
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240418155208.7771-1-roger.pau@citrix.com>
 <20240418155208.7771-3-roger.pau@citrix.com>
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
In-Reply-To: <20240418155208.7771-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.04.2024 17:52, Roger Pau Monne wrote:
> It's currently too restrictive by just checking whether there's a BHB clearing
> sequence selected.  It should instead check whether BHB clearing is used on
> entry from PV or HVM specifically.
> 
> Switch to use opt_bhb_entry_{pv,hvm} instead, and then remove cpu_has_bhb_seq
> since it no longer has any users.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Fixes: 954c983abcee ('x86/spec-ctrl: Software BHB-clearing sequences')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Except for the odd double "logic" in the title:
Reviewed-by: Jan Beulich <jbeulich@suse.com>
I can't really guess what is meant instead, so in order to possibly adjust
while committing I'll need a hint. But committing will want to wait until
Andrew has taken a look anyway, just like for patch 1.

> There (possibly) still a bit of overhead for dom0 if BHB clearing is not used
> for dom0, as Xen would still add the lfence if domUs require it.

Right, but what do you do.

> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -235,9 +235,6 @@ static inline bool boot_cpu_has(unsigned int feat)
>  #define cpu_bug_fpu_ptrs        boot_cpu_has(X86_BUG_FPU_PTRS)
>  #define cpu_bug_null_seg        boot_cpu_has(X86_BUG_NULL_SEG)
>  
> -#define cpu_has_bhb_seq        (boot_cpu_has(X86_SPEC_BHB_TSX) ||       \
> -                                boot_cpu_has(X86_SPEC_BHB_LOOPS))

Might be worth also mentioning in the description that this construct was
lacking use of X86_SPEC_BHB_LOOPS_LONG (might even warrant a 2nd Fixes:
tag).

Jan

