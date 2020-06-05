Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4141EFAC8
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 16:20:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhDD2-0000gI-32; Fri, 05 Jun 2020 14:20:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jhDD1-0000cI-9V
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 14:20:35 +0000
X-Inumbo-ID: b7f029e0-a737-11ea-9ad7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7f029e0-a737-11ea-9ad7-bc764e2007e4;
 Fri, 05 Jun 2020 14:20:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AEAD6AECE;
 Fri,  5 Jun 2020 14:20:36 +0000 (UTC)
Subject: Re: [PATCH for-4.14] x86/rtc: provide mediated access to RTC for PVH
 dom0
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200605075006.51238-1-roger.pau@citrix.com>
 <ac523b3f-cc96-e63e-732c-2aa7ac3eac59@suse.com>
 <20200605092035.GL1195@Air-de-Roger>
 <e88b3427-dfbb-d244-e3cd-1fb57187dec4@suse.com>
 <20200605141636.GN1195@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e8ee25bd-0120-8de7-3f16-08ef73c05deb@suse.com>
Date: Fri, 5 Jun 2020 16:20:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200605141636.GN1195@Air-de-Roger>
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

On 05.06.2020 16:16, Roger Pau Monné wrote:
> On Fri, Jun 05, 2020 at 12:05:12PM +0200, Jan Beulich wrote:
>> On 05.06.2020 11:20, Roger Pau Monné wrote:
>>> On Fri, Jun 05, 2020 at 10:48:48AM +0200, Jan Beulich wrote:
>>>> On 05.06.2020 09:50, Roger Pau Monne wrote:
>>>>> This patch provides such mediated access to the
>>>>> RTC for PVH dom0, just like it's provided for a classic PV dom0.
>>>>>
>>>>> Instead of re-using the PV paths implement such handler together with
>>>>> the vRTC code for HVM, so that calling rtc_init will setup the
>>>>> appropriate handlers for all HVM based guests.
>>>>
>>>> Hooking this into rtc_init() makes sense as long as it's really
>>>> just the RTC. Looking at the PV code you're cloning from, I
>>>> wonder though whether pv_pit_handler() should also regain callers
>>>> for PVH. As it stands the function is called for PV only, yet was
>>>> deliberately put/kept outside of pv/.
>>>
>>> IIRC pv_pit_handler was also used by PVHv1 dom0, but we decided to not
>>> enable it for PVHv2 because no one really knew why the PIT was
>>> actually needed for by dom0.
>>
>> I think the reason PV Dom0 has it applies to PVH Dom0 as well:
>> At least back at the time there were video BIOSes needing this.
>> As it now turns out to have been a mistake to not enable the
>> RTC handling for v2, I would still think it would be better to
>> enable the PIT logic as well there, just to be on the safe side.
> 
> I have to admit I haven't used video output very much with PVH, I've
> had reports of people having success with it, but I have no idea how
> many failures there might be.
> 
> Enabling the PIT for PVH dom0 is mostly a matter of adding
> XEN_X86_EMU_PIT to the emulation flags, like it's currently done for
> PV dom0.
> 
> There's going to be a slight issue though, which is that the PIT will
> try to inject the interrupts using the PIC IRQ0, and thus would either
> need to also enable the PIC, or to instead set the timer source to
> PTSRC_ioapic instead of PTSRC_isa and use GSI 0. I haven't actually
> tried whether this would work, but seems better than enabling the PIC.

But what we do for PV Dom0 doesn't go as far as injecting IRQs (let
alone IRQ0). It's just the few port accesses that we allow them to
make (successfully, i.e. seeing the relevant bare hardware bits).

Jan

