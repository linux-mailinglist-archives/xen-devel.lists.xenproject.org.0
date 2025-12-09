Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFB9CAF804
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 10:46:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181271.1504343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSuIR-00077M-2o; Tue, 09 Dec 2025 09:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181271.1504343; Tue, 09 Dec 2025 09:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSuIQ-00074a-Vn; Tue, 09 Dec 2025 09:46:14 +0000
Received: by outflank-mailman (input) for mailman id 1181271;
 Tue, 09 Dec 2025 09:46:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9j7=6P=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vSuIP-00074T-MX
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 09:46:13 +0000
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [2607:f8b0:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e01b4fb3-d4e3-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 10:46:03 +0100 (CET)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-44ffed84cccso973867b6e.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 01:46:03 -0800 (PST)
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
X-Inumbo-ID: e01b4fb3-d4e3-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765273562; x=1765878362; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syvUArLXzYy1n1KpHA25Z5M7M/i5SOIJswk5ER2bT+I=;
        b=HRzVWUqqAV5dO62cNRPxbKZR3EWelIBIoaH6F+MqMnGC+wGH+ZcRNuhrmP0GWnaIGA
         e0ybsWC/wCgRXmIDHZBnxS8m/DzSxbzRM4OsJAFMP4KdPv32uwpgQ6TfqkSxaU48TMae
         OZpgYH0ULnkySxf6zJ8AkgMPUjgL1buA7QQeG1ZR6X6AaWMlXJNbOdVn/ftIUQ0Xvwto
         4i4DVEkq7jkMLNBZyPgw7uq7FH42sNf9gfYhUnANzx024+Sw2/pDGnUe541pjJh3aQyp
         JD0KqXl6Va5QrnjY2lKOCDczXvtvfk9Q5r1eZO387fn8+OFxkhTzyTPfFfoTiIqgVk4Y
         gbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765273562; x=1765878362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=syvUArLXzYy1n1KpHA25Z5M7M/i5SOIJswk5ER2bT+I=;
        b=Q+mFur3NFaRpp96KqsW3HsYJpP9q4TOrWhGq6WzbEYBgfXxTVVZXhXVpWPdr1a5Iw+
         oW9em1KAMtOKzMUugLrXPjEGNxPxxbUoWluqvEwT5SwFnXpY9o8cOJcJRccFzrUkEPmJ
         foHImG5bBGge8pooc4mLHxATxjccNeqyMiUW3EgheEVvDa/LJpLjiFKjEhhqrm/gch0q
         hfVuiRMDIrzSDTrHUBUu/q+1U6o+UlOOijdkz1Y4gsRcIlpJH5mKEQHFILrpk8tE1SIm
         HfWm3HHvKInPBd/GZmozsly0bAunvchlYUEWrjoQgNtBgy0wNXfDz7Ur5Hlt3rQ4gfxz
         FMYA==
X-Gm-Message-State: AOJu0Yyp94vflYpX7hjnfQpMkTVCu1t879PYIPR+xKOQFMMk0slYauj/
	SwW+5ul8CSyrmzogjgUD4/K4vmyE7CNSNeA+GC8KfN0afzX+A5Zy9h2TFt1qw8l2E6WoRyvDwsY
	9S86Y7bF08rhAy41TMnKSvNLFW1RnheunMm3oP0a6CQ==
X-Gm-Gg: ASbGncuEk2HWfgjhT5MXHot2cF8Dyea6W/5QMnPKvLLWUdGKnfpuAawF26YISL6F3hR
	Nl6yV7vAikpMXYLudQF5luHnHyg0+ZLzce4XIcKV8BM8c7mTS/O8SgHz+NOSnvbnc5gr174DumI
	ikZJ2fAfGcg5aCms8iJ9+3clRmwMDetdzFjJpWlQgV6sWWyK/1C3i/FIxg43e7OrZIGiGIX7F10
	QUVaZclVXMiNkbS2dIHo/AJFe6YALx+QiyAmcpcwgoziuU4bEQzx6IHV6ECVBEcGRW+4ac5icO8
	RAL0aIqkj+/pksAILDtJBkM/idPI9qTZV5XiZM07rpt+usQZCVa9ywRgpd15PQ==
X-Google-Smtp-Source: AGHT+IHkoZ4RbyQbVi0TyuaDdRk4yBQVZvwsmSGuoqzYBoffn6BVN2d7XwpdPqEaHZOPSfukG3JAlVeIN9wYMIHg/hI=
X-Received: by 2002:a05:6808:1910:b0:450:b249:719d with SMTP id
 5614622812f47-4539e0ab127mr3358635b6e.53.1765273562406; Tue, 09 Dec 2025
 01:46:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764930353.git.bertrand.marquis@arm.com> <d66e0935ad46953aa12a0830fc8a0a4947933fe3.1764930353.git.bertrand.marquis@arm.com>
In-Reply-To: <d66e0935ad46953aa12a0830fc8a0a4947933fe3.1764930353.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 9 Dec 2025 10:45:51 +0100
X-Gm-Features: AQt7F2ryCSbj5Ev_93JuxAQStl6MKCC8-ArCkOxrBu9a9gC0FV23zRLKSCD52h8
Message-ID: <CAHUa44G85=NyMaB3qT6OD2v1N+f56wLwEUE1yqwtu++KQKyiuQ@mail.gmail.com>
Subject: Re: [PATCH v1 02/12] xen/arm: ffa: per-VM FFA_VERSION negotiation state
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Fri, Dec 5, 2025 at 11:37=E2=80=AFAM Bertrand Marquis
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
>  xen/arch/arm/tee/ffa_private.h  |  26 ++++++--
>  xen/arch/arm/tee/ffa_shm.c      |   3 +-
>  5 files changed, 105 insertions(+), 31 deletions(-)
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
> index 8d01da0009d3..4e4ac7fd7bc4 100644
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
> @@ -368,6 +362,26 @@ struct ffa_ctx {
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
> +     */
> +    uint32_t guest_vers;

It might be worth mentioning that this field must always be accessed
using the ACCESS_ONCE() macro.

Cheers,
Jens

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

