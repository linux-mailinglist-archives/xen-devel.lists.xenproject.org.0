Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 206D224D4C6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 14:19:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k95za-0001f9-94; Fri, 21 Aug 2020 12:17:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NMHL=B7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k95zY-0001f4-Lq
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 12:17:56 +0000
X-Inumbo-ID: a49f5740-8789-48d4-a9db-99e6b4597a03
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a49f5740-8789-48d4-a9db-99e6b4597a03;
 Fri, 21 Aug 2020 12:17:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 88923AE16;
 Fri, 21 Aug 2020 12:18:22 +0000 (UTC)
Subject: Re: [PATCH 0/2] Xen: Use a dedicated pointer for IRQ data
To: Sergei Temerkhanov <s.temerkhanov@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: xen-devel@lists.xenproject.org
References: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
 <20200821071547.18894-1-s.temerkhanov@gmail.com>
 <ccc1883f-876f-c1ea-bd68-b3c8ab267a8f@suse.com>
 <CAPEA6dYXaw=ZYv1jJqK=8twVpKXQ8bG0erABKC6HiQh-DcZ-DQ@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b2917f59-d101-659d-1704-8d2a294bb2a1@suse.com>
Date: Fri, 21 Aug 2020 14:17:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAPEA6dYXaw=ZYv1jJqK=8twVpKXQ8bG0erABKC6HiQh-DcZ-DQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 21.08.20 13:19, Sergei Temerkhanov wrote:
>> Did you see any specific problem where handler_data is written by
> another component?
> 
> I've posted this series in the thread
> https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg00957.html
> where the problem is caused exactly by that behavior
> 
>> In case this is a real problem I don't think your approach will be accepted
> Any comments/suggestions are welcome

Not sure if the IRQ maintainers agree with me, but I would add
a set_handler_data and get_handler_data function pointer to
struct irq_chip. If those are set I'd call them for writing/reading
handler_data instead doing it directly. Xen could then specify those
and add a field to its own handler data struct for storing the data
of the driver coming later.

Xen would need another accessor function for its own primary data,
of course.

Adding the IRQ maintainer as he might have an opinion here. :-)


Juergen

> 
> Regards,
> Sergey
> 
> On Fri, Aug 21, 2020 at 1:18 PM Jürgen Groß <jgross@suse.com> wrote:
>>
>> On 21.08.20 09:15, Sergey Temerkhanov wrote:
>>> Use a dedicated pointer for IRQ data to avoid conflicts with some
>>> other parts of the kernel code which my use handler_data for their
>>> own purposes while still running on Xen
>>>
>>> Sergey Temerkhanov (2):
>>>     Xen: Use a dedicated irq_info structure pointer
>>>     Xen: Rename irq_info structure
>>>
>>>    drivers/xen/events/events_2l.c       |  2 +-
>>>    drivers/xen/events/events_base.c     | 80 +++++++++++++---------------
>>>    drivers/xen/events/events_fifo.c     |  5 +-
>>>    drivers/xen/events/events_internal.h | 12 ++---
>>>    include/linux/irq.h                  | 17 ++++++
>>>    kernel/irq/chip.c                    | 14 +++++
>>>    6 files changed, 78 insertions(+), 52 deletions(-)
>>>
>>
>> Did you see any specific problem where handler_data is written by
>> another component?
>>
>> In case this is a real problem I don't think your approach will be
>> accepted, especially the IRQ subsystem maintainers probably won't
>> like it.
>>
>> And please include the maintainers of the files you are modifying in
>> the recipients list of the patch(es).
>>
>>
>> Juergen
> 


