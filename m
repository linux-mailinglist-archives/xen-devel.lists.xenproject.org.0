Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142AE3FDDC6
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 16:24:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176497.321151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLR9u-0002uL-0y; Wed, 01 Sep 2021 14:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176497.321151; Wed, 01 Sep 2021 14:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLR9t-0002rk-Tl; Wed, 01 Sep 2021 14:24:09 +0000
Received: by outflank-mailman (input) for mailman id 176497;
 Wed, 01 Sep 2021 14:24:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mLR9s-0002re-FG
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 14:24:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLR9o-0003rO-8c; Wed, 01 Sep 2021 14:24:04 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLR9o-0000BT-1a; Wed, 01 Sep 2021 14:24:04 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=1BPnIhtExWspVUUxouiBfqJrd9IwX6xVp7qTG38Djw4=; b=dbi/pPqONio3mP7UO1zDHTrSNc
	puc1wVTvvd7TmQ9EPXVvHkwRMFwAmQeYrMBbhy1T/XQAm/7CAyewfOmheM8bCMrhlxZgqUXVb+pWU
	UvD5uRdFGZpGK0c7ppS4FmfIXggeI6+c2N52iopJLQjlenmeIcgdQSzlMWgz5hJjcj0o=;
Subject: Re: [PATCH] xen/arm: Introduce pmu_access parameter
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Michal Orzel <Michal.Orzel@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210901124308.31573-1-michal.orzel@arm.com>
 <599515f0-4b8a-3a71-caea-b17ec27c9123@xen.org>
 <44B48162-EB44-4295-9629-2D95A40D7232@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <46e36ba5-8b3d-2d43-6297-b92d2654ab72@xen.org>
Date: Wed, 1 Sep 2021 15:24:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <44B48162-EB44-4295-9629-2D95A40D7232@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 01/09/2021 14:10, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> 
>> On 1 Sep 2021, at 13:55, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 01/09/2021 13:43, Michal Orzel wrote:
>>> Introduce new Xen command line parameter called "pmu_access".
>>> The default value is "trap": Xen traps PMU accesses.
>>> In case of setting pmu_access to "native", Xen does not trap
>>> PMU accesses allowing all the guests to access PMU registers.
>>> However, guests cannot make use of PMU overflow interrupts as
>>> PMU uses PPI which Xen cannot route to guests.
>>> This option is only intended for development and testing purposes.
>>> Do not use this in production system.
>> I am afraid your option is not safe even in development system as a vCPU may move between pCPUs.
>>
>> However, even if we restricted the use to pinned vCPU *and* dedicated pCPU, I am not convinced that exposing an half backed PMU (the overflow interrupt would not work) to the guest is the right solution. This likely means the guest OS would need to be modified and therefore the usage of this option is fairly limited.
>>
>> So I think the first steps are:
>>   1) Make the PPI work. There was some attempt in the past for it on xen-devel. You could have a look.
>>   2) Provide PMU bindings
>>
>> With that in place, we can discuss how to expose the PMU even if it is unsafe in some conditions.
> 
> With those limitations, using the PMU to monitor the system performances or on some specific use cases is still really useful.
> We are using that to do some benchmarks of Xen or of some applications to compare the behaviour to a native system or
> analyse the performances of Xen itself (hypercalls,context switch …etc)

I understand this is useful for some setup and I am not trying to say we 
should not have a way to expose the PMU (even unsafely) in upstream. 
However, I think the option as it stands is too wide (this should be a 
per domain knob) and we should properly expose the PMU (interrupts, 
bindings...).

> 
> The steps you are mentioning do make sense but using the PMU without those knowing the limitations is also very useful.

Right, this would require a lot more work than what I wrote before.

Cheers,

-- 
Julien Grall

