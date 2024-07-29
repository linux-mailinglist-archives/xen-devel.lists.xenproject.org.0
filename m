Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C160693F9B5
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 17:40:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766929.1177462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYSUA-0007fn-GJ; Mon, 29 Jul 2024 15:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766929.1177462; Mon, 29 Jul 2024 15:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYSUA-0007cm-Dh; Mon, 29 Jul 2024 15:40:30 +0000
Received: by outflank-mailman (input) for mailman id 766929;
 Mon, 29 Jul 2024 15:40:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+rL=O5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sYSU8-0007cb-UF
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 15:40:28 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0ff2571-4dc0-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 17:40:27 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5af326eddb2so5092496a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 08:40:27 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad41027sm522974466b.122.2024.07.29.08.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 08:40:26 -0700 (PDT)
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
X-Inumbo-ID: e0ff2571-4dc0-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722267627; x=1722872427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hHHOTZKfN5Mg8lHknKrtPcg1fIky6wy2Oya5b6jbNgA=;
        b=inKC5Vf0ytWvKVoCBOhA1GE/UXs55sM5j088B1dThTc7Ff6+yZovQiWPxizdDaBpls
         oLPwv3CqKlIiZ8w69UZFHt2KUszNlqu1mjEKV/vAu2xd25uE6cTBiQTwf64/SejShLm8
         gYGZ3mvQUwsWT0Pbl94SYAVm7m6pIVwurl4Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722267627; x=1722872427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHHOTZKfN5Mg8lHknKrtPcg1fIky6wy2Oya5b6jbNgA=;
        b=uLqVUoP5e0VW5IkagQl22V4feuBFcr8ewyibjR9KHiRzCHYuRtrWgF4IeZS21Fp5i9
         KeYMN+Tnqo+B6gz7JkkGfgp6LdgN+YRh2NPWj1uQmaaQaOKyC5fxiW1XcbGOKDk/jdH8
         ewbP5bnXdJpSkzL5rB+d+PKzrperwd9pdvN3TKCgNyHnsJBTQ6Gjoq9mXBXXB7sGXQ1R
         xNxb6W5iLfw5VdBFkQx8MbmSs9PrMc7jytvdRA/wYSer6uwI3RZKX5hIkc+DOlha+psa
         9YohcPBbqyMw2wv2NEHBcL7tVqrzyY9mlq2h0T869BMqOEOU/bg8O4jENUivucfuiB3J
         UTpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZXQck08i0Pa8gmwTvuZZicWlUFGgLt7em5T9wzIrnR089w5aKsJ8bkuEaIrPt398LtJM+vbToQSQUIKkKr8CMo6KqP2QAN2QJj4F2gw4=
X-Gm-Message-State: AOJu0YwGSqBR7GKrk2VmAdYAiRFIA+jNkITmG1rCsAMIbwwLU2Sp3MXj
	UGV+a2fSkPdFx5Jg1eT/0Wk/u/1jRtgNkx/0khoq/kOpObf5ZK4f5sKDuyV5fsNDPI8VoZ39Aru
	d
X-Google-Smtp-Source: AGHT+IGFbTEuU1IeKrRDIbs6G54/h7kmEPRz9J+KeQUlSOO1/oeYmQFvaDGPYx5+U9EXfsE81WXw+A==
X-Received: by 2002:a17:907:1c19:b0:a6f:e03a:99d with SMTP id a640c23a62f3a-a7d3f514a03mr942560466b.0.1722267626965;
        Mon, 29 Jul 2024 08:40:26 -0700 (PDT)
Message-ID: <5e600017-e929-4ebf-b620-1e673b06fc1a@citrix.com>
Date: Mon, 29 Jul 2024 16:40:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/22] x86/mm: zero stack on stack switch or reset
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com, Jan Beulich <jbeulich@suse.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-23-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240726152206.28411-23-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/07/2024 4:22 pm, Roger Pau Monne wrote:
> With the stack mapped on a per-CPU basis there's no risk of other CPUs being
> able to read the stack contents, but vCPUs running on the current pCPU could
> read stack rubble from operations of previous vCPUs.
>
> The #DF stack is not zeroed because handling of #DF results in a panic.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/include/asm/current.h | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
> index 75b9a341f814..02b4118b03ef 100644
> --- a/xen/arch/x86/include/asm/current.h
> +++ b/xen/arch/x86/include/asm/current.h
> @@ -177,6 +177,14 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>  # define SHADOW_STACK_WORK ""
>  #endif
>  
> +#define ZERO_STACK                                              \
> +    "test %[stk_size], %[stk_size];"                            \
> +    "jz .L_skip_zeroing.%=;"                                    \
> +    "std;"                                                      \
> +    "rep stosb;"                                                \
> +    "cld;"                                                      \
> +    ".L_skip_zeroing.%=:"
> +
>  #if __GNUC__ >= 9
>  # define ssaj_has_attr_noreturn(fn) __builtin_has_attribute(fn, __noreturn__)
>  #else
> @@ -187,10 +195,24 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>  #define switch_stack_and_jump(fn, instr, constr)                        \
>      ({                                                                  \
>          unsigned int tmp;                                               \
> +        bool zero_stack = current->domain->arch.asi;                    \
>          BUILD_BUG_ON(!ssaj_has_attr_noreturn(fn));                      \
> +        ASSERT(IS_ALIGNED((unsigned long)guest_cpu_user_regs() -        \
> +                          PRIMARY_STACK_SIZE +                          \
> +                          sizeof(struct cpu_info), PAGE_SIZE));         \
> +        if ( zero_stack )                                               \
> +        {                                                               \
> +            unsigned long stack_top = get_stack_bottom() &              \
> +                                      ~(STACK_SIZE - 1);                \
> +                                                                        \
> +            clear_page((void *)stack_top + IST_MCE * PAGE_SIZE);        \
> +            clear_page((void *)stack_top + IST_NMI * PAGE_SIZE);        \
> +            clear_page((void *)stack_top + IST_DB  * PAGE_SIZE);        \
> +        }                                                               \
>          __asm__ __volatile__ (                                          \
>              SHADOW_STACK_WORK                                           \
>              "mov %[stk], %%rsp;"                                        \
> +            ZERO_STACK                                                  \
>              CHECK_FOR_LIVEPATCH_WORK                                    \
>              instr "[fun]"                                               \
>              : [val] "=&r" (tmp),                                        \
> @@ -201,7 +223,13 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>                ((PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8),               \
>                [stack_mask] "i" (STACK_SIZE - 1),                        \
>                _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__,                \
> -                                 __FILE__, NULL)                        \
> +                                 __FILE__, NULL),                       \
> +              /* For stack zeroing. */                                  \
> +              "D" ((void *)guest_cpu_user_regs() - 1),                  \
> +              [stk_size] "c"                                            \
> +              (zero_stack ? PRIMARY_STACK_SIZE - sizeof(struct cpu_info)\
> +                          : 0),                                         \
> +              "a" (0)                                                   \
>              : "memory" );                                               \
>          unreachable();                                                  \
>      })

This looks very expensive.

For starters, switch_stack_and_jump() is used twice in a typical context
switch; once in the schedule tail, and again out of hvm_do_resume().

Furthermore, #MC happen never (to many many significant figures), #DB
happens never for HVM guests (but does happen for PV), and NMIs are
either ~never, or 2Hz which is far less often than the 30ms default
timeslice.

So, the overwhelming majority of the time, those 3 calls to clear_page()
will be re-zeroing blocks of zeroes.

This can probably be avoided by making use of ist_exit (held in %r12) to
only zero an IST stack when leaving it.  This leaves the IRET frame able
to be recovered, but with e.g. RFDS, you can do that irrespective, and
it's not terribly sensitive.


What about shadow stacks?  You're not zeroing those, and while they're
less sensitive than the data stack, there ought to be some reasoning
about them.

~Andrew

