Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC35ABFB57
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:35:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992313.1376082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHmPN-0002ae-I5; Wed, 21 May 2025 16:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992313.1376082; Wed, 21 May 2025 16:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHmPN-0002YW-FT; Wed, 21 May 2025 16:35:09 +0000
Received: by outflank-mailman (input) for mailman id 992313;
 Wed, 21 May 2025 16:35:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPXp=YF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1uHmPM-0002YQ-30
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:35:08 +0000
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [2607:f8b0:4864:20::c2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d9e83f1-3661-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 18:35:07 +0200 (CEST)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-6060a70ba80so3801701eaf.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:35:06 -0700 (PDT)
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
X-Inumbo-ID: 8d9e83f1-3661-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747845306; x=1748450106; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4x3vNqKHty/ekIZpyczjpfexXrz7j5aLh2Uk1ezdOoU=;
        b=jAMGukLwpzlen9vywNYIaCq5yik0NFkedpwwEsVMMUSeJoiAiQKzGevKGpJjsAmBe+
         hc9cTNYNPNSXVog/jOIVytp8yOX/3ujpoeI6XGW9cg4I3qd1XX5p/vp3ooiE594iJrMn
         5mhleGx+Zhd7pr2bgCnzifLFZCukcj5VXHfPp41Vl+kCCEwp2G2WDD/2FYAHADl1u7NZ
         DgradL5Ot7o7CAbN5FvAdUJAB8tW582PADpIomisD5SbcTZmLQo8KG/qhFepTXOWsWH7
         H/hYFQqtKXgLDs5pJHdC8uxZ7jYRBf0VzBFOA16u+Kk3Elf8zMou22OW37AsklTbUHN+
         f9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747845306; x=1748450106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4x3vNqKHty/ekIZpyczjpfexXrz7j5aLh2Uk1ezdOoU=;
        b=i97nVMRsKDgNXNsXajalOj/f74ys5CM5HyjD0fFxWnemyFgaYvz/3SEcRyqsdX83of
         UroGD9G6Jj6eLwIE1WXLVkEhN4NgGLUe+VaK05AKD91pBdkQX1Oy2HRDwD3VAUFvxqYk
         HqWe7jGrXsd2jmeGGHUYlN5KR400ynVDVml2ewNstJQN78EYOHZ6xI4fIbrWF4dOuCb+
         Oa7Jg4g3X4BNYQCGOf17aolFWTZ26cED8qoxqV5w3Ok2h14S31T/4xu1Eamcv85spkmr
         x3GMX4ty5arHCj5iyNPbKXRkd0xoEA7zOtu608KE63pWCrV8PPOdcOMfGCuWq8T1PxgR
         G6ww==
X-Gm-Message-State: AOJu0YxkYxV6DKhJsem4zgFWJSjX6nsG6648f5Xdx6o7I6GaZ4kj92tF
	EZGy5SgANKkXt4qCDH4xe2G5zhrgStbzBsJPBD8tkS/vTbqkPNidUSfTXovveA3LEGJM/m/24ao
	W9v1ntAnNFiwLWy8T9DPENvMNaVnAlbKKujk1CeBL2g==
X-Gm-Gg: ASbGnct9vtXM5kmtBfXD48J7eddhafvkHdsSxo1XTkO9zp3qvEfj1rdmAllitvElApO
	1dMABCGz5bqGlEdU53HgE+TQD8tl1zl/it0tp4IClbcwvr2xjbVhU9lrYyo75WTuD70a8y0Q4X6
	Nrc8wKQpSqglBBNpZxy6RWOTOj7YrtyU58phFEAv6nASqT
X-Google-Smtp-Source: AGHT+IF8g7EsQbMv7CNc9vwAwzbFvjLl+eRnmbaFdEyZUSPXkJZChdYTRsI9mcyo4PMi0N9wcJ9XDaoVTEYGIfzNFHI=
X-Received: by 2002:a05:6820:1843:b0:603:f973:1b6 with SMTP id
 006d021491bc7-609f37776a6mr13110333eaf.5.1747845305627; Wed, 21 May 2025
 09:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787720.git.bertrand.marquis@arm.com>
 <f6c67adcae192bcbe9c7612fda1bef31c40bb9a0.1744787720.git.bertrand.marquis@arm.com>
 <CAHUa44HsTzvXtNGv+iSRP5X0JX00phu4yP08CWudU3zxWA-bsg@mail.gmail.com> <AACF07F9-7D48-45DF-AC97-B5B51D2A3AE3@arm.com>
In-Reply-To: <AACF07F9-7D48-45DF-AC97-B5B51D2A3AE3@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 21 May 2025 18:34:53 +0200
X-Gm-Features: AX0GCFsatMYqPOsFoX9YHhkyJ9T_H6KzZwP1CM55gu5cXLeJdczjyTlBOST4-no
Message-ID: <CAHUa44HiOhdPSvEELt+n_JDcjep+AB08pzFyy4s9+1-mvASYRQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] xen/arm: ffa: Introduce VM to VM support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 21, 2025 at 5:11=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 21 May 2025, at 16:54, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi Bertrand,
> >
> > On Wed, Apr 16, 2025 at 9:40=E2=80=AFAM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> Create a CONFIG_FFA_VM_TO_VM parameter to activate FFA communication
> >> between VMs.
> >> When activated list VMs in the system with FF-A support in part_info_g=
et.
> >>
> >> When VM to VM is activated, Xen will be tainted as Insecure and a
> >> message is displayed to the user during the boot as there is no
> >> filtering of VMs in FF-A so any VM can communicate or see any other VM
> >> in the system.
> >>
> >> WARNING: There is no filtering for now and all VMs are listed !!
> >>
> >> This patch is reorganizing the ffa_ctx structure to make clear which
> >> lock is protecting what parts.
> >>
> >> This patch is introducing a chain list of the ffa_ctx with a FFA Versi=
on
> >> negociated allowing to create the partinfo results for VMs without
> >> taking a lock on the global domain list in Xen.
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> Changes in v5:
> >> - remove invalid comment about 1.1 firmware support
> >> - rename variables from d and dom to curr_d and dest_d (Julien)
> >> - add a TODO in the code for potential holding for long of the CPU
> >>  (Julien)
> >> - use an atomic global variable to store the number of VMs instead of
> >>  recomputing the value each time (Julien)
> >> - add partinfo information in ffa_ctx (id, cpus and 64bit) and create =
a
> >>  chain list of ctx. Use this chain list to create the partinfo result
> >>  without holding a global lock to prevent concurrency issues.
> >> - Move some changes in a preparation patch modifying partinfo for sps =
to
> >>  reduce this patch size and make the review easier
> >> Changes in v4:
> >> - properly handle SPMC version 1.0 header size case in partinfo_get
> >> - switch to local counting variables instead of *pointer +=3D 1 form
> >> - coding style issue with missing spaces in if ()
> >> Changes in v3:
> >> - break partinfo_get in several sub functions to make the implementati=
on
> >>  easier to understand and lock handling easier
> >> - rework implementation to check size along the way and prevent previo=
us
> >>  implementation limits which had to check that the number of VMs or SP=
s
> >>  did not change
> >> - taint Xen as INSECURE when VM to VM is enabled
> >> Changes in v2:
> >> - Switch ifdef to IS_ENABLED
> >> - dom was not switched to d as requested by Jan because there is alrea=
dy
> >>  a variable d pointing to the current domain and it must not be
> >>  shadowed.
> >> ---
> >> xen/arch/arm/tee/Kconfig        |  11 ++++
> >> xen/arch/arm/tee/ffa.c          |  47 +++++++++++++-
> >> xen/arch/arm/tee/ffa_partinfo.c |  95 ++++++++++++++++++++++++---
> >> xen/arch/arm/tee/ffa_private.h  | 112 ++++++++++++++++++++++++++------
> >> 4 files changed, 233 insertions(+), 32 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
> >> index c5b0f88d7522..88a4c4c99154 100644
> >> --- a/xen/arch/arm/tee/Kconfig
> >> +++ b/xen/arch/arm/tee/Kconfig
> >> @@ -28,5 +28,16 @@ config FFA
> >>
> >>          [1] https://developer.arm.com/documentation/den0077/latest
> >>
> >> +config FFA_VM_TO_VM
> >> +    bool "Enable FF-A between VMs (UNSUPPORTED)" if UNSUPPORTED
> >> +    default n
> >> +    depends on FFA
> >> +    help
> >> +      This option enables to use FF-A between VMs.
> >> +      This is experimental and there is no access control so any
> >> +      guest can communicate with any other guest.
> >> +
> >> +      If unsure, say N.
> >> +
> >> endmenu
> >>
> >> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >> index 3bbdd7168a6b..c1c4c0957091 100644
> >> --- a/xen/arch/arm/tee/ffa.c
> >> +++ b/xen/arch/arm/tee/ffa.c
> >> @@ -118,6 +118,13 @@ void *ffa_tx __read_mostly;
> >> DEFINE_SPINLOCK(ffa_rx_buffer_lock);
> >> DEFINE_SPINLOCK(ffa_tx_buffer_lock);
> >>
> >> +struct list_head ffa_ctx_head;
> >> +/* Lock to protect addition/removal in ffa_ctx_head */
> >> +DEFINE_SPINLOCK(ffa_ctx_list_lock);
> >> +
> >> +#ifdef CONFIG_FFA_VM_TO_VM
> >> +atomic_t ffa_vm_count;
> >> +#endif
> >>
> >> /* Used to track domains that could not be torn down immediately. */
> >> static struct timer ffa_teardown_timer;
> >> @@ -160,10 +167,21 @@ static void handle_version(struct cpu_user_regs =
*regs)
> >>      */
> >>     if ( FFA_VERSION_MAJOR(vers) =3D=3D FFA_MY_VERSION_MAJOR )
> >>     {
> >> +        uint32_t old_vers =3D ACCESS_ONCE(ctx->guest_vers);
> >> +
> >>         if ( FFA_VERSION_MINOR(vers) > FFA_MY_VERSION_MINOR )
> >> -            ctx->guest_vers =3D FFA_MY_VERSION;
> >> +            ACCESS_ONCE(ctx->guest_vers) =3D FFA_MY_VERSION;
> >>         else
> >> -            ctx->guest_vers =3D vers;
> >> +            ACCESS_ONCE(ctx->guest_vers) =3D vers;
> >
> > What is the ACCESS_ONCE() scheme intended for?
> >
> >> +
> >> +        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !old_vers )
> >
> > If handle_version() is called concurrently on two CPUs, it might be
> > possible for a context to be added twice.
> > How about a separate flag to indicate whether a context has been added
> > to the list?
>
> I wanted to avoid having guest_vers as atomic or introduce an other lock.
> But i think now that this is kind of impossible to avoid and this way to =
do
> it is wrong.
>
> I will take the context lock to do this processing to avoid this corner c=
ase
> and remove the ACCESS_ONCE to protect modifications to guest_vers:
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index b86c88cefa8c..306edb97863a 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -158,6 +158,7 @@ static void handle_version(struct cpu_user_regs *regs=
)
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
>      uint32_t vers =3D get_user_reg(regs, 1);
> +    uint32_t old_vers;
>
>      /*
>       * Guest will use the version it requested if it is our major and mi=
nor
> @@ -167,12 +168,14 @@ static void handle_version(struct cpu_user_regs *re=
gs)
>       */
>      if ( FFA_VERSION_MAJOR(vers) =3D=3D FFA_MY_VERSION_MAJOR )
>      {
> -        uint32_t old_vers =3D ACCESS_ONCE(ctx->guest_vers);
> +        spin_lock(&ctx->lock);
> +        old_vers =3D ctx->guest_vers;
>
>          if ( FFA_VERSION_MINOR(vers) > FFA_MY_VERSION_MINOR )
> -            ACCESS_ONCE(ctx->guest_vers) =3D FFA_MY_VERSION;
> +           ctx->guest_vers =3D FFA_MY_VERSION;
>          else
> -            ACCESS_ONCE(ctx->guest_vers) =3D vers;
> +           ctx->guest_vers =3D vers;
> +        spin_unlock(&ctx->lock);
>
>          if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !old_vers )
>          {
>
> What do you think ?

That works. It might be worth adding a comment that ctx->guest_vers is
accessed unlocked elsewhere, and why that is OK.

Cheers,
Jens

