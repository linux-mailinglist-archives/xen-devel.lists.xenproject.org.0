Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B0386B2EA
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 16:16:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686701.1069042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLfj-0000qB-Az; Wed, 28 Feb 2024 15:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686701.1069042; Wed, 28 Feb 2024 15:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLfj-0000oP-7r; Wed, 28 Feb 2024 15:16:39 +0000
Received: by outflank-mailman (input) for mailman id 686701;
 Wed, 28 Feb 2024 15:16:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIhW=KF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfLfi-0000oJ-CI
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 15:16:38 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cbbbfec-d64c-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 16:16:36 +0100 (CET)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-787c0f5eaa2so275079185a.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 07:16:36 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ow7-20020a05620a820700b00787b8e49d9fsm4659816qkn.14.2024.02.28.07.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 07:16:34 -0800 (PST)
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
X-Inumbo-ID: 5cbbbfec-d64c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709133395; x=1709738195; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8RvzjC1RKZCdRo7Bz7AsdUZ6IYrXYuGXtUjIBEhg3wU=;
        b=LVyvl23vzVkrg4QYEkkUJT24BXV4TBNKWoV0lm8rQXP/GYWNAnHDtLruew8509QV+E
         23VoGDmyZY3CJgwXeLU6zk0sK7IkgH+anv+wQjk1ulpxcla2CsKQjjOzpHzTJxQh58wj
         kWhkrqaJa1sXDegxvPPVuzpW/wRZAsB2XK4sA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709133395; x=1709738195;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8RvzjC1RKZCdRo7Bz7AsdUZ6IYrXYuGXtUjIBEhg3wU=;
        b=XJWCPglZTGeH1lZ4P4VC4r1fKgdsgsdxkaOe+Q7jkVNzgljlWxJy20b00ZmuVBhSG8
         cIaJWeHaU0iKPaeBQt3kLWLfns2K6zzrVwz5cQhjL15eTl3nmDC4neNxXdedeCvwzuCi
         zcrp1PyYo/qZn5hAxe581X0lqdJHl0pPO5tdeaoKChizeVFc3aypq/vsxx+KL6oXNOJC
         Af9wd9S85UCbRhp1HNlYQ0P41xCjGp+C6m5sU6KKXJQzY9U4R8J+GpdTvvFC4iLNL3Wh
         d4togPdfIUAnTIADGu3CTD+6IoeuyHjS13Hvx78sotfhWOUaAbuzyB1o/8Ghswy+sqrr
         NeuA==
X-Forwarded-Encrypted: i=1; AJvYcCXjwqf9BjiQ5QKuscZHO1/EJReKCmELsAMY3yvuToZeT62MpNwQbJ5/zLp7fuPvztJ/vjMpgDf1tyd+FYPqKn5MMNcWhrbJTJgPtLSyiHs=
X-Gm-Message-State: AOJu0YyNZnzOJHN5v7AKh58SmwhvFEPzvwtQXawPY16vd7XCtW2fktUB
	YZo9VtRV/ZgvsZ1b2bOXo4k7b2Y0vCDkGilt5yiUC28nJuoYqDj+2MQIHLCiDxA=
X-Google-Smtp-Source: AGHT+IHZaWXYDNFOLkkZneUGN0O+s//Jead9SHjdCT+6ouFWFgs2aavSzQ6Uheavv48CMGVtBkRhoQ==
X-Received: by 2002:a05:620a:5641:b0:787:a0f4:dd3 with SMTP id vw1-20020a05620a564100b00787a0f40dd3mr5703793qkn.4.1709133395108;
        Wed, 28 Feb 2024 07:16:35 -0800 (PST)
Message-ID: <320ca33d-2c40-417e-874c-8af447c43734@citrix.com>
Date: Wed, 28 Feb 2024 15:16:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86: record SSP at non-guest entry points
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <33da6f8b-af22-48c8-acce-3aa55c0e0414@suse.com>
 <0ad4543b-8eed-4147-b32d-b68d21fade98@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0ad4543b-8eed-4147-b32d-b68d21fade98@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/02/2024 1:52 pm, Jan Beulich wrote:
> We will want to use that value for call trace generation, and likely
> also to eliminate the somewhat fragile shadow stack searching done in
> fixup_exception_return(). For those purposes, guest-only entry points do
> not need to record that value.
>
> To keep the saving code simple, record our own SSP that corresponds to
> an exception frame, pointing to the top of the shadow stack counterpart
> of what the CPU has saved on the regular stack. Consuming code can then
> work its way from there.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> To record the full 64-bit value, some of the unused bits in the %cs slot
> could be used. Sadly that slot has saved_upcall_mask in an unhelpful
> location, otherwise simply storing low and high 32 bits in those two
> separate half-slots would be a pretty obvious choice. As long as
> "entry_ssp" is used in non-guest-entry frames only, we could of course
> put half of it into a union with saved_upcall_mask ...
>
> Else may want to put a BUILD_BUG_ON(VADDR_BITS > 48) somewhere, but I'm
> afraid I can't really identify a good place for such to live.

Perhaps in reinit_bsp_stack() when we enable SHSTK on the BSP?

Having it anywhere vaguely relevant is better than not having it.

>
> Leveraging that the CPU stores zero in the upper bits of the selector
> register slots, the save sequence could also be
>
>         shl   $16, %rcx
>         or    %rcx, UREGS_entry_ssp-2(%rsp)
>
> That's shorter and avoids a 16-bit operation, but may be less desirable,
> for being a read-modify-write access.

I doubt you'll be able to measure a difference between the two options
(it's into the active stack, after all), but the two stores is probably
marginally better.  When shstks are active, we're taking a large hit
from the busy token handling.

I was concerned by the misaligned access, but it's not misaligned, its
it?  It's the start of entry_ssp which is misaligned and the -2 brings
it back to being properly aligned.

> --- a/xen/arch/x86/include/asm/asm_defns.h
> +++ b/xen/arch/x86/include/asm/asm_defns.h
> @@ -221,7 +221,7 @@ static always_inline void stac(void)
>  #endif
>  
>  #ifdef __ASSEMBLY__
> -.macro SAVE_ALL compat=0
> +.macro SAVE_ALL compat=0 ssp=IS_ENABLED(CONFIG_XEN_SHSTK)

I'm not sure this is what you want to do.  Because it's only the
default, we'll still....

>          addq  $-(UREGS_error_code-UREGS_r15), %rsp
>          cld
>          movq  %rdi,UREGS_rdi(%rsp)
> @@ -235,6 +235,9 @@ static always_inline void stac(void)
>          movq  %rax,UREGS_rax(%rsp)
>          xor   %eax, %eax
>  .if !\compat
> +.if \ssp
> +        rdsspq %rcx

... pick this up even in !CONFIG_XEN_SHSTK builds, and ...

> +.endif
>          movq  %r8,UREGS_r8(%rsp)
>          movq  %r9,UREGS_r9(%rsp)
>          movq  %r10,UREGS_r10(%rsp)
> @@ -264,6 +267,11 @@ static always_inline void stac(void)
>          xor   %r13d, %r13d
>          xor   %r14d, %r14d
>          xor   %r15d, %r15d
> +.if \ssp && !\compat
> +        mov   %cx, UREGS_entry_ssp(%rsp)
> +        shr   $16, %rcx
> +        mov   %ecx, UREGS_entry_ssp+2(%rsp)

... store it here.

I think you need to use ssp=1 by default, and

#ifdef CONFIG_XEN_SHSTK
.if
    ...

for these two blocks, so they disappear properly in !SHSTK builds.

But for the rest of the behaviour, there are two overlapping things,
because you end up getting entry_ssp=0 in SHSTK builds running on
hardware without shstk active.

And with that in mind, to confirm, the RDSSP block depends on the xor
%ecx,%ecx between the two hunks in order to function as intended?

> --- a/xen/include/public/arch-x86/xen-x86_64.h
> +++ b/xen/include/public/arch-x86/xen-x86_64.h
> @@ -183,7 +183,19 @@ struct cpu_user_regs {
>      uint8_t  _pad1[3];
>      __DECL_REG_LO16(flags); /* rflags.IF == !saved_upcall_mask */
>      __DECL_REG_LO8(sp);
> -    uint16_t ss, _pad2[3];
> +    uint16_t ss;
> +#if !defined(__XEN__)
> +    uint16_t _pad2[3];
> +#elif defined(COMPILE_OFFSETS)
> +    uint16_t entry_ssp[3];
> +#else
> +    /*
> +     * This points _at_ the corresponding shadow stack frame; it is _not_ the
> +     * outer context's SSP.  That, if the outer context has CET-SS enabled,
> +     * is stored in the top slot of the pointed to shadow stack frame.
> +     */
> +    signed long entry_ssp:48;
> +#endif

I have to admit that I dislike this.  (And only some of that is because
it's work I'm going to have to revert in order to make FRED support work...)

We desperately need to break our use of this structure to start with,
and with that done, we don't need to play games about hiding SSP in a
spare 6 bytes in an ABI dubiously made public nearly two decades ago.

How hard would it be just:

#define cpu_user_regs abi_cpu_user_regs
#include <public/xen.h>
#undef cpu_user_regs

and make a copy of cpu_user_regs that we can really put an SSP field into?

It would make this patch more simple, and we could finally get the vm86
block off the stack (which also fixes OoB accesses in the #DF handler -
cant remember if I finished the bodge around that or not.)

Irrespective of anything else, why do we have COMPILE_OFFSETS getting in
here?

~Andrew

