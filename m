Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA9D231115
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 19:44:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Tea-0005pj-5j; Tue, 28 Jul 2020 17:44:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZWt7=BH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k0TeY-0005pb-LW
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 17:44:38 +0000
X-Inumbo-ID: 00367fb1-d0fa-11ea-8ba9-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00367fb1-d0fa-11ea-8ba9-bc764e2007e4;
 Tue, 28 Jul 2020 17:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595958276;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eHsq7Ta01QmeqnE9DLs8/mBiesJkCYGnL9YfXoA2X4o=;
 b=M2SZYfC1S2F3VwzhijMO/hp4VzBPNWYLjr/k4I7wPT7ORCo3nuZeNfQt
 eSdfuAxw3h+3efb/cGgmDomWUvjJFEJCfsN053Xv80JU2I5aAK6UNbVcg
 3q6rLunKURQ4W25aOxEwYCw0V3CDvr66XN8yRLBLuwi/AXkv76zKKYk3u 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2RdrO/AnzZYrb9zj19qTPY0bAooeEOHP1ELFiUghgXaTqNYu/IsfAaeOofDt0adaNBw2Xa0AC6
 t6lHyuGC5gkUWy/N7rzG8yB31qUpk6aKp4puI4SGJ8w7qoXEtqg8F+J/doKRdiBkCkcVvIxcwR
 q9J9cBAZhRCwaqR6vQaMZgUwvDwO9y4NebuTt/KmXt2MRQWqepK8FGyJefexjYCWZrVGObAaI8
 Yw/nTGNLt85irvc409hapDt3JL5ro6jwcrTY4qUVugZVoEP/hHQ79mpfhww2W8LLw7sXFLWMwl
 r/U=
X-SBRS: 2.7
X-MesageID: 23704211
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23704211"
Date: Tue, 28 Jul 2020 19:44:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 4/4] xen: add helpers to allocate unpopulated memory
Message-ID: <20200728174429.GC7191@Air-de-Roger>
References: <20200727091342.52325-1-roger.pau@citrix.com>
 <20200727091342.52325-5-roger.pau@citrix.com>
 <b5460659-88a5-c2aa-c339-815d5618bcb5@xen.org>
 <20200728165919.GA7191@Air-de-Roger>
 <b1732413-0bd0-6f58-6324-37497347ce5b@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1732413-0bd0-6f58-6324-37497347ce5b@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Oleksandr
 Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan Yankovskyi <yyankovskyi@gmail.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Daniel Vetter <daniel@ffwll.ch>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 28, 2020 at 06:12:46PM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 28/07/2020 17:59, Roger Pau Monné wrote:
> > On Tue, Jul 28, 2020 at 05:48:23PM +0100, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 27/07/2020 10:13, Roger Pau Monne wrote:
> > > > To be used in order to create foreign mappings. This is based on the
> > > > ZONE_DEVICE facility which is used by persistent memory devices in
> > > > order to create struct pages and kernel virtual mappings for the IOMEM
> > > > areas of such devices. Note that on kernels without support for
> > > > ZONE_DEVICE Xen will fallback to use ballooned pages in order to
> > > > create foreign mappings.
> > > > 
> > > > The newly added helpers use the same parameters as the existing
> > > > {alloc/free}_xenballooned_pages functions, which allows for in-place
> > > > replacement of the callers. Once a memory region has been added to be
> > > > used as scratch mapping space it will no longer be released, and pages
> > > > returned are kept in a linked list. This allows to have a buffer of
> > > > pages and prevents resorting to frequent additions and removals of
> > > > regions.
> > > > 
> > > > If enabled (because ZONE_DEVICE is supported) the usage of the new
> > > > functionality untangles Xen balloon and RAM hotplug from the usage of
> > > > unpopulated physical memory ranges to map foreign pages, which is the
> > > > correct thing to do in order to avoid mappings of foreign pages depend
> > > > on memory hotplug.
> > > I think this is going to break Dom0 on Arm if the kernel has been built with
> > > hotplug. This is because you may end up to re-use region that will be used
> > > for the 1:1 mapping of a foreign map.
> > > 
> > > Note that I don't know whether hotplug has been tested on Xen on Arm yet. So
> > > it might be possible to be already broken.
> > > 
> > > Meanwhile, my suggestion would be to make the use of hotplug in the balloon
> > > code conditional (maybe using CONFIG_ARM64 and CONFIG_ARM)?
> > 
> > Right, this feature (allocation of unpopulated memory separated from
> > the balloon driver) is currently gated on CONFIG_ZONE_DEVICE, which I
> > think could be used on Arm.
> > 
> > IMO the right solution seems to be to subtract the physical memory
> > regions that can be used for the identity mappings of foreign pages
> > (all RAM on the system AFAICT) from iomem_resource, as that would make
> > this and the memory hotplug done in the balloon driver safe?
> 
> Dom0 doesn't know the regions used for the identity mappings as this is only
> managed by Xen. So there is nothing you can really do here.

OK, I will add the guards to prevent this being built on Arm.

> But don't you have the same issue on x86 with "magic pages"?

Those are marked as reserved on the memory map, and hence I would
expect them to never end up in iomem_resource.

Thanks, Roger.

