Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 417D74FADC8
	for <lists+xen-devel@lfdr.de>; Sun, 10 Apr 2022 14:17:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302440.516088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndWVX-0005Oh-WF; Sun, 10 Apr 2022 12:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302440.516088; Sun, 10 Apr 2022 12:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndWVX-0005Le-T6; Sun, 10 Apr 2022 12:17:31 +0000
Received: by outflank-mailman (input) for mailman id 302440;
 Sun, 10 Apr 2022 12:17:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ndWVW-0005LW-Jd
 for xen-devel@lists.xenproject.org; Sun, 10 Apr 2022 12:17:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndWVW-0008KX-4t; Sun, 10 Apr 2022 12:17:30 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndWVV-0008J9-VQ; Sun, 10 Apr 2022 12:17:30 +0000
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
	bh=5TUnIEqCtm/+qfQwVVSAfNXRXsBnwvcpWlryUSEXQGg=; b=vB2hVUOyxKt+EypUfvsmU8o8mP
	aE3ld+LWbbJ7QXynYAr5g6ZjEotfjv19QDT6MlZGgBE+wZT+KqSXBPfc5j+OSSegPr+j59bWtWRbf
	l156Vh9HgXSkTEKMouMHgSOdJNmeNf2rRtKqT/NxajaqVJUyWHXAP6gaeB5h5bqZT4Ts=;
Message-ID: <4701ade9-5786-e41f-e635-e9e655ef2865@xen.org>
Date: Sun, 10 Apr 2022 13:17:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 04/19] xen/arm: mm: Allow other mapping size in
 xen_pt_update_entry()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-5-julien@xen.org>
 <alpine.DEB.2.22.394.2204011605580.2910984@ubuntu-linux-20-04-desktop>
 <a2dafd9a-a0a9-b99d-9592-4f8e5fbb3f20@xen.org>
 <alpine.DEB.2.22.394.2204051345500.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2204051345500.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 05/04/2022 21:46, Stefano Stabellini wrote:
> On Sat, 2 Apr 2022, Julien Grall wrote:
>> On 02/04/2022 00:35, Stefano Stabellini wrote:
>>>> +/* Return the level where mapping should be done */
>>>> +static int xen_pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned
>>>> long nr,
>>>> +                                unsigned int flags)
>>>> +{
>>>> +    unsigned int level;
>>>> +    unsigned long mask;
>>>
>>> Shouldn't mask be 64-bit on aarch32?
>>
>> The 3 variables we will use (mfn, vfn, nr) are unsigned long. So it is fine to
>> define the mask as unsigned long.
> 
> Good point
> 
> 
>>>> +}
>>>> +
>>>>    static DEFINE_SPINLOCK(xen_pt_lock);
>>>>      static int xen_pt_update(unsigned long virt,
>>>>                             mfn_t mfn,
>>>> -                         unsigned long nr_mfns,
>>>> +                         const unsigned long nr_mfns,
>>>
>>> Why const? nr_mfns is an unsigned long so it is passed as value: it
>>> couldn't change the caller's parameter anyway. Just curious.
>>
>> Because nr_mfns is used to flush the TLBs. In the original I made the mistake
>> to decrement the variable and only discovered later on when the TLB contained
>> the wrong entry.
>>
>> Such bug tends to be very subtle and it is hard to find the root cause. So
>> better mark the variable const to avoid any surprise.
>>
>> The short version of what I wrote is in the commit message. I can write a
>> small comment in the code if you want.
> 
> No, that's fine. Thanks for the explanation.

I thought about it and decided to add a comment. This will avoid someone 
to remove the 'const'.

Cheers,
-- 
Julien Grall

