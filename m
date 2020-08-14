Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88EB2447FC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 12:28:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6Wvx-0006tC-Gp; Fri, 14 Aug 2020 10:27:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UNK8=BY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k6Wvw-0006t7-1h
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 10:27:36 +0000
X-Inumbo-ID: 266627a0-6e53-47a0-abfa-8a4ffe82f77d
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 266627a0-6e53-47a0-abfa-8a4ffe82f77d;
 Fri, 14 Aug 2020 10:27:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5DBB0AF8F;
 Fri, 14 Aug 2020 10:27:56 +0000 (UTC)
Subject: Re: [PATCH v4 2/2] xen: add helpers to allocate unpopulated memory
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christoph Hellwig <hch@infradead.org>
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
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
 <20200813073337.GA16160@infradead.org> <20200813075420.GC975@Air-de-Roger>
 <20200814072920.GA6126@infradead.org> <20200814095629.GJ975@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a907ff4a-c887-7d02-1d45-140d7749afa4@suse.com>
Date: Fri, 14 Aug 2020 12:27:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814095629.GJ975@Air-de-Roger>
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

On 14.08.20 11:56, Roger Pau Monné wrote:
> On Fri, Aug 14, 2020 at 08:29:20AM +0100, Christoph Hellwig wrote:
>> On Thu, Aug 13, 2020 at 09:54:20AM +0200, Roger Pau Monn?? wrote:
>>> On Thu, Aug 13, 2020 at 08:33:37AM +0100, Christoph Hellwig wrote:
>>>> On Tue, Aug 11, 2020 at 11:44:47AM +0200, Roger Pau Monne wrote:
>>>>> If enabled (because ZONE_DEVICE is supported) the usage of the new
>>>>> functionality untangles Xen balloon and RAM hotplug from the usage of
>>>>> unpopulated physical memory ranges to map foreign pages, which is the
>>>>> correct thing to do in order to avoid mappings of foreign pages depend
>>>>> on memory hotplug.
>>>>
>>>> So please just select ZONE_DEVICE if this is so much better rather
>>>> than maintaining two variants.
>>>
>>> We still need to other variant for Arm at least, so both need to be
>>> maintained anyway, even if we force ZONE_DEVICE on x86.
>>
>> Well, it still really helps reproducability if you stick to one
>> implementation of x86.
>>
>> The alternative would be an explicit config option to opt into it,
>> but just getting a different implementation based on a random
>> kernel option is strange.
> 
> Would adding something like the chunk below to the patch be OK?
> 
> ---8<---
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index 018020b91baa..5f321a1319e6 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -328,7 +328,14 @@ config XEN_FRONT_PGDIR_SHBUF
>   	tristate
>   
>   config XEN_UNPOPULATED_ALLOC
> -	bool
> -	default y if ZONE_DEVICE && !ARM && !ARM64
> +	bool "Use unpopulated memory ranges for guest mappings"
> +	depends on X86
> +	select ZONE_DEVICE
> +	default y

I'd rather use "default XEN_BACKEND" here, as mappings of other guest's
memory is rarely used for non-backend guests.


Juergen


