Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A3C295A62
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 10:33:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10269.27248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVW1m-0005AV-Pu; Thu, 22 Oct 2020 08:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10269.27248; Thu, 22 Oct 2020 08:32:54 +0000
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
	id 1kVW1m-0005A6-Mp; Thu, 22 Oct 2020 08:32:54 +0000
Received: by outflank-mailman (input) for mailman id 10269;
 Thu, 22 Oct 2020 08:32:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GjE6=D5=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVW1l-0005A1-5o
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 08:32:53 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1061199c-ff37-4d92-8866-0c8d08f4e86b;
 Thu, 22 Oct 2020 08:32:52 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVW1h-0002sq-Q3; Thu, 22 Oct 2020 08:32:49 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVW1h-0005Ik-G4; Thu, 22 Oct 2020 08:32:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GjE6=D5=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVW1l-0005A1-5o
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 08:32:53 +0000
X-Inumbo-ID: 1061199c-ff37-4d92-8866-0c8d08f4e86b
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1061199c-ff37-4d92-8866-0c8d08f4e86b;
	Thu, 22 Oct 2020 08:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Ju9JlLqIbF4Xjt9bUyXE8qrNmg37IAJ//vMAuq74Q0c=; b=DG9/LHWNFpl5sMA492PwxjWn99
	gR1/4P8YeSmOyG8UtRej110Zy3KKM+A09UHfonfU2puhTw/HoU/X/i6znYtb4CQBtQTT8sJVim4g9
	7DQOfbrTWhq9Ic4WeZ6EmuOH+zqbNQhzHHR7BKr3rUT/tqg00O3DmPiv/z1+jPXysS6g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVW1h-0002sq-Q3; Thu, 22 Oct 2020 08:32:49 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVW1h-0005Ik-G4; Thu, 22 Oct 2020 08:32:49 +0000
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org>
 <BBF09ABE-29A6-4990-8DA2-B44086E9C88C@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1082f30e-0ce8-00b1-e120-194ff874a9ba@xen.org>
Date: Thu, 22 Oct 2020 09:32:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <BBF09ABE-29A6-4990-8DA2-B44086E9C88C@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 21/10/2020 12:25, Rahul Singh wrote:
> Hello Julien,

Hi Rahul,

>> On 20 Oct 2020, at 6:03 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Rahul,
>>
>> Thank you for the contribution. Lets make sure this attempt to SMMUv3 support in Xen will be more successful than the other one :).
> 
> Yes sure.
>>
>> I haven't reviewed the code yet, but I wanted to provide feedback on the commit message.
>>
>> On 20/10/2020 16:25, Rahul Singh wrote:
>>> Add support for ARM architected SMMUv3 implementations. It is based on
>>> the Linux SMMUv3 driver.
>>> Major differences between the Linux driver are as follows:
>>> 1. Only Stage-2 translation is supported as compared to the Linux driver
>>>     that supports both Stage-1 and Stage-2 translations.
>>> 2. Use P2M  page table instead of creating one as SMMUv3 has the
>>>     capability to share the page tables with the CPU.
>>> 3. Tasklets is used in place of threaded IRQ's in Linux for event queue
>>>     and priority queue IRQ handling.
>>
>> Tasklets are not a replacement for threaded IRQ. In particular, they will have priority over anything else (IOW nothing will run on the pCPU until they are done).
>>
>> Do you know why Linux is using thread. Is it because of long running operations?
> 
> Yes you are right because of long running operations Linux is using the threaded IRQs.
> 
> SMMUv3 reports fault/events bases on memory-based circular buffer queues not based on the register. As per my understanding, it is time-consuming to process the memory based queues in interrupt context because of that Linux is using threaded IRQ to process the faults/events from SMMU.
> 
> I didn’t find any other solution in XEN in place of tasklet to defer the work, that’s why I used tasklet in XEN in replacement of threaded IRQs. If we do all work in interrupt context we will make XEN less responsive.

So we need to make sure that Xen continue to receives interrupts, but we 
also need to make sure that a vCPU bound to the pCPU is also responsive.

> 
> If you know another solution in XEN that will be used to defer the work in the interrupt please let me know I will try to use that.

One of my work colleague encountered a similar problem recently. He had 
a long running tasklet and wanted to be broken down in smaller chunk.

We decided to use a timer to reschedule the taslket in the future. This 
allows the scheduler to run other loads (e.g. vCPU) for some time.

This is pretty hackish but I couldn't find a better solution as tasklet 
have high priority.

Maybe the other will have a better idea.

> 
>>> 4. Latest version of the Linux SMMUv3 code implements the commands queue
>>>     access functions based on atomic operations implemented in Linux.
>>
>> Can you provide more details?
> 
> I tried to port the latest version of the SMMUv3 code than I observed that in order to port that code I have to also port atomic operation implemented in Linux to XEN. As latest Linux code uses atomic operation to process the command queues (atomic_cond_read_relaxed(),atomic_long_cond_read_relaxed() , atomic_fetch_andnot_relaxed()) .

Thank you for the explanation. I think it would be best to import the 
atomic helpers and use the latest code.

This will ensure that we don't re-introduce bugs and also buy us some 
time before the Linux and Xen driver diverge again too much.

Stefano, what do you think?

> 
>>
>>>     Atomic functions used by the commands queue access functions is not
>>>     implemented in XEN therefore we decided to port the earlier version
>>>     of the code. Once the proper atomic operations will be available in XEN
>>>     the driver can be updated.
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> ---
>>>   xen/drivers/passthrough/Kconfig       |   10 +
>>>   xen/drivers/passthrough/arm/Makefile  |    1 +
>>>   xen/drivers/passthrough/arm/smmu-v3.c | 2847 +++++++++++++++++++++++++
>>>   3 files changed, 2858 insertions(+)
>>
>> This is quite significant patch to review. Is there any way to get it split (maybe a verbatim Linux copy + Xen modification)?
> 
> Yes, I understand this is a quite significant patch to review let me think to get it split. If it is ok for you to review this patch and provide your comments then it will great for us.
I will try to have a look next week.

Cheers,

-- 
Julien Grall

