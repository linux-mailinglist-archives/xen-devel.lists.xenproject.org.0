Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F78A8A692F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 12:56:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706876.1104322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwgTy-00083W-Sn; Tue, 16 Apr 2024 10:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706876.1104322; Tue, 16 Apr 2024 10:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwgTy-00081B-Of; Tue, 16 Apr 2024 10:56:10 +0000
Received: by outflank-mailman (input) for mailman id 706876;
 Tue, 16 Apr 2024 10:56:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BYTd=LV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rwgTx-00080w-4L
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 10:56:09 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecd88628-fbdf-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 12:56:07 +0200 (CEST)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-69629b4ae2bso37070846d6.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 03:56:07 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u9-20020a05621411a900b0069b57111a98sm5939304qvv.79.2024.04.16.03.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 03:56:05 -0700 (PDT)
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
X-Inumbo-ID: ecd88628-fbdf-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713264966; x=1713869766; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d9z7WRYShidWsM5MiHYhU2fAxi+R6Zu3pFICuH4pcxQ=;
        b=p0af7CkNUQte51aAE4NDpE6L0rhvA9PCRxlMiyzlqLk/c2auq6WPIjgyXgo+g9HOEo
         4V+pZRt67kkIo7m0V42Pr7LK3/Cq8nAzO6Ni6vhqweynM57Fuitp60Y9gYUbK1vxGmQ0
         tux9m2x1WZhW9QAEYc6X3mn1wIbP7gZMLhJ98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713264966; x=1713869766;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9z7WRYShidWsM5MiHYhU2fAxi+R6Zu3pFICuH4pcxQ=;
        b=AtqpgYzU8qM3I/zy+aErUFEL5ijk/zpIw3/K3QfH+XTSraEO2V/0VHfUL0IaccaRs5
         6bxOyNDUNUrtnvqjNNqSo4+3I4njbmhmbl+ZN1G+a2KrjrvtZ88a6hTmUsNmY08MWeEH
         Up12/7ZAl8K5qjBhhKJLhdWGmC2mKy2wkEdgHopBEp3D4ZbgX50Utm9A/TiVl7FsAyNp
         ZNNq8mcTiZtNOSf5gSiZt8C7GcG1OzjJb/5Xx9s/uH/1LFKNbi3ZbN+njNuLczownZqR
         wifxmBqi+f9vhbYYjbBAhRpqqdEoBPvEDA8HQlyrzh2/qD/5v6uvsaIYUQah5hNZe/S1
         GAuA==
X-Forwarded-Encrypted: i=1; AJvYcCUFk77YwwcPPGBjFXYiiewEJ1eHwCxYX8UsjXwXjmCmHHJ+ZyYBfbXzWZNHMsjEufWg5KpuF4IwDodSbToLmJmfQpiQxSUDNsNtX5DwFlI=
X-Gm-Message-State: AOJu0Yx8WbadFR7m7oLOmtsIfh7p9mQplxUCcs9wk5RLt+AF17htQBRi
	Mgev8EaCdwmThncXGC5X2wmaUXxp39MEliW8EeiLbU2wQHZ+uk6gw8AB/07XRwE/Jib88IMJEga
	k49E=
X-Google-Smtp-Source: AGHT+IFbLJLmH/4O3T46wocfE+PWQ5ggyZThhbxooVBhICJ8nT79x5Z0JkjSDVTt4Ipj7oGoGpmOFQ==
X-Received: by 2002:a0c:ef8a:0:b0:69b:52fb:fb88 with SMTP id w10-20020a0cef8a000000b0069b52fbfb88mr11807804qvr.41.1713264965978;
        Tue, 16 Apr 2024 03:56:05 -0700 (PDT)
Message-ID: <10e8d4a3-2e53-478c-bb77-a038f2187c5a@citrix.com>
Date: Tue, 16 Apr 2024 11:56:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Mini-OS: add some macros for asm statements
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org
References: <20240416071139.11083-1-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240416071139.11083-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/04/2024 8:11 am, Juergen Gross wrote:
> diff --git a/arch/x86/sched.c b/arch/x86/sched.c
> index dabe6fd6..460dea2e 100644
> --- a/arch/x86/sched.c
> +++ b/arch/x86/sched.c
> @@ -119,20 +113,12 @@ struct thread* arch_create_thread(char *name, void (*function)(void *),
>  
>  void run_idle_thread(void)
>  {
> -    /* Switch stacks and run the thread */ 
> -#if defined(__i386__)
> -    __asm__ __volatile__("mov %0,%%esp\n\t"
> -                         "push %1\n\t" 
> -                         "ret"                                            
> +    /* Switch stacks and run the thread */
> +    __asm__ __volatile__("mov %0,"ASM_SP"\n\t"
> +                         "push %1\n\t"
> +                         "ret"
>                           :"=m" (idle_thread->sp)
> -                         :"m" (idle_thread->ip));                          
> -#elif defined(__x86_64__)
> -    __asm__ __volatile__("mov %0,%%rsp\n\t"
> -                         "push %1\n\t" 
> -                         "ret"                                            
> -                         :"=m" (idle_thread->sp)
> -                         :"m" (idle_thread->ip));                                                    
> -#endif
> +                         :"m" (idle_thread->ip));

I know you're only transforming the existing logic, but this is dodgy in
several ways.

First, PUSH/RET is more commonly spelt JMP.  Second, sp is an input
parameter not an output, so I'm pretty sure this only works by luck.

00000000000001ee <run_idle_thread>:
 1ee:   55                      push   %rbp
 1ef:   48 89 e5                mov    %rsp,%rbp
 1f2:   48 8b 05 00 00 00 00    mov    0x0(%rip),%rax        # 1f9
<run_idle_thread+0xb>
 1f9:   48 8b 15 00 00 00 00    mov    0x0(%rip),%rdx        # 200
<run_idle_thread+0x12>
 200:   48 8b 60 10             mov    0x10(%rax),%rsp
 204:   ff 72 18                pushq  0x18(%rdx)
 207:   c3                      retq   
 208:   90                      nop
 209:   5d                      pop    %rbp
 20a:   c3                      retq   


This only works because the address constructed for sp's "output" is
happens to be on a single-parameter instruction where's its good as an
input too.

Anyway, this is a much better way of writing it:

    asm volatile ("mov %[sp], %%"ASM_SP"\n\t"
                  "jmp *%[ip]\n\t"
                  :
                  : [sp] "m" (idle_thread->sp),
                    [ip] "m" (idle_thread->ip));

and also highlights that run_idle_thread() should be marked noreturn.

>  }
>  
>  unsigned long __local_irq_save(void)
> diff --git a/include/x86/os.h b/include/x86/os.h
> index ee34d784..485d90b8 100644
> --- a/include/x86/os.h
> +++ b/include/x86/os.h
> @@ -77,6 +77,17 @@ int  arch_suspend(void);
>  void arch_post_suspend(int canceled);
>  void arch_fini(void);
>  
> +#if defined(__i386__)
> +#define __SZ    "l"
> +#define __REG   "e"
> +#else
> +#define __SZ    "q"
> +#define __REG   "r"
> +#endif
> +
> +#define ASM_SP  "%%"__REG"sp"

The %% should be at the usage sites, not here.  That way, you can use
ASM_SP in e.g. file-scope asm where it's spelt with a single %.

> +#define ASM_MOV "mov"__SZ

There's no need for ASM_MOV.  Regular plain mov (no suffix) will work in
all the cases you're trying to use it, and makes the asm easier to
read.  Notice how run_idle_thread() is already like this.

~Andrew

