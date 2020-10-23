Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7C429721E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 17:19:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11077.29353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVyqR-0007Uh-DK; Fri, 23 Oct 2020 15:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11077.29353; Fri, 23 Oct 2020 15:19:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVyqR-0007UI-AH; Fri, 23 Oct 2020 15:19:07 +0000
Received: by outflank-mailman (input) for mailman id 11077;
 Fri, 23 Oct 2020 15:19:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVyqQ-0007UD-IE
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:19:06 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0200c312-1c6f-45dd-a5b8-87e6b3d3ff4d;
 Fri, 23 Oct 2020 15:19:05 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVyqN-0006P2-Ri; Fri, 23 Oct 2020 15:19:03 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVyqN-00068L-GT; Fri, 23 Oct 2020 15:19:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVyqQ-0007UD-IE
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:19:06 +0000
X-Inumbo-ID: 0200c312-1c6f-45dd-a5b8-87e6b3d3ff4d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0200c312-1c6f-45dd-a5b8-87e6b3d3ff4d;
	Fri, 23 Oct 2020 15:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=mFHRwWJrpdUpMhPQ0g1QtGVM9bmtQzilbEwf6bnBV80=; b=EJKS5CTRpMYK5//51+qmiNgUGB
	0dZcapUL7JKj/KrTl6GF7zE0z9m4bjDof76u1KocLByEt5dBWN4BH3BWKA+cm1mSbu3zTV1N0rwsG
	0wuBB1+B7bq7Pk2AS5jmlVWScRpLerzIshhHfXeWvyKhKXVigupcNxwWWZe6fNkKqAzY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVyqN-0006P2-Ri; Fri, 23 Oct 2020 15:19:03 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVyqN-00068L-GT; Fri, 23 Oct 2020 15:19:03 +0000
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org>
 <BBF09ABE-29A6-4990-8DA2-B44086E9C88C@arm.com>
 <1082f30e-0ce8-00b1-e120-194ff874a9ba@xen.org>
 <alpine.DEB.2.21.2010221631440.12247@sstabellini-ThinkPad-T480s>
 <D8EF4B06-B64D-4264-8C86-DA1B5A1146D2@arm.com>
 <7314936f-6c1e-5ca6-a33b-973c8e61ba3b@xen.org>
 <D9F93137-412F-47E5-A55C-85D1F3745618@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2813ea2b-bfc4-0590-47ef-86089ad65a5d@xen.org>
Date: Fri, 23 Oct 2020 16:19:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <D9F93137-412F-47E5-A55C-85D1F3745618@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 23/10/2020 15:27, Rahul Singh wrote:
> Hello Julien,
> 
>> On 23 Oct 2020, at 2:00 pm, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 23/10/2020 12:35, Rahul Singh wrote:
>>> Hello,
>>>> On 23 Oct 2020, at 1:02 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>
>>>> On Thu, 22 Oct 2020, Julien Grall wrote:
>>>>>>> On 20/10/2020 16:25, Rahul Singh wrote:
>>>>>>>> Add support for ARM architected SMMUv3 implementations. It is based on
>>>>>>>> the Linux SMMUv3 driver.
>>>>>>>> Major differences between the Linux driver are as follows:
>>>>>>>> 1. Only Stage-2 translation is supported as compared to the Linux driver
>>>>>>>>     that supports both Stage-1 and Stage-2 translations.
>>>>>>>> 2. Use P2M  page table instead of creating one as SMMUv3 has the
>>>>>>>>     capability to share the page tables with the CPU.
>>>>>>>> 3. Tasklets is used in place of threaded IRQ's in Linux for event queue
>>>>>>>>     and priority queue IRQ handling.
>>>>>>>
>>>>>>> Tasklets are not a replacement for threaded IRQ. In particular, they will
>>>>>>> have priority over anything else (IOW nothing will run on the pCPU until
>>>>>>> they are done).
>>>>>>>
>>>>>>> Do you know why Linux is using thread. Is it because of long running
>>>>>>> operations?
>>>>>>
>>>>>> Yes you are right because of long running operations Linux is using the
>>>>>> threaded IRQs.
>>>>>>
>>>>>> SMMUv3 reports fault/events bases on memory-based circular buffer queues not
>>>>>> based on the register. As per my understanding, it is time-consuming to
>>>>>> process the memory based queues in interrupt context because of that Linux
>>>>>> is using threaded IRQ to process the faults/events from SMMU.
>>>>>>
>>>>>> I didn’t find any other solution in XEN in place of tasklet to defer the
>>>>>> work, that’s why I used tasklet in XEN in replacement of threaded IRQs. If
>>>>>> we do all work in interrupt context we will make XEN less responsive.
>>>>>
>>>>> So we need to make sure that Xen continue to receives interrupts, but we also
>>>>> need to make sure that a vCPU bound to the pCPU is also responsive.
>>>>>
>>>>>>
>>>>>> If you know another solution in XEN that will be used to defer the work in
>>>>>> the interrupt please let me know I will try to use that.
>>>>>
>>>>> One of my work colleague encountered a similar problem recently. He had a long
>>>>> running tasklet and wanted to be broken down in smaller chunk.
>>>>>
>>>>> We decided to use a timer to reschedule the taslket in the future. This allows
>>>>> the scheduler to run other loads (e.g. vCPU) for some time.
>>>>>
>>>>> This is pretty hackish but I couldn't find a better solution as tasklet have
>>>>> high priority.
>>>>>
>>>>> Maybe the other will have a better idea.
>>>>
>>>> Julien's suggestion is a good one.
>>>>
>>>> But I think tasklets can be configured to be called from the idle_loop,
>>>> in which case they are not run in interrupt context?
>>>>
>>>   Yes you are right tasklet will be scheduled from the idle_loop that is not interrupt conext.
>>
>> This depends on your tasklet. Some will run from the softirq context which is usually (for Arm) on the return of an exception.
>>
> 
> Thanks for the info. I will check and will get better understanding of the tasklet how it will run in XEN.
> 
>>>>
>>>>>>>> 4. Latest version of the Linux SMMUv3 code implements the commands queue
>>>>>>>>     access functions based on atomic operations implemented in Linux.
>>>>>>>
>>>>>>> Can you provide more details?
>>>>>>
>>>>>> I tried to port the latest version of the SMMUv3 code than I observed that
>>>>>> in order to port that code I have to also port atomic operation implemented
>>>>>> in Linux to XEN. As latest Linux code uses atomic operation to process the
>>>>>> command queues (atomic_cond_read_relaxed(),atomic_long_cond_read_relaxed() ,
>>>>>> atomic_fetch_andnot_relaxed()) .
>>>>>
>>>>> Thank you for the explanation. I think it would be best to import the atomic
>>>>> helpers and use the latest code.
>>>>>
>>>>> This will ensure that we don't re-introduce bugs and also buy us some time
>>>>> before the Linux and Xen driver diverge again too much.
>>>>>
>>>>> Stefano, what do you think?
>>>>
>>>> I think you are right.
>>> Yes, I agree with you to have XEN code in sync with Linux code that's why I started with to port the Linux atomic operations to XEN  then I realised that it is not straightforward to port atomic operations and it requires lots of effort and testing. Therefore I decided to port the code before the atomic operation is introduced in Linux.
>>
>> Hmmm... I would not have expected a lot of effort required to add the 3 atomics operations above. Are you trying to also port the LSE support at the same time?
> 
> There are other atomic operations used in the SMMUv3 code apart from the 3 atomic operation I mention. I just mention 3 operation as an example. 

Ok. Do you have a list you could share?

Cheers,

-- 
Julien Grall

