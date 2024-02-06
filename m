Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C8B84BD5D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 19:50:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677070.1053473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXQVm-0000o7-Sh; Tue, 06 Feb 2024 18:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677070.1053473; Tue, 06 Feb 2024 18:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXQVm-0000mT-Pz; Tue, 06 Feb 2024 18:49:38 +0000
Received: by outflank-mailman (input) for mailman id 677070;
 Tue, 06 Feb 2024 18:49:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rXQVl-0000mN-9E
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 18:49:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rXQVk-0001WW-TP; Tue, 06 Feb 2024 18:49:36 +0000
Received: from [15.248.2.233] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rXQVk-00042C-MB; Tue, 06 Feb 2024 18:49:36 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=bDmWwyYrnhxFUlZ/CYWFLNkGcwAtNAoaw6XzzPgFMAc=; b=INcdQKM7TU1qDOL1EoMQpl0tb+
	2JrOs+o2gqd9DrgMNsb/3XPYwej5VNZMxD9VUy3JL71VAZTm3e58Hr/9IoCbxkXFJ4yucGJb2sDQ7
	YPEguck/o3DlWfaFp39O6L6eORlAaJkq4Zr6aGyBwmCKSTp10x4vzIapqoRlK3G2noRw=;
Message-ID: <c7841d11-d072-4787-9d76-ee94123605bb@xen.org>
Date: Tue, 6 Feb 2024 18:49:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v4 1/3] xen/arm: Introduce CONFIG_PARTIAL_EMULATION and
 "partial-emulation" cmd option
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 luca.fancellu@arm.com
References: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
 <20240131121049.225044-2-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240131121049.225044-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 31/01/2024 12:10, Ayan Kumar Halder wrote:
> There can be situations when the registers cannot be emulated to their full
> functionality. This can be due to the complexity involved. In such cases, one
> can emulate those registers as RAZ/WI for example. We call them as partial
> emulation.
> 
> Some registers are non-optional and as such there is nothing preventing an OS
> from accessing them.
> Instead of injecting undefined exception (thus crashing a guest), one may want
> to prefer a partial emulation to let the guest running (in some cases accepting
> the fact that it might result in unwanted behavior).
> 
> A suitable example of this (as seen in subsequent patches) is emulation of
> DBGDTRTX_EL0 (on Arm64) and DBGDTRTXINT(on Arm32). These non-optional
> registers can be emulated as RAZ/WI and they can be enclosed within
> CONFIG_PARTIAL_EMULATION.
> 
> Further, "partial-emulation" command line option allows us to
> enable/disable partial emulation at run time. While CONFIG_PARTIAL_EMULATION
> enables support for partial emulation at compile time (i.e. adds code for
> partial emulation), this option may be enabled or disabled by Yocto or other
> build systems. However if the build system turns this option on, users
> can use scripts like Imagebuilder to generate uboot-script which will append
> "partial-emulation=false" to xen command line to turn off the partial
> emulation. Thus, it helps to avoid rebuilding xen.
> 
> By default, "CONFIG_PARTIAL_EMULATION=y" and "partial-emulation=false".
> This is done so that Xen supports partial emulation. However, customers are
> fully aware when they enable partial emulation. It's important to note that
> enabling such support might result in unwanted/non-spec compliant behavior.

Can you remind me why this is built by default? In particular...

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from v1 :-
> 1. New patch introduced in v2.
> 
> v2 :-
> 1. Reordered the patches so that the config and command line option is
> introduced in the first patch.
> 
> v3 :-
> 1. Defined a macro 'partial_emulation' to reduce if-defs.
> 2. Fixed style issues.
> 
>   docs/misc/xen-command-line.pandoc | 11 +++++++++++
>   xen/arch/arm/Kconfig              |  9 +++++++++
>   xen/arch/arm/include/asm/traps.h  |  6 ++++++
>   xen/arch/arm/traps.c              |  9 +++++++++
>   4 files changed, 35 insertions(+)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 8e65f8bd18..22c0d7c9f6 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1949,6 +1949,17 @@ This option is ignored in **pv-shim** mode.
>   
>   > Default: `on`
>   
> +### partial-emulation (arm)
> +> `= <boolean>`
> +
> +> Default: `false`
> +
> +Flag to enable or disable partial emulation of system/coprocessor registers.
> +Only effective if CONFIG_PARTIAL_EMULATION is enabled.
> +
> +**WARNING: Enabling this option might result in unwanted/non-spec compliant
> +behavior.**

... leads me to think that the default config should have it off. Still 
letting the integrator optionally opt-in.

It also wants some explanation about the security support statement. Is 
the goal to support any security issue that may arise from someone 
adding 'partial-emulation=true'?

> +
>   ### pci
>       = List of [ serr=<bool>, perr=<bool> ]
>   
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 50e9bfae1a..8d8f668e7f 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -225,6 +225,15 @@ config STATIC_EVTCHN
>   	  This option enables establishing static event channel communication
>   	  between domains on a dom0less system (domU-domU as well as domU-dom0).
>   
> +config PARTIAL_EMULATION
> +	bool "Enable partial emulation of system/coprocessor registers"
> +	default y
> +	help
> +	  This option enables partial emulation of registers to prevent guests
> +	  crashing when accessing registers which are not optional but have not been

I think we need to list somewhere (possibly in the command line 
documentation) which registers are partially implemented. This will help 
the admin to quickly figure out whether this option makes sense for them.

> +	  emulated to its complete functionality. Enabling this might result in
> +	  unwanted/non-spec compliant behavior.

The description leads me to think if this is selected, then Xen will do 
the partial emulation. However, this is not matching the code.

Selecting this option doesn't result to unwanted/non-spec compliant 
behavior. What trigger the unwanted behavior if the command line option.

So I would suggest to reword the Kconfig to:

"Partial emulation support"

"Some of the required registers are not properly emulated by Xen. This 
option will allow the admin to select at runtime (via the command line 
'partial-emulation' whether the registers are unimplemented (i.e. a 
fault will be injected on access) or they will be partially emulated.

Partial emulation could be useful if a guest is trying to access any of 
the registers (see XXX for the list).

> +
>   endmenu
>   
>   menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
> index 883dae368e..9a60dbf70e 100644
> --- a/xen/arch/arm/include/asm/traps.h
> +++ b/xen/arch/arm/include/asm/traps.h
> @@ -10,6 +10,12 @@
>   # include <asm/arm64/traps.h>
>   #endif
>   
> +#ifdef CONFIG_PARTIAL_EMULATION
> +extern bool partial_emulation;
> +#else
> +#define partial_emulation false
> +#endif
> +
>   /*
>    * GUEST_BUG_ON is intended for checking that the guest state has not been
>    * corrupted in hardware and/or that the hardware behaves as we
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 9c10e8f78c..d1c7a6c516 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -42,6 +42,15 @@
>   #include <asm/vgic.h>
>   #include <asm/vtimer.h>
>   
> +/*
> + * partial_emulation: If true, partial emulation for system/coprocessor
> + * registers will be enabled.
> + */
> +#ifdef CONFIG_PARTIAL_EMULATION
> +bool __ro_after_init partial_emulation = false;
> +boolean_param("partial-emulation", partial_emulation);
> +#endif

I think we should use warning_add() to print a message indicating the 
admin has enabled a configuration that is potentially unsafe for the guest.

> +
>   /* The base of the stack must always be double-word aligned, which means
>    * that both the kernel half of struct cpu_user_regs (which is pushed in
>    * entry.S) and struct cpu_info (which lives at the bottom of a Xen

Cheers,

-- 
Julien Grall

