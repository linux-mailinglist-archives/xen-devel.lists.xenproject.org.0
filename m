Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDEF47911E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 17:16:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248772.429102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myFtO-0005sc-MM; Fri, 17 Dec 2021 16:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248772.429102; Fri, 17 Dec 2021 16:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myFtO-0005qp-J4; Fri, 17 Dec 2021 16:15:34 +0000
Received: by outflank-mailman (input) for mailman id 248772;
 Fri, 17 Dec 2021 16:15:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1myFtN-0005qj-AB
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 16:15:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myFtK-0007DO-Pw; Fri, 17 Dec 2021 16:15:30 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.25.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myFtK-0005oZ-Id; Fri, 17 Dec 2021 16:15:30 +0000
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
	bh=4wfbgSlQUWpKxpFTfS9D4d+xPEi+WEmdkN3Ru56UIlw=; b=sbI4FS5V+hFOAq3SyNui0ZLL/A
	NQ8DcQjsuBLLDx5IBSIRH4K8/fQsnFAqRv+Jr4QZPYZ9Fnj+9xFHkZ7cvKDLMHq7qNMIc5wbLfC4E
	pTs07WD9E/pdKQpd3I0SZSMKlrs5L4OCz1nfkg/crQDhmmpP+8EMxbdGQpo0OCD0gjUM=;
Message-ID: <f7bb7a08-4721-f2a8-8602-0cd1baf1f083@xen.org>
Date: Fri, 17 Dec 2021 16:15:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH 3/5] xen/sort: Switch to an extern inline implementation
To: Andrew Cooper <amc96@srcf.net>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-4-andrew.cooper3@citrix.com>
 <409d2c17-d1e7-40b3-226a-b6ca4c0a15bf@xen.org>
 <alpine.DEB.2.22.394.2111151632160.1412361@ubuntu-linux-20-04-desktop>
 <5816e643-450e-1433-d58c-b12a286fb237@srcf.net>
 <8edd5817-f4bd-7246-21ac-f289f2f1bcdd@srcf.net>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8edd5817-f4bd-7246-21ac-f289f2f1bcdd@srcf.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 17/12/2021 15:56, Andrew Cooper wrote:
> On 16/11/2021 00:41, Andrew Cooper wrote:
>> On 16/11/2021 00:36, Stefano Stabellini wrote:
>>> On Thu, 11 Nov 2021, Julien Grall wrote:
>>>> On 11/11/2021 17:57, Andrew Cooper wrote:
>>>>> There are exactly 3 callers of sort() in the hypervisor.
>>>>>
>>>>> Both arm callers pass in NULL for the swap function.  While this might seem
>>>>> like an attractive option at first, it causes generic_swap() to be used
>>>>> which
>>>>> forced a byte-wise copy.  Provide real swap functions which the compiler can
>>>>> optimise sensibly.
>>>> I understand the theory, but none of the two calls are in hot paths or deal
>>>> with large set on Arm. So I am rather hesitant to introduce specialised swap
>>>> in each case as it doesn't seem we will gain much from this change.
>>> While I like Andrew's optimization, like Julien, I would also rather not
>>> have to introduce specialized swap functions any time a sort() is
>>> called. Why not keeping around generic_swap as extern gnu_inline in
>>> sort.h as well so that the ARM callers can simply:
>>>
>>>      sort(bootinfo.mem.bank, bootinfo.mem.nr_banks, sizeof(struct membank),
>>>           cmp_memory_node, generic_swap);
>>>
>>> ?
>>>
>>> That looks like a good option, although it would still result in a
>>> small increase in bloat.
>> That is basically what Jan suggested.
>>
>> I'm still unconvinced that you actually want to be doing byte-wise
>> swapping, even if it isn't a hotpath.  A custom swap function will
>> compile to less code than using generic_swap() like this, and run faster.
> 
> ARM Ping.
> 
> I really think this is a bad course of action.  If you're going to
> insist on it, I want something in writing.

I agree with all the points you wrote. However, you also have to put 
into perspective how this is used. On Arm, the two callers happen either 
during boot a domain creation. Neither of them have a significant impact 
on the time spent. In fact, I would be surprised if you notice the change.

So unless there are other (good) reasons to suppress generic_swap(), I 
still want to be able to use generic_swap() when the performance doesn't 
matter (like the two Arm callers).

Cheers,

-- 
Julien Grall

