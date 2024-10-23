Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0265C9AC732
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 11:59:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824512.1238648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Y8p-0000ql-EJ; Wed, 23 Oct 2024 09:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824512.1238648; Wed, 23 Oct 2024 09:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Y8p-0000ob-Bf; Wed, 23 Oct 2024 09:58:59 +0000
Received: by outflank-mailman (input) for mailman id 824512;
 Wed, 23 Oct 2024 09:58:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Arnv=RT=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1t3Y8o-0000oV-L8
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 09:58:58 +0000
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [2001:4860:4864:20::32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a5b016a-9125-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 11:58:56 +0200 (CEST)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-2884a6b897cso3222507fac.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 02:58:56 -0700 (PDT)
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
X-Inumbo-ID: 6a5b016a-9125-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729677535; x=1730282335; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8A5/bs0inu+KQ8dOFxgi/TB7BAqWu0E6Yi3s9q8B3gE=;
        b=prvHA0yf0RfjUAPo14WI2O6q0QxtWPI2y3Hg9qNqxOfNiwA2BUOV9RtvmF81M3C2B3
         /O3L7+zvGTcAoxbksGdOC8haP8O6WNJ6dlj4LSTlcAkIwG6QYZ8/Fx8iT584g3YsNAm0
         X+xBFx8TCTwEZ/mlzBCqYakk46hu06QXe8/gJgVewRe+F/zIy2bQL4APRh2v3wac+VyR
         0X2e6HlF8kAjTMn0kwaNn4oypY282/R0UzW8LqSpwmi4ViRz35zExLGi0JEK1diKOq3o
         Ekz3AXRLGB9NGsJM5xfHNihZEV0I5R4qshl9dfACfeeMUequZUg+Sc9av6+7JYS17SVV
         zY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729677535; x=1730282335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8A5/bs0inu+KQ8dOFxgi/TB7BAqWu0E6Yi3s9q8B3gE=;
        b=DEByYXJY/zMNiMZOsZCsXk0u9dRGL3mRf0zSd0XfhUg7eR1MX9mI6exeSYF1m/F0SR
         CsaCL2yAH45Ldvt9msFS0KeCTuhol91SESJ12o1VtfZFr1S30oMOnNNvK/YyJdWG83QV
         WRj1gUqq8cVhfRqRbbvE9tmEElxXTu6LK1RPSjPL8bQwSy6p/tmXjaNJv1TqpBJ52bEI
         rVi4EMaNjCQ2UiWb/H4UrLxekEKR4/qm850H1DqhgmdDNtYLV0eBCCHhxJ5p3xPN3xsD
         VCUC8/jUr1vte7LhPBgADxG6Su3uWYFHjQKDAWZkba7Uz6HnrGQ401rIfvbO+2+uU9+c
         kWkA==
X-Gm-Message-State: AOJu0Yzkn/ukXwTz7ouE1WshSyeY+Q/0S/EVvUcGBO8+aR0XYb6gjiUo
	I6vLFP54RcnhPzg8+UeuAbhHrlJ2zGduemX+LwhsrXED89igyvat/ZQV6CavUrq2/jbRS5aha4w
	wJ60xUDkAhOmJkJupywTQgoLgkdHW1l9FxsB+8A==
X-Google-Smtp-Source: AGHT+IGu6lWzKFaKcbRkUUbONruxT+U25Phy8XnUTPbyIJouY8sQvUiTgXYNF3JvHZIvoU2Q2cm58+yj74pO+VnMfjE=
X-Received: by 2002:a05:6870:41d5:b0:270:6dfc:b145 with SMTP id
 586e51a60fabf-28ccb411239mr2142508fac.16.1729677534949; Wed, 23 Oct 2024
 02:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729066788.git.bertrand.marquis@arm.com> <84a39fbb681c1fdc2708d385e79bef1bbc9c6ae0.1729066788.git.bertrand.marquis@arm.com>
In-Reply-To: <84a39fbb681c1fdc2708d385e79bef1bbc9c6ae0.1729066788.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 23 Oct 2024 11:58:43 +0200
Message-ID: <CAHUa44F1ZDuVQkHTEmHC-x+u4kuLqphcjaK5c7wDnnenWuQi1Q@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] xen/arm: ffa: Fine granular call support
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
> Create a bitmap to store which feature is supported or not by the
> firmware and use it to filter which calls are done to the firmware.
>
> While there reoder ABI definition by numbers to easily find the min and
> max ones.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
> - rename fw_feat to abi and macros to FFA_ABI to be coherent with the
>   abi needed change done before
> - rework the macros to be simpler by directly defining MIN and MAX using
>   only Function ids
> - check that requested function ids do not go over the bitmap size in
>   ffa_fw_supports_fid
> - add an ASSERT to make sure that we do not try to set bits outside of
>   the bitmap
> - turn off FF-A if there is not firmware support and adapt the commit
>   message to reflect this
> - add a compile time check that FFA_ABI_MIN < FFA_ABI_MAX
> - remove spurious line removal
> - restore proper cleanup of rxtx init in case of error
> - reorder ABI by numbers
> ---
>  xen/arch/arm/tee/ffa.c          | 28 +++++++++++++++---------
>  xen/arch/arm/tee/ffa_notif.c    |  7 ++++++
>  xen/arch/arm/tee/ffa_partinfo.c | 30 +++++++++++++++++++++++++-
>  xen/arch/arm/tee/ffa_private.h  | 38 ++++++++++++++++++++++++++++-----
>  xen/arch/arm/tee/ffa_rxtx.c     |  4 ++++
>  xen/arch/arm/tee/ffa_shm.c      | 12 +++++++++++
>  6 files changed, 103 insertions(+), 16 deletions(-)

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 1ee6b2895e92..267d4435ac08 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -72,7 +72,10 @@
>  #include "ffa_private.h"
>
>  /* Negotiated FF-A version to use with the SPMC, 0 if not there or suppo=
rted */
> -static uint32_t __ro_after_init ffa_fw_version;
> +uint32_t __ro_after_init ffa_fw_version;
> +
> +/* Features supported by the SPMC or secure world when present */
> +DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
>
>  struct ffa_fw_abi {
>      const uint32_t id;
> @@ -177,6 +180,13 @@ static void handle_msg_send_direct_req(struct cpu_us=
er_regs *regs, uint32_t fid)
>      else
>          mask =3D GENMASK_ULL(31, 0);
>
> +    if ( !ffa_fw_supports_fid(fid) )
> +    {
> +        resp.a0 =3D FFA_ERROR;
> +        resp.a2 =3D FFA_RET_NOT_SUPPORTED;
> +        goto out;
> +    }
> +
>      src_dst =3D get_user_reg(regs, 1);
>      if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
>      {
> @@ -577,19 +587,16 @@ static bool ffa_probe(void)
>      else
>          ffa_fw_version =3D vers;
>
> -    /*
> -     * At the moment domains must support the same features used by Xen.
> -     * TODO: Rework the code to allow domain to use a subset of the
> -     * features supported.
> -     */
>      for ( unsigned int i =3D 0; i < ARRAY_SIZE(ffa_fw_abi_needed); i++ )
>      {
> -        if ( !ffa_abi_supported(ffa_fw_abi_needed[i].id) )
> -        {
> +        ASSERT(FFA_ABI_BITNUM(ffa_fw_abi_needed[i].id) < FFA_ABI_BITMAP_=
SIZE);
> +
> +        if ( ffa_abi_supported(ffa_fw_abi_needed[i].id) )
> +            set_bit(FFA_ABI_BITNUM(ffa_fw_abi_needed[i].id),
> +                    ffa_fw_abi_supported);
> +        else
>              printk(XENLOG_INFO "ARM FF-A Firmware does not support %s\n"=
,
>                     ffa_fw_abi_needed[i].name);
> -            goto err_no_fw;
> -        }
>      }
>
>      if ( !ffa_rxtx_init() )
> @@ -611,6 +618,7 @@ err_rxtx_destroy:
>      ffa_rxtx_destroy();
>  err_no_fw:
>      ffa_fw_version =3D 0;
> +    bitmap_zero(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
>      printk(XENLOG_WARNING "ARM FF-A No firmware support\n");
>
>      return false;
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 541e61d2f606..4b3e46318f4b 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -377,6 +377,13 @@ void ffa_notif_init(void)
>      unsigned int irq;
>      int ret;
>
> +    /* Only enable fw notification if all ABIs we need are supported */
> +    if ( !(ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
> +           ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_DESTROY) &&
> +           ffa_fw_supports_fid(FFA_NOTIFICATION_GET) &&
> +           ffa_fw_supports_fid(FFA_NOTIFICATION_INFO_GET_64)) )
> +        return;
> +
>      arm_smccc_1_2_smc(&arg, &resp);
>      if ( resp.a0 !=3D FFA_SUCCESS_32 )
>          return;
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index 93a03c6bc672..99c48f0e5c05 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -77,7 +77,15 @@ int32_t ffa_handle_partition_info_get(uint32_t w1, uin=
t32_t w2, uint32_t w3,
>       */
>      if ( w5 =3D=3D FFA_PARTITION_INFO_GET_COUNT_FLAG &&
>           ctx->guest_vers =3D=3D FFA_VERSION_1_1 )
> -        return ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_siz=
e);
> +    {
> +        if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> +            return ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi=
_size);
> +        else
> +        {
> +            *count =3D 0;
> +            return FFA_RET_OK;
> +        }
> +    }
>      if ( w5 )
>          return FFA_RET_INVALID_PARAMETERS;
>
> @@ -87,6 +95,18 @@ int32_t ffa_handle_partition_info_get(uint32_t w1, uin=
t32_t w2, uint32_t w3,
>      if ( !spin_trylock(&ctx->rx_lock) )
>          return FFA_RET_BUSY;
>
> +    if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> +    {
> +        if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 )
> +            *fpi_size =3D sizeof(struct ffa_partition_info_1_0);
> +        else
> +            *fpi_size =3D sizeof(struct ffa_partition_info_1_1);
> +
> +        *count =3D 0;
> +        ret =3D FFA_RET_OK;
> +        goto out;
> +    }
> +
>      if ( !ctx->page_count || !ctx->rx_is_free )
>          goto out;
>      spin_lock(&ffa_rx_buffer_lock);
> @@ -250,6 +270,11 @@ bool ffa_partinfo_init(void)
>      uint32_t count;
>      int e;
>
> +    if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) ||
> +         !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32) ||
> +         !ffa_rx || !ffa_tx )
> +        return false;
> +
>      e =3D ffa_partition_info_get(0, 0, 0, 0, 0, &count, &fpi_size);
>      if ( e )
>      {
> @@ -313,6 +338,9 @@ int ffa_partinfo_domain_init(struct domain *d)
>      unsigned int n;
>      int32_t res;
>
> +    if ( !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32) )
> +        return 0;
> +
>      ctx->vm_destroy_bitmap =3D xzalloc_array(unsigned long, count);
>      if ( !ctx->vm_destroy_bitmap )
>          return -ENOMEM;
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 045d9c4a0b56..85eb61c13464 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -14,6 +14,7 @@
>  #include <xen/spinlock.h>
>  #include <xen/sched.h>
>  #include <xen/time.h>
> +#include <xen/bitmap.h>
>
>  /* Error codes */
>  #define FFA_RET_OK                      0
> @@ -201,18 +202,17 @@
>  #define FFA_INTERRUPT                   0x84000062U
>  #define FFA_VERSION                     0x84000063U
>  #define FFA_FEATURES                    0x84000064U
> -#define FFA_RX_ACQUIRE                  0x84000084U
>  #define FFA_RX_RELEASE                  0x84000065U
>  #define FFA_RXTX_MAP_32                 0x84000066U
>  #define FFA_RXTX_MAP_64                 0xC4000066U
>  #define FFA_RXTX_UNMAP                  0x84000067U
>  #define FFA_PARTITION_INFO_GET          0x84000068U
>  #define FFA_ID_GET                      0x84000069U
> -#define FFA_SPM_ID_GET                  0x84000085U
> +#define FFA_MSG_POLL                    0x8400006AU
>  #define FFA_MSG_WAIT                    0x8400006BU
>  #define FFA_MSG_YIELD                   0x8400006CU
>  #define FFA_RUN                         0x8400006DU
> -#define FFA_MSG_SEND2                   0x84000086U
> +#define FFA_MSG_SEND                    0x8400006EU
>  #define FFA_MSG_SEND_DIRECT_REQ_32      0x8400006FU
>  #define FFA_MSG_SEND_DIRECT_REQ_64      0xC400006FU
>  #define FFA_MSG_SEND_DIRECT_RESP_32     0x84000070U
> @@ -230,8 +230,6 @@
>  #define FFA_MEM_RECLAIM                 0x84000077U
>  #define FFA_MEM_FRAG_RX                 0x8400007AU
>  #define FFA_MEM_FRAG_TX                 0x8400007BU
> -#define FFA_MSG_SEND                    0x8400006EU
> -#define FFA_MSG_POLL                    0x8400006AU
>  #define FFA_NOTIFICATION_BITMAP_CREATE  0x8400007DU
>  #define FFA_NOTIFICATION_BITMAP_DESTROY 0x8400007EU
>  #define FFA_NOTIFICATION_BIND           0x8400007FU
> @@ -240,6 +238,25 @@
>  #define FFA_NOTIFICATION_GET            0x84000082U
>  #define FFA_NOTIFICATION_INFO_GET_32    0x84000083U
>  #define FFA_NOTIFICATION_INFO_GET_64    0xC4000083U
> +#define FFA_RX_ACQUIRE                  0x84000084U
> +#define FFA_SPM_ID_GET                  0x84000085U
> +#define FFA_MSG_SEND2                   0x84000086U
> +
> +/**
> + * Encoding of features supported or not by the fw in a bitmap:
> + * - Function IDs are going from 0x60 to 0xFF
> + * - A function can be supported in 32 and/or 64bit
> + * The bitmap has one bit for each function in 32 and 64 bit.
> + */
> +#define FFA_ABI_ID(id)        ((id) & ARM_SMCCC_FUNC_MASK)
> +#define FFA_ABI_CONV(id)      (((id) >> ARM_SMCCC_CONV_SHIFT) & BIT(0,U)=
)
> +
> +#define FFA_ABI_MIN           FFA_ABI_ID(FFA_ERROR)
> +#define FFA_ABI_MAX           FFA_ABI_ID(FFA_MSG_SEND2)
> +
> +#define FFA_ABI_BITMAP_SIZE   (2 * (FFA_ABI_MAX - FFA_ABI_MIN + 1))
> +#define FFA_ABI_BITNUM(id)    ((FFA_ABI_ID(id) - FFA_ABI_MIN) << 1 | \
> +                               FFA_ABI_CONV(id))
>
>  struct ffa_ctx_notif {
>      bool enabled;
> @@ -289,6 +306,8 @@ extern void *ffa_rx;
>  extern void *ffa_tx;
>  extern spinlock_t ffa_rx_buffer_lock;
>  extern spinlock_t ffa_tx_buffer_lock;
> +extern uint32_t __ro_after_init ffa_fw_version;
> +extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
>
>  bool ffa_shm_domain_destroy(struct domain *d);
>  void ffa_handle_mem_share(struct cpu_user_regs *regs);
> @@ -401,4 +420,13 @@ static inline int32_t ffa_rx_release(void)
>      return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
>  }
>
> +static inline bool ffa_fw_supports_fid(uint32_t fid)
> +{
> +    BUILD_BUG_ON(FFA_ABI_MIN > FFA_ABI_MAX);
> +
> +    if ( FFA_ABI_BITNUM(fid) > FFA_ABI_BITMAP_SIZE)
> +        return false;
> +    return test_bit(FFA_ABI_BITNUM(fid), ffa_fw_abi_supported);
> +}
> +
>  #endif /*__FFA_PRIVATE_H__*/
> diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
> index 661764052e67..b6931c855779 100644
> --- a/xen/arch/arm/tee/ffa_rxtx.c
> +++ b/xen/arch/arm/tee/ffa_rxtx.c
> @@ -193,6 +193,10 @@ bool ffa_rxtx_init(void)
>  {
>      int e;
>
> +    /* Firmware not there or not supporting */
> +    if ( !ffa_fw_supports_fid(FFA_RXTX_MAP_64) )
> +        return false;
> +
>      ffa_rx =3D alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_CO=
UNT), 0);
>      if ( !ffa_rx )
>          return false;
> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> index 370d83ec5cf8..efa5b67db8e1 100644
> --- a/xen/arch/arm/tee/ffa_shm.c
> +++ b/xen/arch/arm/tee/ffa_shm.c
> @@ -149,6 +149,9 @@ static int32_t ffa_mem_share(uint32_t tot_len, uint32=
_t frag_len,
>  static int32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
>                                 uint32_t flags)
>  {
> +    if ( !ffa_fw_supports_fid(FFA_MEM_RECLAIM) )
> +        return FFA_RET_NOT_SUPPORTED;
> +
>      return ffa_simple_call(FFA_MEM_RECLAIM, handle_lo, handle_hi, flags,=
 0);
>  }
>
> @@ -467,6 +470,12 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs=
)
>      uint32_t range_count;
>      uint32_t region_offs;
>
> +    if ( !ffa_fw_supports_fid(FFA_MEM_SHARE_64) )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_set_ret;
> +    }
> +
>      /*
>       * We're only accepting memory transaction descriptors via the rx/tx
>       * buffer.
> @@ -621,6 +630,9 @@ int ffa_handle_mem_reclaim(uint64_t handle, uint32_t =
flags)
>      register_t handle_lo;
>      int ret;
>
> +    if ( !ffa_fw_supports_fid(FFA_MEM_RECLAIM) )
> +        return FFA_RET_NOT_SUPPORTED;
> +
>      spin_lock(&ctx->lock);
>      shm =3D find_shm_mem(ctx, handle);
>      if ( shm )
> --
> 2.47.0
>

