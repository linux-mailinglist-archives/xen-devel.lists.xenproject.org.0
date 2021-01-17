Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924552F951C
	for <lists+xen-devel@lfdr.de>; Sun, 17 Jan 2021 21:23:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69335.124035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1EaC-0006PL-65; Sun, 17 Jan 2021 20:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69335.124035; Sun, 17 Jan 2021 20:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1EaC-0006P0-37; Sun, 17 Jan 2021 20:23:32 +0000
Received: by outflank-mailman (input) for mailman id 69335;
 Sun, 17 Jan 2021 20:23:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i0Xk=GU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l1EaA-0006Ov-AN
 for xen-devel@lists.xenproject.org; Sun, 17 Jan 2021 20:23:30 +0000
Received: from mail-lj1-x229.google.com (unknown [2a00:1450:4864:20::229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4affaefb-67ed-4812-8c58-26951b81b857;
 Sun, 17 Jan 2021 20:23:28 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id f11so16110985ljm.8
 for <xen-devel@lists.xenproject.org>; Sun, 17 Jan 2021 12:23:28 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k18sm1492425ljb.80.2021.01.17.12.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 12:23:27 -0800 (PST)
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
X-Inumbo-ID: 4affaefb-67ed-4812-8c58-26951b81b857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Bv88lNTaugpE4LOunqEdlovzc3EII7dAtSOk9h0Fvbw=;
        b=Yyf5ivfw1doiO+hO7LoYWZp945j5tKQnzk7gNY0qyLCiGuRel4iTXbel1YmhZBWE6j
         /t8st3KYYgW69xwKfO+ZZMlkgtUd1At14PLV4H/dOxV6mh3gFUDAgTJtKUnltZgdre2I
         KYZUFYVy8Q0pd1KTspoEXOd3g1kvIT33p0JDywk3W18KEearOMMKJdM7FL+PN4H0DA31
         yTGSqDJmF0wzH8rhLcyAzuhnRH7E1LbJF6+Yup8eGa44LF8XcjIiAKcAZdNIf+X6+6DW
         3gSo4DbnA08iccTUxSEvIgaoafDbLX4P4Thv08q2+L447ur7rUdRMGmN6rA4ZKC/ht0q
         ZKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Bv88lNTaugpE4LOunqEdlovzc3EII7dAtSOk9h0Fvbw=;
        b=MR+LzZJwR+dF3tLZg/B6MwRx9wt2eY987463NoRevjFatRWWT8GnfOw+pSypRef/R2
         mIHuzxa7nOnGxVmVWUQz/zZpzRbgrSvx/ui7p0RavZj32l2EbHTKttrwZ9Vp/Vuu57ll
         LafAkAO4hN+M3w/dVZb2SqTBMiLNwMmxOtk/GSs+7NulDmRTBsalS/1h7nQxBtVeTGXP
         DprDFx50wK4KZsUbpfJCUu6GWp72uNEuQMCbvSRYoggwhbL3yB/+CIOEL4QOlEla3GJN
         MhkOMU3x3vPCUCM+tP8byKbBiSNtzirq5rcHJ/TlBzDKk+2QLlvD9V1+aYnNG9W+huOt
         Ejrg==
X-Gm-Message-State: AOAM530t5ePfJrFlgDKrVw/eJJu6pqB3s4+J/ylHKUUmaWpeaGExbQCp
	W5QmK5zpQIVD1sUJOJ1em6k=
X-Google-Smtp-Source: ABdhPJxTNeS4UIHHporV8DSHtnnTRq5c/shSNYTTlexyQNlri1UGWR/g3IUIRd7x5ZahF1u7T3C6Iw==
X-Received: by 2002:a2e:a40b:: with SMTP id p11mr9002202ljn.315.1610915007738;
        Sun, 17 Jan 2021 12:23:27 -0800 (PST)
Subject: Re: [PATCH V4 15/24] xen/arm: Stick around in
 leave_hypervisor_to_guest until I/O has completed
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-16-git-send-email-olekstysh@gmail.com>
 <1f1f910b-ebef-f071-3458-12ad493d6e79@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e57ca0f8-f92f-1ba3-d874-4265e1031542@gmail.com>
Date: Sun, 17 Jan 2021 22:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1f1f910b-ebef-f071-3458-12ad493d6e79@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 15.01.21 22:55, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien



>
> On 12/01/2021 21:52, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch adds proper handling of return value of
>> vcpu_ioreq_handle_completion() which involves using a loop in
>> leave_hypervisor_to_guest().
>>
>> The reason to use an unbounded loop here is the fact that vCPU shouldn't
>> continue until the I/O has completed.
>>
>> The IOREQ code is using wait_on_xen_event_channel(). Yet, this can
>> still "exit" early if an event has been received. But this doesn't mean
>> the I/O has completed (in can be just a spurious wake-up).
>
> While I agree we need the loop, I don't think the reason is correct 
> here. If you receive a spurious event, then the loop in wait_for_io() 
> will catch it.
>
> The only way to get out of that loop is if the I/O has been handled or 
> the state in the IOREQ page is invalid.
>
> In addition to that, handle_hvm_io_completion(), will only return 
> false if the state is invalid or there is vCPI work to do.

Agree, update description.


>
>
>> So we need
>> to check if the I/O has completed and wait again if it hasn't (we will
>> block the vCPU again until an event is received). This loop makes sure
>> that all the vCPU works are done before we return to the guest.
>>
>> The call chain below:
>> check_for_vcpu_work -> vcpu_ioreq_handle_completion -> wait_for_io ->
>> wait_on_xen_event_channel
>>
>> The worse that can happen here if the vCPU will never run again
>> (the I/O will never complete). But, in Xen case, if the I/O never
>> completes then it most likely means that something went horribly
>> wrong with the Device Emulator. And it is most likely not safe
>> to continue. So letting the vCPU to spin forever if the I/O never
>> completes is a safer action than letting it continue and leaving
>> the guest in unclear state and is the best what we can do for now.
>>
>> Please note, using this loop we will not spin forever on a pCPU,
>> preventing any other vCPUs from being scheduled. At every loop
>> we will call check_for_pcpu_work() that will process pending
>> softirqs. In case of failure, the guest will crash and the vCPU
>> will be unscheduled. In normal case, if the rescheduling is necessary
>> (might be set by a timer or by a caller in check_for_vcpu_work(),
>> where wait_for_io() is a preemption point) the vCPU will be rescheduled
>> to give place to someone else.
>>
> What you describe here is a bug that was introduced by this series. If 
> you think the code requires a separate patch, then please split off 
> patch #14 so the code callling vcpu_ioreq_handle_completion() happen here.
I am afraid, I don't understand which bug you are talking about, I just 
tried to explain why using a loop is not bad (there wouldn't be any 
impact to other vCPUs, etc) and the worse case which could happen.
Also I don't see a reason why the code requires a separate patch 
(probably, if I understood a bug I would see a reason ...) Could you 
please clarify?


>
>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
>
>> CC: Julien Grall <julien.grall@arm.com>
>> [On Arm only]
>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> Changes V1 -> V2:
>>     - new patch, changes were derived from (+ new explanation):
>>       arm/ioreq: Introduce arch specific bits for IOREQ/DM features
>>
>> Changes V2 -> V3:
>>     - update patch description
>>
>> Changes V3 -> V4:
>>     - update patch description and comment in code
>> ---
>>   xen/arch/arm/traps.c | 38 +++++++++++++++++++++++++++++++++-----
>>   1 file changed, 33 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index 036b13f..4a83e1e 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -2257,18 +2257,23 @@ static void check_for_pcpu_work(void)
>>    * Process pending work for the vCPU. Any call should be fast or
>>    * implement preemption.
>>    */
>> -static void check_for_vcpu_work(void)
>> +static bool check_for_vcpu_work(void)
>>   {
>>       struct vcpu *v = current;
>>     #ifdef CONFIG_IOREQ_SERVER
>> +    bool handled;
>> +
>>       local_irq_enable();
>> -    vcpu_ioreq_handle_completion(v);
>> +    handled = vcpu_ioreq_handle_completion(v);
>>       local_irq_disable();
>> +
>> +    if ( !handled )
>> +        return true;
>>   #endif
>>         if ( likely(!v->arch.need_flush_to_ram) )
>> -        return;
>> +        return false;
>>         /*
>>        * Give a chance for the pCPU to process work before handling 
>> the vCPU
>> @@ -2279,6 +2284,8 @@ static void check_for_vcpu_work(void)
>>       local_irq_enable();
>>       p2m_flush_vm(v);
>>       local_irq_disable();
>> +
>> +    return false;
>>   }
>>     /*
>> @@ -2291,8 +2298,29 @@ void leave_hypervisor_to_guest(void)
>>   {
>>       local_irq_disable();
>>   -    check_for_vcpu_work();
>> -    check_for_pcpu_work();
>> +    /*
>> +     * The reason to use an unbounded loop here is the fact that vCPU
>> +     * shouldn't continue until the I/O has completed.
>> +     *
>> +     * The worse that can happen here if the vCPU will never run again
>> +     * (the I/O will never complete). But, in Xen case, if the I/O 
>> never
>> +     * completes then it most likely means that something went horribly
>> +     * wrong with the Device Emulator. And it is most likely not safe
>> +     * to continue. So letting the vCPU to spin forever if the I/O 
>> never
>> +     * completes is a safer action than letting it continue and leaving
>> +     * the guest in unclear state and is the best what we can do for 
>> now.
>> +     *
>> +     * Please note, using this loop we will not spin forever on a pCPU,
>> +     * preventing any other vCPUs from being scheduled. At every loop
>> +     * we will call check_for_pcpu_work() that will process pending
>> +     * softirqs. In case of failure, the guest will crash and the vCPU
>> +     * will be unscheduled. In normal case, if the rescheduling is 
>> necessary
>> +     * (might be set by a timer or by a caller in 
>> check_for_vcpu_work(),
>> +     * the vCPU will be rescheduled to give place to someone else.
>
> TBH, I think this comment is a bit too much and sort of out of context 
> because this describing the inner implementation of 
> check_for_vcpu_work().
>
> How about the following:
>
> /*
>  * check_for_vcpu_work() may return true if there are more work to
>  * before the vCPU can safely resume. This gives us an opportunity
>  * to deschedule the vCPU if needed.
>  */

I am fine with that.


>
>> +     */
>> +    do {
>> +        check_for_pcpu_work();
>> +    } while ( check_for_vcpu_work() );
>
> So there are two important changes in this new implementation:
>   1) Without CONFIG_IOREQ_SERVER=y, we will call check_for_pcpu_work() 
> twice in a row when handling set/way.

hmm, yes


>
>   2) After handling the pCPU work, we will now return to the guest 
> directly. Before, we gave another opportunity for Xen to schedule a 
> different work. This means, we may return to the vCPU for a very short 
> time and will introduce more overhead.

yes, I haven't even imagined this could cause such difference in behavior


>
>
> So I would rework the loop to write it as:
>
> while ( check_for_pcpu_work() )
>    check_for_pcpu_work();
> check_for_pcpu_work();

makes sense, I assume you meant while ( check_for_vcpu_work() ) ...


>
>>         vgic_sync_to_lrs();
>>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


