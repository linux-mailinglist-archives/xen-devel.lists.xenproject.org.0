Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD24922C7CC
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 16:20:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyyXp-0001tQ-8c; Fri, 24 Jul 2020 14:19:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jyyXn-0001tL-U1
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 14:19:27 +0000
X-Inumbo-ID: add9a8bc-cdb8-11ea-a3f5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id add9a8bc-cdb8-11ea-a3f5-12813bfff9fa;
 Fri, 24 Jul 2020 14:19:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1C9BAAAC5;
 Fri, 24 Jul 2020 14:19:34 +0000 (UTC)
Subject: Re: [PATCH] x86: guard against port I/O overlapping the RTC/CMOS range
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <38c73e17-30b8-27b4-bc7c-e6ef7817fa1e@suse.com>
 <8b267b5e-8bd0-692e-d5d9-4a2bd21fb261@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f192793d-d074-990a-190d-67f48ccda87a@suse.com>
Date: Fri, 24 Jul 2020 16:19:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8b267b5e-8bd0-692e-d5d9-4a2bd21fb261@citrix.com>
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
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.07.2020 14:11, Andrew Cooper wrote:
> On 17/07/2020 14:10, Jan Beulich wrote:
>> Since we intercept RTC/CMOS port accesses, let's do so consistently in
>> all cases, i.e. also for e.g. a dword access to [006E,0071]. To avoid
>> the risk of unintended impact on Dom0 code actually doing so (despite
>> the belief that none ought to exist), also extend
>> guest_io_{read,write}() to decompose accesses where some ports are
>> allowed to be directly accessed and some aren't.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/pv/emul-priv-op.c
>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>> @@ -210,7 +210,7 @@ static bool admin_io_okay(unsigned int p
>>          return false;
>>  
>>      /* We also never permit direct access to the RTC/CMOS registers. */
>> -    if ( ((port & ~1) == RTC_PORT(0)) )
>> +    if ( port <= RTC_PORT(1) && port + bytes > RTC_PORT(0) )
>>          return false;
> 
> This first hunk is fine.
> 
> However, why decompose anything?  Any disallowed port in the range
> terminates the entire access, and doesn't internally shrink the access.

What tells you that adjacent ports (e.g. 006E and 006F to match
the example in the description) are disallowed? The typical
case here is Dom0 (as mentioned in the description), which has
access to most of the ports.

Jan

