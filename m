Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7266D1AAC17
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 17:42:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOkBL-0000yj-JB; Wed, 15 Apr 2020 15:42:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOkBJ-0000ye-B9
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 15:42:29 +0000
X-Inumbo-ID: b58a73a4-7f2f-11ea-8a87-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b58a73a4-7f2f-11ea-8a87-12813bfff9fa;
 Wed, 15 Apr 2020 15:42:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 55E20ABCF;
 Wed, 15 Apr 2020 15:42:26 +0000 (UTC)
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200406105703.79201-2-roger.pau@citrix.com>
 <30062a0c-6587-a16e-2b31-de0dd6bf4c9a@suse.com>
 <20200414075245.GC28601@Air-de-Roger>
 <92a4ff05-9dcf-1d50-b9b2-bde39c4e3e8d@suse.com>
 <20200414100213.GH28601@Air-de-Roger>
 <389afe02-1747-1583-e642-6e4025b402aa@suse.com>
 <20200414111911.GI28601@Air-de-Roger>
 <073512c9-6500-054c-c72c-1f468da6464c@suse.com>
 <20200414145337.GJ28601@Air-de-Roger>
 <fbc0dd00-6973-4003-ad34-591561b695c9@suse.com>
 <20200415144908.GM28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <93d41cd3-b24c-9b51-b15e-3b1e538bba5a@suse.com>
Date: Wed, 15 Apr 2020 17:42:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415144908.GM28601@Air-de-Roger>
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

On 15.04.2020 16:49, Roger Pau Monné wrote:
> On Tue, Apr 14, 2020 at 05:06:23PM +0200, Jan Beulich wrote:
>> On 14.04.2020 16:53, Roger Pau Monné wrote:
>>> On Tue, Apr 14, 2020 at 03:50:15PM +0200, Jan Beulich wrote:
>>>> On 14.04.2020 13:19, Roger Pau Monné wrote:
>>>>> On Tue, Apr 14, 2020 at 12:13:04PM +0200, Jan Beulich wrote:
>>>>>> On 14.04.2020 12:02, Roger Pau Monné wrote:
>>>>>>> That seems nice, we would have to be careful however as reducing the
>>>>>>> number of ASID/VPID flushes could uncover issues in the existing code.
>>>>>>> I guess you mean something like:
>>>>>>>
>>>>>>> static inline void guest_flush_tlb_mask(const struct domain *d,
>>>>>>>                                         const cpumask_t *mask)
>>>>>>> {
>>>>>>>     flush_mask(mask, (is_pv_domain(d) || shadow_mode_enabled(d) ? FLUSH_TLB
>>>>>>>                                                                 : 0) |
>>>>>>>     		     (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE
>>>>>>> 		                                      : 0));
>>>>>>> }
>>>>>>
>>>>>> Almost - is_hvm_domain(d) && cpu_has_svm seems to wide for me. I'd
>>>>>> rather use hap_enabled() && cpu_has_svm, which effectively means NPT.
>>>>>> Or am I overlooking a need to do ASID flushes also in shadow mode?
>>>>>
>>>>> I think so, I've used is_hvm_domain in order to cover for HVM domains
>>>>> running in shadow mode on AMD hardware, I think those also need the
>>>>> ASID flushes.
>>>>
>>>> I'm unconvinced: The entire section "TLB Management" in the PM gives
>>>> the impression that "ordinary" TLB flushing covers all ASIDs anyway.
>>>> It's not stated anywhere (I could find) explicitly though.
>>>
>>> Hm, I don't think so. XenRT found a myriad of issues with NPT when p2m
>>> code wasn't modified to do ASID flushes instead of plain TLB flushes.
>>
>> Well, that's clear from e.g. p2m_pt_set_entry() not doing any
>> flushing itself.
>>
>>> Even if it's just to stay on the safe side I would perform ASID
>>> flushes for HVM guests with shadow running on AMD.
>>
>> Tim, any chance you could voice your thoughts here? To me it seems
>> odd to do an all-ASIDs flush followed by an ASID one.
> 
> I've been reading a bit more into this, and section 15.16.1 states:
> 
> "TLB flush operations must not be assumed to affect all ASIDs."

That's the section talking about the tlb_control VMCB field. It is
in this context that the sentence needs to be interpreted, imo.

Jan

