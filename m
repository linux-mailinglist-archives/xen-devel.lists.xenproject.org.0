Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1733C75C20C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 10:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567416.886428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMlsY-0007lj-LR; Fri, 21 Jul 2023 08:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567416.886428; Fri, 21 Jul 2023 08:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMlsY-0007ik-IE; Fri, 21 Jul 2023 08:52:50 +0000
Received: by outflank-mailman (input) for mailman id 567416;
 Fri, 21 Jul 2023 08:52:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMlsW-0007ie-RQ
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 08:52:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMlsW-0007rw-Ct; Fri, 21 Jul 2023 08:52:48 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMlsW-0004By-7H; Fri, 21 Jul 2023 08:52:48 +0000
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
	bh=TlGKmbwX3f8XBlhhUlbOJdwbfnLm07TPPMBsxvnMs5Q=; b=rMFRva9QZu2ktAr2mNGHFVMqC/
	JKH8WdV7FVK5TofM7JxembEF0EQvFSfSb0z9zFBTBUYCDBpvffbhFMRLvpzcXAQC2fcYmB4hW41po
	kZRQqtjgVA3NZz0d1VdaTB+TXLefcrSBafEKPMPnrvgJUMAGZqV5OIKds1gU5ONEGcfE=;
Message-ID: <fa58a361-939c-6114-263f-0640156c235b@xen.org>
Date: Fri, 21 Jul 2023 09:52:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH] xen/arm: Move TEE mediators in a kconfig submenu
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <a44f74559f52d1fa90a3f77390e7d121c9cd848e.1689926422.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a44f74559f52d1fa90a3f77390e7d121c9cd848e.1689926422.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 21/07/2023 09:02, Bertrand Marquis wrote:
> Rework TEE mediators to put them under a submenu in Kconfig.
> The submenu is only visible if UNSUPPORTED is activated as all currently
> existing mediators are UNSUPPORTED.
> 
> While there rework a bit the configuration so that OP-TEE and FF-A
> mediators are selecting the generic TEE interface instead of depending
> on it.
> Make the TEE option hidden as it is of no interest for anyone to select
> it without one of the mediators so having them select it instead should
> be enough.
> Rework makefile inclusion and selection so that generic TEE is included
> only when selected and include the tee Makefile all the time making the
> directory tee self contained.
The problem is now we will always recurse to the directory even if there 
is nothing to build. I would rather prefer reducing the build time (even 
if here it would be minimal) over "self-contained" directory.

> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

I wasn't able to apply this patch cleanly on the latest staging.

> ---
>   xen/arch/arm/Kconfig      |  7 -------
>   xen/arch/arm/Makefile     |  2 +-
>   xen/arch/arm/tee/Kconfig  | 18 ++++++++++++++++--
>   xen/arch/arm/tee/Makefile |  2 +-
>   4 files changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 439cc94f3344..fd57a82dd284 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -175,13 +175,6 @@ config ARM64_BTI
>   	  Branch Target Identification support.
>   	  This feature is not supported in Xen.
>   
> -config TEE
> -	bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
> -	default n
> -	help
> -	  This option enables generic TEE mediators support. It allows guests
> -	  to access real TEE via one of TEE mediators implemented in XEN.
> -
>   source "arch/arm/tee/Kconfig"
>   
>   config STATIC_SHM
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 7bf07e992046..d47d5c20aa73 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -5,7 +5,7 @@ obj-$(CONFIG_HAS_PCI) += pci/
>   ifneq ($(CONFIG_NO_PLAT),y)
>   obj-y += platforms/
>   endif
> -obj-$(CONFIG_TEE) += tee/
> +obj-y += tee/
>   obj-$(CONFIG_HAS_VPCI) += vpci.o
>   
>   obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
> index 923f08ba8cb7..cecbf7e12b43 100644
> --- a/xen/arch/arm/tee/Kconfig
> +++ b/xen/arch/arm/tee/Kconfig
> @@ -1,7 +1,17 @@
> +menu "TEE mediators"
> +	visible if UNSUPPORTED
> +
> +config TEE
> +	bool
> +	default n
> +	help
> +	  This option enables generic TEE mediators support. It allows guests
> +	  to access real TEE via one of TEE mediators implemented in XEN.

We don't typically add an 'help' section for non-select option. In fact, 
it looks like menuconfig will not show the 'help'.

> +
>   config OPTEE
> -	bool "Enable OP-TEE mediator"
> +	bool "Enable OP-TEE mediator (UNSUPPORTED)" if UNSUPPORTED

Given this is under 'TEE mediators', do we still need the 'if UNSUPPORTED'?

>   	default n
> -	depends on TEE
> +	select TEE

I was sort of hoping we could remove 'select TEE'. But I understand why 
you did it that way, you have one less selection to do. So I am Ok with 
that.

>   	help
>   	  Enable the OP-TEE mediator. It allows guests to access
>   	  OP-TEE running on your platform. This requires
> @@ -13,9 +23,13 @@ config FFA
>   	bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED
>   	default n
>   	depends on ARM_64
> +	select TEE
>   	help
>   	  This option enables a minimal FF-A mediator. The mediator is
>   	  generic as it follows the FF-A specification [1], but it only
>   	  implements a small subset of the specification.
>   
>   	  [1] https://developer.arm.com/documentation/den0077/latest
> +
> +endmenu
> +
> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
> index 58a1015e40e0..1ef49a271fdb 100644
> --- a/xen/arch/arm/tee/Makefile
> +++ b/xen/arch/arm/tee/Makefile
> @@ -1,3 +1,3 @@
>   obj-$(CONFIG_FFA) += ffa.o
> -obj-y += tee.o
> +obj-$(CONFIG_TEE) += tee.o
>   obj-$(CONFIG_OPTEE) += optee.o

Cheers,

-- 
Julien Grall

