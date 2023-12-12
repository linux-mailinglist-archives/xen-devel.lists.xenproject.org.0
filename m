Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C2080ECC2
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 14:04:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653106.1019344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2Qa-000124-Kw; Tue, 12 Dec 2023 13:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653106.1019344; Tue, 12 Dec 2023 13:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2Qa-000106-IM; Tue, 12 Dec 2023 13:04:00 +0000
Received: by outflank-mailman (input) for mailman id 653106;
 Tue, 12 Dec 2023 13:03:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rD2QZ-0000zz-Ct
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 13:03:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD2QZ-00070D-AZ; Tue, 12 Dec 2023 13:03:59 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD2QZ-0004LK-4K; Tue, 12 Dec 2023 13:03:59 +0000
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
	bh=L7udOHg8N9kNtxRs3KWT52GcQ0nGzVblLYSMxaVl1h4=; b=RoHA4kT+7lnGUG5u23+SB+ZZ6a
	nF69mYRyKIff9tPvTc1ehq0hObqDEvMBahsNpMs5jtcuMjI56PBS88jMNNi+49rI7ghH2ZOEuVTKy
	UUAroYQFmO6YH3hnk56ejjialHveUJ6A2ThUMrmEh6UwYbKh/kNRrTNdhN/fvc5iy43o=;
Message-ID: <319c928c-500c-4f41-8a65-3ffdeb888d63@xen.org>
Date: Tue, 12 Dec 2023 13:03:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/12] xen/spinlock: add
 rspin_[un]lock_irq[save|restore]()
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-6-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231212094725.22184-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 12/12/2023 09:47, Juergen Gross wrote:
> Instead of special casing rspin_lock_irqsave() and
> rspin_unlock_irqrestore() for the console lock, add those functions
> to spinlock handling and use them where needed.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch
> ---
>   xen/arch/x86/traps.c       | 14 ++++++++------
>   xen/common/spinlock.c      | 16 ++++++++++++++++
>   xen/drivers/char/console.c | 18 +-----------------
>   xen/include/xen/console.h  |  5 +++--
>   xen/include/xen/spinlock.h |  7 +++++++
>   5 files changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 7724306116..21227877b3 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -647,13 +647,15 @@ void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs)
>   void show_execution_state(const struct cpu_user_regs *regs)
>   {
>       /* Prevent interleaving of output. */
> -    unsigned long flags = console_lock_recursive_irqsave();
> +    unsigned long flags;
> +
> +    rspin_lock_irqsave(&console_lock, flags);
>   
>       show_registers(regs);
>       show_code(regs);
>       show_stack(regs);
>   
> -    console_unlock_recursive_irqrestore(flags);
> +    rspin_unlock_irqrestore(&console_lock, flags);
>   }
>   
>   void cf_check show_execution_state_nonconst(struct cpu_user_regs *regs)
> @@ -663,7 +665,7 @@ void cf_check show_execution_state_nonconst(struct cpu_user_regs *regs)
>   
>   void vcpu_show_execution_state(struct vcpu *v)
>   {
> -    unsigned long flags = 0;
> +    unsigned long flags;
>   
>       if ( test_bit(_VPF_down, &v->pause_flags) )
>       {
> @@ -698,7 +700,7 @@ void vcpu_show_execution_state(struct vcpu *v)
>   #endif
>   
>       /* Prevent interleaving of output. */
> -    flags = console_lock_recursive_irqsave();
> +    rspin_lock_irqsave(&console_lock, flags);
>   
>       vcpu_show_registers(v);
>   
> @@ -708,7 +710,7 @@ void vcpu_show_execution_state(struct vcpu *v)
>            * Stop interleaving prevention: The necessary P2M lookups involve
>            * locking, which has to occur with IRQs enabled.
>            */
> -        console_unlock_recursive_irqrestore(flags);
> +        rspin_unlock_irqrestore(&console_lock, flags);
>   
>           show_hvm_stack(v, &v->arch.user_regs);
>       }
> @@ -717,7 +719,7 @@ void vcpu_show_execution_state(struct vcpu *v)
>           if ( guest_kernel_mode(v, &v->arch.user_regs) )
>               show_guest_stack(v, &v->arch.user_regs);
>   
> -        console_unlock_recursive_irqrestore(flags);
> +        rspin_unlock_irqrestore(&console_lock, flags);
>       }
>   
>   #ifdef CONFIG_HVM
> diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
> index 422a7fb1db..c1a9ba1304 100644
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -475,6 +475,16 @@ void rspin_lock(rspinlock_t *lock)
>       lock->recurse_cnt++;
>   }
>   
> +unsigned long __rspin_lock_irqsave(rspinlock_t *lock)

This is going to be a problem with MISRA (see Rule 21.1). Can you move 
the double underscore to the end? Alternatively, I am not sure I see the 
benefits of the function here. So maybe we can fold the code in the 
macro below?

Other than that, the rest of the patch LGTM.

Cheers,

-- 
Julien Grall

