Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC60509421
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 02:18:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309684.526104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhKW8-0005MP-IG; Thu, 21 Apr 2022 00:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309684.526104; Thu, 21 Apr 2022 00:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhKW8-0005KZ-Dg; Thu, 21 Apr 2022 00:17:52 +0000
Received: by outflank-mailman (input) for mailman id 309684;
 Thu, 21 Apr 2022 00:17:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45zg=U7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nhKW7-0005KP-Bq
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 00:17:51 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a649acd-c108-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 02:17:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 979BFB82144;
 Thu, 21 Apr 2022 00:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E589CC385A0;
 Thu, 21 Apr 2022 00:17:47 +0000 (UTC)
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
X-Inumbo-ID: 7a649acd-c108-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650500268;
	bh=NWF8OHvmAnZ/tFu+kHeaLBtgsCFjPSwiXspk4eGd9oI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X0oPAqgK0ma7aXFfDBfXKVxyyA74oLxu6T/JcUf4zf//iHQpbJIx4Spo9+EWYO98V
	 HtBcVr+tAFkMI2YnB0iRCRqusWEkTlAPMEn08i2lB0xhT3efiHV1+4ufaaJduUvIxp
	 FC0C/3ntqpvgxrgHb4wJTZM7odPCfwcScL9TjrXxZKJFQQQCloY79lf5k8aqfaWUpx
	 E9MATHoEfM1nQOgBVNCB2e2rA6CbKTsQ7SlupXsLclbzUvY1w8witixL1iWy8tpgyp
	 dPhf+nF2Un+EgzbkBZBomogiCRnSs4SVV0carc2//7boJkwc/209Q38jDiRgOU5TSU
	 WdJtuqNYsa5Dg==
Date: Wed, 20 Apr 2022 17:17:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, nd@arm.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 02/10] xen/x86: move reusable EFI stub functions from
 x86 to common
In-Reply-To: <20220418090735.3940393-3-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204201717320.915916@ubuntu-linux-20-04-desktop>
References: <20220418090735.3940393-1-wei.chen@arm.com> <20220418090735.3940393-3-wei.chen@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Apr 2022, Wei Chen wrote:
> Most of the functions in x86 EFI stub.c can be reused for other
> architectures. So we move them to common and keep the x86 specific
> function in stub-x86.c.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v1 -> v2:
> 1. Drop the copy of stub.c from Arm EFI.
> 2. Share common codes of x86 EFI stub for other architectures.
> ---
>  xen/arch/x86/efi/Makefile               |  4 +--
>  xen/arch/x86/efi/{stub.c => stub-x86.c} | 37 ------------------------
>  xen/common/efi/stub.c                   | 38 +++++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 39 deletions(-)
>  rename xen/arch/x86/efi/{stub.c => stub-x86.c} (71%)
>  create mode 100644 xen/common/efi/stub.c
> 
> diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
> index 034ec87895..5ca3a0b4a4 100644
> --- a/xen/arch/x86/efi/Makefile
> +++ b/xen/arch/x86/efi/Makefile
> @@ -11,8 +11,8 @@ $(obj)/boot.init.o: $(obj)/buildid.o
>  $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
>  $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary := $(cflags-stack-boundary)
>  
> -obj-y := stub.o
> +obj-y := stub.o stub-x86.o
>  obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
>  obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))
>  extra-$(XEN_BUILD_EFI) += buildid.o relocs-dummy.o
> -nocov-$(XEN_BUILD_EFI) += stub.o
> +nocov-$(XEN_BUILD_EFI) += stub.o stub-x86.o
> diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub-x86.c
> similarity index 71%
> rename from xen/arch/x86/efi/stub.c
> rename to xen/arch/x86/efi/stub-x86.c
> index 9984932626..2cd5c8d4dc 100644
> --- a/xen/arch/x86/efi/stub.c
> +++ b/xen/arch/x86/efi/stub-x86.c
> @@ -1,7 +1,5 @@
>  #include <xen/efi.h>
> -#include <xen/errno.h>
>  #include <xen/init.h>
> -#include <xen/lib.h>
>  #include <asm/asm_defns.h>
>  #include <asm/efibind.h>
>  #include <asm/page.h>
> @@ -45,11 +43,6 @@ void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
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
> @@ -61,33 +54,3 @@ bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
>  }
>  
>  void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e) { }
> -
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
> -int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *)
> -    __attribute__((__alias__("efi_get_info")));
> -
> -int efi_runtime_call(struct xenpf_efi_runtime_call *op)
> -{
> -    return -ENOSYS;
> -}
> -
> -int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *)
> -    __attribute__((__alias__("efi_runtime_call")));
> diff --git a/xen/common/efi/stub.c b/xen/common/efi/stub.c
> new file mode 100644
> index 0000000000..6e4f4de9af
> --- /dev/null
> +++ b/xen/common/efi/stub.c
> @@ -0,0 +1,38 @@
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
> +int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *)
> +    __attribute__((__alias__("efi_get_info")));
> +
> +int efi_runtime_call(struct xenpf_efi_runtime_call *op)
> +{
> +    return -ENOSYS;
> +}
> +
> +int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *)
> +    __attribute__((__alias__("efi_runtime_call")));
> -- 
> 2.25.1
> 
> 

