Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8088B0260
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 08:47:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711148.1110889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzWPE-000192-Sz; Wed, 24 Apr 2024 06:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711148.1110889; Wed, 24 Apr 2024 06:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzWPE-00015q-QC; Wed, 24 Apr 2024 06:47:00 +0000
Received: by outflank-mailman (input) for mailman id 711148;
 Wed, 24 Apr 2024 06:46:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzWPD-00015k-2M
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 06:46:59 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7206deec-0206-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 08:46:57 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d895e2c6efso97706501fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 23:46:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h17-20020a5d6891000000b0034a51f86086sm13690704wru.63.2024.04.23.23.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 23:46:57 -0700 (PDT)
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
X-Inumbo-ID: 7206deec-0206-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713941217; x=1714546017; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xHvPqKINFZRXZ/p0at5kGFspFHQMhYRAHEDnv+RYrJw=;
        b=AlANWW1G0NnANXsfYb/3v5VESgA/4OS2b9yIcQjZ0J2lyZgNVSf1BrHWmwM/zFX4oA
         XDDoGre1mSR/Aad3rFThSuCojWna5ZnOr2r3uuAeYhBFwpYgrCc/7YVZAFPZRuBhLq+G
         xd+4mYwqeE1GPCYZa5WIDQuVVcBslJB78Tk16OWq13VbiVj5841147ZZj6ywuV2UI99h
         REgHy1HafR8E6EQMlbJqiVY0RUk6UqctQyHQXyD0BGR9wxp4y1/lLU4sAmXm8nw65uxa
         rltO6IEAeNf9nxLqjtDge+5xmQfe7e9++h2+Ejp9hpEK6Ai5pAmbBZZFXFDYXVi6EYaP
         a7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713941217; x=1714546017;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xHvPqKINFZRXZ/p0at5kGFspFHQMhYRAHEDnv+RYrJw=;
        b=s8EDKtL4UE/J2tRUqKErboqg/0z96VWQLDTPzUD5tuX7ynK9MK2Hg4QbmkF2eyrom7
         70o0KnXbuXh7QL6l0k4+rqS6ReIzFrQiTxIv15rRIm3wSmXKzXKq6fpvVta9ibGYOncc
         yNDYkfXb7+mtYIBrDTFslqRQcwn4u0Ztmat8JpSxieGsUiMGQ217EJZpBWPaReTcXRAp
         b4sZKukYhPf90EkqhjfykWPGprg8PeCE1+PZJ3uJJScaQxUi+S7YPS4f+Zuj78AbZ+o9
         Wa1q/R3LuzipDLvgiYvzEOlzCkwGq71oO5fonu/IQ9/fezQjWP8YJx1bAQynbMqOl3YQ
         fODA==
X-Forwarded-Encrypted: i=1; AJvYcCVFQMt/8bgMmh0CtCT6bDPwu5UmZKQI7Ja7IVlafWo0XcJEA1O41B0izICIdP0ZXBjmdKmNCJO2nVRXGy9Dtmz66thS8zBGGYeYoduQx7k=
X-Gm-Message-State: AOJu0Ywx3rY3VVTv+pgWa9lcdje+ZLaA0NefgWIzgPnUKpd6gGOdwSBm
	Cox0ANklQhZKlHj4yhGRrEZSTAm3LDAnvihUqgTsn/KmsObBhhAi698GsvmYUg==
X-Google-Smtp-Source: AGHT+IEpR1zlo+QFgTshE9eNYccamyLg2HcUANa+LOCL9HTAIULRaFCyJ9KJ7B6waja6p2Wp5SN5ZA==
X-Received: by 2002:a2e:b3ce:0:b0:2d8:8eb4:11a6 with SMTP id j14-20020a2eb3ce000000b002d88eb411a6mr845840lje.12.1713941217288;
        Tue, 23 Apr 2024 23:46:57 -0700 (PDT)
Message-ID: <051e8c65-3c33-435f-acc4-0230076cc092@suse.com>
Date: Wed, 24 Apr 2024 08:46:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86/spec-ctrl: Introduce and use DO_COND_BHB_SEQ
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
 <20240422181434.3463252-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240422181434.3463252-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2024 20:14, Andrew Cooper wrote:
> --- a/xen/arch/x86/hvm/vmx/entry.S
> +++ b/xen/arch/x86/hvm/vmx/entry.S
> @@ -62,12 +62,12 @@ ENTRY(vmx_asm_vmexit_handler)
>           * Clear the BHB to mitigate BHI.  Used on eIBRS parts, and uses RETs
>           * itself so must be after we've perfomed all the RET-safety we can.
>           */
> -        testb $SCF_entry_bhb, CPUINFO_scf(%rsp)
> -        jz .L_skip_bhb
> -        ALTERNATIVE_2 "",                                    \
> -            "call clear_bhb_loops", X86_SPEC_BHB_LOOPS,      \
> -            "call clear_bhb_tsx", X86_SPEC_BHB_TSX
> -.L_skip_bhb:
> +        .macro VMX_BHB_SEQ fn:req
> +            DO_COND_BHB_SEQ \fn scf=CPUINFO_scf(%rsp)

While the assembler permits this, can we please avoid mixing positional and
named macro arguments? Instead, ...

> +        .endm
> +        ALTERNATIVE_2 "",                                         \
> +            "VMX_BHB_SEQ fn=clear_bhb_loops", X86_SPEC_BHB_LOOPS, \
> +            "VMX_BHB_SEQ fn=clear_bhb_tsx",   X86_SPEC_BHB_TSX

... as done further down, named arguments don't need using here. With the
former addressed and preferably with the latter in consistent shape with
what's below (which way round I don't care as much, albeit with a slight
preference for "shorter"):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
> @@ -92,6 +92,21 @@
>  .L\@_skip:
>  .endm
>  
> +.macro DO_COND_BHB_SEQ fn:req, scf=%bl
> +/*
> + * Requires SCF (defaults to %rbx), fn=clear_bhb_{loops,tsx}
> + * Clobbers %rax, %rcx
> + *
> + * Conditionally use a BHB clearing software sequence.
> + */
> +    testb  $SCF_entry_bhb, \scf
> +    jz     .L\@_skip_bhb
> +
> +    call   \fn
> +
> +.L\@_skip_bhb:
> +.endm
> +
>  .macro DO_OVERWRITE_RSB tmp=rax, xu
>  /*
>   * Requires nothing
> @@ -277,12 +292,9 @@
>       * Clear the BHB to mitigate BHI.  Used on eIBRS parts, and uses RETs
>       * itself so must be after we've perfomed all the RET-safety we can.
>       */
> -    testb $SCF_entry_bhb, %bl
> -    jz .L\@_skip_bhb
> -    ALTERNATIVE_2 "",                                    \
> -        "call clear_bhb_loops", X86_SPEC_BHB_LOOPS,      \
> -        "call clear_bhb_tsx", X86_SPEC_BHB_TSX
> -.L\@_skip_bhb:
> +    ALTERNATIVE_2 "",                                          \
> +        "DO_COND_BHB_SEQ clear_bhb_loops", X86_SPEC_BHB_LOOPS, \
> +        "DO_COND_BHB_SEQ clear_bhb_tsx",   X86_SPEC_BHB_TSX
>  
>      ALTERNATIVE "lfence", "", X86_SPEC_NO_LFENCE_ENTRY_PV
>  .endm
> @@ -322,12 +334,9 @@
>      ALTERNATIVE "", __stringify(DO_SPEC_CTRL_ENTRY maybexen=1),         \
>          X86_FEATURE_SC_MSR_PV
>  
> -    testb $SCF_entry_bhb, %bl
> -    jz .L\@_skip_bhb
> -    ALTERNATIVE_2 "",                                    \
> -        "call clear_bhb_loops", X86_SPEC_BHB_LOOPS,      \
> -        "call clear_bhb_tsx", X86_SPEC_BHB_TSX
> -.L\@_skip_bhb:
> +    ALTERNATIVE_2 "",                                          \
> +        "DO_COND_BHB_SEQ clear_bhb_loops", X86_SPEC_BHB_LOOPS, \
> +        "DO_COND_BHB_SEQ clear_bhb_tsx",   X86_SPEC_BHB_TSX
>  
>      ALTERNATIVE "lfence", "", X86_SPEC_NO_LFENCE_ENTRY_INTR
>  .endm
> @@ -433,13 +442,9 @@
>       * Clear the BHB to mitigate BHI.  Used on eIBRS parts, and uses RETs
>       * itself so must be after we've perfomed all the RET-safety we can.
>       */
> -    testb $SCF_entry_bhb, %bl
> -    jz .L\@_skip_bhb
> -
> -    ALTERNATIVE_2 "",                                    \
> -        "call clear_bhb_loops", X86_SPEC_BHB_LOOPS,      \
> -        "call clear_bhb_tsx", X86_SPEC_BHB_TSX
> -.L\@_skip_bhb:
> +    ALTERNATIVE_2 "",                                          \
> +        "DO_COND_BHB_SEQ clear_bhb_loops", X86_SPEC_BHB_LOOPS, \
> +        "DO_COND_BHB_SEQ clear_bhb_tsx",   X86_SPEC_BHB_TSX
>  
>      lfence
>  .endm


