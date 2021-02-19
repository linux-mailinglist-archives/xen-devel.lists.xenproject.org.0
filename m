Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F72C31F61C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 09:56:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86809.163240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD1aV-0002Jt-GD; Fri, 19 Feb 2021 08:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86809.163240; Fri, 19 Feb 2021 08:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD1aV-0002JU-DJ; Fri, 19 Feb 2021 08:56:35 +0000
Received: by outflank-mailman (input) for mailman id 86809;
 Fri, 19 Feb 2021 08:56:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TOKe=HV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lD1aT-0002JP-QJ
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 08:56:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91cd361b-6633-4316-9f5f-11fa1442adcf;
 Fri, 19 Feb 2021 08:56:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CB986AED2;
 Fri, 19 Feb 2021 08:56:31 +0000 (UTC)
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
X-Inumbo-ID: 91cd361b-6633-4316-9f5f-11fa1442adcf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613724991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ITrIOhijD+0MgNfyXd0YvcHKDVayblTBb3Txi7ML4fk=;
	b=rR4bkhKpFpDpi3jQc1XlnSqgfuMMYh/hfv1rZduUKPP0uHqtEzRaCWRty3Sy+CwxoRJdJo
	KjxnJCnAhy+Sn+IaCFJQAhgC0SJ2w5Kh+Aw89QOXujU6CNMscne+gzimXidt+itmwN3SZt
	JqSYM2ET5xdtcxiRj+eqj0TPGX0wpF4=
Subject: Re: [for-4.15][PATCH v3 2/3] xen/x86: iommu: Ignore IOMMU mapping
 requests when a domain is dying
To: paul@xen.org
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <20210217142458.3769-1-julien@xen.org>
 <20210217142458.3769-3-julien@xen.org>
 <20f68b12-a767-b1d3-a3dd-9f92172def5f@suse.com>
 <d1116875-dd98-8f51-9113-314c1a62b4bf@xen.org>
 <268f1991-bacb-c888-04c0-0e4cf670b6b5@suse.com>
 <14f21eac-7d5d-9dda-18d2-206614e91339@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d818154a-2176-2607-b893-6e77e57e5c82@suse.com>
Date: Fri, 19 Feb 2021 09:56:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <14f21eac-7d5d-9dda-18d2-206614e91339@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.02.2021 15:00, Paul Durrant wrote:
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
>>
>>>> Imo there's a fair chance this would be overlooked at
>>>> the point super page mappings get introduced (which has been long
>>>> overdue), and I thought prior discussion had lead to a possible
>>>> approach without risking use-after-free due to squashed unmap
>>>> requests.
>>>
>>> I know you suggested to zap the root page-tables... However, I don't
>>> think this is 4.15 material and you agree with this (you were the one
>>> pointed out that out).
>>
>> Paul - do you have any thoughts here? Outright zapping isn't
>> going to work, we'd need to switch to quarantine page tables at
>> the very least to prevent the issue with babbling devices. But
>> that still seems better to me than the introduction of a latent
>> issue on the unmap paths.
>>
> 
> I've not really been following this. AFAICT clear_root_pgtable() does 
> not actually mess with any context entries so the device view of the 
> tables won't change, will it?

Correct. Elsewhere I said that "zapping" here has two meanings,
one is what Julien does and the other is what I mean and what I
understand you also refer to - to actually replace the mappings
referenced by a context entry as soon as we no longer guarantee
to update them correctly.

My concern with not touching the unmap paths is that if there
was any "best effort" unmap left anywhere in the tree, we may
still end up with a use-after-free when late unmaps are now
made possibly fail by failing late allocation attempts.

Jan

