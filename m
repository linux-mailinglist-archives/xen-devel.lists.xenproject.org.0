Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F71F9AE6A7
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 15:35:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825296.1239498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xzW-0001mI-4i; Thu, 24 Oct 2024 13:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825296.1239498; Thu, 24 Oct 2024 13:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xzW-0001jA-25; Thu, 24 Oct 2024 13:35:06 +0000
Received: by outflank-mailman (input) for mailman id 825296;
 Thu, 24 Oct 2024 13:35:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqEU=RU=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1t3xzV-0001j2-09
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 13:35:05 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c615ac5f-920c-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 15:35:04 +0200 (CEST)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2884e6ed0daso421416fac.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 06:35:03 -0700 (PDT)
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
X-Inumbo-ID: c615ac5f-920c-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729776903; x=1730381703; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDtXTfbOZVyjo3+y1ruFHvhtZYsO4iWO/DfOD9Ju6q4=;
        b=phXd0TV4ImiKe3n4to4hjztOR+nMTRfgLdHfcqI4Xgk+rPfsW1qp5gBkDW3fnz0n50
         0p2PJnrkJKLr4vHH8Z9I9DVQ5hy9GO28MVFdtWpnQXON0rUU8zaEuIusEnSdR5xG7gPA
         AWKh1dtjR6mOGR5zpmG/0DwmYC8lOBlgtYXzW7pfd7Ia1Os+u3xWbjEsgh5ksPLZtcUR
         4bl61Rw1qP69z031kTL+5MoEOVUT1prn7cqZWUVMBKgIW+AdU0o7xBangyPi6istZzZP
         hFbm0KC5QGGfjf7zk2ub8i27Lp6FQtrl79lix9kmEbGY3nhlj2UHwo2CboTdPBNHUW1R
         KB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729776903; x=1730381703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDtXTfbOZVyjo3+y1ruFHvhtZYsO4iWO/DfOD9Ju6q4=;
        b=JepUKRtLOT34FTHTNG/UndQfct84497Nt+3y3BW6rvUxTlEzgJawy2PvIrbvR3Piua
         ebEaP3AXozMWNtRsWXopGAUy4/7FcnifvEYvnOr36ZaaahntYGa9TMe+z93YTqPzhS8n
         Ou0Wtfl4j+x0MNryfnAcozv4COWixufU5L1VC3NTyoE8tM0YcPc9stpnsAJk/i3LYp0k
         SyJSGDoNaSl+xlUn3jpqDYjyZTyX3i5u09JcMHsobw9pf+/nhieTxQmJydj6dB6D2i+T
         EDIQxZI2jHfk5NBgCWqLcwVGk6MFqGKwuIXA6p06Cj1xTRQdrBh6MFd5Xu+aeyJUJeWR
         AtPg==
X-Gm-Message-State: AOJu0Yy/nKPNwvNVU2NsbY/xpHvRXz3mgY1euifUE1+Ly7xVbJXXUvUy
	/i91rggRM1qsdYWRUs+7CkRRsqku/A5JDJ9efUUXSWCcBI4NUc6Q1pX7G+Ixf/W89K5b4UqFimA
	2Xl4gHrlX2SUW1YzR9Kuz29GO+PuChqFcpUDNtw==
X-Google-Smtp-Source: AGHT+IHY5vN02x66hzNYZXtpjGzPrzbvTGJZVvc8GjJZKmC1WsYri0Rfr3xeYd+zjwT/dmXN2x3s7IyGmXgaRjLJtHk=
X-Received: by 2002:a05:6870:f10f:b0:288:6a16:fe1 with SMTP id
 586e51a60fabf-28ced294ac0mr1986474fac.18.1729776902671; Thu, 24 Oct 2024
 06:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729066788.git.bertrand.marquis@arm.com>
 <b23ad93b876267fb48a5a398e394e60fdf52d33d.1729066788.git.bertrand.marquis@arm.com>
 <CAHUa44ESfSimrf6coDmurQSfuCQyytsi2gJh_kePer2p3zotug@mail.gmail.com> <678C4205-89C3-48D6-B5EF-9A16624B9E9D@arm.com>
In-Reply-To: <678C4205-89C3-48D6-B5EF-9A16624B9E9D@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 24 Oct 2024 15:34:51 +0200
Message-ID: <CAHUa44FJXrnfJUiLtBK2ZFp9L9908Nt74LiE8TRCzqJ8i=yRTg@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] xen/arm: ffa: Remove per VM notif_enabled
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Thu, Oct 24, 2024 at 11:50=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 24 Oct 2024, at 09:41, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi Bertrand,
> >
> > On Wed, Oct 16, 2024 at 10:32=E2=80=AFAM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> Remove the per VM flag to store if notifications are enabled or not as
> >> the only case where they are not, if notifications are enabled globall=
y,
> >> will make the VM creation fail.
> >> Also use the opportunity to always give the notifications interrupts I=
Ds
> >> to VM. If the firmware does not support notifications, there won't be
> >> any generated and setting one will give back a NOT_SUPPORTED.
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> Changes in v2:
> >> - rebase
> >> ---
> >> xen/arch/arm/tee/ffa.c         | 17 +++--------------
> >> xen/arch/arm/tee/ffa_notif.c   | 10 +---------
> >> xen/arch/arm/tee/ffa_private.h |  2 --
> >> 3 files changed, 4 insertions(+), 25 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >> index 72826b49d2aa..3a9525aa4598 100644
> >> --- a/xen/arch/arm/tee/ffa.c
> >> +++ b/xen/arch/arm/tee/ffa.c
> >> @@ -169,8 +169,6 @@ static void handle_version(struct cpu_user_regs *r=
egs)
> >>
> >> static void handle_features(struct cpu_user_regs *regs)
> >> {
> >> -    struct domain *d =3D current->domain;
> >> -    struct ffa_ctx *ctx =3D d->arch.tee;
> >>     uint32_t a1 =3D get_user_reg(regs, 1);
> >>     unsigned int n;
> >>
> >> @@ -218,16 +216,10 @@ static void handle_features(struct cpu_user_regs=
 *regs)
> >>         ffa_set_regs_success(regs, 0, 0);
> >>         break;
> >>     case FFA_FEATURE_NOTIF_PEND_INTR:
> >> -        if ( ctx->notif.enabled )
> >> -            ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, =
0);
> >> -        else
> >> -            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >> +        ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
> >>         break;
> >>     case FFA_FEATURE_SCHEDULE_RECV_INTR:
> >> -        if ( ctx->notif.enabled )
> >> -            ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_I=
D, 0);
> >> -        else
> >> -            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >> +        ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID, 0=
);
> >>         break;
> >>
> >>     case FFA_NOTIFICATION_BIND:
> >> @@ -236,10 +228,7 @@ static void handle_features(struct cpu_user_regs =
*regs)
> >>     case FFA_NOTIFICATION_SET:
> >>     case FFA_NOTIFICATION_INFO_GET_32:
> >>     case FFA_NOTIFICATION_INFO_GET_64:
> >> -        if ( ctx->notif.enabled )
> >> -            ffa_set_regs_success(regs, 0, 0);
> >> -        else
> >> -            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >> +        ffa_set_regs_success(regs, 0, 0);
> >>         break;
> >>     default:
> >>         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif=
.c
> >> index 4b3e46318f4b..3c6418e62e2b 100644
> >> --- a/xen/arch/arm/tee/ffa_notif.c
> >> +++ b/xen/arch/arm/tee/ffa_notif.c
> >> @@ -405,7 +405,6 @@ void ffa_notif_init(void)
> >>
> >> int ffa_notif_domain_init(struct domain *d)
> >> {
> >> -    struct ffa_ctx *ctx =3D d->arch.tee;
> >>     int32_t res;
> >>
> >>     if ( !notif_enabled )
> >> @@ -415,18 +414,11 @@ int ffa_notif_domain_init(struct domain *d)
> >>     if ( res )
> >>         return -ENOMEM;
> >>
> >> -    ctx->notif.enabled =3D true;
> >> -
> >>     return 0;
> >> }
> >>
> >> void ffa_notif_domain_destroy(struct domain *d)
> >> {
> >> -    struct ffa_ctx *ctx =3D d->arch.tee;
> >> -
> >> -    if ( ctx->notif.enabled )
> >> -    {
> >> +    if ( notif_enabled )
> >>         ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
> >
> > This call may now be done even if there hasn't been a successful call
> > to ffa_notification_bitmap_create().
> > A comment mentioning this and that it's harmless (if we can be sure it
> > is) would be nice.
> >
>
> You mean in the case where it failed during domain_init ?
>
> I can add the following comment:
>  Call bitmap_destroy even if bitmap create failed as the SPMC should retu=
rn an error that we will ignore
>
> Would that be ok ?

Yes, that's fine.

Cheers,
Jens

>
> Cheers
> Bertrand
>
>
> > Cheers,
> > Jens
> >
> >> -        ctx->notif.enabled =3D false;
> >> -    }
> >> }
> >> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_pri=
vate.h
> >> index 02162e0ee4c7..973ee55be09b 100644
> >> --- a/xen/arch/arm/tee/ffa_private.h
> >> +++ b/xen/arch/arm/tee/ffa_private.h
> >> @@ -281,8 +281,6 @@ struct ffa_mem_region {
> >> };
> >>
> >> struct ffa_ctx_notif {
> >> -    bool enabled;
> >> -
> >>     /*
> >>      * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
> >>      * pending global notifications.
> >> --
> >> 2.47.0
>
>

