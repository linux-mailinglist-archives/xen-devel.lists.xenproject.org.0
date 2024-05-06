Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B0A8BCE6D
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 14:50:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717621.1120013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3xmx-0008UX-VM; Mon, 06 May 2024 12:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717621.1120013; Mon, 06 May 2024 12:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3xmx-0008T1-Sc; Mon, 06 May 2024 12:49:51 +0000
Received: by outflank-mailman (input) for mailman id 717621;
 Mon, 06 May 2024 12:49:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3cb6=MJ=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s3xmx-0008Sv-AR
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 12:49:51 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2050c584-0ba7-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 14:49:50 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-51f57713684so2292805e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 05:49:50 -0700 (PDT)
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
X-Inumbo-ID: 2050c584-0ba7-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714999790; x=1715604590; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5NJFsBrj9SVXEBCDMWdoSrQkLoJ16wxEkHgXpymkP0=;
        b=ZdpsTlMuCBm7jSbsz/i8A2hHz7ieHlhHKLK52BqYz8QjAofVhk8o3mpjOTkRXm6L83
         8wSOU61TUJuX03sszM+Le8GezeHTUTr//sQUiz0rszJc7DLIi0jHedi4LeqProTA0szZ
         jLgHu/9RHWjH4ZFgZaEVDR+//6Jf7VQ393sSLPUcaKQ1MrElbdaafEUEKpRCjSboz/s0
         ltHs7Yrvn1KMCKyJaEE+dyYbKRtRs1nUMkUIwDphlTbzwPWQ1XxDDm7BSb/J5wkzyQkJ
         wNmGFEHhbuM/+achoZ0Td9q/+Ba6KXew8hpzFMH0KwykExeSAvjkOF2WI8fSq24BUD8y
         UHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714999790; x=1715604590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5NJFsBrj9SVXEBCDMWdoSrQkLoJ16wxEkHgXpymkP0=;
        b=AwRD2AE75YgpRgXuKiU0O26yy8Eqz0j0tbpxuiCyypLQuG2VIVpDDZ4xrqPtWFjtMb
         Ot2mIt4pHAUqbeTS4J3lMu7RGa5YZzk+GQISNW34AGIhRaxq1AKBo/e5OYkh+Snu+xW3
         NyjhyspsxVYdsYBOYGXaum4hc4AP5pVwwK2i965Mz6Oc1QbG09IANTd3iS20oSRcalHL
         dNg8jk1AOCtEMql40+pLPUYrUDjjBYgWOXeQRsc/AN/fAr9jq6RM0R9tWmoWVfL9PrJg
         0oeo0Et0Qoc19Wh8W2FFHg4w6tqFkKLkKvMtUy/f9BrfuM5/Qs3Quhbo9Lrgo0dezFf1
         X6DQ==
X-Gm-Message-State: AOJu0YyYIdBgdB4+ndCljNDi1WDauPQ5G19SbD9CD652/uMhW4qoTumL
	8FgcvrxLTQZYl7Aq7x8lezsXFqQYtk0yNk650IWHMYQzD/nCdmoOcTfK8PmAhRcta363/XpIvVO
	wClbDZTL8zqYg5q9INNZGfv3tfE4=
X-Google-Smtp-Source: AGHT+IEEB0aF6cWX8VP5LbU11br+4/MYlgzLx9i5IwgCvYzDNUlzmCezJSD2ELCMi4/Uzcaru8oBDBNx9KIzZzcAC3E=
X-Received: by 2002:a19:644b:0:b0:51c:cd8d:2865 with SMTP id
 b11-20020a19644b000000b0051ccd8d2865mr6434141lfj.44.1714999789372; Mon, 06
 May 2024 05:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240501035448.964625-1-edgar.iglesias@gmail.com>
 <20240501035448.964625-5-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2405031630280.1151289@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2405031630280.1151289@ubuntu-linux-20-04-desktop>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 6 May 2024 14:49:37 +0200
Message-ID: <CAJy5ezpMvTb2Jv-pPMzeRGLxdo5EJSA4RboWj6D41UuTv6mAiA@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] xen/arm64: head: Add missing code symbol annotations
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, bertrand.marquis@arm.com, 
	michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, jbeulich@suse.com, 
	andrew.cooper3@citrix.com, edgar.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 4, 2024 at 1:56=E2=80=AFAM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Wed, 1 May 2024, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > Use the generic xen/linkage.h macros to annotate code symbols
> > and add missing annotations.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  xen/arch/arm/arm64/head.S | 50 ++++++++++++++++++++-------------------
> >  1 file changed, 26 insertions(+), 24 deletions(-)
> >
> > diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> > index fb297e9eb5..7acedb4f8f 100644
> > --- a/xen/arch/arm/arm64/head.S
> > +++ b/xen/arch/arm/arm64/head.S
> > @@ -90,7 +90,7 @@
> >   * 4K-aligned address.
> >   */
> >
> > -GLOBAL(start)
> > +FUNC(start)
> >          /*
> >           * DO NOT MODIFY. Image header expected by Linux boot-loaders.
> >           */
> > @@ -102,6 +102,7 @@ efi_head:
> >           */
> >          add     x13, x18, #0x16
> >          b       real_start           /* branch to kernel start */
> > +END(start)
> >          .quad   0                    /* Image load offset from start o=
f RAM */
> >          .quad   _end - start         /* Effective size of kernel image=
, little-endian */
> >          .quad   __HEAD_FLAGS         /* Informative flags, little-endi=
an */
> > @@ -223,7 +224,7 @@ section_table:
> >          .align  5
> >  #endif /* CONFIG_ARM_EFI */
> >
> > -real_start:
> > +FUNC_LOCAL(real_start)
> >          /* BSS should be zeroed when booting without EFI */
> >          mov   x26, #0                /* x26 :=3D skip_zero_bss */
> >
> > @@ -263,9 +264,9 @@ primary_switched:
> >          mov   x1, x21                /* x1 :=3D paddr(FDT) */
> >          ldr   x2, =3Dstart_xen
> >          b     launch
> > -ENDPROC(real_start)
> > +END(real_start)
> >
> > -GLOBAL(init_secondary)
> > +FUNC(init_secondary)
> >          msr   DAIFSet, 0xf           /* Disable all interrupts */
> >
> >          /* Find out where we are */
> > @@ -304,7 +305,7 @@ secondary_switched:
> >          /* Jump to C world */
> >          ldr   x2, =3Dstart_secondary
> >          b     launch
> > -ENDPROC(init_secondary)
> > +END(init_secondary)
> >
> >  /*
> >   * Check if the CPU has been booted in Hypervisor mode.
> > @@ -313,7 +314,7 @@ ENDPROC(init_secondary)
> >   *
> >   * Clobbers x0 - x5
> >   */
> > -check_cpu_mode:
> > +FUNC_LOCAL(check_cpu_mode)
> >          PRINT_ID("- Current EL ")
> >          mrs   x5, CurrentEL
> >          print_reg x5
> > @@ -329,7 +330,7 @@ check_cpu_mode:
> >          PRINT_ID("- Xen must be entered in NS EL2 mode -\r\n")
> >          PRINT_ID("- Please update the bootloader -\r\n")
> >          b fail
> > -ENDPROC(check_cpu_mode)
> > +END(check_cpu_mode)
> >
> >  /*
> >   * Zero BSS
> > @@ -339,7 +340,7 @@ ENDPROC(check_cpu_mode)
> >   *
> >   * Clobbers x0 - x3
> >   */
> > -zero_bss:
> > +FUNC_LOCAL(zero_bss)
> >          /* Zero BSS only when requested */
> >          cbnz  x26, skip_bss
> >
> > @@ -353,14 +354,14 @@ zero_bss:
> >
> >  skip_bss:
> >          ret
> > -ENDPROC(zero_bss)
> > +END(zero_bss)
> >
> >  /*
> >   * Initialize the processor for turning the MMU on.
> >   *
> >   * Clobbers x0 - x3
> >   */
> > -cpu_init:
> > +FUNC_LOCAL(cpu_init)
> >          PRINT_ID("- Initialize CPU -\r\n")
> >
> >          /* Set up memory attribute type tables */
> > @@ -399,7 +400,7 @@ cpu_init:
> >           */
> >          msr spsel, #1
> >          ret
> > -ENDPROC(cpu_init)
> > +END(cpu_init)
> >
> >  /*
> >   * Setup the initial stack and jump to the C world
> > @@ -411,7 +412,7 @@ ENDPROC(cpu_init)
> >   *
> >   * Clobbers x3
> >   */
> > -launch:
> > +FUNC_LOCAL(launch)
> >          ldr   x3, =3Dinit_data
> >          add   x3, x3, #INITINFO_stack /* Find the boot-time stack */
> >          ldr   x3, [x3]
> > @@ -421,13 +422,13 @@ launch:
> >
> >          /* Jump to C world */
> >          br    x2
> > -ENDPROC(launch)
> > +END(launch)
> >
> >  /* Fail-stop */
> > -fail:   PRINT_ID("- Boot failed -\r\n")
> > +FUNC_LOCAL(fail)   PRINT_ID("- Boot failed -\r\n")
>
> Maybe we should move PRINT_ID to a newline?
> I am not sure FUNC_LOCAL supports having a command on the same line.

Thanks, yes I checked that it works but it feels a little fragile so
in v4 I'll move the print to a new line (here and in mmu/head.S).

Thanks,
Edgar


>
>
>
> >  1:      wfe
> >          b     1b
> > -ENDPROC(fail)
> > +END(fail)
> >
> >  #ifdef CONFIG_EARLY_PRINTK
> >  /*
> > @@ -438,14 +439,14 @@ ENDPROC(fail)
> >   *
> >   * Clobbers x0 - x1
> >   */
> > -init_uart:
> > +FUNC_LOCAL(init_uart)
> >          ldr   x23, =3DCONFIG_EARLY_UART_BASE_ADDRESS
> >  #ifdef CONFIG_EARLY_UART_INIT
> >          early_uart_init x23, 0
> >  #endif
> >          PRINT("- UART enabled -\r\n")
> >          ret
> > -ENDPROC(init_uart)
> > +END(init_uart)
> >
> >  /*
> >   * Print early debug messages.
> > @@ -454,7 +455,7 @@ ENDPROC(init_uart)
> >   * x23: Early UART base address
> >   * Clobbers x0-x1
> >   */
> > -ENTRY(asm_puts)
> > +FUNC(asm_puts)
> >          early_uart_ready x23, 1
> >          ldrb  w1, [x0], #1           /* Load next char */
> >          cbz   w1, 1f                 /* Exit on nul */
> > @@ -462,7 +463,7 @@ ENTRY(asm_puts)
> >          b     asm_puts
> >  1:
> >          ret
> > -ENDPROC(asm_puts)
> > +END(asm_puts)
> >
> >  /*
> >   * Print a 64-bit number in hex.
> > @@ -471,7 +472,7 @@ ENDPROC(asm_puts)
> >   * x23: Early UART base address
> >   * Clobbers x0-x3
> >   */
> > -ENTRY(asm_putn)
> > +FUNC(asm_putn)
> >          adr_l x1, hex
> >          mov   x3, #16
> >  1:
> > @@ -484,7 +485,7 @@ ENTRY(asm_putn)
> >          subs  x3, x3, #1
> >          b.ne  1b
> >          ret
> > -ENDPROC(asm_putn)
> > +END(asm_putn)
> >
> >  RODATA_SECT(.rodata.idmap, hex, "0123456789abcdef")
> >
> > @@ -493,16 +494,17 @@ RODATA_SECT(.rodata.idmap, hex, "0123456789abcdef=
")
> >  /* This provides a C-API version of __lookup_processor_type
> >   * TODO: For now, the implementation return NULL every time
> >   */
> > -ENTRY(lookup_processor_type)
> > +FUNC(lookup_processor_type)
> >          mov  x0, #0
> >          ret
> > +END(lookup_processor_type)
> >
> >  #ifdef CONFIG_ARM_EFI
> >  /*
> >   *  Function to transition from EFI loader in C, to Xen entry point.
> >   *  void noreturn efi_xen_start(void *fdt_ptr, uint32_t fdt_size);
> >   */
> > -ENTRY(efi_xen_start)
> > +FUNC(efi_xen_start)
> >          /*
> >           * Preserve x0 (fdt pointer) across call to __flush_dcache_are=
a,
> >           * restore for entry into Xen.
> > @@ -554,7 +556,7 @@ ENTRY(efi_xen_start)
> >          mov   x26, #1               /* x26 :=3D skip_zero_bss */
> >
> >          b     real_start_efi
> > -ENDPROC(efi_xen_start)
> > +END(efi_xen_start)
> >
> >  #endif /* CONFIG_ARM_EFI */
> >
> > --
> > 2.40.1
> >

