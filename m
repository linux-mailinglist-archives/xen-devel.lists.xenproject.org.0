Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A78899A99CF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 08:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824027.1238109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t38Q4-0005lN-RL; Tue, 22 Oct 2024 06:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824027.1238109; Tue, 22 Oct 2024 06:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t38Q4-0005ie-Ok; Tue, 22 Oct 2024 06:31:04 +0000
Received: by outflank-mailman (input) for mailman id 824027;
 Tue, 22 Oct 2024 06:31:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bY6J=RS=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1t38Q3-0005iY-C4
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 06:31:03 +0000
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [2607:f8b0:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3382c388-903f-11ef-99a3-01e77a169b0f;
 Tue, 22 Oct 2024 08:31:00 +0200 (CEST)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3e5fb8a4e53so2296914b6e.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 23:31:00 -0700 (PDT)
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
X-Inumbo-ID: 3382c388-903f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729578659; x=1730183459; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZxJZnqUFr6BQdAzFP7rxLC2of8rlZYwZttZmH78GZQ=;
        b=hPfUw3l5wrgmhQy0Ndsrf7BRM4++vCXLXvhltse8rW5M9ps1Zr/WSM+N8PpcgjpPRC
         +4Y0xYciV/vjefAEM/Mmqtk/t7oKUTPO5rKis6KwkbTcSa9nDVPF9zFR6s2MeMc096Eo
         1Y9fbDz71PkdmTm+/IsuKUv3piS3QL+8nN43HWpHq5d+XcyPA1U6L1IaUVZghFEv0PHJ
         ML+HnJnaTWPXXwEgnpA0N7gSUIgmCXESU214V8YrfbkR/avVO6wm9w22oNmROsnY0M3l
         NwRYVX6hQSy3PtpM+qFSfTxlw5ahTTg5h8ftFMDc/gk6m2oT0vre3/JOSPpg4hmjrTh/
         rueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729578659; x=1730183459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZxJZnqUFr6BQdAzFP7rxLC2of8rlZYwZttZmH78GZQ=;
        b=r7SF63L5VU9XXb+TKGr0MLN3FpMprwba4mz+wtnp8e7wHbbQOh9GCv3dzhOToRldlJ
         cm7Ek72LwthDeUjh4HtgUqhWXjS0Lqcr2IO8fSm2io8o0XmiCZblYOCZcUMiyweZTozk
         Jct9CqkCW43jfJ5vGs3cmCqshM00xUJbKGz7Oyn8ypjTVzKtWhfzPI1Tqt2IcPdncwIT
         /HMaeVjate5vi+yBImk6QWBvd3fYWZ8FH6dBZBFk0vWqUB9ZwJ7Ua4n1Ij5mMQ376IP2
         aqedOAiuyj/1xRWmyEQggFnd7Dda7gLTStPAZfeMVNrtToaSuydJB807PpInDRsy6ahp
         /Eww==
X-Gm-Message-State: AOJu0YzuXf5nsoA0qRIFa1IzYycQSTQpZ95cmyoYDwiJMHl2Ib2WFUAu
	awuom/ckNbYqg3bgRH5tiOPDZICQbCoKjF+Xmnk1pfKXB2ITP35xiEEWTTZsc0O1awXAJwnJg/k
	l7TkHuidSgTDBu06wxFrC0pB+iPRvQx9hs6qmbg==
X-Google-Smtp-Source: AGHT+IErRlY6x7QLrMqBSYMyWjWkEbNuoIuDUw1hefP9RnPVH2Eu4sdhKjNB4ItCpM2nUAZ5gsm6x+2kNl2U/2iBeno=
X-Received: by 2002:a05:6870:8086:b0:288:679e:ca8a with SMTP id
 586e51a60fabf-28caff1eb49mr1592236fac.18.1729578658760; Mon, 21 Oct 2024
 23:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729066788.git.bertrand.marquis@arm.com> <8cc7abbd82b43aa595ddc2dce3495663dfc413e0.1729066788.git.bertrand.marquis@arm.com>
In-Reply-To: <8cc7abbd82b43aa595ddc2dce3495663dfc413e0.1729066788.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 22 Oct 2024 08:30:47 +0200
Message-ID: <CAHUa44GUxXLmeUon5JbxcEcKqyitaC6-2FmZFAW37daqyVg-CQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] xen/arm: ffa: Rework feature discovery
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
> Store the list of ABI we need in a list and go through the list instead
> of having a list of conditions inside the code.
>
> No functional change.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
> - Store a string version of ABI needed from firmware and print the name
>   of the ABI not supported instead of the id
> - Restore comment with TODO which should not have been removed at this
>   stage
> - fix to unsigned int the index in the loop on the array
> - use abi instead of feature in the names of the functions and variables
>   as we are not checking features but abis
> ---
>  xen/arch/arm/tee/ffa.c | 57 +++++++++++++++++++++++++-----------------
>  1 file changed, 34 insertions(+), 23 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 1cc4023135d5..dde932422ecf 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -74,6 +74,31 @@
>  /* Negotiated FF-A version to use with the SPMC, 0 if not there or suppo=
rted */
>  static uint32_t __ro_after_init ffa_fw_version;
>
> +struct ffa_fw_abi {
> +    const uint32_t id;

I prefer removing the const attribute for this struct member since it
doesn't add anything when the struct itself is const.

Cheers,
Jens

> +    const char *name;
> +};
> +
> +#define FW_ABI(abi) {abi,#abi}
> +
> +/* List of ABI we use from the firmware */
> +static const struct ffa_fw_abi ffa_fw_abi_needed[] =3D {
> +    FW_ABI(FFA_VERSION),
> +    FW_ABI(FFA_FEATURES),
> +    FW_ABI(FFA_NOTIFICATION_BITMAP_CREATE),
> +    FW_ABI(FFA_NOTIFICATION_BITMAP_DESTROY),
> +    FW_ABI(FFA_PARTITION_INFO_GET),
> +    FW_ABI(FFA_NOTIFICATION_INFO_GET_64),
> +    FW_ABI(FFA_NOTIFICATION_GET),
> +    FW_ABI(FFA_RX_RELEASE),
> +    FW_ABI(FFA_RXTX_MAP_64),
> +    FW_ABI(FFA_RXTX_UNMAP),
> +    FW_ABI(FFA_MEM_SHARE_32),
> +    FW_ABI(FFA_MEM_SHARE_64),
> +    FW_ABI(FFA_MEM_RECLAIM),
> +    FW_ABI(FFA_MSG_SEND_DIRECT_REQ_32),
> +    FW_ABI(FFA_MSG_SEND_DIRECT_REQ_64),
> +};
>
>  /*
>   * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
> @@ -112,20 +137,9 @@ static bool ffa_get_version(uint32_t *vers)
>      return true;
>  }
>
> -static int32_t ffa_features(uint32_t id)
> -{
> -    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
> -}
> -
> -static bool check_mandatory_feature(uint32_t id)
> +static bool ffa_abi_supported(uint32_t id)
>  {
> -    int32_t ret =3D ffa_features(id);
> -
> -    if ( ret )
> -        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing: error =
%d\n",
> -               id, ret);
> -
> -    return !ret;
> +    return !ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
>  }
>
>  static void handle_version(struct cpu_user_regs *regs)
> @@ -540,17 +554,14 @@ static bool ffa_probe(void)
>       * TODO: Rework the code to allow domain to use a subset of the
>       * features supported.
>       */
> -    if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
> -         !check_mandatory_feature(FFA_RX_RELEASE) ||
> -         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
> -         !check_mandatory_feature(FFA_MEM_SHARE_64) ||
> -         !check_mandatory_feature(FFA_RXTX_UNMAP) ||
> -         !check_mandatory_feature(FFA_MEM_SHARE_32) ||
> -         !check_mandatory_feature(FFA_MEM_RECLAIM) ||
> -         !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> +    for ( unsigned int i =3D 0; i < ARRAY_SIZE(ffa_fw_abi_needed); i++ )
>      {
> -        printk(XENLOG_ERR "ffa: Mandatory feature not supported by fw\n"=
);
> -        goto err_no_fw;
> +        if ( !ffa_abi_supported(ffa_fw_abi_needed[i].id) )
> +        {
> +            printk(XENLOG_INFO "ARM FF-A Firmware does not support %s\n"=
,
> +                   ffa_fw_abi_needed[i].name);
> +            goto err_no_fw;
> +        }
>      }
>
>      ffa_fw_version =3D vers;
> --
> 2.47.0
>

