Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D799931F67F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 10:25:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86823.163277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD21H-0005T8-DB; Fri, 19 Feb 2021 09:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86823.163277; Fri, 19 Feb 2021 09:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD21H-0005Sj-9k; Fri, 19 Feb 2021 09:24:15 +0000
Received: by outflank-mailman (input) for mailman id 86823;
 Fri, 19 Feb 2021 09:24:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lD21F-0005Se-Rv
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 09:24:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lD21D-0005Gp-2R; Fri, 19 Feb 2021 09:24:11 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lD21C-0008PI-QB; Fri, 19 Feb 2021 09:24:10 +0000
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
	bh=NW4IO4W+Z6u0V6oCvWPiguInxloPgJvQIgvjYCtuh94=; b=5P2KG/i4ZACihexX2Lz89vRI6W
	V04k+E0c2rBMpyqM+tOg5xPzL9WGb1M4HslPRcMHD3wbaBarueiV8+6Z9Q/Pitmn7Z04f4jeF3Fzc
	UdnuGwdJ2131nFj9XQPrin/ZnF1006c1gT0M4DkOxkhYw/1dZRu14OD/aXEB1HQxaUJ0=;
Subject: Re: [for-4.15][PATCH v3 2/3] xen/x86: iommu: Ignore IOMMU mapping
 requests when a domain is dying
To: Jan Beulich <jbeulich@suse.com>
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
 <aa672eaa-e828-968b-73bf-dd4249d5de16@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <223ab610-34bc-c0a8-dfe2-6f54b86e7635@xen.org>
Date: Fri, 19 Feb 2021 09:24:08 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <aa672eaa-e828-968b-73bf-dd4249d5de16@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/02/2021 08:49, Jan Beulich wrote:
> On 18.02.2021 14:25, Julien Grall wrote:
>> Hi,
>>
>> On 18/02/2021 13:05, Jan Beulich wrote:
>>> On 17.02.2021 17:07, Julien Grall wrote:
>>>> On 17/02/2021 15:01, Jan Beulich wrote:
>>>>> On 17.02.2021 15:24, Julien Grall wrote:
>>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>>
>>>>>> The new x86 IOMMU page-tables allocator will release the pages when
>>>>>> relinquishing the domain resources. However, this is not sufficient
>>>>>> when the domain is dying because nothing prevents page-table to be
>>>>>> allocated.
>>>>>>
>>>>>> Currently page-table allocations can only happen from iommu_map(). As
>>>>>> the domain is dying, there is no good reason to continue to modify the
>>>>>> IOMMU page-tables.
>>>>>
>>>>> While I agree this to be the case right now, I'm not sure it is a
>>>>> good idea to build on it (in that you leave the unmap paths
>>>>> untouched).
>>>>
>>>> I don't build on that assumption. See next patch.
>>>
>>> Yet as said there that patch makes unmapping perhaps more fragile,
>>> by introducing a latent error source into the path.
>>
>> I still don't see what latent error my patch will introduce. Allocation
>> of page-tables are not guarantee to succeed.
>>
>> So are you implying that a code may rely on the page allocation to succeed?
> 
> I'm implying that failure to split a superpage may have unknown
> consequences.

As failure to flush the TLBs (see below).

> Since we make no use of superpages when not
> sharing page tables, I call this a latent issue which may go
> unnoticed for quite some time once no longer latent.

And it would take a lot longer to unnotice an OOM as this should happen 
less often ;).

But, I think this is wrong to blame the lower layer for a (latent) bug 
in the upper layer...

Even with your solution to zap page-tables, there is still a risk of 
failure because the TLB flush may fail (the operation can return an error).

So regardless the solution, we still need to have callers that function 
correctly.

Anyway, what matters right now is fixing a host crash when running PV 
guest with passthrough.  Neither patch #3 nor the iommu_unmap() part is 
strictly necessary for 4.15 (as you say this is latent).

So I would suggest to defer this discussion post-4.15.

Cheers,

-- 
Julien Grall

