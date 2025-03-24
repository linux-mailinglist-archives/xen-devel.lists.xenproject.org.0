Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B83E9A6D847
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 11:30:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925298.1328170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twf4s-0000PN-6s; Mon, 24 Mar 2025 10:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925298.1328170; Mon, 24 Mar 2025 10:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twf4s-0000NG-4L; Mon, 24 Mar 2025 10:30:42 +0000
Received: by outflank-mailman (input) for mailman id 925298;
 Mon, 24 Mar 2025 10:30:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J9GC=WL=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1twf4q-0000Jw-W2
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 10:30:41 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07a0f057-089b-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 11:30:39 +0100 (CET)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2c764f2c223so723585fac.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 03:30:39 -0700 (PDT)
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
X-Inumbo-ID: 07a0f057-089b-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742812238; x=1743417038; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnnuznTROqhNC6V5e6RJf/h2kLGr1cTf2YviI1hKph0=;
        b=Bf0ncP+vzx25Qr3PFuHmjR/hoZG58FayjxDYaWv+e01b1E4WDz7tFWF1oj+s0qBx1l
         Ogw8XNUwV/t+W+RV4fSsc3wyhP8usWT8u2G0DWS18EYUotjyqXW2YkUISMHEVg9XDH+r
         wL3GlZUXIxToTTnT6Q7S0y231H03yb5tKUT3rV3+SQLCwu1XZY2OXAe1mnrWH5xw/wax
         X+SNr16ef+s00w3kD7LVbsZ38Y8B7SbOsJzciQ77E4OdI6OUkMhzmY50WtsWpbjyUT/c
         fT6LEHE+6OsU9ceifeqa/+Nz5T1rDvZLDYkU7iTUTd02dOGdJ4P59dQfFDuoX3CZuVx8
         hEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742812238; x=1743417038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnnuznTROqhNC6V5e6RJf/h2kLGr1cTf2YviI1hKph0=;
        b=l8Dnd1Uab+f/MNMed+jXdfQ265DYhS3lm2gPo5sYDHN8eFAf/Ut9jD7m0nlZEfy4si
         MGSpKx4QVHHPjz/+6hWse5v4qCQWbV73gNQoG0d4n5Vg3kYPdJ8YersTbmt70J+1+EwE
         H+wBitAcg3eTCvRLpinucvYzuRlQzrZh8yTUtufMSUSPHMYt/45tswieIsrjLxQuv+60
         FhzSc0peqQ/kxfiDgvuMTUybi8JjrSzon5jPkL9MQnMSLLYQ6dD9oNgLihBL1xW3Yzos
         vJ/JH9MfbQzr20SXT7D9FbjGPJvV7LTmkKWQiRf8Mu2QYpmHZwtDm9hj9C2qrCyqh7Md
         2qBw==
X-Gm-Message-State: AOJu0YzruBp4NmBb4AcJLehHXEj0/6JUGGgKETYubjPUTaPSUR6Y+GZF
	aWpknrwEFt7NNZHwSjcfvEQxK8a9QjE9Y+wP+jmddR7C4VyxJcTuHdBc1BKHWqLP7XTtSKpJp+G
	iXr5g/soD5UG97RKSWWLYnJKLK1yjo+NHo42GXw==
X-Gm-Gg: ASbGncsmyUW/lO0fsWmbViSLxefE0iXrUoTRGloJouDiLMfTu/EdqsdJQvC7jucmh4y
	OxZGfqMbLVBa8sDGTnKFWH0tmBkmg1snWMNNVudzKPb3OP65TamwLPAClngWgl7gZgWpFYqeJbk
	uSz4bhNDUhyxqBy5occBQGGmQLnoMmnAKAv8qnNQ==
X-Google-Smtp-Source: AGHT+IEvd6n3SuFPL5Fk+iCkYpqjVJtmoWsUg3oiAtNlQX/pRBNNvAeUqe9V1Z9AnvwGNs5pTGNWailkGBS9cjDXFR4=
X-Received: by 2002:a05:6871:289e:b0:2c2:3d33:836f with SMTP id
 586e51a60fabf-2c78054ab10mr7745938fac.27.1742812238196; Mon, 24 Mar 2025
 03:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1742570590.git.bertrand.marquis@arm.com> <3aceccbc7d006b87bfe20a9a4f660eb831185dbb.1742570590.git.bertrand.marquis@arm.com>
In-Reply-To: <3aceccbc7d006b87bfe20a9a4f660eb831185dbb.1742570590.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 24 Mar 2025 11:30:25 +0100
X-Gm-Features: AQ5f1JrVWoeq8eW2rvmlUB6tYkDlJWzFFuRTsrUf7c7OfuGUHUsL5WLIz93xsbo
Message-ID: <CAHUa44FFuo4=UBd2tqips6sfEDd+C5e7i8RzG-cLQTt4gmhZag@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] xen/arm: ffa: Add buffer full notification support
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Mon, Mar 24, 2025 at 10:15=E2=80=AFAM Bertrand Marquis
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
> Changes in v3:
> - introduce a vm_pending boolean to track if VM notifications are
>   pending and allow to decorelate pending secure notifications from
>   pending vm ones
> - remove ifdef around boolean entries for notifications and make use of
>   IS_ENABLED instead of ifdefs when possible
> - Fix notification number signaled to VMs for buffer full to use the
>   proper GUEST_FFA_NOTIF_PEND_INTR_ID instead of the identifier received
>   from the SPMC.
> - Move back into this patch ffa_private.h part which was wrongly in the
>   patch for indirect messages between VM
> Changes in v2:
> - Switch ifdef to IS_ENABLED when possible
> ---
>  xen/arch/arm/tee/ffa_notif.c   | 36 ++++++++++++++++++++++++++++------
>  xen/arch/arm/tee/ffa_private.h | 23 +++++++++++++++++++++-
>  2 files changed, 52 insertions(+), 7 deletions(-)

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 00efaf8f7353..f6df2f15bb00 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -69,6 +69,7 @@ void ffa_handle_notification_info_get(struct cpu_user_r=
egs *regs)
>  {
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
> +    bool notif_pending;
>
>      if ( !notif_enabled )
>      {
> @@ -76,7 +77,11 @@ void ffa_handle_notification_info_get(struct cpu_user_=
regs *regs)
>          return;
>      }
>
> -    if ( test_and_clear_bool(ctx->notif.secure_pending) )
> +    notif_pending =3D test_and_clear_bool(ctx->notif.secure_pending);
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +        notif_pending |=3D test_and_clear_bool(ctx->notif.vm_pending);
> +
> +    if ( notif_pending )
>      {
>          /* A pending global notification for the guest */
>          ffa_set_regs(regs, FFA_SUCCESS_64, 0,
> @@ -93,6 +98,7 @@ void ffa_handle_notification_info_get(struct cpu_user_r=
egs *regs)
>  void ffa_handle_notification_get(struct cpu_user_regs *regs)
>  {
>      struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>      uint32_t recv =3D get_user_reg(regs, 1);
>      uint32_t flags =3D get_user_reg(regs, 2);
>      uint32_t w2 =3D 0;
> @@ -132,11 +138,7 @@ void ffa_handle_notification_get(struct cpu_user_reg=
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
> @@ -156,6 +158,14 @@ void ffa_handle_notification_get(struct cpu_user_reg=
s *regs)
>              w6 =3D resp.a6;
>      }
>
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) &&
> +          flags & FFA_NOTIF_FLAG_BITMAP_HYP &&
> +          test_and_clear_bool(ctx->notif.buff_full_pending) )
> +    {
> +        ACCESS_ONCE(ctx->notif.vm_pending) =3D false;
> +        w7 =3D FFA_NOTIF_RX_BUFFER_FULL;
> +    }
> +
>      ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, w4, w5, w6, w7);
>  }
>
> @@ -178,6 +188,20 @@ int ffa_handle_notification_set(struct cpu_user_regs=
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
> +    ACCESS_ONCE(ctx->notif.buff_full_pending) =3D true;
> +    if ( !test_and_set_bool(ctx->notif.vm_pending) )
> +        vgic_inject_irq(d, d->vcpu[0], GUEST_FFA_NOTIF_PEND_INTR_ID, tru=
e);
> +}
> +#endif
> +
>  /*
>   * Extract a 16-bit ID (index n) from the successful return value from
>   * FFA_NOTIFICATION_INFO_GET_64 or FFA_NOTIFICATION_INFO_GET_32. IDs are
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index bd6877d8c632..878af2d76e0e 100644
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
> @@ -295,9 +297,20 @@ struct ffa_mem_region {
>  struct ffa_ctx_notif {
>      /*
>       * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
> -     * pending global notifications.
> +     * pending notifications from the secure world.
>       */
>      bool secure_pending;
> +
> +    /*
> +     * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
> +     * pending notifications from VMs (including framework ones).
> +     */
> +    bool vm_pending;
> +
> +    /*
> +     * True if domain has buffer full notification pending
> +     */
> +    bool buff_full_pending;
>  };
>
>  struct ffa_ctx {
> @@ -369,6 +382,14 @@ void ffa_handle_notification_info_get(struct cpu_use=
r_regs *regs);
>  void ffa_handle_notification_get(struct cpu_user_regs *regs);
>  int ffa_handle_notification_set(struct cpu_user_regs *regs);
>
> +#ifdef CONFIG_FFA_VM_TO_VM
> +void ffa_raise_rx_buffer_full(struct domain *d);
> +#else
> +static inline void ffa_raise_rx_buffer_full(struct domain *d)
> +{
> +}
> +#endif
> +
>  void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t=
 fid);
>  int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs);
>
> --
> 2.47.1
>

