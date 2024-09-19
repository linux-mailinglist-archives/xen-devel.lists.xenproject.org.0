Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8D197C942
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 14:34:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800738.1210728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srGM7-0003iD-K5; Thu, 19 Sep 2024 12:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800738.1210728; Thu, 19 Sep 2024 12:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srGM7-0003gS-HH; Thu, 19 Sep 2024 12:33:55 +0000
Received: by outflank-mailman (input) for mailman id 800738;
 Thu, 19 Sep 2024 12:33:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1srGM6-0003gL-OB
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 12:33:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1srGM6-0005mu-8y; Thu, 19 Sep 2024 12:33:54 +0000
Received: from [83.68.141.146] (helo=[10.134.2.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1srGM6-0000Ks-1O; Thu, 19 Sep 2024 12:33:54 +0000
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
	bh=HxsKKjNZH9EWFlY5hXDfct+SjtypJg8Gz4zwLy7OJ2E=; b=CiXnf7Xmi+3ydpT6n8aLULZ7+T
	zsmmp5egM3JVihf+I3xdghLUVqgSserQ4qdcB7U3dwsALHkdwjSLjt+iF7itaGf2Gcy4EXaUeySTK
	IE4dXx7WKueNeTZysyuOmJ5dUCf9P1O9WEwwwmerJtMxT46hJ2J3kQc73EjxqAr7j6vM=;
Message-ID: <e32674d8-4c3c-4eda-9300-35130e048a05@xen.org>
Date: Thu, 19 Sep 2024 14:33:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm: mpu: Introduce choice between MMU and MPU
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-2-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240918175102.223076-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 18/09/2024 19:50, Ayan Kumar Halder wrote:
> There are features in the forthcoming patches which are dependent on
> MPU. For eg fixed start address.
> Also, some of the Xen features (eg STATIC_MEMORY) will be selected
> by the MPU configuration.
> 
> Thus, this patch introduces a choice between MMU and MPU for the type
> of memory management system. By default, MMU is selected.
> MPU is now gated by UNSUPPORTED.
> 
> Updated SUPPORT.md to state that the support for MPU is experimental.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
> 
> v1 - 1. Reworded the help messages.
> 2. Updated Support.md.
> 
>   SUPPORT.md                     |  1 +
>   xen/arch/arm/Kconfig           | 16 +++++++++++++++-
>   xen/arch/arm/platforms/Kconfig |  2 +-
>   3 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 23dd7e6424..3f6d788a43 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -40,6 +40,7 @@ supported in this document.
>   
>       Status, Xen in AArch64 mode: Supported
>       Status, Xen in AArch32 mode: Tech Preview
> +    Status, Xen with MPU: Experimental
>       Status, Cortex A57 r0p0-r1p1: Supported, not security supported
>       Status, Cortex A77 r0p0-r1p0: Supported, not security supported
>   
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 323c967361..e881f5ba57 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -58,10 +58,24 @@ config PADDR_BITS
>   	default 40 if ARM_PA_BITS_40
>   	default 48 if ARM_64
>   
> +choice
> +	prompt "Memory management system"
> +	default MMU if ARM
> +	help
> +	  User can choose between the different forms of memory management system.
> +
>   config MMU
> -	def_bool y
> +	bool "MMU"
>   	select HAS_PMAP
>   	select HAS_VMAP
> +	help
> +	  Select it if you plan to run Xen on A-profile Armv7+
> +
> +config MPU
> +	bool "MPU" if UNSUPPORTED
> +	help
> +	  Memory protection unit is supported on some Armv8-R systems (UNSUPPORTED).

I am a bit confused with this statement. Does this mean that not all 
Armv8-R supports MPU? Or are you trying to say that not all of them 
support EL2?

If the former, we probably want to check pretty early during boot that 
the an MPU is present *and* we have enough regions.

> +endchoice
>   
>   source "arch/Kconfig"
>   
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index 76f7e76b1b..02322c259c 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -1,5 +1,5 @@
>   choice
> -	prompt "Platform Support"
> +	prompt "Platform Support" if MMU
>   	default ALL_PLAT
>   	help
>   	Choose which hardware platform to enable in Xen.

Cheers,

-- 
Julien Grall


