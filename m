Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A30ABFBB1
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992340.1376093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHmhi-0006jP-2i; Wed, 21 May 2025 16:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992340.1376093; Wed, 21 May 2025 16:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHmhh-0006h3-VM; Wed, 21 May 2025 16:54:05 +0000
Received: by outflank-mailman (input) for mailman id 992340;
 Wed, 21 May 2025 16:54:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPXp=YF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1uHmhg-0006gx-Gu
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:54:04 +0000
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [2001:4860:4864:20::2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 312bd0c3-3664-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 18:54:00 +0200 (CEST)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-2db9e29d3bcso2046117fac.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:54:00 -0700 (PDT)
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
X-Inumbo-ID: 312bd0c3-3664-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747846439; x=1748451239; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbHs+5nY9sp/4FUlljaXDfUYYdafIe7VtM5PIMYtNvQ=;
        b=O8mcFRYvk6x+o7IYxfGn8zBM2+HTVjxkc/jcn17moQ4JNifeiEv5oqqqkqY/4cvf2e
         v1qRlsXfeU7Vh8CklUy3VWfTpoCHBJpzti/HdB4Vhz08fCG31wn7pUYiZb4LXyB19D0R
         g+vAmidz1elNDbfqx9hu4rhiyldsuP+vPAsWRpt9xh8HUCcNaA3ZPnIXnK6IaQeymdHc
         DUJvjUKO5I8TNyjApcl86uz1kmjcgfDfNNWPLcE1AM5FWExO5YueSNjGVNm84xrGtzUA
         X9ROWncDxNr0P/yTtDWnYNjfUO25ZI6Hul2pc/kml6oz8e9t4q9SaSXKTDwAaprw4jQO
         LmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846439; x=1748451239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbHs+5nY9sp/4FUlljaXDfUYYdafIe7VtM5PIMYtNvQ=;
        b=IDwaLtYWLGRx+ZZ5NFMQBmuhIMy8b7iireGiQAxc9xGyaL4scMUYZol8uqI11ptLiQ
         L/GnFxzvjR2hIivInurWeUkCefl9qeIYTqzDMx5O5+3GCjSd4er3z74rAgU2eMP3uvJu
         xQBVbnFPoeMIS49MkeSVYHvUgysUTk8vj3LnUNhTLoAY4YWqMzCTu4F7RZgt8HRxKO4b
         CZ66Y27tPnPNrRCs041J8ZBhUIBJUppUyFLzYKgjebuMAYxouC0cTEozuWs6sw5yzlfK
         ozKN/yOQklMzvTauOIzaxeU0kUSHzMQdP5LfPQSEbz4/mN3Jo6Vrj/AHKvmm44dNsXKB
         r2nw==
X-Gm-Message-State: AOJu0YyjbIlPlR8hH+TOuSxxuK/tzC+uQAsEIRpVOtSik+pMSQ/PLSRY
	1UH3/ggVGQvf2rU0Uo/u9+ejfCis2lchcUOPsAh3KMQXskEjVIdERyexVqcpKeTSElW1lsWnCDe
	Y1XkKViXXeDR+7kKRsXvYORPn2SZ5jyYvXtlhQR8OoA==
X-Gm-Gg: ASbGncss15kY8E4jP7httPHDF/h/mbX6n9WQWqm84uk4KOO6xSs5y23aeD2AMv3+IIu
	t/NeCWNkrhjn1rPVQOgMcLKNsW9/6RtM+zptB5CGBMaKlNQtXDM+WWlxFIr6vstMeEajxnhHEQv
	bg1VyIOnobiiWJu/g4PRF1oIz8/I+3RgITrw==
X-Google-Smtp-Source: AGHT+IErp45iVYOCQvuZywNrTvp6HN8/ehvHQ/RjpNov1ey5jCy18yRv6uJsQ/JHlCOWVFFJl6TDJwYzv6UW8BQXBhc=
X-Received: by 2002:a05:6871:50c7:b0:29e:2caf:8cc with SMTP id
 586e51a60fabf-2e3c1fa7334mr12642844fac.37.1747846439193; Wed, 21 May 2025
 09:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787720.git.bertrand.marquis@arm.com> <81ec9ce34c3990b02ec6427d95b6238445333b57.1744787720.git.bertrand.marquis@arm.com>
In-Reply-To: <81ec9ce34c3990b02ec6427d95b6238445333b57.1744787720.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 21 May 2025 18:53:47 +0200
X-Gm-Features: AX0GCFttCTN8XoOGEuGwaCDV3kKZDkShiaEsTHPZyt_AzrXO7d5KwmSwGcgKO8s
Message-ID: <CAHUa44G1qdtC7PY0bpsGXMhCdEn9greidJPgSNy0hymh7ckZ5A@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] xen/arm: ffa: Add indirect message between VM
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
> Add support for indirect messages between VMs.
> This is only enabled if CONFIG_FFA_VM_TO_VM is selected.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v5:
> - Prevent potential overflow in send2 handling (Julien)
> - Only use page_count with rx lock acquired
> - Fix an issue where send2 between VMs was not doing the copy from the
>   tx buffer but from a wrong location in the stack. This bug was
>   introduced in v4 when switching to a local copy for the header.
> Changes in v4:
> - Use a local copy of the message header to prevent a TOC/TOU possible
>   issue when using the payload size
> Changes in v3:
> - Move vm to vm indirect message handling in a sub function to simplify
>   lock handling and make implementation easier to read
> Changes in v2:
> - Switch ifdef to IS_ENABLED
> ---
>  xen/arch/arm/tee/ffa_msg.c | 115 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 101 insertions(+), 14 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index ee594e737fc7..35de260c013a 100644
> --- a/xen/arch/arm/tee/ffa_msg.c
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -88,43 +88,130 @@ out:
>                   resp.a7 & mask);
>  }
>
> +static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
> +                                struct ffa_part_msg_rxtx *src_msg)
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
> +    /* This also checks that destination has set a Rx buffer */
> +    ret =3D ffa_rx_acquire(dst_d);
> +    if ( ret )
> +        goto out_unlock;
> +
> +    /* we need to have enough space in the destination buffer */
> +    if ( (dst_ctx->page_count * FFA_PAGE_SIZE -
> +          sizeof(struct ffa_part_msg_rxtx)) < src_msg->msg_size )
> +    {
> +        ret =3D FFA_RET_NO_MEMORY;
> +        ffa_rx_release(dst_d);
> +        goto out_unlock;
> +    }
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
> +           src_buf + src_msg->msg_offset, src_msg->msg_size);
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
>      struct ffa_ctx *src_ctx =3D src_d->arch.tee;
> -    const struct ffa_part_msg_rxtx *src_msg;
> +    struct ffa_part_msg_rxtx src_msg;
>      uint16_t dst_id, src_id;
>      int32_t ret;
>
> -    if ( !ffa_fw_supports_fid(FFA_MSG_SEND2) )
> -        return FFA_RET_NOT_SUPPORTED;
> +    BUILD_BUG_ON(sizeof(struct ffa_part_msg_rxtx) >=3D FFA_PAGE_SIZE);
>
>      if ( !spin_trylock(&src_ctx->tx_lock) )
>          return FFA_RET_BUSY;
>
> -    src_msg =3D src_ctx->tx;
> -    src_id =3D src_msg->send_recv_id >> 16;
> -    dst_id =3D src_msg->send_recv_id & GENMASK(15,0);
> +    /* create a copy of the message header */
> +    memcpy(&src_msg, src_ctx->tx, sizeof(src_msg));
>
> -    if ( src_id !=3D ffa_get_vm_id(src_d) || !FFA_ID_IS_SECURE(dst_id) )
> +    src_id =3D src_msg.send_recv_id >> 16;
> +    dst_id =3D src_msg.send_recv_id & GENMASK(15,0);
> +
> +    if ( src_id !=3D ffa_get_vm_id(src_d) )
>      {
>          ret =3D FFA_RET_INVALID_PARAMETERS;
> -        goto out_unlock_tx;
> +        goto out;
>      }
>
>      /* check source message fits in buffer */
> -    if ( src_ctx->page_count * FFA_PAGE_SIZE <
> -         src_msg->msg_offset + src_msg->msg_size ||
> -         src_msg->msg_offset < sizeof(struct ffa_part_msg_rxtx) )
> +    if ( src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx) ||
> +            src_msg.msg_size =3D=3D 0 ||
> +            src_msg.msg_offset > src_ctx->page_count * FFA_PAGE_SIZE ||
> +            src_msg.msg_size > (src_ctx->page_count * FFA_PAGE_SIZE -
> +                                src_msg.msg_offset) )
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

Please align with the opening '(' at the row above.

Other than that:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

> +    }
> +    else if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +    {
> +        /* Message for a VM */
> +        ret =3D ffa_msg_send2_vm(dst_id, src_ctx->tx, &src_msg);
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

