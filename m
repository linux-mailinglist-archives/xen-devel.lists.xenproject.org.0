Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D690A6A845
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 15:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922147.1326067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGkv-0006Mu-Jy; Thu, 20 Mar 2025 14:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922147.1326067; Thu, 20 Mar 2025 14:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGkv-0006LM-HK; Thu, 20 Mar 2025 14:20:21 +0000
Received: by outflank-mailman (input) for mailman id 922147;
 Thu, 20 Mar 2025 14:20:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m8Tk=WH=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1tvGku-0006LG-S1
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 14:20:20 +0000
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [2607:f8b0:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72c79bae-0596-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 15:20:18 +0100 (CET)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-72736498817so535172a34.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 07:20:18 -0700 (PDT)
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
X-Inumbo-ID: 72c79bae-0596-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742480417; x=1743085217; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVTr7i642NvJsLByVxZvfPk4tibIU/WaEbnLA/mzdyo=;
        b=kLS0E4LabTQ1Hv/sq781dYZYtAxTwIBW7yL6irTmOhSBWimH1qowVKc1dBvnJgQW/f
         55JyMv+0/6dGX562g22fVJMljp21JbHXXUe+V+ESUgC5RQOAJV1ahmU668JPi/XB56vL
         geHYKsVNLDmcnYe0DQgBjcZEFfpqn1iBkLomuchUjVMA850Tw7LEXuWXK1JoOU7tnA8y
         DkuY7ZUxQFoHenLa8C4phIq4WCyRmQ5Jeq7HxKOEyNp3c0yyYFQb58duuG1awzy/dXGt
         77BnvnfpIDDwkW0gSEu07OaWu5Ywc0hPl3h/1BRvtUduhEjRonwEDTXf/T2tp5H8mDX7
         SRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742480417; x=1743085217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVTr7i642NvJsLByVxZvfPk4tibIU/WaEbnLA/mzdyo=;
        b=RRYkWDKZmUJqM6v3GdnPxLZzVviWbbKQlT+EcIsLBFi+UNCchpeZTcixum0/mgP3Ph
         gV0kOQzHFooQCAXDIfM0L3LbNhbcj/dcKg7bZimtsc77Gu2dHcszKnfAuntP0IuprYSu
         cEPKtazXbIe25/s709fnBUmRpbdKig6o7bQBY6oBdBRsxYuDi+RKcpUSoD9DNykySJHF
         Fs8OI9hR1IrKJW7N1SP4pYPxB8S5BO9HhUr/5IZaO/cr0mfQMOmtU1CtgDDurbCAhS0E
         rTqeZKk78SSf1HDqk2yddgwRJxG24G18U5+qLWUhriFR6/Y/eLHSvLRj3hkmCjSgW5r9
         nENg==
X-Gm-Message-State: AOJu0YyvUNVlQY8z14dTXrKAlfYR+pRPXvAx12FlRzOz7eIs7yzT5KdA
	rClP5B1Th10ztl3KWsDML61wxQuu4+LxpGzPT1IgBt3edFDjAiUgQuIATqNset2XyCj95sAWRFu
	TBN+wkgpf+bFB8/0UIIANtClYnOiDJI9QVvC6FA==
X-Gm-Gg: ASbGnctPdXVk3QjOE381/EFC8sX0dUCm5VvlyqNCyKkORRCmY8I1IrzLUoo6fBXy18o
	rX1JRr7jBIvIgn+swOPho2I8hpKvBrud/yQa1uSwiYrgyqOf+rZZDbOoPC07grKzGXKLfaHYFEZ
	0bqf1fuSRZKZiT8PaV0g1L1iKB2mRwIJ2ZdKcPHA==
X-Google-Smtp-Source: AGHT+IGYtgwGX9LNBZ+/h0c2jAusAfHl4gefQSYUKIdjxT+GMTCnWybsfPFPdT/9YBSfNTlsNF5cPuV5MdrRUh01c8w=
X-Received: by 2002:a05:6830:488e:b0:72b:98d9:6b1c with SMTP id
 46e09a7af769-72bfbe4bb97mr7248926a34.21.1742480416930; Thu, 20 Mar 2025
 07:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741617888.git.bertrand.marquis@arm.com> <75ffd7378e75fb1a07584c1b178600bbfb348425.1741617888.git.bertrand.marquis@arm.com>
In-Reply-To: <75ffd7378e75fb1a07584c1b178600bbfb348425.1741617888.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 20 Mar 2025 15:20:05 +0100
X-Gm-Features: AQ5f1JoaEUnTYscBDR0mXJExvTeSBC6JbuT-whztAhD2Onwjh5DaES77WeP-TOE
Message-ID: <CAHUa44FhHz25oHB6bv+NJrf+21N-8HFvMW7JR04NM9JkpKLabg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] xen/arm: ffa: Introduce VM to VM support
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
> Create a CONFIG_FFA_VM_TO_VM parameter to activate FFA communication
> between VMs.
> When activated list VMs in the system with FF-A support in part_info_get.
>
> WARNING: There is no filtering for now and all VMs are listed !!
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
> - Switch ifdef to IS_ENABLED
> - dom was not switched to d as requested by Jan because there is already
>   a variable d pointing to the current domain and it must not be
>   shadowed.
> ---
>  xen/arch/arm/tee/Kconfig        |  11 +++
>  xen/arch/arm/tee/ffa_partinfo.c | 144 +++++++++++++++++++++++++-------
>  xen/arch/arm/tee/ffa_private.h  |  12 +++
>  3 files changed, 137 insertions(+), 30 deletions(-)
>
> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
> index c5b0f88d7522..88a4c4c99154 100644
> --- a/xen/arch/arm/tee/Kconfig
> +++ b/xen/arch/arm/tee/Kconfig
> @@ -28,5 +28,16 @@ config FFA
>
>           [1] https://developer.arm.com/documentation/den0077/latest
>
> +config FFA_VM_TO_VM
> +    bool "Enable FF-A between VMs (UNSUPPORTED)" if UNSUPPORTED
> +    default n
> +    depends on FFA
> +    help
> +      This option enables to use FF-A between VMs.
> +      This is experimental and there is no access control so any
> +      guest can communicate with any other guest.
> +
> +      If unsure, say N.
> +
>  endmenu
>
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index c0510ceb8338..7af1eca2d0c4 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -77,7 +77,23 @@ void ffa_handle_partition_info_get(struct cpu_user_reg=
s *regs)
>      };
>      uint32_t src_size, dst_size;
>      void *dst_buf;
> -    uint32_t ffa_sp_count =3D 0;
> +    uint32_t ffa_vm_count =3D 0, ffa_sp_count =3D 0;
> +

This function is getting quite large and it's hard to follow the
different lock states. How about splitting it into various helper
functions?

> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +    {
> +        struct domain *dom;
> +
> +        /* Count the number of VM with FF-A support */

Why do we need this now? Isn't it enough to count them below when we
fill in dst_buf?

> +        rcu_read_lock(&domlist_read_lock);
> +        for_each_domain( dom )
> +        {
> +            struct ffa_ctx *vm =3D dom->arch.tee;
> +
> +            if (dom !=3D d && vm !=3D NULL && vm->guest_vers !=3D 0)
> +                ffa_vm_count++;
> +        }
> +        rcu_read_unlock(&domlist_read_lock);
> +    }
>
>      /*
>       * If the guest is v1.0, he does not get back the entry size so we m=
ust
> @@ -127,33 +143,38 @@ void ffa_handle_partition_info_get(struct cpu_user_=
regs *regs)
>
>      dst_buf =3D ctx->rx;
>
> -    if ( !ffa_rx )
> +    /* If not supported, we have ffa_sp_count=3D0 */
> +    if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
>      {
> -        ret =3D FFA_RET_DENIED;
> -        goto out_rx_release;
> -    }
> +        if ( !ffa_rx )
> +        {
> +            ret =3D FFA_RET_DENIED;
> +            goto out_rx_release;
> +        }
>
> -    spin_lock(&ffa_rx_buffer_lock);
> +        spin_lock(&ffa_rx_buffer_lock);
>
> -    ret =3D ffa_partition_info_get(uuid, 0, &ffa_sp_count, &src_size);
> +        ret =3D ffa_partition_info_get(uuid, 0, &ffa_sp_count, &src_size=
);
>
> -    if ( ret )
> -        goto out_rx_hyp_unlock;
> +        if ( ret )
> +            goto out_rx_hyp_unlock;
>
> -    /*
> -     * ffa_partition_info_get() succeeded so we now own the RX buffer we
> -     * share with the SPMC. We must give it back using ffa_hyp_rx_releas=
e()
> -     * once we've copied the content.
> -     */
> +        /*
> +         * ffa_partition_info_get() succeeded so we now own the RX buffe=
r we
> +         * share with the SPMC. We must give it back using ffa_hyp_rx_re=
lease()
> +         * once we've copied the content.
> +         */
>
> -    /* we cannot have a size smaller than 1.0 structure */
> -    if ( src_size < sizeof(struct ffa_partition_info_1_0) )
> -    {
> -        ret =3D FFA_RET_NOT_SUPPORTED;
> -        goto out_rx_hyp_release;
> +        /* we cannot have a size smaller than 1.0 structure */
> +        if ( src_size < sizeof(struct ffa_partition_info_1_0) )
> +        {
> +            ret =3D FFA_RET_NOT_SUPPORTED;
> +            goto out_rx_hyp_release;
> +        }
>      }
>
> -    if ( ctx->page_count * FFA_PAGE_SIZE < ffa_sp_count * dst_size )
> +    if ( ctx->page_count * FFA_PAGE_SIZE <
> +         (ffa_sp_count + ffa_vm_count) * dst_size )
>      {
>          ret =3D FFA_RET_NO_MEMORY;
>          goto out_rx_hyp_release;
> @@ -182,25 +203,88 @@ void ffa_handle_partition_info_get(struct cpu_user_=
regs *regs)
>          }
>      }
>
> +    if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> +    {
> +        ffa_hyp_rx_release();
> +        spin_unlock(&ffa_rx_buffer_lock);
> +    }
> +
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && ffa_vm_count )
> +    {
> +        struct domain *dom;
> +        uint32_t curr =3D 0;
> +
> +        /* add the VM informations if any */
> +        rcu_read_lock(&domlist_read_lock);
> +        for_each_domain( dom )
> +        {
> +            struct ffa_ctx *vm =3D dom->arch.tee;
> +
> +            /*
> +             * we do not add the VM calling to the list and only VMs wit=
h
> +             * FF-A support
> +             */
> +            if (dom !=3D d && vm !=3D NULL && vm->guest_vers !=3D 0)
> +            {
> +                /*
> +                 * We do not have UUID info for VMs so use
> +                 * the 1.0 structure so that we set UUIDs to
> +                 * zero using memset
> +                 */
> +                struct ffa_partition_info_1_0 srcvm;
> +
> +                if ( curr =3D=3D ffa_vm_count )
> +                {
> +                    /*
> +                     * The number of domains changed since we counted th=
em, we
> +                     * can add new ones if there is enough space in the
> +                     * destination buffer so check it or go out with an =
error.
> +                     */

Why do we care if the number has changed? If it fits, all is good
anyway and we're also updating ffa_vm_count with curr after the loop.

Cheers,
Jens

> +                    ffa_vm_count++;
> +                    if ( ctx->page_count * FFA_PAGE_SIZE <
> +                         (ffa_sp_count + ffa_vm_count) * dst_size )
> +                    {
> +                        ret =3D FFA_RET_NO_MEMORY;
> +                        rcu_read_unlock(&domlist_read_lock);
> +                        goto out_rx_release;
> +                    }
> +                }
> +
> +                srcvm.id =3D ffa_get_vm_id(dom);
> +                srcvm.execution_context =3D dom->max_vcpus;
> +                srcvm.partition_properties =3D FFA_PART_VM_PROP;
> +                if ( is_64bit_domain(dom) )
> +                    srcvm.partition_properties |=3D FFA_PART_PROP_AARCH6=
4_STATE;
> +
> +                memcpy(dst_buf, &srcvm, MIN(sizeof(srcvm), dst_size));
> +
> +                if ( dst_size > sizeof(srcvm) )
> +                    memset(dst_buf + sizeof(srcvm), 0,
> +                           dst_size - sizeof(srcvm));
> +
> +                dst_buf +=3D dst_size;
> +                curr++;
> +            }
> +        }
> +        rcu_read_unlock(&domlist_read_lock);
> +
> +        /* the number of domains could have reduce since the initial cou=
nt */
> +        ffa_vm_count =3D curr;
> +    }
> +
> +    goto out;
> +
>  out_rx_hyp_release:
>      ffa_hyp_rx_release();
>  out_rx_hyp_unlock:
>      spin_unlock(&ffa_rx_buffer_lock);
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
> -        ffa_rx_release(d);
> +    ffa_rx_release(d);
>  out:
>      if ( ret )
>          ffa_set_regs_error(regs, ret);
>      else
> -        ffa_set_regs_success(regs, ffa_sp_count, dst_size);
> +        ffa_set_regs_success(regs, ffa_sp_count + ffa_vm_count, dst_size=
);
>  }
>
>  static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index c4cd65538908..bd6877d8c632 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -187,6 +187,18 @@
>   */
>  #define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
>
> +/*
> + * Partition properties we give for a normal world VM:
> + * - can send direct message but not receive them
> + * - can handle indirect messages
> + * - can receive notifications
> + * 32/64 bit flag is set depending on the VM
> + */
> +#define FFA_PART_VM_PROP    (FFA_PART_PROP_DIRECT_REQ_SEND | \
> +                             FFA_PART_PROP_INDIRECT_MSGS | \
> +                             FFA_PART_PROP_RECV_NOTIF | \
> +                             FFA_PART_PROP_IS_PE_ID)
> +
>  /* Flags used in calls to FFA_NOTIFICATION_GET interface  */
>  #define FFA_NOTIF_FLAG_BITMAP_SP        BIT(0, U)
>  #define FFA_NOTIF_FLAG_BITMAP_VM        BIT(1, U)
> --
> 2.47.1
>

