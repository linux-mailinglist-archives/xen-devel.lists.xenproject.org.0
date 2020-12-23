Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FB82E1CEA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 15:02:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58388.102612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks4iI-0001Bw-PV; Wed, 23 Dec 2020 14:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58388.102612; Wed, 23 Dec 2020 14:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks4iI-0001BX-ME; Wed, 23 Dec 2020 14:02:02 +0000
Received: by outflank-mailman (input) for mailman id 58388;
 Wed, 23 Dec 2020 14:02:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ks4iH-0001BR-Fu
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 14:02:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks4iG-0007qu-RS; Wed, 23 Dec 2020 14:02:00 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks4iG-0006Zf-Jp; Wed, 23 Dec 2020 14:02:00 +0000
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
	bh=G+7V4blTrjiXGnm6WIHP8emDZy9CUkQfddfdIwzjd2M=; b=tTJgO51XJJLkg5tcPesEUyPUp4
	f3XHn1NYdlFzLiyCATNn3rp4nyvp5dFX2vUUZ1c+TVgi1GgQ37U3p4ovhLJQ4MLTXDpF1fqMASOcq
	HTu2L9LGwOYr22qdtH0vYFaL3vLgU8WZjyYbYu4Nutz1eZVlnHCfJrW5m2Sgx+MsZick=;
Subject: Re: [PATCH for-4.15 2/4] xen/iommu: x86: Free the IOMMU page-tables
 with the pgtables.lock held
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-3-julien@xen.org>
 <3148db2a-ff3f-5993-dd57-7f4376f2f0ad@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <295b32db-ddf7-3926-b4de-b0d3b78af316@xen.org>
Date: Wed, 23 Dec 2020 14:01:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3148db2a-ff3f-5993-dd57-7f4376f2f0ad@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/12/2020 13:48, Jan Beulich wrote:
> On 22.12.2020 16:43, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The pgtables.lock is protecting access to the page list pgtables.list.
>> However, iommu_free_pgtables() will not held it. I guess it was assumed
>> that page-tables cannot be allocated while the domain is dying.
>>
>> Unfortunately, there is no guarantee that iommu_map() will not be
>> called while a domain is dying (it looks like to be possible from
>> XEN_DOMCTL_memory_mapping).
> 
> I'd rather disallow any new allocations for a dying domain, not
> the least because ...

Patch #4 will disallow such allocation. However...

> 
>> So it would be possible to be concurrently
>> allocate memory and free the page-tables.
>>
>> Therefore, we need to held the lock when freeing the page tables.
> 
> ... we should try to avoid holding locks across allocation /
> freeing functions wherever possible. >
> As to where to place a respective check - I wonder if we wouldn't
> be better off disallowing a majority of domctl-s (and perhaps
> other operations) on dying domains. Thoughts?

... this is still pretty racy because you need to guarantee that 
d->is_dying is seen by the other processors to prevent allocation.

As to whether we can forbid most of the domctl-s, I would agree this is 
a good move. But this doesn't remove the underlying problem here.

We are hoping that a top-level function will protect us against the 
race. Given the IOMMU code is quite deep in the callstack, this is 
something pretty hard to guarantee with future change.

So I still think we need a way to mitigate the issue.

Cheers,

-- 
Julien Grall

