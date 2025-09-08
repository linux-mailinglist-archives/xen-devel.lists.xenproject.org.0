Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB32B4875A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 10:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114806.1461616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvXNH-0000rm-Ij; Mon, 08 Sep 2025 08:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114806.1461616; Mon, 08 Sep 2025 08:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvXNH-0000ou-Em; Mon, 08 Sep 2025 08:37:19 +0000
Received: by outflank-mailman (input) for mailman id 1114806;
 Mon, 08 Sep 2025 08:37:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zpM=3T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uvXNF-0000co-Nk
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 08:37:17 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0638dfa0-8c8f-11f0-9d13-b5c5bf9af7f9;
 Mon, 08 Sep 2025 10:37:16 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-336cdca667aso30569091fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 01:37:16 -0700 (PDT)
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
X-Inumbo-ID: 0638dfa0-8c8f-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757320636; x=1757925436; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeNNjwSB6pIhXass0CdICHduh4IgyrAcA69H6gI/ENA=;
        b=WE9WxhhWdSImUj66eWhHljAex27LM508EO1RIQPPJSJJzeu3yJGFvkJ2hlCwGjV1g1
         eg3tgh7Zk1JWD39Z/Klhq4wWGU7/2WlvEPW46Bf7wlXK2efLSqtwApJbGAtwbP3htPJQ
         yKJ/DWAqKPibNo1WJzRo12JVT/1MXJ87f/8sYyPUX1ASlQ5f2zGXbqzCD8sbjl+XHCtN
         DvutnGTfpA94givYOpHTcjHfWj6tMalz8gjVKKCLxZltBPiVntNLqAZEJ1lDhTjkhu5V
         ZPCQho4H9CpBmvFcwy3suriytbqrME0MSGMwwonUo6YVCAVqU2T++oRPecuiFxgF7dR9
         1qlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320636; x=1757925436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XeNNjwSB6pIhXass0CdICHduh4IgyrAcA69H6gI/ENA=;
        b=P0h1XLuU9wbbbvIvkSKVuTA+dsIS02bsor47IwdIkhC8SwZ/zhqpYiMnXCzxPlPxUz
         6z1ORz9hLvOiSiEEzF14mti70t/+cuIKUqgihu3on5P0X3rNkshsCv2T+sbGSbKag6c4
         2MU7XxsmmYpTU11YMH/2uAlwzUa1njawKWUMgI3nzZMV4aARJcDOX8e6ne8WbXPxTBWY
         hKM0hBpERgwuN55JfsVPwXaOAmP88V73g0xA9JkuuTuxpTgnxdIHsCp4TNpu+I2nh+IM
         /iPwU9J2TUe4vtWPvGzK7sPxxSw7Gnkdodf78pz7mrqMK0TH7Wj6dvSc30RvmUWWhwWi
         dkZQ==
X-Gm-Message-State: AOJu0YxBdaf6yHdaWkSIZI48cLbRBivdjdnCutrvZPXaVjPZDfKwNG//
	8KA6kt2apQwt5Do/Y0uAfzzUdU3leRezs/hBdCVHCy+yMhfGwECP+j/RxXujKN6mcgS8m+6r0YM
	qtxzKdT2mchAP3LBGiofIC9kv0ginX8Y=
X-Gm-Gg: ASbGncvC3AhIEcPY8LA5ARJPbh1l/i+s0Z/m3LIP7eMeiuTBUV5PBsKn3miq4d2G4+f
	eB13z1JAAg4bpr/8PUe50D2iTdCEAHw1a89aphV/rqASQZy9aQ3AA3arRa/Un/gmkzZbNoJcYWB
	kNwxvGP97de8qsZm2/hsp25iLAMnFCbHAgqK2u8S3UHsdcYHBCaCbd544qQO3Zrakzaokzg8o9j
	PN19A==
X-Google-Smtp-Source: AGHT+IG23nMgMyhXf0HW3N+BOu56CoTemJBRiA+9uejA00v0VYKm/t/UvnD1W3fn46rW/ubqX40OgADICDlwkyJzUCA=
X-Received: by 2002:a05:651c:19a5:b0:337:f63a:fa28 with SMTP id
 38308e7fff4ca-33b52891afcmr23008371fa.20.1757320635423; Mon, 08 Sep 2025
 01:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250905232715.440758-1-dmukhin@ford.com> <20250905232715.440758-4-dmukhin@ford.com>
In-Reply-To: <20250905232715.440758-4-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 8 Sep 2025 11:37:03 +0300
X-Gm-Features: Ac12FXyj5CcSETlzCr3TdDFIjG198G5XFZKdnARSIl1Ap8H7SYmeg80_81K2UJQ
Message-ID: <CAGeoDV8cGyKZCXpm=U5FkjBi701T2Cku39DM9iFMGRUBFN5mPA@mail.gmail.com>
Subject: Re: [PATCH v6 03/15] emul/ns16x50: implement emulator stub
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

On Sat, Sep 6, 2025 at 2:27=E2=80=AFAM <dmukhin@xen.org> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> The change is the first on the way on introducing minimally functional
> NS16550-compatible UART emulator.
>
> Define UART state and a set of emulated registers.
>
> Implement alloc/free vUART hooks.
>
> Stub out I/O port handler.
>
> Add initialization of the NS16x50-compatible UART emulator state machine.
>
> Plumb debug logging.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v5:
> - v5 feedback
> - Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-4-=
dmukhin@ford.com/
> ---
>  xen/arch/x86/hvm/hvm.c          |  21 ++
>  xen/common/emul/vuart/Kconfig   |  19 ++
>  xen/common/emul/vuart/Makefile  |   1 +
>  xen/common/emul/vuart/ns16x50.c | 366 ++++++++++++++++++++++++++++++++
>  4 files changed, 407 insertions(+)
>  create mode 100644 xen/common/emul/vuart/ns16x50.c
>
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 23bd7f078a1d..91c971f11e14 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -28,6 +28,7 @@
>  #include <xen/softirq.h>
>  #include <xen/trace.h>
>  #include <xen/vm_event.h>
> +#include <xen/vuart.h>
>  #include <xen/vpci.h>
>  #include <xen/wait.h>
>  #include <xen/warning.h>
> @@ -689,6 +690,22 @@ int hvm_domain_initialise(struct domain *d,
>      if ( rc !=3D 0 )
>          goto fail1;
>
> +    /* Limit NS16550 emulator for dom0 only for now. */
> +    if ( IS_ENABLED(CONFIG_VUART_NS16X50) && is_hardware_domain(d) )
> +    {
> +        struct vuart_info info =3D {
> +            .name       =3D "COM2",
> +            .compatible =3D "ns16550",
> +            .base_addr  =3D 0x2f8,
> +            .size       =3D 8,
> +            .irq        =3D 3,
> +        };
> +
> +        rc =3D vuart_init(d, &info);
> +        if ( rc )
> +            goto out_vioapic_deinit;
> +    }
> +
>      stdvga_init(d);
>
>      rtc_init(d);
> @@ -712,6 +729,8 @@ int hvm_domain_initialise(struct domain *d,
>      return 0;
>
>   fail2:
> +    vuart_deinit(d);
> + out_vioapic_deinit:
>      vioapic_deinit(d);
>   fail1:
>      if ( is_hardware_domain(d) )
> @@ -774,6 +793,8 @@ void hvm_domain_destroy(struct domain *d)
>      if ( hvm_funcs.domain_destroy )
>          alternative_vcall(hvm_funcs.domain_destroy, d);
>
> +    vuart_deinit(d);
> +
>      vioapic_deinit(d);
>
>      XFREE(d->arch.hvm.pl_time);
> diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kconfi=
g
> index ce1b976b7da7..a27d7ca135af 100644
> --- a/xen/common/emul/vuart/Kconfig
> +++ b/xen/common/emul/vuart/Kconfig
> @@ -3,4 +3,23 @@ config VUART_FRAMEWORK
>
>  menu "UART Emulation"
>
> +config VUART_NS16X50
> +       bool "NS16550-compatible UART Emulator" if EXPERT
> +       depends on X86 && HVM

Currently VUART_NS16X50 depends on X86, so the code is only
usable on x86. Are there any plans to support this vUART on non-x86
architectures (e.g. ARM, where some UARTs are also ns16550-compatible)?

If not, wouldn=E2=80=99t it be more appropriate to move the ns16x50-specifi=
c
implementation into x86-specific directories instead of common?

> +       select VUART_FRAMEWORK
> +       default n
> +       help
> +         In-hypervisor NS16x50 UART emulation.
> +
> +         Only legacy PC COM2 port is emulated.
> +
> +         This is strictly for testing purposes (such as early HVM guest =
console),
> +         and not appropriate for use in production.
> +
> +config VUART_NS16X50_DEBUG
> +       bool "NS16550-compatible UART Emulator Debugging"
> +       depends on VUART_NS16X50 && DEBUG
> +       help
> +         Enable development debugging.
> +
>  endmenu
> diff --git a/xen/common/emul/vuart/Makefile b/xen/common/emul/vuart/Makef=
ile
> index 97f792dc6641..fe904f6cb65d 100644
> --- a/xen/common/emul/vuart/Makefile
> +++ b/xen/common/emul/vuart/Makefile
> @@ -1 +1,2 @@
>  obj-y +=3D vuart.o
> +obj-$(CONFIG_VUART_NS16X50) +=3D ns16x50.o
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16=
x50.c
> new file mode 100644
> index 000000000000..0462a961e785
> --- /dev/null
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -0,0 +1,366 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * NS16550-compatible UART Emulator.
> + *
> + * See:
> + * - Serial and UART Tutorial:
> + *     https://download.freebsd.org/doc/en/articles/serial-uart/serial-u=
art_en.pdf
> + * - UART w/ 16 byte FIFO:
> + *     https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
> + * - UART w/ 64 byte FIFO:
> + *     https://www.ti.com/lit/ds/symlink/tl16c750.pdf
> + *
> + * Limitations:
> + * - Only x86;
> + * - Only Xen console as a backend, no inter-domain communication (simil=
ar to
> + *   vpl011 on Arm);
> + * - Only 8n1 emulation (8-bit data, no parity, 1 stop bit);
> + * - No baud rate emulation (reports 115200 baud to the guest OS);
> + * - No FIFO-less mode emulation;
> + * - No RX FIFO interrupt moderation (FCR) emulation;
> + * - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
> + *   friends);
> + * - No ISA IRQ sharing allowed;
> + * - No MMIO-based UART emulation.
> + */
> +
> +#define pr_prefix               "ns16x50"
> +#define pr_fmt(fmt)             pr_prefix ": " fmt
> +
> +#ifdef CONFIG_VUART_NS16X50_DEBUG
> +#define guest_prefix            "FROM GUEST "
> +#define ns16x50_log_level       2
> +#else
> +#define guest_prefix            ""
> +#define ns16x50_log_level       0
> +#endif
> +
> +#include <xen/8250-uart.h>
> +#include <xen/console.h>
> +#include <xen/err.h>
> +#include <xen/iocap.h>
> +#include <xen/vuart.h>
> +#include <xen/xvmalloc.h>
> +
> +#include <public/io/console.h>
> +
> +#define ns16x50_log(n, lvl, vdev, fmt, args...) \
> +do { \
> +    if ( ns16x50_log_level >=3D n ) \
> +        gprintk(lvl, pr_fmt("%s: " fmt), (vdev)->name, ## args); \
> +} while (0)
> +
> +#define ns16x50_err(vdev, fmt, args...) \
> +    ns16x50_log(0, XENLOG_ERR, vdev, fmt, ## args)
> +#define ns16x50_warn(vdev, fmt, args...) \
> +    ns16x50_log(1, XENLOG_WARNING, vdev, fmt, ## args)
> +#define ns16x50_info(vdev, fmt, args...) \
> +    ns16x50_log(2, XENLOG_INFO, vdev, fmt, ## args)
> +#define ns16x50_debug(vdev, fmt, args...) \
> +    ns16x50_log(3, XENLOG_DEBUG, vdev, fmt, ## args)
> +
> +/*
> + * Number of supported registers in the UART.
> + */
> +#define NS16X50_REGS_NUM        (UART_SCR + 1)
> +
> +/*
> + * Number of emulated registers.
> + *
> + * - Emulated registers [0..NS16X50_REGS_NUM] are R/W registers for DLAB=
=3D0.
> + * - DLAB=3D1, R/W, DLL            =3D NS16X50_REGS_NUM + 0
> + * - DLAB=3D1, R/W, DLM            =3D NS16X50_REGS_NUM + 1
> + * -         R/O, IIR (IIR_THR)  =3D NS16X50_REGS_NUM + 2
> + */
> +#define NS16X50_EMU_REGS_NUM    (NS16X50_REGS_NUM + 3)
> +
> +/*
> + * Virtual ns16x50 device state.
> + */
> +struct vuart_ns16x50 {
> +    uint8_t regs[NS16X50_EMU_REGS_NUM]; /* Emulated registers */
> +    const struct vuart_info *info;      /* UART description */
> +    struct domain *owner;               /* Owner domain */
> +    const char *name;                   /* Device name */
> +    spinlock_t lock;                    /* Protection */
> +    struct xencons_interface cons;      /* Emulated RX/TX FIFOs */
> +};
> +
> +static uint8_t ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
> +{
> +    return 0;
> +}
> +
> +/*
> + * Emulate 8-bit write access to ns16x50 register.
> + */
> +static int ns16x50_io_write8(
> +    struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
> +{
> +    int rc =3D 0;
> +
> +    return rc;
> +}
> +
> +/*
> + * Emulate 16-bit write access to ns16x50 register.
> + * NB: some guest OSes use outw() to access UART_DLL.
> + */
> +static int ns16x50_io_write16(
> +    struct vuart_ns16x50 *vdev, uint32_t reg, uint16_t *data)
> +{
> +    int rc =3D -EINVAL;
> +
> +    return rc;
> +}
> +
> +/*
> + * Emulate write access to ns16x50 register.
> + */
> +static int ns16x50_io_write(
> +    struct vuart_ns16x50 *vdev, uint8_t reg, uint32_t size, uint32_t *da=
ta)
> +{
> +    int rc;
> +
> +    switch ( size )
> +    {
> +    case 1:
> +        rc =3D ns16x50_io_write8(vdev, reg, (uint8_t *)data);
> +        break;
> +
> +    case 2:
> +        rc =3D ns16x50_io_write16(vdev, reg, (uint16_t *)data);
> +        break;
> +
> +    default:
> +        rc =3D -EINVAL;
> +        break;
> +    }
> +
> +    return rc;
> +}
> +
> +/*
> + * Emulate 8-bit read access to ns16x50 register.
> + */
> +static int ns16x50_io_read8(
> +    struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
> +{
> +    uint8_t val =3D 0xff;
> +    int rc =3D 0;
> +
> +    *data =3D val;
> +
> +    return rc;
> +}
> +
> +/*
> + * Emulate 16-bit read access to ns16x50 register.
> + */
> +static int ns16x50_io_read16(
> +    struct vuart_ns16x50 *vdev, uint32_t reg, uint16_t *data)
> +{
> +    uint16_t val =3D 0xffff;
> +    int rc =3D -EINVAL;
> +
> +    *data =3D val;
> +
> +    return rc;
> +}
> +
> +/*
> + * Emulate read access to ns16x50 register.
> + */
> +static int ns16x50_io_read(
> +    struct vuart_ns16x50 *vdev, uint8_t reg, uint32_t size, uint32_t *da=
ta)
> +{
> +    int rc;
> +
> +    switch ( size )
> +    {
> +    case 1:
> +        rc =3D ns16x50_io_read8(vdev, reg, (uint8_t *)data);
> +        break;
> +
> +    case 2:
> +        rc =3D ns16x50_io_read16(vdev, reg, (uint16_t *)data);
> +        break;
> +
> +    default:
> +        *data =3D 0xffffffff;
> +        rc =3D -EINVAL;
> +        break;
> +    }
> +
> +    return rc;
> +}
> +
> +/*
> + * Emulate I/O access to ns16x50 register.
> + * Note, emulation always returns X86EMUL_OKAY, once I/O port trap is en=
abled.
> + */
> +static int cf_check ns16x50_io_handle(
> +    int dir, unsigned int addr, unsigned int size, uint32_t *data)
> +{
> +#define op(dir)     (((dir) =3D=3D IOREQ_WRITE) ? 'W' : 'R')
> +    struct domain *d =3D rcu_lock_current_domain();
> +    struct vuart *vuart =3D vuart_find_by_io_range(d, addr, size);
> +    struct vuart_ns16x50 *vdev;
> +    const struct domain *owner;
> +    const struct vuart_info *info;
> +    uint32_t reg;
> +    unsigned dlab;
> +    int rc;
> +
> +    if ( !vuart || !vuart->vdev )
> +    {
> +        printk(XENLOG_ERR "%c io 0x%04x %d: not initialized\n",
> +               op(dir), addr, size);
> +
> +        ASSERT_UNREACHABLE();
> +        goto out;
> +    }
> +    vdev =3D vuart->vdev;
> +
> +    owner =3D vuart->owner;
> +    ASSERT(owner);
> +    if ( d !=3D owner )
> +    {
> +        ns16x50_err(vdev, "%c io 0x%04x %d: does not match current domai=
n %pv\n",
> +                    op(dir), addr, size, d);
> +
> +        ASSERT_UNREACHABLE();
> +        goto out;
> +    }
> +
> +    info =3D vuart->info;
> +    ASSERT(info);
> +    reg =3D addr - info->base_addr;
> +    if ( !IS_ALIGNED(reg, size) )
> +    {
> +        ns16x50_err(vdev, "%c 0x%04x %d: unaligned access\n",
> +                    op(dir), addr, size);
> +        goto out;
> +    }
> +
> +    dlab =3D ns16x50_dlab_get(vdev);
> +    if ( reg >=3D NS16X50_REGS_NUM )
> +    {
> +        ns16x50_err(vdev, "%c io 0x%04x %d: DLAB=3D%d %02"PRIx32" 0x%08"=
PRIx32": not implemented\n",
> +                    op(dir), addr, size, dlab, reg, *data);
> +        goto out;
> +    }
> +
> +    spin_lock(&vdev->lock);
> +
> +    if ( dir =3D=3D IOREQ_WRITE )
> +    {
> +        ns16x50_debug(vdev, "%c 0x%04x %d: DLAB=3D%d %02"PRIx32" 0x%08"P=
RIx32"\n",
> +                      op(dir), addr, size, dlab, reg, *data);
> +        rc =3D ns16x50_io_write(vdev, reg, size, data);
> +    }
> +    else
> +    {
> +        rc =3D ns16x50_io_read(vdev, reg, size, data);
> +        ns16x50_debug(vdev, "%c 0x%04x %d: DLAB=3D%d %02"PRIx32" 0x%08"P=
RIx32"\n",
> +                      op(dir), addr, size, dlab, reg, *data);
> +    }
> +    if ( rc < 0 )
> +        ns16x50_err(vdev, "%c 0x%04x %d: DLAB=3D%d %02"PRIx32" 0x%08"PRI=
x32": unsupported access\n",
> +                    op(dir), addr, size, dlab, reg, *data);
> +
> +    spin_unlock(&vdev->lock);
> +
> +out:
> +    rcu_unlock_domain(d);
> +
> +    return X86EMUL_OKAY;
> +#undef op
> +}
> +
> +static int ns16x50_init(void *arg)
> +{
> +    struct vuart_ns16x50 *vdev =3D arg;
> +    const struct vuart_info *info =3D vdev->info;
> +    struct domain *d =3D vdev->owner;
> +
> +    ASSERT(vdev);
> +
> +    register_portio_handler(d, info->base_addr, info->size, ns16x50_io_h=
andle);
> +
> +    return 0;
> +}
> +
> +static void cf_check ns16x50_deinit(void *arg)
> +{
> +    struct vuart_ns16x50 *vdev =3D arg;
> +
> +    ASSERT(vdev);
> +}
> +
> +static void * cf_check ns16x50_alloc(struct domain *d, const struct vuar=
t_info *info)
> +{
> +    struct vuart_ns16x50 *vdev;
> +    int rc;
> +
> +    if ( !info )
> +        return ERR_PTR(-EINVAL);
> +
> +    if ( vuart_find_by_io_range(d, info->base_addr, info->size) )
> +    {
> +        ns16x50_err(info, "already registered\n");
> +        return ERR_PTR(-EBUSY);
> +    }
> +
> +    if ( !is_hvm_domain(d) )
> +    {
> +        ns16x50_err(info, "not an HVM domain\n");
> +        return ERR_PTR(-ENOSYS);
> +    }
> +
> +    vdev =3D xvzalloc(typeof(*vdev));
> +    if ( !vdev )
> +    {
> +        ns16x50_err(info, "failed to allocate memory\n");
> +        return ERR_PTR(-ENOMEM);
> +    }
> +
> +    spin_lock_init(&vdev->lock);
> +    vdev->name =3D info->name;
> +    vdev->owner =3D d;
> +    vdev->info =3D info;
> +
> +    rc =3D ns16x50_init(vdev);
> +    if ( rc )
> +        return ERR_PTR(rc);
> +
> +    return vdev;
> +}
> +
> +static void cf_check ns16x50_free(void *arg)
> +{
> +    if ( arg )
> +        ns16x50_deinit(arg);
> +
> +    xvfree(arg);
> +}
> +
> +#define ns16x50_emulator                \
> +{                                       \
> +    .compatible =3D "ns16550",            \
> +    .alloc      =3D ns16x50_alloc,        \
> +    .free       =3D ns16x50_free,         \
> +    .dump_state =3D NULL,                 \
> +    .put_rx     =3D NULL,                 \
> +}
> +
> +VUART_REGISTER(ns16x50, ns16x50_emulator);
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.51.0
>
>

Best regards,
Mykola

