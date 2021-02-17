Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF55031D8CA
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 12:50:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86233.161746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCLKm-0006v0-UH; Wed, 17 Feb 2021 11:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86233.161746; Wed, 17 Feb 2021 11:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCLKm-0006ub-R7; Wed, 17 Feb 2021 11:49:32 +0000
Received: by outflank-mailman (input) for mailman id 86233;
 Wed, 17 Feb 2021 11:49:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCLKl-0006uW-MX
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 11:49:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCLKk-00022M-IG; Wed, 17 Feb 2021 11:49:30 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCLKk-0001Vl-99; Wed, 17 Feb 2021 11:49:30 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=MyBH3wIhOkLKvrqlqHeIARgH/g3V+Mmzq7yxkBkD4IE=; b=JaXlvAE60u5CIXB93W4bgZW9bc
	LQhBH0lYEOtUkzla81f9nlZ3t5leNQmEpw559Bjuw1EBE0+8RQ5evFbWkUq409p4D0N6WKj613JZj
	3AIU9N4txrKfGHMjKIukTA01ba69nXZjRxGHkiI1ZpsPwlAXyiekv+mLEZUQxYW4lYn8=;
Subject: Re: [for-4.15][PATCH v2 4/5] xen/iommu: x86: Don't leak the IOMMU
 page-tables
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-5-julien@xen.org>
 <62a791cb-a880-4097-5fec-4f728751b58b@suse.com>
 <712042bf-bec6-dc0f-67ee-b0807887772f@xen.org>
 <01546a53-1b1a-af35-a67e-7612e619961d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8c9ec11b-6ee8-4bc5-ed2d-c84c0dc23afb@xen.org>
Date: Wed, 17 Feb 2021 11:49:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <01546a53-1b1a-af35-a67e-7612e619961d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 10/02/2021 16:12, Jan Beulich wrote:
> On 10.02.2021 16:04, Julien Grall wrote:
>> On 10/02/2021 14:32, Jan Beulich wrote:
>>> On 09.02.2021 16:28, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> The new IOMMU page-tables allocator will release the pages when
>>>> relinquish the domain resources. However, this is not sufficient when
>>>> the domain is dying because nothing prevents page-table to be allocated.
>>>>
>>>> iommu_alloc_pgtable() is now checking if the domain is dying before
>>>> adding the page in the list. We are relying on &hd->arch.pgtables.lock
>>>> to synchronize d->is_dying.
>>>
>>> As said in reply to an earlier patch, I think suppressing
>>> (really: ignoring) new mappings would be better.
>>
>> This is exactly what I suggested in v1 but you wrote:
>>
>> "Ignoring requests there seems fragile to me. Paul - what are your
>> thoughts about bailing early from hvm_add_ioreq_gfn() when the
>> domain is dying?"
> 
> Was this on the thread of this patch? I didn't find such a
> reply of mine. I need more context here because you name
> hvm_add_ioreq_gfn() above, while I refer to iommu_map()
> (and downwards the call stack).

See [1].

> 
>> Are you know saying that the following snipped would be fine:
>>
>> if ( d->is_dying )
>>     return 0;
> 
> In {amd,intel}_iommu_map_page(), after the lock was acquired
> and with it suitably released, yes. And if that's what you
> suggested, then I'm sorry - I don't think I can see anything
> fragile there anymore.

Duplicating the check sounds good to me.

> 
>>> You could
>>> utilize the same lock, but you'd need to duplicate the
>>> checking in {amd,intel}_iommu_map_page().
>>>
>>> I'm not entirely certain in the case about unmap requests:
>>> It may be possible to also suppress/ignore them, but this
>>> may require some further thought.
>>
>> I think the unmap part is quite risky to d->is_dying because the PCI
>> devices may not quiesced and still assigned to the domain.
> 
> Hmm, yes, good point. Of course upon first unmap with is_dying
> observed set we could zap the root page table, but I don't
> suppose that's something we want to do for 4.15.

We would still need to zap the root page table in the relinquish path. 
So I am not sure what benefits it would give us to zap the page tables 
on the first iommu_unmap() afther domain dies.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/f21f1f61-5213-55a8-320c-43e5fe80100f@suse.com/

-- 
Julien Grall

