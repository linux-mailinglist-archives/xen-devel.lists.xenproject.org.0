Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431A99E6871
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 09:09:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849920.1264413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJTOZ-0004Cz-7q; Fri, 06 Dec 2024 08:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849920.1264413; Fri, 06 Dec 2024 08:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJTOZ-0004AI-5E; Fri, 06 Dec 2024 08:09:03 +0000
Received: by outflank-mailman (input) for mailman id 849920;
 Fri, 06 Dec 2024 08:09:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQh0=S7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1tJTOX-0004AC-Le
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 08:09:01 +0000
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55523615-b3a9-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 09:08:54 +0100 (CET)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-29e59db8d58so1282714fac.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Dec 2024 00:08:59 -0800 (PST)
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
X-Inumbo-ID: 55523615-b3a9-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733472538; x=1734077338; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJtk4S31GHBpWXy2Qd+rQtajgw7zqTCvAuIy9qxvuUM=;
        b=xri5MIcbW4W3V809l/3eW4f5xldu8GV0aiPOIoOz7VDio7Y29h6ZqRRkEIsD4cwA1/
         h7p0Ky66rgrx09e04PVyVXoOpQ71nGUX2USv3scwWSHz5CbZc3sGinrwOHuLeo8eETot
         TZMqFv/y0uPfV5FNEFSCsf2jnJwtbw8LEq9kK1SQ1Qdcr6PimPsIWdXszsvSr4KZxJJZ
         5rXT1zGQPw6ekv+WTiT9Qwqzx5IpUZvavd8/xfk22+TAikTOefcheUwd+U6u1aBncbAA
         eyBQHWoDS+0AWeNGGmEw+1IoHehJeHgyN/o1QFSD1y5Nm2DDMkEylZqzd7ozDMDaiq46
         6B2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733472538; x=1734077338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJtk4S31GHBpWXy2Qd+rQtajgw7zqTCvAuIy9qxvuUM=;
        b=BsQvA85Bkv6DiLBCcwV0BZyu+uhTN+I2+1TOcokI7rZkN8dlM5d2FEFhGVJtVolls2
         iEO5QPXU8e0Vpnj1/TixjR20hVzHTxE8ttvwnBErHJ75J62JGuZs8hdB7WNEFNnp4r4B
         damrL8jIGXNQ9XZN5TbZ9tQPPSqPGM5MLDGUgp8rhq3V9ZvR1TPW6EZXS6xweBbNth67
         YL6juAp28YQj6JjltxwaMuPjF3TwfPmiZxkNNu/X/Cg98cb8sPaO0kTrznRMw3H0JFJ/
         Gm3/3ejeUaXJBnslTZErr88O4XEvRu6/qiOQHdCjmXfxWiDD7yvNoI6iQBwMKhq/1cuL
         cu1g==
X-Gm-Message-State: AOJu0YzzIk9SjY8HuheZ3/HAyMevxekQhLhekfR/8QByuRV/W398tDnL
	kjOk7pZ1pmvhBhBjvPovlulKOFVpz5axHZqdU7G0r5uQrtJI5O7JHUnA1sinUrvRJmBkMIuqiis
	zLJuI6hDoZfalx0TdNsGnpj3v5gTH474U3DBykA==
X-Gm-Gg: ASbGncs3JSg4f8p4/DzQZIaoFb6KDkMBCQPVABhcLA9V82jscisr+PJAdiOOkcvMlIR
	cg8GJdfvlfsR8Xrdv/pLxjfjACGNPrKc=
X-Google-Smtp-Source: AGHT+IF9UVBA4stT054vD2CesF+g2alBl2n8BaADsQu+Wr0+F3MkDnkx9+70r1F46epl9EgUKKOB06hvoZT9Urbu8Ks=
X-Received: by 2002:a05:6870:ec9f:b0:297:24ad:402f with SMTP id
 586e51a60fabf-29f732dff69mr981277fac.12.1733472538330; Fri, 06 Dec 2024
 00:08:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1732702210.git.bertrand.marquis@arm.com> <7b3dc2c98d01478d5ab03780932844ea980b7ae0.1732702210.git.bertrand.marquis@arm.com>
In-Reply-To: <7b3dc2c98d01478d5ab03780932844ea980b7ae0.1732702210.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 6 Dec 2024 09:08:46 +0100
Message-ID: <CAHUa44GNkyLAhYP4XdwKhJvfUdUxEGqHEAC=1u7f4s6O+Y2irw@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] xen/arm: ffa: Add indirect message support
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
> Add support for FFA_MSG_SEND2 to send indirect messages from a VM to a
> secure partition.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v3:
> - in ffa_handle_msg_send2 use ffa_get_vm_id instead of a local variable
>   to make sure that we use the right VM ID as source without having a
>   potential solution for the VM to give a wrong identity.
> Changes in v2:
> - rebase
> ---
>  xen/arch/arm/tee/ffa.c         |  5 ++++
>  xen/arch/arm/tee/ffa_msg.c     | 50 ++++++++++++++++++++++++++++++++++
>  xen/arch/arm/tee/ffa_private.h |  1 +
>  3 files changed, 56 insertions(+)

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 04d2403415fe..87775ed88ffd 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -101,6 +101,7 @@ static const struct ffa_fw_abi ffa_fw_abi_needed[] =
=3D {
>      FW_ABI(FFA_MEM_RECLAIM),
>      FW_ABI(FFA_MSG_SEND_DIRECT_REQ_32),
>      FW_ABI(FFA_MSG_SEND_DIRECT_REQ_64),
> +    FW_ABI(FFA_MSG_SEND2),
>  };
>
>  /*
> @@ -195,6 +196,7 @@ static void handle_features(struct cpu_user_regs *reg=
s)
>      case FFA_PARTITION_INFO_GET:
>      case FFA_MSG_SEND_DIRECT_REQ_32:
>      case FFA_MSG_SEND_DIRECT_REQ_64:
> +    case FFA_MSG_SEND2:
>          ffa_set_regs_success(regs, 0, 0);
>          break;
>      case FFA_MEM_SHARE_64:
> @@ -275,6 +277,9 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
>      case FFA_MSG_SEND_DIRECT_REQ_64:
>          ffa_handle_msg_send_direct_req(regs, fid);
>          return true;
> +    case FFA_MSG_SEND2:
> +        e =3D ffa_handle_msg_send2(regs);
> +        break;
>      case FFA_MEM_SHARE_32:
>      case FFA_MEM_SHARE_64:
>          ffa_handle_mem_share(regs);
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index ae263e54890e..ee594e737fc7 100644
> --- a/xen/arch/arm/tee/ffa_msg.c
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -12,6 +12,15 @@
>
>  #include "ffa_private.h"
>
> +/* Encoding of partition message in RX/TX buffer */
> +struct ffa_part_msg_rxtx {
> +    uint32_t flags;
> +    uint32_t reserved;
> +    uint32_t msg_offset;
> +    uint32_t send_recv_id;
> +    uint32_t msg_size;
> +};
> +
>  void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t=
 fid)
>  {
>      struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> @@ -78,3 +87,44 @@ out:
>                   resp.a4 & mask, resp.a5 & mask, resp.a6 & mask,
>                   resp.a7 & mask);
>  }
> +
> +int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
> +{
> +    struct domain *src_d =3D current->domain;
> +    struct ffa_ctx *src_ctx =3D src_d->arch.tee;
> +    const struct ffa_part_msg_rxtx *src_msg;
> +    uint16_t dst_id, src_id;
> +    int32_t ret;
> +
> +    if ( !ffa_fw_supports_fid(FFA_MSG_SEND2) )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    if ( !spin_trylock(&src_ctx->tx_lock) )
> +        return FFA_RET_BUSY;
> +
> +    src_msg =3D src_ctx->tx;
> +    src_id =3D src_msg->send_recv_id >> 16;
> +    dst_id =3D src_msg->send_recv_id & GENMASK(15,0);
> +
> +    if ( src_id !=3D ffa_get_vm_id(src_d) || !FFA_ID_IS_SECURE(dst_id) )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock_tx;
> +    }
> +
> +    /* check source message fits in buffer */
> +    if ( src_ctx->page_count * FFA_PAGE_SIZE <
> +         src_msg->msg_offset + src_msg->msg_size ||
> +         src_msg->msg_offset < sizeof(struct ffa_part_msg_rxtx) )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock_tx;
> +    }
> +
> +    ret =3D ffa_simple_call(FFA_MSG_SEND2,
> +                          ((uint32_t)ffa_get_vm_id(src_d)) << 16, 0, 0, =
0);
> +
> +out_unlock_tx:
> +    spin_unlock(&src_ctx->tx_lock);
> +    return ret;
> +}
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 973ee55be09b..d441c0ca5598 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -359,6 +359,7 @@ void ffa_handle_notification_get(struct cpu_user_regs=
 *regs);
>  int ffa_handle_notification_set(struct cpu_user_regs *regs);
>
>  void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t=
 fid);
> +int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs);
>
>  static inline uint16_t ffa_get_vm_id(const struct domain *d)
>  {
> --
> 2.47.0
>

