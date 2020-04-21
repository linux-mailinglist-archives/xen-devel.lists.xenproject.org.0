Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E731B26F6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 14:59:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQsUd-0003ri-0s; Tue, 21 Apr 2020 12:59:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQsUb-0003rd-Q5
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 12:59:13 +0000
X-Inumbo-ID: e5e73a18-83cf-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5e73a18-83cf-11ea-b4f4-bc764e2007e4;
 Tue, 21 Apr 2020 12:59:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6DA30ABE7;
 Tue, 21 Apr 2020 12:59:11 +0000 (UTC)
Subject: Re: [PATCH v10 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200416135909.16155-1-roger.pau@citrix.com>
 <20200416135909.16155-2-roger.pau@citrix.com>
 <80288e76-aff6-61d5-71aa-ae7c8e9d9a65@suse.com>
 <20200421104335.GU28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <21abc8e6-5665-9d6f-395f-6e4eb8bf2e58@suse.com>
Date: Tue, 21 Apr 2020 14:59:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421104335.GU28601@Air-de-Roger>
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

On 21.04.2020 12:43, Roger Pau Monné wrote:
> On Tue, Apr 21, 2020 at 12:21:12PM +0200, Jan Beulich wrote:
>> On 16.04.2020 15:59, Roger Pau Monne wrote:
>>> Introduce a specific flag to request a HVM guest linear TLB flush,
>>> which is an ASID/VPID tickle that forces a guest linear to guest
>>> physical TLB flush for all HVM guests.
>>>
>>> This was previously unconditionally done in each pre_flush call, but
>>> that's not required: HVM guests not using shadow don't require linear
>>> TLB flushes as Xen doesn't modify the guest page tables in that case
>>> (ie: when using HAP).
>>
>> I'm afraid I'm being confused by this: Even in shadow mode Xen
>> doesn't modify guest page tables, does it?
> 
> I'm also confused now. It's my understand that when running in shadow
> mode guest page tables are not actually used, and the guest uses Xen's
> crafted shadow tables instead, which are based on the original guest
> page tables suitably adjusted by Xen in order to do the p2m
> translation in the HVM case, or the needed PTE adjustments in the PV
> case.
> 
> So guest page tables are not modified, but are also not used as they
> are never loaded into cr3.

This matches my understanding.

>>> @@ -254,3 +257,14 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
>>>  
>>>      return flags;
>>>  }
>>> +
>>> +void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask)
>>> +{
>>> +    unsigned int flags = (is_pv_domain(d) || paging_mode_shadow(d) ? FLUSH_TLB
>>> +                                                                   : 0) |
>>> +                         (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE
>>> +                                                          : 0);
>>
>> Why the is_pv_domain() part of the condition? Afaict for PV
>> domains you can get here only if they have shadow mode enabled.
> 
> Right now yes, the only way to get here for PV domains is when using
> shadow, but if this helper gets used in other non-shadow PV paths then
> Xen's needs to do a TLB flush.

Why would a non-shdow PV path find a need to call this function?

Jan

