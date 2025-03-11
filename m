Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5B3A5C3B1
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 15:22:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908208.1315348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts0UV-0007os-Jj; Tue, 11 Mar 2025 14:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908208.1315348; Tue, 11 Mar 2025 14:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts0UV-0007mn-Gh; Tue, 11 Mar 2025 14:21:55 +0000
Received: by outflank-mailman (input) for mailman id 908208;
 Tue, 11 Mar 2025 14:21:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isYZ=V6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ts0UU-0007mh-Au
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 14:21:54 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dfc7741-fe84-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 15:21:53 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso61351035e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 07:21:53 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d031d1438sm13068265e9.0.2025.03.11.07.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 07:21:52 -0700 (PDT)
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
X-Inumbo-ID: 2dfc7741-fe84-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741702913; x=1742307713; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yHdmUhS8bEnAo05Zk1DYVHXa83vBJHIJ+q0jLYFJDoo=;
        b=Nu6buf1dsVHBp3pcCOLew5oUgwJyASrb9aTvJwpUnlB6YZSwOHIJxgDzgZ9Tr+N6/s
         cLdTyW9dzNdlj3+QiaQibQqJauBmYDslazpSXeAYRV8uzTIgdChZifyIp+I8vyqw2WGz
         6H04pldJNfsfV+spuvk0xUQbKYMFu/7xRHCP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741702913; x=1742307713;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHdmUhS8bEnAo05Zk1DYVHXa83vBJHIJ+q0jLYFJDoo=;
        b=c7o+7YeL0a/DSyqRS8qNsWhOb/hrYmOMF+abpOyfXqwiSXVbMaj9zGm9dAc3MM2wfW
         Ce4vE2hr2uvt2OeFBtB8Ma77Rq5PhJ1m1MFTmjyiBYF91aTXN3CG4TcpXOHyN6lRyYo5
         7TANlPV7nNj3GwwWw8JcEr578S+OPiqCFHbtFLavXaDW3mVoJXHV9sTIZVaE0ibiX/EY
         +oc1elXn0wf+LSlBMHZIb8JNpRrHTPqVt3rhLoPdYY4DtKSPTb5L4gTjWelW3vfDiaze
         HsJrd+9Ut1cGgSsKsWsecagd7z9KJMofGDyx7WBrTAPjaJy+Bdyv5wouuKeoEtaG2FA3
         mYyg==
X-Forwarded-Encrypted: i=1; AJvYcCUgQcKdxySNKiN4wed6P62v44rtlSS2pu4Gv/R8dsXWoy7aLTeAePEacC0PWIdeyJmM3TnT0tBV3xo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPE5TIfM9NrmHWyKSZjAYFm+CyGJjlh4T+hXBLjIwCmQU82iV+
	DDGjkzHFv1RLnredEiHvlNAMDigYeEIuakexAwdi0iHay9dvzk578mQNN9NdoiVk0z3hKqp1l6Q
	H
X-Gm-Gg: ASbGnculVzXijeRZoLku1Y5smYkzz4bY6H2XGKS5D+S+8nHWoRIY3ZyZc8NC++5IOr7
	4uvedGeHlrd1oAQOMoOEASTRqC/WOR+NJadDA72cszU2W1vqpsSL1GBNkBX6qv4c69xGS+obDrl
	hhHFZc26Xm6lDkRZJmI4YABPqIG5mGkPDAZIxneT3exh9NV3KqjcA1FaLEiqW3WxPfPaGGarGzv
	Ry5Y4Ny1Zp7RO56pHMjclKm3n63blCmCBLOrjB1UWiKTg2ajOkDu/r9jRrAacZ+oq0rIFX2+REc
	nC8jivKO5Q6gPruJZjN4EF+xE3dHR+xHknDDLtVALMACdKGo83sjku8uW5sBbIqc5UzcMGB9R+p
	soam9iiZ3
X-Google-Smtp-Source: AGHT+IHfT6JK70zVTjIjY4yrHGyisG2ZcPuccF/6j0YKI0q3Tnr8NBmgagR793qj6wU3HJZwR5r8Yg==
X-Received: by 2002:a05:600c:4eca:b0:43d:762:e0c4 with SMTP id 5b1f17b1804b1-43d0762e364mr19917575e9.27.1741702912690;
        Tue, 11 Mar 2025 07:21:52 -0700 (PDT)
Message-ID: <3dd5e64c-81cd-44fe-808a-c09e55c92d32@citrix.com>
Date: Tue, 11 Mar 2025 14:21:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/elf: Improve code generation in elf_core_save_regs()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250225224559.1226079-1-andrew.cooper3@citrix.com>
 <68a14ea8-b6f0-448e-8713-e9696c024c43@suse.com>
 <b9bdba63-82a4-4833-b8bd-b3788fd02321@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b9bdba63-82a4-4833-b8bd-b3788fd02321@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/02/2025 8:44 am, Jan Beulich wrote:
> On 26.02.2025 08:44, Jan Beulich wrote:
>> On 25.02.2025 23:45, Andrew Cooper wrote:
>>> A CALL with 0 displacement is handled specially, and is why this logic
>>> functions even with CET Shadow Stacks active.  Nevertheless a rip-relative LEA
>>> is the more normal way of doing this in 64bit code.
>>>
>>> The retrieval of flags modifies the stack pointer so needs to state a
>>> dependency on the stack pointer.  Despite it's name, ASM_CALL_CONSTRAINT is
>>> the way to do this.
>>>
>>> read_sreg() forces the answer through a register, causing code generation of
>>> the form:
>>>
>>>     mov    %gs, %eax
>>>     mov    %eax, %eax
>>>     mov    %rax, 0x140(%rsi)
>>>
>>> Encode the reads directly with a memory operand.  This results in a 16bit
>>> store instead of an 64bit store, but the backing memory is zeroed.
>> Raises the question whether we shouldn't change read_sreg(). At least the
>> emulator uses of it would also benefit from storing straight to memory. And
>> the remaining uses ought to be optimizable by the compiler, except that I
>> don't expect we'd be able to express the zero-extending nature when the
>> destination is a register. Or wait, maybe I can make up something (whether
>> that's going to be liked is a separate question).
> Here you go.
>
> Jan
>
> x86: make read_sreg() "bi-modal"
>
> Permit use sites to control whether to store directly to memory; right
> now both elf_core_save_regs() and the insn emulator's put_fpu()
> needlessly go through an intermediate GPR. Note that in both cases the
> apparent loss of zero-extension isn't a problem: The fields written to
> start out zero-initialized anyway.
>
> No change in generated code for the use sites not being touched.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Whether to make the change to put_fpu() is up for discussion: In my
> build it increases code size slightly, despite the reduction of number
> of insns emitted. An alternative (leaving the decision to the compiler)
> might be to drop the if() and use "=g" as constraint.
>
> I was considering to omit the assignment to sel_ on the if() branch,
> expecting the compiler to then flag uses of the return value (as
> consuming uninitialized data) when a 2nd argument is passed. However,
> gcc14 then already flags the "sel_;" at the end of the macro as
> consuming uninitialized data.
>
> --- a/xen/arch/x86/include/asm/regs.h
> +++ b/xen/arch/x86/include/asm/regs.h
> @@ -16,10 +16,20 @@
>      !diff || ((r)->cs != __HYPERVISOR_CS);                                    \
>  })
>  
> -#define read_sreg(name) ({                           \
> -    unsigned int __sel;                              \
> -    asm ( "mov %%" STR(name) ",%0" : "=r" (__sel) ); \
> -    __sel;                                           \
> +#define read_sreg(name, dst...) ({                       \
> +    unsigned int sel_;                                   \
> +    BUILD_BUG_ON(count_args(dst) > 1);                   \
> +    if ( count_args(dst) )                               \
> +    {                                                    \
> +        typeof(LASTARG(&sel_, ## dst)) dst_ =            \
> +            LASTARG(&sel_, ## dst);                      \
> +        asm ( "mov %%" STR(name) ",%0" : "=m" (*dst_) ); \
> +        /* The compiler ought to optimize this out. */   \
> +        sel_ = *dst_;                                    \
> +    }                                                    \
> +    else                                                 \
> +        asm ( "mov %%" STR(name) ",%0" : "=r" (sel_) );  \
> +    sel_;                                                \
>  })

This doesn't fix the register promotion problem.  That can be fixed by
unsigned long rather than int, as you did for rdmsr. 
https://godbolt.org/z/K5hKz7KvM

But the fundamental problem is that the sreg instructions with mem16
encodings are weird.  They don't even follow normal x86 rules for
operand size.

By the end of the FRED series (for which this patch was misc cleanup),
I've almost removed read_sreg(), and was intending to purge it
completely.  Even in it's current form, it's not normal C semantics,
because it looks to take a variable which isn't a variable.

Clever as this trick is, I feel it's a backwards step in terms of
legibility, and that plain asm()'s are the lesser evil when it comes to
mem16 instructions.

~Andrew

