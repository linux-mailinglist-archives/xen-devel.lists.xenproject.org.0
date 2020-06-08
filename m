Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0A01F147F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 10:30:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiDAf-0002wD-BN; Mon, 08 Jun 2020 08:30:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jiDAd-0002w8-UY
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 08:30:15 +0000
X-Inumbo-ID: 464f0270-a962-11ea-9b55-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 464f0270-a962-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 08:30:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE0D7ACED;
 Mon,  8 Jun 2020 08:30:16 +0000 (UTC)
Subject: Re: [PATCH for-4.14 v2] x86/rtc: provide mediated access to RTC for
 PVH dom0
To: Roman Shaposhnik <roman@zededa.com>
References: <20200605110240.52545-1-roger.pau@citrix.com>
 <CAMmSBy8=8tGwLgs+eMbrHcRbSahJHCpts7ODiK-cf-ZATfosxw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <971692d4-68ab-215a-0128-72f1f6d4fbc8@suse.com>
Date: Mon, 8 Jun 2020 10:30:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CAMmSBy8=8tGwLgs+eMbrHcRbSahJHCpts7ODiK-cf-ZATfosxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Paul Durrant <paul@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.06.2020 01:43, Roman Shaposhnik wrote:
> On Fri, Jun 5, 2020 at 4:03 AM Roger Pau Monne <roger.pau@citrix.com> wrote:
>>
>> Mediated access to the RTC was provided for PVHv1 dom0 using the PV
>> code paths (guest_io_{write/read}), but those accesses where never
>> implemented for PVHv2 dom0. This patch provides such mediated accesses
>> to the RTC for PVH dom0, just like it's provided for a classic PV
>> dom0.
>>
>> Pull out some of the RTC logic from guest_io_{read/write} into
>> specific helpers that can be used by both PV and HVM guests. The
>> setup of the handlers for PVH is done in rtc_init, which is already
>> used to initialize the fully emulated RTC.
>>
>> Without this a Linux PVH dom0 will read garbage when trying to access
>> the RTC, and one vCPU will be constantly looping in
>> rtc_timer_do_work.
>>
>> Note that such issue doesn't happen on domUs because the ACPI
>> NO_CMOS_RTC flag is set in FADT, which prevents the OS from accessing
>> the RTC. Also the X86_EMU_RTC flag is not set for PVH dom0, as the
>> accesses are not emulated but rather forwarded to the physical
>> hardware.
>>
>> No functional change expected for classic PV dom0.
> 
> For the dense guys like me: what is the user-visible feature that is now being
> offered with this? Would really appreciate a pointer or two.

PV Dom0 has always been permitted direct access to the hardware RTC.
This change makes PVH Dom0 follow suit.

Jan

