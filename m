Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E77B61EF35F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 10:49:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh81z-00071y-Rl; Fri, 05 Jun 2020 08:48:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jh81y-00071r-Vp
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 08:48:51 +0000
X-Inumbo-ID: 5f2a125f-a709-11ea-af8e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f2a125f-a709-11ea-af8e-12813bfff9fa;
 Fri, 05 Jun 2020 08:48:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8B85CAE5E;
 Fri,  5 Jun 2020 08:48:52 +0000 (UTC)
Subject: Re: [PATCH for-4.14] x86/rtc: provide mediated access to RTC for PVH
 dom0
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200605075006.51238-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ac523b3f-cc96-e63e-732c-2aa7ac3eac59@suse.com>
Date: Fri, 5 Jun 2020 10:48:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200605075006.51238-1-roger.pau@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.06.2020 09:50, Roger Pau Monne wrote:
> At some point (maybe PVHv1?) mediated access to the RTC was provided
> for PVH dom0 using the PV code paths (guest_io_{write/read}). At some
> point this code has been made PV specific and unhooked from the
> current PVH IO path.

I don't suppose you've identified the commit which did? This would
help deciding whether / how far to backport such a change.

> This patch provides such mediated access to the
> RTC for PVH dom0, just like it's provided for a classic PV dom0.
> 
> Instead of re-using the PV paths implement such handler together with
> the vRTC code for HVM, so that calling rtc_init will setup the
> appropriate handlers for all HVM based guests.

Hooking this into rtc_init() makes sense as long as it's really
just the RTC. Looking at the PV code you're cloning from, I
wonder though whether pv_pit_handler() should also regain callers
for PVH. As it stands the function is called for PV only, yet was
deliberately put/kept outside of pv/.

So along the lines of Paul's reply I think it would be better if
code was shared between PV and PVH Dom0, perhaps by breaking out
respective pieces from guest_io_{read,write}().

> Note that such issue doesn't happen on domUs because the ACPI
> NO_CMOS_RTC flag is set in FADT, which prevents the OS from accessing
> the RTC.

Will it? I'm pretty sure Linux may (have?) ignore(d) this flag.

> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -808,10 +808,79 @@ void rtc_reset(struct domain *d)
>      s->pt.source = PTSRC_isa;
>  }
>  
> +/* RTC mediator for HVM hardware domain. */
> +static unsigned int hw_read(unsigned int port)
> +{
> +    const struct domain *currd = current->domain;
> +    unsigned long flags;
> +    unsigned int data = 0;
> +
> +    switch ( port )
> +    {
> +    case RTC_PORT(0):
> +          data = currd->arch.cmos_idx;
> +          break;
> +
> +    case RTC_PORT(1):
> +          spin_lock_irqsave(&rtc_lock, flags);
> +          outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
> +          data = inb(RTC_PORT(1));
> +          spin_unlock_irqrestore(&rtc_lock, flags);

Avoiding to clone the original code would also avoid omissions
like the ioports_access_permitted() calls you've dropped from
here as well as the write counterpart. This may seem redundant
as we never deny access right now, but should imo be there in
case we decide to do (e.g. on NO_CMOS_RTC systems).

Actually, "never" wasn't quite right I think: Late-hwdom
creation will revoke access from dom0 and instead grant it to
the new hwdom. Without the check, dom0 would continue to be
able to access the RTC.

Jan

