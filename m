Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A0F9A9A50
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 08:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824035.1238120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t38om-0000pv-Rp; Tue, 22 Oct 2024 06:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824035.1238120; Tue, 22 Oct 2024 06:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t38om-0000mj-OK; Tue, 22 Oct 2024 06:56:36 +0000
Received: by outflank-mailman (input) for mailman id 824035;
 Tue, 22 Oct 2024 06:56:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bY6J=RS=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1t38ol-0000lC-9s
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 06:56:35 +0000
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [2607:f8b0:4864:20::c31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5cb1572-9042-11ef-a0be-8be0dac302b0;
 Tue, 22 Oct 2024 08:56:34 +0200 (CEST)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5ebc9bda8c8so690965eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 23:56:33 -0700 (PDT)
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
X-Inumbo-ID: c5cb1572-9042-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729580192; x=1730184992; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksO6GCw6PIPFs5dx8hdx9Ui5VfcEYz/8/jRlF1w0Pxs=;
        b=CRd/VokKpX+1H8vrau2tJj0+gXers1A3oG3ZaxLMxdJ4ycuLtAczsYZdupIIL4azdy
         dQ8ZVmgfVo94T9X4wcVAjLCOWqt4k1WqQ9xfZjirsrJR/20daifjuo+n/h1ibrjkTFZJ
         MYy1If4loDDxmJCOn5vsCwsObEy/UXL2R2PB6uR0QYbEDySzrbiZC/pr1P5gbyXRifF0
         6JC53W9HyHyWgYRo47SZeUsH7wGQmAq/pZO/cjLqOAXhLhFrzHCRrwR46/4gX+Esn32g
         O4Q1L3KtOyJC0wYv/6YwECDRreLihoVXyqQptiTuEv9pvRppF4sAKUBYruK2WEziHIDD
         fidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729580192; x=1730184992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksO6GCw6PIPFs5dx8hdx9Ui5VfcEYz/8/jRlF1w0Pxs=;
        b=TL6ytxc4gDzACUkxGZU+/fkKGMpZOad3dRDTZbzGKqPFkYTCa2Rbpp2p0F2apf7hbI
         D8ayxAqZXERz9L6M50+JVttrvx6BPmVJ+9WwHyEgAbcIdo+erXwP1aU1MkFmJZ1FtryH
         jdxgj5UOJhU/w9iUMqaalSoN5itDWI2LYN3Jwe6clicNzM9mHdiPoReBUFlQ7hMDDfvz
         mdn224Uw5CVfh6rqYz/HaVxEWPd1/yBMOLRyewWxls7k1f3iMgK+Q+HMKtEf9pLA4ic9
         wHY9Ag6Im2s5JAhsPJka0kMawR0duYVfP6ejqlny+e9YW5IovGn6xEx1kupE2KXwgN0W
         GqXw==
X-Gm-Message-State: AOJu0Yyii8xCnaL32xzylCggEVr6DdO54YDjelFB00dGEucDsPUpLeHp
	eg0uuX6uk0pNpf3Rw7Ui/P4qdfkuY/in6YRoYujdFcu3XsWRqqbpOm57uPQpAHNBe/w8wuCA9Ub
	e2wLjyoLD7FIj2hT840wi+Af41E79YJSbbvkTAA==
X-Google-Smtp-Source: AGHT+IGXRVtuLew4DSE1TDARe3BNRLU/3AjuyxAuQtByZuZvIvZK+3KJ3n3CtPkrBAttt8iaAfrNm3C68JjO3xDhK98=
X-Received: by 2002:a05:6870:e311:b0:278:65c:3c14 with SMTP id
 586e51a60fabf-2892c2580d7mr10827718fac.5.1729580192597; Mon, 21 Oct 2024
 23:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729066788.git.bertrand.marquis@arm.com> <86636401aa34f9c64e674a53d49859930a227d10.1729066788.git.bertrand.marquis@arm.com>
In-Reply-To: <86636401aa34f9c64e674a53d49859930a227d10.1729066788.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 22 Oct 2024 08:56:20 +0200
Message-ID: <CAHUa44GF8VwAzX1Qs-PGsJXUaAStGiSeiPNtq-LWhXC3=qixiQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] xen/arm: ffa: Fix version negotiation
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
> Fix FFA version negotiation with the firmware to follow the
> specification guidance more closely (see FF-A Specification Version 1.1
> in chapter 13.2.1).
> When the firmware returns OK we can have several cases:
> - the version requested is accepted but the firmware supports a greater
>   one in the same major.
> - the firmware supports a greater major version. It could still return
>   OK even if the version requested is not accepted. Reject it.
> - the firmware supports a lower version. It will return OK and give that
>   version. Check if we support it and use it or reject it if we do not.
>
> Adapt the code to:
> - reject any version lower than the one we support or not with the same
>   major version
> - use the version returned if in our supported range (currently 1.1
>   only)
> - use 1.1 if the version returned is greater.
>
> Also adapt the handling of version requests from VM:
> - use our version if same major but greater minor is requested
> - use requested version if same major but lower minor is requested
> - do not use if incompatible major is requested
> - always return our version without error to the requester
>
> [1] https://developer.arm.com/documentation/den0077/e/
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
> - add link in commit message and code to the version and chapter of
>   the spec.
> - fix comment coding style
> - introduce macros to get the major and minor of a version
> - add BUILD_BUG_ON to validate that the SPMC version we want is
>   compatible with our own version
> - rework version testing and selecting to be clearer by discarding
>   different major or version lower than what we want and then selecting
>   based on the minor version.
> - fix get_version handling to be more generic
> ---
>  xen/arch/arm/tee/ffa.c         | 54 +++++++++++++++++++++++++---------
>  xen/arch/arm/tee/ffa_private.h |  3 ++
>  2 files changed, 43 insertions(+), 14 deletions(-)

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index dde932422ecf..1ee6b2895e92 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -148,13 +148,20 @@ static void handle_version(struct cpu_user_regs *re=
gs)
>      struct ffa_ctx *ctx =3D d->arch.tee;
>      uint32_t vers =3D get_user_reg(regs, 1);
>
> -    if ( vers < FFA_VERSION_1_1 )
> -        vers =3D FFA_VERSION_1_0;
> -    else
> -        vers =3D FFA_VERSION_1_1;
> -
> -    ctx->guest_vers =3D vers;
> -    ffa_set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> +    /*
> +     * Guest will use the version it requested if it is our major and mi=
nor
> +     * lower or equals to ours. If the minor is greater, our version wil=
l be
> +     * used.
> +     * In any case return our version to the caller.
> +     */
> +    if ( FFA_VERSION_MAJOR(vers) =3D=3D FFA_MY_VERSION_MAJOR )
> +    {
> +        if ( FFA_VERSION_MINOR(vers) > FFA_MY_VERSION_MINOR )
> +            ctx->guest_vers =3D FFA_MY_VERSION;
> +        else
> +            ctx->guest_vers =3D vers;
> +    }
> +    ffa_set_regs(regs, FFA_MY_VERSION, 0, 0, 0, 0, 0, 0, 0);
>  }
>
>  static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint3=
2_t fid)
> @@ -537,18 +544,39 @@ static bool ffa_probe(void)
>          goto err_no_fw;
>      }
>
> -    if ( vers < FFA_MIN_SPMC_VERSION || vers > FFA_MY_VERSION )
> +    /* Some sanity check in case we update the version we support */
> +    BUILD_BUG_ON(FFA_MIN_SPMC_VERSION > FFA_MY_VERSION);
> +    BUILD_BUG_ON(FFA_VERSION_MAJOR(FFA_MIN_SPMC_VERSION) !=3D
> +                                   FFA_MY_VERSION_MAJOR);
> +
> +    major_vers =3D FFA_VERSION_MAJOR(vers);
> +    minor_vers =3D FFA_VERSION_MINOR(vers);
> +
> +    if ( major_vers !=3D FFA_MY_VERSION_MAJOR ||
> +         minor_vers < FFA_VERSION_MINOR(FFA_MIN_SPMC_VERSION) )
>      {
> -        printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers)=
;
> +        printk(XENLOG_ERR "ffa: Incompatible firmware version %u.%u\n",
> +               major_vers, minor_vers);
>          goto err_no_fw;
>      }
>
> -    major_vers =3D (vers >> FFA_VERSION_MAJOR_SHIFT)
> -                 & FFA_VERSION_MAJOR_MASK;
> -    minor_vers =3D vers & FFA_VERSION_MINOR_MASK;
>      printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>             major_vers, minor_vers);
>
> +    /*
> +     * If the call succeed and the version returned is higher or equal t=
o
> +     * the one Xen requested, the version requested by Xen will be the o=
ne
> +     * used. If the version returned is lower but compatible with Xen, X=
en
> +     * will use that version instead.
> +     * A version with a different major or lower than the minimum versio=
n
> +     * we support is rejected before.
> +     * See https://developer.arm.com/documentation/den0077/e/ chapter 13=
.2.1
> +     */
> +    if ( minor_vers > FFA_MY_VERSION_MINOR )
> +        ffa_fw_version =3D FFA_MY_VERSION;
> +    else
> +        ffa_fw_version =3D vers;
> +
>      /*
>       * At the moment domains must support the same features used by Xen.
>       * TODO: Rework the code to allow domain to use a subset of the
> @@ -564,8 +592,6 @@ static bool ffa_probe(void)
>          }
>      }
>
> -    ffa_fw_version =3D vers;
> -
>      if ( !ffa_rxtx_init() )
>      {
>          printk(XENLOG_ERR "ffa: Error during RXTX buffer init\n");
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 7c6b06f686fc..045d9c4a0b56 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -35,6 +35,9 @@
>  #define MAKE_FFA_VERSION(major, minor)  \
>          ((((major) & FFA_VERSION_MAJOR_MASK) << FFA_VERSION_MAJOR_SHIFT)=
 | \
>           ((minor) & FFA_VERSION_MINOR_MASK))
> +#define FFA_VERSION_MAJOR(vers) (((vers) >> FFA_VERSION_MAJOR_SHIFT) & \
> +                                 FFA_VERSION_MAJOR_MASK)
> +#define FFA_VERSION_MINOR(vers) ((vers) & FFA_VERSION_MINOR_MASK)
>
>  #define FFA_VERSION_1_0         MAKE_FFA_VERSION(1, 0)
>  #define FFA_VERSION_1_1         MAKE_FFA_VERSION(1, 1)
> --
> 2.47.0
>

