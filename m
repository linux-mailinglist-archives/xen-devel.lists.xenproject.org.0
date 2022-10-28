Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE52610E13
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 12:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431866.684506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooMEh-0005tB-G9; Fri, 28 Oct 2022 10:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431866.684506; Fri, 28 Oct 2022 10:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooMEh-0005qo-DJ; Fri, 28 Oct 2022 10:05:11 +0000
Received: by outflank-mailman (input) for mailman id 431866;
 Fri, 28 Oct 2022 10:05:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ooMEf-0005iU-T0
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 10:05:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooMEf-00009X-H6; Fri, 28 Oct 2022 10:05:09 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.25.146]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooMEf-00060m-9M; Fri, 28 Oct 2022 10:05:09 +0000
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
	bh=02pRaLyPA6dmfIsjtU3K2Er7tP/eKbqk+HYFT8z0DDw=; b=xRtokPDI38DKxz0f3G0Oo5UKX8
	XOVVhegJAfKD8KrUt9LLRQNiDHt3bV19EsAzDTJz213HDqpcpCYvqOItWxQg+2lVueB94pFpWvQ8l
	MCqzl7ZWZ8irkOGoix5P7hwA2FXcAo/Ra2O/0XknrTZ4OKrlXggoH0XkXr8hYSKX9kNc=;
Message-ID: <b5640fc8-50b4-1153-0730-61c6a751f851@xen.org>
Date: Fri, 28 Oct 2022 11:05:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH] xen/arm: Do not route NS phys timer IRQ to Xen
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221028075630.32261-1-michal.orzel@amd.com>
 <ecd3e603-b1d1-210b-1212-3b9151f4bc3d@xen.org>
 <6413650b-efc4-8feb-2e70-f54044cdb0ef@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6413650b-efc4-8feb-2e70-f54044cdb0ef@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/10/2022 10:36, Michal Orzel wrote:
> Hi Julien,
> 
> On 28/10/2022 11:03, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> On 28/10/2022 08:56, Michal Orzel wrote:
>>> At the moment, we route NS phys timer IRQ to Xen even though it does not
>>> make use of this timer. Xen uses hypervisor timer for itself and the
>>> physical timer is fully emulated, hence there is nothing that can trigger
>>> such IRQ. This means that requesting/releasing IRQ ends up as a deadcode
>>> as it has no impact on the functional behavior, whereas the code within
>>> a handler ends up being unreachable. This is a left over from the early
>>> days when the CNTHP IRQ was buggy on the HW model used for testing and we
>>> had to use the CNTP instead.
>>>
>>> Remove the calls to {request/release}_irq for this timer as well as the
>>> code within the handler. Since timer_interrupt handler is now only used
>>> by the CNTHP, remove the IRQ affiliation condition. Keep the calls to
>>> zero the CNTP_CTL_EL0 register on timer init/deinit for sanity and also remove
>>> the corresponding perf counter definition.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> Based on the outcome of the following discussion:
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fxen-devel%2Fd55938a3-aaca-1d01-b34f-858dbca9830b%40amd.com%2F&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C4df8dc89b3124eb8f51608dab8c35ab3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638025446431622763%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=qeZR%2BBvOwKA9PKjq2xemSXhJ1Xij%2F%2FMWKADD70vrwW0%3D&amp;reserved=0
>>> ---
>>>    xen/arch/arm/include/asm/perfc_defn.h |  1 -
>>>    xen/arch/arm/time.c                   | 16 +---------------
>>>    2 files changed, 1 insertion(+), 16 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
>>> index 31f071222b24..3ab0391175d7 100644
>>> --- a/xen/arch/arm/include/asm/perfc_defn.h
>>> +++ b/xen/arch/arm/include/asm/perfc_defn.h
>>> @@ -70,7 +70,6 @@ PERFCOUNTER(spis,                 "#SPIs")
>>>    PERFCOUNTER(guest_irqs,           "#GUEST-IRQS")
>>>
>>>    PERFCOUNTER(hyp_timer_irqs,   "Hypervisor timer interrupts")
>>> -PERFCOUNTER(phys_timer_irqs,  "Physical timer interrupts")
>>>    PERFCOUNTER(virt_timer_irqs,  "Virtual timer interrupts")
>>>    PERFCOUNTER(maintenance_irqs, "Maintenance interrupts")
>>>
>>> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
>>> index dec53b5f7d53..3160fcc7b440 100644
>>> --- a/xen/arch/arm/time.c
>>> +++ b/xen/arch/arm/time.c
>>> @@ -222,8 +222,7 @@ int reprogram_timer(s_time_t timeout)
>>>    /* Handle the firing timer */
>>>    static void timer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
>>>    {
>>> -    if ( irq == (timer_irq[TIMER_HYP_PPI]) &&
>>> -         READ_SYSREG(CNTHP_CTL_EL2) & CNTx_CTL_PENDING )
>>> +    if ( READ_SYSREG(CNTHP_CTL_EL2) & CNTx_CTL_PENDING )
>>
>> AFAICT, this condition is meant to be true most of the times. So as you
>> are modifying the code, could you take the opportunity to add a
>> "likely()"? Or better invert the condition so the code below is not
>> indented.
> 
> Sure thing. I can take the opportunity to do the following:
> if ( unlikely(!(READ_SYSREG(CNTHP_CTL_EL2) & CNTx_CTL_PENDING)) )
>      return;
> 
> Also, shouldn't we reflect the purpose of this handler by renaming it
> from timer_interrupt to htimer_interrupt (or hyp_timer_interrupt) to be consistent
> with the naming (i.e. vtimer_interrupt -> virtual, timer_interrupt -> quite ambiguous given the usage)?

I am fine with that.

Cheers,

-- 
Julien Grall

