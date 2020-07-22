Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC5E229358
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 10:22:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyA0J-0007go-84; Wed, 22 Jul 2020 08:21:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhkO=BB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyA0I-0007gj-3E
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 08:21:30 +0000
X-Inumbo-ID: 55cc478a-cbf4-11ea-8620-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55cc478a-cbf4-11ea-8620-bc764e2007e4;
 Wed, 22 Jul 2020 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595406089;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iI4sRVjlvh9gEQqxjsfWwqL+VLacm6rDZcDKOJBuX1Y=;
 b=RqGfSa5Lkp203CVAGlS9SK8Xe96DiJhflFa5lLi7oYEGgbKAC+j6WSvT
 ueTH3zSWHvoD0jhLPwYiIhWtJ1ThlKfYCBQFxWan/+G+6MZPOMHZV1hz2
 h41fvdvYk94tC6wWXDEaTo7XqFW+B4uc4OF8t7jt6azQYmUeIvrJ4dGU5 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: eT357Zb1Z/BIKmkwgYYRc7oFLXkcrCBm+9MIOhkUi2JgLVSxLhGhwpsHfhtEOlqTubOtqbM2b3
 dY2SM1MdM6S0oANXeDKPsh3gJ0K6t+ASIM/k05660uLtn4n4IpNPl07TPvp4A+/JJwQGAifF9P
 w2euzvW5GqLAiV9jI92H3JEY2DOf44P1CsGNXyZQS/tBTJfaF9jxaIvQwZBdH3Btj+CtSE6xqF
 C1idOf4v2f7rUXAAUcnfm7M4V7AC6/Zxj1A6m8h8dXsz6NfBF/sVAjwjh51C9RLX9mZuhls1U6
 o6g=
X-SBRS: 2.7
X-MesageID: 22915674
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,381,1589256000"; d="scan'208";a="22915674"
Date: Wed, 22 Jul 2020 10:21:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
Message-ID: <20200722082115.GR7191@Air-de-Roger>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <3dcab37d-0d60-f1cc-1d59-b5497f0fa95f@xen.org>
 <b6cf0931-c31e-b03b-3995-688536de391a@gmail.com>
 <05acce61-5b29-76f7-5664-3438361caf82@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <05acce61-5b29-76f7-5664-3438361caf82@xen.org>
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

On Tue, Jul 21, 2020 at 10:12:40PM +0100, Julien Grall wrote:
> Hi Oleksandr,
> 
> On 21/07/2020 19:16, Oleksandr wrote:
> > 
> > On 21.07.20 17:27, Julien Grall wrote:
> > > On a similar topic, I am a bit surprised you didn't encounter memory
> > > exhaustion when trying to use virtio. Because on how Linux currently
> > > works (see XSA-300), the backend domain as to have a least as much
> > > RAM as the domain it serves. For instance, you have serve two
> > > domains with 1GB of RAM each, then your backend would need at least
> > > 2GB + some for its own purpose.
> > > 
> > > This probably wants to be resolved by allowing foreign mapping to be
> > > "paging" out as you would for memory assigned to a userspace.
> > 
> > Didn't notice the last sentence initially. Could you please explain your
> > idea in detail if possible. Does it mean if implemented it would be
> > feasible to map all guest memory regardless of how much memory the guest
> > has?
> >
> > Avoiding map/unmap memory each guest request would allow us to have
> > better performance (of course with taking care of the fact that guest
> > memory layout could be changed)...
> 
> I will explain that below. Before let me comment on KVM first.
> 
> > Actually what I understand looking at kvmtool is the fact it does not
> > map/unmap memory dynamically, just calculate virt addresses according to
> > the gfn provided.
> 
> The memory management between KVM and Xen is quite different. In the case of
> KVM, the guest RAM is effectively memory from the userspace (allocated via
> mmap) and then shared with the guest.
> 
> From the userspace PoV, the guest memory will always be accessible from the
> same virtual region. However, behind the scene, the pages may not always
> reside in memory. They are basically managed the same way as "normal"
> userspace memory.
> 
> In the case of Xen, we are basically stealing a guest physical page
> allocated via kmalloc() and provide no facilities for Linux to reclaim the
> page if it needs to do it before the userspace decide to unmap the foreign
> mapping.
> 
> I think it would be good to handle the foreing mapping the same way as
> userspace memory. By that I mean, that Linux could reclaim the physical page
> used by the foreing mapping if it needs to.
> 
> The process for reclaiming the page would look like:
>     1) Unmap the foreign page
>     2) Ballon in the backend domain physical address used by the foreing
> mapping (allocate the page in the physmap)
> 
> The next time the userspace is trying to access the foreign page, Linux will
> receive a data abort that would result to:
>     1) Allocate a backend domain physical page
>     2) Balloon out the physical address (remove the page from the physmap)
>     3) Map the foreing mapping at the new guest physical address
>     4) Map the guest physical page in the userspace address space

This is going to shatter all the super pages in the stage-2
translation.

> With this approach, we should be able to have backend domain that can handle
> frontend domain without require a lot of memory.

Linux on x86 has the option to use empty hotplug memory ranges to map
foreign memory: the balloon driver hotplugs an unpopulated physical
memory range that's not made available to the OS free memory allocator
and it's just used as scratch space to map foreign memory. Not sure
whether Arm has something similar, or if it could be implemented.

You can still use the map-on-fault behaviour as above, but I would
recommend that you try to limit the number of hypercalls issued.
Having to issue a single hypercall for each page fault it's going to
be slow, so I would instead use mmap batch to map the hole range in
unpopulated physical memory and then the OS fault handler just needs to
fill the page tables with the corresponding address.

Roger.

