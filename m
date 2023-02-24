Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B53C6A1847
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 09:51:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500835.772356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVTng-0002Ng-F8; Fri, 24 Feb 2023 08:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500835.772356; Fri, 24 Feb 2023 08:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVTng-0002KS-Bl; Fri, 24 Feb 2023 08:51:32 +0000
Received: by outflank-mailman (input) for mailman id 500835;
 Fri, 24 Feb 2023 08:51:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zq+K=6U=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pVTne-0002KM-SO
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 08:51:31 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d3a186a-b420-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 09:51:28 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so1260583wmi.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 00:51:28 -0800 (PST)
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
X-Inumbo-ID: 6d3a186a-b420-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X1mdx/OmEb8A0WHU0tYJy+7wzgp+QOYGoETAK05aUS4=;
        b=f3kv+t7rtbxyNQ6Escl0U1jR8oWPaLxnjfNiBvoNCJpxtRY7fSFqecjCNnWIUzlvpk
         gSuZFGfH9aBgn4ATvNLgFbSe9rnEHnzu+NcM8Uh8r3uM/KeAUjvleGk+Eg52fQ9h9KrX
         Rb6v3CZAi4eGIVna9F6G/CcQSY/FC/shbpptwrScHYZo6gkDSQjIQXT0c6nUqEGzMSO7
         l5O+nriuic1JtHL8TRzCD78eom9nacObcmuBUNWZcvElnEHYMvmxAupMlaIqfLGK5zs+
         OYRMm8kUz/yoOpdQSvEJXSL9iWd7H8Ve9HW0Hyw4knf9vJs5Za5heLfXGQVG+4T9ONgJ
         1sLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1mdx/OmEb8A0WHU0tYJy+7wzgp+QOYGoETAK05aUS4=;
        b=XCpvFJAWzDNqyxBztS4WUEcGOFXTFX/h/9O3MsGM4pfyxn86z+zLOUuEkrBcc8O9rg
         +Gg0eksZu9uiAuE2CFZsAqqiv+T1U/4ShNNHUjmW6wh8dfXcvLH69Z7+EFcVeBXAZqTr
         Mh0UMetJOwJ9TG8L13g1pEp9PYh29bHLCod2EOyh1s17ofr0sZrr44kdg6/I1i/KgZq0
         m4ia26bwqB+QSb+058LGjNuWbSxC2P8niNTqeVtc1H0Ya74GLWjrhYa5/GOx5Krj3chL
         fBd1GnWyyWtBIgCk4xQiIfKxJiAPm/cZQ9m+x+jGgVS5zhrymDcFO81pG6WcYAGRrDxy
         u2LA==
X-Gm-Message-State: AO0yUKVXEVvA73nZaC49iuIhlUO8qQ7YX5OA5ssV1+aLcMk/ghC/pQlB
	oecOgwwSoD2OrnsmB/RAJ5nHD7dGH8AizKZo/rdKEg==
X-Google-Smtp-Source: AK7set+pW4rPYYjSEbs3DqP3qPNOsmhyrzk0AnicUSw/9YR7/4wJR7C7Hl0o2GLnh1rFyTN2iZ/nePR5JR7gkeXpf1c=
X-Received: by 2002:a05:600c:6017:b0:3e2:685:7dd8 with SMTP id
 az23-20020a05600c601700b003e206857dd8mr1078554wmb.4.1677228687872; Fri, 24
 Feb 2023 00:51:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <5f0a74b3e4f6cda56e780a739859537246d4892f.1677079672.git.jens.wiklander@linaro.org>
 <b8717603-b645-0d8c-6d5b-e8af642edd17@xen.org>
In-Reply-To: <b8717603-b645-0d8c-6d5b-e8af642edd17@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 24 Feb 2023 09:51:17 +0100
Message-ID: <CAHUa44FV8daRj9otyXJbEthYQ75EhiNxbNiRZ6-A9M34jab4vw@mail.gmail.com>
Subject: Re: [XEN PATCH v7 02/20] xen/arm: tee: add a primitive FF-A mediator
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
	Marc Bonnici <marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Feb 23, 2023 at 3:43 PM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> I have only skimmed through the patch so far and I have one question below.
>
> On 22/02/2023 15:32, Jens Wiklander wrote:
> > Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
> > Partition in secure world.
> >
> > This commit brings in only the parts needed to negotiate FF-A version
> > number with guest and SPMC.
> >
> > [1] https://developer.arm.com/documentation/den0077/e
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >   xen/arch/arm/include/asm/domain.h  |   2 +-
> >   xen/arch/arm/include/asm/psci.h    |   4 +
> >   xen/arch/arm/include/asm/tee/ffa.h |  35 +++++
> >   xen/arch/arm/tee/Kconfig           |  11 ++
> >   xen/arch/arm/tee/Makefile          |   1 +
> >   xen/arch/arm/tee/ffa.c             | 217 +++++++++++++++++++++++++++++
> >   xen/arch/arm/vsmc.c                |  17 ++-
> >   xen/include/public/arch-arm.h      |   1 +
> >   8 files changed, 284 insertions(+), 4 deletions(-)
> >   create mode 100644 xen/arch/arm/include/asm/tee/ffa.h
> >   create mode 100644 xen/arch/arm/tee/ffa.c
> >
> > diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> > index 0e310601e846..754daa8efa04 100644
> > --- a/xen/arch/arm/include/asm/domain.h
> > +++ b/xen/arch/arm/include/asm/domain.h
> > @@ -110,7 +110,7 @@ struct arch_domain
> >       struct vpl011 vpl011;
> >   #endif
> >
> > -#ifdef CONFIG_TEE
> > +#if defined(CONFIG_TEE) || defined(CONFIG_FFA)
> I am confused, AFAICT, you are implementing FFA using TEE, so doesn't
> this mean that CONFIG_FFA depends on CONFIG_TEE?
>
> If so, then you should not need the extra defined here.

You're right, I'll fix it.

Thanks,
Jens

>
> >       void *tee;
> >   #endif
>
> --
> Julien Grall

