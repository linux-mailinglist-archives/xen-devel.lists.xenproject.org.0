Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0F420B235
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 15:11:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joo8Q-0001Xx-DQ; Fri, 26 Jun 2020 13:11:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1joo8O-0001Xr-Td
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 13:11:12 +0000
X-Inumbo-ID: 81c5d716-b7ae-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81c5d716-b7ae-11ea-b7bb-bc764e2007e4;
 Fri, 26 Jun 2020 13:11:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 35D0FAC85;
 Fri, 26 Jun 2020 13:11:11 +0000 (UTC)
Subject: Re: [PATCH for-4.14 v3] x86/tlb: fix assisted flush usage
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, paul@xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200625113041.81507-1-roger.pau@citrix.com>
 <551387c6-f45d-bf6c-a41e-b0920425db9f@xen.org>
 <20200626100745.GB735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5586cae5-8929-0c53-7a35-5dd6116c77c2@suse.com>
Date: Fri, 26 Jun 2020 15:11:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626100745.GB735@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.06.2020 12:07, Roger Pau Monné wrote:
> On Fri, Jun 26, 2020 at 10:38:11AM +0100, Julien Grall wrote:
>> Hi Roger,
>>
>> Sorry I didn't manage to answer to your question before you sent v3.
>>
>> On 25/06/2020 12:30, Roger Pau Monne wrote:
>>> diff --git a/xen/include/asm-arm/flushtlb.h b/xen/include/asm-arm/flushtlb.h
>>> index ab1aae5c90..7ae0543885 100644
>>> --- a/xen/include/asm-arm/flushtlb.h
>>> +++ b/xen/include/asm-arm/flushtlb.h
>>> @@ -27,6 +27,7 @@ static inline void page_set_tlbflush_timestamp(struct page_info *page)
>>>   /* Flush specified CPUs' TLBs */
>>>   void flush_tlb_mask(const cpumask_t *mask);
>>> +#define flush_tlb_mask_sync flush_tlb_mask
>>
>> Dropping the parameter 'sync' from filtered_flush_tlb_mask() is a nice
>> improvement, but it unfortunately doesn't fully address my concern.
>>
>> After this patch there is exactly one use of flush_tlb_mask() in common code
>> (see grant_table.c). But without looking at the x86 code, it is not clear
>> why this requires a different flush compare to the two other sites.
> 
> It's not dealing with page allocation or page type changes directly,
> and hence doesn't need to use an IPI in order to prevent races with
> spurious_page_fault.
> 
>> IOW, if I want to modify the common code in the future, how do I know which
>> flush to call?
> 
> Unless you modify one of the specific areas mentioned above (page
> allocation or page type changes) you should use flush_tlb_mask.
> 
> This is not ideal, and my aim will be to be able to use the assisted
> flush everywhere if possible, so I would really like to get rid of the
> interrupt disabling done in spurious_page_fault and this model where
> x86 relies on blocking interrupts in order to prevent page type
> changes or page freeing.
> 
> Such change however doesn't feel appropriate for a release freeze
> period, and hence went with something smaller that restores the
> previous behavior. Another option is to just disable assisted flushes
> for the time being and re-enable them when a suitable solution is
> found.

As I can understand Julien's concern, maybe this would indeed be
the better approach for now? Andrew, Paul - thoughts?

Jan

