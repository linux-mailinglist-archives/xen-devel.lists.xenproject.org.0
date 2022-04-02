Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0F44F04AF
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 18:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297816.507329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nagAK-00030G-1v; Sat, 02 Apr 2022 15:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297816.507329; Sat, 02 Apr 2022 15:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nagAJ-0002xy-V0; Sat, 02 Apr 2022 15:59:51 +0000
Received: by outflank-mailman (input) for mailman id 297816;
 Sat, 02 Apr 2022 15:59:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nagAI-0002xc-S5
 for xen-devel@lists.xenproject.org; Sat, 02 Apr 2022 15:59:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nagAI-0004ds-KE; Sat, 02 Apr 2022 15:59:50 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nagAI-0007ZT-EE; Sat, 02 Apr 2022 15:59:50 +0000
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
	bh=fGKSKvo4T12PucqAyjUkFUh8cD9XfEnPKGDQY66PD7o=; b=PrhzN2HveYJ906Z8g3WluMWdx5
	niZrajaY6ffCW+VAzOqUbxI2mSfa0aVJqEAJpScjcHvCUTHDk2Soj247R5TiZhyoLidSVs0sWZhGQ
	Jvo6QbjCdeAWdKrVKFn0h/gmEM3rhTvOhUJtpsfjxPwW7K4Nuall+5g2OLu2CJ3j++IE=;
Message-ID: <a2dafd9a-a0a9-b99d-9592-4f8e5fbb3f20@xen.org>
Date: Sat, 2 Apr 2022 16:59:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-5-julien@xen.org>
 <alpine.DEB.2.22.394.2204011605580.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 04/19] xen/arm: mm: Allow other mapping size in
 xen_pt_update_entry()
In-Reply-To: <alpine.DEB.2.22.394.2204011605580.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/04/2022 00:35, Stefano Stabellini wrote:
>> +/* Return the level where mapping should be done */
>> +static int xen_pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
>> +                                unsigned int flags)
>> +{
>> +    unsigned int level;
>> +    unsigned long mask;
> 
> Shouldn't mask be 64-bit on aarch32?

The 3 variables we will use (mfn, vfn, nr) are unsigned long. So it is 
fine to define the mask as unsigned long.

>> +}
>> +
>>   static DEFINE_SPINLOCK(xen_pt_lock);
>>   
>>   static int xen_pt_update(unsigned long virt,
>>                            mfn_t mfn,
>> -                         unsigned long nr_mfns,
>> +                         const unsigned long nr_mfns,
> 
> Why const? nr_mfns is an unsigned long so it is passed as value: it
> couldn't change the caller's parameter anyway. Just curious.

Because nr_mfns is used to flush the TLBs. In the original I made the 
mistake to decrement the variable and only discovered later on when the 
TLB contained the wrong entry.

Such bug tends to be very subtle and it is hard to find the root cause. 
So better mark the variable const to avoid any surprise.

The short version of what I wrote is in the commit message. I can write 
a small comment in the code if you want.

>>                            unsigned int flags)
>>   {
>>       int rc = 0;
>> -    unsigned long addr = virt, addr_end = addr + nr_mfns * PAGE_SIZE;
>> +    unsigned long vfn = virt >> PAGE_SHIFT;
>> +    unsigned long left = nr_mfns;
>>   
>>       /*
>>        * For arm32, page-tables are different on each CPUs. Yet, they share
>> @@ -1268,14 +1330,24 @@ static int xen_pt_update(unsigned long virt,
>>   
>>       spin_lock(&xen_pt_lock);
>>   
>> -    for ( ; addr < addr_end; addr += PAGE_SIZE )
>> +    while ( left )
>>       {
>> -        rc = xen_pt_update_entry(root, addr, mfn, flags);
>> +        unsigned int order, level;
>> +
>> +        level = xen_pt_mapping_level(vfn, mfn, left, flags);
>> +        order = XEN_PT_LEVEL_ORDER(level);
>> +
>> +        ASSERT(left >= BIT(order, UL));
>> +
>> +        rc = xen_pt_update_entry(root, pfn_to_paddr(vfn), mfn, level, flags);
> 
> NIT: I know we don't have vfn_to_vaddr at the moment and there is no
> widespread usage of vfn in Xen anyway, but it looks off to use
> pfn_to_paddr on a vfn parameter. Maybe open-code pfn_to_paddr instead?
> Or introduce vfn_to_vaddr locally in this file?

To avoid inconsistency with mfn_to_maddr() and gfn_to_gaddr(), I don't 
want ot introduce vfn_to_vaddr() withtout the typesafe part. I think 
this is a bit over the top for now.

So I will open-code pfn_to_paddr().

Cheers,

-- 
Julien Grall

