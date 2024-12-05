Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 272B49E5AAB
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 17:04:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849172.1263835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJELA-0000dn-Bd; Thu, 05 Dec 2024 16:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849172.1263835; Thu, 05 Dec 2024 16:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJELA-0000bw-8N; Thu, 05 Dec 2024 16:04:32 +0000
Received: by outflank-mailman (input) for mailman id 849172;
 Thu, 05 Dec 2024 16:04:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1V0d=S6=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1tJEL8-0000bq-Fx
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 16:04:30 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a9a9789-b322-11ef-99a3-01e77a169b0f;
 Thu, 05 Dec 2024 17:04:28 +0100 (CET)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-29e59db8d58so762861fac.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2024 08:04:28 -0800 (PST)
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
X-Inumbo-ID: 9a9a9789-b322-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733414667; x=1734019467; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bryHlIy8+6XfUbd27Hqxg8WP7I9HwbP7WaLVVtgvtCQ=;
        b=OeJwTpHRVmTBhhYDk+sN7jCZ4iUu4ZJP5M5VnkuISRp52cTfBmxZzcLuY9EeyKLlPt
         eHxmx38A0fpfesT2sbLUo8fO7y+2KE78r4zu+1vkeacAckC0IeoNpEoUB3e/UypIPVWq
         cmgYZ9cOMGnzF27af0nRL/87FHGiTryqBqyDQhwwJfWCYIzkRKWHoWdkILPds+f8E6tX
         gr0FJP7jpuyY4hrCgYZfECthKJqsUt7tVamLLCuoBuHaFpP/DsAKU4qQfGvgEAghsm3m
         jHvgy5KBDE4opWiAHnoHgoYlwV3k4AbIRpBfIUTQVTWsURlKgO0GEKp+8LjVe/plytFI
         FLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733414667; x=1734019467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bryHlIy8+6XfUbd27Hqxg8WP7I9HwbP7WaLVVtgvtCQ=;
        b=dHByqBBkPG1uJdQtBFs/0p0rwBhypWi18nFiXiKCxzB/TQBf13hkSKg5SNFjX01msg
         8JNKwrM9p3wr7QFkLXKLGOEvV9KekMSRUjMK/Q25CrIMkWF3wuCVKLKauZG8ZvLLO6ch
         pVsVw8YPRAcp2SXp/JvwBk0BSi2qFop3U8S4lRHbk6cEzLSIQpH2cvikqOerTAmzZAD+
         2bXhpAI1kwTTzOWgeICRKCt1jrfRxygSYGTj1BOsaBE2uUa0d5fYojF9z3LqyIsxmA7n
         YL/bus0JlY1B6nocd5VCCVxkBsQYKG4oNhx7ZiMZj/AfGW2Dam9L+AfAOYeuu81p7s2W
         A5vA==
X-Gm-Message-State: AOJu0YxKqSJUH5mJoJVLP5jx9YlN19II2MTv4qjmA+BgNuIrdQuQRu4W
	jl8odma9O9nVWVTws9GbVelcFFLQfG2U8YBY6iz7GqfDiOCXY5dQrGZ3tpZTYN8IRTUYEAYtlgP
	j/CzclnDC1xNPDzhhPhddE2Hz9VttYZ9Vr5x4QA==
X-Gm-Gg: ASbGncvs+MseR3LiS5DbmWRifbVxFqDYpHzgABBB3zVPcW9Oni7Td1mXP22YIR/fdqx
	N+VI6wHRyRc+ckWPIvSX2WjgnX4s69EQ=
X-Google-Smtp-Source: AGHT+IHoKvDLckftHJYML6HzHWbM+Ph7K8n4CzHn1MCAKe7KEKhVZ+rl5x/bPKYixU9tupp7R3zseCP+7sSsSQGSykE=
X-Received: by 2002:a05:6870:7d06:b0:29e:592f:f4f3 with SMTP id
 586e51a60fabf-29e8881f5cemr8607522fac.27.1733414666792; Thu, 05 Dec 2024
 08:04:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1732702210.git.bertrand.marquis@arm.com> <0b987183498242587f3795e870a7395b132ec9ee.1732702210.git.bertrand.marquis@arm.com>
In-Reply-To: <0b987183498242587f3795e870a7395b132ec9ee.1732702210.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 5 Dec 2024 17:04:14 +0100
Message-ID: <CAHUa44Fab8M4HVhtDYpJM9kYixxAc7SSQ_WjfuShHag8BhrJAQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] xen/arm: ffa: Use bit 15 convention for SPs
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
> Make use and required to have bit 15 convention respected by secure
> world (having bit 15 of IDs set for secure endpoints and non-set for
> non-secure ones).
> If any secure partition has an ID with bit 15 not set, it will not be
> possible to contact or detect them.
> Print an error log during probe for each secure endpoint detected with
> bit 15 not set.
>
> We are switching to this convention because Xen is currently not using
> VMIDs with bit 15 set so we are sure that no VM will have it set (this
> is ensured by BUILD_BUG_ON in case this becomes false in the future).
> It is allowing to easily distinguish between secure and non-secure
> endpoints, preventing the need to store a list of secure endpoint IDs in
> Xen.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v3:
> - rename real_num to n_limit
> - remove log of skipped SP due to invalid ID as it is already printed
> Changes in v2:
> - rebase
> ---
>  xen/arch/arm/tee/ffa.c          | 22 ++++++++++----
>  xen/arch/arm/tee/ffa_partinfo.c | 51 +++++++++++++++++++++++++--------
>  xen/arch/arm/tee/ffa_private.h  |  7 +++++
>  xen/arch/arm/tee/ffa_shm.c      | 12 +++++++-
>  4 files changed, 74 insertions(+), 18 deletions(-)

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 4b283a4de5d0..0026ac9134ad 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -195,6 +195,14 @@ static void handle_msg_send_direct_req(struct cpu_us=
er_regs *regs, uint32_t fid)
>          goto out;
>      }
>
> +    /* we do not support direct messages to VMs */
> +    if ( !FFA_ID_IS_SECURE(src_dst & GENMASK(15,0)) )
> +    {
> +        resp.a0 =3D FFA_ERROR;
> +        resp.a2 =3D FFA_RET_NOT_SUPPORTED;
> +        goto out;
> +    }
> +
>      arg.a1 =3D src_dst;
>      arg.a2 =3D get_user_reg(regs, 2) & mask;
>      arg.a3 =3D get_user_reg(regs, 3) & mask;
> @@ -391,11 +399,15 @@ static int ffa_domain_init(struct domain *d)
>
>      if ( !ffa_fw_version )
>          return -ENODEV;
> -     /*
> -      * We can't use that last possible domain ID or ffa_get_vm_id() wou=
ld
> -      * cause an overflow.
> -      */
> -    if ( d->domain_id >=3D UINT16_MAX)
> +    /*
> +     * We are using the domain_id + 1 as the FF-A ID for VMs as FF-A ID =
0 is
> +     * reserved for the hypervisor and we only support secure endpoints =
using
> +     * FF-A IDs with BIT 15 set to 1 so make sure those are not used by =
Xen.
> +     */
> +    BUILD_BUG_ON(DOMID_FIRST_RESERVED >=3D UINT16_MAX);
> +    BUILD_BUG_ON((DOMID_MASK & BIT(15, U)) !=3D 0);
> +
> +    if ( d->domain_id >=3D DOMID_FIRST_RESERVED )
>          return -ERANGE;
>
>      ctx =3D xzalloc(struct ffa_ctx);
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index 75a073d090e0..74324e1d9d3f 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -169,14 +169,23 @@ void ffa_handle_partition_info_get(struct cpu_user_=
regs *regs)
>
>      if ( ffa_sp_count > 0 )
>      {
> -        uint32_t n;
> +        uint32_t n, n_limit =3D ffa_sp_count;
>          void *src_buf =3D ffa_rx;
>
>          /* copy the secure partitions info */
> -        for ( n =3D 0; n < ffa_sp_count; n++ )
> +        for ( n =3D 0; n < n_limit; n++ )
>          {
> -            memcpy(dst_buf, src_buf, dst_size);
> -            dst_buf +=3D dst_size;
> +            struct ffa_partition_info_1_1 *fpi =3D src_buf;
> +
> +            /* filter out SP not following bit 15 convention if any */
> +            if ( FFA_ID_IS_SECURE(fpi->id) )
> +            {
> +                memcpy(dst_buf, src_buf, dst_size);
> +                dst_buf +=3D dst_size;
> +            }
> +            else
> +                ffa_sp_count--;
> +
>              src_buf +=3D src_size;
>          }
>      }
> @@ -276,10 +285,25 @@ static bool init_subscribers(uint16_t count, uint32=
_t fpi_size)
>      {
>          fpi =3D ffa_rx + n * fpi_size;
>
> -        if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED )
> -            subscr_vm_created_count++;
> -        if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
> -            subscr_vm_destroyed_count++;
> +        /*
> +         * We need to have secure partitions using bit 15 set convention=
 for
> +         * secure partition IDs.
> +         * Inform the user with a log and discard giving created or dest=
roy
> +         * event to those IDs.
> +         */
> +        if ( !FFA_ID_IS_SECURE(fpi->id) )
> +        {
> +            printk(XENLOG_ERR "ffa: Firmware is not using bit 15 convent=
ion for IDs !!\n"
> +                              "ffa: Secure partition with id 0x%04x cann=
ot be used\n",
> +                              fpi->id);
> +        }
> +        else
> +        {
> +            if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED=
 )
> +                subscr_vm_created_count++;
> +            if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_DESTROY=
ED )
> +                subscr_vm_destroyed_count++;
> +        }
>      }
>
>      if ( subscr_vm_created_count )
> @@ -299,10 +323,13 @@ static bool init_subscribers(uint16_t count, uint32=
_t fpi_size)
>      {
>          fpi =3D ffa_rx + n * fpi_size;
>
> -        if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED )
> -            subscr_vm_created[c_pos++] =3D fpi->id;
> -        if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
> -            subscr_vm_destroyed[d_pos++] =3D fpi->id;
> +        if ( FFA_ID_IS_SECURE(fpi->id) )
> +        {
> +            if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED=
 )
> +                subscr_vm_created[c_pos++] =3D fpi->id;
> +            if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_DESTROY=
ED )
> +                subscr_vm_destroyed[d_pos++] =3D fpi->id;
> +        }
>      }
>
>      return true;
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index e5bc73f9039e..afe69b43dbef 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -108,6 +108,13 @@
>   */
>  #define FFA_CTX_TEARDOWN_DELAY          SECONDS(1)
>
> +/*
> + * We rely on the convention suggested but not mandated by the FF-A
> + * specification that secure world endpoint identifiers have the bit 15
> + * set and normal world have it set to 0.
> + */
> +#define FFA_ID_IS_SECURE(id)    ((id) & BIT(15, U))
> +
>  /* FF-A-1.1-REL0 section 10.9.2 Memory region handle, page 167 */
>  #define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
>  #define FFA_HANDLE_INVALID              0xffffffffffffffffULL
> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> index efa5b67db8e1..29675f9ba3f7 100644
> --- a/xen/arch/arm/tee/ffa_shm.c
> +++ b/xen/arch/arm/tee/ffa_shm.c
> @@ -469,6 +469,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
>      int ret =3D FFA_RET_DENIED;
>      uint32_t range_count;
>      uint32_t region_offs;
> +    uint16_t dst_id;
>
>      if ( !ffa_fw_supports_fid(FFA_MEM_SHARE_64) )
>      {
> @@ -537,6 +538,15 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs=
)
>          goto out_unlock;
>
>      mem_access =3D ctx->tx + trans.mem_access_offs;
> +
> +    dst_id =3D ACCESS_ONCE(mem_access->access_perm.endpoint_id);
> +    if ( !FFA_ID_IS_SECURE(dst_id) )
> +    {
> +        /* we do not support sharing with VMs */
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
>      if ( ACCESS_ONCE(mem_access->access_perm.perm) !=3D FFA_MEM_ACC_RW )
>      {
>          ret =3D FFA_RET_NOT_SUPPORTED;
> @@ -567,7 +577,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
>          goto out_unlock;
>      }
>      shm->sender_id =3D trans.sender_id;
> -    shm->ep_id =3D ACCESS_ONCE(mem_access->access_perm.endpoint_id);
> +    shm->ep_id =3D dst_id;
>
>      /*
>       * Check that the Composite memory region descriptor fits.
> --
> 2.47.0
>

