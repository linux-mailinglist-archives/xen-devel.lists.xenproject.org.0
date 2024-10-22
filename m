Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F1C9A9939
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 08:07:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824020.1238099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t382K-0000CP-Up; Tue, 22 Oct 2024 06:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824020.1238099; Tue, 22 Oct 2024 06:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t382K-0000Ae-S3; Tue, 22 Oct 2024 06:06:32 +0000
Received: by outflank-mailman (input) for mailman id 824020;
 Tue, 22 Oct 2024 06:06:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bY6J=RS=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1t382J-00006Y-9q
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 06:06:31 +0000
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [2607:f8b0:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c739d6d8-903b-11ef-a0be-8be0dac302b0;
 Tue, 22 Oct 2024 08:06:30 +0200 (CEST)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-718119fc061so2052997a34.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 23:06:29 -0700 (PDT)
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
X-Inumbo-ID: c739d6d8-903b-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729577188; x=1730181988; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzP+E4jzsmuJ+iCaiHO2g6t+IVRtEuFceEfviBL8JT4=;
        b=e1NG+TA5cgogtnB/UsO0LBcorbhM0b4zEINvZnEYQwnIEKOnJRXBPgjr5081mVXe6F
         J0SJoS/FEdP0stkL50EA+aV0en3TUGUZh61W+9HBinkfXcDFtxsZFPc8CQx4JxKccuhK
         /1afJ4dQGYBmyWwR15tNlurpDQP25d02Ff5bn77f6Y5spMI+VNEhlCYZq3c+WzixWyR3
         TgvLxxjQqiI4EBl3QZl2J5ZApM0qzvPzbp8ZpqefMUE+0ITvD/2RcBdrXaALgl1MOI7q
         NYYsCaDKE95JMtOakAQtezahlcFbpwIFyl+BG6I1OwER/OV6qbn8nbLEa2TFuTsYCN5I
         I7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729577188; x=1730181988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzP+E4jzsmuJ+iCaiHO2g6t+IVRtEuFceEfviBL8JT4=;
        b=OiR174bFS/DzY/TwFlVPCCIgjttxcTj3bMthTIcTNXo6ena3mAt7gOV7XAViySeZQw
         EvmOepCTcacbQNS5qvyYpli6mXGtXYzCmWipgj5LfisjqmNgVtoJ4wna+F35tRK9ks2H
         9uij6n8Pz2hA+wz8fMJLGv8LApQHLYBCRBXSfsw9/8CYCo+U7dZqcn2qCQp2VHL/9NWC
         NyUYvo/Zqaqf6qXP2UbUt0NY9+JXBF3697KYcyVlErZPVVzjr7fK3LGp/91XBTiWScQr
         Tjo9Wkgdd1/AZMjhb+BsNicecfbBTJW34AkcdHzz3ew2P1iX7VQ7JSxozDTzVv01s1tT
         Ag9Q==
X-Gm-Message-State: AOJu0YxQxW6SzcKwOs6thQFPKJucnSosPcXR6scCg9hRdFFfZUPsjIiO
	2HpPFN8L/SSWnnc6JfoFouwwHJcktrwa3se3uDawXOYpjBy+9ZRtRUme0ByjhSRWzLVnA/3n5g8
	DtG6LCLnTp0CBZHfvLGiJxhaCqhqr/37w1w26mg==
X-Google-Smtp-Source: AGHT+IGAQE98aBWxbKbnL7UlgpwA3rkDWyZaJRxEXUe74lesnibvR0DVyRORftJERc9wuhyPrwOItLb3jUwwUQs6U+Q=
X-Received: by 2002:a05:6871:b22:b0:261:164e:d12a with SMTP id
 586e51a60fabf-2892c34c6f7mr11019531fac.22.1729577188486; Mon, 21 Oct 2024
 23:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729066788.git.bertrand.marquis@arm.com>
 <457020b684e87ee9ad9488a4ec0d17ade90fdea1.1729066788.git.bertrand.marquis@arm.com>
 <CAHUa44FDQPepdzM1q+6QjB+fA4C+0OnC3-+Na6KMD_AVAeQadw@mail.gmail.com>
In-Reply-To: <CAHUa44FDQPepdzM1q+6QjB+fA4C+0OnC3-+Na6KMD_AVAeQadw@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 22 Oct 2024 08:06:17 +0200
Message-ID: <CAHUa44EV7EAoWGfKBgnv4BPuU_rAvD_jcOozqC0CgZWUzo0Mug@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] xen/arm: ffa: Rework firmware discovery
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 7:03=E2=80=AFPM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> Hi Bertrand,
>
> On Wed, Oct 16, 2024 at 10:32=E2=80=AFAM Bertrand Marquis
> <bertrand.marquis@arm.com> wrote:
> >
> > Rework firmware discovery during probe:
> > - move prints into the probe
> > - rename ffa_version to ffa_fw_version as the variable identifies the
> >   version of the firmware and not the one we support
> > - add error prints when allocation fail during probe
> >
> > No functional changes.
> >
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > ---
> > Changes in v2:
> > - Fix error message when we fail to retrieve ffa_version
> > - Move back printing the firmware version before checking supported
> >   features
> > - Use Warning instead of Info to inform user that FF-A is not supported
> >   in firmware.
> > ---
> >  xen/arch/arm/tee/ffa.c | 44 ++++++++++++++++++++++++++----------------
> >  1 file changed, 27 insertions(+), 17 deletions(-)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index 022089278e1c..1cc4023135d5 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -71,8 +71,8 @@
> >
> >  #include "ffa_private.h"
> >
> > -/* Negotiated FF-A version to use with the SPMC */
> > -static uint32_t __ro_after_init ffa_version;
> > +/* Negotiated FF-A version to use with the SPMC, 0 if not there or sup=
ported */
> > +static uint32_t __ro_after_init ffa_fw_version;
> >
> >
> >  /*
> > @@ -105,10 +105,7 @@ static bool ffa_get_version(uint32_t *vers)
> >
> >      arm_smccc_1_2_smc(&arg, &resp);
> >      if ( resp.a0 =3D=3D FFA_RET_NOT_SUPPORTED )
> > -    {
> > -        gprintk(XENLOG_ERR, "ffa: FFA_VERSION returned not supported\n=
");
> >          return false;
> > -    }
> >
> >      *vers =3D resp.a0;
> >
> > @@ -372,7 +369,7 @@ static int ffa_domain_init(struct domain *d)
> >      struct ffa_ctx *ctx;
> >      int ret;
> >
> > -    if ( !ffa_version )
> > +    if ( !ffa_fw_version )
> >          return -ENODEV;
> >       /*
> >        * We can't use that last possible domain ID or ffa_get_vm_id() w=
ould
> > @@ -505,6 +502,9 @@ static bool ffa_probe(void)
> >       */
> >      BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE);
> >
> > +    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
> > +           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
> > +
> >      /*
> >       * psci_init_smccc() updates this value with what's reported by EL=
-3
> >       * or secure world.
> > @@ -514,22 +514,24 @@ static bool ffa_probe(void)
> >          printk(XENLOG_ERR
> >                 "ffa: unsupported SMCCC version %#x (need at least %#x)=
\n",
> >                 smccc_ver, ARM_SMCCC_VERSION_1_2);
> > -        return false;
> > +        goto err_no_fw;
> >      }
> >
> >      if ( !ffa_get_version(&vers) )
> > -        return false;
> > +    {
> > +        gprintk(XENLOG_ERR, "Cannot retrieve the FFA version\n");
> > +        goto err_no_fw;
> > +    }
> >
> >      if ( vers < FFA_MIN_SPMC_VERSION || vers > FFA_MY_VERSION )
> >      {
> >          printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", ver=
s);
> > -        return false;
> > +        goto err_no_fw;
> >      }
> >
> > -    major_vers =3D (vers >> FFA_VERSION_MAJOR_SHIFT) & FFA_VERSION_MAJ=
OR_MASK;
> > +    major_vers =3D (vers >> FFA_VERSION_MAJOR_SHIFT)
> > +                 & FFA_VERSION_MAJOR_MASK;
>
> Spurious change?
>
> >      minor_vers =3D vers & FFA_VERSION_MINOR_MASK;
> > -    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
> > -           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
>
> It's not a big deal, but isn't it useful to know which version we're
> at? If it's too much with a separate line, how about adding "(our
> version %u.u%)" at the end of the line below?

Please ignore this comment, I missed this was moved up a few lines.

Thanks,
Jens

>
> >      printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
> >             major_vers, minor_vers);
> >
> > @@ -546,12 +548,18 @@ static bool ffa_probe(void)
> >           !check_mandatory_feature(FFA_MEM_SHARE_32) ||
> >           !check_mandatory_feature(FFA_MEM_RECLAIM) ||
> >           !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> > -        return false;
> > +    {
> > +        printk(XENLOG_ERR "ffa: Mandatory feature not supported by fw\=
n");
> > +        goto err_no_fw;
> > +    }
> >
> > -    if ( !ffa_rxtx_init() )
> > -        return false;
> > +    ffa_fw_version =3D vers;
> >
> > -    ffa_version =3D vers;
> > +    if ( !ffa_rxtx_init() )
> > +    {
> > +        printk(XENLOG_ERR "ffa: Error during RXTX buffer init\n");
>
> With this added, wouldn't it make sense to remove the error print in
> ffa_rxtx_init()?
>
> Cheers,
> Jens
>
> > +        goto err_no_fw;
> > +    }
> >
> >      if ( !ffa_partinfo_init() )
> >          goto err_rxtx_destroy;
> > @@ -564,7 +572,9 @@ static bool ffa_probe(void)
> >
> >  err_rxtx_destroy:
> >      ffa_rxtx_destroy();
> > -    ffa_version =3D 0;
> > +err_no_fw:
> > +    ffa_fw_version =3D 0;
> > +    printk(XENLOG_WARNING "ARM FF-A No firmware support\n");
> >
> >      return false;
> >  }
> > --
> > 2.47.0
> >

