Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D05273257
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 21:02:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKR4q-000121-Fr; Mon, 21 Sep 2020 19:02:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KPbg=C6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kKR4o-00011r-P5
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 19:02:14 +0000
X-Inumbo-ID: 636b2941-0811-4ef4-8d8c-7fd16fb09955
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 636b2941-0811-4ef4-8d8c-7fd16fb09955;
 Mon, 21 Sep 2020 19:02:13 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id s205so12006876lja.7
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2020 12:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ijZOlO2Rfpi09mL9oVBSL3/eRpBDJFTM5bwVyxnVYo0=;
 b=nTFMelTgZu1/mdNY1vSSXnTc7q+YOrtBmGYLJUD0hl9d2QYc2undxS5AP8pLMwJ5nW
 +lqBc1l1kHIEAvqz1P3pew2QTFf14TZPHbY3ZfIrLA3s9+Kbcd+P6IuLONcy29PL+q46
 7CVIiJVdnumWpcob62gNXj8e+Nk2SzO/2IiC2CFKwpyXsWIxokjGoQ679ZNEpA5NoU0e
 oThI7qrLRIXzz23auNDGl70Qo/LbzB3MDujPrEziKGanG8Mpn0Js7d9oHalYmUHcfn8E
 GGoheAYkcmPQL9xQq/mioFZT12SAeSmUuPoI2V62HrrbG4n3kINF9rRj7cJ4FHc0Abvm
 rDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ijZOlO2Rfpi09mL9oVBSL3/eRpBDJFTM5bwVyxnVYo0=;
 b=BXaIclsNmw4p4sCu0yYCqWHszj0ygmPMVTlM+gf/7VTMO1VDi40ZUjo9ftWZsusIZ7
 unVGqDyuhgU5AQK3Nese3sUB9eth2vIIV8iYwYo6QcQQCHM06ckQpVeMYy57EcFvGrnj
 RGoDsg98w783LMo9Op51awWARhRb4InqriCrXkMCyRD1HkatsOjz81ZCiMw0Tqb8Kxre
 c/1KgvSFaV9ttgOR2Yh8yS+7GkqApyEhXW8O4ez4JVuWlmLOAtD60JmP/ATKz4wVNs4c
 OVkr0yCyX8bFNGFMImWiszBq7Nq1YNnxTpmL+y1tHvZF0MUC6I9fEZavtD+OwI1aMbPa
 rnww==
X-Gm-Message-State: AOAM5301ogEQ348EzLQVg6islOwBEIZr8Z4pZAXAowIAG8CFJrawKBlL
 A2WlfHgp2GpodKJG5oAO8B0=
X-Google-Smtp-Source: ABdhPJwEe2LYQAQikqfenm4p7AO7FF8RqqurGw2n9fqfGvZViYUcgwmBmn83qwGYzmQRljlpwWG/QA==
X-Received: by 2002:a2e:9655:: with SMTP id z21mr331757ljh.410.1600714932478; 
 Mon, 21 Sep 2020 12:02:12 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id p27sm2745574lfo.272.2020.09.21.12.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 12:02:11 -0700 (PDT)
Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-3-git-send-email-olekstysh@gmail.com>
 <7de88222-1a45-7bff-0b45-95f76b4ec019@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <51856cdc-54b4-3d39-bd7b-1b6ac3fc1736@gmail.com>
Date: Mon, 21 Sep 2020 22:02:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7de88222-1a45-7bff-0b45-95f76b4ec019@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 14.09.20 17:17, Jan Beulich wrote:

Hi Jan

> On 10.09.2020 22:21, Oleksandr Tyshchenko wrote:
>> ---
>>   MAINTAINERS                     |    8 +-
>>   xen/arch/x86/Kconfig            |    1 +
>>   xen/arch/x86/hvm/dm.c           |    2 +-
>>   xen/arch/x86/hvm/emulate.c      |    2 +-
>>   xen/arch/x86/hvm/hvm.c          |    2 +-
>>   xen/arch/x86/hvm/io.c           |    2 +-
>>   xen/arch/x86/hvm/ioreq.c        | 1425 +--------------------------------------
>>   xen/arch/x86/hvm/stdvga.c       |    2 +-
>>   xen/arch/x86/hvm/vmx/vvmx.c     |    3 +-
>>   xen/arch/x86/mm.c               |    2 +-
>>   xen/arch/x86/mm/shadow/common.c |    2 +-
>>   xen/common/Kconfig              |    3 +
>>   xen/common/Makefile             |    1 +
>>   xen/common/ioreq.c              | 1410 ++++++++++++++++++++++++++++++++++++++
> This suggests it was almost the entire file which got moved. It would
> be really nice if you could convince git to show the diff here, rather
> than removal and addition of 1400 lines.
>
> Additionally I wonder whether what's left in the original file wouldn't
> better become inline functions now. If this was done in the previous
> patch, the change would be truly a rename then, I think.
Last time when trying to make something inline in arch files for the RFC 
series (I don't remember exactly for what it was)
I got completely stuck with the build issues due to the header 
(inter-?)dependencies, which I failed to resolve).
Anyway I got your point and will try to experiment with that.


>
>> --- a/xen/include/asm-x86/hvm/ioreq.h
>> +++ b/xen/include/asm-x86/hvm/ioreq.h
>> @@ -19,41 +19,12 @@
>>   #ifndef __ASM_X86_HVM_IOREQ_H__
>>   #define __ASM_X86_HVM_IOREQ_H__
>>   
>> -bool hvm_io_pending(struct vcpu *v);
>> -bool handle_hvm_io_completion(struct vcpu *v);
>> -bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
>> +#include <asm/hvm/emulate.h>
>> +#include <asm/hvm/hvm.h>
>> +#include <asm/hvm/vmx/vmx.h>
> Are all three really needed here? Especially the last one strikes me as
> odd.

We can leave only #include <asm/hvm/emulate.h> here and move #include 
<asm/hvm/vmx/vmx.h> to x86/hvm/ioreq.c.
Also #include <asm/hvm/hvm.h> could be dropped.


>
>> --- /dev/null
>> +++ b/xen/include/xen/ioreq.h
>> @@ -0,0 +1,82 @@
>> +/*
>> + * ioreq.h: Hardware virtual machine assist interface definitions.
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
>> +#ifndef __IOREQ_H__
>> +#define __IOREQ_H__
> __XEN_IOREQ_H__ please.

ok


>
>> +#include <xen/sched.h>
>> +
>> +#include <asm/hvm/ioreq.h>
> Is this include really needed here (i.e. by the code further down in
> the file, and hence by everyone including this header), or rather
> just in a few specific .c files?
I think, just in few specific .c files. Which are x86/hvm/ioreq.c and 
common/ioreq.c now and several other files later on (x86/hvm/dm.c, 
arm/io.c, etc)
Shall I include that header in these files instead?


>
>> +#define GET_IOREQ_SERVER(d, id) \
>> +    (d)->arch.hvm.ioreq_server.server[id]
> arch.hvm.* feels like a layering violation when used in this header.
Got it. The only reason why GET_IOREQ_SERVER is here is inline 
get_ioreq_server(). I will make it non-inline and move both to 
common/ioreq.c.
I assume this layering violation issue applies for 
hvm_domain_has_ioreq_server() introduced in
[PATCH V1 11/16] xen/ioreq: Introduce hvm_domain_has_ioreq_server()


-- 
Regards,

Oleksandr Tyshchenko


