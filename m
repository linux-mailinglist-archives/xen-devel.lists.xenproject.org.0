Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7BAA6D87A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 11:42:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925328.1328194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twfFz-0004q3-GY; Mon, 24 Mar 2025 10:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925328.1328194; Mon, 24 Mar 2025 10:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twfFz-0004ob-Do; Mon, 24 Mar 2025 10:42:11 +0000
Received: by outflank-mailman (input) for mailman id 925328;
 Mon, 24 Mar 2025 10:42:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J9GC=WL=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1twfFy-0004oF-1n
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 10:42:10 +0000
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [2001:4860:4864:20::29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2417356-089c-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 11:42:08 +0100 (CET)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-2adc2b6837eso1024079fac.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 03:42:08 -0700 (PDT)
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
X-Inumbo-ID: a2417356-089c-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742812927; x=1743417727; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQ4q4074r9N7N+KeWQsKsXNKevOL2lXKXzm6y2vP/P0=;
        b=tRUR4ZJkUzQ4Gn5eYu/eNx6cV2YQoQtxxl43jWL5xbLm4KToaD7qnaMKu8q0A1AT1Z
         KaQq14edKkd98F2ndpHZgTX+x0JFuMTw7IGM/z/as/J6AblbVKiHg4TbrcVDtRHGx9iA
         xX0IeE1DDeTJGg0BDvb5+rf3HfCXoYxfGHctFQvIHLbsEHZj7vktl4vsM0KLhKmgMlMo
         wE6f/cFC/MyApgq5C3Fho0VCp1nB7ahXmaH5CbtGRy8FEzzQX4JVY5WepWRu5YUbEM+F
         j1v/tEkQDAvO/BdLX4LGHSCHeVNtp+iXT1etGEcjv1WXfEsROlNvKjYv1IJLLUXXEtLB
         sobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742812927; x=1743417727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQ4q4074r9N7N+KeWQsKsXNKevOL2lXKXzm6y2vP/P0=;
        b=ll3i+CWDDnUXzjETZi4EEYSWc8CWxPY/eIlr2b/W8+VN5w5vylaP7OXblm+YBmMtBf
         UCunHB19Za87widJd2cEgXB6InYa82lvGvy9wtLCe4fuH+U0GSDnEXTRzIoj4WQLpHJo
         Z4BdN1R5CCvc7uOo4wMu9Jy8jVpuZYW/b9vLgmWp7ZjRBhxkixQ/7U6wO2Vb4NhlHCSj
         J0AvOhIDBlAxNRllRdkz8h4pTM6Pa64B+mzTGlRWyYJJhq0OccICKei1N76kAxEbVubd
         vfTLm/uX7s53f9j3wSa6SUyuFA8OKvMKuWZhBrs0UNSjPIrc88AdppECDzsNfx3N1kXH
         n7vg==
X-Gm-Message-State: AOJu0Yw9+tOMPmEhGecOhB2+UrZNbSWjPa11WewyDvuWoR8reRHKjSTB
	0tFtbkaianz+N4WnxVXLW4uz3++dtRoSjS9ACSdpM8D6N9SdWQLI+pN5Pr2BBdlkoqnadJLymTs
	VMvzSFNpnagRwJAjwGpuasB4qo7kzrbGOtbeUrA==
X-Gm-Gg: ASbGncs2OP0YxW2TciCWkNd405jg2MHONIymYQ09ikhOVMFm+K3B2aQCwkm2aRNVoIP
	m2wpRtWrhBVWwZQkPCZPuv6B61pGUARfSDUe1dPwBchK++geZ8k4XVFWvLdsFMbUc/KFyPUpAHn
	Aa8Mgcsex84z8ZO+Xm0uRb+RGgTDDLBkHeWZqUUw==
X-Google-Smtp-Source: AGHT+IGq37XpymwLFZDWfPjMYnvCWZqGHdYymyvqDOBzjfZDF3qjZCVy7W7UQW+Y4izca4q5VplrtRn459nywITLPCs=
X-Received: by 2002:a05:6871:7a14:b0:2c2:174b:c82a with SMTP id
 586e51a60fabf-2c78026eab8mr8231638fac.6.1742812922282; Mon, 24 Mar 2025
 03:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1742570590.git.bertrand.marquis@arm.com> <4a9867855093453eaad4f548df8e92162176eed9.1742570590.git.bertrand.marquis@arm.com>
In-Reply-To: <4a9867855093453eaad4f548df8e92162176eed9.1742570590.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 24 Mar 2025 11:41:50 +0100
X-Gm-Features: AQ5f1Jq2HrKwiU3HqA4SPYqRAEmQtOl3In0da61hlm6twNaGtyMZiFoh542QHQI
Message-ID: <CAHUa44HZ6rDL3t3p+SwJLencKLks5XfV6krHnKohL7owzaMBUw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] xen/arm: ffa: Add indirect message between VM
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Mon, Mar 24, 2025 at 10:15=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Add support for indirect messages between VMs.
> This is only enabled if CONFIG_FFA_VM_TO_VM is selected.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v3:
> - Move vm to vm indirect message handling in a sub function to simplify
>   lock handling and make implementation easier to read
> Changes in v2:
> - Switch ifdef to IS_ENABLED
> ---
>  xen/arch/arm/tee/ffa_msg.c | 96 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 88 insertions(+), 8 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index ee594e737fc7..c21083b5e68f 100644
> --- a/xen/arch/arm/tee/ffa_msg.c
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -88,6 +88,72 @@ out:
>                   resp.a7 & mask);
>  }
>
> +static int32_t ffa_msg_send2_vm(uint16_t dst_id,
> +                                const struct ffa_part_msg_rxtx *src_msg)
> +{
> +    struct domain *dst_d;
> +    struct ffa_ctx *dst_ctx;
> +    struct ffa_part_msg_rxtx *dst_msg;
> +    int err;
> +    int32_t ret;
> +
> +    if ( dst_id =3D=3D 0 )
> +        /* FF-A ID 0 is the hypervisor, this is not valid */
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /* This is also checking that dest is not src */
> +    err =3D rcu_lock_live_remote_domain_by_id(dst_id - 1, &dst_d);
> +    if ( err )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    if ( dst_d->arch.tee =3D=3D NULL )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
> +
> +    dst_ctx =3D dst_d->arch.tee;
> +    if ( !dst_ctx->guest_vers )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
> +
> +    /* we need to have enough space in the destination buffer */
> +    if ( dst_ctx->page_count * FFA_PAGE_SIZE <
> +            (sizeof(struct ffa_part_msg_rxtx) + src_msg->msg_size) )
> +    {
> +        ret =3D FFA_RET_NO_MEMORY;
> +        goto out_unlock;
> +    }
> +
> +    /* This also checks that destination has set a Rx buffer */
> +    ret =3D ffa_rx_acquire(dst_d);
> +    if ( ret )
> +        goto out_unlock;
> +
> +    dst_msg =3D dst_ctx->rx;
> +
> +    /* prepare destination header */
> +    dst_msg->flags =3D 0;
> +    dst_msg->reserved =3D 0;
> +    dst_msg->msg_offset =3D sizeof(struct ffa_part_msg_rxtx);
> +    dst_msg->send_recv_id =3D src_msg->send_recv_id;
> +    dst_msg->msg_size =3D src_msg->msg_size;
> +
> +    memcpy(dst_ctx->rx + sizeof(struct ffa_part_msg_rxtx),
> +           ((void *)src_msg) + src_msg->msg_offset, src_msg->msg_size);

Is it possible for another core in the VM to modify
src_msg->msg_offset or src_msg->msg_size after we check them but
before we use them here (TOC/TOU)?

Cheers,
Jens

> +
> +    /* receiver rx buffer will be released by the receiver*/
> +
> +out_unlock:
> +    rcu_unlock_domain(dst_d);
> +    if ( !ret )
> +        ffa_raise_rx_buffer_full(dst_d);
> +
> +    return ret;
> +}
> +
>  int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
>  {
>      struct domain *src_d =3D current->domain;
> @@ -96,9 +162,6 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *reg=
s)
>      uint16_t dst_id, src_id;
>      int32_t ret;
>
> -    if ( !ffa_fw_supports_fid(FFA_MSG_SEND2) )
> -        return FFA_RET_NOT_SUPPORTED;
> -
>      if ( !spin_trylock(&src_ctx->tx_lock) )
>          return FFA_RET_BUSY;
>
> @@ -106,10 +169,10 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *=
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
> @@ -118,13 +181,30 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *=
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
> +    }
> +    else if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +    {
> +        /* Message for a VM */
> +        ret =3D ffa_msg_send2_vm(dst_id, src_msg);
> +    }
> +    else
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
>
> -out_unlock_tx:
> +out:
>      spin_unlock(&src_ctx->tx_lock);
>      return ret;
>  }
> --
> 2.47.1
>

