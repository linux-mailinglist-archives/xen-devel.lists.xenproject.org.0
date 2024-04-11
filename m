Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D4C8A07D7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 07:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703753.1099606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1runDP-0007T0-8Z; Thu, 11 Apr 2024 05:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703753.1099606; Thu, 11 Apr 2024 05:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1runDP-0007Pv-5U; Thu, 11 Apr 2024 05:43:15 +0000
Received: by outflank-mailman (input) for mailman id 703753;
 Thu, 11 Apr 2024 05:43:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlLc=LQ=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1runDO-0007PZ-ED
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 05:43:14 +0000
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [2607:f8b0:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 627dbac9-f7c6-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 07:43:13 +0200 (CEST)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6ea1f98f3b9so1578240a34.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 22:43:13 -0700 (PDT)
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
X-Inumbo-ID: 627dbac9-f7c6-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712814192; x=1713418992; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwBVRIiwmur7FTDSRS6Sp3Q2WWprLKaR8CwhKo/e+F8=;
        b=NntqTDBzThn95WfXm7Y5FD5iDNG8llXtU56DpT5ISWDEe/XIbswTZgdOmbPSlFn5EF
         HvjvhF+A3pF92YadLRW+gf8DQPzGgQu25FlaUdai1yOVXjpYyJVrAp8f8nDvSRvLzhkl
         tNSIQRlZgjvwOZfGaULxGAXjgYQpQ2BAqJqGqZn/S66ogHM5fvwZjRYRZ5RfrE2+DA/t
         tl2QKZV/pOqzSJVlqdxsO8Tbpkq3SmOnxQo4Uy+VLLGNQ1GlssIJWuml/MEcHun17q0s
         ii/bnLkHNLuYfEbSLnPylAoaq79w9wlRjThHRKQC1ecXssheH+FAt4/YIDE7rsyy8Ry4
         r9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712814192; x=1713418992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwBVRIiwmur7FTDSRS6Sp3Q2WWprLKaR8CwhKo/e+F8=;
        b=S9/srsL64idb8zi6qHPE6gRN7uZglAeblivVZ55LgizJKlmXZ1VCOan2dQlR+rixQR
         ltwfwUpGp6OaoDLA5K1q7UXayxqoWc0ONbZKamXxxwnCYxoQDrw1LzxP3d7p+GjCVPAx
         mNn3sgLBxYUHYAFcwEdXKqWHMVQhkYDZcjr+AmDjcZGjU1u/8znIJqOk+ji8WLaQACOq
         rut4wOqg48+iuwftKccpjOhVgkSHTzyLf3RAsAWuquN8HHCcQNqNfM58D/L2mz1uoM5Z
         +GQ6Pzus4EzR4/o0kQ3uH+orkvTBWCle98VbxRbk6sDPFBlyvVN783Xjzdu+KrrbWbvm
         zrDA==
X-Gm-Message-State: AOJu0YxMkLd8wg7nKK/cn6T/lae07/io8EcasPrT+Ae39Q3u20Wqze9d
	S+CCo253X1gzQaLStxl9sBLqtYnw8TCqWYYXperxxqypk2pJYIk3JogmCD40eylu1mIc1V37UXb
	LRcQ4aDTj82fZ1KH+nsJtP4AQ5XKtQ3iJuSJgMA==
X-Google-Smtp-Source: AGHT+IFvqvsLTPk+CVqa0mtfZeSMIhLULKILagQlAO6Oy0qt6pkkfAcKzvq95aJFh5jPiA67/ezYcc+Qw96+7eMImlc=
X-Received: by 2002:a05:6871:b24:b0:22a:6d7f:6171 with SMTP id
 fq36-20020a0568710b2400b0022a6d7f6171mr5316711oab.36.1712814191666; Wed, 10
 Apr 2024 22:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240409153630.2026584-1-jens.wiklander@linaro.org>
 <20240409153630.2026584-6-jens.wiklander@linaro.org> <CAHUa44EeCeX6nbY+FG_WUK6n-GMBFFYS9khpHF59fH8BSiW01Q@mail.gmail.com>
 <BC039B3A-5796-4D5F-9E18-4A54DAE368F5@arm.com>
In-Reply-To: <BC039B3A-5796-4D5F-9E18-4A54DAE368F5@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 11 Apr 2024 07:43:00 +0200
Message-ID: <CAHUa44HB1qB4cp0g=szq-EePzOijfDd3ynPMx4hnrw3FTt3zCw@mail.gmail.com>
Subject: Re: [XEN PATCH v1 5/5] xen/arm: ffa: support notification
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	"patches@linaro.org" <patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Wed, Apr 10, 2024 at 6:30=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 10 Apr 2024, at 17:45, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > On Tue, Apr 9, 2024 at 5:36=E2=80=AFPM Jens Wiklander <jens.wiklander@l=
inaro.org> wrote:
> >>
> >> Add support for FF-A notifications, currently limited to an SP (Secure
> >> Partition) sending an asynchronous notification to a guest.
> >>
> >> Guests and Xen itself are made aware of pending notifications with an
> >> interrupt. The interrupt handler retrieves the notifications using the
> >> FF-A ABI and deliver them to their destinations.
> >>
> >> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >> ---
[snip]
> >> +    case FFA_FEATURE_NOTIF_PEND_INTR:
> >> +        if ( ctx->notif.enabled )
> >> +            ffa_set_regs_success(regs, FFA_NOTIF_PEND_INTR_ID, 0);
> >> +        else
> >> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >> +        break;
> >> +    case FFA_FEATURE_SCHEDULE_RECV_INTR:
> >> +        if ( ctx->notif.enabled )
> >> +            ffa_set_regs_success(regs, FFA_NOTIF_PEND_INTR_ID, 0);
> >> +        else
> >> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >> +        break;
> >
> > With the recently posted kernel patch
> > https://lore.kernel.org/all/20240410-ffa_npi_support-v1-3-1a5223391bd1@=
arm.com/
> > we need to decide which feature interrupt to return since the kernel
> > will only install a handle for the first it finds. Right now I propose
> > to to not report FFA_FEATURE_SCHEDULE_RECV_INTR. When the time comes
> > to use a secondary scheduler we'll need to report the SRI instead.
>
>
> We just had a meeting with Sudeep to discuss that matter and he agreed th=
at
> he would register the interrupt handler for all the interrupts available =
so that
> we can keep a model where we will generate SRIs only to a secondary sched=
uler
> and NPI for notification interrupts (so that the VM does not do a INFO_GE=
T when
> not required).
>
> We will have to report both as any VM could act as secondary scheduler fo=
r SPs
> in theory (we might need at some point a parameter for that) but for now =
those
> should only be generated to Dom0 if there are pending notifications for S=
Ps.

OK, thanks. I'll keep both then.

Cheers,
Jens

