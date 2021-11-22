Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64721459054
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 15:37:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228924.396183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpARs-0007A4-AH; Mon, 22 Nov 2021 14:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228924.396183; Mon, 22 Nov 2021 14:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpARs-00077Y-77; Mon, 22 Nov 2021 14:37:36 +0000
Received: by outflank-mailman (input) for mailman id 228924;
 Mon, 22 Nov 2021 14:37:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpARr-00077G-29
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 14:37:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpARq-0001Hi-9c; Mon, 22 Nov 2021 14:37:34 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.28.80]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpARq-0003eq-3A; Mon, 22 Nov 2021 14:37:34 +0000
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
	bh=MNQP04VD/xRBh2SQaPZxW/sZmElpY18gGNLg9gnBMMY=; b=0G1mJwo8oQDa33JL3s/bC+9s6u
	4lH3tm/a3XJMf5SLhgqgFm27aExSrbvlilCLmeaOUw1UL5neAw0DEGtJsXjUBqiZnpBK/sXGBwcK7
	PRAOJNzB2KtWh5S/Tzvm8R6zYeRS1iD8r6AKqZWI5Hw8+QZTyuJuXYjg4at+c/pu2rE8=;
Message-ID: <ecca9185-3dab-89dd-c2d0-a7b974d45e1d@xen.org>
Date: Mon, 22 Nov 2021 14:37:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH RFC 1/4] xen: add a domain unique id to each domain
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-2-jgross@suse.com>
 <8fe9a5bd-030c-66b7-ccf3-4545cfb80f66@xen.org>
 <fa778d46-0a4b-254c-0cde-d3df4e53ec4a@suse.com>
 <407a8f05-f16c-26bb-9ba1-044f62e3c0a0@xen.org>
 <523bb99f-a37d-f3c4-c0a4-c2caa20485cd@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <523bb99f-a37d-f3c4-c0a4-c2caa20485cd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 22/11/2021 14:29, Juergen Gross wrote:
> On 22.11.21 15:10, Julien Grall wrote:
>> Hi,

Hi,

>> On 22/11/2021 12:48, Juergen Gross wrote:
>>> On 22.11.21 12:42, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 14/09/2021 13:35, Juergen Gross wrote:
>>>>> Xenstore is referencing domains by their domid, but reuse of a domid
>>>>> can lead to the situation that Xenstore can't tell whether a domain
>>>>> with that domid has been deleted and created again without Xenstore
>>>>> noticing the domain is a new one now.
>>>>>
>>>>> Add a global domain creation unique id which is updated when creating
>>>>> a new domain, and store that value in struct domain of the new domain.
>>>>> The global unique id is initialized with the system time and updates
>>>>> are done via the xorshift algorithm which is used for pseudo random
>>>>> number generation, too (see https://en.wikipedia.org/wiki/Xorshift).
>>>>>
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>> ---
>>>>>   xen/common/domain.c     | 16 ++++++++++++++++
>>>>>   xen/include/xen/sched.h |  3 +++
>>>>>   2 files changed, 19 insertions(+)
>>>>>
>>>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>>>>> index 6ee5d033b0..755349b93f 100644
>>>>> --- a/xen/common/domain.c
>>>>> +++ b/xen/common/domain.c
>>>>> @@ -84,6 +84,9 @@ vcpu_info_t dummy_vcpu_info;
>>>>>   bool __read_mostly vmtrace_available;
>>>>> +/* Unique domain identifier, protected by domctl lock. */
>>>>> +static uint64_t unique_id;
>>>>> +
>>>>>   static void __domain_finalise_shutdown(struct domain *d)
>>>>>   {
>>>>>       struct vcpu *v;
>>>>> @@ -473,6 +476,18 @@ static void _domain_destroy(struct domain *d)
>>>>>       free_domain_struct(d);
>>>>>   }
>>>>> +static uint64_t get_unique_id(void)
>>>>
>>>> The implementation is assuming that domain cannot be created 
>>>> concurrently. The rest of domain_create() seems to be able to cope 
>>>> with concurrent call (even if domctl prevents this situation today).
>>>>
>>>> So I think we would want to make this call safe as well. One 
>>>> possibility would be to (ab)use the domlist_update_lock (I think the 
>>>> uniq ID is only necessary for real domains).
>>>
>>> In case this is thought to be needed, I'd rather use a cmpxchg operation
>>> for updating unique_id.
>> I would be OK with cmpxchg(). But I would like to avoid cmpxchg() loop 
>> if possible.
> 
> The chances for that loop to be needed are zero today, as the domctl
> lock is prohibiting concurrent use.

Well for domain created by the toolstack yes... For domain created by 
Xen no. Today, this is only happening at boot so you are safe (for now).

That said, I don't really see a reason to prevent concurrent 
domain_create() and as I wrote nothing in domain_create() seems to make 
this assumption. So I am not happy to build on that in this new helper.

> 
> Another possibility would be to use an:
> 
> ASSERT(spin_is_locked(&domctl_lock));

This ASSERT() would be incorrect as it could be hit for any domain 
created by Xen.

[...]

>> Reading the commit message (and cover letter) again, I understand that 
>> you want a unique ID but it is not clear to me why this needs to be 
>> pseudo-randomly generated. IOW, given the expected use, can you 
>> clarify what would be the concern to use an atomic_inc_return() 
>> instead of xorshift?
> 
> Jan had a concern regarding potential misuse of the unique id in case it
> were kind of predictable.

Fair enough. Can this be written down in the commit message?

Cheers,

-- 
Julien Grall

