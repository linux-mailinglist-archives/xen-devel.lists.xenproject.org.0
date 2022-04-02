Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1424F04FB
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 18:39:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297827.507354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naglj-0008Iu-Cj; Sat, 02 Apr 2022 16:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297827.507354; Sat, 02 Apr 2022 16:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naglj-0008H5-9Z; Sat, 02 Apr 2022 16:38:31 +0000
Received: by outflank-mailman (input) for mailman id 297827;
 Sat, 02 Apr 2022 16:38:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1naglh-0008Gz-R6
 for xen-devel@lists.xenproject.org; Sat, 02 Apr 2022 16:38:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naglh-0005pe-HX; Sat, 02 Apr 2022 16:38:29 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naglh-0001aW-Bq; Sat, 02 Apr 2022 16:38:29 +0000
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
	bh=oyyXIXR5axftpVf5r5+t111n3XZTLePxzNPxaWkq4bs=; b=G+97kY7C+QIhdzeyQhyapcAbhG
	k+NdB2Yu//wrp4q6DMJLIOWw34CG5x+zrzmlp5hZQGpx1oV47KLS9Lb3+EEdQKIauj7zptLUgMYKj
	vIU+IixddO4kn58QA4NJJcT8N9wGA13FRaO45xji48B0GTiAe36NVB1VpsgxLGM7HFHU=;
Message-ID: <f0d3ed02-450f-9bd1-e8ab-5594234a835d@xen.org>
Date: Sat, 2 Apr 2022 17:38:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-7-julien@xen.org>
 <alpine.DEB.2.22.394.2204011657080.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 06/19] xen/arm: mm: Avoid flushing the TLBs when
 mapping are inserted
In-Reply-To: <alpine.DEB.2.22.394.2204011657080.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 02/04/2022 01:00, Stefano Stabellini wrote:
> On Mon, 21 Feb 2022, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Currently, the function xen_pt_update() will flush the TLBs even when
>> the mappings are inserted. This is a bit wasteful because we don't
>> allow mapping replacement. Even if we were, the flush would need to
>> happen earlier because mapping replacement should use Break-Before-Make
>> when updating the entry.
>>
>> A single call to xen_pt_update() can perform a single action. IOW, it
>> is not possible to, for instance, mix inserting and removing mappings.
>> Therefore, we can use `flags` to determine what action is performed.
>>
>> This change will be particularly help to limit the impact of switching
>> boot time mapping to use xen_pt_update().
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>      Changes in v2:
>>          - New patch
>> ---
>>   xen/arch/arm/mm.c | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index fd16c1541ce2..7b4b9de8693e 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -1104,7 +1104,13 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int level,
>>           /* We should be here with a valid MFN. */
>>           ASSERT(!mfn_eq(mfn, INVALID_MFN));
>>   
>> -        /* We don't allow replacing any valid entry. */
>> +        /*
>> +         * We don't allow replacing any valid entry.
>> +         *
>> +         * Note that the function xen_pt_update() relies on this
>> +         * assumption and will skip the TLB flush. The function will need
>> +         * to be updated if the check is relaxed.
>> +         */
>>           if ( lpae_is_valid(entry) )
>>           {
>>               if ( lpae_is_mapping(entry, level) )
>> @@ -1417,11 +1423,16 @@ static int xen_pt_update(unsigned long virt,
>>       }
>>   
>>       /*
>> -     * Flush the TLBs even in case of failure because we may have
>> +     * The TLBs flush can be safely skipped when a mapping is inserted
>> +     * as we don't allow mapping replacement (see xen_pt_check_entry()).
>> +     *
>> +     * For all the other cases, the TLBs will be flushed unconditionally
>> +     * even if the mapping has failed. This is because we may have
>>        * partially modified the PT. This will prevent any unexpected
>>        * behavior afterwards.
>>        */
>> -    flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
>> +    if ( !(flags & _PAGE_PRESENT) || mfn_eq(mfn, INVALID_MFN) )
>> +        flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
> 
> I am trying to think of a care where the following wouldn't be enough
> but I cannot come up with one:
> 
>     if ( mfn_eq(mfn, INVALID_MFN) )
>         flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);

_PAGE_PRESENT is not set for two cases: when removing a page or 
populating page-tables for a region. Both of them will expect an 
INVALID_MFN (see the two asserts in xen_pt_check_entry()).

Therefore your solution should work. However, technically the 'mfn' is 
ignored in both situation (hence why this is an ASSERT() rather than a 
prod check).

Also, I feel it is better to flush more than less (missing a flush could 
have catastrophic result). So I chose to be explicit in which case the 
flush can be skipped.

Maybe it would be clearer if I write:

  !((flags & _PAGE_PRESENT) && !mfn_eq(mfn, INVALID_MFN))

Cheers,

-- 
Julien Grall

