Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB93C9389E5
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 09:16:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761507.1171439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVnGo-00080Q-SG; Mon, 22 Jul 2024 07:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761507.1171439; Mon, 22 Jul 2024 07:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVnGo-0007yc-Pb; Mon, 22 Jul 2024 07:15:42 +0000
Received: by outflank-mailman (input) for mailman id 761507;
 Mon, 22 Jul 2024 07:15:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVnGn-0007yW-KD
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 07:15:41 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 338f58bb-47fa-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 09:15:40 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a77c349bb81so368707666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 00:15:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c9233c5sm382848266b.185.2024.07.22.00.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 00:15:39 -0700 (PDT)
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
X-Inumbo-ID: 338f58bb-47fa-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721632540; x=1722237340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I+/Vgod0fktbuHqI7yZLmkeiuCeHf5w5rjOdro5VCqU=;
        b=USdB+YbGUFvmvi/4JTu0J8AYkGe/lzFnUwzZDnCx2H0mQtrNtgW400u7rlGWALzPJy
         fpa1kEmGkthvCaC478u2nSOYWUm96tTaPPi3Lz2+dxWjeUcqsfzmikwllYksUabcenP1
         wt3CfNvUFyMEhr9GbIXuxg//QfFYk4+tH1Afc7K6HPj/J4X1p0EkwfoLRMIjnpjzTLrL
         XsqgWHDYEKJWQYF3olproVG0TXndogXwZwag89FijT5ft0d8e1eOV1pNFOmciSwqsrPn
         7E0bF+1m8CvbGfgBEpsZx19a1AlzOV53Sm9Hp98KXFh8hr/wN/7ajywL/3YJK5Ha7ffz
         FnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721632540; x=1722237340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+/Vgod0fktbuHqI7yZLmkeiuCeHf5w5rjOdro5VCqU=;
        b=pQjB8cW5Q0jKRECohLMhxwUEUfW8MEod/kt2KCCVYzLUclf5CWsRABr0UaOpkpK4Aw
         LgD344rM4LEZ4J5Krk0+vR6GhkFNbGWUBK3HVjo9tvcew8jazd12gwMNqOCf/SYfu84w
         FcNiP0p8QuN84URxDxuQaVe7GV/Eh6gxjbdKjgLELtMbcjHX/PuD4NVZA8b/AufncqCt
         VoaNGMdHzlTNqsVSRwptYVMOv0bqg2sU/ax6cUEwblBdTZvDQYvWIFKhQgbkhd/mKmoi
         QpcTlvbp+gtcqXUwAlB36s0LvjtiEtYSWcXr7ZW+kI+9FESD5NtMxHeh8A9xGgWtppHY
         qHEA==
X-Forwarded-Encrypted: i=1; AJvYcCWXdB7S4TVU7K53ZMFZdvcHaTI0F7bVdKlSS5Qc4g5aOZiIUIF18b2640W7tUyDaPSc3l8p85wAdIQgKLg8+IrxLhY2bCIT/fPHUsKXGDw=
X-Gm-Message-State: AOJu0YwAjbJ51aX2RTmw/3Y9kpcflF73WGUsxAAvVqy63SJHP7kDE8Qo
	u+GwySiKscyrvANyP0fjE1dSD2KgzF/CZJ+FYQ6SdWIofdx7jN0ewW4kngCJkQ==
X-Google-Smtp-Source: AGHT+IGgYTCy7irMQCSlIXJ4qjae7T7NyhhHviRZAyBf6PzP4paIYcQcGtGbLIRSsiSayYaA0Ob7rA==
X-Received: by 2002:a17:906:6a19:b0:a75:25ff:550d with SMTP id a640c23a62f3a-a7a4c010608mr356163866b.26.1721632540008;
        Mon, 22 Jul 2024 00:15:40 -0700 (PDT)
Message-ID: <0c76f87a-ca46-4511-9a6d-9ffc10815295@suse.com>
Date: Mon, 22 Jul 2024 09:15:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Mini-OS: add some macros for asm statements
To: Juergen Gross <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20240719155701.18856-1-jgross@suse.com>
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
In-Reply-To: <20240719155701.18856-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.07.2024 17:57, Juergen Gross wrote:
> --- a/arch/x86/sched.c
> +++ b/arch/x86/sched.c
> @@ -60,16 +60,10 @@ void dump_stack(struct thread *thread)
>      unsigned long *bottom = (unsigned long *)(thread->stack + STACK_SIZE); 
>      unsigned long *pointer = (unsigned long *)thread->sp;
>      int count;
> -    if(thread == current)
> -    {
> -#ifdef __i386__    
> -        asm("movl %%esp,%0"
> -            : "=r"(pointer));
> -#else
> -        asm("movq %%rsp,%0"
> -            : "=r"(pointer));
> -#endif
> -    }
> +
> +    if ( thread == current )
> +        asm("mov %%"ASM_SP",%0" : "=r"(pointer));

As you switch the if() to Xen style, why not also the asm()? Irrespective of
which precise style is meant to be used, the last closing double quote likely
also wants to be followed by a blank?

> @@ -119,20 +113,12 @@ struct thread* arch_create_thread(char *name, void (*function)(void *),
>  
>  void run_idle_thread(void)
>  {
> -    /* Switch stacks and run the thread */ 
> -#if defined(__i386__)
> -    __asm__ __volatile__("mov %0,%%esp\n\t"
> -                         "push %1\n\t" 
> -                         "ret"                                            
> -                         :"=m" (idle_thread->sp)
> -                         :"m" (idle_thread->ip));                          
> -#elif defined(__x86_64__)
> -    __asm__ __volatile__("mov %0,%%rsp\n\t"
> -                         "push %1\n\t" 
> -                         "ret"                                            
> -                         :"=m" (idle_thread->sp)
> -                         :"m" (idle_thread->ip));                                                    
> -#endif
> +    /* Switch stacks and run the thread */
> +    asm volatile ("mov %[sp], %%"ASM_SP"\n\t"
> +                  "jmp *%[ip]\n\t"
> +                  :
> +                  : [sp] "m" (idle_thread->sp),
> +                    [ip] "m" (idle_thread->ip));
>  }

Here instead you look to be switching to Linux style. Was that intended?

As an aside, I think the construct is slightly problematic: In principle
the compiler could make a copy of idle_thread->ip on the stack. (It
won't normally, for code efficiency reasons.) That would break with the
earlier change of the stack pointer. Using an "r" constraint would
perhaps be better there. Yet if so wanted, that would certainly be a
separate change.

With the adjustments (or respective clarifications as to style intentions),
which I'd be fine making while committing so long as you agree:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

