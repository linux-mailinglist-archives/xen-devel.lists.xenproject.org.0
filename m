Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1422225A5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 16:32:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw4vV-00046K-K8; Thu, 16 Jul 2020 14:31:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOKz=A3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jw4vU-000467-3A
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 14:31:56 +0000
X-Inumbo-ID: 184e0614-c771-11ea-b7bb-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 184e0614-c771-11ea-b7bb-bc764e2007e4;
 Thu, 16 Jul 2020 14:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594909915;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mX6+Al+DCPGvTaGpH5vyQE9N5lqASJCT9hhRoUNp4AQ=;
 b=N7ALdckvL3cNjFZ9rRnCz4vnct7RcpZxpUIiXspkQPnyopgatYA7sBMf
 bEs7mOAxjc/nD6Jcfvc99lpRJIcel4GlMuriTUYd1NwN+R/TpHppCjI2z
 YPezcqhxhQZGVIOX37kmAbDlRyu9fRAjcMdTQsZPewMoTeTX5ht9StBly 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ru5cYZopSMX+x0tUfo7K/rPcyH9pFqhrn6q0L/yjTD+mcvkF3r0V+ueHGisPhcm1Q2x1iPoTct
 drdUyDBaYlt5X2tXx6MO4VM9zIfkvvCKpTaClIAgXwDXYK9LwBUKh42mBw1tHRC2x1tBYu2FWk
 dUYLEEYiTKeoaQoULB+qwPzCaUH11CH/lqmhS1cnDT1LxWYkq/qpPfXxmXyso+9GvOBXgXXVzW
 7lpcgrDFX5tqBLKdH2v0TDSFmxvruYlYsBaW0OPqzg0rxEZODFhYdlJQst3Y8uPCsx8lEpXRJh
 Yrs=
X-SBRS: 2.7
X-MesageID: 22852512
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,359,1589256000"; d="scan'208";a="22852512"
Date: Thu, 16 Jul 2020 16:31:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 2/2] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Message-ID: <20200716143145.GP7191@Air-de-Roger>
References: <416ac9b1-93d1-81a2-be19-d58d509fdfec@suse.com>
 <72a63cba-bfdb-ae3c-284b-8ba5b9d7f7a9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <72a63cba-bfdb-ae3c-284b-8ba5b9d7f7a9@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 15, 2020 at 11:47:56AM +0200, Jan Beulich wrote:
> ... in order to also intercept accesses through the alias ports.
> 
> Also stop intercepting accesses to the CMOS ports if we won't ourselves
> use the CMOS RTC.

I think you are missing the registration of the aliased ports in
rtc_init for a PVH hardware domain, hw_rtc_io will currently only get
called by accesses to 0x71-0x71.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Re-base.
> 
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -670,6 +670,80 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>      return ret;
>  }
>  
> +#ifndef COMPAT
> +#include <asm/mc146818rtc.h>
> +
> +unsigned int __read_mostly cmos_alias_mask;
> +
> +static int __init probe_cmos_alias(void)
> +{
> +    unsigned int i, offs;
> +
> +    if ( acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC )
> +        return 0;
> +
> +    for ( offs = 2; offs < 8; offs <<= 1 )
> +    {
> +        bool read = true;
> +
> +        for ( i = RTC_REG_D + 1; i < 0x80; ++i )
> +        {
> +            uint8_t normal, alt;
> +            unsigned long flags;
> +
> +            if ( i == acpi_gbl_FADT.century )
> +                continue;

I'm missing something, why do you avoid the century register for
comparison reasons?

> @@ -2009,37 +2009,33 @@ int __hwdom_init xen_in_range(unsigned l
>  static int __hwdom_init io_bitmap_cb(unsigned long s, unsigned long e,
>                                       void *ctx)
>  {
> -    struct domain *d = ctx;
> +    const struct domain *d = ctx;

Urg, it's kind of weird to constify d ...

>      unsigned int i;
>  
>      ASSERT(e <= INT_MAX);
>      for ( i = s; i <= e; i++ )
> -        __clear_bit(i, d->arch.hvm.io_bitmap);
> +        if ( admin_io_okay(i, 1, d) )
> +            __clear_bit(i, d->arch.hvm.io_bitmap);

... when you are modifying the bitmap here.

>  
>      return 0;
>  }
>  
>  void __hwdom_init setup_io_bitmap(struct domain *d)
>  {
> -    int rc;
> +    if ( !is_hvm_domain(d) )
> +        return;
>  
> -    if ( is_hvm_domain(d) )
> -    {
> -        bitmap_fill(d->arch.hvm.io_bitmap, 0x10000);
> -        rc = rangeset_report_ranges(d->arch.ioport_caps, 0, 0x10000,
> -                                    io_bitmap_cb, d);
> -        BUG_ON(rc);
> -        /*
> -         * NB: we need to trap accesses to 0xcf8 in order to intercept
> -         * 4 byte accesses, that need to be handled by Xen in order to
> -         * keep consistency.
> -         * Access to 1 byte RTC ports also needs to be trapped in order
> -         * to keep consistency with PV.
> -         */
> -        __set_bit(0xcf8, d->arch.hvm.io_bitmap);
> -        __set_bit(RTC_PORT(0), d->arch.hvm.io_bitmap);
> -        __set_bit(RTC_PORT(1), d->arch.hvm.io_bitmap);
> -    }
> +    bitmap_fill(d->arch.hvm.io_bitmap, 0x10000);
> +    if ( rangeset_report_ranges(d->arch.ioport_caps, 0, 0x10000,
> +                                io_bitmap_cb, d) )
> +        BUG();

You can directly use BUG_ON, no need for the if. IIRC it's safe to
call admin_io_okay (and thus ioports_access_permitted) when already
holding the rangeset lock, as both are read-lockers and can safely
recurse.

> +
> +    /*
> +     * We need to trap 4-byte accesses to 0xcf8 (see admin_io_okay(),
> +     * guest_io_read(), and guest_io_write()), which isn't covered by
> +     * the admin_io_okay() check in io_bitmap_cb().
> +     */
> +    __set_bit(0xcf8, d->arch.hvm.io_bitmap);
>  }
>  
>  /*
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1092,7 +1092,10 @@ static unsigned long get_cmos_time(void)
>          if ( seconds < 60 )
>          {
>              if ( rtc.sec != seconds )
> +            {
>                  cmos_rtc_probe = false;
> +                acpi_gbl_FADT.boot_flags &= ~ACPI_FADT_NO_CMOS_RTC;

Do you need to set this flag also when using the EFI runtime services
in order to get the time in get_cmos_time? In that case the RTC is not
use, and hence could be handled to the hardware domain?

> +            }
>              break;
>          }
>  
> @@ -1114,7 +1117,7 @@ unsigned int rtc_guest_read(unsigned int
>      unsigned long flags;
>      unsigned int data = ~0;
>  
> -    switch ( port )
> +    switch ( port & ~cmos_alias_mask )
>      {
>      case RTC_PORT(0):
>          /*
> @@ -1126,11 +1129,12 @@ unsigned int rtc_guest_read(unsigned int
>          break;
>  
>      case RTC_PORT(1):
> -        if ( !ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
> +        if ( !ioports_access_permitted(currd, port - 1, port) )
>              break;
>          spin_lock_irqsave(&rtc_lock, flags);
> -        outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
> -        data = inb(RTC_PORT(1));
> +        outb(currd->arch.cmos_idx & (0xff >> (port == RTC_PORT(1))),

Why do you only mask this for accesses to the non aliased ports? If
the RTC is aliased you also want to mask the aliased accesses in the
same way?

Thanks, Roger.

