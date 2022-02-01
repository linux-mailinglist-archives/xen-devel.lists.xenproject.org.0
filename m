Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1154A6286
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 18:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263722.456557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEx2P-0001zP-4x; Tue, 01 Feb 2022 17:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263722.456557; Tue, 01 Feb 2022 17:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEx2P-0001wW-1v; Tue, 01 Feb 2022 17:33:53 +0000
Received: by outflank-mailman (input) for mailman id 263722;
 Tue, 01 Feb 2022 17:33:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nEx2N-0001wQ-VV
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 17:33:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nEx2N-0000ZF-Ff; Tue, 01 Feb 2022 17:33:51 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=[10.95.141.48])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nEx2N-0007Wu-92; Tue, 01 Feb 2022 17:33:51 +0000
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
	bh=Q7S8JzWJShXM23x2rGGHyeGO0g/U6NGpgKHVU53CP00=; b=ivnvz5X5rVQkqAeLDEJQYIg+In
	C4NF3rKFG0OeoLeBgrmDNfN7obLaMlzwJdR2M/6wCfTAxUVerJEcZSRbUHMh6/iiGbSslG/NhpwOa
	MIp0chIbURNFgG6lAGB2MwdZ/WVDj5fjaLZVCM4G6Z37V5ax0ml4GD+nWCvTbtYb5wR0=;
Message-ID: <63d5b282-3826-0c4e-d64f-2495c5a42b22@xen.org>
Date: Tue, 1 Feb 2022 17:33:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 2/4] rangeset: add rangeset_reset helper function
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20220201162508.417008-1-andr2000@gmail.com>
 <20220201162508.417008-3-andr2000@gmail.com>
 <bb5010df-5e5b-9de1-7ad8-1ba5e8e37edc@xen.org>
 <ef8b93f8-5333-fc84-ac0a-8197d084f99b@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ef8b93f8-5333-fc84-ac0a-8197d084f99b@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 01/02/2022 17:14, Oleksandr Andrushchenko wrote:
> On 01.02.22 19:05, Julien Grall wrote:
>> On 01/02/2022 16:25, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> This helper destroys all the ranges of the rangeset given.
>>> Please note, that it uses rangeset_remove_range which returns an error
>>> code on failure. This error code can be ignored as while destroying all
>>> the ranges no memory allocation is expected, so in this case it must not
>>> fail.
>>>
>>> To make sure this remains valid use BUG_ON if that changes in the future.
>>>
>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>> ---
>>>    xen/common/rangeset.c      | 6 ++++++
>>>    xen/include/xen/rangeset.h | 3 +++
>>>    2 files changed, 9 insertions(+)
>>>
>>> diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
>>> index ea27d651723b..9ca2b06cff22 100644
>>> --- a/xen/common/rangeset.c
>>> +++ b/xen/common/rangeset.c
>>> @@ -525,6 +525,12 @@ void rangeset_swap(struct rangeset *a, struct rangeset *b)
>>>        write_unlock(&b->lock);
>>>    }
>>>    +void rangeset_reset(struct rangeset *r)
>>> +{
>>> +    /* This doesn't allocate anything and must not fail. */
>>> +    BUG_ON(rangeset_remove_range(r, 0, ~0ULL));
>>
>> I vaguely recall some discussion in the past (not related to this series) that we wanted to avoid calling function have side-effect in a BUG_ON(). So if we decide to remove at compile-time BUG_ON(), there would be no issue.
>>
>> But then I am not sure about the use of BUG_ON(). Can you outline why crashing the hypervisor is better than continuing (e.g. use WARN_ON() or ASSERT())?
> Non-zero value will indicate we were not able to complete the operation
> which must not fail because of the concrete use-case: we remove all the
> ranges and it is not expected that this may fail.
> Just to make sure this behavior does not change I use BUG_ON here which
> if triggered clearly indicates that the behavior has changed and there is
> a need in code change.

Right, but that change of behavior may not be noticed during 
development. So I think we want to avoid BUG_ON() when this is possible.

> 
> I can turn this into WARN_ON instead, but this may lead to memory leaks
> or some other errors not handled.

IMHO, this is a bit better but not by much. Looking a 
rangeset_destroy(), you should be able to do it without any of the 
issues you described here. Something like:

     if ( r == NULL )
       return;

     while ( (x = first_range(r)) != NULL )
         destroy_range(r, x);

-- 
Julien Grall

