Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBEB904F0E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 11:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739045.1145957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHK9F-0005Kn-NV; Wed, 12 Jun 2024 09:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739045.1145957; Wed, 12 Jun 2024 09:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHK9F-0005JQ-JN; Wed, 12 Jun 2024 09:20:05 +0000
Received: by outflank-mailman (input) for mailman id 739045;
 Wed, 12 Jun 2024 09:20:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHK9E-00052r-TB
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 09:20:04 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f26bb629-289c-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 11:20:02 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6efae34c83so498022966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 02:20:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6e98f12e9bsm678174766b.32.2024.06.12.02.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 02:20:01 -0700 (PDT)
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
X-Inumbo-ID: f26bb629-289c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718184001; x=1718788801; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjPtJtdKfEGZMCprJaHEP/yb+AHta6yT2Oa6Q0eFdWs=;
        b=VHbwfyDxcxgDDGT1vjtIsOyzEZ9yFOEzVaMhApYBwnpnjakQXt4DzsmcXT0cvLsU/B
         qM6p27AJ/0dL8JOnyoMh0U5ONfBZG6c6cQhVSEIsLOac31E/qUiiXjQnFGNraHFY9X3e
         Kq5Phwu+5BXqLbSoD2/jYuIw/Uq5IXH26Z/Y77BRhALzik4bThXU3TZIukVQY9zXJoY+
         68c9n6wsLHqtMtYrhwk34fRBdqeabd7k0gGwG8mK1F1z/vSfhlKnlbsKsaPQQKyyMxqd
         ROj5iwRT3Rb0pIaq2/uLrWl77dwIovQ0I64yYtV/jebJPPf+jupck7aVtxLJ6zR5G+Ni
         EwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718184001; x=1718788801;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjPtJtdKfEGZMCprJaHEP/yb+AHta6yT2Oa6Q0eFdWs=;
        b=aeZvuPU3ifMaBZAEezSOLtQ0IgGaZSxi/pY8Qf9fuKgNSp0oQ5kPgLQ3sgw2I07eao
         1LGh0WjAQPapko46fNxgkOe0x3wqtZVtNzsqJcHJizzEJqb2ha/noN+0HHUaxTEjbL5+
         x9QmDzmN1EjNhzDUsIUbzz111uSkXWQVWuBv45VuhutqAExeJ9yf8Jz+HiZxIzX2TSHr
         CsNba1reQMkUvJWxX9ucYUpaDBC5a6bstiMz1dUPW0scLJhl6gIpODX+TLaMFKm4FNIw
         yTN4XJQkOS41ymurKOnQ639hMEn42Dadx/RHbU1pDQNO/ozcziziNYnB1U6EEtHJ3RPK
         T25w==
X-Forwarded-Encrypted: i=1; AJvYcCWyRNkvK7sZ03jP0S92vUChTp4yLDNbtFQGJzTgFsKtyGC9z2AiucCULArsDsB0zgKo3UEqK8JM5ZuinwShWE500K/EVnpXC0ZguU0hQEM=
X-Gm-Message-State: AOJu0YyrhYrxm8ONU6Dh5ZWVVjembVmwg5w6t4D7OiMZXbWZG7coJ6DR
	N+yFKjTR7SWAzAbeXTM5onVeYPvmN3JF50mFHIjYYqwEq24SVabBe8CQdX4w3Q==
X-Google-Smtp-Source: AGHT+IFFWK9MQfbx7X21PlkLm3NcgcqnjRfqQuEQLYahWkU9M82MIH59IFiU54tY/AizM4h0607fCw==
X-Received: by 2002:a17:906:d8ae:b0:a6f:4be5:a661 with SMTP id a640c23a62f3a-a6f4be5a7c1mr36197666b.46.1718184001244;
        Wed, 12 Jun 2024 02:20:01 -0700 (PDT)
Message-ID: <12ce10af-cd36-492e-a73b-2b81b5bf60cc@suse.com>
Date: Wed, 12 Jun 2024 11:19:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/6] x86emul: address violations of MISRA C Rule 20.7
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1718117557.git.nicola.vetrini@bugseng.com>
 <0a502d2a9c5ce13be13281d9de49d263313b7852.1718117557.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <0a502d2a9c5ce13be13281d9de49d263313b7852.1718117557.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.06.2024 17:53, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> These local helpers could in principle be deviated, but the readability
> and functionality are essentially unchanged by complying with the rule,
> so I decided to modify the macro definition as the preferred option.

Well, yes, but ...

> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -2255,7 +2255,7 @@ x86_emulate(
>          switch ( modrm_reg & 7 )
>          {
>  #define GRP2(name, ext) \
> -        case ext: \
> +        case (ext): \
>              if ( ops->rmw && dst.type == OP_MEM ) \
>                  state->rmw = rmw_##name; \
>              else \
> @@ -8611,7 +8611,7 @@ int x86_emul_rmw(
>              unsigned long dummy;
>  
>  #define XADD(sz, cst, mod) \
> -        case sz: \
> +        case (sz): \
>              asm ( "" \
>                    COND_LOCK(xadd) " %"#mod"[reg], %[mem]; " \
>                    _POST_EFLAGS("[efl]", "[msk]", "[tmp]") \

... this is really nitpicky of the rule / tool. What halfway realistic
ways do you see to actually misuse these macros? What follows the "case"
keyword is just an expression; no precedence related issues are possible.

Jan

