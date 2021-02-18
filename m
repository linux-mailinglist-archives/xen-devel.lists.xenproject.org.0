Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DCD31EA3B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 14:06:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86641.162761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCj08-0000Yl-0X; Thu, 18 Feb 2021 13:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86641.162761; Thu, 18 Feb 2021 13:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCj07-0000YM-Tc; Thu, 18 Feb 2021 13:05:47 +0000
Received: by outflank-mailman (input) for mailman id 86641;
 Thu, 18 Feb 2021 13:05:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x3vz=HU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCj06-0000YD-Ck
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 13:05:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3251abe-4c87-4528-bac8-13f09b19fd4c;
 Thu, 18 Feb 2021 13:05:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85101ACE5;
 Thu, 18 Feb 2021 13:05:44 +0000 (UTC)
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
X-Inumbo-ID: a3251abe-4c87-4528-bac8-13f09b19fd4c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613653544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4zHRJzE4DwRp/+P2uIqjaOI1hbKMfhgC5lubSPgQPCE=;
	b=AdMnZeE6Rh8a0l7sFBVXg8pdZyJyHx44VBmfh56/ELG5900K9WyZhbXTRXUSMlAiikWISp
	QtNvYCxtwu4HFva8FXKA1uxdyvkmgcye+RVhyhAh+n8tmDbGF5kgLioDdr+pzE+F46ojmb
	aAEf4hxlcZ/Njc2sKqgCeQRnOHGxHzA=
Subject: Re: [for-4.15][PATCH v3 2/3] xen/x86: iommu: Ignore IOMMU mapping
 requests when a domain is dying
To: Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20210217142458.3769-1-julien@xen.org>
 <20210217142458.3769-3-julien@xen.org>
 <20f68b12-a767-b1d3-a3dd-9f92172def5f@suse.com>
 <d1116875-dd98-8f51-9113-314c1a62b4bf@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <268f1991-bacb-c888-04c0-0e4cf670b6b5@suse.com>
Date: Thu, 18 Feb 2021 14:05:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d1116875-dd98-8f51-9113-314c1a62b4bf@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.02.2021 17:07, Julien Grall wrote:
> On 17/02/2021 15:01, Jan Beulich wrote:
>> On 17.02.2021 15:24, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> The new x86 IOMMU page-tables allocator will release the pages when
>>> relinquishing the domain resources. However, this is not sufficient
>>> when the domain is dying because nothing prevents page-table to be
>>> allocated.
>>>
>>> Currently page-table allocations can only happen from iommu_map(). As
>>> the domain is dying, there is no good reason to continue to modify the
>>> IOMMU page-tables.
>>
>> While I agree this to be the case right now, I'm not sure it is a
>> good idea to build on it (in that you leave the unmap paths
>> untouched).
> 
> I don't build on that assumption. See next patch.

Yet as said there that patch makes unmapping perhaps more fragile,
by introducing a latent error source into the path.

>> Imo there's a fair chance this would be overlooked at
>> the point super page mappings get introduced (which has been long
>> overdue), and I thought prior discussion had lead to a possible
>> approach without risking use-after-free due to squashed unmap
>> requests.
> 
> I know you suggested to zap the root page-tables... However, I don't 
> think this is 4.15 material and you agree with this (you were the one 
> pointed out that out).

Paul - do you have any thoughts here? Outright zapping isn't
going to work, we'd need to switch to quarantine page tables at
the very least to prevent the issue with babbling devices. But
that still seems better to me than the introduction of a latent
issue on the unmap paths.

>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>> @@ -273,6 +273,9 @@ int iommu_free_pgtables(struct domain *d)
>>>       /*
>>>        * Pages will be moved to the free list below. So we want to
>>>        * clear the root page-table to avoid any potential use after-free.
>>> +     *
>>> +     * After this call, no more IOMMU mapping can happen.
>>> +     *
>>>        */
>>>       hd->platform_ops->clear_root_pgtable(d);
>>
>> I.e. you utilize the call in place of spin_barrier(). Maybe worth
>> saying in the comment?
> 
> Sure.

Btw - "no more IOMMU mapping" is also possibly ambiguous here:
One might take it to mean both maps and unmaps. How about "no
new IOMMU mappings can be inserted", as long as the unmap paths
don't follow suit?

Jan

