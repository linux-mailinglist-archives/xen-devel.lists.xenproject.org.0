Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E311A330E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 13:17:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMVBC-0004Xi-0F; Thu, 09 Apr 2020 11:17:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jMVBA-0004Xd-PM
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 11:17:04 +0000
X-Inumbo-ID: a3c5d7a0-7a53-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3c5d7a0-7a53-11ea-b4f4-bc764e2007e4;
 Thu, 09 Apr 2020 11:17:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 76887ADBE;
 Thu,  9 Apr 2020 11:17:02 +0000 (UTC)
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200406105703.79201-1-roger.pau@citrix.com>
 <20200406105703.79201-2-roger.pau@citrix.com>
 <9c7ec98b-bd2d-4fbf-530a-2164dbbee200@suse.com>
 <20200408151055.GB28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <00c10f30-5502-2b43-b394-efa8137cf264@suse.com>
Date: Thu, 9 Apr 2020 13:16:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200408151055.GB28601@Air-de-Roger>
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

On 08.04.2020 17:10, Roger Pau Monné wrote:
> On Wed, Apr 08, 2020 at 01:25:14PM +0200, Jan Beulich wrote:
>> On 06.04.2020 12:57, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/mm/paging.c
>>> +++ b/xen/arch/x86/mm/paging.c
>>> @@ -613,7 +613,8 @@ void paging_log_dirty_range(struct domain *d,
>>>  
>>>      p2m_unlock(p2m);
>>>  
>>> -    flush_tlb_mask(d->dirty_cpumask);
>>> +    flush_mask(d->dirty_cpumask, (!hap_enabled(d) ? FLUSH_TLB : 0) |
>>> +                                 FLUSH_HVM_ASID_CORE);
>>
>> In cases where one case is assumed to be more likely than the other
>> putting the more likely one first can be viewed as a mild hint to
>> the compiler, and hence an extra ! may be warranted in an if() or
>> a conditional expression. Here, however, I don't think we can
>> really consider one case more likely than the other, and hence I'd
>> suggest to avoid the !, flipping the other two expressions
>> accordingly. I may take the liberty to adjust this while committing
>> (if I'm to be the one).
> 
> That's fine, thanks. Somehow '!hap -> flush' was clearer in my mind.

Thinking about it with the other HVM-related changes in v9, shouldn't
this then be

    flush_mask(d->dirty_cpumask, (hap_enabled(d) ? 0 : FLUSH_TLB) |
                                 (is_hvm_domain(d) ? FLUSH_HVM_ASID_CORE : 0));

Or wait - the only caller lives in hap.c. As a result the FLUSH_TLB
part can be dropped altogether. And I question the need of flushing
guest TLBs - this is purely a p2m operation. I'll go look at the
history of this function, but for now I think the call should be
dropped (albeit then maybe better in a separate patch).

Jan

