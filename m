Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A22C9B534
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 12:34:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176129.1500669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQOdg-0006dH-J6; Tue, 02 Dec 2025 11:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176129.1500669; Tue, 02 Dec 2025 11:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQOdg-0006aA-GG; Tue, 02 Dec 2025 11:33:48 +0000
Received: by outflank-mailman (input) for mailman id 1176129;
 Tue, 02 Dec 2025 11:33:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JGiA=6I=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vQOdg-0006a4-0I
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 11:33:48 +0000
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c01dc723-cf72-11f0-9d1a-b5c5bf9af7f9;
 Tue, 02 Dec 2025 12:33:41 +0100 (CET)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-6596897c2b5so242217eaf.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Dec 2025 03:33:41 -0800 (PST)
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
X-Inumbo-ID: c01dc723-cf72-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764675220; x=1765280020; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyXl5Uwe+7LLw2uOAk13W9T08ZfHu18vispL0Z1eZVo=;
        b=vl3z/XtOemBGFB5VONRt2kenBpRZWnnHa8C1+ds12131Y6j3xb+2nEGIQZDuD5eKHO
         +YDsqGr/pLp0uWZahOBd1ECbT0GiicnDK/3xl7tkDLaMwIqqH+SKZ8SMqSeLcqzwD9n2
         M/YUcHsp2IhmPGQxnh0fPliOAETntrtsoLlw+xtCrEp7NIkmFtyfAgbnXhOdxVrfbsgz
         rv2vi7X6Br1ozGPt8H8yIUPQRFUokGh7n3dJKdmRs8hOlnaaUzS0xTM1O1bttGj7KJ/g
         L0cResaK2pjBF4FQGWYLbmG55s/ZCwZ33PAJb3bz+UdwAw17v73k2dgg9M4qZ/UdWn9S
         14qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764675220; x=1765280020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JyXl5Uwe+7LLw2uOAk13W9T08ZfHu18vispL0Z1eZVo=;
        b=UL5WRvNveImHxjKKPdQG/HAVl6FMNwIRDVr4hCw6wsFmcA6Zbbf13amJ201X+C9Y3e
         IuRM+wSv8DFaNmxp1f1lxvdWs+gu9aZvxLXY6o5bK8/9SEthIT35NO9cCm1ZvTGoR8qi
         6+Bx2FKzA/emQ4thVb2j6+t8YpuIMD3r3ePmg5mQAAoB7hLLw78eVzwv+SjDNGaI00yr
         DZBPPd2nd9uq7wIwKyNj0ljxhCY667kMV4MkzcAMlK2rS4k3TPkeZMksaXbs4/2nQUo5
         O8XhJs9rzwQjd3w6jFPfINsPYBC2WYeYOZkEDdhQTOMx2uLbAkuZaECKoS73Qp2CMQkf
         uWhg==
X-Gm-Message-State: AOJu0YzE3GfGs+ddd731gZzK0584wLD9aX91eEouGF6UrJld7/lpLi5R
	7owDBViO1TrNH1mdMs/igC6nL92zQUZWDwjgWbNIExB0yyTl/uSb74pyerD9Bns9CsrwMvKAtdP
	A1pjwCxnS6J9UvhK7nGgk5Mi/jOqh9+kxD9VxjtAToA==
X-Gm-Gg: ASbGnctfLI4+pr7V4CPyxolpaHjkToq/oQ1DumdccXjtM2eGz/rmyqrMTCzy2ewWFiS
	zZXocuHVTq5a7VS0XS0hNd427zFG9wDKE8ETj7xTipo7ewuvD1brHes6XNpUB+Zf+dcA1Hh6hlf
	bHpEaVzS2Y6BwMCn8zBIOJHAUL/fCH/lYfRHhisk7Bw6qfVVDKlBy4Ro6B3Lmkf6ygtiOoiMlhJ
	Tra4r+8U+/daipCWT/xjMBdutqHA7DuP6kMGZZ5IgAXcITSQf4N7TcIMQ3pFc9KF6B9XBUEdTX7
	+vCRya9qHKrRE3kOxESR+2ieZXk7THftGTAK
X-Google-Smtp-Source: AGHT+IFW7i3dfES0Xb4sukVQLMDZA65THvwhMrFNq7hJDqg19UOOp4+LiSCiWKWhx0UCMqRq2oMSAqjnVDNIOY3XCGQ=
X-Received: by 2002:a05:6820:88f:b0:657:5629:2cef with SMTP id
 006d021491bc7-6595dd842fcmr2725762eaf.4.1764675219790; Tue, 02 Dec 2025
 03:33:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764254975.git.bertrand.marquis@arm.com> <5e66b2991340f010befcaa3a57d0f35ad18d4149.1764254975.git.bertrand.marquis@arm.com>
In-Reply-To: <5e66b2991340f010befcaa3a57d0f35ad18d4149.1764254975.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 2 Dec 2025 12:33:28 +0100
X-Gm-Features: AWmQ_bl58x99MENRUJ2heu2BeXbVrnBiAu6RnkIU6NIv_UXXYQcqVHXNR9zQ_aE
Message-ID: <CAHUa44E1SnhBR8=ibG+r6QPN9hehcRVPa93zKpYd756OHza+=A@mail.gmail.com>
Subject: Re: [PATCH 02/10] xen/arm: ffa: per-VM FFA_VERSION negotiation state
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,


On Thu, Nov 27, 2025 at 4:52=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Track FF-A version negotiation per VM and enforce that no FF-A ABI
> (other than FFA_VERSION) is processed before a guest has selected a
> version.
>
> Each ffa_ctx gains a dedicated guest_vers_lock, a negotiated version
> (guest_vers) and a guest_vers_negotiated flag. guest_vers records the
> version requested by the guest so the mediator can provide data
> structures compatible with older minor versions. The value returned to
> the guest by FFA_VERSION is always FFA_MY_VERSION, the implementation
> version, as required by FF-A.
>
> FFA_VERSION may be issued multiple times. Negotiation becomes final
> only when a non-FFA_VERSION ABI is invoked, in accordance with the
> FF-A requirement that the version cannot change once any other ABI has
> been used. Before this point, non-FFA_VERSION ABIs are rejected if no
> valid version has been provided.
>
> Once negotiation completes, the context is added to the global FF-A
> VM list (when VM-to-VM is enabled) and the version may not be modified
> for the lifetime of the VM. All VM-to-VM paths and teardown logic are
> updated to use the guest_vers_negotiated flag.
>
> This prevents partially initialised contexts from using the mediator
> and complies with the FF-A 1.2 FFA_VERSION semantics.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa.c         | 115 +++++++++++++++++++++++++--------
>  xen/arch/arm/tee/ffa_msg.c     |   2 +-
>  xen/arch/arm/tee/ffa_private.h |  21 ++++--
>  3 files changed, 104 insertions(+), 34 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 2b4e24750d52..3309ca875ec4 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -158,40 +158,89 @@ static bool ffa_abi_supported(uint32_t id)
>      return !ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
>  }
>
> -static void handle_version(struct cpu_user_regs *regs)
> +static bool ffa_negotiate_version(struct cpu_user_regs *regs)
>  {
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
> -    uint32_t vers =3D get_user_reg(regs, 1);
> -    uint32_t old_vers;
> +    uint32_t fid =3D get_user_reg(regs, 0);
> +    uint32_t in_vers =3D get_user_reg(regs, 1);
> +    uint32_t out_vers =3D FFA_MY_VERSION;
>
> -    /*
> -     * Guest will use the version it requested if it is our major and mi=
nor
> -     * lower or equals to ours. If the minor is greater, our version wil=
l be
> -     * used.
> -     * In any case return our version to the caller.
> -     */
> -    if ( FFA_VERSION_MAJOR(vers) =3D=3D FFA_MY_VERSION_MAJOR )
> -    {
> -        spin_lock(&ctx->lock);
> -        old_vers =3D ctx->guest_vers;
> +    spin_lock(&ctx->guest_vers_lock);
>
> -        if ( FFA_VERSION_MINOR(vers) > FFA_MY_VERSION_MINOR )
> -            ctx->guest_vers =3D FFA_MY_VERSION;
> -        else
> -            ctx->guest_vers =3D vers;
> -        spin_unlock(&ctx->lock);
> +    /* Handle FFA_VERSION races from different vCPUs. */
> +    if ( ctx->guest_vers_negotiated )
> +        goto out_continue;
>
> -        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !old_vers )
> +    if ( fid !=3D FFA_VERSION )
> +    {
> +        if ( !ctx->guest_vers )
>          {
> -            /* One more VM with FF-A support available */
> -            inc_ffa_vm_count();
> -            write_lock(&ffa_ctx_list_rwlock);
> -            list_add_tail(&ctx->ctx_list, &ffa_ctx_head);
> -            write_unlock(&ffa_ctx_list_rwlock);
> +            out_vers =3D 0;
> +            goto out_handled;
>          }
> +
> +        /*
> +         * A successful FFA_VERSION call does not freeze negotiation. Gu=
ests
> +         * are allowed to issue multiple FFA_VERSION attempts (e.g. prob=
ing
> +         * several minor versions). Negotiation becomes final only when =
a
> +         * non-VERSION ABI is invoked, as required by the FF-A specifica=
tion.
> +         */
> +        if ( !ctx->guest_vers_negotiated )

ctx->guest_vers_negotiated is always false here, due to the check above.

> +        {
> +            ctx->guest_vers_negotiated =3D true;

I'm on thin ice here, but I think that barriers or some other
primitives are needed to close the gap if ffa_handle_call() is called
concurrently during these conditions:
ctx->guest_vers_negotiated =3D=3D false
CPU0 called with FFA_VERSION 1.1 -> sets ctx->guest_vers =3D 1.1
CPU1 called with a valid FF-A ID !=3D FFA_VERSION -> sets
ctx->guest_vers_negotiated =3D true
CPU2 called with a valid FF-A ID !=3D FFA_VERSION -> guarantee is
missing that CPU2 will observe the updated ctx->guest_vers if it
observes the updated ctx->guest_vers_negotiated

Cheers,
Jens

> +
> +            if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +            {
> +                /* One more VM with FF-A support available */
> +                inc_ffa_vm_count();
> +                write_lock(&ffa_ctx_list_rwlock);
> +                list_add_tail(&ctx->ctx_list, &ffa_ctx_head);
> +                write_unlock(&ffa_ctx_list_rwlock);
> +            }
> +        }
> +
> +        goto out_continue;
> +    }
> +
> +    /*
> +     * guest_vers stores the version selected by the guest (lower minor =
may
> +     * require reduced data structures). However, the value returned to =
the
> +     * guest via FFA_VERSION is always FFA_MY_VERSION, the implementatio=
n
> +     * version, as required by FF-A. The two values intentionally differ=
.
> +     */
> +
> +    /*
> +     * Return our highest implementation version on request different th=
an our
> +     * major and mark negotiated version as our implementation version.
> +     */
> +    if ( FFA_VERSION_MAJOR(in_vers) !=3D FFA_MY_VERSION_MAJOR )
> +    {
> +        ctx->guest_vers =3D FFA_MY_VERSION;
> +        goto out_handled;
>      }
> -    ffa_set_regs(regs, FFA_MY_VERSION, 0, 0, 0, 0, 0, 0, 0);
> +
> +    /*
> +     * Use our minor version if a greater minor was requested or the req=
uested
> +     * minor if it is lower than ours was requested.
> +     */
> +    if ( FFA_VERSION_MINOR(in_vers) > FFA_MY_VERSION_MINOR )
> +        ctx->guest_vers =3D FFA_MY_VERSION;
> +    else
> +        ctx->guest_vers =3D in_vers;
> +
> +out_handled:
> +    spin_unlock(&ctx->guest_vers_lock);
> +    if ( out_vers )
> +        ffa_set_regs(regs, out_vers, 0, 0, 0, 0, 0, 0, 0);
> +    else
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +    return true;
> +
> +out_continue:
> +    spin_unlock(&ctx->guest_vers_lock);
> +
> +    return false;
>  }
>
>  static void handle_features(struct cpu_user_regs *regs)
> @@ -274,10 +323,17 @@ static bool ffa_handle_call(struct cpu_user_regs *r=
egs)
>      if ( !ctx )
>          return false;
>
> +    /* A version must be negotiated first */
> +    if ( !ctx->guest_vers_negotiated )
> +    {
> +        if ( ffa_negotiate_version(regs) )
> +            return true;
> +    }
> +
>      switch ( fid )
>      {
>      case FFA_VERSION:
> -        handle_version(regs);
> +        ffa_set_regs(regs, FFA_MY_VERSION, 0, 0, 0, 0, 0, 0, 0);
>          return true;
>      case FFA_ID_GET:
>          ffa_set_regs_success(regs, ffa_get_vm_id(d), 0);
> @@ -371,6 +427,11 @@ static int ffa_domain_init(struct domain *d)
>      d->arch.tee =3D ctx;
>      ctx->teardown_d =3D d;
>      INIT_LIST_HEAD(&ctx->shm_list);
> +    spin_lock_init(&ctx->lock);
> +    spin_lock_init(&ctx->guest_vers_lock);
> +    ctx->guest_vers =3D 0;
> +    ctx->guest_vers_negotiated =3D false;
> +    INIT_LIST_HEAD(&ctx->ctx_list);
>
>      ctx->ffa_id =3D ffa_get_vm_id(d);
>      ctx->num_vcpus =3D d->max_vcpus;
> @@ -452,7 +513,7 @@ static int ffa_domain_teardown(struct domain *d)
>      if ( !ctx )
>          return 0;
>
> -    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && ctx->guest_vers )
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && ctx->guest_vers_negotiated )
>      {
>          dec_ffa_vm_count();
>          write_lock(&ffa_ctx_list_rwlock);
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index c20c5bec0f76..dec429cbf160 100644
> --- a/xen/arch/arm/tee/ffa_msg.c
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -113,7 +113,7 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, cons=
t void *src_buf,
>      }
>
>      dst_ctx =3D dst_d->arch.tee;
> -    if ( !dst_ctx->guest_vers )
> +    if ( !dst_ctx->guest_vers_negotiated )
>      {
>          ret =3D FFA_RET_INVALID_PARAMETERS;
>          goto out_unlock;
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index d7e6b6f5ef45..88b85c7c453a 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -354,12 +354,6 @@ struct ffa_ctx {
>       * Global data accessed with lock locked.
>       */
>      spinlock_t lock;
> -    /*
> -     * FF-A version negotiated by the guest, only modifications to
> -     * this field are done with the lock held as this is expected to
> -     * be done once at init by a guest.
> -     */
> -    uint32_t guest_vers;
>      /* Number of 4kB pages in each of rx/rx_pg and tx/tx_pg */
>      unsigned int page_count;
>      /* Number of allocated shared memory object */
> @@ -367,6 +361,21 @@ struct ffa_ctx {
>      /* Used shared memory objects, struct ffa_shm_mem */
>      struct list_head shm_list;
>
> +    /*
> +     * FF-A version handling
> +     * guest_vers and guest_vers_negotiated are only written with
> +     * guest_vers_lock held. Reads do not take the lock, but ordering is
> +     * guaranteed because the writer updates guest_vers first and then
> +     * guest_vers_negotiated while holding the lock, ensuring any reader
> +     * that observes guest_vers_negotiated =3D=3D true also sees the fin=
al
> +     * guest_vers value.
> +     * The ffa_ctx is added to the ctx_list only when a version
> +     * has been negotiated and locked.
> +     */
> +    spinlock_t guest_vers_lock;
> +    uint32_t guest_vers;
> +    bool guest_vers_negotiated;
> +
>      /*
>       * Rx buffer, accessed with rx_lock locked.
>       * rx_is_free is used to serialize access.
> --
> 2.51.2
>

