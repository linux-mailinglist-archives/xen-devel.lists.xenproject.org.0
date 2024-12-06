Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2B09E6860
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 09:00:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849894.1264394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJTF0-000061-Te; Fri, 06 Dec 2024 07:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849894.1264394; Fri, 06 Dec 2024 07:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJTF0-0008VH-Qg; Fri, 06 Dec 2024 07:59:10 +0000
Received: by outflank-mailman (input) for mailman id 849894;
 Fri, 06 Dec 2024 07:59:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQh0=S7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1tJTEy-0008VB-Eo
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 07:59:08 +0000
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [2001:4860:4864:20::36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f73ed596-b3a7-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 08:59:06 +0100 (CET)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-29654932226so948179fac.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2024 23:59:06 -0800 (PST)
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
X-Inumbo-ID: f73ed596-b3a7-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733471945; x=1734076745; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YvyLJeFTkW8Aygi/0tkmgWGqrDPo/MIJUCL1hTOEp4=;
        b=rAzihSnp0/vSB5EvufSsBOFR1UHTS7YWdmuLBCcGuDwq89K4+Ib20+5kmbkEhUbedr
         5so2nQjSF/Iy3+nv+HKjB87xpWUoeTSZnBH0yWELE3wRznIDwrXFkWx+VEHTHu+iaY2v
         rUXNchjsUYgssSIUhhcCdHiL+UV4F4OQbKAt/iR/90qWk6/Df6d7Na+KENnVLlwGbnBG
         3ZbVIGMwzapGB7BGLjVXkkEqpWmbulhaZ5x7rSbOHSqZgi1bMHkGzBZzC8MNJrN6R69o
         6FOEpNfmxLoOSRDWOEz4T0TdCKYecDLEVAhjC41JaX4qertE4bU0PfQOd+2UNXfJW0H2
         YvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733471945; x=1734076745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YvyLJeFTkW8Aygi/0tkmgWGqrDPo/MIJUCL1hTOEp4=;
        b=c0po40G6Eom9ZYwAe4tnUmCuYVxioyN7dGx45c+9JnaUfIqw9zOsxpze2GmtIEmI+u
         Di6C+91wcbz1h/g27T+NmHE+HuMwLeVuBoUJT1AeRaIJsmGOhH8QPVxDK61ti91n3e5R
         yOeakvdMlF6exLOjmWNUW3oTwafkM3pqYChTTcl1+hx8XVdPqqpUB7XQO3Rwv0L59qkP
         yNGZiV1hiAuDfH5ATzElA0bpDTYghH8oZ8PHupJB3kpQMV1jTcG6+Ow1xrA6EewDr5QE
         d9MAa2Y3prFp1vvrdRjNKg9JeYXTPV5OgBqPLT9pHX40tzMrOcKSNTrl0ROUZ3U2TKJJ
         zOUA==
X-Gm-Message-State: AOJu0YxA6JizPeXGZR5BRzCsUfy+C5bIIQBpaMkUun0pu2ZK0+Hh+cI/
	d+R1hMhlbLvJhuIX3iiwvrKYrZanbLKp0GZMheH6PEOXF5QHOvgC8gJ3Bf4IAwQBJjVvoS2DXcs
	1PiZ7Aw142HWoexZCaxGXMDHxP9DNUPjcfh0XGQ==
X-Gm-Gg: ASbGncvGi0rz515l7IzVEME+OaMRG0I1WzyIINDte+TDIOHzWsnlqT4gbzLZg7Q9aEk
	sF27x1QAqJ+/ZMG2M2mwEi9vYd0zsR+k=
X-Google-Smtp-Source: AGHT+IGJS06Sp7PkFKH5KQuNr7udauDoCCdoIQ3OHtZZx84DAz8pszc/pFC30spqW8H0RfwrZfk5ibvtIhgdcr8710U=
X-Received: by 2002:a05:6870:1f19:b0:29d:caa2:f0ef with SMTP id
 586e51a60fabf-29f71b3ffa2mr1279752fac.6.1733471945379; Thu, 05 Dec 2024
 23:59:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1732702210.git.bertrand.marquis@arm.com> <56217f2f7b4c29a5f84fb02de3f4cbb8342c5560.1732702210.git.bertrand.marquis@arm.com>
In-Reply-To: <56217f2f7b4c29a5f84fb02de3f4cbb8342c5560.1732702210.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 6 Dec 2024 08:58:53 +0100
Message-ID: <CAHUa44Gp1sMKY7txO9cXu1=K1+g5XdEB-0MsN_4v9Em=Vd9FSw@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] xen/arm: ffa: Transmit RXTX buffers to the SPMC
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
> While there also fix ffa_handle_rxtx_map which was testing the wrong
> variable after getting the page for the rx buffer, testing tx_pg
> instead of rx_pg.
>
> Fixes: be75f686eb03 ("xen/arm: ffa: separate rxtx buffer routines")
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v3:
> - add a comment to explain why we only release the RX buffer if an error
>   occurs during partition_info_get
> - fix the BUILD_BUG_ON check for TX buffer size in rxtx_map (coding
>   style and use PAGE_SIZE * NUM_PAGE)
> - remove invalid 3 argument to ffa_rxtx_map when forwarding the call to
>   the SPMC
> - fix bug in ffa_handle_rxtx_map testing wrong variable
> Changes in v2:
> - unmap VM rxtx buffer in SPMC on unmap call or on VM destroy
> - rework the unmap call to the SPMC to properly pass the VM ID
> ---
>  xen/arch/arm/tee/ffa.c          |   2 +-
>  xen/arch/arm/tee/ffa_partinfo.c |  36 ++++---
>  xen/arch/arm/tee/ffa_private.h  |  22 ++++-
>  xen/arch/arm/tee/ffa_rxtx.c     | 161 ++++++++++++++++++++++++++------
>  xen/arch/arm/tee/ffa_shm.c      |  15 ---
>  5 files changed, 170 insertions(+), 66 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 0026ac9134ad..bc2722d53fd7 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -347,7 +347,7 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
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
> index 74324e1d9d3f..939ed49dd3da 100644
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
> @@ -190,15 +182,20 @@ void ffa_handle_partition_info_get(struct cpu_user_=
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
> +    /*
> +     * The calling VM RX buffer only contains data to be used by the VM =
if the
> +     * call was successfull, in which case the VM has to release the buf=
fer

successful

> +     * once it has used the data.
> +     * If something went wrong during the call, we have to release the R=
X
> +     * buffer back to the SPMC as the VM will not do it.
> +     */
> +    if ( ret !=3D FFA_RET_OK )
> +        ffa_rx_release(d);
>  out:
>      if ( ret )
>          ffa_set_regs_error(regs, ret);
> @@ -365,8 +362,7 @@ bool ffa_partinfo_init(void)
>      ret =3D init_subscribers(count, fpi_size);
>
>  out:
> -    ffa_rx_release();
> -
> +    ffa_hyp_rx_release();
>      return ret;
>  }
>
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index afe69b43dbef..9adfe687c3c9 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -265,6 +265,21 @@
>  #define FFA_ABI_BITNUM(id)    ((FFA_ABI_ID(id) - FFA_ABI_MIN) << 1 | \
>                                 FFA_ABI_CONV(id))
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
> @@ -292,7 +307,7 @@ struct ffa_ctx {
>      struct ffa_ctx_notif notif;
>      /*
>       * tx_lock is used to serialize access to tx
> -     * rx_lock is used to serialize access to rx
> +     * rx_lock is used to serialize access to rx_is_free
>       * lock is used for the rest in this struct
>       */
>      spinlock_t tx_lock;
> @@ -331,7 +346,8 @@ void ffa_rxtx_domain_destroy(struct domain *d);
>  uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
>                              register_t rx_addr, uint32_t page_count);
>  uint32_t ffa_handle_rxtx_unmap(void);
> -int32_t ffa_handle_rx_release(void);
> +int32_t ffa_rx_acquire(struct domain *d);
> +int32_t ffa_rx_release(struct domain *d);
>
>  void ffa_notif_init(void);
>  void ffa_notif_init_interrupt(void);
> @@ -420,7 +436,7 @@ static inline int32_t ffa_simple_call(uint32_t fid, r=
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
> index 132a7982407b..e1cab7fa5e46 100644
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
> +static int32_t ffa_rxtx_unmap(uint16_t id)
> +{
> +    return ffa_simple_call(FFA_RXTX_UNMAP, ((uint64_t)id)<<16, 0, 0, 0);

Please add a space before and after the "<<" operator.

Cheers,
Jens

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
> @@ -72,7 +86,7 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t t=
x_addr,
>          goto err_put_tx_pg;
>
>      rx_pg =3D get_page_from_gfn(d, gfn_x(gaddr_to_gfn(rx_addr)), &t, P2M=
_ALLOC);
> -    if ( !tx_pg )
> +    if ( !rx_pg )
>          goto err_put_tx_pg;
>
>      /* Only normal RW RAM for now */
> @@ -87,6 +101,66 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t=
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
> +        BUILD_BUG_ON(sizeof(*rxtx_desc) + sizeof(*mem_reg) * 2 +
> +                     sizeof(struct ffa_address_range) * 2 >
> +                     FFA_MAX_RXTX_PAGE_COUNT * FFA_PAGE_SIZE);
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
> +        ret =3D ffa_rxtx_map(0, 0, 0);
> +
> +        spin_unlock(&ffa_tx_buffer_lock);
> +
> +        if ( ret !=3D FFA_RET_OK )
> +            goto err_unmap_rx;
> +    }
> +
>      ctx->rx =3D rx;
>      ctx->tx =3D tx;
>      ctx->rx_pg =3D rx_pg;
> @@ -95,6 +169,8 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t =
tx_addr,
>      ctx->rx_is_free =3D true;
>      return FFA_RET_OK;
>
> +err_unmap_rx:
> +    unmap_domain_page_global(rx);
>  err_unmap_tx:
>      unmap_domain_page_global(tx);
>  err_put_rx_pg:
> @@ -105,8 +181,22 @@ err_put_tx_pg:
>      return ret;
>  }
>
> -static void rxtx_unmap(struct ffa_ctx *ctx)
> +static uint32_t  rxtx_unmap(struct domain *d)
>  {
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( !ctx->page_count )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
> +    {
> +        uint32_t ret;
> +
> +        ret =3D ffa_rxtx_unmap(ffa_get_vm_id(d));
> +        if ( ret !=3D FFA_RET_OK )
> +            return ret;
> +    }
> +
>      unmap_domain_page_global(ctx->rx);
>      unmap_domain_page_global(ctx->tx);
>      put_page(ctx->rx_pg);
> @@ -117,32 +207,63 @@ static void rxtx_unmap(struct ffa_ctx *ctx)
>      ctx->tx_pg =3D NULL;
>      ctx->page_count =3D 0;
>      ctx->rx_is_free =3D false;
> +
> +    return FFA_RET_OK;
>  }
>
>  uint32_t ffa_handle_rxtx_unmap(void)
>  {
> -    struct domain *d =3D current->domain;
> +    return rxtx_unmap(current->domain);
> +}
> +
> +int32_t ffa_rx_acquire(struct domain *d)
> +{
> +    int32_t ret =3D FFA_RET_OK;
>      struct ffa_ctx *ctx =3D d->arch.tee;
>
> -    if ( !ctx->rx )
> -        return FFA_RET_INVALID_PARAMETERS;
> +    spin_lock(&ctx->rx_lock);
>
> -    rxtx_unmap(ctx);
> +    if ( !ctx->page_count )
> +    {
> +        ret =3D FFA_RET_DENIED;
> +        goto out;
> +    }
>
> -    return FFA_RET_OK;
> +    if ( !ctx->rx_is_free )
> +    {
> +        ret =3D FFA_RET_BUSY;
> +        goto out;
> +    }
> +
> +    if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
> +    {
> +        ret =3D ffa_simple_call(FFA_RX_ACQUIRE, ffa_get_vm_id(d), 0, 0, =
0);
> +        if ( ret !=3D FFA_RET_OK )
> +            goto out;
> +    }
> +    ctx->rx_is_free =3D false;
> +out:
> +    spin_unlock(&ctx->rx_lock);
> +
> +    return ret;
>  }
>
> -int32_t ffa_handle_rx_release(void)
> +int32_t ffa_rx_release(struct domain *d)
>  {
>      int32_t ret =3D FFA_RET_DENIED;
> -    struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
>
> -    if ( !spin_trylock(&ctx->rx_lock) )
> -        return FFA_RET_BUSY;
> +    spin_lock(&ctx->rx_lock);
>
>      if ( !ctx->page_count || ctx->rx_is_free )
>          goto out;
> +
> +    if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
> +    {
> +        ret =3D ffa_simple_call(FFA_RX_RELEASE, ffa_get_vm_id(d), 0, 0, =
0);
> +        if ( ret !=3D FFA_RET_OK )
> +            goto out;
> +    }
>      ret =3D FFA_RET_OK;
>      ctx->rx_is_free =3D true;
>  out:
> @@ -151,23 +272,9 @@ out:
>      return ret;
>  }
>
> -static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
> -                            uint32_t page_count)
> -{
> -    return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count=
, 0);
> -}
> -
> -static int32_t ffa_rxtx_unmap(void)
> -{
> -    return ffa_simple_call(FFA_RXTX_UNMAP, 0, 0, 0, 0);
> -}
> -
>  void ffa_rxtx_domain_destroy(struct domain *d)
>  {
> -    struct ffa_ctx *ctx =3D d->arch.tee;
> -
> -    if ( ctx->rx )
> -        rxtx_unmap(ctx);
> +    rxtx_unmap(d);
>  }
>
>  void ffa_rxtx_destroy(void)
> @@ -186,7 +293,7 @@ void ffa_rxtx_destroy(void)
>      }
>
>      if ( need_unmap )
> -        ffa_rxtx_unmap();
> +        ffa_rxtx_unmap(0);
>  }
>
>  bool ffa_rxtx_init(void)
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
> 2.47.0
>

