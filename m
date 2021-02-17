Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A877031DAFB
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 14:55:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86276.161850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCNI5-0002SQ-9Y; Wed, 17 Feb 2021 13:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86276.161850; Wed, 17 Feb 2021 13:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCNI5-0002S4-6S; Wed, 17 Feb 2021 13:54:53 +0000
Received: by outflank-mailman (input) for mailman id 86276;
 Wed, 17 Feb 2021 13:54:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCNI3-0002Rw-Vm
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 13:54:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCNHx-00045M-MY; Wed, 17 Feb 2021 13:54:45 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCNHx-0002fc-EM; Wed, 17 Feb 2021 13:54:45 +0000
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
	bh=/BMI8jzOWOIBwNHI/soZA7yadtHGIBIyCRbij6dumj4=; b=xa7WckS1UZuapeyC5uvhAFU381
	y52Rg0i9K8gtuYyB4kU4FJ2GbUJUKX71fpKIPcIL6DswSmd6vBWeKlKbzouFLuZdhIdtijkl72yS0
	nia8H5KQxANTdX3fghYT0edGs8JCdDBTf5l3kSa9iuZzoQbVskaJWCTH2NLITdlfh0MU=;
Subject: Re: [for-4.15][PATCH v2 5/5] xen/iommu: x86: Clear the root
 page-table before freeing the page-tables
To: "Tian, Kevin" <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "hongyxia@amazon.co.uk" <hongyxia@amazon.co.uk>,
 "iwj@xenproject.org" <iwj@xenproject.org>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, "Cooper, Andrew"
 <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-6-julien@xen.org>
 <MWHPR11MB18869B3DB550711B3F6F6CA48C8D9@MWHPR11MB1886.namprd11.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a8636cac-c4da-27f6-404e-20e9e58a77b1@xen.org>
Date: Wed, 17 Feb 2021 13:54:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB18869B3DB550711B3F6F6CA48C8D9@MWHPR11MB1886.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Kevin,

On 10/02/2021 02:21, Tian, Kevin wrote:
>> From: Julien Grall <julien@xen.org>
>> Sent: Tuesday, February 9, 2021 11:28 PM
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The new per-domain IOMMU page-table allocator will now free the
>> page-tables when domain's resources are relinquished. However, the root
>> page-table (i.e. hd->arch.pg_maddr) will not be cleared.
> 
> It's the pointer not the table itself.

I don't think the sentence is incorrect. One can view clearing as either 
clearing the page table itself or the pointer.

> 
>>
>> Xen may access the IOMMU page-tables afterwards at least in the case of
>> PV domain:
>>
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d04025b4b2>] R
>> iommu.c#addr_to_dma_page_maddr+0x12e/0x1d8
>> (XEN)    [<ffff82d04025b695>] F
>> iommu.c#intel_iommu_unmap_page+0x5d/0xf8
>> (XEN)    [<ffff82d0402695f3>] F iommu_unmap+0x9c/0x129
>> (XEN)    [<ffff82d0402696a6>] F iommu_legacy_unmap+0x26/0x63
>> (XEN)    [<ffff82d04033c5c7>] F mm.c#cleanup_page_mappings+0x139/0x144
>> (XEN)    [<ffff82d04033c61d>] F put_page+0x4b/0xb3
>> (XEN)    [<ffff82d04033c87f>] F put_page_from_l1e+0x136/0x13b
>> (XEN)    [<ffff82d04033cada>] F devalidate_page+0x256/0x8dc
>> (XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
>> (XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
>> (XEN)    [<ffff82d04033d8d6>] F mm.c#put_page_from_l2e+0x8a/0xcf
>> (XEN)    [<ffff82d04033cc27>] F devalidate_page+0x3a3/0x8dc
>> (XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
>> (XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
>> (XEN)    [<ffff82d04033d807>] F mm.c#put_page_from_l3e+0x8a/0xcf
>> (XEN)    [<ffff82d04033cdf0>] F devalidate_page+0x56c/0x8dc
>> (XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
>> (XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
>> (XEN)    [<ffff82d04033d6c7>] F mm.c#put_page_from_l4e+0x69/0x6d
>> (XEN)    [<ffff82d04033cf24>] F devalidate_page+0x6a0/0x8dc
>> (XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
>> (XEN)    [<ffff82d04033d92e>] F put_page_type_preemptible+0x13/0x15
>> (XEN)    [<ffff82d04032598a>] F domain.c#relinquish_memory+0x1ff/0x4e9
>> (XEN)    [<ffff82d0403295f2>] F domain_relinquish_resources+0x2b6/0x36a
>> (XEN)    [<ffff82d040205cdf>] F domain_kill+0xb8/0x141
>> (XEN)    [<ffff82d040236cac>] F do_domctl+0xb6f/0x18e5
>> (XEN)    [<ffff82d04031d098>] F pv_hypercall+0x2f0/0x55f
>> (XEN)    [<ffff82d04039b432>] F lstar_enter+0x112/0x120
>>
>> This will result to a use after-free and possibly an host crash or
>> memory corruption.
>>
>> Freeing the page-tables further down in domain_relinquish_resources()
>> would not work because pages may not be released until later if another
>> domain hold a reference on them.
>>
>> Once all the PCI devices have been de-assigned, it is actually pointless
>> to access modify the IOMMU page-tables. So we can simply clear the root
>> page-table address.
> 
> Above two paragraphs are confusing to me. I don't know what exact change
> is proposed until looking over the whole patch. Isn't it clearer to just say
> "We should clear the root page table pointer in iommu_free_pgtables to
> avoid use-after-free after all pgtables are moved to the free list"?

Your sentence explain the approach taken but not the rational behind the 
approach. Both are equally important for future reference.

I will try to reword it.

Cheers,

-- 
Julien Grall

