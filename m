Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9619D8D5F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 21:25:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843138.1258787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFfdq-0001QS-O1; Mon, 25 Nov 2024 20:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843138.1258787; Mon, 25 Nov 2024 20:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFfdq-0001Ok-LI; Mon, 25 Nov 2024 20:25:06 +0000
Received: by outflank-mailman (input) for mailman id 843138;
 Mon, 25 Nov 2024 20:25:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tFfdp-0001OO-Af
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 20:25:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tFfdo-0053ZU-2O;
 Mon, 25 Nov 2024 20:25:05 +0000
Received: from [2a02:8012:3a1:0:29f6:ead8:34fc:5066]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tFfdo-005gc3-25;
 Mon, 25 Nov 2024 20:25:04 +0000
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
	bh=KxUIR/LzK9waCB9D2MJ9wzDUQC3gXKaA5JteXUUVQOE=; b=6/gy3hPZIPmfWTnNIL06Dif838
	TbfScOW5Itt3iB9yXAe0F56qTXZ0CQlfEaWNGhyThIIXPZjsGwG7TosT0ZSghoaUP5wyxkO0j70tc
	nmyFKV8UoLPdFilMEdOk12E5YUAVYafEQWIOVA/5lYNGLzRDnigKMOPtogqrdrZ7+wSA=;
Message-ID: <777d2832-76e2-4d59-88b7-ea9226bf8225@xen.org>
Date: Mon, 25 Nov 2024 20:25:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/11] Arm32: use new-style entry annotations for entry
 code
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
 <74c761c9-41b1-4397-aec2-95558d53a7cc@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <74c761c9-41b1-4397-aec2-95558d53a7cc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 01/10/2024 16:17, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Should the GLOBAL()s also be replaced?

What would you replace them with?

> ---
> v7: New.
> 
> --- a/xen/arch/arm/arm32/entry.S
> +++ b/xen/arch/arm/arm32/entry.S
> @@ -31,7 +31,7 @@
>    *  r4: Set to a non-zero value if a pending Abort exception took place.
>    *      Otherwise, it will be set to zero.
>    */
> -prepare_context_from_guest:
> +FUNC_LOCAL(prepare_context_from_guest)
>   #ifdef CONFIG_ARM32_HARDEN_BRANCH_PREDICTOR
>           /*
>            * Restore vectors table to the default as it may have been
> @@ -140,7 +140,7 @@ abort_guest_exit_end:
>   
>   skip_check:
>           b   enter_hypervisor_from_guest_preirq
> -ENDPROC(prepare_context_from_guest)
> +END(prepare_context_from_guest)
>   
>           /*
>            * Macro to define a trap entry.
> @@ -362,13 +362,13 @@ trap_irq:
>   trap_fiq:
>           vector fiq
>   
> -return_from_trap:
> +LABEL_LOCAL(return_from_trap)

OOI, why do we need to annotate return_from_trap?

>           /*
>            * Restore the stack pointer from r11. It was saved on exception
>            * entry (see __DEFINE_TRAP_ENTRY).
>            */
>           mov sp, r11
> -ENTRY(return_to_new_vcpu32)
> +LABEL(return_to_new_vcpu32)

I am a bit confused why this is a LABEL rather than a FUNC. But I wonder 
if either of them are corrrect? The code above is meant to fall into 
this one. So I think at least the alignment should be 0.

>           ldr r11, [sp, #UREGS_cpsr]
>           and r11, #PSR_MODE_MASK
>           cmp r11, #PSR_MODE_HYP
> @@ -426,6 +426,7 @@ return_to_hypervisor:
>           clrex
>           eret
>           sb
> +END(return_from_trap)
>   
>   /*
>    * struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next)
> @@ -435,12 +436,13 @@ return_to_hypervisor:
>    *
>    * Returns prev in r0
>    */
> -ENTRY(__context_switch)
> +FUNC(__context_switch)
>           add     ip, r0, #VCPU_arch_saved_context
>           stmia   ip!, {r4 - sl, fp, sp, lr}      /* Save register state */
>   
>           add     r4, r1, #VCPU_arch_saved_context
>           ldmia   r4, {r4 - sl, fp, sp, pc}       /* Load registers and return */
> +END(__context_switch)
>   
>   /*
>    * Local variables:
> 

Cheers,

-- 
Julien Grall

