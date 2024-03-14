Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF7987B92D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 09:19:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692970.1080727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkgHf-0002py-NR; Thu, 14 Mar 2024 08:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692970.1080727; Thu, 14 Mar 2024 08:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkgHf-0002oS-Kj; Thu, 14 Mar 2024 08:17:51 +0000
Received: by outflank-mailman (input) for mailman id 692970;
 Thu, 14 Mar 2024 08:17:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkgHd-0002oM-Uh
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 08:17:49 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57f6501d-e1db-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 09:17:48 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5683576ea18so789466a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 01:17:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r17-20020a1709067fd100b00a466782e438sm457427ejs.139.2024.03.14.01.17.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 01:17:47 -0700 (PDT)
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
X-Inumbo-ID: 57f6501d-e1db-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710404268; x=1711009068; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nso9/bITkvgqCNF2Pq/xJjH1cfXae86AGuoS4vdniSY=;
        b=QWPKJFGwM1B8Et8l84kySGJ/o3FNe4TfpmzJ8dYEYLXof05o1ZRRaF4rlWiVRv77kJ
         sXr1CzgMz2OPXAAnMVUS8z7D6q+R4AaUoxsQZFMDics8eayrkLZ/5eYJVyjIvkfjCh/a
         2Rc2U1Vijn5FgZjwTDBKnGyjYdcv+c1YCfZY+pTVHuVIC3VC6np6o4g/Ns2Ic31nEiZv
         KCGV/dQYBFh14fjLPd149r/6XGiOhqthkAvtQHyaAuM6tQHplc0+c/IJuJ1z+jFXkLnd
         Mlo26Kkqi2MsHbVCe7WWKYIR6MLHBcZQMw21ua1xStXG2B50fQkcsL7tfEx4EHtiwHta
         udpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710404268; x=1711009068;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nso9/bITkvgqCNF2Pq/xJjH1cfXae86AGuoS4vdniSY=;
        b=QumkLwO5N0WAgHoDgWs5+wzCBUNqtwkE6/eaKMiaEpsobJPda+uFc8jT+JxyBUf8VW
         HPVFZzSPfQWS8tAPI3FDmaam0/fpslEvN8hketKYOFAL18F8RsyKJPNuuI+xrpkHSmqt
         nn6CdiA+cFkaDN/EaIR/l+QzlPy+PB5urt06BSLt5aL50id1uaJwFteO17xWd0JysXnr
         p7pvsIMIHHhtRDHPEORlQgsc1kEvITpnhAEDY4AjFQZkhy7AdkNV2oukAFprVGqf+fF4
         IAW955zp+leqqUyUPvXSnzoBk/D+8VLms1S5Jgg7QlHOdiy4d/+ZSNSB6TGlvotC5JXw
         7mZw==
X-Forwarded-Encrypted: i=1; AJvYcCWOfV5gGHrwBSPF8vvtALonX/tFJUiaYQTlj2wDDodSE9MwcP6qX8FYvpDByD1U64E6pj/KnWwaPK0ziApBLA7JT/Kkyt7R0QbBmTL3Jv8=
X-Gm-Message-State: AOJu0Yz61IuArqyJi2vrxjC2vQWVuIbC2AP5QNQOk+0KerRAom2PQCy/
	DblFIRwZyrF4YBpLYUYrljVn4lhFW1MS7Ec4c4kKkd2nfwudXEMokdv+mkvc3g==
X-Google-Smtp-Source: AGHT+IGJiLsULhyDKRA22nVIlHVWOZZryKJfMZZoe7mPS6OErLfdwarNmQIs+BYR+gq8yUbT8hx4xw==
X-Received: by 2002:a17:907:c78b:b0:a46:703d:55e2 with SMTP id tz11-20020a170907c78b00b00a46703d55e2mr701293ejc.53.1710404268090;
        Thu, 14 Mar 2024 01:17:48 -0700 (PDT)
Message-ID: <62af3aad-3020-4d24-9dd4-ec4eafea0803@suse.com>
Date: Thu, 14 Mar 2024 09:17:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/entry: Introduce POP_GPRS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240313142641.2150302-1-andrew.cooper3@citrix.com>
 <20240313142641.2150302-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240313142641.2150302-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 15:26, Andrew Cooper wrote:
> The macro named RESTORE_ALL has several problems.  It adjusts the stack
> pointer despite this not being clear to the caller.  It also goes against
> recommendations in the optimisation guides because of trying to do too many
> things at once.  (i.e. there's a reason why compilers don't emit code looking
> like this.)

Not anymore; I'm sure they used to over a certain period of time, which is
why 4d246723a85a ("x86: use MOV instead of PUSH/POP when saving/restoring
register state") was created in the first place (and which you now say was
a mistake, or at least has become a mistake in the over 10 years since then).

> Introduce a new POP_GPRS macro which only POPs GPRs.  Use it for the HVM paths
> which are already using POPs.
> 
> Also use it for restore_all_{xen,guest}().  This saves most of a cacheline
> worth of code from two fastpaths:
> 
>   add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-99 (-99)
>   Function                                     old     new   delta
>   restore_all_guest                            378     330     -48
>   restore_all_xen                              165     114     -51
> 
> but it also avoids having an explicit modification to the stack pointer
> between %rsp-relative accesses, which avoids stalls in the stack-engine
> optimisations in some microarchitectures.

Is there such a rule? All I was able to find (and even that only with
quite a bit of effort, because the section it's in wouldn't have had
me think of a stack pointer rule being there) is

"Assembly/Compiler Coding Rule 22. (M impact, M generality) Avoid
 putting explicit references to ESP in a sequence of stack operations
 (POP, PUSH, CALL, RET)."

I actually wonder whether %rsp really is special in the way you
indicate - other registers, when used for memory accesses and being
updated ought to have a similar stall issue?

> --- a/xen/arch/x86/hvm/svm/entry.S
> +++ b/xen/arch/x86/hvm/svm/entry.S
> @@ -74,22 +74,9 @@ __UNLIKELY_END(nsvm_hap)
>          ALTERNATIVE "", svm_vmentry_spec_ctrl, X86_FEATURE_SC_MSR_HVM
>          ALTERNATIVE "", DO_SPEC_CTRL_DIV, X86_FEATURE_SC_DIV
>  
> -        pop  %r15
> -        pop  %r14
> -        pop  %r13
> -        pop  %r12
> -        pop  %rbp
>          mov  VCPU_svm_vmcb_pa(%rbx),%rax
> -        pop  %rbx
> -        pop  %r11
> -        pop  %r10
> -        pop  %r9
> -        pop  %r8
> -        pop  %rcx /* Skip %rax: restored by VMRUN. */
> -        pop  %rcx
> -        pop  %rdx
> -        pop  %rsi
> -        pop  %rdi
> +
> +        POP_GPRS rax=%rcx /* Skip %rax.  It's restored by VMRUN. */

In light of you having asked my to try and decouple ABI and internal stack
frame layout, I'm wary of encoding a dependency on the ordering of registers
in the frame at a use site like this one. Imo the argument ought to merely
indicate "skip %rax", with the macro taking care of how that skipping is
actually carried out.

> @@ -696,20 +697,19 @@ UNLIKELY_END(exit_cr3)
>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
>          SPEC_CTRL_EXIT_TO_XEN /* Req: %r12=ist_exit %r14=end %rsp=regs, Clob: abcd */
>  
> -        RESTORE_ALL adj=8
> +        POP_GPRS
>  
>          /*
>           * When the CPU pushed this exception frame, it zero-extended eflags.
>           * For an IST exit, SPEC_CTRL_EXIT_TO_XEN stashed shadow copies of
>           * spec_ctrl_flags and ver_sel above eflags, as we can't use any GPRs,
>           * and we're at a random place on the stack, not in a CPUFINFO block.
> -         *
> -         * Account for ev/ec having already been popped off the stack.
>           */
>          SPEC_CTRL_COND_VERW \
> -            scf=STK_REL(EFRAME_shadow_scf, EFRAME_rip), \
> -            sel=STK_REL(EFRAME_shadow_sel, EFRAME_rip)
> +            scf=STK_REL(EFRAME_shadow_scf, EFRAME_error_code), \
> +            sel=STK_REL(EFRAME_shadow_sel, EFRAME_error_code)
>  
> +        add   $8, %rsp
>          iretq

How is this ADD different from the RESTORE_ALL one, in particular in light
of the ORM rule quoted above (which surely extends to IRET as well)? It
ought to be possible to avoid, by having POP_GPRS (optionally) move the
%r15 value into the error code slot first thing (i.e. before %rsp starts
being updated), and then having "pop %r15" last.

Jan

