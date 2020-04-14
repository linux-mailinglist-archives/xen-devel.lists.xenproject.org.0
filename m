Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE791A77E0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 11:53:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOIFa-0002vO-Db; Tue, 14 Apr 2020 09:53:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOIFY-0002vI-UH
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 09:53:00 +0000
X-Inumbo-ID: b95b5960-7e35-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b95b5960-7e35-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 09:53:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 62149AF23;
 Tue, 14 Apr 2020 09:52:58 +0000 (UTC)
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200406105703.79201-1-roger.pau@citrix.com>
 <20200406105703.79201-2-roger.pau@citrix.com>
 <9c7ec98b-bd2d-4fbf-530a-2164dbbee200@suse.com>
 <20200408151055.GB28601@Air-de-Roger>
 <00c10f30-5502-2b43-b394-efa8137cf264@suse.com>
 <20200414080158.GD28601@Air-de-Roger>
 <106d7363-b341-f4a8-4771-589631c4690d@suse.com>
 <20200414093403.GG28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4e87caf4-019c-8a8b-7abf-9dae44b4683b@suse.com>
Date: Tue, 14 Apr 2020 11:52:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414093403.GG28601@Air-de-Roger>
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

On 14.04.2020 11:34, Roger Pau Monné wrote:
> On Tue, Apr 14, 2020 at 11:09:43AM +0200, Jan Beulich wrote:
>> On 14.04.2020 10:01, Roger Pau Monné wrote:
>>> On Thu, Apr 09, 2020 at 01:16:57PM +0200, Jan Beulich wrote:
>>>> On 08.04.2020 17:10, Roger Pau Monné wrote:
>>>>> On Wed, Apr 08, 2020 at 01:25:14PM +0200, Jan Beulich wrote:
>>>>>> On 06.04.2020 12:57, Roger Pau Monne wrote:
>>>>>>> --- a/xen/arch/x86/mm/paging.c
>>>>>>> +++ b/xen/arch/x86/mm/paging.c
>>>>>>> @@ -613,7 +613,8 @@ void paging_log_dirty_range(struct domain *d,
>>>>>>>  
>>>>>>>      p2m_unlock(p2m);
>>>>>>>  
>>>>>>> -    flush_tlb_mask(d->dirty_cpumask);
>>>>>>> +    flush_mask(d->dirty_cpumask, (!hap_enabled(d) ? FLUSH_TLB : 0) |
>>>>>>> +                                 FLUSH_HVM_ASID_CORE);
>>>>>>
>>>>>> In cases where one case is assumed to be more likely than the other
>>>>>> putting the more likely one first can be viewed as a mild hint to
>>>>>> the compiler, and hence an extra ! may be warranted in an if() or
>>>>>> a conditional expression. Here, however, I don't think we can
>>>>>> really consider one case more likely than the other, and hence I'd
>>>>>> suggest to avoid the !, flipping the other two expressions
>>>>>> accordingly. I may take the liberty to adjust this while committing
>>>>>> (if I'm to be the one).
>>>>>
>>>>> That's fine, thanks. Somehow '!hap -> flush' was clearer in my mind.
>>>>
>>>> Thinking about it with the other HVM-related changes in v9, shouldn't
>>>> this then be
>>>>
>>>>     flush_mask(d->dirty_cpumask, (hap_enabled(d) ? 0 : FLUSH_TLB) |
>>>>                                  (is_hvm_domain(d) ? FLUSH_HVM_ASID_CORE : 0));
>>>>
>>>> Or wait - the only caller lives in hap.c. As a result the FLUSH_TLB
>>>> part can be dropped altogether. And I question the need of flushing
>>>> guest TLBs - this is purely a p2m operation. I'll go look at the
>>>> history of this function, but for now I think the call should be
>>>> dropped (albeit then maybe better in a separate patch).
>>>
>>> The ASID flush needs to stay unless it's moved into p2m_pt_set_entry,
>>> as p2m_pt_set_entry itself doesn't perform any ASID flush and won't
>>> work correctly.
>>
>> Just like for said in the other reply sent a few minutes ago - yes
>> for NPT, but no for EPT.
> 
> It's not strictly wrong for EPT as it won't cause EPT domains to
> malfunction, it's just redundant.

Right - it's wrong just in the sense of being pointless extra
overhead.

>>> I think it's safe to remove the TLB flush, as the code is only called
>>> from HAP, and hence is not used by shadow (which is what would require
>>> a plain TLB flush). The placement of this function seems misleading to
>>> me, as it looks like it's used by both shadow and HAP. It might be
>>> better to move it to hap.c if it's only to be used by HAP code.
>>
>> Either placement has its problems, I think. The function is meant to
>> be a paging layer one, but is needed by HAP only right now. I'm
>> pondering whether to wrap it in #ifdef CONFIG_HVM (plus perhaps a
>> respective ASSERT_UNREACHABLE()).
> 
> IMO if a TLB flush is not performed here we should add an
> ASSERT_UNREACHABLE if called from a shadow mode domain, or else we
> risk someone trying to use it in shadow later without realizing it's
> missing a TLB flush.

This would be fine with me.

Jan

