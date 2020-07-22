Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45322972F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 13:10:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyCdi-0007Pn-45; Wed, 22 Jul 2020 11:10:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhkO=BB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyCdh-0007Pf-7f
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 11:10:21 +0000
X-Inumbo-ID: ee096322-cc0b-11ea-a192-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee096322-cc0b-11ea-a192-12813bfff9fa;
 Wed, 22 Jul 2020 11:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595416220;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=r5qfBwq3dtkrKeJog+XoxKlp8SM9Zmz/NJM3CCWHS0Y=;
 b=cS6PRdB7j/jCTpN7AI/TRoBHvMjXrsoxnn7id58zF8fEzVq5Pk1Q3Uy8
 LKsIF6Q24x+aC8N3yhtLwfzOx7Dt7clcg7xLXJiniDaYE3ImAe1OtEgX7
 XauDmqwkLnrDbDzapdPBhCtRuDYIrybEberrQP6wckOYKXePUq9LK/V73 U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ZG31tbawB5/Eq/9daThEF2uzrwsb7VITyweO1+27mKyi/iZDQ9Y6YSjPn/1/N/iURG3cmoYYk4
 TAS1xw7iMwBvyiaXsCo72ZBFEcdTfr/gpmC7OtNCCta/hJ4I0uAnBHJSG4bQc9Q119kKFRFEyr
 7EdrxVbD8qgJEtrMyRLJ127SpHEWirl2nUbmCWgLQyG6E1mY0RBd+mbP4iamrb5n98eAn3D9dj
 z9h2AFcXEsPFErCPBBxFSPvHQElZw6d7rhrnIMhPWw07P92R2Sxl0UVIZnBVpM1sF8rvOcmQO6
 NbY=
X-SBRS: 2.7
X-MesageID: 23121989
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,381,1589256000"; d="scan'208";a="23121989"
Date: Wed, 22 Jul 2020 13:10:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
Message-ID: <20200722111012.GX7191@Air-de-Roger>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <3dcab37d-0d60-f1cc-1d59-b5497f0fa95f@xen.org>
 <b6cf0931-c31e-b03b-3995-688536de391a@gmail.com>
 <05acce61-5b29-76f7-5664-3438361caf82@xen.org>
 <20200722082115.GR7191@Air-de-Roger>
 <f3c54a7e-4352-7591-73c2-14215bd3ad34@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3c54a7e-4352-7591-73c2-14215bd3ad34@xen.org>
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
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr <olekstysh@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Artem
 Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 22, 2020 at 11:47:18AM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 22/07/2020 09:21, Roger Pau Monné wrote:
> > On Tue, Jul 21, 2020 at 10:12:40PM +0100, Julien Grall wrote:
> > > Hi Oleksandr,
> > > 
> > > On 21/07/2020 19:16, Oleksandr wrote:
> > > > 
> > > > On 21.07.20 17:27, Julien Grall wrote:
> > > > > On a similar topic, I am a bit surprised you didn't encounter memory
> > > > > exhaustion when trying to use virtio. Because on how Linux currently
> > > > > works (see XSA-300), the backend domain as to have a least as much
> > > > > RAM as the domain it serves. For instance, you have serve two
> > > > > domains with 1GB of RAM each, then your backend would need at least
> > > > > 2GB + some for its own purpose.
> > > > > 
> > > > > This probably wants to be resolved by allowing foreign mapping to be
> > > > > "paging" out as you would for memory assigned to a userspace.
> > > > 
> > > > Didn't notice the last sentence initially. Could you please explain your
> > > > idea in detail if possible. Does it mean if implemented it would be
> > > > feasible to map all guest memory regardless of how much memory the guest
> > > > has?
> > > > 
> > > > Avoiding map/unmap memory each guest request would allow us to have
> > > > better performance (of course with taking care of the fact that guest
> > > > memory layout could be changed)...
> > > 
> > > I will explain that below. Before let me comment on KVM first.
> > > 
> > > > Actually what I understand looking at kvmtool is the fact it does not
> > > > map/unmap memory dynamically, just calculate virt addresses according to
> > > > the gfn provided.
> > > 
> > > The memory management between KVM and Xen is quite different. In the case of
> > > KVM, the guest RAM is effectively memory from the userspace (allocated via
> > > mmap) and then shared with the guest.
> > > 
> > >  From the userspace PoV, the guest memory will always be accessible from the
> > > same virtual region. However, behind the scene, the pages may not always
> > > reside in memory. They are basically managed the same way as "normal"
> > > userspace memory.
> > > 
> > > In the case of Xen, we are basically stealing a guest physical page
> > > allocated via kmalloc() and provide no facilities for Linux to reclaim the
> > > page if it needs to do it before the userspace decide to unmap the foreign
> > > mapping.
> > > 
> > > I think it would be good to handle the foreing mapping the same way as
> > > userspace memory. By that I mean, that Linux could reclaim the physical page
> > > used by the foreing mapping if it needs to.
> > > 
> > > The process for reclaiming the page would look like:
> > >      1) Unmap the foreign page
> > >      2) Ballon in the backend domain physical address used by the foreing
> > > mapping (allocate the page in the physmap)
> > > 
> > > The next time the userspace is trying to access the foreign page, Linux will
> > > receive a data abort that would result to:
> > >      1) Allocate a backend domain physical page
> > >      2) Balloon out the physical address (remove the page from the physmap)
> > >      3) Map the foreing mapping at the new guest physical address
> > >      4) Map the guest physical page in the userspace address space
> > 
> > This is going to shatter all the super pages in the stage-2
> > translation.
> 
> Yes, but this is nothing really new as ballooning would result to (AFAICT)
> the same behavior on Linux.
> 
> > 
> > > With this approach, we should be able to have backend domain that can handle
> > > frontend domain without require a lot of memory.
> > 
> > Linux on x86 has the option to use empty hotplug memory ranges to map
> > foreign memory: the balloon driver hotplugs an unpopulated physical
> > memory range that's not made available to the OS free memory allocator
> > and it's just used as scratch space to map foreign memory. Not sure
> > whether Arm has something similar, or if it could be implemented.
> 
> We already discussed that last year :). This was attempted in the past (I
> was still at Citrix) and indefinitely paused for Arm.
> 
> /proc/iomem can be incomplete on Linux if we didn't load a driver for all
> the devices. This means that Linux doesn't have the full view of what is
> physical range is freed.
> 
> Additionally, in the case of Dom0, all the regions corresponding to the host
> RAM are unusable when using the SMMU. This is because we would do 1:1
> mapping for the foreign mapping as well.

Right, that's a PITA because on x86 PVH dom0 I was planning to use
those RAM regions as scratch space for foreign mapping lacking a
better alternative ATM.

> It might be possible to take advantage of the direct mapping property if
> Linux do some bookeeping. Although, this wouldn't work for 32-bit Dom0 using
> short page tables (e.g some version of Debian does) as it may not be able to
> access all the host RAM. Whether we still care about is a different
> situation :).
> 
> For all the other domains, I think we would want the toolstack to provide a
> region that can be safely used for foreign mapping (similar to what we
> already do for the grant-table).

Yes, that would be the plan on x86 also - have some way for the
hypervisor to report safe ranges where a domU can create foreign
mappings.

> > 
> > You can still use the map-on-fault behaviour as above, but I would
> > recommend that you try to limit the number of hypercalls issued.
> > Having to issue a single hypercall for each page fault it's going to
> > be slow, so I would instead use mmap batch to map the hole range in
> > unpopulated physical memory and then the OS fault handler just needs to
> > fill the page tables with the corresponding address.
> IIUC your proposal, you are assuming that you will have enough free space in
> the physical address space to map the foreign mapping.
> 
> However that amount of free space is not unlimited and may be quite small
> (see above). It would be fairly easy to exhaust it given that a userspace
> application can map many times the same guest physical address.
> 
> So I still think we need to be able to allow Linux to swap a foreign page
> with another page.

Right, but you will have to be careful to make sure physical addresses
are not swapped while being used for IO with devices, as in that case
you won't get a recoverable fault. This is safe now because physical
mappings created by privcmd are never swapped out, but if you go the
route you propose you will have to figure a way to correctly populate
physical ranges used for IO with devices, even when the CPU hasn't
accessed them.

Relying solely on CPU page faults to populate them will not be enough,
as the CPU won't necessarily access all the pages that would be send
to devices for IO.

Roger.

