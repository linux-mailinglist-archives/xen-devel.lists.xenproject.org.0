Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78642A6B801
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:49:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923779.1327201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvZ05-00050B-6V; Fri, 21 Mar 2025 09:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923779.1327201; Fri, 21 Mar 2025 09:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvZ05-0004xt-3W; Fri, 21 Mar 2025 09:49:13 +0000
Received: by outflank-mailman (input) for mailman id 923779;
 Fri, 21 Mar 2025 09:49:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9U11=WI=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tvZ04-0004IO-EQ
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:49:12 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be04a8f4-0639-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 10:49:12 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-30761be8fa8so18155501fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 02:49:11 -0700 (PDT)
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
X-Inumbo-ID: be04a8f4-0639-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742550551; x=1743155351; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uT5ysCcxIKwBiRvojCME7s4lzXhMGLWNOOZwbAthCM=;
        b=M5YyFNPOBxi0F4CpAvyHknIWmSKuL/1DCfstlH4BBAECs5TERUi023tqnIBWb3/kGG
         b3RaabWMHqZVK+7CPm07ktyQNlep6TJro1tZPeNz4r4V/9UxGEc7aqcIRlWHSN2ZAGsN
         zywdBZRLKdhW3zn4MlOx08j/CheaMSZoO67YtRupjIeOrOdMnXtmdPP6ya6zFtFKPLTz
         ZT/a/XpFutAiPnTOWsPJzubP8v+cHzjPmZjapakHmXlnJU8XRtzcEUqQ9JyNR/whnqAt
         Xnhtc5Qdof/ZN2/gUI7VFZE3fxEPObUC3TXq+KDE555mseSiFSlTgaRlkzGlqh8aBEbA
         Pf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742550551; x=1743155351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uT5ysCcxIKwBiRvojCME7s4lzXhMGLWNOOZwbAthCM=;
        b=YSeShg8F8RqideEgSdDWXx5Si5N47Pmy5p+foChwHDzHNhMorFoItz7VvBlLZ5OcHI
         JFpBJu/Gml6VPYmstk2IEFg2zZ+9iLR/lks0O2RLJ9xskepWHMAPzLMXBKpVNvH3Z3CT
         RZbFuAcdjVp29yLyi2w0QvekqZe1nWBG3buu9ve1JsvwKniTVuV73Nt7r1m35YCPRvQt
         GrdIZiIbFG9NYCF32PV+M2pEFYXj5L43I2QJRRogwIEIzgzOuV91mE9RDZK7wHNygFwe
         72MBWwiOCJw3McGWMZVIOQUPwtnhX+uq2SYAAvy8qaCGrrZFWM//jLO/923lLsPiu01p
         fJpA==
X-Gm-Message-State: AOJu0YwqE3qDhkWip1L3f3MgphxhpPsCCfX2z8vVnwuZLQYWZV+MzXK/
	Ar4RijBy7t7vPX+9Pg/lC4FMGAunwahom/SR5LZY0m8ZYXnlxBDqENv1UfUbYcVVS5gxfrkE93j
	El3vp4Tz7loB+cjbPXguKUs/4sPc=
X-Gm-Gg: ASbGncs6KNx/+mhXVlZ3oBv39ph9NuKyM2J6P1oaecxR4R/QSQDcs6of9vroaMJCbza
	JN/Pzsa7B29jmwYtjayw9h4XZ0G84CFqKul/yKOU2J8lReaWfryknrcbOuik2xNl6JTLXT9x3E+
	RZCc/zNmzx3RHmNqJxSQ0P7rnH
X-Google-Smtp-Source: AGHT+IEww1+DZGs5zCeGvxMmhzjaDqwNhuFLTbFPfrajC/HLLJ/Otu83+JlUjzSv3UlSCHeJQFjZZjIBthJEL4ADcMk=
X-Received: by 2002:a05:6512:2311:b0:549:b10b:1efe with SMTP id
 2adb3069b0e04-54ad64f586fmr905096e87.32.1742550551303; Fri, 21 Mar 2025
 02:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <28da91c2859e0226585951ea3d6e7017b402ec0b.1741164138.git.xakep.amatop@gmail.com>
 <849e6163-141d-4c8a-a57f-e589a38dd38d@xen.org>
In-Reply-To: <849e6163-141d-4c8a-a57f-e589a38dd38d@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 21 Mar 2025 11:48:59 +0200
X-Gm-Features: AQ5f1JpAWHejSQsmoj0FA-ChaSOZEGDDhJU6M1kc--RHqcRKxFZxjkIQg7Nwmt0
Message-ID: <CAGeoDV9Ey9gnR=AGe13y0HtQ4UwoBOeD=LuY4KJud7jXuJ-h9g@mail.gmail.com>
Subject: Re: [PATCH 06/16] xen/arm: Introduce system suspend config option
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Mykyta Poturai <mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 12, 2025 at 12:29=E2=80=AFAM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi,
>
> On 05/03/2025 09:11, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > This option enables the system suspend support. This is the
> > mechanism that allows the system to be suspended to RAM and
> > later resumed.
> >
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >   xen/arch/arm/Kconfig | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index a26d3e1182..5834af16ab 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -475,6 +475,17 @@ config ARM64_HARDEN_BRANCH_PREDICTOR
> >   config ARM32_HARDEN_BRANCH_PREDICTOR
> >       def_bool y if ARM_32 && HARDEN_BRANCH_PREDICTOR
> >
> > +config SYSTEM_SUSPEND
> > +     bool "System suspend support"
> > +     default y
>
> The default should likely be no until everything is working.

got it!

>
> > +     depends on ARM_64
>
> I think this also needs to depends on !LLC_COLORING (unless you
> confirmed cache coloring is working) and UNSUPPORTED.

Sure! I'll add the dependency.

>
> > +     help
> > +       This option enables the system suspend support. This is the
> > +       mechanism that allows the system to be suspended to RAM and
> > +       later resumed.
>
> You seem to also tie guest suspend/resunme to this option. Is it intended=
?

From the guest's perspective, it is a system suspend. However, it looks lik=
e the
description should be enhanced. Thank you for pointing that out.

>
> Cheers,
>
> --
> Julien Grall
>

Best regards,
Mykola

