Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 488C92526C4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 08:22:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAonU-00020E-8V; Wed, 26 Aug 2020 06:20:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAonT-000209-Cl
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 06:20:35 +0000
X-Inumbo-ID: deccba53-3b1d-4dd4-a62f-57feb9ee70cd
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id deccba53-3b1d-4dd4-a62f-57feb9ee70cd;
 Wed, 26 Aug 2020 06:20:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D7E0ADF7;
 Wed, 26 Aug 2020 06:21:04 +0000 (UTC)
Subject: Re: [PATCH 2/2] arm/xen: Add misuse warning to virt_to_gfn
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Simon Leiner <simon@leiner.me>, xen-devel@lists.xenproject.org,
 jgross@suse.com, julien@xen.org
References: <Aw: [Linux] [ARM] Granting memory obtained from the DMA API>
 <20200825093153.35500-1-simon@leiner.me>
 <20200825093153.35500-2-simon@leiner.me>
 <374f42a0-b618-8b90-71b5-0a865ea1ddbb@suse.com>
 <alpine.DEB.2.21.2008251647100.24407@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <00bdd0ee-8f18-4580-01c7-01c95f3a6184@suse.com>
Date: Wed, 26 Aug 2020 08:20:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008251647100.24407@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.08.2020 01:48, Stefano Stabellini wrote:
> On Tue, 25 Aug 2020, Jan Beulich wrote:
>> On 25.08.2020 11:31, Simon Leiner wrote:
>>> --- a/include/xen/arm/page.h
>>> +++ b/include/xen/arm/page.h
>>> @@ -76,7 +76,11 @@ static inline unsigned long bfn_to_pfn(unsigned long bfn)
>>>  #define bfn_to_local_pfn(bfn)	bfn_to_pfn(bfn)
>>>  
>>>  /* VIRT <-> GUEST conversion */
>>> -#define virt_to_gfn(v)		(pfn_to_gfn(virt_to_phys(v) >> XEN_PAGE_SHIFT))
>>> +#define virt_to_gfn(v)                                                         \
>>> +	({                                                                     \
>>> +		WARN_ON_ONCE(is_vmalloc_addr(v));                              \
>>> +		pfn_to_gfn(virt_to_phys(v) >> XEN_PAGE_SHIFT);                 \
>>> +	})
>>
>> Shouldn't such a check cover more than just the vmalloc range,
>> i.e. everything outside of what __va() can validly return?
> 
> Keep in mind that this patch is meant as sister patch to
> https://marc.info/?l=xen-devel&m=159834800203817
> so it makes sense to check for vmalloc addresses specifically.

I had seen that patch before writing the reply, and I had assumed
precisely what you say. It was for this reason that I did point
out the limitation: While there's a specific issue for the vmalloc
range, any other addresses outside the direct mapping area are as
problematic (aiui).

> That said, I am not aware of a good way to implement the __va test you
> are suggesting.

Hmm, to me __phys_to_virt() and __virt_to_phys_nodebug() give
the impression that they're just linear transformations of the
address, which would seem to suggest there's a pre-determined
address range used for the direct map.

Jan

