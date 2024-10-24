Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 877CB9ADF7D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 10:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825024.1239218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3tYK-0000cu-J7; Thu, 24 Oct 2024 08:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825024.1239218; Thu, 24 Oct 2024 08:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3tYK-0000bD-Fu; Thu, 24 Oct 2024 08:50:44 +0000
Received: by outflank-mailman (input) for mailman id 825024;
 Thu, 24 Oct 2024 08:50:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqEU=RU=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1t3tYI-0000b5-WC
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 08:50:43 +0000
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [2607:f8b0:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b8e5a25-91e5-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 10:50:40 +0200 (CEST)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7181eb9ad46so401868a34.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 01:50:40 -0700 (PDT)
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
X-Inumbo-ID: 0b8e5a25-91e5-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729759839; x=1730364639; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgmH6EiWua9oEqrpdsm7WLZY3Ofnp+yCU+rsbTq1OqI=;
        b=buUHVaHI9uN6sfYG1nWZzijwCPCNjEAIPaeREctg4z3QmthoyzOJjdN8Uz0BTU2YTk
         HoPxOIZbzuKrm2PiAXHjhN/5rm3w/fjiO9SPxuyAz9Ntf3awDf8hGrfqfGyxrLIvpH8a
         MGZTGtn/tm8X29j/BZPdIAbs1ov3pnPxVGjuf7kHI25ex70EwU3XTNX/FO99Csb01oS0
         eISnWP6GHsZHmg3GQHRD+NFZ5Pm5YN6JDV9gEan56yB4KHbI6PpzQjjEu7UXv8pIRxck
         eI2LI5sSZRIFcZX3SilPIecQc5cX3V3NMrT6hT1oI/G486+yWP2B5JX8T/n5f6gyQD/R
         bctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729759839; x=1730364639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgmH6EiWua9oEqrpdsm7WLZY3Ofnp+yCU+rsbTq1OqI=;
        b=dtGQerXRFYeOcs3KdrwkJV2+4qfYgnj+Sv9mldtANq6rjnPNne1pSVmzJ7RwP1y3Xg
         Q/4GeDRb1uBLuCwlBtIphviok+16YXd0diUPHShWRD1PtHrx2iXvH/cJNJr4SG98U7M4
         rfJNroPD3kKVbCFB7DelxEMcVSVHA8p+S5k3eimE5loZEn46wk/N6nKP9yW6PSujM8Ar
         X6R2uy6F44v333mRVafcdXn/dyHOaMMRo0zVmz8L0djP/tN7pn6DxMAiIBge/cslenEw
         Zcky1/EQoV7wfjuh+fQEmm5cfxWINxd1yZ9sDE/HXR18VIHxPXe58jaKMAHEaxtCaCAZ
         hhoA==
X-Gm-Message-State: AOJu0YzYjcgTn6MkkYCKrCgWY1tfGySyMPMF35j5NSImS0GvJ+trvb+K
	OgDRnJ6f+PVeOlV3XjFNq+8cgbMpfT211nFsi0psEGtD0QjmkC/BfBBrg73bsfXysTJql8sF9/y
	iGHjbW/pbSNScY0a2yTwP6Zr1BdRNgIZ4qZOs8w==
X-Google-Smtp-Source: AGHT+IHTWtgC5XjPdmPJWLLGEBpAgHp8F8asWqaXLSh+0BQnzTEDaYNBLvOROvnD3ZwtLW8WUG86hbprKENrG0j9raY=
X-Received: by 2002:a05:6870:1688:b0:287:8706:ae3 with SMTP id
 586e51a60fabf-28ced26c6admr1193030fac.11.1729759839310; Thu, 24 Oct 2024
 01:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729066788.git.bertrand.marquis@arm.com> <9464941b06e82763ebe79e3f2adb4ca2497cf298.1729066788.git.bertrand.marquis@arm.com>
In-Reply-To: <9464941b06e82763ebe79e3f2adb4ca2497cf298.1729066788.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 24 Oct 2024 10:50:27 +0200
Message-ID: <CAHUa44H+EipP-F_12tWidOxfFPf-jVcSs4XjLjBv5t05-Kw59g@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] xen/arm: ffa: Add indirect message support
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
> Add support for FFA_MSG_SEND2 to send indirect messages from a VM to a
> secure partition.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
> - rebase
> ---
>  xen/arch/arm/tee/ffa.c         |  5 ++++
>  xen/arch/arm/tee/ffa_msg.c     | 49 ++++++++++++++++++++++++++++++++++
>  xen/arch/arm/tee/ffa_private.h |  1 +
>  3 files changed, 55 insertions(+)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 3a9525aa4598..21d41b452dc9 100644
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
> index ae263e54890e..335f246ba657 100644
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
> @@ -78,3 +87,43 @@ out:
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

The guest can change src_mst at any moment with another CPU so these
tests are only sanity checks. The SPMC will also have to lock and do
the same tests again. So the tests here will only in the best case (in
case the guest is misbehaving) save us from entering the SPMC only to
get an error back. The lock makes sense since we could have concurrent
calls to FFA_MEM_SHARE. How about removing the tests?

> +
> +    ret =3D ffa_simple_call(FFA_MSG_SEND2, ((uint32_t)src_id) << 16, 0, =
0, 0);

I'd rather use ffa_get_vm_id(src_d) instead of src_id.

Cheers,
Jens

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

