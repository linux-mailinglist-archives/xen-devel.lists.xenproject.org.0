Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9672AF90E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 20:28:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25176.52769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcvmS-0007Ys-4F; Wed, 11 Nov 2020 19:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25176.52769; Wed, 11 Nov 2020 19:27:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcvmS-0007YT-11; Wed, 11 Nov 2020 19:27:44 +0000
Received: by outflank-mailman (input) for mailman id 25176;
 Wed, 11 Nov 2020 19:27:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kcvmQ-0007YO-RW
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 19:27:42 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kcvmQ-0005rp-AP; Wed, 11 Nov 2020 19:27:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kcvmQ-0007YO-RW
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 19:27:42 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kcvmQ-0005rp-AP; Wed, 11 Nov 2020 19:27:42 +0000
Subject: Re: [PATCH V2 21/23] xen/arm: Add mapcache invalidation handling
To: Oleksandr <olekstysh@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-22-git-send-email-olekstysh@gmail.com>
 <cad29fdb-089a-541b-6c5b-538d96441714@suse.com>
 <b074eb70-a770-1f96-3d68-b06476b963ca@xen.org>
 <ecd5c3a5-e889-4fff-8145-3c129f619979@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2ff5e744-b48b-77b0-4e59-faa82951242b@xen.org>
Date: Wed, 11 Nov 2020 19:27:40 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <ecd5c3a5-e889-4fff-8145-3c129f619979@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 11/11/2020 00:03, Oleksandr wrote:
> 
> On 16.10.20 11:41, Julien Grall wrote:
>> On 16/10/2020 07:29, Jan Beulich wrote:
>>> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
>>>> @@ -1067,7 +1068,14 @@ static int __p2m_set_entry(struct p2m_domain 
>>>> *p2m,
>>>>        */
>>>>       if ( p2m_is_valid(orig_pte) &&
>>>>            !mfn_eq(lpae_get_mfn(*entry), lpae_get_mfn(orig_pte)) )
>>>> +    {
>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>> +        if ( domain_has_ioreq_server(p2m->domain) &&
>>>> +             (p2m->domain == current->domain) && 
>>>> p2m_is_ram(orig_pte.p2m.type) )
>>>> +            p2m->domain->qemu_mapcache_invalidate = true;
>>>> +#endif
>>>>           p2m_free_entry(p2m, orig_pte, level);
>>>> +    }
>>>
>>> For all I have to say here, please bear in mind that I don't know
>>> the internals of Arm memory management.
>>>
>>> The first odd thing here the merely MFN-based condition. It may
>>> well be that's sufficient, if there's no way to get a "not present"
>>> entry with an MFN matching any valid MFN. (This isn't just with
>>> your addition, but even before.
>> Invalid entries are always zeroed. So in theory the problem could 
>> arise if MFN 0 used in the guest. It should not be possible on 
>> staging, but I agree this should be fixed.
>>
>>>
>>> Given how p2m_free_entry() works (or is supposed to work in the
>>> long run), is the new code you add guaranteed to only alter leaf
>>> entries?
>>
>> This path may also be called with tables. I think we want to move the 
>> check in p2m_free_entry() so we can find the correct leaf type.
> 
> Well, but inside p2m_free_entry() we don't have a new entry in order to 
> check whether new MFN is actually different. An extra arg only comes to 
> mind...
Aside the recursive call, there are two users for p2m_free_entry():
   - When we fail to shatter a superpage in OOM
   - When the entry is replaced by an entry with a different base

I wouldn't be too concerned to send spurious mapcache invalidation in an 
error path. So I don't think you need to know the new entry.

What you need to know if the type of the leaf.

Cheers,

-- 
Julien Grall

