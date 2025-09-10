Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07C7B51012
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117905.1463917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFhq-00075s-Ef; Wed, 10 Sep 2025 07:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117905.1463917; Wed, 10 Sep 2025 07:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFhq-00074D-By; Wed, 10 Sep 2025 07:57:30 +0000
Received: by outflank-mailman (input) for mailman id 1117905;
 Wed, 10 Sep 2025 07:57:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwrE=3V=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uwFho-00072X-Eq
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:57:28 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca8a2795-8e1b-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 09:57:26 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-336b908cbaaso56045351fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 00:57:26 -0700 (PDT)
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
X-Inumbo-ID: ca8a2795-8e1b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757491046; x=1758095846; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsCK+FAC+gsM4EV682APBEiNe693UcSOoCjjtWvQEsc=;
        b=GDGnxYw2+MdtHPvvAp2mA3z0wSqJYtauDnbArPeXo2nnLqufUTUrNgb+ZC7CvS8b1Z
         MHc+u7XbNie9LzhBkZcl/Sqq4IQG8DmNywpByWXI3GLFP1c0dBiGLnXOxQq2B0C90zKm
         jMVJQ5E2GxJBhYiXJOKHvi4DUkhqdW3nlZpTqhpWepQ6Kq9FCckZT0ZEWr37g40xBQnE
         cg+ns0Sfny1kUriThNftJtIw+uHPP4Zm3R98e65LB8vtAjG1YixMK+lb+cadjra3+opb
         AvMs2wM+W4RjHDbHZPuAZ79KzGtGd56L0DIBEFtVaUNWRBjCPU1p/CsEB2RRLBoWXx9d
         WPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757491046; x=1758095846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsCK+FAC+gsM4EV682APBEiNe693UcSOoCjjtWvQEsc=;
        b=QQBY3W1c2Fzdgqyf7E6abdzsUoFFnBWXNSbNeNMGfE5XgsVBbk23bNiadADSo8i2NO
         PfcGnfvlSQSALAyxda8tJ+/I9JjJp3t+b9EqUGFHCchE4DozAHIdbmQFxoAbYMKvvsfw
         g/46hZdco8dTiCgnOqPCgdwzpKfVRUQUJoUV3ReezKjbqpHeeuURIGVuJqmwb29arZsd
         I6sZHbUMDDBB+jp7sm8r76Pvd/o9DD+16rmN1msIwAQAq3NLT2axpwZAvELRq3vQ0lCl
         YkeWhkN3WTSsUruH1PLYM7BuijWtXR6L40GYR0Bi3wBcqcncPYcVaLSFl9qLTmMaiBBv
         QTSQ==
X-Gm-Message-State: AOJu0YwTUeJCWD30Idl5bYSiauQlFi4DVq4+2GN/KMa2A3YJKNgS3H51
	a4C1MhlsISLzFJYlOMGopxx1tpgE2WA29aUt50bEES/84d7KzCiW/O/uSE8oq58rYiHUa4bSiF6
	eQDcfzWVq5HGv0q38YhS7A92QL7OtamU=
X-Gm-Gg: ASbGncvhQ6oR+zSD4pdu6ol2AGScxO8MC7AR3ZcddaiZCup8hBdamHbL/8bGOCx5W/m
	1VU/P1DgVb4nDRCmqzSskXN1y2QgxAuyv4DH4YQQjVRbWesL8ox93BeI3At1uglBVYbB0/GR4b+
	EnKFmft0HedP5/dwWKmAFeAHq6hMaQ77nZO3ydvncIJObqwaFsv7mMDcbpd5JvRcEahmfUeG7L1
	NwXVw==
X-Google-Smtp-Source: AGHT+IHVMT5MUiPp568NOZyB1nfjqarDkPhtpnVFdJWjr4xPNn/svyK5S+lQEGYmMZdMEoTsUDbscAMWi3+2ICe/jcY=
X-Received: by 2002:a05:651c:3247:20b0:336:94b4:2b5d with SMTP id
 38308e7fff4ca-33b566fa995mr33597841fa.5.1757491045125; Wed, 10 Sep 2025
 00:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250908211149.279143-1-dmukhin@ford.com> <20250908211149.279143-2-dmukhin@ford.com>
In-Reply-To: <20250908211149.279143-2-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 10 Sep 2025 10:57:14 +0300
X-Gm-Features: Ac12FXzi0TcPZahdQQpNOxgau8e7C2HJpAVryccvqf2zOYBF57ln3vuQF5QUje0
Message-ID: <CAGeoDV92gvzfF4fEo2KBPhvYba2ULK5yW2LGBBQ2e8z2FU2yyQ@mail.gmail.com>
Subject: Re: [PATCH v7 01/16] emul/vuart: introduce framework for UART emulators
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Thank you for addressing the issues from the previous version of the
patch series,

Everything looks good to me, with just a few questions:

On Tue, Sep 9, 2025 at 12:56=E2=80=AFAM <dmukhin@xen.org> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Introduce a driver framework to abstract UART emulators in the hypervisor=
.
>
> That allows for architecture-independent handling of virtual UARTs in the
> console driver and simplifies enabling new UART emulators.
>
> The framework is built under CONFIG_VUART_FRAMEWORK, which will be
> automatically enabled once the user enables any UART emulator.
>
> Current implementation supports maximum of one vUART of each kind per dom=
ain.
>
> Use new domain_has_vuart() in the console driver code to check whether to
> forward console input to the domain using vUART.
>
> Enable console forwarding over vUART for hardware domains with a vUART. T=
hat
> enables console forwarding to dom0 on x86, since console can be forwarded=
 only
> to Xen, dom0 and pvshim on x86 as of now.
>
> Note: existing vUARTs are deliberately *not* hooked to the new framework =
to
> minimize the scope of the patch: vpl011 (i.e. SBSA) emulator and "vuart" =
(i.e.
> minimalistic MMIO-mapped dtuart for hwdoms on Arm) are kept unmodified.
>
> No functional changes for non-x86 architectures.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v6:
> - addresses Mykola's feedback
> - some renaming (vuart_find_by_flags())
> - added extra checks to put_rx and dump_state
> - fixed vuart_init() error path
> - simplified some checks during vUART state 'search'
> ---
>  xen/arch/arm/xen.lds.S         |   1 +
>  xen/arch/ppc/xen.lds.S         |   1 +
>  xen/arch/riscv/xen.lds.S       |   1 +
>  xen/arch/x86/xen.lds.S         |   1 +
>  xen/common/Kconfig             |   2 +
>  xen/common/Makefile            |   1 +
>  xen/common/emul/Kconfig        |   6 ++
>  xen/common/emul/Makefile       |   1 +
>  xen/common/emul/vuart/Kconfig  |   6 ++
>  xen/common/emul/vuart/Makefile |   1 +
>  xen/common/emul/vuart/vuart.c  | 165 +++++++++++++++++++++++++++++++++
>  xen/common/keyhandler.c        |   3 +
>  xen/drivers/char/console.c     |   6 +-
>  xen/include/xen/sched.h        |   4 +
>  xen/include/xen/serial.h       |   3 +
>  xen/include/xen/vuart.h        | 115 +++++++++++++++++++++++
>  xen/include/xen/xen.lds.h      |  10 ++
>  17 files changed, 326 insertions(+), 1 deletion(-)
>  create mode 100644 xen/common/emul/Kconfig
>  create mode 100644 xen/common/emul/Makefile
>  create mode 100644 xen/common/emul/vuart/Kconfig
>  create mode 100644 xen/common/emul/vuart/Makefile
>  create mode 100644 xen/common/emul/vuart/vuart.c
>  create mode 100644 xen/include/xen/vuart.h
>
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index db17ff1efa98..cd05b18770f4 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -58,6 +58,7 @@ SECTIONS
>         *(.rodata)
>         *(.rodata.*)
>         VPCI_ARRAY
> +       VUART_ARRAY
>         *(.data.rel.ro)
>         *(.data.rel.ro.*)
>
> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> index 1de0b77fc6b9..f9d4e5b0dcd8 100644
> --- a/xen/arch/ppc/xen.lds.S
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -52,6 +52,7 @@ SECTIONS
>          *(.rodata)
>          *(.rodata.*)
>          VPCI_ARRAY
> +        VUART_ARRAY
>          *(.data.rel.ro)
>          *(.data.rel.ro.*)
>
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> index edcadff90bfe..59dcaa5fef9a 100644
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -47,6 +47,7 @@ SECTIONS
>          *(.rodata)
>          *(.rodata.*)
>          VPCI_ARRAY
> +        VUART_ARRAY
>          *(.data.rel.ro)
>          *(.data.rel.ro.*)
>
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 966e514f2034..d877b93a6964 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -132,6 +132,7 @@ SECTIONS
>         *(.rodata)
>         *(.rodata.*)
>         VPCI_ARRAY
> +       VUART_ARRAY
>         *(.data.rel.ro)
>         *(.data.rel.ro.*)
>
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 76f9ce705f7a..78a32b69e2b2 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -676,4 +676,6 @@ config PM_STATS
>           Enable collection of performance management statistics to aid i=
n
>           analyzing and tuning power/performance characteristics of the s=
ystem
>
> +source "common/emul/Kconfig"
> +
>  endmenu
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 0c7d0f5d46e1..8c8462565050 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_DEVICE_TREE_PARSE) +=3D device-tree/
>  obj-$(CONFIG_IOREQ_SERVER) +=3D dm.o
>  obj-y +=3D domain.o
>  obj-y +=3D domid.o
> +obj-y +=3D emul/
>  obj-y +=3D event_2l.o
>  obj-y +=3D event_channel.o
>  obj-$(CONFIG_EVTCHN_FIFO) +=3D event_fifo.o
> diff --git a/xen/common/emul/Kconfig b/xen/common/emul/Kconfig
> new file mode 100644
> index 000000000000..7c6764d1756b
> --- /dev/null
> +++ b/xen/common/emul/Kconfig
> @@ -0,0 +1,6 @@
> +menu "Domain Emulation Features"
> +       visible if EXPERT
> +
> +source "common/emul/vuart/Kconfig"
> +
> +endmenu
> diff --git a/xen/common/emul/Makefile b/xen/common/emul/Makefile
> new file mode 100644
> index 000000000000..ae0b575c3901
> --- /dev/null
> +++ b/xen/common/emul/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_VUART_FRAMEWORK) +=3D vuart/
> diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kconfi=
g
> new file mode 100644
> index 000000000000..ce1b976b7da7
> --- /dev/null
> +++ b/xen/common/emul/vuart/Kconfig
> @@ -0,0 +1,6 @@
> +config VUART_FRAMEWORK
> +       bool
> +
> +menu "UART Emulation"
> +
> +endmenu
> diff --git a/xen/common/emul/vuart/Makefile b/xen/common/emul/vuart/Makef=
ile
> new file mode 100644
> index 000000000000..97f792dc6641
> --- /dev/null
> +++ b/xen/common/emul/vuart/Makefile
> @@ -0,0 +1 @@
> +obj-y +=3D vuart.o
> diff --git a/xen/common/emul/vuart/vuart.c b/xen/common/emul/vuart/vuart.=
c
> new file mode 100644
> index 000000000000..ba89d608aeb2
> --- /dev/null
> +++ b/xen/common/emul/vuart/vuart.c
> @@ -0,0 +1,165 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * UART emulator framework.
> + *
> + * Copyright 2025 Ford Motor Company
> + */
> +
> +#include <xen/err.h>
> +#include <xen/sched.h>
> +#include <xen/vuart.h>
> +#include <xen/xvmalloc.h>
> +
> +#define for_each_emulator(e) \
> +    for ( e =3D vuart_array_start; e < vuart_array_end; e++ )
> +
> +extern const struct vuart_emulator vuart_array_start[];
> +extern const struct vuart_emulator vuart_array_end[];
> +
> +static const struct vuart_emulator *
> +vuart_match_by_compatible(const struct domain *d, const char *compat)
> +{
> +    const struct vuart_emulator *emulator;
> +
> +    for_each_emulator(emulator)
> +        if ( emulator->compatible &&
> +             !strncmp(compat, emulator->compatible,
> +                      strlen(emulator->compatible)) )
> +            return emulator;
> +
> +    return NULL;
> +}
> +
> +const static struct vuart *
> +vuart_find_by_flags(const struct domain *d, unsigned int flags)
> +{
> +    const struct vuart *vuart =3D d->console.vuart;
> +
> +    if ( vuart && (vuart->flags & flags) )
> +        return vuart;
> +
> +    return NULL;
> +}
> +
> +struct vuart *vuart_find_by_io_range(struct domain *d, unsigned long add=
r,
> +                                     unsigned long size)
> +{
> +    struct vuart *vuart =3D d->console.vuart;
> +
> +    if ( vuart &&
> +         addr >=3D vuart->info->base_addr &&
> +         addr + size - 1 <=3D vuart->info->base_addr + vuart->info->size=
 - 1 )
> +        return vuart;
> +
> +    return NULL;
> +}
> +
> +int vuart_init(struct domain *d, const struct vuart_info *info)
> +{
> +    const struct vuart_emulator *emulator;
> +    struct vuart *vuart;
> +    int rc;
> +
> +    if ( d->console.vuart )
> +        return -EBUSY;
> +
> +    emulator =3D vuart_match_by_compatible(d, info->compatible);
> +    if ( !emulator )
> +        return -ENODEV;
> +
> +    vuart =3D xzalloc(typeof(*vuart));
> +    if ( !vuart )
> +        return -ENOMEM;
> +
> +    vuart->info =3D xvzalloc(typeof(*vuart->info));
> +    if ( !vuart->info )
> +    {
> +        rc =3D -ENOMEM;
> +        goto err_out1;
> +    }
> +    memcpy(vuart->info, info, sizeof(*info));
> +
> +    vuart->vdev =3D emulator->alloc(d, vuart->info);
> +    if ( IS_ERR(vuart->vdev) )
> +    {
> +        rc =3D PTR_ERR(vuart->vdev);
> +        goto err_out2;
> +    }
> +
> +    vuart->emulator =3D emulator;
> +    vuart->owner =3D d;
> +    vuart->flags |=3D VUART_CONSOLE_INPUT;
> +
> +    d->console.input_allowed =3D true;

I'm not a specialist in the area of consoles, but I'm wondering:
Does the input_allowed flag serve the same purpose as
VUART_CONSOLE_INPUT? If so, do we need both, or
could one be removed to simplify the code?

At least here they are set in sync.

> +    d->console.vuart =3D vuart;
> +
> +    return 0;
> +
> + err_out2:
> +    xvfree(vuart->info);
> + err_out1:
> +    xvfree(vuart);
> +
> +    return rc;
> +}
> +
> +/*
> + * Release any resources taken by UART emulators.
> + *
> + * NB: no flags are cleared, since currently exit() is called only durin=
g
> + * domain destroy.
> + */
> +void vuart_deinit(struct domain *d)
> +{
> +    struct vuart *vuart =3D d->console.vuart;
> +
> +    if ( vuart )
> +    {
> +        vuart->emulator->free(vuart->vdev);
> +        xvfree(vuart->info);
> +    }
> +    XVFREE(d->console.vuart);
> +}
> +
> +/*
> + * Print emulated UART state on the console.
> + *
> + * Must be called under rcu_lock_domain().
> + */
> +void vuart_dump_state(const struct domain *d)
> +{
> +    struct vuart *vuart =3D d->console.vuart;
> +
> +    if ( vuart && vuart->emulator->dump_state )
> +        vuart->emulator->dump_state(vuart->vdev);
> +}
> +
> +/*
> + * Put character to the first emulated UART's FIFO with the physical con=
sole
> + * forwarding enabled.
> + *
> + * Must be called under rcu_lock_domain().
> + */
> +int vuart_put_rx(struct domain *d, char c)
> +{
> +    const struct vuart *vuart =3D vuart_find_by_flags(d, VUART_CONSOLE_I=
NPUT);

The call to vuart_find_by_flags() with VUART_CONSOLE_INPUT in
vuart_put_rx() appears unnecessary. Every vUART console is always
initialized with VUART_CONSOLE_INPUT, so even if multiple consoles
exist, the search will always return the first console. It would be
simpler and clearer to use d->console.vuart directly.

Consider updating the function to remove the flag-based search and add a
short comment explaining why checking the flag isn=E2=80=99t needed. This w=
ill
help avoid confusion for future maintainers. Alternatively, we could
pass flags to the init functions instead of hardcoding
VUART_CONSOLE_INPUT for every console.

> +
> +    if ( vuart && vuart->emulator->put_rx )
> +        return vuart->emulator->put_rx(vuart->vdev, c);
> +
> +    return  -ENODEV;
> +}
> +
> +bool domain_has_vuart(const struct domain *d)
> +{
> +    return vuart_find_by_flags(d, VUART_CONSOLE_INPUT);

The same issue applies here: domain_has_vuart() calls
vuart_find_by_flags() with VUART_CONSOLE_INPUT, but every
vUART console is always initialized with this flag

> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> index cb6df2823b00..156e64d9eb58 100644
> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -22,6 +22,7 @@
>  #include <xen/mm.h>
>  #include <xen/watchdog.h>
>  #include <xen/init.h>
> +#include <xen/vuart.h>
>  #include <asm/div64.h>
>
>  static unsigned char keypress_key;
> @@ -352,6 +353,8 @@ static void cf_check dump_domains(unsigned char key)
>                             v->periodic_period / 1000000);
>              }
>          }
> +
> +        vuart_dump_state(d);
>      }
>
>      for_each_domain ( d )
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 9bd5b4825da6..d5164897a776 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -33,6 +33,7 @@
>  #include <asm/setup.h>
>  #include <xen/sections.h>
>  #include <xen/consoled.h>
> +#include <xen/vuart.h>
>
>  #ifdef CONFIG_X86
>  #include <asm/guest.h>
> @@ -596,11 +597,12 @@ static void __serial_rx(char c)
>      if ( !d )
>          return;
>
> -    if ( is_hardware_domain(d) )
> +    if ( is_hardware_domain(d) && !domain_has_vuart(d) )
>      {
>          /*
>           * Deliver input to the hardware domain buffer, unless it is
>           * already full.
> +         * NB: must be the first check: hardware domain may have emulate=
d UART.
>           */
>          if ( (serial_rx_prod - serial_rx_cons) !=3D SERIAL_RX_SIZE )
>              serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] =3D c;
> @@ -611,6 +613,8 @@ static void __serial_rx(char c)
>           */
>          send_global_virq(VIRQ_CONSOLE);
>      }
> +    else if ( domain_has_vuart(d) )
> +        rc =3D vuart_put_rx(d, c);
>  #ifdef CONFIG_SBSA_VUART_CONSOLE
>      else
>          /* Deliver input to the emulated UART. */
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 02bdc256ce37..613f4596e33d 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -23,6 +23,7 @@
>  #include <asm/atomic.h>
>  #include <asm/current.h>
>  #include <xen/vpci.h>
> +#include <xen/vuart.h>
>  #include <xen/wait.h>
>  #include <public/xen.h>
>  #include <public/domctl.h>
> @@ -660,6 +661,9 @@ struct domain
>      struct {
>          /* Permission to take ownership of the physical console input. *=
/
>          bool input_allowed;
> +#ifdef CONFIG_VUART_FRAMEWORK
> +        struct vuart *vuart;
> +#endif
>      } console;
>  } __aligned(PAGE_SIZE);
>
> diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
> index 8e1844555208..123eee67df35 100644
> --- a/xen/include/xen/serial.h
> +++ b/xen/include/xen/serial.h
> @@ -36,6 +36,9 @@ struct vuart_info {
>      unsigned long data_off;     /* Data register offset */
>      unsigned long status_off;   /* Status register offset */
>      unsigned long status;       /* Ready status value */
> +    unsigned int irq;           /* Interrupt */
> +    char compatible[16];        /* Compatible string */
> +    char name[16];              /* User-friendly name */
>  };
>
>  struct serial_port {
> diff --git a/xen/include/xen/vuart.h b/xen/include/xen/vuart.h
> new file mode 100644
> index 000000000000..55828f8498ce
> --- /dev/null
> +++ b/xen/include/xen/vuart.h
> @@ -0,0 +1,115 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * UART emulator framework.
> + *
> + * Copyright 2025 Ford Motor Company
> + */
> +
> +#ifndef XEN_VUART_H
> +#define XEN_VUART_H
> +
> +#include <xen/serial.h>
> +#include <public/xen.h>
> +
> +struct vuart_emulator;
> +
> +enum {
> +    VUART_CONSOLE_INPUT =3D BIT(0, U), /* Physical console input forward=
ing. */
> +};
> +
> +/*
> + * FIXME: #ifdef is temporary to avoid clash with
> + *   arch/arm/include/asm/domain.h
> + */
> +#ifdef CONFIG_VUART_FRAMEWORK
> +struct vuart {
> +    const struct vuart_emulator *emulator;
> +    struct vuart_info *info;
> +    struct domain *owner;
> +    unsigned int flags;
> +    void *vdev;
> +};
> +#endif
> +
> +struct vuart_emulator {
> +    /* UART compatible string. Cannot be NULL or empty. */
> +    const char *compatible;
> +
> +    /*
> +     * Allocate emulated UART state (RX/TX FIFOs, locks, initialize regi=
sters,
> +     * hook I/O handlers, etc.)
> +     * Cannot be NULL.
> +     */
> +    void *(*alloc)(struct domain *d, const struct vuart_info *info);
> +
> +    /*
> +     * Release resources used to emulate UART state (flush RX/TX FIFOs, =
unhook
> +     * I/O handlers, etc.).
> +     * Cannot be NULL.
> +     */
> +    void (*free)(void *arg);
> +
> +    /*
> +     * Print emulated UART state, including registers, on the console.
> +     * Can be NULL.
> +     */
> +    void (*dump_state)(void *arg);
> +
> +    /*
> +     * Place character to the emulated RX FIFO.
> +     * Used to forward physical console input to the guest OS.
> +     * Can be NULL.
> +     */
> +    int (*put_rx)(void *arg, char c);
> +};
> +
> +#define VUART_REGISTER(name, x) \
> +    static const struct vuart_emulator name##_entry \
> +        __used_section(".data.rel.ro.vuart") =3D x
> +
> +struct vuart *vuart_find_by_io_range(struct domain *d,
> +                                     unsigned long base_addr,
> +                                     unsigned long size);
> +
> +int vuart_put_rx(struct domain *d, char c);
> +
> +#ifdef CONFIG_VUART_FRAMEWORK
> +
> +int vuart_init(struct domain *d, const struct vuart_info *info);
> +void vuart_deinit(struct domain *d);
> +void vuart_dump_state(const struct domain *d);
> +bool domain_has_vuart(const struct domain *d);
> +
> +#else
> +
> +static inline int vuart_init(struct domain *d, const struct vuart_info *=
info)
> +{
> +    return 0;
> +}
> +
> +static inline void vuart_deinit(struct domain *d)
> +{
> +}
> +
> +static inline void vuart_dump_state(const struct domain *d)
> +{
> +}
> +
> +static inline bool domain_has_vuart(const struct domain *d)
> +{
> +    return false;
> +}
> +
> +#endif /* CONFIG_VUART_FRAMEWORK */
> +
> +#endif /* XEN_VUART_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> +
> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> index b126dfe88792..2d65f32ddad3 100644
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -194,4 +194,14 @@
>  #define VPCI_ARRAY
>  #endif
>
> +#ifdef CONFIG_VUART_FRAMEWORK
> +#define VUART_ARRAY              \
> +       . =3D ALIGN(POINTER_ALIGN); \
> +       vuart_array_start =3D .;    \
> +       *(.data.rel.ro.vuart)     \
> +       vuart_array_end =3D .;
> +#else
> +#define VUART_ARRAY
> +#endif
> +
>  #endif /* __XEN_LDS_H__ */
> --
> 2.51.0
>
>

Best regards,
Mykola

