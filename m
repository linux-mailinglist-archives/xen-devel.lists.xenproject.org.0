Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F5722B0BF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 15:47:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jybZN-000240-D6; Thu, 23 Jul 2020 13:47:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=64jQ=BC=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1jybZL-00023v-MN
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 13:47:31 +0000
X-Inumbo-ID: 0ba485b4-cceb-11ea-8715-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0ba485b4-cceb-11ea-8715-bc764e2007e4;
 Thu, 23 Jul 2020 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595512048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=18jcLbWvrYiy04myeabqbt4ovzopAoj1RyaVCl5T6K4=;
 b=L7n8oWicJHAYKDrOWPyEEEboNQsguGHfXIZygN7MROx1rurRpXfCX9WLWXUQtYcJ7AEZhF
 lj8gsnsUxEbeWOaseqNEshy3xVq+ZUMcK9B4/KBjSUbZur8BpSdSNSpwcYlI3VNd9B+CCj
 5gRErII/yot5WFYFqyf0Kk5xUn1DXjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-xhZrJ9ZRO-qSQFh2Ax8U_A-1; Thu, 23 Jul 2020 09:47:26 -0400
X-MC-Unique: xhZrJ9ZRO-qSQFh2Ax8U_A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2317800469;
 Thu, 23 Jul 2020 13:47:24 +0000 (UTC)
Received: from [10.36.114.90] (ovpn-114-90.ams2.redhat.com [10.36.114.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E56607855A;
 Thu, 23 Jul 2020 13:47:22 +0000 (UTC)
Subject: Re: [PATCH 3/3] memory: introduce an option to force onlining of
 hotplug memory
From: David Hildenbrand <david@redhat.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200723084523.42109-1-roger.pau@citrix.com>
 <20200723084523.42109-4-roger.pau@citrix.com>
 <21490d49-b2cf-a398-0609-8010bdb0b004@redhat.com>
 <20200723122300.GD7191@Air-de-Roger>
 <e94d9556-f615-bbe2-07d2-08958969ee5f@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <429c2889-93c2-23b3-ba1e-da56e3a76ba4@redhat.com>
Date: Thu, 23 Jul 2020 15:47:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <e94d9556-f615-bbe2-07d2-08958969ee5f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.07.20 15:22, David Hildenbrand wrote:
> On 23.07.20 14:23, Roger Pau Monné wrote:
>> On Thu, Jul 23, 2020 at 01:37:03PM +0200, David Hildenbrand wrote:
>>> On 23.07.20 10:45, Roger Pau Monne wrote:
>>>> Add an extra option to add_memory_resource that overrides the memory
>>>> hotplug online behavior in order to force onlining of memory from
>>>> add_memory_resource unconditionally.
>>>>
>>>> This is required for the Xen balloon driver, that must run the
>>>> online page callback in order to correctly process the newly added
>>>> memory region, note this is an unpopulated region that is used by Linux
>>>> to either hotplug RAM or to map foreign pages from other domains, and
>>>> hence memory hotplug when running on Xen can be used even without the
>>>> user explicitly requesting it, as part of the normal operations of the
>>>> OS when attempting to map memory from a different domain.
>>>>
>>>> Setting a different default value of memhp_default_online_type when
>>>> attaching the balloon driver is not a robust solution, as the user (or
>>>> distro init scripts) could still change it and thus break the Xen
>>>> balloon driver.
>>>
>>> I think we discussed this a couple of times before (even triggered by my
>>> request), and this is responsibility of user space to configure. Usually
>>> distros have udev rules to online memory automatically. Especially, user
>>> space should eb able to configure *how* to online memory.
>>
>> Note (as per the commit message) that in the specific case I'm
>> referring to the memory hotplugged by the Xen balloon driver will be
>> an unpopulated range to be used internally by certain Xen subsystems,
>> like the xen-blkback or the privcmd drivers. The addition of such
>> blocks of (unpopulated) memory can happen without the user explicitly
>> requesting it, and hence not even aware such hotplug process is taking
>> place. To be clear: no actual RAM will be added to the system.
> 
> Okay, but there is also the case where XEN will actually hotplug memory
> using this same handler IIRC (at least I've read papers about it). Both
> are using the same handler, correct?
> 
>>
>>> It's the admin/distro responsibility to configure this properly. In case
>>> this doesn't happen (or as you say, users change it), bad luck.
>>>
>>> E.g., virtio-mem takes care to not add more memory in case it is not
>>> getting onlined. I remember hyper-v has similar code to at least wait a
>>> bit for memory to get onlined.
>>
>> I don't think VirtIO or Hyper-V use the hotplug system in the same way
>> as Xen, as said this is done to add unpopulated memory regions that
>> will be used to map foreign memory (from other domains) by Xen drivers
>> on the system.
> 
> Indeed, if the memory is never exposed to the buddy (and all you need is
> struct pages +  a kernel virtual mapping), I wonder if
> memremap/ZONE_DEVICE is what you want? Then you won't have user-visible
> memory blocks created with unclear online semantics, partially involving
> the buddy.

And just a note that there is also DCSS on s390x / z/VM which allows to
map segments into the VM physical address space (e.g., you can share
segments between VMs). They don't need any memmap (struct page) for that
memory, though. All they do is create the identity mapping in the kernel
virtual address space manually. Not sure what the exact requirements on
the XEN side are. I assume you need a memmap for this memory.

-- 
Thanks,

David / dhildenb


