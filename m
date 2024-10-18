Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8269A40C1
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 16:09:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821979.1235976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1nf4-0002gt-RG; Fri, 18 Oct 2024 14:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821979.1235976; Fri, 18 Oct 2024 14:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1nf4-0002et-OM; Fri, 18 Oct 2024 14:09:02 +0000
Received: by outflank-mailman (input) for mailman id 821979;
 Fri, 18 Oct 2024 14:09:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t1nf3-0002el-1g
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 14:09:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1nf2-0005iv-Ne; Fri, 18 Oct 2024 14:09:00 +0000
Received: from [2a02:8012:3a1:0:ecee:6c05:256c:cbd3]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1nf2-0002OW-HS; Fri, 18 Oct 2024 14:09:00 +0000
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
	bh=bImrkhUb8P5oWUkPjvbqEfY7hYNffhxA+JC4XOOsqDs=; b=mPbrXLOL98OWQlGSeYVGCYcyDx
	kpEhTlo6eb7IQLvpbwPuAWxGoiV1iw9Z5OB1mHhvl0BhL02JrLDq7pW4tZ3vfEJZSKxBCUGSekheJ
	OWa9vmEQS9YLRKXcNxhbf2iIm/R8vJlPs3YWSJFlM+s7fJG8N/VI56HdHyYXNW+vm5hA=;
Message-ID: <a2ba4e14-cede-4b30-a67a-790f4a55f3a6@xen.org>
Date: Fri, 18 Oct 2024 15:08:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] xen/arm: mpu: Introduce choice between MMU and MPU
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241010140351.309922-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/10/2024 15:03, Ayan Kumar Halder wrote:
> There are features in the forthcoming patches which are dependent on
> MPU. For eg fixed start address.
> Also, some of the Xen features (eg STATIC_MEMORY) will be selected
> by the MPU configuration.
> 
> Thus, this patch introduces a choice between MMU and MPU for the type
> of memory management system. By default, MMU is selected.
> MPU is now gated by UNSUPPORTED.
> 
> Update SUPPORT.md to state that the support for MPU is experimental.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

With one remark below:

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> Changes from :-
> 
> v1 - 1. Reworded the help messages.
> 2. Updated Support.md.
> 
> v2 - 1. Reworded the help message.
> 
>   SUPPORT.md                     |  1 +
>   xen/arch/arm/Kconfig           | 17 ++++++++++++++++-
>   xen/arch/arm/platforms/Kconfig |  2 +-
>   3 files changed, 18 insertions(+), 2 deletions(-)
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

Maybe mention Armv8-R?

>       Status, Cortex A57 r0p0-r1p1: Supported, not security supported
>       Status, Cortex A77 r0p0-r1p0: Supported, not security supported
>   
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 323c967361..ed92eb67cb 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -58,10 +58,25 @@ config PADDR_BITS
>   	default 40 if ARM_PA_BITS_40
>   	default 48 if ARM_64
>   
> +choice
> +	prompt "Memory management system"
> +	default MMU
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
> +	  Memory Protection Unit (MPU). Select if you plan to run Xen on ARMv8-R
> +	  systems supporting EL2. (UNSUPPORTED)
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

-- 
Julien Grall


