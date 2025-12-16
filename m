Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58613CC371D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 15:11:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187971.1509261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVVlH-0005Tr-D3; Tue, 16 Dec 2025 14:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187971.1509261; Tue, 16 Dec 2025 14:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVVlH-0005Rf-9N; Tue, 16 Dec 2025 14:10:47 +0000
Received: by outflank-mailman (input) for mailman id 1187971;
 Tue, 16 Dec 2025 14:10:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5yu6=6W=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vVVlF-0005RY-LN
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 14:10:45 +0000
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02510caa-da89-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 15:10:44 +0100 (CET)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-7cae2330765so3064507a34.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 06:10:44 -0800 (PST)
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
X-Inumbo-ID: 02510caa-da89-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765894242; x=1766499042; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLkVLQ6doUJPusiJJnRT8V1HK2AOLoVVOlX6ZU4PdHw=;
        b=PQOBm6I6BrE1PRBg9b8kb/Rnr3MfV7ysIpKRg6MqG5b6suzOvsLY3EnnFE9uhXqhuH
         ArfTQKD6GOHL0dmupQFhB3zaDy0P4MA82xMRl31BuwwyvdN4ZWvXC1nmmyMWWeEsBAfz
         W1oUYcVOoCa+E27fRSC9SAoei/2u/+MlIEZX/WyPehahyA5yEPO0ZQjZ8GPmlUrTylbM
         JvIDy+atL67olIHAsrGA9x/z6bOwV0jye9k3LmJM1qNtNR9Gw7y/9V7Zeqb/+xwvHuxD
         u0sd+SYM5i0s5v0CEHVHP7uX1C/G4rW6BDQLy6D0W2xVct6uD/Oug/3SdnBjEk0TJqCS
         QP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765894242; x=1766499042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vLkVLQ6doUJPusiJJnRT8V1HK2AOLoVVOlX6ZU4PdHw=;
        b=m4uqxaDgUvneZtBZzm8qdKyR43Zrix/6PrmpCaymFZltEBGYYHz09GkVkCceoT9HJl
         r34UWLHtXbMVhM2k2Gxwnbcm8MfGQGkk41J5/nL3wHd7zsFpS/8IhxcLzfkVjvnk+kEo
         FKQ68Njm7cFXlK5fk40rAV+TK9PqJ7LEc6gzl+BypcC5/Np3EnbkYseIdfyMxERmOf33
         la5MPPgjfqmDF2W3Ryms8Mg4kO6wtUkrZEg9UgycJ0kCYm3WhCQbzBkSWLwcKLuy10nv
         ZjSym0ZG7G866Y+qLTZsE01x0pIMQEXG06gCpo/Lo4liN7xM/MIFcMNnoh3XlRw+HcwI
         PgcA==
X-Gm-Message-State: AOJu0Yz9IU0iFKWyFr2joQGKhdq7AFx/686C1R+lAw5GzK4p2rYiY1hF
	GfxrxtJmaNywRCisWT3UyuxP8tvn2xv1rHA694k3YKNoR2rreD+khhu6/GauP4YzuLd5xBPPsmS
	DZngMTDhYXiFQtS6SxJniy5avX12xxUIutGnMD6a4Jg==
X-Gm-Gg: AY/fxX6k36/g4rHV+mtiSq3dO91RC3umRU080FtpHjWceb+0+99AXX5X0pQCqAyH/u5
	z/lfTXg0kH8JSMsof7dd3NOZdyeCpyxbXVHCP6QCGOT+M5Z+nOiIiDsZWx72rwmBNNWAqSQoZU6
	hRphGCYMbi/e/+83zVPXkGKLyHgNLnBMf9mcIhEvM5+J9HcTg/5S1JJcuJDyre4Cv0Oeq8wFUK1
	Tlj8F9gFfoWOuHAXO86KLAddUs/cW9miia2sZz3o43ZhfNiaiuqX3fvYjnClSiI13vkeXPZIrtF
	013PB0cLHMT6V3/rRBL79SejpQ==
X-Google-Smtp-Source: AGHT+IHAyEscQmKKdMyqUaJxLIVgjYDwUMG5rpQkwLwzo6H2cDNOx8H90JKkVvdN7RRqgrdA4e4C+SYFMKGu/9ZhG28=
X-Received: by 2002:a05:6820:1612:b0:659:9a49:8eec with SMTP id
 006d021491bc7-65b45269409mr7634862eaf.32.1765894242455; Tue, 16 Dec 2025
 06:10:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765807707.git.bertrand.marquis@arm.com> <359051357e82739378c2ebfb5461d27951d42e7b.1765807707.git.bertrand.marquis@arm.com>
In-Reply-To: <359051357e82739378c2ebfb5461d27951d42e7b.1765807707.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 16 Dec 2025 15:10:30 +0100
X-Gm-Features: AQt7F2ojS9F7rVIhUmFMpfzy5sqGJYtnsD_rANtwkt8iNn1U4RpL2pZUvq6IwwM
Message-ID: <CAHUa44F3nUBjUX+HyDA6w2L6gGx9zScfgSCOtmE8H6k4g5_sPg@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] xen/arm: ffa: per-VM FFA_VERSION negotiation state
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Mon, Dec 15, 2025 at 3:50=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Track FF-A version negotiation per VM and enforce that no FF-A ABI
> (other than FFA_VERSION) is processed before a guest has selected a
> version.
>
> Each ffa_ctx gains a dedicated guest_vers_lock, a negotiated version
> (guest_vers) and a guest_vers_tmp:
> - guest_vers is the version negotiated or 0 if no version has been
>   negotiated. This must be used with ACCESS_ONCE when reading it without
>   the spinlock taken.
> - guest_vers_tmp stores the version currently requested by a VM.
>
> The version requested is the one actually negotiated once a call
> different from FFA_VERSION is done to allow several attempts and as
> requested by FF-A specification.
> We always return our implementation version FFA_MY_VERSION, even if the
> version requested was different, as requested by FF-A specification.
>
> Any call other than FFA_VERSION is rejected until a version has been
> requested.
>
> Update all places in the code where guest_vers is used to use
> ACCESS_ONCE.
>
> This prevents partially initialised contexts from using the mediator
> and complies with the FF-A 1.2 FFA_VERSION semantics.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
> - add comment on top of guest_vers to instruct to always use ACCESS_ONCE
>   to access it.
> Changes in v1:
> - remove the guest_vers_negotiated and use guest_vers =3D 0 as condition
>   for a version being negotiated instead
> - introduce guest_vers_tmp to store a requested version until it is
>   becoming the one negotiated.
> - remove not needed if negotiated condition.
> - use ACCESS_ONCE when reading guest_vers and use guest_vers =3D=3D 0 as
>   condition for a version being negotiated.
> - Update FF-A version handling comment in ffa_private.h
> ---
>  xen/arch/arm/tee/ffa.c          | 101 +++++++++++++++++++++++++-------
>  xen/arch/arm/tee/ffa_msg.c      |   2 +-
>  xen/arch/arm/tee/ffa_partinfo.c |   4 +-
>  xen/arch/arm/tee/ffa_private.h  |  27 +++++++--
>  xen/arch/arm/tee/ffa_shm.c      |   3 +-
>  5 files changed, 106 insertions(+), 31 deletions(-)

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 2b4e24750d52..aadd6c21e7f2 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -158,31 +158,38 @@ static bool ffa_abi_supported(uint32_t id)
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
> +    spin_lock(&ctx->guest_vers_lock);
> +
> +    /* If negotiation already published, continue without handling. */
> +    if ( ACCESS_ONCE(ctx->guest_vers) )
> +        goto out_continue;
> +
> +    if ( fid !=3D FFA_VERSION )
>      {
> -        spin_lock(&ctx->lock);
> -        old_vers =3D ctx->guest_vers;
> +        if ( !ctx->guest_vers_tmp )
> +        {
> +            out_vers =3D 0;
> +            goto out_handled;
> +        }
>
> -        if ( FFA_VERSION_MINOR(vers) > FFA_MY_VERSION_MINOR )
> -            ctx->guest_vers =3D FFA_MY_VERSION;
> -        else
> -            ctx->guest_vers =3D vers;
> -        spin_unlock(&ctx->lock);
> +        /*
> +         * A successful FFA_VERSION call does not freeze negotiation. Gu=
ests
> +         * are allowed to issue multiple FFA_VERSION attempts (e.g. prob=
ing
> +         * several minor versions). Negotiation becomes final only when =
a
> +         * non-VERSION ABI is invoked, as required by the FF-A specifica=
tion.
> +         * Finalize negotiation: publish guest_vers once, then never cha=
nge.
> +         */
> +        ACCESS_ONCE(ctx->guest_vers) =3D ctx->guest_vers_tmp;
>
> -        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !old_vers )
> +        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
>          {
>              /* One more VM with FF-A support available */
>              inc_ffa_vm_count();
> @@ -190,8 +197,48 @@ static void handle_version(struct cpu_user_regs *reg=
s)
>              list_add_tail(&ctx->ctx_list, &ffa_ctx_head);
>              write_unlock(&ffa_ctx_list_rwlock);
>          }
> +
> +        goto out_continue;
>      }
> -    ffa_set_regs(regs, FFA_MY_VERSION, 0, 0, 0, 0, 0, 0, 0);
> +
> +    /*
> +     * guest_vers_tmp stores the version selected by the guest (lower mi=
nor may
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
> +        ctx->guest_vers_tmp =3D FFA_MY_VERSION;
> +        goto out_handled;
> +    }
> +
> +    /*
> +     * Use our minor version if a greater minor was requested or the req=
uested
> +     * minor if it is lower than ours was requested.
> +     */
> +    if ( FFA_VERSION_MINOR(in_vers) > FFA_MY_VERSION_MINOR )
> +        ctx->guest_vers_tmp =3D FFA_MY_VERSION;
> +    else
> +        ctx->guest_vers_tmp =3D in_vers;
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
> @@ -274,10 +321,17 @@ static bool ffa_handle_call(struct cpu_user_regs *r=
egs)
>      if ( !ctx )
>          return false;
>
> +    /* A version must be negotiated first */
> +    if ( !ACCESS_ONCE(ctx->guest_vers) )
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
> @@ -371,6 +425,11 @@ static int ffa_domain_init(struct domain *d)
>      d->arch.tee =3D ctx;
>      ctx->teardown_d =3D d;
>      INIT_LIST_HEAD(&ctx->shm_list);
> +    spin_lock_init(&ctx->lock);
> +    spin_lock_init(&ctx->guest_vers_lock);
> +    ctx->guest_vers =3D 0;
> +    ctx->guest_vers_tmp =3D 0;
> +    INIT_LIST_HEAD(&ctx->ctx_list);
>
>      ctx->ffa_id =3D ffa_get_vm_id(d);
>      ctx->num_vcpus =3D d->max_vcpus;
> @@ -452,7 +511,7 @@ static int ffa_domain_teardown(struct domain *d)
>      if ( !ctx )
>          return 0;
>
> -    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && ctx->guest_vers )
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && ACCESS_ONCE(ctx->guest_vers)=
 )
>      {
>          dec_ffa_vm_count();
>          write_lock(&ffa_ctx_list_rwlock);
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index c20c5bec0f76..2c2ebc9c5cd6 100644
> --- a/xen/arch/arm/tee/ffa_msg.c
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -113,7 +113,7 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, cons=
t void *src_buf,
>      }
>
>      dst_ctx =3D dst_d->arch.tee;
> -    if ( !dst_ctx->guest_vers )
> +    if ( !ACCESS_ONCE(dst_ctx->guest_vers) )
>      {
>          ret =3D FFA_RET_INVALID_PARAMETERS;
>          goto out_unlock;
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index fa56b1587e3b..ec5a53ed1cab 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -238,7 +238,7 @@ void ffa_handle_partition_info_get(struct cpu_user_re=
gs *regs)
>       * use the v1.0 structure size in the destination buffer.
>       * Otherwise use the size of the highest version we support, here 1.=
1.
>       */
> -    if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 )
> +    if ( ACCESS_ONCE(ctx->guest_vers) =3D=3D FFA_VERSION_1_0 )
>          dst_size =3D sizeof(struct ffa_partition_info_1_0);
>      else
>          dst_size =3D sizeof(struct ffa_partition_info_1_1);
> @@ -250,7 +250,7 @@ void ffa_handle_partition_info_get(struct cpu_user_re=
gs *regs)
>           * FF-A v1.0 has w5 MBZ while v1.1 allows
>           * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
>           */
> -        if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 ||
> +        if ( ACCESS_ONCE(ctx->guest_vers) =3D=3D FFA_VERSION_1_0 ||
>                  flags !=3D FFA_PARTITION_INFO_GET_COUNT_FLAG )
>          {
>              ret =3D FFA_RET_INVALID_PARAMETERS;
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 8d01da0009d3..8ef214344711 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -355,12 +355,6 @@ struct ffa_ctx {
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
> @@ -368,6 +362,27 @@ struct ffa_ctx {
>      /* Used shared memory objects, struct ffa_shm_mem */
>      struct list_head shm_list;
>
> +    /*
> +     * FF-A version handling
> +     * guest_vers is the single published negotiated version. It is 0 un=
til
> +     * negotiation completes, after which it is set once and never chang=
es.
> +     * Negotiation uses guest_vers_tmp under guest_vers_lock; when a
> +     * non-VERSION ABI is invoked, Xen finalizes negotiation by publishi=
ng
> +     * guest_vers using ACCESS_ONCE() store.
> +     * Readers use ACCESS_ONCE(guest_vers) !=3D 0 to detect availability=
 and
> +     * can consume guest_vers without barriers because it never changes =
once
> +     * published.
> +     */
> +    spinlock_t guest_vers_lock;
> +    /*
> +     * Published negotiated version. Zero means "not negotiated yet".
> +     * Once non-zero, it never changes.
> +     * Must always be accessed using ACCESS_ONCE().
> +     */
> +    uint32_t guest_vers;
> +    /* Temporary version used during negotiation under guest_vers_lock *=
/
> +    uint32_t guest_vers_tmp;
> +
>      /*
>       * Rx buffer, accessed with rx_lock locked.
>       * rx_is_free is used to serialize access.
> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> index d628c1b70609..dad3da192247 100644
> --- a/xen/arch/arm/tee/ffa_shm.c
> +++ b/xen/arch/arm/tee/ffa_shm.c
> @@ -495,7 +495,8 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
>      if ( frag_len > ctx->page_count * FFA_PAGE_SIZE )
>          goto out_unlock;
>
> -    ret =3D read_mem_transaction(ctx->guest_vers, ctx->tx, frag_len, &tr=
ans);
> +    ret =3D read_mem_transaction(ACCESS_ONCE(ctx->guest_vers), ctx->tx,
> +                               frag_len, &trans);
>      if ( ret )
>          goto out_unlock;
>
> --
> 2.51.2
>

