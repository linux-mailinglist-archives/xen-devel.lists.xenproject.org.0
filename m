Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626E8A6EAB7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 08:39:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926083.1328935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twysn-0001QX-5T; Tue, 25 Mar 2025 07:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926083.1328935; Tue, 25 Mar 2025 07:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twysn-0001Nu-2C; Tue, 25 Mar 2025 07:39:33 +0000
Received: by outflank-mailman (input) for mailman id 926083;
 Tue, 25 Mar 2025 07:39:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B0qP=WM=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1twysl-0001No-S1
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 07:39:31 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48b2c865-094c-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 08:39:29 +0100 (CET)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-2c6ed7ec0a5so1416053fac.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 00:39:29 -0700 (PDT)
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
X-Inumbo-ID: 48b2c865-094c-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742888368; x=1743493168; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BS81KqZTnFpC3mAOczh6LrpUz0knVwLI1q0tTP9ubWM=;
        b=X4WAxQpAhR9ItZuR5oBN7NJY055QIGwfUD08XSMdC65U2keSdXDbeAj9imwbpEasTb
         BL36OLXsBN+1XsjTdiH7GSYiNOdoCypB4WCsBukMxOrMyfE4MAXZ5VBey+z84wj4RzhN
         MWSpOaKUrs8QWzbA4c0Q3clNNtrOnGI/TXNrUsuVJ/8TaLsTU+ltoAHZZcI6t9Eo0uJX
         qIat4eE27vYIwY74osTL6jRjAQIkzrnIrds/0b/2i8I/iMyux2V4UwFCu1RKPTu2Lc1j
         RqvyIPUvtqWOHL/41SwE+EhYtH7lRx9HiiwWBOx8Jz2kFelt3SLTmh1M0mtlBEoLNwUy
         CAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742888368; x=1743493168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BS81KqZTnFpC3mAOczh6LrpUz0knVwLI1q0tTP9ubWM=;
        b=Mi2vH96vJSgQ1EM/DLLKUeciiFfOFwpr0x70x6otuXaepOOXYIJaIezzrNgAMtt5Di
         /tPp1pMywFhWuV9YEr/IJOT0qSgU84Mb7KQKG2OarPlArtj40jENEutULPaHoUnz1Bg1
         cJ1c25uuiS1QaAtvnXiI3m1GJpI7VHKskBAyZRoGgbBg0fm2LZby8zjwCMIFZTeONUNa
         hiXrAjmZVcLVMeAMzZJv5tBoKgqa+AjleGZFtlJzwE7efbh8sDFq3GE24bk//aPcCFHd
         MQ+qZ9Uo7/0/JXYG2koLb0IGCMG7hBBJ/r0gUbA2uxEyuOOINI9PwZKQfg2lDdJOUQB/
         SqJQ==
X-Gm-Message-State: AOJu0YxPilek/C/ndkAhRo8ljuFK13aIsDg6BUumHhnMYi8S9ifIv5e9
	ACKZTigYs7zE//7VTfBvDfTJYSNKptAmGkuXiVA7Q17VxhVvw0h3B+ypD05JxqodYJD4Acd9pKx
	BmC4uKtF+AOUAsyOEfTRTK2iyFcHFXJGH5Kng2g==
X-Gm-Gg: ASbGncuseeLFccZRGpZEvmH42qh0n14kXNOjVNO2KvDIxjFmhvcVjdpEgwodfaOVKBC
	hlYHooHvIbHuoEnzHj1RbDMd0bSxrFbobN/4Vx6KoL5OaJstOBqPSZ1yUOkY9VB+mj1MrHNu0EN
	5dMjaxsbX2wm91qRFNV9U6Kui6wCg=
X-Google-Smtp-Source: AGHT+IG/29TMFnpYD0R7DnujGknqtdj6ngn6wZ2aLjwervq4a07wDCuZ9ESh72dxrP3OMwmtfTSAQ6RN2nGQdiiH/sI=
X-Received: by 2002:a05:6871:ea0f:b0:2c1:51f7:e648 with SMTP id
 586e51a60fabf-2c780544564mr11117966fac.35.1742888368417; Tue, 25 Mar 2025
 00:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1742824138.git.bertrand.marquis@arm.com> <a22e5375df48d16cb4c0b3d80dde8593522b3ddd.1742824138.git.bertrand.marquis@arm.com>
In-Reply-To: <a22e5375df48d16cb4c0b3d80dde8593522b3ddd.1742824138.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 25 Mar 2025 08:39:16 +0100
X-Gm-Features: AQ5f1JoFc0K0KpvbRQmawvlOHEl6KC0cRepnGBoXbtlaFC604ccK-uVVO2REQO0
Message-ID: <CAHUa44ER8j2_=k0WcSZfSY6M6MLtC+489tKy4MxNLvHa9veJWA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] xen/arm: Create tee command line parameter
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Mon, Mar 24, 2025 at 2:53=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Add a new command line parameter "tee=3D" to be used to explicitly select
> what tee mediator is to be used by Xen and fail if it does not exist
> or the probe function for it failed.
>
> Without specifying which tee is to be used, Xen will use the first one
> for which the probe function succeeds which depends on the order of the
> mediator list which depends on the compiler.
> Using the command line argument, it is now possible to explicit request
> a specific TEE mediator and panic on boot if it is not available.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v4:
> - None
> Changes in v3:
> - Properly classify tee as arm specific (Jan)
> Changes in v2:
> - Patch introduced to add a command line selection of the TEE
> ---
>  docs/misc/xen-command-line.pandoc  | 14 ++++++++++++++
>  xen/arch/arm/include/asm/tee/tee.h |  4 ++++
>  xen/arch/arm/tee/tee.c             | 31 ++++++++++++++++++++++++++++++
>  3 files changed, 49 insertions(+)

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-li=
ne.pandoc
> index 89db6e83be66..0c2ff542a138 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2651,6 +2651,20 @@ Specify the per-cpu trace buffer size in pages.
>
>  Flag to enable TSC deadline as the APIC timer mode.
>
> +### tee (arm)
> +> `=3D <string>`
> +
> +Specify the TEE mediator to be probed and use.
> +
> +The default behaviour is to probe all supported TEEs supported by Xen an=
d use
> +the first one successfully probed. When this parameter is passed, Xen wi=
ll
> +probe only the TEE mediator passed as argument and boot will fail if thi=
s
> +mediator is not properly probed or if the requested TEE is not supported=
 by
> +Xen.
> +
> +This parameter can be set to `optee` of `ffa` if the corresponding media=
tors
> +are compiled in.
> +
>  ### tevt_mask
>  > `=3D <integer>`
>
> diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/as=
m/tee/tee.h
> index 0169fd746bcd..15d664e28dce 100644
> --- a/xen/arch/arm/include/asm/tee/tee.h
> +++ b/xen/arch/arm/include/asm/tee/tee.h
> @@ -55,6 +55,9 @@ struct tee_mediator_desc {
>      /* Printable name of the TEE. */
>      const char *name;
>
> +    /* Command line name of the TEE (to be used with tee=3D cmdline opti=
on) */
> +    const char *cmdline_name;
> +
>      /* Mediator callbacks as described above. */
>      const struct tee_mediator_ops *ops;
>
> @@ -77,6 +80,7 @@ void tee_free_domain_ctx(struct domain *d);
>  static const struct tee_mediator_desc __tee_desc_##_name __used     \
>  __section(".teemediator.info") =3D {                                  \
>      .name =3D _namestr,                                               \
> +    .cmdline_name =3D #_name,                                         \
>      .ops =3D _ops,                                                    \
>      .tee_type =3D _type                                               \
>  }
> diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
> index 3f65e45a7892..066b5ba40f9d 100644
> --- a/xen/arch/arm/tee/tee.c
> +++ b/xen/arch/arm/tee/tee.c
> @@ -19,12 +19,17 @@
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/types.h>
> +#include <xen/param.h>
>
>  #include <asm/tee/tee.h>
>
>  extern const struct tee_mediator_desc _steemediator[], _eteemediator[];
>  static const struct tee_mediator_desc __read_mostly *cur_mediator;
>
> +/* Select the TEE mediator using a name on command line. */
> +static char __initdata opt_mediator[16] =3D "";
> +string_param("tee", opt_mediator);
> +
>  /*
>   * TODO: Add function to alter Dom0 DTB, so we can properly describe
>   * present TEE.
> @@ -81,14 +86,40 @@ static int __init tee_init(void)
>  {
>      const struct tee_mediator_desc *desc;
>
> +    if ( strcmp(opt_mediator, "") )
> +        printk(XENLOG_INFO "TEE Mediator %s selected from command line\n=
",
> +               opt_mediator);
> +
> +    /*
> +     * When a specific TEE is selected using the 'tee=3D' command line
> +     * argument, we panic if the probe fails or if the requested TEE is =
not
> +     * supported.
> +     */
>      for ( desc =3D _steemediator; desc !=3D _eteemediator; desc++ )
>      {
> +        if ( strcmp(opt_mediator, "") &&
> +             strncmp(opt_mediator, desc->cmdline_name, sizeof(opt_mediat=
or)) )
> +            continue;
> +
>          if ( desc->ops->probe() )
>          {
>              printk(XENLOG_INFO "Using TEE mediator for %s\n", desc->name=
);
>              cur_mediator =3D desc;
>              return 0;
>          }
> +        else if ( strcmp(opt_mediator, "") )
> +        {
> +            panic("TEE mediator %s from command line probe failed\n",
> +                  opt_mediator);
> +            return -EFAULT;
> +        }
> +    }
> +
> +    if ( strcmp(opt_mediator, "") )
> +    {
> +        panic("TEE Mediator %s from command line not supported\n",
> +              opt_mediator);
> +        return -EINVAL;
>      }
>
>      return 0;
> --
> 2.47.1
>

