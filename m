Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA55305771
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 10:55:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75901.136840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hXK-0000Iv-Ui; Wed, 27 Jan 2021 09:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75901.136840; Wed, 27 Jan 2021 09:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hXK-0000IV-Ra; Wed, 27 Jan 2021 09:54:54 +0000
Received: by outflank-mailman (input) for mailman id 75901;
 Wed, 27 Jan 2021 09:54:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kelV=G6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l4hXJ-0000IP-D0
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 09:54:53 +0000
Received: from mail-lj1-x233.google.com (unknown [2a00:1450:4864:20::233])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c3ee6b5-3cf5-43ea-aa85-528dd36b7ac7;
 Wed, 27 Jan 2021 09:54:52 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id r14so1364604ljc.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 01:54:52 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id p5sm374306lfc.300.2021.01.27.01.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 01:54:50 -0800 (PST)
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
X-Inumbo-ID: 5c3ee6b5-3cf5-43ea-aa85-528dd36b7ac7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=YvozFcyC0Wnt7SDiv/ISUZS544PsgCH2wb+767XLSjI=;
        b=dAtBir0jmIkaFKHrwWG81swC+mXcJCeGE7nnSeS7dgzd7zNS1HeuWVfOu3IYnzzwxE
         Qoq0s0ryFHUHshTxwHbEIKfHonWsVFCYQKnojlycSz7QXMPKCL70HgLhVtCdN7xBUxpc
         op5hKkYwFfUZWha3r1SkkmdFgXADq6z+PiLO6EiBKq06i9xXVA67RQ+nReaVnNWA67mN
         R9LYceimER5BueiUZrW3z4fKcM6uRedFTkj6tLf5BHd9kfm6Xdjo5V0xQrKKF4m/+gA3
         N9oPDcIwLl/4v6HKklF2owobllY9cxHOqEUFQSxAOWeZkp10Vudnizd6KB4/IlAcX+75
         bvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=YvozFcyC0Wnt7SDiv/ISUZS544PsgCH2wb+767XLSjI=;
        b=H8Mv10Ax95f2qNAdYaJw5jjB+ES6oHo2LXaGbLZDO/Q8NvI7fAPiuS6Sfbjcrq8yqX
         mocIpRyi1ECuLx2Zmcjprfur4XEQQ6WU0p6gD91vUSGFnDbBRJgogmlbTSr2D1ywy5gV
         SyNA5VyOKJFRjIkCv+75BOhU0ylJBkLgDlO+31Fx0vhU+jVUnFktklhDT+/Q8Ues4uNd
         g1QjrPbWmAL2kPlpwGQV9DH2ielSZCzoU1fp7MSdB8NyPhxQ7YwyiZSQwG3DPbaV6a2f
         xXP66yVpRRvqaa4XP0yyPCAqDfokowu/tH7NQuaWdifHXzWJCXsDiijmdSm9+VoeOFrn
         bc8A==
X-Gm-Message-State: AOAM530O9tQVU2Pz5fLri69ZkGxae3oQToSm7P7XfqwnoC2kFQgVGymU
	k6bP+T8G/32tXf1qJM6cMgkpwiqW9XP5Lg==
X-Google-Smtp-Source: ABdhPJzbeSvgXJ6AussZQsEQ4PgTQXcbAJz23JWIJE1Oe3H/hWGGyO8g71gpjo1M9AiZv+E8PIAs9g==
X-Received: by 2002:a2e:9bc7:: with SMTP id w7mr5552231ljj.310.1611741290999;
        Wed, 27 Jan 2021 01:54:50 -0800 (PST)
Subject: Re: [PATCH V5 14/22] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-15-git-send-email-olekstysh@gmail.com>
 <ff05bfd8-150a-1dbc-8c25-c922ee863146@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <9016d379-2b79-0b1c-ff25-9c5f7284e3c9@gmail.com>
Date: Wed, 27 Jan 2021 11:54:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ff05bfd8-150a-1dbc-8c25-c922ee863146@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 26.01.21 11:15, Jan Beulich wrote:

Hi Jan

> On 25.01.2021 20:08, Oleksandr Tyshchenko wrote:
>> --- a/xen/include/xen/dm.h
>> +++ b/xen/include/xen/dm.h
>> @@ -19,6 +19,8 @@
>>   
>>   #include <xen/sched.h>
>>   
>> +#include <public/hvm/dm_op.h>
>> +
>>   struct dmop_args {
>>       domid_t domid;
>>       unsigned int nr_bufs;
> How come this becomes necessary at this point in the series, when
> nothing else in this header changes, and nothing changes in the
> public headers at all? Is it perhaps a .c file that needs the
> #include instead? Headers shouldn't pull in other headers without
> clear need - as indicated in reply to a prior version, we have
> way too many bad examples (causing headaches in certain cases),
> and we'd like to avoid gaining more.

Yes, I understand this and completely agree. I remember last discussion 
on that, this is not forgotten. The only reason I made this (non 
entirely correct) change is to make
series compilable on Arm with IOREQ support enabled. If I considered 
this change as a correct one I would make it from the very beginning (in 
patch #9 which adds this common header)...
I added remark to draw reviewer's attention on the fact that I got stuck 
with resolving that, what I did wrong and how it should be done 
properly. The problem is that I didn't manage to make it properly.

Of course, I tried to include it directly by dm.c, but this didn't help 
much without violating "alphabetical order" rule. Details here:
https://lore.kernel.org/xen-devel/e0bc7f80-974e-945d-4605-173bd05302af@gmail.com/

I would appreciate any input on that.

> (Oh, I notice you actually
> have a post-commit-message remark about this, but then this
> patch should be marked RFC until the issue was resolved.)

Agree, I should have marked this patch as RFC to avoid misunderstanding.


-- 
Regards,

Oleksandr Tyshchenko


