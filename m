Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8750B83A52D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 10:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670828.1043869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSZRg-0006GL-4u; Wed, 24 Jan 2024 09:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670828.1043869; Wed, 24 Jan 2024 09:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSZRg-0006Du-23; Wed, 24 Jan 2024 09:21:20 +0000
Received: by outflank-mailman (input) for mailman id 670828;
 Wed, 24 Jan 2024 09:21:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3ap=JC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSZRe-0006Dg-2e
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 09:21:18 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec9a0c65-ba99-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 10:21:15 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so542184966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 01:21:15 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 qo3-20020a170907874300b00a2fb9c0337esm4653960ejc.112.2024.01.24.01.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 01:21:14 -0800 (PST)
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
X-Inumbo-ID: ec9a0c65-ba99-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706088075; x=1706692875; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FkJIuusH5FCy3puYBU45Z3EEnAGFrMcnM5eOBleEIlY=;
        b=DFERdMmoe1MvKP7uOejA/G7JupJfU6h7w5lWBhns0WoVezfnVALwc84zVrfp+SM+Ji
         OKcb+XpK8kEqtO1KnhPfJ7nDrrKCzJiyGrZa7ZgSFEHeliCArjU1vYV6pd3wnvYTbtvP
         UX4lbgQYcTe5L3siE9FIuBmniioi7U2sXT4so=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706088075; x=1706692875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FkJIuusH5FCy3puYBU45Z3EEnAGFrMcnM5eOBleEIlY=;
        b=J1f04CA809NpyEgv+sVHC16R3sXB851YQjHI2hAtP9B8jP9XHD+Tk0k18B31Sxid5f
         /45y1xjC7XJy1I1aQyo09l4T1pO5/QIlU4nmh7uVcg5UZ21EuDpOMy6q7z9oReuZFl/h
         BOscwFsA/LvwlXoqEQXlasHL/lQcuRfwO8OIkdit6b0SuJY+TY3ec+M9cm2aE7OmoiWn
         589FnqMncB62eVZZCEZCP0odSUcmNeHsjKLbCrmDF59/WW/pao577Xyx32XjP00Astr0
         baiom9D7Q1qHZOjGaPRWHJwtlo3RM906MSC0Fkl8HirDYL423xX5MX4CIuS+UsvL/ODO
         tU2w==
X-Gm-Message-State: AOJu0YygXicWHaQXiwGb41qcGJcl4Z17oHHHXFzwLt2lCvqBRdfbfOpv
	G/s0Z3zrfRfhCGHeCx23VFzbrvgDpJNU8QOX65bm1ALwEJUWWzMBXjKnKPodPCM=
X-Google-Smtp-Source: AGHT+IEEaxKRAxNQDe6I+mZrynxqdIj/jUCbWDTI+HA7bf0gv9+PlUCOn2jnN+D1Mz0Lk3BXPKP6gg==
X-Received: by 2002:a17:906:7fc5:b0:a30:e761:620 with SMTP id r5-20020a1709067fc500b00a30e7610620mr282830ejs.240.1706088075152;
        Wed, 24 Jan 2024 01:21:15 -0800 (PST)
Date: Wed, 24 Jan 2024 10:21:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH 3/3] x86/entry: Make intra-funciton symbols properly local
Message-ID: <ZbDWijN6UKDdArMg@macbook>
References: <20240122181714.1543738-1-andrew.cooper3@citrix.com>
 <20240122181714.1543738-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122181714.1543738-5-andrew.cooper3@citrix.com>

On Mon, Jan 22, 2024 at 06:17:14PM +0000, Andrew Cooper wrote:
> Each of these symbols are local to their main function.  By not having them
> globally visible, livepatch's binary diffing logic can reason about the
> functions properly.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> sysenter_eflags_saved() is an open question.  This does need to be globally
> visible, and I think any livepatch modifying sysenter_entry() will need a
> manual adjustment to do_debug() to update the reference there.

Hm, yes, this stuff is indeed problematic.  There's also the usage of
sysenter_entry in do_debug(), which will also need adjusting to
account for the position of the payload text replacement, as there's
no explicitly guarantee the payload will be loaded at an address
greater than the current sysenter_entry position.

> ---
>  xen/arch/x86/x86_64/compat/entry.S | 20 ++++++++++----------
>  xen/arch/x86/x86_64/entry.S        | 22 +++++++++++-----------
>  2 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
> index 4fbd89cea1a9..1e9e0455eaf3 100644
> --- a/xen/arch/x86/x86_64/compat/entry.S
> +++ b/xen/arch/x86/x86_64/compat/entry.S
> @@ -41,7 +41,7 @@ FUNC(compat_test_all_events)
>          shll  $IRQSTAT_shift,%eax
>          leaq  irq_stat+IRQSTAT_softirq_pending(%rip),%rcx
>          cmpl  $0,(%rcx,%rax,1)
> -        jne   compat_process_softirqs
> +        jne   .L_compat_process_softirqs
>  
>          /* Inject exception if pending. */
>          lea   VCPU_trap_bounce(%rbx), %rdx
> @@ -49,11 +49,11 @@ FUNC(compat_test_all_events)
>          jnz   .Lcompat_process_trapbounce
>  
>          cmpb  $0, VCPU_mce_pending(%rbx)
> -        jne   compat_process_mce
> +        jne   .L_compat_process_mce
>  .Lcompat_test_guest_nmi:
>          cmpb  $0, VCPU_nmi_pending(%rbx)
> -        jne   compat_process_nmi
> -compat_test_guest_events:
> +        jne   .L_compat_process_nmi
> +.L_compat_test_guest_events:
>          movq  VCPU_vcpu_info(%rbx),%rax
>          movzwl COMPAT_VCPUINFO_upcall_pending(%rax),%eax
>          decl  %eax
> @@ -71,7 +71,7 @@ compat_test_guest_events:
>          jmp   compat_test_all_events
>  
>  /* %rbx: struct vcpu */
> -LABEL_LOCAL(compat_process_softirqs)
> +LABEL_LOCAL(.L_compat_process_softirqs)
>          sti
>          call  do_softirq
>          jmp   compat_test_all_events
> @@ -84,7 +84,7 @@ LABEL_LOCAL(.Lcompat_process_trapbounce)
>          jmp   compat_test_all_events
>  
>  /* %rbx: struct vcpu */
> -LABEL_LOCAL(compat_process_mce)
> +LABEL_LOCAL(.L_compat_process_mce)
>          testb $1 << VCPU_TRAP_MCE,VCPU_async_exception_mask(%rbx)
>          jnz   .Lcompat_test_guest_nmi
>          sti
> @@ -96,12 +96,12 @@ LABEL_LOCAL(compat_process_mce)
>          movb %dl,VCPU_mce_old_mask(%rbx)            # iret hypercall
>          orl  $1 << VCPU_TRAP_MCE,%edx
>          movb %dl,VCPU_async_exception_mask(%rbx)
> -        jmp   compat_process_trap
> +        jmp   .L_compat_process_trap
>  
>  /* %rbx: struct vcpu */
> -LABEL_LOCAL(compat_process_nmi)
> +LABEL_LOCAL(.L_compat_process_nmi)
>          testb $1 << VCPU_TRAP_NMI,VCPU_async_exception_mask(%rbx)
> -        jnz   compat_test_guest_events
> +        jnz   .L_compat_test_guest_events
>          sti
>          movb  $0, VCPU_nmi_pending(%rbx)
>          call  set_guest_nmi_trapbounce
> @@ -112,7 +112,7 @@ LABEL_LOCAL(compat_process_nmi)
>          orl  $1 << VCPU_TRAP_NMI,%edx
>          movb %dl,VCPU_async_exception_mask(%rbx)
>          /* FALLTHROUGH */
> -compat_process_trap:
> +.L_compat_process_trap:
>          leaq  VCPU_trap_bounce(%rbx),%rdx
>          call  compat_create_bounce_frame
>          jmp   compat_test_all_events
> diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
> index fc64ef1fd460..130462ba0e1a 100644
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -188,7 +188,7 @@ FUNC_LOCAL(restore_all_guest)
>  
>          RESTORE_ALL
>          testw $TRAP_syscall,4(%rsp)
> -        jz    iret_exit_to_guest
> +        jz    .L_iret_exit_to_guest
>  
>          movq  24(%rsp),%r11           # RFLAGS
>          andq  $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), %r11
> @@ -220,7 +220,7 @@ FUNC_LOCAL(restore_all_guest)
>  LABEL_LOCAL(.Lrestore_rcx_iret_exit_to_guest)
>          movq  8(%rsp), %rcx           # RIP
>  /* No special register assumptions. */
> -iret_exit_to_guest:
> +.L_iret_exit_to_guest:
>          andl  $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), 24(%rsp)
>          orl   $X86_EFLAGS_IF,24(%rsp)
>          addq  $8,%rsp
> @@ -432,10 +432,10 @@ UNLIKELY_END(msi_check)
>          cmove %rdi, %rdx
>  
>          test  %rdx, %rdx
> -        jz    int80_slow_path
> +        jz    .L_int80_slow_path
>  #else
>          test  %rdi, %rdi
> -        jz    int80_slow_path
> +        jz    .L_int80_slow_path
>  #endif
>  
>          /* Construct trap_bounce from trap_ctxt[0x80]. */
> @@ -457,7 +457,7 @@ UNLIKELY_END(msi_check)
>          call  create_bounce_frame
>          jmp   test_all_events
>  
> -int80_slow_path:
> +.L_int80_slow_path:
>          /* 
>           * Setup entry vector and error code as if this was a GPF caused by an
>           * IDT entry with DPL==0.
> @@ -472,7 +472,7 @@ int80_slow_path:
>           * need to set up %r14 here, while %r15 is required to still be zero.
>           */
>          GET_STACK_END(14)
> -        jmp   handle_exception_saved
> +        jmp   .L_handle_exception_saved

This one is IMO problematic, as you are jumping from function symbol
entry_int80 into handle_exception.  Any livepatch that modifies
handle_exception will quite likely break that jump, as the jump won't
be relocated to point at the new position of the local label inside of
the new handle_exception text.

handle_exception needs further work in order to be livepatched, and
making handle_exception_saved local makes it looks like it's safe to
patch, while it's not.

We need to split handle_exception_saved into a separate function, so
it has it's own section, as long as it's referenced from other
functions.

Thanks, Roger.

