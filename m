Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD98296E23
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 14:02:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10923.29070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVvlk-0003qc-Fl; Fri, 23 Oct 2020 12:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10923.29070; Fri, 23 Oct 2020 12:02:04 +0000
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
	id 1kVvlk-0003qD-Ce; Fri, 23 Oct 2020 12:02:04 +0000
Received: by outflank-mailman (input) for mailman id 10923;
 Fri, 23 Oct 2020 12:02:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVvlj-0003pM-3p
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 12:02:03 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6536edf7-ff5e-4613-9946-93d05b4eac10;
 Fri, 23 Oct 2020 12:01:56 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVvlb-0002C6-5Q; Fri, 23 Oct 2020 12:01:55 +0000
Received: from cpc91186-cmbg18-2-0-cust22.5-4.cable.virginm.net ([80.1.50.23]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVvla-0006MH-U3; Fri, 23 Oct 2020 12:01:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVvlj-0003pM-3p
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 12:02:03 +0000
X-Inumbo-ID: 6536edf7-ff5e-4613-9946-93d05b4eac10
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6536edf7-ff5e-4613-9946-93d05b4eac10;
	Fri, 23 Oct 2020 12:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=7J1/3GPU5DQ3O73f4AMt9xzhevm5e9HcjZMaRusFFPk=; b=hIwwWJS1gCVM6sVa0nTuyn/A3C
	ROkmC3ioeE4K+NUkdRdfKgIiLa4UC7Bb8m2WpYETZPhaVJFvJJpsBDf/M8CFCR+nPyDlEI7T2qLYq
	epQSssx97t0wcrK/DogoCzQyQm1Zm/UeqoAP6qhxu8bcFMf3+77Fkt4S5KF5wq+pPuL8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVvlb-0002C6-5Q; Fri, 23 Oct 2020 12:01:55 +0000
Received: from cpc91186-cmbg18-2-0-cust22.5-4.cable.virginm.net ([80.1.50.23] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVvla-0006MH-U3; Fri, 23 Oct 2020 12:01:55 +0000
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org>
 <BBF09ABE-29A6-4990-8DA2-B44086E9C88C@arm.com>
 <1082f30e-0ce8-00b1-e120-194ff874a9ba@xen.org>
 <alpine.DEB.2.21.2010221631440.12247@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <d4be5451-809b-c793-8b6a-9e9bace0a52e@xen.org>
Date: Fri, 23 Oct 2020 13:01:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010221631440.12247@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 23/10/2020 01:02, Stefano Stabellini wrote:
> On Thu, 22 Oct 2020, Julien Grall wrote:
>>>> On 20/10/2020 16:25, Rahul Singh wrote:
>>>>> Add support for ARM architected SMMUv3 implementations. It is based on
>>>>> the Linux SMMUv3 driver.
>>>>> Major differences between the Linux driver are as follows:
>>>>> 1. Only Stage-2 translation is supported as compared to the Linux driver
>>>>>      that supports both Stage-1 and Stage-2 translations.
>>>>> 2. Use P2M  page table instead of creating one as SMMUv3 has the
>>>>>      capability to share the page tables with the CPU.
>>>>> 3. Tasklets is used in place of threaded IRQ's in Linux for event queue
>>>>>      and priority queue IRQ handling.
>>>>
>>>> Tasklets are not a replacement for threaded IRQ. In particular, they will
>>>> have priority over anything else (IOW nothing will run on the pCPU until
>>>> they are done).
>>>>
>>>> Do you know why Linux is using thread. Is it because of long running
>>>> operations?
>>>
>>> Yes you are right because of long running operations Linux is using the
>>> threaded IRQs.
>>>
>>> SMMUv3 reports fault/events bases on memory-based circular buffer queues not
>>> based on the register. As per my understanding, it is time-consuming to
>>> process the memory based queues in interrupt context because of that Linux
>>> is using threaded IRQ to process the faults/events from SMMU.
>>>
>>> I didn’t find any other solution in XEN in place of tasklet to defer the
>>> work, that’s why I used tasklet in XEN in replacement of threaded IRQs. If
>>> we do all work in interrupt context we will make XEN less responsive.
>>
>> So we need to make sure that Xen continue to receives interrupts, but we also
>> need to make sure that a vCPU bound to the pCPU is also responsive.
>>
>>>
>>> If you know another solution in XEN that will be used to defer the work in
>>> the interrupt please let me know I will try to use that.
>>
>> One of my work colleague encountered a similar problem recently. He had a long
>> running tasklet and wanted to be broken down in smaller chunk.
>>
>> We decided to use a timer to reschedule the taslket in the future. This allows
>> the scheduler to run other loads (e.g. vCPU) for some time.
>>
>> This is pretty hackish but I couldn't find a better solution as tasklet have
>> high priority.
>>
>> Maybe the other will have a better idea.
> 
> Julien's suggestion is a good one.
> 
> But I think tasklets can be configured to be called from the idle_loop,
> in which case they are not run in interrupt context?

Tasklets can either run from the IDLE loop or from a softirq context.

When running from a softirq context is may happen on return from 
receiving an interrupt. However, interrupts will always be enabled.

So I am not sure what concern you are trying to raise here.

Cheers,

-- 
Julien Grall

