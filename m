Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F130D1EFBBE
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 16:45:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhDaK-0002y9-RG; Fri, 05 Jun 2020 14:44:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jhDaJ-0002y2-G7
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 14:44:39 +0000
X-Inumbo-ID: 1485d382-a73b-11ea-ba62-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1485d382-a73b-11ea-ba62-bc764e2007e4;
 Fri, 05 Jun 2020 14:44:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8CB4FAD35;
 Fri,  5 Jun 2020 14:44:40 +0000 (UTC)
Subject: Re: [PATCH for-4.14 v2] x86/rtc: provide mediated access to RTC for
 PVH dom0
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200605110240.52545-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f71e1c35-d48a-fc0a-ad89-8867a2875cae@suse.com>
Date: Fri, 5 Jun 2020 16:44:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200605110240.52545-1-roger.pau@citrix.com>
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

On 05.06.2020 13:02, Roger Pau Monne wrote:
> Mediated access to the RTC was provided for PVHv1 dom0 using the PV
> code paths (guest_io_{write/read}), but those accesses where never
> implemented for PVHv2 dom0. This patch provides such mediated accesses
> to the RTC for PVH dom0, just like it's provided for a classic PV
> dom0.
> 
> Pull out some of the RTC logic from guest_io_{read/write} into
> specific helpers that can be used by both PV and HVM guests. The
> setup of the handlers for PVH is done in rtc_init, which is already
> used to initialize the fully emulated RTC.
> 
> Without this a Linux PVH dom0 will read garbage when trying to access
> the RTC, and one vCPU will be constantly looping in
> rtc_timer_do_work.
> 
> Note that such issue doesn't happen on domUs because the ACPI
> NO_CMOS_RTC flag is set in FADT, which prevents the OS from accessing
> the RTC. Also the X86_EMU_RTC flag is not set for PVH dom0, as the
> accesses are not emulated but rather forwarded to the physical
> hardware.
> 
> No functional change expected for classic PV dom0.

But there is, in whether (virtual) port 0x71 can be read/written (even
by a DomU). I'm afraid of being called guilty in splitting hair, though.

> @@ -808,10 +809,43 @@ void rtc_reset(struct domain *d)
>      s->pt.source = PTSRC_isa;
>  }
>  
> +/* RTC mediator for HVM hardware domain. */
> +static int hw_rtc_io(int dir, unsigned int port, unsigned int size,
> +                     uint32_t *val)
> +{
> +    if ( dir == IOREQ_READ )
> +        *val = ~0;
> +
> +    if ( size != 1 )
> +    {
> +        gdprintk(XENLOG_WARNING, "bad RTC access size (%u)\n", size);
> +        return X86EMUL_OKAY;
> +    }
> +    if ( !ioports_access_permitted(current->domain, port, port) )

This wants to move into the helper, such that the PV side can have
it moved too.

>  void rtc_init(struct domain *d)
>  {
>      RTCState *s = domain_vrtc(d);
>  
> +    if ( is_hardware_domain(d) )
> +    {
> +        /* Hardware domain gets mediated access to the physical RTC. */
> +        register_portio_handler(d, RTC_PORT(0), 2, hw_rtc_io);
> +        return;

Any reason for this explicit return, rather than ...

> +    }
> +
>      if ( !has_vrtc(d) )
>          return;

... making use of this one? In fact wouldn't it be more correct
to have

    if ( !has_vrtc(d) )
    {
        /* Hardware domain gets mediated access to the physical RTC. */
        if ( is_hardware_domain(d) )
            register_portio_handler(d, RTC_PORT(0), 2, hw_rtc_io);
        return;
    }

such that eventual (perhaps optional) enabling of vRTC for hwdom
would have it properly work without changing this function again?

> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -280,19 +280,10 @@ static uint32_t guest_io_read(unsigned int port, unsigned int bytes,
>          {
>              sub_data = pv_pit_handler(port, 0, 0);
>          }
> -        else if ( port == RTC_PORT(0) )
> -        {
> -            sub_data = currd->arch.cmos_idx;

Note how there was no permission check here. Having one or more
I/O ports that can be used to simply latch a value can, as I've
learned, be quite valuable as a debugging vehicle, and there
aren't many (if any) ports beyond this one that a PV DomU might
use for such a purpose. Arguably the value is somewhat limited
here, as the value wouldn't survive a crash, but I'd still
prefer if we could retain prior functionality.

> @@ -1110,6 +1111,64 @@ static unsigned long get_cmos_time(void)
>      return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
>  }
>  
> +/* Helpers for guest accesses to the physical RTC. */
> +unsigned int rtc_guest_read(unsigned int port)
> +{
> +    const struct domain *currd = current->domain;
> +    unsigned long flags;
> +    unsigned int data = ~0;
> +
> +    ASSERT(port == RTC_PORT(0) || port == RTC_PORT(1));

Instead of this, how about ...

> +    if ( !ioports_access_permitted(currd, port, port) )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return data;
> +    }
> +
> +    switch ( port )
> +    {
> +    case RTC_PORT(0):
> +        data = currd->arch.cmos_idx;
> +        break;
> +
> +    case RTC_PORT(1):
> +        spin_lock_irqsave(&rtc_lock, flags);
> +        outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
> +        data = inb(RTC_PORT(1));
> +        spin_unlock_irqrestore(&rtc_lock, flags);
> +        break;

    default:
        ASSERT_UNREACHABLE();
        break;

?

Jan

