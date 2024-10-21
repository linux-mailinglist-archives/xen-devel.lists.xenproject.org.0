Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795F29A7082
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 19:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823859.1237936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2vp1-0003so-Gi; Mon, 21 Oct 2024 17:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823859.1237936; Mon, 21 Oct 2024 17:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2vp1-0003q8-E6; Mon, 21 Oct 2024 17:03:59 +0000
Received: by outflank-mailman (input) for mailman id 823859;
 Mon, 21 Oct 2024 17:03:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+0L=RR=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1t2voz-0003pr-Tn
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 17:03:57 +0000
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [2607:f8b0:4864:20::c36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75204ee3-8fce-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 19:03:57 +0200 (CEST)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5ebc22e6362so615035eaf.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 10:03:57 -0700 (PDT)
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
X-Inumbo-ID: 75204ee3-8fce-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729530236; x=1730135036; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pfhuas0OX4nfogXWgXqPLh1xPv2Vhux6R/Dr5csfTZk=;
        b=bY9Qd6wF8LPQZUZOrLtdSnXZ0rrEb+pwFIqUjMDSzllF6Lg74KQpxSem6117A0N7AK
         zdU9twRv0ofXZa69w8BZqWLyHZqbbmqRWOyjlPlp5O3EaJ2vLCXYzzOR+vrLYAAT7lAv
         ZChVoWyy2rZ8JV4JCNmJ/zneFzSRa+S1r8voumlcH8d4HlXQdPY4FQ8mCqIM2LcB1aFA
         8r/HY8cpqGRIC0Js5l7YkRdmJ2zmHKiCHi94TQOeJ8y0Wm3I1qh4b6O31qqRKwPBQQuD
         NnKnTvFVW4/WKE6MhHceXL1h70xJRiEw4B0myQVB3xy4i3gHeclYnwUA9QNQVRRVk5iK
         2yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729530236; x=1730135036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pfhuas0OX4nfogXWgXqPLh1xPv2Vhux6R/Dr5csfTZk=;
        b=tHrmB54lcRXPYXYWC70Zwfn4hGxLPHT6yNk7X50WjTxDguHhcHxxjhubFhHTj+GBqw
         kF7NhVB2QvZw64A8TKkgRoOIZEwnY9/4OVOvSMnX+kD14TSlom6c5cFAPFiQDHe3HfJb
         gio9D4FN7ff0OeQeR8RmTERO7oQU91TBWxsXfjYyivCTt9NmyG7ynFMG9SCtNePFnwlr
         X66vg1EqOWToBA9C/qbKsHeGzoJEkPoTU9QLfj1jIsKnYXkAwuiq3qNTefKEVtCmuIyT
         prLYKJ+2c/wnK9lpkRKWPd/mdF/GfYuf7GvqFBYLCZR6uU/urLxIHjjp8g9jjSIsu/X/
         BR1A==
X-Gm-Message-State: AOJu0YyWLzsGbKgho1ESwhj4/Omyiw2DMonsIjDP1vm2tQiQ0sZSOyrJ
	pxmVeIlQVXb0Ojk2Sk/FiNXLKgEox8kmo1DLVw/6ljOaMLwQabYutknGIzlIWCEUU+yKvvgsYE/
	veKwvSK5K3ouylHa8Zs4gtgjKI8PJ+g+8mF65VA==
X-Google-Smtp-Source: AGHT+IHeJmkqh+fjjd91jtyqq9WjogdxTQ63VprxCX1ey8SMHzMK3oz1WWMvd0h9i4jwjRz97PNeaxKqCeHOOPpgooc=
X-Received: by 2002:a05:6870:9a23:b0:287:7a8c:4f15 with SMTP id
 586e51a60fabf-2892c34d269mr9391130fac.20.1729530235706; Mon, 21 Oct 2024
 10:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729066788.git.bertrand.marquis@arm.com> <457020b684e87ee9ad9488a4ec0d17ade90fdea1.1729066788.git.bertrand.marquis@arm.com>
In-Reply-To: <457020b684e87ee9ad9488a4ec0d17ade90fdea1.1729066788.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 21 Oct 2024 19:03:43 +0200
Message-ID: <CAHUa44FDQPepdzM1q+6QjB+fA4C+0OnC3-+Na6KMD_AVAeQadw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] xen/arm: ffa: Rework firmware discovery
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Wed, Oct 16, 2024 at 10:32=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Rework firmware discovery during probe:
> - move prints into the probe
> - rename ffa_version to ffa_fw_version as the variable identifies the
>   version of the firmware and not the one we support
> - add error prints when allocation fail during probe
>
> No functional changes.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
> - Fix error message when we fail to retrieve ffa_version
> - Move back printing the firmware version before checking supported
>   features
> - Use Warning instead of Info to inform user that FF-A is not supported
>   in firmware.
> ---
>  xen/arch/arm/tee/ffa.c | 44 ++++++++++++++++++++++++++----------------
>  1 file changed, 27 insertions(+), 17 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 022089278e1c..1cc4023135d5 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -71,8 +71,8 @@
>
>  #include "ffa_private.h"
>
> -/* Negotiated FF-A version to use with the SPMC */
> -static uint32_t __ro_after_init ffa_version;
> +/* Negotiated FF-A version to use with the SPMC, 0 if not there or suppo=
rted */
> +static uint32_t __ro_after_init ffa_fw_version;
>
>
>  /*
> @@ -105,10 +105,7 @@ static bool ffa_get_version(uint32_t *vers)
>
>      arm_smccc_1_2_smc(&arg, &resp);
>      if ( resp.a0 =3D=3D FFA_RET_NOT_SUPPORTED )
> -    {
> -        gprintk(XENLOG_ERR, "ffa: FFA_VERSION returned not supported\n")=
;
>          return false;
> -    }
>
>      *vers =3D resp.a0;
>
> @@ -372,7 +369,7 @@ static int ffa_domain_init(struct domain *d)
>      struct ffa_ctx *ctx;
>      int ret;
>
> -    if ( !ffa_version )
> +    if ( !ffa_fw_version )
>          return -ENODEV;
>       /*
>        * We can't use that last possible domain ID or ffa_get_vm_id() wou=
ld
> @@ -505,6 +502,9 @@ static bool ffa_probe(void)
>       */
>      BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE);
>
> +    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
> +           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
> +
>      /*
>       * psci_init_smccc() updates this value with what's reported by EL-3
>       * or secure world.
> @@ -514,22 +514,24 @@ static bool ffa_probe(void)
>          printk(XENLOG_ERR
>                 "ffa: unsupported SMCCC version %#x (need at least %#x)\n=
",
>                 smccc_ver, ARM_SMCCC_VERSION_1_2);
> -        return false;
> +        goto err_no_fw;
>      }
>
>      if ( !ffa_get_version(&vers) )
> -        return false;
> +    {
> +        gprintk(XENLOG_ERR, "Cannot retrieve the FFA version\n");
> +        goto err_no_fw;
> +    }
>
>      if ( vers < FFA_MIN_SPMC_VERSION || vers > FFA_MY_VERSION )
>      {
>          printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers)=
;
> -        return false;
> +        goto err_no_fw;
>      }
>
> -    major_vers =3D (vers >> FFA_VERSION_MAJOR_SHIFT) & FFA_VERSION_MAJOR=
_MASK;
> +    major_vers =3D (vers >> FFA_VERSION_MAJOR_SHIFT)
> +                 & FFA_VERSION_MAJOR_MASK;

Spurious change?

>      minor_vers =3D vers & FFA_VERSION_MINOR_MASK;
> -    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
> -           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);

It's not a big deal, but isn't it useful to know which version we're
at? If it's too much with a separate line, how about adding "(our
version %u.u%)" at the end of the line below?

>      printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>             major_vers, minor_vers);
>
> @@ -546,12 +548,18 @@ static bool ffa_probe(void)
>           !check_mandatory_feature(FFA_MEM_SHARE_32) ||
>           !check_mandatory_feature(FFA_MEM_RECLAIM) ||
>           !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> -        return false;
> +    {
> +        printk(XENLOG_ERR "ffa: Mandatory feature not supported by fw\n"=
);
> +        goto err_no_fw;
> +    }
>
> -    if ( !ffa_rxtx_init() )
> -        return false;
> +    ffa_fw_version =3D vers;
>
> -    ffa_version =3D vers;
> +    if ( !ffa_rxtx_init() )
> +    {
> +        printk(XENLOG_ERR "ffa: Error during RXTX buffer init\n");

With this added, wouldn't it make sense to remove the error print in
ffa_rxtx_init()?

Cheers,
Jens

> +        goto err_no_fw;
> +    }
>
>      if ( !ffa_partinfo_init() )
>          goto err_rxtx_destroy;
> @@ -564,7 +572,9 @@ static bool ffa_probe(void)
>
>  err_rxtx_destroy:
>      ffa_rxtx_destroy();
> -    ffa_version =3D 0;
> +err_no_fw:
> +    ffa_fw_version =3D 0;
> +    printk(XENLOG_WARNING "ARM FF-A No firmware support\n");
>
>      return false;
>  }
> --
> 2.47.0
>

