Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 603F622AFF3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 15:09:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyaxm-00068s-J0; Thu, 23 Jul 2020 13:08:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0L1b=BC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyaxk-00068n-OD
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 13:08:40 +0000
X-Inumbo-ID: 9f8ce28e-cce5-11ea-a293-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f8ce28e-cce5-11ea-a293-12813bfff9fa;
 Thu, 23 Jul 2020 13:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595509718;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dXHSH9wbRdiIIVrdpu3/5eZAN762+wcXGXoVK0/kVTw=;
 b=I7R68eghWhEajjqpmWnOtxgQZoM9OwSc3LfXkA5467cMguYfD8E/jPTi
 O3nnY1ch2titxdfrlK/1d+wDfrXbin2H3YyATpqDZ+3z6BcPJe9SaKSOa
 BFnf1L3rDTSzi5fOGeQ2Wf/LsSgKJCWeSKT3q43F2d+Zr0v9JpZ8c0NBK Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: c1OsWBvLwJGdBIFnV7ENKa2QZlNdSh82WqwRMgsvuKPvhFpo8s2BP9yFpIzMwzmrLh1F/8swoZ
 NrSBwknuSpeGkYXCW5UWNYuhJU8cn0wmYFemgCYDsDgCReb6KpvhYi2bXcfZWWYgtFxE9Ixuvw
 u9IPUuf+bT+bpZ2TKC6xY9VT1lQpDIyTN64WgIb0KSU+YiyW5pIPd8v9ABo8y0wCjBDXZ82BsE
 MvH9H5V+C1VWlj2yILkGrJQv49MC+ckfofs7CZwF7xjTb5eCuU3E4AhWScvQVHySkwkSS5GKV4
 Oxk=
X-SBRS: 2.7
X-MesageID: 23230214
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,386,1589256000"; d="scan'208";a="23230214"
Date: Thu, 23 Jul 2020 15:08:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH 3/3] memory: introduce an option to force onlining of
 hotplug memory
Message-ID: <20200723130831.GE7191@Air-de-Roger>
References: <20200723084523.42109-1-roger.pau@citrix.com>
 <20200723084523.42109-4-roger.pau@citrix.com>
 <21490d49-b2cf-a398-0609-8010bdb0b004@redhat.com>
 <20200723122300.GD7191@Air-de-Roger>
 <404ea76f-c3d8-dbc5-432d-08d84a17f2d7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <404ea76f-c3d8-dbc5-432d-08d84a17f2d7@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 23, 2020 at 02:28:13PM +0200, Jürgen Groß wrote:
> On 23.07.20 14:23, Roger Pau Monné wrote:
> > On Thu, Jul 23, 2020 at 01:37:03PM +0200, David Hildenbrand wrote:
> > > On 23.07.20 10:45, Roger Pau Monne wrote:
> > > > Add an extra option to add_memory_resource that overrides the memory
> > > > hotplug online behavior in order to force onlining of memory from
> > > > add_memory_resource unconditionally.
> > > > 
> > > > This is required for the Xen balloon driver, that must run the
> > > > online page callback in order to correctly process the newly added
> > > > memory region, note this is an unpopulated region that is used by Linux
> > > > to either hotplug RAM or to map foreign pages from other domains, and
> > > > hence memory hotplug when running on Xen can be used even without the
> > > > user explicitly requesting it, as part of the normal operations of the
> > > > OS when attempting to map memory from a different domain.
> > > > 
> > > > Setting a different default value of memhp_default_online_type when
> > > > attaching the balloon driver is not a robust solution, as the user (or
> > > > distro init scripts) could still change it and thus break the Xen
> > > > balloon driver.
> > > 
> > > I think we discussed this a couple of times before (even triggered by my
> > > request), and this is responsibility of user space to configure. Usually
> > > distros have udev rules to online memory automatically. Especially, user
> > > space should eb able to configure *how* to online memory.
> > 
> > Note (as per the commit message) that in the specific case I'm
> > referring to the memory hotplugged by the Xen balloon driver will be
> > an unpopulated range to be used internally by certain Xen subsystems,
> > like the xen-blkback or the privcmd drivers. The addition of such
> > blocks of (unpopulated) memory can happen without the user explicitly
> > requesting it, and hence not even aware such hotplug process is taking
> > place. To be clear: no actual RAM will be added to the system.
> > 
> > Failure to online such blocks using the Xen specific online handler
> > (which does not handle back the memory to the allocator in any way)
> > will result in the system getting stuck and malfunctioning.
> > 
> > > It's the admin/distro responsibility to configure this properly. In case
> > > this doesn't happen (or as you say, users change it), bad luck.
> > > 
> > > E.g., virtio-mem takes care to not add more memory in case it is not
> > > getting onlined. I remember hyper-v has similar code to at least wait a
> > > bit for memory to get onlined.
> > 
> > I don't think VirtIO or Hyper-V use the hotplug system in the same way
> > as Xen, as said this is done to add unpopulated memory regions that
> > will be used to map foreign memory (from other domains) by Xen drivers
> > on the system.
> > 
> > Maybe this should somehow use a different mechanism to hotplug such
> > empty memory blocks? I don't mind doing this differently, but I would
> > need some pointers. Allowing user-space to change a (seemingly
> > unrelated) parameter and as a result produce failures on Xen drivers
> > is not an acceptable solution IMO.
> 
> Maybe we can use the same approach as Xen PV-domains: pre-allocate a
> region in the memory map to be used for mapping foreign pages. For the
> kernel it will look like pre-ballooned memory, so it will create struct
> page for the region (which is what we are after), but it won't give the
> memory to the allocator.

IMO using something similar to memory hotplug would give us more
flexibility, and TBH the logic is already there in the balloon driver.
It seems quite wasteful to allocate such region(s) beforehand for all
domains, even when most of them won't end up using foreign mappings at
all.

Anyway, I'm going to take a look at how to do that, I guess it's going
to involve playing with the memory map and reserving some space.

I suggest we should remove the Xen balloon hotplug logic, as it's not
working properly and we don't have a plan to fix it.

Thanks, Roger.

