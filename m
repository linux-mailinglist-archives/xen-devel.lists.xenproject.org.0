Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BA235E968
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 01:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110159.210247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWS42-0001G8-4B; Tue, 13 Apr 2021 23:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110159.210247; Tue, 13 Apr 2021 23:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWS42-0001Fj-16; Tue, 13 Apr 2021 23:03:22 +0000
Received: by outflank-mailman (input) for mailman id 110159;
 Tue, 13 Apr 2021 23:03:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1MWi=JK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lWS40-0001Fe-O7
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 23:03:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56f824c8-3c4e-4da4-9478-41f22864a893;
 Tue, 13 Apr 2021 23:03:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB59161004;
 Tue, 13 Apr 2021 23:03:18 +0000 (UTC)
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
X-Inumbo-ID: 56f824c8-3c4e-4da4-9478-41f22864a893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618354999;
	bh=OOaTAEU5MBWrgvdvUPYnAMqFOQBmT64Oyuc6RLdAaC8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sOXJRl3M7dynoym7ah9WNz2dtghaAkq4nNSsgoSLccqIC3R+C34UzOnEyE3V5IkrQ
	 vXq95oFobvHxajZoB+VBBHkfTqtCoa90JdfzX4OvJYyvU7tK3EvAe2DMR2AKRYKdCx
	 Ve/Zw2VXJ15UQcabu8FW7kql85khSbLzaADbIkLBde+SjNLzgyUQA/kpa8mIXb4sN1
	 boZ1Xy+5F5ocTeyc35EJ74cwRhQsloZbkhVtjQ5f/9pY/p6hjj7LoxAZ+esiBBUlNv
	 gyd6i7l98BArzIulofzg+VwlMNWTdwXsYCNnf83Pr+QZ21KJfUC4MoRinOrJRkHTyw
	 McEYmwz9tQg8w==
Date: Tue, 13 Apr 2021 16:03:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 2/2] xen/arm64: Place a speculation barrier following
 an ret instruction
In-Reply-To: <20210401164444.20377-3-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2104131558410.4885@sstabellini-ThinkPad-T480s>
References: <20210401164444.20377-1-julien@xen.org> <20210401164444.20377-3-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Apr 2021, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Some CPUs can speculate past a RET instruction and potentially perform
> speculative accesses to memory before processing the return.
> 
> There is no known gadget available after the RET instruction today.
> However some of the registers (such as in check_pending_guest_serror())
> may contain a value provided by the guest.
> 
> In order to harden the code, it would be better to add a speculation
> barrier after each RET instruction. The performance impact is meant to
> be negligeable as the speculation barrier is not meant to be
> architecturally executed.
> 
> Rather than manually inserting a speculation barrier, use a macro
> which overrides the mnemonic RET and replace with RET + SB. We need to
> use the opcode for RET to prevent any macro recursion.
> 
> This patch is only covering the assembly code. C code would need to be
> covered separately using the compiler support.
> 
> This is part of the work to mitigate straight-line speculation.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> ---
> 
> It is not clear to me whether Armv7 (we don't officially support 32-bit
> hypervisor on Armv8) is also affected by straight-line speculation.
> The LLVM website suggests it is: https://reviews.llvm.org/D92395
> 
> For now only focus on arm64.
> 
>     Changes in v3:
>         -  Add Bertrand's reviewed-by
> 
>     Changes in v2:
>         - Use a macro rather than inserting the speculation barrier
>         manually
>         - Remove mitigation for arm32
> ---
>  xen/arch/arm/arm32/entry.S         |  1 +
>  xen/arch/arm/arm32/lib/lib1funcs.S |  1 +
>  xen/include/asm-arm/arm64/macros.h |  6 ++++++
>  xen/include/asm-arm/macros.h       | 18 +++++++++---------
>  4 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/entry.S b/xen/arch/arm/arm32/entry.S
> index f2f1bc7a3158..d0a066484f13 100644
> --- a/xen/arch/arm/arm32/entry.S
> +++ b/xen/arch/arm/arm32/entry.S
> @@ -441,6 +441,7 @@ ENTRY(__context_switch)
>  
>          add     r4, r1, #VCPU_arch_saved_context
>          ldmia   r4, {r4 - sl, fp, sp, pc}       /* Load registers and return */
> +        sb
>  
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/arm32/lib/lib1funcs.S b/xen/arch/arm/arm32/lib/lib1funcs.S
> index f1278bd6c139..8c33ffbbcc4c 100644
> --- a/xen/arch/arm/arm32/lib/lib1funcs.S
> +++ b/xen/arch/arm/arm32/lib/lib1funcs.S
> @@ -382,5 +382,6 @@ UNWIND(.save {lr})
>  	bl	__div0
>  	mov	r0, #0			@ About as wrong as it could be.
>  	ldr	pc, [sp], #8
> +	sb
>  UNWIND(.fnend)
>  ENDPROC(Ldiv0)
> diff --git a/xen/include/asm-arm/arm64/macros.h b/xen/include/asm-arm/arm64/macros.h
> index f981b4f43e84..4614394b3dd5 100644
> --- a/xen/include/asm-arm/arm64/macros.h
> +++ b/xen/include/asm-arm/arm64/macros.h
> @@ -21,6 +21,12 @@
>      ldr     \dst, [\dst, \tmp]
>      .endm
>  
> +    .macro  ret
> +        // ret opcode

This series is very nice Julien! You can add my acked-by to both patches
and also commit them.

One minor request: could you please replace this comment with

/* ret opcode */

on commit?  // is not part of the coding style.


> +        .inst 0xd65f03c0
> +        sb
> +    .endm
>>  /*
>   * Register aliases.
>   */
> diff --git a/xen/include/asm-arm/macros.h b/xen/include/asm-arm/macros.h
> index 4833671f4ced..1aa373760f98 100644
> --- a/xen/include/asm-arm/macros.h
> +++ b/xen/include/asm-arm/macros.h
> @@ -5,6 +5,15 @@
>  # error "This file should only be included in assembly file"
>  #endif
>  
> +    /*
> +     * Speculative barrier
> +     * XXX: Add support for the 'sb' instruction
> +     */
> +    .macro sb
> +    dsb nsh
> +    isb
> +    .endm
> +
>  #if defined (CONFIG_ARM_32)
>  # include <asm/arm32/macros.h>
>  #elif defined(CONFIG_ARM_64)
> @@ -20,13 +29,4 @@
>      .endr
>      .endm
>  
> -    /*
> -     * Speculative barrier
> -     * XXX: Add support for the 'sb' instruction
> -     */
> -    .macro sb
> -    dsb nsh
> -    isb
> -    .endm
> -
>  #endif /* __ASM_ARM_MACROS_H */
> -- 
> 2.17.1
> 

