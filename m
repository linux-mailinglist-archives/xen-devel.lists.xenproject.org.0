Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E218CB5136F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 12:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118078.1463987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwHhj-00023Y-UW; Wed, 10 Sep 2025 10:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118078.1463987; Wed, 10 Sep 2025 10:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwHhj-00021I-Rj; Wed, 10 Sep 2025 10:05:31 +0000
Received: by outflank-mailman (input) for mailman id 1118078;
 Wed, 10 Sep 2025 10:05:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwrE=3V=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uwHhi-00021C-Sy
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 10:05:31 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abe197ae-8e2d-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 12:05:25 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-336b071e806so57123071fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 03:05:25 -0700 (PDT)
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
X-Inumbo-ID: abe197ae-8e2d-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757498725; x=1758103525; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ae6yELyAiaiQcy/M4n7BOZ1Mq2mK/qjGs5PtjknVF0=;
        b=LrfDICzuAp8x77l75Z9yR4DJ14ZtrMSYV7nHUabreFbHY/rLmtyki4mRutld07agnc
         Oj2FrUS96Kx43zOcU/pLoAMzYvGnoGwoJG9QW7vtnXdd45Rtpko8n62A8w606G/c/C6U
         dinDiOxwHVjp60BRjOYnwdaQMvZoQTvyZwjfzL5eTWrI1cR8EyqAM5W1K5dGitkQhtLW
         js81/W5hgjQoxDi8CVwJLeXc/LsALhUnAzGTnQ3YCMIfk6BlW6wib25KAXTquRE7eJbn
         10V0oIZ9VZ2/0rCaPJ1R7ERSjHwzZdXLlIAn21ThJS1IE+Goo/t5wa0ekoXxu9SMQHCd
         TX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757498725; x=1758103525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Ae6yELyAiaiQcy/M4n7BOZ1Mq2mK/qjGs5PtjknVF0=;
        b=cH9gEhp6vnPPrUEnmfN985fnZfLTiSv5irsdI/UUAJWcOAZMknRZhfCM/tniUaQZgV
         0l9Dd6xd4SoVzQIpMzfSJ4ZzlpYlL9F153Fmcn6PqOuQ8+/Wzwr4+/r22VO5OzOWVGm3
         PY4DaJ6GAMwEnIkyUJ88fu36wbJdCyU/qg2ZlyvJ+6AbXnXWfV0EWWEYEaPaeDuhbq9s
         IHtH2VzHV2OiXSahC5dImIbZuPMfqvIEpjZyFtHfJxzUgJ76C+e5abQSVgucQn/3TCEk
         kAVO9jyrbuk7s5CH5zFCdagovZDibN0yuqIzm5QVDp5NWkhrT3JxLSEJS2VM9eS2AHuA
         fxlg==
X-Gm-Message-State: AOJu0Yx2IwEekJ4ft+lSZtFTl/WEaDwioEhbNIM1bkvQ1B0tJn8zzBQi
	SyJa5uVokmCUY5ydSIY8diAW2aT3QS1MxW5x1aygordzotPTAwWZUU7nnlOVEACIpRuvtmkdtgc
	+2r7H/hBWD8DJY+YcU4l0bFgKrNV4f1I=
X-Gm-Gg: ASbGnctHqFLzbyK8y0wgQ8TiYCdH32R4nCrZWagbJ7Bd8EmA9KhgcX6rDFgioReYVlF
	U1O+1SJZnxX/fUF6T9RvityWD8Ucfqgf5Wm5jL75yK0okHGSK4HOV+2KlDpmgfDJ22DxtG6/7Ew
	hdTgkm4WHCZ1bykdqnxGSf7BU3GvjeHdOu7yyl+mNLfm27nsXsvoLqDXZQJyLFoikl1lvfXeTD4
	4Pr9ZWxFTwXCrH38uaa7d4bu4I=
X-Google-Smtp-Source: AGHT+IF+PVptV4kBNDGaVLqK8cp5UnyvwUFFM7IS6KoakIz1n9tqNEFmpPoteUMhpasyyh01gwwCKPPl3PIv5wozMqI=
X-Received: by 2002:a2e:a607:0:b0:332:5fc0:24ae with SMTP id
 38308e7fff4ca-33b5108cecbmr27131931fa.15.1757498724677; Wed, 10 Sep 2025
 03:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250908211149.279143-1-dmukhin@ford.com> <20250908211149.279143-4-dmukhin@ford.com>
In-Reply-To: <20250908211149.279143-4-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 10 Sep 2025 13:05:13 +0300
X-Gm-Features: Ac12FXyjZQaI2TOE5OvdS1c8GkFIZIfdTOIu9-0_REswpiAgbe-uP1oGUkguObA
Message-ID: <CAGeoDV_-AOeN=_kNK8wo-X8ZBq8DTxwGoi=wBd1ScN9j0XohmA@mail.gmail.com>
Subject: Re: [PATCH v7 03/16] emul/ns16x50: implement emulator stub
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

I appreciate you addressing the comments from the earlier version
of the patch series.

On Tue, Sep 9, 2025 at 12:12=E2=80=AFAM <dmukhin@xen.org> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> The change is the first on the way on introducing minimally functional
> NS16550-compatible UART emulator.
>
> Only one domain, defined via 'vuart=3D' parameter, will have UART emulato=
r
> initially. The command line option is not documented yet because of the p=
lan
> to adjust this code for vUART configuration via xl.

Since the command line option is not yet documented, it would be
helpful to include the expected format of the 'vuart=3D' parameter in
the commit message. This will make it easier for reviewers and future
readers to understand how to use the option.

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
> Changes since v6:
> - feedback from Mykola
> - added temporary 'vuart=3D' run-time option to enable emulator for certa=
in
>   domain for ease of testing
> ---
>  xen/arch/x86/hvm/hvm.c          |  75 +++++++
>  xen/common/emul/vuart/Makefile  |   1 +
>  xen/common/emul/vuart/ns16x50.c | 364 ++++++++++++++++++++++++++++++++
>  3 files changed, 440 insertions(+)
>  create mode 100644 xen/common/emul/vuart/ns16x50.c
>
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 23bd7f078a1d..363c010f8dcc 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -29,6 +29,7 @@
>  #include <xen/trace.h>
>  #include <xen/vm_event.h>
>  #include <xen/vpci.h>
> +#include <xen/vuart.h>
>  #include <xen/wait.h>
>  #include <xen/warning.h>
>
> @@ -107,6 +108,67 @@ static const char __initconst warning_hvm_fep[] =3D
>  static bool __initdata opt_altp2m_enabled;
>  boolean_param("altp2m", opt_altp2m_enabled);
>
> +/* Enable NS16550 emulator for certain domain only. */
> +static int __read_mostly opt_vuart_domid =3D -1;

Should opt_vuart_domid be initialized to DOMID_INVALID instead of -1?
Using the standard DOMID_INVALID constant would make the intent clearer
and avoid potential confusion with valid domain IDs.
---
Should the variable type be domid_t or at least unsigned?

> +
> +#ifdef CONFIG_VUART_NS16X50
> +static int __read_mostly opt_vuart_id;
> +static int __init cf_check parse_vuart_param(const char *s)
> +{
> +    if ( !isdigit(*s) )
> +        return -EINVAL;
> +
> +    opt_vuart_domid =3D simple_strtoul(s, &s, 0);

Should we check the resulting value against DOMID_MASK to ensure it
is a valid domain ID?

> +
> +    if ( *s !=3D ':' )
> +        return 0;

It seems that if the COM ID is not provided on the command line, the
default value will come from the static variable, which is 0 (treated
as COM1). Is this intended behavior?

If this is by design, it would be helpful to add a comment explaining
why we allow a valid domain ID with a default COM ID. Otherwise, maybe
opt_vuart_id should be set to an invalid value or opt_vuart_domid
reset here to avoid ambiguity.

> +
> +    if ( strncmp(s, "com", 3) )
> +        return -EINVAL;
> +
> +    opt_vuart_id =3D *(s + 3) - '1';
> +    if ( opt_vuart_id < 0 || opt_vuart_id > 3 )

Would it be better to define the pc_uarts array outside the function
and then use ARRAY_SIZE(pc_uarts) here for the bounds check? This
would make the code more maintainable in case the number of UARTs
changes in the future.
---
Do we really need the search function below at all? Instead of
storing an opt_vuart_id, we could store a pointer to the chosen
vUART directly here and eliminate the search, simplifying the code.

> +        return -EINVAL;
> +
> +    return 0;
> +}
> +custom_param("vuart", parse_vuart_param);
> +
> +static const struct vuart_info *get_vuart_info(struct domain *d)
> +{
> +#define PC_UART(n,p,i) { \
> +    .name =3D n, \
> +    .compatible =3D "ns16550", \
> +    .base_addr =3D p, \
> +    .size =3D 8, \
> +    .irq =3D i, \
> +}
> +    static const struct vuart_info pc_uarts[4] =3D
> +    {
> +        PC_UART("com1", 0x3f8, 4),
> +        PC_UART("com2", 0x2f8, 3),
> +        PC_UART("com3", 0x3fe, 4),
> +        PC_UART("com4", 0x2fe, 3),
> +    };
> +    unsigned i;
> +
> +    for ( i =3D 0; i < ARRAY_SIZE(pc_uarts); i++ )
> +        if ( i =3D=3D opt_vuart_id )
> +            break;

Instead of breaking from the loop, why not return the pointer directly
when a match is found? For example:

for ( i =3D 0; i < ARRAY_SIZE(pc_uarts); i++ )
    if ( i =3D=3D opt_vuart_id )
        return &pc_uarts[i];

return NULL;

This eliminates the need for a separate break and makes the code
clearer.
---

Actually, we can simplify this further: since the array is indexed by
opt_vuart_id, we can directly check the bounds and return the entry:

if ( opt_vuart_id > -1 && opt_vuart_id < ARRAY_SIZE(pc_uarts) )
    return &pc_uarts[opt_vuart_id];

return NULL;

If opt_vuart_id were defined as unsigned, the lower-bound check could be
dropped entirely, leaving only the upper-bound check, which would make
the code even cleaner.

> +
> +    if ( i !=3D ARRAY_SIZE(pc_uarts) )
> +        return &pc_uarts[i];
> +
> +    return NULL;
> +#undef PC_UART
> +}
> +#else
> +static const struct vuart_info *get_vuart_info(struct domain *d)

inline ?

> +{
> +    return NULL;
> +}
> +#endif /* CONFIG_VUART_NS16X50 */

Should all of the code above be made common? If in the future other
architectures also use this vUART mechanism, it would be better to
make it generic from the start. In that case, vuart_info would
probably need a "compatible" property to support different hardware
types.

Then the search procedure through the vuart array would make
much more sense.

> +
>  static int cf_check cpu_callback(
>      struct notifier_block *nfb, unsigned long action, void *hcpu)
>  {
> @@ -689,6 +751,15 @@ int hvm_domain_initialise(struct domain *d,
>      if ( rc !=3D 0 )
>          goto fail1;
>
> +    if ( IS_ENABLED(CONFIG_VUART_NS16X50) && d->domain_id =3D=3D opt_vua=
rt_domid )
> +    {
> +        const struct vuart_info *info =3D get_vuart_info(d);
> +
> +        rc =3D vuart_init(d, info);
> +        if ( rc )
> +            goto out_vioapic_deinit;
> +    }
> +
>      stdvga_init(d);
>
>      rtc_init(d);
> @@ -712,6 +783,8 @@ int hvm_domain_initialise(struct domain *d,
>      return 0;
>
>   fail2:
> +    vuart_deinit(d);
> + out_vioapic_deinit:
>      vioapic_deinit(d);
>   fail1:
>      if ( is_hardware_domain(d) )
> @@ -774,6 +847,8 @@ void hvm_domain_destroy(struct domain *d)
>      if ( hvm_funcs.domain_destroy )
>          alternative_vcall(hvm_funcs.domain_destroy, d);
>
> +    vuart_deinit(d);
> +
>      vioapic_deinit(d);
>
>      XFREE(d->arch.hvm.pl_time);
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
> index 000000000000..a3bdf9f415ca
> --- /dev/null
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -0,0 +1,364 @@
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
> + * - DLAB=3D1, R/W, DLL         =3D (NS16X50_REGS_NUM + 0)
> + * - DLAB=3D1, R/W, DLM         =3D (NS16X50_REGS_NUM + 1)
> + */
> +#define NS16X50_EMU_REGS_NUM    (NS16X50_REGS_NUM + 2)
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
> +    uint8_t val =3D UINT8_MAX;
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
> +    uint16_t val =3D UINT16_MAX;
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
> +        *data =3D UINT32_MAX;
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
> +    const char op =3D (dir =3D=3D IOREQ_WRITE) ? 'W' : 'R';
> +    struct domain *d =3D rcu_lock_current_domain();
> +    struct vuart *vuart =3D vuart_find_by_io_range(d, addr, size);
> +    struct vuart_ns16x50 *vdev;
> +    const struct domain *owner;
> +    const struct vuart_info *info;
> +    uint32_t reg;
> +    unsigned dlab;
> +    int rc;
> +
> +    if ( !vuart )
> +    {
> +        printk(XENLOG_ERR "%c io 0x%04x %d: not initialized\n",
> +               op, addr, size);
> +
> +        ASSERT_UNREACHABLE();
> +        goto out;
> +    }
> +
> +    vdev =3D vuart->vdev;
> +    ASSERT(vdev);
> +
> +    owner =3D vuart->owner;
> +    ASSERT(owner);
> +
> +    if ( d !=3D owner )
> +    {
> +        ns16x50_err(vdev, "%c io 0x%04x %d: does not match current domai=
n %pv\n",
> +                    op, addr, size, d);
> +
> +        ASSERT_UNREACHABLE();
> +        goto out;
> +    }
> +
> +    info =3D vuart->info;
> +    ASSERT(info);
> +
> +    reg =3D addr - info->base_addr;
> +    if ( !IS_ALIGNED(reg, size) )
> +    {
> +        ns16x50_err(vdev, "%c 0x%04x %d: unaligned access\n",
> +                    op, addr, size);
> +        goto out;
> +    }
> +
> +    dlab =3D ns16x50_dlab_get(vdev);
> +    if ( reg >=3D NS16X50_REGS_NUM )
> +    {
> +        ns16x50_err(vdev, "%c io 0x%04x %d: DLAB=3D%d %02"PRIx32" 0x%08"=
PRIx32": not implemented\n",
> +                    op, addr, size, dlab, reg, *data);
> +        goto out;
> +    }
> +
> +    spin_lock(&vdev->lock);
> +
> +    if ( dir =3D=3D IOREQ_WRITE )
> +        rc =3D ns16x50_io_write(vdev, reg, size, data);
> +    else
> +        rc =3D ns16x50_io_read(vdev, reg, size, data);
> +
> +    spin_unlock(&vdev->lock);
> +
> +    if ( rc =3D=3D 0 )
> +        ns16x50_debug(vdev, "%c 0x%04x %d: DLAB=3D%d %02"PRIx32" 0x%08"P=
RIx32"\n",
> +                      op, addr, size, dlab, reg, *data);
> +    else
> +        ns16x50_err(vdev, "%c 0x%04x %d: DLAB=3D%d %02"PRIx32" 0x%08"PRI=
x32": unsupported access\n",
> +                    op, addr, size, dlab, reg, *data);
> +
> +out:
> +    rcu_unlock_domain(d);
> +
> +    return X86EMUL_OKAY;
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
> +    if ( !is_hvm_domain(d) )
> +    {
> +        ns16x50_err(info, "not an HVM domain\n");
> +        return ERR_PTR(-ENOSYS);
> +    }
> +
> +    if ( vuart_find_by_io_range(d, info->base_addr, info->size) )
> +    {
> +        ns16x50_err(info, "already registered\n");
> +        return ERR_PTR(-EBUSY);
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
> +    {
> +        xvfree(vdev);
> +        return ERR_PTR(rc);
> +    }
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

