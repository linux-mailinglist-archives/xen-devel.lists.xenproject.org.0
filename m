Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02765478913
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 11:39:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248518.428653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myAdM-0003u1-LU; Fri, 17 Dec 2021 10:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248518.428653; Fri, 17 Dec 2021 10:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myAdM-0003sE-IQ; Fri, 17 Dec 2021 10:38:40 +0000
Received: by outflank-mailman (input) for mailman id 248518;
 Fri, 17 Dec 2021 10:38:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1myAdK-0003s8-ST
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 10:38:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myAdJ-0000jB-9J; Fri, 17 Dec 2021 10:38:37 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.25.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myAdJ-0008Ho-2h; Fri, 17 Dec 2021 10:38:37 +0000
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
	bh=7K6eAiiDcErzq2mOiW8bjA1OTuybw/egfbb/jVma7cU=; b=s249YIwMwRCfJT73sB95S1m45k
	5y2tHTsHQZNRL1CRpJPnXUGe8deMF9SGF1EsESpOopD8ojXErNSjEqJOj51QmFtv+GfMeif2rvM+M
	FTJ6nGTp+pyOxlNFRQ1G63Iy3EoBq+wAl2zJMcAKblzU/MzS1+MwMztiRizIMcUZf2bE=;
Message-ID: <7cabbc0b-f6bd-04a1-9552-8cecf7639b15@xen.org>
Date: Fri, 17 Dec 2021 10:38:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-3-jgross@suse.com>
 <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org>
 <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com>
 <alpine.DEB.2.22.394.2112151757410.3376@ubuntu-linux-20-04-desktop>
 <c650062f-948e-569d-d4fa-e5333867854e@suse.com>
 <alpine.DEB.2.22.394.2112161232310.3376@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2112161246180.3376@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2112161246180.3376@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 16/12/2021 21:15, Stefano Stabellini wrote:
> On Thu, 16 Dec 2021, Stefano Stabellini wrote:
>> On Thu, 16 Dec 2021, Juergen Gross wrote:
>>> On 16.12.21 03:10, Stefano Stabellini wrote:
>>>> On Wed, 15 Dec 2021, Juergen Gross wrote:
>>>>> On 14.12.21 18:36, Julien Grall wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 08/12/2021 15:55, Juergen Gross wrote:
>>>>>>> Today most hypercall handlers have a return type of long, while the
>>>>>>> compat ones return an int. There are a few exceptions from that rule,
>>>>>>> however.
>>>>>>
>>>>>> So on Arm64, I don't think you can make use of the full 64-bit because a
>>>>>> 32-bit domain would not be able to see the top 32-bit.
>>>>>>
>>>>>> In fact, this could potentially cause us some trouble (see [1]) in Xen.
>>>>>> So it feels like the hypercalls should always return a 32-bit signed
>>>>>> value
>>>>>> on Arm.
>>>>>
>>>>> This would break hypercalls like XENMEM_maximum_ram_page which are able
>>>>> to return larger values, right?
>>>>>
>>>>>> The other advantage is it would be clear that the top 32-bit are not
>>>>>> usuable. Stefano, what do you think?
>>>>>
>>>>> Wouldn't it make more sense to check the return value to be a sign
>>>>> extended 32-bit value for 32-bit guests in do_trap_hypercall() instead?
>>>>>
>>>>> The question is what to return if this is not the case. -EDOM?
>>>>
>>>>
>>>> I can see where Julien is coming from: we have been trying to keep the
>>>> arm32 and arm64 ABIs identical since the beginning of the project. So,
>>>> like Julien, my preference would be to always return 32-bit on ARM, both
>>>> aarch32 and aarch64. It would make things simple.
>>>>
>>>> The case of XENMEM_maximum_ram_page is interesting but it is not a
>>>> problem in reality because the max physical address size is only 40-bit
>>>> for aarch32 guests, so 32-bit are always enough to return the highest
>>>> page in memory for 32-bit guests.
>>>
>>> You are aware that this isn't the guest's max page, but the host's?
> 
> I can see now that you meant to say that, no matter what is the max
> pseudo-physical address supported by the VM, XENMEM_maximum_ram_page is
> supposed to return the max memory page, which could go above the
> addressibility limit of the VM.
> 
> So XENMEM_maximum_ram_page should potentially be able to return (1<<44)
> even when called by an aarch32 VM, with max IPA 40-bit.

I am a bit confused with what you wrote. Yes, 32-bit VM can only address 
40-bit, but this is only limiting its own (guest) physical address 
space. Such VM would still be able to map any host physical address 
(assuming GFN != MFN).

> 
> I would imagine it could be useful if dom0 is 32-bit but domUs are
> 64-bit on a 64-bit hypervisor (which I think it would be a very rare
> configuration on ARM.)

Looking at the implementation, the hypercall is accessible by any 
domain. IOW a domU 32-bit could read a wrong value.

That said, it is not clear to me why an Arm or HVM x86 guest would want 
to read the value.

Cheers,

-- 
Julien Grall

