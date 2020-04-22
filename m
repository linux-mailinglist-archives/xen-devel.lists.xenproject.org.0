Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75EE1B469D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 15:50:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRFlR-0006hv-H4; Wed, 22 Apr 2020 13:50:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+vI=6G=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jRFlQ-0006fV-Ml
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 13:50:08 +0000
X-Inumbo-ID: 2ceda2e6-84a0-11ea-9287-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ceda2e6-84a0-11ea-9287-12813bfff9fa;
 Wed, 22 Apr 2020 13:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hOCpRi14MuW2iXfxBgDx5xM0YVwCVVg6dimgyyOfD2A=; b=tccILTkrrP0pLIsIirF1ZkXn7b
 4oGnvbRzIbjaTKpX1hfQ6Z4zfuySkqPrjAU59MIjknJ7NPo2bBNqtYWyTyNhoWkR9kZ0xP/05sT6m
 WEl1LWPHUTaszP6l6QELrCSNRhiuS+GGBZEYIfEvsxibrC9luFVYnCG0WUCjrYLkPKb8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jRFlN-0007Il-6k; Wed, 22 Apr 2020 13:50:05 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jRFlM-0008Bn-UJ; Wed, 22 Apr 2020 13:50:05 +0000
Subject: Re: [PATCH] xen/grants: fix hypercall continuation for
 GNTTABOP_cache_flush
From: Julien Grall <julien@xen.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200422130753.14713-1-jgross@suse.com>
 <6ae77443-2703-614a-adfc-65bfacf27185@xen.org>
Message-ID: <9f23844c-4ca0-8eb6-406f-a4c85274c42f@xen.org>
Date: Wed, 22 Apr 2020 14:50:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6ae77443-2703-614a-adfc-65bfacf27185@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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



On 22/04/2020 14:43, Julien Grall wrote:
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

Hmmm... I misread the code and missed the:

if ( hypercall_preempt_check() )
   return i;

Sorry for the noise.

I am also assuming this want a Fixes tag on 
18e8d22fe750c8c7b2830fa37961352693425cf1 "introduce GNTTABOP_cache_flush".

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

