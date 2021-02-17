Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0028831D9CF
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 13:58:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86260.161797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCMOK-00057V-18; Wed, 17 Feb 2021 12:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86260.161797; Wed, 17 Feb 2021 12:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCMOJ-000576-UO; Wed, 17 Feb 2021 12:57:15 +0000
Received: by outflank-mailman (input) for mailman id 86260;
 Wed, 17 Feb 2021 12:57:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCMOI-000571-9L
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 12:57:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38932570-4c32-4c0f-83d2-9a3bf47912d0;
 Wed, 17 Feb 2021 12:57:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33C2CAF7B;
 Wed, 17 Feb 2021 12:57:12 +0000 (UTC)
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
X-Inumbo-ID: 38932570-4c32-4c0f-83d2-9a3bf47912d0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613566632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7W3+ffwYr1nMpqLUtPZyxxnlYdErmYNvREl7MIUVtcQ=;
	b=HkjcU9wSvw0LnjOqd8HBrSvqELrgxIyBceyRDIrMKSHyIPQbBgUJvW5QR7KyGBGwpYLJsC
	uYF5QaTwXARi5bene2OYhI24EKYsOm/PcMwyy/oMA1PP+M+3/Ei0LfDJ9iZbhjwvjCT4km
	q2vl9DsgyS/g1ZNmnMAXW67NONJtv30=
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
 <01546a53-1b1a-af35-a67e-7612e619961d@suse.com>
 <8c9ec11b-6ee8-4bc5-ed2d-c84c0dc23afb@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b2d58a3d-cb5e-3170-db77-807a8704c079@suse.com>
Date: Wed, 17 Feb 2021 13:57:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <8c9ec11b-6ee8-4bc5-ed2d-c84c0dc23afb@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.02.2021 12:49, Julien Grall wrote:
> On 10/02/2021 16:12, Jan Beulich wrote:
>> On 10.02.2021 16:04, Julien Grall wrote:
>>> Are you know saying that the following snipped would be fine:
>>>
>>> if ( d->is_dying )
>>>     return 0;
>>
>> In {amd,intel}_iommu_map_page(), after the lock was acquired
>> and with it suitably released, yes. And if that's what you
>> suggested, then I'm sorry - I don't think I can see anything
>> fragile there anymore.
> 
> Duplicating the check sounds good to me.

The checks in said functions are mandatory, and I didn't really
have any duplication in mind. But yes, iommu_map() could have
an early (but racy) check, if so wanted.

>>>> You could
>>>> utilize the same lock, but you'd need to duplicate the
>>>> checking in {amd,intel}_iommu_map_page().
>>>>
>>>> I'm not entirely certain in the case about unmap requests:
>>>> It may be possible to also suppress/ignore them, but this
>>>> may require some further thought.
>>>
>>> I think the unmap part is quite risky to d->is_dying because the PCI
>>> devices may not quiesced and still assigned to the domain.
>>
>> Hmm, yes, good point. Of course upon first unmap with is_dying
>> observed set we could zap the root page table, but I don't
>> suppose that's something we want to do for 4.15.
> 
> We would still need to zap the root page table in the relinquish path. 
> So I am not sure what benefits it would give us to zap the page tables 
> on the first iommu_unmap() afther domain dies.

I guess we think of different aspects of the zapping - what I'm
suggesting here is for the effect of no translations remaining
active anymore. I'm not after freeing the memory at this point;
that'll have to happen on the relinquish path, as you say. The
problem with allowing individual unmaps to proceed (unlike your
plan for maps) is that these, too, can trigger allocations (when
a large page needs shattering).

Jan

