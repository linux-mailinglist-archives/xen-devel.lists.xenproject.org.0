Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0FECB0630
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 16:20:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181842.1504827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSzVw-00081Y-4W; Tue, 09 Dec 2025 15:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181842.1504827; Tue, 09 Dec 2025 15:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSzVw-0007zP-1z; Tue, 09 Dec 2025 15:20:32 +0000
Received: by outflank-mailman (input) for mailman id 1181842;
 Tue, 09 Dec 2025 15:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9j7=6P=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vSzVu-0007zJ-FS
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 15:20:30 +0000
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [2607:f8b0:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97b27170-d512-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 16:20:28 +0100 (CET)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-4557c596339so302335b6e.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 07:20:28 -0800 (PST)
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
X-Inumbo-ID: 97b27170-d512-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765293627; x=1765898427; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RXnCjLpBnFu3xg+Z5lOG4Th4AQLzsqJLO+ggFjyTTM=;
        b=Tig/LbI91zrMaZHLEZPanny3Lu8FPt1AFoOqLhYRm87J0hg/s/qgvsQ/2PEVCaYaNF
         s/T9DMbN3ftv7Uy+Bpb+xMqlErMqVZyB+RB4Dyz18FgNmF5IuOuBMWz5t/dLI2GBqPLa
         wzCJlbFDbe21ImJwiq1jIFSxIRjnMh+M8QkvEEnvFJsaNiB+GZcQfqady0l/00yB35EU
         Mn1aPkwCLZIThhzh77xaGIvVSIPw2hArJ2OHJ1jvZCPbK53jWpHHt/eMb4dLtFi+r85A
         Z+JpdSf+Ufkj3L57a9J5ENOmyEJUou6YYcS/yLTenvIFh2De95v2MqTJ1sWg10P+N7Od
         P+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765293627; x=1765898427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5RXnCjLpBnFu3xg+Z5lOG4Th4AQLzsqJLO+ggFjyTTM=;
        b=RAHhIOLXtlyKdP7MKDXJ/bIl9wSrDqXomcYF9CUNCqipJDiYkyiAqifr4Upg0Sr7Fm
         xUoi2Qp72eZ6XsDJW8Ol1h1z6r5kMQLbaIW6oFw9XR6cYPlX9h4BhZ0bobCiiMKR8Qzx
         K7703ILXQb2LxyfkDzhe1bW1Mp8czJAh0rNrDGdF9zSyZ5pOOMbT1g38TP+7RlMq+JK4
         PFsfL2d6J//oqhIKRneWXKx73113Nb8lh4E6LhlObg4HTRZ8ZNs7BqUrQaQZEUsazrwv
         TQOM32NavHH3obT9aIpPy4BNLhdEbfBGBqWspy8A+YWQATbgMoIucCz0Z+8tErFr3ZbI
         2WtQ==
X-Gm-Message-State: AOJu0YxYAA67bwM3LBXDbzbZOLUZG2EokK7SMugpempyTTzIDZDg6qS3
	dvwWjkLk27q/y6EvGcXPY4zquCsgndZQZ7u5OALdUWIOmwrqNtNGLWO0YIlD/a/LEshNqrds69c
	8PhtZEXANqGBZ3GdZ6rl8R63gjAHWUURwJQp8mzLN6w==
X-Gm-Gg: ASbGncs8DvAQ3Mj/gs7SmWXffzZPjRSOQtj1dfYDfXV7KEUCEGdaEjA5/BBWR54nUPH
	4Z71GSpLwFXGoKDPFMvPgzvZ7SKJbVLRd66scSjKGDmo4YS/My+/Y8hbTcBuaMvvzzRzRb6PfMM
	myKaQMOuAKoVsJfjhpbwkdj5591YF8oqhg0jAo9teILYFQSqgeLsffaUXJnw7WiPqlm67TQboAE
	ymPh5Nv4EVxkRmS0qEQPhvNJED93Q7BXEWlK94qW4IUuUf8uv/apKcSxGs3y5iQTiLsg4eQq057
	2lRpsA7oxRB2zG0tWLT3aBsWOH4qDhUS3LePmWvCZT6Dj5AxcrxwHO4/uOMgUQ==
X-Google-Smtp-Source: AGHT+IGHAWYoEMDEwAtDGEMcvorvWlm7YjJ5N/SnuWRZaGXfDfI2zv1KIHs0sJqkt5zwyq9iM9TVSsaGD8wibCiCfrQ=
X-Received: by 2002:a05:6808:2381:b0:449:39e0:f3ce with SMTP id
 5614622812f47-4539df6497dmr5575017b6e.28.1765293627264; Tue, 09 Dec 2025
 07:20:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764930353.git.bertrand.marquis@arm.com> <cbf340d18fe0f2733d81455bb43e63775e29a055.1764930353.git.bertrand.marquis@arm.com>
In-Reply-To: <cbf340d18fe0f2733d81455bb43e63775e29a055.1764930353.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 9 Dec 2025 16:20:15 +0100
X-Gm-Features: AQt7F2q81BoYiQR4OX4zr61o9EJj4SHTTGX4rtJlYRspwav3At1blTAHMGI0938
Message-ID: <CAHUa44FEunGHQ62FPLJz6wXmSMtVdO=yJ1e3Qk-Kd_ggEtvMwA@mail.gmail.com>
Subject: Re: [PATCH v1 10/12] xen/arm: ffa: add v1.2 SEND2 header layout
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Fri, Dec 5, 2025 at 11:37=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Teach the SEND2 path about the distinct FF-A v1.1 and v1.2 RX/TX header
> layouts so we can propagate the 128-bit UUIDs introduced in v1.2.
>
> VM-to-VM SEND2 calls now build the larger v1.2 header, zeroing the UUID
> fields for v1.1 senders, and the dispatcher validates messages using
> the v1.1 header layout to keep legacy guests working.
>
> While there, make the code more robust by checking that the send is not
> trying to send a message to himself.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v1:
> - Mention self send check in commit message
> - check header size depending on sender FF-A version and make sure 1.2
>   has enough space for 1.2 header
> - Simplify the code by setting uuid field of the header to Nil-UUID when
>   testing the caller version and remove the need to pass the context to
>   the send2_vm function
> - Use ACCESS_ONCE when reading sender ffa version
> ---
>  xen/arch/arm/tee/ffa_msg.c | 58 ++++++++++++++++++++++++++++++--------
>  1 file changed, 47 insertions(+), 11 deletions(-)

Looks good
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index 5a4cb1bb8295..c3552a3ae36d 100644
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
> @@ -105,11 +115,11 @@ out:
>  }
>
>  static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
> -                                struct ffa_part_msg_rxtx *src_msg)
> +                                struct ffa_part_msg_rxtx_1_2 *src_msg)
>  {
>      struct domain *dst_d;
>      struct ffa_ctx *dst_ctx;
> -    struct ffa_part_msg_rxtx *dst_msg;
> +    struct ffa_part_msg_rxtx_1_2 *dst_msg;
>      void *rx_buf;
>      size_t rx_size;
>      int err;
> @@ -143,7 +153,7 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, cons=
t void *src_buf,
>          goto out_unlock;
>
>      /* we need to have enough space in the destination buffer */
> -    if ( (rx_size - sizeof(struct ffa_part_msg_rxtx)) < src_msg->msg_siz=
e )
> +    if ( (rx_size - sizeof(struct ffa_part_msg_rxtx_1_2)) < src_msg->msg=
_size )
>      {
>          ret =3D FFA_RET_NO_MEMORY;
>          ffa_rx_release(dst_ctx);
> @@ -155,11 +165,14 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, co=
nst void *src_buf,
>      /* prepare destination header */
>      dst_msg->flags =3D 0;
>      dst_msg->reserved =3D 0;
> -    dst_msg->msg_offset =3D sizeof(struct ffa_part_msg_rxtx);
> +    dst_msg->msg_offset =3D sizeof(struct ffa_part_msg_rxtx_1_2);
>      dst_msg->send_recv_id =3D src_msg->send_recv_id;
>      dst_msg->msg_size =3D src_msg->msg_size;
> +    dst_msg->reserved2 =3D 0;
> +    dst_msg->uuid[0] =3D src_msg->uuid[0];
> +    dst_msg->uuid[1] =3D src_msg->uuid[1];
>
> -    memcpy(rx_buf + sizeof(struct ffa_part_msg_rxtx),
> +    memcpy(rx_buf + sizeof(struct ffa_part_msg_rxtx_1_2),
>             src_buf + src_msg->msg_offset, src_msg->msg_size);
>
>      /* receiver rx buffer will be released by the receiver*/
> @@ -178,11 +191,17 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *=
regs)
>      struct ffa_ctx *src_ctx =3D src_d->arch.tee;
>      const void *tx_buf;
>      size_t tx_size;
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
>      ret =3D ffa_tx_acquire(src_ctx, &tx_buf, &tx_size);
>      if ( ret !=3D FFA_RET_OK )
> @@ -194,15 +213,32 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *=
regs)
>      src_id =3D src_msg.send_recv_id >> 16;
>      dst_id =3D src_msg.send_recv_id & GENMASK(15,0);
>
> -    if ( src_id !=3D ffa_get_vm_id(src_d) )
> +    if ( src_id !=3D ffa_get_vm_id(src_d) ||
> +         dst_id =3D=3D ffa_get_vm_id(src_d) )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    if ( ACCESS_ONCE(src_ctx->guest_vers) < FFA_VERSION_1_2 )
> +    {
> +        if (src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx_1_1))
> +        {
> +            ret =3D FFA_RET_INVALID_PARAMETERS;
> +            goto out;
> +        }
> +        /* Set uuid to Nil UUID for v1.1 guests */
> +        src_msg.uuid[0] =3D 0;
> +        src_msg.uuid[1] =3D 0;
> +    }
> +    else if ( src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx_1_2) =
)
>      {
>          ret =3D FFA_RET_INVALID_PARAMETERS;
>          goto out;
>      }
>
>      /* check source message fits in buffer */
> -    if ( src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx) ||
> -            src_msg.msg_size =3D=3D 0 || src_msg.msg_offset > tx_size ||
> +    if ( src_msg.msg_size =3D=3D 0 || src_msg.msg_offset > tx_size ||
>              src_msg.msg_size > (tx_size - src_msg.msg_offset) )
>      {
>          ret =3D FFA_RET_INVALID_PARAMETERS;
> --
> 2.51.2
>

