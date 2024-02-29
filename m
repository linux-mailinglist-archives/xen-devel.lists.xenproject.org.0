Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B65686C596
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 10:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686906.1069488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfct6-0004Oq-04; Thu, 29 Feb 2024 09:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686906.1069488; Thu, 29 Feb 2024 09:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfct5-0004Mb-TY; Thu, 29 Feb 2024 09:39:35 +0000
Received: by outflank-mailman (input) for mailman id 686906;
 Thu, 29 Feb 2024 09:39:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfct4-0004MV-6j
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 09:39:34 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70b718b2-d6e6-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 10:39:31 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so127104566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 01:39:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t9-20020a17090616c900b00a44218b5defsm498611ejd.60.2024.02.29.01.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 01:39:30 -0800 (PST)
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
X-Inumbo-ID: 70b718b2-d6e6-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709199571; x=1709804371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PNUxzD4V7HMu9zXzs5ZGoPtX0o3RxKaDv/Vsb8iSies=;
        b=aDeTU0xUG0mHzkZ6xeY6LZ7/uON90t/mpfaZHbcz58abx8TuUyC6/lQHfKYkXxoNtK
         7pXmQYrd272XtGMlKJevKmKORY8+BqkrV5YbKQh40zqXM0YEyVFV7s5xyW42AOUW3Rp8
         267SEv2IFDDVmXOW0hv1pHiQ69hIAuIzMgJrkM9NMzbrjY8F9ufeYt9c5+d5eGwBiwqW
         8vfsvovMz8fap0wRTnuwXU0I5p9Oo8SYsgQHdMwWquIleNMtyzM1wdq9MrfY2oU4mSLb
         906QksXF8Yhwg3U2ooQIFW+PNnZE64ZCvfDrWjp/gFdBGo1tFHpq88gPv3ds64PJRspD
         n8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199571; x=1709804371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PNUxzD4V7HMu9zXzs5ZGoPtX0o3RxKaDv/Vsb8iSies=;
        b=X0iED/shNHxy7KsCFTuJnq6+mUwogPBjv8653cDIFuv8VNKQwcCYFE6toR3vUNZNcM
         dUrDURYoGhkAkpyAqwrsZRcu1x0QivLGbeNv832x0B+WLW6BTUITpsVy3AMqJEX6e7hN
         OZyE6nW0cDOjDoNmpF2sx3QPh8WptyClfZj34y66+Jk8ejq6cOmOD8xjAKAUNyGvC/Rk
         uuGa8Hq0LEZUmFAs/g5b+7CK+mvG8OGgkG+pt0ydn4c/q8CSb4jaEA9g/r9fTGDMhZV7
         LFGKPR+Zo+Kn12BLavmKYvDH+jOE1VSrGGJr6Sqk8Iojd0pN4/pT5zCmtaywdTLVEWY2
         QETw==
X-Forwarded-Encrypted: i=1; AJvYcCU/87FNTCBVjZhk1PVRjgO+cv0GU01OvGpRi+uXe6yrY1cIoj05PeItORnoBOPF3Ca+ORXEG3nhhc4agzvvR1eWSiagCowRElMcwyEtZfg=
X-Gm-Message-State: AOJu0YwWiHhWL8Csv2/gZPUwTCiHlCNz2KOAThIWAbtnSaAQeIcq65MF
	L8KuOs0xpHKXHbeDh3g1Yt1sOeR/2ayRwpRpXoP5WAej897VLBrhxhhim9BKMg==
X-Google-Smtp-Source: AGHT+IFnnk4xvYiZxMh+MdDBIxZ/RVzDeUAyI5uls0PhX7Umq239vSnEH/tilvVdrClX/eQXrI770w==
X-Received: by 2002:a17:906:a28c:b0:a43:d853:98f1 with SMTP id i12-20020a170906a28c00b00a43d85398f1mr970099ejz.17.1709199571250;
        Thu, 29 Feb 2024 01:39:31 -0800 (PST)
Message-ID: <8579a6d3-6860-4a7b-848f-1240da768f33@suse.com>
Date: Thu, 29 Feb 2024 10:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86: record SSP at non-guest entry points
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <33da6f8b-af22-48c8-acce-3aa55c0e0414@suse.com>
 <0ad4543b-8eed-4147-b32d-b68d21fade98@suse.com>
 <320ca33d-2c40-417e-874c-8af447c43734@citrix.com>
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
In-Reply-To: <320ca33d-2c40-417e-874c-8af447c43734@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.02.2024 16:16, Andrew Cooper wrote:
> On 28/02/2024 1:52 pm, Jan Beulich wrote:
>> We will want to use that value for call trace generation, and likely
>> also to eliminate the somewhat fragile shadow stack searching done in
>> fixup_exception_return(). For those purposes, guest-only entry points do
>> not need to record that value.
>>
>> To keep the saving code simple, record our own SSP that corresponds to
>> an exception frame, pointing to the top of the shadow stack counterpart
>> of what the CPU has saved on the regular stack. Consuming code can then
>> work its way from there.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> To record the full 64-bit value, some of the unused bits in the %cs slot
>> could be used. Sadly that slot has saved_upcall_mask in an unhelpful
>> location, otherwise simply storing low and high 32 bits in those two
>> separate half-slots would be a pretty obvious choice. As long as
>> "entry_ssp" is used in non-guest-entry frames only, we could of course
>> put half of it into a union with saved_upcall_mask ...
>>
>> Else may want to put a BUILD_BUG_ON(VADDR_BITS > 48) somewhere, but I'm
>> afraid I can't really identify a good place for such to live.
> 
> Perhaps in reinit_bsp_stack() when we enable SHSTK on the BSP?
> 
> Having it anywhere vaguely relevant is better than not having it.

Okay.

>> Leveraging that the CPU stores zero in the upper bits of the selector
>> register slots, the save sequence could also be
>>
>>         shl   $16, %rcx
>>         or    %rcx, UREGS_entry_ssp-2(%rsp)
>>
>> That's shorter and avoids a 16-bit operation, but may be less desirable,
>> for being a read-modify-write access.
> 
> I doubt you'll be able to measure a difference between the two options
> (it's into the active stack, after all), but the two stores is probably
> marginally better.  When shstks are active, we're taking a large hit
> from the busy token handling.
> 
> I was concerned by the misaligned access, but it's not misaligned, its
> it?  It's the start of entry_ssp which is misaligned and the -2 brings
> it back to being properly aligned.

Correct.

>> --- a/xen/arch/x86/include/asm/asm_defns.h
>> +++ b/xen/arch/x86/include/asm/asm_defns.h
>> @@ -221,7 +221,7 @@ static always_inline void stac(void)
>>  #endif
>>  
>>  #ifdef __ASSEMBLY__
>> -.macro SAVE_ALL compat=0
>> +.macro SAVE_ALL compat=0 ssp=IS_ENABLED(CONFIG_XEN_SHSTK)
> 
> I'm not sure this is what you want to do.  Because it's only the
> default, we'll still....
> 
>>          addq  $-(UREGS_error_code-UREGS_r15), %rsp
>>          cld
>>          movq  %rdi,UREGS_rdi(%rsp)
>> @@ -235,6 +235,9 @@ static always_inline void stac(void)
>>          movq  %rax,UREGS_rax(%rsp)
>>          xor   %eax, %eax
>>  .if !\compat
>> +.if \ssp
>> +        rdsspq %rcx
> 
> ... pick this up even in !CONFIG_XEN_SHSTK builds, and ...
> 
>> +.endif
>>          movq  %r8,UREGS_r8(%rsp)
>>          movq  %r9,UREGS_r9(%rsp)
>>          movq  %r10,UREGS_r10(%rsp)
>> @@ -264,6 +267,11 @@ static always_inline void stac(void)
>>          xor   %r13d, %r13d
>>          xor   %r14d, %r14d
>>          xor   %r15d, %r15d
>> +.if \ssp && !\compat
>> +        mov   %cx, UREGS_entry_ssp(%rsp)
>> +        shr   $16, %rcx
>> +        mov   %ecx, UREGS_entry_ssp+2(%rsp)
> 
> ... store it here.
> 
> I think you need to use ssp=1 by default, and
> 
> #ifdef CONFIG_XEN_SHSTK
> .if
>     ...
> 
> for these two blocks, so they disappear properly in !SHSTK builds.

I'm afraid I don't follow: The macro parameter exists for use sites
to pass 0 even in SHSTK builds, for the entry-from-guest paths where
its recording is of no interest. Non-zero should never be passed
explicitly. Perhaps I ought to add a comment to this effect:

/* Use sites may override ssp to 0. It should never be overridden to 1. */

If that doesn't address your concern, then I'm afraid I'm not fully
understanding your comments, or I'm overlooking something crucial.

> But for the rest of the behaviour, there are two overlapping things,
> because you end up getting entry_ssp=0 in SHSTK builds running on
> hardware without shstk active.

Yes. I guess I don't understand what you're trying to indicate to
me.

> And with that in mind, to confirm, the RDSSP block depends on the xor
> %ecx,%ecx between the two hunks in order to function as intended?

Yes. In fact initially I had used %edx, with "interesting" effects.
It's not said anywhere in the macro that %edx needs to be zero by
the point the macro completes; comments to this effect exist only
past several of the use sites of the macro.

>> --- a/xen/include/public/arch-x86/xen-x86_64.h
>> +++ b/xen/include/public/arch-x86/xen-x86_64.h
>> @@ -183,7 +183,19 @@ struct cpu_user_regs {
>>      uint8_t  _pad1[3];
>>      __DECL_REG_LO16(flags); /* rflags.IF == !saved_upcall_mask */
>>      __DECL_REG_LO8(sp);
>> -    uint16_t ss, _pad2[3];
>> +    uint16_t ss;
>> +#if !defined(__XEN__)
>> +    uint16_t _pad2[3];
>> +#elif defined(COMPILE_OFFSETS)
>> +    uint16_t entry_ssp[3];
>> +#else
>> +    /*
>> +     * This points _at_ the corresponding shadow stack frame; it is _not_ the
>> +     * outer context's SSP.  That, if the outer context has CET-SS enabled,
>> +     * is stored in the top slot of the pointed to shadow stack frame.
>> +     */
>> +    signed long entry_ssp:48;
>> +#endif
> 
> I have to admit that I dislike this.  (And only some of that is because
> it's work I'm going to have to revert in order to make FRED support work...)

Right, some of the bits in the various slots which have space available
are used there. But the frame layout there is different anyway, so by
that point we won't get away without re-working our exception frame
layout. Taking care of the new extra field then is, I expect, not going
to make much of a difference, when without doing the transformation now
we can have some immediate gain.

> We desperately need to break our use of this structure to start with,
> and with that done, we don't need to play games about hiding SSP in a
> spare 6 bytes in an ABI dubiously made public nearly two decades ago.
> 
> How hard would it be just:
> 
> #define cpu_user_regs abi_cpu_user_regs
> #include <public/xen.h>
> #undef cpu_user_regs
> 
> and make a copy of cpu_user_regs that we can really put an SSP field into?

Well, that's easy to write here, but this pattern would then need
repeating in a few dozen places. Even abstracting it by way of a
helper header would seem problematic to me: We can't very well
forbid common code to include public/xen.h directly. We also have
a couple of direct inclusions of public/arch-x86/xen.h, which would
similarly need taking care of.

A better approach might be an #ifdef __XEN__ inside the header
itself. I could try that, but I'd stop as soon as I consider knock-
on effects too heavy for the simple purpose here.

I know you've been pointing out that we want to change how the stack
is organized. This not having happened yet was, for me, largely
because of quite likely not being straightforward to achieve.

> It would make this patch more simple, and we could finally get the vm86
> block off the stack (which also fixes OoB accesses in the #DF handler -
> cant remember if I finished the bodge around that or not.)
> 
> Irrespective of anything else, why do we have COMPILE_OFFSETS getting in
> here?

Because offsetof() implies determining the address of a field, which
is not allowed for bitfields.

Jan

