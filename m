Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A88281F1822
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 13:47:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiGFY-0003bm-LK; Mon, 08 Jun 2020 11:47:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jiGFW-0003bQ-Ex
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 11:47:30 +0000
X-Inumbo-ID: d49df4ee-a97d-11ea-ba62-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d49df4ee-a97d-11ea-ba62-bc764e2007e4;
 Mon, 08 Jun 2020 11:47:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0F67CAB8F;
 Mon,  8 Jun 2020 11:47:32 +0000 (UTC)
Subject: Re: [PATCH for-4.14 v3] x86/rtc: provide mediated access to RTC for
 PVH dom0
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200608102948.7327-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <71e0d073-165b-8fcc-62b9-3fb028b3c526@suse.com>
Date: Mon, 8 Jun 2020 13:47:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200608102948.7327-1-roger.pau@citrix.com>
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

On 08.06.2020 12:29, Roger Pau Monne wrote:
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
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably with ...

> @@ -1110,6 +1111,67 @@ static unsigned long get_cmos_time(void)
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
> +    switch ( port )
> +    {
> +    case RTC_PORT(0):
> +        /*
> +         * All PV domains are allowed to read the latched value of the first
> +         * RTC port. This is useful in order to store data when debugging.
> +         */

... at least the 2nd sentence of this and ...

> +void rtc_guest_write(unsigned int port, unsigned int data)
> +{
> +    struct domain *currd = current->domain;
> +    unsigned long flags;
> +
> +    switch ( port )
> +    {
> +    case RTC_PORT(0):
> +        /*
> +         * All PV domains are allowed to write to the latched value of the
> +         * first RTC port. This is useful in order to store data when
> +         * debugging.
> +         */

... this comment dropped again. This justification of the possible
usefulness is my very private guessing. Just like the original code
was, I think we could leave this uncommented altogether.

Jan

