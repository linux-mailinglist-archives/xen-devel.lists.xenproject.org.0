Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A879383772
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 17:43:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128381.241030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lifO8-0002dh-7F; Mon, 17 May 2021 15:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128381.241030; Mon, 17 May 2021 15:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lifO8-0002bP-1f; Mon, 17 May 2021 15:42:36 +0000
Received: by outflank-mailman (input) for mailman id 128381;
 Mon, 17 May 2021 15:42:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lifO6-0002bJ-Nz
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 15:42:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lifO5-0006YV-R7; Mon, 17 May 2021 15:42:33 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lifO5-0008UT-KY; Mon, 17 May 2021 15:42:33 +0000
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
	bh=zMfxWZHlyGd70oueurk5bT8CNJWsIFlwRgrweT2ly1c=; b=l4ZHCPQHoGoK6b1lraDGl1QmLh
	afNfc3XmsLiga+uAPHDEFeYYdGdxEr69IoyKJXINMPdtEvd+02t4s7xMCBMdszXA1pyE2z0Xghvn5
	7E1fnkZqkwHC8VwWAYsb/wOkKkFZlHCE+hGEy473pV0JjXSlcp7ZHo1cHW1mt2R8ByEg=;
Subject: Re: [PATCH v3 2/5] xen/common: Guard iommu symbols with
 CONFIG_HAS_PASSTHROUGH
To: Jan Beulich <jbeulich@suse.com>, Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621017334.git.connojdavis@gmail.com>
 <1156cb116da19ef64323e472bb6b6e87c6c73d77.1621017334.git.connojdavis@gmail.com>
 <556d1933-3b11-0780-edec-b6dc1729bc56@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <98b429d0-2673-624e-1690-9c0e8373ed5b@xen.org>
Date: Mon, 17 May 2021 16:42:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <556d1933-3b11-0780-edec-b6dc1729bc56@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 17/05/2021 12:16, Jan Beulich wrote:
> On 14.05.2021 20:53, Connor Davis wrote:
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -294,7 +294,9 @@ int guest_remove_page(struct domain *d, unsigned long gmfn)
>>       p2m_type_t p2mt;
>>   #endif
>>       mfn_t mfn;
>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>       bool *dont_flush_p, dont_flush;
>> +#endif
>>       int rc;
>>   
>>   #ifdef CONFIG_X86
>> @@ -385,13 +387,17 @@ int guest_remove_page(struct domain *d, unsigned long gmfn)
>>        * Since we're likely to free the page below, we need to suspend
>>        * xenmem_add_to_physmap()'s suppressing of IOMMU TLB flushes.
>>        */
>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>       dont_flush_p = &this_cpu(iommu_dont_flush_iotlb);
>>       dont_flush = *dont_flush_p;
>>       *dont_flush_p = false;
>> +#endif
>>   
>>       rc = guest_physmap_remove_page(d, _gfn(gmfn), mfn, 0);
>>   
>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>       *dont_flush_p = dont_flush;
>> +#endif
>>   
>>       /*
>>        * With the lack of an IOMMU on some platforms, domains with DMA-capable
>> @@ -839,11 +845,13 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
>>       xatp->gpfn += start;
>>       xatp->size -= start;
>>   
>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>       if ( is_iommu_enabled(d) )
>>       {
>>          this_cpu(iommu_dont_flush_iotlb) = 1;
>>          extra.ppage = &pages[0];
>>       }
>> +#endif
>>   
>>       while ( xatp->size > done )
>>       {
>> @@ -868,6 +876,7 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
>>           }
>>       }
>>   
>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>       if ( is_iommu_enabled(d) )
>>       {
>>           int ret;
>> @@ -894,6 +903,7 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
>>           if ( unlikely(ret) && rc >= 0 )
>>               rc = ret;
>>       }
>> +#endif
>>   
>>       return rc;
>>   }
> 
> I wonder whether all of these wouldn't better become CONFIG_X86:
> ISTR Julien indicating that he doesn't see the override getting used
> on Arm. (Julien, please correct me if I'm misremembering.)

Right, so far, I haven't been in favor to introduce it because:
    1) The P2M code may free some memory. So you can't always ignore the 
flush (I think this is wrong for the upper layer to know when this can 
happen).
    2) It is unclear what happen if the IOMMU TLBs and the PT contains 
different mappings (I received conflicted advice).

So it is better to always flush and as early as possible.

Cheers,

-- 
Julien Grall

