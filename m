Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E121225DFE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 13:59:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxURR-0001vz-V2; Mon, 20 Jul 2020 11:58:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jxURQ-0001vu-LN
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 11:58:44 +0000
X-Inumbo-ID: 5b5a9f51-ca80-11ea-9f8c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b5a9f51-ca80-11ea-9f8c-12813bfff9fa;
 Mon, 20 Jul 2020 11:58:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 71345AB3D;
 Mon, 20 Jul 2020 11:58:48 +0000 (UTC)
Subject: Re: [PATCH] x86: guard against port I/O overlapping the RTC/CMOS range
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <38c73e17-30b8-27b4-bc7c-e6ef7817fa1e@suse.com>
 <20200720105213.GI7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c82b9985-fd4e-fbd6-afe1-7bdbf395d426@suse.com>
Date: Mon, 20 Jul 2020 13:58:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720105213.GI7191@Air-de-Roger>
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

On 20.07.2020 12:52, Roger Pau Monné wrote:
> On Fri, Jul 17, 2020 at 03:10:43PM +0200, Jan Beulich wrote:
>> Since we intercept RTC/CMOS port accesses, let's do so consistently in
>> all cases, i.e. also for e.g. a dword access to [006E,0071]. To avoid
>> the risk of unintended impact on Dom0 code actually doing so (despite
>> the belief that none ought to exist), also extend
>> guest_io_{read,write}() to decompose accesses where some ports are
>> allowed to be directly accessed and some aren't.
> 
> Wouldn't the same apply to displaced accesses to port 0xcf8?

No, CF8 is special - partial accesses have no meaning as to the
index selection for subsequent CFC accesses. Or else CF9
couldn't be a standalone port with entirely different
functionality..

>> @@ -373,25 +384,31 @@ static int read_io(unsigned int port, un
>>      return X86EMUL_OKAY;
>>  }
>>  
>> +static void _guest_io_write(unsigned int port, unsigned int bytes,
>> +                            uint32_t data)
> 
> There's nothing guest specific about this function I think? If so you
> could drop the _guest_ prefix and just name it io_write?

Hmm, when choosing the name I decided that (a) it's a helper of
the other function and (b) it's still guest driven data that we
output.

>> +{
>> +    switch ( bytes )
>> +    {
>> +    case 1:
>> +        outb((uint8_t)data, port);
>> +        if ( amd_acpi_c1e_quirk )
>> +            amd_check_disable_c1e(port, (uint8_t)data);
>> +        break;
>> +    case 2:
>> +        outw((uint16_t)data, port);
>> +        break;
>> +    case 4:
>> +        outl(data, port);
>> +        break;
>> +    }
> 
> Newlines after break statements would be nice, and maybe add a
> default: ASSERT_UNREACHABLE() case to be on the safe side?

Well, yes, I guess I should. But then if I edit this moved code,
I guess I'll also get rid of the stray casts.

Jan

