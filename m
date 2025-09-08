Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A704B4871E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 10:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114769.1461585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvXFX-0006Zv-7B; Mon, 08 Sep 2025 08:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114769.1461585; Mon, 08 Sep 2025 08:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvXFX-0006Xr-4T; Mon, 08 Sep 2025 08:29:19 +0000
Received: by outflank-mailman (input) for mailman id 1114769;
 Mon, 08 Sep 2025 08:29:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zpM=3T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uvXFV-0006Xl-Bf
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 08:29:17 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7d6120d-8c8d-11f0-9d13-b5c5bf9af7f9;
 Mon, 08 Sep 2025 10:29:15 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55f646b1db8so4733298e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 01:29:15 -0700 (PDT)
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
X-Inumbo-ID: e7d6120d-8c8d-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757320155; x=1757924955; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5XwgX+w7vmzVe5+ogaENu7bH4qu0T48FtMnCVFLfY4=;
        b=R167wZWqbWsw17FLwA1mGsCxmmOY4Q/B0bH+27gPi2n2EMOnG+eHP/bmWck3gDqvEp
         QoFD0ZNfxqZDTpUL4fZy20jtBizq4oY2xuC65U7PuPivmjYBFQWwL1tUGs6IQHXsEBD/
         jCCngg9piJm4DmBsMBOVo9DTv1vjKtRtxuUs8WfeLUXdYQYVZ/ZZiN9+Ztk+Vknszvqe
         +tdZPK+BdH9twvZunMxhdOqrKf85DofAA0hYb+JibjUGXDCDFRYEK2cgzACRt0ds+VSh
         KhAQEFoFjw68W2YQaqiRESsCKblCQidEKicikHU047nTtRs/Z4n8WSfueCFn9GBNg/qv
         /00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320155; x=1757924955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5XwgX+w7vmzVe5+ogaENu7bH4qu0T48FtMnCVFLfY4=;
        b=r8UmE/IhaPCk44edGrn4cYx6C6EGW3fVw/p895QpdcvFkVbwkvavlWFyQCUUz/k6Tk
         QY+2z/eIdViTGiYHsMuzxBRKKpU03nc+8wvyV2XMf2vQIZmtjEhr3iwnFkuonDGn8diL
         Eac1kgvjTKo5WgNb9SqyDYrWJR62jtYyS9jXu6xUlM9fw+0oRfAv9ZxVtYyk6N0E6ZcE
         LzhYbvxcP/n8rNxns7Dlp2gh1jhmIB1NVKprZc/ZP4MjzH1NsDZUutudSaWjpgjSP2j0
         /jGjt5VG5ocCaLsNZnJ5cknU3GjtgWbooBDadzmWE7Vpw9BLSCYsTjUEmNhg2Pyljea/
         QxMQ==
X-Gm-Message-State: AOJu0Yx0T2ORoI3+1s0TW7L23xdso7OjjPbkJnulQthT+Kh7St7XtLRq
	daCvE4/R3W5d5qKeGrbnvpT0Pm39Yv5t5/+BBp4uUHxYU5DKaP4k5z53CuwOGmvMY0dYe1a9ne8
	FvaYfaegS/M7By3qze5z237oLMLDZ2Ac=
X-Gm-Gg: ASbGncvg3vVBJHHS7cU3CDubVJZh7NmlDjTk1hQ1NaGJWEWWM4XWNT4kW8k+ON7btgi
	kbYCdch7ZvX1HdOXR5jNctGN9jbr2+8djk7KJ61nSil3QztDlUL5mezG30mfDlQ2fOdLg5SfkU9
	IKZGj9cEMglYPxbXqpmVarw6oElU2t3Qp6k1de5gBMiyZayjTBjTpCFUBdhqR4A3M7i75/4O0Xt
	y6Sg3qc5JPRgPcb
X-Google-Smtp-Source: AGHT+IGoMiaXmcfr4Hi9v6a6nMwYkPHfSsTfQ+/1kCZKnaZik9KVG3luzVtvUhxih+tFzOzYRcVFiJyWyjcUVZa+uq4=
X-Received: by 2002:a05:6512:401e:b0:55f:6a6a:4955 with SMTP id
 2adb3069b0e04-562617e64e8mr1592662e87.25.1757320154891; Mon, 08 Sep 2025
 01:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250905232715.440758-1-dmukhin@ford.com> <20250905232715.440758-2-dmukhin@ford.com>
In-Reply-To: <20250905232715.440758-2-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 8 Sep 2025 11:29:03 +0300
X-Gm-Features: Ac12FXyoFFwNYZip4VI_yxIiWiRQJRn59GrkYOIN-Vhs7VgxM6zhB_kFqnnULsI
Message-ID: <CAGeoDV8xKHSobiLiWuzKtnxPXnRvFWf139BddeTUkuREEvrk2w@mail.gmail.com>
Subject: Re: [PATCH v6 01/15] emul/vuart: introduce framework for UART emulators
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 6, 2025 at 2:27=E2=80=AFAM <dmukhin@xen.org> wrote:
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
> Changes since v5:
> - addressed v5 feedback
> - Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-2-=
dmukhin@ford.com/
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
>  xen/common/emul/vuart/vuart.c  | 157 +++++++++++++++++++++++++++++++++
>  xen/common/keyhandler.c        |   3 +
>  xen/drivers/char/console.c     |   6 +-
>  xen/include/xen/sched.h        |   4 +
>  xen/include/xen/serial.h       |   3 +
>  xen/include/xen/vuart.h        | 116 ++++++++++++++++++++++++
>  xen/include/xen/xen.lds.h      |  10 +++
>  17 files changed, 319 insertions(+), 1 deletion(-)
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

If VUART_FRAMEWORK has no dependencies, it can be enabled on any
architecture. For example, I tried enabling it on arm64 and the build
fails:

  ./include/xen/vuart.h:26:8: error: redefinition of =E2=80=98struct vuart=
=E2=80=99

Should this config be restricted (e.g. "depends on X86") or the code
adjusted to handle non-x86 architectures properly?

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
> index 000000000000..3dfcba217248
> --- /dev/null
> +++ b/xen/common/emul/vuart/vuart.c
> @@ -0,0 +1,157 @@
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
> +vuart_find_by_console_permission(const struct domain *d)

During the first review of this patch I thought you planned to add a
searching procedure into this and the next function in one of the later
commits. However, looking at the series now, it seems these functions
remain unchanged and don=E2=80=99t actually perform any searching.

Do you think the current names are accurate, or would it make sense to
rename them to better reflect their purpose?

> +{
> +    const struct vuart *vuart =3D d->console.vuart;
> +
> +    if ( !vuart || !vuart->emulator || !vuart->emulator->put_rx ||
> +         !(vuart->flags & VUART_CONSOLE_INPUT))
> +        return NULL;
> +
> +    return vuart;
> +}
> +
> +struct vuart *vuart_find_by_io_range(struct domain *d, unsigned long add=
r,
> +                                     unsigned long size)
> +{
> +    struct vuart *vuart =3D d->console.vuart;
> +
> +    if ( !vuart || !vuart->info )
> +        return NULL;
> +
> +    if ( addr >=3D vuart->info->base_addr &&
> +         addr + size - 1 <=3D vuart->info->base_addr + vuart->info->size=
 - 1 )
> +        return vuart;
> +
> +    return NULL;
> +}
> +
> +int vuart_init(struct domain *d, struct vuart_info *info)
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
> +    vuart->info =3D xvzalloc(typeof(*info));
> +    if ( !vuart->info )
> +    {
> +        rc =3D -ENOMEM;
> +        goto err_out;
> +    }
> +    memcpy(vuart->info, info, sizeof(*info));
> +
> +    vuart->vdev =3D emulator->alloc(d, vuart->info);
> +    if ( IS_ERR(vuart->vdev) )
> +    {
> +        rc =3D PTR_ERR(vuart->vdev);
> +        goto err_out;
> +    }
> +
> +    vuart->emulator =3D emulator;
> +    vuart->owner =3D d;
> +    vuart->flags |=3D VUART_CONSOLE_INPUT;
> +
> +    d->console.input_allowed =3D true;
> +    d->console.vuart =3D vuart;
> +
> +    return 0;
> +
> + err_out:
> +    if ( vuart )
> +        xvfree(vuart->info);
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
> +void vuart_dump_state(const struct domain *d)
> +{
> +    struct vuart *vuart =3D d->console.vuart;
> +
> +    if ( vuart )
> +        vuart->emulator->dump_state(vuart->vdev);
> +}
> +
> +/*
> + * Put character to the *first* suitable emulated UART's FIFO.
> + */
> +int vuart_put_rx(struct domain *d, char c)
> +{
> +    const struct vuart *vuart =3D vuart_find_by_console_permission(d);
> +
> +    return vuart ? vuart->emulator->put_rx(vuart->vdev, c) : -ENODEV;
> +}
> +
> +bool domain_has_vuart(const struct domain *d)
> +{
> +    return vuart_find_by_console_permission(d);
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
> index 000000000000..54f2f29f3f4a
> --- /dev/null
> +++ b/xen/include/xen/vuart.h
> @@ -0,0 +1,116 @@
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
> +    uint32_t flags;
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
> +int vuart_init(struct domain *d, struct vuart_info *info);
> +void vuart_deinit(struct domain *d);
> +void vuart_dump_state(const struct domain *d);
> +bool domain_has_vuart(const struct domain *d);
> +
> +#else
> +
> +static inline int vuart_init(struct domain *d, struct vuart_info *info)
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

