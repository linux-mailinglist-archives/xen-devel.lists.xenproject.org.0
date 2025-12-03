Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 058E9CA0057
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 17:39:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176952.1501391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQpsY-0000xG-Lq; Wed, 03 Dec 2025 16:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176952.1501391; Wed, 03 Dec 2025 16:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQpsY-0000vh-J3; Wed, 03 Dec 2025 16:38:58 +0000
Received: by outflank-mailman (input) for mailman id 1176952;
 Wed, 03 Dec 2025 16:38:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qm2A=6J=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vQpsX-0000rP-1Y
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 16:38:57 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ccb89ce-d066-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 17:38:51 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-640ca678745so12018551a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 08:38:51 -0800 (PST)
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
X-Inumbo-ID: 8ccb89ce-d066-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764779931; x=1765384731; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5aHQkGzpf+upRpWJ11bQwlgkk0tbTPDG2l2pgwFtxY=;
        b=YGCRMIEyv9QKjsyEj2Td7fu7AWCe2t7x5QO5QJ55hYqhXOWRLwUQz7M4fAR/hNSDco
         W/8gswVU8GSekjT1EOtDEInrjINhOxbG0DEznB3PJagvmh7vrusB+34IsP2PZYdf/5oT
         z0d8RjRlxtYsi9GBz+HOOWuOOErJtecRi4n4SXgg4TcCMRV3D6gIXvkx8gw2NjB0XeCf
         PFU5KdjMn1hCSWXU5O/e34tCYQfr3S2W7fB8RrEGsKdQWDl8e0Rzm2nkASRedZBjbqUE
         IYtEA9a1NQrzw0GRlm4rFa/JcW7wiocfhOWk78ZoZQE+kCsjqj5KaJlVckUtFsqRbniK
         l4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764779931; x=1765384731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z5aHQkGzpf+upRpWJ11bQwlgkk0tbTPDG2l2pgwFtxY=;
        b=J6pWDDysv8yEN73T6+wxuXuJS4s5QcxCNP44pL/X+zzs0dHAclynk8K21xX1bXluQg
         h7EmJJjS/3pDXuLHWQcXHUJ4rxLOBMU+Mo5M2FWcBrFMzMKymX1I+pwWXMdjhbnguqfB
         pYvmLxM2BFowQi1Kcmf4o8G66EhyEC9ed5rgdyePT4Neu0m4Hwg6bP6+Fnr3Eei0A7W3
         nIgWa03ahrxCHfl+2+kBq0AS80FTU1zOTU4WkI4EeRw55W0DS1NTETYpHeDkXneJ0WCf
         631CXIjNwVLYxfq+rIluimSb8CbdakYWIPNUlV7gi4/a2C2GfzqEzow7LoTqEeuVefNS
         qRug==
X-Gm-Message-State: AOJu0YxpJgTM1sEkU4hecASa/OoNKmmLMYSezZM7kv2oULY2wMvWKs0S
	Wi68Wg5kBgo+rpFeJrMFDSe85AIlu9aMPPmOO1QDwqhl0wpxuu8UcRwtpUcypM2E2NpiCoA/RC8
	xKHrAPn1BWF+6j6WyRHhoFq3u+OBzPO+TTFvCZbEgPg==
X-Gm-Gg: ASbGncsxcFC8D9Yc1qdNo8F97LbYwAXT0z1GlAKXvtM/A8wEh0BPtSItVs1+nozRS7i
	h2OA7CHm9ZBIn0j7Ydgetw0px6+BLbcliE7iTsgXyUffC65bwqpFGbCDao1GIubwTGftFvI/NeN
	ikBI9EM69qlGKzrMIL//zCv27Oeyf/BzyxVouy3wxggBG6Bw+RyQRd9MyEqcN5exd1udr5IuJnl
	kjeK/aJd88PoR53cAAApd1a9F3pWigHB+iF+uNiiaraysHvHwJ2sizdsTklDzq51fSEvDWbC/UI
	yLR9CMgsTdkZDiCItSf325EQ0Q==
X-Google-Smtp-Source: AGHT+IGuz7b9ZDsCeS0apxCvIquz9fDhzHc3/sKlH7i4bwruDV/IsBfzfiy63wNZMTTcVlgBjQeyoPjNAniDd7PYe/A=
X-Received: by 2002:a05:6402:35cd:b0:641:72a8:c921 with SMTP id
 4fb4d7f45d1cf-6479c504208mr2472260a12.23.1764779930962; Wed, 03 Dec 2025
 08:38:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764254975.git.bertrand.marquis@arm.com> <769c7ad291abe47d7991b878b131f9b31d4f0954.1764254975.git.bertrand.marquis@arm.com>
In-Reply-To: <769c7ad291abe47d7991b878b131f9b31d4f0954.1764254975.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 3 Dec 2025 17:38:38 +0100
X-Gm-Features: AWmQ_bkoSgX5xporm8CRAljOmJJBZOzdsjKk_iRsZyTXnjx6yqZ2-SYqyGbPSvo
Message-ID: <CAHUa44EBeb+9+_JfwX4iLyEbnEE1dxuRvV5_reUtHM0XejG_SQ@mail.gmail.com>
Subject: Re: [PATCH 08/10] xen/arm: ffa: add v1.2 SEND2 header layout
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Thu, Nov 27, 2025 at 4:53=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Teach the SEND2 path about the distinct FF-A v1.1 and v1.2 RX/TX header
> layouts so we can propagate the 128-bit UUIDs introduced in v1.2.
>
> VM-to-VM SEND2 calls now build the larger v1.2 header, zeroing the UUID
> fields for v1.1 senders, and the dispatcher validates messages using
> the v1.1 header layout to keep legacy guests working.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_msg.c | 55 +++++++++++++++++++++++++++++---------
>  1 file changed, 42 insertions(+), 13 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index 8bb4bd93f724..472bfad79dd3 100644
> --- a/xen/arch/arm/tee/ffa_msg.c
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -13,7 +13,7 @@
>  #include "ffa_private.h"
>
>  /* Encoding of partition message in RX/TX buffer */
> -struct ffa_part_msg_rxtx {
> +struct ffa_part_msg_rxtx_1_1 {
>      uint32_t flags;
>      uint32_t reserved;
>      uint32_t msg_offset;
> @@ -21,6 +21,16 @@ struct ffa_part_msg_rxtx {
>      uint32_t msg_size;
>  };
>
> +struct ffa_part_msg_rxtx_1_2 {
> +    uint32_t flags;
> +    uint32_t reserved;
> +    uint32_t msg_offset;
> +    uint32_t send_recv_id;
> +    uint32_t msg_size;
> +    uint32_t reserved2;
> +    uint64_t uuid[2];
> +};
> +
>  static void ffa_finish_direct_req_run(struct cpu_user_regs *regs,
>                                        struct arm_smccc_1_2_regs *req)
>  {
> @@ -104,12 +114,12 @@ out:
>      ffa_set_regs_error(regs, ret);
>  }
>
> -static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
> -                                struct ffa_part_msg_rxtx *src_msg)
> +static int32_t ffa_msg_send2_vm(struct ffa_ctx *src_ctx, uint16_t dst_id=
,
> +                                struct ffa_part_msg_rxtx_1_2 *src_msg)
>  {
>      struct domain *dst_d;
>      struct ffa_ctx *dst_ctx;
> -    struct ffa_part_msg_rxtx *dst_msg;
> +    struct ffa_part_msg_rxtx_1_2 *dst_msg;
>      int err;
>      int32_t ret;
>
> @@ -142,7 +152,7 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, cons=
t void *src_buf,
>
>      /* we need to have enough space in the destination buffer */
>      if ( (dst_ctx->page_count * FFA_PAGE_SIZE -
> -          sizeof(struct ffa_part_msg_rxtx)) < src_msg->msg_size )
> +          sizeof(struct ffa_part_msg_rxtx_1_2)) < src_msg->msg_size )
>      {
>          ret =3D FFA_RET_NO_MEMORY;
>          ffa_rx_release(dst_d);
> @@ -154,12 +164,24 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, co=
nst void *src_buf,
>      /* prepare destination header */
>      dst_msg->flags =3D 0;
>      dst_msg->reserved =3D 0;
> -    dst_msg->msg_offset =3D sizeof(struct ffa_part_msg_rxtx);
> +    dst_msg->msg_offset =3D sizeof(struct ffa_part_msg_rxtx_1_2);
>      dst_msg->send_recv_id =3D src_msg->send_recv_id;
>      dst_msg->msg_size =3D src_msg->msg_size;
> +    dst_msg->reserved2 =3D 0;
>
> -    memcpy(dst_ctx->rx + sizeof(struct ffa_part_msg_rxtx),
> -           src_buf + src_msg->msg_offset, src_msg->msg_size);
> +    if ( src_ctx->guest_vers < FFA_VERSION_1_2 )
> +    {
> +        dst_msg->uuid[0] =3D 0;
> +        dst_msg->uuid[1] =3D 0;
> +    }
> +    else
> +    {
> +        dst_msg->uuid[0] =3D src_msg->uuid[0];
> +        dst_msg->uuid[1] =3D src_msg->uuid[1];
> +    }
> +
> +    memcpy(dst_ctx->rx + sizeof(struct ffa_part_msg_rxtx_1_2),
> +           src_ctx->tx + src_msg->msg_offset, src_msg->msg_size);
>
>      /* receiver rx buffer will be released by the receiver*/
>
> @@ -175,11 +197,17 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *=
regs)
>  {
>      struct domain *src_d =3D current->domain;
>      struct ffa_ctx *src_ctx =3D src_d->arch.tee;
> -    struct ffa_part_msg_rxtx src_msg;
> +    /*
> +     * src_msg is interpreted as v1.2 header, but:
> +     * - for v1.1 guests, uuid[] is ignored and may contain payload byte=
s
> +     * - for v1.2 guests, uuid[] carries the FF-A v1.2 UUID fields
> +     */
> +    struct ffa_part_msg_rxtx_1_2 src_msg;
>      uint16_t dst_id, src_id;
>      int32_t ret;
>
> -    BUILD_BUG_ON(sizeof(struct ffa_part_msg_rxtx) >=3D FFA_PAGE_SIZE);
> +    BUILD_BUG_ON(sizeof(struct ffa_part_msg_rxtx_1_1) >=3D FFA_PAGE_SIZE=
);
> +    BUILD_BUG_ON(sizeof(struct ffa_part_msg_rxtx_1_2) >=3D FFA_PAGE_SIZE=
);
>
>      if ( !spin_trylock(&src_ctx->tx_lock) )
>          return FFA_RET_BUSY;
> @@ -190,14 +218,15 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *=
regs)
>      src_id =3D src_msg.send_recv_id >> 16;
>      dst_id =3D src_msg.send_recv_id & GENMASK(15,0);
>
> -    if ( src_id !=3D ffa_get_vm_id(src_d) )
> +    if ( src_id !=3D ffa_get_vm_id(src_d) ||
> +         dst_id =3D=3D ffa_get_vm_id(src_d) )

It might be worth mentioning in the commit message that we're making
it a bit more robust.

>      {
>          ret =3D FFA_RET_INVALID_PARAMETERS;
>          goto out;
>      }
>
>      /* check source message fits in buffer */
> -    if ( src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx) ||
> +    if ( src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx_1_1) ||

This is for FF-A version 1.1; for version 1.2, the minimal offset must
be larger.

Cheers,
Jens

>              src_msg.msg_size =3D=3D 0 ||
>              src_msg.msg_offset > src_ctx->page_count * FFA_PAGE_SIZE ||
>              src_msg.msg_size > (src_ctx->page_count * FFA_PAGE_SIZE -
> @@ -222,7 +251,7 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *re=
gs)
>      else if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
>      {
>          /* Message for a VM */
> -        ret =3D ffa_msg_send2_vm(dst_id, src_ctx->tx, &src_msg);
> +        ret =3D ffa_msg_send2_vm(src_ctx, dst_id, &src_msg);
>      }
>      else
>          ret =3D FFA_RET_INVALID_PARAMETERS;
> --
> 2.51.2
>

