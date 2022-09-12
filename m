Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE15B5B5686
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 10:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405582.648047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXf3p-0000bV-OC; Mon, 12 Sep 2022 08:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405582.648047; Mon, 12 Sep 2022 08:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXf3p-0000Yv-LX; Mon, 12 Sep 2022 08:44:57 +0000
Received: by outflank-mailman (input) for mailman id 405582;
 Mon, 12 Sep 2022 08:44:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oXf3o-0000XD-8P
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 08:44:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oXf3m-0000nL-Of; Mon, 12 Sep 2022 08:44:54 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.12.199]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oXf3m-0001ZM-H2; Mon, 12 Sep 2022 08:44:54 +0000
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
	bh=wXqBxaeIBedPXuA/QEvE/Se+Raopi9b5Nfv557htDlw=; b=gnWKzRfMqClP/FdZw5OYX4W8em
	ipjYGS9ZQH7AkwlPdkMWBaYUh253sKQJjZl4wrGilko3p1OG90W1xvSZOAeCDFobBNjmindTCK1Lz
	gwFi9DWGQZ8ZNRVs14/37vrMAd14s4vbu04fNDFVt7i2RZDGbHGKv+5peiyS/77tDYF8=;
Message-ID: <161744a4-bd01-05e0-22c9-1a1a0731845b@xen.org>
Date: Mon, 12 Sep 2022 09:44:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] xen: add domid_to_domain() helper
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20220912055356.24064-1-jgross@suse.com>
 <20220912055356.24064-2-jgross@suse.com>
 <f1f2b4a1-c8d5-a481-1075-0227877dda8a@suse.com>
 <28e13b17-1296-62e4-0dc5-867b58f40ba9@suse.com>
 <e65cc75e-28fa-906c-c7c1-982d7e573b00@suse.com>
 <5893a2c0-f01d-f097-16bc-2ef14a1361f8@suse.com>
 <e00875fe-1277-6e1d-ceeb-fc54cbcdf099@xen.org>
 <d57d986a-cfdb-a43f-6a30-6f1dd602a57e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d57d986a-cfdb-a43f-6a30-6f1dd602a57e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/09/2022 09:42, Jan Beulich wrote:
> On 12.09.2022 10:36, Julien Grall wrote:
>> On 12/09/2022 09:33, Juergen Gross wrote:
>>> On 12.09.22 10:31, Jan Beulich wrote:
>>>> On 12.09.2022 10:23, Juergen Gross wrote:
>>>>> On 12.09.22 10:19, Jan Beulich wrote:
>>>>>> On 12.09.2022 07:53, Juergen Gross wrote:
>>>>>>> Add a helper domid_to_domain() returning the struct domain pointer for
>>>>>>> a domain give by its domid and which is known not being able to be
>>>>>>> released (its reference count isn't incremented and no
>>>>>>> rcu_lock_domain()
>>>>>>> is called for it).
>>>>>>>
>>>>>>> In order to simplify coding add an internal helper for doing the
>>>>>>> lookup
>>>>>>> and call that from the new function and similar functions.
>>>>>>>
>>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>>
>>>>>> I don't see an issue with adding such a helper (responding to your
>>>>>> concern
>>>>>> in the cover letter), but I think the constraints need to be empahsized
>>>>>> more: We already have get_knownalive_domain() and
>>>>>> get_domain_by_id(), so
>>>>>> how about naming the new helper get_knownalive_domain_by_id()? And
>>>>>> then ...
>>>>>
>>>>> I explicitly didn't name it "get_...", as those helpers all increment
>>>>> the
>>>>> reference count of the domain. And this is NOT done by the new helper.
>>>>
>>>> Hmm, agreed. But domid_to_domain() isn't expressing the "known alive"
>>>> aspect,
>>>> yet that's relevant to see when reviewing new uses of the function.
>>>> Such uses
>>>> aren't likely to make the reviewer go look at the function declaration
>>>> when
>>>> the function name is pretty "innocent".
>>>
>>> Okay, what about domid_to_knownalive_domain()?
>>>
>>> Or knownalive_domain_from_domid()?
>>
>> FWIW, I am fine with either. However, please don't replace 'to' with '2'
>> if you need a internal helper. Just suffixed with 'locked' to make clear
>> this is a version where the caller should take the lock.
> 
> Hmm - personally I dislike "_locked" suffixes on functions. If the
> "internal helper" aspect is to be made more explicit, then perhaps
> by way of prefixing a single underscore?

I am OK with that. Although, from previous discussion, I would have 
expected that explicit name would have been your preference ("locked" is 
more explicit than "_").

Cheers,

-- 
Julien Grall

