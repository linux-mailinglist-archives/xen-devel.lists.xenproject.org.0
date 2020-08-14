Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3C5244AEA
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 15:53:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6a8R-00083M-V0; Fri, 14 Aug 2020 13:52:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UNK8=BY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k6a8Q-00083H-Ce
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 13:52:42 +0000
X-Inumbo-ID: 75bdde3c-cb45-48c1-a132-5db3e7683907
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75bdde3c-cb45-48c1-a132-5db3e7683907;
 Fri, 14 Aug 2020 13:52:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F143B167;
 Fri, 14 Aug 2020 13:53:03 +0000 (UTC)
Subject: Re: [PATCH v4 2/2] xen: add helpers to allocate unpopulated memory
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Wei Liu <wl@xen.org>,
 Yan Yankovskyi <yyankovskyi@gmail.com>, dri-devel@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, linux-mm@kvack.org,
 David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
 <20200813073337.GA16160@infradead.org> <20200813075420.GC975@Air-de-Roger>
 <20200814072920.GA6126@infradead.org> <20200814095629.GJ975@Air-de-Roger>
 <a907ff4a-c887-7d02-1d45-140d7749afa4@suse.com>
 <20200814124724.GK975@Air-de-Roger>
 <fc10d3a5-fe79-335e-353a-1bf480af7c7c@suse.com>
 <20200814133536.GL975@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2f0e2484-d4ec-adb3-4182-6db2c542c633@suse.com>
Date: Fri, 14 Aug 2020 15:52:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814133536.GL975@Air-de-Roger>
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

On 14.08.20 15:35, Roger Pau Monné wrote:
> On Fri, Aug 14, 2020 at 02:54:38PM +0200, Jürgen Groß wrote:
>> On 14.08.20 14:47, Roger Pau Monné wrote:
>>> On Fri, Aug 14, 2020 at 12:27:32PM +0200, Jürgen Groß wrote:
>>>> On 14.08.20 11:56, Roger Pau Monné wrote:
>>>>> On Fri, Aug 14, 2020 at 08:29:20AM +0100, Christoph Hellwig wrote:
>>>>>> On Thu, Aug 13, 2020 at 09:54:20AM +0200, Roger Pau Monn?? wrote:
>>>>>>> On Thu, Aug 13, 2020 at 08:33:37AM +0100, Christoph Hellwig wrote:
>>>>>>>> On Tue, Aug 11, 2020 at 11:44:47AM +0200, Roger Pau Monne wrote:
>>>>>>>>> If enabled (because ZONE_DEVICE is supported) the usage of the new
>>>>>>>>> functionality untangles Xen balloon and RAM hotplug from the usage of
>>>>>>>>> unpopulated physical memory ranges to map foreign pages, which is the
>>>>>>>>> correct thing to do in order to avoid mappings of foreign pages depend
>>>>>>>>> on memory hotplug.
>>>>>>>>
>>>>>>>> So please just select ZONE_DEVICE if this is so much better rather
>>>>>>>> than maintaining two variants.
>>>>>>>
>>>>>>> We still need to other variant for Arm at least, so both need to be
>>>>>>> maintained anyway, even if we force ZONE_DEVICE on x86.
>>>>>>
>>>>>> Well, it still really helps reproducability if you stick to one
>>>>>> implementation of x86.
>>>>>>
>>>>>> The alternative would be an explicit config option to opt into it,
>>>>>> but just getting a different implementation based on a random
>>>>>> kernel option is strange.
>>>>>
>>>>> Would adding something like the chunk below to the patch be OK?
>>>>>
>>>>> ---8<---
>>>>> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
>>>>> index 018020b91baa..5f321a1319e6 100644
>>>>> --- a/drivers/xen/Kconfig
>>>>> +++ b/drivers/xen/Kconfig
>>>>> @@ -328,7 +328,14 @@ config XEN_FRONT_PGDIR_SHBUF
>>>>>     	tristate
>>>>>     config XEN_UNPOPULATED_ALLOC
>>>>> -	bool
>>>>> -	default y if ZONE_DEVICE && !ARM && !ARM64
>>>>> +	bool "Use unpopulated memory ranges for guest mappings"
>>>>> +	depends on X86
>>>>> +	select ZONE_DEVICE
>>>>> +	default y
>>>>
>>>> I'd rather use "default XEN_BACKEND" here, as mappings of other guest's
>>>> memory is rarely used for non-backend guests.
>>>
>>> There's also the privcmd and gnt devices which make heavy use of this,
>>> so I'm not sure only selecting by default on XEN_BACKEND is the best
>>> option.
>>
>> I just want to avoid that kernels built for running as Xen guest, but
>> not as dom0, will be forced to select ZONE_DEVICE.
>>
>> As privcmd is dom0-only, this is no problem.
> 
> Oh, didn't know that, I somehow assumed privcmd would be available to
> all Xen guests regardless of whether dom0 support was selected.

My remark above should have been more precise in this regard:

privcmd operations dealing with foreign mappings are normally limited
to dom0 (there might be special cases, like linux-based stubdoms, but
those will be configured carefully for that purpose, so they don't
need to be considered for selecting the default IMO).

> 
>> In case you are worrying about gnt devices, I'd be fine to switch to
>>
>> default XEN_BACKEND || XEN_GNTDEV
> 
> Sure. maybe even:
> 
> default XEN_BACKEND || XEN_GNTDEV || XEN_DOM0

Yes.

> 
> Do you want me to resend with this changed or are you happy to fixup
> if there are no further comments?

I'd prefer a resend (maybe after Patch 1 has gained its missing Ack, and
then with Patch 1 sent to me, too).


Juergen

