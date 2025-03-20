Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43569A6A914
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 15:51:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922385.1326290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHF3-00054S-Vq; Thu, 20 Mar 2025 14:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922385.1326290; Thu, 20 Mar 2025 14:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHF3-00051O-RN; Thu, 20 Mar 2025 14:51:29 +0000
Received: by outflank-mailman (input) for mailman id 922385;
 Thu, 20 Mar 2025 14:51:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m8Tk=WH=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1tvHF2-0004vX-5M
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 14:51:28 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc55c20a-059a-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 15:51:27 +0100 (CET)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2c12b7af278so621188fac.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 07:51:27 -0700 (PDT)
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
X-Inumbo-ID: cc55c20a-059a-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742482285; x=1743087085; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cChT3FXnRjyWSD4Xu8zhMDvdBubRQ2HIJ34epdmFxTg=;
        b=FhZDMK1VxlmzY//0KUi7IK35wqJXmQXSJiS1teoOleZ6KxED3CVP3U+oHns0gkRK3r
         PUwZkzsFqCFinYMYhEyngHTREeIkBN2VJy4ZE8/A2UmIxpMzxJgz7NROO43N2QqpWCT3
         2XRyTXXJP2aHWzIkhXHSyadVurHignC55UQzZp++hWsxDK68VZvEJ+gJfmTDlkbbgSzx
         xYeh5Svj4HU/ZzI0mQg6VyJyUbebDIWn85Imz9SPkJoy1eZaD1h3oLPjxHmhNRdkgQgn
         qc5PjCXOmvnePbIKZqrvHNwsSwAvFHte6QjstqYCyOxvwWuawK85rId265xRf5BQPEMG
         vdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742482285; x=1743087085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cChT3FXnRjyWSD4Xu8zhMDvdBubRQ2HIJ34epdmFxTg=;
        b=uD8jBzk7EZ5cGIH9fR59NDxCAX8mwJTneQJhT27v8aQzgWNgazVZwuF3OO8iow+puo
         lwATXQJSJ10Fbvmrm8Thm0DPQCknlArkDAjDXknRvABaVg8ccK+5DkP1ft6IvDXpes8P
         Q6y/eAkWrelAkQoCnR659/sETt41iOzCmzIDelgeWBqO8x2nfEPVpSyEz0yOddi+s4ui
         o5Xx+YZiNp7YX6TwgMwORPsoSXiiip/wTw2g2f66wrmEwZvksS88PXvXN60O3OAIRW5+
         UV6spXmF1yVtpTdgeKPYDebAudcYmkcGQO/f7PYcC7Zw6rBKOaMbfsuuBtMoW/IbSOmy
         knng==
X-Gm-Message-State: AOJu0YzDPEWMJG2wm9m9K2W1NU9OpCKI+3i2b133ryCneo/Lg136i5Q4
	Vv44z/evyszQVQvCDZLGSf7lSovcVjeLC1aJu7G0QcH+7ORWGG5GjQ9EMTXJbdKX2d+ytxWvQbz
	knFH2DZI1UxlQlz977GF0Xtu04cTgmbGp75iMJg==
X-Gm-Gg: ASbGncuideYtrWHWBQK/OsjYUfpZ4LEz53DOZGdd9615Bfdr4mPG5S6WSMFJtRD/aLU
	4FQLeiPTIf5BE/q9UO41Z/w0oej2lTADHnoW7nEUVHuG6XU5fHfSRcmlBhriiEbowjIcCwMXz+P
	EgTnOmfinr5T7DVmqethD7T3dtU9mv6L9Cn+An1A==
X-Google-Smtp-Source: AGHT+IEjgzK+v39TQfvvstFgT8nIYGY9fXfriV39M6LZlO3HVjq9SlwUviFbUyTbhqo3D1yn7bbVc1pkbX+2wOB00a4=
X-Received: by 2002:a05:6870:2f0f:b0:2c2:2b79:f7f6 with SMTP id
 586e51a60fabf-2c760b87cf4mr2631384fac.9.1742482285323; Thu, 20 Mar 2025
 07:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741617888.git.bertrand.marquis@arm.com> <5bbdc8bc0377014a0c683f8f9e154267e4b27c1f.1741617888.git.bertrand.marquis@arm.com>
In-Reply-To: <5bbdc8bc0377014a0c683f8f9e154267e4b27c1f.1741617888.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 20 Mar 2025 15:51:12 +0100
X-Gm-Features: AQ5f1JpQTOy7CYW6jOOXlV-Ls2V_lBDS3wXZglMQJBQGxJLSzeeR4fuJMCmxHhI
Message-ID: <CAHUa44Fd=Q1YKBhjiTwhM+aVT7BX59234XW9HonogqW2er0+Cw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] xen/arm: ffa: Add buffer full notification support
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Mon, Mar 10, 2025 at 3:51=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Add support to raise a Rx buffer full notification to a VM.
> This function will be used for indirect message support between VM and
> is only activated if CONFIG_FFA_VM_TO_VM is selected.
>
> Even if there are 32 framework notifications possible, right now only
> one is defined so the implementation is simplified to only handle the
> buffer full notification using a boolean. If other framework
> notifications have to be supported one day, the design will have to be
> modified to handle it properly.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
> - Code style fix
> ---
>  xen/arch/arm/tee/ffa_notif.c   | 26 +++++++++++++++++++++-----
>  xen/arch/arm/tee/ffa_private.h | 13 +++++++++++++
>  2 files changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 00efaf8f7353..d19aa5c5bef6 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -93,6 +93,7 @@ void ffa_handle_notification_info_get(struct cpu_user_r=
egs *regs)
>  void ffa_handle_notification_get(struct cpu_user_regs *regs)
>  {
>      struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>      uint32_t recv =3D get_user_reg(regs, 1);
>      uint32_t flags =3D get_user_reg(regs, 2);
>      uint32_t w2 =3D 0;
> @@ -132,11 +133,7 @@ void ffa_handle_notification_get(struct cpu_user_reg=
s *regs)
>           */
>          if ( ( flags  & FFA_NOTIF_FLAG_BITMAP_SP ) &&
>               ( flags & FFA_NOTIF_FLAG_BITMAP_SPM ) )
> -        {
> -                struct ffa_ctx *ctx =3D d->arch.tee;
> -
> -                ACCESS_ONCE(ctx->notif.secure_pending) =3D false;
> -        }
> +            ACCESS_ONCE(ctx->notif.secure_pending) =3D false;
>
>          arm_smccc_1_2_smc(&arg, &resp);
>          e =3D ffa_get_ret_code(&resp);
> @@ -156,6 +153,12 @@ void ffa_handle_notification_get(struct cpu_user_reg=
s *regs)
>              w6 =3D resp.a6;
>      }
>
> +#ifdef CONFIG_FFA_VM_TO_VM
> +    if ( flags & FFA_NOTIF_FLAG_BITMAP_HYP &&
> +          test_and_clear_bool(ctx->notif.buff_full_pending) )
> +        w7 =3D FFA_NOTIF_RX_BUFFER_FULL;
> +#endif
> +
>      ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, w4, w5, w6, w7);
>  }
>
> @@ -178,6 +181,19 @@ int ffa_handle_notification_set(struct cpu_user_regs=
 *regs)
>                             bitmap_hi);
>  }
>
> +#ifdef CONFIG_FFA_VM_TO_VM
> +void ffa_raise_rx_buffer_full(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( !ctx )
> +        return;
> +
> +    if ( !test_and_set_bool(ctx->notif.buff_full_pending) )
> +        vgic_inject_irq(d, d->vcpu[0], notif_sri_irq, true);
> +}
> +#endif
> +
>  /*
>   * Extract a 16-bit ID (index n) from the successful return value from
>   * FFA_NOTIFICATION_INFO_GET_64 or FFA_NOTIFICATION_INFO_GET_32. IDs are
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index bd6877d8c632..1f5067d5d0c9 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -210,6 +210,8 @@
>  #define FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT   7
>  #define FFA_NOTIF_INFO_GET_ID_COUNT_MASK    0x1F
>
> +#define FFA_NOTIF_RX_BUFFER_FULL        BIT(0, U)
> +
>  /* Feature IDs used with FFA_FEATURES */
>  #define FFA_FEATURE_NOTIF_PEND_INTR     0x1U
>  #define FFA_FEATURE_SCHEDULE_RECV_INTR  0x2U
> @@ -298,6 +300,13 @@ struct ffa_ctx_notif {
>       * pending global notifications.
>       */
>      bool secure_pending;
> +
> +#ifdef CONFIG_FFA_VM_TO_VM
> +    /*
> +     * Pending Hypervisor framework notifications
> +     */
> +    bool buff_full_pending;
> +#endif

It doesn't matter if there are one or two bools in this struct.
However, the ifdef prevents using IS_ENABLED(CONFIG_FFA_VM_TO_VM)
instead of an ifdef in the logic controlling access to this field.

Cheers,
Jens

>  };
>
>  struct ffa_ctx {
> @@ -369,6 +378,10 @@ void ffa_handle_notification_info_get(struct cpu_use=
r_regs *regs);
>  void ffa_handle_notification_get(struct cpu_user_regs *regs);
>  int ffa_handle_notification_set(struct cpu_user_regs *regs);
>
> +#ifdef CONFIG_FFA_VM_TO_VM
> +void ffa_raise_rx_buffer_full(struct domain *d);
> +#endif
> +
>  void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t=
 fid);
>  int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs);
>
> --
> 2.47.1
>

