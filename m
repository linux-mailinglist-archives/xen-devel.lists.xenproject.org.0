Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15600AB3632
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 13:48:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981315.1367710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uERdo-0005oQ-Gd; Mon, 12 May 2025 11:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981315.1367710; Mon, 12 May 2025 11:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uERdo-0005lK-Dv; Mon, 12 May 2025 11:48:16 +0000
Received: by outflank-mailman (input) for mailman id 981315;
 Mon, 12 May 2025 11:48:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lTwj=X4=bounce.vates.tech=bounce-md_30504962.6821dffb.v1-dbe51b49c11a48ea980e2dc3adc9e7ba@srs-se1.protection.inumbo.net>)
 id 1uERdm-0005lE-W4
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 11:48:15 +0000
Received: from mail5.wdc04.mandrillapp.com (mail5.wdc04.mandrillapp.com
 [205.201.139.5]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb1ff8a4-2f26-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 13:48:12 +0200 (CEST)
Received: from pmta16.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail5.wdc04.mandrillapp.com (Mailchimp) with ESMTP id 4ZwyXq0MQvzG0CKHQ
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 11:48:11 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 dbe51b49c11a48ea980e2dc3adc9e7ba; Mon, 12 May 2025 11:48:11 +0000
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
X-Inumbo-ID: fb1ff8a4-2f26-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747050491; x=1747320491;
	bh=YEqULifj3Mz1rv6w9uKqW/wpFiLVlULCp7JvhnkpaEk=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=eQcgz9xa/IWu/jnptGzbtBuHpj0OYjVpFpp6WsYwp6Lq9bR5A1F5SaGmVR9/Ep/pW
	 QuYGnfl6RO5PJpFbrJhTKDtUX7qFY57tPkzcgE/n1ce28vum+VHgDP0CFuqeMhFgVo
	 uDXPPj7KISF1J/y8m8YDKNeSJlaWqfAvLlAQF9x4wVU7637aSccSulZRT/MvDeMCFd
	 QirvVbphWpL7BxUPcKuUrT9hOi7soF33ata8l6+gNgStuk89Scs27VmkA5XVi4NZC2
	 ofaof5P4eAuJYLuVKZtL2iCNQEZl5Ym2wEH7P1VBfffWUrgvPbjL85VBbAAzZhWicb
	 db20F0B6ZKaBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747050491; x=1747310991; i=teddy.astie@vates.tech;
	bh=YEqULifj3Mz1rv6w9uKqW/wpFiLVlULCp7JvhnkpaEk=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wPkSW6NyIDSy4Ndyualv0vGwlTLNMt9RZ2BAnu93WHbNb6zooEOt+Hm6wM1ArkB2T
	 +qfZ2E/L+CoCtSfXXHn/iIapCgDplac2GKBukoFWBUNH9ce2Ka0RHFATtjXoDaImYH
	 3WW2vQ2r5OF1vbOevSlyXpRY7lIo4SxqsFrRaeiRDTNGsDE37SWkson25QetXxapcZ
	 WKiyTqCYzshWBwz43RijyktUSGSuA2iylfvWeSe4PjxlEz8mIe83UqF4nJDvf7ZyCb
	 0eEIFJxQafO3xdB9HYUQqfT1TDKJ0gpmTLYp/KtP9u9cgUOxiZJtzYOfSFY14s4WZu
	 jstSFfPOzjgEQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=204/4]=20Disallow=20most=20command-line=20options=20when=20lockdown=20mode=20is=20enabled?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747050490075
Message-Id: <3e35eeb3-c4f6-423e-9185-5d98b6d1d060@vates.tech>
To: "Kevin Lampis" <kevin.lampis@cloud.com>, xen-devel@lists.xenproject.org
References: <20250506162347.1676357-1-kevin.lampis@cloud.com> <20250512090210.1718623-1-kevin.lampis@cloud.com>
In-Reply-To: <20250512090210.1718623-1-kevin.lampis@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.dbe51b49c11a48ea980e2dc3adc9e7ba?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250512:md
Date: Mon, 12 May 2025 11:48:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 12/05/2025 =C3=A0 11:04, Kevin Lampis a =C3=A9crit=C2=A0:
> A subset of command-line parameters that are specifically safe to use
> when lockdown mode is enabled are annotated as such.
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> ---
>   xen/arch/arm/domain_build.c           |  4 +--
>   xen/arch/x86/acpi/cpu_idle.c          |  2 +-
>   xen/arch/x86/cpu/amd.c                |  2 +-
>   xen/arch/x86/cpu/mcheck/mce.c         |  2 +-
>   xen/arch/x86/cpu/microcode/core.c     |  2 +-
>   xen/arch/x86/dom0_build.c             |  4 +--
>   xen/arch/x86/hvm/hvm.c                |  2 +-
>   xen/arch/x86/irq.c                    |  2 +-
>   xen/arch/x86/nmi.c                    |  2 +-
>   xen/arch/x86/setup.c                  |  2 +-
>   xen/arch/x86/traps.c                  |  2 +-
>   xen/arch/x86/x86_64/mmconfig-shared.c |  2 +-
>   xen/common/domain.c                   |  2 +-
>   xen/common/kernel.c                   | 10 +++++-
>   xen/common/kexec.c                    |  2 +-
>   xen/common/numa.c                     |  2 +-
>   xen/common/page_alloc.c               |  2 +-
>   xen/common/shutdown.c                 |  2 +-
>   xen/drivers/char/console.c            |  2 +-
>   xen/drivers/char/ns16550.c            |  4 +--
>   xen/drivers/video/vga.c               |  2 +-
>   xen/include/xen/param.h               | 49 +++++++++++++++++++++------
>   22 files changed, 70 insertions(+), 35 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index df29619c40..8ff1af3787 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -41,7 +41,7 @@
>   #include <xen/serial.h>
>   
>   static unsigned int __initdata opt_dom0_max_vcpus;
> -integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
> +integer_secure_param("dom0_max_vcpus", opt_dom0_max_vcpus);
>   
>   /*
>    * If true, the extended regions support is enabled for dom0 and
> @@ -61,7 +61,7 @@ static int __init parse_dom0_mem(const char *s)
>   
>       return *s ? -EINVAL : 0;
>   }
> -custom_param("dom0_mem", parse_dom0_mem);
> +custom_secure_param("dom0_mem", parse_dom0_mem);
>   
>   int __init parse_arch_dom0_param(const char *s, const char *e)
>   {
> diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
> index 1dbf15b01e..431fd0c997 100644
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -113,7 +113,7 @@ static int __init cf_check parse_cstate(const char *s=
)
>           max_csubstate =3D simple_strtoul(s + 1, NULL, 0);
>       return 0;
>   }

What makes ...

> -custom_param("max_cstate", parse_cstate);
> +custom_secure_param("max_cstate", parse_cstate);

... specifically unsafe ?

>   
>   static bool __read_mostly local_apic_timer_c2_ok;
>   boolean_param("lapic_timer_c2_ok", local_apic_timer_c2_ok);
> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> index 37d67dd15c..c36351c968 100644
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -47,7 +47,7 @@ integer_param("cpuid_mask_thermal_ecx", opt_cpuid_mask_=
thermal_ecx);
>   
>   /* 1 =3D allow, 0 =3D don't allow guest creation, -1 =3D don't allow bo=
ot */
>   int8_t __read_mostly opt_allow_unsafe;
> -boolean_param("allow_unsafe", opt_allow_unsafe);
> +boolean_secure_param("allow_unsafe", opt_allow_unsafe);
>   
>   /* Signal whether the ACPI C1E quirk is required. */
>   bool __read_mostly amd_acpi_c1e_quirk;
> diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.=
c
> index 1c348e557d..a229af6fd3 100644
> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -31,7 +31,7 @@
>   #include "vmce.h"
>   
>   bool __read_mostly opt_mce =3D true;
> -boolean_param("mce", opt_mce);
> +boolean_secure_param("mce", opt_mce);
>   bool __read_mostly mce_broadcast;
>   bool is_mc_panic;
>   DEFINE_PER_CPU_READ_MOSTLY(unsigned int, nr_mce_banks);
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microco=
de/core.c
> index 34a94cd25b..b5b7304ae7 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -160,7 +160,7 @@ static int __init cf_check parse_ucode(const char *s)
>   
>       return rc;
>   }
> -custom_param("ucode", parse_ucode);
> +custom_secure_param("ucode", parse_ucode);
>   
>   static struct microcode_ops __ro_after_init ucode_ops;
>   
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 0b467fd4a4..6d42acb661 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -142,7 +142,7 @@ static int __init cf_check parse_dom0_mem(const char =
*s)
>   
>       return s[-1] ? -EINVAL : ret;
>   }
> -custom_param("dom0_mem", parse_dom0_mem);
> +custom_secure_param("dom0_mem", parse_dom0_mem);
>   
>   static unsigned int __initdata opt_dom0_max_vcpus_min =3D 1;
>   static unsigned int __initdata opt_dom0_max_vcpus_max =3D UINT_MAX;
> @@ -164,7 +164,7 @@ static int __init cf_check parse_dom0_max_vcpus(const=
 char *s)
>   
>       return *s ? -EINVAL : 0;
>   }
> -custom_param("dom0_max_vcpus", parse_dom0_max_vcpus);
> +custom_secure_param("dom0_max_vcpus", parse_dom0_max_vcpus);
>   

I think it is acceptable for being able to configure dom0-max-vcpus and 
dom0-mem. It's very likely that the toolstack/user wants to configure that.

>   static __initdata unsigned int dom0_nr_pxms;
>   static __initdata unsigned int dom0_pxms[MAX_NUMNODES] =3D
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 4cb2e13046..97afb274fe 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -87,7 +87,7 @@ unsigned long __section(".bss.page_aligned") __aligned(=
PAGE_SIZE)
>   
>   /* Xen command-line option to enable HAP */
>   static bool __initdata opt_hap_enabled =3D true;
> -boolean_param("hap", opt_hap_enabled);
> +boolean_secure_param("hap", opt_hap_enabled);

---

I think there are several lockdown missing parameters, for instance 
(dom0-)iommu related parameters should be definetely supposed unsafe.

(dom0-)iommu parameter can be used to disable PCI Passthrough related 
security features (quarantine thus disabling fix for some XSA variants) 
or using invalid IOMMU configurations (e.g dom0-iommu=3Dnone).

In the same idea, PCI Passthrough to PV guests without a IOMMU should be 
made impossible in this mode, as it actually allows the guest to perform 
a privilege escalation using (actually unrestricted) DMA.

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



