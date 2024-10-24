Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA849ADEB5
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 10:15:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825006.1239199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3t09-00034V-R2; Thu, 24 Oct 2024 08:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825006.1239199; Thu, 24 Oct 2024 08:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3t09-00032G-Ne; Thu, 24 Oct 2024 08:15:25 +0000
Received: by outflank-mailman (input) for mailman id 825006;
 Thu, 24 Oct 2024 08:15:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqEU=RU=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1t3t08-00032A-7F
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 08:15:24 +0000
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [2607:f8b0:4864:20::c2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d1d8b87-91e0-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 10:15:22 +0200 (CEST)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-5ebc349204cso289252eaf.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 01:15:22 -0700 (PDT)
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
X-Inumbo-ID: 1d1d8b87-91e0-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729757721; x=1730362521; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FETjNQYbPtBe1EMw66LkSIIgOJbcbsRpBpacljB0Lk=;
        b=jucLyNIZX7wEmg8FtDZn9K77B5BEwYwWopFyQX/ebQMIV+Oao2lsiKmk6S2YdYpiQ1
         vJEv3dTfIh+Yd7KaEsxZSD5uEosFhpeo0VKRJYe6MErOsvoRBaibeIwaroJu4QmPycXA
         QlFJHEBkB8LL20BO1AB++koyoMkwWXIBlJ043TW/jfG4q9jSKAjp75h7GYE/mpCmyIFm
         m73LgDblumjTzxk7RQr1+sTCr1+KngOHGK0+2EOqLqros+pQxhNDXiFksoj41xeoLdZI
         EQIzUIt/A9D3zm6sT1nRy2cnhLkvP1zZYf3d5T00lYb8RfQW6qI+5xbiqYpUuAVPfIBA
         vPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729757721; x=1730362521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FETjNQYbPtBe1EMw66LkSIIgOJbcbsRpBpacljB0Lk=;
        b=fwhpQ/vyL58qNLWYyvvwV5lKEZtgywl6/OCLnAFt9Qc+ZdiHf0p4fn+hON1Ma22VSu
         5WmjjmYflJtcZDubGywoXwQ6Dy/lf0eP9T3Zg7gqNALb9qsOQ7Xlaqs/77oQhlqKsDAj
         Z8wuf+xSwZhabj3uioBLjBp1KkUY3Za9ylcJNxKF92s9hx6p4f0PPF7vLFA483H1B95P
         iOSwOev0l9zK/A46Txpw4vwHivwIA3qk3h04hPQAb+zRV5GrA8GQBo7Yl7pn0YEkEitO
         jjXpABTWo9oFVVt/HkMnDEe24lo3rDaZ4i731fqf4Omzidhn+dNDhjtHhq+fNI27Rz9m
         j/qA==
X-Gm-Message-State: AOJu0YwKAsW+UDURYqux7gyAmeMeGfwyNc9Xck7Y9G/edHVIstb6MJpx
	O4GQAbEV90KjOmsSrZJGOIp2cRiQ7oOopVEvtgsaG3GcRzaAsnQTcci2KkzB+EwvyaACVGmBT7o
	597smwr4QKUHIKY5OVMPcbWndqBUQpcDOsHj+IA==
X-Google-Smtp-Source: AGHT+IFvSmcfYQE2QdutftT6jOlMMYjIHsSljiJ3wW8Po/MqPAwikEsiiH7AmRZHL4eGbTIQUsW4uOZhavCrlfwcvsA=
X-Received: by 2002:a05:6870:702b:b0:287:af33:9686 with SMTP id
 586e51a60fabf-28ccb83e597mr5207405fac.28.1729757721172; Thu, 24 Oct 2024
 01:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729066788.git.bertrand.marquis@arm.com>
 <84a39fbb681c1fdc2708d385e79bef1bbc9c6ae0.1729066788.git.bertrand.marquis@arm.com>
 <CAHUa44F1ZDuVQkHTEmHC-x+u4kuLqphcjaK5c7wDnnenWuQi1Q@mail.gmail.com>
In-Reply-To: <CAHUa44F1ZDuVQkHTEmHC-x+u4kuLqphcjaK5c7wDnnenWuQi1Q@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 24 Oct 2024 10:15:09 +0200
Message-ID: <CAHUa44EtL_hLqCD15jcvMEUxxt-289yXDaMDEs=h7EXUQxj8og@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] xen/arm: ffa: Fine granular call support
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 11:58=E2=80=AFAM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> Hi Bertrand,
>
> On Wed, Oct 16, 2024 at 10:32=E2=80=AFAM Bertrand Marquis
> <bertrand.marquis@arm.com> wrote:
> >
> > Create a bitmap to store which feature is supported or not by the
> > firmware and use it to filter which calls are done to the firmware.
> >
> > While there reoder ABI definition by numbers to easily find the min and
> > max ones.
> >
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > ---
> > Changes in v2:
> > - rename fw_feat to abi and macros to FFA_ABI to be coherent with the
> >   abi needed change done before
> > - rework the macros to be simpler by directly defining MIN and MAX usin=
g
> >   only Function ids
> > - check that requested function ids do not go over the bitmap size in
> >   ffa_fw_supports_fid
> > - add an ASSERT to make sure that we do not try to set bits outside of
> >   the bitmap
> > - turn off FF-A if there is not firmware support and adapt the commit
> >   message to reflect this
> > - add a compile time check that FFA_ABI_MIN < FFA_ABI_MAX
> > - remove spurious line removal
> > - restore proper cleanup of rxtx init in case of error
> > - reorder ABI by numbers
> > ---
> >  xen/arch/arm/tee/ffa.c          | 28 +++++++++++++++---------
> >  xen/arch/arm/tee/ffa_notif.c    |  7 ++++++
> >  xen/arch/arm/tee/ffa_partinfo.c | 30 +++++++++++++++++++++++++-
> >  xen/arch/arm/tee/ffa_private.h  | 38 ++++++++++++++++++++++++++++-----
> >  xen/arch/arm/tee/ffa_rxtx.c     |  4 ++++
> >  xen/arch/arm/tee/ffa_shm.c      | 12 +++++++++++
> >  6 files changed, 103 insertions(+), 16 deletions(-)
>
> Looks good.
> Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

I'm sorry, I'm having second thoughts about this patch. I have two concerns=
:
1. Xen will complain at boot with XENLOG_INFO if an ABI function
listed in ffa_fw_abi_needed is missing. With the current list of ABI
functions that's somewhat OK since it was a cause of disabling FF-A
support before. But as the list grows it may become annoying or even
confusing since when Xen supports more features it may complain more
even if there is no regression compared to previous versions. If we
need to print anything perhaps XENLOG_DEBUG is better.
2. FFA_FEATURES may return success for features not supported by the
SPMC. How about only returning success for features in the
ffa_fw_abi_needed bitmap?

Cheers,
Jens

>
> Cheers,
> Jens
>
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index 1ee6b2895e92..267d4435ac08 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -72,7 +72,10 @@
> >  #include "ffa_private.h"
> >
> >  /* Negotiated FF-A version to use with the SPMC, 0 if not there or sup=
ported */
> > -static uint32_t __ro_after_init ffa_fw_version;
> > +uint32_t __ro_after_init ffa_fw_version;
> > +
> > +/* Features supported by the SPMC or secure world when present */
> > +DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
> >
> >  struct ffa_fw_abi {
> >      const uint32_t id;
> > @@ -177,6 +180,13 @@ static void handle_msg_send_direct_req(struct cpu_=
user_regs *regs, uint32_t fid)
> >      else
> >          mask =3D GENMASK_ULL(31, 0);
> >
> > +    if ( !ffa_fw_supports_fid(fid) )
> > +    {
> > +        resp.a0 =3D FFA_ERROR;
> > +        resp.a2 =3D FFA_RET_NOT_SUPPORTED;
> > +        goto out;
> > +    }
> > +
> >      src_dst =3D get_user_reg(regs, 1);
> >      if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
> >      {
> > @@ -577,19 +587,16 @@ static bool ffa_probe(void)
> >      else
> >          ffa_fw_version =3D vers;
> >
> > -    /*
> > -     * At the moment domains must support the same features used by Xe=
n.
> > -     * TODO: Rework the code to allow domain to use a subset of the
> > -     * features supported.
> > -     */
> >      for ( unsigned int i =3D 0; i < ARRAY_SIZE(ffa_fw_abi_needed); i++=
 )
> >      {
> > -        if ( !ffa_abi_supported(ffa_fw_abi_needed[i].id) )
> > -        {
> > +        ASSERT(FFA_ABI_BITNUM(ffa_fw_abi_needed[i].id) < FFA_ABI_BITMA=
P_SIZE);
> > +
> > +        if ( ffa_abi_supported(ffa_fw_abi_needed[i].id) )
> > +            set_bit(FFA_ABI_BITNUM(ffa_fw_abi_needed[i].id),
> > +                    ffa_fw_abi_supported);
> > +        else
> >              printk(XENLOG_INFO "ARM FF-A Firmware does not support %s\=
n",
> >                     ffa_fw_abi_needed[i].name);
> > -            goto err_no_fw;
> > -        }
> >      }
> >
> >      if ( !ffa_rxtx_init() )
> > @@ -611,6 +618,7 @@ err_rxtx_destroy:
> >      ffa_rxtx_destroy();
> >  err_no_fw:
> >      ffa_fw_version =3D 0;
> > +    bitmap_zero(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
> >      printk(XENLOG_WARNING "ARM FF-A No firmware support\n");
> >
> >      return false;
> > diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.=
c
> > index 541e61d2f606..4b3e46318f4b 100644
> > --- a/xen/arch/arm/tee/ffa_notif.c
> > +++ b/xen/arch/arm/tee/ffa_notif.c
> > @@ -377,6 +377,13 @@ void ffa_notif_init(void)
> >      unsigned int irq;
> >      int ret;
> >
> > +    /* Only enable fw notification if all ABIs we need are supported *=
/
> > +    if ( !(ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
> > +           ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_DESTROY) &&
> > +           ffa_fw_supports_fid(FFA_NOTIFICATION_GET) &&
> > +           ffa_fw_supports_fid(FFA_NOTIFICATION_INFO_GET_64)) )
> > +        return;
> > +
> >      arm_smccc_1_2_smc(&arg, &resp);
> >      if ( resp.a0 !=3D FFA_SUCCESS_32 )
> >          return;
> > diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_par=
tinfo.c
> > index 93a03c6bc672..99c48f0e5c05 100644
> > --- a/xen/arch/arm/tee/ffa_partinfo.c
> > +++ b/xen/arch/arm/tee/ffa_partinfo.c
> > @@ -77,7 +77,15 @@ int32_t ffa_handle_partition_info_get(uint32_t w1, u=
int32_t w2, uint32_t w3,
> >       */
> >      if ( w5 =3D=3D FFA_PARTITION_INFO_GET_COUNT_FLAG &&
> >           ctx->guest_vers =3D=3D FFA_VERSION_1_1 )
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
> >      if ( w5 )
> >          return FFA_RET_INVALID_PARAMETERS;
> >
> > @@ -87,6 +95,18 @@ int32_t ffa_handle_partition_info_get(uint32_t w1, u=
int32_t w2, uint32_t w3,
> >      if ( !spin_trylock(&ctx->rx_lock) )
> >          return FFA_RET_BUSY;
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
> >      if ( !ctx->page_count || !ctx->rx_is_free )
> >          goto out;
> >      spin_lock(&ffa_rx_buffer_lock);
> > @@ -250,6 +270,11 @@ bool ffa_partinfo_init(void)
> >      uint32_t count;
> >      int e;
> >
> > +    if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) ||
> > +         !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32) ||
> > +         !ffa_rx || !ffa_tx )
> > +        return false;
> > +
> >      e =3D ffa_partition_info_get(0, 0, 0, 0, 0, &count, &fpi_size);
> >      if ( e )
> >      {
> > @@ -313,6 +338,9 @@ int ffa_partinfo_domain_init(struct domain *d)
> >      unsigned int n;
> >      int32_t res;
> >
> > +    if ( !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32) )
> > +        return 0;
> > +
> >      ctx->vm_destroy_bitmap =3D xzalloc_array(unsigned long, count);
> >      if ( !ctx->vm_destroy_bitmap )
> >          return -ENOMEM;
> > diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_priv=
ate.h
> > index 045d9c4a0b56..85eb61c13464 100644
> > --- a/xen/arch/arm/tee/ffa_private.h
> > +++ b/xen/arch/arm/tee/ffa_private.h
> > @@ -14,6 +14,7 @@
> >  #include <xen/spinlock.h>
> >  #include <xen/sched.h>
> >  #include <xen/time.h>
> > +#include <xen/bitmap.h>
> >
> >  /* Error codes */
> >  #define FFA_RET_OK                      0
> > @@ -201,18 +202,17 @@
> >  #define FFA_INTERRUPT                   0x84000062U
> >  #define FFA_VERSION                     0x84000063U
> >  #define FFA_FEATURES                    0x84000064U
> > -#define FFA_RX_ACQUIRE                  0x84000084U
> >  #define FFA_RX_RELEASE                  0x84000065U
> >  #define FFA_RXTX_MAP_32                 0x84000066U
> >  #define FFA_RXTX_MAP_64                 0xC4000066U
> >  #define FFA_RXTX_UNMAP                  0x84000067U
> >  #define FFA_PARTITION_INFO_GET          0x84000068U
> >  #define FFA_ID_GET                      0x84000069U
> > -#define FFA_SPM_ID_GET                  0x84000085U
> > +#define FFA_MSG_POLL                    0x8400006AU
> >  #define FFA_MSG_WAIT                    0x8400006BU
> >  #define FFA_MSG_YIELD                   0x8400006CU
> >  #define FFA_RUN                         0x8400006DU
> > -#define FFA_MSG_SEND2                   0x84000086U
> > +#define FFA_MSG_SEND                    0x8400006EU
> >  #define FFA_MSG_SEND_DIRECT_REQ_32      0x8400006FU
> >  #define FFA_MSG_SEND_DIRECT_REQ_64      0xC400006FU
> >  #define FFA_MSG_SEND_DIRECT_RESP_32     0x84000070U
> > @@ -230,8 +230,6 @@
> >  #define FFA_MEM_RECLAIM                 0x84000077U
> >  #define FFA_MEM_FRAG_RX                 0x8400007AU
> >  #define FFA_MEM_FRAG_TX                 0x8400007BU
> > -#define FFA_MSG_SEND                    0x8400006EU
> > -#define FFA_MSG_POLL                    0x8400006AU
> >  #define FFA_NOTIFICATION_BITMAP_CREATE  0x8400007DU
> >  #define FFA_NOTIFICATION_BITMAP_DESTROY 0x8400007EU
> >  #define FFA_NOTIFICATION_BIND           0x8400007FU
> > @@ -240,6 +238,25 @@
> >  #define FFA_NOTIFICATION_GET            0x84000082U
> >  #define FFA_NOTIFICATION_INFO_GET_32    0x84000083U
> >  #define FFA_NOTIFICATION_INFO_GET_64    0xC4000083U
> > +#define FFA_RX_ACQUIRE                  0x84000084U
> > +#define FFA_SPM_ID_GET                  0x84000085U
> > +#define FFA_MSG_SEND2                   0x84000086U
> > +
> > +/**
> > + * Encoding of features supported or not by the fw in a bitmap:
> > + * - Function IDs are going from 0x60 to 0xFF
> > + * - A function can be supported in 32 and/or 64bit
> > + * The bitmap has one bit for each function in 32 and 64 bit.
> > + */
> > +#define FFA_ABI_ID(id)        ((id) & ARM_SMCCC_FUNC_MASK)
> > +#define FFA_ABI_CONV(id)      (((id) >> ARM_SMCCC_CONV_SHIFT) & BIT(0,=
U))
> > +
> > +#define FFA_ABI_MIN           FFA_ABI_ID(FFA_ERROR)
> > +#define FFA_ABI_MAX           FFA_ABI_ID(FFA_MSG_SEND2)
> > +
> > +#define FFA_ABI_BITMAP_SIZE   (2 * (FFA_ABI_MAX - FFA_ABI_MIN + 1))
> > +#define FFA_ABI_BITNUM(id)    ((FFA_ABI_ID(id) - FFA_ABI_MIN) << 1 | \
> > +                               FFA_ABI_CONV(id))
> >
> >  struct ffa_ctx_notif {
> >      bool enabled;
> > @@ -289,6 +306,8 @@ extern void *ffa_rx;
> >  extern void *ffa_tx;
> >  extern spinlock_t ffa_rx_buffer_lock;
> >  extern spinlock_t ffa_tx_buffer_lock;
> > +extern uint32_t __ro_after_init ffa_fw_version;
> > +extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
> >
> >  bool ffa_shm_domain_destroy(struct domain *d);
> >  void ffa_handle_mem_share(struct cpu_user_regs *regs);
> > @@ -401,4 +420,13 @@ static inline int32_t ffa_rx_release(void)
> >      return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> >  }
> >
> > +static inline bool ffa_fw_supports_fid(uint32_t fid)
> > +{
> > +    BUILD_BUG_ON(FFA_ABI_MIN > FFA_ABI_MAX);
> > +
> > +    if ( FFA_ABI_BITNUM(fid) > FFA_ABI_BITMAP_SIZE)
> > +        return false;
> > +    return test_bit(FFA_ABI_BITNUM(fid), ffa_fw_abi_supported);
> > +}
> > +
> >  #endif /*__FFA_PRIVATE_H__*/
> > diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
> > index 661764052e67..b6931c855779 100644
> > --- a/xen/arch/arm/tee/ffa_rxtx.c
> > +++ b/xen/arch/arm/tee/ffa_rxtx.c
> > @@ -193,6 +193,10 @@ bool ffa_rxtx_init(void)
> >  {
> >      int e;
> >
> > +    /* Firmware not there or not supporting */
> > +    if ( !ffa_fw_supports_fid(FFA_RXTX_MAP_64) )
> > +        return false;
> > +
> >      ffa_rx =3D alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_=
COUNT), 0);
> >      if ( !ffa_rx )
> >          return false;
> > diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> > index 370d83ec5cf8..efa5b67db8e1 100644
> > --- a/xen/arch/arm/tee/ffa_shm.c
> > +++ b/xen/arch/arm/tee/ffa_shm.c
> > @@ -149,6 +149,9 @@ static int32_t ffa_mem_share(uint32_t tot_len, uint=
32_t frag_len,
> >  static int32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
> >                                 uint32_t flags)
> >  {
> > +    if ( !ffa_fw_supports_fid(FFA_MEM_RECLAIM) )
> > +        return FFA_RET_NOT_SUPPORTED;
> > +
> >      return ffa_simple_call(FFA_MEM_RECLAIM, handle_lo, handle_hi, flag=
s, 0);
> >  }
> >
> > @@ -467,6 +470,12 @@ void ffa_handle_mem_share(struct cpu_user_regs *re=
gs)
> >      uint32_t range_count;
> >      uint32_t region_offs;
> >
> > +    if ( !ffa_fw_supports_fid(FFA_MEM_SHARE_64) )
> > +    {
> > +        ret =3D FFA_RET_NOT_SUPPORTED;
> > +        goto out_set_ret;
> > +    }
> > +
> >      /*
> >       * We're only accepting memory transaction descriptors via the rx/=
tx
> >       * buffer.
> > @@ -621,6 +630,9 @@ int ffa_handle_mem_reclaim(uint64_t handle, uint32_=
t flags)
> >      register_t handle_lo;
> >      int ret;
> >
> > +    if ( !ffa_fw_supports_fid(FFA_MEM_RECLAIM) )
> > +        return FFA_RET_NOT_SUPPORTED;
> > +
> >      spin_lock(&ctx->lock);
> >      shm =3D find_shm_mem(ctx, handle);
> >      if ( shm )
> > --
> > 2.47.0
> >

