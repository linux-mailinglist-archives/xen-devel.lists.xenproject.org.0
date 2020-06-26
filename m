Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E53C20B301
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 15:59:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joos9-0005Rs-LI; Fri, 26 Jun 2020 13:58:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FAa2=AH=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1joos7-0005Rn-Uy
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 13:58:27 +0000
X-Inumbo-ID: 1bd7194a-b7b5-11ea-82bf-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bd7194a-b7b5-11ea-82bf-12813bfff9fa;
 Fri, 26 Jun 2020 13:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cmmX2V517G5NWSLWeeRRM3CDdNr+ggcg4bXhX6qGFLU=; b=j8y+xs0EXFMTbefCaxO1qYLVWl
 nMetC89gfStWYuzP6bTac24k53z76uLZ4pcc7E0f9SyYyyG8IRe+am8ttPfRha0YZWXxKRSSLyAxx
 IupQXou3alRzLhZ1i1LyhqupP1H2B34smzHvFQnTy9NnbAvzUlzmUbCPNGC/gwlMqlDE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1joos4-00052X-A2; Fri, 26 Jun 2020 13:58:24 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1joos4-0002v9-2w; Fri, 26 Jun 2020 13:58:24 +0000
Subject: Re: [PATCH for-4.14 v3] x86/tlb: fix assisted flush usage
To: paul@xen.org, 'Jan Beulich' <jbeulich@suse.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>
References: <20200625113041.81507-1-roger.pau@citrix.com>
 <551387c6-f45d-bf6c-a41e-b0920425db9f@xen.org>
 <20200626100745.GB735@Air-de-Roger>
 <5586cae5-8929-0c53-7a35-5dd6116c77c2@suse.com>
 <000b01d64bbc$a7822f30$f6868d90$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <e8ec0350-af43-70a4-568d-5f19ff93d84b@xen.org>
Date: Fri, 26 Jun 2020 14:58:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <000b01d64bbc$a7822f30$f6868d90$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 26/06/2020 14:21, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 26 June 2020 14:11
>> To: Roger Pau Monné <roger.pau@citrix.com>; paul@xen.org; Andrew Cooper <andrew.cooper3@citrix.com>
>> Cc: Julien Grall <julien@xen.org>; xen-devel@lists.xenproject.org; Wei Liu <wl@xen.org>; George Dunlap
>> <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH for-4.14 v3] x86/tlb: fix assisted flush usage
>>
>> On 26.06.2020 12:07, Roger Pau Monné wrote:
>>> On Fri, Jun 26, 2020 at 10:38:11AM +0100, Julien Grall wrote:
>>>> Hi Roger,
>>>>
>>>> Sorry I didn't manage to answer to your question before you sent v3.
>>>>
>>>> On 25/06/2020 12:30, Roger Pau Monne wrote:
>>>>> diff --git a/xen/include/asm-arm/flushtlb.h b/xen/include/asm-arm/flushtlb.h
>>>>> index ab1aae5c90..7ae0543885 100644
>>>>> --- a/xen/include/asm-arm/flushtlb.h
>>>>> +++ b/xen/include/asm-arm/flushtlb.h
>>>>> @@ -27,6 +27,7 @@ static inline void page_set_tlbflush_timestamp(struct page_info *page)
>>>>>    /* Flush specified CPUs' TLBs */
>>>>>    void flush_tlb_mask(const cpumask_t *mask);
>>>>> +#define flush_tlb_mask_sync flush_tlb_mask
>>>>
>>>> Dropping the parameter 'sync' from filtered_flush_tlb_mask() is a nice
>>>> improvement, but it unfortunately doesn't fully address my concern.
>>>>
>>>> After this patch there is exactly one use of flush_tlb_mask() in common code
>>>> (see grant_table.c). But without looking at the x86 code, it is not clear
>>>> why this requires a different flush compare to the two other sites.
>>>
>>> It's not dealing with page allocation or page type changes directly,
>>> and hence doesn't need to use an IPI in order to prevent races with
>>> spurious_page_fault.
>>>
>>>> IOW, if I want to modify the common code in the future, how do I know which
>>>> flush to call?
>>>
>>> Unless you modify one of the specific areas mentioned above (page
>>> allocation or page type changes) you should use flush_tlb_mask.
>>>
>>> This is not ideal, and my aim will be to be able to use the assisted
>>> flush everywhere if possible, so I would really like to get rid of the
>>> interrupt disabling done in spurious_page_fault and this model where
>>> x86 relies on blocking interrupts in order to prevent page type
>>> changes or page freeing.
>>>
>>> Such change however doesn't feel appropriate for a release freeze
>>> period, and hence went with something smaller that restores the
>>> previous behavior. Another option is to just disable assisted flushes
>>> for the time being and re-enable them when a suitable solution is
>>> found.
>>
>> As I can understand Julien's concern, maybe this would indeed be
>> the better approach for now? Andrew, Paul - thoughts?
>>
> 
> Julien's concern seems to be about long term usage whereas IIUC this patch does fix the issue at hand, so can we put this patch in now on the basis that Roger will do the re-work described after 4.14 (which I think will address Julien's concern)?
Bear in mind that while this may be properly fixed in the next release, 
the hack will stay forever in Xen 4.14.

While I understand that disabling assisted flush is going to have a 
performance impact, we also need to make sure the interface make senses.

 From a generic perspective, a TLB flush should have the exact same 
guarantee regardless where we call it in common/. So I would still 
strongly prefer if we have a single helper.

Is it possible to consider to replace all the flush_tlb_mask() in common 
code by arch_flush_tlb_mask()? On Arm, this would just be a rename. On 
x86, this would be an alias to flush_tlb_mask_sync()?

Cheers,

-- 
Julien Grall

