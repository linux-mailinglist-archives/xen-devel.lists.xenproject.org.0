Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9AAC67A2E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 07:01:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164324.1491338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLElo-0007OP-8y; Tue, 18 Nov 2025 06:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164324.1491338; Tue, 18 Nov 2025 06:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLElo-0007MQ-5t; Tue, 18 Nov 2025 06:00:52 +0000
Received: by outflank-mailman (input) for mailman id 1164324;
 Tue, 18 Nov 2025 06:00:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9C8=52=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vLElm-00062J-H3
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 06:00:50 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eedb866f-c443-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 07:00:49 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-37b983fbd45so41441461fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 22:00:49 -0800 (PST)
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
X-Inumbo-ID: eedb866f-c443-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763445649; x=1764050449; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwD/qxM4klvXk5crZeSiWKD838Fjb9t3B6KR63KDOxs=;
        b=WhcTjdTEQIDtxP5NaiWXXBeamdpvHG5IvEkLCPQnAHsEQxEWmhIL8YQGox/mIJ8lXT
         eQcmh438XbYCSVBozxcvKbyoqvokYQNDTl7PQFE4RAUSXP9QE5L3B9q1N6Pc2hRS097p
         ASOKxR7tuQhvbummom7SS/e/rvj78VMlBOPMtz25BmBdlX/9mdpzpO3yxykknrnXbsCR
         yPa7vxZMF5hzhctR8grYteso9wJla9Q5NPmxQoEDjowc4L6U71mwOoTmcinxh9nfWSLt
         vNke/ZchSaoknl08q4iIkO7J77IKuVerDYHXlx/Ybz8tlzQxewv8Vsu1gUcWfaWP9+xQ
         nsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763445649; x=1764050449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pwD/qxM4klvXk5crZeSiWKD838Fjb9t3B6KR63KDOxs=;
        b=HH7IQ7g1qiTblRNb8MZAPw1KAPimlY9eMCYFi3WmZ7oNQrHnU4IidpppmJYt+u19wf
         ze+AHSbx55EkTUIFl3kI3kAboiQ2eOeww0svHnDO27pj5/luVXFrl/8Gz6YaICaTCJLS
         D49ZnH8Ka2PX6R3sete4z9QKuwPprl63BvHGWBMbB6VDP0tn3t3eta4vIN+CSeQR4JN1
         dJ5hADJ5fo3t27Vb3TS72f3sU2WaBCuB9aDdJCTVfild4wbDuiYEcQ9Jppso9e2nVC5E
         IQQTV2JviTG2Hp/QZgdAeePyXS7rdnneWI/NaU/FREXHuo2IWP4AExIM+NISC/PPg9Fp
         SXeQ==
X-Gm-Message-State: AOJu0YyTQgEUgTMI4yhMjBhDXYD0T78WWuvxbOPTgUsktpZ1e0y/2yGR
	gBxYEcYAWvW4HA8hBuHCPqVl+F1dc8LTlIJcRhe+rN8RTVnzWaHJVXCpxKOEU71S32CzeUBxfoy
	QTpt3CG/JzyncZywd0TcZrd1YmGH03SM=
X-Gm-Gg: ASbGncuEt/UgW8BfHgdJeqWh8wj4fQYSDxyZWiC5bnUT/jEqrES0DnrHI16zdNcNWGm
	c1ll4EN5MSgNVCgaLUTuWui4G0t7CUHivframcQZz/oNjXG66SJJE1BmAADGGzzntrSF3VEBw+1
	KoMGl+DoaMqxSXJUST32FmbFf/wXyj20s9kP/bwcqc0+bniPBoDsVsX10DRqC9p/F+f6wqLzhH0
	kwWO8ED9oGevniQPAw2CdwEywcFJa7iGo8Qw3Mv2bmCooQbENJNIS1A5cuuSlKx06eydQ==
X-Google-Smtp-Source: AGHT+IG5LmDgdKQsDcLy9LqI+V6sMxTD1zs706xf2JYyNUERO8avigWpnhyUFxAIY0UUFWJjPjD1gCD0b07wXTfzJBk=
X-Received: by 2002:a05:6512:15a2:b0:592:f77d:88f7 with SMTP id
 2adb3069b0e04-595842262bfmr4946332e87.52.1763445648818; Mon, 17 Nov 2025
 22:00:48 -0800 (PST)
MIME-Version: 1.0
References: <20250908211149.279143-1-dmukhin@ford.com> <20250908211149.279143-11-dmukhin@ford.com>
In-Reply-To: <20250908211149.279143-11-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 18 Nov 2025 08:00:00 +0200
X-Gm-Features: AWmQ_bl0qdrp4_c627SxShM-Zkf7VGdwsG4R77fxQ6BvA2PLF4sQmFhAEV5w9vU
Message-ID: <CAGeoDV9+6fLR0ivJ0UisWk7gtqYehpnfDa_p2Kk0Ty7Czkbj0w@mail.gmail.com>
Subject: Re: [PATCH v7 10/16] emul/ns16x50: implement THR register
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Thank you for the patch.

On Tue, Sep 9, 2025 at 1:26=E2=80=AFAM <dmukhin@xen.org> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Add THR register emulation to the I/O port handlder.
>
> Add TX FIFO management code since THR depends on TX FIFO.
>
> TX FIFOs is not emulated as per UART specs for simplicity (not need to em=
ulate
> baud rate). Emulator does not emulate NS8250 (no FIFO), NS16550a (16 byte=
s) or
> NS16750 (64 bytes).
>
> TX FIFOs is emulated by using xencons_interface which conveniently provid=
es
> primitives for buffer management and later can be used for inter-domain
> communication similarly to vpl011.
>
> Account for DLL =3D=3D 0: in this case, disable transmitter.
>
> Add UART_IIR_THR interrupt reason handling since it depends on THR regist=
er
> access.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v6:
> - added DLL =3D=3D 0 case handling as per Mykola's suggestion
> - dropped UART_IIR_THR clearing in UART_IIR register emulation in ns16x50=
_io_write8()
> - simplified UART_IIR_THR handling
> - updated ns16x50_iir_check_thr()
> ---
>  xen/common/emul/vuart/ns16x50.c | 82 ++++++++++++++++++++++++++++++++-
>  1 file changed, 81 insertions(+), 1 deletion(-)
>
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16=
x50.c
> index 250411e0a7d8..137ce08f4e1d 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -149,6 +149,66 @@ static int ns16x50_fifo_rx_putchar(struct vuart_ns16=
x50 *vdev, char c)
>      return rc;
>  }
>
> +static bool ns16x50_fifo_tx_full(const struct vuart_ns16x50 *vdev)
> +{
> +    const struct xencons_interface *cons =3D &vdev->cons;
> +
> +    return cons->out_prod - cons->out_cons =3D=3D ARRAY_SIZE(cons->out);
> +}
> +
> +static void ns16x50_fifo_tx_reset(struct vuart_ns16x50 *vdev)
> +{
> +    struct xencons_interface *cons =3D &vdev->cons;
> +
> +    cons->out_cons =3D cons->out_prod;
> +}
> +
> +/*
> + * Flush cached output to Xen console.
> + */
> +static void ns16x50_fifo_tx_flush(struct vuart_ns16x50 *vdev)
> +{
> +    struct xencons_interface *cons =3D &vdev->cons;
> +    struct domain *d =3D vdev->owner;
> +    XENCONS_RING_IDX i, n, len =3D cons->out_prod - cons->out_cons;
> +
> +    ASSERT(len <=3D ARRAY_SIZE(cons->out));
> +    if ( !len )
> +        return;
> +
> +    i =3D MASK_XENCONS_IDX(cons->out_cons, cons->out);
> +    n =3D min_t(XENCONS_RING_IDX, len, ARRAY_SIZE(cons->out) - i);
> +    if ( n )
> +        guest_printk(d, guest_prefix "%.*s", n, &cons->out[i]);
> +
> +    i =3D 0;
> +    n =3D len - n;
> +    if ( n )
> +        guest_printk(d, guest_prefix "%.*s", n, &cons->out[i]);

ns16x50_fifo_tx_flush() splits wrapped output into two guest_printk()
calls, so the log gets two prefixes for a single line:
    (d1) PART1(d1) PART2

Could we linearize the wrapped buffer and emit a single guest_printk()
(e.g. by printing both spans in one format string) to keep just one prefix?


Best regards,
Mykola


> +
> +    cons->out_cons +=3D len;
> +}
> +
> +/*
> + * Accumulate guest OS output before sending to Xen console.
> + */
> +static void ns16x50_fifo_tx_putchar(struct vuart_ns16x50 *vdev, char ch)
> +{
> +    struct xencons_interface *cons =3D &vdev->cons;
> +
> +    if ( !is_console_printable(ch) )
> +        return;
> +
> +    if ( !ns16x50_fifo_tx_full(vdev) )
> +    {
> +        cons->out[MASK_XENCONS_IDX(cons->out_prod, cons->out)] =3D ch;
> +        cons->out_prod++;
> +    }
> +
> +    if ( ch =3D=3D '\n' || ch =3D=3D '\0' || ns16x50_fifo_tx_full(vdev) =
)
> +        ns16x50_fifo_tx_flush(vdev);
> +}
> +
>  static bool ns16x50_is_running(const struct vuart_ns16x50 *vdev)
>  {
>      /* DLL set to 0 disables serial communication. */
> @@ -172,7 +232,7 @@ static bool cf_check ns16x50_iir_check_rda(const stru=
ct vuart_ns16x50 *vdev)
>
>  static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *v=
dev)
>  {
> -    return false;
> +    return !ns16x50_fifo_tx_full(vdev);
>  }
>
>  static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *v=
dev)
> @@ -294,6 +354,22 @@ static int ns16x50_io_write8(
>      {
>          switch ( reg )
>          {
> +        case UART_THR:
> +            if ( !ns16x50_is_running(vdev) )
> +                break;
> +
> +            if ( regs[UART_MCR] & UART_MCR_LOOP )
> +            {
> +                if ( ns16x50_fifo_rx_putchar(vdev, val) )
> +                    regs[UART_LSR] |=3D UART_LSR_OE;
> +
> +                regs[UART_LSR] |=3D UART_LSR_DR;
> +            }
> +            else
> +                ns16x50_fifo_tx_putchar(vdev, val);
> +
> +            break;
> +
>          case UART_IER:
>              regs[UART_IER] =3D val & UART_IER_MASK;
>              break;
> @@ -646,6 +722,10 @@ static void cf_check ns16x50_deinit(void *arg)
>      struct vuart_ns16x50 *vdev =3D arg;
>
>      ASSERT(vdev);
> +
> +    spin_lock(&vdev->lock);
> +    ns16x50_fifo_tx_flush(vdev);
> +    spin_unlock(&vdev->lock);
>  }
>
>  static void * cf_check ns16x50_alloc(struct domain *d, const struct vuar=
t_info *info)
> --
> 2.51.0
>
>

