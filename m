Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF9A2E1DA2
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 15:57:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58414.102694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5ZV-0006BZ-QM; Wed, 23 Dec 2020 14:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58414.102694; Wed, 23 Dec 2020 14:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5ZV-0006B4-Me; Wed, 23 Dec 2020 14:57:01 +0000
Received: by outflank-mailman (input) for mailman id 58414;
 Wed, 23 Dec 2020 14:56:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ks5ZT-0006Aa-TA
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 14:56:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks5ZT-0000Ih-FA; Wed, 23 Dec 2020 14:56:59 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks5ZT-0001rv-86; Wed, 23 Dec 2020 14:56:59 +0000
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
	bh=lKsx3azKR0cMl/VmQv6Mzvxo3k3Fchw39EhAm4OBy6Y=; b=e2EDMbgv9VY24TMic01lfV1pie
	D+jlnCPlSBj0wyvjwArp7TleCHmmPJx4pav2hbgsAfqIkQDWyV2R6VM88APMcfbs1mNlr+mu12LaX
	15AykyRhixltUdbBfMCIVKNO0Rx4Ne/Jr+96Xe6PF4N1DEvqKXySGsqbgNaGMPFD/kDY=;
Subject: Re: [PATCH for-4.15 3/4] [RFC] xen/iommu: x86: Clear the root
 page-table before freeing the page-tables
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-4-julien@xen.org>
 <499e6d5a-e8ac-56db-1af9-70469b6a06b9@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8b394c44-5bdb-9d82-b211-5a4ee3473568@xen.org>
Date: Wed, 23 Dec 2020 14:56:57 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <499e6d5a-e8ac-56db-1af9-70469b6a06b9@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/12/2020 14:12, Jan Beulich wrote:
> On 22.12.2020 16:43, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The new per-domain IOMMU page-table allocator will now free the
>> page-tables when domain's resources are relinquished. However, the root
>> page-table (i.e. hd->arch.pg_maddr) will not be cleared.
>>
>> Xen may access the IOMMU page-tables afterwards at least in the case of
>> PV domain:
>>
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d04025b4b2>] R iommu.c#addr_to_dma_page_maddr+0x12e/0x1d8
>> (XEN)    [<ffff82d04025b695>] F iommu.c#intel_iommu_unmap_page+0x5d/0xf8
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
>>
>> Fixes: 3eef6d07d722 ("x86/iommu: convert VT-d code to use new page table allocator")
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>> This is an RFC because it would break AMD IOMMU driver. One option would
>> be to move the call to the teardown callback earlier on. Any opinions?
> 
> We already have
> 
> static void amd_iommu_domain_destroy(struct domain *d)
> {
>      dom_iommu(d)->arch.amd.root_table = NULL;
> }
> 
> and this function is AMD's teardown handler. Hence I suppose
> doing the same for VT-d would be quite reasonable. And really
> VT-d's iommu_domain_teardown() also already has
> 
>      hd->arch.vtd.pgd_maddr = 0;

Let me have a look if that works.

> 
> I guess what's missing is prevention of the root table
> getting re-setup. 

This is taken care in the follow-up patch by forbidding page-table 
allocation. I can mention it in the commit message.


> This, I guess, would be helped by the
> previously suggested preventing of any further modifications
> to the p2m and alike for dying domains. Note how e.g. the
> handling of XEN_DOMCTL_assign_device already includes a
> "dying" check.
> 
> Jan
> 

-- 
Julien Grall

