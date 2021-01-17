Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2682F9206
	for <lists+xen-devel@lfdr.de>; Sun, 17 Jan 2021 12:33:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69211.123887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l16IT-0006NL-Lw; Sun, 17 Jan 2021 11:32:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69211.123887; Sun, 17 Jan 2021 11:32:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l16IT-0006Mw-ID; Sun, 17 Jan 2021 11:32:41 +0000
Received: by outflank-mailman (input) for mailman id 69211;
 Sun, 17 Jan 2021 11:32:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i0Xk=GU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l16IS-0006Mr-D2
 for xen-devel@lists.xenproject.org; Sun, 17 Jan 2021 11:32:40 +0000
Received: from mail-lj1-x229.google.com (unknown [2a00:1450:4864:20::229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 138343c9-d9f7-4f84-9615-c086514206c3;
 Sun, 17 Jan 2021 11:32:39 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id y22so15251429ljn.9
 for <xen-devel@lists.xenproject.org>; Sun, 17 Jan 2021 03:32:38 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id a15sm1356339lji.105.2021.01.17.03.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 03:32:37 -0800 (PST)
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
X-Inumbo-ID: 138343c9-d9f7-4f84-9615-c086514206c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ldxdtDOQnoj/q6lmNtH8IwQon9WVr4uEo5ktJPmzOSc=;
        b=NBWWWDbKlsrg5jd7xHNdWLNiZHT5hLsmCFJmu94JPRwYeaWd8ysbMUcZUTyIJa4XIF
         fUrTMcuYEQU28mX2NTiC/9v3i8+no76ladRbM09oiN7tqOxY2RQ/G92hzOxPvNF+1h+5
         ADMXOEfpKQLkcrydZl6MnQqgYWxBRCEeAYezj5my08kOLwjrERtGcpQVHL3PZ2ZMAKC3
         BePzlsfRgDchRvnXwu2r08/ZVX2CyprhUAzgFIOXz8qHJ1VCcNPm3So76U6oRwqEBZYi
         lbBeotnKlYF07y1+lErJQ6o0r1W3bofLSGA7j5lCho5GMHvoctzcfCgPK6G1AtcS26rS
         NfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ldxdtDOQnoj/q6lmNtH8IwQon9WVr4uEo5ktJPmzOSc=;
        b=G04/v7Vtf2og5jiGjSGkF+RdzrNIbuKVZPdnallpQEm+Mp8a/BxuXka+df3a/ig3o9
         z3H2CzOFIFsZoDnEuLCPlSWADFR+svIaO+r82362EU3iUyAkqnb0mJdsRipCg0k3pNe7
         TFs+xp3f+yFCkPa/MqD1C2QXqsYjUVoC4D+5S9dLLntXPBwiJkZ5mi78QOgWCvTYhVPG
         eWtWMMxqTPi6rZnZagRATyhH8YK638Rcz/S7JNjn3qcOdslD+a8CGp9ubtUyLPA5OiiK
         lRxIK0GHHu+hMGqYUTNsp3pXbJi/HWWbhWtlGn898boF57NKBd3++oBW3dcWPFrVz+03
         a5VQ==
X-Gm-Message-State: AOAM532OQEPhGMDFB8sP/n923nwmWCqenPdgTWzk7RxmCUnV8uX5kh3M
	gcUMHHU9eYywDQKaNY1hq5k=
X-Google-Smtp-Source: ABdhPJxdld3nEBPJjRVnyunzRCONpJQLUMLc1lHkuBnbjR44zzGcnQrDwmWFCjimI/V+KX37JuD9NA==
X-Received: by 2002:a2e:95ca:: with SMTP id y10mr8837709ljh.440.1610883157874;
        Sun, 17 Jan 2021 03:32:37 -0800 (PST)
Subject: Re: [PATCH V4 13/24] xen/ioreq: Use guest_cmpxchg64() instead of
 cmpxchg()
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-14-git-send-email-olekstysh@gmail.com>
 <a31ac1ae-7933-c738-238e-8dcb7e5409a8@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <3d6c6689-6f0b-131a-ece2-1c5d861e0ae3@gmail.com>
Date: Sun, 17 Jan 2021 13:32:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a31ac1ae-7933-c738-238e-8dcb7e5409a8@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 15.01.21 21:37, Julien Grall wrote:
> Hi Oleksandr,


Hi Julien


>
> On 12/01/2021 21:52, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The cmpxchg() in ioreq_send_buffered() operates on memory shared
>> with the emulator domain (and the target domain if the legacy
>> interface is used).
>>
>> In order to be on the safe side we need to switch
>> to guest_cmpxchg64() to prevent a domain to DoS Xen on Arm.
>>
>> As there is no plan to support the legacy interface on Arm,
>> we will have a page to be mapped in a single domain at the time,
>> so we can use s->emulator in guest_cmpxchg64() safely.
>
> I think you want to explain why you are using the 64-bit version of 
> helper.

The point to use 64-bit version of helper is to support Arm32 since the 
IOREQ code uses cmpxchg() with 64-bit value.

I will update patch description.


>
>>
>> Thankfully the only user of the legacy interface is x86 so far
>> and there is not concern regarding the atomics operations.
>>
>> Please note, that the legacy interface *must* not be used on Arm
>> without revisiting the code.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien.grall@arm.com>
>> [On Arm only]
>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> Changes RFC -> V1:
>>     - new patch
>>
>> Changes V1 -> V2:
>>     - move earlier to avoid breaking arm32 compilation
>>     - add an explanation to commit description and hvm_allow_set_param()
>>     - pass s->emulator
>>
>> Changes V2 -> V3:
>>     - update patch description
>>
>> Changes V3 -> V4:
>>     - add Stefano's A-b
>>     - drop comment from arm/hvm.c
>> ---
>>   xen/common/ioreq.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
>> index d233a49..d5f4dd3 100644
>> --- a/xen/common/ioreq.c
>> +++ b/xen/common/ioreq.c
>> @@ -29,6 +29,7 @@
>>   #include <xen/trace.h>
>>   #include <xen/vpci.h>
>>   +#include <asm/guest_atomics.h>
>>   #include <asm/hvm/ioreq.h>
>>     #include <public/hvm/ioreq.h>
>> @@ -1185,7 +1186,7 @@ static int ioreq_send_buffered(struct 
>> ioreq_server *s, ioreq_t *p)
>>             new.read_pointer = old.read_pointer - n * 
>> IOREQ_BUFFER_SLOT_NUM;
>>           new.write_pointer = old.write_pointer - n * 
>> IOREQ_BUFFER_SLOT_NUM;
>> -        cmpxchg(&pg->ptrs.full, old.full, new.full);
>> +        guest_cmpxchg64(s->emulator, &pg->ptrs.full, old.full, 
>> new.full);
>>       }
>>         notify_via_xen_event_channel(d, s->bufioreq_evtchn);
>>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


