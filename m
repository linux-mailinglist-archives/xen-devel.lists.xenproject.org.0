Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6BB2FF4C9
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 20:40:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72374.130262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2foK-00029q-Lv; Thu, 21 Jan 2021 19:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72374.130262; Thu, 21 Jan 2021 19:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2foK-00027g-Gh; Thu, 21 Jan 2021 19:40:04 +0000
Received: by outflank-mailman (input) for mailman id 72374;
 Thu, 21 Jan 2021 19:40:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2foJ-0001wH-2v
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 19:40:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2foI-0007d6-6m; Thu, 21 Jan 2021 19:40:02 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2foH-0005Gi-U1; Thu, 21 Jan 2021 19:40:02 +0000
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
	MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=lR2BODfHoCWxKyzmOtdSLUgIf3CXMN+271uJoy8t7Ks=; b=xRazhnmw8SPQlfsAwIgqqPaAa9
	dLo0aOCsS/fGgpe66oSQ0b68vWH4cP0u67gM7aJzjh5VUJSnMXy8UPaBDKeyxQtgJLzPK75mLUvlF
	xf/IYcYzvLQtsG2V8zVNudHqByXpa0K1CERLoWhDMGJSqHB04Bzs1yiIb4qgtTTC2S/s=;
Subject: Re: Null scheduler and vwfi native problem
To: Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
Date: Thu, 21 Jan 2021 19:40:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Dario,

On 21/01/2021 18:32, Dario Faggioli wrote:
> On Thu, 2021-01-21 at 11:54 +0100, Anders Törnqvist wrote:
>> Hi,
>> I see a problem with destroy and restart of a domain. Interrupts are
>> not
>> available when trying to restart a domain.
>>
>> The situation seems very similar to the thread "null scheduler bug"
>>   
>> https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg01213.html
>> .
>>
> Right. Back then, PCI passthrough was involved, if I remember
> correctly. Is it the case for you as well?

PCI passthrough is not yet supported on Arm :). However, the bug was 
reported with platform device passthrough.

[...]

>> "xl create" results in:
>> (XEN) IRQ 210 is already used by domain 1
>> (XEN) End of domain_destroy function
>>
>> Then repeated "xl create" looks the same until after a few tries I
>> also get:
>> (XEN) Begin of complete_domain_destroy function
>>
>> After that the next "xl create" creates the domain.
>>
>>
>> I have also applied the patch from
>>      
>> https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg02469.html
>> .
>> This does seem to change the results.
>>
> Ah... Really? That's a bit unexpected, TBH.
> 
> Well, I'll think about it. >
>> Starting the system without "sched=null vwfi=native" does not result
>> in
>> the problem.
>>
> Ok, how about, if you're up for some more testing:
> 
>   - booting with "sched=null" but not with "vwfi=native"
>   - booting with "sched=null vwfi=native" but not doing the IRQ
>     passthrough that you mentioned above
> 
> ?

I think we can skip the testing as the bug was fully diagnostics back 
then. Unfortunately, I don't think a patch was ever posted. The 
interesting bits start at [1]. Let me try to summarize here.

This has nothing to do with device passthrough, but the bug is easier to 
spot as interrupts are only going to be released when then domain is 
fully destroyed (we should really release them during the relinquish 
period...).

The last step of the domain destruction (complete_domain_destroy()) will 
*only* happen when all the CPUs are considered quiescent from the RCU PoV.

As you pointed out on that thread, the RCU implementation in Xen 
requires the pCPU to enter in the hypervisor (via hypercalls, 
interrupts...) time to time.

This assumption doesn't hold anymore when using "sched=null vwfi=native" 
because a vCPU will not exit when it is idling (vwfi=native) and there 
may not be any other source of interrupt on that vCPU.

Therefore the quiescent state will never be reached on the pCPU running 
that vCPU.

 From Xen PoV, any pCPU executing guest context can be considered 
quiescent. So one way to solve the problem would be to mark the pCPU 
when entering to the guest.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/acbeae1c-fda1-a079-322a-786d7528ecfc@arm.com/

-- 
Julien Grall

