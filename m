Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864DC87A33A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 08:11:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692274.1079219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkIkS-0007zS-Kw; Wed, 13 Mar 2024 07:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692274.1079219; Wed, 13 Mar 2024 07:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkIkS-0007x6-IQ; Wed, 13 Mar 2024 07:10:00 +0000
Received: by outflank-mailman (input) for mailman id 692274;
 Wed, 13 Mar 2024 07:09:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dxry=KT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rkIkR-0007x0-3x
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 07:09:59 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2f619f1-e108-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 08:09:57 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5684073ab38so1021343a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 00:09:57 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a05640205d500b0056884feacd4sm381463edx.39.2024.03.13.00.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 00:09:56 -0700 (PDT)
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
X-Inumbo-ID: b2f619f1-e108-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710313797; x=1710918597; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VFM7NHjFeiFIkXrKy4Ve+I5tMlDvoiqgvY2hf19yC/M=;
        b=Qa/A+0EkjhEyWhDvIGJlYI1yqPnhbXvmVBuXpW2IMmmWEPdKCd7FbuWt5qLSk6MRYl
         mP6vIcAPVQAw7sPjRmvAJMsc44b/1Rja9FoY5qodtc28gEdXOutFdfQV1jiURGUvHwOk
         zoAbuhLAYNZ2K4dKAvMovIFCTmab3OQV6iCrO/HxSHRYrABKmcxnzMtRs32/jAvC+dfh
         auhg/NmnkgL6pjFnK2vtXNoN3N5gwceuGjFPrdRdt/ee2jKXtazM6QNeTRAQZMVLofbS
         oxpNW3K9RUz4uW1leGLOgaa7RCQA83qfS4OPccezUDRp1ozdinbbA28d3JspgxkAPrhZ
         NnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710313797; x=1710918597;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFM7NHjFeiFIkXrKy4Ve+I5tMlDvoiqgvY2hf19yC/M=;
        b=OYC3foD9KzfBOPkV8Ufw5CLoH/ZsjAsVJmCqp2buqphuFsBBrMoPFeVm8S3RdcIWTv
         5BwCoXnmmWTwcjGWmszflvsTzY8o/2OaYWVicrDp12/eveK4zhj17wdMDpCIottdaNfP
         JjML4Kvt083U+zWgNUuU85hJqdPCIytmNAGMdhqCCtdnheMsQ9IoQfSd3YddTCOs2607
         cI1+RbYHU1GqTvMg1svSNhtoH7US8D/By31mJRMiuy6WGQkmhBkV5pIuPBTTewHglYTB
         96ldzpcTPCN2DSez0tUI05rQ22xnVtKP2r/xYK4WyqXpME9T3wpGMuSh0Zah1J9oUzgj
         J22A==
X-Forwarded-Encrypted: i=1; AJvYcCUoeAf/UNFt4B4YTVRXx39SyJAoGPKCqp667/2ub39Nd5KkPL4OObMYtl2VRHHfdBiieZry8gMsZpRo4AuNkgFUbGbs8WcV+0K4kAKFSgE=
X-Gm-Message-State: AOJu0Yx6UIFemsjZ1gmt71EtXxEW/4IMXlTVxglI5tzTJcDZgjB2WG3A
	W1Smi6IjYy2e3NJKMcXw7/Z847KTOeRFU4ZF7C5nhTS+ZRAw5dqhzhR7DAWYLdk=
X-Google-Smtp-Source: AGHT+IFe/fyuKeyjO4QV1x01xdRBrc72d4UA/whVUFl6wfKoaLR7gJ9oQQHnXlmLUa47VVYaHB/K8g==
X-Received: by 2002:a50:9b58:0:b0:567:e0e:dda5 with SMTP id a24-20020a509b58000000b005670e0edda5mr1632316edj.17.1710313796845;
        Wed, 13 Mar 2024 00:09:56 -0700 (PDT)
Message-ID: <ab57dce7-6e89-44aa-a87a-2ffa8cc87fc4@suse.com>
Date: Wed, 13 Mar 2024 08:09:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] x86: Rename __{start,end}_init_task to
 __{start,end}_init_stack
Content-Language: en-US
To: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-arch@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 boris.ostrovsky@oracle.com, arnd@arndb.de
References: <20240313060546.1952893-1-xin@zytor.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240313060546.1952893-1-xin@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.03.24 07:05, Xin Li (Intel) wrote:
> The stack of a task has been separated from the memory of a task_struct
> struture for a long time on x86, as a result __{start,end}_init_task no
> longer mark the start and end of the init_task structure, but its stack
> only.
> 
> Rename __{start,end}_init_task to __{start,end}_init_stack.
> 
> Note other architectures are not affected because __{start,end}_init_task
> are used on x86 only.
> 
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> ---
>   arch/x86/include/asm/processor.h  | 4 ++--
>   arch/x86/kernel/head_64.S         | 2 +-
>   arch/x86/xen/xen-head.S           | 2 +-
>   include/asm-generic/vmlinux.lds.h | 8 ++++----
>   4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
> index 811548f131f4..8b3a3f3bb859 100644
> --- a/arch/x86/include/asm/processor.h
> +++ b/arch/x86/include/asm/processor.h
> @@ -636,10 +636,10 @@ static __always_inline void prefetchw(const void *x)
>   #define KSTK_ESP(task)		(task_pt_regs(task)->sp)
>   
>   #else
> -extern unsigned long __end_init_task[];
> +extern unsigned long __end_init_stack[];
>   
>   #define INIT_THREAD {							\
> -	.sp	= (unsigned long)&__end_init_task -			\
> +	.sp	= (unsigned long)&__end_init_stack -			\
>   		  TOP_OF_KERNEL_STACK_PADDING -				\
>   		  sizeof(struct pt_regs),				\
>   }
> diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
> index d8198fbd70e5..c7babd7ebb0f 100644
> --- a/arch/x86/kernel/head_64.S
> +++ b/arch/x86/kernel/head_64.S
> @@ -66,7 +66,7 @@ SYM_CODE_START_NOALIGN(startup_64)
>   	mov	%rsi, %r15
>   
>   	/* Set up the stack for verify_cpu() */
> -	leaq	(__end_init_task - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE)(%rip), %rsp
> +	leaq	(__end_init_stack - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE)(%rip), %rsp
>   
>   	/* Setup GSBASE to allow stack canary access for C code */
>   	movl	$MSR_GS_BASE, %ecx
> diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
> index 04101b984f24..43eadf03f46d 100644
> --- a/arch/x86/xen/xen-head.S
> +++ b/arch/x86/xen/xen-head.S
> @@ -49,7 +49,7 @@ SYM_CODE_START(startup_xen)
>   	ANNOTATE_NOENDBR
>   	cld
>   
> -	leaq	(__end_init_task - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE)(%rip), %rsp
> +	leaq	(__end_init_stack - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE)(%rip), %rsp
>   
>   	/* Set up %gs.
>   	 *
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index 5dd3a61d673d..a168be99d522 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -399,13 +399,13 @@
>   
>   #define INIT_TASK_DATA(align)						\
>   	. = ALIGN(align);						\
> -	__start_init_task = .;						\
> +	__start_init_stack = .;						\
>   	init_thread_union = .;						\
>   	init_stack = .;							\
> -	KEEP(*(.data..init_task))					\
> +	KEEP(*(.data..init_stack))					\

Is this modification really correct?

>   	KEEP(*(.data..init_thread_info))				\
> -	. = __start_init_task + THREAD_SIZE;				\
> -	__end_init_task = .;
> +	. = __start_init_stack + THREAD_SIZE;				\
> +	__end_init_stack = .;
>   
>   #define JUMP_TABLE_DATA							\
>   	. = ALIGN(8);							\
> 
> base-commit: 626856ae97054963e7b8c35335d4418271c8d0c4


Juergen


