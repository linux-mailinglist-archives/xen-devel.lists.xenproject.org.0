Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36595258FB
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 02:33:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328083.551003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npJFf-0004RO-BC; Fri, 13 May 2022 00:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328083.551003; Fri, 13 May 2022 00:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npJFf-0004Pa-6i; Fri, 13 May 2022 00:33:51 +0000
Received: by outflank-mailman (input) for mailman id 328083;
 Fri, 13 May 2022 00:33:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npJFe-0004NS-5k
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 00:33:50 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b28d3cd-d254-11ec-8fc4-03012f2f19d4;
 Fri, 13 May 2022 02:33:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6B10DB82910;
 Fri, 13 May 2022 00:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5EA6C385B8;
 Fri, 13 May 2022 00:33:46 +0000 (UTC)
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
X-Inumbo-ID: 5b28d3cd-d254-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652402027;
	bh=0a9RljrqdnoGvOyCZreIEw76Ve51f4TbMzy0QGHf4qY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aGM8gHmnZm8qcTel8TDv4cid04RpmQCQ7G7vunPLYljWsQ//vIQy/9DVumZObDCBr
	 2qIRzKqstHjKrIzCgeFk80wtZgkbWp9eSBa1KZ53iozKb55H9f6RenwCy6r0PKsXFh
	 tWOy9yUS0pN7YkRlw9InaUYua1tAlbmIX4o8ylEWtFs60lUatviogHaI4fP8mxIF2r
	 AZuovRXQwmvxVs/wnjw22zbCdL2u9pdafE8Pwwjpdl085ZjxtDT+C8U4Pys9jdMqFJ
	 l4apYYNNqknrB4U/heJfEmQ3zRx9jq/2+UtgzI3+T/joWCG+iYPXOV8yaX73i7pI4/
	 ya3dyUU6Ilg3A==
Date: Thu, 12 May 2022 17:33:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, nd@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>
Subject: Re: [PATCH v3 2/9] xen: reuse x86 EFI stub functions for Arm
In-Reply-To: <20220511014639.197825-3-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205121733290.3842@ubuntu-linux-20-04-desktop>
References: <20220511014639.197825-1-wei.chen@arm.com> <20220511014639.197825-3-wei.chen@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 May 2022, Wei Chen wrote:
> x86 is using compiler feature testing to decide EFI build
> enable or not. When EFI build is disabled, x86 will use an
> efi/stub.c file to replace efi/runtime.c for build objects.
> Following this idea, we introduce a stub file for Arm, but
> use CONFIG_ARM_EFI to decide EFI build enable or not.
> 
> And the most functions in x86 EFI stub.c can be reused for
> other architectures, like Arm. So we move them to common
> and keep the x86 specific function in x86/efi/stub.c.
> 
> To avoid the symbol link conflict error when linking common
> stub files to x86/efi. We add a regular file check in efi
> stub files' link script. Depends on this check we can bypass
> the link behaviors for existed stub files in x86/efi.
> 
> As there is no Arm specific EFI stub function for Arm in
> current stage, Arm still can use the existed symbol link
> method for EFI stub files.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Tested-by: Jiamei Xie <jiamei.xie@arm.com>

The ARM side looks OK to me, I'll let Jan comment on the x86 side.

> ---
> v2 -> v3:
> 1. Add existed file check, if a regular stub files,
>    the common/stub files' link will be ignored.
> 2. Keep stub.c in x86/efi to include common/efi/stub.c
> 3. Restore efi_compat_xxx stub functions to x86/efi.c.
>    Other architectures will not use efi_compat_xxx.
> 4. Remove ARM_EFI dependency from ARM_64.
> 5. Add comment for adding stub.o to EFIOBJ-y.
> 6. Merge patch#2 and patch#3 to one patch.
> v1 -> v2:
> 1. Drop the copy of stub.c from Arm EFI.
> 2. Share common codes of x86 EFI stub for other architectures.
> 3. Use CONFIG_ARM_EFI to replace CONFIG_EFI
> 4. Remove help text and make CONFIG_ARM_EFI invisible.
> 5. Merge one following patch:
>    xen/arm: introduce a stub file for non-EFI architectures
> 6. Use the common stub.c instead of creating new one.
> ---
>  xen/arch/arm/Kconfig         |  4 ++++
>  xen/arch/arm/Makefile        |  2 +-
>  xen/arch/arm/efi/Makefile    |  8 ++++++++
>  xen/arch/x86/efi/stub.c      | 32 +-------------------------------
>  xen/common/efi/efi-common.mk |  3 ++-
>  xen/common/efi/stub.c        | 32 ++++++++++++++++++++++++++++++++
>  6 files changed, 48 insertions(+), 33 deletions(-)
>  create mode 100644 xen/common/efi/stub.c
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4..8a16d43bd5 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -6,6 +6,7 @@ config ARM_64
>  	def_bool y
>  	depends on !ARM_32
>  	select 64BIT
> +	select ARM_EFI
>  	select HAS_FAST_MULTIPLY
>  
>  config ARM
> @@ -33,6 +34,9 @@ config ACPI
>  	  Advanced Configuration and Power Interface (ACPI) support for Xen is
>  	  an alternative to device tree on ARM64.
>  
> +config ARM_EFI
> +	bool
> +
>  config GICV3
>  	bool "GICv3 driver"
>  	depends on ARM_64 && !NEW_VGIC
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 1d862351d1..bb7a6151c1 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -1,6 +1,5 @@
>  obj-$(CONFIG_ARM_32) += arm32/
>  obj-$(CONFIG_ARM_64) += arm64/
> -obj-$(CONFIG_ARM_64) += efi/
>  obj-$(CONFIG_ACPI) += acpi/
>  obj-$(CONFIG_HAS_PCI) += pci/
>  ifneq ($(CONFIG_NO_PLAT),y)
> @@ -20,6 +19,7 @@ obj-y += domain.o
>  obj-y += domain_build.init.o
>  obj-y += domctl.o
>  obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
> +obj-y += efi/
>  obj-y += gic.o
>  obj-y += gic-v2.o
>  obj-$(CONFIG_GICV3) += gic-v3.o
> diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
> index 4313c39066..dffe72e589 100644
> --- a/xen/arch/arm/efi/Makefile
> +++ b/xen/arch/arm/efi/Makefile
> @@ -1,4 +1,12 @@
>  include $(srctree)/common/efi/efi-common.mk
>  
> +ifeq ($(CONFIG_ARM_EFI),y)
>  obj-y += $(EFIOBJ-y)
>  obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
> +else
> +# Add stub.o to EFIOBJ-y to re-use the clean-files in
> +# efi-common.mk. Otherwise the link of stub.c in arm/efi
> +# will not be cleaned in "make clean".
> +EFIOBJ-y += stub.o
> +obj-y += stub.o
> +endif
> diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub.c
> index 9984932626..f2365bc041 100644
> --- a/xen/arch/x86/efi/stub.c
> +++ b/xen/arch/x86/efi/stub.c
> @@ -1,7 +1,5 @@
>  #include <xen/efi.h>
> -#include <xen/errno.h>
>  #include <xen/init.h>
> -#include <xen/lib.h>
>  #include <asm/asm_defns.h>
>  #include <asm/efibind.h>
>  #include <asm/page.h>
> @@ -10,6 +8,7 @@
>  #include <efi/eficon.h>
>  #include <efi/efidevp.h>
>  #include <efi/efiapi.h>
> +#include "../../../common/efi/stub.c"
>  
>  /*
>   * Here we are in EFI stub. EFI calls are not supported due to lack
> @@ -45,11 +44,6 @@ void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
>      unreachable();
>  }
>  
> -bool efi_enabled(unsigned int feature)
> -{
> -    return false;
> -}
> -
>  void __init efi_init_memory(void) { }
>  
>  bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
> @@ -62,32 +56,8 @@ bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
>  
>  void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e) { }
>  
> -bool efi_rs_using_pgtables(void)
> -{
> -    return false;
> -}
> -
> -unsigned long efi_get_time(void)
> -{
> -    BUG();
> -    return 0;
> -}
> -
> -void efi_halt_system(void) { }
> -void efi_reset_system(bool warm) { }
> -
> -int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
> -{
> -    return -ENOSYS;
> -}
> -
>  int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *)
>      __attribute__((__alias__("efi_get_info")));
>  
> -int efi_runtime_call(struct xenpf_efi_runtime_call *op)
> -{
> -    return -ENOSYS;
> -}
> -
>  int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *)
>      __attribute__((__alias__("efi_runtime_call")));
> diff --git a/xen/common/efi/efi-common.mk b/xen/common/efi/efi-common.mk
> index 4298ceaee7..3a5b9958b3 100644
> --- a/xen/common/efi/efi-common.mk
> +++ b/xen/common/efi/efi-common.mk
> @@ -9,7 +9,8 @@ CFLAGS-y += -iquote $(srcdir)
>  # e.g.: It transforms "dir/foo/bar" into successively
>  #       "dir foo bar", ".. .. ..", "../../.."
>  $(obj)/%.c: $(srctree)/common/efi/%.c FORCE
> -	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
> +	$(Q)test -f $@ || \
> +	ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
>  
>  clean-files += $(patsubst %.o, %.c, $(EFIOBJ-y:.init.o=.o) $(EFIOBJ-))
>  
> diff --git a/xen/common/efi/stub.c b/xen/common/efi/stub.c
> new file mode 100644
> index 0000000000..15694632c2
> --- /dev/null
> +++ b/xen/common/efi/stub.c
> @@ -0,0 +1,32 @@
> +#include <xen/efi.h>
> +#include <xen/errno.h>
> +#include <xen/lib.h>
> +
> +bool efi_enabled(unsigned int feature)
> +{
> +    return false;
> +}
> +
> +bool efi_rs_using_pgtables(void)
> +{
> +    return false;
> +}
> +
> +unsigned long efi_get_time(void)
> +{
> +    BUG();
> +    return 0;
> +}
> +
> +void efi_halt_system(void) { }
> +void efi_reset_system(bool warm) { }
> +
> +int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
> +{
> +    return -ENOSYS;
> +}
> +
> +int efi_runtime_call(struct xenpf_efi_runtime_call *op)
> +{
> +    return -ENOSYS;
> +}
> -- 
> 2.25.1
> 

