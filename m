Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A48B747A0E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 00:13:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558737.873094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGoGE-0007tQ-Kd; Tue, 04 Jul 2023 22:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558737.873094; Tue, 04 Jul 2023 22:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGoGE-0007qQ-HI; Tue, 04 Jul 2023 22:12:38 +0000
Received: by outflank-mailman (input) for mailman id 558737;
 Tue, 04 Jul 2023 22:12:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGoGC-0007qI-UU
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 22:12:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGoGC-0004Zj-AR; Tue, 04 Jul 2023 22:12:36 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGoGC-0000Q9-3o; Tue, 04 Jul 2023 22:12:36 +0000
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
	bh=p0QJp4Pxt/xIl8/popR1R9Tv9brAC1FHRxiDUoUOtjo=; b=Nldab+1u2NWvoKW4dS1NN2O1HA
	7igDjsYJy6m4XapmB6q1PDXqBl6rnCGvixBb7u6dZ5c2BmojzVnZuhUNG6xYG0evW5kuEkESREd9o
	bMDGyUwafp5yl2YFrIlzTO7K/b/4RXvukqM83DPtv/jjMqApmJGNF/4LP+VBye4cuJ/0=;
Message-ID: <1be18c29-511e-27eb-0970-adaa1c74ce82@xen.org>
Date: Tue, 4 Jul 2023 23:12:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 11/52] xen/arm: mmu: fold FIXMAP into MMU system
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-12-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230626033443.2943270-12-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/06/2023 04:34, Penny Zheng wrote:
> FIXMAP in MMU system is used to do special-purpose 4K mapping, like
> mapping early UART, temporarily mapping source codes for copy and paste
> (copy_from_paddr), etc.
> 
> As FIXMAP feature is highly dependent on virtual address translation, we
> introduce a new Kconfig CONFIG_HAS_FIXMAP to wrap all releated codes, then
> we fold it into MMU system.
> Since PMAP relies on FIXMAP, so we fold it too into MMU system.
> 
> Under !CONFIG_HAS_FIXMAP, we provide empty stubbers for not breaking
> compilation.

Looking at the end result, I can't find any use of set_fixmap() in the 
common code. So I am not sure this is warrant to provide any stubs (see 
above).

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v1 -> v2
> - new patch
> ---
> v3:
> - fold CONFIG_HAS_FIXMAP into CONFIG_HAS_MMU
> - change CONFIG_HAS_FIXMAP to an Arm-specific Kconfig
> ---
>   xen/arch/arm/Kconfig              |  7 ++++++-
>   xen/arch/arm/include/asm/fixmap.h | 31 ++++++++++++++++++++++++++++---
>   2 files changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index fb77392b82..22b28b8ba2 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -15,7 +15,6 @@ config ARM
>   	select HAS_DEVICE_TREE
>   	select HAS_PASSTHROUGH
>   	select HAS_PDX
> -	select HAS_PMAP
>   	select IOMMU_FORCE_PT_SHARE
>   
>   config ARCH_DEFCONFIG
> @@ -63,11 +62,17 @@ source "arch/Kconfig"
>   config HAS_MMU
>   	bool "Memory Management Unit support in a VMSA system"
>   	default y
> +	select HAS_PMAP
>   	help
>   	  In a VMSA system, a Memory Management Unit (MMU) provides fine-grained control of
>   	  a memory system through a set of virtual to physical address mappings and associated memory
>   	  properties held in memory-mapped tables known as translation tables.
>   
> +config HAS_FIXMAP
> +	bool "Provide special-purpose 4K mapping slots in a VMSA"


Regardless what I wrote above, I don't think a developer should be able 
to disable HAS_FIXMAP when the HAS_MMU is used. So the 3 lines should be 
replaced with:

def_bool HAS_MMU

> +	depends on HAS_MMU
> +	default y
> +
>   config ACPI
>   	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
>   	depends on ARM_64
> diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
> index d0c9a52c8c..1b5b62866b 100644
> --- a/xen/arch/arm/include/asm/fixmap.h
> +++ b/xen/arch/arm/include/asm/fixmap.h
> @@ -4,9 +4,6 @@
>   #ifndef __ASM_FIXMAP_H
>   #define __ASM_FIXMAP_H
>   
> -#include <xen/acpi.h>
> -#include <xen/pmap.h>
> -
>   /* Fixmap slots */
>   #define FIXMAP_CONSOLE  0  /* The primary UART */
>   #define FIXMAP_MISC     1  /* Ephemeral mappings of hardware */
> @@ -22,6 +19,11 @@
>   
>   #ifndef __ASSEMBLY__
>   
> +#ifdef CONFIG_HAS_FIXMAP
> +
> +#include <xen/acpi.h>
> +#include <xen/pmap.h>
> +
>   /*
>    * Direct access to xen_fixmap[] should only happen when {set,
>    * clear}_fixmap() is unusable (e.g. where we would end up to
> @@ -43,6 +45,29 @@ static inline unsigned int virt_to_fix(vaddr_t vaddr)
>       return ((vaddr - FIXADDR_START) >> PAGE_SHIFT);
>   }
>   
> +#else /* !CONFIG_HAS_FIXMAP */
> +
> +#include <xen/mm-frame.h>
> +#include <xen/errno.h>

I think they should be included outside of #ifdef.

> +
> +static inline void set_fixmap(unsigned int map, mfn_t mfn,
> +                              unsigned int attributes)
> +{
> +    ASSERT_UNREACHABLE();
> +}

If there is an interest to have a stub, then I think we should be using 
BUG() because if this gets call, then it would likely crash right after 
when the user tries to access it.

> +
> +static inline void clear_fixmap(unsigned int map)
> +{
> +    ASSERT_UNREACHABLE();

This one might be OK with ASSERT_UNREACHABLE(). Yet, it might be best to 
use BUG() as nobody should use it.

> +}
> +
> +static inline unsigned int virt_to_fix(vaddr_t vaddr)
> +{
> +    ASSERT_UNREACHABLE();
> +    return -EINVAL;

This is a bit of a random value. This may or may not be mapped. And 
therefore any user of the return may or may not crash.

Overall, it feels like we are trying to just please the compiler by 
writing bogus stubs. It is going to be hard to get them correct. So it 
would be better if we have no use of the 3 helpers in the common code.


> +}
> +#endif /* !CONFIG_HAS_FIXMAP */
> +
>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* __ASM_FIXMAP_H */

Cheers,

-- 
Julien Grall

