Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0CB8D7E32
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 11:12:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734770.1140840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE3jx-0006af-Vv; Mon, 03 Jun 2024 09:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734770.1140840; Mon, 03 Jun 2024 09:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE3jx-0006Yc-Si; Mon, 03 Jun 2024 09:12:29 +0000
Received: by outflank-mailman (input) for mailman id 734770;
 Mon, 03 Jun 2024 09:12:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sE3jw-0006YR-S3
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 09:12:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sE3jw-0004fk-FM; Mon, 03 Jun 2024 09:12:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sE3jw-0002ct-6B; Mon, 03 Jun 2024 09:12:28 +0000
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
	bh=SGNt6sgQWcRp+LOkKoBj2bt1R/frYQwbiZGXnrYXUXc=; b=JuaG2HBJAuEq3pXy2Gqkn2Psnk
	urT0SEqcXtmWfxXoDTnAW4Vk0VjNjwdu/IeNndER5v0vsAHGzYQMxHuJvblKijpDgpnN69NI92k0o
	oDeCWIrgeEALxVN8GYnC+ukp/S9poAMUYNGWI94f/PbYS36RS/IrYbX7qFONZdNt7ccc=;
Message-ID: <39045a8f-ea18-4264-b540-66645751d27d@xen.org>
Date: Mon, 3 Jun 2024 10:12:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 7/7] xen/arm: ffa: support notification
Content-Language: en-GB
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "patches@linaro.org" <patches@linaro.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240529072559.2486986-1-jens.wiklander@linaro.org>
 <20240529072559.2486986-8-jens.wiklander@linaro.org>
 <C52D6A7C-1136-4BF1-9060-600157F641F5@arm.com>
 <CAHUa44GRNQV4X61YPZTxO+tkkwJS9hoqQ07U9vP1k6n1zUt9rQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAHUa44GRNQV4X61YPZTxO+tkkwJS9hoqQ07U9vP1k6n1zUt9rQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jens,

On 03/06/2024 10:01, Jens Wiklander wrote:
> On Fri, May 31, 2024 at 4:28 PM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>
>> Hi Jens,
>>
>>> On 29 May 2024, at 09:25, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>>>
>>> Add support for FF-A notifications, currently limited to an SP (Secure
>>> Partition) sending an asynchronous notification to a guest.
>>>
>>> Guests and Xen itself are made aware of pending notifications with an
>>> interrupt. The interrupt handler triggers a tasklet to retrieve the
>>> notifications using the FF-A ABI and deliver them to their destinations.
>>>
>>> Update ffa_partinfo_domain_init() to return error code like
>>> ffa_notif_domain_init().
>>>
>>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>>> ---
>>> v4->v5:
>>> - Move the freeing of d->arch.tee to the new TEE mediator free_domain_ctx
>>>   callback to make the context accessible during rcu_lock_domain_by_id()
>>>   from a tasklet
>>> - Initialize interrupt handlers for secondary CPUs from the new TEE mediator
>>>   init_interrupt() callback
>>> - Restore the ffa_probe() from v3, that is, remove the
>>>   presmp_initcall(ffa_init) approach and use ffa_probe() as usual now that we
>>>   have the init_interrupt callback.
>>> - A tasklet is added to handle the Schedule Receiver interrupt. The tasklet
>>>   finds each relevant domain with rcu_lock_domain_by_id() which now is enough
>>>   to guarantee that the FF-A context can be accessed.
>>> - The notification interrupt handler only schedules the notification
>>>   tasklet mentioned above
>>>
>>> v3->v4:
>>> - Add another note on FF-A limitations
>>> - Clear secure_pending in ffa_handle_notification_get() if both SP and SPM
>>>   bitmaps are retrieved
>>> - ASSERT that ffa_rcu_lock_domain_by_vm_id() isn't passed the vm_id FF-A
>>>   uses for Xen itself
>>> - Replace the get_domain_by_id() call done via ffa_get_domain_by_vm_id() in
>>>   notif_irq_handler() with a call to rcu_lock_live_remote_domain_by_id() via
>>>   ffa_rcu_lock_domain_by_vm_id()
>>> - Remove spinlock in struct ffa_ctx_notif and use atomic functions as needed
>>>   to access and update the secure_pending field
>>> - In notif_irq_handler(), look for the first online CPU instead of assuming
>>>   that the first CPU is online
>>> - Initialize FF-A via presmp_initcall() before the other CPUs are online,
>>>   use register_cpu_notifier() to install the interrupt handler
>>>   notif_irq_handler()
>>> - Update commit message to reflect recent updates
>>>
>>> v2->v3:
>>> - Add a GUEST_ prefix and move FFA_NOTIF_PEND_INTR_ID and
>>>   FFA_SCHEDULE_RECV_INTR_ID to public/arch-arm.h
>>> - Register the Xen SRI handler on each CPU using on_selected_cpus() and
>>>   setup_irq()
>>> - Check that the SGI ID retrieved with FFA_FEATURE_SCHEDULE_RECV_INTR
>>>   doesn't conflict with static SGI handlers
>>>
>>> v1->v2:
>>> - Addressing review comments
>>> - Change ffa_handle_notification_{bind,unbind,set}() to take struct
>>>   cpu_user_regs *regs as argument.
>>> - Update ffa_partinfo_domain_init() and ffa_notif_domain_init() to return
>>>   an error code.
>>> - Fixing a bug in handle_features() for FFA_FEATURE_SCHEDULE_RECV_INTR.
>>> ---
>>> xen/arch/arm/tee/Makefile       |   1 +
>>> xen/arch/arm/tee/ffa.c          |  72 +++++-
>>> xen/arch/arm/tee/ffa_notif.c    | 409 ++++++++++++++++++++++++++++++++
>>> xen/arch/arm/tee/ffa_partinfo.c |   9 +-
>>> xen/arch/arm/tee/ffa_private.h  |  56 ++++-
>>> xen/arch/arm/tee/tee.c          |   2 +-
>>> xen/include/public/arch-arm.h   |  14 ++
>>> 7 files changed, 548 insertions(+), 15 deletions(-)
>>> create mode 100644 xen/arch/arm/tee/ffa_notif.c
>>>
> [...]
>>>
>>> @@ -517,8 +567,10 @@ err_rxtx_destroy:
>>> static const struct tee_mediator_ops ffa_ops =
>>> {
>>>      .probe = ffa_probe,
>>> +    .init_interrupt = ffa_notif_init_interrupt,
>>
>> With the previous change on init secondary i would suggest to
>> have a ffa_init_secondary here actually calling the ffa_notif_init_interrupt.
> 
> Yes, that makes sense. I'll update.
> 
>>
>>>      .domain_init = ffa_domain_init,
>>>      .domain_teardown = ffa_domain_teardown,
>>> +    .free_domain_ctx = ffa_free_domain_ctx,
>>>      .relinquish_resources = ffa_relinquish_resources,
>>>      .handle_call = ffa_handle_call,
>>> };
>>> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
>>> new file mode 100644
>>> index 000000000000..e8e8b62590b3
>>> --- /dev/null
>>> +++ b/xen/arch/arm/tee/ffa_notif.c
> [...]
>>> +static void notif_vm_pend_intr(uint16_t vm_id)
>>> +{
>>> +    struct ffa_ctx *ctx;
>>> +    struct domain *d;
>>> +    struct vcpu *v;
>>> +
>>> +    /*
>>> +     * vm_id == 0 means a notifications pending for Xen itself, but
>>> +     * we don't support that yet.
>>> +     */
>>> +    if ( !vm_id )
>>> +        return;
>>> +
>>> +    d = ffa_rcu_lock_domain_by_vm_id(vm_id);
>>> +    if ( !d )
>>> +        return;
>>> +
>>> +    ctx = d->arch.tee;
>>> +    if ( !ctx )
>>> +        goto out_unlock;
>>
>> In both previous cases you are silently ignoring an interrupt
>> due to an internal error.
>> Is this something that we should trace ? maybe just debug ?
>>
>> Could you add a comment to explain why this could happen
>> (when possible) or not and the possible side effects ?
>>
>> The second one would be a notification for a domain without
>> FF-A enabled which is ok but i am a bit more wondering on
>> the first one.
> 
> The SPMC must be out of sync in both cases. I've been looking for a
> window where that can happen, but I can't find any. SPMC is called
> with FFA_NOTIFICATION_BITMAP_DESTROY during domain teardown so the
> SPMC shouldn't try to deliver any notifications after that.

I don't think I agree with the conclusion. I believe, this can also 
happen in normal operation.

For example, the SPMC could have trigger the interrupt before 
FFA_NOTIFICATION_BITMAP_DESTROY but Xen didn't handle the interrupt (or 
run the tasklet) until later.

This could be at the time where the domain has been fully destroyed or 
even when...

> In the second case, the domain ID might have been reused for a domain
> without FF-A enabled, but the SPMC should have known that already.

... a new domain has been created. Although, the latter is rather unlikely.

So what if the new domain has FFA enabled? Is there any potential 
security issue?

Cheers,

-- 
Julien Grall

