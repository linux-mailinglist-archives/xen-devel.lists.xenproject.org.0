Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6140C1EF4F1
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 12:06:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh9E1-0006xS-Cz; Fri, 05 Jun 2020 10:05:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jh9Dz-0006xN-HQ
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 10:05:19 +0000
X-Inumbo-ID: 0efff0d6-a714-11ea-af92-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0efff0d6-a714-11ea-af92-12813bfff9fa;
 Fri, 05 Jun 2020 10:05:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DA86CAA6F;
 Fri,  5 Jun 2020 10:05:20 +0000 (UTC)
Subject: Re: [PATCH for-4.14] x86/rtc: provide mediated access to RTC for PVH
 dom0
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200605075006.51238-1-roger.pau@citrix.com>
 <ac523b3f-cc96-e63e-732c-2aa7ac3eac59@suse.com>
 <20200605092035.GL1195@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e88b3427-dfbb-d244-e3cd-1fb57187dec4@suse.com>
Date: Fri, 5 Jun 2020 12:05:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200605092035.GL1195@Air-de-Roger>
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.06.2020 11:20, Roger Pau Monné wrote:
> On Fri, Jun 05, 2020 at 10:48:48AM +0200, Jan Beulich wrote:
>> On 05.06.2020 09:50, Roger Pau Monne wrote:
>>> At some point (maybe PVHv1?) mediated access to the RTC was provided
>>> for PVH dom0 using the PV code paths (guest_io_{write/read}). At some
>>> point this code has been made PV specific and unhooked from the
>>> current PVH IO path.
>>
>> I don't suppose you've identified the commit which did? This would
>> help deciding whether / how far to backport such a change.
> 
> I've attempted to, but failed to find the exact commit. I guess it
> might have happened at ecaba067e1e433 when guest_io_{read/write} was
> moved into emul-priv-op.c and made PV specific, but that's just a hint.

Looks like it was never hooked up for PVHv2, and removed together
with a lot of other PVHv1 code by your 33e5c32559e1.

>>> This patch provides such mediated access to the
>>> RTC for PVH dom0, just like it's provided for a classic PV dom0.
>>>
>>> Instead of re-using the PV paths implement such handler together with
>>> the vRTC code for HVM, so that calling rtc_init will setup the
>>> appropriate handlers for all HVM based guests.
>>
>> Hooking this into rtc_init() makes sense as long as it's really
>> just the RTC. Looking at the PV code you're cloning from, I
>> wonder though whether pv_pit_handler() should also regain callers
>> for PVH. As it stands the function is called for PV only, yet was
>> deliberately put/kept outside of pv/.
> 
> IIRC pv_pit_handler was also used by PVHv1 dom0, but we decided to not
> enable it for PVHv2 because no one really knew why the PIT was
> actually needed for by dom0.

I think the reason PV Dom0 has it applies to PVH Dom0 as well:
At least back at the time there were video BIOSes needing this.
As it now turns out to have been a mistake to not enable the
RTC handling for v2, I would still think it would be better to
enable the PIT logic as well there, just to be on the safe side.

> I think it's in emul-i8524.c (outside of pv/) because it calls into
> static functions on that file that are also used by HVM
> (handle_pit_io)?

Ah, likely.

>>> --- a/xen/arch/x86/hvm/rtc.c
>>> +++ b/xen/arch/x86/hvm/rtc.c
>>> @@ -808,10 +808,79 @@ void rtc_reset(struct domain *d)
>>>      s->pt.source = PTSRC_isa;
>>>  }
>>>  
>>> +/* RTC mediator for HVM hardware domain. */
>>> +static unsigned int hw_read(unsigned int port)
>>> +{
>>> +    const struct domain *currd = current->domain;
>>> +    unsigned long flags;
>>> +    unsigned int data = 0;
>>> +
>>> +    switch ( port )
>>> +    {
>>> +    case RTC_PORT(0):
>>> +          data = currd->arch.cmos_idx;
>>> +          break;
>>> +
>>> +    case RTC_PORT(1):
>>> +          spin_lock_irqsave(&rtc_lock, flags);
>>> +          outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
>>> +          data = inb(RTC_PORT(1));
>>> +          spin_unlock_irqrestore(&rtc_lock, flags);
>>
>> Avoiding to clone the original code would also avoid omissions
>> like the ioports_access_permitted() calls you've dropped from
>> here as well as the write counterpart. This may seem redundant
>> as we never deny access right now, but should imo be there in
>> case we decide to do (e.g. on NO_CMOS_RTC systems).
>>
>> Actually, "never" wasn't quite right I think: Late-hwdom
>> creation will revoke access from dom0 and instead grant it to
>> the new hwdom. Without the check, dom0 would continue to be
>> able to access the RTC.
> 
> TBH I'm not sure late-hwdom switching from an initial PVH domain will
> work work very well, as we would already have to modify the vmcs/vmcb
> io_bitmap in order to convey the changes to the allowed IO port ranges
> which we don't do now.

FAOD: I didn't mean to suggest I believe this transition would
be working right now. But if someone wanted to make it work,
they shouldn't be put at risk to unknowingly leave the original
dom0 with more permissions than it's supposed to have.

Jan

