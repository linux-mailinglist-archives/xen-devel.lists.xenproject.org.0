Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 530399AC9F7
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 14:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824581.1238732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3aNj-0007Rl-13; Wed, 23 Oct 2024 12:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824581.1238732; Wed, 23 Oct 2024 12:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3aNi-0007Q1-TP; Wed, 23 Oct 2024 12:22:30 +0000
Received: by outflank-mailman (input) for mailman id 824581;
 Wed, 23 Oct 2024 12:22:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Arnv=RT=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1t3aNg-0007Pv-H4
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 12:22:28 +0000
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [2607:f8b0:4864:20::c36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 764261f9-9139-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 14:22:26 +0200 (CEST)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5ebc0e13d25so1322574eaf.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 05:22:26 -0700 (PDT)
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
X-Inumbo-ID: 764261f9-9139-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729686145; x=1730290945; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaobD5PlPb+io3WRJbgV7LQGBLJlP0/sGXIuWDVkATQ=;
        b=lrNjiyHNcmEG9VHOnKguVIpET5y7iPh1IE8Y/1Wcs+rEkMR7sc23QXDMVQ5Wn8Nijd
         6GmagFu1PpIdcTBzniWB+KYzZ63YNGdvKsBPR5vQUr7+uHVllWCLi98nOuQpEZbY28Pa
         SP+Uupx0iMUPKrwuuUL+A1ajyuMMBdzJwtF8k4Nsigv6ccCvNnsVvIiYKXYDIc8joe3q
         ykwLOm/o/GD0ufDJ5rmDvjSpLv9q8KrYy3r6vrqYFTs04BmgMZTCP3Ej2SfavUsTUyr9
         NTHUxiNpH3xHrOVOph9/fE8xiR7sU35Nh5KmOtrZtZ/iSHx7oJgrpgUJzDNOttxrajxh
         LNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686145; x=1730290945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaobD5PlPb+io3WRJbgV7LQGBLJlP0/sGXIuWDVkATQ=;
        b=MA7m2WNjSWgT0N+Bu4a11V3R1tfE1B6Lj5XbrIgSyj9K/evmPZbZ+dsZQGT1Y7SFE9
         NYsBl5Fdp7NpacfYP54flWUCNx2X9ZcYlhJXoV56T32ekSA5LXnaPeAuyivxj5y1U1Z/
         pcq/s30WnOb4pcJjZJfTXUhsHWQ1aeH5dnGxG2OOBYy31UKmUj2FWB89RKomx2+XL8p/
         abaYEWq6UufyF+pXfM7Yqn9KluwsoE5fPHaFPtHFwL1bLdYJ4bWKgfVr9GpMHzQixkt7
         M+LqRYMSbUeYkpqSG+rEP0k1rAfQra+WXVBIyb3YrO0jEk29lNFBrT/L6Zhy3yqDqcU8
         Wu0A==
X-Gm-Message-State: AOJu0Yz3Sr/ExzpUp61lYkVOOIxVzNrKITxVlPya4FDmna13CgAICJt0
	51LJ9X2YJ2T7cuXovowhCS/cPS9lLVZhtXJ3IyHpL+UVfMM2hb9yWtgsVOkGyXiOAk4w9MawFQJ
	V4YZvqlfNZIgW4JWQ3CS48Q4cFMORc27QPC7BUA==
X-Google-Smtp-Source: AGHT+IFv3itQvfhlFsy7XVy8nP/Dgju1GAeXatQfDo0kDyQDFk8CG/vhnZASQRatqMhWm+m8Vx/C+YM5Dgl0HhFAY7I=
X-Received: by 2002:a05:6870:1590:b0:288:b902:1b6d with SMTP id
 586e51a60fabf-28ccb542943mr2027855fac.26.1729686144593; Wed, 23 Oct 2024
 05:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729066788.git.bertrand.marquis@arm.com> <f1521b297eee2648fdca73896640230c0ca4cc57.1729066788.git.bertrand.marquis@arm.com>
In-Reply-To: <f1521b297eee2648fdca73896640230c0ca4cc57.1729066788.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 23 Oct 2024 14:22:13 +0200
Message-ID: <CAHUa44Exc1DYUgy=K64yFcf1_yqUPZRDGe6pm4Q-RVr-Ytgk0g@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] xen/arm: ffa: Rework partition info get
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
> Rework the partition info get implementation to use the correct size of
> structure depending on the version of the protocol and simplifies the
> structure copy to use only memcpy and prevent recreating the structure
> each time.
> The goal here is to have an implementation that will be easier to
> maintain in the long term as the specification is only adding fields to
> structure with versions to simplify support of several protocol
> versions and as such an SPMC implementation in the future could use this
> and return a size higher than the one we expect.
> The patch is fixing the part_info_get function for this and the
> subscriber discovery on probe.
>
> No functional changes expected.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
> - rebase
> ---
>  xen/arch/arm/tee/ffa.c          |  13 +--
>  xen/arch/arm/tee/ffa_partinfo.c | 185 ++++++++++++++++++++------------
>  xen/arch/arm/tee/ffa_private.h  |   4 +-
>  3 files changed, 118 insertions(+), 84 deletions(-)

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 267d4435ac08..4b55e8b48f01 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -311,8 +311,6 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
>      uint32_t fid =3D get_user_reg(regs, 0);
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
> -    uint32_t fpi_size;
> -    uint32_t count;
>      int e;
>
>      if ( !ctx )
> @@ -338,16 +336,7 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>          e =3D ffa_handle_rxtx_unmap();
>          break;
>      case FFA_PARTITION_INFO_GET:
> -        e =3D ffa_handle_partition_info_get(get_user_reg(regs, 1),
> -                                          get_user_reg(regs, 2),
> -                                          get_user_reg(regs, 3),
> -                                          get_user_reg(regs, 4),
> -                                          get_user_reg(regs, 5), &count,
> -                                          &fpi_size);
> -        if ( e )
> -            ffa_set_regs_error(regs, e);
> -        else
> -            ffa_set_regs_success(regs, count, fpi_size);
> +        ffa_handle_partition_info_get(regs);
>          return true;
>      case FFA_RX_RELEASE:
>          e =3D ffa_handle_rx_release();
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index 99c48f0e5c05..75a073d090e0 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -33,21 +33,24 @@ static uint16_t subscr_vm_created_count __read_mostly=
;
>  static uint16_t *subscr_vm_destroyed __read_mostly;
>  static uint16_t subscr_vm_destroyed_count __read_mostly;
>
> -static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t=
 w3,
> -                                      uint32_t w4, uint32_t w5, uint32_t=
 *count,
> -                                      uint32_t *fpi_size)
> +static int32_t ffa_partition_info_get(uint32_t *uuid, uint32_t flags,
> +                                      uint32_t *count, uint32_t *fpi_siz=
e)
>  {
> -    const struct arm_smccc_1_2_regs arg =3D {
> +    struct arm_smccc_1_2_regs arg =3D {
>          .a0 =3D FFA_PARTITION_INFO_GET,
> -        .a1 =3D w1,
> -        .a2 =3D w2,
> -        .a3 =3D w3,
> -        .a4 =3D w4,
> -        .a5 =3D w5,
> +        .a5 =3D flags,
>      };
>      struct arm_smccc_1_2_regs resp;
>      uint32_t ret;
>
> +    if ( uuid )
> +    {
> +        arg.a1 =3D uuid[0];
> +        arg.a2 =3D uuid[1];
> +        arg.a3 =3D uuid[2];
> +        arg.a4 =3D uuid[3];
> +    }
> +
>      arm_smccc_1_2_smc(&arg, &resp);
>
>      ret =3D ffa_get_ret_code(&resp);
> @@ -60,13 +63,31 @@ static int32_t ffa_partition_info_get(uint32_t w1, ui=
nt32_t w2, uint32_t w3,
>      return ret;
>  }
>
> -int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t=
 w3,
> -                                      uint32_t w4, uint32_t w5, uint32_t=
 *count,
> -                                      uint32_t *fpi_size)
> +void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
>  {
> -    int32_t ret =3D FFA_RET_DENIED;
> +    int32_t ret;
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
> +    uint32_t flags =3D get_user_reg(regs, 5);
> +    uint32_t uuid[4] =3D {
> +        get_user_reg(regs, 1),
> +        get_user_reg(regs, 2),
> +        get_user_reg(regs, 3),
> +        get_user_reg(regs, 4),
> +    };
> +    uint32_t src_size, dst_size;
> +    void *dst_buf;
> +    uint32_t ffa_sp_count =3D 0;
> +
> +    /*
> +     * If the guest is v1.0, he does not get back the entry size so we m=
ust
> +     * use the v1.0 structure size in the destination buffer.
> +     * Otherwise use the size of the highest version we support, here 1.=
1.
> +     */
> +    if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 )
> +        dst_size =3D sizeof(struct ffa_partition_info_1_0);
> +    else
> +        dst_size =3D sizeof(struct ffa_partition_info_1_1);
>
>      /*
>       * FF-A v1.0 has w5 MBZ while v1.1 allows
> @@ -75,90 +96,105 @@ int32_t ffa_handle_partition_info_get(uint32_t w1, u=
int32_t w2, uint32_t w3,
>       * FFA_PARTITION_INFO_GET_COUNT is only using registers and not the
>       * rxtx buffer so do the partition_info_get directly.
>       */
> -    if ( w5 =3D=3D FFA_PARTITION_INFO_GET_COUNT_FLAG &&
> +    if ( flags =3D=3D FFA_PARTITION_INFO_GET_COUNT_FLAG &&
>           ctx->guest_vers =3D=3D FFA_VERSION_1_1 )
>      {
>          if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> -            return ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi=
_size);
> +            ret =3D ffa_partition_info_get(uuid, flags, &ffa_sp_count,
> +                                        &src_size);
>          else
> -        {
> -            *count =3D 0;
> -            return FFA_RET_OK;
> -        }
> -    }
> -    if ( w5 )
> -        return FFA_RET_INVALID_PARAMETERS;
> +            ret =3D FFA_RET_OK;
>
> -    if ( !ffa_rx )
> -        return FFA_RET_DENIED;
> +        goto out;
> +    }
>
> -    if ( !spin_trylock(&ctx->rx_lock) )
> -        return FFA_RET_BUSY;
> +    if ( flags )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
>
>      if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
>      {
> -        if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 )
> -            *fpi_size =3D sizeof(struct ffa_partition_info_1_0);
> -        else
> -            *fpi_size =3D sizeof(struct ffa_partition_info_1_1);
> -
> -        *count =3D 0;
> +        /* Just give an empty partition list to the caller */
>          ret =3D FFA_RET_OK;
>          goto out;
>      }
>
> -    if ( !ctx->page_count || !ctx->rx_is_free )
> +    if ( !spin_trylock(&ctx->rx_lock) )
> +    {
> +        ret =3D FFA_RET_BUSY;
>          goto out;
> +    }
> +
> +    dst_buf =3D ctx->rx;
> +
> +    if ( !ffa_rx )
> +    {
> +        ret =3D FFA_RET_DENIED;
> +        goto out_rx_release;
> +    }
> +
> +    if ( !ctx->page_count || !ctx->rx_is_free )
> +    {
> +        ret =3D FFA_RET_DENIED;
> +        goto out_rx_release;
> +    }
> +
>      spin_lock(&ffa_rx_buffer_lock);
> -    ret =3D ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_size);
> +
> +    ret =3D ffa_partition_info_get(uuid, 0, &ffa_sp_count, &src_size);
> +
>      if ( ret )
>          goto out_rx_buf_unlock;
> +
>      /*
>       * ffa_partition_info_get() succeeded so we now own the RX buffer we
>       * share with the SPMC. We must give it back using ffa_rx_release()
>       * once we've copied the content.
>       */
>
> -    if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 )
> +    /* we cannot have a size smaller than 1.0 structure */
> +    if ( src_size < sizeof(struct ffa_partition_info_1_0) )
>      {
> -        size_t n;
> -        struct ffa_partition_info_1_1 *src =3D ffa_rx;
> -        struct ffa_partition_info_1_0 *dst =3D ctx->rx;
> -
> -        if ( ctx->page_count * FFA_PAGE_SIZE < *count * sizeof(*dst) )
> -        {
> -            ret =3D FFA_RET_NO_MEMORY;
> -            goto out_rx_release;
> -        }
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_rx_hyp_release;
> +    }
>
> -        for ( n =3D 0; n < *count; n++ )
> -        {
> -            dst[n].id =3D src[n].id;
> -            dst[n].execution_context =3D src[n].execution_context;
> -            dst[n].partition_properties =3D src[n].partition_properties;
> -        }
> +    if ( ctx->page_count * FFA_PAGE_SIZE < ffa_sp_count * dst_size )
> +    {
> +        ret =3D FFA_RET_NO_MEMORY;
> +        goto out_rx_hyp_release;
>      }
> -    else
> +
> +    if ( ffa_sp_count > 0 )
>      {
> -        size_t sz =3D *count * *fpi_size;
> +        uint32_t n;
> +        void *src_buf =3D ffa_rx;
>
> -        if ( ctx->page_count * FFA_PAGE_SIZE < sz )
> +        /* copy the secure partitions info */
> +        for ( n =3D 0; n < ffa_sp_count; n++ )
>          {
> -            ret =3D FFA_RET_NO_MEMORY;
> -            goto out_rx_release;
> +            memcpy(dst_buf, src_buf, dst_size);
> +            dst_buf +=3D dst_size;
> +            src_buf +=3D src_size;
>          }
> -
> -        memcpy(ctx->rx, ffa_rx, sz);
>      }
> +
>      ctx->rx_is_free =3D false;
> -out_rx_release:
> +
> +out_rx_hyp_release:
>      ffa_rx_release();
>  out_rx_buf_unlock:
>      spin_unlock(&ffa_rx_buffer_lock);
> -out:
> +out_rx_release:
>      spin_unlock(&ctx->rx_lock);
>
> -    return ret;
> +out:
> +    if ( ret )
> +        ffa_set_regs_error(regs, ret);
> +    else
> +        ffa_set_regs_success(regs, ffa_sp_count, dst_size);
>  }
>
>  static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> @@ -221,19 +257,28 @@ static void uninit_subscribers(void)
>          XFREE(subscr_vm_destroyed);
>  }
>
> -static bool init_subscribers(struct ffa_partition_info_1_1 *fpi, uint16_=
t count)
> +static bool init_subscribers(uint16_t count, uint32_t fpi_size)
>  {
>      uint16_t n;
>      uint16_t c_pos;
>      uint16_t d_pos;
> +    struct ffa_partition_info_1_1 *fpi;
> +
> +    if ( fpi_size < sizeof(struct ffa_partition_info_1_1) )
> +    {
> +        printk(XENLOG_ERR "ffa: partition info size invalid: %u\n", fpi_=
size);
> +        return false;
> +    }
>
>      subscr_vm_created_count =3D 0;
>      subscr_vm_destroyed_count =3D 0;
>      for ( n =3D 0; n < count; n++ )
>      {
> -        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
> +        fpi =3D ffa_rx + n * fpi_size;
> +
> +        if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED )
>              subscr_vm_created_count++;
> -        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED=
 )
> +        if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
>              subscr_vm_destroyed_count++;
>      }
>
> @@ -252,10 +297,12 @@ static bool init_subscribers(struct ffa_partition_i=
nfo_1_1 *fpi, uint16_t count)
>
>      for ( c_pos =3D 0, d_pos =3D 0, n =3D 0; n < count; n++ )
>      {
> -        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
> -            subscr_vm_created[c_pos++] =3D fpi[n].id;
> -        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED=
 )
> -            subscr_vm_destroyed[d_pos++] =3D fpi[n].id;
> +        fpi =3D ffa_rx + n * fpi_size;
> +
> +        if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED )
> +            subscr_vm_created[c_pos++] =3D fpi->id;
> +        if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
> +            subscr_vm_destroyed[d_pos++] =3D fpi->id;
>      }
>
>      return true;
> @@ -275,7 +322,7 @@ bool ffa_partinfo_init(void)
>           !ffa_rx || !ffa_tx )
>          return false;
>
> -    e =3D ffa_partition_info_get(0, 0, 0, 0, 0, &count, &fpi_size);
> +    e =3D ffa_partition_info_get(NULL, 0, &count, &fpi_size);
>      if ( e )
>      {
>          printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
> @@ -288,7 +335,7 @@ bool ffa_partinfo_init(void)
>          goto out;
>      }
>
> -    ret =3D init_subscribers(ffa_rx, count);
> +    ret =3D init_subscribers(count, fpi_size);
>
>  out:
>      ffa_rx_release();
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 85eb61c13464..e5bc73f9039e 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -316,9 +316,7 @@ int ffa_handle_mem_reclaim(uint64_t handle, uint32_t =
flags);
>  bool ffa_partinfo_init(void);
>  int ffa_partinfo_domain_init(struct domain *d);
>  bool ffa_partinfo_domain_destroy(struct domain *d);
> -int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t=
 w3,
> -                                      uint32_t w4, uint32_t w5, uint32_t=
 *count,
> -                                      uint32_t *fpi_size);
> +void ffa_handle_partition_info_get(struct cpu_user_regs *regs);
>
>  bool ffa_rxtx_init(void);
>  void ffa_rxtx_destroy(void);
> --
> 2.47.0
>

