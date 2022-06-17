Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF17D54F679
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 13:12:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351319.577937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o29tj-00035r-Cq; Fri, 17 Jun 2022 11:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351319.577937; Fri, 17 Jun 2022 11:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o29tj-00033C-A0; Fri, 17 Jun 2022 11:12:19 +0000
Received: by outflank-mailman (input) for mailman id 351319;
 Fri, 17 Jun 2022 11:12:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o29th-000336-Ez
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 11:12:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o29te-000115-4o; Fri, 17 Jun 2022 11:12:14 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.0.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o29td-0006Bd-TH; Fri, 17 Jun 2022 11:12:14 +0000
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
	bh=DWlmvQWn5M+xdNlJjkcI7Mh1FGa8W6Sqj4MhjphrdT0=; b=SHcqf6jd9R5FLrMMXNpMGpqZxE
	8mox2Dnv1k0PftmDT6sBbXW7FBYjF2Gye19P40CIcn6WCZB+bfqEGazwOwXhRd82ZSbfZx/tOa+PA
	w2HOKolv4I0PRCqNlCr8zpJ5hQHjZ56YU4QOCzNlWJBRmxY8fBhO86vVCgCT2VejOdWU=;
Message-ID: <f260703d-4651-f9e9-3713-9e85a51b1d70@xen.org>
Date: Fri, 17 Jun 2022 12:12:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] xen: Don't call panic if ARM TF cpu off returns DENIED
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "dmitry.semenets@gmail.com" <dmitry.semenets@gmail.com>,
 Dmytro Semenets <Dmytro_Semenets@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220616135541.3333760-1-dmitry.semenets@gmail.com>
 <cf7660da-0bde-865e-7c22-a2e21e31fae5@xen.org> <87wndgh2og.fsf@epam.com>
 <67f56cdd-531b-72fc-1257-214d078f6bb6@xen.org> <87pmj7hczg.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <87pmj7hczg.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/06/2022 10:10, Volodymyr Babchuk wrote:
> Julien Grall <julien@xen.org> writes:
> 
>> On 16/06/2022 19:40, Volodymyr Babchuk wrote:
>>> Hi Julien,
>>
>> Hi Volodymyr,
>>
>>> Julien Grall <julien@xen.org> writes:
>>>
>>>> Hi,
>>>>
>>>> On 16/06/2022 14:55, dmitry.semenets@gmail.com wrote:
>>>>> From: Dmytro Semenets <dmytro_semenets@epam.com>
>>>>> According to PSCI specification ARM TF can return DENIED on CPU OFF.
>>>>
>>>> I am confused. The spec is talking about Trusted OS and not
>>>> firmware. The docummentation is also not specific to ARM Trusted
>>>> Firmware. So did you mean "Trusted OS"?
>>> It should be "firmware", I believe.
>>
>> Hmmm... I couldn't find a reference in the spec suggesting that
>> CPU_OFF could return DENIED because of the firmware. Do you have a
>> pointer to the spec?
> 
> Ah, looks like we are talking about different things. Indeed, CPU_OFF
> can return DENIED only because of Trusted OS. But entity that *returns*
> the error to a caller is a firmware.

Right, the interesting part is *why* DENIED is returned not *who* 
returns it.
>>>>> Refer to "Arm Power State Coordination Interface (DEN0022D.b)"
>>>>> section 5.5.2
>>>>
>>>> Reading both 5.5.2 and 5.9.1 together, DENIED would be returned when
>>>> the trusted OS can only run on one core.
>>>>
>>>> Some of the trusted OS are migratable. So I think we should first
>>>> attempt to migrate the CPU. Then if it doesn't work, we should prevent
>>>> the CPU to go offline.
>>>>
>>>> That said, upstream doesn't support cpu offlining (I don't know for
>>>> your use case). In case of shutdown, it is not necessary to offline
>>>> the CPU, so we could avoid to call CPU_OFF on all CPUs but
>>>> one. Something like:
>>>>
>>> This is even better approach yes. But you mentioned CPU_OFF. Did you
>>> mean SYSTEM_RESET?
>>
>> By CPU_OFF I was referring to the fact that Xen will issue the call
>> all CPUs but one. The remaining CPU will issue the command to
>> reset/shutdown the system.
>>
> 
> I just want to clarify: change that you suggested removes call to
> stop_cpu() in halt_this_cpu(). So no CPU_OFF will be sent at all.

I was describing the existing behavior.

> 
> All CPUs except one will spin in
> 
>      while ( 1 )
>          wfi();
> 
> while last cpu will issue SYSTEM_OFF or SYSTEM_RESET.
> 
> Is this correct?

Yes.

> 
>>>>    void machine_halt(void)
>>>> @@ -21,10 +23,6 @@ void machine_halt(void)
>>>>        smp_call_function(halt_this_cpu, NULL, 0);
>>>>        local_irq_disable();
>>>>
>>>> -    /* Wait at most another 10ms for all other CPUs to go offline. */
>>>> -    while ( (num_online_cpus() > 1) && (timeout-- > 0) )
>>>> -        mdelay(1);
>>>> -
>>>>        /* This is mainly for PSCI-0.2, which does not return if success. */
>>>>        call_psci_system_off();
>>>>
>>>>> Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
>>>>> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>>>
>>>> I don't recall to see patch on the ML recently for this. So is this an
>>>> internal review?
>>> Yeah, sorry about that. Dmytro is a new member in our team and he is
>>> not
>>> yet familiar with differences in internal reviews and reviews in ML.
>>
>> No worries. I usually classify internal review anything that was done
>> privately. This looks to be a public review, althought not on
>> xen-devel.
>>
>> I understand that not all some of the patches are still in PoC stage
>> and doing the review on your github is a good idea. But for those are
>> meant to be for upstream (e.g. bug fixes, small patches), I would
>> suggest to do the review on xen-devel directly.
> 
> It not always clear if patch is eligible for upstream. At first we
> thought that problem is platform-specific and we weren't sure that we
> will find a proper upstreamable fix. 

You can guess but not be sure until you send it to upstrema :). In fact,...

> Probably you saw that PR's name
> quite differs from final patch. This is because initial solution was
> completely different from final one.

... even before looking at your PR, this was the first solution I had in 
mind. I am still pondering whether this could be the best approach 
because I have the suspicion there might be some platform out relying on 
receiving the shutdown request on CPU0.

Anyway, this is so far just theorical, my proposal should solve your 
problem.

On a separate topic, the community is aiming to support a wide range of 
platforms out-of-the-box. I think platform-specific patches are 
acceptable so long they are self-contained (to some extend. I.e if you 
ask to support Xen on RPI3 then I would still probably argue against :)) 
or have a limited impact to the rest of the users (this is why we have 
alternative in Xen).

My point here is your initial solution may have been the preferred 
approach for upstream. So if you involve the community early, you are 
reducing the risk to have to backtrack and/or spend extra time in the 
wrong directions.

Cheers,

-- 
Julien Grall

