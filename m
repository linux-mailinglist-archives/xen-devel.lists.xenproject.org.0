Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 076042B1DEA
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 16:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26606.55093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdaYr-0005YR-Dd; Fri, 13 Nov 2020 15:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26606.55093; Fri, 13 Nov 2020 15:00:25 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdaYr-0005Y2-AH; Fri, 13 Nov 2020 15:00:25 +0000
Received: by outflank-mailman (input) for mailman id 26606;
 Fri, 13 Nov 2020 15:00:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kdaYp-0005Xw-7x
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 15:00:23 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f096ea6-2334-43cb-830f-2ed39f2b7599;
 Fri, 13 Nov 2020 15:00:22 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w15so5801773lji.10
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 07:00:22 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 14sm1246833lff.100.2020.11.13.07.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 07:00:20 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kdaYp-0005Xw-7x
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 15:00:23 +0000
X-Inumbo-ID: 4f096ea6-2334-43cb-830f-2ed39f2b7599
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4f096ea6-2334-43cb-830f-2ed39f2b7599;
	Fri, 13 Nov 2020 15:00:22 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w15so5801773lji.10
        for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 07:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=loEGtmzCg7gfnYlPzkZrXi5KoXBJgTXmL7oE5EG4OW0=;
        b=Gyby1GHrg4L7BUCH09x71JpNR4Mx1lTa9CXoNROpQGUkUzw6Xdntx+2Bbc8YboQsS5
         7X4w48hhghH+5tz5l/k5F2Qt47A8eaeZeS82o93XzXHVvraxFuIILbYFSh+0Q9+s4r8z
         HmD3eNeTGs+LDGHldJkgUdIvKZJARSqXI6l9QOqVpuVcrLxE9KrR/6RHzVlNzkmfTKm0
         X1ceTGe1RU82+mSd9es3qRNHNBs/3TP3WvitTSQ93MiRY3YES66SRbVr34QPD2R6e32z
         7YnLHzdm/qT+M5q/0r5L/PVSr4Br6n1ms58D+OIbhhVOb38ea8q+2iHb6QF1lnOSBqgQ
         8J8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=loEGtmzCg7gfnYlPzkZrXi5KoXBJgTXmL7oE5EG4OW0=;
        b=sD20Fr/iCR5rUTzVoF7y0zDjYBMY4WHmBZIPRWXgFWWJVKR4JgILQDyd+E7cRcEbzC
         16DRq2VElzBjMCOiFhx3c/YuJFRqNLIJqcrTiuEj8ddl/yL3vkXAytOSHDo8rrPHDKyK
         87l8cPONh9gjyAYworeafJxhWL0B/p8CWD0nV2+0e/hT4gFMiFsyPKI/vUM1UHkN3xT+
         3Flawi77HmbXr4fWvlxhBj7OF4p4npY3qXfbN+idkVgr3C6TbBzg1q5XOHw0Lg+4CoZ3
         sESpKMW0BAYdvqoR6kAj3oGxRMfAGNg9yX8BbdEfZar7e8JQehlY4U5LiKJg5xCnuL29
         f/Hw==
X-Gm-Message-State: AOAM531ueFwy1fpRmdufhDJQ3mbbcqorpPKHenDYbmKMMvOk+20YZWTc
	CXj3wBr4aabjHt/VpOPPK57fY7NIAOPmNQ==
X-Google-Smtp-Source: ABdhPJwQGesHAq9CUQY/Gpht6f6saslE5JXR9mjEPZDITFp7JDlfyGQ4n9SXNm9t0oPuJmN9/DOtuQ==
X-Received: by 2002:a2e:7a0a:: with SMTP id v10mr1304331ljc.5.1605279620956;
        Fri, 13 Nov 2020 07:00:20 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id 14sm1246833lff.100.2020.11.13.07.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 07:00:20 -0800 (PST)
Subject: Re: [PATCH V2 10/23] xen/mm: Make x86's XENMEM_resource_ioreq_server
 handling common
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-11-git-send-email-olekstysh@gmail.com>
 <1c9bc1aa-b622-fb8e-e5d5-3e27567354c0@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <2be2f73e-dfcd-f856-cfe1-85e41538bd15@gmail.com>
Date: Fri, 13 Nov 2020 17:00:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1c9bc1aa-b622-fb8e-e5d5-3e27567354c0@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12.11.20 13:40, Jan Beulich wrote:

Hi Jan

> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -30,6 +30,10 @@
>>   #include <public/memory.h>
>>   #include <xsm/xsm.h>
>>   
>> +#ifdef CONFIG_IOREQ_SERVER
>> +#include <xen/ioreq.h>
>> +#endif
> Preferably #ifdef-s would not be needed here. If any, they'd better
> live in xen/ioreq.h itself then.

ok


>
>> @@ -1045,6 +1049,38 @@ static int acquire_grant_table(struct domain *d, unsigned int id,
>>       return 0;
>>   }
>>   
>> +#ifdef CONFIG_IOREQ_SERVER
> To limit the number of #ifdef-s, could this be moved ...
>
>> +static int acquire_ioreq_server(struct domain *d,
>> +                                unsigned int id,
>> +                                unsigned long frame,
>> +                                unsigned int nr_frames,
>> +                                xen_pfn_t mfn_list[])
>> +{
> ... here such that ...
>
>> @@ -1103,9 +1139,14 @@ static int acquire_resource(
>>                                    mfn_list);
>>           break;
>>   
>> +#ifdef CONFIG_IOREQ_SERVER
>> +    case XENMEM_resource_ioreq_server:
>> +        rc = acquire_ioreq_server(d, xmar.id, xmar.frame, xmar.nr_frames,
>> +                                  mfn_list);
>> +        break;
>> +#endif
> ... the ones here then can be dropped?

I think yes, that would be better.


>
>>       default:
> Also you'll want to a blank line between the new case statement and
> the "default:".

ok

-- 
Regards,

Oleksandr Tyshchenko


