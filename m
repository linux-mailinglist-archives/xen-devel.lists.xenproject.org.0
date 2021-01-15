Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40022F86F3
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 21:55:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68632.122880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0W7h-0005DA-Sf; Fri, 15 Jan 2021 20:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68632.122880; Fri, 15 Jan 2021 20:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0W7h-0005Cl-PL; Fri, 15 Jan 2021 20:55:09 +0000
Received: by outflank-mailman (input) for mailman id 68632;
 Fri, 15 Jan 2021 20:55:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l0W7f-0005Cg-E6
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 20:55:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0W7c-0004LP-Rr; Fri, 15 Jan 2021 20:55:04 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0W7c-000503-EQ; Fri, 15 Jan 2021 20:55:04 +0000
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
	bh=UGEoNJ+q+HPb8k2EersUwFMl36hzfjRwaOczGMixoJI=; b=JoUvNUDbLLRSLhzGKdRgbTRUY4
	MpznT9CrVlBEwllcLu21QD6abWgFtM9Hiveob8QvMFCKvzpMivw9awL9lSr4Rx2N5QIGvcXGMB2tn
	uP/ol4Pc0tfPH0u3iGeckJ4mwLTEmkyt9OzID+6lrXn/lgKY5+cCwSu2yeS69qzUARzc=;
Subject: Re: [PATCH V4 15/24] xen/arm: Stick around in
 leave_hypervisor_to_guest until I/O has completed
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-16-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1f1f910b-ebef-f071-3458-12ad493d6e79@xen.org>
Date: Fri, 15 Jan 2021 20:55:02 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610488352-18494-16-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 12/01/2021 21:52, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch adds proper handling of return value of
> vcpu_ioreq_handle_completion() which involves using a loop in
> leave_hypervisor_to_guest().
> 
> The reason to use an unbounded loop here is the fact that vCPU shouldn't
> continue until the I/O has completed.
> 
> The IOREQ code is using wait_on_xen_event_channel(). Yet, this can
> still "exit" early if an event has been received. But this doesn't mean
> the I/O has completed (in can be just a spurious wake-up).

While I agree we need the loop, I don't think the reason is correct 
here. If you receive a spurious event, then the loop in wait_for_io() 
will catch it.

The only way to get out of that loop is if the I/O has been handled or 
the state in the IOREQ page is invalid.

In addition to that, handle_hvm_io_completion(), will only return false 
if the state is invalid or there is vCPI work to do.

> So we need
> to check if the I/O has completed and wait again if it hasn't (we will
> block the vCPU again until an event is received). This loop makes sure
> that all the vCPU works are done before we return to the guest.
> 
> The call chain below:
> check_for_vcpu_work -> vcpu_ioreq_handle_completion -> wait_for_io ->
> wait_on_xen_event_channel
> 
> The worse that can happen here if the vCPU will never run again
> (the I/O will never complete). But, in Xen case, if the I/O never
> completes then it most likely means that something went horribly
> wrong with the Device Emulator. And it is most likely not safe
> to continue. So letting the vCPU to spin forever if the I/O never
> completes is a safer action than letting it continue and leaving
> the guest in unclear state and is the best what we can do for now.
> 
> Please note, using this loop we will not spin forever on a pCPU,
> preventing any other vCPUs from being scheduled. At every loop
> we will call check_for_pcpu_work() that will process pending
> softirqs. In case of failure, the guest will crash and the vCPU
> will be unscheduled. In normal case, if the rescheduling is necessary
> (might be set by a timer or by a caller in check_for_vcpu_work(),
> where wait_for_io() is a preemption point) the vCPU will be rescheduled
> to give place to someone else.
> 
What you describe here is a bug that was introduced by this series. If 
you think the code requires a separate patch, then please split off 
patch #14 so the code callling vcpu_ioreq_handle_completion() happen here.

> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>
> 
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes V1 -> V2:
>     - new patch, changes were derived from (+ new explanation):
>       arm/ioreq: Introduce arch specific bits for IOREQ/DM features
> 
> Changes V2 -> V3:
>     - update patch description
> 
> Changes V3 -> V4:
>     - update patch description and comment in code
> ---
>   xen/arch/arm/traps.c | 38 +++++++++++++++++++++++++++++++++-----
>   1 file changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 036b13f..4a83e1e 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -2257,18 +2257,23 @@ static void check_for_pcpu_work(void)
>    * Process pending work for the vCPU. Any call should be fast or
>    * implement preemption.
>    */
> -static void check_for_vcpu_work(void)
> +static bool check_for_vcpu_work(void)
>   {
>       struct vcpu *v = current;
>   
>   #ifdef CONFIG_IOREQ_SERVER
> +    bool handled;
> +
>       local_irq_enable();
> -    vcpu_ioreq_handle_completion(v);
> +    handled = vcpu_ioreq_handle_completion(v);
>       local_irq_disable();
> +
> +    if ( !handled )
> +        return true;
>   #endif
>   
>       if ( likely(!v->arch.need_flush_to_ram) )
> -        return;
> +        return false;
>   
>       /*
>        * Give a chance for the pCPU to process work before handling the vCPU
> @@ -2279,6 +2284,8 @@ static void check_for_vcpu_work(void)
>       local_irq_enable();
>       p2m_flush_vm(v);
>       local_irq_disable();
> +
> +    return false;
>   }
>   
>   /*
> @@ -2291,8 +2298,29 @@ void leave_hypervisor_to_guest(void)
>   {
>       local_irq_disable();
>   
> -    check_for_vcpu_work();
> -    check_for_pcpu_work();
> +    /*
> +     * The reason to use an unbounded loop here is the fact that vCPU
> +     * shouldn't continue until the I/O has completed.
> +     *
> +     * The worse that can happen here if the vCPU will never run again
> +     * (the I/O will never complete). But, in Xen case, if the I/O never
> +     * completes then it most likely means that something went horribly
> +     * wrong with the Device Emulator. And it is most likely not safe
> +     * to continue. So letting the vCPU to spin forever if the I/O never
> +     * completes is a safer action than letting it continue and leaving
> +     * the guest in unclear state and is the best what we can do for now.
> +     *
> +     * Please note, using this loop we will not spin forever on a pCPU,
> +     * preventing any other vCPUs from being scheduled. At every loop
> +     * we will call check_for_pcpu_work() that will process pending
> +     * softirqs. In case of failure, the guest will crash and the vCPU
> +     * will be unscheduled. In normal case, if the rescheduling is necessary
> +     * (might be set by a timer or by a caller in check_for_vcpu_work(),
> +     * the vCPU will be rescheduled to give place to someone else.

TBH, I think this comment is a bit too much and sort of out of context 
because this describing the inner implementation of check_for_vcpu_work().

How about the following:

/*
  * check_for_vcpu_work() may return true if there are more work to
  * before the vCPU can safely resume. This gives us an opportunity
  * to deschedule the vCPU if needed.
  */

> +     */
> +    do {
> +        check_for_pcpu_work();
> +    } while ( check_for_vcpu_work() );

So there are two important changes in this new implementation:
   1) Without CONFIG_IOREQ_SERVER=y, we will call check_for_pcpu_work() 
twice in a row when handling set/way.
   2) After handling the pCPU work, we will now return to the guest 
directly. Before, we gave another opportunity for Xen to schedule a 
different work. This means, we may return to the vCPU for a very short 
time and will introduce more overhead.

So I would rework the loop to write it as:

while ( check_for_pcpu_work() )
    check_for_pcpu_work();
check_for_pcpu_work();

>   
>       vgic_sync_to_lrs();
>   
> 

Cheers,

-- 
Julien Grall

