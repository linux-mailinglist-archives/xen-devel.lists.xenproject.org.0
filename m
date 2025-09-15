Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10969B56FF7
	for <lists+xen-devel@lfdr.de>; Mon, 15 Sep 2025 08:00:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124149.1466653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uy2GD-00014X-1g; Mon, 15 Sep 2025 06:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124149.1466653; Mon, 15 Sep 2025 06:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uy2GC-00011e-Uk; Mon, 15 Sep 2025 06:00:20 +0000
Received: by outflank-mailman (input) for mailman id 1124149;
 Mon, 15 Sep 2025 06:00:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yszo=32=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uy2G9-00011Y-7f
 for xen-devel@lists.xenproject.org; Mon, 15 Sep 2025 06:00:17 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f898d39-91f9-11f0-9809-7dc792cee155;
 Mon, 15 Sep 2025 08:00:14 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-353dece5805so12085271fa.1
 for <xen-devel@lists.xenproject.org>; Sun, 14 Sep 2025 23:00:14 -0700 (PDT)
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
X-Inumbo-ID: 3f898d39-91f9-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757916014; x=1758520814; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fG37zlIx/BLttU26MS4fnoiz9Oe/mvO+lojMmBf3toE=;
        b=E/BZ8ZyZZ/YvaTMV7RLjwKHaYkv2Bra8EwZ8LAcIhrszgjIrIhzN4oStAkZUI0itWe
         rFBa2A8iBKjXZOaqetNfAPfgt5+hoFQOUL7xr6jIzqNiyqJ/htzKh3xt4ZIlJ3OvYTpz
         RO0SvYGaurjIKuWwtixaOHeWvDBaBzVuCGrXNmbChaODYoSi3rvRMWnfiTnaBxAYMNLI
         HN4nW6ilCc8kTOQdaCo7u8mca1W9lcnzQN7cbq946RRLAsWcrlFh87IB7hsu7+CwiSv0
         gtZtBcP9+bWVT44pO2Dbx2ae4p2rrG1FBRW7iF5xKYu3dsl7nyvh1iZo0btxWhwq1V/d
         73Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757916014; x=1758520814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fG37zlIx/BLttU26MS4fnoiz9Oe/mvO+lojMmBf3toE=;
        b=kVvEFhT0SHVChljozlVv2tlFqRCGGg6YmdkxcLLD/i+AQTuj+MDivs5tEt1ntRDrVc
         7KLO48CFRObRJm1o3t5VoCoJTMaK8kkNWXnT+ZJk4907tTXbWkQSRzdtn7xMFboI1Axc
         CT1Q3MGUgK6BKfUM5MNSNvX+ten12A8W2TajCXW9aCBLSF/TNZUdkQwqwS+xaDcORmxI
         YHhiO2VAXPbVmVd4xd0V2bK85yJeKwaO55dco6gGt6YZbGnioSOf9Btk9dEK6f9oj869
         uE/jCOGAd95p6tq95TpH21nr58WgKogEbDs4v7uhO3a4DPQd2+Ac1BUok8OCbgqcMjsr
         d32Q==
X-Gm-Message-State: AOJu0YwJZGco8SzK3l+ZiFFGew70CJJDfnlBLZQANufo0UVIhRP7/IU7
	B30GH9wD6DQ17onicvncxdWu2gGrCDwZEovDq58IO5kFoJWxCdiOk48t4IvxyOgnbSTNSW8YRS6
	oMXRytu6VPfE9+wxJcoQRkj3uMpyviv8=
X-Gm-Gg: ASbGncsFUagokelUIh+afQ7IbX2hbBxg3E5M9xQXKyS/VI8twZarh1GtcepjpSK8Lvz
	v6KlId9e8hBjtYO1dKlW7SYo2IemLe7Le3EinKJHNphzvDQ5+OsG/nC0fI4251vIP/ic3RFsJsP
	WkE/i0myEM2R3ds72E2HtXXpdfeB1UqjZheeWBN+8oFlMlIUcu4VKjy3aO4UAnw5wkfkDktQVy9
	lwMZg==
X-Google-Smtp-Source: AGHT+IFZte8KAPDPT0BJ1lP0XzI8I4zyUquj7Ss5QmG+1e4Lhf8qe2SP7bKcWMXixTidK5soGrS7Hq45RpBBVljxpQ0=
X-Received: by 2002:a05:651c:4413:10b0:336:e1d6:8903 with SMTP id
 38308e7fff4ca-351405de0b5mr23849821fa.30.1757916013740; Sun, 14 Sep 2025
 23:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250908211149.279143-1-dmukhin@ford.com> <20250908211149.279143-7-dmukhin@ford.com>
In-Reply-To: <20250908211149.279143-7-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 15 Sep 2025 09:00:00 +0300
X-Gm-Features: Ac12FXxpmNGi55GJZkqoi-asB_g1oeBQgmf4p2JfXGVuerx-7iftT8HgEVwUQ7k
Message-ID: <CAGeoDV-9jsk70C_UbYy-fsQ=4TG0vgGvjKjK-c2FNx4OHH1O5g@mail.gmail.com>
Subject: Re: [PATCH v7 06/16] emul/ns16x50: implement IER/IIR registers
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Thank you for the patch.

On Tue, Sep 9, 2025 at 12:12=E2=80=AFAM <dmukhin@xen.org> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Add interrupt enable register emulation (IER) and interrupt identity reas=
on
> (IIR) register emulation to the I/O port handler.
>
> Also add routines for asserting/deasserting the virtual ns16x50 interrupt
> line as a dependent on IIR code. vPIC case is implemented (HVM), vIOAPIC
> case is stubbed out (for follow on PVH).
>
> Poke ns16x50_irq_check() on every I/O register access because the emulato=
r
> does not have clock emulation anyway (e.g. for baud rate emulation)>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v6:
> - removed asserts for !has_vpic() paths
> ---
>  xen/common/emul/vuart/ns16x50.c | 138 ++++++++++++++++++++++++++++++++
>  1 file changed, 138 insertions(+)
>
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16=
x50.c
> index 5643ef4cc01e..664d799ddaee 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -90,6 +90,124 @@ static uint8_t ns16x50_dlab_get(const struct vuart_ns=
16x50 *vdev)
>      return 0;
>  }
>
> +static bool cf_check ns16x50_iir_check_lsi(const struct vuart_ns16x50 *v=
dev)
> +{
> +    return false;
> +}
> +
> +static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *v=
dev)
> +{
> +    return false;
> +}
> +
> +static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *v=
dev)
> +{
> +    return false;
> +}
> +
> +static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *v=
dev)
> +{
> +    return false;
> +}
> +
> +/*
> + * Get the interrupt identity reason.
> + *
> + * IIR is re-calculated once called, because ns16x50 always reports high
> + * priority events first.
> + */
> +static uint8_t ns16x50_iir_get(const struct vuart_ns16x50 *vdev)
> +{
> +    /*
> +     * Interrupt identity reasons by priority.
> +     * NB: high priority are at lower indexes below.
> +     */
> +    static const struct {
> +        bool (*check)(const struct vuart_ns16x50 *vdev);
> +        uint8_t ier;
> +        uint8_t iir;
> +    } iir_by_prio[] =3D {
> +        [0] =3D { ns16x50_iir_check_lsi, UART_IER_ELSI,   UART_IIR_LSI }=
,
> +        [1] =3D { ns16x50_iir_check_rda, UART_IER_ERDAI,  UART_IIR_RDA }=
,
> +        [2] =3D { ns16x50_iir_check_thr, UART_IER_ETHREI, UART_IIR_THR }=
,

According to the spec (PC16550D and others also state this), if the
source of the IRQ is Transmitter Holding Register Empty, then reading
from IIR clears this interrupt.

So, I think it is not safe to call ns16x50_irq_check for every I/O.
According to the documentation, reset conditions for interrupts are:

    Reads:
        UART_RBR
        UART_IIR (only for the above case)
        UART_LSR
        UART_MSR

    Writes:
        UART_THR
        UART_IER

Of course, it is also necessary to think about how to handle the setting
of bits in IIR properly.

> +        [3] =3D { ns16x50_iir_check_msi, UART_IER_EMSI,   UART_IIR_MSI }=
,

Are you going to implement support for the Timeout Interrupt bit in
FIFO mode (PC16550D)?

    Bit 3: In the 16450 Mode this bit is 0. In the FIFO mode this
    bit is set along with bit 2 when a timeout interrupt is pending.
?

> +    };
> +    const uint8_t *regs =3D vdev->regs;
> +    uint8_t iir =3D 0;
> +    unsigned int i;
> +
> +    /*
> +     * NB: every interaction w/ ns16x50 registers (except DLAB=3D1) goes
> +     * through that call.
> +     */
> +    ASSERT(spin_is_locked(&vdev->lock));
> +
> +    for ( i =3D 0; i < ARRAY_SIZE(iir_by_prio); i++ )
> +    {
> +        if ( (regs[UART_IER] & iir_by_prio[i].ier) &&
> +             iir_by_prio[i].check(vdev) )
> +            break;
> +

Do we need this extra line?

> +    }
> +    if ( i =3D=3D ARRAY_SIZE(iir_by_prio) )
> +        iir |=3D UART_IIR_NOINT;
> +    else
> +        iir |=3D iir_by_prio[i].iir;
> +
> +    if ( regs[UART_FCR] & UART_FCR_ENABLE )
> +        iir |=3D UART_IIR_FE;
> +
> +    return iir;
> +}
> +
> +static void ns16x50_irq_assert(const struct vuart_ns16x50 *vdev)
> +{
> +    struct domain *d =3D vdev->owner;
> +    const struct vuart_info *info =3D vdev->info;
> +    int vector;
> +
> +    if ( has_vpic(d) )
> +        vector =3D hvm_isa_irq_assert(d, info->irq, vioapic_get_vector);
> +    else if ( has_vioapic(d) )
> +        /* TODO */
> +    else
> +        ASSERT_UNREACHABLE();
> +
> +    ns16x50_debug(vdev, "IRQ#%d vector %d assert\n", info->irq, vector);
> +}
> +
> +static void ns16x50_irq_deassert(const struct vuart_ns16x50 *vdev)
> +{
> +    struct domain *d =3D vdev->owner;
> +    const struct vuart_info *info =3D vdev->info;
> +
> +    if ( has_vpic(d) )
> +        hvm_isa_irq_deassert(d, info->irq);
> +    else if ( has_vioapic(d) )
> +        /* TODO */
> +    else
> +        ASSERT_UNREACHABLE();
> +
> +    ns16x50_debug(vdev, "IRQ#%d deassert\n", info->irq);
> +}
> +
> +/*
> + * Assert/deassert virtual ns16x50 interrupt line.
> + */
> +static void ns16x50_irq_check(const struct vuart_ns16x50 *vdev)
> +{
> +    uint8_t iir =3D ns16x50_iir_get(vdev);
> +    const struct vuart_info *info =3D vdev->info;
> +
> +    if ( iir & UART_IIR_NOINT )
> +        ns16x50_irq_deassert(vdev);
> +    else
> +        ns16x50_irq_assert(vdev);
> +
> +    ns16x50_debug(vdev, "IRQ#%d IIR 0x%02x %s\n", info->irq, iir,
> +                  (iir & UART_IIR_NOINT) ? "deassert" : "assert");
> +}
> +
>  /*
>   * Emulate 8-bit write access to ns16x50 register.
>   */
> @@ -106,6 +224,10 @@ static int ns16x50_io_write8(
>      {
>          switch ( reg )
>          {
> +        case UART_IER:
> +            regs[UART_IER] =3D val & UART_IER_MASK;
> +            break;
> +
>          /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
>          case UART_SCR:
>              regs[UART_SCR] =3D val;
> @@ -115,6 +237,8 @@ static int ns16x50_io_write8(
>              rc =3D -EINVAL;
>              break;
>          }
> +
> +        ns16x50_irq_check(vdev);
>      }
>
>      return rc;
> @@ -182,6 +306,14 @@ static int ns16x50_io_read8(
>      {
>          switch ( reg )
>          {
> +        case UART_IER:
> +            val =3D regs[UART_IER];
> +            break;
> +
> +        case UART_IIR: /* RO */
> +            val =3D ns16x50_iir_get(vdev);
> +            break;
> +
>          case UART_SCR:
>              val =3D regs[UART_SCR];
>              break;
> @@ -190,6 +322,8 @@ static int ns16x50_io_read8(
>              rc =3D -EINVAL;
>              break;
>          }
> +
> +        ns16x50_irq_check(vdev);
>      }
>
>      *data =3D val;
> @@ -342,6 +476,10 @@ static int ns16x50_init(void *arg)
>
>      register_portio_handler(d, info->base_addr, info->size, ns16x50_io_h=
andle);
>
> +    spin_lock(&vdev->lock);
> +    ns16x50_irq_check(vdev);
> +    spin_unlock(&vdev->lock);
> +
>      return 0;
>  }
>
> --
> 2.51.0
>
>

Best regards,
Mykola

