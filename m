Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC9ABE408C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 16:55:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144550.1477915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9PNW-0006Is-HF; Thu, 16 Oct 2025 14:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144550.1477915; Thu, 16 Oct 2025 14:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9PNW-0006Gf-Ec; Thu, 16 Oct 2025 14:54:54 +0000
Received: by outflank-mailman (input) for mailman id 1144550;
 Thu, 16 Oct 2025 14:54:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9PNU-0006GZ-JA
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 14:54:52 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ecd8810-aaa0-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 16:54:47 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e5980471eso7047355e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 07:54:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426feeb7441sm4682627f8f.43.2025.10.16.07.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 07:54:46 -0700 (PDT)
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
X-Inumbo-ID: 0ecd8810-aaa0-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760626486; x=1761231286; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9eBdTmKsmwLUXo2wo+GgjjgvZUHK8lSBHQL0560hrzU=;
        b=MHHUWClvglAn7TWx2P9Q2kGJaoBjIi96DNfytEie+wcBIOb8Ju7MFGnEuaPpYTkb/z
         X6rBtnWbYe0ENqb/Y1AkQmdvCzeJvaFj/MSpiPzRqFzl6PID2upRrjmseBUa5qwW56FP
         RfALH3HZyoMvqbYrNmDuR0nFkQOhfZJLwlevnl+qDQnQv2ro8sfTBJTIptotKsqt2HyW
         +QIBPAc+pRcyhwqJd8utkn3w50tPMIn2jIrLIbs5rS7qgggs+WN+7oDiIL5WsKgjIvru
         2xi1eGdUqp6/BF1VHbqcMcq6c+mZB125727QlUf4X1P92l2KTzv17KFvJbo8yaFN+zzE
         wBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760626486; x=1761231286;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eBdTmKsmwLUXo2wo+GgjjgvZUHK8lSBHQL0560hrzU=;
        b=CRQdbSHJdndZNb0digxtSfsCYgqmdcuzwGtpD+IE0bZSByg7roOF7X/iXZcx5vgtLT
         sOSco7wsOLOaoclsoNm1adbwke2t1PwcBmtgVxt2cEcoJfbKvq3t9psPCmQ8ZDRQHfMX
         BjhASomRgJ3LcBLhrPq4EuTmqaTgCrdraWIsf53z0JXw2uQ27diTgUtlMcttoDwrwyjE
         kPw1HW1lPp8I+iFtP38EMtFulpvrY9nXK8rS8BgCayLHWPA7Jm9J18A8k+1sOHIGr1Xb
         G642rdtHBA8nGSBCtUMpu6F36X28UdyaFgVU7zoribI3/JMq5ugaB+73b51v4xVNvEhZ
         jxcg==
X-Forwarded-Encrypted: i=1; AJvYcCVxFYcakRi6tDXwoKoJbygF1VKq+DXQELu8PuPOf2QiXhcsswqjMYxYHOEMRDElbzjPAUEhBtw1sIQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrJ5Z8WJMMkqKCdrZfzx4gH1/Z4gvy8fMPcZ3fOKaZ8/fuaiz9
	BhRj7lCUW+p2zYCPTJSpURfUlUb6rJlbFQ+21ASKTEHpaFu4soSgwMK1Us2cEmGJVg==
X-Gm-Gg: ASbGncs98mMdvLX2TaeKwconVqrKwMNzuvFuzoETcLNwQog89r3Cp/ojzC9vf6eq9RE
	7X3ROLL82IMm3CCaFMpocrz4XsI393dGqtrl1ugYAqiSmfhEX2GnXqpA421H8xsP3k25tasX/NI
	lxX7LZMQC0etkogOgUARK3hlcquTy07dBpc0TfgGwtERNLdUg1o3Out0VRt7lcDJhueTv3IrICT
	9iTmTd7rRvbrA72EkUdCCrEiNwoD0F6BCp3qPZ0nZcHEMFxNY05OA4NfxRRFoPk0wZmHuZJXbIf
	ciHRPm4pTkHjaEAPNd84C1YMziPyOvuSSiWUiPx8UT6rB5CWbOjJowWXj3qtAXp2fZEMLpDgqW3
	Do0yexSxUDWq2N4nxNO8SNQvVqoS6t0rVEHvdTGReoBjRa2I7ZBgWlOYgUpNkJbMiCSWIAXhzPE
	LgyNsj4L2HXzNzv133sdTl3Eap4OBhNty4zF1fsWrrjsk8l4pg4NnNq47UJkAB
X-Google-Smtp-Source: AGHT+IF4k/RkfOmUhgYe7FVDpf9ks1g+cj94xRjb2wR4nYY6zyy/JRFUX//zdaClZm94scJWzrnSjA==
X-Received: by 2002:a05:600c:4fc2:b0:471:1765:839c with SMTP id 5b1f17b1804b1-4711791299amr1711675e9.20.1760626486341;
        Thu, 16 Oct 2025 07:54:46 -0700 (PDT)
Message-ID: <5e75d176-60f2-4cd1-adfa-d799f2756dbd@suse.com>
Date: Thu, 16 Oct 2025 16:54:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/22] x86/traps: Introduce FRED entrypoints
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-13-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251003225334.2123667-13-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2025 00:53, Andrew Cooper wrote:
> --- a/xen/arch/x86/include/asm/asm_defns.h
> +++ b/xen/arch/x86/include/asm/asm_defns.h
> @@ -315,6 +315,71 @@ static always_inline void stac(void)
>          subq  $-(UREGS_error_code-UREGS_r15+\adj), %rsp
>  .endm
>  
> +/*
> + * Push and clear GPRs
> + */
> +.macro PUSH_AND_CLEAR_GPRS
> +        push  %rdi
> +        xor   %edi, %edi
> +        push  %rsi
> +        xor   %esi, %esi
> +        push  %rdx
> +        xor   %edx, %edx
> +        push  %rcx
> +        xor   %ecx, %ecx
> +        push  %rax
> +        xor   %eax, %eax
> +        push  %r8
> +        xor   %r8d, %r8d
> +        push  %r9
> +        xor   %r9d, %r9d
> +        push  %r10
> +        xor   %r10d, %r10d
> +        push  %r11
> +        xor   %r11d, %r11d
> +        push  %rbx
> +        xor   %ebx, %ebx
> +        push  %rbp
> +#ifdef CONFIG_FRAME_POINTER
> +/* Indicate special exception stack frame by inverting the frame pointer. */
> +        mov   %rsp, %rbp
> +        notq  %rbp
> +#else
> +        xor   %ebp, %ebp
> +#endif
> +        push  %r12
> +        xor   %r12d, %r12d
> +        push  %r13
> +        xor   %r13d, %r13d
> +        push  %r14
> +        xor   %r14d, %r14d
> +        push  %r15
> +        xor   %r15d, %r15d
> +.endm
> +
> +/*
> + * POP GPRs from a UREGS_* frame on the stack.  Does not modify flags.
> + *
> + * @rax: Alternative destination for the %rax value on the stack.
> + */
> +.macro POP_GPRS rax=%rax
> +        pop   %r15
> +        pop   %r14
> +        pop   %r13
> +        pop   %r12
> +        pop   %rbp
> +        pop   %rbx
> +        pop   %r11
> +        pop   %r10
> +        pop   %r9
> +        pop   %r8
> +        pop   \rax

For placing the entry_ssp field I came back looking here. I notice there
was a v2 comment regarding the rax macro parameter. Besides there being
a limitation on which registers may be used, a %rsp-relative memory
operand can't be (cleanly) used either. I think if you really want to
retain that parameter, some warning needs adding to the comment.

Jan

