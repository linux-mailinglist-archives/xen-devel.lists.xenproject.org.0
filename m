Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0852A2238D7
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 12:00:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwNAP-00082R-2f; Fri, 17 Jul 2020 10:00:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jwNAN-00081v-Gg
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 10:00:31 +0000
X-Inumbo-ID: 58628196-c814-11ea-95ae-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58628196-c814-11ea-95ae-12813bfff9fa;
 Fri, 17 Jul 2020 10:00:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 968B1AD26;
 Fri, 17 Jul 2020 10:00:33 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] x86: detect CMOS aliasing on ports other than
 0x70/0x71
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <416ac9b1-93d1-81a2-be19-d58d509fdfec@suse.com>
 <72a63cba-bfdb-ae3c-284b-8ba5b9d7f7a9@suse.com>
 <20200716143145.GP7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <77904c06-ff49-14c2-385f-2a3ec4d477f1@suse.com>
Date: Fri, 17 Jul 2020 12:00:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716143145.GP7191@Air-de-Roger>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.07.2020 16:31, Roger Pau Monné wrote:
> On Wed, Jul 15, 2020 at 11:47:56AM +0200, Jan Beulich wrote:
>> ... in order to also intercept accesses through the alias ports.
>>
>> Also stop intercepting accesses to the CMOS ports if we won't ourselves
>> use the CMOS RTC.
> 
> I think you are missing the registration of the aliased ports in
> rtc_init for a PVH hardware domain, hw_rtc_io will currently only get
> called by accesses to 0x71-0x71.

Oh, right - a re-basing oversight. Thanks for noticing. (It's not
just the registration that's missing, but also the avoiding of it
in case ACPI_FADT_NO_CMOS_RTC is set.)

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Re-base.
>>
>> --- a/xen/arch/x86/physdev.c
>> +++ b/xen/arch/x86/physdev.c
>> @@ -670,6 +670,80 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>>      return ret;
>>  }
>>  
>> +#ifndef COMPAT
>> +#include <asm/mc146818rtc.h>
>> +
>> +unsigned int __read_mostly cmos_alias_mask;
>> +
>> +static int __init probe_cmos_alias(void)
>> +{
>> +    unsigned int i, offs;
>> +
>> +    if ( acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC )
>> +        return 0;
>> +
>> +    for ( offs = 2; offs < 8; offs <<= 1 )
>> +    {
>> +        bool read = true;
>> +
>> +        for ( i = RTC_REG_D + 1; i < 0x80; ++i )
>> +        {
>> +            uint8_t normal, alt;
>> +            unsigned long flags;
>> +
>> +            if ( i == acpi_gbl_FADT.century )
>> +                continue;
> 
> I'm missing something, why do you avoid the century register for
> comparison reasons?

Just like the other RTC registers - their contents may change behind
our backs, here e.g. over New Year between two centuries.

>> @@ -2009,37 +2009,33 @@ int __hwdom_init xen_in_range(unsigned l
>>  static int __hwdom_init io_bitmap_cb(unsigned long s, unsigned long e,
>>                                       void *ctx)
>>  {
>> -    struct domain *d = ctx;
>> +    const struct domain *d = ctx;
> 
> Urg, it's kind of weird to constify d ...
> 
>>      unsigned int i;
>>  
>>      ASSERT(e <= INT_MAX);
>>      for ( i = s; i <= e; i++ )
>> -        __clear_bit(i, d->arch.hvm.io_bitmap);
>> +        if ( admin_io_okay(i, 1, d) )
>> +            __clear_bit(i, d->arch.hvm.io_bitmap);
> 
> ... when you are modifying the bitmap here.

Well - I'm not modifying what d points to. In principle these I/O
bitmaps are shared; It's just Dom0 which gets a separate one. So
modifying the bitmap really is unrelated to modifying struct domain.

>>  void __hwdom_init setup_io_bitmap(struct domain *d)
>>  {
>> -    int rc;
>> +    if ( !is_hvm_domain(d) )
>> +        return;
>>  
>> -    if ( is_hvm_domain(d) )
>> -    {
>> -        bitmap_fill(d->arch.hvm.io_bitmap, 0x10000);
>> -        rc = rangeset_report_ranges(d->arch.ioport_caps, 0, 0x10000,
>> -                                    io_bitmap_cb, d);
>> -        BUG_ON(rc);
>> -        /*
>> -         * NB: we need to trap accesses to 0xcf8 in order to intercept
>> -         * 4 byte accesses, that need to be handled by Xen in order to
>> -         * keep consistency.
>> -         * Access to 1 byte RTC ports also needs to be trapped in order
>> -         * to keep consistency with PV.
>> -         */
>> -        __set_bit(0xcf8, d->arch.hvm.io_bitmap);
>> -        __set_bit(RTC_PORT(0), d->arch.hvm.io_bitmap);
>> -        __set_bit(RTC_PORT(1), d->arch.hvm.io_bitmap);
>> -    }
>> +    bitmap_fill(d->arch.hvm.io_bitmap, 0x10000);
>> +    if ( rangeset_report_ranges(d->arch.ioport_caps, 0, 0x10000,
>> +                                io_bitmap_cb, d) )
>> +        BUG();
> 
> You can directly use BUG_ON, no need for the if.

Long ago we agreed to avoid BUG_ON() with expressions that have
required (side) effects. I.e. just like for ASSERT(), where the
expression wouldn't get evaluated at all when NDEBUG is defined.

> IIRC it's safe to
> call admin_io_okay (and thus ioports_access_permitted) when already
> holding the rangeset lock, as both are read-lockers and can safely
> recurse.

I'm afraid I don't see the connection of this remark to the
construct in question.

>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -1092,7 +1092,10 @@ static unsigned long get_cmos_time(void)
>>          if ( seconds < 60 )
>>          {
>>              if ( rtc.sec != seconds )
>> +            {
>>                  cmos_rtc_probe = false;
>> +                acpi_gbl_FADT.boot_flags &= ~ACPI_FADT_NO_CMOS_RTC;
> 
> Do you need to set this flag also when using the EFI runtime services
> in order to get the time in get_cmos_time? In that case the RTC is not
> use, and hence could be handled to the hardware domain?

Whether the EFI runtime services use the RTC is unknown. There are
specific precautions towards this in the UEFI spec, iirc.

>> @@ -1114,7 +1117,7 @@ unsigned int rtc_guest_read(unsigned int
>>      unsigned long flags;
>>      unsigned int data = ~0;
>>  
>> -    switch ( port )
>> +    switch ( port & ~cmos_alias_mask )
>>      {
>>      case RTC_PORT(0):
>>          /*
>> @@ -1126,11 +1129,12 @@ unsigned int rtc_guest_read(unsigned int
>>          break;
>>  
>>      case RTC_PORT(1):
>> -        if ( !ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
>> +        if ( !ioports_access_permitted(currd, port - 1, port) )
>>              break;
>>          spin_lock_irqsave(&rtc_lock, flags);
>> -        outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
>> -        data = inb(RTC_PORT(1));
>> +        outb(currd->arch.cmos_idx & (0xff >> (port == RTC_PORT(1))),
> 
> Why do you only mask this for accesses to the non aliased ports? If
> the RTC is aliased you also want to mask the aliased accesses in the
> same way?

Bit 7 in port 70 has a different meaning (NMI mask); you can access
RTC/CMOS bytes 0-127 only this way. There are chipsets which provide
256-byte CMOS, where the high half can be accessed via the aliases.

However, seeing this comment of yours I noticed that there's still a
related bug here: When the guest reads/writes the index port, I _also_
need to mask off the high bit when it's the non-aliased port that gets
accessed. Otherwise Dom0 writing port 74 but then reading port 71
could lead to bit 7 getting set in port 70.

Jan

