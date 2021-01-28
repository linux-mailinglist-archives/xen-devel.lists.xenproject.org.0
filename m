Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CBA30733A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 10:55:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76833.138794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l541W-00088B-Io; Thu, 28 Jan 2021 09:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76833.138794; Thu, 28 Jan 2021 09:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l541W-00087m-FV; Thu, 28 Jan 2021 09:55:34 +0000
Received: by outflank-mailman (input) for mailman id 76833;
 Thu, 28 Jan 2021 09:55:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l541V-00087h-6p
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 09:55:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l541S-0002g0-Gi; Thu, 28 Jan 2021 09:55:30 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l541S-0001wX-6D; Thu, 28 Jan 2021 09:55:30 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=0a8z+EEze58zCqqhLoagzZbgvFwyi72GtM/YuAP4LPA=; b=HAK/FTU8xzwZroQLPfBwcz5Qwx
	Qk195fouR5WwloNpAYqsBPKmrHJXCHzjEd7p6Mcgfn4Xvmed3KfjldC8lQaYx6kkxCZVcoS+2mUvO
	bF1ZhIFt8yem/XuQbq/ClHcVhme+0ZVESzNg30dK0Mxp3MLNGlXkGB0P7E29bEhSdKjo=;
Subject: Re: [PATCH V5 22/22] xen/arm: Add mapcache invalidation handling
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-23-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1818a998-fe85-b24d-2141-a755a3e74623@xen.org>
Date: Thu, 28 Jan 2021 09:55:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1611601709-28361-23-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> We need to send mapcache invalidation request to qemu/demu everytime
> the page gets removed from a guest.
> 
> At the moment, the Arm code doesn't explicitely remove the existing
> mapping before inserting the new mapping. Instead, this is done
> implicitely by __p2m_set_entry().
> 
> So we need to recognize a case when old entry is a RAM page *and*
> the new MFN is different in order to set the corresponding flag.

AFAICT, this sentence doesn't match the code. Instead, you will request 
the mapcache invalidation whenever the "freed" entry contains some RAM page.

I am fine with the approach used in the code. However, it would be good 
that the commit message reflects the code.

> The most suitable place to do this is p2m_free_entry(), there
> we can find the correct leaf type. The invalidation request
> will be sent in do_trap_hypercall() later on.
> 
> Taking into the account the following the do_trap_hypercall()
> is the best place to send invalidation request:
>   - The only way a guest can modify its P2M on Arm is via an hypercall
>   - When sending the invalidation request, the vCPU will be blocked
>     until all the IOREQ servers have acknowledged the invalidation
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>
> 
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> ***
> Please note, this patch depends on the following which is
> on review:
> https://patchwork.kernel.org/patch/11803383/

I think we can defer this post this series.

> 
> This patch is on par with x86 code (whether it is buggy or not).
> If there is a need to improve/harden something, this can be done on
> a follow-up.
> ***
> 
> Changes V1 -> V2:
>     - new patch, some changes were derived from (+ new explanation):
>       xen/ioreq: Make x86's invalidate qemu mapcache handling common
>     - put setting of the flag into __p2m_set_entry()
>     - clarify the conditions when the flag should be set
>     - use domain_has_ioreq_server()
>     - update do_trap_hypercall() by adding local variable
> 
> Changes V2 -> V3:
>     - update patch description
>     - move check to p2m_free_entry()
>     - add a comment
>     - use "curr" instead of "v" in do_trap_hypercall()
> 
> Changes V3 -> V4:
>     - update patch description
>     - re-order check in p2m_free_entry() to call domain_has_ioreq_server()
>       only if p2m->domain == current->domain
>     - add a comment in do_trap_hypercall()
> 
> Changes V4 -> V5:
>     - add Stefano's R-b
>     - update comment in do_trap_hypercall()
> ---
> ---
>   xen/arch/arm/p2m.c   | 25 +++++++++++++++++--------
>   xen/arch/arm/traps.c | 20 +++++++++++++++++---
>   2 files changed, 34 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index d41c4fa..26acb95d 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1,6 +1,7 @@
>   #include <xen/cpu.h>
>   #include <xen/domain_page.h>
>   #include <xen/iocap.h>
> +#include <xen/ioreq.h>
>   #include <xen/lib.h>
>   #include <xen/sched.h>
>   #include <xen/softirq.h>
> @@ -749,17 +750,25 @@ static void p2m_free_entry(struct p2m_domain *p2m,
>       if ( !p2m_is_valid(entry) )
>           return;
>   
> -    /* Nothing to do but updating the stats if the entry is a super-page. */
> -    if ( p2m_is_superpage(entry, level) )
> +    if ( p2m_is_superpage(entry, level) || (level == 3) )
>       {
> -        p2m->stats.mappings[level]--;
> -        return;
> -    }
> +#ifdef CONFIG_IOREQ_SERVER
> +        /*
> +         * If this gets called (non-recursively) then either the entry

I am not sure why you specify "non-recursively". You still want to 
invalidate the mapcache if we replaced a table with a superpage mapping.

> +         * was replaced by an entry with a different base (valid case) or
> +         * the shattering of a superpage was failed (error case).

s/was/has/ I think.

> +         * So, at worst, the spurious mapcache invalidation might be sent.
> +         */
> +        if ( (p2m->domain == current->domain) &&
> +              domain_has_ioreq_server(p2m->domain) &&
> +              p2m_is_ram(entry.p2m.type) )
> +            p2m->domain->mapcache_invalidate = true;
> +#endif
>   
> -    if ( level == 3 )
> -    {
>           p2m->stats.mappings[level]--;
> -        p2m_put_l3_page(entry);
> +        /* Nothing to do if the entry is a super-page. */
> +        if ( level == 3 )
> +            p2m_put_l3_page(entry);
>           return;
>       }
>   
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 4cdd343..64b740b 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1443,6 +1443,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
>                                 const union hsr hsr)
>   {
>       arm_hypercall_fn_t call = NULL;
> +    struct vcpu *curr = current;
>   
>       BUILD_BUG_ON(NR_hypercalls < ARRAY_SIZE(arm_hypercall_table) );
>   
> @@ -1459,7 +1460,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
>           return;
>       }
>   
> -    current->hcall_preempted = false;
> +    curr->hcall_preempted = false;
>   
>       perfc_incra(hypercalls, *nr);
>       call = arm_hypercall_table[*nr].fn;
> @@ -1472,7 +1473,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
>       HYPERCALL_RESULT_REG(regs) = call(HYPERCALL_ARGS(regs));
>   
>   #ifndef NDEBUG
> -    if ( !current->hcall_preempted )
> +    if ( !curr->hcall_preempted )
>       {
>           /* Deliberately corrupt parameter regs used by this hypercall. */
>           switch ( arm_hypercall_table[*nr].nr_args ) {
> @@ -1489,8 +1490,21 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
>   #endif
>   
>       /* Ensure the hypercall trap instruction is re-executed. */
> -    if ( current->hcall_preempted )
> +    if ( curr->hcall_preempted )
>           regs->pc -= 4;  /* re-execute 'hvc #XEN_HYPERCALL_TAG' */
> +
> +#ifdef CONFIG_IOREQ_SERVER
> +    /*
> +     * We call ioreq_signal_mapcache_invalidate from do_trap_hypercall()
> +     * because the only way a guest can modify its P2M on Arm is via an
> +     * hypercall.
> +     * Note that sending the invalidation request causes the vCPU to block
> +     * until all the IOREQ servers have acknowledged the invalidation.
> +     */
> +    if ( unlikely(curr->domain->mapcache_invalidate) &&
> +         test_and_clear_bool(curr->domain->mapcache_invalidate) )
> +        ioreq_signal_mapcache_invalidate();
> +#endif
>   }
>   
>   void arch_hypercall_tasklet_result(struct vcpu *v, long res)
> 

Cheers,

-- 
Julien Grall

