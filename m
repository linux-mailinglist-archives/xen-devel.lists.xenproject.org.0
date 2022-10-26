Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EB560EAD2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 23:25:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430797.682884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onntU-0002CP-11; Wed, 26 Oct 2022 21:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430797.682884; Wed, 26 Oct 2022 21:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onntT-00029b-UT; Wed, 26 Oct 2022 21:24:59 +0000
Received: by outflank-mailman (input) for mailman id 430797;
 Wed, 26 Oct 2022 21:24:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1onntT-00029V-BW
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 21:24:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onntN-0003ni-JI; Wed, 26 Oct 2022 21:24:53 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onntN-0006Lc-Cy; Wed, 26 Oct 2022 21:24:53 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=sItJ5+hYj8CzCBe0BFkqN9pUL8NsekrPRIDvPd/T7qs=; b=2bMXgGrlSXKG8AOvmaZdFdozGv
	VYmKjmulPo8gzq4jA0IV93H5orfLLRnrbpGl2W31VFPWSwpzTLVcI7Ka5spJCZpVWNELgJcDKtuA5
	cvSbBl9tV9eHeyt8CN6n8tUhTLn3Inlsaok0mOFXnqt4QdaADzatS44UJpJFVdhfKpF4=;
Message-ID: <4c713750-670b-eac1-5f5b-376de79192eb@xen.org>
Date: Wed, 26 Oct 2022 22:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang
 <Henry.Wang@arm.com>, Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-2-andrew.cooper3@citrix.com>
 <ffb8bdb8-f54b-2107-ce1a-775337c172ac@suse.com>
 <0f048bd2-d08c-8bd5-2a20-7e49e794c679@citrix.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 1/4] xen: Introduce non-broken hypercalls for the p2m pool
 size
In-Reply-To: <0f048bd2-d08c-8bd5-2a20-7e49e794c679@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 26/10/2022 20:22, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/mm/hap/hap.c
>>> +++ b/xen/arch/x86/mm/hap/hap.c
>>> @@ -345,6 +345,16 @@ unsigned int hap_get_allocation(struct domain *d)
>>>               + ((pg & ((1 << (20 - PAGE_SHIFT)) - 1)) ? 1 : 0));
>>>   }
>>>   
>>> +int hap_get_allocation_bytes(struct domain *d, uint64_t *size)
>>> +{
>>> +    unsigned long pages = (d->arch.paging.hap.total_pages +
>>> +                           d->arch.paging.hap.p2m_pages);
>> Unlike for Arm no ACCESS_ONCE() here? Also the addition can in
>> principle overflow, because being done only in 32 bits.
> 
> I'm not actually convinced ARM needs ACCESS_ONCE() to begin with.  I
> can't see any legal transformation of that logic which could result in a
> torn load.

AFAIU, ACCESS_ONCE() is not only about torn load but also making sure 
that the compiler will only read the value once.

When LTO is enabled (not yet supported) in Xen, can we guarantee the 
compiler will not try to access total_pages twice (obviously it would be 
caller dependent)?

With that in mind, when LTO is enabled on Linux arm64, the 
implementation of READ_ONCE() is not a simple (volatile *) to prevent 
the compiler to do harmful convertion. Possibly something we will need 
to consider in Xen in the future if we enable LTO. In this context, the 
ACCESS_ONCE() would make sense because we don't know (or should not 
assume) how the caller will use it.

Regardless that, I think using ACCESS_ONCE() help to document how the 
variable should be used. This will reduce the risk that someone decides 
to add a new use total_pages like below:

val = d->arch.paging.total_pages;

if ( val == 0 )
   return ...

/* use val */

AFAIU, a compiler would be allow to read total_pages twice here. Which 
is not what we would want. I am ready to bet this will be missed.

So consistency here is IMO much better. An alternative would be to 
document why we think the compiler would not be naughty.

Cheers,

-- 
Julien Grall

