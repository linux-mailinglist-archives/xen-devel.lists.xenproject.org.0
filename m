Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5C59C8704
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 11:10:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836200.1252081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBWnx-00021N-Pn; Thu, 14 Nov 2024 10:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836200.1252081; Thu, 14 Nov 2024 10:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBWnx-0001zt-Mk; Thu, 14 Nov 2024 10:10:25 +0000
Received: by outflank-mailman (input) for mailman id 836200;
 Thu, 14 Nov 2024 10:10:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBWnv-0001zn-TK
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 10:10:23 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a69bf387-a270-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 11:10:18 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43168d9c6c9so4069475e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 02:10:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dac21b24sm14685735e9.40.2024.11.14.02.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 02:10:17 -0800 (PST)
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
X-Inumbo-ID: a69bf387-a270-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImE2OWJmMzg3LWEyNzAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTc5MDE4LjkwMDI0Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731579018; x=1732183818; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8dfSkGZICL1J8WfSRv2JnimtXyU3rdrWxDcbKCG938Y=;
        b=UScoZ5GLd0qHYzxyRIZn7C8GQ4wXmdsNISnNavIOGlP+8aUuc/ShyOJGPOJGMLbnCI
         M9h67QQ1RUqTDCmTy9J6hx2RgPXF1Z7lco0BNip1pZfNGYVvA5Mj0gjBFu+U74/M7dV2
         02sZO8nZB9rGKN76xEi/6nmZ5QLpoaVnV6nAjY8rAq4JSe/aw9G2JN1to96OcLuzwyMF
         ubdsvdfUSslaQR2iLlg2B1OI//SXl0IVJKGfvGf8hAAgcBIOp0hYuIsdcDbJaQLEulfC
         ETeFJKho8Fnv4T97BEht3SewfUKQH2UyTnBZEQ5QyNXuxnxcqaNj5b2KJ5PfyFDtf6Wu
         9LHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731579018; x=1732183818;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dfSkGZICL1J8WfSRv2JnimtXyU3rdrWxDcbKCG938Y=;
        b=qUqLpkMmvVI8iDCkRfYUzlQKYCnJg4dkzXiOt390yaybCtQTcx8/DtTgJDM3hosVOh
         F77POP6nb6L5Vb7nOXxjnlx0AmcM8lgOM3zu2a/2OZWCwt4BGJEpllNK9IIN2neTHKMY
         L2S/o5gn3FrsQ9alestkso46HtyPwx2N2tI79Cp5/AWZgvNFyvE7aAa2GxvXmSiLnxyt
         0/nqxVmzlGdK5cMJXmaTQvmEJFQ2JZVM8vHnsUCGCaAQ09S0w26M55otdDeqG34tSZhI
         QPJBa69bYCrTZkfKUShhElGSOK34uG4QS34txrtRzDOHhLcGGrnkSRzzr08gY1YanG4V
         evcw==
X-Forwarded-Encrypted: i=1; AJvYcCUwKLo5eTGlZj0QIKSkJpzXjvSu+HhKOzpJSh42I2GIuM/kmSnw6cwmnyuL45n4MtmRLm7s6hux1vM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywt4vZY+BgcwAssHxrp7XKd0KegsC587d6P7Qqi9vWc9CHUDt1r
	a/Cr3VqIEposOL1Uo6auhGCHNnHcZ956Z8sy+QkWt+xDVKKoRPCOyvFfsHvQWA==
X-Google-Smtp-Source: AGHT+IE+TVu3RelUzAu+3Cuj+He5kgdqiH7lNzJbcGLhnFlFMpsycsQrkFNPQtuk/9PC9qXgTWBe0g==
X-Received: by 2002:a05:600c:138a:b0:431:59ab:15cf with SMTP id 5b1f17b1804b1-432b75061c3mr207278925e9.19.1731579018227;
        Thu, 14 Nov 2024 02:10:18 -0800 (PST)
Message-ID: <3dd6042c-139c-406b-bdde-aa2c3115f73b@suse.com>
Date: Thu, 14 Nov 2024 11:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] x86/trampoline: Simplify the wakeup_stack checks
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241114090810.1961175-1-andrew.cooper3@citrix.com>
 <20241114090810.1961175-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241114090810.1961175-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2024 10:08, Andrew Cooper wrote:
> By checking that the permanent trampoline fits within 1k (at the time of
> writing, it's 0x229 bytes), we can simplify the wakeup_stack handling.
> 
> Move the setup into wakeup.S, because it's rather out of place in
> trampoline.S, and change it to a local symbol.
> 
> Drop wakeup_stack_start and WAKEUP_STACK_MIN entirely.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit:

> --- a/xen/arch/x86/boot/trampoline.S
> +++ b/xen/arch/x86/boot/trampoline.S
> @@ -156,11 +156,6 @@ GLOBAL(trampoline_xen_phys_start)
>  GLOBAL(trampoline_cpu_started)
>          .byte   0
>  
> -/* The first page of trampoline is permanent, the rest boot-time only. */
> -/* Reuse the boot trampoline on the 1st trampoline page as stack for wakeup. */
> -        .equ    wakeup_stack, trampoline_start + PAGE_SIZE
> -        .global wakeup_stack
> -
>  LABEL(trampoline_perm_end, 0)
>  
>  /* From here on early boot only. */
> diff --git a/xen/arch/x86/boot/wakeup.S b/xen/arch/x86/boot/wakeup.S
> index df5ea2445739..d53f92b02463 100644
> --- a/xen/arch/x86/boot/wakeup.S
> +++ b/xen/arch/x86/boot/wakeup.S
> @@ -1,5 +1,10 @@
>          .code16
>  
> +/* The first page of trampoline is permanent, the rest boot-time only. */
> +/* Reuse the boot logic on the first trampoline page as stack for wakeup. */
> +        .equ    wakeup_stack, trampoline_start + PAGE_SIZE
> +        .local  wakeup_stack
> +
>  #define wakesym(sym) (sym - wakeup_start)

As you move it, it would be nice for the commentary to become a single
multi-line comment rather than two single-line ones.

Jan

