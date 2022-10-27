Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C0760F3AA
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 11:28:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430966.683329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onzB3-0001Lz-Js; Thu, 27 Oct 2022 09:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430966.683329; Thu, 27 Oct 2022 09:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onzB3-0001Jx-GD; Thu, 27 Oct 2022 09:27:53 +0000
Received: by outflank-mailman (input) for mailman id 430966;
 Thu, 27 Oct 2022 09:27:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1onzB2-0001Jr-48
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 09:27:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onzAx-0007k3-ON; Thu, 27 Oct 2022 09:27:47 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.29.62]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onzAx-0005Ho-G9; Thu, 27 Oct 2022 09:27:47 +0000
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
	bh=UHRBdzlTPR3+OCLd5Z6IF9G+cuWbPl24uwslqhVE+cA=; b=EZisDwA7U8MHqIXjJXikHJlQFF
	l+NXPcRRQEdyie4DRwt0Q9jtDf94uW7eVqB6yDPLjZDhJT51HoJzWXMFW69aPXaMIbnMgrd8KCC9H
	z0mzTKMzgM6UTW2Yiwk4WAsHcEh0kurNWZDPpifk4Q+xdxkldIQyXgw7AizOaoyHwg58=;
Message-ID: <00912a7d-ae12-703b-de24-e64359774a07@xen.org>
Date: Thu, 27 Oct 2022 10:27:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 1/4] xen: Introduce non-broken hypercalls for the p2m pool
 size
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang
 <Henry.Wang@arm.com>, Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-2-andrew.cooper3@citrix.com>
 <ffb8bdb8-f54b-2107-ce1a-775337c172ac@suse.com>
 <0f048bd2-d08c-8bd5-2a20-7e49e794c679@citrix.com>
 <4c713750-670b-eac1-5f5b-376de79192eb@xen.org>
 <f8c5cebd-06c3-2a8c-737c-c6bd6544f95a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f8c5cebd-06c3-2a8c-737c-c6bd6544f95a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 27/10/2022 07:56, Jan Beulich wrote:
> On 26.10.2022 23:24, Julien Grall wrote:
>> On 26/10/2022 20:22, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/mm/hap/hap.c
>>>>> +++ b/xen/arch/x86/mm/hap/hap.c
>>>>> @@ -345,6 +345,16 @@ unsigned int hap_get_allocation(struct domain *d)
>>>>>                + ((pg & ((1 << (20 - PAGE_SHIFT)) - 1)) ? 1 : 0));
>>>>>    }
>>>>>    
>>>>> +int hap_get_allocation_bytes(struct domain *d, uint64_t *size)
>>>>> +{
>>>>> +    unsigned long pages = (d->arch.paging.hap.total_pages +
>>>>> +                           d->arch.paging.hap.p2m_pages);
>>>> Unlike for Arm no ACCESS_ONCE() here? Also the addition can in
>>>> principle overflow, because being done only in 32 bits.
>>>
>>> I'm not actually convinced ARM needs ACCESS_ONCE() to begin with.  I
>>> can't see any legal transformation of that logic which could result in a
>>> torn load.
>>
>> AFAIU, ACCESS_ONCE() is not only about torn load but also making sure
>> that the compiler will only read the value once.
>>
>> When LTO is enabled (not yet supported) in Xen, can we guarantee the
>> compiler will not try to access total_pages twice (obviously it would be
>> caller dependent)?
> 
> Aren't all accesses (supposed to be) under paging lock? At which point
> there's no issue with multiple (or torn) accesses?

Not in the current code base for Arm. I haven't checked whether this is 
the case with the new version.

If it is suitably locked, then I think we should remove all the 
ACCESS_ONCE() and add an ASSERT(spin_is_locked(...)) to make clear this 
should be called with the lock held.

Cheers,

-- 
Julien Grall

