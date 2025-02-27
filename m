Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CEBA47EB8
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 14:16:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898087.1306653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tndjm-0007GQ-Tn; Thu, 27 Feb 2025 13:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898087.1306653; Thu, 27 Feb 2025 13:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tndjm-0007DU-RI; Thu, 27 Feb 2025 13:15:38 +0000
Received: by outflank-mailman (input) for mailman id 898087;
 Thu, 27 Feb 2025 13:15:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yTe9=VS=linux.intel.com=kirill.shutemov@srs-se1.protection.inumbo.net>)
 id 1tndjl-0007D8-30
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 13:15:37 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebbf656f-f50c-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 14:15:34 +0100 (CET)
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 05:15:30 -0800
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa001.fm.intel.com with ESMTP; 27 Feb 2025 05:15:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
 id 8582D2D5; Thu, 27 Feb 2025 15:15:23 +0200 (EET)
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
X-Inumbo-ID: ebbf656f-f50c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740662134; x=1772198134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=10uz/6GHPznmkoEebLO3Ry9z1Iblsqs6tsAuZLbb6pM=;
  b=iaUIkNjGZ+L3pCBA4nu94Ss+gkJtErF6nqlG3qeiSxk9gve4Em4LzKC2
   55exIcdSK2BKrI+AhfwIJ0zTYxAeS9Eo/bi6Vd374OIc0JmC+WsY9rSvR
   gW4HqLANJPhz2r7EL9SuNcfBAvLoqMv+gYrTarHsThCk4mUuf2bRu0LOV
   eKDn4JCSFFYwtu2UraCdq2yOn6+Ls73FxiKbJN8JGhB9QKJ2lWgF50Iuc
   ZC3fgvNZzCI0qDxYTn5D6evr6zhTo9fieDKQ5CKQyvRbB0dJKfwHMPoOU
   PERUZ3Otj1SZ5STM9uLfvqTiGHKGpqlkf8XNZUt55S/9VdjtFepYicExs
   w==;
X-CSE-ConnectionGUID: xne8VhtPQH++dIHBFguDeQ==
X-CSE-MsgGUID: hbL4G4qPRjW8nMwz3KS1sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52945591"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="52945591"
X-CSE-ConnectionGUID: YSzANlW6TheqXNJb8PsEYQ==
X-CSE-MsgGUID: IW3p7XzcS9++CSw8VxGIiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147939679"
Date: Thu, 27 Feb 2025 15:15:23 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>
Subject: Re: [PATCH v2 06/38] x86/tdx: Override PV calibration routines with
 CPUID-based calibration
Message-ID: <buq5hn27q7r5ktb33rxejp7i54s22zqu3vw44bie6vzcouzzdc@btjgkdpoeclw>
References: <20250227021855.3257188-1-seanjc@google.com>
 <20250227021855.3257188-7-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250227021855.3257188-7-seanjc@google.com>

On Wed, Feb 26, 2025 at 06:18:22PM -0800, Sean Christopherson wrote:
> When running as a TDX guest, explicitly override the TSC frequency
> calibration routine with CPUID-based calibration instead of potentially
> relying on a hypervisor-controlled PV routine.  For TDX guests, CPUID.0x15
> is always emulated by the TDX-Module, i.e. the information from CPUID is
> more trustworthy than the information provided by the hypervisor.
> 
> To maintain backwards compatibility with TDX guest kernels that use native
> calibration, and because it's the least awful option, retain
> native_calibrate_tsc()'s stuffing of the local APIC bus period using the
> core crystal frequency.  While it's entirely possible for the hypervisor
> to emulate the APIC timer at a different frequency than the core crystal
> frequency, the commonly accepted interpretation of Intel's SDM is that APIC
> timer runs at the core crystal frequency when that latter is enumerated via
> CPUID:
> 
>   The APIC timer frequency will be the processor’s bus clock or core
>   crystal clock frequency (when TSC/core crystal clock ratio is enumerated
>   in CPUID leaf 0x15).
> 
> If the hypervisor is malicious and deliberately runs the APIC timer at the
> wrong frequency, nothing would stop the hypervisor from modifying the
> frequency at any time, i.e. attempting to manually calibrate the frequency
> out of paranoia would be futile.
> 
> Deliberately leave the CPU frequency calibration routine as is, since the
> TDX-Module doesn't provide any guarantees with respect to CPUID.0x16.
> 
> Opportunistically add a comment explaining that CoCo TSC initialization
> needs to come after hypervisor specific initialization.
> 
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/coco/tdx/tdx.c    | 30 +++++++++++++++++++++++++++---
>  arch/x86/include/asm/tdx.h |  2 ++
>  arch/x86/kernel/tsc.c      |  8 ++++++++
>  3 files changed, 37 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> index 32809a06dab4..42cdaa98dc5e 100644
> --- a/arch/x86/coco/tdx/tdx.c
> +++ b/arch/x86/coco/tdx/tdx.c
> @@ -8,6 +8,7 @@
>  #include <linux/export.h>
>  #include <linux/io.h>
>  #include <linux/kexec.h>
> +#include <asm/apic.h>
>  #include <asm/coco.h>
>  #include <asm/tdx.h>
>  #include <asm/vmx.h>
> @@ -1063,9 +1064,6 @@ void __init tdx_early_init(void)
>  
>  	setup_force_cpu_cap(X86_FEATURE_TDX_GUEST);
>  
> -	/* TSC is the only reliable clock in TDX guest */
> -	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
> -
>  	cc_vendor = CC_VENDOR_INTEL;
>  
>  	/* Configure the TD */
> @@ -1122,3 +1120,29 @@ void __init tdx_early_init(void)
>  
>  	tdx_announce();
>  }
> +
> +static unsigned long tdx_get_tsc_khz(void)
> +{
> +	struct cpuid_tsc_info info;
> +
> +	if (WARN_ON_ONCE(cpuid_get_tsc_freq(&info)))
> +		return 0;
> +
> +	lapic_timer_period = info.crystal_khz * 1000 / HZ;
> +
> +	return info.tsc_khz;
> +}
> +
> +void __init tdx_tsc_init(void)
> +{
> +	/* TSC is the only reliable clock in TDX guest */
> +	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
> +	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
> +
> +	/*
> +	 * Override the PV calibration routines (if set) with more trustworthy
> +	 * CPUID-based calibration.  The TDX module emulates CPUID, whereas any
> +	 * PV information is provided by the hypervisor.
> +	 */
> +	tsc_register_calibration_routines(tdx_get_tsc_khz, NULL);
> +}
> diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
> index b4b16dafd55e..621fbdd101e2 100644
> --- a/arch/x86/include/asm/tdx.h
> +++ b/arch/x86/include/asm/tdx.h
> @@ -53,6 +53,7 @@ struct ve_info {
>  #ifdef CONFIG_INTEL_TDX_GUEST
>  
>  void __init tdx_early_init(void);
> +void __init tdx_tsc_init(void);
>  
>  void tdx_get_ve_info(struct ve_info *ve);
>  
> @@ -72,6 +73,7 @@ void __init tdx_dump_td_ctls(u64 td_ctls);
>  #else
>  
>  static inline void tdx_early_init(void) { };
> +static inline void tdx_tsc_init(void) { }
>  static inline void tdx_safe_halt(void) { };
>  
>  static inline bool tdx_early_handle_ve(struct pt_regs *regs) { return false; }
> diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> index 6a011cd1ff94..472d6c71d3a5 100644
> --- a/arch/x86/kernel/tsc.c
> +++ b/arch/x86/kernel/tsc.c
> @@ -32,6 +32,7 @@
>  #include <asm/topology.h>
>  #include <asm/uv/uv.h>
>  #include <asm/sev.h>
> +#include <asm/tdx.h>
>  
>  unsigned int __read_mostly cpu_khz;	/* TSC clocks / usec, not used here */
>  EXPORT_SYMBOL(cpu_khz);
> @@ -1563,8 +1564,15 @@ void __init tsc_early_init(void)
>  	if (is_early_uv_system())
>  		return;
>  
> +	/*
> +	 * Do CoCo specific "secure" TSC initialization *after* hypervisor
> +	 * platform initialization so that the secure variant can override the
> +	 * hypervisor's PV calibration routine with a more trusted method.
> +	 */
>  	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
>  		snp_secure_tsc_init();
> +	else if (boot_cpu_has(X86_FEATURE_TDX_GUEST))
> +		tdx_tsc_init();

Maybe a x86_platform.guest callback for this?


-- 
  Kiryl Shutsemau / Kirill A. Shutemov

