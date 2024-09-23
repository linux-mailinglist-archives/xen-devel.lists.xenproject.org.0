Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBE097EB83
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 14:28:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802036.1212140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssiAP-00025g-G3; Mon, 23 Sep 2024 12:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802036.1212140; Mon, 23 Sep 2024 12:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssiAP-00023L-D5; Mon, 23 Sep 2024 12:27:49 +0000
Received: by outflank-mailman (input) for mailman id 802036;
 Mon, 23 Sep 2024 12:27:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+7mE=QV=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1ssiAN-00023F-B1
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 12:27:47 +0000
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [2607:f8b0:4864:20::c2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c3e4b3d-79a7-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 14:27:45 +0200 (CEST)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-5e57b7cac4fso2474950eaf.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 05:27:45 -0700 (PDT)
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
X-Inumbo-ID: 3c3e4b3d-79a7-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727094464; x=1727699264; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IUyDEheI4mqJqUFk2F/tYRg3tvEjMumQnHx7SUMlt0=;
        b=Xr7hlCT/r9GeCm/xYlx8dti2PhVIZZdDCRkJrCU16u3VZKGCb6LkRWCf4q8qDxwsiv
         9A/CmkHuZaRIHxStCeOAhFPRlr3WCWD15JxMAj1YeE5N6Jyw1JJ9apq9YWb/5B4+RpNP
         1DzftVOQxi/59pnTFpYhQHxDPbBEVtpfNdboliLrG8cXk9Wr1fbTG38y2Wjq8AUZ8vuu
         yrsNDYTUY6Bwf57dbPJz0XUebGQN7WH6m4h6A6bHUW8hSIA4BH+ebxB2WsB/G9f6l4pz
         5un4HvzQQ4uAcgEhTagQ1Zk7rg232oIbCQqxAZ8WgI7IFvcGLznqLgJGVEdABa3Mg+Uj
         xKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727094464; x=1727699264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IUyDEheI4mqJqUFk2F/tYRg3tvEjMumQnHx7SUMlt0=;
        b=HC2v+bF86WtchZP65V9IkC8zHRPjJCGuLMVctv1vQrJQL8GqkEc5BGM52l8frL6hqF
         lrrgqpBBrzo9ZbE0A65QFk7e5G34dgzf8pqDHrZsPFKtR20DRjQH3EO48DeOSNI2aimN
         on3ld5rgXXgzYGjvTytX+c+AetwItLa2Een29gFQkj7+JqBohXxzxWyvDXJwHEWLwkdk
         FUj/bBlGGn2qy8t9Y2UZGhwH2ExwqyXyZ1x784zDVdwxJGNooCJ3RXknqP6t7q0byfUm
         yXS73c/I2bp7XFu0vTlYNdiwrpwv9yHhDLvqL3cnVWiOPq554uYepI4pjeMzi4w/x2ww
         u+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUaopAFFYBgE4ePc3HLShrSp9sW5vAmG8vsLvVyrXLTuByuJDSUAAr1la00bH/gdysyzS8IRKyB9ig=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yytk28Y9vmuCSA1kutzo54VFhDDA4tExvqYWEQiiXayvoPotzTK
	Hvzb9TNSNW7K0PBGUJK2rebNJ34iGyTPET12p6beiWFgAZufW6HrpbcUN7jv/MTT+UXqRb0KhJB
	0Nk398es80OrROKVPruaiSUN1eVwMthixArcmCQ==
X-Google-Smtp-Source: AGHT+IEpd3HO1aajlvogiGii8NOxP/x9iuTzU5YIJKNg2YZ2AlPYs9698WhuANh/Xv5Qn5ZXdQoKfFKhbuUafCbuAN8=
X-Received: by 2002:a05:6871:3a0c:b0:278:14b6:a8f7 with SMTP id
 586e51a60fabf-2803a7b83eemr7298125fac.42.1727094464136; Mon, 23 Sep 2024
 05:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1726676338.git.bertrand.marquis@arm.com>
 <bb7e497fa2b03e0176b5013a05f342f3ea5ea296.1726676338.git.bertrand.marquis@arm.com>
 <0a537da2-4f2b-49a2-9e6b-6acc1a9aaabc@xen.org>
In-Reply-To: <0a537da2-4f2b-49a2-9e6b-6acc1a9aaabc@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 23 Sep 2024 14:27:31 +0200
Message-ID: <CAHUa44EC-0YNnWmD1-+sWDHqY=WsKVxV0N2N3a-Lc=AaTkMGUg@mail.gmail.com>
Subject: Re: [PATCH 04/10] xen/arm: ffa: Fine granular call support
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Sep 22, 2024 at 3:04=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Bertrand,
>
> On 19/09/2024 14:19, Bertrand Marquis wrote:
> > Create a bitmap to store which feature is supported or not by the
> > firmware and use it to filter which calls done to the firmware.
> >
> > With this enabled. allow FF-A support to be activated for guest even if
>
> Typo: s/./,/ I think.
>
> > the firmware does not support it.
>
> Can you explain why you want to do this?
>
> The TEE mediator was designed to interpose with the HW. Without the HW
> it doesn't entirely make sense to try to use it.
>
> It would also not work if the host system is using OP-TEE and expose to
> some VM FF-A. So it feels that the mediator may not be the right place
> to handle this case.

That's a good point, but all the FF-A handling should be in the same
module since there's bound to be code and state to share. The problem
is that FF-A tries to be a TEE mediator while it's about to become
more than that. We can work around it by probing the OP-TEE mediator
first, but it's adding another exception or special case. Would it
make sense to move the FF-A mediator out of the TEE mediator framework
and establish it separately?

Cheers,
Jens

>
> >
> > As a consequence, if the firmware is not there or not supported, we
> > return an empty list of partitions to VMs requesting it through
> > PARTINFO_GET ABI.
> >
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > ---
> >   xen/arch/arm/tee/ffa.c          | 31 ++++++++++++++++++++-----------
> >   xen/arch/arm/tee/ffa_notif.c    |  7 +++++++
> >   xen/arch/arm/tee/ffa_partinfo.c | 31 +++++++++++++++++++++++++++++--
> >   xen/arch/arm/tee/ffa_private.h  | 28 ++++++++++++++++++++++++++++
> >   xen/arch/arm/tee/ffa_rxtx.c     | 13 ++++++-------
> >   xen/arch/arm/tee/ffa_shm.c      | 12 ++++++++++++
> >   6 files changed, 102 insertions(+), 20 deletions(-)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index 1f602f25d097..53960b146220 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -72,7 +72,10 @@
> >   #include "ffa_private.h"
> >
> >   /* Negotiated FF-A version to use with the SPMC, 0 if not there or su=
pported */
> > -static uint32_t __ro_after_init ffa_fw_version;
> > +uint32_t __ro_after_init ffa_fw_version;
> > +
> > +/* Features supported by the SPMC or secure world when present */
> > +DECLARE_BITMAP(ffa_fw_feat_supported, FEAT_FUNC_BITMAP_SIZE);
> >
> >   /* List of ABI we use from the firmware */
> >   static const uint32_t ffa_fw_feat_needed[] =3D {
> > @@ -174,6 +177,13 @@ static void handle_msg_send_direct_req(struct cpu_=
user_regs *regs, uint32_t fid)
> >       else
> >           mask =3D GENMASK_ULL(31, 0);
> >
> > +    if ( !ffa_fw_supports_fid(fid) )
> > +    {
> > +        resp.a0 =3D FFA_ERROR;
> > +        resp.a2 =3D FFA_RET_NOT_SUPPORTED;
> > +        goto out;
> > +    }
> > +
> >       src_dst =3D get_user_reg(regs, 1);
> >       if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
> >       {
> > @@ -387,8 +397,6 @@ static int ffa_domain_init(struct domain *d)
> >       struct ffa_ctx *ctx;
> >       int ret;
> >
> > -    if ( !ffa_fw_version )
> > -        return -ENODEV;
>  >        /*>         * We can't use that last possible domain ID or
> ffa_get_vm_id() would
> >         * cause an overflow.
> > @@ -523,6 +531,9 @@ static bool ffa_probe(void)
> >       printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
> >              FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
> >
> > +    INIT_LIST_HEAD(&ffa_teardown_head);
> > +    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL,=
 0);
> > +
> >       /*
> >        * psci_init_smccc() updates this value with what's reported by E=
L-3
> >        * or secure world.
> > @@ -568,12 +579,12 @@ static bool ffa_probe(void)
> >
> >       for ( int i =3D 0; i < ARRAY_SIZE(ffa_fw_feat_needed); i++ )
> >       {
> > -        if ( !ffa_feature_supported(ffa_fw_feat_needed[i]) )
> > -        {
> > +        if ( ffa_feature_supported(ffa_fw_feat_needed[i]) )
> > +            set_bit(FEAT_FUNC_BITNUM(ffa_fw_feat_needed[i]),
> > +                    ffa_fw_feat_supported);
> > +        else
> >               printk(XENLOG_INFO "ARM FF-A Firmware does not support 0x=
%08x\n",
> > -                   ffa_fw_feat_needed[i]);
> > -            goto err_no_fw;
> > -        }
> > +                       ffa_fw_feat_needed[i]);
> >       }
> >
> >       if ( !ffa_rxtx_init() )
> > @@ -586,8 +597,6 @@ static bool ffa_probe(void)
> >           goto err_rxtx_destroy;
> >
> >       ffa_notif_init();
> > -    INIT_LIST_HEAD(&ffa_teardown_head);
> > -    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL,=
 0);
> >
> >       return true;
> >
> > @@ -597,7 +606,7 @@ err_no_fw:
> >       ffa_fw_version =3D 0;
> >       printk(XENLOG_INFO "ARM FF-A No firmware support\n");
> >
> > -    return false;
> > +    return true;
>
> So effectively now ffa_probe() will always return true. If we end up to
> probe FF-A before OP-Tee, then we would always say "FF-A"  is the TEE
> mediator.
>
> >   }
> >
> >   static const struct tee_mediator_ops ffa_ops =3D
> > diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.=
c
> > index 541e61d2f606..4b3e46318f4b 100644
> > --- a/xen/arch/arm/tee/ffa_notif.c
> > +++ b/xen/arch/arm/tee/ffa_notif.c
> > @@ -377,6 +377,13 @@ void ffa_notif_init(void)
> >       unsigned int irq;
> >       int ret;
> >
> > +    /* Only enable fw notification if all ABIs we need are supported *=
/
> > +    if ( !(ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
> > +           ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_DESTROY) &&
> > +           ffa_fw_supports_fid(FFA_NOTIFICATION_GET) &&
> > +           ffa_fw_supports_fid(FFA_NOTIFICATION_INFO_GET_64)) )
> > +        return;
> > +
> >       arm_smccc_1_2_smc(&arg, &resp);
> >       if ( resp.a0 !=3D FFA_SUCCESS_32 )
> >           return;
> > diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_par=
tinfo.c
> > index 93a03c6bc672..a42bd92ab8cf 100644
> > --- a/xen/arch/arm/tee/ffa_partinfo.c
> > +++ b/xen/arch/arm/tee/ffa_partinfo.c
> > @@ -77,7 +77,15 @@ int32_t ffa_handle_partition_info_get(uint32_t w1, u=
int32_t w2, uint32_t w3,
> >        */
> >       if ( w5 =3D=3D FFA_PARTITION_INFO_GET_COUNT_FLAG &&
> >            ctx->guest_vers =3D=3D FFA_VERSION_1_1 )
> > -        return ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_s=
ize);
> > +    {
> > +        if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> > +            return ffa_partition_info_get(w1, w2, w3, w4, w5, count, f=
pi_size);
> > +        else
> > +        {
> > +            *count =3D 0;
> > +            return FFA_RET_OK;
> > +        }
> > +    }
> >       if ( w5 )
> >           return FFA_RET_INVALID_PARAMETERS;
> >
> > @@ -87,6 +95,18 @@ int32_t ffa_handle_partition_info_get(uint32_t w1, u=
int32_t w2, uint32_t w3,
> >       if ( !spin_trylock(&ctx->rx_lock) )
> >           return FFA_RET_BUSY;
> >
> > +    if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> > +    {
> > +        if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 )
> > +            *fpi_size =3D sizeof(struct ffa_partition_info_1_0);
> > +        else
> > +            *fpi_size =3D sizeof(struct ffa_partition_info_1_1);
> > +
> > +        *count =3D 0;
> > +        ret =3D FFA_RET_OK;
> > +        goto out;
> > +    }
> > +
> >       if ( !ctx->page_count || !ctx->rx_is_free )
> >           goto out;
> >       spin_lock(&ffa_rx_buffer_lock);
> > @@ -250,6 +270,11 @@ bool ffa_partinfo_init(void)
> >       uint32_t count;
> >       int e;
> >
> > +    if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) ||
> > +         !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32) ||
> > +         !ffa_rx || !ffa_tx )
> > +        return false;
> > +
> >       e =3D ffa_partition_info_get(0, 0, 0, 0, 0, &count, &fpi_size);
> >       if ( e )
> >       {
> > @@ -267,7 +292,6 @@ bool ffa_partinfo_init(void)
> >
> >   out:
> >       ffa_rx_release();
>  > -
>
> Spurious change?
>
> >       return ret;
> >   }
> >
> > @@ -313,6 +337,9 @@ int ffa_partinfo_domain_init(struct domain *d)
> >       unsigned int n;
> >       int32_t res;
> >
> > +    if ( !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32) )
> > +        return 0;
> > +
> >       ctx->vm_destroy_bitmap =3D xzalloc_array(unsigned long, count);
> >       if ( !ctx->vm_destroy_bitmap )
> >           return -ENOMEM;
> > diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_priv=
ate.h
> > index 7c6b06f686fc..d4dc9c8cd67b 100644
> > --- a/xen/arch/arm/tee/ffa_private.h
> > +++ b/xen/arch/arm/tee/ffa_private.h
> > @@ -14,6 +14,7 @@
> >   #include <xen/spinlock.h>
> >   #include <xen/sched.h>
> >   #include <xen/time.h>
> > +#include <xen/bitmap.h>
> >
> >   /* Error codes */
> >   #define FFA_RET_OK                      0
> > @@ -238,6 +239,23 @@
> >   #define FFA_NOTIFICATION_INFO_GET_32    0x84000083U
> >   #define FFA_NOTIFICATION_INFO_GET_64    0xC4000083U
> >
> > +/**
> > + * Encoding of features supported or not by the fw in a bitmap:
> > + * - Function IDs are going from 0x60 to 0xFF
> > + * - A function can be supported in 32 and/or 64bit
> > + * The bitmap has one bit for each function in 32 and 64 bit.
> > + */
> > +#define FFA_FUNC_MIN           FFA_ERROR
> > +#define FFA_FUNC_MAX           FFA_NOTIFICATION_INFO_GET_64
>
> These two defines confused me because FAA_ERROR is 0x84000060U and
> FFA_NOTIFICATION_INFO_GET_64 is 0xC4000083U. I think it would be better
> if we define them using FFA_FUNC_ID.
>
> We also probably want to have a compiler time check that FFA_FUNC_MIN is
> < FFA_FUNC_MAX.
>
> > +#define FFA_FUNC_ID(id)        ((id) & ARM_SMCCC_FUNC_MASK)
> > +#define FFA_FUNC_CONV(id)      (((id) >> ARM_SMCCC_CONV_SHIFT) & BIT(0=
,U))
> > +
> > +#define FEAT_FUNC_BITMAP_SIZE   (2 * (FFA_FUNC_ID(FFA_FUNC_MAX) - \
> > +                                    FFA_FUNC_ID(FFA_FUNC_MIN) + 1))
> > +#define FEAT_FUNC_BITNUM(id)    ((FFA_FUNC_ID(id) - \
> > +                                    FFA_FUNC_ID(FFA_FUNC_MIN)) << 1 | =
\
> > +                                    FFA_FUNC_CONV(id))
>
> The code seem to make two assumptions:
>    1. id is a constant
>    2. id is always valid
>
> I think it would be good to have a BUILD_BUG_ON(). This should avoid the
> two assumptions.
>
> > +
> >   struct ffa_ctx_notif {
> >       bool enabled;
> >
> > @@ -286,6 +304,8 @@ extern void *ffa_rx;
> >   extern void *ffa_tx;
> >   extern spinlock_t ffa_rx_buffer_lock;
> >   extern spinlock_t ffa_tx_buffer_lock;
> > +extern uint32_t __ro_after_init ffa_fw_version;
> > +extern DECLARE_BITMAP(ffa_fw_feat_supported, FEAT_FUNC_BITMAP_SIZE);
> >
> >   bool ffa_shm_domain_destroy(struct domain *d);
> >   void ffa_handle_mem_share(struct cpu_user_regs *regs);
> > @@ -398,4 +418,12 @@ static inline int32_t ffa_rx_release(void)
> >       return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> >   }
> >
> > +static inline bool ffa_fw_supports_fid(uint32_t fid)
> > +{
> > +    if ( ffa_fw_version =3D=3D 0 )
> > +        return false;
>
> You could avoid this check if you ensure that ...
>
>  > +    else> +        return test_bit(FEAT_FUNC_BITNUM(fid),
> ffa_fw_feat_supported);
>
> .. the bitmap is always zeroed if ffa_fw_version is 0. You also want to
> check that the fid is valid (could be done at build time if fid is
> always a constant).
>
> > +}
> > +
> >   #endif /*__FFA_PRIVATE_H__*/
> > diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
> > index 661764052e67..cb54c76911fd 100644
> > --- a/xen/arch/arm/tee/ffa_rxtx.c
> > +++ b/xen/arch/arm/tee/ffa_rxtx.c
> > @@ -193,24 +193,23 @@ bool ffa_rxtx_init(void)
> >   {
> >       int e;
> >
> > +    /* Firmware not there or not supporting */
> > +    if ( !ffa_fw_supports_fid(FFA_RXTX_MAP_64) )
> > +        return false;
> > +
> >       ffa_rx =3D alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE=
_COUNT), 0);
> >       if ( !ffa_rx )
> >           return false;
> >
> >       ffa_tx =3D alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE=
_COUNT), 0);
> >       if ( !ffa_tx )
> > -        goto err;
> > +        return false;
> >
> >       e =3D ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), FFA_RXTX_PAGE_COUN=
T);
> >       if ( e )
> >       {
> >           printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", e);
> > -        goto err;
> > +        return false;
> >       }
> >       return true;
> > -
> > -err:
> > -    ffa_rxtx_destroy();
>
> This seems to be unrelated to the change. Can you explain why we don't
> need to call ffa_rxtx_destroy()?
>
> > -
> > -    return false;
>  >   }> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_sh=
m.c
> > index 370d83ec5cf8..efa5b67db8e1 100644
> > --- a/xen/arch/arm/tee/ffa_shm.c
> > +++ b/xen/arch/arm/tee/ffa_shm.c
> > @@ -149,6 +149,9 @@ static int32_t ffa_mem_share(uint32_t tot_len, uint=
32_t frag_len,
> >   static int32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi=
,
> >                                  uint32_t flags)
> >   {
> > +    if ( !ffa_fw_supports_fid(FFA_MEM_RECLAIM) )
> > +        return FFA_RET_NOT_SUPPORTED;
> > +
> >       return ffa_simple_call(FFA_MEM_RECLAIM, handle_lo, handle_hi, fla=
gs, 0);
> >   }
> >
> > @@ -467,6 +470,12 @@ void ffa_handle_mem_share(struct cpu_user_regs *re=
gs)
> >       uint32_t range_count;
> >       uint32_t region_offs;
> >
> > +    if ( !ffa_fw_supports_fid(FFA_MEM_SHARE_64) )
> > +    {
> > +        ret =3D FFA_RET_NOT_SUPPORTED;
> > +        goto out_set_ret;
> > +    }
> > +
> >       /*
> >        * We're only accepting memory transaction descriptors via the rx=
/tx
> >        * buffer.
> > @@ -621,6 +630,9 @@ int ffa_handle_mem_reclaim(uint64_t handle, uint32_=
t flags)
> >       register_t handle_lo;
> >       int ret;
> >
> > +    if ( !ffa_fw_supports_fid(FFA_MEM_RECLAIM) )
> > +        return FFA_RET_NOT_SUPPORTED;
> > +
> >       spin_lock(&ctx->lock);
> >       shm =3D find_shm_mem(ctx, handle);
> >       if ( shm )
>
> Cheers,
>
> --
> Julien Grall
>
>

