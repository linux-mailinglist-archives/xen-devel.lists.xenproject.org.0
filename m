Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA2B8A019F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 23:01:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703633.1099376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruf3S-0000TI-Ct; Wed, 10 Apr 2024 21:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703633.1099376; Wed, 10 Apr 2024 21:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruf3S-0000R1-9o; Wed, 10 Apr 2024 21:00:26 +0000
Received: by outflank-mailman (input) for mailman id 703633;
 Wed, 10 Apr 2024 21:00:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KBji=LP=gmail.com=brgerst@srs-se1.protection.inumbo.net>)
 id 1ruf3Q-0000Qu-9E
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 21:00:24 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58da1dac-f77d-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 23:00:23 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-516d0c004b1so8523131e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 14:00:22 -0700 (PDT)
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
X-Inumbo-ID: 58da1dac-f77d-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712782822; x=1713387622; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTOLX4JLh5I1S63wm7ZYTbxWd3eO8LcCr+U3ImNr+Hw=;
        b=i28bPgNQtv2rqr0//of3KX6ujJAO8kNVc8RBgwbvTrNw35u/PmTPzcmvR9IdYUspuT
         sKLLeeHiNJ0H4j46CtJBkjqafArENN7OJSqKLltNTLtvqJH1JPQ4RPF/XavEesU/7kDr
         HouRp8wm3rzOYzECD1+Sapf7RyPiTr8Tp98e+seH8LyQoSlvQDMGpOZPh1gDRd+5EbZN
         tcKxHrj/WJcpo2qkkSENTn5SRMcp0xDPUMF/XqYkXwfZZ+yr8rOF45WELRmdRE0vjcg3
         5FDbmacHbSm0/wPsYwBlA06amEGnbbf55KTunSyjFpifSrZVMBT66oD15SIuzDN4klQk
         WWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712782822; x=1713387622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OTOLX4JLh5I1S63wm7ZYTbxWd3eO8LcCr+U3ImNr+Hw=;
        b=vG5euG6xywAapP1YO3ehBpjLwB1tbzTJWJ1iX0nWT1TiEt672AxY3QaElVOGiYQ/DR
         YMwaoXzdsB1OXGtzWJWMlgHcOt4URSepUPn0/qUM58kaveZijEoPb9/FDgnbMgRHZL3I
         R8aGvJo/M6Aa3QGCj1HM/XF6YAbIFP9e3q4yA6XytNXvbG4P6NZD+CRMViYPCAvvstCE
         bPqhrNJMK5Yvu0a+gfbJaoLhL+SrVpVITlhKxYMj+A7y2cwdEPl+afh6Y8vPDDghB8PL
         3HAnirNWI7mbDCrJTLhO07oTCfCipkMCu84kxUD7j6ebQ7NAO8OtxVUQC4eLXuTktvDV
         F74A==
X-Forwarded-Encrypted: i=1; AJvYcCUuI3DvertdsI2kINQ+2zTrYGgYOt4RcbWIuDdcDvE95cfBJxq1PqndqXEwptHM5erdsAiDkki8FLXz5HEYoHz6O2t3krpvNPjwX2lP4Rk=
X-Gm-Message-State: AOJu0YxmGz0K2vrEYQGDYfOmNTv6ZqBXtk9fFHpvFkNKPDPVhzsuKluY
	OO7aciPeH+4DlpY1YFJEdnLNi0rTSArRNUckEy7wfiilpcx0pjeNK2DTEjp98psrAEGrTuZv5dN
	GSxq6xHA4MEXw1vEnR47COXpsag==
X-Google-Smtp-Source: AGHT+IHamXN4IgV+QiIETJSN7sHN7KaKh2Hd0vq3jXc0f0d0B2F3cy+oSbc44j/6FZ2J7UpYNoO8hZBCUqgdA8GF4rU=
X-Received: by 2002:ac2:5598:0:b0:516:26cd:da71 with SMTP id
 v24-20020ac25598000000b0051626cdda71mr2936245lfg.3.1712782822109; Wed, 10 Apr
 2024 14:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240410194850.39994-1-jason.andryuk@amd.com> <20240410194850.39994-3-jason.andryuk@amd.com>
In-Reply-To: <20240410194850.39994-3-jason.andryuk@amd.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Wed, 10 Apr 2024 17:00:10 -0400
Message-ID: <CAMzpN2h6S69bOLXCUhmkVJErvoKxq-wPmfoaqR7eGHYLgirn+Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] x86/pvh: Make PVH entrypoint PIC for x86-64
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 3:50=E2=80=AFPM Jason Andryuk <jason.andryuk@amd.co=
m> wrote:
>
> The PVH entrypoint is 32bit non-PIC code running the uncompressed
> vmlinux at its load address CONFIG_PHYSICAL_START - default 0x1000000
> (16MB).  The kernel is loaded at that physical address inside the VM by
> the VMM software (Xen/QEMU).
>
> When running a Xen PVH Dom0, the host reserved addresses are mapped 1-1
> into the PVH container.  There exist system firmwares (Coreboot/EDK2)
> with reserved memory at 16MB.  This creates a conflict where the PVH
> kernel cannot be loaded at that address.
>
> Modify the PVH entrypoint to be position-indepedent to allow flexibility
> in load address.  Only the 64bit entry path is converted.  A 32bit
> kernel is not PIC, so calling into other parts of the kernel, like
> xen_prepare_pvh() and mk_pgtable_32(), don't work properly when
> relocated.
>
> This makes the code PIC, but the page tables need to be updated as well
> to handle running from the kernel high map.
>
> The UNWIND_HINT_END_OF_STACK is to silence:
> vmlinux.o: warning: objtool: pvh_start_xen+0x7f: unreachable instruction
> after the lret into 64bit code.
>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> ---
>  arch/x86/platform/pvh/head.S | 44 ++++++++++++++++++++++++++++--------
>  1 file changed, 34 insertions(+), 10 deletions(-)
>
> diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
> index f7235ef87bc3..bb1e582e32b1 100644
> --- a/arch/x86/platform/pvh/head.S
> +++ b/arch/x86/platform/pvh/head.S
> @@ -7,6 +7,7 @@
>         .code32
>         .text
>  #define _pa(x)          ((x) - __START_KERNEL_map)
> +#define rva(x)          ((x) - pvh_start_xen)
>
>  #include <linux/elfnote.h>
>  #include <linux/init.h>
> @@ -54,7 +55,25 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
>         UNWIND_HINT_END_OF_STACK
>         cld
>
> -       lgdt (_pa(gdt))
> +       /*
> +        * See the comment for startup_32 for more details.  We need to
> +        * execute a call to get the execution address to be position
> +        * independent, but we don't have a stack.  Save and restore the
> +        * magic field of start_info in ebx, and use that as the stack.
> +        */
> +       mov  (%ebx), %eax
> +       leal 4(%ebx), %esp
> +       ANNOTATE_INTRA_FUNCTION_CALL
> +       call 1f
> +1:     popl %ebp
> +       mov  %eax, (%ebx)
> +       subl $rva(1b), %ebp
> +       movl $0, %esp
> +
> +       leal rva(gdt)(%ebp), %eax
> +       leal rva(gdt_start)(%ebp), %ecx
> +       movl %ecx, 2(%eax)
> +       lgdt (%eax)
>
>         mov $PVH_DS_SEL,%eax
>         mov %eax,%ds
> @@ -62,14 +81,14 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
>         mov %eax,%ss
>
>         /* Stash hvm_start_info. */
> -       mov $_pa(pvh_start_info), %edi
> +       leal rva(pvh_start_info)(%ebp), %edi
>         mov %ebx, %esi
> -       mov _pa(pvh_start_info_sz), %ecx
> +       movl rva(pvh_start_info_sz)(%ebp), %ecx
>         shr $2,%ecx
>         rep
>         movsl
>
> -       mov $_pa(early_stack_end), %esp
> +       leal rva(early_stack_end)(%ebp), %esp
>
>         /* Enable PAE mode. */
>         mov %cr4, %eax
> @@ -84,28 +103,33 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
>         wrmsr
>
>         /* Enable pre-constructed page tables. */
> -       mov $_pa(init_top_pgt), %eax
> +       leal rva(init_top_pgt)(%ebp), %eax
>         mov %eax, %cr3
>         mov $(X86_CR0_PG | X86_CR0_PE), %eax
>         mov %eax, %cr0
>
>         /* Jump to 64-bit mode. */
> -       ljmp $PVH_CS_SEL, $_pa(1f)
> +       pushl $PVH_CS_SEL
> +       leal  rva(1f)(%ebp), %eax
> +       pushl %eax
> +       lretl
>
>         /* 64-bit entry point. */
>         .code64
>  1:
> +       UNWIND_HINT_END_OF_STACK
> +
>         /* Set base address in stack canary descriptor. */
>         mov $MSR_GS_BASE,%ecx
> -       mov $_pa(canary), %eax
> +       leal rva(canary)(%ebp), %eax

Since this is in 64-bit mode, RIP-relative addressing can be used.

>         xor %edx, %edx
>         wrmsr
>
>         call xen_prepare_pvh
>
>         /* startup_64 expects boot_params in %rsi. */
> -       mov $_pa(pvh_bootparams), %rsi
> -       mov $_pa(startup_64), %rax
> +       lea rva(pvh_bootparams)(%ebp), %rsi
> +       lea rva(startup_64)(%ebp), %rax

RIP-relative here too.

>         ANNOTATE_RETPOLINE_SAFE
>         jmp *%rax
>
> @@ -143,7 +167,7 @@ SYM_CODE_END(pvh_start_xen)
>         .balign 8
>  SYM_DATA_START_LOCAL(gdt)
>         .word gdt_end - gdt_start
> -       .long _pa(gdt_start)
> +       .long _pa(gdt_start) /* x86-64 will overwrite if relocated. */
>         .word 0
>  SYM_DATA_END(gdt)
>  SYM_DATA_START_LOCAL(gdt_start)
> --
> 2.44.0
>
>

Brian Gerst

