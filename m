Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F406467AD
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 04:28:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456791.714608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p37ZA-0002vx-OT; Thu, 08 Dec 2022 03:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456791.714608; Thu, 08 Dec 2022 03:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p37ZA-0002tu-Lu; Thu, 08 Dec 2022 03:27:20 +0000
Received: by outflank-mailman (input) for mailman id 456791;
 Thu, 08 Dec 2022 03:27:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=miOe=4G=zlw.email=sisyphean@srs-se1.protection.inumbo.net>)
 id 1p37Z8-0002tn-L8
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 03:27:19 +0000
Received: from mail.zlw.email (unknown [112.49.95.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 328eb722-76a8-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 04:27:15 +0100 (CET)
Received: from localhost (unknown [127.0.0.1])
 by mail.zlw.email (Postfix) with ESMTP id 37A5617417A;
 Thu,  8 Dec 2022 03:22:17 +0000 (UTC)
Received: from mail.zlw.email ([127.0.0.1])
 by localhost (mail.zlw.email [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T1cytlQay34L; Thu,  8 Dec 2022 11:22:14 +0800 (CST)
Received: from [192.168.66.233] (OpenWrt.lan [192.168.66.1])
 by mail.zlw.email (Postfix) with ESMTPSA id CCAF0173BFC;
 Thu,  8 Dec 2022 11:22:13 +0800 (CST)
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
X-Inumbo-ID: 328eb722-76a8-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zlw.email; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:to:content-language:subject:subject
	:user-agent:mime-version:date:date:message-id; s=dkim; t=
	1670469734; x=1673061735; bh=zzz/0J6qeEVtF7m57Es5QJhgv8j6d0g9Q1h
	lxHa7JTE=; b=tK1bWf4pVMIb/0wr4WOeG3H2B+oMjGfWMWSkflXy7rtsvwJFgHZ
	nhYeSUQgPXy++swxy2YMJMeTVelkLoit3NrVbGv5koe0Nsu6UTtM22l/+ED60J88
	jjEz0a5N30HoYX7EFZ6W0dcZalA1RKbyOHW0PhFJlwZ7Kjzz85rvwNB8=
X-Virus-Scanned: amavisd-new at zlw.email
Message-ID: <e42045c9-9f0e-9a2a-94ac-077d33534e88@zlw.email>
Date: Thu, 8 Dec 2022 11:22:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [BUG]SMMU-V3 queue need no-cache memory
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e1e0e347-6530-7b68-92f7-ef52defa55ac@zlw.email>
 <75D89B2C-BBE4-419A-80B7-FEE39445ABB2@arm.com>
 <fe0f90fa-84aa-54b2-1e12-98baff7fcaf7@xen.org>
 <alpine.DEB.2.22.394.2212071418570.4039@ubuntu-linux-20-04-desktop>
From: sisyphean <sisyphean@zlw.email>
In-Reply-To: <alpine.DEB.2.22.394.2212071418570.4039@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2022/12/8 06:22, Stefano Stabellini 写道:

> On Wed, 7 Dec 2022, Julien Grall wrote:
>> Hi,
>>
>> I only noticed this e-mail because I was skimming xen-devel. If you want to
>> get our attention, then I would suggest to CC both of us because I (and I
>> guess Stefano) have filter rules so those e-mails land directly in my inbox.
>>
>> On 07/12/2022 10:24, Rahul Singh wrote:
>>>> On 7 Dec 2022, at 2:04 am, sisyphean <sisyphean@zlw.email> wrote:
>>>>
>>>> Hi,
>>>>
>>>>       I try to run XEN on my ARM board(Sorry, for some commercial reasons,
>>>> I can't tell you
>>>>       on which platform I run XEN)  and enable SMMU-V3, but all cmds in
>>>> cmdq failed when XEN started.
>>>>
>>>>       After using the debugger to track debugging, the reason for this
>>>> problem is that
>>>>       the queue in the smmu-v3 driver is not no-cache, so after the
>>>> function arm_smmu_cmdq_build_cmd
>>>>       is executed, the cmd is still in cache.Therefore, the SMMU-V3
>>>> hardware cannot obtain the correct cmd
>>>>       from the memory for execution.
>>> Yes you are right as of now we are allocating the memory for cmdqueue via
>>> _xzalloc() which is cached
>>> memory because of that you are observing the issue. We have tested the Xen
>>> SMMUv3 driver on SOC
>>> where SMMUv3 HW is in the coherency domain, and because of that we have not
>>> encountered this issue.
>>>
>>> I think In your case SMMUv3 HW is not in the coherency domain. Please
>>> confirm from your side if the
>>> "dma-coherent” property is not set in DT.
>>>
>>> I think there is no function available as of now to request Xen to allocate
>>> memory that is not cached.
>> You are correct.
>>
>>> @Julien and @Stefano do you have any suggestion on how we can request memory
>>> from Xen that is not
>>> cached something like dma_alloc_coherent() in Linux.
>> At the moment all the RAM is mapped cacheable in Xen. So it will require some
>> work to have some memory uncacheable.
>>
>> There are two options:
>>   1) Allocate a pool of memory at boot time that will be mapped with different
>> memory attribute. This means we would need a separate pool and the user will
>> have to size it.
>>   2) Modify after the allocation the caching attribute in the memory and then
>> revert back after freeing. The cons is we would end up to shatter superpage.
>> We also can't re-create superpage (yet), but that might be fine if the memory
>> is never freed.
>>
>> Option two would probably the best. But before going that route I have one
>> question...
>>
>>> The temporary solution I use is to execute function clean_dcache every
>>> time cmd is copied to cmdq in function queue_write. But it is obvious
>>> that this will seriously affect the efficiency.
>> I agree you will see some performance impact in micro-benchmark. But I am not
>> sure about normal use-cases. How often do you expect the command queue to be
>> used?
> That is a good question. But even for the micro-benchmark, is the
> difference significant?
>
> My gut feeling (to be discussed and confirmed) is that for this use-case
> it might not be worth to do option 1) or option 2) above. Clean_dcache
> as needed might be good enough?
>
>
>> Also, I am a bit surprised you are seing issue with the command queue but not
>> with the stage-2 page-tables. Does your SMMU support coherent walk but cannot
>> snoop for the command queue?

Hi,

I'm sorry that my statement made you misunderstand. I haven't conducted 
micro-benchmark yet.

I found this problem because "CMD_SYNC timeout" was frequently prompted 
when initializing
SMMUv3 during XEN startup.

As for the usage frequency of the command queue, I'm trying to 
passthrough PCIE devices to the DomU.
According to my understanding, all operations on the device will be 
performed through SMMUv3 after
the device passesthrough? Therefore, queues will be used frequently.

This is my first contact with SMMU and XEN. Please forgive me for some 
low-level mistakes.

Cheers,
-- 
Sisyphean


