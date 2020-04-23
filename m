Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0151B5A13
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 13:10:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRZkD-0006Tm-FU; Thu, 23 Apr 2020 11:10:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0dw1=6H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRZkC-0006Th-31
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 11:10:12 +0000
X-Inumbo-ID: ff834370-8552-11ea-9344-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff834370-8552-11ea-9344-12813bfff9fa;
 Thu, 23 Apr 2020 11:10:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AEB52B090;
 Thu, 23 Apr 2020 11:10:09 +0000 (UTC)
Subject: Re: [PATCH v10 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200416135909.16155-1-roger.pau@citrix.com>
 <20200416135909.16155-2-roger.pau@citrix.com>
 <20200422163338.GF28601@Air-de-Roger>
 <20200423103019.a43rnmub5jdszjhc@debian>
 <0a03deaa-5842-626a-b173-b9569f69f86c@suse.com>
 <20200423105744.GG28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <03db9d29-ccd3-a6f0-1dae-1cd4f61fab36@suse.com>
Date: Thu, 23 Apr 2020 13:10:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423105744.GG28601@Air-de-Roger>
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
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.04.2020 12:57, Roger Pau Monné wrote:
> On Thu, Apr 23, 2020 at 12:41:49PM +0200, Jan Beulich wrote:
>> On 23.04.2020 12:30, Wei Liu wrote:
>>> On Wed, Apr 22, 2020 at 06:33:38PM +0200, Roger Pau Monné wrote:
>>>> On Thu, Apr 16, 2020 at 03:59:07PM +0200, Roger Pau Monne wrote:
>>>>> @@ -254,3 +257,14 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
>>>>>  
>>>>>      return flags;
>>>>>  }
>>>>> +
>>>>> +void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask)
>>>>> +{
>>>>> +    unsigned int flags = (is_pv_domain(d) || paging_mode_shadow(d) ? FLUSH_TLB
>>>>> +                                                                   : 0) |
>>>>> +                         (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE
>>>>> +                                                          : 0);
>>>>
>>>> Maybe I'm getting confused, but I think the above is wrong and ASID
>>>> should _always_ be flushed when running a HVM domain in shadow mode
>>>> regardless of whether the underlying hw is Intel or AMD, ie:
>>>>
>>>> bool shadow = paging_mode_shadow(d);
>>>> unsigned int flags = (shadow ? FLUSH_TLB : 0) |
>>>>                      (is_hvm_domain(d) &&
>>>>                       (cpu_has_svm || shadow) ? FLUSH_HVM_ASID_CORE : 0);
>>>
>>> This sort of long expression is prone to error. See XSA-316.
>>
>> To be honest I consider it quite fine. XSA-316 was in particular
>> because of successive closing parentheses, of which there are
>> none here. (This isn't to say I would strictly mind splitting,
>> but I fear this would result in (multiple?) single use local
>> variables.)
> 
> Right now it's exactly (including the indentation):
> 
>     bool shadow = paging_mode_shadow(d);
> 
>     return (shadow ? FLUSH_TLB : 0) |
>            (is_hvm_domain(d) && (cpu_has_svm || shadow) ? FLUSH_HVM_ASID_CORE
>                                                         : 0);
> 
> I could change it to:
> 
>     bool shadow = paging_mode_shadow(d);
>     bool asid = is_hvm_domain(d) && (cpu_has_svm || shadow);
> 
>     return (shadow ? FLUSH_TLB : 0) | (asid ? FLUSH_HVM_ASID_CORE : 0);
> 
> But would result in a single use asid local variable.
> 
> I think XSA-316 was slightly different because the issue arose from
> assigning and comparing a variable inside of an if condition, which is
> not the case here. I however don't mind changing it if it's regarded
> as potentially insecure, or hard to read.

I'd be okay to ack either, but would still somewhat prefer the original
variant.

Jan

