Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A26B936A791
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 15:42:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117164.223036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laf0X-0007Fc-Mb; Sun, 25 Apr 2021 13:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117164.223036; Sun, 25 Apr 2021 13:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laf0X-0007FD-JD; Sun, 25 Apr 2021 13:41:09 +0000
Received: by outflank-mailman (input) for mailman id 117164;
 Sun, 25 Apr 2021 13:41:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1laf0W-0007F8-7t
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 13:41:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1laf0U-0002EX-P1; Sun, 25 Apr 2021 13:41:06 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1laf0U-0001ND-DA; Sun, 25 Apr 2021 13:41:06 +0000
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
	bh=jcseDq2ZdU1T0/rnFxbHc4SJN0BhJiMohi8QIY8/hu8=; b=PqcaPzFM5/uNcsvWa9hcWuVCV7
	idWyZZkkQ8Z/b5vY/ipzo74swD6/Ke/cg+fgcAFGrmGIfWGKobhhre5/7CFZCeXnQrV3pl+4VoP+O
	Yv/XE1eSQVH3ygzTDhVSJg+d/fJhMtmGYp0xxnvLjj1iQ5ywq+7XElFmggFluiXFASSA=;
Subject: Re: [PATCH] xen/page_alloc: Remove dead code in alloc_domheap_pages()
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210406192246.15657-1-julien@xen.org>
 <6d3593cb-40d4-df17-4070-a6c18ea7d62b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6b37dc84-a251-a9d7-071d-65d2afad6361@xen.org>
Date: Sun, 25 Apr 2021 14:41:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <6d3593cb-40d4-df17-4070-a6c18ea7d62b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 07/04/2021 10:25, Jan Beulich wrote:
> On 06.04.2021 21:22, Julien Grall wrote:
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -457,6 +457,12 @@ static long total_avail_pages;
>>   static DEFINE_SPINLOCK(heap_lock);
>>   static long outstanding_claims; /* total outstanding claims by all domains */
>>   
>> +static void __init __maybe_unused build_assertions(void)
>> +{
>> +    /* Zone 0 is reserved for Xen, so we at least need two zones to function.*/
>> +    BUILD_BUG_ON(NR_ZONES < 2);
>> +}
> 
> With a couple of transformations this could also be
> 
>      BUILD_BUG_ON(PADDR_BITS <= PAGE_SHIFT);
> 
> i.e. you're checking that the architecture allows for at least two
> pages to be addressable. Is this really a useful thing to check?

I saw it, but I was concerned that someone may modify the definition of 
NR_ZONES without looking at the rest of the code base.

Anyway, I guess that the ASSERT(zone_hi != 0) in the code should be 
sufficient to catch such problem. So I will drop it.

> 
> Irrespective of the usefulness, if this is to be kept I think the
> function wants to live at the end of the source file, like the
> majority of other files have it (another consistent place could
> be at the top of the file, after all #include-s, as can be found
> in two other cases).
> 
>> @@ -2340,8 +2346,9 @@ struct page_info *alloc_domheap_pages(
>>   
>>       bits = domain_clamp_alloc_bitsize(memflags & MEMF_no_owner ? NULL : d,
>>                                         bits ? : (BITS_PER_LONG+PAGE_SHIFT));
>> -    if ( (zone_hi = min_t(unsigned int, bits_to_zone(bits), zone_hi)) == 0 )
>> -        return NULL;
>> +
>> +    zone_hi = min_t(unsigned int, bits_to_zone(bits), zone_hi);
>> +    ASSERT(zone_hi != 0);
> 
> With the function above preferably dropped or at least moved,
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> I'd like to point out though that I think this would be a good
> opportunity to eliminate the use of min_t() here, by changing
> bits_to_zone()'s 1 to 1u. But I suppose you again would prefer
> to not make this extra change right here, despite it being
> somewhat related to bits_to_zone() only ever returning positive
> values.

In general, I am in not in favor to modify unrelated to code (e.g. 
coding style) or things that deserved a more than a one-line explanation 
in the commit message. This is not the case here, so I will respin it 
and switch from min_t to min.

Cheers,

-- 
Julien Grall

