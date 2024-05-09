Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC24C8C0E93
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 12:53:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719180.1121781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s51OG-0000Xy-L2; Thu, 09 May 2024 10:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719180.1121781; Thu, 09 May 2024 10:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s51OG-0000Um-Hz; Thu, 09 May 2024 10:52:44 +0000
Received: by outflank-mailman (input) for mailman id 719180;
 Thu, 09 May 2024 10:52:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s51OE-0000Ug-Ch
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 10:52:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s51OD-00085E-JC; Thu, 09 May 2024 10:52:41 +0000
Received: from [15.248.2.239] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s51OD-0000hj-4f; Thu, 09 May 2024 10:52:41 +0000
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
	bh=r3vDx8nObzjwmzGlXXp26n113bpq967ebdxZgc3vgXA=; b=RNzf0JrLFwoWriP95zSnVFnD35
	+9nzBQNB/qMXzxJdBjFnazez4j1gHKRZN7PUxRhRxOSPbPvO2WbqV84Wq+EH/lzylZzNyURZUphDB
	mtpoAFCPVoZptZHCQ3eiEKf4KNU7dxuaKoKoZSk8vkua8E5PjPMPE99TLe4147zEk5IY=;
Message-ID: <4c63493b-3743-4d20-a5e2-5f1b3038a9c8@xen.org>
Date: Thu, 9 May 2024 11:52:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] arm/mem_access: add conditional build of
 mem_access.c
Content-Language: en-GB
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <ad49a2006a6f19c2db1ff5eabb9ffd666693c4c5.1715250761.git.alessandro.zucchelli@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ad49a2006a6f19c2db1ff5eabb9ffd666693c4c5.1715250761.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/05/2024 11:39, Alessandro Zucchelli wrote:
> In order to comply to MISRA C:2012 Rule 8.4 for ARM asm/mem_access.h in
> the case where MEM_ACCESS=n stubs are needed to allow the conditional
> compilation of the users of this header.

I think you need to update the commit message given ...

> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> ---
> Changes from v1:
> Reverted preprocessor conditional changes to xen/mem_access.h;
> added conditional build for xen/mem_access.c;
> provided stubs for asm/mem_access.h functions.
> ---
>   xen/arch/arm/Makefile                 | 2 +-
>   xen/arch/arm/include/asm/mem_access.h | 9 +++++++++
>   2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 7b1350e2ef..45dc29ea53 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -37,7 +37,7 @@ obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
>   obj-y += irq.o
>   obj-y += kernel.init.o
>   obj-$(CONFIG_LIVEPATCH) += livepatch.o
> -obj-y += mem_access.o
> +obj-$(CONFIG_MEM_ACCESS) += mem_access.o

... this not only adding stub.

>   obj-y += mm.o
>   obj-y += monitor.o
>   obj-y += p2m.o
> diff --git a/xen/arch/arm/include/asm/mem_access.h b/xen/arch/arm/include/asm/mem_access.h
> index 35ed0ad154..2f73172e39 100644
> --- a/xen/arch/arm/include/asm/mem_access.h
> +++ b/xen/arch/arm/include/asm/mem_access.h
> @@ -17,6 +17,7 @@
>   #ifndef _ASM_ARM_MEM_ACCESS_H
>   #define _ASM_ARM_MEM_ACCESS_H
>   
> +#include <xen/types.h>

Can you explain why this is needed?

Style: Newline here please.

>   static inline
>   bool p2m_mem_access_emulate_check(struct vcpu *v,
>                                     const struct vm_event_st *rsp)
> @@ -35,12 +36,20 @@ static inline bool p2m_mem_access_sanity_check(struct domain *d)
>    * Send mem event based on the access. Boolean return value indicates if trap
>    * needs to be injected into guest.
>    */
> +#ifdef CONFIG_MEM_ACCESS
>   bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec npfec);
>   
>   struct page_info*
>   p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
>                                     const struct vcpu *v);
> +#else
>   
> +static inline bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec npfec) {return false;}

Coding style: The line is well over the 80 characters limit. Also we 
don't tend to provide the implementation of the stub in the single line 
if it is more than {}. So "{return false;}" should look like:

{
    return false;
}

> +
> +static inline struct page_info*
> +p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
> +                                  const struct vcpu *v) {return NULL;}

Ditto.

> +#endif /*CONFIG_MEM_ACCESS*/
>   #endif /* _ASM_ARM_MEM_ACCESS_H */
>   
>   /*

Cheers,

-- 
Julien Grall

