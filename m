Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C93D305E9F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 15:50:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76127.137239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4m8a-0005PU-CO; Wed, 27 Jan 2021 14:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76127.137239; Wed, 27 Jan 2021 14:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4m8a-0005P9-97; Wed, 27 Jan 2021 14:49:40 +0000
Received: by outflank-mailman (input) for mailman id 76127;
 Wed, 27 Jan 2021 14:49:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l4m8Y-0005P4-Nm
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 14:49:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l4m8W-00088q-Q0; Wed, 27 Jan 2021 14:49:36 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l4m8W-00062m-D7; Wed, 27 Jan 2021 14:49:36 +0000
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
	bh=XeuecU/N5swQqfhcNPGn47MmlPu3Wx6YrKF1GZxqIn0=; b=MomTczGYMHxG63c7AhImyoNqXI
	VLpmaM9tWHGpLdPTRy3Z9CSx8yMYaMPBWsOGgqLvc34lgwiN46JmZL5KsAlUG7geb6l6nAueTvZMi
	SjCGsyrBUL+k4Yc+3BJDv0ymGwQTASZE1FGkEPU1bq9zh2YMEe+RjvvgJ+jJZ+n43Cp8=;
Subject: Re: [PATCH V5 15/22] xen/arm: Call vcpu_ioreq_handle_completion() in
 check_for_vcpu_work()
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-16-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <75703470-5a5a-98e5-bdfa-ca91a5cf439b@xen.org>
Date: Wed, 27 Jan 2021 14:49:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1611601709-28361-16-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch adds remaining bits needed for the IOREQ support on Arm.
> Besides just calling vcpu_ioreq_handle_completion() we need to handle
> it's return value to make sure that all the vCPU works are done before
> we return to the guest (the vcpu_ioreq_handle_completion() may return
> false if there is vCPU work to do or IOREQ state is invalid).
> For that reason we use an unbounded loop in leave_hypervisor_to_guest().
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
> the vCPU will be rescheduled to give place to someone else.
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
> Changes V1 -> V2:
>     - new patch, changes were derived from (+ new explanation):
>       arm/ioreq: Introduce arch specific bits for IOREQ/DM features
> 
> Changes V2 -> V3:
>     - update patch description
> 
> Changes V3 -> V4:
>     - update patch description and comment in code
> 
> Changes V4 -> V5:
>     - add Stefano's R-b

Reviewed-by means the person reviewed the code and confirmed it is 
correct. Given the changes you made below, I don't think this tag can hold.

Please confirm with Stefano he is happy with the tag to be carried.

Other than that, the change looks good to me:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

>     - update patch subject/description and comment in code,
>       was "xen/arm: Stick around in leave_hypervisor_to_guest until I/O has completed"
>     - change loop logic a bit
>     - squash with changes to check_for_vcpu_work() from patch #14
> 
> ---
> ---
>   xen/arch/arm/traps.c | 26 +++++++++++++++++++++++---
>   1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index b0cd8f9..2039ff5 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -21,6 +21,7 @@
>   #include <xen/hypercall.h>
>   #include <xen/init.h>
>   #include <xen/iocap.h>
> +#include <xen/ioreq.h>
>   #include <xen/irq.h>
>   #include <xen/lib.h>
>   #include <xen/mem_access.h>
> @@ -2261,12 +2262,23 @@ static void check_for_pcpu_work(void)
>    * Process pending work for the vCPU. Any call should be fast or
>    * implement preemption.
>    */
> -static void check_for_vcpu_work(void)
> +static bool check_for_vcpu_work(void)
>   {
>       struct vcpu *v = current;
>   
> +#ifdef CONFIG_IOREQ_SERVER
> +    bool handled;
> +
> +    local_irq_enable();
> +    handled = vcpu_ioreq_handle_completion(v);
> +    local_irq_disable();
> +
> +    if ( !handled )
> +        return true;
> +#endif
> +
>       if ( likely(!v->arch.need_flush_to_ram) )
> -        return;
> +        return false;
>   
>       /*
>        * Give a chance for the pCPU to process work before handling the vCPU
> @@ -2277,6 +2289,8 @@ static void check_for_vcpu_work(void)
>       local_irq_enable();
>       p2m_flush_vm(v);
>       local_irq_disable();
> +
> +    return false;
>   }
>   
>   /*
> @@ -2289,7 +2303,13 @@ void leave_hypervisor_to_guest(void)
>   {
>       local_irq_disable();
>   
> -    check_for_vcpu_work();
> +    /*
> +     * check_for_vcpu_work() may return true if there are more work to before
> +     * the vCPU can safely resume. This gives us an opportunity to deschedule
> +     * the vCPU if needed.
> +     */
> +    while ( check_for_vcpu_work() )
> +        check_for_pcpu_work();
>       check_for_pcpu_work();
>   
>       vgic_sync_to_lrs();
> 

-- 
Julien Grall

