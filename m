Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007FCABF63C
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 15:36:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991880.1375679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHjcY-0005aU-H2; Wed, 21 May 2025 13:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991880.1375679; Wed, 21 May 2025 13:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHjcY-0005Yx-EG; Wed, 21 May 2025 13:36:34 +0000
Received: by outflank-mailman (input) for mailman id 991880;
 Wed, 21 May 2025 13:36:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPXp=YF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1uHjcW-0005Yr-Kw
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 13:36:32 +0000
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [2607:f8b0:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99ca0e98-3648-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 15:36:30 +0200 (CEST)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3feaedb531dso1853577b6e.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 06:36:30 -0700 (PDT)
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
X-Inumbo-ID: 99ca0e98-3648-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747834589; x=1748439389; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wzpy5rpJQ14ukrX7WCf39+UzhN3XFDf/ts3qywsSKLc=;
        b=fcBbVZszip9JCfDC5kypqBdQ+whMphT4h7JuQjkgS2aBWYU1/bQUck9EuFHii4mjKm
         ku5PgTSva3aKJSKwM86o+Cngor5U9ZSs3fuj3+NE4KIagkeHrK1BcBSKI8LpJOrHcFyZ
         E2UY1Rn3Kk2nhknQN6pfFZjaDPMhT6OdG7o5xi6l2EwS4SSz7GMosAapkBYkiQMsMwIE
         FAT91Igr5VEJ2bp/6/WD3KJEOwT0NogxAvhghV2LlhFhw9OYWkEAHEeOrUWtrwSG12pB
         up6DQez61nQl6dxciXbqA9kyVPjJBI9au6hJv7F5EF9cx8MFpF7PGzml7Kv2DL++2No6
         Oa+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747834589; x=1748439389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wzpy5rpJQ14ukrX7WCf39+UzhN3XFDf/ts3qywsSKLc=;
        b=PWVvYoZ1KtY19eZiT1ZHcGX8EcF9Ns+poaQzEN2iRPz23LnUnbLL2NCAWoD8k+BJVy
         9n7BfNYqjJ7QQLJawKhAEMlWqYPRvYZA3hzNIboNYs/A3W5UO3s88Iw26DjWOyM1T3Yb
         /kCMlsdtpoKZmePpryy2P6Y6PamBeL/K++MSfuCe+4+WvhSVV3VmankE8deULlFK2Vdg
         Bgh3WddMPd6Obnf/P5pJ1gryNWvbAeE8Irar3paSTXvVjx2lzXeDXgLzHBv7foPQ+jo7
         0LBHWACnr4k1Qg0FLvQg7y2Zb+T4AFyIU83tcc5E78OSfV6nGZbnyCqj4AKZzte/ai50
         w6eQ==
X-Gm-Message-State: AOJu0YyAHQb3El9UOG0SovN4jsT1HiI97NARUpRAOR8dnubQfeEJhj3D
	0Jvit+vBvWgrCr9z+CEi4grKLRaP26SURq5W2jY6+Z3OV14C6QjaSvwGpjAH2sghAchxxnylbOq
	8XTTtXxI21TPUVzM2aTN/afq3+o8gjZcXP0VQzrJTTw==
X-Gm-Gg: ASbGncuW7FAGQrzBZUsE2f7S0IlgGbQHCzr8gRZa+qOWc2YKECi+rV04ZaU8ePySjQ2
	Bhq/h2GZJp4P7zXS62aZtpucBysmiJByNcBSvYG+dB9QILISEucpiSpF6SjT/D/d6Q16ccjAA5J
	48o9fBZxZHDBHhSe0QnU+nqF0D78zkpnHXjcm78fTj80So
X-Google-Smtp-Source: AGHT+IHYDtgciMeF4aPxmrZA+LKFwXMlQf6ZZw6CiTbP2YcVewMX7iAfGNfQNi7iMIWFnclxiZcGjJUBQjAdvWpI2vw=
X-Received: by 2002:a05:6808:6b98:b0:3f9:aeb6:6eac with SMTP id
 5614622812f47-404da7debffmr13984497b6e.30.1747834588704; Wed, 21 May 2025
 06:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787720.git.bertrand.marquis@arm.com> <7784969bf79154363ac3479b9489778d03349c77.1744787720.git.bertrand.marquis@arm.com>
In-Reply-To: <7784969bf79154363ac3479b9489778d03349c77.1744787720.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 21 May 2025 15:36:17 +0200
X-Gm-Features: AX0GCFs0uv_AOafNKPy-pucdCIusZvy_IPPlsen-WxYqEnhoCcgKx5oep6J-4-c
Message-ID: <CAHUa44EWqi0vbHiX9j+TFwLDLk44nqryiRQ0rDJTTBn+f6vRwA@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] xen/arm: ffa: Rework partinfo_get implementation
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Wed, Apr 16, 2025 at 9:40=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> This patch is in preparation for VM to VM support in order to do the
> changes on the SP handling part of partinfo_get before adding support
> for the VM part.
>
> This patches is doing the following changes:
> - split partinfo_get into 3 functions to have the locking handling and
>   proper exit on error handled more clearly
> - add some potential overflow checks to validate the offset and sizes
>   passed by the VM on partinfo call.
> - Introduce a maximum number of SPs (for now set to 64) to prevent
>   holding the CPU for too long in case there would be a lot of
>   partitions in the secure world. The limit currently set is thought to
>   be realistic for most use cases as 64 secure partitions is a very high
>   number compared to current seen usage (more 3 or 4).
> - fix include ordering in ffa_private.h to be in alphabetic order
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v5:
> - patch added
> ---
>  xen/arch/arm/tee/ffa_partinfo.c | 201 +++++++++++++++++++-------------
>  xen/arch/arm/tee/ffa_private.h  |  18 ++-
>  2 files changed, 131 insertions(+), 88 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index c0510ceb8338..e524445c6fb8 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -63,9 +63,95 @@ static int32_t ffa_partition_info_get(uint32_t *uuid, =
uint32_t flags,
>      return ret;
>  }
>
> -void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
> +static int32_t ffa_get_sp_count(uint32_t *uuid, uint32_t *sp_count)
> +{
> +    uint32_t src_size;
> +
> +    return ffa_partition_info_get(uuid, FFA_PARTITION_INFO_GET_COUNT_FLA=
G,
> +                                  sp_count, &src_size);
> +}
> +
> +static int32_t ffa_get_sp_partinfo(uint32_t *uuid, uint32_t *sp_count,
> +                                   void *dst_buf, void *end_buf,
> +                                   uint32_t dst_size)
>  {
>      int32_t ret;
> +    uint32_t src_size, real_sp_count;
> +    void *src_buf =3D ffa_rx;
> +    uint32_t count =3D 0;
> +
> +    /* Do we have a RX buffer with the SPMC */
> +    if ( !ffa_rx )
> +        return FFA_RET_DENIED;
> +
> +    /* We need to use the RX buffer to receive the list */
> +    spin_lock(&ffa_rx_buffer_lock);
> +
> +    ret =3D ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size);
> +    if ( ret )
> +        goto out;
> +
> +    /* We now own the RX buffer */
> +
> +    /* Validate the src_size we got */
> +    if ( src_size < sizeof(struct ffa_partition_info_1_0) ||
> +         src_size >=3D FFA_PAGE_SIZE )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_release;
> +    }
> +
> +    /*
> +     * Limit the maximum time we hold the CPU by limiting the number of =
SPs.
> +     * We just ignore the extra ones as this is tested during init in
> +     * ffa_partinfo_init so the only possible reason is SP have been add=
ed
> +     * since boot.
> +     */
> +    if ( real_sp_count > FFA_MAX_NUM_SP )
> +        real_sp_count =3D FFA_MAX_NUM_SP;
> +
> +    /* Make sure the data fits in our buffer */
> +    if ( real_sp_count > (FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE) / src_siz=
e )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_release;
> +    }
> +
> +    for ( uint32_t sp_num =3D 0; sp_num < real_sp_count; sp_num++ )
> +    {
> +        struct ffa_partition_info_1_1 *fpi =3D src_buf;
> +
> +        /* filter out SP not following bit 15 convention if any */
> +        if ( FFA_ID_IS_SECURE(fpi->id) )
> +        {
> +            if ( dst_buf > (end_buf - dst_size) )
> +            {
> +                ret =3D FFA_RET_NO_MEMORY;
> +                goto out_release;
> +            }
> +
> +            memcpy(dst_buf, src_buf, MIN(src_size, dst_size));
> +            if ( dst_size > src_size )
> +                memset(dst_buf + src_size, 0, dst_size - src_size);
> +
> +            dst_buf +=3D dst_size;
> +            count++;
> +        }
> +
> +        src_buf +=3D src_size;
> +    }
> +
> +    *sp_count =3D count;
> +
> +out_release:
> +    ffa_hyp_rx_release();
> +out:
> +    spin_unlock(&ffa_rx_buffer_lock);
> +    return ret;
> +}

Please add an empty line before the next function. With that fixed:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

> +void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
> +{
> +    int32_t ret =3D FFA_RET_OK;
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
>      uint32_t flags =3D get_user_reg(regs, 5);
> @@ -75,8 +161,8 @@ void ffa_handle_partition_info_get(struct cpu_user_reg=
s *regs)
>          get_user_reg(regs, 3),
>          get_user_reg(regs, 4),
>      };
> -    uint32_t src_size, dst_size;
> -    void *dst_buf;
> +    uint32_t dst_size =3D 0;
> +    void *dst_buf, *end_buf;
>      uint32_t ffa_sp_count =3D 0;
>
>      /*
> @@ -89,31 +175,26 @@ void ffa_handle_partition_info_get(struct cpu_user_r=
egs *regs)
>      else
>          dst_size =3D sizeof(struct ffa_partition_info_1_1);
>
> -    /*
> -     * FF-A v1.0 has w5 MBZ while v1.1 allows
> -     * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
> -     *
> -     * FFA_PARTITION_INFO_GET_COUNT is only using registers and not the
> -     * rxtx buffer so do the partition_info_get directly.
> -     */
> -    if ( flags =3D=3D FFA_PARTITION_INFO_GET_COUNT_FLAG &&
> -         ctx->guest_vers =3D=3D FFA_VERSION_1_1 )
> +    /* Only count requested */
> +    if ( flags )
>      {
> +        /*
> +         * FF-A v1.0 has w5 MBZ while v1.1 allows
> +         * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
> +         */
> +        if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 ||
> +                flags !=3D FFA_PARTITION_INFO_GET_COUNT_FLAG )
> +        {
> +            ret =3D FFA_RET_INVALID_PARAMETERS;
> +            goto out;
> +        }
> +
>          if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> -            ret =3D ffa_partition_info_get(uuid, flags, &ffa_sp_count,
> -                                        &src_size);
> -        else
> -            ret =3D FFA_RET_OK;
> +            ret =3D ffa_get_sp_count(uuid, &ffa_sp_count);
>
>          goto out;
>      }
>
> -    if ( flags )
> -    {
> -        ret =3D FFA_RET_INVALID_PARAMETERS;
> -        goto out;
> -    }
> -
>      if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
>      {
>          /* Just give an empty partition list to the caller */
> @@ -121,80 +202,33 @@ void ffa_handle_partition_info_get(struct cpu_user_=
regs *regs)
>          goto out;
>      }
>
> +    /* Get the RX buffer to write the list of partitions */
>      ret =3D ffa_rx_acquire(d);
>      if ( ret !=3D FFA_RET_OK )
>          goto out;
>
>      dst_buf =3D ctx->rx;
> +    end_buf =3D ctx->rx + ctx->page_count * FFA_PAGE_SIZE;
>
> -    if ( !ffa_rx )
> -    {
> -        ret =3D FFA_RET_DENIED;
> -        goto out_rx_release;
> -    }
> -
> -    spin_lock(&ffa_rx_buffer_lock);
> -
> -    ret =3D ffa_partition_info_get(uuid, 0, &ffa_sp_count, &src_size);
> -
> -    if ( ret )
> -        goto out_rx_hyp_unlock;
> +    /* An entry should be smaller than a page */
> +    BUILD_BUG_ON(sizeof(struct ffa_partition_info_1_1) > FFA_PAGE_SIZE);
>
>      /*
> -     * ffa_partition_info_get() succeeded so we now own the RX buffer we
> -     * share with the SPMC. We must give it back using ffa_hyp_rx_releas=
e()
> -     * once we've copied the content.
> +     * Check for overflow and that we can at least store one entry.
> +     * page_count cannot be 0 so we have at least one page.
>       */
> -
> -    /* we cannot have a size smaller than 1.0 structure */
> -    if ( src_size < sizeof(struct ffa_partition_info_1_0) )
> -    {
> -        ret =3D FFA_RET_NOT_SUPPORTED;
> -        goto out_rx_hyp_release;
> -    }
> -
> -    if ( ctx->page_count * FFA_PAGE_SIZE < ffa_sp_count * dst_size )
> +    if ( dst_buf >=3D end_buf || dst_buf > (end_buf - dst_size) )
>      {
> -        ret =3D FFA_RET_NO_MEMORY;
> -        goto out_rx_hyp_release;
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_rx_release;
>      }
>
> -    if ( ffa_sp_count > 0 )
> -    {
> -        uint32_t n, n_limit =3D ffa_sp_count;
> -        void *src_buf =3D ffa_rx;
> -
> -        /* copy the secure partitions info */
> -        for ( n =3D 0; n < n_limit; n++ )
> -        {
> -            struct ffa_partition_info_1_1 *fpi =3D src_buf;
> -
> -            /* filter out SP not following bit 15 convention if any */
> -            if ( FFA_ID_IS_SECURE(fpi->id) )
> -            {
> -                memcpy(dst_buf, src_buf, dst_size);
> -                dst_buf +=3D dst_size;
> -            }
> -            else
> -                ffa_sp_count--;
> +    ret =3D ffa_get_sp_partinfo(uuid, &ffa_sp_count, dst_buf, end_buf,
> +                              dst_size);
>
> -            src_buf +=3D src_size;
> -        }
> -    }
>
> -out_rx_hyp_release:
> -    ffa_hyp_rx_release();
> -out_rx_hyp_unlock:
> -    spin_unlock(&ffa_rx_buffer_lock);
>  out_rx_release:
> -    /*
> -     * The calling VM RX buffer only contains data to be used by the VM =
if the
> -     * call was successful, in which case the VM has to release the buff=
er
> -     * once it has used the data.
> -     * If something went wrong during the call, we have to release the R=
X
> -     * buffer back to the SPMC as the VM will not do it.
> -     */
> -    if ( ret !=3D FFA_RET_OK )
> +    if ( ret )
>          ffa_rx_release(d);
>  out:
>      if ( ret )
> @@ -353,9 +387,10 @@ bool ffa_partinfo_init(void)
>          goto out;
>      }
>
> -    if ( count >=3D UINT16_MAX )
> +    if ( count >=3D FFA_MAX_NUM_SP )
>      {
> -        printk(XENLOG_ERR "ffa: Impossible number of SPs: %u\n", count);
> +        printk(XENLOG_ERR "ffa: More SPs than the maximum supported: %u =
- %u\n",
> +               count, FFA_MAX_NUM_SP);
>          goto out;
>      }
>
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index c4cd65538908..0a9c1082db28 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -6,15 +6,15 @@
>  #ifndef __FFA_PRIVATE_H__
>  #define __FFA_PRIVATE_H__
>
> +#include <xen/bitmap.h>
>  #include <xen/const.h>
> -#include <xen/sizes.h>
> -#include <xen/types.h>
> -#include <xen/mm.h>
>  #include <xen/list.h>
> -#include <xen/spinlock.h>
> +#include <xen/mm.h>
>  #include <xen/sched.h>
> +#include <xen/sizes.h>
> +#include <xen/spinlock.h>
>  #include <xen/time.h>
> -#include <xen/bitmap.h>
> +#include <xen/types.h>
>
>  /* Error codes */
>  #define FFA_RET_OK                      0
> @@ -108,6 +108,14 @@
>   */
>  #define FFA_CTX_TEARDOWN_DELAY          SECONDS(1)
>
> +/*
> + * The maximum number of Secure partitions we support for partinfo_get.
> + * This prevents holding the CPU during potentially to long time during
> + * a partinfo_get call. Value choosen seems realistic for any configurat=
ion
> + * but can be incremented here if needed.
> + */
> +#define FFA_MAX_NUM_SP                  64
> +
>  /*
>   * We rely on the convention suggested but not mandated by the FF-A
>   * specification that secure world endpoint identifiers have the bit 15
> --
> 2.47.1
>

