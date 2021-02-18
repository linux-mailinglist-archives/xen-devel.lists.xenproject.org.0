Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954CF31EA65
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 14:25:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86651.162798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCjIx-0002i9-7N; Thu, 18 Feb 2021 13:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86651.162798; Thu, 18 Feb 2021 13:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCjIx-0002hk-3b; Thu, 18 Feb 2021 13:25:15 +0000
Received: by outflank-mailman (input) for mailman id 86651;
 Thu, 18 Feb 2021 13:25:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCjIv-0002hf-Tk
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 13:25:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCjIm-0006R9-7W; Thu, 18 Feb 2021 13:25:04 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCjIl-0000me-UU; Thu, 18 Feb 2021 13:25:04 +0000
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
	bh=kbUgVWmOaNiyuJGVBS9FHtCRD8oLJxkmHRRV3QktNjw=; b=lyOsDD3+qoxwiy7/NxA1DbNbIb
	OUMcUrMPwV7urGENX8jzFio2fh+D9ppQYz8GgGi423JhutWZa1TU4roXTNw3b+ReUnQm2dbNAzBKf
	yrliYrTbRIRXrmrj2lLuHQIckPu+5wSjG6NS2phnWPLYV06MN4h5BcZH/luJoVIDFd44=;
Subject: Re: [for-4.15][PATCH v3 2/3] xen/x86: iommu: Ignore IOMMU mapping
 requests when a domain is dying
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20210217142458.3769-1-julien@xen.org>
 <20210217142458.3769-3-julien@xen.org>
 <20f68b12-a767-b1d3-a3dd-9f92172def5f@suse.com>
 <d1116875-dd98-8f51-9113-314c1a62b4bf@xen.org>
 <268f1991-bacb-c888-04c0-0e4cf670b6b5@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c713f440-8c3d-42fe-1d71-56b23e53a495@xen.org>
Date: Thu, 18 Feb 2021 13:25:02 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <268f1991-bacb-c888-04c0-0e4cf670b6b5@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 18/02/2021 13:05, Jan Beulich wrote:
> On 17.02.2021 17:07, Julien Grall wrote:
>> On 17/02/2021 15:01, Jan Beulich wrote:
>>> On 17.02.2021 15:24, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> The new x86 IOMMU page-tables allocator will release the pages when
>>>> relinquishing the domain resources. However, this is not sufficient
>>>> when the domain is dying because nothing prevents page-table to be
>>>> allocated.
>>>>
>>>> Currently page-table allocations can only happen from iommu_map(). As
>>>> the domain is dying, there is no good reason to continue to modify the
>>>> IOMMU page-tables.
>>>
>>> While I agree this to be the case right now, I'm not sure it is a
>>> good idea to build on it (in that you leave the unmap paths
>>> untouched).
>>
>> I don't build on that assumption. See next patch.
> 
> Yet as said there that patch makes unmapping perhaps more fragile,
> by introducing a latent error source into the path.

I still don't see what latent error my patch will introduce. Allocation 
of page-tables are not guarantee to succeed.

So are you implying that a code may rely on the page allocation to succeed?

> 
>>> Imo there's a fair chance this would be overlooked at
>>> the point super page mappings get introduced (which has been long
>>> overdue), and I thought prior discussion had lead to a possible
>>> approach without risking use-after-free due to squashed unmap
>>> requests.
>>
>> I know you suggested to zap the root page-tables... However, I don't
>> think this is 4.15 material and you agree with this (you were the one
>> pointed out that out).
> 
> Paul - do you have any thoughts here? Outright zapping isn't
> going to work, we'd need to switch to quarantine page tables at
> the very least to prevent the issue with babbling devices. But
> that still seems better to me than the introduction of a latent
> issue on the unmap paths.

I am afraid I am not going to be able to come up with such patch for 
4.15. If you want to go that route for 4.15, then feel free to suggest a 
patch.

[...]

> Btw - "no more IOMMU mapping" is also possibly ambiguous here:
> One might take it to mean both maps and unmaps. How about "no
> new IOMMU mappings can be inserted", as long as the unmap paths
> don't follow suit?

Sure.

Cheers,

-- 
Julien Grall

