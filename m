Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B9D1AAC85
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 17:59:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOkRg-0002BX-OT; Wed, 15 Apr 2020 15:59:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOkRe-0002BS-R8
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 15:59:22 +0000
X-Inumbo-ID: 1218202c-7f32-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1218202c-7f32-11ea-b4f4-bc764e2007e4;
 Wed, 15 Apr 2020 15:59:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 477A0AC94;
 Wed, 15 Apr 2020 15:59:20 +0000 (UTC)
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200414075245.GC28601@Air-de-Roger>
 <92a4ff05-9dcf-1d50-b9b2-bde39c4e3e8d@suse.com>
 <20200414100213.GH28601@Air-de-Roger>
 <389afe02-1747-1583-e642-6e4025b402aa@suse.com>
 <20200414111911.GI28601@Air-de-Roger>
 <073512c9-6500-054c-c72c-1f468da6464c@suse.com>
 <20200414145337.GJ28601@Air-de-Roger>
 <fbc0dd00-6973-4003-ad34-591561b695c9@suse.com>
 <20200415144908.GM28601@Air-de-Roger>
 <93d41cd3-b24c-9b51-b15e-3b1e538bba5a@suse.com>
 <20200415155420.GN28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <63ba566b-3da9-c670-4496-9af2f9a6334c@suse.com>
Date: Wed, 15 Apr 2020 17:59:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415155420.GN28601@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.04.2020 17:54, Roger Pau Monné wrote:
> On Wed, Apr 15, 2020 at 05:42:20PM +0200, Jan Beulich wrote:
>> On 15.04.2020 16:49, Roger Pau Monné wrote:
>>> On Tue, Apr 14, 2020 at 05:06:23PM +0200, Jan Beulich wrote:
>>>> On 14.04.2020 16:53, Roger Pau Monné wrote:
>>>>> On Tue, Apr 14, 2020 at 03:50:15PM +0200, Jan Beulich wrote:
>>>>>> On 14.04.2020 13:19, Roger Pau Monné wrote:
>>>>>>> On Tue, Apr 14, 2020 at 12:13:04PM +0200, Jan Beulich wrote:
>>>>>>>> On 14.04.2020 12:02, Roger Pau Monné wrote:
>>>>>>>>> That seems nice, we would have to be careful however as reducing the
>>>>>>>>> number of ASID/VPID flushes could uncover issues in the existing code.
>>>>>>>>> I guess you mean something like:
>>>>>>>>>
>>>>>>>>> static inline void guest_flush_tlb_mask(const struct domain *d,
>>>>>>>>>                                         const cpumask_t *mask)
>>>>>>>>> {
>>>>>>>>>     flush_mask(mask, (is_pv_domain(d) || shadow_mode_enabled(d) ? FLUSH_TLB
>>>>>>>>>                                                                 : 0) |
>>>>>>>>>     		     (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE
>>>>>>>>> 		                                      : 0));
>>>>>>>>> }
>>>>>>>>
>>>>>>>> Almost - is_hvm_domain(d) && cpu_has_svm seems to wide for me. I'd
>>>>>>>> rather use hap_enabled() && cpu_has_svm, which effectively means NPT.
>>>>>>>> Or am I overlooking a need to do ASID flushes also in shadow mode?
>>>>>>>
>>>>>>> I think so, I've used is_hvm_domain in order to cover for HVM domains
>>>>>>> running in shadow mode on AMD hardware, I think those also need the
>>>>>>> ASID flushes.
>>>>>>
>>>>>> I'm unconvinced: The entire section "TLB Management" in the PM gives
>>>>>> the impression that "ordinary" TLB flushing covers all ASIDs anyway.
>>>>>> It's not stated anywhere (I could find) explicitly though.
>>>>>
>>>>> Hm, I don't think so. XenRT found a myriad of issues with NPT when p2m
>>>>> code wasn't modified to do ASID flushes instead of plain TLB flushes.
>>>>
>>>> Well, that's clear from e.g. p2m_pt_set_entry() not doing any
>>>> flushing itself.
>>>>
>>>>> Even if it's just to stay on the safe side I would perform ASID
>>>>> flushes for HVM guests with shadow running on AMD.
>>>>
>>>> Tim, any chance you could voice your thoughts here? To me it seems
>>>> odd to do an all-ASIDs flush followed by an ASID one.
>>>
>>> I've been reading a bit more into this, and section 15.16.1 states:
>>>
>>> "TLB flush operations must not be assumed to affect all ASIDs."
>>
>> That's the section talking about the tlb_control VMCB field. It is
>> in this context that the sentence needs to be interpreted, imo.
> 
> It explicitly mentions move-to-cr3 and move-to-cr4 before that phrase:
> 
> "TLB flush operations function identically whether or not SVM is
> enabled (e.g., MOV-TO-CR3 flushes non-global mappings, whereas
> MOV-TO-CR4 flushes global and non-global mappings). TLB flush
> operations must not be assumed to affect all ASIDs."

Hmm, indeed. How did I not spot this already when reading this the
other day?

> So my reading is that normal flush operations not involving
> tlb_control VMCB field should not assume to flush all ASIDs. Again
> this is of course my interpretation of the text in the PM. I will go
> with my suggested approach, which is safer and should cause no
> functional issues AFAICT. The only downside is the maybe redundant
> flush, but that's safe.

Okay. And I'm sorry for having attempted to mislead you.

Jan

