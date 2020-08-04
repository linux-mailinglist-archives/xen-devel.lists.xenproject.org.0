Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D263223B9F6
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 13:52:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2vTi-000742-2O; Tue, 04 Aug 2020 11:51:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wGJY=BO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k2vTg-00073w-Gq
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 11:51:32 +0000
X-Inumbo-ID: 23fb40cd-9850-4833-9de9-03862019e94b
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23fb40cd-9850-4833-9de9-03862019e94b;
 Tue, 04 Aug 2020 11:51:31 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id s16so27992845ljc.8
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 04:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cxsqPnXRx7MzkEol47tQkkafzc9lF+bSt8dnruzqDso=;
 b=op1zwJalcODE4CkvOP4LoYmbJPHTGqQhQfRi0vSfZUa++oZlNr/esdbd/Q3fqQsW7k
 6n3XNPshWyC9bfNt6p6b0CuaWaki94oEZep7uQk42Vd7cekYEdW+3jMvbJx/GAbgp4x3
 CHSNd98bjhGRBQ8YUmYjtuPprh95noRWgGBkQ7GWDvOcz/BXY11TL7+dwSdP1r/g12HO
 6JUvaWTCg5cLoIQw7WjjbO5TC+nwV4MgYqVXCL7UMfGZPVhvp1zNerDmyJCib1VEj4cz
 ofwtlp7r+KUFtybmkl99FQ2wbGUoRFt6gZ8zl+d9mc1IphvRfrO6ws0DWS+JkipGsukr
 TyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cxsqPnXRx7MzkEol47tQkkafzc9lF+bSt8dnruzqDso=;
 b=rmZQFdESSnibfZlKsMKv3W0auFPY0cZwPde+0vd49hAIl26lrnxnCZpVVfh0mU/QnK
 MOZ2zpc26CM4FAAgw6oPldxpzI/hjTBjBwtKrlZXEdvJzBUmXzyz/C5k+8AIMKfCc4P+
 Mhzdk90NQgnrw0xNscukSWJwgCrY2Wuzknq/BPVJfPwHPcg1CCfj1s9uUvFQl/JAkt2Y
 l0iyKHszaQz8rY+P3NkdwkE9VVqOLUf13ZRpzbIDBU5VZ3H0NhaH8dVvK0Cmhmkod4yz
 1JdGfQZyuYB8fC3xc1UAbrIw5eoscS5vQ7U+tknbhW8PsWsuHR+Q8Dd7VJSP0anb5s75
 +C7w==
X-Gm-Message-State: AOAM5310ipAmIHNraq3BirUvXMNh5nCQ5npmC9J2W2lfKG1allugjqHL
 rR2G5G9VSWCHG5KAJvBmepc=
X-Google-Smtp-Source: ABdhPJzyX8Qg2dYRmmBdl6qDyiHqcjjHMnnhorkcIljRmkqTWWoBzL6AjynNywFYWPyE/WmgcHOe7w==
X-Received: by 2002:a2e:b16c:: with SMTP id a12mr9846687ljm.146.1596541890217; 
 Tue, 04 Aug 2020 04:51:30 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id c5sm930112lfb.24.2020.08.04.04.51.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2020 04:51:29 -0700 (PDT)
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: paul@xen.org, xen-devel@lists.xenproject.org
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <002101d66a51$b4c59070$1e50b150$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <396a0833-021c-c21a-1dcf-cc8bddd1f4a9@gmail.com>
Date: Tue, 4 Aug 2020 14:51:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <002101d66a51$b4c59070$1e50b150$@xen.org>
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
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 04.08.20 14:23, Paul Durrant wrote:
>>
>>> diff --git a/xen/include/xen/hvm/ioreq.h b/xen/include/xen/hvm/ioreq.h
>>>> new file mode 100644
>>>> index 0000000..40b7b5e
>>>> --- /dev/null
>>>> +++ b/xen/include/xen/hvm/ioreq.h
>>>> @@ -0,0 +1,89 @@
>>>> +/*
>>>> + * hvm.h: Hardware virtual machine assist interface definitions.
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
>>>> +#ifndef __HVM_IOREQ_H__
>>>> +#define __HVM_IOREQ_H__
>>>> +
>>>> +#include <xen/sched.h>
>>>> +
>>>> +#include <asm/hvm/ioreq.h>
>>>> +
>>>> +#define GET_IOREQ_SERVER(d, id) \
>>>> +    (d)->arch.hvm.ioreq_server.server[id]
>>>> +
>>>> +static inline struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
>>>> +                                                        unsigned int id)
>>>> +{
>>>> +    if ( id >= MAX_NR_IOREQ_SERVERS )
>>>> +        return NULL;
>>>> +
>>>> +    return GET_IOREQ_SERVER(d, id);
>>>> +}
>>>> +
>>>> +static inline bool hvm_ioreq_needs_completion(const ioreq_t *ioreq)
>>>> +{
>>>> +    return ioreq->state == STATE_IOREQ_READY &&
>>>> +           !ioreq->data_is_ptr &&
>>>> +           (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
>>>> +}
>>> I don't think having this in common code is correct. The short-cut of not completing PIO reads seems
>> somewhat x86 specific. Does ARM even have the concept of PIO?
>>
>> I am not 100% sure here, but it seems that doesn't have.
>>
>> Shall I make hvm_ioreq_needs_completion() per arch? Arm variant would
>> have the same implementation, but without "ioreq->type !=
>> IOREQ_TYPE_PIO" check...
>>
> With your series applied, does any common code actually call hvm_ioreq_needs_completion()? I suspect it will remain x86 specific, without any need for an Arm variant.
Yes, it does. Please see common usage in hvm_io_assist() and 
handle_hvm_io_completion() (current patch) and usage in Arm code 
(arch/arm/io.c: io_state try_fwd_ioserv) [1]


[1] 
https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg00072.html


-- 
Regards,

Oleksandr Tyshchenko


