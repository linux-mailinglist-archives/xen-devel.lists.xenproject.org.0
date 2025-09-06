Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5403B47725
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 22:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1113539.1461225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuzfN-0007vj-4a; Sat, 06 Sep 2025 20:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1113539.1461225; Sat, 06 Sep 2025 20:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuzfM-0007tt-TH; Sat, 06 Sep 2025 20:37:44 +0000
Received: by outflank-mailman (input) for mailman id 1113539;
 Sat, 06 Sep 2025 20:37:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bKTp=3R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uuzfL-0007tn-Kp
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 20:37:43 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55695828-8b61-11f0-9809-7dc792cee155;
 Sat, 06 Sep 2025 22:37:41 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-336cee72f40so28305561fa.2
 for <xen-devel@lists.xenproject.org>; Sat, 06 Sep 2025 13:37:41 -0700 (PDT)
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
X-Inumbo-ID: 55695828-8b61-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757191060; x=1757795860; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cl9wBI2qiAIO2fcJPMTYS8NlpunnhlluqBZRo3cmsXw=;
        b=DYGAus1GHRuJEj/XM8vVN7o+sKHOGQkAJ/BN2u4OgACvji/prI4QvSoqW4VwGLoOyt
         PC5OA2H1XvL3QeKQpGSd3HANQm6pimUfxE+rZyEYIH+hYJZ70is8thz7budh5EI8vXtf
         EHWzOMffCqBIQ/6qZaHwIHe2fKCQSzddi218VFI12cKC5GMJCitKL4L6aRzpWDQ4UFgX
         qR0ucR6qOPHJRIltmnd06dlmgGsjp2kKYLznIHq1HCH+Xss232umPgBdbjnbhCOr9KN5
         avFnPx60uSMG0wGlbYJ0EadhGss65ayKYYNDGrtLx0zs85IhnipjNH2ML8N0VhNimyrd
         Xz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757191060; x=1757795860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cl9wBI2qiAIO2fcJPMTYS8NlpunnhlluqBZRo3cmsXw=;
        b=M/w0LFjypv9/pTgoaajZLaspl8BTAsUTmuHNZMtgngIcbrVe/qFG25pxOsg4lrdS/k
         t0a9FQOGau2lWF6PaXzdAXGI/x745E4Q9sPcLUUgpQpy3Bkztaemz4yDl9/mxjZ40zTb
         6IBM73COOALOZJ/qiOV72pxR5cX8gjkXr9lEAjd6nps+BoRkwonCQZbRvDfzJujZhWxg
         081evtlASUcd75NQUUk4AF9bfjoh+Lq3ITgQWVn7nAuVhnjBcF27UAhH9F3nblXlMIEn
         ih6U2dQN5RQIhzkC5t3hPFyJkQ9kZAs04SU7d3qZ4qBHGnfsjylWMo7o/QFIoHSMWyRM
         PG1A==
X-Gm-Message-State: AOJu0YwirZGSmKWOJChs6VIxuOzb2MrZe4et1pkw9z4Raa7kori/1BEF
	cWwbWbPnseA6OjfLIl5PD/v16Ia2sn31S7lRwlvnwMAFlcsxILUIBwQY4IGbcvrEWn7TSG9OPdL
	eTlBFbI+/yMYBR7zs1YfQwyMoKxVfoBA=
X-Gm-Gg: ASbGnctTGYOan8hKZ3Qd8XFXkvNNOUHCAM9medx14ETDHVIF8+/k3XrGOfpFv6jqC7o
	jh1mKGXhrwAh4n7prYeRWSsyx6LfC7sicoJsSG6mQRfSYvpYqjV9IBTXhunDZSrMuoLTFx3ELJ6
	U8oBmMhEvzooKPimPUP2f4zc/l3smkfMYpmL7q85S1lX1SBqNTvqttgimNWh7wcFeqEA7M/Yc0o
	z6M10NkSn346sPG
X-Google-Smtp-Source: AGHT+IEIY+AvuQvPoLyvrchQFhBGu/c84ta+/bkHThsmV2FD7p7LawJ85ywsTp5Ooj8mEjm51eJPLU3hDHhBEORXlFY=
X-Received: by 2002:a2e:b8c4:0:b0:336:8c3d:fb0a with SMTP id
 38308e7fff4ca-33b5cccbf9fmr7823661fa.21.1757191060073; Sat, 06 Sep 2025
 13:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250905232715.440758-1-dmukhin@ford.com> <20250905232715.440758-4-dmukhin@ford.com>
In-Reply-To: <20250905232715.440758-4-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Sat, 6 Sep 2025 23:37:28 +0300
X-Gm-Features: Ac12FXw3bETyQXRwYP9XXoROfQO_ek4xeb76iacmdeHoMDsVYkGPDklAS4oYJTM
Message-ID: <CAGeoDV87whMh9G88NNYd9UYBBurgohFJHY6qiSArOFEW034x9A@mail.gmail.com>
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

I noticed that this include ...

> +#include <xen/vuart.h>

... is out of alphabetical order. All other includes in this block
are correctly sorted.

>  #include <xen/vpci.h>
>  #include <xen/wait.h>
>  #include <xen/warning.h>
> @@ -689,6 +690,22 @@ int hvm_domain_initialise(struct domain *d,
>      if ( rc !=3D 0 )
>          goto fail1;
>
> +    /* Limit NS16550 emulator for dom0 only for now. */
> +    if ( IS_ENABLED(CONFIG_VUART_NS16X50) && is_hardware_domain(d) )

Currently, the Xen glossary defines a "hardware domain" as:

    A domain, commonly dom0, which shares responsibility with Xen
    about the system as a whole.

It has been historically correct to treat is_hardware_domain(d) as
equivalent to dom0. However, according to patch series [1], this is
no longer guaranteed:

    "Setting hardware domain as domid 0 is removed."

After these changes, the assumption that hardware domain always equals
dom0 may not hold. As a result, the above comment in the code could
become misleading. Consider updating it to something like:

    /* Limit NS16550 emulator to the hardware domain only for now */

to reflect the new semantics.

> +    {
> +        struct vuart_info info =3D {
> +            .name       =3D "COM2",
> +            .compatible =3D "ns16550",
> +            .base_addr  =3D 0x2f8,
> +            .size       =3D 8,
> +            .irq        =3D 3,
> +        };

Consider defining COM2 base address and IRQ in a shared header
(e.g., VUART_COM2_BASE and VUART_COM2_IRQ) rather than using
the magic numbers 0x2f8 and 3 here. This would allow reuse in
`__start_xen` and other places, and makes the code clearer and
easier to maintain.

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

Instead of hardcoding 0xff here, consider using UINT8_MAX. This makes
it clear that the value is the maximum for uint8_t and avoids magic
numbers.

Similarly, in other places where constants for 16-bit or 32-bit
unsigned integers are used, it would be good to replace them with
UINT16_MAX and UINT32_MAX respectively for consistency and clarity.

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

Instead of defining the op(dir) macro, it might be cleaner to compute
the direction character once at the beginning, e.g.:

    const char dir_char =3D (dir =3D=3D IOREQ_WRITE) ? 'W' : 'R';

and then use dir_char in printk()/debug. This avoids the local macro
and makes the code easier to follow.

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

AFAICT ns16x50_io_read() and ns16x50_io_write() have identical
signatures. Would it be cleaner to store them in an array of
function pointers and call through that, e.g.:

    rc =3D ns16x50_io_op[dir =3D=3D IOREQ_WRITE](vdev, reg, size, data);

This would avoid the if/else block here.

> +    }
> +    else
> +    {
> +        rc =3D ns16x50_io_read(vdev, reg, size, data);
> +        ns16x50_debug(vdev, "%c 0x%04x %d: DLAB=3D%d %02"PRIx32" 0x%08"P=
RIx32"\n",
> +                      op(dir), addr, size, dlab, reg, *data);

The ns16x50_debug() call is duplicated in both branches of the
IOREQ_WRITE check, differing only in whether it's placed before or
after the access. Would it make sense to move this debug print
outside the condition, so the same code is used for both read and
write paths (assuming the "data"  is not modified during a write)?

> +    }
> +    if ( rc < 0 )
> +        ns16x50_err(vdev, "%c 0x%04x %d: DLAB=3D%d %02"PRIx32" 0x%08"PRI=
x32": unsupported access\n",
> +                    op(dir), addr, size, dlab, reg, *data);

The ns16x50_err() call doesn=E2=80=99t require holding vdev->lock, so it wo=
uld
be cleaner to move it after spin_unlock(). That way the critical section
is shorter.

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

Currently, ns16x50_alloc() first calls vuart_find_by_io_range() and
only afterwards checks if the domain is an HVM domain. Wouldn=E2=80=99t it
be more logical to perform the HVM check first? If the console is
only available for HVM domains, the extra check for an uninitialized
vuart field seems unnecessary.

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

If ns16x50_init(vdev) fails, vdev should be freed with xvfree() to
avoid a memory leak.

Currently, ns16x50_init() always returns 0. If it is not planned to
return other values in the future, it may be simpler to make the
function return void, avoiding the need for the rc variable and
conditional checks.

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

dump_state is set to NULL, but vuart_dump_state() in the previous
commit does not check this pointer. If all commits up to this one
are applied and domain state is dumped, this could result in a
NULL pointer dereference and crash the hypervisor.

Consider adding a NULL check in vuart_dump_state() or initializing
dump_state properly.

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

[1] https://patchew.org/Xen/20250416212911.410946-1-jason.andryuk@amd.com/

Best regards,
Mykola

