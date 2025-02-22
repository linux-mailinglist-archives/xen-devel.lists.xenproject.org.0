Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA7BA4049D
	for <lists+xen-devel@lfdr.de>; Sat, 22 Feb 2025 02:15:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894735.1303449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tle6c-00075y-5q; Sat, 22 Feb 2025 01:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894735.1303449; Sat, 22 Feb 2025 01:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tle6c-000746-1d; Sat, 22 Feb 2025 01:14:58 +0000
Received: by outflank-mailman (input) for mailman id 894735;
 Sat, 22 Feb 2025 01:14:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLaE=VN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tle6a-000740-Te
 for xen-devel@lists.xenproject.org; Sat, 22 Feb 2025 01:14:56 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c2cff93-f0ba-11ef-9aaa-95dc52dad729;
 Sat, 22 Feb 2025 02:14:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A5D526116F;
 Sat, 22 Feb 2025 01:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9429BC4CEE4;
 Sat, 22 Feb 2025 01:14:51 +0000 (UTC)
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
X-Inumbo-ID: 6c2cff93-f0ba-11ef-9aaa-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740186893;
	bh=67IiDlyvMf4qJC7GAZ1/phZzZL9bdXxjcpkPmBnrFNc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Hw0w2Fd61c1QUqZ60Y+upGrzRFnShnoewx+7QmCnkY+oMx0TJzcDX0k4pEWr7B6pk
	 EBUYg1pjKz2EzsKfmaG6CoYOh/BXUsDThVEgZdlPp1l+jXzgSLL3U7YUpLpE1yXLh3
	 LejF52m6vOy02Y1jgnofcCLbbFw5HJ1cEOVyhxROuipgMHMvJCdpUAQQZ3H+qL/8Ez
	 y/FvaQ0uTGuK7Wd1vrttKPu9tbZJ2QO36QTN0iCE/w7UEEzKbXXNNfaPE8G1nd4Tsv
	 FEO50N1wUH42HfDOpOw5okTXTPhPzBBw6EshHVuqkQow4HALOCDcFg1ZK1yO1aGlGD
	 cx+aFnZvQ3oGQ==
Date: Fri, 21 Feb 2025 17:14:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v2] xen: introduce kconfig options to disable
 hypercalls
In-Reply-To: <20241219092917.3006174-1-Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2502211714250.1791669@ubuntu-linux-20-04-desktop>
References: <20241219092917.3006174-1-Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Dec 2024, Sergiy Kibrik wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> It can be beneficial for some dom0less systems to further reduce Xen footprint
> and disable some hypercalls handling code, which may not to be used & required
> in such systems. Each hypercall has a separate option to keep configuration
> flexible.
> 
> Options to disable hypercalls:
> - domctl, sysctl
> - hvm
> - physdev
> - platform
> 
> Some of these options are forced to be configurable only when DOM0LESS is
> enabled, so that system won't become accidentally un-bootable when any hypercall
> is disabled.
> domctl/sysctl/platform hypercalls also disabled by PV_SHIM_EXCLUSIVE config
> option, so this is reflected by a dependency in kconfig and Makefiles are
> changed accordingly.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> ---
> changes in v2:
>  - SYSCTL & DOMCTL config option dependency on !PV_SHIM_EXCLUSIVE
>  - replace build checks for CONFIG_PV_SHIM_EXCLUSIVE
>  - rename options PLATFORM_HYP -> PLATFORM_OP & PHYSDEV -> PHYSDEV_OP
>  - removed "arm" from subj, as patch becomes not really ARM-specific
>  - updated description
> 
> changes in v1:
>  - incorporated PV_SHIM_EXCLUSIVE check in Kconfig
>  - drop excessive ifeq from Makefile & #ifdef from code
>  - drop checks for CONFIG_HVM_OP & CONFIG_PLATFORM_HYP being off when !DOM0LESS
>  - description updated
> 
> v1 patch here: https://lore.kernel.org/xen-devel/20241216114358.2845447-1-Sergiy_Kibrik@epam.com/
> ---
>  xen/arch/arm/Makefile        | 10 +++++-----
>  xen/arch/x86/Makefile        |  6 +++---
>  xen/common/Kconfig           | 29 +++++++++++++++++++++++++++++
>  xen/common/Makefile          |  4 ++--
>  xen/include/hypercall-defs.c | 24 +++++++++++++++++-------
>  xen/include/xen/domain.h     |  2 +-
>  6 files changed, 57 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index e4ad1ce851..265498fdd2 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -18,7 +18,7 @@ obj-$(CONFIG_IOREQ_SERVER) += dm.o
>  obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
>  obj-y += domain.o
>  obj-y += domain_build.init.o
> -obj-y += domctl.o
> +obj-$(CONFIG_DOMCTL) += domctl.o
>  obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>  obj-y += efi/
>  obj-y += gic.o
> @@ -29,7 +29,7 @@ obj-$(CONFIG_HAS_ITS) += gic-v3-lpi.o
>  obj-y += guestcopy.o
>  obj-y += guest_atomics.o
>  obj-y += guest_walk.o
> -obj-y += hvm.o
> +obj-$(CONFIG_HVM_OP) += hvm.o
>  obj-y += io.o
>  obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
>  obj-y += irq.o
> @@ -40,8 +40,8 @@ obj-y += mm.o
>  obj-y += monitor.o
>  obj-y += p2m.o
>  obj-y += platform.o
> -obj-y += platform_hypercall.o
> -obj-y += physdev.o
> +obj-$(CONFIG_PLATFORM_OP) += platform_hypercall.o
> +obj-$(CONFIG_PHYSDEV_OP) += physdev.o
>  obj-y += processor.o
>  obj-y += psci.o
>  obj-y += setup.o
> @@ -51,7 +51,7 @@ obj-y += smpboot.o
>  obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
>  obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
>  obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
> -obj-y += sysctl.o
> +obj-$(CONFIG_SYSCTL) += sysctl.o
>  obj-y += time.o
>  obj-y += traps.o
>  obj-y += vcpreg.o
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index b35fd5196c..f623bddb1d 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -74,12 +74,12 @@ obj-y += hpet.o
>  obj-y += vm_event.o
>  obj-y += xstate.o
>  
> -ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
> -obj-y += domctl.o
> +obj-$(CONFIG_DOMCTL) += domctl.o
> +ifeq ($(CONFIG_PLATFORM_OP),y)
>  obj-y += platform_hypercall.o
>  obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
> -obj-y += sysctl.o
>  endif
> +obj-$(CONFIG_SYSCTL) += sysctl.o
>  
>  extra-y += asm-macros.i
>  extra-y += xen.lds
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 90268d9249..fd5f54356f 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -516,4 +516,33 @@ config TRACEBUFFER
>  	  to be collected at run time for debugging or performance analysis.
>  	  Memory and execution overhead when not active is minimal.
>  
> +menu "Supported hypercall interfaces"
> +	visible if DOM0LESS_BOOT && EXPERT

One comment: this should not depend on DOM0LESS_BOOT I think


> +config SYSCTL
> +	bool "Enable sysctl hypercall"
> +	depends on !PV_SHIM_EXCLUSIVE
> +	default y
> +
> +config DOMCTL
> +	bool "Enable domctl hypercalls"
> +	depends on !PV_SHIM_EXCLUSIVE
> +	default y
> +
> +config HVM_OP
> +	bool "Enable HVM hypercalls"
> +	depends on HVM
> +	default y
> +
> +config PLATFORM_OP
> +	bool "Enable platform hypercalls"
> +	depends on !PV_SHIM_EXCLUSIVE
> +	default y
> +
> +config PHYSDEV_OP
> +	bool "Enable physdev hypercall"
> +	default y
> +
> +endmenu
> +
>  endmenu
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index b279b09bfb..0893bed6ab 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -66,10 +66,10 @@ obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo un
>  obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
>  
>  ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
> -obj-y += domctl.o
>  obj-y += monitor.o
> -obj-y += sysctl.o
>  endif
> +obj-$(CONFIG_DOMCTL) += domctl.o
> +obj-$(CONFIG_SYSCTL) += sysctl.o
>  
>  extra-y := symbols-dummy.o
>  
> diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
> index 7720a29ade..e4872e7e28 100644
> --- a/xen/include/hypercall-defs.c
> +++ b/xen/include/hypercall-defs.c
> @@ -95,7 +95,7 @@ handle: const_char const char
>  
>  #ifdef CONFIG_COMPAT
>  defhandle: multicall_entry_compat_t
> -#ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +#ifdef CONFIG_PLATFORM_OP
>  defhandle: compat_platform_op_t
>  #endif
>  #endif
> @@ -150,7 +150,7 @@ update_va_mapping(unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags)
>  physdev_op_compat(physdev_op_compat_t *uop)
>  update_va_mapping_otherdomain(unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags, domid_t domid)
>  #endif
> -#ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +#ifdef CONFIG_PLATFORM_OP
>  platform_op(compat_platform_op_t *u_xenpf_op)
>  #endif
>  #ifdef CONFIG_KEXEC
> @@ -194,10 +194,14 @@ kexec_op(unsigned long op, void *uarg)
>  #ifdef CONFIG_IOREQ_SERVER
>  dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
>  #endif
> -#ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +#ifdef CONFIG_SYSCTL
>  sysctl(xen_sysctl_t *u_sysctl)
> +#endif
> +#ifdef CONFIG_DOMCTL
>  domctl(xen_domctl_t *u_domctl)
>  paging_domctl_cont(xen_domctl_t *u_domctl)
> +#endif
> +#ifdef CONFIG_PLATFORM_OP
>  platform_op(xen_platform_op_t *u_xenpf_op)
>  #endif
>  #ifdef CONFIG_HVM
> @@ -234,7 +238,7 @@ stack_switch                       do:2     do:2     -        -        -
>  set_callbacks                      compat   do       -        -        -
>  fpu_taskswitch                     do       do       -        -        -
>  sched_op_compat                    do       do       -        -        dep
> -#ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +#ifdef CONFIG_PLATFORM_OP
>  platform_op                        compat   do       compat   do       do
>  #endif
>  set_debugreg                       do       do       -        -        -
> @@ -247,7 +251,9 @@ set_timer_op                       compat   do       compat   do       -
>  event_channel_op_compat            do       do       -        -        dep
>  xen_version                        do       do       do       do       do
>  console_io                         do       do       do       do       do
> +#ifdef CONFIG_PHYSDEV_OP
>  physdev_op_compat                  compat   do       -        -        dep
> +#endif
>  #if defined(CONFIG_GRANT_TABLE)
>  grant_table_op                     compat   do       hvm      hvm      do
>  #elif defined(CONFIG_PV_SHIM)
> @@ -269,12 +275,16 @@ callback_op                        compat   do       -        -        -
>  xenoprof_op                        compat   do       -        -        -
>  #endif
>  event_channel_op                   do       do       do:1     do:1     do:1
> +#ifdef CONFIG_PHYSDEV_OP
>  physdev_op                         compat   do       hvm      hvm      do_arm
> -#ifdef CONFIG_HVM
> +#endif
> +#ifdef CONFIG_HVM_OP
>  hvm_op                             do       do       do       do       do
>  #endif
> -#ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +#ifdef CONFIG_SYSCTL
>  sysctl                             do       do       do       do       do
> +#endif
> +#ifdef CONFIG_DOMCTL
>  domctl                             do       do       do       do       do
>  #endif
>  #ifdef CONFIG_KEXEC
> @@ -292,7 +302,7 @@ dm_op                              compat   do       compat   do       do
>  hypfs_op                           do       do       do       do       do
>  #endif
>  mca                                do       do       -        -        -
> -#ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +#ifdef CONFIG_DOMCTL
>  paging_domctl_cont                 do       do       do       do       -
>  #endif
>  
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 3de5635291..62b5d70a8a 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -161,7 +161,7 @@ struct vnuma_info {
>      struct xen_vmemrange *vmemrange;
>  };
>  
> -#ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +#ifdef CONFIG_DOMCTL
>  void vnuma_destroy(struct vnuma_info *vnuma);
>  #else
>  static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma); }
> -- 
> 2.25.1
> 

