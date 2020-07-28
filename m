Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F42231073
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 19:06:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0T3i-0002GT-8D; Tue, 28 Jul 2020 17:06:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K5Bo=BH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0T3g-0002GO-Ly
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 17:06:32 +0000
X-Inumbo-ID: ae8cae50-d0f4-11ea-8ba1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae8cae50-d0f4-11ea-8ba1-bc764e2007e4;
 Tue, 28 Jul 2020 17:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595955991;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NhQlpfgEzw5uIL26d7//uQgtQ8+lTO6nNMY87duUokQ=;
 b=O8Dr5+wflPoHgMNwSG90Lkw7PM5DuRN7DSm/wfSus+sfwGGQ8VnhCxFJ
 LGZDWWAx0qEdA2lsYcePWzpQ7m4oOMqHHwMBCjsZOkuhOa/aQqBvCu9eN
 gAY/ttoVvjtTnNswb4DIHtVbycRPlVcEV+VEJLRPp+Hnyzc2wl46VHTwQ Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Zv07BbGuPhsiZuK1RAL+MXQS7+DkALPbSOLVSZU6zFhcWsNovWd2ezPA0u0r1ydAx+ftO+5rIq
 NYZIB7Ir83eaSN5NLUnEQUwpkSM93rbTHf5FdDjDIWKAeHW5XlIoRUumb0e9wguAvIvp4K7b+H
 wj1PKHL59HxgJHNABW9nSYRmjho8ubni3kkx1ZFgHlasMw2iQH4TLZsXntv6C0nojnpI0osC1H
 P4GfMlvA6ODgHDaodR3qUiDDbVxaEHvhgheUl2K9TujfOtvBGncUzSfPj+3oWbSEcATqj0RXdv
 ExM=
X-SBRS: 2.7
X-MesageID: 23700460
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23700460"
Subject: Re: [PATCH v3 4/4] xen: add helpers to allocate unpopulated memory
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Julien Grall
 <julien@xen.org>
References: <20200727091342.52325-1-roger.pau@citrix.com>
 <20200727091342.52325-5-roger.pau@citrix.com>
 <b5460659-88a5-c2aa-c339-815d5618bcb5@xen.org>
 <20200728165919.GA7191@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cb1790b3-2ad0-2c1b-a632-e4fea4b6bcfa@citrix.com>
Date: Tue, 28 Jul 2020 18:06:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728165919.GA7191@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan
 Yankovskyi <yyankovskyi@gmail.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Michal
 Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Daniel Vetter <daniel@ffwll.ch>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/07/2020 17:59, Roger Pau Monné wrote:
> On Tue, Jul 28, 2020 at 05:48:23PM +0100, Julien Grall wrote:
>> Hi,
>>
>> On 27/07/2020 10:13, Roger Pau Monne wrote:
>>> To be used in order to create foreign mappings. This is based on the
>>> ZONE_DEVICE facility which is used by persistent memory devices in
>>> order to create struct pages and kernel virtual mappings for the IOMEM
>>> areas of such devices. Note that on kernels without support for
>>> ZONE_DEVICE Xen will fallback to use ballooned pages in order to
>>> create foreign mappings.
>>>
>>> The newly added helpers use the same parameters as the existing
>>> {alloc/free}_xenballooned_pages functions, which allows for in-place
>>> replacement of the callers. Once a memory region has been added to be
>>> used as scratch mapping space it will no longer be released, and pages
>>> returned are kept in a linked list. This allows to have a buffer of
>>> pages and prevents resorting to frequent additions and removals of
>>> regions.
>>>
>>> If enabled (because ZONE_DEVICE is supported) the usage of the new
>>> functionality untangles Xen balloon and RAM hotplug from the usage of
>>> unpopulated physical memory ranges to map foreign pages, which is the
>>> correct thing to do in order to avoid mappings of foreign pages depend
>>> on memory hotplug.
>> I think this is going to break Dom0 on Arm if the kernel has been built with
>> hotplug. This is because you may end up to re-use region that will be used
>> for the 1:1 mapping of a foreign map.
>>
>> Note that I don't know whether hotplug has been tested on Xen on Arm yet. So
>> it might be possible to be already broken.
>>
>> Meanwhile, my suggestion would be to make the use of hotplug in the balloon
>> code conditional (maybe using CONFIG_ARM64 and CONFIG_ARM)?
> Right, this feature (allocation of unpopulated memory separated from
> the balloon driver) is currently gated on CONFIG_ZONE_DEVICE, which I
> think could be used on Arm.
>
> IMO the right solution seems to be to subtract the physical memory
> regions that can be used for the identity mappings of foreign pages
> (all RAM on the system AFAICT) from iomem_resource, as that would make
> this and the memory hotplug done in the balloon driver safe?

The right solution is a mechanism for translated guests to query Xen to
find regions of guest physical address space which are unused, and can
be safely be used for foreign/grant/other  mappings.

Please don't waste any more time applying more duct tape to a broken
system, and instead spend the time organising some proper foundations.

~Andrew

