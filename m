Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C741CF4851
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 16:52:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195528.1513460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcmsG-00086Y-9b; Mon, 05 Jan 2026 15:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195528.1513460; Mon, 05 Jan 2026 15:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcmsG-00084p-6Y; Mon, 05 Jan 2026 15:52:04 +0000
Received: by outflank-mailman (input) for mailman id 1195528;
 Mon, 05 Jan 2026 15:52:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vcmsF-00084j-FH
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 15:52:03 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7999460c-ea4e-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 16:52:01 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43277900fb4so891912f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 07:52:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bca27603sm234937f8f.6.2026.01.05.07.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 07:52:00 -0800 (PST)
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
X-Inumbo-ID: 7999460c-ea4e-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767628321; x=1768233121; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5GBBwsA4/MhDc4ro2F+Qm/pUvbzErcSrA6GY4MVFwfs=;
        b=b51x9XbWRJFZJ6fuJQ60kN7o/JefkVqS4x0nmX9d0i1ExThWg3SOv6Ow8FB4mmm50V
         TCJbLhVV/ynpRLbHFqgZAIvre3OGqUQIiFzylBzYouRn113W5Quc+NlmqyLIZ86YZqiQ
         i77Nok4BSqkW5fkROKAgWL/NmY60Y6rTqp95wHTh3EPPN8vpHFL1kOqHiM5VFhURE6kK
         S/TxYCy+xy7wWG1Xi7mA/13MG7BDgztYKkt2+SB/oF0+xrpLVa1siZ0ZL+BF3gxLoeYN
         FmT+qqeezibB+ytNDNYSh/UIUGPDICQplwhKM0IiREc3js5sEdCqjEh49nNA0/b64bIY
         z6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767628321; x=1768233121;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GBBwsA4/MhDc4ro2F+Qm/pUvbzErcSrA6GY4MVFwfs=;
        b=h/cy3FnqwBexb/CIj7hLLZjngUJ9W9oUWWQKat+nvD2G3ITAqaxR7v7vhrZ9EXItuO
         R0jyMD0ee6mqvQPqWWlFoRHrogxb2Qhquly1VT6WYVN8CDGbZyopgPhTekDilA9/yiFd
         K2YunvtXwptNqRgzlYPsMdWLkyAw8tmKXR+QV+K78vjvMCOJVUaPntcINm123uXGYCeQ
         IB/rXRKJX8ZeqzAM+RM/ry5yJGoMycdM+luAA1pNqDcm437sp+ZzrtPoVvZM8YXpoptC
         swQ3peBs+6TJ6MTY1qbbHqHWBOMTEtEmM2w3p5KRFs9PXnxy4Qc+6rZe6uEOnZXKmkD5
         x2Eg==
X-Forwarded-Encrypted: i=1; AJvYcCX0ILiyqIx/LYIatYSXIyiMxYTJmBxo8ufObQWfwd1Pnf89NTPLm7XEJQeZPzeJry4mHanAsp9NfcI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygM/H6so05cNRfSUB49kLmVJBgSUT5LRsnDjBJva+vaMm8c62O
	riGg+GgIio5Kb1/exCWAGlLE0O7teyipjbFuRtAgrxphKqOHobDBJkIXgaYVhgrD8g==
X-Gm-Gg: AY/fxX6teFBDeI4K+eaf8UjDzJB/HQrEvu/MvFlvObULlhIQzgsE1WAL80nULAcSfk4
	6TmxFY6D+cdlUkyV1AddUVZIpTozZ/qLAJlclr4dv1ljsXqzR/5YW4sqURCR8pKx74JmYCIuctE
	pNqYrqYQB+3VXgmQRSNPyXdZs1TQoONY/mTaBD23qWX6nFjRslyUuE7dpNaf5B4JVs5/UrsDapx
	KBVtbw/MYx6ZL3Gjw45JB46V+LRd1gTBuQ9KA2axRwsjq5/A+gg6FsKuf1XsygGbdsqovLVKM/2
	Se+LeftMh3ieR+kpsxG0xkyuewU5swH+b7Wj2He6wBYumZAvdWE86CgKykDiuYfd7gWbyH5YCWo
	VNTtr14tEXFQt3AANGS7ekDy2ExfwHuKLkkN3nio9xYmyiGcWJRubvMqhHmi2a4H8jax6BS6403
	8ki7cYfkVIHcrxeoBtdhyubUQIg7rltPDHp4dcMOMuEch1RfFkw6+aOMjxs9bbPDd7fcOB7S9AT
	WI=
X-Google-Smtp-Source: AGHT+IEMyNRObhYzSbz+PCesMqEiMiXAWNK+ovyNYDL70lk3k3QXYC+TtbWmmBsLxVWIS486sJpwIg==
X-Received: by 2002:a05:6000:2312:b0:431:4ee:1f4e with SMTP id ffacd0b85a97d-432aa3f8464mr12158082f8f.11.1767628321222;
        Mon, 05 Jan 2026 07:52:01 -0800 (PST)
Message-ID: <662888ee-e983-4194-b8ca-f28560881c29@suse.com>
Date: Mon, 5 Jan 2026 16:52:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/i387: Rework fpu_fxrstor() given a newer
 toolchain baseline
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
 <20251230135427.188440-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251230135427.188440-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.12.2025 14:54, Andrew Cooper wrote:
> Use asm goto rather than hiding a memset() in the fixup section.  With the
> compiler now able to see the write into fpu_ctxt (as opposed to the asm
> constraint erroneously stating it as input-only), it validly objects to the
> pointer being const.
> 
> While FXRSTOR oughtn't to fault on an all-zeros input, avoid a risk of an
> infinite loop entirely by using a fixup scheme similar to xrstor(), and
> crashing the domain if we run out options.

Question being - does ...

> --- a/xen/arch/x86/i387.c
> +++ b/xen/arch/x86/i387.c
> @@ -38,7 +38,8 @@ static inline void fpu_xrstor(struct vcpu *v, uint64_t mask)
>  /* Restore x87 FPU, MMX, SSE and SSE2 state */
>  static inline void fpu_fxrstor(struct vcpu *v)
>  {
> -    const fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
> +    fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
> +    unsigned int faults = 0;
>  
>      /*
>       * Some CPUs don't save/restore FDP/FIP/FOP unless an exception
> @@ -59,49 +60,41 @@ static inline void fpu_fxrstor(struct vcpu *v)
>       * possibility, which may occur if the block was passed to us by control
>       * tools or through VCPUOP_initialise, by silently clearing the block.
>       */
> + retry:
>      switch ( __builtin_expect(fpu_ctxt->x[FPU_WORD_SIZE_OFFSET], 8) )
>      {
>      default:
> -        asm_inline volatile (
> +        asm_inline volatile goto (
>              "1: fxrstorq %0\n"
> -            ".section .fixup,\"ax\"   \n"
> -            "2: push %%"__OP"ax       \n"
> -            "   push %%"__OP"cx       \n"
> -            "   push %%"__OP"di       \n"
> -            "   lea  %0,%%"__OP"di    \n"
> -            "   mov  %1,%%ecx         \n"
> -            "   xor  %%eax,%%eax      \n"
> -            "   rep ; stosl           \n"
> -            "   pop  %%"__OP"di       \n"
> -            "   pop  %%"__OP"cx       \n"
> -            "   pop  %%"__OP"ax       \n"
> -            "   jmp  1b               \n"
> -            ".previous                \n"
> -            _ASM_EXTABLE(1b, 2b)
> -            :
> -            : "m" (*fpu_ctxt), "i" (sizeof(*fpu_ctxt) / 4) );
> +            _ASM_EXTABLE(1b, %l[fault])
> +            :: "m" (*fpu_ctxt)
> +            :: fault );
>          break;
> +
>      case 4: case 2:
> -        asm_inline volatile (
> -            "1: fxrstor %0         \n"
> -            ".section .fixup,\"ax\"\n"
> -            "2: push %%"__OP"ax    \n"
> -            "   push %%"__OP"cx    \n"
> -            "   push %%"__OP"di    \n"
> -            "   lea  %0,%%"__OP"di \n"
> -            "   mov  %1,%%ecx      \n"
> -            "   xor  %%eax,%%eax   \n"
> -            "   rep ; stosl        \n"
> -            "   pop  %%"__OP"di    \n"
> -            "   pop  %%"__OP"cx    \n"
> -            "   pop  %%"__OP"ax    \n"
> -            "   jmp  1b            \n"
> -            ".previous             \n"
> -            _ASM_EXTABLE(1b, 2b)
> -            :
> -            : "m" (*fpu_ctxt), "i" (sizeof(*fpu_ctxt) / 4) );
> +        asm_inline volatile goto (
> +            "1: fxrstor %0\n"
> +            _ASM_EXTABLE(1b, %l[fault])
> +            :: "m" (*fpu_ctxt)
> +            :: fault );
>          break;
>      }
> +
> +    return;
> +
> + fault:
> +    faults++;
> +
> +    switch ( faults )
> +    {
> +    case 1: /* Stage 1: Reset all state. */
> +        memset(fpu_ctxt, 0, sizeof(*fpu_ctxt));
> +        goto retry;
> +
> +    default: /* Stage 2: Nothing else to do. */
> +        domain_crash(v->domain, "Uncorrectable FXRSTOR fault\n");
> +        return;

... this then count as unreachable and/or dead code in Misra's terms? Nicola?
Sure, Eclair wouldn't be able to spot it, but that's no excuse imo.

Jan

