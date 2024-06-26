Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 639A0917C5C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 11:24:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748571.1156319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOsd-0003AQ-UG; Wed, 26 Jun 2024 09:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748571.1156319; Wed, 26 Jun 2024 09:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOsd-00038v-Py; Wed, 26 Jun 2024 09:23:55 +0000
Received: by outflank-mailman (input) for mailman id 748571;
 Wed, 26 Jun 2024 09:23:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMOsc-00038p-WF
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 09:23:55 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdb9260d-339d-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 11:23:52 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ec002caf3eso96666991fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 02:23:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c8d8066732sm1171601a91.28.2024.06.26.02.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 02:23:51 -0700 (PDT)
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
X-Inumbo-ID: cdb9260d-339d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719393832; x=1719998632; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GPWkw+A0QweIEbEC9yzQBkX2k6VTxaQwM232yNcOUsA=;
        b=DxhZfDcftYbbDvNRSFnhD6HNCCvWf0ZZgTOeGxNCCbIZUq0sbafrl0zMFQKIRLQCPF
         sC6BlTGIZuxwKQh9/rl0jVtxlXbpABVJ6YqNmYGwnFudiCO96q7v5/RdP5oFaUrW+xdq
         cQCRJNitU2++Rkw+Q2xRw2rrE5/wiLSzzIgjv+b9wzdJg6FUU2KYav8xfcOi8mC7/kW9
         gUZ7YYK6cWUzddET4OXaneBB7kXMiZpQr2FAErImZTKmKJPIa7Cr7hr8FTLlzpY/j0FQ
         SGmQH3BDszh67BAzFC2V0KKvOesaNAgQMtLHF4+RrXPvVj8KYNY4RUjHLj8/X+n7x6k4
         z0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719393832; x=1719998632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPWkw+A0QweIEbEC9yzQBkX2k6VTxaQwM232yNcOUsA=;
        b=l0Xmz+Mu1fHbWjQ5qcocRPmM3NKcPRkl+FBqAMLzjkI8XFFpFiaNYaxyzIXE5Vcn8g
         ECen1RinwOvsc5BN5FEu3jw1B0myuj2A4basMoUSk84l3uvh/7GVj+ZMit302S0bLMl7
         VRv4eRBfLYvZZoYvbhryiz2o10uZ37Gyduv90aDxLFr/lM0bUl83fggLwmlVLS0/vzWi
         tl1qSrsdksXDnh13iF4LGLynxC1rw8igRCwpHzg2UNNSY5ICQAKI/E8ouhBWizAy6TD2
         5JbiMyHQu77wH/Tj98ejACMSJNzwVGwD45WqD6UZcssvwky/ddfYe1qJ6VmA8F4bZuoi
         iXrA==
X-Forwarded-Encrypted: i=1; AJvYcCUbEfCYO4pHTEHc5yfoL40zPxmUjw0iPh7fKfFir8iTR39da+mL3xIsl6lzuuY+WKByJNp1LCz2SuL0uYY4pYSQ0EAp3mHEvGJhK4u0LE8=
X-Gm-Message-State: AOJu0YxvvNjoHQReND8HA6hrLIkSho+D+qsPf8hIGH8dvffLA8QT8WKq
	oY3nnQlasJ/tpU8fPCmyi3AyQ9/FH1r6Xvdyys92rBxrro/FnLTFLCiAXyCqOg==
X-Google-Smtp-Source: AGHT+IGu80i2Hef2sO1jyd17JWBRJVn3fEU4adxiU4rbmi0dnfMyWsF6mr3pF3xxzzxak+nexY5t3w==
X-Received: by 2002:a2e:7310:0:b0:2ec:165a:224d with SMTP id 38308e7fff4ca-2ec5b31d131mr73324551fa.38.1719393832133;
        Wed, 26 Jun 2024 02:23:52 -0700 (PDT)
Message-ID: <1fe765d7-65c4-4f04-8835-327a0b623010@suse.com>
Date: Wed, 26 Jun 2024 11:23:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? 3/6] xen/macros: Introduce BUILD_ERROR()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
 <20240625190719.788643-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240625190719.788643-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 21:07, Andrew Cooper wrote:
> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -59,6 +59,8 @@
>  #define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
>  #endif
>  
> +#define BUILD_ERROR(msg) asm ( ".error \"" msg "\"" )

I think this wants a comment, and one even beyond what is said for
BUILD_BUG_ON(). This is primarily to make clear to people when to use
which, i.e. I consider it important to mention here that it is intended
for code which, in the normal case, we expect to be DCE-d. The nature
of the condition used is also a relevant factor, as in some cases
BUILD_BUG_ON() simply cannot be used because something that really is
compile time constant isn't an integer constant expression. With
something to this effect:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

I have another question / suggestion, though.

> --- a/xen/include/xen/self-tests.h
> +++ b/xen/include/xen/self-tests.h
> @@ -22,9 +22,9 @@
>          typeof(fn(val)) real = fn(val);                                 \
>                                                                          \
>          if ( !__builtin_constant_p(real) )                              \
> -            asm ( ".error \"'" STR(fn(val)) "' not compile-time constant\"" ); \
> +            BUILD_ERROR("'" STR(fn(val)) "' not compile-time constant"); \
>          else if ( real != res )                                         \
> -            asm ( ".error \"Compile time check '" STR(fn(val) == res) "' failed\"" ); \
> +            BUILD_ERROR("Compile time check '" STR(fn(val) == res) "' failed"); \
>      } while ( 0 )

While right here leaving the condition outside of the macro is
perhaps more natural, considering a case where there's just an if()
I wonder whether we shouldn't also (only?) have BUILD_ERROR_ON(),
better paralleling BUILD_BUG_ON():

    BUILD_ERROR_ON(!__builtin_constant_p(real),
                   "'" STR(fn(val)) "' not compile-time constant");

It then becomes questionable whether a string literal needs passing,
or whether instead the condition couldn't just be stringified while
passing to the asm():

    BUILD_ERROR_ON(!__builtin_constant_p(real));

The thing could even "return" the predicate, permitting

    if ( !BUILD_ERROR_ON(!__builtin_constant_p(real) )
        BUILD_ERROR_ON(real != res);

I realize though that there may be issues from this with unused values
being diagnosed by compiler and/or Eclair, when the "return value" is
not of interest.

I'd be fine with the respective transformation to be left for 4.20,
though. Yet of course churn-wise it would be better to get into final
shape right away.

Jan

