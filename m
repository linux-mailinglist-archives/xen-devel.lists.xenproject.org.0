Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F8625D3D9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 10:42:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE7J0-0006vl-AE; Fri, 04 Sep 2020 08:42:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+qm=CN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kE7Iy-0006vg-Uc
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 08:42:45 +0000
X-Inumbo-ID: 1d3a705c-2eb9-4087-b891-a2ff9245adce
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d3a705c-2eb9-4087-b891-a2ff9245adce;
 Fri, 04 Sep 2020 08:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599208964;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xLTKJpKu0Qb9zvtBCrFuNtN0uryK+Cr91K+kobkwuTU=;
 b=bRJM5iiPIKl+tE2VIHsJnJCoF3CLsHcWlkd8qDNgtFzxxHq36BTnmssE
 g+ZmurFaC6LK1S6Jn/ZftPPuohgKe8TkPfIpOYgzWCS8Y5EvYSGwxQizo
 7Cyn+CrNeBnGLw4KFFC0drlB7nc0EVVCSNbmRZsW8XDeuB3VfajDnIics 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: h5tULVCP7TU027wl9AXL6ZQ6VRDTloWxNR1nakHosYYzU8awVMN14syMLQayv9uBc8sCFQrpo9
 MPsKynxlrUeIV2fLzkBXNB2LUVlnfaK5CMhGyHMRLQdBCX/4b+icfvHWVHnKE5oWjtKeDrh1Vt
 bxXRH4/LS58XLNlEMXW3QOoEhr480K9hH8A115xIrprTnfo3A9FB8sMcgG1DSn17YgpLbZzhqS
 8hNixQHRV8a/451xr8mSb/Ts/liLTz0NYAxGPT2Wdtw9MukJ2GIKcdJVYScDS0jHAxjENA9Gp1
 +EE=
X-SBRS: 2.7
X-MesageID: 26001821
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="26001821"
Date: Fri, 4 Sep 2020 10:42:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: <linux-kernel@vger.kernel.org>, Oleksandr Andrushchenko
 <oleksandr_andrushchenko@epam.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Dan Carpenter
 <dan.carpenter@oracle.com>, Wei Liu <wl@xen.org>, Yan Yankovskyi
 <yyankovskyi@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <xen-devel@lists.xenproject.org>, <linux-mm@kvack.org>, David Hildenbrand
 <david@redhat.com>, Michal Hocko <mhocko@kernel.org>, Dan Williams
 <dan.j.williams@intel.com>
Subject: Re: [PATCH v5 3/3] xen: add helpers to allocate unpopulated memory
Message-ID: <20200904084229.GN753@Air-de-Roger>
References: <20200901083326.21264-1-roger.pau@citrix.com>
 <20200901083326.21264-4-roger.pau@citrix.com>
 <b1713f26-8202-ac1e-c18a-4989312219b9@suse.com>
 <20200903163837.GM753@Air-de-Roger>
 <6fd73d30-5525-7f00-1e9c-d7bb96ea34a6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6fd73d30-5525-7f00-1e9c-d7bb96ea34a6@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

On Fri, Sep 04, 2020 at 09:00:18AM +0200, Jürgen Groß wrote:
> On 03.09.20 18:38, Roger Pau Monné wrote:
> > On Thu, Sep 03, 2020 at 05:30:07PM +0200, Jürgen Groß wrote:
> > > On 01.09.20 10:33, Roger Pau Monne wrote:
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
> > > > 
> > > > Note the driver is currently not enabled on Arm platforms because it
> > > > would interfere with the identity mapping required on some platforms.
> > > > 
> > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > 
> > > Sorry, I just got a build error for x86 32-bit build:
> > > 
> > > WARNING: unmet direct dependencies detected for ZONE_DEVICE
> > >    Depends on [n]: MEMORY_HOTPLUG [=n] && MEMORY_HOTREMOVE [=n] &&
> > > SPARSEMEM_VMEMMAP [=n] && ARCH_HAS_PTE_DEVMAP [=n]
> > >    Selected by [y]:
> > >    - XEN_UNPOPULATED_ALLOC [=y] && XEN [=y] && X86 [=y]
> > >    GEN     Makefile
> > >    CC      kernel/bounds.s
> > >    CALL    /home/gross/korg/src/scripts/atomic/check-atomics.sh
> > >    UPD     include/generated/bounds.h
> > >    CC      arch/x86/kernel/asm-offsets.s
> > > In file included from /home/gross/korg/src/include/linux/mmzone.h:19:0,
> > >                   from /home/gross/korg/src/include/linux/gfp.h:6,
> > >                   from /home/gross/korg/src/include/linux/slab.h:15,
> > >                   from /home/gross/korg/src/include/linux/crypto.h:19,
> > >                   from /home/gross/korg/src/arch/x86/kernel/asm-offsets.c:9:
> > > /home/gross/korg/src/include/linux/page-flags-layout.h:95:2: error: #error
> > > "Not enough bits in page flags"
> > >   #error "Not enough bits in page flags"
> > >    ^~~~~
> > > make[2]: *** [/home/gross/korg/src/scripts/Makefile.build:114:
> > > arch/x86/kernel/asm-offsets.s] Error 1
> > > make[1]: *** [/home/gross/korg/src/Makefile:1175: prepare0] Error 2
> > > make[1]: Leaving directory '/home/gross/korg/x8632'
> > > make: *** [Makefile:185: __sub-make] Error 2
> > 
> > Sorry for this. I've tested a 32bit build but I think it was before
> > the last Kconfig changes. I'm a little unsure how to solve this, as
> > ZONE_DEVICE doesn't select the required options for it to run, but
> > rather depends on them to be available.
> > 
> > You can trigger something similar on x86-64 by doing:
> > 
> > $ make ARCH=x86_64 xen.config
> > Using .config as base
> > Merging ./kernel/configs/xen.config
> > Merging ./arch/x86/configs/xen.config
> > #
> > # merged configuration written to .config (needs make)
> > #
> > scripts/kconfig/conf  --olddefconfig Kconfig
> > 
> > WARNING: unmet direct dependencies detected for ZONE_DEVICE
> >    Depends on [n]: MEMORY_HOTPLUG [=y] && MEMORY_HOTREMOVE [=n] && SPARSEMEM_VMEMMAP [=y] && ARCH_HAS_PTE_DEVMAP [=y]
> >    Selected by [y]:
> >    - XEN_UNPOPULATED_ALLOC [=y] && XEN [=y] && X86_64 [=y]
> > #
> > # configuration written to .config
> > #
> > 
> > I think the only solution is to have XEN_UNPOPULATED_ALLOC depend on
> > ZONE_DEVICE rather than select it?
> 
> Yes, I think so.
> 
> I've folded that in and now build is fine.

Thanks, I assume no further action is needed on my side.

Roger.

