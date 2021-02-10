Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F67D316ACD
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 17:12:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83661.156268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9s65-0006UR-K1; Wed, 10 Feb 2021 16:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83661.156268; Wed, 10 Feb 2021 16:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9s65-0006U4-Gi; Wed, 10 Feb 2021 16:12:09 +0000
Received: by outflank-mailman (input) for mailman id 83661;
 Wed, 10 Feb 2021 16:12:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9s63-0006Ty-HJ
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 16:12:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96ebd348-776a-4962-8926-4747fd7de88d;
 Wed, 10 Feb 2021 16:12:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0098B024;
 Wed, 10 Feb 2021 16:12:05 +0000 (UTC)
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
X-Inumbo-ID: 96ebd348-776a-4962-8926-4747fd7de88d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612973525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPqzVtOm7U0a7RlP4dHRRr86iStGaTcrqkXtmG505lg=;
	b=oslcy3VjlhfCNws/M6VmH017yl7IkcuHVXLwC5Se8jx+4ptuMOo36McjCkDDLBbTcc7Il4
	qtojIlGaJj2c/de/sBbuwHBd2mtWzSHomvjCCs79802Kd61usAwzmZHvQcHgAkfg7XFibo
	fOQS3auzGDL3LnaiLVDK8OXW28JKiPU=
Subject: Re: [for-4.15][PATCH v2 4/5] xen/iommu: x86: Don't leak the IOMMU
 page-tables
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-5-julien@xen.org>
 <62a791cb-a880-4097-5fec-4f728751b58b@suse.com>
 <712042bf-bec6-dc0f-67ee-b0807887772f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <01546a53-1b1a-af35-a67e-7612e619961d@suse.com>
Date: Wed, 10 Feb 2021 17:12:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <712042bf-bec6-dc0f-67ee-b0807887772f@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.02.2021 16:04, Julien Grall wrote:
> On 10/02/2021 14:32, Jan Beulich wrote:
>> On 09.02.2021 16:28, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> The new IOMMU page-tables allocator will release the pages when
>>> relinquish the domain resources. However, this is not sufficient when
>>> the domain is dying because nothing prevents page-table to be allocated.
>>>
>>> iommu_alloc_pgtable() is now checking if the domain is dying before
>>> adding the page in the list. We are relying on &hd->arch.pgtables.lock
>>> to synchronize d->is_dying.
>>
>> As said in reply to an earlier patch, I think suppressing
>> (really: ignoring) new mappings would be better.
> 
> This is exactly what I suggested in v1 but you wrote:
> 
> "Ignoring requests there seems fragile to me. Paul - what are your
> thoughts about bailing early from hvm_add_ioreq_gfn() when the
> domain is dying?"

Was this on the thread of this patch? I didn't find such a
reply of mine. I need more context here because you name
hvm_add_ioreq_gfn() above, while I refer to iommu_map()
(and downwards the call stack).

> Are you know saying that the following snipped would be fine:
> 
> if ( d->is_dying )
>    return 0;

In {amd,intel}_iommu_map_page(), after the lock was acquired
and with it suitably released, yes. And if that's what you
suggested, then I'm sorry - I don't think I can see anything
fragile there anymore.

>> You could
>> utilize the same lock, but you'd need to duplicate the
>> checking in {amd,intel}_iommu_map_page().
>>
>> I'm not entirely certain in the case about unmap requests:
>> It may be possible to also suppress/ignore them, but this
>> may require some further thought.
> 
> I think the unmap part is quite risky to d->is_dying because the PCI 
> devices may not quiesced and still assigned to the domain.

Hmm, yes, good point. Of course upon first unmap with is_dying
observed set we could zap the root page table, but I don't
suppose that's something we want to do for 4.15.

Jan

