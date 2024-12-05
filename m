Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C5C9E5A8A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 17:00:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849159.1263824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJEGH-0006sK-M7; Thu, 05 Dec 2024 15:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849159.1263824; Thu, 05 Dec 2024 15:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJEGH-0006pU-JM; Thu, 05 Dec 2024 15:59:29 +0000
Received: by outflank-mailman (input) for mailman id 849159;
 Thu, 05 Dec 2024 15:59:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1V0d=S6=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1tJEGG-0006pO-Cd
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 15:59:28 +0000
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [2001:4860:4864:20::31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e67d9c81-b321-11ef-99a3-01e77a169b0f;
 Thu, 05 Dec 2024 16:59:26 +0100 (CET)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-29e5bf419ebso366949fac.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2024 07:59:26 -0800 (PST)
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
X-Inumbo-ID: e67d9c81-b321-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733414365; x=1734019165; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEhcfAlqoTBbddD5bKETueYddtGFrbPHE/WdJaY9dts=;
        b=hRQEE+lZN+HDXq8fFzNo/5ps3Lmf48brx5PP7ybMq+pHNpDiP/cBo15ilRXSxHDOLO
         k17RlEoXDNfpMUIwJFYPOJv4V7GPVCHjoqF06k2jp0j6WOs8yoC7UoGHEJSE4Ju48diZ
         kXWcooBQ/FLSf/ssNKeTQIZhurYrWQod0Rhr1joA79vxHVpj3mCGzgDGZjZ7enuE8RY2
         ysff6VflP5ilVilt3H4h1EaQGeMaIp6oYUQDecqij82gX2FSw5SisjyKHYgVhW/N78aa
         9WedwZt2/mqgNLsWCSviAfE2L+1j1EGOARJYDtq6YjiAmaURqiNBw4IQzx8aAtH0nf7H
         KgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733414365; x=1734019165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEhcfAlqoTBbddD5bKETueYddtGFrbPHE/WdJaY9dts=;
        b=tR7jzSkaXnFw9Kqd4/fM4R2jx7MnhqHdEgKbhNctJAZqSEJJL/SlzNnXgdv2ZEYPfh
         Ac9sqp2IJ7M9AAt/WMcACw+znIuius5PpK/GulIoqPWwzeMSIeFMDEBwQm7QQMpQAtrT
         0YJYn++qLtO+ByBMa+UU1Og2VNHG4YHPRdwJcJp20QQjg9S1+JJ7Tzesx1YMGZ8woW47
         9zpfJVFFyo3I5Q/zSqP0q2CaQPl/DqODcxkpYPu072w+UWk/MAiSL+zWNIx8bdxeR435
         yDA2OyY9UNEX4JFs521dMhdOAsKMKpDpI5uuk2np29e/eqkU0UtRphDOKhx8YrdUwN/h
         RYig==
X-Gm-Message-State: AOJu0YwlvqhSz1irC719T8vdsSKLOhWTal910GStsBoNAVx5WvdZppmA
	I7iXxSTjPFTeh/vCDJY3scDjNbTiV5xamIJUvCEpUxX5c8knZtEuFdBqDpAzaCbrMi9C3bBBvgX
	x+M4SbWGlX9vmYk8ClT1Y9Gl6cQxs1EsjlHJU7w==
X-Gm-Gg: ASbGncuodFr8cy/hDHrteHRZEHyaKeWmnMYdSLzlZs6jwlXOkvOYOtT63n167RtRQJe
	il/avnUCiBsxR+5cBv8QPYbvA4C7YnII=
X-Google-Smtp-Source: AGHT+IEjd9sgTFDcE3GmnYLGWqbSJ7I3AAIoACD5wqxEDTEIIZ65YvLOWuA64cztc9TKxgyG76q6rr7xN0k3wj6Hlo4=
X-Received: by 2002:a05:6871:10d:b0:29e:20c4:2217 with SMTP id
 586e51a60fabf-29e888949cfmr9408376fac.33.1733414364789; Thu, 05 Dec 2024
 07:59:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1732702210.git.bertrand.marquis@arm.com> <244dc07cda4cdba30e305f62818141444223a4e4.1732702210.git.bertrand.marquis@arm.com>
In-Reply-To: <244dc07cda4cdba30e305f62818141444223a4e4.1732702210.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 5 Dec 2024 16:59:13 +0100
Message-ID: <CAHUa44EmOwzBnQXjDEHakzGfmsOh2Tim5S46nWHNhAeYbxydjg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] xen/arm: ffa: Rework feature discovery
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
> Store the list of ABI we need in a list and go through the list instead
> of having a list of conditions inside the code.
>
> No functional change.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v3:
> - remove const attribute for id in ffa_fw_abi struct
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

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 5a7f297ca5c6..ade6aaa6fd1d 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -74,6 +74,31 @@
>  /* Negotiated FF-A version to use with the SPMC, 0 if not there or suppo=
rted */
>  static uint32_t __ro_after_init ffa_fw_version;
>
> +struct ffa_fw_abi {
> +    uint32_t id;
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
> @@ -539,17 +553,14 @@ static bool ffa_probe(void)
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

