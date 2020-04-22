Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995911B469C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 15:50:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRFlH-00063t-8d; Wed, 22 Apr 2020 13:49:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9hqk=6G=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jRFlF-00063k-Jx
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 13:49:57 +0000
X-Inumbo-ID: 26763c84-84a0-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26763c84-84a0-11ea-83d8-bc764e2007e4;
 Wed, 22 Apr 2020 13:49:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D295EAEE8;
 Wed, 22 Apr 2020 13:49:54 +0000 (UTC)
Subject: Re: [PATCH] xen/grants: fix hypercall continuation for
 GNTTABOP_cache_flush
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20200422130753.14713-1-jgross@suse.com>
 <6ae77443-2703-614a-adfc-65bfacf27185@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c1e12fda-6740-d301-977e-265307158e50@suse.com>
Date: Wed, 22 Apr 2020 15:49:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6ae77443-2703-614a-adfc-65bfacf27185@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.04.20 15:43, Julien Grall wrote:
> Hi Juergen,
> 
> On 22/04/2020 14:07, Juergen Gross wrote:
>> The GNTTABOP_cache_flush hypercall has a wrong test for hypercall
>> continuation, the test today is:
>>
>>      if ( rc > 0 || opaque_out != 0 )
>>
>> Unfortunately this will be true even in case of an error (rc < 0),
>> possibly leading to very long lasting hypercalls (times of more
>> than an hour have been observed in a test case).
>>
>> Correct the test condition to result in false with rc < 0 and set
>> opaque_out only if no error occurred, to be on the safe side.
>>
>> Partially-suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   xen/common/grant_table.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
>> index 96080b3dec..5ef7ff940d 100644
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -3626,12 +3626,12 @@ do_grant_table_op(
>>           if ( unlikely(!guest_handle_okay(cflush, count)) )
>>               goto out;
>>           rc = gnttab_cache_flush(cflush, &opaque_in, count);
>> -        if ( rc > 0 )
>> +        if ( rc >= 0 )
>>           {
>>               guest_handle_add_offset(cflush, rc);
>>               uop = guest_handle_cast(cflush, void);
>> +            opaque_out = opaque_in;
>>           }
>> -        opaque_out = opaque_in;
>>           break;
>>       }
>> @@ -3641,7 +3641,7 @@ do_grant_table_op(
>>       }
>>     out:
>> -    if ( rc > 0 || opaque_out != 0 )
>> +    if ( rc > 0 || (opaque_out != 0 && rc == 0) )
> 
> I don't understand this change. If you look at the implementation of 
> gnttab_flush() it is not possible to have opaque_out non-zero with rc = 0.

Why not?

In gnttab_cache_flush() we have:

   if ( hypercall_preempt_check() )
       return i;

i will be 0 in the first loop iteration.


Juergen

