Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D946FD206E7
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 18:10:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203539.1518693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg4Nh-0000nf-Gi; Wed, 14 Jan 2026 17:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203539.1518693; Wed, 14 Jan 2026 17:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg4Nh-0000lN-CT; Wed, 14 Jan 2026 17:10:05 +0000
Received: by outflank-mailman (input) for mailman id 1203539;
 Wed, 14 Jan 2026 17:10:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sOi4=7T=bounce.vates.tech=bounce-md_30504962.6967cde7.v1-22e83d2fdafe47ea8a73999fd20286d2@srs-se1.protection.inumbo.net>)
 id 1vg4Nf-0000Oo-Qm
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 17:10:03 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbecfe61-f16b-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 18:10:01 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4drt072T2NzBsTrDT
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 17:09:59 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 22e83d2fdafe47ea8a73999fd20286d2; Wed, 14 Jan 2026 17:09:59 +0000
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
X-Inumbo-ID: dbecfe61-f16b-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1768410599; x=1768680599;
	bh=OlWfxkxEDTn9r7Dg1MqxsBD1qeD0E59fmqNxesqwYdQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mrVDFdGQWNRH4LbfB9uM3RGylbtpH72+whpT1QxkuLKqB8hO4h7k5oxYpG7+owHas
	 +U5JpVfdqN924sD9CQ93FnbPxD3j4qbYSIwgy29T4ICzXoLzscgxvxRcUZe+X41v3y
	 te2ZLcbyJ3ePXHA/80kSB/S+yj4IJXfxhEbtC0OjymrMOXYFVrD+lhe+iXxzCP0PN/
	 eeNov6az7tU/JqrnwSF27POpy5KHH0MYmh1Jssv5cxY3wWX59NvgJmS+kTWOYbCHz2
	 wu688ohQ4XSgtVhCfnx4ODrDlRSvYvghH7eW46PdlJ8eaH3U7cc2y0M3vkqptkaY4x
	 s2F37Y4SrPrRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1768410599; x=1768671099; i=teddy.astie@vates.tech;
	bh=OlWfxkxEDTn9r7Dg1MqxsBD1qeD0E59fmqNxesqwYdQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=U3uqaLS4Fleosyb01l4TXH4NeELlFIIxezfzgcxLO8jrSfdZGuGqKkntuH03FOuqV
	 5GBUftl3N/Fr9hsqnE4DXigNUvSrFLbXa3gaC6HWzwbExCHEVbtwyMlz4WJmBpc3xR
	 Z6+KRsW+8gApNR7hqxlajZHCyAsZ3t5dgabTnILxJigR1dPZJoyZYw4tbRf21yQOti
	 u/RK4tNdMqDJEuutxNWwW4feO0zgnqjePzxhQncrE/cIs3kYR703gkYIHMMXSuDxxu
	 iitY3ChT3q6AabBRPQa7c4mHJW/123MOP3jASBU1wupabDralPDSK8kqwsCRWXTity
	 IL++Bls9WyZvQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=202/6]=20x86:=20replace=20APERFMPERF=20synthetic=20feature=20bit?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1768410598136
Message-Id: <5607a1c2-a3ab-48d9-a9c4-10d6b1ceaffe@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <4d3a3576-2d3c-42ec-8551-18f1f0982e17@suse.com> <29eb0997-bf74-4cde-ba7b-6977223c3829@suse.com>
In-Reply-To: <29eb0997-bf74-4cde-ba7b-6977223c3829@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.22e83d2fdafe47ea8a73999fd20286d2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260114:md
Date: Wed, 14 Jan 2026 17:09:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 14/01/2026 =C3=A0 14:45, Jan Beulich a =C3=A9crit=C2=A0:
> Use the respective host CPU policy bit instead. This has the (tolerable,
> as we generally assume symmetry anyway) effect of using the BSP's
> (unleveled) setting, rather than the result of leveling (as is done by
> identify_cpu() on boot_cpu_data, rendering the variable name somewhat
> misleading).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> The leveling of boot_cpu_data is problematic anyway, as that way features
> can in principle disappear post-boot (as CPUs are being brought online;
> just that we don't think anymore that we really support physical CPU
> hotplug).

I think in the vast majority of cases, hotplugged CPUs are of same model 
or very similar; so shouldn't diverge too much in term of features.
Otherwise, it's pretty much impossible to guarantee anything unless we 
have per-socket cpu datas.

> ---
> v3: Re-base over naming changes.
> v2: Extend description.
> 
> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> @@ -80,7 +80,7 @@ unsigned int get_measured_perf(unsigned
>           return 0;
>   
>       policy =3D per_cpu(cpufreq_cpu_policy, cpu);
> -    if ( !policy || !cpu_has_aperfmperf )
> +    if ( !policy || !cpu_has_hw_feedback_cap )
>           return 0;
>   
>       switch (flag)
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -523,10 +523,6 @@ static void generic_identify(struct cpui
>   =09if ( cpu_has(c, X86_FEATURE_CLFLUSH) )
>   =09=09c->x86_clflush_size =3D ((ebx >> 8) & 0xff) * 8;
>   
> -=09if ( (c->cpuid_level >=3D CPUID_PM_LEAF) &&
> -=09     (cpuid_ecx(CPUID_PM_LEAF) & CPUID6_ECX_APERFMPERF_CAPABILITY) )
> -=09=09__set_bit(X86_FEATURE_APERFMPERF, c->x86_capability);
> -
>   =09/* AMD-defined flags: level 0x80000001 */
>   =09if (c->extended_cpuid_level >=3D 0x80000001)
>   =09=09cpuid(0x80000001, &tmp, &tmp,
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -11,7 +11,9 @@
>   #include <xen/macros.h>
>   
>   #ifndef __ASSEMBLER__
> +#include <asm/cpu-policy.h>
>   #include <asm/cpuid.h>
> +#include <xen/lib/x86/cpu-policy.h>
>   #else
>   #include <asm/cpufeatureset.h>
>   #endif
> @@ -121,7 +123,6 @@ static inline bool boot_cpu_has(unsigned
>   #define CPUID6_EAX_HDC                               BIT(13, U)
>   #define CPUID6_EAX_HWP_PECI                          BIT(16, U)
>   #define CPUID6_EAX_HW_FEEDBACK                       BIT(19, U)
> -#define CPUID6_ECX_APERFMPERF_CAPABILITY             BIT(0, U)
>   
>   /* CPUID level 0x00000001.edx */
>   #define cpu_has_fpu             1
> @@ -175,6 +176,9 @@ static inline bool boot_cpu_has(unsigned
>   #define cpu_has_fma4            boot_cpu_has(X86_FEATURE_FMA4)
>   #define cpu_has_tbm             boot_cpu_has(X86_FEATURE_TBM)
>   
> +/* CPUID level 0x00000006.ecx */
> +#define cpu_has_hw_feedback_cap host_cpu_policy.basic.hw_feedback_cap
> +
>   /* CPUID level 0x0000000D:1.eax */
>   #define cpu_has_xsaveopt        boot_cpu_has(X86_FEATURE_XSAVEOPT)
>   #define cpu_has_xsavec          boot_cpu_has(X86_FEATURE_XSAVEC)
> @@ -292,7 +296,6 @@ static inline bool boot_cpu_has(unsigned
>   /* Synthesized. */
>   #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
>   #define cpu_has_cpuid_faulting  boot_cpu_has(X86_FEATURE_CPUID_FAULTING=
)
> -#define cpu_has_aperfmperf      boot_cpu_has(X86_FEATURE_APERFMPERF)
>   #define cpu_has_xen_lbr         boot_cpu_has(X86_FEATURE_XEN_LBR)
>   #define cpu_has_xen_shstk       (IS_ENABLED(CONFIG_XEN_SHSTK) && \
>                                    boot_cpu_has(X86_FEATURE_XEN_SHSTK))
> --- a/xen/arch/x86/include/asm/cpufeatures.h
> +++ b/xen/arch/x86/include/asm/cpufeatures.h
> @@ -19,7 +19,7 @@ XEN_CPUFEATURE(TSC_RELIABLE,      X86_SY
>   XEN_CPUFEATURE(XTOPOLOGY,         X86_SYNTH( 5)) /* cpu topology enum e=
xtensions */
>   XEN_CPUFEATURE(CPUID_FAULTING,    X86_SYNTH( 6)) /* cpuid faulting */
>   XEN_CPUFEATURE(XEN_FRED,          X86_SYNTH( 7)) /* Xen uses FRED */
> -XEN_CPUFEATURE(APERFMPERF,        X86_SYNTH( 8)) /* APERFMPERF */
> +/* Bit 8 unused */
>   XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes=
 RDTSC */
>   XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by X=
en itself */
>   XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by X=
en itself */
> 
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



