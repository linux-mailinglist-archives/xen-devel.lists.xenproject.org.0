Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA34D30748E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 12:17:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76918.139031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55Ho-000102-VN; Thu, 28 Jan 2021 11:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76918.139031; Thu, 28 Jan 2021 11:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55Ho-0000zd-SH; Thu, 28 Jan 2021 11:16:28 +0000
Received: by outflank-mailman (input) for mailman id 76918;
 Thu, 28 Jan 2021 11:16:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tEu6=G7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l55Hn-0000zH-6s
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 11:16:27 +0000
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03e5e06a-f198-48ac-b35c-6848957ab083;
 Thu, 28 Jan 2021 11:16:26 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id u4so4310655ljh.6
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 03:16:26 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b14sm1502419lff.16.2021.01.28.03.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 03:16:23 -0800 (PST)
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
X-Inumbo-ID: 03e5e06a-f198-48ac-b35c-6848957ab083
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=i5tc2X52sSSMSva2vn7V4s8vxxOKlqRmxyi8ISHJW1E=;
        b=uOdKJ1uMuDyZDFoZHDb1ZvOOlri9uVIuHj2ejcrSMF7pGmSFCjesLC18d98/It/QA0
         7huafXa9SGqne+fE1n4h6Yssa4vRe1uQHPkdE/TD0o1rt0EMO43LKkQJ7ab0SFSKBwp2
         p6itb1CuL+0ww+/GoGbBLmS9xiweJp7qTC5Zl4Jj0UmJCbktHYI/Q5yjP3BtCrOO4aIE
         UH0tRL3/LO727F8nNQmACeP6VcSsgPISzNhgCAeF6ME6ayjCw+JxNrJErpzM3x2Z0oAZ
         OBnH/R3cey+ZinA58IyMvrvy+K/um8leFumnanA3n63xJMqN+H1jmGa1velQ/eGiBYiS
         vtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=i5tc2X52sSSMSva2vn7V4s8vxxOKlqRmxyi8ISHJW1E=;
        b=MQc0tVVPVzhbyHofRBRXrE0nNc8g7NiEtm0eRQo4CtzkOU7QqpygRUX9cgX3+cjRfv
         1Ei2Rm53hn4xVelur1XXgv2uBf+UxRYg1OtoSaPF59prK5FR43KQoCbZFcjf/a1PlCIg
         VicK/f5G5auLB95nO9fPp5XwLG2lNHmn90bs9jaibTc8uNITlD+7Ur2mry6ytQz4YyAM
         T6hBoaquZ1Z838J7C1Ggs5NZJXw9u43dbsGu90tqxllRaz9oxPJIldNzK7QtJebz2jP1
         YsmeNWiA+mbWu6fEjR11q7Gy3ZxO8Pkr7FFTE09NUWjdwrozTC83gG1wV4+2m1Zpy3Cr
         6oFA==
X-Gm-Message-State: AOAM531ZGsmUqFMXdLT65N7gQueTllL8I0hWhCwMa3Tq5mTXfYPe0d40
	Th27g+/klvijOB2QGfOmZz+iFQsJ3Q7NWQ==
X-Google-Smtp-Source: ABdhPJzuv17IPE6Za59CT8PzLxXrRyhI6pUrc0MTLVCCqLNSp5RDp92ctc4r54eb/fk8jg5MEjDVLQ==
X-Received: by 2002:a2e:8887:: with SMTP id k7mr3672827lji.24.1611832584844;
        Thu, 28 Jan 2021 03:16:24 -0800 (PST)
Subject: Re: [PATCH V5 04/22] xen/ioreq: Make x86's IOREQ feature common
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-5-git-send-email-olekstysh@gmail.com>
 <01b122dd-37c9-d429-b060-adea9e7cae8b@suse.com>
 <b16bb4e2-fb26-f5e5-2417-86867241036a@gmail.com>
 <1eb1247b-f455-65c8-b91c-3e8bc05186a1@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <17d15bd5-87d3-5159-cb80-a54dbd8fb57d@gmail.com>
Date: Thu, 28 Jan 2021 13:16:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1eb1247b-f455-65c8-b91c-3e8bc05186a1@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 28.01.21 10:06, Jan Beulich wrote:

Hi Jan

> On 27.01.2021 21:14, Oleksandr wrote:
>> On 27.01.21 18:58, Jan Beulich wrote:
>>> On 25.01.2021 20:08, Oleksandr Tyshchenko wrote:
>>>> --- a/xen/arch/x86/Kconfig
>>>> +++ b/xen/arch/x86/Kconfig
>>>> @@ -92,6 +92,7 @@ config PV_LINEAR_PT
>>>>    
>>>>    config HVM
>>>>    	def_bool !PV_SHIM_EXCLUSIVE
>>>> +	select IOREQ_SERVER
>>>>    	prompt "HVM support"
>>>>    	---help---
>>> ... the addition moved below the prompt line (could probably
>>> be taken care of while committing, if no other need for a v6
>>> arises).
>> V6 is planned anyway, so will do, but ...
>>
>>
>>> (Personally I think this should be
>>>
>>> config HVM
>>> 	bool "HVM support"
>>> 	default !PV_SHIM_EXCLUSIVE
>> ... def_bool is changed to default by intention or this is a typo?
> No, it's not a typo. "def_bool" is just a shorthand for "bool"
> and "default", which is useful when there's no prompt, but
> gets abused (in my view at least) in a number of other cases.
> But as said ...
>
>>> anyway, but that's nothing you need to care about.)
> ... here.

ok, well, thank you, but FYI playing with default instead of def_bool I 
noticed the difference in behavior.

I don't understand why, but HVM option disappears from menuconfig 
somehow... Or I do something completely wrong...


>
>>>> --- /dev/null
>>>> +++ b/xen/include/asm-x86/ioreq.h
>>>> @@ -0,0 +1,37 @@
>>>> +/*
>>>> + * ioreq.h: Hardware virtual machine assist interface definitions.
>>>> + *
>>>> + * This is a wrapper which purpose is to not include arch HVM specific header
>>>> + * from the common code.
>>>> + *
>>>> + * Copyright (c) 2016 Citrix Systems Inc.
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modify it
>>>> + * under the terms and conditions of the GNU General Public License,
>>>> + * version 2, as published by the Free Software Foundation.
>>>> + *
>>>> + * This program is distributed in the hope it will be useful, but WITHOUT
>>>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>>>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>>>> + * more details.
>>>> + *
>>>> + * You should have received a copy of the GNU General Public License along with
>>>> + * this program; If not, see <http://www.gnu.org/licenses/>.
>>>> + */
>>>> +
>>>> +#ifndef __ASM_X86_IOREQ_H__
>>>> +#define __ASM_X86_IOREQ_H__
>>>> +
>>>> +#include <asm/hvm/ioreq.h>
>>>> +
>>>> +#endif /* __ASM_X86_IOREQ_H__ */
>>> Not necessarily for taking care of right away, I think in the
>>> longer run this wants wrapping by #ifdef CONFIG_HVM, such that
>>> in !HVM builds the dependency on the "chained" header goes
>>> away (reducing the amount of rebuilding in incremental builds).
>> I don't mind wrapping it right away.
> Well, if that doesn't break the !HVM build, I'd of course
> appreciate it. I'd expect fallout, though.

Hmm, I didn't notice a fallout with that change when CONFIG_HVM is not set

+#ifdef CONFIG_HVM
#include <asm/hvm/ioreq.h>
+#endif


>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


