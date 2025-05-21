Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA334ABF53B
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 15:03:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991853.1375649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHj5k-0000EA-Hb; Wed, 21 May 2025 13:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991853.1375649; Wed, 21 May 2025 13:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHj5k-0000Br-Eo; Wed, 21 May 2025 13:02:40 +0000
Received: by outflank-mailman (input) for mailman id 991853;
 Wed, 21 May 2025 13:02:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPXp=YF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1uHj5i-0000A1-89
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 13:02:38 +0000
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddbd589c-3643-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 15:02:36 +0200 (CEST)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-606668f8d51so4551214eaf.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 06:02:36 -0700 (PDT)
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
X-Inumbo-ID: ddbd589c-3643-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747832555; x=1748437355; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbPvxJsYqO9VIz9CrM76HReyKaSvx4EtXbJhhPkxMcU=;
        b=OEaVYWznCyo/6vIjYhPcL+weS98aRJhMrqikHciroO/RNvfJEmWWz/8Vpdc5p3NyQL
         1cXHWeXXrQFSXVyBh2SiEaLOoM6dvdebuggo5YyKH3S/O1U8kQ7WrwytKCHluho/Y3EG
         6Vsv2yZrgZOGUIDVWsCXIiD581Ke90inEXzlpEgqmY6bm2XdWN9nedV57tLZyHIjgaiG
         rVLR4x0NcnsYBNVU1Qvg+Ge2tVKcrpFlf+B4P0LKZLKuwEo2SLlc7S6jqY96ffIq14p9
         NrJSkgvkQXnQbdycH2b//dRhrMfyQm08VHOkj+FFnQpa3ztWvt51/gsIDeCLD4sJeQVQ
         g3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832555; x=1748437355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbPvxJsYqO9VIz9CrM76HReyKaSvx4EtXbJhhPkxMcU=;
        b=Vp5glBL833VoCTXz3JQbvj/t9Qeg7a7AY7EW952lfBPI0kAJahHE2YlWWS6qPAXAGZ
         4K6FtylPj7RKh4/npWtJlpRRBvZ/ul9IVGbUDffpaQ4H4sQogEFwTR7L0cIxYFIh3Q3U
         uXbgOCezcrs0L0Pf6lpuhdsuogsEAVFsTIFPm2dD3Rum4nJ6sd0s4/lH/P9hHecwkgyb
         s5KJVkdWhhVFrEeHO/9Tz2RaWcP3StafgGH8bQWs5A9EOec4oDrRvGEspvRkEmvwtPQU
         VGfWQYgIEO2jFTyNKBwfJqjZ5C87zYhNDcbR/hegyyPMqfrVsFekGHKZYfy9ySdLK6Ln
         EThw==
X-Gm-Message-State: AOJu0Yzh/fCmTRXDrymXoOarJSSD+NwwxlNJ9j+IKC3Ff2/BD0K3HtjW
	OPCn0Tp+ZRm2toT57csFhiDLbryH5/z3C+EhHyTBP+t0PGG1rP7nfMmFjZU5L/ZQg+ecPxQDqGn
	4KqZ4uz+/pAdV8sAu7K9/CArkI/182boHgNyHa3XWJg==
X-Gm-Gg: ASbGnct0J5YMIG3D0+IlIPUCnzDlIcDThVjQBZpbVfVPt1e4GfodDstbKE94h0XfoHh
	MmaWYcRKC0a/I5BM9FjbvFB43M93rpyVJCIE84Zb0mltvjX5flWnI2H956t6bOf1OE6zAzDslr9
	d9zy4ilLSnhk/KFtOCi0pmPjsAS548BqsStiQABHa8gokr
X-Google-Smtp-Source: AGHT+IHLS9kVfRJjJ6GhjbHQv1OYPWZb0gmaPIUnt9wwPTczl8jUe8gKaoG+0D8VK9lOjJlprsMte8MZ/guvt8SYl2I=
X-Received: by 2002:a05:6820:12f:b0:609:ef1e:4960 with SMTP id
 006d021491bc7-609ef1e49f9mr10504184eaf.4.1747832553928; Wed, 21 May 2025
 06:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787720.git.bertrand.marquis@arm.com> <e175a051ecefe0adf3b31d5c5bc25efda67d6b75.1744787720.git.bertrand.marquis@arm.com>
In-Reply-To: <e175a051ecefe0adf3b31d5c5bc25efda67d6b75.1744787720.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 21 May 2025 15:02:22 +0200
X-Gm-Features: AX0GCFtaWAT9FprTmyhhiOwVYIecuOU2tVz41OK7aVPzNdW-YkjbElwx0SZW6pM
Message-ID: <CAHUa44HGULPsSSAPe68p2y-pMO0EY=0urg3KarDr+oM0kYQ6JQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] xen/arm: Create tee command line parameter
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Wed, Apr 16, 2025 at 9:40=E2=80=AFAM Bertrand Marquis
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
> Changes in v5:
> - Typo fix and rewording in command line doc (Julien)
> - fix include order in tee.c (Julien)
> - use a local bool instead of retesting the string each time in tee_init
>   (Julien)
> Changes in v4:
> - None
> Changes in v3:
> - Properly classify tee as arm specific (Jan)
> Changes in v2:
> - Patch introduced to add a command line selection of the TEE
> ---
>  docs/misc/xen-command-line.pandoc  | 14 +++++++++++++
>  xen/arch/arm/include/asm/tee/tee.h |  4 ++++
>  xen/arch/arm/tee/tee.c             | 32 ++++++++++++++++++++++++++++++
>  3 files changed, 50 insertions(+)

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-li=
ne.pandoc
> index 89db6e83be66..472de1911363 100644
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
> +The default behaviour is to probe all TEEs supported by Xen and use
> +the first one successfully probed. When this parameter is passed, Xen wi=
ll
> +probe only the TEE mediator passed as argument and boot will fail if thi=
s
> +mediator is not properly probed or if the requested TEE is not supported=
 by
> +Xen.
> +
> +This parameter can be set to `optee` or `ffa` if the corresponding media=
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
> index 3f65e45a7892..8501443c8e57 100644
> --- a/xen/arch/arm/tee/tee.c
> +++ b/xen/arch/arm/tee/tee.c
> @@ -18,6 +18,7 @@
>
>  #include <xen/errno.h>
>  #include <xen/init.h>
> +#include <xen/param.h>
>  #include <xen/types.h>
>
>  #include <asm/tee/tee.h>
> @@ -25,6 +26,10 @@
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
> @@ -80,15 +85,42 @@ uint16_t tee_get_type(void)
>  static int __init tee_init(void)
>  {
>      const struct tee_mediator_desc *desc;
> +    bool select_mediator =3D strcmp(opt_mediator, "");
> +
> +    if ( select_mediator )
> +        printk(XENLOG_INFO "TEE Mediator %s selected from command line\n=
",
> +               opt_mediator);
>
> +    /*
> +     * When a specific TEE is selected using the 'tee=3D' command line
> +     * argument, we panic if the probe fails or if the requested TEE is =
not
> +     * supported.
> +     */
>      for ( desc =3D _steemediator; desc !=3D _eteemediator; desc++ )
>      {
> +        if ( select_mediator &&
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
> +        else if ( select_mediator )
> +        {
> +            panic("TEE mediator %s from command line probe failed\n",
> +                  opt_mediator);
> +            return -EFAULT;
> +        }
> +    }
> +
> +    if ( select_mediator )
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

