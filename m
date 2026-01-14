Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B8CD1C9FE
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 07:02:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202467.1518020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vftxC-0001Ur-Mh; Wed, 14 Jan 2026 06:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202467.1518020; Wed, 14 Jan 2026 06:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vftxC-0001Sf-Io; Wed, 14 Jan 2026 06:02:02 +0000
Received: by outflank-mailman (input) for mailman id 1202467;
 Wed, 14 Jan 2026 06:02:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bd0b=7T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vftxB-0000XZ-LD
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 06:02:01 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a628944-f10e-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 07:02:00 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-59b77f2e43aso614717e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 22:02:00 -0800 (PST)
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
X-Inumbo-ID: 8a628944-f10e-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768370519; x=1768975319; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmfIwy+3Yd/UL9Fy1LT6pRmo0zFkYk0GjxD/YNxnqOc=;
        b=m82MA7Szy+PGeppQfvIdcpE2gx4tWoWWIPcSPZfOJtfUEtCDDfTDmODeChwpVCr1RV
         TXOwqtB7ieZGUX1QTFnuzP1YL+nbUk9P20HVzbMyM6jWSoAMG70VSHXwosr0tW1d4rPR
         upSkX3syB9eVYOTUGXHTb6SvSHCY27La1pDceo/Rj/0EV4YyIY5LeCy6CxH73Em55g8O
         zy6NWpN4BFeD1BGmBxQYm9csTB2HxOhwvz/2MR7bUPoQQ1kh5VEq142uDG3mAOQh+5zE
         k9b1f7RpokWkSRDxvnGaGfiVWIv3EAH16Ad3icyI3Lqk9KbvpFJ4pPjBDRmQnTNXCyOf
         i46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768370519; x=1768975319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kmfIwy+3Yd/UL9Fy1LT6pRmo0zFkYk0GjxD/YNxnqOc=;
        b=uyFnOr1tF2lVewaAGMjAr4GZot56puRfId30FDSKnPG0PqF58o2xktNo+Fae3tNgBB
         x+4c6L0w6/CRnPchveqkEdwiuZzE27n2zoHE5rEQu7xNjcBibc4RWCHMjJCpT4dNbIwQ
         G6R2p3fjNzYEkPIGrx1IhWWvmR/5ZfuTBeP+eeIyPn8+4Yxkv52OAyU02v56ommy7J6N
         c36XW819NeZ/lJEZNA0rjth9hfz6ebpliCNPVEGzFAUZ9/2moAryf5MkspYKXde7qxnX
         TGJmzRcMI00s2gqgbAm+ZElSZATdVBC8JI/cpJiwbF1vuq7K97MReHQXgVLFGHBwQ/lJ
         91vA==
X-Gm-Message-State: AOJu0YwK+KeaSvgyLeP/Gzs2iKRJLta1x7TbDIPiVSXen5RIbGlntPM4
	zL543XBbAtUgHvnBjmYqehxgZlQ+LFBv5Yrp5kVq/M5NhCXqL2XhcsvhiMqlOIQnA1wCDl5Goc+
	QVRxGIf87SsMQ0kiCYcRiwLGfgRdHqWJ5qZdn
X-Gm-Gg: AY/fxX47X8b9br3XiuJJo6ya/hphcLgCuV5CUr7YH10XKCFbpZHU5lE7HO0CUPy/TAs
	ughfX3mz1MCnKFmJCIBcdZY+nkTvfZy2v3KOw2pI6YBULET1RrtsJ2SZKpeLmEMpWIstDp68WdY
	+QMVrsop9/cWM7h+UlOCHkICtQaee5ekS45sSnvpMzqzgnU9g5DaIzkEYttv9pS0bHPohqVps6J
	9TXavIXeuwG536yWyo8uGmqkGVSUL0D1zwrmST7Mnsj8U+26YyQryAahA+Ztosx50jg5w==
X-Received: by 2002:a05:6512:4025:b0:59b:572e:83e8 with SMTP id
 2adb3069b0e04-59b9943311cmr1691686e87.24.1768370519047; Tue, 13 Jan 2026
 22:01:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765533584.git.mykola_kvach@epam.com> <f1d118552f84e2b894ec7163000f6dba98d0e3fa.1765533584.git.mykola_kvach@epam.com>
In-Reply-To: <f1d118552f84e2b894ec7163000f6dba98d0e3fa.1765533584.git.mykola_kvach@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 14 Jan 2026 08:00:00 +0200
X-Gm-Features: AZwV_QiqmgCRS9eSbDsv3i2VFjiFo9sY8wMm3z9CLCRIVCbUB9maiyfAIMhzYog
Message-ID: <CAGeoDV_UZWEA95oAc66s6ftKMxq-rowDy287R_4EU9n6G8AvCA@mail.gmail.com>
Subject: Ping: [PATCH v16 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Friendly ping on this series.

I believe all previously received comments have been addressed in this
revision, and I=E2=80=99m not aware of any remaining open issues.

Could you please take another look when you have a moment? If it looks good=
,
an Acked-by or Reviewed-by would be very appreciated; otherwise, I=E2=80=99=
m happy
to iterate on any further feedback.


Best regards,
Mykola

On Fri, Dec 12, 2025 at 3:22=E2=80=AFPM Mykola Kvach <xakep.amatop@gmail.co=
m> wrote:
>
> From: Mykola Kvach <mykola_kvach@epam.com>
>
> Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface,
> allowing guests to request suspend via the PSCI v1.0+ SYSTEM_SUSPEND call
> (both 32-bit and 64-bit variants).
>
> Implementation details:
> - Add SYSTEM_SUSPEND function IDs to PSCI definitions
> - Trap and handle SYSTEM_SUSPEND in vPSCI
> - Allow only non-hardware domains to invoke SYSTEM_SUSPEND; return
>   PSCI_NOT_SUPPORTED for the hardware domain to avoid halting the system
>   in hwdom_shutdown() via domain_shutdown
> - Require all secondary VCPUs of the calling domain to be offline before
>   suspend, as mandated by the PSCI specification
>
> The arch_domain_resume() function is an architecture-specific hook that i=
s
> invoked during domain resume to perform any necessary setup or restoratio=
n
> steps required by the platform. arch_domain_resume() stays int to propaga=
te
> errno-style detail into common logging; preserving the integer keeps the
> reason visible and leaves room for future arch-specific failures or riche=
r
> handling.
>
> The new vpsci_vcpu_up_prepare() helper is called on the resume path to se=
t up
> the vCPU context (such as entry point, some system regs and context ID) b=
efore
> resuming a suspended guest. This keeps ARM/vPSCI-specific logic out of co=
mmon
> code and avoids intrusive changes to the generic resume flow.
>
> Usage:
>
> For Linux-based guests, suspend can be initiated with:
>     echo mem > /sys/power/state
> or via:
>     systemctl suspend
>
> Resuming the guest is performed from control domain using:
>       xl resume <domain>
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V16:
> - Refactor error handling in domain_resume: move logging to generic code,
>   use explicit return code checking.
> - Make context clearing conditional on success in arch_domain_resume.
> - The 'int' return type is retained for arch_domain_resume for consistenc=
y
>   with other arch hooks and to allow for specific negative error codes.
> ---
>  xen/arch/arm/domain.c                 |  39 +++++++++
>  xen/arch/arm/include/asm/domain.h     |   2 +
>  xen/arch/arm/include/asm/perfc_defn.h |   1 +
>  xen/arch/arm/include/asm/psci.h       |   2 +
>  xen/arch/arm/include/asm/suspend.h    |  27 ++++++
>  xen/arch/arm/include/asm/vpsci.h      |   5 +-
>  xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
>  xen/common/domain.c                   |  10 +++
>  xen/include/xen/suspend.h             |  25 ++++++
>  9 files changed, 205 insertions(+), 22 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/suspend.h
>  create mode 100644 xen/include/xen/suspend.h
>
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 47973f99d9..f903e7d4f0 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -12,6 +12,8 @@
>  #include <xen/softirq.h>
>  #include <xen/wait.h>
>
> +#include <public/sched.h>
> +
>  #include <asm/arm64/sve.h>
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
> @@ -24,10 +26,12 @@
>  #include <asm/platform.h>
>  #include <asm/procinfo.h>
>  #include <asm/regs.h>
> +#include <asm/suspend.h>
>  #include <asm/firmware/sci.h>
>  #include <asm/tee/tee.h>
>  #include <asm/vfp.h>
>  #include <asm/vgic.h>
> +#include <asm/vpsci.h>
>  #include <asm/vtimer.h>
>
>  #include "vpci.h"
> @@ -851,6 +855,41 @@ void arch_domain_creation_finished(struct domain *d)
>      p2m_domain_creation_finished(d);
>  }
>
> +int arch_domain_resume(struct domain *d)
> +{
> +    int rc;
> +    struct resume_info *ctx =3D &d->arch.resume_ctx;
> +
> +    if ( !d->is_shutting_down || d->shutdown_code !=3D SHUTDOWN_suspend =
)
> +    {
> +        dprintk(XENLOG_WARNING,
> +                "%pd: Invalid domain state for resume: is_shutting_down=
=3D%u, shutdown_code=3D%u\n",
> +                d, d->is_shutting_down, d->shutdown_code);
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * It is still possible to call domain_shutdown() with a suspend rea=
son
> +     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote_s=
hutdown.
> +     * In these cases, the resume context will be empty.
> +     * This is not expected to cause any issues, so we just notify about=
 the
> +     * situation and return without error, allowing the existing logic t=
o
> +     * proceed as expected.
> +     */
> +    if ( !ctx->wake_cpu )
> +    {
> +        dprintk(XENLOG_INFO, "%pd: Wake CPU pointer context was not prov=
ided\n",
> +                d);
> +        return 0;
> +    }
> +
> +    rc =3D vpsci_vcpu_up_prepare(ctx->wake_cpu , ctx->ep, ctx->cid);
> +    if ( !rc )
> +        memset(ctx, 0, sizeof(*ctx));
> +
> +    return rc;
> +}
> +
>  static int is_guest_pv32_psr(uint32_t psr)
>  {
>      switch (psr & PSR_MODE_MASK)
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm=
/domain.h
> index 758ad807e4..66b1246892 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -5,6 +5,7 @@
>  #include <xen/timer.h>
>  #include <asm/page.h>
>  #include <asm/p2m.h>
> +#include <asm/suspend.h>
>  #include <asm/vfp.h>
>  #include <asm/mmio.h>
>  #include <asm/gic.h>
> @@ -126,6 +127,7 @@ struct arch_domain
>      void *sci_data;
>  #endif
>
> +    struct resume_info resume_ctx;
>  }  __cacheline_aligned;
>
>  struct arch_vcpu
> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include=
/asm/perfc_defn.h
> index effd25b69e..8dfcac7e3b 100644
> --- a/xen/arch/arm/include/asm/perfc_defn.h
> +++ b/xen/arch/arm/include/asm/perfc_defn.h
> @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_r=
eset")
>  PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
>  PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
>  PERFCOUNTER(vpsci_features,            "vpsci: features")
> +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
>
>  PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
>
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/p=
sci.h
> index 4780972621..48a93e6b79 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
>  #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
>  #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
>  #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
> +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
>
>  #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
>  #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
>  #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
> +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
>
>  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
>  #define PSCI_0_2_AFFINITY_LEVEL_ON      0
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/as=
m/suspend.h
> new file mode 100644
> index 0000000000..313d03ea59
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef ARM_SUSPEND_H
> +#define ARM_SUSPEND_H
> +
> +struct domain;
> +struct vcpu;
> +
> +struct resume_info {
> +    register_t ep;
> +    register_t cid;
> +    struct vcpu *wake_cpu;
> +};
> +
> +int arch_domain_resume(struct domain *d);
> +
> +#endif /* ARM_SUSPEND_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/asm/=
vpsci.h
> index 0cca5e6830..d790ab3715 100644
> --- a/xen/arch/arm/include/asm/vpsci.h
> +++ b/xen/arch/arm/include/asm/vpsci.h
> @@ -23,12 +23,15 @@
>  #include <asm/psci.h>
>
>  /* Number of function implemented by virtual PSCI (only 0.2 or later) */
> -#define VPSCI_NR_FUNCS  12
> +#define VPSCI_NR_FUNCS  14
>
>  /* Functions handle PSCI calls from the guests */
>  bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
>  bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid);
>
> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> +                          register_t context_id);
> +
>  #endif /* __ASM_VPSCI_H__ */
>
>  /*
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index 7ba9ccd94b..c4d616ec68 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -10,32 +10,16 @@
>
>  #include <public/sched.h>
>
> -static int do_common_cpu_on(register_t target_cpu, register_t entry_poin=
t,
> -                            register_t context_id)
> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> +                          register_t context_id)
>  {
> -    struct vcpu *v;
> -    struct domain *d =3D current->domain;
> -    struct vcpu_guest_context *ctxt;
>      int rc;
> +    struct domain *d =3D v->domain;
>      bool is_thumb =3D entry_point & 1;
> -    register_t vcpuid;
> -
> -    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> -
> -    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> -        return PSCI_INVALID_PARAMETERS;
> -
> -    /* THUMB set is not allowed with 64-bit domain */
> -    if ( is_64bit_domain(d) && is_thumb )
> -        return PSCI_INVALID_ADDRESS;
> -
> -    if ( !test_bit(_VPF_down, &v->pause_flags) )
> -        return PSCI_ALREADY_ON;
> +    struct vcpu_guest_context *ctxt;
>
>      if ( (ctxt =3D alloc_vcpu_guest_context()) =3D=3D NULL )
> -        return PSCI_DENIED;
> -
> -    vgic_clear_pending_irqs(v);
> +        return -ENOMEM;
>
>      memset(ctxt, 0, sizeof(*ctxt));
>      ctxt->user_regs.pc64 =3D (u64) entry_point;
> @@ -76,8 +60,37 @@ static int do_common_cpu_on(register_t target_cpu, reg=
ister_t entry_point,
>      free_vcpu_guest_context(ctxt);
>
>      if ( rc < 0 )
> +        return rc;
> +
> +    return 0;
> +}
> +
> +static int do_common_cpu_on(register_t target_cpu, register_t entry_poin=
t,
> +                            register_t context_id)
> +{
> +    struct vcpu *v;
> +    struct domain *d =3D current->domain;
> +    int rc;
> +    bool is_thumb =3D entry_point & 1;
> +    register_t vcpuid;
> +
> +    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> +
> +    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> +        return PSCI_INVALID_PARAMETERS;
> +
> +    /* THUMB set is not allowed with 64-bit domain */
> +    if ( is_64bit_domain(d) && is_thumb )
> +        return PSCI_INVALID_ADDRESS;
> +
> +    if ( !test_bit(_VPF_down, &v->pause_flags) )
> +        return PSCI_ALREADY_ON;
> +
> +    rc =3D vpsci_vcpu_up_prepare(v, entry_point, context_id);
> +    if ( rc )
>          return PSCI_DENIED;
>
> +    vgic_clear_pending_irqs(v);
>      vcpu_wake(v);
>
>      return PSCI_SUCCESS;
> @@ -197,6 +210,48 @@ static void do_psci_0_2_system_reset(void)
>      domain_shutdown(d,SHUTDOWN_reboot);
>  }
>
> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t =
cid)
> +{
> +    int32_t rc;
> +    struct vcpu *v;
> +    struct domain *d =3D current->domain;
> +    bool is_thumb =3D epoint & 1;
> +
> +    /* THUMB set is not allowed with 64-bit domain */
> +    if ( is_64bit_domain(d) && is_thumb )
> +        return PSCI_INVALID_ADDRESS;
> +
> +    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> +    if ( is_hardware_domain(d) )
> +        return PSCI_NOT_SUPPORTED;
> +
> +    /* Ensure that all CPUs other than the calling one are offline */
> +    domain_lock(d);
> +    for_each_vcpu ( d, v )
> +    {
> +        if ( v !=3D current && is_vcpu_online(v) )
> +        {
> +            domain_unlock(d);
> +            return PSCI_DENIED;
> +        }
> +    }
> +    domain_unlock(d);
> +
> +    rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> +    if ( rc )
> +        return PSCI_DENIED;
> +
> +    d->arch.resume_ctx.ep =3D epoint;
> +    d->arch.resume_ctx.cid =3D cid;
> +    d->arch.resume_ctx.wake_cpu =3D current;
> +
> +    gprintk(XENLOG_DEBUG,
> +            "SYSTEM_SUSPEND requested, epoint=3D%#"PRIregister", cid=3D%=
#"PRIregister"\n",
> +            epoint, cid);
> +
> +    return rc;
> +}
> +
>  static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>  {
>      /* /!\ Ordered by function ID and not name */
> @@ -214,6 +269,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_fun=
c_id)
>      case PSCI_0_2_FN32_SYSTEM_OFF:
>      case PSCI_0_2_FN32_SYSTEM_RESET:
>      case PSCI_1_0_FN32_PSCI_FEATURES:
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>      case ARM_SMCCC_VERSION_FID:
>          return 0;
>      default:
> @@ -344,6 +401,23 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, u=
int32_t fid)
>          return true;
>      }
>
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> +    {
> +        register_t epoint =3D PSCI_ARG(regs, 1);
> +        register_t cid =3D PSCI_ARG(regs, 2);
> +
> +        if ( fid =3D=3D PSCI_1_0_FN32_SYSTEM_SUSPEND )
> +        {
> +            epoint &=3D GENMASK(31, 0);
> +            cid &=3D GENMASK(31, 0);
> +        }
> +
> +        perfc_incr(vpsci_system_suspend);
> +        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
> +        return true;
> +    }
> +
>      default:
>          return false;
>      }
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 93c71bc766..09ad0a26ee 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -26,6 +26,7 @@
>  #include <xen/hypercall.h>
>  #include <xen/delay.h>
>  #include <xen/shutdown.h>
> +#include <xen/suspend.h>
>  #include <xen/percpu.h>
>  #include <xen/multicall.h>
>  #include <xen/rcupdate.h>
> @@ -1374,6 +1375,7 @@ int domain_shutdown(struct domain *d, u8 reason)
>  void domain_resume(struct domain *d)
>  {
>      struct vcpu *v;
> +    int rc;
>
>      /*
>       * Some code paths assume that shutdown status does not get reset un=
der
> @@ -1383,6 +1385,13 @@ void domain_resume(struct domain *d)
>
>      spin_lock(&d->shutdown_lock);
>
> +    rc =3D arch_domain_resume(d);
> +    if ( rc )
> +    {
> +        printk("%pd: Failed to resume domain (ret %d)\n", d, rc);
> +        goto fail;
> +    }
> +
>      d->is_shutting_down =3D d->is_shut_down =3D 0;
>      d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
>
> @@ -1393,6 +1402,7 @@ void domain_resume(struct domain *d)
>          v->paused_for_shutdown =3D 0;
>      }
>
> + fail:
>      spin_unlock(&d->shutdown_lock);
>
>      domain_unpause(d);
> diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
> new file mode 100644
> index 0000000000..528879c2a9
> --- /dev/null
> +++ b/xen/include/xen/suspend.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef XEN_SUSPEND_H
> +#define XEN_SUSPEND_H
> +
> +#if __has_include(<asm/suspend.h>)
> +#include <asm/suspend.h>
> +#else
> +static inline int arch_domain_resume(struct domain *d)
> +{
> +    return 0;
> +}
> +#endif
> +
> +#endif /* XEN_SUSPEND_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.43.0
>

