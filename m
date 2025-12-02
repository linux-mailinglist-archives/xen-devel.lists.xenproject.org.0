Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBB6C9BB67
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 15:09:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176208.1500728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQR44-0002tt-6K; Tue, 02 Dec 2025 14:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176208.1500728; Tue, 02 Dec 2025 14:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQR44-0002rO-3N; Tue, 02 Dec 2025 14:09:12 +0000
Received: by outflank-mailman (input) for mailman id 1176208;
 Tue, 02 Dec 2025 14:09:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JGiA=6I=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vQR41-0002rI-TQ
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 14:09:10 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74d03cbd-cf88-11f0-980a-7dc792cee155;
 Tue, 02 Dec 2025 15:09:03 +0100 (CET)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-6593155d8d6so3233169eaf.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Dec 2025 06:09:03 -0800 (PST)
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
X-Inumbo-ID: 74d03cbd-cf88-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764684542; x=1765289342; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMJRjpO/S7Wdq89Bj8nSRX3fzb+MzOOYdbOhquH4bhg=;
        b=rkXBkCLTJ4BVyw34OqIZPXKEa2upYbFoF2ZACmE0GVqbMq5LfozbJ9hyt1NjdGLkZD
         Oos2qbsYwincYa85GJ00hYb7HZRTi7EKD+5ylC65Zyc4us/J//uyGACjYrdd1htm3Jfv
         6aHA6xyCA/TJX03VrZx9kDQ58tSLHG4s0zn/uvWZkflQZwjyTNN+b2kO9q/q35yQFqGn
         e6fn2HLuG0W9t024PIA4Zi7tu5NN/tb8PUes5wQ0X+otmaw8J6xhmB7wjidqJDJZ8yc7
         ZHMtOrqLRVLd9+DqzkvHc1Ao9y6Aj/FjwIRyqHyWCtz6I/9FRgh5BP1BzMLauIlvPLDg
         3TAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764684542; x=1765289342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HMJRjpO/S7Wdq89Bj8nSRX3fzb+MzOOYdbOhquH4bhg=;
        b=SvJ11DWmHDIuwzqnR2G2CUfSmN+LJ5NVT+Z1J0oYuVEhhohk+Uej6u71Mz4m6993ic
         EtgSlPUDbdN8p447h7SqUv0tw0G+PaJWP6/fZb/aoVkntHmjir/FAcXqx/1J/LwypJ0w
         WrG6/gYzmq7prQ939dzXVOAjHLW93frv1KGAT1rfRNir4Cq48ihhiC+YXMMzIWcZgV67
         j5mW6/XR/L5XaGM0XDJkPB6+Vf9xDlbuyAMo7WUJn55kGZ+igqM/LNO8KpYb2/Ty5VwO
         mQUkv5OLIfQbSxxs73aSKdP37DibppKibKbIjNsPtDtNtSvLoue6mYmzRXs9tPtwJejx
         BYaw==
X-Gm-Message-State: AOJu0YwJNgKHo0ZXPl2rLab988O4fJbp6VIAl/ZmIzK/WOnMq5Zwogmg
	Dy1M7M3WIN3UHah4Y/EVF4VRS8zVrZMPgi1jcgr8+tPu7QCb7p5/nAFCpFN7E04hBQascwhzioa
	tqj1OjjOMCXJr3IBm0IHv4fh57fEqVSsmsITOFZKu1A==
X-Gm-Gg: ASbGnct7P150AId/Kqg9YOtkN5LL0SKnm4CexD2w7zlPkM4hJYPVjDbdTla4lGkXuPD
	lVyp5ydJ+9uJd8XD7kvmVknOMqe8jm1oeYVEN3hhLgf838JZl3/MZ7rtJ+6J0H/50V98RwHbp8z
	5JQ67bPz/5ColLfd5b5st3RyaW4y9uSdvhcIjF4KTHtIP/XPah6IrZKtyWS3Q7foCHggrbYYOqB
	Ybhd3/O4rFdo2iLQFSbeslTwVNLzt3hPFIXk8KwPf/Hy5asygnSOurcGaAGAJHH5yJZw3Xc4itk
	vEoGaoaxKwyjkiI6Z0jmCpQ43Q==
X-Google-Smtp-Source: AGHT+IEU4C6DfeWKDH2Whf8q5gqWTGwwmhXNIByH0zFFxZGA6v/amwVUeeXnUrQs0XrtJrc0w7kcznSZdY49L/hrcCU=
X-Received: by 2002:a05:6820:1ca2:b0:654:f20e:2d02 with SMTP id
 006d021491bc7-65791b33afemr16722901eaf.0.1764684542276; Tue, 02 Dec 2025
 06:09:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764254975.git.bertrand.marquis@arm.com> <72d6592157a9ec15d4b5de19751186e0ca1680ba.1764254975.git.bertrand.marquis@arm.com>
In-Reply-To: <72d6592157a9ec15d4b5de19751186e0ca1680ba.1764254975.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 2 Dec 2025 15:08:50 +0100
X-Gm-Features: AWmQ_bkhUF11SjTrIj1vnKhuA4D_ldb4z2Rw5QYJ9HWpmfNwa2f7qZNsbg7E1RE
Message-ID: <CAHUa44Gq4L95i3wTMEVRoFNFt2PzPCKGAuF4KT3YL9mfmT2FRA@mail.gmail.com>
Subject: Re: [PATCH 04/10] xen/arm: ffa: rework SPMC RX/TX buffer management
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
>  xen/arch/arm/tee/ffa.c          |  22 +-----
>  xen/arch/arm/tee/ffa_partinfo.c |  40 +++++-----
>  xen/arch/arm/tee/ffa_private.h  |  18 ++---
>  xen/arch/arm/tee/ffa_rxtx.c     | 132 +++++++++++++++++++++++++-------
>  xen/arch/arm/tee/ffa_shm.c      |  26 ++++---
>  5 files changed, 153 insertions(+), 85 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 47f426e85864..4c1b9a4c3b48 100644
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
> @@ -612,7 +598,7 @@ static bool ffa_probe_fw(void)
>                     ffa_fw_abi_needed[i].name);
>      }
>
> -    if ( !ffa_rxtx_init() )
> +    if ( !ffa_rxtx_spmc_init() )
>      {
>          printk(XENLOG_ERR "ffa: Error during RXTX buffer init\n");
>          goto err_no_fw;
> @@ -626,7 +612,7 @@ static bool ffa_probe_fw(void)
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
> index fa56b1587e3b..766b75dffb8c 100644
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
> index 4272afd37343..cd35c44b8986 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -404,10 +404,6 @@ struct ffa_ctx {
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
> @@ -425,8 +421,13 @@ int ffa_partinfo_domain_init(struct domain *d);
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
> @@ -556,11 +557,6 @@ static inline int32_t ffa_simple_call(uint32_t fid, =
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
> index cd467d1dba68..07b01430d139 100644
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
> @@ -120,8 +134,9 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t =
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
> @@ -138,7 +153,7 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t =
tx_addr,
>                                               address_range_array[1]);
>
>          /* rx buffer */
> -        mem_reg =3D ffa_tx + sizeof(*rxtx_desc);
> +        mem_reg =3D (void *)rxtx_desc + rxtx_desc->rx_region_offs;
>          mem_reg->total_page_count =3D 1;
>          mem_reg->address_range_count =3D 1;
>          mem_reg->reserved =3D 0;
> @@ -148,7 +163,7 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t =
tx_addr,
>          mem_reg->address_range_array[0].reserved =3D 0;
>
>          /* tx buffer */
> -        mem_reg =3D ffa_tx + rxtx_desc->tx_region_offs;
> +        mem_reg =3D (void *)rxtx_desc + rxtx_desc->tx_region_offs;
>          mem_reg->total_page_count =3D 1;
>          mem_reg->address_range_count =3D 1;
>          mem_reg->reserved =3D 0;
> @@ -159,7 +174,7 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t =
tx_addr,
>
>          ret =3D ffa_rxtx_map(0, 0, 0);
>
> -        spin_unlock(&ffa_tx_buffer_lock);
> +        ffa_rxtx_spmc_tx_release();
>
>          if ( ret !=3D FFA_RET_OK )
>              goto err_unmap_rx;
> @@ -291,49 +306,114 @@ void ffa_rxtx_domain_destroy(struct domain *d)
>      rxtx_unmap(d);
>  }
>
> -void ffa_rxtx_destroy(void)
> +void *ffa_rxtx_spmc_rx_acquire(void)
> +{
> +    ASSERT(!spin_is_locked(&ffa_spmc_rx_lock));

Is it invalid for two CPUs to concurrently try to acquire the RX buffer?

> +
> +    spin_lock(&ffa_spmc_rx_lock);
> +
> +    if ( ffa_spmc_rx )
> +        return ffa_spmc_rx;
> +
> +    spin_unlock(&ffa_spmc_rx_lock);
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
> +    ASSERT(!spin_is_locked(&ffa_spmc_tx_lock));

Is it invalid for two CPUs to concurrently try to acquire the TX buffer?

>
> -    if ( ffa_tx )
> +    spin_lock(&ffa_spmc_tx_lock);
> +
> +    if ( ffa_spmc_tx )
> +        return ffa_spmc_tx;
> +
> +    spin_unlock(&ffa_spmc_tx_lock);
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
> +
> +    ffa_spmc_rx =3D alloc_xenheap_pages(
> +                            get_order_from_pages(FFA_RXTX_PAGE_COUNT), 0=
);
> +    if ( !ffa_spmc_rx )
> +        goto exit;
>
> -    ffa_tx =3D alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_CO=
UNT), 0);
> -    if ( !ffa_tx )
> -        goto err;
> +    ffa_spmc_tx =3D alloc_xenheap_pages(
> +                            get_order_from_pages(FFA_RXTX_PAGE_COUNT), 0=
);
> +    if ( !ffa_spmc_tx )
> +        goto exit;
>
> -    e =3D ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), FFA_RXTX_PAGE_COUNT);
> +    e =3D ffa_rxtx_map(__pa(ffa_spmc_tx), __pa(ffa_spmc_rx),
> +                     FFA_RXTX_PAGE_COUNT);
>      if ( e )
> -        goto err;
> +        goto exit;
>
> -    return true;
> +    ret =3D true;
>
> -err:
> -    ffa_rxtx_destroy();
> +exit:
> +    spin_unlock(&ffa_spmc_tx_lock);
> +    spin_unlock(&ffa_spmc_rx_lock);
>
> -    return false;
> +    if ( !ret )
> +        ffa_rxtx_spmc_destroy();
> +
> +    return ret;
>  }
> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> index d628c1b70609..b9022797c3bf 100644
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
> +    {
> +        ffa_rxtx_spmc_tx_release();
>          return FFA_RET_NOT_SUPPORTED;
I'd prefer adding an out label below before the
ffa_rxtx_spmc_tx_release() call and:
     ret =3D FFA_RET_NOT_SUPPORTED;
     goto out;

Cheers,
Jens

> +    }
>
>      addr_range =3D region_descr->address_range_array;
>      frag_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_count=
, 1);
> @@ -360,7 +367,11 @@ static int share_shm(struct ffa_shm_mem *shm)
>          init_range(addr_range, pa);
>      }
>
> -    return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> +    ret =3D ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> +
> +    ffa_rxtx_spmc_tx_release();
> +
> +    return ret;
>  }
>
>  static int read_mem_transaction(uint32_t ffa_vers, const void *buf, size=
_t blen,
> @@ -578,10 +589,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs=
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

