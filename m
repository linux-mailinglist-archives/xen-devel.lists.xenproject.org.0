Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 787AA32503E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 14:18:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89758.169339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGXW-0000eg-OH; Thu, 25 Feb 2021 13:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89758.169339; Thu, 25 Feb 2021 13:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGXW-0000eH-Kv; Thu, 25 Feb 2021 13:18:46 +0000
Received: by outflank-mailman (input) for mailman id 89758;
 Thu, 25 Feb 2021 13:18:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFGXV-0000eC-PA
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 13:18:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f416b39c-09b8-4d67-9640-8bb6d6e1ad7c;
 Thu, 25 Feb 2021 13:18:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30871AFB5;
 Thu, 25 Feb 2021 13:18:44 +0000 (UTC)
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
X-Inumbo-ID: f416b39c-09b8-4d67-9640-8bb6d6e1ad7c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614259124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7eGGsrE4JEawlrpABZ7S69xNi+nF/N6oxJsFnUYP1gw=;
	b=twJddPBC1kLInAq8l0CtZbD/hnhDZKNPOekCg6+sPEQAst/dnGCOi9yzBfpNvroMZJvD6n
	PgP4NJJ7l2Z/1HvL049WsQbRVhl9SF5zCnp7VkiIOwTUew2NRpoBuDuvoakWHE9quV+0+R
	WlrVfUR9B98R57LpUd3wiDgrbT/4rRM=
Subject: Re: [for-4.15][RESEND PATCH v4 1/2] xen/x86: iommu: Ignore IOMMU
 mapping requests when a domain is dying
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210224094356.7606-1-julien@xen.org>
 <20210224094356.7606-2-julien@xen.org>
 <d5a09319-614d-398b-b911-bc2533bec587@suse.com>
 <7ce1deb9-e362-439c-dd14-a17dbb6fb1c8@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2c1d2b05-7553-5f15-ad28-47aba5b9c47f@suse.com>
Date: Thu, 25 Feb 2021 14:18:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7ce1deb9-e362-439c-dd14-a17dbb6fb1c8@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 12:56, Julien Grall wrote:
> On 24/02/2021 14:07, Jan Beulich wrote:
>> On 24.02.2021 10:43, Julien Grall wrote:
>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>> @@ -267,6 +267,12 @@ int iommu_free_pgtables(struct domain *d)
>>>       struct page_info *pg;
>>>       unsigned int done = 0;
>>>   
>>> +    if ( !is_iommu_enabled(d) )
>>> +        return 0;
>>
>> Why is this addition needed? Hitting a not yet initialize spin lock
>> is - afaict - no worse than a not yet initialized list, so it would
>> seem to me that this can't be the reason. No other reason looks to
>> be called out by the description.
> 
> struct domain_iommu will be initially zeroed as it is part of struct domain.
> 
> For the list, we are so far fine because page_list_remove_head() 
> tolerates NULL. If we were using the normal list operations (e.g. 
> list_del), then this code would have segfaulted.

And so we do, in the CONFIG_BIGMEM case. May I suggest then to split
this out as a prereq patch, or add wording to the description
mentioning this additional effect?

Jan

