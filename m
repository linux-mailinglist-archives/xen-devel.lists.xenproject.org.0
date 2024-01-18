Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E83831EA1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 18:45:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668856.1041360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQWS5-0004Ta-Pe; Thu, 18 Jan 2024 17:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668856.1041360; Thu, 18 Jan 2024 17:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQWS5-0004Qc-M5; Thu, 18 Jan 2024 17:45:17 +0000
Received: by outflank-mailman (input) for mailman id 668856;
 Thu, 18 Jan 2024 17:45:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSQR=I4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rQWS4-0004QW-LU
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 17:45:16 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55d6bcce-b629-11ee-9b0f-b553b5be7939;
 Thu, 18 Jan 2024 18:45:14 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50e7c6f0487so14787348e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 09:45:14 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 z14-20020a056512308e00b0050e7a098a75sm697744lfd.196.2024.01.18.09.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 09:45:13 -0800 (PST)
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
X-Inumbo-ID: 55d6bcce-b629-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705599914; x=1706204714; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uoplj4kww1X2iLvkowq3S1qsS0kXO7lu97uiKW8Uo2U=;
        b=Vif9QeAaPyNfTplKLPoXEKFtnqXYowrAlJ1gzvKWMbksT77sT5dLqqlysgV/mZBymL
         A3gB82Z5Fb1fD4Sf5EctDnPcnxe7J5f+UNG72hCqBDw6jFLAblV7lqXKzlFLA4eRBakq
         znEZy1O/JXOYrJ590jT2QwR3F8XnUaiCZLsJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705599914; x=1706204714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uoplj4kww1X2iLvkowq3S1qsS0kXO7lu97uiKW8Uo2U=;
        b=sEePWyuzzbh4TWsc9ldltSFG5NN6/rhsMG6P9wxnBqNhTfpdgJHOJgygIZ3CXN/f6v
         UEm1i39w3gwHPX8gCSrmJbyyft1X4Dow4IQcqOIkgkg0plGTn7wWIUDAS4ASC9I4Agt8
         yNwiwXI0kGAJaQhL3lxF5WtZOGBkspxxrsY9q6mA7c3KajwPXC0+VBAWSYQHyTCndY+v
         R3fxZwN2LH1K4LMuF5Qu7O0oMGziVFmLfcRGtBKkPGApb36QeGHG2PHjkZV4xxiRnSOC
         WDCe0DtAiODhlPcmkh/p3h4/XUu1NY13CGlIeOJtPyqpL2aKUu7nAeY637MDmXgAji4A
         CIRw==
X-Gm-Message-State: AOJu0YwX5xM6i9RFN0LQzmUeDo1L/BYMbRVhEot08A7HcTYKc8h6Pglf
	+Ggd30qQmwj506jgpuLfcOIWTom4odiey9+njQVKDqMJVGjMrhOG+V7oCUKC3pI=
X-Google-Smtp-Source: AGHT+IEEcXES/ve95R86h8Cp9wiDlVW2JBa8y18aw/PTAKj2jMbp1QfeIvdL/4iB8Q0t25BRkng3QA==
X-Received: by 2002:a05:6512:2381:b0:50e:7e15:a934 with SMTP id c1-20020a056512238100b0050e7e15a934mr1555lfv.20.1705599914018;
        Thu, 18 Jan 2024 09:45:14 -0800 (PST)
Date: Thu, 18 Jan 2024 18:45:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v5 2/8] x86: annotate entry points with type and size
Message-ID: <ZaljqHduUIvsdbqm@macbook>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
 <9096ad1a-5d86-4dd1-a7c3-6ad2f7e5a623@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9096ad1a-5d86-4dd1-a7c3-6ad2f7e5a623@suse.com>

On Mon, Jan 15, 2024 at 03:34:56PM +0100, Jan Beulich wrote:
> @@ -625,7 +627,7 @@ ENTRY(dom_crash_sync_extable)
>  
>  /* No special register assumptions. */
>  #ifdef CONFIG_PV
> -ENTRY(continue_pv_domain)
> +FUNC(continue_pv_domain)
>          ENDBR64
>          call  check_wakeup_from_wait
>  ret_from_intr:
> @@ -640,26 +642,28 @@ ret_from_intr:
>  #else
>          jmp   test_all_events
>  #endif
> +END(continue_pv_domain)
>  #else
> -ret_from_intr:
> +FUNC_LOCAL(ret_from_intr, 0)

Why does this need to have an alignment of 0? There's no fallthrough
of previous code AFAICT.

>          ASSERT_CONTEXT_IS_XEN
>          jmp   restore_all_xen
> +END(ret_from_intr)
>  #endif
>  
>          .section .init.text, "ax", @progbits
> -ENTRY(early_page_fault)
> +FUNC(early_page_fault)
>          ENDBR64
>          movl  $X86_EXC_PF, 4(%rsp)
>          SAVE_ALL
>          movq  %rsp, %rdi
>          call  do_early_page_fault
>          jmp   restore_all_xen
> +END(early_page_fault)
>  
>          .section .text.entry, "ax", @progbits
>  
> -        ALIGN
>  /* %r12=ist_exit */
> -restore_all_xen:
> +FUNC_LOCAL(restore_all_xen)
>  
>  #ifdef CONFIG_DEBUG
>          mov   %rsp, %rdi
> @@ -683,8 +687,9 @@ UNLIKELY_END(exit_cr3)
>  
>          RESTORE_ALL adj=8
>          iretq
> +END(restore_all_xen)
>  
> -ENTRY(common_interrupt)
> +FUNC(common_interrupt)
>          ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
>          SAVE_ALL
>  
> @@ -713,12 +718,14 @@ ENTRY(common_interrupt)
>          mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
>          mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
>          jmp ret_from_intr
> +END(common_interrupt)
>  
> -ENTRY(entry_PF)
> +FUNC(entry_PF)
>          ENDBR64
>          movl  $X86_EXC_PF, 4(%rsp)
> +END(entry_PF)
>  /* No special register assumptions. */
> -GLOBAL(handle_exception)
> +FUNC(handle_exception, 0)

Given patch 8/8 that enables support for placing FUNC() into separate
sections, the fallthrough arrangement here with entry_PF is no longer
guaranteed, as the linker could re-order the sections and thus
entry_PF could fallthrough into another text section?

IOW: entry_PF needs a "jmp handle_exception", and then
handle_exception itself can be padded as required by the default
alignment?

>          ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
>          SAVE_ALL
>  
> @@ -886,92 +893,108 @@ FATAL_exception_with_ints_disabled:
>          xorl  %esi,%esi
>          movq  %rsp,%rdi
>          tailcall fatal_trap
> +END(handle_exception)
>  
> -ENTRY(entry_DE)
> +FUNC(entry_DE)
>          ENDBR64
>          pushq $0
>          movl  $X86_EXC_DE, 4(%rsp)
>          jmp   handle_exception
> +END(entry_DE)
>  
> -ENTRY(entry_MF)
> +FUNC(entry_MF)
>          ENDBR64
>          pushq $0
>          movl  $X86_EXC_MF, 4(%rsp)
>          jmp   handle_exception
> +END(entry_MF)
>  
> -ENTRY(entry_XM)
> +FUNC(entry_XM)
>          ENDBR64
>          pushq $0
>          movl  $X86_EXC_XM, 4(%rsp)
>          jmp   handle_exception
> +END(entry_XM)
>  
> -ENTRY(entry_NM)
> +FUNC(entry_NM)
>          ENDBR64
>          pushq $0
>          movl  $X86_EXC_NM, 4(%rsp)
>          jmp   handle_exception
> +END(entry_NM)
>  
> -ENTRY(entry_DB)
> +FUNC(entry_DB)
>          ENDBR64
>          pushq $0
>          movl  $X86_EXC_DB, 4(%rsp)
>          jmp   handle_ist_exception
> +END(entry_DB)
>  
> -ENTRY(entry_BP)
> +FUNC(entry_BP)
>          ENDBR64
>          pushq $0
>          movl  $X86_EXC_BP, 4(%rsp)
>          jmp   handle_exception
> +END(entry_BP)
>  
> -ENTRY(entry_OF)
> +FUNC(entry_OF)
>          ENDBR64
>          pushq $0
>          movl  $X86_EXC_OF, 4(%rsp)
>          jmp   handle_exception
> +END(entry_OF)
>  
> -ENTRY(entry_BR)
> +FUNC(entry_BR)
>          ENDBR64
>          pushq $0
>          movl  $X86_EXC_BR, 4(%rsp)
>          jmp   handle_exception
> +END(entry_BR)
>  
> -ENTRY(entry_UD)
> +FUNC(entry_UD)
>          ENDBR64
>          pushq $0
>          movl  $X86_EXC_UD, 4(%rsp)
>          jmp   handle_exception
> +END(entry_UD)
>  
> -ENTRY(entry_TS)
> +FUNC(entry_TS)
>          ENDBR64
>          movl  $X86_EXC_TS, 4(%rsp)
>          jmp   handle_exception
> +END(entry_TS)
>  
> -ENTRY(entry_NP)
> +FUNC(entry_NP)
>          ENDBR64
>          movl  $X86_EXC_NP, 4(%rsp)
>          jmp   handle_exception
> +END(entry_NP)
>  
> -ENTRY(entry_SS)
> +FUNC(entry_SS)
>          ENDBR64
>          movl  $X86_EXC_SS, 4(%rsp)
>          jmp   handle_exception
> +END(entry_SS)
>  
> -ENTRY(entry_GP)
> +FUNC(entry_GP)
>          ENDBR64
>          movl  $X86_EXC_GP, 4(%rsp)
>          jmp   handle_exception
> +END(entry_GP)
>  
> -ENTRY(entry_AC)
> +FUNC(entry_AC)
>          ENDBR64
>          movl  $X86_EXC_AC, 4(%rsp)
>          jmp   handle_exception
> +END(entry_AC)
>  
> -ENTRY(entry_CP)
> +FUNC(entry_CP)
>          ENDBR64
>          movl  $X86_EXC_CP, 4(%rsp)
>          jmp   handle_exception
> +END(entry_CP)
>  
> -ENTRY(entry_DF)
> +FUNC(entry_DF)
>          ENDBR64
>          movl  $X86_EXC_DF, 4(%rsp)
>          /* Set AC to reduce chance of further SMAP faults */
> @@ -994,8 +1017,9 @@ ENTRY(entry_DF)
>  
>          movq  %rsp,%rdi
>          tailcall do_double_fault
> +END(entry_DF)
>  
> -ENTRY(entry_NMI)
> +FUNC(entry_NMI)
>          ENDBR64
>          pushq $0
>          movl  $X86_EXC_NMI, 4(%rsp)
> @@ -1126,21 +1150,24 @@ handle_ist_exception:
>          ASSERT_CONTEXT_IS_XEN
>          jmp   restore_all_xen
>  #endif
> +END(entry_NMI)
>  
> -ENTRY(entry_MC)
> +FUNC(entry_MC)
>          ENDBR64
>          pushq $0
>          movl  $X86_EXC_MC, 4(%rsp)
>          jmp   handle_ist_exception
> +END(entry_MC)
>  
>  /* No op trap handler.  Required for kexec crash path. */
> -GLOBAL(trap_nop)
> +FUNC(trap_nop, 0)

Could this use the default alignment?

>          ENDBR64
>          iretq
> +END(trap_nop)
>  
>  /* Table of automatically generated entry points.  One per vector. */
>          .pushsection .init.rodata, "a", @progbits
> -GLOBAL(autogen_entrypoints)
> +DATA(autogen_entrypoints, 8)
>          /* pop into the .init.rodata section and record an entry point. */
>          .macro entrypoint ent
>          .pushsection .init.rodata, "a", @progbits
> @@ -1149,7 +1176,7 @@ GLOBAL(autogen_entrypoints)
>          .endm
>  
>          .popsection
> -autogen_stubs: /* Automatically generated stubs. */
> +FUNC_LOCAL(autogen_stubs, 0) /* Automatically generated stubs. */

Won't it be good to align the stubs?  As that's possible to make them
faster?

Thanks, Roger.

