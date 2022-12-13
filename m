Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5BD64C042
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 00:08:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461480.719576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5ENU-0004vt-6n; Tue, 13 Dec 2022 23:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461480.719576; Tue, 13 Dec 2022 23:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5ENU-0004u4-2e; Tue, 13 Dec 2022 23:08:00 +0000
Received: by outflank-mailman (input) for mailman id 461480;
 Tue, 13 Dec 2022 23:07:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5ENS-0004tw-7e
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 23:07:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5ENR-00069y-Kf; Tue, 13 Dec 2022 23:07:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5ENR-0004iQ-Fa; Tue, 13 Dec 2022 23:07:57 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=DdR432rU1drkysnE7/E+qi6MeP6q9kiJU/Opxjz1jgE=; b=nwV0m6uWsUzfTHTFMFc7CPHSV8
	SE54i3lMZc6VVmiQH+YhzH9lnQZwCF3WYbt06wf76LyWaUDmy3Oxrle78XJ9LONiZzCAF8sMqp+H/
	grlTRGCsqRrQi2jBmiZXBtL8qzjjSkmdDH7VdtHXmW6U6DqoNaAOIWL2xRyXY+O6il1s=;
Message-ID: <dd6a05d5-5c3d-7a65-9951-b9c0aabadc81@xen.org>
Date: Tue, 13 Dec 2022 23:07:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC 3/4] Add xen superpage splitting support to arm
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 "Smith, Jackson" <rsmith@riversideresearch.org>
Cc: "Brookes, Scott" <sbrookes@riversideresearch.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <BN0P110MB1642CCC518921DC7F2BB3BB3CFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <c8f9e15a-81d1-ef8c-0baf-1758e7d89eee@xen.org> <Y5j5/qinMwxizxMc@itl-email>
From: Julien Grall <julien@xen.org>
In-Reply-To: <Y5j5/qinMwxizxMc@itl-email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Demi,

On 13/12/2022 22:17, Demi Marie Obenour wrote:
> On Tue, Dec 13, 2022 at 09:15:49PM +0000, Julien Grall wrote:
>> Hi,
>>
>> On 13/12/2022 19:54, Smith, Jackson wrote:
>>> Updates xen_pt_update_entry function from xen/arch/arm/mm.c to
>>> automatically split superpages as needed.
>> Your signed-off-by is missing.
>>
>>> ---
>>>    xen/arch/arm/mm.c | 91 +++++++++++++++++++++++++++++++++++++++++++++++--------
>>>    1 file changed, 78 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>>> index 6301752..91b9c2b 100644
>>> --- a/xen/arch/arm/mm.c
>>> +++ b/xen/arch/arm/mm.c
>>> @@ -753,8 +753,78 @@ static int create_xen_table(lpae_t *entry)
>>>    }
>>>    #define XEN_TABLE_MAP_FAILED 0
>>> -#define XEN_TABLE_SUPER_PAGE 1
>>> -#define XEN_TABLE_NORMAL_PAGE 2
>>> +#define XEN_TABLE_NORMAL_PAGE 1
>>> +
>>> +/* More or less taken from p2m_split_superpage, without the p2m stuff */
>>> +static bool xen_split_superpage(lpae_t *entry, unsigned int level,
>>> +                                unsigned int target, const unsigned int *offsets)
>>> +{
>>> +    struct page_info *page;
>>> +    lpae_t pte, *table;
>>> +    unsigned int i;
>>> +    bool rv = true;
>>> +
>>> +    mfn_t mfn = lpae_get_mfn(*entry);
>>> +    unsigned int next_level = level + 1;
>>> +    unsigned int level_order = XEN_PT_LEVEL_ORDER(next_level);
>>> +
>>> +    ASSERT(level < target);
>>> +    ASSERT(lpae_is_superpage(*entry, level));
>>> +
>>> +    page = alloc_domheap_page(NULL, 0);
>> Page-table may be allocated from the boot allocator. So you want to use
>> create_xen_table().
>>
>>> +    if ( !page )
>>> +        return false;
>>> +
>>> +    table = __map_domain_page(page);
>>
>> You want to use xen_map_table().
>>
>>> +
>>> +    /*
>>> +     * We are either splitting a first level 1G page into 512 second level
>>> +     * 2M pages, or a second level 2M page into 512 third level 4K pages.
>>> +     */
>>> +    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
>>> +    {
>>> +        lpae_t *new_entry = table + i;
>>> +
>>> +        /*
>>> +         * Use the content of the superpage entry and override
>>> +         * the necessary fields. So the correct permission are kept.
>>> +         */
>>> +        pte = *entry;
>>> +        lpae_set_mfn(pte, mfn_add(mfn, i << level_order));
>>> +
>>> +        /*
>>> +         * First and second level pages set walk.table = 0, but third
>>> +         * level entries set walk.table = 1.
>>> +         */
>>> +        pte.walk.table = (next_level == 3);
>>> +
>>> +        write_pte(new_entry, pte);
>>> +    }
>>> +
>>> +    /*
>>> +     * Shatter superpage in the page to the level we want to make the
>>> +     * changes.
>>> +     * This is done outside the loop to avoid checking the offset to
>>> +     * know whether the entry should be shattered for every entry.
>>> +     */
>>> +    if ( next_level != target )
>>> +        rv = xen_split_superpage(table + offsets[next_level],
>>> +                                 level + 1, target, offsets);
>>> +
>>> +    clean_dcache_va_range(table, PAGE_SIZE);
>>
>> Cleaning the cache is not necessary. This is done in the P2M case because it
>> is shared with the IOMMU which may not support coherent access.
>>
>>> +    unmap_domain_page(table);
>>
>> This would be xen_map
>>
>>> +
>>> +    /*
>>> +     * Generate the entry for this new table we created,
>>> +     * and write it back in place of the superpage entry.
>>> +     */
>>
>> I am afraid this is not compliant with the Arm Arm. If you want to update
>> valid entry (e.g. shattering a superpage), then you need to follow the
>> break-before-make sequence. This means that:
>>    1. Replace the valid entry with an entry with an invalid one
>>    2. Flush the TLBs
>>    3. Write the new entry
>>
>> Those steps will make your code compliant but it also means that a virtual
>> address will be temporarily invalid so you could take a fault in the middle
>> of your split if your stack or the table was part of the region. The same
>> could happen for the other running CPUs but this is less problematic as they
>> could spin on the page-table lock.
> 
> Could this be worked around by writing the critical section in
> assembler? 

Everything is feasible. Is this worth it? I don't think so. There are 
way we can avoid the shattering at first by simply not mapping all the RAM.

> The assembler code would never access the stack and would
> run with interrupts disabled.  There could also be BUG() checks for
> attempting to shatter a PTE that was needed to access the PTE in
> question, though I suspect one can work around this with a temporary
> PTE.  That said, shattering large pages requires allocating memory,
> which might fail.  What happens if the allocation does fail?

If this is only done during boot, then I would argue you will want to 
crash Xen.

Cheers,

-- 
Julien Grall

