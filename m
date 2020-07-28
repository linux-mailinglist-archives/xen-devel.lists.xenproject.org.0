Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF8F2310A6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 19:13:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0T9u-00036U-Ta; Tue, 28 Jul 2020 17:12:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSwU=BH=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k0T9t-00036P-DW
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 17:12:57 +0000
X-Inumbo-ID: 947c6acc-d0f5-11ea-8ba3-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 947c6acc-d0f5-11ea-8ba3-bc764e2007e4;
 Tue, 28 Jul 2020 17:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gAxUDflyYD2Qz0uZDypM7APCGN6LsjUhjSUSWoYLPcY=; b=U8RJ5NSwZQ8iU78q1Zh5y2VxyZ
 KLqWvDt3ijkmQpa/cyxyk4D4lH1X6HTzXUZ8buyclAQa4oFopGO7GizuG8UlZlYXhKf06aO3+jWxW
 L5i2sFLebxgLmSaQiTOm/ba8eK8Vj7kcWqyUDl3TI1/IWRsEE2Nm52OaedKFXHgUc09g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k0T9m-0005gL-AT; Tue, 28 Jul 2020 17:12:50 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k0T9l-0004gC-Us; Tue, 28 Jul 2020 17:12:50 +0000
Subject: Re: [PATCH v3 4/4] xen: add helpers to allocate unpopulated memory
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200727091342.52325-1-roger.pau@citrix.com>
 <20200727091342.52325-5-roger.pau@citrix.com>
 <b5460659-88a5-c2aa-c339-815d5618bcb5@xen.org>
 <20200728165919.GA7191@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <b1732413-0bd0-6f58-6324-37497347ce5b@xen.org>
Date: Tue, 28 Jul 2020 18:12:46 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728165919.GA7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan Yankovskyi <yyankovskyi@gmail.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Daniel Vetter <daniel@ffwll.ch>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Roger,

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
> 
> Right, this feature (allocation of unpopulated memory separated from
> the balloon driver) is currently gated on CONFIG_ZONE_DEVICE, which I
> think could be used on Arm.
> 
> IMO the right solution seems to be to subtract the physical memory
> regions that can be used for the identity mappings of foreign pages
> (all RAM on the system AFAICT) from iomem_resource, as that would make
> this and the memory hotplug done in the balloon driver safe?

Dom0 doesn't know the regions used for the identity mappings as this is 
only managed by Xen. So there is nothing you can really do here.

But don't you have the same issue on x86 with "magic pages"?

Cheers,

-- 
Julien Grall

