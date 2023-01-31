Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6CF682BB7
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 12:45:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487563.755234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMp4T-0005FA-CW; Tue, 31 Jan 2023 11:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487563.755234; Tue, 31 Jan 2023 11:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMp4T-0005DO-9Q; Tue, 31 Jan 2023 11:45:05 +0000
Received: by outflank-mailman (input) for mailman id 487563;
 Tue, 31 Jan 2023 11:45:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+DaM=54=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pMp4Q-0005DG-Vi
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 11:45:03 +0000
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [2607:f8b0:4864:20::a34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1143f95-a15c-11ed-b63b-5f92e7d2e73a;
 Tue, 31 Jan 2023 12:45:00 +0100 (CET)
Received: by mail-vk1-xa34.google.com with SMTP id 22so7242553vkn.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Jan 2023 03:45:00 -0800 (PST)
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
X-Inumbo-ID: b1143f95-a15c-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GTnTC1/eN7LgIUNbmysm/3SunNlHlzL90igccppt9Mo=;
        b=Xz53LI/Zib9wjFUBACOJUXmbVxauT6CK1Bsoh6/U2igSbQ+bTnV1kLTgiO0OcHPFMH
         7XSnWxKTuMQUUZxoiT/CeIuCavB2rRAHaz1W4cBQmaQxscRDJ+67K00Fy7lhfdgnjtrs
         nmYSVSYT151L/dp4mhn16hDsqhYzqmHxvaZL04um2OQjfQRXc1VDuMQnU1JX1HcITbSb
         fMHIwSw7raQ4m7NBxcH/Vs/Ans33XezFRD+521Z/aecarFXIpaouG8kmvN6nCDnF0OR0
         Hq8LKG+jQjSVn1jMePJ7RwQAquiN5QYODcNjZi2XSwTJZiMpuB5Jdd2iTYqw06HTC9BU
         PIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTnTC1/eN7LgIUNbmysm/3SunNlHlzL90igccppt9Mo=;
        b=fkwnEsi/hv2hfnH+pd7TxQTaX5NufStLhhcycOsWL+yVVohxQFCwSZQbqQJKEusInO
         o7TzVB4BsS7xTL8Q8fxMN/0QUbn3Ozz+sNEyMJcdTkZj0vK8EIPiqRAYy3oLwFQoAeNE
         9WCesDR8LWYdjO+lQm5UcSiS4bjMlG7WMyJoY1Z/REYkBPj5vnS6e8h4cT46O6ZWdTx6
         dhsoJ098iyCRuV4eca6UNYz6VZag3B0hXlGqUgV8Iix0QspDAsjngzwNl/p36k+pKm+x
         2R0Z+ZJhGfwf0uXOiuPeZpPu6JgyOKXZ8yvc4dIVMpuyrSTB0IHBXr3tpQHazl6zBbVa
         eObA==
X-Gm-Message-State: AO0yUKXTtX08B8kvGsrIaWDHy1En7kH19M0QuKcZoTvfoKnLgiIXHOQS
	y2X0nGq0nOA5ScPmRI4vWIKidtv7xNokkgLIh/M=
X-Google-Smtp-Source: AK7set935Jshae+cSBfnOisrBca+6lWyXnqV+EaR3pM3ZxvMvgxLBjogAF5Ukio4TDYU23QB2L+3muhcLODa2X4ynYA=
X-Received: by 2002:ac5:c98a:0:b0:3ea:3000:8627 with SMTP id
 e10-20020ac5c98a000000b003ea30008627mr1142447vkm.7.1675165499602; Tue, 31 Jan
 2023 03:44:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674819203.git.oleksii.kurochko@gmail.com>
 <06c2c36bd68b2534c757dc4087476e855253680a.1674819203.git.oleksii.kurochko@gmail.com>
 <f5cd1bfb116bfcc86fc2848df7eead05cd1a24c0.camel@gmail.com>
In-Reply-To: <f5cd1bfb116bfcc86fc2848df7eead05cd1a24c0.camel@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Jan 2023 21:44:33 +1000
Message-ID: <CAKmqyKMGiDiPRZBekdKan=+YduSmkB2DoWo5btrtVQ8nS3KMAg@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] xen/riscv: introduce early_printk basic stuff
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Julien Grall <julien@xen.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Connor Davis <connojdavis@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 28, 2023 at 12:15 AM Oleksii <oleksii.kurochko@gmail.com> wrote:
>
> Hi Alistair, Bobby and community,
>
> I would like to ask your help with the following check:
> +/*
> + * early_*() can be called from head.S with MMU-off.
> + *
> + * The following requiremets should be honoured for early_*() to
> + * work correctly:
> + *    It should use PC-relative addressing for accessing symbols.
> + *    To achieve that GCC cmodel=medany should be used.
> + */
> +#ifndef __riscv_cmodel_medany
> +#error "early_*() can be called from head.S with MMU-off"
> +#endif

I have never seen a check like this before. I don't really understand
what it's looking for, if the linker is unable to call early_*() I
would expect it to throw an error. I'm not sure what this is adding.

I think this is safe to remove.

Alistair

>
> Please take a look at the following messages and help me to decide if
> the check mentioned above should be in early_printk.c or not:
> [1]
> https://lore.kernel.org/xen-devel/599792fa-b08c-0b1e-10c1-0451519d9e4a@xen.org/
> [2]
> https://lore.kernel.org/xen-devel/0ec33871-96fa-bd9f-eb1b-eb37d3d7c982@xen.org/
>
> Thanks in advance.
>
> ~ Oleksii
>
> On Fri, 2023-01-27 at 13:39 +0200, Oleksii Kurochko wrote:
> > Because printk() relies on a serial driver (like the ns16550 driver)
> > and drivers require working virtual memory (ioremap()) there is not
> > print functionality early in Xen boot.
> >
> > The patch introduces the basic stuff of early_printk functionality
> > which will be enough to print 'hello from C environment".
> >
> > Originally early_printk.{c,h} was introduced by Bobby Eshleman
> > (
> > https://github.com/glg-rv/xen/commit/a3c9916bbdff7ad6030055bbee7e53d1a
> > ab71384)
> > but some functionality was changed:
> > early_printk() function was changed in comparison with the original
> > as
> > common isn't being built now so there is no vscnprintf.
> >
> > This commit adds early printk implementation built on the putc SBI
> > call.
> >
> > As sbi_console_putchar() is already being planned for deprecation
> > it is used temporarily now and will be removed or reworked after
> > real uart will be ready.
> >
> > Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Reviewed-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> > ---
> > Changes in V7:
> >     - Nothing was changed
> > ---
> > Changes in V6:
> >     - Remove __riscv_cmodel_medany check from early_printk.c
> > ---
> > Changes in V5:
> >     - Code style fixes
> >     - Change an error message of #error in case of
> > __riscv_cmodel_medany
> >       isn't defined
> > ---
> > Changes in V4:
> >     - Remove "depends on RISCV*" from Kconfig.debug as it is located
> > in
> >       arch specific folder so by default RISCV configs should be
> > ebabled.
> >     - Add "ifdef __riscv_cmodel_medany" to be sure that PC-relative
> > addressing
> >       is used as early_*() functions can be called from head.S with
> > MMU-off and
> >       before relocation (if it would be needed at all for RISC-V)
> >     - fix code style
> > ---
> > Changes in V3:
> >     - reorder headers in alphabetical order
> >     - merge changes related to start_xen() function from "[PATCH v2
> > 7/8]
> >       xen/riscv: print hello message from C env" to this patch
> >     - remove unneeded parentheses in definition of STACK_SIZE
> > ---
> > Changes in V2:
> >     - introduce STACK_SIZE define.
> >     - use consistent padding between instruction mnemonic and
> > operand(s)
> > ---
> >  xen/arch/riscv/Kconfig.debug              |  5 ++++
> >  xen/arch/riscv/Makefile                   |  1 +
> >  xen/arch/riscv/early_printk.c             | 33
> > +++++++++++++++++++++++
> >  xen/arch/riscv/include/asm/early_printk.h | 12 +++++++++
> >  xen/arch/riscv/setup.c                    |  4 +++
> >  5 files changed, 55 insertions(+)
> >  create mode 100644 xen/arch/riscv/early_printk.c
> >  create mode 100644 xen/arch/riscv/include/asm/early_printk.h
> >
> > diff --git a/xen/arch/riscv/Kconfig.debug
> > b/xen/arch/riscv/Kconfig.debug
> > index e69de29bb2..608c9ff832 100644
> > --- a/xen/arch/riscv/Kconfig.debug
> > +++ b/xen/arch/riscv/Kconfig.debug
> > @@ -0,0 +1,5 @@
> > +config EARLY_PRINTK
> > +    bool "Enable early printk"
> > +    default DEBUG
> > +    help
> > +      Enables early printk debug messages
> > diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> > index fd916e1004..1a4f1a6015 100644
> > --- a/xen/arch/riscv/Makefile
> > +++ b/xen/arch/riscv/Makefile
> > @@ -1,3 +1,4 @@
> > +obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
> >  obj-$(CONFIG_RISCV_64) += riscv64/
> >  obj-y += sbi.o
> >  obj-y += setup.o
> > diff --git a/xen/arch/riscv/early_printk.c
> > b/xen/arch/riscv/early_printk.c
> > new file mode 100644
> > index 0000000000..b66a11f1bc
> > --- /dev/null
> > +++ b/xen/arch/riscv/early_printk.c
> > @@ -0,0 +1,33 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * RISC-V early printk using SBI
> > + *
> > + * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
> > + */
> > +#include <asm/early_printk.h>
> > +#include <asm/sbi.h>
> > +
> > +/*
> > + * TODO:
> > + *   sbi_console_putchar is already planned for deprecation
> > + *   so it should be reworked to use UART directly.
> > +*/
> > +void early_puts(const char *s, size_t nr)
> > +{
> > +    while ( nr-- > 0 )
> > +    {
> > +        if ( *s == '\n' )
> > +            sbi_console_putchar('\r');
> > +        sbi_console_putchar(*s);
> > +        s++;
> > +    }
> > +}
> > +
> > +void early_printk(const char *str)
> > +{
> > +    while ( *str )
> > +    {
> > +        early_puts(str, 1);
> > +        str++;
> > +    }
> > +}
> > diff --git a/xen/arch/riscv/include/asm/early_printk.h
> > b/xen/arch/riscv/include/asm/early_printk.h
> > new file mode 100644
> > index 0000000000..05106e160d
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/early_printk.h
> > @@ -0,0 +1,12 @@
> > +#ifndef __EARLY_PRINTK_H__
> > +#define __EARLY_PRINTK_H__
> > +
> > +#include <xen/early_printk.h>
> > +
> > +#ifdef CONFIG_EARLY_PRINTK
> > +void early_printk(const char *str);
> > +#else
> > +static inline void early_printk(const char *s) {};
> > +#endif
> > +
> > +#endif /* __EARLY_PRINTK_H__ */
> > diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> > index 13e24e2fe1..d09ffe1454 100644
> > --- a/xen/arch/riscv/setup.c
> > +++ b/xen/arch/riscv/setup.c
> > @@ -1,12 +1,16 @@
> >  #include <xen/compile.h>
> >  #include <xen/init.h>
> >
> > +#include <asm/early_printk.h>
> > +
> >  /* Xen stack for bringing up the first CPU. */
> >  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
> >      __aligned(STACK_SIZE);
> >
> >  void __init noreturn start_xen(void)
> >  {
> > +    early_printk("Hello from C env\n");
> > +
> >      for ( ;; )
> >          asm volatile ("wfi");
> >
>
>

