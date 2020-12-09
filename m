Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E4E2D4EA5
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 00:18:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48852.86432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn8jM-0008KJ-Av; Wed, 09 Dec 2020 23:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48852.86432; Wed, 09 Dec 2020 23:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn8jM-0008Ju-7J; Wed, 09 Dec 2020 23:18:44 +0000
Received: by outflank-mailman (input) for mailman id 48852;
 Wed, 09 Dec 2020 23:18:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kn8jK-0008Jl-91
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 23:18:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04d22b38-9595-4a96-af38-b39f5030debc;
 Wed, 09 Dec 2020 23:18:41 +0000 (UTC)
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
X-Inumbo-ID: 04d22b38-9595-4a96-af38-b39f5030debc
Date: Wed, 9 Dec 2020 15:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607555920;
	bh=WZZx/SPoCOZE6KlYMXcGv/kcccuVo2OCwMxhA2l32Ho=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=oIb2tJhW2r/A/EO2F9/7FDbxyTDGt0Fxdjvzqr555mi472WjTwIZm4UHN1FG3TvK7
	 TK1kilypvf0uxGM6VFZ65M+ZxNmD4/n+ERmu1+V9fG8PHaYiAD7VrTRYFMcs9PGu/W
	 hWRangm3fgFk7WUhnw8oGfVJ3dBnKwtC/5vFwUGQpiHm/GlgxfbARAyV3Tc1/BEFor
	 qTVRFLcpwvdxDAIdKZ9vcOk8G2a1wZxzGX+xbfDK4PYfZplQ5K0NLun2i5u8Vb+m3R
	 oz4WT+lkoYVTQysz85nn/nZLr4oRtC6Uk25nNuhZUtzudYwBw11TyAIr5BkeTiV9G0
	 9ElvE6+Dq7y9g==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V3 15/23] xen/arm: Stick around in leave_hypervisor_to_guest
 until I/O has completed
In-Reply-To: <1606732298-22107-16-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2012091432450.20986@sstabellini-ThinkPad-T480s>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com> <1606732298-22107-16-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Nov 2020, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch adds proper handling of return value of
> vcpu_ioreq_handle_completion() which involves using a loop
> in leave_hypervisor_to_guest().
> 
> The reason to use an unbounded loop here is the fact that vCPU
> shouldn't continue until an I/O has completed. In Xen case, if an I/O
> never completes then it most likely means that something went horribly
> wrong with the Device Emulator. And it is most likely not safe to
> continue. So letting the vCPU to spin forever if I/O never completes
> is a safer action than letting it continue and leaving the guest in
> unclear state and is the best what we can do for now.
> 
> This wouldn't be an issue for Xen as do_softirq() would be called at
> every loop. In case of failure, the guest will crash and the vCPU
> will be unscheduled.

Imagine that we have two guests: one that requires an ioreq server and
one that doesn't. If I am not mistaken this loop could potentially spin
forever on a pcpu, thus preventing any other guest being scheduled, even
if the other guest doesn't need any ioreq servers.


My other concern is that we are busy-looping. Could we call something
like wfi() or do_idle() instead? The ioreq server event notification of
completion should wake us up?

Following this line of thinking, I am wondering if instead of the
busy-loop we should call vcpu_block_unless_event_pending(current) in
try_handle_mmio if IO_RETRY. Then when the emulation is done, QEMU (or
equivalent) calls xenevtchn_notify which ends up waking up the domU
vcpu. Would that work?



> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
> 
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes V1 -> V2:
>    - new patch, changes were derived from (+ new explanation):
>      arm/ioreq: Introduce arch specific bits for IOREQ/DM features
> 
> Changes V2 -> V3:
>    - update patch description
> ---
> ---
>  xen/arch/arm/traps.c | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 036b13f..4cef43e 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -2257,18 +2257,23 @@ static void check_for_pcpu_work(void)
>   * Process pending work for the vCPU. Any call should be fast or
>   * implement preemption.
>   */
> -static void check_for_vcpu_work(void)
> +static bool check_for_vcpu_work(void)
>  {
>      struct vcpu *v = current;
>  
>  #ifdef CONFIG_IOREQ_SERVER
> +    bool handled;
> +
>      local_irq_enable();
> -    vcpu_ioreq_handle_completion(v);
> +    handled = vcpu_ioreq_handle_completion(v);
>      local_irq_disable();
> +
> +    if ( !handled )
> +        return true;
>  #endif
>  
>      if ( likely(!v->arch.need_flush_to_ram) )
> -        return;
> +        return false;
>  
>      /*
>       * Give a chance for the pCPU to process work before handling the vCPU
> @@ -2279,6 +2284,8 @@ static void check_for_vcpu_work(void)
>      local_irq_enable();
>      p2m_flush_vm(v);
>      local_irq_disable();
> +
> +    return false;
>  }
>  
>  /*
> @@ -2291,8 +2298,22 @@ void leave_hypervisor_to_guest(void)
>  {
>      local_irq_disable();
>  
> -    check_for_vcpu_work();
> -    check_for_pcpu_work();
> +    /*
> +     * The reason to use an unbounded loop here is the fact that vCPU
> +     * shouldn't continue until an I/O has completed. In Xen case, if an I/O
> +     * never completes then it most likely means that something went horribly
> +     * wrong with the Device Emulator. And it is most likely not safe to
> +     * continue. So letting the vCPU to spin forever if I/O never completes
> +     * is a safer action than letting it continue and leaving the guest in
> +     * unclear state and is the best what we can do for now.
> +     *
> +     * This wouldn't be an issue for Xen as do_softirq() would be called at
> +     * every loop. In case of failure, the guest will crash and the vCPU
> +     * will be unscheduled.
> +     */
> +    do {
> +        check_for_pcpu_work();
> +    } while ( check_for_vcpu_work() );
>  
>      vgic_sync_to_lrs();
>  
> -- 
> 2.7.4
> 

