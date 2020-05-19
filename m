Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC071D93B3
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 11:45:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jayo4-0003iW-RJ; Tue, 19 May 2020 09:45:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jayo3-0003iK-Bq
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 09:45:03 +0000
X-Inumbo-ID: 69274883-99b5-11ea-a8eb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69274883-99b5-11ea-a8eb-12813bfff9fa;
 Tue, 19 May 2020 09:45:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3B0DFAD9F;
 Tue, 19 May 2020 09:45:04 +0000 (UTC)
Subject: Re: [PATCH v3 1/5] x86: suppress XPTI-related TLB flushes when
 possible
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <3ce4ab2c-8cb6-1482-6ce9-3d5b019e10c1@suse.com>
 <ae47cb2c-2fff-cd08-0a26-683cef1f3303@suse.com>
 <20200518170904.GY54375@Air-de-Roger>
 <748e3d53-779b-1529-73e8-37f3c2da6e57@suse.com>
 <20200519091532.GB54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <25c2a650-8745-19d7-34fc-28570d7dfd65@suse.com>
Date: Tue, 19 May 2020 11:45:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519091532.GB54375@Air-de-Roger>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.05.2020 11:15, Roger Pau Monné wrote:
> On Tue, May 19, 2020 at 09:55:38AM +0200, Jan Beulich wrote:
>> On 18.05.2020 19:09, Roger Pau Monné wrote:
>>> On Wed, Sep 25, 2019 at 05:23:11PM +0200, Jan Beulich wrote:
>>>> @@ -310,7 +313,16 @@ int pv_domain_initialise(struct domain *
>>>>      /* 64-bit PV guest by default. */
>>>>      d->arch.is_32bit_pv = d->arch.has_32bit_shinfo = 0;
>>>>  
>>>> -    d->arch.pv.xpti = is_hardware_domain(d) ? opt_xpti_hwdom : opt_xpti_domu;
>>>> +    if ( is_hardware_domain(d) && opt_xpti_hwdom )
>>>> +    {
>>>> +        d->arch.pv.xpti = true;
>>>> +        ++opt_xpti_hwdom;
>>>> +    }
>>>> +    if ( !is_hardware_domain(d) && opt_xpti_domu )
>>>> +    {
>>>> +        d->arch.pv.xpti = true;
>>>> +        opt_xpti_domu = 2;
>>>
>>> I wonder whether a store fence is needed here in order to guarantee
>>> that opt_xpti_domu is visible to flush_area_local before proceeding
>>> any further with domain creation.
>>
>> The changed behavior of flush_area_local() becomes relevant only
>> once the new domain runs. This being x86 code, the write can't
>> remain invisible for longer than the very latest when the function
>> returns, as the store can't be deferred past that (in reality it
>> can't be deferred even until after the next [real] function call
>> or the next barrier()). And due to x86'es cache coherent nature
>> (for WB memory) the moment the store insn completes the new value
>> is visible to all other CPUs.
> 
> Yes, I think it's fine because this is x86 specific code. A comment
> in that regard might be nice, but I'm not going to make this a strong
> request.
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I also think that turning opt_xpti_domu into a proper atomic and
> increasing/decreasing (maybe a cmpxg would be needed) upon PV domain
> creation/destruction should be able to accurately keep track of PV
> domUs and hence could be used to further reduce the flushes when no PV
> domains are running?

Possibly, which would take care of (c) in the reasons the commit
message gives. (a) and in particular (b) would then still need
addressing.

Jan

