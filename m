Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E42CD8A091B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 09:06:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703784.1099666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruoVQ-0005f9-BE; Thu, 11 Apr 2024 07:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703784.1099666; Thu, 11 Apr 2024 07:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruoVQ-0005d8-8S; Thu, 11 Apr 2024 07:05:56 +0000
Received: by outflank-mailman (input) for mailman id 703784;
 Thu, 11 Apr 2024 07:05:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlLc=LQ=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1ruoVO-0005d2-UU
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 07:05:54 +0000
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [2607:f8b0:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef320637-f7d1-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 09:05:53 +0200 (CEST)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6ea156bee62so197378a34.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 00:05:53 -0700 (PDT)
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
X-Inumbo-ID: ef320637-f7d1-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712819152; x=1713423952; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJbpjEFeCwqYDtF2U74SgvsVcyDKNfy3B34Zr7z5d/c=;
        b=W+ZKa6Hmgpg0V3hF3DPORfZOMVQgD76k8Qf/l43Nwj72QMEQgwSfK1Bm1vJK4/6UYy
         T4I2kyCRZ+KaUxD/oRq/bcgT5DOjYRUESPqwtnxHof3nwutNIFeDKqwqRuas1CBP/u8K
         4SRNj9wKDRKnOpyUSBeTURYZU59Ph/8P6nzDV+i3mYcBJsvRqgwg539k2Aau9NG7rZ68
         Vwy1uk2vFiseSH65DJ7Fbivkrei+faB1qrZrtpteoiaZe5fmCp6s5sFxeojXUCQaPnvo
         g4gC8dyCcAGWiioA6ieS0pSNKo9DI0OwWrvqXaGCm0xBjOCEGKjxYV3Eai3zSIjGIg/s
         +X4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712819152; x=1713423952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJbpjEFeCwqYDtF2U74SgvsVcyDKNfy3B34Zr7z5d/c=;
        b=duqM2pgmPtCfih8uc4sr0T99P9F8vXt0XsJlfI7kWjQsuv1MfgLyG8YrFa2+fSIxFK
         kYK7QQ3tzPPv9HGnNxVvc4KyNL04t7TgpQkxwsx81a1rRQ4v70S9vLUlOSaa/qkxCrKY
         gN3CumibJmszMoPsi2ODnx+9Xj7i+RA5yQ8s2LsPUMtsA2zusEg7DpdIDD43gQaDQfhH
         koxrtD+Vrtifd7hzLoidawzNPKJ+VglPLrhYa3A1AWgqtB7ZGZ058WJ1ZDVG8kneHM9S
         sG+yDxa5q2lmDVEcBm3k9etiNoS+M1IrcpAV3wi27v737pRDoPCVGwAJvEJJu+BEf4kW
         h8Pw==
X-Gm-Message-State: AOJu0YwdTtB47GNYXzYNRs3DjdpU0+szjZlM8ryE3B+7MZaIPhrN6f9c
	RpdWUGa6Yx5cEd47k4PVPFLzvw774Jg45ioapthGukw+sEnqOTlPcn6F45jsJZ+0rj8lQnS1hig
	l5dHTZ4cZqABoVGnVRVoSD1rwe5So8HIpIdY9eQ==
X-Google-Smtp-Source: AGHT+IGxgRsOVFB4GAtd/C3GMeHrvJCpFn4XDwgz5FVx6Ow/Ir6UEDJatnYzMe3xE7xRl8HTaTGRD1l5B2xSEtZOjng=
X-Received: by 2002:a05:6870:558a:b0:22e:2101:7535 with SMTP id
 qj10-20020a056870558a00b0022e21017535mr680998oac.25.1712819152296; Thu, 11
 Apr 2024 00:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240409153630.2026584-1-jens.wiklander@linaro.org>
 <20240409153630.2026584-5-jens.wiklander@linaro.org> <da2d2945-5d94-40e8-a632-6ea8cbf3bcb9@amd.com>
 <CAHUa44ET8XOk9vvz3_ffazV=DHDmbrZzB_TUEv=_Z4Rp=1N2ag@mail.gmail.com> <3c7d5147-9eab-41fb-b8fb-ac1dc5befd19@amd.com>
In-Reply-To: <3c7d5147-9eab-41fb-b8fb-ac1dc5befd19@amd.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 11 Apr 2024 09:05:38 +0200
Message-ID: <CAHUa44Ff1eZH1mTfLTGt4HgT1paVNyDumpAm838Z-AG_MG1Pqg@mail.gmail.com>
Subject: Re: [XEN PATCH v1 4/5] xen/arm: allow dynamically assigned SGI handlers
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, patches@linaro.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Thu, Apr 11, 2024 at 8:44=E2=80=AFAM Michal Orzel <michal.orzel@amd.com>=
 wrote:
>
> Hi Jens,
>
> On 11/04/2024 08:12, Jens Wiklander wrote:
> >
> >
> > Hi Michal,
> >
> > On Wed, Apr 10, 2024 at 3:24=E2=80=AFPM Michal Orzel <michal.orzel@amd.=
com> wrote:
> >>
> >> Hi Jens,
> >>
> >> On 09/04/2024 17:36, Jens Wiklander wrote:
> >>>
> >>>
> >>> Updates so request_irq() can be used with a dynamically assigned SGI =
irq
> >>> as input.
> >> At this point it would be handy to mention the use case for which you =
need to add this support
> >
> > OK, I'll add something like:
> > This prepares for a later patch where an FF-A schedule receiver
> > interrupt handler is installed for an SGI generated by the secure
> > world.
> ok
>
> >
> >>
> >>>
> >>> gic_route_irq_to_xen() don't gic_set_irq_type() for SGIs since they h=
ave
> >>> their type assigned earlier during boot
> >> Could you elaborate more on that? Do you mean that SGIs are always edg=
e triggered and there's no need
> >> for setting the type?
> >
> > Yes, see https://developer.arm.com/documentation/ihi0069/h
> > 4.4 Software Generated Interrupts
> > SGIs are typically used for inter-processor communication, and are
> > generated by a write to an SGI register in the
> > GIC. SGIs can be either Group 0 or Group 1 interrupts, and they can
> > support only edge-triggered behavior.
> Exactly. But you wrote "have their type assigned earlier during boot" whi=
ch is not true.
> There is no write to ICFGR0 in Xen codebase. They are implicitly edge tri=
ggered.
> So I would write:
> "... for SGIs since they are always edge triggered"

I'll use that instead.

Thanks,
Jens

>
> ~Michal

