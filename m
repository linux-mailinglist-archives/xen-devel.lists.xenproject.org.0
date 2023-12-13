Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C15C810DA9
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 10:49:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653808.1020405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDLqu-0002vU-Vh; Wed, 13 Dec 2023 09:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653808.1020405; Wed, 13 Dec 2023 09:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDLqu-0002sz-Rh; Wed, 13 Dec 2023 09:48:28 +0000
Received: by outflank-mailman (input) for mailman id 653808;
 Wed, 13 Dec 2023 09:48:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rDLqt-0002st-UV
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 09:48:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDLqt-0005md-PR; Wed, 13 Dec 2023 09:48:27 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=[192.168.2.97])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDLqt-0002aX-Ib; Wed, 13 Dec 2023 09:48:27 +0000
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
	bh=nrEN8V1PEPjzdvlvxR0JnzBAlia2ZXMZWHYYpFl4TcI=; b=nAZ92fB8axdnVBoZiN7Lh46uft
	lIqWJbnmSSFibaFiq2j/e7gahjNRkiCl1MCXGSukTMzM0/INqftX8Rr3UI2bEnMAZc/pqnRH9Y70Z
	T/6urLgUJEWWaLUo01KpzRIeCvQ612TaP5bnRFAd4SYD2sCTHi9yl18NrM2SxjgkzCSY=;
Message-ID: <0f922ab8-ecad-40f5-a63c-c3be9006a5be@xen.org>
Date: Wed, 13 Dec 2023 09:48:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] xen/spinlock: add another function level
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-9-jgross@suse.com>
 <bee4d33a-1120-4389-a83d-4d2b91c5611d@xen.org>
 <2cccc696-a9d6-49ed-9b00-74de59884d43@suse.com>
 <fa87ab8c-b422-4a79-a32d-608c6c63ddf8@xen.org>
 <ea73d863-6ead-4b03-98f4-7ab873fa614b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ea73d863-6ead-4b03-98f4-7ab873fa614b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 13/12/2023 09:17, Juergen Gross wrote:
> On 13.12.23 09:43, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 13/12/2023 06:23, Juergen Gross wrote:
>>> On 12.12.23 20:10, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 12/12/2023 09:47, Juergen Gross wrote:
>>>>> Add another function level in spinlock.c hiding the spinlock_t layout
>>>>> from the low level locking code.
>>>>>
>>>>> This is done in preparation of introducing rspinlock_t for recursive
>>>>> locks without having to duplicate all of the locking code.
>>>>
>>>> So all the fields you pass are the one from spinlock.
>>>>
>>>> Looking at pahole after this series is applid, we have:
>>>>
>>>> ==== Debug + Lock profile ====
>>>>
>>>> struct spinlock {
>>>>          spinlock_tickets_t         tickets;              /*     0 4 */
>>>>          union lock_debug           debug;                /*     4 4 */
>>>>          struct lock_profile *      profile;              /*     8 8 */
>>>>
>>>>          /* size: 16, cachelines: 1, members: 3 */
>>>>          /* last cacheline: 16 bytes */
>>>> };
>>>> struct rspinlock {
>>>>          spinlock_tickets_t         tickets;              /*     0 4 */
>>>>          uint16_t                   recurse_cpu;          /*     4 2 */
>>>>          uint8_t                    recurse_cnt;          /*     6 1 */
>>>>
>>>>          /* XXX 1 byte hole, try to pack */
>>>>
>>>>          union lock_debug           debug;                /*     8 4 */
>>>>
>>>>          /* XXX 4 bytes hole, try to pack */
>>>>
>>>>          struct lock_profile *      profile;              /*    16 8 */
>>>>
>>>>          /* size: 24, cachelines: 1, members: 5 */
>>>>          /* sum members: 19, holes: 2, sum holes: 5 */
>>>>          /* last cacheline: 24 bytes */
>>>> };
>>>>
>>>>
>>>> ==== Debug ====
>>>>
>>>> struct spinlock {
>>>>          spinlock_tickets_t         tickets;              /*     0 4 */
>>>>          union lock_debug           debug;                /*     4 4 */
>>>>
>>>>          /* size: 8, cachelines: 1, members: 2 */
>>>>          /* last cacheline: 8 bytes */
>>>> };
>>>> struct rspinlock {
>>>>          spinlock_tickets_t         tickets;              /*     0 4 */
>>>>          uint16_t                   recurse_cpu;          /*     4 2 */
>>>>          uint8_t                    recurse_cnt;          /*     6 1 */
>>>>
>>>>          /* XXX 1 byte hole, try to pack */
>>>>
>>>>          union lock_debug           debug;                /*     8 4 */
>>>>
>>>>          /* size: 12, cachelines: 1, members: 4 */
>>>>          /* sum members: 11, holes: 1, sum holes: 1 */
>>>>          /* last cacheline: 12 bytes */
>>>> };
>>>>
>>>> ==== Prod ====
>>>>
>>>> struct spinlock {
>>>>          spinlock_tickets_t         tickets;              /*     0 4 */
>>>>          union lock_debug           debug;                /*     4 0 */
>>>>
>>>>          /* size: 4, cachelines: 1, members: 2 */
>>>>          /* last cacheline: 4 bytes */
>>>> };
>>>> struct rspinlock {
>>>>          spinlock_tickets_t         tickets;              /*     0 4 */
>>>>          uint16_t                   recurse_cpu;          /*     4 2 */
>>>>          uint8_t                    recurse_cnt;          /*     6 1 */
>>>>          union lock_debug           debug;                /*     7 0 */
>>>>
>>>>          /* size: 8, cachelines: 1, members: 4 */
>>>>          /* padding: 1 */
>>>>          /* last cacheline: 8 bytes */
>>>> };
>>>>
>>>>
>>>> I think we could embed spinlock_t in rspinlock_t without increasing 
>>>> rspinlock_t. Have you considered it? This could reduce the number of 
>>>> function level introduced in this series.
>>>
>>> That was the layout in the first version of this series. Jan 
>>> requested to change
>>> it to the current layout [1].
>>
>> Ah... Looking through the reasoning, I have to disagree with Jan 
>> argumentations.
> 
> I would _really_ have liked you to mention this disagreement back then 
> (you've
> been on Cc: in the thread, too).

Sorry for that. My e-mails backlog is quite large and I can't keep up 
with all the series.

> Letting me do a major rework and then after 2 more iterations of the series
> requesting to undo most of the work isn't great.

Indeed. But I note you continued without any additional feedback [1]. If 
you were not sure about the approach suggested by Jan, then why did you 
post two new versions? Shouldn't you have pinged the maintainers to make 
sure there is a consensus?

> 
>> At least with the full series applied, there is no increase of 
>> rspinlock_t in debug build (if we compare to the version you provided 
>> in this series).
> 
> That wasn't his sole reasoning, right?

I guess you mean the non-optional fields should always be at the same 
position?

> 
>> Furthermore, this is going to remove at least patch #6 and #8. We 
>> would still need nrspinlock_* because they can just be wrapper to
>> spin_barrier(&lock->lock).
>>
>> This should also solve his concern of unwieldy code:
>>
>>  > +    spin_barrier(&p2m->pod.lock.lock.lock);
> 
> Yes, but the demand to have optional fields at the end of the struct isn't
> covered by your request.

I note this was a preference and weight against code duplication. It is 
not clear to me whether Jan agrees with this extra work now.

Anyway, I am not against this approach and if this is what Jan much 
prefers then so be it. But I thought I would point out the additional 
complexity which doesn't seem to be worth it.

Cheers,

[1] https://lists.xen.org/archives/html/xen-devel/2022-12/msg01065.html

-- 
Julien Grall

