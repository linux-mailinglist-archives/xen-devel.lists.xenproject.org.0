Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14980220992
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:09:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jveLE-0006Im-3L; Wed, 15 Jul 2020 10:08:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jveLD-0006Ih-6k
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:08:43 +0000
X-Inumbo-ID: 292587d0-c683-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 292587d0-c683-11ea-bb8b-bc764e2007e4;
 Wed, 15 Jul 2020 10:08:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ECED0B6D9;
 Wed, 15 Jul 2020 10:08:44 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] x86: restore pv_rtc_handler() invocation
To: paul@xen.org
References: <416ac9b1-93d1-81a2-be19-d58d509fdfec@suse.com>
 <59f26856-d23d-bb69-0403-39e77acbf85c@suse.com>
 <001301d65a8e$e10e1260$a32a3720$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c0764a4e-b3f3-06e7-dbeb-1104f967525e@suse.com>
Date: Wed, 15 Jul 2020 12:08:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <001301d65a8e$e10e1260$a32a3720$@xen.org>
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.07.2020 12:01, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 15 July 2020 10:47
>> To: xen-devel@lists.xenproject.org
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Paul Durrant <paul@xen.org>; Wei Liu <wl@xen.org>;
>> Roger Pau Monné <roger.pau@citrix.com>
>> Subject: [PATCH v2 1/2] x86: restore pv_rtc_handler() invocation
>>
>> This was lost when making the logic accessible to PVH Dom0.
>>
>> Fixes: 835d8d69d96a ("x86/rtc: provide mediated access to RTC for PVH dom0")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -1160,6 +1160,10 @@ void rtc_guest_write(unsigned int port,
>>      case RTC_PORT(1):
>>          if ( !ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
>>              break;
>> +
>> +        if ( pv_rtc_handler )
>> +            pv_rtc_handler(currd->arch.cmos_idx & 0x7f, data);
>> +
> 
> This appears to be semantically slightly different to the old code in that it is only done for a write to RC_PORT(1), whereas it would have been done on a write to either RTC_POR(0) or RTC_PORT(1) before. Is that of any concern?

The old code was (quoting plain 4.13.1)

        else if ( port == RTC_PORT(0) )
        {
            currd->arch.cmos_idx = data;
        }
        else if ( (port == RTC_PORT(1)) &&
                  ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
        {
            unsigned long flags;

            if ( pv_rtc_handler )
                pv_rtc_handler(currd->arch.cmos_idx & 0x7f, data);
            spin_lock_irqsave(&rtc_lock, flags);
            outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
            outb(data, RTC_PORT(1));
            spin_unlock_irqrestore(&rtc_lock, flags);
        }

which I think similarly invoked the hook for RTC_PORT(1) only.

Jan

