Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D40AC825A
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 20:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000116.1380521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKiRV-0007zH-CL; Thu, 29 May 2025 18:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000116.1380521; Thu, 29 May 2025 18:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKiRV-0007wr-9S; Thu, 29 May 2025 18:57:29 +0000
Received: by outflank-mailman (input) for mailman id 1000116;
 Thu, 29 May 2025 18:57:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GswX=YN=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uKiRU-0007wl-8s
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 18:57:28 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3273c5c-3cbe-11f0-a2ff-13f23c93f187;
 Thu, 29 May 2025 20:57:26 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-32a826ad3e0so11422881fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 May 2025 11:57:26 -0700 (PDT)
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
X-Inumbo-ID: c3273c5c-3cbe-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748545046; x=1749149846; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NW4xpPXELzmdxCP+iBWtcqsDHbMdMe39tFOYLXEyrro=;
        b=RZbX+iMm5e44XTIUZu0MfICVH8HN8kSu+cD0MVkb2JnqsT0oUr2kEnb/WHcRQbRKQ5
         u9iq4vw0ubwDX0pAyMAxW46zp5UvT6CcDqkYKUqnoNzyTQl3Hbe6AGaDZkQDtp94wdd5
         hdJkyOfWGsxRZA1ZNvtsiWCYY9j4h3BFGdzfsbgtb65IeBz8AQeAk+HyS9AtZaaz7gjl
         VLp4IpnBlJ9osdOP0UjtJerTm4WiF11K69fdbQR3lnt8O8zkoG6Kn88U0EN95jAOOd9K
         oe0OjK3uaYMxy/uQUtTnfhpv5dv2aPXMXte7rxivBO0C64MVMM57KLcLyCF43tWeZsuc
         Dk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748545046; x=1749149846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NW4xpPXELzmdxCP+iBWtcqsDHbMdMe39tFOYLXEyrro=;
        b=RZvRNAnhSuTwP34xlcWNeY+RMt/LiYqRyI6LmG6foVNZwhmoR/5oob7CxTuON2VScN
         Z0HHQufceTmUrecdeorM3HwcQigKjNW6pTMHbnKr1BURgrb/CEAG8PFH18uTFNMGvgkc
         Erz/cMGsPGTJzu+sUL8ILbv8KXQiYbExdCozgI8y+pGeNkTlhRJ0CS4yCJi+XpGpiYd8
         GCCaUg5alleGhIhd8thsvyRSYJFlWuTFeMo7zwJXFXXTVl8uO91nKug/HEB2FA+o7aRc
         PkGfGaRMrDHKvXDaTAS+Vdd513lUPadhIRS+ffHU52JVg1KNrFGPGHI5Lc53EXh11GSs
         b2HA==
X-Gm-Message-State: AOJu0YzhWPM5QiK491bklcKSo041Th6QJTn6YL5QLLN/36KaqCcIKvpY
	LIAAH6H3y0YTsH6wEMHSVLaO+o4LNZ779+wWq1WHNPYccBe1hhKtUvcko7PeQ6+lq37WLFNLNkm
	t/2P6NwRh+Tzfyo3HIA4N5sRwBcEO9TscXp4jYAQ=
X-Gm-Gg: ASbGncuJ9fuZwVyFEZpUbCN/lEohRhso+tXN8NROEajd2rOb2CEouF4wQaR59V9xpwd
	UqZxWmqQOBXjk8BE40/7KvuR4Ne+hTTL4Z7H7SZ6LEQuRw+uuiBlPX9rahybSH0G9RzP2+Z/k9L
	sIVfqEGZzEnsg+sYy6lmd1Vqys8sSQs48=
X-Google-Smtp-Source: AGHT+IHuJsq7GWOtAxoc6p/4TRtHsg2IE99I54Xa9oWDlkq55Izgz7bUw1h2fXGehf/rCO0jUxi6ptMr0jjPx9w5kyc=
X-Received: by 2002:a05:6512:1052:b0:545:225d:6463 with SMTP id
 2adb3069b0e04-5533b930c42mr216682e87.42.1748545045378; Thu, 29 May 2025
 11:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748337249.git.mykola_kvach@epam.com> <1a8313537603bee36636b0fcd2fdc2f76a2374fb.1748337249.git.mykola_kvach@epam.com>
In-Reply-To: <1a8313537603bee36636b0fcd2fdc2f76a2374fb.1748337249.git.mykola_kvach@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 29 May 2025 21:57:14 +0300
X-Gm-Features: AX0GCFva9bj4yTd7bnvXhf1-6-VxY2E0TII6YMtREuzeLjHOFu83BVF4tKdmSuE
Message-ID: <CAGeoDV_ng4jAbsPBAF56rCx00uWHSRvV4Zcao2Ps-__K_AUz6Q@mail.gmail.com>
Subject: Re: [PATCH v4][PART 1 2/4] xen/arm: Implement PSCI SYSTEM_SUSPEND
 call for guests
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 12:19=E2=80=AFPM Mykola Kvach <xakep.amatop@gmail.c=
om> wrote:
>
> From: Mykola Kvach <mykola_kvach@epam.com>
>
> This patch adds support for the PSCI SYSTEM_SUSPEND function in the vPSCI
> (virtual PSCI) interface, allowing guests to request suspend via the PSCI
> v1.0 SYSTEM_SUSPEND call (both 32-bit and 64-bit variants).
>
> The implementation:
> - Adds SYSTEM_SUSPEND function IDs to PSCI definitions
> - Implements trapping and handling of SYSTEM_SUSPEND in vPSCI
> - Allows only non-hardware domains to invoke SYSTEM_SUSPEND; for the
>   hardware domain, PSCI_NOT_SUPPORTED is returned to avoid halting the
>   system in hwdom_shutdown() called from domain_shutdown
> - Ensures all secondary VCPUs of the calling domain are offline before
>   allowing suspend due to PSCI spec
> - Treats suspend as a "standby" operation: the domain is shut down with
>   SHUTDOWN_suspend, and resumes execution at the instruction following
>   the call
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
> Changes in V3:
> Dropped all domain flags and related code (which touched common functions=
 like
> vcpu_unblock), keeping only the necessary changes for Xen suspend/resume,=
 i.e.
> suspend/resume is now fully supported only for the hardware domain.
> Proper support for domU suspend/resume will be added in a future patch.
> This patch does not yet include VCPU context reset or domain context
> restoration in VCPU.
>
> Changes in V4:
> Dropped all changes related to watchdog, domain is marked as shutting
> down in domain_shutdown and watchdog timeout handler won't trigger
> because of it.
>
> Previous versions included code to manage Xen watchdog timers during susp=
end,
> but this was removed. When a guest OS starts the Xen watchdog (either via=
 the
> kernel driver or xenwatchdogd), it is responsible for managing that state
> across suspend/resume. On Linux, the Xen kernel driver properly stops the
> watchdog during suspend. However, when xenwatchdogd is used instead, susp=
end
> handling is incomplete, potentially leading to watchdog-triggered resets =
on
> resume. Xen leaves watchdog handling to the guest OS and its services.
>
> Dropped all changes related to VCPU context, because instead domain_shutd=
own
> is used, so we don't need any extra changes for suspending domain.
> ---
>  xen/arch/arm/include/asm/perfc_defn.h |  1 +
>  xen/arch/arm/include/asm/psci.h       |  2 +
>  xen/arch/arm/vpsci.c                  | 64 +++++++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
>
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
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index d1615be8a6..866bd3128b 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -197,6 +197,57 @@ static void do_psci_0_2_system_reset(void)
>      domain_shutdown(d,SHUTDOWN_reboot);
>  }
>
> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t =
cid)
> +{
> +    struct vcpu *v;
> +    struct domain *d =3D current->domain;
> +
> +    /* Drop this check once SYSTEM_SUSPEND is supported in hardware doma=
in */
> +    if ( is_hardware_domain(d) )
> +        return PSCI_NOT_SUPPORTED;
> +
> +    /* Ensure that all CPUs other than the calling one are offline */
> +    for_each_vcpu ( d, v )
> +    {
> +        if ( v !=3D current && is_vcpu_online(v) )
> +            return PSCI_DENIED;
> +    }
> +
> +    /*
> +     * System suspend requests are treated as performing standby
> +     * as this simplifies Xen implementation.
> +     *
> +     * Arm Power State Coordination Interface (DEN0022F.b)
> +     *
> +     * 5.20.2 Caller responsibilities
> +     * The call is equivalent to using the CPU_SUSPEND call for the deep=
est
> +     * possible platform powerdown state. Consequently, the caller must =
observe
> +     * all the rules described for CPU_SUSPEND. See section 5.4.
> +     *
> +     * 5.4.5 Caller responsibilities
> +     * The caller must not assume that a powerdown request will return u=
sing
> +     * the specified entry point address. The powerdown request might no=
t
> +     * complete due, for example, to pending interrupts. It is also poss=
ible
> +     * that, because of coordination with other cores, the actual state =
entered
> +     * is shallower than the one requested. Because of this it is possib=
le for
> +     * an implementation to downgrade the powerdown state request to a s=
tandby
> +     * state. In the case of a downgrade to standby, the implementation =
returns
> +     * at the instruction following the PSCI call, at the Exception leve=
l of
> +     * the caller, instead of returning by the specified entry point add=
ress.
> +     * The return code in this case is SUCCESS. In the case of an early =
return
> +     * due to a pending wakeup event, the implementation can return at t=
he next
> +     * instruction, with a return code of SUCCESS, or resume at the spec=
ified
> +     * entry point address.
> +     *
> +     * 5.4.9 Implementation responsibilities: State on return
> +     * When returning from a standby state, the caller must observe no c=
hange in
> +     * core state, other than any timer changes expected because of the =
time
> +     * spent in the state, and changes in the CPU interface because of t=
he
> +     * wakeup reason.
> +     */
> +    return domain_shutdown(d, SHUTDOWN_suspend) ? PSCI_DENIED : PSCI_SUC=
CESS;
> +}
> +
>  static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>  {
>      /* /!\ Ordered by function ID and not name */
> @@ -214,6 +265,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_fun=
c_id)
>      case PSCI_0_2_FN32_SYSTEM_OFF:
>      case PSCI_0_2_FN32_SYSTEM_RESET:
>      case PSCI_1_0_FN32_PSCI_FEATURES:
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>      case ARM_SMCCC_VERSION_FID:
>          return 0;
>      default:
> @@ -344,6 +397,17 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, u=
int32_t fid)
>          return true;
>      }
>
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:

note to self: update VPSCI_NR_FUNCS

> +    {
> +        register_t epoint =3D PSCI_ARG(regs,1);
> +        register_t cid =3D PSCI_ARG(regs,2);
> +
> +        perfc_incr(vpsci_system_suspend);
> +        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
> +        return true;
> +    }
> +
>      default:
>          return false;
>      }
> --
> 2.48.1
>

