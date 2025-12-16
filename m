Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500A8CC375C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 15:14:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187985.1509271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVVns-000655-UM; Tue, 16 Dec 2025 14:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187985.1509271; Tue, 16 Dec 2025 14:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVVns-00062M-RX; Tue, 16 Dec 2025 14:13:28 +0000
Received: by outflank-mailman (input) for mailman id 1187985;
 Tue, 16 Dec 2025 14:13:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5yu6=6W=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vVVnr-00062G-2f
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 14:13:27 +0000
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [2607:f8b0:4864:20::c36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62421e21-da89-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 15:13:25 +0100 (CET)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-657c68a08a7so2576472eaf.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 06:13:25 -0800 (PST)
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
X-Inumbo-ID: 62421e21-da89-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765894404; x=1766499204; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXRI1eebYRn+2Qk3nBtJwQJTZ8gFLuVutX9DwNG0k0k=;
        b=wfIQYKqB7Gv34N5Xwwqx2IqWrWygIqQ9Udi/bATT/8c9WLIzHUUMqQl/C1lXVfJH3+
         mBCM1fS09Xsb2O+XVDKr/p25hie8deUCgqjd2BxJ+IzgFuU1ervLty5nGdvAoQWUwO7d
         x0Oil6Tz569FZX7re/W8WhkLQlQbxHe17/xAjpMUy736FWYVTrJgxxj3obm1kHvt8fCT
         Y+n8ufIHfCeyeBpTWe2tifJJXLKyOAQliAONZdvcgrRY2wMvIQLfwbiydXoolEC4stqI
         KMsIgXoPL8TLnT464P1jl4EKj//+Gf9Aj1ZrruhskSa26+vmvqlnsdotdnC+tZriAtBT
         kLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765894404; x=1766499204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LXRI1eebYRn+2Qk3nBtJwQJTZ8gFLuVutX9DwNG0k0k=;
        b=PTH3TaE20MZLUDADzSPsSCWx10on8gAwodh4VurQfzIH72s2Yr3FrOfVgOtjeePj9H
         OWvgcnYshqfHG9prOpVcyQL9gZLE81rOrX+RnuYB4yBX4DS/r+woX83TD6FtUCcm3KjE
         M7enuXPjFz/4iYkZIAUmofQWZZymVtaYuB0GDW6BjRaaCc+K8hrCqx+SSp0xTZFRCP41
         JQTOg9qNsTHSb6mzV60PFDf+a+dmYsg8gyrTZP60H7PyW9i4Pe+pxyayTxMjfcOaPNOy
         9Mwl1PrcgLfZ6tT1yC7gid1zo2VAUX1Va+dAI1z3ckckHYHvd7bhMj+k7/wU5U1o2kbd
         ENAA==
X-Gm-Message-State: AOJu0YzGQ0hS6Y0GTl/RdzTYLAag9ZRHtVtN7Gg6V+/mwPDFTmN6NW6B
	R+4ZZP6Xrv5GNqB+o16du7WhvjxUKtIOxCnpwq52TaTkdnrA53lMsOTcf/ftLra7UyV3/KG+1eG
	9OOF4vI6aF2J5xDRncLpsh5WqTHdJd/x29VBCvxzUAw==
X-Gm-Gg: AY/fxX7+gs9hLlUSpZROisey14/xreyA5+rrlSF/JLHcDX8vNO0RmAxro5pJTFweiHr
	XFRSlk1wOw2xQ3TmjyF8FznIvc4H7VIEOF97uT4KYHcuQvJzSlhz5WNo6olcvqrRx7wyWIBoPd8
	pn2tkwIe3sA0YFoI3UBh8f0BpjBpXk8RLMk247gsx+NFjgvL17Z/cWsHZaL8ZYkuFNJVKQ7SrQI
	QETc8qLRJhmK7107pwJunM1GeQ6sf+RwAGSFuTeGtQ67wRTznl3Ey1GUoov7Xzu+aYy9tbOGvv1
	rkeSl9zCPkyTkX6tmrn89oJs/Q==
X-Google-Smtp-Source: AGHT+IE5A4uCkCHs8HojYgpnu+J9zDD3F/rTy6+M3e9gxXItkHcTd2166JhojdlNBhC5GTMGsN7c01hCv44QaOQdlFA=
X-Received: by 2002:a05:6820:2004:b0:659:9a49:8f8a with SMTP id
 006d021491bc7-65b4576fe5emr6496267eaf.79.1765894403467; Tue, 16 Dec 2025
 06:13:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765807707.git.bertrand.marquis@arm.com> <9810a2728cfd8541d6aa680c7af7728324e6a1dd.1765807707.git.bertrand.marquis@arm.com>
In-Reply-To: <9810a2728cfd8541d6aa680c7af7728324e6a1dd.1765807707.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 16 Dec 2025 15:13:09 +0100
X-Gm-Features: AQt7F2qouo3NKMyoZ7MQRVt2y4LkpWNqR0zLf1RRO_JuSI_klzZKdcGrUsSMyYg
Message-ID: <CAHUa44EvoYsgDA9FCofp0=Y1E=vvkURFMgWhagUoujHGsidVAg@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] xen/arm: ffa: rework SPMC RX/TX buffer management
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
> Rework how Xen accesses the RX/TX buffers shared with the SPMC so that
> ownership and locking are handled centrally.
>
> Move the SPMC RX/TX buffer bases into ffa_rxtx.c as ffa_spmc_rx/ffa_spmc_=
tx,
> protect them with dedicated ffa_spmc_{rx,tx}_lock spinlocks and expose
> ffa_rxtx_spmc_{rx,tx}_{acquire,release}() helpers instead of the global
> ffa_rx/ffa_tx pointers and ffa_{rx,tx}_buffer_lock.
>
> The RX helpers now always issue FFA_RX_RELEASE when we are done
> consuming data from the SPMC, so partition-info enumeration and shared
> memory paths release the RX buffer on all exit paths. The RX/TX mapping
> code is updated to use the descriptor offsets (rx_region_offs and
> tx_region_offs) rather than hard-coded structure layout, and to use the
> TX acquire/release helpers instead of touching the TX buffer directly.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
> - remove invalid ASSERT in SPMC RX/TX acquire as it is expected that the
>   buffer are already taken and the spinlock is here to serialize.
> Changes in v1:
> - modify share_shm function to use a goto and have one place to release
>   the spmc tx buffer instead of doing it directly in the if error
>   condition.
> - fix rx_acquire and tx_acquire to not release the spinlock as this is
>   expected to be done only in release to ensure no parallel usage.
> ---
>  xen/arch/arm/tee/ffa.c          |  22 +-----
>  xen/arch/arm/tee/ffa_partinfo.c |  40 +++++-----
>  xen/arch/arm/tee/ffa_private.h  |  18 ++---
>  xen/arch/arm/tee/ffa_rxtx.c     | 126 +++++++++++++++++++++++++-------
>  xen/arch/arm/tee/ffa_shm.c      |  29 +++++---
>  5 files changed, 149 insertions(+), 86 deletions(-)

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 497ada8264e0..43af49d1c011 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -48,8 +48,8 @@
>   *     notification for secure partitions
>   *   - doesn't support notifications for Xen itself
>   *
> - * There are some large locked sections with ffa_tx_buffer_lock and
> - * ffa_rx_buffer_lock. Especially the ffa_tx_buffer_lock spinlock used
> + * There are some large locked sections with ffa_spmc_tx_lock and
> + * ffa_spmc_rx_lock. Especially the ffa_spmc_tx_lock spinlock used
>   * around share_shm() is a very large locked section which can let one V=
M
>   * affect another VM.
>   */
> @@ -108,20 +108,6 @@ static const struct ffa_fw_abi ffa_fw_abi_needed[] =
=3D {
>      FW_ABI(FFA_RUN),
>  };
>
> -/*
> - * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
> - * number of pages used in each of these buffers.
> - *
> - * The RX buffer is protected from concurrent usage with ffa_rx_buffer_l=
ock.
> - * Note that the SPMC is also tracking the ownership of our RX buffer so
> - * for calls which uses our RX buffer to deliver a result we must call
> - * ffa_rx_release() to let the SPMC know that we're done with the buffer=
.
> - */
> -void *ffa_rx __read_mostly;
> -void *ffa_tx __read_mostly;
> -DEFINE_SPINLOCK(ffa_rx_buffer_lock);
> -DEFINE_SPINLOCK(ffa_tx_buffer_lock);
> -
>  LIST_HEAD(ffa_ctx_head);
>  /* RW Lock to protect addition/removal and reading in ffa_ctx_head */
>  DEFINE_RWLOCK(ffa_ctx_list_rwlock);
> @@ -617,7 +603,7 @@ static bool ffa_probe_fw(void)
>                     ffa_fw_abi_needed[i].name);
>      }
>
> -    if ( !ffa_rxtx_init() )
> +    if ( !ffa_rxtx_spmc_init() )
>      {
>          printk(XENLOG_ERR "ffa: Error during RXTX buffer init\n");
>          goto err_no_fw;
> @@ -631,7 +617,7 @@ static bool ffa_probe_fw(void)
>      return true;
>
>  err_rxtx_destroy:
> -    ffa_rxtx_destroy();
> +    ffa_rxtx_spmc_destroy();
>  err_no_fw:
>      ffa_fw_version =3D 0;
>      bitmap_zero(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index ec5a53ed1cab..145b869957b0 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -77,28 +77,24 @@ static int32_t ffa_get_sp_partinfo(uint32_t *uuid, ui=
nt32_t *sp_count,
>  {
>      int32_t ret;
>      uint32_t src_size, real_sp_count;
> -    void *src_buf =3D ffa_rx;
> +    void *src_buf;
>      uint32_t count =3D 0;
>
> -    /* Do we have a RX buffer with the SPMC */
> -    if ( !ffa_rx )
> -        return FFA_RET_DENIED;
> -
>      /* We need to use the RX buffer to receive the list */
> -    spin_lock(&ffa_rx_buffer_lock);
> +    src_buf =3D ffa_rxtx_spmc_rx_acquire();
> +    if ( !src_buf )
> +        return FFA_RET_DENIED;
>
>      ret =3D ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size);
>      if ( ret )
>          goto out;
>
> -    /* We now own the RX buffer */
> -
>      /* Validate the src_size we got */
>      if ( src_size < sizeof(struct ffa_partition_info_1_0) ||
>           src_size >=3D FFA_PAGE_SIZE )
>      {
>          ret =3D FFA_RET_NOT_SUPPORTED;
> -        goto out_release;
> +        goto out;
>      }
>
>      /*
> @@ -114,7 +110,7 @@ static int32_t ffa_get_sp_partinfo(uint32_t *uuid, ui=
nt32_t *sp_count,
>      if ( real_sp_count > (FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE) / src_siz=
e )
>      {
>          ret =3D FFA_RET_NOT_SUPPORTED;
> -        goto out_release;
> +        goto out;
>      }
>
>      for ( uint32_t sp_num =3D 0; sp_num < real_sp_count; sp_num++ )
> @@ -127,7 +123,7 @@ static int32_t ffa_get_sp_partinfo(uint32_t *uuid, ui=
nt32_t *sp_count,
>              if ( dst_buf > (end_buf - dst_size) )
>              {
>                  ret =3D FFA_RET_NO_MEMORY;
> -                goto out_release;
> +                goto out;
>              }
>
>              memcpy(dst_buf, src_buf, MIN(src_size, dst_size));
> @@ -143,10 +139,8 @@ static int32_t ffa_get_sp_partinfo(uint32_t *uuid, u=
int32_t *sp_count,
>
>      *sp_count =3D count;
>
> -out_release:
> -    ffa_hyp_rx_release();
>  out:
> -    spin_unlock(&ffa_rx_buffer_lock);
> +    ffa_rxtx_spmc_rx_release();
>      return ret;
>  }
>
> @@ -378,7 +372,7 @@ static void uninit_subscribers(void)
>          XFREE(subscr_vm_destroyed);
>  }
>
> -static bool init_subscribers(uint16_t count, uint32_t fpi_size)
> +static bool init_subscribers(void *buf, uint16_t count, uint32_t fpi_siz=
e)
>  {
>      uint16_t n;
>      uint16_t c_pos;
> @@ -395,7 +389,7 @@ static bool init_subscribers(uint16_t count, uint32_t=
 fpi_size)
>      subscr_vm_destroyed_count =3D 0;
>      for ( n =3D 0; n < count; n++ )
>      {
> -        fpi =3D ffa_rx + n * fpi_size;
> +        fpi =3D buf + n * fpi_size;
>
>          /*
>           * We need to have secure partitions using bit 15 set convention=
 for
> @@ -433,7 +427,7 @@ static bool init_subscribers(uint16_t count, uint32_t=
 fpi_size)
>
>      for ( c_pos =3D 0, d_pos =3D 0, n =3D 0; n < count; n++ )
>      {
> -        fpi =3D ffa_rx + n * fpi_size;
> +        fpi =3D buf + n * fpi_size;
>
>          if ( FFA_ID_IS_SECURE(fpi->id) )
>          {
> @@ -455,10 +449,14 @@ bool ffa_partinfo_init(void)
>      uint32_t fpi_size;
>      uint32_t count;
>      int e;
> +    void *spmc_rx;
>
>      if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) ||
> -         !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32) ||
> -         !ffa_rx || !ffa_tx )
> +         !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32))
> +        return false;
> +
> +    spmc_rx =3D ffa_rxtx_spmc_rx_acquire();
> +    if (!spmc_rx)
>          return false;
>
>      e =3D ffa_partition_info_get(NULL, 0, &count, &fpi_size);
> @@ -475,10 +473,10 @@ bool ffa_partinfo_init(void)
>          goto out;
>      }
>
> -    ret =3D init_subscribers(count, fpi_size);
> +    ret =3D init_subscribers(spmc_rx, count, fpi_size);
>
>  out:
> -    ffa_hyp_rx_release();
> +    ffa_rxtx_spmc_rx_release();
>      return ret;
>  }
>
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 0bb5a84553ce..4c97041829a9 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -416,10 +416,6 @@ struct ffa_ctx {
>      unsigned long *vm_destroy_bitmap;
>  };
>
> -extern void *ffa_rx;
> -extern void *ffa_tx;
> -extern spinlock_t ffa_rx_buffer_lock;
> -extern spinlock_t ffa_tx_buffer_lock;
>  extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
>
>  extern struct list_head ffa_ctx_head;
> @@ -437,8 +433,13 @@ int ffa_partinfo_domain_init(struct domain *d);
>  bool ffa_partinfo_domain_destroy(struct domain *d);
>  void ffa_handle_partition_info_get(struct cpu_user_regs *regs);
>
> -bool ffa_rxtx_init(void);
> -void ffa_rxtx_destroy(void);
> +bool ffa_rxtx_spmc_init(void);
> +void ffa_rxtx_spmc_destroy(void);
> +void *ffa_rxtx_spmc_rx_acquire(void);
> +void ffa_rxtx_spmc_rx_release(void);
> +void *ffa_rxtx_spmc_tx_acquire(void);
> +void ffa_rxtx_spmc_tx_release(void);
> +
>  int32_t ffa_rxtx_domain_init(struct domain *d);
>  void ffa_rxtx_domain_destroy(struct domain *d);
>  int32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
> @@ -568,11 +569,6 @@ static inline int32_t ffa_simple_call(uint32_t fid, =
register_t a1,
>      return ffa_get_ret_code(&resp);
>  }
>
> -static inline int32_t ffa_hyp_rx_release(void)
> -{
> -    return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> -}
> -
>  static inline bool ffa_fw_supports_fid(uint32_t fid)
>  {
>      BUILD_BUG_ON(FFA_FNUM_MIN_VALUE > FFA_FNUM_MAX_VALUE);
> diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
> index 5776693bb3f0..63203b22b84c 100644
> --- a/xen/arch/arm/tee/ffa_rxtx.c
> +++ b/xen/arch/arm/tee/ffa_rxtx.c
> @@ -30,6 +30,20 @@ struct ffa_endpoint_rxtx_descriptor_1_1 {
>      uint32_t tx_region_offs;
>  };
>
> +/*
> + * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
> + * number of pages used in each of these buffers.
> + * Each buffer has its own lock to protect from concurrent usage.
> + *
> + * Note that the SPMC is also tracking the ownership of our RX buffer so
> + * for calls which uses our RX buffer to deliver a result we must do an
> + * FFA_RX_RELEASE to let the SPMC know that we're done with the buffer.
> + */
> +static void *ffa_spmc_rx __read_mostly;
> +static void *ffa_spmc_tx __read_mostly;
> +static DEFINE_SPINLOCK(ffa_spmc_rx_lock);
> +static DEFINE_SPINLOCK(ffa_spmc_tx_lock);
> +
>  static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
>                              uint32_t page_count)
>  {
> @@ -126,8 +140,9 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t =
tx_addr,
>                       sizeof(struct ffa_address_range) * 2 >
>                       FFA_MAX_RXTX_PAGE_COUNT * FFA_PAGE_SIZE);
>
> -        spin_lock(&ffa_tx_buffer_lock);
> -        rxtx_desc =3D ffa_tx;
> +        rxtx_desc =3D ffa_rxtx_spmc_tx_acquire();
> +        if ( !rxtx_desc )
> +            goto err_unmap_rx;
>
>          /*
>           * We have only one page for each so we pack everything:
> @@ -144,7 +159,7 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t =
tx_addr,
>                                               address_range_array[1]);
>
>          /* rx buffer */
> -        mem_reg =3D ffa_tx + sizeof(*rxtx_desc);
> +        mem_reg =3D (void *)rxtx_desc + rxtx_desc->rx_region_offs;
>          mem_reg->total_page_count =3D 1;
>          mem_reg->address_range_count =3D 1;
>          mem_reg->reserved =3D 0;
> @@ -154,7 +169,7 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t =
tx_addr,
>          mem_reg->address_range_array[0].reserved =3D 0;
>
>          /* tx buffer */
> -        mem_reg =3D ffa_tx + rxtx_desc->tx_region_offs;
> +        mem_reg =3D (void *)rxtx_desc + rxtx_desc->tx_region_offs;
>          mem_reg->total_page_count =3D 1;
>          mem_reg->address_range_count =3D 1;
>          mem_reg->reserved =3D 0;
> @@ -165,7 +180,7 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t =
tx_addr,
>
>          ret =3D ffa_rxtx_map(0, 0, 0);
>
> -        spin_unlock(&ffa_tx_buffer_lock);
> +        ffa_rxtx_spmc_tx_release();
>
>          if ( ret !=3D FFA_RET_OK )
>              goto err_unmap_rx;
> @@ -319,49 +334,108 @@ void ffa_rxtx_domain_destroy(struct domain *d)
>      rxtx_unmap(d);
>  }
>
> -void ffa_rxtx_destroy(void)
> +void *ffa_rxtx_spmc_rx_acquire(void)
> +{
> +    spin_lock(&ffa_spmc_rx_lock);
> +
> +    if ( ffa_spmc_rx )
> +        return ffa_spmc_rx;
> +
> +    return NULL;
> +}
> +
> +void ffa_rxtx_spmc_rx_release(void)
> +{
> +    int32_t ret;
> +
> +    ASSERT(spin_is_locked(&ffa_spmc_rx_lock));
> +
> +    /* Inform the SPMC that we are done with our RX buffer */
> +    ret =3D ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> +    if ( ret !=3D FFA_RET_OK )
> +        printk(XENLOG_DEBUG "Error releasing SPMC RX buffer: %d\n", ret)=
;
> +
> +    spin_unlock(&ffa_spmc_rx_lock);
> +}
> +
> +void *ffa_rxtx_spmc_tx_acquire(void)
>  {
> -    bool need_unmap =3D ffa_tx && ffa_rx;
> +    spin_lock(&ffa_spmc_tx_lock);
>
> -    if ( ffa_tx )
> +    if ( ffa_spmc_tx )
> +        return ffa_spmc_tx;
> +
> +    return NULL;
> +}
> +
> +void ffa_rxtx_spmc_tx_release(void)
> +{
> +    ASSERT(spin_is_locked(&ffa_spmc_tx_lock));
> +
> +    spin_unlock(&ffa_spmc_tx_lock);
> +}
> +
> +void ffa_rxtx_spmc_destroy(void)
> +{
> +    bool need_unmap;
> +
> +    spin_lock(&ffa_spmc_rx_lock);
> +    spin_lock(&ffa_spmc_tx_lock);
> +    need_unmap =3D ffa_spmc_tx && ffa_spmc_rx;
> +
> +    if ( ffa_spmc_tx )
>      {
> -        free_xenheap_pages(ffa_tx, 0);
> -        ffa_tx =3D NULL;
> +        free_xenheap_pages(ffa_spmc_tx, 0);
> +        ffa_spmc_tx =3D NULL;
>      }
> -    if ( ffa_rx )
> +    if ( ffa_spmc_rx )
>      {
> -        free_xenheap_pages(ffa_rx, 0);
> -        ffa_rx =3D NULL;
> +        free_xenheap_pages(ffa_spmc_rx, 0);
> +        ffa_spmc_rx =3D NULL;
>      }
>
>      if ( need_unmap )
>          ffa_rxtx_unmap(0);
> +
> +    spin_unlock(&ffa_spmc_tx_lock);
> +    spin_unlock(&ffa_spmc_rx_lock);
>  }
>
> -bool ffa_rxtx_init(void)
> +bool ffa_rxtx_spmc_init(void)
>  {
>      int32_t e;
> +    bool ret =3D false;
>
>      /* Firmware not there or not supporting */
>      if ( !ffa_fw_supports_fid(FFA_RXTX_MAP_64) )
>          return false;
>
> -    ffa_rx =3D alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_CO=
UNT), 0);
> -    if ( !ffa_rx )
> -        return false;
> +    spin_lock(&ffa_spmc_rx_lock);
> +    spin_lock(&ffa_spmc_tx_lock);
>
> -    ffa_tx =3D alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_CO=
UNT), 0);
> -    if ( !ffa_tx )
> -        goto err;
> +    ffa_spmc_rx =3D alloc_xenheap_pages(
> +                            get_order_from_pages(FFA_RXTX_PAGE_COUNT), 0=
);
> +    if ( !ffa_spmc_rx )
> +        goto exit;
>
> -    e =3D ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), FFA_RXTX_PAGE_COUNT);
> +    ffa_spmc_tx =3D alloc_xenheap_pages(
> +                            get_order_from_pages(FFA_RXTX_PAGE_COUNT), 0=
);
> +    if ( !ffa_spmc_tx )
> +        goto exit;
> +
> +    e =3D ffa_rxtx_map(__pa(ffa_spmc_tx), __pa(ffa_spmc_rx),
> +                     FFA_RXTX_PAGE_COUNT);
>      if ( e )
> -        goto err;
> +        goto exit;
> +
> +    ret =3D true;
>
> -    return true;
> +exit:
> +    spin_unlock(&ffa_spmc_tx_lock);
> +    spin_unlock(&ffa_spmc_rx_lock);
>
> -err:
> -    ffa_rxtx_destroy();
> +    if ( !ret )
> +        ffa_rxtx_spmc_destroy();
>
> -    return false;
> +    return ret;
>  }
> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> index dad3da192247..e275d3769d9b 100644
> --- a/xen/arch/arm/tee/ffa_shm.c
> +++ b/xen/arch/arm/tee/ffa_shm.c
> @@ -286,9 +286,8 @@ static void init_range(struct ffa_address_range *addr=
_range,
>  }
>
>  /*
> - * This function uses the ffa_tx buffer to transmit the memory transacti=
on
> - * descriptor. The function depends ffa_tx_buffer_lock to be used to gua=
rd
> - * the buffer from concurrent use.
> + * This function uses the ffa_spmc tx buffer to transmit the memory tran=
saction
> + * descriptor.
>   */
>  static int share_shm(struct ffa_shm_mem *shm)
>  {
> @@ -298,17 +297,22 @@ static int share_shm(struct ffa_shm_mem *shm)
>      struct ffa_address_range *addr_range;
>      struct ffa_mem_region *region_descr;
>      const unsigned int region_count =3D 1;
> -    void *buf =3D ffa_tx;
>      uint32_t frag_len;
>      uint32_t tot_len;
>      paddr_t last_pa;
>      unsigned int n;
>      paddr_t pa;
> +    int32_t ret;
> +    void *buf;
>
> -    ASSERT(spin_is_locked(&ffa_tx_buffer_lock));
>      ASSERT(shm->page_count);
>
> +    buf =3D ffa_rxtx_spmc_tx_acquire();
> +    if ( !buf )
> +        return FFA_RET_NOT_SUPPORTED;
> +
>      descr =3D buf;
> +
>      memset(descr, 0, sizeof(*descr));
>      descr->sender_id =3D shm->sender_id;
>      descr->handle =3D shm->handle;
> @@ -340,7 +344,10 @@ static int share_shm(struct ffa_shm_mem *shm)
>      tot_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_count,
>                                  region_descr->address_range_count);
>      if ( tot_len > max_frag_len )
> -        return FFA_RET_NOT_SUPPORTED;
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out;
> +    }
>
>      addr_range =3D region_descr->address_range_array;
>      frag_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_count=
, 1);
> @@ -360,7 +367,12 @@ static int share_shm(struct ffa_shm_mem *shm)
>          init_range(addr_range, pa);
>      }
>
> -    return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> +    ret =3D ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> +
> +out:
> +    ffa_rxtx_spmc_tx_release();
> +
> +    return ret;
>  }
>
>  static int read_mem_transaction(uint32_t ffa_vers, const void *buf, size=
_t blen,
> @@ -579,10 +591,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs=
)
>      if ( ret )
>          goto out;
>
> -    /* Note that share_shm() uses our tx buffer */
> -    spin_lock(&ffa_tx_buffer_lock);
>      ret =3D share_shm(shm);
> -    spin_unlock(&ffa_tx_buffer_lock);
>      if ( ret )
>          goto out;
>
> --
> 2.51.2
>

