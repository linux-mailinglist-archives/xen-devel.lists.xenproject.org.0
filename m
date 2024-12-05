Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A1C9E58C7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 15:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849083.1263784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJD6Y-0004wN-VK; Thu, 05 Dec 2024 14:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849083.1263784; Thu, 05 Dec 2024 14:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJD6Y-0004tY-RO; Thu, 05 Dec 2024 14:45:22 +0000
Received: by outflank-mailman (input) for mailman id 849083;
 Thu, 05 Dec 2024 14:45:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1V0d=S6=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1tJD6X-0004tS-BA
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 14:45:21 +0000
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [2607:f8b0:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c72bee6-b317-11ef-a0d5-8be0dac302b0;
 Thu, 05 Dec 2024 15:45:20 +0100 (CET)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3ea6b011b27so1002636b6e.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2024 06:45:20 -0800 (PST)
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
X-Inumbo-ID: 8c72bee6-b317-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733409919; x=1734014719; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZgRQhHyuN6yCF0EyJMCVjUH6Tzf65Z7q3KGkJjdL+I=;
        b=jJRRuhnUF3f4Ifa5vCMiUHAcYtOjcITQoC3btnajHHBYk/w1Pv1tdUMou6s5j/lguO
         djd2TxK8a7GiXkJtppNSHcKbI1MhI6tedXVNrRHtkmEBkQBvj9cTkT/pcXDeiU1Gwrwr
         zaNq9ZQKojpziqHnOCrMaoNoN6yfguJo0RX6xmTIvymVcP/xRkx5BsMBXFPcOHtqKJjd
         BKpotagWOncrPzrzRxLwZOoa+ky7AVMVkckwYU8L5ijFCvGdSbOjXL5Y+krZDlOfL1vN
         xSf6Yz/XU/prA4Jp3WUXfdxTjqFNG6VZjCNRpUgSWNnAtZteP/WyMKL8/OXz5Pna1QIy
         7uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733409919; x=1734014719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZgRQhHyuN6yCF0EyJMCVjUH6Tzf65Z7q3KGkJjdL+I=;
        b=tth0TnIy0kIn6HeID9XJQEA03mabAgYiPbADckGjIUxfZEPEeTRrVq00WD84Y8Ohsb
         YD6KfXffZsGVSN3gA6slv+NLeliopfdWVCE/5Xdf5oXt27l8NwL7XSDP7C0DddPc5K5s
         SR5Eh5ENaH+efbAh1NTSiqvGXlF832cjelwWsprUPO6VCxiFsfASZPUUran2dok6dp7p
         NQNCyDwe6p9ubrVFOF7NRkW/jiMyo95e2dUX/92DmohAm5YSzrXGJzKAGXLUp9rEU5mN
         ljsBnkSWSCNn+AvhyZ8baRhzIt+l3YGl35x3FJ/H47ICh31sfolT9aON1cw/ALBNn452
         lV3w==
X-Gm-Message-State: AOJu0Yw7HliyoF4YBAc+MX6D+SYUyqKYWLpyC77BBKd0F6EoKBtEiOfW
	mm8+3n1Et9eEt0ix7v7rB7QSJqBGX8YlfcFdiiXSoXVS6SY/8AVOLKgc8dzhXfY6ARZeCZHxRet
	4X0J/EW32MhnLecN0bXfBq2jTVXXnyaWOZJOigA==
X-Gm-Gg: ASbGncvh14o1bS0f+3H9UTlskIx13+glAHCzvYkSAn11ByxFFCLlZSkgAL7C0zQm3jA
	1oQtkqbkcR8ZuS+M7j7CIoZWwA1QFGno=
X-Google-Smtp-Source: AGHT+IG4gPj3qtGbAP5V8CtdEkijrF4OGCFB/CjfZ4qb0ghLH56gKmObG2NZ9wXuhszmqWv90lT3+PIC1poPFQOpz+g=
X-Received: by 2002:a05:6808:182a:b0:3e7:9e8c:304f with SMTP id
 5614622812f47-3eb045add67mr1552844b6e.7.1733409918705; Thu, 05 Dec 2024
 06:45:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1732702210.git.bertrand.marquis@arm.com> <3fcc536cd2e13d0421839fc6890daeda71cfac44.1732702210.git.bertrand.marquis@arm.com>
In-Reply-To: <3fcc536cd2e13d0421839fc6890daeda71cfac44.1732702210.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 5 Dec 2024 15:45:07 +0100
Message-ID: <CAHUa44GoKNSvxzUT5Xox6Rxyyxa6BkA_0g2aLADT+5q0-158=A@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] xen/arm: ffa: Rework firmware discovery
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Wed, Nov 27, 2024 at 5:08=E2=80=AFPM Bertrand Marquis
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
> Changes in v3:
> - Revert spurious change assigning major_vers
> - Remove error print in ffa_rxtx_init as we have already a print in the
>   main init function
> Changes in v2:
> - Fix error message when we fail to retrieve ffa_version
> - Move back printing the firmware version before checking supported
>   features
> - Use Warning instead of Info to inform user that FF-A is not supported
>   in firmware.
> ---
>  xen/arch/arm/tee/ffa.c      | 41 ++++++++++++++++++++++---------------
>  xen/arch/arm/tee/ffa_rxtx.c |  4 +---
>  2 files changed, 26 insertions(+), 19 deletions(-)

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 022089278e1c..5a7f297ca5c6 100644
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
> @@ -514,22 +514,23 @@ static bool ffa_probe(void)
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
>      major_vers =3D (vers >> FFA_VERSION_MAJOR_SHIFT) & FFA_VERSION_MAJOR=
_MASK;
>      minor_vers =3D vers & FFA_VERSION_MINOR_MASK;
> -    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
> -           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
>      printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>             major_vers, minor_vers);
>
> @@ -546,12 +547,18 @@ static bool ffa_probe(void)
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
> +        goto err_no_fw;
> +    }
>
>      if ( !ffa_partinfo_init() )
>          goto err_rxtx_destroy;
> @@ -564,7 +571,9 @@ static bool ffa_probe(void)
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
> diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
> index 661764052e67..c8bc516a19be 100644
> --- a/xen/arch/arm/tee/ffa_rxtx.c
> +++ b/xen/arch/arm/tee/ffa_rxtx.c
> @@ -203,10 +203,8 @@ bool ffa_rxtx_init(void)
>
>      e =3D ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), FFA_RXTX_PAGE_COUNT);
>      if ( e )
> -    {
> -        printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", e);
>          goto err;
> -    }
> +
>      return true;
>
>  err:
> --
> 2.47.0
>

