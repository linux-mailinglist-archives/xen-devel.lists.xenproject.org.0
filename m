Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8860B25D8C7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 14:41:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEB14-0007Tx-D6; Fri, 04 Sep 2020 12:40:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JWnj=CN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kEB13-0007Ts-A3
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 12:40:29 +0000
X-Inumbo-ID: ade08f14-6a44-4762-982d-c72e37cedcd2
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ade08f14-6a44-4762-982d-c72e37cedcd2;
 Fri, 04 Sep 2020 12:40:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 348C0ACB5;
 Fri,  4 Sep 2020 12:40:28 +0000 (UTC)
Subject: Re: [PATCH v5 3/3] xen: add helpers to allocate unpopulated memory
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Wei Liu <wl@xen.org>,
 Yan Yankovskyi <yyankovskyi@gmail.com>, dri-devel@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, linux-mm@kvack.org,
 David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>
References: <20200901083326.21264-1-roger.pau@citrix.com>
 <20200901083326.21264-4-roger.pau@citrix.com>
 <b1713f26-8202-ac1e-c18a-4989312219b9@suse.com>
 <20200903163837.GM753@Air-de-Roger>
 <6fd73d30-5525-7f00-1e9c-d7bb96ea34a6@suse.com>
 <20200904084229.GN753@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <41905296-c157-938b-4953-19af3435c085@suse.com>
Date: Fri, 4 Sep 2020 14:40:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200904084229.GN753@Air-de-Roger>
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

On 04.09.20 10:42, Roger Pau Monné wrote:
> On Fri, Sep 04, 2020 at 09:00:18AM +0200, Jürgen Groß wrote:
>> On 03.09.20 18:38, Roger Pau Monné wrote:
>>> On Thu, Sep 03, 2020 at 05:30:07PM +0200, Jürgen Groß wrote:
>>>> On 01.09.20 10:33, Roger Pau Monne wrote:
>>>>> To be used in order to create foreign mappings. This is based on the
>>>>> ZONE_DEVICE facility which is used by persistent memory devices in
>>>>> order to create struct pages and kernel virtual mappings for the IOMEM
>>>>> areas of such devices. Note that on kernels without support for
>>>>> ZONE_DEVICE Xen will fallback to use ballooned pages in order to
>>>>> create foreign mappings.
>>>>>
>>>>> The newly added helpers use the same parameters as the existing
>>>>> {alloc/free}_xenballooned_pages functions, which allows for in-place
>>>>> replacement of the callers. Once a memory region has been added to be
>>>>> used as scratch mapping space it will no longer be released, and pages
>>>>> returned are kept in a linked list. This allows to have a buffer of
>>>>> pages and prevents resorting to frequent additions and removals of
>>>>> regions.
>>>>>
>>>>> If enabled (because ZONE_DEVICE is supported) the usage of the new
>>>>> functionality untangles Xen balloon and RAM hotplug from the usage of
>>>>> unpopulated physical memory ranges to map foreign pages, which is the
>>>>> correct thing to do in order to avoid mappings of foreign pages depend
>>>>> on memory hotplug.
>>>>>
>>>>> Note the driver is currently not enabled on Arm platforms because it
>>>>> would interfere with the identity mapping required on some platforms.
>>>>>
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> Sorry, I just got a build error for x86 32-bit build:
>>>>
>>>> WARNING: unmet direct dependencies detected for ZONE_DEVICE
>>>>     Depends on [n]: MEMORY_HOTPLUG [=n] && MEMORY_HOTREMOVE [=n] &&
>>>> SPARSEMEM_VMEMMAP [=n] && ARCH_HAS_PTE_DEVMAP [=n]
>>>>     Selected by [y]:
>>>>     - XEN_UNPOPULATED_ALLOC [=y] && XEN [=y] && X86 [=y]
>>>>     GEN     Makefile
>>>>     CC      kernel/bounds.s
>>>>     CALL    /home/gross/korg/src/scripts/atomic/check-atomics.sh
>>>>     UPD     include/generated/bounds.h
>>>>     CC      arch/x86/kernel/asm-offsets.s
>>>> In file included from /home/gross/korg/src/include/linux/mmzone.h:19:0,
>>>>                    from /home/gross/korg/src/include/linux/gfp.h:6,
>>>>                    from /home/gross/korg/src/include/linux/slab.h:15,
>>>>                    from /home/gross/korg/src/include/linux/crypto.h:19,
>>>>                    from /home/gross/korg/src/arch/x86/kernel/asm-offsets.c:9:
>>>> /home/gross/korg/src/include/linux/page-flags-layout.h:95:2: error: #error
>>>> "Not enough bits in page flags"
>>>>    #error "Not enough bits in page flags"
>>>>     ^~~~~
>>>> make[2]: *** [/home/gross/korg/src/scripts/Makefile.build:114:
>>>> arch/x86/kernel/asm-offsets.s] Error 1
>>>> make[1]: *** [/home/gross/korg/src/Makefile:1175: prepare0] Error 2
>>>> make[1]: Leaving directory '/home/gross/korg/x8632'
>>>> make: *** [Makefile:185: __sub-make] Error 2
>>>
>>> Sorry for this. I've tested a 32bit build but I think it was before
>>> the last Kconfig changes. I'm a little unsure how to solve this, as
>>> ZONE_DEVICE doesn't select the required options for it to run, but
>>> rather depends on them to be available.
>>>
>>> You can trigger something similar on x86-64 by doing:
>>>
>>> $ make ARCH=x86_64 xen.config
>>> Using .config as base
>>> Merging ./kernel/configs/xen.config
>>> Merging ./arch/x86/configs/xen.config
>>> #
>>> # merged configuration written to .config (needs make)
>>> #
>>> scripts/kconfig/conf  --olddefconfig Kconfig
>>>
>>> WARNING: unmet direct dependencies detected for ZONE_DEVICE
>>>     Depends on [n]: MEMORY_HOTPLUG [=y] && MEMORY_HOTREMOVE [=n] && SPARSEMEM_VMEMMAP [=y] && ARCH_HAS_PTE_DEVMAP [=y]
>>>     Selected by [y]:
>>>     - XEN_UNPOPULATED_ALLOC [=y] && XEN [=y] && X86_64 [=y]
>>> #
>>> # configuration written to .config
>>> #
>>>
>>> I think the only solution is to have XEN_UNPOPULATED_ALLOC depend on
>>> ZONE_DEVICE rather than select it?
>>
>> Yes, I think so.
>>
>> I've folded that in and now build is fine.
> 
> Thanks, I assume no further action is needed on my side.

Right.


Juergen

