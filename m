Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ECC22B0E0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 15:59:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jybl5-0003LF-H0; Thu, 23 Jul 2020 13:59:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0L1b=BC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jybl4-0003LA-LS
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 13:59:38 +0000
X-Inumbo-ID: be96f5d2-ccec-11ea-871b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be96f5d2-ccec-11ea-871b-bc764e2007e4;
 Thu, 23 Jul 2020 13:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595512777;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=G5fMAF6Ssv/d5LldYw6d7YvCx0QLDX1OATdOT3g5954=;
 b=g6B56hVetjZwz0rUwOnELoe7THEtXKxWmQr6PRIqCds0lPHmPPJkH3E1
 Jxmy0nsjd8IAIISHnlB7pTpAYHiCLPEadkrnRlQDVmG1GNc5jKHEge4KM
 zupGHaoEF2TrquZl5glBdpX81nYHDAA9UIOz4LTEzPoA/76riOToDDik7 c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: FzLhbB64z51wD52/8mlF2q7KYHAB/SzggPhRBoNTO3bKquEZzRNlMWzeg+d6qkIRFXnEM8wCQn
 I8ZVldIoD7vjg1o4XWJv7lCKqcDmh4ey62417HFSjfrORAmoH7KO8ql4RRRNqD26tBGpEgh4Xm
 4qZ++TwHeTlgHbCc8HsVqPpbmG9+/D0m9Kz4xeXkCr+8ClNSrV9FP3Ohl3Yq8LTJWxBVc/e4yw
 KbHE+hEoCTrkPnGZ+OPXceMgdwvBw289PxG1Fn18sfFFMuj4f/MmLdi1R8gVDd0k7mTOFAYSLz
 XCc=
X-SBRS: 2.7
X-MesageID: 23370256
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,386,1589256000"; d="scan'208";a="23370256"
Date: Thu, 23 Jul 2020 15:59:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 3/3] memory: introduce an option to force onlining of
 hotplug memory
Message-ID: <20200723135930.GH7191@Air-de-Roger>
References: <20200723084523.42109-1-roger.pau@citrix.com>
 <20200723084523.42109-4-roger.pau@citrix.com>
 <21490d49-b2cf-a398-0609-8010bdb0b004@redhat.com>
 <20200723122300.GD7191@Air-de-Roger>
 <e94d9556-f615-bbe2-07d2-08958969ee5f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e94d9556-f615-bbe2-07d2-08958969ee5f@redhat.com>
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
 Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 23, 2020 at 03:22:49PM +0200, David Hildenbrand wrote:
> On 23.07.20 14:23, Roger Pau Monné wrote:
> > On Thu, Jul 23, 2020 at 01:37:03PM +0200, David Hildenbrand wrote:
> >> On 23.07.20 10:45, Roger Pau Monne wrote:
> >>> Add an extra option to add_memory_resource that overrides the memory
> >>> hotplug online behavior in order to force onlining of memory from
> >>> add_memory_resource unconditionally.
> >>>
> >>> This is required for the Xen balloon driver, that must run the
> >>> online page callback in order to correctly process the newly added
> >>> memory region, note this is an unpopulated region that is used by Linux
> >>> to either hotplug RAM or to map foreign pages from other domains, and
> >>> hence memory hotplug when running on Xen can be used even without the
> >>> user explicitly requesting it, as part of the normal operations of the
> >>> OS when attempting to map memory from a different domain.
> >>>
> >>> Setting a different default value of memhp_default_online_type when
> >>> attaching the balloon driver is not a robust solution, as the user (or
> >>> distro init scripts) could still change it and thus break the Xen
> >>> balloon driver.
> >>
> >> I think we discussed this a couple of times before (even triggered by my
> >> request), and this is responsibility of user space to configure. Usually
> >> distros have udev rules to online memory automatically. Especially, user
> >> space should eb able to configure *how* to online memory.
> > 
> > Note (as per the commit message) that in the specific case I'm
> > referring to the memory hotplugged by the Xen balloon driver will be
> > an unpopulated range to be used internally by certain Xen subsystems,
> > like the xen-blkback or the privcmd drivers. The addition of such
> > blocks of (unpopulated) memory can happen without the user explicitly
> > requesting it, and hence not even aware such hotplug process is taking
> > place. To be clear: no actual RAM will be added to the system.
> 
> Okay, but there is also the case where XEN will actually hotplug memory
> using this same handler IIRC (at least I've read papers about it). Both
> are using the same handler, correct?

Yes, it's used by this dual purpose, which I have to admit I don't
like that much either.

One set of pages should be clearly used for RAM memory hotplug, and
the other to map foreign pages that are not related to memory hotplug,
it's just that we happen to need a physical region with backing struct
pages.

> > 
> >> It's the admin/distro responsibility to configure this properly. In case
> >> this doesn't happen (or as you say, users change it), bad luck.
> >>
> >> E.g., virtio-mem takes care to not add more memory in case it is not
> >> getting onlined. I remember hyper-v has similar code to at least wait a
> >> bit for memory to get onlined.
> > 
> > I don't think VirtIO or Hyper-V use the hotplug system in the same way
> > as Xen, as said this is done to add unpopulated memory regions that
> > will be used to map foreign memory (from other domains) by Xen drivers
> > on the system.
> 
> Indeed, if the memory is never exposed to the buddy (and all you need is
> struct pages +  a kernel virtual mapping), I wonder if
> memremap/ZONE_DEVICE is what you want?

I'm certainly not familiar with the Linux memory subsystem, but if
that gets us a backing struct page and a kernel mapping then I would
say yes.

> Then you won't have user-visible
> memory blocks created with unclear online semantics, partially involving
> the buddy.

Seems like a fine solution.

Juergen: would you be OK to use a separate page-list for
alloc_xenballooned_pages on HVM/PVH using the logic described by
David?

I guess I would leave PV as-is, since it already has this reserved
region to map foreign pages.

Thanks, Roger.

