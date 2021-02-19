Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F72D31F60D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 09:50:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86808.163229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD1U6-0001RC-PR; Fri, 19 Feb 2021 08:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86808.163229; Fri, 19 Feb 2021 08:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD1U6-0001Qn-Ls; Fri, 19 Feb 2021 08:49:58 +0000
Received: by outflank-mailman (input) for mailman id 86808;
 Fri, 19 Feb 2021 08:49:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TOKe=HV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lD1U4-0001Qi-9b
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 08:49:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7f6ec65-a373-4d26-97bb-d7e28b308470;
 Fri, 19 Feb 2021 08:49:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A25D8AD29;
 Fri, 19 Feb 2021 08:49:54 +0000 (UTC)
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
X-Inumbo-ID: e7f6ec65-a373-4d26-97bb-d7e28b308470
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613724594; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwfJzREW3w3iAgJqzedGFL8X5T4KF6M7SnNM51vcU58=;
	b=rjeZ1ZffG+WtIWL+4gazAEU9QcXAo6xQksKJI6IIFLBDRIO6ZuIEDwHn77ZS1HSsSS+zeB
	AMDjZ0gcHOcMl7jaQQFhhKGP1C/eR27CSCxgPetez8x2pCXlaFxC02X8VX70pYJGoX5bYs
	xNemxZv5GQ3zOGSavNlWDwvZmj+/ybY=
Subject: Re: [for-4.15][PATCH v3 2/3] xen/x86: iommu: Ignore IOMMU mapping
 requests when a domain is dying
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>
References: <20210217142458.3769-1-julien@xen.org>
 <20210217142458.3769-3-julien@xen.org>
 <20f68b12-a767-b1d3-a3dd-9f92172def5f@suse.com>
 <d1116875-dd98-8f51-9113-314c1a62b4bf@xen.org>
 <268f1991-bacb-c888-04c0-0e4cf670b6b5@suse.com>
 <c713f440-8c3d-42fe-1d71-56b23e53a495@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aa672eaa-e828-968b-73bf-dd4249d5de16@suse.com>
Date: Fri, 19 Feb 2021 09:49:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c713f440-8c3d-42fe-1d71-56b23e53a495@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.02.2021 14:25, Julien Grall wrote:
> Hi,
> 
> On 18/02/2021 13:05, Jan Beulich wrote:
>> On 17.02.2021 17:07, Julien Grall wrote:
>>> On 17/02/2021 15:01, Jan Beulich wrote:
>>>> On 17.02.2021 15:24, Julien Grall wrote:
>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>
>>>>> The new x86 IOMMU page-tables allocator will release the pages when
>>>>> relinquishing the domain resources. However, this is not sufficient
>>>>> when the domain is dying because nothing prevents page-table to be
>>>>> allocated.
>>>>>
>>>>> Currently page-table allocations can only happen from iommu_map(). As
>>>>> the domain is dying, there is no good reason to continue to modify the
>>>>> IOMMU page-tables.
>>>>
>>>> While I agree this to be the case right now, I'm not sure it is a
>>>> good idea to build on it (in that you leave the unmap paths
>>>> untouched).
>>>
>>> I don't build on that assumption. See next patch.
>>
>> Yet as said there that patch makes unmapping perhaps more fragile,
>> by introducing a latent error source into the path.
> 
> I still don't see what latent error my patch will introduce. Allocation 
> of page-tables are not guarantee to succeed.
> 
> So are you implying that a code may rely on the page allocation to succeed?

I'm implying that failure to split a superpage may have unknown
consequences. Since we make no use of superpages when not
sharing page tables, I call this a latent issue which may go
unnoticed for quite some time once no longer latent.

Jan

