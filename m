Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6FC1F1829
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 13:50:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiGHy-0003ys-9s; Mon, 08 Jun 2020 11:50:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jiGHx-0003sa-2F
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 11:50:01 +0000
X-Inumbo-ID: 2e7d525c-a97e-11ea-96fb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e7d525c-a97e-11ea-96fb-bc764e2007e4;
 Mon, 08 Jun 2020 11:50:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 05BA7AB8F;
 Mon,  8 Jun 2020 11:50:02 +0000 (UTC)
Subject: Re: [PATCH for-4.14 v3] x86/rtc: provide mediated access to RTC for
 PVH dom0
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, paul@xen.org
References: <20200608102948.7327-1-roger.pau@citrix.com>
 <002c01d63d85$ba36da30$2ea48e90$@xen.org> <20200608114552.GA722@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <92c68cd3-a3c2-f46a-00cd-235b06a62e9b@suse.com>
Date: Mon, 8 Jun 2020 13:49:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200608114552.GA722@Air-de-Roger>
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
Cc: xen-devel@lists.xenproject.org, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.06.2020 13:45, Roger Pau Monné wrote:
> On Mon, Jun 08, 2020 at 12:12:40PM +0100, Paul Durrant wrote:
>>> From: Roger Pau Monne <roger.pau@citrix.com>
>>> Sent: 08 June 2020 11:30
>>>
>>> @@ -1110,6 +1111,67 @@ static unsigned long get_cmos_time(void)
>>>      return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
>>>  }
>>>
>>> +/* Helpers for guest accesses to the physical RTC. */
>>> +unsigned int rtc_guest_read(unsigned int port)
>>> +{
>>> +    const struct domain *currd = current->domain;
>>> +    unsigned long flags;
>>> +    unsigned int data = ~0;
>>> +
>>> +    switch ( port )
>>> +    {
>>> +    case RTC_PORT(0):
>>> +        /*
>>> +         * All PV domains are allowed to read the latched value of the first
>>> +         * RTC port. This is useful in order to store data when debugging.
>>> +         */
>>
>> Is this comment correct. AFAICT your call to register_portio_handler() would allow a PVH dom0 to access this too.
> 
> Oh, maybe this is not clear enough. Yes, PV/PVH dom0 will get access
> to both ports, but a PV domU will also get read/write access to the
> latched value in the first RTC port, even when it doesn't have access
> to the second RTC port.

I'd word this slightly differently: "..., even when it doesn't have
access to either physical RTC port."

Jan

