Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBBBB57607
	for <lists+xen-devel@lfdr.de>; Mon, 15 Sep 2025 12:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124241.1466692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uy6GJ-0007Uw-8T; Mon, 15 Sep 2025 10:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124241.1466692; Mon, 15 Sep 2025 10:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uy6GJ-0007T4-2J; Mon, 15 Sep 2025 10:16:43 +0000
Received: by outflank-mailman (input) for mailman id 1124241;
 Mon, 15 Sep 2025 10:16:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yszo=32=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uy6GH-0007Sy-C4
 for xen-devel@lists.xenproject.org; Mon, 15 Sep 2025 10:16:41 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11280a00-921d-11f0-9809-7dc792cee155;
 Mon, 15 Sep 2025 12:16:38 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-55f6f7edf45so3377022e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Sep 2025 03:16:38 -0700 (PDT)
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
X-Inumbo-ID: 11280a00-921d-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757931398; x=1758536198; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfSQ08K3XOa0Gk0W4iMaukyj7ws9EKPpQm4NjG3hS9E=;
        b=cN0zpvYu+B/B3BAvyA9Vnx9DGMsiSYiIY0d399r7anJ7DzZID0URPG4+L7SPg7CW9x
         iuq7N4/bR81QkTh2n36qTVSXnlU/3p1/igXB3fPWABQfw48Mb3rBDMlTEKajcRS4ClVM
         BtLlhOX2AcFaVP20JJ9S8bZ+LVWbzzb88O3iyR2wtKqqN7y97xryj7Fim5wFqXCKTZRX
         s/LllGkQ3RtE20hP7/q9n1cZkvsWRjlqSeFs39t6iFyChgEl106vbtBkqe2u+WVi0T/y
         CVwBwKusLkgbfqOWzCbJvB6eUhv3gvwnDHzLYSC3G35NGoxl0zd9j7EnGYrTaqmHiaGt
         9mlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757931398; x=1758536198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfSQ08K3XOa0Gk0W4iMaukyj7ws9EKPpQm4NjG3hS9E=;
        b=xKcYAEItRlkVn0F0RnvwI216sxRIlbdtNlm1/jhz3Qv24wWyk7UrDwSlUrepjOY+1c
         KQysq1CDpMeWjEvXJu9SaecvsLNzXUCeO0n5aWMd4oeJkeBvzuxDGTKpcR5yEcoocXjJ
         +IZnEZrFB/aAa30WGeF9tMgkdlqFr8OpXIGXmZRMGl9EKMQkh7u/jDI5Z+iCrYrsjDOh
         /ZDSarmv6lABQDKroq9Py1eFvYoAUu+9tnt8HLPWQnRWRzil3uVLG0OT0zJ/p8ipGtVf
         pSJfiVqjJehHU03/eMSIiTMh9cVcm1d3yv8vvpMrNsd641WnbjpgYut4AkAE5SicmSzW
         tQIw==
X-Gm-Message-State: AOJu0YyK3lHi96prSAXRfX6py+AhDr+972d1iqBwvWiVyWKLvCxDHy0u
	IcWR1yQf+MF1H7UEByZmUQJstf9IYyXx3Ld2YE+LOdxE03GqP3smmmxDB06rFH+mWD3ecl4sEJX
	CiTcGJeAhd4SQqEAIHFkiCI09eTNpWds=
X-Gm-Gg: ASbGnct/FkMRs1DJYyaHuPzfrC4yAIQoZA2akOzFAuLXRcsUCZ+dSav/cjkm5NkEbCp
	aAr0OAhyizfro8qZbspFk8BVNIiOZLkI5QsaSKlPregUH2i78YVQE+SrwDanjoZ2fVgRROjcSiC
	sfpDh5TYbpqhx+PeDtKAxRPcPrR3CZGhL2msWQI883lJmv06vfq0Uy7yuoB+1XGLwHZTKb9pwjB
	+4jM/0dl7dCKogw
X-Google-Smtp-Source: AGHT+IEFi031BIyFOxOVWr+ebes9hjd2LcLzMRuUUWBi5aUK/feoUjP6aThJcu+jsuRrfoLnnq2OtNKMcD6m77PodJA=
X-Received: by 2002:a05:6512:6715:b0:55f:503c:d322 with SMTP id
 2adb3069b0e04-570508278e0mr2454672e87.40.1757931397988; Mon, 15 Sep 2025
 03:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250908211149.279143-1-dmukhin@ford.com> <20250908211149.279143-4-dmukhin@ford.com>
In-Reply-To: <20250908211149.279143-4-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 15 Sep 2025 13:16:26 +0300
X-Gm-Features: Ac12FXxwZR-KqMMKFrE7VEzx1JMmHgDw0QtOhDWhoX96q46uW1kcHVMxoIltsWk
Message-ID: <CAGeoDV_dKAvQy0j_jCune660ByqV368-O5anFjLjer0MAVx+Bg@mail.gmail.com>
Subject: Re: [PATCH v7 03/16] emul/ns16x50: implement emulator stub
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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
> +
> +#ifdef CONFIG_VUART_NS16X50
> +static int __read_mostly opt_vuart_id;
> +static int __init cf_check parse_vuart_param(const char *s)
> +{
> +    if ( !isdigit(*s) )
> +        return -EINVAL;
> +
> +    opt_vuart_domid =3D simple_strtoul(s, &s, 0);
> +
> +    if ( *s !=3D ':' )
> +        return 0;
> +
> +    if ( strncmp(s, "com", 3) )
> +        return -EINVAL;
> +
> +    opt_vuart_id =3D *(s + 3) - '1';
> +    if ( opt_vuart_id < 0 || opt_vuart_id > 3 )
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
> +
> +    if ( i !=3D ARRAY_SIZE(pc_uarts) )
> +        return &pc_uarts[i];
> +
> +    return NULL;
> +#undef PC_UART
> +}
> +#else
> +static const struct vuart_info *get_vuart_info(struct domain *d)
> +{
> +    return NULL;
> +}
> +#endif /* CONFIG_VUART_NS16X50 */
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

I think it would be better to add an init procedure for the registers.
At least not all bits in all registers should be initialized to zero.
Or will this be handled in some way during I/O reads?

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

