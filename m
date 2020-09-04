Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B0E25D8C6
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 14:41:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEB1Z-0007Vp-MN; Fri, 04 Sep 2020 12:41:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JWnj=CN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kEB1Y-0007Vj-9T
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 12:41:00 +0000
X-Inumbo-ID: f890c723-b9bf-4d09-a906-666bd038077c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f890c723-b9bf-4d09-a906-666bd038077c;
 Fri, 04 Sep 2020 12:40:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85C67ACB5;
 Fri,  4 Sep 2020 12:40:59 +0000 (UTC)
Subject: Re: [PATCH v5 0/3] xen/balloon: fixes for memory hotplug
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20200901083326.21264-1-roger.pau@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0b3daa72-692f-e747-4842-48a7a1b66dd4@suse.com>
Date: Fri, 4 Sep 2020 14:40:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200901083326.21264-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 01.09.20 10:33, Roger Pau Monne wrote:
> Hello,
> 
> The following series contain some fixes in order to split Xen
> unpopulated memory handling from the ballooning driver using the
> ZONE_DEVICE functionality, so that physical memory regions used to map
> foreign pages are not tied to memory hotplug.
> 
> Note this is currently only available for x86 due to Arm using an
> identity map for dom0 p2m and thus needing special handling.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (3):
>    xen/balloon: add header guard
>    memremap: rename MEMORY_DEVICE_DEVDAX to MEMORY_DEVICE_GENERIC
>    xen: add helpers to allocate unpopulated memory
> 
>   drivers/dax/device.c                    |   2 +-
>   drivers/gpu/drm/xen/xen_drm_front_gem.c |   9 +-
>   drivers/xen/Kconfig                     |  11 ++
>   drivers/xen/Makefile                    |   1 +
>   drivers/xen/balloon.c                   |   4 +-
>   drivers/xen/grant-table.c               |   4 +-
>   drivers/xen/privcmd.c                   |   4 +-
>   drivers/xen/unpopulated-alloc.c         | 185 ++++++++++++++++++++++++
>   drivers/xen/xenbus/xenbus_client.c      |   6 +-
>   drivers/xen/xlate_mmu.c                 |   4 +-
>   include/linux/memremap.h                |   9 +-
>   include/xen/balloon.h                   |   4 +
>   include/xen/xen.h                       |   9 ++
>   mm/memremap.c                           |   2 +-
>   14 files changed, 232 insertions(+), 22 deletions(-)
>   create mode 100644 drivers/xen/unpopulated-alloc.c
> 

Applied the series to xen/tip.git for-linus-5.9


Juergen

