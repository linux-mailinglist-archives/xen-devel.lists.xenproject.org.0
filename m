Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A46123B937
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 13:10:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2upk-0003Ao-DS; Tue, 04 Aug 2020 11:10:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wGJY=BO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k2upi-0003Ah-N3
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 11:10:14 +0000
X-Inumbo-ID: d532daf4-e377-46dc-9366-bcc56b0d6e7c
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d532daf4-e377-46dc-9366-bcc56b0d6e7c;
 Tue, 04 Aug 2020 11:10:13 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id i19so22124517lfj.8
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 04:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Ksoj43CvYDuJ0ax1qMdn/6dI9ibScn834n5uBtJNwtA=;
 b=ktBXVwl/nF57n5ozgSZas7Ll72z8TNsbELx8BZiEK1vCTqi3xAV2Z56jJ49J131BE/
 SBoQjG9QfNtO3PdMzdJQfZtgl0PRJC5NTrkquT94KW+L3mO/Eva2Fm9noJgSGtS+IoEU
 RlLotDrg+vfNAOZyVuEmnqZSCU1u22tajKHIQRW2Fj0eahpf95FsfdwZ/y/hrZE7eEgw
 U6vTUIWCSauM111mkO42nwXeExNlNQNZAisoN1RicAZb+vASWC7Fn6Bd4Q96irFpCT3L
 x0LiNzZAhumJe7Wb1VKKdzRwIFKm1Dn66/oZCKHshft8sXh27jWcOCkemZAMkil9XnMC
 g2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Ksoj43CvYDuJ0ax1qMdn/6dI9ibScn834n5uBtJNwtA=;
 b=ZIjRSn3hKXrdX+zBsGZI0brTfNKnF9KzsHoasAvi2dPzWdnOW3JKRXRFmd6GIr/2Eb
 pVABt9hhsR4o+MKHOr4pjVx7IJyWyUsKQw1ZtrEjZN2Ocabnjfvw77cSYxQVCwhQuKZb
 CETvzETJR9heP/11eu6bklZkRQPJSIeXwKn6HYtlnJHinvlw6AdwIe91HBeHjUcTTkz+
 ihMNl5A1qB8QwseZNQoUQADBSIgc5jLKV+cAJyP40xxV+k8p3ydmodTUoj1kQbjuxPhT
 nOs0Adc8I3dS7unB7r7KFYWAikroBFW9pmwspkpJ472UO7+E/gFtu+UdadocBIDSafHG
 2uRQ==
X-Gm-Message-State: AOAM532LInNACIdApxlYzlairw9GHru0GkGvvtf7rf149V7MrMmw+cjo
 8oOrMNpYOj4iCdZbv9lACUw=
X-Google-Smtp-Source: ABdhPJwr95FotJusYXKFUd+/k22e9FbS3PVu5GDiKoYLd9cUXWQvWpq1T0g6MLegp0LM1hPLaQiYjA==
X-Received: by 2002:a19:f808:: with SMTP id a8mr10681202lff.62.1596539412477; 
 Tue, 04 Aug 2020 04:10:12 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t205sm6123016lff.8.2020.08.04.04.10.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2020 04:10:11 -0700 (PDT)
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: paul@xen.org, xen-devel@lists.xenproject.org
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
Date: Tue, 4 Aug 2020 14:10:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <000c01d66a33$2bd56510$83802f30$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 04.08.20 10:45, Paul Durrant wrote:

Hi Paul

>> -----Original Message-----
>> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
>> Sent: 03 August 2020 19:21
>> To: xen-devel@lists.xenproject.org
>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Jan Beulich <jbeulich@suse.com>; Andrew
>> Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Roger Pau Monné <roger.pau@citrix.com>;
>> George Dunlap <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Julien Grall
>> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Paul Durrant <paul@xen.org>; Jun
>> Nakajima <jun.nakajima@intel.com>; Kevin Tian <kevin.tian@intel.com>; Tim Deegan <tim@xen.org>; Julien
>> Grall <julien.grall@arm.com>
>> Subject: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> As a lot of x86 code can be re-used on Arm later on, this patch
>> splits IOREQ support into common and arch specific parts.
>>
>> This support is going to be used on Arm to be able run device
>> emulator outside of Xen hypervisor.
>>
>> Please note, this is a split/cleanup of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>   xen/arch/x86/Kconfig            |    1 +
>>   xen/arch/x86/hvm/dm.c           |    2 +-
>>   xen/arch/x86/hvm/emulate.c      |    2 +-
>>   xen/arch/x86/hvm/hvm.c          |    2 +-
>>   xen/arch/x86/hvm/io.c           |    2 +-
>>   xen/arch/x86/hvm/ioreq.c        | 1431 +--------------------------------------
>>   xen/arch/x86/hvm/stdvga.c       |    2 +-
>>   xen/arch/x86/hvm/vmx/realmode.c |    1 +
>>   xen/arch/x86/hvm/vmx/vvmx.c     |    2 +-
>>   xen/arch/x86/mm.c               |    2 +-
>>   xen/arch/x86/mm/shadow/common.c |    2 +-
>>   xen/common/Kconfig              |    3 +
>>   xen/common/Makefile             |    1 +
>>   xen/common/hvm/Makefile         |    1 +
>>   xen/common/hvm/ioreq.c          | 1430 ++++++++++++++++++++++++++++++++++++++
>>   xen/include/asm-x86/hvm/ioreq.h |   45 +-
>>   xen/include/asm-x86/hvm/vcpu.h  |    7 -
>>   xen/include/xen/hvm/ioreq.h     |   89 +++
>>   18 files changed, 1575 insertions(+), 1450 deletions(-)
>>   create mode 100644 xen/common/hvm/Makefile
>>   create mode 100644 xen/common/hvm/ioreq.c
>>   create mode 100644 xen/include/xen/hvm/ioreq.h
> You need to adjust the MAINTAINERS file since there will now be common 'I/O EMULATION' code. Since I wrote most of ioreq.c, please retain me as a maintainer of the common code.

Oh, I completely forgot about MAINTAINERS file. Sure, I will update file 
and retain you.


>
> [snip]
>> @@ -1528,13 +143,19 @@ static int hvm_access_cf8(
>>       return X86EMUL_UNHANDLEABLE;
>>   }
>>
>> -void hvm_ioreq_init(struct domain *d)
>> +void arch_hvm_ioreq_init(struct domain *d)
>>   {
>>       spin_lock_init(&d->arch.hvm.ioreq_server.lock);
>>
>>       register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
>>   }
>>
>> +void arch_hvm_ioreq_destroy(struct domain *d)
>> +{
>> +    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
>> +        return;
> There's not really a lot of point in this. I think an empty function here would be ok.

ok


>> +struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
>> +                                                 ioreq_t *p)
>> +{
>> +    struct hvm_ioreq_server *s;
>> +    uint8_t type;
>> +    uint64_t addr;
>> +    unsigned int id;
>> +
>> +    if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
>> +        return NULL;
>> +
>> +    hvm_get_ioreq_server_range_type(d, p, &type, &addr);
> Looking at this, I think it would make more sense to fold the check of p->type into hvm_get_ioreq_server_range_type() and have it return success/failure.

ok, will update.


> diff --git a/xen/include/xen/hvm/ioreq.h b/xen/include/xen/hvm/ioreq.h
>> new file mode 100644
>> index 0000000..40b7b5e
>> --- /dev/null
>> +++ b/xen/include/xen/hvm/ioreq.h
>> @@ -0,0 +1,89 @@
>> +/*
>> + * hvm.h: Hardware virtual machine assist interface definitions.
>> + *
>> + * Copyright (c) 2016 Citrix Systems Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program; If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#ifndef __HVM_IOREQ_H__
>> +#define __HVM_IOREQ_H__
>> +
>> +#include <xen/sched.h>
>> +
>> +#include <asm/hvm/ioreq.h>
>> +
>> +#define GET_IOREQ_SERVER(d, id) \
>> +    (d)->arch.hvm.ioreq_server.server[id]
>> +
>> +static inline struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
>> +                                                        unsigned int id)
>> +{
>> +    if ( id >= MAX_NR_IOREQ_SERVERS )
>> +        return NULL;
>> +
>> +    return GET_IOREQ_SERVER(d, id);
>> +}
>> +
>> +static inline bool hvm_ioreq_needs_completion(const ioreq_t *ioreq)
>> +{
>> +    return ioreq->state == STATE_IOREQ_READY &&
>> +           !ioreq->data_is_ptr &&
>> +           (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
>> +}
> I don't think having this in common code is correct. The short-cut of not completing PIO reads seems somewhat x86 specific. Does ARM even have the concept of PIO?

I am not 100% sure here, but it seems that doesn't have.

Shall I make hvm_ioreq_needs_completion() per arch? Arm variant would 
have the same implementation, but without "ioreq->type != 
IOREQ_TYPE_PIO" check...

-- 
Regards,

Oleksandr Tyshchenko


