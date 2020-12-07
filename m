Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D267C2D19E6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 20:45:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46965.83170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmMQW-0006qB-UF; Mon, 07 Dec 2020 19:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46965.83170; Mon, 07 Dec 2020 19:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmMQW-0006pm-RF; Mon, 07 Dec 2020 19:44:04 +0000
Received: by outflank-mailman (input) for mailman id 46965;
 Mon, 07 Dec 2020 19:44:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=exIY=FL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmMQW-0006ph-6X
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 19:44:04 +0000
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7cc4651e-e410-4240-ab33-d5746eea059b;
 Mon, 07 Dec 2020 19:44:03 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id a9so19790928lfh.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 11:44:03 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f27sm2948599lfq.188.2020.12.07.11.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 11:44:01 -0800 (PST)
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
X-Inumbo-ID: 7cc4651e-e410-4240-ab33-d5746eea059b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=oOFrFJgwhDSVVW1x6xs5kZDbwNY0kgio3YF5vXX7VTM=;
        b=I2ddpwdVV+NDWK7Gan5jGmGFIhQX6QNOUxGzhqI430+C2nMKBTWAWWR6BGWuOLNnR2
         z0q/dSlF4DOWfGXhP3eah9oYaI1R2epnzmNrMTjuifdjvi04LlKkyrUslBffISdaS/bA
         KDJVTG8ulMfNKirnhHrvjofE6KHNWT5MVFGDrRm/MmjTysamtnyo4gZNsr9k9sEIJzwz
         aeoVmJSR6NXte5I2+kRm9o0WSXUb0QJNo54GrWz8PaiBBcNw80E6xBrs9Lr9HVlx2964
         29Ja7F0GRCVd7NSdbyBwVp4Ub0b0n078hOOaEHmABR3vxYPD51wnXCqIo6yB3QxMBCN9
         gJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=oOFrFJgwhDSVVW1x6xs5kZDbwNY0kgio3YF5vXX7VTM=;
        b=h0LZxttZDvMqez0gx4CHkzWxJDf+eQd8o1xjZYzyWhgHSNYodORsvmqv5FKtesoBu5
         PuN7w/9QVhsMvV6AltMQmXzuaxCmJQLkM+37LMOt19qTTkk0TTVUmoxtPo3mEQ7dzvFB
         2WZpUmC5EZwV6MvXmsd9rR6w9K6l8x3Iq+d76JQbMc+A41Frn7ecLCGDjpYimrfZVecJ
         GxlOgpLCIXFfkepYYMa2qxRyyC4tJ0GKl3yTbVRzTWGfAIWC/SpdGaD6JlfrtXYRMj4B
         HbDkQrYdnmrVbVcVxRyORwL89SwODbA2UYb17qf7FAeOW1QzS20GmFi5cmjcRoTy7nuR
         iUxA==
X-Gm-Message-State: AOAM533bSIKdGV9fAW+nWJXyMvMEZ7mSDm4j42BVXXVMUVxs9k+AMmZF
	7R9F5Qw6S573pY20iUSDd96yNbEoshpbaw==
X-Google-Smtp-Source: ABdhPJzsEluSllECrjvXudw0KliXpu5hqU4UmBOSoMXDdKDVaMuvwJICX8d/KCJWYq7V9hzYo1zq/Q==
X-Received: by 2002:a05:6512:3243:: with SMTP id c3mr8713331lfr.371.1607370241928;
        Mon, 07 Dec 2020 11:44:01 -0800 (PST)
Subject: Re: [PATCH V3 04/23] xen/ioreq: Make x86's IOREQ feature common
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, Tim Deegan
 <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-5-git-send-email-olekstysh@gmail.com>
 <d1fdebe9-3355-fece-e9dc-e6a7acc180e7@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <4a82d6f3-6b6c-566a-6ad0-36e22df323fa@gmail.com>
Date: Mon, 7 Dec 2020 21:43:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d1fdebe9-3355-fece-e9dc-e6a7acc180e7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.12.20 13:41, Jan Beulich wrote:

Hi Jan

> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>> --- a/xen/include/asm-x86/hvm/ioreq.h
>> +++ b/xen/include/asm-x86/hvm/ioreq.h
>> @@ -19,8 +19,7 @@
>>   #ifndef __ASM_X86_HVM_IOREQ_H__
>>   #define __ASM_X86_HVM_IOREQ_H__
>>   
>> -#define HANDLE_BUFIOREQ(s) \
>> -    ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
>> +#include <xen/ioreq.h>
> Is there a strict need to do it this way round? Usually the common
> header would include the arch one ...
The reason was to make a bunch of x86 files (which included 
asm/hvm/ioreq.h so far) to not suffer from moving IOREQ interface location
and as the result to limit the number of files which needed touching. If 
a common rule is to another way around, I will follow it.
So will change to include arch header from the common one. Or even will 
include arch header only where it is required (common ioreq.c right now 
and Arm io.c in future).


>> @@ -38,42 +37,6 @@ int arch_ioreq_server_get_type_addr(const struct domain *d,
>>                                       uint64_t *addr);
>>   void arch_ioreq_domain_init(struct domain *d);
> As already mentioned in an earlier reply: What about these? They
> shouldn't get declared once per arch. If anything, ones that
> want to be inline functions can / should remain in the per-arch
> header.
Don't entirely get a suggestion. Is the suggestion to make "simple" ones 
inline? Why not, there are a few ones which probably want to be inline, 
such as the following for example:
- arch_ioreq_domain_init
- arch_ioreq_server_destroy
- arch_ioreq_server_destroy_all
- arch_ioreq_server_map_mem_type (probably)


-- 
Regards,

Oleksandr Tyshchenko


