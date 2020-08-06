Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC1623DCE2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 18:58:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3jCk-0002hB-6e; Thu, 06 Aug 2020 16:57:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTjn=BQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k3jCi-0002gf-JV
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 16:57:20 +0000
X-Inumbo-ID: 5de44ed9-0a5b-4eff-9dbb-453693d2fb70
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5de44ed9-0a5b-4eff-9dbb-453693d2fb70;
 Thu, 06 Aug 2020 16:57:19 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id z14so14982439ljm.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2020 09:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=4qV6lUrNuALPJYj9m7qEjE220AEOLRVX5YbSyC4XAio=;
 b=oGVOb19DcQKszsJ6FntN0KTnw/p+sNSZLaNbgmitgAJrNaL0oSanHoyvL2V2tLT/1j
 F5//KIg4mn5D41FQqZWMuusG2ME0UuoSiJK87XX6QgDtI/CZQy73j2M8dVGwye0bMLdA
 6tUWAbA4JTZr1jxz+b7UblA0q7eiPOKegk7bydaAyNupadMljXYBI7C/vTZr2NEbAhEe
 DB3SyD26XSwP7nAwx1fTKNY3CDgtam/Y+LOmWqtSdCZc/gGQycbzgzeDLoMHGrgRX7r6
 l7H49Qeqzqkh1bMDUHhLzQqRI86C5DB7OBrw+FC3cYKyCq/CFxrzPwHfJoSoUCD6JXWu
 pZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4qV6lUrNuALPJYj9m7qEjE220AEOLRVX5YbSyC4XAio=;
 b=Lc8WV48F/iwNfsimQgUqUFqOF1+l7TicDzZAMgnSp9Q2q66V0T82uVrG3ZR2R5h2Yz
 O1ae/vO9cQ9HlLR+hzIW2VHpjwVAffUKeImAY67ZVF0lXwZwl+lT9z3wa4Mi8fpuMCWR
 x25U+1dwq5DQLLCL2a9gYZOXLTgHivznvEL7T7CMHb+MuVNqAcf9K8CHXgHokNgdX0OE
 E1dRxQw9LhvqcVr5w2Gm1LVU/QkEiQxDnx5IXusTvwHJ7bUuyfQJJ8jo/eIoWAUxVqMd
 1CMMud/4pQ+fYGtEO9gLVmkGxyEiVGUlYq1jn7mwjCw/RV0W/PdhKRZ7VLyFmiZ1Z6+N
 hNsQ==
X-Gm-Message-State: AOAM530ODQ3OJ3DNwSjOXcfAb04uR15yHt2zvEmGbkl85aTupXRCdjoy
 uh63YiM/j4b4LC34SLHZaJw=
X-Google-Smtp-Source: ABdhPJzXJz2noTKioWXqsb7e/poKnbAn+qTf4RRcrgnXbvrgBF5Rxiv4+O3HGjveFX6IE24dpBOmWQ==
X-Received: by 2002:a2e:a316:: with SMTP id l22mr2262606lje.301.1596733038503; 
 Thu, 06 Aug 2020 09:57:18 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id w19sm2668465ljd.112.2020.08.06.09.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 09:57:18 -0700 (PDT)
Subject: Re: [RFC PATCH V1 08/12] xen/arm: Invalidate qemu mapcache on
 XENMEM_decrease_reservation
To: Jan Beulich <jbeulich@suse.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-9-git-send-email-olekstysh@gmail.com>
 <21b7d8ed-f305-8abe-0e4e-174d72d087c8@suse.com>
 <ce4076ae-705d-e24d-831a-6898d93a4040@xen.org>
 <04cfd6e4-1ed0-52c3-a3b0-d555d9dc632b@suse.com>
 <0ff0807f-c5d3-f63c-d54c-860648ef3a13@gmail.com>
 <52549e1a-d29b-d2c5-8173-e44dbd67d04f@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <343fa576-0575-c7cc-1097-6a463c3662dd@gmail.com>
Date: Thu, 6 Aug 2020 19:57:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <52549e1a-d29b-d2c5-8173-e44dbd67d04f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 06.08.20 19:33, Jan Beulich wrote:

Hi Jan.

> On 06.08.2020 16:28, Oleksandr wrote:
>> On 06.08.20 14:50, Jan Beulich wrote:
>>
>> Hi Jan
>>
>>>>> On 03.08.2020 20:21, Oleksandr Tyshchenko wrote:
>>>>>> --- a/xen/common/memory.c
>>>>>> +++ b/xen/common/memory.c
>>>>>> @@ -1652,6 +1652,12 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>>             break;
>>>>>>         }
>>>>>>     
>>>>>> +    /* x86 already sets the flag in hvm_memory_op() */
>>>>>> +#if defined(CONFIG_ARM64) && defined(CONFIG_IOREQ_SERVER)
>>>>>> +    if ( op == XENMEM_decrease_reservation )
>>>>>> +        curr_d->arch.hvm.qemu_mapcache_invalidate = true;
>>>>>> +#endif
>>>>> Doesn't the comment already indicate a route towards an approach
>>>>> not requiring to alter common code?
>>>> Given that IOREQ is now moved under common/, I think it would make sense
>>>> to have this set in common code as well for all the architecture.
>>>>
>>>> IOW, I would suggest to drop the #ifdef CONFIG_ARM64. In addition, we
>>>> may want to introduce an helper to check if a domain is using ioreq.
>>> Of course, with the (part of the) conditional dropped and the struct
>>> field moved out of the arch sub-struct, this is fine to live here.
>> ok.
>>
>>
>> I suspect this should *also* live in compat_memory_op(). Please confirm
>> whether my understanding correct.
> Doesn't compat_memory_op() simply call here, so will have the flag set
> as needed?
Indeed, sorry for the noise.


-- 
Regards,

Oleksandr Tyshchenko


