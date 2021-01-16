Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF49F2F8C5E
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jan 2021 10:05:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68936.123537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0hWH-00059w-Ac; Sat, 16 Jan 2021 09:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68936.123537; Sat, 16 Jan 2021 09:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0hWH-00059X-7P; Sat, 16 Jan 2021 09:05:17 +0000
Received: by outflank-mailman (input) for mailman id 68936;
 Sat, 16 Jan 2021 09:05:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WXL7=GT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l0hWG-00059S-7h
 for xen-devel@lists.xenproject.org; Sat, 16 Jan 2021 09:05:16 +0000
Received: from mail-lj1-x232.google.com (unknown [2a00:1450:4864:20::232])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4285e30c-e78c-4d94-9463-1dd7b38b90d0;
 Sat, 16 Jan 2021 09:05:14 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id e7so12947447ljg.10
 for <xen-devel@lists.xenproject.org>; Sat, 16 Jan 2021 01:05:14 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k23sm1005115lji.101.2021.01.16.01.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 01:05:13 -0800 (PST)
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
X-Inumbo-ID: 4285e30c-e78c-4d94-9463-1dd7b38b90d0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=OyDhkoMvKlgVxvO2fbQrVyL1DgnNKjlHod+ahVB8Tag=;
        b=RQrTOltbVjDX6DsCElvyepb88z0E9a+DfewZnOOGowaFUq5/HJZ4ZrObJb9bOsI/mK
         UN8AK4ifczg+UZrIEn3xrur2J2HOQa1RjXp3OsSANVSISqcfbZQvaYhSq/10ckUosgeB
         pthUsshixYxpBoWZGIV8L6FTqzfXVRNmnlPCdXhKOrrSxAlv90fx9oi97PSjMmC4s7y1
         xCkSmSIsPTzG43nay2b7e1flBstkZHAtdp7SNOwdK7JqyugmAEXt+Edd8F1OItNmrhmy
         /qx1+fEiJ09EHlHjqvHsH9ncp0m1sYnHldolpcGsjHqrOhPxtDvxFP3pSToCZ1ib/5iK
         YKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=OyDhkoMvKlgVxvO2fbQrVyL1DgnNKjlHod+ahVB8Tag=;
        b=gn/Qza+OKx58vRjeoUW7NwdgrkNKC1B7uBDNx0KH+B4X/tyVpAMy81lOV5Q8VxoCDi
         wzARP99eBHhffGw+VIGv3Ljn7Ik7hY7Zr7duFcRM6mTj3ULHHBZTz+9TcoZT9r9qMsdw
         dYr3N1goaDPx7WkKdMmy66r1V4GKUCgPD1G7ZU8QF2ZrpuEJf0OQVhJPU0UrRQyXZfw5
         XO6ZdisRfqFYOdq6xCg+wrkC3HEvEz05FaCGWUV/cEeastO1aiAXJnVO9EzdOm3XfEPy
         zhBmJNRUOBnOk47Uvb6xCueys+AUpHqz1GJ4C/VYrelbNIwjQh40sqLhuljwgzrMH6IO
         tNvw==
X-Gm-Message-State: AOAM531pROTwYIj/7mjgvFx7oF8mMWVtVw/99L/PQHQ6h+nh/Sm7SRvC
	sq/f6Wy1EiVtkmZT4GHtoi8=
X-Google-Smtp-Source: ABdhPJy7tQjrEhYB4KKzUXVi6a/acI7bCcZKodJHzE3i64BKF18ewaYprCB1Nr67ClOcGyv9GGMkwg==
X-Received: by 2002:a2e:b550:: with SMTP id a16mr7107610ljn.408.1610787913675;
        Sat, 16 Jan 2021 01:05:13 -0800 (PST)
Subject: Re: [PATCH V4 24/24] [RFC] libxl: Add support for virtio-disk
 configuration
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-25-git-send-email-olekstysh@gmail.com>
 <24576.32117.495663.489430@mariner.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <bb56b81b-fc7e-64cd-e220-a42c88a9ea02@gmail.com>
Date: Sat, 16 Jan 2021 11:05:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24576.32117.495663.489430@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Hi Ian


On 14.01.21 19:20, Ian Jackson wrote:
> Oleksandr Tyshchenko writes ("[PATCH V4 24/24] [RFC] libxl: Add support for virtio-disk configuration"):
>> This patch adds basic support for configuring and assisting virtio-disk
>> backend (emualator) which is intended to run out of Qemu and could be run
>> in any domain.
> Thanks.  I think this is a very important feature.  But I think this
> part at least needs some work.  (That's not inappropriate for an RFC
> patch - so please don't feel you have done anything wrong.  I hope you
> will find my comments constructive.)

ok


>
>
>> An example of domain configuration (two disks are assigned to the guest,
>> the latter is in readonly mode):
>>
>> vdisk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3;ro:/dev/mmcblk1p3' ]
> I can see why you have done it like this but I am concerned that this
> is not well-integrated with the existing disk configuration system.
>
> As a result not only is your new feature lacking support for many
> existing libxl features (block backend scripts, cdroms tagged as such,
> non-raw formats) that could otherwise be made available, but I think
> adding them later would be quite awkward.
>
> I it would be better to reuse (and, if necessary, adapt) the existing
> disk parsing logic in libxl, so that the syntax for your new vdisks =
> [...] parameter is the same as for the existing disks.  Or even
> better, simply make your new kind of disk a new flag on the existing
> disk structure.
I got your point and agree. Almost the same suggestion (to reuse 
existing disk parameter
rather than introduce new one) was proposed by Wei. This is not forgotten,
but in my TODO list to investigate (and implement). I will come up with 
clarifying questions if any.


>
>> Also there is one suggestion from Wei Chen regarding a parameter for
>> domain config file which I haven't addressed yet.
>> [Just copy here what Wei said in V2 thread]
>> Can we keep use the same 'disk' parameter for virtio-disk, but add
>> an option like "model=virtio-disk"?
>> For example:
>> disk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3,model=virtio-disk' ]
>> Just like what Xen has done for x86 virtio-net.
> This is the same suggestion I make above, basically.  It would be much
> better, yes.

ok


>
>
>> Xenstore was chosen as a communication interface for the emulator
>> running in non-toolstack domain to be able to get configuration
>> either by reading Xenstore directly or by receiving command line
>> parameters (an updated 'xl devd' running in the same domain would
>> read Xenstore beforehand and call backend executable with the
>> required arguments).
> I was surprised to read this because I would expect that qemu upstream
> would be resistant to this approach.  As far as the Xen Project's
> point of view goes, I think using xenstore for this is fine, but we
> would definitely want the support in upstream qemu.
>
> Can you please explain the status of the corresponding qemu feature ?
> (Ideally, in a formal way in the commit message.)
I am afraid, I don't entirely get what is "the corresponding qemu feature"?
I haven't looked at the Qemu direction yet (we don't use Qemu in our 
target system), so have no ideas what should be done
there (if indeed needed) to support standalone "out-of-Qemu" virtio backend.
Could you please clarify what support is needed in Qemu for that purpose?


>
>> Please note, there is a real concern about VirtIO interrupts allocation.
>> [Just copy here what Stefano said in RFC thread]
>>
>> So, if we end up allocating let's say 6 virtio interrupts for a
>> domain, the chance of a clash with a physical interrupt of a
>> passthrough device is real.
>>
>> I am not entirely sure how to solve it, but these are a few ideas:
>> - choosing virtio interrupts that are less likely to conflict (maybe > 1000)
>> - make the virtio irq (optionally) configurable so that a user could
>>    override the default irq and specify one that doesn't conflict
>> - implementing support for virq != pirq (even the xl interface doesn't
>>    allow to specify the virq number for passthrough devices, see "irqs")
> I think here you have chosen to make the interupt configurable ?
>
> The implications are that a someone using this with passthrough would
> have to choose non-clashing IRQs ?
Yes
>    In the non-passthrough case (ie, a
> guest with no passthrough devices), can your code choose an
> appropriate IRQ, if the user doesn't specify one ?

Yes

Personally I think, it would be good if we could come up with a way
_without_ user involvement at all.


>
>
> I don't see any changes to the xl documentation in this patch.  That
> would be the place to explain the irq stuff, and would be needed
> anyway.  Indeed with anything substantial like your proposal, it is
> often a good idea to write (at least a sketch of) the documentation
> *first*, and then you know what you're aiming to implement.

Indeed, this ought to be documented. This is on my TODO list, will 
definitely update in the next version.


>
>
> I have some comments on the code details but I think you will probably
> want to focus on the overall approach, first:
>
>> +#ifndef container_of
>> +#define container_of(ptr, type, member) ({			\
>> +        typeof( ((type *)0)->member ) *__mptr = (ptr);	\
>> +        (type *)( (char *)__mptr - offsetof(type,member) );})
>> +#endif
> Please use the existing CONTAINER_OF which we have already.
oh, it is present, great. I failed to find something suitable (for some 
reason) when writing that code)
Will reuse.


>
>>   static const char *gicv_to_string(libxl_gic_version gic_version)
>>   {
>>       switch (gic_version) {
>> @@ -39,14 +45,32 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>           vuart_enabled = true;
>>       }
>>   
>> -    /*
>> -     * XXX: Handle properly virtio
>> -     * A proper solution would be the toolstack to allocate the interrupts
>> -     * used by each virtio backend and let the backend now which one is used
>> -     */
>>       if (libxl_defbool_val(d_config->b_info.arch_arm.virtio)) {
>> -        nr_spis += (GUEST_VIRTIO_MMIO_SPI - 32) + 1;
>> +        uint64_t virtio_base;
>> +        libxl_device_virtio_disk *virtio_disk;
>> +
>> +        virtio_base = GUEST_VIRTIO_MMIO_BASE;
>>           virtio_irq = GUEST_VIRTIO_MMIO_SPI;
> I would like to see a review of these changes to virtio handling by
> someone who understands virtio.

Makes sense.


>
>> +static int libxl__device_virtio_disk_setdefault(libxl__gc *gc, uint32_t domid,
>> +                                                libxl_device_virtio_disk *virtio_disk,
>> +                                                bool hotplug)
>> +{
>> +    return libxl__resolve_domid(gc, virtio_disk->backend_domname,
>> +                                &virtio_disk->backend_domid);
> There are some line length problems here.

Will correct.


>
> I haven't reviewed your parsing code because I think this ought to be
> done as an option or addition to with the existing disk spec parsing.

I got it, fair enough.


>
>> diff --git a/tools/xl/xl_virtio_disk.c b/tools/xl/xl_virtio_disk.c
>> new file mode 100644
>> index 0000000..808a7da
>> --- /dev/null
>> +++ b/tools/xl/xl_virtio_disk.c
>> @@ -0,0 +1,46 @@
>> +/*
>> + * Copyright (C) 2020 EPAM Systems Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU Lesser General Public License as published
>> + * by the Free Software Foundation; version 2.1 only. with the special
>> + * exception on linking described in file LICENSE.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU Lesser General Public License for more details.
>> + */
>> +
>> +#include <stdlib.h>
>> +
>> +#include <libxl.h>
>> +#include <libxl_utils.h>
>> +#include <libxlutil.h>
>> +
>> +#include "xl.h"
>> +#include "xl_utils.h"
>> +#include "xl_parse.h"
>> +
>> +int main_virtio_diskattach(int argc, char **argv)
>> +{
>> +    return 0;
>> +}
>> +
>> +int main_virtio_disklist(int argc, char **argv)
>> +{
>> +   return 0;
>> +}
>> +
>> +int main_virtio_diskdetach(int argc, char **argv)
>> +{
>> +    return 0;
>> +}
> This seems to be a stray early test file left over in the patch ?

Will implement these bits.


>
>
> Thanks,
> Ian.

-- 
Regards,

Oleksandr Tyshchenko


