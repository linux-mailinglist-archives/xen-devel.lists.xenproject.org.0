Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9676D0AE4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 18:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516797.801499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phv0L-0002KC-5p; Thu, 30 Mar 2023 16:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516797.801499; Thu, 30 Mar 2023 16:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phv0L-0002HU-2W; Thu, 30 Mar 2023 16:20:01 +0000
Received: by outflank-mailman (input) for mailman id 516797;
 Thu, 30 Mar 2023 16:19:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1phv0J-0002HO-9O
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 16:19:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phv0I-0001a1-Tv; Thu, 30 Mar 2023 16:19:58 +0000
Received: from [15.248.2.61] (helo=[10.24.67.13])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phv0I-0001f8-LE; Thu, 30 Mar 2023 16:19:58 +0000
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
	bh=fFay2VQGBFo8b+MWU800+V6xqHR5dczPyfrocxzUJ5E=; b=VvCTXwQOw8Kp9wyCMC8F+huW43
	i/niujTAPDpmhLWC8hY+tpX0wbI1rXPBcGy5LSYExiwxrbe8P0BNHmlFKKLJMhQEa2CwxT6u38JAk
	HaJSLwFbShVIEaJAMalqeha1sKpeaULaRn1VWY8uqktHYrnB6ae11XB3iqR1TOaEUVNM=;
Message-ID: <e556f895-2b3f-92eb-a6be-e51f04fc869d@xen.org>
Date: Thu, 30 Mar 2023 17:19:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: Need help on a issue (Unable to schedule guest for Xen on Arm)
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "Garhwal, Vikram" <vikram.garhwal@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>
References: <b4badb12-8887-d8d8-138e-8b4536ad95a4@amd.com>
 <2f7a00eb-50c9-bee7-231e-9285ffa4c9a9@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2f7a00eb-50c9-bee7-231e-9285ffa4c9a9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 30/03/2023 16:57, Ayan Kumar Halder wrote:
> (Apologies, fixed the formatting issue)

Hi,

> 
> On 30/03/2023 16:50, Ayan Kumar Halder wrote:
>> Hi Xen experts,
>>
>> I need some pointers on an issue I am facing.
>>
>> I am running my downstream port of Xen on Cortex-R52 hardware. The 
>> hardware consist of two R52 cores (the second core is in lockstep 
>> mode). So, currently the hardware does not support SMP.
>>
>> The issue is that Xen is unable to schedule a guest.

Are you sure about this? Because...

> So 
>> leave_hypervisor_to_guest() ---> check_for_pcpu_work() and this does 
>> not return.

... leave_hypervisor_to_guest() indicates that a guest vCPU was 
scheduled. Before we return to the guest we always check if there is 
some softirq that need to be handled. So...

>>
>> Debugging this, I see  check_for_pcpu_work() --> do_softirq() --> 
>> __do_softirq() --> timer_softirq_action().

.. the fact that check_for_pcpu_work() doesn't return seems to indicate 
that there is a softirq that is always pending. Can you look which one 
it is?

>>
>> In timer_softirq_action(), the problem I see is that for all the 
>> timers, "((t = heap[1])->expires < now)" is true.
>>
>>     while ( (heap_metadata(heap)->size != 0) &&
>>             ((t = heap[1])->expires < now) )
>>     {
>>         remove_from_heap(heap, t); <<<<------ So, this gets invoked 
>> for all the timers.
>>         execute_timer(ts, t);
>>     }
>>
>> So, further below reprogram_timer() gets invoked with timeout = 0 and 
>> it disables the timer. So, timer_interrupt() is never invoked.

Which is expected because there is no timer armed, so there is no need 
to configure the physical timer.

>>
>> Can someone give any pointers on what the underlying issue could be 
>> and how to debug further ?

See above. You could also look why there is no softtimer pending and/or 
where Xen is stuck (e.g. the PC).

>>
>> I do not observe this behavior while running on R52 FVP. The 
>> difference is that for most of the timers "((t = heap[1])->expires < 
>> now)" is false, so reprogram_timer() gets invoked with non zero 
>> timeout and subsequently, the timer_interrupt() get invoked.
This reads as one of the following:
   1) There is a missing barrier
   2) You didn't properly configure some registers
   3) There is an HW errata (I know that some of the Cortex-A had an 
issue in when reading the Timer counter but seems unlikely here)

>>
>> Also, looking at the following from xen/arch/arm/time.c.
> 
> /* Set the timer to wake us up at a particular time.
>   * Timeout is a Xen system time (nanoseconds since boot); 0 disables 
> the timer.
>   * Returns 1 on success; 0 if the timeout is too soon or is in the 
> past. */
> int reprogram_timer(s_time_t timeout)
> {
>      uint64_t deadline;
> 
>      if ( timeout == 0 )
>      {
>          WRITE_SYSREG(0, CNTHP_CTL_EL2);
>          return 1; <<<<<<<<<<<<<<<<<<<<<<-------------- Shouldn't this 
> be 0 as the comment suggets ?

I think 1 is correct because we want to disable the timer so this is a 
success. 0 should be return if this was effectively a timeout.

FWIW, x86 also seems to return 1 when the timeout is 0.

>      }
> 
>      deadline = ns_to_ticks(timeout) + boot_count;
>      WRITE_SYSREG64(deadline, CNTHP_CVAL_EL2);
>      WRITE_SYSREG(CNTx_CTL_ENABLE, CNTHP_CTL_EL2);
>      isb();
> 
>      /* No need to check for timers in the past; the Generic Timer fires
>       * on a signed 63-bit comparison. */
>      return 1;
> }
> 
>> Kind regards,
>>
>> Ayan
>>
>>
>>
>>

-- 
Julien Grall

