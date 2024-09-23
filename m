Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D470F97EFE0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 19:37:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802256.1212472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssmzc-0001yK-Tb; Mon, 23 Sep 2024 17:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802256.1212472; Mon, 23 Sep 2024 17:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssmzc-0001vQ-Qf; Mon, 23 Sep 2024 17:37:00 +0000
Received: by outflank-mailman (input) for mailman id 802256;
 Mon, 23 Sep 2024 17:36:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+7mE=QV=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1ssmzb-0001vI-Ih
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 17:36:59 +0000
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [2607:f8b0:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dc32317-79d2-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 19:36:57 +0200 (CEST)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3e03c736466so2767971b6e.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 10:36:57 -0700 (PDT)
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
X-Inumbo-ID: 6dc32317-79d2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727113016; x=1727717816; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ov1xLy4ZM8m0Gy4QRSsq9pZBPPbK710WfsLEmnsRKmo=;
        b=k5BnjjUzB0+zvbETgPqMSBRbA78Uhl8xiYNXx7zcV0nUpa0NeB8j6gdScsDUHawaKF
         me+1ruY3KN2pWTzHjnC0ma6+3/AmvHrcJTlcQOJzkjerTFItBgk6kdVvW28pD071Eu5i
         R05cUg4G/ezi6vyFmlgDGRag+XxpsPJoTFtM2Kksx8RJKumbgQSS4eNsxA00l7MhXKrM
         AeATnkYNf2h2M4qFsKe3eml1vh8mWwDvkz5xHBoaUCs1cceJHylcjv0yjh/vTZEyD9uo
         gl5qJJI53oLqxQcRzPsa/dvaUnYi0NONtTa84Y4TvNW2N7O/OwaFUfVmGDvL9H6k0mT2
         OWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727113016; x=1727717816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ov1xLy4ZM8m0Gy4QRSsq9pZBPPbK710WfsLEmnsRKmo=;
        b=aVG7H2oGhRtYFg5bmEvOPGiBHXbafRi2gnikFDxx2yOmvAPrBlLwtFAc1Ylh5l3qCp
         hmWsh502rjXXlBxJwZ8MsoJUOaX+AyGluCSM0am//NlYVwy4Ec/TS9gfwE6BLSONlRI4
         aJzrlD6RIG1udth3Bcm3kLKSmt062MlyiAGH2ndTb4wwz+NsEANWkGGDFd+iNPMwJgsY
         16QqpBWmT3YFGVABjt487dvlOLw7mKZ9SzeJu9iqOKa7k4FckDTvWVr65M+YC8Q8AKH7
         FBs0ohLe/3UqjwyV/MFoWSqOisoGpE/+OFeNXRWwE/17kX+qWrlMeXdUBtSOrF/qjRSL
         Dj0g==
X-Gm-Message-State: AOJu0YwKuG00RLZcXJ/gu/zmPzzywRQlsO2KsMaNy5cl9ZH81JuYRRW7
	GUpJ6F406YWl6a5Ukgdhw/uCKNJzpCjFRQPPAJ3tS5BcAaKCqjfG34xuO+J6tXdPfM179CeqSAw
	xZIEwMf0Utmwn1My5osu7UQY+PG4SW88o9eYVng==
X-Google-Smtp-Source: AGHT+IECdl7C6ii0GPpYoZ2EJb04qnodH9l5Gaci+QVxZHvCYyAYtl864ND7oU3M5oRVK1jDirgoZ2EoDzYEWkBHdxo=
X-Received: by 2002:a05:6808:1597:b0:3e0:42ee:a8dc with SMTP id
 5614622812f47-3e272924fabmr6008189b6e.13.1727113015737; Mon, 23 Sep 2024
 10:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1726676338.git.bertrand.marquis@arm.com> <0bb3d0faf5a80112a95363ee9fd023d510e3f0c8.1726676338.git.bertrand.marquis@arm.com>
In-Reply-To: <0bb3d0faf5a80112a95363ee9fd023d510e3f0c8.1726676338.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 23 Sep 2024 19:36:44 +0200
Message-ID: <CAHUa44FLzkXsXoHtbiS1djDnSi5H2aupHmr0i759Ldd_NQD4ow@mail.gmail.com>
Subject: Re: [PATCH 07/10] xen/arm: ffa: Transmit RXTX buffers to the SPMC
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 19, 2024 at 2:20=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> When an RXTX buffer is mapped by a VM transmit it to the SPMC when it
> supports RX_ACQUIRE.
> As a consequence of that, we must acquire the RX buffer of a VM from the
> SPMC when we want to use it:
> - create a generic acquire and release function to get the rx buffer of
>   a VM which gets it from the SPMC when supported
> - rename the rx_acquire to hyp_rx_acquire to remove confusion
> - rework the rx_lock to only lock access to rx_is_free and only allow
>   usage of the rx buffer to one who managed to acquire it, thus removing
>   the trylock and returning busy if rx_is_free is false
>
> As part of this change move some structure definition to ffa_private
> from ffa_shm as those are need for the MAP call with the SPMC.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa.c          |   2 +-
>  xen/arch/arm/tee/ffa_partinfo.c |  28 +++----
>  xen/arch/arm/tee/ffa_private.h  |  22 +++++-
>  xen/arch/arm/tee/ffa_rxtx.c     | 126 ++++++++++++++++++++++++++++----
>  xen/arch/arm/tee/ffa_shm.c      |  15 ----
>  5 files changed, 142 insertions(+), 51 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 45f9c1db8a6e..4a769e20007b 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -344,7 +344,7 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
>          ffa_handle_partition_info_get(regs);
>          return true;
>      case FFA_RX_RELEASE:
> -        e =3D ffa_handle_rx_release();
> +        e =3D ffa_rx_release(d);
>          break;
>      case FFA_MSG_SEND_DIRECT_REQ_32:
>      case FFA_MSG_SEND_DIRECT_REQ_64:
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index b391b1adf9f2..fde187dba4e5 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -121,11 +121,9 @@ void ffa_handle_partition_info_get(struct cpu_user_r=
egs *regs)
>          goto out;
>      }
>
> -    if ( !spin_trylock(&ctx->rx_lock) )
> -    {
> -        ret =3D FFA_RET_BUSY;
> +    ret =3D ffa_rx_acquire(d);
> +    if ( ret !=3D FFA_RET_OK )
>          goto out;
> -    }
>
>      dst_buf =3D ctx->rx;
>
> @@ -135,22 +133,16 @@ void ffa_handle_partition_info_get(struct cpu_user_=
regs *regs)
>          goto out_rx_release;
>      }
>
> -    if ( !ctx->page_count || !ctx->rx_is_free )
> -    {
> -        ret =3D FFA_RET_DENIED;
> -        goto out_rx_release;
> -    }
> -
>      spin_lock(&ffa_rx_buffer_lock);
>
>      ret =3D ffa_partition_info_get(uuid, 0, &ffa_sp_count, &src_size);
>
>      if ( ret )
> -        goto out_rx_buf_unlock;
> +        goto out_rx_hyp_unlock;
>
>      /*
>       * ffa_partition_info_get() succeeded so we now own the RX buffer we
> -     * share with the SPMC. We must give it back using ffa_rx_release()
> +     * share with the SPMC. We must give it back using ffa_hyp_rx_releas=
e()
>       * once we've copied the content.
>       */
>
> @@ -193,15 +185,13 @@ void ffa_handle_partition_info_get(struct cpu_user_=
regs *regs)
>          }
>      }
>
> -    ctx->rx_is_free =3D false;
> -
>  out_rx_hyp_release:
> -    ffa_rx_release();
> -out_rx_buf_unlock:
> +    ffa_hyp_rx_release();
> +out_rx_hyp_unlock:
>      spin_unlock(&ffa_rx_buffer_lock);
>  out_rx_release:
> -    spin_unlock(&ctx->rx_lock);
> -
> +    if ( ret !=3D FFA_RET_OK )
> +        ffa_rx_release(d);
>  out:
>      if ( ret )
>          ffa_set_regs_error(regs, ret);
> @@ -368,7 +358,7 @@ bool ffa_partinfo_init(void)
>      ret =3D init_subscribers(count, fpi_size);
>
>  out:
> -    ffa_rx_release();
> +    ffa_hyp_rx_release();
>      return ret;
>  }
>
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index c6903e335489..84b0f866a71e 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -263,6 +263,21 @@
>                                      FFA_FUNC_ID(FFA_FUNC_MIN)) << 1 | \
>                                      FFA_FUNC_CONV(id))
>
> +/* Constituent memory region descriptor */
> +struct ffa_address_range {
> +    uint64_t address;
> +    uint32_t page_count;
> +    uint32_t reserved;
> +};
> +
> +/* Composite memory region descriptor */
> +struct ffa_mem_region {
> +    uint32_t total_page_count;
> +    uint32_t address_range_count;
> +    uint64_t reserved;
> +    struct ffa_address_range address_range_array[];
> +};
> +
>  struct ffa_ctx_notif {
>      bool enabled;
>
> @@ -290,7 +305,7 @@ struct ffa_ctx {
>      struct ffa_ctx_notif notif;
>      /*
>       * tx_lock is used to serialize access to tx
> -     * rx_lock is used to serialize access to rx
> +     * rx_lock is used to serialize access to rx_is_free
>       * lock is used for the rest in this struct
>       */
>      spinlock_t tx_lock;
> @@ -329,7 +344,8 @@ void ffa_rxtx_domain_destroy(struct domain *d);
>  uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
>                              register_t rx_addr, uint32_t page_count);
>  uint32_t ffa_handle_rxtx_unmap(void);
> -int32_t ffa_handle_rx_release(void);
> +int32_t ffa_rx_acquire(struct domain *d);
> +int32_t ffa_rx_release(struct domain *d);
>
>  void ffa_notif_init(void);
>  void ffa_notif_init_interrupt(void);
> @@ -418,7 +434,7 @@ static inline int32_t ffa_simple_call(uint32_t fid, r=
egister_t a1,
>      return ffa_get_ret_code(&resp);
>  }
>
> -static inline int32_t ffa_rx_release(void)
> +static inline int32_t ffa_hyp_rx_release(void)
>  {
>      return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
>  }
> diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
> index cb54c76911fd..dacf33cc9efc 100644
> --- a/xen/arch/arm/tee/ffa_rxtx.c
> +++ b/xen/arch/arm/tee/ffa_rxtx.c
> @@ -30,6 +30,17 @@ struct ffa_endpoint_rxtx_descriptor_1_1 {
>      uint32_t tx_region_offs;
>  };
>
> +static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
> +                            uint32_t page_count)
> +{
> +    return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count=
, 0);
> +}
> +
> +static int32_t ffa_rxtx_unmap(void)
> +{
> +    return ffa_simple_call(FFA_RXTX_UNMAP, 0, 0, 0, 0);
> +}
> +
>  uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
>                              register_t rx_addr, uint32_t page_count)
>  {
> @@ -42,6 +53,9 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t t=
x_addr,
>      void *rx;
>      void *tx;
>
> +    /* The code is considering that we only get one page for now */
> +    BUILD_BUG_ON(FFA_MAX_RXTX_PAGE_COUNT !=3D 1);
> +
>      if ( !smccc_is_conv_64(fid) )
>      {
>          /*
> @@ -87,6 +101,65 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t=
 tx_addr,
>      if ( !rx )
>          goto err_unmap_tx;
>
> +    /*
> +     * Transmit the RX/TX buffer information to the SPM if acquire is su=
pported
> +     * as the spec says that if not there is not need to acquire/release=
/map
> +     * rxtx buffers from the SPMC
> +     */
> +    if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
> +    {
> +        struct ffa_endpoint_rxtx_descriptor_1_1 *rxtx_desc;
> +        struct ffa_mem_region *mem_reg;
> +
> +        /* All must fit in our TX buffer */
> +        BUILD_BUG_ON((sizeof(*rxtx_desc) + sizeof(*mem_reg)*2 +
> +                      sizeof(struct ffa_address_range)*2) > FFA_PAGE_SIZ=
E);
> +
> +        spin_lock(&ffa_tx_buffer_lock);
> +        rxtx_desc =3D ffa_tx;
> +
> +        /*
> +         * We have only one page for each so we pack everything:
> +         * - rx region descriptor
> +         * - rx region range
> +         * - tx region descriptor
> +         * - tx region range
> +         */
> +        rxtx_desc->sender_id =3D ffa_get_vm_id(d);
> +        rxtx_desc->reserved =3D 0;
> +        rxtx_desc->rx_region_offs =3D sizeof(*rxtx_desc);
> +        rxtx_desc->tx_region_offs =3D sizeof(*rxtx_desc) +
> +                                    offsetof(struct ffa_mem_region,
> +                                             address_range_array[1]);
> +
> +        /* rx buffer */
> +        mem_reg =3D ffa_tx + sizeof(*rxtx_desc);
> +        mem_reg->total_page_count =3D 1;
> +        mem_reg->address_range_count =3D 1;
> +        mem_reg->reserved =3D 0;
> +
> +        mem_reg->address_range_array[0].address =3D page_to_maddr(rx_pg)=
;
> +        mem_reg->address_range_array[0].page_count =3D 1;
> +        mem_reg->address_range_array[0].reserved =3D 0;
> +
> +        /* tx buffer */
> +        mem_reg =3D ffa_tx + rxtx_desc->tx_region_offs;
> +        mem_reg->total_page_count =3D 1;
> +        mem_reg->address_range_count =3D 1;
> +        mem_reg->reserved =3D 0;
> +
> +        mem_reg->address_range_array[0].address =3D page_to_maddr(tx_pg)=
;
> +        mem_reg->address_range_array[0].page_count =3D 1;
> +        mem_reg->address_range_array[0].reserved =3D 0;
> +
> +        ret =3D ffa_rxtx_map(0, 0, 1);

I can't find the corresponding ffa_rxtx_unmap() of a VM rxtx buffer.

Cheers,
Jens

> +
> +        spin_unlock(&ffa_tx_buffer_lock);
> +
> +        if ( ret !=3D FFA_RET_OK )
> +            goto err_unmap_tx;
> +    }
> +
>      ctx->rx =3D rx;
>      ctx->tx =3D tx;
>      ctx->rx_pg =3D rx_pg;
> @@ -132,34 +205,61 @@ uint32_t ffa_handle_rxtx_unmap(void)
>      return FFA_RET_OK;
>  }
>
> -int32_t ffa_handle_rx_release(void)
> +int32_t ffa_rx_acquire(struct domain *d)
>  {
>      int32_t ret =3D FFA_RET_DENIED;
> -    struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
>
> -    if ( !spin_trylock(&ctx->rx_lock) )
> -        return FFA_RET_BUSY;
> +    spin_lock(&ctx->rx_lock);
>
> -    if ( !ctx->page_count || ctx->rx_is_free )
> +    if ( !ctx->page_count )
> +    {
> +        ret =3D FFA_RET_DENIED;
> +        goto out;
> +    }
> +
> +    if ( !ctx->rx_is_free )
> +    {
> +        ret =3D FFA_RET_BUSY;
>          goto out;
> +    }
> +
> +    if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
> +    {
> +        ret =3D ffa_simple_call(FFA_RX_ACQUIRE, ffa_get_vm_id(d), 0, 0, =
0);
> +        if ( ret !=3D FFA_RET_OK )
> +            goto out;
> +    }
>      ret =3D FFA_RET_OK;
> -    ctx->rx_is_free =3D true;
> +    ctx->rx_is_free =3D false;
>  out:
>      spin_unlock(&ctx->rx_lock);
>
>      return ret;
>  }
>
> -static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
> -                            uint32_t page_count)
> +int32_t ffa_rx_release(struct domain *d)
>  {
> -    return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count=
, 0);
> -}
> +    int32_t ret =3D FFA_RET_DENIED;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>
> -static int32_t ffa_rxtx_unmap(void)
> -{
> -    return ffa_simple_call(FFA_RXTX_UNMAP, 0, 0, 0, 0);
> +    spin_lock(&ctx->rx_lock);
> +
> +    if ( !ctx->page_count || ctx->rx_is_free )
> +        goto out;
> +
> +    if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
> +    {
> +        ret =3D ffa_simple_call(FFA_RX_RELEASE, ffa_get_vm_id(d), 0, 0, =
0);
> +        if ( ret !=3D FFA_RET_OK )
> +            goto out;
> +    }
> +    ret =3D FFA_RET_OK;
> +    ctx->rx_is_free =3D true;
> +out:
> +    spin_unlock(&ctx->rx_lock);
> +
> +    return ret;
>  }
>
>  void ffa_rxtx_domain_destroy(struct domain *d)
> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> index 29675f9ba3f7..d628c1b70609 100644
> --- a/xen/arch/arm/tee/ffa_shm.c
> +++ b/xen/arch/arm/tee/ffa_shm.c
> @@ -16,21 +16,6 @@
>
>  #include "ffa_private.h"
>
> -/* Constituent memory region descriptor */
> -struct ffa_address_range {
> -    uint64_t address;
> -    uint32_t page_count;
> -    uint32_t reserved;
> -};
> -
> -/* Composite memory region descriptor */
> -struct ffa_mem_region {
> -    uint32_t total_page_count;
> -    uint32_t address_range_count;
> -    uint64_t reserved;
> -    struct ffa_address_range address_range_array[];
> -};
> -
>  /* Memory access permissions descriptor */
>  struct ffa_mem_access_perm {
>      uint16_t endpoint_id;
> --
> 2.39.5 (Apple Git-154)
>
>

