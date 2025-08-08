Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D6AB1E624
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 12:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074197.1436865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukK2I-00059H-3n; Fri, 08 Aug 2025 10:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074197.1436865; Fri, 08 Aug 2025 10:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukK2I-00056w-0v; Fri, 08 Aug 2025 10:09:18 +0000
Received: by outflank-mailman (input) for mailman id 1074197;
 Fri, 08 Aug 2025 10:09:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ukK2G-00056q-B8
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 10:09:16 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcd8a4d3-743f-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 12:09:15 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-61557997574so2767840a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 03:09:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f245c1sm13354525a12.22.2025.08.08.03.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 03:09:14 -0700 (PDT)
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
X-Inumbo-ID: bcd8a4d3-743f-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754647754; x=1755252554; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pFylwkEPqA78lxqBJYekMme0Z60LMD8EElrPlYl6198=;
        b=KcssY97W84Ja53mPyOuLetruddxZYOXcZ53Vb7uZXr1oEXCURcsRFkl+FY1YLPUVk9
         +LyZwfl+4zBCakkVQS6X9MzhDgjyYrwQEAVffAuStLF1sid66YxLlX+C5kEFVlQTWl5F
         Q12M5EZTL1L1/tIqnRPmYYgv5LDMfvUUz1UtH1XCOzfy2wXfWpizEaRO6OsFVP3uBImM
         BioYs6Tdcaw1zR3kRrlyrQTbe0KHMyc8ldFFOGCATM5tACcOtqnBwe/r/lOf5540wweX
         G81TG7pnuIQdyaL9Ld2v5XS4I+2UV7xUB01WwW61w4k+2EHvPmmwDykmmHOeQKMc/TBt
         ffBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754647754; x=1755252554;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFylwkEPqA78lxqBJYekMme0Z60LMD8EElrPlYl6198=;
        b=njEwnafUxgZe/mxeBVm/UTVmr4LKcasQbDkFdGqadIJxmqvrEi18lxbGPS4agjr4IF
         h8d1YOlhcsp6XjMkb9GLJIW8HTg+glXQFrOMG9mZj3C8gyD50+71bpbWLTAoAiqVjSkV
         xIMncdYU5Dr5MF4nYva6hwnZS9Mdda3GWMN7TSdYX0n3CppqC+VT1M3DvZ68n5RpfHLN
         AHKtxSwXP6Vg7vbZWR2j1lKO6qHZJdZTzDTsfLEmXwpzlN4T4ptOhdYHl13Ryz3vajTy
         2aIvec8kiMjG7NIAiuwtumEeUBwELBTmmQXy6l5C5OyRqHhLYfRZQiCywrQvJ1sd2pjH
         6Aag==
X-Forwarded-Encrypted: i=1; AJvYcCVoJpz8L1QJ4W3nbZliKz87CGSotp2peXDrcW4gQEc1IUbGeU29iI/0OL4RWNmulnFCfWbypUN/+EE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzA8Ghs2FtgOTy8hz9fXDtFKYAOzXSceAghE8arjGID0wi3yFn2
	v+3GWwYTN2QJeGGP8fzR4uOFERiCiBSw484Lj5Bl3BAycfIef2aKGIE9PkZIadMPFA==
X-Gm-Gg: ASbGncspGnRM57YcMguD3ihTNeIeK+jagPuk2hQs5w9LW9TwCYjRn1JGfEZzCdcyOfC
	oixQnYzKJlF2Xqcq5czzArRyKNOLMcokVR2cCngjqqPD7f60HbaoZqEcDAxuZPACMfR99zgd/mK
	luUxRlAOUDFS+5BoE66CYqimvyljdjhuItoTunOD5R8G1AlMGyi7+TWwvBksJS8zNDtVBUdmTHp
	LGvH6yltkFq2QcWU5hXxlYTXMECyubH6hrp1cFRD9Lq4kemV/G8mvI/sDP+APdudGAoo/TCmF3O
	9EwHpsBoOfOSvBcDaex+FEHI9QJkXwiLO1IZpAVf10jBR4D5kAnA3J6gfVIMQK1cwDroHeCsHFD
	BqV5agrB6ciN78wL9HtOyoLE4gpLNAGXpUaA68jkT12YZ0u85VR0omIiFV6ETdOujVSALdAuJXQ
	/PfHDVSk0=
X-Google-Smtp-Source: AGHT+IHtZ8NsNuSwPEAiHsMzg45IhQDZBxOtprpHkE7tZAU8RP4+lnTbqLvtWEx8+1pHNET7ZUALxQ==
X-Received: by 2002:a05:6402:3485:b0:617:bb83:99a0 with SMTP id 4fb4d7f45d1cf-617e2e7c16dmr1892990a12.30.1754647754351;
        Fri, 08 Aug 2025 03:09:14 -0700 (PDT)
Message-ID: <ed587862-b239-429b-a478-e2f574312a2a@suse.com>
Date: Fri, 8 Aug 2025 12:09:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86/domctl: Stop using XLAT_cpu_user_regs()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250807111657.201849-1-andrew.cooper3@citrix.com>
 <20250807111657.201849-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250807111657.201849-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2025 13:16, Andrew Cooper wrote:
> In order to support FRED, we're going to have to remove the {ds..gs} fields
> from struct cpu_user_regs, meaning that it is going to have to become a
> different type to the structure embedded in vcpu_guest_context_u.
> 
> In both arch_{get,set}_info_guest(), expand the memcpy()/XLAT_cpu_user_regs()
> to copy the fields individually.  This will allow us to eventually make them
> different types.
> 
> This does cause some minor changes in behaviour for the hypercalls.
> 
> It is specifically not the case that a toolstack could set_info(); get_info();
> and get an identical bit pattern back.  Amongst other things, the
> architectural sticky bits in registers are applied during setting.
> 
> Previously, XLAT_cpu_user_regs() omitted the _pad fields in the compat case
> whereas the non-compat case included them owing to the single memcpy().
> 
> Omit the _pad fields in the non-compat case too; for all but the oldest of
> CPUs, the segment selectors are zero-extended by hardware when pushed onto the
> stack, so non-zero values here get lost naturally.  Furthermore, FRED reuses
> the space above cs and ss for extra state, and a PV guest for now at least
> must not be able to write the control state.
> 
> Omit the error_code and entry_vector fields too.  They're already identified
> as private fields in the public API, and are stale outside of Xen's
> interrupt/exception/syscall handler.  They're also a very minor information
> leak of which event caused the last deschedule of a vCPU.

I think my prior remark towards tools like xenctx wasn't really addressed.
Then again that particular tool doesn't use the fields now, so apparently
no-one ever saw a need.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1233,7 +1233,24 @@ int arch_set_info_guest(
>  
>      if ( !compat )
>      {
> -        memcpy(&v->arch.user_regs, &c.nat->user_regs, sizeof(c.nat->user_regs));
> +        memset(&v->arch.user_regs, 0, sizeof(v->arch.user_regs));

Any reason to have this and ...

> +        v->arch.user_regs.rbx               = c.nat->user_regs.rbx;
> +        v->arch.user_regs.rcx               = c.nat->user_regs.rcx;
> +        v->arch.user_regs.rdx               = c.nat->user_regs.rdx;
> +        v->arch.user_regs.rsi               = c.nat->user_regs.rsi;
> +        v->arch.user_regs.rdi               = c.nat->user_regs.rdi;
> +        v->arch.user_regs.rbp               = c.nat->user_regs.rbp;
> +        v->arch.user_regs.rax               = c.nat->user_regs.rax;
> +        v->arch.user_regs.rip               = c.nat->user_regs.rip;
> +        v->arch.user_regs.cs                = c.nat->user_regs.cs;
> +        v->arch.user_regs.rflags            = c.nat->user_regs.rflags;
> +        v->arch.user_regs.rsp               = c.nat->user_regs.rsp;
> +        v->arch.user_regs.ss                = c.nat->user_regs.ss;
> +        v->arch.user_regs.es                = c.nat->user_regs.es;
> +        v->arch.user_regs.ds                = c.nat->user_regs.ds;
> +        v->arch.user_regs.fs                = c.nat->user_regs.fs;
> +        v->arch.user_regs.gs                = c.nat->user_regs.gs;
> +
>          if ( is_pv_domain(d) )
>              memcpy(v->arch.pv.trap_ctxt, c.nat->trap_ctxt,
>                     sizeof(c.nat->trap_ctxt));
> @@ -1241,7 +1258,24 @@ int arch_set_info_guest(
>  #ifdef CONFIG_COMPAT
>      else
>      {
> -        XLAT_cpu_user_regs(&v->arch.user_regs, &c.cmp->user_regs);
> +        memset(&v->arch.user_regs, 0, sizeof(v->arch.user_regs));

... this separate, rather than putting just one ahead of the if()?

Preferably with that adjustment:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

