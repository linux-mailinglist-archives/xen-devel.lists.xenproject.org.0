Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653FF810C8C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 09:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653762.1020281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDKjm-0006us-TP; Wed, 13 Dec 2023 08:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653762.1020281; Wed, 13 Dec 2023 08:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDKjm-0006s8-QV; Wed, 13 Dec 2023 08:37:02 +0000
Received: by outflank-mailman (input) for mailman id 653762;
 Wed, 13 Dec 2023 08:37:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rDKjl-0006rY-7B
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 08:37:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDKjj-0004KH-LX; Wed, 13 Dec 2023 08:36:59 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDKjj-0007QJ-FK; Wed, 13 Dec 2023 08:36:59 +0000
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
	bh=uCTRGYxElAmknKhtzaaNVwMi+JaO0JZzW46jbb9U1ls=; b=f2dvnPWZRtQbmlWOkeyzv2xliK
	SXGB17E7JxwuiqJDGRLJd2oxpB/bcRLdqUWcfLB499LFxA4de44UHsDSsq033c3SyzK9KhVRwDmK0
	uJSNzXYKfA0rSxsNOYk41/dVwOGUynQrQVXSFr19VYisUwIgEKgk+pcM8FLXW3xBzg9I=;
Message-ID: <5c2e8010-5548-4bef-bdb0-1613e2893a0d@xen.org>
Date: Wed, 13 Dec 2023 08:36:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] xen/spinlock: add explicit non-recursive locking
 functions
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-8-jgross@suse.com>
 <c7a969af-274b-4e92-b083-56059cbc98d6@xen.org>
 <f619efa1-da81-446b-968b-f81a2d18a7e5@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f619efa1-da81-446b-968b-f81a2d18a7e5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 13/12/2023 06:17, Juergen Gross wrote:
> On 12.12.23 19:49, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 12/12/2023 09:47, Juergen Gross wrote:
>>> -#define spin_lock_init_prof(s, l) __spin_lock_init_prof(s, l, 
>>> spinlock_t)
>>> -#define rspin_lock_init_prof(s, l) __spin_lock_init_prof(s, l, 
>>> rspinlock_t)
>>> +#define spin_lock_init_prof(s, 
>>> l)                                             \
>>> +    __spin_lock_init_prof(s, l, lock, spinlock_t, 0)
>>> +#define rspin_lock_init_prof(s, 
>>> l)                                            \
>>> +    __spin_lock_init_prof(s, l, rlock, rspinlock_t, 1)
>>>   void _lock_profile_register_struct(
>>>       int32_t type, struct lock_profile_qhead *qhead, int32_t idx);
>>> @@ -174,6 +179,7 @@ struct lock_profile_qhead { };
>>>   #endif
>>> +
>>
>> Spurious change?
> 
> Indeed, will remove it.
> 
>>
>>>   typedef union {
>>>       uint32_t head_tail;
>>>       struct {
>>> @@ -261,4 +267,12 @@ void rspin_unlock_irqrestore(rspinlock_t *lock, 
>>> unsigned long flags);
>>>   /* Ensure a lock is quiescent between two critical operations. */
>>>   #define spin_barrier(l)               _spin_barrier(l)
>>> +#define nrspin_trylock(l)    spin_trylock(l)
>>> +#define nrspin_lock(l)       spin_lock(l)
>>> +#define nrspin_unlock(l)     spin_unlock(l)
>>> +#define nrspin_lock_irq(l)   spin_lock_irq(l)
>>> +#define nrspin_unlock_irq(l) spin_unlock_irq(l)
>>> +#define nrspin_lock_irqsave(l, f)      spin_lock_irqsave(l, f)
>>> +#define nrspin_unlock_irqrestore(l, f) spin_unlock_irqrestore(l, f)
>>
>> There is a comment describing [r]spinlock but not this new variant. 
>> Can you add one?
> 
> Okay.
> 
>> That said, I know this is existing code, but I have to admit this is a 
>> bit unclear why we are allowing an recursive spinlock to be 
>> non-recursive. To me it sounds like we are making the typesafe not 
>> very safe because it doesn't guarantee that we are not mixing the call 
>> nrspin_* with rspin_*.
> 
> This is the current API.

I know. This is why I wrote "I know this is existing code".

> 
> If you have locked with nrspin_*, any rspin_* attempt on the same lock will
> spin until rspin_unlock (nrspin_* will not set recurse_cpu, but take the
> lock).
> 
> If you have locked with rspin_*, any nrspin_* attempt on the same lock will
> spin, too.
> 
> So I don't see any major problem regarding accidental misuse, which 
> wouldn't
> be visible by deadlocks (there is no silent misbehavior).

Right, so this will lead to a deadlock, which is my concern. If we were 
using rspinlock_* everywhere then the deadlock (at least in the case 
when you recurse) would in theory not be possible (unless you recurse 
too much).

My point here is to simplify the interface rather than providing because 
I don't really see the benefits of providing a non-recursive version for 
recursive spinlock.

Anyway as I said this is nothing new.

Cheers,

-- 
Julien Grall

