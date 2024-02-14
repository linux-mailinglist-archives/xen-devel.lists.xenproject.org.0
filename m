Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3619854AD2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 14:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680791.1058915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFkE-000338-Eo; Wed, 14 Feb 2024 13:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680791.1058915; Wed, 14 Feb 2024 13:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFkE-00030L-Bp; Wed, 14 Feb 2024 13:56:14 +0000
Received: by outflank-mailman (input) for mailman id 680791;
 Wed, 14 Feb 2024 13:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raFkC-000309-V1
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 13:56:12 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf8c7eb2-cb40-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 14:56:11 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-411d231ea71so10654635e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 05:56:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v13-20020a05600c214d00b0040fdc7f4fcdsm2059764wml.4.2024.02.14.05.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 05:56:10 -0800 (PST)
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
X-Inumbo-ID: cf8c7eb2-cb40-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707918971; x=1708523771; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yOCG6AC8/5eWg5KRc470FQdsEV72KMeSVzBIyWoh9L8=;
        b=T1buZEVrpVapSS8OkCo0HGNIP69er+R5RE9ibEF7XZEzgG3lFDpK3IBmhogSRbpSeh
         8e1qMl4hPwuwD2LAhYyQEgXYpRlubldtXhke68y0AR1fLToctBVFeTzUu5KVFlSJfqQY
         0cAW9Bi1U1LpF+G3KavaBZwqkZTNKfQHfpr3ow8rSBuQLde5s6F00JPYlQz7hOLd8Rkg
         5yn2rwxOxbYYsxRPjTAwoUryOHOEBiH+mR1yk84T569awKetuoFBQAjbOd1/lasN/VQI
         pZN7S0MPAsCAx4hrtuWXqTBB2Z7Ln5iAzdnI54mWUBalZPTrtAkiAaKGZfZGJS+1fysH
         9BzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707918971; x=1708523771;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yOCG6AC8/5eWg5KRc470FQdsEV72KMeSVzBIyWoh9L8=;
        b=iCytT18TnECMUq9U3upRBIKvDg5FhfXoHVXYbJA8vgerfdiln0M2kj0E6N4HimJizn
         Qrm7lsLVjHi8ya0z/rRzJ3kzGEy56fv1N2br1TLQdzfX/+kZ+ukVZcW/rx0APi8FuoPa
         yNsztzZs9vlTSQx+jAXal6/nQMJhMagqjNSjSyXqobozwswFRmI4bdmAVsctrDvc6vtS
         QTIPgDyzg14P/+cSrVLltcRnI3NWO+kWnab5oJZUJwg8RmlFcqoMZhno50TtATq3bVpM
         B8esYv/eyBl9E1pSJD801EQ4rU4uN4w70B4xaTmEQ04Pzrnmk54g4ZIv5fS8W+cOcivT
         cLow==
X-Forwarded-Encrypted: i=1; AJvYcCXMUdGmQLLnltKeBXQAg1TylJhauZi80n08d3WIPmp539M5CTc7W8TAWZL/I+0aPA9s9ycaQ5Th+6rl+k6UX8aJYFwK9lZ89qWT7sn7/SA=
X-Gm-Message-State: AOJu0YyD24JiQ5RBrBjPmmmL9ivOVKVFpa+WIQ7OiM5OfhmFA3zXc7tS
	uQfXLCE0VziuvGL0TcVFEQ5xeAfoWuV0EV+KrsdvsjyvkjnFuAIpKnY3Fif+5g==
X-Google-Smtp-Source: AGHT+IEIyO2SrYHZETCq+nEvS/fJ82llkSjE6Vc1sYeaP1vTJsUvR3NkDey+VH8BvnWwWeGLm2J7YQ==
X-Received: by 2002:a05:600c:1383:b0:410:adc2:6d1c with SMTP id u3-20020a05600c138300b00410adc26d1cmr2415233wmf.12.1707918971186;
        Wed, 14 Feb 2024 05:56:11 -0800 (PST)
Message-ID: <d3de481d-bb66-4ee2-8805-d5ded203d8c5@suse.com>
Date: Wed, 14 Feb 2024 14:56:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Reduce assembly code size of exception entry points
Content-Language: en-US
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20240214103558.13655-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240214103558.13655-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.02.2024 11:35, Frediano Ziglio wrote:
> We just pushed a 8-bytes zero

This part is now somewhat stale.

> and exception constants are
> small so we can just write a single byte saving 3 bytes for
> instruction.
> With ENDBR64 this reduces the size of many entry points from 32 to
> 16 bytes (due to alignment).
> Similar code is already used in autogen_stubs.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> --
> v2:
> - added missing entry points;

What about entry_int82?

> @@ -653,7 +653,7 @@ END(ret_from_intr)
>          .section .init.text, "ax", @progbits
>  FUNC(early_page_fault)
>          ENDBR64
> -        movl  $X86_EXC_PF, 4(%rsp)
> +        movb  $X86_EXC_PF, 4(%rsp)
>          SAVE_ALL
>          movq  %rsp, %rdi
>          call  do_early_page_fault

Between this and the next hunk there's also entry_PF.

Jan

> @@ -898,105 +898,105 @@ END(handle_exception)
>  FUNC(entry_DE)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_DE, 4(%rsp)
> +        movb  $X86_EXC_DE, 4(%rsp)
>          jmp   handle_exception
>  END(entry_DE)
>  
>  FUNC(entry_MF)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_MF, 4(%rsp)
> +        movb  $X86_EXC_MF, 4(%rsp)
>          jmp   handle_exception
>  END(entry_MF)
>  
>  FUNC(entry_XM)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_XM, 4(%rsp)
> +        movb  $X86_EXC_XM, 4(%rsp)
>          jmp   handle_exception
>  END(entry_XM)
>  
>  FUNC(entry_NM)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_NM, 4(%rsp)
> +        movb  $X86_EXC_NM, 4(%rsp)
>          jmp   handle_exception
>  END(entry_NM)
>  
>  FUNC(entry_DB)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_DB, 4(%rsp)
> +        movb  $X86_EXC_DB, 4(%rsp)
>          jmp   handle_ist_exception
>  END(entry_DB)
>  
>  FUNC(entry_BP)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_BP, 4(%rsp)
> +        movb  $X86_EXC_BP, 4(%rsp)
>          jmp   handle_exception
>  END(entry_BP)
>  
>  FUNC(entry_OF)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_OF, 4(%rsp)
> +        movb  $X86_EXC_OF, 4(%rsp)
>          jmp   handle_exception
>  END(entry_OF)
>  
>  FUNC(entry_BR)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_BR, 4(%rsp)
> +        movb  $X86_EXC_BR, 4(%rsp)
>          jmp   handle_exception
>  END(entry_BR)
>  
>  FUNC(entry_UD)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_UD, 4(%rsp)
> +        movb  $X86_EXC_UD, 4(%rsp)
>          jmp   handle_exception
>  END(entry_UD)
>  
>  FUNC(entry_TS)
>          ENDBR64
> -        movl  $X86_EXC_TS, 4(%rsp)
> +        movb  $X86_EXC_TS, 4(%rsp)
>          jmp   handle_exception
>  END(entry_TS)
>  
>  FUNC(entry_NP)
>          ENDBR64
> -        movl  $X86_EXC_NP, 4(%rsp)
> +        movb  $X86_EXC_NP, 4(%rsp)
>          jmp   handle_exception
>  END(entry_NP)
>  
>  FUNC(entry_SS)
>          ENDBR64
> -        movl  $X86_EXC_SS, 4(%rsp)
> +        movb  $X86_EXC_SS, 4(%rsp)
>          jmp   handle_exception
>  END(entry_SS)
>  
>  FUNC(entry_GP)
>          ENDBR64
> -        movl  $X86_EXC_GP, 4(%rsp)
> +        movb  $X86_EXC_GP, 4(%rsp)
>          jmp   handle_exception
>  END(entry_GP)
>  
>  FUNC(entry_AC)
>          ENDBR64
> -        movl  $X86_EXC_AC, 4(%rsp)
> +        movb  $X86_EXC_AC, 4(%rsp)
>          jmp   handle_exception
>  END(entry_AC)
>  
>  FUNC(entry_CP)
>          ENDBR64
> -        movl  $X86_EXC_CP, 4(%rsp)
> +        movb  $X86_EXC_CP, 4(%rsp)
>          jmp   handle_exception
>  END(entry_CP)
>  
>  FUNC(entry_DF)
>          ENDBR64
> -        movl  $X86_EXC_DF, 4(%rsp)
> +        movb  $X86_EXC_DF, 4(%rsp)
>          /* Set AC to reduce chance of further SMAP faults */
>          ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
>          SAVE_ALL
> @@ -1022,7 +1022,7 @@ END(entry_DF)
>  FUNC(entry_NMI)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_NMI, 4(%rsp)
> +        movb  $X86_EXC_NMI, 4(%rsp)
>  END(entry_NMI)
>  
>  FUNC(handle_ist_exception)
> @@ -1158,7 +1158,7 @@ END(handle_ist_exception)
>  FUNC(entry_MC)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_MC, 4(%rsp)
> +        movb  $X86_EXC_MC, 4(%rsp)
>          jmp   handle_ist_exception
>  END(entry_MC)
>  


