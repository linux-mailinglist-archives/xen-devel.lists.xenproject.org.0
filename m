Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8C28A0824
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 08:13:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703758.1099616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1runfZ-0003LS-FL; Thu, 11 Apr 2024 06:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703758.1099616; Thu, 11 Apr 2024 06:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1runfZ-0003Ji-Br; Thu, 11 Apr 2024 06:12:21 +0000
Received: by outflank-mailman (input) for mailman id 703758;
 Thu, 11 Apr 2024 06:12:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlLc=LQ=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1runfY-0003Jc-55
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 06:12:20 +0000
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [2607:f8b0:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72a208e2-f7ca-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 08:12:18 +0200 (CEST)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3c5ed7fdbb1so356248b6e.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 23:12:18 -0700 (PDT)
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
X-Inumbo-ID: 72a208e2-f7ca-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712815937; x=1713420737; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDLR2cQiVJpj2ibS9pKNPs30jJX2ec1Nam5LoH9bNXs=;
        b=uoHa3+qwWl3W+lKsQttI4QTT+UZvCUwe7RDFMWqNZo2OXpSOlJcRbV08lektuzAMBn
         m6DgtYvO2SYMisaeBou3KStlqesmomACaz/4YFvN6dYsc0yjrxiHWaGn2FX66a32JHH8
         O3scE4emcBDTWEgG+JA6M8uBix/JIMj7hfRkoA3A89N5xCLpZWZY8sDgm2IGzUnM6xN4
         Ekjfcq16o32kHXp+BjtwsixKVUdvml1i5h5QQFZsEgJYrHKykP6FPYxK2nslW3+9za3L
         HJzLFaLX45IhqTdd0DngPf8lTOzjMsb0vqVMknUjaBN51rxW8ghxbcC20v0rDOxtw66n
         Ft5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712815937; x=1713420737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDLR2cQiVJpj2ibS9pKNPs30jJX2ec1Nam5LoH9bNXs=;
        b=mdqj5B2GHuAlZq7Xbe1RXp7BrSb/9p8Cbmhmw4KfM8fw42IHtMQQZSOC6ZSFq0whvX
         VW2w3gZSQjptHHtDj+neuc7+DgplEnA5C0BOyJo96oHsyQkBgfkX63ALqT4CPmuE0SHm
         d0E1MOII6MyAHmskaTmteoLvtE6jb8zX88TMJiXefpQDNvD5W42/QB9h9veFI0s1Tf32
         gm5ORqhpFVXdAddeacWMFZ/McLTD16iT4aHfcqpkxdJ612ou7fYaT7BpW6i5njCj0K34
         P6SShSHQh8vjcFUOq1EGchqYBxoK+WAR9eNCR5I5AXWXcJhh6EN8OgCEPBbtCwe6KYku
         KbRA==
X-Gm-Message-State: AOJu0Yzc+JCX6xZrjpCWRwqbfDQ7FYnsS05W8o9ooWIdxwHF+AGihEQQ
	wjfN/oVnK5r1mVc5IhhU9I6vfL76vvi48ch+nMpUCXXGCaralgmmabh9Dtc5kwcDL0OvoIrpgXk
	bQ9S2r7iuZ4w2sYA5BLueqBGxxVkubbei4Huz/A==
X-Google-Smtp-Source: AGHT+IE/vr0ZSNWTYQfCvR1YPwutaCmKuo7M/n1GesNg7bv8zVlxbnKW4vmxCSxlHvvRMqn+W+47FK/HDy4NCTKPZPM=
X-Received: by 2002:a05:6808:130c:b0:3c5:dc82:d0f0 with SMTP id
 y12-20020a056808130c00b003c5dc82d0f0mr696721oiv.23.1712815936810; Wed, 10 Apr
 2024 23:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240409153630.2026584-1-jens.wiklander@linaro.org>
 <20240409153630.2026584-5-jens.wiklander@linaro.org> <da2d2945-5d94-40e8-a632-6ea8cbf3bcb9@amd.com>
In-Reply-To: <da2d2945-5d94-40e8-a632-6ea8cbf3bcb9@amd.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 11 Apr 2024 08:12:05 +0200
Message-ID: <CAHUa44ET8XOk9vvz3_ffazV=DHDmbrZzB_TUEv=_Z4Rp=1N2ag@mail.gmail.com>
Subject: Re: [XEN PATCH v1 4/5] xen/arm: allow dynamically assigned SGI handlers
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, patches@linaro.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Wed, Apr 10, 2024 at 3:24=E2=80=AFPM Michal Orzel <michal.orzel@amd.com>=
 wrote:
>
> Hi Jens,
>
> On 09/04/2024 17:36, Jens Wiklander wrote:
> >
> >
> > Updates so request_irq() can be used with a dynamically assigned SGI ir=
q
> > as input.
> At this point it would be handy to mention the use case for which you nee=
d to add this support

OK, I'll add something like:
This prepares for a later patch where an FF-A schedule receiver
interrupt handler is installed for an SGI generated by the secure
world.

>
> >
> > gic_route_irq_to_xen() don't gic_set_irq_type() for SGIs since they hav=
e
> > their type assigned earlier during boot
> Could you elaborate more on that? Do you mean that SGIs are always edge t=
riggered and there's no need
> for setting the type?

Yes, see https://developer.arm.com/documentation/ihi0069/h
4.4 Software Generated Interrupts
SGIs are typically used for inter-processor communication, and are
generated by a write to an SGI register in the
GIC. SGIs can be either Group 0 or Group 1 interrupts, and they can
support only edge-triggered behavior.

How about:
SGI should only be configured as edge triggered.

Thanks,
Jens

>
> >
> > gic_interrupt() is updated to route the dynamically assigned SGIs to
> > do_IRQ() instead of do_sgi(). The latter still handles the statically
> > assigned SGI handlers like for instance GIC_SGI_CALL_FUNCTION.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Other than that, it LGTM:
> Acked-by: Michal Orzel <michal.orzel@amd.com>
>
> but I would like other maintainers (especially Julien) to cross check it.
>
> ~Michal

