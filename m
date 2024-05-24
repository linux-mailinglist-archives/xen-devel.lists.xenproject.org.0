Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1345D8CEC99
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 01:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730014.1135383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAe2L-00028d-JB; Fri, 24 May 2024 23:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730014.1135383; Fri, 24 May 2024 23:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAe2L-00026p-Fm; Fri, 24 May 2024 23:09:21 +0000
Received: by outflank-mailman (input) for mailman id 730014;
 Fri, 24 May 2024 23:09:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sAe2J-00026j-HM
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 23:09:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAe2J-0003yb-26; Fri, 24 May 2024 23:09:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAe2I-000479-Rb; Fri, 24 May 2024 23:09:18 +0000
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
	bh=DCxSyPk4lJlnfqkWiqJVMqmq4VpfZklhKqTV9JyJuZY=; b=gbf8w3lW5uZUPj1UUzejxE9uzf
	rAimasYKpRQSqLg8dloTbbY9JnqgZM+q3j/I1i5j054lYHs4Q1r8Eg6Mnoiv0GJ2EC/4bdxxavxMn
	Qv7W0kYXKUx11s/YlWloqXa7Ud2PRf5JxvDPbmgIAzPUBWR7wFqqKwjXbJUzEvvNSkHc=;
Message-ID: <f754eff3-54f1-46cb-8c31-ed5ab564c7a2@xen.org>
Date: Sat, 25 May 2024 00:09:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Juergen Gross <jgross@suse.com>
References: <20240517032156.1490515-1-xin.wang2@amd.com>
 <20240517032156.1490515-3-xin.wang2@amd.com>
 <cf0a096a-0fe8-4d91-a064-910bd6c43951@xen.org>
 <alpine.DEB.2.22.394.2405241536510.2557291@ubuntu-linux-20-04-desktop>
 <0a153f00-04bf-4c98-ae98-c904ee52af13@xen.org>
 <alpine.DEB.2.22.394.2405241559480.2557291@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2405241559480.2557291@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/05/2024 00:02, Stefano Stabellini wrote:
> On Fri, 24 May 2024, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 24/05/2024 23:49, Stefano Stabellini wrote:
>>> On Fri, 24 May 2024, Julien Grall wrote:
>>>> Hi Henry,
>>>>
>>>> + Juergen as the Xenstore maintainers. I'd like his opinion on the
>>>> approach.
>>>> The documentation of the new logic is in:
>>>>
>>>> https://lore.kernel.org/xen-devel/20240517032156.1490515-5-xin.wang2@amd.com/
>>>>
>>>> FWIW I am happy in principle with the logic (this is what we discussed on
>>>> the
>>>> call last week). Some comments below.
>>>>
>>>> On 17/05/2024 04:21, Henry Wang wrote:
>>>>> There are use cases (for example using the PV driver) in Dom0less
>>>>> setup that require Dom0less DomUs start immediately with Dom0, but
>>>>> initialize XenStore later after Dom0's successful boot and call to
>>>>> the init-dom0less application.
>>>>>
>>>>> An error message can seen from the init-dom0less application on
>>>>> 1:1 direct-mapped domains:
>>>>> ```
>>>>> Allocating magic pages
>>>>> memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
>>>>> Error on alloc magic pages
>>>>> ```
>>>>>
>>>>> The "magic page" is a terminology used in the toolstack as reserved
>>>>> pages for the VM to have access to virtual platform capabilities.
>>>>> Currently the magic pages for Dom0less DomUs are populated by the
>>>>> init-dom0less app through populate_physmap(), and populate_physmap()
>>>>> automatically assumes gfn == mfn for 1:1 direct mapped domains. This
>>>>> cannot be true for the magic pages that are allocated later from the
>>>>> init-dom0less application executed in Dom0. For domain using statically
>>>>> allocated memory but not 1:1 direct-mapped, similar error "failed to
>>>>> retrieve a reserved page" can be seen as the reserved memory list is
>>>>> empty at that time.
>>>>>
>>>>> Since for init-dom0less, the magic page region is only for XenStore.
>>>>> To solve above issue, this commit allocates the XenStore page for
>>>>> Dom0less DomUs at the domain construction time. The PFN will be
>>>>> noted and communicated to the init-dom0less application executed
>>>>> from Dom0. To keep the XenStore late init protocol, set the connection
>>>>> status to XENSTORE_RECONNECT.
>>>>
>>>> So this commit is allocating the page, but it will not be used by
>>>> init-dom0less until the next patch. But Linux could use it. So would this
>>>> break bisection? If so, then I think patch #3 needs to be folded in this
>>>> patch.
>>>
>>> I think that's fine,
>>
>> I am not sure what you mean. Are you saying it is ok to break bisection?
> 
> No, I meant to say that it is fine to merge on commit.
> 
> 
>>> I'll leave that with you on commit.
>>
>> I am sorry but I don't think the folding should be done on commit. It should
>> happen before hand because the commit message will also need to be updated.
> 
> Understood. I'll send one more version with the patches merged (ideally
> with an ack?)
Sorry I don't feel it is right for me to ack this patch with the pending 
questions from Juergen.

Cheers,

-- 
Julien Grall

