Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB93CA6AA58
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:54:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922788.1326610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIDT-0003Z0-EQ; Thu, 20 Mar 2025 15:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922788.1326610; Thu, 20 Mar 2025 15:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIDT-0003Vv-Ae; Thu, 20 Mar 2025 15:53:55 +0000
Received: by outflank-mailman (input) for mailman id 922788;
 Thu, 20 Mar 2025 15:53:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m8Tk=WH=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1tvIDR-0003Ta-Bx
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:53:53 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8444926f-05a3-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 16:53:51 +0100 (CET)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2bcca6aa8e1so330309fac.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:53:51 -0700 (PDT)
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
X-Inumbo-ID: 8444926f-05a3-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742486030; x=1743090830; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAB/IEa5GJl4xRDSbqTWyFcDjl9SlmtfNARXjUcWXq8=;
        b=E05wxgAVmaJMc/5Id/dxKsMCnWctggHk75euEWRoU+7XwP6I2nxPW7tBGDqyftyDmy
         vlKbmv+rJ8Nr/ovWqM/3FNGENVkp8ZtWsjMYRAaOtI0ZDdzrUPy+AKWFTkHqlqovDLG6
         KL8nPP0GCM4wfG5Kn8pe+0BMPMQa/QPzclDYKWTImlLO7aXQjAjWBcMrbdi1UjVX8gye
         owemjv+nQAIwEbuGbcVU+8+6CG6Hn4o35NtpMINqhQPEgq9tvpAKqBtIeuNS4Sqpj5mF
         WmZyQjSovqCMRppu9XDdbAnQoL4KX2VAO5tPSkGcowXLM8GDAhg5qLPBR/w8hWinTb4z
         w2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742486030; x=1743090830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAB/IEa5GJl4xRDSbqTWyFcDjl9SlmtfNARXjUcWXq8=;
        b=H8vxJakBvHMGX1glN8woJ6Q9Jug+X3wkod7l1M6YdNzKJ9zxKtqU1hb2sS8vs7+dOV
         SBf1KSdMd1TEKXhcp4+GGP7FvoDPRCxpG8K/EZ3Yz7AMM0HXo/9hpeDlzPVKFVONbjY9
         6IXu+PhI8fGDQIweMoCKyzK3mR96/7ycjbetfU4ll5fL0wL89j/vZyf5oQ+cd6amy9nE
         McAxvA+otQ/l1WKiTaAHidshUxzufDmCpJQj9hI9c1xK3l3AlYDk9EPxEJAvfy9MyGuG
         mTy1ynk0lud+ZksRvO4+0pcHk/9D+wtJaTz86N6Kngj8Rb3GihWd/5RFE1iDDvMgPsTp
         OdRQ==
X-Gm-Message-State: AOJu0Yx8NldNucQp/aXFid/4NufkpdzlqSojd/3+geHd6eFoGyrrPJP/
	13/68nSbqXISF4p3ZmdZandWqTXp8VJb7tfUy+VgLX5wcg4KKm/VYCYplrjl3YXeQyOMzHubXG/
	PCRayLkPO8TWWCEYZ6zrORlIdwczrfi7P3ZAhCA==
X-Gm-Gg: ASbGncv0iYm3MpLvA74QQB6jVUsWFRpZKu1y/OdH/ucJiGeT15Ytc8GfRof3HuJkYsa
	BSoO7xcjpfZOYzwyvLmDGtUwJIc0owv+8a5bvE5z8nqzjBNdggj1ZO8tyhJMXpVax67gVzvyHBi
	P2dSmTsIMBEqIQDhC2Vu7nKgzeDeA=
X-Google-Smtp-Source: AGHT+IECrvvc7fO8Qbj/Mm4KnIEXYMvT0NrtnULYBmBbbMYwRphPYc584wbXU7lCj2rcptp721n6dccSXJDchld6rRI=
X-Received: by 2002:a05:6871:530e:b0:29d:c832:840d with SMTP id
 586e51a60fabf-2c78055f025mr2478fac.35.1742486029879; Thu, 20 Mar 2025
 08:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741617888.git.bertrand.marquis@arm.com> <2265f8a8c22034c629025f384acb4f33a4235387.1741617888.git.bertrand.marquis@arm.com>
In-Reply-To: <2265f8a8c22034c629025f384acb4f33a4235387.1741617888.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 20 Mar 2025 16:53:38 +0100
X-Gm-Features: AQ5f1JpBReA3izJLhD2a7_gZVK2VMy1IVPhAs3ov5XgzO94DZ0hwLf9l-vKxAno
Message-ID: <CAHUa44Hcto=kFLpkKBFbH9ucjp+aAERrAFoqbnYjP-_iLqXoJA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] xen/arm: ffa: Add indirect message between VM
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Mon, Mar 10, 2025 at 3:51=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Add support for indirect messages between VMs.
> This is only enabled if CONFIG_FFA_VM_TO_VM is selected.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
> - Switch ifdef to IS_ENABLED
> ---
>  xen/arch/arm/tee/ffa_msg.c     | 96 +++++++++++++++++++++++++++++++---
>  xen/arch/arm/tee/ffa_private.h |  4 ++
>  2 files changed, 92 insertions(+), 8 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index ee594e737fc7..336d5bbf64f6 100644
> --- a/xen/arch/arm/tee/ffa_msg.c
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -96,9 +96,6 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs=
)
>      uint16_t dst_id, src_id;
>      int32_t ret;
>
> -    if ( !ffa_fw_supports_fid(FFA_MSG_SEND2) )
> -        return FFA_RET_NOT_SUPPORTED;
> -
>      if ( !spin_trylock(&src_ctx->tx_lock) )
>          return FFA_RET_BUSY;
>
> @@ -106,10 +103,10 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *=
regs)
>      src_id =3D src_msg->send_recv_id >> 16;
>      dst_id =3D src_msg->send_recv_id & GENMASK(15,0);
>
> -    if ( src_id !=3D ffa_get_vm_id(src_d) || !FFA_ID_IS_SECURE(dst_id) )
> +    if ( src_id !=3D ffa_get_vm_id(src_d) )
>      {
>          ret =3D FFA_RET_INVALID_PARAMETERS;
> -        goto out_unlock_tx;
> +        goto out;
>      }
>
>      /* check source message fits in buffer */
> @@ -118,13 +115,96 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *=
regs)
>           src_msg->msg_offset < sizeof(struct ffa_part_msg_rxtx) )
>      {
>          ret =3D FFA_RET_INVALID_PARAMETERS;
> -        goto out_unlock_tx;
> +        goto out;
>      }
>
> -    ret =3D ffa_simple_call(FFA_MSG_SEND2,
> +    if ( FFA_ID_IS_SECURE(dst_id) )
> +    {
> +        /* Message for a secure partition */
> +        if ( !ffa_fw_supports_fid(FFA_MSG_SEND2) )
> +        {
> +            ret =3D FFA_RET_NOT_SUPPORTED;
> +            goto out;
> +        }
> +
> +        ret =3D ffa_simple_call(FFA_MSG_SEND2,
>                            ((uint32_t)ffa_get_vm_id(src_d)) << 16, 0, 0, =
0);
> +        goto out;
> +    }
>
> -out_unlock_tx:
> +    /* Message for a VM */
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +    {

I would move this block into a helper function to isolate the needed
cleanup etc, but that might be more a matter of taste so do as you
prefer.

> +        struct domain *dst_d;
> +        struct ffa_ctx *dst_ctx;
> +        struct ffa_part_msg_rxtx *dst_msg;
> +        int err;
> +
> +        if ( dst_id =3D=3D 0 )
> +        {
> +            /* FF-A ID 0 is the hypervisor, this is not valid */
> +            ret =3D FFA_RET_INVALID_PARAMETERS;
> +            goto out;
> +        }
> +
> +        /* This is also checking that dest is not src */
> +        err =3D rcu_lock_live_remote_domain_by_id(dst_id - 1, &dst_d);
> +        if ( err )
> +        {
> +            ret =3D FFA_RET_INVALID_PARAMETERS;
> +            goto out;
> +        }
> +
> +        if ( dst_d->arch.tee =3D=3D NULL )
> +        {
> +            ret =3D FFA_RET_INVALID_PARAMETERS;
> +            goto out_unlock;
> +        }
> +
> +        dst_ctx =3D dst_d->arch.tee;
> +        if ( !dst_ctx->guest_vers )
> +        {
> +            ret =3D FFA_RET_INVALID_PARAMETERS;
> +            goto out_unlock;
> +        }
> +
> +        /* This also checks that destination has set a Rx buffer */
> +        ret =3D ffa_rx_acquire(dst_d);
> +        if ( ret )
> +            goto out_unlock;
> +
> +        /* we need to have enough space in the destination buffer */
> +        if ( dst_ctx->page_count * FFA_PAGE_SIZE <
> +                (sizeof(struct ffa_part_msg_rxtx) + src_msg->msg_size) )
> +        {
> +            ret =3D FFA_RET_NO_MEMORY;
> +            ffa_rx_release(dst_d);
> +            goto out_unlock;
> +        }
> +
> +        dst_msg =3D dst_ctx->rx;
> +
> +        /* prepare destination header */
> +        dst_msg->flags =3D 0;
> +        dst_msg->reserved =3D 0;
> +        dst_msg->msg_offset =3D sizeof(struct ffa_part_msg_rxtx);
> +        dst_msg->send_recv_id =3D src_msg->send_recv_id;
> +        dst_msg->msg_size =3D src_msg->msg_size;
> +
> +        memcpy(dst_ctx->rx + sizeof(struct ffa_part_msg_rxtx),
> +               src_ctx->tx + src_msg->msg_offset, src_msg->msg_size);
> +
> +        /* receiver rx buffer will be released by the receiver*/
> +
> +out_unlock:
> +        rcu_unlock_domain(dst_d);
> +        if ( !ret )
> +            ffa_raise_rx_buffer_full(dst_d);
> +    }
> +    else
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +
> +out:
>      spin_unlock(&src_ctx->tx_lock);
>      return ret;
>  }
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 1f5067d5d0c9..340db229453c 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -380,6 +380,10 @@ int ffa_handle_notification_set(struct cpu_user_regs=
 *regs);
>
>  #ifdef CONFIG_FFA_VM_TO_VM
>  void ffa_raise_rx_buffer_full(struct domain *d);
> +#else
> +static inline void ffa_raise_rx_buffer_full(struct domain *d)
> +{
> +}

Shouldn't this go in the previous patch "xen/arm: ffa: Add buffer full
notification support"?

Cheers,
Jens

>  #endif
>
>  void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t=
 fid);
> --
> 2.47.1
>

