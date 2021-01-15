Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7382F7061
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 03:12:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67614.120800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Ea6-0003g1-71; Fri, 15 Jan 2021 02:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67614.120800; Fri, 15 Jan 2021 02:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Ea6-0003fc-3S; Fri, 15 Jan 2021 02:11:18 +0000
Received: by outflank-mailman (input) for mailman id 67614;
 Fri, 15 Jan 2021 02:11:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yB8v=GS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l0Ea4-0003fX-9h
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 02:11:16 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbd0af4b-fb24-43f5-8886-1cfd40be79dc;
 Fri, 15 Jan 2021 02:11:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41AE923A5A;
 Fri, 15 Jan 2021 02:11:14 +0000 (UTC)
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
X-Inumbo-ID: bbd0af4b-fb24-43f5-8886-1cfd40be79dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610676674;
	bh=xmMgdWnjWDoa3SlII4UW5JqB/lDAncaXv9VmiS9DllE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IzOGNZzGdULsN1Fxd0+zrVghF008Hm9i3edd/XeMkUO1tH0iiFwbMFqrZVdln5bcK
	 dzkgje8gJcLQM76OAFmaw/K09xYs5B0K23Qg+Nray/0L3RL1tU0+tZ8BpK0bU/V8yg
	 6QhEzZRemHU4ocWtBXsfF2RY8/4PABGE7RBHJnOdtrVwNTcIx5v7txI59auE1pu87R
	 eLWvpKebRVJ4aYy1P4CWuuLOhWdfRxAklyFAWha5XDk4wyP1Eh4Udeqh8t0mepI6ZK
	 dgaigZTUmRv925Ht5u0RWxSoix1SmsHMZjFkqBQ8ZvMbPjjg77rzgvJBDPZ7MHBvEy
	 uEnLmZ374S0Ng==
Date: Thu, 14 Jan 2021 18:11:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V4 22/24] xen/arm: Add mapcache invalidation handling
In-Reply-To: <1610488352-18494-23-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2101141803180.31265@sstabellini-ThinkPad-T480s>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-23-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Jan 2021, Oleksandr Tyshchenko wrote:
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
> The most suitable place to do this is p2m_free_entry(), there
> we can find the correct leaf type. The invalidation request
> will be sent in do_trap_hypercall() later on.
> 
> Taking into the account the following the do_trap_hypercall()
> is the best place to send invalidation request:
>  - The only way a guest can modify its P2M on Arm is via an hypercall
>  - When sending the invalidation request, the vCPU will be blocked
>    until all the IOREQ servers have acknowledged the invalidation
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
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
> 
> This patch is on par with x86 code (whether it is buggy or not).
> If there is a need to improve/harden something, this can be done on
> a follow-up.
> ***
> 
> Changes V1 -> V2:
>    - new patch, some changes were derived from (+ new explanation):
>      xen/ioreq: Make x86's invalidate qemu mapcache handling common
>    - put setting of the flag into __p2m_set_entry()
>    - clarify the conditions when the flag should be set
>    - use domain_has_ioreq_server()
>    - update do_trap_hypercall() by adding local variable
> 
> Changes V2 -> V3:
>    - update patch description
>    - move check to p2m_free_entry()
>    - add a comment
>    - use "curr" instead of "v" in do_trap_hypercall()
> 
> Changes V3 -> V4:
>    - update patch description
>    - re-order check in p2m_free_entry() to call domain_has_ioreq_server()
>      only if p2m->domain == current->domain
>    - add a comment in do_trap_hypercall()
> ---
>  xen/arch/arm/p2m.c   | 25 +++++++++++++++++--------
>  xen/arch/arm/traps.c | 20 +++++++++++++++++---
>  2 files changed, 34 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index d41c4fa..26acb95d 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1,6 +1,7 @@
>  #include <xen/cpu.h>
>  #include <xen/domain_page.h>
>  #include <xen/iocap.h>
> +#include <xen/ioreq.h>
>  #include <xen/lib.h>
>  #include <xen/sched.h>
>  #include <xen/softirq.h>
> @@ -749,17 +750,25 @@ static void p2m_free_entry(struct p2m_domain *p2m,
>      if ( !p2m_is_valid(entry) )
>          return;
>  
> -    /* Nothing to do but updating the stats if the entry is a super-page. */
> -    if ( p2m_is_superpage(entry, level) )
> +    if ( p2m_is_superpage(entry, level) || (level == 3) )
>      {
> -        p2m->stats.mappings[level]--;
> -        return;
> -    }
> +#ifdef CONFIG_IOREQ_SERVER
> +        /*
> +         * If this gets called (non-recursively) then either the entry
> +         * was replaced by an entry with a different base (valid case) or
> +         * the shattering of a superpage was failed (error case).
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
>          p2m->stats.mappings[level]--;
> -        p2m_put_l3_page(entry);
> +        /* Nothing to do if the entry is a super-page. */
> +        if ( level == 3 )
> +            p2m_put_l3_page(entry);
>          return;
>      }
>  
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 35094d8..1070d1b 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1443,6 +1443,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
>                                const union hsr hsr)
>  {
>      arm_hypercall_fn_t call = NULL;
> +    struct vcpu *curr = current;
>  
>      BUILD_BUG_ON(NR_hypercalls < ARRAY_SIZE(arm_hypercall_table) );
>  
> @@ -1459,7 +1460,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
>          return;
>      }
>  
> -    current->hcall_preempted = false;
> +    curr->hcall_preempted = false;
>  
>      perfc_incra(hypercalls, *nr);
>      call = arm_hypercall_table[*nr].fn;
> @@ -1472,7 +1473,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
>      HYPERCALL_RESULT_REG(regs) = call(HYPERCALL_ARGS(regs));
>  
>  #ifndef NDEBUG
> -    if ( !current->hcall_preempted )
> +    if ( !curr->hcall_preempted )
>      {
>          /* Deliberately corrupt parameter regs used by this hypercall. */
>          switch ( arm_hypercall_table[*nr].nr_args ) {
> @@ -1489,8 +1490,21 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
>  #endif
>  
>      /* Ensure the hypercall trap instruction is re-executed. */
> -    if ( current->hcall_preempted )
> +    if ( curr->hcall_preempted )
>          regs->pc -= 4;  /* re-execute 'hvc #XEN_HYPERCALL_TAG' */
> +
> +#ifdef CONFIG_IOREQ_SERVER
> +    /*
> +     * Taking into the account the following the do_trap_hypercall()
> +     * is the best place to send invalidation request:
> +     * - The only way a guest can modify its P2M on Arm is via an hypercall
> +     * - When sending the invalidation request, the vCPU will be blocked
> +     *   until all the IOREQ servers have acknowledged the invalidation

NIT: I suggest to reword it as follows to make it sound better.

We call ioreq_signal_mapcache_invalidate from do_trap_hypercall()
because the only way a guest can modify its P2M on Arm is via an
hypercall. Note that sending the invalidation request causes the vCPU to
block until all the IOREQ servers have acknowledged the invalidation.


Could be done on commit.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> +     */
> +    if ( unlikely(curr->domain->mapcache_invalidate) &&
> +         test_and_clear_bool(curr->domain->mapcache_invalidate) )
> +        ioreq_signal_mapcache_invalidate();
> +#endif
>  }
>  
>  void arch_hypercall_tasklet_result(struct vcpu *v, long res)
> -- 
> 2.7.4
> 

