Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 177A32747F1
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 20:06:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKmfF-00068R-9E; Tue, 22 Sep 2020 18:05:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZDRM=C7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKmfE-00068M-1W
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 18:05:16 +0000
X-Inumbo-ID: 1c2801d8-773b-46ba-b5a4-c7aa4cbee3ad
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c2801d8-773b-46ba-b5a4-c7aa4cbee3ad;
 Tue, 22 Sep 2020 18:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=8hoZXirx5TJIOpmu7QVJeiDrCVkiO7J9C/V37GwCi9Y=; b=Qyq5gzH7l+WVlB3Kz5dA/V6w62
 6kedJR4/wKb1T+8IJJ2LdIVoK6qhWkUOQcFPfIaBVe/40LQmX/9rR1Wtc6DbqVwYseY4y//UY/2kv
 IU5b/ucQ1ZRxSMsRhcleaPQu9aLipLL/+y3vdK26lo66+IN4tRTbFwMWSaeEg9jwV0Xk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKmfA-00054t-1D; Tue, 22 Sep 2020 18:05:12 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKmf9-0003za-PA; Tue, 22 Sep 2020 18:05:11 +0000
Subject: Re: [PATCH v4 1/4] xen: XENMEM_exchange should only be used/compiled
 for arch supporting PV guest
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20200921180214.4842-1-julien@xen.org>
 <20200921180214.4842-2-julien@xen.org>
 <834db49d-dda5-784c-1135-8427086a04eb@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <692ebf5c-04fe-6b98-a2e5-e49a163c6c0f@xen.org>
Date: Tue, 22 Sep 2020 19:05:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <834db49d-dda5-784c-1135-8427086a04eb@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

Hi Jan,

On 22/09/2020 08:35, Jan Beulich wrote:
> On 21.09.2020 20:02, Julien Grall wrote:
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -504,6 +504,7 @@ static bool propagate_node(unsigned int xmf, unsigned int *memflags)
>>   
>>   static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>>   {
>> +#ifdef CONFIG_PV
>>       struct xen_memory_exchange exch;
>>       PAGE_LIST_HEAD(in_chunk_list);
>>       PAGE_LIST_HEAD(out_chunk_list);
>> @@ -516,6 +517,9 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>>       struct domain *d;
>>       struct page_info *page;
>>   
>> +    if ( !is_pv_domain(d) )
>> +        return -EOPNOTSUPP;
> 
> I think "paging_mode_translate(d)" would be more correct, at which
> point the use later in the function ought to be dropped (as that's
> precisely one of the things making this function not really
> sensible to use on translated guests).

I have used paging_mode_translate(d) and remove the later use.

> 
> I also wonder whether the #ifdef wouldn't better be left out. Yes,
> that'll mean retaining a stub mfn_to_gmfn(), but it could expand
> to simply BUG() then, for example.

Keeping mfn_to_gmfn() will not discourage developper to add more use of 
it. The risk is we don't notice it when reviewing  and this would lead 
to hit a BUG_ON().

Given this will be the only place where mfn_to_gmfn() is used, I think 
it is best to stub the code. Bear in mind that long term, this function 
should leave outside of common/mm.c (see Andrew's e-mail).

Cheers,

-- 
Julien Grall

