Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C93FA803E4D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 20:24:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647287.1010262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAEYC-0000a8-1T; Mon, 04 Dec 2023 19:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647287.1010262; Mon, 04 Dec 2023 19:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAEYB-0000Y9-VB; Mon, 04 Dec 2023 19:24:15 +0000
Received: by outflank-mailman (input) for mailman id 647287;
 Mon, 04 Dec 2023 19:24:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rAEYB-0000Y3-H4
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 19:24:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAEYA-0001WE-QO; Mon, 04 Dec 2023 19:24:14 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.23.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAEYA-00027p-Kb; Mon, 04 Dec 2023 19:24:14 +0000
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
	bh=laiipq6V+pqUiURzB1RVLNgF5DKpwY/uwkGOl+Bc+CQ=; b=bCNnj/yVVY0r7gWHaFh2jvYC/o
	hydUxU6uozcBwtcAqit8gF7oe4/zDwxeebafILvqJBY4k+JmVw2hpbzH4zOcgzXE/qGjwxBJDZ05b
	f2KPkbzkRw+1YYPpimUJbap9JwBqSCwubXTN1Z4ZKFMskP2c1aK7yvwC76zsEtEgPISU=;
Message-ID: <232c2496-77d6-4e37-a400-dbefd135ef3c@xen.org>
Date: Mon, 4 Dec 2023 19:24:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH] xen/arm: ffa: reclaim shared memory on guest
 destroy
Content-Language: en-GB
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: patches@linaro.org, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20231204075552.3585875-1-jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231204075552.3585875-1-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

On 04/12/2023 07:55, Jens Wiklander wrote:
> When an FF-A enabled guest is destroyed it may leave behind memory
> shared with SPs. This memory must be reclaimed before it's reused or an
> SP may make changes to memory used by a new unrelated guest. So when the
> domain is teared down add FF-A requests to reclaim all remaining shared
> memory.
> 
> SPs in the secure world are notified using VM_DESTROYED that a guest has
> been destroyed. An SP is supposed to relinquish all shared memory to allow
> reclaiming the memory. The relinquish operation may need to be delayed if
> the shared memory is for instance part of a DMA operation.
> 
> If the FF-A memory reclaim request fails, return -ERESTART to retry
> again. This will effectively block the destruction of the guest until
> all memory has been reclaimed.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> Hi,
> 
> This patch is a bit crude, but gets the job done. In a well designed
> system this might even be good enough since the SP or the secure world
> will let the memory be reclaimed and we can move on. But, if for some
> reason reclaiming the memory is refused it must not be possible to reuse
> the memory.

IIUC, we are trying to harden against a buggy SP. Is that correct?

> 
> These shared memory ranges are typically quite small compared to the
> total memory usage of a guest so it would be an improvement if only
> refused shared memory ranges where set aside from future reuse while the
> guest was destroyed and other resources made available for reuse. This
> could be done by for instance assign the refused shared memory ranges
> to a dummy VM like DOMID_IO.

I like the idea to use a dummy VM, but I don't think DOMID_IO is right. 
Once teardown has completed, the domain will stay around until the last 
reference on all pages are dropped. At this point, the amount of memory 
left-over is minimum (this is mostly bookeeping in Xen).

 From the userland PoV, the domain will still show-up in the list but 
tools like "xl list" will show "(null)". They are called zombie domains.

So I would consider to keep the same domain around. The advantage is you 
can call "xl destroy" again to retry the operation.

> 
> Thanks,
> Jens
> ---
>   xen/arch/arm/tee/ffa.c | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 183528d13388..9c596462a8a2 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -1539,6 +1539,7 @@ static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
>   static int ffa_domain_teardown(struct domain *d)
>   {
>       struct ffa_ctx *ctx = d->arch.tee;
> +    struct ffa_shm_mem *shm, *tmp;
>       unsigned int n;
>       int32_t res;
>   
> @@ -1564,10 +1565,45 @@ static int ffa_domain_teardown(struct domain *d)
>               printk(XENLOG_ERR "ffa: Failed to report destruction of vm_id %u to  %u: res %d\n",
>                      get_vm_id(d), subscr_vm_destroyed[n], res);
>       }
> +    /*
> +     * If this function is called again due to -ERESTART below, make sure
> +     * not to send the FFA_MSG_SEND_VM_DESTROYED's.
> +     */
> +    subscr_vm_destroyed_count = 0;

AFAICT, this variable is global. So wouldn't you effectively break other 
domain if let say the unmapping error is temporary?

>   
>       if ( ctx->rx )
>           rxtx_unmap(ctx);
>   
> +
> +    list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
> +    {
> +        register_t handle_hi;
> +        register_t handle_lo;
> +
> +        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> +        res = ffa_mem_reclaim(handle_lo, handle_hi, 0);

Is this call expensive? If so, we may need to handle continuation here.

> +        if ( res )
> +        {
> +            printk(XENLOG_INFO, "ffa: Failed to reclaim handle %#lx : %d\n",
> +                   shm->handle, res);

I think you want to use XENLOG_G_INFO to use the guest ratelimit. Also, 
I would suggest to print the domain ID in the logs (see '%pd').


> +        }
> +        else
> +        {
> +            printk(XENLOG_DEBUG, "ffa: Reclaimed handle %#lx\n", shm->handle);

Same here. You want to use XENLOG_G_DEBUG and print the domain ID.

> +            ctx->shm_count--;
> +            list_del(&shm->list);
> +        }
> +    }

NIT: New line here please for clarity.

> +    if ( !list_empty(&ctx->shm_list) )
> +    {
> +        printk(XENLOG_INFO, "ffa: Remaining unclaimed handles, retrying\n");

Same as the other printks.

> +        /*
> +         * TODO: add a timeout where we either panic or let the guest be
> +         * fully destroyed.
> +         */
Timeout with proper handling would be a solution. I am not sure about 
panic-ing. Do you think the TEE would be in a bad state if we can't 
release memory?

> +        return -ERESTART;
> +    }
> +
>       XFREE(d->arch.tee);
>   
>       return 0;

Cheers,

-- 
Julien Grall

