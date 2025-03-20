Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5833AA6ABAD
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 18:07:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923007.1326760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvJLq-0004Gs-25; Thu, 20 Mar 2025 17:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923007.1326760; Thu, 20 Mar 2025 17:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvJLp-0004Eh-UC; Thu, 20 Mar 2025 17:06:37 +0000
Received: by outflank-mailman (input) for mailman id 923007;
 Thu, 20 Mar 2025 17:06:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m8Tk=WH=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1tvJLo-0004Eb-6E
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 17:06:36 +0000
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [2607:f8b0:4864:20::c2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad21c7d9-05ad-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 18:06:34 +0100 (CET)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-601a4e037a5so458431eaf.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 10:06:34 -0700 (PDT)
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
X-Inumbo-ID: ad21c7d9-05ad-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742490393; x=1743095193; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bQL6Zz3D9KDT3Qy2M9uO4aY5bskm/L9ymbQKXCeOTI=;
        b=vnfNAoezFaDK7wnPGMSnvRwTzzzwAL+fa6h69Gt1amcUwN9MMgpnJf+P0pxF4MaGJO
         aywyX9Qh5DVND/eYA6vaxeIM4Ni1aKcOksxq/9qA6kLXFdi8wnoiCiw6xOqILngEtHkr
         oyaQZwFUHMucJprfrmw7jB1KUonmOtiKlK9t2bYpXsOIK+D0BwD08y3iIX58gLPCBXhC
         Z4Y1kQ4YbG6HnjCChDgW9Wz7pIJyhgaildPbQ1aezL858yR04VuE2kCTA4PhAyDsEnUn
         qC2pNK3zasq3d/p8L/K523GbNMA0dW/vL3WhJYKX8UGuIOMH4B0LQ+pAtF57hr/VaZNN
         jJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742490393; x=1743095193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bQL6Zz3D9KDT3Qy2M9uO4aY5bskm/L9ymbQKXCeOTI=;
        b=PtGCXdEV76kfrnGGgY9AIRtNgIuPZlbIvnrdZL5pqUDlxz+4+tpCNi5TsuIkJhR4G+
         7EqnZWP5XaW9Oj9awH+zkWfHwCToTxfkqZl8+XoKs+sFn4xABgO6k/FIaU6cB+pAX47v
         /gXc2a6hIow8dVqUljessNncL1+cWgo39tk8ofWogrQFnD4EoXLHsFfjQ5JpV7edsYAp
         bR4i41BQuoA2tu/4Lr89cGTGniuPPN1QAAlReNLR+j91onCX8rzpHxvaGLiFDQ2RxPUP
         RQHvfoQagwCnGZQVsHv9F2tyt8emiujnnO/cGVhOhFTRHRrKLb88AAGKkq66WU6+F+TY
         6B/Q==
X-Gm-Message-State: AOJu0Yy5p4Jl2szeXDGnc6EjKxhAjNbOIYTBZz6M3NSyMyeSeMnZMi7d
	gPiU+LitXWAJ/201Eb+NvVxPKCz6Y5hc7Q9RDlEVz7ljT9XY6MLztDm64oW89atIzvNM+ZmSB4a
	VXkBzbFkXU6IY2CrYr+A+lIJB/LqkPc6px++WNg==
X-Gm-Gg: ASbGnctivP8cJf5Rb+K1v82ZLxuXDEsR0uJSv/+CBnp1mVKp7fAZrnqeGYE6uo7YzMu
	CylAqsE5hRA7MPeMAvLBKzA2GSl3Ry0ErxBjoJaUQmmadMqj484BjyjdGEDwt/0FwC1jW4xjfdQ
	6l2DYEGEBMsOm18poTOWNgp9/8YYc=
X-Google-Smtp-Source: AGHT+IHHSlUsAxcuSGWLr2uUHMzZSFq7zjo1NIdUhNcq2ux7950YpyjM0wghyH+CekqJU17xcC3oBgtJ50toNsLd5E4=
X-Received: by 2002:a05:6870:2c89:b0:29e:29ac:5ade with SMTP id
 586e51a60fabf-2c78054ab05mr231936fac.35.1742490393146; Thu, 20 Mar 2025
 10:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741617888.git.bertrand.marquis@arm.com>
 <75ffd7378e75fb1a07584c1b178600bbfb348425.1741617888.git.bertrand.marquis@arm.com>
 <CAHUa44FhHz25oHB6bv+NJrf+21N-8HFvMW7JR04NM9JkpKLabg@mail.gmail.com> <794A37F9-9F8A-45D3-9D27-D2C536BADC4F@arm.com>
In-Reply-To: <794A37F9-9F8A-45D3-9D27-D2C536BADC4F@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 20 Mar 2025 18:06:21 +0100
X-Gm-Features: AQ5f1JoZVIRXuiEK8zla1EH_FmSvfVTLv5Io2VZJDHLzAE387SCaKXYa_6gi5fg
Message-ID: <CAHUa44E6Sw5zmXtik8bCgD_WFQkcDsfKa7vDV2bXBRHp8c70_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] xen/arm: ffa: Introduce VM to VM support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 20, 2025 at 4:47=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> Thanks a lot for the review.
>
> > On 20 Mar 2025, at 15:20, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi Bertrand,
> >
> > On Mon, Mar 10, 2025 at 3:51=E2=80=AFPM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> Create a CONFIG_FFA_VM_TO_VM parameter to activate FFA communication
> >> between VMs.
> >> When activated list VMs in the system with FF-A support in part_info_g=
et.
> >>
> >> WARNING: There is no filtering for now and all VMs are listed !!
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> Changes in v2:
> >> - Switch ifdef to IS_ENABLED
> >> - dom was not switched to d as requested by Jan because there is alrea=
dy
> >>  a variable d pointing to the current domain and it must not be
> >>  shadowed.
> >> ---
> >> xen/arch/arm/tee/Kconfig        |  11 +++
> >> xen/arch/arm/tee/ffa_partinfo.c | 144 +++++++++++++++++++++++++-------
> >> xen/arch/arm/tee/ffa_private.h  |  12 +++
> >> 3 files changed, 137 insertions(+), 30 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
> >> index c5b0f88d7522..88a4c4c99154 100644
> >> --- a/xen/arch/arm/tee/Kconfig
> >> +++ b/xen/arch/arm/tee/Kconfig
> >> @@ -28,5 +28,16 @@ config FFA
> >>
> >>          [1] https://developer.arm.com/documentation/den0077/latest
> >>
> >> +config FFA_VM_TO_VM
> >> +    bool "Enable FF-A between VMs (UNSUPPORTED)" if UNSUPPORTED
> >> +    default n
> >> +    depends on FFA
> >> +    help
> >> +      This option enables to use FF-A between VMs.
> >> +      This is experimental and there is no access control so any
> >> +      guest can communicate with any other guest.
> >> +
> >> +      If unsure, say N.
> >> +
> >> endmenu
> >>
> >> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_pa=
rtinfo.c
> >> index c0510ceb8338..7af1eca2d0c4 100644
> >> --- a/xen/arch/arm/tee/ffa_partinfo.c
> >> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> >> @@ -77,7 +77,23 @@ void ffa_handle_partition_info_get(struct cpu_user_=
regs *regs)
> >>     };
> >>     uint32_t src_size, dst_size;
> >>     void *dst_buf;
> >> -    uint32_t ffa_sp_count =3D 0;
> >> +    uint32_t ffa_vm_count =3D 0, ffa_sp_count =3D 0;
> >> +
> >
> > This function is getting quite large and it's hard to follow the
> > different lock states. How about splitting it into various helper
> > functions?
>
> Yes I agree.
> I will try to find a good way to split this in smaller chunks.
>
> >
> >> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> >> +    {
> >> +        struct domain *dom;
> >> +
> >> +        /* Count the number of VM with FF-A support */
> >
> > Why do we need this now? Isn't it enough to count them below when we
> > fill in dst_buf?
>
> We need it in 3 places in the code after:
> - to return the number of endpoint in case the flag is set (see final ret=
urn)
> - to check that there is enough space in the RX buffer
> - to prevent going through the list of domains if none is to be listed an=
yway

Got it, thanks. The first point is important, the others are
essentially optimizations.

>
> >
> >> +        rcu_read_lock(&domlist_read_lock);
> >> +        for_each_domain( dom )
> >> +        {
> >> +            struct ffa_ctx *vm =3D dom->arch.tee;
> >> +
> >> +            if (dom !=3D d && vm !=3D NULL && vm->guest_vers !=3D 0)
> >> +                ffa_vm_count++;
> >> +        }
> >> +        rcu_read_unlock(&domlist_read_lock);
> >> +    }
> >>
> >>     /*
> >>      * If the guest is v1.0, he does not get back the entry size so we=
 must
> >> @@ -127,33 +143,38 @@ void ffa_handle_partition_info_get(struct cpu_us=
er_regs *regs)
> >>
> >>     dst_buf =3D ctx->rx;
> >>
> >> -    if ( !ffa_rx )
> >> +    /* If not supported, we have ffa_sp_count=3D0 */
> >> +    if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> >>     {
> >> -        ret =3D FFA_RET_DENIED;
> >> -        goto out_rx_release;
> >> -    }
> >> +        if ( !ffa_rx )
> >> +        {
> >> +            ret =3D FFA_RET_DENIED;
> >> +            goto out_rx_release;
> >> +        }
> >>
> >> -    spin_lock(&ffa_rx_buffer_lock);
> >> +        spin_lock(&ffa_rx_buffer_lock);
> >>
> >> -    ret =3D ffa_partition_info_get(uuid, 0, &ffa_sp_count, &src_size)=
;
> >> +        ret =3D ffa_partition_info_get(uuid, 0, &ffa_sp_count, &src_s=
ize);
> >>
> >> -    if ( ret )
> >> -        goto out_rx_hyp_unlock;
> >> +        if ( ret )
> >> +            goto out_rx_hyp_unlock;
> >>
> >> -    /*
> >> -     * ffa_partition_info_get() succeeded so we now own the RX buffer=
 we
> >> -     * share with the SPMC. We must give it back using ffa_hyp_rx_rel=
ease()
> >> -     * once we've copied the content.
> >> -     */
> >> +        /*
> >> +         * ffa_partition_info_get() succeeded so we now own the RX bu=
ffer we
> >> +         * share with the SPMC. We must give it back using ffa_hyp_rx=
_release()
> >> +         * once we've copied the content.
> >> +         */
> >>
> >> -    /* we cannot have a size smaller than 1.0 structure */
> >> -    if ( src_size < sizeof(struct ffa_partition_info_1_0) )
> >> -    {
> >> -        ret =3D FFA_RET_NOT_SUPPORTED;
> >> -        goto out_rx_hyp_release;
> >> +        /* we cannot have a size smaller than 1.0 structure */
> >> +        if ( src_size < sizeof(struct ffa_partition_info_1_0) )
> >> +        {
> >> +            ret =3D FFA_RET_NOT_SUPPORTED;
> >> +            goto out_rx_hyp_release;
> >> +        }
> >>     }
> >>
> >> -    if ( ctx->page_count * FFA_PAGE_SIZE < ffa_sp_count * dst_size )
> >> +    if ( ctx->page_count * FFA_PAGE_SIZE <
> >> +         (ffa_sp_count + ffa_vm_count) * dst_size )
> >>     {
> >>         ret =3D FFA_RET_NO_MEMORY;
> >>         goto out_rx_hyp_release;
> >> @@ -182,25 +203,88 @@ void ffa_handle_partition_info_get(struct cpu_us=
er_regs *regs)
> >>         }
> >>     }
> >>
> >> +    if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> >> +    {
> >> +        ffa_hyp_rx_release();
> >> +        spin_unlock(&ffa_rx_buffer_lock);
> >> +    }
> >> +
> >> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && ffa_vm_count )
> >> +    {
> >> +        struct domain *dom;
> >> +        uint32_t curr =3D 0;
> >> +
> >> +        /* add the VM informations if any */
> >> +        rcu_read_lock(&domlist_read_lock);
> >> +        for_each_domain( dom )
> >> +        {
> >> +            struct ffa_ctx *vm =3D dom->arch.tee;
> >> +
> >> +            /*
> >> +             * we do not add the VM calling to the list and only VMs =
with
> >> +             * FF-A support
> >> +             */
> >> +            if (dom !=3D d && vm !=3D NULL && vm->guest_vers !=3D 0)
> >> +            {
> >> +                /*
> >> +                 * We do not have UUID info for VMs so use
> >> +                 * the 1.0 structure so that we set UUIDs to
> >> +                 * zero using memset
> >> +                 */
> >> +                struct ffa_partition_info_1_0 srcvm;
> >> +
> >> +                if ( curr =3D=3D ffa_vm_count )
> >> +                {
> >> +                    /*
> >> +                     * The number of domains changed since we counted=
 them, we
> >> +                     * can add new ones if there is enough space in t=
he
> >> +                     * destination buffer so check it or go out with =
an error.
> >> +                     */
> >
> > Why do we care if the number has changed? If it fits, all is good
> > anyway and we're also updating ffa_vm_count with curr after the loop.
>
> Well this is exactly the point here, we check if we have enough space to
> return the data with the new domains and if not we return an error.
>
> The point here is to make sure that if there are more domains than when
> we counted first we check that we have enough size and the update at the
> end is to handle the case where we have actually less domains than when
> we counted first.
>
> If the number has changed we only care because we need to make sure
> we have enough space and because we need to return the right number
> to the caller.
>
> Please tell me how you would like me to change this because I do not
> understand what I should modify here.

I was thinking something like:
        for_each_domain( dom )
        {
            struct ffa_ctx *vm =3D dom->arch.tee;

            if (dom !=3D d && vm !=3D NULL && vm->guest_vers !=3D 0)
            {
                ...
                ffa_vm_count++;
                if ( ctx->page_count * FFA_PAGE_SIZE <
                     (ffa_sp_count + ffa_vm_count) * dst_size )
                    ... error out

                ... copy data
                dst_buf +=3D dst_size;
            }
        }

Cheers,
Jens

>
> Cheers
> Bertrand
>
> >
> > Cheers,
> > Jens
> >
> >> +                    ffa_vm_count++;
> >> +                    if ( ctx->page_count * FFA_PAGE_SIZE <
> >> +                         (ffa_sp_count + ffa_vm_count) * dst_size )
> >> +                    {
> >> +                        ret =3D FFA_RET_NO_MEMORY;
> >> +                        rcu_read_unlock(&domlist_read_lock);
> >> +                        goto out_rx_release;
> >> +                    }
> >> +                }
> >> +
> >> +                srcvm.id =3D ffa_get_vm_id(dom);
> >> +                srcvm.execution_context =3D dom->max_vcpus;
> >> +                srcvm.partition_properties =3D FFA_PART_VM_PROP;
> >> +                if ( is_64bit_domain(dom) )
> >> +                    srcvm.partition_properties |=3D FFA_PART_PROP_AAR=
CH64_STATE;
> >> +
> >> +                memcpy(dst_buf, &srcvm, MIN(sizeof(srcvm), dst_size))=
;
> >> +
> >> +                if ( dst_size > sizeof(srcvm) )
> >> +                    memset(dst_buf + sizeof(srcvm), 0,
> >> +                           dst_size - sizeof(srcvm));
> >> +
> >> +                dst_buf +=3D dst_size;
> >> +                curr++;
> >> +            }
> >> +        }
> >> +        rcu_read_unlock(&domlist_read_lock);
> >> +
> >> +        /* the number of domains could have reduce since the initial =
count */
> >> +        ffa_vm_count =3D curr;
> >> +    }
> >> +
> >> +    goto out;
> >> +
> >> out_rx_hyp_release:
> >>     ffa_hyp_rx_release();
> >> out_rx_hyp_unlock:
> >>     spin_unlock(&ffa_rx_buffer_lock);
> >> out_rx_release:
> >> -    /*
> >> -     * The calling VM RX buffer only contains data to be used by the =
VM if the
> >> -     * call was successful, in which case the VM has to release the b=
uffer
> >> -     * once it has used the data.
> >> -     * If something went wrong during the call, we have to release th=
e RX
> >> -     * buffer back to the SPMC as the VM will not do it.
> >> -     */
> >> -    if ( ret !=3D FFA_RET_OK )
> >> -        ffa_rx_release(d);
> >> +    ffa_rx_release(d);
> >> out:
> >>     if ( ret )
> >>         ffa_set_regs_error(regs, ret);
> >>     else
> >> -        ffa_set_regs_success(regs, ffa_sp_count, dst_size);
> >> +        ffa_set_regs_success(regs, ffa_sp_count + ffa_vm_count, dst_s=
ize);
> >> }
> >>
> >> static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> >> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_pri=
vate.h
> >> index c4cd65538908..bd6877d8c632 100644
> >> --- a/xen/arch/arm/tee/ffa_private.h
> >> +++ b/xen/arch/arm/tee/ffa_private.h
> >> @@ -187,6 +187,18 @@
> >>  */
> >> #define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
> >>
> >> +/*
> >> + * Partition properties we give for a normal world VM:
> >> + * - can send direct message but not receive them
> >> + * - can handle indirect messages
> >> + * - can receive notifications
> >> + * 32/64 bit flag is set depending on the VM
> >> + */
> >> +#define FFA_PART_VM_PROP    (FFA_PART_PROP_DIRECT_REQ_SEND | \
> >> +                             FFA_PART_PROP_INDIRECT_MSGS | \
> >> +                             FFA_PART_PROP_RECV_NOTIF | \
> >> +                             FFA_PART_PROP_IS_PE_ID)
> >> +
> >> /* Flags used in calls to FFA_NOTIFICATION_GET interface  */
> >> #define FFA_NOTIF_FLAG_BITMAP_SP        BIT(0, U)
> >> #define FFA_NOTIF_FLAG_BITMAP_VM        BIT(1, U)
> >> --
> >> 2.47.1
>
>

