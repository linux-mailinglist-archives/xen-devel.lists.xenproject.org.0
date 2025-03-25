Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CDBA6EA69
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 08:22:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926062.1328915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twybq-0006Tp-H5; Tue, 25 Mar 2025 07:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926062.1328915; Tue, 25 Mar 2025 07:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twybq-0006Qh-Dk; Tue, 25 Mar 2025 07:22:02 +0000
Received: by outflank-mailman (input) for mailman id 926062;
 Tue, 25 Mar 2025 07:22:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B0qP=WM=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1twybo-0006Qb-IZ
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 07:22:00 +0000
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [2607:f8b0:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d69f9774-0949-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 08:21:59 +0100 (CET)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-72c14138668so674751a34.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 00:21:59 -0700 (PDT)
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
X-Inumbo-ID: d69f9774-0949-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742887318; x=1743492118; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KiUmbp6CtUte/qgasF3BI8wkEyt3CYP3GiOJePeBhIc=;
        b=xDVpJpSXYbY+8MTAcmH2cK1YpEPiMQiHRrst7SjMRWqFCl/f8pai+F37quv+RWzPn3
         9xVYuMPZjvjDUYaqQprjxJwHYIH2E0WAB/Pm1ntw3B9yuNC3PDcOZNmEi6LQfJKgRqRc
         g9K0SjldVujsEQQp+81NvpJY03Vdt0JaiDAGKLXxIbv23fdnCEOcjhvC8wW/+qTRhQ4U
         W9VPPlXflFZ4B+eUfn3xTrpfi02EZnqV8lGYDJNNSQpMVGh2pN2banAgaD2hZkLRvfT6
         F1XewJ0okDVhQxHUZthpAk5uoKAoNTjOMSCJEpvs4CB6A7YNjhhqWt4wDBRrvHMY2Mk+
         YBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742887318; x=1743492118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KiUmbp6CtUte/qgasF3BI8wkEyt3CYP3GiOJePeBhIc=;
        b=auOAJ80FLAcmyARuGUKQo6f+siXb4gCXdgfluioucK7JA1Ne8ImolRL/oRyclqacVz
         FCJCfcd+QNoeWAa5oAgvN98l02NHh/UyGIjxeskrPZfJuevJXJulJc3TGSVLfz4cAZho
         /UBF8qj7bQeU/pxaapBeMmsZc0r/nzrU0S92xCJgLfYCXHQBbmWL0nK/FMFsc7DQS/J2
         qFdXjpsHzvGj7AxcVhs1lGYAzDbxybkpjffe7QozgLSzSJGiMKCq6iaUl41iYfpln5z9
         JKJMYmyONBR80gzU9FJYwlLqMFHwLdZdbxlrvNwxP4rdIM7PJSTUtOaxS9+CP0HEj4Bm
         yM9w==
X-Gm-Message-State: AOJu0Yxu6khAiQ0iFrpNmPAsafEb26rE8MlObScf/8E5BvY1XdONPO3F
	uOkjgaArbQn1MRygZn1OHLp4k/gJtWAFofizgMRbHwxHEeo483AMV4p4pCH/eUbTP5aZSO7ZUp2
	uZQCNpk47aE8zrxD5HhSUtwkBerEvnWN3Zy53gg==
X-Gm-Gg: ASbGnct8hGybdh9clW2S3ZVVGxQLH1xnCEu/4NIr7seWDFrsVW4ooR9DsXTFdRn9Aa8
	Yb6zKOgsxALkwyeZt4DJAZHaw+Qz8QzsYKW+ox5FOj+6yddK70uGwBzgSf9NY+j6UDGQRlmDWGF
	/G2WDW/ikA9DPjQclJJBOR7Jl205ljUgdB4TxgTw==
X-Google-Smtp-Source: AGHT+IGGfche2VvbHJ9J/jIYxnSxl4L8RvckP6nsOMDk3cEXoWSABtsyiOlQtXCFQXu7RBsImAIhsSPGH4LZoEtWjj0=
X-Received: by 2002:a9d:6741:0:b0:72c:320b:f76b with SMTP id
 46e09a7af769-72c320c0028mr2224053a34.1.1742887317949; Tue, 25 Mar 2025
 00:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1742824138.git.bertrand.marquis@arm.com> <719dad25719a0834dc0e52da715aca989a3c20fb.1742824138.git.bertrand.marquis@arm.com>
In-Reply-To: <719dad25719a0834dc0e52da715aca989a3c20fb.1742824138.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 25 Mar 2025 08:21:46 +0100
X-Gm-Features: AQ5f1Jp4yaZl8NVs_6Ah_jxGWeHmYctAnFecU1-kuG9fXKrc-kutFdEhrFoHp44
Message-ID: <CAHUa44FfP0qrOgubGpdGSMVhDNonQVbWq+cor9NshvYh8S6hqg@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] xen/arm: ffa: Add indirect message between VM
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Mon, Mar 24, 2025 at 2:53=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Add support for indirect messages between VMs.
> This is only enabled if CONFIG_FFA_VM_TO_VM is selected.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v4:
> - Use a local copy of the message header to prevent a TOC/TOU possible
>   issue when using the payload size
> Changes in v3:
> - Move vm to vm indirect message handling in a sub function to simplify
>   lock handling and make implementation easier to read
> Changes in v2:
> - Switch ifdef to IS_ENABLED
> ---
>  xen/arch/arm/tee/ffa_msg.c | 110 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 96 insertions(+), 14 deletions(-)

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index ee594e737fc7..7c36e3aac47c 100644
> --- a/xen/arch/arm/tee/ffa_msg.c
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -88,43 +88,125 @@ out:
>                   resp.a7 & mask);
>  }
>
> +static int32_t ffa_msg_send2_vm(uint16_t dst_id,
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
> -
>      if ( !spin_trylock(&src_ctx->tx_lock) )
>          return FFA_RET_BUSY;
>
> -    src_msg =3D src_ctx->tx;
> -    src_id =3D src_msg->send_recv_id >> 16;
> -    dst_id =3D src_msg->send_recv_id & GENMASK(15,0);
> +    /* create a copy of the message header */
> +    memcpy(&src_msg, src_ctx->tx, sizeof(src_msg));
> +
> +    src_id =3D src_msg.send_recv_id >> 16;
> +    dst_id =3D src_msg.send_recv_id & GENMASK(15,0);
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
>      if ( src_ctx->page_count * FFA_PAGE_SIZE <
> -         src_msg->msg_offset + src_msg->msg_size ||
> -         src_msg->msg_offset < sizeof(struct ffa_part_msg_rxtx) )
> +         src_msg.msg_offset + src_msg.msg_size ||
> +         src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx) )
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
> +        ret =3D ffa_msg_send2_vm(dst_id, &src_msg);
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

