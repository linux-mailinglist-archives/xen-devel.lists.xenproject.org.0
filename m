Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153A2D207D3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 18:17:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203559.1518702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg4UU-0001rT-9W; Wed, 14 Jan 2026 17:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203559.1518702; Wed, 14 Jan 2026 17:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg4UU-0001pK-6y; Wed, 14 Jan 2026 17:17:06 +0000
Received: by outflank-mailman (input) for mailman id 1203559;
 Wed, 14 Jan 2026 17:17:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YX40=7T=bounce.vates.tech=bounce-md_30504962.6967cf8c.v1-6bc1d91f2ac44b928af0eb62b499c31e@srs-se1.protection.inumbo.net>)
 id 1vg4US-0001pB-I6
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 17:17:04 +0000
Received: from mail8.us4.mandrillapp.com (mail8.us4.mandrillapp.com
 [205.201.136.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6ca92e3-f16c-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 18:17:01 +0100 (CET)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail8.us4.mandrillapp.com (Mailchimp) with ESMTP id 4drt8D3MFRz2K1tTg
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 17:17:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6bc1d91f2ac44b928af0eb62b499c31e; Wed, 14 Jan 2026 17:17:00 +0000
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
X-Inumbo-ID: d6ca92e3-f16c-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1768411020; x=1768681020;
	bh=ssK4S1O4CZOfa9aiSQFG1racQJohBaF98Mq2e+oFXfI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ow46H8VQFboFwyVDqjUGUhL2Fcz7FN2+uurDiKx9WeNyTqWzebFoncgAKgAr5GFSf
	 Cai31WxECA5MAdd9INIfOmNw3parYgFSvEhqk54SpQa27U0dZu1L1T0/4C3+l9D4Rt
	 o9+l90ax/tfjERaxMkrHmvOwzfSUNvz1BsLx70GRtP2l/JnCmOI+PMTSa3eST+7FkZ
	 GgahVcFIpDtxSBlY7DQZmODvetW5z3fVmILsuGM5pjLMMzbuk50kCU2yUl2V0Y8Ajn
	 K5dhp5hcfFJUSvrHTxvPbX/wfYz4wlByY7mhZDMLLH35Qh0nEW7iz1ThXCVvw9UJlY
	 wahtCdK2vwY7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1768411020; x=1768671520; i=teddy.astie@vates.tech;
	bh=ssK4S1O4CZOfa9aiSQFG1racQJohBaF98Mq2e+oFXfI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=F1uxkTg16V5LY753wTvBQI6nua3ZB04oQuAgMsrwCnJRB9f1ZTu5grejozCOVt8DN
	 QZ3f4+ctLxI/4FsGHyyEnWJkjT7iDrWZ239soVHPZhDAJTTJ24VNaA3KSlpwFVOrdb
	 hQaBPt3sWV3GKQPl/RnGR7l8adIJNpAztnwtcUbFYlTAjkA7uJ6Q/bVmUL0gvOZA0A
	 cHidg0ZMsCUHHSMJwY0+GMIsN4Vu2MvMDz7OGYdVeU8oFXcqh4EPIKK9SnKyX0ywm3
	 mVfInEOFIUlREywJ0lL346k83JPlpV9uOEN5NDMH1QAhbs2fVTgpSu1wVsrUg/8NoL
	 NLSpIMuGrICRw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=206/6]=20x86/cpufreq:=20use=20host=20CPU=20policy=20in=20HWP=20driver?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1768411017689
Message-Id: <c8be8841-2746-46bc-9ca4-f728af9bc8fa@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <4d3a3576-2d3c-42ec-8551-18f1f0982e17@suse.com> <7d52c0cf-c097-4c32-9af6-5044727c3ef8@suse.com>
In-Reply-To: <7d52c0cf-c097-4c32-9af6-5044727c3ef8@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6bc1d91f2ac44b928af0eb62b499c31e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260114:md
Date: Wed, 14 Jan 2026 17:17:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 14/01/2026 =C3=A0 14:47, Jan Beulich a =C3=A9crit=C2=A0:
> There's no need to invoke CPUID yet another time. This way two of the
> static booleans can also go away.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Undo some line wrapping. Correct padding in asm/cpufeature.h. Re-base
>      over naming changes.
> v2: Introduce cpu_has_*.
> 
> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -18,9 +18,6 @@
>   
>   static bool __ro_after_init hwp_in_use;
>   
> -static bool __ro_after_init feature_hwp_notification;
> -static bool __ro_after_init feature_hwp_activity_window;
> -
>   static bool __read_mostly feature_hdc;
>   
>   static bool __ro_after_init opt_cpufreq_hdc =3D true;
> @@ -165,8 +162,6 @@ bool hwp_active(void)
>   
>   static bool __init hwp_available(void)
>   {
> -    unsigned int eax;
> -
>       if ( boot_cpu_data.cpuid_level < CPUID_PM_LEAF )
>       {
>           hwp_verbose("cpuid_level (%#x) lacks HWP support\n",
> @@ -183,29 +178,22 @@ static bool __init hwp_available(void)
>           return false;
>       }
>   
> -    eax =3D cpuid_eax(CPUID_PM_LEAF);
> -
>       hwp_verbose("%d notify: %d act-window: %d energy-perf: %d pkg-level=
: %d peci: %d\n",
> -                !!(eax & CPUID6_EAX_HWP),
> -                !!(eax & CPUID6_EAX_HWP_NOTIFICATION),
> -                !!(eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW),
> -                !!(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE),
> -                !!(eax & CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST),
> -                !!(eax & CPUID6_EAX_HWP_PECI));
> +                cpu_has_hwp, cpu_has_hwp_interrupt,
> +                cpu_has_hwp_activity_window, cpu_has_hwp_epp,
> +                cpu_has_hwp_request_pkg, cpu_has_hwp_peci_override);
>   
> -    if ( !(eax & CPUID6_EAX_HWP) )
> +    if ( !cpu_has_hwp )
>           return false;
>   
> -    if ( !(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE) )
> +    if ( !cpu_has_hwp_epp )
>       {
>           hwp_verbose("disabled: No energy/performance preference availab=
le");
>   
>           return false;
>       }
>   
> -    feature_hwp_notification    =3D eax & CPUID6_EAX_HWP_NOTIFICATION;
> -    feature_hwp_activity_window =3D eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW=
;
> -    feature_hdc                 =3D eax & CPUID6_EAX_HDC;
> +    feature_hdc =3D cpu_has_hdc;
>   
>       hwp_verbose("Hardware Duty Cycling (HDC) %ssupported%s\n",
>                   feature_hdc ? "" : "not ",
> @@ -213,7 +201,7 @@ static bool __init hwp_available(void)
>                               : "");
>   
>       hwp_verbose("HW_FEEDBACK %ssupported\n",
> -                (eax & CPUID6_EAX_HW_FEEDBACK) ? "" : "not ");
> +                cpu_has_hw_feedback ? "" : "not ");
>   
>       hwp_in_use =3D true;
>   
> @@ -226,7 +214,7 @@ static int cf_check hwp_cpufreq_verify(s
>   {
>       struct hwp_drv_data *data =3D per_cpu(hwp_drv_data, policy->cpu);
>   
> -    if ( !feature_hwp_activity_window && data->activity_window )
> +    if ( !cpu_has_hwp_activity_window && data->activity_window )
>       {
>           hwp_verbose("HWP activity window not supported\n");
>   
> @@ -268,7 +256,7 @@ static int cf_check hwp_cpufreq_target(s
>       hwp_req.max_perf =3D data->maximum;
>       hwp_req.desired =3D data->desired;
>       hwp_req.energy_perf =3D data->energy_perf;
> -    if ( feature_hwp_activity_window )
> +    if ( cpu_has_hwp_activity_window )
>           hwp_req.activity_window =3D data->activity_window;
>   
>       if ( hwp_req.raw =3D=3D data->curr_req.raw )
> @@ -365,7 +353,7 @@ static void cf_check hwp_init_msrs(void
>       }
>   
>       /* Ensure we don't generate interrupts */
> -    if ( feature_hwp_notification )
> +    if ( cpu_has_hwp_interrupt )
>           wrmsr_safe(MSR_HWP_INTERRUPT, 0);
>   
>       if ( !(val & PM_ENABLE_HWP_ENABLE) )
> @@ -537,7 +525,7 @@ int get_hwp_para(unsigned int cpu,
>           return -ENODATA;
>   
>       cppc_para->features         =3D
> -        (feature_hwp_activity_window ? XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW :=
 0);
> +        (cpu_has_hwp_activity_window ? XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW :=
 0);
>       cppc_para->lowest           =3D data->hw.lowest;
>       cppc_para->lowest_nonlinear =3D data->hw.most_efficient;
>       cppc_para->nominal          =3D data->hw.guaranteed;
> @@ -585,7 +573,7 @@ int set_hwp_para(struct cpufreq_policy *
>   
>       /* Clear out activity window if lacking HW supported. */
>       if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW) &&
> -         !feature_hwp_activity_window )
> +         !cpu_has_hwp_activity_window )
>       {
>           set_cppc->set_params &=3D ~XEN_SYSCTL_CPPC_SET_ACT_WINDOW;
>           cleared_act_window =3D true;
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -115,14 +115,6 @@ static inline bool boot_cpu_has(unsigned
>   }
>   
>   #define CPUID_PM_LEAF                                6
> -#define CPUID6_EAX_HWP                               BIT(7, U)
> -#define CPUID6_EAX_HWP_NOTIFICATION                  BIT(8, U)
> -#define CPUID6_EAX_HWP_ACTIVITY_WINDOW               BIT(9, U)
> -#define CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE BIT(10, U)
> -#define CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST         BIT(11, U)
> -#define CPUID6_EAX_HDC                               BIT(13, U)
> -#define CPUID6_EAX_HWP_PECI                          BIT(16, U)
> -#define CPUID6_EAX_HW_FEEDBACK                       BIT(19, U)
>   
>   /* CPUID level 0x00000001.edx */
>   #define cpu_has_fpu             1
> @@ -179,6 +171,14 @@ static inline bool boot_cpu_has(unsigned
>   /* CPUID level 0x00000006.eax */
>   #define cpu_has_turbo_boost     host_cpu_policy.basic.turbo_boost
>   #define cpu_has_arat            host_cpu_policy.basic.arat
> +#define cpu_has_hwp             host_cpu_policy.basic.hwp
> +#define cpu_has_hwp_interrupt   host_cpu_policy.basic.hwp_interrupt
> +#define cpu_has_hwp_activity_window host_cpu_policy.basic.hwp_activity_w=
indow
> +#define cpu_has_hwp_epp         host_cpu_policy.basic.hwp_epp
> +#define cpu_has_hwp_request_pkg host_cpu_policy.basic.hwp_request_pkg
> +#define cpu_has_hdc             host_cpu_policy.basic.hdc
> +#define cpu_has_hwp_peci_override host_cpu_policy.basic.hwp_peci_overrid=
e
> +#define cpu_has_hw_feedback     host_cpu_policy.basic.hw_feedback
>   
>   /* CPUID level 0x00000006.ecx */
>   #define cpu_has_hw_feedback_cap host_cpu_policy.basic.hw_feedback_cap
> 
> 

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



