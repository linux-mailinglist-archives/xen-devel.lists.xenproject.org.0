Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0170B9AD09
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 18:07:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129595.1469495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1S16-0000Gj-5d; Wed, 24 Sep 2025 16:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129595.1469495; Wed, 24 Sep 2025 16:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1S16-0000EP-2b; Wed, 24 Sep 2025 16:06:52 +0000
Received: by outflank-mailman (input) for mailman id 1129595;
 Wed, 24 Sep 2025 16:06:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6ttc=4D=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1v1S14-0000EJ-Fx
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 16:06:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7928f76e-9960-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 18:06:48 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 1F9374EEBC4C;
 Wed, 24 Sep 2025 18:06:46 +0200 (CEST)
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
X-Inumbo-ID: 7928f76e-9960-11f0-9809-7dc792cee155
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1758730006;
	b=sXCTB07OwASPmXY7cqREGznQkTNgEqNHt2MSl3D5v3wk8hBxyq05RoMhqkOvL/dACDn4
	 bGzVlZ1AhnJaqN1qgaoJWZLK/vFUsbhxklNlebRdriUJLXTRzQxRPPPtelNgWMbH0PJsq
	 z5Qu21rS/DxwFISUTOJk0dReMOZ1ov++ju603xu+NVn8MDa9gkNAd1U1FFFCMGornazqr
	 kRpVi5bucQvZGOPsbKhMp3FeUUG0QYGoOd49xPC2QSBl6rxmgxammk12a4PVmUsqMdKhf
	 2zlONIJ6kIlEoMuWH7hHlCVNax6EYu4vDyk8TvnCgL+z7oUHQLSVv3Q1PqlujJ4JhbdI5
	 K1ldPIWCuapXpL/6f5AhyyayC6PN4+JcVy38lk/JF50+O31mZuV0ewoMIs0ru3J9nyggL
	 3ufn0CpJlOQGxz+Nq/gHQ0kFuFvylmq4KrkPcstHm6DYHilPbObO6reRrC9remsQBMXYI
	 NopRAW6fmSbOeIgqDPN/yJv1w8Qh0+CL6++ssSWjmUH4eYOebspgNB5U/D56x2dYWqEBV
	 Zklbt/lDYD63aLOY5Gmfxt2nyO3I0Ww0yUQjDA9QL5feOtW91oDIM2S8l1QzOO+25tK6M
	 vd6WwLI/W4WEDgIsziN6oLyBlfYD9l9NFpLnp/mxSkRpxadgUDo2lukiAZc86r0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1758730006;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=MSpaDpUyDpI8hGrZh8BcNoDhOMGAqD+oi+QjymgT2XE=;
	b=z4KSXZNN+Fclt/MOC74rNtp5TzTOzOkH490jI1g2CmABSB8K+u6eqUcTRveadDqczrkp
	 3WyMRyrD3fC2OMGYAdkS9rbBSbUmAzZmXOF2+4JIC/KeJlGOe6FehGtJiQ3TlaB8g6bJh
	 hs1VfTlduY4eUr8PibH9rphQWwFmqbWBYpFL+NvicVTHXHOI1Zd48hKSL6sBlDeLCwMsf
	 QPdp5N/cNMJcQWTqxZ2Kq/yuaBMxWR8Dod1k0aLyFC+8gnvuT0ggFeCzoQJ8m/GaCPzqd
	 Qs7cLACyqqclvEO7Qs199HT8pq5T+RLOvowQmZbR/zZFEMiNJi+Pjn8juUkhafkI5b2VH
	 Sl3JO1+G86ofNW6ZnFhxcHvGtg/MVYhQ4YUtM9AuH9RXQfSTkvZYs8oZGgo7LGNBBYwef
	 cWHtjKKZnEB1BVfsPPuGQEHPR4mGczMxi6HOSlvWf6wNr7tEOgfXv0ABRan/pAIP4Gijw
	 uOn2VumYFqj9mI5KFTdlvlWs28gbYwEaqLvs6wvp84C0Hz3FqtdLxS3HMw1FeDZ5cPML8
	 VFQCYO4ZDX0G7hkAgAFfHo4XBcP9bgIXxp/iWjYA51MwQyRM3WCaKRwyM+UYx6S44eHB7
	 UsinXOKA+zIJFIxQ4p830wOUkHW9dRyf7GtgRwEZt0gMv3HNPDeJFoMdRQWuEH0=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1758730006; bh=ERgvP1ajrjoOeceRyDJZFJrmHh1tAcZUi5xsZmrTazs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s53p7whezYAYl/ELjWaCW3GvKxcJjiPPtsxZEiuUTqlqc+1Yjc38V+1aGsGzSnJQ3
	 WnkZ5+6ZLfZMJZj7nfGqSoQKfZssM1Ni5hYKOOO7Uud6Di/aoTmjSgg6mhN6HqImCn
	 +KnEMheeVwW3XXS/YADoVqOE6vsrZ3EDLHZ/eHwMiUcLKxIVqdV3Hf+xJ/kmlx1/Ik
	 J1n8vnUFc+p/eMA0M2Ne0DnL1t4JFFg/jMU9KhHEtA12bKyVZDwEd+kYfxR/HJYsyD
	 Aj1/NTcWbRlT2ukDO7nThwbqZe3gkweecDUCuQ5SrnKGLOG5+qozo6tcTSTtO61PrM
	 nSkDdAa67v3Jw==
MIME-Version: 1.0
Date: Wed, 24 Sep 2025 18:06:46 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
 <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
In-Reply-To: <34e1b5036361745db2fde233e0935a568c0ebc90.1758729618.git.oleksii_moisieiev@epam.com>
References: <34e1b5036361745db2fde233e0935a568c0ebc90.1758729618.git.oleksii_moisieiev@epam.com>
Message-ID: <8fd7c0f5d203aa0f13cd8efe5129b6f3@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-09-24 18:00, Oleksii Moisieiev wrote:
> This commit introduces a new Kconfig option, `CONFIG_DOM0_BOOT`, to
> allow for building Xen without support for booting a regular domain 
> (Dom0).
> This functionality is primarily intended for the ARM architecture.
> 
> A new Kconfig symbol, `HAS_DOM0`, has been added and is selected by
> default for ARM and X86 architecture. This symbol signifies that an
> architecture has the capability to support a Dom0.
> 
> The `DOM0_BOOT` option depends on `HAS_DOM0` and defaults to 'y'. For
> expert users, this option can be disabled (`CONFIG_EXPERT=y` and no
> `CONFIG_DOM0_BOOT` in the config), which will compile out the Dom0
> creation code on ARM. This is useful for embedded or dom0less-only
> scenarios to reduce binary size and complexity.
> 
> The ARM boot path has been updated to panic if it detects a 
> non-dom0less
> configuration while `CONFIG_DOM0_BOOT` is disabled, preventing an 
> invalid
> boot.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> 
> ---
> 
> Changes in v3:
> - rephrase error message when dom0less mode wasn't detected while dom0
> is disabled.
> - rephrase help message for DOM0_BOOT config option
> - update DOM0_BOOT dependencies for X86
> 
> Changes in v2:
> - decided not to rename HAS_DOM0 (HAS_OPTIONAL_DOM0 was another option
> suggested in ML) because in this case HAS_DOM0LESS should be renamed
> either.
> - fix order of HAS_DOM0 config parameter
> - add HAS_DOM0 option to x86 architecture.
> 
> CONFIG_DOM0_BOOT Kconfig option was introduced to make the Dom0
> regular (legacy) domain an optional feature that can be compiled out
> from the Xen hypervisor build.
> 
> The primary motivation for this change is to enhance modularity and
> produce a cleaner, more specialized hypervisor binary when a control
> domain is not needed. In many embedded or dedicated systems, Xen is
> used in a "dom0less" configuration where guests are pre-configured and
> launched directly by the hypervisor. In these scenarios, the entire
> subsystem for booting and managing Dom0 is unnecessary.
> 
> This approach aligns with software quality standards like MISRA C,
> which advocate for the removal of unreachable or unnecessary code to
> improve safety and maintainability. Specifically, this change helps 
> adhere to:
> 
> MISRA C:2012, Rule 2.2: "There shall be no dead code"
> 
> In a build configured for a dom0less environment, the code responsible
> for creating Dom0 would be considered "dead code" as it would never be
> executed. By using the preprocessor to remove it before compilation,
> we ensure that the final executable is free from this unreachable
> code. This simplifies static analysis, reduces the attack surface,
> and makes the codebase easier to verify, which is critical for
> systems requiring high levels of safety and security.
> 

Misra's definition of "dead code" is code that is executed, but can be 
removed without changing the behavior of the program, while unreachable 
code is code that is not executed, so I would cite MISRA C Rule 2.1 ("A 
project shall not contain unreachable code"), rather that R2.2.

> ---
>  xen/arch/arm/Kconfig        |  1 +
>  xen/arch/arm/domain_build.c |  8 ++++++++
>  xen/arch/arm/setup.c        | 14 ++++++++++----
>  xen/arch/x86/Kconfig        |  1 +
>  xen/common/Kconfig          | 11 +++++++++++
>  5 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index cf6af68299..336b2ed242 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -17,6 +17,7 @@ config ARM
>  	select GENERIC_UART_INIT
>  	select HAS_ALTERNATIVE if HAS_VMAP
>  	select HAS_DEVICE_TREE_DISCOVERY
> +	select HAS_DOM0
>  	select HAS_DOM0LESS
>  	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
>  	select HAS_STACK_PROTECTOR
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index fb8fbb1650..62602afc78 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -42,8 +42,10 @@
>  #include <asm/grant_table.h>
>  #include <xen/serial.h>
> 
> +#ifdef CONFIG_DOM0_BOOT
>  static unsigned int __initdata opt_dom0_max_vcpus;
>  integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
> +#endif
> 
>  /*
>   * If true, the extended regions support is enabled for dom0 and
> @@ -104,6 +106,7 @@ int __init parse_arch_dom0_param(const char *s, 
> const char *e)
>   */
>  #define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry))
> 
> +#ifdef CONFIG_DOM0_BOOT
>  unsigned int __init dom0_max_vcpus(void)
>  {
>      if ( opt_dom0_max_vcpus == 0 )
> @@ -116,6 +119,7 @@ unsigned int __init dom0_max_vcpus(void)
> 
>      return opt_dom0_max_vcpus;
>  }
> +#endif
> 
>  /*
>   * Insert the given pages into a memory bank, banks are ordered by 
> address.
> @@ -1962,6 +1966,7 @@ int __init construct_domain(struct domain *d, 
> struct kernel_info *kinfo)
>      return 0;
>  }
> 
> +#ifdef CONFIG_DOM0_BOOT
>  static int __init construct_dom0(struct domain *d)
>  {
>      struct kernel_info kinfo = KERNEL_INFO_INIT;
> @@ -1993,6 +1998,7 @@ static int __init construct_dom0(struct domain 
> *d)
> 
>      return construct_hwdom(&kinfo, NULL);
>  }
> +#endif
> 
>  int __init construct_hwdom(struct kernel_info *kinfo,
>                             const struct dt_device_node *node)
> @@ -2046,6 +2052,7 @@ int __init construct_hwdom(struct kernel_info 
> *kinfo,
>      return construct_domain(d, kinfo);
>  }
> 
> +#ifdef CONFIG_DOM0_BOOT
>  void __init create_dom0(void)
>  {
>      struct domain *dom0;
> @@ -2103,6 +2110,7 @@ void __init create_dom0(void)
> 
>      set_xs_domain(dom0);
>  }
> +#endif /* CONFIG_DOM0_BOOT */
> 
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 7ad870e382..fbb290df60 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -481,12 +481,18 @@ void asmlinkage __init noreturn 
> start_xen(unsigned long fdt_paddr)
>      enable_errata_workarounds();
>      enable_cpu_features();
> 
> -    /* Create initial domain 0. */
> -    if ( !is_dom0less_mode() )
> +    if ( IS_ENABLED(CONFIG_DOM0_BOOT) && !is_dom0less_mode() )
> +    {
> +        /* Create initial domain 0. */
>          create_dom0();
> +    }
>      else
> -        printk(XENLOG_INFO "Xen dom0less mode detected\n");
> -
> +    {
> +        if ( is_dom0less_mode())
> +            printk(XENLOG_INFO "Xen dom0less mode detected\n");
> +        else
> +            panic("Neither dom0 nor dom0less mode was detected, 
> aborting\n");
> +    }
>      if ( acpi_disabled )
>      {
>          create_domUs();
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 3f0f3a0f3a..2aeb361c63 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -18,6 +18,7 @@ config X86
>  	select HAS_COMPAT
>  	select HAS_CPUFREQ
>  	select HAS_DIT
> +	select HAS_DOM0
>  	select HAS_EHCI
>  	select HAS_EX_TABLE
>  	select HAS_FAST_MULTIPLY
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 76f9ce705f..10a8fc8718 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -26,6 +26,14 @@ config DOM0LESS_BOOT
>  	  Xen boot without the need of a control domain (Dom0), which could 
> be
>  	  present anyway.
> 
> +config DOM0_BOOT
> +	bool "Dom0 boot support" if EXPERT
> +	default y
> +	depends on (ARM && HAS_DOM0 && HAS_DEVICE_TREE_DISCOVERY && 
> DOMAIN_BUILD_HELPERS) || (X86 && HAS_DOM0)
> +	help
> +	  Dom0 boot support enables Xen to boot to the all-powerful domain 
> (Dom0).
> +	  If this isn't enabled Xen is expected to boot in dom0less mode 
> only.
> +
>  config DOMAIN_BUILD_HELPERS
>  	bool
> 
> @@ -125,6 +133,9 @@ config HAS_DEVICE_TREE_DISCOVERY
>  	bool
>  	select DEVICE_TREE_PARSE
> 
> +config HAS_DOM0
> +	bool
> +
>  config HAS_DOM0LESS
>  	bool

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

