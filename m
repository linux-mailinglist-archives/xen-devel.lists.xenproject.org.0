Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7831A8143
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 17:06:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jON8x-00022d-Rj; Tue, 14 Apr 2020 15:06:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jON8w-00022Y-79
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 15:06:30 +0000
X-Inumbo-ID: 849003da-7e61-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 849003da-7e61-11ea-83d8-bc764e2007e4;
 Tue, 14 Apr 2020 15:06:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6E679ACCE;
 Tue, 14 Apr 2020 15:06:27 +0000 (UTC)
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <20200406105703.79201-1-roger.pau@citrix.com>
 <20200406105703.79201-2-roger.pau@citrix.com>
 <30062a0c-6587-a16e-2b31-de0dd6bf4c9a@suse.com>
 <20200414075245.GC28601@Air-de-Roger>
 <92a4ff05-9dcf-1d50-b9b2-bde39c4e3e8d@suse.com>
 <20200414100213.GH28601@Air-de-Roger>
 <389afe02-1747-1583-e642-6e4025b402aa@suse.com>
 <20200414111911.GI28601@Air-de-Roger>
 <073512c9-6500-054c-c72c-1f468da6464c@suse.com>
 <20200414145337.GJ28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fbc0dd00-6973-4003-ad34-591561b695c9@suse.com>
Date: Tue, 14 Apr 2020 17:06:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414145337.GJ28601@Air-de-Roger>
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.04.2020 16:53, Roger Pau Monné wrote:
> On Tue, Apr 14, 2020 at 03:50:15PM +0200, Jan Beulich wrote:
>> On 14.04.2020 13:19, Roger Pau Monné wrote:
>>> On Tue, Apr 14, 2020 at 12:13:04PM +0200, Jan Beulich wrote:
>>>> On 14.04.2020 12:02, Roger Pau Monné wrote:
>>>>> That seems nice, we would have to be careful however as reducing the
>>>>> number of ASID/VPID flushes could uncover issues in the existing code.
>>>>> I guess you mean something like:
>>>>>
>>>>> static inline void guest_flush_tlb_mask(const struct domain *d,
>>>>>                                         const cpumask_t *mask)
>>>>> {
>>>>>     flush_mask(mask, (is_pv_domain(d) || shadow_mode_enabled(d) ? FLUSH_TLB
>>>>>                                                                 : 0) |
>>>>>     		     (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE
>>>>> 		                                      : 0));
>>>>> }
>>>>
>>>> Almost - is_hvm_domain(d) && cpu_has_svm seems to wide for me. I'd
>>>> rather use hap_enabled() && cpu_has_svm, which effectively means NPT.
>>>> Or am I overlooking a need to do ASID flushes also in shadow mode?
>>>
>>> I think so, I've used is_hvm_domain in order to cover for HVM domains
>>> running in shadow mode on AMD hardware, I think those also need the
>>> ASID flushes.
>>
>> I'm unconvinced: The entire section "TLB Management" in the PM gives
>> the impression that "ordinary" TLB flushing covers all ASIDs anyway.
>> It's not stated anywhere (I could find) explicitly though.
> 
> Hm, I don't think so. XenRT found a myriad of issues with NPT when p2m
> code wasn't modified to do ASID flushes instead of plain TLB flushes.

Well, that's clear from e.g. p2m_pt_set_entry() not doing any
flushing itself.

> Even if it's just to stay on the safe side I would perform ASID
> flushes for HVM guests with shadow running on AMD.

Tim, any chance you could voice your thoughts here? To me it seems
odd to do an all-ASIDs flush followed by an ASID one.

>>>> Also I'd suggest to calculate the flags up front, to avoid calling
>>>> flush_mask() in the first place in case (EPT) neither bit is set.
>>>>
>>>>> I think this should work, but I would rather do it in a separate
>>>>> patch.
>>>>
>>>> Yes, just like the originally (wrongly, as you validly say) suggested
>>>> full removal of them, putting this in a separate patch would indeed
>>>> seem better.
>>>
>>> Would you like me to resend with the requested fix to
>>> paging_log_dirty_range (ie: drop the FLUSH_TLB and only call
>>> flush_mask for HAP guests running on AMD) then?
>>
>> Well, ideally I'd see that function also make use of the intended
>> new helper function, if at all possible (and suitable).
> 
> Oh, OK. Just to make sure I understand what you are asking for, you
> would like me to resend introducing the new guest_flush_tlb_mask
> helper and use it in the flush_tlb_mask callers modified by this
> patch?

Yes (and I now realize it may not make sense to split it off into a
separate change).

Jan

