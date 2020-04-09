Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D4E1A309F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 10:07:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMSDF-0005AQ-Lp; Thu, 09 Apr 2020 08:07:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jMSDD-0005AL-RP
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 08:06:59 +0000
X-Inumbo-ID: 1570fc38-7a39-11ea-8298-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1570fc38-7a39-11ea-8298-12813bfff9fa;
 Thu, 09 Apr 2020 08:06:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 84EC2ACA4;
 Thu,  9 Apr 2020 08:06:56 +0000 (UTC)
Subject: Re: [PATCH 6/7] xen/guest_access: Consolidate guest access helpers in
 xen/guest_access.h
To: Julien Grall <julien@xen.org>
References: <20200404131017.27330-1-julien@xen.org>
 <20200404131017.27330-7-julien@xen.org>
 <e2588f6e-1f13-b66f-8e3d-b8568f67b62a@suse.com>
 <041a9f9f-cc9e-eac5-cdd2-555fb1c88e6f@xen.org>
 <cf6c0e0b-ade0-587f-ea0e-80b02b21b1a9@suse.com>
 <c8e66108-7ac1-fb51-841f-21886b731f04@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f02f09ec-b643-8321-e235-ce0ee5526ab3@suse.com>
Date: Thu, 9 Apr 2020 10:06:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <c8e66108-7ac1-fb51-841f-21886b731f04@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.04.2020 10:01, Julien Grall wrote:
> Hi,
> 
> On 09/04/2020 07:30, Jan Beulich wrote:
>> On 09.04.2020 00:05, Julien Grall wrote:
>>> Hi Jan,
>>>
>>> On 07/04/2020 09:14, Jan Beulich wrote:
>>>> On 04.04.2020 15:10, Julien Grall wrote:
>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>
>>>>> Most of the helpers to access guest memory are implemented the same way
>>>>> on Arm and x86. The only differences are:
>>>>>       - guest_handle_{from, to}_param(): while on x86 XEN_GUEST_HANDLE()
>>>>>         and XEN_GUEST_HANDLE_PARAM() are the same, they are not on Arm. It
>>>>>         is still fine to use the Arm implementation on x86.
>>>>>       - __clear_guest_offset(): Interestingly the prototype does not match
>>>>>         between the x86 and Arm. However, the Arm one is bogus. So the x86
>>>>>         implementation can be used.
>>>>>       - guest_handle{,_subrange}_okay(): They are validly differing
>>>>>         because Arm is only supporting auto-translated guest and therefore
>>>>>         handles are always valid.
>>>>
>>>> While I'm fine in principle with such consolidation, I'm afraid I
>>>> really need to ask for some historical background to be added
>>>> here. It may very well be that there's a reason for the separation
>>>> (likely to be found in the removed ia64 or ppc ports), which may
>>>> then provide a hint at why future ports may want to have these
>>>> separated. If such reasons exist, I'd prefer to avoid the back and
>>>> forth between headers. What we could do in such a case is borrow
>>>> Linux'es asm-generic/ concept, and move the "typical"
>>>> implementation there. (And of course if there were no noticable
>>>> reasons for the split, the change as it is would be fine in
>>>> general; saying so without having looked at the details of it,
>>>> yet).
>>>
>>> Looking at the history, ia64 and ppc used to include a common
>>> header called xen/xencomm.h from asm/guest_access.h.
>>>
>>> This has now disappeared with the removal of the two ports.
>>>
>>> Regarding future arch, the fact arm and x86 gives me some confidence
>>> we are unlikely going to get a new ABI for an arch. Do you see any
>>> reason to?
>>
>> Well, there surely had be a reason for ia64 and ppc to use a
>> different approach. 
> 
> This was introduced way before my time in Xen. AFAICT, you were
> already part of the community when 'xencomm' were alive.

I was, but I was never actively involved in ia64 or ppc work.

> There are not much information about it only nor in the commits.
> So do you mind sharing a bit more what 'xencomm' meant to be
> and why it wasn't introduced on x86?

If I had details, I would have provided at least some hints already.

>> I don't see why a new port may not also want
>> to go that route instead of the x86/Arm one.
> I could accept that someone would want to reinvent a new ABI
> from scratch for just an hypothetical new arch. However it would
> be quite an effort to reinvent XEN_GUEST_HANDLE(). The chance is
> RISC-V is only going to re-use what Arm did as Arm already did
> with x86.
> 
> I would like to avoid to introduce a new directory asm-generic
> with just one header in it. Maybe you have some other headers in
> mind?

I recall having wondered a few times whether we shouldn't use this
concept elsewhere. One case iirc was bitops stuff. Looking over
the Linux ones, some atomic and barrier fallback implementations
may also sensibly live there, and there are likely more.

Jan

