Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4434B3C38
	for <lists+xen-devel@lfdr.de>; Sun, 13 Feb 2022 17:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270996.465320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJHOC-0006zN-Qr; Sun, 13 Feb 2022 16:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270996.465320; Sun, 13 Feb 2022 16:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJHOC-0006wr-Mn; Sun, 13 Feb 2022 16:06:16 +0000
Received: by outflank-mailman (input) for mailman id 270996;
 Sun, 13 Feb 2022 16:06:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nJHOA-0006wl-In
 for xen-devel@lists.xenproject.org; Sun, 13 Feb 2022 16:06:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nJHO9-0004QW-6V; Sun, 13 Feb 2022 16:06:13 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nJHO8-0006P3-Vk; Sun, 13 Feb 2022 16:06:13 +0000
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
	bh=COWVWcQ9dDXZNDzM555CyAyBgWveir0btyJ1U2eFnno=; b=nparCt/mZEJl/SuI3Z61vQhZc5
	NSQkpE/S/T2Ojb5cKR+6anFj9XDfBMey08DtxIHOk8tnwIbl2rm5xZfoS80SFvLzrs0I77Z99b9lq
	exuRVduBs69YWIxJPLq3UNj0zPOV1wstWOAxOf6bfcTzOF1bMFxsmtENAdz2Urtj4OvY=;
Message-ID: <40ec7063-0c59-02d1-90c7-4cfc9791ad27@xen.org>
Date: Sun, 13 Feb 2022 16:06:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
 <a54213c4-1c68-694e-c130-d95faeef3953@xen.org>
 <78d94e1e-6db4-25c1-adb8-e4bdbfe42774@epam.com>
 <82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org>
 <79fbf83e-d25e-2634-9769-8e07634bfd63@epam.com>
 <a104d3ea-170e-8175-ac04-abfcebb4ae29@xen.org>
 <f9e3ee5b-0811-8317-42c2-61c8cdbfe254@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f9e3ee5b-0811-8317-42c2-61c8cdbfe254@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 10/02/2022 16:55, Oleksandr wrote:
> 
> On 10.02.22 11:46, Julien Grall wrote:
>>
>>
>> On 08/02/2022 19:50, Oleksandr Tyshchenko wrote:
>>>
>>> On 08.02.22 13:58, Julien Grall wrote:
>>> Below the diff I have locally:
>>>
>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>> index 5646343..90d7563 100644
>>> --- a/xen/arch/arm/p2m.c
>>> +++ b/xen/arch/arm/p2m.c
>>> @@ -1315,11 +1315,32 @@ static inline int p2m_remove_mapping(struct
>>> domain *d,
>>>                                         mfn_t mfn)
>>>    {
>>>        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> +    unsigned long i;
>>>        int rc;
>>>
>>>        p2m_write_lock(p2m);
>>> +    for ( i = 0; i < nr; )
>>> +    {
>>> +        unsigned int cur_order;
>>> +        bool valid;
>>> +        mfn_t mfn_return = p2m_get_entry(p2m, gfn_add(start_gfn, i),
>>> NULL, NULL,
>>> +                                         &cur_order, &valid); > +
>>> +        if ( valid &&
>>
>> valid is a copy of the LPAE bit valid. This may be 0 if Xen decided to 
>> clear it (i.e when emulating set/way). Yet the mapping itself is 
>> considered valid from Xen PoV.
>>
>> So you want to replace with a different check (see below).
> 
> 
> Hmm, I got it, so ...
> 
> 
>>
>>
>>> +             (!mfn_valid(mfn) || !mfn_eq(mfn_add(mfn, i), 
>>> mfn_return)) )
>>> +        {
>>> +            rc = -EILSEQ;
>>> +            goto out;
>>> +        }
>>> +
>>> +        i += (1UL << cur_order) -
>>> +             ((gfn_x(start_gfn) + i) & ((1UL << cur_order) - 1));
>>> +    }
>>> +
>>>        rc = p2m_set_entry(p2m, start_gfn, nr, INVALID_MFN,
>>>                           p2m_invalid, p2m_access_rwx);
>>> +
>>> +out:
>>>        p2m_write_unlock(p2m);
>>>
>>>        return rc;
>>>
>>>
>>> Could you please clarify, is it close to what you had in mind? If yes, I
>>> am wondering, don't we need this check to be only executed for xenheap
>>> pages (and, probably, which P2M's entry type in RAM?) rather than for
>>> all pages?
>>
>> From my understanding, for the purpose of this work, we only strictly 
>> need to check that for xenheap pages.
> 
> 
>   ... yes, but ...
> 
> 
>>
>>
>> But I think it would be a good opportunity to harden the P2M code. At 
>> the moment, on Arm, you can remove any mappings you want (even with 
>> the wrong helpers). This lead us to a few issues when mapping were 
>> overriden silently (in particular when building dom0).
>> So I would say we should enforce it for every RAM mapping. 
> 
> 
> ... I think this makes sense, so the proper check in that case, I 
> assume, should contain p2m_is_any_ram() macro:


Correct, p2m_is_any_ram() looks the macro we want to use here.

>> Note that, I would like to see this change in a separate commit. It 
>> will be easier to review.
> 
> 
> ok, I will introduce this check by a separate patch.

Thank you!

[...]

>>> It is going to be a non-protected write to GFN portion of type_info.
>>
>> Well no. You are using a Read-Modify-Write operation on type_info. 
>> This is not atomic and will overwrite any change (if any) done on 
>> other part of the type_info.
> 
> 
> I am confused a bit, to which my comment your comment above belongs (to 
> the diff for page_set_xenheap_gfn() above or to sentence right after it)?
> The "It is going to be a non-protected write to GFN portion of 
> type_info." sentence is related to the diff for alloc_heap_pages() 
> below. Sorry if I didn't separate the comments properly.

Ok. So it will be a write operation, but I still don't understand why 
you think it is just the GFN portion.

The code is using "...type_info = PGT_TYPE_INFO_INITIALIZER". So the 
full 64-bit (assuming arm64) will be modified.

In general, the GFN takes 60 of the 64-bits. So any time you need to 
modify the GFN (or the count_info), you will end up to modify the entire 
of type_info (and vice-versa). If this is becoming we problem (e.g. the 
count_info is actively used) we will need to use cmpxchg() to modify the 
GFN portion.

Cheers,

-- 
Julien Grall

