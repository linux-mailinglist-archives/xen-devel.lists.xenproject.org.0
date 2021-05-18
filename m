Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9590A3871DF
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 08:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128727.241611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litCc-0007ad-ML; Tue, 18 May 2021 06:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128727.241611; Tue, 18 May 2021 06:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litCc-0007YN-J7; Tue, 18 May 2021 06:27:38 +0000
Received: by outflank-mailman (input) for mailman id 128727;
 Tue, 18 May 2021 06:27:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1litCb-0007YH-26
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 06:27:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f343995-a874-42e9-8273-d1fa9b7f3c7f;
 Tue, 18 May 2021 06:27:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3EDE9AF0B;
 Tue, 18 May 2021 06:27:35 +0000 (UTC)
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
X-Inumbo-ID: 0f343995-a874-42e9-8273-d1fa9b7f3c7f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621319255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vH3Fcfj+/jcnPVnbRR9qiOn/UQ1RAcuNx8X60zLDJa8=;
	b=aGFP+S0i8Exn4fzP/ywQEp4O5zEpIbrXDP953dzfidosYZMrL5n+Npx3ND3SVHiLua6/8X
	ravvah4gD/1Jds1eRoAMOmiCXHz8X+KJNjufSgeOv6vUuycsMcVJQOAzqVt3nMZ4bolr01
	9Psvt6iBZhrcYtGklafxObPkHiXZCvE=
Subject: Re: [PATCH v3 2/5] xen/common: Guard iommu symbols with
 CONFIG_HAS_PASSTHROUGH
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <cover.1621017334.git.connojdavis@gmail.com>
 <1156cb116da19ef64323e472bb6b6e87c6c73d77.1621017334.git.connojdavis@gmail.com>
 <556d1933-3b11-0780-edec-b6dc1729bc56@suse.com>
 <98b429d0-2673-624e-1690-9c0e8373ed5b@xen.org>
 <7cf966f6-7ccf-ba63-2b67-129577a7ca53@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8e415cac-a8b3-67a6-2f7b-489b964ceb50@suse.com>
Date: Tue, 18 May 2021 08:27:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <7cf966f6-7ccf-ba63-2b67-129577a7ca53@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.05.2021 06:11, Connor Davis wrote:
> 
> On 5/17/21 9:42 AM, Julien Grall wrote:
>> Hi Jan,
>>
>> On 17/05/2021 12:16, Jan Beulich wrote:
>>> On 14.05.2021 20:53, Connor Davis wrote:
>>>> --- a/xen/common/memory.c
>>>> +++ b/xen/common/memory.c
>>>> @@ -294,7 +294,9 @@ int guest_remove_page(struct domain *d, unsigned 
>>>> long gmfn)
>>>>       p2m_type_t p2mt;
>>>>   #endif
>>>>       mfn_t mfn;
>>>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>>>       bool *dont_flush_p, dont_flush;
>>>> +#endif
>>>>       int rc;
>>>>     #ifdef CONFIG_X86
>>>> @@ -385,13 +387,17 @@ int guest_remove_page(struct domain *d, 
>>>> unsigned long gmfn)
>>>>        * Since we're likely to free the page below, we need to suspend
>>>>        * xenmem_add_to_physmap()'s suppressing of IOMMU TLB flushes.
>>>>        */
>>>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>>>       dont_flush_p = &this_cpu(iommu_dont_flush_iotlb);
>>>>       dont_flush = *dont_flush_p;
>>>>       *dont_flush_p = false;
>>>> +#endif
>>>>         rc = guest_physmap_remove_page(d, _gfn(gmfn), mfn, 0);
>>>>   +#ifdef CONFIG_HAS_PASSTHROUGH
>>>>       *dont_flush_p = dont_flush;
>>>> +#endif
>>>>         /*
>>>>        * With the lack of an IOMMU on some platforms, domains with 
>>>> DMA-capable
>>>> @@ -839,11 +845,13 @@ int xenmem_add_to_physmap(struct domain *d, 
>>>> struct xen_add_to_physmap *xatp,
>>>>       xatp->gpfn += start;
>>>>       xatp->size -= start;
>>>>   +#ifdef CONFIG_HAS_PASSTHROUGH
>>>>       if ( is_iommu_enabled(d) )
>>>>       {
>>>>          this_cpu(iommu_dont_flush_iotlb) = 1;
>>>>          extra.ppage = &pages[0];
>>>>       }
>>>> +#endif
>>>>         while ( xatp->size > done )
>>>>       {
>>>> @@ -868,6 +876,7 @@ int xenmem_add_to_physmap(struct domain *d, 
>>>> struct xen_add_to_physmap *xatp,
>>>>           }
>>>>       }
>>>>   +#ifdef CONFIG_HAS_PASSTHROUGH
>>>>       if ( is_iommu_enabled(d) )
>>>>       {
>>>>           int ret;
>>>> @@ -894,6 +903,7 @@ int xenmem_add_to_physmap(struct domain *d, 
>>>> struct xen_add_to_physmap *xatp,
>>>>           if ( unlikely(ret) && rc >= 0 )
>>>>               rc = ret;
>>>>       }
>>>> +#endif
>>>>         return rc;
>>>>   }
>>>
>>> I wonder whether all of these wouldn't better become CONFIG_X86:
>>> ISTR Julien indicating that he doesn't see the override getting used
>>> on Arm. (Julien, please correct me if I'm misremembering.)
>>
>> Right, so far, I haven't been in favor to introduce it because:
>>    1) The P2M code may free some memory. So you can't always ignore 
>> the flush (I think this is wrong for the upper layer to know when this 
>> can happen).
>>    2) It is unclear what happen if the IOMMU TLBs and the PT contains 
>> different mappings (I received conflicted advice).
>>
>> So it is better to always flush and as early as possible.
> 
> So keep it as is or switch to CONFIG_X86?

Please switch, unless anyone else voices a strong opinion towards
keeping as is.

Jan

