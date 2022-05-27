Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 715CF5366C8
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 19:54:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338092.562840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nue9Z-0004Jv-Np; Fri, 27 May 2022 17:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338092.562840; Fri, 27 May 2022 17:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nue9Z-0004HJ-Kz; Fri, 27 May 2022 17:53:37 +0000
Received: by outflank-mailman (input) for mailman id 338092;
 Fri, 27 May 2022 17:53:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nue9X-0004HB-J9
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 17:53:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nue9W-0007eD-UD; Fri, 27 May 2022 17:53:34 +0000
Received: from [54.239.6.189] (helo=[192.168.12.224])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nue9W-0001q9-MQ; Fri, 27 May 2022 17:53:34 +0000
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
	bh=hiAfzS9hpjb7rjxSiDDUClDp2xkQqnLRp6Wr+XNmkV0=; b=ZxqczKbpT8Pe9otFwebnF2QzQq
	UG7V780Pc8k8HhtAswmhf6XXN/kEK10vqaT1q5un64F1OjD3ihyJ3qrofLuDcLWiyt7GJySr95DFN
	N+2XrvjGWm+4eyPiQGpMJNuLogW5T1jb572rnnvURaJ8nUyvdRaOBUgOgCL2T3axLsgU=;
Message-ID: <01f7af22-16c5-bf13-f163-d5aa6560f6e9@xen.org>
Date: Fri, 27 May 2022 18:53:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] xen/arm: Allow setting the number of CPUs to activate at
 runtime
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220523091324.137350-1-michal.orzel@arm.com>
 <45054a80-3958-a6b8-1575-02dd5bb17892@xen.org>
 <cb1e1ce0-4667-c436-6e5d-abc26add4ebe@arm.com>
 <3236e8e6-c25d-1733-9315-e0363cc73f84@xen.org>
 <06dbe73a-a14f-4b9f-4839-9c97829303ff@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <06dbe73a-a14f-4b9f-4839-9c97829303ff@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/05/2022 07:34, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> 
> On 23.05.2022 22:00, Julien Grall wrote:
>>
>>
>> On 23/05/2022 11:21, Michal Orzel wrote:
>>> Hi Julien,
>>
>> Hi Michal,
>>
>>>
>>> On 23.05.2022 12:05, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 23/05/2022 10:13, Michal Orzel wrote:
>>>>> Introduce a command line parameter "maxcpus" on Arm to allow adjusting
>>>>> the number of CPUs to activate.
>>>>
>>>> The current definition "maxcpus" is not really suitable for big.LITTLE systems as you have no flexibility to say how many types of each cores you want to boot.
>>>>
>>>> Instead, Xen will pick-up the first CPUs it parsed from the firmware tables.
>>>>
>>>>
>>>> So what's your use-case/target?
>>>>
>>> - use cases where we have no big little (although even on big.LITTLE limiting this number makes sense if we do not care about the types)
>>
>> This may make sense in debug build, but for prod I think you need some certainty how which CPUs you are going to use.
> My conviction was that using big.LITTLE by enabling hmp-unsafe is not really used in the production systems (after all it's called *unsafe*)
> as it may easily end up in an insecure/unstable platform without specifying the cpu affinity (which must be done carefully).
> 
>>
>> So I would like a warning in the documentation "maxcpus" that in big.LITTLE system, there are no guarantee on which types will be used.
> I'm fully ok with adding this warning.
> 
> **WARNING: On Arm big.LITTLE systems, when `hmp-unsafe` option is enabled, this command line
> option does not guarantee on which CPU types will be used.**

NIT: s/on//

> 
>>
>> This is technically a lie, but I don't want a user to start relying on how Xen will parse the DT.
>>
>>> - debug cases where we want to set maxcpus=1
>>
>> Thanks for the clarification. I would be happy to add my tag with a warning in the documentation.
>>
> Does it mean you want to do this on commit or should I handle it in v2?

It depends whether there are other comments on the series. If there are 
none, then I will do it on commit.

I will wait until next week to give a chance to Bertrand/Stefano to comment.

Cheers,

-- 
Julien Grall

