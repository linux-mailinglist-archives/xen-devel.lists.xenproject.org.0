Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A777873EF3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 19:29:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689458.1074445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhw0s-0001Dm-I1; Wed, 06 Mar 2024 18:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689458.1074445; Wed, 06 Mar 2024 18:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhw0s-0001AV-El; Wed, 06 Mar 2024 18:29:10 +0000
Received: by outflank-mailman (input) for mailman id 689458;
 Wed, 06 Mar 2024 18:29:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HEbm=KM=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1rhw0r-0001AP-MD
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 18:29:09 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 693b352d-dbe7-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 19:29:05 +0100 (CET)
Received: from [192.168.7.187] ([71.202.166.45]) (authenticated bits=0)
 by mail.zytor.com (8.17.2/8.17.1) with ESMTPSA id 426ISQw91528489
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Wed, 6 Mar 2024 10:28:27 -0800
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
X-Inumbo-ID: 693b352d-dbe7-11ee-a1ee-f123f15fe8a2
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 426ISQw91528489
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024021201; t=1709749708;
	bh=XQAir3QRa5LQDi4wpuJlDHfgaqnwTrNgWliu5M/6UP4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=WKyWZwZqRkd0DiLDAyMi5GM+f+MfmhKuUh/wbJdQIAdwUtv0kKzPL6nlh/4toQG/H
	 PF5Sszl+gtSmhdTPeBuBZoPXgDpednmhUbwDvyXHs6II7gdoA1E3zeg/PhwZ73dJls
	 GECwKlguNNbFXv1k5YyqHSQhjEfuQ02Rat/dl18qx/tXfRNV5ORM+CzK6AH1MFtJDx
	 rs8r0MocTOaRThspYxT2xB/XSyXVwWNzICsGv2o8ILA5qwuJnnJhE2et++7cPh8dEr
	 ktx8Vo53tnvOQQ6FPaZgfGQJY1PQosR7hboXEUQH0aSHWuBY857Qkl3g8TD3kGw9s/
	 7BmBpxRWbTEIQ==
Message-ID: <f982f5ad-36be-4173-a15b-b898252c103c@zytor.com>
Date: Wed, 6 Mar 2024 10:28:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] x86/fred: Fix init_task thread stack pointer
 initialization
Content-Language: en-US
From: Xin Li <xin@zytor.com>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        jgross@suse.com, boris.ostrovsky@oracle.com, arnd@arndb.de,
        andrew.cooper3@citrix.com, brgerst@gmail.com
References: <20240304083333.449322-1-xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <20240304083333.449322-1-xin@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/2024 12:33 AM, Xin Li (Intel) wrote:
> As TOP_OF_KERNEL_STACK_PADDING is defined as 0 on x86_64, no one noticed
> it's missing in the calculation of the .sp field in INIT_THREAD until it
> is defined to 16 with CONFIG_X86_FRED=y.
> 
> Subtract TOP_OF_KERNEL_STACK_PADDING from the .sp field of INIT_THREAD.
> 
> Fixes: 65c9cc9e2c14 ("x86/fred: Reserve space for the FRED stack frame")
> Fixes: 3adee777ad0d ("x86/smpboot: Remove initial_stack on 64-bit")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202402262159.183c2a37-lkp@intel.com
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> ---

Should this fix, if it looks good, be included for the coming merge
window?

Thanks!
     Xin

> 
> Change Since v1:
> * Apply offset TOP_OF_KERNEL_STACK_PADDING to all uses of __end_init_task
>    (Brian Gerst).
> ---
>   arch/x86/include/asm/processor.h | 6 ++++--
>   arch/x86/kernel/head_64.S        | 3 ++-
>   arch/x86/xen/xen-head.S          | 2 +-
>   3 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
> index 26620d7642a9..17fe81998ce4 100644
> --- a/arch/x86/include/asm/processor.h
> +++ b/arch/x86/include/asm/processor.h
> @@ -664,8 +664,10 @@ static __always_inline void prefetchw(const void *x)
>   #else
>   extern unsigned long __end_init_task[];
>   
> -#define INIT_THREAD {							    \
> -	.sp	= (unsigned long)&__end_init_task - sizeof(struct pt_regs), \
> +#define INIT_THREAD {							\
> +	.sp	= (unsigned long)&__end_init_task -			\
> +		  TOP_OF_KERNEL_STACK_PADDING -				\
> +		  sizeof(struct pt_regs),				\
>   }
>   
>   extern unsigned long KSTK_ESP(struct task_struct *task);
> diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
> index d4918d03efb4..c38e43589046 100644
> --- a/arch/x86/kernel/head_64.S
> +++ b/arch/x86/kernel/head_64.S
> @@ -26,6 +26,7 @@
>   #include <asm/apicdef.h>
>   #include <asm/fixmap.h>
>   #include <asm/smp.h>
> +#include <asm/thread_info.h>
>   
>   /*
>    * We are not able to switch in one step to the final KERNEL ADDRESS SPACE
> @@ -66,7 +67,7 @@ SYM_CODE_START_NOALIGN(startup_64)
>   	mov	%rsi, %r15
>   
>   	/* Set up the stack for verify_cpu() */
> -	leaq	(__end_init_task - PTREGS_SIZE)(%rip), %rsp
> +	leaq	(__end_init_task - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE)(%rip), %rsp
>   
>   	leaq	_text(%rip), %rdi
>   
> diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
> index a0ea285878db..04101b984f24 100644
> --- a/arch/x86/xen/xen-head.S
> +++ b/arch/x86/xen/xen-head.S
> @@ -49,7 +49,7 @@ SYM_CODE_START(startup_xen)
>   	ANNOTATE_NOENDBR
>   	cld
>   
> -	leaq	(__end_init_task - PTREGS_SIZE)(%rip), %rsp
> +	leaq	(__end_init_task - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE)(%rip), %rsp
>   
>   	/* Set up %gs.
>   	 *
> 
> base-commit: e13841907b8fda0ae0ce1ec03684665f578416a8


