Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA7A1C1C30
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 19:45:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUZj5-0007GD-0F; Fri, 01 May 2020 17:45:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jt3Y=6P=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1jUZj3-0007G8-Iu
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 17:45:25 +0000
X-Inumbo-ID: 889db133-8bd3-11ea-9b3d-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 889db133-8bd3-11ea-9b3d-12813bfff9fa;
 Fri, 01 May 2020 17:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588355123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3erjJ6PUj0+kTbH6WM4sv87u+V7N5mk0eIrgDOfdhPg=;
 b=dpXdnK0HidpvX5Hh5H75j9sj+9JD0r3X4Dy+sP3HLxnFkA6KUCY45R+y4GD7PRrM/UKDs2
 h8HLbj+tsnx6r0H4DVdD4fgRjbzB4NL6YNjbFgaHgKF5tTVcy2DNLGj18n647btc69kRQF
 892wHm8FwItYC1EYgZy7+Xh14ax7CXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-RMUFCZcdPIaCTt6gBqiHfA-1; Fri, 01 May 2020 13:45:19 -0400
X-MC-Unique: RMUFCZcdPIaCTt6gBqiHfA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B00D835B8E;
 Fri,  1 May 2020 17:45:17 +0000 (UTC)
Received: from [10.36.112.180] (ovpn-112-180.ams2.redhat.com [10.36.112.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69C445C1D2;
 Fri,  1 May 2020 17:45:08 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] mm/memory_hotplug: Introduce MHP_NO_FIRMWARE_MEMMAP
To: Dan Williams <dan.j.williams@intel.com>
References: <20200430102908.10107-1-david@redhat.com>
 <20200430102908.10107-3-david@redhat.com>
 <87pnbp2dcz.fsf@x220.int.ebiederm.org>
 <1b49c3be-6e2f-57cb-96f7-f66a8f8a9380@redhat.com>
 <871ro52ary.fsf@x220.int.ebiederm.org>
 <373a6898-4020-4af1-5b3d-f827d705dd77@redhat.com>
 <875zdg26hp.fsf@x220.int.ebiederm.org>
 <b28c9e02-8cf2-33ae-646b-fe50a185738e@redhat.com>
 <20200430152403.e0d6da5eb1cad06411ac6d46@linux-foundation.org>
 <5c908ec3-9495-531e-9291-cbab24f292d6@redhat.com>
 <CAPcyv4j=YKnr1HW4OhAmpzbuKjtfP7FdAn4-V7uA=b-Tcpfu+A@mail.gmail.com>
 <2d019c11-a478-9d70-abd5-4fd2ebf4bc1d@redhat.com>
 <CAPcyv4iOqS0Wbfa2KPfE1axQFGXoRB4mmPRP__Lmqpw6Qpr_ig@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <62dd4ce2-86cc-5b85-734f-ec8766528a1b@redhat.com>
Date: Fri, 1 May 2020 19:45:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4iOqS0Wbfa2KPfE1axQFGXoRB4mmPRP__Lmqpw6Qpr_ig@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: virtio-dev@lists.oasis-open.org, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Wei Yang <richard.weiyang@gmail.com>,
 linux-s390 <linux-s390@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, Linux MM <linux-mm@kvack.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01.05.20 19:39, Dan Williams wrote:
> On Fri, May 1, 2020 at 10:21 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 01.05.20 18:56, Dan Williams wrote:
>>> On Fri, May 1, 2020 at 2:34 AM David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>> On 01.05.20 00:24, Andrew Morton wrote:
>>>>> On Thu, 30 Apr 2020 20:43:39 +0200 David Hildenbrand <david@redhat.com> wrote:
>>>>>
>>>>>>>
>>>>>>> Why does the firmware map support hotplug entries?
>>>>>>
>>>>>> I assume:
>>>>>>
>>>>>> The firmware memmap was added primarily for x86-64 kexec (and still, is
>>>>>> mostly used on x86-64 only IIRC). There, we had ACPI hotplug. When DIMMs
>>>>>> get hotplugged on real HW, they get added to e820. Same applies to
>>>>>> memory added via HyperV balloon (unless memory is unplugged via
>>>>>> ballooning and you reboot ... the the e820 is changed as well). I assume
>>>>>> we wanted to be able to reflect that, to make kexec look like a real reboot.
>>>>>>
>>>>>> This worked for a while. Then came dax/kmem. Now comes virtio-mem.
>>>>>>
>>>>>>
>>>>>> But I assume only Andrew can enlighten us.
>>>>>>
>>>>>> @Andrew, any guidance here? Should we really add all memory to the
>>>>>> firmware memmap, even if this contradicts with the existing
>>>>>> documentation? (especially, if the actual firmware memmap will *not*
>>>>>> contain that memory after a reboot)
>>>>>
>>>>> For some reason that patch is misattributed - it was authored by
>>>>> Shaohui Zheng <shaohui.zheng@intel.com>, who hasn't been heard from in
>>>>> a decade.  I looked through the email discussion from that time and I'm
>>>>> not seeing anything useful.  But I wasn't able to locate Dave Hansen's
>>>>> review comments.
>>>>
>>>> Okay, thanks for checking. I think the documentation from 2008 is pretty
>>>> clear what has to be done here. I will add some of these details to the
>>>> patch description.
>>>>
>>>> Also, now that I know that esp. kexec-tools already don't consider
>>>> dax/kmem memory properly (memory will not get dumped via kdump) and
>>>> won't really suffer from a name change in /proc/iomem, I will go back to
>>>> the MHP_DRIVER_MANAGED approach and
>>>> 1. Don't create firmware memmap entries
>>>> 2. Name the resource "System RAM (driver managed)"
>>>> 3. Flag the resource via something like IORESOURCE_MEM_DRIVER_MANAGED.
>>>>
>>>> This way, kernel users and user space can figure out that this memory
>>>> has different semantics and handle it accordingly - I think that was
>>>> what Eric was asking for.
>>>>
>>>> Of course, open for suggestions.
>>>
>>> I'm still more of a fan of this being communicated by "System RAM"
>>
>> I was mentioning somewhere in this thread that "System RAM" inside a
>> hierarchy (like dax/kmem) will already be basically ignored by
>> kexec-tools. So, placing it inside a hierarchy already makes it look
>> special already.
>>
>> But after all, as we have to change kexec-tools either way, we can
>> directly go ahead and flag it properly as special (in case there will
>> ever be other cases where we could no longer distinguish it).
>>
>>> being parented especially because that tells you something about how
>>> the memory is driver-managed and which mechanism might be in play.
>>
>> The could be communicated to some degree via the resource hierarchy.
>>
>> E.g.,
>>
>>             [root@localhost ~]# cat /proc/iomem
>>             ...
>>             140000000-33fffffff : Persistent Memory
>>               140000000-1481fffff : namespace0.0
>>               150000000-33fffffff : dax0.0
>>                 150000000-33fffffff : System RAM (driver managed)
>>
>> vs.
>>
>>            :/# cat /proc/iomem
>>             [...]
>>             140000000-333ffffff : virtio-mem (virtio0)
>>               140000000-147ffffff : System RAM (driver managed)
>>               148000000-14fffffff : System RAM (driver managed)
>>               150000000-157ffffff : System RAM (driver managed)
>>
>> Good enough for my taste.
>>
>>> What about adding an optional /sys/firmware/memmap/X/parent attribute.
>>
>> I really don't want any firmware memmap entries for something that is
>> not part of the firmware provided memmap. In addition,
>> /sys/firmware/memmap/ is still a fairly x86_64 specific thing. Only mips
>> and two arm configs enable it at all.
>>
>> So, IMHO, /sys/firmware/memmap/ is definitely not the way to go.
> 
> I think that's a policy decision and policy decisions do not belong in
> the kernel. Give the tooling the opportunity to decide whether System
> RAM stays that way over a kexec. The parenthetical reference otherwise
> looks out of place to me in the /proc/iomem output. What makes it
> "driver managed" is how the kernel handles it, not how the kernel
> names it.

At least, virtio-mem is different. It really *has to be handled* by the
driver. This is not a policy. It's how it works.

-- 
Thanks,

David / dhildenb


